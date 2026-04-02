/**
 * Create a debounced wrapper around an async function.
 * Only the most recent invocation within the delay window will execute.
 * @param {Function} fn - Async function to debounce.
 * @param {number} delay - Debounce delay in milliseconds.
 * @returns {Function} Debounced function that returns a Promise.
 */
export function debounceAsync(fn, delay) {
  let timer = null;
  let pendingReject = null;

  return function (...args) {
    if (timer) {
      clearTimeout(timer);
      pendingReject?.('debounced');
    }

    return new Promise((resolve, reject) => {
      pendingReject = reject;
      timer = setTimeout(async () => {
        timer = null;
        pendingReject = null;
        try {
          resolve(await fn.apply(this, args));
        } catch (err) {
          reject(err);
        }
      }, delay);
    });
  };
}

/**
 * Group an array of objects by a key or accessor function.
 * @param {Array} array - Items to group.
 * @param {string|Function} key - Property name or accessor function.
 * @returns {Object} Object keyed by group name, values are arrays of items.
 */
export function groupBy(array, key) {
  if (!Array.isArray(array)) return {};
  const accessor = typeof key === 'function' ? key : (item) => item[key];

  return array.reduce((groups, item) => {
    const group = String(accessor(item) ?? 'undefined');
    (groups[group] ??= []).push(item);
    return groups;
  }, {});
}

/**
 * Sort an array of objects by a key.
 * Returns a new array — the original is not mutated.
 * @param {Array} array - Items to sort.
 * @param {string} key - Property name to sort by.
 * @param {'asc'|'desc'} [direction='asc'] - Sort direction.
 * @returns {Array} New sorted array.
 */
export function sortBy(array, key, direction = 'asc') {
  if (!Array.isArray(array)) return [];
  const modifier = direction === 'desc' ? -1 : 1;

  return [...array].sort((a, b) => {
    const aVal = a[key];
    const bVal = b[key];

    if (aVal == null && bVal == null) return 0;
    if (aVal == null) return 1;
    if (bVal == null) return -1;

    if (typeof aVal === 'string' && typeof bVal === 'string') {
      return modifier * aVal.localeCompare(bVal);
    }
    return modifier * (aVal > bVal ? 1 : aVal < bVal ? -1 : 0);
  });
}

/**
 * Create a minimal pub/sub event emitter.
 * @returns {{ on: Function, off: Function, emit: Function }}
 */
export function createEventEmitter() {
  const listeners = {};

  return {
    on(event, callback) {
      (listeners[event] ??= []).push(callback);
    },

    off(event, callback) {
      if (!listeners[event]) return;
      listeners[event] = listeners[event].filter(cb => cb !== callback);
    },

    emit(event, ...args) {
      if (!listeners[event]) return;
      for (const cb of listeners[event]) {
        cb(...args);
      }
    },
  };
}

/**
 * Generate a random alphanumeric ID.
 * @param {number} [length=12] - Desired ID length.
 * @returns {string} Random string ID.
 */
export function generateId(length = 12) {
  const chars = 'ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789';
  let id = '';
  const values = crypto.getRandomValues(new Uint32Array(length));
  for (let i = 0; i < length; i++) {
    id += chars[values[i] % chars.length];
  }
  return id;
}

/**
 * Copy text to the clipboard using the Clipboard API.
 * @param {string} text - Text to copy.
 * @returns {Promise<void>}
 */
export async function copyToClipboard(text) {
  if (navigator.clipboard?.writeText) {
    return navigator.clipboard.writeText(text);
  }
  // Fallback for older browsers
  const textarea = document.createElement('textarea');
  textarea.value = text;
  textarea.style.position = 'fixed';
  textarea.style.opacity = '0';
  document.body.appendChild(textarea);
  textarea.select();
  document.execCommand('copy');
  document.body.removeChild(textarea);
}

/**
 * Trigger a file download from a Blob.
 * @param {Blob} blob - Data to download.
 * @param {string} filename - Suggested filename.
 */
export function downloadBlob(blob, filename) {
  const url = URL.createObjectURL(blob);
  const anchor = document.createElement('a');
  anchor.href = url;
  anchor.download = filename;
  document.body.appendChild(anchor);
  anchor.click();
  document.body.removeChild(anchor);
  URL.revokeObjectURL(url);
}
