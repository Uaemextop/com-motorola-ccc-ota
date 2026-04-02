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
