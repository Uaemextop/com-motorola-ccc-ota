.class Lcom/motorola/ccc/ota/installer/updaterEngine/ABUpdate$UECallbackHandler;
.super Ljava/lang/Object;
.source "ABUpdate.java"

# interfaces
.implements Lcom/motorola/ccc/ota/installer/updaterEngine/common/CallBackInterface;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/motorola/ccc/ota/installer/updaterEngine/ABUpdate;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "UECallbackHandler"
.end annotation


# instance fields
.field final synthetic this$0:Lcom/motorola/ccc/ota/installer/updaterEngine/ABUpdate;


# direct methods
.method private constructor <init>(Lcom/motorola/ccc/ota/installer/updaterEngine/ABUpdate;)V
    .locals 0

    iput-object p1, p0, Lcom/motorola/ccc/ota/installer/updaterEngine/ABUpdate$UECallbackHandler;->this$0:Lcom/motorola/ccc/ota/installer/updaterEngine/ABUpdate;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method synthetic constructor <init>(Lcom/motorola/ccc/ota/installer/updaterEngine/ABUpdate;Lcom/motorola/ccc/ota/installer/updaterEngine/ABUpdate$UECallbackHandler-IA;)V
    .locals 0

    invoke-direct {p0, p1}, Lcom/motorola/ccc/ota/installer/updaterEngine/ABUpdate$UECallbackHandler;-><init>(Lcom/motorola/ccc/ota/installer/updaterEngine/ABUpdate;)V

    return-void
.end method

