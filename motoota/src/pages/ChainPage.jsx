import { useState, useRef, useEffect } from 'react';
import { motion } from 'framer-motion';
import { Link2, Play, ArrowRight, Download, ExternalLink, Wifi, Signal } from 'lucide-react';
import Card from '@/components/Card';
import { walkChain, formatBytes, GUID_REGEX } from '@/lib/api';
import { CARRIERS, searchCarriers } from '@/lib/carriers';
import { SERVERS } from '@/lib/servers';
import { useAppStore } from '@/lib/store';

export default function ChainPage() {
  const store = useAppStore();
  const [guid, setGuid] = useState(store.guid || '');
  const [carrier, setCarrier] = useState(store.carrier || '');
  const [carrierSearch, setCarrierSearch] = useState('');
  const [showDropdown, setShowDropdown] = useState(false);
  const [server, setServer] = useState(store.server);
  const [context, setContext] = useState(store.context);
  const [loading, setLoading] = useState(false);
  const [chain, setChain] = useState([]);
  const [error, setError] = useState('');
  const dropdownRef = useRef(null);

  useEffect(() => {
    function handleClick(e) {
      if (dropdownRef.current && !dropdownRef.current.contains(e.target)) setShowDropdown(false);
    }
    document.addEventListener('mousedown', handleClick);
    return () => document.removeEventListener('mousedown', handleClick);
  }, []);

  const filteredCarriers = carrierSearch ? searchCarriers(carrierSearch).slice(0, 30) : CARRIERS.slice(0, 30);

  async function handleWalk() {
    if (!GUID_REGEX.test(guid.trim())) { setError('GUID inválido'); return; }
    if (!carrier.trim()) { setError('Selecciona un carrier'); return; }
    setError('');
    setChain([]);
    setLoading(true);
    const srv = SERVERS.find(s => s.id === server);
    try {
      const result = await walkChain(guid.trim(), carrier.trim(), {
        host: srv?.host,
        context,
        timeout: store.timeout,
      });
      setChain(result);
      store.setField('guid', guid.trim());
      store.setField('carrier', carrier.trim());
      if (result.length === 0) setError('No se encontraron actualizaciones en la cadena.');
    } catch (e) {
      setError(e.message);
    } finally {
      setLoading(false);
    }
  }

  const totalSize = chain.reduce((acc, s) => acc + (s.content?.sizeBytes || 0), 0);

  return (
    <div className="max-w-3xl mx-auto px-4 py-8">
      <motion.h2 initial={{ opacity: 0 }} animate={{ opacity: 1 }} className="text-2xl font-bold mb-2 flex items-center gap-2">
        <Link2 className="w-6 h-6 text-[#00d4ff]" /> Cadena de OTAs
      </motion.h2>
      <p className="text-slate-400 text-sm mb-6">Recorre toda la cadena de actualizaciones desde un GUID inicial.</p>

      <Card className="mb-6">
        <div className="space-y-4">
          <div>
            <label className="block text-sm font-semibold text-white mb-1">Device GUID <span className="text-red-400">*</span></label>
            <p className="text-xs text-slate-500 mb-2">GUID de tu firmware: <code className="bg-[#00d4ff]/10 text-[#5eead4] px-1 rounded text-[10px]">adb shell getprop ro.mot.build.guid</code></p>
            <input value={guid} onChange={e => setGuid(e.target.value)} placeholder="ej: 0d5cc74421f2e8a" className="w-full px-4 py-2.5 bg-[#131a2b] border border-[#2a3450] rounded-lg text-sm text-white focus:border-[#00d4ff] outline-none" />
          </div>
          <div className="relative" ref={dropdownRef}>
            <label className="block text-sm font-semibold text-white mb-1">Carrier <span className="text-red-400">*</span></label>
            <input
              value={carrierSearch || carrier}
              onChange={e => { setCarrierSearch(e.target.value); setCarrier(''); setShowDropdown(true); }}
              onFocus={() => setShowDropdown(true)}
              placeholder="Busca carrier..."
              className="w-full px-4 py-2.5 bg-[#131a2b] border border-[#2a3450] rounded-lg text-sm text-white focus:border-[#00d4ff] outline-none"
            />
            {showDropdown && (
              <div className="absolute top-full left-0 right-0 mt-1 max-h-40 overflow-y-auto bg-[#131a2b] border border-[#00d4ff]/40 rounded-lg shadow-xl z-50">
                {filteredCarriers.map(c => (
                  <button key={c.code} onClick={() => { setCarrier(c.code); setCarrierSearch(`${c.code} — ${c.name}`); setShowDropdown(false); }}
                    className="w-full text-left px-3 py-2 text-sm hover:bg-[#00d4ff]/10 flex gap-2">
                    <span className="text-[#00d4ff] font-mono font-bold min-w-[70px]">{c.code}</span>
                    <span className="text-slate-400">{c.name}</span>
                  </button>
                ))}
              </div>
            )}
          </div>

          {/* Server & Context */}
          <div className="grid grid-cols-2 gap-4">
            <div>
              <label className="block text-sm font-semibold text-white mb-1">Servidor</label>
              <select value={server} onChange={e => setServer(e.target.value)} className="w-full px-3 py-2.5 bg-[#131a2b] border border-[#2a3450] rounded-lg text-sm text-white focus:border-[#00d4ff] outline-none">
                {SERVERS.map(s => <option key={s.id} value={s.id}>{s.name} {s.status !== 'active' && '[inactivo]'}</option>)}
              </select>
            </div>
            <div>
              <label className="block text-sm font-semibold text-white mb-1">Contexto</label>
              <select value={context} onChange={e => setContext(e.target.value)} className="w-full px-3 py-2.5 bg-[#131a2b] border border-[#2a3450] rounded-lg text-sm text-white focus:border-[#00d4ff] outline-none">
                <option value="ota">OTA (Sistema)</option>
                <option value="fota">FOTA (Firmware)</option>
                <option value="modem">Modem</option>
              </select>
            </div>
          </div>

          {error && <div className="text-red-400 text-sm bg-red-500/10 border border-red-500/20 rounded-lg px-4 py-2">{error}</div>}

          <button onClick={handleWalk} disabled={loading} className="w-full flex items-center justify-center gap-2 py-3 bg-gradient-to-r from-[#00d4ff] to-[#5eead4] text-[#0a0e17] font-semibold rounded-lg disabled:opacity-50 transition-all hover:shadow-lg hover:shadow-[#00d4ff]/25">
            {loading ? <span className="w-5 h-5 border-2 border-[#0a0e17] border-t-transparent rounded-full animate-spin" /> : <Play className="w-5 h-5" />}
            {loading ? 'Recorriendo cadena...' : 'Recorrer Cadena'}
          </button>
        </div>
      </Card>

      {chain.length > 0 && (
        <div className="space-y-3">
          <div className="flex items-center justify-between text-sm text-slate-400 mb-2">
            <span>{chain.length} actualización{chain.length > 1 ? 'es' : ''} encontrada{chain.length > 1 ? 's' : ''}</span>
            <span>Total: {formatBytes(totalSize)}</span>
          </div>
          {chain.map((step, i) => (
            <motion.div key={i} initial={{ opacity: 0, x: -20 }} animate={{ opacity: 1, x: 0 }} transition={{ delay: i * 0.1 }}>
              <Card animate={false}>
                <div className="flex items-center gap-3 mb-3">
                  <div className="w-8 h-8 rounded-full bg-[#00d4ff]/15 flex items-center justify-center text-[#00d4ff] font-bold text-sm">{i + 1}</div>
                  <div className="flex items-center gap-2 text-sm flex-1">
                    <span className="text-slate-400">{step.content.sourceVersion || 'Unknown'}</span>
                    <ArrowRight className="w-4 h-4 text-[#00d4ff]" />
                    <span className="text-white font-semibold">{step.content.targetVersion}</span>
                  </div>
                  {step.content.model && <span className="text-xs text-slate-500">{step.content.model}</span>}
                </div>
                <div className="grid grid-cols-3 gap-2 text-xs">
                  <div className="bg-[#131a2b] rounded-lg p-2"><span className="text-slate-500">Tamaño:</span> <span className="text-white">{formatBytes(step.content.sizeBytes)}</span></div>
                  <div className="bg-[#131a2b] rounded-lg p-2"><span className="text-slate-500">Tipo:</span> <span className="text-white">{step.content.updateType}</span></div>
                  <div className="bg-[#131a2b] rounded-lg p-2"><span className="text-slate-500">MD5:</span> <span className="text-white font-mono truncate">{step.content.md5 || 'N/A'}</span></div>
                </div>
                {step.downloadUrls?.length > 0 && (
                  <div className="mt-3 space-y-1.5">
                    <div className="flex items-center gap-1 text-xs text-slate-500">
                      <Download className="w-3 h-3" /> Enlaces de descarga
                    </div>
                    {step.downloadUrls.map((dl, j) => (
                      <div key={j} className="flex items-center gap-2">
                        {dl.tags.map(tag => (
                          <span key={tag} className={`inline-flex items-center gap-0.5 px-1.5 py-0.5 text-[9px] font-semibold rounded-full border ${
                            tag === 'WIFI' ? 'bg-blue-500/15 text-blue-400 border-blue-500/30' :
                            tag === 'CELL' ? 'bg-orange-500/15 text-orange-400 border-orange-500/30' :
                            'bg-slate-500/15 text-slate-400 border-slate-500/30'
                          }`}>
                            {tag === 'WIFI' ? <Wifi className="w-2.5 h-2.5" /> : tag === 'CELL' ? <Signal className="w-2.5 h-2.5" /> : null}
                            {tag}
                          </span>
                        ))}
                        <a href={dl.url} target="_blank" rel="noopener noreferrer" className="text-xs text-[#00d4ff] hover:underline break-all flex-1 truncate">{dl.url}</a>
                      </div>
                    ))}
                  </div>
                )}
              </Card>
            </motion.div>
          ))}
        </div>
      )}
    </div>
  );
}
