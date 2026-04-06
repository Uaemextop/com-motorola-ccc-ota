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

export interface ContentResource {
  url: string;
  tags: string[];
  urlTtlSeconds: number;
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
  model: string;
  releaseNotes: string;
  abInstallType: string;
  deploymentPhase: string;
  sourceGuid: string;
  flavour: string;
}

export interface CheckResponse {
  hasUpdate: boolean;
  proceed: boolean;
  xCdsContentExists: boolean | null;
  context: string;
  contextKey: string;
  trackingId: string;
  pollAfterSeconds: number;
  smartUpdateBitmap: number;
  content: ContentInfo | null;
  downloadUrls: string[];
  contentResources: ContentResource[];
  raw: Record<string, unknown>;
}

export type CarrierStatus = 'open' | 'whitelisted' | 'no-content' | 'error';

export interface ScanResult {
  carrier: Carrier;
  response: CheckResponse | null;
  status: CarrierStatus;
  error: string | null;
  chain?: CheckResponse[];
}

export type DownloadNetwork = 'wifi' | 'cell';

export interface AppConfig {
  server: string;
  guid: string;
  carrier: string;
  serial: string;
  context: string;
  region: string;
  timeout: number;
  downloadNetwork: DownloadNetwork;
}

export type Page = 'home' | 'check' | 'chain' | 'scan' | 'servers' | 'config';
