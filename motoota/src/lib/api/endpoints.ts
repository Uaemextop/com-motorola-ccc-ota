/* ── API Endpoints & Constants ──────────────────────────────── */

import type { CheckPayload } from '@/lib/types';

/**
 * Primary CORS proxy — the Cloudflare Worker deployed from this repo.
 * See /motoota/worker/cors-proxy.js for the source.
 */
export const WORKER_PROXY = 'https://com-motorola-ccc-ota.ealvarado2677.workers.dev';

/**
 * Fallback public CORS proxies — tried after the worker proxy fails.
 */
export const FALLBACK_CORS_PROXIES: readonly string[] = [
  'https://corsproxy.io/?',
];

/**
 * HTTP headers that mirror the real com.motorola.ccc.ota Android app.
 *
 * Verified against Python moto_ota (AppConfig.headers):
 *   Content-Type:     application/json; charset=utf-8
 *   User-Agent:       com.motorola.ccc.ota
 *   Accept-Encoding:  gzip
 *   Connection:       Keep-Alive
 */
export const DEFAULT_HEADERS: Record<string, string> = {
  'Content-Type': 'application/json; charset=utf-8',
  'User-Agent': 'com.motorola.ccc.ota',
  'Accept-Encoding': 'gzip',
  'Connection': 'Keep-Alive',
};

/**
 * Build the CDS /check endpoint URL.
 *
 * Python equivalent (servers.py Server.check_url):
 *   https://{host}/cds/upgrade/1/check/ctx/{context}/key/{guid}
 */
export function buildCheckURL(host: string, context: string, guid: string): string {
  return `https://${host}/cds/upgrade/1/check/ctx/${context}/key/${guid}`;
}

/**
 * Build the minimal JSON payload that the CDS server accepts.
 *
 * Python equivalent (request.py build_check_payload):
 *   Only 4 fields affect server routing:
 *     extraInfo.carrier       — selects the firmware chain
 *     extraInfo.otaSourceSha1 — device GUID
 *     extraInfo.vitalUpdate   — must be false
 *     triggeredBy             — must be "user"
 */
export function buildPayload(
  carrier: string,
  guid: string,
  options: { region?: string; triggeredBy?: string; serial?: string } = {},
): CheckPayload {
  return {
    id: options.serial || 'x',
    deviceInfo: { country: '', region: options.region || 'US' },
    extraInfo: {
      carrier,
      vitalUpdate: false,
      otaSourceSha1: guid,
    },
    triggeredBy: options.triggeredBy || 'user',
  };
}

/**
 * Build ordered list of proxy URLs to try for a target.
 * 1. Custom proxy (user-configured in Settings)
 * 2. Cloudflare Worker proxy (deployed from this repo)
 * 3. Fallback public proxies
 */
export function buildProxyAttempts(
  targetUrl: string,
  customProxy?: string,
): string[] {
  const attempts: string[] = [];

  // 1. Custom user-configured proxy
  if (customProxy) {
    const trimmed = customProxy.replace(/\/+$/, '');
    attempts.push(`${trimmed}?url=${encodeURIComponent(targetUrl)}`);
  }

  // 2. Cloudflare Worker (primary)
  attempts.push(`${WORKER_PROXY}?url=${encodeURIComponent(targetUrl)}`);

  // 3. Public fallbacks
  for (const proxy of FALLBACK_CORS_PROXIES) {
    attempts.push(proxy + encodeURIComponent(targetUrl));
  }

  return attempts;
}
