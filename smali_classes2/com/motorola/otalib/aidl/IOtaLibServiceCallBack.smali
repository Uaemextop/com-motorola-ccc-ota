.class public interface abstract Lcom/motorola/otalib/aidl/IOtaLibServiceCallBack;
.super Ljava/lang/Object;
.source "IOtaLibServiceCallBack.java"

# interfaces
.implements Landroid/os/IInterface;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/motorola/otalib/aidl/IOtaLibServiceCallBack$Stub;,
        Lcom/motorola/otalib/aidl/IOtaLibServiceCallBack$Default;
    }
.end annotation


# static fields
.field public static final DESCRIPTOR:Ljava/lang/String; = "com.motorola.otalib.aidl.IOtaLibServiceCallBack"


# virtual methods
.method public abstract onConfigUpdateStatus(ZLjava/lang/String;)V
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/os/RemoteException;
        }
    .end annotation
.end method

.method public abstract onStatusUpdate(Ljava/lang/String;ZLjava/lang/String;)V
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/os/RemoteException;
        }
    .end annotation
.end method
