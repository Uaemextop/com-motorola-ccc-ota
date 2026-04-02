import { defineConfig } from 'vite';
import { resolve } from 'path';

export default defineConfig({
  /* ── Deployment ────────────────────────────────────────────────── */
  base: '/com-motorola-ccc-ota/',

  /* ── Build ─────────────────────────────────────────────────────── */
  build: {
    outDir: 'dist',
    sourcemap: false,
    minify: 'esbuild',
    rollupOptions: {
      output: {
        /* Keep asset filenames predictable */
        assetFileNames: 'assets/[name]-[hash][extname]',
        chunkFileNames: 'assets/[name]-[hash].js',
        entryFileNames: 'assets/[name]-[hash].js',
      },
    },
  },

  /* ── Resolve ───────────────────────────────────────────────────── */
  resolve: {
    alias: {
      '@': resolve(__dirname, 'src/js'),
      '@styles': resolve(__dirname, 'src/styles'),
    },
  },

  /* ── CSS ────────────────────────────────────────────────────────── */
  css: {
    devSourcemap: true,
  },

  /* ── Dev Server ────────────────────────────────────────────────── */
  server: {
    open: false,
    port: 5173,
  },
});
