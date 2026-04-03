/**
 * Cloudflare Worker — MotoOTA Unified Backend
 *
 * Serves the Vite-built SPA as static assets and handles
 * /api/check requests by forwarding them to the Motorola CDS server.
 *
 * Since the web app and the API live on the same origin,
 * no CORS proxy is needed — the browser treats /api/check as
 * a same-origin request.
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

function jsonResponse(body, status = 200, extra = {}) {
  return new Response(JSON.stringify(body), {
    status,
    headers: { 'Content-Type': 'application/json; charset=utf-8', ...extra },
  });
}

async function handleApiCheck(request) {
  if (request.method !== 'POST') {
    return jsonResponse({ error: 'Method not allowed. Use POST.' }, 405);
  }

  let body;
  try {
    body = await request.json();
  } catch {
    return jsonResponse({ error: 'Invalid JSON body' }, 400);
  }

  const { host, context, guid, payload } = body;

  if (!host || !context || !guid || !payload) {
    return jsonResponse({
      error: 'Missing required fields: host, context, guid, payload',
      example: {
        host: 'moto-cds.appspot.com',
        context: 'ota',
        guid: '0d5cc74421f2e8a',
        payload: {
          id: 'x',
          deviceInfo: { country: '', region: 'US' },
          extraInfo: { carrier: 'amxmx', vitalUpdate: false, otaSourceSha1: '0d5cc74421f2e8a' },
          triggeredBy: 'user',
        },
      },
    }, 400);
  }

  if (!ALLOWED_HOSTS.includes(host)) {
    return jsonResponse({
      error: `Host "${host}" is not in the allowlist`,
      allowedHosts: ALLOWED_HOSTS,
    }, 403);
  }

  const targetUrl = `https://${host}/cds/upgrade/1/check/ctx/${context}/key/${guid}`;

  try {
    const upstream = await fetch(targetUrl, {
      method: 'POST',
      headers: UPSTREAM_HEADERS,
      body: JSON.stringify(payload),
    });

    const data = await upstream.text();

    const responseHeaders = {
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
      target: targetUrl,
      detail: err.message,
    }, 502);
  }
}

export default {
  async fetch(request, env) {
    const url = new URL(request.url);

    // ── API routes ──────────────────────────────────────────
    if (url.pathname === '/api/check') {
      return handleApiCheck(request);
    }

    if (url.pathname === '/api/health') {
      return jsonResponse({
        service: 'MotoOTA API',
        status: 'ok',
        allowedHosts: ALLOWED_HOSTS,
      });
    }

    // ── Static assets (served by Cloudflare Assets binding) ─
    return env.ASSETS.fetch(request);
  },
};
