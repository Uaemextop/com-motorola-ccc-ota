/* ── JSON Viewer with syntax coloring ────────────────────────── */

import { useMemo } from 'react';
import { cn } from '@/lib/utils';

interface JsonViewerProps {
  data: unknown;
  maxHeight?: string;
  className?: string;
  /** Accent color theme: 'blue' | 'emerald' | 'violet' | 'amber' */
  accent?: 'blue' | 'emerald' | 'violet' | 'amber';
}

/* Color‑code JSON tokens with inline <span>s.
   Fast string-based approach — no heavy library needed. */
function colorizeJson(json: string): string {
  return json.replace(
    /("(?:\\.|[^"\\])*")\s*(:)?|(\btrue\b|\bfalse\b)|(\bnull\b)|(-?\d+(?:\.\d+)?(?:[eE][+-]?\d+)?)/g,
    (match, str: string | undefined, colon: string | undefined, bool: string | undefined, nil: string | undefined, num: string | undefined) => {
      if (str) {
        if (colon) {
          // key
          return `<span class="json-key">${str}</span>:`;
        }
        // string value
        return `<span class="json-string">${str}</span>`;
      }
      if (bool) return `<span class="json-bool">${bool}</span>`;
      if (nil) return `<span class="json-null">${nil}</span>`;
      if (num) return `<span class="json-number">${num}</span>`;
      return match;
    },
  );
}

const ACCENT_BORDER: Record<string, string> = {
  blue: 'border-blue-500/20',
  emerald: 'border-emerald-500/20',
  violet: 'border-violet-500/20',
  amber: 'border-amber-500/20',
};

const ACCENT_BG: Record<string, string> = {
  blue: 'bg-blue-500/[0.04]',
  emerald: 'bg-emerald-500/[0.04]',
  violet: 'bg-violet-500/[0.04]',
  amber: 'bg-amber-500/[0.04]',
};

const ACCENT_GLOW: Record<string, string> = {
  blue: 'shadow-blue-500/5',
  emerald: 'shadow-emerald-500/5',
  violet: 'shadow-violet-500/5',
  amber: 'shadow-amber-500/5',
};

export default function JsonViewer({ data, maxHeight = '400px', className, accent = 'blue' }: JsonViewerProps) {
  const html = useMemo(() => {
    const raw = typeof data === 'string' ? data : JSON.stringify(data, null, 2);
    return colorizeJson(raw);
  }, [data]);

  return (
    <pre
      className={cn(
        'overflow-auto rounded-xl border p-4 font-mono text-xs leading-relaxed',
        'shadow-lg backdrop-blur-sm',
        ACCENT_BORDER[accent],
        ACCENT_BG[accent],
        ACCENT_GLOW[accent],
        className,
      )}
      style={{ maxHeight }}
      dangerouslySetInnerHTML={{ __html: html }}
    />
  );
}
