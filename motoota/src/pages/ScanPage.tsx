/* ── Scan Page ──────────────────────────────────────────────── */

import { useState, useMemo, memo } from 'react';
import { motion, AnimatePresence } from 'framer-motion';
import { useForm } from 'react-hook-form';
import { zodResolver } from '@hookform/resolvers/zod';
import { z } from 'zod';
import {
  ScanLine,
  Filter,
  Search as SearchIcon,
  CheckCircle2,
  AlertTriangle,
  MinusCircle,
  XCircle,
  ChevronDown,
  ArrowRight,
  Download,
  Copy,
  X,
  Link2,
  ArrowUpDown,
  ArrowUp,
  ArrowDown,
  FileDown,
} from 'lucide-react';
import GlassCard from '@/components/ui/GlassCard';
import Spinner from '@/components/ui/Spinner';
import ProgressBar from '@/components/ui/ProgressBar';
import StatusBadge from '@/components/ui/StatusBadge';
import AttrCell from '@/components/ui/AttrCell';
import DownloadButton from '@/components/ui/DownloadButton';
import ResourceUrlList from '@/components/ui/ResourceUrlList';
import ReleaseNotes from '@/components/ui/ReleaseNotes';
import { showToast } from '@/components/ui/Toast';
import { useCarrierScan } from '@/lib/hooks';
import { useAppStore } from '@/lib/store';
import { CARRIERS, getUniqueRegions } from '@/lib/api/carriers';
import { formatBytes, cn, buildDownloadFilename, copyToClipboard, exportScanResultsToCsv } from '@/lib/utils';
import type { CarrierStatus, ScanResult, CheckResponse } from '@/lib/types';

const schema = z.object({
  guid: z.string().min(7).regex(/^[0-9a-fA-F]+$/),
});

type SortField = 'carrier' | 'name' | 'region' | 'status' | 'version' | 'chain' | 'size';
type SortDir = 'asc' | 'desc';

const STATUS_PRIORITY: Record<CarrierStatus, number> = {
  open: 0,
  whitelisted: 1,
  'no-content': 2,
  error: 3,
};

const STATUS_ICONS = {
  open: CheckCircle2,
  whitelisted: AlertTriangle,
  'no-content': MinusCircle,
  error: XCircle,
};

