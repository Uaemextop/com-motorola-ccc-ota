import { createStatusCard } from '../components/card.js';
import { createSpinner } from '../components/spinner.js';
import { showToast } from '../components/toast.js';
import { checkUpdate } from '../api/client.js';
import { classifyCarrierStatus, formatUpdateInfo } from '../api/response.js';
import { CARRIERS, searchCarriers } from '../config/carriers.js';
import { SERVERS } from '../config/servers.js';
import { loadDeviceConfig } from '../config/storage.js';
import { sanitizeInput, isValidGuid } from '../utils/validators.js';
import { formatBytes } from '../utils/formatter.js';

function injectCheckStyles() {
  if (document.getElementById('page-check-styles')) return;
  const style = document.createElement('style');
  style.id = 'page-check-styles';
  style.textContent = `
    .check-form {
      display: grid;
      grid-template-columns: 1fr 1fr;
      gap: var(--space-4, 16px);
      margin-bottom: var(--space-6, 24px);
    }

    @media (max-width: 767px) {
      .check-form { grid-template-columns: 1fr; }
    }

    .check-form .input-group { margin-bottom: 0; }

    .check-form-actions {
      grid-column: 1 / -1;
      display: flex;
      gap: var(--space-3, 12px);
      align-items: center;
    }

    .check-results {
      display: flex;
      flex-direction: column;
      gap: var(--space-4, 16px);
    }

    .check-info-grid {
      display: grid;
      grid-template-columns: repeat(auto-fit, minmax(200px, 1fr));
      gap: var(--space-3, 12px);
    }

    .check-info-item {
      background: var(--color-surface, #131a2b);
      border: 1px solid var(--color-border, #2a3450);
      border-radius: var(--radius-md, 8px);
      padding: var(--space-3, 12px);
    }

    .check-info-label {
      font-size: var(--font-size-xs, 0.75rem);
      color: var(--color-text-disabled, #64748b);
      text-transform: uppercase;
      letter-spacing: 0.05em;
      margin-bottom: var(--space-1, 4px);
    }

    .check-info-value {
      font-size: var(--font-size-sm, 0.875rem);
      color: var(--color-text, #fff);
      word-break: break-all;
    }

    .check-urls {
      list-style: none;
      padding: 0;
      margin: 0;
    }

    .check-urls li {
      padding: var(--space-2, 8px) 0;
      border-bottom: 1px solid var(--color-border, #2a3450);
    }

    .check-urls li:last-child { border-bottom: none; }

    .check-urls a {
      font-size: var(--font-size-sm, 0.875rem);
      word-break: break-all;
    }

    .check-raw-toggle {
      display: flex;
      align-items: center;
      gap: var(--space-2, 8px);
      cursor: pointer;
      font-size: var(--font-size-sm, 0.875rem);
      color: var(--color-text-muted, #94a3b8);
      user-select: none;
      padding: var(--space-2, 8px) 0;
    }

    .check-raw-toggle:hover { color: var(--color-text, #fff); }

    .check-raw-content {
      display: none;
    }

    .check-raw-content.open {
      display: block;
    }

    .check-spinner-wrap {
      display: flex;
      align-items: center;
      justify-content: center;
      gap: var(--space-3, 12px);
      padding: var(--space-8, 32px);
      color: var(--color-text-muted, #94a3b8);
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

function createFormField(labelText, element, hint) {
  const group = document.createElement('div');
  group.className = 'input-group';
  const label = document.createElement('label');
  label.textContent = labelText;
  group.appendChild(label);
  if (hint) {
    const hintEl = document.createElement('div');
    hintEl.className = 'input-hint';
    hintEl.innerHTML = hint;
    group.appendChild(hintEl);
  }
  group.appendChild(element);
  return group;
}

function createCarrierInput() {
  const wrap = document.createElement('div');
  wrap.className = 'carrier-search-wrap';

  const input = document.createElement('input');
  input.type = 'text';
  input.className = 'input';
  input.placeholder = 'Search carriers (e.g. retla, T-Mobile)…';
  input.autocomplete = 'off';

  const dropdown = document.createElement('div');
  dropdown.className = 'carrier-dropdown';

  let selectedCode = '';

  function populateDropdown(query) {
    dropdown.innerHTML = '';
    const results = query ? searchCarriers(query).slice(0, 50) : CARRIERS.slice(0, 50);
    if (results.length === 0) {
      const empty = document.createElement('div');
      empty.className = 'carrier-dropdown-item';
      empty.textContent = 'No carriers found';
      dropdown.appendChild(empty);
    } else {
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

function renderStatusBadge(status) {
  const map = {
    open: { label: 'Update Available', status: 'success' },
    whitelisted: { label: 'Whitelisted', status: 'warning' },
    'no-content': { label: 'No Content', status: 'error' },
  };
  const info = map[status] || map['no-content'];
  return createStatusCard(info.label, '', info.status);
}

function renderUpdateDetails(response) {
  const frag = document.createDocumentFragment();
  const updateInfo = formatUpdateInfo(response);

  if (updateInfo) {
    const grid = document.createElement('div');
    grid.className = 'check-info-grid';
    const fields = [
      { label: 'Source Version', value: response.content.sourceVersion || 'N/A' },
      { label: 'Target Version', value: response.content.targetVersion || 'N/A' },
      { label: 'Size', value: formatBytes(response.content.sizeBytes) },
      { label: 'Update Type', value: response.content.updateType || 'N/A' },
      { label: 'MD5', value: response.content.md5 || 'N/A' },
      { label: 'Package ID', value: response.content.packageId || 'N/A' },
    ];
    fields.forEach(({ label, value }) => {
      const item = document.createElement('div');
      item.className = 'check-info-item';
      item.innerHTML = `
        <div class="check-info-label">${label}</div>
        <div class="check-info-value">${value}</div>
      `;
      grid.appendChild(item);
    });
    frag.appendChild(grid);
  }

  // Download URLs
  if (response.downloadUrls && response.downloadUrls.length) {
    const urlCard = createStatusCard('Download URLs', '', 'info');
    const ul = document.createElement('ul');
    ul.className = 'check-urls';
    response.downloadUrls.forEach(url => {
      const li = document.createElement('li');
      const a = document.createElement('a');
      a.href = url;
      a.target = '_blank';
      a.rel = 'noopener noreferrer';
      a.textContent = url;
      li.appendChild(a);
      ul.appendChild(li);
    });
    urlCard.appendChild(ul);
    frag.appendChild(urlCard);
  }

  return frag;
}

function renderRawJSON(data) {
  const wrap = document.createElement('div');
  const toggle = document.createElement('div');
  toggle.className = 'check-raw-toggle';
  toggle.innerHTML = '<i class="fa-solid fa-code"></i> Raw JSON Response';
  const content = document.createElement('div');
  content.className = 'check-raw-content';
  const pre = document.createElement('pre');
  const code = document.createElement('code');
  code.textContent = JSON.stringify(data, null, 2);
  pre.appendChild(code);
  content.appendChild(pre);
  toggle.addEventListener('click', () => content.classList.toggle('open'));
  wrap.appendChild(toggle);
  wrap.appendChild(content);
  return wrap;
}

export function render(container) {
  injectCheckStyles();
  container.innerHTML = '';

  const page = document.createElement('div');
  page.className = 'container';

  // Title
  const header = document.createElement('div');
  header.className = 'section-header';
  header.innerHTML = '<h2 class="section-title"><i class="fa-solid fa-magnifying-glass" style="color:var(--color-cyan)"></i> Verificar Actualización</h2>';
  page.appendChild(header);

  const desc = document.createElement('p');
  desc.textContent = 'Consulta el servidor CDS de Motorola para verificar si hay una actualización OTA disponible para un GUID y carrier específicos.';
  page.appendChild(desc);

  const deviceConfig = loadDeviceConfig();

  // Form
  const form = document.createElement('div');
  form.className = 'check-form';

  // GUID
  const guidInput = document.createElement('input');
  guidInput.type = 'text';
  guidInput.className = 'input';
  guidInput.placeholder = 'e.g. a1b2c3d4e5f6a7b8c9d0e1f2a3b4c5d6e7f8a9b0';
  guidInput.value = deviceConfig.guid || '';
  form.appendChild(createFormField('Device GUID', guidInput,
    'Obtén el GUID con: <code>adb shell getprop ro.mot.build.guid</code> — es un hash hexadecimal de 15+ caracteres del firmware actual.'));

  // Carrier
  const carrierInput = createCarrierInput();
  form.appendChild(createFormField('Carrier', carrierInput.element,
    'Código del operador. Usa <code>adb shell getprop ro.carrier</code>. Para desbloqueados: retus (USA), retla (LATAM), reteu (Europa).'));

  // Server
  const serverSelect = document.createElement('select');
  serverSelect.className = 'select';
  SERVERS.forEach(s => {
    const opt = document.createElement('option');
    opt.value = s.id;
    opt.textContent = `${s.name} (${s.host})`;
    if (s.status !== 'active') opt.textContent += ' [inactive]';
    serverSelect.appendChild(opt);
  });
  form.appendChild(createFormField('Server', serverSelect,
    'Servidor CDS de Motorola. Usa Production Global para la mayoría de dispositivos.'));

  // Context
  const contextSelect = document.createElement('select');
  contextSelect.className = 'select';
  CONTEXTS.forEach(c => {
    const opt = document.createElement('option');
    opt.value = c.value;
    opt.textContent = c.label;
    contextSelect.appendChild(opt);
  });
  contextSelect.value = deviceConfig.context || 'ota';
  form.appendChild(createFormField('Context', contextSelect,
    'OTA = sistema operativo, FOTA = firmware de radio, Modem = actualizaciones del módem.'));

  // Actions
  const actions = document.createElement('div');
  actions.className = 'check-form-actions';
  const checkBtn = document.createElement('button');
  checkBtn.className = 'btn btn-primary btn-lg';
  checkBtn.innerHTML = '<i class="fa-solid fa-magnifying-glass"></i> Verificar Actualización';
  actions.appendChild(checkBtn);
  form.appendChild(actions);

  page.appendChild(form);

  // Results area
  const results = document.createElement('div');
  results.className = 'check-results';
  page.appendChild(results);

  // Check handler
  checkBtn.addEventListener('click', async () => {
    const guid = sanitizeInput(guidInput.value.trim());
    const carrier = carrierInput.getCode();

    if (!guid) {
      showToast('Por favor, ingresa el GUID del dispositivo.', 'warning');
      guidInput.classList.add('input-error');
      return;
    }
    guidInput.classList.remove('input-error');

    if (!isValidGuid(guid)) {
      showToast('GUID inválido. Debe ser una cadena hexadecimal de al menos 15 caracteres.', 'error');
      guidInput.classList.add('input-error');
      return;
    }
    guidInput.classList.remove('input-error');

    if (!carrier) {
      showToast('Por favor, selecciona un carrier.', 'warning');
      return;
    }

    results.innerHTML = '';
    const spinnerWrap = document.createElement('div');
    spinnerWrap.className = 'check-spinner-wrap';
    spinnerWrap.appendChild(createSpinner('lg'));
    const msg = document.createElement('span');
    msg.textContent = 'Buscando actualizaciones…';
    spinnerWrap.appendChild(msg);
    results.appendChild(spinnerWrap);
    checkBtn.disabled = true;

    try {
      const server = SERVERS.find(s => s.id === serverSelect.value);
      const response = await checkUpdate(guid, carrier, {
        host: server?.host,
        context: contextSelect.value,
      });

      results.innerHTML = '';
      const status = classifyCarrierStatus(response);
      results.appendChild(renderStatusBadge(status));

      if (response.hasUpdate && response.content) {
        results.appendChild(renderUpdateDetails(response));
      }

      results.appendChild(renderRawJSON(response.raw));
      showToast('¡Verificación completada!', 'success');
    } catch (err) {
      results.innerHTML = '';
      results.appendChild(createStatusCard('Error', `<p>${err.message || 'Request failed'}</p>`, 'error'));
      showToast(`Error: ${err.message || 'Request failed'}`, 'error');
    } finally {
      checkBtn.disabled = false;
    }
  });

  container.appendChild(page);
}
