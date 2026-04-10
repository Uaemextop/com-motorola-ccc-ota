/* ── Top Header Bar ─────────────────────────────────────────── */

import { Menu, Wifi, WifiOff } from 'lucide-react';
import { useAppStore } from '@/lib/store';
import { cn } from '@/lib/utils';
import { useState, useEffect } from 'react';

const PAGE_TITLES: Record<string, string> = {
  home: 'Inicio',
  check: 'Verificar Actualización',
  chain: 'Cadena de Actualizaciones',
  scan: 'Escanear Carriers',
  servers: 'Servidores CDS',
  config: 'Configuración',
};

export default function Header() {
  const { currentPage, toggleSidebar, loading } = useAppStore();
  const [online, setOnline] = useState(navigator.onLine);

  useEffect(() => {
    const on = () => setOnline(true);
    const off = () => setOnline(false);
    window.addEventListener('online', on);
    window.addEventListener('offline', off);
    return () => {
      window.removeEventListener('online', on);
      window.removeEventListener('offline', off);
    };
  }, []);

  return (
    <header className="sticky top-0 z-30 flex h-16 items-center gap-4 border-b border-white/5 bg-[#0d0d1a]/80 px-4 backdrop-blur-xl sm:px-6">
      <button
        onClick={toggleSidebar}
        aria-label="Abrir menú de navegación"
        className="rounded-lg p-2 text-gray-400 transition-colors hover:bg-white/5 hover:text-white lg:hidden"
      >
        <Menu className="h-5 w-5" />
      </button>

      <h2 className="text-lg font-semibold text-white">
        {PAGE_TITLES[currentPage] || 'MotoOTA'}
      </h2>

      <div className="flex-1" />

      {/* Loading indicator */}
      {loading && (
        <div className="flex items-center gap-2 text-sm text-blue-400">
          <div className="h-2 w-2 animate-pulse rounded-full bg-blue-500" />
          <span className="hidden sm:inline">Cargando...</span>
        </div>
      )}

      {/* Online status */}
      <div
        className={cn(
          'flex items-center gap-1.5 rounded-full px-3 py-1.5 text-xs font-medium',
          online
            ? 'bg-emerald-500/10 text-emerald-400'
            : 'bg-red-500/10 text-red-400',
        )}
      >
        {online ? <Wifi className="h-3.5 w-3.5" /> : <WifiOff className="h-3.5 w-3.5" />}
        <span className="hidden sm:inline">{online ? 'En línea' : 'Sin conexión'}</span>
      </div>
    </header>
  );
}
