/**
 * Server Configuration
 *
 * Defines the Motorola CDS (Content Delivery System) servers
 * used for OTA update checks across different regions.
 */

/** @type {Array<{id: string, name: string, host: string, region: string, status: string, description: string}>} */
export const SERVERS = [
  {
    id: 'production-global',
    name: 'Production Global',
    host: 'moto-cds.appspot.com',
    region: 'Global',
    status: 'active',
    description: 'Main production server for global OTA updates',
  },
  {
    id: 'production-prc',
    name: 'Production PRC',
    host: 'moto-cds.svcmot.cn',
    region: 'China',
    status: 'active',
    description: 'Production server for China/LATAM regions',
  },
  {
    id: 'staging',
    name: 'Staging',
    host: 'moto-cds-staging.appspot.com',
    region: 'Global',
    status: 'inactive',
    description: 'Staging environment - no OTA packages',
  },
  {
    id: 'qa',
    name: 'QA',
    host: 'moto-cds-qa.appspot.com',
    region: 'Global',
    status: 'inactive',
    description: 'QA environment - no OTA packages',
  },
  {
    id: 'dev',
    name: 'Development',
    host: 'moto-cds-dev.appspot.com',
    region: 'Global',
    status: 'inactive',
    description: 'Development environment - no OTA packages',
  },
  {
    id: 'blurdev',
    name: 'BlurDev',
    host: 'ota-cn-sdc.blurdev.com',
    region: 'China',
    status: 'inactive',
    description: 'BlurDev - nginx proxy to staging',
  },
];

/** Available region identifiers */
export const REGIONS = ['Global', 'China'];

/** Maps each region to the server IDs it contains */
export const REGION_SERVERS = {
  Global: ['production-global', 'staging', 'qa', 'dev'],
  China: ['production-prc', 'blurdev'],
};

/**
 * Look up a server by its unique ID.
 * @param {string} id - Server identifier
 * @returns {object|undefined} The matching server object, or undefined
 */
export function getServerByID(id) {
  return SERVERS.find((s) => s.id === id);
}

/**
 * Return all servers belonging to a given region.
 * @param {string} region - Region name (e.g. 'Global', 'China')
 * @returns {object[]} Array of matching server objects
 */
export function getServersByRegion(region) {
  return SERVERS.filter((s) => REGION_SERVERS[region]?.includes(s.id));
}

/**
 * Build the OTA update-check URL for a given server.
 * @param {string} host    - Server hostname
 * @param {string} context - Request context (e.g. 'ota')
 * @param {string} guid    - Unique device / request GUID
 * @returns {string} Fully-qualified check URL
 */
export function buildCheckURL(host, context, guid) {
  return `https://${host}/cds/upgrade/1/check/ctx/${context}/key/${guid}`;
}
