.class Lcom/motorola/ccc/ota/ui/UpdateReceiver$2;
.super Ljava/lang/Object;
.source "UpdateReceiver.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/motorola/ccc/ota/ui/UpdateReceiver;->doSanityCheckForFullScreen(Landroid/content/Context;Ljava/lang/String;Landroid/content/Intent;)Z
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/motorola/ccc/ota/ui/UpdateReceiver;

.field final synthetic val$context:Landroid/content/Context;

.field final synthetic val$info:Lcom/motorola/ccc/ota/ui/UpdaterUtils$UpgradeInfo;

.field final synthetic val$intent:Landroid/content/Intent;

.field final synthetic val$key:Ljava/lang/String;

.field final synthetic val$nextPrompt:J

.field final synthetic val$now:J

.field final synthetic val$version:Ljava/lang/String;


# direct methods
.method constructor <init>(Lcom/motorola/ccc/ota/ui/UpdateReceiver;Landroid/content/Context;Lcom/motorola/ccc/ota/ui/UpdaterUtils$UpgradeInfo;Ljava/lang/String;Landroid/content/Intent;JJLjava/lang/String;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    iput-object p1, p0, Lcom/motorola/ccc/ota/ui/UpdateReceiver$2;->this$0:Lcom/motorola/ccc/ota/ui/UpdateReceiver;

    iput-object p2, p0, Lcom/motorola/ccc/ota/ui/UpdateReceiver$2;->val$context:Landroid/content/Context;

    iput-object p3, p0, Lcom/motorola/ccc/ota/ui/UpdateReceiver$2;->val$info:Lcom/motorola/ccc/ota/ui/UpdaterUtils$UpgradeInfo;

    iput-object p4, p0, Lcom/motorola/ccc/ota/ui/UpdateReceiver$2;->val$key:Ljava/lang/String;

    iput-object p5, p0, Lcom/motorola/ccc/ota/ui/UpdateReceiver$2;->val$intent:Landroid/content/Intent;

    iput-wide p6, p0, Lcom/motorola/ccc/ota/ui/UpdateReceiver$2;->val$nextPrompt:J

    iput-wide p8, p0, Lcom/motorola/ccc/ota/ui/UpdateReceiver$2;->val$now:J

    iput-object p10, p0, Lcom/motorola/ccc/ota/ui/UpdateReceiver$2;->val$version:Ljava/lang/String;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 13

    iget-object v0, p0, Lcom/motorola/ccc/ota/ui/UpdateReceiver$2;->this$0:Lcom/motorola/ccc/ota/ui/UpdateReceiver;

    iget-object v1, p0, Lcom/motorola/ccc/ota/ui/UpdateReceiver$2;->val$context:Landroid/content/Context;

    const-string v2, "alarm"

    invoke-virtual {v1, v2}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/app/AlarmManager;

    invoke-static {v0, v1}, Lcom/motorola/ccc/ota/ui/UpdateReceiver;->-$$Nest$fputmAlarmManager(Lcom/motorola/ccc/ota/ui/UpdateReceiver;Landroid/app/AlarmManager;)V

    iget-object v0, p0, Lcom/motorola/ccc/ota/ui/UpdateReceiver$2;->this$0:Lcom/motorola/ccc/ota/ui/UpdateReceiver;

    invoke-static {v0}, Lcom/motorola/ccc/ota/ui/UpdateReceiver;->-$$Nest$fgetbotaSettings(Lcom/motorola/ccc/ota/ui/UpdateReceiver;)Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    move-result-object v0

    iget-object v1, p0, Lcom/motorola/ccc/ota/ui/UpdateReceiver$2;->val$info:Lcom/motorola/ccc/ota/ui/UpdaterUtils$UpgradeInfo;

    invoke-virtual {v1}, Lcom/motorola/ccc/ota/ui/UpdaterUtils$UpgradeInfo;->getUpdateTypeData()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/motorola/ccc/ota/utils/SmartUpdateUtils;->isSmartUpdateNearestToInstall(Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;Ljava/lang/String;)Z

    move-result v0

    const-string v1, "com.motorola.blur.service.blur.upgrade.metadata"

    const-string v2, "Install"

    const-string v3, "Restart"

    const-string v4, "OtaApp"

    const/high16 v5, 0x14000000

    const/4 v6, 0x0

    if-eqz v0, :cond_3

    iget-object v0, p0, Lcom/motorola/ccc/ota/ui/UpdateReceiver$2;->val$key:Ljava/lang/String;

    invoke-virtual {v0, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_0

    iget-object v0, p0, Lcom/motorola/ccc/ota/ui/UpdateReceiver$2;->val$key:Ljava/lang/String;

    invoke-virtual {v0, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_3

    :cond_0
    iget-object v0, p0, Lcom/motorola/ccc/ota/ui/UpdateReceiver$2;->this$0:Lcom/motorola/ccc/ota/ui/UpdateReceiver;

    iget-object v7, p0, Lcom/motorola/ccc/ota/ui/UpdateReceiver$2;->val$context:Landroid/content/Context;

    new-instance v8, Landroid/content/Intent;

    const-string v9, "com.motorola.ccc.ota.Actions.ACTIVITY_ANNOY_VALUE_EXPIRY"

    invoke-direct {v8, v9}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    sget-object v9, Lcom/motorola/ccc/ota/ui/UpdateReceiver$PendingIntentType;->BROADCAST:Lcom/motorola/ccc/ota/ui/UpdateReceiver$PendingIntentType;

    invoke-static {v0, v7, v8, v9}, Lcom/motorola/ccc/ota/ui/UpdateReceiver;->-$$Nest$mcancelAnyPendingIntentSetPreviously(Lcom/motorola/ccc/ota/ui/UpdateReceiver;Landroid/content/Context;Landroid/content/Intent;Lcom/motorola/ccc/ota/ui/UpdateReceiver$PendingIntentType;)V

    iget-object v0, p0, Lcom/motorola/ccc/ota/ui/UpdateReceiver$2;->val$intent:Landroid/content/Intent;

    iget-object v7, p0, Lcom/motorola/ccc/ota/ui/UpdateReceiver$2;->val$context:Landroid/content/Context;

    const-class v8, Lcom/motorola/ccc/ota/ui/BaseActivity;

    invoke-virtual {v0, v7, v8}, Landroid/content/Intent;->setClass(Landroid/content/Context;Ljava/lang/Class;)Landroid/content/Intent;

    iget-object v0, p0, Lcom/motorola/ccc/ota/ui/UpdateReceiver$2;->val$key:Ljava/lang/String;

    invoke-virtual {v0, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    const-string v3, "fragment_type"

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/motorola/ccc/ota/ui/UpdateReceiver$2;->val$intent:Landroid/content/Intent;

    sget-object v7, Lcom/motorola/ccc/ota/utils/UpgradeUtilConstants$FragmentTypeEnum;->RESTART_FRAGMENT:Lcom/motorola/ccc/ota/utils/UpgradeUtilConstants$FragmentTypeEnum;

    invoke-virtual {v7}, Lcom/motorola/ccc/ota/utils/UpgradeUtilConstants$FragmentTypeEnum;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v0, v3, v7}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    :cond_1
    iget-object v0, p0, Lcom/motorola/ccc/ota/ui/UpdateReceiver$2;->val$key:Ljava/lang/String;

    invoke-virtual {v0, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_2

    iget-object v0, p0, Lcom/motorola/ccc/ota/ui/UpdateReceiver$2;->val$intent:Landroid/content/Intent;

    sget-object v2, Lcom/motorola/ccc/ota/utils/UpgradeUtilConstants$FragmentTypeEnum;->INSTALL_FRAGMENT:Lcom/motorola/ccc/ota/utils/UpgradeUtilConstants$FragmentTypeEnum;

    invoke-virtual {v2}, Lcom/motorola/ccc/ota/utils/UpgradeUtilConstants$FragmentTypeEnum;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v3, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    :cond_2
    iget-object v0, p0, Lcom/motorola/ccc/ota/ui/UpdateReceiver$2;->val$intent:Landroid/content/Intent;

    iget-object v2, p0, Lcom/motorola/ccc/ota/ui/UpdateReceiver$2;->this$0:Lcom/motorola/ccc/ota/ui/UpdateReceiver;

    invoke-static {v2}, Lcom/motorola/ccc/ota/ui/UpdateReceiver;->-$$Nest$fgetbotaSettings(Lcom/motorola/ccc/ota/ui/UpdateReceiver;)Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    move-result-object v2

    sget-object v3, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->METADATA:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    invoke-virtual {v2, v3}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->getString(Lcom/motorola/otalib/common/settings/ISetting;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    iget-object v0, p0, Lcom/motorola/ccc/ota/ui/UpdateReceiver$2;->val$intent:Landroid/content/Intent;

    iget-object v1, p0, Lcom/motorola/ccc/ota/ui/UpdateReceiver$2;->val$info:Lcom/motorola/ccc/ota/ui/UpdaterUtils$UpgradeInfo;

    invoke-virtual {v1}, Lcom/motorola/ccc/ota/ui/UpdaterUtils$UpgradeInfo;->getLocationType()Ljava/lang/String;

    move-result-object v1

    const-string v2, "com.motorola.blur.service.blur.upgrade.location_type"

    invoke-virtual {v0, v2, v1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    iget-object v0, p0, Lcom/motorola/ccc/ota/ui/UpdateReceiver$2;->val$key:Ljava/lang/String;

    iget-object v1, p0, Lcom/motorola/ccc/ota/ui/UpdateReceiver$2;->val$intent:Landroid/content/Intent;

    invoke-static {v0, v1}, Lcom/motorola/ccc/ota/ui/UpdaterUtils;->fillAnnoyValueExpiryDetails(Ljava/lang/String;Landroid/content/Intent;)Landroid/content/Intent;

    move-result-object v0

    iget-object v1, p0, Lcom/motorola/ccc/ota/ui/UpdateReceiver$2;->this$0:Lcom/motorola/ccc/ota/ui/UpdateReceiver;

    iget-object v2, p0, Lcom/motorola/ccc/ota/ui/UpdateReceiver$2;->val$context:Landroid/content/Context;

    invoke-static {v2, v6, v0, v5}, Landroid/app/PendingIntent;->getBroadcast(Landroid/content/Context;ILandroid/content/Intent;I)Landroid/app/PendingIntent;

    move-result-object v0

    invoke-static {v1, v0}, Lcom/motorola/ccc/ota/ui/UpdateReceiver;->-$$Nest$fputmPendingIntent(Lcom/motorola/ccc/ota/ui/UpdateReceiver;Landroid/app/PendingIntent;)V

    iget-object v0, p0, Lcom/motorola/ccc/ota/ui/UpdateReceiver$2;->this$0:Lcom/motorola/ccc/ota/ui/UpdateReceiver;

    invoke-static {v0}, Lcom/motorola/ccc/ota/ui/UpdateReceiver;->-$$Nest$fgetmAlarmManager(Lcom/motorola/ccc/ota/ui/UpdateReceiver;)Landroid/app/AlarmManager;

    move-result-object v0

    iget-object v1, p0, Lcom/motorola/ccc/ota/ui/UpdateReceiver$2;->this$0:Lcom/motorola/ccc/ota/ui/UpdateReceiver;

    invoke-static {v1}, Lcom/motorola/ccc/ota/ui/UpdateReceiver;->-$$Nest$fgetmPendingIntent(Lcom/motorola/ccc/ota/ui/UpdateReceiver;)Landroid/app/PendingIntent;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/app/AlarmManager;->cancel(Landroid/app/PendingIntent;)V

    const-string v0, "UpdateReceiver:smart update:reset alarm"

    invoke-static {v4, v0}, Lcom/motorola/ccc/ota/utils/Logger;->debug(Ljava/lang/String;Ljava/lang/String;)V

    iget-object v0, p0, Lcom/motorola/ccc/ota/ui/UpdateReceiver$2;->this$0:Lcom/motorola/ccc/ota/ui/UpdateReceiver;

    invoke-static {v0}, Lcom/motorola/ccc/ota/ui/UpdateReceiver;->-$$Nest$fgetmAlarmManager(Lcom/motorola/ccc/ota/ui/UpdateReceiver;)Landroid/app/AlarmManager;

    move-result-object v0

    iget-wide v1, p0, Lcom/motorola/ccc/ota/ui/UpdateReceiver$2;->val$nextPrompt:J

    iget-object p0, p0, Lcom/motorola/ccc/ota/ui/UpdateReceiver$2;->this$0:Lcom/motorola/ccc/ota/ui/UpdateReceiver;

    invoke-static {p0}, Lcom/motorola/ccc/ota/ui/UpdateReceiver;->-$$Nest$fgetmPendingIntent(Lcom/motorola/ccc/ota/ui/UpdateReceiver;)Landroid/app/PendingIntent;

    move-result-object p0

    invoke-virtual {v0, v6, v1, v2, p0}, Landroid/app/AlarmManager;->setExactAndAllowWhileIdle(IJLandroid/app/PendingIntent;)V

    goto/16 :goto_0

    :cond_3
    iget-object v0, p0, Lcom/motorola/ccc/ota/ui/UpdateReceiver$2;->this$0:Lcom/motorola/ccc/ota/ui/UpdateReceiver;

    invoke-static {v0}, Lcom/motorola/ccc/ota/ui/UpdateReceiver;->-$$Nest$fgetbotaSettings(Lcom/motorola/ccc/ota/ui/UpdateReceiver;)Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    move-result-object v0

    sget-object v7, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->CHECKBOX_SELECTED:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    invoke-virtual {v0, v7}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->getBoolean(Lcom/motorola/otalib/common/settings/ISetting;)Z

    move-result v0

    if-eqz v0, :cond_4

    const-string v0, "UpdateReceiver.doSanityCheckForFullScreen: Put notification + alarm"

    invoke-static {v4, v0}, Lcom/motorola/ccc/ota/utils/Logger;->debug(Ljava/lang/String;Ljava/lang/String;)V

    iget-object v7, p0, Lcom/motorola/ccc/ota/ui/UpdateReceiver$2;->val$context:Landroid/content/Context;

    invoke-virtual {v7}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    iget-object v1, p0, Lcom/motorola/ccc/ota/ui/UpdateReceiver$2;->val$context:Landroid/content/Context;

    iget-object v2, p0, Lcom/motorola/ccc/ota/ui/UpdateReceiver$2;->this$0:Lcom/motorola/ccc/ota/ui/UpdateReceiver;

    invoke-static {v2}, Lcom/motorola/ccc/ota/ui/UpdateReceiver;->-$$Nest$fgetbotaSettings(Lcom/motorola/ccc/ota/ui/UpdateReceiver;)Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    move-result-object v2

    sget-object v3, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->AUTO_UPDATE_TIME_SELECTED:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    const-wide/16 v8, -0x1

    invoke-virtual {v2, v3, v8, v9}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->getLong(Lcom/motorola/otalib/common/settings/ISetting;J)J

    move-result-wide v2

    invoke-static {v1, v2, v3}, Lcom/motorola/ccc/ota/utils/DateFormatUtils;->getCalendarString(Landroid/content/Context;J)Ljava/lang/String;

    move-result-object v1

    filled-new-array {v1}, [Ljava/lang/Object;

    move-result-object v1

    const v2, 0x7f0e004c

    invoke-virtual {v0, v2, v1}, Landroid/content/res/Resources;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v8

    iget-object v0, p0, Lcom/motorola/ccc/ota/ui/UpdateReceiver$2;->val$context:Landroid/content/Context;

    invoke-virtual {v0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    iget-object v1, p0, Lcom/motorola/ccc/ota/ui/UpdateReceiver$2;->val$info:Lcom/motorola/ccc/ota/ui/UpdaterUtils$UpgradeInfo;

    invoke-virtual {v1}, Lcom/motorola/ccc/ota/ui/UpdaterUtils$UpgradeInfo;->getInstallTime()I

    move-result v1

    invoke-static {v1}, Lcom/motorola/ccc/ota/ui/UpdaterUtils;->getUpdateTime(I)I

    move-result v1

    invoke-static {v1}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    move-result-object v1

    filled-new-array {v1}, [Ljava/lang/Object;

    move-result-object v1

    const v2, 0x7f0e0117

    invoke-virtual {v0, v2, v1}, Landroid/content/res/Resources;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v9

    iget-object v10, p0, Lcom/motorola/ccc/ota/ui/UpdateReceiver$2;->val$intent:Landroid/content/Intent;

    sget-object v0, Ljava/util/concurrent/TimeUnit;->MILLISECONDS:Ljava/util/concurrent/TimeUnit;

    iget-wide v1, p0, Lcom/motorola/ccc/ota/ui/UpdateReceiver$2;->val$nextPrompt:J

    iget-wide v3, p0, Lcom/motorola/ccc/ota/ui/UpdateReceiver$2;->val$now:J

    sub-long/2addr v1, v3

    invoke-virtual {v0, v1, v2}, Ljava/util/concurrent/TimeUnit;->toMinutes(J)J

    move-result-wide v0

    long-to-int v0, v0

    const/16 v1, 0x3c

    invoke-static {v1, v0}, Ljava/lang/Math;->min(II)I

    move-result v11

    iget-object v12, p0, Lcom/motorola/ccc/ota/ui/UpdateReceiver$2;->val$version:Ljava/lang/String;

    invoke-static/range {v7 .. v12}, Lcom/motorola/ccc/ota/utils/NotificationUtils;->fillInstallLaterNotificationDetails(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Landroid/content/Intent;ILjava/lang/String;)Landroid/content/Intent;

    move-result-object v0

    iget-object v1, p0, Lcom/motorola/ccc/ota/ui/UpdateReceiver$2;->val$context:Landroid/content/Context;

    invoke-static {v1, v6, v0, v5}, Landroid/app/PendingIntent;->getService(Landroid/content/Context;ILandroid/content/Intent;I)Landroid/app/PendingIntent;

    move-result-object v0

    iget-object v1, p0, Lcom/motorola/ccc/ota/ui/UpdateReceiver$2;->this$0:Lcom/motorola/ccc/ota/ui/UpdateReceiver;

    invoke-static {v1}, Lcom/motorola/ccc/ota/ui/UpdateReceiver;->-$$Nest$fgetmAlarmManager(Lcom/motorola/ccc/ota/ui/UpdateReceiver;)Landroid/app/AlarmManager;

    move-result-object v1

    invoke-virtual {v1, v0}, Landroid/app/AlarmManager;->cancel(Landroid/app/PendingIntent;)V

    iget-object v1, p0, Lcom/motorola/ccc/ota/ui/UpdateReceiver$2;->this$0:Lcom/motorola/ccc/ota/ui/UpdateReceiver;

    invoke-static {v1}, Lcom/motorola/ccc/ota/ui/UpdateReceiver;->-$$Nest$fgetmAlarmManager(Lcom/motorola/ccc/ota/ui/UpdateReceiver;)Landroid/app/AlarmManager;

    move-result-object v1

    iget-wide v2, p0, Lcom/motorola/ccc/ota/ui/UpdateReceiver$2;->val$nextPrompt:J

    const-wide/32 v4, 0x36ee80

    sub-long/2addr v2, v4

    invoke-virtual {v1, v6, v2, v3, v0}, Landroid/app/AlarmManager;->setExactAndAllowWhileIdle(IJLandroid/app/PendingIntent;)V

    goto/16 :goto_0

    :cond_4
    const-string v0, "UpdateReceiver.doSanityCheckForFullScreen: Put only alarm"

    invoke-static {v4, v0}, Lcom/motorola/ccc/ota/utils/Logger;->debug(Ljava/lang/String;Ljava/lang/String;)V

    iget-object v0, p0, Lcom/motorola/ccc/ota/ui/UpdateReceiver$2;->val$intent:Landroid/content/Intent;

    iget-object v7, p0, Lcom/motorola/ccc/ota/ui/UpdateReceiver$2;->this$0:Lcom/motorola/ccc/ota/ui/UpdateReceiver;

    invoke-static {v7}, Lcom/motorola/ccc/ota/ui/UpdateReceiver;->-$$Nest$fgetbotaSettings(Lcom/motorola/ccc/ota/ui/UpdateReceiver;)Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    move-result-object v7

    sget-object v8, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->METADATA:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    invoke-virtual {v7, v8}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->getString(Lcom/motorola/otalib/common/settings/ISetting;)Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v0, v1, v7}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    iget-object v0, p0, Lcom/motorola/ccc/ota/ui/UpdateReceiver$2;->val$info:Lcom/motorola/ccc/ota/ui/UpdaterUtils$UpgradeInfo;

    invoke-virtual {v0}, Lcom/motorola/ccc/ota/ui/UpdaterUtils$UpgradeInfo;->getUpdateTypeData()Ljava/lang/String;

    move-result-object v0

    const-string v1, "Download"

    iget-object v7, p0, Lcom/motorola/ccc/ota/ui/UpdateReceiver$2;->val$key:Ljava/lang/String;

    invoke-virtual {v1, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_5

    iget-object v1, p0, Lcom/motorola/ccc/ota/ui/UpdateReceiver$2;->this$0:Lcom/motorola/ccc/ota/ui/UpdateReceiver;

    invoke-static {v0}, Lcom/motorola/ccc/ota/ui/updateType/UpdateType;->getUpdateType(Ljava/lang/String;)Lcom/motorola/ccc/ota/ui/updateType/UpdateType$UpdateTypeInterface;

    move-result-object v2

    invoke-interface {v2}, Lcom/motorola/ccc/ota/ui/updateType/UpdateType$UpdateTypeInterface;->getPDLNotificationTitle()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Lcom/motorola/ccc/ota/ui/UpdateReceiver;->-$$Nest$fputmNotificationTitle(Lcom/motorola/ccc/ota/ui/UpdateReceiver;Ljava/lang/String;)V

    iget-object v1, p0, Lcom/motorola/ccc/ota/ui/UpdateReceiver$2;->this$0:Lcom/motorola/ccc/ota/ui/UpdateReceiver;

    invoke-static {v0}, Lcom/motorola/ccc/ota/ui/updateType/UpdateType;->getUpdateType(Ljava/lang/String;)Lcom/motorola/ccc/ota/ui/updateType/UpdateType$UpdateTypeInterface;

    move-result-object v0

    invoke-interface {v0}, Lcom/motorola/ccc/ota/ui/updateType/UpdateType$UpdateTypeInterface;->getSystemUpdateAvailableNotificationText()Ljava/lang/String;

    move-result-object v0

    invoke-static {v1, v0}, Lcom/motorola/ccc/ota/ui/UpdateReceiver;->-$$Nest$fputmNotificationTxt(Lcom/motorola/ccc/ota/ui/UpdateReceiver;Ljava/lang/String;)V

    iget-object v0, p0, Lcom/motorola/ccc/ota/ui/UpdateReceiver$2;->val$context:Landroid/content/Context;

    iget-object v1, p0, Lcom/motorola/ccc/ota/ui/UpdateReceiver$2;->this$0:Lcom/motorola/ccc/ota/ui/UpdateReceiver;

    invoke-static {v1}, Lcom/motorola/ccc/ota/ui/UpdateReceiver;->-$$Nest$fgetmNotificationTitle(Lcom/motorola/ccc/ota/ui/UpdateReceiver;)Ljava/lang/String;

    move-result-object v1

    iget-object v2, p0, Lcom/motorola/ccc/ota/ui/UpdateReceiver$2;->this$0:Lcom/motorola/ccc/ota/ui/UpdateReceiver;

    invoke-static {v2}, Lcom/motorola/ccc/ota/ui/UpdateReceiver;->-$$Nest$fgetmNotificationTxt(Lcom/motorola/ccc/ota/ui/UpdateReceiver;)Ljava/lang/String;

    move-result-object v2

    iget-object v3, p0, Lcom/motorola/ccc/ota/ui/UpdateReceiver$2;->val$intent:Landroid/content/Intent;

    invoke-static {v0, v1, v2, v3}, Lcom/motorola/ccc/ota/utils/NotificationUtils;->fillDownloadLaterNotificationDetails(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Landroid/content/Intent;)Landroid/content/Intent;

    move-result-object v0

    iget-object v1, p0, Lcom/motorola/ccc/ota/ui/UpdateReceiver$2;->this$0:Lcom/motorola/ccc/ota/ui/UpdateReceiver;

    iget-object v2, p0, Lcom/motorola/ccc/ota/ui/UpdateReceiver$2;->val$context:Landroid/content/Context;

    invoke-static {v2, v6, v0, v5}, Landroid/app/PendingIntent;->getService(Landroid/content/Context;ILandroid/content/Intent;I)Landroid/app/PendingIntent;

    move-result-object v0

    invoke-static {v1, v0}, Lcom/motorola/ccc/ota/ui/UpdateReceiver;->-$$Nest$fputmPendingIntent(Lcom/motorola/ccc/ota/ui/UpdateReceiver;Landroid/app/PendingIntent;)V

    iget-object v0, p0, Lcom/motorola/ccc/ota/ui/UpdateReceiver$2;->this$0:Lcom/motorola/ccc/ota/ui/UpdateReceiver;

    invoke-static {v0}, Lcom/motorola/ccc/ota/ui/UpdateReceiver;->-$$Nest$fgetmAlarmManager(Lcom/motorola/ccc/ota/ui/UpdateReceiver;)Landroid/app/AlarmManager;

    move-result-object v0

    iget-object v1, p0, Lcom/motorola/ccc/ota/ui/UpdateReceiver$2;->this$0:Lcom/motorola/ccc/ota/ui/UpdateReceiver;

    invoke-static {v1}, Lcom/motorola/ccc/ota/ui/UpdateReceiver;->-$$Nest$fgetmPendingIntent(Lcom/motorola/ccc/ota/ui/UpdateReceiver;)Landroid/app/PendingIntent;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/app/AlarmManager;->cancel(Landroid/app/PendingIntent;)V

    iget-object v0, p0, Lcom/motorola/ccc/ota/ui/UpdateReceiver$2;->this$0:Lcom/motorola/ccc/ota/ui/UpdateReceiver;

    invoke-static {v0}, Lcom/motorola/ccc/ota/ui/UpdateReceiver;->-$$Nest$fgetmAlarmManager(Lcom/motorola/ccc/ota/ui/UpdateReceiver;)Landroid/app/AlarmManager;

    move-result-object v0

    iget-wide v1, p0, Lcom/motorola/ccc/ota/ui/UpdateReceiver$2;->val$nextPrompt:J

    iget-object p0, p0, Lcom/motorola/ccc/ota/ui/UpdateReceiver$2;->this$0:Lcom/motorola/ccc/ota/ui/UpdateReceiver;

    invoke-static {p0}, Lcom/motorola/ccc/ota/ui/UpdateReceiver;->-$$Nest$fgetmPendingIntent(Lcom/motorola/ccc/ota/ui/UpdateReceiver;)Landroid/app/PendingIntent;

    move-result-object p0

    invoke-virtual {v0, v6, v1, v2, p0}, Landroid/app/AlarmManager;->setExactAndAllowWhileIdle(IJLandroid/app/PendingIntent;)V

    goto/16 :goto_0

    :cond_5
    iget-object v1, p0, Lcom/motorola/ccc/ota/ui/UpdateReceiver$2;->val$key:Ljava/lang/String;

    invoke-virtual {v2, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_6

    iget-object v1, p0, Lcom/motorola/ccc/ota/ui/UpdateReceiver$2;->this$0:Lcom/motorola/ccc/ota/ui/UpdateReceiver;

    invoke-static {v0}, Lcom/motorola/ccc/ota/ui/updateType/UpdateType;->getUpdateType(Ljava/lang/String;)Lcom/motorola/ccc/ota/ui/updateType/UpdateType$UpdateTypeInterface;

    move-result-object v2

    invoke-interface {v2}, Lcom/motorola/ccc/ota/ui/updateType/UpdateType$UpdateTypeInterface;->getInstallationTitle()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Lcom/motorola/ccc/ota/ui/UpdateReceiver;->-$$Nest$fputmNotificationTitle(Lcom/motorola/ccc/ota/ui/UpdateReceiver;Ljava/lang/String;)V

    iget-object v1, p0, Lcom/motorola/ccc/ota/ui/UpdateReceiver$2;->this$0:Lcom/motorola/ccc/ota/ui/UpdateReceiver;

    invoke-static {v0}, Lcom/motorola/ccc/ota/ui/updateType/UpdateType;->getUpdateType(Ljava/lang/String;)Lcom/motorola/ccc/ota/ui/updateType/UpdateType$UpdateTypeInterface;

    move-result-object v0

    iget-object v2, p0, Lcom/motorola/ccc/ota/ui/UpdateReceiver$2;->val$info:Lcom/motorola/ccc/ota/ui/UpdaterUtils$UpgradeInfo;

    invoke-static {v0, v2}, Lcom/motorola/ccc/ota/utils/NotificationUtils;->getInstallNotificationText(Lcom/motorola/ccc/ota/ui/updateType/UpdateType$UpdateTypeInterface;Lcom/motorola/ccc/ota/ui/UpdaterUtils$UpgradeInfo;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v1, v0}, Lcom/motorola/ccc/ota/ui/UpdateReceiver;->-$$Nest$fputmNotificationTxt(Lcom/motorola/ccc/ota/ui/UpdateReceiver;Ljava/lang/String;)V

    iget-object v7, p0, Lcom/motorola/ccc/ota/ui/UpdateReceiver$2;->val$context:Landroid/content/Context;

    iget-object v0, p0, Lcom/motorola/ccc/ota/ui/UpdateReceiver$2;->this$0:Lcom/motorola/ccc/ota/ui/UpdateReceiver;

    invoke-static {v0}, Lcom/motorola/ccc/ota/ui/UpdateReceiver;->-$$Nest$fgetmNotificationTitle(Lcom/motorola/ccc/ota/ui/UpdateReceiver;)Ljava/lang/String;

    move-result-object v8

    iget-object v0, p0, Lcom/motorola/ccc/ota/ui/UpdateReceiver$2;->this$0:Lcom/motorola/ccc/ota/ui/UpdateReceiver;

    invoke-static {v0}, Lcom/motorola/ccc/ota/ui/UpdateReceiver;->-$$Nest$fgetmNotificationTxt(Lcom/motorola/ccc/ota/ui/UpdateReceiver;)Ljava/lang/String;

    move-result-object v9

    iget-object v10, p0, Lcom/motorola/ccc/ota/ui/UpdateReceiver$2;->val$intent:Landroid/content/Intent;

    iget-object v0, p0, Lcom/motorola/ccc/ota/ui/UpdateReceiver$2;->val$info:Lcom/motorola/ccc/ota/ui/UpdaterUtils$UpgradeInfo;

    iget-wide v1, p0, Lcom/motorola/ccc/ota/ui/UpdateReceiver$2;->val$nextPrompt:J

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v3

    sub-long/2addr v1, v3

    invoke-static {v0, v1, v2}, Lcom/motorola/ccc/ota/utils/NotificationUtils;->getInstallLaterNotificationExpiryMins(Lcom/motorola/ccc/ota/ui/UpdaterUtils$UpgradeInfo;J)I

    move-result v11

    iget-object v12, p0, Lcom/motorola/ccc/ota/ui/UpdateReceiver$2;->val$version:Ljava/lang/String;

    invoke-static/range {v7 .. v12}, Lcom/motorola/ccc/ota/utils/NotificationUtils;->fillInstallLaterNotificationDetails(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Landroid/content/Intent;ILjava/lang/String;)Landroid/content/Intent;

    move-result-object v0

    iget-object v1, p0, Lcom/motorola/ccc/ota/ui/UpdateReceiver$2;->this$0:Lcom/motorola/ccc/ota/ui/UpdateReceiver;

    iget-object v2, p0, Lcom/motorola/ccc/ota/ui/UpdateReceiver$2;->val$context:Landroid/content/Context;

    invoke-static {v2, v6, v0, v5}, Landroid/app/PendingIntent;->getService(Landroid/content/Context;ILandroid/content/Intent;I)Landroid/app/PendingIntent;

    move-result-object v0

    invoke-static {v1, v0}, Lcom/motorola/ccc/ota/ui/UpdateReceiver;->-$$Nest$fputmPendingIntent(Lcom/motorola/ccc/ota/ui/UpdateReceiver;Landroid/app/PendingIntent;)V

    iget-object v0, p0, Lcom/motorola/ccc/ota/ui/UpdateReceiver$2;->this$0:Lcom/motorola/ccc/ota/ui/UpdateReceiver;

    invoke-static {v0}, Lcom/motorola/ccc/ota/ui/UpdateReceiver;->-$$Nest$fgetmAlarmManager(Lcom/motorola/ccc/ota/ui/UpdateReceiver;)Landroid/app/AlarmManager;

    move-result-object v0

    iget-object v1, p0, Lcom/motorola/ccc/ota/ui/UpdateReceiver$2;->this$0:Lcom/motorola/ccc/ota/ui/UpdateReceiver;

    invoke-static {v1}, Lcom/motorola/ccc/ota/ui/UpdateReceiver;->-$$Nest$fgetmPendingIntent(Lcom/motorola/ccc/ota/ui/UpdateReceiver;)Landroid/app/PendingIntent;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/app/AlarmManager;->cancel(Landroid/app/PendingIntent;)V

    iget-object v0, p0, Lcom/motorola/ccc/ota/ui/UpdateReceiver$2;->this$0:Lcom/motorola/ccc/ota/ui/UpdateReceiver;

    invoke-static {v0}, Lcom/motorola/ccc/ota/ui/UpdateReceiver;->-$$Nest$fgetmAlarmManager(Lcom/motorola/ccc/ota/ui/UpdateReceiver;)Landroid/app/AlarmManager;

    move-result-object v0

    iget-wide v1, p0, Lcom/motorola/ccc/ota/ui/UpdateReceiver$2;->val$nextPrompt:J

    iget-object p0, p0, Lcom/motorola/ccc/ota/ui/UpdateReceiver$2;->this$0:Lcom/motorola/ccc/ota/ui/UpdateReceiver;

    invoke-static {p0}, Lcom/motorola/ccc/ota/ui/UpdateReceiver;->-$$Nest$fgetmPendingIntent(Lcom/motorola/ccc/ota/ui/UpdateReceiver;)Landroid/app/PendingIntent;

    move-result-object p0

    invoke-virtual {v0, v6, v1, v2, p0}, Landroid/app/AlarmManager;->setExactAndAllowWhileIdle(IJLandroid/app/PendingIntent;)V

    goto :goto_0

    :cond_6
    iget-object v0, p0, Lcom/motorola/ccc/ota/ui/UpdateReceiver$2;->val$key:Ljava/lang/String;

    invoke-virtual {v3, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_7

    sget-object v0, Ljava/util/concurrent/TimeUnit;->MILLISECONDS:Ljava/util/concurrent/TimeUnit;

    iget-wide v1, p0, Lcom/motorola/ccc/ota/ui/UpdateReceiver$2;->val$nextPrompt:J

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v7

    sub-long/2addr v1, v7

    invoke-virtual {v0, v1, v2}, Ljava/util/concurrent/TimeUnit;->toMinutes(J)J

    move-result-wide v0

    long-to-int v0, v0

    const/4 v1, 0x1

    add-int/2addr v0, v1

    new-instance v2, Ljava/lang/StringBuilder;

    const-string v3, "OTA restarted at restart phase, so rescheduling alarm to display the notification after "

    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v2, " mins"

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v4, v0}, Lcom/motorola/ccc/ota/utils/Logger;->debug(Ljava/lang/String;Ljava/lang/String;)V

    iget-object v0, p0, Lcom/motorola/ccc/ota/ui/UpdateReceiver$2;->val$context:Landroid/content/Context;

    iget-object v2, p0, Lcom/motorola/ccc/ota/ui/UpdateReceiver$2;->val$version:Ljava/lang/String;

    iget-object v3, p0, Lcom/motorola/ccc/ota/ui/UpdateReceiver$2;->val$intent:Landroid/content/Intent;

    iget-object v4, p0, Lcom/motorola/ccc/ota/ui/UpdateReceiver$2;->val$info:Lcom/motorola/ccc/ota/ui/UpdaterUtils$UpgradeInfo;

    invoke-static {v0, v2, v1, v3, v4}, Lcom/motorola/ccc/ota/utils/NotificationUtils;->fillRestartSystemNotificationDetails(Landroid/content/Context;Ljava/lang/String;ILandroid/content/Intent;Lcom/motorola/ccc/ota/ui/UpdaterUtils$UpgradeInfo;)Landroid/content/Intent;

    move-result-object v0

    iget-object v1, p0, Lcom/motorola/ccc/ota/ui/UpdateReceiver$2;->this$0:Lcom/motorola/ccc/ota/ui/UpdateReceiver;

    iget-object v2, p0, Lcom/motorola/ccc/ota/ui/UpdateReceiver$2;->val$context:Landroid/content/Context;

    invoke-static {v2, v6, v0, v5}, Landroid/app/PendingIntent;->getService(Landroid/content/Context;ILandroid/content/Intent;I)Landroid/app/PendingIntent;

    move-result-object v0

    invoke-static {v1, v0}, Lcom/motorola/ccc/ota/ui/UpdateReceiver;->-$$Nest$fputmPendingIntent(Lcom/motorola/ccc/ota/ui/UpdateReceiver;Landroid/app/PendingIntent;)V

    iget-object v0, p0, Lcom/motorola/ccc/ota/ui/UpdateReceiver$2;->this$0:Lcom/motorola/ccc/ota/ui/UpdateReceiver;

    invoke-static {v0}, Lcom/motorola/ccc/ota/ui/UpdateReceiver;->-$$Nest$fgetmAlarmManager(Lcom/motorola/ccc/ota/ui/UpdateReceiver;)Landroid/app/AlarmManager;

    move-result-object v0

    iget-object v1, p0, Lcom/motorola/ccc/ota/ui/UpdateReceiver$2;->this$0:Lcom/motorola/ccc/ota/ui/UpdateReceiver;

    invoke-static {v1}, Lcom/motorola/ccc/ota/ui/UpdateReceiver;->-$$Nest$fgetmPendingIntent(Lcom/motorola/ccc/ota/ui/UpdateReceiver;)Landroid/app/PendingIntent;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/app/AlarmManager;->cancel(Landroid/app/PendingIntent;)V

    iget-object v0, p0, Lcom/motorola/ccc/ota/ui/UpdateReceiver$2;->this$0:Lcom/motorola/ccc/ota/ui/UpdateReceiver;

    invoke-static {v0}, Lcom/motorola/ccc/ota/ui/UpdateReceiver;->-$$Nest$fgetmAlarmManager(Lcom/motorola/ccc/ota/ui/UpdateReceiver;)Landroid/app/AlarmManager;

    move-result-object v0

    iget-wide v1, p0, Lcom/motorola/ccc/ota/ui/UpdateReceiver$2;->val$nextPrompt:J

    iget-object p0, p0, Lcom/motorola/ccc/ota/ui/UpdateReceiver$2;->this$0:Lcom/motorola/ccc/ota/ui/UpdateReceiver;

    invoke-static {p0}, Lcom/motorola/ccc/ota/ui/UpdateReceiver;->-$$Nest$fgetmPendingIntent(Lcom/motorola/ccc/ota/ui/UpdateReceiver;)Landroid/app/PendingIntent;

    move-result-object p0

    invoke-virtual {v0, v6, v1, v2, p0}, Landroid/app/AlarmManager;->setExactAndAllowWhileIdle(IJLandroid/app/PendingIntent;)V

    :cond_7
    :goto_0
    return-void
.end method
