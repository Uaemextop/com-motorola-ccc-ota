import { createStatCard, createCard } from '../components/card.js';
import { CARRIERS } from '../config/carriers.js';
import { SERVERS } from '../config/servers.js';
import { getAllRegionNames } from '../config/carriers.js';

function injectHomeStyles() {
  if (document.getElementById('page-home-styles')) return;
  const style = document.createElement('style');
  style.id = 'page-home-styles';
  style.textContent = `
    .home-hero {
      text-align: center;
      padding: var(--space-16, 64px) var(--space-4, 16px) var(--space-10, 40px);
    }

    .home-hero-icon {
      font-size: 3rem;
      color: var(--color-cyan, #00d4ff);
      margin-bottom: var(--space-4, 16px);
    }

    .home-hero h1 {
      font-size: var(--font-size-4xl, 2.25rem);
      color: var(--color-text, #fff);
      margin-bottom: var(--space-2, 8px);
    }

    .home-hero-subtitle {
      font-size: var(--font-size-lg, 1.125rem);
      color: var(--color-cyan, #00d4ff);
      font-weight: 500;
      margin-bottom: var(--space-3, 12px);
    }

    .home-hero-desc {
      max-width: 600px;
      margin: 0 auto var(--space-6, 24px);
      color: var(--color-text-muted, #94a3b8);
      font-size: var(--font-size-sm, 0.875rem);
      line-height: 1.7;
    }

    .home-actions {
      display: flex;
      flex-wrap: wrap;
      justify-content: center;
      gap: var(--space-3, 12px);
      margin-top: var(--space-6, 24px);
    }

    .home-actions .btn i {
      margin-right: var(--space-2, 8px);
    }

    .home-section-title {
      font-size: var(--font-size-xl, 1.25rem);
      font-weight: 600;
      color: var(--color-text, #fff);
      margin-bottom: var(--space-4, 16px);
      display: flex;
      align-items: center;
      gap: var(--space-2, 8px);
    }

    .home-section-title i {
      color: var(--color-cyan, #00d4ff);
    }

    .home-steps .moto-card {
      text-align: center;
    }

    .home-step-number {
      display: inline-flex;
      align-items: center;
      justify-content: center;
      width: 40px;
      height: 40px;
      border-radius: 50%;
      background: rgba(0, 212, 255, 0.15);
      color: var(--color-cyan, #00d4ff);
      font-weight: 700;
      font-size: var(--font-size-lg, 1.125rem);
      margin-bottom: var(--space-3, 12px);
    }

    .home-features {
      display: grid;
      grid-template-columns: repeat(auto-fit, minmax(250px, 1fr));
      gap: var(--space-4, 16px);
    }

    .home-feature {
      display: flex;
      align-items: flex-start;
      gap: var(--space-3, 12px);
      padding: var(--space-4, 16px);
      background: var(--color-card, #1a2235);
      border: 1px solid var(--color-border, #2a3450);
      border-radius: var(--radius-lg, 12px);
      transition: border-color var(--transition-base, 250ms ease);
    }

    .home-feature:hover {
      border-color: var(--color-cyan, #00d4ff);
    }

    .home-feature-icon {
      font-size: var(--font-size-xl, 1.25rem);
      color: var(--color-cyan, #00d4ff);
      flex-shrink: 0;
      margin-top: 2px;
    }

    .home-feature-title {
      font-weight: 600;
      color: var(--color-text, #fff);
      font-size: var(--font-size-sm, 0.875rem);
      margin-bottom: var(--space-1, 4px);
    }

    .home-feature-desc {
      color: var(--color-text-muted, #94a3b8);
      font-size: var(--font-size-xs, 0.75rem);
      line-height: 1.5;
    }
  `;
  document.head.appendChild(style);
}

const QUICK_ACTIONS = [
  { label: 'Check Update', icon: 'fa-solid fa-magnifying-glass', hash: '#check', cls: 'btn-primary' },
  { label: 'Scan Carriers', icon: 'fa-solid fa-radar', hash: '#scan', cls: 'btn-secondary' },
  { label: 'Browse Carriers', icon: 'fa-solid fa-tower-cell', hash: '#carriers', cls: 'btn-secondary' },
  { label: 'View Servers', icon: 'fa-solid fa-server', hash: '#servers', cls: 'btn-secondary' },
];

const HOW_IT_WORKS = [
  { step: 1, title: 'Enter GUID', desc: 'Provide your device firmware GUID (SHA-1 hash found in build.prop or via ADB).', icon: 'fa-solid fa-fingerprint' },
  { step: 2, title: 'Select Carrier', desc: 'Choose the carrier or retail channel code that matches your device configuration.', icon: 'fa-solid fa-tower-cell' },
  { step: 3, title: 'Check for Updates', desc: 'Query the Motorola CDS servers to find available OTA updates for your device.', icon: 'fa-solid fa-cloud-arrow-down' },
];

