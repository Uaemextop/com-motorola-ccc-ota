/* ── Searchable Carrier Selector (virtualized) ─────────────── */

import { useState, useRef, useEffect, useMemo, useCallback } from 'react';
import { ChevronDown, Search, X } from 'lucide-react';
import { CARRIERS } from '@/lib/api/carriers';
import { cn } from '@/lib/utils';
import type { Carrier } from '@/lib/types';

interface CarrierSelectProps {
  value: string;
  onChange: (value: string) => void;
  error?: string;
}

/* Precomputed constants — computed once at module load */
const REGIONS = [...new Set(CARRIERS.map((c) => c.region))];
const REGION_COUNTS: Record<string, number> = {};
for (const c of CARRIERS) REGION_COUNTS[c.region] = (REGION_COUNTS[c.region] ?? 0) + 1;

/* Fast lookup map: code → Carrier */
const CARRIER_MAP = new Map<string, Carrier>();
for (const c of CARRIERS) CARRIER_MAP.set(c.code, c);

/* ── Flat-list item types for virtual rendering ──────────── */
type HeaderItem = { kind: 'header'; region: string; count: number };
type CarrierItem = { kind: 'carrier'; carrier: Carrier };
type FlatItem = HeaderItem | CarrierItem;

const ITEM_HEIGHT = 36;   // px — carrier row height
const HEADER_HEIGHT = 28; // px — region header height
const VIEWPORT_HEIGHT = 256; // max-h-64 = 16rem = 256px

