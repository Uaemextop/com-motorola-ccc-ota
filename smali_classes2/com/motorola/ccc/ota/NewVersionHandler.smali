.class public interface abstract Lcom/motorola/ccc/ota/NewVersionHandler;
.super Ljava/lang/Object;
.source "NewVersionHandler.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/motorola/ccc/ota/NewVersionHandler$ReturnCode;
    }
.end annotation


# virtual methods
.method public abstract handleNewVersion(Lcom/motorola/otalib/common/metaData/MetaData;Ljava/lang/String;Lcom/motorola/ccc/ota/sources/UpgradeSourceType;Ljava/lang/String;JLjava/lang/String;Ljava/lang/String;)Lcom/motorola/ccc/ota/NewVersionHandler$ReturnCode;
.end method
