import { HashRouter, Routes, Route, Navigate } from 'react-router-dom';
import Layout from './components/Layout';
import HomePage from './pages/HomePage';
import CheckPage from './pages/CheckPage';
import ScanPage from './pages/ScanPage';
import ChainPage from './pages/ChainPage';
import CarriersPage from './pages/CarriersPage';
import ServersPage from './pages/ServersPage';
import ConfigPage from './pages/ConfigPage';

export default function App() {
  return (
    <HashRouter>
      <Routes>
        <Route element={<Layout />}>
          <Route index element={<HomePage />} />
          <Route path="check" element={<CheckPage />} />
          <Route path="scan" element={<ScanPage />} />
          <Route path="chain" element={<ChainPage />} />
          <Route path="carriers" element={<CarriersPage />} />
          <Route path="servers" element={<ServersPage />} />
          <Route path="config" element={<ConfigPage />} />
          <Route path="*" element={<Navigate to="/" replace />} />
        </Route>
      </Routes>
    </HashRouter>
  );
}
