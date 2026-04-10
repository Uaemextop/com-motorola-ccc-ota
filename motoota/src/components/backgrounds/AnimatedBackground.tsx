/* ── Animated Starfield Background (CSS-only, GPU-optimized) ── */

export default function AnimatedBackground() {
  return (
    <div className="fixed inset-0 -z-10 overflow-hidden" aria-hidden="true">
      <div className="absolute inset-0 bg-gradient-to-br from-[#0a0a1a] via-[#0f0f23] to-[#0a0a0f]" />

      {/* Star layers — use contain for GPU compositing perf */}
      <div className="stars-sm" style={{ contain: 'strict' }} />
      <div className="stars-md" style={{ contain: 'strict' }} />
      <div className="stars-lg" style={{ contain: 'strict' }} />

      {/* Radial vignette */}
      <div className="absolute inset-0 bg-[radial-gradient(ellipse_at_center,transparent_0%,rgba(10,10,15,0.8)_70%)]" />
    </div>
  );
}
