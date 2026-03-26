.class Lcom/motorola/ccc/ota/CusSM$SMNewVersionHandler;
.super Ljava/lang/Object;
.source "CusSM.java"

# interfaces
.implements Lcom/motorola/ccc/ota/NewVersionHandler;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/motorola/ccc/ota/CusSM;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = "SMNewVersionHandler"
.end annotation


# instance fields
.field final synthetic this$0:Lcom/motorola/ccc/ota/CusSM;


# direct methods
.method constructor <init>(Lcom/motorola/ccc/ota/CusSM;)V
    .locals 0

    iput-object p1, p0, Lcom/motorola/ccc/ota/CusSM$SMNewVersionHandler;->this$0:Lcom/motorola/ccc/ota/CusSM;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public declared-synchronized handleNewVersion(Lcom/motorola/otalib/common/metaData/MetaData;Ljava/lang/String;Lcom/motorola/ccc/ota/sources/UpgradeSourceType;Ljava/lang/String;JLjava/lang/String;Ljava/lang/String;)Lcom/motorola/ccc/ota/NewVersionHandler$ReturnCode;
    .locals 28

    move-object/from16 v1, p0

    move-object/from16 v0, p1

    move-object/from16 v2, p3

    move-object/from16 v8, p4

    const-string v3, "CusSM.handleNewVersion failed: could not store data for "

    const-string v4, "WiFi-only package; "

    const-string v5, "allowFotaOverAnyDataNetwork policy is enabled; "

    const-string v6, "CusSM.handleNewVersion: device is under system update policy :postpone policy is set and end Time is : "

    const-string v7, "Finger print on device: "

    const-string v9, "CusSM.handleNewVersion: version ( finger print  on device: "

    const-string v10, "CusSm.isAcceptable: "

    const-string v11, "Package size is improper"

    const-string v12, "Wifi not available, wifi only package, Vital update "

    const-string v13, "Device is corrupted; "

    const-string v14, "Device is rooted; "

    const-string v15, "Device is under freeze period; policy type ="

    move-object/from16 v16, v3

    const-string v3, "Bootloader is unlocked; "

    monitor-enter p0

    :try_start_0
    invoke-virtual/range {p3 .. p3}, Lcom/motorola/ccc/ota/sources/UpgradeSourceType;->toString()Ljava/lang/String;

    move-result-object v17

    move-object/from16 v25, v4

    invoke-static/range {v17 .. v17}, Lcom/motorola/ccc/ota/utils/BuildPropReader;->getDeviceSha1(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    move-object/from16 v17, v5

    const-string v5, "CusSM.handleNewVersion: was notified of a new version : src %s %s : dest %s %s current %s size %d contentTimeStamp %d"

    move-object/from16 v26, v6

    const-string v6, "OtaApp"

    invoke-virtual/range {p1 .. p1}, Lcom/motorola/otalib/common/metaData/MetaData;->getMinVersion()Ljava/lang/String;

    move-result-object v18

    invoke-virtual/range {p1 .. p1}, Lcom/motorola/otalib/common/metaData/MetaData;->getSourceSha1()Ljava/lang/String;

    move-result-object v19

    invoke-virtual/range {p1 .. p1}, Lcom/motorola/otalib/common/metaData/MetaData;->getVersion()Ljava/lang/String;

    move-result-object v20

    invoke-virtual/range {p1 .. p1}, Lcom/motorola/otalib/common/metaData/MetaData;->getTargetSha1()Ljava/lang/String;

    move-result-object v21

    invoke-virtual/range {p1 .. p1}, Lcom/motorola/otalib/common/metaData/MetaData;->getSize()J

    move-result-wide v22

    invoke-static/range {v22 .. v23}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v23

    invoke-static/range {p5 .. p6}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v24

    move-object/from16 v22, v4

    move-object/from16 v27, v10

    filled-new-array/range {v18 .. v24}, [Ljava/lang/Object;

    move-result-object v10

    invoke-static {v5, v10}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v5

    invoke-static {v6, v5}, Lcom/motorola/ccc/ota/utils/Logger;->debug(Ljava/lang/String;Ljava/lang/String;)V

    iget-object v5, v1, Lcom/motorola/ccc/ota/CusSM$SMNewVersionHandler;->this$0:Lcom/motorola/ccc/ota/CusSM;

    invoke-static {v5}, Lcom/motorola/ccc/ota/CusSM;->-$$Nest$fgetsettings(Lcom/motorola/ccc/ota/CusSM;)Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    move-result-object v5

    sget-object v6, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->ONGOING_HISTORY_POLICY_DISPLAY_NAME:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    invoke-virtual {v5, v6}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->removeConfig(Lcom/motorola/otalib/common/settings/ISetting;)V

    iget-object v5, v1, Lcom/motorola/ccc/ota/CusSM$SMNewVersionHandler;->this$0:Lcom/motorola/ccc/ota/CusSM;

    invoke-static {v5}, Lcom/motorola/ccc/ota/CusSM;->-$$Nest$fgetsystemUpdaterPolicy(Lcom/motorola/ccc/ota/CusSM;)Lcom/motorola/ccc/ota/env/SystemUpdaterPolicy;

    move-result-object v5

    invoke-virtual {v5}, Lcom/motorola/ccc/ota/env/SystemUpdaterPolicy;->isOtaUpdateDisabledByPolicyMngr()Z

    move-result v5

    if-eqz v5, :cond_2

    const-string v3, "Device is under disable ota update policy;"

    const-string v5, "Ota update is disabled by policy manager"

    const-string v6, "KEY_UPDATE_DISABLED_BY_POLICY_MNGR."

    sget-object v7, Lcom/motorola/ccc/ota/NewVersionHandler$ReturnCode;->UPDATE_DISABLED_BY_POLICY_MNGR:Lcom/motorola/ccc/ota/NewVersionHandler$ReturnCode;

    iget-object v9, v1, Lcom/motorola/ccc/ota/CusSM$SMNewVersionHandler;->this$0:Lcom/motorola/ccc/ota/CusSM;

    invoke-static {v9}, Lcom/motorola/ccc/ota/CusSM;->-$$Nest$fgetsystemUpdaterPolicy(Lcom/motorola/ccc/ota/CusSM;)Lcom/motorola/ccc/ota/env/SystemUpdaterPolicy;

    move-result-object v9

    invoke-virtual {v9}, Lcom/motorola/ccc/ota/env/SystemUpdaterPolicy;->isOtaUpdateDisabledPolicySet()Z

    move-result v9

    if-eqz v9, :cond_0

    const-string v3, "isOtaUpdateDisabled policy is set;"

    const-string v5, "Ota update is disabled by motorola policy manager"

    const-string v6, "KEY_UPDATE_DISABLED_BY_MOTO_POLICY_MNGR."

    sget-object v7, Lcom/motorola/ccc/ota/NewVersionHandler$ReturnCode;->UPDATE_DISABLED_BY_MOTO_POLICY_MNGR:Lcom/motorola/ccc/ota/NewVersionHandler$ReturnCode;

    goto :goto_0

    :cond_0
    iget-object v9, v1, Lcom/motorola/ccc/ota/CusSM$SMNewVersionHandler;->this$0:Lcom/motorola/ccc/ota/CusSM;

    invoke-static {v9}, Lcom/motorola/ccc/ota/CusSM;->-$$Nest$fgetsystemUpdaterPolicy(Lcom/motorola/ccc/ota/CusSM;)Lcom/motorola/ccc/ota/env/SystemUpdaterPolicy;

    move-result-object v9

    invoke-virtual {v9}, Lcom/motorola/ccc/ota/env/SystemUpdaterPolicy;->isDeviceUnderFreezePeriod()Z

    move-result v9

    if-eqz v9, :cond_1

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3, v15}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v5, v1, Lcom/motorola/ccc/ota/CusSM$SMNewVersionHandler;->this$0:Lcom/motorola/ccc/ota/CusSM;

    invoke-static {v5}, Lcom/motorola/ccc/ota/CusSM;->-$$Nest$fgetsystemUpdaterPolicy(Lcom/motorola/ccc/ota/CusSM;)Lcom/motorola/ccc/ota/env/SystemUpdaterPolicy;

    move-result-object v5

    invoke-virtual {v5}, Lcom/motorola/ccc/ota/env/SystemUpdaterPolicy;->getPolicyType()I

    move-result v5

    invoke-virtual {v3, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v5, ";"

    invoke-virtual {v3, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    const-string v5, "Ota update is blocked as device is under freeze peroid"

    const-string v6, "KEY_UPDATE_BLOCKED_FREEZE_PERIOD."

    sget-object v7, Lcom/motorola/ccc/ota/NewVersionHandler$ReturnCode;->UPDATE_BLOCKED_FREEZE_PERIOD:Lcom/motorola/ccc/ota/NewVersionHandler$ReturnCode;

    :cond_1
    :goto_0
    move-object v9, v6

    move-object v10, v7

    move-object v7, v5

    iget-object v5, v1, Lcom/motorola/ccc/ota/CusSM$SMNewVersionHandler;->this$0:Lcom/motorola/ccc/ota/CusSM;

    invoke-static {v5}, Lcom/motorola/ccc/ota/CusSM;->-$$Nest$fgetsettings(Lcom/motorola/ccc/ota/CusSM;)Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    move-result-object v5

    sget-object v6, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->ONGOING_HISTORY_POLICY_DISPLAY_NAME:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    invoke-static {}, Lcom/motorola/ccc/ota/env/OtaApplication;->getGlobalContext()Landroid/content/Context;

    move-result-object v11

    invoke-virtual {v11}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v11

    const v12, 0x7f0e01d1

    invoke-virtual {v11, v12}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v11

    invoke-virtual {v5, v6, v11}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->setString(Lcom/motorola/otalib/common/settings/ISetting;Ljava/lang/String;)V

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v5, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    iget-object v3, v1, Lcom/motorola/ccc/ota/CusSM$SMNewVersionHandler;->this$0:Lcom/motorola/ccc/ota/CusSM;

    invoke-virtual/range {p3 .. p3}, Lcom/motorola/ccc/ota/sources/UpgradeSourceType;->toString()Ljava/lang/String;

    move-result-object v5

    move-object v2, v3

    move-object v3, v4

    move-object/from16 v4, p1

    move-object/from16 v6, p2

    invoke-static/range {v2 .. v9}, Lcom/motorola/ccc/ota/CusSM;->-$$Nest$mfailNotify(Lcom/motorola/ccc/ota/CusSM;Ljava/lang/String;Lcom/motorola/otalib/common/metaData/MetaData;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit p0

    return-object v10

    :cond_2
    :try_start_1
    invoke-virtual/range {p1 .. p1}, Lcom/motorola/otalib/common/metaData/MetaData;->getBitmap()I

    move-result v5

    sget-object v6, Lcom/motorola/ccc/ota/ui/UpdaterUtils$BitmapFeatures;->bootloader:Lcom/motorola/ccc/ota/ui/UpdaterUtils$BitmapFeatures;

    invoke-virtual {v6}, Lcom/motorola/ccc/ota/ui/UpdaterUtils$BitmapFeatures;->ordinal()I

    move-result v6

    invoke-static {v5, v6}, Lcom/motorola/ccc/ota/ui/UpdaterUtils;->isBitMapSet(II)Z

    move-result v5

    if-eqz v5, :cond_3

    invoke-static {}, Lcom/motorola/ccc/ota/utils/BuildPropReader;->getBootloaderStatus()Ljava/lang/String;

    move-result-object v5

    const-string v6, "unlocked"

    invoke-virtual {v5, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_3

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v5, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    iget-object v3, v1, Lcom/motorola/ccc/ota/CusSM$SMNewVersionHandler;->this$0:Lcom/motorola/ccc/ota/CusSM;

    invoke-virtual/range {p3 .. p3}, Lcom/motorola/ccc/ota/sources/UpgradeSourceType;->toString()Ljava/lang/String;

    move-result-object v5

    const-string v7, "Bootloader is unlocked"

    const-string v9, "BOOTLOADER_UNLOCKED."

    move-object v2, v3

    move-object v3, v4

    move-object/from16 v4, p1

    move-object/from16 v6, p2

    invoke-static/range {v2 .. v9}, Lcom/motorola/ccc/ota/CusSM;->-$$Nest$mfailNotify(Lcom/motorola/ccc/ota/CusSM;Ljava/lang/String;Lcom/motorola/otalib/common/metaData/MetaData;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    sget-object v0, Lcom/motorola/ccc/ota/NewVersionHandler$ReturnCode;->NEW_VERSION_FAIL_BOOTLOADER_UNLOCKED:Lcom/motorola/ccc/ota/NewVersionHandler$ReturnCode;
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    monitor-exit p0

    return-object v0

    :cond_3
    :try_start_2
    iget-object v3, v1, Lcom/motorola/ccc/ota/CusSM$SMNewVersionHandler;->this$0:Lcom/motorola/ccc/ota/CusSM;

    invoke-static {v3}, Lcom/motorola/ccc/ota/CusSM;->-$$Nest$fgetsettings(Lcom/motorola/ccc/ota/CusSM;)Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    move-result-object v3

    sget-object v5, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->FLAG_IS_VITAL_UPDATE:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    invoke-virtual {v3, v5}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->getBoolean(Lcom/motorola/otalib/common/settings/ISetting;)Z

    move-result v3

    if-eqz v3, :cond_4

    invoke-virtual/range {p1 .. p1}, Lcom/motorola/otalib/common/metaData/MetaData;->isWifiOnly()Z

    move-result v3

    if-eqz v3, :cond_4

    iget-object v3, v1, Lcom/motorola/ccc/ota/CusSM$SMNewVersionHandler;->this$0:Lcom/motorola/ccc/ota/CusSM;

    invoke-static {v3}, Lcom/motorola/ccc/ota/CusSM;->-$$Nest$fgetcm(Lcom/motorola/ccc/ota/CusSM;)Landroid/net/ConnectivityManager;

    move-result-object v3

    invoke-static {v3}, Lcom/motorola/otalib/common/utils/NetworkUtils;->isWifi(Landroid/net/ConnectivityManager;)Z

    move-result v3

    if-nez v3, :cond_4

    iget-object v3, v1, Lcom/motorola/ccc/ota/CusSM$SMNewVersionHandler;->this$0:Lcom/motorola/ccc/ota/CusSM;

    invoke-static {v3}, Lcom/motorola/ccc/ota/CusSM;->-$$Nest$fgetsystemUpdaterPolicy(Lcom/motorola/ccc/ota/CusSM;)Lcom/motorola/ccc/ota/env/SystemUpdaterPolicy;

    move-result-object v3

    invoke-virtual {v3}, Lcom/motorola/ccc/ota/env/SystemUpdaterPolicy;->isAutoDownloadOverAnyDataNetworkPolicySet()Z

    move-result v3

    if-nez v3, :cond_4

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3, v12}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v3, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    iget-object v3, v1, Lcom/motorola/ccc/ota/CusSM$SMNewVersionHandler;->this$0:Lcom/motorola/ccc/ota/CusSM;

    invoke-virtual/range {p3 .. p3}, Lcom/motorola/ccc/ota/sources/UpgradeSourceType;->toString()Ljava/lang/String;

    move-result-object v5

    const-string v7, "Vital update wifi only package, wifi not available"

    const-string v9, "KEY_VU_WIFI_ONLY_PACKAGE_WIFI_NOT_AVAILABLE."

    move-object v2, v3

    move-object v3, v4

    move-object/from16 v4, p1

    move-object/from16 v6, p2

    invoke-static/range {v2 .. v9}, Lcom/motorola/ccc/ota/CusSM;->-$$Nest$mfailNotify(Lcom/motorola/ccc/ota/CusSM;Ljava/lang/String;Lcom/motorola/otalib/common/metaData/MetaData;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    sget-object v0, Lcom/motorola/ccc/ota/NewVersionHandler$ReturnCode;->VU_WIFI_ONLY_PACKAGE_WIFI_NOT_AVAILABLE:Lcom/motorola/ccc/ota/NewVersionHandler$ReturnCode;
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    monitor-exit p0

    return-object v0

    :cond_4
    :try_start_3
    invoke-virtual/range {p1 .. p1}, Lcom/motorola/otalib/common/metaData/MetaData;->getBitmap()I

    move-result v3

    sget-object v5, Lcom/motorola/ccc/ota/ui/UpdaterUtils$BitmapFeatures;->rooted:Lcom/motorola/ccc/ota/ui/UpdaterUtils$BitmapFeatures;

    invoke-virtual {v5}, Lcom/motorola/ccc/ota/ui/UpdaterUtils$BitmapFeatures;->ordinal()I

    move-result v5

    invoke-static {v3, v5}, Lcom/motorola/ccc/ota/ui/UpdaterUtils;->isBitMapSet(II)Z

    move-result v3

    if-eqz v3, :cond_6

    invoke-static {}, Lcom/motorola/ccc/ota/utils/BuildPropReader;->isDeviceRooted()Ljava/lang/String;

    move-result-object v10

    const-string v3, "false"

    invoke-virtual {v10, v3}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v3

    if-nez v3, :cond_6

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3, v14}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v3, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v5, " ;"

    invoke-virtual {v3, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    iget-object v3, v1, Lcom/motorola/ccc/ota/CusSM$SMNewVersionHandler;->this$0:Lcom/motorola/ccc/ota/CusSM;

    invoke-virtual/range {p3 .. p3}, Lcom/motorola/ccc/ota/sources/UpgradeSourceType;->toString()Ljava/lang/String;

    move-result-object v5

    const-string v7, "Device is rooted"

    const-string v9, "ROOTED."

    move-object v2, v3

    move-object v3, v4

    move-object/from16 v4, p1

    move-object/from16 v6, p2

    invoke-static/range {v2 .. v9}, Lcom/motorola/ccc/ota/CusSM;->-$$Nest$mfailNotify(Lcom/motorola/ccc/ota/CusSM;Ljava/lang/String;Lcom/motorola/otalib/common/metaData/MetaData;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    const-string v0, "enableVerity"

    invoke-virtual {v10, v0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_5

    sget-object v0, Lcom/motorola/ccc/ota/NewVersionHandler$ReturnCode;->NEW_VERSION_VERITY_DISABLED:Lcom/motorola/ccc/ota/NewVersionHandler$ReturnCode;
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    monitor-exit p0

    return-object v0

    :cond_5
    :try_start_4
    sget-object v0, Lcom/motorola/ccc/ota/NewVersionHandler$ReturnCode;->NEW_VERSION_FAIL_ROOTED:Lcom/motorola/ccc/ota/NewVersionHandler$ReturnCode;
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_0

    monitor-exit p0

    return-object v0

    :cond_6
    :try_start_5
    iget-object v3, v1, Lcom/motorola/ccc/ota/CusSM$SMNewVersionHandler;->this$0:Lcom/motorola/ccc/ota/CusSM;

    invoke-static {v3}, Lcom/motorola/ccc/ota/CusSM;->-$$Nest$fgetsettings(Lcom/motorola/ccc/ota/CusSM;)Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    move-result-object v3

    sget-object v5, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->VAB_MERGE_DEVICE_CORRUPTED:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    const/4 v6, 0x0

    invoke-virtual {v3, v5, v6}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->getBoolean(Lcom/motorola/otalib/common/settings/ISetting;Z)Z

    move-result v3

    if-eqz v3, :cond_7

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3, v13}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v3, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    iget-object v3, v1, Lcom/motorola/ccc/ota/CusSM$SMNewVersionHandler;->this$0:Lcom/motorola/ccc/ota/CusSM;

    invoke-virtual/range {p3 .. p3}, Lcom/motorola/ccc/ota/sources/UpgradeSourceType;->toString()Ljava/lang/String;

    move-result-object v5

    const-string v7, "Device is corrupted"

    const-string v9, "MERGE_STATUS_DEVICE_CORRUPTED"

    move-object v2, v3

    move-object v3, v4

    move-object/from16 v4, p1

    move-object/from16 v6, p2

    invoke-static/range {v2 .. v9}, Lcom/motorola/ccc/ota/CusSM;->-$$Nest$mfailNotify(Lcom/motorola/ccc/ota/CusSM;Ljava/lang/String;Lcom/motorola/otalib/common/metaData/MetaData;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    sget-object v0, Lcom/motorola/ccc/ota/NewVersionHandler$ReturnCode;->NEW_VERSION_FAIL_DEVICE_CORRUPTED:Lcom/motorola/ccc/ota/NewVersionHandler$ReturnCode;
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_0

    monitor-exit p0

    return-object v0

    :cond_7
    :try_start_6
    invoke-virtual/range {p1 .. p1}, Lcom/motorola/otalib/common/metaData/MetaData;->getSize()J

    move-result-wide v12

    const-wide/16 v14, 0x0

    cmp-long v3, v12, v14

    if-gtz v3, :cond_8

    const-string v3, "OtaApp"

    const-string v5, "CusSM.handleNewVersion failed: size of package not proper"

    invoke-static {v3, v5}, Lcom/motorola/ccc/ota/utils/Logger;->debug(Ljava/lang/String;Ljava/lang/String;)V

    iget-object v3, v1, Lcom/motorola/ccc/ota/CusSM$SMNewVersionHandler;->this$0:Lcom/motorola/ccc/ota/CusSM;

    invoke-virtual/range {p3 .. p3}, Lcom/motorola/ccc/ota/sources/UpgradeSourceType;->toString()Ljava/lang/String;

    move-result-object v5

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2, v11}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual/range {p1 .. p1}, Lcom/motorola/otalib/common/metaData/MetaData;->getSize()J

    move-result-wide v6

    invoke-virtual {v2, v6, v7}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    const-string v9, "PACKAGE_SIZE_ZERO."

    move-object v2, v3

    move-object v3, v4

    move-object/from16 v4, p1

    move-object/from16 v6, p2

    move-object/from16 v8, p4

    invoke-static/range {v2 .. v9}, Lcom/motorola/ccc/ota/CusSM;->-$$Nest$mfailNotify(Lcom/motorola/ccc/ota/CusSM;Ljava/lang/String;Lcom/motorola/otalib/common/metaData/MetaData;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    sget-object v0, Lcom/motorola/ccc/ota/NewVersionHandler$ReturnCode;->NEW_VERSION_INVALID:Lcom/motorola/ccc/ota/NewVersionHandler$ReturnCode;
    :try_end_6
    .catchall {:try_start_6 .. :try_end_6} :catchall_0

    monitor-exit p0

    return-object v0

    :cond_8
    :try_start_7
    invoke-virtual/range {p1 .. p1}, Lcom/motorola/otalib/common/metaData/MetaData;->getFingerprint()Ljava/lang/String;

    move-result-object v3

    if-eqz v3, :cond_9

    invoke-virtual/range {p1 .. p1}, Lcom/motorola/otalib/common/metaData/MetaData;->getFingerprint()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/String;->length()I

    move-result v3

    if-lez v3, :cond_9

    invoke-static {}, Lcom/motorola/ccc/ota/utils/BuildPropReader;->getFingerPrint()Ljava/lang/String;

    move-result-object v3

    invoke-virtual/range {p1 .. p1}, Lcom/motorola/otalib/common/metaData/MetaData;->getFingerprint()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v3, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-nez v5, :cond_9

    const-string v5, "OtaApp"

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6, v9}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v6, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string v9, " and fingerprint in package "

    invoke-virtual {v6, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual/range {p1 .. p1}, Lcom/motorola/otalib/common/metaData/MetaData;->getFingerprint()Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v6, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string v9, ") does  not match: "

    invoke-virtual {v6, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-static {v5, v6}, Lcom/motorola/ccc/ota/utils/Logger;->debug(Ljava/lang/String;Ljava/lang/String;)V

    iget-object v5, v1, Lcom/motorola/ccc/ota/CusSM$SMNewVersionHandler;->this$0:Lcom/motorola/ccc/ota/CusSM;

    invoke-virtual/range {p3 .. p3}, Lcom/motorola/ccc/ota/sources/UpgradeSourceType;->toString()Ljava/lang/String;

    move-result-object v6

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2, v7}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, " does not match with the fingerprint present in package "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual/range {p1 .. p1}, Lcom/motorola/otalib/common/metaData/MetaData;->getFingerprint()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    const-string v9, "FINGERPRINT_MISMATCH."

    move-object v2, v5

    move-object v3, v4

    move-object/from16 v4, p1

    move-object v5, v6

    move-object/from16 v6, p2

    move-object/from16 v8, p4

    invoke-static/range {v2 .. v9}, Lcom/motorola/ccc/ota/CusSM;->-$$Nest$mfailNotify(Lcom/motorola/ccc/ota/CusSM;Ljava/lang/String;Lcom/motorola/otalib/common/metaData/MetaData;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    sget-object v0, Lcom/motorola/ccc/ota/NewVersionHandler$ReturnCode;->NEW_VERSION_INVALID:Lcom/motorola/ccc/ota/NewVersionHandler$ReturnCode;
    :try_end_7
    .catchall {:try_start_7 .. :try_end_7} :catchall_0

    monitor-exit p0

    return-object v0

    :cond_9
    :try_start_8
    iget-object v3, v1, Lcom/motorola/ccc/ota/CusSM$SMNewVersionHandler;->this$0:Lcom/motorola/ccc/ota/CusSM;

    invoke-static {v3}, Lcom/motorola/ccc/ota/CusSM;->-$$Nest$fget_upgradePlugins(Lcom/motorola/ccc/ota/CusSM;)Lcom/motorola/ccc/ota/sources/UpgradeSources;

    move-result-object v3

    invoke-virtual {v3, v2}, Lcom/motorola/ccc/ota/sources/UpgradeSources;->getUpgradeSource(Lcom/motorola/ccc/ota/sources/UpgradeSourceType;)Lcom/motorola/ccc/ota/sources/UpgradeSource;

    move-result-object v3

    invoke-virtual {v3, v0, v2}, Lcom/motorola/ccc/ota/sources/UpgradeSource;->isUpgradeAcceptable(Lcom/motorola/otalib/common/metaData/MetaData;Lcom/motorola/ccc/ota/sources/UpgradeSourceType;)[Ljava/lang/String;

    move-result-object v3

    aget-object v5, v3, v6

    const/4 v7, 0x1

    if-eqz v5, :cond_a

    const-string v5, "OtaApp"

    new-instance v9, Ljava/lang/StringBuilder;

    move-object/from16 v10, v27

    invoke-direct {v9, v10}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    aget-object v10, v3, v6

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-static {v5, v9}, Lcom/motorola/ccc/ota/utils/Logger;->info(Ljava/lang/String;Ljava/lang/String;)V

    iget-object v5, v1, Lcom/motorola/ccc/ota/CusSM$SMNewVersionHandler;->this$0:Lcom/motorola/ccc/ota/CusSM;

    invoke-virtual/range {p3 .. p3}, Lcom/motorola/ccc/ota/sources/UpgradeSourceType;->toString()Ljava/lang/String;

    move-result-object v9

    aget-object v10, v3, v6

    aget-object v11, v3, v7

    move-object v2, v5

    move-object v3, v4

    move-object/from16 v4, p1

    move-object v5, v9

    move-object/from16 v6, p2

    move-object v7, v10

    move-object/from16 v8, p4

    move-object v9, v11

    invoke-static/range {v2 .. v9}, Lcom/motorola/ccc/ota/CusSM;->-$$Nest$mfailNotify(Lcom/motorola/ccc/ota/CusSM;Ljava/lang/String;Lcom/motorola/otalib/common/metaData/MetaData;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    sget-object v0, Lcom/motorola/ccc/ota/NewVersionHandler$ReturnCode;->NEW_VERSION_INVALID:Lcom/motorola/ccc/ota/NewVersionHandler$ReturnCode;
    :try_end_8
    .catchall {:try_start_8 .. :try_end_8} :catchall_0

    monitor-exit p0

    return-object v0

    :cond_a
    :try_start_9
    iget-object v3, v1, Lcom/motorola/ccc/ota/CusSM$SMNewVersionHandler;->this$0:Lcom/motorola/ccc/ota/CusSM;

    invoke-static {v3}, Lcom/motorola/ccc/ota/CusSM;->-$$Nest$fgetsettings(Lcom/motorola/ccc/ota/CusSM;)Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    move-result-object v3

    sget-object v5, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->PREVIOUS_CANCELLED_OPT_CONTENT_TIMESTAMP:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    const-wide/16 v9, -0x1

    invoke-virtual {v3, v5, v9, v10}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->getLong(Lcom/motorola/otalib/common/settings/ISetting;J)J

    move-result-wide v11

    cmp-long v3, v11, v9

    if-eqz v3, :cond_b

    cmp-long v3, v11, p5

    if-nez v3, :cond_b

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v11

    iget-object v3, v1, Lcom/motorola/ccc/ota/CusSM$SMNewVersionHandler;->this$0:Lcom/motorola/ccc/ota/CusSM;

    invoke-static {v3}, Lcom/motorola/ccc/ota/CusSM;->-$$Nest$fgetsettings(Lcom/motorola/ccc/ota/CusSM;)Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    move-result-object v3

    sget-object v5, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->PREVIOUS_CANCELLED_OPT_UPDATE_ANNOY_TIME:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    invoke-virtual {v3, v5, v14, v15}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->getLong(Lcom/motorola/otalib/common/settings/ISetting;J)J

    move-result-wide v13

    cmp-long v3, v11, v13

    if-gez v3, :cond_b

    const-string v7, "already working on...User has already declined this package and currently in don\'t bother me window"

    const-string v3, "OtaApp"

    const-string v5, "CusSM.handleNewVersion: already working on...User has already declined this package and currently in don\'t bother me window"

    invoke-static {v3, v5}, Lcom/motorola/ccc/ota/utils/Logger;->info(Ljava/lang/String;Ljava/lang/String;)V

    iget-object v3, v1, Lcom/motorola/ccc/ota/CusSM$SMNewVersionHandler;->this$0:Lcom/motorola/ccc/ota/CusSM;

    invoke-virtual/range {p3 .. p3}, Lcom/motorola/ccc/ota/sources/UpgradeSourceType;->toString()Ljava/lang/String;

    move-result-object v5

    const-string v9, "USER_IN_DONT_BOTHER_WINDOW."

    move-object v2, v3

    move-object v3, v4

    move-object/from16 v4, p1

    move-object/from16 v6, p2

    move-object/from16 v8, p4

    invoke-static/range {v2 .. v9}, Lcom/motorola/ccc/ota/CusSM;->-$$Nest$mfailNotify(Lcom/motorola/ccc/ota/CusSM;Ljava/lang/String;Lcom/motorola/otalib/common/metaData/MetaData;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    sget-object v0, Lcom/motorola/ccc/ota/NewVersionHandler$ReturnCode;->NEW_VERSION_INVALID:Lcom/motorola/ccc/ota/NewVersionHandler$ReturnCode;
    :try_end_9
    .catchall {:try_start_9 .. :try_end_9} :catchall_0

    monitor-exit p0

    return-object v0

    :cond_b
    :try_start_a
    invoke-virtual/range {p1 .. p1}, Lcom/motorola/otalib/common/metaData/MetaData;->getEnterpriseOta()Z

    move-result v3

    const/4 v5, 0x3

    if-eqz v3, :cond_c

    iget-object v3, v1, Lcom/motorola/ccc/ota/CusSM$SMNewVersionHandler;->this$0:Lcom/motorola/ccc/ota/CusSM;

    invoke-static {v3}, Lcom/motorola/ccc/ota/CusSM;->-$$Nest$fgetsystemUpdaterPolicy(Lcom/motorola/ccc/ota/CusSM;)Lcom/motorola/ccc/ota/env/SystemUpdaterPolicy;

    move-result-object v3

    invoke-virtual {v3}, Lcom/motorola/ccc/ota/env/SystemUpdaterPolicy;->getPolicyType()I

    move-result v3

    if-ne v3, v5, :cond_c

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v11

    iget-object v3, v1, Lcom/motorola/ccc/ota/CusSM$SMNewVersionHandler;->this$0:Lcom/motorola/ccc/ota/CusSM;

    invoke-static {v3}, Lcom/motorola/ccc/ota/CusSM;->-$$Nest$fgetsettings(Lcom/motorola/ccc/ota/CusSM;)Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    move-result-object v3

    sget-object v13, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->SYSTEM_UPDATE_POLICY_POSTPONE:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    invoke-virtual {v3, v13, v9, v10}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->getLong(Lcom/motorola/otalib/common/settings/ISetting;J)J

    move-result-wide v13

    cmp-long v3, v11, v13

    if-gez v3, :cond_c

    iget-object v3, v1, Lcom/motorola/ccc/ota/CusSM$SMNewVersionHandler;->this$0:Lcom/motorola/ccc/ota/CusSM;

    invoke-static {v3}, Lcom/motorola/ccc/ota/CusSM;->-$$Nest$fgetsettings(Lcom/motorola/ccc/ota/CusSM;)Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    move-result-object v3

    sget-object v5, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->ONGOING_HISTORY_POLICY_DISPLAY_NAME:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    invoke-static {}, Lcom/motorola/ccc/ota/env/OtaApplication;->getGlobalContext()Landroid/content/Context;

    move-result-object v6

    invoke-virtual {v6}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v6

    const v7, 0x7f0e01dd

    invoke-virtual {v6, v7}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v3, v5, v6}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->setString(Lcom/motorola/otalib/common/settings/ISetting;Ljava/lang/String;)V

    new-instance v3, Ljava/lang/StringBuilder;

    move-object/from16 v5, v26

    invoke-direct {v3, v5}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v5, v1, Lcom/motorola/ccc/ota/CusSM$SMNewVersionHandler;->this$0:Lcom/motorola/ccc/ota/CusSM;

    invoke-static {v5}, Lcom/motorola/ccc/ota/CusSM;->-$$Nest$fgetsettings(Lcom/motorola/ccc/ota/CusSM;)Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    move-result-object v5

    sget-object v6, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->SYSTEM_UPDATE_POLICY_POSTPONE:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    invoke-virtual {v5, v6, v9, v10}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->getLong(Lcom/motorola/otalib/common/settings/ISetting;J)J

    move-result-wide v5

    invoke-virtual {v3, v5, v6}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    iget-object v3, v1, Lcom/motorola/ccc/ota/CusSM$SMNewVersionHandler;->this$0:Lcom/motorola/ccc/ota/CusSM;

    invoke-virtual/range {p3 .. p3}, Lcom/motorola/ccc/ota/sources/UpgradeSourceType;->toString()Ljava/lang/String;

    move-result-object v5

    const-string v9, "DEVICE_UNDER_SYSTEM_UPDATE_POLICY."

    move-object v2, v3

    move-object v3, v4

    move-object/from16 v4, p1

    move-object/from16 v6, p2

    move-object/from16 v8, p4

    invoke-static/range {v2 .. v9}, Lcom/motorola/ccc/ota/CusSM;->-$$Nest$mfailNotify(Lcom/motorola/ccc/ota/CusSM;Ljava/lang/String;Lcom/motorola/otalib/common/metaData/MetaData;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v2

    sget-object v4, Lcom/motorola/ccc/ota/ui/updateType/UpdateType$DIFFUpdateType;->SMR:Lcom/motorola/ccc/ota/ui/updateType/UpdateType$DIFFUpdateType;

    invoke-virtual {v4}, Lcom/motorola/ccc/ota/ui/updateType/UpdateType$DIFFUpdateType;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-virtual/range {p1 .. p1}, Lcom/motorola/otalib/common/metaData/MetaData;->getUpdateTypeData()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v4, v0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v0

    invoke-static {v2, v3, v0}, Lcom/motorola/ccc/ota/utils/CusUtilMethods;->notifySoftwareUpdate(JZ)V

    sget-object v0, Lcom/motorola/ccc/ota/NewVersionHandler$ReturnCode;->NEW_VERSION_INVALID:Lcom/motorola/ccc/ota/NewVersionHandler$ReturnCode;
    :try_end_a
    .catchall {:try_start_a .. :try_end_a} :catchall_0

    monitor-exit p0

    return-object v0

    :cond_c
    :try_start_b
    invoke-static {}, Lcom/motorola/ccc/ota/env/OtaApplication;->getGlobalContext()Landroid/content/Context;

    move-result-object v3

    invoke-static {v3}, Lcom/motorola/ccc/ota/utils/CusUtilMethods;->isItFirstNetOnFota(Landroid/content/Context;)Z

    move-result v3

    if-eqz v3, :cond_d

    const/16 v3, 0xf0

    invoke-static {v0, v3, v5}, Lcom/motorola/ccc/ota/utils/MetadataOverrider;->overWriteAttFirstNetUpdateReminderValues(Lcom/motorola/otalib/common/metaData/MetaData;II)Lcom/motorola/otalib/common/metaData/MetaData;

    move-result-object v0

    :cond_d
    move-object v9, v0

    iget-object v0, v1, Lcom/motorola/ccc/ota/CusSM$SMNewVersionHandler;->this$0:Lcom/motorola/ccc/ota/CusSM;

    invoke-static {v0}, Lcom/motorola/ccc/ota/CusSM;->-$$Nest$fgetsettings(Lcom/motorola/ccc/ota/CusSM;)Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    move-result-object v10

    iget-object v0, v1, Lcom/motorola/ccc/ota/CusSM$SMNewVersionHandler;->this$0:Lcom/motorola/ccc/ota/CusSM;

    invoke-static {v0}, Lcom/motorola/ccc/ota/CusSM;->-$$Nest$fgetsettings(Lcom/motorola/ccc/ota/CusSM;)Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    move-result-object v0

    sget-object v3, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->TRIGGERED_BY:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    invoke-virtual {v0, v3}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->getString(Lcom/motorola/otalib/common/settings/ISetting;)Ljava/lang/String;

    move-result-object v11

    const/4 v12, 0x0

    move-object/from16 v13, p7

    move-object/from16 v14, p8

    invoke-static/range {v9 .. v14}, Lcom/motorola/ccc/ota/utils/MetadataOverrider;->from(Lcom/motorola/otalib/common/metaData/MetaData;Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;Ljava/lang/String;ZLjava/lang/String;Ljava/lang/String;)Lcom/motorola/otalib/common/metaData/MetaData;

    move-result-object v0

    iget-object v3, v1, Lcom/motorola/ccc/ota/CusSM$SMNewVersionHandler;->this$0:Lcom/motorola/ccc/ota/CusSM;

    invoke-static {v3}, Lcom/motorola/ccc/ota/CusSM;->-$$Nest$fgetsettings(Lcom/motorola/ccc/ota/CusSM;)Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    move-result-object v3

    sget-object v5, Lcom/motorola/ccc/ota/sources/UpgradeSourceType;->modem:Lcom/motorola/ccc/ota/sources/UpgradeSourceType;

    if-ne v5, v2, :cond_e

    move v6, v7

    :cond_e
    invoke-static {v0, v3, v6}, Lcom/motorola/ccc/ota/utils/MetadataOverrider;->saveMetadata(Lcom/motorola/otalib/common/metaData/MetaData;Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;Z)Z

    move-result v3

    if-nez v3, :cond_f

    const-string v0, "OtaApp"

    const-string v2, "CusSM.handleNewVersion failed: could not store overridedmetadata in prefs"

    invoke-static {v0, v2}, Lcom/motorola/ccc/ota/utils/Logger;->error(Ljava/lang/String;Ljava/lang/String;)V

    sget-object v0, Lcom/motorola/ccc/ota/NewVersionHandler$ReturnCode;->NEW_VERSION_FAIL:Lcom/motorola/ccc/ota/NewVersionHandler$ReturnCode;
    :try_end_b
    .catchall {:try_start_b .. :try_end_b} :catchall_0

    monitor-exit p0

    return-object v0

    :cond_f
    :try_start_c
    iget-object v3, v1, Lcom/motorola/ccc/ota/CusSM$SMNewVersionHandler;->this$0:Lcom/motorola/ccc/ota/CusSM;

    invoke-static {v3}, Lcom/motorola/ccc/ota/CusSM;->-$$Nest$fgetsystemUpdaterPolicy(Lcom/motorola/ccc/ota/CusSM;)Lcom/motorola/ccc/ota/env/SystemUpdaterPolicy;

    move-result-object v3

    invoke-virtual {v3}, Lcom/motorola/ccc/ota/env/SystemUpdaterPolicy;->isAutoDownloadOverAnyDataNetworkPolicySet()Z

    move-result v3

    if-eqz v3, :cond_10

    new-instance v3, Ljava/lang/StringBuilder;

    move-object/from16 v5, v17

    invoke-direct {v3, v5}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v3, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    move-object v8, v3

    :cond_10
    invoke-virtual {v0}, Lcom/motorola/otalib/common/metaData/MetaData;->isWifiOnly()Z

    move-result v3

    if-eqz v3, :cond_11

    new-instance v3, Ljava/lang/StringBuilder;

    move-object/from16 v5, v25

    invoke-direct {v3, v5}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v3, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    move-object v8, v3

    :cond_11
    sget-object v3, Lcom/motorola/ccc/ota/sources/UpgradeSourceType;->sdcard:Lcom/motorola/ccc/ota/sources/UpgradeSourceType;

    if-ne v3, v2, :cond_12

    invoke-static {}, Lcom/motorola/ccc/ota/utils/BuildPropReader;->doesDeviceSupportVABUpdate()Z

    move-result v3

    if-eqz v3, :cond_12

    const-string v3, "validation"

    invoke-virtual {v0}, Lcom/motorola/otalib/common/metaData/MetaData;->getPackageType()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v3, v5}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_12

    sget-object v0, Lcom/motorola/ccc/ota/NewVersionHandler$ReturnCode;->VAB_VALIDATION_PKG_FOUND:Lcom/motorola/ccc/ota/NewVersionHandler$ReturnCode;
    :try_end_c
    .catchall {:try_start_c .. :try_end_c} :catchall_0

    monitor-exit p0

    return-object v0

    :cond_12
    :try_start_d
    iget-object v3, v1, Lcom/motorola/ccc/ota/CusSM$SMNewVersionHandler;->this$0:Lcom/motorola/ccc/ota/CusSM;

    invoke-static {v3}, Lcom/motorola/ccc/ota/CusSM;->-$$Nest$fget_db(Lcom/motorola/ccc/ota/CusSM;)Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database;

    move-result-object v3

    invoke-virtual/range {p3 .. p3}, Lcom/motorola/ccc/ota/sources/UpgradeSourceType;->toString()Ljava/lang/String;

    move-result-object v2

    move-object/from16 p3, v3

    move-object/from16 p4, v4

    move-object/from16 p5, v2

    move-object/from16 p6, v0

    move-object/from16 p7, p2

    move-object/from16 p8, v8

    invoke-interface/range {p3 .. p8}, Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database;->insert(Ljava/lang/String;Ljava/lang/String;Lcom/motorola/otalib/common/metaData/MetaData;Ljava/lang/String;Ljava/lang/String;)Z

    move-result v2

    if-nez v2, :cond_13

    const-string v0, "OtaApp"

    new-instance v2, Ljava/lang/StringBuilder;

    move-object/from16 v3, v16

    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, "in db"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v0, v2}, Lcom/motorola/ccc/ota/utils/Logger;->error(Ljava/lang/String;Ljava/lang/String;)V

    sget-object v0, Lcom/motorola/ccc/ota/NewVersionHandler$ReturnCode;->NEW_VERSION_FAIL:Lcom/motorola/ccc/ota/NewVersionHandler$ReturnCode;
    :try_end_d
    .catchall {:try_start_d .. :try_end_d} :catchall_0

    monitor-exit p0

    return-object v0

    :cond_13
    :try_start_e
    iget-object v2, v1, Lcom/motorola/ccc/ota/CusSM$SMNewVersionHandler;->this$0:Lcom/motorola/ccc/ota/CusSM;

    invoke-static {v2}, Lcom/motorola/ccc/ota/CusSM;->-$$Nest$fget_env(Lcom/motorola/ccc/ota/CusSM;)Lcom/motorola/otalib/common/Environment/ApplicationEnv;

    move-result-object v2

    invoke-interface {v2}, Lcom/motorola/otalib/common/Environment/ApplicationEnv;->getUtilities()Lcom/motorola/otalib/common/Environment/ApplicationEnv$Utilities;

    move-result-object v2

    invoke-interface {v2}, Lcom/motorola/otalib/common/Environment/ApplicationEnv$Utilities;->sendUpdaterStateReset()V

    iget-object v2, v1, Lcom/motorola/ccc/ota/CusSM$SMNewVersionHandler;->this$0:Lcom/motorola/ccc/ota/CusSM;

    invoke-static {v2}, Lcom/motorola/ccc/ota/CusSM;->-$$Nest$fgetsettings(Lcom/motorola/ccc/ota/CusSM;)Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    move-result-object v2

    sget-object v3, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->STATS_FEATURE:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    invoke-virtual {v2, v3}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->getString(Lcom/motorola/otalib/common/settings/ISetting;)Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Lcom/motorola/ccc/ota/ui/UpdaterUtils;->isFeatureOn(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_14

    iget-object v2, v1, Lcom/motorola/ccc/ota/CusSM$SMNewVersionHandler;->this$0:Lcom/motorola/ccc/ota/CusSM;

    invoke-static {v2}, Lcom/motorola/ccc/ota/CusSM;->-$$Nest$fget_sl(Lcom/motorola/ccc/ota/CusSM;)Lcom/motorola/ccc/ota/stats/StatsListener;

    move-result-object v2

    invoke-virtual {v2}, Lcom/motorola/ccc/ota/stats/StatsListener;->startStatsListener()V

    iget-object v2, v1, Lcom/motorola/ccc/ota/CusSM$SMNewVersionHandler;->this$0:Lcom/motorola/ccc/ota/CusSM;

    invoke-static {v2}, Lcom/motorola/ccc/ota/CusSM;->-$$Nest$fgetsettings(Lcom/motorola/ccc/ota/CusSM;)Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    move-result-object v2

    sget-object v3, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->STATS_ROOT_STATUS_BEFORE_UPGRADE:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    invoke-static {}, Lcom/motorola/ccc/ota/utils/BuildPropReader;->getRootStatus()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v2, v3, v4}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->setString(Lcom/motorola/otalib/common/settings/ISetting;Ljava/lang/String;)V

    iget-object v2, v1, Lcom/motorola/ccc/ota/CusSM$SMNewVersionHandler;->this$0:Lcom/motorola/ccc/ota/CusSM;

    invoke-static {v2}, Lcom/motorola/ccc/ota/CusSM;->-$$Nest$fgetsettings(Lcom/motorola/ccc/ota/CusSM;)Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    move-result-object v2

    sget-object v3, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->STATS_UPGRADE_SOURCE:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    iget-object v4, v1, Lcom/motorola/ccc/ota/CusSM$SMNewVersionHandler;->this$0:Lcom/motorola/ccc/ota/CusSM;

    invoke-static {v4}, Lcom/motorola/ccc/ota/CusSM;->-$$Nest$fgetsettings(Lcom/motorola/ccc/ota/CusSM;)Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    move-result-object v4

    sget-object v5, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->TRIGGERED_BY:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    invoke-virtual {v4, v5}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->getString(Lcom/motorola/otalib/common/settings/ISetting;)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v2, v3, v4}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->setString(Lcom/motorola/otalib/common/settings/ISetting;Ljava/lang/String;)V

    :cond_14
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v2

    sget-object v4, Lcom/motorola/ccc/ota/ui/updateType/UpdateType$DIFFUpdateType;->SMR:Lcom/motorola/ccc/ota/ui/updateType/UpdateType$DIFFUpdateType;

    invoke-virtual {v4}, Lcom/motorola/ccc/ota/ui/updateType/UpdateType$DIFFUpdateType;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v0}, Lcom/motorola/otalib/common/metaData/MetaData;->getUpdateTypeData()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v4, v0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v0

    invoke-static {v2, v3, v0}, Lcom/motorola/ccc/ota/utils/CusUtilMethods;->notifySoftwareUpdate(JZ)V

    sget-object v0, Lcom/motorola/ccc/ota/NewVersionHandler$ReturnCode;->NEW_VERSION_OK:Lcom/motorola/ccc/ota/NewVersionHandler$ReturnCode;
    :try_end_e
    .catchall {:try_start_e .. :try_end_e} :catchall_0

    monitor-exit p0

    return-object v0

    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method
