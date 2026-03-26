.class public Lcom/motorola/ccc/ota/utils/NotificationUtils;
.super Ljava/lang/Object;
.source "NotificationUtils.java"


# static fields
.field public static final KEY_DOWNLOAD:Ljava/lang/String; = "Download"

.field public static final KEY_INSTALL:Ljava/lang/String; = "Install"

.field public static final KEY_IS_NOTIFY_LOW_MEMORY:Ljava/lang/String; = "NotificationLowMemory"

.field public static final KEY_MERGE_RESTART:Ljava/lang/String; = "MergeRestart"

.field public static final KEY_NOTIFICATION_BUILDER_ACTION_INTENT:Ljava/lang/String; = "BuilderActionIntent"

.field public static final KEY_NOTIFICATION_INTENT:Ljava/lang/String; = "NotificationIntent"

.field public static final KEY_NOTIFICATION_MESSAGE:Ljava/lang/String; = "Message"

.field public static final KEY_NOTIFICATION_RESPONSE_AS_BROADCAST:Ljava/lang/String; = "IntentCallBack"

.field public static final KEY_NOTIFICATION_TARGET_INTENT:Ljava/lang/String; = "PendingIntent"

.field public static final KEY_NOTIFICATION_TIMER_EXPIRY:Ljava/lang/String; = "NotificationTimerExpiry"

.field public static final KEY_NOTIFICATION_TITLE:Ljava/lang/String; = "Title"

.field public static final KEY_NOTIFY_DOWNLOAD_STATUS:Ljava/lang/String; = "NotificationDownloadStatus"

.field public static final KEY_NOTIFY_MERGE_RESTART:Ljava/lang/String; = "MergeRestartNotification"

.field public static final KEY_NOTIFY_TYPE_BG_INSTALL:Ljava/lang/String; = "BGInstall"

.field public static final KEY_NOTIFY_TYPE_DL_PROGRESS:Ljava/lang/String; = "DownloadProgress"

.field public static final KEY_NOTIFY_TYPE_SERVICE:Ljava/lang/String; = "NotificationService"

.field public static final KEY_NOTIFY_TYPE_STATUS_VERIFY:Ljava/lang/String; = "StatusVerify"

.field public static final KEY_NOTIFY_WIFI_NOTIFICATION:Ljava/lang/String; = "WifiNotification"

.field public static final KEY_PROGRESS_PERCENTAGE:Ljava/lang/String; = "KeyProgressPercentage"

.field public static final KEY_RESPOND_FOR_SYSTEM_UPDATES:Ljava/lang/String; = "RespondForSystemUpdates"

.field public static final KEY_RESTART:Ljava/lang/String; = "Restart"

.field public static final KEY_UPDATE:Ljava/lang/String; = "UpdateKey"

.field public static final KEY_UPDATE_NOTIFICATION_SERVICE_TYPE:Ljava/lang/String; = "UpdateNotificationServiceType"

.field public static final OTA_NOTIFICATION_ID:I = 0x6c1

.field public static final SMART_UPDATE_NOTIFICATION:I = 0x5

.field public static final UPDATE_STATUS_NOTIFICATION:I = 0x4

.field private static final settings:Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    new-instance v0, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    invoke-direct {v0}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;-><init>()V

    sput-object v0, Lcom/motorola/ccc/ota/utils/NotificationUtils;->settings:Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static cancelOtaNotification()V
    .locals 3

    const-string v0, "OtaApp"

    const-string v1, "cancelOtaNotification"

    invoke-static {v0, v1}, Lcom/motorola/ccc/ota/utils/Logger;->debug(Ljava/lang/String;Ljava/lang/String;)V

    invoke-static {}, Lcom/motorola/ccc/ota/env/OtaApplication;->getGlobalContext()Landroid/content/Context;

    move-result-object v0

    const-string v1, "notification"

    invoke-virtual {v0, v1}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/app/NotificationManager;

    const/16 v2, 0x6c1

    invoke-virtual {v1, v2}, Landroid/app/NotificationManager;->cancel(I)V

    invoke-static {v0}, Lcom/motorola/ccc/ota/utils/NotificationUtils;->stopNotificationService(Landroid/content/Context;)V

    return-void
.end method

.method public static cancelSmartUpdateNotification()V
    .locals 2

    const-string v0, "OtaApp"

    const-string v1, "cancelSmartUpdateNotification"

    invoke-static {v0, v1}, Lcom/motorola/ccc/ota/utils/Logger;->debug(Ljava/lang/String;Ljava/lang/String;)V

    invoke-static {}, Lcom/motorola/ccc/ota/env/OtaApplication;->getGlobalContext()Landroid/content/Context;

    move-result-object v0

    const-string v1, "notification"

    invoke-virtual {v0, v1}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/app/NotificationManager;

    const/4 v1, 0x5

    invoke-virtual {v0, v1}, Landroid/app/NotificationManager;->cancel(I)V

    return-void
.end method

.method public static clearNextPromptDetails(Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;)V
    .locals 1

    sget-object v0, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->ACTIVITY_NEXT_PROMPT:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    invoke-virtual {p0, v0}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->removeConfig(Lcom/motorola/otalib/common/settings/ISetting;)V

    sget-object v0, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->NOTIFICATION_NEXT_PROMPT:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    invoke-virtual {p0, v0}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->removeConfig(Lcom/motorola/otalib/common/settings/ISetting;)V

    return-void
.end method

.method public static displayMergeRestartNotification()V
    .locals 7

    const-string v0, "OtaApp"

    const-string v1, "displayMergeRestartNotification"

    invoke-static {v0, v1}, Lcom/motorola/ccc/ota/utils/Logger;->debug(Ljava/lang/String;Ljava/lang/String;)V

    invoke-static {}, Lcom/motorola/ccc/ota/env/OtaApplication;->getGlobalContext()Landroid/content/Context;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    const v2, 0x7f0e0128

    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v2

    const v3, 0x7f0e0127

    invoke-virtual {v1, v3}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v1

    new-instance v3, Landroid/content/Intent;

    const-class v4, Lcom/motorola/ccc/ota/ui/BaseActivity;

    invoke-direct {v3, v0, v4}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    sget-object v4, Lcom/motorola/ccc/ota/utils/UpgradeUtilConstants$FragmentTypeEnum;->MERGE_RESTART_FRAGMENT:Lcom/motorola/ccc/ota/utils/UpgradeUtilConstants$FragmentTypeEnum;

    invoke-virtual {v4}, Lcom/motorola/ccc/ota/utils/UpgradeUtilConstants$FragmentTypeEnum;->toString()Ljava/lang/String;

    move-result-object v4

    const-string v5, "fragment_type"

    invoke-virtual {v3, v5, v4}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    const/high16 v4, 0x10000000

    invoke-virtual {v3, v4}, Landroid/content/Intent;->addFlags(I)Landroid/content/Intent;

    const/high16 v4, 0x14000000

    const/4 v5, 0x0

    invoke-static {v0, v5, v3, v4}, Landroid/app/PendingIntent;->getActivity(Landroid/content/Context;ILandroid/content/Intent;I)Landroid/app/PendingIntent;

    move-result-object v4

    new-instance v6, Lcom/motorola/ccc/ota/ui/NotificationHandler;

    invoke-direct {v6, v0}, Lcom/motorola/ccc/ota/ui/NotificationHandler;-><init>(Landroid/content/Context;)V

    invoke-virtual {v6, v2, v1, v4, v3}, Lcom/motorola/ccc/ota/ui/NotificationHandler;->buildNotification(Ljava/lang/String;Ljava/lang/String;Landroid/app/PendingIntent;Landroid/content/Intent;)Landroidx/core/app/NotificationCompat$Builder;

    move-result-object v1

    const-string v2, "alarm"

    invoke-virtual {v1, v2}, Landroidx/core/app/NotificationCompat$Builder;->setCategory(Ljava/lang/String;)Landroidx/core/app/NotificationCompat$Builder;

    new-instance v2, Landroid/content/Intent;

    const-string v4, "com.motorola.blur.service.blur.Actions.MERGE_RESTART_UPGRADE"

    invoke-direct {v2, v4}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    const/high16 v4, 0xc000000

    invoke-static {v0, v5, v2, v4}, Landroid/app/PendingIntent;->getBroadcast(Landroid/content/Context;ILandroid/content/Intent;I)Landroid/app/PendingIntent;

    move-result-object v2

    new-instance v4, Landroid/os/Bundle;

    invoke-direct {v4}, Landroid/os/Bundle;-><init>()V

    const-string v5, "NotificationIntent"

    invoke-virtual {v4, v5, v3}, Landroid/os/Bundle;->putParcelable(Ljava/lang/String;Landroid/os/Parcelable;)V

    const-string v3, "NOTIFICATION_TYPE"

    const-string v5, "MergeRestartNotification"

    invoke-virtual {v4, v3, v5}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v1, v4}, Landroidx/core/app/NotificationCompat$Builder;->setExtras(Landroid/os/Bundle;)Landroidx/core/app/NotificationCompat$Builder;

    const v3, 0x7f0e0170

    invoke-virtual {v0, v3}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v3

    const v4, 0x7f0800cf

    invoke-virtual {v1, v4, v3, v2}, Landroidx/core/app/NotificationCompat$Builder;->addAction(ILjava/lang/CharSequence;Landroid/app/PendingIntent;)Landroidx/core/app/NotificationCompat$Builder;

    invoke-virtual {v1}, Landroidx/core/app/NotificationCompat$Builder;->build()Landroid/app/Notification;

    move-result-object v1

    iget v2, v1, Landroid/app/Notification;->flags:I

    or-int/lit8 v2, v2, 0x20

    iput v2, v1, Landroid/app/Notification;->flags:I

    const-string v2, "notification"

    invoke-virtual {v0, v2}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/app/NotificationManager;

    const/16 v2, 0x6c1

    invoke-virtual {v0, v2, v1}, Landroid/app/NotificationManager;->notify(ILandroid/app/Notification;)V

    return-void
.end method

