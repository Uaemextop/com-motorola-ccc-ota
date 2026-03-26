.class Lcom/motorola/ccc/ota/installer/updaterEngine/StreamingUpdate$StreamingUpdateBroadcastReceiver;
.super Landroid/content/BroadcastReceiver;
.source "StreamingUpdate.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/motorola/ccc/ota/installer/updaterEngine/StreamingUpdate;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "StreamingUpdateBroadcastReceiver"
.end annotation


# instance fields
.field final synthetic this$0:Lcom/motorola/ccc/ota/installer/updaterEngine/StreamingUpdate;


# direct methods
.method private constructor <init>(Lcom/motorola/ccc/ota/installer/updaterEngine/StreamingUpdate;)V
    .locals 0

    iput-object p1, p0, Lcom/motorola/ccc/ota/installer/updaterEngine/StreamingUpdate$StreamingUpdateBroadcastReceiver;->this$0:Lcom/motorola/ccc/ota/installer/updaterEngine/StreamingUpdate;

    invoke-direct {p0}, Landroid/content/BroadcastReceiver;-><init>()V

    return-void
.end method

.method synthetic constructor <init>(Lcom/motorola/ccc/ota/installer/updaterEngine/StreamingUpdate;Lcom/motorola/ccc/ota/installer/updaterEngine/StreamingUpdate$StreamingUpdateBroadcastReceiver-IA;)V
    .locals 0

    invoke-direct {p0, p1}, Lcom/motorola/ccc/ota/installer/updaterEngine/StreamingUpdate$StreamingUpdateBroadcastReceiver;-><init>(Lcom/motorola/ccc/ota/installer/updaterEngine/StreamingUpdate;)V

    return-void
.end method


