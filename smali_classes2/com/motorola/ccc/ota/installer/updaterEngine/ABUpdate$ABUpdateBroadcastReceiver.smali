.class Lcom/motorola/ccc/ota/installer/updaterEngine/ABUpdate$ABUpdateBroadcastReceiver;
.super Landroid/content/BroadcastReceiver;
.source "ABUpdate.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/motorola/ccc/ota/installer/updaterEngine/ABUpdate;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "ABUpdateBroadcastReceiver"
.end annotation


# instance fields
.field final synthetic this$0:Lcom/motorola/ccc/ota/installer/updaterEngine/ABUpdate;


# direct methods
.method private constructor <init>(Lcom/motorola/ccc/ota/installer/updaterEngine/ABUpdate;)V
    .locals 0

    iput-object p1, p0, Lcom/motorola/ccc/ota/installer/updaterEngine/ABUpdate$ABUpdateBroadcastReceiver;->this$0:Lcom/motorola/ccc/ota/installer/updaterEngine/ABUpdate;

    invoke-direct {p0}, Landroid/content/BroadcastReceiver;-><init>()V

    return-void
.end method

.method synthetic constructor <init>(Lcom/motorola/ccc/ota/installer/updaterEngine/ABUpdate;Lcom/motorola/ccc/ota/installer/updaterEngine/ABUpdate$ABUpdateBroadcastReceiver-IA;)V
    .locals 0

    invoke-direct {p0, p1}, Lcom/motorola/ccc/ota/installer/updaterEngine/ABUpdate$ABUpdateBroadcastReceiver;-><init>(Lcom/motorola/ccc/ota/installer/updaterEngine/ABUpdate;)V

    return-void
.end method

.method private handleUEMaxTimerExpiry(Landroid/content/Intent;)V
    .locals 5

    iget-object v0, p0, Lcom/motorola/ccc/ota/installer/updaterEngine/ABUpdate$ABUpdateBroadcastReceiver;->this$0:Lcom/motorola/ccc/ota/installer/updaterEngine/ABUpdate;

    iget-object v0, v0, Lcom/motorola/ccc/ota/installer/updaterEngine/ABUpdate;->_settings:Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    sget-object v1, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->STORED_AB_STATUS:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->getInt(Lcom/motorola/otalib/common/settings/ISetting;I)I

    move-result v0

    iget-object v1, p0, Lcom/motorola/ccc/ota/installer/updaterEngine/ABUpdate$ABUpdateBroadcastReceiver;->this$0:Lcom/motorola/ccc/ota/installer/updaterEngine/ABUpdate;

    iget-object v1, v1, Lcom/motorola/ccc/ota/installer/updaterEngine/ABUpdate;->_settings:Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    sget-object v3, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->STORED_AB_PROGRESS_PERCENT:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    const/4 v4, 0x0

    invoke-virtual {v1, v3, v4}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->getFloat(Lcom/motorola/otalib/common/settings/ISetting;F)F

    move-result v1

    const-string v3, "key_status"

    invoke-virtual {p1, v3, v2}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I

    move-result v2

    const-string v3, "key_percentage"

    invoke-virtual {p1, v3, v4}, Landroid/content/Intent;->getFloatExtra(Ljava/lang/String;F)F

    move-result p1

    if-gt v0, v2, :cond_1

    if-ne v0, v2, :cond_0

    cmpl-float p1, v1, p1

    if-lez p1, :cond_0

    goto :goto_0

    :cond_0
    invoke-static {}, Lcom/motorola/ccc/ota/installer/updaterEngine/common/UpdaterEngineStateHandler;->isBusy()Z

    move-result p1

    if-eqz p1, :cond_2

    sget-object p1, Lcom/motorola/ccc/ota/installer/updaterEngine/common/InstallerUtilMethods$InstallerErrorStatus;->STATUS_UE_NOT_RESPONDING:Lcom/motorola/ccc/ota/installer/updaterEngine/common/InstallerUtilMethods$InstallerErrorStatus;

    invoke-static {p1}, Lcom/motorola/ccc/ota/installer/updaterEngine/ABUpdate;->-$$Nest$sfputmInstallerStatus(Lcom/motorola/ccc/ota/installer/updaterEngine/common/InstallerUtilMethods$InstallerErrorStatus;)V

    invoke-static {}, Lcom/motorola/ccc/ota/installer/updaterEngine/common/UpdaterEngineHelper;->cancelUpdateEngine()Z

    move-result p1

    if-nez p1, :cond_2

    iget-object p0, p0, Lcom/motorola/ccc/ota/installer/updaterEngine/ABUpdate$ABUpdateBroadcastReceiver;->this$0:Lcom/motorola/ccc/ota/installer/updaterEngine/ABUpdate;

    invoke-static {p0}, Lcom/motorola/ccc/ota/installer/updaterEngine/ABUpdate;->-$$Nest$fgetcallbackHandler(Lcom/motorola/ccc/ota/installer/updaterEngine/ABUpdate;)Lcom/motorola/ccc/ota/installer/updaterEngine/ABUpdate$UECallbackHandler;

    move-result-object p0

    new-instance p1, Ljava/lang/StringBuilder;

    const-string v2, "Updater engine is not responding at , status "

    invoke-direct {p1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object p1

    const-string v0, " percentage "

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1, v1}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    move-result-object p1

    const-string v0, " "

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    const-string v0, "UE_NOT_RESPONDING."

    const/4 v1, -0x1

    invoke-virtual {p0, v1, p1, v0}, Lcom/motorola/ccc/ota/installer/updaterEngine/ABUpdate$UECallbackHandler;->onCompleted(ILjava/lang/String;Ljava/lang/String;)V

    goto :goto_1

    :cond_1
    :goto_0
    iget-object p0, p0, Lcom/motorola/ccc/ota/installer/updaterEngine/ABUpdate$ABUpdateBroadcastReceiver;->this$0:Lcom/motorola/ccc/ota/installer/updaterEngine/ABUpdate;

    invoke-virtual {p0, v0, v1}, Lcom/motorola/ccc/ota/installer/updaterEngine/ABUpdate;->setExpiryAlarmForUE(IF)V

    :cond_2
    :goto_1
    return-void
.end method


# virtual methods
.method public onReceive(Landroid/content/Context;Landroid/content/Intent;)V
    .locals 1

    new-instance p1, Ljava/lang/StringBuilder;

    const-string v0, "ABUpdate:UEMonitorBroadcastReceiver:onReceive:action="

    invoke-direct {p1, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p2}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    const-string v0, "OtaApp"

    invoke-static {v0, p1}, Lcom/motorola/ccc/ota/utils/Logger;->debug(Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {p2}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/String;->hashCode()I

    const-string v0, "com.motorola.ccc.ota.INTENT_MAX_ALARM_FOR_UE"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_1

    const-string p0, "com.motorola.ccc.ota.ACTION_BATTERY_LOW"

    invoke-virtual {p1, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_0

    goto :goto_0

    :cond_0
    invoke-static {}, Lcom/motorola/ccc/ota/installer/updaterEngine/common/UpdaterEngineHelper;->cancelUpdateEngine()Z

    goto :goto_0

    :cond_1
    invoke-direct {p0, p2}, Lcom/motorola/ccc/ota/installer/updaterEngine/ABUpdate$ABUpdateBroadcastReceiver;->handleUEMaxTimerExpiry(Landroid/content/Intent;)V

    :goto_0
    return-void
.end method
