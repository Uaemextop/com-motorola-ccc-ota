import { createStatCard } from '../components/card.js';
import { createStatusCard } from '../components/card.js';
import { createSpinner } from '../components/spinner.js';
import { showToast } from '../components/toast.js';
import { checkUpdate } from '../api/client.js';
import { classifyCarrierStatus, formatUpdateInfo } from '../api/response.js';
import { CARRIERS, searchCarriers, getAllRegionNames } from '../config/carriers.js';
import { SERVERS } from '../config/servers.js';
import { loadDeviceConfig, saveDeviceConfig } from '../config/storage.js';
import { sanitizeInput, isValidGuid } from '../utils/validators.js';
import { formatBytes } from '../utils/formatter.js';

function injectHomeStyles() {
  if (document.getElementById('page-home-styles')) return;
  const style = document.createElement('style');
  style.id = 'page-home-styles';
  style.textContent = `
    /* ── Hero Section ──────────────────────────────────────────── */
    .home-hero {
      text-align: center;
      padding: var(--space-12, 48px) var(--space-4, 16px) var(--space-8, 32px);
      position: relative;
    }

    .home-hero-logo {
      width: 72px;
      height: 72px;
      margin: 0 auto var(--space-4, 16px);
      color: var(--color-cyan, #00d4ff);
      filter: drop-shadow(0 0 20px rgba(0, 212, 255, 0.4));
      animation: heroFloat 6s ease-in-out infinite;
    }

    @keyframes heroFloat {
      0%, 100% { transform: translateY(0); }
      50% { transform: translateY(-8px); }
    }

    .home-hero h1 {
      font-size: clamp(2rem, 5vw, 3rem);
      color: var(--color-text, #fff);
      margin-bottom: var(--space-2, 8px);
      letter-spacing: -0.02em;
    }

    .home-hero h1 span {
      background: linear-gradient(135deg, #00d4ff, #5eead4);
      -webkit-background-clip: text;
      -webkit-text-fill-color: transparent;
      background-clip: text;
    }

    .home-hero-subtitle {
      font-size: var(--font-size-lg, 1.125rem);
      color: var(--color-text-muted, #94a3b8);
      max-width: 540px;
      margin: 0 auto;
      line-height: 1.7;
    }

    /* ── Stats Bar ─────────────────────────────────────────────── */
    .home-stats-bar {
      display: flex;
      justify-content: center;
      gap: var(--space-6, 24px);
      flex-wrap: wrap;
      margin: var(--space-6, 24px) 0 var(--space-8, 32px);
    }

    .home-stat-pill {
      display: flex;
      align-items: center;
      gap: var(--space-2, 8px);
      padding: var(--space-2, 8px) var(--space-4, 16px);
      background: rgba(0, 212, 255, 0.06);
      border: 1px solid rgba(0, 212, 255, 0.15);
      border-radius: var(--radius-full, 9999px);
      font-size: var(--font-size-sm, 0.875rem);
      color: var(--color-text-muted, #94a3b8);
      transition: all var(--transition-fast, 150ms ease);
    }

    .home-stat-pill:hover {
      border-color: rgba(0, 212, 255, 0.4);
      background: rgba(0, 212, 255, 0.1);
    }

    .home-stat-pill strong {
      color: var(--color-cyan, #00d4ff);
      font-weight: 700;
    }

    /* ── OTA Search Form ───────────────────────────────────────── */
    .ota-search-section {
      max-width: 720px;
      margin: 0 auto var(--space-8, 32px);
    }

    .ota-search-card {
      background: var(--color-card, #1a2235);
      border: 1px solid var(--color-border, #2a3450);
      border-radius: var(--radius-xl, 16px);
      padding: var(--space-8, 32px);
      position: relative;
      overflow: hidden;
    }

    .ota-search-card::before {
      content: '';
      position: absolute;
      top: 0;
      left: 0;
      right: 0;
      height: 3px;
      background: linear-gradient(90deg, #00d4ff, #5eead4, #00d4ff);
      background-size: 200% 100%;
      animation: gradientSlide 3s linear infinite;
    }

    @keyframes gradientSlide {
      0% { background-position: 0% 0; }
      100% { background-position: 200% 0; }
    }

    .ota-search-title {
      display: flex;
      align-items: center;
      gap: var(--space-3, 12px);
      font-size: var(--font-size-xl, 1.25rem);
      font-weight: 600;
      color: var(--color-text, #fff);
      margin-bottom: var(--space-6, 24px);
    }

    .ota-search-title svg {
      width: 24px;
      height: 24px;
      color: var(--color-cyan, #00d4ff);
    }

    .ota-form-grid {
      display: grid;
      grid-template-columns: 1fr;
      gap: var(--space-5, 20px);
    }

    .ota-form-row {
      display: grid;
      grid-template-columns: 1fr 1fr;
      gap: var(--space-4, 16px);
    }

    @media (max-width: 640px) {
      .ota-form-row { grid-template-columns: 1fr; }
    }

    .ota-field {
      display: flex;
      flex-direction: column;
      gap: var(--space-1, 4px);
    }

    .ota-field-label {
      display: flex;
      align-items: center;
      gap: var(--space-2, 8px);
      font-size: var(--font-size-sm, 0.875rem);
      font-weight: 600;
      color: var(--color-text, #fff);
    }

    .ota-field-label .required {
      color: var(--color-red, #ef4444);
      font-size: var(--font-size-xs, 0.75rem);
    }

    .ota-field-hint {
      font-size: var(--font-size-xs, 0.75rem);
      color: var(--color-text-disabled, #64748b);
      line-height: 1.5;
      padding: var(--space-1, 4px) 0;
    }

    .ota-field-hint code {
      background: rgba(0, 212, 255, 0.08);
      color: var(--color-bright-cyan, #5eead4);
      padding: 1px 5px;
      border-radius: 3px;
      font-size: 0.7rem;
      border: none;
    }

    .ota-field .input,
    .ota-field .select {
      padding: var(--space-3, 12px) var(--space-4, 16px);
      font-size: var(--font-size-sm, 0.875rem);
      background: var(--color-surface, #131a2b);
      border: 1px solid var(--color-border, #2a3450);
      border-radius: var(--radius-md, 8px);
    }

    .ota-field .input:focus,
    .ota-field .select:focus {
      border-color: var(--color-cyan, #00d4ff);
      box-shadow: 0 0 0 3px rgba(0, 212, 255, 0.12);
    }

    /* Carrier autocomplete */
    .ota-carrier-wrap {
      position: relative;
    }

    .ota-carrier-dropdown {
      position: absolute;
      top: 100%;
      left: 0;
      right: 0;
      max-height: 240px;
      overflow-y: auto;
      background: var(--color-surface, #131a2b);
      border: 1px solid var(--color-cyan, #00d4ff);
      border-top: none;
      border-radius: 0 0 var(--radius-md, 8px) var(--radius-md, 8px);
      z-index: var(--z-dropdown, 100);
      display: none;
      box-shadow: 0 8px 24px rgba(0, 0, 0, 0.4);
    }

    .ota-carrier-dropdown.open { display: block; }

    .ota-carrier-item {
      padding: var(--space-2, 8px) var(--space-4, 16px);
      font-size: var(--font-size-sm, 0.875rem);
      color: var(--color-text-muted, #94a3b8);
      cursor: pointer;
      transition: background var(--transition-fast, 150ms ease);
      display: flex;
      align-items: center;
      gap: var(--space-2, 8px);
    }

    .ota-carrier-item:hover {
      background: rgba(0, 212, 255, 0.08);
      color: var(--color-text, #fff);
    }

    .ota-carrier-item .cc {
      color: var(--color-cyan, #00d4ff);
      font-weight: 700;
      font-family: var(--font-mono);
      min-width: 72px;
    }

    .ota-carrier-item .cn {
      flex: 1;
    }

    .ota-carrier-item .cr {
      font-size: var(--font-size-xs, 0.75rem);
      color: var(--color-text-disabled, #64748b);
      text-align: right;
    }

    /* Submit actions */
    .ota-form-actions {
      display: flex;
      gap: var(--space-3, 12px);
      margin-top: var(--space-2, 8px);
    }

    .ota-btn-search {
      flex: 1;
      display: flex;
      align-items: center;
      justify-content: center;
      gap: var(--space-2, 8px);
      padding: var(--space-3, 12px) var(--space-6, 24px);
      font-size: var(--font-size-md, 1rem);
      font-weight: 600;
      color: #0a0e17;
      background: linear-gradient(135deg, #00d4ff, #5eead4);
      border: none;
      border-radius: var(--radius-md, 8px);
      cursor: pointer;
      transition: all var(--transition-fast, 150ms ease);
      box-shadow: 0 4px 16px rgba(0, 212, 255, 0.3);
    }

    .ota-btn-search:hover {
      transform: translateY(-1px);
      box-shadow: 0 6px 24px rgba(0, 212, 255, 0.45);
    }

    .ota-btn-search:active { transform: translateY(0); }

    .ota-btn-search:disabled {
      opacity: 0.5;
      cursor: not-allowed;
      transform: none;
      box-shadow: none;
    }

    .ota-btn-search svg {
      width: 20px;
      height: 20px;
    }

    /* ── Results ────────────────────────────────────────────────── */
    .ota-results {
      max-width: 720px;
      margin: 0 auto var(--space-8, 32px);
      display: flex;
      flex-direction: column;
      gap: var(--space-4, 16px);
    }

    .ota-results-loading {
      display: flex;
      align-items: center;
      justify-content: center;
      gap: var(--space-3, 12px);
      padding: var(--space-8, 32px);
      color: var(--color-text-muted, #94a3b8);
      font-size: var(--font-size-sm, 0.875rem);
    }

    .ota-update-header {
      display: flex;
      align-items: center;
      gap: var(--space-3, 12px);
      padding: var(--space-4, 16px) var(--space-5, 20px);
      background: rgba(34, 197, 94, 0.08);
      border: 1px solid rgba(34, 197, 94, 0.25);
      border-radius: var(--radius-lg, 12px);
    }

    .ota-update-header.no-update {
      background: rgba(239, 68, 68, 0.08);
      border-color: rgba(239, 68, 68, 0.25);
    }

    .ota-update-header.whitelisted {
      background: rgba(234, 179, 8, 0.08);
      border-color: rgba(234, 179, 8, 0.25);
    }

    .ota-update-header svg {
      width: 28px;
      height: 28px;
      flex-shrink: 0;
    }

    .ota-update-header.no-update svg { color: var(--color-red, #ef4444); }
    .ota-update-header.whitelisted svg { color: var(--color-yellow, #eab308); }

    .ota-update-title {
      font-size: var(--font-size-lg, 1.125rem);
      font-weight: 600;
      color: var(--color-text, #fff);
    }

    .ota-update-subtitle {
      font-size: var(--font-size-xs, 0.75rem);
      color: var(--color-text-muted, #94a3b8);
    }

    .ota-detail-grid {
      display: grid;
      grid-template-columns: repeat(auto-fit, minmax(200px, 1fr));
      gap: var(--space-3, 12px);
    }

    .ota-detail-item {
      background: var(--color-surface, #131a2b);
      border: 1px solid var(--color-border, #2a3450);
      border-radius: var(--radius-md, 8px);
      padding: var(--space-3, 12px) var(--space-4, 16px);
    }

    .ota-detail-label {
      font-size: 0.65rem;
      color: var(--color-text-disabled, #64748b);
      text-transform: uppercase;
      letter-spacing: 0.08em;
      font-weight: 600;
      margin-bottom: 2px;
    }

    .ota-detail-value {
      font-size: var(--font-size-sm, 0.875rem);
      color: var(--color-text, #fff);
      word-break: break-all;
      font-family: var(--font-mono);
    }

    /* Download links */
    .ota-downloads {
      background: var(--color-card, #1a2235);
      border: 1px solid var(--color-border, #2a3450);
      border-radius: var(--radius-lg, 12px);
      overflow: hidden;
    }

    .ota-downloads-title {
      display: flex;
      align-items: center;
      gap: var(--space-2, 8px);
      padding: var(--space-3, 12px) var(--space-4, 16px);
      font-size: var(--font-size-sm, 0.875rem);
      font-weight: 600;
      color: var(--color-text, #fff);
      background: rgba(0, 212, 255, 0.05);
      border-bottom: 1px solid var(--color-border, #2a3450);
    }

    .ota-downloads-title svg {
      width: 18px;
      height: 18px;
      color: var(--color-cyan, #00d4ff);
    }

    .ota-download-list {
      list-style: none;
      margin: 0;
      padding: 0;
    }

    .ota-download-item {
      display: flex;
      align-items: center;
      gap: var(--space-3, 12px);
      padding: var(--space-3, 12px) var(--space-4, 16px);
      border-bottom: 1px solid var(--color-border, #2a3450);
      transition: background var(--transition-fast, 150ms ease);
    }

    .ota-download-item:last-child { border-bottom: none; }

    .ota-download-item:hover {
      background: rgba(0, 212, 255, 0.04);
    }

    .ota-download-item a {
      font-size: var(--font-size-sm, 0.875rem);
      font-family: var(--font-mono);
      word-break: break-all;
      flex: 1;
    }

    .ota-download-item svg {
      width: 16px;
      height: 16px;
      color: var(--color-cyan, #00d4ff);
      flex-shrink: 0;
    }

    /* Raw JSON */
    .ota-raw-toggle {
      display: flex;
      align-items: center;
      gap: var(--space-2, 8px);
      cursor: pointer;
      font-size: var(--font-size-sm, 0.875rem);
      color: var(--color-text-disabled, #64748b);
      user-select: none;
      padding: var(--space-2, 8px) 0;
      transition: color var(--transition-fast, 150ms ease);
    }

    .ota-raw-toggle:hover { color: var(--color-text-muted, #94a3b8); }

    .ota-raw-content {
      display: none;
    }

    .ota-raw-content.open {
      display: block;
    }

    /* ── Quick Links ───────────────────────────────────────────── */
    .home-quick-links {
      display: grid;
      grid-template-columns: repeat(auto-fit, minmax(220px, 1fr));
      gap: var(--space-4, 16px);
      max-width: 720px;
      margin: 0 auto var(--space-8, 32px);
    }

    .home-quick-link {
      display: flex;
      align-items: center;
      gap: var(--space-3, 12px);
      padding: var(--space-4, 16px) var(--space-5, 20px);
      background: var(--color-card, #1a2235);
      border: 1px solid var(--color-border, #2a3450);
      border-radius: var(--radius-lg, 12px);
      text-decoration: none;
      color: var(--color-text-muted, #94a3b8);
      transition: all var(--transition-base, 250ms ease);
    }

    .home-quick-link:hover {
      border-color: var(--color-cyan, #00d4ff);
      box-shadow: var(--shadow-glow);
      color: var(--color-text, #fff);
      text-decoration: none;
      transform: translateY(-2px);
    }

    .home-quick-link svg {
      width: 24px;
      height: 24px;
      color: var(--color-cyan, #00d4ff);
      flex-shrink: 0;
    }

    .home-quick-link-text {
      font-size: var(--font-size-sm, 0.875rem);
      font-weight: 500;
    }

    .home-quick-link-desc {
      font-size: var(--font-size-xs, 0.75rem);
      color: var(--color-text-disabled, #64748b);
      margin-top: 2px;
    }
  `;
  document.head.appendChild(style);
}

