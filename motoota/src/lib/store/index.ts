/* ── Zustand Application Store ──────────────────────────────── */

import { create } from 'zustand';
import { persist } from 'zustand/middleware';
import type { Page, AppConfig, CheckResponse, ScanResult } from '@/lib/types';

/* ── Hash-based routing helpers ─────────────────────────────── */
const VALID_PAGES = new Set<Page>(['home', 'check', 'chain', 'scan', 'servers', 'config']);

function pageFromHash(): Page {
  const raw = window.location.hash.replace('#/', '').replace('#', '').split('?')[0];
  return VALID_PAGES.has(raw as Page) ? (raw as Page) : 'home';
}

function pushHash(page: Page) {
  const hash = page === 'home' ? '#/' : `#/${page}`;
  if (window.location.hash !== hash) {
    window.history.pushState(null, '', hash);
  }
}

interface AppState {
  /* ── Navigation ────────────────────────────────── */
  currentPage: Page;
  setPage: (page: Page) => void;
  sidebarOpen: boolean;
  toggleSidebar: () => void;
  setSidebarOpen: (open: boolean) => void;

  /* ── Configuration ─────────────────────────────── */
  config: AppConfig;
  updateConfig: (partial: Partial<AppConfig>) => void;

  /* ── Check results ─────────────────────────────── */
  lastCheck: CheckResponse | null;
  setLastCheck: (r: CheckResponse | null) => void;

  /* ── Chain results ─────────────────────────────── */
  chain: CheckResponse[];
  setChain: (c: CheckResponse[]) => void;

  /* ── Scan results ──────────────────────────────── */
  scanResults: ScanResult[];
  setScanResults: (r: ScanResult[]) => void;
  scanProgress: { completed: number; total: number };
  setScanProgress: (p: { completed: number; total: number }) => void;

  /* ── Loading / Error ───────────────────────────── */
  loading: boolean;
  setLoading: (l: boolean) => void;
  error: string | null;
  setError: (e: string | null) => void;
}

export const useAppStore = create<AppState>()(
  persist(
    (set) => ({
      currentPage: pageFromHash(),
      setPage: (page) => {
        pushHash(page);
        set({ currentPage: page, error: null });
      },
      sidebarOpen: false,
      toggleSidebar: () => set((s) => ({ sidebarOpen: !s.sidebarOpen })),
      setSidebarOpen: (open) => set({ sidebarOpen: open }),

      config: {
        server: 'production-global',
        guid: '',
        carrier: '',
        serial: '',
        context: 'ota',
        region: 'Global',
        timeout: 30,
        downloadNetwork: 'wifi',
      },
      updateConfig: (partial) =>
        set((s) => ({ config: { ...s.config, ...partial } })),

      lastCheck: null,
      setLastCheck: (r) => set({ lastCheck: r }),

      chain: [],
      setChain: (c) => set({ chain: c }),

      scanResults: [],
      setScanResults: (r) => set({ scanResults: r }),
      scanProgress: { completed: 0, total: 0 },
      setScanProgress: (p) => set({ scanProgress: p }),

      loading: false,
      setLoading: (l) => set({ loading: l }),
      error: null,
      setError: (e) => set({ error: e }),
    }),
    {
      name: 'motoota-config',
      partialize: (state) => ({ config: state.config }),
    },
  ),
);

/* ── Listen for browser back/forward (popstate) ─────────────── */
/* This listener is intentionally module-scoped — it persists for the lifetime
   of the SPA. The store is a singleton so cleanup is unnecessary. */
if (typeof window !== 'undefined') {
  window.addEventListener('popstate', () => {
    const page = pageFromHash();
    const currentPage = useAppStore.getState().currentPage;
    if (page !== currentPage) {
      useAppStore.setState({ currentPage: page, error: null });
    }
  });

  // Set initial hash if missing
  if (!window.location.hash) {
    window.history.replaceState(null, '', '#/');
  }
}
