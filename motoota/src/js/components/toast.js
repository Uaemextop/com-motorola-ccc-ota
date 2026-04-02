import Toastify from 'toastify-js';
import 'toastify-js/src/toastify.css';

const TYPE_STYLES = {
  success: {
    background: 'linear-gradient(135deg, #166534, #22c55e)',
    icon: 'fa-circle-check',
  },
  error: {
    background: 'linear-gradient(135deg, #991b1b, #ef4444)',
    icon: 'fa-circle-xmark',
  },
  warning: {
    background: 'linear-gradient(135deg, #854d0e, #eab308)',
    icon: 'fa-triangle-exclamation',
  },
  info: {
    background: 'linear-gradient(135deg, #0e4a5c, #00d4ff)',
    icon: 'fa-circle-info',
  },
};

/**
 * Show a toast notification.
 * @param {string} message
 * @param {'success'|'error'|'warning'|'info'} [type='info']
 * @param {number} [duration=3000] - Auto-dismiss in ms
 */
export function showToast(message, type = 'info', duration = 3000) {
  const style = TYPE_STYLES[type] || TYPE_STYLES.info;

  Toastify({
    text: message,
    duration,
    gravity: 'top',
    position: 'right',
    stopOnFocus: true,
    style: {
      background: style.background,
      borderRadius: 'var(--radius-md, 8px)',
      fontFamily: 'var(--font-family, sans-serif)',
      fontSize: 'var(--font-size-sm, 0.875rem)',
      boxShadow: 'var(--shadow-lg, 0 10px 15px rgba(0, 0, 0, 0.5))',
      padding: '12px 16px',
    },
  }).showToast();
}
