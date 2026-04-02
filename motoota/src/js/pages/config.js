import { showToast } from '../components/toast.js';
import { createConfirmModal } from '../components/modal.js';
import { SERVERS } from '../config/servers.js';
import {
  loadAppConfig, saveAppConfig, resetAppConfig,
  loadDeviceConfig, saveDeviceConfig, resetDeviceConfig,
} from '../config/storage.js';
import { sanitizeInput } from '../utils/validators.js';

function injectConfigStyles() {
  if (document.getElementById('page-config-styles')) return;
  const style = document.createElement('style');
  style.id = 'page-config-styles';
  style.textContent = `
    .config-sections {
      display: grid;
      grid-template-columns: repeat(auto-fit, minmax(400px, 1fr));
      gap: var(--space-6, 24px);
      margin-bottom: var(--space-6, 24px);
    }

    @media (max-width: 767px) {
      .config-sections { grid-template-columns: 1fr; }
    }

    .config-section {
      background: var(--color-card, #1a2235);
      border: 1px solid var(--color-border, #2a3450);
      border-radius: var(--radius-lg, 12px);
      padding: var(--space-6, 24px);
    }

    .config-section-title {
      font-size: var(--font-size-lg, 1.125rem);
      font-weight: 600;
      color: var(--color-text, #fff);
      margin-bottom: var(--space-4, 16px);
      display: flex;
      align-items: center;
      gap: var(--space-2, 8px);
    }

    .config-section-title i {
      color: var(--color-cyan, #00d4ff);
    }

    .config-form {
      display: flex;
      flex-direction: column;
      gap: var(--space-4, 16px);
    }

    .config-form .input-group {
      margin-bottom: 0;
    }

    .config-toggle {
      display: flex;
      align-items: center;
      justify-content: space-between;
      gap: var(--space-3, 12px);
    }

    .config-toggle-label {
      font-size: var(--font-size-sm, 0.875rem);
      color: var(--color-text-muted, #94a3b8);
    }

    .config-switch {
      position: relative;
      width: 44px;
      height: 24px;
      flex-shrink: 0;
    }

    .config-switch input {
      opacity: 0;
      width: 0;
      height: 0;
    }

    .config-switch-slider {
      position: absolute;
      inset: 0;
      background: var(--color-border, #2a3450);
      border-radius: var(--radius-full, 9999px);
      cursor: pointer;
      transition: background var(--transition-fast, 150ms ease);
    }

    .config-switch-slider::before {
      content: '';
      position: absolute;
      width: 18px;
      height: 18px;
      left: 3px;
      bottom: 3px;
      background: var(--color-text, #fff);
      border-radius: 50%;
      transition: transform var(--transition-fast, 150ms ease);
    }

    .config-switch input:checked + .config-switch-slider {
      background: var(--color-cyan, #00d4ff);
    }

    .config-switch input:checked + .config-switch-slider::before {
      transform: translateX(20px);
    }

    .config-actions {
      display: flex;
      gap: var(--space-3, 12px);
      flex-wrap: wrap;
    }

    .config-json-section {
      margin-top: var(--space-6, 24px);
    }

    .config-json-title {
      font-size: var(--font-size-sm, 0.875rem);
      color: var(--color-text-muted, #94a3b8);
      margin-bottom: var(--space-2, 8px);
      display: flex;
      align-items: center;
      gap: var(--space-2, 8px);
      cursor: pointer;
      user-select: none;
    }

    .config-json-title:hover { color: var(--color-text, #fff); }

    .config-json-content { display: none; }
    .config-json-content.open { display: block; }
  `;
  document.head.appendChild(style);
}

function createFormField(labelText, element) {
  const group = document.createElement('div');
  group.className = 'input-group';
  const label = document.createElement('label');
  label.textContent = labelText;
  group.appendChild(label);
  group.appendChild(element);
  return group;
}

function createToggle(labelText, checked) {
  const wrap = document.createElement('div');
  wrap.className = 'config-toggle';

  const label = document.createElement('span');
  label.className = 'config-toggle-label';
  label.textContent = labelText;

  const sw = document.createElement('label');
  sw.className = 'config-switch';
  const input = document.createElement('input');
  input.type = 'checkbox';
  input.checked = checked;
  const slider = document.createElement('span');
  slider.className = 'config-switch-slider';
  sw.appendChild(input);
  sw.appendChild(slider);

  wrap.appendChild(label);
  wrap.appendChild(sw);

  return { element: wrap, input };
}

