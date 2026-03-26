.class public abstract Lcom/google/android/gms/internal/lx$a;
.super Landroid/os/Binder;

# interfaces
.implements Lcom/google/android/gms/internal/lx;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/google/android/gms/internal/lx;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x409
    name = "a"
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/google/android/gms/internal/lx$a$a;
    }
.end annotation


# direct methods
.method public static aK(Landroid/os/IBinder;)Lcom/google/android/gms/internal/lx;
    .locals 2

    if-nez p0, :cond_0

    const/4 p0, 0x0

    return-object p0

    :cond_0
    const-string v0, "com.google.android.gms.location.internal.IGoogleLocationManagerService"

    invoke-interface {p0, v0}, Landroid/os/IBinder;->queryLocalInterface(Ljava/lang/String;)Landroid/os/IInterface;

    move-result-object v0

    if-eqz v0, :cond_1

    instance-of v1, v0, Lcom/google/android/gms/internal/lx;

    if-eqz v1, :cond_1

    check-cast v0, Lcom/google/android/gms/internal/lx;

    return-object v0

    :cond_1
    new-instance v0, Lcom/google/android/gms/internal/lx$a$a;

    invoke-direct {v0, p0}, Lcom/google/android/gms/internal/lx$a$a;-><init>(Landroid/os/IBinder;)V

    return-object v0
.end method


