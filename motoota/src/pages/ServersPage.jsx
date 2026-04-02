import { motion } from 'framer-motion';
import { Server } from 'lucide-react';
import Card from '@/components/Card';
import StatusBadge from '@/components/StatusBadge';
import { SERVERS } from '@/lib/servers';

export default function ServersPage() {
  return (
    <div className="max-w-4xl mx-auto px-4 py-8">
      <motion.h2 initial={{ opacity: 0 }} animate={{ opacity: 1 }} className="text-2xl font-bold mb-2 flex items-center gap-2">
        <Server className="w-6 h-6 text-[#00d4ff]" /> Servidores CDS
      </motion.h2>
      <p className="text-slate-400 text-sm mb-6">Servidores del sistema de entrega de contenido (CDS) de Motorola.</p>

      <div className="grid gap-4 md:grid-cols-2">
        {SERVERS.map((s, i) => (
          <motion.div key={s.id} initial={{ opacity: 0, y: 20 }} animate={{ opacity: 1, y: 0 }} transition={{ delay: i * 0.08 }}>
            <Card animate={false} className="h-full">
              <div className="flex items-center justify-between mb-3">
                <div className="font-semibold text-white">{s.name}</div>
                <StatusBadge status={s.status} />
              </div>
              <div className="space-y-2 text-sm">
                <div className="flex justify-between"><span className="text-slate-500">Host:</span> <span className="text-slate-300 font-mono text-xs">{s.host}</span></div>
                <div className="flex justify-between"><span className="text-slate-500">Región:</span> <span className="text-slate-300">{s.region}</span></div>
                <div className="flex justify-between"><span className="text-slate-500">ID:</span> <span className="text-slate-400 font-mono text-xs">{s.id}</span></div>
              </div>
              <p className="text-xs text-slate-500 mt-3">{s.description}</p>
            </Card>
          </motion.div>
        ))}
      </div>
    </div>
  );
}
