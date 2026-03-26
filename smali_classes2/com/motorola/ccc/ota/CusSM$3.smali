.class Lcom/motorola/ccc/ota/CusSM$3;
.super Ljava/lang/Object;
.source "CusSM.java"

# interfaces
.implements Lcom/motorola/otalib/cdsservice/ResponseHandler;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/motorola/ccc/ota/CusSM;->sendUpgradeStatus(Ljava/lang/String;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/motorola/ccc/ota/CusSM;

.field final synthetic val$isHealthCheckSet:Z

.field final synthetic val$s:Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database$Status;


# direct methods
.method constructor <init>(Lcom/motorola/ccc/ota/CusSM;Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database$Status;Z)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    iput-object p1, p0, Lcom/motorola/ccc/ota/CusSM$3;->this$0:Lcom/motorola/ccc/ota/CusSM;

    iput-object p2, p0, Lcom/motorola/ccc/ota/CusSM$3;->val$s:Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database$Status;

    iput-boolean p3, p0, Lcom/motorola/ccc/ota/CusSM$3;->val$isHealthCheckSet:Z

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public handleResponse(Lcom/motorola/otalib/cdsservice/webdataobjects/WebResponse;)V
    .locals 3

    iget-object v0, p0, Lcom/motorola/ccc/ota/CusSM$3;->val$s:Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database$Status;

    invoke-interface {v0}, Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database$Status;->getState()Ljava/lang/String;

    move-result-object v0

    iget-boolean v1, p0, Lcom/motorola/ccc/ota/CusSM$3;->val$isHealthCheckSet:Z

    if-eqz v1, :cond_5

    sget-object v1, Lcom/motorola/otalib/common/Environment/ApplicationEnv$PackageState;->Notified:Lcom/motorola/otalib/common/Environment/ApplicationEnv$PackageState;

    invoke-virtual {v1}, Lcom/motorola/otalib/common/Environment/ApplicationEnv$PackageState;->name()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_4

    sget-object v1, Lcom/motorola/otalib/common/Environment/ApplicationEnv$PackageState;->RequestPermission:Lcom/motorola/otalib/common/Environment/ApplicationEnv$PackageState;

    invoke-virtual {v1}, Lcom/motorola/otalib/common/Environment/ApplicationEnv$PackageState;->name()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_0

    goto :goto_1

    :cond_0
    sget-object v1, Lcom/motorola/otalib/common/Environment/ApplicationEnv$PackageState;->Querying:Lcom/motorola/otalib/common/Environment/ApplicationEnv$PackageState;

    invoke-virtual {v1}, Lcom/motorola/otalib/common/Environment/ApplicationEnv$PackageState;->name()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_3

    sget-object v1, Lcom/motorola/otalib/common/Environment/ApplicationEnv$PackageState;->QueryingInstall:Lcom/motorola/otalib/common/Environment/ApplicationEnv$PackageState;

    invoke-virtual {v1}, Lcom/motorola/otalib/common/Environment/ApplicationEnv$PackageState;->name()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_1

    goto :goto_0

    :cond_1
    sget-object v1, Lcom/motorola/otalib/common/Environment/ApplicationEnv$PackageState;->VerifyAllocateSpace:Lcom/motorola/otalib/common/Environment/ApplicationEnv$PackageState;

    invoke-virtual {v1}, Lcom/motorola/otalib/common/Environment/ApplicationEnv$PackageState;->name()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_2

    const-string v0, "VABLowMemoryHealthCheck"

    goto :goto_2

    :cond_2
    sget-object v1, Lcom/motorola/otalib/common/Environment/ApplicationEnv$PackageState;->MergeRestart:Lcom/motorola/otalib/common/Environment/ApplicationEnv$PackageState;

    invoke-virtual {v1}, Lcom/motorola/otalib/common/Environment/ApplicationEnv$PackageState;->name()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_5

    const-string v0, "MergeRestartHealthCheck"

    goto :goto_2

    :cond_3
    :goto_0
    const-string v0, "PreInstallHealthCheck"

    goto :goto_2

    :cond_4
    :goto_1
    const-string v0, "PreDownloadHealthCheck"

    :cond_5
    :goto_2
    iget-object v1, p0, Lcom/motorola/ccc/ota/CusSM$3;->this$0:Lcom/motorola/ccc/ota/CusSM;

    iget-object v2, p0, Lcom/motorola/ccc/ota/CusSM$3;->val$s:Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database$Status;

    invoke-interface {v2}, Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database$Status;->getId()I

    move-result v2

    iget-object p0, p0, Lcom/motorola/ccc/ota/CusSM$3;->val$s:Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database$Status;

    invoke-interface {p0}, Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database$Status;->getSourceSha1()Ljava/lang/String;

    move-result-object p0

    invoke-virtual {v1, p1, v2, v0, p0}, Lcom/motorola/ccc/ota/CusSM;->handleStateWebResponse(Lcom/motorola/otalib/cdsservice/webdataobjects/WebResponse;ILjava/lang/String;Ljava/lang/String;)Z

    return-void
.end method
