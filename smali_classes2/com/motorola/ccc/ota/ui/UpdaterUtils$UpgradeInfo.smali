.class public final Lcom/motorola/ccc/ota/ui/UpdaterUtils$UpgradeInfo;
.super Ljava/lang/Object;
.source "UpdaterUtils.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/motorola/ccc/ota/ui/UpdaterUtils;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "UpgradeInfo"
.end annotation


# instance fields
.field private mAnnoy:Ljava/lang/String;

.field private mLocationType:Ljava/lang/String;

.field private mMetadataMMApi:Lorg/json/JSONObject;

.field private mMinutes:[I


# direct methods
.method public constructor <init>()V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public constructor <init>(Lorg/json/JSONObject;Ljava/lang/String;)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/motorola/ccc/ota/ui/UpdaterUtils$UpgradeInfo;->mMetadataMMApi:Lorg/json/JSONObject;

    iput-object p2, p0, Lcom/motorola/ccc/ota/ui/UpdaterUtils$UpgradeInfo;->mLocationType:Ljava/lang/String;

    :try_start_0
    const-string p2, "annoy"

    invoke-virtual {p1, p2}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p0, p1}, Lcom/motorola/ccc/ota/ui/UpdaterUtils$UpgradeInfo;->setAnnoy(Ljava/lang/String;)V
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    const-string p1, "1440"

    invoke-virtual {p0, p1}, Lcom/motorola/ccc/ota/ui/UpdaterUtils$UpgradeInfo;->setAnnoy(Ljava/lang/String;)V

    :goto_0
    return-void
.end method


# virtual methods
.method public getBitmap()I
    .locals 2

    iget-object p0, p0, Lcom/motorola/ccc/ota/ui/UpdaterUtils$UpgradeInfo;->mMetadataMMApi:Lorg/json/JSONObject;

    const-string v0, "featureEnableBitmap"

    const/4 v1, -0x1

    invoke-virtual {p0, v0, v1}, Lorg/json/JSONObject;->optInt(Ljava/lang/String;I)I

    move-result p0

    return p0
.end method

.method public getByPassPreDownloadDialog()Z
    .locals 1

    :try_start_0
    iget-object p0, p0, Lcom/motorola/ccc/ota/ui/UpdaterUtils$UpgradeInfo;->mMetadataMMApi:Lorg/json/JSONObject;

    const-string v0, "bypassPreDownloadDialog"

    invoke-virtual {p0, v0}, Lorg/json/JSONObject;->getBoolean(Ljava/lang/String;)Z

    move-result p0
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    return p0

    :catch_0
    const/4 p0, 0x0

    return p0
.end method

.method public getChunkSize()J
    .locals 3

    iget-object p0, p0, Lcom/motorola/ccc/ota/ui/UpdaterUtils$UpgradeInfo;->mMetadataMMApi:Lorg/json/JSONObject;

    const-string v0, "abMaxChunkSize"

    const-wide/16 v1, 0x0

    invoke-virtual {p0, v0, v1, v2}, Lorg/json/JSONObject;->optLong(Ljava/lang/String;J)J

    move-result-wide v0

    return-wide v0
.end method

.method public getCompatibilityFileSize()J
    .locals 2

    :try_start_0
    iget-object p0, p0, Lcom/motorola/ccc/ota/ui/UpdaterUtils$UpgradeInfo;->mMetadataMMApi:Lorg/json/JSONObject;

    const-string v0, "streamingData"

    invoke-virtual {p0, v0}, Lorg/json/JSONObject;->getJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object p0

    if-eqz p0, :cond_0

    const-string v0, "additionalInfo"

    invoke-virtual {p0, v0}, Lorg/json/JSONObject;->optJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object p0

    if-eqz p0, :cond_0

    const-string v0, "compatibility"

    invoke-virtual {p0, v0}, Lorg/json/JSONObject;->optJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object p0

    if-eqz p0, :cond_0

    const-string v0, "size"

    invoke-virtual {p0, v0}, Lorg/json/JSONObject;->getLong(Ljava/lang/String;)J

    move-result-wide v0
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    return-wide v0

    :catch_0
    move-exception p0

    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "Exception in UpdaterUtils, getCompatibilityFileSize: "

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    const-string v0, "OtaApp"

    invoke-static {v0, p0}, Lcom/motorola/ccc/ota/utils/Logger;->error(Ljava/lang/String;Ljava/lang/String;)V

    :cond_0
    const-wide/32 v0, 0x100000

    return-wide v0
