/* ── Glass Card Component ───────────────────────────────────── */

import { motion } from 'framer-motion';
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
    <motion.div
      initial={{ opacity: 0, y: 20 }}
      animate={{ opacity: 1, y: 0 }}
      transition={{ duration: 0.5, delay }}
      whileHover={hover ? { scale: 1.02, y: -4 } : undefined}
      className={cn(
        'rounded-2xl border border-white/5 bg-white/[0.03] p-6 backdrop-blur-sm',
        'shadow-[0_0_40px_rgba(0,0,0,0.3)]',
        'transition-colors duration-300',
        hover && 'cursor-pointer hover:border-blue-500/20 hover:bg-white/[0.05]',
        className,
      )}
    >
      {children}
    </motion.div>
  );
}
