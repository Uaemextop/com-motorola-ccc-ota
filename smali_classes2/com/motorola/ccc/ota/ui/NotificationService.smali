.class public Lcom/motorola/ccc/ota/ui/NotificationService;
.super Landroid/app/Service;
.source "NotificationService.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/motorola/ccc/ota/ui/NotificationService$MyIntentReceiver;
    }
.end annotation


# static fields
.field private static final ALARM_ACTION:Ljava/lang/String; = "com.motorola.ccc.ota.ns.alarmtriggerintent"

.field private static final MY_ACTION:Ljava/lang/String; = "com.motorola.ccc.ota.ns.alarmintent"


# instance fields
.field private channelId:Ljava/lang/String;

.field private isLowMemoryNotification:Z

.field private mAction:Ljava/lang/String;

.field private mAlarmManager:Landroid/app/AlarmManager;

.field private mAlarmPendingIntent:Landroid/app/PendingIntent;

.field private mMessage:Ljava/lang/String;

.field private mNextPrompt:J

.field private mNotificationExpiryMins:I

.field private mNotificationInStatusBar:Z

.field private mNotificationManager:Landroid/app/NotificationManager;

.field private mPendingIntent:Landroid/app/PendingIntent;

.field private mRecv:Lcom/motorola/ccc/ota/ui/NotificationService$MyIntentReceiver;

.field private mRespondBackForSystemUpdates:Z

.field private mResponseAsBroadcast:Z

.field private mResponseIntent:Landroid/content/Intent;

.field private mTitle:Ljava/lang/String;

.field private mVersion:Ljava/lang/String;

.field private progressPercentage:F

.field private settings:Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;


# direct methods
.method static bridge synthetic -$$Nest$fgetmAction(Lcom/motorola/ccc/ota/ui/NotificationService;)Ljava/lang/String;
    .locals 0

    iget-object p0, p0, Lcom/motorola/ccc/ota/ui/NotificationService;->mAction:Ljava/lang/String;

    return-object p0
.end method

.method static bridge synthetic -$$Nest$fgetmRecv(Lcom/motorola/ccc/ota/ui/NotificationService;)Lcom/motorola/ccc/ota/ui/NotificationService$MyIntentReceiver;
    .locals 0

    iget-object p0, p0, Lcom/motorola/ccc/ota/ui/NotificationService;->mRecv:Lcom/motorola/ccc/ota/ui/NotificationService$MyIntentReceiver;

    return-object p0
.end method

.method static bridge synthetic -$$Nest$fgetmRespondBackForSystemUpdates(Lcom/motorola/ccc/ota/ui/NotificationService;)Z
    .locals 0

    iget-boolean p0, p0, Lcom/motorola/ccc/ota/ui/NotificationService;->mRespondBackForSystemUpdates:Z

    return p0
.end method

.method static bridge synthetic -$$Nest$fgetmResponseAsBroadcast(Lcom/motorola/ccc/ota/ui/NotificationService;)Z
    .locals 0

    iget-boolean p0, p0, Lcom/motorola/ccc/ota/ui/NotificationService;->mResponseAsBroadcast:Z

    return p0
.end method

.method static bridge synthetic -$$Nest$fgetmResponseIntent(Lcom/motorola/ccc/ota/ui/NotificationService;)Landroid/content/Intent;
    .locals 0

    iget-object p0, p0, Lcom/motorola/ccc/ota/ui/NotificationService;->mResponseIntent:Landroid/content/Intent;

    return-object p0
.end method

.method static bridge synthetic -$$Nest$fgetsettings(Lcom/motorola/ccc/ota/ui/NotificationService;)Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;
    .locals 0

    iget-object p0, p0, Lcom/motorola/ccc/ota/ui/NotificationService;->settings:Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    return-object p0
.end method

.method static bridge synthetic -$$Nest$mclearState(Lcom/motorola/ccc/ota/ui/NotificationService;)V
    .locals 0

    invoke-direct {p0}, Lcom/motorola/ccc/ota/ui/NotificationService;->clearState()V

    return-void
.end method

.method public constructor <init>()V
    .locals 2

    invoke-direct {p0}, Landroid/app/Service;-><init>()V

    new-instance v0, Lcom/motorola/ccc/ota/ui/NotificationService$MyIntentReceiver;

    const/4 v1, 0x0

    invoke-direct {v0, p0, v1}, Lcom/motorola/ccc/ota/ui/NotificationService$MyIntentReceiver;-><init>(Lcom/motorola/ccc/ota/ui/NotificationService;Lcom/motorola/ccc/ota/ui/NotificationService$MyIntentReceiver-IA;)V

    iput-object v0, p0, Lcom/motorola/ccc/ota/ui/NotificationService;->mRecv:Lcom/motorola/ccc/ota/ui/NotificationService$MyIntentReceiver;

    return-void
.end method

.method private clearState()V
    .locals 2

    iget-object v0, p0, Lcom/motorola/ccc/ota/ui/NotificationService;->settings:Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    sget-object v1, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->NOTIFICATION_NEXT_PROMPT:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    invoke-virtual {v0, v1}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->removeConfig(Lcom/motorola/otalib/common/settings/ISetting;)V

    iget-object p0, p0, Lcom/motorola/ccc/ota/ui/NotificationService;->settings:Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    sget-object v0, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->ACTIVITY_NEXT_PROMPT:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    invoke-virtual {p0, v0}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->removeConfig(Lcom/motorola/otalib/common/settings/ISetting;)V

    return-void
.end method

