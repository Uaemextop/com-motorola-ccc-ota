/* ── OTA API Client ─────────────────────────────────────────── */

import ky from 'ky';
import { CORS_PROXIES, DEFAULT_HEADERS, buildCheckURL, buildPayload } from './endpoints';
import { parseCheckResponse, classifyCarrierStatus } from './response';
import type { CheckResponse, Carrier, ScanResult } from '@/lib/types';

const MAX_RETRIES = 3;
const RETRY_DELAY_MS = 1000;

const sleep = (ms: number) => new Promise((r) => setTimeout(r, ms));

async function postWithProxy(
  url: string,
  payload: Record<string, unknown>,
  timeout = 30000,
): Promise<{ data: Record<string, unknown>; headers: Record<string, string> }> {
  const attempts = [url, ...CORS_PROXIES.map((p) => p + encodeURIComponent(url))];
  let lastError: unknown;

  for (const attemptUrl of attempts) {
    try {
      const response = await ky.post(attemptUrl, {
        json: payload,
        headers: DEFAULT_HEADERS,
        timeout,
      });
      const data = (await response.json()) as Record<string, unknown>;
      const headers: Record<string, string> = {};
      response.headers.forEach((value, key) => {
        headers[key] = value;
      });
      return { data, headers };
    } catch (err) {
      lastError = err;
    }
  }
  throw lastError;
}

export async function checkUpdate(
  guid: string,
  carrier: string,
  options: { host?: string; context?: string; timeout?: number } = {},
): Promise<CheckResponse> {
  const host = options.host || 'moto-cds.appspot.com';
  const context = options.context || 'ota';
  const url = buildCheckURL(host, context, guid);
  const payload = buildPayload(carrier, guid);
  const timeout = (options.timeout || 30) * 1000;

  let lastError: unknown;
  for (let attempt = 0; attempt < MAX_RETRIES; attempt++) {
    try {
      const { data, headers } = await postWithProxy(url, payload, timeout);
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
