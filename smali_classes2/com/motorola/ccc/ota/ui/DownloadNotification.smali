.class public Lcom/motorola/ccc/ota/ui/DownloadNotification;
.super Ljava/lang/Object;
.source "DownloadNotification.java"


# static fields
.field private static sNotificationSuspended:Z

.field private static sNotificationSwiped:Z


# instance fields
.field private mContext:Landroid/content/Context;

.field private mMediumChannelId:Ljava/lang/String;

.field private mNotificationMgr:Landroid/app/NotificationManager;

.field public mSwipedReceiver:Landroid/content/BroadcastReceiver;

.field private mUrgentChannelId:Ljava/lang/String;


# direct methods
.method static bridge synthetic -$$Nest$fgetmContext(Lcom/motorola/ccc/ota/ui/DownloadNotification;)Landroid/content/Context;
    .locals 0

    iget-object p0, p0, Lcom/motorola/ccc/ota/ui/DownloadNotification;->mContext:Landroid/content/Context;

    return-object p0
.end method

.method static bridge synthetic -$$Nest$sfputsNotificationSuspended(Z)V
    .locals 0

    sput-boolean p0, Lcom/motorola/ccc/ota/ui/DownloadNotification;->sNotificationSuspended:Z

    return-void
.end method

.method static bridge synthetic -$$Nest$sfputsNotificationSwiped(Z)V
    .locals 0

    sput-boolean p0, Lcom/motorola/ccc/ota/ui/DownloadNotification;->sNotificationSwiped:Z

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;)V
    .locals 1

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance v0, Lcom/motorola/ccc/ota/ui/DownloadNotification$1;

    invoke-direct {v0, p0}, Lcom/motorola/ccc/ota/ui/DownloadNotification$1;-><init>(Lcom/motorola/ccc/ota/ui/DownloadNotification;)V

    iput-object v0, p0, Lcom/motorola/ccc/ota/ui/DownloadNotification;->mSwipedReceiver:Landroid/content/BroadcastReceiver;

    iput-object p1, p0, Lcom/motorola/ccc/ota/ui/DownloadNotification;->mContext:Landroid/content/Context;

    const-string v0, "notification"

    invoke-virtual {p1, v0}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Landroid/app/NotificationManager;

    iput-object p1, p0, Lcom/motorola/ccc/ota/ui/DownloadNotification;->mNotificationMgr:Landroid/app/NotificationManager;

    invoke-static {}, Lcom/motorola/ccc/ota/ui/NotificationChannelCreator;->getUrgentNotificationChannelId()Ljava/lang/String;

    move-result-object p1

    iput-object p1, p0, Lcom/motorola/ccc/ota/ui/DownloadNotification;->mUrgentChannelId:Ljava/lang/String;

    invoke-static {}, Lcom/motorola/ccc/ota/ui/NotificationChannelCreator;->getMediumNotificationChannelId()Ljava/lang/String;

    move-result-object p1

    iput-object p1, p0, Lcom/motorola/ccc/ota/ui/DownloadNotification;->mMediumChannelId:Ljava/lang/String;

    return-void
.end method

.method private addCellularButton(Landroidx/core/app/NotificationCompat$Builder;Landroid/content/res/Resources;)V
    .locals 5

    iget-object v0, p0, Lcom/motorola/ccc/ota/ui/DownloadNotification;->mContext:Landroid/content/Context;

    const-string v1, "connectivity"

    invoke-virtual {v0, v1}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/net/ConnectivityManager;

    iget-object v0, p0, Lcom/motorola/ccc/ota/ui/DownloadNotification;->mContext:Landroid/content/Context;

    invoke-static {v0}, Lcom/motorola/ccc/ota/ui/UpdaterUtils;->isWifiConnected(Landroid/content/Context;)Z

    move-result v0

    if-nez v0, :cond_0

    new-instance v0, Landroid/content/Intent;

    const-string v1, "com.motorola.ccc.ota.Actions.USER_RESUME_DOWNLOAD_ON_CELLULAR"

    invoke-direct {v0, v1}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    new-instance v1, Landroid/content/ComponentName;

    invoke-static {}, Lcom/motorola/ccc/ota/env/OtaApplication;->getGlobalContext()Landroid/content/Context;

    move-result-object v2

    const-class v3, Lcom/motorola/ccc/ota/ui/UpdateReceiver;

    invoke-direct {v1, v2, v3}, Landroid/content/ComponentName;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    invoke-virtual {v0, v1}, Landroid/content/Intent;->setComponent(Landroid/content/ComponentName;)Landroid/content/Intent;

    iget-object v1, p0, Lcom/motorola/ccc/ota/ui/DownloadNotification;->mContext:Landroid/content/Context;

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

    const v4, 0x1080038

    invoke-virtual {p1, v4, v1, v0}, Landroidx/core/app/NotificationCompat$Builder;->addAction(ILjava/lang/CharSequence;Landroid/app/PendingIntent;)Landroidx/core/app/NotificationCompat$Builder;

    invoke-static {}, Lcom/motorola/ccc/ota/utils/BuildPropReader;->isBotaATT()Z

    move-result v0

    if-eqz v0, :cond_0

    new-instance v0, Landroid/content/Intent;

    const-string v1, "android.settings.WIFI_SETTINGS"

    invoke-direct {v0, v1}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    const/high16 v1, 0x20000000

    invoke-virtual {v0, v1}, Landroid/content/Intent;->setFlags(I)Landroid/content/Intent;

    iget-object p0, p0, Lcom/motorola/ccc/ota/ui/DownloadNotification;->mContext:Landroid/content/Context;

    const/high16 v1, 0x14000000

    invoke-static {p0, v3, v0, v1}, Landroid/app/PendingIntent;->getActivity(Landroid/content/Context;ILandroid/content/Intent;I)Landroid/app/PendingIntent;

    move-result-object p0

    const v0, 0x7f0e00a1

    invoke-virtual {p2, v0}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object p2

    invoke-static {p2, v2}, Lcom/motorola/ccc/ota/utils/NotificationUtils;->getActionBtnText(Ljava/lang/String;I)Landroid/text/Spannable;

    move-result-object p2

    const v0, 0x1080024

    invoke-virtual {p1, v0, p2, p0}, Landroidx/core/app/NotificationCompat$Builder;->addAction(ILjava/lang/CharSequence;Landroid/app/PendingIntent;)Landroidx/core/app/NotificationCompat$Builder;

    :cond_0
    return-void
