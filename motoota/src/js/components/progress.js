function injectProgressStyles() {
  if (document.getElementById('moto-progress-styles')) return;
  const style = document.createElement('style');
  style.id = 'moto-progress-styles';
  style.textContent = `
    .moto-progress {
      width: 100%;
      font-family: var(--font-family, sans-serif);
    }

    .moto-progress-label {
      display: flex;
      align-items: center;
      justify-content: space-between;
      margin-bottom: var(--space-2, 8px);
      font-size: var(--font-size-xs, 0.75rem);
      color: var(--color-text-muted, #94a3b8);
    }

    .moto-progress-track {
      width: 100%;
      height: 6px;
      background: var(--color-surface, #131a2b);
      border-radius: var(--radius-full, 9999px);
      overflow: hidden;
    }

    .moto-progress-track--lg {
      height: 10px;
    }

    .moto-progress-fill {
      height: 100%;
      border-radius: var(--radius-full, 9999px);
      background: linear-gradient(90deg,
        var(--color-cyan, #00d4ff),
        var(--color-bright-cyan, #5eead4));
      transition: width var(--transition-slow, 350ms ease);
    }

    .moto-progress-fill--indeterminate {
      width: 40% !important;
      animation: motoProgressIndeterminate 1.5s ease-in-out infinite;
    }

    @keyframes motoProgressIndeterminate {
      0%   { transform: translateX(-100%); }
      100% { transform: translateX(350%); }
    }

    /* Color variants */
    .moto-progress-fill--green {
      background: linear-gradient(90deg, #166534, #22c55e);
    }
    .moto-progress-fill--yellow {
      background: linear-gradient(90deg, #854d0e, #eab308);
    }
    .moto-progress-fill--red {
      background: linear-gradient(90deg, #991b1b, #ef4444);
    }

    /* Multi-step progress */
    .moto-multi-progress {
      font-family: var(--font-family, sans-serif);
    }

    .moto-multi-step {
      display: flex;
      align-items: center;
      gap: var(--space-3, 12px);
      padding: var(--space-2, 8px) 0;
    }

    .moto-multi-step-indicator {
      width: 24px;
      height: 24px;
      border-radius: 50%;
      display: flex;
      align-items: center;
      justify-content: center;
      font-size: var(--font-size-xs, 0.75rem);
      font-weight: 700;
      flex-shrink: 0;
      background: var(--color-surface, #131a2b);
      border: 2px solid var(--color-border, #2a3450);
      color: var(--color-text-disabled, #64748b);
    }

    .moto-multi-step-indicator--active {
      border-color: var(--color-cyan, #00d4ff);
      color: var(--color-cyan, #00d4ff);
      box-shadow: 0 0 8px rgba(0, 212, 255, 0.3);
    }

    .moto-multi-step-indicator--done {
      background: var(--color-green, #22c55e);
      border-color: var(--color-green, #22c55e);
      color: #ffffff;
    }

    .moto-multi-step-content {
      flex: 1;
      min-width: 0;
    }

    .moto-multi-step-title {
      font-size: var(--font-size-sm, 0.875rem);
      color: var(--color-text, #ffffff);
      font-weight: 500;
    }

    .moto-multi-step-title--muted {
      color: var(--color-text-disabled, #64748b);
    }
  `;
  document.head.appendChild(style);
}

/**
 * Create a progress bar.
 * @param {object} [options]
 * @param {number}  [options.value=0]
 * @param {number}  [options.max=100]
 * @param {boolean} [options.indeterminate=false]
 * @param {string}  [options.label]
 * @param {boolean} [options.showPercent=true]
 * @param {'cyan'|'green'|'yellow'|'red'} [options.color='cyan']
 * @param {'sm'|'lg'} [options.size]
 * @returns {{ element: HTMLElement, setValue: (v:number) => void, setIndeterminate: (b:boolean) => void }}
 */
export function createProgressBar(options = {}) {
  injectProgressStyles();

  const {
    value = 0,
    max = 100,
    indeterminate = false,
    label = '',
    showPercent = true,
    color = 'cyan',
    size,
  } = options;

  const container = document.createElement('div');
  container.className = 'moto-progress';

  // Label row
  const labelRow = document.createElement('div');
  labelRow.className = 'moto-progress-label';
  const labelText = document.createElement('span');
  labelText.textContent = label;
  const percentText = document.createElement('span');
  labelRow.appendChild(labelText);
  labelRow.appendChild(percentText);
  if (label || showPercent) container.appendChild(labelRow);

  // Track
  const track = document.createElement('div');
  track.className = `moto-progress-track${size === 'lg' ? ' moto-progress-track--lg' : ''}`;
  const fill = document.createElement('div');
  const colorClass = color !== 'cyan' ? ` moto-progress-fill--${color}` : '';
  fill.className = `moto-progress-fill${colorClass}`;
  track.appendChild(fill);
  container.appendChild(track);

  function update(v, isIndeterminate) {
    if (isIndeterminate) {
      fill.classList.add('moto-progress-fill--indeterminate');
      fill.style.width = '';
      percentText.textContent = '';
    } else {
      fill.classList.remove('moto-progress-fill--indeterminate');
      const pct = Math.min(100, Math.max(0, (v / max) * 100));
      fill.style.width = `${pct}%`;
      if (showPercent) percentText.textContent = `${Math.round(pct)}%`;
    }
  }

  update(value, indeterminate);

  return {
    element: container,
    setValue(v) { update(v, false); },
    setIndeterminate(b) { update(value, b); },
  };
}

/**
 * Create a multi-step progress indicator (for chain downloads).
 * @param {Array<{label:string}>} steps
 * @returns {{ element: HTMLElement, setActive: (index:number) => void, setDone: (index:number) => void }}
 */
export function createMultiProgress(steps) {
  injectProgressStyles();

  const container = document.createElement('div');
  container.className = 'moto-multi-progress';
  const stepEls = [];

  steps.forEach((step, i) => {
    const row = document.createElement('div');
    row.className = 'moto-multi-step';

    const indicator = document.createElement('div');
    indicator.className = 'moto-multi-step-indicator';
    indicator.textContent = String(i + 1);
    row.appendChild(indicator);

    const content = document.createElement('div');
    content.className = 'moto-multi-step-content';
    const title = document.createElement('div');
    title.className = 'moto-multi-step-title moto-multi-step-title--muted';
    title.textContent = step.label;
    content.appendChild(title);
    row.appendChild(content);

    container.appendChild(row);
    stepEls.push({ indicator, title });
  });

  return {
    element: container,
    setActive(index) {
      stepEls.forEach((el, i) => {
        el.indicator.classList.toggle('moto-multi-step-indicator--active', i === index);
        el.title.classList.toggle('moto-multi-step-title--muted', i > index);
      });
    },
    setDone(index) {
      if (stepEls[index]) {
        stepEls[index].indicator.classList.remove('moto-multi-step-indicator--active');
        stepEls[index].indicator.classList.add('moto-multi-step-indicator--done');
        stepEls[index].indicator.textContent = '\u2713';
      }
    },
  };
}
