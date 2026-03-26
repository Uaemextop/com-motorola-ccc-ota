.class public Lcom/motorola/ccc/ota/env/OutofBoxUpdateDetectReceiver;
.super Landroid/content/BroadcastReceiver;
.source "OutofBoxUpdateDetectReceiver.java"


# instance fields
.field private final settings:Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;


# direct methods
.method static bridge synthetic -$$Nest$fgetsettings(Lcom/motorola/ccc/ota/env/OutofBoxUpdateDetectReceiver;)Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;
    .locals 0

    iget-object p0, p0, Lcom/motorola/ccc/ota/env/OutofBoxUpdateDetectReceiver;->settings:Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    return-object p0
.end method

.method static bridge synthetic -$$Nest$mhandleIntent(Lcom/motorola/ccc/ota/env/OutofBoxUpdateDetectReceiver;Landroid/content/Context;Landroid/content/Intent;Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;)V
    .locals 0

    invoke-direct {p0, p1, p2, p3}, Lcom/motorola/ccc/ota/env/OutofBoxUpdateDetectReceiver;->handleIntent(Landroid/content/Context;Landroid/content/Intent;Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;)V

    return-void
.end method

.method public constructor <init>()V
    .locals 1

    invoke-direct {p0}, Landroid/content/BroadcastReceiver;-><init>()V

    new-instance v0, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    invoke-direct {v0}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;-><init>()V

    iput-object v0, p0, Lcom/motorola/ccc/ota/env/OutofBoxUpdateDetectReceiver;->settings:Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    return-void
.end method

