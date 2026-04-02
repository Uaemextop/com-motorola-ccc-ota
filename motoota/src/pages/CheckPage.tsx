/* ── Check Page ─────────────────────────────────────────────── */

import { useState } from 'react';
import { motion, AnimatePresence } from 'framer-motion';
import { useForm } from 'react-hook-form';
import { zodResolver } from '@hookform/resolvers/zod';
import { z } from 'zod';
import {
  Search,
  CheckCircle2,
  XCircle,
  Download,
  Copy,
  ChevronDown,
  ExternalLink,
} from 'lucide-react';
import GlassCard from '@/components/ui/GlassCard';
import Spinner from '@/components/ui/Spinner';
import StatusBadge from '@/components/ui/StatusBadge';
import { showToast } from '@/components/ui/Toast';
import { useOtaCheck } from '@/lib/hooks';
import { useAppStore } from '@/lib/store';
import { classifyCarrierStatus } from '@/lib/api/response';
import { formatBytes, cn } from '@/lib/utils';

const schema = z.object({
  guid: z.string().min(7, 'GUID debe tener al menos 7 caracteres').regex(/^[0-9a-fA-F]+$/, 'GUID debe ser hexadecimal'),
  carrier: z.string().min(2, 'Carrier requerido'),
});
type FormData = z.infer<typeof schema>;

