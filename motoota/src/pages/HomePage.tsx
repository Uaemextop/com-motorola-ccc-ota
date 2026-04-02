/* ── Home Page ──────────────────────────────────────────────── */

import { motion } from 'framer-motion';
import {
  Search,
  Link2,
  ScanLine,
  Server,
  Smartphone,
  Shield,
  Download,
  Zap,
} from 'lucide-react';
import GlassCard from '@/components/ui/GlassCard';
import { useAppStore } from '@/lib/store';
import type { Page } from '@/lib/types';

interface FeatureCard {
  icon: React.ElementType;
  title: string;
  description: string;
  page: Page;
  gradient: string;
}

const FEATURES: FeatureCard[] = [
  {
    icon: Search,
    title: 'Verificar Actualización',
    description: 'Consulta si hay una actualización OTA disponible para tu dispositivo Motorola.',
    page: 'check',
    gradient: 'from-blue-500 to-cyan-500',
  },
  {
    icon: Link2,
    title: 'Cadena de Actualizaciones',
    description: 'Recorre toda la cadena de actualizaciones desde tu versión actual hasta la más reciente.',
    page: 'chain',
    gradient: 'from-violet-500 to-purple-500',
  },
  {
    icon: ScanLine,
    title: 'Escanear Carriers',
    description: 'Escanea todos los carriers para encontrar actualizaciones disponibles para tu GUID.',
    page: 'scan',
    gradient: 'from-emerald-500 to-green-500',
  },
  {
    icon: Server,
    title: 'Servidores CDS',
    description: 'Explora los servidores del sistema de entrega de contenido de Motorola.',
    page: 'servers',
    gradient: 'from-amber-500 to-orange-500',
  },
];

const STATS = [
  { icon: Smartphone, label: 'Carriers', value: '438+' },
  { icon: Server, label: 'Servidores', value: '6' },
  { icon: Shield, label: 'Verificación', value: 'MD5' },
  { icon: Download, label: 'Descarga', value: 'Directa' },
];

export default function HomePage() {
  const setPage = useAppStore((s) => s.setPage);

  return (
    <div className="space-y-8">
      {/* Hero */}
      <motion.div
        initial={{ opacity: 0, y: 30 }}
        animate={{ opacity: 1, y: 0 }}
        transition={{ duration: 0.6 }}
        className="text-center"
      >
        <div className="mb-6 inline-flex items-center gap-2 rounded-full border border-blue-500/20 bg-blue-500/5 px-4 py-2 text-sm text-blue-400">
          <Zap className="h-4 w-4" />
          Motorola CDS API Client
        </div>
        <h1 className="bg-gradient-to-r from-white via-blue-100 to-blue-400 bg-clip-text text-4xl font-bold tracking-tight text-transparent sm:text-5xl lg:text-6xl">
          MotoOTA
        </h1>
        <p className="mx-auto mt-4 max-w-2xl text-lg text-gray-400">
          Verifica, explora y descarga actualizaciones OTA de Motorola directamente
          desde los servidores CDS oficiales.
        </p>
      </motion.div>

      {/* Stats row */}
      <motion.div
        initial={{ opacity: 0 }}
        animate={{ opacity: 1 }}
        transition={{ delay: 0.3 }}
        className="grid grid-cols-2 gap-3 sm:grid-cols-4"
      >
        {STATS.map((stat, i) => (
          <GlassCard key={stat.label} delay={0.1 * i} className="flex items-center gap-3 p-4">
            <div className="flex h-10 w-10 shrink-0 items-center justify-center rounded-lg bg-blue-500/10">
              <stat.icon className="h-5 w-5 text-blue-400" />
            </div>
            <div>
              <p className="text-xl font-bold text-white">{stat.value}</p>
              <p className="text-xs text-gray-500">{stat.label}</p>
            </div>
          </GlassCard>
        ))}
      </motion.div>

      {/* Feature cards */}
      <div className="grid gap-4 sm:grid-cols-2">
        {FEATURES.map((feature, i) => (
          <GlassCard
            key={feature.page}
            hover
            delay={0.15 * i}
            className="group"
          >
            <button
              onClick={() => setPage(feature.page)}
              className="flex w-full flex-col items-start text-left"
            >
              <div
                className={`mb-4 flex h-12 w-12 items-center justify-center rounded-xl bg-gradient-to-br ${feature.gradient} shadow-lg`}
              >
                <feature.icon className="h-6 w-6 text-white" />
              </div>
              <h3 className="text-lg font-semibold text-white group-hover:text-blue-300 transition-colors">
                {feature.title}
              </h3>
              <p className="mt-2 text-sm leading-relaxed text-gray-400">
                {feature.description}
              </p>
            </button>
          </GlassCard>
        ))}
      </div>

      {/* Info footer */}
      <motion.div
        initial={{ opacity: 0 }}
        animate={{ opacity: 1 }}
        transition={{ delay: 0.8 }}
        className="rounded-xl border border-white/5 bg-white/[0.02] p-4 text-center text-xs text-gray-500"
      >
        <p>
          MotoOTA es una herramienta de código abierto. No está afiliada con Motorola Mobility LLC.
        </p>
        <p className="mt-1">
          Los datos se obtienen directamente de los servidores CDS de Motorola vía CORS proxy.
        </p>
      </motion.div>
    </div>
  );
}
