import { create } from 'zustand';
import { persist } from 'zustand/middleware';

export const useAppStore = create(
  persist(
    (set) => ({
      server: 'production-global',
      region: 'Global',
      timeout: 30,
      guid: '',
      carrier: '',
      context: 'ota',
      setField: (key, value) => set({ [key]: value }),
      resetConfig: () => set({
        server: 'production-global',
        region: 'Global',
        timeout: 30,
        guid: '',
        carrier: '',
        context: 'ota',
      }),
    }),
    { name: 'motoota-config' }
  )
);
