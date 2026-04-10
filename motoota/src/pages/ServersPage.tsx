/* ── Servers Page ───────────────────────────────────────────── */

import { motion } from 'framer-motion';
import {
  Server,
  Globe2,
  CheckCircle2,
  XCircle,
  ExternalLink,
  Activity,
} from 'lucide-react';
import GlassCard from '@/components/ui/GlassCard';
import JsonViewer from '@/components/ui/JsonViewer';
import { REGIONS, getServersByRegion } from '@/lib/api/servers';
import { useAppStore } from '@/lib/store';
import { cn } from '@/lib/utils';

export default function ServersPage() {
  const { config, updateConfig } = useAppStore();

  return (
    <div className="mx-auto max-w-4xl space-y-6">
      <GlassCard>
        <h3 className="mb-2 flex items-center gap-2 text-lg font-semibold text-white">
          <Server className="h-5 w-5 text-amber-400" />
          Servidores CDS de Motorola
        </h3>
        <p className="text-sm text-gray-400">
          El Content Delivery System (CDS) de Motorola distribuye las actualizaciones OTA
          a través de múltiples servidores en diferentes regiones.
        </p>
      </GlassCard>

      {REGIONS.map((region) => {
        const servers = getServersByRegion(region);
        return (
          <div key={region} className="space-y-3">
            <div className="flex items-center gap-2">
              <Globe2 className="h-4 w-4 text-blue-400" />
              <h4 className="text-sm font-semibold text-white">{region}</h4>
              <span className="rounded-full bg-white/5 px-2 py-0.5 text-[10px] text-gray-500">
                {servers.length} servidor{servers.length > 1 ? 'es' : ''}
              </span>
            </div>

            <div className="grid gap-3 sm:grid-cols-2">
              {servers.map((server, i) => {
                const isSelected = config.server === server.id;
                const isActive = server.status === 'active';

                return (
                  <motion.div
                    key={server.id}
                    initial={{ opacity: 0, y: 10 }}
                    animate={{ opacity: 1, y: 0 }}
                    transition={{ delay: i * 0.1 }}
                  >
                    <button
                      onClick={() => updateConfig({ server: server.id })}
                      className={cn(
                        'w-full rounded-2xl border p-5 text-left transition-all duration-200',
                        isSelected
                          ? 'border-blue-500/30 bg-blue-500/5 shadow-lg shadow-blue-500/5'
                          : 'border-white/5 bg-white/[0.02] hover:border-white/10 hover:bg-white/[0.04]',
                      )}
                    >
                      <div className="flex items-start justify-between">
                        <div className="flex items-center gap-2">
                          <div
                            className={cn(
                              'flex h-9 w-9 items-center justify-center rounded-lg',
                              isActive ? 'bg-emerald-500/10' : 'bg-gray-500/10',
                            )}
                          >
                            <Activity
                              className={cn(
                                'h-4 w-4',
                                isActive ? 'text-emerald-400' : 'text-gray-500',
                              )}
                            />
                          </div>
                          <div>
                            <h5 className="font-semibold text-white">{server.name}</h5>
                            <p className="font-mono text-xs text-gray-500">{server.host}</p>
                          </div>
                        </div>
                        <div className="flex items-center gap-1.5">
                          {isActive ? (
                            <CheckCircle2 className="h-4 w-4 text-emerald-400" />
                          ) : (
                            <XCircle className="h-4 w-4 text-gray-600" />
                          )}
                          {isSelected && (
                            <span className="rounded-full bg-blue-500/20 px-2 py-0.5 text-[10px] font-medium text-blue-400">
                              Activo
                            </span>
                          )}
                        </div>
                      </div>
                      <p className="mt-3 text-xs leading-relaxed text-gray-400">
                        {server.description}
                      </p>
                      <div className="mt-3 flex items-center gap-1 text-[10px] text-gray-600">
                        <ExternalLink className="h-3 w-3" />
                        https://{server.host}
                      </div>
                    </button>
                  </motion.div>
                );
              })}
            </div>
          </div>
        );
      })}

      {/* API Info */}
      <GlassCard className="space-y-3">
        <h4 className="text-sm font-semibold text-white">Información de la API</h4>
        <div className="space-y-2 text-xs text-gray-400">
          <div className="flex items-center gap-2">
            <span className="rounded bg-blue-500/10 px-1.5 py-0.5 font-mono text-blue-400">POST</span>
            <code className="font-mono text-gray-300">/cds/upgrade/1/check/ctx/{'{context}'}/key/{'{guid}'}</code>
          </div>
          <p>Endpoint principal para verificar actualizaciones OTA.</p>
          <div className="rounded-xl border border-amber-500/20 bg-amber-500/[0.04] p-3 shadow-lg shadow-amber-500/5">
            <p className="mb-1 text-[10px] uppercase tracking-wider text-gray-500">Headers</p>
            <JsonViewer
              data={{
                'Content-Type': 'application/json; charset=utf-8',
                'User-Agent': 'com.motorola.ccc.ota',
                'Accept-Encoding': 'gzip',
                'Connection': 'Keep-Alive',
              }}
              accent="amber"
              maxHeight="200px"
            />
          </div>
        </div>
      </GlassCard>
    </div>
  );
}
