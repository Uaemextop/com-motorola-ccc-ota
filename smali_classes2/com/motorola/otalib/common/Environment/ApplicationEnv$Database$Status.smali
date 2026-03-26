.class public interface abstract Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database$Status;
.super Ljava/lang/Object;
.source "ApplicationEnv.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x609
    name = "Status"
.end annotation


# virtual methods
.method public abstract getDeviceVersion()Ljava/lang/String;
.end method

.method public abstract getId()I
.end method

.method public abstract getInfo()Ljava/lang/String;
.end method

.method public abstract getReportingTag()Ljava/lang/String;
.end method

.method public abstract getRepository()Ljava/lang/String;
.end method

.method public abstract getSourceSha1()Ljava/lang/String;
.end method

.method public abstract getState()Ljava/lang/String;
.end method

.method public abstract getStatus()Ljava/lang/String;
.end method

.method public abstract getTargetSha1()Ljava/lang/String;
.end method

.method public abstract getTime()J
.end method

.method public abstract getTrackingID()Ljava/lang/String;
.end method
