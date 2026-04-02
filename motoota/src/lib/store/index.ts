/* ── Zustand Application Store ──────────────────────────────── */

import { create } from 'zustand';
import { persist } from 'zustand/middleware';
import type { Page, AppConfig, CheckResponse, ScanResult } from '@/lib/types';

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
      currentPage: 'home',
      setPage: (page) => set({ currentPage: page, error: null }),
      sidebarOpen: false,
      toggleSidebar: () => set((s) => ({ sidebarOpen: !s.sidebarOpen })),
      setSidebarOpen: (open) => set({ sidebarOpen: open }),

      config: {
        server: 'production-global',
        guid: '',
        carrier: '',
        context: 'ota',
        region: 'Global',
        timeout: 30,
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
