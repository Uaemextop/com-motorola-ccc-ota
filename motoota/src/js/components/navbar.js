import DOMPurify from 'dompurify';

const NAV_LINKS = [
  { label: 'Home', hash: '#home', icon: 'fa-house' },
  { label: 'Check', hash: '#check', icon: 'fa-magnifying-glass' },
  { label: 'Chain', hash: '#chain', icon: 'fa-link' },
  { label: 'Scan', hash: '#scan', icon: 'fa-radar' },
  { label: 'Carriers', hash: '#carriers', icon: 'fa-tower-cell' },
  { label: 'Servers', hash: '#servers', icon: 'fa-server' },
  { label: 'Config', hash: '#config', icon: 'fa-gear' },
];

function injectNavbarStyles() {
  if (document.getElementById('moto-navbar-styles')) return;
  const style = document.createElement('style');
  style.id = 'moto-navbar-styles';
  style.textContent = `
    .moto-navbar {
      position: fixed;
      top: 0;
      left: 0;
      right: 0;
      z-index: var(--z-sticky, 200);
      background: #131a2b;
      border-bottom: 2px solid var(--color-cyan, #00d4ff);
      padding: 0 var(--space-6, 24px);
      display: flex;
      align-items: center;
      justify-content: space-between;
      height: 56px;
      font-family: var(--font-family, sans-serif);
    }

    .moto-navbar-brand {
      display: flex;
      align-items: center;
      gap: var(--space-2, 8px);
      font-size: var(--font-size-xl, 1.25rem);
      font-weight: 700;
      color: var(--color-cyan, #00d4ff);
      text-decoration: none;
      user-select: none;
    }

    .moto-navbar-brand i {
      font-size: var(--font-size-2xl, 1.5rem);
    }

    .moto-navbar-links {
      display: flex;
      align-items: center;
      gap: var(--space-1, 4px);
      list-style: none;
      margin: 0;
      padding: 0;
    }

    .moto-navbar-link {
      padding: var(--space-2, 8px) var(--space-3, 12px);
      color: var(--color-text-muted, #94a3b8);
      text-decoration: none;
      font-size: var(--font-size-sm, 0.875rem);
      font-weight: 500;
      border-radius: var(--radius-md, 8px);
      transition: color var(--transition-fast, 150ms ease),
                  background var(--transition-fast, 150ms ease);
      white-space: nowrap;
    }

    .moto-navbar-link:hover {
      color: var(--color-text, #ffffff);
      background: rgba(255, 255, 255, 0.05);
    }

    .moto-navbar-link.active {
      color: var(--color-cyan, #00d4ff);
      background: rgba(0, 212, 255, 0.1);
    }

    .moto-navbar-hamburger {
      display: none;
      background: none;
      border: none;
      color: var(--color-text-muted, #94a3b8);
      font-size: var(--font-size-xl, 1.25rem);
      cursor: pointer;
      padding: var(--space-2, 8px);
      border-radius: var(--radius-md, 8px);
      transition: color var(--transition-fast, 150ms ease);
    }

    .moto-navbar-hamburger:hover {
      color: var(--color-text, #ffffff);
    }

    @media (max-width: 768px) {
      .moto-navbar-hamburger {
        display: block;
      }

      .moto-navbar-links {
        display: none;
        position: absolute;
        top: 56px;
        left: 0;
        right: 0;
        flex-direction: column;
        background: #131a2b;
        border-bottom: 2px solid var(--color-cyan, #00d4ff);
        padding: var(--space-2, 8px) var(--space-4, 16px);
        gap: 0;
      }

      .moto-navbar-links.open {
        display: flex;
      }

      .moto-navbar-link {
        width: 100%;
        padding: var(--space-3, 12px) var(--space-4, 16px);
      }
    }
  `;
  document.head.appendChild(style);
}

/**
 * Create the top navigation bar.
 * @returns {HTMLElement}
 */
export function createNavbar() {
  injectNavbarStyles();

  const nav = document.createElement('nav');
  nav.className = 'moto-navbar';

  const brand = document.createElement('a');
  brand.className = 'moto-navbar-brand';
  brand.href = '#home';
  brand.innerHTML = DOMPurify.sanitize(
    '<i class="fa-solid fa-mobile-screen"></i> MotoOTA',
  );

  const ul = document.createElement('ul');
  ul.className = 'moto-navbar-links';

  NAV_LINKS.forEach(({ label, hash }) => {
    const li = document.createElement('li');
    const a = document.createElement('a');
    a.className = 'moto-navbar-link';
    a.href = hash;
    a.dataset.nav = hash;
    a.textContent = label;
    li.appendChild(a);
    ul.appendChild(li);
  });

  const hamburger = document.createElement('button');
  hamburger.className = 'moto-navbar-hamburger';
  hamburger.setAttribute('aria-label', 'Toggle navigation');
  hamburger.innerHTML = DOMPurify.sanitize('<i class="fa-solid fa-bars"></i>');
  hamburger.addEventListener('click', () => ul.classList.toggle('open'));

  // Close mobile menu when a link is clicked
  ul.addEventListener('click', (e) => {
    if (e.target.classList.contains('moto-navbar-link')) {
      ul.classList.remove('open');
    }
  });

  nav.appendChild(brand);
  nav.appendChild(ul);
  nav.appendChild(hamburger);

  // Set initial active link
  updateActiveLink(window.location.hash || '#home', nav);

  return nav;
}

/**
 * Highlight the active navigation link matching the given hash.
 * @param {string} hash - e.g. '#home'
 * @param {HTMLElement} [navElement] - navbar element (defaults to DOM query)
 */
export function updateActiveLink(hash, navElement) {
  const nav = navElement || document.querySelector('.moto-navbar');
  if (!nav) return;

  const links = nav.querySelectorAll('.moto-navbar-link');
  links.forEach((link) => {
    link.classList.toggle('active', link.dataset.nav === hash);
  });
}
