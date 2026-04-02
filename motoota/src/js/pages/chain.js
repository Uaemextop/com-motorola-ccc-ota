import { createStatusCard } from '../components/card.js';
import { createSpinner } from '../components/spinner.js';
import { createProgressBar } from '../components/progress.js';
import { showToast } from '../components/toast.js';
import { walkChain } from '../api/client.js';
import { CARRIERS, searchCarriers } from '../config/carriers.js';
import { SERVERS } from '../config/servers.js';
import { loadDeviceConfig } from '../config/storage.js';
import { sanitizeInput, isValidGuid } from '../utils/validators.js';
import { formatBytes } from '../utils/formatter.js';

function injectChainStyles() {
  if (document.getElementById('page-chain-styles')) return;
  const style = document.createElement('style');
  style.id = 'page-chain-styles';
  style.textContent = `
    .chain-form {
      display: grid;
      grid-template-columns: 1fr 1fr;
      gap: var(--space-4, 16px);
      margin-bottom: var(--space-6, 24px);
    }

    @media (max-width: 767px) {
      .chain-form { grid-template-columns: 1fr; }
    }

    .chain-form .input-group { margin-bottom: 0; }

    .chain-form-actions {
      grid-column: 1 / -1;
      display: flex;
      gap: var(--space-3, 12px);
      align-items: center;
    }

    .chain-summary {
      display: flex;
      flex-wrap: wrap;
      gap: var(--space-4, 16px);
      margin-bottom: var(--space-4, 16px);
      padding: var(--space-4, 16px);
      background: var(--color-card, #1a2235);
      border: 1px solid var(--color-border, #2a3450);
      border-radius: var(--radius-lg, 12px);
    }

    .chain-summary-item {
      text-align: center;
      min-width: 100px;
    }

    .chain-summary-value {
      font-size: var(--font-size-2xl, 1.5rem);
      font-weight: 700;
      color: var(--color-text, #fff);
    }

    .chain-summary-label {
      font-size: var(--font-size-xs, 0.75rem);
      color: var(--color-text-muted, #94a3b8);
      text-transform: uppercase;
      letter-spacing: 0.05em;
    }

    .chain-timeline {
      position: relative;
      padding-left: var(--space-8, 32px);
    }

    .chain-timeline::before {
      content: '';
      position: absolute;
      left: 14px;
      top: 0;
      bottom: 0;
      width: 2px;
      background: var(--color-border, #2a3450);
    }

    .chain-step {
      position: relative;
      margin-bottom: var(--space-4, 16px);
      padding: var(--space-4, 16px);
      background: var(--color-card, #1a2235);
      border: 1px solid var(--color-border, #2a3450);
      border-radius: var(--radius-lg, 12px);
      transition: border-color var(--transition-base, 250ms ease);
    }

    .chain-step:hover {
      border-color: var(--color-cyan, #00d4ff);
    }

    .chain-step-number {
      position: absolute;
      left: -30px;
      top: 16px;
      width: 24px;
      height: 24px;
      border-radius: 50%;
      background: var(--color-cyan, #00d4ff);
      color: #0a0e17;
      font-weight: 700;
      font-size: var(--font-size-xs, 0.75rem);
      display: flex;
      align-items: center;
      justify-content: center;
    }

    .chain-step-header {
      display: flex;
      align-items: center;
      justify-content: space-between;
      flex-wrap: wrap;
      gap: var(--space-2, 8px);
      margin-bottom: var(--space-2, 8px);
    }

    .chain-step-versions {
      font-size: var(--font-size-sm, 0.875rem);
      color: var(--color-text, #fff);
      font-weight: 500;
    }

    .chain-step-arrow {
      color: var(--color-cyan, #00d4ff);
      margin: 0 var(--space-2, 8px);
    }

    .chain-step-meta {
      display: flex;
      gap: var(--space-4, 16px);
      font-size: var(--font-size-xs, 0.75rem);
      color: var(--color-text-muted, #94a3b8);
    }

    .chain-step-raw {
      margin-top: var(--space-3, 12px);
    }

    .chain-step-raw-toggle {
      font-size: var(--font-size-xs, 0.75rem);
      color: var(--color-text-disabled, #64748b);
      cursor: pointer;
      user-select: none;
    }

    .chain-step-raw-toggle:hover { color: var(--color-text-muted, #94a3b8); }

    .chain-step-raw-content {
      display: none;
      margin-top: var(--space-2, 8px);
    }

    .chain-step-raw-content.open { display: block; }

    .chain-spinner-wrap {
      display: flex;
      flex-direction: column;
      align-items: center;
      gap: var(--space-4, 16px);
      padding: var(--space-8, 32px);
    }

    .chain-spinner-text {
      color: var(--color-text-muted, #94a3b8);
      font-size: var(--font-size-sm, 0.875rem);
    }

    .carrier-search-wrap {
      position: relative;
    }

    .carrier-dropdown {
      position: absolute;
      top: 100%;
      left: 0;
      right: 0;
      max-height: 200px;
      overflow-y: auto;
      background: var(--color-surface, #131a2b);
      border: 1px solid var(--color-border, #2a3450);
      border-top: none;
      border-radius: 0 0 var(--radius-md, 8px) var(--radius-md, 8px);
      z-index: var(--z-dropdown, 100);
      display: none;
    }

    .carrier-dropdown.open { display: block; }

    .carrier-dropdown-item {
      padding: var(--space-2, 8px) var(--space-3, 12px);
      font-size: var(--font-size-sm, 0.875rem);
      color: var(--color-text-muted, #94a3b8);
      cursor: pointer;
      transition: background var(--transition-fast, 150ms ease);
    }

    .carrier-dropdown-item:hover {
      background: rgba(0, 212, 255, 0.08);
      color: var(--color-text, #fff);
    }

    .carrier-dropdown-item .carrier-code {
      color: var(--color-cyan, #00d4ff);
      font-weight: 600;
      margin-right: var(--space-2, 8px);
    }

    .carrier-dropdown-item .carrier-region {
      float: right;
      font-size: var(--font-size-xs, 0.75rem);
      color: var(--color-text-disabled, #64748b);
    }
  `;
  document.head.appendChild(style);
}

