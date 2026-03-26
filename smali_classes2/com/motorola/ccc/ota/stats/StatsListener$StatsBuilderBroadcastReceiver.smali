.class Lcom/motorola/ccc/ota/stats/StatsListener$StatsBuilderBroadcastReceiver;
.super Landroid/content/BroadcastReceiver;
.source "StatsListener.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/motorola/ccc/ota/stats/StatsListener;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "StatsBuilderBroadcastReceiver"
.end annotation


# instance fields
.field final synthetic this$0:Lcom/motorola/ccc/ota/stats/StatsListener;


# direct methods
.method private constructor <init>(Lcom/motorola/ccc/ota/stats/StatsListener;)V
    .locals 0

    iput-object p1, p0, Lcom/motorola/ccc/ota/stats/StatsListener$StatsBuilderBroadcastReceiver;->this$0:Lcom/motorola/ccc/ota/stats/StatsListener;

    invoke-direct {p0}, Landroid/content/BroadcastReceiver;-><init>()V

    return-void
.end method

.method synthetic constructor <init>(Lcom/motorola/ccc/ota/stats/StatsListener;Lcom/motorola/ccc/ota/stats/StatsListener$StatsBuilderBroadcastReceiver-IA;)V
    .locals 0

    invoke-direct {p0, p1}, Lcom/motorola/ccc/ota/stats/StatsListener$StatsBuilderBroadcastReceiver;-><init>(Lcom/motorola/ccc/ota/stats/StatsListener;)V

    return-void
.end method


