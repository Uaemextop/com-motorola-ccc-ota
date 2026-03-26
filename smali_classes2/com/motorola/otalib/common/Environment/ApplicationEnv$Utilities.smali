.class public interface abstract Lcom/motorola/otalib/common/Environment/ApplicationEnv$Utilities;
.super Ljava/lang/Object;
.source "ApplicationEnv.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/motorola/otalib/common/Environment/ApplicationEnv;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x609
    name = "Utilities"
.end annotation


# virtual methods
.method public abstract cancelBGInstallNotification()V
.end method

.method public abstract cancelDownloadNotification()V
.end method

.method public abstract cancelRestartNotification()V
.end method

.method public abstract cancelUpdateNotification()V
.end method

.method public abstract cleanBotaWifiDiscoveryTimer()V
.end method

.method public abstract cleanFotaWifiDiscoveryTimer()V
.end method

.method public abstract getAvailableDataPartitionSize()J
.end method

.method public abstract getDeviceAdditionalInfo()Ljava/lang/String;
.end method

.method public abstract getNetwork()Ljava/lang/String;
.end method

.method public abstract getSpaceAvailable(Ljava/lang/String;)J
.end method

.method public abstract isDeviceInIdleMode()Z
.end method

.method public abstract isDownloadAllowed(Landroid/content/Context;)Z
.end method

.method public abstract isSpaceAvailable(Ljava/lang/String;J)Z
.end method

.method public abstract moveFotaToGettingDescriptorState()V
.end method

.method public abstract postAvailableReserveSpace()V
.end method

.method public abstract readTextFile(Ljava/io/File;ILjava/lang/String;)Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation
.end method

.method public abstract registerWithForceUpgradeManager(J)V
.end method

.method public abstract registerWithWiFiDiscoveryManager(JZZ)V
.end method

.method public abstract sendActionUpdateResponse(Lcom/motorola/otalib/common/utils/UpgradeUtils$Error;IZLjava/lang/String;)V
.end method

.method public abstract sendCheckForUpdate(ZI)V
.end method

.method public abstract sendCheckForUpdate(ZIZ)V
.end method

.method public abstract sendCheckForUpdateResponse(Lcom/motorola/otalib/common/utils/UpgradeUtils$Error;IZ)V
.end method

.method public abstract sendDiscoverTimerExpiryIntent()V
.end method

.method public abstract sendErrorCode(I)V
.end method

.method public abstract sendException(Ljava/lang/Exception;)V
.end method

.method public abstract sendException(Ljava/lang/String;)V
.end method

.method public abstract sendForceUpgradeTimerExpiryIntent()V
.end method

.method public abstract sendGetDescriptor(Ljava/lang/String;Ljava/lang/String;Z)V
.end method

.method public abstract sendInstallSystemUpdateAvailableNotification(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
.end method

.method public abstract sendInternalNotification(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
.end method

.method public abstract sendPollIntent()V
.end method

.method public abstract sendRebootDuringDownloadIntent()V
.end method

.method public abstract sendStartBackgroundInstallationFragment(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
.end method

.method public abstract sendStartDownloadNotification(Ljava/lang/String;)V
.end method

.method public abstract sendStartDownloadProgressFragment(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
.end method

.method public abstract sendStartRestartActivity(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
.end method

.method public abstract sendSystemRestartNotificationForABUpdate(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
.end method

.method public abstract sendSystemUpdateAvailableNotification(Ljava/lang/String;)V
.end method

.method public abstract sendUpdateDownloadStatusError(Ljava/lang/String;Lcom/motorola/otalib/common/utils/UpgradeUtils$DownloadStatus;)V
.end method

.method public abstract sendUpdateDownloadStatusError(Ljava/lang/String;Lcom/motorola/otalib/common/utils/UpgradeUtils$DownloadStatus;Ljava/lang/String;)V
.end method

.method public abstract sendUpdateDownloadStatusError(Ljava/lang/String;Lcom/motorola/otalib/common/utils/UpgradeUtils$DownloadStatus;Ljava/lang/String;Ljava/lang/String;)V
.end method

.method public abstract sendUpdateDownloadStatusProgress(Ljava/lang/String;JJLjava/lang/String;)V
.end method

.method public abstract sendUpdateDownloadStatusRetried(Ljava/lang/String;JJ)V
.end method

.method public abstract sendUpdateDownloadStatusSuccess(Ljava/lang/String;JLjava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
.end method

.method public abstract sendUpdateDownloadStatusSuspended(Ljava/lang/String;JJLjava/lang/String;Z)V
.end method

.method public abstract sendUpdateNotification(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
.end method

.method public abstract sendUpdateStatus(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;ZI)V
.end method

.method public abstract sendUpdaterStateReset()V
.end method

.method public abstract sendUpgradeExecute(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
.end method

.method public abstract sendUpgradeStatus(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;JZLjava/lang/String;ZLjava/lang/String;)V
.end method

.method public abstract sendVerifyPayloadMetadataFileDownloadStatus(Lcom/motorola/otalib/common/utils/UpgradeUtils$DownloadStatus;Ljava/lang/String;)V
.end method

.method public abstract showAllocateFreeSpaceDialog(Lcom/motorola/otalib/common/utils/UpgradeUtils$DownloadStatus;J)V
.end method

.method public abstract startBotaWifiDiscoveryTimer()V
.end method

.method public abstract startFotaWifiDiscoveryTimer()V
.end method

.method public abstract triggerForceDeviceLogin()V
.end method

.method public abstract unRegisterWithForceUpgradeManager()V
.end method

.method public abstract unRegisterWithWiFiDiscoveryManager()V
.end method

.method public abstract verifyPackage(Ljava/io/File;)V
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation
.end method
