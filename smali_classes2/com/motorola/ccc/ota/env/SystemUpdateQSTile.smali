.class public Lcom/motorola/ccc/ota/env/SystemUpdateQSTile;
.super Landroid/service/quicksettings/TileService;
.source "SystemUpdateQSTile.java"


# static fields
.field private static final ACTION_SYSTEM_UPDATE_SETTINGS:Ljava/lang/String; = "motorola.settings.SYSTEM_UPDATE_SETTINGS"


# instance fields
.field private context:Landroid/content/Context;

.field private mUIRefreshSimChangeReceiver:Landroid/content/BroadcastReceiver;


# direct methods
.method static bridge synthetic -$$Nest$mupdateTileUi(Lcom/motorola/ccc/ota/env/SystemUpdateQSTile;)V
    .locals 0

    invoke-direct {p0}, Lcom/motorola/ccc/ota/env/SystemUpdateQSTile;->updateTileUi()V

    return-void
.end method

.method public constructor <init>()V
    .locals 1

    invoke-direct {p0}, Landroid/service/quicksettings/TileService;-><init>()V

    new-instance v0, Lcom/motorola/ccc/ota/env/SystemUpdateQSTile$1;

    invoke-direct {v0, p0}, Lcom/motorola/ccc/ota/env/SystemUpdateQSTile$1;-><init>(Lcom/motorola/ccc/ota/env/SystemUpdateQSTile;)V

    iput-object v0, p0, Lcom/motorola/ccc/ota/env/SystemUpdateQSTile;->mUIRefreshSimChangeReceiver:Landroid/content/BroadcastReceiver;

    return-void
.end method