.end method

.method private getDownloadingText(JJ)Ljava/lang/String;
    .locals 2

    const-wide/16 v0, 0x0

    cmp-long p0, p1, v0

    if-gtz p0, :cond_0

    const-string p0, ""

    return-object p0

    :cond_0
    long-to-float p0, p3

    long-to-float p1, p1

    div-float/2addr p0, p1

    invoke-static {}, Ljava/text/NumberFormat;->getPercentInstance()Ljava/text/NumberFormat;

    move-result-object p1

    float-to-double p2, p0

    invoke-virtual {p1, p2, p3}, Ljava/text/NumberFormat;->format(D)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method private storeReceivedBytes(JLcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;)[J
    .locals 8

    sget-object p0, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->KEY_RETRY_SUSPEND_STATUS:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    const/4 v0, 0x0

    invoke-virtual {p3, p0, v0}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->getInt(Lcom/motorola/otalib/common/settings/ISetting;I)I

    move-result p0

    const/4 v1, 0x0

    if-eqz p0, :cond_0

    sget-object p0, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->KEY_RECEIVED_BYTES:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    invoke-virtual {p3, p0, p1, p2}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->setLong(Lcom/motorola/otalib/common/settings/ISetting;J)V

    sget-object p0, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->KEY_TIME_RECEIVED_BYTES:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide p1

    invoke-virtual {p3, p0, p1, p2}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->setLong(Lcom/motorola/otalib/common/settings/ISetting;J)V

    sget-object p0, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->KEY_RETRY_SUSPEND_STATUS:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    invoke-virtual {p3, p0, v0}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->setInt(Lcom/motorola/otalib/common/settings/ISetting;I)V

    return-object v1

    :cond_0
    sget-object p0, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->KEY_RECEIVED_BYTES:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    const-wide/16 v2, -0x1

    invoke-virtual {p3, p0, v2, v3}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->getLong(Lcom/motorola/otalib/common/settings/ISetting;J)J

    move-result-wide v4

    const-wide/16 v6, 0x0

    cmp-long p0, v4, v6

    if-gtz p0, :cond_1

    sget-object p0, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->KEY_RECEIVED_BYTES:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    invoke-virtual {p3, p0, p1, p2}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->setLong(Lcom/motorola/otalib/common/settings/ISetting;J)V

    sget-object p0, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->KEY_TIME_RECEIVED_BYTES:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide p1

    invoke-virtual {p3, p0, p1, p2}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->setLong(Lcom/motorola/otalib/common/settings/ISetting;J)V

    return-object v1

    :cond_1
    sget-object p0, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->KEY_RECEIVED_BYTES:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    invoke-virtual {p3, p0, v2, v3}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->getLong(Lcom/motorola/otalib/common/settings/ISetting;J)J

    move-result-wide v4

    sget-object p0, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->KEY_TIME_RECEIVED_BYTES:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    invoke-virtual {p3, p0, v2, v3}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->getLong(Lcom/motorola/otalib/common/settings/ISetting;J)J

    move-result-wide v2

    cmp-long p0, p1, v4

    if-gez p0, :cond_2

    sget-object p0, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->KEY_RECEIVED_BYTES:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    invoke-virtual {p3, p0}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->removeConfig(Lcom/motorola/otalib/common/settings/ISetting;)V

    sget-object p0, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->KEY_TIME_RECEIVED_BYTES:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    invoke-virtual {p3, p0}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->removeConfig(Lcom/motorola/otalib/common/settings/ISetting;)V

    return-object v1

    :cond_2
    sget-object p0, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->KEY_RECEIVED_BYTES:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    invoke-virtual {p3, p0, p1, p2}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->setLong(Lcom/motorola/otalib/common/settings/ISetting;J)V

    sget-object p0, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->KEY_TIME_RECEIVED_BYTES:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide p1

    invoke-virtual {p3, p0, p1, p2}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->setLong(Lcom/motorola/otalib/common/settings/ISetting;J)V

    const/4 p0, 0x2

    new-array p0, p0, [J

    aput-wide v4, p0, v0

    const/4 p1, 0x1

    aput-wide v2, p0, p1

    return-object p0
.end method


# virtual methods
.method public cancel()V
    .locals 1

    iget-object p0, p0, Lcom/motorola/ccc/ota/ui/DownloadNotification;->mNotificationMgr:Landroid/app/NotificationManager;

    const/16 v0, 0x6c1

    invoke-virtual {p0, v0}, Landroid/app/NotificationManager;->cancel(I)V

    return-void
.end method

.method public getErrorNotificationText(IZZLcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;)Ljava/lang/String;
    .locals 3

    iget-object v0, p0, Lcom/motorola/ccc/ota/ui/DownloadNotification;->mContext:Landroid/content/Context;

    invoke-virtual {v0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "DownloadNotification.getNotificationText retriedOrSuspend = "

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    const-string v2, "OtaApp"

    invoke-static {v2, v1}, Lcom/motorola/ccc/ota/utils/Logger;->debug(Ljava/lang/String;Ljava/lang/String;)V

    if-eqz p1, :cond_7

    invoke-static {}, Lcom/motorola/ccc/ota/ui/UpdaterUtils;->isDeviceInDatasaverMode()Z

    move-result v1

    if-eqz v1, :cond_0

    const p0, 0x7f0e014e

    invoke-virtual {v0, p0}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object p0

    goto/16 :goto_0

    :cond_0
    const/4 v1, 0x1

    if-ne p1, v1, :cond_1

    const p0, 0x7f0e014c

    invoke-virtual {v0, p0}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object p0

    goto :goto_0

    :cond_1
    sget-object p1, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->BATTERY_LOW:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    invoke-virtual {p4, p1}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->getBoolean(Lcom/motorola/otalib/common/settings/ISetting;)Z

    move-result p1

    if-eqz p1, :cond_2

    const p0, 0x7f0e011f

    invoke-virtual {v0, p0}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object p0

    goto :goto_0

    :cond_2
    const p1, 0x7f0e0151

    if-eqz p3, :cond_3

    invoke-virtual {v0, p1}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object p0

    goto :goto_0

    :cond_3
    if-eqz p2, :cond_4

    invoke-static {}, Lcom/motorola/ccc/ota/ui/UpdaterUtils;->getAutomaticDownloadForCellular()Z

    move-result p2

    if-nez p2, :cond_4

    invoke-virtual {v0, p1}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object p0

    goto :goto_0

    :cond_4
    iget-object p0, p0, Lcom/motorola/ccc/ota/ui/DownloadNotification;->mContext:Landroid/content/Context;

    invoke-static {p0}, Lcom/motorola/ccc/ota/ui/UpdaterUtils;->isDataNetworkRoaming(Landroid/content/Context;)Z

    move-result p0

    if-eqz p0, :cond_5

    const p0, 0x7f0e0150

    invoke-virtual {v0, p0}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object p0

    goto :goto_0

    :cond_5
    invoke-static {}, Lcom/motorola/ccc/ota/ui/UpdaterUtils;->isAdminAPNEnabled()Z

    move-result p0

    if-eqz p0, :cond_6

    const p0, 0x7f0e014f

    invoke-virtual {v0, p0}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object p0

    goto :goto_0

    :cond_6
    const p0, 0x7f0e014d

    invoke-virtual {v0, p0}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object p0

    goto :goto_0

    :cond_7
    sget-object p0, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->METADATA:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    invoke-virtual {p4, p0}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->getString(Lcom/motorola/otalib/common/settings/ISetting;)Ljava/lang/String;

    move-result-object p0

    invoke-static {p0}, Lcom/motorola/ccc/ota/ui/UpdaterUtils;->getUpdateType(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    invoke-static {p0}, Lcom/motorola/ccc/ota/ui/updateType/UpdateType;->getUpdateType(Ljava/lang/String;)Lcom/motorola/ccc/ota/ui/updateType/UpdateType$UpdateTypeInterface;

    move-result-object p0

    invoke-interface {p0}, Lcom/motorola/ccc/ota/ui/updateType/UpdateType$UpdateTypeInterface;->getDownloadProgressText()Ljava/lang/String;

    move-result-object p0

    :goto_0
    new-instance p1, Ljava/lang/StringBuilder;

    const-string p2, "DownloadNotification.getNotificationText bigTextMessage = "

    invoke-direct {p1, p2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {v2, p1}, Lcom/motorola/ccc/ota/utils/Logger;->debug(Ljava/lang/String;Ljava/lang/String;)V

    return-object p0
.end method

.method getProgressDeferred()I
    .locals 0

    const p0, 0x7f0e0149

    return p0
.end method

.method public updateNotification(JJLjava/lang/String;IZZLcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;)V
    .locals 25

    move-object/from16 v0, p0

    move-wide/from16 v10, p1

    move-wide/from16 v12, p3

    move-object/from16 v14, p5

    move/from16 v15, p6

    move/from16 v9, p7

    move/from16 v8, p8

    move-object/from16 v7, p9

    sget-object v1, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->METADATA:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    invoke-virtual {v7, v1}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->getString(Lcom/motorola/otalib/common/settings/ISetting;)Ljava/lang/String;

    move-result-object v16

    invoke-static/range {v16 .. v16}, Lcom/motorola/otalib/common/metaData/builder/MetaDataBuilder;->from(Ljava/lang/String;)Lcom/motorola/otalib/common/metaData/MetaData;

    move-result-object v1

    const-string v5, "OtaApp"

    if-nez v1, :cond_0

    const-string v0, "empty metadata, returning"

    invoke-static {v5, v0}, Lcom/motorola/ccc/ota/utils/Logger;->debug(Ljava/lang/String;Ljava/lang/String;)V

    return-void

    :cond_0
    invoke-static/range {v16 .. v16}, Lcom/motorola/ccc/ota/ui/UpdaterUtils;->getUpdateType(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Lcom/motorola/ccc/ota/ui/updateType/UpdateType;->getUpdateType(Ljava/lang/String;)Lcom/motorola/ccc/ota/ui/updateType/UpdateType$UpdateTypeInterface;

    move-result-object v17

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v6, "<b>"

    invoke-direct {v1, v6}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-interface/range {v17 .. v17}, Lcom/motorola/ccc/ota/ui/updateType/UpdateType$UpdateTypeInterface;->getDownloadNotificationTitle()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-interface/range {v17 .. v17}, Lcom/motorola/ccc/ota/ui/updateType/UpdateType$UpdateTypeInterface;->getDownloadProgressText()Ljava/lang/String;

    move-result-object v4

    invoke-interface/range {v17 .. v17}, Lcom/motorola/ccc/ota/ui/updateType/UpdateType$UpdateTypeInterface;->getSystemUpdatePausedNotificationTitle()Ljava/lang/String;

    move-result-object v2

    invoke-static/range {p9 .. p9}, Lcom/motorola/ccc/ota/utils/SmartUpdateUtils;->isDownloadForcedForSmartUpdate(Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;)Z

    move-result v1

    const/4 v14, 0x1

    if-eqz v1, :cond_2

    const/4 v1, -0x1

    if-eq v1, v15, :cond_1

    sget-boolean v1, Lcom/motorola/ccc/ota/ui/DownloadNotification;->sNotificationSuspended:Z

    if-nez v1, :cond_1

    invoke-virtual/range {p0 .. p0}, Lcom/motorola/ccc/ota/ui/DownloadNotification;->cancel()V

    return-void

    :cond_1
    sput-boolean v14, Lcom/motorola/ccc/ota/ui/DownloadNotification;->sNotificationSuspended:Z

    :cond_2
    sget-boolean v1, Lcom/motorola/ccc/ota/ui/DownloadNotification;->sNotificationSwiped:Z

    if-eqz v1, :cond_3

    invoke-static/range {p6 .. p6}, Lcom/motorola/ccc/ota/utils/NotificationUtils;->showSwipeAbleNotification(I)Z

    move-result v1

    if-eqz v1, :cond_3

    return-void

    :cond_3
    const/4 v1, 0x0

    sput-boolean v1, Lcom/motorola/ccc/ota/ui/DownloadNotification;->sNotificationSwiped:Z

    new-instance v14, Lcom/motorola/ccc/ota/ui/NotificationHandler;

    iget-object v1, v0, Lcom/motorola/ccc/ota/ui/DownloadNotification;->mContext:Landroid/content/Context;

    invoke-direct {v14, v1}, Lcom/motorola/ccc/ota/ui/NotificationHandler;-><init>(Landroid/content/Context;)V

    iget-object v1, v0, Lcom/motorola/ccc/ota/ui/DownloadNotification;->mContext:Landroid/content/Context;

    invoke-virtual {v1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    move-object/from16 v19, v1

    iget-object v1, v0, Lcom/motorola/ccc/ota/ui/DownloadNotification;->mContext:Landroid/content/Context;

    move-object/from16 v10, v19

    const/4 v11, 0x0

    move-object/from16 v18, v2

    move/from16 v2, p6

    move-object/from16 v20, v3

    move-object/from16 v21, v4

    move-wide/from16 v3, p1

    move-object v11, v5

    move-object/from16 v22, v6

    move-wide/from16 v5, p3

    move-object/from16 v23, v10

    move-object v10, v7

    move-object/from16 v7, p5

    move/from16 v8, p7

    move v15, v9

    move-object/from16 v9, v16

    invoke-static/range {v1 .. v9}, Lcom/motorola/ccc/ota/ui/UpdaterUtils;->getPendingIntentForDlProgressScreen(Landroid/content/Context;IJJLjava/lang/String;ZLjava/lang/String;)Landroid/content/Intent;

    move-result-object v7

    sget-object v1, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->BATTERY_LOW:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    invoke-virtual {v10, v1}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->getBoolean(Lcom/motorola/otalib/common/settings/ISetting;)Z

    move-result v1

    const-wide/16 v2, 0x0

    if-nez v1, :cond_5

    if-eqz v15, :cond_5

    iget-object v1, v0, Lcom/motorola/ccc/ota/ui/DownloadNotification;->mContext:Landroid/content/Context;

    invoke-static {v1}, Lcom/motorola/ccc/ota/ui/UpdaterUtils;->isWifiConnected(Landroid/content/Context;)Z

    move-result v1

    if-nez v1, :cond_5

    cmp-long v1, v12, v2

    if-gtz v1, :cond_5

    invoke-static {}, Lcom/motorola/ccc/ota/ui/UpdaterUtils;->downloadFileSize()J

    move-result-wide v4

    cmp-long v1, v4, v2

    if-gtz v1, :cond_5

    sget-object v0, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->WIFI_SETTINGS_DEFFERED:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    invoke-virtual {v10, v0}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->getBoolean(Lcom/motorola/otalib/common/settings/ISetting;)Z

    move-result v0

    if-nez v0, :cond_4

    invoke-virtual {v14}, Lcom/motorola/ccc/ota/ui/NotificationHandler;->sendWiFiNotification()V

    goto :goto_0

    :cond_4
    const-string v0, "DownloadNotification.updateNotification(): defer sending wifi settings notification"

    invoke-static {v11, v0}, Lcom/motorola/ccc/ota/utils/Logger;->debug(Ljava/lang/String;Ljava/lang/String;)V

    :goto_0
    return-void

    :cond_5
    sget-object v1, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->WIFI_SETTINGS_DEFFERED:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    const/4 v4, 0x0

    invoke-virtual {v10, v1, v4}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->setBoolean(Lcom/motorola/otalib/common/settings/ISetting;Z)V

    move/from16 v8, p6

    move v9, v15

    if-eqz v8, :cond_8

    move/from16 v11, p8

    if-eqz v11, :cond_7

    invoke-static {}, Lcom/motorola/ccc/ota/ui/UpdaterUtils;->getAutomaticDownloadForCellular()Z

    move-result v1

    if-nez v1, :cond_7

    invoke-static {}, Lcom/motorola/ccc/ota/ui/UpdaterUtils;->checkForFinalDeferTimeForForceUpdate()Z

    move-result v1

    if-eqz v1, :cond_7

    sget-object v1, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->SHOULD_BLOCK_FULL_SCREEN_DISPLAY:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    invoke-virtual {v10, v1}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->getBoolean(Lcom/motorola/otalib/common/settings/ISetting;)Z

    move-result v1

    if-nez v1, :cond_6

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const/4 v2, 0x1

    invoke-virtual {v0, v8, v2, v9, v10}, Lcom/motorola/ccc/ota/ui/DownloadNotification;->getErrorNotificationText(IZZLcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-static {}, Ljava/lang/System;->lineSeparator()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, v0, Lcom/motorola/ccc/ota/ui/DownloadNotification;->mContext:Landroid/content/Context;

    invoke-static {}, Lcom/motorola/ccc/ota/ui/UpdaterUtils;->getMaxForceDownloadDeferTime()J

    move-result-wide v3

    invoke-static {v2, v3, v4}, Lcom/motorola/ccc/ota/utils/DateFormatUtils;->getCalendarString(Landroid/content/Context;J)Ljava/lang/String;

    move-result-object v2

    filled-new-array {v2}, [Ljava/lang/Object;

    move-result-object v2

    const v3, 0x7f0e004f

    move-object/from16 v4, v23

    invoke-virtual {v4, v3, v2}, Landroid/content/res/Resources;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    const-wide/16 v2, 0x64

    mul-long/2addr v2, v12

    move-wide/from16 v14, p1

    div-long/2addr v2, v14

    long-to-int v2, v2

    invoke-static/range {p9 .. p9}, Lcom/motorola/ccc/ota/ui/UpdaterUtils;->getProgressScreenDisplayNextPromptInMins(Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;)I

    move-result v3

    new-instance v4, Landroid/content/Intent;

    const-string v5, "com.motorola.ccc.ota.Actions.USER_RESUME_DOWNLOAD_ON_CELLULAR"

    invoke-direct {v4, v5}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    iget-object v5, v0, Lcom/motorola/ccc/ota/ui/DownloadNotification;->mContext:Landroid/content/Context;

    int-to-float v2, v2

    move-object/from16 p1, v5

    move-object/from16 p2, v18

    move-object/from16 p3, v1

    move-object/from16 p4, v16

    move/from16 p5, v3

    move-object/from16 p6, v7

    move/from16 p7, v2

    move-object/from16 p8, v4

    invoke-static/range {p1 .. p8}, Lcom/motorola/ccc/ota/utils/NotificationUtils;->fillSystemUpdatePausedNotificationDetails(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;ILandroid/content/Intent;FLandroid/content/Intent;)Landroid/content/Intent;

    move-result-object v1

    iget-object v0, v0, Lcom/motorola/ccc/ota/ui/DownloadNotification;->mContext:Landroid/content/Context;

    invoke-static {v0, v1}, Lcom/motorola/ccc/ota/utils/NotificationUtils;->startNotificationService(Landroid/content/Context;Landroid/content/Intent;)V

    :cond_6
    return-void

    :cond_7
    move-wide/from16 v14, p1

    goto :goto_1

    :cond_8
    move-wide/from16 v14, p1

    move/from16 v11, p8

    :goto_1
    move-object/from16 v6, v23

    iget-object v1, v0, Lcom/motorola/ccc/ota/ui/DownloadNotification;->mContext:Landroid/content/Context;

    invoke-static {v1}, Lcom/motorola/ccc/ota/utils/NotificationUtils;->stopNotificationService(Landroid/content/Context;)V

    new-instance v5, Landroidx/core/app/NotificationCompat$Builder;

    iget-object v1, v0, Lcom/motorola/ccc/ota/ui/DownloadNotification;->mContext:Landroid/content/Context;

    iget-object v4, v0, Lcom/motorola/ccc/ota/ui/DownloadNotification;->mMediumChannelId:Ljava/lang/String;

    invoke-direct {v5, v1, v4}, Landroidx/core/app/NotificationCompat$Builder;-><init>(Landroid/content/Context;Ljava/lang/String;)V

    move-object/from16 v1, v20

    const/4 v4, 0x0

    invoke-static {v1, v4}, Landroid/text/Html;->fromHtml(Ljava/lang/String;I)Landroid/text/Spanned;

    move-result-object v1

    invoke-virtual {v5, v1}, Landroidx/core/app/NotificationCompat$Builder;->setContentTitle(Ljava/lang/CharSequence;)Landroidx/core/app/NotificationCompat$Builder;

    const-wide/16 v19, 0xa

    div-long v2, v14, v19

    long-to-int v3, v2

    div-long v1, v12, v19

    long-to-int v1, v1

    invoke-virtual {v5, v3, v1, v4}, Landroidx/core/app/NotificationCompat$Builder;->setProgress(IIZ)Landroidx/core/app/NotificationCompat$Builder;

    invoke-interface/range {v17 .. v17}, Lcom/motorola/ccc/ota/ui/updateType/UpdateType$UpdateTypeInterface;->getUpdateSpecificColor()I

    move-result v2

    iget-object v4, v0, Lcom/motorola/ccc/ota/ui/DownloadNotification;->mContext:Landroid/content/Context;

    invoke-virtual {v4}, Landroid/content/Context;->getTheme()Landroid/content/res/Resources$Theme;

    move-result-object v4

    invoke-virtual {v6, v2, v4}, Landroid/content/res/Resources;->getColor(ILandroid/content/res/Resources$Theme;)I

    move-result v2

    invoke-virtual {v5, v2}, Landroidx/core/app/NotificationCompat$Builder;->setColor(I)Landroidx/core/app/NotificationCompat$Builder;

    move v4, v1

    const-wide/16 v1, 0x0

    invoke-virtual {v5, v1, v2}, Landroidx/core/app/NotificationCompat$Builder;->setWhen(J)Landroidx/core/app/NotificationCompat$Builder;

    const/4 v1, 0x1

    invoke-virtual {v5, v1}, Landroidx/core/app/NotificationCompat$Builder;->setLocalOnly(Z)Landroidx/core/app/NotificationCompat$Builder;

    const-string v1, "alarm"

    invoke-virtual {v5, v1}, Landroidx/core/app/NotificationCompat$Builder;->setCategory(Ljava/lang/String;)Landroidx/core/app/NotificationCompat$Builder;

    const-string v1, "sdcard"

    if-eqz v8, :cond_10

    sget-object v2, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->KEY_RETRY_SUSPEND_STATUS:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    invoke-virtual {v10, v2, v8}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->setInt(Lcom/motorola/otalib/common/settings/ISetting;I)V

    const v2, 0x7f0800f4

    invoke-virtual {v5, v2}, Landroidx/core/app/NotificationCompat$Builder;->setSmallIcon(I)Landroidx/core/app/NotificationCompat$Builder;

    new-instance v2, Ljava/lang/StringBuilder;

    move-object/from16 v3, v22

    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    move-object/from16 v4, v18

    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    const/4 v3, 0x0

    invoke-static {v2, v3}, Landroid/text/Html;->fromHtml(Ljava/lang/String;I)Landroid/text/Spanned;

    move-result-object v2

    invoke-virtual {v5, v2}, Landroidx/core/app/NotificationCompat$Builder;->setContentTitle(Ljava/lang/CharSequence;)Landroidx/core/app/NotificationCompat$Builder;

    invoke-static {}, Lcom/motorola/ccc/ota/ui/UpdaterUtils;->isDeviceInDatasaverMode()Z

    move-result v2

    const/high16 v3, 0x20000000

    if-eqz v2, :cond_9

    const-string v2, "com.android.settings"

    const-string v4, "com.android.settings.Settings$DataUsageSummaryActivity"

    invoke-virtual {v7, v2, v4}, Landroid/content/Intent;->setClassName(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    invoke-virtual {v7, v3}, Landroid/content/Intent;->setFlags(I)Landroid/content/Intent;

    goto :goto_3

    :cond_9
    sget-object v2, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->BATTERY_LOW:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    invoke-virtual {v10, v2}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->getBoolean(Lcom/motorola/otalib/common/settings/ISetting;)Z

    move-result v2

    if-nez v2, :cond_d

    if-eqz v9, :cond_b

    new-instance v2, Landroid/content/Intent;

    invoke-direct {v2}, Landroid/content/Intent;-><init>()V

    const-string v4, "android.settings.WIFI_SETTINGS"

    invoke-virtual {v2, v4}, Landroid/content/Intent;->setAction(Ljava/lang/String;)Landroid/content/Intent;

    invoke-virtual {v2, v3}, Landroid/content/Intent;->setFlags(I)Landroid/content/Intent;

    invoke-static {}, Lcom/motorola/ccc/ota/utils/BuildPropReader;->isBotaATT()Z

    move-result v3

    if-eqz v3, :cond_a

    invoke-static {}, Lcom/motorola/ccc/ota/ui/UpdaterUtils;->isWifiOnlyPkg()Z

    move-result v3

    if-nez v3, :cond_a

    invoke-static {}, Lcom/motorola/ccc/ota/ui/UpdaterUtils;->getAutomaticDownloadForCellular()Z

    move-result v3

    if-nez v3, :cond_a

    invoke-direct {v0, v5, v6}, Lcom/motorola/ccc/ota/ui/DownloadNotification;->addCellularButton(Landroidx/core/app/NotificationCompat$Builder;Landroid/content/res/Resources;)V

    :cond_a
    :goto_2
    move-object v7, v2

    goto :goto_3

    :cond_b
    if-nez v11, :cond_c

    invoke-static/range {p9 .. p9}, Lcom/motorola/ccc/ota/utils/SmartUpdateUtils;->isDownloadForcedForSmartUpdate(Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;)Z

    move-result v2

    if-eqz v2, :cond_f

    :cond_c
    invoke-static {}, Lcom/motorola/ccc/ota/ui/UpdaterUtils;->getAutomaticDownloadForCellular()Z

    move-result v2

    if-nez v2, :cond_f

    invoke-direct {v0, v5, v6}, Lcom/motorola/ccc/ota/ui/DownloadNotification;->addCellularButton(Landroidx/core/app/NotificationCompat$Builder;Landroid/content/res/Resources;)V

    goto :goto_3

    :cond_d
    invoke-static {}, Lcom/motorola/ccc/ota/utils/BuildPropReader;->isFotaATT()Z

    move-result v2

    if-eqz v2, :cond_f

    sget-object v2, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->BATTERY_LOW:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    invoke-virtual {v10, v2}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->getBoolean(Lcom/motorola/otalib/common/settings/ISetting;)Z

    move-result v2

    if-eqz v2, :cond_f

    const-wide/16 v2, 0x0

    cmp-long v2, v12, v2

    if-lez v2, :cond_e

    return-void

    :cond_e
    new-instance v2, Landroid/content/Intent;

    invoke-direct {v2}, Landroid/content/Intent;-><init>()V

    goto :goto_2

    :cond_f
    :goto_3
    invoke-virtual {v0, v8, v11, v9, v10}, Lcom/motorola/ccc/ota/ui/DownloadNotification;->getErrorNotificationText(IZZLcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;)Ljava/lang/String;

    move-result-object v2

    new-instance v3, Landroidx/core/app/NotificationCompat$BigTextStyle;

    invoke-direct {v3}, Landroidx/core/app/NotificationCompat$BigTextStyle;-><init>()V

    invoke-virtual {v3, v2}, Landroidx/core/app/NotificationCompat$BigTextStyle;->bigText(Ljava/lang/CharSequence;)Landroidx/core/app/NotificationCompat$BigTextStyle;

    move-result-object v2

    invoke-virtual {v5, v2}, Landroidx/core/app/NotificationCompat$Builder;->setStyle(Landroidx/core/app/NotificationCompat$Style;)Landroidx/core/app/NotificationCompat$Builder;

    move-object/from16 v3, p5

    move-object v8, v5

    move-object v2, v6

    move-object/from16 v24, v7

    move-object v7, v1

    move-object/from16 v1, v24

    goto/16 :goto_6

    :cond_10
    invoke-direct {v0, v12, v13, v10}, Lcom/motorola/ccc/ota/ui/DownloadNotification;->storeReceivedBytes(JLcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;)[J

    move-result-object v16

    if-eqz v16, :cond_11

    move-object/from16 v17, v7

    move-object v7, v1

    move-wide/from16 v1, p1

    move v11, v3

    move v9, v4

    move-wide/from16 v3, p3

    move-object v8, v5

    move-object/from16 v5, v16

    move-object/from16 v23, v6

    invoke-static/range {v1 .. v6}, Lcom/motorola/ccc/ota/ui/UpdaterUtils;->getEstimatedTime(JJ[JLandroid/content/res/Resources;)Ljava/lang/String;

    move-result-object v1

    goto :goto_4

    :cond_11
    move v11, v3

    move v9, v4

    move-object v8, v5

    move-object/from16 v23, v6

    move-object/from16 v17, v7

    move-object v7, v1

    const/4 v1, 0x0

    :goto_4
    const v2, 0x1080081

    invoke-virtual {v8, v2}, Landroidx/core/app/NotificationCompat$Builder;->setSmallIcon(I)Landroidx/core/app/NotificationCompat$Builder;

    cmp-long v2, v14, v12

    if-nez v2, :cond_12

    const v1, 0x7f0e0152

    move-object/from16 v2, v23

    invoke-virtual {v2, v1}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v8, v1}, Landroidx/core/app/NotificationCompat$Builder;->setContentText(Ljava/lang/CharSequence;)Landroidx/core/app/NotificationCompat$Builder;

    const/4 v1, 0x1

    invoke-virtual {v8, v11, v9, v1}, Landroidx/core/app/NotificationCompat$Builder;->setProgress(IIZ)Landroidx/core/app/NotificationCompat$Builder;

    sget-object v1, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->KEY_RECEIVED_BYTES:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    invoke-virtual {v10, v1}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->removeConfig(Lcom/motorola/otalib/common/settings/ISetting;)V

    sget-object v1, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->KEY_TIME_RECEIVED_BYTES:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    invoke-virtual {v10, v1}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->removeConfig(Lcom/motorola/otalib/common/settings/ISetting;)V

    sget-object v1, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->KEY_RETRY_SUSPEND_STATUS:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    invoke-virtual {v10, v1}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->removeConfig(Lcom/motorola/otalib/common/settings/ISetting;)V

    move-object/from16 v3, p5

    goto :goto_5

    :cond_12
    move-object/from16 v3, p5

    move-object/from16 v2, v23

    invoke-virtual {v7, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_13

    const v1, 0x7f0e0148

    invoke-virtual {v2, v1}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v8, v1}, Landroidx/core/app/NotificationCompat$Builder;->setContentText(Ljava/lang/CharSequence;)Landroidx/core/app/NotificationCompat$Builder;

    goto :goto_5

    :cond_13
    if-nez v1, :cond_14

    move-object/from16 v4, v21

    invoke-virtual {v8, v4}, Landroidx/core/app/NotificationCompat$Builder;->setContentText(Ljava/lang/CharSequence;)Landroidx/core/app/NotificationCompat$Builder;

    goto :goto_5

    :cond_14
    new-instance v4, Landroidx/core/app/NotificationCompat$BigTextStyle;

    invoke-direct {v4}, Landroidx/core/app/NotificationCompat$BigTextStyle;-><init>()V

    iget-object v5, v0, Lcom/motorola/ccc/ota/ui/DownloadNotification;->mContext:Landroid/content/Context;

    invoke-static {v5, v12, v13}, Landroid/text/format/Formatter;->formatFileSize(Landroid/content/Context;J)Ljava/lang/String;

    move-result-object v5

    iget-object v6, v0, Lcom/motorola/ccc/ota/ui/DownloadNotification;->mContext:Landroid/content/Context;

    invoke-static {v6, v14, v15}, Landroid/text/format/Formatter;->formatFileSize(Landroid/content/Context;J)Ljava/lang/String;

    move-result-object v6

    filled-new-array {v1, v5, v6}, [Ljava/lang/Object;

    move-result-object v1

    const v5, 0x7f0e00cb

    invoke-virtual {v2, v5, v1}, Landroid/content/res/Resources;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v4, v1}, Landroidx/core/app/NotificationCompat$BigTextStyle;->bigText(Ljava/lang/CharSequence;)Landroidx/core/app/NotificationCompat$BigTextStyle;

    move-result-object v1

    invoke-virtual {v8, v1}, Landroidx/core/app/NotificationCompat$Builder;->setStyle(Landroidx/core/app/NotificationCompat$Style;)Landroidx/core/app/NotificationCompat$Builder;

    :goto_5
    move-object/from16 v1, v17

    :goto_6
    invoke-static {}, Lcom/motorola/ccc/ota/ui/UpdaterUtils;->showCancelOption()Z

    move-result v4

    const/high16 v5, 0x4000000

    if-eqz v4, :cond_15

    invoke-virtual {v7, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-nez v4, :cond_15

    new-instance v4, Landroid/content/Intent;

    const-string v6, "com.motorola.ccc.ota.Actions.USER_CANCEL_DOWNLOAD"

    invoke-direct {v4, v6}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    new-instance v6, Landroid/content/ComponentName;

    invoke-static {}, Lcom/motorola/ccc/ota/env/OtaApplication;->getGlobalContext()Landroid/content/Context;

    move-result-object v7

    const-class v9, Lcom/motorola/ccc/ota/ui/UpdateReceiver;

    invoke-direct {v6, v7, v9}, Landroid/content/ComponentName;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    invoke-virtual {v4, v6}, Landroid/content/Intent;->setComponent(Landroid/content/ComponentName;)Landroid/content/Intent;

    iget-object v6, v0, Lcom/motorola/ccc/ota/ui/DownloadNotification;->mContext:Landroid/content/Context;

    const/4 v7, 0x0

    invoke-static {v6, v7, v4, v5}, Landroid/app/PendingIntent;->getBroadcast(Landroid/content/Context;ILandroid/content/Intent;I)Landroid/app/PendingIntent;

    move-result-object v4

    const v6, 0x7f0e0065

    invoke-virtual {v2, v6}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v2

    const v6, 0x7f060034

    invoke-static {v2, v6}, Lcom/motorola/ccc/ota/utils/NotificationUtils;->getActionBtnText(Ljava/lang/String;I)Landroid/text/Spannable;

    move-result-object v2

    const v6, 0x1080038

    invoke-virtual {v8, v6, v2, v4}, Landroidx/core/app/NotificationCompat$Builder;->addAction(ILjava/lang/CharSequence;Landroid/app/PendingIntent;)Landroidx/core/app/NotificationCompat$Builder;

    :cond_15
    invoke-direct/range {p0 .. p4}, Lcom/motorola/ccc/ota/ui/DownloadNotification;->getDownloadingText(JJ)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v8, v2}, Landroidx/core/app/NotificationCompat$Builder;->setSubText(Ljava/lang/CharSequence;)Landroidx/core/app/NotificationCompat$Builder;

    iget-object v2, v0, Lcom/motorola/ccc/ota/ui/DownloadNotification;->mContext:Landroid/content/Context;

    const/high16 v4, 0xc000000

    const/4 v6, 0x0

    invoke-static {v2, v6, v1, v4}, Landroid/app/PendingIntent;->getActivity(Landroid/content/Context;ILandroid/content/Intent;I)Landroid/app/PendingIntent;

    move-result-object v1

    invoke-virtual {v8, v1}, Landroidx/core/app/NotificationCompat$Builder;->setContentIntent(Landroid/app/PendingIntent;)Landroidx/core/app/NotificationCompat$Builder;

    invoke-static/range {p6 .. p6}, Lcom/motorola/ccc/ota/utils/NotificationUtils;->showSwipeAbleNotification(I)Z

    move-result v1

    if-eqz v1, :cond_16

    iget-object v1, v0, Lcom/motorola/ccc/ota/ui/DownloadNotification;->mContext:Landroid/content/Context;

    iget-object v2, v0, Lcom/motorola/ccc/ota/ui/DownloadNotification;->mSwipedReceiver:Landroid/content/BroadcastReceiver;

    invoke-static {v1, v2}, Lcom/motorola/ccc/ota/utils/NotificationUtils;->registerSwipeableNotificationReceiver(Landroid/content/Context;Landroid/content/BroadcastReceiver;)V

    new-instance v1, Landroid/content/Intent;

    const-string v2, "com.motorola.ccc.ota.ACTION_NOTIFICATION_SWIPED"

    invoke-direct {v1, v2}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    iget-object v2, v0, Lcom/motorola/ccc/ota/ui/DownloadNotification;->mContext:Landroid/content/Context;

    invoke-static {v2, v6, v1, v5}, Landroid/app/PendingIntent;->getBroadcast(Landroid/content/Context;ILandroid/content/Intent;I)Landroid/app/PendingIntent;

    move-result-object v1

    invoke-virtual {v8, v1}, Landroidx/core/app/NotificationCompat$Builder;->setDeleteIntent(Landroid/app/PendingIntent;)Landroidx/core/app/NotificationCompat$Builder;

    :cond_16
    new-instance v1, Landroid/os/Bundle;

    invoke-direct {v1}, Landroid/os/Bundle;-><init>()V

    const-string v2, "com.motorola.blur.service.blur.upgrade.bytes_total"

    invoke-virtual {v1, v2, v14, v15}, Landroid/os/Bundle;->putLong(Ljava/lang/String;J)V

    const-string v2, "com.motorola.ccc.ota.download_percentage"

    invoke-virtual {v1, v2, v12, v13}, Landroid/os/Bundle;->putLong(Ljava/lang/String;J)V

    const-string v2, "com.motorola.blur.service.blur.upgrade.location_type"

    invoke-virtual {v1, v2, v3}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    const-string v2, "com.motorola.blur.service.blur.upgrade.download.deferred"

    move/from16 v3, p6

    move-object v4, v8

    invoke-virtual {v1, v2, v3}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    const-string v2, "com.motorola.app.download.wifionly"

    move/from16 v5, p7

    invoke-virtual {v1, v2, v5}, Landroid/os/Bundle;->putBoolean(Ljava/lang/String;Z)V

    const-string v2, "com.motorola.blur.service.blur.upgrade.download.on_wifi"

    move/from16 v5, p8

    invoke-virtual {v1, v2, v5}, Landroid/os/Bundle;->putBoolean(Ljava/lang/String;Z)V

    const-string v2, "NOTIFICATION_TYPE"

    const-string v5, "DownloadProgress"

    invoke-virtual {v1, v2, v5}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v4, v1}, Landroidx/core/app/NotificationCompat$Builder;->setExtras(Landroid/os/Bundle;)Landroidx/core/app/NotificationCompat$Builder;

    invoke-virtual {v4}, Landroidx/core/app/NotificationCompat$Builder;->build()Landroid/app/Notification;

    move-result-object v1

    invoke-static/range {p6 .. p6}, Lcom/motorola/ccc/ota/utils/NotificationUtils;->showSwipeAbleNotification(I)Z

    move-result v2

    if-nez v2, :cond_17

    iget v2, v1, Landroid/app/Notification;->flags:I

    or-int/lit8 v2, v2, 0x2

    iput v2, v1, Landroid/app/Notification;->flags:I

    :cond_17
    iget-object v0, v0, Lcom/motorola/ccc/ota/ui/DownloadNotification;->mNotificationMgr:Landroid/app/NotificationManager;

    const/16 v2, 0x6c1

    invoke-virtual {v0, v2, v1}, Landroid/app/NotificationManager;->notify(ILandroid/app/Notification;)V

    return-void
.end method
