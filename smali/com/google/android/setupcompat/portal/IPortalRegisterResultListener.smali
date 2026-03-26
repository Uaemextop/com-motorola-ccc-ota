.class public interface abstract Lcom/google/android/setupcompat/portal/IPortalRegisterResultListener;
.super Ljava/lang/Object;
.source "IPortalRegisterResultListener.java"

# interfaces
.implements Landroid/os/IInterface;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/google/android/setupcompat/portal/IPortalRegisterResultListener$Stub;,
        Lcom/google/android/setupcompat/portal/IPortalRegisterResultListener$Default;
    }
.end annotation


# virtual methods
.method public abstract onResult(Landroid/os/Bundle;)V
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/os/RemoteException;
        }
    .end annotation
.end method