.method private updateTileUi()V
    .locals 2

    invoke-static {p0}, Lcom/motorola/ccc/ota/utils/UpgradeUtilMethods;->isSystemUser(Landroid/content/Context;)Z

    move-result v0

    if-eqz v0, :cond_2

    invoke-static {p0}, Lcom/motorola/ccc/ota/utils/CusUtilMethods;->isCheckUpdateDisabled(Landroid/content/Context;)Z

    move-result v0

    if-eqz v0, :cond_0

    goto :goto_0

    :cond_0
    invoke-virtual {p0}, Lcom/motorola/ccc/ota/env/SystemUpdateQSTile;->getQsTile()Landroid/service/quicksettings/Tile;

    move-result-object v0

    if-nez v0, :cond_1

    return-void

    :cond_1
    const v1, 0x7f0800d0

    invoke-static {p0, v1}, Landroid/graphics/drawable/Icon;->createWithResource(Landroid/content/Context;I)Landroid/graphics/drawable/Icon;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/service/quicksettings/Tile;->setIcon(Landroid/graphics/drawable/Icon;)V

    invoke-virtual {p0}, Lcom/motorola/ccc/ota/env/SystemUpdateQSTile;->getApplicationContext()Landroid/content/Context;

    move-result-object p0

    const v1, 0x7f0e01bb

    invoke-virtual {p0, v1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object p0

    invoke-virtual {v0, p0}, Landroid/service/quicksettings/Tile;->setLabel(Ljava/lang/CharSequence;)V

    const/4 p0, 0x2

    invoke-virtual {v0, p0}, Landroid/service/quicksettings/Tile;->setState(I)V

    invoke-virtual {v0}, Landroid/service/quicksettings/Tile;->updateTile()V

    goto :goto_1

    :cond_2
    :goto_0
    invoke-virtual {p0}, Lcom/motorola/ccc/ota/env/SystemUpdateQSTile;->getQsTile()Landroid/service/quicksettings/Tile;

    move-result-object p0

    if-nez p0, :cond_3

    return-void

    :cond_3
    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Landroid/service/quicksettings/Tile;->setState(I)V

    invoke-virtual {p0}, Landroid/service/quicksettings/Tile;->updateTile()V

    :goto_1
    return-void
.end method


# virtual methods
.method public launchOTA()V
    .locals 5

    const-string v0, "OtaApp"

    :try_start_0
    const-string v1, "Launching check update from Quick Settings"

    invoke-static {v0, v1}, Lcom/motorola/ccc/ota/utils/Logger;->debug(Ljava/lang/String;Ljava/lang/String;)V

    iget-object v1, p0, Lcom/motorola/ccc/ota/env/SystemUpdateQSTile;->context:Landroid/content/Context;

    invoke-static {v1}, Lcom/motorola/ccc/ota/utils/DmSendAlertService;->startManualDMSync(Landroid/content/Context;)V

    new-instance v1, Landroid/content/Intent;

    const-string v2, "motorola.settings.SYSTEM_UPDATE_SETTINGS"

    invoke-direct {v1, v2}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    const/high16 v2, 0x10000000

    invoke-virtual {v1, v2}, Landroid/content/Intent;->setFlags(I)Landroid/content/Intent;

    new-instance v2, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    invoke-direct {v2}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;-><init>()V

    sget-object v3, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->USER_TRIGGER_LAUNCH_POINT:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    const-string v4, "quickTileSettings"

    invoke-virtual {v2, v3, v4}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->setString(Lcom/motorola/otalib/common/settings/ISetting;Ljava/lang/String;)V

    const/4 v2, 0x0

    const/high16 v3, 0x4000000

    invoke-static {p0, v2, v1, v3}, Landroid/app/PendingIntent;->getActivity(Landroid/content/Context;ILandroid/content/Intent;I)Landroid/app/PendingIntent;

    move-result-object v1

    invoke-virtual {p0, v1}, Lcom/motorola/ccc/ota/env/SystemUpdateQSTile;->startActivityAndCollapse(Landroid/app/PendingIntent;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception p0

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "Exception in SystemUpdateQSTile: launchOTA: "

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-static {v0, p0}, Lcom/motorola/ccc/ota/utils/Logger;->error(Ljava/lang/String;Ljava/lang/String;)V

    :goto_0
    return-void
.end method

.method public onClick()V
    .locals 0

    invoke-super {p0}, Landroid/service/quicksettings/TileService;->onClick()V

    invoke-virtual {p0}, Lcom/motorola/ccc/ota/env/SystemUpdateQSTile;->launchOTA()V

    return-void
.end method

.method public onCreate()V
    .locals 0

    invoke-super {p0}, Landroid/service/quicksettings/TileService;->onCreate()V

    return-void
.end method

.method public onDestroy()V
    .locals 0

    invoke-super {p0}, Landroid/service/quicksettings/TileService;->onDestroy()V

    return-void
.end method

.method public onStartListening()V
    .locals 3

    invoke-super {p0}, Landroid/service/quicksettings/TileService;->onStartListening()V

    invoke-virtual {p0}, Lcom/motorola/ccc/ota/env/SystemUpdateQSTile;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    iput-object v0, p0, Lcom/motorola/ccc/ota/env/SystemUpdateQSTile;->context:Landroid/content/Context;

    new-instance v0, Landroid/content/IntentFilter;

    invoke-direct {v0}, Landroid/content/IntentFilter;-><init>()V

    const-string v1, "com.motorola.ccc.ota.Actions.REFRESH_CHKUPDATE_UI_ON_SIMCHANGE"

    invoke-virtual {v0, v1}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    iget-object v1, p0, Lcom/motorola/ccc/ota/env/SystemUpdateQSTile;->context:Landroid/content/Context;

    iget-object v2, p0, Lcom/motorola/ccc/ota/env/SystemUpdateQSTile;->mUIRefreshSimChangeReceiver:Landroid/content/BroadcastReceiver;

    invoke-static {v1, v2, v0}, Lcom/motorola/otalib/common/utils/BroadcastUtils;->registerLocalReceiver(Landroid/content/Context;Landroid/content/BroadcastReceiver;Landroid/content/IntentFilter;)V

    invoke-direct {p0}, Lcom/motorola/ccc/ota/env/SystemUpdateQSTile;->updateTileUi()V

    return-void
.end method

.method public onStopListening()V
    .locals 1

    invoke-super {p0}, Landroid/service/quicksettings/TileService;->onStopListening()V

    iget-object v0, p0, Lcom/motorola/ccc/ota/env/SystemUpdateQSTile;->context:Landroid/content/Context;

    iget-object p0, p0, Lcom/motorola/ccc/ota/env/SystemUpdateQSTile;->mUIRefreshSimChangeReceiver:Landroid/content/BroadcastReceiver;

    invoke-static {v0, p0}, Lcom/motorola/otalib/common/utils/BroadcastUtils;->unregisterLocalReceiver(Landroid/content/Context;Landroid/content/BroadcastReceiver;)V

    return-void
.end method

.method public onTileAdded()V
    .locals 0

    invoke-super {p0}, Landroid/service/quicksettings/TileService;->onTileAdded()V

    return-void
.end method

.method public onTileRemoved()V
    .locals 0

    invoke-super {p0}, Landroid/service/quicksettings/TileService;->onTileRemoved()V

    return-void
.end method
