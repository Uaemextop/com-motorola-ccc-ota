.class Lcom/motorola/otalib/main/checkUpdate/CheckUpdateHandler$2;
.super Ljava/lang/Object;
.source "CheckUpdateHandler.java"

# interfaces
.implements Lcom/motorola/otalib/cdsservice/ResponseHandler;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/motorola/otalib/main/checkUpdate/CheckUpdateHandler;->checkForDownloadDescriptor(Lcom/motorola/otalib/main/LibCussm;Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database;Landroid/content/Context;Lcom/motorola/otalib/aidl/IOtaLibServiceCallBack;Lcom/motorola/otalib/main/Settings/LibSettings;Lcom/motorola/otalib/main/checkUpdate/CheckRequestObj;Ljava/lang/String;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/motorola/otalib/main/checkUpdate/CheckUpdateHandler;

.field final synthetic val$_db:Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database;

.field final synthetic val$checkRequestObj:Lcom/motorola/otalib/main/checkUpdate/CheckRequestObj;

.field final synthetic val$context:Landroid/content/Context;

.field final synthetic val$libCussm:Lcom/motorola/otalib/main/LibCussm;

.field final synthetic val$mClientCallBack:Lcom/motorola/otalib/aidl/IOtaLibServiceCallBack;

.field final synthetic val$sessionInfo:Lcom/motorola/otalib/main/checkUpdate/UpdateSessionInfo;

.field final synthetic val$settings:Lcom/motorola/otalib/main/Settings/LibSettings;


# direct methods
.method constructor <init>(Lcom/motorola/otalib/main/checkUpdate/CheckUpdateHandler;Landroid/content/Context;Lcom/motorola/otalib/main/checkUpdate/UpdateSessionInfo;Lcom/motorola/otalib/main/checkUpdate/CheckRequestObj;Lcom/motorola/otalib/main/LibCussm;Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database;Lcom/motorola/otalib/aidl/IOtaLibServiceCallBack;Lcom/motorola/otalib/main/Settings/LibSettings;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    iput-object p1, p0, Lcom/motorola/otalib/main/checkUpdate/CheckUpdateHandler$2;->this$0:Lcom/motorola/otalib/main/checkUpdate/CheckUpdateHandler;

    iput-object p2, p0, Lcom/motorola/otalib/main/checkUpdate/CheckUpdateHandler$2;->val$context:Landroid/content/Context;

    iput-object p3, p0, Lcom/motorola/otalib/main/checkUpdate/CheckUpdateHandler$2;->val$sessionInfo:Lcom/motorola/otalib/main/checkUpdate/UpdateSessionInfo;

    iput-object p4, p0, Lcom/motorola/otalib/main/checkUpdate/CheckUpdateHandler$2;->val$checkRequestObj:Lcom/motorola/otalib/main/checkUpdate/CheckRequestObj;

    iput-object p5, p0, Lcom/motorola/otalib/main/checkUpdate/CheckUpdateHandler$2;->val$libCussm:Lcom/motorola/otalib/main/LibCussm;

    iput-object p6, p0, Lcom/motorola/otalib/main/checkUpdate/CheckUpdateHandler$2;->val$_db:Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database;

    iput-object p7, p0, Lcom/motorola/otalib/main/checkUpdate/CheckUpdateHandler$2;->val$mClientCallBack:Lcom/motorola/otalib/aidl/IOtaLibServiceCallBack;

    iput-object p8, p0, Lcom/motorola/otalib/main/checkUpdate/CheckUpdateHandler$2;->val$settings:Lcom/motorola/otalib/main/Settings/LibSettings;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public handleResponse(Lcom/motorola/otalib/cdsservice/webdataobjects/WebResponse;)V
    .locals 9

    :try_start_0
    iget-object v0, p0, Lcom/motorola/otalib/main/checkUpdate/CheckUpdateHandler$2;->this$0:Lcom/motorola/otalib/main/checkUpdate/CheckUpdateHandler;

    iget-object v1, p0, Lcom/motorola/otalib/main/checkUpdate/CheckUpdateHandler$2;->val$context:Landroid/content/Context;

    iget-object v2, p0, Lcom/motorola/otalib/main/checkUpdate/CheckUpdateHandler$2;->val$sessionInfo:Lcom/motorola/otalib/main/checkUpdate/UpdateSessionInfo;

    invoke-virtual {v2}, Lcom/motorola/otalib/main/checkUpdate/UpdateSessionInfo;->getTrackingId()Ljava/lang/String;

    move-result-object v3

    iget-object v2, p0, Lcom/motorola/otalib/main/checkUpdate/CheckUpdateHandler$2;->val$checkRequestObj:Lcom/motorola/otalib/main/checkUpdate/CheckRequestObj;

    invoke-virtual {v2}, Lcom/motorola/otalib/main/checkUpdate/CheckRequestObj;->getPrimaryKey()Ljava/lang/String;

    move-result-object v4

    iget-object v5, p0, Lcom/motorola/otalib/main/checkUpdate/CheckUpdateHandler$2;->val$libCussm:Lcom/motorola/otalib/main/LibCussm;

    iget-object v6, p0, Lcom/motorola/otalib/main/checkUpdate/CheckUpdateHandler$2;->val$_db:Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database;

    iget-object v7, p0, Lcom/motorola/otalib/main/checkUpdate/CheckUpdateHandler$2;->val$mClientCallBack:Lcom/motorola/otalib/aidl/IOtaLibServiceCallBack;

    iget-object v8, p0, Lcom/motorola/otalib/main/checkUpdate/CheckUpdateHandler$2;->val$settings:Lcom/motorola/otalib/main/Settings/LibSettings;

    move-object v2, p1

    invoke-static/range {v0 .. v8}, Lcom/motorola/otalib/main/checkUpdate/CheckUpdateHandler;->access$100(Lcom/motorola/otalib/main/checkUpdate/CheckUpdateHandler;Landroid/content/Context;Lcom/motorola/otalib/cdsservice/webdataobjects/WebResponse;Ljava/lang/String;Ljava/lang/String;Lcom/motorola/otalib/main/LibCussm;Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database;Lcom/motorola/otalib/aidl/IOtaLibServiceCallBack;Lcom/motorola/otalib/main/Settings/LibSettings;)V
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    :catch_0
    return-void
.end method
