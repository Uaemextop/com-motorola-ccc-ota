.class public Lcom/motorola/otalib/main/LibCussm;
.super Ljava/lang/Object;
.source "LibCussm.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/motorola/otalib/main/LibCussm$STATE_EVENT_STATUS;,
        Lcom/motorola/otalib/main/LibCussm$defaultAction;
    }
.end annotation


# static fields
.field private static final DB_LOC:Ljava/lang/String; = "ota.db"

.field private static _isSendingUpgradeStatus:I

.field private static _mTimer:Ljava/util/Timer;


# instance fields
.field private _db:Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database;

.field private _downloader:Lcom/motorola/otalib/common/Environment/DownloadHandler;

.field mClientCallBack:Lcom/motorola/otalib/aidl/IOtaLibServiceCallBack;

.field private mConnMgr:Landroid/net/ConnectivityManager;

.field private mSettings:Lcom/motorola/otalib/main/Settings/LibSettings;

.field private networkCallback:Landroid/net/ConnectivityManager$NetworkCallback;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    sget v0, Lcom/motorola/otalib/main/LibCussm$STATE_EVENT_STATUS;->IDLE:I

    sput v0, Lcom/motorola/otalib/main/LibCussm;->_isSendingUpgradeStatus:I

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Lcom/motorola/otalib/main/Settings/LibSettings;)V
    .locals 1

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p2, p0, Lcom/motorola/otalib/main/LibCussm;->mSettings:Lcom/motorola/otalib/main/Settings/LibSettings;

    new-instance p2, Lcom/motorola/otalib/common/Environment/AndroidDB;

    const-string v0, "ota.db"

    invoke-direct {p2, v0, p1}, Lcom/motorola/otalib/common/Environment/AndroidDB;-><init>(Ljava/lang/String;Landroid/content/Context;)V

    iput-object p2, p0, Lcom/motorola/otalib/main/LibCussm;->_db:Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database;

    return-void
.end method

.method static synthetic access$000()I
    .locals 1

    sget v0, Lcom/motorola/otalib/main/LibCussm;->_isSendingUpgradeStatus:I

    return v0
.end method

.method static synthetic access$002(I)I
    .locals 0

    sput p0, Lcom/motorola/otalib/main/LibCussm;->_isSendingUpgradeStatus:I

    return p0
.end method

.method static synthetic access$100(Lcom/motorola/otalib/main/LibCussm;Landroid/content/Context;)V
    .locals 0

    invoke-direct {p0, p1}, Lcom/motorola/otalib/main/LibCussm;->runStateMachine(Landroid/content/Context;)V

    return-void
.end method

.method static synthetic access$200(Lcom/motorola/otalib/main/LibCussm;)Lcom/motorola/otalib/common/Environment/DownloadHandler;
    .locals 0

    iget-object p0, p0, Lcom/motorola/otalib/main/LibCussm;->_downloader:Lcom/motorola/otalib/common/Environment/DownloadHandler;

    return-object p0
.end method

.method static synthetic access$300(Lcom/motorola/otalib/main/LibCussm;)V
    .locals 0

    invoke-direct {p0}, Lcom/motorola/otalib/main/LibCussm;->stopTimer()V

    return-void
.end method

.method static synthetic access$400(Lcom/motorola/otalib/main/LibCussm;)Lcom/motorola/otalib/main/Settings/LibSettings;
    .locals 0

    iget-object p0, p0, Lcom/motorola/otalib/main/LibCussm;->mSettings:Lcom/motorola/otalib/main/Settings/LibSettings;

    return-object p0
.end method

