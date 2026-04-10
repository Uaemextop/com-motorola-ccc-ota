/* ── Glass Card Component ───────────────────────────────────── */

import { cn } from '@/lib/utils';
import type { ReactNode } from 'react';

interface GlassCardProps {
  children: ReactNode;
  className?: string;
  hover?: boolean;
  delay?: number;
}

export default function GlassCard({ children, className, hover = false, delay = 0 }: GlassCardProps) {
  return (
    <div
      className={cn(
        'rounded-2xl border border-white/5 bg-white/[0.03] p-6',
        'shadow-[0_0_40px_rgba(0,0,0,0.3)]',
        'transition-all duration-300 animate-fade-in',
        'contain-inline-size contain-style',
        hover && 'cursor-pointer hover:border-blue-500/20 hover:bg-white/[0.05] hover:scale-[1.02] hover:-translate-y-1',
        className,
      )}
      style={delay > 0 ? { animationDelay: `${delay}s` } : undefined}
    >
      {children}
    </div>
  );
}
