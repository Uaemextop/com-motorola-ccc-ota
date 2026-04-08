/* ── Server Configuration ──────────────────────────────────── */

import type { Server } from '@/lib/types';

export const SERVERS: Server[] = [
  {
    id: 'production-global',
    name: 'Production Global',
    host: 'moto-cds.appspot.com',
    region: 'Global',
    status: 'active',
    description: 'Google Frontend — dispositivos de todo el mundo',
  },
  {
    id: 'production-prc',
    name: 'Production PRC',
    host: 'moto-cds.svcmot.cn',
    region: 'China',
    status: 'active',
    description: 'nginx/1.14.1 — China y Latinoamérica',
  },
  {
    id: 'staging',
    name: 'Staging',
    host: 'moto-cds-staging.appspot.com',
    region: 'Global',
    status: 'inactive',
    description: 'Entorno de pruebas — sin paquetes OTA',
  },
  {
    id: 'qa',
    name: 'QA',
    host: 'moto-cds-qa.appspot.com',
    region: 'Global',
    status: 'inactive',
    description: 'Entorno QA — sin paquetes OTA',
  },
  {
    id: 'dev',
    name: 'Development',
    host: 'moto-cds-dev.appspot.com',
    region: 'Global',
    status: 'inactive',
    description: 'Entorno de desarrollo — sin paquetes OTA',
  },
  {
    id: 'blurdev',
    name: 'BlurDev',
    host: 'ota-cn-sdc.blurdev.com',
    region: 'China',
    status: 'inactive',
    description: 'Proxy nginx → staging',
  },
];

/** Known firmware CDN hosts (not CDS API servers) */
export interface CdnHost {
  id: string;
  name: string;
  host: string;
  description: string;
  pathPrefix: string;
}

export const CDN_HOSTS: CdnHost[] = [
  {
    id: 'lenovo-ota',
    name: 'Lenovo OTA CDN',
    host: 'ota-cdn.lenovo.com',
    description: 'S3+CloudFront (us-east-1) — firmware ZIPs para Lenovo/ZUI, solo GET, sin resume',
    pathPrefix: '/firmware/',
  },
  {
    id: 'motorola-dlmgr',
    name: 'Motorola Download Manager',
    host: 'dlmgr.gtm.svcmot.com',
    description: 'Jetty/Akamai — paquetes delta OTA de CDS, URLs firmadas (TTL 600s)',
    pathPrefix: '/dl/dlws/1/download/',
  },
  {
    id: 'lenovo-rsd',
    name: 'Lenovo RSD (Rescue)',
    host: 'rsddownload-secure.lenovo.com',
    description: 'S3+CloudFront — firmware completo para Rescue, público si sabes el nombre',
    pathPrefix: '/',
  },
];

export const REGIONS = ['Global', 'China'] as const;

export const REGION_SERVERS: Record<string, string[]> = {
  Global: ['production-global', 'staging', 'qa', 'dev'],
  China: ['production-prc', 'blurdev'],
};

export function getServerById(id: string): Server | undefined {
  return SERVERS.find((s) => s.id === id);
}

export function getServersByRegion(region: string): Server[] {
  const ids = REGION_SERVERS[region] || [];
  return SERVERS.filter((s) => ids.includes(s.id));
}

export function getCdnHostById(id: string): CdnHost | undefined {
  return CDN_HOSTS.find((c) => c.id === id);
}
