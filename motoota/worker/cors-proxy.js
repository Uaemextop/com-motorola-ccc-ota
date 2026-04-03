/**
 * Cloudflare Worker — CORS Proxy for Motorola CDS API
 *
 * Deployed at: https://com-motorola-ccc-ota.ealvarado2677.workers.dev
 *
 * Usage:
 *   POST /?url=https://moto-cds.appspot.com/cds/upgrade/1/check/ctx/ota/key/<GUID>
 *   Body: JSON payload (forwarded as-is to the CDS server)
 *
 * The worker:
 *   1. Validates the target hostname is in the allowlist
 *   2. Forwards the POST request with the exact headers the CDS server expects
 *   3. Returns the upstream JSON response with CORS headers added
 *   4. Forwards the x-cds-content-exists header from the CDS response
 *
 * Only allows POST to known Motorola CDS servers.
 */

const ALLOWED_HOSTS = [
  'moto-cds.appspot.com',
  'moto-cds.svcmot.cn',
  'moto-cds-staging.appspot.com',
  'moto-cds-qa.appspot.com',
  'moto-cds-dev.appspot.com',
  'ota-cn-sdc.blurdev.com',
];

/** Headers that mirror the real com.motorola.ccc.ota Android app */
const UPSTREAM_HEADERS = {
  'Content-Type': 'application/json; charset=utf-8',
  'User-Agent': 'com.motorola.ccc.ota',
  'Accept-Encoding': 'gzip',
  'Connection': 'Keep-Alive',
};

const CORS_HEADERS = {
  'Access-Control-Allow-Origin': '*',
  'Access-Control-Allow-Methods': 'POST, GET, OPTIONS',
  'Access-Control-Allow-Headers': 'Content-Type',
  'Access-Control-Expose-Headers': 'x-cds-content-exists',
  'Access-Control-Max-Age': '86400',
};

function jsonResponse(body, status = 200, extra = {}) {
  return new Response(JSON.stringify(body), {
    status,
    headers: { ...CORS_HEADERS, 'Content-Type': 'application/json; charset=utf-8', ...extra },
  });
}

export default {
  async fetch(request) {
    // ── CORS preflight ──────────────────────────────────────────
    if (request.method === 'OPTIONS') {
      return new Response(null, { status: 204, headers: CORS_HEADERS });
    }

    // ── Health check / info ─────────────────────────────────────
    if (request.method === 'GET') {
      const url = new URL(request.url);
      if (!url.searchParams.has('url')) {
        return jsonResponse({
          service: 'MotoOTA CORS Proxy',
          status: 'ok',
          allowedHosts: ALLOWED_HOSTS,
          usage: 'POST /?url=<CDS_URL>  with JSON body',
        });
      }
    }

    if (request.method !== 'POST') {
      return jsonResponse({ error: 'Method not allowed. Use POST.' }, 405);
    }

    // ── Validate target URL ─────────────────────────────────────
    const url = new URL(request.url);
    const target = url.searchParams.get('url');

    if (!target) {
      return jsonResponse({
        error: 'Missing ?url= parameter',
        example: '/?url=https://moto-cds.appspot.com/cds/upgrade/1/check/ctx/ota/key/<GUID>',
      }, 400);
    }

    let targetUrl;
    try {
      targetUrl = new URL(target);
    } catch {
      return jsonResponse({ error: 'Invalid target URL', received: target }, 400);
    }

    if (!ALLOWED_HOSTS.includes(targetUrl.hostname)) {
      return jsonResponse({
        error: `Host "${targetUrl.hostname}" is not in the allowlist`,
        allowedHosts: ALLOWED_HOSTS,
      }, 403);
    }

    // ── Forward request to CDS ──────────────────────────────────
    try {
      const body = await request.text();

      const upstream = await fetch(target, {
        method: 'POST',
        headers: UPSTREAM_HEADERS,
        body,
      });

      const data = await upstream.text();

      // Build response headers
      const responseHeaders = {
        ...CORS_HEADERS,
        'Content-Type': upstream.headers.get('Content-Type') || 'application/json; charset=utf-8',
      };

      // Forward the x-cds-content-exists header (critical for carrier status detection)
      const xcds = upstream.headers.get('x-cds-content-exists');
      if (xcds !== null) {
        responseHeaders['x-cds-content-exists'] = xcds;
      }

      return new Response(data, { status: upstream.status, headers: responseHeaders });
    } catch (err) {
      return jsonResponse({
        error: 'Failed to reach upstream CDS server',
        target,
        detail: err.message,
      }, 502);
    }
  },
};
