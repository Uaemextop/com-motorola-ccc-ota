/* ── Resource URL List — display content resource download URLs ─── */

import { ExternalLink, Copy, Clock } from 'lucide-react';
import type { ContentResource } from '@/lib/types';

interface ResourceUrlListProps {
  resources: ContentResource[];
  compact?: boolean;
  onCopy?: (url: string) => void;
}

export default function ResourceUrlList({ resources, compact, onCopy }: ResourceUrlListProps) {
  if (resources.length === 0) return null;

  return (
    <div className="space-y-1">
      {resources.map((resource, i) => (
        <div
          key={i}
          className={`flex items-center gap-2 rounded-lg bg-white/[0.02] px-3 ${compact ? 'py-1.5 text-[11px]' : 'py-2 text-xs'}`}
        >
          <div className="flex items-center gap-1">
            {resource.tags.map((tag) => (
              <span
                key={tag}
                className="rounded-full bg-blue-500/10 px-1.5 py-0.5 text-[10px] font-medium text-blue-400"
              >
                {tag}
              </span>
            ))}
          </div>
          <a
            href={resource.url}
            target="_blank"
            rel="noopener noreferrer"
            className="flex-1 truncate font-mono text-gray-400 transition-colors hover:text-blue-400"
          >
            {resource.url}
          </a>
          {resource.urlTtlSeconds > 0 && (
            <span className="flex shrink-0 items-center gap-0.5 text-gray-600">
              <Clock className="h-2.5 w-2.5" />
              {Math.round(resource.urlTtlSeconds / 60)}m
            </span>
          )}
          <a
            href={resource.url}
            target="_blank"
            rel="noopener noreferrer"
            className="shrink-0 text-gray-500 transition-colors hover:text-white"
            aria-label="Abrir URL en nueva pestaña"
          >
            <ExternalLink className="h-3 w-3" />
          </a>
          {onCopy && (
            <button
              onClick={() => onCopy(resource.url)}
              className="shrink-0 text-gray-500 transition-colors hover:text-white"
              aria-label="Copiar URL"
            >
              <Copy className="h-3 w-3" />
            </button>
          )}
        </div>
      ))}
    </div>
  );
}
