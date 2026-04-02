export const CORS_PROXIES = [
  'https://corsproxy.io/?',
  'https://api.allorigins.win/raw?url=',
];

export const DEFAULT_HEADERS = {
  'Content-Type': 'application/json; charset=utf-8',
  'User-Agent': 'com.motorola.ccc.ota',
  'Accept-Encoding': 'gzip',
  'Connection': 'Keep-Alive',
};

export function buildCheckURL(host, context, guid) {
  return `https://${host}/cds/upgrade/1/check/ctx/${context}/key/${guid}`;
}

export function buildPayload(carrier, guid, options = {}) {
  return {
    id: 'x',
    deviceInfo: { country: '', region: options.region || 'US' },
    extraInfo: {
      carrier,
      vitalUpdate: false,
      otaSourceSha1: guid,
    },
    triggeredBy: options.triggeredBy || 'user',
  };
}
