import { useState, useMemo } from 'react';
import { motion } from 'framer-motion';
import { Database, Search } from 'lucide-react';
import Card from '@/components/Card';
import { CARRIERS, getAllRegionNames, getRegionCounts } from '@/lib/carriers';

export default function CarriersPage() {
  const [search, setSearch] = useState('');
  const [region, setRegion] = useState('All');
  const regions = ['All', ...getAllRegionNames()];
  const regionCounts = getRegionCounts();

  const filtered = useMemo(() => {
    let list = region === 'All' ? [...CARRIERS] : CARRIERS.filter(c => c.region === region);
    if (search) {
      const q = search.toLowerCase();
      list = list.filter(c => c.code.toLowerCase().includes(q) || c.name.toLowerCase().includes(q));
    }
    return list;
  }, [search, region]);

  return (
    <div className="max-w-5xl mx-auto px-4 py-8">
      <motion.h2 initial={{ opacity: 0 }} animate={{ opacity: 1 }} className="text-2xl font-bold mb-2 flex items-center gap-2">
        <Database className="w-6 h-6 text-[#00d4ff]" /> Explorar Carriers
      </motion.h2>
      <p className="text-slate-400 text-sm mb-6">{CARRIERS.length} carriers en {regions.length - 1} regiones</p>

      <div className="flex flex-col sm:flex-row gap-4 mb-6">
        <div className="relative flex-1">
          <Search className="absolute left-3 top-1/2 -translate-y-1/2 w-4 h-4 text-slate-500" />
          <input value={search} onChange={e => setSearch(e.target.value)} placeholder="Buscar por código o nombre..."
            className="w-full pl-10 pr-4 py-2.5 bg-[#131a2b] border border-[#2a3450] rounded-lg text-sm text-white focus:border-[#00d4ff] outline-none" />
        </div>
      </div>

      <div className="flex flex-wrap gap-2 mb-6">
        {regions.map(r => (
          <button key={r} onClick={() => setRegion(r)}
            className={`px-3 py-1 text-xs rounded-full border transition ${region === r ? 'bg-[#00d4ff]/15 border-[#00d4ff] text-[#00d4ff]' : 'border-[#2a3450] text-slate-400 hover:text-white'}`}>
            {r} {r !== 'All' && <span className="ml-1 opacity-60">({regionCounts[r] || 0})</span>}
          </button>
        ))}
      </div>

      <Card animate={false}>
        <div className="overflow-x-auto">
          <table className="w-full text-sm">
            <thead>
              <tr className="border-b border-[#2a3450] text-left text-xs uppercase text-slate-500">
                <th className="px-4 py-3">Código</th>
                <th className="px-4 py-3">Nombre</th>
                <th className="px-4 py-3">Región</th>
              </tr>
            </thead>
            <tbody>
              {filtered.slice(0, 100).map((c) => (
                <tr key={c.code} className="border-b border-[#2a3450]/50 hover:bg-[#00d4ff]/5 transition">
                  <td className="px-4 py-2.5 font-mono font-bold text-[#00d4ff]">{c.code}</td>
                  <td className="px-4 py-2.5 text-slate-300">{c.name}</td>
                  <td className="px-4 py-2.5 text-slate-500">{c.region}</td>
                </tr>
              ))}
            </tbody>
          </table>
          {filtered.length > 100 && <div className="text-center py-3 text-xs text-slate-500">Mostrando 100 de {filtered.length} resultados</div>}
        </div>
      </Card>
    </div>
  );
}
