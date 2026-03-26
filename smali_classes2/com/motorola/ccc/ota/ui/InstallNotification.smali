.class public Lcom/motorola/ccc/ota/ui/InstallNotification;
.super Ljava/lang/Object;
.source "InstallNotification.java"


# static fields
.field private static sNotificationSuspended:Z = false

.field private static sNotificationSwiped:Z = false

.field private static total:I = 0x64


# instance fields
.field private mContext:Landroid/content/Context;

.field private mMediumChannelId:Ljava/lang/String;

.field private mNotificationMgr:Landroid/app/NotificationManager;

.field private mPendingIntent:Landroid/app/PendingIntent;

.field public mSwipedReceiver:Landroid/content/BroadcastReceiver;


# direct methods
.method static bridge synthetic -$$Nest$fgetmContext(Lcom/motorola/ccc/ota/ui/InstallNotification;)Landroid/content/Context;
    .locals 0

    iget-object p0, p0, Lcom/motorola/ccc/ota/ui/InstallNotification;->mContext:Landroid/content/Context;

    return-object p0
.end method

.method static bridge synthetic -$$Nest$sfputsNotificationSuspended(Z)V
    .locals 0

    sput-boolean p0, Lcom/motorola/ccc/ota/ui/InstallNotification;->sNotificationSuspended:Z

    return-void
.end method

.method static bridge synthetic -$$Nest$sfputsNotificationSwiped(Z)V
    .locals 0

    sput-boolean p0, Lcom/motorola/ccc/ota/ui/InstallNotification;->sNotificationSwiped:Z

    return-void
.end method

.method static constructor <clinit>()V
    .locals 0

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;)V
    .locals 1

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance v0, Lcom/motorola/ccc/ota/ui/InstallNotification$1;

    invoke-direct {v0, p0}, Lcom/motorola/ccc/ota/ui/InstallNotification$1;-><init>(Lcom/motorola/ccc/ota/ui/InstallNotification;)V

    iput-object v0, p0, Lcom/motorola/ccc/ota/ui/InstallNotification;->mSwipedReceiver:Landroid/content/BroadcastReceiver;

    iput-object p1, p0, Lcom/motorola/ccc/ota/ui/InstallNotification;->mContext:Landroid/content/Context;

    invoke-static {}, Lcom/motorola/ccc/ota/ui/NotificationChannelCreator;->getMediumNotificationChannelId()Ljava/lang/String;

    move-result-object p1

    iput-object p1, p0, Lcom/motorola/ccc/ota/ui/InstallNotification;->mMediumChannelId:Ljava/lang/String;

    iget-object p1, p0, Lcom/motorola/ccc/ota/ui/InstallNotification;->mContext:Landroid/content/Context;

    const-string v0, "notification"

    invoke-virtual {p1, v0}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Landroid/app/NotificationManager;

    iput-object p1, p0, Lcom/motorola/ccc/ota/ui/InstallNotification;->mNotificationMgr:Landroid/app/NotificationManager;

    return-void
.end method