.method private declared-synchronized onApplyPayload()V
    .locals 9
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Ljava/lang/ClassNotFoundException;,
            Ljava/lang/InstantiationException;,
            Ljava/lang/IllegalAccessException;,
            Ljava/lang/NoSuchMethodException;,
            Ljava/lang/reflect/InvocationTargetException;
        }
    .end annotation

    monitor-enter p0

    :try_start_0
    iget-object v0, p0, Lcom/motorola/ccc/ota/installer/updaterEngine/ABUpdate$UECallbackHandler;->this$0:Lcom/motorola/ccc/ota/installer/updaterEngine/ABUpdate;

    iget-object v0, v0, Lcom/motorola/ccc/ota/installer/updaterEngine/ABUpdate;->_settings:Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    sget-object v1, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->VAB_MERGE_PROCESS_RUNNING:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->getBoolean(Lcom/motorola/otalib/common/settings/ISetting;Z)Z

    move-result v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    if-eqz v0, :cond_0

    monitor-exit p0

    return-void

    :cond_0
    :try_start_1
    invoke-static {}, Lcom/motorola/ccc/ota/installer/updaterEngine/UpdaterEngineInstaller;->getApplyPayloadStarted()Z

    move-result v0

    if-nez v0, :cond_2

    const/4 v0, 0x1

    invoke-static {v0}, Lcom/motorola/ccc/ota/installer/updaterEngine/UpdaterEngineInstaller;->setApplyPayloadStarted(Z)V

    invoke-static {}, Lcom/motorola/ccc/ota/utils/BuildPropReader;->isATT()Z

    move-result v0

    const/4 v1, 0x0

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/motorola/ccc/ota/installer/updaterEngine/ABUpdate$UECallbackHandler;->this$0:Lcom/motorola/ccc/ota/installer/updaterEngine/ABUpdate;

    iget-object v0, v0, Lcom/motorola/ccc/ota/installer/updaterEngine/ABUpdate;->_settings:Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    sget-object v3, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->BATTERY_LOW:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    invoke-virtual {v0, v3}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->getBoolean(Lcom/motorola/otalib/common/settings/ISetting;)Z

    move-result v0

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/motorola/ccc/ota/installer/updaterEngine/ABUpdate$UECallbackHandler;->this$0:Lcom/motorola/ccc/ota/installer/updaterEngine/ABUpdate;

    invoke-static {v0}, Lcom/motorola/ccc/ota/installer/updaterEngine/ABUpdate;->-$$Nest$fgetcontext(Lcom/motorola/ccc/ota/installer/updaterEngine/ABUpdate;)Landroid/content/Context;

    move-result-object v0

    iget-object v3, p0, Lcom/motorola/ccc/ota/installer/updaterEngine/ABUpdate$UECallbackHandler;->this$0:Lcom/motorola/ccc/ota/installer/updaterEngine/ABUpdate;

    iget-object v3, v3, Lcom/motorola/ccc/ota/installer/updaterEngine/ABUpdate;->_settings:Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    sget-object v4, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->STORED_AB_PROGRESS_PERCENT:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    invoke-virtual {v3, v4, v1}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->getFloat(Lcom/motorola/otalib/common/settings/ISetting;F)F

    move-result v1

    iget-object v3, p0, Lcom/motorola/ccc/ota/installer/updaterEngine/ABUpdate$UECallbackHandler;->this$0:Lcom/motorola/ccc/ota/installer/updaterEngine/ABUpdate;

    iget-object v3, v3, Lcom/motorola/ccc/ota/installer/updaterEngine/ABUpdate;->_settings:Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    sget-object v4, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->STORED_AB_STATUS:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    invoke-virtual {v3, v4, v2}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->getInt(Lcom/motorola/otalib/common/settings/ISetting;I)I

    move-result v2

    sget-object v3, Lcom/motorola/ccc/ota/installer/InstallTypeResolver$InstallerType;->AB:Lcom/motorola/ccc/ota/installer/InstallTypeResolver$InstallerType;

    const/4 v4, -0x1

    invoke-static {v0, v1, v2, v4, v3}, Lcom/motorola/ccc/ota/installer/updaterEngine/common/InstallerUtilMethods;->sendUpgradeStatus(Landroid/content/Context;FIILcom/motorola/ccc/ota/installer/InstallTypeResolver$InstallerType;)V

    iget-object v0, p0, Lcom/motorola/ccc/ota/installer/updaterEngine/ABUpdate$UECallbackHandler;->this$0:Lcom/motorola/ccc/ota/installer/updaterEngine/ABUpdate;

    invoke-virtual {v0}, Lcom/motorola/ccc/ota/installer/updaterEngine/ABUpdate;->clearUEInstallerBeforeExit()V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    monitor-exit p0

    return-void

    :cond_1
    :try_start_2
    invoke-static {}, Lcom/motorola/ccc/ota/installer/updaterEngine/common/InstallerUtilMethods;->getDownloadUrl()Ljava/lang/String;

    move-result-object v3

    invoke-static {}, Lcom/motorola/ccc/ota/installer/updaterEngine/common/InstallerUtilMethods;->getOffSetValue()J

    move-result-wide v4

    invoke-static {}, Lcom/motorola/ccc/ota/installer/updaterEngine/common/InstallerUtilMethods;->getHeaderKeyValuePair()[Ljava/lang/String;

    move-result-object v8

    const-wide/16 v6, 0x0

    invoke-static/range {v3 .. v8}, Lcom/motorola/ccc/ota/installer/updaterEngine/common/UpdaterEngineHelper;->applyPayload(Ljava/lang/String;JJ[Ljava/lang/String;)V

    invoke-static {}, Lcom/motorola/ccc/ota/env/OtaApplication;->getGlobalContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0}, Lcom/motorola/ccc/ota/installer/updaterEngine/common/InstallerUtilMethods;->sendActionABApplyPayloadStarted(Landroid/content/Context;)V

    invoke-static {}, Lcom/motorola/ccc/ota/installer/updaterEngine/common/InstallerUtilMethods;->acquireWakeLock()V

    iget-object v0, p0, Lcom/motorola/ccc/ota/installer/updaterEngine/ABUpdate$UECallbackHandler;->this$0:Lcom/motorola/ccc/ota/installer/updaterEngine/ABUpdate;

    invoke-virtual {v0, v2, v1}, Lcom/motorola/ccc/ota/installer/updaterEngine/ABUpdate;->setExpiryAlarmForUE(IF)V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    :cond_2
    monitor-exit p0

    return-void

    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method


# virtual methods
.method public onCompleted(ILjava/lang/String;Ljava/lang/String;)V
    .locals 4

    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "ABUpdate:onCompleted: errorcode "

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, " Reason "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    const-string v1, "OtaApp"

    invoke-static {v1, v0}, Lcom/motorola/ccc/ota/utils/Logger;->debug(Ljava/lang/String;Ljava/lang/String;)V

    sget v0, Lcom/motorola/otalib/common/errorCodes/UpdaterEngineErrorCodes;->K_SUCCESS:I

    if-ne p1, v0, :cond_0

    sget-object p1, Lcom/motorola/ccc/ota/installer/updaterEngine/UpdaterEngineInstaller;->updaterEngineStateHandler:Lcom/motorola/ccc/ota/installer/updaterEngine/common/UpdaterEngineStateHandler;

    invoke-static {}, Lcom/motorola/ccc/ota/env/OtaApplication;->getGlobalContext()Landroid/content/Context;

    move-result-object v0

    const/4 v1, 0x1

    invoke-virtual {p1, v0, v1, p2, p3}, Lcom/motorola/ccc/ota/installer/updaterEngine/common/UpdaterEngineStateHandler;->transferUpgradeBackToOta(Landroid/content/Context;ZLjava/lang/String;Ljava/lang/String;)V

    goto/16 :goto_0

    :cond_0
    sget v0, Lcom/motorola/otalib/common/errorCodes/UpdaterEngineErrorCodes;->K_DOWNLOAD_OPERATION_EXECUTION_ERROR:I

    const/4 v1, 0x0

    if-ne p1, v0, :cond_2

    iget-object p1, p0, Lcom/motorola/ccc/ota/installer/updaterEngine/ABUpdate$UECallbackHandler;->this$0:Lcom/motorola/ccc/ota/installer/updaterEngine/ABUpdate;

    iget-object p1, p1, Lcom/motorola/ccc/ota/installer/updaterEngine/ABUpdate;->_db:Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database;

    iget-object v0, p0, Lcom/motorola/ccc/ota/installer/updaterEngine/ABUpdate$UECallbackHandler;->this$0:Lcom/motorola/ccc/ota/installer/updaterEngine/ABUpdate;

    iget-object v0, v0, Lcom/motorola/ccc/ota/installer/updaterEngine/ABUpdate;->mVersion:Ljava/lang/String;

    invoke-interface {p1, v0}, Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database;->getDescription(Ljava/lang/String;)Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database$Descriptor;

    move-result-object p1

    if-eqz p1, :cond_1

    iget-object v0, p0, Lcom/motorola/ccc/ota/installer/updaterEngine/ABUpdate$UECallbackHandler;->this$0:Lcom/motorola/ccc/ota/installer/updaterEngine/ABUpdate;

    iget-object v0, v0, Lcom/motorola/ccc/ota/installer/updaterEngine/ABUpdate;->_env:Lcom/motorola/otalib/common/Environment/ApplicationEnv;

    iget-object v2, p0, Lcom/motorola/ccc/ota/installer/updaterEngine/ABUpdate$UECallbackHandler;->this$0:Lcom/motorola/ccc/ota/installer/updaterEngine/ABUpdate;

    iget-object v2, v2, Lcom/motorola/ccc/ota/installer/updaterEngine/ABUpdate;->_settings:Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    invoke-static {v0, v2, p1}, Lcom/motorola/ccc/ota/installer/updaterEngine/common/InstallerUtilMethods;->isMemoryLowForBackgroundInstallation(Lcom/motorola/otalib/common/Environment/ApplicationEnv;Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database$Descriptor;)Z

    move-result p1

    if-eqz p1, :cond_1

    new-instance p1, Landroid/content/Intent;

    const-string p2, "com.motorola.ccc.ota.RUN_STATE_MACHINE"

    invoke-direct {p1, p2}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    invoke-static {}, Lcom/motorola/ccc/ota/env/OtaApplication;->getGlobalContext()Landroid/content/Context;

    move-result-object p2

    const-string p3, "com.motorola.ccc.ota.Permissions.INTERACT_OTA_SERVICE"

    invoke-virtual {p2, p1, p3}, Landroid/content/Context;->sendBroadcast(Landroid/content/Intent;Ljava/lang/String;)V

    iget-object p0, p0, Lcom/motorola/ccc/ota/installer/updaterEngine/ABUpdate$UECallbackHandler;->this$0:Lcom/motorola/ccc/ota/installer/updaterEngine/ABUpdate;

    invoke-virtual {p0}, Lcom/motorola/ccc/ota/installer/updaterEngine/ABUpdate;->clearUEInstallerBeforeExit()V

    return-void

    :cond_1
    sget-object p1, Lcom/motorola/ccc/ota/installer/updaterEngine/UpdaterEngineInstaller;->updaterEngineStateHandler:Lcom/motorola/ccc/ota/installer/updaterEngine/common/UpdaterEngineStateHandler;

    invoke-static {}, Lcom/motorola/ccc/ota/env/OtaApplication;->getGlobalContext()Landroid/content/Context;

    move-result-object v0

    invoke-virtual {p1, v0, v1, p2, p3}, Lcom/motorola/ccc/ota/installer/updaterEngine/common/UpdaterEngineStateHandler;->transferUpgradeBackToOta(Landroid/content/Context;ZLjava/lang/String;Ljava/lang/String;)V

    invoke-static {}, Lcom/motorola/ccc/ota/installer/updaterEngine/common/UpdaterEngineHelper;->resetUpdateEngine()V

    goto/16 :goto_0

    :cond_2
    sget v0, Lcom/motorola/otalib/common/errorCodes/UpdaterEngineErrorCodes;->K_USER_CANCELED:I

    if-ne p1, v0, :cond_5

    sget-object p1, Lcom/motorola/ccc/ota/installer/updaterEngine/common/InstallerUtilMethods$InstallerErrorStatus;->STATUS_USER_CANCEL:Lcom/motorola/ccc/ota/installer/updaterEngine/common/InstallerUtilMethods$InstallerErrorStatus;

    invoke-static {}, Lcom/motorola/ccc/ota/installer/updaterEngine/ABUpdate;->-$$Nest$sfgetmInstallerStatus()Lcom/motorola/ccc/ota/installer/updaterEngine/common/InstallerUtilMethods$InstallerErrorStatus;

    move-result-object p2

    if-ne p1, p2, :cond_3

    iget-object p1, p0, Lcom/motorola/ccc/ota/installer/updaterEngine/ABUpdate$UECallbackHandler;->this$0:Lcom/motorola/ccc/ota/installer/updaterEngine/ABUpdate;

    invoke-static {p1}, Lcom/motorola/ccc/ota/installer/updaterEngine/ABUpdate;->-$$Nest$fgetcontext(Lcom/motorola/ccc/ota/installer/updaterEngine/ABUpdate;)Landroid/content/Context;

    move-result-object p1

    invoke-static {p1}, Lcom/motorola/ccc/ota/installer/updaterEngine/common/InstallerUtilMethods;->sendCancelBackgroundInstallationResponse(Landroid/content/Context;)V

    iget-object p1, p0, Lcom/motorola/ccc/ota/installer/updaterEngine/ABUpdate$UECallbackHandler;->this$0:Lcom/motorola/ccc/ota/installer/updaterEngine/ABUpdate;

    invoke-virtual {p1}, Lcom/motorola/ccc/ota/installer/updaterEngine/ABUpdate;->clearUEInstallerBeforeExit()V

    goto/16 :goto_0

    :cond_3
    sget-object p1, Lcom/motorola/ccc/ota/installer/updaterEngine/common/InstallerUtilMethods$InstallerErrorStatus;->STATUS_UE_NOT_RESPONDING:Lcom/motorola/ccc/ota/installer/updaterEngine/common/InstallerUtilMethods$InstallerErrorStatus;

    invoke-static {}, Lcom/motorola/ccc/ota/installer/updaterEngine/ABUpdate;->-$$Nest$sfgetmInstallerStatus()Lcom/motorola/ccc/ota/installer/updaterEngine/common/InstallerUtilMethods$InstallerErrorStatus;

    move-result-object p2

    const/4 p3, 0x0

    if-ne p1, p2, :cond_4

    sget-object p1, Lcom/motorola/ccc/ota/installer/updaterEngine/UpdaterEngineInstaller;->updaterEngineStateHandler:Lcom/motorola/ccc/ota/installer/updaterEngine/common/UpdaterEngineStateHandler;

    invoke-static {}, Lcom/motorola/ccc/ota/env/OtaApplication;->getGlobalContext()Landroid/content/Context;

    move-result-object p2

    new-instance v0, Ljava/lang/StringBuilder;

    const-string v2, "Updater engine is not responding at , status "

    invoke-direct {v0, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v2, p0, Lcom/motorola/ccc/ota/installer/updaterEngine/ABUpdate$UECallbackHandler;->this$0:Lcom/motorola/ccc/ota/installer/updaterEngine/ABUpdate;

    iget-object v2, v2, Lcom/motorola/ccc/ota/installer/updaterEngine/ABUpdate;->_settings:Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    sget-object v3, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->STORED_AB_STATUS:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    invoke-virtual {v2, v3, v1}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->getInt(Lcom/motorola/otalib/common/settings/ISetting;I)I

    move-result v2

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v2, " percentage "

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v2, p0, Lcom/motorola/ccc/ota/installer/updaterEngine/ABUpdate$UECallbackHandler;->this$0:Lcom/motorola/ccc/ota/installer/updaterEngine/ABUpdate;

    iget-object v2, v2, Lcom/motorola/ccc/ota/installer/updaterEngine/ABUpdate;->_settings:Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    sget-object v3, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->STORED_AB_PROGRESS_PERCENT:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    invoke-virtual {v2, v3, p3}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->getFloat(Lcom/motorola/otalib/common/settings/ISetting;F)F

    move-result p3

    invoke-virtual {v0, p3}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    move-result-object p3

    const-string v0, " "

    invoke-virtual {p3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p3

    invoke-virtual {p3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p3

    const-string v0, "UE_NOT_RESPONDING."

    invoke-virtual {p1, p2, v1, p3, v0}, Lcom/motorola/ccc/ota/installer/updaterEngine/common/UpdaterEngineStateHandler;->transferUpgradeBackToOta(Landroid/content/Context;ZLjava/lang/String;Ljava/lang/String;)V

    goto :goto_0

    :cond_4
    iget-object p1, p0, Lcom/motorola/ccc/ota/installer/updaterEngine/ABUpdate$UECallbackHandler;->this$0:Lcom/motorola/ccc/ota/installer/updaterEngine/ABUpdate;

    invoke-virtual {p1}, Lcom/motorola/ccc/ota/installer/updaterEngine/ABUpdate;->clearUEInstallerBeforeExit()V

    invoke-static {}, Lcom/motorola/ccc/ota/utils/BuildPropReader;->isATT()Z

    move-result p1

    if-eqz p1, :cond_6

    iget-object p1, p0, Lcom/motorola/ccc/ota/installer/updaterEngine/ABUpdate$UECallbackHandler;->this$0:Lcom/motorola/ccc/ota/installer/updaterEngine/ABUpdate;

    iget-object p1, p1, Lcom/motorola/ccc/ota/installer/updaterEngine/ABUpdate;->_settings:Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    sget-object p2, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->BATTERY_LOW:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    invoke-virtual {p1, p2}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->getBoolean(Lcom/motorola/otalib/common/settings/ISetting;)Z

    move-result p1

    if-eqz p1, :cond_6

    iget-object p1, p0, Lcom/motorola/ccc/ota/installer/updaterEngine/ABUpdate$UECallbackHandler;->this$0:Lcom/motorola/ccc/ota/installer/updaterEngine/ABUpdate;

    invoke-static {p1}, Lcom/motorola/ccc/ota/installer/updaterEngine/ABUpdate;->-$$Nest$fgetcontext(Lcom/motorola/ccc/ota/installer/updaterEngine/ABUpdate;)Landroid/content/Context;

    move-result-object p1

    iget-object p2, p0, Lcom/motorola/ccc/ota/installer/updaterEngine/ABUpdate$UECallbackHandler;->this$0:Lcom/motorola/ccc/ota/installer/updaterEngine/ABUpdate;

    iget-object p2, p2, Lcom/motorola/ccc/ota/installer/updaterEngine/ABUpdate;->_settings:Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    sget-object v0, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->STORED_AB_PROGRESS_PERCENT:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    invoke-virtual {p2, v0, p3}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->getFloat(Lcom/motorola/otalib/common/settings/ISetting;F)F

    move-result p2

    iget-object p0, p0, Lcom/motorola/ccc/ota/installer/updaterEngine/ABUpdate$UECallbackHandler;->this$0:Lcom/motorola/ccc/ota/installer/updaterEngine/ABUpdate;

    iget-object p0, p0, Lcom/motorola/ccc/ota/installer/updaterEngine/ABUpdate;->_settings:Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    sget-object p3, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->STORED_AB_STATUS:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    invoke-virtual {p0, p3, v1}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->getInt(Lcom/motorola/otalib/common/settings/ISetting;I)I

    move-result p0

    const/4 p3, -0x1

    sget-object v0, Lcom/motorola/ccc/ota/installer/InstallTypeResolver$InstallerType;->AB:Lcom/motorola/ccc/ota/installer/InstallTypeResolver$InstallerType;

    invoke-static {p1, p2, p0, p3, v0}, Lcom/motorola/ccc/ota/installer/updaterEngine/common/InstallerUtilMethods;->sendUpgradeStatus(Landroid/content/Context;FIILcom/motorola/ccc/ota/installer/InstallTypeResolver$InstallerType;)V

    return-void

    :cond_5
    sget-object p1, Lcom/motorola/ccc/ota/installer/updaterEngine/UpdaterEngineInstaller;->updaterEngineStateHandler:Lcom/motorola/ccc/ota/installer/updaterEngine/common/UpdaterEngineStateHandler;

    invoke-static {}, Lcom/motorola/ccc/ota/env/OtaApplication;->getGlobalContext()Landroid/content/Context;

    move-result-object v0

    invoke-virtual {p1, v0, v1, p2, p3}, Lcom/motorola/ccc/ota/installer/updaterEngine/common/UpdaterEngineStateHandler;->transferUpgradeBackToOta(Landroid/content/Context;ZLjava/lang/String;Ljava/lang/String;)V

    invoke-static {}, Lcom/motorola/ccc/ota/installer/updaterEngine/common/UpdaterEngineHelper;->resetUpdateEngine()V

    :cond_6
    :goto_0
    iget-object p0, p0, Lcom/motorola/ccc/ota/installer/updaterEngine/ABUpdate$UECallbackHandler;->this$0:Lcom/motorola/ccc/ota/installer/updaterEngine/ABUpdate;

    iget-object p0, p0, Lcom/motorola/ccc/ota/installer/updaterEngine/ABUpdate;->_settings:Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    sget-object p1, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->STORED_AB_PROGRESS_PERCENT:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    const/high16 p2, -0x40800000    # -1.0f

    invoke-virtual {p0, p1, p2}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->setFloat(Lcom/motorola/otalib/common/settings/ISetting;F)V

    return-void
.end method

.method public onProgress(IF)V
    .locals 5

    const-string v0, "APPLY_FAILURE."

    const-string v1, "OtaApp"

    const/4 v2, 0x0

    const/4 v3, 0x0

    if-nez p1, :cond_1

    :try_start_0
    invoke-direct {p0}, Lcom/motorola/ccc/ota/installer/updaterEngine/ABUpdate$UECallbackHandler;->onApplyPayload()V
    :try_end_0
    .catch Ljava/lang/reflect/InvocationTargetException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/lang/ClassNotFoundException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/lang/InstantiationException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/lang/IllegalAccessException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/lang/NoSuchMethodException; {:try_start_0 .. :try_end_0} :catch_0

    goto/16 :goto_0

    :catch_0
    move-exception p1

    new-instance p2, Ljava/lang/StringBuilder;

    const-string v2, "Caught an exception during apply payload: "

    invoke-direct {p2, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object p2

    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    invoke-static {v1, p2}, Lcom/motorola/ccc/ota/utils/Logger;->error(Ljava/lang/String;Ljava/lang/String;)V

    sget p2, Lcom/motorola/otalib/common/errorCodes/UpdaterEngineErrorCodes;->ERROR_EXCEPTION:I

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "Caught an exception during apply payload "

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p0, p2, p1, v0}, Lcom/motorola/ccc/ota/installer/updaterEngine/ABUpdate$UECallbackHandler;->onCompleted(ILjava/lang/String;Ljava/lang/String;)V

    goto :goto_0

    :catch_1
    move-exception p1

    new-instance p2, Ljava/lang/StringBuilder;

    const-string v4, "Exception in ABUpdate: onProgress: "

    invoke-direct {p2, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object p2

    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    invoke-static {v1, p2}, Lcom/motorola/ccc/ota/utils/Logger;->error(Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {p1}, Ljava/lang/reflect/InvocationTargetException;->getCause()Ljava/lang/Throwable;

    move-result-object p2

    if-eqz p2, :cond_0

    invoke-virtual {p1}, Ljava/lang/reflect/InvocationTargetException;->getCause()Ljava/lang/Throwable;

    move-result-object p2

    invoke-virtual {p2}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    move-result-object p2

    if-eqz p2, :cond_0

    invoke-virtual {p1}, Ljava/lang/reflect/InvocationTargetException;->getCause()Ljava/lang/Throwable;

    move-result-object p2

    invoke-virtual {p2}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    move-result-object p2

    const-string v4, "waiting for reboot"

    invoke-virtual {p2, v4}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result p2

    if-eqz p2, :cond_0

    new-instance p2, Ljava/lang/StringBuilder;

    const-string v0, "Exception cause is "

    invoke-direct {p2, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p1}, Ljava/lang/reflect/InvocationTargetException;->getCause()Ljava/lang/Throwable;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {v1, p1}, Lcom/motorola/ccc/ota/utils/Logger;->debug(Ljava/lang/String;Ljava/lang/String;)V

    invoke-static {v3}, Lcom/motorola/otalib/common/errorCodes/UpdaterEngineErrorCodes;->getFailureResultStatus(I)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p0, v3, v2, p1}, Lcom/motorola/ccc/ota/installer/updaterEngine/ABUpdate$UECallbackHandler;->onCompleted(ILjava/lang/String;Ljava/lang/String;)V

    goto :goto_0

    :cond_0
    sget p2, Lcom/motorola/otalib/common/errorCodes/UpdaterEngineErrorCodes;->ERROR_EXCEPTION:I

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "Caught an exception duringapply payload "

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p0, p2, p1, v0}, Lcom/motorola/ccc/ota/installer/updaterEngine/ABUpdate$UECallbackHandler;->onCompleted(ILjava/lang/String;Ljava/lang/String;)V

    :goto_0
    return-void

    :cond_1
    const/4 v0, 0x6

    if-ne p1, v0, :cond_2

    invoke-static {}, Lcom/motorola/ccc/ota/installer/updaterEngine/UpdaterEngineInstaller;->getApplyPayloadStarted()Z

    move-result v0

    if-nez v0, :cond_2

    sget p1, Lcom/motorola/otalib/common/errorCodes/UpdaterEngineErrorCodes;->K_SUCCESS:I

    sget p2, Lcom/motorola/otalib/common/errorCodes/UpdaterEngineErrorCodes;->K_SUCCESS:I

    invoke-static {p2}, Lcom/motorola/otalib/common/errorCodes/UpdaterEngineErrorCodes;->getFailureResultStatus(I)Ljava/lang/String;

    move-result-object p2

    invoke-virtual {p0, p1, v2, p2}, Lcom/motorola/ccc/ota/installer/updaterEngine/ABUpdate$UECallbackHandler;->onCompleted(ILjava/lang/String;Ljava/lang/String;)V

    return-void

    :cond_2
    const/4 v0, 0x1

    invoke-static {v0}, Lcom/motorola/ccc/ota/installer/updaterEngine/UpdaterEngineInstaller;->setApplyPayloadStarted(Z)V

    const/high16 v0, 0x42c80000    # 100.0f

    mul-float/2addr p2, v0

    iget-object v0, p0, Lcom/motorola/ccc/ota/installer/updaterEngine/ABUpdate$UECallbackHandler;->this$0:Lcom/motorola/ccc/ota/installer/updaterEngine/ABUpdate;

    iget-object v0, v0, Lcom/motorola/ccc/ota/installer/updaterEngine/ABUpdate;->_db:Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database;

    iget-object v1, p0, Lcom/motorola/ccc/ota/installer/updaterEngine/ABUpdate$UECallbackHandler;->this$0:Lcom/motorola/ccc/ota/installer/updaterEngine/ABUpdate;

    iget-object v1, v1, Lcom/motorola/ccc/ota/installer/updaterEngine/ABUpdate;->mVersion:Ljava/lang/String;

    invoke-interface {v0, v1}, Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database;->getDescription(Ljava/lang/String;)Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database$Descriptor;

    move-result-object v0

    if-eqz v0, :cond_5

    invoke-interface {v0}, Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database$Descriptor;->getMeta()Lcom/motorola/otalib/common/metaData/MetaData;

    move-result-object v1

    if-eqz v1, :cond_5

    invoke-interface {v0}, Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database$Descriptor;->getMeta()Lcom/motorola/otalib/common/metaData/MetaData;

    move-result-object v0

    invoke-virtual {v0}, Lcom/motorola/otalib/common/metaData/MetaData;->showDownloadProgress()Z

    move-result v0

    if-eqz v0, :cond_4

    iget-object v0, p0, Lcom/motorola/ccc/ota/installer/updaterEngine/ABUpdate$UECallbackHandler;->this$0:Lcom/motorola/ccc/ota/installer/updaterEngine/ABUpdate;

    iget-object v0, v0, Lcom/motorola/ccc/ota/installer/updaterEngine/ABUpdate;->_settings:Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    sget-object v1, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->STORED_AB_PROGRESS_PERCENT:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->getFloat(Lcom/motorola/otalib/common/settings/ISetting;F)F

    move-result v0

    cmpl-float v0, p2, v0

    if-gtz v0, :cond_3

    cmpl-float v0, p2, v2

    if-nez v0, :cond_4

    :cond_3
    invoke-static {}, Lcom/motorola/ccc/ota/env/OtaApplication;->getGlobalContext()Landroid/content/Context;

    move-result-object v0

    sget-object v1, Lcom/motorola/ccc/ota/installer/InstallTypeResolver$InstallerType;->AB:Lcom/motorola/ccc/ota/installer/InstallTypeResolver$InstallerType;

    invoke-static {v0, p2, p1, v3, v1}, Lcom/motorola/ccc/ota/installer/updaterEngine/common/InstallerUtilMethods;->sendUpgradeStatus(Landroid/content/Context;FIILcom/motorola/ccc/ota/installer/InstallTypeResolver$InstallerType;)V

    :cond_4
    iget-object v0, p0, Lcom/motorola/ccc/ota/installer/updaterEngine/ABUpdate$UECallbackHandler;->this$0:Lcom/motorola/ccc/ota/installer/updaterEngine/ABUpdate;

    iget-object v0, v0, Lcom/motorola/ccc/ota/installer/updaterEngine/ABUpdate;->_settings:Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    sget-object v1, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->STORED_AB_PROGRESS_PERCENT:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    invoke-virtual {v0, v1, p2}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->setFloat(Lcom/motorola/otalib/common/settings/ISetting;F)V

    iget-object p0, p0, Lcom/motorola/ccc/ota/installer/updaterEngine/ABUpdate$UECallbackHandler;->this$0:Lcom/motorola/ccc/ota/installer/updaterEngine/ABUpdate;

    iget-object p0, p0, Lcom/motorola/ccc/ota/installer/updaterEngine/ABUpdate;->_settings:Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    sget-object p2, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->STORED_AB_STATUS:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    invoke-virtual {p0, p2, p1}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->setInt(Lcom/motorola/otalib/common/settings/ISetting;I)V

    :cond_5
    return-void
.end method
