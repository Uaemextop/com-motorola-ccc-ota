.class final Lcom/motorola/otalib/main/OtaLibService$OtaLibBinder;
.super Lcom/motorola/otalib/aidl/IOtaLibService$Stub;
.source "OtaLibService.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/motorola/otalib/main/OtaLibService;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1a
    name = "OtaLibBinder"
.end annotation


# instance fields
.field private mService:Lcom/motorola/otalib/main/OtaLibService;


# direct methods
.method constructor <init>(Lcom/motorola/otalib/main/OtaLibService;)V
    .locals 0

    invoke-direct {p0}, Lcom/motorola/otalib/aidl/IOtaLibService$Stub;-><init>()V

    iput-object p1, p0, Lcom/motorola/otalib/main/OtaLibService$OtaLibBinder;->mService:Lcom/motorola/otalib/main/OtaLibService;

    return-void
.end method


# virtual methods
.method public declared-synchronized checkForUpdate(Ljava/lang/String;)V
    .locals 17

    move-object/from16 v1, p0

    move-object/from16 v0, p1

    const-string v2, "Target version "

    const-string v3, "Previous update was stuck in "

    const-string v4, "Update is in progress "

    const-string v5, "Previous update was stuck in "

    const-string v6, "Invalid check request "

    monitor-enter p0

    :try_start_0
    invoke-static {}, Lcom/motorola/otalib/main/OtaLibService;->access$100()Lcom/motorola/otalib/main/LibCussm;

    move-result-object v7

    if-eqz v7, :cond_8

    invoke-static/range {p1 .. p1}, Lcom/motorola/otalib/main/checkUpdate/CheckRequestObj;->fromJsonString(Ljava/lang/String;)Lcom/motorola/otalib/main/checkUpdate/CheckRequestObj;

    move-result-object v7
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    const/4 v8, 0x0

    :try_start_1
    const-string v9, ""

    const-string v10, ""

    if-eqz v7, :cond_0

    invoke-virtual {v7}, Lcom/motorola/otalib/main/checkUpdate/CheckRequestObj;->getContextKey()Ljava/lang/String;

    move-result-object v10

    invoke-virtual {v7}, Lcom/motorola/otalib/main/checkUpdate/CheckRequestObj;->getPrimaryKey()Ljava/lang/String;

    move-result-object v9

    :cond_0
    move-object v13, v9

    if-eqz v7, :cond_1

    invoke-virtual {v7}, Lcom/motorola/otalib/main/checkUpdate/CheckRequestObj;->isValidRequest()Z

    move-result v9

    if-nez v9, :cond_3

    :cond_1
    new-instance v9, Lcom/motorola/otalib/main/InstallStatusInfo;

    iget-object v12, v1, Lcom/motorola/otalib/main/OtaLibService$OtaLibBinder;->mService:Lcom/motorola/otalib/main/OtaLibService;

    invoke-static {}, Lcom/motorola/otalib/main/OtaLibService;->access$200()Lcom/motorola/otalib/main/Settings/LibSettings;

    move-result-object v14

    sget v16, Lcom/motorola/otalib/main/PublicUtilityMethods;->ERROR_INVALID_REQUEST:I

    const/4 v15, 0x0

    move-object v11, v9

    invoke-direct/range {v11 .. v16}, Lcom/motorola/otalib/main/InstallStatusInfo;-><init>(Landroid/content/Context;Ljava/lang/String;Lcom/motorola/otalib/common/settings/Settings;Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database$Descriptor;I)V

    new-instance v11, Ljava/lang/StringBuilder;

    invoke-direct {v11, v6}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v11, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v9, v6}, Lcom/motorola/otalib/main/InstallStatusInfo;->setStatusMessage(Ljava/lang/String;)V

    invoke-static {}, Lcom/motorola/otalib/main/OtaLibService;->access$000()Lcom/motorola/otalib/aidl/IOtaLibServiceCallBack;

    move-result-object v6
    :try_end_1
    .catch Landroid/os/RemoteException; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    if-nez v6, :cond_2

    monitor-exit p0

    return-void

    :cond_2
    :try_start_2
    invoke-static {}, Lcom/motorola/otalib/main/OtaLibService;->access$000()Lcom/motorola/otalib/aidl/IOtaLibServiceCallBack;

    move-result-object v6

    invoke-virtual {v9}, Lcom/motorola/otalib/main/InstallStatusInfo;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-interface {v6, v10, v8, v9}, Lcom/motorola/otalib/aidl/IOtaLibServiceCallBack;->onStatusUpdate(Ljava/lang/String;ZLjava/lang/String;)V
    :try_end_2
    .catch Landroid/os/RemoteException; {:try_start_2 .. :try_end_2} :catch_0
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    monitor-exit p0

    return-void

    :catch_0
    :cond_3
    :try_start_3
    invoke-static {}, Lcom/motorola/otalib/main/OtaLibService;->access$200()Lcom/motorola/otalib/main/Settings/LibSettings;

    move-result-object v6

    invoke-virtual {v7}, Lcom/motorola/otalib/main/checkUpdate/CheckRequestObj;->getPrimaryKey()Ljava/lang/String;

    move-result-object v9

    invoke-static {v6, v9}, Lcom/motorola/otalib/main/checkUpdate/UpdateSessionInfo;->getSessionDetails(Lcom/motorola/otalib/common/settings/Settings;Ljava/lang/String;)Lcom/motorola/otalib/main/checkUpdate/UpdateSessionInfo;

    move-result-object v6

    invoke-static {}, Lcom/motorola/otalib/main/OtaLibService;->access$100()Lcom/motorola/otalib/main/LibCussm;

    move-result-object v9

    invoke-virtual {v7}, Lcom/motorola/otalib/main/checkUpdate/CheckRequestObj;->getPrimaryKey()Ljava/lang/String;

    move-result-object v10

    invoke-virtual {v9, v10}, Lcom/motorola/otalib/main/LibCussm;->getCurrentState(Ljava/lang/String;)Lcom/motorola/otalib/common/Environment/ApplicationEnv$PackageState;

    invoke-static {}, Lcom/motorola/otalib/main/OtaLibService;->access$200()Lcom/motorola/otalib/main/Settings/LibSettings;

    move-result-object v9

    invoke-virtual {v7}, Lcom/motorola/otalib/main/checkUpdate/CheckRequestObj;->getPrimaryKey()Ljava/lang/String;

    move-result-object v10

    invoke-static {v9, v10}, Lcom/motorola/otalib/main/checkUpdate/UpdateSessionInfo;->isUpdateGoingOn(Lcom/motorola/otalib/common/settings/Settings;Ljava/lang/String;)Z

    move-result v9

    if-nez v9, :cond_4

    invoke-static {}, Lcom/motorola/otalib/main/OtaLibService;->access$200()Lcom/motorola/otalib/main/Settings/LibSettings;

    move-result-object v2

    invoke-virtual {v6, v0, v2}, Lcom/motorola/otalib/main/checkUpdate/UpdateSessionInfo;->setCheckRequestObj(Ljava/lang/String;Lcom/motorola/otalib/common/settings/Settings;)Lcom/motorola/otalib/main/checkUpdate/CheckRequestObj;

    invoke-static {}, Lcom/motorola/otalib/main/OtaLibService;->access$100()Lcom/motorola/otalib/main/LibCussm;

    move-result-object v0

    iget-object v2, v1, Lcom/motorola/otalib/main/OtaLibService$OtaLibBinder;->mService:Lcom/motorola/otalib/main/OtaLibService;

    invoke-virtual {v0, v7, v2}, Lcom/motorola/otalib/main/LibCussm;->checkForUpdate(Lcom/motorola/otalib/main/checkUpdate/CheckRequestObj;Landroid/content/Context;)V

    goto/16 :goto_0

    :cond_4
    invoke-static {}, Lcom/motorola/otalib/main/OtaLibService;->access$100()Lcom/motorola/otalib/main/LibCussm;

    move-result-object v9

    invoke-virtual {v7}, Lcom/motorola/otalib/main/checkUpdate/CheckRequestObj;->getPrimaryKey()Ljava/lang/String;

    move-result-object v10

    invoke-virtual {v9, v10}, Lcom/motorola/otalib/main/LibCussm;->isBusy(Ljava/lang/String;)Z

    move-result v9

    if-eqz v9, :cond_7

    invoke-static {}, Lcom/motorola/otalib/main/OtaLibService;->access$100()Lcom/motorola/otalib/main/LibCussm;

    move-result-object v9

    invoke-virtual {v7}, Lcom/motorola/otalib/main/checkUpdate/CheckRequestObj;->getPrimaryKey()Ljava/lang/String;

    move-result-object v10

    invoke-virtual {v9, v10}, Lcom/motorola/otalib/main/LibCussm;->getPreviousTargetVersion(Ljava/lang/String;)J

    move-result-wide v9

    invoke-static {}, Lcom/motorola/otalib/main/OtaLibService;->access$100()Lcom/motorola/otalib/main/LibCussm;

    move-result-object v11

    invoke-virtual {v7}, Lcom/motorola/otalib/main/checkUpdate/CheckRequestObj;->getPrimaryKey()Ljava/lang/String;

    move-result-object v12

    invoke-virtual {v11, v12}, Lcom/motorola/otalib/main/LibCussm;->getPreviousSourceVersion(Ljava/lang/String;)J

    move-result-wide v11

    new-instance v13, Lcom/motorola/otalib/main/InstallStatusInfo;

    invoke-direct {v13}, Lcom/motorola/otalib/main/InstallStatusInfo;-><init>()V

    invoke-virtual {v7}, Lcom/motorola/otalib/main/checkUpdate/CheckRequestObj;->getSourceVersion()J

    move-result-wide v14

    invoke-virtual {v13, v14, v15}, Lcom/motorola/otalib/main/InstallStatusInfo;->setSourceVersion(J)V

    invoke-virtual {v7}, Lcom/motorola/otalib/main/checkUpdate/CheckRequestObj;->getAccsSerialNumber()Ljava/lang/String;

    move-result-object v14

    invoke-virtual {v13, v14}, Lcom/motorola/otalib/main/InstallStatusInfo;->setAccSerialNumber(Ljava/lang/String;)V

    sget-object v14, Lcom/motorola/otalib/main/PublicUtilityMethods$OtaState;->Result:Lcom/motorola/otalib/main/PublicUtilityMethods$OtaState;

    invoke-virtual {v13, v14}, Lcom/motorola/otalib/main/InstallStatusInfo;->setState(Lcom/motorola/otalib/main/PublicUtilityMethods$OtaState;)V

    invoke-virtual {v13, v9, v10}, Lcom/motorola/otalib/main/InstallStatusInfo;->setTargetVersion(J)V

    invoke-virtual {v7}, Lcom/motorola/otalib/main/checkUpdate/CheckRequestObj;->getSourceVersion()J

    move-result-wide v14

    cmp-long v14, v9, v14

    if-nez v14, :cond_5

    sget-object v2, Lcom/motorola/otalib/main/Logger;->OTALib_TAG:Ljava/lang/String;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3, v5}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-static {}, Lcom/motorola/otalib/main/OtaLibService;->access$100()Lcom/motorola/otalib/main/LibCussm;

    move-result-object v4

    invoke-virtual {v7}, Lcom/motorola/otalib/main/checkUpdate/CheckRequestObj;->getPrimaryKey()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Lcom/motorola/otalib/main/LibCussm;->getCurrentState(Ljava/lang/String;)Lcom/motorola/otalib/common/Environment/ApplicationEnv$PackageState;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, " but update was successful. Reporting Result & sending fresh request"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    sget v2, Lcom/motorola/otalib/main/PublicUtilityMethods;->SUCCESS:I

    invoke-virtual {v13, v2}, Lcom/motorola/otalib/main/InstallStatusInfo;->setStatusCode(I)V

    invoke-static {}, Lcom/motorola/otalib/main/OtaLibService;->access$100()Lcom/motorola/otalib/main/LibCussm;

    move-result-object v2

    iget-object v3, v1, Lcom/motorola/otalib/main/OtaLibService$OtaLibBinder;->mService:Lcom/motorola/otalib/main/OtaLibService;

    invoke-virtual {v7}, Lcom/motorola/otalib/main/checkUpdate/CheckRequestObj;->getPrimaryKey()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v13}, Lcom/motorola/otalib/main/InstallStatusInfo;->toString()Ljava/lang/String;

    move-result-object v5

    const/4 v8, 0x1

    invoke-virtual {v2, v3, v4, v8, v5}, Lcom/motorola/otalib/main/LibCussm;->OnUpgradeStatus(Landroid/content/Context;Ljava/lang/String;ZLjava/lang/String;)V

    invoke-static {}, Lcom/motorola/otalib/main/OtaLibService;->access$200()Lcom/motorola/otalib/main/Settings/LibSettings;

    move-result-object v2

    invoke-virtual {v6, v0, v2}, Lcom/motorola/otalib/main/checkUpdate/UpdateSessionInfo;->setCheckRequestObj(Ljava/lang/String;Lcom/motorola/otalib/common/settings/Settings;)Lcom/motorola/otalib/main/checkUpdate/CheckRequestObj;

    invoke-static {}, Lcom/motorola/otalib/main/OtaLibService;->access$100()Lcom/motorola/otalib/main/LibCussm;

    move-result-object v0

    iget-object v2, v1, Lcom/motorola/otalib/main/OtaLibService$OtaLibBinder;->mService:Lcom/motorola/otalib/main/OtaLibService;

    invoke-virtual {v0, v7, v2}, Lcom/motorola/otalib/main/LibCussm;->checkForUpdate(Lcom/motorola/otalib/main/checkUpdate/CheckRequestObj;Landroid/content/Context;)V

    goto/16 :goto_0

    :cond_5
    invoke-virtual {v7}, Lcom/motorola/otalib/main/checkUpdate/CheckRequestObj;->getSourceVersion()J

    move-result-wide v14

    cmp-long v5, v11, v14

    if-eqz v5, :cond_6

    sget-object v4, Lcom/motorola/otalib/main/Logger;->OTALib_TAG:Ljava/lang/String;

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-static {}, Lcom/motorola/otalib/main/OtaLibService;->access$100()Lcom/motorola/otalib/main/LibCussm;

    move-result-object v3

    invoke-virtual {v7}, Lcom/motorola/otalib/main/checkUpdate/CheckRequestObj;->getPrimaryKey()Ljava/lang/String;

    move-result-object v11

    invoke-virtual {v3, v11}, Lcom/motorola/otalib/main/LibCussm;->getCurrentState(Ljava/lang/String;)Lcom/motorola/otalib/common/Environment/ApplicationEnv$PackageState;

    move-result-object v3

    invoke-virtual {v5, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v5, " but update was failed. Reporting Result & sending fresh request"

    invoke-virtual {v3, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v4, v3}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    invoke-virtual {v13, v8}, Lcom/motorola/otalib/main/InstallStatusInfo;->setKeepPackage(Z)V

    sget v3, Lcom/motorola/otalib/main/PublicUtilityMethods;->ERROR_VERSION_MISMATCH:I

    invoke-virtual {v13, v3}, Lcom/motorola/otalib/main/InstallStatusInfo;->setStatusCode(I)V

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v3, v9, v10}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, " is not matching with source version "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v7}, Lcom/motorola/otalib/main/checkUpdate/CheckRequestObj;->getSourceVersion()J

    move-result-wide v3

    invoke-virtual {v2, v3, v4}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v13, v2}, Lcom/motorola/otalib/main/InstallStatusInfo;->setStatusMessage(Ljava/lang/String;)V

    sget-object v2, Lcom/motorola/otalib/main/PublicUtilityMethods$STATUS_CODE;->ERROR_VERSION_MISMATCH:Lcom/motorola/otalib/main/PublicUtilityMethods$STATUS_CODE;

    invoke-virtual {v13, v2}, Lcom/motorola/otalib/main/InstallStatusInfo;->setReportingError(Lcom/motorola/otalib/main/PublicUtilityMethods$STATUS_CODE;)V

    invoke-static {}, Lcom/motorola/otalib/main/OtaLibService;->access$100()Lcom/motorola/otalib/main/LibCussm;

    move-result-object v2

    iget-object v3, v1, Lcom/motorola/otalib/main/OtaLibService$OtaLibBinder;->mService:Lcom/motorola/otalib/main/OtaLibService;

    invoke-virtual {v7}, Lcom/motorola/otalib/main/checkUpdate/CheckRequestObj;->getPrimaryKey()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v13}, Lcom/motorola/otalib/main/InstallStatusInfo;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v2, v3, v4, v8, v5}, Lcom/motorola/otalib/main/LibCussm;->OnUpgradeStatus(Landroid/content/Context;Ljava/lang/String;ZLjava/lang/String;)V

    invoke-static {}, Lcom/motorola/otalib/main/OtaLibService;->access$200()Lcom/motorola/otalib/main/Settings/LibSettings;

    move-result-object v2

    invoke-virtual {v6, v0, v2}, Lcom/motorola/otalib/main/checkUpdate/UpdateSessionInfo;->setCheckRequestObj(Ljava/lang/String;Lcom/motorola/otalib/common/settings/Settings;)Lcom/motorola/otalib/main/checkUpdate/CheckRequestObj;

    invoke-static {}, Lcom/motorola/otalib/main/OtaLibService;->access$100()Lcom/motorola/otalib/main/LibCussm;

    move-result-object v0

    iget-object v2, v1, Lcom/motorola/otalib/main/OtaLibService$OtaLibBinder;->mService:Lcom/motorola/otalib/main/OtaLibService;

    invoke-virtual {v0, v7, v2}, Lcom/motorola/otalib/main/LibCussm;->checkForUpdate(Lcom/motorola/otalib/main/checkUpdate/CheckRequestObj;Landroid/content/Context;)V

    goto :goto_0

    :cond_6
    sget-object v0, Lcom/motorola/otalib/main/Logger;->OTALib_TAG:Ljava/lang/String;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-static {}, Lcom/motorola/otalib/main/OtaLibService;->access$100()Lcom/motorola/otalib/main/LibCussm;

    move-result-object v3

    invoke-virtual {v7}, Lcom/motorola/otalib/main/checkUpdate/CheckRequestObj;->getPrimaryKey()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Lcom/motorola/otalib/main/LibCussm;->getCurrentState(Ljava/lang/String;)Lcom/motorola/otalib/common/Environment/ApplicationEnv$PackageState;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v0, v2}, Lcom/motorola/otalib/main/Logger;->debug(Ljava/lang/String;Ljava/lang/String;)V

    invoke-static {}, Lcom/motorola/otalib/main/OtaLibService;->access$100()Lcom/motorola/otalib/main/LibCussm;

    move-result-object v0

    iget-object v2, v1, Lcom/motorola/otalib/main/OtaLibService$OtaLibBinder;->mService:Lcom/motorola/otalib/main/OtaLibService;

    invoke-virtual {v0, v2}, Lcom/motorola/otalib/main/LibCussm;->pleaseRunStateMachine(Landroid/content/Context;)V

    goto :goto_0

    :cond_7
    sget-object v0, Lcom/motorola/otalib/main/Logger;->OTALib_TAG:Ljava/lang/String;

    const-string v2, "Duplicate check request"

    invoke-static {v0, v2}, Lcom/motorola/otalib/main/Logger;->debug(Ljava/lang/String;Ljava/lang/String;)V

    invoke-static {}, Lcom/motorola/otalib/main/OtaLibService;->access$100()Lcom/motorola/otalib/main/LibCussm;

    move-result-object v0

    iget-object v2, v1, Lcom/motorola/otalib/main/OtaLibService$OtaLibBinder;->mService:Lcom/motorola/otalib/main/OtaLibService;

    invoke-virtual {v0, v2}, Lcom/motorola/otalib/main/LibCussm;->pleaseRunStateMachine(Landroid/content/Context;)V

    goto :goto_0

    :cond_8
    sget-object v0, Lcom/motorola/otalib/main/Logger;->OTALib_TAG:Ljava/lang/String;

    const-string v2, "State machine is destroyed, you are calling checkForUpdate() without calling registerCallback()"

    invoke-static {v0, v2}, Lcom/motorola/otalib/main/Logger;->error(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    :goto_0
    monitor-exit p0

    return-void

    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method destroy()V
    .locals 1

    const/4 v0, 0x0

    iput-object v0, p0, Lcom/motorola/otalib/main/OtaLibService$OtaLibBinder;->mService:Lcom/motorola/otalib/main/OtaLibService;

    return-void
.end method

.method public downloadConfigFiles(Ljava/lang/String;)V
    .locals 2

    invoke-static {}, Lcom/motorola/otalib/main/OtaLibService;->access$100()Lcom/motorola/otalib/main/LibCussm;

    move-result-object v0

    if-eqz v0, :cond_0

    invoke-static {}, Lcom/motorola/otalib/main/OtaLibService;->access$100()Lcom/motorola/otalib/main/LibCussm;

    move-result-object v0

    iget-object p0, p0, Lcom/motorola/otalib/main/OtaLibService$OtaLibBinder;->mService:Lcom/motorola/otalib/main/OtaLibService;

    invoke-static {}, Lcom/motorola/otalib/main/OtaLibService;->access$000()Lcom/motorola/otalib/aidl/IOtaLibServiceCallBack;

    move-result-object v1

    invoke-virtual {v0, p0, v1, p1}, Lcom/motorola/otalib/main/LibCussm;->downloadConfigFiles(Landroid/content/Context;Lcom/motorola/otalib/aidl/IOtaLibServiceCallBack;Ljava/lang/String;)V

    goto :goto_0

    :cond_0
    sget-object p0, Lcom/motorola/otalib/main/Logger;->OTALib_TAG:Ljava/lang/String;

    const-string p1, "State machine is destroyed, you are calling downloadConfigFiles() without calling registerCallback()"

    invoke-static {p0, p1}, Lcom/motorola/otalib/main/Logger;->error(Ljava/lang/String;Ljava/lang/String;)V

    :goto_0
    return-void
.end method

.method public onStatusUpdateBackToLib(Ljava/lang/String;ZLjava/lang/String;)V
    .locals 3

    sget-object v0, Lcom/motorola/otalib/main/Logger;->OTALib_TAG:Ljava/lang/String;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "update status is "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " Upgrade info "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/motorola/otalib/main/Logger;->debug(Ljava/lang/String;Ljava/lang/String;)V

    invoke-static {}, Lcom/motorola/otalib/main/OtaLibService;->access$100()Lcom/motorola/otalib/main/LibCussm;

    move-result-object v0

    if-eqz v0, :cond_0

    invoke-static {p3}, Lcom/motorola/otalib/main/InstallStatusInfo;->fromJsonString(Ljava/lang/String;)Lcom/motorola/otalib/main/InstallStatusInfo;

    move-result-object v0

    invoke-virtual {v0}, Lcom/motorola/otalib/main/InstallStatusInfo;->getAccSerialNumber()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1, v0}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    invoke-static {p1}, Lcom/motorola/otalib/main/PublicUtilityMethods;->SHA1Generator(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    invoke-static {}, Lcom/motorola/otalib/main/OtaLibService;->access$100()Lcom/motorola/otalib/main/LibCussm;

    move-result-object v0

    iget-object p0, p0, Lcom/motorola/otalib/main/OtaLibService$OtaLibBinder;->mService:Lcom/motorola/otalib/main/OtaLibService;

    invoke-virtual {v0, p0, p1, p2, p3}, Lcom/motorola/otalib/main/LibCussm;->OnUpgradeStatus(Landroid/content/Context;Ljava/lang/String;ZLjava/lang/String;)V

    goto :goto_0

    :cond_0
    sget-object p0, Lcom/motorola/otalib/main/Logger;->OTALib_TAG:Ljava/lang/String;

    const-string p1, "State machine is destroyed, you are calling onStatusUpdateBackToLib() without calling registerCallback()"

    invoke-static {p0, p1}, Lcom/motorola/otalib/main/Logger;->error(Ljava/lang/String;Ljava/lang/String;)V

    :goto_0
    return-void
.end method

.method public registerCallback(Lcom/motorola/otalib/aidl/IOtaLibServiceCallBack;)Z
    .locals 2

    invoke-static {p1}, Lcom/motorola/otalib/main/OtaLibService;->access$002(Lcom/motorola/otalib/aidl/IOtaLibServiceCallBack;)Lcom/motorola/otalib/aidl/IOtaLibServiceCallBack;

    sget-object p1, Lcom/motorola/otalib/main/Logger;->OTALib_TAG:Ljava/lang/String;

    const-string v0, "Client registered with Ota lib service"

    invoke-static {p1, v0}, Lcom/motorola/otalib/main/Logger;->debug(Ljava/lang/String;Ljava/lang/String;)V

    invoke-static {}, Lcom/motorola/otalib/main/OtaLibService;->access$100()Lcom/motorola/otalib/main/LibCussm;

    move-result-object p1

    if-nez p1, :cond_0

    new-instance p1, Lcom/motorola/otalib/main/LibCussm;

    iget-object v0, p0, Lcom/motorola/otalib/main/OtaLibService$OtaLibBinder;->mService:Lcom/motorola/otalib/main/OtaLibService;

    invoke-static {}, Lcom/motorola/otalib/main/OtaLibService;->access$200()Lcom/motorola/otalib/main/Settings/LibSettings;

    move-result-object v1

    invoke-direct {p1, v0, v1}, Lcom/motorola/otalib/main/LibCussm;-><init>(Landroid/content/Context;Lcom/motorola/otalib/main/Settings/LibSettings;)V

    invoke-static {p1}, Lcom/motorola/otalib/main/OtaLibService;->access$102(Lcom/motorola/otalib/main/LibCussm;)Lcom/motorola/otalib/main/LibCussm;

    invoke-static {}, Lcom/motorola/otalib/main/OtaLibService;->access$100()Lcom/motorola/otalib/main/LibCussm;

    move-result-object p1

    iget-object p0, p0, Lcom/motorola/otalib/main/OtaLibService$OtaLibBinder;->mService:Lcom/motorola/otalib/main/OtaLibService;

    invoke-static {}, Lcom/motorola/otalib/main/OtaLibService;->access$000()Lcom/motorola/otalib/aidl/IOtaLibServiceCallBack;

    move-result-object v0

    invoke-virtual {p1, p0, v0}, Lcom/motorola/otalib/main/LibCussm;->onStart(Landroid/content/Context;Lcom/motorola/otalib/aidl/IOtaLibServiceCallBack;)V

    :cond_0
    const/4 p0, 0x1

    return p0
.end method

.method public unregisterCallback()Z
    .locals 1

    invoke-static {}, Lcom/motorola/otalib/main/OtaLibService;->access$100()Lcom/motorola/otalib/main/LibCussm;

    move-result-object p0

    const/4 v0, 0x0

    if-eqz p0, :cond_0

    invoke-static {}, Lcom/motorola/otalib/main/OtaLibService;->access$100()Lcom/motorola/otalib/main/LibCussm;

    move-result-object p0

    invoke-virtual {p0}, Lcom/motorola/otalib/main/LibCussm;->onDestroy()V

    invoke-static {v0}, Lcom/motorola/otalib/main/OtaLibService;->access$102(Lcom/motorola/otalib/main/LibCussm;)Lcom/motorola/otalib/main/LibCussm;

    :cond_0
    invoke-static {v0}, Lcom/motorola/otalib/main/OtaLibService;->access$002(Lcom/motorola/otalib/aidl/IOtaLibServiceCallBack;)Lcom/motorola/otalib/aidl/IOtaLibServiceCallBack;

    sget-object p0, Lcom/motorola/otalib/main/Logger;->OTALib_TAG:Ljava/lang/String;

    const-string v0, "Client unregistered with Ota lib service"

    invoke-static {p0, v0}, Lcom/motorola/otalib/main/Logger;->debug(Ljava/lang/String;Ljava/lang/String;)V

    const/4 p0, 0x1

    return p0
.end method
