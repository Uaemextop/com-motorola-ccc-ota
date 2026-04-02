import DOMPurify from 'dompurify';

function injectTableStyles() {
  if (document.getElementById('moto-table-styles')) return;
  const style = document.createElement('style');
  style.id = 'moto-table-styles';
  style.textContent = `
    .moto-table-container {
      font-family: var(--font-family, sans-serif);
    }

    .moto-table-toolbar {
      display: flex;
      align-items: center;
      justify-content: space-between;
      gap: var(--space-3, 12px);
      margin-bottom: var(--space-4, 16px);
      flex-wrap: wrap;
    }

    .moto-table-search {
      width: 100%;
      max-width: 320px;
      padding: var(--space-2, 8px) var(--space-3, 12px);
      font-size: var(--font-size-sm, 0.875rem);
      color: var(--color-text, #ffffff);
      background: var(--color-surface, #131a2b);
      border: 1px solid var(--color-border, #2a3450);
      border-radius: var(--radius-md, 8px);
      transition: border-color var(--transition-fast, 150ms ease);
    }

    .moto-table-search:focus {
      outline: none;
      border-color: var(--color-cyan, #00d4ff);
      box-shadow: 0 0 0 3px rgba(0, 212, 255, 0.15);
    }

    .moto-table-search::placeholder {
      color: var(--color-text-disabled, #64748b);
    }

    .moto-table-wrapper {
      overflow-x: auto;
      border: 1px solid var(--color-border, #2a3450);
      border-radius: var(--radius-lg, 12px);
    }

    .moto-table {
      width: 100%;
      border-collapse: collapse;
      font-size: var(--font-size-sm, 0.875rem);
    }

    .moto-table th {
      text-align: left;
      padding: var(--space-3, 12px) var(--space-4, 16px);
      font-weight: 600;
      font-size: var(--font-size-xs, 0.75rem);
      text-transform: uppercase;
      letter-spacing: 0.05em;
      color: var(--color-text-muted, #94a3b8);
      background: var(--color-surface, #131a2b);
      border-bottom: 1px solid var(--color-border, #2a3450);
      white-space: nowrap;
      user-select: none;
    }

    .moto-table th.sortable {
      cursor: pointer;
      transition: color var(--transition-fast, 150ms ease);
    }

    .moto-table th.sortable:hover {
      color: var(--color-text, #ffffff);
    }

    .moto-table th .sort-icon {
      margin-left: var(--space-1, 4px);
      font-size: 0.65rem;
      opacity: 0.4;
    }

    .moto-table th .sort-icon.active {
      opacity: 1;
      color: var(--color-cyan, #00d4ff);
    }

    .moto-table td {
      padding: var(--space-3, 12px) var(--space-4, 16px);
      border-bottom: 1px solid var(--color-border, #2a3450);
      color: var(--color-text-muted, #94a3b8);
    }

    .moto-table tbody tr:last-child td {
      border-bottom: none;
    }

    .moto-table tbody tr {
      transition: background var(--transition-fast, 150ms ease);
    }

    .moto-table tbody tr:hover {
      background: rgba(0, 212, 255, 0.03);
    }

    .moto-table-empty {
      text-align: center;
      padding: var(--space-10, 40px);
      color: var(--color-text-disabled, #64748b);
    }

    .moto-table-pagination {
      display: flex;
      align-items: center;
      justify-content: space-between;
      margin-top: var(--space-4, 16px);
      font-size: var(--font-size-xs, 0.75rem);
      color: var(--color-text-muted, #94a3b8);
      flex-wrap: wrap;
      gap: var(--space-2, 8px);
    }

    .moto-table-page-buttons {
      display: flex;
      gap: var(--space-1, 4px);
    }

    .moto-table-page-btn {
      padding: var(--space-1, 4px) var(--space-3, 12px);
      font-size: var(--font-size-xs, 0.75rem);
      background: var(--color-surface, #131a2b);
      color: var(--color-text-muted, #94a3b8);
      border: 1px solid var(--color-border, #2a3450);
      border-radius: var(--radius-md, 8px);
      cursor: pointer;
      transition: all var(--transition-fast, 150ms ease);
    }

    .moto-table-page-btn:hover:not(:disabled) {
      border-color: var(--color-cyan, #00d4ff);
      color: var(--color-text, #ffffff);
    }

    .moto-table-page-btn:disabled {
      opacity: 0.4;
      cursor: not-allowed;
    }

    .moto-table-page-btn.active {
      background: var(--color-cyan, #00d4ff);
      color: #0a0e17;
      border-color: var(--color-cyan, #00d4ff);
      font-weight: 600;
    }
  `;
  document.head.appendChild(style);
}

