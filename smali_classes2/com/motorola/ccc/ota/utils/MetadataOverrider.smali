.class public Lcom/motorola/ccc/ota/utils/MetadataOverrider;
.super Ljava/lang/Object;
.source "MetadataOverrider.java"


# direct methods
.method public constructor <init>()V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static from(Lcom/motorola/otalib/common/metaData/MetaData;Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;Ljava/lang/String;ZLjava/lang/String;Ljava/lang/String;)Lcom/motorola/otalib/common/metaData/MetaData;
    .locals 0

    if-eqz p3, :cond_0

    sget-object p3, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->METADATA_ORIGINAL:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    invoke-virtual {p1, p3}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->getString(Lcom/motorola/otalib/common/settings/ISetting;)Ljava/lang/String;

    move-result-object p1

    invoke-static {p1}, Lcom/motorola/otalib/common/metaData/builder/MetaDataBuilder;->from(Ljava/lang/String;)Lcom/motorola/otalib/common/metaData/MetaData;

    move-result-object p3

    if-eqz p1, :cond_0

    if-eqz p3, :cond_0

    move-object p0, p3

    :cond_0
    invoke-virtual {p0}, Lcom/motorola/otalib/common/metaData/MetaData;->getUiWorkflowControl()Lorg/json/JSONObject;

    move-result-object p1

    if-eqz p1, :cond_6

    invoke-static {p2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result p1

    if-eqz p1, :cond_1

    goto/16 :goto_1

    :cond_1
    :try_start_0
    new-instance p1, Lorg/json/JSONObject;

    invoke-virtual {p0}, Lcom/motorola/otalib/common/metaData/MetaData;->getUiWorkflowControl()Lorg/json/JSONObject;

    move-result-object p3

    invoke-virtual {p3}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    move-result-object p3

    invoke-direct {p1, p3}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    sget-object p3, Lcom/motorola/ccc/ota/utils/MetadataOverrider$1;->$SwitchMap$com$motorola$otalib$common$metaData$CheckForUpgradeTriggeredBy:[I

    invoke-static {p2}, Lcom/motorola/otalib/common/metaData/CheckForUpgradeTriggeredBy;->valueOf(Ljava/lang/String;)Lcom/motorola/otalib/common/metaData/CheckForUpgradeTriggeredBy;

    move-result-object p2

    invoke-virtual {p2}, Lcom/motorola/otalib/common/metaData/CheckForUpgradeTriggeredBy;->ordinal()I

    move-result p2

    aget p2, p3, p2

    const/4 p3, 0x1

    if-eq p2, p3, :cond_5

    const/4 p3, 0x2

    if-eq p2, p3, :cond_4

    const/4 p3, 0x3

    if-eq p2, p3, :cond_3

    const/4 p3, 0x4

    if-eq p2, p3, :cond_2

    return-object p0

    :cond_2
    const-string p2, "polling"

    invoke-virtual {p1, p2}, Lorg/json/JSONObject;->getJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object p1

    sget-object p2, Lcom/motorola/otalib/common/metaData/CheckForUpgradeTriggeredBy;->polling:Lcom/motorola/otalib/common/metaData/CheckForUpgradeTriggeredBy;

    invoke-virtual {p2}, Lcom/motorola/otalib/common/metaData/CheckForUpgradeTriggeredBy;->name()Ljava/lang/String;

    move-result-object p2

    invoke-static {p1, p0, p4, p5, p2}, Lcom/motorola/ccc/ota/utils/MetadataOverrider;->getOverridedMetadata(Lorg/json/JSONObject;Lcom/motorola/otalib/common/metaData/MetaData;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Lcom/motorola/otalib/common/metaData/MetaData;

    move-result-object p0

    goto :goto_0

    :cond_3
    const-string p2, "notification"

    invoke-virtual {p1, p2}, Lorg/json/JSONObject;->getJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object p1

    sget-object p2, Lcom/motorola/otalib/common/metaData/CheckForUpgradeTriggeredBy;->notification:Lcom/motorola/otalib/common/metaData/CheckForUpgradeTriggeredBy;

    invoke-virtual {p2}, Lcom/motorola/otalib/common/metaData/CheckForUpgradeTriggeredBy;->name()Ljava/lang/String;

    move-result-object p2

    invoke-static {p1, p0, p4, p5, p2}, Lcom/motorola/ccc/ota/utils/MetadataOverrider;->getOverridedMetadata(Lorg/json/JSONObject;Lcom/motorola/otalib/common/metaData/MetaData;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Lcom/motorola/otalib/common/metaData/MetaData;

    move-result-object p0

    goto :goto_0

    :cond_4
    const-string p2, "setup"

    invoke-virtual {p1, p2}, Lorg/json/JSONObject;->getJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object p1

    sget-object p2, Lcom/motorola/otalib/common/metaData/CheckForUpgradeTriggeredBy;->setup:Lcom/motorola/otalib/common/metaData/CheckForUpgradeTriggeredBy;

    invoke-virtual {p2}, Lcom/motorola/otalib/common/metaData/CheckForUpgradeTriggeredBy;->name()Ljava/lang/String;

    move-result-object p2

    invoke-static {p1, p0, p4, p5, p2}, Lcom/motorola/ccc/ota/utils/MetadataOverrider;->getOverridedMetadata(Lorg/json/JSONObject;Lcom/motorola/otalib/common/metaData/MetaData;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Lcom/motorola/otalib/common/metaData/MetaData;

    move-result-object p0

    goto :goto_0

    :cond_5
    const-string p2, "user"

    invoke-virtual {p1, p2}, Lorg/json/JSONObject;->getJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object p1

    sget-object p2, Lcom/motorola/otalib/common/metaData/CheckForUpgradeTriggeredBy;->user:Lcom/motorola/otalib/common/metaData/CheckForUpgradeTriggeredBy;

    invoke-virtual {p2}, Lcom/motorola/otalib/common/metaData/CheckForUpgradeTriggeredBy;->name()Ljava/lang/String;

    move-result-object p2

    invoke-static {p1, p0, p4, p5, p2}, Lcom/motorola/ccc/ota/utils/MetadataOverrider;->getOverridedMetadata(Lorg/json/JSONObject;Lcom/motorola/otalib/common/metaData/MetaData;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Lcom/motorola/otalib/common/metaData/MetaData;

    move-result-object p0
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    :goto_0
    return-object p0

    :catch_0
    move-exception p1

    new-instance p2, Ljava/lang/StringBuilder;

    const-string p3, "Exception in MetadataOverrider.from "

    invoke-direct {p2, p3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    const-string p2, "OtaApp"

    invoke-static {p2, p1}, Lcom/motorola/ccc/ota/utils/Logger;->debug(Ljava/lang/String;Ljava/lang/String;)V

    :cond_6
    :goto_1
    return-object p0
.end method

.method private static getOverridedMetadata(Lorg/json/JSONObject;Lcom/motorola/otalib/common/metaData/MetaData;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Lcom/motorola/otalib/common/metaData/MetaData;
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/json/JSONException;
        }
    .end annotation

    new-instance v0, Lorg/json/JSONObject;

    invoke-direct {v0}, Lorg/json/JSONObject;-><init>()V

    invoke-virtual {p1}, Lcom/motorola/otalib/common/metaData/MetaData;->isForced()Z

    move-result v1

    const-string v2, "forced"

    invoke-virtual {p0, v2, v1}, Lorg/json/JSONObject;->optBoolean(Ljava/lang/String;Z)Z

    move-result v1

    invoke-virtual {v0, v2, v1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Z)Lorg/json/JSONObject;

    move-result-object v1

    invoke-virtual {p1}, Lcom/motorola/otalib/common/metaData/MetaData;->isWifiOnly()Z

    move-result v2

    const-string v3, "wifionly"

    invoke-virtual {p0, v3, v2}, Lorg/json/JSONObject;->optBoolean(Ljava/lang/String;Z)Z

    move-result v2

    invoke-virtual {v1, v3, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Z)Lorg/json/JSONObject;

    move-result-object v1

    invoke-virtual {p1}, Lcom/motorola/otalib/common/metaData/MetaData;->showPreDownloadDialog()Z

    move-result v2

    const-string v3, "showPreDownloadDialog"

    invoke-virtual {p0, v3, v2}, Lorg/json/JSONObject;->optBoolean(Ljava/lang/String;Z)Z

    move-result v2

    invoke-virtual {v1, v3, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Z)Lorg/json/JSONObject;

    move-result-object v1

    invoke-virtual {p1}, Lcom/motorola/otalib/common/metaData/MetaData;->showDownloadOptions()Z

    move-result v2

    const-string v3, "showDownloadOptions"

    invoke-virtual {p0, v3, v2}, Lorg/json/JSONObject;->optBoolean(Ljava/lang/String;Z)Z

    move-result v2

    invoke-virtual {v1, v3, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Z)Lorg/json/JSONObject;

    move-result-object v1

    invoke-virtual {p1}, Lcom/motorola/otalib/common/metaData/MetaData;->getPreDownloadNotificationExpiryMins()I

    move-result v2

    const-string v3, "preDownloadNotificationExpiryMins"

    invoke-virtual {p0, v3, v2}, Lorg/json/JSONObject;->optInt(Ljava/lang/String;I)I

    move-result v2

    invoke-virtual {v1, v3, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;I)Lorg/json/JSONObject;

    move-result-object v1

    invoke-virtual {p1}, Lcom/motorola/otalib/common/metaData/MetaData;->getPreInstallNotificationExpiryMins()I

    move-result v2

    const-string v3, "preInstallNotificationExpiryMins"

    invoke-virtual {p0, v3, v2}, Lorg/json/JSONObject;->optInt(Ljava/lang/String;I)I

    move-result v2

    invoke-virtual {v1, v3, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;I)Lorg/json/JSONObject;

    move-result-object v1

    invoke-virtual {p1}, Lcom/motorola/otalib/common/metaData/MetaData;->showDownloadProgress()Z

    move-result v2

    const-string v3, "showDownloadProgress"

    invoke-virtual {p0, v3, v2}, Lorg/json/JSONObject;->optBoolean(Ljava/lang/String;Z)Z

    move-result v2

    invoke-virtual {v1, v3, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Z)Lorg/json/JSONObject;

    move-result-object v1

    invoke-virtual {p1}, Lcom/motorola/otalib/common/metaData/MetaData;->showPreInstallScreen()Z

    move-result v2

    const-string v3, "showPreInstallScreen"

    invoke-virtual {p0, v3, v2}, Lorg/json/JSONObject;->optBoolean(Ljava/lang/String;Z)Z

    move-result v2

    invoke-virtual {v1, v3, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Z)Lorg/json/JSONObject;

    move-result-object v1

    invoke-virtual {p1}, Lcom/motorola/otalib/common/metaData/MetaData;->showPostInstallScreen()Z

    move-result v2

    const-string v3, "showPostInstallScreen"

    invoke-virtual {p0, v3, v2}, Lorg/json/JSONObject;->optBoolean(Ljava/lang/String;Z)Z

    move-result v2

    invoke-virtual {v1, v3, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Z)Lorg/json/JSONObject;

    move-result-object v1

    invoke-virtual {p1}, Lcom/motorola/otalib/common/metaData/MetaData;->getRebootRequired()Z

    move-result v2

    const-string v3, "rebootRequired"

    invoke-virtual {p0, v3, v2}, Lorg/json/JSONObject;->optBoolean(Ljava/lang/String;Z)Z

    move-result p0

    invoke-virtual {v1, v3, p0}, Lorg/json/JSONObject;->put(Ljava/lang/String;Z)Lorg/json/JSONObject;

    move-result-object p0

    const-string v1, "reportingTag"

    invoke-virtual {p0, v1, p2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    move-result-object p0

    const-string p2, "trackingId"

    invoke-virtual {p0, p2, p3}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    move-result-object p0

    const-string p2, "updateReqTriggeredBy"

    invoke-virtual {p0, p2, p4}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    invoke-static {p1, v0}, Lcom/motorola/ccc/ota/utils/MetadataOverrider;->returnOverWrittenMetaData(Lcom/motorola/otalib/common/metaData/MetaData;Lorg/json/JSONObject;)Lcom/motorola/otalib/common/metaData/MetaData;

    move-result-object p0

    return-object p0
.end method

.method public static overWriteASCMetaDataValues(Lcom/motorola/otalib/common/metaData/MetaData;Landroid/content/Context;)Lcom/motorola/otalib/common/metaData/MetaData;
    .locals 6

    const-string v0, "OtaApp"

    if-nez p0, :cond_0

    const-string p0, "MetadataOverrider.overWriteAttFirstNetUpdateReminderValues, strange no metadata .. return"

    invoke-static {v0, p0}, Lcom/motorola/ccc/ota/utils/Logger;->debug(Ljava/lang/String;Ljava/lang/String;)V

    const/4 p0, 0x0

    return-object p0

    :cond_0
    invoke-static {p1}, Lcom/motorola/ccc/ota/sources/bota/thinkshield/ThinkShieldUtils;->getAscOverridenMetaData(Landroid/content/Context;)Ljava/util/Map;

    move-result-object p1

    const-string v1, "CRITICAL_UPDATE_REMINDER"

    invoke-interface {p1, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/Integer;

    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    move-result v1

    const-string v2, "CRITICAL_UPDATE_DEFER_COUNT"

    invoke-interface {p1, v2}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/Integer;

    invoke-virtual {v2}, Ljava/lang/Integer;->intValue()I

    move-result v2

    const-string v3, "SHOW_PRE_DOWNLOAD_DIALOG"

    invoke-interface {p1, v3}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/lang/Integer;

    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    move-result p1

    :try_start_0
    new-instance v3, Lorg/json/JSONObject;

    invoke-direct {v3}, Lorg/json/JSONObject;-><init>()V

    const/4 v4, 0x0

    if-ltz v1, :cond_1

    const-string v5, "criticalUpdateReminder"

    invoke-virtual {v3, v5, v1}, Lorg/json/JSONObject;->put(Ljava/lang/String;I)Lorg/json/JSONObject;

    move-result-object v1

    const-string v5, "criticalUpdateDeferCount"

    invoke-virtual {v1, v5, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;I)Lorg/json/JSONObject;

    move-result-object v1

    const-string v2, "criticalUpdateExtraWaitCount"

    invoke-virtual {v1, v2, v4}, Lorg/json/JSONObject;->put(Ljava/lang/String;I)Lorg/json/JSONObject;

    move-result-object v1

    const-string v2, "criticalUpdateExtraWaitPeriod"

    invoke-virtual {v1, v2, v4}, Lorg/json/JSONObject;->put(Ljava/lang/String;I)Lorg/json/JSONObject;

    move-result-object v1

    const-string v2, "severityType"

    sget-object v5, Lcom/motorola/otalib/common/utils/UpgradeUtils$SeverityType;->CRITICAL:Lcom/motorola/otalib/common/utils/UpgradeUtils$SeverityType;

    invoke-virtual {v5}, Lcom/motorola/otalib/common/utils/UpgradeUtils$SeverityType;->ordinal()I

    move-result v5

    invoke-virtual {v1, v2, v5}, Lorg/json/JSONObject;->put(Ljava/lang/String;I)Lorg/json/JSONObject;
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    :cond_1
    const-string v1, "showPreDownloadDialog"

    if-nez p1, :cond_2

    :try_start_1
    invoke-virtual {v3, v1, v4}, Lorg/json/JSONObject;->put(Ljava/lang/String;Z)Lorg/json/JSONObject;

    goto :goto_0

    :cond_2
    const/4 v2, 0x1

    if-ne p1, v2, :cond_3

    invoke-virtual {v3, v1, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Z)Lorg/json/JSONObject;

    :cond_3
    :goto_0
    invoke-static {p0, v3}, Lcom/motorola/ccc/ota/utils/MetadataOverrider;->returnOverWrittenMetaData(Lcom/motorola/otalib/common/metaData/MetaData;Lorg/json/JSONObject;)Lcom/motorola/otalib/common/metaData/MetaData;

    move-result-object p0
    :try_end_1
    .catch Lorg/json/JSONException; {:try_start_1 .. :try_end_1} :catch_0

    return-object p0

    :catch_0
    move-exception p1

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "Exception in overWriteASCCriticalUpdateReminderValues.from "

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {v0, p1}, Lcom/motorola/ccc/ota/utils/Logger;->error(Ljava/lang/String;Ljava/lang/String;)V

    return-object p0
.end method

.method public static overWriteAttFirstNetUpdateReminderValues(Lcom/motorola/otalib/common/metaData/MetaData;II)Lcom/motorola/otalib/common/metaData/MetaData;
    .locals 3

    const-string v0, "OtaApp"

    if-nez p0, :cond_0

    const-string p0, "MetadataOverrider.overWriteAttFirstNetUpdateReminderValues, strange no metadata .. return"

    invoke-static {v0, p0}, Lcom/motorola/ccc/ota/utils/Logger;->debug(Ljava/lang/String;Ljava/lang/String;)V

    const/4 p0, 0x0

    return-object p0

    :cond_0
    :try_start_0
    new-instance v1, Lorg/json/JSONObject;

    invoke-direct {v1}, Lorg/json/JSONObject;-><init>()V

    const-string v2, "criticalUpdateReminder"

    invoke-virtual {v1, v2, p1}, Lorg/json/JSONObject;->put(Ljava/lang/String;I)Lorg/json/JSONObject;

    move-result-object p1

    const-string v2, "criticalUpdateDeferCount"

    invoke-virtual {p1, v2, p2}, Lorg/json/JSONObject;->put(Ljava/lang/String;I)Lorg/json/JSONObject;

    invoke-static {p0, v1}, Lcom/motorola/ccc/ota/utils/MetadataOverrider;->returnOverWrittenMetaData(Lcom/motorola/otalib/common/metaData/MetaData;Lorg/json/JSONObject;)Lcom/motorola/otalib/common/metaData/MetaData;

    move-result-object p0
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    return-object p0

    :catch_0
    move-exception p1

    new-instance p2, Ljava/lang/StringBuilder;

    const-string v1, "Exception in MetadataOverrider.from "

    invoke-direct {p2, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {v0, p1}, Lcom/motorola/ccc/ota/utils/Logger;->error(Ljava/lang/String;Ljava/lang/String;)V

    return-object p0
.end method

.method public static overWriteForceUpgradeValues(Lcom/motorola/otalib/common/metaData/MetaData;Ljava/lang/String;Ljava/lang/String;)Lcom/motorola/otalib/common/metaData/MetaData;
    .locals 3

    const-string v0, "OtaApp"

    if-nez p0, :cond_0

    const-string p0, "MetadataOverrider.overWriteForceUpgradeValues, strange no metadata .. return"

    invoke-static {v0, p0}, Lcom/motorola/ccc/ota/utils/Logger;->debug(Ljava/lang/String;Ljava/lang/String;)V

    const/4 p0, 0x0

    return-object p0

    :cond_0
    :try_start_0
    new-instance v1, Lorg/json/JSONObject;

    invoke-direct {v1}, Lorg/json/JSONObject;-><init>()V

    const-string v2, "reportingTag"

    invoke-virtual {v1, v2, p1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    move-result-object p1

    const-string v2, "trackingId"

    invoke-virtual {p1, v2, p2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    move-result-object p1

    const-string p2, "showPreDownloadDialog"

    const/4 v2, 0x0

    invoke-virtual {p1, p2, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Z)Lorg/json/JSONObject;

    move-result-object p1

    const-string p2, "showDownloadProgress"

    invoke-virtual {p1, p2, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Z)Lorg/json/JSONObject;

    move-result-object p1

    const-string p2, "showPreInstallScreen"

    invoke-virtual {p1, p2, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Z)Lorg/json/JSONObject;

    invoke-static {p0, v1}, Lcom/motorola/ccc/ota/utils/MetadataOverrider;->returnOverWrittenMetaData(Lcom/motorola/otalib/common/metaData/MetaData;Lorg/json/JSONObject;)Lcom/motorola/otalib/common/metaData/MetaData;

    move-result-object p0
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    return-object p0

    :catch_0
    move-exception p1

    new-instance p2, Ljava/lang/StringBuilder;

    const-string v1, "Exception in MetadataOverrider.from "

    invoke-direct {p2, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {v0, p1}, Lcom/motorola/ccc/ota/utils/Logger;->error(Ljava/lang/String;Ljava/lang/String;)V

    return-object p0
.end method

.method public static overWriteMetaDataValuesOnOtaFailExpiry(Lcom/motorola/otalib/common/metaData/MetaData;Ljava/lang/String;Ljava/lang/String;)Lcom/motorola/otalib/common/metaData/MetaData;
    .locals 3

    const-string v0, "OtaApp"

    if-nez p0, :cond_0

    const-string p0, "MetadataOverrider.overWritePreDownloadAndInstallDialogValues, strange no metadata .. return"

    invoke-static {v0, p0}, Lcom/motorola/ccc/ota/utils/Logger;->debug(Ljava/lang/String;Ljava/lang/String;)V

    const/4 p0, 0x0

    return-object p0

    :cond_0
    :try_start_0
    new-instance v1, Lorg/json/JSONObject;

    invoke-direct {v1}, Lorg/json/JSONObject;-><init>()V

    const-string v2, "reportingTag"

    invoke-virtual {v1, v2, p1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    move-result-object p1

    const-string v2, "trackingId"

    invoke-virtual {p1, v2, p2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    move-result-object p1

    const-string p2, "showPreDownloadDialog"

    const/4 v2, 0x1

    invoke-virtual {p1, p2, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Z)Lorg/json/JSONObject;

    move-result-object p1

    const-string p2, "forceDownloadTime"

    const/4 v2, -0x1

    invoke-virtual {p1, p2, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;I)Lorg/json/JSONObject;

    invoke-static {p0, v1}, Lcom/motorola/ccc/ota/utils/MetadataOverrider;->returnOverWrittenMetaData(Lcom/motorola/otalib/common/metaData/MetaData;Lorg/json/JSONObject;)Lcom/motorola/otalib/common/metaData/MetaData;

    move-result-object p0
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    return-object p0

    :catch_0
    move-exception p1

    new-instance p2, Ljava/lang/StringBuilder;

    const-string v1, "Exception in MetadataOverrider.from "

    invoke-direct {p2, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {v0, p1}, Lcom/motorola/ccc/ota/utils/Logger;->error(Ljava/lang/String;Ljava/lang/String;)V

    return-object p0
.end method

.method public static overWriteModemMetaDataValues(Lcom/motorola/otalib/common/metaData/MetaData;)Lcom/motorola/otalib/common/metaData/MetaData;
    .locals 5

    const-string v0, "overWriteModemMetaDataValues"

    const-string v1, "OtaApp"

    invoke-static {v1, v0}, Lcom/motorola/ccc/ota/utils/Logger;->debug(Ljava/lang/String;Ljava/lang/String;)V

    if-nez p0, :cond_0

    const-string p0, "MetadataOverrider.overWriteModemMetaDataValues, strange no metadata .. return"

    invoke-static {v1, p0}, Lcom/motorola/ccc/ota/utils/Logger;->debug(Ljava/lang/String;Ljava/lang/String;)V

    const/4 p0, 0x0

    return-object p0

    :cond_0
    :try_start_0
    new-instance v0, Lorg/json/JSONObject;

    invoke-direct {v0}, Lorg/json/JSONObject;-><init>()V

    const-string v2, "showPreDownloadDialog"

    const/4 v3, 0x0

    invoke-virtual {v0, v2, v3}, Lorg/json/JSONObject;->put(Ljava/lang/String;Z)Lorg/json/JSONObject;

    move-result-object v2

    const-string v4, "showDownloadOptions"

    invoke-virtual {v2, v4, v3}, Lorg/json/JSONObject;->put(Ljava/lang/String;Z)Lorg/json/JSONObject;

    move-result-object v2

    const-string v4, "showDownloadProgress"

    invoke-virtual {v2, v4, v3}, Lorg/json/JSONObject;->put(Ljava/lang/String;Z)Lorg/json/JSONObject;

    move-result-object v2

    const-string v3, "forced"

    const/4 v4, 0x1

    invoke-virtual {v2, v3, v4}, Lorg/json/JSONObject;->put(Ljava/lang/String;Z)Lorg/json/JSONObject;

    invoke-static {p0, v0}, Lcom/motorola/ccc/ota/utils/MetadataOverrider;->returnOverWrittenMetaData(Lcom/motorola/otalib/common/metaData/MetaData;Lorg/json/JSONObject;)Lcom/motorola/otalib/common/metaData/MetaData;

    move-result-object p0
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    return-object p0

    :catch_0
    move-exception v0

    new-instance v2, Ljava/lang/StringBuilder;

    const-string v3, "Exception in MetadataOverrider:overWriteModemMetaDataValues.from "

    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v1, v0}, Lcom/motorola/ccc/ota/utils/Logger;->error(Ljava/lang/String;Ljava/lang/String;)V

    return-object p0
.end method

.method public static returnOverWrittenMetaData(Lcom/motorola/otalib/common/metaData/MetaData;Ljava/lang/String;J)Lcom/motorola/otalib/common/metaData/MetaData;
    .locals 1

    :try_start_0
    invoke-static {p0}, Lcom/motorola/otalib/common/metaData/builder/MetaDataBuilder;->toJSONObject(Lcom/motorola/otalib/common/metaData/MetaData;)Lorg/json/JSONObject;

    move-result-object v0

    invoke-virtual {v0, p1, p2, p3}, Lorg/json/JSONObject;->put(Ljava/lang/String;J)Lorg/json/JSONObject;

    invoke-static {v0}, Lcom/motorola/otalib/common/metaData/builder/MetaDataBuilder;->from(Lorg/json/JSONObject;)Lcom/motorola/otalib/common/metaData/MetaData;

    move-result-object p0
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    return-object p0

    :catch_0
    move-exception p1

    new-instance p2, Ljava/lang/StringBuilder;

    const-string p3, "Exception in MetadataOverrider, returnOverWrittenMetaData: "

    invoke-direct {p2, p3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    const-string p2, "OtaApp"

    invoke-static {p2, p1}, Lcom/motorola/ccc/ota/utils/Logger;->error(Ljava/lang/String;Ljava/lang/String;)V

    return-object p0
.end method

.method public static returnOverWrittenMetaData(Lcom/motorola/otalib/common/metaData/MetaData;Ljava/lang/String;Ljava/lang/String;)Lcom/motorola/otalib/common/metaData/MetaData;
    .locals 1

    :try_start_0
    invoke-static {p0}, Lcom/motorola/otalib/common/metaData/builder/MetaDataBuilder;->toJSONObject(Lcom/motorola/otalib/common/metaData/MetaData;)Lorg/json/JSONObject;

    move-result-object v0

    invoke-virtual {v0, p1, p2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    invoke-static {v0}, Lcom/motorola/otalib/common/metaData/builder/MetaDataBuilder;->from(Lorg/json/JSONObject;)Lcom/motorola/otalib/common/metaData/MetaData;

    move-result-object p0
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    return-object p0

    :catch_0
    move-exception p1

    new-instance p2, Ljava/lang/StringBuilder;

    const-string v0, "Exception in MetadataOverrider, returnOverWrittenMetaData: "

    invoke-direct {p2, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    const-string p2, "OtaApp"

    invoke-static {p2, p1}, Lcom/motorola/ccc/ota/utils/Logger;->error(Ljava/lang/String;Ljava/lang/String;)V

    return-object p0
.end method

.method public static returnOverWrittenMetaData(Lcom/motorola/otalib/common/metaData/MetaData;Ljava/lang/String;Z)Lcom/motorola/otalib/common/metaData/MetaData;
    .locals 1

    :try_start_0
    invoke-static {p0}, Lcom/motorola/otalib/common/metaData/builder/MetaDataBuilder;->toJSONObject(Lcom/motorola/otalib/common/metaData/MetaData;)Lorg/json/JSONObject;

    move-result-object v0

    invoke-virtual {v0, p1, p2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Z)Lorg/json/JSONObject;

    invoke-static {v0}, Lcom/motorola/otalib/common/metaData/builder/MetaDataBuilder;->from(Lorg/json/JSONObject;)Lcom/motorola/otalib/common/metaData/MetaData;

    move-result-object p0
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    return-object p0

    :catch_0
    move-exception p1

    new-instance p2, Ljava/lang/StringBuilder;

    const-string v0, "Exception in MetadataOverrider, returnOverWrittenMetaData: "

    invoke-direct {p2, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    const-string p2, "OtaApp"

    invoke-static {p2, p1}, Lcom/motorola/ccc/ota/utils/Logger;->error(Ljava/lang/String;Ljava/lang/String;)V

    return-object p0
.end method

.method public static returnOverWrittenMetaData(Lcom/motorola/otalib/common/metaData/MetaData;Lorg/json/JSONObject;)Lcom/motorola/otalib/common/metaData/MetaData;
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/json/JSONException;
        }
    .end annotation

    invoke-static {p0}, Lcom/motorola/otalib/common/metaData/builder/MetaDataBuilder;->toJSONObject(Lcom/motorola/otalib/common/metaData/MetaData;)Lorg/json/JSONObject;

    move-result-object v0

    if-nez v0, :cond_0

    return-object p0

    :cond_0
    invoke-virtual {p1}, Lorg/json/JSONObject;->keys()Ljava/util/Iterator;

    move-result-object p0

    :goto_0
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_8

    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    invoke-virtual {p1, v1}, Lorg/json/JSONObject;->get(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v2

    instance-of v3, v2, Ljava/lang/Integer;

    if-eqz v3, :cond_1

    invoke-virtual {p1, v1}, Lorg/json/JSONObject;->getInt(Ljava/lang/String;)I

    move-result v2

    invoke-virtual {v0, v1, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;I)Lorg/json/JSONObject;

    goto :goto_0

    :cond_1
    instance-of v3, v2, Ljava/lang/Long;

    if-eqz v3, :cond_2

    invoke-virtual {p1, v1}, Lorg/json/JSONObject;->getLong(Ljava/lang/String;)J

    move-result-wide v2

    invoke-virtual {v0, v1, v2, v3}, Lorg/json/JSONObject;->put(Ljava/lang/String;J)Lorg/json/JSONObject;

    goto :goto_0

    :cond_2
    instance-of v3, v2, Ljava/lang/Boolean;

    if-eqz v3, :cond_3

    invoke-virtual {p1, v1}, Lorg/json/JSONObject;->getBoolean(Ljava/lang/String;)Z

    move-result v2

    invoke-virtual {v0, v1, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Z)Lorg/json/JSONObject;

    goto :goto_0

    :cond_3
    instance-of v3, v2, Ljava/lang/String;

    if-eqz v3, :cond_4

    invoke-virtual {p1, v1}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    goto :goto_0

    :cond_4
    instance-of v3, v2, Ljava/lang/Double;

    if-eqz v3, :cond_5

    invoke-virtual {p1, v1}, Lorg/json/JSONObject;->getDouble(Ljava/lang/String;)D

    move-result-wide v2

    invoke-virtual {v0, v1, v2, v3}, Lorg/json/JSONObject;->put(Ljava/lang/String;D)Lorg/json/JSONObject;

    goto :goto_0

    :cond_5
    instance-of v3, v2, Lorg/json/JSONArray;

    if-eqz v3, :cond_6

    invoke-virtual {p1, v1}, Lorg/json/JSONObject;->getJSONArray(Ljava/lang/String;)Lorg/json/JSONArray;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    goto :goto_0

    :cond_6
    instance-of v3, v2, Lorg/json/JSONObject;

    if-eqz v3, :cond_7

    invoke-virtual {p1, v1}, Lorg/json/JSONObject;->getJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    goto :goto_0

    :cond_7
    invoke-virtual {v0, v1, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    goto :goto_0

    :cond_8
    invoke-static {v0}, Lcom/motorola/otalib/common/metaData/builder/MetaDataBuilder;->from(Lorg/json/JSONObject;)Lcom/motorola/otalib/common/metaData/MetaData;

    move-result-object p0

    return-object p0
.end method

.method public static saveMetadata(Lcom/motorola/otalib/common/metaData/MetaData;Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;Z)Z
    .locals 0

    if-eqz p2, :cond_0

    :try_start_0
    sget-object p2, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->MODEM_METADATA:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    invoke-static {p0}, Lcom/motorola/otalib/common/metaData/builder/MetaDataBuilder;->toJSONString(Lcom/motorola/otalib/common/metaData/MetaData;)Ljava/lang/String;

    move-result-object p0

    invoke-virtual {p1, p2, p0}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->setString(Lcom/motorola/otalib/common/settings/ISetting;Ljava/lang/String;)V

    goto :goto_0

    :cond_0
    sget-object p2, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->METADATA:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    invoke-static {p0}, Lcom/motorola/otalib/common/metaData/builder/MetaDataBuilder;->toJSONString(Lcom/motorola/otalib/common/metaData/MetaData;)Ljava/lang/String;

    move-result-object p0

    invoke-virtual {p1, p2, p0}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->setString(Lcom/motorola/otalib/common/settings/ISetting;Ljava/lang/String;)V
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    :goto_0
    const/4 p0, 0x1

    return p0

    :catch_0
    move-exception p0

    new-instance p1, Ljava/lang/StringBuilder;

    const-string p2, "saveMetadata, Exception in setting Metadata "

    invoke-direct {p1, p2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    const-string p1, "OtaApp"

    invoke-static {p1, p0}, Lcom/motorola/ccc/ota/utils/Logger;->error(Ljava/lang/String;Ljava/lang/String;)V

    const/4 p0, 0x0

    return p0
.end method
