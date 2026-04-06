/* ── Lenovo Software Fix API Client ──────────────────────────── */

import type {
  LenovoModel,
  LenovoFirmwareResource,
} from '@/lib/types';

/**
 * LSA API configuration — mirrors the LMSA v7.5.4.2 Windows client
 * headers as observed in the HAR capture.
 */
const LSA_BASE = 'https://lsa.lenovo.com';
const CLIENT_VERSION = '7.5.4.2';
const WINDOWS_INFO = 'Microsoft Windows 11 Pro, x64-based PC';
const DEFAULT_LANGUAGE = 'en-US';

const LSA_HEADERS: Record<string, string> = {
  'Content-Type': 'application/json',
  'Request-Tag': 'lmsa',
  'clientVersion': CLIENT_VERSION,
  'Cache-Control': 'no-store,no-cache',
  'Pragma': 'no-cache',
};

interface LSAResponse<T = unknown> {
  code: string;
  desc: string;
  content: T;
}

interface ModelsContent {
  models: LenovoModel[];
}

/**
 * Build the standard LSA request body.
 */
function buildBody(
  dparams: Record<string, unknown> | null = null,
  guid?: string,
): Record<string, unknown> {
  const body: Record<string, unknown> = {
    client: { version: CLIENT_VERSION },
    dparams,
    language: DEFAULT_LANGUAGE,
    windowsInfo: WINDOWS_INFO,
  };

  return body;
}

/**
 * POST to an LSA API endpoint.
 *
 * Note: The LSA server (lsa.lenovo.com) requires specific headers
 * and does not support CORS from browsers. In a web context, requests
 * must go through a server-side proxy (the Cloudflare Worker or the
 * Python backend). For the frontend, we provide the endpoint builder
 * and let the Worker proxy handle the actual request.
 */
async function lsaPost<T>(
  endpoint: string,
  body: Record<string, unknown>,
  options?: {
    bearerToken?: string;
    guid?: string;
    signal?: AbortSignal;
  },
): Promise<LSAResponse<T>> {
  const headers: Record<string, string> = { ...LSA_HEADERS };

  if (options?.guid) {
    headers['guid'] = options.guid;
  }
  if (options?.bearerToken) {
    headers['Authorization'] = `Bearer ${options.bearerToken}`;
  }

  // Use Worker proxy for cross-origin requests
  const url = `/api/lenovo${endpoint}`;

  const resp = await fetch(url, {
    method: 'POST',
    headers,
    body: JSON.stringify({
      targetUrl: `${LSA_BASE}${endpoint}`,
      body,
      headers,
    }),
    signal: options?.signal,
  });

  if (!resp.ok) {
    throw new Error(`LSA API error: ${resp.status} ${resp.statusText}`);
  }

  return resp.json() as Promise<LSAResponse<T>>;
}

/**
 * Get all available device models from Lenovo Software Fix.
 */
export async function getModelNames(options?: {
  country?: string;
  category?: string;
  bearerToken?: string;
  guid?: string;
  signal?: AbortSignal;
}): Promise<LenovoModel[]> {
  const dparams: Record<string, string> = {
    category: options?.category || 'Phone',
  };
  if (options?.country) {
    dparams.country = options.country;
  }

  const body = buildBody(dparams, options?.guid);
  const resp = await lsaPost<ModelsContent>(
    '/Interface/rescueDevice/getModelNames.jhtml',
    body,
    options,
  );

  if (resp.code !== '0000') {
    throw new Error(`getModelNames failed: ${resp.desc}`);
  }

  return resp.content?.models || [];
}

/**
 * Get firmware resources for a specific model (multi-step selection flow).
 */
export async function getResource(
  modelName: string,
  marketName: string,
  params?: Record<string, string>,
  options?: {
    bearerToken?: string;
    guid?: string;
    signal?: AbortSignal;
  },
): Promise<LenovoFirmwareResource[]> {
  const dparams: Record<string, string> = {
    modelName,
    marketName,
    ...params,
  };

  const body = buildBody(dparams, options?.guid);
  const resp = await lsaPost<LenovoFirmwareResource[]>(
    '/Interface/rescueDevice/getResource.jhtml',
    body,
    options,
  );

  if (resp.code !== '0000') {
    throw new Error(`getResource failed: ${resp.desc}`);
  }

  return Array.isArray(resp.content) ? resp.content : [];
}

/**
 * Available Lenovo categories for filtering.
 */
export const LENOVO_CATEGORIES = ['Phone'] as const;

/**
 * Supported firmware brands.
 */
export const LENOVO_BRANDS = ['Motorola', 'Lenovo'] as const;
