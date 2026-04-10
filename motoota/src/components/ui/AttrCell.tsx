/* ── Attribute Cell — reusable key/value display with optional copy ── */

import { Copy } from 'lucide-react';
import { cn } from '@/lib/utils';

interface AttrCellProps {
  label: string;
  value: string;
  mono?: boolean;
  compact?: boolean;
  copy?: (v: string) => void;
}

export default function AttrCell({ label, value, mono, compact, copy }: AttrCellProps) {
  return (
    <div className={cn('rounded-lg bg-white/[0.02]', compact ? 'px-2.5 py-1.5' : 'px-3 py-2')}>
      <p className="text-[10px] uppercase tracking-wider text-gray-500">{label}</p>
      <div className="mt-0.5 flex items-center gap-1">
        <p className={cn('flex-1 truncate text-gray-200', mono && 'font-mono text-[11px]')}>
          {value || '—'}
        </p>
        {copy && value && (
          <button
            onClick={() => copy(value)}
            aria-label={`Copiar ${label}`}
            className="shrink-0 text-gray-500 transition-colors hover:text-white"
          >
            <Copy className="h-2.5 w-2.5" />
          </button>
        )}
      </div>
    </div>
  );
}
