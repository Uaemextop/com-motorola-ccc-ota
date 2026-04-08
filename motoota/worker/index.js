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

/** Known firmware CDN hosts (not CDS API servers) */
const CDN_HOSTS = {
  'lenovo-ota': {
    host: 'ota-cdn.lenovo.com',
    label: 'Lenovo OTA CDN',
    description: 'S3+CloudFront (us-east-1) — Lenovo/ZUI firmware ZIPs',
    probeFile: 'firmware/',
  },
  'motorola-dlmgr': {
    host: 'dlmgr.gtm.svcmot.com',
    label: 'Motorola Download Manager',
    description: 'Jetty/Akamai — CDS delta OTA packages',
    probeFile: null,
  },
  'lenovo-rsd': {
    host: 'rsddownload-secure.lenovo.com',
    label: 'Lenovo RSD (Rescue)',
    description: 'S3+CloudFront — full factory firmware ZIPs',
    probeFile: null,
  },
};

/** Headers that mirror the real com.motorola.ccc.ota Android app */
const UPSTREAM_HEADERS = {
  'Content-Type': 'application/json; charset=utf-8',
  'User-Agent': 'com.motorola.ccc.ota',
  'Accept-Encoding': 'gzip',
  'Connection': 'Keep-Alive',
};

/** CORS headers — allow any origin so the API works from GitHub Pages too */
const CORS_HEADERS = {
  'Access-Control-Allow-Origin': '*',
  'Access-Control-Allow-Methods': 'POST, GET, OPTIONS',
  'Access-Control-Allow-Headers': 'Content-Type',
  'Access-Control-Expose-Headers': 'x-cds-content-exists',
};

