/* ── Sidebar Navigation ─────────────────────────────────────── */

import { motion, AnimatePresence } from 'framer-motion';
import {
  Home,
  Search,
  Link2,
  ScanLine,
  Server,
  Settings,
  X,
  Zap,
  Download,
} from 'lucide-react';
import { useAppStore } from '@/lib/store';
import { cn } from '@/lib/utils';
import type { Page } from '@/lib/types';

interface NavItem {
  id: Page;
  label: string;
  icon: React.ElementType;
}

const NAV_ITEMS: NavItem[] = [
  { id: 'home', label: 'Inicio', icon: Home },
  { id: 'check', label: 'Verificar', icon: Search },
  { id: 'chain', label: 'Cadena', icon: Link2 },
  { id: 'scan', label: 'Escanear', icon: ScanLine },
  { id: 'lenovo', label: 'Lenovo Fix', icon: Download },
  { id: 'servers', label: 'Servidores', icon: Server },
  { id: 'config', label: 'Configuración', icon: Settings },
];

export default function Sidebar() {
  const { currentPage, setPage, sidebarOpen, setSidebarOpen } = useAppStore();

  return (
    <>
      {/* Mobile overlay */}
      <AnimatePresence>
        {sidebarOpen && (
          <motion.div
            initial={{ opacity: 0 }}
            animate={{ opacity: 1 }}
            exit={{ opacity: 0 }}
            className="fixed inset-0 z-40 bg-black/60 backdrop-blur-sm lg:hidden"
            onClick={() => setSidebarOpen(false)}
          />
        )}
      </AnimatePresence>

      {/* Sidebar - Desktop: always visible, Mobile: animated */}
      <aside
        className={cn(
          'fixed left-0 top-0 z-50 flex h-full w-64 flex-col',
          'border-r border-white/5 bg-[#0d0d1a]/95 backdrop-blur-xl',
          'transition-transform duration-300 ease-in-out',
          'lg:relative lg:translate-x-0',
          sidebarOpen ? 'translate-x-0' : '-translate-x-full',
        )}
      >
        {/* Header */}
        <div className="flex items-center justify-between border-b border-white/5 px-5 py-5">
          <div className="flex items-center gap-3">
            <div className="flex h-9 w-9 items-center justify-center rounded-lg bg-gradient-to-br from-blue-500 to-indigo-600 shadow-lg shadow-blue-500/20">
              <Zap className="h-5 w-5 text-white" />
            </div>
            <div>
              <h1 className="text-lg font-bold tracking-tight text-white">MotoOTA</h1>
              <p className="text-[10px] font-medium tracking-widest text-blue-400/70 uppercase">
                Motorola Updates
              </p>
            </div>
          </div>
          <button
            onClick={() => setSidebarOpen(false)}
            className="rounded-lg p-1.5 text-gray-400 transition-colors hover:bg-white/5 hover:text-white lg:hidden"
          >
            <X className="h-5 w-5" />
          </button>
        </div>

        {/* Navigation */}
        <nav className="flex-1 space-y-1 px-3 py-4">
          {NAV_ITEMS.map((item) => {
            const isActive = currentPage === item.id;
            const Icon = item.icon;
            return (
              <button
                key={item.id}
                onClick={() => {
                  setPage(item.id);
                  setSidebarOpen(false);
                }}
                className={cn(
                  'group relative flex w-full items-center gap-3 rounded-xl px-4 py-3 text-sm font-medium transition-all duration-200',
                  isActive
                    ? 'bg-blue-500/10 text-blue-400'
                    : 'text-gray-400 hover:bg-white/5 hover:text-white',
                )}
              >
                {isActive && (
                  <motion.div
                    layoutId="sidebar-indicator"
                    className="absolute left-0 top-1/2 h-6 w-1 -translate-y-1/2 rounded-r-full bg-blue-500"
                    transition={{ type: 'spring', damping: 20, stiffness: 300 }}
                  />
                )}
                <Icon className={cn('h-5 w-5 transition-colors', isActive && 'text-blue-400')} />
                <span>{item.label}</span>
              </button>
            );
          })}
        </nav>

        {/* Footer */}
        <div className="border-t border-white/5 px-5 py-4">
          <p className="text-xs text-gray-500">
            com.motorola.ccc.ota
          </p>
          <p className="mt-1 text-[10px] text-gray-600">v1.0.0</p>
        </div>
      </aside>
    </>
  );
}
