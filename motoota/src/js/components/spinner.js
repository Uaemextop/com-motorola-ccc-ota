function injectSpinnerStyles() {
  if (document.getElementById('moto-spinner-styles')) return;
  const style = document.createElement('style');
  style.id = 'moto-spinner-styles';
  style.textContent = `
    .moto-spinner {
      display: inline-block;
      border: 3px solid var(--color-border, #2a3450);
      border-top-color: var(--color-cyan, #00d4ff);
      border-radius: 50%;
      animation: motoSpin 0.8s linear infinite;
    }

    .moto-spinner--sm { width: 16px; height: 16px; border-width: 2px; }
    .moto-spinner--md { width: 24px; height: 24px; border-width: 3px; }
    .moto-spinner--lg { width: 40px; height: 40px; border-width: 4px; }

    @keyframes motoSpin {
      to { transform: rotate(360deg); }
    }

    .moto-loading-overlay {
      position: fixed;
      inset: 0;
      z-index: var(--z-modal, 300);
      display: flex;
      flex-direction: column;
      align-items: center;
      justify-content: center;
      gap: var(--space-4, 16px);
      background: rgba(10, 14, 23, 0.85);
      backdrop-filter: blur(4px);
      -webkit-backdrop-filter: blur(4px);
      font-family: var(--font-family, sans-serif);
    }

    .moto-loading-message {
      font-size: var(--font-size-sm, 0.875rem);
      color: var(--color-text-muted, #94a3b8);
    }
  `;
  document.head.appendChild(style);
}

const SIZE_MAP = { sm: 'moto-spinner--sm', md: 'moto-spinner--md', lg: 'moto-spinner--lg' };

let overlayEl = null;

/**
 * Create an inline spinner element.
 * @param {'sm'|'md'|'lg'} [size='md']
 * @returns {HTMLElement}
 */
export function createSpinner(size = 'md') {
  injectSpinnerStyles();
  const el = document.createElement('div');
  el.className = `moto-spinner ${SIZE_MAP[size] || SIZE_MAP.md}`;
  el.setAttribute('role', 'status');
  el.setAttribute('aria-label', 'Loading');
  return el;
}

/**
 * Show a full-page loading overlay with spinner and optional message.
 * @param {string} [message='Loading…']
 */
export function showLoadingOverlay(message = 'Loading\u2026') {
  injectSpinnerStyles();
  hideLoadingOverlay();

  overlayEl = document.createElement('div');
  overlayEl.className = 'moto-loading-overlay';

  const spinner = createSpinner('lg');
  overlayEl.appendChild(spinner);

  const msg = document.createElement('div');
  msg.className = 'moto-loading-message';
  msg.textContent = message;
  overlayEl.appendChild(msg);

  document.body.appendChild(overlayEl);
}

/** Hide the full-page loading overlay. */
export function hideLoadingOverlay() {
  if (overlayEl) {
    overlayEl.remove();
    overlayEl = null;
  }
}