export default function ScanPage() {
  const { config, scanResults, scanProgress, updateConfig } = useAppStore();
  const { scan, scanning } = useCarrierScan();
  const [filter, setFilter] = useState<CarrierStatus | 'all'>('all');
  const [regionFilter, setRegionFilter] = useState('all');
  const [searchQuery, setSearchQuery] = useState('');
  const [selectedCarrier, setSelectedCarrier] = useState<string | null>(null);
  const [selectedStep, setSelectedStep] = useState<number | null>(null);
  const [sortField, setSortField] = useState<SortField>('status');
  const [sortDir, setSortDir] = useState<SortDir>('asc');
  const regions = useMemo(() => getUniqueRegions(), []);

  const {
    register,
    handleSubmit,
    formState: { errors },
  } = useForm({
    resolver: zodResolver(schema),
    defaultValues: { guid: config.guid },
  });

  const onSubmit = async (data: { guid: string }) => {
    updateConfig({ guid: data.guid });
    setSelectedCarrier(null);
    setSelectedStep(null);
    const results = await scan(data.guid, [...CARRIERS], true);
    const open = results.filter((r) => r.status === 'open').length;
    const wl = results.filter((r) => r.status === 'whitelisted').length;
    showToast(`Escaneo completo: ${open} abiertos, ${wl} whitelisted`, 'success');
  };

  const filteredResults = useMemo(() => {
    const filtered = scanResults.filter((r) => {
      if (filter !== 'all' && r.status !== filter) return false;
      if (regionFilter !== 'all' && r.carrier.region !== regionFilter) return false;
      if (searchQuery) {
        const q = searchQuery.toLowerCase();
        return (
          r.carrier.code.toLowerCase().includes(q) ||
          r.carrier.name.toLowerCase().includes(q)
        );
      }
      return true;
    });

    const dir = sortDir === 'asc' ? 1 : -1;
    filtered.sort((a, b) => {
      let cmp = 0;
      switch (sortField) {
        case 'carrier':
          cmp = a.carrier.code.localeCompare(b.carrier.code);
          break;
        case 'name':
          cmp = a.carrier.name.localeCompare(b.carrier.name);
          break;
        case 'region':
          cmp = a.carrier.region.localeCompare(b.carrier.region);
          break;
        case 'status':
          cmp = STATUS_PRIORITY[a.status] - STATUS_PRIORITY[b.status];
          break;
        case 'version':
          cmp = (a.response?.content?.targetVersion || '').localeCompare(
            b.response?.content?.targetVersion || '',
          );
          break;
        case 'chain':
          cmp = (a.chain?.length || 0) - (b.chain?.length || 0);
          break;
        case 'size':
          cmp = (a.response?.content?.sizeBytes || 0) - (b.response?.content?.sizeBytes || 0);
          break;
      }
      return cmp * dir;
    });

    return filtered;
  }, [scanResults, filter, regionFilter, searchQuery, sortField, sortDir]);

  const statusCounts = useMemo(() => {
    const counts = { open: 0, whitelisted: 0, 'no-content': 0, error: 0 };
    scanResults.forEach((r) => {
      if (r.status in counts) counts[r.status as keyof typeof counts]++;
    });
    return counts;
  }, [scanResults]);

  /* Chain comparison: group open carriers by their full chain fingerprint */
  const chainComparison = useMemo(() => {
    const openWithChains = scanResults.filter((r) => r.status === 'open' && r.chain && r.chain.length > 0);
    if (openWithChains.length === 0) return null;

    const groups = new Map<string, { versions: string[]; carriers: ScanResult[] }>();
    for (const r of openWithChains) {
      const versions = r.chain!.map((s) => s.content?.targetVersion || '?');
      const key = versions.join(' → ');
      if (!groups.has(key)) groups.set(key, { versions, carriers: [] });
      groups.get(key)!.carriers.push(r);
    }
    return groups;
  }, [scanResults]);

  const selectedResult: ScanResult | null = selectedCarrier
    ? scanResults.find((r) => r.carrier.code === selectedCarrier) ?? null
    : null;

  const handleCopy = async (text: string) => {
    const success = await copyToClipboard(text);
    showToast(success ? 'Copiado al portapapeles' : 'No se pudo copiar al portapapeles', success ? 'success' : 'error');
  };

  const toggleSort = (field: SortField) => {
    if (sortField === field) {
      setSortDir((d) => (d === 'asc' ? 'desc' : 'asc'));
    } else {
      setSortField(field);
      setSortDir('asc');
    }
  };

  const SortIcon = ({ field }: { field: SortField }) => {
    if (sortField !== field) return <ArrowUpDown className="h-3 w-3 text-gray-600" />;
    return sortDir === 'asc'
      ? <ArrowUp className="h-3 w-3 text-blue-400" />
      : <ArrowDown className="h-3 w-3 text-blue-400" />;
  };

  return (
    <div className="mx-auto max-w-4xl space-y-6">
      {/* Form */}
      <GlassCard>
        <h3 className="mb-4 flex items-center gap-2 text-lg font-semibold text-white">
          <ScanLine className="h-5 w-5 text-emerald-400" />
          Escanear Carriers
        </h3>
        <p className="mb-4 text-sm text-gray-400">
          Escanea los {CARRIERS.length} carriers disponibles para buscar actualizaciones con tu GUID.
          Obtiene la cadena de actualización completa de cada carrier abierto.
        </p>

        <form onSubmit={handleSubmit(onSubmit)} className="space-y-4">
          <div>
            <label className="mb-1.5 block text-sm font-medium text-gray-400">GUID</label>
            <input
              {...register('guid')}
              placeholder="ej: 0d5cc74421f2e8a"
              className={cn(
                'w-full rounded-xl border bg-white/[0.03] px-4 py-3 text-sm text-white',
                'placeholder:text-gray-500 focus:outline-none focus:ring-2 focus:ring-emerald-500/40',
                errors.guid ? 'border-red-500/40' : 'border-white/10',
              )}
            />
          </div>
          <button
            type="submit"
            disabled={scanning}
            className={cn(
              'flex w-full items-center justify-center gap-2 rounded-xl px-6 py-3 text-sm font-semibold',
              'bg-gradient-to-r from-emerald-600 to-green-600 text-white',
              'shadow-lg shadow-emerald-500/20 transition-all',
              'hover:shadow-emerald-500/30 hover:brightness-110',
              'disabled:cursor-not-allowed disabled:opacity-50',
            )}
          >
            {scanning ? <Spinner size="sm" /> : <ScanLine className="h-4 w-4" />}
            {scanning ? 'Escaneando...' : 'Iniciar Escaneo'}
          </button>
        </form>

        {/* Progress */}
        {scanning && scanProgress.total > 0 && (
          <div className="mt-4">
            <ProgressBar
              value={scanProgress.completed}
              max={scanProgress.total}
              label="Progreso del escaneo"
            />
          </div>
        )}
      </GlassCard>

      {/* Results */}
      <AnimatePresence>
        {scanResults.length > 0 && (
          <motion.div
            initial={{ opacity: 0 }}
            animate={{ opacity: 1 }}
            className="space-y-4"
          >
            {/* Status summary */}
            <div className="grid grid-cols-2 gap-3 sm:grid-cols-4">
              {(Object.entries(statusCounts) as [CarrierStatus, number][]).map(([status, count]) => {
                const Icon = STATUS_ICONS[status];
                return (
                  <button
                    key={status}
                    onClick={() => setFilter(filter === status ? 'all' : status)}
                    className={cn(
                      'flex items-center gap-2 rounded-xl border p-3 text-left transition-all',
                      filter === status
                        ? 'border-blue-500/30 bg-blue-500/10'
                        : 'border-white/5 bg-white/[0.02] hover:bg-white/[0.04]',
                    )}
                  >
                    <Icon className="h-4 w-4 shrink-0 text-gray-400" />
                    <div>
                      <p className="text-lg font-bold text-white">{count}</p>
                      <p className="text-[10px] uppercase tracking-wider text-gray-500">{status}</p>
                    </div>
                  </button>
                );
              })}
            </div>

            {/* Chain comparison across carriers */}
            {chainComparison && !scanning && (
              <GlassCard className="p-4">
                <h4 className="mb-3 flex items-center gap-2 text-sm font-semibold text-white">
                  <Link2 className="h-4 w-4 text-violet-400" />
                  Comparación de cadenas de actualización
                </h4>
                {chainComparison.size === 1 ? (
                  <div>
                    <p className="flex items-center gap-2 text-sm">
                      <CheckCircle2 className="h-4 w-4 text-emerald-400" />
                      <span className="text-gray-400">
                        Todos los carriers abiertos comparten la misma cadena de actualización
                      </span>
                    </p>
                    {[...chainComparison.values()][0] && (
                      <div className="mt-2 flex flex-wrap items-center gap-1.5">
                        {[...chainComparison.values()][0].versions.map((v, i, arr) => (
                          <span key={i} className="flex items-center gap-1.5">
                            <span className="rounded-md bg-emerald-500/10 px-2 py-0.5 font-mono text-xs text-emerald-400">
                              {v}
                            </span>
                            {i < arr.length - 1 && <ArrowRight className="h-3 w-3 text-gray-600" />}
                          </span>
                        ))}
                      </div>
                    )}
                  </div>
                ) : (
                  <div className="space-y-3">
                    <p className="flex items-center gap-2 text-sm">
                      <AlertTriangle className="h-4 w-4 text-amber-400" />
                      <span className="font-semibold text-amber-400">
                        Se detectaron {chainComparison.size} cadenas de actualización diferentes
                      </span>
                    </p>
                    {[...chainComparison.entries()].map(([key, { versions, carriers }]) => (
                      <div key={key} className="rounded-lg border border-white/5 bg-white/[0.02] p-3">
                        <div className="mb-2 flex flex-wrap items-center gap-1.5">
                          {versions.map((v, i, arr) => (
                            <span key={i} className="flex items-center gap-1.5">
                              <span className="rounded-md bg-violet-500/10 px-2 py-0.5 font-mono text-xs text-violet-400">
                                {v}
                              </span>
                              {i < arr.length - 1 && <ArrowRight className="h-3 w-3 text-gray-600" />}
                            </span>
                          ))}
                        </div>
                        <p className="text-xs text-gray-500">
                          {carriers.length} carrier{carriers.length > 1 ? 's' : ''}:{' '}
                          <span className="text-gray-400">
                            {carriers.map((c) => c.carrier.code).join(', ')}
                          </span>
                        </p>
                      </div>
                    ))}
                  </div>
                )}
              </GlassCard>
            )}

            {/* Filters */}
            <div className="flex flex-col gap-3 sm:flex-row sm:flex-wrap sm:items-center">
              <div className="flex items-center gap-2 text-sm text-gray-400">
                <Filter className="h-4 w-4" />
                <span>Filtros:</span>
              </div>
              <select
                value={regionFilter}
                onChange={(e) => setRegionFilter(e.target.value)}
                aria-label="Filtrar por región"
                className="w-full rounded-lg border border-white/10 bg-white/[0.03] px-3 py-2 text-xs text-white focus:outline-none focus:ring-2 focus:ring-blue-500/40 sm:w-auto sm:py-1.5"
              >
                <option value="all">Todas las regiones</option>
                {regions.map((r) => (
                  <option key={r} value={r}>{r}</option>
                ))}
              </select>
              <div className="relative flex-1">
                <SearchIcon className="absolute left-3 top-1/2 h-3.5 w-3.5 -translate-y-1/2 text-gray-500" />
                <input
                  value={searchQuery}
                  onChange={(e) => setSearchQuery(e.target.value)}
                  placeholder="Buscar carrier..."
                  aria-label="Buscar carrier en resultados"
                  className="w-full rounded-lg border border-white/10 bg-white/[0.03] py-2 pl-9 pr-3 text-xs text-white placeholder:text-gray-500 focus:outline-none focus:ring-2 focus:ring-blue-500/40 sm:py-1.5"
                />
              </div>
            </div>

            {/* Results table */}
            <GlassCard className="overflow-hidden p-0">
              <div className="max-h-[500px] overflow-auto">
                <table className="w-full text-sm">
                  <thead className="sticky top-0 z-10 border-b border-white/5 bg-[#0d0d1a]/95 backdrop-blur">
                    <tr className="text-left text-xs uppercase tracking-wider text-gray-500">
                      <th className="px-4 py-3"><button onClick={() => toggleSort('carrier')} className="flex items-center gap-1 hover:text-gray-300"><span>Carrier</span><SortIcon field="carrier" /></button></th>
                      <th className="px-4 py-3"><button onClick={() => toggleSort('name')} className="flex items-center gap-1 hover:text-gray-300"><span>Nombre</span><SortIcon field="name" /></button></th>
                      <th className="hidden px-4 py-3 sm:table-cell"><button onClick={() => toggleSort('region')} className="flex items-center gap-1 hover:text-gray-300"><span>Región</span><SortIcon field="region" /></button></th>
                      <th className="px-4 py-3"><button onClick={() => toggleSort('status')} className="flex items-center gap-1 hover:text-gray-300"><span>Estado</span><SortIcon field="status" /></button></th>
                      <th className="hidden px-4 py-3 sm:table-cell"><button onClick={() => toggleSort('version')} className="flex items-center gap-1 hover:text-gray-300"><span>Versión</span><SortIcon field="version" /></button></th>
                      <th className="hidden px-4 py-3 md:table-cell"><button onClick={() => toggleSort('chain')} className="flex items-center gap-1 hover:text-gray-300"><span>Cadena</span><SortIcon field="chain" /></button></th>
                      <th className="hidden px-4 py-3 text-right md:table-cell"><button onClick={() => toggleSort('size')} className="ml-auto flex items-center gap-1 hover:text-gray-300"><span>Tamaño</span><SortIcon field="size" /></button></th>
                    </tr>
                  </thead>
                  <tbody className="divide-y divide-white/5">
                    {filteredResults.map((result) => (
                      <ScanResultRow
                        key={result.carrier.code}
                        result={result}
                        isSelected={selectedCarrier === result.carrier.code}
                        onSelect={(code) => {
                          setSelectedCarrier(selectedCarrier === code ? null : code);
                          setSelectedStep(null);
                        }}
                      />
                    ))}
                  </tbody>
                </table>
              </div>
              <div className="flex flex-col gap-2 border-t border-white/5 px-4 py-2.5 text-xs text-gray-500 sm:flex-row sm:items-center sm:justify-between">
                <span>
                  {scanResults.length} carriers:{' '}
                  <span className="font-semibold text-emerald-400">{statusCounts.open} abiertos</span>,{' '}
                  <span className="font-semibold text-amber-400">{statusCounts.whitelisted} wl</span>,{' '}
                  {statusCounts['no-content']} s/c
                  {statusCounts.error > 0 && (
                    <>, <span className="text-red-400">{statusCounts.error} err</span></>
                  )}
                  {' '}· {filteredResults.length} mostrados
                </span>
                <button
                  onClick={() => {
                    exportScanResultsToCsv(scanResults, config.guid);
                    showToast('CSV exportado correctamente', 'success');
                  }}
                  className="flex items-center gap-1.5 self-start rounded-lg border border-white/10 bg-white/[0.03] px-3 py-1.5 text-xs text-gray-400 transition-colors hover:border-white/20 hover:text-white sm:self-auto"
                  aria-label="Exportar resultados a CSV"
                >
                  <FileDown className="h-3 w-3" />
                  CSV
                </button>
              </div>
            </GlassCard>

            {/* Carrier detail panel */}
            <AnimatePresence>
              {selectedResult && (
                <motion.div
                  key={`detail-${selectedCarrier}`}
                  initial={{ opacity: 0, y: 10 }}
                  animate={{ opacity: 1, y: 0 }}
                  exit={{ opacity: 0, y: -10 }}
                >
                  <GlassCard className="p-5">
                    {/* Header */}
                    <div className="mb-4 flex items-center justify-between">
                      <div>
                        <h4 className="flex items-center gap-2 text-sm font-semibold text-white">
                          <ScanLine className="h-4 w-4 text-emerald-400" />
                          {selectedResult.carrier.name}
                        </h4>
                        <p className="mt-0.5 text-xs text-gray-500">
                          <span className="font-mono">{selectedResult.carrier.code}</span> · {selectedResult.carrier.region} ·{' '}
                          <StatusBadge status={selectedResult.status} />
                        </p>
                      </div>
                      <button
                        onClick={() => { setSelectedCarrier(null); setSelectedStep(null); }}
                        aria-label="Cerrar detalle del carrier"
                        className="rounded-lg p-1 text-gray-500 transition-colors hover:bg-white/5 hover:text-white"
                      >
                        <X className="h-4 w-4" />
                      </button>
                    </div>

                    {/* First update info */}
                    {selectedResult.response?.content && (
                      <div className="mb-4 space-y-3 border-b border-white/5 pb-4">
                        <div className="flex items-center gap-3 text-sm">
                          <span className="rounded-lg bg-white/[0.04] px-3 py-1.5 font-mono text-gray-300">
                            {selectedResult.response.content.sourceVersion}
                          </span>
                          <ArrowRight className="h-4 w-4 text-emerald-400" />
                          <span className="rounded-lg bg-emerald-500/10 px-3 py-1.5 font-mono font-semibold text-emerald-400">
                            {selectedResult.response.content.targetVersion}
                          </span>
                        </div>
                        <div className="grid grid-cols-3 gap-2 text-xs">
                          <AttrCell label="Tamaño" value={formatBytes(selectedResult.response.content.sizeBytes)} compact />
                          <AttrCell label="Tipo" value={selectedResult.response.content.updateType} compact />
                          <AttrCell label="Modelo" value={selectedResult.response.content.model} compact />
                        </div>
                      </div>
                    )}

                    {/* Chain timeline */}
                    {selectedResult.chain && selectedResult.chain.length > 0 && (
                      <div>
                        <h5 className="mb-3 flex items-center gap-2 text-xs font-semibold text-gray-400">
                          <Link2 className="h-3.5 w-3.5 text-violet-400" />
                          Cadena de actualización ({selectedResult.chain.length} paso{selectedResult.chain.length > 1 ? 's' : ''})
                        </h5>

                        <div className="space-y-2">
                          {selectedResult.chain.map((step, i) => (
                            <button
                              key={step.content?.targetGuid || `step-${i}`}
                              onClick={() => setSelectedStep(selectedStep === i ? null : i)}
                              className={cn(
                                'flex w-full items-center gap-3 rounded-xl border p-3 text-left text-xs transition-all',
                                'bg-white/[0.02]',
                                selectedStep === i
                                  ? 'border-violet-500/30 bg-violet-500/[0.06]'
                                  : 'border-white/5 hover:border-white/10 hover:bg-white/[0.04]',
                              )}
                            >
                              <div className="flex h-6 w-6 shrink-0 items-center justify-center rounded-md bg-violet-500/10 text-[10px] font-bold text-violet-400">
                                {i + 1}
                              </div>
                              <span className="font-mono text-gray-400">{step.content?.sourceVersion || '?'}</span>
                              <ArrowRight className="h-3 w-3 text-violet-400" />
                              <span className="font-mono font-semibold text-white">{step.content?.targetVersion || '?'}</span>
                              <span className="ml-auto text-gray-600">{step.content ? formatBytes(step.content.sizeBytes) : ''}</span>
                              <ChevronDown className={cn('h-3.5 w-3.5 text-gray-500 transition-transform', selectedStep === i && 'rotate-180')} />
                            </button>
                          ))}
                        </div>

                        {/* Step detail */}
                        <AnimatePresence>
                          {selectedStep !== null && selectedResult.chain[selectedStep]?.content && (
                            <StepDetail
                              step={selectedResult.chain[selectedStep]}
                              index={selectedStep}
                              carrier={selectedResult.carrier.code}
                              networkTag={config.downloadNetwork === 'wifi' ? 'WIFI' : 'CELL'}
                              copyToClipboard={handleCopy}
                            />
                          )}
                        </AnimatePresence>
                      </div>
                    )}

                    {/* Fallback: no chain but has response */}
                    {(!selectedResult.chain || selectedResult.chain.length === 0) && selectedResult.response?.hasUpdate && (
                      <StepDetail
                        step={selectedResult.response}
                        index={0}
                        carrier={selectedResult.carrier.code}
                        networkTag={config.downloadNetwork === 'wifi' ? 'WIFI' : 'CELL'}
                        copyToClipboard={handleCopy}
                      />
                    )}
                  </GlassCard>
                </motion.div>
              )}
            </AnimatePresence>
          </motion.div>
        )}
      </AnimatePresence>
    </div>
  );
}

