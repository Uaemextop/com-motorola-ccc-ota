.class public interface abstract Lcom/motorola/otalib/common/backoff/BackoffValueProvider;
.super Ljava/lang/Object;
.source "BackoffValueProvider.java"


# virtual methods
.method public abstract getNextTimeoutValue()J
.end method

.method public abstract getTimeOutValue(I)J
.end method

.method public abstract getTimeUnit()Ljava/util/concurrent/TimeUnit;
.end method

.method public abstract reset()V
.end method
