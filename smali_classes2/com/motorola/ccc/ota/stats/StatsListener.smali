.class public Lcom/motorola/ccc/ota/stats/StatsListener;
.super Ljava/lang/Object;
.source "StatsListener.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/motorola/ccc/ota/stats/StatsListener$StatsBuilderBroadcastReceiver;
    }
.end annotation


# instance fields
.field private final cm:Landroid/net/ConnectivityManager;

.field private final context:Landroid/content/Context;

.field private sbbr:Lcom/motorola/ccc/ota/stats/StatsListener$StatsBuilderBroadcastReceiver;

.field private final settings:Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;


# direct methods
.method static bridge synthetic -$$Nest$fgetcm(Lcom/motorola/ccc/ota/stats/StatsListener;)Landroid/net/ConnectivityManager;
    .locals 0

    iget-object p0, p0, Lcom/motorola/ccc/ota/stats/StatsListener;->cm:Landroid/net/ConnectivityManager;

    return-object p0
.end method

.method static bridge synthetic -$$Nest$fgetsettings(Lcom/motorola/ccc/ota/stats/StatsListener;)Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;
    .locals 0

    iget-object p0, p0, Lcom/motorola/ccc/ota/stats/StatsListener;->settings:Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    return-object p0
.end method

.method public constructor <init>(Landroid/net/ConnectivityManager;Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;)V
    .locals 1

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, 0x0

    iput-object v0, p0, Lcom/motorola/ccc/ota/stats/StatsListener;->sbbr:Lcom/motorola/ccc/ota/stats/StatsListener$StatsBuilderBroadcastReceiver;

    iput-object p1, p0, Lcom/motorola/ccc/ota/stats/StatsListener;->cm:Landroid/net/ConnectivityManager;

    iput-object p2, p0, Lcom/motorola/ccc/ota/stats/StatsListener;->settings:Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    invoke-static {}, Lcom/motorola/ccc/ota/env/OtaApplication;->getGlobalContext()Landroid/content/Context;

    move-result-object p1

    iput-object p1, p0, Lcom/motorola/ccc/ota/stats/StatsListener;->context:Landroid/content/Context;

    return-void
.end method

.method private unregisterReceiver()V
    .locals 2

    iget-object v0, p0, Lcom/motorola/ccc/ota/stats/StatsListener;->sbbr:Lcom/motorola/ccc/ota/stats/StatsListener$StatsBuilderBroadcastReceiver;

    if-eqz v0, :cond_0

    iget-object v1, p0, Lcom/motorola/ccc/ota/stats/StatsListener;->context:Landroid/content/Context;

    invoke-static {v1, v0}, Lcom/motorola/otalib/common/utils/BroadcastUtils;->unregisterLocalReceiver(Landroid/content/Context;Landroid/content/BroadcastReceiver;)V

    iget-object v0, p0, Lcom/motorola/ccc/ota/stats/StatsListener;->context:Landroid/content/Context;

    iget-object v1, p0, Lcom/motorola/ccc/ota/stats/StatsListener;->sbbr:Lcom/motorola/ccc/ota/stats/StatsListener$StatsBuilderBroadcastReceiver;

    invoke-virtual {v0, v1}, Landroid/content/Context;->unregisterReceiver(Landroid/content/BroadcastReceiver;)V

    const/4 v0, 0x0

    iput-object v0, p0, Lcom/motorola/ccc/ota/stats/StatsListener;->sbbr:Lcom/motorola/ccc/ota/stats/StatsListener$StatsBuilderBroadcastReceiver;

    :cond_0
    return-void
.end method