.method public static displayNotification(Landroid/content/Context;Ljava/lang/String;JLandroid/content/Intent;Lcom/motorola/ccc/ota/ui/UpdaterUtils$UpgradeInfo;)V
    .locals 9

    sget-object v2, Lcom/motorola/ccc/ota/utils/NotificationUtils;->settings:Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    sget-object v3, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->METADATA:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    invoke-virtual {v2, v3}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->getString(Lcom/motorola/otalib/common/settings/ISetting;)Ljava/lang/String;

    move-result-object v3

    invoke-static {v3}, Lcom/motorola/ccc/ota/ui/UpdaterUtils;->getUpdateType(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    const-string v4, "com.motorola.blur.service.blur.upgrade.version"

    invoke-virtual {p4, v4}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    invoke-static {v2}, Lcom/motorola/ccc/ota/ui/updateType/UpdateType;->getUpdateType(Ljava/lang/String;)Lcom/motorola/ccc/ota/ui/updateType/UpdateType$UpdateTypeInterface;

    move-result-object v2

    sget-object v4, Ljava/util/concurrent/TimeUnit;->MILLISECONDS:Ljava/util/concurrent/TimeUnit;

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v7

    sub-long v7, p2, v7

    invoke-virtual {v4, v7, v8}, Ljava/util/concurrent/TimeUnit;->toMinutes(J)J

    move-result-wide v7

    long-to-int v4, v7

    add-int/lit8 v4, v4, 0x1

    const-string v7, "Download"

    invoke-virtual {v7, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_0

    invoke-interface {v2}, Lcom/motorola/ccc/ota/ui/updateType/UpdateType$UpdateTypeInterface;->getPDLNotificationTitle()Ljava/lang/String;

    move-result-object v1

    invoke-interface {v2}, Lcom/motorola/ccc/ota/ui/updateType/UpdateType$UpdateTypeInterface;->getSystemUpdateAvailableNotificationText()Ljava/lang/String;

    move-result-object v2

    move-object v0, p0

    move-object v5, p4

    invoke-static/range {v0 .. v5}, Lcom/motorola/ccc/ota/utils/NotificationUtils;->fillSystemUpdateNotificationDetails(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;ILandroid/content/Intent;)Landroid/content/Intent;

    move-result-object v0

    goto :goto_0

    :cond_0
    const-string v3, "Restart"

    invoke-virtual {v3, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1

    invoke-static {p0, v6, v4, p4, p5}, Lcom/motorola/ccc/ota/utils/NotificationUtils;->fillRestartSystemNotificationDetails(Landroid/content/Context;Ljava/lang/String;ILandroid/content/Intent;Lcom/motorola/ccc/ota/ui/UpdaterUtils$UpgradeInfo;)Landroid/content/Intent;

    move-result-object v0

    goto :goto_0

    :cond_1
    invoke-interface {v2}, Lcom/motorola/ccc/ota/ui/updateType/UpdateType$UpdateTypeInterface;->getInstallationTitle()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, p5}, Lcom/motorola/ccc/ota/utils/NotificationUtils;->getInstallNotificationText(Lcom/motorola/ccc/ota/ui/updateType/UpdateType$UpdateTypeInterface;Lcom/motorola/ccc/ota/ui/UpdaterUtils$UpgradeInfo;)Ljava/lang/String;

    move-result-object v2

    move-object v0, p0

    move-object v1, v3

    move v3, v4

    move-object v4, p4

    move-object v5, v6

    invoke-static/range {v0 .. v5}, Lcom/motorola/ccc/ota/utils/NotificationUtils;->fillInstallSystemUpdateNotificationDetails(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;ILandroid/content/Intent;Ljava/lang/String;)Landroid/content/Intent;

    move-result-object v0

    :goto_0
    invoke-static {p0, v0}, Lcom/motorola/ccc/ota/utils/NotificationUtils;->startNotificationService(Landroid/content/Context;Landroid/content/Intent;)V

    return-void
.end method

.method public static displaySmartUpdateNotification(Landroid/content/Context;)V
    .locals 9

    const-string v0, "OtaApp"

    const-string v1, "displaySmartUpdateNotification"

    invoke-static {v0, v1}, Lcom/motorola/ccc/ota/utils/Logger;->debug(Ljava/lang/String;Ljava/lang/String;)V

    new-instance v0, Landroid/content/Intent;

    invoke-direct {v0}, Landroid/content/Intent;-><init>()V

    invoke-virtual {p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    const-class v2, Lcom/motorola/ccc/ota/ui/BaseActivity;

    invoke-virtual {v0, p0, v2}, Landroid/content/Intent;->setClass(Landroid/content/Context;Ljava/lang/Class;)Landroid/content/Intent;

    sget-object v2, Lcom/motorola/ccc/ota/utils/NotificationUtils;->settings:Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    invoke-static {v2}, Lcom/motorola/ccc/ota/utils/SmartUpdateUtils;->isSmartUpdateEnabledByUser(Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;)Z

    move-result v2

    if-eqz v2, :cond_0

    const v2, 0x7f0e01ae

    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v2

    const v3, 0x7f0e01ac

    invoke-virtual {v1, v3}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v1

    goto :goto_0

    :cond_0
    const v2, 0x7f0e01ad

    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v2

    const v3, 0x7f0e01ab

    invoke-virtual {v1, v3}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v1

    :goto_0
    sget-object v3, Lcom/motorola/ccc/ota/utils/UpgradeUtilConstants$FragmentTypeEnum;->SMART_UPDATE_FRAGMENT:Lcom/motorola/ccc/ota/utils/UpgradeUtilConstants$FragmentTypeEnum;

    invoke-virtual {v3}, Lcom/motorola/ccc/ota/utils/UpgradeUtilConstants$FragmentTypeEnum;->toString()Ljava/lang/String;

    move-result-object v3

    const-string v4, "fragment_type"

    invoke-virtual {v0, v4, v3}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    const-string v3, "notification_id"

    const/4 v4, 0x5

    invoke-virtual {v0, v3, v4}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    const/high16 v3, 0x14000000

    invoke-static {p0, v4, v0, v3}, Landroid/app/PendingIntent;->getActivity(Landroid/content/Context;ILandroid/content/Intent;I)Landroid/app/PendingIntent;

    move-result-object v3

    new-instance v5, Lcom/motorola/ccc/ota/ui/NotificationHandler;

    invoke-direct {v5, p0}, Lcom/motorola/ccc/ota/ui/NotificationHandler;-><init>(Landroid/content/Context;)V

    invoke-virtual {v5, v2, v1, v3, v0}, Lcom/motorola/ccc/ota/ui/NotificationHandler;->buildNotification(Ljava/lang/String;Ljava/lang/String;Landroid/app/PendingIntent;Landroid/content/Intent;)Landroidx/core/app/NotificationCompat$Builder;

    move-result-object v5

    const-string v6, "alarm"

    invoke-virtual {v5, v6}, Landroidx/core/app/NotificationCompat$Builder;->setCategory(Ljava/lang/String;)Landroidx/core/app/NotificationCompat$Builder;

    new-instance v6, Landroid/widget/RemoteViews;

    invoke-virtual {p0}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v7

    const v8, 0x7f0c0023

    invoke-direct {v6, v7, v8}, Landroid/widget/RemoteViews;-><init>(Ljava/lang/String;I)V

    const v7, 0x7f0901e5

    invoke-virtual {v6, v7, v2}, Landroid/widget/RemoteViews;->setTextViewText(ILjava/lang/CharSequence;)V

    const v2, 0x7f0901e4

    invoke-virtual {v6, v2, v1}, Landroid/widget/RemoteViews;->setTextViewText(ILjava/lang/CharSequence;)V

    new-instance v1, Landroidx/core/app/NotificationCompat$DecoratedCustomViewStyle;

    invoke-direct {v1}, Landroidx/core/app/NotificationCompat$DecoratedCustomViewStyle;-><init>()V

    invoke-virtual {v5, v1}, Landroidx/core/app/NotificationCompat$Builder;->setStyle(Landroidx/core/app/NotificationCompat$Style;)Landroidx/core/app/NotificationCompat$Builder;

    move-result-object v1

    invoke-virtual {v1, v6}, Landroidx/core/app/NotificationCompat$Builder;->setCustomContentView(Landroid/widget/RemoteViews;)Landroidx/core/app/NotificationCompat$Builder;

    const v1, 0x7f0e01aa

    invoke-virtual {p0, v1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v1

    const v2, 0x7f060034

    invoke-static {v1, v2}, Lcom/motorola/ccc/ota/utils/NotificationUtils;->getActionBtnText(Ljava/lang/String;I)Landroid/text/Spannable;

    move-result-object v1

    const v2, 0x7f0800cc

    invoke-virtual {v5, v2, v1, v3}, Landroidx/core/app/NotificationCompat$Builder;->addAction(ILjava/lang/CharSequence;Landroid/app/PendingIntent;)Landroidx/core/app/NotificationCompat$Builder;

    new-instance v1, Landroid/os/Bundle;

    invoke-direct {v1}, Landroid/os/Bundle;-><init>()V

    const-string v2, "NotificationIntent"

    invoke-virtual {v1, v2, v0}, Landroid/os/Bundle;->putParcelable(Ljava/lang/String;Landroid/os/Parcelable;)V

    invoke-virtual {v5, v1}, Landroidx/core/app/NotificationCompat$Builder;->setExtras(Landroid/os/Bundle;)Landroidx/core/app/NotificationCompat$Builder;

    invoke-virtual {v5}, Landroidx/core/app/NotificationCompat$Builder;->build()Landroid/app/Notification;

    move-result-object v0

    iget v1, v0, Landroid/app/Notification;->flags:I

    or-int/lit8 v1, v1, 0x10

    iput v1, v0, Landroid/app/Notification;->flags:I

    const-string v1, "notification"

    invoke-virtual {p0, v1}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Landroid/app/NotificationManager;

    invoke-virtual {p0, v4, v0}, Landroid/app/NotificationManager;->notify(ILandroid/app/Notification;)V

    return-void
.end method

.method public static displayUpdateStatusNotification(Landroid/content/Context;Landroid/content/Intent;)V
    .locals 13

    const-string v0, "displayUpdateStatusNotification"

    const-string v1, "OtaApp"

    invoke-static {v1, v0}, Lcom/motorola/ccc/ota/utils/Logger;->debug(Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    invoke-static {p1}, Lcom/motorola/ccc/ota/ui/UpdaterUtils;->getUpgradeInfoAfterOTAUpdate(Landroid/content/Intent;)Lcom/motorola/ccc/ota/ui/UpdaterUtils$UpgradeInfo;

    move-result-object v2

    if-nez v2, :cond_0

    return-void

    :cond_0
    const-class v3, Lcom/motorola/ccc/ota/ui/BaseActivity;

    invoke-virtual {p1, p0, v3}, Landroid/content/Intent;->setClass(Landroid/content/Context;Ljava/lang/Class;)Landroid/content/Intent;

    const-string v3, "com.motorola.blur.service.blur.upgrade.update_status"

    const/4 v4, 0x0

    invoke-virtual {p1, v3, v4}, Landroid/content/Intent;->getBooleanExtra(Ljava/lang/String;Z)Z

    move-result v3

    invoke-static {v3}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v5

    const-string v6, "fragment_type"

    if-eqz v5, :cond_2

    const v5, 0x7f0e01e2

    invoke-virtual {v0, v5}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v5

    sget-object v7, Lcom/motorola/ccc/ota/ui/updateType/UpdateType$DIFFUpdateType;->OS:Lcom/motorola/ccc/ota/ui/updateType/UpdateType$DIFFUpdateType;

    invoke-virtual {v7}, Lcom/motorola/ccc/ota/ui/updateType/UpdateType$DIFFUpdateType;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v2}, Lcom/motorola/ccc/ota/ui/UpdaterUtils$UpgradeInfo;->getUpdateTypeData()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v7, v8}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v7

    if-eqz v7, :cond_1

    invoke-static {}, Lcom/motorola/ccc/ota/utils/BuildPropReader;->getAndroidVersion()Ljava/lang/String;

    move-result-object v7

    filled-new-array {v7}, [Ljava/lang/Object;

    move-result-object v7

    const v8, 0x7f0e01e0

    invoke-virtual {v0, v8, v7}, Landroid/content/res/Resources;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    goto :goto_0

    :cond_1
    invoke-virtual {v2}, Lcom/motorola/ccc/ota/ui/UpdaterUtils$UpgradeInfo;->getDisplayVersion()Ljava/lang/String;

    move-result-object v7

    filled-new-array {v7}, [Ljava/lang/Object;

    move-result-object v7

    const v8, 0x7f0e01df

    invoke-virtual {v0, v8, v7}, Landroid/content/res/Resources;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    :goto_0
    const-string v7, "ota_update_completed"

    invoke-static {v3}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v8

    invoke-static {p0, v7, v8}, Lcom/motorola/ccc/ota/ui/UpdaterUtils;->updateMotorolaSettingsProvider(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)Z

    sget-object v7, Lcom/motorola/ccc/ota/utils/UpgradeUtilConstants$FragmentTypeEnum;->UPDATE_COMPLETE_FRAGMENT:Lcom/motorola/ccc/ota/utils/UpgradeUtilConstants$FragmentTypeEnum;

    invoke-virtual {v7}, Lcom/motorola/ccc/ota/utils/UpgradeUtilConstants$FragmentTypeEnum;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {p1, v6, v7}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    goto :goto_2

    :cond_2
    sget-object v5, Lcom/motorola/ccc/ota/utils/NotificationUtils;->settings:Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    sget-object v7, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->FLAG_IS_VITAL_UPDATE:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    invoke-virtual {v5, v7}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->getBoolean(Lcom/motorola/otalib/common/settings/ISetting;)Z

    move-result v5

    if-eqz v5, :cond_3

    const-class v0, Lcom/motorola/ccc/ota/ui/BaseActivity;

    invoke-virtual {p1, p0, v0}, Landroid/content/Intent;->setClass(Landroid/content/Context;Ljava/lang/Class;)Landroid/content/Intent;

    sget-object v0, Lcom/motorola/ccc/ota/utils/UpgradeUtilConstants$FragmentTypeEnum;->UPDATE_FAILED_FRAGMENT:Lcom/motorola/ccc/ota/utils/UpgradeUtilConstants$FragmentTypeEnum;

    invoke-virtual {v0}, Lcom/motorola/ccc/ota/utils/UpgradeUtilConstants$FragmentTypeEnum;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1, v6, v0}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    invoke-virtual {p0, p1}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    return-void

    :cond_3
    const v5, 0x7f0e01d6

    invoke-virtual {v0, v5}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v5

    invoke-static {p1}, Lcom/motorola/ccc/ota/ui/UpdaterUtils;->isMaxRetryCountReachedForVerizon(Landroid/content/Intent;)Z

    move-result v7

    if-eqz v7, :cond_4

    const-string v7, "2024.2"

    invoke-static {v7}, Lcom/motorola/otalib/common/utils/BuildPropertyUtils;->isProductWaveAtleastRefWave(Ljava/lang/String;)Z

    move-result v7

    if-nez v7, :cond_4

    const v7, 0x7f0e01ef

    invoke-virtual {v0, v7}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v0

    goto :goto_1

    :cond_4
    const-string v7, "MergeStatusFailure"

    invoke-virtual {p1, v7, v4}, Landroid/content/Intent;->getBooleanExtra(Ljava/lang/String;Z)Z

    move-result v7

    if-eqz v7, :cond_5

    const v5, 0x7f0e012e

    invoke-virtual {v0, v5}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v5

    const v7, 0x7f0e012d

    invoke-virtual {v0, v7}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v0

    goto :goto_1

    :cond_5
    const v7, 0x7f0e01d3

    invoke-virtual {v0, v7}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v0

    :goto_1
    sget-object v7, Lcom/motorola/ccc/ota/utils/UpgradeUtilConstants$FragmentTypeEnum;->UPDATE_FAILED_FRAGMENT:Lcom/motorola/ccc/ota/utils/UpgradeUtilConstants$FragmentTypeEnum;

    invoke-virtual {v7}, Lcom/motorola/ccc/ota/utils/UpgradeUtilConstants$FragmentTypeEnum;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {p1, v6, v7}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    :goto_2
    const/high16 v6, 0x14000000

    invoke-static {p0, v4, p1, v6}, Landroid/app/PendingIntent;->getActivity(Landroid/content/Context;ILandroid/content/Intent;I)Landroid/app/PendingIntent;

    move-result-object v4

    new-instance v6, Lcom/motorola/ccc/ota/ui/NotificationHandler;

    invoke-direct {v6, p0}, Lcom/motorola/ccc/ota/ui/NotificationHandler;-><init>(Landroid/content/Context;)V

    invoke-virtual {v6, v5, v0, v4, p1}, Lcom/motorola/ccc/ota/ui/NotificationHandler;->buildNotification(Ljava/lang/String;Ljava/lang/String;Landroid/app/PendingIntent;Landroid/content/Intent;)Landroidx/core/app/NotificationCompat$Builder;

    move-result-object v0

    const-string v6, "alarm"

    invoke-virtual {v0, v6}, Landroidx/core/app/NotificationCompat$Builder;->setCategory(Ljava/lang/String;)Landroidx/core/app/NotificationCompat$Builder;

    invoke-virtual {v3}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v6

    if-eqz v6, :cond_6

    const v6, 0x7f0e01e3

    invoke-virtual {p0, v6}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v6

    new-instance v7, Landroid/widget/RemoteViews;

    invoke-virtual {p0}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v8

    const v9, 0x7f0c0023

    invoke-direct {v7, v8, v9}, Landroid/widget/RemoteViews;-><init>(Ljava/lang/String;I)V

    const v8, 0x7f0901e5

    invoke-virtual {v7, v8, v5}, Landroid/widget/RemoteViews;->setTextViewText(ILjava/lang/CharSequence;)V

    const v9, 0x7f0901e4

    invoke-virtual {v7, v9, v6}, Landroid/widget/RemoteViews;->setTextViewText(ILjava/lang/CharSequence;)V

    new-instance v10, Landroid/widget/RemoteViews;

    invoke-virtual {p0}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v11

    const v12, 0x7f0c0024

    invoke-direct {v10, v11, v12}, Landroid/widget/RemoteViews;-><init>(Ljava/lang/String;I)V

    invoke-virtual {v10, v8, v5}, Landroid/widget/RemoteViews;->setTextViewText(ILjava/lang/CharSequence;)V

    invoke-virtual {v10, v9, v6}, Landroid/widget/RemoteViews;->setTextViewText(ILjava/lang/CharSequence;)V

    new-instance v5, Landroidx/core/app/NotificationCompat$DecoratedCustomViewStyle;

    invoke-direct {v5}, Landroidx/core/app/NotificationCompat$DecoratedCustomViewStyle;-><init>()V

    invoke-virtual {v0, v5}, Landroidx/core/app/NotificationCompat$Builder;->setStyle(Landroidx/core/app/NotificationCompat$Style;)Landroidx/core/app/NotificationCompat$Builder;

    move-result-object v5

    invoke-virtual {v5, v7}, Landroidx/core/app/NotificationCompat$Builder;->setCustomContentView(Landroid/widget/RemoteViews;)Landroidx/core/app/NotificationCompat$Builder;

    move-result-object v5

    invoke-virtual {v5, v10}, Landroidx/core/app/NotificationCompat$Builder;->setCustomBigContentView(Landroid/widget/RemoteViews;)Landroidx/core/app/NotificationCompat$Builder;

    :cond_6
    const v5, 0x7f0e00b5

    invoke-virtual {p0, v5}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v5

    const v6, 0x7f060034

    invoke-static {v5, v6}, Lcom/motorola/ccc/ota/utils/NotificationUtils;->getActionBtnText(Ljava/lang/String;I)Landroid/text/Spannable;

    move-result-object v5

    const v6, 0x7f0800cc

    invoke-virtual {v0, v6, v5, v4}, Landroidx/core/app/NotificationCompat$Builder;->addAction(ILjava/lang/CharSequence;Landroid/app/PendingIntent;)Landroidx/core/app/NotificationCompat$Builder;

    new-instance v4, Landroid/os/Bundle;

    invoke-direct {v4}, Landroid/os/Bundle;-><init>()V

    const-string v5, "NotificationIntent"

    invoke-virtual {v4, v5, p1}, Landroid/os/Bundle;->putParcelable(Ljava/lang/String;Landroid/os/Parcelable;)V

    invoke-virtual {v0, v4}, Landroidx/core/app/NotificationCompat$Builder;->setExtras(Landroid/os/Bundle;)Landroidx/core/app/NotificationCompat$Builder;

    sget-object p1, Lcom/motorola/ccc/ota/utils/NotificationUtils;->settings:Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    sget-object v4, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->SMART_UPDATE_POP_UP_DISABLE:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    invoke-virtual {p1, v4}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->getBoolean(Lcom/motorola/otalib/common/settings/ISetting;)Z

    move-result v4

    sget-object v5, Lcom/motorola/ccc/ota/ui/updateType/UpdateType$DIFFUpdateType;->SMR:Lcom/motorola/ccc/ota/ui/updateType/UpdateType$DIFFUpdateType;

    invoke-virtual {v5}, Lcom/motorola/ccc/ota/ui/updateType/UpdateType$DIFFUpdateType;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v2}, Lcom/motorola/ccc/ota/ui/UpdaterUtils$UpgradeInfo;->getUpdateTypeData()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v5, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    invoke-virtual {v0}, Landroidx/core/app/NotificationCompat$Builder;->build()Landroid/app/Notification;

    move-result-object v0

    invoke-virtual {v3}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v3

    if-eqz v3, :cond_8

    invoke-static {p1}, Lcom/motorola/ccc/ota/utils/SmartUpdateUtils;->isSmartUpdateEnabledByUser(Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;)Z

    move-result p1

    if-nez p1, :cond_8

    if-nez v4, :cond_8

    if-nez v2, :cond_7

    invoke-static {}, Lcom/motorola/ccc/ota/utils/SmartUpdateUtils;->isForcedMRUpdateEnabledByServer()Z

    move-result p1

    if-eqz p1, :cond_8

    :cond_7
    invoke-static {}, Lcom/motorola/ccc/ota/utils/SmartUpdateUtils;->isSmartUpdateEnabledByServer()Z

    move-result p1

    if-eqz p1, :cond_8

    iget p1, v0, Landroid/app/Notification;->flags:I

    or-int/lit8 p1, p1, 0x20

    iput p1, v0, Landroid/app/Notification;->flags:I

    goto :goto_3

    :cond_8
    iget p1, v0, Landroid/app/Notification;->flags:I

    or-int/lit8 p1, p1, 0x10

    iput p1, v0, Landroid/app/Notification;->flags:I

    :goto_3
    :try_start_0
    const-string p1, "notification"

    invoke-virtual {p0, p1}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Landroid/app/NotificationManager;

    const/4 p1, 0x4

    invoke-virtual {p0, p1, v0}, Landroid/app/NotificationManager;->notify(ILandroid/app/Notification;)V
    :try_end_0
    .catch Ljava/lang/SecurityException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_4

    :catch_0
    move-exception p0

    new-instance p1, Ljava/lang/StringBuilder;

    const-string v0, "Security Exception while displaying Update status screen: "

    invoke-direct {p1, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-static {v1, p0}, Lcom/motorola/ccc/ota/utils/Logger;->error(Ljava/lang/String;Ljava/lang/String;)V

    :goto_4
    return-void
.end method

.method public static fillDownloadLaterNotificationDetails(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Landroid/content/Intent;)Landroid/content/Intent;
    .locals 2

    new-instance v0, Landroid/content/Intent;

    const-class v1, Lcom/motorola/ccc/ota/ui/NotificationService;

    invoke-direct {v0, p0, v1}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    const-string p0, "Title"

    invoke-virtual {v0, p0, p1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    const-string p0, "Message"

    invoke-virtual {v0, p0, p2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    const-string p0, "UpdateKey"

    const-string p1, "Download"

    invoke-virtual {v0, p0, p1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    const-string p0, "IntentCallBack"

    const/4 p1, 0x1

    invoke-virtual {v0, p0, p1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Z)Landroid/content/Intent;

    const-string p0, "NotificationTimerExpiry"

    invoke-static {}, Lcom/motorola/ccc/ota/utils/NotificationUtils;->getPreDownloadNotificationExpiryMins()I

    move-result p1

    invoke-virtual {v0, p0, p1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    const-string p0, "PendingIntent"

    invoke-virtual {v0, p0, p3}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Landroid/os/Parcelable;)Landroid/content/Intent;

    return-object v0
.end method

.method public static fillInstallLaterNotificationDetails(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Landroid/content/Intent;ILjava/lang/String;)Landroid/content/Intent;
    .locals 2

    new-instance v0, Landroid/content/Intent;

    const-class v1, Lcom/motorola/ccc/ota/ui/NotificationService;

    invoke-direct {v0, p0, v1}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    const-string p0, "com.motorola.ccc.ota.UPGRADE_INSTALL_NOTIFICATION_AVAILABLE"

    invoke-virtual {v0, p0}, Landroid/content/Intent;->setAction(Ljava/lang/String;)Landroid/content/Intent;

    const-string p0, "Title"

    invoke-virtual {v0, p0, p1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    const-string p0, "Message"

    invoke-virtual {v0, p0, p2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    const-string p0, "com.motorola.blur.service.blur.upgrade.version"

    invoke-virtual {v0, p0, p5}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    const-string p0, "IntentCallBack"

    const/4 p1, 0x1

    invoke-virtual {v0, p0, p1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Z)Landroid/content/Intent;

    const-string p0, "NotificationTimerExpiry"

    invoke-virtual {v0, p0, p4}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    const-string p0, "PendingIntent"

    invoke-virtual {v0, p0, p3}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Landroid/os/Parcelable;)Landroid/content/Intent;

    return-object v0
.end method

.method public static fillInstallSystemUpdateNotificationDetails(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;ILandroid/content/Intent;Ljava/lang/String;)Landroid/content/Intent;
    .locals 0

    invoke-static {p0, p1, p2, p3, p5}, Lcom/motorola/ccc/ota/utils/NotificationUtils;->fillInstallSystemUpdateNotificationDetails(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;ILjava/lang/String;)Landroid/content/Intent;

    move-result-object p0

    const-string p1, "PendingIntent"

    invoke-virtual {p0, p1, p4}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Landroid/os/Parcelable;)Landroid/content/Intent;

    return-object p0
.end method

.method public static fillInstallSystemUpdateNotificationDetails(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;ILjava/lang/String;)Landroid/content/Intent;
    .locals 2

    new-instance v0, Landroid/content/Intent;

    const-class v1, Lcom/motorola/ccc/ota/ui/NotificationService;

    invoke-direct {v0, p0, v1}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    const-string p0, "com.motorola.ccc.ota.UPGRADE_INSTALL_NOTIFICATION_AVAILABLE"

    invoke-virtual {v0, p0}, Landroid/content/Intent;->setAction(Ljava/lang/String;)Landroid/content/Intent;

    const-string p0, "com.motorola.blur.service.blur.upgrade.version"

    invoke-virtual {v0, p0, p4}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    const-string p0, "Title"

    invoke-virtual {v0, p0, p1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    const-string p0, "Message"

    invoke-virtual {v0, p0, p2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    const-string p0, "IntentCallBack"

    const/4 p1, 0x1

    invoke-virtual {v0, p0, p1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Z)Landroid/content/Intent;

    const-string p0, "NotificationTimerExpiry"

    invoke-virtual {v0, p0, p3}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    new-instance p0, Landroid/content/Intent;

    const-string p1, "com.motorola.ccc.ota.UPGRADE_INSTALL_NOTIFICATION_AVAILABLE_RESPONSE"

    invoke-direct {p0, p1}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    const-string p1, "UpdateKey"

    const-string p2, "Install"

    invoke-virtual {p0, p1, p2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    const-string p1, "PendingIntent"

    invoke-virtual {v0, p1, p0}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Landroid/os/Parcelable;)Landroid/content/Intent;

    return-object v0
.end method

.method public static fillInstallSystemUpdateNotificationDetails(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;ILjava/lang/String;Ljava/lang/String;)Landroid/content/Intent;
    .locals 0

    invoke-static {p0, p1, p2, p3, p4}, Lcom/motorola/ccc/ota/utils/NotificationUtils;->fillInstallSystemUpdateNotificationDetails(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;ILjava/lang/String;)Landroid/content/Intent;

    move-result-object p0

    const-string p1, "PendingIntent"

    invoke-virtual {p0, p1}, Landroid/content/Intent;->getParcelableExtra(Ljava/lang/String;)Landroid/os/Parcelable;

    move-result-object p2

    check-cast p2, Landroid/content/Intent;

    const-string p3, "com.motorola.blur.service.blur.upgrade.metadata"

    invoke-virtual {p2, p3, p5}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    invoke-virtual {p0, p1, p2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Landroid/os/Parcelable;)Landroid/content/Intent;

    return-object p0
.end method

.method public static fillLowDataStorageNotificationDetails(Landroid/content/Context;ZLjava/lang/String;)Landroid/content/Intent;
    .locals 2

    new-instance v0, Landroid/content/Intent;

    const-class v1, Lcom/motorola/ccc/ota/ui/NotificationService;

    invoke-direct {v0, p0, v1}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    if-eqz p1, :cond_0

    const p1, 0x7f0e01b8

    goto :goto_0

    :cond_0
    const p1, 0x7f0e01bf

    :goto_0
    invoke-virtual {p0, p1}, Landroid/content/Context;->getText(I)Ljava/lang/CharSequence;

    move-result-object p1

    const-string v1, "Title"

    invoke-virtual {v0, v1, p1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/CharSequence;)Landroid/content/Intent;

    const p1, 0x7f0e01be

    invoke-virtual {p0, p1}, Landroid/content/Context;->getText(I)Ljava/lang/CharSequence;

    move-result-object p0

    const-string p1, "Message"

    invoke-virtual {v0, p1, p0}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/CharSequence;)Landroid/content/Intent;

    const-string p0, "IntentCallBack"

    const/4 p1, 0x1

    invoke-virtual {v0, p0, p1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Z)Landroid/content/Intent;

    const-string p0, "RespondForSystemUpdates"

    invoke-virtual {v0, p0, p1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Z)Landroid/content/Intent;

    const-string p0, "NotificationTimerExpiry"

    const/4 v1, -0x1

    invoke-virtual {v0, p0, v1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    const-string p0, "NotificationLowMemory"

    invoke-virtual {v0, p0, p1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Z)Landroid/content/Intent;

    new-instance p0, Landroid/content/Intent;

    const-string p1, "com.motorola.ccc.ota.RUN_STATE_MACHINE"

    invoke-direct {p0, p1}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    const-string p1, "com.motorola.blur.service.blur.upgrade.location_type"

    invoke-virtual {p0, p1, p2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    const-string p1, "PendingIntent"

    invoke-virtual {v0, p1, p0}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Landroid/os/Parcelable;)Landroid/content/Intent;

    return-object v0
.end method

.method public static fillRestartSystemNotificationDetails(Landroid/content/Context;Ljava/lang/String;ILandroid/content/Intent;Lcom/motorola/ccc/ota/ui/UpdaterUtils$UpgradeInfo;)Landroid/content/Intent;
    .locals 0

    invoke-static {p0, p1, p2, p4}, Lcom/motorola/ccc/ota/utils/NotificationUtils;->fillRestartSystemNotificationDetails(Landroid/content/Context;Ljava/lang/String;ILcom/motorola/ccc/ota/ui/UpdaterUtils$UpgradeInfo;)Landroid/content/Intent;

    move-result-object p0

    const-string p1, "PendingIntent"

    invoke-virtual {p0, p1, p3}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Landroid/os/Parcelable;)Landroid/content/Intent;

    return-object p0
.end method

.method public static fillRestartSystemNotificationDetails(Landroid/content/Context;Ljava/lang/String;ILcom/motorola/ccc/ota/ui/UpdaterUtils$UpgradeInfo;)Landroid/content/Intent;
    .locals 3

    new-instance v0, Landroid/content/Intent;

    const-class v1, Lcom/motorola/ccc/ota/ui/NotificationService;

    invoke-direct {v0, p0, v1}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    const-string v1, "com.motorola.ccc.ota.UPGRADE_RESTART_NOTIFICATION"

    invoke-virtual {v0, v1}, Landroid/content/Intent;->setAction(Ljava/lang/String;)Landroid/content/Intent;

    const v1, 0x7f0e0176

    invoke-virtual {p0, v1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v1

    const-string v2, "Title"

    invoke-virtual {v0, v2, v1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    const-string v1, "Message"

    invoke-static {p0, p3}, Lcom/motorola/ccc/ota/utils/NotificationUtils;->getRestartNotificationText(Landroid/content/Context;Lcom/motorola/ccc/ota/ui/UpdaterUtils$UpgradeInfo;)Ljava/lang/String;

    move-result-object p0

    invoke-virtual {v0, v1, p0}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    const-string p0, "IntentCallBack"

    const/4 p3, 0x1

    invoke-virtual {v0, p0, p3}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Z)Landroid/content/Intent;

    const-string p0, "NotificationTimerExpiry"

    invoke-virtual {v0, p0, p2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    const-string p0, "com.motorola.blur.service.blur.upgrade.version"

    invoke-virtual {v0, p0, p1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    new-instance p0, Landroid/content/Intent;

    const-string p1, "com.motorola.ccc.ota.UPGRADE_INSTALL_NOTIFICATION_AVAILABLE_RESPONSE"

    invoke-direct {p0, p1}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    const-string p1, "UpdateKey"

    const-string p2, "Restart"

    invoke-virtual {p0, p1, p2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    const-string p1, "PendingIntent"

    invoke-virtual {v0, p1, p0}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Landroid/os/Parcelable;)Landroid/content/Intent;

    return-object v0
.end method

.method public static fillRestartSystemNotificationDetails(Landroid/content/Context;Ljava/lang/String;ILjava/lang/String;Lcom/motorola/ccc/ota/ui/UpdaterUtils$UpgradeInfo;)Landroid/content/Intent;
    .locals 0

    invoke-static {p0, p1, p2, p4}, Lcom/motorola/ccc/ota/utils/NotificationUtils;->fillRestartSystemNotificationDetails(Landroid/content/Context;Ljava/lang/String;ILcom/motorola/ccc/ota/ui/UpdaterUtils$UpgradeInfo;)Landroid/content/Intent;

    move-result-object p0

    const-string p1, "PendingIntent"

    invoke-virtual {p0, p1}, Landroid/content/Intent;->getParcelableExtra(Ljava/lang/String;)Landroid/os/Parcelable;

    move-result-object p2

    check-cast p2, Landroid/content/Intent;

    const-string p4, "com.motorola.blur.service.blur.upgrade.metadata"

    invoke-virtual {p2, p4, p3}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    invoke-virtual {p0, p1, p2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Landroid/os/Parcelable;)Landroid/content/Intent;

    return-object p0
.end method

.method public static fillSystemUpdateNotificationDetails(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;
    .locals 2

    new-instance v0, Landroid/content/Intent;

    const-class v1, Lcom/motorola/ccc/ota/ui/NotificationService;

    invoke-direct {v0, p0, v1}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    const-string p0, "Title"

    invoke-virtual {v0, p0, p1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    const-string p0, "UpdateKey"

    const-string p1, "Download"

    invoke-virtual {v0, p0, p1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    const-string p0, "Message"

    invoke-virtual {v0, p0, p2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    const-string p0, "IntentCallBack"

    const/4 p1, 0x1

    invoke-virtual {v0, p0, p1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Z)Landroid/content/Intent;

    const-string p0, "NotificationTimerExpiry"

    invoke-static {}, Lcom/motorola/ccc/ota/utils/NotificationUtils;->getPreDownloadNotificationExpiryMins()I

    move-result p1

    invoke-virtual {v0, p0, p1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    new-instance p0, Landroid/content/Intent;

    const-string p1, "com.motorola.ccc.ota.UPGRADE_UPDATE_NOTIFICATION_AVAILABLE_RESPONSE"

    invoke-direct {p0, p1}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    const-string p1, "com.motorola.blur.service.blur.upgrade.metadata"

    invoke-virtual {p0, p1, p3}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    const-string p1, "PendingIntent"

    invoke-virtual {v0, p1, p0}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Landroid/os/Parcelable;)Landroid/content/Intent;

    return-object v0
.end method

.method public static fillSystemUpdateNotificationDetails(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;ILandroid/content/Intent;)Landroid/content/Intent;
    .locals 0

    invoke-static {p0, p1, p2, p3}, Lcom/motorola/ccc/ota/utils/NotificationUtils;->fillSystemUpdateNotificationDetails(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    move-result-object p0

    const-string p1, "NotificationTimerExpiry"

    invoke-virtual {p0, p1, p4}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    const-string p1, "PendingIntent"

    invoke-virtual {p0, p1, p5}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Landroid/os/Parcelable;)Landroid/content/Intent;

    return-object p0
.end method

.method public static fillSystemUpdatePausedNotificationDetails(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;ILandroid/content/Intent;FLandroid/content/Intent;)Landroid/content/Intent;
    .locals 2

    new-instance v0, Landroid/content/Intent;

    const-class v1, Lcom/motorola/ccc/ota/ui/NotificationService;

    invoke-direct {v0, p0, v1}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    const-string p0, "com.motorola.ccc.ota.ACTION_PAUSE_DOWNLOAD_FOR_CELLULAR"

    invoke-virtual {v0, p0}, Landroid/content/Intent;->setAction(Ljava/lang/String;)Landroid/content/Intent;

    const-string p0, "Title"

    invoke-virtual {v0, p0, p1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    const-string p0, "Message"

    invoke-virtual {v0, p0, p2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    const-string p0, "IntentCallBack"

    const/4 p1, 0x0

    invoke-virtual {v0, p0, p1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Z)Landroid/content/Intent;

    const-string p0, "NotificationTimerExpiry"

    invoke-virtual {v0, p0, p4}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    const-string p0, "KeyProgressPercentage"

    invoke-virtual {v0, p0, p6}, Landroid/content/Intent;->putExtra(Ljava/lang/String;F)Landroid/content/Intent;

    const-string p0, "BuilderActionIntent"

    invoke-virtual {v0, p0, p7}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Landroid/os/Parcelable;)Landroid/content/Intent;

    const-string p0, "com.motorola.blur.service.blur.upgrade.metadata"

    invoke-virtual {p5, p0, p3}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    const-string p0, "PendingIntent"

    invoke-virtual {v0, p0, p5}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Landroid/os/Parcelable;)Landroid/content/Intent;

    return-object v0
.end method

.method public static getActionBtnText(Ljava/lang/String;I)Landroid/text/Spannable;
    .locals 2

    new-instance v0, Landroid/text/SpannableString;

    invoke-direct {v0, p0}, Landroid/text/SpannableString;-><init>(Ljava/lang/CharSequence;)V

    new-instance p0, Landroid/text/style/ForegroundColorSpan;

    invoke-direct {p0, p1}, Landroid/text/style/ForegroundColorSpan;-><init>(I)V

    const/4 p1, 0x0

    invoke-interface {v0}, Landroid/text/Spannable;->length()I

    move-result v1

    invoke-interface {v0, p0, p1, v1, p1}, Landroid/text/Spannable;->setSpan(Ljava/lang/Object;III)V

    return-object v0
.end method

.method public static getErrorNotificationText(IZLcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;Landroid/content/Context;)Ljava/lang/String;
    .locals 4

    invoke-virtual {p3}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "InstallNotification.getNotificationText retriedOrSuspend = "

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    const-string v2, "OtaApp"

    invoke-static {v2, v1}, Lcom/motorola/ccc/ota/utils/Logger;->debug(Ljava/lang/String;Ljava/lang/String;)V

    invoke-static {}, Lcom/motorola/ccc/ota/ui/UpdaterUtils;->isWifiOnly()Z

    move-result v1

    invoke-static {v1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v1

    const/4 v3, 0x1

    if-ne p0, v3, :cond_0

    const p0, 0x7f0e0055

    invoke-virtual {v0, p0}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object p0

    goto/16 :goto_0

    :cond_0
    sget-object p0, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->BATTERY_LOW:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    invoke-virtual {p2, p0}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->getBoolean(Lcom/motorola/otalib/common/settings/ISetting;)Z

    move-result p0

    if-eqz p0, :cond_1

    invoke-static {p3}, Lcom/motorola/ccc/ota/ui/UpdaterUtils;->getBatteryLowMessage(Landroid/content/Context;)Ljava/lang/String;

    move-result-object p0

    goto/16 :goto_0

    :cond_1
    invoke-virtual {v1}, Ljava/lang/Boolean;->booleanValue()Z

    move-result p0

    const v1, 0x7f0e0059

    if-eqz p0, :cond_2

    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object p0

    goto :goto_0

    :cond_2
    if-eqz p1, :cond_3

    invoke-static {}, Lcom/motorola/ccc/ota/ui/UpdaterUtils;->getAutomaticDownloadForCellular()Z

    move-result p0

    if-nez p0, :cond_3

    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object p0

    goto :goto_0

    :cond_3
    invoke-static {p2}, Lcom/motorola/ccc/ota/utils/SmartUpdateUtils;->isDownloadForcedForSmartUpdate(Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;)Z

    move-result p0

    if-eqz p0, :cond_4

    invoke-static {}, Lcom/motorola/ccc/ota/ui/UpdaterUtils;->getAutomaticDownloadForCellular()Z

    move-result p0

    if-nez p0, :cond_4

    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object p0

    goto :goto_0

    :cond_4
    invoke-static {p3}, Lcom/motorola/ccc/ota/ui/UpdaterUtils;->isDataNetworkRoaming(Landroid/content/Context;)Z

    move-result p0

    if-eqz p0, :cond_5

    const p0, 0x7f0e0058

    invoke-virtual {v0, p0}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object p0

    goto :goto_0

    :cond_5
    invoke-static {}, Lcom/motorola/ccc/ota/ui/UpdaterUtils;->isDeviceInDatasaverMode()Z

    move-result p0

    if-eqz p0, :cond_6

    const p0, 0x7f0e014e

    invoke-virtual {v0, p0}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object p0

    goto :goto_0

    :cond_6
    invoke-static {}, Lcom/motorola/ccc/ota/ui/UpdaterUtils;->isAdminAPNEnabled()Z

    move-result p0

    if-eqz p0, :cond_7

    const p0, 0x7f0e0057

    invoke-virtual {v0, p0}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object p0

    goto :goto_0

    :cond_7
    sget-object p0, Lcom/motorola/ccc/ota/utils/NotificationUtils;->settings:Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    sget-object p1, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->FLAG_IS_VITAL_UPDATE:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    invoke-virtual {p0, p1}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->getBoolean(Lcom/motorola/otalib/common/settings/ISetting;)Z

    move-result p0

    if-eqz p0, :cond_8

    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object p0

    goto :goto_0

    :cond_8
    const p0, 0x7f0e0056

    invoke-virtual {v0, p0}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object p0

    :goto_0
    new-instance p1, Ljava/lang/StringBuilder;

    const-string p2, "InstallNotification.getNotificationText = "

    invoke-direct {p1, p2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {v2, p1}, Lcom/motorola/ccc/ota/utils/Logger;->debug(Ljava/lang/String;Ljava/lang/String;)V

    return-object p0
.end method

.method public static getInstallLaterNotificationExpiryMins(Lcom/motorola/ccc/ota/ui/UpdaterUtils$UpgradeInfo;J)I
    .locals 3

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v0

    add-long/2addr v0, p1

    invoke-virtual {p0}, Lcom/motorola/ccc/ota/ui/UpdaterUtils$UpgradeInfo;->isCriticalUpdate()Z

    move-result v2

    if-eqz v2, :cond_1

    new-instance p1, Lcom/motorola/ccc/ota/ui/CriticalUpdate;

    invoke-direct {p1, p0}, Lcom/motorola/ccc/ota/ui/CriticalUpdate;-><init>(Lcom/motorola/ccc/ota/ui/UpdaterUtils$UpgradeInfo;)V

    invoke-virtual {p1, v0, v1}, Lcom/motorola/ccc/ota/ui/CriticalUpdate;->getAndSetNextPromptValue(J)J

    move-result-wide p0

    sget-object p2, Ljava/util/concurrent/TimeUnit;->MILLISECONDS:Ljava/util/concurrent/TimeUnit;

    sub-long/2addr p0, v0

    invoke-virtual {p2, p0, p1}, Ljava/util/concurrent/TimeUnit;->toMinutes(J)J

    move-result-wide p0

    long-to-int p0, p0

    const/4 p1, 0x1

    add-int/2addr p0, p1

    if-gtz p0, :cond_0

    return p1

    :cond_0
    return p0

    :cond_1
    invoke-static {p0, v0, v1}, Lcom/motorola/ccc/ota/utils/NotificationUtils;->getPreInstallNotificationExpiryMins(Lcom/motorola/ccc/ota/ui/UpdaterUtils$UpgradeInfo;J)I

    move-result v0

    int-to-long v0, v0

    invoke-static {p0, v0, v1, p1, p2}, Lcom/motorola/ccc/ota/ui/UpdaterUtils;->getMinimumDelayValue(Lcom/motorola/ccc/ota/ui/UpdaterUtils$UpgradeInfo;JJ)I

    move-result p0

    return p0
.end method

.method public static getInstallNotificationText(Lcom/motorola/ccc/ota/ui/updateType/UpdateType$UpdateTypeInterface;Lcom/motorola/ccc/ota/ui/UpdaterUtils$UpgradeInfo;)Ljava/lang/String;
    .locals 12

    invoke-static {}, Lcom/motorola/ccc/ota/env/OtaApplication;->getGlobalContext()Landroid/content/Context;

    move-result-object v0

    invoke-virtual {p1}, Lcom/motorola/ccc/ota/ui/UpdaterUtils$UpgradeInfo;->getInstallTime()I

    move-result v1

    invoke-static {v1}, Lcom/motorola/ccc/ota/ui/UpdaterUtils;->getUpdateTime(I)I

    move-result v1

    new-instance v2, Lcom/motorola/ccc/ota/ui/CriticalUpdate;

    invoke-direct {v2, p1}, Lcom/motorola/ccc/ota/ui/CriticalUpdate;-><init>(Lcom/motorola/ccc/ota/ui/UpdaterUtils$UpgradeInfo;)V

    sget-object v3, Lcom/motorola/ccc/ota/utils/NotificationUtils;->settings:Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    sget-object v4, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->CHECKBOX_SELECTED:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    invoke-virtual {v3, v4}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->getBoolean(Lcom/motorola/otalib/common/settings/ISetting;)Z

    move-result v4

    sget-object v5, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->AUTO_UPDATE_TIME_SELECTED:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    const-wide/16 v6, -0x1

    invoke-virtual {v3, v5, v6, v7}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->getLong(Lcom/motorola/otalib/common/settings/ISetting;J)J

    move-result-wide v8

    if-eqz v4, :cond_0

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v4

    sub-long v4, v8, v4

    const-wide/32 v10, 0x36ee80

    cmp-long v4, v4, v10

    if-gtz v4, :cond_0

    invoke-static {v0, v8, v9}, Lcom/motorola/ccc/ota/utils/DateFormatUtils;->getCalendarString(Landroid/content/Context;J)Ljava/lang/String;

    move-result-object p0

    filled-new-array {p0}, [Ljava/lang/Object;

    move-result-object p0

    const p1, 0x7f0e004c

    invoke-virtual {v0, p1, p0}, Landroid/content/Context;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p0

    goto/16 :goto_0

    :cond_0
    invoke-virtual {p1}, Lcom/motorola/ccc/ota/ui/UpdaterUtils$UpgradeInfo;->isCriticalUpdate()Z

    move-result v4

    if-eqz v4, :cond_2

    sget-object p0, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->MAX_CRITICAL_UPDATE_DEFER_TIME:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    invoke-virtual {v3, p0, v6, v7}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->getLong(Lcom/motorola/otalib/common/settings/ISetting;J)J

    move-result-wide v3

    invoke-static {v0, v3, v4}, Lcom/motorola/ccc/ota/utils/DateFormatUtils;->getCalendarString(Landroid/content/Context;J)Ljava/lang/String;

    move-result-object p0

    invoke-virtual {p1}, Lcom/motorola/ccc/ota/ui/UpdaterUtils$UpgradeInfo;->getInstallTime()I

    move-result v1

    invoke-static {v1}, Lcom/motorola/ccc/ota/ui/UpdaterUtils;->getUpdateTime(I)I

    move-result v1

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    filled-new-array {p0, v1}, [Ljava/lang/Object;

    move-result-object p0

    const v1, 0x7f0e00a8

    invoke-virtual {v0, v1, p0}, Landroid/content/Context;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p0

    invoke-static {p1}, Lcom/motorola/ccc/ota/ui/UpdaterUtils;->isCriticalUpdateTimerExpired(Lcom/motorola/ccc/ota/ui/UpdaterUtils$UpgradeInfo;)Z

    move-result v3

    if-eqz v3, :cond_7

    invoke-virtual {v2}, Lcom/motorola/ccc/ota/ui/CriticalUpdate;->isOutsideCriticalUpdateExtendedTime()Z

    move-result p0

    if-nez p0, :cond_1

    invoke-virtual {v2}, Lcom/motorola/ccc/ota/ui/CriticalUpdate;->getExtendRestartTime()J

    move-result-wide v2

    invoke-static {v0, v2, v3}, Lcom/motorola/ccc/ota/utils/DateFormatUtils;->getCalendarString(Landroid/content/Context;J)Ljava/lang/String;

    move-result-object p0

    invoke-virtual {p1}, Lcom/motorola/ccc/ota/ui/UpdaterUtils$UpgradeInfo;->getInstallTime()I

    move-result p1

    invoke-static {p1}, Lcom/motorola/ccc/ota/ui/UpdaterUtils;->getUpdateTime(I)I

    move-result p1

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p1

    filled-new-array {p0, p1}, [Ljava/lang/Object;

    move-result-object p0

    invoke-virtual {v0, v1, p0}, Landroid/content/Context;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p0

    goto :goto_0

    :cond_1
    const p0, 0x7f0e0108

    invoke-virtual {v0, p0}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object p0

    goto :goto_0

    :cond_2
    invoke-virtual {p1}, Lcom/motorola/ccc/ota/ui/UpdaterUtils$UpgradeInfo;->isForceInstallTimeSet()Z

    move-result v2

    if-eqz v2, :cond_3

    sget-object v2, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->MAX_FORCE_INSTALL_DEFER_TIME:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    invoke-virtual {v3, v2, v6, v7}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->getLong(Lcom/motorola/otalib/common/settings/ISetting;J)J

    move-result-wide v4

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v8

    sub-long/2addr v4, v8

    const-wide/32 v8, 0xf731400

    cmp-long v2, v4, v8

    if-lez v2, :cond_4

    :cond_3
    invoke-virtual {p1}, Lcom/motorola/ccc/ota/ui/UpdaterUtils$UpgradeInfo;->isForceInstallTimerExpired()Z

    move-result p1

    if-eqz p1, :cond_5

    :cond_4
    sget-object p0, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->MAX_FORCE_INSTALL_DEFER_TIME:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    invoke-virtual {v3, p0, v6, v7}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->getLong(Lcom/motorola/otalib/common/settings/ISetting;J)J

    move-result-wide p0

    invoke-static {p0, p1}, Lcom/motorola/ccc/ota/utils/DateFormatUtils;->getCalendarDate(J)Ljava/lang/String;

    move-result-object p0

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p1

    filled-new-array {p0, p1}, [Ljava/lang/Object;

    move-result-object p0

    const p1, 0x7f0e0102

    invoke-virtual {v0, p1, p0}, Landroid/content/Context;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p0

    goto :goto_0

    :cond_5
    invoke-static {}, Lcom/motorola/ccc/ota/ui/UpdaterUtils;->isMandatoryInstallTimeExpired()Z

    move-result p1

    if-eqz p1, :cond_6

    const p0, 0x7f0e0122

    invoke-virtual {v0, p0}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object p0

    goto :goto_0

    :cond_6
    invoke-interface {p0}, Lcom/motorola/ccc/ota/ui/updateType/UpdateType$UpdateTypeInterface;->getInstallUpdateNotificationText()Ljava/lang/String;

    move-result-object p0

    :cond_7
    :goto_0
    return-object p0
.end method

.method public static getPreDownloadNotificationExpiryMins()I
    .locals 3

    sget-object v0, Lcom/motorola/ccc/ota/utils/NotificationUtils;->settings:Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    sget-object v1, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->METADATA:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    invoke-virtual {v0, v1}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->getString(Lcom/motorola/otalib/common/settings/ISetting;)Ljava/lang/String;

    move-result-object v0

    const/16 v1, 0x5a0

    if-nez v0, :cond_0

    return v1

    :cond_0
    :try_start_0
    new-instance v2, Lorg/json/JSONObject;

    invoke-direct {v2, v0}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    const-string v0, "preDownloadNotificationExpiryMins"

    invoke-virtual {v2, v0, v1}, Lorg/json/JSONObject;->optInt(Ljava/lang/String;I)I

    move-result v0
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    return v0

    :catch_0
    return v1
.end method

.method public static getPreInstallNotificationExpiryMins(Lcom/motorola/ccc/ota/ui/UpdaterUtils$UpgradeInfo;)I
    .locals 2

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v0

    invoke-static {p0, v0, v1}, Lcom/motorola/ccc/ota/utils/NotificationUtils;->getPreInstallNotificationExpiryMins(Lcom/motorola/ccc/ota/ui/UpdaterUtils$UpgradeInfo;J)I

    move-result p0

    return p0
.end method

.method public static getPreInstallNotificationExpiryMins(Lcom/motorola/ccc/ota/ui/UpdaterUtils$UpgradeInfo;J)I
    .locals 4

    const-string v0, "OtaApp"

    sget-object v1, Lcom/motorola/ccc/ota/utils/NotificationUtils;->settings:Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    sget-object v2, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->METADATA:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    invoke-virtual {v1, v2}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->getString(Lcom/motorola/otalib/common/settings/ISetting;)Ljava/lang/String;

    move-result-object v1

    const/16 v2, 0x5a0

    if-nez v1, :cond_0

    return v2

    :cond_0
    :try_start_0
    invoke-static {}, Lcom/motorola/ccc/ota/ui/UpdaterUtils;->isMandatoryInstallTimeExpired()Z

    move-result v3

    if-nez v3, :cond_2

    invoke-virtual {p0}, Lcom/motorola/ccc/ota/ui/UpdaterUtils$UpgradeInfo;->getBitmap()I

    move-result p0

    sget-object v3, Lcom/motorola/ccc/ota/ui/UpdaterUtils$BitmapFeatures;->intelligentNotification:Lcom/motorola/ccc/ota/ui/UpdaterUtils$BitmapFeatures;

    invoke-virtual {v3}, Lcom/motorola/ccc/ota/ui/UpdaterUtils$BitmapFeatures;->ordinal()I

    move-result v3

    invoke-static {p0, v3}, Lcom/motorola/ccc/ota/ui/UpdaterUtils;->isBitMapSet(II)Z

    move-result p0

    if-eqz p0, :cond_1

    invoke-static {p1, p2}, Lcom/motorola/ccc/ota/ui/UpdaterUtils;->getTimeRemainingForBestTime(J)I

    move-result p0

    return p0

    :cond_1
    new-instance p0, Lorg/json/JSONObject;

    invoke-direct {p0, v1}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    const-string p1, "preInstallNotificationExpiryMins"

    invoke-virtual {p0, p1, v2}, Lorg/json/JSONObject;->optInt(Ljava/lang/String;I)I

    move-result p0

    return p0

    :cond_2
    new-instance p0, Lorg/json/JSONObject;

    invoke-direct {p0, v1}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    const-string p1, "getPreInstallNotificationExpiryMins : Force Annoy"

    invoke-static {v0, p1}, Lcom/motorola/ccc/ota/utils/Logger;->debug(Ljava/lang/String;Ljava/lang/String;)V

    const-string p1, "installReminder"

    const-string p2, ""

    invoke-virtual {p0, p1, p2}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    invoke-static {p0}, Lcom/motorola/ccc/ota/ui/UpdaterUtils;->getInstallReminderMins(Ljava/lang/String;)I

    move-result p0
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    return p0

    :catch_0
    move-exception p0

    new-instance p1, Ljava/lang/StringBuilder;

    const-string p2, "UpdaterUtils.getPreInstallNotificationExpiryMins Exception "

    invoke-direct {p1, p2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-static {v0, p0}, Lcom/motorola/ccc/ota/utils/Logger;->error(Ljava/lang/String;Ljava/lang/String;)V

    return v2
.end method

.method public static getRestartNotificationText(Landroid/content/Context;Lcom/motorola/ccc/ota/ui/UpdaterUtils$UpgradeInfo;)Ljava/lang/String;
    .locals 6

    new-instance v0, Lcom/motorola/ccc/ota/ui/CriticalUpdate;

    invoke-direct {v0, p1}, Lcom/motorola/ccc/ota/ui/CriticalUpdate;-><init>(Lcom/motorola/ccc/ota/ui/UpdaterUtils$UpgradeInfo;)V

    invoke-virtual {p1}, Lcom/motorola/ccc/ota/ui/UpdaterUtils$UpgradeInfo;->isCriticalUpdate()Z

    move-result v1

    const-wide/16 v2, -0x1

    if-eqz v1, :cond_1

    invoke-static {p0}, Lcom/motorola/ccc/ota/utils/CusUtilMethods;->isItFirstNetOnFota(Landroid/content/Context;)Z

    move-result v1

    if-nez v1, :cond_1

    sget-object v1, Lcom/motorola/ccc/ota/utils/NotificationUtils;->settings:Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    sget-object v4, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->MAX_CRITICAL_UPDATE_DEFER_TIME:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    invoke-virtual {v1, v4, v2, v3}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->getLong(Lcom/motorola/otalib/common/settings/ISetting;J)J

    move-result-wide v1

    invoke-static {p0, v1, v2}, Lcom/motorola/ccc/ota/utils/DateFormatUtils;->getCalendarString(Landroid/content/Context;J)Ljava/lang/String;

    move-result-object v1

    filled-new-array {v1}, [Ljava/lang/Object;

    move-result-object v1

    const v2, 0x7f0e00ab

    invoke-virtual {p0, v2, v1}, Landroid/content/Context;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-static {p1}, Lcom/motorola/ccc/ota/ui/UpdaterUtils;->isCriticalUpdateTimerExpired(Lcom/motorola/ccc/ota/ui/UpdaterUtils$UpgradeInfo;)Z

    move-result p1

    if-eqz p1, :cond_7

    invoke-virtual {v0}, Lcom/motorola/ccc/ota/ui/CriticalUpdate;->isOutsideCriticalUpdateExtendedTime()Z

    move-result p1

    if-nez p1, :cond_0

    invoke-virtual {v0}, Lcom/motorola/ccc/ota/ui/CriticalUpdate;->getExtendRestartTime()J

    move-result-wide v0

    invoke-static {p0, v0, v1}, Lcom/motorola/ccc/ota/utils/DateFormatUtils;->getCalendarString(Landroid/content/Context;J)Ljava/lang/String;

    move-result-object p1

    filled-new-array {p1}, [Ljava/lang/Object;

    move-result-object p1

    invoke-virtual {p0, v2, p1}, Landroid/content/Context;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    goto/16 :goto_2

    :cond_0
    const p1, 0x7f0e0109

    invoke-virtual {p0, p1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v1

    goto/16 :goto_2

    :cond_1
    invoke-static {}, Lcom/motorola/ccc/ota/ui/UpdaterUtils;->isThreeDaysBeforeForceInstall()Z

    move-result p1

    if-nez p1, :cond_6

    invoke-static {}, Lcom/motorola/ccc/ota/ui/UpdaterUtils;->isForceInstallDeferTimeExpired()Z

    move-result p1

    if-eqz p1, :cond_2

    goto :goto_1

    :cond_2
    invoke-static {}, Lcom/motorola/ccc/ota/ui/UpdaterUtils;->isMandatoryInstallTimeExpired()Z

    move-result p1

    if-eqz p1, :cond_3

    const p1, 0x7f0e0123

    invoke-virtual {p0, p1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v1

    goto :goto_2

    :cond_3
    sget-object p1, Lcom/motorola/ccc/ota/utils/NotificationUtils;->settings:Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    sget-object v0, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->RESTART_EXPIRY_TIMER:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    invoke-virtual {p1, v0, v2, v3}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->getLong(Lcom/motorola/otalib/common/settings/ISetting;J)J

    move-result-wide v0

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v2

    const-wide/16 v4, 0x0

    cmp-long p1, v0, v4

    const-wide/16 v4, 0xf

    if-lez p1, :cond_4

    cmp-long p1, v0, v2

    if-gez p1, :cond_4

    sub-long/2addr v2, v0

    const-wide/32 v0, 0x5265c00

    div-long/2addr v2, v0

    add-long/2addr v2, v4

    long-to-int p1, v2

    goto :goto_0

    :cond_4
    const/4 p1, 0x0

    :goto_0
    int-to-long v0, p1

    cmp-long v0, v0, v4

    if-lez v0, :cond_5

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p1

    filled-new-array {p1}, [Ljava/lang/Object;

    move-result-object p1

    const v0, 0x7f0e0171

    invoke-virtual {p0, v0, p1}, Landroid/content/Context;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    goto :goto_2

    :cond_5
    const p1, 0x7f0e016f

    invoke-virtual {p0, p1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v1

    goto :goto_2

    :cond_6
    :goto_1
    sget-object p1, Lcom/motorola/ccc/ota/utils/NotificationUtils;->settings:Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    sget-object v0, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->MAX_FORCE_INSTALL_DEFER_TIME:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    invoke-virtual {p1, v0, v2, v3}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->getLong(Lcom/motorola/otalib/common/settings/ISetting;J)J

    move-result-wide v0

    invoke-static {v0, v1}, Lcom/motorola/ccc/ota/utils/DateFormatUtils;->getCalendarDate(J)Ljava/lang/String;

    move-result-object p1

    filled-new-array {p1}, [Ljava/lang/Object;

    move-result-object p1

    const v0, 0x7f0e0103

    invoke-virtual {p0, v0, p1}, Landroid/content/Context;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    :cond_7
    :goto_2
    return-object v1
.end method

.method public static hasNotification(Landroid/content/Context;I)Z
    .locals 4

    const-string v0, "notification"

    invoke-virtual {p0, v0}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Landroid/app/NotificationManager;

    invoke-virtual {p0}, Landroid/app/NotificationManager;->getActiveNotifications()[Landroid/service/notification/StatusBarNotification;

    move-result-object p0

    array-length v0, p0

    const/4 v1, 0x0

    move v2, v1

    :goto_0
    if-ge v2, v0, :cond_1

    aget-object v3, p0, v2

    invoke-virtual {v3}, Landroid/service/notification/StatusBarNotification;->getId()I

    move-result v3

    if-ne v3, p1, :cond_0

    const/4 p0, 0x1

    return p0

    :cond_0
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    :cond_1
    return v1
.end method

.method public static isNotificationServiceRunning(Landroid/content/Context;)Z
    .locals 4

    const-string v0, "activity"

    invoke-virtual {p0, v0}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Landroid/app/ActivityManager;

    const v0, 0x7fffffff

    invoke-virtual {p0, v0}, Landroid/app/ActivityManager;->getRunningServices(I)Ljava/util/List;

    move-result-object p0

    const/4 v0, 0x0

    if-eqz p0, :cond_2

    invoke-interface {p0}, Ljava/util/List;->size()I

    move-result v1

    if-gtz v1, :cond_0

    return v0

    :cond_0
    move v1, v0

    :goto_0
    invoke-interface {p0}, Ljava/util/List;->size()I

    move-result v2

    if-ge v1, v2, :cond_2

    invoke-interface {p0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroid/app/ActivityManager$RunningServiceInfo;

    iget-object v2, v2, Landroid/app/ActivityManager$RunningServiceInfo;->service:Landroid/content/ComponentName;

    invoke-virtual {v2}, Landroid/content/ComponentName;->getClassName()Ljava/lang/String;

    move-result-object v2

    const-class v3, Lcom/motorola/ccc/ota/ui/NotificationService;

    invoke-virtual {v3}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_1

    const/4 p0, 0x1

    return p0

    :cond_1
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    :cond_2
    return v0
.end method

.method public static isProgressNotification(II)Z
    .locals 1

    const/4 v0, 0x6

    if-eq p0, v0, :cond_0

    const/4 p0, -0x1

    if-eq p0, p1, :cond_0

    const/4 p0, 0x1

    return p0

    :cond_0
    const/4 p0, 0x0

    return p0
.end method

.method public static isProgressNotificationChannelEnabled()Z
    .locals 2

    invoke-static {}, Lcom/motorola/ccc/ota/env/OtaApplication;->getGlobalContext()Landroid/content/Context;

    move-result-object v0

    const-string v1, "notification"

    invoke-virtual {v0, v1}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/app/NotificationManager;

    invoke-static {}, Lcom/motorola/ccc/ota/ui/NotificationChannelCreator;->getMediumNotificationChannelId()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/app/NotificationManager;->getNotificationChannel(Ljava/lang/String;)Landroid/app/NotificationChannel;

    move-result-object v0

    invoke-virtual {v0}, Landroid/app/NotificationChannel;->getImportance()I

    move-result v0

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method public static isSwipeAbleBitmapSet()Z
    .locals 3

    sget-object v0, Lcom/motorola/ccc/ota/utils/NotificationUtils;->settings:Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    sget-object v1, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->METADATA:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    invoke-virtual {v0, v1}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->getString(Lcom/motorola/otalib/common/settings/ISetting;)Ljava/lang/String;

    move-result-object v0

    const/4 v1, 0x0

    :try_start_0
    invoke-static {v0}, Lcom/motorola/otalib/common/metaData/builder/MetaDataBuilder;->from(Ljava/lang/String;)Lcom/motorola/otalib/common/metaData/MetaData;

    move-result-object v0

    invoke-virtual {v0}, Lcom/motorola/otalib/common/metaData/MetaData;->getBitmap()I

    move-result v0

    sget-object v2, Lcom/motorola/ccc/ota/ui/UpdaterUtils$BitmapFeatures;->swipableNotification:Lcom/motorola/ccc/ota/ui/UpdaterUtils$BitmapFeatures;

    invoke-virtual {v2}, Lcom/motorola/ccc/ota/ui/UpdaterUtils$BitmapFeatures;->ordinal()I

    move-result v2

    invoke-static {v0, v2}, Lcom/motorola/ccc/ota/ui/UpdaterUtils;->isBitMapSet(II)Z

    move-result v0
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    return v0

    :catch_0
    :cond_0
    return v1
.end method

.method public static isUpdateNotificationChannelEnabled()Z
    .locals 2

    invoke-static {}, Lcom/motorola/ccc/ota/env/OtaApplication;->getGlobalContext()Landroid/content/Context;

    move-result-object v0

    const-string v1, "notification"

    invoke-virtual {v0, v1}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/app/NotificationManager;

    invoke-static {}, Lcom/motorola/ccc/ota/ui/NotificationChannelCreator;->getUrgentNotificationChannelId()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/app/NotificationManager;->getNotificationChannel(Ljava/lang/String;)Landroid/app/NotificationChannel;

    move-result-object v0

    invoke-virtual {v0}, Landroid/app/NotificationChannel;->getImportance()I

    move-result v0

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method public static refreshOtaNotifications(Landroid/content/Context;)V
    .locals 19

    move-object/from16 v0, p0

    const-string v1, "notification"

    invoke-virtual {v0, v1}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/app/NotificationManager;

    invoke-virtual {v1}, Landroid/app/NotificationManager;->getActiveNotifications()[Landroid/service/notification/StatusBarNotification;

    move-result-object v1

    array-length v2, v1

    const/4 v3, 0x0

    :goto_0
    if-ge v3, v2, :cond_9

    aget-object v4, v1, v3

    invoke-virtual {v4}, Landroid/service/notification/StatusBarNotification;->getNotification()Landroid/app/Notification;

    move-result-object v5

    iget-object v5, v5, Landroid/app/Notification;->extras:Landroid/os/Bundle;

    if-nez v5, :cond_0

    return-void

    :cond_0
    invoke-virtual {v4}, Landroid/service/notification/StatusBarNotification;->getId()I

    move-result v6

    const/4 v7, 0x4

    const-string v8, "NotificationIntent"

    const-string v9, "OtaApp"

    if-ne v6, v7, :cond_1

    const-string v4, "refresh Ota UpdateStatus Notification"

    invoke-static {v9, v4}, Lcom/motorola/ccc/ota/utils/Logger;->debug(Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v5, v8}, Landroid/os/Bundle;->getParcelable(Ljava/lang/String;)Landroid/os/Parcelable;

    move-result-object v4

    check-cast v4, Landroid/content/Intent;

    invoke-static {v0, v4}, Lcom/motorola/ccc/ota/utils/NotificationUtils;->displayUpdateStatusNotification(Landroid/content/Context;Landroid/content/Intent;)V

    goto/16 :goto_1

    :cond_1
    invoke-virtual {v4}, Landroid/service/notification/StatusBarNotification;->getId()I

    move-result v4

    const/16 v6, 0x6c1

    if-ne v4, v6, :cond_8

    const-string v4, "NOTIFICATION_TYPE"

    invoke-virtual {v5, v4}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    new-instance v6, Ljava/lang/StringBuilder;

    const-string v7, "refreshOtaNotifications: notifyType="

    invoke-direct {v6, v7}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v6, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-static {v9, v6}, Lcom/motorola/ccc/ota/utils/Logger;->debug(Ljava/lang/String;Ljava/lang/String;)V

    const-string v6, "NotificationService"

    invoke-virtual {v6, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_3

    invoke-virtual {v5, v8}, Landroid/os/Bundle;->getParcelable(Ljava/lang/String;)Landroid/os/Parcelable;

    move-result-object v1

    move-object v4, v1

    check-cast v4, Landroid/content/Intent;

    const-string v1, "NotificationLowMemory"

    invoke-virtual {v5, v1}, Landroid/os/Bundle;->getBoolean(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_2

    invoke-static {v0, v4}, Lcom/motorola/ccc/ota/utils/NotificationUtils;->showOtaLowMemoryNotification(Landroid/content/Context;Landroid/content/Intent;)V

    return-void

    :cond_2
    const-string v1, "UpdateNotificationServiceType"

    invoke-virtual {v5, v1}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    sget-object v2, Lcom/motorola/ccc/ota/utils/NotificationUtils;->settings:Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    sget-object v3, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->NOTIFICATION_NEXT_PROMPT:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    const-wide/16 v5, 0x0

    invoke-virtual {v2, v3, v5, v6}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->getLong(Lcom/motorola/otalib/common/settings/ISetting;J)J

    move-result-wide v2

    invoke-static {v4}, Lcom/motorola/ccc/ota/ui/UpdaterUtils;->getUpgradeInfoDuringOTAUpdate(Landroid/content/Intent;)Lcom/motorola/ccc/ota/ui/UpdaterUtils$UpgradeInfo;

    move-result-object v5

    invoke-static/range {p0 .. p0}, Lcom/motorola/ccc/ota/utils/NotificationUtils;->stopNotificationService(Landroid/content/Context;)V

    move-object/from16 v0, p0

    invoke-static/range {v0 .. v5}, Lcom/motorola/ccc/ota/utils/NotificationUtils;->displayNotification(Landroid/content/Context;Ljava/lang/String;JLandroid/content/Intent;Lcom/motorola/ccc/ota/ui/UpdaterUtils$UpgradeInfo;)V

    return-void

    :cond_3
    const-string v6, "BGInstall"

    invoke-virtual {v6, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    const-string v7, "com.motorola.blur.service.blur.upgrade.download.on_wifi"

    const-string v8, "com.motorola.blur.service.blur.upgrade.download.deferred"

    if-eqz v6, :cond_4

    const-string v1, "com.motorola.ccc.ota.upgrade_percentage"

    invoke-virtual {v5, v1}, Landroid/os/Bundle;->getFloat(Ljava/lang/String;)F

    move-result v10

    const-string v1, "com.motorola.ccc.ota.upgrade_status"

    invoke-virtual {v5, v1}, Landroid/os/Bundle;->getInt(Ljava/lang/String;)I

    move-result v11

    invoke-virtual {v5, v8}, Landroid/os/Bundle;->getInt(Ljava/lang/String;)I

    move-result v12

    const-string v1, "com.motorola.app.installer"

    invoke-virtual {v5, v1}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v13

    invoke-virtual {v5, v7}, Landroid/os/Bundle;->getBoolean(Ljava/lang/String;)Z

    move-result v14

    new-instance v9, Lcom/motorola/ccc/ota/ui/InstallNotification;

    invoke-direct {v9, v0}, Lcom/motorola/ccc/ota/ui/InstallNotification;-><init>(Landroid/content/Context;)V

    sget-object v15, Lcom/motorola/ccc/ota/utils/NotificationUtils;->settings:Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    invoke-virtual/range {v9 .. v15}, Lcom/motorola/ccc/ota/ui/InstallNotification;->updateNotification(FIILjava/lang/String;ZLcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;)V

    return-void

    :cond_4
    const-string v6, "StatusVerify"

    invoke-virtual {v6, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_5

    const-string v1, "NotificationDownloadStatus"

    invoke-virtual {v5, v1}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Lcom/motorola/otalib/common/utils/UpgradeUtils$DownloadStatus;->valueOf(Ljava/lang/String;)Lcom/motorola/otalib/common/utils/UpgradeUtils$DownloadStatus;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/motorola/ccc/ota/utils/NotificationUtils;->showVerifyNotification(Landroid/content/Context;Lcom/motorola/otalib/common/utils/UpgradeUtils$DownloadStatus;)V

    return-void

    :cond_5
    const-string v6, "DownloadProgress"

    invoke-virtual {v6, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_6

    const-string v1, "com.motorola.blur.service.blur.upgrade.bytes_total"

    invoke-virtual {v5, v1}, Landroid/os/Bundle;->getLong(Ljava/lang/String;)J

    move-result-wide v10

    const-string v1, "com.motorola.ccc.ota.download_percentage"

    invoke-virtual {v5, v1}, Landroid/os/Bundle;->getLong(Ljava/lang/String;)J

    move-result-wide v12

    const-string v1, "com.motorola.blur.service.blur.upgrade.location_type"

    invoke-virtual {v5, v1}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v14

    invoke-virtual {v5, v8}, Landroid/os/Bundle;->getInt(Ljava/lang/String;)I

    move-result v15

    const-string v1, "com.motorola.app.download.wifionly"

    invoke-virtual {v5, v1}, Landroid/os/Bundle;->getBoolean(Ljava/lang/String;)Z

    move-result v16

    invoke-virtual {v5, v7}, Landroid/os/Bundle;->getBoolean(Ljava/lang/String;)Z

    move-result v17

    new-instance v9, Lcom/motorola/ccc/ota/ui/DownloadNotification;

    invoke-direct {v9, v0}, Lcom/motorola/ccc/ota/ui/DownloadNotification;-><init>(Landroid/content/Context;)V

    sget-object v18, Lcom/motorola/ccc/ota/utils/NotificationUtils;->settings:Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    invoke-virtual/range {v9 .. v18}, Lcom/motorola/ccc/ota/ui/DownloadNotification;->updateNotification(JJLjava/lang/String;IZZLcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;)V

    return-void

    :cond_6
    const-string v5, "WifiNotification"

    invoke-virtual {v5, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_7

    new-instance v1, Lcom/motorola/ccc/ota/ui/NotificationHandler;

    invoke-direct {v1, v0}, Lcom/motorola/ccc/ota/ui/NotificationHandler;-><init>(Landroid/content/Context;)V

    invoke-virtual {v1}, Lcom/motorola/ccc/ota/ui/NotificationHandler;->sendWiFiNotification()V

    return-void

    :cond_7
    const-string v5, "MergeRestartNotification"

    invoke-virtual {v5, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_8

    invoke-static {}, Lcom/motorola/ccc/ota/utils/NotificationUtils;->displayMergeRestartNotification()V

    return-void

    :cond_8
    :goto_1
    add-int/lit8 v3, v3, 0x1

    goto/16 :goto_0

    :cond_9
    return-void
.end method

.method public static registerSwipeableNotificationReceiver(Landroid/content/Context;Landroid/content/BroadcastReceiver;)V
    .locals 3

    new-instance v0, Landroid/content/IntentFilter;

    invoke-direct {v0}, Landroid/content/IntentFilter;-><init>()V

    const-string v1, "com.motorola.ccc.ota.ACTION_NOTIFICATION_SWIPED"

    invoke-virtual {v0, v1}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    invoke-virtual {p0}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object v1

    const/4 v2, 0x2

    invoke-virtual {v1, p1, v0, v2}, Landroid/content/Context;->registerReceiver(Landroid/content/BroadcastReceiver;Landroid/content/IntentFilter;I)Landroid/content/Intent;

    new-instance v0, Landroid/content/IntentFilter;

    invoke-direct {v0}, Landroid/content/IntentFilter;-><init>()V

    const-string v1, "com.motorola.blur.service.blur.Actions.UPGRADE_UPDATER_STATE_CLEAR"

    invoke-virtual {v0, v1}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    invoke-static {p0, p1, v0}, Lcom/motorola/otalib/common/utils/BroadcastUtils;->registerLocalReceiver(Landroid/content/Context;Landroid/content/BroadcastReceiver;Landroid/content/IntentFilter;)V

    return-void
.end method

.method public static showLowMemoryNotification(Ljava/lang/String;)V
    .locals 8

    new-instance v0, Landroid/content/Intent;

    const-string v1, "android.settings.INTERNAL_STORAGE_SETTINGS"

    invoke-direct {v0, v1}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    invoke-static {}, Lcom/motorola/ccc/ota/env/OtaApplication;->getGlobalContext()Landroid/content/Context;

    move-result-object v1

    const/high16 v2, 0x4000000

    const/4 v3, 0x0

    invoke-static {v1, v3, v0, v2}, Landroid/app/PendingIntent;->getActivity(Landroid/content/Context;ILandroid/content/Intent;I)Landroid/app/PendingIntent;

    move-result-object v0

    new-instance v2, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    invoke-direct {v2}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;-><init>()V

    sget-object v4, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->METADATA:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    invoke-virtual {v2, v4}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->getString(Lcom/motorola/otalib/common/settings/ISetting;)Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Lcom/motorola/ccc/ota/ui/UpdaterUtils;->getUpdateType(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Lcom/motorola/ccc/ota/ui/updateType/UpdateType;->getUpdateType(Ljava/lang/String;)Lcom/motorola/ccc/ota/ui/updateType/UpdateType$UpdateTypeInterface;

    move-result-object v2

    invoke-virtual {v1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v4

    new-instance v5, Ljava/lang/StringBuilder;

    const-string v6, "<b>"

    invoke-direct {v5, v6}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const v7, 0x7f0e01bf

    invoke-virtual {v4, v7}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v5, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {}, Lcom/motorola/ccc/ota/ui/NotificationChannelCreator;->getUrgentNotificationChannelId()Ljava/lang/String;

    move-result-object v6

    new-instance v7, Landroidx/core/app/NotificationCompat$Builder;

    invoke-direct {v7, v1, v6}, Landroidx/core/app/NotificationCompat$Builder;-><init>(Landroid/content/Context;Ljava/lang/String;)V

    invoke-static {v5, v3}, Landroid/text/Html;->fromHtml(Ljava/lang/String;I)Landroid/text/Spanned;

    move-result-object v3

    invoke-virtual {v7, v3}, Landroidx/core/app/NotificationCompat$Builder;->setContentTitle(Ljava/lang/CharSequence;)Landroidx/core/app/NotificationCompat$Builder;

    move-result-object v3

    invoke-interface {v2}, Lcom/motorola/ccc/ota/ui/updateType/UpdateType$UpdateTypeInterface;->getUpdateSpecificColor()I

    move-result v2

    invoke-virtual {v1}, Landroid/content/Context;->getTheme()Landroid/content/res/Resources$Theme;

    move-result-object v5

    invoke-virtual {v4, v2, v5}, Landroid/content/res/Resources;->getColor(ILandroid/content/res/Resources$Theme;)I

    move-result v2

    invoke-virtual {v3, v2}, Landroidx/core/app/NotificationCompat$Builder;->setColor(I)Landroidx/core/app/NotificationCompat$Builder;

    move-result-object v2

    const v3, 0x7f0800f4

    invoke-virtual {v2, v3}, Landroidx/core/app/NotificationCompat$Builder;->setSmallIcon(I)Landroidx/core/app/NotificationCompat$Builder;

    move-result-object v2

    new-instance v3, Landroidx/core/app/NotificationCompat$BigTextStyle;

    invoke-direct {v3}, Landroidx/core/app/NotificationCompat$BigTextStyle;-><init>()V

    invoke-virtual {v3, p0}, Landroidx/core/app/NotificationCompat$BigTextStyle;->bigText(Ljava/lang/CharSequence;)Landroidx/core/app/NotificationCompat$BigTextStyle;

    move-result-object p0

    invoke-virtual {v2, p0}, Landroidx/core/app/NotificationCompat$Builder;->setStyle(Landroidx/core/app/NotificationCompat$Style;)Landroidx/core/app/NotificationCompat$Builder;

    move-result-object p0

    invoke-virtual {p0, v0}, Landroidx/core/app/NotificationCompat$Builder;->setContentIntent(Landroid/app/PendingIntent;)Landroidx/core/app/NotificationCompat$Builder;

    move-result-object p0

    const-string v0, "alarm"

    invoke-virtual {p0, v0}, Landroidx/core/app/NotificationCompat$Builder;->setCategory(Ljava/lang/String;)Landroidx/core/app/NotificationCompat$Builder;

    move-result-object p0

    const/4 v0, 0x1

    invoke-virtual {p0, v0}, Landroidx/core/app/NotificationCompat$Builder;->setLocalOnly(Z)Landroidx/core/app/NotificationCompat$Builder;

    invoke-virtual {v7}, Landroidx/core/app/NotificationCompat$Builder;->build()Landroid/app/Notification;

    move-result-object p0

    iget v0, p0, Landroid/app/Notification;->flags:I

    or-int/lit8 v0, v0, 0x20

    iput v0, p0, Landroid/app/Notification;->flags:I

    const-string v0, "notification"

    invoke-virtual {v1, v0}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/app/NotificationManager;

    const/16 v1, 0x6c1

    invoke-virtual {v0, v1, p0}, Landroid/app/NotificationManager;->notify(ILandroid/app/Notification;)V

    return-void
.end method

.method public static showOtaLowMemoryNotification(Landroid/content/Context;Landroid/content/Intent;)V
    .locals 2

    invoke-static {p1}, Lcom/motorola/ccc/ota/ui/UpdaterUtils;->isDeviceAtInstallPhase(Landroid/content/Intent;)Z

    move-result v0

    const-string v1, "com.motorola.blur.service.blur.upgrade.location_type"

    invoke-virtual {p1, v1}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    invoke-static {p0, v0, p1}, Lcom/motorola/ccc/ota/utils/NotificationUtils;->fillLowDataStorageNotificationDetails(Landroid/content/Context;ZLjava/lang/String;)Landroid/content/Intent;

    move-result-object p1

    invoke-static {p0, p1}, Lcom/motorola/ccc/ota/utils/NotificationUtils;->startNotificationService(Landroid/content/Context;Landroid/content/Intent;)V

    return-void
.end method

.method public static showSwipeAbleNotification(I)Z
    .locals 1

    const/4 v0, -0x1

    if-eq p0, v0, :cond_1

    invoke-static {}, Lcom/motorola/ccc/ota/utils/NotificationUtils;->isSwipeAbleBitmapSet()Z

    move-result p0

    if-nez p0, :cond_0

    sget-object p0, Lcom/motorola/ccc/ota/utils/NotificationUtils;->settings:Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    invoke-static {p0}, Lcom/motorola/ccc/ota/utils/SmartUpdateUtils;->isDownloadForcedForSmartUpdate(Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;)Z

    move-result p0

    if-eqz p0, :cond_1

    :cond_0
    const/4 p0, 0x1

    return p0

    :cond_1
    const/4 p0, 0x0

    return p0
.end method

.method public static showSwipeAbleNotification(II)Z
    .locals 0

    invoke-static {p0, p1}, Lcom/motorola/ccc/ota/utils/NotificationUtils;->isProgressNotification(II)Z

    move-result p0

    if-eqz p0, :cond_1

    invoke-static {}, Lcom/motorola/ccc/ota/utils/NotificationUtils;->isSwipeAbleBitmapSet()Z

    move-result p0

    const/4 p1, 0x1

    if-eqz p0, :cond_0

    return p1

    :cond_0
    sget-object p0, Lcom/motorola/ccc/ota/utils/NotificationUtils;->settings:Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    invoke-static {p0}, Lcom/motorola/ccc/ota/utils/SmartUpdateUtils;->isDownloadForcedForSmartUpdate(Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;)Z

    move-result p0

    if-eqz p0, :cond_1

    return p1

    :cond_1
    const/4 p0, 0x0

    return p0
.end method

.method public static showVerifyNotification(Landroid/content/Context;Lcom/motorola/otalib/common/utils/UpgradeUtils$DownloadStatus;)V
    .locals 8

    sget-object v0, Lcom/motorola/ccc/ota/utils/NotificationUtils;->settings:Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    sget-object v1, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->METADATA:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    invoke-virtual {v0, v1}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->getString(Lcom/motorola/otalib/common/settings/ISetting;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/motorola/ccc/ota/ui/UpdaterUtils;->getUpdateType(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/motorola/ccc/ota/ui/updateType/UpdateType;->getUpdateType(Ljava/lang/String;)Lcom/motorola/ccc/ota/ui/updateType/UpdateType$UpdateTypeInterface;

    move-result-object v0

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "<b>"

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-interface {v0}, Lcom/motorola/ccc/ota/ui/updateType/UpdateType$UpdateTypeInterface;->getDownloadNotificationTitle()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    sget-object v2, Lcom/motorola/ccc/ota/utils/NotificationUtils$1;->$SwitchMap$com$motorola$otalib$common$utils$UpgradeUtils$DownloadStatus:[I

    invoke-virtual {p1}, Lcom/motorola/otalib/common/utils/UpgradeUtils$DownloadStatus;->ordinal()I

    move-result v3

    aget v2, v2, v3

    const v3, 0x7f0e0152

    packed-switch v2, :pswitch_data_0

    invoke-virtual {p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    invoke-virtual {v2, v3}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v2

    goto/16 :goto_0

    :pswitch_0
    return-void

    :pswitch_1
    invoke-virtual {p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    const v3, 0x7f0e002f

    invoke-virtual {v2, v3}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v2

    goto/16 :goto_0

    :pswitch_2
    invoke-virtual {p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    const v3, 0x7f0e0153

    invoke-virtual {v2, v3}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v2

    goto :goto_0

    :pswitch_3
    invoke-virtual {p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    const v3, 0x7f0e009e

    invoke-virtual {v2, v3}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v2

    goto :goto_0

    :pswitch_4
    invoke-virtual {p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    invoke-virtual {v2, v3}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v2

    goto :goto_0

    :pswitch_5
    invoke-virtual {p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    const v3, 0x7f0e0055

    invoke-virtual {v2, v3}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v2

    goto :goto_0

    :pswitch_6
    invoke-static {}, Lcom/motorola/ccc/ota/env/CusAndroidUtils;->isDeviceInDatasaverMode()Z

    move-result v2

    if-eqz v2, :cond_0

    invoke-virtual {p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    const v3, 0x7f0e014e

    invoke-virtual {v2, v3}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v2

    goto :goto_0

    :cond_0
    invoke-static {p0}, Lcom/motorola/ccc/ota/ui/UpdaterUtils;->isDataNetworkRoaming(Landroid/content/Context;)Z

    move-result v2

    if-eqz v2, :cond_1

    invoke-virtual {p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    const v3, 0x7f0e0150

    invoke-virtual {v2, v3}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v2

    goto :goto_0

    :cond_1
    invoke-static {}, Lcom/motorola/ccc/ota/ui/UpdaterUtils;->isAdminAPNEnabled()Z

    move-result v2

    if-eqz v2, :cond_2

    invoke-virtual {p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    const v3, 0x7f0e014f

    invoke-virtual {v2, v3}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v2

    goto :goto_0

    :cond_2
    invoke-virtual {p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    const v3, 0x7f0e014d

    invoke-virtual {v2, v3}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v2

    :goto_0
    invoke-virtual {p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v3

    const-string v4, "notification"

    invoke-virtual {p0, v4}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Landroid/app/NotificationManager;

    new-instance v5, Landroidx/core/app/NotificationCompat$Builder;

    invoke-static {}, Lcom/motorola/ccc/ota/ui/NotificationChannelCreator;->getMediumNotificationChannelId()Ljava/lang/String;

    move-result-object v6

    invoke-direct {v5, p0, v6}, Landroidx/core/app/NotificationCompat$Builder;-><init>(Landroid/content/Context;Ljava/lang/String;)V

    const/4 v6, 0x0

    invoke-static {v1, v6}, Landroid/text/Html;->fromHtml(Ljava/lang/String;I)Landroid/text/Spanned;

    move-result-object v1

    invoke-virtual {v5, v1}, Landroidx/core/app/NotificationCompat$Builder;->setContentTitle(Ljava/lang/CharSequence;)Landroidx/core/app/NotificationCompat$Builder;

    invoke-interface {v0}, Lcom/motorola/ccc/ota/ui/updateType/UpdateType$UpdateTypeInterface;->getUpdateSpecificColor()I

    move-result v0

    invoke-virtual {p0}, Landroid/content/Context;->getTheme()Landroid/content/res/Resources$Theme;

    move-result-object v1

    invoke-virtual {v3, v0, v1}, Landroid/content/res/Resources;->getColor(ILandroid/content/res/Resources$Theme;)I

    move-result v0

    invoke-virtual {v5, v0}, Landroidx/core/app/NotificationCompat$Builder;->setColor(I)Landroidx/core/app/NotificationCompat$Builder;

    const-wide/16 v0, 0x0

    invoke-virtual {v5, v0, v1}, Landroidx/core/app/NotificationCompat$Builder;->setWhen(J)Landroidx/core/app/NotificationCompat$Builder;

    const v0, 0x1080081

    invoke-virtual {v5, v0}, Landroidx/core/app/NotificationCompat$Builder;->setSmallIcon(I)Landroidx/core/app/NotificationCompat$Builder;

    new-instance v0, Landroidx/core/app/NotificationCompat$BigTextStyle;

    invoke-direct {v0}, Landroidx/core/app/NotificationCompat$BigTextStyle;-><init>()V

    invoke-virtual {v0, v2}, Landroidx/core/app/NotificationCompat$BigTextStyle;->bigText(Ljava/lang/CharSequence;)Landroidx/core/app/NotificationCompat$BigTextStyle;

    move-result-object v0

    invoke-virtual {v5, v0}, Landroidx/core/app/NotificationCompat$Builder;->setStyle(Landroidx/core/app/NotificationCompat$Style;)Landroidx/core/app/NotificationCompat$Builder;

    const/4 v0, 0x1

    invoke-virtual {v5, v0}, Landroidx/core/app/NotificationCompat$Builder;->setLocalOnly(Z)Landroidx/core/app/NotificationCompat$Builder;

    const-string v0, "alarm"

    invoke-virtual {v5, v0}, Landroidx/core/app/NotificationCompat$Builder;->setCategory(Ljava/lang/String;)Landroidx/core/app/NotificationCompat$Builder;

    invoke-static {}, Lcom/motorola/ccc/ota/ui/UpdaterUtils;->showCancelOption()Z

    move-result v0

    if-eqz v0, :cond_3

    new-instance v0, Landroid/content/Intent;

    const-string v1, "com.motorola.ccc.ota.Actions.USER_CANCEL_BACKGROUND_INSTALL"

    invoke-direct {v0, v1}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    new-instance v1, Landroid/content/ComponentName;

    invoke-static {}, Lcom/motorola/ccc/ota/env/OtaApplication;->getGlobalContext()Landroid/content/Context;

    move-result-object v2

    const-class v7, Lcom/motorola/ccc/ota/ui/UpdateReceiver;

    invoke-direct {v1, v2, v7}, Landroid/content/ComponentName;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    invoke-virtual {v0, v1}, Landroid/content/Intent;->setComponent(Landroid/content/ComponentName;)Landroid/content/Intent;

    const/high16 v1, 0x4000000

    invoke-static {p0, v6, v0, v1}, Landroid/app/PendingIntent;->getBroadcast(Landroid/content/Context;ILandroid/content/Intent;I)Landroid/app/PendingIntent;

    move-result-object v0

    const v1, 0x7f0e0067

    invoke-virtual {v3, v1}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v1

    const v2, 0x7f060034

    invoke-static {v1, v2}, Lcom/motorola/ccc/ota/utils/NotificationUtils;->getActionBtnText(Ljava/lang/String;I)Landroid/text/Spannable;

    move-result-object v1

    const v2, 0x1080038

    invoke-virtual {v5, v2, v1, v0}, Landroidx/core/app/NotificationCompat$Builder;->addAction(ILjava/lang/CharSequence;Landroid/app/PendingIntent;)Landroidx/core/app/NotificationCompat$Builder;

    :cond_3
    new-instance v0, Landroid/content/Intent;

    const-class v1, Lcom/motorola/ccc/ota/ui/BaseActivity;

    invoke-direct {v0, p0, v1}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    sget-object v1, Lcom/motorola/ccc/ota/utils/UpgradeUtilConstants$FragmentTypeEnum;->BACKGROUND_INSTALLATION_FRAGMENT:Lcom/motorola/ccc/ota/utils/UpgradeUtilConstants$FragmentTypeEnum;

    invoke-virtual {v1}, Lcom/motorola/ccc/ota/utils/UpgradeUtilConstants$FragmentTypeEnum;->toString()Ljava/lang/String;

    move-result-object v1

    const-string v2, "fragment_type"

    invoke-virtual {v0, v2, v1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    const/high16 v1, 0x30000000

    invoke-virtual {v0, v1}, Landroid/content/Intent;->setFlags(I)Landroid/content/Intent;

    const/high16 v1, 0xc000000

    invoke-static {p0, v6, v0, v1}, Landroid/app/PendingIntent;->getActivity(Landroid/content/Context;ILandroid/content/Intent;I)Landroid/app/PendingIntent;

    move-result-object p0

    invoke-virtual {v5, p0}, Landroidx/core/app/NotificationCompat$Builder;->setContentIntent(Landroid/app/PendingIntent;)Landroidx/core/app/NotificationCompat$Builder;

    new-instance p0, Landroid/os/Bundle;

    invoke-direct {p0}, Landroid/os/Bundle;-><init>()V

    const-string v0, "NOTIFICATION_TYPE"

    const-string v1, "StatusVerify"

    invoke-virtual {p0, v0, v1}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    const-string v0, "NotificationDownloadStatus"

    invoke-virtual {p1}, Lcom/motorola/otalib/common/utils/UpgradeUtils$DownloadStatus;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p0, v0, p1}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v5, p0}, Landroidx/core/app/NotificationCompat$Builder;->setExtras(Landroid/os/Bundle;)Landroidx/core/app/NotificationCompat$Builder;

    invoke-virtual {v5}, Landroidx/core/app/NotificationCompat$Builder;->build()Landroid/app/Notification;

    move-result-object p0

    iget p1, p0, Landroid/app/Notification;->flags:I

    or-int/lit8 p1, p1, 0x2

    iput p1, p0, Landroid/app/Notification;->flags:I

    const/16 p1, 0x6c1

    invoke-virtual {v4, p1, p0}, Landroid/app/NotificationManager;->notify(ILandroid/app/Notification;)V

    return-void

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_6
        :pswitch_5
        :pswitch_4
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method public static startNotificationService(Landroid/content/Context;Landroid/content/Intent;)V
    .locals 0

    invoke-virtual {p0, p1}, Landroid/content/Context;->startService(Landroid/content/Intent;)Landroid/content/ComponentName;

    return-void
.end method

.method public static stopNotificationService(Landroid/content/Context;)V
    .locals 2

    new-instance v0, Landroid/content/Intent;

    const-class v1, Lcom/motorola/ccc/ota/ui/NotificationService;

    invoke-direct {v0, p0, v1}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    invoke-virtual {p0, v0}, Landroid/content/Context;->stopService(Landroid/content/Intent;)Z

    return-void
.end method

.method public static unRegisterSwipeableNotificationReceiver(Landroid/content/Context;Landroid/content/BroadcastReceiver;)V
    .locals 1

    :try_start_0
    invoke-virtual {p0, p1}, Landroid/content/Context;->unregisterReceiver(Landroid/content/BroadcastReceiver;)V

    invoke-static {p0, p1}, Lcom/motorola/otalib/common/utils/BroadcastUtils;->unregisterLocalReceiver(Landroid/content/Context;Landroid/content/BroadcastReceiver;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception p0

    new-instance p1, Ljava/lang/StringBuilder;

    const-string v0, "Caught exception "

    invoke-direct {p1, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    const-string p1, "OtaApp"

    invoke-static {p1, p0}, Lcom/motorola/ccc/ota/utils/Logger;->debug(Ljava/lang/String;Ljava/lang/String;)V

    :goto_0
    return-void
.end method
