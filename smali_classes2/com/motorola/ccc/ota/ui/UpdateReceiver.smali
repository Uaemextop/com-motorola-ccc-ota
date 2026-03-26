.class public Lcom/motorola/ccc/ota/ui/UpdateReceiver;
.super Landroid/content/BroadcastReceiver;
.source "UpdateReceiver.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/motorola/ccc/ota/ui/UpdateReceiver$PendingIntentType;
    }
.end annotation


# instance fields
.field private botaSettings:Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

.field private mAlarmManager:Landroid/app/AlarmManager;

.field private mNotificationTitle:Ljava/lang/String;

.field private mNotificationTxt:Ljava/lang/String;

.field private mPendingIntent:Landroid/app/PendingIntent;

.field private systemUpdaterPolicy:Lcom/motorola/ccc/ota/env/SystemUpdaterPolicy;


# direct methods
.method static bridge synthetic -$$Nest$fgetbotaSettings(Lcom/motorola/ccc/ota/ui/UpdateReceiver;)Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;
    .locals 0

    iget-object p0, p0, Lcom/motorola/ccc/ota/ui/UpdateReceiver;->botaSettings:Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    return-object p0
.end method

.method static bridge synthetic -$$Nest$fgetmAlarmManager(Lcom/motorola/ccc/ota/ui/UpdateReceiver;)Landroid/app/AlarmManager;
    .locals 0

    iget-object p0, p0, Lcom/motorola/ccc/ota/ui/UpdateReceiver;->mAlarmManager:Landroid/app/AlarmManager;

    return-object p0
.end method

.method static bridge synthetic -$$Nest$fgetmNotificationTitle(Lcom/motorola/ccc/ota/ui/UpdateReceiver;)Ljava/lang/String;
    .locals 0

    iget-object p0, p0, Lcom/motorola/ccc/ota/ui/UpdateReceiver;->mNotificationTitle:Ljava/lang/String;

    return-object p0
.end method

.method static bridge synthetic -$$Nest$fgetmNotificationTxt(Lcom/motorola/ccc/ota/ui/UpdateReceiver;)Ljava/lang/String;
    .locals 0

    iget-object p0, p0, Lcom/motorola/ccc/ota/ui/UpdateReceiver;->mNotificationTxt:Ljava/lang/String;

    return-object p0
.end method

.method static bridge synthetic -$$Nest$fgetmPendingIntent(Lcom/motorola/ccc/ota/ui/UpdateReceiver;)Landroid/app/PendingIntent;
    .locals 0

    iget-object p0, p0, Lcom/motorola/ccc/ota/ui/UpdateReceiver;->mPendingIntent:Landroid/app/PendingIntent;

    return-object p0
.end method

.method static bridge synthetic -$$Nest$fputmAlarmManager(Lcom/motorola/ccc/ota/ui/UpdateReceiver;Landroid/app/AlarmManager;)V
    .locals 0

    iput-object p1, p0, Lcom/motorola/ccc/ota/ui/UpdateReceiver;->mAlarmManager:Landroid/app/AlarmManager;

    return-void
.end method

.method static bridge synthetic -$$Nest$fputmNotificationTitle(Lcom/motorola/ccc/ota/ui/UpdateReceiver;Ljava/lang/String;)V
    .locals 0

    iput-object p1, p0, Lcom/motorola/ccc/ota/ui/UpdateReceiver;->mNotificationTitle:Ljava/lang/String;

    return-void
.end method

.method static bridge synthetic -$$Nest$fputmNotificationTxt(Lcom/motorola/ccc/ota/ui/UpdateReceiver;Ljava/lang/String;)V
    .locals 0

    iput-object p1, p0, Lcom/motorola/ccc/ota/ui/UpdateReceiver;->mNotificationTxt:Ljava/lang/String;

    return-void
.end method

.method static bridge synthetic -$$Nest$fputmPendingIntent(Lcom/motorola/ccc/ota/ui/UpdateReceiver;Landroid/app/PendingIntent;)V
    .locals 0

    iput-object p1, p0, Lcom/motorola/ccc/ota/ui/UpdateReceiver;->mPendingIntent:Landroid/app/PendingIntent;

    return-void
.end method

.method static bridge synthetic -$$Nest$mcancelAnyPendingIntentSetPreviously(Lcom/motorola/ccc/ota/ui/UpdateReceiver;Landroid/content/Context;Landroid/content/Intent;Lcom/motorola/ccc/ota/ui/UpdateReceiver$PendingIntentType;)V
    .locals 0

    invoke-direct {p0, p1, p2, p3}, Lcom/motorola/ccc/ota/ui/UpdateReceiver;->cancelAnyPendingIntentSetPreviously(Landroid/content/Context;Landroid/content/Intent;Lcom/motorola/ccc/ota/ui/UpdateReceiver$PendingIntentType;)V

    return-void
.end method

.method public constructor <init>()V
    .locals 1

    invoke-direct {p0}, Landroid/content/BroadcastReceiver;-><init>()V

    new-instance v0, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    invoke-direct {v0}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;-><init>()V

    iput-object v0, p0, Lcom/motorola/ccc/ota/ui/UpdateReceiver;->botaSettings:Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    new-instance v0, Lcom/motorola/ccc/ota/env/SystemUpdaterPolicy;

    invoke-direct {v0}, Lcom/motorola/ccc/ota/env/SystemUpdaterPolicy;-><init>()V

    iput-object v0, p0, Lcom/motorola/ccc/ota/ui/UpdateReceiver;->systemUpdaterPolicy:Lcom/motorola/ccc/ota/env/SystemUpdaterPolicy;

    return-void
.end method

