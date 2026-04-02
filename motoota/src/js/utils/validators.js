import DOMPurify from 'dompurify';
import { CARRIERS } from '../config/carriers.js';

const GUID_PATTERN = /^[0-9a-fA-F]{15,}$/;

/**
 * Validate that a GUID is a hex string of at least 15 characters.
 * @param {string} guid - The GUID to validate.
 * @returns {boolean} True when the GUID is valid.
 */
export function isValidGuid(guid) {
  if (typeof guid !== 'string') return false;
  return GUID_PATTERN.test(guid.trim());
}

/**
 * Check whether a carrier code exists in the known carrier list.
 * @param {string} code - Carrier code to look up.
 * @returns {boolean} True when the code matches a known carrier.
 */
export function isValidCarrier(code) {
  if (typeof code !== 'string' || !code.trim()) return false;
  return CARRIERS.some(c => c.code === code.trim());
}

/**
 * Sanitise arbitrary user input via DOMPurify to prevent XSS.
 * @param {string} input - Untrusted input string.
 * @returns {string} Sanitised string safe for DOM insertion.
 */
export function sanitizeInput(input) {
  if (typeof input !== 'string') return '';
  return DOMPurify.sanitize(input, { ALLOWED_TAGS: [], ALLOWED_ATTR: [] });
}

/**
 * Validate an application configuration object.
 * @param {object} config - Configuration to validate.
 * @returns {{ valid: boolean, errors: string[] }} Validation result.
 */
export function validateConfig(config) {
  const errors = [];

  if (!config || typeof config !== 'object') {
    return { valid: false, errors: ['Config must be a non-null object'] };
  }

  const VALID_SERVERS = [
    'production-global',
    'production-prc',
    'staging',
    'qa',
    'dev',
    'blurdev',
  ];

  if (config.server && !VALID_SERVERS.includes(config.server)) {
    errors.push(`Invalid server "${config.server}". Must be one of: ${VALID_SERVERS.join(', ')}`);
  }

  if (config.timeout !== undefined) {
    if (typeof config.timeout !== 'number' || config.timeout <= 0) {
      errors.push('Timeout must be a positive number (seconds)');
    }
  }

  if (config.maxRetries !== undefined) {
    if (!Number.isInteger(config.maxRetries) || config.maxRetries < 0) {
      errors.push('maxRetries must be a non-negative integer');
    }
  }

  if (config.region !== undefined) {
    if (typeof config.region !== 'string' || config.region.trim().length === 0) {
      errors.push('Region must be a non-empty string');
    }
  }

  return { valid: errors.length === 0, errors };
}
