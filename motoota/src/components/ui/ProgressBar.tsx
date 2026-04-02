/* ── Progress Bar ───────────────────────────────────────────── */

import { motion } from 'framer-motion';
import { cn } from '@/lib/utils';

interface ProgressBarProps {
  value: number;
  max: number;
  className?: string;
  label?: string;
  showPercentage?: boolean;
}

export default function ProgressBar({
  value,
  max,
  className,
  label,
  showPercentage = true,
}: ProgressBarProps) {
  const percent = max > 0 ? Math.round((value / max) * 100) : 0;

  return (
    <div className={cn('w-full', className)}>
      {(label || showPercentage) && (
        <div className="mb-2 flex items-center justify-between text-sm">
          {label && <span className="text-gray-400">{label}</span>}
          {showPercentage && (
            <span className="font-mono text-blue-400">
              {value}/{max} ({percent}%)
            </span>
          )}
        </div>
      )}
      <div className="h-2 overflow-hidden rounded-full bg-white/5">
        <motion.div
          initial={{ width: 0 }}
          animate={{ width: `${percent}%` }}
          transition={{ duration: 0.3, ease: 'easeOut' }}
          className="h-full rounded-full bg-gradient-to-r from-blue-600 to-indigo-500"
        />
      </div>
    </div>
  );
}
