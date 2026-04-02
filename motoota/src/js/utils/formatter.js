import dayjs from 'dayjs';

/**
 * Format a byte count into a human-readable string.
 * @param {number} bytes - Raw byte count.
 * @returns {string} Formatted size (e.g. "123.45 MB").
 */
export function formatBytes(bytes) {
  if (bytes === 0) return '0 B';
  const units = ['B', 'KB', 'MB', 'GB', 'TB'];
  const k = 1024;
  const i = Math.floor(Math.log(Math.abs(bytes)) / Math.log(k));
  const index = Math.min(i, units.length - 1);
  return (bytes / Math.pow(k, index)).toFixed(2) + ' ' + units[index];
}

/**
 * Clean and normalise a version string for display.
 * Strips leading/trailing whitespace and collapses internal runs of whitespace.
 * @param {string} version - Raw version string.
 * @returns {string} Cleaned version string.
 */
export function formatVersion(version) {
  if (!version) return '';
  return String(version).trim().replace(/\s+/g, ' ');
}

/**
 * Convert a duration in milliseconds to a human-friendly string.
 * @param {number} ms - Duration in milliseconds.
 * @returns {string} Formatted duration (e.g. "2m 30s").
 */
export function formatDuration(ms) {
  if (ms < 0) ms = 0;
  const totalSeconds = Math.floor(ms / 1000);
  const hours = Math.floor(totalSeconds / 3600);
  const minutes = Math.floor((totalSeconds % 3600) / 60);
  const seconds = totalSeconds % 60;

  const parts = [];
  if (hours > 0) parts.push(`${hours}h`);
  if (minutes > 0) parts.push(`${minutes}m`);
  if (seconds > 0 || parts.length === 0) parts.push(`${seconds}s`);
  return parts.join(' ');
}

/**
 * Format a date value using dayjs.
 * @param {string|number|Date} date - Any value accepted by dayjs.
 * @param {string} [template='YYYY-MM-DD HH:mm:ss'] - dayjs format template.
 * @returns {string} Formatted date string.
 */
export function formatDate(date, template = 'YYYY-MM-DD HH:mm:ss') {
  const d = dayjs(date);
  return d.isValid() ? d.format(template) : '';
}

/**
 * Truncate a string to a maximum length, appending "..." when truncated.
 * @param {string} str - Input string.
 * @param {number} [maxLen=80] - Maximum allowed length (including ellipsis).
 * @returns {string} Truncated string.
 */
export function truncate(str, maxLen = 80) {
  if (!str) return '';
  const s = String(str);
  if (s.length <= maxLen) return s;
  return s.slice(0, maxLen - 3) + '...';
}

/**
 * Convert a string into a URL-safe slug.
 * @param {string} str - Input string.
 * @returns {string} Slugified string (lowercase, hyphens instead of spaces/special chars).
 */
export function slugify(str) {
  if (!str) return '';
  return String(str)
    .toLowerCase()
    .trim()
    .replace(/[^\w\s-]/g, '')
    .replace(/[\s_]+/g, '-')
    .replace(/-+/g, '-')
    .replace(/^-|-$/g, '');
}
