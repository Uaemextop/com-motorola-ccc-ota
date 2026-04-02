import { createCard } from '../components/card.js';
import { SERVERS } from '../config/servers.js';
import { groupBy } from '../utils/helpers.js';

function injectServersStyles() {
  if (document.getElementById('page-servers-styles')) return;
  const style = document.createElement('style');
  style.id = 'page-servers-styles';
  style.textContent = `
    .servers-region-group {
      margin-bottom: var(--space-6, 24px);
    }

    .servers-region-title {
      font-size: var(--font-size-lg, 1.125rem);
      font-weight: 600;
      color: var(--color-text, #fff);
      margin-bottom: var(--space-4, 16px);
      display: flex;
      align-items: center;
      gap: var(--space-2, 8px);
    }

    .servers-region-title i {
      color: var(--color-cyan, #00d4ff);
    }

    .servers-grid {
      display: grid;
      grid-template-columns: repeat(auto-fit, minmax(320px, 1fr));
      gap: var(--space-4, 16px);
    }

    .server-card {
      position: relative;
    }

    .server-card--active {
      border-color: var(--color-green, #22c55e) !important;
      box-shadow: 0 0 12px rgba(34, 197, 94, 0.15);
    }

    .server-status-badge {
      display: inline-flex;
      align-items: center;
      gap: var(--space-1, 4px);
      padding: 2px var(--space-2, 8px);
      font-size: var(--font-size-xs, 0.75rem);
      font-weight: 600;
      border-radius: var(--radius-full, 9999px);
      text-transform: uppercase;
      letter-spacing: 0.05em;
    }

    .server-status-active {
      background: rgba(34, 197, 94, 0.15);
      color: var(--color-green, #22c55e);
      border: 1px solid rgba(34, 197, 94, 0.3);
    }

    .server-status-inactive {
      background: rgba(100, 116, 139, 0.15);
      color: var(--color-text-disabled, #64748b);
      border: 1px solid rgba(100, 116, 139, 0.3);
    }

    .server-host {
      font-family: var(--font-mono, monospace);
      font-size: var(--font-size-xs, 0.75rem);
      color: var(--color-cyan, #00d4ff);
      background: var(--color-surface, #131a2b);
      padding: 2px var(--space-2, 8px);
      border-radius: var(--radius-sm, 4px);
      display: inline-block;
      margin-top: var(--space-2, 8px);
    }

    .server-desc {
      font-size: var(--font-size-sm, 0.875rem);
      color: var(--color-text-muted, #94a3b8);
      margin-top: var(--space-2, 8px);
      line-height: 1.5;
    }

    .server-meta {
      display: flex;
      align-items: center;
      gap: var(--space-3, 12px);
      margin-top: var(--space-3, 12px);
      flex-wrap: wrap;
    }
  `;
  document.head.appendChild(style);
}

export function render(container) {
  injectServersStyles();
  container.innerHTML = '';

  const page = document.createElement('div');
  page.className = 'container';

  const header = document.createElement('div');
  header.className = 'section-header';
  header.innerHTML = '<h2 class="section-title"><i class="fa-solid fa-server" style="color:var(--color-cyan)"></i> Servers</h2>';
  page.appendChild(header);

  const desc = document.createElement('p');
  desc.textContent = `${SERVERS.length} Motorola CDS servers used for OTA update checks.`;
  page.appendChild(desc);

  // Group by region
  const grouped = groupBy(SERVERS, 'region');
  const regionIcons = {
    Global: 'fa-solid fa-globe',
    China: 'fa-solid fa-earth-asia',
  };

  Object.entries(grouped).forEach(([region, servers]) => {
    const group = document.createElement('div');
    group.className = 'servers-region-group';

    const title = document.createElement('h3');
    title.className = 'servers-region-title';
    const icon = regionIcons[region] || 'fa-solid fa-globe';
    title.innerHTML = `<i class="${icon}"></i> ${region}`;
    group.appendChild(title);

    const grid = document.createElement('div');
    grid.className = 'servers-grid';

    servers.forEach(server => {
      const isActive = server.status === 'active';

      // Build card content
      const statusBadge = document.createElement('span');
      statusBadge.className = `server-status-badge ${isActive ? 'server-status-active' : 'server-status-inactive'}`;
      statusBadge.innerHTML = isActive
        ? '<i class="fa-solid fa-circle" style="font-size:6px"></i> Active'
        : '<i class="fa-solid fa-circle" style="font-size:6px"></i> Inactive';

      const contentHtml = `
        <div class="server-meta">${statusBadge.outerHTML}</div>
        <div class="server-host">${server.host}</div>
        <div class="server-desc">${server.description}</div>
      `;

      const card = createCard({
        title: server.name,
        subtitle: `ID: ${server.id}`,
        icon: 'fa-solid fa-server',
        content: contentHtml,
      });

      if (isActive) card.classList.add('server-card--active');
      card.classList.add('server-card');
      grid.appendChild(card);
    });

    group.appendChild(grid);
    page.appendChild(group);
  });

  container.appendChild(page);
}