.method private displayNotification(Ljava/lang/String;Ljava/lang/String;Landroid/content/Intent;)V
    .locals 9

    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/motorola/ccc/ota/ui/NotificationService;->mNotificationInStatusBar:Z

    new-instance v1, Landroid/widget/RemoteViews;

    invoke-virtual {p0}, Lcom/motorola/ccc/ota/ui/NotificationService;->getPackageName()Ljava/lang/String;

    move-result-object v2

    const v3, 0x7f0c0023

    invoke-direct {v1, v2, v3}, Landroid/widget/RemoteViews;-><init>(Ljava/lang/String;I)V

    const v2, 0x7f0901e5

    invoke-virtual {v1, v2, p1}, Landroid/widget/RemoteViews;->setTextViewText(ILjava/lang/CharSequence;)V

    const v3, 0x7f0901e4

    invoke-virtual {v1, v3, p2}, Landroid/widget/RemoteViews;->setTextViewText(ILjava/lang/CharSequence;)V

    new-instance v4, Landroid/widget/RemoteViews;

    invoke-virtual {p0}, Lcom/motorola/ccc/ota/ui/NotificationService;->getPackageName()Ljava/lang/String;

    move-result-object v5

    const v6, 0x7f0c0024

    invoke-direct {v4, v5, v6}, Landroid/widget/RemoteViews;-><init>(Ljava/lang/String;I)V

    invoke-virtual {v4, v2, p1}, Landroid/widget/RemoteViews;->setTextViewText(ILjava/lang/CharSequence;)V

    invoke-virtual {v4, v3, p2}, Landroid/widget/RemoteViews;->setTextViewText(ILjava/lang/CharSequence;)V

    invoke-direct {p0}, Lcom/motorola/ccc/ota/ui/NotificationService;->getUpdateTypeInterface()Lcom/motorola/ccc/ota/ui/updateType/UpdateType$UpdateTypeInterface;

    move-result-object p1

    new-instance p2, Landroidx/core/app/NotificationCompat$Builder;

    iget-object v2, p0, Lcom/motorola/ccc/ota/ui/NotificationService;->channelId:Ljava/lang/String;

    invoke-direct {p2, p0, v2}, Landroidx/core/app/NotificationCompat$Builder;-><init>(Landroid/content/Context;Ljava/lang/String;)V

    const v2, 0x7f0800f4

    invoke-virtual {p2, v2}, Landroidx/core/app/NotificationCompat$Builder;->setSmallIcon(I)Landroidx/core/app/NotificationCompat$Builder;

    move-result-object p2

    invoke-virtual {p0}, Lcom/motorola/ccc/ota/ui/NotificationService;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    invoke-interface {p1}, Lcom/motorola/ccc/ota/ui/updateType/UpdateType$UpdateTypeInterface;->getUpdateSpecificColor()I

    move-result p1

    invoke-virtual {p0}, Lcom/motorola/ccc/ota/ui/NotificationService;->getApplicationContext()Landroid/content/Context;

    move-result-object v3

    invoke-virtual {v3}, Landroid/content/Context;->getTheme()Landroid/content/res/Resources$Theme;

    move-result-object v3

    invoke-virtual {v2, p1, v3}, Landroid/content/res/Resources;->getColor(ILandroid/content/res/Resources$Theme;)I

    move-result p1

    invoke-virtual {p2, p1}, Landroidx/core/app/NotificationCompat$Builder;->setColor(I)Landroidx/core/app/NotificationCompat$Builder;

    move-result-object p1

    new-instance p2, Landroidx/core/app/NotificationCompat$DecoratedCustomViewStyle;

    invoke-direct {p2}, Landroidx/core/app/NotificationCompat$DecoratedCustomViewStyle;-><init>()V

    invoke-virtual {p1, p2}, Landroidx/core/app/NotificationCompat$Builder;->setStyle(Landroidx/core/app/NotificationCompat$Style;)Landroidx/core/app/NotificationCompat$Builder;

    move-result-object p1

    invoke-virtual {p1, v1}, Landroidx/core/app/NotificationCompat$Builder;->setCustomContentView(Landroid/widget/RemoteViews;)Landroidx/core/app/NotificationCompat$Builder;

    move-result-object p1

    iget-object p2, p0, Lcom/motorola/ccc/ota/ui/NotificationService;->mPendingIntent:Landroid/app/PendingIntent;

    invoke-virtual {p1, p2}, Landroidx/core/app/NotificationCompat$Builder;->setContentIntent(Landroid/app/PendingIntent;)Landroidx/core/app/NotificationCompat$Builder;

    move-result-object p1

    invoke-virtual {p1, v0}, Landroidx/core/app/NotificationCompat$Builder;->setLocalOnly(Z)Landroidx/core/app/NotificationCompat$Builder;

    move-result-object p1

    const-string p2, "alarm"

    invoke-virtual {p1, p2}, Landroidx/core/app/NotificationCompat$Builder;->setCategory(Ljava/lang/String;)Landroidx/core/app/NotificationCompat$Builder;

    move-result-object p1

    new-instance p2, Landroid/os/Bundle;

    invoke-direct {p2}, Landroid/os/Bundle;-><init>()V

    const-string v1, "NOTIFICATION_TYPE"

    const-string v2, "NotificationService"

    invoke-virtual {p2, v1, v2}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    const-string v1, "NotificationLowMemory"

    iget-boolean v2, p0, Lcom/motorola/ccc/ota/ui/NotificationService;->isLowMemoryNotification:Z

    invoke-virtual {p2, v1, v2}, Landroid/os/Bundle;->putBoolean(Ljava/lang/String;Z)V

    const-string v1, "UpdateKey"

    invoke-virtual {p3, v1}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    const-string v3, "UpdateNotificationServiceType"

    invoke-virtual {p2, v3, v2}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    const-string v2, "NotificationIntent"

    iget-object v4, p0, Lcom/motorola/ccc/ota/ui/NotificationService;->mResponseIntent:Landroid/content/Intent;

    invoke-virtual {p2, v2, v4}, Landroid/os/Bundle;->putParcelable(Ljava/lang/String;Landroid/os/Parcelable;)V

    invoke-static {}, Lcom/motorola/ccc/ota/utils/BuildPropReader;->isStreamingUpdate()Z

    move-result v2

    if-eqz v2, :cond_0

    const v2, 0x7f0e01d0

    invoke-virtual {p0, v2}, Lcom/motorola/ccc/ota/ui/NotificationService;->getString(I)Ljava/lang/String;

    move-result-object v2

    goto :goto_0

    :cond_0
    const v2, 0x7f0e00c7

    invoke-virtual {p0, v2}, Lcom/motorola/ccc/ota/ui/NotificationService;->getString(I)Ljava/lang/String;

    move-result-object v2

    :goto_0
    const-string v4, "Download"

    invoke-virtual {p3, v1}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v4, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    const/high16 v4, 0x14000000

    const v5, 0x7f060034

    const/4 v6, 0x0

    if-eqz v1, :cond_2

    invoke-static {}, Lcom/motorola/ccc/ota/ui/UpdaterUtils;->isWifiOnly()Z

    move-result v1

    if-eqz v1, :cond_1

    new-instance v1, Landroid/content/Intent;

    const-string v7, "com.motorola.blur.service.blur.Actions.UPGRADE_UPDATE_NOTIFICATION_RESPONSE"

    invoke-direct {v1, v7}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    sget-object v7, Lcom/motorola/ccc/ota/sources/UpgradeSourceType;->upgrade:Lcom/motorola/ccc/ota/sources/UpgradeSourceType;

    invoke-virtual {v7}, Lcom/motorola/ccc/ota/sources/UpgradeSourceType;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-static {v7}, Lcom/motorola/ccc/ota/utils/BuildPropReader;->getDeviceSha1(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    const-string v8, "com.motorola.blur.service.blur.upgrade.version"

    invoke-virtual {v1, v8, v7}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    const-string v7, "com.motorola.blur.service.blur.upgrade.response_action"

    invoke-virtual {v1, v7, v0}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Z)Landroid/content/Intent;

    sget-object v7, Lcom/motorola/ccc/ota/utils/UpgradeUtilConstants$ResponseFlavour;->RESPONSE_FLAVOUR_WIFI:Lcom/motorola/ccc/ota/utils/UpgradeUtilConstants$ResponseFlavour;

    invoke-virtual {v7}, Lcom/motorola/ccc/ota/utils/UpgradeUtilConstants$ResponseFlavour;->name()Ljava/lang/String;

    move-result-object v7

    const-string v8, "com.motorola.blur.service.blur.upgrade.response_flavour"

    invoke-virtual {v1, v8, v7}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    const-string v7, "com.motorola.ccc.ota.KEY_DOWNLOAD_MODE"

    const-string v8, "userInitiatedDLFromNotification"

    invoke-virtual {v1, v7, v8}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    goto :goto_1

    :cond_1
    new-instance v1, Landroid/content/Intent;

    const-string v7, "com.motorola.ccc.ota.UPGRADE_UPDATE_NOTIFICATION_AVAILABLE_RESPONSE"

    invoke-direct {v1, v7}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    iget-object v7, p0, Lcom/motorola/ccc/ota/ui/NotificationService;->settings:Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    sget-object v8, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->METADATA:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    invoke-virtual {v7, v8}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->getString(Lcom/motorola/otalib/common/settings/ISetting;)Ljava/lang/String;

    move-result-object v7

    const-string v8, "com.motorola.blur.service.blur.upgrade.metadata"

    invoke-virtual {v1, v8, v7}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    const-string v7, "com.motorola.blur.service.blur.upgrade.download_from_notify"

    invoke-virtual {v1, v7, v0}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Z)Landroid/content/Intent;

    :goto_1
    invoke-virtual {p0}, Lcom/motorola/ccc/ota/ui/NotificationService;->getApplicationContext()Landroid/content/Context;

    move-result-object v7

    invoke-static {v7, v6, v1, v4}, Landroid/app/PendingIntent;->getBroadcast(Landroid/content/Context;ILandroid/content/Intent;I)Landroid/app/PendingIntent;

    move-result-object v1

    const v7, 0x7f0800cd

    invoke-static {v2, v5}, Lcom/motorola/ccc/ota/utils/NotificationUtils;->getActionBtnText(Ljava/lang/String;I)Landroid/text/Spannable;

    move-result-object v2

    invoke-virtual {p1, v7, v2, v1}, Landroidx/core/app/NotificationCompat$Builder;->addAction(ILjava/lang/CharSequence;Landroid/app/PendingIntent;)Landroidx/core/app/NotificationCompat$Builder;

    :cond_2
    iget v1, p0, Lcom/motorola/ccc/ota/ui/NotificationService;->progressPercentage:F

    const/high16 v2, -0x40800000    # -1.0f

    cmpl-float v1, v1, v2

    if-lez v1, :cond_3

    invoke-static {}, Ljava/text/NumberFormat;->getPercentInstance()Ljava/text/NumberFormat;

    move-result-object v1

    iget v2, p0, Lcom/motorola/ccc/ota/ui/NotificationService;->progressPercentage:F

    const/high16 v7, 0x42c80000    # 100.0f

    div-float/2addr v2, v7

    float-to-double v7, v2

    invoke-virtual {v1, v7, v8}, Ljava/text/NumberFormat;->format(D)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p1, v1}, Landroidx/core/app/NotificationCompat$Builder;->setSubText(Ljava/lang/CharSequence;)Landroidx/core/app/NotificationCompat$Builder;

    :cond_3
    const-string v1, "com.motorola.ccc.ota.UPGRADE_RESTART_NOTIFICATION"

    iget-object v2, p0, Lcom/motorola/ccc/ota/ui/NotificationService;->mAction:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    const-string v2, "com.motorola.ccc.ota.UPGRADE_INSTALL_NOTIFICATION_AVAILABLE"

    if-nez v1, :cond_5

    iget-object v1, p0, Lcom/motorola/ccc/ota/ui/NotificationService;->mAction:Ljava/lang/String;

    invoke-virtual {v2, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_4

    goto :goto_2

    :cond_4
    const-string v0, "com.motorola.ccc.ota.ACTION_PAUSE_DOWNLOAD_FOR_CELLULAR"

    iget-object v1, p0, Lcom/motorola/ccc/ota/ui/NotificationService;->mAction:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_7

    const-string v0, "BuilderActionIntent"

    invoke-virtual {p3, v0}, Landroid/content/Intent;->getParcelableExtra(Ljava/lang/String;)Landroid/os/Parcelable;

    move-result-object p3

    check-cast p3, Landroid/content/Intent;

    new-instance v0, Landroid/content/ComponentName;

    invoke-static {}, Lcom/motorola/ccc/ota/env/OtaApplication;->getGlobalContext()Landroid/content/Context;

    move-result-object v1

    const-class v2, Lcom/motorola/ccc/ota/ui/UpdateReceiver;

    invoke-direct {v0, v1, v2}, Landroid/content/ComponentName;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    invoke-virtual {p3, v0}, Landroid/content/Intent;->setComponent(Landroid/content/ComponentName;)Landroid/content/Intent;

    invoke-static {}, Lcom/motorola/ccc/ota/env/OtaApplication;->getGlobalContext()Landroid/content/Context;

    move-result-object v0

    const/high16 v1, 0x4000000

    invoke-static {v0, v6, p3, v1}, Landroid/app/PendingIntent;->getBroadcast(Landroid/content/Context;ILandroid/content/Intent;I)Landroid/app/PendingIntent;

    move-result-object p3

    iget-object v0, p0, Lcom/motorola/ccc/ota/ui/NotificationService;->settings:Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    sget-object v1, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->BATTERY_LOW:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    invoke-virtual {v0, v1}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->getBoolean(Lcom/motorola/otalib/common/settings/ISetting;)Z

    move-result v0

    if-nez v0, :cond_7

    invoke-virtual {p0}, Lcom/motorola/ccc/ota/ui/NotificationService;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    const v1, 0x7f0e0177

    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0, v5}, Lcom/motorola/ccc/ota/utils/NotificationUtils;->getActionBtnText(Ljava/lang/String;I)Landroid/text/Spannable;

    move-result-object v0

    const v1, 0x1080038

    invoke-virtual {p1, v1, v0, p3}, Landroidx/core/app/NotificationCompat$Builder;->addAction(ILjava/lang/CharSequence;Landroid/app/PendingIntent;)Landroidx/core/app/NotificationCompat$Builder;

    goto :goto_3

    :cond_5
    :goto_2
    iget-object p3, p0, Lcom/motorola/ccc/ota/ui/NotificationService;->mVersion:Ljava/lang/String;

    const-string v1, "userInitiatedRestartFromNotification"

    invoke-static {p0, p3, v0, v6, v1}, Lcom/motorola/ccc/ota/utils/UpgradeUtilMethods;->getUpgradeLaunchProceed(Landroid/content/Context;Ljava/lang/String;ZZLjava/lang/String;)Landroid/content/Intent;

    move-result-object p3

    const v1, 0x7f0e0174

    invoke-virtual {p0, v1}, Lcom/motorola/ccc/ota/ui/NotificationService;->getString(I)Ljava/lang/String;

    move-result-object v1

    const-string v7, "Restart"

    invoke-virtual {p2, v3, v7}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    iget-object v7, p0, Lcom/motorola/ccc/ota/ui/NotificationService;->mAction:Ljava/lang/String;

    invoke-virtual {v2, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_6

    const p3, 0x7f0e010c

    invoke-virtual {p0, p3}, Lcom/motorola/ccc/ota/ui/NotificationService;->getString(I)Ljava/lang/String;

    move-result-object v1

    iget-object p3, p0, Lcom/motorola/ccc/ota/ui/NotificationService;->mVersion:Ljava/lang/String;

    const-string v2, "userInitiatedInstallFromNotification"

    invoke-static {p0, p3, v0, v0, v2}, Lcom/motorola/ccc/ota/utils/UpgradeUtilMethods;->getUpgradeLaunchProceed(Landroid/content/Context;Ljava/lang/String;ZZLjava/lang/String;)Landroid/content/Intent;

    move-result-object p3

    const-string v0, "Install"

    invoke-virtual {p2, v3, v0}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    :cond_6
    invoke-virtual {p0}, Lcom/motorola/ccc/ota/ui/NotificationService;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0, v6, p3, v4}, Landroid/app/PendingIntent;->getBroadcast(Landroid/content/Context;ILandroid/content/Intent;I)Landroid/app/PendingIntent;

    move-result-object p3

    const v0, 0x7f0800cf

    invoke-static {v1, v5}, Lcom/motorola/ccc/ota/utils/NotificationUtils;->getActionBtnText(Ljava/lang/String;I)Landroid/text/Spannable;

    move-result-object v1

    invoke-virtual {p1, v0, v1, p3}, Landroidx/core/app/NotificationCompat$Builder;->addAction(ILjava/lang/CharSequence;Landroid/app/PendingIntent;)Landroidx/core/app/NotificationCompat$Builder;

    :cond_7
    :goto_3
    invoke-virtual {p1, p2}, Landroidx/core/app/NotificationCompat$Builder;->setExtras(Landroid/os/Bundle;)Landroidx/core/app/NotificationCompat$Builder;

    invoke-virtual {p1}, Landroidx/core/app/NotificationCompat$Builder;->build()Landroid/app/Notification;

    move-result-object p1

    iget p2, p1, Landroid/app/Notification;->flags:I

    or-int/lit8 p2, p2, 0x20

    iput p2, p1, Landroid/app/Notification;->flags:I

    iget-object p0, p0, Lcom/motorola/ccc/ota/ui/NotificationService;->mNotificationManager:Landroid/app/NotificationManager;

    const/16 p2, 0x6c1

    invoke-virtual {p0, p2, p1}, Landroid/app/NotificationManager;->notify(ILandroid/app/Notification;)V

    return-void
