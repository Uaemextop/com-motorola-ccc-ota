import DOMPurify from 'dompurify';

function injectCardStyles() {
  if (document.getElementById('moto-card-styles')) return;
  const style = document.createElement('style');
  style.id = 'moto-card-styles';
  style.textContent = `
    .moto-card {
      background: var(--color-card, #1a2235);
      border: 1px solid var(--color-border, #2a3450);
      border-radius: var(--radius-lg, 12px);
      padding: var(--space-6, 24px);
      transition: border-color var(--transition-base, 250ms ease),
                  box-shadow var(--transition-base, 250ms ease);
      font-family: var(--font-family, sans-serif);
    }

    .moto-card:hover {
      border-color: var(--color-cyan, #00d4ff);
      box-shadow: var(--shadow-glow, 0 0 20px rgba(0, 212, 255, 0.15));
    }

    .moto-card-header {
      display: flex;
      align-items: center;
      gap: var(--space-3, 12px);
      margin-bottom: var(--space-4, 16px);
    }

    .moto-card-icon {
      font-size: var(--font-size-2xl, 1.5rem);
      color: var(--color-cyan, #00d4ff);
    }

    .moto-card-titles {
      flex: 1;
      min-width: 0;
    }

    .moto-card-title {
      font-size: var(--font-size-lg, 1.125rem);
      font-weight: 600;
      color: var(--color-text, #ffffff);
      margin: 0;
    }

    .moto-card-subtitle {
      font-size: var(--font-size-xs, 0.75rem);
      color: var(--color-text-muted, #94a3b8);
      margin: var(--space-1, 4px) 0 0;
    }

    .moto-card-body {
      color: var(--color-text-muted, #94a3b8);
      font-size: var(--font-size-sm, 0.875rem);
      line-height: 1.6;
    }

    .moto-card-actions {
      display: flex;
      align-items: center;
      gap: var(--space-2, 8px);
      margin-top: var(--space-4, 16px);
      padding-top: var(--space-4, 16px);
      border-top: 1px solid var(--color-border, #2a3450);
    }

    /* Status card variants */
    .moto-card--success { border-left: 3px solid var(--color-green, #22c55e); }
    .moto-card--warning { border-left: 3px solid var(--color-yellow, #eab308); }
    .moto-card--error   { border-left: 3px solid var(--color-red, #ef4444); }
    .moto-card--info    { border-left: 3px solid var(--color-cyan, #00d4ff); }

    /* Stat card */
    .moto-stat-card {
      background: var(--color-card, #1a2235);
      border: 1px solid var(--color-border, #2a3450);
      border-radius: var(--radius-lg, 12px);
      padding: var(--space-5, 20px) var(--space-6, 24px);
      display: flex;
      align-items: center;
      gap: var(--space-4, 16px);
      transition: border-color var(--transition-base, 250ms ease),
                  box-shadow var(--transition-base, 250ms ease);
      font-family: var(--font-family, sans-serif);
    }

    .moto-stat-card:hover {
      border-color: var(--color-cyan, #00d4ff);
      box-shadow: var(--shadow-glow, 0 0 20px rgba(0, 212, 255, 0.15));
    }

    .moto-stat-icon {
      width: 48px;
      height: 48px;
      display: flex;
      align-items: center;
      justify-content: center;
      border-radius: var(--radius-md, 8px);
      font-size: var(--font-size-xl, 1.25rem);
    }

    .moto-stat-value {
      font-size: var(--font-size-3xl, 1.875rem);
      font-weight: 700;
      color: var(--color-text, #ffffff);
      line-height: 1.2;
    }

    .moto-stat-label {
      font-size: var(--font-size-xs, 0.75rem);
      color: var(--color-text-muted, #94a3b8);
      text-transform: uppercase;
      letter-spacing: 0.05em;
      font-weight: 600;
    }
  `;
  document.head.appendChild(style);
}

const STATUS_ICONS = {
  success: 'fa-circle-check',
  warning: 'fa-triangle-exclamation',
  error: 'fa-circle-xmark',
  info: 'fa-circle-info',
};