/* ── Memoized scan result table row ────────────────────────── */
const ScanResultRow = memo(function ScanResultRow({
  result,
  isSelected,
  onSelect,
}: {
  result: ScanResult;
  isSelected: boolean;
  onSelect: (code: string) => void;
}) {
  const clickable = result.status === 'open' || result.status === 'whitelisted';
  return (
    <tr
      onClick={() => { if (clickable) onSelect(result.carrier.code); }}
      className={cn(
        'text-gray-300 transition-colors',
        clickable ? 'cursor-pointer hover:bg-white/[0.04]' : 'hover:bg-white/[0.02]',
        isSelected && 'bg-violet-500/[0.06]',
      )}
    >
      <td className="whitespace-nowrap px-4 py-2.5 font-mono text-xs text-white">
        {result.carrier.code}
      </td>
      <td className="px-4 py-2.5 text-xs">{result.carrier.name}</td>
      <td className="hidden px-4 py-2.5 text-xs text-gray-500 sm:table-cell">{result.carrier.region}</td>
      <td className="px-4 py-2.5">
        <StatusBadge status={result.status} />
      </td>
      <td className="hidden px-4 py-2.5 font-mono text-xs sm:table-cell">
        {result.response?.content?.targetVersion || '—'}
      </td>
      <td className="hidden px-4 py-2.5 text-xs text-gray-500 md:table-cell">
        {result.chain && result.chain.length > 0
          ? `${result.chain.length} paso${result.chain.length > 1 ? 's' : ''}`
          : '—'}
      </td>
      <td className="hidden px-4 py-2.5 text-right font-mono text-xs text-gray-500 md:table-cell">
        {result.response?.content?.sizeMB
          ? `${result.response.content.sizeMB} MB`
          : '—'}
      </td>
    </tr>
  );
});