export default function CarrierSelect({ value, onChange, error }: CarrierSelectProps) {
  const [open, setOpen] = useState(false);
  const [query, setQuery] = useState('');
  const [activeRegion, setActiveRegion] = useState<string | null>(null);
  const [highlightIdx, setHighlightIdx] = useState(-1);
  const containerRef = useRef<HTMLDivElement>(null);
  const inputRef = useRef<HTMLInputElement>(null);
  const listRef = useRef<HTMLDivElement>(null);
  const [scrollTop, setScrollTop] = useState(0);

  const selected = CARRIER_MAP.get(value);

  /* ── Filtered + flat list ─────────────────────────────────── */
  const filtered = useMemo(() => {
    const q = query.toLowerCase().trim();
    if (!q && !activeRegion) return [...CARRIERS];
    return CARRIERS.filter((c) => {
      if (activeRegion && c.region !== activeRegion) return false;
      if (!q) return true;
      return c.code.toLowerCase().includes(q) || c.name.toLowerCase().includes(q) || c.region.toLowerCase().includes(q);
    });
  }, [query, activeRegion]);

  const flatItems = useMemo<FlatItem[]>(() => {
    const items: FlatItem[] = [];
    let currentRegion = '';
    const regionCounts: Record<string, number> = {};
    for (const c of filtered) regionCounts[c.region] = (regionCounts[c.region] ?? 0) + 1;
    for (const c of filtered) {
      if (c.region !== currentRegion) {
        currentRegion = c.region;
        items.push({ kind: 'header', region: c.region, count: regionCounts[c.region] });
      }
      items.push({ kind: 'carrier', carrier: c });
    }
    return items;
  }, [filtered]);

  /* Only carrier items for keyboard navigation */
  const carrierIndices = useMemo(
    () => flatItems.reduce<number[]>((acc, item, i) => (item.kind === 'carrier' ? [...acc, i] : acc), []),
    [flatItems],
  );

  /* ── Virtual scroll computation ───────────────────────────── */
  const itemOffsets = useMemo(() => {
    const offsets: number[] = [];
    let y = 0;
    for (const item of flatItems) {
      offsets.push(y);
      y += item.kind === 'header' ? HEADER_HEIGHT : ITEM_HEIGHT;
    }
    return offsets;
  }, [flatItems]);

  const totalHeight = useMemo(() => {
    if (flatItems.length === 0) return 0;
    const last = flatItems[flatItems.length - 1];
    return itemOffsets[itemOffsets.length - 1] + (last.kind === 'header' ? HEADER_HEIGHT : ITEM_HEIGHT);
  }, [flatItems, itemOffsets]);

  const visibleRange = useMemo(() => {
    const overscan = 5;
    let start = 0;
    let end = flatItems.length;
    // binary search for start
    let lo = 0, hi = flatItems.length - 1;
    while (lo <= hi) {
      const mid = (lo + hi) >>> 1;
      const itemBottom = itemOffsets[mid] + (flatItems[mid].kind === 'header' ? HEADER_HEIGHT : ITEM_HEIGHT);
      if (itemBottom <= scrollTop) lo = mid + 1;
      else hi = mid - 1;
    }
    start = Math.max(0, lo - overscan);
    // find end
    lo = start;
    hi = flatItems.length - 1;
    while (lo <= hi) {
      const mid = (lo + hi) >>> 1;
      if (itemOffsets[mid] >= scrollTop + VIEWPORT_HEIGHT) hi = mid - 1;
      else lo = mid + 1;
    }
    end = Math.min(flatItems.length, lo + overscan);
    return { start, end };
  }, [flatItems, itemOffsets, scrollTop]);

  /* ── Scroll handler ───────────────────────────────────────── */
  const handleScroll = useCallback(() => {
    if (listRef.current) setScrollTop(listRef.current.scrollTop);
  }, []);

  /* ── Click-outside + Escape ───────────────────────────────── */
  useEffect(() => {
    if (!open) return;
    const handleClickOutside = (e: MouseEvent) => {
      if (containerRef.current && !containerRef.current.contains(e.target as Node)) {
        setOpen(false);
      }
    };
    document.addEventListener('mousedown', handleClickOutside);
    return () => document.removeEventListener('mousedown', handleClickOutside);
  }, [open]);

  useEffect(() => {
    if (open && inputRef.current) {
      inputRef.current.focus();
      setHighlightIdx(-1);
      setScrollTop(0);
    }
  }, [open]);

  /* ── Keyboard navigation ──────────────────────────────────── */
  const scrollToIndex = useCallback((idx: number) => {
    if (!listRef.current || idx < 0 || idx >= flatItems.length) return;
    const top = itemOffsets[idx];
    const height = flatItems[idx].kind === 'header' ? HEADER_HEIGHT : ITEM_HEIGHT;
    const st = listRef.current.scrollTop;
    if (top < st) listRef.current.scrollTop = top;
    else if (top + height > st + VIEWPORT_HEIGHT) listRef.current.scrollTop = top + height - VIEWPORT_HEIGHT;
  }, [flatItems, itemOffsets]);

  const handleKeyDown = useCallback((e: React.KeyboardEvent) => {
    if (!open) {
      if (e.key === 'Enter' || e.key === ' ' || e.key === 'ArrowDown') {
        e.preventDefault();
        setOpen(true);
      }
      return;
    }

    switch (e.key) {
      case 'Escape':
        e.preventDefault();
        setOpen(false);
        break;
      case 'ArrowDown': {
        e.preventDefault();
        const currentCarrierPos = carrierIndices.indexOf(highlightIdx);
        const nextPos = currentCarrierPos < 0 ? 0 : Math.min(currentCarrierPos + 1, carrierIndices.length - 1);
        const nextIdx = carrierIndices[nextPos];
        if (nextIdx !== undefined) {
          setHighlightIdx(nextIdx);
          scrollToIndex(nextIdx);
        }
        break;
      }
      case 'ArrowUp': {
        e.preventDefault();
        const currentCarrierPos = carrierIndices.indexOf(highlightIdx);
        const prevPos = currentCarrierPos <= 0 ? 0 : currentCarrierPos - 1;
        const prevIdx = carrierIndices[prevPos];
        if (prevIdx !== undefined) {
          setHighlightIdx(prevIdx);
          scrollToIndex(prevIdx);
        }
        break;
      }
      case 'Enter': {
        e.preventDefault();
        if (highlightIdx >= 0 && highlightIdx < flatItems.length) {
          const item = flatItems[highlightIdx];
          if (item.kind === 'carrier') handleSelect(item.carrier);
        }
        break;
      }
    }
  }, [open, highlightIdx, carrierIndices, flatItems, scrollToIndex]);

  const handleSelect = useCallback((carrier: Carrier) => {
    onChange(carrier.code);
    setOpen(false);
    setQuery('');
    setActiveRegion(null);
  }, [onChange]);

  return (
    <div ref={containerRef} className="relative" onKeyDown={handleKeyDown}>
      {/* Trigger button */}
      <button
        type="button"
        onClick={() => setOpen(!open)}
        aria-haspopup="listbox"
        aria-expanded={open}
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

      {/* Dropdown — CSS transition instead of framer-motion for perf */}
      {open && (
        <div
          className="absolute z-50 mt-1.5 w-full overflow-hidden rounded-xl border border-white/10 bg-[#0f0f18] shadow-2xl shadow-black/40 animate-fade-in"
          role="listbox"
        >
          {/* Search input */}
          <div className="relative border-b border-white/5 px-3 py-2">
            <Search className="absolute left-5 top-1/2 h-3.5 w-3.5 -translate-y-1/2 text-gray-500" />
            <input
              ref={inputRef}
              value={query}
              onChange={(e) => { setQuery(e.target.value); setHighlightIdx(-1); }}
              placeholder="Buscar carrier..."
              aria-label="Buscar carriers"
              className="w-full bg-transparent py-1 pl-7 pr-7 text-sm text-white placeholder:text-gray-500 focus:outline-none"
            />
            {query && (
              <button
                type="button"
                onClick={() => { setQuery(''); setHighlightIdx(-1); }}
                aria-label="Limpiar búsqueda"
                className="absolute right-5 top-1/2 -translate-y-1/2 text-gray-500 hover:text-white"
              >
                <X className="h-3.5 w-3.5" />
              </button>
            )}
          </div>

          {/* Region tabs — precomputed counts */}
          <div className="scrollbar-none flex gap-1 overflow-x-auto border-b border-white/5 px-3 py-1.5">
            <button
              type="button"
              onClick={() => { setActiveRegion(null); setHighlightIdx(-1); }}
              className={cn(
                'shrink-0 rounded-lg px-2.5 py-1 text-[10px] font-medium transition-colors',
                !activeRegion ? 'bg-blue-500/20 text-blue-400' : 'text-gray-500 hover:text-gray-300',
              )}
            >
              Todos ({CARRIERS.length})
            </button>
            {REGIONS.map((region) => (
              <button
                key={region}
                type="button"
                onClick={() => { setActiveRegion(activeRegion === region ? null : region); setHighlightIdx(-1); }}
                className={cn(
                  'shrink-0 rounded-lg px-2.5 py-1 text-[10px] font-medium transition-colors',
                  activeRegion === region ? 'bg-blue-500/20 text-blue-400' : 'text-gray-500 hover:text-gray-300',
                )}
              >
                {region} ({REGION_COUNTS[region]})
              </button>
            ))}
          </div>

          {/* Virtualized carrier list */}
          <div
            ref={listRef}
            onScroll={handleScroll}
            className="overflow-y-auto"
            style={{ maxHeight: VIEWPORT_HEIGHT }}
          >
            {flatItems.length === 0 ? (
              <div className="px-4 py-6 text-center text-sm text-gray-500">
                No se encontraron carriers
              </div>
            ) : (
              <div style={{ height: totalHeight, position: 'relative' }}>
                {flatItems.slice(visibleRange.start, visibleRange.end).map((item, i) => {
                  const idx = visibleRange.start + i;
                  const top = itemOffsets[idx];

                  if (item.kind === 'header') {
                    return (
                      <div
                        key={`h-${item.region}`}
                        className="bg-[#0f0f18]/95 px-3 py-1.5 text-[10px] font-semibold uppercase tracking-wider text-gray-500"
                        style={{ position: 'absolute', top, left: 0, right: 0, height: HEADER_HEIGHT }}
                      >
                        {item.region} ({item.count})
                      </div>
                    );
                  }

                  const isSelected = value === item.carrier.code;
                  const isHighlighted = idx === highlightIdx;
                  return (
                    <button
                      key={item.carrier.code}
                      type="button"
                      role="option"
                      aria-selected={isSelected}
                      onClick={() => handleSelect(item.carrier)}
                      onMouseEnter={() => setHighlightIdx(idx)}
                      className={cn(
                        'flex w-full items-center gap-3 px-3 text-left text-sm transition-colors',
                        isSelected && 'bg-blue-500/10',
                        isHighlighted && !isSelected && 'bg-white/5',
                      )}
                      style={{ position: 'absolute', top, left: 0, right: 0, height: ITEM_HEIGHT }}
                    >
                      <span
                        className={cn(
                          'rounded px-1.5 py-0.5 font-mono text-xs',
                          isSelected
                            ? 'bg-blue-500/20 text-blue-400'
                            : 'bg-white/5 text-gray-400',
                        )}
                      >
                        {item.carrier.code}
                      </span>
                      <span className="flex-1 truncate text-gray-300">{item.carrier.name}</span>
                    </button>
                  );
                })}
              </div>
            )}
          </div>

          {/* Footer */}
          <div className="border-t border-white/5 px-3 py-1.5 text-center text-[10px] text-gray-600">
            {filtered.length} de {CARRIERS.length} carriers
          </div>
        </div>
      )}
    </div>
  );
}