/**
 * Create a general-purpose card.
 * @param {object} options
 * @param {string}   [options.title]
 * @param {string}   [options.subtitle]
 * @param {string}   [options.content]    - HTML string (sanitized)
 * @param {string}   [options.icon]       - FontAwesome class, e.g. 'fa-solid fa-gear'
 * @param {Array<{label:string, className?:string, onClick?:Function}>} [options.actions]
 * @returns {HTMLElement}
 */
export function createCard(options = {}) {
  injectCardStyles();

  const card = document.createElement('div');
  card.className = 'moto-card';

  // Header (icon + title + subtitle)
  if (options.title || options.icon) {
    const header = document.createElement('div');
    header.className = 'moto-card-header';

    if (options.icon) {
      const icon = document.createElement('i');
      icon.className = `moto-card-icon ${options.icon}`;
      header.appendChild(icon);
    }

    const titles = document.createElement('div');
    titles.className = 'moto-card-titles';

    if (options.title) {
      const h3 = document.createElement('h3');
      h3.className = 'moto-card-title';
      h3.textContent = options.title;
      titles.appendChild(h3);
    }

    if (options.subtitle) {
      const p = document.createElement('p');
      p.className = 'moto-card-subtitle';
      p.textContent = options.subtitle;
      titles.appendChild(p);
    }

    header.appendChild(titles);
    card.appendChild(header);
  }

  // Body
  if (options.content) {
    const body = document.createElement('div');
    body.className = 'moto-card-body';
    body.innerHTML = DOMPurify.sanitize(options.content);
    card.appendChild(body);
  }

  // Actions
  if (options.actions && options.actions.length) {
    const actions = document.createElement('div');
    actions.className = 'moto-card-actions';
    options.actions.forEach(({ label, className, onClick }) => {
      const btn = document.createElement('button');
      btn.className = `btn ${className || ''}`.trim();
      btn.textContent = label;
      if (onClick) btn.addEventListener('click', onClick);
      actions.appendChild(btn);
    });
    card.appendChild(actions);
  }

  return card;
}

/**
 * Create a stat card with a large value display.
 * @param {string|number} value
 * @param {string} label
 * @param {string} [icon]  - FontAwesome class
 * @param {string} [color] - CSS color for the icon background
 * @returns {HTMLElement}
 */
export function createStatCard(value, label, icon, color) {
  injectCardStyles();

  const card = document.createElement('div');
  card.className = 'moto-stat-card';

  if (icon) {
    const iconWrap = document.createElement('div');
    iconWrap.className = 'moto-stat-icon';
    const c = color || 'var(--color-cyan, #00d4ff)';
    iconWrap.style.background = `${c}1a`;
    iconWrap.style.color = c;
    const i = document.createElement('i');
    i.className = icon;
    iconWrap.appendChild(i);
    card.appendChild(iconWrap);
  }

  const info = document.createElement('div');

  const valEl = document.createElement('div');
  valEl.className = 'moto-stat-value';
  valEl.textContent = String(value);
  info.appendChild(valEl);

  const labelEl = document.createElement('div');
  labelEl.className = 'moto-stat-label';
  labelEl.textContent = label;
  info.appendChild(labelEl);

  card.appendChild(info);
  return card;
}

/**
 * Create a status card with a colored left border.
 * @param {string} title
 * @param {string} content - HTML string (sanitized)
 * @param {'success'|'warning'|'error'|'info'} status
 * @returns {HTMLElement}
 */
export function createStatusCard(title, content, status) {
  injectCardStyles();

  const card = document.createElement('div');
  card.className = `moto-card moto-card--${status}`;

  const header = document.createElement('div');
  header.className = 'moto-card-header';

  const iconClass = STATUS_ICONS[status] || STATUS_ICONS.info;
  const icon = document.createElement('i');
  icon.className = `moto-card-icon fa-solid ${iconClass}`;
  header.appendChild(icon);

  const h3 = document.createElement('h3');
  h3.className = 'moto-card-title';
  h3.textContent = title;
  header.appendChild(h3);

  card.appendChild(header);

  if (content) {
    const body = document.createElement('div');
    body.className = 'moto-card-body';
    body.innerHTML = DOMPurify.sanitize(content);
    card.appendChild(body);
  }

  return card;
}
