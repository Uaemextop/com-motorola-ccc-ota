.class public interface abstract Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database$Descriptor;
.super Ljava/lang/Object;
.source "ApplicationEnv.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x609
    name = "Descriptor"
.end annotation


# virtual methods
.method public abstract getInfo()Ljava/lang/String;
.end method

.method public abstract getMeta()Lcom/motorola/otalib/common/metaData/MetaData;
.end method

.method public abstract getRepository()Ljava/lang/String;
.end method

.method public abstract getState()Lcom/motorola/otalib/common/Environment/ApplicationEnv$PackageState;
.end method

.method public abstract getStatus()Ljava/lang/String;
.end method

.method public abstract getTime()I
.end method

.method public abstract getVersion()Ljava/lang/String;
.end method
