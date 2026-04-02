import { createCard } from '../components/card.js';
import { CARRIERS } from '../config/carriers.js';
import { SERVERS } from '../config/servers.js';
import { getAllRegionNames } from '../config/carriers.js';

function injectAboutStyles() {
  if (document.getElementById('page-about-styles')) return;
  const style = document.createElement('style');
  style.id = 'page-about-styles';
  style.textContent = `
    .about-header {
      text-align: center;
      padding: var(--space-8, 32px) 0 var(--space-6, 24px);
    }

    .about-header-icon {
      font-size: 2.5rem;
      color: var(--color-cyan, #00d4ff);
      margin-bottom: var(--space-3, 12px);
    }

    .about-header h1 {
      margin-bottom: var(--space-2, 8px);
    }

    .about-header p {
      max-width: 600px;
      margin: 0 auto;
    }

    .about-version {
      display: inline-block;
      padding: 2px var(--space-3, 12px);
      background: rgba(0, 212, 255, 0.15);
      color: var(--color-cyan, #00d4ff);
      border: 1px solid rgba(0, 212, 255, 0.3);
      border-radius: var(--radius-full, 9999px);
      font-size: var(--font-size-xs, 0.75rem);
      font-weight: 600;
      margin-top: var(--space-2, 8px);
    }

    .about-grid {
      display: grid;
      grid-template-columns: repeat(auto-fit, minmax(320px, 1fr));
      gap: var(--space-4, 16px);
    }

    .about-list {
      list-style: none;
      padding: 0;
      margin: 0;
    }

    .about-list li {
      padding: var(--space-2, 8px) 0;
      border-bottom: 1px solid var(--color-border, #2a3450);
      font-size: var(--font-size-sm, 0.875rem);
      color: var(--color-text-muted, #94a3b8);
      display: flex;
      align-items: center;
      gap: var(--space-2, 8px);
    }

    .about-list li:last-child { border-bottom: none; }

    .about-list li i {
      color: var(--color-cyan, #00d4ff);
      width: 20px;
      text-align: center;
      flex-shrink: 0;
    }

    .about-endpoint {
      font-family: var(--font-mono, monospace);
      font-size: var(--font-size-xs, 0.75rem);
      color: var(--color-bright-cyan, #5eead4);
      background: var(--color-surface, #131a2b);
      padding: 2px 6px;
      border-radius: var(--radius-sm, 4px);
      display: inline-block;
    }

    .about-links {
      display: flex;
      flex-wrap: wrap;
      gap: var(--space-3, 12px);
      margin-top: var(--space-4, 16px);
    }

    .about-links a {
      display: inline-flex;
      align-items: center;
      gap: var(--space-2, 8px);
    }
  `;
  document.head.appendChild(style);
}

export function render(container) {
  injectAboutStyles();
  container.innerHTML = '';

  const page = document.createElement('div');
  page.className = 'container';

  // Header
  const headerEl = document.createElement('div');
  headerEl.className = 'about-header';
  headerEl.innerHTML = `
    <div class="about-header-icon"><i class="fa-solid fa-mobile-screen"></i></div>
    <h1>MotoOTA</h1>
    <p>A web-based tool for querying Motorola's Content Delivery System (CDS) to check
       for OTA firmware updates, walk update chains, and scan carriers.</p>
    <span class="about-version">v2.1.0</span>
  `;
  page.appendChild(headerEl);

  const grid = document.createElement('div');
  grid.className = 'about-grid section';

  // Features
  const features = [
    { icon: 'fa-solid fa-magnifying-glass', text: 'Check for OTA updates by GUID and carrier' },
    { icon: 'fa-solid fa-link', text: 'Walk the full update chain from any firmware version' },
    { icon: 'fa-solid fa-radar', text: 'Scan all carriers to find available updates' },
    { icon: 'fa-solid fa-tower-cell', text: `Browse ${CARRIERS.length} carriers across ${getAllRegionNames().length} regions` },
    { icon: 'fa-solid fa-server', text: `${SERVERS.length} CDS server endpoints configured` },
    { icon: 'fa-solid fa-floppy-disk', text: 'Persistent configuration via localStorage' },
    { icon: 'fa-solid fa-shield-halved', text: 'Input validation and XSS prevention' },
    { icon: 'fa-solid fa-chart-pie', text: 'Visual scan results with charts and tables' },
  ];

  const featureList = document.createElement('ul');
  featureList.className = 'about-list';
  features.forEach(({ icon, text }) => {
    const li = document.createElement('li');
    li.innerHTML = `<i class="${icon}"></i> ${text}`;
    featureList.appendChild(li);
  });

  grid.appendChild(createCard({
    title: 'Features',
    icon: 'fa-solid fa-star',
    content: featureList.outerHTML,
  }));

  // Technical details
  const techItems = [
    { icon: 'fa-solid fa-globe', text: 'API: Motorola CDS (Content Delivery System)' },
    { icon: 'fa-solid fa-route', text: `Endpoint: <span class="about-endpoint">/cds/upgrade/1/check/ctx/{ctx}/key/{guid}</span>` },
    { icon: 'fa-solid fa-database', text: `Data: ${CARRIERS.length} carriers, ${SERVERS.length} servers, ${getAllRegionNames().length} regions` },
    { icon: 'fa-solid fa-code', text: 'Frontend: Vanilla JS + Vite' },
    { icon: 'fa-solid fa-palette', text: 'UI: Custom dark theme with CSS variables' },
    { icon: 'fa-brands fa-font-awesome', text: 'Icons: Font Awesome 7' },
    { icon: 'fa-solid fa-chart-simple', text: 'Charts: Chart.js' },
    { icon: 'fa-solid fa-shield', text: 'Sanitization: DOMPurify' },
  ];

  const techList = document.createElement('ul');
  techList.className = 'about-list';
  techItems.forEach(({ icon, text }) => {
    const li = document.createElement('li');
    li.innerHTML = `<i class="${icon}"></i> ${text}`;
    techList.appendChild(li);
  });

  grid.appendChild(createCard({
    title: 'Technical Details',
    icon: 'fa-solid fa-microchip',
    content: techList.outerHTML,
  }));

  // Credits
  const creditsContent = `
    <ul class="about-list">
      <li><i class="fa-solid fa-users"></i> Community carrier database sourced from XDA and firmware repos</li>
      <li><i class="fa-solid fa-book"></i> Motorola CDS API reverse-engineered from the OTA client</li>
      <li><i class="fa-brands fa-python"></i> Python CLI companion: <code>moto-ota</code> v2.1.0</li>
    </ul>
    <div class="about-links">
      <a href="https://github.com" target="_blank" rel="noopener noreferrer">
        <i class="fa-brands fa-github"></i> GitHub
      </a>
      <a href="https://forum.xda-developers.com" target="_blank" rel="noopener noreferrer">
        <i class="fa-solid fa-comments"></i> XDA Forums
      </a>
    </div>
  `;

  grid.appendChild(createCard({
    title: 'Credits & Links',
    icon: 'fa-solid fa-heart',
    content: creditsContent,
  }));

  page.appendChild(grid);
  container.appendChild(page);
}
