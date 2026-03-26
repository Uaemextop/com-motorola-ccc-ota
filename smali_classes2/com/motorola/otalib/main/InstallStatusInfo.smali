.class public Lcom/motorola/otalib/main/InstallStatusInfo;
.super Ljava/lang/Object;
.source "InstallStatusInfo.java"


# instance fields
.field private accSerialNumber:Ljava/lang/String;

.field private critical:Z

.field private keepPackage:Z

.field private md5:Ljava/lang/String;

.field private preDownloadNote:Ljava/lang/String;

.field private progress:I

.field private reportingError:Lcom/motorola/otalib/main/PublicUtilityMethods$STATUS_CODE;

.field private size:J

.field private sourceVersion:J

.field private state:Lcom/motorola/otalib/main/PublicUtilityMethods$OtaState;

.field private statusCode:I

.field private statusMessage:Ljava/lang/String;

.field private targetVersion:J


# direct methods
.method public constructor <init>()V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Ljava/lang/String;Lcom/motorola/otalib/common/settings/Settings;Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database$Descriptor;I)V
    .locals 4

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    invoke-static {p3, p2}, Lcom/motorola/otalib/main/checkUpdate/UpdateSessionInfo;->getSessionDetails(Lcom/motorola/otalib/common/settings/Settings;Ljava/lang/String;)Lcom/motorola/otalib/main/checkUpdate/UpdateSessionInfo;

    move-result-object p2

    if-eqz p2, :cond_2

    invoke-virtual {p2}, Lcom/motorola/otalib/main/checkUpdate/UpdateSessionInfo;->getCheckRequestObj()Lcom/motorola/otalib/main/checkUpdate/CheckRequestObj;

    move-result-object p2

    if-eqz p2, :cond_0

    invoke-virtual {p2}, Lcom/motorola/otalib/main/checkUpdate/CheckRequestObj;->getAccsSerialNumber()Ljava/lang/String;

    move-result-object p3

    invoke-virtual {p0, p3}, Lcom/motorola/otalib/main/InstallStatusInfo;->setAccSerialNumber(Ljava/lang/String;)V

    :try_start_0
    new-instance p3, Ljava/io/File;

    invoke-virtual {p2}, Lcom/motorola/otalib/main/checkUpdate/CheckRequestObj;->getInternalName()Ljava/lang/String;

    move-result-object p2

    invoke-interface {p4}, Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database$Descriptor;->getMeta()Lcom/motorola/otalib/common/metaData/MetaData;

    move-result-object v0

    invoke-virtual {v0}, Lcom/motorola/otalib/common/metaData/MetaData;->getDisplayVersion()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Ljava/lang/Long;->parseLong(Ljava/lang/String;)J

    move-result-wide v0

    invoke-static {p1, p2, v0, v1}, Lcom/motorola/otalib/main/PublicUtilityMethods;->getFileName(Landroid/content/Context;Ljava/lang/String;J)Ljava/lang/String;

    move-result-object p1

    invoke-direct {p3, p1}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-virtual {p3}, Ljava/io/File;->length()J

    move-result-wide p1

    invoke-interface {p4}, Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database$Descriptor;->getMeta()Lcom/motorola/otalib/common/metaData/MetaData;

    move-result-object p3

    invoke-virtual {p3}, Lcom/motorola/otalib/common/metaData/MetaData;->getSize()J

    move-result-wide v0

    const-wide/16 v2, 0x64

    mul-long/2addr p1, v2

    div-long/2addr p1, v0

    long-to-int p1, p1

    invoke-virtual {p0, p1}, Lcom/motorola/otalib/main/InstallStatusInfo;->setProgress(I)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    const/4 p1, 0x0

    invoke-virtual {p0, p1}, Lcom/motorola/otalib/main/InstallStatusInfo;->setProgress(I)V

    :cond_0
    :goto_0
    if-eqz p4, :cond_1

    invoke-interface {p4}, Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database$Descriptor;->getMeta()Lcom/motorola/otalib/common/metaData/MetaData;

    move-result-object p1

    if-eqz p1, :cond_1

    invoke-interface {p4}, Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database$Descriptor;->getState()Lcom/motorola/otalib/common/Environment/ApplicationEnv$PackageState;

    move-result-object p1

    invoke-static {p1}, Lcom/motorola/otalib/common/utils/UpgradeUtils;->PackageStateToOtaStateConverter(Lcom/motorola/otalib/common/Environment/ApplicationEnv$PackageState;)Lcom/motorola/otalib/main/PublicUtilityMethods$OtaState;

    move-result-object p1

    invoke-virtual {p0, p1}, Lcom/motorola/otalib/main/InstallStatusInfo;->setState(Lcom/motorola/otalib/main/PublicUtilityMethods$OtaState;)V

    invoke-interface {p4}, Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database$Descriptor;->getInfo()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p0, p1}, Lcom/motorola/otalib/main/InstallStatusInfo;->setStatusMessage(Ljava/lang/String;)V

    invoke-interface {p4}, Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database$Descriptor;->getMeta()Lcom/motorola/otalib/common/metaData/MetaData;

    move-result-object p1

    invoke-virtual {p1}, Lcom/motorola/otalib/common/metaData/MetaData;->getDisplayVersion()Ljava/lang/String;

    move-result-object p1

    invoke-static {p1}, Ljava/lang/Long;->parseLong(Ljava/lang/String;)J

    move-result-wide p1

    invoke-virtual {p0, p1, p2}, Lcom/motorola/otalib/main/InstallStatusInfo;->setTargetVersion(J)V

    invoke-interface {p4}, Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database$Descriptor;->getMeta()Lcom/motorola/otalib/common/metaData/MetaData;

    move-result-object p1

    invoke-virtual {p1}, Lcom/motorola/otalib/common/metaData/MetaData;->getSize()J

    move-result-wide p1

    invoke-virtual {p0, p1, p2}, Lcom/motorola/otalib/main/InstallStatusInfo;->setSize(J)V

    invoke-interface {p4}, Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database$Descriptor;->getMeta()Lcom/motorola/otalib/common/metaData/MetaData;

    move-result-object p1

    invoke-virtual {p1}, Lcom/motorola/otalib/common/metaData/MetaData;->getmd5CheckSum()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p0, p1}, Lcom/motorola/otalib/main/InstallStatusInfo;->setMd5(Ljava/lang/String;)V

    invoke-interface {p4}, Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database$Descriptor;->getMeta()Lcom/motorola/otalib/common/metaData/MetaData;

    move-result-object p1

    invoke-virtual {p1}, Lcom/motorola/otalib/common/metaData/MetaData;->getUpgradeNotification()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p0, p1}, Lcom/motorola/otalib/main/InstallStatusInfo;->setPreDownloadNote(Ljava/lang/String;)V

    invoke-interface {p4}, Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database$Descriptor;->getMeta()Lcom/motorola/otalib/common/metaData/MetaData;

    move-result-object p1

    invoke-virtual {p1}, Lcom/motorola/otalib/common/metaData/MetaData;->isForced()Z

    move-result p1

    invoke-virtual {p0, p1}, Lcom/motorola/otalib/main/InstallStatusInfo;->setCritical(Z)V

    invoke-virtual {p0, p5}, Lcom/motorola/otalib/main/InstallStatusInfo;->setStatusCode(I)V

    goto :goto_1

    :cond_1
    sget-object p1, Lcom/motorola/otalib/main/PublicUtilityMethods$OtaState;->Result:Lcom/motorola/otalib/main/PublicUtilityMethods$OtaState;

    invoke-virtual {p0, p1}, Lcom/motorola/otalib/main/InstallStatusInfo;->setState(Lcom/motorola/otalib/main/PublicUtilityMethods$OtaState;)V

    goto :goto_1

    :cond_2
    sget-object p1, Lcom/motorola/otalib/main/PublicUtilityMethods$OtaState;->Result:Lcom/motorola/otalib/main/PublicUtilityMethods$OtaState;

    invoke-virtual {p0, p1}, Lcom/motorola/otalib/main/InstallStatusInfo;->setState(Lcom/motorola/otalib/main/PublicUtilityMethods$OtaState;)V

    :goto_1
    return-void
