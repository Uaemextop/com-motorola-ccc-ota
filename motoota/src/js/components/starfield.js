const LAYER_COUNT = 3;
const STAR_COUNTS = [100, 60, 35]; // near → far
const STAR_SPEEDS = [0.3, 0.15, 0.07];
const STAR_SIZES = [2, 1.5, 1];
const STAR_COLORS = ['#ffffff', '#00d4ff', 'rgba(255,255,255,0.6)'];

/* Floating particles — larger, slower, semi-transparent orbs */
const PARTICLE_COUNT = 8;

let animationId = null;
let stars = [];
let particles = [];
let canvasRef = null;
let ctxRef = null;
let frameCount = 0;

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
        twinklePhase: Math.random() * Math.PI * 2,
        twinkleSpeed: 0.01 + Math.random() * 0.02,
      });
    }
  }
  particles = [];
  for (let i = 0; i < PARTICLE_COUNT; i++) {
    particles.push({
      x: Math.random() * width,
      y: Math.random() * height,
      size: 30 + Math.random() * 70,
      vx: (Math.random() - 0.5) * 0.15,
      vy: (Math.random() - 0.5) * 0.15,
      hue: Math.random() > 0.5 ? 190 : 220, // cyan or blue range
      opacity: 0.015 + Math.random() * 0.025,
    });
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
  frameCount++;

  ctxRef.clearRect(0, 0, w, h);

  // Draw floating particles (background orbs)
  particles.forEach((p) => {
    const gradient = ctxRef.createRadialGradient(p.x, p.y, 0, p.x, p.y, p.size);
    gradient.addColorStop(0, `hsla(${p.hue}, 100%, 50%, ${p.opacity})`);
    gradient.addColorStop(1, `hsla(${p.hue}, 100%, 50%, 0)`);
    ctxRef.globalAlpha = 1;
    ctxRef.fillStyle = gradient;
    ctxRef.beginPath();
    ctxRef.arc(p.x, p.y, p.size, 0, Math.PI * 2);
    ctxRef.fill();

    p.x += p.vx;
    p.y += p.vy;
    if (p.x < -p.size) p.x = w + p.size;
    if (p.x > w + p.size) p.x = -p.size;
    if (p.y < -p.size) p.y = h + p.size;
    if (p.y > h + p.size) p.y = -p.size;
  });

  // Draw stars with twinkle
  stars.forEach((star) => {
    const twinkle = 0.5 + 0.5 * Math.sin(star.twinklePhase + frameCount * star.twinkleSpeed);
    ctxRef.globalAlpha = star.opacity * twinkle;
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
  particles = [];
  frameCount = 0;
  canvasRef = null;
  ctxRef = null;
}
