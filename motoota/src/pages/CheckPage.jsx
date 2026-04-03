import { useState, useRef, useEffect } from 'react';
import { motion } from 'framer-motion';
import { Search, Download, ExternalLink, ChevronDown, ChevronUp, Wifi, Signal, FileText } from 'lucide-react';
import Card from '@/components/Card';
import StatusBadge from '@/components/StatusBadge';
import { checkUpdate, classifyStatus, formatBytes, GUID_REGEX } from '@/lib/api';
import { CARRIERS, searchCarriers } from '@/lib/carriers';
import { SERVERS } from '@/lib/servers';
import { useAppStore } from '@/lib/store';

export default function CheckPage() {
  const store = useAppStore();
  const [guid, setGuid] = useState(store.guid || '');
  const [carrier, setCarrier] = useState(store.carrier || '');
  const [carrierSearch, setCarrierSearch] = useState('');
  const [showDropdown, setShowDropdown] = useState(false);
  const [server, setServer] = useState(store.server);
  const [context, setContext] = useState(store.context);
  const [loading, setLoading] = useState(false);
  const [result, setResult] = useState(null);
  const [error, setError] = useState('');
  const [showRaw, setShowRaw] = useState(false);
  const [showNotes, setShowNotes] = useState(false);
  const dropdownRef = useRef(null);

  useEffect(() => {
    function handleClick(e) {
      if (dropdownRef.current && !dropdownRef.current.contains(e.target)) setShowDropdown(false);
    }
    document.addEventListener('mousedown', handleClick);
    return () => document.removeEventListener('mousedown', handleClick);
  }, []);

  const filteredCarriers = carrierSearch ? searchCarriers(carrierSearch).slice(0, 40) : CARRIERS.slice(0, 40);

  async function handleCheck() {
    if (!GUID_REGEX.test(guid.trim())) {
      setError('GUID inválido. Debe ser hexadecimal de al menos 15 caracteres.');
      return;
    }
    if (!carrier.trim()) {
      setError('Selecciona un carrier.');
      return;
    }
    setError('');
    setResult(null);
    setLoading(true);
    const srv = SERVERS.find(s => s.id === server);
    try {
      const resp = await checkUpdate(guid.trim(), carrier.trim(), {
        host: srv?.host,
        context,
        timeout: store.timeout,
      });
      setResult({ ...resp, status: classifyStatus(resp) });
      store.setField('guid', guid.trim());
      store.setField('carrier', carrier.trim());
    } catch (e) {
      setError(e.message || 'Error en la solicitud');
    } finally {
      setLoading(false);
    }
  }

  /** Sanitize release notes HTML by stripping dangerous tags/attributes */
  function sanitizeHtml(html) {
    const div = document.createElement('div');
    div.innerHTML = html;
    div.querySelectorAll('script,style,iframe,object,embed,link,meta').forEach(el => el.remove());
    div.querySelectorAll('*').forEach(el => {
      for (const attr of [...el.attributes]) {
        if (attr.name.startsWith('on') || attr.name === 'style') el.removeAttribute(attr.name);
      }
    });
    return div.innerHTML;
  }

  return (
    <div className="max-w-3xl mx-auto px-4 py-8">
      <motion.h2 initial={{ opacity: 0 }} animate={{ opacity: 1 }} className="text-2xl font-bold mb-2 flex items-center gap-2">
        <Search className="w-6 h-6 text-[#00d4ff]" /> Verificar Actualización
      </motion.h2>
      <p className="text-slate-400 text-sm mb-6">Consulta los servidores CDS de Motorola para verificar OTAs disponibles.</p>

      <Card className="mb-6">
        <div className="space-y-4">
          {/* GUID */}
          <div>
            <label className="block text-sm font-semibold text-white mb-1">Device GUID <span className="text-red-400">*</span></label>
            <p className="text-xs text-slate-500 mb-2">Obtén con: <code className="bg-[#00d4ff]/10 text-[#5eead4] px-1 rounded text-[10px]">adb shell getprop ro.mot.build.guid</code></p>
            <input
              value={guid}
              onChange={e => setGuid(e.target.value)}
              placeholder="ej: 0d5cc74421f2e8a"
              className="w-full px-4 py-2.5 bg-[#131a2b] border border-[#2a3450] rounded-lg text-sm text-white focus:border-[#00d4ff] focus:ring-1 focus:ring-[#00d4ff]/30 outline-none transition"
            />
          </div>

          {/* Carrier */}
          <div className="relative" ref={dropdownRef}>
            <label className="block text-sm font-semibold text-white mb-1">Carrier <span className="text-red-400">*</span></label>
            <p className="text-xs text-slate-500 mb-2">Código del operador. Usa <code className="bg-[#00d4ff]/10 text-[#5eead4] px-1 rounded text-[10px]">adb shell getprop ro.carrier</code></p>
            <input
              value={carrierSearch || carrier}
              onChange={e => { setCarrierSearch(e.target.value); setCarrier(''); setShowDropdown(true); }}
              onFocus={() => setShowDropdown(true)}
              placeholder="Busca carrier..."
              className="w-full px-4 py-2.5 bg-[#131a2b] border border-[#2a3450] rounded-lg text-sm text-white focus:border-[#00d4ff] outline-none transition"
            />
            {showDropdown && (
              <div className="absolute top-full left-0 right-0 mt-1 max-h-48 overflow-y-auto bg-[#131a2b] border border-[#00d4ff]/40 rounded-lg shadow-xl z-50">
                {filteredCarriers.map(c => (
                  <button
                    key={c.code}
                    onClick={() => { setCarrier(c.code); setCarrierSearch(`${c.code} — ${c.name}`); setShowDropdown(false); }}
                    className="w-full text-left px-3 py-2 text-sm hover:bg-[#00d4ff]/10 flex items-center gap-2 transition-colors"
                  >
                    <span className="text-[#00d4ff] font-mono font-bold min-w-[70px]">{c.code}</span>
                    <span className="text-slate-400 flex-1">{c.name}</span>
                    <span className="text-slate-600 text-xs">{c.region}</span>
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

          <button
            onClick={handleCheck}
            disabled={loading}
            className="w-full flex items-center justify-center gap-2 py-3 bg-gradient-to-r from-[#00d4ff] to-[#5eead4] text-[#0a0e17] font-semibold rounded-lg hover:shadow-lg hover:shadow-[#00d4ff]/25 transition-all disabled:opacity-50"
          >
            {loading ? <span className="w-5 h-5 border-2 border-[#0a0e17] border-t-transparent rounded-full animate-spin" /> : <Search className="w-5 h-5" />}
            {loading ? 'Buscando...' : 'Buscar OTAs'}
          </button>
        </div>
      </Card>

      {/* Results */}
      {result && (
        <motion.div initial={{ opacity: 0, y: 20 }} animate={{ opacity: 1, y: 0 }} className="space-y-4">
          <div className={`flex items-center gap-3 px-5 py-4 rounded-xl border ${
            result.status === 'open' ? 'bg-green-500/10 border-green-500/25' :
            result.status === 'whitelisted' ? 'bg-yellow-500/10 border-yellow-500/25' :
            'bg-red-500/10 border-red-500/25'
          }`}>
            <StatusBadge status={result.status} />
            <div>
              <div className="font-semibold text-white">
                {result.status === 'open' ? '¡Actualización Disponible!' :
                 result.status === 'whitelisted' ? 'Carrier con Lista Blanca' :
                 'Sin Actualizaciones'}
              </div>
              <div className="text-xs text-slate-400">
                {result.status === 'open' ? 'Se encontró una actualización OTA' :
                 result.status === 'whitelisted' ? 'Requiere autorización por serial/IMEI' :
                 'No hay contenido OTA para esta combinación'}
              </div>
            </div>
          </div>

          {result.hasUpdate && result.content && (
            <Card animate={false}>
              <div className="grid grid-cols-2 sm:grid-cols-3 gap-3">
                {[
                  ['Versión Origen', result.content.sourceVersion],
                  ['Versión Destino', result.content.targetVersion],
                  ['Tamaño', formatBytes(result.content.sizeBytes)],
                  ['Tipo', result.content.updateType],
                  ['Modelo', result.content.model],
                  ['MD5', result.content.md5],
                  ['GUID Destino', result.content.targetGuid],
                  ['Package ID', result.content.packageId],
                  ['Flavour', result.content.flavour],
                ].map(([label, value]) => (
                  <div key={label} className="bg-[#131a2b] border border-[#2a3450] rounded-lg p-3">
                    <div className="text-[10px] uppercase tracking-wider text-slate-500 font-semibold mb-1">{label}</div>
                    <div className="text-sm text-white font-mono break-all">{value || 'N/A'}</div>
                  </div>
                ))}
              </div>
            </Card>
          )}

          {/* Download URLs with tags */}
          {result.downloadUrls?.length > 0 && (
            <Card animate={false}>
              <div className="flex items-center gap-2 text-sm font-semibold text-white mb-3">
                <Download className="w-4 h-4 text-[#00d4ff]" /> Enlaces de Descarga ({result.downloadUrls.length})
              </div>
              <div className="space-y-2">
                {result.downloadUrls.map((dl, i) => (
                  <div key={i} className="bg-[#131a2b] border border-[#2a3450] rounded-lg p-3">
                    <div className="flex items-center gap-2 mb-2">
                      {dl.tags.map(tag => (
                        <span key={tag} className={`inline-flex items-center gap-1 px-2 py-0.5 text-[10px] font-semibold rounded-full border ${
                          tag === 'WIFI' ? 'bg-blue-500/15 text-blue-400 border-blue-500/30' :
                          tag === 'CELL' ? 'bg-orange-500/15 text-orange-400 border-orange-500/30' :
                          'bg-slate-500/15 text-slate-400 border-slate-500/30'
                        }`}>
                          {tag === 'WIFI' ? <Wifi className="w-3 h-3" /> : tag === 'CELL' ? <Signal className="w-3 h-3" /> : null}
                          {tag}
                        </span>
                      ))}
                      {dl.ttl > 0 && <span className="text-[10px] text-slate-500">TTL: {dl.ttl}s</span>}
                    </div>
                    <a href={dl.url} target="_blank" rel="noopener noreferrer"
                      className="flex items-center gap-2 text-sm text-[#00d4ff] hover:text-[#5eead4] transition font-mono break-all">
                      <ExternalLink className="w-4 h-4 shrink-0" /> {dl.url}
                    </a>
                  </div>
                ))}
              </div>
            </Card>
          )}

          {/* Release Notes */}
          {result.content?.releaseNotes && (
            <>
              <button onClick={() => setShowNotes(!showNotes)} className="flex items-center gap-1 text-sm text-slate-500 hover:text-slate-300 transition">
                {showNotes ? <ChevronUp className="w-4 h-4" /> : <ChevronDown className="w-4 h-4" />}
                <FileText className="w-4 h-4" /> Notas de actualización
              </button>
              {showNotes && (
                <Card animate={false}>
                  <div className="prose prose-invert prose-sm max-w-none text-slate-300"
                    dangerouslySetInnerHTML={{ __html: sanitizeHtml(result.content.releaseNotes) }} />
                </Card>
              )}
            </>
          )}

          {/* Raw JSON toggle */}
          <button onClick={() => setShowRaw(!showRaw)} className="flex items-center gap-1 text-sm text-slate-500 hover:text-slate-300 transition">
            {showRaw ? <ChevronUp className="w-4 h-4" /> : <ChevronDown className="w-4 h-4" />} JSON completo
          </button>
          {showRaw && (
            <pre className="bg-[#131a2b] border border-[#2a3450] rounded-lg p-4 text-xs text-slate-400 overflow-x-auto max-h-64">
              {JSON.stringify(result.raw, null, 2)}
            </pre>
          )}
        </motion.div>
      )}
    </div>
  );
}
