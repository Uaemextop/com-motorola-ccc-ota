import { useMemo } from 'react';
import Particles from '@tsparticles/react';

export default function ParticlesBg() {
  const options = useMemo(() => ({
    fullScreen: { enable: false },
    fpsLimit: 60,
    particles: {
      number: { value: 60, density: { enable: true, area: 1200 } },
      color: { value: ['#ffffff', '#00d4ff', '#94a3b8'] },
      opacity: { value: { min: 0.1, max: 0.6 }, animation: { enable: true, speed: 0.5, minimumValue: 0.1 } },
      size: { value: { min: 0.5, max: 2 } },
      move: { enable: true, speed: 0.3, direction: 'left', outModes: { default: 'out' } },
    },
    detectRetina: true,
  }), []);

  return (
    <Particles
      id="tsparticles"
      options={options}
      className="fixed inset-0 z-0 pointer-events-none"
    />
  );
}
