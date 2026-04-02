import { cn } from '@/lib/cn';

const styles = {
  open: 'bg-green-500/15 text-green-400 border-green-500/30',
  whitelisted: 'bg-yellow-500/15 text-yellow-400 border-yellow-500/30',
  'no-content': 'bg-red-500/15 text-red-400 border-red-500/30',
  error: 'bg-red-500/15 text-red-400 border-red-500/30',
  active: 'bg-green-500/15 text-green-400 border-green-500/30',
  inactive: 'bg-slate-500/15 text-slate-400 border-slate-500/30',
};

export default function StatusBadge({ status, className }) {
  return (
    <span className={cn('inline-flex px-2 py-0.5 text-xs font-semibold rounded-full border uppercase', styles[status] || styles['no-content'], className)}>
      {status}
    </span>
  );
}
