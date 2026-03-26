.class public Lcom/motorola/ccc/ota/sources/modem/ModemPollingManager;
.super Ljava/lang/Object;
.source "ModemPollingManager.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/motorola/ccc/ota/sources/modem/ModemPollingManager$MyIntentReceiver;
    }
.end annotation


# static fields
.field private static final APP_NAME_POLLING_MANAGER:I = 0x4

.field private static final APP_SECRET_POLLING_MANAGER:Ljava/lang/String; = "cmRModEmPav@cprimr"

.field public static final INTENT_ACTION_POLLING_MANAGER:Ljava/lang/String; = "com.motorola.ccc.ota.ModemPollingManager.pollingManagerIntent"

.field private static final POLLING_OFF:I = 0x0

.field private static final POLL_IMMEDIATELY:I = 0xea60


# instance fields
.field private ctx:Landroid/content/Context;

.field protected mConnection:Landroid/content/ServiceConnection;

.field private myReceiver:Lcom/motorola/ccc/ota/sources/modem/ModemPollingManager$MyIntentReceiver;

.field private pollingManager:Lcom/motorola/ccc/ota/aidl/IPollingManagerService;

.field private settings:Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;


# direct methods
.method static bridge synthetic -$$Nest$fgetsettings(Lcom/motorola/ccc/ota/sources/modem/ModemPollingManager;)Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;
    .locals 0

    iget-object p0, p0, Lcom/motorola/ccc/ota/sources/modem/ModemPollingManager;->settings:Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    return-object p0
.end method

.method static bridge synthetic -$$Nest$fputpollingManager(Lcom/motorola/ccc/ota/sources/modem/ModemPollingManager;Lcom/motorola/ccc/ota/aidl/IPollingManagerService;)V
    .locals 0

    iput-object p1, p0, Lcom/motorola/ccc/ota/sources/modem/ModemPollingManager;->pollingManager:Lcom/motorola/ccc/ota/aidl/IPollingManagerService;

    return-void
.end method

.method static bridge synthetic -$$Nest$mconfigurePolling(Lcom/motorola/ccc/ota/sources/modem/ModemPollingManager;)V
    .locals 0

    invoke-direct {p0}, Lcom/motorola/ccc/ota/sources/modem/ModemPollingManager;->configurePolling()V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;)V
    .locals 2

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance v0, Lcom/motorola/ccc/ota/sources/modem/ModemPollingManager$MyIntentReceiver;

    const/4 v1, 0x0

    invoke-direct {v0, p0, v1}, Lcom/motorola/ccc/ota/sources/modem/ModemPollingManager$MyIntentReceiver;-><init>(Lcom/motorola/ccc/ota/sources/modem/ModemPollingManager;Lcom/motorola/ccc/ota/sources/modem/ModemPollingManager$MyIntentReceiver-IA;)V

    iput-object v0, p0, Lcom/motorola/ccc/ota/sources/modem/ModemPollingManager;->myReceiver:Lcom/motorola/ccc/ota/sources/modem/ModemPollingManager$MyIntentReceiver;

    new-instance v0, Lcom/motorola/ccc/ota/sources/modem/ModemPollingManager$1;

    invoke-direct {v0, p0}, Lcom/motorola/ccc/ota/sources/modem/ModemPollingManager$1;-><init>(Lcom/motorola/ccc/ota/sources/modem/ModemPollingManager;)V

    iput-object v0, p0, Lcom/motorola/ccc/ota/sources/modem/ModemPollingManager;->mConnection:Landroid/content/ServiceConnection;

    iput-object p1, p0, Lcom/motorola/ccc/ota/sources/modem/ModemPollingManager;->ctx:Landroid/content/Context;

    iput-object p2, p0, Lcom/motorola/ccc/ota/sources/modem/ModemPollingManager;->settings:Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    invoke-direct {p0}, Lcom/motorola/ccc/ota/sources/modem/ModemPollingManager;->init()V

    return-void
.end method

