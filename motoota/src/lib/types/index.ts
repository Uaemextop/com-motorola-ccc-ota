/* ── Motorola CDS API Types ─────────────────────────────────── */

export interface Server {
  id: string;
  name: string;
  host: string;
  region: string;
  status: 'active' | 'inactive';
  description: string;
}

export interface Carrier {
  code: string;
  name: string;
  region: string;
}

export interface CheckPayload {
  id: string;
  deviceInfo: {
    country: string;
    region: string;
  };
  extraInfo: {
    carrier: string;
    vitalUpdate: boolean;
    otaSourceSha1: string;
  };
  triggeredBy: string;
}

export interface ContentInfo {
  sourceVersion: string;
  targetVersion: string;
  targetGuid: string;
  sizeBytes: number;
  sizeMB: string;
  updateType: string;
  md5: string;
  packageId: string;
}

export interface CheckResponse {
  hasUpdate: boolean;
  proceed: boolean;
  xCdsContentExists: boolean | null;
  context: string;
  contextKey: string;
  trackingId: string;
  pollAfterSeconds: number;
  content: ContentInfo | null;
  downloadUrls: string[];
  raw: Record<string, unknown>;
}

export type CarrierStatus = 'open' | 'whitelisted' | 'no-content' | 'error';

export interface ScanResult {
  carrier: Carrier;
  response: CheckResponse | null;
  status: CarrierStatus;
  error: string | null;
}

export interface AppConfig {
  server: string;
  guid: string;
  carrier: string;
  context: string;
  region: string;
  timeout: number;
}

export type Page = 'home' | 'check' | 'chain' | 'scan' | 'servers' | 'config';