export function render(container) {
  injectConfigStyles();
  container.innerHTML = '';

  const page = document.createElement('div');
  page.className = 'container';

  const header = document.createElement('div');
  header.className = 'section-header';
  header.innerHTML = '<h2 class="section-title"><i class="fa-solid fa-gear" style="color:var(--color-cyan)"></i> Configuration</h2>';
  page.appendChild(header);

  const desc = document.createElement('p');
  desc.textContent = 'Configure application and device settings. Changes are persisted to localStorage.';
  page.appendChild(desc);

  const appConfig = loadAppConfig();
  const deviceConfig = loadDeviceConfig();

  const sections = document.createElement('div');
  sections.className = 'config-sections';

  // ── App Config Section ──
  const appSection = document.createElement('div');
  appSection.className = 'config-section';

  const appTitle = document.createElement('h3');
  appTitle.className = 'config-section-title';
  appTitle.innerHTML = '<i class="fa-solid fa-sliders"></i> App Config';
  appSection.appendChild(appTitle);

  const appForm = document.createElement('div');
  appForm.className = 'config-form';

  // Server
  const serverSelect = document.createElement('select');
  serverSelect.className = 'select';
  SERVERS.forEach(s => {
    const opt = document.createElement('option');
    opt.value = s.id;
    opt.textContent = `${s.name} (${s.region})`;
    serverSelect.appendChild(opt);
  });
  serverSelect.value = appConfig.server;
  appForm.appendChild(createFormField('Server', serverSelect));

  // Region
  const regionInput = document.createElement('input');
  regionInput.type = 'text';
  regionInput.className = 'input';
  regionInput.value = appConfig.region;
  regionInput.placeholder = 'e.g. Global';
  appForm.appendChild(createFormField('Region', regionInput));

  // Timeout
  const timeoutInput = document.createElement('input');
  timeoutInput.type = 'number';
  timeoutInput.className = 'input';
  timeoutInput.value = appConfig.timeout;
  timeoutInput.min = '1';
  timeoutInput.max = '120';
  appForm.appendChild(createFormField('Timeout (seconds)', timeoutInput));

  // Max Retries
  const retriesInput = document.createElement('input');
  retriesInput.type = 'number';
  retriesInput.className = 'input';
  retriesInput.value = appConfig.maxRetries;
  retriesInput.min = '0';
  retriesInput.max = '10';
  appForm.appendChild(createFormField('Max Retries', retriesInput));

  // Verify MD5
  const md5Toggle = createToggle('Verify MD5 Checksums', appConfig.verifyMd5);
  appForm.appendChild(md5Toggle.element);

  appSection.appendChild(appForm);
  sections.appendChild(appSection);

  // ── Device Config Section ──
  const deviceSection = document.createElement('div');
  deviceSection.className = 'config-section';

  const deviceTitle = document.createElement('h3');
  deviceTitle.className = 'config-section-title';
  deviceTitle.innerHTML = '<i class="fa-solid fa-mobile-screen"></i> Device Config';
  deviceSection.appendChild(deviceTitle);

  const deviceForm = document.createElement('div');
  deviceForm.className = 'config-form';

  // GUID
  const guidInput = document.createElement('input');
  guidInput.type = 'text';
  guidInput.className = 'input';
  guidInput.value = deviceConfig.guid;
  guidInput.placeholder = 'Device firmware GUID';
  deviceForm.appendChild(createFormField('GUID', guidInput));

  // Carrier
  const carrierInput = document.createElement('input');
  carrierInput.type = 'text';
  carrierInput.className = 'input';
  carrierInput.value = deviceConfig.carrier;
  carrierInput.placeholder = 'Carrier code (e.g. retla)';
  deviceForm.appendChild(createFormField('Carrier', carrierInput));

  // Context
  const contextSelect = document.createElement('select');
  contextSelect.className = 'select';
  ['ota', 'fota', 'modem'].forEach(c => {
    const opt = document.createElement('option');
    opt.value = c;
    opt.textContent = c.toUpperCase();
    contextSelect.appendChild(opt);
  });
  contextSelect.value = deviceConfig.context;
  deviceForm.appendChild(createFormField('Context', contextSelect));

  // Triggered By
  const triggeredBySelect = document.createElement('select');
  triggeredBySelect.className = 'select';
  ['user', 'system', 'scheduled'].forEach(t => {
    const opt = document.createElement('option');
    opt.value = t;
    opt.textContent = t.charAt(0).toUpperCase() + t.slice(1);
    triggeredBySelect.appendChild(opt);
  });
  triggeredBySelect.value = deviceConfig.triggeredBy;
  deviceForm.appendChild(createFormField('Triggered By', triggeredBySelect));

  // Model
  const modelInput = document.createElement('input');
  modelInput.type = 'text';
  modelInput.className = 'input';
  modelInput.value = deviceConfig.model;
  modelInput.placeholder = 'Device model (optional)';
  deviceForm.appendChild(createFormField('Model', modelInput));

  // Serial
  const serialInput = document.createElement('input');
  serialInput.type = 'text';
  serialInput.className = 'input';
  serialInput.value = deviceConfig.serial;
  serialInput.placeholder = 'Serial number (optional)';
  deviceForm.appendChild(createFormField('Serial', serialInput));

  deviceSection.appendChild(deviceForm);
  sections.appendChild(deviceSection);

  page.appendChild(sections);

  // Actions
  const actions = document.createElement('div');
  actions.className = 'config-actions section';

  const saveBtn = document.createElement('button');
  saveBtn.className = 'btn btn-primary';
  saveBtn.innerHTML = '<i class="fa-solid fa-floppy-disk"></i> Save All';

  const resetBtn = document.createElement('button');
  resetBtn.className = 'btn btn-danger';
  resetBtn.innerHTML = '<i class="fa-solid fa-rotate-left"></i> Reset to Defaults';

  actions.appendChild(saveBtn);
  actions.appendChild(resetBtn);
  page.appendChild(actions);

  // Current config JSON
  const jsonSection = document.createElement('div');
  jsonSection.className = 'config-json-section';

  const jsonTitle = document.createElement('div');
  jsonTitle.className = 'config-json-title';
  jsonTitle.innerHTML = '<i class="fa-solid fa-code"></i> Current Configuration (JSON)';

  const jsonContent = document.createElement('div');
  jsonContent.className = 'config-json-content';

  function refreshJSON() {
    jsonContent.innerHTML = '';
    const pre = document.createElement('pre');
    const code = document.createElement('code');
    code.textContent = JSON.stringify({ app: loadAppConfig(), device: loadDeviceConfig() }, null, 2);
    pre.appendChild(code);
    jsonContent.appendChild(pre);
  }
  refreshJSON();

  jsonTitle.addEventListener('click', () => jsonContent.classList.toggle('open'));
  jsonSection.appendChild(jsonTitle);
  jsonSection.appendChild(jsonContent);
  page.appendChild(jsonSection);

  // Save handler
  saveBtn.addEventListener('click', () => {
    saveAppConfig({
      server: serverSelect.value,
      region: sanitizeInput(regionInput.value.trim()),
      timeout: parseInt(timeoutInput.value, 10) || 30,
      maxRetries: parseInt(retriesInput.value, 10) || 3,
      verifyMd5: md5Toggle.input.checked,
    });

    saveDeviceConfig({
      guid: sanitizeInput(guidInput.value.trim()),
      carrier: sanitizeInput(carrierInput.value.trim()),
      context: contextSelect.value,
      triggeredBy: triggeredBySelect.value,
      model: sanitizeInput(modelInput.value.trim()),
      serial: sanitizeInput(serialInput.value.trim()),
    });

    refreshJSON();
    showToast('Configuration saved!', 'success');
  });

  // Reset handler
  resetBtn.addEventListener('click', () => {
    createConfirmModal(
      'Reset Configuration',
      'Are you sure you want to reset all settings to their defaults? This cannot be undone.',
      () => {
        resetAppConfig();
        resetDeviceConfig();
        showToast('Configuration reset to defaults.', 'info');
        render(container);
      },
    );
  });

  container.appendChild(page);
}
