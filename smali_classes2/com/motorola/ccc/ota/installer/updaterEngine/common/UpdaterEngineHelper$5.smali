.class Lcom/motorola/ccc/ota/installer/updaterEngine/common/UpdaterEngineHelper$5;
.super Ljava/lang/Object;
.source "UpdaterEngineHelper.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/motorola/ccc/ota/installer/updaterEngine/common/UpdaterEngineHelper;->cleanupAppliedPayload()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# direct methods
.method constructor <init>()V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 4

    const-string p0, "UpdaterEngineHelper:cleanupAppliedPayload"

    const-string v0, "OtaApp"

    invoke-static {v0, p0}, Lcom/motorola/ccc/ota/utils/Logger;->debug(Ljava/lang/String;Ljava/lang/String;)V

    :try_start_0
    invoke-static {}, Lcom/motorola/ccc/ota/installer/updaterEngine/common/UpdaterEngineHelper;->-$$Nest$smsetUpdateEngineObject()V

    invoke-static {}, Lcom/motorola/ccc/ota/installer/updaterEngine/common/UpdaterEngineHelper;->-$$Nest$sfgetupdateEngine()Ljava/lang/Class;

    move-result-object p0

    const-string v1, "cleanupAppliedPayload"

    const/4 v2, 0x0

    new-array v3, v2, [Ljava/lang/Class;

    invoke-virtual {p0, v1, v3}, Ljava/lang/Class;->getDeclaredMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object p0

    invoke-static {}, Lcom/motorola/ccc/ota/installer/updaterEngine/common/UpdaterEngineHelper;->-$$Nest$sfgetmUpdateEngine()Ljava/lang/Object;

    move-result-object v1

    new-array v2, v2, [Ljava/lang/Object;

    invoke-virtual {p0, v1, v2}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Ljava/lang/Integer;

    invoke-virtual {p0}, Ljava/lang/Integer;->intValue()I

    move-result p0
    :try_end_0
    .catch Ljava/lang/ClassNotFoundException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/lang/NoSuchMethodException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/lang/InstantiationException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/lang/IllegalAccessException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/lang/reflect/InvocationTargetException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception p0

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "exceptionUpdaterEngineHelper:cleanupAppliedPayload "

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-static {v0, p0}, Lcom/motorola/ccc/ota/utils/Logger;->error(Ljava/lang/String;Ljava/lang/String;)V

    sget p0, Lcom/motorola/otalib/common/utils/UpgradeUtils$MergeStatus;->APPLY_PAYLOAD_FAILURE:I

    :goto_0
    invoke-static {}, Lcom/motorola/ccc/ota/env/OtaApplication;->getGlobalContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0, p0}, Lcom/motorola/ccc/ota/utils/UpgradeUtilMethods;->sendCleanupAppliedPayloadResult(Landroid/content/Context;I)V

    return-void
.end method
