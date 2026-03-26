.class public Lcom/motorola/ccc/ota/installer/InstallTypeResolver;
.super Ljava/lang/Object;
.source "InstallTypeResolver.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/motorola/ccc/ota/installer/InstallTypeResolver$Installer;,
        Lcom/motorola/ccc/ota/installer/InstallTypeResolver$InstallerType;
    }
.end annotation


# static fields
.field private static installerType:Lcom/motorola/ccc/ota/installer/InstallTypeResolver$Installer;


# direct methods
.method static constructor <clinit>()V
    .locals 0

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static getInstallTypeHandler(Lcom/motorola/otalib/common/Environment/ApplicationEnv;Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database;Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database$Descriptor;Lcom/motorola/ccc/ota/CusSM;)Lcom/motorola/ccc/ota/installer/InstallTypeResolver$Installer;
    .locals 7

    if-eqz p3, :cond_1

    invoke-interface {p3}, Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database$Descriptor;->getMeta()Lcom/motorola/otalib/common/metaData/MetaData;

    move-result-object v0

    if-nez v0, :cond_0

    goto :goto_0

    :cond_0
    invoke-interface {p3}, Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database$Descriptor;->getMeta()Lcom/motorola/otalib/common/metaData/MetaData;

    move-result-object v0

    invoke-virtual {v0}, Lcom/motorola/otalib/common/metaData/MetaData;->getAbInstallType()Ljava/lang/String;

    move-result-object v1

    move-object v2, p0

    move-object v3, p1

    move-object v4, p2

    move-object v5, p3

    move-object v6, p4

    invoke-static/range {v1 .. v6}, Lcom/motorola/ccc/ota/installer/updaterEngine/UpdaterEngineInstaller;->builder(Ljava/lang/String;Lcom/motorola/otalib/common/Environment/ApplicationEnv;Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database;Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database$Descriptor;Lcom/motorola/ccc/ota/CusSM;)Lcom/motorola/ccc/ota/installer/updaterEngine/UpdaterEngineInstaller;

    move-result-object p0

    sput-object p0, Lcom/motorola/ccc/ota/installer/InstallTypeResolver;->installerType:Lcom/motorola/ccc/ota/installer/InstallTypeResolver$Installer;

    return-object p0

    :cond_1
    :goto_0
    const/4 p0, 0x0

    return-object p0
.end method
