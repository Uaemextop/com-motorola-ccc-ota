/* ── Config Page ────────────────────────────────────────────── */

import { motion } from 'framer-motion';
import { useForm, Controller } from 'react-hook-form';
import { zodResolver } from '@hookform/resolvers/zod';
import { z } from 'zod';
import {
  Settings,
  Save,
  RotateCcw,
  Database,
  Globe2,
  Timer,
  Hash,
  Radio,
  Wifi,
} from 'lucide-react';
import GlassCard from '@/components/ui/GlassCard';
import CarrierSelect from '@/components/ui/CarrierSelect';
import { showToast } from '@/components/ui/Toast';
import { useAppStore } from '@/lib/store';
import { SERVERS } from '@/lib/api/servers';
import { cn } from '@/lib/utils';

const schema = z.object({
  guid: z.string().optional(),
  carrier: z.string().optional(),
  serial: z.string().optional(),
  server: z.string(),
  context: z.string(),
  region: z.string(),
  timeout: z.number().min(5).max(120),
  downloadNetwork: z.enum(['wifi', 'cell']),
});
type FormData = z.infer<typeof schema>;

export default function ConfigPage() {
  const { config, updateConfig } = useAppStore();

  const {
    register,
    handleSubmit,
    control,
    reset,
    formState: { isDirty },
  } = useForm<FormData>({
    resolver: zodResolver(schema),
    defaultValues: config,
  });

  const onSubmit = (data: FormData) => {
    try {
      updateConfig(data);
      showToast('Configuración guardada', 'success');
      reset(data);
    } catch {
      showToast('Error al guardar la configuración', 'error');
    }
  };

  const onReset = () => {
    const defaults = {
      server: 'production-global',
      guid: '',
      carrier: '',
      serial: '',
      context: 'ota',
      region: 'Global',
      timeout: 30,
      downloadNetwork: 'wifi' as const,
    };
    updateConfig(defaults);
    reset(defaults);
    showToast('Configuración restablecida', 'info');
  };

  return (
    <div className="mx-auto max-w-2xl space-y-6">
      <GlassCard>
        <h3 className="mb-4 flex items-center gap-2 text-lg font-semibold text-white">
          <Settings className="h-5 w-5 text-gray-400" />
          Configuración
        </h3>
        <p className="mb-6 text-sm text-gray-400">
          Configura los parámetros predeterminados para las consultas OTA. La configuración se
          guarda automáticamente en el navegador.
        </p>

        <form onSubmit={handleSubmit(onSubmit)} className="space-y-5">
          {/* GUID */}
          <FieldGroup icon={Hash} label="GUID del dispositivo" description="ro.mot.build.guid — 15 caracteres hexadecimales">
            <input
              {...register('guid')}
              placeholder="ej: 0d5cc74421f2e8a"
              className="w-full rounded-xl border border-white/10 bg-white/[0.03] px-4 py-3 text-sm text-white placeholder:text-gray-500 focus:outline-none focus:ring-2 focus:ring-blue-500/40"
            />
          </FieldGroup>

          {/* Carrier */}
          <FieldGroup icon={Radio} label="Carrier predeterminado" description="Código del carrier (ej: amxmx, reteu, tmo)">
            <Controller
              name="carrier"
              control={control}
              render={({ field }) => (
                <CarrierSelect
                  value={field.value ?? ''}
                  onChange={field.onChange}
                />
              )}
            />
          </FieldGroup>

          {/* Serial */}
          <FieldGroup icon={Radio} label="Número de serie" description="Número de serie del dispositivo (ej: ZY32LNRW97) — el servidor lo ignora para carriers abiertos">
            <input
              {...register('serial')}
              placeholder="ej: ZY32LNRW97"
              className="w-full rounded-xl border border-white/10 bg-white/[0.03] px-4 py-3 font-mono text-sm text-white placeholder:text-gray-500 focus:outline-none focus:ring-2 focus:ring-blue-500/40"
            />
          </FieldGroup>

          {/* Server */}
          <FieldGroup icon={Database} label="Servidor CDS" description="Servidor de Motorola para las consultas">
            <select
              {...register('server')}
              className="w-full rounded-xl border border-white/10 bg-white/[0.03] px-4 py-3 text-sm text-white focus:outline-none focus:ring-2 focus:ring-blue-500/40"
            >
              {SERVERS.map((s) => (
                <option key={s.id} value={s.id} className="bg-[#1a1a2e]">
                  {s.name} ({s.host})
                </option>
              ))}
            </select>
          </FieldGroup>

          {/* Context */}
          <FieldGroup icon={Globe2} label="Contexto" description="Contexto de la solicitud (normalmente 'ota')">
            <select
              {...register('context')}
              className="w-full rounded-xl border border-white/10 bg-white/[0.03] px-4 py-3 text-sm text-white focus:outline-none focus:ring-2 focus:ring-blue-500/40"
            >
              <option value="ota" className="bg-[#1a1a2e]">ota</option>
              <option value="fota" className="bg-[#1a1a2e]">fota</option>
              <option value="modem" className="bg-[#1a1a2e]">modem</option>
            </select>
          </FieldGroup>

          {/* Timeout */}
          <FieldGroup icon={Timer} label="Timeout (segundos)" description="Tiempo máximo de espera por solicitud">
            <input
              {...register('timeout', { valueAsNumber: true })}
              type="number"
              min={5}
              max={120}
              className="w-full rounded-xl border border-white/10 bg-white/[0.03] px-4 py-3 text-sm text-white focus:outline-none focus:ring-2 focus:ring-blue-500/40"
            />
          </FieldGroup>

          {/* Download Network */}
          <FieldGroup icon={Wifi} label="Red de descarga" description="Tipo de red preferida para los enlaces de descarga (filtra los recursos del servidor)">
            <select
              {...register('downloadNetwork')}
              className="w-full rounded-xl border border-white/10 bg-white/[0.03] px-4 py-3 text-sm text-white focus:outline-none focus:ring-2 focus:ring-blue-500/40"
            >
              <option value="wifi" className="bg-[#1a1a2e]">Wi-Fi</option>
              <option value="cell" className="bg-[#1a1a2e]">Celular</option>
            </select>
          </FieldGroup>

          {/* Actions */}
          <div className="flex gap-3 pt-2">
            <button
              type="submit"
              className={cn(
                'flex flex-1 items-center justify-center gap-2 rounded-xl px-6 py-3 text-sm font-semibold',
                'bg-gradient-to-r from-blue-600 to-indigo-600 text-white',
                'shadow-lg shadow-blue-500/20 transition-all',
                'hover:shadow-blue-500/30 hover:brightness-110',
                'disabled:cursor-not-allowed disabled:opacity-50',
              )}
              disabled={!isDirty}
            >
              <Save className="h-4 w-4" />
              Guardar
            </button>
            <button
              type="button"
              onClick={onReset}
              className="flex items-center gap-2 rounded-xl border border-white/10 px-6 py-3 text-sm font-medium text-gray-400 transition-colors hover:bg-white/5 hover:text-white"
            >
              <RotateCcw className="h-4 w-4" />
              Restablecer
            </button>
          </div>
        </form>
      </GlassCard>

      {/* Current config display */}
      <GlassCard className="space-y-2">
        <h4 className="text-sm font-semibold text-gray-400">Configuración actual (JSON)</h4>
        <pre className="overflow-auto rounded-lg border border-white/5 bg-black/20 p-3 font-mono text-xs text-gray-400">
          {JSON.stringify(config, null, 2)}
        </pre>
      </GlassCard>
    </div>
  );
}

function FieldGroup({
  icon: Icon,
  label,
  description,
  children,
}: {
  icon: React.ElementType;
  label: string;
  description: string;
  children: React.ReactNode;
}) {
  return (
    <motion.div
      initial={{ opacity: 0, x: -10 }}
      animate={{ opacity: 1, x: 0 }}
      className="space-y-2"
    >
      <div className="flex items-center gap-2">
        <Icon className="h-4 w-4 text-gray-500" />
        <label className="text-sm font-medium text-gray-300">{label}</label>
      </div>
      <p className="text-xs text-gray-500">{description}</p>
      {children}
    </motion.div>
  );
}