const CONTEXTS = [
  { value: 'ota', label: 'OTA (System)' },
  { value: 'fota', label: 'FOTA (Firmware)' },
  { value: 'modem', label: 'Modem' },
];

function createFormField(labelText, element) {
  const group = document.createElement('div');
  group.className = 'input-group';
  const label = document.createElement('label');
  label.textContent = labelText;
  group.appendChild(label);
  group.appendChild(element);
  return group;
}

function createCarrierInput() {
  const wrap = document.createElement('div');
  wrap.className = 'carrier-search-wrap';

  const input = document.createElement('input');
  input.type = 'text';
  input.className = 'input';
  input.placeholder = 'Search carriers…';
  input.autocomplete = 'off';

  const dropdown = document.createElement('div');
  dropdown.className = 'carrier-dropdown';

  let selectedCode = '';

  function populateDropdown(query) {
    dropdown.innerHTML = '';
    const results = query ? searchCarriers(query).slice(0, 50) : CARRIERS.slice(0, 50);
    results.forEach(c => {
      const item = document.createElement('div');
      item.className = 'carrier-dropdown-item';
      item.innerHTML = `<span class="carrier-code">${c.code}</span>${c.name}<span class="carrier-region">${c.region}</span>`;
      item.addEventListener('click', () => {
        selectedCode = c.code;
        input.value = `${c.code} — ${c.name}`;
        dropdown.classList.remove('open');
      });
      dropdown.appendChild(item);
    });
  }

  input.addEventListener('focus', () => {
    populateDropdown(input.value.split('—')[0].trim());
    dropdown.classList.add('open');
  });

  input.addEventListener('input', () => {
    selectedCode = '';
    populateDropdown(sanitizeInput(input.value));
    dropdown.classList.add('open');
  });

  document.addEventListener('click', (e) => {
    if (!wrap.contains(e.target)) dropdown.classList.remove('open');
  });

  wrap.appendChild(input);
  wrap.appendChild(dropdown);

  return { element: wrap, getCode: () => selectedCode || sanitizeInput(input.value.split('—')[0].trim()) };
}