# virtual methods
.method public onTransact(ILandroid/os/Parcel;Landroid/os/Parcel;I)Z
    .locals 11
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/os/RemoteException;
        }
    .end annotation

    const/16 v0, 0x19

    const-string v1, "com.google.android.gms.location.internal.IGoogleLocationManagerService"

    const/4 v2, 0x1

    const/4 v3, 0x0

    if-eq p1, v0, :cond_36

    const/16 v0, 0x1a

    if-eq p1, v0, :cond_34

    const/16 v0, 0x22

    const/4 v4, 0x0

    if-eq p1, v0, :cond_32

    const/16 v0, 0x2a

    if-eq p1, v0, :cond_30

    const v0, 0x5f4e5446

    if-eq p1, v0, :cond_2f

    packed-switch p1, :pswitch_data_0

    packed-switch p1, :pswitch_data_1

    invoke-super {p0, p1, p2, p3, p4}, Landroid/os/Binder;->onTransact(ILandroid/os/Parcel;Landroid/os/Parcel;I)Z

    move-result p0

    return p0

    :pswitch_0
    invoke-virtual {p2, v1}, Landroid/os/Parcel;->enforceInterface(Ljava/lang/String;)V

    invoke-virtual {p2}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {p2}, Landroid/os/Parcel;->readInt()I

    move-result p1

    if-eqz p1, :cond_0

    sget-object p1, Lcom/google/android/gms/maps/model/LatLngBounds;->CREATOR:Lcom/google/android/gms/maps/model/g;

    invoke-virtual {p1, p2}, Lcom/google/android/gms/maps/model/g;->cL(Landroid/os/Parcel;)Lcom/google/android/gms/maps/model/LatLngBounds;

    move-result-object p1

    move-object v5, p1

    goto :goto_0

    :cond_0
    move-object v5, v3

    :goto_0
    invoke-virtual {p2}, Landroid/os/Parcel;->readInt()I

    move-result p1

    if-eqz p1, :cond_1

    sget-object p1, Lcom/google/android/gms/internal/mf;->CREATOR:Lcom/google/android/gms/internal/mg;

    invoke-virtual {p1, p2}, Lcom/google/android/gms/internal/mg;->cx(Landroid/os/Parcel;)Lcom/google/android/gms/internal/mf;

    move-result-object p1

    move-object v6, p1

    goto :goto_1

    :cond_1
    move-object v6, v3

    :goto_1
    invoke-virtual {p2}, Landroid/os/Parcel;->readInt()I

    move-result p1

    if-eqz p1, :cond_2

    sget-object p1, Lcom/google/android/gms/internal/mx;->CREATOR:Lcom/google/android/gms/internal/my;

    invoke-virtual {p1, p2}, Lcom/google/android/gms/internal/my;->cF(Landroid/os/Parcel;)Lcom/google/android/gms/internal/mx;

    move-result-object v3

    :cond_2
    move-object v7, v3

    invoke-virtual {p2}, Landroid/os/Parcel;->readStrongBinder()Landroid/os/IBinder;

    move-result-object p1

    invoke-static {p1}, Lcom/google/android/gms/internal/mv$a;->aM(Landroid/os/IBinder;)Lcom/google/android/gms/internal/mv;

    move-result-object v8

    move-object v3, p0

    invoke-virtual/range {v3 .. v8}, Lcom/google/android/gms/internal/lx$a;->a(Ljava/lang/String;Lcom/google/android/gms/maps/model/LatLngBounds;Lcom/google/android/gms/internal/mf;Lcom/google/android/gms/internal/mx;Lcom/google/android/gms/internal/mv;)V

    invoke-virtual {p3}, Landroid/os/Parcel;->writeNoException()V

    return v2

    :pswitch_1
    invoke-virtual {p2, v1}, Landroid/os/Parcel;->enforceInterface(Ljava/lang/String;)V

    invoke-virtual {p0}, Lcom/google/android/gms/internal/lx$a;->lX()Landroid/os/IBinder;

    move-result-object p0

    invoke-virtual {p3}, Landroid/os/Parcel;->writeNoException()V

    invoke-virtual {p3, p0}, Landroid/os/Parcel;->writeStrongBinder(Landroid/os/IBinder;)V

    return v2

    :pswitch_2
    invoke-virtual {p2, v1}, Landroid/os/Parcel;->enforceInterface(Ljava/lang/String;)V

    invoke-virtual {p2}, Landroid/os/Parcel;->readInt()I

    move-result p1

    if-eqz p1, :cond_3

    sget-object p1, Lcom/google/android/gms/internal/ma;->CREATOR:Lcom/google/android/gms/internal/mb;

    invoke-virtual {p1, p2}, Lcom/google/android/gms/internal/mb;->cv(Landroid/os/Parcel;)Lcom/google/android/gms/internal/ma;

    move-result-object p1

    goto :goto_2

    :cond_3
    move-object p1, v3

    :goto_2
    invoke-virtual {p2}, Landroid/os/Parcel;->readInt()I

    move-result p4

    if-eqz p4, :cond_4

    sget-object p4, Landroid/app/PendingIntent;->CREATOR:Landroid/os/Parcelable$Creator;

    invoke-interface {p4, p2}, Landroid/os/Parcelable$Creator;->createFromParcel(Landroid/os/Parcel;)Ljava/lang/Object;

    move-result-object p2

    move-object v3, p2

    check-cast v3, Landroid/app/PendingIntent;

    :cond_4
    invoke-virtual {p0, p1, v3}, Lcom/google/android/gms/internal/lx$a;->a(Lcom/google/android/gms/internal/ma;Landroid/app/PendingIntent;)V

    invoke-virtual {p3}, Landroid/os/Parcel;->writeNoException()V

    return v2

    :pswitch_3
    invoke-virtual {p2, v1}, Landroid/os/Parcel;->enforceInterface(Ljava/lang/String;)V

    invoke-virtual {p2}, Landroid/os/Parcel;->readInt()I

    move-result p1

    if-eqz p1, :cond_5

    sget-object p1, Lcom/google/android/gms/internal/ma;->CREATOR:Lcom/google/android/gms/internal/mb;

    invoke-virtual {p1, p2}, Lcom/google/android/gms/internal/mb;->cv(Landroid/os/Parcel;)Lcom/google/android/gms/internal/ma;

    move-result-object v3

    :cond_5
    invoke-virtual {p2}, Landroid/os/Parcel;->readStrongBinder()Landroid/os/IBinder;

    move-result-object p1

    invoke-static {p1}, Lcom/google/android/gms/location/a$a;->aI(Landroid/os/IBinder;)Lcom/google/android/gms/location/a;

    move-result-object p1

    invoke-virtual {p0, v3, p1}, Lcom/google/android/gms/internal/lx$a;->a(Lcom/google/android/gms/internal/ma;Lcom/google/android/gms/location/a;)V

    invoke-virtual {p3}, Landroid/os/Parcel;->writeNoException()V

    return v2

    :pswitch_4
    invoke-virtual {p2, v1}, Landroid/os/Parcel;->enforceInterface(Ljava/lang/String;)V

    invoke-virtual {p0}, Lcom/google/android/gms/internal/lx$a;->lW()Landroid/os/IBinder;

    move-result-object p0

    invoke-virtual {p3}, Landroid/os/Parcel;->writeNoException()V

    invoke-virtual {p3, p0}, Landroid/os/Parcel;->writeStrongBinder(Landroid/os/IBinder;)V

    return v2

    :pswitch_5
    invoke-virtual {p2, v1}, Landroid/os/Parcel;->enforceInterface(Ljava/lang/String;)V

    invoke-virtual {p2}, Landroid/os/Parcel;->readInt()I

    move-result p1

    if-eqz p1, :cond_6

    sget-object p1, Lcom/google/android/gms/internal/mt;->CREATOR:Lcom/google/android/gms/internal/mu;

    invoke-virtual {p1, p2}, Lcom/google/android/gms/internal/mu;->cE(Landroid/os/Parcel;)Lcom/google/android/gms/internal/mt;

    move-result-object p1

    move-object v5, p1

    goto :goto_3

    :cond_6
    move-object v5, v3

    :goto_3
    invoke-virtual {p2}, Landroid/os/Parcel;->readInt()I

    move-result p1

    if-eqz p1, :cond_7

    sget-object p1, Lcom/google/android/gms/maps/model/LatLngBounds;->CREATOR:Lcom/google/android/gms/maps/model/g;

    invoke-virtual {p1, p2}, Lcom/google/android/gms/maps/model/g;->cL(Landroid/os/Parcel;)Lcom/google/android/gms/maps/model/LatLngBounds;

    move-result-object p1

    move-object v6, p1

    goto :goto_4

    :cond_7
    move-object v6, v3

    :goto_4
    invoke-virtual {p2}, Landroid/os/Parcel;->createStringArrayList()Ljava/util/ArrayList;

    move-result-object v7

    invoke-virtual {p2}, Landroid/os/Parcel;->readInt()I

    move-result p1

    if-eqz p1, :cond_8

    sget-object p1, Lcom/google/android/gms/internal/mx;->CREATOR:Lcom/google/android/gms/internal/my;

    invoke-virtual {p1, p2}, Lcom/google/android/gms/internal/my;->cF(Landroid/os/Parcel;)Lcom/google/android/gms/internal/mx;

    move-result-object v3

    :cond_8
    move-object v8, v3

    invoke-virtual {p2}, Landroid/os/Parcel;->readStrongBinder()Landroid/os/IBinder;

    move-result-object p1

    invoke-static {p1}, Lcom/google/android/gms/internal/mv$a;->aM(Landroid/os/IBinder;)Lcom/google/android/gms/internal/mv;

    move-result-object v9

    move-object v4, p0

    invoke-virtual/range {v4 .. v9}, Lcom/google/android/gms/internal/lx$a;->a(Lcom/google/android/gms/internal/mt;Lcom/google/android/gms/maps/model/LatLngBounds;Ljava/util/List;Lcom/google/android/gms/internal/mx;Lcom/google/android/gms/internal/mv;)V

    invoke-virtual {p3}, Landroid/os/Parcel;->writeNoException()V

    return v2

    :pswitch_6
    invoke-virtual {p2, v1}, Landroid/os/Parcel;->enforceInterface(Ljava/lang/String;)V

    invoke-virtual {p2}, Landroid/os/Parcel;->readInt()I

    move-result p1

    if-eqz p1, :cond_9

    sget-object p1, Lcom/google/android/gms/internal/mx;->CREATOR:Lcom/google/android/gms/internal/my;

    invoke-virtual {p1, p2}, Lcom/google/android/gms/internal/my;->cF(Landroid/os/Parcel;)Lcom/google/android/gms/internal/mx;

    move-result-object p1

    goto :goto_5

    :cond_9
    move-object p1, v3

    :goto_5
    invoke-virtual {p2}, Landroid/os/Parcel;->readInt()I

    move-result p4

    if-eqz p4, :cond_a

    sget-object p4, Landroid/app/PendingIntent;->CREATOR:Landroid/os/Parcelable$Creator;

    invoke-interface {p4, p2}, Landroid/os/Parcelable$Creator;->createFromParcel(Landroid/os/Parcel;)Ljava/lang/Object;

    move-result-object p2

    move-object v3, p2

    check-cast v3, Landroid/app/PendingIntent;

    :cond_a
    invoke-virtual {p0, p1, v3}, Lcom/google/android/gms/internal/lx$a;->b(Lcom/google/android/gms/internal/mx;Landroid/app/PendingIntent;)V

    invoke-virtual {p3}, Landroid/os/Parcel;->writeNoException()V

    return v2

    :pswitch_7
    invoke-virtual {p2, v1}, Landroid/os/Parcel;->enforceInterface(Ljava/lang/String;)V

    invoke-virtual {p2}, Landroid/os/Parcel;->readInt()I

    move-result p1

    if-eqz p1, :cond_b

    sget-object p1, Lcom/google/android/gms/internal/mh;->CREATOR:Lcom/google/android/gms/internal/mi;

    invoke-virtual {p1, p2}, Lcom/google/android/gms/internal/mi;->cy(Landroid/os/Parcel;)Lcom/google/android/gms/internal/mh;

    move-result-object p1

    goto :goto_6

    :cond_b
    move-object p1, v3

    :goto_6
    invoke-virtual {p2}, Landroid/os/Parcel;->readInt()I

    move-result p4

    if-eqz p4, :cond_c

    sget-object p4, Lcom/google/android/gms/internal/mx;->CREATOR:Lcom/google/android/gms/internal/my;

    invoke-virtual {p4, p2}, Lcom/google/android/gms/internal/my;->cF(Landroid/os/Parcel;)Lcom/google/android/gms/internal/mx;

    move-result-object p4

    goto :goto_7

    :cond_c
    move-object p4, v3

    :goto_7
    invoke-virtual {p2}, Landroid/os/Parcel;->readInt()I

    move-result v0

    if-eqz v0, :cond_d

    sget-object v0, Landroid/app/PendingIntent;->CREATOR:Landroid/os/Parcelable$Creator;

    invoke-interface {v0, p2}, Landroid/os/Parcelable$Creator;->createFromParcel(Landroid/os/Parcel;)Ljava/lang/Object;

    move-result-object p2

    move-object v3, p2

    check-cast v3, Landroid/app/PendingIntent;

    :cond_d
    invoke-virtual {p0, p1, p4, v3}, Lcom/google/android/gms/internal/lx$a;->a(Lcom/google/android/gms/internal/mh;Lcom/google/android/gms/internal/mx;Landroid/app/PendingIntent;)V

    invoke-virtual {p3}, Landroid/os/Parcel;->writeNoException()V

    return v2

    :pswitch_8
    invoke-virtual {p2, v1}, Landroid/os/Parcel;->enforceInterface(Ljava/lang/String;)V

    invoke-virtual {p2}, Landroid/os/Parcel;->readInt()I

    move-result p1

    if-eqz p1, :cond_e

    sget-object p1, Lcom/google/android/gms/maps/model/LatLngBounds;->CREATOR:Lcom/google/android/gms/maps/model/g;

    invoke-virtual {p1, p2}, Lcom/google/android/gms/maps/model/g;->cL(Landroid/os/Parcel;)Lcom/google/android/gms/maps/model/LatLngBounds;

    move-result-object p1

    move-object v5, p1

    goto :goto_8

    :cond_e
    move-object v5, v3

    :goto_8
    invoke-virtual {p2}, Landroid/os/Parcel;->readInt()I

    move-result v6

    invoke-virtual {p2}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {p2}, Landroid/os/Parcel;->readInt()I

    move-result p1

    if-eqz p1, :cond_f

    sget-object p1, Lcom/google/android/gms/internal/mj;->CREATOR:Lcom/google/android/gms/internal/mk;

    invoke-virtual {p1, p2}, Lcom/google/android/gms/internal/mk;->cz(Landroid/os/Parcel;)Lcom/google/android/gms/internal/mj;

    move-result-object p1

    move-object v8, p1

    goto :goto_9

    :cond_f
    move-object v8, v3

    :goto_9
    invoke-virtual {p2}, Landroid/os/Parcel;->readInt()I

    move-result p1

    if-eqz p1, :cond_10

    sget-object p1, Lcom/google/android/gms/internal/mx;->CREATOR:Lcom/google/android/gms/internal/my;

    invoke-virtual {p1, p2}, Lcom/google/android/gms/internal/my;->cF(Landroid/os/Parcel;)Lcom/google/android/gms/internal/mx;

    move-result-object v3

    :cond_10
    move-object v9, v3

    invoke-virtual {p2}, Landroid/os/Parcel;->readStrongBinder()Landroid/os/IBinder;

    move-result-object p1

    invoke-static {p1}, Lcom/google/android/gms/internal/mv$a;->aM(Landroid/os/IBinder;)Lcom/google/android/gms/internal/mv;

    move-result-object v10

    move-object v4, p0

    invoke-virtual/range {v4 .. v10}, Lcom/google/android/gms/internal/lx$a;->a(Lcom/google/android/gms/maps/model/LatLngBounds;ILjava/lang/String;Lcom/google/android/gms/internal/mj;Lcom/google/android/gms/internal/mx;Lcom/google/android/gms/internal/mv;)V

    invoke-virtual {p3}, Landroid/os/Parcel;->writeNoException()V

    return v2

    :pswitch_9
    invoke-virtual {p2, v1}, Landroid/os/Parcel;->enforceInterface(Ljava/lang/String;)V

    invoke-virtual {p2}, Landroid/os/Parcel;->readInt()I

    move-result p1

    if-eqz p1, :cond_11

    sget-object p1, Lcom/google/android/gms/internal/mr;->CREATOR:Landroid/os/Parcelable$Creator;

    invoke-interface {p1, p2}, Landroid/os/Parcelable$Creator;->createFromParcel(Landroid/os/Parcel;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lcom/google/android/gms/internal/mr;

    goto :goto_a

    :cond_11
    move-object p1, v3

    :goto_a
    invoke-virtual {p2}, Landroid/os/Parcel;->readInt()I

    move-result p4

    if-eqz p4, :cond_12

    sget-object p4, Lcom/google/android/gms/internal/mx;->CREATOR:Lcom/google/android/gms/internal/my;

    invoke-virtual {p4, p2}, Lcom/google/android/gms/internal/my;->cF(Landroid/os/Parcel;)Lcom/google/android/gms/internal/mx;

    move-result-object v3

    :cond_12
    invoke-virtual {p2}, Landroid/os/Parcel;->readStrongBinder()Landroid/os/IBinder;

    move-result-object p2

    invoke-static {p2}, Lcom/google/android/gms/internal/mv$a;->aM(Landroid/os/IBinder;)Lcom/google/android/gms/internal/mv;

    move-result-object p2

    invoke-virtual {p0, p1, v3, p2}, Lcom/google/android/gms/internal/lx$a;->a(Lcom/google/android/gms/internal/mr;Lcom/google/android/gms/internal/mx;Lcom/google/android/gms/internal/mv;)V

    invoke-virtual {p3}, Landroid/os/Parcel;->writeNoException()V

    return v2

    :pswitch_a
    invoke-virtual {p2, v1}, Landroid/os/Parcel;->enforceInterface(Ljava/lang/String;)V

    invoke-virtual {p2}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p0, p1}, Lcom/google/android/gms/internal/lx$a;->bW(Ljava/lang/String;)Landroid/location/Location;

    move-result-object p0

    invoke-virtual {p3}, Landroid/os/Parcel;->writeNoException()V

    if-eqz p0, :cond_13

    invoke-virtual {p3, v2}, Landroid/os/Parcel;->writeInt(I)V

    invoke-virtual {p0, p3, v2}, Landroid/location/Location;->writeToParcel(Landroid/os/Parcel;I)V

    goto :goto_b

    :cond_13
    invoke-virtual {p3, v4}, Landroid/os/Parcel;->writeInt(I)V

    :goto_b
    return v2

    :pswitch_b
    invoke-virtual {p2, v1}, Landroid/os/Parcel;->enforceInterface(Ljava/lang/String;)V

    invoke-virtual {p2}, Landroid/os/Parcel;->readInt()I

    move-result p1

    if-eqz p1, :cond_14

    sget-object p1, Lcom/google/android/gms/location/LocationRequest;->CREATOR:Lcom/google/android/gms/location/b;

    invoke-virtual {p1, p2}, Lcom/google/android/gms/location/b;->cs(Landroid/os/Parcel;)Lcom/google/android/gms/location/LocationRequest;

    move-result-object v3

    :cond_14
    invoke-virtual {p2}, Landroid/os/Parcel;->readStrongBinder()Landroid/os/IBinder;

    move-result-object p1

    invoke-static {p1}, Lcom/google/android/gms/location/a$a;->aI(Landroid/os/IBinder;)Lcom/google/android/gms/location/a;

    move-result-object p1

    invoke-virtual {p2}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    move-result-object p2

    invoke-virtual {p0, v3, p1, p2}, Lcom/google/android/gms/internal/lx$a;->a(Lcom/google/android/gms/location/LocationRequest;Lcom/google/android/gms/location/a;Ljava/lang/String;)V

    invoke-virtual {p3}, Landroid/os/Parcel;->writeNoException()V

    return v2

    :pswitch_c
    invoke-virtual {p2, v1}, Landroid/os/Parcel;->enforceInterface(Ljava/lang/String;)V

    invoke-virtual {p2}, Landroid/os/Parcel;->readInt()I

    move-result p1

    if-eqz p1, :cond_15

    sget-object p1, Lcom/google/android/gms/internal/mx;->CREATOR:Lcom/google/android/gms/internal/my;

    invoke-virtual {p1, p2}, Lcom/google/android/gms/internal/my;->cF(Landroid/os/Parcel;)Lcom/google/android/gms/internal/mx;

    move-result-object p1

    goto :goto_c

    :cond_15
    move-object p1, v3

    :goto_c
    invoke-virtual {p2}, Landroid/os/Parcel;->readInt()I

    move-result p4

    if-eqz p4, :cond_16

    sget-object p4, Landroid/app/PendingIntent;->CREATOR:Landroid/os/Parcelable$Creator;

    invoke-interface {p4, p2}, Landroid/os/Parcelable$Creator;->createFromParcel(Landroid/os/Parcel;)Ljava/lang/Object;

    move-result-object p2

    move-object v3, p2

    check-cast v3, Landroid/app/PendingIntent;

    :cond_16
    invoke-virtual {p0, p1, v3}, Lcom/google/android/gms/internal/lx$a;->a(Lcom/google/android/gms/internal/mx;Landroid/app/PendingIntent;)V

    invoke-virtual {p3}, Landroid/os/Parcel;->writeNoException()V

    return v2

    :pswitch_d
    invoke-virtual {p2, v1}, Landroid/os/Parcel;->enforceInterface(Ljava/lang/String;)V

    invoke-virtual {p2}, Landroid/os/Parcel;->readInt()I

    move-result p1

    if-eqz p1, :cond_17

    sget-object p1, Lcom/google/android/gms/internal/mn;->CREATOR:Lcom/google/android/gms/internal/mo;

    invoke-virtual {p1, p2}, Lcom/google/android/gms/internal/mo;->cB(Landroid/os/Parcel;)Lcom/google/android/gms/internal/mn;

    move-result-object p1

    goto :goto_d

    :cond_17
    move-object p1, v3

    :goto_d
    invoke-virtual {p2}, Landroid/os/Parcel;->readInt()I

    move-result p4

    if-eqz p4, :cond_18

    sget-object p4, Lcom/google/android/gms/internal/mx;->CREATOR:Lcom/google/android/gms/internal/my;

    invoke-virtual {p4, p2}, Lcom/google/android/gms/internal/my;->cF(Landroid/os/Parcel;)Lcom/google/android/gms/internal/mx;

    move-result-object p4

    goto :goto_e

    :cond_18
    move-object p4, v3

    :goto_e
    invoke-virtual {p2}, Landroid/os/Parcel;->readInt()I

    move-result v0

    if-eqz v0, :cond_19

    sget-object v0, Landroid/app/PendingIntent;->CREATOR:Landroid/os/Parcelable$Creator;

    invoke-interface {v0, p2}, Landroid/os/Parcelable$Creator;->createFromParcel(Landroid/os/Parcel;)Ljava/lang/Object;

    move-result-object p2

    move-object v3, p2

    check-cast v3, Landroid/app/PendingIntent;

    :cond_19
    invoke-virtual {p0, p1, p4, v3}, Lcom/google/android/gms/internal/lx$a;->a(Lcom/google/android/gms/internal/mn;Lcom/google/android/gms/internal/mx;Landroid/app/PendingIntent;)V

    invoke-virtual {p3}, Landroid/os/Parcel;->writeNoException()V

    return v2

    :pswitch_e
    invoke-virtual {p2, v1}, Landroid/os/Parcel;->enforceInterface(Ljava/lang/String;)V

    invoke-virtual {p2}, Landroid/os/Parcel;->readInt()I

    move-result p1

    if-eqz p1, :cond_1a

    sget-object p1, Lcom/google/android/gms/internal/mj;->CREATOR:Lcom/google/android/gms/internal/mk;

    invoke-virtual {p1, p2}, Lcom/google/android/gms/internal/mk;->cz(Landroid/os/Parcel;)Lcom/google/android/gms/internal/mj;

    move-result-object p1

    goto :goto_f

    :cond_1a
    move-object p1, v3

    :goto_f
    invoke-virtual {p2}, Landroid/os/Parcel;->readInt()I

    move-result p4

    if-eqz p4, :cond_1b

    sget-object p4, Lcom/google/android/gms/internal/mx;->CREATOR:Lcom/google/android/gms/internal/my;

    invoke-virtual {p4, p2}, Lcom/google/android/gms/internal/my;->cF(Landroid/os/Parcel;)Lcom/google/android/gms/internal/mx;

    move-result-object v3

    :cond_1b
    invoke-virtual {p2}, Landroid/os/Parcel;->readStrongBinder()Landroid/os/IBinder;

    move-result-object p2

    invoke-static {p2}, Lcom/google/android/gms/internal/mv$a;->aM(Landroid/os/IBinder;)Lcom/google/android/gms/internal/mv;

    move-result-object p2

    invoke-virtual {p0, p1, v3, p2}, Lcom/google/android/gms/internal/lx$a;->a(Lcom/google/android/gms/internal/mj;Lcom/google/android/gms/internal/mx;Lcom/google/android/gms/internal/mv;)V

    invoke-virtual {p3}, Landroid/os/Parcel;->writeNoException()V

    return v2

    :pswitch_f
    invoke-virtual {p2, v1}, Landroid/os/Parcel;->enforceInterface(Ljava/lang/String;)V

    invoke-virtual {p2}, Landroid/os/Parcel;->readInt()I

    move-result p1

    if-eqz p1, :cond_1c

    sget-object p1, Lcom/google/android/gms/maps/model/LatLng;->CREATOR:Lcom/google/android/gms/maps/model/i;

    invoke-virtual {p1, p2}, Lcom/google/android/gms/maps/model/i;->cM(Landroid/os/Parcel;)Lcom/google/android/gms/maps/model/LatLng;

    move-result-object p1

    goto :goto_10

    :cond_1c
    move-object p1, v3

    :goto_10
    invoke-virtual {p2}, Landroid/os/Parcel;->readInt()I

    move-result p4

    if-eqz p4, :cond_1d

    sget-object p4, Lcom/google/android/gms/internal/mj;->CREATOR:Lcom/google/android/gms/internal/mk;

    invoke-virtual {p4, p2}, Lcom/google/android/gms/internal/mk;->cz(Landroid/os/Parcel;)Lcom/google/android/gms/internal/mj;

    move-result-object p4

    goto :goto_11

    :cond_1d
    move-object p4, v3

    :goto_11
    invoke-virtual {p2}, Landroid/os/Parcel;->readInt()I

    move-result v0

    if-eqz v0, :cond_1e

    sget-object v0, Lcom/google/android/gms/internal/mx;->CREATOR:Lcom/google/android/gms/internal/my;

    invoke-virtual {v0, p2}, Lcom/google/android/gms/internal/my;->cF(Landroid/os/Parcel;)Lcom/google/android/gms/internal/mx;

    move-result-object v3

    :cond_1e
    invoke-virtual {p2}, Landroid/os/Parcel;->readStrongBinder()Landroid/os/IBinder;

    move-result-object p2

    invoke-static {p2}, Lcom/google/android/gms/internal/mv$a;->aM(Landroid/os/IBinder;)Lcom/google/android/gms/internal/mv;

    move-result-object p2

    invoke-virtual {p0, p1, p4, v3, p2}, Lcom/google/android/gms/internal/lx$a;->a(Lcom/google/android/gms/maps/model/LatLng;Lcom/google/android/gms/internal/mj;Lcom/google/android/gms/internal/mx;Lcom/google/android/gms/internal/mv;)V

    invoke-virtual {p3}, Landroid/os/Parcel;->writeNoException()V

    return v2

    :pswitch_10
    invoke-virtual {p2, v1}, Landroid/os/Parcel;->enforceInterface(Ljava/lang/String;)V

    invoke-virtual {p2}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p2}, Landroid/os/Parcel;->readInt()I

    move-result p4

    if-eqz p4, :cond_1f

    sget-object p4, Lcom/google/android/gms/internal/mx;->CREATOR:Lcom/google/android/gms/internal/my;

    invoke-virtual {p4, p2}, Lcom/google/android/gms/internal/my;->cF(Landroid/os/Parcel;)Lcom/google/android/gms/internal/mx;

    move-result-object v3

    :cond_1f
    invoke-virtual {p2}, Landroid/os/Parcel;->readStrongBinder()Landroid/os/IBinder;

    move-result-object p2

    invoke-static {p2}, Lcom/google/android/gms/internal/mv$a;->aM(Landroid/os/IBinder;)Lcom/google/android/gms/internal/mv;

    move-result-object p2

    invoke-virtual {p0, p1, v3, p2}, Lcom/google/android/gms/internal/lx$a;->a(Ljava/lang/String;Lcom/google/android/gms/internal/mx;Lcom/google/android/gms/internal/mv;)V

    invoke-virtual {p3}, Landroid/os/Parcel;->writeNoException()V

    return v2

    :pswitch_11
    invoke-virtual {p2, v1}, Landroid/os/Parcel;->enforceInterface(Ljava/lang/String;)V

    invoke-virtual {p2}, Landroid/os/Parcel;->readInt()I

    move-result p1

    if-eqz p1, :cond_20

    sget-object p1, Lcom/google/android/gms/maps/model/LatLngBounds;->CREATOR:Lcom/google/android/gms/maps/model/g;

    invoke-virtual {p1, p2}, Lcom/google/android/gms/maps/model/g;->cL(Landroid/os/Parcel;)Lcom/google/android/gms/maps/model/LatLngBounds;

    move-result-object p1

    move-object v5, p1

    goto :goto_12

    :cond_20
    move-object v5, v3

    :goto_12
    invoke-virtual {p2}, Landroid/os/Parcel;->readInt()I

    move-result v6

    invoke-virtual {p2}, Landroid/os/Parcel;->readInt()I

    move-result p1

    if-eqz p1, :cond_21

    sget-object p1, Lcom/google/android/gms/internal/mj;->CREATOR:Lcom/google/android/gms/internal/mk;

    invoke-virtual {p1, p2}, Lcom/google/android/gms/internal/mk;->cz(Landroid/os/Parcel;)Lcom/google/android/gms/internal/mj;

    move-result-object p1

    move-object v7, p1

    goto :goto_13

    :cond_21
    move-object v7, v3

    :goto_13
    invoke-virtual {p2}, Landroid/os/Parcel;->readInt()I

    move-result p1

    if-eqz p1, :cond_22

    sget-object p1, Lcom/google/android/gms/internal/mx;->CREATOR:Lcom/google/android/gms/internal/my;

    invoke-virtual {p1, p2}, Lcom/google/android/gms/internal/my;->cF(Landroid/os/Parcel;)Lcom/google/android/gms/internal/mx;

    move-result-object v3

    :cond_22
    move-object v8, v3

    invoke-virtual {p2}, Landroid/os/Parcel;->readStrongBinder()Landroid/os/IBinder;

    move-result-object p1

    invoke-static {p1}, Lcom/google/android/gms/internal/mv$a;->aM(Landroid/os/IBinder;)Lcom/google/android/gms/internal/mv;

    move-result-object v9

    move-object v4, p0

    invoke-virtual/range {v4 .. v9}, Lcom/google/android/gms/internal/lx$a;->a(Lcom/google/android/gms/maps/model/LatLngBounds;ILcom/google/android/gms/internal/mj;Lcom/google/android/gms/internal/mx;Lcom/google/android/gms/internal/mv;)V

    invoke-virtual {p3}, Landroid/os/Parcel;->writeNoException()V

    return v2

    :pswitch_12
    invoke-virtual {p2, v1}, Landroid/os/Parcel;->enforceInterface(Ljava/lang/String;)V

    invoke-virtual {p2}, Landroid/os/Parcel;->readInt()I

    move-result p1

    if-eqz p1, :cond_23

    sget-object p1, Landroid/location/Location;->CREATOR:Landroid/os/Parcelable$Creator;

    invoke-interface {p1, p2}, Landroid/os/Parcelable$Creator;->createFromParcel(Landroid/os/Parcel;)Ljava/lang/Object;

    move-result-object p1

    move-object v3, p1

    check-cast v3, Landroid/location/Location;

    :cond_23
    invoke-virtual {p0, v3}, Lcom/google/android/gms/internal/lx$a;->setMockLocation(Landroid/location/Location;)V

    invoke-virtual {p3}, Landroid/os/Parcel;->writeNoException()V

    return v2

    :pswitch_13
    invoke-virtual {p2, v1}, Landroid/os/Parcel;->enforceInterface(Ljava/lang/String;)V

    invoke-virtual {p2}, Landroid/os/Parcel;->readInt()I

    move-result p1

    if-eqz p1, :cond_24

    move v4, v2

    :cond_24
    invoke-virtual {p0, v4}, Lcom/google/android/gms/internal/lx$a;->setMockMode(Z)V

    invoke-virtual {p3}, Landroid/os/Parcel;->writeNoException()V

    return v2

    :pswitch_14
    invoke-virtual {p2, v1}, Landroid/os/Parcel;->enforceInterface(Ljava/lang/String;)V

    invoke-virtual {p2}, Landroid/os/Parcel;->readInt()I

    move-result p1

    if-eqz p1, :cond_25

    sget-object p1, Landroid/app/PendingIntent;->CREATOR:Landroid/os/Parcelable$Creator;

    invoke-interface {p1, p2}, Landroid/os/Parcelable$Creator;->createFromParcel(Landroid/os/Parcel;)Ljava/lang/Object;

    move-result-object p1

    move-object v3, p1

    check-cast v3, Landroid/app/PendingIntent;

    :cond_25
    invoke-virtual {p0, v3}, Lcom/google/android/gms/internal/lx$a;->a(Landroid/app/PendingIntent;)V

    invoke-virtual {p3}, Landroid/os/Parcel;->writeNoException()V

    return v2

    :pswitch_15
    invoke-virtual {p2, v1}, Landroid/os/Parcel;->enforceInterface(Ljava/lang/String;)V

    invoke-virtual {p2}, Landroid/os/Parcel;->readStrongBinder()Landroid/os/IBinder;

    move-result-object p1

    invoke-static {p1}, Lcom/google/android/gms/location/a$a;->aI(Landroid/os/IBinder;)Lcom/google/android/gms/location/a;

    move-result-object p1

    invoke-virtual {p0, p1}, Lcom/google/android/gms/internal/lx$a;->a(Lcom/google/android/gms/location/a;)V

    invoke-virtual {p3}, Landroid/os/Parcel;->writeNoException()V

    return v2

    :pswitch_16
    invoke-virtual {p2, v1}, Landroid/os/Parcel;->enforceInterface(Ljava/lang/String;)V

    invoke-virtual {p2}, Landroid/os/Parcel;->readInt()I

    move-result p1

    if-eqz p1, :cond_26

    sget-object p1, Lcom/google/android/gms/location/LocationRequest;->CREATOR:Lcom/google/android/gms/location/b;

    invoke-virtual {p1, p2}, Lcom/google/android/gms/location/b;->cs(Landroid/os/Parcel;)Lcom/google/android/gms/location/LocationRequest;

    move-result-object p1

    goto :goto_14

    :cond_26
    move-object p1, v3

    :goto_14
    invoke-virtual {p2}, Landroid/os/Parcel;->readInt()I

    move-result p4

    if-eqz p4, :cond_27

    sget-object p4, Landroid/app/PendingIntent;->CREATOR:Landroid/os/Parcelable$Creator;

    invoke-interface {p4, p2}, Landroid/os/Parcelable$Creator;->createFromParcel(Landroid/os/Parcel;)Ljava/lang/Object;

    move-result-object p2

    move-object v3, p2

    check-cast v3, Landroid/app/PendingIntent;

    :cond_27
    invoke-virtual {p0, p1, v3}, Lcom/google/android/gms/internal/lx$a;->a(Lcom/google/android/gms/location/LocationRequest;Landroid/app/PendingIntent;)V

    invoke-virtual {p3}, Landroid/os/Parcel;->writeNoException()V

    return v2

    :pswitch_17
    invoke-virtual {p2, v1}, Landroid/os/Parcel;->enforceInterface(Ljava/lang/String;)V

    invoke-virtual {p2}, Landroid/os/Parcel;->readInt()I

    move-result p1

    if-eqz p1, :cond_28

    sget-object p1, Lcom/google/android/gms/location/LocationRequest;->CREATOR:Lcom/google/android/gms/location/b;

    invoke-virtual {p1, p2}, Lcom/google/android/gms/location/b;->cs(Landroid/os/Parcel;)Lcom/google/android/gms/location/LocationRequest;

    move-result-object v3

    :cond_28
    invoke-virtual {p2}, Landroid/os/Parcel;->readStrongBinder()Landroid/os/IBinder;

    move-result-object p1

    invoke-static {p1}, Lcom/google/android/gms/location/a$a;->aI(Landroid/os/IBinder;)Lcom/google/android/gms/location/a;

    move-result-object p1

    invoke-virtual {p0, v3, p1}, Lcom/google/android/gms/internal/lx$a;->a(Lcom/google/android/gms/location/LocationRequest;Lcom/google/android/gms/location/a;)V

    invoke-virtual {p3}, Landroid/os/Parcel;->writeNoException()V

    return v2

    :pswitch_18
    invoke-virtual {p2, v1}, Landroid/os/Parcel;->enforceInterface(Ljava/lang/String;)V

    invoke-virtual {p0}, Lcom/google/android/gms/internal/lx$a;->lV()Landroid/location/Location;

    move-result-object p0

    invoke-virtual {p3}, Landroid/os/Parcel;->writeNoException()V

    if-eqz p0, :cond_29

    invoke-virtual {p3, v2}, Landroid/os/Parcel;->writeInt(I)V

    invoke-virtual {p0, p3, v2}, Landroid/location/Location;->writeToParcel(Landroid/os/Parcel;I)V

    goto :goto_15

    :cond_29
    invoke-virtual {p3, v4}, Landroid/os/Parcel;->writeInt(I)V

    :goto_15
    return v2

    :pswitch_19
    invoke-virtual {p2, v1}, Landroid/os/Parcel;->enforceInterface(Ljava/lang/String;)V

    invoke-virtual {p2}, Landroid/os/Parcel;->readInt()I

    move-result p1

    if-eqz p1, :cond_2a

    sget-object p1, Landroid/app/PendingIntent;->CREATOR:Landroid/os/Parcelable$Creator;

    invoke-interface {p1, p2}, Landroid/os/Parcelable$Creator;->createFromParcel(Landroid/os/Parcel;)Ljava/lang/Object;

    move-result-object p1

    move-object v3, p1

    check-cast v3, Landroid/app/PendingIntent;

    :cond_2a
    invoke-virtual {p0, v3}, Lcom/google/android/gms/internal/lx$a;->removeActivityUpdates(Landroid/app/PendingIntent;)V

    invoke-virtual {p3}, Landroid/os/Parcel;->writeNoException()V

    return v2

    :pswitch_1a
    invoke-virtual {p2, v1}, Landroid/os/Parcel;->enforceInterface(Ljava/lang/String;)V

    invoke-virtual {p2}, Landroid/os/Parcel;->readLong()J

    move-result-wide v0

    invoke-virtual {p2}, Landroid/os/Parcel;->readInt()I

    move-result p1

    if-eqz p1, :cond_2b

    move v4, v2

    :cond_2b
    invoke-virtual {p2}, Landroid/os/Parcel;->readInt()I

    move-result p1

    if-eqz p1, :cond_2c

    sget-object p1, Landroid/app/PendingIntent;->CREATOR:Landroid/os/Parcelable$Creator;

    invoke-interface {p1, p2}, Landroid/os/Parcelable$Creator;->createFromParcel(Landroid/os/Parcel;)Ljava/lang/Object;

    move-result-object p1

    move-object v3, p1

    check-cast v3, Landroid/app/PendingIntent;

    :cond_2c
    invoke-virtual {p0, v0, v1, v4, v3}, Lcom/google/android/gms/internal/lx$a;->a(JZLandroid/app/PendingIntent;)V

    invoke-virtual {p3}, Landroid/os/Parcel;->writeNoException()V

    return v2

    :pswitch_1b
    invoke-virtual {p2, v1}, Landroid/os/Parcel;->enforceInterface(Ljava/lang/String;)V

    invoke-virtual {p2}, Landroid/os/Parcel;->readStrongBinder()Landroid/os/IBinder;

    move-result-object p1

    invoke-static {p1}, Lcom/google/android/gms/internal/lw$a;->aJ(Landroid/os/IBinder;)Lcom/google/android/gms/internal/lw;

    move-result-object p1

    invoke-virtual {p2}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    move-result-object p2

    invoke-virtual {p0, p1, p2}, Lcom/google/android/gms/internal/lx$a;->a(Lcom/google/android/gms/internal/lw;Ljava/lang/String;)V

    invoke-virtual {p3}, Landroid/os/Parcel;->writeNoException()V

    return v2

    :pswitch_1c
    invoke-virtual {p2, v1}, Landroid/os/Parcel;->enforceInterface(Ljava/lang/String;)V

    invoke-virtual {p2}, Landroid/os/Parcel;->createStringArray()[Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p2}, Landroid/os/Parcel;->readStrongBinder()Landroid/os/IBinder;

    move-result-object p4

    invoke-static {p4}, Lcom/google/android/gms/internal/lw$a;->aJ(Landroid/os/IBinder;)Lcom/google/android/gms/internal/lw;

    move-result-object p4

    invoke-virtual {p2}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    move-result-object p2

    invoke-virtual {p0, p1, p4, p2}, Lcom/google/android/gms/internal/lx$a;->a([Ljava/lang/String;Lcom/google/android/gms/internal/lw;Ljava/lang/String;)V

    invoke-virtual {p3}, Landroid/os/Parcel;->writeNoException()V

    return v2

    :pswitch_1d
    invoke-virtual {p2, v1}, Landroid/os/Parcel;->enforceInterface(Ljava/lang/String;)V

    invoke-virtual {p2}, Landroid/os/Parcel;->readInt()I

    move-result p1

    if-eqz p1, :cond_2d

    sget-object p1, Landroid/app/PendingIntent;->CREATOR:Landroid/os/Parcelable$Creator;

    invoke-interface {p1, p2}, Landroid/os/Parcelable$Creator;->createFromParcel(Landroid/os/Parcel;)Ljava/lang/Object;

    move-result-object p1

    move-object v3, p1

    check-cast v3, Landroid/app/PendingIntent;

    :cond_2d
    invoke-virtual {p2}, Landroid/os/Parcel;->readStrongBinder()Landroid/os/IBinder;

    move-result-object p1

    invoke-static {p1}, Lcom/google/android/gms/internal/lw$a;->aJ(Landroid/os/IBinder;)Lcom/google/android/gms/internal/lw;

    move-result-object p1

    invoke-virtual {p2}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    move-result-object p2

    invoke-virtual {p0, v3, p1, p2}, Lcom/google/android/gms/internal/lx$a;->a(Landroid/app/PendingIntent;Lcom/google/android/gms/internal/lw;Ljava/lang/String;)V

    invoke-virtual {p3}, Landroid/os/Parcel;->writeNoException()V

    return v2

    :pswitch_1e
    invoke-virtual {p2, v1}, Landroid/os/Parcel;->enforceInterface(Ljava/lang/String;)V

    sget-object p1, Lcom/google/android/gms/internal/mc;->CREATOR:Lcom/google/android/gms/internal/md;

    invoke-virtual {p2, p1}, Landroid/os/Parcel;->createTypedArrayList(Landroid/os/Parcelable$Creator;)Ljava/util/ArrayList;

    move-result-object p1

    invoke-virtual {p2}, Landroid/os/Parcel;->readInt()I

    move-result p4

    if-eqz p4, :cond_2e

    sget-object p4, Landroid/app/PendingIntent;->CREATOR:Landroid/os/Parcelable$Creator;

    invoke-interface {p4, p2}, Landroid/os/Parcelable$Creator;->createFromParcel(Landroid/os/Parcel;)Ljava/lang/Object;

    move-result-object p4

    move-object v3, p4

    check-cast v3, Landroid/app/PendingIntent;

    :cond_2e
    invoke-virtual {p2}, Landroid/os/Parcel;->readStrongBinder()Landroid/os/IBinder;

    move-result-object p4

    invoke-static {p4}, Lcom/google/android/gms/internal/lw$a;->aJ(Landroid/os/IBinder;)Lcom/google/android/gms/internal/lw;

    move-result-object p4

    invoke-virtual {p2}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    move-result-object p2

    invoke-virtual {p0, p1, v3, p4, p2}, Lcom/google/android/gms/internal/lx$a;->a(Ljava/util/List;Landroid/app/PendingIntent;Lcom/google/android/gms/internal/lw;Ljava/lang/String;)V

    invoke-virtual {p3}, Landroid/os/Parcel;->writeNoException()V

    return v2

    :cond_2f
    invoke-virtual {p3, v1}, Landroid/os/Parcel;->writeString(Ljava/lang/String;)V

    return v2

    :cond_30
    invoke-virtual {p2, v1}, Landroid/os/Parcel;->enforceInterface(Ljava/lang/String;)V

    invoke-virtual {p2}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p2}, Landroid/os/Parcel;->readInt()I

    move-result p4

    if-eqz p4, :cond_31

    sget-object p4, Lcom/google/android/gms/internal/mx;->CREATOR:Lcom/google/android/gms/internal/my;

    invoke-virtual {p4, p2}, Lcom/google/android/gms/internal/my;->cF(Landroid/os/Parcel;)Lcom/google/android/gms/internal/mx;

    move-result-object v3

    :cond_31
    invoke-virtual {p2}, Landroid/os/Parcel;->readStrongBinder()Landroid/os/IBinder;

    move-result-object p2

    invoke-static {p2}, Lcom/google/android/gms/internal/mv$a;->aM(Landroid/os/IBinder;)Lcom/google/android/gms/internal/mv;

    move-result-object p2

    invoke-virtual {p0, p1, v3, p2}, Lcom/google/android/gms/internal/lx$a;->b(Ljava/lang/String;Lcom/google/android/gms/internal/mx;Lcom/google/android/gms/internal/mv;)V

    invoke-virtual {p3}, Landroid/os/Parcel;->writeNoException()V

    return v2

    :cond_32
    invoke-virtual {p2, v1}, Landroid/os/Parcel;->enforceInterface(Ljava/lang/String;)V

    invoke-virtual {p2}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p0, p1}, Lcom/google/android/gms/internal/lx$a;->bX(Ljava/lang/String;)Lcom/google/android/gms/location/c;

    move-result-object p0

    invoke-virtual {p3}, Landroid/os/Parcel;->writeNoException()V

    if-eqz p0, :cond_33

    invoke-virtual {p3, v2}, Landroid/os/Parcel;->writeInt(I)V

    invoke-virtual {p0, p3, v2}, Lcom/google/android/gms/location/c;->writeToParcel(Landroid/os/Parcel;I)V

    goto :goto_16

    :cond_33
    invoke-virtual {p3, v4}, Landroid/os/Parcel;->writeInt(I)V

    :goto_16
    return v2

    :cond_34
    invoke-virtual {p2, v1}, Landroid/os/Parcel;->enforceInterface(Ljava/lang/String;)V

    invoke-virtual {p2}, Landroid/os/Parcel;->readInt()I

    move-result p1

    if-eqz p1, :cond_35

    sget-object p1, Landroid/location/Location;->CREATOR:Landroid/os/Parcelable$Creator;

    invoke-interface {p1, p2}, Landroid/os/Parcelable$Creator;->createFromParcel(Landroid/os/Parcel;)Ljava/lang/Object;

    move-result-object p1

    move-object v3, p1

    check-cast v3, Landroid/location/Location;

    :cond_35
    invoke-virtual {p2}, Landroid/os/Parcel;->readInt()I

    move-result p1

    invoke-virtual {p0, v3, p1}, Lcom/google/android/gms/internal/lx$a;->a(Landroid/location/Location;I)V

    invoke-virtual {p3}, Landroid/os/Parcel;->writeNoException()V

    return v2

    :cond_36
    invoke-virtual {p2, v1}, Landroid/os/Parcel;->enforceInterface(Ljava/lang/String;)V

    invoke-virtual {p2}, Landroid/os/Parcel;->readInt()I

    move-result p1

    if-eqz p1, :cond_37

    sget-object p1, Lcom/google/android/gms/internal/ml;->CREATOR:Lcom/google/android/gms/internal/mm;

    invoke-virtual {p1, p2}, Lcom/google/android/gms/internal/mm;->cA(Landroid/os/Parcel;)Lcom/google/android/gms/internal/ml;

    move-result-object p1

    goto :goto_17

    :cond_37
    move-object p1, v3

    :goto_17
    invoke-virtual {p2}, Landroid/os/Parcel;->readInt()I

    move-result p3

    if-eqz p3, :cond_38

    sget-object p3, Lcom/google/android/gms/internal/mx;->CREATOR:Lcom/google/android/gms/internal/my;

    invoke-virtual {p3, p2}, Lcom/google/android/gms/internal/my;->cF(Landroid/os/Parcel;)Lcom/google/android/gms/internal/mx;

    move-result-object v3

    :cond_38
    invoke-virtual {p0, p1, v3}, Lcom/google/android/gms/internal/lx$a;->a(Lcom/google/android/gms/internal/ml;Lcom/google/android/gms/internal/mx;)V

    return v2

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_1e
        :pswitch_1d
        :pswitch_1c
        :pswitch_1b
        :pswitch_1a
        :pswitch_19
        :pswitch_18
        :pswitch_17
        :pswitch_16
        :pswitch_15
        :pswitch_14
        :pswitch_13
        :pswitch_12
        :pswitch_11
        :pswitch_10
        :pswitch_f
        :pswitch_e
        :pswitch_d
        :pswitch_c
        :pswitch_b
        :pswitch_a
    .end packed-switch

    :pswitch_data_1
    .packed-switch 0x2e
        :pswitch_9
        :pswitch_8
        :pswitch_7
        :pswitch_6
        :pswitch_5
        :pswitch_4
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method
