.class public interface abstract Lcom/motorola/otalib/common/Environment/ApplicationEnv$FotaServices;
.super Ljava/lang/Object;
.source "ApplicationEnv.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/motorola/otalib/common/Environment/ApplicationEnv;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x609
    name = "FotaServices"
.end annotation


# virtual methods
.method public abstract getFotaDownloadCompleted(JI)Lcom/motorola/otalib/common/utils/UpgradeUtils$DownloadStatus;
.end method

.method public abstract sendFotaInitializationIntent()V
.end method

.method public abstract sendRequestUpdate(J)V
.end method

.method public abstract sendUpdateAvailableResponse(JI)V
.end method

.method public abstract sendUpdateAvailableResponse(JIZ)V
.end method

.method public abstract sendUpgradeResult(JI)V
.end method

.method public abstract sendWifiDiscoverTimerExpiry(JI)V
.end method
