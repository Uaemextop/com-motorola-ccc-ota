import DOMPurify from 'dompurify';

let activeOverlay = null;

function injectModalStyles() {
  if (document.getElementById('moto-modal-styles')) return;
  const style = document.createElement('style');
  style.id = 'moto-modal-styles';
  style.textContent = `
    .moto-modal-overlay {
      position: fixed;
      inset: 0;
      z-index: var(--z-modal, 300);
      display: flex;
      align-items: center;
      justify-content: center;
      background: rgba(0, 0, 0, 0.6);
      backdrop-filter: blur(4px);
      -webkit-backdrop-filter: blur(4px);
      padding: var(--space-4, 16px);
      font-family: var(--font-family, sans-serif);
    }

    .moto-modal {
      background: var(--color-card, #1a2235);
      border: 1px solid var(--color-border, #2a3450);
      border-radius: var(--radius-xl, 16px);
      box-shadow: var(--shadow-xl, 0 20px 25px rgba(0, 0, 0, 0.6));
      width: 100%;
      max-width: 560px;
      max-height: 90vh;
      overflow-y: auto;
      animation: scaleIn var(--transition-base, 250ms ease) both;
    }

    .moto-modal-header {
      display: flex;
      align-items: center;
      justify-content: space-between;
      padding: var(--space-4, 16px) var(--space-6, 24px);
      border-bottom: 1px solid var(--color-border, #2a3450);
    }

    .moto-modal-title {
      font-size: var(--font-size-lg, 1.125rem);
      font-weight: 600;
      color: var(--color-text, #ffffff);
      margin: 0;
    }

    .moto-modal-close {
      background: none;
      border: none;
      color: var(--color-text-muted, #94a3b8);
      font-size: var(--font-size-xl, 1.25rem);
      cursor: pointer;
      padding: var(--space-1, 4px);
      border-radius: var(--radius-sm, 4px);
      transition: color var(--transition-fast, 150ms ease);
      display: flex;
      align-items: center;
      justify-content: center;
    }

    .moto-modal-close:hover {
      color: var(--color-text, #ffffff);
    }

    .moto-modal-body {
      padding: var(--space-6, 24px);
      color: var(--color-text-muted, #94a3b8);
      font-size: var(--font-size-sm, 0.875rem);
      line-height: 1.6;
    }

    .moto-modal-footer {
      display: flex;
      align-items: center;
      justify-content: flex-end;
      gap: var(--space-3, 12px);
      padding: var(--space-4, 16px) var(--space-6, 24px);
      border-top: 1px solid var(--color-border, #2a3450);
    }
  `;
  document.head.appendChild(style);
}

function handleEscape(e) {
  if (e.key === 'Escape') closeModal();
}

/**
 * Open a modal dialog.
 * @param {object} options
 * @param {string}   options.title
 * @param {string|HTMLElement} options.content - HTML string (sanitized) or DOM element
 * @param {Array<{label:string, className?:string, onClick?:Function}>} [options.actions]
 * @param {Function} [options.onClose]
 */
export function openModal(options = {}) {
  injectModalStyles();
  closeModal(); // close any existing modal

  const overlay = document.createElement('div');
  overlay.className = 'moto-modal-overlay';

  const modal = document.createElement('div');
  modal.className = 'moto-modal';

  // Header
  const header = document.createElement('div');
  header.className = 'moto-modal-header';

  const title = document.createElement('h2');
  title.className = 'moto-modal-title';
  title.textContent = options.title || '';
  header.appendChild(title);

  const closeBtn = document.createElement('button');
  closeBtn.className = 'moto-modal-close';
  closeBtn.setAttribute('aria-label', 'Close');
  closeBtn.innerHTML = DOMPurify.sanitize('<i class="fa-solid fa-xmark"></i>');
  closeBtn.addEventListener('click', () => {
    closeModal();
    if (options.onClose) options.onClose();
  });
  header.appendChild(closeBtn);
  modal.appendChild(header);

  // Body
  const body = document.createElement('div');
  body.className = 'moto-modal-body';
  if (typeof options.content === 'string') {
    body.innerHTML = DOMPurify.sanitize(options.content);
  } else if (options.content instanceof HTMLElement) {
    body.appendChild(options.content);
  }
  modal.appendChild(body);

  // Footer actions
  if (options.actions && options.actions.length) {
    const footer = document.createElement('div');
    footer.className = 'moto-modal-footer';
    options.actions.forEach(({ label, className, onClick }) => {
      const btn = document.createElement('button');
      btn.className = `btn ${className || ''}`.trim();
      btn.textContent = label;
      if (onClick) btn.addEventListener('click', onClick);
      footer.appendChild(btn);
    });
    modal.appendChild(footer);
  }

  // Close on overlay click
  overlay.addEventListener('click', (e) => {
    if (e.target === overlay) {
      closeModal();
      if (options.onClose) options.onClose();
    }
  });

  overlay.appendChild(modal);
  document.body.appendChild(overlay);
  activeOverlay = overlay;

  document.addEventListener('keydown', handleEscape);
}

/** Close the currently open modal. */
export function closeModal() {
  if (activeOverlay) {
    activeOverlay.remove();
    activeOverlay = null;
  }
  document.removeEventListener('keydown', handleEscape);
}

/**
 * Create a confirmation modal.
 * @param {string}   title
 * @param {string}   message
 * @param {Function} onConfirm
 */
export function createConfirmModal(title, message, onConfirm) {
  openModal({
    title,
    content: `<p>${DOMPurify.sanitize(message)}</p>`,
    actions: [
      { label: 'Cancel', className: 'btn-secondary', onClick: closeModal },
      {
        label: 'Confirm',
        className: 'btn-primary',
        onClick: () => {
          closeModal();
          if (onConfirm) onConfirm();
        },
      },
    ],
  });
}
