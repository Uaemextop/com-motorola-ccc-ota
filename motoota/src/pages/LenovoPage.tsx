/* ── Lenovo Software Fix Page ────────────────────────────────── */

import { useState, useCallback } from 'react';
import { motion, AnimatePresence } from 'framer-motion';
import {
  Search,
  Download,
  Smartphone,
  ChevronRight,
  ExternalLink,
  Cpu,
  Tag,
  HardDrive,
  Wrench,
  FileDown,
  AlertCircle,
  CheckCircle,
  ChevronDown,
} from 'lucide-react';
import GlassCard from '@/components/ui/GlassCard';
import Spinner from '@/components/ui/Spinner';
import type {
  LenovoModel,
  LenovoFirmwareResource,
} from '@/lib/types';
import { getModelNames, getResource, LENOVO_BRANDS } from '@/lib/api/lenovo';
import { cn } from '@/lib/utils';

/* ── Helpers ─────────────────────────────────────────────────── */

function formatFileSize(bytes: number): string {
  if (bytes === 0) return '—';
  const units = ['B', 'KB', 'MB', 'GB'];
  const i = Math.floor(Math.log(bytes) / Math.log(1024));
  return `${(bytes / 1024 ** i).toFixed(1)} ${units[i]}`;
}

/* ── Sub-components ──────────────────────────────────────────── */

function ModelCard({
  model,
  selected,
  onClick,
}: {
  model: LenovoModel;
  selected: boolean;
  onClick: () => void;
}) {
  return (
    <motion.button
      whileHover={{ scale: 1.02 }}
      whileTap={{ scale: 0.98 }}
      onClick={onClick}
      className={cn(
        'flex items-center gap-3 rounded-xl border p-3 text-left transition-all',
        selected
          ? 'border-emerald-500/40 bg-emerald-500/10 shadow-lg shadow-emerald-500/5'
          : 'border-white/5 bg-white/[0.02] hover:border-white/10 hover:bg-white/[0.04]',
      )}
    >
      <div
        className={cn(
          'flex h-10 w-10 shrink-0 items-center justify-center rounded-lg',
          selected
            ? 'bg-emerald-500/20 text-emerald-400'
            : 'bg-white/5 text-gray-400',
        )}
      >
        <Smartphone className="h-5 w-5" />
      </div>
      <div className="min-w-0 flex-1">
        <p className="truncate text-sm font-semibold text-white">
          {model.marketName || model.modelName}
        </p>
        <p className="truncate text-xs text-gray-400">
          {model.modelName} · {model.brand} · {model.platform}
        </p>
      </div>
      {selected && <CheckCircle className="h-5 w-5 shrink-0 text-emerald-400" />}
    </motion.button>
  );
}

