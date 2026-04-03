/**
 * Cloudflare Worker — CORS Proxy for Motorola CDS API
 *
 * Deploy free: https://workers.cloudflare.com
 *   1. Create a new Worker
 *   2. Paste this code
 *   3. Deploy → copy the URL (e.g. https://moto-proxy.<you>.workers.dev)
 *   4. In MotoOTA → Configuración → set "URL del proxy CORS" to the Worker URL
 *
 * Only allows POST to moto-cds.appspot.com and moto-cds.svcmot.cn
 */

const ALLOWED_HOSTS = [
  'moto-cds.appspot.com',
  'moto-cds.svcmot.cn',
  'moto-cds-staging.appspot.com',
  'moto-cds-qa.appspot.com',
  'moto-cds-dev.appspot.com',
  'ota-cn-sdc.blurdev.com',
];

const CORS_HEADERS = {
  'Access-Control-Allow-Origin': '*',
  'Access-Control-Allow-Methods': 'POST, OPTIONS',
  'Access-Control-Allow-Headers': 'Content-Type',
  'Access-Control-Max-Age': '86400',
};

export default {
  async fetch(request) {
    if (request.method === 'OPTIONS') {
      return new Response(null, { status: 204, headers: CORS_HEADERS });
    }

    if (request.method !== 'POST') {
      return new Response('Method not allowed', { status: 405, headers: CORS_HEADERS });
    }

    const url = new URL(request.url);
    const target = url.searchParams.get('url');

    if (!target) {
      return new Response(JSON.stringify({ error: 'Missing ?url= parameter' }), {
        status: 400,
        headers: { ...CORS_HEADERS, 'Content-Type': 'application/json' },
      });
    }

    let targetUrl;
    try {
      targetUrl = new URL(target);
    } catch {
      return new Response(JSON.stringify({ error: 'Invalid URL' }), {
        status: 400,
        headers: { ...CORS_HEADERS, 'Content-Type': 'application/json' },
      });
    }

    if (!ALLOWED_HOSTS.includes(targetUrl.hostname)) {
      return new Response(JSON.stringify({ error: 'Host not allowed' }), {
        status: 403,
        headers: { ...CORS_HEADERS, 'Content-Type': 'application/json' },
      });
    }

    const body = await request.text();
    const upstream = await fetch(target, {
      method: 'POST',
      headers: {
        'Content-Type': 'application/json; charset=utf-8',
        'User-Agent': 'com.motorola.ccc.ota',
        'Accept-Encoding': 'gzip',
        'Connection': 'Keep-Alive',
      },
      body,
    });

    const data = await upstream.text();
    const responseHeaders = { ...CORS_HEADERS, 'Content-Type': 'application/json; charset=utf-8' };

    const xcds = upstream.headers.get('x-cds-content-exists');
    if (xcds) responseHeaders['x-cds-content-exists'] = xcds;

    return new Response(data, { status: upstream.status, headers: responseHeaders });
  },
};
