import axios from 'axios';
import { CORS_PROXIES, DEFAULT_HEADERS, buildCheckURL, buildPayload } from './endpoints.js';
import { parseCheckResponse, classifyCarrierStatus } from './response.js';
import { loadAppConfig } from '../config/storage.js';

const MAX_RETRIES = 3;
const RETRY_DELAY_MS = 1000;

async function sleep(ms) {
  return new Promise(resolve => setTimeout(resolve, ms));
}

async function postWithProxy(url, payload, timeout = 30000) {
  // Try direct first, then fall back to CORS proxies
  const attempts = [url, ...CORS_PROXIES.map(p => p + encodeURIComponent(url))];
  let lastError;
  for (const attemptUrl of attempts) {
    try {
      const resp = await axios.post(attemptUrl, payload, {
        headers: { ...DEFAULT_HEADERS },
        timeout,
      });
      return { data: resp.data, headers: resp.headers };
    } catch (err) {
      lastError = err;
      continue;
    }
  }
  throw lastError;
}

export async function checkUpdate(guid, carrier, options = {}) {
  const config = loadAppConfig();
  const host = options.host || getServerHost(config.server);
  const context = options.context || 'ota';
  const url = buildCheckURL(host, context, guid);
  const payload = buildPayload(carrier, guid, options);

  let lastError;
  for (let attempt = 0; attempt < MAX_RETRIES; attempt++) {
    try {
      const { data, headers } = await postWithProxy(url, payload, config.timeout * 1000);
      return parseCheckResponse(data, headers);
    } catch (err) {
      lastError = err;
      if (attempt < MAX_RETRIES - 1) await sleep(RETRY_DELAY_MS * (attempt + 1));
    }
  }
  throw lastError;
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
  const { onProgress, concurrency = 20 } = options;
  const results = [];
  let completed = 0;

  // Process in batches for concurrency control
  for (let i = 0; i < carriers.length; i += concurrency) {
    const batch = carriers.slice(i, i + concurrency);
    const batchResults = await Promise.allSettled(
      batch.map(async (carrier) => {
        try {
          const response = await checkUpdate(guid, carrier.code, options);
          return { carrier, response, status: classifyCarrierStatus(response), error: null };
        } catch (err) {
          return { carrier, response: null, status: 'error', error: err.message };
        }
      })
    );
    for (let j = 0; j < batchResults.length; j++) {
      completed++;
      const result = batchResults[j];
      const value = result.status === 'fulfilled'
        ? result.value
        : { carrier: batch[j], response: null, status: 'error', error: 'Unknown error' };
      results.push(value);
      onProgress?.(completed, carriers.length, value);
    }
  }
  return results;
}

function getServerHost(serverId) {
  const HOSTS = {
    'production-global': 'moto-cds.appspot.com',
    'production-prc': 'moto-cds.svcmot.cn',
    'staging': 'moto-cds-staging.appspot.com',
    'qa': 'moto-cds-qa.appspot.com',
    'dev': 'moto-cds-dev.appspot.com',
    'blurdev': 'ota-cn-sdc.blurdev.com',
  };
  return HOSTS[serverId] || HOSTS['production-global'];
}
