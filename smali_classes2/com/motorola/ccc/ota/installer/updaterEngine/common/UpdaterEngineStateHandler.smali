.class public Lcom/motorola/ccc/ota/installer/updaterEngine/common/UpdaterEngineStateHandler;
.super Ljava/lang/Object;
.source "UpdaterEngineStateHandler.java"


# static fields
.field private static UE:Lcom/motorola/ccc/ota/installer/updaterEngine/UpdaterEngineInstaller;

.field private static callBackInterface:Lcom/motorola/ccc/ota/installer/updaterEngine/common/CallBackInterface;

.field private static mUEStateHandler:Lcom/motorola/ccc/ota/installer/updaterEngine/common/UpdaterEngineStateHandler;

.field private static mUpdaterEngineCalllbacker:Lcom/motorola/ccc/ota/installer/updaterEngine/common/UpdateEngineCallbacker;

.field private static progress:Ljava/util/concurrent/atomic/AtomicBoolean;


# direct methods
.method private constructor <init>()V
    .locals 1

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance p0, Ljava/util/concurrent/atomic/AtomicBoolean;

    const/4 v0, 0x0

    invoke-direct {p0, v0}, Ljava/util/concurrent/atomic/AtomicBoolean;-><init>(Z)V

    sput-object p0, Lcom/motorola/ccc/ota/installer/updaterEngine/common/UpdaterEngineStateHandler;->progress:Ljava/util/concurrent/atomic/AtomicBoolean;

    return-void
.end method

.method public static getUpdaterEngineStateHandlerInstance()Lcom/motorola/ccc/ota/installer/updaterEngine/common/UpdaterEngineStateHandler;
    .locals 1

    sget-object v0, Lcom/motorola/ccc/ota/installer/updaterEngine/common/UpdaterEngineStateHandler;->mUEStateHandler:Lcom/motorola/ccc/ota/installer/updaterEngine/common/UpdaterEngineStateHandler;

    if-nez v0, :cond_0

    new-instance v0, Lcom/motorola/ccc/ota/installer/updaterEngine/common/UpdaterEngineStateHandler;

    invoke-direct {v0}, Lcom/motorola/ccc/ota/installer/updaterEngine/common/UpdaterEngineStateHandler;-><init>()V

    sput-object v0, Lcom/motorola/ccc/ota/installer/updaterEngine/common/UpdaterEngineStateHandler;->mUEStateHandler:Lcom/motorola/ccc/ota/installer/updaterEngine/common/UpdaterEngineStateHandler;

    :cond_0
    sget-object v0, Lcom/motorola/ccc/ota/installer/updaterEngine/common/UpdaterEngineStateHandler;->mUEStateHandler:Lcom/motorola/ccc/ota/installer/updaterEngine/common/UpdaterEngineStateHandler;

    return-object v0
.end method

.method public static isBusy()Z
    .locals 1

    sget-object v0, Lcom/motorola/ccc/ota/installer/updaterEngine/common/UpdaterEngineStateHandler;->progress:Ljava/util/concurrent/atomic/AtomicBoolean;

    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicBoolean;->get()Z

    move-result v0

    return v0
.end method

.method private static setProgress(Z)V
    .locals 1

    sget-object v0, Lcom/motorola/ccc/ota/installer/updaterEngine/common/UpdaterEngineStateHandler;->progress:Ljava/util/concurrent/atomic/AtomicBoolean;

    invoke-virtual {v0, p0}, Ljava/util/concurrent/atomic/AtomicBoolean;->set(Z)V

    return-void
.end method


# virtual methods
.method public clearUEStateHandler()V
    .locals 1

    const-string p0, "OtaApp"

    const-string v0, "Clearing updater engine status"

    invoke-static {p0, v0}, Lcom/motorola/ccc/ota/utils/Logger;->verbose(Ljava/lang/String;Ljava/lang/String;)V

    sget-object p0, Lcom/motorola/ccc/ota/installer/updaterEngine/common/UpdaterEngineStateHandler;->mUpdaterEngineCalllbacker:Lcom/motorola/ccc/ota/installer/updaterEngine/common/UpdateEngineCallbacker;

    if-eqz p0, :cond_0

    invoke-virtual {p0}, Lcom/motorola/ccc/ota/installer/updaterEngine/common/UpdateEngineCallbacker;->unRegisterForCallBacker()V

    :cond_0
    invoke-static {}, Lcom/motorola/ccc/ota/installer/updaterEngine/common/InstallerUtilMethods;->releaseWakelock()V

    const/4 p0, 0x0

    invoke-static {p0}, Lcom/motorola/ccc/ota/installer/updaterEngine/common/UpdaterEngineStateHandler;->setProgress(Z)V

    return-void
.end method

