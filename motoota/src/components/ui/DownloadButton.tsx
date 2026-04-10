/* ── Download Button — consistent OTA download trigger ─────────── */

import { Download } from 'lucide-react';
import { cn } from '@/lib/utils';

interface DownloadButtonProps {
  url: string;
  filename: string;
  sizeMB?: string;
  compact?: boolean;
  onError?: () => void;
}

export default function DownloadButton({ url, filename, sizeMB, compact, onError }: DownloadButtonProps) {
  const handleClick = () => {
    if (!/^https?:\/\//i.test(url)) {
      onError?.();
      return;
    }
    window.open(url, '_blank', 'noopener,noreferrer');
  };

  return (
    <button
      onClick={handleClick}
      className={cn(
        'flex items-center justify-center gap-2 rounded-xl font-semibold',
        'bg-gradient-to-r from-emerald-600 to-green-600 text-white',
        'shadow-lg shadow-emerald-500/20 transition-all',
        'hover:shadow-emerald-500/30 hover:brightness-110',
        compact ? 'px-5 py-2 text-xs' : 'px-6 py-2.5 text-sm',
      )}
      aria-label={`Descargar ${filename}`}
    >
      <Download className={cn(compact ? 'h-3.5 w-3.5' : 'h-4 w-4')} />
      Descargar{sizeMB ? ` (${sizeMB} MB)` : ''}
    </button>
  );
}
