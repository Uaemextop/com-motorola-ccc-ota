.class public Lcom/motorola/ccc/ota/installer/updaterEngine/common/UpdateEngineCallbacker;
.super Landroid/os/UpdateEngineCallback;
.source "UpdateEngineCallbacker.java"


# static fields
.field private static mCallbackHandler:Lcom/motorola/ccc/ota/installer/updaterEngine/common/CallBackInterface;


# instance fields
.field private settings:Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;


# direct methods
.method public constructor <init>()V
    .locals 0

    invoke-direct {p0}, Landroid/os/UpdateEngineCallback;-><init>()V

    return-void
.end method


# virtual methods
.method public onPayloadApplicationComplete(I)V
    .locals 2

    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "onPayloadApplicationComplete : errorCode "

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    const-string v1, "OtaApp"

    invoke-static {v1, v0}, Lcom/motorola/ccc/ota/utils/Logger;->debug(Ljava/lang/String;Ljava/lang/String;)V

    iget-object p0, p0, Lcom/motorola/ccc/ota/installer/updaterEngine/common/UpdateEngineCallbacker;->settings:Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    sget-object v0, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->VAB_MERGE_PROCESS_RUNNING:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    const/4 v1, 0x0

    invoke-virtual {p0, v0, v1}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->getBoolean(Lcom/motorola/otalib/common/settings/ISetting;Z)Z

    move-result p0

    sget-object v0, Lcom/motorola/ccc/ota/installer/updaterEngine/common/UpdateEngineCallbacker;->mCallbackHandler:Lcom/motorola/ccc/ota/installer/updaterEngine/common/CallBackInterface;

    if-eqz v0, :cond_0

    if-nez p0, :cond_0

    const/4 p0, 0x0

    invoke-static {p1}, Lcom/motorola/otalib/common/errorCodes/UpdaterEngineErrorCodes;->getFailureResultStatus(I)Ljava/lang/String;

    move-result-object v1

    invoke-interface {v0, p1, p0, v1}, Lcom/motorola/ccc/ota/installer/updaterEngine/common/CallBackInterface;->onCompleted(ILjava/lang/String;Ljava/lang/String;)V

    :cond_0
    return-void
.end method

.method public onStatusUpdate(IF)V
    .locals 2

    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "UpdateEngineCallbackImplementation: StatusUpdate "

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, " percentage "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    const-string v1, "OtaApp"

    invoke-static {v1, v0}, Lcom/motorola/ccc/ota/utils/Logger;->debug(Ljava/lang/String;Ljava/lang/String;)V

    iget-object p0, p0, Lcom/motorola/ccc/ota/installer/updaterEngine/common/UpdateEngineCallbacker;->settings:Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    sget-object v0, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->VAB_MERGE_PROCESS_RUNNING:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    const/4 v1, 0x0

    invoke-virtual {p0, v0, v1}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->getBoolean(Lcom/motorola/otalib/common/settings/ISetting;Z)Z

    move-result p0

    if-eqz p0, :cond_0

    if-nez p1, :cond_0

    invoke-static {}, Lcom/motorola/ccc/ota/installer/updaterEngine/common/UpdaterEngineHelper;->cleanupAppliedPayload()V

    :cond_0
    sget-object p0, Lcom/motorola/ccc/ota/installer/updaterEngine/common/UpdateEngineCallbacker;->mCallbackHandler:Lcom/motorola/ccc/ota/installer/updaterEngine/common/CallBackInterface;

    if-eqz p0, :cond_1

    const/16 v0, 0xb

    if-eq p1, v0, :cond_1

    invoke-interface {p0, p1, p2}, Lcom/motorola/ccc/ota/installer/updaterEngine/common/CallBackInterface;->onProgress(IF)V

    :cond_1
    return-void
.end method

.method public registerForCallBacker(Lcom/motorola/ccc/ota/installer/updaterEngine/common/CallBackInterface;)V
    .locals 2

    const-string v0, "OtaApp"

    const-string v1, "Registering callback for updater engine"

    invoke-static {v0, v1}, Lcom/motorola/ccc/ota/utils/Logger;->verbose(Ljava/lang/String;Ljava/lang/String;)V

    sput-object p1, Lcom/motorola/ccc/ota/installer/updaterEngine/common/UpdateEngineCallbacker;->mCallbackHandler:Lcom/motorola/ccc/ota/installer/updaterEngine/common/CallBackInterface;

    new-instance p1, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    invoke-direct {p1}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;-><init>()V

    iput-object p1, p0, Lcom/motorola/ccc/ota/installer/updaterEngine/common/UpdateEngineCallbacker;->settings:Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    return-void
.end method

.method public unRegisterForCallBacker()V
    .locals 1

    const-string p0, "OtaApp"

    const-string v0, "UnRegistering callback from updater engine"

    invoke-static {p0, v0}, Lcom/motorola/ccc/ota/utils/Logger;->verbose(Ljava/lang/String;Ljava/lang/String;)V

    const/4 p0, 0x0

    sput-object p0, Lcom/motorola/ccc/ota/installer/updaterEngine/common/UpdateEngineCallbacker;->mCallbackHandler:Lcom/motorola/ccc/ota/installer/updaterEngine/common/CallBackInterface;

    return-void
.end method
