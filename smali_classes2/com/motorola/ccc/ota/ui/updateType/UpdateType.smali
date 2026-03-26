.class public Lcom/motorola/ccc/ota/ui/updateType/UpdateType;
.super Ljava/lang/Object;
.source "UpdateType.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/motorola/ccc/ota/ui/updateType/UpdateType$DIFFUpdateType;,
        Lcom/motorola/ccc/ota/ui/updateType/UpdateType$UpdateTypeInterface;
    }
.end annotation


# direct methods
.method public constructor <init>()V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static getUpdateType(Ljava/lang/String;)Lcom/motorola/ccc/ota/ui/updateType/UpdateType$UpdateTypeInterface;
    .locals 3

    sget-object v0, Lcom/motorola/ccc/ota/ui/updateType/UpdateType$DIFFUpdateType;->DEFAULT:Lcom/motorola/ccc/ota/ui/updateType/UpdateType$DIFFUpdateType;

    :try_start_0
    invoke-static {p0}, Lcom/motorola/ccc/ota/ui/updateType/UpdateType$DIFFUpdateType;->valueOf(Ljava/lang/String;)Lcom/motorola/ccc/ota/ui/updateType/UpdateType$DIFFUpdateType;

    move-result-object v0
    :try_end_0
    .catch Ljava/lang/IllegalArgumentException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/lang/NullPointerException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception p0

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "Exception in UpdateType, getUpdateType: "

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    const-string v1, "OtaApp"

    invoke-static {v1, p0}, Lcom/motorola/ccc/ota/utils/Logger;->error(Ljava/lang/String;Ljava/lang/String;)V

    :goto_0
    sget-object p0, Lcom/motorola/ccc/ota/ui/updateType/UpdateType$1;->$SwitchMap$com$motorola$ccc$ota$ui$updateType$UpdateType$DIFFUpdateType:[I

    invoke-virtual {v0}, Lcom/motorola/ccc/ota/ui/updateType/UpdateType$DIFFUpdateType;->ordinal()I

    move-result v0

    aget p0, p0, v0

    const/4 v0, 0x1

    if-eq p0, v0, :cond_2

    const/4 v0, 0x2

    if-eq p0, v0, :cond_1

    const/4 v0, 0x3

    if-eq p0, v0, :cond_0

    new-instance p0, Lcom/motorola/ccc/ota/ui/updateType/MR;

    invoke-direct {p0}, Lcom/motorola/ccc/ota/ui/updateType/MR;-><init>()V

    return-object p0

    :cond_0
    new-instance p0, Lcom/motorola/ccc/ota/ui/updateType/MR;

    invoke-direct {p0}, Lcom/motorola/ccc/ota/ui/updateType/MR;-><init>()V

    return-object p0

    :cond_1
    new-instance p0, Lcom/motorola/ccc/ota/ui/updateType/SMR;

    invoke-direct {p0}, Lcom/motorola/ccc/ota/ui/updateType/SMR;-><init>()V

    return-object p0

    :cond_2
    new-instance p0, Lcom/motorola/ccc/ota/ui/updateType/OS;

    invoke-direct {p0}, Lcom/motorola/ccc/ota/ui/updateType/OS;-><init>()V

    return-object p0
.end method
