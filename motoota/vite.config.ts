import { defineConfig } from 'vite';
import react from '@vitejs/plugin-react';
import tailwindcss from '@tailwindcss/vite';
import path from 'path';

export default defineConfig({
  plugins: [react(), tailwindcss()],

  base: process.env.VITE_BASE_PATH || '/',

  resolve: {
    alias: {
      '@': path.resolve(__dirname, 'src'),
    },
  },

  build: {
    outDir: 'dist',
    sourcemap: false,
    minify: 'esbuild',
    rollupOptions: {
      output: {
        manualChunks: {
          vendor: ['react', 'react-dom'],
          motion: ['framer-motion'],
        },
      },
    },
  },

  server: {
    port: 5173,
    open: false,
    proxy: {
      '/api': {
        target: 'https://com-motorola-ccc-ota.ealvarado2677.workers.dev',
        changeOrigin: true,
      },
    },
  },
});
