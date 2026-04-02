export function parseCheckResponse(data, headers = {}) {
  const proceed = data?.proceed ?? false;
  const content = data?.content ?? null;
  const xCdsExists = headers?.['x-cds-content-exists'] === 'true' || null;

  return {
    hasUpdate: proceed && content !== null,
    proceed,
    xCdsContentExists: xCdsExists,
    context: data?.context ?? 'ota',
    contextKey: data?.contextKey ?? '',
    trackingId: data?.trackingId ?? '',
    pollAfterSeconds: data?.pollAfterSeconds ?? 0,
    content: content ? {
      sourceVersion: content.sourceDisplayVersion ?? '',
      targetVersion: content.displayVersion ?? '',
      targetGuid: content.otaTargetSha1 ?? '',
      sizeBytes: content.size ?? 0,
      sizeMB: ((content.size ?? 0) / (1024 * 1024)).toFixed(2),
      updateType: content.updateType ?? '',
      md5: content.md5_checksum ?? '',
      packageId: content.packageID ?? '',
    } : null,
    downloadUrls: (data?.contentResources ?? [])
      .map(r => r.url)
      .filter(Boolean),
    raw: data,
  };
}

export function classifyCarrierStatus(response) {
  if (response.hasUpdate) return 'open';
  if (response.xCdsContentExists) return 'whitelisted';
  return 'no-content';
}

export function formatUpdateInfo(response) {
  if (!response.hasUpdate || !response.content) return null;
  return {
    from: response.content.sourceVersion,
    to: response.content.targetVersion,
    size: response.content.sizeMB + ' MB',
    type: response.content.updateType,
    md5: response.content.md5,
    urls: response.downloadUrls.length,
  };
}
