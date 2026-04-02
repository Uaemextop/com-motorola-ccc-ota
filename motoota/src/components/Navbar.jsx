import { NavLink } from 'react-router-dom';
import { useState } from 'react';
import { Menu, X, Shield } from 'lucide-react';
import { cn } from '@/lib/cn';
import { motion, AnimatePresence } from 'framer-motion';

const links = [
  { to: '/', label: 'Inicio' },
  { to: '/check', label: 'Verificar' },
  { to: '/scan', label: 'Escanear' },
  { to: '/chain', label: 'Cadena' },
  { to: '/carriers', label: 'Carriers' },
  { to: '/servers', label: 'Servidores' },
  { to: '/config', label: 'Config' },
];

export default function Navbar() {
  const [open, setOpen] = useState(false);

  return (
    <nav className="fixed top-0 left-0 right-0 z-50 bg-[#131a2b]/85 backdrop-blur-xl border-b border-[#00d4ff]/20">
      <div className="max-w-7xl mx-auto px-4 sm:px-6 h-14 flex items-center justify-between">
        <NavLink to="/" className="flex items-center gap-2 text-[#00d4ff] font-bold text-lg">
          <Shield className="w-5 h-5" />
          MotoOTA
        </NavLink>

        {/* Desktop */}
        <div className="hidden md:flex items-center gap-1">
          {links.map(({ to, label }) => (
            <NavLink
              key={to}
              to={to}
              end={to === '/'}
              className={({ isActive }) =>
                cn(
                  'px-3 py-1.5 rounded-lg text-sm font-medium transition-colors',
                  isActive
                    ? 'text-[#00d4ff] bg-[#00d4ff]/10'
                    : 'text-slate-400 hover:text-white hover:bg-white/5'
                )
              }
            >
              {label}
            </NavLink>
          ))}
        </div>

        {/* Mobile toggle */}
        <button className="md:hidden text-slate-400" onClick={() => setOpen(!open)}>
          {open ? <X className="w-5 h-5" /> : <Menu className="w-5 h-5" />}
        </button>
      </div>

      {/* Mobile menu */}
      <AnimatePresence>
        {open && (
          <motion.div
            initial={{ opacity: 0, height: 0 }}
            animate={{ opacity: 1, height: 'auto' }}
            exit={{ opacity: 0, height: 0 }}
            className="md:hidden bg-[#131a2b]/95 backdrop-blur-xl border-b border-[#00d4ff]/20 overflow-hidden"
          >
            <div className="px-4 py-2 flex flex-col gap-1">
              {links.map(({ to, label }) => (
                <NavLink
                  key={to}
                  to={to}
                  end={to === '/'}
                  onClick={() => setOpen(false)}
                  className={({ isActive }) =>
                    cn(
                      'px-3 py-2 rounded-lg text-sm font-medium',
                      isActive ? 'text-[#00d4ff] bg-[#00d4ff]/10' : 'text-slate-400'
                    )
                  }
                >
                  {label}
                </NavLink>
              ))}
            </div>
          </motion.div>
        )}
      </AnimatePresence>
    </nav>
  );
}
