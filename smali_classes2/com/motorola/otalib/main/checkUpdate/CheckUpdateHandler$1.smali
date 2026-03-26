.class Lcom/motorola/otalib/main/checkUpdate/CheckUpdateHandler$1;
.super Ljava/lang/Object;
.source "CheckUpdateHandler.java"

# interfaces
.implements Lcom/motorola/otalib/cdsservice/ResponseHandler;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/motorola/otalib/main/checkUpdate/CheckUpdateHandler;->checkForUpdate(Lcom/motorola/otalib/main/checkUpdate/CheckRequestObj;Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database;Lcom/motorola/otalib/main/LibCussm;Lcom/motorola/otalib/aidl/IOtaLibServiceCallBack;Landroid/content/Context;ZLcom/motorola/otalib/main/Settings/LibSettings;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/motorola/otalib/main/checkUpdate/CheckUpdateHandler;

.field final synthetic val$_db:Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database;

.field final synthetic val$callbackObject:Lcom/motorola/otalib/aidl/IOtaLibServiceCallBack;

.field final synthetic val$checkRequestObj:Lcom/motorola/otalib/main/checkUpdate/CheckRequestObj;

.field final synthetic val$context:Landroid/content/Context;

.field final synthetic val$libCussm:Lcom/motorola/otalib/main/LibCussm;

.field final synthetic val$settings:Lcom/motorola/otalib/main/Settings/LibSettings;

.field final synthetic val$statusInfo:Lcom/motorola/otalib/main/InstallStatusInfo;


# direct methods
.method constructor <init>(Lcom/motorola/otalib/main/checkUpdate/CheckUpdateHandler;Landroid/content/Context;Lcom/motorola/otalib/aidl/IOtaLibServiceCallBack;Lcom/motorola/otalib/main/checkUpdate/CheckRequestObj;Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database;Lcom/motorola/otalib/main/LibCussm;Lcom/motorola/otalib/main/Settings/LibSettings;Lcom/motorola/otalib/main/InstallStatusInfo;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    iput-object p1, p0, Lcom/motorola/otalib/main/checkUpdate/CheckUpdateHandler$1;->this$0:Lcom/motorola/otalib/main/checkUpdate/CheckUpdateHandler;

    iput-object p2, p0, Lcom/motorola/otalib/main/checkUpdate/CheckUpdateHandler$1;->val$context:Landroid/content/Context;

    iput-object p3, p0, Lcom/motorola/otalib/main/checkUpdate/CheckUpdateHandler$1;->val$callbackObject:Lcom/motorola/otalib/aidl/IOtaLibServiceCallBack;

    iput-object p4, p0, Lcom/motorola/otalib/main/checkUpdate/CheckUpdateHandler$1;->val$checkRequestObj:Lcom/motorola/otalib/main/checkUpdate/CheckRequestObj;

    iput-object p5, p0, Lcom/motorola/otalib/main/checkUpdate/CheckUpdateHandler$1;->val$_db:Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database;

    iput-object p6, p0, Lcom/motorola/otalib/main/checkUpdate/CheckUpdateHandler$1;->val$libCussm:Lcom/motorola/otalib/main/LibCussm;

    iput-object p7, p0, Lcom/motorola/otalib/main/checkUpdate/CheckUpdateHandler$1;->val$settings:Lcom/motorola/otalib/main/Settings/LibSettings;

    iput-object p8, p0, Lcom/motorola/otalib/main/checkUpdate/CheckUpdateHandler$1;->val$statusInfo:Lcom/motorola/otalib/main/InstallStatusInfo;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public handleResponse(Lcom/motorola/otalib/cdsservice/webdataobjects/WebResponse;)V
    .locals 9

    :try_start_0
    iget-object v0, p0, Lcom/motorola/otalib/main/checkUpdate/CheckUpdateHandler$1;->this$0:Lcom/motorola/otalib/main/checkUpdate/CheckUpdateHandler;

    iget-object v1, p0, Lcom/motorola/otalib/main/checkUpdate/CheckUpdateHandler$1;->val$context:Landroid/content/Context;

    iget-object v3, p0, Lcom/motorola/otalib/main/checkUpdate/CheckUpdateHandler$1;->val$callbackObject:Lcom/motorola/otalib/aidl/IOtaLibServiceCallBack;

    iget-object v4, p0, Lcom/motorola/otalib/main/checkUpdate/CheckUpdateHandler$1;->val$checkRequestObj:Lcom/motorola/otalib/main/checkUpdate/CheckRequestObj;

    iget-object v5, p0, Lcom/motorola/otalib/main/checkUpdate/CheckUpdateHandler$1;->val$_db:Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database;

    iget-object v6, p0, Lcom/motorola/otalib/main/checkUpdate/CheckUpdateHandler$1;->val$libCussm:Lcom/motorola/otalib/main/LibCussm;

    iget-object v7, p0, Lcom/motorola/otalib/main/checkUpdate/CheckUpdateHandler$1;->val$settings:Lcom/motorola/otalib/main/Settings/LibSettings;

    iget-object v8, p0, Lcom/motorola/otalib/main/checkUpdate/CheckUpdateHandler$1;->val$statusInfo:Lcom/motorola/otalib/main/InstallStatusInfo;

    move-object v2, p1

    invoke-static/range {v0 .. v8}, Lcom/motorola/otalib/main/checkUpdate/CheckUpdateHandler;->access$000(Lcom/motorola/otalib/main/checkUpdate/CheckUpdateHandler;Landroid/content/Context;Lcom/motorola/otalib/cdsservice/webdataobjects/WebResponse;Lcom/motorola/otalib/aidl/IOtaLibServiceCallBack;Lcom/motorola/otalib/main/checkUpdate/CheckRequestObj;Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database;Lcom/motorola/otalib/main/LibCussm;Lcom/motorola/otalib/main/Settings/LibSettings;Lcom/motorola/otalib/main/InstallStatusInfo;)Z

    move-result p1

    if-nez p1, :cond_0

    iget-object p1, p0, Lcom/motorola/otalib/main/checkUpdate/CheckUpdateHandler$1;->val$settings:Lcom/motorola/otalib/main/Settings/LibSettings;

    iget-object p0, p0, Lcom/motorola/otalib/main/checkUpdate/CheckUpdateHandler$1;->val$checkRequestObj:Lcom/motorola/otalib/main/checkUpdate/CheckRequestObj;

    invoke-virtual {p0}, Lcom/motorola/otalib/main/checkUpdate/CheckRequestObj;->getPrimaryKey()Ljava/lang/String;

    move-result-object p0

    invoke-static {p1, p0}, Lcom/motorola/otalib/main/checkUpdate/UpdateSessionInfo;->deleteSessionDetails(Lcom/motorola/otalib/common/settings/Settings;Ljava/lang/String;)V
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    :cond_0
    return-void

    :catch_0
    move-exception p0

    new-instance p1, Ljava/lang/RuntimeException;

    invoke-direct {p1, p0}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/Throwable;)V

    throw p1
.end method
