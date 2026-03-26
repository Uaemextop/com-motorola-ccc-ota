.class Lcom/motorola/ccc/ota/env/AndroidENV$Services;
.super Ljava/lang/Object;
.source "AndroidENV.java"

# interfaces
.implements Lcom/motorola/otalib/common/Environment/ApplicationEnv$Services;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/motorola/ccc/ota/env/AndroidENV;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = "Services"
.end annotation


# direct methods
.method constructor <init>()V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public getDeviceSha1()Ljava/lang/String;
    .locals 0

    sget-object p0, Lcom/motorola/ccc/ota/sources/UpgradeSourceType;->upgrade:Lcom/motorola/ccc/ota/sources/UpgradeSourceType;

    invoke-virtual {p0}, Lcom/motorola/ccc/ota/sources/UpgradeSourceType;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-static {p0}, Lcom/motorola/ccc/ota/utils/BuildPropReader;->getDeviceSha1(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method public isSDCardMounted()Ljava/lang/Boolean;
    .locals 1

    const-string p0, "mounted"

    invoke-static {}, Landroid/os/Environment;->getExternalStorageState()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object p0

    return-object p0
.end method

.method public isSDCardPresent()Ljava/lang/Boolean;
    .locals 1

    const-string p0, "removed"

    invoke-static {}, Landroid/os/Environment;->getExternalStorageState()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    xor-int/lit8 p0, p0, 0x1

    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object p0

    return-object p0
.end method