export default function CheckPage() {
  const { config, lastCheck, updateConfig } = useAppStore();
  const { check, checking } = useOtaCheck();
  const [showRaw, setShowRaw] = useState(false);

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
    const result = await check(data.guid, data.carrier);
    if (result?.hasUpdate) {
      showToast(`¡Actualización encontrada! → ${result.content?.targetVersion}`, 'success');
    } else if (result) {
      showToast('No se encontró actualización para este carrier', 'info');
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
          <Search className="h-5 w-5 text-blue-400" />
          Verificar Actualización OTA
        </h3>
        <form onSubmit={handleSubmit(onSubmit)} className="space-y-4">
          <div>
            <label className="mb-1.5 block text-sm font-medium text-gray-400">
              GUID del dispositivo
            </label>
            <input
              {...register('guid')}
              placeholder="ej: 0d5cc74421f2e8a"
              className={cn(
                'w-full rounded-xl border bg-white/[0.03] px-4 py-3 text-sm text-white',
                'placeholder:text-gray-600 focus:outline-none focus:ring-2 focus:ring-blue-500/40',
                errors.guid ? 'border-red-500/40' : 'border-white/10',
              )}
            />
            {errors.guid && (
              <p className="mt-1 text-xs text-red-400">{errors.guid.message}</p>
            )}
          </div>

          <div>
            <label className="mb-1.5 block text-sm font-medium text-gray-400">
              Carrier
            </label>
            <input
              {...register('carrier')}
              placeholder="ej: amxmx, reteu, tmo"
              className={cn(
                'w-full rounded-xl border bg-white/[0.03] px-4 py-3 text-sm text-white',
                'placeholder:text-gray-600 focus:outline-none focus:ring-2 focus:ring-blue-500/40',
                errors.carrier ? 'border-red-500/40' : 'border-white/10',
              )}
            />
            {errors.carrier && (
              <p className="mt-1 text-xs text-red-400">{errors.carrier.message}</p>
            )}
          </div>

          <button
            type="submit"
            disabled={checking}
            className={cn(
              'flex w-full items-center justify-center gap-2 rounded-xl px-6 py-3 text-sm font-semibold',
              'bg-gradient-to-r from-blue-600 to-indigo-600 text-white',
              'shadow-lg shadow-blue-500/20 transition-all',
              'hover:shadow-blue-500/30 hover:brightness-110',
              'disabled:cursor-not-allowed disabled:opacity-50',
            )}
          >
            {checking ? <Spinner size="sm" /> : <Search className="h-4 w-4" />}
            {checking ? 'Verificando...' : 'Verificar'}
          </button>
        </form>
      </GlassCard>

      {/* Results */}
      <AnimatePresence>
        {lastCheck && (
          <motion.div
            initial={{ opacity: 0, y: 20 }}
            animate={{ opacity: 1, y: 0 }}
            exit={{ opacity: 0, y: -20 }}
          >
            <GlassCard>
              <div className="mb-4 flex items-center justify-between">
                <div className="flex items-center gap-3">
                  {lastCheck.hasUpdate ? (
                    <CheckCircle2 className="h-6 w-6 text-emerald-400" />
                  ) : (
                    <XCircle className="h-6 w-6 text-gray-500" />
                  )}
                  <h3 className="text-lg font-semibold text-white">
                    {lastCheck.hasUpdate ? 'Actualización disponible' : 'Sin actualización'}
                  </h3>
                </div>
                <StatusBadge status={classifyCarrierStatus(lastCheck)} />
              </div>

              {lastCheck.hasUpdate && lastCheck.content && (
                <div className="space-y-3">
                  <div className="grid grid-cols-2 gap-3">
                    <InfoRow label="Versión origen" value={lastCheck.content.sourceVersion} onCopy={copyToClipboard} />
                    <InfoRow label="Versión destino" value={lastCheck.content.targetVersion} onCopy={copyToClipboard} />
                    <InfoRow label="Tamaño" value={formatBytes(lastCheck.content.sizeBytes)} />
                    <InfoRow label="Tipo" value={lastCheck.content.updateType} />
                    <InfoRow label="GUID destino" value={lastCheck.content.targetGuid} onCopy={copyToClipboard} mono />
                    <InfoRow label="MD5" value={lastCheck.content.md5} onCopy={copyToClipboard} mono />
                  </div>

                  {/* Download URLs */}
                  {lastCheck.downloadUrls.length > 0 && (
                    <div className="mt-4 space-y-2">
                      <p className="text-sm font-medium text-gray-400">URLs de descarga</p>
                      {lastCheck.downloadUrls.map((url, i) => (
                        <div
                          key={i}
                          className="flex items-center gap-2 rounded-lg border border-white/5 bg-white/[0.02] px-3 py-2"
                        >
                          <Download className="h-4 w-4 shrink-0 text-blue-400" />
                          <a
                            href={url}
                            target="_blank"
                            rel="noopener noreferrer"
                            className="flex-1 truncate text-xs text-blue-300 hover:text-blue-200"
                          >
                            {url}
                          </a>
                          <button
                            onClick={() => copyToClipboard(url)}
                            className="shrink-0 rounded p-1 text-gray-500 hover:bg-white/5 hover:text-white"
                          >
                            <Copy className="h-3.5 w-3.5" />
                          </button>
                          <a
                            href={url}
                            target="_blank"
                            rel="noopener noreferrer"
                            className="shrink-0 rounded p-1 text-gray-500 hover:bg-white/5 hover:text-white"
                          >
                            <ExternalLink className="h-3.5 w-3.5" />
                          </a>
                        </div>
                      ))}
                    </div>
                  )}
                </div>
              )}

              {/* Raw JSON toggle */}
              <button
                onClick={() => setShowRaw(!showRaw)}
                className="mt-4 flex items-center gap-1.5 text-xs text-gray-500 transition-colors hover:text-gray-300"
              >
                <ChevronDown className={cn('h-3.5 w-3.5 transition-transform', showRaw && 'rotate-180')} />
                {showRaw ? 'Ocultar' : 'Mostrar'} respuesta JSON
              </button>
              <AnimatePresence>
                {showRaw && (
                  <motion.pre
                    initial={{ height: 0, opacity: 0 }}
                    animate={{ height: 'auto', opacity: 1 }}
                    exit={{ height: 0, opacity: 0 }}
                    className="mt-2 overflow-auto rounded-lg border border-white/5 bg-black/30 p-4 text-xs text-gray-400"
                  >
                    {JSON.stringify(lastCheck.raw, null, 2)}
                  </motion.pre>
                )}
              </AnimatePresence>
            </GlassCard>
          </motion.div>
        )}
      </AnimatePresence>
    </div>
  );
}

function InfoRow({
  label,
  value,
  onCopy,
  mono,
}: {
  label: string;
  value: string;
  onCopy?: (v: string) => void;
  mono?: boolean;
}) {
  return (
    <div className="rounded-lg border border-white/5 bg-white/[0.02] px-3 py-2">
      <p className="text-[10px] font-medium uppercase tracking-wider text-gray-500">{label}</p>
      <div className="mt-0.5 flex items-center gap-1.5">
        <p className={cn('flex-1 truncate text-sm text-white', mono && 'font-mono text-xs')}>
          {value || '—'}
        </p>
        {onCopy && value && (
          <button
            onClick={() => onCopy(value)}
            className="shrink-0 rounded p-0.5 text-gray-500 hover:text-white"
          >
            <Copy className="h-3 w-3" />
          </button>
        )}
      </div>
    </div>
  );
}
