.class public abstract Lcom/google/android/gms/internal/nh$a;
.super Landroid/os/Binder;

# interfaces
.implements Lcom/google/android/gms/internal/nh;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/google/android/gms/internal/nh;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x409
    name = "a"
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/google/android/gms/internal/nh$a$a;
    }
.end annotation


# direct methods
.method public static bC(Landroid/os/IBinder;)Lcom/google/android/gms/internal/nh;
    .locals 2

    if-nez p0, :cond_0

    const/4 p0, 0x0

    return-object p0

    :cond_0
    const-string v0, "com.google.android.gms.playlog.internal.IPlayLogService"

    invoke-interface {p0, v0}, Landroid/os/IBinder;->queryLocalInterface(Ljava/lang/String;)Landroid/os/IInterface;

    move-result-object v0

    if-eqz v0, :cond_1

    instance-of v1, v0, Lcom/google/android/gms/internal/nh;

    if-eqz v1, :cond_1

    check-cast v0, Lcom/google/android/gms/internal/nh;

    return-object v0

    :cond_1
    new-instance v0, Lcom/google/android/gms/internal/nh$a$a;

    invoke-direct {v0, p0}, Lcom/google/android/gms/internal/nh$a$a;-><init>(Landroid/os/IBinder;)V

    return-object v0
.end method


# virtual methods
.method public onTransact(ILandroid/os/Parcel;Landroid/os/Parcel;I)Z
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/os/RemoteException;
        }
    .end annotation

    const/4 v0, 0x2

    const/4 v1, 0x0

    const/4 v2, 0x1

    const-string v3, "com.google.android.gms.playlog.internal.IPlayLogService"

    if-eq p1, v0, :cond_5

    const/4 v0, 0x3

    if-eq p1, v0, :cond_3

    const/4 v0, 0x4

    if-eq p1, v0, :cond_1

    const v0, 0x5f4e5446

    if-eq p1, v0, :cond_0

    invoke-super {p0, p1, p2, p3, p4}, Landroid/os/Binder;->onTransact(ILandroid/os/Parcel;Landroid/os/Parcel;I)Z

    move-result p0

    return p0

    :cond_0
    invoke-virtual {p3, v3}, Landroid/os/Parcel;->writeString(Ljava/lang/String;)V

    return v2

    :cond_1
    invoke-virtual {p2, v3}, Landroid/os/Parcel;->enforceInterface(Ljava/lang/String;)V

    invoke-virtual {p2}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p2}, Landroid/os/Parcel;->readInt()I

    move-result p3

    if-eqz p3, :cond_2

    sget-object p3, Lcom/google/android/gms/internal/nm;->CREATOR:Lcom/google/android/gms/internal/nn;

    invoke-virtual {p3, p2}, Lcom/google/android/gms/internal/nn;->cY(Landroid/os/Parcel;)Lcom/google/android/gms/internal/nm;

    move-result-object v1

    :cond_2
    invoke-virtual {p2}, Landroid/os/Parcel;->createByteArray()[B

    move-result-object p2

    invoke-virtual {p0, p1, v1, p2}, Lcom/google/android/gms/internal/nh$a;->a(Ljava/lang/String;Lcom/google/android/gms/internal/nm;[B)V

    return v2

    :cond_3
    invoke-virtual {p2, v3}, Landroid/os/Parcel;->enforceInterface(Ljava/lang/String;)V

    invoke-virtual {p2}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p2}, Landroid/os/Parcel;->readInt()I

    move-result p3

    if-eqz p3, :cond_4

    sget-object p3, Lcom/google/android/gms/internal/nm;->CREATOR:Lcom/google/android/gms/internal/nn;

    invoke-virtual {p3, p2}, Lcom/google/android/gms/internal/nn;->cY(Landroid/os/Parcel;)Lcom/google/android/gms/internal/nm;

    move-result-object v1

    :cond_4
    sget-object p3, Lcom/google/android/gms/internal/ni;->CREATOR:Lcom/google/android/gms/internal/nk;

    invoke-virtual {p2, p3}, Landroid/os/Parcel;->createTypedArrayList(Landroid/os/Parcelable$Creator;)Ljava/util/ArrayList;

    move-result-object p2

    invoke-virtual {p0, p1, v1, p2}, Lcom/google/android/gms/internal/nh$a;->a(Ljava/lang/String;Lcom/google/android/gms/internal/nm;Ljava/util/List;)V

    return v2

    :cond_5
    invoke-virtual {p2, v3}, Landroid/os/Parcel;->enforceInterface(Ljava/lang/String;)V

    invoke-virtual {p2}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p2}, Landroid/os/Parcel;->readInt()I

    move-result p3

    if-eqz p3, :cond_6

    sget-object p3, Lcom/google/android/gms/internal/nm;->CREATOR:Lcom/google/android/gms/internal/nn;

    invoke-virtual {p3, p2}, Lcom/google/android/gms/internal/nn;->cY(Landroid/os/Parcel;)Lcom/google/android/gms/internal/nm;

    move-result-object p3

    goto :goto_0

    :cond_6
    move-object p3, v1

    :goto_0
    invoke-virtual {p2}, Landroid/os/Parcel;->readInt()I

    move-result p4

    if-eqz p4, :cond_7

    sget-object p4, Lcom/google/android/gms/internal/ni;->CREATOR:Lcom/google/android/gms/internal/nk;

    invoke-virtual {p4, p2}, Lcom/google/android/gms/internal/nk;->cX(Landroid/os/Parcel;)Lcom/google/android/gms/internal/ni;

    move-result-object v1

    :cond_7
    invoke-virtual {p0, p1, p3, v1}, Lcom/google/android/gms/internal/nh$a;->a(Ljava/lang/String;Lcom/google/android/gms/internal/nm;Lcom/google/android/gms/internal/ni;)V

    return v2
.end method