.method static synthetic access$500(Lcom/motorola/otalib/main/LibCussm;Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)V
    .locals 0

    invoke-direct {p0, p1, p2, p3}, Lcom/motorola/otalib/main/LibCussm;->cancelOTA(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method

.method private cancelOTA(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)V
    .locals 7

    iget-object v0, p0, Lcom/motorola/otalib/main/LibCussm;->_db:Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database;

    if-eqz v0, :cond_3

    invoke-interface {v0}, Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database;->getVersions()Ljava/util/List;

    move-result-object v0

    if-nez v0, :cond_0

    sget-object p0, Lcom/motorola/otalib/main/Logger;->OTALib_TAG:Ljava/lang/String;

    const-string p1, "CusSM.runStateMachine: no update found in database"

    invoke-static {p0, p1}, Lcom/motorola/otalib/main/Logger;->debug(Ljava/lang/String;Ljava/lang/String;)V

    return-void

    :cond_0
    iget-object v0, p0, Lcom/motorola/otalib/main/LibCussm;->_db:Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database;

    invoke-interface {v0, p3}, Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database;->getDescription(Ljava/lang/String;)Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database$Descriptor;

    move-result-object v0

    if-nez v0, :cond_1

    sget-object p0, Lcom/motorola/otalib/main/Logger;->OTALib_TAG:Ljava/lang/String;

    const-string p1, "no update found for this sha1 in db,drop the request to floor"

    invoke-static {p0, p1}, Lcom/motorola/otalib/main/Logger;->error(Ljava/lang/String;Ljava/lang/String;)V

    return-void

    :cond_1
    invoke-interface {v0}, Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database$Descriptor;->getState()Lcom/motorola/otalib/common/Environment/ApplicationEnv$PackageState;

    move-result-object v0

    sget-object v1, Lcom/motorola/otalib/common/Environment/ApplicationEnv$PackageState;->Result:Lcom/motorola/otalib/common/Environment/ApplicationEnv$PackageState;

    if-ne v0, v1, :cond_2

    sget-object p3, Lcom/motorola/otalib/main/Logger;->OTALib_TAG:Ljava/lang/String;

    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "Package is already in result state "

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p2

    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    invoke-static {p3, p2}, Lcom/motorola/otalib/main/Logger;->error(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_0

    :cond_2
    iget-object v0, p0, Lcom/motorola/otalib/main/LibCussm;->_db:Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database;

    sget-object v2, Lcom/motorola/otalib/common/Environment/ApplicationEnv$PackageState;->Result:Lcom/motorola/otalib/common/Environment/ApplicationEnv$PackageState;

    iget-object v1, p0, Lcom/motorola/otalib/main/LibCussm;->mSettings:Lcom/motorola/otalib/main/Settings/LibSettings;

    invoke-static {v1, p3}, Lcom/motorola/otalib/main/checkUpdate/UpdateSessionInfo;->getSessionDetails(Lcom/motorola/otalib/common/settings/Settings;Ljava/lang/String;)Lcom/motorola/otalib/main/checkUpdate/UpdateSessionInfo;

    move-result-object v1

    invoke-virtual {v1}, Lcom/motorola/otalib/main/checkUpdate/UpdateSessionInfo;->toString()Ljava/lang/String;

    move-result-object v6

    const/4 v3, 0x0

    const-string v5, "CANCELED_BY_SERVER."

    move-object v1, p3

    move-object v4, p2

    invoke-interface/range {v0 .. v6}, Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database;->setState(Ljava/lang/String;Lcom/motorola/otalib/common/Environment/ApplicationEnv$PackageState;ZLjava/lang/String;Ljava/lang/String;Ljava/lang/String;)Z

    :goto_0
    invoke-direct {p0, p1}, Lcom/motorola/otalib/main/LibCussm;->runStateMachine(Landroid/content/Context;)V

    :cond_3
    return-void
.end method

.method private cleanUpFiles(Landroid/content/Context;Ljava/lang/String;ZLjava/lang/String;)V
    .locals 5

    iget-object v0, p0, Lcom/motorola/otalib/main/LibCussm;->_db:Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database;

    invoke-interface {v0, p2}, Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database;->remove(Ljava/lang/String;)V

    iget-object v0, p0, Lcom/motorola/otalib/main/LibCussm;->mSettings:Lcom/motorola/otalib/main/Settings/LibSettings;

    invoke-static {v0, p2}, Lcom/motorola/otalib/main/checkUpdate/UpdateSessionInfo;->getSessionDetails(Lcom/motorola/otalib/common/settings/Settings;Ljava/lang/String;)Lcom/motorola/otalib/main/checkUpdate/UpdateSessionInfo;

    move-result-object v0

    invoke-virtual {v0}, Lcom/motorola/otalib/main/checkUpdate/UpdateSessionInfo;->getCheckRequestObj()Lcom/motorola/otalib/main/checkUpdate/CheckRequestObj;

    move-result-object v1

    if-eqz v1, :cond_1

    invoke-virtual {v1}, Lcom/motorola/otalib/main/checkUpdate/CheckRequestObj;->getInternalName()Ljava/lang/String;

    move-result-object v2

    invoke-static {p4}, Ljava/lang/Long;->parseLong(Ljava/lang/String;)J

    move-result-wide v3

    invoke-static {p1, v2, v3, v4}, Lcom/motorola/otalib/main/PublicUtilityMethods;->getFileName(Landroid/content/Context;Ljava/lang/String;J)Ljava/lang/String;

    move-result-object p4

    if-nez p3, :cond_0

    invoke-virtual {v0}, Lcom/motorola/otalib/main/checkUpdate/UpdateSessionInfo;->isKeepPackage()Z

    move-result p3

    if-nez p3, :cond_0

    invoke-static {p1, p4}, Lcom/motorola/otalib/main/PublicUtilityMethods;->cleanUpCurrentPackage(Landroid/content/Context;Ljava/lang/String;)V

    goto :goto_0

    :cond_0
    iget-object p3, p0, Lcom/motorola/otalib/main/LibCussm;->_db:Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database;

    invoke-interface {p3}, Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database;->getVersions()Ljava/util/List;

    move-result-object p3

    if-nez p3, :cond_1

    invoke-virtual {v1}, Lcom/motorola/otalib/main/checkUpdate/CheckRequestObj;->getInternalName()Ljava/lang/String;

    move-result-object p3

    invoke-static {p1, p4, p3}, Lcom/motorola/otalib/main/PublicUtilityMethods;->cleanUpOlderPackage(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)V

    :cond_1
    :goto_0
    iget-object p0, p0, Lcom/motorola/otalib/main/LibCussm;->mSettings:Lcom/motorola/otalib/main/Settings/LibSettings;

    invoke-static {p0, p2}, Lcom/motorola/otalib/main/checkUpdate/UpdateSessionInfo;->deleteSessionDetails(Lcom/motorola/otalib/common/settings/Settings;Ljava/lang/String;)V

    return-void
.end method

.method private cleanUpOldEntry()V
    .locals 5

    iget-object v0, p0, Lcom/motorola/otalib/main/LibCussm;->mSettings:Lcom/motorola/otalib/main/Settings/LibSettings;

    const-string v1, ""

    const-string v2, "otalib.CHECK_RERUEST_STRING"

    invoke-virtual {v0, v2, v1}, Lcom/motorola/otalib/main/Settings/LibSettings;->getConfig(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_0

    sget-object p0, Lcom/motorola/otalib/main/Logger;->OTALib_TAG:Ljava/lang/String;

    const-string v0, "Old DB entry clean up is not required its a fresh update"

    invoke-static {p0, v0}, Lcom/motorola/otalib/main/Logger;->debug(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_1

    :cond_0
    iget-object v0, p0, Lcom/motorola/otalib/main/LibCussm;->mSettings:Lcom/motorola/otalib/main/Settings/LibSettings;

    invoke-virtual {v0, v2}, Lcom/motorola/otalib/main/Settings/LibSettings;->removeConfig(Ljava/lang/String;)V

    iget-object v0, p0, Lcom/motorola/otalib/main/LibCussm;->_db:Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database;

    invoke-interface {v0}, Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database;->getVersions()Ljava/util/List;

    move-result-object v0

    if-nez v0, :cond_1

    sget-object p0, Lcom/motorola/otalib/main/Logger;->OTALib_TAG:Ljava/lang/String;

    const-string v0, "CusSM.cleanUpOldEntry: no versions found in database"

    invoke-static {p0, v0}, Lcom/motorola/otalib/main/Logger;->debug(Ljava/lang/String;Ljava/lang/String;)V

    return-void

    :cond_1
    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_2

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    iget-object v2, p0, Lcom/motorola/otalib/main/LibCussm;->_db:Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database;

    invoke-interface {v2, v1}, Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database;->remove(Ljava/lang/String;)V

    sget-object v2, Lcom/motorola/otalib/main/Logger;->OTALib_TAG:Ljava/lang/String;

    new-instance v3, Ljava/lang/StringBuilder;

    const-string v4, "CusSM.cleanUpOldEntry: deleting version "

    invoke-direct {v3, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v2, v1}, Lcom/motorola/otalib/main/Logger;->debug(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_0

    :cond_2
    :goto_1
    return-void
.end method

.method private declared-synchronized getUpgrade(Landroid/content/Context;Lcom/motorola/otalib/main/checkUpdate/CheckRequestObj;Lcom/motorola/otalib/common/metaData/MetaData;Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database$Descriptor;)V
    .locals 14

    move-object v13, p0

    monitor-enter p0

    :try_start_0
    iget-object v0, v13, Lcom/motorola/otalib/main/LibCussm;->_downloader:Lcom/motorola/otalib/common/Environment/DownloadHandler;

    if-eqz v0, :cond_1

    invoke-interface {v0}, Lcom/motorola/otalib/common/Environment/DownloadHandler;->isBusy()Z

    move-result v0

    if-eqz v0, :cond_0

    sget-object v0, Lcom/motorola/otalib/main/Logger;->OTALib_TAG:Ljava/lang/String;

    const-string v1, "CusSM.getUpgrade: copying or downloading is in progress"

    invoke-static {v0, v1}, Lcom/motorola/otalib/main/Logger;->debug(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit p0

    return-void

    :cond_0
    :try_start_1
    iget-object v0, v13, Lcom/motorola/otalib/main/LibCussm;->_downloader:Lcom/motorola/otalib/common/Environment/DownloadHandler;

    invoke-interface {v0}, Lcom/motorola/otalib/common/Environment/DownloadHandler;->close()V

    const/4 v0, 0x0

    iput-object v0, v13, Lcom/motorola/otalib/main/LibCussm;->_downloader:Lcom/motorola/otalib/common/Environment/DownloadHandler;

    :cond_1
    new-instance v0, Lcom/motorola/otalib/main/Downloader/LibDownloadHandler;

    iget-object v4, v13, Lcom/motorola/otalib/main/LibCussm;->mSettings:Lcom/motorola/otalib/main/Settings/LibSettings;

    invoke-virtual/range {p2 .. p2}, Lcom/motorola/otalib/main/checkUpdate/CheckRequestObj;->getInternalName()Ljava/lang/String;

    move-result-object v5

    iget-object v6, v13, Lcom/motorola/otalib/main/LibCussm;->mClientCallBack:Lcom/motorola/otalib/aidl/IOtaLibServiceCallBack;

    invoke-virtual/range {p2 .. p2}, Lcom/motorola/otalib/main/checkUpdate/CheckRequestObj;->getContextKey()Ljava/lang/String;

    move-result-object v7

    invoke-virtual/range {p3 .. p3}, Lcom/motorola/otalib/common/metaData/MetaData;->getDisplayVersion()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Ljava/lang/Long;->parseLong(Ljava/lang/String;)J

    move-result-wide v8

    invoke-virtual/range {p2 .. p2}, Lcom/motorola/otalib/main/checkUpdate/CheckRequestObj;->getAccsSerialNumber()Ljava/lang/String;

    move-result-object v10

    invoke-virtual/range {p2 .. p2}, Lcom/motorola/otalib/main/checkUpdate/CheckRequestObj;->getPrimaryKey()Ljava/lang/String;

    move-result-object v11

    move-object v1, v0

    move-object v2, p1

    move-object v3, p0

    move-object/from16 v12, p4

    invoke-direct/range {v1 .. v12}, Lcom/motorola/otalib/main/Downloader/LibDownloadHandler;-><init>(Landroid/content/Context;Lcom/motorola/otalib/main/LibCussm;Lcom/motorola/otalib/main/Settings/LibSettings;Ljava/lang/String;Lcom/motorola/otalib/aidl/IOtaLibServiceCallBack;Ljava/lang/String;JLjava/lang/String;Ljava/lang/String;Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database$Descriptor;)V

    iput-object v0, v13, Lcom/motorola/otalib/main/LibCussm;->_downloader:Lcom/motorola/otalib/common/Environment/DownloadHandler;

    move-object/from16 v1, p4

    invoke-interface {v0, v1}, Lcom/motorola/otalib/common/Environment/DownloadHandler;->transferUpgrade(Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database$Descriptor;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    monitor-exit p0

    return-void

    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method private handleStateResponse(Landroid/content/Context;Lcom/motorola/otalib/cdsservice/responsedataobjects/StateResponse;ILcom/motorola/otalib/main/checkUpdate/CheckRequestObj;Lcom/motorola/otalib/main/checkUpdate/UpdateSessionInfo;)V
    .locals 4

    sget-object p5, Lcom/motorola/otalib/main/Logger;->OTALib_TAG:Ljava/lang/String;

    const-string v0, "Inside handleStateResponse"

    invoke-static {p5, v0}, Lcom/motorola/otalib/main/Logger;->debug(Ljava/lang/String;Ljava/lang/String;)V

    sget p5, Lcom/motorola/otalib/main/LibCussm$STATE_EVENT_STATUS;->IDLE:I

    sput p5, Lcom/motorola/otalib/main/LibCussm;->_isSendingUpgradeStatus:I

    iget-object p5, p0, Lcom/motorola/otalib/main/LibCussm;->mSettings:Lcom/motorola/otalib/main/Settings/LibSettings;

    invoke-virtual {p4}, Lcom/motorola/otalib/main/checkUpdate/CheckRequestObj;->getPrimaryKey()Ljava/lang/String;

    move-result-object p4

    invoke-static {p5, p4}, Lcom/motorola/otalib/main/checkUpdate/UpdateSessionInfo;->getSessionDetails(Lcom/motorola/otalib/common/settings/Settings;Ljava/lang/String;)Lcom/motorola/otalib/main/checkUpdate/UpdateSessionInfo;

    move-result-object p4

    invoke-virtual {p4}, Lcom/motorola/otalib/main/checkUpdate/UpdateSessionInfo;->getTrackingId()Ljava/lang/String;

    move-result-object p5

    invoke-virtual {p2}, Lcom/motorola/otalib/cdsservice/responsedataobjects/StateResponse;->getTrackingId()Ljava/lang/String;

    move-result-object v0

    sget-object v1, Lcom/motorola/otalib/main/Logger;->OTALib_TAG:Ljava/lang/String;

    new-instance v2, Ljava/lang/StringBuilder;

    const-string v3, "stored id "

    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v2, p5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, " response id "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Lcom/motorola/otalib/main/Logger;->debug(Ljava/lang/String;Ljava/lang/String;)V

    iget-object v1, p0, Lcom/motorola/otalib/main/LibCussm;->_db:Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database;

    invoke-interface {v1}, Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database;->get_status()Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database$Status;

    move-result-object v1

    iget-object v2, p0, Lcom/motorola/otalib/main/LibCussm;->_db:Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database;

    invoke-interface {v2, p3}, Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database;->remove_status(I)V

    if-eqz p5, :cond_1

    invoke-virtual {p5, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p3

    if-eqz p3, :cond_1

    invoke-virtual {p2}, Lcom/motorola/otalib/cdsservice/responsedataobjects/StateResponse;->proceed()Z

    move-result p2

    const-string p3, "handleStateResponse server told to : "

    if-eqz p2, :cond_0

    if-eqz v1, :cond_0

    invoke-interface {v1}, Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database$Status;->getDeviceVersion()Ljava/lang/String;

    move-result-object p2

    invoke-direct {p0, p2}, Lcom/motorola/otalib/main/LibCussm;->isServiceControlEnabled(Ljava/lang/String;)Z

    move-result p2

    if-eqz p2, :cond_2

    invoke-direct {p0}, Lcom/motorola/otalib/main/LibCussm;->stopTimer()V

    iget-object p2, p0, Lcom/motorola/otalib/main/LibCussm;->mSettings:Lcom/motorola/otalib/main/Settings/LibSettings;

    invoke-interface {v1}, Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database$Status;->getDeviceVersion()Ljava/lang/String;

    move-result-object p5

    const-string v0, "continue"

    invoke-virtual {p4, p2, p5, v0}, Lcom/motorola/otalib/main/checkUpdate/UpdateSessionInfo;->setServiceControlResponse(Lcom/motorola/otalib/common/settings/Settings;Ljava/lang/String;Ljava/lang/String;)Lcom/motorola/otalib/main/checkUpdate/UpdateSessionInfo;

    move-result-object p2

    sget-object p4, Lcom/motorola/otalib/main/Logger;->OTALib_TAG:Ljava/lang/String;

    new-instance p5, Ljava/lang/StringBuilder;

    invoke-direct {p5, p3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p2}, Lcom/motorola/otalib/main/checkUpdate/UpdateSessionInfo;->getServiceControlResponse()Ljava/lang/String;

    move-result-object p2

    invoke-virtual {p5, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p2

    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    invoke-static {p4, p2}, Lcom/motorola/otalib/main/Logger;->debug(Ljava/lang/String;Ljava/lang/String;)V

    invoke-direct {p0, p1}, Lcom/motorola/otalib/main/LibCussm;->runStateMachine(Landroid/content/Context;)V

    goto :goto_0

    :cond_0
    if-eqz v1, :cond_2

    invoke-interface {v1}, Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database$Status;->getDeviceVersion()Ljava/lang/String;

    move-result-object p2

    invoke-direct {p0, p2}, Lcom/motorola/otalib/main/LibCussm;->isServiceControlEnabled(Ljava/lang/String;)Z

    move-result p2

    if-eqz p2, :cond_2

    invoke-direct {p0}, Lcom/motorola/otalib/main/LibCussm;->stopTimer()V

    iget-object p2, p0, Lcom/motorola/otalib/main/LibCussm;->mSettings:Lcom/motorola/otalib/main/Settings/LibSettings;

    invoke-interface {v1}, Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database$Status;->getDeviceVersion()Ljava/lang/String;

    move-result-object p5

    const-string v0, "cancel"

    invoke-virtual {p4, p2, p5, v0}, Lcom/motorola/otalib/main/checkUpdate/UpdateSessionInfo;->setServiceControlResponse(Lcom/motorola/otalib/common/settings/Settings;Ljava/lang/String;Ljava/lang/String;)Lcom/motorola/otalib/main/checkUpdate/UpdateSessionInfo;

    move-result-object p2

    sget-object p4, Lcom/motorola/otalib/main/Logger;->OTALib_TAG:Ljava/lang/String;

    new-instance p5, Ljava/lang/StringBuilder;

    invoke-direct {p5, p3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p2}, Lcom/motorola/otalib/main/checkUpdate/UpdateSessionInfo;->getServiceControlResponse()Ljava/lang/String;

    move-result-object p2

    invoke-virtual {p5, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p2

    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    invoke-static {p4, p2}, Lcom/motorola/otalib/main/Logger;->debug(Ljava/lang/String;Ljava/lang/String;)V

    invoke-direct {p0, p1}, Lcom/motorola/otalib/main/LibCussm;->runStateMachine(Landroid/content/Context;)V

    goto :goto_0

    :cond_1
    sget-object p2, Lcom/motorola/otalib/main/Logger;->OTALib_TAG:Ljava/lang/String;

    const-string p3, "CusSM:state request and response trackingId mismatch, return"

    invoke-static {p2, p3}, Lcom/motorola/otalib/main/Logger;->error(Ljava/lang/String;Ljava/lang/String;)V

    :cond_2
    :goto_0
    iget-object p2, p0, Lcom/motorola/otalib/main/LibCussm;->mSettings:Lcom/motorola/otalib/main/Settings/LibSettings;

    iget-object p3, p0, Lcom/motorola/otalib/main/LibCussm;->_db:Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database;

    invoke-virtual {p0, p2, p1, p3}, Lcom/motorola/otalib/main/LibCussm;->sendUpgradeStatus(Lcom/motorola/otalib/main/Settings/LibSettings;Landroid/content/Context;Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database;)V

    return-void
.end method

.method private isServiceControlEnabled(Ljava/lang/String;)Z
    .locals 0

    invoke-virtual {p0, p1}, Lcom/motorola/otalib/main/LibCussm;->getMetaData(Ljava/lang/String;)Lcom/motorola/otalib/common/metaData/MetaData;

    move-result-object p0

    if-eqz p0, :cond_0

    invoke-virtual {p0}, Lcom/motorola/otalib/common/metaData/MetaData;->isServiceControlEnabled()Z

    move-result p0

    if-eqz p0, :cond_0

    const/4 p0, 0x1

    goto :goto_0

    :cond_0
    const/4 p0, 0x0

    :goto_0
    return p0
.end method

.method private registerConnectivityNetwork(Landroid/content/Context;)V
    .locals 1

    const-string v0, "connectivity"

    invoke-virtual {p1, v0}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/net/ConnectivityManager;

    iput-object v0, p0, Lcom/motorola/otalib/main/LibCussm;->mConnMgr:Landroid/net/ConnectivityManager;

    new-instance v0, Lcom/motorola/otalib/main/LibCussm$1;

    invoke-direct {v0, p0, p1}, Lcom/motorola/otalib/main/LibCussm$1;-><init>(Lcom/motorola/otalib/main/LibCussm;Landroid/content/Context;)V

    iput-object v0, p0, Lcom/motorola/otalib/main/LibCussm;->networkCallback:Landroid/net/ConnectivityManager$NetworkCallback;

    return-void
.end method

.method private declared-synchronized runStateMachine(Landroid/content/Context;)V
    .locals 17

    move-object/from16 v9, p0

    move-object/from16 v0, p1

    monitor-enter p0

    :try_start_0
    iget-object v1, v9, Lcom/motorola/otalib/main/LibCussm;->mSettings:Lcom/motorola/otalib/main/Settings/LibSettings;

    iget-object v2, v9, Lcom/motorola/otalib/main/LibCussm;->_db:Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database;

    invoke-virtual {v9, v1, v0, v2}, Lcom/motorola/otalib/main/LibCussm;->sendUpgradeStatus(Lcom/motorola/otalib/main/Settings/LibSettings;Landroid/content/Context;Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database;)V

    iget-object v1, v9, Lcom/motorola/otalib/main/LibCussm;->_db:Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database;

    invoke-interface {v1}, Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database;->getVersions()Ljava/util/List;

    move-result-object v10

    if-nez v10, :cond_0

    sget-object v0, Lcom/motorola/otalib/main/Logger;->OTALib_TAG:Ljava/lang/String;

    const-string v1, "CusSM.runStateMachine: no versions found in database"

    invoke-static {v0, v1}, Lcom/motorola/otalib/main/Logger;->debug(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit p0

    return-void

    :cond_0
    :try_start_1
    invoke-interface {v10}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v11

    :catch_0
    :cond_1
    :goto_0
    invoke-interface {v11}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_f

    invoke-interface {v11}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    move-object v7, v1

    check-cast v7, Ljava/lang/String;

    iget-object v1, v9, Lcom/motorola/otalib/main/LibCussm;->_db:Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database;

    invoke-interface {v1, v7}, Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database;->getDescription(Ljava/lang/String;)Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database$Descriptor;

    move-result-object v8

    iget-object v1, v9, Lcom/motorola/otalib/main/LibCussm;->mSettings:Lcom/motorola/otalib/main/Settings/LibSettings;

    invoke-static {v1, v7}, Lcom/motorola/otalib/main/checkUpdate/UpdateSessionInfo;->getSessionDetails(Lcom/motorola/otalib/common/settings/Settings;Ljava/lang/String;)Lcom/motorola/otalib/main/checkUpdate/UpdateSessionInfo;

    move-result-object v12

    if-nez v8, :cond_2

    sget-object v1, Lcom/motorola/otalib/main/Logger;->OTALib_TAG:Ljava/lang/String;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "CusSM.runStateMachine: getVersions\'s primary key is "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, ",  but could not get its description"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Lcom/motorola/otalib/main/Logger;->error(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_0

    :cond_2
    invoke-direct {v9, v7}, Lcom/motorola/otalib/main/LibCussm;->isServiceControlEnabled(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_4

    sget-object v1, Lcom/motorola/otalib/main/Logger;->OTALib_TAG:Ljava/lang/String;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "CusSM.runStateMachine: server told to :"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v12}, Lcom/motorola/otalib/main/checkUpdate/UpdateSessionInfo;->getServiceControlResponse()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Lcom/motorola/otalib/main/Logger;->debug(Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v8}, Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database$Descriptor;->getState()Lcom/motorola/otalib/common/Environment/ApplicationEnv$PackageState;

    move-result-object v1

    sget-object v2, Lcom/motorola/otalib/common/Environment/ApplicationEnv$PackageState;->Result:Lcom/motorola/otalib/common/Environment/ApplicationEnv$PackageState;

    if-eq v1, v2, :cond_4

    const-string v1, "wait"

    invoke-virtual {v12}, Lcom/motorola/otalib/main/checkUpdate/UpdateSessionInfo;->getServiceControlResponse()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    if-eqz v1, :cond_3

    monitor-exit p0

    return-void

    :cond_3
    :try_start_2
    const-string v1, "cancel"

    invoke-virtual {v12}, Lcom/motorola/otalib/main/checkUpdate/UpdateSessionInfo;->getServiceControlResponse()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_4

    invoke-direct/range {p0 .. p0}, Lcom/motorola/otalib/main/LibCussm;->stopTimer()V

    const-string v1, "Server cancelled"

    invoke-direct {v9, v0, v1, v7}, Lcom/motorola/otalib/main/LibCussm;->cancelOTA(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    monitor-exit p0

    return-void

    :cond_4
    :try_start_3
    invoke-interface {v8}, Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database$Descriptor;->getMeta()Lcom/motorola/otalib/common/metaData/MetaData;

    move-result-object v13

    const-string v1, "RS_FAIL"

    invoke-interface {v8}, Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database$Descriptor;->getStatus()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    const/4 v14, 0x1

    xor-int/lit8 v15, v1, 0x1

    new-instance v16, Lcom/motorola/otalib/main/InstallStatusInfo;

    iget-object v4, v9, Lcom/motorola/otalib/main/LibCussm;->mSettings:Lcom/motorola/otalib/main/Settings/LibSettings;

    invoke-virtual {v12}, Lcom/motorola/otalib/main/checkUpdate/UpdateSessionInfo;->getStatusCode()I

    move-result v6

    move-object/from16 v1, v16

    move-object/from16 v2, p1

    move-object v3, v7

    move-object v5, v8

    invoke-direct/range {v1 .. v6}, Lcom/motorola/otalib/main/InstallStatusInfo;-><init>(Landroid/content/Context;Ljava/lang/String;Lcom/motorola/otalib/common/settings/Settings;Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database$Descriptor;I)V

    invoke-virtual {v12}, Lcom/motorola/otalib/main/checkUpdate/UpdateSessionInfo;->getCheckRequestObj()Lcom/motorola/otalib/main/checkUpdate/CheckRequestObj;

    move-result-object v6
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    :try_start_4
    iget-object v1, v9, Lcom/motorola/otalib/main/LibCussm;->mClientCallBack:Lcom/motorola/otalib/aidl/IOtaLibServiceCallBack;

    if-eqz v1, :cond_5

    if-eqz v6, :cond_5

    invoke-virtual {v6}, Lcom/motorola/otalib/main/checkUpdate/CheckRequestObj;->getContextKey()Ljava/lang/String;

    move-result-object v2

    invoke-virtual/range {v16 .. v16}, Lcom/motorola/otalib/main/InstallStatusInfo;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-interface {v1, v2, v15, v3}, Lcom/motorola/otalib/aidl/IOtaLibServiceCallBack;->onStatusUpdate(Ljava/lang/String;ZLjava/lang/String;)V

    goto :goto_1

    :cond_5
    iget-object v1, v9, Lcom/motorola/otalib/main/LibCussm;->_db:Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database;

    invoke-interface {v1, v7}, Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database;->remove(Ljava/lang/String;)V
    :try_end_4
    .catch Landroid/os/RemoteException; {:try_start_4 .. :try_end_4} :catch_1
    .catchall {:try_start_4 .. :try_end_4} :catchall_0

    monitor-exit p0

    return-void

    :catch_1
    :goto_1
    :try_start_5
    sget-object v1, Lcom/motorola/otalib/main/Logger;->OTALib_TAG:Ljava/lang/String;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Version "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, " state "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-interface {v8}, Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database$Descriptor;->getState()Lcom/motorola/otalib/common/Environment/ApplicationEnv$PackageState;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, " session info "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v12}, Lcom/motorola/otalib/main/checkUpdate/UpdateSessionInfo;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Lcom/motorola/otalib/main/Logger;->debug(Ljava/lang/String;Ljava/lang/String;)V

    sget-object v1, Lcom/motorola/otalib/main/LibCussm$3;->$SwitchMap$com$motorola$otalib$common$Environment$ApplicationEnv$PackageState:[I

    invoke-interface {v8}, Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database$Descriptor;->getState()Lcom/motorola/otalib/common/Environment/ApplicationEnv$PackageState;

    move-result-object v2

    invoke-virtual {v2}, Lcom/motorola/otalib/common/Environment/ApplicationEnv$PackageState;->ordinal()I

    move-result v2

    aget v1, v1, v2

    const/4 v2, 0x0

    if-eq v1, v14, :cond_d

    const/16 v3, 0x9

    if-eq v1, v3, :cond_c

    const/4 v3, 0x3

    if-eq v1, v3, :cond_8

    const/4 v2, 0x4

    if-eq v1, v2, :cond_7

    const/4 v2, 0x5

    if-eq v1, v2, :cond_6

    goto/16 :goto_0

    :cond_6
    invoke-direct {v9, v0, v6, v13, v8}, Lcom/motorola/otalib/main/LibCussm;->getUpgrade(Landroid/content/Context;Lcom/motorola/otalib/main/checkUpdate/CheckRequestObj;Lcom/motorola/otalib/common/metaData/MetaData;Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database$Descriptor;)V

    goto/16 :goto_0

    :cond_7
    new-instance v1, Lcom/motorola/otalib/main/checkUpdate/CheckUpdateHandler;

    invoke-direct {v1}, Lcom/motorola/otalib/main/checkUpdate/CheckUpdateHandler;-><init>()V
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_0

    :try_start_6
    iget-object v3, v9, Lcom/motorola/otalib/main/LibCussm;->_db:Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database;

    iget-object v5, v9, Lcom/motorola/otalib/main/LibCussm;->mClientCallBack:Lcom/motorola/otalib/aidl/IOtaLibServiceCallBack;

    iget-object v7, v9, Lcom/motorola/otalib/main/LibCussm;->mSettings:Lcom/motorola/otalib/main/Settings/LibSettings;

    invoke-interface {v8}, Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database$Descriptor;->getInfo()Ljava/lang/String;

    move-result-object v8

    move-object/from16 v2, p0

    move-object/from16 v4, p1

    move-object v13, v6

    move-object v6, v7

    move-object v7, v13

    invoke-virtual/range {v1 .. v8}, Lcom/motorola/otalib/main/checkUpdate/CheckUpdateHandler;->checkForDownloadDescriptor(Lcom/motorola/otalib/main/LibCussm;Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database;Landroid/content/Context;Lcom/motorola/otalib/aidl/IOtaLibServiceCallBack;Lcom/motorola/otalib/main/Settings/LibSettings;Lcom/motorola/otalib/main/checkUpdate/CheckRequestObj;Ljava/lang/String;)V
    :try_end_6
    .catch Landroid/os/RemoteException; {:try_start_6 .. :try_end_6} :catch_0
    .catchall {:try_start_6 .. :try_end_6} :catchall_0

    goto/16 :goto_0

    :cond_8
    move-object v13, v6

    :try_start_7
    new-instance v1, Ljava/io/File;

    invoke-virtual {v13}, Lcom/motorola/otalib/main/checkUpdate/CheckRequestObj;->getInternalName()Ljava/lang/String;

    move-result-object v3

    invoke-interface {v8}, Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database$Descriptor;->getMeta()Lcom/motorola/otalib/common/metaData/MetaData;

    move-result-object v4

    invoke-virtual {v4}, Lcom/motorola/otalib/common/metaData/MetaData;->getDisplayVersion()Ljava/lang/String;

    move-result-object v4

    invoke-static {v4}, Ljava/lang/Long;->parseLong(Ljava/lang/String;)J

    move-result-wide v4

    invoke-static {v0, v3, v4, v5}, Lcom/motorola/otalib/main/PublicUtilityMethods;->getFileName(Landroid/content/Context;Ljava/lang/String;J)Ljava/lang/String;

    move-result-object v3

    invoke-direct {v1, v3}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    sget-object v3, Lcom/motorola/otalib/main/Logger;->OTALib_TAG:Ljava/lang/String;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "LibDownloadHandler.transferUpgrade: Download file "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v1}, Ljava/io/File;->getName()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, " exists "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v1}, Ljava/io/File;->exists()Z

    move-result v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Lcom/motorola/otalib/main/Logger;->info(Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v1}, Ljava/io/File;->exists()Z

    move-result v3

    if-eqz v3, :cond_b

    invoke-virtual {v1}, Ljava/io/File;->length()J

    move-result-wide v3

    invoke-interface {v8}, Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database$Descriptor;->getMeta()Lcom/motorola/otalib/common/metaData/MetaData;

    move-result-object v5

    invoke-virtual {v5}, Lcom/motorola/otalib/common/metaData/MetaData;->getSize()J

    move-result-wide v5

    cmp-long v3, v3, v5

    if-nez v3, :cond_a

    sget-object v2, Lcom/motorola/otalib/main/Logger;->OTALib_TAG:Ljava/lang/String;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "LibDownloadHandler.transferUpgrade: no download, but file "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v1}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v3, " is already here"

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v2, v1}, Lcom/motorola/otalib/main/Logger;->info(Ljava/lang/String;Ljava/lang/String;)V

    if-eqz v13, :cond_9

    invoke-virtual {v13}, Lcom/motorola/otalib/main/checkUpdate/CheckRequestObj;->isForceInstall()Z

    move-result v1

    if-eqz v1, :cond_9

    iget-object v2, v9, Lcom/motorola/otalib/main/LibCussm;->_db:Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database;

    sget-object v4, Lcom/motorola/otalib/common/Environment/ApplicationEnv$PackageState;->ABApplyingPatch:Lcom/motorola/otalib/common/Environment/ApplicationEnv$PackageState;

    const-string v6, ""

    const-string v1, ""

    invoke-virtual {v12}, Lcom/motorola/otalib/main/checkUpdate/UpdateSessionInfo;->toString()Ljava/lang/String;

    move-result-object v8

    const/4 v5, 0x1

    move-object v3, v7

    move-object v7, v1

    invoke-interface/range {v2 .. v8}, Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database;->setState(Ljava/lang/String;Lcom/motorola/otalib/common/Environment/ApplicationEnv$PackageState;ZLjava/lang/String;Ljava/lang/String;Ljava/lang/String;)Z

    goto :goto_2

    :cond_9
    iget-object v2, v9, Lcom/motorola/otalib/main/LibCussm;->_db:Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database;

    sget-object v4, Lcom/motorola/otalib/common/Environment/ApplicationEnv$PackageState;->Querying:Lcom/motorola/otalib/common/Environment/ApplicationEnv$PackageState;

    const-string v6, ""

    const-string v1, ""

    invoke-virtual {v12}, Lcom/motorola/otalib/main/checkUpdate/UpdateSessionInfo;->toString()Ljava/lang/String;

    move-result-object v8

    const/4 v5, 0x1

    move-object v3, v7

    move-object v7, v1

    invoke-interface/range {v2 .. v8}, Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database;->setState(Ljava/lang/String;Lcom/motorola/otalib/common/Environment/ApplicationEnv$PackageState;ZLjava/lang/String;Ljava/lang/String;Ljava/lang/String;)Z

    :goto_2
    invoke-direct/range {p0 .. p1}, Lcom/motorola/otalib/main/LibCussm;->runStateMachine(Landroid/content/Context;)V
    :try_end_7
    .catchall {:try_start_7 .. :try_end_7} :catchall_0

    monitor-exit p0

    return-void

    :cond_a
    :try_start_8
    invoke-virtual {v1}, Ljava/io/File;->delete()Z

    sget-object v1, Lcom/motorola/otalib/main/Logger;->OTALib_TAG:Ljava/lang/String;

    const-string v3, "LibDownloadHandler.transferUpgrade: deleting older file"

    invoke-static {v1, v3}, Lcom/motorola/otalib/main/Logger;->info(Ljava/lang/String;Ljava/lang/String;)V

    :cond_b
    invoke-direct {v9, v10}, Lcom/motorola/otalib/main/LibCussm;->shouldMoveToDownloading(Ljava/util/List;)Z

    move-result v1

    if-eqz v1, :cond_1

    iget-object v1, v9, Lcom/motorola/otalib/main/LibCussm;->_db:Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database;

    sget-object v3, Lcom/motorola/otalib/common/Environment/ApplicationEnv$PackageState;->GettingDescriptor:Lcom/motorola/otalib/common/Environment/ApplicationEnv$PackageState;

    invoke-interface {v1, v7, v3, v2}, Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database;->setState(Ljava/lang/String;Lcom/motorola/otalib/common/Environment/ApplicationEnv$PackageState;Ljava/lang/String;)Z

    invoke-direct/range {p0 .. p1}, Lcom/motorola/otalib/main/LibCussm;->runStateMachine(Landroid/content/Context;)V

    goto/16 :goto_0

    :cond_c
    invoke-virtual {v13}, Lcom/motorola/otalib/common/metaData/MetaData;->getDisplayVersion()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v9, v0, v7, v15, v1}, Lcom/motorola/otalib/main/LibCussm;->cleanUpFiles(Landroid/content/Context;Ljava/lang/String;ZLjava/lang/String;)V

    goto/16 :goto_0

    :cond_d
    move-object v13, v6

    iget-object v1, v9, Lcom/motorola/otalib/main/LibCussm;->mConnMgr:Landroid/net/ConnectivityManager;

    iget-object v3, v9, Lcom/motorola/otalib/main/LibCussm;->networkCallback:Landroid/net/ConnectivityManager$NetworkCallback;

    invoke-virtual {v1, v3}, Landroid/net/ConnectivityManager;->registerDefaultNetworkCallback(Landroid/net/ConnectivityManager$NetworkCallback;)V

    invoke-virtual {v13}, Lcom/motorola/otalib/main/checkUpdate/CheckRequestObj;->isForceDownload()Z

    move-result v1

    if-eqz v1, :cond_e

    iget-object v1, v9, Lcom/motorola/otalib/main/LibCussm;->_db:Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database;

    sget-object v3, Lcom/motorola/otalib/common/Environment/ApplicationEnv$PackageState;->QueueForDownload:Lcom/motorola/otalib/common/Environment/ApplicationEnv$PackageState;

    invoke-interface {v1, v7, v3, v2}, Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database;->setVersionState(Ljava/lang/String;Lcom/motorola/otalib/common/Environment/ApplicationEnv$PackageState;Ljava/lang/String;)Z

    goto :goto_3

    :cond_e
    iget-object v1, v9, Lcom/motorola/otalib/main/LibCussm;->_db:Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database;

    sget-object v3, Lcom/motorola/otalib/common/Environment/ApplicationEnv$PackageState;->RequestPermission:Lcom/motorola/otalib/common/Environment/ApplicationEnv$PackageState;

    invoke-interface {v1, v7, v3, v2}, Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database;->setState(Ljava/lang/String;Lcom/motorola/otalib/common/Environment/ApplicationEnv$PackageState;Ljava/lang/String;)Z

    :goto_3
    invoke-direct/range {p0 .. p1}, Lcom/motorola/otalib/main/LibCussm;->runStateMachine(Landroid/content/Context;)V
    :try_end_8
    .catchall {:try_start_8 .. :try_end_8} :catchall_0

    goto/16 :goto_0

    :cond_f
    monitor-exit p0

    return-void

    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method private shouldMoveToDownloading(Ljava/util/List;)Z
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;)Z"
        }
    .end annotation

    sget-object v0, Lcom/motorola/otalib/main/Logger;->OTALib_TAG:Ljava/lang/String;

    invoke-virtual {p1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/motorola/otalib/main/Logger;->debug(Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object p1

    :cond_0
    :goto_0
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_3

    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    iget-object v1, p0, Lcom/motorola/otalib/main/LibCussm;->_db:Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database;

    invoke-interface {v1, v0}, Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database;->getDescription(Ljava/lang/String;)Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database$Descriptor;

    move-result-object v0

    if-nez v0, :cond_1

    goto :goto_0

    :cond_1
    invoke-interface {v0}, Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database$Descriptor;->getState()Lcom/motorola/otalib/common/Environment/ApplicationEnv$PackageState;

    move-result-object v1

    sget-object v2, Lcom/motorola/otalib/common/Environment/ApplicationEnv$PackageState;->GettingDescriptor:Lcom/motorola/otalib/common/Environment/ApplicationEnv$PackageState;

    const/4 v3, 0x0

    if-ne v1, v2, :cond_2

    return v3

    :cond_2
    invoke-interface {v0}, Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database$Descriptor;->getState()Lcom/motorola/otalib/common/Environment/ApplicationEnv$PackageState;

    move-result-object v0

    sget-object v1, Lcom/motorola/otalib/common/Environment/ApplicationEnv$PackageState;->GettingPackage:Lcom/motorola/otalib/common/Environment/ApplicationEnv$PackageState;

    if-ne v0, v1, :cond_0

    return v3

    :cond_3
    const/4 p0, 0x1

    return p0
.end method

.method private startTimer(Ljava/lang/String;Landroid/content/Context;)I
    .locals 6

    const-string v0, "startTimer, IllegalStateException, Maybe canceled. Ignore it"

    const-string v1, "startTimer, IllegalArgumentException, ignore it."

    invoke-virtual {p0, p1}, Lcom/motorola/otalib/main/LibCussm;->getMetaData(Ljava/lang/String;)Lcom/motorola/otalib/common/metaData/MetaData;

    move-result-object p1

    const/4 v2, 0x0

    if-nez p1, :cond_0

    sget-object p0, Lcom/motorola/otalib/main/Logger;->OTALib_TAG:Ljava/lang/String;

    const-string p1, "startTimer, not setting the timer as description is null"

    invoke-static {p0, p1}, Lcom/motorola/otalib/main/Logger;->debug(Ljava/lang/String;Ljava/lang/String;)V

    return v2

    :cond_0
    monitor-enter p0

    :try_start_0
    sget-object v3, Lcom/motorola/otalib/main/LibCussm;->_mTimer:Ljava/util/Timer;

    if-nez v3, :cond_1

    new-instance v3, Lcom/motorola/otalib/main/LibCussm$defaultAction;

    invoke-direct {v3, p0, p1, p2}, Lcom/motorola/otalib/main/LibCussm$defaultAction;-><init>(Lcom/motorola/otalib/main/LibCussm;Lcom/motorola/otalib/common/metaData/MetaData;Landroid/content/Context;)V

    new-instance p2, Ljava/util/Timer;

    invoke-direct {p2}, Ljava/util/Timer;-><init>()V

    sput-object p2, Lcom/motorola/otalib/main/LibCussm;->_mTimer:Ljava/util/Timer;

    invoke-virtual {p1}, Lcom/motorola/otalib/common/metaData/MetaData;->getServiceTimeoutSeconds()I

    move-result p1

    mul-int/lit16 p1, p1, 0x3e8

    int-to-long v4, p1

    invoke-virtual {p2, v3, v4, v5}, Ljava/util/Timer;->schedule(Ljava/util/TimerTask;J)V

    goto :goto_0

    :cond_1
    sget-object p1, Lcom/motorola/otalib/main/Logger;->OTALib_TAG:Ljava/lang/String;

    const-string p2, "defaultAction have been scheduled, do nothing"

    invoke-static {p1, p2}, Lcom/motorola/otalib/main/Logger;->debug(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/lang/IllegalArgumentException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/lang/IllegalStateException; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    goto :goto_0

    :catchall_0
    move-exception p1

    goto :goto_1

    :catch_0
    move-exception p1

    :try_start_1
    sget-object p2, Lcom/motorola/otalib/main/Logger;->OTALib_TAG:Ljava/lang/String;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {p2, p1}, Lcom/motorola/otalib/main/Logger;->error(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_0

    :catch_1
    move-exception p1

    sget-object p2, Lcom/motorola/otalib/main/Logger;->OTALib_TAG:Ljava/lang/String;

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {p2, p1}, Lcom/motorola/otalib/main/Logger;->error(Ljava/lang/String;Ljava/lang/String;)V

    :goto_0
    monitor-exit p0

    return v2

    :goto_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw p1
.end method

.method private stopTimer()V
    .locals 2

    monitor-enter p0

    :try_start_0
    sget-object v0, Lcom/motorola/otalib/main/LibCussm;->_mTimer:Ljava/util/Timer;

    if-eqz v0, :cond_0

    sget-object v0, Lcom/motorola/otalib/main/Logger;->OTALib_TAG:Ljava/lang/String;

    const-string v1, "stopTimer, cancel()"

    invoke-static {v0, v1}, Lcom/motorola/otalib/main/Logger;->debug(Ljava/lang/String;Ljava/lang/String;)V

    sget-object v0, Lcom/motorola/otalib/main/LibCussm;->_mTimer:Ljava/util/Timer;

    invoke-virtual {v0}, Ljava/util/Timer;->cancel()V

    const/4 v0, 0x0

    sput-object v0, Lcom/motorola/otalib/main/LibCussm;->_mTimer:Ljava/util/Timer;

    goto :goto_0

    :cond_0
    sget-object v0, Lcom/motorola/otalib/main/Logger;->OTALib_TAG:Ljava/lang/String;

    const-string v1, "stopTimer, have stoped, do nothing"

    invoke-static {v0, v1}, Lcom/motorola/otalib/main/Logger;->debug(Ljava/lang/String;Ljava/lang/String;)V

    :goto_0
    monitor-exit p0

    return-void

    :catchall_0
    move-exception v0

    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v0
.end method


# virtual methods
.method public OnUpgradeStatus(Landroid/content/Context;Ljava/lang/String;ZLjava/lang/String;)V
    .locals 10

    sget-object v1, Lcom/motorola/otalib/main/Logger;->OTALib_TAG:Ljava/lang/String;

    const-string v3, "CusSM.OnUpgradeStatus: from lib"

    invoke-static {v1, v3}, Lcom/motorola/otalib/main/Logger;->debug(Ljava/lang/String;Ljava/lang/String;)V

    iget-object v1, p0, Lcom/motorola/otalib/main/LibCussm;->_db:Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database;

    invoke-interface {v1, p2}, Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database;->getDescription(Ljava/lang/String;)Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database$Descriptor;

    move-result-object v1

    if-nez v1, :cond_0

    sget-object v0, Lcom/motorola/otalib/main/Logger;->OTALib_TAG:Ljava/lang/String;

    const-string v1, "CusSM.onInternalNotification: primary key is not in db"

    invoke-static {v0, v1}, Lcom/motorola/otalib/main/Logger;->debug(Ljava/lang/String;Ljava/lang/String;)V

    return-void

    :cond_0
    invoke-static {p4}, Lcom/motorola/otalib/main/InstallStatusInfo;->fromJsonString(Ljava/lang/String;)Lcom/motorola/otalib/main/InstallStatusInfo;

    move-result-object v3

    if-nez v3, :cond_1

    iget-object v1, p0, Lcom/motorola/otalib/main/LibCussm;->_db:Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database;

    sget-object v3, Lcom/motorola/otalib/common/Environment/ApplicationEnv$PackageState;->Result:Lcom/motorola/otalib/common/Environment/ApplicationEnv$PackageState;

    iget-object v4, p0, Lcom/motorola/otalib/main/LibCussm;->mSettings:Lcom/motorola/otalib/main/Settings/LibSettings;

    invoke-static {v4, p2}, Lcom/motorola/otalib/main/checkUpdate/UpdateSessionInfo;->getSessionDetails(Lcom/motorola/otalib/common/settings/Settings;Ljava/lang/String;)Lcom/motorola/otalib/main/checkUpdate/UpdateSessionInfo;

    move-result-object v4

    invoke-virtual {v4}, Lcom/motorola/otalib/main/checkUpdate/UpdateSessionInfo;->toString()Ljava/lang/String;

    move-result-object v7

    const-string v5, "APK sent empty install status info"

    const-string v6, "EMPTY_STATUS_INFO"

    move-object v2, p2

    move v4, p3

    invoke-interface/range {v1 .. v7}, Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database;->setState(Ljava/lang/String;Lcom/motorola/otalib/common/Environment/ApplicationEnv$PackageState;ZLjava/lang/String;Ljava/lang/String;Ljava/lang/String;)Z

    invoke-direct {p0, p1}, Lcom/motorola/otalib/main/LibCussm;->runStateMachine(Landroid/content/Context;)V

    return-void

    :cond_1
    sget-object v4, Lcom/motorola/otalib/main/Logger;->OTALib_TAG:Ljava/lang/String;

    new-instance v5, Ljava/lang/StringBuilder;

    const-string v6, "CusSM.OnUpgradeStatus: Notified version "

    invoke-direct {v5, v6}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v5, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, " that is in state "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-interface {v1}, Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database$Descriptor;->getState()Lcom/motorola/otalib/common/Environment/ApplicationEnv$PackageState;

    move-result-object v6

    invoke-virtual {v6}, Lcom/motorola/otalib/common/Environment/ApplicationEnv$PackageState;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, " to "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v3}, Lcom/motorola/otalib/main/InstallStatusInfo;->getServerState()Lcom/motorola/otalib/common/Environment/ApplicationEnv$PackageState;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v4, v5}, Lcom/motorola/otalib/main/Logger;->error(Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v3}, Lcom/motorola/otalib/main/InstallStatusInfo;->getStatusMessage()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v3}, Lcom/motorola/otalib/main/InstallStatusInfo;->getReportingError()Lcom/motorola/otalib/main/PublicUtilityMethods$STATUS_CODE;

    move-result-object v4

    if-nez v4, :cond_2

    sget-object v4, Lcom/motorola/otalib/main/PublicUtilityMethods$STATUS_CODE;->ERROR_OTHER:Lcom/motorola/otalib/main/PublicUtilityMethods$STATUS_CODE;

    goto :goto_0

    :cond_2
    invoke-virtual {v3}, Lcom/motorola/otalib/main/InstallStatusInfo;->getReportingError()Lcom/motorola/otalib/main/PublicUtilityMethods$STATUS_CODE;

    move-result-object v4

    :goto_0
    iget-object v6, p0, Lcom/motorola/otalib/main/LibCussm;->mSettings:Lcom/motorola/otalib/main/Settings/LibSettings;

    invoke-interface {v1}, Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database$Descriptor;->getVersion()Ljava/lang/String;

    move-result-object v7

    invoke-static {v6, v7}, Lcom/motorola/otalib/main/checkUpdate/UpdateSessionInfo;->getSessionDetails(Lcom/motorola/otalib/common/settings/Settings;Ljava/lang/String;)Lcom/motorola/otalib/main/checkUpdate/UpdateSessionInfo;

    move-result-object v6

    invoke-interface {v1}, Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database$Descriptor;->getState()Lcom/motorola/otalib/common/Environment/ApplicationEnv$PackageState;

    move-result-object v7

    sget-object v8, Lcom/motorola/otalib/common/Environment/ApplicationEnv$PackageState;->RequestPermission:Lcom/motorola/otalib/common/Environment/ApplicationEnv$PackageState;

    if-ne v7, v8, :cond_3

    invoke-virtual {v3}, Lcom/motorola/otalib/main/InstallStatusInfo;->getServerState()Lcom/motorola/otalib/common/Environment/ApplicationEnv$PackageState;

    move-result-object v7

    sget-object v8, Lcom/motorola/otalib/common/Environment/ApplicationEnv$PackageState;->QueueForDownload:Lcom/motorola/otalib/common/Environment/ApplicationEnv$PackageState;

    if-ne v7, v8, :cond_3

    iget-object v1, p0, Lcom/motorola/otalib/main/LibCussm;->_db:Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database;

    invoke-virtual {v3}, Lcom/motorola/otalib/main/InstallStatusInfo;->getServerState()Lcom/motorola/otalib/common/Environment/ApplicationEnv$PackageState;

    move-result-object v3

    const-string v4, ""

    invoke-interface {v1, p2, v3, v4}, Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database;->setVersionState(Ljava/lang/String;Lcom/motorola/otalib/common/Environment/ApplicationEnv$PackageState;Ljava/lang/String;)Z

    invoke-direct {p0, p1}, Lcom/motorola/otalib/main/LibCussm;->runStateMachine(Landroid/content/Context;)V

    goto/16 :goto_1

    :cond_3
    invoke-interface {v1}, Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database$Descriptor;->getState()Lcom/motorola/otalib/common/Environment/ApplicationEnv$PackageState;

    move-result-object v7

    sget-object v8, Lcom/motorola/otalib/common/Environment/ApplicationEnv$PackageState;->Querying:Lcom/motorola/otalib/common/Environment/ApplicationEnv$PackageState;

    if-ne v7, v8, :cond_4

    invoke-virtual {v3}, Lcom/motorola/otalib/main/InstallStatusInfo;->getServerState()Lcom/motorola/otalib/common/Environment/ApplicationEnv$PackageState;

    move-result-object v7

    sget-object v8, Lcom/motorola/otalib/common/Environment/ApplicationEnv$PackageState;->ABApplyingPatch:Lcom/motorola/otalib/common/Environment/ApplicationEnv$PackageState;

    if-ne v7, v8, :cond_4

    iget-object v1, p0, Lcom/motorola/otalib/main/LibCussm;->_db:Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database;

    invoke-virtual {v3}, Lcom/motorola/otalib/main/InstallStatusInfo;->getServerState()Lcom/motorola/otalib/common/Environment/ApplicationEnv$PackageState;

    move-result-object v3

    const-string v7, ""

    invoke-virtual {v6}, Lcom/motorola/otalib/main/checkUpdate/UpdateSessionInfo;->toString()Ljava/lang/String;

    move-result-object v8

    const-string v5, ""

    move-object v2, p2

    move v4, p3

    move-object v6, v7

    move-object v7, v8

    invoke-interface/range {v1 .. v7}, Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database;->setState(Ljava/lang/String;Lcom/motorola/otalib/common/Environment/ApplicationEnv$PackageState;ZLjava/lang/String;Ljava/lang/String;Ljava/lang/String;)Z

    invoke-direct {p0, p1}, Lcom/motorola/otalib/main/LibCussm;->runStateMachine(Landroid/content/Context;)V

    goto/16 :goto_1

    :cond_4
    invoke-interface {v1}, Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database$Descriptor;->getState()Lcom/motorola/otalib/common/Environment/ApplicationEnv$PackageState;

    move-result-object v1

    sget-object v7, Lcom/motorola/otalib/common/Environment/ApplicationEnv$PackageState;->ABApplyingPatch:Lcom/motorola/otalib/common/Environment/ApplicationEnv$PackageState;

    if-ne v1, v7, :cond_5

    invoke-virtual {v3}, Lcom/motorola/otalib/main/InstallStatusInfo;->getServerState()Lcom/motorola/otalib/common/Environment/ApplicationEnv$PackageState;

    move-result-object v1

    sget-object v7, Lcom/motorola/otalib/common/Environment/ApplicationEnv$PackageState;->Upgrading:Lcom/motorola/otalib/common/Environment/ApplicationEnv$PackageState;

    if-ne v1, v7, :cond_5

    iget-object v1, p0, Lcom/motorola/otalib/main/LibCussm;->_db:Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database;

    invoke-virtual {v3}, Lcom/motorola/otalib/main/InstallStatusInfo;->getServerState()Lcom/motorola/otalib/common/Environment/ApplicationEnv$PackageState;

    move-result-object v3

    const-string v7, ""

    invoke-virtual {v6}, Lcom/motorola/otalib/main/checkUpdate/UpdateSessionInfo;->toString()Ljava/lang/String;

    move-result-object v8

    const-string v5, ""

    move-object v2, p2

    move v4, p3

    move-object v6, v7

    move-object v7, v8

    invoke-interface/range {v1 .. v7}, Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database;->setState(Ljava/lang/String;Lcom/motorola/otalib/common/Environment/ApplicationEnv$PackageState;ZLjava/lang/String;Ljava/lang/String;Ljava/lang/String;)Z

    invoke-direct {p0, p1}, Lcom/motorola/otalib/main/LibCussm;->runStateMachine(Landroid/content/Context;)V

    goto :goto_1

    :cond_5
    invoke-virtual {v3}, Lcom/motorola/otalib/main/InstallStatusInfo;->getServerState()Lcom/motorola/otalib/common/Environment/ApplicationEnv$PackageState;

    move-result-object v1

    sget-object v7, Lcom/motorola/otalib/common/Environment/ApplicationEnv$PackageState;->Result:Lcom/motorola/otalib/common/Environment/ApplicationEnv$PackageState;

    if-ne v1, v7, :cond_8

    invoke-virtual {v6}, Lcom/motorola/otalib/main/checkUpdate/UpdateSessionInfo;->getCheckRequestObj()Lcom/motorola/otalib/main/checkUpdate/CheckRequestObj;

    move-result-object v1

    if-eqz v1, :cond_7

    sget-object v7, Lcom/motorola/otalib/main/Logger;->OTALib_TAG:Ljava/lang/String;

    new-instance v8, Ljava/lang/StringBuilder;

    const-string v9, "CusSM.OnUpgradeStatus: "

    invoke-direct {v8, v9}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1}, Lcom/motorola/otalib/main/checkUpdate/CheckRequestObj;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-static {v7, v8}, Lcom/motorola/otalib/main/Logger;->debug(Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v3}, Lcom/motorola/otalib/main/InstallStatusInfo;->getSourceVersion()J

    move-result-wide v7

    invoke-virtual {v1, v7, v8}, Lcom/motorola/otalib/main/checkUpdate/CheckRequestObj;->setSourceVersion(J)Lcom/motorola/otalib/main/checkUpdate/CheckRequestObj;

    invoke-virtual {v3}, Lcom/motorola/otalib/main/InstallStatusInfo;->isKeepPackage()Z

    move-result v7

    invoke-virtual {v6, v7}, Lcom/motorola/otalib/main/checkUpdate/UpdateSessionInfo;->setKeepPackage(Z)V

    invoke-virtual {v3}, Lcom/motorola/otalib/main/InstallStatusInfo;->getStatusCode()I

    move-result v7

    invoke-virtual {v6, v7}, Lcom/motorola/otalib/main/checkUpdate/UpdateSessionInfo;->setStatusCode(I)V

    invoke-virtual {v1}, Lcom/motorola/otalib/main/checkUpdate/CheckRequestObj;->toString()Ljava/lang/String;

    move-result-object v1

    iget-object v7, p0, Lcom/motorola/otalib/main/LibCussm;->mSettings:Lcom/motorola/otalib/main/Settings/LibSettings;

    invoke-virtual {v6, v1, v7}, Lcom/motorola/otalib/main/checkUpdate/UpdateSessionInfo;->setCheckRequestObj(Ljava/lang/String;Lcom/motorola/otalib/common/settings/Settings;)Lcom/motorola/otalib/main/checkUpdate/CheckRequestObj;

    if-eqz p3, :cond_6

    sget-object v4, Lcom/motorola/otalib/main/PublicUtilityMethods$STATUS_CODE;->SUCCESS:Lcom/motorola/otalib/main/PublicUtilityMethods$STATUS_CODE;

    :cond_6
    iget-object v1, p0, Lcom/motorola/otalib/main/LibCussm;->_db:Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database;

    invoke-virtual {v3}, Lcom/motorola/otalib/main/InstallStatusInfo;->getServerState()Lcom/motorola/otalib/common/Environment/ApplicationEnv$PackageState;

    move-result-object v3

    invoke-virtual {v4}, Lcom/motorola/otalib/main/PublicUtilityMethods$STATUS_CODE;->name()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6}, Lcom/motorola/otalib/main/checkUpdate/UpdateSessionInfo;->toString()Ljava/lang/String;

    move-result-object v8

    move-object v2, p2

    move v4, p3

    move-object v6, v7

    move-object v7, v8

    invoke-interface/range {v1 .. v7}, Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database;->setState(Ljava/lang/String;Lcom/motorola/otalib/common/Environment/ApplicationEnv$PackageState;ZLjava/lang/String;Ljava/lang/String;Ljava/lang/String;)Z

    :cond_7
    invoke-direct {p0, p1}, Lcom/motorola/otalib/main/LibCussm;->runStateMachine(Landroid/content/Context;)V

    :cond_8
    :goto_1
    return-void
.end method

.method public checkForUpdate(Lcom/motorola/otalib/main/checkUpdate/CheckRequestObj;Landroid/content/Context;)V
    .locals 8

    new-instance v0, Lcom/motorola/otalib/main/checkUpdate/CheckUpdateHandler;

    invoke-direct {v0}, Lcom/motorola/otalib/main/checkUpdate/CheckUpdateHandler;-><init>()V

    :try_start_0
    iget-object v2, p0, Lcom/motorola/otalib/main/LibCussm;->_db:Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database;

    iget-object v4, p0, Lcom/motorola/otalib/main/LibCussm;->mClientCallBack:Lcom/motorola/otalib/aidl/IOtaLibServiceCallBack;

    iget-object v7, p0, Lcom/motorola/otalib/main/LibCussm;->mSettings:Lcom/motorola/otalib/main/Settings/LibSettings;

    const/4 v6, 0x1

    move-object v1, p1

    move-object v3, p0

    move-object v5, p2

    invoke-virtual/range {v0 .. v7}, Lcom/motorola/otalib/main/checkUpdate/CheckUpdateHandler;->checkForUpdate(Lcom/motorola/otalib/main/checkUpdate/CheckRequestObj;Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database;Lcom/motorola/otalib/main/LibCussm;Lcom/motorola/otalib/aidl/IOtaLibServiceCallBack;Landroid/content/Context;ZLcom/motorola/otalib/main/Settings/LibSettings;)V
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    return-void

    :catch_0
    move-exception p2

    iget-object p0, p0, Lcom/motorola/otalib/main/LibCussm;->mSettings:Lcom/motorola/otalib/main/Settings/LibSettings;

    invoke-virtual {p1}, Lcom/motorola/otalib/main/checkUpdate/CheckRequestObj;->getPrimaryKey()Ljava/lang/String;

    move-result-object p1

    invoke-static {p0, p1}, Lcom/motorola/otalib/main/checkUpdate/UpdateSessionInfo;->deleteSessionDetails(Lcom/motorola/otalib/common/settings/Settings;Ljava/lang/String;)V

    new-instance p0, Ljava/lang/RuntimeException;

    invoke-direct {p0, p2}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/Throwable;)V

    throw p0
.end method

.method public downloadConfigFiles(Landroid/content/Context;Lcom/motorola/otalib/aidl/IOtaLibServiceCallBack;Ljava/lang/String;)V
    .locals 3

    iget-object v0, p0, Lcom/motorola/otalib/main/LibCussm;->_downloader:Lcom/motorola/otalib/common/Environment/DownloadHandler;

    const/4 v1, 0x0

    if-eqz v0, :cond_1

    invoke-interface {v0}, Lcom/motorola/otalib/common/Environment/DownloadHandler;->isBusy()Z

    move-result v0

    if-eqz v0, :cond_0

    sget-object p0, Lcom/motorola/otalib/main/Logger;->OTALib_TAG:Ljava/lang/String;

    const-string p1, "CusSM.getUpgrade: copying or downloading is in progress"

    invoke-static {p0, p1}, Lcom/motorola/otalib/main/Logger;->debug(Ljava/lang/String;Ljava/lang/String;)V

    return-void

    :cond_0
    iget-object v0, p0, Lcom/motorola/otalib/main/LibCussm;->_downloader:Lcom/motorola/otalib/common/Environment/DownloadHandler;

    invoke-interface {v0}, Lcom/motorola/otalib/common/Environment/DownloadHandler;->close()V

    iput-object v1, p0, Lcom/motorola/otalib/main/LibCussm;->_downloader:Lcom/motorola/otalib/common/Environment/DownloadHandler;

    :cond_1
    new-instance v0, Lcom/motorola/otalib/main/Downloader/ConfigDownloader;

    iget-object v2, p0, Lcom/motorola/otalib/main/LibCussm;->mSettings:Lcom/motorola/otalib/main/Settings/LibSettings;

    invoke-direct {v0, p1, v2, p2, p3}, Lcom/motorola/otalib/main/Downloader/ConfigDownloader;-><init>(Landroid/content/Context;Lcom/motorola/otalib/main/Settings/LibSettings;Lcom/motorola/otalib/aidl/IOtaLibServiceCallBack;Ljava/lang/String;)V

    iput-object v0, p0, Lcom/motorola/otalib/main/LibCussm;->_downloader:Lcom/motorola/otalib/common/Environment/DownloadHandler;

    invoke-interface {v0, v1}, Lcom/motorola/otalib/common/Environment/DownloadHandler;->transferUpgrade(Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database$Descriptor;)V

    return-void
.end method

.method public declared-synchronized failProgress(Landroid/content/Context;Ljava/lang/String;Lcom/motorola/otalib/common/utils/UpgradeUtils$DownloadStatus;Ljava/lang/String;Ljava/lang/String;)V
    .locals 8

    monitor-enter p0

    :try_start_0
    iget-object p3, p0, Lcom/motorola/otalib/main/LibCussm;->_downloader:Lcom/motorola/otalib/common/Environment/DownloadHandler;

    if-eqz p3, :cond_0

    invoke-interface {p3}, Lcom/motorola/otalib/common/Environment/DownloadHandler;->close()V

    const/4 p3, 0x0

    iput-object p3, p0, Lcom/motorola/otalib/main/LibCussm;->_downloader:Lcom/motorola/otalib/common/Environment/DownloadHandler;

    :cond_0
    iget-object p3, p0, Lcom/motorola/otalib/main/LibCussm;->_db:Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database;

    invoke-interface {p3, p2}, Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database;->getDescription(Ljava/lang/String;)Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database$Descriptor;

    move-result-object p3

    if-nez p3, :cond_1

    sget-object p1, Lcom/motorola/otalib/main/Logger;->OTALib_TAG:Ljava/lang/String;

    const-string p2, "no primary Key found for this primary Key in db,drop the request to floor"

    invoke-static {p1, p2}, Lcom/motorola/otalib/main/Logger;->error(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit p0

    return-void

    :cond_1
    :try_start_1
    iget-object p3, p0, Lcom/motorola/otalib/main/LibCussm;->mSettings:Lcom/motorola/otalib/main/Settings/LibSettings;

    sget-object v0, Lcom/motorola/otalib/main/Settings/LibConfigs;->OTA_LIB_DOWNLOAD_RETRY_ATTEMPTS:Lcom/motorola/otalib/main/Settings/LibConfigs;

    invoke-virtual {p3, v0}, Lcom/motorola/otalib/main/Settings/LibSettings;->removeConfig(Lcom/motorola/otalib/common/settings/ISetting;)V

    iget-object p3, p0, Lcom/motorola/otalib/main/LibCussm;->mSettings:Lcom/motorola/otalib/main/Settings/LibSettings;

    sget-object v0, Lcom/motorola/otalib/main/Settings/LibConfigs;->OTA_LIB_DOWNLOAD_EXCEPTION_RETRY_ATTEMPTS:Lcom/motorola/otalib/main/Settings/LibConfigs;

    invoke-virtual {p3, v0}, Lcom/motorola/otalib/main/Settings/LibSettings;->removeConfig(Lcom/motorola/otalib/common/settings/ISetting;)V

    iget-object p3, p0, Lcom/motorola/otalib/main/LibCussm;->mSettings:Lcom/motorola/otalib/main/Settings/LibSettings;

    sget-object v0, Lcom/motorola/otalib/main/Settings/LibConfigs;->DOWNLOAD_DESCRIPTOR:Lcom/motorola/otalib/main/Settings/LibConfigs;

    invoke-virtual {p3, v0}, Lcom/motorola/otalib/main/Settings/LibSettings;->removeConfig(Lcom/motorola/otalib/common/settings/ISetting;)V

    iget-object p3, p0, Lcom/motorola/otalib/main/LibCussm;->mSettings:Lcom/motorola/otalib/main/Settings/LibSettings;

    sget-object v0, Lcom/motorola/otalib/main/Settings/LibConfigs;->DOWNLOAD_DESCRIPTOR_TIME:Lcom/motorola/otalib/main/Settings/LibConfigs;

    invoke-virtual {p3, v0}, Lcom/motorola/otalib/main/Settings/LibSettings;->removeConfig(Lcom/motorola/otalib/common/settings/ISetting;)V

    iget-object v1, p0, Lcom/motorola/otalib/main/LibCussm;->_db:Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database;

    sget-object v3, Lcom/motorola/otalib/common/Environment/ApplicationEnv$PackageState;->Result:Lcom/motorola/otalib/common/Environment/ApplicationEnv$PackageState;

    iget-object p3, p0, Lcom/motorola/otalib/main/LibCussm;->mSettings:Lcom/motorola/otalib/main/Settings/LibSettings;

    invoke-static {p3, p2}, Lcom/motorola/otalib/main/checkUpdate/UpdateSessionInfo;->getSessionDetails(Lcom/motorola/otalib/common/settings/Settings;Ljava/lang/String;)Lcom/motorola/otalib/main/checkUpdate/UpdateSessionInfo;

    move-result-object p3

    invoke-virtual {p3}, Lcom/motorola/otalib/main/checkUpdate/UpdateSessionInfo;->toString()Ljava/lang/String;

    move-result-object v7

    const/4 v4, 0x0

    move-object v2, p2

    move-object v5, p4

    move-object v6, p5

    invoke-interface/range {v1 .. v7}, Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database;->setState(Ljava/lang/String;Lcom/motorola/otalib/common/Environment/ApplicationEnv$PackageState;ZLjava/lang/String;Ljava/lang/String;Ljava/lang/String;)Z

    invoke-direct {p0, p1}, Lcom/motorola/otalib/main/LibCussm;->runStateMachine(Landroid/content/Context;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    monitor-exit p0

    return-void

    :catchall_0
    move-exception p1

    monitor-exit p0

    throw p1
.end method

.method public declared-synchronized getCurrentState(Ljava/lang/String;)Lcom/motorola/otalib/common/Environment/ApplicationEnv$PackageState;
    .locals 1

    monitor-enter p0

    :try_start_0
    iget-object v0, p0, Lcom/motorola/otalib/main/LibCussm;->_db:Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database;

    invoke-interface {v0, p1}, Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database;->getDescription(Ljava/lang/String;)Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database$Descriptor;

    move-result-object p1

    if-nez p1, :cond_0

    sget-object p1, Lcom/motorola/otalib/common/Environment/ApplicationEnv$PackageState;->IDLE:Lcom/motorola/otalib/common/Environment/ApplicationEnv$PackageState;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit p0

    return-object p1

    :cond_0
    :try_start_1
    invoke-interface {p1}, Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database$Descriptor;->getState()Lcom/motorola/otalib/common/Environment/ApplicationEnv$PackageState;

    move-result-object p1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    monitor-exit p0

    return-object p1

    :catchall_0
    move-exception p1

    monitor-exit p0

    throw p1
.end method

.method public declared-synchronized getMetaData(Ljava/lang/String;)Lcom/motorola/otalib/common/metaData/MetaData;
    .locals 1

    monitor-enter p0

    :try_start_0
    iget-object v0, p0, Lcom/motorola/otalib/main/LibCussm;->_db:Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database;

    invoke-interface {v0, p1}, Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database;->getDescription(Ljava/lang/String;)Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database$Descriptor;

    move-result-object p1

    if-nez p1, :cond_0

    sget-object p1, Lcom/motorola/otalib/main/Logger;->OTALib_TAG:Ljava/lang/String;

    const-string v0, "Description is null"

    invoke-static {p1, v0}, Lcom/motorola/otalib/main/Logger;->debug(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit p0

    const/4 p0, 0x0

    return-object p0

    :cond_0
    :try_start_1
    invoke-interface {p1}, Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database$Descriptor;->getMeta()Lcom/motorola/otalib/common/metaData/MetaData;

    move-result-object p1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    monitor-exit p0

    return-object p1

    :catchall_0
    move-exception p1

    monitor-exit p0

    throw p1
.end method

.method public declared-synchronized getPreviousSourceVersion(Ljava/lang/String;)J
    .locals 2

    monitor-enter p0

    :try_start_0
    iget-object v0, p0, Lcom/motorola/otalib/main/LibCussm;->mSettings:Lcom/motorola/otalib/main/Settings/LibSettings;

    invoke-static {v0, p1}, Lcom/motorola/otalib/main/checkUpdate/UpdateSessionInfo;->getSessionDetails(Lcom/motorola/otalib/common/settings/Settings;Ljava/lang/String;)Lcom/motorola/otalib/main/checkUpdate/UpdateSessionInfo;

    move-result-object p1

    invoke-virtual {p1}, Lcom/motorola/otalib/main/checkUpdate/UpdateSessionInfo;->getCheckRequestObj()Lcom/motorola/otalib/main/checkUpdate/CheckRequestObj;

    move-result-object p1

    invoke-virtual {p1}, Lcom/motorola/otalib/main/checkUpdate/CheckRequestObj;->getSourceVersion()J

    move-result-wide v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit p0

    return-wide v0

    :catchall_0
    move-exception p1

    monitor-exit p0

    throw p1
.end method

.method public declared-synchronized getPreviousTargetVersion(Ljava/lang/String;)J
    .locals 2

    monitor-enter p0

    :try_start_0
    iget-object v0, p0, Lcom/motorola/otalib/main/LibCussm;->_db:Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database;

    invoke-interface {v0, p1}, Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database;->getDescription(Ljava/lang/String;)Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database$Descriptor;

    move-result-object p1

    if-eqz p1, :cond_0

    invoke-interface {p1}, Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database$Descriptor;->getMeta()Lcom/motorola/otalib/common/metaData/MetaData;

    move-result-object v0

    if-eqz v0, :cond_0

    invoke-interface {p1}, Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database$Descriptor;->getMeta()Lcom/motorola/otalib/common/metaData/MetaData;

    move-result-object p1

    invoke-virtual {p1}, Lcom/motorola/otalib/common/metaData/MetaData;->getDisplayVersion()Ljava/lang/String;

    move-result-object p1

    invoke-static {p1}, Ljava/lang/Long;->parseLong(Ljava/lang/String;)J

    move-result-wide v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit p0

    return-wide v0

    :cond_0
    monitor-exit p0

    const-wide/16 p0, -0x1

    return-wide p0

    :catchall_0
    move-exception p1

    monitor-exit p0

    throw p1
.end method

.method public declared-synchronized handleStateWebResponse(Lcom/motorola/otalib/cdsservice/webdataobjects/WebResponse;ILandroid/content/Context;Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database;Lcom/motorola/otalib/main/Settings/LibSettings;Lcom/motorola/otalib/main/checkUpdate/CheckRequestObj;)Z
    .locals 8

    const-string v0, "CusSM.handleStateWebResponse: received http error "

    const-string v1, "Duplicate state response with id "

    monitor-enter p0

    :try_start_0
    invoke-interface {p4, p2}, Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database;->get_status(I)Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database$Status;

    move-result-object v2

    if-nez v2, :cond_0

    sget-object v2, Lcom/motorola/otalib/main/Logger;->OTALib_TAG:Ljava/lang/String;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v3, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v2, v1}, Lcom/motorola/otalib/main/Logger;->debug(Ljava/lang/String;Ljava/lang/String;)V

    :cond_0
    invoke-virtual {p6}, Lcom/motorola/otalib/main/checkUpdate/CheckRequestObj;->getPrimaryKey()Ljava/lang/String;

    move-result-object v1

    invoke-static {p5, v1}, Lcom/motorola/otalib/main/checkUpdate/UpdateSessionInfo;->getSessionDetails(Lcom/motorola/otalib/common/settings/Settings;Ljava/lang/String;)Lcom/motorola/otalib/main/checkUpdate/UpdateSessionInfo;

    move-result-object v7

    invoke-virtual {p1}, Lcom/motorola/otalib/cdsservice/webdataobjects/WebResponse;->getStatusCode()I

    move-result v1

    const/16 v2, 0xc8

    const/4 v3, 0x0

    if-eq v1, v2, :cond_3

    sget-object p2, Lcom/motorola/otalib/main/Logger;->OTALib_TAG:Ljava/lang/String;

    new-instance p6, Ljava/lang/StringBuilder;

    invoke-direct {p6, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p1}, Lcom/motorola/otalib/cdsservice/webdataobjects/WebResponse;->getStatusCode()I

    move-result v0

    invoke-virtual {p6, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object p6

    invoke-virtual {p6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p6

    invoke-static {p2, p6}, Lcom/motorola/otalib/main/Logger;->error(Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {p1}, Lcom/motorola/otalib/cdsservice/webdataobjects/WebResponse;->getStatusCode()I

    move-result p1

    if-eqz p1, :cond_1

    sget p1, Lcom/motorola/otalib/main/LibCussm$STATE_EVENT_STATUS;->IDLE:I

    sput p1, Lcom/motorola/otalib/main/LibCussm;->_isSendingUpgradeStatus:I

    goto :goto_0

    :cond_1
    sget p1, Lcom/motorola/otalib/main/LibCussm$STATE_EVENT_STATUS;->WAITING_FOR_NETWORK:I

    sput p1, Lcom/motorola/otalib/main/LibCussm;->_isSendingUpgradeStatus:I

    :goto_0
    invoke-interface {p4}, Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database;->get_status()Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database$Status;

    move-result-object p1

    invoke-interface {p1}, Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database$Status;->getDeviceVersion()Ljava/lang/String;

    move-result-object p1

    invoke-direct {p0, p1}, Lcom/motorola/otalib/main/LibCussm;->isServiceControlEnabled(Ljava/lang/String;)Z

    move-result p1

    if-eqz p1, :cond_2

    invoke-direct {p0}, Lcom/motorola/otalib/main/LibCussm;->stopTimer()V

    invoke-interface {p4}, Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database;->get_status()Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database$Status;

    move-result-object p1

    invoke-interface {p1}, Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database$Status;->getDeviceVersion()Ljava/lang/String;

    move-result-object p1

    const-string p2, "continue"

    invoke-virtual {v7, p5, p1, p2}, Lcom/motorola/otalib/main/checkUpdate/UpdateSessionInfo;->setServiceControlResponse(Lcom/motorola/otalib/common/settings/Settings;Ljava/lang/String;Ljava/lang/String;)Lcom/motorola/otalib/main/checkUpdate/UpdateSessionInfo;

    invoke-direct {p0, p3}, Lcom/motorola/otalib/main/LibCussm;->runStateMachine(Landroid/content/Context;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    :cond_2
    monitor-exit p0

    return v3

    :cond_3
    :try_start_1
    invoke-virtual {p1}, Lcom/motorola/otalib/cdsservice/webdataobjects/WebResponse;->getPayload()Lorg/json/JSONObject;

    move-result-object p1

    invoke-static {p1}, Lcom/motorola/otalib/cdsservice/responsedataobjects/builders/StateResponseBuilder;->from(Lorg/json/JSONObject;)Lcom/motorola/otalib/cdsservice/responsedataobjects/StateResponse;

    move-result-object v4

    if-nez v4, :cond_5

    sget-object p1, Lcom/motorola/otalib/main/Logger;->OTALib_TAG:Ljava/lang/String;

    const-string p2, "CusSM.handleStateWebResponse: failed to parse upgrade data"

    invoke-static {p1, p2}, Lcom/motorola/otalib/main/Logger;->error(Ljava/lang/String;Ljava/lang/String;)V

    sget p1, Lcom/motorola/otalib/main/LibCussm$STATE_EVENT_STATUS;->IDLE:I

    sput p1, Lcom/motorola/otalib/main/LibCussm;->_isSendingUpgradeStatus:I

    invoke-interface {p4}, Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database;->get_status()Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database$Status;

    move-result-object p1

    invoke-interface {p1}, Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database$Status;->getDeviceVersion()Ljava/lang/String;

    move-result-object p1

    invoke-direct {p0, p1}, Lcom/motorola/otalib/main/LibCussm;->isServiceControlEnabled(Ljava/lang/String;)Z

    move-result p1

    if-eqz p1, :cond_4

    invoke-direct {p0}, Lcom/motorola/otalib/main/LibCussm;->stopTimer()V

    invoke-interface {p4}, Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database;->get_status()Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database$Status;

    move-result-object p1

    invoke-interface {p1}, Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database$Status;->getDeviceVersion()Ljava/lang/String;

    move-result-object p1

    const-string p2, "continue"

    invoke-virtual {v7, p5, p1, p2}, Lcom/motorola/otalib/main/checkUpdate/UpdateSessionInfo;->setServiceControlResponse(Lcom/motorola/otalib/common/settings/Settings;Ljava/lang/String;Ljava/lang/String;)Lcom/motorola/otalib/main/checkUpdate/UpdateSessionInfo;

    invoke-direct {p0, p3}, Lcom/motorola/otalib/main/LibCussm;->runStateMachine(Landroid/content/Context;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    :cond_4
    monitor-exit p0

    return v3

    :cond_5
    move-object v2, p0

    move-object v3, p3

    move v5, p2

    move-object v6, p6

    :try_start_2
    invoke-direct/range {v2 .. v7}, Lcom/motorola/otalib/main/LibCussm;->handleStateResponse(Landroid/content/Context;Lcom/motorola/otalib/cdsservice/responsedataobjects/StateResponse;ILcom/motorola/otalib/main/checkUpdate/CheckRequestObj;Lcom/motorola/otalib/main/checkUpdate/UpdateSessionInfo;)V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    monitor-exit p0

    const/4 p0, 0x1

    return p0

    :catchall_0
    move-exception p1

    monitor-exit p0

    throw p1
.end method

.method public declared-synchronized isBusy(Ljava/lang/String;)Z
    .locals 2

    monitor-enter p0

    :try_start_0
    iget-object v0, p0, Lcom/motorola/otalib/main/LibCussm;->_db:Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database;

    invoke-interface {v0, p1}, Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database;->getDescription(Ljava/lang/String;)Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database$Descriptor;

    move-result-object p1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    const/4 v0, 0x0

    if-nez p1, :cond_0

    monitor-exit p0

    return v0

    :cond_0
    :try_start_1
    invoke-interface {p1}, Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database$Descriptor;->getState()Lcom/motorola/otalib/common/Environment/ApplicationEnv$PackageState;

    move-result-object p1

    sget-object v1, Lcom/motorola/otalib/common/Environment/ApplicationEnv$PackageState;->Result:Lcom/motorola/otalib/common/Environment/ApplicationEnv$PackageState;
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    if-eq p1, v1, :cond_1

    monitor-exit p0

    const/4 p0, 0x1

    return p0

    :cond_1
    monitor-exit p0

    return v0

    :catchall_0
    move-exception p1

    monitor-exit p0

    throw p1
.end method

.method public declared-synchronized onActionGetDescriptor(Landroid/content/Context;Ljava/lang/String;ZLjava/lang/String;)V
    .locals 2

    const-string p3, "CusSM.onActionGetDescriptor: notification for primary key is not in db "

    monitor-enter p0

    :try_start_0
    iget-object v0, p0, Lcom/motorola/otalib/main/LibCussm;->_db:Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database;

    invoke-interface {v0, p2}, Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database;->getDescription(Ljava/lang/String;)Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database$Descriptor;

    move-result-object v0

    if-nez v0, :cond_0

    sget-object p1, Lcom/motorola/otalib/main/Logger;->OTALib_TAG:Ljava/lang/String;

    new-instance p4, Ljava/lang/StringBuilder;

    invoke-direct {p4, p3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p4, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p2

    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    invoke-static {p1, p2}, Lcom/motorola/otalib/main/Logger;->error(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit p0

    return-void

    :cond_0
    :try_start_1
    invoke-interface {v0}, Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database$Descriptor;->getState()Lcom/motorola/otalib/common/Environment/ApplicationEnv$PackageState;

    move-result-object p3

    sget-object v1, Lcom/motorola/otalib/common/Environment/ApplicationEnv$PackageState;->GettingPackage:Lcom/motorola/otalib/common/Environment/ApplicationEnv$PackageState;

    if-eq p3, v1, :cond_1

    sget-object p1, Lcom/motorola/otalib/main/Logger;->OTALib_TAG:Ljava/lang/String;

    const-string p3, "CusSM.onActionGetDescriptor failed: notification for primary key %s that is in state %s (expected state GettingPackage)"

    invoke-interface {v0}, Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database$Descriptor;->getState()Lcom/motorola/otalib/common/Environment/ApplicationEnv$PackageState;

    move-result-object p4

    invoke-virtual {p4}, Lcom/motorola/otalib/common/Environment/ApplicationEnv$PackageState;->toString()Ljava/lang/String;

    move-result-object p4

    filled-new-array {p2, p4}, [Ljava/lang/Object;

    move-result-object p2

    invoke-static {p3, p2}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p2

    invoke-static {p1, p2}, Lcom/motorola/otalib/main/Logger;->error(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    monitor-exit p0

    return-void

    :cond_1
    :try_start_2
    iget-object p3, p0, Lcom/motorola/otalib/main/LibCussm;->_downloader:Lcom/motorola/otalib/common/Environment/DownloadHandler;

    if-eqz p3, :cond_2

    sget-object p3, Lcom/motorola/otalib/main/Logger;->OTALib_TAG:Ljava/lang/String;

    const-string v0, "CusSM.onActionGetDescriptor: reset download status flag"

    invoke-static {p3, v0}, Lcom/motorola/otalib/main/Logger;->debug(Ljava/lang/String;Ljava/lang/String;)V

    iget-object p3, p0, Lcom/motorola/otalib/main/LibCussm;->_downloader:Lcom/motorola/otalib/common/Environment/DownloadHandler;

    invoke-interface {p3}, Lcom/motorola/otalib/common/Environment/DownloadHandler;->close()V

    const/4 p3, 0x0

    iput-object p3, p0, Lcom/motorola/otalib/main/LibCussm;->_downloader:Lcom/motorola/otalib/common/Environment/DownloadHandler;

    :cond_2
    sget-object p3, Lcom/motorola/otalib/main/Logger;->OTALib_TAG:Ljava/lang/String;

    invoke-static {p3, p4}, Lcom/motorola/otalib/main/Logger;->info(Ljava/lang/String;Ljava/lang/String;)V

    iget-object p3, p0, Lcom/motorola/otalib/main/LibCussm;->_db:Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database;

    sget-object v0, Lcom/motorola/otalib/common/Environment/ApplicationEnv$PackageState;->GettingDescriptor:Lcom/motorola/otalib/common/Environment/ApplicationEnv$PackageState;

    invoke-interface {p3, p2, v0, p4}, Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database;->setState(Ljava/lang/String;Lcom/motorola/otalib/common/Environment/ApplicationEnv$PackageState;Ljava/lang/String;)Z

    invoke-direct {p0, p1}, Lcom/motorola/otalib/main/LibCussm;->runStateMachine(Landroid/content/Context;)V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    monitor-exit p0

    return-void

    :catchall_0
    move-exception p1

    monitor-exit p0

    throw p1
.end method

.method public declared-synchronized onDestroy()V
    .locals 2

    monitor-enter p0

    :try_start_0
    iget-object v0, p0, Lcom/motorola/otalib/main/LibCussm;->_downloader:Lcom/motorola/otalib/common/Environment/DownloadHandler;

    if-eqz v0, :cond_0

    invoke-interface {v0}, Lcom/motorola/otalib/common/Environment/DownloadHandler;->close()V

    const/4 v0, 0x0

    iput-object v0, p0, Lcom/motorola/otalib/main/LibCussm;->_downloader:Lcom/motorola/otalib/common/Environment/DownloadHandler;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    :cond_0
    :try_start_1
    iget-object v0, p0, Lcom/motorola/otalib/main/LibCussm;->mConnMgr:Landroid/net/ConnectivityManager;

    iget-object v1, p0, Lcom/motorola/otalib/main/LibCussm;->networkCallback:Landroid/net/ConnectivityManager$NetworkCallback;

    invoke-virtual {v0, v1}, Landroid/net/ConnectivityManager;->unregisterNetworkCallback(Landroid/net/ConnectivityManager$NetworkCallback;)V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    :catch_0
    monitor-exit p0

    return-void

    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized onInternalNotification(Landroid/content/Context;Ljava/lang/String;)V
    .locals 9

    const-string v0, "CusSM.onInternalNotification failed: notification for primaryKey "

    monitor-enter p0

    :try_start_0
    sget-object v1, Lcom/motorola/otalib/main/Logger;->OTALib_TAG:Ljava/lang/String;

    const-string v2, "CusSM.onInternalNotification: from lib"

    invoke-static {v1, v2}, Lcom/motorola/otalib/main/Logger;->debug(Ljava/lang/String;Ljava/lang/String;)V

    iget-object v1, p0, Lcom/motorola/otalib/main/LibCussm;->_db:Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database;

    invoke-interface {v1, p2}, Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database;->getDescription(Ljava/lang/String;)Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database$Descriptor;

    move-result-object v1

    iget-object v2, p0, Lcom/motorola/otalib/main/LibCussm;->_downloader:Lcom/motorola/otalib/common/Environment/DownloadHandler;

    if-eqz v2, :cond_0

    invoke-interface {v2}, Lcom/motorola/otalib/common/Environment/DownloadHandler;->close()V

    const/4 v2, 0x0

    iput-object v2, p0, Lcom/motorola/otalib/main/LibCussm;->_downloader:Lcom/motorola/otalib/common/Environment/DownloadHandler;

    :cond_0
    if-nez v1, :cond_1

    sget-object p1, Lcom/motorola/otalib/main/Logger;->OTALib_TAG:Ljava/lang/String;

    const-string p2, "CusSM.onInternalNotification: primaryKey is not in db"

    invoke-static {p1, p2}, Lcom/motorola/otalib/main/Logger;->debug(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit p0

    return-void

    :cond_1
    :try_start_1
    invoke-interface {v1}, Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database$Descriptor;->getState()Lcom/motorola/otalib/common/Environment/ApplicationEnv$PackageState;

    move-result-object v2

    sget-object v3, Lcom/motorola/otalib/common/Environment/ApplicationEnv$PackageState;->GettingPackage:Lcom/motorola/otalib/common/Environment/ApplicationEnv$PackageState;

    if-eq v2, v3, :cond_2

    sget-object p1, Lcom/motorola/otalib/main/Logger;->OTALib_TAG:Ljava/lang/String;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v2, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p2

    const-string v0, " that is in state "

    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p2

    invoke-interface {v1}, Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database$Descriptor;->getState()Lcom/motorola/otalib/common/Environment/ApplicationEnv$PackageState;

    move-result-object v0

    invoke-virtual {v0}, Lcom/motorola/otalib/common/Environment/ApplicationEnv$PackageState;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p2

    const-string v0, " (expected state GettingPackage)"

    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p2

    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    invoke-static {p1, p2}, Lcom/motorola/otalib/main/Logger;->error(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    monitor-exit p0

    return-void

    :cond_2
    :try_start_2
    iget-object v0, p0, Lcom/motorola/otalib/main/LibCussm;->mSettings:Lcom/motorola/otalib/main/Settings/LibSettings;

    invoke-interface {v1}, Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database$Descriptor;->getVersion()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/motorola/otalib/main/checkUpdate/UpdateSessionInfo;->getSessionDetails(Lcom/motorola/otalib/common/settings/Settings;Ljava/lang/String;)Lcom/motorola/otalib/main/checkUpdate/UpdateSessionInfo;

    move-result-object v0

    invoke-virtual {v0}, Lcom/motorola/otalib/main/checkUpdate/UpdateSessionInfo;->getCheckRequestObj()Lcom/motorola/otalib/main/checkUpdate/CheckRequestObj;

    move-result-object v1

    if-eqz v1, :cond_3

    invoke-virtual {v1}, Lcom/motorola/otalib/main/checkUpdate/CheckRequestObj;->isForceInstall()Z

    move-result v1

    if-eqz v1, :cond_3

    iget-object v2, p0, Lcom/motorola/otalib/main/LibCussm;->_db:Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database;

    sget-object v4, Lcom/motorola/otalib/common/Environment/ApplicationEnv$PackageState;->ABApplyingPatch:Lcom/motorola/otalib/common/Environment/ApplicationEnv$PackageState;

    const-string v6, ""

    const-string v7, ""

    invoke-virtual {v0}, Lcom/motorola/otalib/main/checkUpdate/UpdateSessionInfo;->toString()Ljava/lang/String;

    move-result-object v8

    const/4 v5, 0x1

    move-object v3, p2

    invoke-interface/range {v2 .. v8}, Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database;->setState(Ljava/lang/String;Lcom/motorola/otalib/common/Environment/ApplicationEnv$PackageState;ZLjava/lang/String;Ljava/lang/String;Ljava/lang/String;)Z

    goto :goto_0

    :cond_3
    iget-object v1, p0, Lcom/motorola/otalib/main/LibCussm;->_db:Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database;

    sget-object v2, Lcom/motorola/otalib/common/Environment/ApplicationEnv$PackageState;->Querying:Lcom/motorola/otalib/common/Environment/ApplicationEnv$PackageState;

    const-string v4, ""

    const-string v5, ""

    invoke-virtual {v0}, Lcom/motorola/otalib/main/checkUpdate/UpdateSessionInfo;->toString()Ljava/lang/String;

    move-result-object v6

    const/4 v3, 0x1

    move-object v0, v1

    move-object v1, p2

    invoke-interface/range {v0 .. v6}, Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database;->setState(Ljava/lang/String;Lcom/motorola/otalib/common/Environment/ApplicationEnv$PackageState;ZLjava/lang/String;Ljava/lang/String;Ljava/lang/String;)Z

    :goto_0
    invoke-direct {p0, p1}, Lcom/motorola/otalib/main/LibCussm;->runStateMachine(Landroid/content/Context;)V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    monitor-exit p0

    return-void

    :catchall_0
    move-exception p1

    monitor-exit p0

    throw p1
.end method

.method public declared-synchronized onStart(Landroid/content/Context;Lcom/motorola/otalib/aidl/IOtaLibServiceCallBack;)V
    .locals 0

    monitor-enter p0

    :try_start_0
    iput-object p2, p0, Lcom/motorola/otalib/main/LibCussm;->mClientCallBack:Lcom/motorola/otalib/aidl/IOtaLibServiceCallBack;

    invoke-direct {p0}, Lcom/motorola/otalib/main/LibCussm;->cleanUpOldEntry()V

    invoke-direct {p0, p1}, Lcom/motorola/otalib/main/LibCussm;->registerConnectivityNetwork(Landroid/content/Context;)V

    invoke-static {p1}, Lcom/motorola/otalib/main/PublicUtilityMethods;->createOtaDirectory(Landroid/content/Context;)V

    invoke-direct {p0, p1}, Lcom/motorola/otalib/main/LibCussm;->runStateMachine(Landroid/content/Context;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit p0

    return-void

    :catchall_0
    move-exception p1

    monitor-exit p0

    throw p1
.end method

.method public pleaseRunStateMachine(Landroid/content/Context;)V
    .locals 0

    invoke-direct {p0, p1}, Lcom/motorola/otalib/main/LibCussm;->runStateMachine(Landroid/content/Context;)V

    return-void
.end method

.method public declared-synchronized sendUpgradeStatus(Lcom/motorola/otalib/main/Settings/LibSettings;Landroid/content/Context;Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database;)V
    .locals 37

    move-object/from16 v8, p0

    move-object/from16 v0, p1

    move-object/from16 v9, p2

    const-string v7, "State request "

    const-string v1, "CusSM.sendUpgradeStatus: id "

    const-string v2, "CusSM.sendUpgradeStatus: "

    monitor-enter p0

    :try_start_0
    sget v3, Lcom/motorola/otalib/main/LibCussm;->_isSendingUpgradeStatus:I

    sget v4, Lcom/motorola/otalib/main/LibCussm$STATE_EVENT_STATUS;->IDLE:I

    if-eq v3, v4, :cond_0

    sget-object v0, Lcom/motorola/otalib/main/Logger;->OTALib_TAG:Ljava/lang/String;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    sget v2, Lcom/motorola/otalib/main/LibCussm;->_isSendingUpgradeStatus:I

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/motorola/otalib/main/Logger;->debug(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit p0

    return-void

    :cond_0
    :try_start_1
    invoke-interface/range {p3 .. p3}, Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database;->get_status()Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database$Status;

    move-result-object v10

    if-nez v10, :cond_1

    invoke-direct/range {p0 .. p0}, Lcom/motorola/otalib/main/LibCussm;->stopTimer()V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    monitor-exit p0

    return-void

    :cond_1
    :try_start_2
    invoke-interface {v10}, Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database$Status;->getDeviceVersion()Ljava/lang/String;

    move-result-object v2

    invoke-static {v0, v2}, Lcom/motorola/otalib/main/checkUpdate/UpdateSessionInfo;->getSessionDetails(Lcom/motorola/otalib/common/settings/Settings;Ljava/lang/String;)Lcom/motorola/otalib/main/checkUpdate/UpdateSessionInfo;

    move-result-object v2

    sget-object v3, Lcom/motorola/otalib/common/Environment/ApplicationEnv$PackageState;->Querying:Lcom/motorola/otalib/common/Environment/ApplicationEnv$PackageState;

    invoke-virtual {v3}, Lcom/motorola/otalib/common/Environment/ApplicationEnv$PackageState;->name()Ljava/lang/String;

    move-result-object v3

    invoke-interface {v10}, Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database$Status;->getState()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_2

    sget-object v3, Lcom/motorola/otalib/common/Environment/ApplicationEnv$PackageState;->ABApplyingPatch:Lcom/motorola/otalib/common/Environment/ApplicationEnv$PackageState;

    invoke-virtual {v3}, Lcom/motorola/otalib/common/Environment/ApplicationEnv$PackageState;->name()Ljava/lang/String;

    move-result-object v3

    invoke-interface {v10}, Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database$Status;->getState()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_2

    sget-object v3, Lcom/motorola/otalib/common/Environment/ApplicationEnv$PackageState;->Upgrading:Lcom/motorola/otalib/common/Environment/ApplicationEnv$PackageState;

    invoke-virtual {v3}, Lcom/motorola/otalib/common/Environment/ApplicationEnv$PackageState;->name()Ljava/lang/String;

    move-result-object v3

    invoke-interface {v10}, Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database$Status;->getState()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_2

    sget-object v3, Lcom/motorola/otalib/common/Environment/ApplicationEnv$PackageState;->Result:Lcom/motorola/otalib/common/Environment/ApplicationEnv$PackageState;

    invoke-virtual {v3}, Lcom/motorola/otalib/common/Environment/ApplicationEnv$PackageState;->name()Ljava/lang/String;

    move-result-object v3

    invoke-interface {v10}, Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database$Status;->getState()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_3

    :cond_2
    invoke-interface {v10}, Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database$Status;->getRepository()Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Lcom/motorola/otalib/main/checkUpdate/UpdateSessionInfo;->fromJsonString(Ljava/lang/String;)Lcom/motorola/otalib/main/checkUpdate/UpdateSessionInfo;

    move-result-object v2

    :cond_3
    if-eqz v2, :cond_9

    invoke-virtual {v2}, Lcom/motorola/otalib/main/checkUpdate/UpdateSessionInfo;->getCheckRequestObj()Lcom/motorola/otalib/main/checkUpdate/CheckRequestObj;

    move-result-object v3

    if-nez v3, :cond_4

    goto/16 :goto_2

    :cond_4
    invoke-virtual {v2}, Lcom/motorola/otalib/main/checkUpdate/UpdateSessionInfo;->getCheckRequestObj()Lcom/motorola/otalib/main/checkUpdate/CheckRequestObj;

    move-result-object v11

    sget v1, Lcom/motorola/otalib/main/LibCussm$STATE_EVENT_STATUS;->SENDING:I

    sput v1, Lcom/motorola/otalib/main/LibCussm;->_isSendingUpgradeStatus:I

    invoke-interface {v10}, Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database$Status;->getDeviceVersion()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v8, v1}, Lcom/motorola/otalib/main/LibCussm;->isServiceControlEnabled(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_5

    const-string v1, "Result"

    invoke-interface {v10}, Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database$Status;->getState()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v1, v3}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v1

    if-nez v1, :cond_5

    invoke-interface {v10}, Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database$Status;->getDeviceVersion()Ljava/lang/String;

    move-result-object v1

    const-string v3, "wait"

    invoke-virtual {v2, v0, v1, v3}, Lcom/motorola/otalib/main/checkUpdate/UpdateSessionInfo;->setServiceControlResponse(Lcom/motorola/otalib/common/settings/Settings;Ljava/lang/String;Ljava/lang/String;)Lcom/motorola/otalib/main/checkUpdate/UpdateSessionInfo;

    move-result-object v2

    invoke-interface {v10}, Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database$Status;->getDeviceVersion()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v8, v1, v9}, Lcom/motorola/otalib/main/LibCussm;->startTimer(Ljava/lang/String;Landroid/content/Context;)I

    :cond_5
    invoke-interface {v10}, Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database$Status;->getStatus()Ljava/lang/String;

    move-result-object v1

    const-string v3, "RS_OK"

    invoke-virtual {v1, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_6

    const-string v1, "DONE"

    :goto_0
    move-object v12, v1

    goto :goto_1

    :cond_6
    invoke-interface {v10}, Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database$Status;->getStatus()Ljava/lang/String;

    move-result-object v1

    const-string v3, "RS_FAIL"

    invoke-virtual {v1, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_7

    const-string v1, "FAILED"

    goto :goto_0

    :cond_7
    invoke-interface {v10}, Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database$Status;->getStatus()Ljava/lang/String;

    move-result-object v1

    const-string v3, "RS_TEMP_OK"

    invoke-virtual {v1, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_8

    const-string v1, "PROCESSING"

    goto :goto_0

    :cond_8
    const-string v1, "IGNORED"

    goto :goto_0

    :goto_1
    new-instance v1, Ljava/util/HashMap;

    invoke-direct {v1}, Ljava/util/HashMap;-><init>()V

    const-string v3, "appId"

    sget-object v4, Lcom/motorola/otalib/main/Settings/LibConfigs;->APPIID:Lcom/motorola/otalib/main/Settings/LibConfigs;

    invoke-virtual {v0, v4}, Lcom/motorola/otalib/main/Settings/LibSettings;->getString(Lcom/motorola/otalib/common/settings/ISetting;)Ljava/lang/String;

    move-result-object v4

    invoke-interface {v1, v3, v4}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    new-instance v22, Lcom/motorola/otalib/cdsservice/requestdataobjects/UrlRequest;

    invoke-static {v11}, Lcom/motorola/otalib/main/checkUpdate/CheckUpdateHandler;->getMasterCloud(Lcom/motorola/otalib/main/checkUpdate/CheckRequestObj;)Ljava/lang/String;

    move-result-object v14

    sget-object v1, Lcom/motorola/otalib/main/Settings/LibConfigs;->UPGRADE_STATE_URL:Lcom/motorola/otalib/main/Settings/LibConfigs;

    invoke-virtual {v0, v1}, Lcom/motorola/otalib/main/Settings/LibSettings;->getString(Lcom/motorola/otalib/common/settings/ISetting;)Ljava/lang/String;

    move-result-object v15

    sget-object v1, Lcom/motorola/otalib/main/Settings/LibConfigs;->OTA_CONTEXT:Lcom/motorola/otalib/main/Settings/LibConfigs;

    invoke-virtual {v0, v1}, Lcom/motorola/otalib/main/Settings/LibSettings;->getString(Lcom/motorola/otalib/common/settings/ISetting;)Ljava/lang/String;

    move-result-object v16

    invoke-interface/range {p3 .. p3}, Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database;->get_status()Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database$Status;

    move-result-object v1

    invoke-interface {v1}, Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database$Status;->getSourceSha1()Ljava/lang/String;

    move-result-object v17

    invoke-interface/range {p3 .. p3}, Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database;->get_status()Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database$Status;

    move-result-object v1

    invoke-interface {v1}, Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database$Status;->getState()Ljava/lang/String;

    move-result-object v18

    invoke-interface {v10}, Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database$Status;->getTrackingID()Ljava/lang/String;

    move-result-object v19

    sget-object v1, Lcom/motorola/otalib/main/Settings/LibConfigs;->UPGRADE_STATE_HTTP_SECURE:Lcom/motorola/otalib/main/Settings/LibConfigs;

    invoke-virtual {v0, v1}, Lcom/motorola/otalib/main/Settings/LibSettings;->getString(Lcom/motorola/otalib/common/settings/ISetting;)Ljava/lang/String;

    move-result-object v20

    sget-object v1, Lcom/motorola/otalib/main/Settings/LibConfigs;->UPGRADE_STATE_TEST_URL:Lcom/motorola/otalib/main/Settings/LibConfigs;

    invoke-virtual {v0, v1}, Lcom/motorola/otalib/main/Settings/LibSettings;->getString(Lcom/motorola/otalib/common/settings/ISetting;)Ljava/lang/String;

    move-result-object v21

    move-object/from16 v13, v22

    invoke-direct/range {v13 .. v21}, Lcom/motorola/otalib/cdsservice/requestdataobjects/UrlRequest;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    new-instance v13, Lcom/motorola/otalib/cdsservice/requestdataobjects/StateRequest;

    invoke-virtual {v11}, Lcom/motorola/otalib/main/checkUpdate/CheckRequestObj;->getAccsSerialNumber()Ljava/lang/String;

    move-result-object v24

    invoke-virtual {v2}, Lcom/motorola/otalib/main/checkUpdate/UpdateSessionInfo;->getContentTimeSTamp()J

    move-result-wide v25

    invoke-static {v11}, Lcom/motorola/otalib/main/checkUpdate/CheckUpdateHandler;->getDeviceInfoAsJsonObject(Lcom/motorola/otalib/main/checkUpdate/CheckRequestObj;)Lorg/json/JSONObject;

    move-result-object v27

    const-string v2, ""

    invoke-static/range {p2 .. p2}, Lcom/motorola/otalib/common/utils/BuildPropertyUtils;->getApkVersion(Landroid/content/Context;)I

    move-result v3

    sget-object v1, Lcom/motorola/otalib/main/Settings/LibConfigs;->PROVISION_TIME:Lcom/motorola/otalib/main/Settings/LibConfigs;

    invoke-virtual {v0, v1}, Lcom/motorola/otalib/main/Settings/LibSettings;->getString(Lcom/motorola/otalib/common/settings/ISetting;)Ljava/lang/String;

    move-result-object v4

    invoke-virtual/range {p2 .. p2}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v5

    move-object/from16 v1, p2

    move-object v6, v11

    invoke-static/range {v1 .. v6}, Lcom/motorola/otalib/main/checkUpdate/CheckUpdateHandler;->getExtraInfoAsJsonObject(Landroid/content/Context;Ljava/lang/String;ILjava/lang/String;Ljava/lang/String;Lcom/motorola/otalib/main/checkUpdate/CheckRequestObj;)Lorg/json/JSONObject;

    move-result-object v28

    invoke-virtual {v11}, Lcom/motorola/otalib/main/checkUpdate/CheckRequestObj;->getAccsSerialNumber()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Lcom/motorola/otalib/main/checkUpdate/CheckUpdateHandler;->getIdentityInfoAsJsonObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v29

    invoke-interface/range {p3 .. p3}, Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database;->get_status()Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database$Status;

    move-result-object v1

    invoke-interface {v1}, Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database$Status;->getInfo()Ljava/lang/String;

    move-result-object v30

    const-string v32, "serialNumber"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, ":"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-interface/range {p3 .. p3}, Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database;->get_status()Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database$Status;

    move-result-object v2

    invoke-interface {v2}, Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database$Status;->getInfo()Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Lcom/motorola/otalib/common/errorCodes/ErrorCodeMapper;->getStatus(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v33

    invoke-interface {v10}, Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database$Status;->getReportingTag()Ljava/lang/String;

    move-result-object v34

    invoke-virtual {v11}, Lcom/motorola/otalib/main/checkUpdate/CheckRequestObj;->getTriggeredBy()Lcom/motorola/otalib/main/PublicUtilityMethods$TRIGGER_BY;

    move-result-object v1

    invoke-static {v1}, Lcom/motorola/otalib/main/checkUpdate/CheckUpdateHandler;->getUpgradeSource(Lcom/motorola/otalib/main/PublicUtilityMethods$TRIGGER_BY;)Ljava/lang/String;

    move-result-object v35

    const/16 v36, 0x0

    const/16 v31, 0x0

    move-object/from16 v23, v13

    invoke-direct/range {v23 .. v36}, Lcom/motorola/otalib/cdsservice/requestdataobjects/StateRequest;-><init>(Ljava/lang/String;JLorg/json/JSONObject;Lorg/json/JSONObject;Lorg/json/JSONObject;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lorg/json/JSONObject;)V

    new-instance v12, Lcom/motorola/otalib/cdsservice/webdataobjects/WebRequest;

    invoke-static/range {v22 .. v22}, Lcom/motorola/otalib/cdsservice/UrlConstructor/StateUrlConstructor;->constructUrl(Lcom/motorola/otalib/cdsservice/requestdataobjects/UrlRequest;)Ljava/lang/String;

    move-result-object v15

    sget-object v1, Lcom/motorola/otalib/main/Settings/LibConfigs;->UPGRADE_STATE_HTTP_RETRIES:Lcom/motorola/otalib/main/Settings/LibConfigs;

    const/16 v2, 0x9

    invoke-virtual {v0, v1, v2}, Lcom/motorola/otalib/main/Settings/LibSettings;->getInt(Lcom/motorola/otalib/common/settings/ISetting;I)I

    move-result v16

    sget-object v1, Lcom/motorola/otalib/main/Settings/LibConfigs;->UPGRADE_STATE_HTTP_METHOD:Lcom/motorola/otalib/main/Settings/LibConfigs;

    invoke-virtual {v0, v1}, Lcom/motorola/otalib/main/Settings/LibSettings;->getString(Lcom/motorola/otalib/common/settings/ISetting;)Ljava/lang/String;

    move-result-object v17

    new-instance v1, Lcom/motorola/otalib/cdsservice/webdataobjects/WebRequestPayload;

    sget-object v2, Lcom/motorola/otalib/cdsservice/webdataobjects/WebRequestPayloadType;->string:Lcom/motorola/otalib/cdsservice/webdataobjects/WebRequestPayloadType;

    invoke-static {v13}, Lcom/motorola/otalib/cdsservice/requestdataobjects/builders/StateRequestBuilder;->toJSONString(Lcom/motorola/otalib/cdsservice/requestdataobjects/StateRequest;)Ljava/lang/String;

    move-result-object v3

    invoke-direct {v1, v2, v3}, Lcom/motorola/otalib/cdsservice/webdataobjects/WebRequestPayload;-><init>(Lcom/motorola/otalib/cdsservice/webdataobjects/WebRequestPayloadType;Ljava/lang/String;)V

    sget-object v2, Lcom/motorola/otalib/main/Settings/LibConfigs;->CDS_HTTP_PROXY_HOST:Lcom/motorola/otalib/main/Settings/LibConfigs;

    invoke-virtual {v0, v2}, Lcom/motorola/otalib/main/Settings/LibSettings;->getString(Lcom/motorola/otalib/common/settings/ISetting;)Ljava/lang/String;

    move-result-object v20

    sget-object v2, Lcom/motorola/otalib/main/Settings/LibConfigs;->CDS_HTTP_PROXY_PORT:Lcom/motorola/otalib/main/Settings/LibConfigs;

    const/4 v3, -0x1

    invoke-virtual {v0, v2, v3}, Lcom/motorola/otalib/main/Settings/LibSettings;->getInt(Lcom/motorola/otalib/common/settings/ISetting;I)I

    move-result v21

    const/16 v18, 0x0

    move-object v14, v12

    move-object/from16 v19, v1

    invoke-direct/range {v14 .. v21}, Lcom/motorola/otalib/cdsservice/webdataobjects/WebRequest;-><init>(Ljava/lang/String;ILjava/lang/String;Ljava/util/Map;Lcom/motorola/otalib/cdsservice/webdataobjects/WebRequestPayload;Ljava/lang/String;I)V

    sget-object v1, Lcom/motorola/otalib/main/Logger;->OTALib_TAG:Ljava/lang/String;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2, v7}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v12}, Lcom/motorola/otalib/cdsservice/webdataobjects/WebRequest;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Lcom/motorola/otalib/main/Logger;->debug(Ljava/lang/String;Ljava/lang/String;)V

    new-instance v13, Lcom/motorola/otalib/main/LibCussm$2;

    move-object v1, v13

    move-object/from16 v2, p0

    move-object v3, v10

    move-object/from16 v4, p2

    move-object/from16 v5, p3

    move-object/from16 v6, p1

    move-object v7, v11

    invoke-direct/range {v1 .. v7}, Lcom/motorola/otalib/main/LibCussm$2;-><init>(Lcom/motorola/otalib/main/LibCussm;Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database$Status;Landroid/content/Context;Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database;Lcom/motorola/otalib/main/Settings/LibSettings;Lcom/motorola/otalib/main/checkUpdate/CheckRequestObj;)V

    new-instance v0, Lcom/motorola/otalib/cdsservice/WebServiceRetryHandler;

    invoke-direct {v0}, Lcom/motorola/otalib/cdsservice/WebServiceRetryHandler;-><init>()V

    const/4 v1, 0x0

    invoke-static {v9, v12, v13, v0, v1}, Lcom/motorola/otalib/cdsservice/WebService;->call(Landroid/content/Context;Lcom/motorola/otalib/cdsservice/webdataobjects/WebRequest;Lcom/motorola/otalib/cdsservice/ResponseHandler;Lcom/motorola/otalib/cdsservice/RetryHandler;Ljava/lang/Class;)V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    monitor-exit p0

    return-void

    :cond_9
    :goto_2
    :try_start_3
    sget-object v0, Lcom/motorola/otalib/main/Logger;->OTALib_TAG:Ljava/lang/String;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-interface {v10}, Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database$Status;->getId()I

    move-result v1

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-interface {v10}, Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database$Status;->getState()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-interface {v10}, Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database$Status;->getRepository()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/motorola/otalib/main/Logger;->debug(Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v10}, Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database$Status;->getId()I

    move-result v0

    move-object/from16 v1, p3

    invoke-interface {v1, v0}, Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database;->remove_status(I)V
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    monitor-exit p0

    return-void

    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method