.end method

.method public static arrayListFromJson(Ljava/lang/String;)Ljava/util/List;
    .locals 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            ")",
            "Ljava/util/List<",
            "Lcom/motorola/otalib/main/InstallStatusInfo;",
            ">;"
        }
    .end annotation

    new-instance v0, Lcom/google/gson/Gson;

    invoke-direct {v0}, Lcom/google/gson/Gson;-><init>()V

    const-class v1, Lcom/google/gson/JsonArray;

    invoke-virtual {v0, p0, v1}, Lcom/google/gson/Gson;->fromJson(Ljava/lang/String;Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lcom/google/gson/JsonArray;

    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    const/4 v2, 0x0

    :goto_0
    invoke-virtual {p0}, Lcom/google/gson/JsonArray;->size()I

    move-result v3

    if-ge v2, v3, :cond_0

    invoke-virtual {p0, v2}, Lcom/google/gson/JsonArray;->get(I)Lcom/google/gson/JsonElement;

    move-result-object v3

    invoke-virtual {v3}, Lcom/google/gson/JsonElement;->getAsJsonObject()Lcom/google/gson/JsonObject;

    move-result-object v3

    const-class v4, Lcom/motorola/otalib/main/InstallStatusInfo;

    invoke-virtual {v0, v3, v4}, Lcom/google/gson/Gson;->fromJson(Lcom/google/gson/JsonElement;Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/motorola/otalib/main/InstallStatusInfo;

    invoke-interface {v1, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    :cond_0
    return-object v1
.end method

.method public static arrayListToJson(Ljava/util/List;)Ljava/lang/String;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/motorola/otalib/main/InstallStatusInfo;",
            ">;)",
            "Ljava/lang/String;"
        }
    .end annotation

    new-instance v0, Lcom/google/gson/Gson;

    invoke-direct {v0}, Lcom/google/gson/Gson;-><init>()V

    new-instance v1, Lcom/google/gson/JsonArray;

    invoke-direct {v1}, Lcom/google/gson/JsonArray;-><init>()V

    invoke-interface {p0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object p0

    :goto_0
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_0

    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/motorola/otalib/main/InstallStatusInfo;

    invoke-virtual {v0, v2}, Lcom/google/gson/Gson;->toJsonTree(Ljava/lang/Object;)Lcom/google/gson/JsonElement;

    move-result-object v2

    invoke-virtual {v2}, Lcom/google/gson/JsonElement;->getAsJsonObject()Lcom/google/gson/JsonObject;

    move-result-object v2

    invoke-virtual {v1, v2}, Lcom/google/gson/JsonArray;->add(Lcom/google/gson/JsonElement;)V

    goto :goto_0

    :cond_0
    invoke-virtual {v1}, Lcom/google/gson/JsonArray;->toString()Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method public static fromJsonString(Ljava/lang/String;)Lcom/motorola/otalib/main/InstallStatusInfo;
    .locals 2

    new-instance v0, Lcom/google/gson/Gson;

    invoke-direct {v0}, Lcom/google/gson/Gson;-><init>()V

    const-class v1, Lcom/motorola/otalib/main/InstallStatusInfo;

    invoke-virtual {v0, p0, v1}, Lcom/google/gson/Gson;->fromJson(Ljava/lang/String;Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lcom/motorola/otalib/main/InstallStatusInfo;

    return-object p0
.end method


# virtual methods
.method public getAccSerialNumber()Ljava/lang/String;
    .locals 0

    iget-object p0, p0, Lcom/motorola/otalib/main/InstallStatusInfo;->accSerialNumber:Ljava/lang/String;

    return-object p0
.end method

.method public getMd5()Ljava/lang/String;
    .locals 0

    iget-object p0, p0, Lcom/motorola/otalib/main/InstallStatusInfo;->md5:Ljava/lang/String;

    return-object p0
.end method

.method public getPreDownloadNote()Ljava/lang/String;
    .locals 0

    iget-object p0, p0, Lcom/motorola/otalib/main/InstallStatusInfo;->preDownloadNote:Ljava/lang/String;

    return-object p0
.end method

.method public getProgress()I
    .locals 0

    iget p0, p0, Lcom/motorola/otalib/main/InstallStatusInfo;->progress:I

    return p0
.end method

.method public getReportingError()Lcom/motorola/otalib/main/PublicUtilityMethods$STATUS_CODE;
    .locals 0

    iget-object p0, p0, Lcom/motorola/otalib/main/InstallStatusInfo;->reportingError:Lcom/motorola/otalib/main/PublicUtilityMethods$STATUS_CODE;

    return-object p0
.end method

.method public getServerState()Lcom/motorola/otalib/common/Environment/ApplicationEnv$PackageState;
    .locals 0

    invoke-virtual {p0}, Lcom/motorola/otalib/main/InstallStatusInfo;->getState()Lcom/motorola/otalib/main/PublicUtilityMethods$OtaState;

    move-result-object p0

    invoke-static {p0}, Lcom/motorola/otalib/common/utils/UpgradeUtils;->OtaLibStateToPackageStateConverter(Lcom/motorola/otalib/main/PublicUtilityMethods$OtaState;)Lcom/motorola/otalib/common/Environment/ApplicationEnv$PackageState;

    move-result-object p0

    return-object p0
.end method

.method public getSize()J
    .locals 2

    iget-wide v0, p0, Lcom/motorola/otalib/main/InstallStatusInfo;->size:J

    return-wide v0
.end method

.method public getSourceVersion()J
    .locals 2

    iget-wide v0, p0, Lcom/motorola/otalib/main/InstallStatusInfo;->sourceVersion:J

    return-wide v0
.end method

.method public getState()Lcom/motorola/otalib/main/PublicUtilityMethods$OtaState;
    .locals 0

    iget-object p0, p0, Lcom/motorola/otalib/main/InstallStatusInfo;->state:Lcom/motorola/otalib/main/PublicUtilityMethods$OtaState;

    return-object p0
.end method

.method public getStatusCode()I
    .locals 0

    iget p0, p0, Lcom/motorola/otalib/main/InstallStatusInfo;->statusCode:I

    return p0
.end method

.method public getStatusMessage()Ljava/lang/String;
    .locals 0

    iget-object p0, p0, Lcom/motorola/otalib/main/InstallStatusInfo;->statusMessage:Ljava/lang/String;

    return-object p0
.end method

.method public getTargetVersion()J
    .locals 2

    iget-wide v0, p0, Lcom/motorola/otalib/main/InstallStatusInfo;->targetVersion:J

    return-wide v0
.end method

.method public isCritical()Z
    .locals 0

    iget-boolean p0, p0, Lcom/motorola/otalib/main/InstallStatusInfo;->critical:Z

    return p0
.end method

.method public isKeepPackage()Z
    .locals 0

    iget-boolean p0, p0, Lcom/motorola/otalib/main/InstallStatusInfo;->keepPackage:Z

    return p0
.end method

.method public setAccSerialNumber(Ljava/lang/String;)V
    .locals 0

    iput-object p1, p0, Lcom/motorola/otalib/main/InstallStatusInfo;->accSerialNumber:Ljava/lang/String;

    return-void
.end method

.method public setCritical(Z)V
    .locals 0

    iput-boolean p1, p0, Lcom/motorola/otalib/main/InstallStatusInfo;->critical:Z

    return-void
.end method

.method public setKeepPackage(Z)V
    .locals 0

    iput-boolean p1, p0, Lcom/motorola/otalib/main/InstallStatusInfo;->keepPackage:Z

    return-void
.end method

.method public setMd5(Ljava/lang/String;)V
    .locals 0

    iput-object p1, p0, Lcom/motorola/otalib/main/InstallStatusInfo;->md5:Ljava/lang/String;

    return-void
.end method

.method public setPreDownloadNote(Ljava/lang/String;)V
    .locals 0

    iput-object p1, p0, Lcom/motorola/otalib/main/InstallStatusInfo;->preDownloadNote:Ljava/lang/String;

    return-void
.end method

.method public setProgress(I)V
    .locals 0

    iput p1, p0, Lcom/motorola/otalib/main/InstallStatusInfo;->progress:I

    return-void
.end method

.method public setReportingError(Lcom/motorola/otalib/main/PublicUtilityMethods$STATUS_CODE;)V
    .locals 0

    iput-object p1, p0, Lcom/motorola/otalib/main/InstallStatusInfo;->reportingError:Lcom/motorola/otalib/main/PublicUtilityMethods$STATUS_CODE;

    return-void
.end method

.method public setSize(J)V
    .locals 0

    iput-wide p1, p0, Lcom/motorola/otalib/main/InstallStatusInfo;->size:J

    return-void
.end method

.method public setSourceVersion(J)V
    .locals 0

    iput-wide p1, p0, Lcom/motorola/otalib/main/InstallStatusInfo;->sourceVersion:J

    return-void
.end method

.method public setState(Lcom/motorola/otalib/main/PublicUtilityMethods$OtaState;)V
    .locals 0

    iput-object p1, p0, Lcom/motorola/otalib/main/InstallStatusInfo;->state:Lcom/motorola/otalib/main/PublicUtilityMethods$OtaState;

    return-void
.end method

.method public setStatusCode(I)V
    .locals 0

    iput p1, p0, Lcom/motorola/otalib/main/InstallStatusInfo;->statusCode:I

    return-void
.end method

.method public setStatusMessage(Ljava/lang/String;)V
    .locals 0

    iput-object p1, p0, Lcom/motorola/otalib/main/InstallStatusInfo;->statusMessage:Ljava/lang/String;

    return-void
.end method

.method public setTargetVersion(J)V
    .locals 0

    iput-wide p1, p0, Lcom/motorola/otalib/main/InstallStatusInfo;->targetVersion:J

    return-void
.end method

.method public toString()Ljava/lang/String;
    .locals 1

    new-instance v0, Lcom/google/gson/Gson;

    invoke-direct {v0}, Lcom/google/gson/Gson;-><init>()V

    invoke-virtual {v0, p0}, Lcom/google/gson/Gson;->toJson(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method
