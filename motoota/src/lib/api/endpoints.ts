/* ── API Endpoints & Constants ──────────────────────────────── */

import type { CheckPayload } from '@/lib/types';

export const CORS_PROXIES = [
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