function jsonResponse(body, status = 200, extra = {}) {
  return new Response(JSON.stringify(body), {
    status,
    headers: { 'Content-Type': 'application/json; charset=utf-8', ...CORS_HEADERS, ...extra },
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

  // Validate context and guid to prevent path traversal
  const SAFE_PATH_SEGMENT = /^[a-zA-Z0-9_.-]+$/;
  if (!SAFE_PATH_SEGMENT.test(context) || !SAFE_PATH_SEGMENT.test(guid)) {
    return jsonResponse({
      error: 'Invalid context or guid — only alphanumeric, dot, dash, and underscore allowed',
    }, 400);
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

    return new Response(data, { status: upstream.status, headers: { ...responseHeaders, ...CORS_HEADERS } });
  } catch (err) {
    return jsonResponse({
      error: 'Failed to reach upstream CDS server',
      target: targetUrl,
      detail: err.message,
    }, 502);
  }
}

/**
 * Probe a CDN host to check its status (HEAD request).
 *
 * GET /api/cdn-probe                — probe all known CDN hosts
 * GET /api/cdn-probe?cdn=lenovo-ota — probe a specific CDN
 * GET /api/cdn-probe?url=https://ota-cdn.lenovo.com/firmware/xxx.zip — probe a specific URL
 */
async function handleCdnProbe(request, url) {
  if (request.method !== 'GET') {
    return jsonResponse({ error: 'Use GET' }, 405);
  }

  const specificUrl = url.searchParams.get('url');
  if (specificUrl) {
    return probeSingleUrl(specificUrl);
  }

  const cdnKey = url.searchParams.get('cdn');
  if (cdnKey) {
    const cdn = CDN_HOSTS[cdnKey];
    if (!cdn) {
      return jsonResponse({
        error: `Unknown CDN "${cdnKey}"`,
        available: Object.keys(CDN_HOSTS),
      }, 404);
    }
    return probeCdn(cdnKey, cdn);
  }

  // Probe all CDN hosts
  const results = {};
  const probes = Object.entries(CDN_HOSTS).map(async ([key, cdn]) => {
    results[key] = await probeCdnResult(key, cdn);
  });
  await Promise.all(probes);

  return jsonResponse({ cdnHosts: results });
}

async function probeSingleUrl(targetUrl) {
  try {
    new URL(targetUrl);
  } catch {
    return jsonResponse({ error: 'Invalid URL' }, 400);
  }

  try {
    const start = Date.now();
    const resp = await fetch(targetUrl, { method: 'HEAD', redirect: 'follow' });
    const latencyMs = Date.now() - start;

    const headers = {};
    for (const [k, v] of resp.headers.entries()) {
      headers[k] = v;
    }

    return jsonResponse({
      url: targetUrl,
      status: resp.status,
      statusText: resp.statusText,
      latencyMs,
      headers,
    });
  } catch (err) {
    return jsonResponse({
      url: targetUrl,
      status: 'error',
      error: err.message,
    }, 502);
  }
}

async function probeCdnResult(key, cdn) {
  const result = {
    host: cdn.host,
    label: cdn.label,
    description: cdn.description,
  };

  try {
    const probeUrl = cdn.probeFile
      ? `https://${cdn.host}/${cdn.probeFile}`
      : `https://${cdn.host}/`;

    const start = Date.now();
    const resp = await fetch(probeUrl, { method: 'HEAD', redirect: 'follow' });
    result.latencyMs = Date.now() - start;
    result.status = resp.status;
    result.server = resp.headers.get('server') || 'unknown';
    result.via = resp.headers.get('via') || null;
    result.cacheStatus = resp.headers.get('x-cache') || null;
    result.contentType = resp.headers.get('content-type') || null;
    result.reachable = resp.status < 500;
  } catch (err) {
    result.status = 'error';
    result.error = err.message;
    result.reachable = false;
  }

  return result;
}

async function probeCdn(key, cdn) {
  const result = await probeCdnResult(key, cdn);
  return jsonResponse({ cdn: key, ...result });
}

export default {
  async fetch(request, env) {
    const url = new URL(request.url);

    // ── CORS preflight ─────────────────────────────────────
    if (request.method === 'OPTIONS') {
      return new Response(null, { status: 204, headers: CORS_HEADERS });
    }

    // ── API routes ──────────────────────────────────────────
    if (url.pathname === '/api/check') {
      return handleApiCheck(request);
    }

    if (url.pathname === '/api/health') {
      return jsonResponse({
        service: 'MotoOTA API',
        status: 'ok',
        allowedHosts: ALLOWED_HOSTS,
        cdnHosts: Object.fromEntries(
          Object.entries(CDN_HOSTS).map(([k, v]) => [k, { host: v.host, label: v.label }]),
        ),
      });
    }

    // ── CDN probe — debug endpoint for verifying CDN status ────
    if (url.pathname === '/api/cdn-probe') {
      return handleCdnProbe(request, url);
    }

    // ── Debug — protocol reference & curl examples ──────────
    if (url.pathname === '/api/debug') {
      return jsonResponse(buildDebugReference());
    }

    // ── Static assets (served by Cloudflare Assets binding) ─
    return env.ASSETS.fetch(request);
  },
};

/** Build the full debug/protocol reference object */
function buildDebugReference() {
  return {
    title: 'Motorola CDS OTA Protocol — Deep Debug Reference',
    updated: '2026-04-08',
    protocol: {
      method: 'POST',
      url: 'https://{host}/cds/upgrade/1/check/ctx/{context}/key/{guid}',
      headers: {
        required: {
          'Content-Type': 'application/json (or application/json; charset=utf-8)',
        },
        recommended: {
          'User-Agent': 'com.motorola.ccc.ota',
          'Accept-Encoding': 'gzip',
          'Connection': 'Keep-Alive',
        },
        notes: {
          'User-Agent': 'BLOCKED if starts with "Mozilla" or is empty. Anything else works: curl/*, python-requests/*, okhttp/*, etc.',
        },
      },
      payload: {
        minimal: {
          id: 'x',
          deviceInfo: { country: '', region: 'US' },
          extraInfo: { carrier: '{carrier_code}', vitalUpdate: false, otaSourceSha1: '{guid}' },
          triggeredBy: 'user',
        },
        routingFields: [
          'extraInfo.carrier — selects firmware chain (e.g. reteu, amxmx)',
          'extraInfo.otaSourceSha1 — device GUID (also in URL path)',
          'extraInfo.vitalUpdate — must be false (true blocks response)',
          'triggeredBy — must be "user" (polling/setup return no content)',
        ],
        ignoredFields: 'All other fields (model, fingerprint, serial, imei, etc.) are cosmetic — server returns identical response with or without them.',
      },
      contexts: {
        ota: 'Main OTA packages — the only context with content on production',
        fota: 'Firmware OTA — always proceed=false',
        modem: 'Modem updates — always proceed=false',
      },
    },
    servers: {
      'moto-cds.appspot.com': {
        label: 'Production Global',
        server: 'Google Frontend',
        appId: 'moto-cds',
        status: 'active — has OTA packages',
      },
      'moto-cds.svcmot.cn': {
        label: 'Production PRC/LATAM',
        server: 'nginx/1.14.1',
        appId: 'moto-cds',
        status: 'active — same data as Global, different CDN routing',
      },
      'moto-cds-staging.appspot.com': {
        label: 'Staging',
        appId: 'moto-cds-staging',
        status: 'no OTA packages (always proceed=false)',
      },
      'moto-cds-qa.appspot.com': {
        label: 'QA',
        appId: 'moto-cds-qa',
        status: 'no OTA packages',
      },
      'moto-cds-dev.appspot.com': {
        label: 'Development',
        appId: 'moto-cds-dev',
        status: 'unreliable (/versions times out)',
      },
    },
    cdnHosts: {
      'dlmgr.gtm.svcmot.com': {
        label: 'Motorola Download Manager',
        infra: 'Jetty 9.4.8 behind Akamai',
        purpose: 'Serves CDS OTA delta packages',
        urlSource: 'contentResources[].url in /check response',
        urlTtl: '600 seconds',
        rangeRequests: 'Advertises Accept-Ranges: bytes but returns 200 not 206 — NO resume',
        notes: 'URLs are signed/encrypted, change on every /check call',
      },
      'ota-cdn.lenovo.com': {
        label: 'Lenovo OTA CDN',
        infra: 'S3 (us-east-1) + CloudFront',
        dns: 'ota-cdn.lenovo.com → skycdn.com.cn → cdn-ota-us.lenovo.com → d21mla6v0t0dlp.cloudfront.net',
        tls: '*.lenovo.com by DigiCert (valid until Mar 2027)',
        purpose: 'Lenovo/ZUI full device firmware ZIPs',
        validPaths: ['/firmware/ (directory, 200)', '/soap/ (empty, 0 bytes)'],
        urlPattern: '/firmware/{timestamp_id}-{build_id}.zip',
        knownFiles: [
          'firmware/20246272145210-6026.zip (4.46 GB, Y700 ZUI 16)',
          'firmware/20241122182845316-4509.zip (428 MB)',
        ],
        httpMethods: 'GET and HEAD only — POST/PUT/DELETE/OPTIONS → 403',
        rangeRequests: 'BROKEN — CloudFront returns 200 not 206, ignores Range header',
        bucketListing: 'DISABLED — ListObjects/ListObjectsV2 → AccessDenied',
        auth: 'Public if you know exact filename, no auth needed',
      },
      'rsddownload-secure.lenovo.com': {
        label: 'Lenovo RSD (Rescue Smart Device)',
        infra: 'S3 (us-east-1) + CloudFront (d3me8mak3rzgc5.cloudfront.net)',
        purpose: 'Full factory firmware ZIPs for Rescue & Smart Assistant',
        urlPattern: 'fastboot_{codename}_{variant}_user_{android}_{version}_{hash}_release-keys.zip',
        auth: 'Public if you know exact filename',
        notes: 'Only LATEST version available (old versions → 403). Only user+release-keys builds exist.',
      },
      'lsa.lenovo.com': {
        label: 'Lenovo Software Assurance API',
        infra: 'Tomcat 11.0.12 behind AWS ELB',
        purpose: 'Firmware catalog, model lookup, download URL generation (presigned S3)',
        auth: 'OAuth2/PKCE → WUST → rotating bearer tokens',
        dcBlocking: 'BLOCKS datacenter IPs (Azure/AWS/GCP) with code=403. Requires residential IP.',
        endpoints: [
          '/Interface/common/getApiInfo.jhtml (OAuth2 URLs)',
          '/Interface/common/getBroadcast.jhtml',
          '/Interface/resource/getModelNames.jhtml (country+category → models)',
          '/Interface/resource/getResource.jhtml (model → firmware URLs)',
        ],
      },
    },
    response: {
      carrierStatuses: {
        open: 'proceed=true + content has displayVersion → full update info + download URLs',
        whitelisted: 'proceed=false + x-cds-content-exists: true → content has updateType+deploymentPhase only, no URLs',
        noContent: 'proceed=false + x-cds-content-exists: false + content=null → no update exists',
      },
      keyFields: {
        proceed: 'boolean — true if update available and carrier is open',
        'content.displayVersion': 'Target version (e.g. VVTA35.51-28-15)',
        'content.sourceDisplayVersion': 'Source version (e.g. VVTA35.51-18-6)',
        'content.otaTargetSha1': 'Next GUID for chain walk',
        'content.size': 'STRING not number — OTA file size in bytes',
        'content.md5_checksum': 'MD5 hex of the OTA ZIP',
        'content.updateType': 'MR (maintenance release) or SPR (security patch)',
        'content.abInstallType': 'streamingOnAb — A/B streaming install',
        'content.deploymentPlanPhase': 'Open, Phased, etc.',
        'contentResources': 'Array of download URLs with tags (WIFI/CELL) and TTL',
        'x-cds-content-exists': 'HTTP header (not in body) — true/false for carrier status detection',
      },
      otaZipFormat: 'Standard Android A/B OTA ZIP with payload.bin (streaming), META-INF/com/android/metadata',
    },
    chainWalk: {
      algorithm: 'Start with GUID → POST /check → extract content.otaTargetSha1 → repeat until proceed=false',
      example: {
        guid: '0d5cc74421f2e8a',
        carrier: 'reteu',
        chain: [
          'Step 1: VVTA35.51-18-6 → VVTA35.51-28-15 (106 MB)',
          'Step 2: VVTA35.51-28-15 → VVTA35.51-65-5 (339 MB)',
          'Step 3: VVTA35.51-65-5 → VVTA35.51-100 (134 MB)',
          'Step 4: VVTA35.51-100 → VVTA35.51-114 (883 MB)',
          'Step 5: proceed=false (end of chain)',
        ],
      },
    },
    curlExamples: {
      checkUpdate: [
        'curl -X POST "https://moto-cds.appspot.com/cds/upgrade/1/check/ctx/ota/key/0d5cc74421f2e8a"',
        '  -H "Content-Type: application/json; charset=utf-8"',
        '  -H "User-Agent: com.motorola.ccc.ota"',
        '  -d \'{"id":"x","deviceInfo":{"country":"","region":"US"},"extraInfo":{"carrier":"reteu","vitalUpdate":false,"otaSourceSha1":"0d5cc74421f2e8a"},"triggeredBy":"user"}\'',
      ].join(' \\\n'),
      serverVersions: 'curl -H "User-Agent: com.motorola.ccc.ota" https://moto-cds.appspot.com/cds/upgrade/1/versions',
      probeOtaCdn: 'curl -sI https://ota-cdn.lenovo.com/firmware/20241122182845316-4509.zip',
      probeRsd: 'curl -sI https://rsddownload-secure.lenovo.com/fastboot_lamu_g_user_15_VVTAS35.51-137-2-1_c99c2a_release-keys.zip',
      viaWorker: [
        'curl -X POST "https://com-motorola-ccc-ota.ealvarado2677.workers.dev/api/check"',
        '  -H "Content-Type: application/json"',
        '  -d \'{"host":"moto-cds.appspot.com","context":"ota","guid":"0d5cc74421f2e8a","payload":{"id":"x","deviceInfo":{"country":"","region":"US"},"extraInfo":{"carrier":"reteu","vitalUpdate":false,"otaSourceSha1":"0d5cc74421f2e8a"},"triggeredBy":"user"}}\'',
      ].join(' \\\n'),
    },
    userAgentRules: {
      allowed: ['com.motorola.ccc.ota', 'curl/*', 'python-requests/*', 'okhttp/*', 'Dalvik/*', 'wget/*', 'Java/*', 'PostmanRuntime/*', 'any-custom-string'],
      blocked: ['Mozilla/5.0 (anything starting with Mozilla)', 'empty string'],
      note: 'Google Frontend blocks browser-like User-Agents. Default curl UA works fine.',
    },
  };
}
