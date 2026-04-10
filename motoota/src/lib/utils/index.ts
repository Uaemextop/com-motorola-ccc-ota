/* ── Utility Functions ──────────────────────────────────────── */

import { clsx, type ClassValue } from 'clsx';
import { twMerge } from 'tailwind-merge';

/** Merge Tailwind classes safely */
export function cn(...inputs: ClassValue[]) {
  return twMerge(clsx(inputs));
}

/** Format bytes to human-readable string */
export function formatBytes(bytes: number): string {
  if (!Number.isFinite(bytes) || bytes < 0) return '0 B';
  if (bytes === 0) return '0 B';
  const k = 1024;
  const sizes = ['B', 'KB', 'MB', 'GB'];
  const i = Math.min(Math.floor(Math.log(bytes) / Math.log(k)), sizes.length - 1);
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

/** Download a cross-origin file by opening it in a new tab */
export function downloadFile(url: string, _filename: string): Promise<void> {
  if (!/^https?:\/\//i.test(url)) {
    return Promise.reject(new Error('Invalid URL scheme — only HTTP/HTTPS allowed'));
  }
  window.open(url, '_blank', 'noopener,noreferrer');
  return Promise.resolve();
}

/** Copy text to clipboard with fallback for older browsers */
export async function copyToClipboard(text: string): Promise<boolean> {
  try {
    if (navigator.clipboard && window.isSecureContext) {
      await navigator.clipboard.writeText(text);
      return true;
    }
    // Legacy fallback for browsers without Clipboard API (deprecated but intentional)
    const textarea = document.createElement('textarea');
    textarea.value = text;
    textarea.style.position = 'fixed';
    textarea.style.opacity = '0';
    textarea.style.left = '-9999px';
    document.body.appendChild(textarea);
    textarea.select();
    const success = document.execCommand('copy');
    document.body.removeChild(textarea);
    return success;
  } catch {
    return false;
  }
}

/* ── Sanitize release notes HTML ─────────────────────────────── */
const ALLOWED_TAGS = new Set([
  'h1', 'h2', 'h3', 'h4', 'p', 'br', 'b', 'i', 'strong', 'em', 'ul', 'ol', 'li', 'a',
]);

const ALLOWED_ATTRS: Record<string, Set<string>> = {
  a: new Set(['href']),
};

/** Recursively strip disallowed HTML tags, keeping only safe content. */
export function sanitizeReleaseNotes(html: string): string {
  if (!html || typeof html !== 'string') return '';
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
    // Preserve allowed attributes (e.g. href on <a>)
    const allowedSet = ALLOWED_ATTRS[tag];
    let attrs = '';
    if (allowedSet) {
      for (const attr of allowedSet) {
        const val = el.getAttribute(attr);
        if (val != null) {
          // Only allow safe URL schemes for href
          if (attr === 'href' && !/^https?:\/\//i.test(val)) continue;
          attrs += ` ${attr}="${val.replace(/"/g, '&quot;')}"`;
        }
      }
    }
    return `<${tag}${attrs}>${inner}</${tag}>`;
  }
  let result = '';
  doc.body.childNodes.forEach((c) => { result += walk(c); });
  return result;
}

/* ── CSV Export ───────────────────────────────────────────────── */

/** Export scan results to CSV and trigger download */
export function exportScanResultsToCsv(
  results: Array<{
    carrier: { code: string; name: string; region: string };
    status: string;
    response: { content?: { targetVersion?: string; sizeBytes?: number; updateType?: string; model?: string; md5?: string } | null } | null;
    chain?: Array<{ content?: { targetVersion?: string } | null }>;
    error: string | null;
  }>,
  guid: string,
): void {
  const header = 'Carrier,Name,Region,Status,Target Version,Size (MB),Update Type,Model,MD5,Chain Steps,Error';
  const rows = results.map((r) => {
    const c = r.response?.content;
    return [
      r.carrier.code,
      `"${r.carrier.name.replace(/"/g, '""')}"`,
      r.carrier.region,
      r.status,
      c?.targetVersion || '',
      c?.sizeBytes ? (c.sizeBytes / (1024 * 1024)).toFixed(2) : '',
      c?.updateType || '',
      c?.model || '',
      c?.md5 || '',
      r.chain?.length || 0,
      r.error ? `"${r.error.replace(/"/g, '""')}"` : '',
    ].join(',');
  });

  const csv = [header, ...rows].join('\n');
  const blob = new Blob([csv], { type: 'text/csv;charset=utf-8;' });
  const url = URL.createObjectURL(blob);
  const link = document.createElement('a');
  link.href = url;
  link.download = `motoota-scan-${guid.replace(/[^a-zA-Z0-9]/g, '').slice(0, 20)}-${new Date().toISOString().slice(0, 10)}.csv`;
  document.body.appendChild(link);
  link.click();
  document.body.removeChild(link);
  URL.revokeObjectURL(url);
}

/** Format a duration in seconds to a human-readable string */
export function formatDuration(seconds: number): string {
  if (seconds < 60) return `${seconds}s`;
  const mins = Math.floor(seconds / 60);
  const secs = seconds % 60;
  return secs > 0 ? `${mins}m ${secs}s` : `${mins}m`;
}
