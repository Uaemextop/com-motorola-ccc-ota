.class public Lcom/motorola/ccc/ota/env/ForceUpgradeManager;
.super Ljava/lang/Object;
.source "ForceUpgradeManager.java"


# static fields
.field private static final APP_NAME_POLLING_MANAGER:I = 0x3

.field private static final APP_SECRET_POLLING_MANAGER:Ljava/lang/String; = "regANAmedARGPuecROF"

.field public static final INTENT_ACTION_POLLING_MANAGER:Ljava/lang/String; = "com.motorola.ccc.ota.ForceUpgradeManager.pollingManagerIntent"


# instance fields
.field private ctx:Landroid/content/Context;

.field protected mConnection:Landroid/content/ServiceConnection;

.field private mForceUpgradeTime:I

.field private mIsBound:Z

.field private pollingManager:Lcom/motorola/ccc/ota/aidl/IPollingManagerService;


# direct methods
.method static bridge synthetic -$$Nest$fputmIsBound(Lcom/motorola/ccc/ota/env/ForceUpgradeManager;Z)V
    .locals 0

    iput-boolean p1, p0, Lcom/motorola/ccc/ota/env/ForceUpgradeManager;->mIsBound:Z

    return-void
.end method

.method static bridge synthetic -$$Nest$fputpollingManager(Lcom/motorola/ccc/ota/env/ForceUpgradeManager;Lcom/motorola/ccc/ota/aidl/IPollingManagerService;)V
    .locals 0

    iput-object p1, p0, Lcom/motorola/ccc/ota/env/ForceUpgradeManager;->pollingManager:Lcom/motorola/ccc/ota/aidl/IPollingManagerService;

    return-void
.end method

.method static bridge synthetic -$$Nest$mregisterApp(Lcom/motorola/ccc/ota/env/ForceUpgradeManager;)V
    .locals 0

    invoke-direct {p0}, Lcom/motorola/ccc/ota/env/ForceUpgradeManager;->registerApp()V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;)V
    .locals 1

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/motorola/ccc/ota/env/ForceUpgradeManager;->mIsBound:Z

    new-instance v0, Lcom/motorola/ccc/ota/env/ForceUpgradeManager$1;

    invoke-direct {v0, p0}, Lcom/motorola/ccc/ota/env/ForceUpgradeManager$1;-><init>(Lcom/motorola/ccc/ota/env/ForceUpgradeManager;)V

    iput-object v0, p0, Lcom/motorola/ccc/ota/env/ForceUpgradeManager;->mConnection:Landroid/content/ServiceConnection;

    iput-object p1, p0, Lcom/motorola/ccc/ota/env/ForceUpgradeManager;->ctx:Landroid/content/Context;

    return-void
.end method

.method private doBindService()V
    .locals 4

    iget-boolean v0, p0, Lcom/motorola/ccc/ota/env/ForceUpgradeManager;->mIsBound:Z

    if-nez v0, :cond_0

    const-string v0, "OtaApp"

    const-string v1, "ForceUpgradeManager, binding to PollingManager Service"

    invoke-static {v0, v1}, Lcom/motorola/ccc/ota/utils/Logger;->debug(Ljava/lang/String;Ljava/lang/String;)V

    iget-object v0, p0, Lcom/motorola/ccc/ota/env/ForceUpgradeManager;->ctx:Landroid/content/Context;

    new-instance v1, Landroid/content/Intent;

    iget-object v2, p0, Lcom/motorola/ccc/ota/env/ForceUpgradeManager;->ctx:Landroid/content/Context;

    const-class v3, Lcom/motorola/ccc/ota/env/OtaService;

    invoke-direct {v1, v2, v3}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    iget-object v2, p0, Lcom/motorola/ccc/ota/env/ForceUpgradeManager;->mConnection:Landroid/content/ServiceConnection;

    const/4 v3, 0x1

    invoke-virtual {v0, v1, v2, v3}, Landroid/content/Context;->bindService(Landroid/content/Intent;Landroid/content/ServiceConnection;I)Z

    iput-boolean v3, p0, Lcom/motorola/ccc/ota/env/ForceUpgradeManager;->mIsBound:Z

    :cond_0
    return-void
.end method

.method private doUnbindService()V
    .locals 3

    iget-boolean v0, p0, Lcom/motorola/ccc/ota/env/ForceUpgradeManager;->mIsBound:Z

    if-eqz v0, :cond_0

    :try_start_0
    invoke-direct {p0}, Lcom/motorola/ccc/ota/env/ForceUpgradeManager;->unRegisterApp()I
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception v0

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "Exception in ForceUpgradeManager: doUnbindService: "

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    const-string v1, "OtaApp"

    invoke-static {v1, v0}, Lcom/motorola/ccc/ota/utils/Logger;->error(Ljava/lang/String;Ljava/lang/String;)V

    :goto_0
    iget-object v0, p0, Lcom/motorola/ccc/ota/env/ForceUpgradeManager;->ctx:Landroid/content/Context;

    iget-object v1, p0, Lcom/motorola/ccc/ota/env/ForceUpgradeManager;->mConnection:Landroid/content/ServiceConnection;

    invoke-virtual {v0, v1}, Landroid/content/Context;->unbindService(Landroid/content/ServiceConnection;)V

    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/motorola/ccc/ota/env/ForceUpgradeManager;->mIsBound:Z

    :cond_0
    return-void
