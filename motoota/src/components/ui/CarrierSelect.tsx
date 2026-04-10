/* ── Searchable Carrier Selector ────────────────────────────── */

import { useState, useRef, useEffect, useMemo } from 'react';
import { motion, AnimatePresence } from 'framer-motion';
import { ChevronDown, Search, X } from 'lucide-react';
import { CARRIERS } from '@/lib/api/carriers';
import { cn } from '@/lib/utils';
import type { Carrier } from '@/lib/types';

interface CarrierSelectProps {
  value: string;
  onChange: (value: string) => void;
  error?: string;
}

const REGIONS = [...new Set(CARRIERS.map((c) => c.region))];

export default function CarrierSelect({ value, onChange, error }: CarrierSelectProps) {
  const [open, setOpen] = useState(false);
  const [query, setQuery] = useState('');
  const [activeRegion, setActiveRegion] = useState<string | null>(null);
  const containerRef = useRef<HTMLDivElement>(null);
  const inputRef = useRef<HTMLInputElement>(null);

  const selected = CARRIERS.find((c) => c.code === value);

  const filtered = useMemo(() => {
    const q = query.toLowerCase().trim();
    if (!q) return activeRegion ? CARRIERS.filter((c) => c.region === activeRegion) : [...CARRIERS];
    return CARRIERS.filter(
      (c) =>
        (c.code.toLowerCase().includes(q) || c.name.toLowerCase().includes(q) || c.region.toLowerCase().includes(q)) &&
        (!activeRegion || c.region === activeRegion),
    );
  }, [query, activeRegion]);

  const groupedByRegion = useMemo(() => {
    const groups: Record<string, Carrier[]> = {};
    for (const c of filtered) {
      (groups[c.region] ??= []).push(c);
    }
    return groups;
  }, [filtered]);

  useEffect(() => {
    const handleClickOutside = (e: MouseEvent) => {
      if (containerRef.current && !containerRef.current.contains(e.target as Node)) {
        setOpen(false);
      }
    };
    const handleKeyDown = (e: KeyboardEvent) => {
      if (e.key === 'Escape' && open) {
        setOpen(false);
      }
    };
    document.addEventListener('mousedown', handleClickOutside);
    document.addEventListener('keydown', handleKeyDown);
    return () => {
      document.removeEventListener('mousedown', handleClickOutside);
      document.removeEventListener('keydown', handleKeyDown);
    };
  }, [open]);

  useEffect(() => {
    if (open && inputRef.current) inputRef.current.focus();
  }, [open]);

  const handleSelect = (carrier: Carrier) => {
    onChange(carrier.code);
    setOpen(false);
    setQuery('');
  };

  return (
    <div ref={containerRef} className="relative">
      {/* Trigger button */}
      <button
        type="button"
        onClick={() => setOpen(!open)}
        className={cn(
          'flex w-full items-center justify-between rounded-xl border bg-white/[0.03] px-4 py-3 text-left text-sm',
          'transition-colors focus:outline-none focus:ring-2 focus:ring-blue-500/40',
          error ? 'border-red-500/40' : 'border-white/10',
          open && 'ring-2 ring-blue-500/40',
        )}
      >
        {selected ? (
          <div className="flex items-center gap-2 overflow-hidden">
            <span className="rounded bg-blue-500/10 px-1.5 py-0.5 font-mono text-xs text-blue-400">
              {selected.code}
            </span>
            <span className="truncate text-gray-300">{selected.name}</span>
            <span className="shrink-0 text-[10px] text-gray-600">{selected.region}</span>
          </div>
        ) : (
          <span className="text-gray-600">Selecciona un carrier...</span>
        )}
        <ChevronDown className={cn('h-4 w-4 shrink-0 text-gray-500 transition-transform', open && 'rotate-180')} />
      </button>

      {/* Dropdown */}
      <AnimatePresence>
        {open && (
          <motion.div
            initial={{ opacity: 0, y: -4, scale: 0.98 }}
            animate={{ opacity: 1, y: 0, scale: 1 }}
            exit={{ opacity: 0, y: -4, scale: 0.98 }}
            transition={{ duration: 0.15 }}
            className="absolute z-50 mt-1.5 w-full overflow-hidden rounded-xl border border-white/10 bg-[#0f0f18] shadow-2xl shadow-black/40"
          >
            {/* Search input */}
            <div className="relative border-b border-white/5 px-3 py-2">
              <Search className="absolute left-5 top-1/2 h-3.5 w-3.5 -translate-y-1/2 text-gray-500" />
              <input
                ref={inputRef}
                value={query}
                onChange={(e) => setQuery(e.target.value)}
                placeholder="Buscar carrier..."
                aria-label="Buscar carriers"
                className="w-full bg-transparent py-1 pl-7 pr-7 text-sm text-white placeholder:text-gray-500 focus:outline-none"
              />
              {query && (
                <button
                  type="button"
                  onClick={() => setQuery('')}
                  aria-label="Limpiar búsqueda"
                  className="absolute right-5 top-1/2 -translate-y-1/2 text-gray-500 hover:text-white"
                >
                  <X className="h-3.5 w-3.5" />
                </button>
              )}
            </div>

            {/* Region tabs */}
            <div className="scrollbar-none flex gap-1 overflow-x-auto border-b border-white/5 px-3 py-1.5">
              <button
                type="button"
                onClick={() => setActiveRegion(null)}
                className={cn(
                  'shrink-0 rounded-lg px-2.5 py-1 text-[10px] font-medium transition-colors',
                  !activeRegion ? 'bg-blue-500/20 text-blue-400' : 'text-gray-500 hover:text-gray-300',
                )}
              >
                Todos ({CARRIERS.length})
              </button>
              {REGIONS.map((region) => {
                const count = CARRIERS.filter((c) => c.region === region).length;
                return (
                  <button
                    key={region}
                    type="button"
                    onClick={() => setActiveRegion(activeRegion === region ? null : region)}
                    className={cn(
                      'shrink-0 rounded-lg px-2.5 py-1 text-[10px] font-medium transition-colors',
                      activeRegion === region ? 'bg-blue-500/20 text-blue-400' : 'text-gray-500 hover:text-gray-300',
                    )}
                  >
                    {region} ({count})
                  </button>
                );
              })}
            </div>

            {/* Carrier list */}
            <div className="max-h-64 overflow-y-auto">
              {filtered.length === 0 ? (
                <div className="px-4 py-6 text-center text-sm text-gray-500">
                  No se encontraron carriers
                </div>
              ) : (
                Object.entries(groupedByRegion).map(([region, carriers]) => (
                  <div key={region}>
                    <div className="sticky top-0 bg-[#0f0f18]/95 px-3 py-1.5 text-[10px] font-semibold uppercase tracking-wider text-gray-500 backdrop-blur-sm">
                      {region} ({carriers.length})
                    </div>
                    {carriers.map((carrier) => (
                      <button
                        key={carrier.code}
                        type="button"
                        onClick={() => handleSelect(carrier)}
                        className={cn(
                          'flex w-full items-center gap-3 px-3 py-2 text-left text-sm transition-colors hover:bg-white/5',
                          value === carrier.code && 'bg-blue-500/10',
                        )}
                      >
                        <span
                          className={cn(
                            'rounded px-1.5 py-0.5 font-mono text-xs',
                            value === carrier.code
                              ? 'bg-blue-500/20 text-blue-400'
                              : 'bg-white/5 text-gray-400',
                          )}
                        >
                          {carrier.code}
                        </span>
                        <span className="flex-1 truncate text-gray-300">{carrier.name}</span>
                      </button>
                    ))}
                  </div>
                ))
              )}
            </div>

            {/* Footer */}
            <div className="border-t border-white/5 px-3 py-1.5 text-center text-[10px] text-gray-600">
              {filtered.length} de {CARRIERS.length} carriers
            </div>
          </motion.div>
        )}
      </AnimatePresence>
    </div>
  );
}
