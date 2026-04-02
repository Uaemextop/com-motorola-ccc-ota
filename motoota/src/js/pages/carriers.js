import { createDataTable } from '../components/table.js';
import { openModal } from '../components/modal.js';
import { CARRIERS, searchCarriers, getCarriersByRegion, getRegionCounts, getAllRegionNames } from '../config/carriers.js';
import { getRegionInfo } from '../config/regions.js';

function injectCarriersStyles() {
  if (document.getElementById('page-carriers-styles')) return;
  const style = document.createElement('style');
  style.id = 'page-carriers-styles';
  style.textContent = `
    .carriers-toolbar {
      display: flex;
      flex-wrap: wrap;
      gap: var(--space-3, 12px);
      align-items: center;
      margin-bottom: var(--space-4, 16px);
    }

    .carriers-region-chips {
      display: flex;
      flex-wrap: wrap;
      gap: var(--space-2, 8px);
      margin-bottom: var(--space-4, 16px);
    }

    .carriers-region-chip-count {
      margin-left: var(--space-1, 4px);
      font-size: var(--font-size-xs, 0.75rem);
      opacity: 0.7;
    }

    .carrier-detail-grid {
      display: grid;
      grid-template-columns: auto 1fr;
      gap: var(--space-2, 8px) var(--space-4, 16px);
    }

    .carrier-detail-label {
      font-size: var(--font-size-sm, 0.875rem);
      color: var(--color-text-disabled, #64748b);
      font-weight: 500;
    }

    .carrier-detail-value {
      font-size: var(--font-size-sm, 0.875rem);
      color: var(--color-text, #fff);
    }

    .carriers-table-row-clickable {
      cursor: pointer;
    }
  `;
  document.head.appendChild(style);
}

export function render(container) {
  injectCarriersStyles();
  container.innerHTML = '';

  const page = document.createElement('div');
  page.className = 'container';

  const header = document.createElement('div');
  header.className = 'section-header';
  header.innerHTML = '<h2 class="section-title"><i class="fa-solid fa-tower-cell" style="color:var(--color-cyan)"></i> Carrier Browser</h2>';
  page.appendChild(header);

  const desc = document.createElement('p');
  desc.textContent = `Browse all ${CARRIERS.length} carriers across ${getAllRegionNames().length} regions. Click a row to see carrier details.`;
  page.appendChild(desc);

  // Region chips
  const regionCounts = getRegionCounts();
  const chipWrap = document.createElement('div');
  chipWrap.className = 'carriers-region-chips';

  let activeRegion = 'All';

  function buildChips() {
    chipWrap.innerHTML = '';
    const allChip = document.createElement('button');
    allChip.className = `chip ${activeRegion === 'All' ? 'active' : ''}`;
    allChip.innerHTML = `All <span class="carriers-region-chip-count">${CARRIERS.length}</span>`;
    allChip.addEventListener('click', () => setRegion('All'));
    chipWrap.appendChild(allChip);

    getAllRegionNames().forEach(r => {
      const count = regionCounts[r] || 0;
      const info = getRegionInfo(r);
      const chip = document.createElement('button');
      chip.className = `chip ${activeRegion === r ? 'active' : ''}`;
      chip.innerHTML = `<i class="${info.icon}" style="color:${info.color}"></i> ${r} <span class="carriers-region-chip-count">${count}</span>`;
      chip.addEventListener('click', () => setRegion(r));
      chipWrap.appendChild(chip);
    });
  }

  function setRegion(region) {
    activeRegion = region;
    buildChips();
    const data = region === 'All' ? CARRIERS : getCarriersByRegion(region);
    table.setData([...data]);
  }

  buildChips();
  page.appendChild(chipWrap);

  // Data table
  const table = createDataTable({
    columns: [
      {
        key: 'code', label: 'Code', sortable: true,
        render: (val) => `<code style="color:var(--color-cyan)">${val}</code>`,
      },
      { key: 'name', label: 'Name', sortable: true },
      {
        key: 'region', label: 'Region', sortable: true,
        render: (val) => {
          const info = getRegionInfo(val);
          return `<span style="color:${info.color}"><i class="${info.icon}"></i> ${val}</span>`;
        },
      },
    ],
    pageSize: 20,
    searchPlaceholder: 'Search carriers by code, name, or region…',
  });

  table.setData([...CARRIERS]);

  // Make rows clickable
  table.element.addEventListener('click', (e) => {
    const row = e.target.closest('tbody tr');
    if (!row) return;
    const codeCell = row.querySelector('td code');
    if (!codeCell) return;
    const code = codeCell.textContent;
    const carrier = CARRIERS.find(c => c.code === code);
    if (!carrier) return;

    const info = getRegionInfo(carrier.region);
    const detail = document.createElement('div');
    detail.className = 'carrier-detail-grid';
    detail.innerHTML = `
      <span class="carrier-detail-label">Code</span>
      <span class="carrier-detail-value"><code>${carrier.code}</code></span>
      <span class="carrier-detail-label">Name</span>
      <span class="carrier-detail-value">${carrier.name}</span>
      <span class="carrier-detail-label">Region</span>
      <span class="carrier-detail-value" style="color:${info.color}"><i class="${info.icon}"></i> ${carrier.region}</span>
      <span class="carrier-detail-label">Description</span>
      <span class="carrier-detail-value">${info.description}</span>
    `;

    openModal({
      title: `${carrier.name}`,
      content: detail,
      actions: [
        {
          label: 'Check Update',
          className: 'btn-primary',
          onClick: () => { window.location.hash = '#check'; },
        },
      ],
    });
  });

  page.appendChild(table.element);
  container.appendChild(page);
}
