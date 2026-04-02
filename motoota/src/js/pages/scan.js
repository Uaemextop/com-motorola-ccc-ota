import { createStatusCard } from '../components/card.js';
import { createProgressBar } from '../components/progress.js';
import { createDataTable } from '../components/table.js';
import { showToast } from '../components/toast.js';
import { scanCarriers } from '../api/client.js';
import { CARRIERS, getCarriersByRegion, getAllRegionNames } from '../config/carriers.js';
import { SERVERS } from '../config/servers.js';
import { loadDeviceConfig } from '../config/storage.js';
import { sanitizeInput, isValidGuid } from '../utils/validators.js';
import { formatBytes } from '../utils/formatter.js';
import { groupBy } from '../utils/helpers.js';

function injectScanStyles() {
  if (document.getElementById('page-scan-styles')) return;
  const style = document.createElement('style');
  style.id = 'page-scan-styles';
  style.textContent = `
    .scan-form {
      display: flex;
      flex-wrap: wrap;
      gap: var(--space-4, 16px);
      align-items: flex-end;
      margin-bottom: var(--space-4, 16px);
    }

    .scan-form .input-group {
      flex: 1 1 300px;
      margin-bottom: 0;
    }

    .scan-chips {
      display: flex;
      flex-wrap: wrap;
      gap: var(--space-2, 8px);
      margin-bottom: var(--space-4, 16px);
    }

    .scan-stats {
      display: grid;
      grid-template-columns: repeat(auto-fit, minmax(140px, 1fr));
      gap: var(--space-3, 12px);
      margin-bottom: var(--space-4, 16px);
    }

    .scan-stat {
      text-align: center;
      padding: var(--space-3, 12px);
      background: var(--color-card, #1a2235);
      border: 1px solid var(--color-border, #2a3450);
      border-radius: var(--radius-md, 8px);
    }

    .scan-stat-value {
      font-size: var(--font-size-2xl, 1.5rem);
      font-weight: 700;
      color: var(--color-text, #fff);
    }

    .scan-stat-value.open { color: var(--color-green, #22c55e); }
    .scan-stat-value.whitelisted { color: var(--color-yellow, #eab308); }
    .scan-stat-value.no-content { color: var(--color-text-disabled, #64748b); }
    .scan-stat-value.errors { color: var(--color-red, #ef4444); }

    .scan-stat-label {
      font-size: var(--font-size-xs, 0.75rem);
      color: var(--color-text-muted, #94a3b8);
      text-transform: uppercase;
    }

    .scan-live-results {
      display: grid;
      grid-template-columns: repeat(auto-fit, minmax(300px, 1fr));
      gap: var(--space-4, 16px);
      margin-bottom: var(--space-6, 24px);
    }

    .scan-category {
      background: var(--color-card, #1a2235);
      border: 1px solid var(--color-border, #2a3450);
      border-radius: var(--radius-lg, 12px);
      padding: var(--space-4, 16px);
      max-height: 300px;
      overflow-y: auto;
    }

    .scan-category-title {
      font-size: var(--font-size-sm, 0.875rem);
      font-weight: 600;
      color: var(--color-text, #fff);
      margin-bottom: var(--space-3, 12px);
      display: flex;
      align-items: center;
      gap: var(--space-2, 8px);
    }

    .scan-category-count {
      font-size: var(--font-size-xs, 0.75rem);
      padding: 1px 8px;
      border-radius: var(--radius-full, 9999px);
      font-weight: 600;
    }

    .scan-badge-list {
      display: flex;
      flex-wrap: wrap;
      gap: var(--space-1, 4px);
    }

    .scan-chart-wrap {
      max-width: 320px;
      margin: var(--space-6, 24px) auto;
    }

    .scan-progress-section {
      margin-bottom: var(--space-4, 16px);
    }
  `;
  document.head.appendChild(style);
}