.method private addCellularButton(Landroidx/core/app/NotificationCompat$Builder;Landroid/content/res/Resources;)V
    .locals 5

    iget-object v0, p0, Lcom/motorola/ccc/ota/ui/InstallNotification;->mContext:Landroid/content/Context;

    const-string v1, "connectivity"

    invoke-virtual {v0, v1}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/net/ConnectivityManager;

    iget-object v0, p0, Lcom/motorola/ccc/ota/ui/InstallNotification;->mContext:Landroid/content/Context;

    invoke-static {v0}, Lcom/motorola/ccc/ota/ui/UpdaterUtils;->isWifiConnected(Landroid/content/Context;)Z

    move-result v0

    if-nez v0, :cond_0

    new-instance v0, Landroid/content/Intent;

    const-string v1, "com.motorola.ccc.ota.Actions.USER_RESUME_STREAMING_DOWNLOAD_ON_CELLULAR"

    invoke-direct {v0, v1}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    new-instance v1, Landroid/content/ComponentName;

    invoke-static {}, Lcom/motorola/ccc/ota/env/OtaApplication;->getGlobalContext()Landroid/content/Context;

    move-result-object v2

    const-class v3, Lcom/motorola/ccc/ota/ui/UpdateReceiver;

    invoke-direct {v1, v2, v3}, Landroid/content/ComponentName;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    invoke-virtual {v0, v1}, Landroid/content/Intent;->setComponent(Landroid/content/ComponentName;)Landroid/content/Intent;

    iget-object v1, p0, Lcom/motorola/ccc/ota/ui/InstallNotification;->mContext:Landroid/content/Context;

    const/high16 v2, 0x4000000

    const/4 v3, 0x0

    invoke-static {v1, v3, v0, v2}, Landroid/app/PendingIntent;->getBroadcast(Landroid/content/Context;ILandroid/content/Intent;I)Landroid/app/PendingIntent;

    move-result-object v0

    const v1, 0x7f0e0177

    invoke-virtual {p2, v1}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v1

    const v2, 0x7f060034

    invoke-static {v1, v2}, Lcom/motorola/ccc/ota/utils/NotificationUtils;->getActionBtnText(Ljava/lang/String;I)Landroid/text/Spannable;

    move-result-object v1

    const v4, 0x1080024

    invoke-virtual {p1, v4, v1, v0}, Landroidx/core/app/NotificationCompat$Builder;->addAction(ILjava/lang/CharSequence;Landroid/app/PendingIntent;)Landroidx/core/app/NotificationCompat$Builder;

    invoke-static {}, Lcom/motorola/ccc/ota/utils/BuildPropReader;->isBotaATT()Z

    move-result v0

    if-eqz v0, :cond_0

    new-instance v0, Landroid/content/Intent;

    const-string v1, "android.settings.WIFI_SETTINGS"

    invoke-direct {v0, v1}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    const/high16 v1, 0x20000000

    invoke-virtual {v0, v1}, Landroid/content/Intent;->setFlags(I)Landroid/content/Intent;

    iget-object p0, p0, Lcom/motorola/ccc/ota/ui/InstallNotification;->mContext:Landroid/content/Context;

    const/high16 v1, 0x14000000

    invoke-static {p0, v3, v0, v1}, Landroid/app/PendingIntent;->getActivity(Landroid/content/Context;ILandroid/content/Intent;I)Landroid/app/PendingIntent;

    move-result-object p0

    const v0, 0x7f0e00a1

    invoke-virtual {p2, v0}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object p2

    invoke-static {p2, v2}, Lcom/motorola/ccc/ota/utils/NotificationUtils;->getActionBtnText(Ljava/lang/String;I)Landroid/text/Spannable;

    move-result-object p2

    invoke-virtual {p1, v4, p2, p0}, Landroidx/core/app/NotificationCompat$Builder;->addAction(ILjava/lang/CharSequence;Landroid/app/PendingIntent;)Landroidx/core/app/NotificationCompat$Builder;

    :cond_0
    return-void
.end method


# virtual methods
.method public cancel()V
    .locals 1

    iget-object p0, p0, Lcom/motorola/ccc/ota/ui/InstallNotification;->mNotificationMgr:Landroid/app/NotificationManager;

    const/16 v0, 0x6c1

    invoke-virtual {p0, v0}, Landroid/app/NotificationManager;->cancel(I)V

    return-void
.end method

