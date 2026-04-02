/* ── Scan Page ──────────────────────────────────────────────── */

import { useState, useMemo } from 'react';
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
} from 'lucide-react';
import GlassCard from '@/components/ui/GlassCard';
import Spinner from '@/components/ui/Spinner';
import ProgressBar from '@/components/ui/ProgressBar';
import StatusBadge from '@/components/ui/StatusBadge';
import { showToast } from '@/components/ui/Toast';
import { useCarrierScan } from '@/lib/hooks';
import { useAppStore } from '@/lib/store';
import { CARRIERS, getUniqueRegions } from '@/lib/api/carriers';
import { cn } from '@/lib/utils';
import type { CarrierStatus } from '@/lib/types';

const schema = z.object({
  guid: z.string().min(7).regex(/^[0-9a-fA-F]+$/),
});

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
    const results = await scan(data.guid, [...CARRIERS]);
    const open = results.filter((r) => r.status === 'open').length;
    const wl = results.filter((r) => r.status === 'whitelisted').length;
    showToast(`Escaneo completo: ${open} abiertos, ${wl} whitelisted`, 'success');
  };

  const filteredResults = useMemo(() => {
    return scanResults.filter((r) => {
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
  }, [scanResults, filter, regionFilter, searchQuery]);

  const statusCounts = useMemo(() => {
    const counts = { open: 0, whitelisted: 0, 'no-content': 0, error: 0 };
    scanResults.forEach((r) => {
      if (r.status in counts) counts[r.status as keyof typeof counts]++;
    });
    return counts;
  }, [scanResults]);

  const versionComparison = useMemo(() => {
    const versions = new Set<string>();
    scanResults.forEach((r) => {
      if (r.status === 'open' && r.response?.content?.targetVersion) {
        versions.add(r.response.content.targetVersion);
      }
    });
    return Array.from(versions).sort();
  }, [scanResults]);

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
        </p>

        <form onSubmit={handleSubmit(onSubmit)} className="space-y-4">
          <div>
            <label className="mb-1.5 block text-sm font-medium text-gray-400">GUID</label>
            <input
              {...register('guid')}
              placeholder="ej: 0d5cc74421f2e8a"
              className={cn(
                'w-full rounded-xl border bg-white/[0.03] px-4 py-3 text-sm text-white',
                'placeholder:text-gray-600 focus:outline-none focus:ring-2 focus:ring-emerald-500/40',
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
            <div className="grid grid-cols-4 gap-3">
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

            {/* Version comparison - like Python CLI */}
            {versionComparison.length > 0 && !scanning && (
              <GlassCard className="p-4">
                {versionComparison.length === 1 ? (
                  <p className="flex items-center gap-2 text-sm">
                    <CheckCircle2 className="h-4 w-4 text-emerald-400" />
                    <span className="text-gray-400">
                      Todos los carriers abiertos tienen versión:{' '}
                      <span className="font-mono font-semibold text-emerald-400">
                        {versionComparison[0]}
                      </span>
                    </span>
                  </p>
                ) : (
                  <div>
                    <p className="flex items-center gap-2 text-sm">
                      <AlertTriangle className="h-4 w-4 text-amber-400" />
                      <span className="font-semibold text-amber-400">
                        ⚠ Múltiples versiones OTA detectadas:
                      </span>
                    </p>
                    <div className="mt-2 flex flex-wrap gap-2">
                      {versionComparison.map((v) => (
                        <span
                          key={v}
                          className="rounded-full bg-amber-500/10 px-3 py-1 font-mono text-xs text-amber-300"
                        >
                          {v}
                        </span>
                      ))}
                    </div>
                  </div>
                )}
              </GlassCard>
            )}

            {/* Filters */}
            <div className="flex flex-wrap items-center gap-3">
              <div className="flex items-center gap-2 text-sm text-gray-400">
                <Filter className="h-4 w-4" />
                <span>Filtros:</span>
              </div>
              <select
                value={regionFilter}
                onChange={(e) => setRegionFilter(e.target.value)}
                className="rounded-lg border border-white/10 bg-white/[0.03] px-3 py-1.5 text-xs text-white focus:outline-none"
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
                  className="w-full rounded-lg border border-white/10 bg-white/[0.03] py-1.5 pl-9 pr-3 text-xs text-white placeholder:text-gray-600 focus:outline-none"
                />
              </div>
            </div>

            {/* Results table */}
            <GlassCard className="overflow-hidden p-0">
              <div className="max-h-[500px] overflow-auto">
                <table className="w-full text-sm">
                  <thead className="sticky top-0 z-10 border-b border-white/5 bg-[#0d0d1a]/95 backdrop-blur">
                    <tr className="text-left text-xs uppercase tracking-wider text-gray-500">
                      <th className="px-4 py-3">Carrier</th>
                      <th className="px-4 py-3">Nombre</th>
                      <th className="px-4 py-3">Región</th>
                      <th className="px-4 py-3">Estado</th>
                      <th className="px-4 py-3">Versión OTA</th>
                      <th className="px-4 py-3 text-right">Tamaño</th>
                    </tr>
                  </thead>
                  <tbody className="divide-y divide-white/5">
                    {filteredResults.map((result, i) => (
                      <motion.tr
                        key={result.carrier.code}
                        initial={{ opacity: 0 }}
                        animate={{ opacity: 1 }}
                        transition={{ delay: Math.min(i * 0.01, 0.5) }}
                        className="text-gray-300 hover:bg-white/[0.02]"
                      >
                        <td className="whitespace-nowrap px-4 py-2.5 font-mono text-xs text-white">
                          {result.carrier.code}
                        </td>
                        <td className="px-4 py-2.5 text-xs">{result.carrier.name}</td>
                        <td className="px-4 py-2.5 text-xs text-gray-500">{result.carrier.region}</td>
                        <td className="px-4 py-2.5">
                          <StatusBadge status={result.status} />
                        </td>
                        <td className="px-4 py-2.5 font-mono text-xs">
                          {result.response?.content?.targetVersion || '—'}
                        </td>
                        <td className="px-4 py-2.5 text-right font-mono text-xs text-gray-500">
                          {result.response?.content?.sizeMB
                            ? `${result.response.content.sizeMB} MB`
                            : '—'}
                        </td>
                      </motion.tr>
                    ))}
                  </tbody>
                </table>
              </div>
              <div className="border-t border-white/5 px-4 py-2.5 text-xs text-gray-500">
                <span>
                  Escaneados {scanResults.length} carriers:{' '}
                  <span className="font-semibold text-emerald-400">{statusCounts.open} abiertos</span>,{' '}
                  <span className="font-semibold text-amber-400">{statusCounts.whitelisted} whitelisted</span>,{' '}
                  {statusCounts['no-content']} sin contenido
                  {statusCounts.error > 0 && (
                    <>, <span className="text-red-400">{statusCounts.error} errores</span></>
                  )}
                  {' '}· Mostrando {filteredResults.length}
                </span>
              </div>
            </GlassCard>
          </motion.div>
        )}
      </AnimatePresence>
    </div>
  );
}
