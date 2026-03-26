.class public Lcom/motorola/otalib/common/utils/UpgradeUtils;
.super Ljava/lang/Object;
.source "UpgradeUtils.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/motorola/otalib/common/utils/UpgradeUtils$MergeStatus;,
        Lcom/motorola/otalib/common/utils/UpgradeUtils$Error;,
        Lcom/motorola/otalib/common/utils/UpgradeUtils$DownloadStatus;,
        Lcom/motorola/otalib/common/utils/UpgradeUtils$AB_INSTALL_TYPE;,
        Lcom/motorola/otalib/common/utils/UpgradeUtils$SeverityType;
    }
.end annotation


# static fields
.field public static final CHINA_PRODUCTION_SERVER:Ljava/lang/String; = "moto-cds.svcmot.cn"

.field public static final CHINA_STAGING_SERVER:Ljava/lang/String; = "ota-cn-sdc.blurdev.com"

.field public static final DEFAULT_CRITICAL_DEFER_COUNT:I = 0x3

.field public static final DEFAULT_CRITICAL_UPDATE_ANNOY_VALUE:I = 0xf0

.field public static final DEFAULT_EXTRA_REMINDER_COUNT:I = 0x6

.field public static final DEFAULT_EXTRA_REMINDER_PERIOD:J = 0xaL

.field public static final DEFAULT_MAX_CHUNK_SPACE_REQUIRED:I = 0x0

.field public static final DEFAULT_MAX_UPDATE_FAIL_COUNT:I = 0x3

.field public static final DEFAULT_MOTO_HELP:Ljava/lang/String; = ""

.field public static final DEFAULT_OS_VERSION:Ljava/lang/String; = ""

.field public static final DEVELOPMENT_SERVER:Ljava/lang/String; = "moto-cds-dev.appspot.com"

.field public static final MEGABYTE:I = 0x100000

.field public static final PRODUCTION_SERVER:Ljava/lang/String; = "moto-cds.appspot.com"

.field public static final QA_SERVER:Ljava/lang/String; = "moto-cds-qa.appspot.com"

.field public static final STAGING_SERVER:Ljava/lang/String; = "moto-cds-staging.appspot.com"


