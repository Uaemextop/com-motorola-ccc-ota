/**
 * Motorola CDS API client
 *
 * Replicates the exact request format used by com.motorola.ccc.ota
 * (the official Motorola OTA app) as confirmed via moto_ota Python package
 * and direct curl verification against production servers.
 *
 * Endpoint: POST https://{host}/cds/upgrade/1/check/ctx/{context}/key/{guid}
 * Headers:  Content-Type, User-Agent, Accept-Encoding, Connection
 * Body:     { id, deviceInfo, extraInfo, triggeredBy }
 */

const CORS_PROXIES = [
  'https://corsproxy.io/?',
  'https://api.allorigins.win/raw?url=',
  'https://api.codetabs.com/v1/proxy?quest=',
];

/** Headers matching com.motorola.ccc.ota exactly */
const DEFAULT_HEADERS = {
  'Content-Type': 'application/json; charset=utf-8',
  'User-Agent': 'com.motorola.ccc.ota',
  'Accept-Encoding': 'gzip',
  'Connection': 'Keep-Alive',
};

const SERVER_HOSTS = {
  'production-global': 'moto-cds.appspot.com',
  'production-prc': 'moto-cds.svcmot.cn',
  'staging': 'moto-cds-staging.appspot.com',
  'qa': 'moto-cds-qa.appspot.com',
  'dev': 'moto-cds-dev.appspot.com',
  'blurdev': 'ota-cn-sdc.blurdev.com',
};

function buildCheckURL(host, context, guid) {
  return `https://${host}/cds/upgrade/1/check/ctx/${context}/key/${guid}`;
}

/**
 * Build request payload matching moto_ota/models/request.py build_check_payload.
 * Only carrier, otaSourceSha1, vitalUpdate, and triggeredBy affect server routing.
 */
function buildPayload(carrier, guid, options = {}) {
  return {
    id: options.serial || 'x',
    deviceInfo: { country: '', region: options.region || 'US' },
    extraInfo: { carrier, vitalUpdate: false, otaSourceSha1: guid },
    triggeredBy: options.triggeredBy || 'user',
  };
}

/**
 * Parse CDS server response into a structured object.
 * Matches moto_ota/models/response.py CheckResponse.from_dict.
 * Note: content.size is a string from the server ("111043449"), must convert.
 */
function parseResponse(data, headers = {}) {
  const proceed = data?.proceed ?? false;
  const content = data?.content ?? null;
  const xCdsExists = headers?.['x-cds-content-exists'] === 'true' || null;
  const sizeBytes = content ? Number(content.size) || 0 : 0;
  return {
    hasUpdate: proceed && content !== null && !!content.displayVersion,
    proceed,
    xCdsContentExists: xCdsExists,
    content: content && content.displayVersion ? {
      sourceVersion: content.sourceDisplayVersion ?? '',
      targetVersion: content.displayVersion ?? '',
      targetGuid: content.otaTargetSha1 ?? '',
      sizeBytes,
      sizeMB: (sizeBytes / (1024 * 1024)).toFixed(2),
      updateType: content.updateType ?? '',
      md5: content.md5_checksum ?? '',
      packageId: content.packageID ?? '',
      model: content.model ?? '',
      releaseNotes: content.releaseNotes ?? '',
      flavour: content.flavour ?? '',
    } : null,
    downloadUrls: (data?.contentResources ?? []).map(r => ({
      url: r.url,
      tags: r.tags ?? [],
      ttl: r.urlTtlSeconds ?? 0,
    })).filter(r => r.url),
    raw: data,
  };
}

export function classifyStatus(response) {
  if (response.hasUpdate) return 'open';
  if (response.xCdsContentExists) return 'whitelisted';
  return 'no-content';
}

async function postWithProxy(url, payload, timeout = 30000) {
  const attempts = [url, ...CORS_PROXIES.map(p => p + encodeURIComponent(url))];
  let lastError;
  for (const attemptUrl of attempts) {
    try {
      const controller = new AbortController();
      const timer = setTimeout(() => controller.abort(), timeout);
      const resp = await fetch(attemptUrl, {
        method: 'POST',
        headers: DEFAULT_HEADERS,
        body: JSON.stringify(payload),
        signal: controller.signal,
      });
      clearTimeout(timer);
      if (!resp.ok) throw new Error(`HTTP ${resp.status}: ${resp.statusText}`);
      const data = await resp.json();
      const headers = {};
      resp.headers.forEach((v, k) => { headers[k] = v; });
      return { data, headers };
    } catch (err) {
      lastError = err;
    }
  }
  throw lastError;
}

export async function checkUpdate(guid, carrier, options = {}) {
  const host = options.host || SERVER_HOSTS[options.server || 'production-global'];
  const context = options.context || 'ota';
  const url = buildCheckURL(host, context, guid);
  const payload = buildPayload(carrier, guid, options);
  const { data, headers } = await postWithProxy(url, payload, (options.timeout || 30) * 1000);
  return parseResponse(data, headers);
}

/**
 * Walk the full OTA update chain starting from guid.
 * Matches moto_ota/core/client.py walk_chain:
 * follows content.otaTargetSha1 until proceed=false or no next GUID.
 */
export async function walkChain(guid, carrier, options = {}) {
  const maxSteps = options.maxSteps || 50;
  const chain = [];
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

/**
 * Scan all carriers for a GUID in parallel batches.
 * Matches moto_ota/tui.py _scan_carriers with ThreadPoolExecutor(max_workers=20).
 */
export async function scanCarriers(guid, carriers, options = {}) {
  const { onProgress, concurrency = 20, signal } = options;
  const results = [];
  let completed = 0;
  for (let i = 0; i < carriers.length; i += concurrency) {
    if (signal?.aborted) break;
    const batch = carriers.slice(i, i + concurrency);
    const batchResults = await Promise.allSettled(
      batch.map(async (carrier) => {
        try {
          const response = await checkUpdate(guid, carrier.code, options);
          return { carrier, response, status: classifyStatus(response), error: null };
        } catch (err) {
          return { carrier, response: null, status: 'error', error: err.message };
        }
      })
    );
    for (const result of batchResults) {
      completed++;
      const value = result.status === 'fulfilled' ? result.value : { carrier: batch[0], response: null, status: 'error', error: 'Unknown' };
      results.push(value);
      onProgress?.(completed, carriers.length, value);
    }
  }
  return results;
}

export function formatBytes(bytes) {
  const n = Number(bytes);
  if (!n || n === 0) return '0 B';
  const units = ['B', 'KB', 'MB', 'GB', 'TB'];
  const k = 1024;
  const i = Math.min(Math.floor(Math.log(Math.abs(n)) / Math.log(k)), units.length - 1);
  return (n / Math.pow(k, i)).toFixed(2) + ' ' + units[i];
}

export const GUID_REGEX = /^[0-9a-fA-F]{15,}$/;
