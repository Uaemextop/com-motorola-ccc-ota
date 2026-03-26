.class public Lcom/motorola/ccc/ota/installer/updaterEngine/common/UEBinder;
.super Ljava/lang/Object;
.source "UEBinder.java"


# static fields
.field private static IS_BINDED:Z


# direct methods
.method public constructor <init>()V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static checkAndBindWithUE(Lcom/motorola/ccc/ota/installer/updaterEngine/common/UpdateEngineCallbacker;)V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/NoSuchMethodException;,
            Ljava/lang/ClassNotFoundException;,
            Ljava/lang/IllegalAccessException;,
            Ljava/lang/InstantiationException;,
            Ljava/lang/reflect/InvocationTargetException;
        }
    .end annotation

    const/4 v0, 0x1

    invoke-static {v0}, Lcom/motorola/ccc/ota/installer/updaterEngine/common/UEBinder;->setBinded(Z)V

    invoke-static {p0}, Lcom/motorola/ccc/ota/installer/updaterEngine/common/UpdaterEngineHelper;->bindWithUpdaterEngine(Lcom/motorola/ccc/ota/installer/updaterEngine/common/UpdateEngineCallbacker;)V

    return-void
.end method

.method public static isBinded()Z
    .locals 1

    sget-boolean v0, Lcom/motorola/ccc/ota/installer/updaterEngine/common/UEBinder;->IS_BINDED:Z

    return v0
.end method

.method public static resetBinded()V
    .locals 1

    invoke-static {}, Lcom/motorola/ccc/ota/installer/updaterEngine/common/UpdaterEngineHelper;->unbindUpdateEngine()V

    const/4 v0, 0x0

    invoke-static {v0}, Lcom/motorola/ccc/ota/installer/updaterEngine/common/UEBinder;->setBinded(Z)V

    return-void
.end method

.method public static setBinded(Z)V
    .locals 0

    sput-boolean p0, Lcom/motorola/ccc/ota/installer/updaterEngine/common/UEBinder;->IS_BINDED:Z

    return-void
.end method
