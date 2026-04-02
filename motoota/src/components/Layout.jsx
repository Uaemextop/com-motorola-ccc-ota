import { Outlet } from 'react-router-dom';
import Navbar from './Navbar';
import Footer from './Footer';
import ParticlesBg from './ParticlesBg';

export default function Layout() {
  return (
    <div className="relative min-h-screen flex flex-col">
      <ParticlesBg />
      <Navbar />
      <main className="flex-1 pt-16 pb-8 relative z-10">
        <Outlet />
      </main>
      <Footer />
    </div>
  );
}