function ResourceCard({ resource }: { resource: LenovoFirmwareResource }) {
  const [expanded, setExpanded] = useState(false);

  return (
    <GlassCard className="overflow-hidden">
      <div className="space-y-4 p-5">
        {/* Header */}
        <div className="flex items-start justify-between">
          <div>
            <h3 className="text-lg font-bold text-white">
              {resource.marketName || resource.modelName}
            </h3>
            <p className="text-sm text-gray-400">
              {resource.modelName} · {resource.brand} · {resource.platform}
            </p>
          </div>
          {resource.fingerPrint && (
            <span className="rounded-full bg-emerald-500/10 px-3 py-1 text-xs font-medium text-emerald-400">
              <Tag className="mr-1 inline h-3 w-3" />
              {resource.fingerPrint.split('/').pop()?.replace(':user/', ' ') || resource.fingerPrint}
            </span>
          )}
        </div>

        {/* Comments/Variants */}
        {resource.comments && (
          <div className="rounded-lg bg-white/[0.03] p-3">
            <p className="text-xs font-medium text-gray-500 uppercase">Variantes disponibles</p>
            <p className="mt-1 text-sm text-gray-300">{resource.comments}</p>
          </div>
        )}

        {/* ROM Resource */}
        {resource.romResource && (
          <div className="rounded-lg border border-emerald-500/10 bg-emerald-500/[0.03] p-4">
            <div className="flex items-center gap-2 text-emerald-400">
              <HardDrive className="h-4 w-4" />
              <span className="text-sm font-semibold">ROM Firmware</span>
            </div>
            <p className="mt-2 text-sm font-medium text-white">{resource.romResource.name}</p>
            {resource.romResource.publishDate && (
              <p className="mt-1 text-xs text-gray-400">
                Publicado: {resource.romResource.publishDate}
              </p>
            )}
            <a
              href={resource.romResource.uri}
              target="_blank"
              rel="noopener noreferrer"
              className="mt-3 inline-flex items-center gap-2 rounded-lg bg-emerald-500/20 px-4 py-2 text-sm font-medium text-emerald-300 transition-colors hover:bg-emerald-500/30"
            >
              <FileDown className="h-4 w-4" />
              Descargar ROM
              <ExternalLink className="h-3 w-3" />
            </a>
          </div>
        )}

        {/* Tool Resource */}
        {resource.toolResource && (
          <div className="rounded-lg border border-blue-500/10 bg-blue-500/[0.03] p-4">
            <div className="flex items-center gap-2 text-blue-400">
              <Wrench className="h-4 w-4" />
              <span className="text-sm font-semibold">Flash Tool</span>
            </div>
            <p className="mt-2 text-sm font-medium text-white">{resource.toolResource.name}</p>
            <a
              href={resource.toolResource.uri}
              target="_blank"
              rel="noopener noreferrer"
              className="mt-3 inline-flex items-center gap-2 rounded-lg bg-blue-500/20 px-4 py-2 text-sm font-medium text-blue-300 transition-colors hover:bg-blue-500/30"
            >
              <FileDown className="h-4 w-4" />
              Descargar Tool
              <ExternalLink className="h-3 w-3" />
            </a>
          </div>
        )}

        {/* Metadata toggle */}
        <button
          onClick={() => setExpanded(!expanded)}
          className="flex w-full items-center gap-2 text-xs text-gray-500 transition-colors hover:text-gray-300"
        >
          <ChevronDown
            className={cn('h-3 w-3 transition-transform', expanded && 'rotate-180')}
          />
          Detalles técnicos
        </button>

        <AnimatePresence>
          {expanded && (
            <motion.div
              initial={{ height: 0, opacity: 0 }}
              animate={{ height: 'auto', opacity: 1 }}
              exit={{ height: 0, opacity: 0 }}
              className="overflow-hidden"
            >
              <div className="grid grid-cols-2 gap-2 text-xs">
                <div className="rounded bg-white/[0.03] p-2">
                  <span className="text-gray-500">Modelo</span>
                  <p className="text-gray-300">{resource.realModelName || resource.modelName}</p>
                </div>
                <div className="rounded bg-white/[0.03] p-2">
                  <span className="text-gray-500">Plataforma</span>
                  <p className="text-gray-300">{resource.platform}</p>
                </div>
                <div className="rounded bg-white/[0.03] p-2">
                  <span className="text-gray-500">Fastboot</span>
                  <p className="text-gray-300">{resource.fastboot ? 'Sí' : 'No'}</p>
                </div>
                <div className="rounded bg-white/[0.03] p-2">
                  <span className="text-gray-500">ROM Match</span>
                  <p className="text-gray-300">{resource.romMatchId || '—'}</p>
                </div>
                {resource.fingerPrint && (
                  <div className="col-span-2 rounded bg-white/[0.03] p-2">
                    <span className="text-gray-500">Fingerprint</span>
                    <p className="break-all text-gray-300">{resource.fingerPrint}</p>
                  </div>
                )}
              </div>
            </motion.div>
          )}
        </AnimatePresence>
      </div>
    </GlassCard>
  );
}

function SelectionStep({
  resource,
  onSelect,
}: {
  resource: LenovoFirmwareResource;
  onSelect: (property: string, value: string) => void;
}) {
  if (!resource.paramProperty || !resource.paramValues) return null;

  return (
    <GlassCard>
      <div className="p-5">
        <h3 className="text-sm font-semibold text-white">
          Seleccionar: {resource.paramProperty.label}
        </h3>
        <div className="mt-3 flex flex-wrap gap-2">
          {resource.paramValues.map((val) => (
            <button
              key={val}
              onClick={() => onSelect(resource.paramProperty!.property, val)}
              className="rounded-lg border border-white/10 bg-white/[0.03] px-4 py-2 text-sm text-gray-300 transition-all hover:border-emerald-500/30 hover:bg-emerald-500/5 hover:text-emerald-300"
            >
              {val}
            </button>
          ))}
        </div>
      </div>
    </GlassCard>
  );
}

/* ── Main Page Component ─────────────────────────────────────── */