# virtual methods
.method public onReceive(Landroid/content/Context;Landroid/content/Intent;)V
    .locals 7

    new-instance p1, Ljava/lang/StringBuilder;

    const-string v0, "StreamingUpdateBroadcastReceiver received "

    invoke-direct {p1, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p2}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    const-string v0, "OtaApp"

    invoke-static {v0, p1}, Lcom/motorola/ccc/ota/utils/Logger;->debug(Ljava/lang/String;Ljava/lang/String;)V

    const-string p1, "com.motorola.ccc.ota.ACTION_BATTERY_LOW"

    invoke-virtual {p2}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p1, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_0

    invoke-static {}, Lcom/motorola/ccc/ota/installer/updaterEngine/common/UpdaterEngineHelper;->cancelUpdateEngine()Z

    return-void

    :cond_0
    const-string p1, "com.motorola.ccc.ota.ACTION_DATA_SAVER_DURING_AB_STREAMING"

    invoke-virtual {p2}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p1, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    const/4 v1, 0x4

    const/4 v2, 0x0

    if-eqz p1, :cond_1

    iget-object p1, p0, Lcom/motorola/ccc/ota/installer/updaterEngine/StreamingUpdate$StreamingUpdateBroadcastReceiver;->this$0:Lcom/motorola/ccc/ota/installer/updaterEngine/StreamingUpdate;

    iget-object p1, p1, Lcom/motorola/ccc/ota/installer/updaterEngine/StreamingUpdate;->_settings:Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    sget-object v3, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->STORED_AB_STATUS:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    invoke-virtual {p1, v3, v2}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->getInt(Lcom/motorola/otalib/common/settings/ISetting;I)I

    move-result p1

    if-ge p1, v1, :cond_1

    invoke-static {}, Lcom/motorola/ccc/ota/installer/updaterEngine/common/UpdaterEngineHelper;->cancelUpdateEngine()Z

    :cond_1
    invoke-virtual {p2}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object p1

    const-string v3, "com.motorola.ccc.ota.ACTION_AB_APPLY_PAYLOAD_SUSPEND"

    invoke-virtual {p1, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_3

    iget-object p0, p0, Lcom/motorola/ccc/ota/installer/updaterEngine/StreamingUpdate$StreamingUpdateBroadcastReceiver;->this$0:Lcom/motorola/ccc/ota/installer/updaterEngine/StreamingUpdate;

    iget-object p0, p0, Lcom/motorola/ccc/ota/installer/updaterEngine/StreamingUpdate;->_settings:Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    sget-object p1, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->STORED_AB_STATUS:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    invoke-virtual {p0, p1, v2}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->getInt(Lcom/motorola/otalib/common/settings/ISetting;I)I

    move-result p0

    if-ge p0, v1, :cond_2

    invoke-static {}, Lcom/motorola/ccc/ota/installer/updaterEngine/StreamingUpdate;->-$$Nest$sfgetnetworkDetails()Lcom/motorola/ccc/ota/installer/updaterEngine/download/UEDownloadRequestBuilder$NetworkDetails;

    move-result-object p0

    if-eqz p0, :cond_2

    invoke-static {}, Lcom/motorola/ccc/ota/installer/updaterEngine/StreamingUpdate;->-$$Nest$sfgetnetworkDetails()Lcom/motorola/ccc/ota/installer/updaterEngine/download/UEDownloadRequestBuilder$NetworkDetails;

    move-result-object p0

    invoke-virtual {p0}, Lcom/motorola/ccc/ota/installer/updaterEngine/download/UEDownloadRequestBuilder$NetworkDetails;->getNetworkType()Ljava/lang/String;

    move-result-object p0

    const-string p1, "WIFI"

    invoke-virtual {p1, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_2

    invoke-static {}, Lcom/motorola/ccc/ota/installer/updaterEngine/common/UpdaterEngineHelper;->cancelUpdateEngine()Z

    :cond_2
    return-void

    :cond_3
    const-string p1, "com.motorola.downloadservice.ACTION_ZERORATED_CHANNEL_ACTIVE"

    invoke-virtual {p2}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p1, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_4

    const-string p1, "Received zero rated channel active intent, start/resume the download"

    invoke-static {v0, p1}, Lcom/motorola/ccc/ota/utils/Logger;->debug(Ljava/lang/String;Ljava/lang/String;)V

    iget-object p0, p0, Lcom/motorola/ccc/ota/installer/updaterEngine/StreamingUpdate$StreamingUpdateBroadcastReceiver;->this$0:Lcom/motorola/ccc/ota/installer/updaterEngine/StreamingUpdate;

    invoke-virtual {p0}, Lcom/motorola/ccc/ota/installer/updaterEngine/StreamingUpdate;->restartOnProgress()V

    return-void

    :cond_4
    const-string p1, "com.motorola.downloadservice.ACTION_ZERORATED_CHANNEL_INACTIVE"

    invoke-virtual {p2}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p1, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    const/4 v1, -0x1

    const/4 v3, 0x0

    if-eqz p1, :cond_6

    const-string p1, "Received zero rated channel inactive intent, bring up again if needed"

    invoke-static {v0, p1}, Lcom/motorola/ccc/ota/utils/Logger;->debug(Ljava/lang/String;Ljava/lang/String;)V

    const-string p1, "key_inactive_reason"

    invoke-virtual {p2, p1}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    const-string p2, "onUnavailable"

    invoke-virtual {p2, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_5

    const-string p1, "Received zero rated channel inactive intent for onUnavailable"

    invoke-static {v0, p1}, Lcom/motorola/ccc/ota/utils/Logger;->debug(Ljava/lang/String;Ljava/lang/String;)V

    iget-object p1, p0, Lcom/motorola/ccc/ota/installer/updaterEngine/StreamingUpdate$StreamingUpdateBroadcastReceiver;->this$0:Lcom/motorola/ccc/ota/installer/updaterEngine/StreamingUpdate;

    iget-object p2, p1, Lcom/motorola/ccc/ota/installer/updaterEngine/StreamingUpdate;->_settings:Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    sget-object v0, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->STORED_AB_PROGRESS_PERCENT:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    invoke-virtual {p2, v0, v3}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->getFloat(Lcom/motorola/otalib/common/settings/ISetting;F)F

    move-result p2

    iget-object v0, p0, Lcom/motorola/ccc/ota/installer/updaterEngine/StreamingUpdate$StreamingUpdateBroadcastReceiver;->this$0:Lcom/motorola/ccc/ota/installer/updaterEngine/StreamingUpdate;

    iget-object v0, v0, Lcom/motorola/ccc/ota/installer/updaterEngine/StreamingUpdate;->_settings:Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    sget-object v3, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->STORED_AB_STATUS:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    invoke-virtual {v0, v3, v2}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->getInt(Lcom/motorola/otalib/common/settings/ISetting;I)I

    move-result v0

    invoke-static {p1, p2, v0, v1}, Lcom/motorola/ccc/ota/installer/updaterEngine/StreamingUpdate;->-$$Nest$msendUpgradeStatus(Lcom/motorola/ccc/ota/installer/updaterEngine/StreamingUpdate;FII)V

    iget-object p0, p0, Lcom/motorola/ccc/ota/installer/updaterEngine/StreamingUpdate$StreamingUpdateBroadcastReceiver;->this$0:Lcom/motorola/ccc/ota/installer/updaterEngine/StreamingUpdate;

    invoke-virtual {p0}, Lcom/motorola/ccc/ota/installer/updaterEngine/StreamingUpdate;->clearUEInstallerBeforeExit()V

    :cond_5
    return-void

    :cond_6
    const-string p1, "com.motorola.ccc.ota.INTENT_MAX_ALARM_FOR_UE"

    invoke-virtual {p2}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {p1, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_b

    iget-object p1, p0, Lcom/motorola/ccc/ota/installer/updaterEngine/StreamingUpdate$StreamingUpdateBroadcastReceiver;->this$0:Lcom/motorola/ccc/ota/installer/updaterEngine/StreamingUpdate;

    iget-object p1, p1, Lcom/motorola/ccc/ota/installer/updaterEngine/StreamingUpdate;->_settings:Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    sget-object v4, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->STORED_AB_STATUS:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    invoke-virtual {p1, v4, v2}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->getInt(Lcom/motorola/otalib/common/settings/ISetting;I)I

    move-result p1

    iget-object v4, p0, Lcom/motorola/ccc/ota/installer/updaterEngine/StreamingUpdate$StreamingUpdateBroadcastReceiver;->this$0:Lcom/motorola/ccc/ota/installer/updaterEngine/StreamingUpdate;

    iget-object v4, v4, Lcom/motorola/ccc/ota/installer/updaterEngine/StreamingUpdate;->_settings:Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    sget-object v5, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->STORED_AB_PROGRESS_PERCENT:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    invoke-virtual {v4, v5, v3}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->getFloat(Lcom/motorola/otalib/common/settings/ISetting;F)F

    move-result v4

    const-string v5, "key_status"

    invoke-virtual {p2, v5, v2}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I

    move-result v5

    const-string v6, "key_percentage"

    invoke-virtual {p2, v6, v3}, Landroid/content/Intent;->getFloatExtra(Ljava/lang/String;F)F

    move-result p2

    if-gt p1, v5, :cond_a

    if-ne p1, v5, :cond_7

    cmpl-float p2, v4, p2

    if-lez p2, :cond_7

    goto :goto_0

    :cond_7
    invoke-static {}, Lcom/motorola/ccc/ota/installer/updaterEngine/common/UpdaterEngineStateHandler;->isBusy()Z

    move-result p2

    if-eqz p2, :cond_b

    iget-object p2, p0, Lcom/motorola/ccc/ota/installer/updaterEngine/StreamingUpdate$StreamingUpdateBroadcastReceiver;->this$0:Lcom/motorola/ccc/ota/installer/updaterEngine/StreamingUpdate;

    iget-object p2, p2, Lcom/motorola/ccc/ota/installer/updaterEngine/StreamingUpdate;->_settings:Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    sget-object v3, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->STORED_AB_STATUS:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    invoke-virtual {p2, v3, v2}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->getInt(Lcom/motorola/otalib/common/settings/ISetting;I)I

    move-result p2

    const/4 v3, 0x6

    if-ne p2, v3, :cond_8

    const-string p1, "Looks like client missed updateComplete callbackfrom UE, moving to Querying state"

    invoke-static {v0, p1}, Lcom/motorola/ccc/ota/utils/Logger;->debug(Ljava/lang/String;Ljava/lang/String;)V

    iget-object p0, p0, Lcom/motorola/ccc/ota/installer/updaterEngine/StreamingUpdate$StreamingUpdateBroadcastReceiver;->this$0:Lcom/motorola/ccc/ota/installer/updaterEngine/StreamingUpdate;

    invoke-static {p0}, Lcom/motorola/ccc/ota/installer/updaterEngine/StreamingUpdate;->-$$Nest$fgetcallbackHandler(Lcom/motorola/ccc/ota/installer/updaterEngine/StreamingUpdate;)Lcom/motorola/ccc/ota/installer/updaterEngine/StreamingUpdate$UECallbackHandler;

    move-result-object p0

    const/4 p1, 0x0

    invoke-static {v2}, Lcom/motorola/otalib/common/errorCodes/UpdaterEngineErrorCodes;->getFailureResultStatus(I)Ljava/lang/String;

    move-result-object p2

    invoke-virtual {p0, v2, p1, p2}, Lcom/motorola/ccc/ota/installer/updaterEngine/StreamingUpdate$UECallbackHandler;->onCompleted(ILjava/lang/String;Ljava/lang/String;)V

    goto :goto_1

    :cond_8
    invoke-static {}, Lcom/motorola/ccc/ota/installer/updaterEngine/common/UpdaterEngineHelper;->cancelUpdateEngine()Z

    move-result p2

    if-eqz p2, :cond_9

    sget-object p0, Lcom/motorola/ccc/ota/installer/updaterEngine/common/InstallerUtilMethods$InstallerErrorStatus;->STATUS_UE_NOT_RESPONDING:Lcom/motorola/ccc/ota/installer/updaterEngine/common/InstallerUtilMethods$InstallerErrorStatus;

    invoke-static {p0}, Lcom/motorola/ccc/ota/installer/updaterEngine/StreamingUpdate;->-$$Nest$sfputmInstallerStatus(Lcom/motorola/ccc/ota/installer/updaterEngine/common/InstallerUtilMethods$InstallerErrorStatus;)V

    goto :goto_1

    :cond_9
    iget-object p0, p0, Lcom/motorola/ccc/ota/installer/updaterEngine/StreamingUpdate$StreamingUpdateBroadcastReceiver;->this$0:Lcom/motorola/ccc/ota/installer/updaterEngine/StreamingUpdate;

    invoke-static {p0}, Lcom/motorola/ccc/ota/installer/updaterEngine/StreamingUpdate;->-$$Nest$fgetcallbackHandler(Lcom/motorola/ccc/ota/installer/updaterEngine/StreamingUpdate;)Lcom/motorola/ccc/ota/installer/updaterEngine/StreamingUpdate$UECallbackHandler;

    move-result-object p0

    new-instance p2, Ljava/lang/StringBuilder;

    const-string v0, "Updater engine is not responding at , status "

    invoke-direct {p2, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p2, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object p1

    const-string p2, " percentage "

    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1, v4}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    move-result-object p1

    const-string p2, " "

    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    const-string p2, "UE_NOT_RESPONDING."

    invoke-virtual {p0, v1, p1, p2}, Lcom/motorola/ccc/ota/installer/updaterEngine/StreamingUpdate$UECallbackHandler;->onCompleted(ILjava/lang/String;Ljava/lang/String;)V

    goto :goto_1

    :cond_a
    :goto_0
    iget-object p0, p0, Lcom/motorola/ccc/ota/installer/updaterEngine/StreamingUpdate$StreamingUpdateBroadcastReceiver;->this$0:Lcom/motorola/ccc/ota/installer/updaterEngine/StreamingUpdate;

    invoke-virtual {p0, p1, v4}, Lcom/motorola/ccc/ota/installer/updaterEngine/StreamingUpdate;->setExpiryAlarmForUE(IF)V

    :cond_b
    :goto_1
    return-void
.end method
