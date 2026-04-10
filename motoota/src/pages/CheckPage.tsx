/* ── Check Page ─────────────────────────────────────────────── */

import { useState, useEffect } from 'react';
import { motion, AnimatePresence } from 'framer-motion';
import { useForm, Controller } from 'react-hook-form';
import { zodResolver } from '@hookform/resolvers/zod';
import { z } from 'zod';
import {
  Search,
  CheckCircle2,
  XCircle,
  AlertTriangle,
  Download,
  Copy,
  ChevronDown,
  Smartphone,
  Hash,
  Radio,
  Clock,
  Server,
  RotateCcw,
} from 'lucide-react';
import GlassCard from '@/components/ui/GlassCard';
import Spinner from '@/components/ui/Spinner';
import StatusBadge from '@/components/ui/StatusBadge';
import CarrierSelect from '@/components/ui/CarrierSelect';
import AttrCell from '@/components/ui/AttrCell';
import DownloadButton from '@/components/ui/DownloadButton';
import ResourceUrlList from '@/components/ui/ResourceUrlList';
import ReleaseNotes from '@/components/ui/ReleaseNotes';
import JsonViewer from '@/components/ui/JsonViewer';
import { showToast } from '@/components/ui/Toast';
import { useOtaCheck } from '@/lib/hooks';
import { useAppStore } from '@/lib/store';
import { classifyCarrierStatus } from '@/lib/api/response';
import { getServerById } from '@/lib/api/servers';
import { formatBytes, cn, buildDownloadFilename, copyToClipboard } from '@/lib/utils';
import { DEFAULT_HEADERS, buildCheckURL, buildPayload } from '@/lib/api/endpoints';
import { getLastRequestLog } from '@/lib/api/client';

const schema = z.object({
  guid: z
    .string()
    .min(7, 'GUID debe tener al menos 7 caracteres')
    .regex(/^[0-9a-fA-F]+$/, 'GUID debe ser hexadecimal'),
  carrier: z.string().min(2, 'Carrier requerido'),
  serial: z.string().optional(),
});
type FormData = z.infer<typeof schema>;

