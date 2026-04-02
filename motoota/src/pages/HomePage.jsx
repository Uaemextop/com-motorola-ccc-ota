import { Link } from 'react-router-dom';
import { motion } from 'framer-motion';
import { Search, Radio, Link2, Database, Server, Settings } from 'lucide-react';
import Card from '@/components/Card';
import { cn } from '@/lib/cn';
import { CARRIERS } from '@/lib/carriers';
import { SERVERS } from '@/lib/servers';

const features = [
  { icon: Search, label: 'Verificar OTA', desc: 'Busca actualizaciones para tu GUID y carrier', to: '/check', color: 'text-cyan-400' },
  { icon: Radio, label: 'Escanear Carriers', desc: 'Analiza todos los carriers para tu GUID', to: '/scan', color: 'text-green-400' },
  { icon: Link2, label: 'Cadena de OTAs', desc: 'Recorre toda la cadena de actualizaciones', to: '/chain', color: 'text-purple-400' },
  { icon: Database, label: 'Explorar Carriers', desc: `Navega ${CARRIERS.length} carriers disponibles`, to: '/carriers', color: 'text-amber-400' },
  { icon: Server, label: 'Servidores CDS', desc: 'Consulta los 6 servidores Motorola', to: '/servers', color: 'text-blue-400' },
  { icon: Settings, label: 'Configuración', desc: 'Ajusta opciones de la aplicación', to: '/config', color: 'text-slate-400' },
];

const stats = [
  { value: CARRIERS.length, label: 'Carriers' },
  { value: SERVERS.length, label: 'Servidores' },
  { value: [...new Set(CARRIERS.map(c => c.region))].length, label: 'Regiones' },
];

export default function HomePage() {
  return (
    <div className="max-w-5xl mx-auto px-4 py-12">
      {/* Hero */}
      <motion.div
        initial={{ opacity: 0, y: -30 }}
        animate={{ opacity: 1, y: 0 }}
        transition={{ duration: 0.6 }}
        className="text-center mb-16"
      >
        <h1 className="text-5xl sm:text-6xl font-bold mb-4">
          Moto<span className="bg-gradient-to-r from-[#00d4ff] to-[#5eead4] bg-clip-text text-transparent">OTA</span>
        </h1>
        <p className="text-slate-400 text-lg max-w-xl mx-auto leading-relaxed">
          Busca actualizaciones OTA de firmware Motorola directamente desde los servidores CDS.
        </p>
      </motion.div>

      {/* Stats */}
      <div className="flex justify-center gap-6 flex-wrap mb-16">
        {stats.map(({ value, label }, i) => (
          <motion.div
            key={label}
            initial={{ opacity: 0, scale: 0.8 }}
            animate={{ opacity: 1, scale: 1 }}
            transition={{ delay: i * 0.1 + 0.3 }}
            className="flex items-center gap-2 px-4 py-2 rounded-full bg-[#00d4ff]/5 border border-[#00d4ff]/15 text-sm text-slate-400"
          >
            <span className="font-bold text-[#00d4ff]">{value}</span> {label}
          </motion.div>
        ))}
      </div>

      {/* Feature grid */}
      <div className="grid grid-cols-1 sm:grid-cols-2 lg:grid-cols-3 gap-4">
        {features.map(({ icon: Icon, label, desc, to, color }, i) => (
          <motion.div
            key={to}
            initial={{ opacity: 0, y: 20 }}
            animate={{ opacity: 1, y: 0 }}
            transition={{ delay: i * 0.08 + 0.5 }}
          >
            <Link to={to}>
              <Card className="group cursor-pointer hover:bg-[#1e2940]">
                <div className="flex items-start gap-4">
                  <Icon className={cn('w-6 h-6 mt-0.5', color)} />
                  <div>
                    <div className="font-semibold text-white group-hover:text-[#00d4ff] transition-colors">{label}</div>
                    <div className="text-sm text-slate-500 mt-1">{desc}</div>
                  </div>
                </div>
              </Card>
            </Link>
          </motion.div>
        ))}
      </div>
    </div>
  );
}