export function render(container) {
  injectScanStyles();
  container.innerHTML = '';

  const page = document.createElement('div');
  page.className = 'container';

  const header = document.createElement('div');
  header.className = 'section-header';
  header.innerHTML = '<h2 class="section-title"><i class="fa-solid fa-radar" style="color:var(--color-cyan)"></i> Carrier Scanner</h2>';
  page.appendChild(header);

  const desc = document.createElement('p');
  desc.textContent = 'Escanea todos los carriers para un GUID dado y descubre cuáles tienen actualizaciones OTA disponibles.';
  page.appendChild(desc);

  const deviceConfig = loadDeviceConfig();

  // Form row
  const formRow = document.createElement('div');
  formRow.className = 'scan-form';

  const guidGroup = document.createElement('div');
  guidGroup.className = 'input-group';
  const guidLabel = document.createElement('label');
  guidLabel.textContent = 'Device GUID';
  const guidHint = document.createElement('div');
  guidHint.className = 'input-hint';
  guidHint.innerHTML = 'GUID de tu firmware. Obtén con: <code>adb shell getprop ro.mot.build.guid</code>';
  const guidInput = document.createElement('input');
  guidInput.type = 'text';
  guidInput.className = 'input';
  guidInput.placeholder = 'GUID hexadecimal del firmware (15+ caracteres)';
  guidInput.value = deviceConfig.guid || '';
  guidGroup.appendChild(guidLabel);
  guidGroup.appendChild(guidHint);
  guidGroup.appendChild(guidInput);
  formRow.appendChild(guidGroup);

  const scanBtn = document.createElement('button');
  scanBtn.className = 'btn btn-primary btn-lg';
  scanBtn.innerHTML = '<i class="fa-solid fa-play"></i> Start Scan';
  formRow.appendChild(scanBtn);

  const stopBtn = document.createElement('button');
  stopBtn.className = 'btn btn-danger btn-lg';
  stopBtn.innerHTML = '<i class="fa-solid fa-stop"></i> Stop';
  stopBtn.style.display = 'none';
  formRow.appendChild(stopBtn);

  page.appendChild(formRow);

  // Region chips
  const chipsWrap = document.createElement('div');
  chipsWrap.className = 'scan-chips';
  let selectedRegion = 'All';

  const regions = ['All', ...getAllRegionNames()];
  regions.forEach(r => {
    const chip = document.createElement('button');
    chip.className = `chip ${r === 'All' ? 'active' : ''}`;
    chip.textContent = r;
    chip.addEventListener('click', () => {
      selectedRegion = r;
      chipsWrap.querySelectorAll('.chip').forEach(c => c.classList.toggle('active', c.textContent === r));
    });
    chipsWrap.appendChild(chip);
  });
  page.appendChild(chipsWrap);

  // Progress
  const progressSection = document.createElement('div');
  progressSection.className = 'scan-progress-section';
  progressSection.style.display = 'none';
  page.appendChild(progressSection);

  // Stats
  const statsGrid = document.createElement('div');
  statsGrid.className = 'scan-stats';
  statsGrid.style.display = 'none';
  page.appendChild(statsGrid);

  // Live results
  const liveResults = document.createElement('div');
  liveResults.className = 'scan-live-results';
  liveResults.style.display = 'none';
  page.appendChild(liveResults);

  // Chart
  const chartWrap = document.createElement('div');
  chartWrap.className = 'scan-chart-wrap';
  chartWrap.style.display = 'none';
  const chartCanvas = document.createElement('canvas');
  chartCanvas.id = 'scan-pie-chart';
  chartWrap.appendChild(chartCanvas);
  page.appendChild(chartWrap);

  // Results table
  const tableSection = document.createElement('div');
  tableSection.className = 'section';
  tableSection.style.display = 'none';
  page.appendChild(tableSection);

  container.appendChild(page);

  // Scan state
  let abortScan = false;
  let chartInstance = null;

  function updateStats(counts) {
    statsGrid.innerHTML = '';
    statsGrid.style.display = '';
    const items = [
      { value: counts.open || 0, label: 'Open', cls: 'open' },
      { value: counts.whitelisted || 0, label: 'Whitelisted', cls: 'whitelisted' },
      { value: counts['no-content'] || 0, label: 'No Content', cls: 'no-content' },
      { value: counts.error || 0, label: 'Errors', cls: 'errors' },
    ];
    items.forEach(({ value, label, cls }) => {
      const stat = document.createElement('div');
      stat.className = 'scan-stat';
      stat.innerHTML = `<div class="scan-stat-value ${cls}">${value}</div><div class="scan-stat-label">${label}</div>`;
      statsGrid.appendChild(stat);
    });
  }

  function createCategoryPanel(title, badgeCls, items) {
    const panel = document.createElement('div');
    panel.className = 'scan-category';

    const titleEl = document.createElement('div');
    titleEl.className = 'scan-category-title';
    titleEl.innerHTML = `${title} <span class="scan-category-count badge ${badgeCls}">${items.length}</span>`;
    panel.appendChild(titleEl);

    const list = document.createElement('div');
    list.className = 'scan-badge-list';
    items.forEach(r => {
      const badge = document.createElement('span');
      badge.className = `badge ${badgeCls}`;
      badge.textContent = r.carrier.code;
      badge.title = r.carrier.name;
      list.appendChild(badge);
    });
    panel.appendChild(list);
    return panel;
  }

  async function renderChart(counts) {
    try {
      const { Chart, PieController, ArcElement, Tooltip, Legend } = await import('chart.js');
      Chart.register(PieController, ArcElement, Tooltip, Legend);

      if (chartInstance) {
        chartInstance.destroy();
        chartInstance = null;
      }

      chartWrap.style.display = '';
      chartInstance = new Chart(chartCanvas, {
        type: 'pie',
        data: {
          labels: ['Open', 'Whitelisted', 'No Content', 'Errors'],
          datasets: [{
            data: [counts.open || 0, counts.whitelisted || 0, counts['no-content'] || 0, counts.error || 0],
            backgroundColor: ['#22c55e', '#eab308', '#64748b', '#ef4444'],
            borderColor: '#1a2235',
            borderWidth: 2,
          }],
        },
        options: {
          responsive: true,
          plugins: {
            legend: {
              position: 'bottom',
              labels: { color: '#94a3b8', font: { size: 12 } },
            },
          },
        },
      });
    } catch {
      // Chart.js not available — skip pie chart
      chartWrap.style.display = 'none';
    }
  }

  stopBtn.addEventListener('click', () => { abortScan = true; });

  scanBtn.addEventListener('click', async () => {
    const guid = sanitizeInput(guidInput.value.trim());

    if (!guid || !isValidGuid(guid)) {
      showToast('Please enter a valid GUID (hex, 15+ chars).', 'warning');
      guidInput.classList.add('input-error');
      return;
    }
    guidInput.classList.remove('input-error');

    const carriersToScan = selectedRegion === 'All'
      ? [...CARRIERS]
      : getCarriersByRegion(selectedRegion);

    if (carriersToScan.length === 0) {
      showToast('No carriers found for the selected region.', 'warning');
      return;
    }

    // Reset state
    abortScan = false;
    scanBtn.style.display = 'none';
    stopBtn.style.display = '';
    progressSection.style.display = '';
    liveResults.style.display = '';
    liveResults.innerHTML = '';
    statsGrid.style.display = 'none';
    tableSection.style.display = 'none';
    chartWrap.style.display = 'none';
    if (chartInstance) { chartInstance.destroy(); chartInstance = null; }

    const progressBar = createProgressBar({
      label: `Scanning 0/${carriersToScan.length}`,
      value: 0,
      max: carriersToScan.length,
      showPercent: true,
      size: 'lg',
    });
    progressSection.innerHTML = '';
    progressSection.appendChild(progressBar.element);

    const counts = { open: 0, whitelisted: 0, 'no-content': 0, error: 0 };
    const allResults = [];

    // Create live category panels
    const openPanel = createCategoryPanel('Open', 'badge-open', []);
    const wlPanel = createCategoryPanel('Whitelisted', 'badge-whitelisted', []);
    const ncPanel = createCategoryPanel('No Content', 'badge-no-content', []);
    liveResults.appendChild(openPanel);
    liveResults.appendChild(wlPanel);
    liveResults.appendChild(ncPanel);

    function appendToPanel(panel, result, badgeCls) {
      const list = panel.querySelector('.scan-badge-list');
      const badge = document.createElement('span');
      badge.className = `badge ${badgeCls}`;
      badge.textContent = result.carrier.code;
      badge.title = result.carrier.name;
      list.appendChild(badge);
      const countEl = panel.querySelector('.scan-category-count');
      const currentCount = list.children.length;
      countEl.textContent = String(currentCount);
    }

    try {
      await scanCarriers(guid, carriersToScan, {
        concurrency: 20,
        onProgress: (completed, total, result) => {
          if (abortScan) return;

          allResults.push(result);
          counts[result.status] = (counts[result.status] || 0) + 1;

          progressBar.setValue(completed);
          const labelEl = progressBar.element.querySelector('.moto-progress-label span:first-child');
          if (labelEl) labelEl.textContent = `Scanning ${completed}/${total}`;

          // Append to live panel
          if (result.status === 'open') appendToPanel(openPanel, result, 'badge-open');
          else if (result.status === 'whitelisted') appendToPanel(wlPanel, result, 'badge-whitelisted');
          else if (result.status === 'no-content') appendToPanel(ncPanel, result, 'badge-no-content');

          updateStats(counts);
        },
      });

      if (abortScan) {
        showToast('Scan stopped.', 'info');
      } else {
        showToast(`Scan complete: ${allResults.length} carriers scanned.`, 'success');
      }

      // Chart
      await renderChart(counts);

      // Results table
      tableSection.style.display = '';
      tableSection.innerHTML = '';

      const tableTitle = document.createElement('h3');
      tableTitle.className = 'section-title';
      tableTitle.textContent = 'Results';
      tableSection.appendChild(tableTitle);

      const table = createDataTable({
        columns: [
          { key: 'code', label: 'Code', sortable: true },
          { key: 'name', label: 'Name', sortable: true },
          { key: 'region', label: 'Region', sortable: true },
          {
            key: 'status', label: 'Status', sortable: true,
            render: (val) => {
              const cls = val === 'open' ? 'badge-open' : val === 'whitelisted' ? 'badge-whitelisted' : val === 'error' ? 'badge-no-content' : 'badge-no-content';
              return `<span class="badge ${cls}">${val}</span>`;
            },
          },
          {
            key: 'size', label: 'Size', sortable: true,
            render: (val) => val ? formatBytes(val) : '—',
          },
        ],
        pageSize: 20,
        searchPlaceholder: 'Filter results…',
      });

      const tableData = allResults.map(r => ({
        code: r.carrier.code,
        name: r.carrier.name,
        region: r.carrier.region,
        status: r.status,
        size: r.response?.content?.sizeBytes || 0,
      }));
      table.setData(tableData);
      tableSection.appendChild(table.element);

    } catch (err) {
      showToast(`Scan error: ${err.message}`, 'error');
    } finally {
      scanBtn.style.display = '';
      stopBtn.style.display = 'none';
    }
  });
}
