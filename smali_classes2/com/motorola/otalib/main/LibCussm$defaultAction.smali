.class Lcom/motorola/otalib/main/LibCussm$defaultAction;
.super Ljava/util/TimerTask;
.source "LibCussm.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/motorola/otalib/main/LibCussm;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = "defaultAction"
.end annotation


# instance fields
.field mContext:Landroid/content/Context;

.field md:Lcom/motorola/otalib/common/metaData/MetaData;

.field final synthetic this$0:Lcom/motorola/otalib/main/LibCussm;


# direct methods
.method public constructor <init>(Lcom/motorola/otalib/main/LibCussm;Lcom/motorola/otalib/common/metaData/MetaData;Landroid/content/Context;)V
    .locals 0

    iput-object p1, p0, Lcom/motorola/otalib/main/LibCussm$defaultAction;->this$0:Lcom/motorola/otalib/main/LibCussm;

    invoke-direct {p0}, Ljava/util/TimerTask;-><init>()V

    iput-object p2, p0, Lcom/motorola/otalib/main/LibCussm$defaultAction;->md:Lcom/motorola/otalib/common/metaData/MetaData;

    iput-object p3, p0, Lcom/motorola/otalib/main/LibCussm$defaultAction;->mContext:Landroid/content/Context;

    return-void
.end method


# virtual methods
.method public run()V
    .locals 4

    sget-object v0, Lcom/motorola/otalib/main/Logger;->OTALib_TAG:Ljava/lang/String;

    const-string v1, "No Service response, taking  defaultAction"

    invoke-static {v0, v1}, Lcom/motorola/otalib/main/Logger;->debug(Ljava/lang/String;Ljava/lang/String;)V

    iget-object v0, p0, Lcom/motorola/otalib/main/LibCussm$defaultAction;->this$0:Lcom/motorola/otalib/main/LibCussm;

    invoke-static {v0}, Lcom/motorola/otalib/main/LibCussm;->access$300(Lcom/motorola/otalib/main/LibCussm;)V

    iget-object v0, p0, Lcom/motorola/otalib/main/LibCussm$defaultAction;->md:Lcom/motorola/otalib/common/metaData/MetaData;

    invoke-virtual {v0}, Lcom/motorola/otalib/common/metaData/MetaData;->isContinueOnServiceError()Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/motorola/otalib/main/LibCussm$defaultAction;->this$0:Lcom/motorola/otalib/main/LibCussm;

    invoke-static {v0}, Lcom/motorola/otalib/main/LibCussm;->access$400(Lcom/motorola/otalib/main/LibCussm;)Lcom/motorola/otalib/main/Settings/LibSettings;

    move-result-object v0

    iget-object v1, p0, Lcom/motorola/otalib/main/LibCussm$defaultAction;->md:Lcom/motorola/otalib/common/metaData/MetaData;

    invoke-virtual {v1}, Lcom/motorola/otalib/common/metaData/MetaData;->getSourceSha1()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/motorola/otalib/main/checkUpdate/UpdateSessionInfo;->getSessionDetails(Lcom/motorola/otalib/common/settings/Settings;Ljava/lang/String;)Lcom/motorola/otalib/main/checkUpdate/UpdateSessionInfo;

    move-result-object v0

    iget-object v1, p0, Lcom/motorola/otalib/main/LibCussm$defaultAction;->this$0:Lcom/motorola/otalib/main/LibCussm;

    invoke-static {v1}, Lcom/motorola/otalib/main/LibCussm;->access$400(Lcom/motorola/otalib/main/LibCussm;)Lcom/motorola/otalib/main/Settings/LibSettings;

    move-result-object v1

    iget-object v2, p0, Lcom/motorola/otalib/main/LibCussm$defaultAction;->md:Lcom/motorola/otalib/common/metaData/MetaData;

    invoke-virtual {v2}, Lcom/motorola/otalib/common/metaData/MetaData;->getSourceSha1()Ljava/lang/String;

    move-result-object v2

    const-string v3, "continue"

    invoke-virtual {v0, v1, v2, v3}, Lcom/motorola/otalib/main/checkUpdate/UpdateSessionInfo;->setServiceControlResponse(Lcom/motorola/otalib/common/settings/Settings;Ljava/lang/String;Ljava/lang/String;)Lcom/motorola/otalib/main/checkUpdate/UpdateSessionInfo;

    iget-object v0, p0, Lcom/motorola/otalib/main/LibCussm$defaultAction;->this$0:Lcom/motorola/otalib/main/LibCussm;

    iget-object p0, p0, Lcom/motorola/otalib/main/LibCussm$defaultAction;->mContext:Landroid/content/Context;

    invoke-static {v0, p0}, Lcom/motorola/otalib/main/LibCussm;->access$100(Lcom/motorola/otalib/main/LibCussm;Landroid/content/Context;)V

    goto :goto_0

    :cond_0
    iget-object v0, p0, Lcom/motorola/otalib/main/LibCussm$defaultAction;->this$0:Lcom/motorola/otalib/main/LibCussm;

    iget-object v1, p0, Lcom/motorola/otalib/main/LibCussm$defaultAction;->mContext:Landroid/content/Context;

    iget-object p0, p0, Lcom/motorola/otalib/main/LibCussm$defaultAction;->md:Lcom/motorola/otalib/common/metaData/MetaData;

    invoke-virtual {p0}, Lcom/motorola/otalib/common/metaData/MetaData;->getSourceSha1()Ljava/lang/String;

    move-result-object p0

    const-string v2, "Server cancelled"

    invoke-static {v0, v1, v2, p0}, Lcom/motorola/otalib/main/LibCussm;->access$500(Lcom/motorola/otalib/main/LibCussm;Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)V

    :goto_0
    return-void
.end method
