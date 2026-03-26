.class Lcom/motorola/ccc/ota/sources/bota/BotaDownloadHandler$1;
.super Lcom/motorola/otalib/aidl/IDownloadServiceCallback$Stub;
.source "BotaDownloadHandler.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/motorola/ccc/ota/sources/bota/BotaDownloadHandler;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/motorola/ccc/ota/sources/bota/BotaDownloadHandler;


# direct methods
.method constructor <init>(Lcom/motorola/ccc/ota/sources/bota/BotaDownloadHandler;)V
    .locals 0

    iput-object p1, p0, Lcom/motorola/ccc/ota/sources/bota/BotaDownloadHandler$1;->this$0:Lcom/motorola/ccc/ota/sources/bota/BotaDownloadHandler;

    invoke-direct {p0}, Lcom/motorola/otalib/aidl/IDownloadServiceCallback$Stub;-><init>()V

    return-void
.end method


# virtual methods
.method public dlResponse(Ljava/lang/String;)V
    .locals 0

    return-void
.end method

.method public errorCode(Ljava/lang/String;IZ)V
    .locals 6

    new-instance p1, Ljava/lang/StringBuilder;

    const-string v0, "BotaDownloadHandler.errorCode(). Download received errorCode :"

    invoke-direct {p1, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    const-string v0, "OtaApp"

    invoke-static {v0, p1}, Lcom/motorola/ccc/ota/utils/Logger;->info(Ljava/lang/String;Ljava/lang/String;)V

    if-nez p3, :cond_0

    iget-object p1, p0, Lcom/motorola/ccc/ota/sources/bota/BotaDownloadHandler$1;->this$0:Lcom/motorola/ccc/ota/sources/bota/BotaDownloadHandler;

    const/4 p3, 0x0

    invoke-virtual {p1, p3}, Lcom/motorola/ccc/ota/sources/bota/BotaDownloadHandler;->setProgressAndActualDownloadTime(Z)V

    goto :goto_0

    :cond_0
    iget-object p1, p0, Lcom/motorola/ccc/ota/sources/bota/BotaDownloadHandler$1;->this$0:Lcom/motorola/ccc/ota/sources/bota/BotaDownloadHandler;

    invoke-static {p1}, Lcom/motorola/ccc/ota/sources/bota/BotaDownloadHandler;->-$$Nest$fgetenv(Lcom/motorola/ccc/ota/sources/bota/BotaDownloadHandler;)Lcom/motorola/otalib/common/Environment/ApplicationEnv;

    move-result-object p1

    invoke-interface {p1}, Lcom/motorola/otalib/common/Environment/ApplicationEnv;->getUtilities()Lcom/motorola/otalib/common/Environment/ApplicationEnv$Utilities;

    move-result-object v0

    invoke-static {}, Lcom/motorola/ccc/ota/sources/bota/BotaDownloadHandler;->-$$Nest$sfgetversion()Ljava/lang/String;

    move-result-object v1

    new-instance p1, Ljava/io/File;

    invoke-static {}, Lcom/motorola/ccc/ota/sources/bota/BotaDownloadHandler;->-$$Nest$sfgetfileName()Ljava/lang/String;

    move-result-object p3

    invoke-direct {p1, p3}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-virtual {p1}, Ljava/io/File;->length()J

    move-result-wide v2

    invoke-static {}, Lcom/motorola/ccc/ota/sources/bota/BotaDownloadHandler;->-$$Nest$sfgetsize()J

    move-result-wide v4

    invoke-interface/range {v0 .. v5}, Lcom/motorola/otalib/common/Environment/ApplicationEnv$Utilities;->sendUpdateDownloadStatusRetried(Ljava/lang/String;JJ)V

    :goto_0
    iget-object p0, p0, Lcom/motorola/ccc/ota/sources/bota/BotaDownloadHandler$1;->this$0:Lcom/motorola/ccc/ota/sources/bota/BotaDownloadHandler;

    invoke-static {p0}, Lcom/motorola/ccc/ota/sources/bota/BotaDownloadHandler;->-$$Nest$fgetenv(Lcom/motorola/ccc/ota/sources/bota/BotaDownloadHandler;)Lcom/motorola/otalib/common/Environment/ApplicationEnv;

    move-result-object p0

    invoke-interface {p0}, Lcom/motorola/otalib/common/Environment/ApplicationEnv;->getUtilities()Lcom/motorola/otalib/common/Environment/ApplicationEnv$Utilities;

    move-result-object p0

    invoke-interface {p0, p2}, Lcom/motorola/otalib/common/Environment/ApplicationEnv$Utilities;->sendErrorCode(I)V

    return-void
.end method

.method public exception(Ljava/lang/String;Ljava/lang/String;)V
    .locals 6

    new-instance p1, Ljava/lang/StringBuilder;

    const-string v0, "BotaDownloadHandler.exception(). Download received exception :"

    invoke-direct {p1, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    const-string v0, "OtaApp"

    invoke-static {v0, p1}, Lcom/motorola/ccc/ota/utils/Logger;->info(Ljava/lang/String;Ljava/lang/String;)V

    iget-object p1, p0, Lcom/motorola/ccc/ota/sources/bota/BotaDownloadHandler$1;->this$0:Lcom/motorola/ccc/ota/sources/bota/BotaDownloadHandler;

    invoke-static {p1}, Lcom/motorola/ccc/ota/sources/bota/BotaDownloadHandler;->-$$Nest$fgetenv(Lcom/motorola/ccc/ota/sources/bota/BotaDownloadHandler;)Lcom/motorola/otalib/common/Environment/ApplicationEnv;

    move-result-object p1

    invoke-interface {p1}, Lcom/motorola/otalib/common/Environment/ApplicationEnv;->getUtilities()Lcom/motorola/otalib/common/Environment/ApplicationEnv$Utilities;

    move-result-object p1

    invoke-interface {p1, p2}, Lcom/motorola/otalib/common/Environment/ApplicationEnv$Utilities;->sendException(Ljava/lang/String;)V

    iget-object p1, p0, Lcom/motorola/ccc/ota/sources/bota/BotaDownloadHandler$1;->this$0:Lcom/motorola/ccc/ota/sources/bota/BotaDownloadHandler;

    const/4 v1, 0x0

    invoke-virtual {p1, v1}, Lcom/motorola/ccc/ota/sources/bota/BotaDownloadHandler;->setProgressAndActualDownloadTime(Z)V

    invoke-static {}, Lcom/motorola/ccc/ota/sources/bota/BotaDownloadHandler;->-$$Nest$sfgetcm()Landroid/net/ConnectivityManager;

    move-result-object p1

    invoke-static {p1}, Lcom/motorola/otalib/common/utils/NetworkUtils;->isNetWorkConnected(Landroid/net/ConnectivityManager;)Z

    move-result p1

    if-nez p1, :cond_0

    const-string p0, "BotaDownloadHandler.exception(). no network, return false"

    invoke-static {v0, p0}, Lcom/motorola/ccc/ota/utils/Logger;->info(Ljava/lang/String;Ljava/lang/String;)V

    return-void

    :cond_0
    if-eqz p2, :cond_6

    iget-object p1, p0, Lcom/motorola/ccc/ota/sources/bota/BotaDownloadHandler$1;->this$0:Lcom/motorola/ccc/ota/sources/bota/BotaDownloadHandler;

    invoke-static {p1}, Lcom/motorola/ccc/ota/sources/bota/BotaDownloadHandler;->-$$Nest$munBindwithDownloadService(Lcom/motorola/ccc/ota/sources/bota/BotaDownloadHandler;)V

    const-string p1, "ENOSPC"

    invoke-virtual {p2, p1}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result p1

    const-string v2, " failing the download for this exception"

    if-eqz p1, :cond_2

    new-instance p1, Ljava/lang/StringBuilder;

    const-string v1, "BotaDownloadHandler.exception:"

    invoke-direct {p1, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {v0, p1}, Lcom/motorola/ccc/ota/utils/Logger;->info(Ljava/lang/String;Ljava/lang/String;)V

    sget-object p1, Lcom/motorola/otalib/common/utils/UpgradeUtils$DownloadStatus;->STATUS_RESOURCES:Lcom/motorola/otalib/common/utils/UpgradeUtils$DownloadStatus;

    iget-object p2, p0, Lcom/motorola/ccc/ota/sources/bota/BotaDownloadHandler$1;->this$0:Lcom/motorola/ccc/ota/sources/bota/BotaDownloadHandler;

    invoke-static {p2}, Lcom/motorola/ccc/ota/sources/bota/BotaDownloadHandler;->-$$Nest$fgetsettings(Lcom/motorola/ccc/ota/sources/bota/BotaDownloadHandler;)Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    move-result-object p2

    invoke-virtual {p2}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->getPackageDownloadLocation()Ljava/lang/String;

    move-result-object p2

    const-string v0, "data"

    invoke-virtual {v0, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p2

    if-eqz p2, :cond_1

    sget-object p1, Lcom/motorola/otalib/common/utils/UpgradeUtils$DownloadStatus;->STATUS_SPACE:Lcom/motorola/otalib/common/utils/UpgradeUtils$DownloadStatus;

    :cond_1
    iget-object p2, p0, Lcom/motorola/ccc/ota/sources/bota/BotaDownloadHandler$1;->this$0:Lcom/motorola/ccc/ota/sources/bota/BotaDownloadHandler;

    invoke-static {p2}, Lcom/motorola/ccc/ota/sources/bota/BotaDownloadHandler;->-$$Nest$fgetsm(Lcom/motorola/ccc/ota/sources/bota/BotaDownloadHandler;)Lcom/motorola/ccc/ota/CusSM;

    move-result-object p2

    invoke-static {}, Lcom/motorola/ccc/ota/sources/bota/BotaDownloadHandler;->-$$Nest$sfgetversion()Ljava/lang/String;

    move-result-object v0

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "ENOSPC:Does not have enough free space on /data "

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object p0, p0, Lcom/motorola/ccc/ota/sources/bota/BotaDownloadHandler$1;->this$0:Lcom/motorola/ccc/ota/sources/bota/BotaDownloadHandler;

    invoke-static {p0}, Lcom/motorola/ccc/ota/sources/bota/BotaDownloadHandler;->-$$Nest$fgetsm(Lcom/motorola/ccc/ota/sources/bota/BotaDownloadHandler;)Lcom/motorola/ccc/ota/CusSM;

    move-result-object p0

    invoke-virtual {p0}, Lcom/motorola/ccc/ota/CusSM;->getDeviceAdditionalInfo()Ljava/lang/String;

    move-result-object p0

    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    const-string v1, "DATA_OUT_OF_SPACE."

    invoke-virtual {p2, v0, p1, p0, v1}, Lcom/motorola/ccc/ota/CusSM;->failDownload(Ljava/lang/String;Lcom/motorola/otalib/common/utils/UpgradeUtils$DownloadStatus;Ljava/lang/String;Ljava/lang/String;)V

    goto/16 :goto_1

    :cond_2
    const-string p1, "IOException"

    invoke-virtual {p2, p1}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result p1

    const-string v3, "DOWNLOAD_FAILED_PACKAGE_EXCEPTION."

    if-eqz p1, :cond_5

    invoke-static {}, Lcom/motorola/ccc/ota/sources/bota/BotaDownloadHandler;->-$$Nest$sfgetioExceptionHandler()Lcom/motorola/ccc/ota/sources/bota/download/error/ResetSMToGettingDescriptorExceptionHandler;

    move-result-object p1

    if-eqz p1, :cond_5

    invoke-static {}, Lcom/motorola/ccc/ota/sources/bota/download/error/ResetSMToGettingDescriptorExceptionHandler;->isRetryPending()Z

    move-result p1

    if-eqz p1, :cond_3

    const-string p1, "BotaDownloadHandler.exception(). retry pending, return"

    invoke-static {v0, p1}, Lcom/motorola/ccc/ota/utils/Logger;->error(Ljava/lang/String;Ljava/lang/String;)V

    iget-object p0, p0, Lcom/motorola/ccc/ota/sources/bota/BotaDownloadHandler$1;->this$0:Lcom/motorola/ccc/ota/sources/bota/BotaDownloadHandler;

    invoke-static {p0}, Lcom/motorola/ccc/ota/sources/bota/BotaDownloadHandler;->-$$Nest$fgetenv(Lcom/motorola/ccc/ota/sources/bota/BotaDownloadHandler;)Lcom/motorola/otalib/common/Environment/ApplicationEnv;

    move-result-object p0

    invoke-interface {p0}, Lcom/motorola/otalib/common/Environment/ApplicationEnv;->getUtilities()Lcom/motorola/otalib/common/Environment/ApplicationEnv$Utilities;

    move-result-object v0

    invoke-static {}, Lcom/motorola/ccc/ota/sources/bota/BotaDownloadHandler;->-$$Nest$sfgetversion()Ljava/lang/String;

    move-result-object v1

    new-instance p0, Ljava/io/File;

    invoke-static {}, Lcom/motorola/ccc/ota/sources/bota/BotaDownloadHandler;->-$$Nest$sfgetfileName()Ljava/lang/String;

    move-result-object p1

    invoke-direct {p0, p1}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-virtual {p0}, Ljava/io/File;->length()J

    move-result-wide v2

    invoke-static {}, Lcom/motorola/ccc/ota/sources/bota/BotaDownloadHandler;->-$$Nest$sfgetsize()J

    move-result-wide v4

    invoke-interface/range {v0 .. v5}, Lcom/motorola/otalib/common/Environment/ApplicationEnv$Utilities;->sendUpdateDownloadStatusRetried(Ljava/lang/String;JJ)V

    return-void

    :cond_3
    new-instance p1, Ljava/lang/StringBuilder;

    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    const-string v2, " during BOTA package download"

    invoke-virtual {p1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {}, Lcom/motorola/ccc/ota/sources/bota/BotaDownloadHandler;->-$$Nest$sfgetioExceptionHandler()Lcom/motorola/ccc/ota/sources/bota/download/error/ResetSMToGettingDescriptorExceptionHandler;

    move-result-object v2

    invoke-virtual {v2, p2, p1, v1, v3}, Lcom/motorola/ccc/ota/sources/bota/download/error/ResetSMToGettingDescriptorExceptionHandler;->handleException(Ljava/lang/String;Ljava/lang/String;ZLjava/lang/String;)Z

    move-result p1

    new-instance p2, Ljava/lang/StringBuilder;

    const-string v1, "BotaDownloadHandler.exception(). retry status "

    invoke-direct {p2, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p2, p1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object p2

    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    invoke-static {v0, p2}, Lcom/motorola/ccc/ota/utils/Logger;->error(Ljava/lang/String;Ljava/lang/String;)V

    if-nez p1, :cond_4

    iget-object p0, p0, Lcom/motorola/ccc/ota/sources/bota/BotaDownloadHandler$1;->this$0:Lcom/motorola/ccc/ota/sources/bota/BotaDownloadHandler;

    invoke-static {p0}, Lcom/motorola/ccc/ota/sources/bota/BotaDownloadHandler;->-$$Nest$fgetsettings(Lcom/motorola/ccc/ota/sources/bota/BotaDownloadHandler;)Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    move-result-object p0

    sget-object p1, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->ADVANCE_DL_RETRY_COUNT:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    invoke-virtual {p0, p1}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->incrementPrefs(Lcom/motorola/otalib/common/settings/ISetting;)V

    goto :goto_0

    :cond_4
    iget-object p0, p0, Lcom/motorola/ccc/ota/sources/bota/BotaDownloadHandler$1;->this$0:Lcom/motorola/ccc/ota/sources/bota/BotaDownloadHandler;

    invoke-static {p0}, Lcom/motorola/ccc/ota/sources/bota/BotaDownloadHandler;->-$$Nest$fgetenv(Lcom/motorola/ccc/ota/sources/bota/BotaDownloadHandler;)Lcom/motorola/otalib/common/Environment/ApplicationEnv;

    move-result-object p0

    invoke-interface {p0}, Lcom/motorola/otalib/common/Environment/ApplicationEnv;->getUtilities()Lcom/motorola/otalib/common/Environment/ApplicationEnv$Utilities;

    move-result-object v0

    invoke-static {}, Lcom/motorola/ccc/ota/sources/bota/BotaDownloadHandler;->-$$Nest$sfgetversion()Ljava/lang/String;

    move-result-object v1

    new-instance p0, Ljava/io/File;

    invoke-static {}, Lcom/motorola/ccc/ota/sources/bota/BotaDownloadHandler;->-$$Nest$sfgetfileName()Ljava/lang/String;

    move-result-object p1

    invoke-direct {p0, p1}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-virtual {p0}, Ljava/io/File;->length()J

    move-result-wide v2

    invoke-static {}, Lcom/motorola/ccc/ota/sources/bota/BotaDownloadHandler;->-$$Nest$sfgetsize()J

    move-result-wide v4

    invoke-interface/range {v0 .. v5}, Lcom/motorola/otalib/common/Environment/ApplicationEnv$Utilities;->sendUpdateDownloadStatusRetried(Ljava/lang/String;JJ)V

    :goto_0
    return-void

    :cond_5
    new-instance p1, Ljava/lang/StringBuilder;

    const-string v1, "Unhandled Exception found "

    invoke-direct {p1, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {v0, p1}, Lcom/motorola/ccc/ota/utils/Logger;->info(Ljava/lang/String;Ljava/lang/String;)V

    sget-object p2, Lcom/motorola/otalib/common/utils/UpgradeUtils$DownloadStatus;->STATUS_FAIL:Lcom/motorola/otalib/common/utils/UpgradeUtils$DownloadStatus;

    iget-object v0, p0, Lcom/motorola/ccc/ota/sources/bota/BotaDownloadHandler$1;->this$0:Lcom/motorola/ccc/ota/sources/bota/BotaDownloadHandler;

    invoke-static {v0}, Lcom/motorola/ccc/ota/sources/bota/BotaDownloadHandler;->-$$Nest$fgetsm(Lcom/motorola/ccc/ota/sources/bota/BotaDownloadHandler;)Lcom/motorola/ccc/ota/CusSM;

    move-result-object v0

    invoke-static {}, Lcom/motorola/ccc/ota/sources/bota/BotaDownloadHandler;->-$$Nest$sfgetversion()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1, p2, p1, v3}, Lcom/motorola/ccc/ota/CusSM;->failDownload(Ljava/lang/String;Lcom/motorola/otalib/common/utils/UpgradeUtils$DownloadStatus;Ljava/lang/String;Ljava/lang/String;)V

    iget-object p0, p0, Lcom/motorola/ccc/ota/sources/bota/BotaDownloadHandler$1;->this$0:Lcom/motorola/ccc/ota/sources/bota/BotaDownloadHandler;

    invoke-static {p0}, Lcom/motorola/ccc/ota/sources/bota/BotaDownloadHandler;->-$$Nest$fgetsettings(Lcom/motorola/ccc/ota/sources/bota/BotaDownloadHandler;)Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    move-result-object p0

    sget-object p1, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->ADVANCE_DL_RETRY_COUNT:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    invoke-virtual {p0, p1}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->incrementPrefs(Lcom/motorola/otalib/common/settings/ISetting;)V

    return-void

    :cond_6
    iget-object p0, p0, Lcom/motorola/ccc/ota/sources/bota/BotaDownloadHandler$1;->this$0:Lcom/motorola/ccc/ota/sources/bota/BotaDownloadHandler;

    invoke-static {p0}, Lcom/motorola/ccc/ota/sources/bota/BotaDownloadHandler;->-$$Nest$munBindwithDownloadService(Lcom/motorola/ccc/ota/sources/bota/BotaDownloadHandler;)V

    :goto_1
    return-void
.end method

.method public failed(Ljava/lang/String;ILjava/lang/String;Ljava/lang/String;)V
    .locals 7

    new-instance p1, Ljava/lang/StringBuilder;

    const-string v0, "BotaDownloadHandler.failed(). Download failed : "

    invoke-direct {p1, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    const-string v0, "OtaApp"

    invoke-static {v0, p1}, Lcom/motorola/ccc/ota/utils/Logger;->info(Ljava/lang/String;Ljava/lang/String;)V

    iget-object p1, p0, Lcom/motorola/ccc/ota/sources/bota/BotaDownloadHandler$1;->this$0:Lcom/motorola/ccc/ota/sources/bota/BotaDownloadHandler;

    const/4 v1, 0x0

    invoke-virtual {p1, v1}, Lcom/motorola/ccc/ota/sources/bota/BotaDownloadHandler;->setProgressAndActualDownloadTime(Z)V

    iget-object p1, p0, Lcom/motorola/ccc/ota/sources/bota/BotaDownloadHandler$1;->this$0:Lcom/motorola/ccc/ota/sources/bota/BotaDownloadHandler;

    invoke-static {p1}, Lcom/motorola/ccc/ota/sources/bota/BotaDownloadHandler;->-$$Nest$munBindwithDownloadService(Lcom/motorola/ccc/ota/sources/bota/BotaDownloadHandler;)V

    invoke-static {}, Lcom/motorola/ccc/ota/sources/bota/BotaDownloadHandler;->-$$Nest$sfgetcm()Landroid/net/ConnectivityManager;

    move-result-object p1

    invoke-static {p1}, Lcom/motorola/otalib/common/utils/NetworkUtils;->isNetWorkConnected(Landroid/net/ConnectivityManager;)Z

    move-result p1

    if-nez p1, :cond_0

    const-string p0, "BotaDownloadHandler.failed(). no network, return"

    invoke-static {v0, p0}, Lcom/motorola/ccc/ota/utils/Logger;->info(Ljava/lang/String;Ljava/lang/String;)V

    return-void

    :cond_0
    invoke-static {}, Lcom/motorola/ccc/ota/sources/bota/BotaDownloadHandler;->-$$Nest$sfgeterrorCodeHandlers()Ljava/util/Map;

    move-result-object p1

    invoke-static {p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-interface {p1, v2}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lcom/motorola/ccc/ota/sources/bota/download/error/ResetSMToGettingDescriptor;

    if-eqz p1, :cond_3

    invoke-static {}, Lcom/motorola/ccc/ota/sources/bota/download/error/ResetSMToGettingDescriptor;->isRetryPending()Z

    move-result p2

    if-eqz p2, :cond_1

    const-string p1, "BotaDownloadHandler.failed(). retry pending, return"

    invoke-static {v0, p1}, Lcom/motorola/ccc/ota/utils/Logger;->error(Ljava/lang/String;Ljava/lang/String;)V

    iget-object p0, p0, Lcom/motorola/ccc/ota/sources/bota/BotaDownloadHandler$1;->this$0:Lcom/motorola/ccc/ota/sources/bota/BotaDownloadHandler;

    invoke-static {p0}, Lcom/motorola/ccc/ota/sources/bota/BotaDownloadHandler;->-$$Nest$fgetenv(Lcom/motorola/ccc/ota/sources/bota/BotaDownloadHandler;)Lcom/motorola/otalib/common/Environment/ApplicationEnv;

    move-result-object p0

    invoke-interface {p0}, Lcom/motorola/otalib/common/Environment/ApplicationEnv;->getUtilities()Lcom/motorola/otalib/common/Environment/ApplicationEnv$Utilities;

    move-result-object v0

    invoke-static {}, Lcom/motorola/ccc/ota/sources/bota/BotaDownloadHandler;->-$$Nest$sfgetversion()Ljava/lang/String;

    move-result-object v1

    new-instance p0, Ljava/io/File;

    invoke-static {}, Lcom/motorola/ccc/ota/sources/bota/BotaDownloadHandler;->-$$Nest$sfgetfileName()Ljava/lang/String;

    move-result-object p1

    invoke-direct {p0, p1}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-virtual {p0}, Ljava/io/File;->length()J

    move-result-wide v2

    invoke-static {}, Lcom/motorola/ccc/ota/sources/bota/BotaDownloadHandler;->-$$Nest$sfgetsize()J

    move-result-wide v4

    invoke-interface/range {v0 .. v5}, Lcom/motorola/otalib/common/Environment/ApplicationEnv$Utilities;->sendUpdateDownloadStatusRetried(Ljava/lang/String;JJ)V

    return-void

    :cond_1
    new-instance p2, Ljava/lang/StringBuilder;

    invoke-direct {p2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p2, p4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p2

    const-string p3, " during BOTA package download "

    invoke-virtual {p2, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p2

    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    const-string p3, "DOWNLOAD_FAILED_PACKAGE_4XX."

    invoke-virtual {p1, p2, v1, p3}, Lcom/motorola/ccc/ota/sources/bota/download/error/ResetSMToGettingDescriptor;->shouldRetry(Ljava/lang/String;ZLjava/lang/String;)Z

    move-result p1

    if-eqz p1, :cond_2

    iget-object p0, p0, Lcom/motorola/ccc/ota/sources/bota/BotaDownloadHandler$1;->this$0:Lcom/motorola/ccc/ota/sources/bota/BotaDownloadHandler;

    invoke-static {p0}, Lcom/motorola/ccc/ota/sources/bota/BotaDownloadHandler;->-$$Nest$fgetenv(Lcom/motorola/ccc/ota/sources/bota/BotaDownloadHandler;)Lcom/motorola/otalib/common/Environment/ApplicationEnv;

    move-result-object p0

    invoke-interface {p0}, Lcom/motorola/otalib/common/Environment/ApplicationEnv;->getUtilities()Lcom/motorola/otalib/common/Environment/ApplicationEnv$Utilities;

    move-result-object v1

    invoke-static {}, Lcom/motorola/ccc/ota/sources/bota/BotaDownloadHandler;->-$$Nest$sfgetversion()Ljava/lang/String;

    move-result-object v2

    new-instance p0, Ljava/io/File;

    invoke-static {}, Lcom/motorola/ccc/ota/sources/bota/BotaDownloadHandler;->-$$Nest$sfgetfileName()Ljava/lang/String;

    move-result-object p2

    invoke-direct {p0, p2}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-virtual {p0}, Ljava/io/File;->length()J

    move-result-wide v3

    invoke-static {}, Lcom/motorola/ccc/ota/sources/bota/BotaDownloadHandler;->-$$Nest$sfgetsize()J

    move-result-wide v5

    invoke-interface/range {v1 .. v6}, Lcom/motorola/otalib/common/Environment/ApplicationEnv$Utilities;->sendUpdateDownloadStatusRetried(Ljava/lang/String;JJ)V

    :cond_2
    new-instance p0, Ljava/lang/StringBuilder;

    const-string p2, "BotaDownloadHandler.failed(). retry status "

    invoke-direct {p0, p2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-static {v0, p0}, Lcom/motorola/ccc/ota/utils/Logger;->error(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_0

    :cond_3
    new-instance p1, Ljava/lang/StringBuilder;

    const-string v1, "Aborting the OTA process as there is no error handler installed "

    invoke-direct {p1, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object p1

    const-string p2, ":"

    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1, p4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {v0, p1}, Lcom/motorola/ccc/ota/utils/Logger;->info(Ljava/lang/String;Ljava/lang/String;)V

    new-instance p2, Ljava/io/File;

    invoke-static {}, Lcom/motorola/ccc/ota/sources/bota/BotaDownloadHandler;->-$$Nest$sfgetfileName()Ljava/lang/String;

    move-result-object p3

    invoke-direct {p2, p3}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-virtual {p2}, Ljava/io/File;->delete()Z

    iget-object p2, p0, Lcom/motorola/ccc/ota/sources/bota/BotaDownloadHandler$1;->this$0:Lcom/motorola/ccc/ota/sources/bota/BotaDownloadHandler;

    invoke-static {p2}, Lcom/motorola/ccc/ota/sources/bota/BotaDownloadHandler;->-$$Nest$fgetsm(Lcom/motorola/ccc/ota/sources/bota/BotaDownloadHandler;)Lcom/motorola/ccc/ota/CusSM;

    move-result-object p2

    invoke-static {}, Lcom/motorola/ccc/ota/sources/bota/BotaDownloadHandler;->-$$Nest$sfgetversion()Ljava/lang/String;

    move-result-object p3

    sget-object p4, Lcom/motorola/otalib/common/utils/UpgradeUtils$DownloadStatus;->STATUS_FAIL:Lcom/motorola/otalib/common/utils/UpgradeUtils$DownloadStatus;

    const-string v0, "DOWNLOAD_FAILED_PACKAGE_OTHER."

    invoke-virtual {p2, p3, p4, p1, v0}, Lcom/motorola/ccc/ota/CusSM;->failDownload(Ljava/lang/String;Lcom/motorola/otalib/common/utils/UpgradeUtils$DownloadStatus;Ljava/lang/String;Ljava/lang/String;)V

    iget-object p0, p0, Lcom/motorola/ccc/ota/sources/bota/BotaDownloadHandler$1;->this$0:Lcom/motorola/ccc/ota/sources/bota/BotaDownloadHandler;

    invoke-static {p0}, Lcom/motorola/ccc/ota/sources/bota/BotaDownloadHandler;->-$$Nest$fgetsettings(Lcom/motorola/ccc/ota/sources/bota/BotaDownloadHandler;)Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    move-result-object p0

    sget-object p1, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->ADVANCE_DL_RETRY_COUNT:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    invoke-virtual {p0, p1}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->incrementPrefs(Lcom/motorola/otalib/common/settings/ISetting;)V

    :goto_0
    return-void
.end method

.method public finished(Ljava/lang/String;)V
    .locals 4

    iget-object p1, p0, Lcom/motorola/ccc/ota/sources/bota/BotaDownloadHandler$1;->this$0:Lcom/motorola/ccc/ota/sources/bota/BotaDownloadHandler;

    invoke-static {p1}, Lcom/motorola/ccc/ota/sources/bota/BotaDownloadHandler;->-$$Nest$fgetsm(Lcom/motorola/ccc/ota/sources/bota/BotaDownloadHandler;)Lcom/motorola/ccc/ota/CusSM;

    move-result-object p1

    invoke-static {}, Lcom/motorola/ccc/ota/sources/bota/BotaDownloadHandler;->-$$Nest$sfgetversion()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1, v0}, Lcom/motorola/ccc/ota/CusSM;->getDescription(Ljava/lang/String;)Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database$Descriptor;

    move-result-object p1

    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "BotaDownloadHandler.finished: I appear to have read the entire file "

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v1, p0, Lcom/motorola/ccc/ota/sources/bota/BotaDownloadHandler$1;->this$0:Lcom/motorola/ccc/ota/sources/bota/BotaDownloadHandler;

    invoke-static {v1}, Lcom/motorola/ccc/ota/sources/bota/BotaDownloadHandler;->-$$Nest$fget_dlHelper(Lcom/motorola/ccc/ota/sources/bota/BotaDownloadHandler;)Lcom/motorola/ccc/ota/DownloadHelper;

    move-result-object v1

    invoke-virtual {v1}, Lcom/motorola/ccc/ota/DownloadHelper;->expected()J

    move-result-wide v1

    invoke-virtual {v0, v1, v2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "/"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lcom/motorola/ccc/ota/sources/bota/BotaDownloadHandler$1;->this$0:Lcom/motorola/ccc/ota/sources/bota/BotaDownloadHandler;

    invoke-static {v1}, Lcom/motorola/ccc/ota/sources/bota/BotaDownloadHandler;->-$$Nest$fget_dlHelper(Lcom/motorola/ccc/ota/sources/bota/BotaDownloadHandler;)Lcom/motorola/ccc/ota/DownloadHelper;

    move-result-object v1

    invoke-virtual {v1}, Lcom/motorola/ccc/ota/DownloadHelper;->left()J

    move-result-wide v1

    invoke-virtual {v0, v1, v2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    const-string v1, "OtaApp"

    invoke-static {v1, v0}, Lcom/motorola/ccc/ota/utils/Logger;->info(Ljava/lang/String;Ljava/lang/String;)V

    invoke-static {}, Lcom/motorola/ccc/ota/utils/BuildPropReader;->isBotaATT()Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/motorola/ccc/ota/sources/bota/BotaDownloadHandler$1;->this$0:Lcom/motorola/ccc/ota/sources/bota/BotaDownloadHandler;

    invoke-static {v0}, Lcom/motorola/ccc/ota/sources/bota/BotaDownloadHandler;->-$$Nest$fgetenv(Lcom/motorola/ccc/ota/sources/bota/BotaDownloadHandler;)Lcom/motorola/otalib/common/Environment/ApplicationEnv;

    move-result-object v0

    invoke-interface {v0}, Lcom/motorola/otalib/common/Environment/ApplicationEnv;->getUtilities()Lcom/motorola/otalib/common/Environment/ApplicationEnv$Utilities;

    move-result-object v0

    invoke-interface {v0}, Lcom/motorola/otalib/common/Environment/ApplicationEnv$Utilities;->cleanFotaWifiDiscoveryTimer()V

    :cond_0
    iget-object v0, p0, Lcom/motorola/ccc/ota/sources/bota/BotaDownloadHandler$1;->this$0:Lcom/motorola/ccc/ota/sources/bota/BotaDownloadHandler;

    invoke-static {v0}, Lcom/motorola/ccc/ota/sources/bota/BotaDownloadHandler;->-$$Nest$fgetctx(Lcom/motorola/ccc/ota/sources/bota/BotaDownloadHandler;)Landroid/content/Context;

    move-result-object v0

    const-string v2, "connectivity"

    invoke-virtual {v0, v2}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/net/ConnectivityManager;

    iget-object v2, p0, Lcom/motorola/ccc/ota/sources/bota/BotaDownloadHandler$1;->this$0:Lcom/motorola/ccc/ota/sources/bota/BotaDownloadHandler;

    invoke-static {v2}, Lcom/motorola/ccc/ota/sources/bota/BotaDownloadHandler;->-$$Nest$fgetctx(Lcom/motorola/ccc/ota/sources/bota/BotaDownloadHandler;)Landroid/content/Context;

    move-result-object v2

    const-string v3, "phone"

    invoke-virtual {v2, v3}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroid/telephony/TelephonyManager;

    iget-object v2, p0, Lcom/motorola/ccc/ota/sources/bota/BotaDownloadHandler$1;->this$0:Lcom/motorola/ccc/ota/sources/bota/BotaDownloadHandler;

    invoke-static {v2}, Lcom/motorola/ccc/ota/sources/bota/BotaDownloadHandler;->-$$Nest$fget_dlHelper(Lcom/motorola/ccc/ota/sources/bota/BotaDownloadHandler;)Lcom/motorola/ccc/ota/DownloadHelper;

    move-result-object v3

    invoke-virtual {v3}, Lcom/motorola/ccc/ota/DownloadHelper;->fileName()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Lcom/motorola/ccc/ota/sources/bota/BotaDownloadHandler;->-$$Nest$mverifyFile(Lcom/motorola/ccc/ota/sources/bota/BotaDownloadHandler;Ljava/lang/String;)Z

    move-result v2

    if-nez v2, :cond_1

    const-string v0, "BotaDownloadHandler.finished: verifyFile failed"

    invoke-static {v1, v0}, Lcom/motorola/ccc/ota/utils/Logger;->info(Ljava/lang/String;Ljava/lang/String;)V

    iget-object v0, p0, Lcom/motorola/ccc/ota/sources/bota/BotaDownloadHandler$1;->this$0:Lcom/motorola/ccc/ota/sources/bota/BotaDownloadHandler;

    invoke-static {v0}, Lcom/motorola/ccc/ota/sources/bota/BotaDownloadHandler;->-$$Nest$fgetsm(Lcom/motorola/ccc/ota/sources/bota/BotaDownloadHandler;)Lcom/motorola/ccc/ota/CusSM;

    move-result-object v0

    invoke-interface {p1}, Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database$Descriptor;->getVersion()Ljava/lang/String;

    move-result-object p1

    sget-object v1, Lcom/motorola/otalib/common/utils/UpgradeUtils$DownloadStatus;->STATUS_VERIFY:Lcom/motorola/otalib/common/utils/UpgradeUtils$DownloadStatus;

    iget-object v2, p0, Lcom/motorola/ccc/ota/sources/bota/BotaDownloadHandler$1;->this$0:Lcom/motorola/ccc/ota/sources/bota/BotaDownloadHandler;

    invoke-static {v2}, Lcom/motorola/ccc/ota/sources/bota/BotaDownloadHandler;->-$$Nest$fgetsettings(Lcom/motorola/ccc/ota/sources/bota/BotaDownloadHandler;)Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    move-result-object v2

    sget-object v3, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->UPGRADE_STATUS_VERIFY:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    invoke-virtual {v2, v3}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->getString(Lcom/motorola/otalib/common/settings/ISetting;)Ljava/lang/String;

    move-result-object v2

    const-string v3, "PACKAGE_VERIFICATION_FAILED."

    invoke-virtual {v0, p1, v1, v2, v3}, Lcom/motorola/ccc/ota/CusSM;->failDownload(Ljava/lang/String;Lcom/motorola/otalib/common/utils/UpgradeUtils$DownloadStatus;Ljava/lang/String;Ljava/lang/String;)V

    iget-object p0, p0, Lcom/motorola/ccc/ota/sources/bota/BotaDownloadHandler$1;->this$0:Lcom/motorola/ccc/ota/sources/bota/BotaDownloadHandler;

    invoke-static {p0}, Lcom/motorola/ccc/ota/sources/bota/BotaDownloadHandler;->-$$Nest$fgetsettings(Lcom/motorola/ccc/ota/sources/bota/BotaDownloadHandler;)Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    move-result-object p0

    sget-object p1, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->ADVANCE_DL_RETRY_COUNT:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    invoke-virtual {p0, p1}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->incrementPrefs(Lcom/motorola/otalib/common/settings/ISetting;)V

    return-void

    :cond_1
    iget-object v1, p0, Lcom/motorola/ccc/ota/sources/bota/BotaDownloadHandler$1;->this$0:Lcom/motorola/ccc/ota/sources/bota/BotaDownloadHandler;

    const/4 v2, 0x0

    invoke-virtual {v1, v2}, Lcom/motorola/ccc/ota/sources/bota/BotaDownloadHandler;->setProgressAndActualDownloadTime(Z)V

    invoke-static {}, Lcom/motorola/ccc/ota/utils/BuildPropReader;->isVerizon()Z

    move-result v1

    if-eqz v1, :cond_2

    iget-object v1, p0, Lcom/motorola/ccc/ota/sources/bota/BotaDownloadHandler$1;->this$0:Lcom/motorola/ccc/ota/sources/bota/BotaDownloadHandler;

    invoke-static {v1}, Lcom/motorola/ccc/ota/sources/bota/BotaDownloadHandler;->-$$Nest$fgetctx(Lcom/motorola/ccc/ota/sources/bota/BotaDownloadHandler;)Landroid/content/Context;

    move-result-object v1

    invoke-static {v1}, Lcom/motorola/ccc/ota/utils/UpgradeUtilMethods;->sendDownloadCompletedToSettings(Landroid/content/Context;)V

    :cond_2
    iget-object v1, p0, Lcom/motorola/ccc/ota/sources/bota/BotaDownloadHandler$1;->this$0:Lcom/motorola/ccc/ota/sources/bota/BotaDownloadHandler;

    invoke-static {v1}, Lcom/motorola/ccc/ota/sources/bota/BotaDownloadHandler;->-$$Nest$fgetsettings(Lcom/motorola/ccc/ota/sources/bota/BotaDownloadHandler;)Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    move-result-object v1

    iget-object v2, p0, Lcom/motorola/ccc/ota/sources/bota/BotaDownloadHandler$1;->this$0:Lcom/motorola/ccc/ota/sources/bota/BotaDownloadHandler;

    invoke-static {v2}, Lcom/motorola/ccc/ota/sources/bota/BotaDownloadHandler;->-$$Nest$fgetctx(Lcom/motorola/ccc/ota/sources/bota/BotaDownloadHandler;)Landroid/content/Context;

    move-result-object v2

    invoke-static {v1, v2, v0}, Lcom/motorola/ccc/ota/stats/StatsHelper;->setAndBuildDownloadStats(Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;Landroid/content/Context;Landroid/net/ConnectivityManager;)V

    iget-object v0, p0, Lcom/motorola/ccc/ota/sources/bota/BotaDownloadHandler$1;->this$0:Lcom/motorola/ccc/ota/sources/bota/BotaDownloadHandler;

    invoke-static {v0}, Lcom/motorola/ccc/ota/sources/bota/BotaDownloadHandler;->-$$Nest$fgetenv(Lcom/motorola/ccc/ota/sources/bota/BotaDownloadHandler;)Lcom/motorola/otalib/common/Environment/ApplicationEnv;

    move-result-object v0

    invoke-interface {v0}, Lcom/motorola/otalib/common/Environment/ApplicationEnv;->getUtilities()Lcom/motorola/otalib/common/Environment/ApplicationEnv$Utilities;

    move-result-object v0

    invoke-interface {p1}, Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database$Descriptor;->getVersion()Ljava/lang/String;

    move-result-object v1

    invoke-interface {p1}, Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database$Descriptor;->getRepository()Ljava/lang/String;

    move-result-object p1

    const/4 v2, 0x0

    invoke-interface {v0, v1, p1, v2}, Lcom/motorola/otalib/common/Environment/ApplicationEnv$Utilities;->sendInternalNotification(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    iget-object p1, p0, Lcom/motorola/ccc/ota/sources/bota/BotaDownloadHandler$1;->this$0:Lcom/motorola/ccc/ota/sources/bota/BotaDownloadHandler;

    invoke-static {p1}, Lcom/motorola/ccc/ota/sources/bota/BotaDownloadHandler;->-$$Nest$fgetsettings(Lcom/motorola/ccc/ota/sources/bota/BotaDownloadHandler;)Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    move-result-object p1

    sget-object v0, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->OTA_DOWNLOAD_RETRY_ATTEMPTS:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    invoke-virtual {p1, v0}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->removeConfig(Lcom/motorola/otalib/common/settings/ISetting;)V

    iget-object p1, p0, Lcom/motorola/ccc/ota/sources/bota/BotaDownloadHandler$1;->this$0:Lcom/motorola/ccc/ota/sources/bota/BotaDownloadHandler;

    invoke-static {p1}, Lcom/motorola/ccc/ota/sources/bota/BotaDownloadHandler;->-$$Nest$fgetsettings(Lcom/motorola/ccc/ota/sources/bota/BotaDownloadHandler;)Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    move-result-object p1

    sget-object v0, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->OTA_DOWNLOAD_EXCEPTION_RETRY_ATTEMPTS:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    invoke-virtual {p1, v0}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->removeConfig(Lcom/motorola/otalib/common/settings/ISetting;)V

    iget-object p1, p0, Lcom/motorola/ccc/ota/sources/bota/BotaDownloadHandler$1;->this$0:Lcom/motorola/ccc/ota/sources/bota/BotaDownloadHandler;

    invoke-static {p1}, Lcom/motorola/ccc/ota/sources/bota/BotaDownloadHandler;->-$$Nest$fgetsettings(Lcom/motorola/ccc/ota/sources/bota/BotaDownloadHandler;)Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    move-result-object p1

    sget-object v0, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->ADVANCE_DL_RETRY_COUNT:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    invoke-virtual {p1, v0}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->removeConfig(Lcom/motorola/otalib/common/settings/ISetting;)V

    iget-object p0, p0, Lcom/motorola/ccc/ota/sources/bota/BotaDownloadHandler$1;->this$0:Lcom/motorola/ccc/ota/sources/bota/BotaDownloadHandler;

    invoke-static {p0}, Lcom/motorola/ccc/ota/sources/bota/BotaDownloadHandler;->-$$Nest$munBindwithDownloadService(Lcom/motorola/ccc/ota/sources/bota/BotaDownloadHandler;)V

    return-void
.end method

.method public initFailed(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .locals 2

    const-string p1, "OtaApp"

    const-string v0, "BotaDownloadHandler.initFailed()"

    invoke-static {p1, v0}, Lcom/motorola/ccc/ota/utils/Logger;->info(Ljava/lang/String;Ljava/lang/String;)V

    iget-object p1, p0, Lcom/motorola/ccc/ota/sources/bota/BotaDownloadHandler$1;->this$0:Lcom/motorola/ccc/ota/sources/bota/BotaDownloadHandler;

    invoke-static {p1}, Lcom/motorola/ccc/ota/sources/bota/BotaDownloadHandler;->-$$Nest$fgetsm(Lcom/motorola/ccc/ota/sources/bota/BotaDownloadHandler;)Lcom/motorola/ccc/ota/CusSM;

    move-result-object p1

    invoke-static {}, Lcom/motorola/ccc/ota/sources/bota/BotaDownloadHandler;->-$$Nest$sfgetversion()Ljava/lang/String;

    move-result-object v0

    sget-object v1, Lcom/motorola/otalib/common/utils/UpgradeUtils$DownloadStatus;->STATUS_FAIL:Lcom/motorola/otalib/common/utils/UpgradeUtils$DownloadStatus;

    invoke-virtual {p1, v0, v1, p2, p3}, Lcom/motorola/ccc/ota/CusSM;->failDownload(Ljava/lang/String;Lcom/motorola/otalib/common/utils/UpgradeUtils$DownloadStatus;Ljava/lang/String;Ljava/lang/String;)V

    iget-object p1, p0, Lcom/motorola/ccc/ota/sources/bota/BotaDownloadHandler$1;->this$0:Lcom/motorola/ccc/ota/sources/bota/BotaDownloadHandler;

    const/4 p2, 0x0

    invoke-virtual {p1, p2}, Lcom/motorola/ccc/ota/sources/bota/BotaDownloadHandler;->setProgressAndActualDownloadTime(Z)V

    iget-object p0, p0, Lcom/motorola/ccc/ota/sources/bota/BotaDownloadHandler$1;->this$0:Lcom/motorola/ccc/ota/sources/bota/BotaDownloadHandler;

    invoke-static {p0}, Lcom/motorola/ccc/ota/sources/bota/BotaDownloadHandler;->-$$Nest$munBindwithDownloadService(Lcom/motorola/ccc/ota/sources/bota/BotaDownloadHandler;)V

    return-void
.end method

.method public progress(Ljava/lang/String;)V
    .locals 8

    iget-object p1, p0, Lcom/motorola/ccc/ota/sources/bota/BotaDownloadHandler$1;->this$0:Lcom/motorola/ccc/ota/sources/bota/BotaDownloadHandler;

    invoke-static {p1}, Lcom/motorola/ccc/ota/sources/bota/BotaDownloadHandler;->-$$Nest$fgetsm(Lcom/motorola/ccc/ota/sources/bota/BotaDownloadHandler;)Lcom/motorola/ccc/ota/CusSM;

    move-result-object p1

    invoke-static {}, Lcom/motorola/ccc/ota/sources/bota/BotaDownloadHandler;->-$$Nest$sfgetversion()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1, v0}, Lcom/motorola/ccc/ota/CusSM;->getDescription(Ljava/lang/String;)Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database$Descriptor;

    move-result-object p1

    iget-object v0, p0, Lcom/motorola/ccc/ota/sources/bota/BotaDownloadHandler$1;->this$0:Lcom/motorola/ccc/ota/sources/bota/BotaDownloadHandler;

    invoke-static {v0}, Lcom/motorola/ccc/ota/sources/bota/BotaDownloadHandler;->-$$Nest$fgetsettings(Lcom/motorola/ccc/ota/sources/bota/BotaDownloadHandler;)Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    move-result-object v0

    sget-object v1, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->OTA_DOWNLOAD_RETRY_ATTEMPTS:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    invoke-virtual {v0, v1}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->removeConfig(Lcom/motorola/otalib/common/settings/ISetting;)V

    iget-object v0, p0, Lcom/motorola/ccc/ota/sources/bota/BotaDownloadHandler$1;->this$0:Lcom/motorola/ccc/ota/sources/bota/BotaDownloadHandler;

    invoke-static {v0}, Lcom/motorola/ccc/ota/sources/bota/BotaDownloadHandler;->-$$Nest$fgetsettings(Lcom/motorola/ccc/ota/sources/bota/BotaDownloadHandler;)Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    move-result-object v0

    sget-object v1, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->OTA_DOWNLOAD_EXCEPTION_RETRY_ATTEMPTS:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    invoke-virtual {v0, v1}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->removeConfig(Lcom/motorola/otalib/common/settings/ISetting;)V

    invoke-static {}, Lcom/motorola/ccc/ota/sources/bota/download/error/ResetSMToGettingDescriptor;->isRetryPending()Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-static {}, Lcom/motorola/ccc/ota/sources/bota/download/error/ResetSMToGettingDescriptor;->clearRetryTask()V

    :cond_0
    invoke-static {}, Lcom/motorola/ccc/ota/sources/bota/download/error/ResetSMToGettingDescriptorExceptionHandler;->isRetryPending()Z

    move-result v0

    if-eqz v0, :cond_1

    invoke-static {}, Lcom/motorola/ccc/ota/sources/bota/download/error/ResetSMToGettingDescriptorExceptionHandler;->clearRetryTask()V

    :cond_1
    iget-object v0, p0, Lcom/motorola/ccc/ota/sources/bota/BotaDownloadHandler$1;->this$0:Lcom/motorola/ccc/ota/sources/bota/BotaDownloadHandler;

    invoke-static {v0}, Lcom/motorola/ccc/ota/sources/bota/BotaDownloadHandler;->-$$Nest$fgetctx(Lcom/motorola/ccc/ota/sources/bota/BotaDownloadHandler;)Landroid/content/Context;

    move-result-object v0

    const-string v1, "connectivity"

    invoke-virtual {v0, v1}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/net/ConnectivityManager;

    invoke-static {}, Lcom/motorola/ccc/ota/sources/bota/BotaDownloadHandler;->-$$Nest$sfgetwifiOnly()Z

    move-result v1

    const-string v2, "OtaApp"

    if-eqz v1, :cond_3

    invoke-static {v0}, Lcom/motorola/otalib/common/utils/NetworkUtils;->isWifi(Landroid/net/ConnectivityManager;)Z

    move-result v0

    if-eqz v0, :cond_2

    iget-object v0, p0, Lcom/motorola/ccc/ota/sources/bota/BotaDownloadHandler$1;->this$0:Lcom/motorola/ccc/ota/sources/bota/BotaDownloadHandler;

    invoke-static {v0}, Lcom/motorola/ccc/ota/sources/bota/BotaDownloadHandler;->-$$Nest$fgetenv(Lcom/motorola/ccc/ota/sources/bota/BotaDownloadHandler;)Lcom/motorola/otalib/common/Environment/ApplicationEnv;

    move-result-object v0

    invoke-interface {v0}, Lcom/motorola/otalib/common/Environment/ApplicationEnv;->getUtilities()Lcom/motorola/otalib/common/Environment/ApplicationEnv$Utilities;

    move-result-object v0

    invoke-interface {v0}, Lcom/motorola/otalib/common/Environment/ApplicationEnv$Utilities;->cleanBotaWifiDiscoveryTimer()V

    goto :goto_0

    :cond_2
    const-string p1, " WiFi-only package but not on WiFi; we cannot start a new download; startWifiDiscoveryTimer"

    invoke-static {v2, p1}, Lcom/motorola/ccc/ota/utils/Logger;->debug(Ljava/lang/String;Ljava/lang/String;)V

    iget-object p1, p0, Lcom/motorola/ccc/ota/sources/bota/BotaDownloadHandler$1;->this$0:Lcom/motorola/ccc/ota/sources/bota/BotaDownloadHandler;

    invoke-static {p1}, Lcom/motorola/ccc/ota/sources/bota/BotaDownloadHandler;->-$$Nest$fgetenv(Lcom/motorola/ccc/ota/sources/bota/BotaDownloadHandler;)Lcom/motorola/otalib/common/Environment/ApplicationEnv;

    move-result-object p1

    invoke-interface {p1}, Lcom/motorola/otalib/common/Environment/ApplicationEnv;->getUtilities()Lcom/motorola/otalib/common/Environment/ApplicationEnv$Utilities;

    move-result-object p1

    invoke-interface {p1}, Lcom/motorola/otalib/common/Environment/ApplicationEnv$Utilities;->startBotaWifiDiscoveryTimer()V

    iget-object p1, p0, Lcom/motorola/ccc/ota/sources/bota/BotaDownloadHandler$1;->this$0:Lcom/motorola/ccc/ota/sources/bota/BotaDownloadHandler;

    const/4 v0, 0x0

    invoke-virtual {p1, v0}, Lcom/motorola/ccc/ota/sources/bota/BotaDownloadHandler;->setProgressAndActualDownloadTime(Z)V

    iget-object p0, p0, Lcom/motorola/ccc/ota/sources/bota/BotaDownloadHandler$1;->this$0:Lcom/motorola/ccc/ota/sources/bota/BotaDownloadHandler;

    invoke-static {p0}, Lcom/motorola/ccc/ota/sources/bota/BotaDownloadHandler;->-$$Nest$munBindwithDownloadService(Lcom/motorola/ccc/ota/sources/bota/BotaDownloadHandler;)V

    return-void

    :cond_3
    :goto_0
    iget-object v0, p0, Lcom/motorola/ccc/ota/sources/bota/BotaDownloadHandler$1;->this$0:Lcom/motorola/ccc/ota/sources/bota/BotaDownloadHandler;

    invoke-static {v0}, Lcom/motorola/ccc/ota/sources/bota/BotaDownloadHandler;->-$$Nest$fget_dlHelper(Lcom/motorola/ccc/ota/sources/bota/BotaDownloadHandler;)Lcom/motorola/ccc/ota/DownloadHelper;

    move-result-object v0

    invoke-virtual {v0}, Lcom/motorola/ccc/ota/DownloadHelper;->notifyProgress()Z

    move-result v0

    if-eqz v0, :cond_4

    iget-object v0, p0, Lcom/motorola/ccc/ota/sources/bota/BotaDownloadHandler$1;->this$0:Lcom/motorola/ccc/ota/sources/bota/BotaDownloadHandler;

    invoke-static {v0}, Lcom/motorola/ccc/ota/sources/bota/BotaDownloadHandler;->-$$Nest$fget_dlHelper(Lcom/motorola/ccc/ota/sources/bota/BotaDownloadHandler;)Lcom/motorola/ccc/ota/DownloadHelper;

    move-result-object v0

    invoke-virtual {v0}, Lcom/motorola/ccc/ota/DownloadHelper;->incrementPercentDownloaded()V

    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "Notifying Updater to update progress "

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v1, p0, Lcom/motorola/ccc/ota/sources/bota/BotaDownloadHandler$1;->this$0:Lcom/motorola/ccc/ota/sources/bota/BotaDownloadHandler;

    invoke-static {v1}, Lcom/motorola/ccc/ota/sources/bota/BotaDownloadHandler;->-$$Nest$fget_dlHelper(Lcom/motorola/ccc/ota/sources/bota/BotaDownloadHandler;)Lcom/motorola/ccc/ota/DownloadHelper;

    move-result-object v1

    invoke-virtual {v1}, Lcom/motorola/ccc/ota/DownloadHelper;->get_percentDownloaded()I

    move-result v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v2, v0}, Lcom/motorola/ccc/ota/utils/Logger;->verbose(Ljava/lang/String;Ljava/lang/String;)V

    iget-object v0, p0, Lcom/motorola/ccc/ota/sources/bota/BotaDownloadHandler$1;->this$0:Lcom/motorola/ccc/ota/sources/bota/BotaDownloadHandler;

    invoke-static {v0}, Lcom/motorola/ccc/ota/sources/bota/BotaDownloadHandler;->-$$Nest$fgetenv(Lcom/motorola/ccc/ota/sources/bota/BotaDownloadHandler;)Lcom/motorola/otalib/common/Environment/ApplicationEnv;

    move-result-object v0

    invoke-interface {v0}, Lcom/motorola/otalib/common/Environment/ApplicationEnv;->getUtilities()Lcom/motorola/otalib/common/Environment/ApplicationEnv$Utilities;

    move-result-object v1

    iget-object v0, p0, Lcom/motorola/ccc/ota/sources/bota/BotaDownloadHandler$1;->this$0:Lcom/motorola/ccc/ota/sources/bota/BotaDownloadHandler;

    invoke-static {v0}, Lcom/motorola/ccc/ota/sources/bota/BotaDownloadHandler;->-$$Nest$fget_dlHelper(Lcom/motorola/ccc/ota/sources/bota/BotaDownloadHandler;)Lcom/motorola/ccc/ota/DownloadHelper;

    move-result-object v0

    invoke-virtual {v0}, Lcom/motorola/ccc/ota/DownloadHelper;->version()Ljava/lang/String;

    move-result-object v2

    iget-object v0, p0, Lcom/motorola/ccc/ota/sources/bota/BotaDownloadHandler$1;->this$0:Lcom/motorola/ccc/ota/sources/bota/BotaDownloadHandler;

    invoke-static {v0}, Lcom/motorola/ccc/ota/sources/bota/BotaDownloadHandler;->-$$Nest$fget_dlHelper(Lcom/motorola/ccc/ota/sources/bota/BotaDownloadHandler;)Lcom/motorola/ccc/ota/DownloadHelper;

    move-result-object v0

    invoke-virtual {v0}, Lcom/motorola/ccc/ota/DownloadHelper;->size()J

    move-result-wide v3

    iget-object p0, p0, Lcom/motorola/ccc/ota/sources/bota/BotaDownloadHandler$1;->this$0:Lcom/motorola/ccc/ota/sources/bota/BotaDownloadHandler;

    invoke-static {p0}, Lcom/motorola/ccc/ota/sources/bota/BotaDownloadHandler;->-$$Nest$fget_dlHelper(Lcom/motorola/ccc/ota/sources/bota/BotaDownloadHandler;)Lcom/motorola/ccc/ota/DownloadHelper;

    move-result-object p0

    invoke-virtual {p0}, Lcom/motorola/ccc/ota/DownloadHelper;->expected()J

    move-result-wide v5

    invoke-interface {p1}, Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database$Descriptor;->getRepository()Ljava/lang/String;

    move-result-object v7

    invoke-interface/range {v1 .. v7}, Lcom/motorola/otalib/common/Environment/ApplicationEnv$Utilities;->sendUpdateDownloadStatusProgress(Ljava/lang/String;JJLjava/lang/String;)V

    :cond_4
    return-void
.end method

.method public suspended(Ljava/lang/String;Z)V
    .locals 8

    const-string p1, "OtaApp"

    const-string p2, "BotaDownloadHandler.suspended()"

    invoke-static {p1, p2}, Lcom/motorola/ccc/ota/utils/Logger;->info(Ljava/lang/String;Ljava/lang/String;)V

    iget-object p1, p0, Lcom/motorola/ccc/ota/sources/bota/BotaDownloadHandler$1;->this$0:Lcom/motorola/ccc/ota/sources/bota/BotaDownloadHandler;

    invoke-static {p1}, Lcom/motorola/ccc/ota/sources/bota/BotaDownloadHandler;->-$$Nest$fgetenv(Lcom/motorola/ccc/ota/sources/bota/BotaDownloadHandler;)Lcom/motorola/otalib/common/Environment/ApplicationEnv;

    move-result-object p1

    invoke-interface {p1}, Lcom/motorola/otalib/common/Environment/ApplicationEnv;->getUtilities()Lcom/motorola/otalib/common/Environment/ApplicationEnv$Utilities;

    move-result-object v0

    invoke-static {}, Lcom/motorola/ccc/ota/sources/bota/BotaDownloadHandler;->-$$Nest$sfgetversion()Ljava/lang/String;

    move-result-object v1

    new-instance p1, Ljava/io/File;

    invoke-static {}, Lcom/motorola/ccc/ota/sources/bota/BotaDownloadHandler;->-$$Nest$sfgetfileName()Ljava/lang/String;

    move-result-object p2

    invoke-direct {p1, p2}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-virtual {p1}, Ljava/io/File;->length()J

    move-result-wide v2

    invoke-static {}, Lcom/motorola/ccc/ota/sources/bota/BotaDownloadHandler;->-$$Nest$sfgetsize()J

    move-result-wide v4

    invoke-static {}, Lcom/motorola/ccc/ota/sources/bota/BotaDownloadHandler;->-$$Nest$sfgetrepo()Ljava/lang/String;

    move-result-object v6

    invoke-static {}, Lcom/motorola/ccc/ota/sources/bota/BotaDownloadHandler;->-$$Nest$sfgetwifiOnly()Z

    move-result v7

    invoke-interface/range {v0 .. v7}, Lcom/motorola/otalib/common/Environment/ApplicationEnv$Utilities;->sendUpdateDownloadStatusSuspended(Ljava/lang/String;JJLjava/lang/String;Z)V

    iget-object p1, p0, Lcom/motorola/ccc/ota/sources/bota/BotaDownloadHandler$1;->this$0:Lcom/motorola/ccc/ota/sources/bota/BotaDownloadHandler;

    const/4 p2, 0x0

    invoke-virtual {p1, p2}, Lcom/motorola/ccc/ota/sources/bota/BotaDownloadHandler;->setProgressAndActualDownloadTime(Z)V

    iget-object p0, p0, Lcom/motorola/ccc/ota/sources/bota/BotaDownloadHandler$1;->this$0:Lcom/motorola/ccc/ota/sources/bota/BotaDownloadHandler;

    invoke-static {p0}, Lcom/motorola/ccc/ota/sources/bota/BotaDownloadHandler;->-$$Nest$munBindwithDownloadService(Lcom/motorola/ccc/ota/sources/bota/BotaDownloadHandler;)V

    return-void
.end method