export default function CheckPage() {
  const { config, lastCheck, error, updateConfig, setLastCheck, setError } = useAppStore();
  const { check, checking } = useOtaCheck();
  const [showRaw, setShowRaw] = useState(false);
  const [showRequest, setShowRequest] = useState(false);
  const [showDebug, setShowDebug] = useState(false);
  const [requestLog, setRequestLog] = useState<ReturnType<typeof getLastRequestLog>>(null);
  const [formCollapsed, setFormCollapsed] = useState(false);

  const {
    register,
    handleSubmit,
    control,
    formState: { errors },
    watch,
    getValues,
    reset,
  } = useForm<FormData>({
    resolver: zodResolver(schema),
    defaultValues: {
      guid: config.guid,
      carrier: config.carrier,
      serial: config.serial,
    },
  });

  useEffect(() => {
    reset({ guid: config.guid, carrier: config.carrier, serial: config.serial });
  }, [config.guid, config.carrier, config.serial, reset]);

  /* Only subscribe to form changes when request preview is visible */
  const formValues = showRequest ? watch() : getValues();
  const watchedGuid = formValues.guid ?? '';
  const watchedCarrier = formValues.carrier ?? '';
  const watchedSerial = formValues.serial ?? '';

  const onSubmit = async (data: FormData) => {
    updateConfig({ guid: data.guid, carrier: data.carrier, serial: data.serial || '' });
    setRequestLog(null);
    const result = await check(data.guid, data.carrier);
    setRequestLog(getLastRequestLog());
    if (result?.hasUpdate) {
      setFormCollapsed(true);
      showToast(`¡Actualización encontrada! → ${result.content?.targetVersion}`, 'success');
    } else if (result) {
      const status = classifyCarrierStatus(result);
      if (status === 'whitelisted') {
        setFormCollapsed(true);
        showToast('Carrier con whitelist — requiere serial autorizado', 'info');
      } else {
        showToast('No se encontró actualización para este carrier', 'info');
      }
    } else {
      setRequestLog(getLastRequestLog());
    }
  };

  const resetSearch = () => {
    setFormCollapsed(false);
    setLastCheck(null);
    setError(null);
    setRequestLog(null);
    setShowRaw(false);
    setShowDebug(false);
  };

  const handleCopy = async (text: string) => {
    const success = await copyToClipboard(text);
    showToast(success ? 'Copiado al portapapeles' : 'No se pudo copiar al portapapeles', success ? 'success' : 'error');
  };

  const server = getServerById(config.server);
  const carrierStatus = lastCheck ? classifyCarrierStatus(lastCheck) : null;

  return (
    <div className="mx-auto max-w-3xl space-y-4">
      {/* ── Search Form (collapsible) ──────────────────────────── */}
      <AnimatePresence mode="wait">
        {!formCollapsed ? (
          <motion.div
            key="form"
            initial={{ opacity: 0, y: -10 }}
            animate={{ opacity: 1, y: 0 }}
            exit={{ opacity: 0, height: 0, marginBottom: 0 }}
            transition={{ duration: 0.3 }}
          >
            <GlassCard>
              <h3 className="mb-3 flex items-center gap-2 text-lg font-semibold text-white">
                <Search className="h-5 w-5 text-blue-400" />
                Verificar Actualización OTA
              </h3>
              <p className="mb-4 text-sm text-gray-400">
                Ingresa el GUID y carrier para consultar el servidor CDS de Motorola.
              </p>

              <form onSubmit={handleSubmit(onSubmit)} className="space-y-4">
                {/* GUID + Serial row */}
                <div className="grid gap-4 sm:grid-cols-[1fr,auto]">
                  <div>
                    <label className="mb-1.5 flex items-center gap-1.5 text-sm font-medium text-gray-400">
                      <Hash className="h-3.5 w-3.5" />
                      GUID
                      <span className="text-red-400">*</span>
                    </label>
                    <input
                      {...register('guid')}
                      placeholder="0d5cc74421f2e8a"
                      className={cn(
                        'w-full rounded-xl border bg-white/[0.03] px-4 py-2.5 font-mono text-sm text-white',
                        'placeholder:text-gray-500 focus:outline-none focus:ring-2 focus:ring-blue-500/40',
                        errors.guid ? 'border-red-500/40' : 'border-white/10',
                      )}
                    />
                    {errors.guid && (
                      <p className="mt-1 text-xs text-red-400">{errors.guid.message}</p>
                    )}
                  </div>
                  <div>
                    <label className="mb-1.5 flex items-center gap-1.5 text-sm font-medium text-gray-400">
                      <Smartphone className="h-3.5 w-3.5" />
                      Serial
                      <span className="text-xs text-gray-600">(opc.)</span>
                    </label>
                    <input
                      {...register('serial')}
                      placeholder="ZY32LNRW97"
                      className="w-full rounded-xl border border-white/10 bg-white/[0.03] px-4 py-2.5 font-mono text-sm text-white placeholder:text-gray-500 focus:outline-none focus:ring-2 focus:ring-blue-500/40"
                    />
                  </div>
                </div>

                {/* Carrier */}
                <div>
                  <label className="mb-1.5 flex items-center gap-1.5 text-sm font-medium text-gray-400">
                    <Radio className="h-3.5 w-3.5" />
                    Carrier
                    <span className="text-red-400">*</span>
                  </label>
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

                {/* Submit */}
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
                  {checking ? 'Consultando servidor CDS...' : 'Verificar Actualización'}
                </button>
              </form>

              {/* Request preview toggle */}
              <button
                onClick={() => setShowRequest(!showRequest)}
                aria-expanded={showRequest}
                className="mt-3 flex items-center gap-1.5 text-xs text-gray-500 transition-colors hover:text-gray-300"
              >
                <ChevronDown className={cn('h-3.5 w-3.5 transition-transform', showRequest && 'rotate-180')} />
                {showRequest ? 'Ocultar' : 'Ver'} solicitud HTTP
              </button>
              <AnimatePresence>
                {showRequest && (
                  <motion.div
                    initial={{ height: 0, opacity: 0 }}
                    animate={{ height: 'auto', opacity: 1 }}
                    exit={{ height: 0, opacity: 0 }}
                    className="mt-2 overflow-hidden rounded-lg border border-white/5 bg-black/30 p-3 text-xs"
                  >
                    <p className="mb-2 font-semibold text-blue-400">
                      <span className="rounded bg-blue-500/20 px-1.5 py-0.5 font-mono">POST</span>{' '}
                      <span className="break-all font-mono text-gray-300">
                        {buildCheckURL(server?.host || 'moto-cds.appspot.com', config.context, watchedGuid || '<GUID>')}
                      </span>
                    </p>
                    <pre className="mb-2 font-mono text-gray-500">
                      {Object.entries(DEFAULT_HEADERS).map(([k, v]) => `${k}: ${v}`).join('\n')}
                    </pre>
                    <JsonViewer data={buildPayload(watchedCarrier || '<CARRIER>', watchedGuid || '<GUID>', { serial: watchedSerial || 'x' })} accent="blue" maxHeight="300px" />
                  </motion.div>
                )}
              </AnimatePresence>
            </GlassCard>
          </motion.div>
        ) : (
          /* Collapsed summary bar */
          <motion.div
            key="collapsed"
            initial={{ opacity: 0, y: -10 }}
            animate={{ opacity: 1, y: 0 }}
          >
            <GlassCard className="p-4">
              <div className="flex flex-col gap-3 sm:flex-row sm:items-center sm:justify-between">
                <div className="flex flex-wrap items-center gap-2 text-sm text-gray-400">
                  <Search className="h-4 w-4 shrink-0 text-blue-400" />
                  <span className="truncate font-mono text-white">{config.guid}</span>
                  <span className="text-gray-600">·</span>
                  <span className="text-white">{config.carrier}</span>
                  <span className="hidden text-gray-600 sm:inline">·</span>
                  <span className="hidden text-gray-500 sm:inline">{server?.name}</span>
                </div>
                <button
                  onClick={resetSearch}
                  className="flex items-center gap-1.5 self-start rounded-lg border border-white/10 bg-white/[0.03] px-3 py-1.5 text-xs text-gray-400 transition-colors hover:border-white/20 hover:text-white sm:self-auto"
                >
                  <RotateCcw className="h-3 w-3" />
                  Modificar
                </button>
              </div>
            </GlassCard>
          </motion.div>
        )}
      </AnimatePresence>

      {/* ── Error ──────────────────────────────────────────────── */}
      <AnimatePresence>
        {error && !checking && (
          <motion.div initial={{ opacity: 0, y: 10 }} animate={{ opacity: 1, y: 0 }} exit={{ opacity: 0 }}>
            <GlassCard className="border-red-500/20 p-4">
              <div className="flex items-start gap-3">
                <XCircle className="mt-0.5 h-5 w-5 shrink-0 text-red-400" />
                <div className="flex-1 text-sm">
                  <p className="font-medium text-red-400">Error</p>
                  <p className="mt-1 text-xs text-gray-400">{error}</p>
                  {requestLog && (
                    <details className="mt-2">
                      <summary className="cursor-pointer text-[10px] text-gray-500 hover:text-gray-300">
                        Detalle técnico
                      </summary>
                      <pre className="mt-1 max-h-32 overflow-auto font-mono text-[10px] text-gray-600">
                        {requestLog.url} → HTTP {requestLog.responseStatus ?? '—'} ({requestLog.durationMs}ms)
                        {'\n'}{requestLog.responseBody?.slice(0, 300)}
                      </pre>
                    </details>
                  )}
                </div>
              </div>
            </GlassCard>
          </motion.div>
        )}
      </AnimatePresence>

      {/* ── Results ────────────────────────────────────────────── */}
      <AnimatePresence>
        {lastCheck && (
          <motion.div
            initial={{ opacity: 0, y: 20 }}
            animate={{ opacity: 1, y: 0 }}
            exit={{ opacity: 0, y: -20 }}
            className="space-y-4"
          >
            {/* Status + Key info in one card */}
            <GlassCard className="p-5">
              {/* Status header */}
              <div className="flex items-center gap-3">
                {lastCheck.hasUpdate ? (
                  <div className="flex h-10 w-10 items-center justify-center rounded-xl bg-emerald-500/10">
                    <CheckCircle2 className="h-6 w-6 text-emerald-400" />
                  </div>
                ) : carrierStatus === 'whitelisted' ? (
                  <div className="flex h-10 w-10 items-center justify-center rounded-xl bg-amber-500/10">
                    <AlertTriangle className="h-6 w-6 text-amber-400" />
                  </div>
                ) : (
                  <div className="flex h-10 w-10 items-center justify-center rounded-xl bg-gray-500/10">
                    <XCircle className="h-6 w-6 text-gray-500" />
                  </div>
                )}
                <div className="flex-1">
                  <h3 className="text-lg font-semibold text-white">
                    {lastCheck.hasUpdate
                      ? 'Actualización disponible'
                      : carrierStatus === 'whitelisted'
                        ? 'Carrier con whitelist'
                        : 'Sin actualización'}
                  </h3>
                  <p className="text-xs text-gray-500">
                    proceed={String(lastCheck.proceed)} · x-cds-content-exists={String(lastCheck.xCdsContentExists)}
                  </p>
                </div>
                <StatusBadge status={carrierStatus!} />
              </div>

              {/* Update details inline */}
              {lastCheck.hasUpdate && lastCheck.content && (
                <div className="mt-4 space-y-3 border-t border-white/5 pt-4">
                  {/* Version banner */}
                  <div className="flex items-center gap-3 text-sm">
                    <span className="rounded-lg bg-white/[0.04] px-3 py-1.5 font-mono text-gray-300">
                      {lastCheck.content.sourceVersion}
                    </span>
                    <span className="text-blue-400">→</span>
                    <span className="rounded-lg bg-emerald-500/10 px-3 py-1.5 font-mono font-semibold text-emerald-400">
                      {lastCheck.content.targetVersion}
                    </span>
                  </div>

                  {/* Grid de atributos */}
                  <div className="grid grid-cols-2 gap-2 text-xs sm:grid-cols-3">
                    <AttrCell label="Tamaño" value={formatBytes(lastCheck.content.sizeBytes)} />
                    <AttrCell label="Tipo" value={lastCheck.content.updateType} />
                    <AttrCell label="Modelo" value={lastCheck.content.model} />
                    <AttrCell label="Fase" value={lastCheck.content.deploymentPhase} />
                    <AttrCell label="GUID destino" value={lastCheck.content.targetGuid} mono copy={handleCopy} />
                    <AttrCell label="MD5" value={lastCheck.content.md5} mono copy={handleCopy} />
                  </div>

                  {/* Package ID (full width) */}
                  {lastCheck.content.packageId && (
                    <AttrCell label="Package ID" value={lastCheck.content.packageId} mono copy={handleCopy} />
                  )}
                </div>
              )}
            </GlassCard>

            {/* Download */}
            {lastCheck.hasUpdate && lastCheck.contentResources.length > 0 && (() => {
              const networkTag = config.downloadNetwork === 'wifi' ? 'WIFI' : 'CELL';
              const filtered = lastCheck.contentResources.filter((r) =>
                r.tags.some((t) => t.toUpperCase() === networkTag),
              );
              const primaryUrl = filtered[0]?.url || lastCheck.downloadUrls[0];
              const dlName = lastCheck.content ? buildDownloadFilename(lastCheck.content.targetVersion, config.carrier) : undefined;
              return (
              <GlassCard className="p-5">
                <h4 className="mb-3 flex items-center gap-2 text-sm font-semibold text-gray-300">
                  <Download className="h-4 w-4 text-emerald-400" />
                  Descargas ({filtered.length})
                </h4>
                {primaryUrl && dlName && (
                  <div className="mb-3">
                    <DownloadButton
                      url={primaryUrl}
                      filename={dlName}
                      sizeMB={lastCheck.content?.sizeMB}
                      onError={() => showToast('Error al descargar', 'error')}
                    />
                  </div>
                )}
                <ResourceUrlList resources={filtered} onCopy={handleCopy} />
              </GlassCard>
              );
            })()}

            {/* Release notes */}
            {lastCheck.hasUpdate && lastCheck.content?.releaseNotes && (
              <GlassCard className="p-5">
                <ReleaseNotes html={lastCheck.content.releaseNotes} />
              </GlassCard>
            )}

            {/* Footer: server info + debug + raw JSON */}
            <GlassCard className="space-y-3 p-4">
              {/* Server info */}
              <div className="flex items-center gap-2 text-xs text-gray-500">
                <Server className="h-3.5 w-3.5" />
                <span>
                  {server?.name} ({server?.host}) · poll: {lastCheck.pollAfterSeconds}s · bitmap: {lastCheck.smartUpdateBitmap}
                </span>
              </div>

              {/* Debug toggle */}
              {requestLog && (
                <>
                  <button
                    onClick={() => setShowDebug(!showDebug)}
                    aria-expanded={showDebug}
                    className="flex items-center gap-1.5 text-xs text-gray-500 transition-colors hover:text-gray-300"
                  >
                    <ChevronDown className={cn('h-3 w-3 transition-transform', showDebug && 'rotate-180')} />
                    {showDebug ? 'Ocultar' : 'Ver'} solicitud y respuesta HTTP
                  </button>
                  <AnimatePresence>
                    {showDebug && (
                      <motion.div
                        initial={{ height: 0, opacity: 0 }}
                        animate={{ height: 'auto', opacity: 1 }}
                        exit={{ height: 0, opacity: 0 }}
                        className="space-y-2 overflow-hidden text-xs"
                      >
                        <div className="rounded-lg border border-blue-500/10 bg-blue-500/5 p-3">
                          <p className="mb-1 text-[10px] font-semibold uppercase tracking-wider text-blue-400">Solicitud</p>
                          <p className="font-mono text-gray-400">
                            <span className="rounded bg-blue-500/20 px-1 py-0.5 text-blue-300">POST</span> {requestLog.url}
                          </p>
                          <pre className="mt-1 font-mono text-gray-500">
                            {Object.entries(DEFAULT_HEADERS).map(([k, v]) => `${k}: ${v}`).join('\n')}
                          </pre>
                          <JsonViewer data={requestLog.body} accent="blue" maxHeight="200px" className="mt-1" />
                        </div>
                        <div className="rounded-lg border border-emerald-500/10 bg-emerald-500/5 p-3">
                          <p className="mb-1 text-[10px] font-semibold uppercase tracking-wider text-emerald-400">Respuesta</p>
                          <div className="mb-1 flex items-center gap-2">
                            <span className={cn(
                              'rounded px-1.5 py-0.5 font-mono',
                              requestLog.responseStatus && requestLog.responseStatus < 300
                                ? 'bg-emerald-500/20 text-emerald-300'
                                : 'bg-red-500/20 text-red-300',
                            )}>
                              {requestLog.responseStatus ?? '—'}
                            </span>
                            <span className="text-gray-600">{requestLog.durationMs}ms</span>
                          </div>
                          {Object.keys(requestLog.responseHeaders).length > 0 && (
                            <pre className="mb-1 max-h-20 overflow-auto font-mono text-gray-500">
                              {Object.entries(requestLog.responseHeaders).map(([k, v]) => `${k}: ${v}`).join('\n')}
                            </pre>
                          )}
                        </div>
                      </motion.div>
                    )}
                  </AnimatePresence>
                </>
              )}

              {/* Raw JSON toggle */}
              <button
                onClick={() => setShowRaw(!showRaw)}
                aria-expanded={showRaw}
                className="flex items-center gap-1.5 text-xs text-gray-500 transition-colors hover:text-gray-300"
              >
                <ChevronDown className={cn('h-3 w-3 transition-transform', showRaw && 'rotate-180')} />
                {showRaw ? 'Ocultar' : 'Ver'} JSON completo
              </button>
              <AnimatePresence>
                {showRaw && (
                  <motion.div
                    initial={{ height: 0, opacity: 0 }}
                    animate={{ height: 'auto', opacity: 1 }}
                    exit={{ height: 0, opacity: 0 }}
                    className="overflow-hidden"
                  >
                    <JsonViewer data={lastCheck.raw} accent="emerald" maxHeight="400px" />
                  </motion.div>
                )}
              </AnimatePresence>
            </GlassCard>

            {/* New search button */}
            <button
              onClick={resetSearch}
              className={cn(
                'flex w-full items-center justify-center gap-2 rounded-xl px-6 py-3 text-sm font-semibold',
                'border border-white/10 bg-white/[0.03] text-gray-300',
                'transition-all hover:border-white/20 hover:bg-white/[0.06] hover:text-white',
              )}
            >
              <RotateCcw className="h-4 w-4" />
              Iniciar nueva búsqueda
            </button>
          </motion.div>
        )}
      </AnimatePresence>
    </div>
  );
}
