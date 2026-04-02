// Styles
import './styles/variables.css';
import './styles/main.css';
import './styles/layout.css';
import './styles/components.css';
import './styles/animations.css';

// Third-party CSS
import '@fortawesome/fontawesome-free/css/all.min.css';
import 'animate.css';
import 'nprogress/nprogress.css';
import 'toastify-js/src/toastify.css';

// NProgress configuration
import NProgress from 'nprogress';
NProgress.configure({ showSpinner: false, trickleSpeed: 200 });

// App initialization
import { createNavbar } from './js/components/navbar.js';
import { createFooter } from './js/components/footer.js';
import { initStarfield } from './js/components/starfield.js';
import { initRouter } from './js/router.js';

function initApp() {
  const app = document.getElementById('app');
  if (!app) return;
  
  // Create layout structure
  const navbar = createNavbar();
  app.prepend(navbar);
  
  // Create main content container (if not already in HTML)
  let content = document.getElementById('app-content');
  if (!content) {
    content = document.createElement('main');
    content.id = 'app-content';
    content.className = 'main-content';
    app.appendChild(content);
  }
  
  // Create footer
  const footer = createFooter();
  app.appendChild(footer);
  
  // Initialize starfield background
  const canvas = document.getElementById('starfield-canvas');
  if (canvas) {
    initStarfield(canvas);
  }
  
  // Initialize router
  initRouter();
}

// Start app when DOM is ready
if (document.readyState === 'loading') {
  document.addEventListener('DOMContentLoaded', initApp);
} else {
  initApp();
}
