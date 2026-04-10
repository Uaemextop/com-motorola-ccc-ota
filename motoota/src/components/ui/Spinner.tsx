/* ── Animated Loading Spinner (CSS-only — no JS runtime overhead) ── */

import { cn } from '@/lib/utils';

interface SpinnerProps {
  size?: 'sm' | 'md' | 'lg';
  className?: string;
  label?: string;
}

const SIZES = { sm: 'h-5 w-5', md: 'h-8 w-8', lg: 'h-12 w-12' };

export default function Spinner({ size = 'md', className, label }: SpinnerProps) {
  return (
    <div className={cn('flex flex-col items-center gap-3', className)}>
      <div
        className={cn(SIZES[size], 'animate-spin rounded-full border-2 border-blue-500/20 border-t-blue-500')}
      />
      {label && (
        <p className="animate-fade-in text-sm text-gray-400">
          {label}
        </p>
      )}
    </div>
  );
}
