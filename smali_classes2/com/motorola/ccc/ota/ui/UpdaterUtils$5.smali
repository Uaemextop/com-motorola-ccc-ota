.class Lcom/motorola/ccc/ota/ui/UpdaterUtils$5;
.super Ljava/lang/Object;
.source "UpdaterUtils.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/motorola/ccc/ota/ui/UpdaterUtils;->priorityAppRunningPostponeActivity(Landroid/content/Context;Ljava/lang/String;Landroid/content/Intent;Z)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic val$context:Landroid/content/Context;

.field final synthetic val$intent:Landroid/content/Intent;

.field final synthetic val$isProceedingReboot:Z

.field final synthetic val$key:Ljava/lang/String;


# direct methods
.method constructor <init>(Landroid/content/Context;Landroid/content/Intent;Ljava/lang/String;Z)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    iput-object p1, p0, Lcom/motorola/ccc/ota/ui/UpdaterUtils$5;->val$context:Landroid/content/Context;

    iput-object p2, p0, Lcom/motorola/ccc/ota/ui/UpdaterUtils$5;->val$intent:Landroid/content/Intent;

    iput-object p3, p0, Lcom/motorola/ccc/ota/ui/UpdaterUtils$5;->val$key:Ljava/lang/String;

    iput-boolean p4, p0, Lcom/motorola/ccc/ota/ui/UpdaterUtils$5;->val$isProceedingReboot:Z

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 8

    invoke-static {}, Lcom/motorola/ccc/ota/ui/UpdaterUtils;->-$$Nest$sfgetsettings()Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    move-result-object v0

    sget-object v1, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->NOTIFICATION_TAPPED:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    invoke-virtual {v0, v1}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->removeConfig(Lcom/motorola/otalib/common/settings/ISetting;)V

    iget-object v0, p0, Lcom/motorola/ccc/ota/ui/UpdaterUtils$5;->val$context:Landroid/content/Context;

    const-string v1, "alarm"

    invoke-virtual {v0, v1}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/app/AlarmManager;

    iget-object v1, p0, Lcom/motorola/ccc/ota/ui/UpdaterUtils$5;->val$intent:Landroid/content/Intent;

    invoke-static {}, Lcom/motorola/ccc/ota/ui/UpdaterUtils;->-$$Nest$sfgetsettings()Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    move-result-object v2

    sget-object v3, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->METADATA:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    invoke-virtual {v2, v3}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->getString(Lcom/motorola/otalib/common/settings/ISetting;)Ljava/lang/String;

    move-result-object v2

    const-string v3, "com.motorola.blur.service.blur.upgrade.metadata"

    invoke-virtual {v1, v3, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    iget-object v1, p0, Lcom/motorola/ccc/ota/ui/UpdaterUtils$5;->val$intent:Landroid/content/Intent;

    invoke-static {v1}, Lcom/motorola/ccc/ota/ui/UpdaterUtils;->getUpgradeInfoDuringOTAUpdate(Landroid/content/Intent;)Lcom/motorola/ccc/ota/ui/UpdaterUtils$UpgradeInfo;

    move-result-object v7

    iget-object v1, p0, Lcom/motorola/ccc/ota/ui/UpdaterUtils$5;->val$intent:Landroid/content/Intent;

    const-string v2, "com.motorola.blur.service.blur.upgrade.location_type"

    invoke-virtual {v7}, Lcom/motorola/ccc/ota/ui/UpdaterUtils$UpgradeInfo;->getLocationType()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v1, v2, v3}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    iget-object v1, p0, Lcom/motorola/ccc/ota/ui/UpdaterUtils$5;->val$intent:Landroid/content/Intent;

    sget-object v2, Lcom/motorola/ccc/ota/sources/UpgradeSourceType;->upgrade:Lcom/motorola/ccc/ota/sources/UpgradeSourceType;

    invoke-virtual {v2}, Lcom/motorola/ccc/ota/sources/UpgradeSourceType;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Lcom/motorola/ccc/ota/utils/BuildPropReader;->getDeviceSha1(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    const-string v3, "com.motorola.blur.service.blur.upgrade.version"

    invoke-virtual {v1, v3, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    iget-object v1, p0, Lcom/motorola/ccc/ota/ui/UpdaterUtils$5;->val$key:Ljava/lang/String;

    iget-object v2, p0, Lcom/motorola/ccc/ota/ui/UpdaterUtils$5;->val$intent:Landroid/content/Intent;

    invoke-static {v1, v2}, Lcom/motorola/ccc/ota/ui/UpdaterUtils;->fillAnnoyValueExpiryDetails(Ljava/lang/String;Landroid/content/Intent;)Landroid/content/Intent;

    move-result-object v1

    iget-object v2, p0, Lcom/motorola/ccc/ota/ui/UpdaterUtils$5;->val$context:Landroid/content/Context;

    const/high16 v3, 0x14000000

    const/4 v4, 0x0

    invoke-static {v2, v4, v1, v3}, Landroid/app/PendingIntent;->getBroadcast(Landroid/content/Context;ILandroid/content/Intent;I)Landroid/app/PendingIntent;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/app/AlarmManager;->cancel(Landroid/app/PendingIntent;)V

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v2

    const-wide/32 v5, 0x927c0

    add-long/2addr v5, v2

    invoke-static {}, Lcom/motorola/ccc/ota/ui/UpdaterUtils;->-$$Nest$sfgetsettings()Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    move-result-object v2

    sget-object v3, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->ACTIVITY_NEXT_PROMPT:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    invoke-virtual {v2, v3, v5, v6}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->setLong(Lcom/motorola/otalib/common/settings/ISetting;J)V

    new-instance v2, Ljava/lang/StringBuilder;

    const-string v3, "Priority app(Maps/Camera) is running, showing full screen is postponed to next prompt : "

    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v2, v5, v6}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    const-string v3, "OtaApp"

    invoke-static {v3, v2}, Lcom/motorola/ccc/ota/utils/Logger;->debug(Ljava/lang/String;Ljava/lang/String;)V

    iget-object v2, p0, Lcom/motorola/ccc/ota/ui/UpdaterUtils$5;->val$intent:Landroid/content/Intent;

    invoke-virtual {v2}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object v2

    const-string v3, "com.motorola.ccc.ota.Actions.ACTIVITY_ANNOY_VALUE_EXPIRY"

    invoke-virtual {v3, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_2

    iget-boolean v2, p0, Lcom/motorola/ccc/ota/ui/UpdaterUtils$5;->val$isProceedingReboot:Z

    if-nez v2, :cond_2

    invoke-static {}, Lcom/motorola/ccc/ota/ui/UpdaterUtils;->-$$Nest$sfgetsettings()Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    move-result-object v2

    invoke-virtual {v7}, Lcom/motorola/ccc/ota/ui/UpdaterUtils$UpgradeInfo;->getUpdateTypeData()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Lcom/motorola/ccc/ota/utils/SmartUpdateUtils;->isSmartUpdateNearestToInstall(Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;Ljava/lang/String;)Z

    move-result v2

    if-nez v2, :cond_2

    const-string v2, "MergeRestart"

    iget-object v3, p0, Lcom/motorola/ccc/ota/ui/UpdaterUtils$5;->val$key:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_0

    const-string v2, "Download"

    iget-object v3, p0, Lcom/motorola/ccc/ota/ui/UpdaterUtils$5;->val$key:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_0

    goto :goto_0

    :cond_0
    iget-object v0, p0, Lcom/motorola/ccc/ota/ui/UpdaterUtils$5;->val$context:Landroid/content/Context;

    invoke-static {v0}, Lcom/motorola/ccc/ota/utils/NotificationUtils;->isNotificationServiceRunning(Landroid/content/Context;)Z

    move-result v0

    if-nez v0, :cond_1

    iget-object v2, p0, Lcom/motorola/ccc/ota/ui/UpdaterUtils$5;->val$context:Landroid/content/Context;

    iget-object v3, p0, Lcom/motorola/ccc/ota/ui/UpdaterUtils$5;->val$key:Ljava/lang/String;

    iget-object p0, p0, Lcom/motorola/ccc/ota/ui/UpdaterUtils$5;->val$intent:Landroid/content/Intent;

    move-wide v4, v5

    move-object v6, p0

    invoke-static/range {v2 .. v7}, Lcom/motorola/ccc/ota/utils/NotificationUtils;->displayNotification(Landroid/content/Context;Ljava/lang/String;JLandroid/content/Intent;Lcom/motorola/ccc/ota/ui/UpdaterUtils$UpgradeInfo;)V

    :cond_1
    return-void

    :cond_2
    :goto_0
    invoke-virtual {v0, v4, v5, v6, v1}, Landroid/app/AlarmManager;->setExactAndAllowWhileIdle(IJLandroid/app/PendingIntent;)V

    return-void
.end method
