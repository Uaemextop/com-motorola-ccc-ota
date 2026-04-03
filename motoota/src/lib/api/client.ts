/* ── OTA API Client ─────────────────────────────────────────── */

import ky from 'ky';
import { DEFAULT_HEADERS, buildCheckURL, buildPayload, buildProxyAttempts } from './endpoints';
import { parseCheckResponse, classifyCarrierStatus } from './response';
import type { CheckResponse, Carrier, ScanResult } from '@/lib/types';

const MAX_RETRIES = 2;
const RETRY_DELAY_MS = 1000;

const sleep = (ms: number) => new Promise((r) => setTimeout(r, ms));

/* ── Request/Response log for debugging ─────────────────────── */
export interface RequestLog {
  method: string;
  targetUrl: string;
  proxyUrl: string;
  headers: Record<string, string>;
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
 * POST a JSON payload through a CORS proxy to the CDS server.
 *
 * Tries each proxy in order (custom → Cloudflare Worker → fallbacks).
 * Reads response as text first to detect HTML/empty responses before parsing JSON.
 */
async function postWithProxy(
  url: string,
  payload: Record<string, unknown>,
  timeout = 30000,
  customProxy?: string,
): Promise<{ data: Record<string, unknown>; headers: Record<string, string> }> {
  const attempts = buildProxyAttempts(url, customProxy);
  let lastError: unknown;

  for (const attemptUrl of attempts) {
    const log: RequestLog = {
      method: 'POST',
      targetUrl: url,
      proxyUrl: attemptUrl,
      headers: { ...DEFAULT_HEADERS },
      body: payload,
      responseStatus: null,
      responseHeaders: {},
      responseBody: '',
      error: null,
      durationMs: 0,
    };
    const start = performance.now();

    try {
      const response = await ky.post(attemptUrl, {
        json: payload,
        headers: DEFAULT_HEADERS,
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

      // Detect empty responses
      if (!text.trim()) {
        throw new Error(
          `Proxy returned empty response (HTTP ${response.status}). ` +
          `The CORS proxy may be blocking the request.`,
        );
      }

      // Detect HTML responses (Cloudflare challenge, error pages, etc.)
      if (text.trim().startsWith('<')) {
        throw new Error(
          `Proxy returned HTML instead of JSON (HTTP ${response.status}). ` +
          `This usually means the proxy is showing a challenge page.`,
        );
      }

      // Parse JSON safely
      let data: Record<string, unknown>;
      try {
        data = JSON.parse(text);
      } catch {
        throw new Error(
          `Invalid JSON from proxy (HTTP ${response.status}). ` +
          `First 200 chars: ${text.slice(0, 200)}`,
        );
      }

      // Check if the proxy returned its own error envelope
      if (data.error && typeof data.error === 'string') {
        throw new Error(`Proxy error: ${data.error}`);
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
      lastError = err;
    }
  }

  throw lastError instanceof Error
    ? lastError
    : new Error('All CORS proxies failed. Configure a custom proxy in Settings.');
}

export async function checkUpdate(
  guid: string,
  carrier: string,
  options: { host?: string; context?: string; timeout?: number; customProxy?: string } = {},
): Promise<CheckResponse> {
  const host = options.host || 'moto-cds.appspot.com';
  const context = options.context || 'ota';
  const url = buildCheckURL(host, context, guid);
  const payload = buildPayload(carrier, guid);
  const timeout = (options.timeout || 30) * 1000;

  let lastError: unknown;
  for (let attempt = 0; attempt < MAX_RETRIES; attempt++) {
    try {
      const { data, headers } = await postWithProxy(
        url,
        payload as unknown as Record<string, unknown>,
        timeout,
        options.customProxy,
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
  options: { host?: string; context?: string; maxSteps?: number; timeout?: number; customProxy?: string } = {},
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
    customProxy?: string;
    onProgress?: (completed: number, total: number, result: ScanResult) => void;
  } = {},
): Promise<ScanResult[]> {
  const { concurrency = 20, onProgress } = options;
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
  return results;
}

export { parseCheckResponse, classifyCarrierStatus };
