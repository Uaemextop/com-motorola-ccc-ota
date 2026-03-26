.class Lcom/motorola/ccc/ota/CusSM$2;
.super Ljava/lang/Object;
.source "CusSM.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/motorola/ccc/ota/CusSM;->checkForChain(ZLcom/motorola/ccc/ota/sources/UpgradeSourceType;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/motorola/ccc/ota/CusSM;

.field final synthetic val$repoCopy:Lcom/motorola/ccc/ota/sources/UpgradeSourceType;


# direct methods
.method constructor <init>(Lcom/motorola/ccc/ota/CusSM;Lcom/motorola/ccc/ota/sources/UpgradeSourceType;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    iput-object p1, p0, Lcom/motorola/ccc/ota/CusSM$2;->this$0:Lcom/motorola/ccc/ota/CusSM;

    iput-object p2, p0, Lcom/motorola/ccc/ota/CusSM$2;->val$repoCopy:Lcom/motorola/ccc/ota/sources/UpgradeSourceType;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 2

    const-string v0, "OtaApp"

    const-string v1, "CusSM.checkForUpgradeCompleted checking for chained upgrade"

    invoke-static {v0, v1}, Lcom/motorola/ccc/ota/utils/Logger;->debug(Ljava/lang/String;Ljava/lang/String;)V

    iget-object v0, p0, Lcom/motorola/ccc/ota/CusSM$2;->this$0:Lcom/motorola/ccc/ota/CusSM;

    invoke-static {v0}, Lcom/motorola/ccc/ota/CusSM;->-$$Nest$fget_upgradePlugins(Lcom/motorola/ccc/ota/CusSM;)Lcom/motorola/ccc/ota/sources/UpgradeSources;

    move-result-object v0

    iget-object v1, p0, Lcom/motorola/ccc/ota/CusSM$2;->val$repoCopy:Lcom/motorola/ccc/ota/sources/UpgradeSourceType;

    invoke-virtual {v0, v1}, Lcom/motorola/ccc/ota/sources/UpgradeSources;->getUpgradeSource(Lcom/motorola/ccc/ota/sources/UpgradeSourceType;)Lcom/motorola/ccc/ota/sources/UpgradeSource;

    move-result-object v0

    iget-object v1, p0, Lcom/motorola/ccc/ota/CusSM$2;->val$repoCopy:Lcom/motorola/ccc/ota/sources/UpgradeSourceType;

    invoke-virtual {v0, v1}, Lcom/motorola/ccc/ota/sources/UpgradeSource;->sendChainUpgradeRequest(Lcom/motorola/ccc/ota/sources/UpgradeSourceType;)V

    invoke-static {}, Lcom/motorola/ccc/ota/utils/BuildPropReader;->isATT()Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object p0, p0, Lcom/motorola/ccc/ota/CusSM$2;->this$0:Lcom/motorola/ccc/ota/CusSM;

    invoke-static {p0}, Lcom/motorola/ccc/ota/CusSM;->-$$Nest$fget_env(Lcom/motorola/ccc/ota/CusSM;)Lcom/motorola/otalib/common/Environment/ApplicationEnv;

    move-result-object p0

    invoke-interface {p0}, Lcom/motorola/otalib/common/Environment/ApplicationEnv;->getFotaServices()Lcom/motorola/otalib/common/Environment/ApplicationEnv$FotaServices;

    move-result-object p0

    const-wide/16 v0, 0x472

    invoke-interface {p0, v0, v1}, Lcom/motorola/otalib/common/Environment/ApplicationEnv$FotaServices;->sendRequestUpdate(J)V

    :cond_0
    return-void
.end method
