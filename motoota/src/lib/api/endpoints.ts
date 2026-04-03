/* ── API Endpoints & Constants ──────────────────────────────── */

import type { CheckPayload } from '@/lib/types';

/**
 * Cloudflare Worker domain where the /api/check handler lives.
 * When the app runs on this same domain (Workers deployment), requests are same-origin.
 * When running elsewhere (GitHub Pages), requests go cross-origin with CORS.
 */
const WORKER_ORIGIN = 'https://motoota.echosmart.me';

/**
 * Resolve the API check endpoint URL.
 * - Same origin (Cloudflare Workers): uses relative `/api/check`
 * - Different origin (GitHub Pages / dev): uses absolute Worker URL
 */
export function getApiCheckUrl(): string {
  if (typeof window !== 'undefined' && window.location.origin === WORKER_ORIGIN) {
    return '/api/check';
  }
  return `${WORKER_ORIGIN}/api/check`;
}

/**
 * HTTP headers that mirror the real com.motorola.ccc.ota Android app.
 * These are sent by the Worker to the CDS server (not by the browser).
 * Shown in the UI for reference only.
 */
export const DEFAULT_HEADERS: Record<string, string> = {
  'Content-Type': 'application/json; charset=utf-8',
  'User-Agent': 'com.motorola.ccc.ota',
  'Accept-Encoding': 'gzip',
  'Connection': 'Keep-Alive',
};

/**
 * Build the CDS /check endpoint URL (for display purposes).
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