.method private configurePolling()V
    .locals 16

    move-object/from16 v0, p0

    const-string v1, "ModemPollingManager:configurePolling(): got an error trying to register with polling manager: "

    const-string v2, "ModemPollingManager:Next Polling is scheduled at "

    const-string v3, "ModemPollingManager:getDelayForNextPolling is "

    iget-object v4, v0, Lcom/motorola/ccc/ota/sources/modem/ModemPollingManager;->pollingManager:Lcom/motorola/ccc/ota/aidl/IPollingManagerService;

    const-string v5, "OtaApp"

    if-nez v4, :cond_0

    const-string v0, "ModemPollingManager. configurePolling : pollingManager is null"

    invoke-static {v5, v0}, Lcom/motorola/ccc/ota/utils/Logger;->debug(Ljava/lang/String;Ljava/lang/String;)V

    return-void

    :cond_0
    :try_start_0
    invoke-direct/range {p0 .. p0}, Lcom/motorola/ccc/ota/sources/modem/ModemPollingManager;->getDelayForNextPolling()J

    move-result-wide v14

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v4, v14, v15}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v5, v3}, Lcom/motorola/ccc/ota/utils/Logger;->debug(Ljava/lang/String;Ljava/lang/String;)V

    const-wide/16 v3, 0x0

    cmp-long v3, v14, v3

    if-nez v3, :cond_1

    const-string v1, "ModemPollingManager:Server always wins, Disabling the polling"

    invoke-static {v5, v1}, Lcom/motorola/ccc/ota/utils/Logger;->info(Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual/range {p0 .. p0}, Lcom/motorola/ccc/ota/sources/modem/ModemPollingManager;->unRegisterApp()I

    return-void

    :cond_1
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    sget-object v2, Ljava/util/concurrent/TimeUnit;->MILLISECONDS:Ljava/util/concurrent/TimeUnit;

    invoke-virtual {v2, v14, v15}, Ljava/util/concurrent/TimeUnit;->toMinutes(J)J

    move-result-wide v6

    invoke-virtual {v3, v6, v7}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, " mins from now"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v5, v2}, Lcom/motorola/ccc/ota/utils/Logger;->debug(Ljava/lang/String;Ljava/lang/String;)V

    iget-object v6, v0, Lcom/motorola/ccc/ota/sources/modem/ModemPollingManager;->pollingManager:Lcom/motorola/ccc/ota/aidl/IPollingManagerService;

    const-string v8, "cmRModEmPav@cprimr"

    const-string v9, "com.motorola.ccc.ota.ModemPollingManager.pollingManagerIntent"

    const/4 v13, 0x1

    const/4 v2, 0x1

    const/4 v7, 0x4

    const/4 v10, 0x0

    move-wide v11, v14

    move-wide v3, v14

    move v14, v2

    invoke-interface/range {v6 .. v14}, Lcom/motorola/ccc/ota/aidl/IPollingManagerService;->registerApp(ILjava/lang/String;Ljava/lang/String;[Ljava/lang/String;JZZ)I

    move-result v2

    const/4 v6, -0x1

    if-ne v6, v2, :cond_2

    const-string v2, "ModemPollingManager:app is already registered so unregister and register"

    invoke-static {v5, v2}, Lcom/motorola/ccc/ota/utils/Logger;->debug(Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual/range {p0 .. p0}, Lcom/motorola/ccc/ota/sources/modem/ModemPollingManager;->unRegisterApp()I

    move-result v2

    if-nez v2, :cond_2

    iget-object v6, v0, Lcom/motorola/ccc/ota/sources/modem/ModemPollingManager;->pollingManager:Lcom/motorola/ccc/ota/aidl/IPollingManagerService;

    const-string v8, "cmRModEmPav@cprimr"

    const-string v9, "com.motorola.ccc.ota.ModemPollingManager.pollingManagerIntent"

    const/4 v13, 0x1

    const/4 v14, 0x1

    const/4 v7, 0x4

    const/4 v10, 0x0

    move-wide v11, v3

    invoke-interface/range {v6 .. v14}, Lcom/motorola/ccc/ota/aidl/IPollingManagerService;->registerApp(ILjava/lang/String;Ljava/lang/String;[Ljava/lang/String;JZZ)I

    move-result v2

    :cond_2
    if-eqz v2, :cond_3

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v5, v0}, Lcom/motorola/ccc/ota/utils/Logger;->error(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception v0

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "ModemPollingManager:Exception in AndroidPollingManager: configurePolling: "

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v5, v0}, Lcom/motorola/ccc/ota/utils/Logger;->error(Ljava/lang/String;Ljava/lang/String;)V

    :cond_3
    :goto_0
    return-void
.end method

.method private getDelayForNextPolling()J
    .locals 9

    iget-object v0, p0, Lcom/motorola/ccc/ota/sources/modem/ModemPollingManager;->settings:Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    sget-object v1, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->NEXT_MODEM_POLLING_VALUE:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    const-wide/16 v2, -0x1

    invoke-virtual {v0, v1, v2, v3}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->getLong(Lcom/motorola/otalib/common/settings/ISetting;J)J

    move-result-wide v0

    cmp-long v2, v0, v2

    const-wide/32 v3, 0x5265c00

    if-nez v2, :cond_0

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v0

    add-long/2addr v0, v3

    iget-object v2, p0, Lcom/motorola/ccc/ota/sources/modem/ModemPollingManager;->settings:Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    sget-object v5, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->NEXT_MODEM_POLLING_VALUE:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    invoke-virtual {v2, v5, v0, v1}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->setLong(Lcom/motorola/otalib/common/settings/ISetting;J)V

    :cond_0
    const-wide/16 v5, 0x0

    cmp-long v2, v0, v5

    if-nez v2, :cond_1

    return-wide v5

    :cond_1
    const-wide/16 v5, -0x6c1

    cmp-long v2, v0, v5

    if-nez v2, :cond_2

    return-wide v5

    :cond_2
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v5

    cmp-long v2, v5, v0

    const-wide/32 v7, 0xea60

    if-lez v2, :cond_3

    return-wide v7

    :cond_3
    sub-long/2addr v0, v5

    invoke-static {v0, v1}, Ljava/lang/StrictMath;->abs(J)J

    move-result-wide v0

    const-wide/16 v5, 0x3e8

    cmp-long v2, v0, v5

    if-gez v2, :cond_4

    return-wide v7

    :cond_4
    iget-object v2, p0, Lcom/motorola/ccc/ota/sources/modem/ModemPollingManager;->settings:Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    sget-object v5, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->POLL_MODEM_AFTER:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    invoke-virtual {v2, v5, v3, v4}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->getLong(Lcom/motorola/otalib/common/settings/ISetting;J)J

    move-result-wide v5

    cmp-long v2, v0, v5

    if-lez v2, :cond_5

    const-string v0, "OtaApp"

    const-string v1, "ModemPollingManager:Difference is more than pollAfter value that means device time is less than actual time. So resetting it to pollAfter value"

    invoke-static {v0, v1}, Lcom/motorola/ccc/ota/utils/Logger;->debug(Ljava/lang/String;Ljava/lang/String;)V

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v0

    iget-object v2, p0, Lcom/motorola/ccc/ota/sources/modem/ModemPollingManager;->settings:Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    sget-object v5, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->POLL_MODEM_AFTER:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    invoke-virtual {v2, v5, v3, v4}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->getLong(Lcom/motorola/otalib/common/settings/ISetting;J)J

    move-result-wide v5

    add-long/2addr v0, v5

    iget-object v2, p0, Lcom/motorola/ccc/ota/sources/modem/ModemPollingManager;->settings:Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    sget-object v5, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->NEXT_MODEM_POLLING_VALUE:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    invoke-virtual {v2, v5, v0, v1}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->setLong(Lcom/motorola/otalib/common/settings/ISetting;J)V

    iget-object p0, p0, Lcom/motorola/ccc/ota/sources/modem/ModemPollingManager;->settings:Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    sget-object v0, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->POLL_MODEM_AFTER:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    invoke-virtual {p0, v0, v3, v4}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->getLong(Lcom/motorola/otalib/common/settings/ISetting;J)J

    move-result-wide v0

    :cond_5
    return-wide v0
.end method

.method private init()V
    .locals 4

    const-string v0, "OtaApp"

    const-string v1, "ModemPollingManager.init, binding to Polling Manager Service"

    invoke-static {v0, v1}, Lcom/motorola/ccc/ota/utils/Logger;->debug(Ljava/lang/String;Ljava/lang/String;)V

    iget-object v0, p0, Lcom/motorola/ccc/ota/sources/modem/ModemPollingManager;->ctx:Landroid/content/Context;

    new-instance v1, Landroid/content/Intent;

    iget-object v2, p0, Lcom/motorola/ccc/ota/sources/modem/ModemPollingManager;->ctx:Landroid/content/Context;

    const-class v3, Lcom/motorola/ccc/ota/env/OtaService;

    invoke-direct {v1, v2, v3}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    iget-object v2, p0, Lcom/motorola/ccc/ota/sources/modem/ModemPollingManager;->mConnection:Landroid/content/ServiceConnection;

    const/4 v3, 0x1

    invoke-virtual {v0, v1, v2, v3}, Landroid/content/Context;->bindService(Landroid/content/Intent;Landroid/content/ServiceConnection;I)Z

    new-instance v0, Landroid/content/IntentFilter;

    invoke-direct {v0}, Landroid/content/IntentFilter;-><init>()V

    const-string v1, "com.motorola.ccc.ota.modem_upgrade_poll"

    invoke-virtual {v0, v1}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    iget-object v1, p0, Lcom/motorola/ccc/ota/sources/modem/ModemPollingManager;->ctx:Landroid/content/Context;

    iget-object p0, p0, Lcom/motorola/ccc/ota/sources/modem/ModemPollingManager;->myReceiver:Lcom/motorola/ccc/ota/sources/modem/ModemPollingManager$MyIntentReceiver;

    invoke-static {v1, p0, v0}, Lcom/motorola/otalib/common/utils/BroadcastUtils;->registerLocalReceiver(Landroid/content/Context;Landroid/content/BroadcastReceiver;Landroid/content/IntentFilter;)V

    return-void
.end method


# virtual methods
.method public onDestroy()V
    .locals 3

    const-string v0, "shutting down ModemPollingManager"

    const-string v1, "OtaApp"

    invoke-static {v1, v0}, Lcom/motorola/ccc/ota/utils/Logger;->debug(Ljava/lang/String;Ljava/lang/String;)V

    iget-object v0, p0, Lcom/motorola/ccc/ota/sources/modem/ModemPollingManager;->ctx:Landroid/content/Context;

    iget-object v2, p0, Lcom/motorola/ccc/ota/sources/modem/ModemPollingManager;->myReceiver:Lcom/motorola/ccc/ota/sources/modem/ModemPollingManager$MyIntentReceiver;

    invoke-static {v0, v2}, Lcom/motorola/otalib/common/utils/BroadcastUtils;->unregisterLocalReceiver(Landroid/content/Context;Landroid/content/BroadcastReceiver;)V

    iget-object v0, p0, Lcom/motorola/ccc/ota/sources/modem/ModemPollingManager;->pollingManager:Lcom/motorola/ccc/ota/aidl/IPollingManagerService;

    if-eqz v0, :cond_0

    :try_start_0
    invoke-virtual {p0}, Lcom/motorola/ccc/ota/sources/modem/ModemPollingManager;->unRegisterApp()I
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception p0

    new-instance v0, Ljava/lang/StringBuilder;

    const-string v2, "ModemPollingManager:Exception in AndroidPollingManager: onDestroy: "

    invoke-direct {v0, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-static {v1, p0}, Lcom/motorola/ccc/ota/utils/Logger;->error(Ljava/lang/String;Ljava/lang/String;)V

    :cond_0
    :goto_0
    return-void
.end method

.method public unRegisterApp()I
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/os/RemoteException;
        }
    .end annotation

    iget-object p0, p0, Lcom/motorola/ccc/ota/sources/modem/ModemPollingManager;->pollingManager:Lcom/motorola/ccc/ota/aidl/IPollingManagerService;

    const/4 v0, 0x4

    const-string v1, "cmRModEmPav@cprimr"

    invoke-interface {p0, v0, v1}, Lcom/motorola/ccc/ota/aidl/IPollingManagerService;->unregisterApp(ILjava/lang/String;)I

    move-result p0

    return p0
.end method
