/* ── OTA API Client ─────────────────────────────────────────── */

import ky from 'ky';
import { getApiCheckUrl, buildPayload } from './endpoints';
import { parseCheckResponse, classifyCarrierStatus } from './response';
import type { CheckResponse, Carrier, ScanResult } from '@/lib/types';

const MAX_RETRIES = 2;
const RETRY_DELAY_MS = 1000;

const sleep = (ms: number) => new Promise((r) => setTimeout(r, ms));

/* ── Request/Response log for debugging ─────────────────────── */
export interface RequestLog {
  method: string;
  url: string;
  body: Record<string, unknown>;
  responseStatus: number | null;
  responseHeaders: Record<string, string>;
  responseBody: string;
  error: string | null;
  durationMs: number;
}

let _lastRequestLog: RequestLog | null = null;
export function getLastRequestLog(): RequestLog | null {
  return _lastRequestLog;
}

/**
 * POST to the same-origin /api/check endpoint.
 *
 * The Cloudflare Worker receives this request and forwards it
 * to the CDS server with the correct Android app headers.
 * No CORS proxy needed — it's the same origin.
 */
async function postApiCheck(
  host: string,
  context: string,
  guid: string,
  payload: Record<string, unknown>,
  timeout = 30000,
): Promise<{ data: Record<string, unknown>; headers: Record<string, string> }> {
  const apiUrl = getApiCheckUrl();
  const requestBody = { host, context, guid, payload };
  const log: RequestLog = {
    method: 'POST',
    url: apiUrl,
    body: requestBody,
    responseStatus: null,
    responseHeaders: {},
    responseBody: '',
    error: null,
    durationMs: 0,
  };
  const start = performance.now();

  try {
    const response = await ky.post(apiUrl, {
      json: requestBody,
      timeout,
      retry: 0,
    });

    log.responseStatus = response.status;
    response.headers.forEach((value, key) => {
      log.responseHeaders[key] = value;
    });

    const text = await response.text();
    log.responseBody = text;
    log.durationMs = Math.round(performance.now() - start);
    _lastRequestLog = log;

    if (!text.trim()) {
      throw new Error(`Empty response from server (HTTP ${response.status})`);
    }

    if (text.trim().startsWith('<')) {
      throw new Error(
        `Server returned HTML instead of JSON (HTTP ${response.status}). ` +
        `This usually means the Worker is not deployed correctly.`,
      );
    }

    let data: Record<string, unknown>;
    try {
      data = JSON.parse(text);
    } catch {
      throw new Error(
        `Invalid JSON response (HTTP ${response.status}). ` +
        `First 200 chars: ${text.slice(0, 200)}`,
      );
    }

    if (data.error) {
      const errMsg = typeof data.error === 'string'
        ? data.error
        : typeof data.error === 'object' && data.error !== null && 'message' in (data.error as Record<string, unknown>)
          ? String((data.error as Record<string, unknown>).message)
          : JSON.stringify(data.error);
      throw new Error(`Server error: ${errMsg}`);
    }

    const headers: Record<string, string> = {};
    response.headers.forEach((value, key) => {
      headers[key] = value;
    });
    return { data, headers };
  } catch (err) {
    log.durationMs = Math.round(performance.now() - start);
    log.error = err instanceof Error ? err.message : String(err);
    _lastRequestLog = log;
    throw err;
  }
}

export async function checkUpdate(
  guid: string,
  carrier: string,
  options: { host?: string; context?: string; timeout?: number } = {},
): Promise<CheckResponse> {
  const host = options.host || 'moto-cds.appspot.com';
  const context = options.context || 'ota';
  const payload = buildPayload(carrier, guid);
  const timeout = (options.timeout || 30) * 1000;

  let lastError: unknown;
  for (let attempt = 0; attempt < MAX_RETRIES; attempt++) {
    try {
      const { data, headers } = await postApiCheck(
        host,
        context,
        guid,
        payload as unknown as Record<string, unknown>,
        timeout,
      );
      return parseCheckResponse(data, headers);
    } catch (err) {
      lastError = err;
      if (attempt < MAX_RETRIES - 1) await sleep(RETRY_DELAY_MS * (attempt + 1));
    }
  }
  throw lastError;
}

export async function walkChain(
  guid: string,
  carrier: string,
  options: { host?: string; context?: string; maxSteps?: number; timeout?: number } = {},
): Promise<CheckResponse[]> {
  const maxSteps = options.maxSteps || 50;
  const chain: CheckResponse[] = [];
  let currentGuid = guid;

  for (let i = 0; i < maxSteps; i++) {
    const response = await checkUpdate(currentGuid, carrier, options);
    if (!response.hasUpdate || !response.content) break;
    chain.push(response);
    const nextGuid = response.content.targetGuid;
    if (!nextGuid || nextGuid === currentGuid) break;
    currentGuid = nextGuid;
  }
  return chain;
}

export async function scanCarriers(
  guid: string,
  carriers: Carrier[],
  options: {
    host?: string;
    context?: string;
    concurrency?: number;
    walkOpenChains?: boolean;
    onProgress?: (completed: number, total: number, result: ScanResult) => void;
    onChainProgress?: (carrierCode: string, chain: CheckResponse[]) => void;
  } = {},
): Promise<ScanResult[]> {
  const { concurrency = 20, walkOpenChains = false, onProgress, onChainProgress } = options;
  const results: ScanResult[] = [];
  let completed = 0;

  for (let i = 0; i < carriers.length; i += concurrency) {
    const batch = carriers.slice(i, i + concurrency);
    const batchResults = await Promise.allSettled(
      batch.map(async (carrier): Promise<ScanResult> => {
        try {
          const response = await checkUpdate(guid, carrier.code, options);
          return { carrier, response, status: classifyCarrierStatus(response), error: null };
        } catch (err) {
          const message = err instanceof Error ? err.message : 'Unknown error';
          return { carrier, response: null, status: 'error', error: message };
        }
      }),
    );

    for (let j = 0; j < batchResults.length; j++) {
      completed++;
      const result = batchResults[j];
      const value: ScanResult =
        result.status === 'fulfilled'
          ? result.value
          : { carrier: batch[j], response: null, status: 'error', error: 'Unknown error' };
      results.push(value);
      onProgress?.(completed, carriers.length, value);
    }
  }

  // Walk update chains for open carriers (sequentially to avoid rate limiting)
  if (walkOpenChains) {
    const openResults = results.filter((r) => r.status === 'open');
    for (const result of openResults) {
      try {
        const chain = await walkChain(guid, result.carrier.code, options);
        result.chain = chain;
        onChainProgress?.(result.carrier.code, chain);
      } catch {
        // Chain walk failure is non-critical; leave chain undefined
      }
    }
  }

  return results;
}

export { parseCheckResponse, classifyCarrierStatus };
