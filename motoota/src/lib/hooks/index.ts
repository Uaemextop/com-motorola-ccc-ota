/* ── Custom Hooks ───────────────────────────────────────────── */

import { useState, useCallback, useRef } from 'react';
import { checkUpdate, walkChain, scanCarriers } from '@/lib/api/client';
import { getServerById } from '@/lib/api/servers';
import { useAppStore } from '@/lib/store';
import type { Carrier, ScanResult } from '@/lib/types';

export function useOtaCheck() {
  const { config, setLastCheck, setLoading, setError } = useAppStore();
  const [checking, setChecking] = useState(false);

  const check = useCallback(
    async (guid?: string, carrier?: string) => {
      const g = guid || config.guid;
      const c = carrier || config.carrier;
      if (!g || !c) {
        setError('Se requiere GUID y carrier');
        return null;
      }

      setChecking(true);
      setLoading(true);
      setError(null);

      try {
        const server = getServerById(config.server);
        const result = await checkUpdate(g, c, {
          host: server?.host,
          context: config.context,
          timeout: config.timeout,
        });
        setLastCheck(result);
        return result;
      } catch (err) {
        const msg = err instanceof Error ? err.message : 'Error desconocido';
        setError(msg);
        return null;
      } finally {
        setChecking(false);
        setLoading(false);
      }
    },
    [config, setLastCheck, setLoading, setError],
  );

  return { check, checking };
}

export function useChainWalk() {
  const { config, setChain, setLoading, setError } = useAppStore();
  const [walking, setWalking] = useState(false);

  const walk = useCallback(
    async (guid?: string, carrier?: string) => {
      const g = guid || config.guid;
      const c = carrier || config.carrier;
      if (!g || !c) {
        setError('Se requiere GUID y carrier');
        return [];
      }

      setWalking(true);
      setLoading(true);
      setError(null);

      try {
        const server = getServerById(config.server);
        const chain = await walkChain(g, c, {
          host: server?.host,
          context: config.context,
          timeout: config.timeout,
        });
        setChain(chain);
        return chain;
      } catch (err) {
        const msg = err instanceof Error ? err.message : 'Error desconocido';
        setError(msg);
        return [];
      } finally {
        setWalking(false);
        setLoading(false);
      }
    },
    [config, setChain, setLoading, setError],
  );

  return { walk, walking };
}

export function useCarrierScan() {
  const { config, setScanResults, setScanProgress, setLoading, setError } =
    useAppStore();
  const [scanning, setScanning] = useState(false);
  const flushTimer = useRef<ReturnType<typeof setTimeout> | null>(null);

  const scan = useCallback(
    async (guid?: string, carriers?: Carrier[], walkChains = true) => {
      const g = guid || config.guid;
      if (!g) {
        setError('Se requiere GUID');
        return [];
      }

      setScanning(true);
      setLoading(true);
      setError(null);
      setScanResults([]);
      setScanProgress({ completed: 0, total: carriers?.length || 0 });

      try {
        const server = getServerById(config.server);
        const accumulated: ScanResult[] = [];

        const scheduleFlush = () => {
          if (!flushTimer.current) {
            flushTimer.current = setTimeout(() => {
              flushTimer.current = null;
              setScanResults([...accumulated]);
            }, 150);
          }
        };

        const results = await scanCarriers(g, carriers || [], {
          host: server?.host,
          context: config.context,
          concurrency: 20,
          walkOpenChains: walkChains,
          onProgress: (completed: number, total: number, result: ScanResult) => {
            setScanProgress({ completed, total });
            accumulated.push(result);
            scheduleFlush();
          },
          onChainProgress: () => {
            scheduleFlush();
          },
        });
        if (flushTimer.current) {
          clearTimeout(flushTimer.current);
          flushTimer.current = null;
        }
        setScanResults(results);
        return results;
      } catch (err) {
        const msg = err instanceof Error ? err.message : 'Error desconocido';
        setError(msg);
        return [];
      } finally {
        setScanning(false);
        setLoading(false);
      }
    },
    [config, setScanResults, setScanProgress, setLoading, setError],
  );

  return { scan, scanning };
}
