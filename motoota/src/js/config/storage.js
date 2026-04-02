/**
 * LocalStorage Persistence
 *
 * Manages application and device configuration using localStorage.
 * Falls back gracefully to defaults when storage is unavailable.
 */

/* ── Storage Keys ───────────────────────────────────────────────── */

const APP_CONFIG_KEY = 'motoota_app_config';
const DEVICE_CONFIG_KEY = 'motoota_device_config';

/* ── Default Configurations ─────────────────────────────────────── */

/** @type {AppConfig} */
const DEFAULT_APP_CONFIG = Object.freeze({
  server: 'production-global',
  region: 'Global',
  timeout: 30,
  maxRetries: 3,
  verifyMd5: true,
});

/** @type {DeviceConfig} */
const DEFAULT_DEVICE_CONFIG = Object.freeze({
  guid: '',
  carrier: '',
  triggeredBy: 'user',
  context: 'ota',
  model: '',
  serial: '',
});

/* ── Helpers ────────────────────────────────────────────────────── */

/**
 * Safely read and parse a JSON value from localStorage.
 * @param {string} key - Storage key
 * @returns {object|null} Parsed object or null on failure
 */
function readJSON(key) {
  try {
    const raw = localStorage.getItem(key);
    return raw ? JSON.parse(raw) : null;
  } catch {
    return null;
  }
}

/**
 * Safely write a JSON value to localStorage.
 * @param {string} key   - Storage key
 * @param {object} value - Object to persist
 */
function writeJSON(key, value) {
  try {
    localStorage.setItem(key, JSON.stringify(value));
  } catch {
    console.warn(`[storage] Failed to write key "${key}" to localStorage.`);
  }
}

/* ── App Config ─────────────────────────────────────────────────── */

/**
 * Load the application configuration, merging stored values over defaults.
 * @returns {AppConfig}
 */
export function loadAppConfig() {
  const stored = readJSON(APP_CONFIG_KEY);
  return { ...DEFAULT_APP_CONFIG, ...stored };
}

/**
 * Persist application configuration to localStorage.
 * @param {Partial<AppConfig>} config - Values to merge and store
 */
export function saveAppConfig(config) {
  const current = loadAppConfig();
  writeJSON(APP_CONFIG_KEY, { ...current, ...config });
}

/**
 * Reset the application configuration back to defaults.
 */
export function resetAppConfig() {
  writeJSON(APP_CONFIG_KEY, { ...DEFAULT_APP_CONFIG });
}

/* ── Device Config ──────────────────────────────────────────────── */

/**
 * Load the device configuration, merging stored values over defaults.
 * @returns {DeviceConfig}
 */
export function loadDeviceConfig() {
  const stored = readJSON(DEVICE_CONFIG_KEY);
  return { ...DEFAULT_DEVICE_CONFIG, ...stored };
}

/**
 * Persist device configuration to localStorage.
 * @param {Partial<DeviceConfig>} config - Values to merge and store
 */
export function saveDeviceConfig(config) {
  const current = loadDeviceConfig();
  writeJSON(DEVICE_CONFIG_KEY, { ...current, ...config });
}

/**
 * Reset the device configuration back to defaults.
 */
export function resetDeviceConfig() {
  writeJSON(DEVICE_CONFIG_KEY, { ...DEFAULT_DEVICE_CONFIG });
}
