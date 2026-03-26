.class public interface abstract Lcom/motorola/otalib/aidl/IDownloadService;
.super Ljava/lang/Object;
.source "IDownloadService.java"

# interfaces
.implements Landroid/os/IInterface;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/motorola/otalib/aidl/IDownloadService$Stub;,
        Lcom/motorola/otalib/aidl/IDownloadService$Default;
    }
.end annotation


# static fields
.field public static final DESCRIPTOR:Ljava/lang/String; = "com.motorola.otalib.aidl.IDownloadService"


# virtual methods
.method public abstract downloadRequest(Ljava/lang/String;Ljava/lang/String;)Z
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/os/RemoteException;
        }
    .end annotation
.end method

.method public abstract registerCallback(Ljava/lang/String;Lcom/motorola/otalib/aidl/IDownloadServiceCallback;)Z
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/os/RemoteException;
        }
    .end annotation
.end method

.method public abstract unregisterCallback(Ljava/lang/String;)V
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/os/RemoteException;
        }
    .end annotation
.end method
