.class Lcom/motorola/ccc/ota/ui/NotificationService$MyIntentReceiver;
.super Landroid/content/BroadcastReceiver;
.source "NotificationService.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/motorola/ccc/ota/ui/NotificationService;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "MyIntentReceiver"
.end annotation


# instance fields
.field final synthetic this$0:Lcom/motorola/ccc/ota/ui/NotificationService;


# direct methods
.method private constructor <init>(Lcom/motorola/ccc/ota/ui/NotificationService;)V
    .locals 0

    iput-object p1, p0, Lcom/motorola/ccc/ota/ui/NotificationService$MyIntentReceiver;->this$0:Lcom/motorola/ccc/ota/ui/NotificationService;

    invoke-direct {p0}, Landroid/content/BroadcastReceiver;-><init>()V

    return-void
.end method

.method synthetic constructor <init>(Lcom/motorola/ccc/ota/ui/NotificationService;Lcom/motorola/ccc/ota/ui/NotificationService$MyIntentReceiver-IA;)V
    .locals 0

    invoke-direct {p0, p1}, Lcom/motorola/ccc/ota/ui/NotificationService$MyIntentReceiver;-><init>(Lcom/motorola/ccc/ota/ui/NotificationService;)V

    return-void
.end method

.method private shouldIBlockFullScreenRemainder(Landroid/content/Context;)Z
    .locals 3

    iget-object v0, p0, Lcom/motorola/ccc/ota/ui/NotificationService$MyIntentReceiver;->this$0:Lcom/motorola/ccc/ota/ui/NotificationService;

    invoke-static {v0}, Lcom/motorola/ccc/ota/ui/NotificationService;->-$$Nest$fgetmResponseIntent(Lcom/motorola/ccc/ota/ui/NotificationService;)Landroid/content/Intent;

    move-result-object v0

    invoke-static {v0}, Lcom/motorola/ccc/ota/ui/UpdaterUtils;->getUpgradeInfoDuringOTAUpdate(Landroid/content/Intent;)Lcom/motorola/ccc/ota/ui/UpdaterUtils$UpgradeInfo;

    move-result-object v0

    invoke-static {p1}, Lcom/motorola/ccc/ota/ui/UpdaterUtils;->isDeviceLocked(Landroid/content/Context;)Z

    move-result p1

    const/4 v1, 0x0

    if-eqz p1, :cond_0

    return v1

    :cond_0
    iget-object p1, p0, Lcom/motorola/ccc/ota/ui/NotificationService$MyIntentReceiver;->this$0:Lcom/motorola/ccc/ota/ui/NotificationService;

    invoke-static {p1}, Lcom/motorola/ccc/ota/ui/NotificationService;->-$$Nest$fgetmAction(Lcom/motorola/ccc/ota/ui/NotificationService;)Ljava/lang/String;

    move-result-object p1

    const-string v2, "com.motorola.ccc.ota.ACTION_PAUSE_DOWNLOAD_FOR_CELLULAR"

    invoke-virtual {v2, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    const/4 v2, 0x1

    if-eqz p1, :cond_1

    return v2

    :cond_1
    if-eqz v0, :cond_3

    invoke-virtual {v0}, Lcom/motorola/ccc/ota/ui/UpdaterUtils$UpgradeInfo;->isCriticalUpdate()Z

    move-result p1

    if-nez p1, :cond_3

    invoke-virtual {v0}, Lcom/motorola/ccc/ota/ui/UpdaterUtils$UpgradeInfo;->isForceDownloadTimeSet()Z

    move-result p1

    if-nez p1, :cond_3

    invoke-virtual {v0}, Lcom/motorola/ccc/ota/ui/UpdaterUtils$UpgradeInfo;->isForceInstallTimeSet()Z

    move-result p1

    if-eqz p1, :cond_2

    goto :goto_0

    :cond_2
    iget-object p0, p0, Lcom/motorola/ccc/ota/ui/NotificationService$MyIntentReceiver;->this$0:Lcom/motorola/ccc/ota/ui/NotificationService;

    invoke-static {p0}, Lcom/motorola/ccc/ota/ui/NotificationService;->-$$Nest$fgetsettings(Lcom/motorola/ccc/ota/ui/NotificationService;)Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    move-result-object p0

    sget-object p1, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->CHECKBOX_SELECTED:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    invoke-virtual {p0, p1}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->getBoolean(Lcom/motorola/otalib/common/settings/ISetting;)Z

    move-result p0

    xor-int/2addr p0, v2

    return p0

    :cond_3
    :goto_0
    return v1
.end method


# virtual methods
.method public onReceive(Landroid/content/Context;Landroid/content/Intent;)V
    .locals 9

    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "NotificationService.handleIntent: "

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p2}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    const-string v1, "OtaApp"

    invoke-static {v1, v0}, Lcom/motorola/ccc/ota/utils/Logger;->debug(Ljava/lang/String;Ljava/lang/String;)V

    const-string v0, "com.motorola.blur.service.blur.Actions.MANUAL_CHECK_UPDATE"

    invoke-virtual {p2}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    const/4 v2, 0x0

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/motorola/ccc/ota/ui/NotificationService$MyIntentReceiver;->this$0:Lcom/motorola/ccc/ota/ui/NotificationService;

    invoke-static {v0}, Lcom/motorola/ccc/ota/ui/NotificationService;->-$$Nest$fgetsettings(Lcom/motorola/ccc/ota/ui/NotificationService;)Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    move-result-object v0

    sget-object v3, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->SHOULD_BLOCK_FULL_SCREEN_DISPLAY:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    invoke-virtual {v0, v3, v2}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->setBoolean(Lcom/motorola/otalib/common/settings/ISetting;Z)V

    iget-object v0, p0, Lcom/motorola/ccc/ota/ui/NotificationService$MyIntentReceiver;->this$0:Lcom/motorola/ccc/ota/ui/NotificationService;

    invoke-static {v0}, Lcom/motorola/ccc/ota/ui/NotificationService;->-$$Nest$fgetmResponseAsBroadcast(Lcom/motorola/ccc/ota/ui/NotificationService;)Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/motorola/ccc/ota/ui/NotificationService$MyIntentReceiver;->this$0:Lcom/motorola/ccc/ota/ui/NotificationService;

    invoke-static {v0}, Lcom/motorola/ccc/ota/ui/NotificationService;->-$$Nest$fgetmRespondBackForSystemUpdates(Lcom/motorola/ccc/ota/ui/NotificationService;)Z

    move-result v0

    if-eqz v0, :cond_1

    :cond_0
    iget-object p0, p0, Lcom/motorola/ccc/ota/ui/NotificationService$MyIntentReceiver;->this$0:Lcom/motorola/ccc/ota/ui/NotificationService;

    invoke-virtual {p0}, Lcom/motorola/ccc/ota/ui/NotificationService;->stopSelf()V

    return-void

    :cond_1
    const-string v0, "com.motorola.ccc.ota.ns.alarmintent"

    invoke-virtual {p2}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v0, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    const-string v3, "CheckForMap"

    const-string v4, "com.motorola.ccc.ota.Permissions.INTERACT_OTA_SERVICE"

    const/4 v5, 0x1

    const/high16 v6, 0x10000000

    const-string v7, "com.motorola.blur.service.blur.upgrade.KEY_FULL_SCREEN_REMINDER"

    if-eqz v0, :cond_3

    iget-object p2, p0, Lcom/motorola/ccc/ota/ui/NotificationService$MyIntentReceiver;->this$0:Lcom/motorola/ccc/ota/ui/NotificationService;

    invoke-static {p2}, Lcom/motorola/ccc/ota/ui/NotificationService;->-$$Nest$fgetsettings(Lcom/motorola/ccc/ota/ui/NotificationService;)Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    move-result-object p2

    sget-object v0, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->SHOULD_BLOCK_FULL_SCREEN_DISPLAY:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    invoke-virtual {p2, v0, v2}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->setBoolean(Lcom/motorola/otalib/common/settings/ISetting;Z)V

    iget-object p2, p0, Lcom/motorola/ccc/ota/ui/NotificationService$MyIntentReceiver;->this$0:Lcom/motorola/ccc/ota/ui/NotificationService;

    invoke-static {p2}, Lcom/motorola/ccc/ota/ui/NotificationService;->-$$Nest$fgetmResponseIntent(Lcom/motorola/ccc/ota/ui/NotificationService;)Landroid/content/Intent;

    move-result-object p2

    const-string v0, "userTappedOnNotification"

    invoke-virtual {p2, v7, v0}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    iget-object p2, p0, Lcom/motorola/ccc/ota/ui/NotificationService$MyIntentReceiver;->this$0:Lcom/motorola/ccc/ota/ui/NotificationService;

    invoke-static {p2}, Lcom/motorola/ccc/ota/ui/NotificationService;->-$$Nest$mclearState(Lcom/motorola/ccc/ota/ui/NotificationService;)V

    iget-object p2, p0, Lcom/motorola/ccc/ota/ui/NotificationService$MyIntentReceiver;->this$0:Lcom/motorola/ccc/ota/ui/NotificationService;

    invoke-static {p2}, Lcom/motorola/ccc/ota/ui/NotificationService;->-$$Nest$fgetmResponseAsBroadcast(Lcom/motorola/ccc/ota/ui/NotificationService;)Z

    move-result p2

    if-eqz p2, :cond_2

    iget-object p2, p0, Lcom/motorola/ccc/ota/ui/NotificationService$MyIntentReceiver;->this$0:Lcom/motorola/ccc/ota/ui/NotificationService;

    invoke-static {p2}, Lcom/motorola/ccc/ota/ui/NotificationService;->-$$Nest$fgetsettings(Lcom/motorola/ccc/ota/ui/NotificationService;)Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    move-result-object p2

    sget-object v0, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->NOTIFICATION_TAPPED:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    invoke-virtual {p2, v0, v5}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->setBoolean(Lcom/motorola/otalib/common/settings/ISetting;Z)V

    iget-object p2, p0, Lcom/motorola/ccc/ota/ui/NotificationService$MyIntentReceiver;->this$0:Lcom/motorola/ccc/ota/ui/NotificationService;

    invoke-static {p2}, Lcom/motorola/ccc/ota/ui/NotificationService;->-$$Nest$fgetmResponseIntent(Lcom/motorola/ccc/ota/ui/NotificationService;)Landroid/content/Intent;

    move-result-object p2

    invoke-virtual {p2, v3, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Z)Landroid/content/Intent;

    iget-object p2, p0, Lcom/motorola/ccc/ota/ui/NotificationService$MyIntentReceiver;->this$0:Lcom/motorola/ccc/ota/ui/NotificationService;

    invoke-static {p2}, Lcom/motorola/ccc/ota/ui/NotificationService;->-$$Nest$fgetmResponseIntent(Lcom/motorola/ccc/ota/ui/NotificationService;)Landroid/content/Intent;

    move-result-object p2

    invoke-virtual {p1, p2, v4}, Landroid/content/Context;->sendBroadcast(Landroid/content/Intent;Ljava/lang/String;)V

    goto :goto_0

    :cond_2
    iget-object p2, p0, Lcom/motorola/ccc/ota/ui/NotificationService$MyIntentReceiver;->this$0:Lcom/motorola/ccc/ota/ui/NotificationService;

    invoke-static {p2}, Lcom/motorola/ccc/ota/ui/NotificationService;->-$$Nest$fgetmResponseIntent(Lcom/motorola/ccc/ota/ui/NotificationService;)Landroid/content/Intent;

    move-result-object p2

    invoke-virtual {p2, v6}, Landroid/content/Intent;->setFlags(I)Landroid/content/Intent;

    iget-object p2, p0, Lcom/motorola/ccc/ota/ui/NotificationService$MyIntentReceiver;->this$0:Lcom/motorola/ccc/ota/ui/NotificationService;

    invoke-static {p2}, Lcom/motorola/ccc/ota/ui/NotificationService;->-$$Nest$fgetmResponseIntent(Lcom/motorola/ccc/ota/ui/NotificationService;)Landroid/content/Intent;

    move-result-object p2

    invoke-virtual {p1, p2}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    :goto_0
    iget-object p0, p0, Lcom/motorola/ccc/ota/ui/NotificationService$MyIntentReceiver;->this$0:Lcom/motorola/ccc/ota/ui/NotificationService;

    invoke-virtual {p0}, Lcom/motorola/ccc/ota/ui/NotificationService;->stopSelf()V

    return-void

    :cond_3
    const-string v0, "com.motorola.ccc.ota.ns.alarmtriggerintent"

    invoke-virtual {p2}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v0, v8}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    const-string v8, "android.intent.action.USER_PRESENT"

    if-eqz v0, :cond_7

    iget-object p2, p0, Lcom/motorola/ccc/ota/ui/NotificationService$MyIntentReceiver;->this$0:Lcom/motorola/ccc/ota/ui/NotificationService;

    invoke-static {p2}, Lcom/motorola/ccc/ota/ui/NotificationService;->-$$Nest$fgetmAction(Lcom/motorola/ccc/ota/ui/NotificationService;)Ljava/lang/String;

    move-result-object p2

    const-string v0, "com.motorola.ccc.ota.ACTION_PAUSE_DOWNLOAD_FOR_CELLULAR"

    invoke-virtual {v0, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p2

    if-eqz p2, :cond_4

    iget-object p2, p0, Lcom/motorola/ccc/ota/ui/NotificationService$MyIntentReceiver;->this$0:Lcom/motorola/ccc/ota/ui/NotificationService;

    invoke-static {p2}, Lcom/motorola/ccc/ota/ui/NotificationService;->-$$Nest$fgetsettings(Lcom/motorola/ccc/ota/ui/NotificationService;)Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    move-result-object p2

    invoke-static {p2}, Lcom/motorola/ccc/ota/ui/UpdaterUtils;->setProgressScreenDisplayNextPrompt(Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;)V

    :cond_4
    invoke-direct {p0, p1}, Lcom/motorola/ccc/ota/ui/NotificationService$MyIntentReceiver;->shouldIBlockFullScreenRemainder(Landroid/content/Context;)Z

    move-result p2

    if-eqz p2, :cond_5

    iget-object p1, p0, Lcom/motorola/ccc/ota/ui/NotificationService$MyIntentReceiver;->this$0:Lcom/motorola/ccc/ota/ui/NotificationService;

    invoke-static {p1}, Lcom/motorola/ccc/ota/ui/NotificationService;->-$$Nest$fgetsettings(Lcom/motorola/ccc/ota/ui/NotificationService;)Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    move-result-object p1

    sget-object p2, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->SHOULD_BLOCK_FULL_SCREEN_DISPLAY:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    invoke-virtual {p1, p2, v5}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->setBoolean(Lcom/motorola/otalib/common/settings/ISetting;Z)V

    new-instance p1, Landroid/content/IntentFilter;

    invoke-direct {p1}, Landroid/content/IntentFilter;-><init>()V

    invoke-virtual {p1, v8}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    iget-object p0, p0, Lcom/motorola/ccc/ota/ui/NotificationService$MyIntentReceiver;->this$0:Lcom/motorola/ccc/ota/ui/NotificationService;

    invoke-static {p0}, Lcom/motorola/ccc/ota/ui/NotificationService;->-$$Nest$fgetmRecv(Lcom/motorola/ccc/ota/ui/NotificationService;)Lcom/motorola/ccc/ota/ui/NotificationService$MyIntentReceiver;

    move-result-object p2

    const/4 v0, 0x2

    invoke-virtual {p0, p2, p1, v0}, Lcom/motorola/ccc/ota/ui/NotificationService;->registerReceiver(Landroid/content/BroadcastReceiver;Landroid/content/IntentFilter;I)Landroid/content/Intent;

    const-string p0, "ScreenListener registered"

    invoke-static {v1, p0}, Lcom/motorola/ccc/ota/utils/Logger;->info(Ljava/lang/String;Ljava/lang/String;)V

    return-void

    :cond_5
    iget-object p2, p0, Lcom/motorola/ccc/ota/ui/NotificationService$MyIntentReceiver;->this$0:Lcom/motorola/ccc/ota/ui/NotificationService;

    invoke-static {p2}, Lcom/motorola/ccc/ota/ui/NotificationService;->-$$Nest$mclearState(Lcom/motorola/ccc/ota/ui/NotificationService;)V

    iget-object p2, p0, Lcom/motorola/ccc/ota/ui/NotificationService$MyIntentReceiver;->this$0:Lcom/motorola/ccc/ota/ui/NotificationService;

    invoke-static {p2}, Lcom/motorola/ccc/ota/ui/NotificationService;->-$$Nest$fgetmResponseIntent(Lcom/motorola/ccc/ota/ui/NotificationService;)Landroid/content/Intent;

    move-result-object p2

    const-string v0, "afterAlarmExpiry"

    invoke-virtual {p2, v7, v0}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    iget-object p2, p0, Lcom/motorola/ccc/ota/ui/NotificationService$MyIntentReceiver;->this$0:Lcom/motorola/ccc/ota/ui/NotificationService;

    invoke-static {p2}, Lcom/motorola/ccc/ota/ui/NotificationService;->-$$Nest$fgetmResponseAsBroadcast(Lcom/motorola/ccc/ota/ui/NotificationService;)Z

    move-result p2

    if-eqz p2, :cond_6

    iget-object p2, p0, Lcom/motorola/ccc/ota/ui/NotificationService$MyIntentReceiver;->this$0:Lcom/motorola/ccc/ota/ui/NotificationService;

    invoke-static {p2}, Lcom/motorola/ccc/ota/ui/NotificationService;->-$$Nest$fgetmResponseIntent(Lcom/motorola/ccc/ota/ui/NotificationService;)Landroid/content/Intent;

    move-result-object p2

    invoke-virtual {p2, v3, v5}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Z)Landroid/content/Intent;

    iget-object p2, p0, Lcom/motorola/ccc/ota/ui/NotificationService$MyIntentReceiver;->this$0:Lcom/motorola/ccc/ota/ui/NotificationService;

    invoke-static {p2}, Lcom/motorola/ccc/ota/ui/NotificationService;->-$$Nest$fgetmResponseIntent(Lcom/motorola/ccc/ota/ui/NotificationService;)Landroid/content/Intent;

    move-result-object p2

    invoke-virtual {p1, p2, v4}, Landroid/content/Context;->sendBroadcast(Landroid/content/Intent;Ljava/lang/String;)V

    goto :goto_1

    :cond_6
    iget-object p2, p0, Lcom/motorola/ccc/ota/ui/NotificationService$MyIntentReceiver;->this$0:Lcom/motorola/ccc/ota/ui/NotificationService;

    invoke-static {p2}, Lcom/motorola/ccc/ota/ui/NotificationService;->-$$Nest$fgetmResponseIntent(Lcom/motorola/ccc/ota/ui/NotificationService;)Landroid/content/Intent;

    move-result-object p2

    invoke-virtual {p2, v6}, Landroid/content/Intent;->setFlags(I)Landroid/content/Intent;

    iget-object p2, p0, Lcom/motorola/ccc/ota/ui/NotificationService$MyIntentReceiver;->this$0:Lcom/motorola/ccc/ota/ui/NotificationService;

    invoke-static {p2}, Lcom/motorola/ccc/ota/ui/NotificationService;->-$$Nest$fgetmResponseIntent(Lcom/motorola/ccc/ota/ui/NotificationService;)Landroid/content/Intent;

    move-result-object p2

    invoke-virtual {p1, p2}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    :goto_1
    iget-object p0, p0, Lcom/motorola/ccc/ota/ui/NotificationService$MyIntentReceiver;->this$0:Lcom/motorola/ccc/ota/ui/NotificationService;

    invoke-virtual {p0}, Lcom/motorola/ccc/ota/ui/NotificationService;->stopSelf()V

    return-void

    :cond_7
    invoke-virtual {p2}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object p2

    invoke-virtual {v8, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p2

    if-eqz p2, :cond_9

    const-string p2, "NotificationService:user unlocked the device"

    invoke-static {v1, p2}, Lcom/motorola/ccc/ota/utils/Logger;->debug(Ljava/lang/String;Ljava/lang/String;)V

    iget-object p2, p0, Lcom/motorola/ccc/ota/ui/NotificationService$MyIntentReceiver;->this$0:Lcom/motorola/ccc/ota/ui/NotificationService;

    invoke-static {p2}, Lcom/motorola/ccc/ota/ui/NotificationService;->-$$Nest$fgetsettings(Lcom/motorola/ccc/ota/ui/NotificationService;)Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    move-result-object p2

    sget-object v0, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->SHOULD_BLOCK_FULL_SCREEN_DISPLAY:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    invoke-virtual {p2, v0, v2}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->setBoolean(Lcom/motorola/otalib/common/settings/ISetting;Z)V

    iget-object p2, p0, Lcom/motorola/ccc/ota/ui/NotificationService$MyIntentReceiver;->this$0:Lcom/motorola/ccc/ota/ui/NotificationService;

    invoke-static {p2}, Lcom/motorola/ccc/ota/ui/NotificationService;->-$$Nest$fgetmResponseIntent(Lcom/motorola/ccc/ota/ui/NotificationService;)Landroid/content/Intent;

    move-result-object p2

    const-string v0, "afterScreenUnlock"

    invoke-virtual {p2, v7, v0}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    iget-object p2, p0, Lcom/motorola/ccc/ota/ui/NotificationService$MyIntentReceiver;->this$0:Lcom/motorola/ccc/ota/ui/NotificationService;

    invoke-static {p2}, Lcom/motorola/ccc/ota/ui/NotificationService;->-$$Nest$mclearState(Lcom/motorola/ccc/ota/ui/NotificationService;)V

    iget-object p2, p0, Lcom/motorola/ccc/ota/ui/NotificationService$MyIntentReceiver;->this$0:Lcom/motorola/ccc/ota/ui/NotificationService;

    invoke-static {p2}, Lcom/motorola/ccc/ota/ui/NotificationService;->-$$Nest$fgetmResponseAsBroadcast(Lcom/motorola/ccc/ota/ui/NotificationService;)Z

    move-result p2

    if-eqz p2, :cond_8

    iget-object p2, p0, Lcom/motorola/ccc/ota/ui/NotificationService$MyIntentReceiver;->this$0:Lcom/motorola/ccc/ota/ui/NotificationService;

    invoke-static {p2}, Lcom/motorola/ccc/ota/ui/NotificationService;->-$$Nest$fgetmResponseIntent(Lcom/motorola/ccc/ota/ui/NotificationService;)Landroid/content/Intent;

    move-result-object p2

    invoke-virtual {p1, p2, v4}, Landroid/content/Context;->sendBroadcast(Landroid/content/Intent;Ljava/lang/String;)V

    goto :goto_2

    :cond_8
    iget-object p2, p0, Lcom/motorola/ccc/ota/ui/NotificationService$MyIntentReceiver;->this$0:Lcom/motorola/ccc/ota/ui/NotificationService;

    invoke-static {p2}, Lcom/motorola/ccc/ota/ui/NotificationService;->-$$Nest$fgetmResponseIntent(Lcom/motorola/ccc/ota/ui/NotificationService;)Landroid/content/Intent;

    move-result-object p2

    invoke-virtual {p2, v6}, Landroid/content/Intent;->setFlags(I)Landroid/content/Intent;

    iget-object p2, p0, Lcom/motorola/ccc/ota/ui/NotificationService$MyIntentReceiver;->this$0:Lcom/motorola/ccc/ota/ui/NotificationService;

    invoke-static {p2}, Lcom/motorola/ccc/ota/ui/NotificationService;->-$$Nest$fgetmResponseIntent(Lcom/motorola/ccc/ota/ui/NotificationService;)Landroid/content/Intent;

    move-result-object p2

    invoke-virtual {p1, p2}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    :goto_2
    iget-object p0, p0, Lcom/motorola/ccc/ota/ui/NotificationService$MyIntentReceiver;->this$0:Lcom/motorola/ccc/ota/ui/NotificationService;

    invoke-virtual {p0}, Lcom/motorola/ccc/ota/ui/NotificationService;->stopSelf()V

    :cond_9
    return-void
.end method
