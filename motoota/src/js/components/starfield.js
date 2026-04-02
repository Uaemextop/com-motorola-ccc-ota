const LAYER_COUNT = 3;
const STAR_COUNTS = [80, 50, 30]; // near → far
const STAR_SPEEDS = [0.3, 0.15, 0.07];
const STAR_SIZES = [2, 1.5, 1];
const STAR_COLORS = ['#ffffff', '#00d4ff', 'rgba(255,255,255,0.6)'];

let animationId = null;
let stars = [];
let canvasRef = null;
let ctxRef = null;

function createStars(width, height) {
  stars = [];
  for (let layer = 0; layer < LAYER_COUNT; layer++) {
    for (let i = 0; i < STAR_COUNTS[layer]; i++) {
      stars.push({
        x: Math.random() * width,
        y: Math.random() * height,
        size: STAR_SIZES[layer] * (0.5 + Math.random() * 0.5),
        speed: STAR_SPEEDS[layer] * (0.7 + Math.random() * 0.6),
        color: STAR_COLORS[layer],
        opacity: 0.3 + Math.random() * 0.7,
      });
    }
  }
}

function resizeCanvas() {
  if (!canvasRef) return;
  canvasRef.width = canvasRef.clientWidth * (window.devicePixelRatio || 1);
  canvasRef.height = canvasRef.clientHeight * (window.devicePixelRatio || 1);
  if (ctxRef) {
    ctxRef.setTransform(
      window.devicePixelRatio || 1, 0,
      0, window.devicePixelRatio || 1,
      0, 0,
    );
  }
  createStars(canvasRef.clientWidth, canvasRef.clientHeight);
}

function draw() {
  if (!ctxRef || !canvasRef) return;
  const w = canvasRef.clientWidth;
  const h = canvasRef.clientHeight;

  ctxRef.clearRect(0, 0, w, h);

  stars.forEach((star) => {
    ctxRef.globalAlpha = star.opacity;
    ctxRef.fillStyle = star.color;
    ctxRef.beginPath();
    ctxRef.arc(star.x, star.y, star.size, 0, Math.PI * 2);
    ctxRef.fill();

    // Move star slowly to the left
    star.x -= star.speed;
    if (star.x < -star.size) {
      star.x = w + star.size;
      star.y = Math.random() * h;
    }
  });

  ctxRef.globalAlpha = 1;
  animationId = requestAnimationFrame(draw);
}

/**
 * Initialize the starfield animation on a canvas element.
 * @param {HTMLCanvasElement} canvasElement
 */
export function initStarfield(canvasElement) {
  destroyStarfield();

  canvasRef = canvasElement;
  ctxRef = canvasElement.getContext('2d');

  canvasElement.style.position = canvasElement.style.position || 'fixed';
  canvasElement.style.inset = '0';
  canvasElement.style.width = '100%';
  canvasElement.style.height = '100%';
  canvasElement.style.pointerEvents = 'none';
  canvasElement.style.zIndex = '-1';

  resizeCanvas();
  window.addEventListener('resize', resizeCanvas);
  animationId = requestAnimationFrame(draw);
}

/** Stop the starfield animation and clean up. */
export function destroyStarfield() {
  if (animationId != null) {
    cancelAnimationFrame(animationId);
    animationId = null;
  }
  window.removeEventListener('resize', resizeCanvas);
  stars = [];
  canvasRef = null;
  ctxRef = null;
}
