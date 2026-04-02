/* ── Response Parsing ───────────────────────────────────────── */

import type { CheckResponse, CarrierStatus, ContentInfo, ContentResource } from '@/lib/types';

export function parseCheckResponse(
  data: Record<string, unknown>,
  headers: Record<string, string> = {},
): CheckResponse {
  const payload = (data?.payload as Record<string, unknown>) ?? data;
  const proceed = (payload?.proceed as boolean) ?? false;
  const content = (payload?.content as Record<string, unknown>) ?? null;
  const rawXCds = headers?.['x-cds-content-exists'];
  const xCdsExists = rawXCds != null ? rawXCds.toLowerCase() === 'true' : null;

  const rawResources = (payload?.contentResources as Array<Record<string, unknown>>) ?? [];
  const contentResources: ContentResource[] = rawResources
    .filter((r) => r?.url)
    .map((r) => ({
      url: r.url as string,
      tags: (r.tags as string[]) ?? [],
      urlTtlSeconds: (r.urlTtlSeconds as number) ?? 0,
    }));

  let parsedContent: ContentInfo | null = null;
  if (content && (content.displayVersion || content.updateType)) {
    const size = Number(content.size ?? 0);
    parsedContent = {
      sourceVersion: (content.sourceDisplayVersion as string) ?? '',
      targetVersion: (content.displayVersion as string) ?? '',
      targetGuid: (content.otaTargetSha1 as string) ?? '',
      sourceGuid: (content.otaSourceSha1 as string) ?? '',
      sizeBytes: size,
      sizeMB: (size / (1024 * 1024)).toFixed(2),
      updateType: (content.updateType as string) ?? '',
      md5: (content.md5_checksum as string) ?? '',
      packageId: (content.packageID as string) ?? '',
      model: (content.model as string) ?? '',
      releaseNotes: (content.releaseNotes as string) ?? '',
      abInstallType: (content.abInstallType as string) ?? '',
      deploymentPhase: (content.deploymentPlanPhase as string) ?? '',
      flavour: (content.flavour as string) ?? '',
    };
  }

  return {
    hasUpdate: proceed && content !== null && parsedContent !== null && !!parsedContent.targetVersion,
    proceed,
    xCdsContentExists: xCdsExists,
    context: (payload?.context as string) ?? 'ota',
    contextKey: (payload?.contextKey as string) ?? '',
    trackingId: (payload?.trackingId as string) ?? '',
    pollAfterSeconds: (payload?.pollAfterSeconds as number) ?? 0,
    smartUpdateBitmap: (payload?.smartUpdateBitmap as number) ?? -1,
    content: parsedContent,
    downloadUrls: contentResources.map((r) => r.url),
    contentResources,
    raw: data,
  };
}

export function classifyCarrierStatus(response: CheckResponse): CarrierStatus {
  if (response.hasUpdate) return 'open';
  if (response.xCdsContentExists) return 'whitelisted';
  return 'no-content';
}
