.class public interface abstract Lcom/motorola/ccc/ota/aidl/IPollingManagerService;
.super Ljava/lang/Object;
.source "IPollingManagerService.java"

# interfaces
.implements Landroid/os/IInterface;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/motorola/ccc/ota/aidl/IPollingManagerService$Stub;,
        Lcom/motorola/ccc/ota/aidl/IPollingManagerService$Default;
    }
.end annotation


# static fields
.field public static final DESCRIPTOR:Ljava/lang/String; = "com.motorola.ccc.ota.aidl.IPollingManagerService"


# virtual methods
.method public abstract registerApp(ILjava/lang/String;Ljava/lang/String;[Ljava/lang/String;JZZ)I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/os/RemoteException;
        }
    .end annotation
.end method

.method public abstract unregisterApp(ILjava/lang/String;)I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/os/RemoteException;
        }
    .end annotation
.end method
