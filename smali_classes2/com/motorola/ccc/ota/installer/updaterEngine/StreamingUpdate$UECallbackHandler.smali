.class Lcom/motorola/ccc/ota/installer/updaterEngine/StreamingUpdate$UECallbackHandler;
.super Ljava/lang/Object;
.source "StreamingUpdate.java"

# interfaces
.implements Lcom/motorola/ccc/ota/installer/updaterEngine/common/CallBackInterface;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/motorola/ccc/ota/installer/updaterEngine/StreamingUpdate;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "UECallbackHandler"
.end annotation


# instance fields
.field final synthetic this$0:Lcom/motorola/ccc/ota/installer/updaterEngine/StreamingUpdate;


# direct methods
.method private constructor <init>(Lcom/motorola/ccc/ota/installer/updaterEngine/StreamingUpdate;)V
    .locals 0

    iput-object p1, p0, Lcom/motorola/ccc/ota/installer/updaterEngine/StreamingUpdate$UECallbackHandler;->this$0:Lcom/motorola/ccc/ota/installer/updaterEngine/StreamingUpdate;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method synthetic constructor <init>(Lcom/motorola/ccc/ota/installer/updaterEngine/StreamingUpdate;Lcom/motorola/ccc/ota/installer/updaterEngine/StreamingUpdate$UECallbackHandler-IA;)V
    .locals 0

    invoke-direct {p0, p1}, Lcom/motorola/ccc/ota/installer/updaterEngine/StreamingUpdate$UECallbackHandler;-><init>(Lcom/motorola/ccc/ota/installer/updaterEngine/StreamingUpdate;)V

    return-void
.end method