/**
 * Create a sortable, filterable, paginated data table.
 *
 * @param {object} config
 * @param {Array<{key:string, label:string, sortable?:boolean, render?:Function}>} config.columns
 * @param {number} [config.pageSize=10]
 * @param {string} [config.searchPlaceholder='Search…']
 * @returns {{ element: HTMLElement, setData: (data: any[]) => void, refresh: () => void }}
 */
export function createDataTable(config) {
  injectTableStyles();

  const { columns, pageSize = 10, searchPlaceholder = 'Search\u2026' } = config;

  let allData = [];
  let filtered = [];
  let sortKey = null;
  let sortDir = 'asc';
  let currentPage = 1;
  let searchTerm = '';

  // Container
  const container = document.createElement('div');
  container.className = 'moto-table-container';

  // Toolbar
  const toolbar = document.createElement('div');
  toolbar.className = 'moto-table-toolbar';

  const searchInput = document.createElement('input');
  searchInput.type = 'text';
  searchInput.className = 'moto-table-search';
  searchInput.placeholder = searchPlaceholder;
  searchInput.addEventListener('input', () => {
    searchTerm = searchInput.value.toLowerCase();
    currentPage = 1;
    applyFilter();
    render();
  });
  toolbar.appendChild(searchInput);
  container.appendChild(toolbar);

  // Table wrapper
  const wrapper = document.createElement('div');
  wrapper.className = 'moto-table-wrapper';

  const table = document.createElement('table');
  table.className = 'moto-table';

  const thead = document.createElement('thead');
  const headerRow = document.createElement('tr');
  columns.forEach((col) => {
    const th = document.createElement('th');
    th.textContent = col.label;
    if (col.sortable !== false) {
      th.classList.add('sortable');
      const sortIcon = document.createElement('span');
      sortIcon.className = 'sort-icon';
      sortIcon.innerHTML = DOMPurify.sanitize(
        '<i class="fa-solid fa-sort"></i>',
      );
      th.appendChild(sortIcon);
      th.addEventListener('click', () => {
        if (sortKey === col.key) {
          sortDir = sortDir === 'asc' ? 'desc' : 'asc';
        } else {
          sortKey = col.key;
          sortDir = 'asc';
        }
        applySort();
        render();
      });
    }
    headerRow.appendChild(th);
  });
  thead.appendChild(headerRow);
  table.appendChild(thead);

  const tbody = document.createElement('tbody');
  table.appendChild(tbody);
  wrapper.appendChild(table);
  container.appendChild(wrapper);

  // Pagination
  const pagination = document.createElement('div');
  pagination.className = 'moto-table-pagination';
  container.appendChild(pagination);

  function applyFilter() {
    if (!searchTerm) {
      filtered = [...allData];
    } else {
      filtered = allData.filter((row) =>
        columns.some((col) => {
          const val = row[col.key];
          return val != null && String(val).toLowerCase().includes(searchTerm);
        }),
      );
    }
    if (sortKey) applySort();
  }

  function applySort() {
    if (!sortKey) return;
    filtered.sort((a, b) => {
      const va = a[sortKey] ?? '';
      const vb = b[sortKey] ?? '';
      if (typeof va === 'number' && typeof vb === 'number') {
        return sortDir === 'asc' ? va - vb : vb - va;
      }
      const cmp = String(va).localeCompare(String(vb));
      return sortDir === 'asc' ? cmp : -cmp;
    });
  }

  function render() {
    // Update sort icons
    const ths = thead.querySelectorAll('th');
    columns.forEach((col, i) => {
      const icon = ths[i].querySelector('.sort-icon');
      if (!icon) return;
      if (sortKey === col.key) {
        icon.classList.add('active');
        const arrow = sortDir === 'asc' ? 'fa-sort-up' : 'fa-sort-down';
        icon.innerHTML = DOMPurify.sanitize(
          `<i class="fa-solid ${arrow}"></i>`,
        );
      } else {
        icon.classList.remove('active');
        icon.innerHTML = DOMPurify.sanitize(
          '<i class="fa-solid fa-sort"></i>',
        );
      }
    });

    // Rows
    tbody.innerHTML = '';
    const totalPages = Math.max(1, Math.ceil(filtered.length / pageSize));
    if (currentPage > totalPages) currentPage = totalPages;

    const start = (currentPage - 1) * pageSize;
    const pageData = filtered.slice(start, start + pageSize);

    if (pageData.length === 0) {
      const tr = document.createElement('tr');
      const td = document.createElement('td');
      td.className = 'moto-table-empty';
      td.colSpan = columns.length;
      td.textContent = 'No data found';
      tr.appendChild(td);
      tbody.appendChild(tr);
    } else {
      pageData.forEach((row) => {
        const tr = document.createElement('tr');
        columns.forEach((col) => {
          const td = document.createElement('td');
          if (col.render) {
            const rendered = col.render(row[col.key], row);
            if (typeof rendered === 'string') {
              td.innerHTML = DOMPurify.sanitize(rendered);
            } else if (rendered instanceof HTMLElement) {
              td.appendChild(rendered);
            } else {
              td.textContent = rendered != null ? String(rendered) : '';
            }
          } else {
            td.textContent = row[col.key] != null ? String(row[col.key]) : '';
          }
          tr.appendChild(td);
        });
        tbody.appendChild(tr);
      });
    }

    // Pagination controls
    pagination.innerHTML = '';
    const info = document.createElement('span');
    info.textContent =
      filtered.length > 0
        ? `${start + 1}\u2013${Math.min(start + pageSize, filtered.length)} of ${filtered.length}`
        : '0 results';
    pagination.appendChild(info);

    const buttons = document.createElement('div');
    buttons.className = 'moto-table-page-buttons';

    const prevBtn = document.createElement('button');
    prevBtn.className = 'moto-table-page-btn';
    prevBtn.textContent = '\u2039 Prev';
    prevBtn.disabled = currentPage <= 1;
    prevBtn.addEventListener('click', () => { currentPage--; render(); });
    buttons.appendChild(prevBtn);

    const maxButtons = 5;
    let pageStart = Math.max(1, currentPage - Math.floor(maxButtons / 2));
    let pageEnd = Math.min(totalPages, pageStart + maxButtons - 1);
    if (pageEnd - pageStart + 1 < maxButtons) {
      pageStart = Math.max(1, pageEnd - maxButtons + 1);
    }

    for (let p = pageStart; p <= pageEnd; p++) {
      const btn = document.createElement('button');
      btn.className = `moto-table-page-btn ${p === currentPage ? 'active' : ''}`;
      btn.textContent = String(p);
      btn.addEventListener('click', () => { currentPage = p; render(); });
      buttons.appendChild(btn);
    }

    const nextBtn = document.createElement('button');
    nextBtn.className = 'moto-table-page-btn';
    nextBtn.textContent = 'Next \u203a';
    nextBtn.disabled = currentPage >= totalPages;
    nextBtn.addEventListener('click', () => { currentPage++; render(); });
    buttons.appendChild(nextBtn);

    pagination.appendChild(buttons);
  }

  function setData(data) {
    allData = data || [];
    currentPage = 1;
    applyFilter();
    render();
  }

  function refresh() {
    applyFilter();
    render();
  }

  // Initial render
  render();

  return { element: container, setData, refresh };
}
