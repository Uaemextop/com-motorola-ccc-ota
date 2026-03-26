.class public interface abstract Lcom/motorola/otalib/common/Environment/ApplicationEnv$Services;
.super Ljava/lang/Object;
.source "ApplicationEnv.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/motorola/otalib/common/Environment/ApplicationEnv;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x609
    name = "Services"
.end annotation


# virtual methods
.method public abstract getDeviceSha1()Ljava/lang/String;
.end method

.method public abstract isSDCardMounted()Ljava/lang/Boolean;
.end method

.method public abstract isSDCardPresent()Ljava/lang/Boolean;
.end method
