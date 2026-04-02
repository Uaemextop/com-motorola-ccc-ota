/**
 * Carrier Region Metadata
 *
 * Maps region identifiers to display metadata used throughout
 * the UI (icons, colors, descriptions).
 */

/**
 * @typedef {Object} RegionInfo
 * @property {string} name        - Human-readable region name
 * @property {string} icon        - Font Awesome CSS class
 * @property {string} color       - Hex color for UI accents
 * @property {string} description - Short description of the region
 */

/** @type {Record<string, RegionInfo>} */
export const REGION_INFO = {
  LATAM: {
    name: 'Latin America',
    icon: 'fa-solid fa-earth-americas',
    color: '#22c55e',
    description: 'Latin American carriers and devices',
  },
  Brazil: {
    name: 'Brazil',
    icon: 'fa-solid fa-earth-americas',
    color: '#16a34a',
    description: 'Brazilian carrier-specific firmware',
  },
  Europe: {
    name: 'Europe',
    icon: 'fa-solid fa-earth-europe',
    color: '#3b82f6',
    description: 'European carriers and retail devices',
  },
  'North America': {
    name: 'North America',
    icon: 'fa-solid fa-earth-americas',
    color: '#00d4ff',
    description: 'US and Canadian carriers',
  },
  Asia: {
    name: 'Asia',
    icon: 'fa-solid fa-earth-asia',
    color: '#eab308',
    description: 'Asian markets including India and Southeast Asia',
  },
  Africa: {
    name: 'Africa',
    icon: 'fa-solid fa-earth-africa',
    color: '#f97316',
    description: 'African carrier networks',
  },
  'Middle East': {
    name: 'Middle East',
    icon: 'fa-solid fa-earth-asia',
    color: '#a855f7',
    description: 'Middle Eastern carrier networks',
  },
  Oceania: {
    name: 'Oceania',
    icon: 'fa-solid fa-earth-oceania',
    color: '#06b6d4',
    description: 'Australia, New Zealand, and Pacific Islands',
  },
  Global: {
    name: 'Global',
    icon: 'fa-solid fa-globe',
    color: '#5eead4',
    description: 'Retail / unlocked devices with global firmware',
  },
  Unknown: {
    name: 'Unknown',
    icon: 'fa-solid fa-circle-question',
    color: '#64748b',
    description: 'Unidentified or unclassified region',
  },
};

/**
 * Retrieve metadata for a given region key.
 * Returns the "Unknown" entry when the key is not recognised.
 * @param {string} region - Region identifier
 * @returns {RegionInfo}
 */
export function getRegionInfo(region) {
  return REGION_INFO[region] ?? REGION_INFO.Unknown;
}

/**
 * Return an array of all available region keys.
 * @returns {string[]}
 */
export function getAllRegions() {
  return Object.keys(REGION_INFO);
}
