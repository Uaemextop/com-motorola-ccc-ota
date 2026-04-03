/* ── Utility Functions ──────────────────────────────────────── */

import { clsx, type ClassValue } from 'clsx';
import { twMerge } from 'tailwind-merge';

/** Merge Tailwind classes safely */
export function cn(...inputs: ClassValue[]) {
  return twMerge(clsx(inputs));
}

/** Format bytes to human-readable string */
export function formatBytes(bytes: number): string {
  if (bytes === 0) return '0 B';
  const k = 1024;
  const sizes = ['B', 'KB', 'MB', 'GB'];
  const i = Math.floor(Math.log(bytes) / Math.log(k));
  return `${(bytes / Math.pow(k, i)).toFixed(2)} ${sizes[i]}`;
}

/** Validate GUID format (15 hex chars) */
export function isValidGuid(guid: string): boolean {
  return /^[0-9a-fA-F]{7,20}$/.test(guid.trim());
}

/** Truncate text */
export function truncate(text: string, len: number): string {
  return text.length > len ? text.slice(0, len) + '…' : text;
}

/** Capitalize first letter */
export function capitalize(s: string): string {
  return s.charAt(0).toUpperCase() + s.slice(1);
}

/** Build a human-readable download filename for an OTA package */
export function buildDownloadFilename(
  targetVersion: string,
  carrier: string,
  step?: number,
): string {
  const sanitized = targetVersion.replace(/[^a-zA-Z0-9._-]/g, '_');
  const prefix = step !== undefined ? `step${String(step + 1).padStart(2, '0')}_` : '';
  return `${prefix}${sanitized}_${carrier}.zip`;
}

/* ── Sanitize release notes HTML ─────────────────────────────── */
const ALLOWED_TAGS = new Set([
  'h1', 'h2', 'h3', 'h4', 'p', 'br', 'b', 'i', 'strong', 'em', 'ul', 'ol', 'li', 'a',
]);

/** Recursively strip disallowed HTML tags, keeping only safe content. */
export function sanitizeReleaseNotes(html: string): string {
  const doc = new DOMParser().parseFromString(html, 'text/html');
  function walk(node: Node): string {
    if (node.nodeType === Node.TEXT_NODE) return node.textContent ?? '';
    if (node.nodeType !== Node.ELEMENT_NODE) return '';
    const el = node as Element;
    const tag = el.tagName.toLowerCase();
    if (!ALLOWED_TAGS.has(tag)) {
      let inner = '';
      el.childNodes.forEach((c) => { inner += walk(c); });
      return inner;
    }
    let inner = '';
    el.childNodes.forEach((c) => { inner += walk(c); });
    if (tag === 'br') return '<br/>';
    return `<${tag}>${inner}</${tag}>`;
  }
  let result = '';
  doc.body.childNodes.forEach((c) => { result += walk(c); });
  return result;
}
