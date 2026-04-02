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
  AlertTriangle,
  Download,
  Copy,
  ChevronDown,
  ExternalLink,
  FileText,
  Smartphone,
  Tag,
  Shield,
  Hash,
  Radio,
  Clock,
  Server,
} from 'lucide-react';
import GlassCard from '@/components/ui/GlassCard';
import Spinner from '@/components/ui/Spinner';
import StatusBadge from '@/components/ui/StatusBadge';
import { showToast } from '@/components/ui/Toast';
import { useOtaCheck } from '@/lib/hooks';
import { useAppStore } from '@/lib/store';
import { classifyCarrierStatus } from '@/lib/api/response';
import { getServerById } from '@/lib/api/servers';
import { formatBytes, cn } from '@/lib/utils';
import { DEFAULT_HEADERS, buildCheckURL, buildPayload } from '@/lib/api/endpoints';

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
  const { config, lastCheck, updateConfig } = useAppStore();
  const { check, checking } = useOtaCheck();
  const [showRaw, setShowRaw] = useState(false);
  const [showRequest, setShowRequest] = useState(false);
  const [showReleaseNotes, setShowReleaseNotes] = useState(false);

  const {
    register,
    handleSubmit,
    formState: { errors },
    watch,
  } = useForm<FormData>({
    resolver: zodResolver(schema),
    defaultValues: {
      guid: config.guid,
      carrier: config.carrier,
      serial: config.serial,
    },
  });

  const watchedGuid = watch('guid');
  const watchedCarrier = watch('carrier');
  const watchedSerial = watch('serial');

  const onSubmit = async (data: FormData) => {
    updateConfig({ guid: data.guid, carrier: data.carrier, serial: data.serial || '' });
    const result = await check(data.guid, data.carrier);
    if (result?.hasUpdate) {
      showToast(
        `¡Actualización encontrada! → ${result.content?.targetVersion}`,
        'success',
      );
    } else if (result) {
      const status = classifyCarrierStatus(result);
      if (status === 'whitelisted') {
        showToast('Carrier con whitelist — requiere serial autorizado', 'info');
      } else {
        showToast('No se encontró actualización para este carrier', 'info');
      }
    }
  };

  const copyToClipboard = (text: string) => {
    navigator.clipboard.writeText(text);
    showToast('Copiado al portapapeles', 'success');
  };

  const server = getServerById(config.server);
  const previewUrl = buildCheckURL(
    server?.host || 'moto-cds.appspot.com',
    config.context,
    watchedGuid || '<GUID>',
  );
  const previewPayload = buildPayload(
    watchedCarrier || '<CARRIER>',
    watchedGuid || '<GUID>',
    { serial: watchedSerial || 'x' },
  );

  return (
    <div className="mx-auto max-w-3xl space-y-6">
      {/* Form */}
      <GlassCard>
        <h3 className="mb-4 flex items-center gap-2 text-lg font-semibold text-white">
          <Search className="h-5 w-5 text-blue-400" />
          Verificar Actualización OTA
        </h3>
        <p className="mb-4 text-sm text-gray-400">
          Ingresa el GUID de tu dispositivo y el carrier para consultar el servidor CDS de
          Motorola.
        </p>

        <form onSubmit={handleSubmit(onSubmit)} className="space-y-4">
          {/* GUID */}
          <div>
            <label className="mb-1.5 flex items-center gap-1.5 text-sm font-medium text-gray-400">
              <Hash className="h-3.5 w-3.5" />
              GUID del dispositivo
              <span className="text-red-400">*</span>
            </label>
            <input
              {...register('guid')}
              placeholder="ej: 0d5cc74421f2e8a"
              className={cn(
                'w-full rounded-xl border bg-white/[0.03] px-4 py-3 font-mono text-sm text-white',
                'placeholder:text-gray-600 focus:outline-none focus:ring-2 focus:ring-blue-500/40',
                errors.guid ? 'border-red-500/40' : 'border-white/10',
              )}
            />
            {errors.guid && (
              <p className="mt-1 text-xs text-red-400">{errors.guid.message}</p>
            )}
            <p className="mt-1 text-[11px] text-gray-600">
              ro.mot.build.guid — identificador hexadecimal único del firmware
            </p>
          </div>

          {/* Carrier */}
          <div>
            <label className="mb-1.5 flex items-center gap-1.5 text-sm font-medium text-gray-400">
              <Radio className="h-3.5 w-3.5" />
              Carrier
              <span className="text-red-400">*</span>
            </label>
            <input
              {...register('carrier')}
              placeholder="ej: amxmx, reteu, tmo, retla"
              className={cn(
                'w-full rounded-xl border bg-white/[0.03] px-4 py-3 text-sm text-white',
                'placeholder:text-gray-600 focus:outline-none focus:ring-2 focus:ring-blue-500/40',
                errors.carrier ? 'border-red-500/40' : 'border-white/10',
              )}
            />
            {errors.carrier && (
              <p className="mt-1 text-xs text-red-400">{errors.carrier.message}</p>
            )}
            <p className="mt-1 text-[11px] text-gray-600">
              Código del carrier — determina la cadena de firmware OTA
            </p>
          </div>

          {/* Serial (optional) */}
          <div>
            <label className="mb-1.5 flex items-center gap-1.5 text-sm font-medium text-gray-400">
              <Smartphone className="h-3.5 w-3.5" />
              Número de serie
              <span className="text-xs text-gray-600">(opcional)</span>
            </label>
            <input
              {...register('serial')}
              placeholder="ej: ZY32LNRW97"
              className="w-full rounded-xl border border-white/10 bg-white/[0.03] px-4 py-3 font-mono text-sm text-white placeholder:text-gray-600 focus:outline-none focus:ring-2 focus:ring-blue-500/40"
            />
            <p className="mt-1 text-[11px] text-gray-600">
              Número de serie del dispositivo — el servidor lo ignora para carriers abiertos
            </p>
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
            {checking ? 'Consultando servidor CDS...' : 'Verificar Actualización'}
          </button>
        </form>

        {/* Request preview */}
        <button
          onClick={() => setShowRequest(!showRequest)}
          className="mt-4 flex items-center gap-1.5 text-xs text-gray-500 transition-colors hover:text-gray-300"
        >
          <ChevronDown
            className={cn(
              'h-3.5 w-3.5 transition-transform',
              showRequest && 'rotate-180',
            )}
          />
          {showRequest ? 'Ocultar' : 'Ver'} solicitud HTTP que se enviará
        </button>
        <AnimatePresence>
          {showRequest && (
            <motion.div
              initial={{ height: 0, opacity: 0 }}
              animate={{ height: 'auto', opacity: 1 }}
              exit={{ height: 0, opacity: 0 }}
              className="mt-2 overflow-hidden rounded-lg border border-white/5 bg-black/30 p-4 text-xs"
            >
              <p className="mb-2 font-semibold text-blue-400">
                <span className="rounded bg-blue-500/20 px-1.5 py-0.5 font-mono">POST</span>{' '}
                <span className="break-all font-mono text-gray-300">{previewUrl}</span>
              </p>
              <p className="mb-1 text-[10px] uppercase tracking-wider text-gray-500">Headers</p>
              <pre className="mb-3 font-mono text-gray-400">
                {Object.entries(DEFAULT_HEADERS)
                  .map(([k, v]) => `${k}: ${v}`)
                  .join('\n')}
              </pre>
              <p className="mb-1 text-[10px] uppercase tracking-wider text-gray-500">
                Body (JSON)
              </p>
              <pre className="font-mono text-gray-400">
                {JSON.stringify(previewPayload, null, 2)}
              </pre>
            </motion.div>
          )}
        </AnimatePresence>
      </GlassCard>

      {/* Results */}
      <AnimatePresence>
        {lastCheck && (
          <motion.div
            initial={{ opacity: 0, y: 20 }}
            animate={{ opacity: 1, y: 0 }}
            exit={{ opacity: 0, y: -20 }}
            className="space-y-4"
          >
            {/* Status header */}
            <GlassCard>
              <div className="flex items-center justify-between">
                <div className="flex items-center gap-3">
                  {lastCheck.hasUpdate ? (
                    <div className="flex h-10 w-10 items-center justify-center rounded-xl bg-emerald-500/10">
                      <CheckCircle2 className="h-6 w-6 text-emerald-400" />
                    </div>
                  ) : classifyCarrierStatus(lastCheck) === 'whitelisted' ? (
                    <div className="flex h-10 w-10 items-center justify-center rounded-xl bg-amber-500/10">
                      <AlertTriangle className="h-6 w-6 text-amber-400" />
                    </div>
                  ) : (
                    <div className="flex h-10 w-10 items-center justify-center rounded-xl bg-gray-500/10">
                      <XCircle className="h-6 w-6 text-gray-500" />
                    </div>
                  )}
                  <div>
                    <h3 className="text-lg font-semibold text-white">
                      {lastCheck.hasUpdate
                        ? 'Actualización disponible'
                        : classifyCarrierStatus(lastCheck) === 'whitelisted'
                          ? 'Carrier con whitelist'
                          : 'Sin actualización'}
                    </h3>
                    <p className="text-xs text-gray-500">
                      proceed={String(lastCheck.proceed)} · x-cds-content-exists=
                      {String(lastCheck.xCdsContentExists)}
                    </p>
                  </div>
                </div>
                <StatusBadge status={classifyCarrierStatus(lastCheck)} />
              </div>
            </GlassCard>

            {/* Update details */}
            {lastCheck.hasUpdate && lastCheck.content && (
              <>
                <GlassCard>
                  <h4 className="mb-3 flex items-center gap-2 text-sm font-semibold text-gray-300">
                    <Tag className="h-4 w-4 text-blue-400" />
                    Información de la actualización
                  </h4>
                  <div className="grid grid-cols-1 gap-3 sm:grid-cols-2">
                    <InfoRow
                      icon={Tag}
                      label="Versión origen"
                      value={lastCheck.content.sourceVersion}
                      onCopy={copyToClipboard}
                    />
                    <InfoRow
                      icon={Tag}
                      label="Versión destino"
                      value={lastCheck.content.targetVersion}
                      onCopy={copyToClipboard}
                      highlight
                    />
                    <InfoRow label="Tamaño" value={formatBytes(lastCheck.content.sizeBytes)} />
                    <InfoRow label="Tipo" value={lastCheck.content.updateType} />
                    <InfoRow icon={Smartphone} label="Modelo" value={lastCheck.content.model} />
                    <InfoRow label="Fase" value={lastCheck.content.deploymentPhase} />
                    <InfoRow
                      icon={Hash}
                      label="GUID destino"
                      value={lastCheck.content.targetGuid}
                      onCopy={copyToClipboard}
                      mono
                    />
                    <InfoRow
                      icon={Shield}
                      label="MD5"
                      value={lastCheck.content.md5}
                      onCopy={copyToClipboard}
                      mono
                    />
                    <InfoRow
                      label="Package ID"
                      value={lastCheck.content.packageId}
                      onCopy={copyToClipboard}
                      mono
                      className="sm:col-span-2"
                    />
                  </div>
                </GlassCard>

                {/* Download URLs */}
                {lastCheck.contentResources.length > 0 && (
                  <GlassCard>
                    <h4 className="mb-3 flex items-center gap-2 text-sm font-semibold text-gray-300">
                      <Download className="h-4 w-4 text-emerald-400" />
                      URLs de descarga ({lastCheck.contentResources.length})
                    </h4>
                    <div className="space-y-2">
                      {lastCheck.contentResources.map((resource, i) => (
                        <div
                          key={i}
                          className="rounded-xl border border-white/5 bg-white/[0.02] p-3"
                        >
                          <div className="mb-2 flex items-center gap-2">
                            {resource.tags.map((tag) => (
                              <span
                                key={tag}
                                className="rounded-full bg-blue-500/10 px-2 py-0.5 text-[10px] font-medium text-blue-400"
                              >
                                {tag}
                              </span>
                            ))}
                            {resource.urlTtlSeconds > 0 && (
                              <span className="flex items-center gap-1 text-[10px] text-gray-500">
                                <Clock className="h-3 w-3" />
                                TTL: {resource.urlTtlSeconds}s
                              </span>
                            )}
                          </div>
                          <div className="flex items-center gap-2">
                            <a
                              href={resource.url}
                              target="_blank"
                              rel="noopener noreferrer"
                              className="flex-1 truncate font-mono text-xs text-blue-300 hover:text-blue-200"
                            >
                              {resource.url}
                            </a>
                            <button
                              onClick={() => copyToClipboard(resource.url)}
                              className="shrink-0 rounded p-1.5 text-gray-500 hover:bg-white/5 hover:text-white"
                            >
                              <Copy className="h-3.5 w-3.5" />
                            </button>
                            <a
                              href={resource.url}
                              target="_blank"
                              rel="noopener noreferrer"
                              className="shrink-0 rounded p-1.5 text-gray-500 hover:bg-white/5 hover:text-white"
                            >
                              <ExternalLink className="h-3.5 w-3.5" />
                            </a>
                          </div>
                        </div>
                      ))}
                    </div>
                  </GlassCard>
                )}

                {/* Release notes */}
                {lastCheck.content.releaseNotes && (
                  <GlassCard>
                    <button
                      onClick={() => setShowReleaseNotes(!showReleaseNotes)}
                      className="flex w-full items-center justify-between"
                    >
                      <h4 className="flex items-center gap-2 text-sm font-semibold text-gray-300">
                        <FileText className="h-4 w-4 text-violet-400" />
                        Notas de la versión
                      </h4>
                      <ChevronDown
                        className={cn(
                          'h-4 w-4 text-gray-500 transition-transform',
                          showReleaseNotes && 'rotate-180',
                        )}
                      />
                    </button>
                    <AnimatePresence>
                      {showReleaseNotes && (
                        <motion.div
                          initial={{ height: 0, opacity: 0 }}
                          animate={{ height: 'auto', opacity: 1 }}
                          exit={{ height: 0, opacity: 0 }}
                          className="mt-3 overflow-hidden rounded-lg border border-white/5 bg-black/20 p-4"
                        >
                          <div
                            className="text-sm leading-relaxed text-gray-300 [&_h3]:mt-3 [&_h3]:text-base [&_h3]:font-semibold [&_h3]:text-white [&_p]:mt-1"
                            dangerouslySetInnerHTML={{
                              __html: lastCheck.content.releaseNotes,
                            }}
                          />
                        </motion.div>
                      )}
                    </AnimatePresence>
                  </GlassCard>
                )}
              </>
            )}

            {/* Server info */}
            <GlassCard className="p-4">
              <div className="flex items-center gap-2 text-xs text-gray-500">
                <Server className="h-3.5 w-3.5" />
                <span>
                  Servidor: {server?.name} ({server?.host}) · pollAfterSeconds:{' '}
                  {lastCheck.pollAfterSeconds} · smartUpdateBitmap:{' '}
                  {lastCheck.smartUpdateBitmap}
                </span>
              </div>
            </GlassCard>

            {/* Raw JSON */}
            <GlassCard className="p-4">
              <button
                onClick={() => setShowRaw(!showRaw)}
                className="flex w-full items-center gap-1.5 text-xs text-gray-500 transition-colors hover:text-gray-300"
              >
                <ChevronDown
                  className={cn(
                    'h-3.5 w-3.5 transition-transform',
                    showRaw && 'rotate-180',
                  )}
                />
                {showRaw ? 'Ocultar' : 'Mostrar'} respuesta JSON completa del servidor
              </button>
              <AnimatePresence>
                {showRaw && (
                  <motion.pre
                    initial={{ height: 0, opacity: 0 }}
                    animate={{ height: 'auto', opacity: 1 }}
                    exit={{ height: 0, opacity: 0 }}
                    className="mt-3 max-h-[400px] overflow-auto rounded-lg border border-white/5 bg-black/30 p-4 font-mono text-xs text-gray-400"
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
  icon: Icon,
  label,
  value,
  onCopy,
  mono,
  highlight,
  className,
}: {
  icon?: React.ElementType;
  label: string;
  value: string;
  onCopy?: (v: string) => void;
  mono?: boolean;
  highlight?: boolean;
  className?: string;
}) {
  return (
    <div
      className={cn(
        'rounded-xl border border-white/5 bg-white/[0.02] px-3 py-2.5',
        className,
      )}
    >
      <p className="flex items-center gap-1.5 text-[10px] font-medium uppercase tracking-wider text-gray-500">
        {Icon && <Icon className="h-3 w-3" />}
        {label}
      </p>
      <div className="mt-1 flex items-center gap-1.5">
        <p
          className={cn(
            'flex-1 truncate text-sm',
            mono && 'font-mono text-xs',
            highlight ? 'font-semibold text-emerald-400' : 'text-white',
          )}
        >
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
