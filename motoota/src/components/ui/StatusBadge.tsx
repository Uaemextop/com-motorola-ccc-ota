/* ── Status Badge ───────────────────────────────────────────── */

import { cn } from '@/lib/utils';
import type { CarrierStatus } from '@/lib/types';

const STATUS_STYLES: Record<CarrierStatus, { bg: string; text: string; label: string }> = {
  open: { bg: 'bg-emerald-500/10', text: 'text-emerald-400', label: 'Abierto' },
  whitelisted: { bg: 'bg-amber-500/10', text: 'text-amber-400', label: 'Whitelisted' },
  'no-content': { bg: 'bg-gray-500/10', text: 'text-gray-400', label: 'Sin contenido' },
  error: { bg: 'bg-red-500/10', text: 'text-red-400', label: 'Error' },
};

interface StatusBadgeProps {
  status: CarrierStatus;
  className?: string;
}

export default function StatusBadge({ status, className }: StatusBadgeProps) {
  const style = STATUS_STYLES[status] || STATUS_STYLES['no-content'];
  return (
    <span
      className={cn(
        'inline-flex items-center gap-1.5 rounded-full px-2.5 py-1 text-xs font-medium',
        style.bg,
        style.text,
        className,
      )}
    >
      <span className={cn('h-1.5 w-1.5 rounded-full', style.text.replace('text-', 'bg-'))} />
      {style.label}
    </span>
  );
}
