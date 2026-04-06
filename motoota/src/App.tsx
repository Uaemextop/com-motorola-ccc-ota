/* ── App Root ───────────────────────────────────────────────── */

import { Suspense, lazy } from 'react';
import { AnimatePresence, motion } from 'framer-motion';
import Sidebar from '@/components/layout/Sidebar';
import Header from '@/components/layout/Header';
import { ToastContainer } from '@/components/ui/Toast';
import Spinner from '@/components/ui/Spinner';
import AnimatedBackground from '@/components/backgrounds/AnimatedBackground';
import { useAppStore } from '@/lib/store';

const HomePage = lazy(() => import('@/pages/HomePage'));
const CheckPage = lazy(() => import('@/pages/CheckPage'));
const ChainPage = lazy(() => import('@/pages/ChainPage'));
const ScanPage = lazy(() => import('@/pages/ScanPage'));
const ServersPage = lazy(() => import('@/pages/ServersPage'));
const ConfigPage = lazy(() => import('@/pages/ConfigPage'));
const LenovoPage = lazy(() => import('@/pages/LenovoPage'));

const PAGES: Record<string, React.LazyExoticComponent<React.ComponentType>> = {
  home: HomePage,
  check: CheckPage,
  chain: ChainPage,
  scan: ScanPage,
  servers: ServersPage,
  config: ConfigPage,
  lenovo: LenovoPage,
};

function PageLoader() {
  return (
    <div className="flex h-64 items-center justify-center">
      <Spinner size="lg" label="Cargando..." />
    </div>
  );
}

export default function App() {
  const currentPage = useAppStore((s) => s.currentPage);
  const error = useAppStore((s) => s.error);
  const setError = useAppStore((s) => s.setError);

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
                  className="rounded px-2 py-1 text-xs text-red-400 hover:bg-red-500/10"
                >
                  Cerrar
                </button>
              </motion.div>
            )}
          </AnimatePresence>

          <Suspense fallback={<PageLoader />}>
            <AnimatePresence mode="wait">
              <motion.div
                key={currentPage}
                initial={{ opacity: 0, y: 10 }}
                animate={{ opacity: 1, y: 0 }}
                exit={{ opacity: 0, y: -10 }}
                transition={{ duration: 0.2 }}
              >
                <PageComponent />
              </motion.div>
            </AnimatePresence>
          </Suspense>
        </main>
      </div>
      <ToastContainer />
    </div>
  );
}