.method private cancelAnyPendingIntentSetPreviously(Landroid/content/Context;Landroid/content/Intent;Lcom/motorola/ccc/ota/ui/UpdateReceiver$PendingIntentType;)V
    .locals 3

    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "cancelAnyPendingIntentSetPreviously of type "

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p3}, Lcom/motorola/ccc/ota/ui/UpdateReceiver$PendingIntentType;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    const-string v1, "OtaApp"

    invoke-static {v1, v0}, Lcom/motorola/ccc/ota/utils/Logger;->debug(Ljava/lang/String;Ljava/lang/String;)V

    sget-object v0, Lcom/motorola/ccc/ota/ui/UpdateReceiver$3;->$SwitchMap$com$motorola$ccc$ota$ui$UpdateReceiver$PendingIntentType:[I

    invoke-virtual {p3}, Lcom/motorola/ccc/ota/ui/UpdateReceiver$PendingIntentType;->ordinal()I

    move-result p3

    aget p3, v0, p3

    const/4 v0, 0x1

    const/high16 v1, 0x14000000

    const/4 v2, 0x0

    if-eq p3, v0, :cond_2

    const/4 v0, 0x2

    if-eq p3, v0, :cond_1

    const/4 v0, 0x3

    if-eq p3, v0, :cond_0

    goto :goto_0

    :cond_0
    invoke-static {p1, v2, p2, v1}, Landroid/app/PendingIntent;->getBroadcast(Landroid/content/Context;ILandroid/content/Intent;I)Landroid/app/PendingIntent;

    move-result-object p1

    iput-object p1, p0, Lcom/motorola/ccc/ota/ui/UpdateReceiver;->mPendingIntent:Landroid/app/PendingIntent;

    goto :goto_0

    :cond_1
    invoke-static {p1, v2, p2, v1}, Landroid/app/PendingIntent;->getService(Landroid/content/Context;ILandroid/content/Intent;I)Landroid/app/PendingIntent;

    move-result-object p1

    iput-object p1, p0, Lcom/motorola/ccc/ota/ui/UpdateReceiver;->mPendingIntent:Landroid/app/PendingIntent;

    goto :goto_0

    :cond_2
    invoke-static {p1, v2, p2, v1}, Landroid/app/PendingIntent;->getActivity(Landroid/content/Context;ILandroid/content/Intent;I)Landroid/app/PendingIntent;

    move-result-object p1

    iput-object p1, p0, Lcom/motorola/ccc/ota/ui/UpdateReceiver;->mPendingIntent:Landroid/app/PendingIntent;

    :goto_0
    return-void
.end method

.method private closeSystemDialogs(Landroid/content/Context;)V
    .locals 1

    new-instance p0, Landroid/content/Intent;

    const-string v0, "android.intent.action.CLOSE_SYSTEM_DIALOGS"

    invoke-direct {p0, v0}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    invoke-virtual {p1, p0}, Landroid/content/Context;->sendBroadcast(Landroid/content/Intent;)V

    return-void
.end method

.method private doSanityCheckForForceInstall(Landroid/content/Context;Landroid/content/Intent;Ljava/lang/String;)Z
    .locals 4

    invoke-static {p1, p3}, Lcom/motorola/ccc/ota/ui/UpdaterUtils;->isPromptAllowed(Landroid/content/Context;Ljava/lang/String;)Z

    move-result v0

    const/4 v1, 0x0

    if-nez v0, :cond_0

    return v1

    :cond_0
    invoke-static {p1}, Lcom/motorola/ccc/ota/ui/UpdaterUtils;->getBatteryLevel(Landroid/content/Context;)I

    move-result v0

    new-instance v2, Ljava/lang/StringBuilder;

    const-string v3, "UpdateReceiver: battery level "

    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    const-string v3, "OtaApp"

    invoke-static {v3, v2}, Lcom/motorola/ccc/ota/utils/Logger;->info(Ljava/lang/String;Ljava/lang/String;)V

    invoke-static {}, Lcom/motorola/ccc/ota/ui/UpdaterUtils;->allowedBatteryLevel()I

    move-result v2

    const/4 v3, 0x1

    if-ge v0, v2, :cond_1

    const-string v0, "Restart"

    invoke-virtual {v0, p3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p3

    if-nez p3, :cond_1

    iget-object p0, p0, Lcom/motorola/ccc/ota/ui/UpdateReceiver;->botaSettings:Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    sget-object p1, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->BATTERY_LOW:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    invoke-virtual {p0, p1, v3}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->setBoolean(Lcom/motorola/otalib/common/settings/ISetting;Z)V

    invoke-static {}, Lcom/motorola/ccc/ota/ui/UpdaterUtils;->checkAndEnableBatteryStatusReceiver()Z

    invoke-static {}, Lcom/motorola/ccc/ota/ui/UpdaterUtils;->checkAndEnablePowerDownReceiver()Z

    return v1

    :cond_1
    invoke-static {p1}, Lcom/motorola/ccc/ota/ui/UpdaterUtils;->isPriorityAppRunning(Landroid/content/Context;)Z

    move-result p3

    if-eqz p3, :cond_2

    invoke-static {}, Lcom/motorola/ccc/ota/env/OtaApplication;->getExecutorService()Ljava/util/concurrent/ExecutorService;

    move-result-object p3

    new-instance v0, Lcom/motorola/ccc/ota/ui/UpdateReceiver$1;

    invoke-direct {v0, p0, p1, p2}, Lcom/motorola/ccc/ota/ui/UpdateReceiver$1;-><init>(Lcom/motorola/ccc/ota/ui/UpdateReceiver;Landroid/content/Context;Landroid/content/Intent;)V

    invoke-interface {p3, v0}, Ljava/util/concurrent/ExecutorService;->submit(Ljava/lang/Runnable;)Ljava/util/concurrent/Future;

    return v1

    :cond_2
    return v3
.end method

.method private doSanityCheckForFullScreen(Landroid/content/Context;Ljava/lang/String;Landroid/content/Intent;)Z
    .locals 18

    move-object/from16 v1, p0

    move-object/from16 v2, p1

    move-object/from16 v4, p2

    move-object/from16 v5, p3

    invoke-static/range {p3 .. p3}, Lcom/motorola/ccc/ota/ui/UpdaterUtils;->getUpgradeInfoDuringOTAUpdate(Landroid/content/Intent;)Lcom/motorola/ccc/ota/ui/UpdaterUtils$UpgradeInfo;

    move-result-object v6

    const-string v0, "com.motorola.blur.service.blur.upgrade.version"

    invoke-virtual {v5, v0}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v10

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v8

    invoke-static {}, Lcom/motorola/ccc/ota/ui/UpdaterUtils;->shouldBlockFullScreen()Z

    move-result v0

    const/4 v11, 0x0

    if-eqz v0, :cond_0

    return v11

    :cond_0
    iget-object v0, v1, Lcom/motorola/ccc/ota/ui/UpdateReceiver;->botaSettings:Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    sget-object v3, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->IS_UPDATE_PENDING_ON_REBOOT:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    invoke-virtual {v0, v3}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->getBoolean(Lcom/motorola/otalib/common/settings/ISetting;)Z

    move-result v0

    if-eqz v0, :cond_2

    invoke-static/range {p1 .. p1}, Lcom/motorola/ccc/ota/utils/NotificationUtils;->isNotificationServiceRunning(Landroid/content/Context;)Z

    move-result v0

    if-nez v0, :cond_1

    invoke-direct {v1, v6, v2, v10}, Lcom/motorola/ccc/ota/ui/UpdateReceiver;->showFirstNetPendingRebootNotification(Lcom/motorola/ccc/ota/ui/UpdaterUtils$UpgradeInfo;Landroid/content/Context;Ljava/lang/String;)V

    :cond_1
    return v11

    :cond_2
    iget-object v0, v1, Lcom/motorola/ccc/ota/ui/UpdateReceiver;->botaSettings:Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    sget-object v3, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->NOTIFICATION_NEXT_PROMPT:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    const-wide/16 v12, 0x0

    invoke-virtual {v0, v3, v12, v13}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->getLong(Lcom/motorola/otalib/common/settings/ISetting;J)J

    move-result-wide v14

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v16

    cmp-long v0, v14, v16

    if-lez v0, :cond_4

    invoke-static/range {p1 .. p1}, Lcom/motorola/ccc/ota/utils/NotificationUtils;->isNotificationServiceRunning(Landroid/content/Context;)Z

    move-result v0

    if-nez v0, :cond_3

    move-object/from16 v0, p1

    move-object/from16 v1, p2

    move-wide v2, v14

    move-object/from16 v4, p3

    move-object v5, v6

    invoke-static/range {v0 .. v5}, Lcom/motorola/ccc/ota/utils/NotificationUtils;->displayNotification(Landroid/content/Context;Ljava/lang/String;JLandroid/content/Intent;Lcom/motorola/ccc/ota/ui/UpdaterUtils$UpgradeInfo;)V

    :cond_3
    return v11

    :cond_4
    invoke-static/range {p1 .. p1}, Lcom/motorola/ccc/ota/ui/UpdaterUtils;->isPriorityAppRunning(Landroid/content/Context;)Z

    move-result v0

    const-string v3, "Restart"

    if-eqz v0, :cond_6

    iget-object v0, v1, Lcom/motorola/ccc/ota/ui/UpdateReceiver;->botaSettings:Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    sget-object v7, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->NOTIFICATION_TAPPED:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    invoke-virtual {v0, v7}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->getBoolean(Lcom/motorola/otalib/common/settings/ISetting;)Z

    move-result v0

    if-nez v0, :cond_6

    const-string v0, "CheckForMap"

    invoke-virtual {v5, v0, v11}, Landroid/content/Intent;->getBooleanExtra(Ljava/lang/String;Z)Z

    move-result v0

    if-eqz v0, :cond_6

    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_5

    iget-object v0, v1, Lcom/motorola/ccc/ota/ui/UpdateReceiver;->botaSettings:Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    invoke-virtual {v6}, Lcom/motorola/ccc/ota/ui/UpdaterUtils$UpgradeInfo;->getUpdateTypeData()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/motorola/ccc/ota/utils/SmartUpdateUtils;->isSmartUpdateNearestToInstall(Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_5

    invoke-static {}, Lcom/motorola/ccc/ota/utils/NotificationUtils;->cancelOtaNotification()V

    :cond_5
    invoke-static {v2, v4, v5, v11}, Lcom/motorola/ccc/ota/ui/UpdaterUtils;->priorityAppRunningPostponeActivity(Landroid/content/Context;Ljava/lang/String;Landroid/content/Intent;Z)V

    return v11

    :cond_6
    iget-object v0, v1, Lcom/motorola/ccc/ota/ui/UpdateReceiver;->botaSettings:Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    sget-object v7, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->NOTIFICATION_TAPPED:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    invoke-virtual {v0, v7}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->removeConfig(Lcom/motorola/otalib/common/settings/ISetting;)V

    invoke-static/range {p1 .. p2}, Lcom/motorola/ccc/ota/ui/UpdaterUtils;->isPromptAllowed(Landroid/content/Context;Ljava/lang/String;)Z

    move-result v0

    const/4 v7, 0x1

    const-string v14, "OtaApp"

    if-eqz v0, :cond_9

    iget-object v0, v1, Lcom/motorola/ccc/ota/ui/UpdateReceiver;->botaSettings:Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    sget-object v15, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->ACTIVITY_NEXT_PROMPT:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    invoke-virtual {v0, v15, v12, v13}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->getLong(Lcom/motorola/otalib/common/settings/ISetting;J)J

    move-result-wide v12

    new-instance v0, Ljava/lang/StringBuilder;

    const-string v15, "dosanity : remaining (mins) "

    invoke-direct {v0, v15}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    sget-object v15, Ljava/util/concurrent/TimeUnit;->MILLISECONDS:Ljava/util/concurrent/TimeUnit;

    sub-long v1, v12, v8

    invoke-virtual {v15, v1, v2}, Ljava/util/concurrent/TimeUnit;->toMinutes(J)J

    move-result-wide v1

    invoke-virtual {v0, v1, v2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v14, v0}, Lcom/motorola/ccc/ota/utils/Logger;->debug(Ljava/lang/String;Ljava/lang/String;)V

    cmp-long v0, v8, v12

    if-gez v0, :cond_7

    invoke-static {}, Lcom/motorola/ccc/ota/env/OtaApplication;->getExecutorService()Ljava/util/concurrent/ExecutorService;

    move-result-object v14

    new-instance v15, Lcom/motorola/ccc/ota/ui/UpdateReceiver$2;

    move-object v0, v15

    move-object/from16 v1, p0

    move-object/from16 v2, p1

    move-object v3, v6

    move-object/from16 v4, p2

    move-object/from16 v5, p3

    move-wide v6, v12

    invoke-direct/range {v0 .. v10}, Lcom/motorola/ccc/ota/ui/UpdateReceiver$2;-><init>(Lcom/motorola/ccc/ota/ui/UpdateReceiver;Landroid/content/Context;Lcom/motorola/ccc/ota/ui/UpdaterUtils$UpgradeInfo;Ljava/lang/String;Landroid/content/Intent;JJLjava/lang/String;)V

    invoke-interface {v14, v15}, Ljava/util/concurrent/ExecutorService;->submit(Ljava/lang/Runnable;)Ljava/util/concurrent/Future;

    return v11

    :cond_7
    invoke-static {}, Lcom/motorola/ccc/ota/ui/UpdaterUtils;->shouldDisplayLowBatteryPopup()Z

    move-result v0

    if-eqz v0, :cond_8

    invoke-virtual {v4, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_8

    invoke-static/range {p1 .. p1}, Lcom/motorola/ccc/ota/ui/UpdaterUtils;->getBatteryLevel(Landroid/content/Context;)I

    move-result v0

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "UpdateReceiver: battery level "

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v14, v1}, Lcom/motorola/ccc/ota/utils/Logger;->info(Ljava/lang/String;Ljava/lang/String;)V

    invoke-static {}, Lcom/motorola/ccc/ota/ui/UpdaterUtils;->allowedBatteryLevel()I

    move-result v1

    if-ge v0, v1, :cond_8

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/motorola/ccc/ota/ui/UpdateReceiver;->botaSettings:Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    sget-object v1, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->BATTERY_LOW:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    invoke-virtual {v0, v1, v7}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->setBoolean(Lcom/motorola/otalib/common/settings/ISetting;Z)V

    invoke-static {}, Lcom/motorola/ccc/ota/ui/UpdaterUtils;->checkAndEnableBatteryStatusReceiver()Z

    invoke-static {}, Lcom/motorola/ccc/ota/ui/UpdaterUtils;->checkAndEnablePowerDownReceiver()Z

    return v11

    :cond_8
    move-object/from16 v0, p0

    goto :goto_0

    :cond_9
    move-object v0, v1

    :goto_0
    const-string v1, "UpdateReceiver:Received true from doSanityCheckForFullScreen"

    invoke-static {v14, v1}, Lcom/motorola/ccc/ota/utils/Logger;->debug(Ljava/lang/String;Ljava/lang/String;)V

    new-instance v1, Landroid/content/Intent;

    const-string v2, "com.motorola.ccc.ota.Actions.ACTIVITY_ANNOY_VALUE_EXPIRY"

    invoke-direct {v1, v2}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    sget-object v2, Lcom/motorola/ccc/ota/ui/UpdateReceiver$PendingIntentType;->BROADCAST:Lcom/motorola/ccc/ota/ui/UpdateReceiver$PendingIntentType;

    move-object/from16 v3, p1

    invoke-direct {v0, v3, v1, v2}, Lcom/motorola/ccc/ota/ui/UpdateReceiver;->cancelAnyPendingIntentSetPreviously(Landroid/content/Context;Landroid/content/Intent;Lcom/motorola/ccc/ota/ui/UpdateReceiver$PendingIntentType;)V

    return v7
.end method

.method private doSanityCheckForMergeRestartFullScreen(Landroid/content/Context;Landroid/content/Intent;)Z
    .locals 3

    new-instance p0, Ljava/lang/StringBuilder;

    const-string v0, "doSanityCheckForMergeRestartFullScreen:notifyservicerunning="

    invoke-direct {p0, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const/16 v0, 0x6c1

    invoke-static {p1, v0}, Lcom/motorola/ccc/ota/utils/NotificationUtils;->hasNotification(Landroid/content/Context;I)Z

    move-result v1

    invoke-virtual {p0, v1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    const-string v1, "OtaApp"

    invoke-static {v1, p0}, Lcom/motorola/ccc/ota/utils/Logger;->error(Ljava/lang/String;Ljava/lang/String;)V

    invoke-static {p1, v0}, Lcom/motorola/ccc/ota/utils/NotificationUtils;->hasNotification(Landroid/content/Context;I)Z

    move-result p0

    const/4 v0, 0x0

    if-eqz p0, :cond_0

    return v0

    :cond_0
    const/4 p0, 0x1

    :try_start_0
    const-string v1, "activity"

    invoke-virtual {p1, v1}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/app/ActivityManager;

    invoke-virtual {v1}, Landroid/app/ActivityManager;->getAppTasks()Ljava/util/List;

    move-result-object v2

    invoke-interface {v2}, Ljava/util/List;->size()I

    move-result v2

    if-lt v2, p0, :cond_1

    const-class v2, Lcom/motorola/ccc/ota/ui/BaseActivity;

    invoke-virtual {v2}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1}, Landroid/app/ActivityManager;->getAppTasks()Ljava/util/List;

    move-result-object v1

    invoke-interface {v1, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/app/ActivityManager$AppTask;

    invoke-virtual {v1}, Landroid/app/ActivityManager$AppTask;->getTaskInfo()Landroid/app/ActivityManager$RecentTaskInfo;

    move-result-object v1

    iget-object v1, v1, Landroid/app/ActivityManager$RecentTaskInfo;->topActivity:Landroid/content/ComponentName;

    invoke-virtual {v1}, Landroid/content/ComponentName;->getClassName()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v2, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1
    :try_end_0
    .catch Ljava/lang/NullPointerException; {:try_start_0 .. :try_end_0} :catch_0

    if-eqz v1, :cond_1

    return v0

    :catch_0
    :cond_1
    invoke-static {p1}, Lcom/motorola/ccc/ota/ui/UpdaterUtils;->isPriorityAppRunning(Landroid/content/Context;)Z

    move-result v1

    const-string v2, "MergeRestart"

    if-eqz v1, :cond_2

    invoke-static {p1, v2, p2, v0}, Lcom/motorola/ccc/ota/ui/UpdaterUtils;->priorityAppRunningPostponeActivity(Landroid/content/Context;Ljava/lang/String;Landroid/content/Intent;Z)V

    return v0

    :cond_2
    invoke-static {p1, v2}, Lcom/motorola/ccc/ota/ui/UpdaterUtils;->isPromptAllowed(Landroid/content/Context;Ljava/lang/String;)Z

    move-result p1

    if-nez p1, :cond_3

    return v0

    :cond_3
    return p0
.end method

.method private getAnnoyExpiryTargetIntent(Landroid/content/Context;Landroid/content/Intent;Ljava/lang/String;)Landroid/content/Intent;
    .locals 1

    const-string p0, "Download"

    invoke-virtual {p3, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    const-string v0, "fragment_type"

    if-eqz p0, :cond_0

    const-class p0, Lcom/motorola/ccc/ota/ui/BaseActivity;

    invoke-virtual {p2, p1, p0}, Landroid/content/Intent;->setClass(Landroid/content/Context;Ljava/lang/Class;)Landroid/content/Intent;

    move-result-object p0

    sget-object p1, Lcom/motorola/ccc/ota/utils/UpgradeUtilConstants$FragmentTypeEnum;->DOWNLOAD_FRAGMENT:Lcom/motorola/ccc/ota/utils/UpgradeUtilConstants$FragmentTypeEnum;

    invoke-virtual {p1}, Lcom/motorola/ccc/ota/utils/UpgradeUtilConstants$FragmentTypeEnum;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p0, v0, p1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    move-result-object p0

    return-object p0

    :cond_0
    const-string p0, "Restart"

    invoke-virtual {p3, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-eqz p0, :cond_1

    const-class p0, Lcom/motorola/ccc/ota/ui/BaseActivity;

    invoke-virtual {p2, p1, p0}, Landroid/content/Intent;->setClass(Landroid/content/Context;Ljava/lang/Class;)Landroid/content/Intent;

    move-result-object p0

    sget-object p1, Lcom/motorola/ccc/ota/utils/UpgradeUtilConstants$FragmentTypeEnum;->RESTART_FRAGMENT:Lcom/motorola/ccc/ota/utils/UpgradeUtilConstants$FragmentTypeEnum;

    invoke-virtual {p1}, Lcom/motorola/ccc/ota/utils/UpgradeUtilConstants$FragmentTypeEnum;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p0, v0, p1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    move-result-object p0

    return-object p0

    :cond_1
    const-string p0, "MergeRestart"

    invoke-virtual {p3, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-eqz p0, :cond_2

    const-class p0, Lcom/motorola/ccc/ota/ui/BaseActivity;

    invoke-virtual {p2, p1, p0}, Landroid/content/Intent;->setClass(Landroid/content/Context;Ljava/lang/Class;)Landroid/content/Intent;

    move-result-object p0

    sget-object p1, Lcom/motorola/ccc/ota/utils/UpgradeUtilConstants$FragmentTypeEnum;->MERGE_RESTART_FRAGMENT:Lcom/motorola/ccc/ota/utils/UpgradeUtilConstants$FragmentTypeEnum;

    invoke-virtual {p1}, Lcom/motorola/ccc/ota/utils/UpgradeUtilConstants$FragmentTypeEnum;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p0, v0, p1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    move-result-object p0

    return-object p0

    :cond_2
    const-class p0, Lcom/motorola/ccc/ota/ui/BaseActivity;

    invoke-virtual {p2, p1, p0}, Landroid/content/Intent;->setClass(Landroid/content/Context;Ljava/lang/Class;)Landroid/content/Intent;

    move-result-object p0

    sget-object p1, Lcom/motorola/ccc/ota/utils/UpgradeUtilConstants$FragmentTypeEnum;->INSTALL_FRAGMENT:Lcom/motorola/ccc/ota/utils/UpgradeUtilConstants$FragmentTypeEnum;

    invoke-virtual {p1}, Lcom/motorola/ccc/ota/utils/UpgradeUtilConstants$FragmentTypeEnum;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p0, v0, p1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    move-result-object p0

    return-object p0
.end method

.method private shouldIForceTheInstallation(Lcom/motorola/ccc/ota/ui/UpdaterUtils$UpgradeInfo;Landroid/content/Context;Landroid/content/Intent;Ljava/lang/String;)Z
    .locals 4

    const-string v0, "com.motorola.blur.service.blur.upgrade.version"

    invoke-virtual {p3, v0}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    iget-object v1, p0, Lcom/motorola/ccc/ota/ui/UpdateReceiver;->systemUpdaterPolicy:Lcom/motorola/ccc/ota/env/SystemUpdaterPolicy;

    invoke-virtual {p1}, Lcom/motorola/ccc/ota/ui/UpdaterUtils$UpgradeInfo;->getUpdateTypeData()Ljava/lang/String;

    move-result-object v2

    iget-object v3, p0, Lcom/motorola/ccc/ota/ui/UpdateReceiver;->botaSettings:Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    invoke-virtual {v1, v2, v3}, Lcom/motorola/ccc/ota/env/SystemUpdaterPolicy;->isSystemUpdatePolicyEnabled(Ljava/lang/String;Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;)Z

    move-result v1

    const/4 v2, 0x1

    if-eqz v1, :cond_1

    invoke-static {}, Lcom/motorola/ccc/ota/utils/NotificationUtils;->cancelOtaNotification()V

    invoke-direct {p0, p2, p3, p4}, Lcom/motorola/ccc/ota/ui/UpdateReceiver;->doSanityCheckForForceInstall(Landroid/content/Context;Landroid/content/Intent;Ljava/lang/String;)Z

    move-result p1

    if-eqz p1, :cond_0

    iget-object p1, p0, Lcom/motorola/ccc/ota/ui/UpdateReceiver;->systemUpdaterPolicy:Lcom/motorola/ccc/ota/env/SystemUpdaterPolicy;

    iget-object p0, p0, Lcom/motorola/ccc/ota/ui/UpdateReceiver;->botaSettings:Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    invoke-virtual {p1, p2, p3, p0}, Lcom/motorola/ccc/ota/env/SystemUpdaterPolicy;->handleSystemUpdatePolicy(Landroid/content/Context;Landroid/content/Intent;Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;)Z

    :cond_0
    return v2

    :cond_1
    invoke-virtual {p1}, Lcom/motorola/ccc/ota/ui/UpdaterUtils$UpgradeInfo;->showPreInstallScreen()Z

    move-result v1

    const-string v3, "OtaApp"

    if-nez v1, :cond_4

    sget-boolean v1, Lcom/motorola/ccc/ota/ui/UpdaterUtils;->sDeviceIdleModeRequired:Z

    if-eqz v1, :cond_4

    invoke-static {}, Lcom/motorola/ccc/ota/utils/NotificationUtils;->cancelOtaNotification()V

    invoke-static {p2}, Lcom/motorola/ccc/ota/ui/UpdaterUtils;->checkDozeMode(Landroid/content/Context;)Z

    move-result p1

    if-nez p1, :cond_2

    const-string p0, "Waiting for doze mode."

    invoke-static {v3, p0}, Lcom/motorola/ccc/ota/utils/Logger;->debug(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_0

    :cond_2
    invoke-direct {p0, p2, p3, p4}, Lcom/motorola/ccc/ota/ui/UpdateReceiver;->doSanityCheckForForceInstall(Landroid/content/Context;Landroid/content/Intent;Ljava/lang/String;)Z

    move-result p0

    if-eqz p0, :cond_3

    const-string p0, "dozeModeInstall"

    invoke-static {p2, v0, v2, p0}, Lcom/motorola/ccc/ota/utils/UpgradeUtilMethods;->sendUpgradeLaunchProceed(Landroid/content/Context;Ljava/lang/String;ZLjava/lang/String;)V

    :cond_3
    :goto_0
    return v2

    :cond_4
    invoke-virtual {p1}, Lcom/motorola/ccc/ota/ui/UpdaterUtils$UpgradeInfo;->isForceInstallTimerExpired()Z

    move-result p1

    const/4 v1, 0x0

    if-eqz p1, :cond_7

    invoke-static {p2}, Lcom/motorola/ccc/ota/ui/UpdaterUtils;->checkDozeMode(Landroid/content/Context;)Z

    move-result p1

    if-nez p1, :cond_6

    invoke-static {}, Lcom/motorola/ccc/ota/ui/UpdaterUtils;->isWaitForDozeModeOver()Z

    move-result p0

    if-eqz p0, :cond_5

    const-string p0, "UpdaterUtils.amIDoingSilentOta: Did not enter doze mode in 10 days, force installation now"

    invoke-static {v3, p0}, Lcom/motorola/ccc/ota/utils/Logger;->debug(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_1

    :cond_5
    const-string p0, "UpdaterUtils.amIDoingSilentOta: Waiting for doze mode."

    invoke-static {v3, p0}, Lcom/motorola/ccc/ota/utils/Logger;->debug(Ljava/lang/String;Ljava/lang/String;)V

    :goto_1
    return v1

    :cond_6
    invoke-direct {p0, p2, p3, p4}, Lcom/motorola/ccc/ota/ui/UpdateReceiver;->doSanityCheckForForceInstall(Landroid/content/Context;Landroid/content/Intent;Ljava/lang/String;)Z

    move-result p0

    if-eqz p0, :cond_7

    invoke-static {}, Lcom/motorola/ccc/ota/utils/NotificationUtils;->cancelOtaNotification()V

    const-string p0, "forceInstallInDozeMode"

    invoke-static {p2, v0, v2, p0}, Lcom/motorola/ccc/ota/utils/UpgradeUtilMethods;->sendUpgradeLaunchProceed(Landroid/content/Context;Ljava/lang/String;ZLjava/lang/String;)V

    return v2

    :cond_7
    return v1
.end method

.method private showCancelPopupIntent(Landroid/content/Context;Lcom/motorola/otalib/common/utils/UpgradeUtils$DownloadStatus;)V
    .locals 1

    new-instance p0, Landroid/content/Intent;

    const-class v0, Lcom/motorola/ccc/ota/ui/MessageActivity;

    invoke-direct {p0, p1, v0}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    const/high16 v0, 0x10000000

    invoke-virtual {p0, v0}, Landroid/content/Intent;->addFlags(I)Landroid/content/Intent;

    const-string v0, "com.motorola.blur.service.blur.upgrade.download_status"

    invoke-virtual {p2}, Lcom/motorola/otalib/common/utils/UpgradeUtils$DownloadStatus;->toString()Ljava/lang/String;

    move-result-object p2

    invoke-virtual {p0, v0, p2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    invoke-virtual {p1, p0}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    return-void
.end method

.method private showFirstNetPendingRebootNotification(Lcom/motorola/ccc/ota/ui/UpdaterUtils$UpgradeInfo;Landroid/content/Context;Ljava/lang/String;)V
    .locals 3

    invoke-virtual {p1}, Lcom/motorola/ccc/ota/ui/UpdaterUtils$UpgradeInfo;->getminBatteryRequiredForInstall()I

    move-result p1

    invoke-static {p1}, Lcom/motorola/ccc/ota/ui/UpdaterUtils;->getminBatteryRequiredForInstall(I)I

    move-result p1

    invoke-static {}, Ljava/text/NumberFormat;->getPercentInstance()Ljava/text/NumberFormat;

    move-result-object v0

    int-to-float p1, p1

    const/high16 v1, 0x42c80000    # 100.0f

    div-float/2addr p1, v1

    float-to-double v1, p1

    invoke-virtual {v0, v1, v2}, Ljava/text/NumberFormat;->format(D)Ljava/lang/String;

    move-result-object p1

    const v0, 0x7f0e00ff

    filled-new-array {p1}, [Ljava/lang/Object;

    move-result-object p1

    invoke-virtual {p2, v0, p1}, Landroid/content/Context;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p1

    iput-object p1, p0, Lcom/motorola/ccc/ota/ui/UpdateReceiver;->mNotificationTxt:Ljava/lang/String;

    iget-object p0, p0, Lcom/motorola/ccc/ota/ui/UpdateReceiver;->mNotificationTitle:Ljava/lang/String;

    const/4 v0, -0x1

    invoke-static {p2, p0, p1, v0, p3}, Lcom/motorola/ccc/ota/utils/NotificationUtils;->fillInstallSystemUpdateNotificationDetails(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;ILjava/lang/String;)Landroid/content/Intent;

    move-result-object p0

    invoke-static {p2, p0}, Lcom/motorola/ccc/ota/utils/NotificationUtils;->startNotificationService(Landroid/content/Context;Landroid/content/Intent;)V

    return-void
.end method


# virtual methods
.method public onReceive(Landroid/content/Context;Landroid/content/Intent;)V
    .locals 26

    move-object/from16 v0, p0

    move-object/from16 v6, p1

    move-object/from16 v1, p2

    invoke-static/range {p1 .. p1}, Lcom/motorola/ccc/ota/utils/UpgradeUtilMethods;->isSystemUser(Landroid/content/Context;)Z

    move-result v2

    if-nez v2, :cond_0

    return-void

    :cond_0
    invoke-virtual/range {p2 .. p2}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object v2

    new-instance v3, Ljava/lang/StringBuilder;

    const-string v4, "Receive intent: "

    invoke-direct {v3, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    const-string v4, "OtaApp"

    invoke-static {v4, v3}, Lcom/motorola/ccc/ota/utils/Logger;->debug(Ljava/lang/String;Ljava/lang/String;)V

    const/high16 v3, 0x30000000

    invoke-virtual {v1, v3}, Landroid/content/Intent;->setFlags(I)Landroid/content/Intent;

    const-string v5, "com.motorola.blur.service.blur.Actions.UPGRADE_UPDATE_NOTIFICATION"

    invoke-virtual {v5, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    const-string v7, "fragment_type"

    if-eqz v5, :cond_1

    const-string v2, "Download"

    invoke-direct {v0, v6, v2, v1}, Lcom/motorola/ccc/ota/ui/UpdateReceiver;->doSanityCheckForFullScreen(Landroid/content/Context;Ljava/lang/String;Landroid/content/Intent;)Z

    move-result v0

    if-eqz v0, :cond_41

    const-class v0, Lcom/motorola/ccc/ota/ui/BaseActivity;

    invoke-virtual {v1, v6, v0}, Landroid/content/Intent;->setClass(Landroid/content/Context;Ljava/lang/Class;)Landroid/content/Intent;

    sget-object v0, Lcom/motorola/ccc/ota/utils/UpgradeUtilConstants$FragmentTypeEnum;->DOWNLOAD_FRAGMENT:Lcom/motorola/ccc/ota/utils/UpgradeUtilConstants$FragmentTypeEnum;

    invoke-virtual {v0}, Lcom/motorola/ccc/ota/utils/UpgradeUtilConstants$FragmentTypeEnum;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v1, v7, v0}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    invoke-virtual/range {p1 .. p2}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    goto/16 :goto_8

    :cond_1
    const-string v5, "com.motorola.blur.service.blur.Actions.UPGRADE_DOWNLOAD_STATUS"

    invoke-virtual {v5, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    const-string v8, "UpdateReceiver:Exception on overriding metadata"

    const-string v9, "showDownloadProgress"

    const/4 v10, -0x1

    const-wide/16 v11, 0x0

    const-string v13, "metadata is empty return"

    const-string v14, "Install"

    const/4 v3, 0x1

    if-eqz v5, :cond_12

    new-instance v2, Lcom/motorola/ccc/ota/ui/DownloadNotification;

    invoke-direct {v2, v6}, Lcom/motorola/ccc/ota/ui/DownloadNotification;-><init>(Landroid/content/Context;)V

    invoke-static/range {p2 .. p2}, Lcom/motorola/ccc/ota/utils/UpgradeUtilMethods;->downloadStatusFromIntent(Landroid/content/Intent;)Lcom/motorola/otalib/common/utils/UpgradeUtils$DownloadStatus;

    move-result-object v5

    sget-object v15, Lcom/motorola/otalib/common/utils/UpgradeUtils$DownloadStatus;->STATUS_OK:Lcom/motorola/otalib/common/utils/UpgradeUtils$DownloadStatus;

    if-ne v5, v15, :cond_4

    invoke-static/range {p2 .. p2}, Lcom/motorola/ccc/ota/ui/UpdaterUtils;->getUpgradeInfoDuringOTAUpdate(Landroid/content/Intent;)Lcom/motorola/ccc/ota/ui/UpdaterUtils$UpgradeInfo;

    move-result-object v2

    if-nez v2, :cond_2

    invoke-static {v4, v13}, Lcom/motorola/ccc/ota/utils/Logger;->debug(Ljava/lang/String;Ljava/lang/String;)V

    return-void

    :cond_2
    iget-object v4, v0, Lcom/motorola/ccc/ota/ui/UpdateReceiver;->botaSettings:Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    sget-object v5, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->DOWNLOAD_COMPLETED:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    invoke-virtual {v4, v5, v3}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->setBoolean(Lcom/motorola/otalib/common/settings/ISetting;Z)V

    invoke-direct {v0, v2, v6, v1, v14}, Lcom/motorola/ccc/ota/ui/UpdateReceiver;->shouldIForceTheInstallation(Lcom/motorola/ccc/ota/ui/UpdaterUtils$UpgradeInfo;Landroid/content/Context;Landroid/content/Intent;Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_3

    return-void

    :cond_3
    invoke-direct {v0, v6, v14, v1}, Lcom/motorola/ccc/ota/ui/UpdateReceiver;->doSanityCheckForFullScreen(Landroid/content/Context;Ljava/lang/String;Landroid/content/Intent;)Z

    move-result v0

    if-eqz v0, :cond_41

    invoke-static {}, Lcom/motorola/ccc/ota/utils/NotificationUtils;->cancelOtaNotification()V

    const-class v0, Lcom/motorola/ccc/ota/ui/BaseActivity;

    invoke-virtual {v1, v6, v0}, Landroid/content/Intent;->setClass(Landroid/content/Context;Ljava/lang/Class;)Landroid/content/Intent;

    sget-object v0, Lcom/motorola/ccc/ota/utils/UpgradeUtilConstants$FragmentTypeEnum;->INSTALL_FRAGMENT:Lcom/motorola/ccc/ota/utils/UpgradeUtilConstants$FragmentTypeEnum;

    invoke-virtual {v0}, Lcom/motorola/ccc/ota/utils/UpgradeUtilConstants$FragmentTypeEnum;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v1, v7, v0}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    invoke-virtual/range {p1 .. p2}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    goto/16 :goto_8

    :cond_4
    sget-object v7, Lcom/motorola/otalib/common/utils/UpgradeUtils$DownloadStatus;->STATUS_TEMP_OK:Lcom/motorola/otalib/common/utils/UpgradeUtils$DownloadStatus;

    if-ne v5, v7, :cond_b

    iget-object v5, v0, Lcom/motorola/ccc/ota/ui/UpdateReceiver;->botaSettings:Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    sget-object v6, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->METADATA:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    invoke-virtual {v5, v6}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->getString(Lcom/motorola/otalib/common/settings/ISetting;)Ljava/lang/String;

    move-result-object v5

    invoke-static {v5}, Lcom/motorola/otalib/common/metaData/builder/MetaDataBuilder;->from(Ljava/lang/String;)Lcom/motorola/otalib/common/metaData/MetaData;

    move-result-object v5

    if-nez v5, :cond_5

    invoke-static {v4, v13}, Lcom/motorola/ccc/ota/utils/Logger;->debug(Ljava/lang/String;Ljava/lang/String;)V

    return-void

    :cond_5
    invoke-static/range {p2 .. p2}, Lcom/motorola/ccc/ota/utils/UpgradeUtilMethods;->deferredFromIntent(Landroid/content/Intent;)I

    move-result v6

    invoke-static {}, Lcom/motorola/ccc/ota/ui/UpdaterUtils;->showDownloadProgress()Z

    move-result v7

    if-nez v7, :cond_8

    invoke-virtual {v5}, Lcom/motorola/otalib/common/metaData/MetaData;->getForceDownloadTime()D

    move-result-wide v13

    cmpl-double v7, v13, v11

    if-ltz v7, :cond_6

    invoke-static {}, Lcom/motorola/ccc/ota/ui/UpdaterUtils;->checkForFinalDeferTimeForForceUpdate()Z

    move-result v7

    if-nez v7, :cond_8

    return-void

    :cond_6
    invoke-static {}, Lcom/motorola/ccc/ota/utils/BuildPropReader;->isBotaATT()Z

    move-result v7

    if-eqz v7, :cond_7

    if-ne v6, v10, :cond_7

    invoke-static {v5, v9, v3}, Lcom/motorola/ccc/ota/utils/MetadataOverrider;->returnOverWrittenMetaData(Lcom/motorola/otalib/common/metaData/MetaData;Ljava/lang/String;Z)Lcom/motorola/otalib/common/metaData/MetaData;

    move-result-object v7

    :try_start_0
    invoke-static {v7}, Lcom/motorola/otalib/common/metaData/builder/MetaDataBuilder;->toJSONString(Lcom/motorola/otalib/common/metaData/MetaData;)Ljava/lang/String;

    move-result-object v7

    invoke-static {v7}, Lcom/motorola/ccc/ota/utils/UpgradeUtilMethods;->sendActionMetadataOverride(Ljava/lang/String;)V
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    invoke-static {v4, v8}, Lcom/motorola/ccc/ota/utils/Logger;->error(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_0

    :cond_7
    return-void

    :cond_8
    :goto_0
    invoke-static/range {p2 .. p2}, Lcom/motorola/ccc/ota/utils/UpgradeUtilMethods;->receivedBytesFromIntent(Landroid/content/Intent;)J

    move-result-wide v19

    invoke-static/range {p2 .. p2}, Lcom/motorola/ccc/ota/utils/UpgradeUtilMethods;->totalBytesFromIntent(Landroid/content/Intent;)J

    move-result-wide v17

    invoke-static/range {p2 .. p2}, Lcom/motorola/ccc/ota/utils/UpgradeUtilMethods;->locationTypeFromIntent(Landroid/content/Intent;)Ljava/lang/String;

    move-result-object v21

    invoke-static/range {p2 .. p2}, Lcom/motorola/ccc/ota/utils/UpgradeUtilMethods;->downloadOnWifiFromIntent(Landroid/content/Intent;)Z

    move-result v23

    invoke-virtual {v5}, Lcom/motorola/otalib/common/metaData/MetaData;->getForceDownloadTime()D

    move-result-wide v7

    cmpl-double v1, v7, v11

    if-ltz v1, :cond_9

    move/from16 v24, v3

    goto :goto_1

    :cond_9
    const/16 v24, 0x0

    :goto_1
    iget-object v1, v0, Lcom/motorola/ccc/ota/ui/UpdateReceiver;->botaSettings:Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    sget-object v3, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->DOWNLOAD_COMPLETED:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    invoke-virtual {v1, v3}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->getBoolean(Lcom/motorola/otalib/common/settings/ISetting;)Z

    move-result v1

    if-eqz v1, :cond_a

    const-string v0, "UpdateReceiver.onReceive, ignore download progress intent after download complete"

    invoke-static {v4, v0}, Lcom/motorola/ccc/ota/utils/Logger;->info(Ljava/lang/String;Ljava/lang/String;)V

    return-void

    :cond_a
    iget-object v0, v0, Lcom/motorola/ccc/ota/ui/UpdateReceiver;->botaSettings:Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    move-object/from16 v16, v2

    move/from16 v22, v6

    move-object/from16 v25, v0

    invoke-virtual/range {v16 .. v25}, Lcom/motorola/ccc/ota/ui/DownloadNotification;->updateNotification(JJLjava/lang/String;IZZLcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;)V

    goto/16 :goto_8

    :cond_b
    iget-object v2, v0, Lcom/motorola/ccc/ota/ui/UpdateReceiver;->botaSettings:Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    sget-object v3, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->FLAG_IS_VITAL_UPDATE:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    invoke-virtual {v2, v3}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->getBoolean(Lcom/motorola/otalib/common/settings/ISetting;)Z

    move-result v2

    if-eqz v2, :cond_d

    iget-object v1, v0, Lcom/motorola/ccc/ota/ui/UpdateReceiver;->botaSettings:Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    sget-object v2, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->LAUNCHED_NEXT_SETUP_SCREEN_ON_SKIP_OR_STOP:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    invoke-virtual {v1, v2}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->getBoolean(Lcom/motorola/otalib/common/settings/ISetting;)Z

    move-result v1

    if-eqz v1, :cond_c

    iget-object v0, v0, Lcom/motorola/ccc/ota/ui/UpdateReceiver;->botaSettings:Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    sget-object v1, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->LAUNCHED_NEXT_SETUP_SCREEN_ON_SKIP_OR_STOP:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    invoke-virtual {v0, v1}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->removeConfig(Lcom/motorola/otalib/common/settings/ISetting;)V

    goto :goto_2

    :cond_c
    invoke-static/range {p1 .. p1}, Lcom/motorola/ccc/ota/ui/UpdaterUtils;->launchNextSetupActivityVitalUpdate(Landroid/content/Context;)V

    :goto_2
    invoke-static/range {p1 .. p1}, Lcom/motorola/ccc/ota/ui/UpdaterUtils;->stopBGInstallActivity(Landroid/content/Context;)V

    return-void

    :cond_d
    invoke-static/range {p2 .. p2}, Lcom/motorola/ccc/ota/ui/UpdaterUtils;->isDisplayErrorAllowed(Landroid/content/Intent;)Z

    move-result v0

    if-nez v0, :cond_e

    invoke-static {}, Lcom/motorola/ccc/ota/utils/NotificationUtils;->cancelOtaNotification()V

    return-void

    :cond_e
    sget-object v0, Lcom/motorola/otalib/common/utils/UpgradeUtils$DownloadStatus;->STATUS_SPACE:Lcom/motorola/otalib/common/utils/UpgradeUtils$DownloadStatus;

    if-eq v5, v0, :cond_f

    sget-object v0, Lcom/motorola/otalib/common/utils/UpgradeUtils$DownloadStatus;->STATUS_SPACE_INSTALL:Lcom/motorola/otalib/common/utils/UpgradeUtils$DownloadStatus;

    if-eq v5, v0, :cond_f

    sget-object v0, Lcom/motorola/otalib/common/utils/UpgradeUtils$DownloadStatus;->STATUS_SPACE_BACKGROUND_INSTALL:Lcom/motorola/otalib/common/utils/UpgradeUtils$DownloadStatus;

    if-eq v5, v0, :cond_f

    sget-object v0, Lcom/motorola/otalib/common/utils/UpgradeUtils$DownloadStatus;->STATUS_SPACE_PAYLOAD_METADATA_CHECK:Lcom/motorola/otalib/common/utils/UpgradeUtils$DownloadStatus;

    if-eq v5, v0, :cond_f

    sget-object v0, Lcom/motorola/otalib/common/utils/UpgradeUtils$DownloadStatus;->STATUS_VAB_MAKE_SPACE_REQUEST_USER:Lcom/motorola/otalib/common/utils/UpgradeUtils$DownloadStatus;

    if-ne v5, v0, :cond_10

    :cond_f
    invoke-static/range {p1 .. p1}, Lcom/motorola/ccc/ota/utils/NotificationUtils;->isNotificationServiceRunning(Landroid/content/Context;)Z

    move-result v0

    if-eqz v0, :cond_10

    const-string v0, "persistent notification present in status bar"

    invoke-static {v4, v0}, Lcom/motorola/ccc/ota/utils/Logger;->debug(Ljava/lang/String;Ljava/lang/String;)V

    return-void

    :cond_10
    sget-object v0, Lcom/motorola/otalib/common/utils/UpgradeUtils$DownloadStatus;->STATUS_VAB_MAKE_SPACE_REQUEST_USER:Lcom/motorola/otalib/common/utils/UpgradeUtils$DownloadStatus;

    if-eq v5, v0, :cond_11

    invoke-static/range {p1 .. p1}, Lcom/motorola/ccc/ota/ui/UpdaterUtils;->stopBGInstallActivity(Landroid/content/Context;)V

    :cond_11
    const-class v0, Lcom/motorola/ccc/ota/ui/MessageActivity;

    invoke-virtual {v1, v6, v0}, Landroid/content/Intent;->setClass(Landroid/content/Context;Ljava/lang/Class;)Landroid/content/Intent;

    invoke-virtual/range {p1 .. p2}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    invoke-static {}, Lcom/motorola/ccc/ota/utils/NotificationUtils;->cancelOtaNotification()V

    goto/16 :goto_8

    :cond_12
    const-string v5, "com.motorola.blur.service.blur.Actions.MANUAL_CHECK_UPDATE"

    invoke-virtual {v5, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v15

    const-string v10, "com.motorola.ccc.ota.START_RESTART_ACTIVITY_INTENT"

    const-string v11, "com.motorola.blur.service.blur.Actions.UPGRADE_UPDATER_STATE_CLEAR"

    const-string v12, "com.motorola.ccc.ota.Actions.ACTIVITY_ANNOY_VALUE_EXPIRY"

    if-nez v15, :cond_3e

    invoke-virtual {v11, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v15

    if-eqz v15, :cond_13

    goto/16 :goto_7

    :cond_13
    const-string v5, "com.motorola.blur.service.blur.Actions.UPGRADE_UPDATE_STATUS"

    invoke-virtual {v5, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_19

    const-string v2, "Received Update Status"

    invoke-static {v4, v2}, Lcom/motorola/ccc/ota/utils/Logger;->debug(Ljava/lang/String;Ljava/lang/String;)V

    invoke-static/range {p1 .. p2}, Lcom/motorola/ccc/ota/utils/SystemUpdateStatusUtils;->storeOngoingSystemUpdateStatus(Landroid/content/Context;Landroid/content/Intent;)V

    invoke-static/range {p2 .. p2}, Lcom/motorola/ccc/ota/ui/UpdaterUtils;->showPostInstallScreen(Landroid/content/Intent;)Z

    move-result v2

    if-nez v2, :cond_14

    const-string v0, "showPostInstallScreen configured as false"

    invoke-static {v4, v0}, Lcom/motorola/ccc/ota/utils/Logger;->info(Ljava/lang/String;Ljava/lang/String;)V

    return-void

    :cond_14
    const-string v2, "com.motorola.blur.service.blur.upgrade.update_status"

    const/4 v5, 0x0

    invoke-virtual {v1, v2, v5}, Landroid/content/Intent;->getBooleanExtra(Ljava/lang/String;Z)Z

    move-result v2

    invoke-static {v2}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v2

    const-string v5, "com.motorola.ccc.ota.UPDATE_FAILURE_REASON"

    invoke-virtual {v1, v5}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    if-eqz v5, :cond_15

    const-string v8, "cleanupAppliedPayload"

    invoke-virtual {v5, v8}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v5

    if-eqz v5, :cond_15

    const-string v5, "MergeStatusFailure"

    invoke-virtual {v1, v5, v3}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Z)Landroid/content/Intent;

    :cond_15
    invoke-static {}, Lcom/motorola/ccc/ota/utils/BuildPropReader;->isATT()Z

    move-result v3

    if-eqz v3, :cond_16

    invoke-virtual {v2}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v3

    if-nez v3, :cond_16

    sget-object v3, Lcom/motorola/otalib/common/metaData/CheckForUpgradeTriggeredBy;->user:Lcom/motorola/otalib/common/metaData/CheckForUpgradeTriggeredBy;

    invoke-virtual {v3}, Lcom/motorola/otalib/common/metaData/CheckForUpgradeTriggeredBy;->toString()Ljava/lang/String;

    move-result-object v3

    iget-object v0, v0, Lcom/motorola/ccc/ota/ui/UpdateReceiver;->botaSettings:Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    sget-object v5, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->STATS_UPGRADE_SOURCE:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    invoke-virtual {v0, v5}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->getString(Lcom/motorola/otalib/common/settings/ISetting;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v3, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_16

    const-string v0, "Don\'t show notification for DI or NI request for Fota failure case"

    invoke-static {v4, v0}, Lcom/motorola/ccc/ota/utils/Logger;->debug(Ljava/lang/String;Ljava/lang/String;)V

    return-void

    :cond_16
    invoke-static {}, Lcom/motorola/ccc/ota/utils/NotificationUtils;->isUpdateNotificationChannelEnabled()Z

    move-result v0

    if-nez v0, :cond_18

    const-string v0, "User has disabled the OTA notification channel. Show full screen activity"

    invoke-static {v4, v0}, Lcom/motorola/ccc/ota/utils/Logger;->debug(Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v2}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    if-eqz v0, :cond_17

    const-class v0, Lcom/motorola/ccc/ota/ui/BaseActivity;

    invoke-virtual {v1, v6, v0}, Landroid/content/Intent;->setClass(Landroid/content/Context;Ljava/lang/Class;)Landroid/content/Intent;

    sget-object v0, Lcom/motorola/ccc/ota/utils/UpgradeUtilConstants$FragmentTypeEnum;->UPDATE_COMPLETE_FRAGMENT:Lcom/motorola/ccc/ota/utils/UpgradeUtilConstants$FragmentTypeEnum;

    invoke-virtual {v0}, Lcom/motorola/ccc/ota/utils/UpgradeUtilConstants$FragmentTypeEnum;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v1, v7, v0}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    invoke-virtual/range {p1 .. p2}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    goto/16 :goto_8

    :cond_17
    const-class v0, Lcom/motorola/ccc/ota/ui/BaseActivity;

    invoke-virtual {v1, v6, v0}, Landroid/content/Intent;->setClass(Landroid/content/Context;Ljava/lang/Class;)Landroid/content/Intent;

    sget-object v0, Lcom/motorola/ccc/ota/utils/UpgradeUtilConstants$FragmentTypeEnum;->UPDATE_FAILED_FRAGMENT:Lcom/motorola/ccc/ota/utils/UpgradeUtilConstants$FragmentTypeEnum;

    invoke-virtual {v0}, Lcom/motorola/ccc/ota/utils/UpgradeUtilConstants$FragmentTypeEnum;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v1, v7, v0}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    invoke-virtual/range {p1 .. p2}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    goto/16 :goto_8

    :cond_18
    invoke-static/range {p1 .. p2}, Lcom/motorola/ccc/ota/utils/NotificationUtils;->displayUpdateStatusNotification(Landroid/content/Context;Landroid/content/Intent;)V

    goto/16 :goto_8

    :cond_19
    const-string v5, "com.motorola.app.action.UPGRADE_UPDATE_STATUS"

    invoke-virtual {v5, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-nez v5, :cond_3d

    const-string v5, "com.motorola.blur.service.blur.Actions.UPGRADE_CHECK_FOR_UPDATE_RESPONSE"

    invoke-virtual {v5, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_1a

    goto/16 :goto_6

    :cond_1a
    const-string v5, "com.motorola.blur.service.blur.Actions.START_DOWNLOAD_PROGRESS_FRAGMENT"

    invoke-virtual {v5, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_1b

    const-class v0, Lcom/motorola/ccc/ota/ui/BaseActivity;

    invoke-virtual {v1, v6, v0}, Landroid/content/Intent;->setClass(Landroid/content/Context;Ljava/lang/Class;)Landroid/content/Intent;

    sget-object v0, Lcom/motorola/ccc/ota/utils/UpgradeUtilConstants$FragmentTypeEnum;->DOWNLOAD_PROGRESS_FRAGMENT:Lcom/motorola/ccc/ota/utils/UpgradeUtilConstants$FragmentTypeEnum;

    invoke-virtual {v0}, Lcom/motorola/ccc/ota/utils/UpgradeUtilConstants$FragmentTypeEnum;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v1, v7, v0}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    invoke-virtual/range {p1 .. p2}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    goto/16 :goto_8

    :cond_1b
    const-string v5, "com.motorola.blur.service.blur.Actions.START_BACKGROUND_INSTALLATION_FRAGMENT"

    invoke-virtual {v5, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_1c

    const-class v0, Lcom/motorola/ccc/ota/ui/BaseActivity;

    invoke-virtual {v1, v6, v0}, Landroid/content/Intent;->setClass(Landroid/content/Context;Ljava/lang/Class;)Landroid/content/Intent;

    sget-object v0, Lcom/motorola/ccc/ota/utils/UpgradeUtilConstants$FragmentTypeEnum;->BACKGROUND_INSTALLATION_FRAGMENT:Lcom/motorola/ccc/ota/utils/UpgradeUtilConstants$FragmentTypeEnum;

    invoke-virtual {v0}, Lcom/motorola/ccc/ota/utils/UpgradeUtilConstants$FragmentTypeEnum;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v1, v7, v0}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    invoke-virtual/range {p1 .. p2}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    goto/16 :goto_8

    :cond_1c
    const-string v5, "com.motorola.blur.service.blur.Actions.UPGRADE_UPDATER_UPDATE_NOTIFICATION_CLEAR"

    invoke-virtual {v5, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_1d

    const-string v1, "Received PDL screen cancel intent"

    invoke-static {v4, v1}, Lcom/motorola/ccc/ota/utils/Logger;->debug(Ljava/lang/String;Ljava/lang/String;)V

    invoke-static/range {p1 .. p1}, Lcom/motorola/ccc/ota/utils/NotificationUtils;->stopNotificationService(Landroid/content/Context;)V

    invoke-static/range {p1 .. p1}, Lcom/motorola/ccc/ota/ui/UpdaterUtils;->stopDownloadActivity(Landroid/content/Context;)V

    new-instance v1, Landroid/content/Intent;

    const-class v2, Lcom/motorola/ccc/ota/ui/NotificationService;

    invoke-direct {v1, v6, v2}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    sget-object v2, Lcom/motorola/ccc/ota/ui/UpdateReceiver$PendingIntentType;->SERVICE:Lcom/motorola/ccc/ota/ui/UpdateReceiver$PendingIntentType;

    invoke-direct {v0, v6, v1, v2}, Lcom/motorola/ccc/ota/ui/UpdateReceiver;->cancelAnyPendingIntentSetPreviously(Landroid/content/Context;Landroid/content/Intent;Lcom/motorola/ccc/ota/ui/UpdateReceiver$PendingIntentType;)V

    new-instance v1, Landroid/content/Intent;

    invoke-direct {v1, v12}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    sget-object v2, Lcom/motorola/ccc/ota/ui/UpdateReceiver$PendingIntentType;->BROADCAST:Lcom/motorola/ccc/ota/ui/UpdateReceiver$PendingIntentType;

    invoke-direct {v0, v6, v1, v2}, Lcom/motorola/ccc/ota/ui/UpdateReceiver;->cancelAnyPendingIntentSetPreviously(Landroid/content/Context;Landroid/content/Intent;Lcom/motorola/ccc/ota/ui/UpdateReceiver$PendingIntentType;)V

    iget-object v0, v0, Lcom/motorola/ccc/ota/ui/UpdateReceiver;->botaSettings:Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    invoke-static {v0}, Lcom/motorola/ccc/ota/utils/NotificationUtils;->clearNextPromptDetails(Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;)V

    goto/16 :goto_8

    :cond_1d
    const-string v5, "com.motorola.blur.service.blur.Actions.UPGRADE_UPDATER_DOWNLOAD_NOTIFICATION_CLEAR"

    invoke-virtual {v5, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_1e

    const-string v1, "Received Download notification cancel intent"

    invoke-static {v4, v1}, Lcom/motorola/ccc/ota/utils/Logger;->debug(Ljava/lang/String;Ljava/lang/String;)V

    invoke-static/range {p1 .. p1}, Lcom/motorola/ccc/ota/ui/UpdaterUtils;->stopDownloadProgressActivity(Landroid/content/Context;)V

    invoke-static {}, Lcom/motorola/ccc/ota/utils/NotificationUtils;->cancelOtaNotification()V

    invoke-static/range {p1 .. p1}, Lcom/motorola/ccc/ota/ui/UpdaterUtils;->stopMessageActivity(Landroid/content/Context;)V

    iget-object v0, v0, Lcom/motorola/ccc/ota/ui/UpdateReceiver;->botaSettings:Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    invoke-static {v0}, Lcom/motorola/ccc/ota/utils/NotificationUtils;->clearNextPromptDetails(Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;)V

    goto/16 :goto_8

    :cond_1e
    const-string v5, "com.motorola.blur.service.blur.Actions.UPGRADE_UPDATER_INSTALL_NOTIFICATION_CLEAR"

    invoke-virtual {v5, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_1f

    const-string v1, "Received Install screen cancel intent"

    invoke-static {v4, v1}, Lcom/motorola/ccc/ota/utils/Logger;->debug(Ljava/lang/String;Ljava/lang/String;)V

    invoke-static/range {p1 .. p1}, Lcom/motorola/ccc/ota/utils/NotificationUtils;->stopNotificationService(Landroid/content/Context;)V

    invoke-static/range {p1 .. p1}, Lcom/motorola/ccc/ota/ui/UpdaterUtils;->stopInstallActivity(Landroid/content/Context;)V

    new-instance v1, Landroid/content/Intent;

    const-class v2, Lcom/motorola/ccc/ota/ui/NotificationService;

    invoke-direct {v1, v6, v2}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    sget-object v2, Lcom/motorola/ccc/ota/ui/UpdateReceiver$PendingIntentType;->SERVICE:Lcom/motorola/ccc/ota/ui/UpdateReceiver$PendingIntentType;

    invoke-direct {v0, v6, v1, v2}, Lcom/motorola/ccc/ota/ui/UpdateReceiver;->cancelAnyPendingIntentSetPreviously(Landroid/content/Context;Landroid/content/Intent;Lcom/motorola/ccc/ota/ui/UpdateReceiver$PendingIntentType;)V

    new-instance v1, Landroid/content/Intent;

    invoke-direct {v1, v12}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    sget-object v2, Lcom/motorola/ccc/ota/ui/UpdateReceiver$PendingIntentType;->BROADCAST:Lcom/motorola/ccc/ota/ui/UpdateReceiver$PendingIntentType;

    invoke-direct {v0, v6, v1, v2}, Lcom/motorola/ccc/ota/ui/UpdateReceiver;->cancelAnyPendingIntentSetPreviously(Landroid/content/Context;Landroid/content/Intent;Lcom/motorola/ccc/ota/ui/UpdateReceiver$PendingIntentType;)V

    iget-object v0, v0, Lcom/motorola/ccc/ota/ui/UpdateReceiver;->botaSettings:Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    invoke-static {v0}, Lcom/motorola/ccc/ota/utils/NotificationUtils;->clearNextPromptDetails(Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;)V

    invoke-static/range {p1 .. p1}, Lcom/motorola/ccc/ota/ui/UpdaterUtils;->stopMessageActivity(Landroid/content/Context;)V

    goto/16 :goto_8

    :cond_1f
    const-string v5, "com.motorola.blur.service.blur.Actions.UPGRADE_UPDATER_BG_INSTALL_NOTIFICATION_CLEAR"

    invoke-virtual {v5, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_21

    const-string v1, "Received BGInstall screen cancel intent"

    invoke-static {v4, v1}, Lcom/motorola/ccc/ota/utils/Logger;->debug(Ljava/lang/String;Ljava/lang/String;)V

    iget-object v0, v0, Lcom/motorola/ccc/ota/ui/UpdateReceiver;->botaSettings:Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    sget-object v1, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->FLAG_IS_VITAL_UPDATE:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    invoke-virtual {v0, v1}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->getBoolean(Lcom/motorola/otalib/common/settings/ISetting;)Z

    move-result v0

    if-nez v0, :cond_20

    invoke-static/range {p1 .. p1}, Lcom/motorola/ccc/ota/ui/UpdaterUtils;->stopBGInstallActivity(Landroid/content/Context;)V

    :cond_20
    invoke-static {}, Lcom/motorola/ccc/ota/utils/NotificationUtils;->cancelOtaNotification()V

    invoke-static/range {p1 .. p1}, Lcom/motorola/ccc/ota/ui/UpdaterUtils;->stopMessageActivity(Landroid/content/Context;)V

    goto/16 :goto_8

    :cond_21
    const-string v5, "com.motorola.blur.service.blur.Actions.UPGRADE_UPDATER_RESTART_NOTIFICATION_CLEAR"

    invoke-virtual {v5, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_22

    const-string v1, "Received Restart screen cancel intent"

    invoke-static {v4, v1}, Lcom/motorola/ccc/ota/utils/Logger;->debug(Ljava/lang/String;Ljava/lang/String;)V

    invoke-static {}, Lcom/motorola/ccc/ota/utils/NotificationUtils;->cancelOtaNotification()V

    invoke-static/range {p1 .. p1}, Lcom/motorola/ccc/ota/ui/UpdaterUtils;->stopMessageActivity(Landroid/content/Context;)V

    invoke-static/range {p1 .. p1}, Lcom/motorola/ccc/ota/ui/UpdaterUtils;->stopRestartActivity(Landroid/content/Context;)V

    new-instance v1, Landroid/content/Intent;

    invoke-direct {v1, v12}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    sget-object v2, Lcom/motorola/ccc/ota/ui/UpdateReceiver$PendingIntentType;->BROADCAST:Lcom/motorola/ccc/ota/ui/UpdateReceiver$PendingIntentType;

    invoke-direct {v0, v6, v1, v2}, Lcom/motorola/ccc/ota/ui/UpdateReceiver;->cancelAnyPendingIntentSetPreviously(Landroid/content/Context;Landroid/content/Intent;Lcom/motorola/ccc/ota/ui/UpdateReceiver$PendingIntentType;)V

    goto/16 :goto_8

    :cond_22
    const-string v5, "com.motorola.ccc.ota.Actions.USER_CANCEL_DOWNLOAD"

    invoke-virtual {v5, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_23

    const-string v1, "Received user cancelled download notification cancel intent"

    invoke-static {v4, v1}, Lcom/motorola/ccc/ota/utils/Logger;->debug(Ljava/lang/String;Ljava/lang/String;)V

    sget-object v1, Lcom/motorola/otalib/common/utils/UpgradeUtils$DownloadStatus;->STATUS_DOWNLOAD_CANCEL_NOTIFICATION:Lcom/motorola/otalib/common/utils/UpgradeUtils$DownloadStatus;

    invoke-direct {v0, v6, v1}, Lcom/motorola/ccc/ota/ui/UpdateReceiver;->showCancelPopupIntent(Landroid/content/Context;Lcom/motorola/otalib/common/utils/UpgradeUtils$DownloadStatus;)V

    invoke-direct/range {p0 .. p1}, Lcom/motorola/ccc/ota/ui/UpdateReceiver;->closeSystemDialogs(Landroid/content/Context;)V

    goto/16 :goto_8

    :cond_23
    const-string v5, "com.motorola.ccc.ota.Actions.USER_CANCEL_BACKGROUND_INSTALL"

    invoke-virtual {v5, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_24

    const-string v1, "Received user cancelled streaming update notification intent"

    invoke-static {v4, v1}, Lcom/motorola/ccc/ota/utils/Logger;->debug(Ljava/lang/String;Ljava/lang/String;)V

    sget-object v1, Lcom/motorola/otalib/common/utils/UpgradeUtils$DownloadStatus;->STATUS_INSTALL_CANCEL_NOTIFICATION:Lcom/motorola/otalib/common/utils/UpgradeUtils$DownloadStatus;

    invoke-direct {v0, v6, v1}, Lcom/motorola/ccc/ota/ui/UpdateReceiver;->showCancelPopupIntent(Landroid/content/Context;Lcom/motorola/otalib/common/utils/UpgradeUtils$DownloadStatus;)V

    invoke-direct/range {p0 .. p1}, Lcom/motorola/ccc/ota/ui/UpdateReceiver;->closeSystemDialogs(Landroid/content/Context;)V

    goto/16 :goto_8

    :cond_24
    const-string v5, "com.motorola.ccc.ota.Actions.USER_RESUME_DOWNLOAD_ON_CELLULAR"

    invoke-virtual {v5, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    const v11, 0x7f0e0026

    if-eqz v5, :cond_25

    const-string v1, "User resumed download on cellular"

    invoke-static {v4, v1}, Lcom/motorola/ccc/ota/utils/Logger;->debug(Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual/range {p1 .. p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    invoke-virtual {v1, v11}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v1

    invoke-static {v6, v1, v3}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v1

    invoke-virtual {v1}, Landroid/widget/Toast;->show()V

    sget-object v1, Lcom/motorola/otalib/common/utils/UpgradeUtils$DownloadStatus;->STATUS_RESUME_ON_CELLULAR:Lcom/motorola/otalib/common/utils/UpgradeUtils$DownloadStatus;

    invoke-static {v6, v1}, Lcom/motorola/ccc/ota/utils/UpgradeUtilMethods;->sendDownloadNotificationResponse(Landroid/content/Context;Lcom/motorola/otalib/common/utils/UpgradeUtils$DownloadStatus;)V

    invoke-direct/range {p0 .. p1}, Lcom/motorola/ccc/ota/ui/UpdateReceiver;->closeSystemDialogs(Landroid/content/Context;)V

    invoke-static/range {p1 .. p1}, Lcom/motorola/ccc/ota/utils/CusUtilMethods;->showPopupToOptCellularDataAtt(Landroid/content/Context;)V

    goto/16 :goto_8

    :cond_25
    const-string v5, "com.motorola.ccc.ota.Actions.USER_RESUME_STREAMING_DOWNLOAD_ON_CELLULAR"

    invoke-virtual {v5, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_26

    const-string v1, "User resumed streaming download on cellular"

    invoke-static {v4, v1}, Lcom/motorola/ccc/ota/utils/Logger;->debug(Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual/range {p1 .. p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    invoke-virtual {v1, v11}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v1

    invoke-static {v6, v1, v3}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v1

    invoke-virtual {v1}, Landroid/widget/Toast;->show()V

    sget-object v1, Lcom/motorola/otalib/common/utils/UpgradeUtils$DownloadStatus;->STATUS_RESUME_ON_CELLULAR:Lcom/motorola/otalib/common/utils/UpgradeUtils$DownloadStatus;

    invoke-static {v6, v1}, Lcom/motorola/ccc/ota/utils/UpgradeUtilMethods;->sendUserResponseDuringBackgroundInstallation(Landroid/content/Context;Lcom/motorola/otalib/common/utils/UpgradeUtils$DownloadStatus;)V

    invoke-direct/range {p0 .. p1}, Lcom/motorola/ccc/ota/ui/UpdateReceiver;->closeSystemDialogs(Landroid/content/Context;)V

    invoke-static/range {p1 .. p1}, Lcom/motorola/ccc/ota/utils/CusUtilMethods;->showPopupToOptCellularDataAtt(Landroid/content/Context;)V

    goto/16 :goto_8

    :cond_26
    const-string v5, "com.motorola.ccc.ota.UPGRADE_UPDATE_NOTIFICATION_AVAILABLE"

    invoke-virtual {v5, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_28

    invoke-static/range {p2 .. p2}, Lcom/motorola/ccc/ota/ui/UpdaterUtils;->getUpgradeInfoDuringOTAUpdate(Landroid/content/Intent;)Lcom/motorola/ccc/ota/ui/UpdaterUtils$UpgradeInfo;

    move-result-object v1

    if-nez v1, :cond_27

    invoke-static {v4, v13}, Lcom/motorola/ccc/ota/utils/Logger;->debug(Ljava/lang/String;Ljava/lang/String;)V

    return-void

    :cond_27
    invoke-virtual {v1}, Lcom/motorola/ccc/ota/ui/UpdaterUtils$UpgradeInfo;->getUpdateTypeData()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Lcom/motorola/ccc/ota/ui/updateType/UpdateType;->getUpdateType(Ljava/lang/String;)Lcom/motorola/ccc/ota/ui/updateType/UpdateType$UpdateTypeInterface;

    move-result-object v1

    invoke-interface {v1}, Lcom/motorola/ccc/ota/ui/updateType/UpdateType$UpdateTypeInterface;->getPDLNotificationTitle()Ljava/lang/String;

    move-result-object v2

    iput-object v2, v0, Lcom/motorola/ccc/ota/ui/UpdateReceiver;->mNotificationTitle:Ljava/lang/String;

    invoke-interface {v1}, Lcom/motorola/ccc/ota/ui/updateType/UpdateType$UpdateTypeInterface;->getSystemUpdateAvailableNotificationText()Ljava/lang/String;

    move-result-object v1

    iput-object v1, v0, Lcom/motorola/ccc/ota/ui/UpdateReceiver;->mNotificationTxt:Ljava/lang/String;

    iget-object v2, v0, Lcom/motorola/ccc/ota/ui/UpdateReceiver;->mNotificationTitle:Ljava/lang/String;

    iget-object v0, v0, Lcom/motorola/ccc/ota/ui/UpdateReceiver;->botaSettings:Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    sget-object v3, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->METADATA:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    invoke-virtual {v0, v3}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->getString(Lcom/motorola/otalib/common/settings/ISetting;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v6, v2, v1, v0}, Lcom/motorola/ccc/ota/utils/NotificationUtils;->fillSystemUpdateNotificationDetails(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    move-result-object v0

    invoke-static {v6, v0}, Lcom/motorola/ccc/ota/utils/NotificationUtils;->startNotificationService(Landroid/content/Context;Landroid/content/Intent;)V

    return-void

    :cond_28
    const-string v5, "com.motorola.ccc.ota.UPGRADE_INSTALL_NOTIFICATION_AVAILABLE"

    invoke-virtual {v5, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    const-string v11, "com.motorola.blur.service.blur.upgrade.version"

    if-eqz v5, :cond_2c

    iget-object v2, v0, Lcom/motorola/ccc/ota/ui/UpdateReceiver;->botaSettings:Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    sget-object v5, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->DOWNLOAD_COMPLETED:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    invoke-virtual {v2, v5, v3}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->setBoolean(Lcom/motorola/otalib/common/settings/ISetting;Z)V

    invoke-static/range {p1 .. p1}, Lcom/motorola/ccc/ota/ui/UpdaterUtils;->stopDownloadProgressActivity(Landroid/content/Context;)V

    invoke-static/range {p2 .. p2}, Lcom/motorola/ccc/ota/ui/UpdaterUtils;->getUpgradeInfoDuringOTAUpdate(Landroid/content/Intent;)Lcom/motorola/ccc/ota/ui/UpdaterUtils$UpgradeInfo;

    move-result-object v2

    invoke-virtual {v1, v11}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    if-nez v2, :cond_29

    invoke-static {v4, v13}, Lcom/motorola/ccc/ota/utils/Logger;->debug(Ljava/lang/String;Ljava/lang/String;)V

    return-void

    :cond_29
    invoke-direct {v0, v2, v6, v1, v14}, Lcom/motorola/ccc/ota/ui/UpdateReceiver;->shouldIForceTheInstallation(Lcom/motorola/ccc/ota/ui/UpdaterUtils$UpgradeInfo;Landroid/content/Context;Landroid/content/Intent;Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_2a

    return-void

    :cond_2a
    invoke-static {v2}, Lcom/motorola/ccc/ota/ui/UpdaterUtils;->isCriticalUpdateTimerExpired(Lcom/motorola/ccc/ota/ui/UpdaterUtils$UpgradeInfo;)Z

    move-result v1

    if-eqz v1, :cond_2b

    invoke-static/range {p1 .. p1}, Lcom/motorola/ccc/ota/utils/CusUtilMethods;->isItFirstNetOnFota(Landroid/content/Context;)Z

    move-result v1

    if-eqz v1, :cond_2b

    iget-object v1, v0, Lcom/motorola/ccc/ota/ui/UpdateReceiver;->botaSettings:Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    sget-object v4, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->IS_UPDATE_PENDING_ON_REBOOT:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    invoke-virtual {v1, v4, v3}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->setBoolean(Lcom/motorola/otalib/common/settings/ISetting;Z)V

    invoke-static {v3}, Lcom/motorola/ccc/ota/ui/UpdaterUtils;->notifyRecoveryAboutPendingUpdate(Z)V

    invoke-direct {v0, v2, v6, v5}, Lcom/motorola/ccc/ota/ui/UpdateReceiver;->showFirstNetPendingRebootNotification(Lcom/motorola/ccc/ota/ui/UpdaterUtils$UpgradeInfo;Landroid/content/Context;Ljava/lang/String;)V

    goto :goto_3

    :cond_2b
    invoke-virtual {v2}, Lcom/motorola/ccc/ota/ui/UpdaterUtils$UpgradeInfo;->getUpdateTypeData()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Lcom/motorola/ccc/ota/ui/updateType/UpdateType;->getUpdateType(Ljava/lang/String;)Lcom/motorola/ccc/ota/ui/updateType/UpdateType$UpdateTypeInterface;

    move-result-object v4

    invoke-interface {v4}, Lcom/motorola/ccc/ota/ui/updateType/UpdateType$UpdateTypeInterface;->getInstallationTitle()Ljava/lang/String;

    move-result-object v4

    iput-object v4, v0, Lcom/motorola/ccc/ota/ui/UpdateReceiver;->mNotificationTitle:Ljava/lang/String;

    invoke-static {v1}, Lcom/motorola/ccc/ota/ui/updateType/UpdateType;->getUpdateType(Ljava/lang/String;)Lcom/motorola/ccc/ota/ui/updateType/UpdateType$UpdateTypeInterface;

    move-result-object v1

    invoke-static {v1, v2}, Lcom/motorola/ccc/ota/utils/NotificationUtils;->getInstallNotificationText(Lcom/motorola/ccc/ota/ui/updateType/UpdateType$UpdateTypeInterface;Lcom/motorola/ccc/ota/ui/UpdaterUtils$UpgradeInfo;)Ljava/lang/String;

    move-result-object v1

    iput-object v1, v0, Lcom/motorola/ccc/ota/ui/UpdateReceiver;->mNotificationTxt:Ljava/lang/String;

    sget-object v1, Ljava/util/concurrent/TimeUnit;->MILLISECONDS:Ljava/util/concurrent/TimeUnit;

    invoke-static {v14, v2}, Lcom/motorola/ccc/ota/ui/UpdaterUtils;->getNextPromptForNotification(Ljava/lang/String;Lcom/motorola/ccc/ota/ui/UpdaterUtils$UpgradeInfo;)J

    move-result-wide v7

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v9

    sub-long/2addr v7, v9

    invoke-virtual {v1, v7, v8}, Ljava/util/concurrent/TimeUnit;->toMinutes(J)J

    move-result-wide v1

    long-to-int v1, v1

    add-int/2addr v3, v1

    iget-object v1, v0, Lcom/motorola/ccc/ota/ui/UpdateReceiver;->mNotificationTitle:Ljava/lang/String;

    iget-object v2, v0, Lcom/motorola/ccc/ota/ui/UpdateReceiver;->mNotificationTxt:Ljava/lang/String;

    iget-object v0, v0, Lcom/motorola/ccc/ota/ui/UpdateReceiver;->botaSettings:Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    sget-object v4, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->METADATA:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    invoke-virtual {v0, v4}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->getString(Lcom/motorola/otalib/common/settings/ISetting;)Ljava/lang/String;

    move-result-object v7

    move-object/from16 v0, p1

    move-object v4, v5

    move-object v5, v7

    invoke-static/range {v0 .. v5}, Lcom/motorola/ccc/ota/utils/NotificationUtils;->fillInstallSystemUpdateNotificationDetails(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;ILjava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    move-result-object v0

    invoke-static {v6, v0}, Lcom/motorola/ccc/ota/utils/NotificationUtils;->startNotificationService(Landroid/content/Context;Landroid/content/Intent;)V

    :goto_3
    return-void

    :cond_2c
    const-string v5, "com.motorola.ccc.ota.Action.USER_DEFERERD_WIFI_SETUP"

    invoke-virtual {v5, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v13

    if-eqz v13, :cond_2d

    new-instance v1, Lcom/motorola/ccc/ota/ui/NotificationHandler;

    invoke-direct {v1, v6}, Lcom/motorola/ccc/ota/ui/NotificationHandler;-><init>(Landroid/content/Context;)V

    invoke-virtual {v1}, Lcom/motorola/ccc/ota/ui/NotificationHandler;->cancel()V

    invoke-static {}, Lcom/motorola/ccc/ota/ui/UpdaterUtils;->getDelay()I

    move-result v1

    new-instance v2, Ljava/lang/StringBuilder;

    const-string v7, "Received user deferred wifi setup,next notify is scheduled after "

    invoke-direct {v2, v7}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v7, " minutes"

    invoke-virtual {v2, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v4, v2}, Lcom/motorola/ccc/ota/utils/Logger;->info(Ljava/lang/String;Ljava/lang/String;)V

    iget-object v2, v0, Lcom/motorola/ccc/ota/ui/UpdateReceiver;->botaSettings:Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    sget-object v4, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->WIFI_SETTINGS_DEFFERED:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    invoke-virtual {v2, v4, v3}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->setBoolean(Lcom/motorola/otalib/common/settings/ISetting;Z)V

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v2

    int-to-long v7, v1

    const-wide/32 v9, 0xea60

    mul-long/2addr v7, v9

    add-long/2addr v2, v7

    const-string v1, "alarm"

    invoke-virtual {v6, v1}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/app/AlarmManager;

    iput-object v1, v0, Lcom/motorola/ccc/ota/ui/UpdateReceiver;->mAlarmManager:Landroid/app/AlarmManager;

    new-instance v1, Landroid/content/Intent;

    const-string v4, "com.motorola.ccc.ota.RUN_STATE_MACHINE"

    invoke-direct {v1, v4}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    const-string v4, "whom"

    invoke-virtual {v1, v4, v5}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    const/high16 v4, 0x4000000

    const/4 v5, 0x0

    invoke-static {v6, v5, v1, v4}, Landroid/app/PendingIntent;->getBroadcast(Landroid/content/Context;ILandroid/content/Intent;I)Landroid/app/PendingIntent;

    move-result-object v1

    iput-object v1, v0, Lcom/motorola/ccc/ota/ui/UpdateReceiver;->mPendingIntent:Landroid/app/PendingIntent;

    iget-object v0, v0, Lcom/motorola/ccc/ota/ui/UpdateReceiver;->mAlarmManager:Landroid/app/AlarmManager;

    invoke-virtual {v0, v5, v2, v3, v1}, Landroid/app/AlarmManager;->set(IJLandroid/app/PendingIntent;)V

    return-void

    :cond_2d
    const-string v5, "com.motorola.ccc.ota.UPGRADE_RESTART_NOTIFICATION"

    invoke-virtual {v5, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    const-string v13, "Restart"

    if-eqz v5, :cond_30

    new-instance v2, Lcom/motorola/ccc/ota/ui/NotificationHandler;

    invoke-direct {v2, v6}, Lcom/motorola/ccc/ota/ui/NotificationHandler;-><init>(Landroid/content/Context;)V

    invoke-static {}, Lcom/motorola/ccc/ota/utils/NotificationUtils;->isUpdateNotificationChannelEnabled()Z

    move-result v4

    if-nez v4, :cond_2e

    invoke-virtual {v2}, Lcom/motorola/ccc/ota/ui/NotificationHandler;->cancel()V

    :cond_2e
    invoke-static/range {p2 .. p2}, Lcom/motorola/ccc/ota/ui/UpdaterUtils;->getUpgradeInfoDuringOTAUpdate(Landroid/content/Intent;)Lcom/motorola/ccc/ota/ui/UpdaterUtils$UpgradeInfo;

    move-result-object v2

    invoke-direct {v0, v2, v6, v1, v13}, Lcom/motorola/ccc/ota/ui/UpdateReceiver;->shouldIForceTheInstallation(Lcom/motorola/ccc/ota/ui/UpdaterUtils$UpgradeInfo;Landroid/content/Context;Landroid/content/Intent;Ljava/lang/String;)Z

    move-result v4

    if-eqz v4, :cond_2f

    invoke-static/range {p1 .. p1}, Lcom/motorola/ccc/ota/ui/UpdaterUtils;->stopBGInstallActivity(Landroid/content/Context;)V

    return-void

    :cond_2f
    invoke-virtual {v1, v11}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    sget-object v4, Ljava/util/concurrent/TimeUnit;->MILLISECONDS:Ljava/util/concurrent/TimeUnit;

    invoke-static {v13, v2}, Lcom/motorola/ccc/ota/ui/UpdaterUtils;->getNextPromptForNotification(Ljava/lang/String;Lcom/motorola/ccc/ota/ui/UpdaterUtils$UpgradeInfo;)J

    move-result-wide v7

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v9

    sub-long/2addr v7, v9

    invoke-virtual {v4, v7, v8}, Ljava/util/concurrent/TimeUnit;->toMinutes(J)J

    move-result-wide v4

    long-to-int v4, v4

    add-int/2addr v4, v3

    iget-object v0, v0, Lcom/motorola/ccc/ota/ui/UpdateReceiver;->botaSettings:Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    sget-object v3, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->METADATA:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    invoke-virtual {v0, v3}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->getString(Lcom/motorola/otalib/common/settings/ISetting;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v6, v1, v4, v0, v2}, Lcom/motorola/ccc/ota/utils/NotificationUtils;->fillRestartSystemNotificationDetails(Landroid/content/Context;Ljava/lang/String;ILjava/lang/String;Lcom/motorola/ccc/ota/ui/UpdaterUtils$UpgradeInfo;)Landroid/content/Intent;

    move-result-object v0

    invoke-static {v6, v0}, Lcom/motorola/ccc/ota/utils/NotificationUtils;->startNotificationService(Landroid/content/Context;Landroid/content/Intent;)V

    return-void

    :cond_30
    invoke-virtual {v10, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_33

    invoke-static/range {p2 .. p2}, Lcom/motorola/ccc/ota/ui/UpdaterUtils;->getUpgradeInfoDuringOTAUpdate(Landroid/content/Intent;)Lcom/motorola/ccc/ota/ui/UpdaterUtils$UpgradeInfo;

    move-result-object v2

    if-nez v2, :cond_31

    return-void

    :cond_31
    invoke-direct {v0, v2, v6, v1, v13}, Lcom/motorola/ccc/ota/ui/UpdateReceiver;->shouldIForceTheInstallation(Lcom/motorola/ccc/ota/ui/UpdaterUtils$UpgradeInfo;Landroid/content/Context;Landroid/content/Intent;Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_32

    invoke-static/range {p1 .. p1}, Lcom/motorola/ccc/ota/ui/UpdaterUtils;->stopBGInstallActivity(Landroid/content/Context;)V

    return-void

    :cond_32
    invoke-direct {v0, v6, v13, v1}, Lcom/motorola/ccc/ota/ui/UpdateReceiver;->doSanityCheckForFullScreen(Landroid/content/Context;Ljava/lang/String;Landroid/content/Intent;)Z

    move-result v0

    if-eqz v0, :cond_41

    invoke-static {}, Lcom/motorola/ccc/ota/utils/NotificationUtils;->cancelOtaNotification()V

    const-class v0, Lcom/motorola/ccc/ota/ui/BaseActivity;

    invoke-virtual {v1, v6, v0}, Landroid/content/Intent;->setClass(Landroid/content/Context;Ljava/lang/Class;)Landroid/content/Intent;

    sget-object v0, Lcom/motorola/ccc/ota/utils/UpgradeUtilConstants$FragmentTypeEnum;->RESTART_FRAGMENT:Lcom/motorola/ccc/ota/utils/UpgradeUtilConstants$FragmentTypeEnum;

    invoke-virtual {v0}, Lcom/motorola/ccc/ota/utils/UpgradeUtilConstants$FragmentTypeEnum;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v1, v7, v0}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    invoke-virtual/range {p1 .. p2}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    goto/16 :goto_8

    :cond_33
    const-string v5, "com.motorola.ccc.ota.START_MERGE_RESTART_ACTIVITY_INTENT"

    invoke-virtual {v5, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_34

    invoke-direct/range {p0 .. p2}, Lcom/motorola/ccc/ota/ui/UpdateReceiver;->doSanityCheckForMergeRestartFullScreen(Landroid/content/Context;Landroid/content/Intent;)Z

    move-result v0

    if-eqz v0, :cond_41

    invoke-static {}, Lcom/motorola/ccc/ota/utils/NotificationUtils;->cancelOtaNotification()V

    const-class v0, Lcom/motorola/ccc/ota/ui/BaseActivity;

    invoke-virtual {v1, v6, v0}, Landroid/content/Intent;->setClass(Landroid/content/Context;Ljava/lang/Class;)Landroid/content/Intent;

    sget-object v0, Lcom/motorola/ccc/ota/utils/UpgradeUtilConstants$FragmentTypeEnum;->MERGE_RESTART_FRAGMENT:Lcom/motorola/ccc/ota/utils/UpgradeUtilConstants$FragmentTypeEnum;

    invoke-virtual {v0}, Lcom/motorola/ccc/ota/utils/UpgradeUtilConstants$FragmentTypeEnum;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v1, v7, v0}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    invoke-virtual/range {p1 .. p2}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    goto/16 :goto_8

    :cond_34
    const-string v5, "com.motorola.ccc.ota.ACTION_AB_UPDATE_PROGRESS"

    invoke-virtual {v5, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_3a

    iget-object v2, v0, Lcom/motorola/ccc/ota/ui/UpdateReceiver;->botaSettings:Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    sget-object v5, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->METADATA:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    invoke-virtual {v2, v5}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->getString(Lcom/motorola/otalib/common/settings/ISetting;)Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Lcom/motorola/otalib/common/metaData/builder/MetaDataBuilder;->from(Ljava/lang/String;)Lcom/motorola/otalib/common/metaData/MetaData;

    move-result-object v2

    if-nez v2, :cond_35

    const-string v0, "empty metadata, return"

    invoke-static {v4, v0}, Lcom/motorola/ccc/ota/utils/Logger;->debug(Ljava/lang/String;Ljava/lang/String;)V

    return-void

    :cond_35
    new-instance v5, Lcom/motorola/ccc/ota/ui/InstallNotification;

    invoke-direct {v5, v6}, Lcom/motorola/ccc/ota/ui/InstallNotification;-><init>(Landroid/content/Context;)V

    const-string v6, "com.motorola.ccc.ota.upgrade_status"

    const/4 v7, 0x0

    invoke-virtual {v1, v6, v7}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I

    move-result v10

    const-string v6, "com.motorola.ccc.ota.upgrade_percentage"

    const/4 v11, 0x0

    invoke-virtual {v1, v6, v11}, Landroid/content/Intent;->getFloatExtra(Ljava/lang/String;F)F

    move-result v6

    const-string v11, "com.motorola.blur.service.blur.upgrade.download.deferred"

    invoke-virtual {v1, v11, v7}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I

    move-result v11

    const-string v7, "com.motorola.app.installer"

    invoke-virtual {v1, v7}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-static {}, Lcom/motorola/ccc/ota/ui/UpdaterUtils;->showDownloadProgress()Z

    move-result v7

    if-nez v7, :cond_38

    invoke-virtual {v2}, Lcom/motorola/otalib/common/metaData/MetaData;->getForceDownloadTime()D

    move-result-wide v12

    const-wide/16 v14, 0x0

    cmpl-double v7, v12, v14

    if-ltz v7, :cond_36

    invoke-static {}, Lcom/motorola/ccc/ota/ui/UpdaterUtils;->checkForFinalDeferTimeForForceUpdate()Z

    move-result v4

    if-nez v4, :cond_38

    return-void

    :cond_36
    invoke-static {}, Lcom/motorola/ccc/ota/utils/BuildPropReader;->isBotaATT()Z

    move-result v7

    if-eqz v7, :cond_37

    const/4 v7, -0x1

    if-ne v11, v7, :cond_37

    invoke-static {v2, v9, v3}, Lcom/motorola/ccc/ota/utils/MetadataOverrider;->returnOverWrittenMetaData(Lcom/motorola/otalib/common/metaData/MetaData;Ljava/lang/String;Z)Lcom/motorola/otalib/common/metaData/MetaData;

    move-result-object v7

    :try_start_1
    invoke-static {v7}, Lcom/motorola/otalib/common/metaData/builder/MetaDataBuilder;->toJSONString(Lcom/motorola/otalib/common/metaData/MetaData;)Ljava/lang/String;

    move-result-object v7

    invoke-static {v7}, Lcom/motorola/ccc/ota/utils/UpgradeUtilMethods;->sendActionMetadataOverride(Ljava/lang/String;)V
    :try_end_1
    .catch Lorg/json/JSONException; {:try_start_1 .. :try_end_1} :catch_1

    goto :goto_4

    :catch_1
    invoke-static {v4, v8}, Lcom/motorola/ccc/ota/utils/Logger;->error(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_4

    :cond_37
    return-void

    :cond_38
    :goto_4
    invoke-virtual {v2}, Lcom/motorola/otalib/common/metaData/MetaData;->getForceDownloadTime()D

    move-result-wide v7

    const-wide/16 v12, 0x0

    cmpl-double v2, v7, v12

    if-ltz v2, :cond_39

    move/from16 v16, v3

    goto :goto_5

    :cond_39
    const/16 v16, 0x0

    :goto_5
    iget-object v0, v0, Lcom/motorola/ccc/ota/ui/UpdateReceiver;->botaSettings:Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    move v7, v10

    move v8, v11

    move-object v9, v1

    move/from16 v10, v16

    move-object v11, v0

    invoke-virtual/range {v5 .. v11}, Lcom/motorola/ccc/ota/ui/InstallNotification;->updateNotification(FIILjava/lang/String;ZLcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;)V

    goto/16 :goto_8

    :cond_3a
    invoke-virtual {v12, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_41

    const-string v2, "NOTIFICATION_TYPE"

    invoke-virtual {v1, v2}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    const-string v4, "ANNOY_EXPIRY_INTENT"

    invoke-virtual {v1, v4}, Landroid/content/Intent;->getParcelableExtra(Ljava/lang/String;)Landroid/os/Parcelable;

    move-result-object v4

    check-cast v4, Landroid/content/Intent;

    const/high16 v5, 0x30000000

    invoke-virtual {v4, v5}, Landroid/content/Intent;->setFlags(I)Landroid/content/Intent;

    const-string v5, "MergeRestart"

    invoke-virtual {v2, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_3b

    invoke-direct/range {p0 .. p2}, Lcom/motorola/ccc/ota/ui/UpdateReceiver;->doSanityCheckForMergeRestartFullScreen(Landroid/content/Context;Landroid/content/Intent;)Z

    move-result v5

    if-eqz v5, :cond_3b

    invoke-direct {v0, v6, v4, v2}, Lcom/motorola/ccc/ota/ui/UpdateReceiver;->getAnnoyExpiryTargetIntent(Landroid/content/Context;Landroid/content/Intent;Ljava/lang/String;)Landroid/content/Intent;

    move-result-object v0

    invoke-virtual {v6, v0}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    return-void

    :cond_3b
    invoke-static {v4}, Lcom/motorola/ccc/ota/ui/UpdaterUtils;->getUpgradeInfoDuringOTAUpdate(Landroid/content/Intent;)Lcom/motorola/ccc/ota/ui/UpdaterUtils$UpgradeInfo;

    move-result-object v5

    invoke-direct {v0, v5, v6, v1, v2}, Lcom/motorola/ccc/ota/ui/UpdateReceiver;->shouldIForceTheInstallation(Lcom/motorola/ccc/ota/ui/UpdaterUtils$UpgradeInfo;Landroid/content/Context;Landroid/content/Intent;Ljava/lang/String;)Z

    move-result v7

    if-eqz v7, :cond_3c

    return-void

    :cond_3c
    const-string v7, "CheckForMap"

    invoke-virtual {v1, v7, v3}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Z)Landroid/content/Intent;

    iget-object v3, v0, Lcom/motorola/ccc/ota/ui/UpdateReceiver;->botaSettings:Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    sget-object v7, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->METADATA:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    invoke-virtual {v3, v7}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->getString(Lcom/motorola/otalib/common/settings/ISetting;)Ljava/lang/String;

    move-result-object v3

    const-string v7, "com.motorola.blur.service.blur.upgrade.metadata"

    invoke-virtual {v1, v7, v3}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    const-string v3, "com.motorola.blur.service.blur.upgrade.location_type"

    invoke-virtual {v5}, Lcom/motorola/ccc/ota/ui/UpdaterUtils$UpgradeInfo;->getLocationType()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v1, v3, v5}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    invoke-direct {v0, v6, v2, v1}, Lcom/motorola/ccc/ota/ui/UpdateReceiver;->doSanityCheckForFullScreen(Landroid/content/Context;Ljava/lang/String;Landroid/content/Intent;)Z

    move-result v1

    if-eqz v1, :cond_41

    invoke-direct {v0, v6, v4, v2}, Lcom/motorola/ccc/ota/ui/UpdateReceiver;->getAnnoyExpiryTargetIntent(Landroid/content/Context;Landroid/content/Intent;Ljava/lang/String;)Landroid/content/Intent;

    move-result-object v0

    invoke-virtual {v6, v0}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    goto/16 :goto_8

    :cond_3d
    :goto_6
    invoke-static/range {p1 .. p2}, Lcom/motorola/ccc/ota/utils/SystemUpdateStatusUtils;->storeOngoingSystemUpdateStatus(Landroid/content/Context;Landroid/content/Intent;)V

    goto/16 :goto_8

    :cond_3e
    :goto_7
    const-string v1, "Clearing updater state."

    invoke-static {v4, v1}, Lcom/motorola/ccc/ota/utils/Logger;->debug(Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v5, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_3f

    iget-object v1, v0, Lcom/motorola/ccc/ota/ui/UpdateReceiver;->botaSettings:Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    invoke-virtual {v1}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->removeDontBotherPreferences()V

    iget-object v1, v0, Lcom/motorola/ccc/ota/ui/UpdateReceiver;->botaSettings:Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    sget-object v3, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->DEVICE_REBOOTED:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    const/4 v4, 0x0

    invoke-virtual {v1, v3, v4}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->setBoolean(Lcom/motorola/otalib/common/settings/ISetting;Z)V

    invoke-static {}, Lcom/motorola/ccc/ota/ui/UpdaterUtils;->disablePowerDownReceiver()Z

    iget-object v1, v0, Lcom/motorola/ccc/ota/ui/UpdateReceiver;->botaSettings:Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    sget-object v3, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->WIFI_SETTINGS_DEFFERED:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    invoke-virtual {v1, v3, v4}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->setBoolean(Lcom/motorola/otalib/common/settings/ISetting;Z)V

    iget-object v1, v0, Lcom/motorola/ccc/ota/ui/UpdateReceiver;->botaSettings:Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    sget-object v3, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->SHOULD_BLOCK_FULL_SCREEN_DISPLAY:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    invoke-virtual {v1, v3}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->removeConfig(Lcom/motorola/otalib/common/settings/ISetting;)V

    iget-object v1, v0, Lcom/motorola/ccc/ota/ui/UpdateReceiver;->botaSettings:Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    invoke-static {v1}, Lcom/motorola/ccc/ota/utils/NotificationUtils;->clearNextPromptDetails(Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;)V

    :cond_3f
    invoke-virtual {v11, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_41

    invoke-static/range {p1 .. p1}, Lcom/motorola/ccc/ota/ui/UpdaterUtils;->stopDownloadProgressActivity(Landroid/content/Context;)V

    iget-object v1, v0, Lcom/motorola/ccc/ota/ui/UpdateReceiver;->botaSettings:Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    sget-object v2, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->FLAG_IS_VITAL_UPDATE:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    invoke-virtual {v1, v2}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->getBoolean(Lcom/motorola/otalib/common/settings/ISetting;)Z

    move-result v1

    if-nez v1, :cond_40

    invoke-static/range {p1 .. p1}, Lcom/motorola/ccc/ota/ui/UpdaterUtils;->stopBGInstallActivity(Landroid/content/Context;)V

    :cond_40
    invoke-static {}, Lcom/motorola/ccc/ota/utils/NotificationUtils;->cancelOtaNotification()V

    iget-object v1, v0, Lcom/motorola/ccc/ota/ui/UpdateReceiver;->botaSettings:Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    invoke-static {v1}, Lcom/motorola/ccc/ota/utils/NotificationUtils;->clearNextPromptDetails(Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;)V

    iget-object v1, v0, Lcom/motorola/ccc/ota/ui/UpdateReceiver;->botaSettings:Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    sget-object v2, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->AUTO_UPDATE_TIME_SELECTED:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    invoke-virtual {v1, v2}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->removeConfig(Lcom/motorola/otalib/common/settings/ISetting;)V

    iget-object v1, v0, Lcom/motorola/ccc/ota/ui/UpdateReceiver;->botaSettings:Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    sget-object v2, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->CHECKBOX_SELECTED:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    invoke-virtual {v1, v2}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->removeConfig(Lcom/motorola/otalib/common/settings/ISetting;)V

    new-instance v1, Landroid/content/Intent;

    const-class v2, Lcom/motorola/ccc/ota/ui/NotificationService;

    invoke-direct {v1, v6, v2}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    sget-object v2, Lcom/motorola/ccc/ota/ui/UpdateReceiver$PendingIntentType;->SERVICE:Lcom/motorola/ccc/ota/ui/UpdateReceiver$PendingIntentType;

    invoke-direct {v0, v6, v1, v2}, Lcom/motorola/ccc/ota/ui/UpdateReceiver;->cancelAnyPendingIntentSetPreviously(Landroid/content/Context;Landroid/content/Intent;Lcom/motorola/ccc/ota/ui/UpdateReceiver$PendingIntentType;)V

    new-instance v1, Landroid/content/Intent;

    invoke-direct {v1, v12}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    sget-object v2, Lcom/motorola/ccc/ota/ui/UpdateReceiver$PendingIntentType;->BROADCAST:Lcom/motorola/ccc/ota/ui/UpdateReceiver$PendingIntentType;

    invoke-direct {v0, v6, v1, v2}, Lcom/motorola/ccc/ota/ui/UpdateReceiver;->cancelAnyPendingIntentSetPreviously(Landroid/content/Context;Landroid/content/Intent;Lcom/motorola/ccc/ota/ui/UpdateReceiver$PendingIntentType;)V

    new-instance v1, Landroid/content/Intent;

    invoke-direct {v1, v10}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    const-class v2, Lcom/motorola/ccc/ota/ui/BaseActivity;

    invoke-virtual {v1, v6, v2}, Landroid/content/Intent;->setClass(Landroid/content/Context;Ljava/lang/Class;)Landroid/content/Intent;

    move-result-object v1

    sget-object v2, Lcom/motorola/ccc/ota/ui/UpdateReceiver$PendingIntentType;->ACTIVITY:Lcom/motorola/ccc/ota/ui/UpdateReceiver$PendingIntentType;

    invoke-direct {v0, v6, v1, v2}, Lcom/motorola/ccc/ota/ui/UpdateReceiver;->cancelAnyPendingIntentSetPreviously(Landroid/content/Context;Landroid/content/Intent;Lcom/motorola/ccc/ota/ui/UpdateReceiver$PendingIntentType;)V

    :cond_41
    :goto_8
    return-void
.end method