.end method

.method public getCriticalDeferCount()I
    .locals 2

    iget-object p0, p0, Lcom/motorola/ccc/ota/ui/UpdaterUtils$UpgradeInfo;->mMetadataMMApi:Lorg/json/JSONObject;

    const-string v0, "criticalUpdateDeferCount"

    const/4 v1, 0x3

    invoke-virtual {p0, v0, v1}, Lorg/json/JSONObject;->optInt(Ljava/lang/String;I)I

    move-result p0

    return p0
.end method

.method public getCriticalUpdateExtraWaitCount()J
    .locals 3

    iget-object p0, p0, Lcom/motorola/ccc/ota/ui/UpdaterUtils$UpgradeInfo;->mMetadataMMApi:Lorg/json/JSONObject;

    const-string v0, "criticalUpdateExtraWaitCount"

    const-wide/16 v1, 0x6

    invoke-virtual {p0, v0, v1, v2}, Lorg/json/JSONObject;->optLong(Ljava/lang/String;J)J

    move-result-wide v0

    return-wide v0
.end method

.method public getCriticalUpdateExtraWaitPeriodInMillis()J
    .locals 4

    iget-object p0, p0, Lcom/motorola/ccc/ota/ui/UpdaterUtils$UpgradeInfo;->mMetadataMMApi:Lorg/json/JSONObject;

    const-string v0, "criticalUpdateExtraWaitPeriod"

    const-wide/16 v1, 0xa

    invoke-virtual {p0, v0, v1, v2}, Lorg/json/JSONObject;->optLong(Ljava/lang/String;J)J

    move-result-wide v0

    const-wide/32 v2, 0xea60

    mul-long/2addr v0, v2

    return-wide v0
.end method

.method public getCriticalUpdateReminder()I
    .locals 2

    iget-object p0, p0, Lcom/motorola/ccc/ota/ui/UpdaterUtils$UpgradeInfo;->mMetadataMMApi:Lorg/json/JSONObject;

    const-string v0, "criticalUpdateReminder"

    const/16 v1, 0xf0

    invoke-virtual {p0, v0, v1}, Lorg/json/JSONObject;->optInt(Ljava/lang/String;I)I

    move-result p0

    return p0
.end method

