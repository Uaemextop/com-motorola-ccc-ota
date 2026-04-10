/* ── Top Header Bar ─────────────────────────────────────────── */

import { Menu, Wifi, WifiOff, Keyboard } from 'lucide-react';
import { useAppStore } from '@/lib/store';
import { cn } from '@/lib/utils';
import { useState, useEffect, useRef } from 'react';
import type { Page } from '@/lib/types';

const PAGE_TITLES: Record<string, string> = {
  home: 'Inicio',
  check: 'Verificar Actualización',
  chain: 'Cadena de Actualizaciones',
  scan: 'Escanear Carriers',
  servers: 'Servidores CDS',
  config: 'Configuración',
};

const KEYBOARD_SHORTCUTS: Record<string, Page> = {
  '1': 'home',
  '2': 'check',
  '3': 'chain',
  '4': 'scan',
  '5': 'servers',
  '6': 'config',
};

export default function Header() {
  const { currentPage, setPage, toggleSidebar, loading } = useAppStore();
  const [online, setOnline] = useState(navigator.onLine);
  const [showShortcuts, setShowShortcuts] = useState(false);
  const shortcutsRef = useRef<HTMLDivElement>(null);

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

  // Keyboard shortcuts: Alt+1..6 to navigate pages
  useEffect(() => {
    const handleKeyDown = (e: KeyboardEvent) => {
      if (e.altKey && !e.ctrlKey && !e.metaKey) {
        const page = KEYBOARD_SHORTCUTS[e.key];
        if (page) {
          e.preventDefault();
          setPage(page);
        }
      }
    };
    window.addEventListener('keydown', handleKeyDown);
    return () => window.removeEventListener('keydown', handleKeyDown);
  }, [setPage]);

  // Close shortcuts panel on click-outside or Escape
  useEffect(() => {
    if (!showShortcuts) return;
    const handleClick = (e: MouseEvent) => {
      if (shortcutsRef.current && !shortcutsRef.current.contains(e.target as Node)) {
        setShowShortcuts(false);
      }
    };
    const handleEscape = (e: KeyboardEvent) => {
      if (e.key === 'Escape') setShowShortcuts(false);
    };
    document.addEventListener('mousedown', handleClick);
    document.addEventListener('keydown', handleEscape);
    return () => {
      document.removeEventListener('mousedown', handleClick);
      document.removeEventListener('keydown', handleEscape);
    };
  }, [showShortcuts]);

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

      {/* Keyboard shortcuts hint */}
      <div ref={shortcutsRef} className="relative hidden lg:block">
        <button
          onClick={() => setShowShortcuts(!showShortcuts)}
          aria-label="Ver atajos de teclado"
          className="rounded-lg p-2 text-gray-600 transition-colors hover:bg-white/5 hover:text-gray-400"
        >
          <Keyboard className="h-4 w-4" />
        </button>
        {showShortcuts && (
          <div className="absolute right-0 top-full mt-2 w-56 rounded-xl border border-white/10 bg-[#0f0f18] p-3 shadow-2xl">
            <p className="mb-2 text-[10px] font-semibold uppercase tracking-wider text-gray-500">Atajos de teclado</p>
            <div className="space-y-1">
              {Object.entries(KEYBOARD_SHORTCUTS).map(([key, page]) => (
                <div key={key} className="flex items-center justify-between text-xs">
                  <span className="text-gray-400">{PAGE_TITLES[page]}</span>
                  <kbd className="rounded bg-white/5 px-1.5 py-0.5 font-mono text-[10px] text-gray-500">Alt+{key}</kbd>
                </div>
              ))}
            </div>
          </div>
        )}
      </div>

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
