.class public interface abstract Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database;
.super Ljava/lang/Object;
.source "ApplicationEnv.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/motorola/otalib/common/Environment/ApplicationEnv;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x609
    name = "Database"
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database$Status;,
        Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database$Descriptor;
    }
.end annotation


# virtual methods
.method public abstract clear_status()V
.end method

.method public abstract close()V
.end method

.method public abstract getDescription(Ljava/lang/String;)Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database$Descriptor;
.end method

.method public abstract getVersions()Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end method

.method public abstract get_status()Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database$Status;
.end method

.method public abstract get_status(I)Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database$Status;
.end method

.method public abstract insert(Ljava/lang/String;Ljava/lang/String;Lcom/motorola/otalib/common/metaData/MetaData;Ljava/lang/String;Ljava/lang/String;)Z
.end method

.method public abstract remove(Ljava/lang/String;)V
.end method

.method public abstract remove_status(I)V
.end method

.method public abstract setState(Ljava/lang/String;Lcom/motorola/otalib/common/Environment/ApplicationEnv$PackageState;Ljava/lang/String;)Z
.end method

.method public abstract setState(Ljava/lang/String;Lcom/motorola/otalib/common/Environment/ApplicationEnv$PackageState;ZLjava/lang/String;Ljava/lang/String;)Z
.end method

.method public abstract setState(Ljava/lang/String;Lcom/motorola/otalib/common/Environment/ApplicationEnv$PackageState;ZLjava/lang/String;Ljava/lang/String;Ljava/lang/String;)Z
.end method

.method public abstract setStatus(Ljava/lang/String;Lcom/motorola/otalib/common/metaData/MetaData;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
.end method

.method public abstract setVersionState(Ljava/lang/String;Lcom/motorola/otalib/common/Environment/ApplicationEnv$PackageState;Ljava/lang/String;)Z
.end method

.method public abstract update_column_vt(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Z
.end method
