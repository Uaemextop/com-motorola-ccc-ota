.class public interface abstract Lcom/motorola/otalib/common/Environment/ApplicationEnv;
.super Ljava/lang/Object;
.source "ApplicationEnv.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/motorola/otalib/common/Environment/ApplicationEnv$FotaServices;,
        Lcom/motorola/otalib/common/Environment/ApplicationEnv$Services;,
        Lcom/motorola/otalib/common/Environment/ApplicationEnv$Utilities;,
        Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database;,
        Lcom/motorola/otalib/common/Environment/ApplicationEnv$PackageState;
    }
.end annotation


# static fields
.field public static final PollingInitiated:I = 0x2

.field public static final clientInitiated:I = 0x1

.field public static final serverInitiated:I = 0x3


# virtual methods
.method public abstract createDatabase()Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database;
.end method

.method public abstract getFotaServices()Lcom/motorola/otalib/common/Environment/ApplicationEnv$FotaServices;
.end method

.method public abstract getServices()Lcom/motorola/otalib/common/Environment/ApplicationEnv$Services;
.end method

.method public abstract getUtilities()Lcom/motorola/otalib/common/Environment/ApplicationEnv$Utilities;
.end method
