/* ── API Endpoints & Constants ──────────────────────────────── */

import type { CheckPayload } from '@/lib/types';

/**
 * Public CORS proxies — tried in order after the custom proxy (if set).
 */
export const DEFAULT_CORS_PROXIES: readonly string[] = [
  'https://corsproxy.io/?',
  'https://api.allorigins.win/raw?url=',
];

export const DEFAULT_HEADERS: Record<string, string> = {
  'Content-Type': 'application/json; charset=utf-8',
  'User-Agent': 'com.motorola.ccc.ota',
  'Accept-Encoding': 'gzip',
  'Connection': 'Keep-Alive',
};

export function buildCheckURL(host: string, context: string, guid: string): string {
  return `https://${host}/cds/upgrade/1/check/ctx/${context}/key/${guid}`;
}

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
 * Custom worker proxy (if configured) is tried first.
 */
export function buildProxyAttempts(
  targetUrl: string,
  customProxy?: string,
): string[] {
  const attempts: string[] = [];

  if (customProxy) {
    const trimmed = customProxy.replace(/\/+$/, '');
    attempts.push(`${trimmed}?url=${encodeURIComponent(targetUrl)}`);
  }

  for (const proxy of DEFAULT_CORS_PROXIES) {
    attempts.push(proxy + encodeURIComponent(targetUrl));
  }

  return attempts;
}