.method public initializeUpdaterEngineStateHandler(Lcom/motorola/ccc/ota/installer/updaterEngine/UpdaterEngineInstaller;Lcom/motorola/ccc/ota/installer/updaterEngine/common/CallBackInterface;)V
    .locals 0

    const/4 p0, 0x1

    invoke-static {p0}, Lcom/motorola/ccc/ota/installer/updaterEngine/common/UpdaterEngineStateHandler;->setProgress(Z)V

    sput-object p1, Lcom/motorola/ccc/ota/installer/updaterEngine/common/UpdaterEngineStateHandler;->UE:Lcom/motorola/ccc/ota/installer/updaterEngine/UpdaterEngineInstaller;

    sput-object p2, Lcom/motorola/ccc/ota/installer/updaterEngine/common/UpdaterEngineStateHandler;->callBackInterface:Lcom/motorola/ccc/ota/installer/updaterEngine/common/CallBackInterface;

    new-instance p0, Lcom/motorola/ccc/ota/installer/updaterEngine/common/UpdateEngineCallbacker;

    invoke-direct {p0}, Lcom/motorola/ccc/ota/installer/updaterEngine/common/UpdateEngineCallbacker;-><init>()V

    sput-object p0, Lcom/motorola/ccc/ota/installer/updaterEngine/common/UpdaterEngineStateHandler;->mUpdaterEngineCalllbacker:Lcom/motorola/ccc/ota/installer/updaterEngine/common/UpdateEngineCallbacker;

    invoke-virtual {p0, p2}, Lcom/motorola/ccc/ota/installer/updaterEngine/common/UpdateEngineCallbacker;->registerForCallBacker(Lcom/motorola/ccc/ota/installer/updaterEngine/common/CallBackInterface;)V

    return-void
.end method

.method public transferUpgradeBackToOta(Landroid/content/Context;ZLjava/lang/String;Ljava/lang/String;)V
    .locals 0

    invoke-static {p1, p2, p3, p4}, Lcom/motorola/ccc/ota/installer/updaterEngine/common/InstallerUtilMethods;->sendUpdaterEngineStatusCompleted(Landroid/content/Context;ZLjava/lang/String;Ljava/lang/String;)V

    sget-object p0, Lcom/motorola/ccc/ota/installer/updaterEngine/common/UpdaterEngineStateHandler;->UE:Lcom/motorola/ccc/ota/installer/updaterEngine/UpdaterEngineInstaller;

    invoke-virtual {p0}, Lcom/motorola/ccc/ota/installer/updaterEngine/UpdaterEngineInstaller;->clearUEInstallerBeforeExit()V

    return-void
.end method

.method public transferUpgradeToUE()V
    .locals 4

    :try_start_0
    invoke-static {}, Lcom/motorola/ccc/ota/installer/updaterEngine/common/UEBinder;->isBinded()Z

    move-result p0

    if-nez p0, :cond_0

    sget-object p0, Lcom/motorola/ccc/ota/installer/updaterEngine/common/UpdaterEngineStateHandler;->mUpdaterEngineCalllbacker:Lcom/motorola/ccc/ota/installer/updaterEngine/common/UpdateEngineCallbacker;

    invoke-static {p0}, Lcom/motorola/ccc/ota/installer/updaterEngine/common/UEBinder;->checkAndBindWithUE(Lcom/motorola/ccc/ota/installer/updaterEngine/common/UpdateEngineCallbacker;)V

    goto :goto_0

    :cond_0
    sget-object p0, Lcom/motorola/ccc/ota/installer/updaterEngine/common/UpdaterEngineStateHandler;->callBackInterface:Lcom/motorola/ccc/ota/installer/updaterEngine/common/CallBackInterface;

    const/4 v0, 0x0

    const/4 v1, 0x0

    invoke-interface {p0, v0, v1}, Lcom/motorola/ccc/ota/installer/updaterEngine/common/CallBackInterface;->onProgress(IF)V
    :try_end_0
    .catch Ljava/lang/NoSuchMethodException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/lang/ClassNotFoundException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/lang/IllegalAccessException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/lang/InstantiationException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/lang/reflect/InvocationTargetException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception p0

    sget-object v0, Lcom/motorola/ccc/ota/installer/updaterEngine/common/UpdaterEngineStateHandler;->callBackInterface:Lcom/motorola/ccc/ota/installer/updaterEngine/common/CallBackInterface;

    sget v1, Lcom/motorola/otalib/common/errorCodes/UpdaterEngineErrorCodes;->ERROR_EXCEPTION:I

    new-instance v2, Ljava/lang/StringBuilder;

    const-string v3, "Caught an exception during bind "

    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v2, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    const-string v2, "BIND_FAILURE."

    invoke-interface {v0, v1, p0, v2}, Lcom/motorola/ccc/ota/installer/updaterEngine/common/CallBackInterface;->onCompleted(ILjava/lang/String;Ljava/lang/String;)V

    :goto_0
    return-void
.end method
