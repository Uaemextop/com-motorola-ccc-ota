const CORS_PROXIES = [
  'https://corsproxy.io/?',
  'https://api.allorigins.win/raw?url=',
];

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

function buildPayload(carrier, guid, options = {}) {
  return {
    id: 'x',
    deviceInfo: { country: '', region: options.region || 'US' },
    extraInfo: { carrier, vitalUpdate: false, otaSourceSha1: guid },
    triggeredBy: options.triggeredBy || 'user',
  };
}

function parseResponse(data, headers = {}) {
  const proceed = data?.proceed ?? false;
  const content = data?.content ?? null;
  const xCdsExists = headers?.['x-cds-content-exists'] === 'true' || null;
  return {
    hasUpdate: proceed && content !== null,
    proceed,
    xCdsContentExists: xCdsExists,
    content: content ? {
      sourceVersion: content.sourceDisplayVersion ?? '',
      targetVersion: content.displayVersion ?? '',
      targetGuid: content.otaTargetSha1 ?? '',
      sizeBytes: content.size ?? 0,
      sizeMB: ((content.size ?? 0) / (1024 * 1024)).toFixed(2),
      updateType: content.updateType ?? '',
      md5: content.md5_checksum ?? '',
      packageId: content.packageID ?? '',
    } : null,
    downloadUrls: (data?.contentResources ?? []).map(r => r.url).filter(Boolean),
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
  if (bytes === 0) return '0 B';
  const units = ['B', 'KB', 'MB', 'GB', 'TB'];
  const k = 1024;
  const i = Math.min(Math.floor(Math.log(Math.abs(bytes)) / Math.log(k)), units.length - 1);
  return (bytes / Math.pow(k, i)).toFixed(2) + ' ' + units[i];
}

export const GUID_REGEX = /^[0-9a-fA-F]{15,}$/;