.method public getDelay(I)I
    .locals 2

    const-string v0, "bootstrap"

    iget-object v1, p0, Lcom/motorola/ccc/ota/ui/UpdaterUtils$UpgradeInfo;->mLocationType:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    const/4 v1, 0x1

    if-eqz v0, :cond_0

    return v1

    :cond_0
    iget-object p0, p0, Lcom/motorola/ccc/ota/ui/UpdaterUtils$UpgradeInfo;->mMinutes:[I

    array-length v0, p0

    if-lt p1, v0, :cond_1

    array-length p1, p0

    sub-int/2addr p1, v1

    aget p0, p0, p1

    return p0

    :cond_1
    aget p0, p0, p1

    return p0
.end method

.method public getDisplayVersion()Ljava/lang/String;
    .locals 1

    :try_start_0
    iget-object p0, p0, Lcom/motorola/ccc/ota/ui/UpdaterUtils$UpgradeInfo;->mMetadataMMApi:Lorg/json/JSONObject;

    const-string v0, "displayVersion"

    invoke-virtual {p0, v0}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    return-object p0

    :catch_0
    const/4 p0, 0x0

    return-object p0
.end method

.method public getEnterpriseOta()Z
    .locals 1

    :try_start_0
    iget-object p0, p0, Lcom/motorola/ccc/ota/ui/UpdaterUtils$UpgradeInfo;->mMetadataMMApi:Lorg/json/JSONObject;

    const-string v0, "enterpriseOta"

    invoke-virtual {p0, v0}, Lorg/json/JSONObject;->getBoolean(Ljava/lang/String;)Z

    move-result p0
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    return p0

    :catch_0
    const/4 p0, 0x0

    return p0
.end method

.method public getExtraSize()J
    .locals 2

    :try_start_0
    iget-object p0, p0, Lcom/motorola/ccc/ota/ui/UpdaterUtils$UpgradeInfo;->mMetadataMMApi:Lorg/json/JSONObject;

    const-string v0, "extraSpace"

    invoke-virtual {p0, v0}, Lorg/json/JSONObject;->getLong(Ljava/lang/String;)J

    move-result-wide v0
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    return-wide v0

    :catch_0
    const-wide/16 v0, -0x1

    return-wide v0
.end method

.method public getForceDownloadTime()D
    .locals 3

    iget-object p0, p0, Lcom/motorola/ccc/ota/ui/UpdaterUtils$UpgradeInfo;->mMetadataMMApi:Lorg/json/JSONObject;

    const-string v0, "forceDownloadTime"

    const-wide/high16 v1, -0x4010000000000000L    # -1.0

    invoke-virtual {p0, v0, v1, v2}, Lorg/json/JSONObject;->optDouble(Ljava/lang/String;D)D

    move-result-wide v0

    return-wide v0
.end method

.method public getForceInstallTime()D
    .locals 3

    iget-object p0, p0, Lcom/motorola/ccc/ota/ui/UpdaterUtils$UpgradeInfo;->mMetadataMMApi:Lorg/json/JSONObject;

    const-string v0, "forceInstallTime"

    const-wide/high16 v1, -0x4010000000000000L    # -1.0

    invoke-virtual {p0, v0, v1, v2}, Lorg/json/JSONObject;->optDouble(Ljava/lang/String;D)D

    move-result-wide v0

    return-wide v0
.end method

.method public getInstallTime()I
    .locals 1

    :try_start_0
    iget-object p0, p0, Lcom/motorola/ccc/ota/ui/UpdaterUtils$UpgradeInfo;->mMetadataMMApi:Lorg/json/JSONObject;

    const-string v0, "installTime"

    invoke-virtual {p0, v0}, Lorg/json/JSONObject;->getInt(Ljava/lang/String;)I

    move-result p0
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    return p0

    :catch_0
    const/4 p0, -0x1

    return p0
.end method

.method public getLocationType()Ljava/lang/String;
    .locals 0

    iget-object p0, p0, Lcom/motorola/ccc/ota/ui/UpdaterUtils$UpgradeInfo;->mLocationType:Ljava/lang/String;

    return-object p0
.end method

.method public getOSreleaseLink()Ljava/lang/String;
    .locals 1

    :try_start_0
    iget-object p0, p0, Lcom/motorola/ccc/ota/ui/UpdaterUtils$UpgradeInfo;->mMetadataMMApi:Lorg/json/JSONObject;

    const-string v0, "OSreleaseLink"

    invoke-virtual {p0, v0}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    return-object p0

    :catch_0
    const-string p0, ""

    return-object p0
.end method

.method public getOemConfigUpdateData()Z
    .locals 1

    :try_start_0
    iget-object p0, p0, Lcom/motorola/ccc/ota/ui/UpdaterUtils$UpgradeInfo;->mMetadataMMApi:Lorg/json/JSONObject;

    const-string v0, "oemConfigUpdate"

    invoke-virtual {p0, v0}, Lorg/json/JSONObject;->getBoolean(Ljava/lang/String;)Z

    move-result p0
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    return p0

    :catch_0
    const/4 p0, 0x0

    return p0
.end method

.method public getOptionalDeferCount()I
    .locals 1

    :try_start_0
    iget-object p0, p0, Lcom/motorola/ccc/ota/ui/UpdaterUtils$UpgradeInfo;->mMetadataMMApi:Lorg/json/JSONObject;

    const-string v0, "optionalUpdateDeferCount"

    invoke-virtual {p0, v0}, Lorg/json/JSONObject;->getInt(Ljava/lang/String;)I

    move-result p0
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    return p0

    :catch_0
    const/4 p0, -0x1

    return p0
.end method

.method public getOptionalUpdateCancelReminderDays()I
    .locals 2

    iget-object p0, p0, Lcom/motorola/ccc/ota/ui/UpdaterUtils$UpgradeInfo;->mMetadataMMApi:Lorg/json/JSONObject;

    const-string v0, "optionalUpdateCancelReminderDays"

    const/16 v1, 0x2d

    invoke-virtual {p0, v0, v1}, Lorg/json/JSONObject;->optInt(Ljava/lang/String;I)I

    move-result p0

    const/4 v0, 0x1

    if-ge p0, v0, :cond_0

    move v1, v0

    goto :goto_0

    :cond_0
    if-le p0, v1, :cond_1

    goto :goto_0

    :cond_1
    move v1, p0

    :goto_0
    return v1
.end method

.method public getPostInstallFailureMessage()Ljava/lang/String;
    .locals 1

    :try_start_0
    iget-object p0, p0, Lcom/motorola/ccc/ota/ui/UpdaterUtils$UpgradeInfo;->mMetadataMMApi:Lorg/json/JSONObject;

    const-string v0, "postInstallFailureMessage"

    invoke-virtual {p0, v0}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    return-object p0

    :catch_0
    const/4 p0, 0x0

    return-object p0
.end method

.method public getPostInstallNotes()Ljava/lang/String;
    .locals 1

    :try_start_0
    iget-object p0, p0, Lcom/motorola/ccc/ota/ui/UpdaterUtils$UpgradeInfo;->mMetadataMMApi:Lorg/json/JSONObject;

    const-string v0, "postInstallNotes"

    invoke-virtual {p0, v0}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    return-object p0

    :catch_0
    const/4 p0, 0x0

    return-object p0
.end method

.method public getPreDownloadInstructions()Ljava/lang/String;
    .locals 1

    :try_start_0
    iget-object p0, p0, Lcom/motorola/ccc/ota/ui/UpdaterUtils$UpgradeInfo;->mMetadataMMApi:Lorg/json/JSONObject;

    const-string v0, "preDownloadInstructions"

    invoke-virtual {p0, v0}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    return-object p0

    :catch_0
    const/4 p0, 0x0

    return-object p0
.end method

.method public getPreInstallInstructions()Ljava/lang/String;
    .locals 1

    :try_start_0
    iget-object p0, p0, Lcom/motorola/ccc/ota/ui/UpdaterUtils$UpgradeInfo;->mMetadataMMApi:Lorg/json/JSONObject;

    const-string v0, "preInstallInstructions"

    invoke-virtual {p0, v0}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    return-object p0

    :catch_0
    const/4 p0, 0x0

    return-object p0
.end method

.method public getPreInstallNotes()Ljava/lang/String;
    .locals 1

    :try_start_0
    iget-object p0, p0, Lcom/motorola/ccc/ota/ui/UpdaterUtils$UpgradeInfo;->mMetadataMMApi:Lorg/json/JSONObject;

    const-string v0, "preInstallNotes"

    invoke-virtual {p0, v0}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    return-object p0

    :catch_0
    const/4 p0, 0x0

    return-object p0
.end method

.method public getReleaseNotes()Ljava/lang/String;
    .locals 1

    :try_start_0
    iget-object p0, p0, Lcom/motorola/ccc/ota/ui/UpdaterUtils$UpgradeInfo;->mMetadataMMApi:Lorg/json/JSONObject;

    const-string v0, "releaseNotes"

    invoke-virtual {p0, v0}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    return-object p0

    :catch_0
    const/4 p0, 0x0

    return-object p0
.end method

.method public getSeverity()I
    .locals 2

    iget-object p0, p0, Lcom/motorola/ccc/ota/ui/UpdaterUtils$UpgradeInfo;->mMetadataMMApi:Lorg/json/JSONObject;

    sget-object v0, Lcom/motorola/otalib/common/utils/UpgradeUtils$SeverityType;->OPTIONAL:Lcom/motorola/otalib/common/utils/UpgradeUtils$SeverityType;

    invoke-virtual {v0}, Lcom/motorola/otalib/common/utils/UpgradeUtils$SeverityType;->ordinal()I

    move-result v0

    const-string v1, "severityType"

    invoke-virtual {p0, v1, v0}, Lorg/json/JSONObject;->optInt(Ljava/lang/String;I)I

    move-result p0

    return p0
.end method

.method public getSize()J
    .locals 2

    :try_start_0
    iget-object p0, p0, Lcom/motorola/ccc/ota/ui/UpdaterUtils$UpgradeInfo;->mMetadataMMApi:Lorg/json/JSONObject;

    const-string v0, "size"

    invoke-virtual {p0, v0}, Lorg/json/JSONObject;->getLong(Ljava/lang/String;)J

    move-result-wide v0
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    return-wide v0

    :catch_0
    const-wide/16 v0, -0x1

    return-wide v0
.end method

.method public getTargetOSVersion()Ljava/lang/String;
    .locals 1

    :try_start_0
    iget-object p0, p0, Lcom/motorola/ccc/ota/ui/UpdaterUtils$UpgradeInfo;->mMetadataMMApi:Lorg/json/JSONObject;

    const-string v0, "targetOSVersion"

    invoke-virtual {p0, v0}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    return-object p0

    :catch_0
    const-string p0, ""

    return-object p0
.end method

.method public getUpdateTypeData()Ljava/lang/String;
    .locals 1

    :try_start_0
    iget-object p0, p0, Lcom/motorola/ccc/ota/ui/UpdaterUtils$UpgradeInfo;->mMetadataMMApi:Lorg/json/JSONObject;

    const-string v0, "updateType"

    invoke-virtual {p0, v0}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    return-object p0

    :catch_0
    sget-object p0, Lcom/motorola/ccc/ota/ui/updateType/UpdateType$DIFFUpdateType;->DEFAULT:Lcom/motorola/ccc/ota/ui/updateType/UpdateType$DIFFUpdateType;

    invoke-virtual {p0}, Lcom/motorola/ccc/ota/ui/updateType/UpdateType$DIFFUpdateType;->toString()Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method public getUpgradeNotification()Ljava/lang/String;
    .locals 1

    :try_start_0
    iget-object p0, p0, Lcom/motorola/ccc/ota/ui/UpdaterUtils$UpgradeInfo;->mMetadataMMApi:Lorg/json/JSONObject;

    const-string v0, "upgradeNotification"

    invoke-virtual {p0, v0}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    return-object p0

    :catch_0
    const/4 p0, 0x0

    return-object p0
.end method

.method public getVersion()Ljava/lang/String;
    .locals 1

    :try_start_0
    iget-object p0, p0, Lcom/motorola/ccc/ota/ui/UpdaterUtils$UpgradeInfo;->mMetadataMMApi:Lorg/json/JSONObject;

    const-string v0, "version"

    invoke-virtual {p0, v0}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    return-object p0

    :catch_0
    const/4 p0, 0x0

    return-object p0
.end method

.method public getminBatteryRequiredForInstall()I
    .locals 1

    :try_start_0
    iget-object p0, p0, Lcom/motorola/ccc/ota/ui/UpdaterUtils$UpgradeInfo;->mMetadataMMApi:Lorg/json/JSONObject;

    const-string v0, "minBatteryRequiredForInstall"

    invoke-virtual {p0, v0}, Lorg/json/JSONObject;->getInt(Ljava/lang/String;)I

    move-result p0
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    return p0

    :catch_0
    const/4 p0, -0x1

    return p0
.end method

.method public hasPostInstallFailureMessage()Z
    .locals 1

    invoke-virtual {p0}, Lcom/motorola/ccc/ota/ui/UpdaterUtils$UpgradeInfo;->getPostInstallFailureMessage()Ljava/lang/String;

    move-result-object v0

    if-eqz v0, :cond_0

    invoke-virtual {p0}, Lcom/motorola/ccc/ota/ui/UpdaterUtils$UpgradeInfo;->getPostInstallFailureMessage()Ljava/lang/String;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result p0

    if-lez p0, :cond_0

    const/4 p0, 0x1

    goto :goto_0

    :cond_0
    const/4 p0, 0x0

    :goto_0
    return p0
.end method

.method public hasPostInstallNotes()Z
    .locals 1

    invoke-virtual {p0}, Lcom/motorola/ccc/ota/ui/UpdaterUtils$UpgradeInfo;->getPostInstallNotes()Ljava/lang/String;

    move-result-object v0

    if-eqz v0, :cond_0

    invoke-virtual {p0}, Lcom/motorola/ccc/ota/ui/UpdaterUtils$UpgradeInfo;->getPostInstallNotes()Ljava/lang/String;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result p0

    if-lez p0, :cond_0

    const/4 p0, 0x1

    goto :goto_0

    :cond_0
    const/4 p0, 0x0

    :goto_0
    return p0
.end method

.method public hasPreDownloadInstructions()Z
    .locals 1

    invoke-virtual {p0}, Lcom/motorola/ccc/ota/ui/UpdaterUtils$UpgradeInfo;->getPreDownloadInstructions()Ljava/lang/String;

    move-result-object v0

    if-eqz v0, :cond_0

    invoke-virtual {p0}, Lcom/motorola/ccc/ota/ui/UpdaterUtils$UpgradeInfo;->getPreDownloadInstructions()Ljava/lang/String;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result p0

    if-lez p0, :cond_0

    const/4 p0, 0x1

    goto :goto_0

    :cond_0
    const/4 p0, 0x0

    :goto_0
    return p0
.end method

.method public hasPreInstallInstructions()Z
    .locals 1

    invoke-virtual {p0}, Lcom/motorola/ccc/ota/ui/UpdaterUtils$UpgradeInfo;->getPreInstallInstructions()Ljava/lang/String;

    move-result-object v0

    if-eqz v0, :cond_0

    invoke-virtual {p0}, Lcom/motorola/ccc/ota/ui/UpdaterUtils$UpgradeInfo;->getPreInstallInstructions()Ljava/lang/String;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result p0

    if-lez p0, :cond_0

    const/4 p0, 0x1

    goto :goto_0

    :cond_0
    const/4 p0, 0x0

    :goto_0
    return p0
.end method

.method public hasPreInstallNotes()Z
    .locals 1

    invoke-virtual {p0}, Lcom/motorola/ccc/ota/ui/UpdaterUtils$UpgradeInfo;->getPreInstallNotes()Ljava/lang/String;

    move-result-object v0

    if-eqz v0, :cond_0

    invoke-virtual {p0}, Lcom/motorola/ccc/ota/ui/UpdaterUtils$UpgradeInfo;->getPreInstallNotes()Ljava/lang/String;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result p0

    if-lez p0, :cond_0

    const/4 p0, 0x1

    goto :goto_0

    :cond_0
    const/4 p0, 0x0

    :goto_0
    return p0
.end method

.method public hasReleaseNotes()Z
    .locals 1

    invoke-virtual {p0}, Lcom/motorola/ccc/ota/ui/UpdaterUtils$UpgradeInfo;->getReleaseNotes()Ljava/lang/String;

    move-result-object v0

    if-eqz v0, :cond_0

    invoke-virtual {p0}, Lcom/motorola/ccc/ota/ui/UpdaterUtils$UpgradeInfo;->getReleaseNotes()Ljava/lang/String;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result p0

    if-lez p0, :cond_0

    const/4 p0, 0x1

    goto :goto_0

    :cond_0
    const/4 p0, 0x0

    :goto_0
    return p0
.end method

.method public hasUpgradeNotification()Z
    .locals 1

    invoke-virtual {p0}, Lcom/motorola/ccc/ota/ui/UpdaterUtils$UpgradeInfo;->getUpgradeNotification()Ljava/lang/String;

    move-result-object v0

    if-eqz v0, :cond_0

    invoke-virtual {p0}, Lcom/motorola/ccc/ota/ui/UpdaterUtils$UpgradeInfo;->getUpgradeNotification()Ljava/lang/String;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result p0

    if-lez p0, :cond_0

    const/4 p0, 0x1

    goto :goto_0

    :cond_0
    const/4 p0, 0x0

    :goto_0
    return p0
.end method

.method public isCriticalUpdate()Z
    .locals 1

    invoke-virtual {p0}, Lcom/motorola/ccc/ota/ui/UpdaterUtils$UpgradeInfo;->getSeverity()I

    move-result p0

    sget-object v0, Lcom/motorola/otalib/common/utils/UpgradeUtils$SeverityType;->CRITICAL:Lcom/motorola/otalib/common/utils/UpgradeUtils$SeverityType;

    invoke-virtual {v0}, Lcom/motorola/otalib/common/utils/UpgradeUtils$SeverityType;->ordinal()I

    move-result v0

    if-ne p0, v0, :cond_0

    const/4 p0, 0x1

    goto :goto_0

    :cond_0
    const/4 p0, 0x0

    :goto_0
    return p0
.end method

.method public isForceDownloadTimeSet()Z
    .locals 4

    invoke-virtual {p0}, Lcom/motorola/ccc/ota/ui/UpdaterUtils$UpgradeInfo;->getForceDownloadTime()D

    move-result-wide v0

    const-wide/high16 v2, -0x4010000000000000L    # -1.0

    invoke-static {v0, v1, v2, v3}, Ljava/lang/Double;->compare(DD)I

    move-result p0

    if-lez p0, :cond_0

    const/4 p0, 0x1

    goto :goto_0

    :cond_0
    const/4 p0, 0x0

    :goto_0
    return p0
.end method

.method public isForceInstallTimeSet()Z
    .locals 4

    invoke-virtual {p0}, Lcom/motorola/ccc/ota/ui/UpdaterUtils$UpgradeInfo;->getForceInstallTime()D

    move-result-wide v0

    const-wide/high16 v2, -0x4010000000000000L    # -1.0

    invoke-static {v0, v1, v2, v3}, Ljava/lang/Double;->compare(DD)I

    move-result p0

    if-lez p0, :cond_0

    const/4 p0, 0x1

    goto :goto_0

    :cond_0
    const/4 p0, 0x0

    :goto_0
    return p0
.end method

.method public isForceInstallTimerExpired()Z
    .locals 5

    invoke-virtual {p0}, Lcom/motorola/ccc/ota/ui/UpdaterUtils$UpgradeInfo;->isForceInstallTimeSet()Z

    move-result p0

    if-eqz p0, :cond_0

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v0

    invoke-static {}, Lcom/motorola/ccc/ota/ui/UpdaterUtils;->-$$Nest$sfgetsettings()Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    move-result-object p0

    sget-object v2, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->MAX_FORCE_INSTALL_DEFER_TIME:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    const-wide/16 v3, -0x1

    invoke-virtual {p0, v2, v3, v4}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->getLong(Lcom/motorola/otalib/common/settings/ISetting;J)J

    move-result-wide v2

    cmp-long p0, v0, v2

    if-ltz p0, :cond_0

    const/4 p0, 0x1

    goto :goto_0

    :cond_0
    const/4 p0, 0x0

    :goto_0
    return p0
.end method

.method public isForced()Z
    .locals 2

    new-instance v0, Lcom/motorola/ccc/ota/env/SystemUpdaterPolicy;

    invoke-direct {v0}, Lcom/motorola/ccc/ota/env/SystemUpdaterPolicy;-><init>()V

    invoke-virtual {v0}, Lcom/motorola/ccc/ota/env/SystemUpdaterPolicy;->getPolicyType()I

    move-result v1

    if-gtz v1, :cond_1

    invoke-virtual {v0}, Lcom/motorola/ccc/ota/env/SystemUpdaterPolicy;->isAutoDownloadOverAnyDataNetworkPolicySet()Z

    move-result v0

    if-eqz v0, :cond_0

    goto :goto_0

    :cond_0
    :try_start_0
    iget-object p0, p0, Lcom/motorola/ccc/ota/ui/UpdaterUtils$UpgradeInfo;->mMetadataMMApi:Lorg/json/JSONObject;

    const-string v0, "forced"

    invoke-virtual {p0, v0}, Lorg/json/JSONObject;->getBoolean(Ljava/lang/String;)Z

    move-result p0
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    return p0

    :catch_0
    const/4 p0, 0x0

    return p0

    :cond_1
    :goto_0
    const/4 p0, 0x1

    return p0
.end method

.method public isInstallReminderSet()Z
    .locals 2

    iget-object p0, p0, Lcom/motorola/ccc/ota/ui/UpdaterUtils$UpgradeInfo;->mMetadataMMApi:Lorg/json/JSONObject;

    const-string v0, "installReminder"

    const-string v1, ""

    invoke-virtual {p0, v0, v1}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    invoke-static {p0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result p0

    if-eqz p0, :cond_0

    const/4 p0, 0x0

    return p0

    :cond_0
    const/4 p0, 0x1

    return p0
.end method

.method public isTimeout(I)Z
    .locals 0

    iget-object p0, p0, Lcom/motorola/ccc/ota/ui/UpdaterUtils$UpgradeInfo;->mMinutes:[I

    array-length p0, p0

    if-lt p1, p0, :cond_0

    const/4 p0, 0x1

    goto :goto_0

    :cond_0
    const/4 p0, 0x0

    :goto_0
    return p0
.end method

.method public isWifiOnly()Z
    .locals 2

    const/4 v0, 0x0

    :try_start_0
    new-instance v1, Lcom/motorola/ccc/ota/env/SystemUpdaterPolicy;

    invoke-direct {v1}, Lcom/motorola/ccc/ota/env/SystemUpdaterPolicy;-><init>()V

    invoke-virtual {v1}, Lcom/motorola/ccc/ota/env/SystemUpdaterPolicy;->isAutoDownloadOverAnyDataNetworkPolicySet()Z

    move-result v1

    if-eqz v1, :cond_0

    const-string p0, "OtaApp"

    const-string v1, "UpdaterUtils:allowFotaOverAnyDataNetwork policy set, so return isWifiOnly false irrespective of wifi only pkg"

    invoke-static {p0, v1}, Lcom/motorola/ccc/ota/utils/Logger;->debug(Ljava/lang/String;Ljava/lang/String;)V

    return v0

    :cond_0
    invoke-static {}, Lcom/motorola/ccc/ota/ui/UpdaterUtils;->isForceOnCellular()Z

    move-result v1

    if-eqz v1, :cond_1

    return v0

    :cond_1
    iget-object p0, p0, Lcom/motorola/ccc/ota/ui/UpdaterUtils$UpgradeInfo;->mMetadataMMApi:Lorg/json/JSONObject;

    const-string v1, "wifionly"

    invoke-virtual {p0, v1}, Lorg/json/JSONObject;->getBoolean(Ljava/lang/String;)Z

    move-result p0
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    return p0

    :catch_0
    return v0
.end method

.method public setAnnoy(Ljava/lang/String;)V
    .locals 4

    iput-object p1, p0, Lcom/motorola/ccc/ota/ui/UpdaterUtils$UpgradeInfo;->mAnnoy:Ljava/lang/String;

    const/16 v0, 0x5a0

    filled-new-array {v0}, [I

    move-result-object v0

    iput-object v0, p0, Lcom/motorola/ccc/ota/ui/UpdaterUtils$UpgradeInfo;->mMinutes:[I

    if-eqz p1, :cond_3

    const-string v0, ",..."

    invoke-virtual {p1, v0}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v0

    const/4 v1, 0x0

    if-eqz v0, :cond_0

    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v0

    add-int/lit8 v0, v0, -0x4

    invoke-virtual {p1, v1, v0}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object p1

    :cond_0
    :try_start_0
    const-string v0, ","

    invoke-virtual {p1, v0}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object p1

    array-length v0, p1

    new-array v0, v0, [I

    :goto_0
    array-length v2, p1

    if-ge v1, v2, :cond_2

    aget-object v2, p1, v1

    invoke-static {v2}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v2

    aput v2, v0, v1

    const/4 v3, 0x1

    if-ge v2, v3, :cond_1

    aput v3, v0, v1

    :cond_1
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    :cond_2
    iput-object v0, p0, Lcom/motorola/ccc/ota/ui/UpdaterUtils$UpgradeInfo;->mMinutes:[I
    :try_end_0
    .catch Ljava/lang/NumberFormatException; {:try_start_0 .. :try_end_0} :catch_0

    :catch_0
    :cond_3
    return-void
.end method

.method public showDownloadOptions()Z
    .locals 2

    new-instance v0, Lcom/motorola/ccc/ota/env/SystemUpdaterPolicy;

    invoke-direct {v0}, Lcom/motorola/ccc/ota/env/SystemUpdaterPolicy;-><init>()V

    invoke-virtual {v0}, Lcom/motorola/ccc/ota/env/SystemUpdaterPolicy;->isAutoDownloadOverAnyDataNetworkPolicySet()Z

    move-result v0

    const/4 v1, 0x0

    if-eqz v0, :cond_0

    return v1

    :cond_0
    iget-object p0, p0, Lcom/motorola/ccc/ota/ui/UpdaterUtils$UpgradeInfo;->mMetadataMMApi:Lorg/json/JSONObject;

    const-string v0, "showDownloadOptions"

    invoke-virtual {p0, v0, v1}, Lorg/json/JSONObject;->optBoolean(Ljava/lang/String;Z)Z

    move-result p0

    return p0
.end method

.method public showPostInstallScreen()Z
    .locals 2

    iget-object p0, p0, Lcom/motorola/ccc/ota/ui/UpdaterUtils$UpgradeInfo;->mMetadataMMApi:Lorg/json/JSONObject;

    const-string v0, "showPostInstallScreen"

    const/4 v1, 0x1

    invoke-virtual {p0, v0, v1}, Lorg/json/JSONObject;->optBoolean(Ljava/lang/String;Z)Z

    move-result p0

    return p0
.end method

.method public showPreInstallScreen()Z
    .locals 2

    iget-object p0, p0, Lcom/motorola/ccc/ota/ui/UpdaterUtils$UpgradeInfo;->mMetadataMMApi:Lorg/json/JSONObject;

    const-string v0, "showPreInstallScreen"

    const/4 v1, 0x1

    invoke-virtual {p0, v0, v1}, Lorg/json/JSONObject;->optBoolean(Ljava/lang/String;Z)Z

    move-result p0

    return p0
.end method