export default function LenovoPage() {
  // Search state
  const [searchQuery, setSearchQuery] = useState('');
  const [brandFilter, setBrandFilter] = useState<string>('');
  const [models, setModels] = useState<LenovoModel[]>([]);
  const [selectedModel, setSelectedModel] = useState<LenovoModel | null>(null);
  const [loadingModels, setLoadingModels] = useState(false);

  // Firmware state
  const [resources, setResources] = useState<LenovoFirmwareResource[]>([]);
  const [selectionSteps, setSelectionSteps] = useState<LenovoFirmwareResource[]>([]);
  const [currentParams, setCurrentParams] = useState<Record<string, string>>({});
  const [loadingFirmware, setLoadingFirmware] = useState(false);

  // Error state
  const [error, setError] = useState<string | null>(null);

  // Search models
  const handleSearch = useCallback(async () => {
    setError(null);
    setLoadingModels(true);
    setModels([]);
    setSelectedModel(null);
    setResources([]);
    setSelectionSteps([]);
    setCurrentParams({});

    try {
      const result = await getModelNames({ category: 'Phone' });
      setModels(result);
    } catch (err) {
      setError(err instanceof Error ? err.message : 'Error al buscar modelos');
    } finally {
      setLoadingModels(false);
    }
  }, []);

  // Select a model → fetch initial resource parameters
  const handleSelectModel = useCallback(async (model: LenovoModel) => {
    setSelectedModel(model);
    setResources([]);
    setSelectionSteps([]);
    setCurrentParams({});
    setError(null);
    setLoadingFirmware(true);

    try {
      const result = await getResource(model.modelName, model.marketName);
      const hasParams = result.some((r) => r.paramProperty && r.paramValues);
      if (hasParams) {
        setSelectionSteps(result);
      } else {
        setResources(result.filter((r) => r.romResource || r.toolResource));
      }
    } catch (err) {
      setError(err instanceof Error ? err.message : 'Error al obtener firmware');
    } finally {
      setLoadingFirmware(false);
    }
  }, []);

  // Handle parameter selection step
  const handleParamSelect = useCallback(
    async (property: string, value: string) => {
      if (!selectedModel) return;

      setLoadingFirmware(true);
      setError(null);

      const newParams = { ...currentParams, [property]: value };
      setCurrentParams(newParams);

      try {
        const result = await getResource(
          selectedModel.modelName,
          selectedModel.marketName,
          newParams,
        );

        const hasParams = result.some((r) => r.paramProperty && r.paramValues);
        if (hasParams) {
          setSelectionSteps(result);
          setResources([]);
        } else {
          setResources(result.filter((r) => r.romResource || r.toolResource));
          setSelectionSteps([]);
        }
      } catch (err) {
        setError(err instanceof Error ? err.message : 'Error al obtener firmware');
      } finally {
        setLoadingFirmware(false);
      }
    },
    [selectedModel, currentParams],
  );

  // Filter models by search query
  const filteredModels = models.filter((m) => {
    const q = searchQuery.toLowerCase();
    const matchesQuery =
      !q ||
      m.modelName.toLowerCase().includes(q) ||
      m.marketName.toLowerCase().includes(q);
    const matchesBrand = !brandFilter || m.brand === brandFilter;
    return matchesQuery && matchesBrand;
  });

  return (
    <div className="mx-auto max-w-6xl space-y-6">
      {/* Page header */}
      <motion.div
        initial={{ opacity: 0, y: 20 }}
        animate={{ opacity: 1, y: 0 }}
        className="space-y-2"
      >
        <div className="flex items-center gap-3">
          <div className="flex h-10 w-10 items-center justify-center rounded-xl bg-gradient-to-br from-emerald-500 to-teal-600 shadow-lg shadow-emerald-500/20">
            <Download className="h-5 w-5 text-white" />
          </div>
          <div>
            <h1 className="text-2xl font-bold text-white">Lenovo Software Fix</h1>
            <p className="text-sm text-gray-400">
              Firmware desde rsddownload-secure.lenovo.com
            </p>
          </div>
        </div>
      </motion.div>

      {/* Search section */}
      <GlassCard>
        <div className="space-y-4 p-5">
          <div className="flex items-center gap-3">
            <Cpu className="h-5 w-5 text-emerald-400" />
            <h2 className="text-lg font-semibold text-white">Buscar Dispositivo</h2>
          </div>

          <div className="flex gap-3">
            <button
              onClick={handleSearch}
              disabled={loadingModels}
              className="flex items-center gap-2 rounded-xl bg-gradient-to-r from-emerald-600 to-teal-600 px-6 py-3 text-sm font-semibold text-white shadow-lg shadow-emerald-500/20 transition-all hover:shadow-emerald-500/40 disabled:opacity-50"
            >
              {loadingModels ? (
                <Spinner size="sm" />
              ) : (
                <Search className="h-4 w-4" />
              )}
              Cargar Modelos
            </button>
          </div>

          {/* Filters (shown after models loaded) */}
          {models.length > 0 && (
            <div className="flex flex-wrap gap-3">
              <input
                type="text"
                value={searchQuery}
                onChange={(e) => setSearchQuery(e.target.value)}
                placeholder="Filtrar por nombre o modelo..."
                className="flex-1 rounded-lg border border-white/10 bg-white/[0.03] px-4 py-2 text-sm text-white placeholder-gray-500 outline-none focus:border-emerald-500/50"
              />
              <div className="flex gap-2">
                <button
                  onClick={() => setBrandFilter('')}
                  className={cn(
                    'rounded-lg px-3 py-2 text-xs font-medium transition-all',
                    !brandFilter
                      ? 'bg-emerald-500/20 text-emerald-300'
                      : 'bg-white/[0.03] text-gray-400 hover:text-white',
                  )}
                >
                  Todos
                </button>
                {LENOVO_BRANDS.map((brand) => (
                  <button
                    key={brand}
                    onClick={() => setBrandFilter(brand)}
                    className={cn(
                      'rounded-lg px-3 py-2 text-xs font-medium transition-all',
                      brandFilter === brand
                        ? 'bg-emerald-500/20 text-emerald-300'
                        : 'bg-white/[0.03] text-gray-400 hover:text-white',
                    )}
                  >
                    {brand}
                  </button>
                ))}
              </div>
            </div>
          )}
        </div>
      </GlassCard>

      {/* Error */}
      <AnimatePresence>
        {error && (
          <motion.div
            initial={{ opacity: 0, y: -10 }}
            animate={{ opacity: 1, y: 0 }}
            exit={{ opacity: 0, y: -10 }}
            className="flex items-center gap-3 rounded-xl border border-red-500/20 bg-red-500/5 px-4 py-3"
          >
            <AlertCircle className="h-5 w-5 shrink-0 text-red-400" />
            <p className="text-sm text-red-300">{error}</p>
          </motion.div>
        )}
      </AnimatePresence>

      {/* Loading models */}
      {loadingModels && (
        <div className="flex h-32 items-center justify-center">
          <Spinner size="lg" label="Cargando modelos..." />
        </div>
      )}

      {/* Model grid */}
      {filteredModels.length > 0 && (
        <div className="space-y-3">
          <div className="flex items-center justify-between">
            <h2 className="text-sm font-medium text-gray-400">
              {filteredModels.length} modelo(s) encontrado(s)
            </h2>
          </div>
          <div className="grid gap-2 sm:grid-cols-2 lg:grid-cols-3">
            {filteredModels.map((model) => (
              <ModelCard
                key={`${model.modelName}-${model.brand}`}
                model={model}
                selected={selectedModel?.modelName === model.modelName}
                onClick={() => handleSelectModel(model)}
              />
            ))}
          </div>
        </div>
      )}

      {/* Loading firmware */}
      {loadingFirmware && (
        <div className="flex h-24 items-center justify-center">
          <Spinner size="lg" label="Buscando firmware..." />
        </div>
      )}

      {/* Selection steps (simCount, country, etc.) */}
      {selectionSteps.length > 0 && !loadingFirmware && (
        <div className="space-y-3">
          <div className="flex items-center gap-2 text-sm text-gray-400">
            <ChevronRight className="h-4 w-4" />
            <span>
              Selecciona los parámetros para{' '}
              <span className="font-medium text-white">{selectedModel?.marketName}</span>
            </span>
          </div>

          {/* Show current selections as breadcrumb */}
          {Object.entries(currentParams).length > 0 && (
            <div className="flex flex-wrap items-center gap-2 text-xs">
              {Object.entries(currentParams).map(([key, value]) => (
                <span
                  key={key}
                  className="rounded-full bg-emerald-500/10 px-3 py-1 text-emerald-300"
                >
                  {key}: {value}
                </span>
              ))}
            </div>
          )}

          {selectionSteps.map((step, idx) => (
            <SelectionStep
              key={`${step.paramProperty?.property}-${idx}`}
              resource={step}
              onSelect={handleParamSelect}
            />
          ))}
        </div>
      )}

      {/* Firmware results */}
      {resources.length > 0 && !loadingFirmware && (
        <div className="space-y-4">
          <div className="flex items-center gap-2">
            <CheckCircle className="h-5 w-5 text-emerald-400" />
            <h2 className="text-lg font-semibold text-white">
              Firmware Disponible ({resources.length})
            </h2>
          </div>

          {resources.map((r, idx) => (
            <ResourceCard key={`${r.modelName}-${r.romMatchId}-${idx}`} resource={r} />
          ))}
        </div>
      )}

      {/* Info footer */}
      <GlassCard>
        <div className="p-4 text-center text-xs text-gray-500">
          <p>
            Los firmwares se descargan desde{' '}
            <span className="font-medium text-gray-400">rsddownload-secure.lenovo.com</span>{' '}
            (S3 con URLs pre-firmadas).
          </p>
          <p className="mt-1">
            Requiere autenticación con Lenovo ID vía{' '}
            <span className="font-medium text-gray-400">passport.lenovo.com</span>{' '}
            (Camoufox + TLS fingerprint en el backend Python).
          </p>
        </div>
      </GlassCard>
    </div>
  );
}