/* ── Step detail component ─────────────────────────────────── */
function StepDetail({
  step,
  index,
  carrier,
  networkTag,
  copyToClipboard,
}: {
  step: CheckResponse;
  index: number;
  carrier: string;
  networkTag: string;
  copyToClipboard: (text: string) => void;
}) {
  if (!step.content) return null;

  const filtered = step.contentResources.filter((r) =>
    r.tags.some((t) => t.toUpperCase() === networkTag),
  );
  const primaryUrl = filtered[0]?.url || step.downloadUrls[0];
  const dlName = buildDownloadFilename(step.content.targetVersion, carrier, index);

  return (
    <motion.div
      key={`step-${index}`}
      initial={{ opacity: 0, y: 5 }}
      animate={{ opacity: 1, y: 0 }}
      exit={{ opacity: 0, y: -5 }}
      className="mt-3 rounded-xl border border-white/5 bg-white/[0.02] p-4"
    >
      <h6 className="mb-3 text-xs font-semibold text-white">
        Paso {index + 1} — {step.content.sourceVersion} → {step.content.targetVersion}
      </h6>

      <div className="mb-3 grid grid-cols-2 gap-2 text-xs sm:grid-cols-3">
        <AttrCell label="Tamaño" value={formatBytes(step.content.sizeBytes)} compact />
        <AttrCell label="Tipo" value={step.content.updateType} compact />
        <AttrCell label="Modelo" value={step.content.model} compact />
        <AttrCell label="Fase" value={step.content.deploymentPhase} compact />
        <AttrCell label="GUID destino" value={step.content.targetGuid} mono compact copy={copyToClipboard} />
        <AttrCell label="MD5" value={step.content.md5} mono compact copy={copyToClipboard} />
      </div>

      {/* Download */}
      {filtered.length > 0 && (
        <div className="mb-3">
          {primaryUrl && (
            <div className="mb-2">
              <DownloadButton url={primaryUrl} filename={dlName} sizeMB={step.content.sizeMB} compact />
            </div>
          )}
          <ResourceUrlList resources={filtered} compact onCopy={copyToClipboard} />
        </div>
      )}

      {/* Release notes */}
      {step.content.releaseNotes && (
        <ReleaseNotes html={step.content.releaseNotes} />
      )}
    </motion.div>
  );
}