.method public updateNotification(FIILjava/lang/String;ZLcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;)V
    .locals 18

    move-object/from16 v0, p0

    move/from16 v7, p1

    move/from16 v1, p2

    move/from16 v2, p3

    move-object/from16 v3, p4

    move/from16 v4, p5

    move-object/from16 v5, p6

    sget-object v6, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->METADATA:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    invoke-virtual {v5, v6}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->getString(Lcom/motorola/otalib/common/settings/ISetting;)Ljava/lang/String;

    move-result-object v6

    invoke-static {v6}, Lcom/motorola/otalib/common/metaData/builder/MetaDataBuilder;->from(Ljava/lang/String;)Lcom/motorola/otalib/common/metaData/MetaData;

    move-result-object v8

    const-string v9, "OtaApp"

    if-nez v8, :cond_0

    const-string v0, "empty metadata, returning"

    invoke-static {v9, v0}, Lcom/motorola/ccc/ota/utils/Logger;->debug(Ljava/lang/String;Ljava/lang/String;)V

    return-void

    :cond_0
    invoke-static/range {p6 .. p6}, Lcom/motorola/ccc/ota/utils/SmartUpdateUtils;->isDownloadForcedForSmartUpdate(Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;)Z

    move-result v10

    const/4 v11, -0x1

    const/4 v12, 0x1

    const/4 v13, 0x6

    if-eqz v10, :cond_4

    if-eq v11, v2, :cond_1

    sget-boolean v10, Lcom/motorola/ccc/ota/ui/InstallNotification;->sNotificationSuspended:Z

    if-eqz v10, :cond_2

    :cond_1
    if-ne v1, v13, :cond_3

    :cond_2
    invoke-virtual/range {p0 .. p0}, Lcom/motorola/ccc/ota/ui/InstallNotification;->cancel()V

    return-void

    :cond_3
    sput-boolean v12, Lcom/motorola/ccc/ota/ui/InstallNotification;->sNotificationSuspended:Z

    :cond_4
    sget-boolean v10, Lcom/motorola/ccc/ota/ui/InstallNotification;->sNotificationSwiped:Z

    if-eqz v10, :cond_5

    invoke-static/range {p2 .. p3}, Lcom/motorola/ccc/ota/utils/NotificationUtils;->showSwipeAbleNotification(II)Z

    move-result v10

    if-eqz v10, :cond_5

    return-void

    :cond_5
    const/4 v10, 0x0

    sput-boolean v10, Lcom/motorola/ccc/ota/ui/InstallNotification;->sNotificationSwiped:Z

    iget-object v14, v0, Lcom/motorola/ccc/ota/ui/InstallNotification;->mContext:Landroid/content/Context;

    invoke-virtual {v14}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v14

    sget-object v15, Lcom/motorola/ccc/ota/installer/InstallTypeResolver$InstallerType;->STREAMING:Lcom/motorola/ccc/ota/installer/InstallTypeResolver$InstallerType;

    invoke-virtual {v15}, Lcom/motorola/ccc/ota/installer/InstallTypeResolver$InstallerType;->toString()Ljava/lang/String;

    move-result-object v15

    invoke-virtual {v15, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v15

    const-string v13, "<b>"

    if-eqz v15, :cond_9

    new-instance v15, Lcom/motorola/ccc/ota/ui/NotificationHandler;

    iget-object v11, v0, Lcom/motorola/ccc/ota/ui/InstallNotification;->mContext:Landroid/content/Context;

    invoke-direct {v15, v11}, Lcom/motorola/ccc/ota/ui/NotificationHandler;-><init>(Landroid/content/Context;)V

    sget-object v11, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->BATTERY_LOW:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    invoke-virtual {v5, v11}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->getBoolean(Lcom/motorola/otalib/common/settings/ISetting;)Z

    move-result v11

    if-nez v11, :cond_7

    invoke-static {}, Lcom/motorola/ccc/ota/ui/UpdaterUtils;->isWifiOnly()Z

    move-result v11

    if-eqz v11, :cond_7

    iget-object v11, v0, Lcom/motorola/ccc/ota/ui/InstallNotification;->mContext:Landroid/content/Context;

    invoke-static {v11}, Lcom/motorola/ccc/ota/ui/UpdaterUtils;->isWifiConnected(Landroid/content/Context;)Z

    move-result v11

    if-nez v11, :cond_7

    const/4 v11, 0x0

    cmpl-float v11, v7, v11

    if-gtz v11, :cond_7

    if-gtz v1, :cond_7

    sget-object v0, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->WIFI_SETTINGS_DEFFERED:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    invoke-virtual {v5, v0}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->getBoolean(Lcom/motorola/otalib/common/settings/ISetting;)Z

    move-result v0

    if-nez v0, :cond_6

    invoke-virtual {v15}, Lcom/motorola/ccc/ota/ui/NotificationHandler;->sendWiFiNotification()V

    goto :goto_0

    :cond_6
    const-string v0, "Install.updateNotification(): defer sending wifi settings notification"

    invoke-static {v9, v0}, Lcom/motorola/ccc/ota/utils/Logger;->debug(Ljava/lang/String;Ljava/lang/String;)V

    :goto_0
    return-void

    :cond_7
    sget-object v9, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->WIFI_SETTINGS_DEFFERED:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    invoke-virtual {v5, v9, v10}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->setBoolean(Lcom/motorola/otalib/common/settings/ISetting;Z)V

    if-eqz v2, :cond_9

    if-eqz v4, :cond_9

    invoke-static {}, Lcom/motorola/ccc/ota/ui/UpdaterUtils;->getAutomaticDownloadForCellular()Z

    move-result v9

    if-nez v9, :cond_9

    invoke-static {}, Lcom/motorola/ccc/ota/ui/UpdaterUtils;->checkForFinalDeferTimeForForceUpdate()Z

    move-result v9

    if-eqz v9, :cond_9

    sget-object v3, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->SHOULD_BLOCK_FULL_SCREEN_DISPLAY:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    invoke-virtual {v5, v3}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->getBoolean(Lcom/motorola/otalib/common/settings/ISetting;)Z

    move-result v3

    if-nez v3, :cond_8

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v4, v0, Lcom/motorola/ccc/ota/ui/InstallNotification;->mContext:Landroid/content/Context;

    invoke-static {v2, v12, v5, v4}, Lcom/motorola/ccc/ota/utils/NotificationUtils;->getErrorNotificationText(IZLcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;Landroid/content/Context;)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-static {}, Ljava/lang/System;->lineSeparator()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    iget-object v4, v0, Lcom/motorola/ccc/ota/ui/InstallNotification;->mContext:Landroid/content/Context;

    invoke-static {}, Lcom/motorola/ccc/ota/ui/UpdaterUtils;->getMaxForceDownloadDeferTime()J

    move-result-wide v8

    invoke-static {v4, v8, v9}, Lcom/motorola/ccc/ota/utils/DateFormatUtils;->getCalendarString(Landroid/content/Context;J)Ljava/lang/String;

    move-result-object v4

    filled-new-array {v4}, [Ljava/lang/Object;

    move-result-object v4

    const v8, 0x7f0e004e

    invoke-virtual {v14, v8, v4}, Landroid/content/res/Resources;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4, v13}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const v8, 0x7f0e0002

    invoke-virtual {v14, v8}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v4, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static/range {p6 .. p6}, Lcom/motorola/ccc/ota/ui/UpdaterUtils;->getProgressScreenDisplayNextPromptInMins(Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;)I

    move-result v5

    new-instance v8, Landroid/content/Intent;

    const-string v9, "com.motorola.ccc.ota.Actions.USER_RESUME_STREAMING_DOWNLOAD_ON_CELLULAR"

    invoke-direct {v8, v9}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    iget-object v9, v0, Lcom/motorola/ccc/ota/ui/InstallNotification;->mContext:Landroid/content/Context;

    invoke-static {v9, v6, v7, v1, v2}, Lcom/motorola/ccc/ota/ui/UpdaterUtils;->getPendingIntentForBGProgressScreen(Landroid/content/Context;Ljava/lang/String;FII)Landroid/content/Intent;

    move-result-object v9

    iget-object v1, v0, Lcom/motorola/ccc/ota/ui/InstallNotification;->mContext:Landroid/content/Context;

    invoke-static {v4, v10}, Landroid/text/Html;->fromHtml(Ljava/lang/String;I)Landroid/text/Spanned;

    move-result-object v2

    invoke-static {v2}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    move-object v4, v6

    move-object v6, v9

    move/from16 v7, p1

    invoke-static/range {v1 .. v8}, Lcom/motorola/ccc/ota/utils/NotificationUtils;->fillSystemUpdatePausedNotificationDetails(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;ILandroid/content/Intent;FLandroid/content/Intent;)Landroid/content/Intent;

    move-result-object v1

    iget-object v0, v0, Lcom/motorola/ccc/ota/ui/InstallNotification;->mContext:Landroid/content/Context;

    invoke-static {v0, v1}, Lcom/motorola/ccc/ota/utils/NotificationUtils;->startNotificationService(Landroid/content/Context;Landroid/content/Intent;)V

    :cond_8
    return-void

    :cond_9
    iget-object v9, v0, Lcom/motorola/ccc/ota/ui/InstallNotification;->mContext:Landroid/content/Context;

    invoke-static {v9}, Lcom/motorola/ccc/ota/utils/NotificationUtils;->stopNotificationService(Landroid/content/Context;)V

    sget-object v9, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->METADATA:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    invoke-virtual {v5, v9}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->getString(Lcom/motorola/otalib/common/settings/ISetting;)Ljava/lang/String;

    move-result-object v9

    invoke-static {v9}, Lcom/motorola/ccc/ota/ui/UpdaterUtils;->getUpdateType(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v9

    invoke-static {v9}, Lcom/motorola/ccc/ota/ui/updateType/UpdateType;->getUpdateType(Ljava/lang/String;)Lcom/motorola/ccc/ota/ui/updateType/UpdateType$UpdateTypeInterface;

    move-result-object v9

    new-instance v11, Landroidx/core/app/NotificationCompat$Builder;

    iget-object v15, v0, Lcom/motorola/ccc/ota/ui/InstallNotification;->mContext:Landroid/content/Context;

    iget-object v12, v0, Lcom/motorola/ccc/ota/ui/InstallNotification;->mMediumChannelId:Ljava/lang/String;

    invoke-direct {v11, v15, v12}, Landroidx/core/app/NotificationCompat$Builder;-><init>(Landroid/content/Context;Ljava/lang/String;)V

    new-instance v12, Ljava/lang/StringBuilder;

    invoke-direct {v12, v13}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const v15, 0x7f0e0003

    invoke-virtual {v14, v15}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v15

    invoke-virtual {v12, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    invoke-virtual {v12, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    invoke-virtual {v12}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v12

    invoke-static {v12, v10}, Landroid/text/Html;->fromHtml(Ljava/lang/String;I)Landroid/text/Spanned;

    move-result-object v12

    invoke-virtual {v11, v12}, Landroidx/core/app/NotificationCompat$Builder;->setContentTitle(Ljava/lang/CharSequence;)Landroidx/core/app/NotificationCompat$Builder;

    invoke-interface {v9}, Lcom/motorola/ccc/ota/ui/updateType/UpdateType$UpdateTypeInterface;->getUpdateSpecificColor()I

    move-result v9

    iget-object v12, v0, Lcom/motorola/ccc/ota/ui/InstallNotification;->mContext:Landroid/content/Context;

    invoke-virtual {v12}, Landroid/content/Context;->getTheme()Landroid/content/res/Resources$Theme;

    move-result-object v12

    invoke-virtual {v14, v9, v12}, Landroid/content/res/Resources;->getColor(ILandroid/content/res/Resources$Theme;)I

    move-result v9

    invoke-virtual {v11, v9}, Landroidx/core/app/NotificationCompat$Builder;->setColor(I)Landroidx/core/app/NotificationCompat$Builder;

    const v9, 0x7f0800f4

    invoke-virtual {v11, v9}, Landroidx/core/app/NotificationCompat$Builder;->setSmallIcon(I)Landroidx/core/app/NotificationCompat$Builder;

    const/4 v9, 0x1

    invoke-virtual {v11, v9}, Landroidx/core/app/NotificationCompat$Builder;->setLocalOnly(Z)Landroidx/core/app/NotificationCompat$Builder;

    move-object v12, v8

    const-wide/16 v8, 0x0

    invoke-virtual {v11, v8, v9}, Landroidx/core/app/NotificationCompat$Builder;->setWhen(J)Landroidx/core/app/NotificationCompat$Builder;

    const-string v8, "alarm"

    invoke-virtual {v11, v8}, Landroidx/core/app/NotificationCompat$Builder;->setCategory(Ljava/lang/String;)Landroidx/core/app/NotificationCompat$Builder;

    iget-object v8, v0, Lcom/motorola/ccc/ota/ui/InstallNotification;->mContext:Landroid/content/Context;

    invoke-static {v8, v6, v7, v1, v2}, Lcom/motorola/ccc/ota/ui/UpdaterUtils;->getPendingIntentForBGProgressScreen(Landroid/content/Context;Ljava/lang/String;FII)Landroid/content/Intent;

    move-result-object v6

    invoke-static {}, Ljava/text/NumberFormat;->getPercentInstance()Ljava/text/NumberFormat;

    move-result-object v8

    const/high16 v9, 0x42c80000    # 100.0f

    div-float v9, v7, v9

    move-object/from16 v16, v11

    float-to-double v10, v9

    invoke-virtual {v8, v10, v11}, Ljava/text/NumberFormat;->format(D)Ljava/lang/String;

    move-result-object v8

    move-object/from16 v9, v16

    packed-switch v1, :pswitch_data_0

    const/4 v8, 0x0

    goto :goto_2

    :pswitch_0
    const/4 v10, 0x0

    invoke-virtual {v9, v10, v10, v10}, Landroidx/core/app/NotificationCompat$Builder;->setProgress(IIZ)Landroidx/core/app/NotificationCompat$Builder;

    invoke-static/range {p2 .. p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v8

    const/4 v11, 0x6

    invoke-static {v11}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v15

    filled-new-array {v8, v15}, [Ljava/lang/Object;

    move-result-object v8

    const v11, 0x7f0e009f

    invoke-virtual {v14, v11, v8}, Landroid/content/res/Resources;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v8

    iget-object v11, v0, Lcom/motorola/ccc/ota/ui/InstallNotification;->mContext:Landroid/content/Context;

    iget-object v15, v0, Lcom/motorola/ccc/ota/ui/InstallNotification;->mSwipedReceiver:Landroid/content/BroadcastReceiver;

    invoke-static {v11, v15}, Lcom/motorola/ccc/ota/utils/NotificationUtils;->unRegisterSwipeableNotificationReceiver(Landroid/content/Context;Landroid/content/BroadcastReceiver;)V

    sput-boolean v10, Lcom/motorola/ccc/ota/ui/InstallNotification;->sNotificationSwiped:Z

    sput-boolean v10, Lcom/motorola/ccc/ota/ui/InstallNotification;->sNotificationSuspended:Z

    goto :goto_2

    :pswitch_1
    const/4 v10, 0x0

    invoke-static {}, Lcom/motorola/ccc/ota/utils/NotificationUtils;->isSwipeAbleBitmapSet()Z

    move-result v11

    if-eqz v11, :cond_a

    iget-object v11, v0, Lcom/motorola/ccc/ota/ui/InstallNotification;->mContext:Landroid/content/Context;

    invoke-virtual {v11}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v11

    const v15, 0x7f0e0051

    invoke-virtual {v11, v15}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v11

    move-object v10, v11

    goto :goto_1

    :cond_a
    sget v11, Lcom/motorola/ccc/ota/ui/InstallNotification;->total:I

    invoke-static/range {p1 .. p1}, Ljava/lang/Math;->round(F)I

    move-result v15

    invoke-virtual {v9, v11, v15, v10}, Landroidx/core/app/NotificationCompat$Builder;->setProgress(IIZ)Landroidx/core/app/NotificationCompat$Builder;

    invoke-static/range {p2 .. p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v10

    const/4 v11, 0x6

    invoke-static {v11}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v15

    filled-new-array {v10, v15}, [Ljava/lang/Object;

    move-result-object v10

    const v11, 0x7f0e0039

    invoke-virtual {v14, v11, v10}, Landroid/content/res/Resources;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v10

    const/4 v11, 0x4

    if-ne v1, v11, :cond_b

    const v10, 0x7f0e01ec

    invoke-virtual {v14, v10}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v10

    :cond_b
    const/4 v11, 0x5

    if-ne v1, v11, :cond_c

    const v10, 0x7f0e00fe

    invoke-virtual {v14, v10}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v10

    :cond_c
    :goto_1
    invoke-virtual {v9, v8}, Landroidx/core/app/NotificationCompat$Builder;->setSubText(Ljava/lang/CharSequence;)Landroidx/core/app/NotificationCompat$Builder;

    move-object v8, v10

    :goto_2
    invoke-static {}, Lcom/motorola/ccc/ota/ui/UpdaterUtils;->showCancelOption()Z

    move-result v10

    if-eqz v10, :cond_d

    const/4 v10, 0x6

    if-ge v1, v10, :cond_d

    new-instance v10, Landroid/content/Intent;

    const-string v15, "com.motorola.ccc.ota.Actions.USER_CANCEL_BACKGROUND_INSTALL"

    invoke-direct {v10, v15}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    new-instance v15, Landroid/content/ComponentName;

    invoke-static {}, Lcom/motorola/ccc/ota/env/OtaApplication;->getGlobalContext()Landroid/content/Context;

    move-result-object v11

    move-object/from16 v17, v6

    const-class v6, Lcom/motorola/ccc/ota/ui/UpdateReceiver;

    invoke-direct {v15, v11, v6}, Landroid/content/ComponentName;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    invoke-virtual {v10, v15}, Landroid/content/Intent;->setComponent(Landroid/content/ComponentName;)Landroid/content/Intent;

    iget-object v6, v0, Lcom/motorola/ccc/ota/ui/InstallNotification;->mContext:Landroid/content/Context;

    const/high16 v11, 0x4000000

    const/4 v15, 0x0

    invoke-static {v6, v15, v10, v11}, Landroid/app/PendingIntent;->getBroadcast(Landroid/content/Context;ILandroid/content/Intent;I)Landroid/app/PendingIntent;

    move-result-object v6

    const v10, 0x7f0e0067

    invoke-virtual {v14, v10}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v10

    const v11, 0x7f060034

    invoke-static {v10, v11}, Lcom/motorola/ccc/ota/utils/NotificationUtils;->getActionBtnText(Ljava/lang/String;I)Landroid/text/Spannable;

    move-result-object v10

    const v11, 0x1080038

    invoke-virtual {v9, v11, v10, v6}, Landroidx/core/app/NotificationCompat$Builder;->addAction(ILjava/lang/CharSequence;Landroid/app/PendingIntent;)Landroidx/core/app/NotificationCompat$Builder;

    goto :goto_3

    :cond_d
    move-object/from16 v17, v6

    :goto_3
    sget-object v6, Lcom/motorola/ccc/ota/installer/InstallTypeResolver$InstallerType;->STREAMING:Lcom/motorola/ccc/ota/installer/InstallTypeResolver$InstallerType;

    invoke-virtual {v6}, Lcom/motorola/ccc/ota/installer/InstallTypeResolver$InstallerType;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v6, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_12

    if-eqz v2, :cond_12

    invoke-static {}, Lcom/motorola/ccc/ota/ui/UpdaterUtils;->isWifiOnly()Z

    move-result v6

    invoke-static {v6}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v6

    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8, v13}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const v10, 0x7f0e0002

    invoke-virtual {v14, v10}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v10

    invoke-virtual {v8, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    const/4 v10, 0x0

    invoke-static {v8, v10}, Landroid/text/Html;->fromHtml(Ljava/lang/String;I)Landroid/text/Spanned;

    move-result-object v8

    invoke-virtual {v9, v8}, Landroidx/core/app/NotificationCompat$Builder;->setContentTitle(Ljava/lang/CharSequence;)Landroidx/core/app/NotificationCompat$Builder;

    sget-object v8, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->BATTERY_LOW:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    invoke-virtual {v5, v8}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->getBoolean(Lcom/motorola/otalib/common/settings/ISetting;)Z

    move-result v8

    if-nez v8, :cond_10

    invoke-virtual {v6}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v6

    if-eqz v6, :cond_e

    new-instance v6, Landroid/content/Intent;

    invoke-direct {v6}, Landroid/content/Intent;-><init>()V

    const-string v8, "android.settings.WIFI_SETTINGS"

    invoke-virtual {v6, v8}, Landroid/content/Intent;->setAction(Ljava/lang/String;)Landroid/content/Intent;

    const/high16 v8, 0x20000000

    invoke-virtual {v6, v8}, Landroid/content/Intent;->setFlags(I)Landroid/content/Intent;

    invoke-static {}, Lcom/motorola/ccc/ota/utils/BuildPropReader;->isBotaATT()Z

    move-result v8

    if-eqz v8, :cond_11

    invoke-static {}, Lcom/motorola/ccc/ota/ui/UpdaterUtils;->isWifiOnlyPkg()Z

    move-result v8

    if-nez v8, :cond_11

    invoke-static {}, Lcom/motorola/ccc/ota/ui/UpdaterUtils;->getAutomaticDownloadForCellular()Z

    move-result v8

    if-nez v8, :cond_11

    invoke-direct {v0, v9, v14}, Lcom/motorola/ccc/ota/ui/InstallNotification;->addCellularButton(Landroidx/core/app/NotificationCompat$Builder;Landroid/content/res/Resources;)V

    goto :goto_4

    :cond_e
    if-nez v4, :cond_f

    invoke-static/range {p6 .. p6}, Lcom/motorola/ccc/ota/utils/SmartUpdateUtils;->isDownloadForcedForSmartUpdate(Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;)Z

    move-result v6

    if-eqz v6, :cond_10

    :cond_f
    invoke-static {}, Lcom/motorola/ccc/ota/ui/UpdaterUtils;->getAutomaticDownloadForCellular()Z

    move-result v6

    if-nez v6, :cond_10

    invoke-direct {v0, v9, v14}, Lcom/motorola/ccc/ota/ui/InstallNotification;->addCellularButton(Landroidx/core/app/NotificationCompat$Builder;Landroid/content/res/Resources;)V

    :cond_10
    move-object/from16 v6, v17

    :cond_11
    :goto_4
    iget-object v8, v0, Lcom/motorola/ccc/ota/ui/InstallNotification;->mContext:Landroid/content/Context;

    invoke-static {v2, v4, v5, v8}, Lcom/motorola/ccc/ota/utils/NotificationUtils;->getErrorNotificationText(IZLcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;Landroid/content/Context;)Ljava/lang/String;

    move-result-object v8

    const v10, 0x7f0e0056

    invoke-virtual {v14, v10}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v10

    invoke-virtual {v8, v10}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v10

    if-eqz v10, :cond_13

    new-instance v10, Ljava/lang/StringBuilder;

    invoke-direct {v10}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v10, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    const-string v10, "\n"

    invoke-virtual {v8, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    iget-object v10, v0, Lcom/motorola/ccc/ota/ui/InstallNotification;->mContext:Landroid/content/Context;

    invoke-virtual {v12}, Lcom/motorola/otalib/common/metaData/MetaData;->getSize()J

    move-result-wide v11

    invoke-static {v10, v11, v12}, Landroid/text/format/Formatter;->formatFileSize(Landroid/content/Context;J)Ljava/lang/String;

    move-result-object v10

    filled-new-array {v10}, [Ljava/lang/Object;

    move-result-object v10

    const v11, 0x7f0e01cb

    invoke-virtual {v14, v11, v10}, Landroid/content/res/Resources;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v10

    invoke-virtual {v8, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    goto :goto_5

    :cond_12
    move-object/from16 v6, v17

    :cond_13
    :goto_5
    sget-object v10, Lcom/motorola/ccc/ota/installer/InstallTypeResolver$InstallerType;->AB:Lcom/motorola/ccc/ota/installer/InstallTypeResolver$InstallerType;

    invoke-virtual {v10}, Lcom/motorola/ccc/ota/installer/InstallTypeResolver$InstallerType;->toString()Ljava/lang/String;

    move-result-object v10

    invoke-virtual {v10, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v10

    if-eqz v10, :cond_14

    const/4 v10, -0x1

    if-ne v2, v10, :cond_14

    iget-object v8, v0, Lcom/motorola/ccc/ota/ui/InstallNotification;->mContext:Landroid/content/Context;

    invoke-static {v2, v4, v5, v8}, Lcom/motorola/ccc/ota/utils/NotificationUtils;->getErrorNotificationText(IZLcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;Landroid/content/Context;)Ljava/lang/String;

    move-result-object v8

    :cond_14
    const/4 v5, 0x1

    invoke-virtual {v9, v5}, Landroidx/core/app/NotificationCompat$Builder;->setLocalOnly(Z)Landroidx/core/app/NotificationCompat$Builder;

    new-instance v5, Landroidx/core/app/NotificationCompat$BigTextStyle;

    invoke-direct {v5}, Landroidx/core/app/NotificationCompat$BigTextStyle;-><init>()V

    invoke-virtual {v5, v8}, Landroidx/core/app/NotificationCompat$BigTextStyle;->bigText(Ljava/lang/CharSequence;)Landroidx/core/app/NotificationCompat$BigTextStyle;

    move-result-object v5

    invoke-virtual {v9, v5}, Landroidx/core/app/NotificationCompat$Builder;->setStyle(Landroidx/core/app/NotificationCompat$Style;)Landroidx/core/app/NotificationCompat$Builder;

    iget-object v5, v0, Lcom/motorola/ccc/ota/ui/InstallNotification;->mContext:Landroid/content/Context;

    const/high16 v8, 0xc000000

    const/4 v10, 0x0

    invoke-static {v5, v10, v6, v8}, Landroid/app/PendingIntent;->getActivity(Landroid/content/Context;ILandroid/content/Intent;I)Landroid/app/PendingIntent;

    move-result-object v5

    iput-object v5, v0, Lcom/motorola/ccc/ota/ui/InstallNotification;->mPendingIntent:Landroid/app/PendingIntent;

    invoke-virtual {v9, v5}, Landroidx/core/app/NotificationCompat$Builder;->setContentIntent(Landroid/app/PendingIntent;)Landroidx/core/app/NotificationCompat$Builder;

    invoke-static/range {p2 .. p3}, Lcom/motorola/ccc/ota/utils/NotificationUtils;->showSwipeAbleNotification(II)Z

    move-result v5

    if-eqz v5, :cond_15

    iget-object v5, v0, Lcom/motorola/ccc/ota/ui/InstallNotification;->mContext:Landroid/content/Context;

    iget-object v6, v0, Lcom/motorola/ccc/ota/ui/InstallNotification;->mSwipedReceiver:Landroid/content/BroadcastReceiver;

    invoke-static {v5, v6}, Lcom/motorola/ccc/ota/utils/NotificationUtils;->registerSwipeableNotificationReceiver(Landroid/content/Context;Landroid/content/BroadcastReceiver;)V

    new-instance v5, Landroid/content/Intent;

    const-string v6, "com.motorola.ccc.ota.ACTION_NOTIFICATION_SWIPED"

    invoke-direct {v5, v6}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    iget-object v6, v0, Lcom/motorola/ccc/ota/ui/InstallNotification;->mContext:Landroid/content/Context;

    const/high16 v8, 0x4000000

    const/4 v10, 0x0

    invoke-static {v6, v10, v5, v8}, Landroid/app/PendingIntent;->getBroadcast(Landroid/content/Context;ILandroid/content/Intent;I)Landroid/app/PendingIntent;

    move-result-object v5

    invoke-virtual {v9, v5}, Landroidx/core/app/NotificationCompat$Builder;->setDeleteIntent(Landroid/app/PendingIntent;)Landroidx/core/app/NotificationCompat$Builder;

    :cond_15
    new-instance v5, Landroid/os/Bundle;

    invoke-direct {v5}, Landroid/os/Bundle;-><init>()V

    const-string v6, "com.motorola.ccc.ota.upgrade_status"

    invoke-virtual {v5, v6, v1}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    const-string v6, "com.motorola.ccc.ota.upgrade_percentage"

    invoke-virtual {v5, v6, v7}, Landroid/os/Bundle;->putFloat(Ljava/lang/String;F)V

    const-string v6, "com.motorola.blur.service.blur.upgrade.download.deferred"

    invoke-virtual {v5, v6, v2}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    const-string v6, "com.motorola.app.installer"

    invoke-virtual {v5, v6, v3}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    const-string v3, "com.motorola.blur.service.blur.upgrade.download.on_wifi"

    invoke-virtual {v5, v3, v4}, Landroid/os/Bundle;->putBoolean(Ljava/lang/String;Z)V

    const-string v3, "NOTIFICATION_TYPE"

    const-string v4, "BGInstall"

    invoke-virtual {v5, v3, v4}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v9, v5}, Landroidx/core/app/NotificationCompat$Builder;->setExtras(Landroid/os/Bundle;)Landroidx/core/app/NotificationCompat$Builder;

    invoke-virtual {v9}, Landroidx/core/app/NotificationCompat$Builder;->build()Landroid/app/Notification;

    move-result-object v3

    invoke-static/range {p2 .. p3}, Lcom/motorola/ccc/ota/utils/NotificationUtils;->showSwipeAbleNotification(II)Z

    move-result v1

    if-nez v1, :cond_16

    iget v1, v3, Landroid/app/Notification;->flags:I

    or-int/lit8 v1, v1, 0x2

    iput v1, v3, Landroid/app/Notification;->flags:I

    :cond_16
    iget-object v0, v0, Lcom/motorola/ccc/ota/ui/InstallNotification;->mNotificationMgr:Landroid/app/NotificationManager;

    const/16 v1, 0x6c1

    invoke-virtual {v0, v1, v3}, Landroid/app/NotificationManager;->notify(ILandroid/app/Notification;)V

    return-void

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_1
        :pswitch_1
        :pswitch_1
        :pswitch_1
        :pswitch_1
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method
