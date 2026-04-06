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

export type Page = 'home' | 'check' | 'chain' | 'scan' | 'servers' | 'config' | 'lenovo';

/* ── Lenovo Software Fix Types ──────────────────────────────── */

export interface LenovoModel {
  category: string;
  brand: string;
  modelName: string;
  marketName: string;
  platform: string;
  readSupport: boolean;
  readFlow: string;
}

export interface LenovoFileResource {
  id: number;
  fromS3: boolean;
  name: string;
  uri: string;
  type: string;
  unZip: boolean;
  md5: string;
  description: string;
  publishDate: string;
}

export interface LenovoParamProperty {
  label: string;
  property: string;
}

export interface LenovoFirmwareResource {
  brand: string;
  category: string;
  modelName: string;
  realModelName: string;
  marketName: string;
  carrier: string;
  platform: string;
  fingerPrint: string;
  comments: string;
  fastboot: boolean;
  backUpPopup: boolean;
  romMatchId: string;
  paramProperty: LenovoParamProperty | null;
  paramValues: string[] | null;
  flashFlow: string | null;
  romResource: LenovoFileResource | null;
  toolResource: LenovoFileResource | null;
  otaResource: LenovoFileResource | null;
}

export interface LenovoSearchState {
  models: LenovoModel[];
  selectedModel: LenovoModel | null;
  firmwareResources: LenovoFirmwareResource[];
  selectionSteps: LenovoFirmwareResource[];
  currentParams: Record<string, string>;
  loading: boolean;
  error: string | null;
}
