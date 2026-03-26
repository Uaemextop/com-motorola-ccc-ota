.class public Lcom/motorola/ccc/ota/ui/NotificationHandler;
.super Ljava/lang/Object;
.source "NotificationHandler.java"


# instance fields
.field private botaSettings:Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

.field private channelId:Ljava/lang/String;

.field private mContext:Landroid/content/Context;

.field private mNotificationMgr:Landroid/app/NotificationManager;

.field private mNotifier:Lcom/motorola/ccc/ota/ui/DownloadNotification;

.field mResource:Landroid/content/res/Resources;

.field private mUpdateTypeInterface:Lcom/motorola/ccc/ota/ui/updateType/UpdateType$UpdateTypeInterface;

.field private text:Ljava/lang/String;

.field private title:Ljava/lang/String;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 1

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/motorola/ccc/ota/ui/NotificationHandler;->mContext:Landroid/content/Context;

    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object p1

    iput-object p1, p0, Lcom/motorola/ccc/ota/ui/NotificationHandler;->mResource:Landroid/content/res/Resources;

    iget-object p1, p0, Lcom/motorola/ccc/ota/ui/NotificationHandler;->mContext:Landroid/content/Context;

    const-string v0, "notification"

    invoke-virtual {p1, v0}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Landroid/app/NotificationManager;

    iput-object p1, p0, Lcom/motorola/ccc/ota/ui/NotificationHandler;->mNotificationMgr:Landroid/app/NotificationManager;

    invoke-static {}, Lcom/motorola/ccc/ota/ui/NotificationChannelCreator;->getUrgentNotificationChannelId()Ljava/lang/String;

    move-result-object p1

    iput-object p1, p0, Lcom/motorola/ccc/ota/ui/NotificationHandler;->channelId:Ljava/lang/String;

    new-instance p1, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    invoke-direct {p1}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;-><init>()V

    iput-object p1, p0, Lcom/motorola/ccc/ota/ui/NotificationHandler;->botaSettings:Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    sget-object v0, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->METADATA:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    invoke-virtual {p1, v0}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->getString(Lcom/motorola/otalib/common/settings/ISetting;)Ljava/lang/String;

    move-result-object p1

    invoke-static {p1}, Lcom/motorola/ccc/ota/ui/UpdaterUtils;->getUpdateType(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    invoke-static {p1}, Lcom/motorola/ccc/ota/ui/updateType/UpdateType;->getUpdateType(Ljava/lang/String;)Lcom/motorola/ccc/ota/ui/updateType/UpdateType$UpdateTypeInterface;

    move-result-object p1

    iput-object p1, p0, Lcom/motorola/ccc/ota/ui/NotificationHandler;->mUpdateTypeInterface:Lcom/motorola/ccc/ota/ui/updateType/UpdateType$UpdateTypeInterface;

    return-void
.end method


# virtual methods
.method public buildNotification(Ljava/lang/String;Ljava/lang/String;Landroid/app/PendingIntent;Landroid/content/Intent;)Landroidx/core/app/NotificationCompat$Builder;
    .locals 3

    invoke-static {p4}, Lcom/motorola/ccc/ota/ui/UpdaterUtils;->getUpgradeInfoAfterOTAUpdate(Landroid/content/Intent;)Lcom/motorola/ccc/ota/ui/UpdaterUtils$UpgradeInfo;

    move-result-object p4

    if-eqz p4, :cond_0

    invoke-virtual {p4}, Lcom/motorola/ccc/ota/ui/UpdaterUtils$UpgradeInfo;->getUpdateTypeData()Ljava/lang/String;

    move-result-object p4

    invoke-static {p4}, Lcom/motorola/ccc/ota/ui/updateType/UpdateType;->getUpdateType(Ljava/lang/String;)Lcom/motorola/ccc/ota/ui/updateType/UpdateType$UpdateTypeInterface;

    move-result-object p4

    iput-object p4, p0, Lcom/motorola/ccc/ota/ui/NotificationHandler;->mUpdateTypeInterface:Lcom/motorola/ccc/ota/ui/updateType/UpdateType$UpdateTypeInterface;

    :cond_0
    new-instance p4, Ljava/lang/StringBuilder;

    const-string v0, "<b>"

    invoke-direct {p4, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p4, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    new-instance p4, Landroidx/core/app/NotificationCompat$Builder;

    iget-object v0, p0, Lcom/motorola/ccc/ota/ui/NotificationHandler;->mContext:Landroid/content/Context;

    iget-object v1, p0, Lcom/motorola/ccc/ota/ui/NotificationHandler;->channelId:Ljava/lang/String;

    invoke-direct {p4, v0, v1}, Landroidx/core/app/NotificationCompat$Builder;-><init>(Landroid/content/Context;Ljava/lang/String;)V

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v0

    invoke-virtual {p4, v0, v1}, Landroidx/core/app/NotificationCompat$Builder;->setWhen(J)Landroidx/core/app/NotificationCompat$Builder;

    move-result-object v0

    const v1, 0x7f0800f4

    invoke-virtual {v0, v1}, Landroidx/core/app/NotificationCompat$Builder;->setSmallIcon(I)Landroidx/core/app/NotificationCompat$Builder;

    move-result-object v0

    iget-object v1, p0, Lcom/motorola/ccc/ota/ui/NotificationHandler;->mResource:Landroid/content/res/Resources;

    iget-object v2, p0, Lcom/motorola/ccc/ota/ui/NotificationHandler;->mUpdateTypeInterface:Lcom/motorola/ccc/ota/ui/updateType/UpdateType$UpdateTypeInterface;

    invoke-interface {v2}, Lcom/motorola/ccc/ota/ui/updateType/UpdateType$UpdateTypeInterface;->getUpdateSpecificColor()I

    move-result v2

    iget-object p0, p0, Lcom/motorola/ccc/ota/ui/NotificationHandler;->mContext:Landroid/content/Context;

    invoke-virtual {p0}, Landroid/content/Context;->getTheme()Landroid/content/res/Resources$Theme;

    move-result-object p0

    invoke-virtual {v1, v2, p0}, Landroid/content/res/Resources;->getColor(ILandroid/content/res/Resources$Theme;)I

    move-result p0

    invoke-virtual {v0, p0}, Landroidx/core/app/NotificationCompat$Builder;->setColor(I)Landroidx/core/app/NotificationCompat$Builder;

    move-result-object p0

    const/4 v0, 0x0

    invoke-static {p1, v0}, Landroid/text/Html;->fromHtml(Ljava/lang/String;I)Landroid/text/Spanned;

    move-result-object p1

    invoke-virtual {p0, p1}, Landroidx/core/app/NotificationCompat$Builder;->setContentTitle(Ljava/lang/CharSequence;)Landroidx/core/app/NotificationCompat$Builder;

    move-result-object p0

    new-instance p1, Landroidx/core/app/NotificationCompat$BigTextStyle;

    invoke-direct {p1}, Landroidx/core/app/NotificationCompat$BigTextStyle;-><init>()V

    invoke-virtual {p1, p2}, Landroidx/core/app/NotificationCompat$BigTextStyle;->bigText(Ljava/lang/CharSequence;)Landroidx/core/app/NotificationCompat$BigTextStyle;

    move-result-object p1

    invoke-virtual {p0, p1}, Landroidx/core/app/NotificationCompat$Builder;->setStyle(Landroidx/core/app/NotificationCompat$Style;)Landroidx/core/app/NotificationCompat$Builder;

    move-result-object p0

    invoke-virtual {p0, p3}, Landroidx/core/app/NotificationCompat$Builder;->setContentIntent(Landroid/app/PendingIntent;)Landroidx/core/app/NotificationCompat$Builder;

    move-result-object p0

    const/4 p1, 0x1

    invoke-virtual {p0, p1}, Landroidx/core/app/NotificationCompat$Builder;->setLocalOnly(Z)Landroidx/core/app/NotificationCompat$Builder;

    move-result-object p0

    const-string p1, "alarm"

    invoke-virtual {p0, p1}, Landroidx/core/app/NotificationCompat$Builder;->setCategory(Ljava/lang/String;)Landroidx/core/app/NotificationCompat$Builder;

    return-object p4
.end method

.method public cancel()V
    .locals 1

    iget-object p0, p0, Lcom/motorola/ccc/ota/ui/NotificationHandler;->mNotificationMgr:Landroid/app/NotificationManager;

    const/16 v0, 0x6c1

    invoke-virtual {p0, v0}, Landroid/app/NotificationManager;->cancel(I)V

    return-void
.end method

.method public sendWiFiNotification()V
    .locals 11

    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "<b>"

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v2, p0, Lcom/motorola/ccc/ota/ui/NotificationHandler;->mUpdateTypeInterface:Lcom/motorola/ccc/ota/ui/updateType/UpdateType$UpdateTypeInterface;

    invoke-interface {v2}, Lcom/motorola/ccc/ota/ui/updateType/UpdateType$UpdateTypeInterface;->getDownloadNotificationTitle()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/motorola/ccc/ota/ui/NotificationHandler;->title:Ljava/lang/String;

    iget-object v0, p0, Lcom/motorola/ccc/ota/ui/NotificationHandler;->mResource:Landroid/content/res/Resources;

    const v1, 0x7f0e00d6

    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/motorola/ccc/ota/ui/NotificationHandler;->text:Ljava/lang/String;

    new-instance v0, Landroid/content/Intent;

    invoke-direct {v0}, Landroid/content/Intent;-><init>()V

    const-string v1, "android.settings.WIFI_SETTINGS"

    invoke-virtual {v0, v1}, Landroid/content/Intent;->setAction(Ljava/lang/String;)Landroid/content/Intent;

    const/high16 v1, 0x20000000

    invoke-virtual {v0, v1}, Landroid/content/Intent;->setFlags(I)Landroid/content/Intent;

    iget-object v1, p0, Lcom/motorola/ccc/ota/ui/NotificationHandler;->mContext:Landroid/content/Context;

    const/high16 v2, 0x14000000

    const/4 v3, 0x0

    invoke-static {v1, v3, v0, v2}, Landroid/app/PendingIntent;->getActivity(Landroid/content/Context;ILandroid/content/Intent;I)Landroid/app/PendingIntent;

    move-result-object v0

    invoke-static {}, Lcom/motorola/ccc/ota/utils/BuildPropReader;->isBotaATT()Z

    move-result v1

    const/high16 v2, 0x4000000

    if-eqz v1, :cond_1

    invoke-static {}, Lcom/motorola/ccc/ota/ui/UpdaterUtils;->isWifiOnlyPkg()Z

    move-result v1

    if-nez v1, :cond_1

    invoke-static {}, Lcom/motorola/ccc/ota/utils/BuildPropReader;->isStreamingUpdate()Z

    move-result v1

    if-eqz v1, :cond_0

    new-instance v1, Landroid/content/Intent;

    const-string v4, "com.motorola.ccc.ota.Actions.USER_RESUME_STREAMING_DOWNLOAD_ON_CELLULAR"

    invoke-direct {v1, v4}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    goto :goto_0

    :cond_0
    new-instance v1, Landroid/content/Intent;

    const-string v4, "com.motorola.ccc.ota.Actions.USER_RESUME_DOWNLOAD_ON_CELLULAR"

    invoke-direct {v1, v4}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    :goto_0
    new-instance v4, Landroid/content/ComponentName;

    invoke-static {}, Lcom/motorola/ccc/ota/env/OtaApplication;->getGlobalContext()Landroid/content/Context;

    move-result-object v5

    const-class v6, Lcom/motorola/ccc/ota/ui/UpdateReceiver;

    invoke-direct {v4, v5, v6}, Landroid/content/ComponentName;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    invoke-virtual {v1, v4}, Landroid/content/Intent;->setComponent(Landroid/content/ComponentName;)Landroid/content/Intent;

    iget-object v4, p0, Lcom/motorola/ccc/ota/ui/NotificationHandler;->mContext:Landroid/content/Context;

    invoke-static {v4, v3, v1, v2}, Landroid/app/PendingIntent;->getBroadcast(Landroid/content/Context;ILandroid/content/Intent;I)Landroid/app/PendingIntent;

    move-result-object v1

    const v2, 0x7f0e0177

    const v4, 0x1080024

    goto :goto_2

    :cond_1
    invoke-static {}, Lcom/motorola/ccc/ota/ui/UpdaterUtils;->showCancelOption()Z

    move-result v1

    if-eqz v1, :cond_3

    invoke-static {}, Lcom/motorola/ccc/ota/utils/BuildPropReader;->isStreamingUpdate()Z

    move-result v1

    if-eqz v1, :cond_2

    new-instance v1, Landroid/content/Intent;

    const-string v4, "com.motorola.ccc.ota.Actions.USER_CANCEL_BACKGROUND_INSTALL"

    invoke-direct {v1, v4}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    goto :goto_1

    :cond_2
    new-instance v1, Landroid/content/Intent;

    const-string v4, "com.motorola.ccc.ota.Actions.USER_CANCEL_DOWNLOAD"

    invoke-direct {v1, v4}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    :goto_1
    new-instance v4, Landroid/content/ComponentName;

    invoke-static {}, Lcom/motorola/ccc/ota/env/OtaApplication;->getGlobalContext()Landroid/content/Context;

    move-result-object v5

    const-class v6, Lcom/motorola/ccc/ota/ui/UpdateReceiver;

    invoke-direct {v4, v5, v6}, Landroid/content/ComponentName;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    invoke-virtual {v1, v4}, Landroid/content/Intent;->setComponent(Landroid/content/ComponentName;)Landroid/content/Intent;

    iget-object v4, p0, Lcom/motorola/ccc/ota/ui/NotificationHandler;->mContext:Landroid/content/Context;

    invoke-static {v4, v3, v1, v2}, Landroid/app/PendingIntent;->getBroadcast(Landroid/content/Context;ILandroid/content/Intent;I)Landroid/app/PendingIntent;

    move-result-object v1

    const v4, 0x7f0800cb

    const v2, 0x7f0e0064

    goto :goto_2

    :cond_3
    new-instance v1, Landroid/content/Intent;

    const-string v4, "com.motorola.ccc.ota.Action.USER_DEFERERD_WIFI_SETUP"

    invoke-direct {v1, v4}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    new-instance v4, Landroid/content/ComponentName;

    invoke-static {}, Lcom/motorola/ccc/ota/env/OtaApplication;->getGlobalContext()Landroid/content/Context;

    move-result-object v5

    const-class v6, Lcom/motorola/ccc/ota/ui/UpdateReceiver;

    invoke-direct {v4, v5, v6}, Landroid/content/ComponentName;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    invoke-virtual {v1, v4}, Landroid/content/Intent;->setComponent(Landroid/content/ComponentName;)Landroid/content/Intent;

    iget-object v4, p0, Lcom/motorola/ccc/ota/ui/NotificationHandler;->mContext:Landroid/content/Context;

    invoke-static {v4, v3, v1, v2}, Landroid/app/PendingIntent;->getBroadcast(Landroid/content/Context;ILandroid/content/Intent;I)Landroid/app/PendingIntent;

    move-result-object v1

    const v4, 0x7f0800ce

    const v2, 0x7f0e011c

    :goto_2
    iget-object v5, p0, Lcom/motorola/ccc/ota/ui/NotificationHandler;->mResource:Landroid/content/res/Resources;

    const v6, 0x7f0e01fd

    invoke-virtual {v5, v6}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v5

    invoke-static {}, Lcom/motorola/ccc/ota/utils/BuildPropReader;->isBotaATT()Z

    move-result v6

    if-eqz v6, :cond_4

    iget-object v5, p0, Lcom/motorola/ccc/ota/ui/NotificationHandler;->mResource:Landroid/content/res/Resources;

    const v6, 0x7f0e00a1

    invoke-virtual {v5, v6}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v5

    :cond_4
    new-instance v6, Landroidx/core/app/NotificationCompat$Builder;

    iget-object v7, p0, Lcom/motorola/ccc/ota/ui/NotificationHandler;->mContext:Landroid/content/Context;

    iget-object v8, p0, Lcom/motorola/ccc/ota/ui/NotificationHandler;->channelId:Ljava/lang/String;

    invoke-direct {v6, v7, v8}, Landroidx/core/app/NotificationCompat$Builder;-><init>(Landroid/content/Context;Ljava/lang/String;)V

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v7

    invoke-virtual {v6, v7, v8}, Landroidx/core/app/NotificationCompat$Builder;->setWhen(J)Landroidx/core/app/NotificationCompat$Builder;

    move-result-object v7

    const v8, 0x7f0800f4

    invoke-virtual {v7, v8}, Landroidx/core/app/NotificationCompat$Builder;->setSmallIcon(I)Landroidx/core/app/NotificationCompat$Builder;

    move-result-object v7

    iget-object v8, p0, Lcom/motorola/ccc/ota/ui/NotificationHandler;->mResource:Landroid/content/res/Resources;

    iget-object v9, p0, Lcom/motorola/ccc/ota/ui/NotificationHandler;->mUpdateTypeInterface:Lcom/motorola/ccc/ota/ui/updateType/UpdateType$UpdateTypeInterface;

    invoke-interface {v9}, Lcom/motorola/ccc/ota/ui/updateType/UpdateType$UpdateTypeInterface;->getUpdateSpecificColor()I

    move-result v9

    iget-object v10, p0, Lcom/motorola/ccc/ota/ui/NotificationHandler;->mContext:Landroid/content/Context;

    invoke-virtual {v10}, Landroid/content/Context;->getTheme()Landroid/content/res/Resources$Theme;

    move-result-object v10

    invoke-virtual {v8, v9, v10}, Landroid/content/res/Resources;->getColor(ILandroid/content/res/Resources$Theme;)I

    move-result v8

    invoke-virtual {v7, v8}, Landroidx/core/app/NotificationCompat$Builder;->setColor(I)Landroidx/core/app/NotificationCompat$Builder;

    move-result-object v7

    iget-object v8, p0, Lcom/motorola/ccc/ota/ui/NotificationHandler;->title:Ljava/lang/String;

    invoke-static {v8, v3}, Landroid/text/Html;->fromHtml(Ljava/lang/String;I)Landroid/text/Spanned;

    move-result-object v3

    invoke-virtual {v7, v3}, Landroidx/core/app/NotificationCompat$Builder;->setContentTitle(Ljava/lang/CharSequence;)Landroidx/core/app/NotificationCompat$Builder;

    move-result-object v3

    iget-object v7, p0, Lcom/motorola/ccc/ota/ui/NotificationHandler;->text:Ljava/lang/String;

    invoke-virtual {v3, v7}, Landroidx/core/app/NotificationCompat$Builder;->setContentText(Ljava/lang/CharSequence;)Landroidx/core/app/NotificationCompat$Builder;

    move-result-object v3

    new-instance v7, Landroidx/core/app/NotificationCompat$BigTextStyle;

    invoke-direct {v7}, Landroidx/core/app/NotificationCompat$BigTextStyle;-><init>()V

    iget-object v8, p0, Lcom/motorola/ccc/ota/ui/NotificationHandler;->text:Ljava/lang/String;

    invoke-virtual {v7, v8}, Landroidx/core/app/NotificationCompat$BigTextStyle;->bigText(Ljava/lang/CharSequence;)Landroidx/core/app/NotificationCompat$BigTextStyle;

    move-result-object v7

    invoke-virtual {v3, v7}, Landroidx/core/app/NotificationCompat$Builder;->setStyle(Landroidx/core/app/NotificationCompat$Style;)Landroidx/core/app/NotificationCompat$Builder;

    move-result-object v3

    iget-object v7, p0, Lcom/motorola/ccc/ota/ui/NotificationHandler;->mResource:Landroid/content/res/Resources;

    invoke-virtual {v7, v2}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v2

    const v7, 0x7f060034

    invoke-static {v2, v7}, Lcom/motorola/ccc/ota/utils/NotificationUtils;->getActionBtnText(Ljava/lang/String;I)Landroid/text/Spannable;

    move-result-object v2

    invoke-virtual {v3, v4, v2, v1}, Landroidx/core/app/NotificationCompat$Builder;->addAction(ILjava/lang/CharSequence;Landroid/app/PendingIntent;)Landroidx/core/app/NotificationCompat$Builder;

    move-result-object v1

    const v2, 0x7f0800d1

    invoke-static {v5, v7}, Lcom/motorola/ccc/ota/utils/NotificationUtils;->getActionBtnText(Ljava/lang/String;I)Landroid/text/Spannable;

    move-result-object v3

    invoke-virtual {v1, v2, v3, v0}, Landroidx/core/app/NotificationCompat$Builder;->addAction(ILjava/lang/CharSequence;Landroid/app/PendingIntent;)Landroidx/core/app/NotificationCompat$Builder;

    move-result-object v1

    invoke-virtual {v1, v0}, Landroidx/core/app/NotificationCompat$Builder;->setContentIntent(Landroid/app/PendingIntent;)Landroidx/core/app/NotificationCompat$Builder;

    move-result-object v0

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Landroidx/core/app/NotificationCompat$Builder;->setLocalOnly(Z)Landroidx/core/app/NotificationCompat$Builder;

    move-result-object v0

    const-string v1, "alarm"

    invoke-virtual {v0, v1}, Landroidx/core/app/NotificationCompat$Builder;->setCategory(Ljava/lang/String;)Landroidx/core/app/NotificationCompat$Builder;

    new-instance v0, Landroid/os/Bundle;

    invoke-direct {v0}, Landroid/os/Bundle;-><init>()V

    const-string v1, "NOTIFICATION_TYPE"

    const-string v2, "WifiNotification"

    invoke-virtual {v0, v1, v2}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v6, v0}, Landroidx/core/app/NotificationCompat$Builder;->setExtras(Landroid/os/Bundle;)Landroidx/core/app/NotificationCompat$Builder;

    invoke-virtual {v6}, Landroidx/core/app/NotificationCompat$Builder;->build()Landroid/app/Notification;

    move-result-object v0

    iget v1, v0, Landroid/app/Notification;->flags:I

    or-int/lit8 v1, v1, 0x2

    iput v1, v0, Landroid/app/Notification;->flags:I

    iget-object p0, p0, Lcom/motorola/ccc/ota/ui/NotificationHandler;->mNotificationMgr:Landroid/app/NotificationManager;

    const/16 v1, 0x6c1

    invoke-virtual {p0, v1, v0}, Landroid/app/NotificationManager;->notify(ILandroid/app/Notification;)V

    return-void
.end method
