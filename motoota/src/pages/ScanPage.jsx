import { useState, useRef } from 'react';
import { motion } from 'framer-motion';
import { Radio, Play, Square } from 'lucide-react';
import Card from '@/components/Card';
import StatusBadge from '@/components/StatusBadge';
import { scanCarriers, GUID_REGEX, formatBytes } from '@/lib/api';
import { CARRIERS, getAllRegionNames, getCarriersByRegion } from '@/lib/carriers';
import { SERVERS } from '@/lib/servers';
import { useAppStore } from '@/lib/store';

export default function ScanPage() {
  const store = useAppStore();
  const [guid, setGuid] = useState(store.guid || '');
  const [region, setRegion] = useState('All');
  const [scanning, setScanning] = useState(false);
  const [progress, setProgress] = useState({ done: 0, total: 0 });
  const [results, setResults] = useState([]);
  const [error, setError] = useState('');
  const abortRef = useRef(null);

  const regions = ['All', ...getAllRegionNames()];
  const counts = { open: 0, whitelisted: 0, 'no-content': 0, error: 0 };
  results.forEach(r => { counts[r.status] = (counts[r.status] || 0) + 1; });

  async function startScan() {
    if (!GUID_REGEX.test(guid.trim())) {
      setError('GUID inválido (hexadecimal, 15+ caracteres)');
      return;
    }
    setError('');
    setResults([]);
    setScanning(true);
    const carriers = region === 'All' ? [...CARRIERS] : getCarriersByRegion(region);
    setProgress({ done: 0, total: carriers.length });
    const controller = new AbortController();
    abortRef.current = controller;
    const srv = SERVERS.find(s => s.id === store.server);
    try {
      await scanCarriers(guid.trim(), carriers, {
        signal: controller.signal,
        host: srv?.host,
        context: store.context,
        timeout: store.timeout,
        onProgress: (done, total, result) => {
          setProgress({ done, total });
          setResults(prev => [...prev, result]);
        },
      });
    } catch (e) {
      if (!controller.signal.aborted) setError(e.message);
    } finally {
      setScanning(false);
    }
  }

  return (
    <div className="max-w-5xl mx-auto px-4 py-8">
      <motion.h2 initial={{ opacity: 0 }} animate={{ opacity: 1 }} className="text-2xl font-bold mb-2 flex items-center gap-2">
        <Radio className="w-6 h-6 text-[#00d4ff]" /> Escáner de Carriers
      </motion.h2>
      <p className="text-slate-400 text-sm mb-6">Escanea todos los carriers para un GUID y descubre las OTAs disponibles.</p>

      <Card className="mb-6">
        <div className="space-y-4">
          <div>
            <label className="block text-sm font-semibold text-white mb-1">Device GUID</label>
            <p className="text-xs text-slate-500 mb-2">GUID de tu firmware: <code className="bg-[#00d4ff]/10 text-[#5eead4] px-1 rounded text-[10px]">adb shell getprop ro.mot.build.guid</code></p>
            <input value={guid} onChange={e => setGuid(e.target.value)} placeholder="GUID hexadecimal..." className="w-full px-4 py-2.5 bg-[#131a2b] border border-[#2a3450] rounded-lg text-sm text-white focus:border-[#00d4ff] outline-none" />
          </div>

          <div className="flex flex-wrap gap-2">
            {regions.map(r => (
              <button key={r} onClick={() => setRegion(r)} className={`px-3 py-1 text-xs rounded-full border transition ${region === r ? 'bg-[#00d4ff]/15 border-[#00d4ff] text-[#00d4ff]' : 'border-[#2a3450] text-slate-400 hover:text-white'}`}>
                {r}
              </button>
            ))}
          </div>

          {error && <div className="text-red-400 text-sm">{error}</div>}

          <div className="flex gap-3">
            <button onClick={startScan} disabled={scanning} className="flex-1 flex items-center justify-center gap-2 py-3 bg-gradient-to-r from-[#00d4ff] to-[#5eead4] text-[#0a0e17] font-semibold rounded-lg disabled:opacity-50 transition-all">
              <Play className="w-5 h-5" /> {scanning ? 'Escaneando...' : 'Iniciar Escaneo'}
            </button>
            {scanning && (
              <button onClick={() => abortRef.current?.abort()} className="px-6 py-3 bg-red-500/20 border border-red-500/40 text-red-400 rounded-lg font-semibold hover:bg-red-500/30 transition">
                <Square className="w-5 h-5" />
              </button>
            )}
          </div>
        </div>
      </Card>

      {/* Progress */}
      {(scanning || results.length > 0) && (
        <div className="mb-6">
          <div className="flex items-center justify-between text-sm text-slate-400 mb-2">
            <span>Escaneando {progress.done}/{progress.total}</span>
            <span>{progress.total > 0 ? Math.round(progress.done / progress.total * 100) : 0}%</span>
          </div>
          <div className="w-full h-2 bg-[#131a2b] rounded-full overflow-hidden">
            <motion.div className="h-full bg-gradient-to-r from-[#00d4ff] to-[#5eead4] rounded-full" animate={{ width: `${progress.total > 0 ? (progress.done / progress.total) * 100 : 0}%` }} />
          </div>
        </div>
      )}

      {/* Stats */}
      {results.length > 0 && (
        <div className="grid grid-cols-4 gap-3 mb-6">
          {[
            { label: 'Abiertos', value: counts.open, color: 'text-green-400' },
            { label: 'Lista Blanca', value: counts.whitelisted, color: 'text-yellow-400' },
            { label: 'Sin Contenido', value: counts['no-content'], color: 'text-slate-400' },
            { label: 'Errores', value: counts.error, color: 'text-red-400' },
          ].map(({ label, value, color }) => (
            <Card key={label} animate={false} className="text-center py-4 px-2">
              <div className={`text-2xl font-bold ${color}`}>{value}</div>
              <div className="text-xs text-slate-500 uppercase mt-1">{label}</div>
            </Card>
          ))}
        </div>
      )}

      {/* Results list */}
      {results.length > 0 && (
        <Card animate={false}>
          <div className="text-sm font-semibold text-white mb-3">Resultados ({results.length})</div>
          <div className="max-h-96 overflow-y-auto space-y-1">
            {results.map((r, i) => (
              <div key={i} className="flex items-center gap-3 px-3 py-2 rounded-lg hover:bg-[#131a2b] transition text-sm">
                <StatusBadge status={r.status} className="text-[10px] min-w-[80px] justify-center" />
                <span className="text-[#00d4ff] font-mono font-bold">{r.carrier.code}</span>
                <span className="text-slate-500 flex-1">{r.carrier.name}</span>
                <span className="text-slate-600 text-xs">{r.carrier.region}</span>
                {r.response?.content && <span className="text-slate-300 text-xs font-mono">{r.response.content.targetVersion}</span>}
                {r.response?.content && <span className="text-slate-400 text-xs">{formatBytes(r.response.content.sizeBytes)}</span>}
              </div>
            ))}
          </div>
        </Card>
      )}
    </div>
  );
}
