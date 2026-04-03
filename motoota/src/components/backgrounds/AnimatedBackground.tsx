/* ── Animated Starfield Background (CSS-only) ──────────────── */

export default function AnimatedBackground() {
  return (
    <div className="fixed inset-0 -z-10 overflow-hidden">
      <div className="absolute inset-0 bg-gradient-to-br from-[#0a0a1a] via-[#0f0f23] to-[#0a0a0f]" />

      {/* Star layers */}
      <div className="stars-sm" />
      <div className="stars-md" />
      <div className="stars-lg" />

      {/* Radial vignette */}
      <div className="absolute inset-0 bg-[radial-gradient(ellipse_at_center,transparent_0%,rgba(10,10,15,0.8)_70%)]" />
    </div>
  );
}
