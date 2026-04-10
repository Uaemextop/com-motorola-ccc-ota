/* ── Release Notes — collapsible release notes display ─────────── */

import { useState } from 'react';
import { motion, AnimatePresence } from 'framer-motion';
import { FileText, ChevronDown } from 'lucide-react';
import { cn, sanitizeReleaseNotes } from '@/lib/utils';

interface ReleaseNotesProps {
  html: string;
  defaultOpen?: boolean;
}

export default function ReleaseNotes({ html, defaultOpen = false }: ReleaseNotesProps) {
  const [open, setOpen] = useState(defaultOpen);

  if (!html) return null;

  return (
    <div>
      <button
        onClick={() => setOpen(!open)}
        aria-expanded={open}
        className="flex w-full items-center justify-between text-sm"
      >
        <span className="flex items-center gap-2 font-semibold text-gray-300">
          <FileText className="h-4 w-4 text-violet-400" />
          Notas de la versión
        </span>
        <ChevronDown
          className={cn('h-4 w-4 text-gray-500 transition-transform', open && 'rotate-180')}
        />
      </button>
      <AnimatePresence>
        {open && (
          <motion.div
            initial={{ height: 0, opacity: 0 }}
            animate={{ height: 'auto', opacity: 1 }}
            exit={{ height: 0, opacity: 0 }}
            className="mt-3 overflow-hidden rounded-lg border border-white/5 bg-black/20 p-4"
          >
            <div
              className="prose prose-sm prose-invert max-w-none [&_h3]:text-base [&_h3]:font-semibold [&_h3]:text-violet-300 [&_p]:text-sm [&_p]:text-gray-300 [&_p]:leading-relaxed"
              dangerouslySetInnerHTML={{ __html: sanitizeReleaseNotes(html) }}
            />
          </motion.div>
        )}
      </AnimatePresence>
    </div>
  );
}
