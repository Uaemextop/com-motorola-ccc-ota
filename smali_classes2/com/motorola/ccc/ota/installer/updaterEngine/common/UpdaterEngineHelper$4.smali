.class Lcom/motorola/ccc/ota/installer/updaterEngine/common/UpdaterEngineHelper$4;
.super Ljava/lang/Object;
.source "UpdaterEngineHelper.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/motorola/ccc/ota/installer/updaterEngine/common/UpdaterEngineHelper;->allocateSpace(Landroid/content/Context;Ljava/lang/String;[Ljava/lang/String;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic val$ctx:Landroid/content/Context;

.field final synthetic val$headerKeyValuePairs:[Ljava/lang/String;

.field final synthetic val$payloadMetaDataPath:Ljava/lang/String;


# direct methods
.method constructor <init>(Ljava/lang/String;[Ljava/lang/String;Landroid/content/Context;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    iput-object p1, p0, Lcom/motorola/ccc/ota/installer/updaterEngine/common/UpdaterEngineHelper$4;->val$payloadMetaDataPath:Ljava/lang/String;

    iput-object p2, p0, Lcom/motorola/ccc/ota/installer/updaterEngine/common/UpdaterEngineHelper$4;->val$headerKeyValuePairs:[Ljava/lang/String;

    iput-object p3, p0, Lcom/motorola/ccc/ota/installer/updaterEngine/common/UpdaterEngineHelper$4;->val$ctx:Landroid/content/Context;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 8

    const/4 v0, 0x2

    new-array v0, v0, [Ljava/lang/Class;

    const-class v1, Ljava/lang/String;

    const/4 v2, 0x0

    aput-object v1, v0, v2

    const/4 v1, 0x1

    const-class v3, [Ljava/lang/String;

    aput-object v3, v0, v1

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v3, "UpdaterEngineHelper:allocateSpace, allocateSpace with payloadMetaDataPath"

    invoke-direct {v1, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v3, p0, Lcom/motorola/ccc/ota/installer/updaterEngine/common/UpdaterEngineHelper$4;->val$payloadMetaDataPath:Ljava/lang/String;

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    const-string v3, "OtaApp"

    invoke-static {v3, v1}, Lcom/motorola/ccc/ota/utils/Logger;->debug(Ljava/lang/String;Ljava/lang/String;)V

    const-wide/16 v4, 0x0

    :try_start_0
    invoke-static {}, Lcom/motorola/ccc/ota/installer/updaterEngine/common/UpdaterEngineHelper;->-$$Nest$smsetUpdateEngineObject()V

    invoke-static {}, Lcom/motorola/ccc/ota/installer/updaterEngine/common/UpdaterEngineHelper;->-$$Nest$sfgetupdateEngine()Ljava/lang/Class;

    move-result-object v1

    const-string v6, "allocateSpace"

    invoke-virtual {v1, v6, v0}, Ljava/lang/Class;->getDeclaredMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v0

    invoke-static {}, Lcom/motorola/ccc/ota/installer/updaterEngine/common/UpdaterEngineHelper;->-$$Nest$sfgetmUpdateEngine()Ljava/lang/Object;

    move-result-object v1

    iget-object v6, p0, Lcom/motorola/ccc/ota/installer/updaterEngine/common/UpdaterEngineHelper$4;->val$payloadMetaDataPath:Ljava/lang/String;

    iget-object v7, p0, Lcom/motorola/ccc/ota/installer/updaterEngine/common/UpdaterEngineHelper$4;->val$headerKeyValuePairs:[Ljava/lang/String;

    filled-new-array {v6, v7}, [Ljava/lang/Object;

    move-result-object v6

    invoke-virtual {v0, v1, v6}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v1

    const-string v6, "getFreeSpaceRequired"

    new-array v7, v2, [Ljava/lang/Class;

    invoke-virtual {v1, v6, v7}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v1

    new-array v2, v2, [Ljava/lang/Object;

    invoke-virtual {v1, v0, v2}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Long;

    invoke-virtual {v0}, Ljava/lang/Long;->longValue()J

    move-result-wide v0

    cmp-long v2, v0, v4

    if-gez v2, :cond_0

    iget-object v0, p0, Lcom/motorola/ccc/ota/installer/updaterEngine/common/UpdaterEngineHelper$4;->val$ctx:Landroid/content/Context;

    invoke-static {v0, v4, v5}, Lcom/motorola/ccc/ota/utils/UpgradeUtilMethods;->sendActionAllocateSpaceResult(Landroid/content/Context;J)V

    goto :goto_0

    :cond_0
    iget-object v2, p0, Lcom/motorola/ccc/ota/installer/updaterEngine/common/UpdaterEngineHelper$4;->val$ctx:Landroid/content/Context;

    invoke-static {v2, v0, v1}, Lcom/motorola/ccc/ota/utils/UpgradeUtilMethods;->sendActionAllocateSpaceResult(Landroid/content/Context;J)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    :goto_0
    return-void

    :catch_0
    move-exception v0

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "exception in UpdaterEngineHelper:allocateSpace "

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0}, Ljava/lang/Exception;->getCause()Ljava/lang/Throwable;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v3, v1}, Lcom/motorola/ccc/ota/utils/Logger;->error(Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v0}, Ljava/lang/Exception;->printStackTrace()V

    iget-object p0, p0, Lcom/motorola/ccc/ota/installer/updaterEngine/common/UpdaterEngineHelper$4;->val$ctx:Landroid/content/Context;

    invoke-static {p0, v4, v5}, Lcom/motorola/ccc/ota/utils/UpgradeUtilMethods;->sendActionAllocateSpaceResult(Landroid/content/Context;J)V

    return-void
.end method
