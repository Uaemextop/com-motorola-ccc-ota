/* ── App Root ───────────────────────────────────────────────── */

import { useEffect, lazy, Suspense } from 'react';
import { AnimatePresence, motion } from 'framer-motion';
import Sidebar from '@/components/layout/Sidebar';
import Header from '@/components/layout/Header';
import { ToastContainer } from '@/components/ui/Toast';
import AnimatedBackground from '@/components/backgrounds/AnimatedBackground';
import Spinner from '@/components/ui/Spinner';
import { useAppStore } from '@/lib/store';

/* Lazy-load pages — each page is code-split into its own chunk */
const HomePage = lazy(() => import('@/pages/HomePage'));
const CheckPage = lazy(() => import('@/pages/CheckPage'));
const ChainPage = lazy(() => import('@/pages/ChainPage'));
const ScanPage = lazy(() => import('@/pages/ScanPage'));
const ServersPage = lazy(() => import('@/pages/ServersPage'));
const ConfigPage = lazy(() => import('@/pages/ConfigPage'));

const PAGES: Record<string, React.LazyExoticComponent<React.ComponentType>> = {
  home: HomePage,
  check: CheckPage,
  chain: ChainPage,
  scan: ScanPage,
  servers: ServersPage,
  config: ConfigPage,
};

const PAGE_TITLES: Record<string, string> = {
  home: 'MotoOTA — Motorola OTA Updates',
  check: 'Verificar Actualización — MotoOTA',
  chain: 'Cadena de Actualizaciones — MotoOTA',
  scan: 'Escanear Carriers — MotoOTA',
  servers: 'Servidores CDS — MotoOTA',
  config: 'Configuración — MotoOTA',
};

export default function App() {
  const currentPage = useAppStore((s) => s.currentPage);
  const error = useAppStore((s) => s.error);
  const setError = useAppStore((s) => s.setError);

  // Update document title on page change
  useEffect(() => {
    document.title = PAGE_TITLES[currentPage] || 'MotoOTA';
  }, [currentPage]);

  const PageComponent = PAGES[currentPage] || HomePage;

  return (
    <div className="flex h-screen overflow-hidden">
      <AnimatedBackground />
      <Sidebar />
      <div className="flex flex-1 flex-col overflow-hidden">
        <Header />
        <main className="flex-1 overflow-auto px-4 py-6 sm:px-6 lg:px-8">
          {/* Error banner */}
          <AnimatePresence>
            {error && (
              <motion.div
                initial={{ opacity: 0, y: -10 }}
                animate={{ opacity: 1, y: 0 }}
                exit={{ opacity: 0, y: -10 }}
                className="mb-4 flex items-center justify-between rounded-xl border border-red-500/20 bg-red-500/5 px-4 py-3 text-sm text-red-300"
              >
                <p>{error}</p>
                <button
                  onClick={() => setError(null)}
                  aria-label="Cerrar error"
                  className="rounded px-2 py-1 text-xs text-red-400 hover:bg-red-500/10"
                >
                  Cerrar
                </button>
              </motion.div>
            )}
          </AnimatePresence>

          <AnimatePresence mode="wait">
            <motion.div
              key={currentPage}
              initial={{ opacity: 0, y: 6 }}
              animate={{ opacity: 1, y: 0 }}
              exit={{ opacity: 0, y: -6 }}
              transition={{ duration: 0.15 }}
            >
              <Suspense fallback={
                <div className="flex items-center justify-center py-20">
                  <Spinner size="lg" />
                </div>
              }>
                <PageComponent />
              </Suspense>
            </motion.div>
          </AnimatePresence>
        </main>
      </div>
      <ToastContainer />
    </div>
  );
}