# virtual methods
.method public handleIntent(Landroid/content/Context;Landroid/content/Intent;)V
    .locals 5

    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "Receive intent (stats): "

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p2}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    const-string v1, "OtaApp"

    invoke-static {v1, v0}, Lcom/motorola/ccc/ota/utils/Logger;->debug(Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {p2}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object v0

    const-string v1, "com.motorola.app.action.UPGRADE_UPDATE_STATUS"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    const-string v0, "com.motorola.app.cus.state"

    invoke-virtual {p2, v0}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    const-string v1, "com.motorola.app.source.sha1"

    invoke-virtual {p2, v1}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    const-string v2, "com.motorola.app.destination.sha1"

    invoke-virtual {p2, v2}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    const-string v3, "Notified"

    invoke-virtual {v3, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/motorola/ccc/ota/stats/StatsListener$StatsBuilderBroadcastReceiver;->this$0:Lcom/motorola/ccc/ota/stats/StatsListener;

    invoke-static {v0}, Lcom/motorola/ccc/ota/stats/StatsListener;->-$$Nest$fgetsettings(Lcom/motorola/ccc/ota/stats/StatsListener;)Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    move-result-object v0

    invoke-static {v0, v1, v2}, Lcom/motorola/ccc/ota/stats/StatsHelper;->setPackageNotifiedTime(Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;Ljava/lang/String;Ljava/lang/String;)V

    :cond_0
    invoke-virtual {p2}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object v0

    const-string v1, "com.motorola.blur.service.blur.Actions.UPGRADE_UPDATE_NOTIFICATION"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/motorola/ccc/ota/stats/StatsListener$StatsBuilderBroadcastReceiver;->this$0:Lcom/motorola/ccc/ota/stats/StatsListener;

    invoke-static {v0}, Lcom/motorola/ccc/ota/stats/StatsListener;->-$$Nest$fgetsettings(Lcom/motorola/ccc/ota/stats/StatsListener;)Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    move-result-object v0

    invoke-static {v0}, Lcom/motorola/ccc/ota/stats/StatsHelper;->setDownloadNotifiedTime(Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;)V

    :cond_1
    invoke-virtual {p2}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object v0

    const-string v1, "com.motorola.ccc.ota.ACTION_OTA_DEFERRED"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_4

    invoke-static {p2}, Lcom/motorola/ccc/ota/ui/UpdaterUtils;->getStatsType(Landroid/content/Intent;)Ljava/lang/String;

    move-result-object v0

    invoke-static {p2}, Lcom/motorola/ccc/ota/ui/UpdaterUtils;->getDeferTime(Landroid/content/Intent;)J

    move-result-wide v1

    invoke-static {p2}, Lcom/motorola/ccc/ota/ui/UpdaterUtils;->isInstallAutomatically(Landroid/content/Intent;)Z

    move-result v3

    const-string v4, "DOWNLOAD_DEFERRED"

    invoke-virtual {v0, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_2

    iget-object v0, p0, Lcom/motorola/ccc/ota/stats/StatsListener$StatsBuilderBroadcastReceiver;->this$0:Lcom/motorola/ccc/ota/stats/StatsListener;

    invoke-static {v0}, Lcom/motorola/ccc/ota/stats/StatsListener;->-$$Nest$fgetsettings(Lcom/motorola/ccc/ota/stats/StatsListener;)Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    move-result-object v0

    invoke-static {v0, v1, v2}, Lcom/motorola/ccc/ota/stats/StatsHelper;->setDownloadDeferStats(Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;J)V

    goto :goto_0

    :cond_2
    const-string v4, "INSTALL_DEFERRED"

    invoke-virtual {v0, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-nez v4, :cond_3

    const-string v4, "RESTART_DEFERRED"

    invoke-virtual {v0, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_4

    :cond_3
    iget-object v0, p0, Lcom/motorola/ccc/ota/stats/StatsListener$StatsBuilderBroadcastReceiver;->this$0:Lcom/motorola/ccc/ota/stats/StatsListener;

    invoke-static {v0}, Lcom/motorola/ccc/ota/stats/StatsListener;->-$$Nest$fgetsettings(Lcom/motorola/ccc/ota/stats/StatsListener;)Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    move-result-object v0

    invoke-static {v0, v3, v1, v2}, Lcom/motorola/ccc/ota/stats/StatsHelper;->setInstallDeferStats(Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;ZJ)V

    :cond_4
    :goto_0
    invoke-virtual {p2}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object v0

    const-string v1, "com.motorola.blur.service.blur.Actions.UPGRADE_UPDATE_NOTIFICATION_RESPONSE"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_5

    invoke-static {p2}, Lcom/motorola/ccc/ota/utils/UpgradeUtilMethods;->responseActionFromIntent(Landroid/content/Intent;)Z

    move-result v0

    if-eqz v0, :cond_5

    iget-object v0, p0, Lcom/motorola/ccc/ota/stats/StatsListener$StatsBuilderBroadcastReceiver;->this$0:Lcom/motorola/ccc/ota/stats/StatsListener;

    invoke-static {v0}, Lcom/motorola/ccc/ota/stats/StatsListener;->-$$Nest$fgetsettings(Lcom/motorola/ccc/ota/stats/StatsListener;)Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    move-result-object v0

    invoke-static {v0}, Lcom/motorola/ccc/ota/stats/StatsHelper;->setDownloadAcceptedTime(Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;)V

    :cond_5
    invoke-virtual {p2}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object v0

    const-string v1, "com.motorola.ccc.ota.CusAndroidUtils.START_DOWNLOAD_NOTIFICATION"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_6

    iget-object v0, p0, Lcom/motorola/ccc/ota/stats/StatsListener$StatsBuilderBroadcastReceiver;->this$0:Lcom/motorola/ccc/ota/stats/StatsListener;

    invoke-static {v0}, Lcom/motorola/ccc/ota/stats/StatsListener;->-$$Nest$fgetsettings(Lcom/motorola/ccc/ota/stats/StatsListener;)Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    move-result-object v0

    invoke-static {v0}, Lcom/motorola/ccc/ota/stats/StatsHelper;->setTimeAndIfaceStatsAtDownloadStart(Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;)V

    :cond_6
    invoke-virtual {p2}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object v0

    const-string v1, "com.motorola.ccc.ota.CusAndroidUtils.ACTION_GET_DESCRIPTOR"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_7

    iget-object v0, p0, Lcom/motorola/ccc/ota/stats/StatsListener$StatsBuilderBroadcastReceiver;->this$0:Lcom/motorola/ccc/ota/stats/StatsListener;

    invoke-static {v0}, Lcom/motorola/ccc/ota/stats/StatsListener;->-$$Nest$fgetsettings(Lcom/motorola/ccc/ota/stats/StatsListener;)Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    move-result-object v0

    invoke-static {v0}, Lcom/motorola/ccc/ota/stats/StatsHelper;->setDDObtainedCount(Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;)V

    :cond_7
    const-string v0, "com.motorola.ccc.ota.REBOOT_DURING_DOWNLOAD"

    invoke-virtual {p2}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_8

    iget-object v0, p0, Lcom/motorola/ccc/ota/stats/StatsListener$StatsBuilderBroadcastReceiver;->this$0:Lcom/motorola/ccc/ota/stats/StatsListener;

    invoke-static {v0}, Lcom/motorola/ccc/ota/stats/StatsListener;->-$$Nest$fgetsettings(Lcom/motorola/ccc/ota/stats/StatsListener;)Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    move-result-object v0

    invoke-static {v0}, Lcom/motorola/ccc/ota/stats/StatsHelper;->setRebootDurindDownloadCount(Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;)V

    :cond_8
    invoke-virtual {p2}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object v0

    const-string v1, "com.motorola.blur.service.blur.Actions.UPGRADE_DOWNLOAD_STATUS"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_c

    invoke-static {p2}, Lcom/motorola/ccc/ota/utils/UpgradeUtilMethods;->downloadStatusFromIntent(Landroid/content/Intent;)Lcom/motorola/otalib/common/utils/UpgradeUtils$DownloadStatus;

    move-result-object v0

    sget-object v1, Lcom/motorola/otalib/common/utils/UpgradeUtils$DownloadStatus;->STATUS_OK:Lcom/motorola/otalib/common/utils/UpgradeUtils$DownloadStatus;

    if-ne v0, v1, :cond_9

    return-void

    :cond_9
    sget-object v1, Lcom/motorola/otalib/common/utils/UpgradeUtils$DownloadStatus;->STATUS_TEMP_OK:Lcom/motorola/otalib/common/utils/UpgradeUtils$DownloadStatus;

    if-ne v0, v1, :cond_a

    iget-object v0, p0, Lcom/motorola/ccc/ota/stats/StatsListener$StatsBuilderBroadcastReceiver;->this$0:Lcom/motorola/ccc/ota/stats/StatsListener;

    invoke-static {v0}, Lcom/motorola/ccc/ota/stats/StatsListener;->-$$Nest$fgetsettings(Lcom/motorola/ccc/ota/stats/StatsListener;)Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    move-result-object v0

    iget-object p0, p0, Lcom/motorola/ccc/ota/stats/StatsListener$StatsBuilderBroadcastReceiver;->this$0:Lcom/motorola/ccc/ota/stats/StatsListener;

    invoke-static {p0}, Lcom/motorola/ccc/ota/stats/StatsListener;->-$$Nest$fgetcm(Lcom/motorola/ccc/ota/stats/StatsListener;)Landroid/net/ConnectivityManager;

    move-result-object p0

    invoke-static {p2, v0, p0, p1}, Lcom/motorola/ccc/ota/stats/StatsDownload;->downloadingOrStopped(Landroid/content/Intent;Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;Landroid/net/ConnectivityManager;Landroid/content/Context;)V

    return-void

    :cond_a
    sget-object v1, Lcom/motorola/otalib/common/utils/UpgradeUtils$DownloadStatus;->STATUS_INSTALL_CANCEL:Lcom/motorola/otalib/common/utils/UpgradeUtils$DownloadStatus;

    if-ne v0, v1, :cond_b

    iget-object p1, p0, Lcom/motorola/ccc/ota/stats/StatsListener$StatsBuilderBroadcastReceiver;->this$0:Lcom/motorola/ccc/ota/stats/StatsListener;

    invoke-static {p1}, Lcom/motorola/ccc/ota/stats/StatsListener;->-$$Nest$fgetsettings(Lcom/motorola/ccc/ota/stats/StatsListener;)Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    move-result-object p1

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v0

    invoke-static {p1, v0, v1}, Lcom/motorola/ccc/ota/stats/StatsHelper;->setInstallEndTime(Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;J)V

    iget-object p0, p0, Lcom/motorola/ccc/ota/stats/StatsListener$StatsBuilderBroadcastReceiver;->this$0:Lcom/motorola/ccc/ota/stats/StatsListener;

    invoke-static {p0}, Lcom/motorola/ccc/ota/stats/StatsListener;->-$$Nest$fgetsettings(Lcom/motorola/ccc/ota/stats/StatsListener;)Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    move-result-object p0

    invoke-static {p0}, Lcom/motorola/ccc/ota/stats/StatsHelper;->setTotalInstallTime(Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;)V

    return-void

    :cond_b
    sget-object v1, Lcom/motorola/otalib/common/utils/UpgradeUtils$DownloadStatus;->STATUS_TEMP_OK:Lcom/motorola/otalib/common/utils/UpgradeUtils$DownloadStatus;

    if-eq v0, v1, :cond_c

    iget-object p2, p0, Lcom/motorola/ccc/ota/stats/StatsListener$StatsBuilderBroadcastReceiver;->this$0:Lcom/motorola/ccc/ota/stats/StatsListener;

    invoke-static {p2}, Lcom/motorola/ccc/ota/stats/StatsListener;->-$$Nest$fgetsettings(Lcom/motorola/ccc/ota/stats/StatsListener;)Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    move-result-object p2

    iget-object p0, p0, Lcom/motorola/ccc/ota/stats/StatsListener$StatsBuilderBroadcastReceiver;->this$0:Lcom/motorola/ccc/ota/stats/StatsListener;

    invoke-static {p0}, Lcom/motorola/ccc/ota/stats/StatsListener;->-$$Nest$fgetcm(Lcom/motorola/ccc/ota/stats/StatsListener;)Landroid/net/ConnectivityManager;

    move-result-object p0

    invoke-static {p2, p1, p0}, Lcom/motorola/ccc/ota/stats/StatsHelper;->setAndBuildDownloadStats(Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;Landroid/content/Context;Landroid/net/ConnectivityManager;)V

    return-void

    :cond_c
    invoke-virtual {p2}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object p1

    const-string v0, "com.motorola.ccc.ota.dl_errorcode"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_d

    invoke-static {p2}, Lcom/motorola/ccc/ota/env/CusAndroidUtils;->errorcodeFromIntent(Landroid/content/Intent;)I

    move-result p1

    iget-object v0, p0, Lcom/motorola/ccc/ota/stats/StatsListener$StatsBuilderBroadcastReceiver;->this$0:Lcom/motorola/ccc/ota/stats/StatsListener;

    invoke-static {v0}, Lcom/motorola/ccc/ota/stats/StatsListener;->-$$Nest$fgetsettings(Lcom/motorola/ccc/ota/stats/StatsListener;)Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    move-result-object v0

    invoke-static {v0, p1}, Lcom/motorola/ccc/ota/stats/StatsDownload;->downloadErrorcode(Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;I)V

    :cond_d
    invoke-virtual {p2}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object p1

    const-string v0, "com.motorola.ccc.ota.dl_exception"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_e

    invoke-static {p2}, Lcom/motorola/ccc/ota/env/CusAndroidUtils;->exceptionFromIntent(Landroid/content/Intent;)Ljava/lang/String;

    move-result-object p1

    iget-object v0, p0, Lcom/motorola/ccc/ota/stats/StatsListener$StatsBuilderBroadcastReceiver;->this$0:Lcom/motorola/ccc/ota/stats/StatsListener;

    invoke-static {v0}, Lcom/motorola/ccc/ota/stats/StatsListener;->-$$Nest$fgetsettings(Lcom/motorola/ccc/ota/stats/StatsListener;)Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    move-result-object v0

    invoke-static {v0, p1}, Lcom/motorola/ccc/ota/stats/StatsDownload;->downloadException(Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;Ljava/lang/String;)V

    :cond_e
    invoke-virtual {p2}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object p1

    const-string v0, "com.motorola.ccc.ota.CusAndroidUtils.INTERNAL_NOTIFICATION"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_f

    iget-object p1, p0, Lcom/motorola/ccc/ota/stats/StatsListener$StatsBuilderBroadcastReceiver;->this$0:Lcom/motorola/ccc/ota/stats/StatsListener;

    invoke-static {p1}, Lcom/motorola/ccc/ota/stats/StatsListener;->-$$Nest$fgetsettings(Lcom/motorola/ccc/ota/stats/StatsListener;)Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    move-result-object p1

    invoke-static {p1}, Lcom/motorola/ccc/ota/stats/StatsHelper;->setInstallNotifiedTime(Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;)V

    invoke-static {}, Lcom/motorola/ccc/ota/utils/BuildPropReader;->isUEUpdateEnabled()Z

    move-result p1

    if-eqz p1, :cond_f

    iget-object p1, p0, Lcom/motorola/ccc/ota/stats/StatsListener$StatsBuilderBroadcastReceiver;->this$0:Lcom/motorola/ccc/ota/stats/StatsListener;

    invoke-static {p1}, Lcom/motorola/ccc/ota/stats/StatsListener;->-$$Nest$fgetsettings(Lcom/motorola/ccc/ota/stats/StatsListener;)Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    move-result-object p1

    invoke-static {p1}, Lcom/motorola/ccc/ota/stats/StatsHelper;->setInstallAcceptedTime(Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;)V

    iget-object p1, p0, Lcom/motorola/ccc/ota/stats/StatsListener$StatsBuilderBroadcastReceiver;->this$0:Lcom/motorola/ccc/ota/stats/StatsListener;

    invoke-static {p1}, Lcom/motorola/ccc/ota/stats/StatsListener;->-$$Nest$fgetsettings(Lcom/motorola/ccc/ota/stats/StatsListener;)Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    move-result-object p1

    invoke-static {p1}, Lcom/motorola/ccc/ota/stats/StatsHelper;->setInstallStartTime(Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;)V

    :cond_f
    invoke-virtual {p2}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object p1

    const-string v0, "com.motorola.blur.service.blur.Actions.UPGRADE_LAUNCH_UPGRADE"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_11

    invoke-static {p2}, Lcom/motorola/ccc/ota/utils/UpgradeUtilMethods;->proceedFromIntent(Landroid/content/Intent;)Z

    move-result p1

    if-eqz p1, :cond_11

    invoke-static {}, Lcom/motorola/ccc/ota/utils/BuildPropReader;->isUEUpdateEnabled()Z

    move-result p1

    if-nez p1, :cond_10

    iget-object p0, p0, Lcom/motorola/ccc/ota/stats/StatsListener$StatsBuilderBroadcastReceiver;->this$0:Lcom/motorola/ccc/ota/stats/StatsListener;

    invoke-static {p0}, Lcom/motorola/ccc/ota/stats/StatsListener;->-$$Nest$fgetsettings(Lcom/motorola/ccc/ota/stats/StatsListener;)Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    move-result-object p0

    invoke-static {p0}, Lcom/motorola/ccc/ota/stats/StatsHelper;->setInstallAcceptedTime(Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;)V

    :cond_10
    return-void

    :cond_11
    invoke-virtual {p2}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object p1

    const-string v0, "com.motorola.blur.service.blur.Actions.UPGRADE_EXECUTE_UPGRADE"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    invoke-virtual {p2}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object p1

    const-string v0, "com.motorola.blur.service.blur.Actions.UPGRADE_UPDATE_STATUS"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_12

    invoke-static {}, Lcom/motorola/ccc/ota/utils/BuildPropReader;->isUEUpdateEnabled()Z

    move-result p1

    if-nez p1, :cond_12

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v0

    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    move-result-wide v2

    sub-long/2addr v0, v2

    iget-object p1, p0, Lcom/motorola/ccc/ota/stats/StatsListener$StatsBuilderBroadcastReceiver;->this$0:Lcom/motorola/ccc/ota/stats/StatsListener;

    invoke-static {p1}, Lcom/motorola/ccc/ota/stats/StatsListener;->-$$Nest$fgetsettings(Lcom/motorola/ccc/ota/stats/StatsListener;)Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    move-result-object p1

    invoke-static {p1, v0, v1}, Lcom/motorola/ccc/ota/stats/StatsHelper;->setInstallEndTime(Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;J)V

    iget-object p1, p0, Lcom/motorola/ccc/ota/stats/StatsListener$StatsBuilderBroadcastReceiver;->this$0:Lcom/motorola/ccc/ota/stats/StatsListener;

    invoke-static {p1}, Lcom/motorola/ccc/ota/stats/StatsListener;->-$$Nest$fgetsettings(Lcom/motorola/ccc/ota/stats/StatsListener;)Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    move-result-object p1

    invoke-static {p1}, Lcom/motorola/ccc/ota/stats/StatsHelper;->setTotalInstallTimeForClassic(Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;)V

    :cond_12
    invoke-virtual {p2}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object p1

    const-string v0, "com.motorola.ccc.ota.AB_APPLY_PAYLOAD_STARTED"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_13

    iget-object p1, p0, Lcom/motorola/ccc/ota/stats/StatsListener$StatsBuilderBroadcastReceiver;->this$0:Lcom/motorola/ccc/ota/stats/StatsListener;

    invoke-static {p1}, Lcom/motorola/ccc/ota/stats/StatsListener;->-$$Nest$fgetsettings(Lcom/motorola/ccc/ota/stats/StatsListener;)Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    move-result-object p1

    sget-object v0, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->STATS_AB_LAST_INSTALLATION_START_TIME:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v1

    invoke-virtual {p1, v0, v1, v2}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->setLong(Lcom/motorola/otalib/common/settings/ISetting;J)V

    :cond_13
    invoke-virtual {p2}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object p1

    const-string p2, "com.motorola.ccc.ota.AB_UPGRADE_COMPLETED"

    invoke-virtual {p1, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_14

    iget-object p1, p0, Lcom/motorola/ccc/ota/stats/StatsListener$StatsBuilderBroadcastReceiver;->this$0:Lcom/motorola/ccc/ota/stats/StatsListener;

    invoke-static {p1}, Lcom/motorola/ccc/ota/stats/StatsListener;->-$$Nest$fgetsettings(Lcom/motorola/ccc/ota/stats/StatsListener;)Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    move-result-object p1

    invoke-static {p1}, Lcom/motorola/ccc/ota/stats/StatsHelper;->setTotalInstallTime(Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;)V

    iget-object p0, p0, Lcom/motorola/ccc/ota/stats/StatsListener$StatsBuilderBroadcastReceiver;->this$0:Lcom/motorola/ccc/ota/stats/StatsListener;

    invoke-static {p0}, Lcom/motorola/ccc/ota/stats/StatsListener;->-$$Nest$fgetsettings(Lcom/motorola/ccc/ota/stats/StatsListener;)Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    move-result-object p0

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide p1

    invoke-static {p0, p1, p2}, Lcom/motorola/ccc/ota/stats/StatsHelper;->setInstallEndTime(Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;J)V

    :cond_14
    return-void
.end method

.method public onReceive(Landroid/content/Context;Landroid/content/Intent;)V
    .locals 2

    invoke-static {}, Lcom/motorola/ccc/ota/env/OtaApplication;->getExecutorService()Ljava/util/concurrent/ExecutorService;

    move-result-object v0

    new-instance v1, Lcom/motorola/ccc/ota/stats/StatsListener$StatsBuilderBroadcastReceiver$1;

    invoke-direct {v1, p0, p1, p2}, Lcom/motorola/ccc/ota/stats/StatsListener$StatsBuilderBroadcastReceiver$1;-><init>(Lcom/motorola/ccc/ota/stats/StatsListener$StatsBuilderBroadcastReceiver;Landroid/content/Context;Landroid/content/Intent;)V

    invoke-interface {v0, v1}, Ljava/util/concurrent/ExecutorService;->submit(Ljava/lang/Runnable;)Ljava/util/concurrent/Future;

    return-void
.end method
