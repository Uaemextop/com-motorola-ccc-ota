.class Lcom/motorola/otalib/main/LibCussm$2;
.super Ljava/lang/Object;
.source "LibCussm.java"

# interfaces
.implements Lcom/motorola/otalib/cdsservice/ResponseHandler;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/motorola/otalib/main/LibCussm;->sendUpgradeStatus(Lcom/motorola/otalib/main/Settings/LibSettings;Landroid/content/Context;Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/motorola/otalib/main/LibCussm;

.field final synthetic val$_db:Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database;

.field final synthetic val$checkRequestObj:Lcom/motorola/otalib/main/checkUpdate/CheckRequestObj;

.field final synthetic val$context:Landroid/content/Context;

.field final synthetic val$s:Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database$Status;

.field final synthetic val$settings:Lcom/motorola/otalib/main/Settings/LibSettings;


# direct methods
.method constructor <init>(Lcom/motorola/otalib/main/LibCussm;Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database$Status;Landroid/content/Context;Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database;Lcom/motorola/otalib/main/Settings/LibSettings;Lcom/motorola/otalib/main/checkUpdate/CheckRequestObj;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    iput-object p1, p0, Lcom/motorola/otalib/main/LibCussm$2;->this$0:Lcom/motorola/otalib/main/LibCussm;

    iput-object p2, p0, Lcom/motorola/otalib/main/LibCussm$2;->val$s:Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database$Status;

    iput-object p3, p0, Lcom/motorola/otalib/main/LibCussm$2;->val$context:Landroid/content/Context;

    iput-object p4, p0, Lcom/motorola/otalib/main/LibCussm$2;->val$_db:Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database;

    iput-object p5, p0, Lcom/motorola/otalib/main/LibCussm$2;->val$settings:Lcom/motorola/otalib/main/Settings/LibSettings;

    iput-object p6, p0, Lcom/motorola/otalib/main/LibCussm$2;->val$checkRequestObj:Lcom/motorola/otalib/main/checkUpdate/CheckRequestObj;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public handleResponse(Lcom/motorola/otalib/cdsservice/webdataobjects/WebResponse;)V
    .locals 9

    sget-object v0, Lcom/motorola/otalib/main/Logger;->OTALib_TAG:Ljava/lang/String;

    const-string v1, "Inside handleStateResponse"

    invoke-static {v0, v1}, Lcom/motorola/otalib/main/Logger;->debug(Ljava/lang/String;Ljava/lang/String;)V

    iget-object v2, p0, Lcom/motorola/otalib/main/LibCussm$2;->this$0:Lcom/motorola/otalib/main/LibCussm;

    iget-object v0, p0, Lcom/motorola/otalib/main/LibCussm$2;->val$s:Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database$Status;

    invoke-interface {v0}, Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database$Status;->getId()I

    move-result v4

    iget-object v5, p0, Lcom/motorola/otalib/main/LibCussm$2;->val$context:Landroid/content/Context;

    iget-object v6, p0, Lcom/motorola/otalib/main/LibCussm$2;->val$_db:Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database;

    iget-object v7, p0, Lcom/motorola/otalib/main/LibCussm$2;->val$settings:Lcom/motorola/otalib/main/Settings/LibSettings;

    iget-object v8, p0, Lcom/motorola/otalib/main/LibCussm$2;->val$checkRequestObj:Lcom/motorola/otalib/main/checkUpdate/CheckRequestObj;

    move-object v3, p1

    invoke-virtual/range {v2 .. v8}, Lcom/motorola/otalib/main/LibCussm;->handleStateWebResponse(Lcom/motorola/otalib/cdsservice/webdataobjects/WebResponse;ILandroid/content/Context;Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database;Lcom/motorola/otalib/main/Settings/LibSettings;Lcom/motorola/otalib/main/checkUpdate/CheckRequestObj;)Z

    return-void
.end method