.end method

.method private getForceUpgradetime()J
    .locals 4

    iget p0, p0, Lcom/motorola/ccc/ota/env/ForceUpgradeManager;->mForceUpgradeTime:I

    int-to-long v0, p0

    const-wide/16 v2, 0x3e8

    mul-long/2addr v0, v2

    return-wide v0
.end method

.method private registerApp()V
    .locals 14

    const-string v0, "OtaApp"

    const-string v1, "ForceUpgradeManager.registerApp(): got an error trying to register with polling manager: "

    const-string v2, "ForceUpgradeManager.registerApp(), force upgrade interval: "

    :try_start_0
    invoke-direct {p0}, Lcom/motorola/ccc/ota/env/ForceUpgradeManager;->getForceUpgradetime()J

    move-result-wide v12

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v3, v12, v13}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v0, v2}, Lcom/motorola/ccc/ota/utils/Logger;->info(Ljava/lang/String;Ljava/lang/String;)V

    iget-object v3, p0, Lcom/motorola/ccc/ota/env/ForceUpgradeManager;->pollingManager:Lcom/motorola/ccc/ota/aidl/IPollingManagerService;

    const-string v5, "regANAmedARGPuecROF"

    const-string v6, "com.motorola.ccc.ota.ForceUpgradeManager.pollingManagerIntent"

    const/4 v10, 0x0

    const/4 v11, 0x0

    const/4 v4, 0x3

    const/4 v7, 0x0

    move-wide v8, v12

    invoke-interface/range {v3 .. v11}, Lcom/motorola/ccc/ota/aidl/IPollingManagerService;->registerApp(ILjava/lang/String;Ljava/lang/String;[Ljava/lang/String;JZZ)I

    move-result v2

    const/4 v3, -0x1

    if-ne v3, v2, :cond_0

    invoke-direct {p0}, Lcom/motorola/ccc/ota/env/ForceUpgradeManager;->unRegisterApp()I

    move-result v2

    if-nez v2, :cond_0

    iget-object v3, p0, Lcom/motorola/ccc/ota/env/ForceUpgradeManager;->pollingManager:Lcom/motorola/ccc/ota/aidl/IPollingManagerService;

    const-string v5, "regANAmedARGPuecROF"

    const-string v6, "com.motorola.ccc.ota.ForceUpgradeManager.pollingManagerIntent"

    const/4 v10, 0x0

    const/4 v11, 0x0

    const/4 v4, 0x3

    const/4 v7, 0x0

    move-wide v8, v12

    invoke-interface/range {v3 .. v11}, Lcom/motorola/ccc/ota/aidl/IPollingManagerService;->registerApp(ILjava/lang/String;Ljava/lang/String;[Ljava/lang/String;JZZ)I

    move-result v2

    :cond_0
    if-eqz v2, :cond_1

    new-instance p0, Ljava/lang/StringBuilder;

    invoke-direct {p0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p0, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-static {v0, p0}, Lcom/motorola/ccc/ota/utils/Logger;->error(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception p0

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "ForceUpgradeManager.registerApp(): got exception "

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-static {v0, p0}, Lcom/motorola/ccc/ota/utils/Logger;->error(Ljava/lang/String;Ljava/lang/String;)V

    :cond_1
    :goto_0
    return-void
.end method

.method private unRegisterApp()I
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/os/RemoteException;
        }
    .end annotation

    iget-object p0, p0, Lcom/motorola/ccc/ota/env/ForceUpgradeManager;->pollingManager:Lcom/motorola/ccc/ota/aidl/IPollingManagerService;

    const/4 v0, 0x3

    const-string v1, "regANAmedARGPuecROF"

    invoke-interface {p0, v0, v1}, Lcom/motorola/ccc/ota/aidl/IPollingManagerService;->unregisterApp(ILjava/lang/String;)I

    move-result p0

    return p0
.end method


# virtual methods
.method public init(I)V
    .locals 2

    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "Starting ForceUpgradeManager, mIsbound :"

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-boolean v1, p0, Lcom/motorola/ccc/ota/env/ForceUpgradeManager;->mIsBound:Z

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    const-string v1, "OtaApp"

    invoke-static {v1, v0}, Lcom/motorola/ccc/ota/utils/Logger;->debug(Ljava/lang/String;Ljava/lang/String;)V

    iput p1, p0, Lcom/motorola/ccc/ota/env/ForceUpgradeManager;->mForceUpgradeTime:I

    invoke-direct {p0}, Lcom/motorola/ccc/ota/env/ForceUpgradeManager;->doBindService()V

    return-void
.end method

.method public onDestroy()V
    .locals 2

    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "shutting down ForceUpgradeManager, mIsbound :"

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-boolean v1, p0, Lcom/motorola/ccc/ota/env/ForceUpgradeManager;->mIsBound:Z

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    const-string v1, "OtaApp"

    invoke-static {v1, v0}, Lcom/motorola/ccc/ota/utils/Logger;->debug(Ljava/lang/String;Ljava/lang/String;)V

    invoke-direct {p0}, Lcom/motorola/ccc/ota/env/ForceUpgradeManager;->doUnbindService()V

    return-void
.end method
