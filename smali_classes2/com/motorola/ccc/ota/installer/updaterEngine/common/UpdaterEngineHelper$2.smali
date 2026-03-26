.class Lcom/motorola/ccc/ota/installer/updaterEngine/common/UpdaterEngineHelper$2;
.super Ljava/lang/Object;
.source "UpdaterEngineHelper.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/motorola/ccc/ota/installer/updaterEngine/common/UpdaterEngineHelper;->verifyPayloadMetadata(Ljava/lang/String;Z)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic val$isVABVerificationRequest:Z

.field final synthetic val$payloadMetaDataFilePath:Ljava/lang/String;


# direct methods
.method constructor <init>(Ljava/lang/String;Z)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    iput-object p1, p0, Lcom/motorola/ccc/ota/installer/updaterEngine/common/UpdaterEngineHelper$2;->val$payloadMetaDataFilePath:Ljava/lang/String;

    iput-boolean p2, p0, Lcom/motorola/ccc/ota/installer/updaterEngine/common/UpdaterEngineHelper$2;->val$isVABVerificationRequest:Z

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 7

    const-string v0, "UpdaterEngineHelper:verifyPayloadMetadata"

    const-string v1, "OtaApp"

    invoke-static {v1, v0}, Lcom/motorola/ccc/ota/utils/Logger;->debug(Ljava/lang/String;Ljava/lang/String;)V

    invoke-static {}, Lcom/motorola/ccc/ota/env/OtaApplication;->getGlobalContext()Landroid/content/Context;

    move-result-object v0

    const/4 v2, 0x0

    :try_start_0
    invoke-static {}, Lcom/motorola/ccc/ota/installer/updaterEngine/common/UpdaterEngineHelper;->-$$Nest$smsetUpdateEngineObject()V

    invoke-static {}, Lcom/motorola/ccc/ota/installer/updaterEngine/common/UpdaterEngineHelper;->-$$Nest$sfgetupdateEngine()Ljava/lang/Class;

    move-result-object v3

    const-string v4, "verifyPayloadMetadata"

    const/4 v5, 0x1

    new-array v5, v5, [Ljava/lang/Class;

    const-class v6, Ljava/lang/String;

    aput-object v6, v5, v2

    invoke-virtual {v3, v4, v5}, Ljava/lang/Class;->getDeclaredMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v3

    invoke-static {}, Lcom/motorola/ccc/ota/installer/updaterEngine/common/UpdaterEngineHelper;->-$$Nest$sfgetmUpdateEngine()Ljava/lang/Object;

    move-result-object v4

    iget-object v5, p0, Lcom/motorola/ccc/ota/installer/updaterEngine/common/UpdaterEngineHelper$2;->val$payloadMetaDataFilePath:Ljava/lang/String;

    filled-new-array {v5}, [Ljava/lang/Object;

    move-result-object v5

    invoke-virtual {v3, v4, v5}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/Boolean;

    invoke-virtual {v3}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v2
    :try_end_0
    .catch Ljava/lang/ClassNotFoundException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/lang/NoSuchMethodException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/lang/InstantiationException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/lang/IllegalAccessException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/lang/reflect/InvocationTargetException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception v3

    new-instance v4, Ljava/lang/StringBuilder;

    const-string v5, "exception in UpdaterEngineHelper:verifyPayloadMetadata "

    invoke-direct {v4, v5}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v4, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v1, v3}, Lcom/motorola/ccc/ota/utils/Logger;->error(Ljava/lang/String;Ljava/lang/String;)V

    :goto_0
    new-instance v3, Ljava/lang/StringBuilder;

    const-string v4, "UpdaterEngHelper:verifyPayloadMetadata:isVerifySuccessful="

    invoke-direct {v3, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v1, v3}, Lcom/motorola/ccc/ota/utils/Logger;->debug(Ljava/lang/String;Ljava/lang/String;)V

    iget-boolean p0, p0, Lcom/motorola/ccc/ota/installer/updaterEngine/common/UpdaterEngineHelper$2;->val$isVABVerificationRequest:Z

    if-eqz p0, :cond_0

    invoke-static {v0, v2}, Lcom/motorola/ccc/ota/utils/UpgradeUtilMethods;->sendActionVerifyPayloadStatus(Landroid/content/Context;Z)V

    return-void

    :cond_0
    if-eqz v2, :cond_1

    sget-object p0, Lcom/motorola/otalib/common/utils/UpgradeUtils$DownloadStatus;->STATUS_OK:Lcom/motorola/otalib/common/utils/UpgradeUtils$DownloadStatus;

    const/4 v1, 0x0

    const-string v2, "success"

    invoke-static {v0, v2, p0, v1}, Lcom/motorola/ccc/ota/utils/UpgradeUtilMethods;->sendActionVerifyPayloadStatus(Landroid/content/Context;Ljava/lang/String;Lcom/motorola/otalib/common/utils/UpgradeUtils$DownloadStatus;Ljava/lang/String;)V

    goto :goto_1

    :cond_1
    sget-object p0, Lcom/motorola/otalib/common/utils/UpgradeUtils$DownloadStatus;->STATUS_FAIL_PAYLOAD_METADATA_VERIFY:Lcom/motorola/otalib/common/utils/UpgradeUtils$DownloadStatus;

    const-string v1, "PAYLOAD_METADATA_VERIFICATION_FAILED."

    const-string v2, "Payload metadata verification failed "

    invoke-static {v0, v2, p0, v1}, Lcom/motorola/ccc/ota/utils/UpgradeUtilMethods;->sendActionVerifyPayloadStatus(Landroid/content/Context;Ljava/lang/String;Lcom/motorola/otalib/common/utils/UpgradeUtils$DownloadStatus;Ljava/lang/String;)V

    :goto_1
    return-void
.end method