.method private declared-synchronized onApplyPayload()V
    .locals 11
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/ClassNotFoundException;,
            Ljava/lang/InstantiationException;,
            Ljava/lang/IllegalAccessException;,
            Ljava/lang/NoSuchMethodException;,
            Ljava/lang/reflect/InvocationTargetException;,
            Lorg/json/JSONException;,
            Lcom/motorola/ccc/ota/installer/updaterEngine/download/DownloadBuilderException;
        }
    .end annotation

    monitor-enter p0

    :try_start_0
    iget-object v0, p0, Lcom/motorola/ccc/ota/installer/updaterEngine/StreamingUpdate$UECallbackHandler;->this$0:Lcom/motorola/ccc/ota/installer/updaterEngine/StreamingUpdate;

    iget-object v0, v0, Lcom/motorola/ccc/ota/installer/updaterEngine/StreamingUpdate;->_settings:Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    sget-object v1, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->VAB_MERGE_PROCESS_RUNNING:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->getBoolean(Lcom/motorola/otalib/common/settings/ISetting;Z)Z

    move-result v0

    invoke-static {}, Lcom/motorola/ccc/ota/installer/updaterEngine/UpdaterEngineInstaller;->getApplyPayloadStarted()Z

    move-result v1

    if-nez v1, :cond_d

    if-eqz v0, :cond_0

    goto/16 :goto_2

    :cond_0
    iget-object v0, p0, Lcom/motorola/ccc/ota/installer/updaterEngine/StreamingUpdate$UECallbackHandler;->this$0:Lcom/motorola/ccc/ota/installer/updaterEngine/StreamingUpdate;

    invoke-static {v0}, Lcom/motorola/ccc/ota/installer/updaterEngine/StreamingUpdate;->-$$Nest$fgetd(Lcom/motorola/ccc/ota/installer/updaterEngine/StreamingUpdate;)Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database$Descriptor;

    move-result-object v0

    if-eqz v0, :cond_c

    iget-object v0, p0, Lcom/motorola/ccc/ota/installer/updaterEngine/StreamingUpdate$UECallbackHandler;->this$0:Lcom/motorola/ccc/ota/installer/updaterEngine/StreamingUpdate;

    invoke-static {v0}, Lcom/motorola/ccc/ota/installer/updaterEngine/StreamingUpdate;->-$$Nest$fgetd(Lcom/motorola/ccc/ota/installer/updaterEngine/StreamingUpdate;)Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database$Descriptor;

    move-result-object v0

    invoke-interface {v0}, Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database$Descriptor;->getMeta()Lcom/motorola/otalib/common/metaData/MetaData;

    move-result-object v0

    if-nez v0, :cond_1

    goto/16 :goto_1

    :cond_1
    const/4 v0, 0x1

    invoke-static {v0}, Lcom/motorola/ccc/ota/installer/updaterEngine/UpdaterEngineInstaller;->setApplyPayloadStarted(Z)V

    invoke-static {}, Lcom/motorola/ccc/ota/utils/BuildPropReader;->isBotaATT()Z

    move-result v1

    if-eqz v1, :cond_2

    invoke-static {}, Lcom/motorola/ccc/ota/ui/UpdaterUtils;->isWifiOnly()Z

    move-result v1

    if-eqz v1, :cond_2

    iget-object v1, p0, Lcom/motorola/ccc/ota/installer/updaterEngine/StreamingUpdate$UECallbackHandler;->this$0:Lcom/motorola/ccc/ota/installer/updaterEngine/StreamingUpdate;

    iget-object v1, v1, Lcom/motorola/ccc/ota/installer/updaterEngine/StreamingUpdate;->_env:Lcom/motorola/otalib/common/Environment/ApplicationEnv;

    invoke-interface {v1}, Lcom/motorola/otalib/common/Environment/ApplicationEnv;->getUtilities()Lcom/motorola/otalib/common/Environment/ApplicationEnv$Utilities;

    move-result-object v1

    invoke-interface {v1}, Lcom/motorola/otalib/common/Environment/ApplicationEnv$Utilities;->startFotaWifiDiscoveryTimer()V

    :cond_2
    iget-object v1, p0, Lcom/motorola/ccc/ota/installer/updaterEngine/StreamingUpdate$UECallbackHandler;->this$0:Lcom/motorola/ccc/ota/installer/updaterEngine/StreamingUpdate;

    new-instance v3, Lcom/motorola/ccc/ota/installer/updaterEngine/download/UEDownloadRequestBuilder;

    iget-object v4, p0, Lcom/motorola/ccc/ota/installer/updaterEngine/StreamingUpdate$UECallbackHandler;->this$0:Lcom/motorola/ccc/ota/installer/updaterEngine/StreamingUpdate;

    iget-object v4, v4, Lcom/motorola/ccc/ota/installer/updaterEngine/StreamingUpdate;->_settings:Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    iget-object v5, p0, Lcom/motorola/ccc/ota/installer/updaterEngine/StreamingUpdate$UECallbackHandler;->this$0:Lcom/motorola/ccc/ota/installer/updaterEngine/StreamingUpdate;

    invoke-static {v5}, Lcom/motorola/ccc/ota/installer/updaterEngine/StreamingUpdate;->-$$Nest$fgetmCm(Lcom/motorola/ccc/ota/installer/updaterEngine/StreamingUpdate;)Landroid/net/ConnectivityManager;

    move-result-object v5

    iget-object v6, p0, Lcom/motorola/ccc/ota/installer/updaterEngine/StreamingUpdate$UECallbackHandler;->this$0:Lcom/motorola/ccc/ota/installer/updaterEngine/StreamingUpdate;

    invoke-static {v6}, Lcom/motorola/ccc/ota/installer/updaterEngine/StreamingUpdate;->-$$Nest$fgetmTm(Lcom/motorola/ccc/ota/installer/updaterEngine/StreamingUpdate;)Landroid/telephony/TelephonyManager;

    move-result-object v6

    invoke-direct {v3, v4, v5, v6}, Lcom/motorola/ccc/ota/installer/updaterEngine/download/UEDownloadRequestBuilder;-><init>(Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;Landroid/net/ConnectivityManager;Landroid/telephony/TelephonyManager;)V

    invoke-static {v1, v3}, Lcom/motorola/ccc/ota/installer/updaterEngine/StreamingUpdate;->-$$Nest$fputdlBuilder(Lcom/motorola/ccc/ota/installer/updaterEngine/StreamingUpdate;Lcom/motorola/ccc/ota/installer/updaterEngine/download/UEDownloadRequestBuilder;)V

    iget-object v1, p0, Lcom/motorola/ccc/ota/installer/updaterEngine/StreamingUpdate$UECallbackHandler;->this$0:Lcom/motorola/ccc/ota/installer/updaterEngine/StreamingUpdate;

    iget-object v1, v1, Lcom/motorola/ccc/ota/installer/updaterEngine/StreamingUpdate;->_settings:Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    invoke-static {v1}, Lcom/motorola/ccc/ota/installer/updaterEngine/common/InstallerUtilMethods;->getAdminApnUrl(Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;)Ljava/lang/String;

    move-result-object v1

    iget-object v3, p0, Lcom/motorola/ccc/ota/installer/updaterEngine/StreamingUpdate$UECallbackHandler;->this$0:Lcom/motorola/ccc/ota/installer/updaterEngine/StreamingUpdate;

    iget-object v3, v3, Lcom/motorola/ccc/ota/installer/updaterEngine/StreamingUpdate;->_settings:Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    sget-object v4, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->BATTERY_LOW:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    invoke-virtual {v3, v4}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->getBoolean(Lcom/motorola/otalib/common/settings/ISetting;)Z

    move-result v3

    const/4 v9, -0x1

    const/4 v10, 0x0

    if-nez v3, :cond_b

    invoke-static {}, Lcom/motorola/ccc/ota/ui/UpdaterUtils;->isDeviceInDatasaverMode()Z

    move-result v3

    if-eqz v3, :cond_3

    goto/16 :goto_0

    :cond_3
    iget-object v3, p0, Lcom/motorola/ccc/ota/installer/updaterEngine/StreamingUpdate$UECallbackHandler;->this$0:Lcom/motorola/ccc/ota/installer/updaterEngine/StreamingUpdate;

    invoke-static {v3}, Lcom/motorola/ccc/ota/installer/updaterEngine/StreamingUpdate;->-$$Nest$fgetod(Lcom/motorola/ccc/ota/installer/updaterEngine/StreamingUpdate;)Lcom/motorola/otalib/downloadservice/download/policy/DownloadPolicy;

    move-result-object v3

    iget-object v4, p0, Lcom/motorola/ccc/ota/installer/updaterEngine/StreamingUpdate$UECallbackHandler;->this$0:Lcom/motorola/ccc/ota/installer/updaterEngine/StreamingUpdate;

    invoke-static {v4}, Lcom/motorola/ccc/ota/installer/updaterEngine/StreamingUpdate;->-$$Nest$fgetcontext(Lcom/motorola/ccc/ota/installer/updaterEngine/StreamingUpdate;)Landroid/content/Context;

    move-result-object v4

    invoke-static {}, Lcom/motorola/ccc/ota/ui/UpdaterUtils;->isWifiOnly()Z

    move-result v5

    iget-object v6, p0, Lcom/motorola/ccc/ota/installer/updaterEngine/StreamingUpdate$UECallbackHandler;->this$0:Lcom/motorola/ccc/ota/installer/updaterEngine/StreamingUpdate;

    iget-object v6, v6, Lcom/motorola/ccc/ota/installer/updaterEngine/StreamingUpdate;->_settings:Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    sget-object v7, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->DISALLOWED_NETS:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    invoke-virtual {v6, v7}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->getString(Lcom/motorola/otalib/common/settings/ISetting;)Ljava/lang/String;

    move-result-object v7

    iget-object v6, p0, Lcom/motorola/ccc/ota/installer/updaterEngine/StreamingUpdate$UECallbackHandler;->this$0:Lcom/motorola/ccc/ota/installer/updaterEngine/StreamingUpdate;

    iget-object v6, v6, Lcom/motorola/ccc/ota/installer/updaterEngine/StreamingUpdate;->_settings:Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    sget-object v8, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->DOWNLOAD_DESCRIPTOR:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    invoke-virtual {v6, v8}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->getString(Lcom/motorola/otalib/common/settings/ISetting;)Ljava/lang/String;

    move-result-object v8

    move-object v6, v1

    invoke-virtual/range {v3 .. v8}, Lcom/motorola/otalib/downloadservice/download/policy/DownloadPolicy;->canIUseZeroRatedNetwork(Landroid/content/Context;ZLjava/lang/String;Ljava/lang/String;Ljava/lang/String;)Z

    move-result v3

    if-nez v3, :cond_7

    iget-object v3, p0, Lcom/motorola/ccc/ota/installer/updaterEngine/StreamingUpdate$UECallbackHandler;->this$0:Lcom/motorola/ccc/ota/installer/updaterEngine/StreamingUpdate;

    invoke-static {v3}, Lcom/motorola/ccc/ota/installer/updaterEngine/StreamingUpdate;->-$$Nest$fgetdlBuilder(Lcom/motorola/ccc/ota/installer/updaterEngine/StreamingUpdate;)Lcom/motorola/ccc/ota/installer/updaterEngine/download/UEDownloadRequestBuilder;

    move-result-object v3

    iget-object v4, p0, Lcom/motorola/ccc/ota/installer/updaterEngine/StreamingUpdate$UECallbackHandler;->this$0:Lcom/motorola/ccc/ota/installer/updaterEngine/StreamingUpdate;

    invoke-static {v4}, Lcom/motorola/ccc/ota/installer/updaterEngine/StreamingUpdate;->-$$Nest$fgetcontext(Lcom/motorola/ccc/ota/installer/updaterEngine/StreamingUpdate;)Landroid/content/Context;

    move-result-object v4

    iget-object v5, p0, Lcom/motorola/ccc/ota/installer/updaterEngine/StreamingUpdate$UECallbackHandler;->this$0:Lcom/motorola/ccc/ota/installer/updaterEngine/StreamingUpdate;

    iget-object v5, v5, Lcom/motorola/ccc/ota/installer/updaterEngine/StreamingUpdate;->_settings:Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    sget-object v6, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->DISALLOWED_NETS:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    invoke-virtual {v5, v6}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->getString(Lcom/motorola/otalib/common/settings/ISetting;)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v3, v4, v1, v5, v2}, Lcom/motorola/ccc/ota/installer/updaterEngine/download/UEDownloadRequestBuilder;->fetchNonAdminapnNetworkDetails(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Z)Lcom/motorola/ccc/ota/installer/updaterEngine/download/UEDownloadRequestBuilder$NetworkDetails;

    move-result-object v1

    invoke-static {v1}, Lcom/motorola/ccc/ota/installer/updaterEngine/StreamingUpdate;->-$$Nest$sfputnetworkDetails(Lcom/motorola/ccc/ota/installer/updaterEngine/download/UEDownloadRequestBuilder$NetworkDetails;)V

    iget-object v1, p0, Lcom/motorola/ccc/ota/installer/updaterEngine/StreamingUpdate$UECallbackHandler;->this$0:Lcom/motorola/ccc/ota/installer/updaterEngine/StreamingUpdate;

    invoke-static {}, Lcom/motorola/ccc/ota/installer/updaterEngine/StreamingUpdate;->-$$Nest$sfgetnetworkDetails()Lcom/motorola/ccc/ota/installer/updaterEngine/download/UEDownloadRequestBuilder$NetworkDetails;

    move-result-object v3

    invoke-virtual {v3}, Lcom/motorola/ccc/ota/installer/updaterEngine/download/UEDownloadRequestBuilder$NetworkDetails;->getDownloadingChoices()Lcom/motorola/ccc/ota/installer/updaterEngine/download/UEDownloadRequestBuilder$DownloadingChoices;

    move-result-object v3

    invoke-static {v1, v3}, Lcom/motorola/ccc/ota/installer/updaterEngine/StreamingUpdate;->-$$Nest$fputdownloadingChoices(Lcom/motorola/ccc/ota/installer/updaterEngine/StreamingUpdate;Lcom/motorola/ccc/ota/installer/updaterEngine/download/UEDownloadRequestBuilder$DownloadingChoices;)V

    sget-object v1, Lcom/motorola/ccc/ota/installer/updaterEngine/download/UEDownloadRequestBuilder$DownloadingChoices;->WIFI_ONLY:Lcom/motorola/ccc/ota/installer/updaterEngine/download/UEDownloadRequestBuilder$DownloadingChoices;

    iget-object v3, p0, Lcom/motorola/ccc/ota/installer/updaterEngine/StreamingUpdate$UECallbackHandler;->this$0:Lcom/motorola/ccc/ota/installer/updaterEngine/StreamingUpdate;

    invoke-static {v3}, Lcom/motorola/ccc/ota/installer/updaterEngine/StreamingUpdate;->-$$Nest$fgetdownloadingChoices(Lcom/motorola/ccc/ota/installer/updaterEngine/StreamingUpdate;)Lcom/motorola/ccc/ota/installer/updaterEngine/download/UEDownloadRequestBuilder$DownloadingChoices;

    move-result-object v3

    if-ne v1, v3, :cond_4

    iget-object v0, p0, Lcom/motorola/ccc/ota/installer/updaterEngine/StreamingUpdate$UECallbackHandler;->this$0:Lcom/motorola/ccc/ota/installer/updaterEngine/StreamingUpdate;

    invoke-static {v0}, Lcom/motorola/ccc/ota/installer/updaterEngine/StreamingUpdate;->-$$Nest$mstartWifiDiscoveryManager(Lcom/motorola/ccc/ota/installer/updaterEngine/StreamingUpdate;)V

    iget-object v0, p0, Lcom/motorola/ccc/ota/installer/updaterEngine/StreamingUpdate$UECallbackHandler;->this$0:Lcom/motorola/ccc/ota/installer/updaterEngine/StreamingUpdate;

    invoke-virtual {v0}, Lcom/motorola/ccc/ota/installer/updaterEngine/StreamingUpdate;->clearUEInstallerBeforeExit()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit p0

    return-void

    :cond_4
    :try_start_1
    sget-object v1, Lcom/motorola/ccc/ota/installer/updaterEngine/download/UEDownloadRequestBuilder$DownloadingChoices;->WIFI_OK:Lcom/motorola/ccc/ota/installer/updaterEngine/download/UEDownloadRequestBuilder$DownloadingChoices;

    iget-object v3, p0, Lcom/motorola/ccc/ota/installer/updaterEngine/StreamingUpdate$UECallbackHandler;->this$0:Lcom/motorola/ccc/ota/installer/updaterEngine/StreamingUpdate;

    invoke-static {v3}, Lcom/motorola/ccc/ota/installer/updaterEngine/StreamingUpdate;->-$$Nest$fgetdownloadingChoices(Lcom/motorola/ccc/ota/installer/updaterEngine/StreamingUpdate;)Lcom/motorola/ccc/ota/installer/updaterEngine/download/UEDownloadRequestBuilder$DownloadingChoices;

    move-result-object v3

    if-eq v1, v3, :cond_5

    sget-object v1, Lcom/motorola/ccc/ota/installer/updaterEngine/download/UEDownloadRequestBuilder$DownloadingChoices;->WAN_OK:Lcom/motorola/ccc/ota/installer/updaterEngine/download/UEDownloadRequestBuilder$DownloadingChoices;

    iget-object v3, p0, Lcom/motorola/ccc/ota/installer/updaterEngine/StreamingUpdate$UECallbackHandler;->this$0:Lcom/motorola/ccc/ota/installer/updaterEngine/StreamingUpdate;

    invoke-static {v3}, Lcom/motorola/ccc/ota/installer/updaterEngine/StreamingUpdate;->-$$Nest$fgetdownloadingChoices(Lcom/motorola/ccc/ota/installer/updaterEngine/StreamingUpdate;)Lcom/motorola/ccc/ota/installer/updaterEngine/download/UEDownloadRequestBuilder$DownloadingChoices;

    move-result-object v3

    if-eq v1, v3, :cond_5

    iget-object v0, p0, Lcom/motorola/ccc/ota/installer/updaterEngine/StreamingUpdate$UECallbackHandler;->this$0:Lcom/motorola/ccc/ota/installer/updaterEngine/StreamingUpdate;

    iget-object v1, v0, Lcom/motorola/ccc/ota/installer/updaterEngine/StreamingUpdate;->_settings:Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    sget-object v3, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->STORED_AB_PROGRESS_PERCENT:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    invoke-virtual {v1, v3, v10}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->getFloat(Lcom/motorola/otalib/common/settings/ISetting;F)F

    move-result v1

    iget-object v3, p0, Lcom/motorola/ccc/ota/installer/updaterEngine/StreamingUpdate$UECallbackHandler;->this$0:Lcom/motorola/ccc/ota/installer/updaterEngine/StreamingUpdate;

    iget-object v3, v3, Lcom/motorola/ccc/ota/installer/updaterEngine/StreamingUpdate;->_settings:Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    sget-object v4, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->STORED_AB_STATUS:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    invoke-virtual {v3, v4, v2}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->getInt(Lcom/motorola/otalib/common/settings/ISetting;I)I

    move-result v2

    invoke-static {v0, v1, v2, v9}, Lcom/motorola/ccc/ota/installer/updaterEngine/StreamingUpdate;->-$$Nest$msendUpgradeStatus(Lcom/motorola/ccc/ota/installer/updaterEngine/StreamingUpdate;FII)V

    iget-object v0, p0, Lcom/motorola/ccc/ota/installer/updaterEngine/StreamingUpdate$UECallbackHandler;->this$0:Lcom/motorola/ccc/ota/installer/updaterEngine/StreamingUpdate;

    invoke-virtual {v0}, Lcom/motorola/ccc/ota/installer/updaterEngine/StreamingUpdate;->clearUEInstallerBeforeExit()V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    monitor-exit p0

    return-void

    :cond_5
    :try_start_2
    sget-object v1, Lcom/motorola/ccc/ota/installer/updaterEngine/download/UEDownloadRequestBuilder$DownloadingChoices;->WAN_OK:Lcom/motorola/ccc/ota/installer/updaterEngine/download/UEDownloadRequestBuilder$DownloadingChoices;

    iget-object v3, p0, Lcom/motorola/ccc/ota/installer/updaterEngine/StreamingUpdate$UECallbackHandler;->this$0:Lcom/motorola/ccc/ota/installer/updaterEngine/StreamingUpdate;

    invoke-static {v3}, Lcom/motorola/ccc/ota/installer/updaterEngine/StreamingUpdate;->-$$Nest$fgetdownloadingChoices(Lcom/motorola/ccc/ota/installer/updaterEngine/StreamingUpdate;)Lcom/motorola/ccc/ota/installer/updaterEngine/download/UEDownloadRequestBuilder$DownloadingChoices;

    move-result-object v3

    if-ne v1, v3, :cond_8

    iget-object v1, p0, Lcom/motorola/ccc/ota/installer/updaterEngine/StreamingUpdate$UECallbackHandler;->this$0:Lcom/motorola/ccc/ota/installer/updaterEngine/StreamingUpdate;

    invoke-static {v1}, Lcom/motorola/ccc/ota/installer/updaterEngine/StreamingUpdate;->-$$Nest$fgetd(Lcom/motorola/ccc/ota/installer/updaterEngine/StreamingUpdate;)Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database$Descriptor;

    move-result-object v1

    invoke-interface {v1}, Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database$Descriptor;->getMeta()Lcom/motorola/otalib/common/metaData/MetaData;

    move-result-object v1

    invoke-virtual {v1}, Lcom/motorola/otalib/common/metaData/MetaData;->getForceDownloadTime()D

    move-result-wide v3

    const-wide/16 v5, 0x0

    cmpl-double v1, v3, v5

    if-gez v1, :cond_6

    iget-object v1, p0, Lcom/motorola/ccc/ota/installer/updaterEngine/StreamingUpdate$UECallbackHandler;->this$0:Lcom/motorola/ccc/ota/installer/updaterEngine/StreamingUpdate;

    iget-object v1, v1, Lcom/motorola/ccc/ota/installer/updaterEngine/StreamingUpdate;->_settings:Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    invoke-static {v1}, Lcom/motorola/ccc/ota/utils/SmartUpdateUtils;->isDownloadForcedForSmartUpdate(Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;)Z

    move-result v1

    if-eqz v1, :cond_8

    :cond_6
    invoke-static {}, Lcom/motorola/ccc/ota/ui/UpdaterUtils;->getAutomaticDownloadForCellular()Z

    move-result v1

    if-nez v1, :cond_8

    const-string v0, "OtaApp"

    const-string v1, "StreamingUpdate.onApplyPayload, Forced update,but not on wifi, so return"

    invoke-static {v0, v1}, Lcom/motorola/ccc/ota/utils/Logger;->debug(Ljava/lang/String;Ljava/lang/String;)V

    iget-object v0, p0, Lcom/motorola/ccc/ota/installer/updaterEngine/StreamingUpdate$UECallbackHandler;->this$0:Lcom/motorola/ccc/ota/installer/updaterEngine/StreamingUpdate;

    iget-object v1, v0, Lcom/motorola/ccc/ota/installer/updaterEngine/StreamingUpdate;->_settings:Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    sget-object v3, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->STORED_AB_PROGRESS_PERCENT:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    invoke-virtual {v1, v3, v10}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->getFloat(Lcom/motorola/otalib/common/settings/ISetting;F)F

    move-result v1

    iget-object v3, p0, Lcom/motorola/ccc/ota/installer/updaterEngine/StreamingUpdate$UECallbackHandler;->this$0:Lcom/motorola/ccc/ota/installer/updaterEngine/StreamingUpdate;

    iget-object v3, v3, Lcom/motorola/ccc/ota/installer/updaterEngine/StreamingUpdate;->_settings:Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    sget-object v4, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->STORED_AB_STATUS:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    invoke-virtual {v3, v4, v2}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->getInt(Lcom/motorola/otalib/common/settings/ISetting;I)I

    move-result v2

    invoke-static {v0, v1, v2, v9}, Lcom/motorola/ccc/ota/installer/updaterEngine/StreamingUpdate;->-$$Nest$msendUpgradeStatus(Lcom/motorola/ccc/ota/installer/updaterEngine/StreamingUpdate;FII)V

    iget-object v0, p0, Lcom/motorola/ccc/ota/installer/updaterEngine/StreamingUpdate$UECallbackHandler;->this$0:Lcom/motorola/ccc/ota/installer/updaterEngine/StreamingUpdate;

    invoke-virtual {v0}, Lcom/motorola/ccc/ota/installer/updaterEngine/StreamingUpdate;->clearUEInstallerBeforeExit()V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    monitor-exit p0

    return-void

    :cond_7
    :try_start_3
    iget-object v1, p0, Lcom/motorola/ccc/ota/installer/updaterEngine/StreamingUpdate$UECallbackHandler;->this$0:Lcom/motorola/ccc/ota/installer/updaterEngine/StreamingUpdate;

    invoke-static {v1}, Lcom/motorola/ccc/ota/installer/updaterEngine/StreamingUpdate;->-$$Nest$fgetod(Lcom/motorola/ccc/ota/installer/updaterEngine/StreamingUpdate;)Lcom/motorola/otalib/downloadservice/download/policy/DownloadPolicy;

    move-result-object v1

    invoke-virtual {v1}, Lcom/motorola/otalib/downloadservice/download/policy/DownloadPolicy;->canIDownloadUsingZeroRatedChannel()Z

    move-result v1

    if-eqz v1, :cond_a

    const-string v1, "OtaApp"

    const-string v3, "handleDownloadServiceRequest: can be downloaded now; reason zero rated NW is available"

    invoke-static {v1, v3}, Lcom/motorola/ccc/ota/utils/Logger;->debug(Ljava/lang/String;Ljava/lang/String;)V

    iget-object v1, p0, Lcom/motorola/ccc/ota/installer/updaterEngine/StreamingUpdate$UECallbackHandler;->this$0:Lcom/motorola/ccc/ota/installer/updaterEngine/StreamingUpdate;

    invoke-static {v1}, Lcom/motorola/ccc/ota/installer/updaterEngine/StreamingUpdate;->-$$Nest$fgetdlBuilder(Lcom/motorola/ccc/ota/installer/updaterEngine/StreamingUpdate;)Lcom/motorola/ccc/ota/installer/updaterEngine/download/UEDownloadRequestBuilder;

    move-result-object v1

    invoke-virtual {v1}, Lcom/motorola/ccc/ota/installer/updaterEngine/download/UEDownloadRequestBuilder;->fetchAdminapnNetworkDetails()Lcom/motorola/ccc/ota/installer/updaterEngine/download/UEDownloadRequestBuilder$NetworkDetails;

    move-result-object v1

    invoke-static {v1}, Lcom/motorola/ccc/ota/installer/updaterEngine/StreamingUpdate;->-$$Nest$sfputnetworkDetails(Lcom/motorola/ccc/ota/installer/updaterEngine/download/UEDownloadRequestBuilder$NetworkDetails;)V

    :cond_8
    iget-object v1, p0, Lcom/motorola/ccc/ota/installer/updaterEngine/StreamingUpdate$UECallbackHandler;->this$0:Lcom/motorola/ccc/ota/installer/updaterEngine/StreamingUpdate;

    iget-object v1, v1, Lcom/motorola/ccc/ota/installer/updaterEngine/StreamingUpdate;->_settings:Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    invoke-static {v1, v2}, Lcom/motorola/ccc/ota/env/CusAndroidUtils;->checkForUrlExpiry(Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;Z)Z

    move-result v1

    if-eqz v1, :cond_9

    iget-object v1, p0, Lcom/motorola/ccc/ota/installer/updaterEngine/StreamingUpdate$UECallbackHandler;->this$0:Lcom/motorola/ccc/ota/installer/updaterEngine/StreamingUpdate;

    iget-object v1, v1, Lcom/motorola/ccc/ota/installer/updaterEngine/StreamingUpdate;->_settings:Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    sget-object v3, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->OTA_GET_DESCRIPTOR_REASON:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    const-string v4, "URL timeout"

    invoke-virtual {v1, v3, v4}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->setString(Lcom/motorola/otalib/common/settings/ISetting;Ljava/lang/String;)V

    iget-object v1, p0, Lcom/motorola/ccc/ota/installer/updaterEngine/StreamingUpdate$UECallbackHandler;->this$0:Lcom/motorola/ccc/ota/installer/updaterEngine/StreamingUpdate;

    invoke-static {v1}, Lcom/motorola/ccc/ota/installer/updaterEngine/StreamingUpdate;->-$$Nest$fgetcontext(Lcom/motorola/ccc/ota/installer/updaterEngine/StreamingUpdate;)Landroid/content/Context;

    move-result-object v1

    iget-object v3, p0, Lcom/motorola/ccc/ota/installer/updaterEngine/StreamingUpdate$UECallbackHandler;->this$0:Lcom/motorola/ccc/ota/installer/updaterEngine/StreamingUpdate;

    iget-object v3, v3, Lcom/motorola/ccc/ota/installer/updaterEngine/StreamingUpdate;->mVersion:Ljava/lang/String;

    const-string v4, "encountered url timeout go and fetch new download url"

    invoke-static {v1, v3, v4, v2}, Lcom/motorola/ccc/ota/env/CusAndroidUtils;->sendGetDescriptor(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Z)V

    iget-object v1, p0, Lcom/motorola/ccc/ota/installer/updaterEngine/StreamingUpdate$UECallbackHandler;->this$0:Lcom/motorola/ccc/ota/installer/updaterEngine/StreamingUpdate;

    iget-object v3, v1, Lcom/motorola/ccc/ota/installer/updaterEngine/StreamingUpdate;->_settings:Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    sget-object v4, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->STORED_AB_PROGRESS_PERCENT:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    invoke-virtual {v3, v4, v10}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->getFloat(Lcom/motorola/otalib/common/settings/ISetting;F)F

    move-result v3

    iget-object v4, p0, Lcom/motorola/ccc/ota/installer/updaterEngine/StreamingUpdate$UECallbackHandler;->this$0:Lcom/motorola/ccc/ota/installer/updaterEngine/StreamingUpdate;

    iget-object v4, v4, Lcom/motorola/ccc/ota/installer/updaterEngine/StreamingUpdate;->_settings:Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    sget-object v5, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->STORED_AB_STATUS:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    invoke-virtual {v4, v5, v2}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->getInt(Lcom/motorola/otalib/common/settings/ISetting;I)I

    move-result v2

    invoke-static {v1, v3, v2, v0}, Lcom/motorola/ccc/ota/installer/updaterEngine/StreamingUpdate;->-$$Nest$msendUpgradeStatus(Lcom/motorola/ccc/ota/installer/updaterEngine/StreamingUpdate;FII)V

    iget-object v0, p0, Lcom/motorola/ccc/ota/installer/updaterEngine/StreamingUpdate$UECallbackHandler;->this$0:Lcom/motorola/ccc/ota/installer/updaterEngine/StreamingUpdate;

    invoke-virtual {v0}, Lcom/motorola/ccc/ota/installer/updaterEngine/StreamingUpdate;->clearUEInstallerBeforeExit()V

    iget-object v0, p0, Lcom/motorola/ccc/ota/installer/updaterEngine/StreamingUpdate$UECallbackHandler;->this$0:Lcom/motorola/ccc/ota/installer/updaterEngine/StreamingUpdate;

    invoke-virtual {v0}, Lcom/motorola/ccc/ota/installer/updaterEngine/StreamingUpdate;->clearRetryTasks()V
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    monitor-exit p0

    return-void

    :cond_9
    :try_start_4
    iget-object v0, p0, Lcom/motorola/ccc/ota/installer/updaterEngine/StreamingUpdate$UECallbackHandler;->this$0:Lcom/motorola/ccc/ota/installer/updaterEngine/StreamingUpdate;

    invoke-static {v0}, Lcom/motorola/ccc/ota/installer/updaterEngine/StreamingUpdate;->-$$Nest$mcheckAndStopWifiDiscoveryManager(Lcom/motorola/ccc/ota/installer/updaterEngine/StreamingUpdate;)V

    iget-object v0, p0, Lcom/motorola/ccc/ota/installer/updaterEngine/StreamingUpdate$UECallbackHandler;->this$0:Lcom/motorola/ccc/ota/installer/updaterEngine/StreamingUpdate;

    invoke-static {v0}, Lcom/motorola/ccc/ota/installer/updaterEngine/StreamingUpdate;->-$$Nest$fgetdlBuilder(Lcom/motorola/ccc/ota/installer/updaterEngine/StreamingUpdate;)Lcom/motorola/ccc/ota/installer/updaterEngine/download/UEDownloadRequestBuilder;

    move-result-object v1

    invoke-static {}, Lcom/motorola/ccc/ota/installer/updaterEngine/StreamingUpdate;->-$$Nest$sfgetnetworkDetails()Lcom/motorola/ccc/ota/installer/updaterEngine/download/UEDownloadRequestBuilder$NetworkDetails;

    move-result-object v3

    iget-object v4, p0, Lcom/motorola/ccc/ota/installer/updaterEngine/StreamingUpdate$UECallbackHandler;->this$0:Lcom/motorola/ccc/ota/installer/updaterEngine/StreamingUpdate;

    invoke-static {v4}, Lcom/motorola/ccc/ota/installer/updaterEngine/StreamingUpdate;->-$$Nest$fgetd(Lcom/motorola/ccc/ota/installer/updaterEngine/StreamingUpdate;)Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database$Descriptor;

    move-result-object v4

    invoke-interface {v4}, Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database$Descriptor;->getMeta()Lcom/motorola/otalib/common/metaData/MetaData;

    move-result-object v4

    invoke-virtual {v4}, Lcom/motorola/otalib/common/metaData/MetaData;->getStreamingData()Lorg/json/JSONObject;

    move-result-object v4

    invoke-virtual {v1, v3, v4}, Lcom/motorola/ccc/ota/installer/updaterEngine/download/UEDownloadRequestBuilder;->build(Lcom/motorola/ccc/ota/installer/updaterEngine/download/UEDownloadRequestBuilder$NetworkDetails;Lorg/json/JSONObject;)Lcom/motorola/ccc/ota/installer/updaterEngine/download/DownloadRequestToUE;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/motorola/ccc/ota/installer/updaterEngine/StreamingUpdate;->-$$Nest$fputrequest(Lcom/motorola/ccc/ota/installer/updaterEngine/StreamingUpdate;Lcom/motorola/ccc/ota/installer/updaterEngine/download/DownloadRequestToUE;)V

    iget-object v0, p0, Lcom/motorola/ccc/ota/installer/updaterEngine/StreamingUpdate$UECallbackHandler;->this$0:Lcom/motorola/ccc/ota/installer/updaterEngine/StreamingUpdate;

    invoke-static {v0}, Lcom/motorola/ccc/ota/installer/updaterEngine/StreamingUpdate;->-$$Nest$fgetrequest(Lcom/motorola/ccc/ota/installer/updaterEngine/StreamingUpdate;)Lcom/motorola/ccc/ota/installer/updaterEngine/download/DownloadRequestToUE;

    move-result-object v0

    invoke-virtual {v0}, Lcom/motorola/ccc/ota/installer/updaterEngine/download/DownloadRequestToUE;->getDownloadUrl()Ljava/lang/String;

    move-result-object v3

    iget-object v0, p0, Lcom/motorola/ccc/ota/installer/updaterEngine/StreamingUpdate$UECallbackHandler;->this$0:Lcom/motorola/ccc/ota/installer/updaterEngine/StreamingUpdate;

    invoke-static {v0}, Lcom/motorola/ccc/ota/installer/updaterEngine/StreamingUpdate;->-$$Nest$fgetrequest(Lcom/motorola/ccc/ota/installer/updaterEngine/StreamingUpdate;)Lcom/motorola/ccc/ota/installer/updaterEngine/download/DownloadRequestToUE;

    move-result-object v0

    invoke-virtual {v0}, Lcom/motorola/ccc/ota/installer/updaterEngine/download/DownloadRequestToUE;->getOffSet()J

    move-result-wide v4

    iget-object v0, p0, Lcom/motorola/ccc/ota/installer/updaterEngine/StreamingUpdate$UECallbackHandler;->this$0:Lcom/motorola/ccc/ota/installer/updaterEngine/StreamingUpdate;

    invoke-static {v0}, Lcom/motorola/ccc/ota/installer/updaterEngine/StreamingUpdate;->-$$Nest$fgetrequest(Lcom/motorola/ccc/ota/installer/updaterEngine/StreamingUpdate;)Lcom/motorola/ccc/ota/installer/updaterEngine/download/DownloadRequestToUE;

    move-result-object v0

    invoke-virtual {v0}, Lcom/motorola/ccc/ota/installer/updaterEngine/download/DownloadRequestToUE;->getFileSize()J

    move-result-wide v6

    iget-object v0, p0, Lcom/motorola/ccc/ota/installer/updaterEngine/StreamingUpdate$UECallbackHandler;->this$0:Lcom/motorola/ccc/ota/installer/updaterEngine/StreamingUpdate;

    invoke-static {v0}, Lcom/motorola/ccc/ota/installer/updaterEngine/StreamingUpdate;->-$$Nest$fgetrequest(Lcom/motorola/ccc/ota/installer/updaterEngine/StreamingUpdate;)Lcom/motorola/ccc/ota/installer/updaterEngine/download/DownloadRequestToUE;

    move-result-object v0

    invoke-virtual {v0}, Lcom/motorola/ccc/ota/installer/updaterEngine/download/DownloadRequestToUE;->getHeaderKeyValuePair()[Ljava/lang/String;

    move-result-object v8

    invoke-static/range {v3 .. v8}, Lcom/motorola/ccc/ota/installer/updaterEngine/common/UpdaterEngineHelper;->applyPayload(Ljava/lang/String;JJ[Ljava/lang/String;)V

    iget-object v0, p0, Lcom/motorola/ccc/ota/installer/updaterEngine/StreamingUpdate$UECallbackHandler;->this$0:Lcom/motorola/ccc/ota/installer/updaterEngine/StreamingUpdate;

    invoke-virtual {v0, v2, v10}, Lcom/motorola/ccc/ota/installer/updaterEngine/StreamingUpdate;->setExpiryAlarmForUE(IF)V

    iget-object v0, p0, Lcom/motorola/ccc/ota/installer/updaterEngine/StreamingUpdate$UECallbackHandler;->this$0:Lcom/motorola/ccc/ota/installer/updaterEngine/StreamingUpdate;

    invoke-static {v0}, Lcom/motorola/ccc/ota/installer/updaterEngine/StreamingUpdate;->-$$Nest$fgetcontext(Lcom/motorola/ccc/ota/installer/updaterEngine/StreamingUpdate;)Landroid/content/Context;

    move-result-object v0

    invoke-static {v0}, Lcom/motorola/ccc/ota/installer/updaterEngine/common/InstallerUtilMethods;->sendActionABApplyPayloadStarted(Landroid/content/Context;)V

    invoke-static {}, Lcom/motorola/ccc/ota/installer/updaterEngine/common/InstallerUtilMethods;->acquireWakeLock()V
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_0

    monitor-exit p0

    return-void

    :cond_a
    :try_start_5
    const-string v0, "OtaApp"

    const-string v1, "handleDownloadServiceRequest: cannot be downloaded now; reason zero rated NW is not available"

    invoke-static {v0, v1}, Lcom/motorola/ccc/ota/utils/Logger;->debug(Ljava/lang/String;Ljava/lang/String;)V

    iget-object v0, p0, Lcom/motorola/ccc/ota/installer/updaterEngine/StreamingUpdate$UECallbackHandler;->this$0:Lcom/motorola/ccc/ota/installer/updaterEngine/StreamingUpdate;

    invoke-static {v0}, Lcom/motorola/ccc/ota/installer/updaterEngine/StreamingUpdate;->-$$Nest$fgetod(Lcom/motorola/ccc/ota/installer/updaterEngine/StreamingUpdate;)Lcom/motorola/otalib/downloadservice/download/policy/DownloadPolicy;

    move-result-object v0

    invoke-virtual {v0}, Lcom/motorola/otalib/downloadservice/download/policy/DownloadPolicy;->startZeroRatedProcess()V
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_0

    monitor-exit p0

    return-void

    :cond_b
    :goto_0
    :try_start_6
    iget-object v0, p0, Lcom/motorola/ccc/ota/installer/updaterEngine/StreamingUpdate$UECallbackHandler;->this$0:Lcom/motorola/ccc/ota/installer/updaterEngine/StreamingUpdate;

    iget-object v1, v0, Lcom/motorola/ccc/ota/installer/updaterEngine/StreamingUpdate;->_settings:Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    sget-object v3, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->STORED_AB_PROGRESS_PERCENT:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    invoke-virtual {v1, v3, v10}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->getFloat(Lcom/motorola/otalib/common/settings/ISetting;F)F

    move-result v1

    iget-object v3, p0, Lcom/motorola/ccc/ota/installer/updaterEngine/StreamingUpdate$UECallbackHandler;->this$0:Lcom/motorola/ccc/ota/installer/updaterEngine/StreamingUpdate;

    iget-object v3, v3, Lcom/motorola/ccc/ota/installer/updaterEngine/StreamingUpdate;->_settings:Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    sget-object v4, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->STORED_AB_STATUS:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    invoke-virtual {v3, v4, v2}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->getInt(Lcom/motorola/otalib/common/settings/ISetting;I)I

    move-result v2

    invoke-static {v0, v1, v2, v9}, Lcom/motorola/ccc/ota/installer/updaterEngine/StreamingUpdate;->-$$Nest$msendUpgradeStatus(Lcom/motorola/ccc/ota/installer/updaterEngine/StreamingUpdate;FII)V

    iget-object v0, p0, Lcom/motorola/ccc/ota/installer/updaterEngine/StreamingUpdate$UECallbackHandler;->this$0:Lcom/motorola/ccc/ota/installer/updaterEngine/StreamingUpdate;

    invoke-virtual {v0}, Lcom/motorola/ccc/ota/installer/updaterEngine/StreamingUpdate;->clearUEInstallerBeforeExit()V
    :try_end_6
    .catchall {:try_start_6 .. :try_end_6} :catchall_0

    monitor-exit p0

    return-void

    :cond_c
    :goto_1
    :try_start_7
    sget v0, Lcom/motorola/otalib/common/errorCodes/UpdaterEngineErrorCodes;->ERROR_EXCEPTION:I

    const-string v1, "onApplyPayload:error while parsing the metadata"

    const-string v2, "PARSE_ERROR."

    invoke-virtual {p0, v0, v1, v2}, Lcom/motorola/ccc/ota/installer/updaterEngine/StreamingUpdate$UECallbackHandler;->onCompleted(ILjava/lang/String;Ljava/lang/String;)V
    :try_end_7
    .catchall {:try_start_7 .. :try_end_7} :catchall_0

    monitor-exit p0

    return-void

    :cond_d
    :goto_2
    monitor-exit p0

    return-void

    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method


# virtual methods
.method public onCompleted(ILjava/lang/String;Ljava/lang/String;)V
    .locals 6

    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "StreamingUpdate:onCompleted: errorcode "

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

    sget-object v0, Lcom/motorola/ccc/ota/installer/updaterEngine/common/UpdaterEngineHelper;->metricsFilePath:Ljava/lang/String;

    invoke-static {v0}, Lcom/motorola/ccc/ota/installer/updaterEngine/common/UpdaterEngineHelper;->getJsonDataFromFile(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    if-eqz v0, :cond_0

    iget-object v2, p0, Lcom/motorola/ccc/ota/installer/updaterEngine/StreamingUpdate$UECallbackHandler;->this$0:Lcom/motorola/ccc/ota/installer/updaterEngine/StreamingUpdate;

    iget-object v2, v2, Lcom/motorola/ccc/ota/installer/updaterEngine/StreamingUpdate;->_settings:Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    invoke-static {v2, v0}, Lcom/motorola/ccc/ota/stats/StatsHelper;->setStreamingStats(Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;Ljava/lang/String;)V

    :cond_0
    sget v0, Lcom/motorola/otalib/common/errorCodes/UpdaterEngineErrorCodes;->K_SUCCESS:I

    const/4 v2, 0x0

    const/4 v3, 0x1

    if-ne p1, v0, :cond_1

    sget-object p0, Lcom/motorola/ccc/ota/installer/updaterEngine/UpdaterEngineInstaller;->updaterEngineStateHandler:Lcom/motorola/ccc/ota/installer/updaterEngine/common/UpdaterEngineStateHandler;

    invoke-static {}, Lcom/motorola/ccc/ota/env/OtaApplication;->getGlobalContext()Landroid/content/Context;

    move-result-object p1

    invoke-virtual {p0, p1, v3, v2, p3}, Lcom/motorola/ccc/ota/installer/updaterEngine/common/UpdaterEngineStateHandler;->transferUpgradeBackToOta(Landroid/content/Context;ZLjava/lang/String;Ljava/lang/String;)V

    return-void

    :cond_1
    sget v0, Lcom/motorola/otalib/common/errorCodes/UpdaterEngineErrorCodes;->ERROR_NETWORK:I

    const/4 v4, 0x0

    const/4 v5, 0x0

    if-ne p1, v0, :cond_4

    iget-object p1, p0, Lcom/motorola/ccc/ota/installer/updaterEngine/StreamingUpdate$UECallbackHandler;->this$0:Lcom/motorola/ccc/ota/installer/updaterEngine/StreamingUpdate;

    invoke-static {p1}, Lcom/motorola/ccc/ota/installer/updaterEngine/StreamingUpdate;->-$$Nest$fgetmCm(Lcom/motorola/ccc/ota/installer/updaterEngine/StreamingUpdate;)Landroid/net/ConnectivityManager;

    move-result-object p1

    invoke-static {p1}, Lcom/motorola/otalib/common/utils/NetworkUtils;->isNetWorkConnected(Landroid/net/ConnectivityManager;)Z

    move-result p1

    if-eqz p1, :cond_3

    iget-object p1, p0, Lcom/motorola/ccc/ota/installer/updaterEngine/StreamingUpdate$UECallbackHandler;->this$0:Lcom/motorola/ccc/ota/installer/updaterEngine/StreamingUpdate;

    iget-object p1, p1, Lcom/motorola/ccc/ota/installer/updaterEngine/StreamingUpdate;->_settings:Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    invoke-static {p1}, Lcom/motorola/ccc/ota/installer/updaterEngine/common/InstallerUtilMethods;->getAdminApnUrl(Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;)Ljava/lang/String;

    move-result-object p1

    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result p1

    if-nez p1, :cond_2

    iget-object p1, p0, Lcom/motorola/ccc/ota/installer/updaterEngine/StreamingUpdate$UECallbackHandler;->this$0:Lcom/motorola/ccc/ota/installer/updaterEngine/StreamingUpdate;

    invoke-static {p1}, Lcom/motorola/ccc/ota/installer/updaterEngine/StreamingUpdate;->-$$Nest$fgetod(Lcom/motorola/ccc/ota/installer/updaterEngine/StreamingUpdate;)Lcom/motorola/otalib/downloadservice/download/policy/DownloadPolicy;

    move-result-object p1

    invoke-virtual {p1}, Lcom/motorola/otalib/downloadservice/download/policy/DownloadPolicy;->stopUsingZeroRatedChannel()V

    :cond_2
    iget-object p0, p0, Lcom/motorola/ccc/ota/installer/updaterEngine/StreamingUpdate$UECallbackHandler;->this$0:Lcom/motorola/ccc/ota/installer/updaterEngine/StreamingUpdate;

    invoke-virtual {p0}, Lcom/motorola/ccc/ota/installer/updaterEngine/StreamingUpdate;->restartOnProgress()V

    return-void

    :cond_3
    iget-object p1, p0, Lcom/motorola/ccc/ota/installer/updaterEngine/StreamingUpdate$UECallbackHandler;->this$0:Lcom/motorola/ccc/ota/installer/updaterEngine/StreamingUpdate;

    iget-object p2, p1, Lcom/motorola/ccc/ota/installer/updaterEngine/StreamingUpdate;->_settings:Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    sget-object p3, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->STORED_AB_PROGRESS_PERCENT:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    invoke-virtual {p2, p3, v4}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->getFloat(Lcom/motorola/otalib/common/settings/ISetting;F)F

    move-result p2

    iget-object p3, p0, Lcom/motorola/ccc/ota/installer/updaterEngine/StreamingUpdate$UECallbackHandler;->this$0:Lcom/motorola/ccc/ota/installer/updaterEngine/StreamingUpdate;

    iget-object p3, p3, Lcom/motorola/ccc/ota/installer/updaterEngine/StreamingUpdate;->_settings:Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    sget-object v0, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->STORED_AB_STATUS:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    invoke-virtual {p3, v0, v5}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->getInt(Lcom/motorola/otalib/common/settings/ISetting;I)I

    move-result p3

    const/4 v0, -0x1

    invoke-static {p1, p2, p3, v0}, Lcom/motorola/ccc/ota/installer/updaterEngine/StreamingUpdate;->-$$Nest$msendUpgradeStatus(Lcom/motorola/ccc/ota/installer/updaterEngine/StreamingUpdate;FII)V

    iget-object p0, p0, Lcom/motorola/ccc/ota/installer/updaterEngine/StreamingUpdate$UECallbackHandler;->this$0:Lcom/motorola/ccc/ota/installer/updaterEngine/StreamingUpdate;

    invoke-virtual {p0}, Lcom/motorola/ccc/ota/installer/updaterEngine/StreamingUpdate;->clearUEInstallerBeforeExit()V

    return-void

    :cond_4
    invoke-static {p1}, Lcom/motorola/otalib/common/errorCodes/UpdaterEngineErrorCodes;->isItaRetriableError(I)Z

    move-result v0

    if-eqz v0, :cond_6

    invoke-static {}, Lcom/motorola/ccc/ota/installer/updaterEngine/download/UEDownloadRetry;->isRetryPending()Z

    move-result p2

    if-nez p2, :cond_5

    iget-object p2, p0, Lcom/motorola/ccc/ota/installer/updaterEngine/StreamingUpdate$UECallbackHandler;->this$0:Lcom/motorola/ccc/ota/installer/updaterEngine/StreamingUpdate;

    invoke-static {p2}, Lcom/motorola/ccc/ota/installer/updaterEngine/StreamingUpdate;->-$$Nest$fgetueDownloadRetry(Lcom/motorola/ccc/ota/installer/updaterEngine/StreamingUpdate;)Lcom/motorola/ccc/ota/installer/updaterEngine/download/UEDownloadRetry;

    move-result-object p2

    iget-object v0, p0, Lcom/motorola/ccc/ota/installer/updaterEngine/StreamingUpdate$UECallbackHandler;->this$0:Lcom/motorola/ccc/ota/installer/updaterEngine/StreamingUpdate;

    iget-object v0, v0, Lcom/motorola/ccc/ota/installer/updaterEngine/StreamingUpdate;->mVersion:Ljava/lang/String;

    invoke-virtual {p2, p1, v0}, Lcom/motorola/ccc/ota/installer/updaterEngine/download/UEDownloadRetry;->handleRetry(ILjava/lang/String;)Z

    move-result p1

    if-nez p1, :cond_5

    sget-object p1, Lcom/motorola/ccc/ota/installer/updaterEngine/UpdaterEngineInstaller;->updaterEngineStateHandler:Lcom/motorola/ccc/ota/installer/updaterEngine/common/UpdaterEngineStateHandler;

    iget-object p0, p0, Lcom/motorola/ccc/ota/installer/updaterEngine/StreamingUpdate$UECallbackHandler;->this$0:Lcom/motorola/ccc/ota/installer/updaterEngine/StreamingUpdate;

    invoke-static {p0}, Lcom/motorola/ccc/ota/installer/updaterEngine/StreamingUpdate;->-$$Nest$fgetcontext(Lcom/motorola/ccc/ota/installer/updaterEngine/StreamingUpdate;)Landroid/content/Context;

    move-result-object p0

    invoke-virtual {p1, p0, v5, v2, p3}, Lcom/motorola/ccc/ota/installer/updaterEngine/common/UpdaterEngineStateHandler;->transferUpgradeBackToOta(Landroid/content/Context;ZLjava/lang/String;Ljava/lang/String;)V

    return-void

    :cond_5
    const-string p1, "a retry is already scheduled, so return"

    invoke-static {v1, p1}, Lcom/motorola/ccc/ota/utils/Logger;->debug(Ljava/lang/String;Ljava/lang/String;)V

    iget-object p1, p0, Lcom/motorola/ccc/ota/installer/updaterEngine/StreamingUpdate$UECallbackHandler;->this$0:Lcom/motorola/ccc/ota/installer/updaterEngine/StreamingUpdate;

    iget-object p2, p1, Lcom/motorola/ccc/ota/installer/updaterEngine/StreamingUpdate;->_settings:Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    sget-object p3, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->STORED_AB_PROGRESS_PERCENT:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    invoke-virtual {p2, p3, v4}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->getFloat(Lcom/motorola/otalib/common/settings/ISetting;F)F

    move-result p2

    iget-object p3, p0, Lcom/motorola/ccc/ota/installer/updaterEngine/StreamingUpdate$UECallbackHandler;->this$0:Lcom/motorola/ccc/ota/installer/updaterEngine/StreamingUpdate;

    iget-object p3, p3, Lcom/motorola/ccc/ota/installer/updaterEngine/StreamingUpdate;->_settings:Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    sget-object v0, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->STORED_AB_STATUS:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    invoke-virtual {p3, v0, v5}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->getInt(Lcom/motorola/otalib/common/settings/ISetting;I)I

    move-result p3

    invoke-static {p1, p2, p3, v3}, Lcom/motorola/ccc/ota/installer/updaterEngine/StreamingUpdate;->-$$Nest$msendUpgradeStatus(Lcom/motorola/ccc/ota/installer/updaterEngine/StreamingUpdate;FII)V

    iget-object p0, p0, Lcom/motorola/ccc/ota/installer/updaterEngine/StreamingUpdate$UECallbackHandler;->this$0:Lcom/motorola/ccc/ota/installer/updaterEngine/StreamingUpdate;

    invoke-virtual {p0}, Lcom/motorola/ccc/ota/installer/updaterEngine/StreamingUpdate;->clearUEInstallerBeforeExit()V

    return-void

    :cond_6
    sget v0, Lcom/motorola/otalib/common/errorCodes/UpdaterEngineErrorCodes;->K_USER_CANCELED:I

    if-ne p1, v0, :cond_b

    sget-object p1, Lcom/motorola/ccc/ota/installer/updaterEngine/common/InstallerUtilMethods$InstallerErrorStatus;->STATUS_USER_CANCEL:Lcom/motorola/ccc/ota/installer/updaterEngine/common/InstallerUtilMethods$InstallerErrorStatus;

    invoke-static {}, Lcom/motorola/ccc/ota/installer/updaterEngine/StreamingUpdate;->-$$Nest$sfgetmInstallerStatus()Lcom/motorola/ccc/ota/installer/updaterEngine/common/InstallerUtilMethods$InstallerErrorStatus;

    move-result-object p2

    if-ne p1, p2, :cond_7

    iget-object p1, p0, Lcom/motorola/ccc/ota/installer/updaterEngine/StreamingUpdate$UECallbackHandler;->this$0:Lcom/motorola/ccc/ota/installer/updaterEngine/StreamingUpdate;

    invoke-static {p1}, Lcom/motorola/ccc/ota/installer/updaterEngine/StreamingUpdate;->-$$Nest$fgetcontext(Lcom/motorola/ccc/ota/installer/updaterEngine/StreamingUpdate;)Landroid/content/Context;

    move-result-object p1

    invoke-static {p1}, Lcom/motorola/ccc/ota/installer/updaterEngine/common/InstallerUtilMethods;->sendCancelBackgroundInstallationResponse(Landroid/content/Context;)V

    iget-object p0, p0, Lcom/motorola/ccc/ota/installer/updaterEngine/StreamingUpdate$UECallbackHandler;->this$0:Lcom/motorola/ccc/ota/installer/updaterEngine/StreamingUpdate;

    invoke-virtual {p0}, Lcom/motorola/ccc/ota/installer/updaterEngine/StreamingUpdate;->clearUEInstallerBeforeExit()V

    return-void

    :cond_7
    sget-object p1, Lcom/motorola/ccc/ota/installer/updaterEngine/common/InstallerUtilMethods$InstallerErrorStatus;->STATUS_SILENT_FAILURE:Lcom/motorola/ccc/ota/installer/updaterEngine/common/InstallerUtilMethods$InstallerErrorStatus;

    invoke-static {}, Lcom/motorola/ccc/ota/installer/updaterEngine/StreamingUpdate;->-$$Nest$sfgetmInstallerStatus()Lcom/motorola/ccc/ota/installer/updaterEngine/common/InstallerUtilMethods$InstallerErrorStatus;

    move-result-object p2

    if-ne p1, p2, :cond_8

    iget-object p0, p0, Lcom/motorola/ccc/ota/installer/updaterEngine/StreamingUpdate$UECallbackHandler;->this$0:Lcom/motorola/ccc/ota/installer/updaterEngine/StreamingUpdate;

    invoke-virtual {p0}, Lcom/motorola/ccc/ota/installer/updaterEngine/StreamingUpdate;->clearUEInstallerBeforeExit()V

    return-void

    :cond_8
    sget-object p1, Lcom/motorola/ccc/ota/installer/updaterEngine/common/InstallerUtilMethods$InstallerErrorStatus;->STATUS_UE_NOT_RESPONDING:Lcom/motorola/ccc/ota/installer/updaterEngine/common/InstallerUtilMethods$InstallerErrorStatus;

    invoke-static {}, Lcom/motorola/ccc/ota/installer/updaterEngine/StreamingUpdate;->-$$Nest$sfgetmInstallerStatus()Lcom/motorola/ccc/ota/installer/updaterEngine/common/InstallerUtilMethods$InstallerErrorStatus;

    move-result-object p2

    if-ne p1, p2, :cond_9

    sget-object p1, Lcom/motorola/ccc/ota/installer/updaterEngine/UpdaterEngineInstaller;->updaterEngineStateHandler:Lcom/motorola/ccc/ota/installer/updaterEngine/common/UpdaterEngineStateHandler;

    invoke-static {}, Lcom/motorola/ccc/ota/env/OtaApplication;->getGlobalContext()Landroid/content/Context;

    move-result-object p2

    new-instance p3, Ljava/lang/StringBuilder;

    const-string v0, "Updater engine is not responding at , status "

    invoke-direct {p3, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v0, p0, Lcom/motorola/ccc/ota/installer/updaterEngine/StreamingUpdate$UECallbackHandler;->this$0:Lcom/motorola/ccc/ota/installer/updaterEngine/StreamingUpdate;

    iget-object v0, v0, Lcom/motorola/ccc/ota/installer/updaterEngine/StreamingUpdate;->_settings:Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    sget-object v1, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->STORED_AB_STATUS:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    invoke-virtual {v0, v1, v5}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->getInt(Lcom/motorola/otalib/common/settings/ISetting;I)I

    move-result v0

    invoke-virtual {p3, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object p3

    const-string v0, " percentage "

    invoke-virtual {p3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p3

    iget-object p0, p0, Lcom/motorola/ccc/ota/installer/updaterEngine/StreamingUpdate$UECallbackHandler;->this$0:Lcom/motorola/ccc/ota/installer/updaterEngine/StreamingUpdate;

    iget-object p0, p0, Lcom/motorola/ccc/ota/installer/updaterEngine/StreamingUpdate;->_settings:Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    sget-object v0, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->STORED_AB_PROGRESS_PERCENT:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    invoke-virtual {p0, v0, v4}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->getFloat(Lcom/motorola/otalib/common/settings/ISetting;F)F

    move-result p0

    invoke-virtual {p3, p0}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    move-result-object p0

    const-string p3, " "

    invoke-virtual {p0, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    const-string p3, "UE_NOT_RESPONDING."

    invoke-virtual {p1, p2, v5, p0, p3}, Lcom/motorola/ccc/ota/installer/updaterEngine/common/UpdaterEngineStateHandler;->transferUpgradeBackToOta(Landroid/content/Context;ZLjava/lang/String;Ljava/lang/String;)V

    return-void

    :cond_9
    iget-object p1, p0, Lcom/motorola/ccc/ota/installer/updaterEngine/StreamingUpdate$UECallbackHandler;->this$0:Lcom/motorola/ccc/ota/installer/updaterEngine/StreamingUpdate;

    iget-object p1, p1, Lcom/motorola/ccc/ota/installer/updaterEngine/StreamingUpdate;->_settings:Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    invoke-static {p1}, Lcom/motorola/ccc/ota/installer/updaterEngine/common/InstallerUtilMethods;->getAdminApnUrl(Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;)Ljava/lang/String;

    move-result-object p1

    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result p1

    if-nez p1, :cond_a

    iget-object p1, p0, Lcom/motorola/ccc/ota/installer/updaterEngine/StreamingUpdate$UECallbackHandler;->this$0:Lcom/motorola/ccc/ota/installer/updaterEngine/StreamingUpdate;

    invoke-static {p1}, Lcom/motorola/ccc/ota/installer/updaterEngine/StreamingUpdate;->-$$Nest$fgetod(Lcom/motorola/ccc/ota/installer/updaterEngine/StreamingUpdate;)Lcom/motorola/otalib/downloadservice/download/policy/DownloadPolicy;

    move-result-object p1

    invoke-virtual {p1}, Lcom/motorola/otalib/downloadservice/download/policy/DownloadPolicy;->stopUsingZeroRatedChannel()V

    :cond_a
    iget-object p0, p0, Lcom/motorola/ccc/ota/installer/updaterEngine/StreamingUpdate$UECallbackHandler;->this$0:Lcom/motorola/ccc/ota/installer/updaterEngine/StreamingUpdate;

    invoke-virtual {p0}, Lcom/motorola/ccc/ota/installer/updaterEngine/StreamingUpdate;->restartOnProgress()V

    return-void

    :cond_b
    sget-object p0, Lcom/motorola/ccc/ota/installer/updaterEngine/UpdaterEngineInstaller;->updaterEngineStateHandler:Lcom/motorola/ccc/ota/installer/updaterEngine/common/UpdaterEngineStateHandler;

    invoke-static {}, Lcom/motorola/ccc/ota/env/OtaApplication;->getGlobalContext()Landroid/content/Context;

    move-result-object p1

    invoke-virtual {p0, p1, v5, p2, p3}, Lcom/motorola/ccc/ota/installer/updaterEngine/common/UpdaterEngineStateHandler;->transferUpgradeBackToOta(Landroid/content/Context;ZLjava/lang/String;Ljava/lang/String;)V

    return-void
.end method

.method public onProgress(IF)V
    .locals 6

    const-string v0, "APPLY_FAILURE."

    const-string v1, "Caught an exception duringapply payload "

    const-string v2, "OtaApp"

    const/4 v3, 0x0

    const/4 v4, 0x0

    if-nez p1, :cond_1

    :try_start_0
    invoke-direct {p0}, Lcom/motorola/ccc/ota/installer/updaterEngine/StreamingUpdate$UECallbackHandler;->onApplyPayload()V
    :try_end_0
    .catch Ljava/lang/reflect/InvocationTargetException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/lang/ClassNotFoundException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/lang/InstantiationException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/lang/IllegalAccessException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/lang/NoSuchMethodException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Lcom/motorola/ccc/ota/installer/updaterEngine/download/DownloadBuilderException; {:try_start_0 .. :try_end_0} :catch_0

    goto/16 :goto_0

    :catch_0
    move-exception p1

    new-instance p2, Ljava/lang/StringBuilder;

    const-string v3, "Caught an exception during apply payload: "

    invoke-direct {p2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object p2

    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    invoke-static {v2, p2}, Lcom/motorola/ccc/ota/utils/Logger;->error(Ljava/lang/String;Ljava/lang/String;)V

    sget p2, Lcom/motorola/otalib/common/errorCodes/UpdaterEngineErrorCodes;->ERROR_EXCEPTION:I

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p0, p2, p1, v0}, Lcom/motorola/ccc/ota/installer/updaterEngine/StreamingUpdate$UECallbackHandler;->onCompleted(ILjava/lang/String;Ljava/lang/String;)V

    goto :goto_0

    :catch_1
    move-exception p1

    new-instance p2, Ljava/lang/StringBuilder;

    const-string v5, "Exception in StreamingUpdate: onProgress: "

    invoke-direct {p2, v5}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object p2

    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    invoke-static {v2, p2}, Lcom/motorola/ccc/ota/utils/Logger;->error(Ljava/lang/String;Ljava/lang/String;)V

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

    const-string v5, "waiting for reboot"

    invoke-virtual {p2, v5}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

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

    invoke-static {v2, p1}, Lcom/motorola/ccc/ota/utils/Logger;->debug(Ljava/lang/String;Ljava/lang/String;)V

    invoke-static {v4}, Lcom/motorola/otalib/common/errorCodes/UpdaterEngineErrorCodes;->getFailureResultStatus(I)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p0, v4, v3, p1}, Lcom/motorola/ccc/ota/installer/updaterEngine/StreamingUpdate$UECallbackHandler;->onCompleted(ILjava/lang/String;Ljava/lang/String;)V

    goto :goto_0

    :cond_0
    sget p2, Lcom/motorola/otalib/common/errorCodes/UpdaterEngineErrorCodes;->ERROR_EXCEPTION:I

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p0, p2, p1, v0}, Lcom/motorola/ccc/ota/installer/updaterEngine/StreamingUpdate$UECallbackHandler;->onCompleted(ILjava/lang/String;Ljava/lang/String;)V

    :goto_0
    return-void

    :cond_1
    const/4 v0, 0x3

    if-ne p1, v0, :cond_2

    invoke-static {}, Lcom/motorola/ccc/ota/installer/updaterEngine/download/UEDownloadRetry;->clearRetryTask()V

    iget-object v0, p0, Lcom/motorola/ccc/ota/installer/updaterEngine/StreamingUpdate$UECallbackHandler;->this$0:Lcom/motorola/ccc/ota/installer/updaterEngine/StreamingUpdate;

    iget-object v0, v0, Lcom/motorola/ccc/ota/installer/updaterEngine/StreamingUpdate;->_settings:Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    sget-object v1, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->OTA_DOWNLOAD_RETRY_ATTEMPTS:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    invoke-virtual {v0, v1}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->removeConfig(Lcom/motorola/otalib/common/settings/ISetting;)V

    goto :goto_1

    :cond_2
    const/4 v0, 0x4

    if-lt p1, v0, :cond_3

    invoke-static {}, Lcom/motorola/ccc/ota/utils/BuildPropReader;->isBotaATT()Z

    move-result v0

    if-eqz v0, :cond_3

    iget-object v0, p0, Lcom/motorola/ccc/ota/installer/updaterEngine/StreamingUpdate$UECallbackHandler;->this$0:Lcom/motorola/ccc/ota/installer/updaterEngine/StreamingUpdate;

    iget-object v0, v0, Lcom/motorola/ccc/ota/installer/updaterEngine/StreamingUpdate;->_env:Lcom/motorola/otalib/common/Environment/ApplicationEnv;

    invoke-interface {v0}, Lcom/motorola/otalib/common/Environment/ApplicationEnv;->getUtilities()Lcom/motorola/otalib/common/Environment/ApplicationEnv$Utilities;

    move-result-object v0

    invoke-interface {v0}, Lcom/motorola/otalib/common/Environment/ApplicationEnv$Utilities;->cleanFotaWifiDiscoveryTimer()V

    :cond_3
    :goto_1
    const/4 v0, 0x6

    if-ne p1, v0, :cond_4

    invoke-static {}, Lcom/motorola/ccc/ota/installer/updaterEngine/UpdaterEngineInstaller;->getApplyPayloadStarted()Z

    move-result v0

    if-nez v0, :cond_4

    sget p1, Lcom/motorola/otalib/common/errorCodes/UpdaterEngineErrorCodes;->K_SUCCESS:I

    sget p2, Lcom/motorola/otalib/common/errorCodes/UpdaterEngineErrorCodes;->K_SUCCESS:I

    invoke-static {p2}, Lcom/motorola/otalib/common/errorCodes/UpdaterEngineErrorCodes;->getFailureResultStatus(I)Ljava/lang/String;

    move-result-object p2

    invoke-virtual {p0, p1, v3, p2}, Lcom/motorola/ccc/ota/installer/updaterEngine/StreamingUpdate$UECallbackHandler;->onCompleted(ILjava/lang/String;Ljava/lang/String;)V

    return-void

    :cond_4
    const/4 v0, 0x1

    invoke-static {v0}, Lcom/motorola/ccc/ota/installer/updaterEngine/UpdaterEngineInstaller;->setApplyPayloadStarted(Z)V

    const/high16 v0, 0x42c80000    # 100.0f

    mul-float/2addr p2, v0

    iget-object p0, p0, Lcom/motorola/ccc/ota/installer/updaterEngine/StreamingUpdate$UECallbackHandler;->this$0:Lcom/motorola/ccc/ota/installer/updaterEngine/StreamingUpdate;

    invoke-static {p0, p2, p1, v4}, Lcom/motorola/ccc/ota/installer/updaterEngine/StreamingUpdate;->-$$Nest$msendUpgradeStatus(Lcom/motorola/ccc/ota/installer/updaterEngine/StreamingUpdate;FII)V

    return-void
.end method
