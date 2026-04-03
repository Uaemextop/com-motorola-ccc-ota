/* ── Chain Page ─────────────────────────────────────────────── */

import { useState } from 'react';
import { motion, AnimatePresence } from 'framer-motion';
import { useForm, Controller } from 'react-hook-form';
import { zodResolver } from '@hookform/resolvers/zod';
import { z } from 'zod';
import {
  Link2,
  ArrowRight,
  Download,
  Copy,
  ChevronDown,
  X,
  FileText,
  Tag,
  Clock,
  ExternalLink,
} from 'lucide-react';
import GlassCard from '@/components/ui/GlassCard';
import CarrierSelect from '@/components/ui/CarrierSelect';
import Spinner from '@/components/ui/Spinner';
import { showToast } from '@/components/ui/Toast';
import { useChainWalk } from '@/lib/hooks';
import { useAppStore } from '@/lib/store';
import { formatBytes, cn, sanitizeReleaseNotes, buildDownloadFilename } from '@/lib/utils';
import type { CheckResponse } from '@/lib/types';

const schema = z.object({
  guid: z.string().min(7).regex(/^[0-9a-fA-F]+$/),
  carrier: z.string().min(2),
});
type FormData = z.infer<typeof schema>;

export default function ChainPage() {
  const { config, chain, updateConfig } = useAppStore();
  const { walk, walking } = useChainWalk();
  const [selectedStep, setSelectedStep] = useState<number | null>(null);

  const {
    register,
    handleSubmit,
    control,
    formState: { errors },
  } = useForm<FormData>({
    resolver: zodResolver(schema),
    defaultValues: { guid: config.guid, carrier: config.carrier },
  });

  const onSubmit = async (data: FormData) => {
    updateConfig({ guid: data.guid, carrier: data.carrier });
    setSelectedStep(null);
    const result = await walk(data.guid, data.carrier);
    if (result.length > 0) {
      showToast(`Cadena encontrada: ${result.length} paso(s)`, 'success');
    } else {
      showToast('No se encontró cadena de actualizaciones', 'info');
    }
  };

  const copyToClipboard = async (text: string) => {
    try {
      await navigator.clipboard.writeText(text);
      showToast('Copiado al portapapeles', 'success');
    } catch {
      showToast('No se pudo copiar al portapapeles', 'error');
    }
  };

  const selected: CheckResponse | null = selectedStep !== null ? chain[selectedStep] ?? null : null;

  return (
    <div className="mx-auto max-w-3xl space-y-6">
      {/* Form */}
      <GlassCard>
        <h3 className="mb-4 flex items-center gap-2 text-lg font-semibold text-white">
          <Link2 className="h-5 w-5 text-violet-400" />
          Cadena de Actualizaciones
        </h3>
        <p className="mb-4 text-sm text-gray-400">
          Recorre la cadena completa de OTA: cada actualización apunta a la siguiente
          hasta llegar a la versión más reciente.
        </p>

        <form onSubmit={handleSubmit(onSubmit)} className="space-y-4">
          <div className="grid gap-4 sm:grid-cols-2">
            <div>
              <label className="mb-1.5 block text-sm font-medium text-gray-400">GUID</label>
              <input
                {...register('guid')}
                placeholder="ej: 0d5cc74421f2e8a"
                className={cn(
                  'w-full rounded-xl border bg-white/[0.03] px-4 py-3 text-sm text-white',
                  'placeholder:text-gray-600 focus:outline-none focus:ring-2 focus:ring-violet-500/40',
                  errors.guid ? 'border-red-500/40' : 'border-white/10',
                )}
              />
            </div>
            <div>
              <label className="mb-1.5 block text-sm font-medium text-gray-400">Carrier</label>
              <Controller
                name="carrier"
                control={control}
                render={({ field }) => (
                  <CarrierSelect
                    value={field.value}
                    onChange={field.onChange}
                    error={errors.carrier?.message}
                  />
                )}
              />
            </div>
          </div>
          <button
            type="submit"
            disabled={walking}
            className={cn(
              'flex w-full items-center justify-center gap-2 rounded-xl px-6 py-3 text-sm font-semibold',
              'bg-gradient-to-r from-violet-600 to-purple-600 text-white',
              'shadow-lg shadow-violet-500/20 transition-all',
              'hover:shadow-violet-500/30 hover:brightness-110',
              'disabled:cursor-not-allowed disabled:opacity-50',
            )}
          >
            {walking ? <Spinner size="sm" /> : <Link2 className="h-4 w-4" />}
            {walking ? 'Recorriendo cadena...' : 'Recorrer Cadena'}
          </button>
        </form>
      </GlassCard>

      {/* Chain results */}
      <AnimatePresence>
        {chain.length > 0 && (
          <motion.div initial={{ opacity: 0 }} animate={{ opacity: 1 }} className="space-y-3">
            {/* Chain summary */}
            <GlassCard className="p-4">
              <div className="flex flex-wrap items-center gap-x-4 gap-y-2 text-sm">
                <span className="text-gray-400">
                  <span className="font-semibold text-white">{chain.length}</span> paso{chain.length > 1 ? 's' : ''}
                </span>
                <span className="text-gray-600">·</span>
                <span className="text-gray-400">
                  Base: <span className="font-mono text-white">{chain[0]?.content?.sourceVersion}</span>
                </span>
                <span className="text-violet-400">→</span>
                <span className="text-gray-400">
                  Última: <span className="font-mono font-semibold text-emerald-400">{chain[chain.length - 1]?.content?.targetVersion}</span>
                </span>
                <span className="text-gray-600">·</span>
                <span className="font-semibold text-white">
                  {(chain.reduce((acc, s) => acc + (s.content?.sizeBytes || 0), 0) / (1024 * 1024)).toFixed(1)} MB total
                </span>
              </div>
            </GlassCard>

            {/* Timeline */}
            {chain.map((step, i) => (
              <motion.div
                key={i}
                initial={{ opacity: 0, x: -20 }}
                animate={{ opacity: 1, x: 0 }}
                transition={{ delay: i * 0.05 }}
              >
                <button
                  onClick={() => setSelectedStep(selectedStep === i ? null : i)}
                  className={cn(
                    'flex w-full items-center gap-3 rounded-2xl border p-4 text-left transition-all',
                    'bg-white/[0.03] backdrop-blur-sm shadow-[0_0_40px_rgba(0,0,0,0.3)]',
                    selectedStep === i
                      ? 'border-violet-500/30 bg-violet-500/[0.06]'
                      : 'border-white/5 hover:border-white/10 hover:bg-white/[0.05]',
                  )}
                >
                  <div className="flex h-8 w-8 shrink-0 items-center justify-center rounded-lg bg-violet-500/10 text-sm font-bold text-violet-400">
                    {i + 1}
                  </div>
                  <div className="flex flex-1 items-center gap-2 text-sm">
                    <span className="font-mono text-gray-300">
                      {step.content?.sourceVersion || '?'}
                    </span>
                    <ArrowRight className="h-3.5 w-3.5 text-violet-400" />
                    <span className="font-mono font-semibold text-white">
                      {step.content?.targetVersion || '?'}
                    </span>
                  </div>
                  <span className="text-xs text-gray-500">
                    {step.content ? formatBytes(step.content.sizeBytes) : ''}
                  </span>
                  <span className="rounded bg-white/[0.05] px-1.5 py-0.5 text-[10px] text-gray-500">
                    {step.content?.updateType || '?'}
                  </span>
                  <ChevronDown
                    className={cn(
                      'h-4 w-4 text-gray-500 transition-transform',
                      selectedStep === i && 'rotate-180',
                    )}
                  />
                </button>
              </motion.div>
            ))}

            {/* ── Detail panel for selected step ─────────────────── */}
            <AnimatePresence>
              {selected && selected.content && (
                <motion.div
                  key={`detail-${selectedStep}`}
                  initial={{ opacity: 0, y: 10 }}
                  animate={{ opacity: 1, y: 0 }}
                  exit={{ opacity: 0, y: -10 }}
                >
                  <GlassCard className="p-5">
                    {/* Header */}
                    <div className="mb-4 flex items-center justify-between">
                      <h4 className="flex items-center gap-2 text-sm font-semibold text-white">
                        <Tag className="h-4 w-4 text-violet-400" />
                        Paso {selectedStep! + 1} — Detalle
                      </h4>
                      <button
                        onClick={() => setSelectedStep(null)}
                        className="rounded-lg p-1 text-gray-500 transition-colors hover:bg-white/5 hover:text-white"
                      >
                        <X className="h-4 w-4" />
                      </button>
                    </div>

                    {/* Version banner */}
                    <div className="mb-4 flex items-center gap-3 text-sm">
                      <span className="rounded-lg bg-white/[0.04] px-3 py-1.5 font-mono text-gray-300">
                        {selected.content.sourceVersion}
                      </span>
                      <ArrowRight className="h-4 w-4 text-violet-400" />
                      <span className="rounded-lg bg-emerald-500/10 px-3 py-1.5 font-mono font-semibold text-emerald-400">
                        {selected.content.targetVersion}
                      </span>
                    </div>

                    {/* Info grid */}
                    <div className="mb-4 grid grid-cols-2 gap-2 text-xs sm:grid-cols-3">
                      <AttrCell label="Tamaño" value={formatBytes(selected.content.sizeBytes)} />
                      <AttrCell label="Tipo" value={selected.content.updateType} />
                      <AttrCell label="Modelo" value={selected.content.model} />
                      <AttrCell label="Fase" value={selected.content.deploymentPhase} />
                      <AttrCell label="GUID destino" value={selected.content.targetGuid} mono copy={copyToClipboard} />
                      <AttrCell label="MD5" value={selected.content.md5} mono copy={copyToClipboard} />
                    </div>

                    {/* Package ID */}
                    {selected.content.packageId && (
                      <div className="mb-4 rounded-lg bg-white/[0.02] px-3 py-2">
                        <p className="text-[9px] uppercase tracking-wider text-gray-500">Package ID</p>
                        <div className="mt-0.5 flex items-center gap-1.5">
                          <p className="flex-1 truncate font-mono text-[11px] text-gray-300">{selected.content.packageId}</p>
                          <button onClick={() => copyToClipboard(selected.content!.packageId)} className="text-gray-500 hover:text-white">
                            <Copy className="h-3 w-3" />
                          </button>
                        </div>
                      </div>
                    )}

                    {/* Download URLs */}
                    {selected.contentResources.length > 0 && (() => {
                      const networkTag = config.downloadNetwork === 'wifi' ? 'WIFI' : 'CELL';
                      const filtered = selected.contentResources.filter((r) =>
                        r.tags.some((t) => t.toUpperCase() === networkTag),
                      );
                      const primaryUrl = filtered[0]?.url || selected.downloadUrls[0];
                      const dlName = selected.content ? buildDownloadFilename(selected.content.targetVersion, config.carrier, selectedStep ?? undefined) : undefined;
                      return (
                      <div className="mb-4">
                        <h5 className="mb-2 flex items-center gap-1.5 text-xs font-semibold text-gray-400">
                          <Download className="h-3.5 w-3.5 text-emerald-400" />
                          Descargas ({filtered.length})
                        </h5>
                        {primaryUrl && (
                          <a
                            href={primaryUrl}
                            download={dlName}
                            className={cn(
                              'mb-2 flex items-center justify-center gap-2 rounded-xl px-5 py-2 text-xs font-semibold',
                              'bg-gradient-to-r from-emerald-600 to-green-600 text-white',
                              'shadow-lg shadow-emerald-500/20 transition-all hover:brightness-110',
                            )}
                          >
                            <Download className="h-3.5 w-3.5" />
                            Descargar ({selected.content.sizeMB} MB)
                          </a>
                        )}
                        <div className="space-y-1">
                          {filtered.map((resource, j) => (
                            <div key={j} className="flex items-center gap-2 rounded-lg bg-white/[0.02] px-3 py-1.5 text-xs">
                              <div className="flex items-center gap-1">
                                {resource.tags.map((tag) => (
                                  <span key={tag} className="rounded-full bg-blue-500/10 px-1.5 py-0.5 text-[10px] font-medium text-blue-400">{tag}</span>
                                ))}
                                {resource.urlTtlSeconds > 0 && (
                                  <span className="flex items-center gap-0.5 text-[10px] text-gray-600">
                                    <Clock className="h-2.5 w-2.5" /> {resource.urlTtlSeconds}s
                                  </span>
                                )}
                              </div>
                              <a href={resource.url} download={dlName} className="flex-1 truncate font-mono text-blue-300 hover:text-blue-200">
                                {resource.url}
                              </a>
                              <button onClick={() => copyToClipboard(resource.url)} className="shrink-0 text-gray-500 hover:text-white">
                                <Copy className="h-3 w-3" />
                              </button>
                              <a href={resource.url} target="_blank" rel="noopener noreferrer" className="shrink-0 text-gray-500 hover:text-white">
                                <ExternalLink className="h-3 w-3" />
                              </a>
                            </div>
                          ))}
                        </div>
                      </div>
                      );
                    })()}

                    {/* Release notes */}
                    {selected.content.releaseNotes && (
                      <div>
                        <h5 className="mb-2 flex items-center gap-1.5 text-xs font-semibold text-gray-400">
                          <FileText className="h-3.5 w-3.5 text-violet-400" />
                          Notas de la versión
                        </h5>
                        <div className="rounded-lg border border-white/5 bg-black/20 p-4">
                          <div
                            className="prose prose-sm prose-invert max-w-none [&_h3]:text-base [&_h3]:font-semibold [&_h3]:text-violet-300 [&_p]:text-gray-300 [&_p]:leading-relaxed"
                            dangerouslySetInnerHTML={{ __html: sanitizeReleaseNotes(selected.content.releaseNotes) }}
                          />
                        </div>
                      </div>
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

/* ── AttrCell: compact attribute cell ────────────────────────── */
function AttrCell({
  label,
  value,
  mono,
  copy,
}: {
  label: string;
  value: string;
  mono?: boolean;
  copy?: (v: string) => void;
}) {
  return (
    <div className="rounded-lg bg-white/[0.02] px-3 py-2">
      <p className="text-[9px] uppercase tracking-wider text-gray-500">{label}</p>
      <div className="mt-0.5 flex items-center gap-1">
        <p className={cn('flex-1 truncate text-gray-200', mono && 'font-mono text-[11px]')}>
          {value || '—'}
        </p>
        {copy && value && (
          <button onClick={() => copy(value)} className="shrink-0 text-gray-500 hover:text-white">
            <Copy className="h-2.5 w-2.5" />
          </button>
        )}
      </div>
    </div>
  );
}