const FEATURES = [
  { icon: 'fa-solid fa-bolt', title: 'Fast Checking', desc: 'Query Motorola CDS servers directly for instant results.' },
  { icon: 'fa-solid fa-link', title: 'Chain Walking', desc: 'Discover the full update chain from any firmware version.' },
  { icon: 'fa-solid fa-satellite-dish', title: 'Carrier Scanning', desc: 'Scan all 438 carriers to find every available update.' },
  { icon: 'fa-solid fa-shield-halved', title: 'Input Validation', desc: 'All inputs are validated and sanitized for safety.' },
  { icon: 'fa-solid fa-database', title: 'Comprehensive Database', desc: '438 carriers across 10 regions with 6 server endpoints.' },
  { icon: 'fa-solid fa-floppy-disk', title: 'Persistent Config', desc: 'Save your device and app settings to localStorage.' },
];

export function render(container) {
  injectHomeStyles();
  container.innerHTML = '';

  const page = document.createElement('div');
  page.className = 'page-home';

  // Hero
  const hero = document.createElement('div');
  hero.className = 'home-hero';
  hero.innerHTML = `
    <div class="home-hero-icon"><i class="fa-solid fa-mobile-screen"></i></div>
    <h1>MotoOTA</h1>
    <p class="home-hero-subtitle">Motorola OTA Update Checker</p>
    <p class="home-hero-desc">
      Query Motorola's Content Delivery System to check for OTA firmware updates,
      walk update chains, and scan carriers — all from your browser.
    </p>
  `;
  page.appendChild(hero);

  // Content wrapper
  const content = document.createElement('div');
  content.className = 'container';

  // Stat cards
  const regionCount = getAllRegionNames().length;
  const statsGrid = document.createElement('div');
  statsGrid.className = 'grid grid-cols-4 section';
  const stats = [
    { value: CARRIERS.length, label: 'Carriers', icon: 'fa-solid fa-tower-cell', color: '#22c55e' },
    { value: SERVERS.length, label: 'Servers', icon: 'fa-solid fa-server', color: '#3b82f6' },
    { value: regionCount, label: 'Regions', icon: 'fa-solid fa-earth-americas', color: '#eab308' },
    { value: 'v2.1.0', label: 'Version', icon: 'fa-solid fa-code-branch', color: '#a855f7' },
  ];
  stats.forEach(s => statsGrid.appendChild(createStatCard(s.value, s.label, s.icon, s.color)));
  content.appendChild(statsGrid);

  // Quick actions
  const actionsWrap = document.createElement('div');
  actionsWrap.className = 'home-actions section';
  QUICK_ACTIONS.forEach(({ label, icon, hash, cls }) => {
    const btn = document.createElement('a');
    btn.href = hash;
    btn.className = `btn ${cls}`;
    btn.innerHTML = `<i class="${icon}"></i> ${label}`;
    actionsWrap.appendChild(btn);
  });
  content.appendChild(actionsWrap);

  // How it works
  const howTitle = document.createElement('h2');
  howTitle.className = 'home-section-title';
  howTitle.innerHTML = '<i class="fa-solid fa-circle-question"></i> How It Works';
  content.appendChild(howTitle);

  const stepsGrid = document.createElement('div');
  stepsGrid.className = 'grid grid-cols-3 section home-steps';
  HOW_IT_WORKS.forEach(({ step, title, desc, icon }) => {
    const card = createCard({
      icon,
      title,
      content: `<div class="home-step-number">${step}</div><p>${desc}</p>`,
    });
    stepsGrid.appendChild(card);
  });
  content.appendChild(stepsGrid);

  // Feature highlights
  const featTitle = document.createElement('h2');
  featTitle.className = 'home-section-title';
  featTitle.innerHTML = '<i class="fa-solid fa-star"></i> Features';
  content.appendChild(featTitle);

  const featGrid = document.createElement('div');
  featGrid.className = 'home-features section';
  FEATURES.forEach(({ icon, title, desc }) => {
    const feat = document.createElement('div');
    feat.className = 'home-feature';
    feat.innerHTML = `
      <i class="${icon} home-feature-icon"></i>
      <div>
        <div class="home-feature-title">${title}</div>
        <div class="home-feature-desc">${desc}</div>
      </div>
    `;
    featGrid.appendChild(feat);
  });
  content.appendChild(featGrid);

  page.appendChild(content);
  container.appendChild(page);
}