.method private handleIntent(Landroid/content/Context;Landroid/content/Intent;Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;)V
    .locals 7

    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "OutofBoxUpdateDetectReceiver.handleIntent: "

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p2}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    const-string v1, "OtaApp"

    invoke-static {v1, v0}, Lcom/motorola/ccc/ota/utils/Logger;->debug(Ljava/lang/String;Ljava/lang/String;)V

    const-string v0, "connectivity"

    invoke-virtual {p1, v0}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/net/ConnectivityManager;

    const-string v2, "com.motorola.ccc.ota.SETUP_COMPLETED"

    invoke-virtual {p2}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    const-string v3, "OutofBoxUpdateDetectReceiver.handleIntent: setup completed and data connection avaialble , trigger setup initiated"

    const/4 v4, 0x1

    if-eqz v2, :cond_6

    sget-object p2, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->FLAG_IS_VITAL_UPDATE:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    invoke-virtual {p3, p2}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->getBoolean(Lcom/motorola/otalib/common/settings/ISetting;)Z

    move-result p2

    if-eqz p2, :cond_0

    const-string p2, "Cancelling vital update after setup complete, user skipped wifi during initial setup "

    const-string v2, "CANCEL_VU_POST_SETUP_COMPLETE."

    invoke-static {p2, v2}, Lcom/motorola/ccc/ota/utils/UpgradeUtilMethods;->cancelOta(Ljava/lang/String;Ljava/lang/String;)V

    :cond_0
    sget-object p2, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->FLAG_IS_VITAL_UPDATE:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    invoke-virtual {p3, p2}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->removeConfig(Lcom/motorola/otalib/common/settings/ISetting;)V

    sget-object p2, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->INITIAL_SETUP_COMPLETED:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    invoke-virtual {p3, p2}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->getBoolean(Lcom/motorola/otalib/common/settings/ISetting;)Z

    move-result p2

    if-nez p2, :cond_1

    invoke-static {}, Lcom/motorola/ccc/ota/utils/BuildPropReader;->isSoftbank()Z

    move-result p2

    if-eqz p2, :cond_1

    invoke-static {}, Lcom/motorola/ccc/ota/utils/BuildPropReader;->isSoftbankSIM()Z

    move-result p2

    if-eqz p2, :cond_1

    invoke-static {p1}, Lcom/motorola/ccc/ota/utils/NotificationUtils;->displaySmartUpdateNotification(Landroid/content/Context;)V

    :cond_1
    sget-object p2, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->INITIAL_SETUP_COMPLETED:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    invoke-virtual {p3, p2, v4}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->setBoolean(Lcom/motorola/otalib/common/settings/ISetting;Z)V

    invoke-virtual {p3, p3}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->resetBackoffRetryValuesAfterSetupCompleted(Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;)V

    invoke-static {p1}, Lcom/motorola/ccc/ota/env/AndroidFotaInterface;->sendSetupIntentToFota(Landroid/content/Context;)V

    invoke-static {}, Lcom/motorola/ccc/ota/utils/BuildPropReader;->isFotaATT()Z

    move-result p2

    if-nez p2, :cond_2

    invoke-static {p1}, Lcom/motorola/ccc/ota/ui/UpdaterUtils;->scheduleWorkManager(Landroid/content/Context;)V

    :cond_2
    invoke-static {}, Lcom/motorola/ccc/ota/utils/BuildPropReader;->isATT()Z

    move-result p2

    if-nez p2, :cond_3

    invoke-static {}, Lcom/motorola/ccc/ota/utils/BuildPropReader;->getMCFGConfigVersion()Ljava/lang/String;

    move-result-object p2

    invoke-static {p2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result p2

    if-nez p2, :cond_3

    sget-object p2, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->POLL_MODEM_AFTER:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    const-wide/32 v5, 0x240c8400

    invoke-virtual {p3, p2, v5, v6}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->setLong(Lcom/motorola/otalib/common/settings/ISetting;J)V

    sget-object p2, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->MAX_MODEM_POLLING_COUNT:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    const/4 v2, 0x3

    invoke-virtual {p3, p2, v2}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->setInt(Lcom/motorola/otalib/common/settings/ISetting;I)V

    invoke-static {p1}, Lcom/motorola/ccc/ota/ui/UpdaterUtils;->scheduleModemWorkManager(Landroid/content/Context;)V

    :cond_3
    sget-object p2, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->INITIAL_SETUP_TRIGGERED:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    invoke-virtual {p3, p2}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->getBoolean(Lcom/motorola/otalib/common/settings/ISetting;)Z

    move-result p2

    if-nez p2, :cond_5

    invoke-static {v0}, Lcom/motorola/otalib/common/utils/NetworkUtils;->hasNetwork(Landroid/net/ConnectivityManager;)Z

    move-result p2

    if-eqz p2, :cond_4

    invoke-static {p3}, Lcom/motorola/ccc/ota/utils/BuildPropReader;->isCtaVersion(Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;)Z

    move-result p2

    if-nez p2, :cond_4

    sget-object p2, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->CHANNEL_ID_UPDATED:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    invoke-virtual {p3, p2}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->getBoolean(Lcom/motorola/otalib/common/settings/ISetting;)Z

    move-result p2

    if-eqz p2, :cond_4

    invoke-static {v1, v3}, Lcom/motorola/ccc/ota/utils/Logger;->debug(Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {p0, p1}, Lcom/motorola/ccc/ota/env/OutofBoxUpdateDetectReceiver;->disableSelf(Landroid/content/Context;)V

    invoke-virtual {p0, p1}, Lcom/motorola/ccc/ota/env/OutofBoxUpdateDetectReceiver;->broadcastCheckforUpdateIntent(Landroid/content/Context;)V

    sget-object p0, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->INITIAL_SETUP_TRIGGERED:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    invoke-virtual {p3, p0, v4}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->setBoolean(Lcom/motorola/otalib/common/settings/ISetting;Z)V

    goto :goto_0

    :cond_4
    const-string p0, "OutofBoxUpdateDetectReceiver.handleIntent: setup completed but no data connection, waiting for connectivity orTOS acceptance by user or Channel Id need to be updated"

    invoke-static {v1, p0}, Lcom/motorola/ccc/ota/utils/Logger;->info(Ljava/lang/String;Ljava/lang/String;)V

    :cond_5
    :goto_0
    return-void

    :cond_6
    const-string v2, "com.motorola.ccc.ota.TOS_COMPLETED"

    invoke-virtual {p2}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v2, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_9

    sget-object p2, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->INITIAL_SETUP_TRIGGERED:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    invoke-virtual {p3, p2}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->getBoolean(Lcom/motorola/otalib/common/settings/ISetting;)Z

    move-result p2

    if-nez p2, :cond_8

    invoke-static {v0}, Lcom/motorola/otalib/common/utils/NetworkUtils;->hasNetwork(Landroid/net/ConnectivityManager;)Z

    move-result p2

    if-eqz p2, :cond_7

    sget-object p2, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->INITIAL_SETUP_COMPLETED:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    invoke-virtual {p3, p2}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->getBoolean(Lcom/motorola/otalib/common/settings/ISetting;)Z

    move-result p2

    if-eqz p2, :cond_7

    sget-object p2, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->CHANNEL_ID_UPDATED:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    invoke-virtual {p3, p2}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->getBoolean(Lcom/motorola/otalib/common/settings/ISetting;)Z

    move-result p2

    if-eqz p2, :cond_7

    invoke-static {v1, v3}, Lcom/motorola/ccc/ota/utils/Logger;->debug(Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {p0, p1}, Lcom/motorola/ccc/ota/env/OutofBoxUpdateDetectReceiver;->disableSelf(Landroid/content/Context;)V

    invoke-virtual {p0, p1}, Lcom/motorola/ccc/ota/env/OutofBoxUpdateDetectReceiver;->broadcastCheckforUpdateIntent(Landroid/content/Context;)V

    sget-object p0, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->INITIAL_SETUP_TRIGGERED:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    invoke-virtual {p3, p0, v4}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->setBoolean(Lcom/motorola/otalib/common/settings/ISetting;Z)V

    goto :goto_1

    :cond_7
    const-string p0, "OutofBoxUpdateDetectReceiver.handleIntent: setup completed but no data connection, waiting for connectivity"

    invoke-static {v1, p0}, Lcom/motorola/ccc/ota/utils/Logger;->info(Ljava/lang/String;Ljava/lang/String;)V

    :cond_8
    :goto_1
    return-void

    :cond_9
    const-string v2, "com.motorola.ccc.ota.CHANNEL_ID_UPDATED"

    invoke-virtual {p2}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object p2

    invoke-virtual {v2, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p2

    if-eqz p2, :cond_b

    sget-object p2, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->INITIAL_SETUP_TRIGGERED:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    invoke-virtual {p3, p2}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->getBoolean(Lcom/motorola/otalib/common/settings/ISetting;)Z

    move-result p2

    if-nez p2, :cond_b

    invoke-static {v0}, Lcom/motorola/otalib/common/utils/NetworkUtils;->hasNetwork(Landroid/net/ConnectivityManager;)Z

    move-result p2

    if-eqz p2, :cond_a

    invoke-static {p3}, Lcom/motorola/ccc/ota/utils/BuildPropReader;->isCtaVersion(Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;)Z

    move-result p2

    if-nez p2, :cond_a

    sget-object p2, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->INITIAL_SETUP_COMPLETED:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    invoke-virtual {p3, p2}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->getBoolean(Lcom/motorola/otalib/common/settings/ISetting;)Z

    move-result p2

    if-eqz p2, :cond_a

    invoke-static {v1, v3}, Lcom/motorola/ccc/ota/utils/Logger;->debug(Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {p0, p1}, Lcom/motorola/ccc/ota/env/OutofBoxUpdateDetectReceiver;->disableSelf(Landroid/content/Context;)V

    invoke-virtual {p0, p1}, Lcom/motorola/ccc/ota/env/OutofBoxUpdateDetectReceiver;->broadcastCheckforUpdateIntent(Landroid/content/Context;)V

    sget-object p0, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->INITIAL_SETUP_TRIGGERED:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    invoke-virtual {p3, p0, v4}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->setBoolean(Lcom/motorola/otalib/common/settings/ISetting;Z)V

    goto :goto_2

    :cond_a
    const-string p0, "OutofBoxUpdateDetectReceiver.handleIntent: channel id updated but no data connection, waiting for connectivity orTOS acceptance by user or initial setup to be completed"

    invoke-static {v1, p0}, Lcom/motorola/ccc/ota/utils/Logger;->info(Ljava/lang/String;Ljava/lang/String;)V

    :cond_b
    :goto_2
    return-void
.end method


# virtual methods
.method public broadcastCheckforUpdateIntent(Landroid/content/Context;)V
    .locals 2

    const-string p0, "OtaApp"

    const-string v0, "OutofBoxUpdateDetectReceiver, firing an intent to start setup (out of box) initiated update"

    invoke-static {p0, v0}, Lcom/motorola/ccc/ota/utils/Logger;->info(Ljava/lang/String;Ljava/lang/String;)V

    new-instance p0, Landroid/content/Intent;

    const-string v0, "com.motorola.blur.service.blur.Actions.UPGRADE_CHECK_FOR_UPDATE"

    invoke-direct {p0, v0}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    const-string v0, "com.motorola.blur.service.blur.upgrade.bootstrap"

    const/4 v1, 0x0

    invoke-virtual {p0, v0, v1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Z)Landroid/content/Intent;

    const-string v0, "com.motorola.blur.service.blur.upgrade.requestid"

    const/4 v1, 0x1

    invoke-virtual {p0, v0, v1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    const-string v0, "com.motorola.ccc.ota.Permissions.INTERACT_OTA_SERVICE"

    invoke-virtual {p1, p0, v0}, Landroid/content/Context;->sendBroadcast(Landroid/content/Intent;Ljava/lang/String;)V

    return-void
.end method

.method public broadcastModemUpgradePollingIntent(Landroid/content/Context;)V
    .locals 1

    new-instance p0, Landroid/content/Intent;

    const-string v0, "com.motorola.ccc.ota.modem_upgrade_poll"

    invoke-direct {p0, v0}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    invoke-static {p1, p0}, Lcom/motorola/otalib/common/utils/BroadcastUtils;->sendLocalBroadcast(Landroid/content/Context;Landroid/content/Intent;)V

    return-void
.end method

.method public broadcastUpgradePollingIntent(Landroid/content/Context;)V
    .locals 1

    new-instance p0, Landroid/content/Intent;

    const-string v0, "com.motorola.blur.service.blur.upgrade_poll"

    invoke-direct {p0, v0}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    invoke-static {p1, p0}, Lcom/motorola/otalib/common/utils/BroadcastUtils;->sendLocalBroadcast(Landroid/content/Context;Landroid/content/Intent;)V

    return-void
.end method

.method public disableSelf(Landroid/content/Context;)V
    .locals 3

    const-string p0, "OutofBoxUpdateDetectReceiver, disabling this receiver"

    const-string p1, "OtaApp"

    invoke-static {p1, p0}, Lcom/motorola/ccc/ota/utils/Logger;->debug(Ljava/lang/String;Ljava/lang/String;)V

    invoke-static {}, Lcom/motorola/ccc/ota/env/OtaApplication;->getGlobalContext()Landroid/content/Context;

    move-result-object p0

    invoke-virtual {p0}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object p0

    :try_start_0
    new-instance v0, Landroid/content/ComponentName;

    invoke-static {}, Lcom/motorola/ccc/ota/env/OtaApplication;->getGlobalContext()Landroid/content/Context;

    move-result-object v1

    const-class v2, Lcom/motorola/ccc/ota/env/OutofBoxUpdateDetectReceiver;

    invoke-direct {v0, v1, v2}, Landroid/content/ComponentName;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    const/4 v1, 0x2

    const/4 v2, 0x1

    invoke-virtual {p0, v0, v1, v2}, Landroid/content/pm/PackageManager;->setComponentEnabledSetting(Landroid/content/ComponentName;II)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception p0

    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "OutofBoxUpdateDetectReceiver, exception in  disabling this receiver "

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-static {p1, p0}, Lcom/motorola/ccc/ota/utils/Logger;->debug(Ljava/lang/String;Ljava/lang/String;)V

    :goto_0
    return-void
.end method

.method public onReceive(Landroid/content/Context;Landroid/content/Intent;)V
    .locals 3

    invoke-virtual {p1}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v0

    new-instance v1, Landroid/content/ComponentName;

    const-class v2, Lcom/motorola/ccc/ota/env/OutofBoxUpdateDetectReceiver;

    invoke-direct {v1, p1, v2}, Landroid/content/ComponentName;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    invoke-virtual {v0, v1}, Landroid/content/pm/PackageManager;->getComponentEnabledSetting(Landroid/content/ComponentName;)I

    move-result v0

    const/4 v1, 0x2

    if-ne v0, v1, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    iget-object v1, p0, Lcom/motorola/ccc/ota/env/OutofBoxUpdateDetectReceiver;->settings:Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    sget-object v2, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->INITIAL_SETUP_TRIGGERED:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    invoke-virtual {v1, v2}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->getBoolean(Lcom/motorola/otalib/common/settings/ISetting;)Z

    move-result v1

    if-nez v0, :cond_2

    if-eqz v1, :cond_1

    goto :goto_1

    :cond_1
    invoke-static {}, Lcom/motorola/ccc/ota/env/OtaApplication;->getExecutorService()Ljava/util/concurrent/ExecutorService;

    move-result-object v0

    new-instance v1, Lcom/motorola/ccc/ota/env/OutofBoxUpdateDetectReceiver$1;

    invoke-direct {v1, p0, p1, p2}, Lcom/motorola/ccc/ota/env/OutofBoxUpdateDetectReceiver$1;-><init>(Lcom/motorola/ccc/ota/env/OutofBoxUpdateDetectReceiver;Landroid/content/Context;Landroid/content/Intent;)V

    invoke-interface {v0, v1}, Ljava/util/concurrent/ExecutorService;->submit(Ljava/lang/Runnable;)Ljava/util/concurrent/Future;

    return-void

    :cond_2
    :goto_1
    new-instance p0, Ljava/lang/StringBuilder;

    const-string p1, "OutofBoxUpdateDetectReceiver was already disabled/triggered.No need to run again for intent : "

    invoke-direct {p0, p1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p2}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p0

    const-string p1, " isDisabled: "

    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p0

    invoke-virtual {p0, v0}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object p0

    const-string p1, " isSetupTriggered: "

    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p0

    invoke-virtual {p0, v1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    const-string p1, "OtaApp"

    invoke-static {p1, p0}, Lcom/motorola/ccc/ota/utils/Logger;->info(Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method
