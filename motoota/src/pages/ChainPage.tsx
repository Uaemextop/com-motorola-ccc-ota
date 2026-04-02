/* ── Chain Page ─────────────────────────────────────────────── */

import { useState } from 'react';
import { motion, AnimatePresence } from 'framer-motion';
import { useForm } from 'react-hook-form';
import { zodResolver } from '@hookform/resolvers/zod';
import { z } from 'zod';
import { Link2, ArrowRight, Download, Copy, ChevronDown } from 'lucide-react';
import GlassCard from '@/components/ui/GlassCard';
import Spinner from '@/components/ui/Spinner';
import { showToast } from '@/components/ui/Toast';
import { useChainWalk } from '@/lib/hooks';
import { useAppStore } from '@/lib/store';
import { formatBytes, cn } from '@/lib/utils';

const schema = z.object({
  guid: z.string().min(7).regex(/^[0-9a-fA-F]+$/),
  carrier: z.string().min(2),
});
type FormData = z.infer<typeof schema>;

export default function ChainPage() {
  const { config, chain, updateConfig } = useAppStore();
  const { walk, walking } = useChainWalk();
  const [expandedStep, setExpandedStep] = useState<number | null>(null);

  const {
    register,
    handleSubmit,
    formState: { errors },
  } = useForm<FormData>({
    resolver: zodResolver(schema),
    defaultValues: { guid: config.guid, carrier: config.carrier },
  });

  const onSubmit = async (data: FormData) => {
    updateConfig({ guid: data.guid, carrier: data.carrier });
    const result = await walk(data.guid, data.carrier);
    if (result.length > 0) {
      showToast(`Cadena encontrada: ${result.length} paso(s)`, 'success');
    } else {
      showToast('No se encontró cadena de actualizaciones', 'info');
    }
  };

  const copyToClipboard = (text: string) => {
    navigator.clipboard.writeText(text);
    showToast('Copiado al portapapeles', 'success');
  };

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
              <input
                {...register('carrier')}
                placeholder="ej: amxmx"
                className={cn(
                  'w-full rounded-xl border bg-white/[0.03] px-4 py-3 text-sm text-white',
                  'placeholder:text-gray-600 focus:outline-none focus:ring-2 focus:ring-violet-500/40',
                  errors.carrier ? 'border-red-500/40' : 'border-white/10',
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
          <motion.div
            initial={{ opacity: 0 }}
            animate={{ opacity: 1 }}
            className="space-y-3"
          >
            {/* Chain summary - matching Python CLI output */}
            <GlassCard className="p-4">
              <div className="flex flex-wrap items-center gap-x-4 gap-y-2 text-sm">
                <span className="text-gray-400">
                  <span className="font-semibold text-white">{chain.length}</span> paso{chain.length > 1 ? 's' : ''} en la cadena
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

            {chain.map((step, i) => (
              <motion.div
                key={i}
                initial={{ opacity: 0, x: -20 }}
                animate={{ opacity: 1, x: 0 }}
                transition={{ delay: i * 0.1 }}
              >
                <GlassCard className="p-4">
                  <button
                    onClick={() => setExpandedStep(expandedStep === i ? null : i)}
                    className="flex w-full items-center gap-3 text-left"
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
                    <ChevronDown
                      className={cn(
                        'h-4 w-4 text-gray-500 transition-transform',
                        expandedStep === i && 'rotate-180',
                      )}
                    />
                  </button>

                  <AnimatePresence>
                    {expandedStep === i && step.content && (
                      <motion.div
                        initial={{ height: 0, opacity: 0 }}
                        animate={{ height: 'auto', opacity: 1 }}
                        exit={{ height: 0, opacity: 0 }}
                        className="overflow-hidden"
                      >
                        <div className="mt-3 grid grid-cols-2 gap-2 border-t border-white/5 pt-3 text-xs">
                          <DetailItem label="Tipo" value={step.content.updateType} />
                          <DetailItem label="Tamaño" value={formatBytes(step.content.sizeBytes)} />
                          <DetailItem
                            label="GUID destino"
                            value={step.content.targetGuid}
                            mono
                            onCopy={copyToClipboard}
                          />
                          <DetailItem
                            label="MD5"
                            value={step.content.md5}
                            mono
                            onCopy={copyToClipboard}
                          />
                        </div>
                        {step.downloadUrls.length > 0 && (
                          <div className="mt-2 space-y-1">
                            {step.downloadUrls.map((url, j) => (
                              <a
                                key={j}
                                href={url}
                                target="_blank"
                                rel="noopener noreferrer"
                                className="flex items-center gap-2 rounded-lg bg-white/[0.02] px-3 py-1.5 text-xs text-blue-300 hover:text-blue-200"
                              >
                                <Download className="h-3 w-3" />
                                <span className="truncate">{url}</span>
                              </a>
                            ))}
                          </div>
                        )}
                      </motion.div>
                    )}
                  </AnimatePresence>
                </GlassCard>
              </motion.div>
            ))}
          </motion.div>
        )}
      </AnimatePresence>
    </div>
  );
}

function DetailItem({
  label,
  value,
  mono,
  onCopy,
}: {
  label: string;
  value: string;
  mono?: boolean;
  onCopy?: (v: string) => void;
}) {
  return (
    <div className="rounded bg-white/[0.02] px-2 py-1.5">
      <p className="text-[9px] uppercase tracking-wider text-gray-500">{label}</p>
      <div className="flex items-center gap-1">
        <p className={cn('flex-1 truncate text-gray-300', mono && 'font-mono')}>{value || '—'}</p>
        {onCopy && value && (
          <button onClick={() => onCopy(value)} className="text-gray-500 hover:text-white">
            <Copy className="h-3 w-3" />
          </button>
        )}
      </div>
    </div>
  );
}
