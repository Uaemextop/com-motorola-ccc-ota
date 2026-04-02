import DOMPurify from 'dompurify';

function injectFooterStyles() {
  if (document.getElementById('moto-footer-styles')) return;
  const style = document.createElement('style');
  style.id = 'moto-footer-styles';
  style.textContent = `
    .moto-footer {
      background: var(--color-surface, #131a2b);
      border-top: 1px solid var(--color-border, #2a3450);
      padding: var(--space-4, 16px) var(--space-6, 24px);
      display: flex;
      align-items: center;
      justify-content: space-between;
      flex-wrap: wrap;
      gap: var(--space-3, 12px);
      font-family: var(--font-family, sans-serif);
      font-size: var(--font-size-xs, 0.75rem);
      color: var(--color-text-muted, #94a3b8);
    }

    .moto-footer-left {
      display: flex;
      align-items: center;
      gap: var(--space-2, 8px);
    }

    .moto-footer-center {
      color: var(--color-text-disabled, #64748b);
    }

    .moto-footer-right a {
      color: var(--color-text-muted, #94a3b8);
      font-size: var(--font-size-lg, 1.125rem);
      transition: color var(--transition-fast, 150ms ease);
    }

    .moto-footer-right a:hover {
      color: var(--color-text, #ffffff);
    }

    @media (max-width: 640px) {
      .moto-footer {
        flex-direction: column;
        text-align: center;
      }
    }
  `;
  document.head.appendChild(style);
}

/**
 * Create the application footer.
 * @returns {HTMLElement}
 */
export function createFooter() {
  injectFooterStyles();

  const footer = document.createElement('footer');
  footer.className = 'moto-footer';

  const left = document.createElement('div');
  left.className = 'moto-footer-left';
  left.textContent = 'MotoOTA v2.1.0 \u2014 Motorola OTA Update Checker';

  const center = document.createElement('div');
  center.className = 'moto-footer-center';
  center.textContent = '438 carriers \u00b7 6 servers \u00b7 10 regions';

  const right = document.createElement('div');
  right.className = 'moto-footer-right';
  const ghLink = document.createElement('a');
  ghLink.href = 'https://github.com';
  ghLink.target = '_blank';
  ghLink.rel = 'noopener noreferrer';
  ghLink.setAttribute('aria-label', 'GitHub');
  ghLink.innerHTML = DOMPurify.sanitize('<i class="fa-brands fa-github"></i>');
  right.appendChild(ghLink);

  footer.appendChild(left);
  footer.appendChild(center);
  footer.appendChild(right);

  return footer;
}