# direct methods
.method public constructor <init>()V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static OtaLibStateToPackageStateConverter(Lcom/motorola/otalib/main/PublicUtilityMethods$OtaState;)Lcom/motorola/otalib/common/Environment/ApplicationEnv$PackageState;
    .locals 3

    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    sget-object v1, Lcom/motorola/otalib/main/PublicUtilityMethods$OtaState;->UpdateAvailable:Lcom/motorola/otalib/main/PublicUtilityMethods$OtaState;

    sget-object v2, Lcom/motorola/otalib/common/Environment/ApplicationEnv$PackageState;->Notified:Lcom/motorola/otalib/common/Environment/ApplicationEnv$PackageState;

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    sget-object v1, Lcom/motorola/otalib/main/PublicUtilityMethods$OtaState;->WaitingForDLPermission:Lcom/motorola/otalib/main/PublicUtilityMethods$OtaState;

    sget-object v2, Lcom/motorola/otalib/common/Environment/ApplicationEnv$PackageState;->RequestPermission:Lcom/motorola/otalib/common/Environment/ApplicationEnv$PackageState;

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    sget-object v1, Lcom/motorola/otalib/main/PublicUtilityMethods$OtaState;->UserApprovedDL:Lcom/motorola/otalib/main/PublicUtilityMethods$OtaState;

    sget-object v2, Lcom/motorola/otalib/common/Environment/ApplicationEnv$PackageState;->QueueForDownload:Lcom/motorola/otalib/common/Environment/ApplicationEnv$PackageState;

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    sget-object v1, Lcom/motorola/otalib/main/PublicUtilityMethods$OtaState;->QueueForDownload:Lcom/motorola/otalib/main/PublicUtilityMethods$OtaState;

    sget-object v2, Lcom/motorola/otalib/common/Environment/ApplicationEnv$PackageState;->QueueForDownload:Lcom/motorola/otalib/common/Environment/ApplicationEnv$PackageState;

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    sget-object v1, Lcom/motorola/otalib/main/PublicUtilityMethods$OtaState;->FetchingDLDetails:Lcom/motorola/otalib/main/PublicUtilityMethods$OtaState;

    sget-object v2, Lcom/motorola/otalib/common/Environment/ApplicationEnv$PackageState;->GettingDescriptor:Lcom/motorola/otalib/common/Environment/ApplicationEnv$PackageState;

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    sget-object v1, Lcom/motorola/otalib/main/PublicUtilityMethods$OtaState;->Downloading:Lcom/motorola/otalib/main/PublicUtilityMethods$OtaState;

    sget-object v2, Lcom/motorola/otalib/common/Environment/ApplicationEnv$PackageState;->GettingPackage:Lcom/motorola/otalib/common/Environment/ApplicationEnv$PackageState;

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    sget-object v1, Lcom/motorola/otalib/main/PublicUtilityMethods$OtaState;->WaitingForInstallPermission:Lcom/motorola/otalib/main/PublicUtilityMethods$OtaState;

    sget-object v2, Lcom/motorola/otalib/common/Environment/ApplicationEnv$PackageState;->Querying:Lcom/motorola/otalib/common/Environment/ApplicationEnv$PackageState;

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    sget-object v1, Lcom/motorola/otalib/main/PublicUtilityMethods$OtaState;->UserApprovedInstall:Lcom/motorola/otalib/main/PublicUtilityMethods$OtaState;

    sget-object v2, Lcom/motorola/otalib/common/Environment/ApplicationEnv$PackageState;->ABApplyingPatch:Lcom/motorola/otalib/common/Environment/ApplicationEnv$PackageState;

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    sget-object v1, Lcom/motorola/otalib/main/PublicUtilityMethods$OtaState;->Installing:Lcom/motorola/otalib/main/PublicUtilityMethods$OtaState;

    sget-object v2, Lcom/motorola/otalib/common/Environment/ApplicationEnv$PackageState;->ABApplyingPatch:Lcom/motorola/otalib/common/Environment/ApplicationEnv$PackageState;

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    sget-object v1, Lcom/motorola/otalib/main/PublicUtilityMethods$OtaState;->Rebooting:Lcom/motorola/otalib/main/PublicUtilityMethods$OtaState;

    sget-object v2, Lcom/motorola/otalib/common/Environment/ApplicationEnv$PackageState;->Upgrading:Lcom/motorola/otalib/common/Environment/ApplicationEnv$PackageState;

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    sget-object v1, Lcom/motorola/otalib/main/PublicUtilityMethods$OtaState;->Result:Lcom/motorola/otalib/main/PublicUtilityMethods$OtaState;

    sget-object v2, Lcom/motorola/otalib/common/Environment/ApplicationEnv$PackageState;->Result:Lcom/motorola/otalib/common/Environment/ApplicationEnv$PackageState;

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    invoke-interface {v0, p0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lcom/motorola/otalib/common/Environment/ApplicationEnv$PackageState;

    return-object p0
.end method

.method public static PackageStateToOtaStateConverter(Lcom/motorola/otalib/common/Environment/ApplicationEnv$PackageState;)Lcom/motorola/otalib/main/PublicUtilityMethods$OtaState;
    .locals 3

    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    sget-object v1, Lcom/motorola/otalib/common/Environment/ApplicationEnv$PackageState;->Notified:Lcom/motorola/otalib/common/Environment/ApplicationEnv$PackageState;

    sget-object v2, Lcom/motorola/otalib/main/PublicUtilityMethods$OtaState;->UpdateAvailable:Lcom/motorola/otalib/main/PublicUtilityMethods$OtaState;

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    sget-object v1, Lcom/motorola/otalib/common/Environment/ApplicationEnv$PackageState;->RequestPermission:Lcom/motorola/otalib/common/Environment/ApplicationEnv$PackageState;

    sget-object v2, Lcom/motorola/otalib/main/PublicUtilityMethods$OtaState;->WaitingForDLPermission:Lcom/motorola/otalib/main/PublicUtilityMethods$OtaState;

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    sget-object v1, Lcom/motorola/otalib/common/Environment/ApplicationEnv$PackageState;->QueueForDownload:Lcom/motorola/otalib/common/Environment/ApplicationEnv$PackageState;

    sget-object v2, Lcom/motorola/otalib/main/PublicUtilityMethods$OtaState;->QueueForDownload:Lcom/motorola/otalib/main/PublicUtilityMethods$OtaState;

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    sget-object v1, Lcom/motorola/otalib/common/Environment/ApplicationEnv$PackageState;->GettingDescriptor:Lcom/motorola/otalib/common/Environment/ApplicationEnv$PackageState;

    sget-object v2, Lcom/motorola/otalib/main/PublicUtilityMethods$OtaState;->FetchingDLDetails:Lcom/motorola/otalib/main/PublicUtilityMethods$OtaState;

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    sget-object v1, Lcom/motorola/otalib/common/Environment/ApplicationEnv$PackageState;->GettingPackage:Lcom/motorola/otalib/common/Environment/ApplicationEnv$PackageState;

    sget-object v2, Lcom/motorola/otalib/main/PublicUtilityMethods$OtaState;->Downloading:Lcom/motorola/otalib/main/PublicUtilityMethods$OtaState;

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    sget-object v1, Lcom/motorola/otalib/common/Environment/ApplicationEnv$PackageState;->Querying:Lcom/motorola/otalib/common/Environment/ApplicationEnv$PackageState;

    sget-object v2, Lcom/motorola/otalib/main/PublicUtilityMethods$OtaState;->WaitingForInstallPermission:Lcom/motorola/otalib/main/PublicUtilityMethods$OtaState;

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    sget-object v1, Lcom/motorola/otalib/common/Environment/ApplicationEnv$PackageState;->ABApplyingPatch:Lcom/motorola/otalib/common/Environment/ApplicationEnv$PackageState;

    sget-object v2, Lcom/motorola/otalib/main/PublicUtilityMethods$OtaState;->Installing:Lcom/motorola/otalib/main/PublicUtilityMethods$OtaState;

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    sget-object v1, Lcom/motorola/otalib/common/Environment/ApplicationEnv$PackageState;->Upgrading:Lcom/motorola/otalib/common/Environment/ApplicationEnv$PackageState;

    sget-object v2, Lcom/motorola/otalib/main/PublicUtilityMethods$OtaState;->Rebooting:Lcom/motorola/otalib/main/PublicUtilityMethods$OtaState;

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    sget-object v1, Lcom/motorola/otalib/common/Environment/ApplicationEnv$PackageState;->Result:Lcom/motorola/otalib/common/Environment/ApplicationEnv$PackageState;

    sget-object v2, Lcom/motorola/otalib/main/PublicUtilityMethods$OtaState;->Result:Lcom/motorola/otalib/main/PublicUtilityMethods$OtaState;

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    invoke-interface {v0, p0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lcom/motorola/otalib/main/PublicUtilityMethods$OtaState;

    return-object p0
.end method

.method public static checkIfAlreadyhavePermission(Landroid/content/Context;Ljava/lang/String;)Z
    .locals 0

    invoke-static {p0, p1}, Landroidx/core/content/ContextCompat;->checkSelfPermission(Landroid/content/Context;Ljava/lang/String;)I

    move-result p0

    if-nez p0, :cond_0

    const/4 p0, 0x1

    return p0

    :cond_0
    const/4 p0, 0x0

    return p0
.end method

.method public static getAdminApnUrl(Ljava/lang/String;)Ljava/lang/String;
    .locals 3

    invoke-static {p0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_0

    :try_start_0
    new-instance v0, Lorg/json/JSONObject;

    invoke-direct {v0, p0}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    const-string p0, "adminApnUrl"

    invoke-virtual {v0, p0}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception p0

    sget-object v0, Lcom/motorola/otalib/common/CommonLogger;->TAG:Ljava/lang/String;

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "JSONException in UpgradeUtils, getAdminApnUrl: "

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p0}, Lorg/json/JSONException;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-static {v0, p0}, Lcom/motorola/otalib/common/CommonLogger;->e(Ljava/lang/String;Ljava/lang/String;)V

    :cond_0
    const/4 p0, 0x0

    :goto_0
    return-object p0
.end method

.method public static getJsonObjectFromMap(Ljava/util/Map;Ljava/lang/String;)Lorg/json/JSONObject;
    .locals 7
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;",
            "Ljava/lang/String;",
            ")",
            "Lorg/json/JSONObject;"
        }
    .end annotation

    new-instance v0, Lorg/json/JSONObject;

    invoke-direct {v0}, Lorg/json/JSONObject;-><init>()V

    invoke-interface {p0}, Ljava/util/Map;->keySet()Ljava/util/Set;

    move-result-object v1

    invoke-interface {v1}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_0

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    :try_start_0
    invoke-interface {p0, v2}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    invoke-virtual {v0, v2, v3}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception v3

    sget-object v4, Lcom/motorola/otalib/common/CommonLogger;->TAG:Ljava/lang/String;

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v5, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, " caught exception on "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v5, " :"

    invoke-virtual {v2, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v4, v2}, Lcom/motorola/otalib/common/CommonLogger;->e(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_0

    :cond_0
    return-object v0
.end method
