.class public abstract Lcom/google/android/setupcompat/portal/IPortalProgressService$Stub;
.super Landroid/os/Binder;
.source "IPortalProgressService.java"

# interfaces
.implements Lcom/google/android/setupcompat/portal/IPortalProgressService;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/google/android/setupcompat/portal/IPortalProgressService;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x409
    name = "Stub"
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/google/android/setupcompat/portal/IPortalProgressService$Stub$Proxy;
    }
.end annotation


# static fields
.field private static final DESCRIPTOR:Ljava/lang/String; = "com.google.android.setupcompat.portal.IPortalProgressService"

.field static final TRANSACTION_onAllowMobileData:I = 0x4

.field static final TRANSACTION_onGetRemainingValues:I = 0x5

.field static final TRANSACTION_onPortalSessionStart:I = 0x1

.field static final TRANSACTION_onSetCallback:I = 0x2

.field static final TRANSACTION_onSuspend:I = 0x3


# direct methods
.method public constructor <init>()V
    .locals 1

    invoke-direct {p0}, Landroid/os/Binder;-><init>()V

    const-string v0, "com.google.android.setupcompat.portal.IPortalProgressService"

    invoke-virtual {p0, p0, v0}, Lcom/google/android/setupcompat/portal/IPortalProgressService$Stub;->attachInterface(Landroid/os/IInterface;Ljava/lang/String;)V

    return-void
.end method

.method public static asInterface(Landroid/os/IBinder;)Lcom/google/android/setupcompat/portal/IPortalProgressService;
    .locals 2

    if-nez p0, :cond_0

    const/4 p0, 0x0

    return-object p0

    :cond_0
    const-string v0, "com.google.android.setupcompat.portal.IPortalProgressService"

    invoke-interface {p0, v0}, Landroid/os/IBinder;->queryLocalInterface(Ljava/lang/String;)Landroid/os/IInterface;

    move-result-object v0

    if-eqz v0, :cond_1

    instance-of v1, v0, Lcom/google/android/setupcompat/portal/IPortalProgressService;

    if-eqz v1, :cond_1

    check-cast v0, Lcom/google/android/setupcompat/portal/IPortalProgressService;

    return-object v0

    :cond_1
    new-instance v0, Lcom/google/android/setupcompat/portal/IPortalProgressService$Stub$Proxy;

    invoke-direct {v0, p0}, Lcom/google/android/setupcompat/portal/IPortalProgressService$Stub$Proxy;-><init>(Landroid/os/IBinder;)V

    return-object v0
.end method

.method public static getDefaultImpl()Lcom/google/android/setupcompat/portal/IPortalProgressService;
    .locals 1

    sget-object v0, Lcom/google/android/setupcompat/portal/IPortalProgressService$Stub$Proxy;->sDefaultImpl:Lcom/google/android/setupcompat/portal/IPortalProgressService;

    return-object v0
.end method

.method public static setDefaultImpl(Lcom/google/android/setupcompat/portal/IPortalProgressService;)Z
    .locals 1

    sget-object v0, Lcom/google/android/setupcompat/portal/IPortalProgressService$Stub$Proxy;->sDefaultImpl:Lcom/google/android/setupcompat/portal/IPortalProgressService;

    if-nez v0, :cond_0

    if-eqz p0, :cond_0

    sput-object p0, Lcom/google/android/setupcompat/portal/IPortalProgressService$Stub$Proxy;->sDefaultImpl:Lcom/google/android/setupcompat/portal/IPortalProgressService;

    const/4 p0, 0x1

    return p0

    :cond_0
    const/4 p0, 0x0

    return p0
.end method


# virtual methods
.method public asBinder()Landroid/os/IBinder;
    .locals 0

    return-object p0
.end method

.method public onTransact(ILandroid/os/Parcel;Landroid/os/Parcel;I)Z
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/os/RemoteException;
        }
    .end annotation

    const/4 v0, 0x1

    const-string v1, "com.google.android.setupcompat.portal.IPortalProgressService"

    if-eq p1, v0, :cond_7

    const/4 v2, 0x2

    if-eq p1, v2, :cond_6

    const/4 v2, 0x3

    if-eq p1, v2, :cond_5

    const/4 v2, 0x4

    const/4 v3, 0x0

    if-eq p1, v2, :cond_3

    const/4 v2, 0x5

    if-eq p1, v2, :cond_1

    const v2, 0x5f4e5446

    if-eq p1, v2, :cond_0

    invoke-super {p0, p1, p2, p3, p4}, Landroid/os/Binder;->onTransact(ILandroid/os/Parcel;Landroid/os/Parcel;I)Z

    move-result p0

    return p0

    :cond_0
    invoke-virtual {p3, v1}, Landroid/os/Parcel;->writeString(Ljava/lang/String;)V

    return v0

    :cond_1
    invoke-virtual {p2, v1}, Landroid/os/Parcel;->enforceInterface(Ljava/lang/String;)V

    invoke-virtual {p0}, Lcom/google/android/setupcompat/portal/IPortalProgressService$Stub;->onGetRemainingValues()Landroid/os/Bundle;

    move-result-object p0

    invoke-virtual {p3}, Landroid/os/Parcel;->writeNoException()V

    if-eqz p0, :cond_2

    invoke-virtual {p3, v0}, Landroid/os/Parcel;->writeInt(I)V

    invoke-virtual {p0, p3, v0}, Landroid/os/Bundle;->writeToParcel(Landroid/os/Parcel;I)V

    goto :goto_0

    :cond_2
    invoke-virtual {p3, v3}, Landroid/os/Parcel;->writeInt(I)V

    :goto_0
    return v0

    :cond_3
    invoke-virtual {p2, v1}, Landroid/os/Parcel;->enforceInterface(Ljava/lang/String;)V

    invoke-virtual {p2}, Landroid/os/Parcel;->readInt()I

    move-result p1

    if-eqz p1, :cond_4

    move v3, v0

    :cond_4
    invoke-virtual {p0, v3}, Lcom/google/android/setupcompat/portal/IPortalProgressService$Stub;->onAllowMobileData(Z)V

    return v0

    :cond_5
    invoke-virtual {p2, v1}, Landroid/os/Parcel;->enforceInterface(Ljava/lang/String;)V

    invoke-virtual {p0}, Lcom/google/android/setupcompat/portal/IPortalProgressService$Stub;->onSuspend()V

    return v0

    :cond_6
    invoke-virtual {p2, v1}, Landroid/os/Parcel;->enforceInterface(Ljava/lang/String;)V

    invoke-virtual {p2}, Landroid/os/Parcel;->readStrongBinder()Landroid/os/IBinder;

    move-result-object p1

    invoke-static {p1}, Lcom/google/android/setupcompat/portal/IPortalProgressCallback$Stub;->asInterface(Landroid/os/IBinder;)Lcom/google/android/setupcompat/portal/IPortalProgressCallback;

    move-result-object p1

    invoke-virtual {p0, p1}, Lcom/google/android/setupcompat/portal/IPortalProgressService$Stub;->onSetCallback(Lcom/google/android/setupcompat/portal/IPortalProgressCallback;)V

    return v0

    :cond_7
    invoke-virtual {p2, v1}, Landroid/os/Parcel;->enforceInterface(Ljava/lang/String;)V

    invoke-virtual {p0}, Lcom/google/android/setupcompat/portal/IPortalProgressService$Stub;->onPortalSessionStart()V

    return v0
.end method
