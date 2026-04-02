import { updateActiveLink } from './components/navbar.js';

const routes = {
  '#home': () => import('./pages/home.js'),
  '#check': () => import('./pages/check.js'),
  '#chain': () => import('./pages/chain.js'),
  '#scan': () => import('./pages/scan.js'),
  '#carriers': () => import('./pages/carriers.js'),
  '#servers': () => import('./pages/servers.js'),
  '#config': () => import('./pages/config.js'),
  '#about': () => import('./pages/about.js'),
};

let currentCleanup = null;

export async function navigateTo(hash) {
  const container = document.getElementById('app-content');
  if (!container) return;
  
  // Cleanup previous page if needed
  if (currentCleanup) {
    currentCleanup();
    currentCleanup = null;
  }
  
  const loader = routes[hash] || routes['#home'];
  try {
    const module = await loader();
    container.innerHTML = '';
    container.classList.add('page-transition');
    const cleanup = module.render(container);
    if (typeof cleanup === 'function') currentCleanup = cleanup;
    updateActiveLink(hash);
    requestAnimationFrame(() => container.classList.remove('page-transition'));
  } catch (err) {
    console.error('Route error:', err);
    container.innerHTML = '<div class="error-page"><h2>Page Load Error</h2><p>' + err.message + '</p></div>';
  }
}

export function initRouter() {
  window.addEventListener('hashchange', () => navigateTo(location.hash || '#home'));
  navigateTo(location.hash || '#home');
}