.end method

.method private getUpdateTypeInterface()Lcom/motorola/ccc/ota/ui/updateType/UpdateType$UpdateTypeInterface;
    .locals 0

    iget-object p0, p0, Lcom/motorola/ccc/ota/ui/NotificationService;->mResponseIntent:Landroid/content/Intent;

    invoke-static {p0}, Lcom/motorola/ccc/ota/ui/UpdaterUtils;->getUpgradeInfoDuringOTAUpdate(Landroid/content/Intent;)Lcom/motorola/ccc/ota/ui/UpdaterUtils$UpgradeInfo;

    move-result-object p0

    if-eqz p0, :cond_0

    invoke-virtual {p0}, Lcom/motorola/ccc/ota/ui/UpdaterUtils$UpgradeInfo;->getUpdateTypeData()Ljava/lang/String;

    move-result-object p0

    invoke-static {p0}, Lcom/motorola/ccc/ota/ui/updateType/UpdateType;->getUpdateType(Ljava/lang/String;)Lcom/motorola/ccc/ota/ui/updateType/UpdateType$UpdateTypeInterface;

    move-result-object p0

    return-object p0

    :cond_0
    sget-object p0, Lcom/motorola/ccc/ota/ui/updateType/UpdateType$DIFFUpdateType;->DEFAULT:Lcom/motorola/ccc/ota/ui/updateType/UpdateType$DIFFUpdateType;

    invoke-virtual {p0}, Lcom/motorola/ccc/ota/ui/updateType/UpdateType$DIFFUpdateType;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-static {p0}, Lcom/motorola/ccc/ota/ui/updateType/UpdateType;->getUpdateType(Ljava/lang/String;)Lcom/motorola/ccc/ota/ui/updateType/UpdateType$UpdateTypeInterface;

    move-result-object p0

    return-object p0