export function render(container) {
  injectChainStyles();
  container.innerHTML = '';

  const page = document.createElement('div');
  page.className = 'container';

  const header = document.createElement('div');
  header.className = 'section-header';
  header.innerHTML = '<h2 class="section-title"><i class="fa-solid fa-link" style="color:var(--color-cyan)"></i> Walk Update Chain</h2>';
  page.appendChild(header);

  const desc = document.createElement('p');
  desc.textContent = 'Discover the full OTA update chain from a given firmware GUID. Each step represents one incremental update in the chain.';
  page.appendChild(desc);

  const deviceConfig = loadDeviceConfig();

  // Form
  const form = document.createElement('div');
  form.className = 'chain-form';

  const guidInput = document.createElement('input');
  guidInput.type = 'text';
  guidInput.className = 'input';
  guidInput.placeholder = 'Device firmware GUID (hex string)';
  guidInput.value = deviceConfig.guid || '';
  form.appendChild(createFormField('Device GUID', guidInput));

  const carrierInput = createCarrierInput();
  form.appendChild(createFormField('Carrier', carrierInput.element));

  const serverSelect = document.createElement('select');
  serverSelect.className = 'select';
  SERVERS.forEach(s => {
    const opt = document.createElement('option');
    opt.value = s.id;
    opt.textContent = `${s.name} (${s.host})`;
    if (s.status !== 'active') opt.textContent += ' [inactive]';
    serverSelect.appendChild(opt);
  });
  form.appendChild(createFormField('Server', serverSelect));

  const contextSelect = document.createElement('select');
  contextSelect.className = 'select';
  CONTEXTS.forEach(c => {
    const opt = document.createElement('option');
    opt.value = c.value;
    opt.textContent = c.label;
    contextSelect.appendChild(opt);
  });
  contextSelect.value = deviceConfig.context || 'ota';
  form.appendChild(createFormField('Context', contextSelect));

  const actions = document.createElement('div');
  actions.className = 'chain-form-actions';
  const walkBtn = document.createElement('button');
  walkBtn.className = 'btn btn-primary btn-lg';
  walkBtn.innerHTML = '<i class="fa-solid fa-link"></i> Walk Chain';
  actions.appendChild(walkBtn);
  form.appendChild(actions);

  page.appendChild(form);

  const results = document.createElement('div');
  results.className = 'check-results';
  page.appendChild(results);

  walkBtn.addEventListener('click', async () => {
    const guid = sanitizeInput(guidInput.value.trim());
    const carrier = carrierInput.getCode();

    if (!guid || !isValidGuid(guid)) {
      showToast('Please enter a valid device GUID (hex, 15+ chars).', 'warning');
      guidInput.classList.add('input-error');
      return;
    }
    guidInput.classList.remove('input-error');

    if (!carrier) {
      showToast('Please select a carrier.', 'warning');
      return;
    }

    results.innerHTML = '';
    const spinnerWrap = document.createElement('div');
    spinnerWrap.className = 'chain-spinner-wrap';

    const progressBar = createProgressBar({ label: 'Walking chain…', indeterminate: true, size: 'lg' });
    spinnerWrap.appendChild(progressBar.element);

    const spinText = document.createElement('div');
    spinText.className = 'chain-spinner-text';
    spinText.textContent = 'Discovering update chain…';
    spinnerWrap.appendChild(spinText);
    results.appendChild(spinnerWrap);
    walkBtn.disabled = true;

    try {
      const server = SERVERS.find(s => s.id === serverSelect.value);
      const chain = await walkChain(guid, carrier, {
        host: server?.host,
        context: contextSelect.value,
      });

      results.innerHTML = '';

      if (chain.length === 0) {
        results.appendChild(createStatusCard('No Updates', '<p>No update chain found for this GUID and carrier combination.</p>', 'info'));
        showToast('No updates found in chain.', 'info');
        return;
      }

      // Summary
      const totalBytes = chain.reduce((sum, r) => sum + (r.content?.sizeBytes || 0), 0);
      const summary = document.createElement('div');
      summary.className = 'chain-summary';
      const summaryItems = [
        { value: chain.length, label: 'Steps' },
        { value: formatBytes(totalBytes), label: 'Total Size' },
        { value: chain[0]?.content?.sourceVersion || 'N/A', label: 'Start Version' },
        { value: chain[chain.length - 1]?.content?.targetVersion || 'N/A', label: 'End Version' },
      ];
      summaryItems.forEach(({ value, label }) => {
        const item = document.createElement('div');
        item.className = 'chain-summary-item';
        item.innerHTML = `<div class="chain-summary-value">${value}</div><div class="chain-summary-label">${label}</div>`;
        summary.appendChild(item);
      });
      results.appendChild(summary);

      // Timeline
      const timeline = document.createElement('div');
      timeline.className = 'chain-timeline';

      chain.forEach((response, i) => {
        const step = document.createElement('div');
        step.className = 'chain-step';

        const num = document.createElement('div');
        num.className = 'chain-step-number';
        num.textContent = String(i + 1);
        step.appendChild(num);

        const stepHeader = document.createElement('div');
        stepHeader.className = 'chain-step-header';

        const versions = document.createElement('div');
        versions.className = 'chain-step-versions';
        const src = response.content?.sourceVersion || 'Unknown';
        const tgt = response.content?.targetVersion || 'Unknown';
        versions.innerHTML = `${src}<span class="chain-step-arrow">→</span>${tgt}`;
        stepHeader.appendChild(versions);

        step.appendChild(stepHeader);

        const meta = document.createElement('div');
        meta.className = 'chain-step-meta';
        meta.innerHTML = `
          <span><i class="fa-solid fa-hard-drive"></i> ${formatBytes(response.content?.sizeBytes || 0)}</span>
          <span><i class="fa-solid fa-tag"></i> ${response.content?.updateType || 'N/A'}</span>
          <span><i class="fa-solid fa-fingerprint"></i> ${response.content?.md5 ? response.content.md5.substring(0, 12) + '…' : 'N/A'}</span>
        `;
        step.appendChild(meta);

        // Raw JSON toggle
        const rawWrap = document.createElement('div');
        rawWrap.className = 'chain-step-raw';
        const rawToggle = document.createElement('div');
        rawToggle.className = 'chain-step-raw-toggle';
        rawToggle.innerHTML = '<i class="fa-solid fa-code"></i> Show raw JSON';
        const rawContent = document.createElement('div');
        rawContent.className = 'chain-step-raw-content';
        const pre = document.createElement('pre');
        const code = document.createElement('code');
        code.textContent = JSON.stringify(response.raw, null, 2);
        pre.appendChild(code);
        rawContent.appendChild(pre);
        rawToggle.addEventListener('click', () => rawContent.classList.toggle('open'));
        rawWrap.appendChild(rawToggle);
        rawWrap.appendChild(rawContent);
        step.appendChild(rawWrap);

        timeline.appendChild(step);
      });

      results.appendChild(timeline);
      showToast(`Chain complete: ${chain.length} step(s) found.`, 'success');
    } catch (err) {
      results.innerHTML = '';
      results.appendChild(createStatusCard('Error', `<p>${err.message || 'Chain walk failed'}</p>`, 'error'));
      showToast(`Error: ${err.message || 'Chain walk failed'}`, 'error');
    } finally {
      walkBtn.disabled = false;
    }
  });

  container.appendChild(page);
}
