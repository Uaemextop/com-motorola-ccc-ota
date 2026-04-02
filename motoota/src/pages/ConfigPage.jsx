import { motion } from 'framer-motion';
import { Settings, RotateCcw } from 'lucide-react';
import Card from '@/components/Card';
import { useAppStore } from '@/lib/store';
import { SERVERS } from '@/lib/servers';

export default function ConfigPage() {
  const store = useAppStore();

  return (
    <div className="max-w-2xl mx-auto px-4 py-8">
      <motion.h2 initial={{ opacity: 0 }} animate={{ opacity: 1 }} className="text-2xl font-bold mb-2 flex items-center gap-2">
        <Settings className="w-6 h-6 text-[#00d4ff]" /> Configuración
      </motion.h2>
      <p className="text-slate-400 text-sm mb-6">Ajusta las opciones de la aplicación.</p>

      <Card className="mb-4">
        <h3 className="text-sm font-semibold text-white mb-4">Aplicación</h3>
        <div className="space-y-4">
          <div>
            <label className="block text-sm text-slate-400 mb-1">Servidor predeterminado</label>
            <select value={store.server} onChange={e => store.setField('server', e.target.value)}
              className="w-full px-3 py-2.5 bg-[#131a2b] border border-[#2a3450] rounded-lg text-sm text-white focus:border-[#00d4ff] outline-none">
              {SERVERS.map(s => <option key={s.id} value={s.id}>{s.name}</option>)}
            </select>
          </div>
          <div>
            <label className="block text-sm text-slate-400 mb-1">Timeout (segundos)</label>
            <input type="number" value={store.timeout} onChange={e => store.setField('timeout', Number(e.target.value))} min={5} max={120}
              className="w-full px-3 py-2.5 bg-[#131a2b] border border-[#2a3450] rounded-lg text-sm text-white focus:border-[#00d4ff] outline-none" />
          </div>
          <div>
            <label className="block text-sm text-slate-400 mb-1">Contexto predeterminado</label>
            <select value={store.context} onChange={e => store.setField('context', e.target.value)}
              className="w-full px-3 py-2.5 bg-[#131a2b] border border-[#2a3450] rounded-lg text-sm text-white focus:border-[#00d4ff] outline-none">
              <option value="ota">OTA (Sistema)</option>
              <option value="fota">FOTA (Firmware)</option>
              <option value="modem">Modem</option>
            </select>
          </div>
        </div>
      </Card>

      <Card className="mb-4">
        <h3 className="text-sm font-semibold text-white mb-4">Dispositivo</h3>
        <div className="space-y-4">
          <div>
            <label className="block text-sm text-slate-400 mb-1">GUID guardado</label>
            <input value={store.guid} onChange={e => store.setField('guid', e.target.value)} placeholder="GUID del dispositivo"
              className="w-full px-3 py-2.5 bg-[#131a2b] border border-[#2a3450] rounded-lg text-sm text-white focus:border-[#00d4ff] outline-none" />
          </div>
          <div>
            <label className="block text-sm text-slate-400 mb-1">Carrier guardado</label>
            <input value={store.carrier} onChange={e => store.setField('carrier', e.target.value)} placeholder="Código de carrier"
              className="w-full px-3 py-2.5 bg-[#131a2b] border border-[#2a3450] rounded-lg text-sm text-white focus:border-[#00d4ff] outline-none" />
          </div>
        </div>
      </Card>

      <button onClick={() => { store.resetConfig(); }} className="flex items-center gap-2 px-4 py-2 text-sm text-red-400 border border-red-500/30 rounded-lg hover:bg-red-500/10 transition">
        <RotateCcw className="w-4 h-4" /> Restablecer todo
      </button>

      <Card animate={false} className="mt-6">
        <div className="text-sm text-slate-500 mb-2">Configuración actual (JSON)</div>
        <pre className="text-xs text-slate-400 bg-[#131a2b] rounded-lg p-3 overflow-x-auto">
          {JSON.stringify({ server: store.server, region: store.region, timeout: store.timeout, guid: store.guid, carrier: store.carrier, context: store.context }, null, 2)}
        </pre>
      </Card>
    </div>
  );
}