.end method

.method private handleIntent(Landroid/content/Intent;)V
    .locals 9

    const-string v0, "Title"

    invoke-virtual {p1, v0}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/motorola/ccc/ota/ui/NotificationService;->mTitle:Ljava/lang/String;

    const-string v0, "Message"

    invoke-virtual {p1, v0}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/motorola/ccc/ota/ui/NotificationService;->mMessage:Ljava/lang/String;

    const-string v0, "PendingIntent"

    invoke-virtual {p1, v0}, Landroid/content/Intent;->getParcelableExtra(Ljava/lang/String;)Landroid/os/Parcelable;

    move-result-object v0

    check-cast v0, Landroid/content/Intent;

    iput-object v0, p0, Lcom/motorola/ccc/ota/ui/NotificationService;->mResponseIntent:Landroid/content/Intent;

    const-string v0, "IntentCallBack"

    const/4 v1, 0x0

    invoke-virtual {p1, v0, v1}, Landroid/content/Intent;->getBooleanExtra(Ljava/lang/String;Z)Z

    move-result v0

    iput-boolean v0, p0, Lcom/motorola/ccc/ota/ui/NotificationService;->mResponseAsBroadcast:Z

    const-string v0, "NotificationTimerExpiry"

    const/16 v2, 0x5a0

    invoke-virtual {p1, v0, v2}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I

    move-result v0

    iput v0, p0, Lcom/motorola/ccc/ota/ui/NotificationService;->mNotificationExpiryMins:I

    const-string v0, "RespondForSystemUpdates"

    invoke-virtual {p1, v0, v1}, Landroid/content/Intent;->getBooleanExtra(Ljava/lang/String;Z)Z

    move-result v0

    iput-boolean v0, p0, Lcom/motorola/ccc/ota/ui/NotificationService;->mRespondBackForSystemUpdates:Z

    const-string v0, "KeyProgressPercentage"

    const/high16 v2, -0x40800000    # -1.0f

    invoke-virtual {p1, v0, v2}, Landroid/content/Intent;->getFloatExtra(Ljava/lang/String;F)F

    move-result v0

    iput v0, p0, Lcom/motorola/ccc/ota/ui/NotificationService;->progressPercentage:F

    const-string v0, "NotificationLowMemory"

    invoke-virtual {p1, v0, v1}, Landroid/content/Intent;->getBooleanExtra(Ljava/lang/String;Z)Z

    move-result v0

    iput-boolean v0, p0, Lcom/motorola/ccc/ota/ui/NotificationService;->isLowMemoryNotification:Z

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v2

    iget-object v0, p0, Lcom/motorola/ccc/ota/ui/NotificationService;->settings:Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    sget-object v4, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->NOTIFICATION_NEXT_PROMPT:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    const-wide/16 v5, 0x0

    invoke-virtual {v0, v4, v5, v6}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->getLong(Lcom/motorola/otalib/common/settings/ISetting;J)J

    move-result-wide v7

    iput-wide v7, p0, Lcom/motorola/ccc/ota/ui/NotificationService;->mNextPrompt:J

    iget-boolean v0, p0, Lcom/motorola/ccc/ota/ui/NotificationService;->mNotificationInStatusBar:Z

    const-string v4, "OtaApp"

    if-eqz v0, :cond_0

    cmp-long v0, v7, v5

    if-lez v0, :cond_0

    cmp-long v0, v2, v7

    if-gez v0, :cond_0

    new-instance p1, Ljava/lang/StringBuilder;

    const-string v0, "supress duplicated intent, nextPompt: "

    invoke-direct {p1, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    sget-object v0, Ljava/util/concurrent/TimeUnit;->MILLISECONDS:Ljava/util/concurrent/TimeUnit;

    iget-wide v5, p0, Lcom/motorola/ccc/ota/ui/NotificationService;->mNextPrompt:J

    sub-long/2addr v5, v2

    invoke-virtual {v0, v5, v6}, Ljava/util/concurrent/TimeUnit;->toMinutes(J)J

    move-result-wide v2

    invoke-virtual {p1, v2, v3}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object p1

    const-string v0, " in mins and mNotificationInStatusBar: "

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    iget-boolean v0, p0, Lcom/motorola/ccc/ota/ui/NotificationService;->mNotificationInStatusBar:Z

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {v4, p1}, Lcom/motorola/ccc/ota/utils/Logger;->debug(Ljava/lang/String;Ljava/lang/String;)V

    iget-object p1, p0, Lcom/motorola/ccc/ota/ui/NotificationService;->mAlarmManager:Landroid/app/AlarmManager;

    iget-wide v2, p0, Lcom/motorola/ccc/ota/ui/NotificationService;->mNextPrompt:J

    iget-object p0, p0, Lcom/motorola/ccc/ota/ui/NotificationService;->mAlarmPendingIntent:Landroid/app/PendingIntent;

    invoke-virtual {p1, v1, v2, v3, p0}, Landroid/app/AlarmManager;->setExactAndAllowWhileIdle(IJLandroid/app/PendingIntent;)V

    return-void

    :cond_0
    iget-object v0, p0, Lcom/motorola/ccc/ota/ui/NotificationService;->settings:Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    sget-object v7, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->SHOULD_BLOCK_FULL_SCREEN_DISPLAY:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    invoke-virtual {v0, v7}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->getBoolean(Lcom/motorola/otalib/common/settings/ISetting;)Z

    move-result v0

    if-eqz v0, :cond_1

    iget-boolean v0, p0, Lcom/motorola/ccc/ota/ui/NotificationService;->mNotificationInStatusBar:Z

    if-eqz v0, :cond_1

    const-string p0, "NotificationService, waiting for device unlock"

    invoke-static {v4, p0}, Lcom/motorola/ccc/ota/utils/Logger;->debug(Ljava/lang/String;Ljava/lang/String;)V

    return-void

    :cond_1
    iget-wide v7, p0, Lcom/motorola/ccc/ota/ui/NotificationService;->mNextPrompt:J

    cmp-long v0, v7, v5

    if-lez v0, :cond_4

    cmp-long v0, v2, v7

    if-lez v0, :cond_4

    const-string p1, "Device powered back after timer expiry, reposnd back appropriately"

    invoke-static {v4, p1}, Lcom/motorola/ccc/ota/utils/Logger;->debug(Ljava/lang/String;Ljava/lang/String;)V

    iget-object p1, p0, Lcom/motorola/ccc/ota/ui/NotificationService;->mResponseIntent:Landroid/content/Intent;

    const-string v0, "com.motorola.blur.service.blur.upgrade.KEY_FULL_SCREEN_REMINDER"

    const-string v1, "afterAlarmExpiry"

    invoke-virtual {p1, v0, v1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    const-string p1, "com.motorola.ccc.ota.ACTION_PAUSE_DOWNLOAD_FOR_CELLULAR"

    iget-object v0, p0, Lcom/motorola/ccc/ota/ui/NotificationService;->mAction:Ljava/lang/String;

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_2

    iget-object p1, p0, Lcom/motorola/ccc/ota/ui/NotificationService;->settings:Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    invoke-static {p1}, Lcom/motorola/ccc/ota/ui/UpdaterUtils;->setProgressScreenDisplayNextPrompt(Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;)V

    :cond_2
    iget-boolean p1, p0, Lcom/motorola/ccc/ota/ui/NotificationService;->mResponseAsBroadcast:Z

    if-eqz p1, :cond_3

    iget-object p1, p0, Lcom/motorola/ccc/ota/ui/NotificationService;->mResponseIntent:Landroid/content/Intent;

    const-string v0, "com.motorola.ccc.ota.Permissions.INTERACT_OTA_SERVICE"

    invoke-virtual {p0, p1, v0}, Lcom/motorola/ccc/ota/ui/NotificationService;->sendBroadcast(Landroid/content/Intent;Ljava/lang/String;)V

    goto :goto_0

    :cond_3
    iget-object p1, p0, Lcom/motorola/ccc/ota/ui/NotificationService;->mResponseIntent:Landroid/content/Intent;

    const/high16 v0, 0x10000000

    invoke-virtual {p1, v0}, Landroid/content/Intent;->setFlags(I)Landroid/content/Intent;

    invoke-virtual {p0}, Lcom/motorola/ccc/ota/ui/NotificationService;->getApplicationContext()Landroid/content/Context;

    move-result-object p1

    iget-object v0, p0, Lcom/motorola/ccc/ota/ui/NotificationService;->mResponseIntent:Landroid/content/Intent;

    invoke-virtual {p1, v0}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    :goto_0
    invoke-virtual {p0}, Lcom/motorola/ccc/ota/ui/NotificationService;->stopSelf()V

    return-void

    :cond_4
    iget-object v0, p0, Lcom/motorola/ccc/ota/ui/NotificationService;->mTitle:Ljava/lang/String;

    iget-object v2, p0, Lcom/motorola/ccc/ota/ui/NotificationService;->mMessage:Ljava/lang/String;

    invoke-direct {p0, v0, v2, p1}, Lcom/motorola/ccc/ota/ui/NotificationService;->displayNotification(Ljava/lang/String;Ljava/lang/String;Landroid/content/Intent;)V

    iget p1, p0, Lcom/motorola/ccc/ota/ui/NotificationService;->mNotificationExpiryMins:I

    const/4 v0, -0x1

    if-eq p1, v0, :cond_5

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v2

    iget p1, p0, Lcom/motorola/ccc/ota/ui/NotificationService;->mNotificationExpiryMins:I

    int-to-long v5, p1

    const-wide/32 v7, 0xea60

    mul-long/2addr v5, v7

    add-long/2addr v2, v5

    iput-wide v2, p0, Lcom/motorola/ccc/ota/ui/NotificationService;->mNextPrompt:J

    new-instance p1, Ljava/lang/StringBuilder;

    const-string v0, "NotificationService, Notification will expire after "

    invoke-direct {p1, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget v0, p0, Lcom/motorola/ccc/ota/ui/NotificationService;->mNotificationExpiryMins:I

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object p1

    const-string v0, " mins"

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {v4, p1}, Lcom/motorola/ccc/ota/utils/Logger;->debug(Ljava/lang/String;Ljava/lang/String;)V

    iget-object p1, p0, Lcom/motorola/ccc/ota/ui/NotificationService;->mAlarmManager:Landroid/app/AlarmManager;

    iget-wide v2, p0, Lcom/motorola/ccc/ota/ui/NotificationService;->mNextPrompt:J

    iget-object v0, p0, Lcom/motorola/ccc/ota/ui/NotificationService;->mAlarmPendingIntent:Landroid/app/PendingIntent;

    invoke-virtual {p1, v1, v2, v3, v0}, Landroid/app/AlarmManager;->setExactAndAllowWhileIdle(IJLandroid/app/PendingIntent;)V

    goto :goto_1

    :cond_5
    const-wide/16 v0, -0x1

    iput-wide v0, p0, Lcom/motorola/ccc/ota/ui/NotificationService;->mNextPrompt:J

    :goto_1
    invoke-direct {p0}, Lcom/motorola/ccc/ota/ui/NotificationService;->saveState()V

    return-void
.end method

.method private saveState()V
    .locals 4

    iget-object v0, p0, Lcom/motorola/ccc/ota/ui/NotificationService;->settings:Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    sget-object v1, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->NOTIFICATION_NEXT_PROMPT:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    iget-wide v2, p0, Lcom/motorola/ccc/ota/ui/NotificationService;->mNextPrompt:J

    invoke-virtual {v0, v1, v2, v3}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->setLong(Lcom/motorola/otalib/common/settings/ISetting;J)V

    return-void
.end method


# virtual methods
.method public onBind(Landroid/content/Intent;)Landroid/os/IBinder;
    .locals 0

    const/4 p0, 0x0

    return-object p0
.end method

.method public onCreate()V
    .locals 11

    invoke-super {p0}, Landroid/app/Service;->onCreate()V

    const-string v0, "alarm"

    invoke-virtual {p0, v0}, Lcom/motorola/ccc/ota/ui/NotificationService;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/app/AlarmManager;

    iput-object v0, p0, Lcom/motorola/ccc/ota/ui/NotificationService;->mAlarmManager:Landroid/app/AlarmManager;

    new-instance v0, Landroid/content/Intent;

    const-string v1, "com.motorola.ccc.ota.ns.alarmintent"

    invoke-direct {v0, v1}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    const/4 v2, 0x0

    const/high16 v3, 0x14000000

    invoke-static {p0, v2, v0, v3}, Landroid/app/PendingIntent;->getBroadcast(Landroid/content/Context;ILandroid/content/Intent;I)Landroid/app/PendingIntent;

    move-result-object v0

    iput-object v0, p0, Lcom/motorola/ccc/ota/ui/NotificationService;->mPendingIntent:Landroid/app/PendingIntent;

    new-instance v0, Landroid/content/Intent;

    const-string v4, "com.motorola.ccc.ota.ns.alarmtriggerintent"

    invoke-direct {v0, v4}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    invoke-static {p0, v2, v0, v3}, Landroid/app/PendingIntent;->getBroadcast(Landroid/content/Context;ILandroid/content/Intent;I)Landroid/app/PendingIntent;

    move-result-object v0

    iput-object v0, p0, Lcom/motorola/ccc/ota/ui/NotificationService;->mAlarmPendingIntent:Landroid/app/PendingIntent;

    const-string v0, "notification"

    invoke-virtual {p0, v0}, Lcom/motorola/ccc/ota/ui/NotificationService;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/app/NotificationManager;

    iput-object v0, p0, Lcom/motorola/ccc/ota/ui/NotificationService;->mNotificationManager:Landroid/app/NotificationManager;

    invoke-static {}, Lcom/motorola/ccc/ota/ui/NotificationChannelCreator;->getUrgentNotificationChannelId()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/motorola/ccc/ota/ui/NotificationService;->channelId:Ljava/lang/String;

    new-instance v0, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    invoke-direct {v0}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;-><init>()V

    iput-object v0, p0, Lcom/motorola/ccc/ota/ui/NotificationService;->settings:Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    new-instance v7, Landroid/content/IntentFilter;

    invoke-direct {v7}, Landroid/content/IntentFilter;-><init>()V

    const-string v0, "com.motorola.blur.service.blur.Actions.MANUAL_CHECK_UPDATE"

    invoke-virtual {v7, v0}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    invoke-virtual {v7, v1}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    invoke-virtual {v7, v4}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    iget-object v6, p0, Lcom/motorola/ccc/ota/ui/NotificationService;->mRecv:Lcom/motorola/ccc/ota/ui/NotificationService$MyIntentReceiver;

    const/4 v9, 0x0

    const/4 v10, 0x2

    const-string v8, "com.motorola.ccc.ota.Permissions.INTERACT_OTA_SERVICE"

    move-object v5, p0

    invoke-virtual/range {v5 .. v10}, Lcom/motorola/ccc/ota/ui/NotificationService;->registerReceiver(Landroid/content/BroadcastReceiver;Landroid/content/IntentFilter;Ljava/lang/String;Landroid/os/Handler;I)Landroid/content/Intent;

    return-void
.end method

.method public onDestroy()V
    .locals 2

    invoke-super {p0}, Landroid/app/Service;->onDestroy()V

    const-string v0, "OtaApp"

    const-string v1, "NotificationService, onDestroy"

    invoke-static {v0, v1}, Lcom/motorola/ccc/ota/utils/Logger;->debug(Ljava/lang/String;Ljava/lang/String;)V

    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/motorola/ccc/ota/ui/NotificationService;->mNotificationInStatusBar:Z

    iget-object v0, p0, Lcom/motorola/ccc/ota/ui/NotificationService;->mRecv:Lcom/motorola/ccc/ota/ui/NotificationService$MyIntentReceiver;

    invoke-virtual {p0, v0}, Lcom/motorola/ccc/ota/ui/NotificationService;->unregisterReceiver(Landroid/content/BroadcastReceiver;)V

    iget-object v0, p0, Lcom/motorola/ccc/ota/ui/NotificationService;->settings:Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    sget-object v1, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->SHOULD_BLOCK_FULL_SCREEN_DISPLAY:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    invoke-virtual {v0, v1}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->removeConfig(Lcom/motorola/otalib/common/settings/ISetting;)V

    iget-object v0, p0, Lcom/motorola/ccc/ota/ui/NotificationService;->mNotificationManager:Landroid/app/NotificationManager;

    const/16 v1, 0x6c1

    invoke-virtual {v0, v1}, Landroid/app/NotificationManager;->cancel(I)V

    iget-object v0, p0, Lcom/motorola/ccc/ota/ui/NotificationService;->mAlarmManager:Landroid/app/AlarmManager;

    iget-object v1, p0, Lcom/motorola/ccc/ota/ui/NotificationService;->mPendingIntent:Landroid/app/PendingIntent;

    invoke-virtual {v0, v1}, Landroid/app/AlarmManager;->cancel(Landroid/app/PendingIntent;)V

    iget-object v0, p0, Lcom/motorola/ccc/ota/ui/NotificationService;->mAlarmManager:Landroid/app/AlarmManager;

    iget-object v1, p0, Lcom/motorola/ccc/ota/ui/NotificationService;->mAlarmPendingIntent:Landroid/app/PendingIntent;

    invoke-virtual {v0, v1}, Landroid/app/AlarmManager;->cancel(Landroid/app/PendingIntent;)V

    invoke-direct {p0}, Lcom/motorola/ccc/ota/ui/NotificationService;->clearState()V

    return-void
.end method

.method public onStartCommand(Landroid/content/Intent;II)I
    .locals 3

    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "Received start id "

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, p3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ": "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    const-string v1, "OtaApp"

    invoke-static {v1, v0}, Lcom/motorola/ccc/ota/utils/Logger;->debug(Ljava/lang/String;Ljava/lang/String;)V

    iget-object v0, p0, Lcom/motorola/ccc/ota/ui/NotificationService;->settings:Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    sget-object v2, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->FORCE_UPGRADE_TIME_COMPLETED:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    invoke-virtual {v0, v2}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->getBoolean(Lcom/motorola/otalib/common/settings/ISetting;)Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/motorola/ccc/ota/ui/NotificationService;->settings:Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    sget-object v2, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->METADATA:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    invoke-virtual {v0, v2}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->getString(Lcom/motorola/otalib/common/settings/ISetting;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/motorola/otalib/common/metaData/builder/MetaDataBuilder;->from(Ljava/lang/String;)Lcom/motorola/otalib/common/metaData/MetaData;

    move-result-object v0

    if-eqz v0, :cond_0

    invoke-virtual {v0}, Lcom/motorola/otalib/common/metaData/MetaData;->showPreInstallScreen()Z

    move-result v0

    if-nez v0, :cond_0

    const-string v0, "NotificationService.onStartCommand,  finish service as forceUpgradeTimer expired"

    invoke-static {v1, v0}, Lcom/motorola/ccc/ota/utils/Logger;->info(Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {p0}, Lcom/motorola/ccc/ota/ui/NotificationService;->stopSelf()V

    :cond_0
    if-eqz p1, :cond_1

    invoke-virtual {p1}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/motorola/ccc/ota/ui/NotificationService;->mAction:Ljava/lang/String;

    const-string v2, "com.motorola.ccc.ota.ns.alarmintent"

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_1

    const-string v0, "com.motorola.ccc.ota.ns.alarmtriggerintent"

    iget-object v2, p0, Lcom/motorola/ccc/ota/ui/NotificationService;->mAction:Ljava/lang/String;

    invoke-virtual {v0, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_1

    new-instance v0, Ljava/lang/StringBuilder;

    const-string v2, "handle intent : "

    invoke-direct {v0, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v2, p0, Lcom/motorola/ccc/ota/ui/NotificationService;->mAction:Ljava/lang/String;

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v1, v0}, Lcom/motorola/ccc/ota/utils/Logger;->debug(Ljava/lang/String;Ljava/lang/String;)V

    const-string v0, "com.motorola.blur.service.blur.upgrade.version"

    invoke-virtual {p1, v0}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/motorola/ccc/ota/ui/NotificationService;->mVersion:Ljava/lang/String;

    invoke-direct {p0, p1}, Lcom/motorola/ccc/ota/ui/NotificationService;->handleIntent(Landroid/content/Intent;)V

    :cond_1
    invoke-super {p0, p1, p2, p3}, Landroid/app/Service;->onStartCommand(Landroid/content/Intent;II)I

    move-result p0

    return p0
.end method