# virtual methods
.method public startStatsListener()V
    .locals 9

    iget-object v0, p0, Lcom/motorola/ccc/ota/stats/StatsListener;->sbbr:Lcom/motorola/ccc/ota/stats/StatsListener$StatsBuilderBroadcastReceiver;

    if-nez v0, :cond_0

    new-instance v0, Lcom/motorola/ccc/ota/stats/StatsListener$StatsBuilderBroadcastReceiver;

    const/4 v1, 0x0

    invoke-direct {v0, p0, v1}, Lcom/motorola/ccc/ota/stats/StatsListener$StatsBuilderBroadcastReceiver;-><init>(Lcom/motorola/ccc/ota/stats/StatsListener;Lcom/motorola/ccc/ota/stats/StatsListener$StatsBuilderBroadcastReceiver-IA;)V

    iput-object v0, p0, Lcom/motorola/ccc/ota/stats/StatsListener;->sbbr:Lcom/motorola/ccc/ota/stats/StatsListener$StatsBuilderBroadcastReceiver;

    new-instance v0, Landroid/content/IntentFilter;

    invoke-direct {v0}, Landroid/content/IntentFilter;-><init>()V

    const-string v1, "com.motorola.ccc.ota.CusAndroidUtils.ACTION_GET_DESCRIPTOR"

    invoke-virtual {v0, v1}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    const-string v1, "com.motorola.ccc.ota.CusAndroidUtils.INTERNAL_NOTIFICATION"

    invoke-virtual {v0, v1}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    const-string v1, "com.motorola.ccc.ota.dl_errorcode"

    invoke-virtual {v0, v1}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    const-string v1, "com.motorola.ccc.ota.dl_exception"

    invoke-virtual {v0, v1}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    const-string v1, "com.motorola.blur.service.blur.Actions.UPGRADE_EXECUTE_UPGRADE"

    invoke-virtual {v0, v1}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    const-string v1, "com.motorola.ccc.ota.AB_APPLY_PAYLOAD_STARTED"

    invoke-virtual {v0, v1}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    const-string v1, "com.motorola.ccc.ota.AB_UPGRADE_COMPLETED"

    invoke-virtual {v0, v1}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    const-string v1, "com.motorola.ccc.ota.REBOOT_DURING_DOWNLOAD"

    invoke-virtual {v0, v1}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    iget-object v1, p0, Lcom/motorola/ccc/ota/stats/StatsListener;->context:Landroid/content/Context;

    iget-object v2, p0, Lcom/motorola/ccc/ota/stats/StatsListener;->sbbr:Lcom/motorola/ccc/ota/stats/StatsListener$StatsBuilderBroadcastReceiver;

    invoke-static {v1, v2, v0}, Lcom/motorola/otalib/common/utils/BroadcastUtils;->registerLocalReceiver(Landroid/content/Context;Landroid/content/BroadcastReceiver;Landroid/content/IntentFilter;)V

    new-instance v5, Landroid/content/IntentFilter;

    invoke-direct {v5}, Landroid/content/IntentFilter;-><init>()V

    const-string v0, "com.motorola.ccc.ota.CusAndroidUtils.START_DOWNLOAD_NOTIFICATION"

    invoke-virtual {v5, v0}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    const-string v0, "com.motorola.blur.service.blur.Actions.UPGRADE_LAUNCH_UPGRADE"

    invoke-virtual {v5, v0}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    const-string v0, "com.motorola.blur.service.blur.Actions.UPGRADE_UPDATE_NOTIFICATION_RESPONSE"

    invoke-virtual {v5, v0}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    const-string v0, "com.motorola.blur.service.blur.Actions.UPGRADE_UPDATE_STATUS"

    invoke-virtual {v5, v0}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    const-string v0, "com.motorola.blur.service.blur.Actions.UPGRADE_UPDATE_NOTIFICATION"

    invoke-virtual {v5, v0}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    const-string v0, "com.motorola.blur.service.blur.Actions.UPGRADE_DOWNLOAD_STATUS"

    invoke-virtual {v5, v0}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    const-string v0, "com.motorola.ccc.ota.ACTION_OTA_DEFERRED"

    invoke-virtual {v5, v0}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    iget-object v3, p0, Lcom/motorola/ccc/ota/stats/StatsListener;->context:Landroid/content/Context;

    iget-object v4, p0, Lcom/motorola/ccc/ota/stats/StatsListener;->sbbr:Lcom/motorola/ccc/ota/stats/StatsListener$StatsBuilderBroadcastReceiver;

    const/4 v7, 0x0

    const/4 v8, 0x2

    const-string v6, "com.motorola.ccc.ota.Permissions.INTERACT_OTA_SERVICE"

    invoke-virtual/range {v3 .. v8}, Landroid/content/Context;->registerReceiver(Landroid/content/BroadcastReceiver;Landroid/content/IntentFilter;Ljava/lang/String;Landroid/os/Handler;I)Landroid/content/Intent;

    new-instance v0, Landroid/content/IntentFilter;

    invoke-direct {v0}, Landroid/content/IntentFilter;-><init>()V

    const-string v1, "com.motorola.app.action.UPGRADE_UPDATE_STATUS"

    invoke-virtual {v0, v1}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    iget-object v1, p0, Lcom/motorola/ccc/ota/stats/StatsListener;->context:Landroid/content/Context;

    iget-object p0, p0, Lcom/motorola/ccc/ota/stats/StatsListener;->sbbr:Lcom/motorola/ccc/ota/stats/StatsListener$StatsBuilderBroadcastReceiver;

    const/4 v2, 0x4

    invoke-virtual {v1, p0, v0, v2}, Landroid/content/Context;->registerReceiver(Landroid/content/BroadcastReceiver;Landroid/content/IntentFilter;I)Landroid/content/Intent;

    :cond_0
    return-void
.end method

.method public stopListener()V
    .locals 0

    invoke-direct {p0}, Lcom/motorola/ccc/ota/stats/StatsListener;->unregisterReceiver()V

    return-void
.end method