function svgUse(iconId, cls) {
  return `<svg class="${cls || ''}" aria-hidden="true"><use href="icons.svg#${iconId}"/></svg>`;
}

const CONTEXTS = [
  { value: 'ota', label: 'OTA (System)' },
  { value: 'fota', label: 'FOTA (Firmware)' },
  { value: 'modem', label: 'Modem' },
];

function createCarrierAutocomplete() {
  const wrap = document.createElement('div');
  wrap.className = 'ota-carrier-wrap';

  const input = document.createElement('input');
  input.type = 'text';
  input.className = 'input';
  input.placeholder = 'Busca por código o nombre (ej: retla, T-Mobile)…';
  input.autocomplete = 'off';

  const dropdown = document.createElement('div');
  dropdown.className = 'ota-carrier-dropdown';

  let selectedCode = '';

  function populate(query) {
    dropdown.innerHTML = '';
    const results = query ? searchCarriers(query).slice(0, 60) : CARRIERS.slice(0, 60);
    if (results.length === 0) {
      const empty = document.createElement('div');
      empty.className = 'ota-carrier-item';
      empty.textContent = 'No se encontraron carriers';
      dropdown.appendChild(empty);
    } else {
      results.forEach(c => {
        const item = document.createElement('div');
        item.className = 'ota-carrier-item';
        item.innerHTML = `<span class="cc">${c.code}</span><span class="cn">${c.name}</span><span class="cr">${c.region}</span>`;
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
    populate(input.value.split('—')[0].trim());
    dropdown.classList.add('open');
  });

  input.addEventListener('input', () => {
    selectedCode = '';
    populate(sanitizeInput(input.value));
    dropdown.classList.add('open');
  });

  document.addEventListener('click', (e) => {
    if (!wrap.contains(e.target)) dropdown.classList.remove('open');
  });

  wrap.appendChild(input);
  wrap.appendChild(dropdown);

  return { element: wrap, getCode: () => selectedCode || sanitizeInput(input.value.split('—')[0].trim()), input };
}

export function render(container) {
  injectHomeStyles();
  container.innerHTML = '';

  const page = document.createElement('div');
  page.className = 'page-home';

  /* ═══ Hero Section ═══ */
  const hero = document.createElement('div');
  hero.className = 'home-hero';
  hero.innerHTML = `
    <svg class="home-hero-logo" aria-hidden="true"><use href="icons.svg#icon-logo"/></svg>
    <h1>Moto<span>OTA</span></h1>
    <p class="home-hero-subtitle">
      Busca actualizaciones OTA de firmware Motorola directamente desde los servidores CDS.
      Ingresa los datos de tu dispositivo y descubre las actualizaciones disponibles.
    </p>
  `;
  page.appendChild(hero);

  /* ═══ Stats pills ═══ */
  const regionCount = getAllRegionNames().length;
  const statsBar = document.createElement('div');
  statsBar.className = 'home-stats-bar';
  const statItems = [
    { icon: 'icon-carrier', label: 'Carriers', value: CARRIERS.length },
    { icon: 'icon-server', label: 'Servidores', value: SERVERS.length },
    { icon: 'icon-globe', label: 'Regiones', value: regionCount },
  ];
  statItems.forEach(({ icon, label, value }) => {
    const pill = document.createElement('div');
    pill.className = 'home-stat-pill';
    pill.innerHTML = `${svgUse(icon)} <strong>${value}</strong> ${label}`;
    statsBar.appendChild(pill);
  });
  page.appendChild(statsBar);

  /* ═══ OTA Search Card ═══ */
  const deviceConfig = loadDeviceConfig();
  const searchSection = document.createElement('div');
  searchSection.className = 'ota-search-section';

  const searchCard = document.createElement('div');
  searchCard.className = 'ota-search-card';

  const searchTitle = document.createElement('div');
  searchTitle.className = 'ota-search-title';
  searchTitle.innerHTML = `${svgUse('icon-search')} Buscar Actualizaciones OTA`;
  searchCard.appendChild(searchTitle);

  const formGrid = document.createElement('div');
  formGrid.className = 'ota-form-grid';

  // ── GUID Field ──
  const guidField = document.createElement('div');
  guidField.className = 'ota-field';
  guidField.innerHTML = `
    <div class="ota-field-label">Device GUID <span class="required">*</span></div>
    <div class="ota-field-hint">
      El GUID es el identificador único de tu firmware actual. Puedes obtenerlo con ADB:
      <code>adb shell getprop ro.mot.build.guid</code> o buscarlo en el archivo
      <code>/system/build.prop</code> de tu dispositivo. Es una cadena hexadecimal de 15+ caracteres.
    </div>
  `;
  const guidInput = document.createElement('input');
  guidInput.type = 'text';
  guidInput.className = 'input';
  guidInput.placeholder = 'ej: a1b2c3d4e5f6a7b';
  guidInput.value = deviceConfig.guid || '';
  guidField.appendChild(guidInput);
  formGrid.appendChild(guidField);

  // ── Carrier Field ──
  const carrierField = document.createElement('div');
  carrierField.className = 'ota-field';
  carrierField.innerHTML = `
    <div class="ota-field-label">Carrier <span class="required">*</span></div>
    <div class="ota-field-hint">
      El código del operador/carrier de tu dispositivo. Puedes encontrarlo con
      <code>adb shell getprop ro.carrier</code> o en Configuración → Acerca del teléfono.
      Para dispositivos desbloqueados usa <code>retus</code> (USA), <code>retla</code> (LATAM),
      <code>reteu</code> (Europa), <code>retbr</code> (Brasil). Contamos con ${CARRIERS.length} carriers de todas las regiones.
    </div>
  `;
  const carrierInput = createCarrierAutocomplete();
  if (deviceConfig.carrier) {
    const found = CARRIERS.find(c => c.code === deviceConfig.carrier);
    if (found) carrierInput.input.value = `${found.code} — ${found.name}`;
  }
  carrierField.appendChild(carrierInput.element);
  formGrid.appendChild(carrierField);

  // ── Server & Context row ──
  const rowDiv = document.createElement('div');
  rowDiv.className = 'ota-form-row';

  // Server
  const serverField = document.createElement('div');
  serverField.className = 'ota-field';
  serverField.innerHTML = `
    <div class="ota-field-label">Servidor CDS</div>
    <div class="ota-field-hint">
      El servidor de Motorola a consultar. Usa <code>Production Global</code> para la mayoría de
      dispositivos. Usa <code>Production PRC</code> solo para dispositivos vendidos en China.
    </div>
  `;
  const serverSelect = document.createElement('select');
  serverSelect.className = 'select';
  SERVERS.forEach(s => {
    const opt = document.createElement('option');
    opt.value = s.id;
    opt.textContent = `${s.name}`;
    if (s.status !== 'active') opt.textContent += ' [inactivo]';
    serverSelect.appendChild(opt);
  });
  serverField.appendChild(serverSelect);
  rowDiv.appendChild(serverField);

  // Context
  const contextField = document.createElement('div');
  contextField.className = 'ota-field';
  contextField.innerHTML = `
    <div class="ota-field-label">Contexto</div>
    <div class="ota-field-hint">
      Tipo de actualización a buscar. <code>OTA</code> busca actualizaciones del sistema operativo.
      <code>FOTA</code> busca firmware de radio/baseband. <code>Modem</code> busca actualizaciones del módem.
    </div>
  `;
  const contextSelect = document.createElement('select');
  contextSelect.className = 'select';
  CONTEXTS.forEach(c => {
    const opt = document.createElement('option');
    opt.value = c.value;
    opt.textContent = c.label;
    contextSelect.appendChild(opt);
  });
  contextSelect.value = deviceConfig.context || 'ota';
  contextField.appendChild(contextSelect);
  rowDiv.appendChild(contextField);

  formGrid.appendChild(rowDiv);

  // ── Submit button ──
  const actionsDiv = document.createElement('div');
  actionsDiv.className = 'ota-form-actions';
  const searchBtn = document.createElement('button');
  searchBtn.className = 'ota-btn-search';
  searchBtn.innerHTML = `${svgUse('icon-search')} Buscar OTAs`;
  actionsDiv.appendChild(searchBtn);
  formGrid.appendChild(actionsDiv);

  searchCard.appendChild(formGrid);
  searchSection.appendChild(searchCard);
  page.appendChild(searchSection);

  /* ═══ Results Area ═══ */
  const resultsDiv = document.createElement('div');
  resultsDiv.className = 'ota-results';
  resultsDiv.style.display = 'none';
  page.appendChild(resultsDiv);

  /* ═══ Quick Links ═══ */
  const quickLinks = document.createElement('div');
  quickLinks.className = 'home-quick-links';
  const links = [
    { icon: 'icon-chain', label: 'Cadena de OTAs', desc: 'Recorre todas las actualizaciones desde tu versión', hash: '#chain' },
    { icon: 'icon-scan', label: 'Escanear Carriers', desc: 'Analiza todos los carriers para tu GUID', hash: '#scan' },
    { icon: 'icon-carrier', label: 'Explorar Carriers', desc: 'Navega los ' + CARRIERS.length + ' carriers disponibles', hash: '#carriers' },
  ];
  links.forEach(({ icon, label, desc, hash }) => {
    const a = document.createElement('a');
    a.href = hash;
    a.className = 'home-quick-link';
    a.innerHTML = `
      ${svgUse(icon)}
      <div>
        <div class="home-quick-link-text">${label}</div>
        <div class="home-quick-link-desc">${desc}</div>
      </div>
    `;
    quickLinks.appendChild(a);
  });
  page.appendChild(quickLinks);

  container.appendChild(page);

  /* ═══ Search Handler ═══ */
  searchBtn.addEventListener('click', async () => {
    const guid = sanitizeInput(guidInput.value.trim());
    const carrier = carrierInput.getCode();

    if (!guid) {
      showToast('Por favor, ingresa el GUID del dispositivo.', 'warning');
      guidInput.classList.add('input-error');
      guidInput.focus();
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

    // Save config for next use
    saveDeviceConfig({ guid, carrier, context: contextSelect.value });

    resultsDiv.style.display = '';
    resultsDiv.innerHTML = '';

    const loadingEl = document.createElement('div');
    loadingEl.className = 'ota-results-loading';
    loadingEl.appendChild(createSpinner('lg'));
    const loadMsg = document.createElement('span');
    loadMsg.textContent = 'Consultando servidores Motorola CDS…';
    loadingEl.appendChild(loadMsg);
    resultsDiv.appendChild(loadingEl);
    searchBtn.disabled = true;

    try {
      const server = SERVERS.find(s => s.id === serverSelect.value);
      const response = await checkUpdate(guid, carrier, {
        host: server?.host,
        context: contextSelect.value,
      });

      resultsDiv.innerHTML = '';
      const status = classifyCarrierStatus(response);

      // Status header
      const statusHeader = document.createElement('div');
      if (status === 'open') {
        statusHeader.className = 'ota-update-header';
        statusHeader.innerHTML = `
          <svg style="color:#22c55e"><use href="icons.svg#icon-success"/></svg>
          <div>
            <div class="ota-update-title">¡Actualización Disponible!</div>
            <div class="ota-update-subtitle">Se encontró una actualización OTA para tu dispositivo</div>
          </div>
        `;
      } else if (status === 'whitelisted') {
        statusHeader.className = 'ota-update-header whitelisted';
        statusHeader.innerHTML = `
          <svg><use href="icons.svg#icon-warning"/></svg>
          <div>
            <div class="ota-update-title">Carrier con Lista Blanca</div>
            <div class="ota-update-subtitle">Este carrier tiene contenido pero requiere autorización (serial/IMEI)</div>
          </div>
        `;
      } else {
        statusHeader.className = 'ota-update-header no-update';
        statusHeader.innerHTML = `
          <svg><use href="icons.svg#icon-error"/></svg>
          <div>
            <div class="ota-update-title">Sin Actualizaciones</div>
            <div class="ota-update-subtitle">No se encontró contenido OTA para esta combinación GUID/carrier</div>
          </div>
        `;
      }
      resultsDiv.appendChild(statusHeader);

      // Update details
      if (response.hasUpdate && response.content) {
        const detailGrid = document.createElement('div');
        detailGrid.className = 'ota-detail-grid';
        const fields = [
          { label: 'Versión Origen', value: response.content.sourceVersion || 'N/A' },
          { label: 'Versión Destino', value: response.content.targetVersion || 'N/A' },
          { label: 'Tamaño', value: formatBytes(response.content.sizeBytes) },
          { label: 'Tipo', value: response.content.updateType || 'N/A' },
          { label: 'MD5', value: response.content.md5 || 'N/A' },
          { label: 'Package ID', value: response.content.packageId || 'N/A' },
        ];
        fields.forEach(({ label, value }) => {
          const item = document.createElement('div');
          item.className = 'ota-detail-item';
          item.innerHTML = `
            <div class="ota-detail-label">${label}</div>
            <div class="ota-detail-value">${value}</div>
          `;
          detailGrid.appendChild(item);
        });
        resultsDiv.appendChild(detailGrid);
      }

      // Download URLs
      if (response.downloadUrls && response.downloadUrls.length) {
        const dlCard = document.createElement('div');
        dlCard.className = 'ota-downloads';

        const dlTitle = document.createElement('div');
        dlTitle.className = 'ota-downloads-title';
        dlTitle.innerHTML = `${svgUse('icon-download')} Enlaces de Descarga (${response.downloadUrls.length})`;
        dlCard.appendChild(dlTitle);

        const ul = document.createElement('ul');
        ul.className = 'ota-download-list';
        response.downloadUrls.forEach((url, i) => {
          const li = document.createElement('li');
          li.className = 'ota-download-item';
          li.innerHTML = `
            <svg><use href="icons.svg#icon-download"/></svg>
            <a href="${url}" target="_blank" rel="noopener noreferrer" title="Descargar OTA">${url}</a>
            <svg><use href="icons.svg#icon-external"/></svg>
          `;
          ul.appendChild(li);
        });
        dlCard.appendChild(ul);
        resultsDiv.appendChild(dlCard);
      }

      // Raw JSON toggle
      const rawWrap = document.createElement('div');
      const toggle = document.createElement('div');
      toggle.className = 'ota-raw-toggle';
      toggle.innerHTML = '<i class="fa-solid fa-code"></i> Ver respuesta JSON completa';
      const rawContent = document.createElement('div');
      rawContent.className = 'ota-raw-content';
      const pre = document.createElement('pre');
      const code = document.createElement('code');
      code.textContent = JSON.stringify(response.raw, null, 2);
      pre.appendChild(code);
      rawContent.appendChild(pre);
      toggle.addEventListener('click', () => rawContent.classList.toggle('open'));
      rawWrap.appendChild(toggle);
      rawWrap.appendChild(rawContent);
      resultsDiv.appendChild(rawWrap);

      showToast(status === 'open' ? '¡Actualización encontrada!' : 'Consulta completada.', status === 'open' ? 'success' : 'info');
    } catch (err) {
      resultsDiv.innerHTML = '';
      const errCard = createStatusCard('Error', `<p>${err.message || 'La solicitud falló'}</p>`, 'error');
      resultsDiv.appendChild(errCard);
      showToast(`Error: ${err.message || 'Solicitud fallida'}`, 'error');
    } finally {
      searchBtn.disabled = false;
    }
  });
}
