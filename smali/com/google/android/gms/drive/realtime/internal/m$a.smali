.class public abstract Lcom/google/android/gms/drive/realtime/internal/m$a;
.super Landroid/os/Binder;

# interfaces
.implements Lcom/google/android/gms/drive/realtime/internal/m;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/google/android/gms/drive/realtime/internal/m;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x409
    name = "a"
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/google/android/gms/drive/realtime/internal/m$a$a;
    }
.end annotation


# direct methods
.method public static ai(Landroid/os/IBinder;)Lcom/google/android/gms/drive/realtime/internal/m;
    .locals 2

    if-nez p0, :cond_0

    const/4 p0, 0x0

    return-object p0

    :cond_0
    const-string v0, "com.google.android.gms.drive.realtime.internal.IRealtimeService"

    invoke-interface {p0, v0}, Landroid/os/IBinder;->queryLocalInterface(Ljava/lang/String;)Landroid/os/IInterface;

    move-result-object v0

    if-eqz v0, :cond_1

    instance-of v1, v0, Lcom/google/android/gms/drive/realtime/internal/m;

    if-eqz v1, :cond_1

    check-cast v0, Lcom/google/android/gms/drive/realtime/internal/m;

    return-object v0

    :cond_1
    new-instance v0, Lcom/google/android/gms/drive/realtime/internal/m$a$a;

    invoke-direct {v0, p0}, Lcom/google/android/gms/drive/realtime/internal/m$a$a;-><init>(Landroid/os/IBinder;)V

    return-object v0
.end method


# virtual methods
.method public onTransact(ILandroid/os/Parcel;Landroid/os/Parcel;I)Z
    .locals 8
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/os/RemoteException;
        }
    .end annotation

    const v0, 0x5f4e5446

    const/4 v1, 0x1

    const-string v2, "com.google.android.gms.drive.realtime.internal.IRealtimeService"

    if-eq p1, v0, :cond_7

    const/4 v0, 0x0

    packed-switch p1, :pswitch_data_0

    invoke-super {p0, p1, p2, p3, p4}, Landroid/os/Binder;->onTransact(ILandroid/os/Parcel;Landroid/os/Parcel;I)Z

    move-result p0

    return p0

    :pswitch_0
    invoke-virtual {p2, v2}, Landroid/os/Parcel;->enforceInterface(Ljava/lang/String;)V

    invoke-virtual {p2}, Landroid/os/Parcel;->readInt()I

    move-result p1

    if-eqz p1, :cond_0

    sget-object p1, Lcom/google/android/gms/drive/realtime/internal/EndCompoundOperationRequest;->CREATOR:Landroid/os/Parcelable$Creator;

    invoke-interface {p1, p2}, Landroid/os/Parcelable$Creator;->createFromParcel(Landroid/os/Parcel;)Ljava/lang/Object;

    move-result-object p1

    move-object v0, p1

    check-cast v0, Lcom/google/android/gms/drive/realtime/internal/EndCompoundOperationRequest;

    :cond_0
    invoke-virtual {p2}, Landroid/os/Parcel;->readStrongBinder()Landroid/os/IBinder;

    move-result-object p1

    invoke-static {p1}, Lcom/google/android/gms/drive/realtime/internal/j$a;->af(Landroid/os/IBinder;)Lcom/google/android/gms/drive/realtime/internal/j;

    move-result-object p1

    invoke-virtual {p0, v0, p1}, Lcom/google/android/gms/drive/realtime/internal/m$a;->a(Lcom/google/android/gms/drive/realtime/internal/EndCompoundOperationRequest;Lcom/google/android/gms/drive/realtime/internal/j;)V

    :goto_0
    invoke-virtual {p3}, Landroid/os/Parcel;->writeNoException()V

    return v1

    :pswitch_1
    invoke-virtual {p2, v2}, Landroid/os/Parcel;->enforceInterface(Ljava/lang/String;)V

    invoke-virtual {p2}, Landroid/os/Parcel;->readStrongBinder()Landroid/os/IBinder;

    move-result-object p1

    invoke-static {p1}, Lcom/google/android/gms/drive/realtime/internal/l$a;->ah(Landroid/os/IBinder;)Lcom/google/android/gms/drive/realtime/internal/l;

    move-result-object p1

    invoke-virtual {p0, p1}, Lcom/google/android/gms/drive/realtime/internal/m$a;->a(Lcom/google/android/gms/drive/realtime/internal/l;)V

    goto :goto_0

    :pswitch_2
    invoke-virtual {p2, v2}, Landroid/os/Parcel;->enforceInterface(Ljava/lang/String;)V

    invoke-virtual {p2}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p2}, Landroid/os/Parcel;->readStrongBinder()Landroid/os/IBinder;

    move-result-object p2

    invoke-static {p2}, Lcom/google/android/gms/drive/realtime/internal/o$a;->ak(Landroid/os/IBinder;)Lcom/google/android/gms/drive/realtime/internal/o;

    move-result-object p2

    invoke-virtual {p0, p1, p2}, Lcom/google/android/gms/drive/realtime/internal/m$a;->b(Ljava/lang/String;Lcom/google/android/gms/drive/realtime/internal/o;)V

    goto :goto_0

    :pswitch_3
    invoke-virtual {p2, v2}, Landroid/os/Parcel;->enforceInterface(Ljava/lang/String;)V

    invoke-virtual {p2}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p2}, Landroid/os/Parcel;->readStrongBinder()Landroid/os/IBinder;

    move-result-object p2

    invoke-static {p2}, Lcom/google/android/gms/drive/realtime/internal/o$a;->ak(Landroid/os/IBinder;)Lcom/google/android/gms/drive/realtime/internal/o;

    move-result-object p2

    invoke-virtual {p0, p1, p2}, Lcom/google/android/gms/drive/realtime/internal/m$a;->a(Ljava/lang/String;Lcom/google/android/gms/drive/realtime/internal/o;)V

    goto :goto_0

    :pswitch_4
    invoke-virtual {p2, v2}, Landroid/os/Parcel;->enforceInterface(Ljava/lang/String;)V

    invoke-virtual {p2}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {p2}, Landroid/os/Parcel;->readInt()I

    move-result v4

    invoke-virtual {p2}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {p2}, Landroid/os/Parcel;->readInt()I

    move-result v6

    invoke-virtual {p2}, Landroid/os/Parcel;->readStrongBinder()Landroid/os/IBinder;

    move-result-object p1

    invoke-static {p1}, Lcom/google/android/gms/drive/realtime/internal/j$a;->af(Landroid/os/IBinder;)Lcom/google/android/gms/drive/realtime/internal/j;

    move-result-object v7

    move-object v2, p0

    invoke-virtual/range {v2 .. v7}, Lcom/google/android/gms/drive/realtime/internal/m$a;->a(Ljava/lang/String;ILjava/lang/String;ILcom/google/android/gms/drive/realtime/internal/j;)V

    goto :goto_0

    :pswitch_5
    invoke-virtual {p2, v2}, Landroid/os/Parcel;->enforceInterface(Ljava/lang/String;)V

    invoke-virtual {p2}, Landroid/os/Parcel;->readStrongBinder()Landroid/os/IBinder;

    move-result-object p1

    invoke-static {p1}, Lcom/google/android/gms/drive/realtime/internal/h$a;->ad(Landroid/os/IBinder;)Lcom/google/android/gms/drive/realtime/internal/h;

    move-result-object p1

    invoke-virtual {p0, p1}, Lcom/google/android/gms/drive/realtime/internal/m$a;->a(Lcom/google/android/gms/drive/realtime/internal/h;)V

    goto :goto_0

    :pswitch_6
    invoke-virtual {p2, v2}, Landroid/os/Parcel;->enforceInterface(Ljava/lang/String;)V

    invoke-virtual {p2}, Landroid/os/Parcel;->readStrongBinder()Landroid/os/IBinder;

    move-result-object p1

    invoke-static {p1}, Lcom/google/android/gms/drive/realtime/internal/o$a;->ak(Landroid/os/IBinder;)Lcom/google/android/gms/drive/realtime/internal/o;

    move-result-object p1

    invoke-virtual {p0, p1}, Lcom/google/android/gms/drive/realtime/internal/m$a;->b(Lcom/google/android/gms/drive/realtime/internal/o;)V

    goto :goto_0

    :pswitch_7
    invoke-virtual {p2, v2}, Landroid/os/Parcel;->enforceInterface(Ljava/lang/String;)V

    invoke-virtual {p2}, Landroid/os/Parcel;->readStrongBinder()Landroid/os/IBinder;

    move-result-object p1

    invoke-static {p1}, Lcom/google/android/gms/drive/realtime/internal/i$a;->ae(Landroid/os/IBinder;)Lcom/google/android/gms/drive/realtime/internal/i;

    move-result-object p1

    invoke-virtual {p0, p1}, Lcom/google/android/gms/drive/realtime/internal/m$a;->a(Lcom/google/android/gms/drive/realtime/internal/i;)V

    goto/16 :goto_0

    :pswitch_8
    invoke-virtual {p2, v2}, Landroid/os/Parcel;->enforceInterface(Ljava/lang/String;)V

    invoke-virtual {p2}, Landroid/os/Parcel;->readStrongBinder()Landroid/os/IBinder;

    move-result-object p1

    invoke-static {p1}, Lcom/google/android/gms/drive/realtime/internal/c$a;->Y(Landroid/os/IBinder;)Lcom/google/android/gms/drive/realtime/internal/c;

    move-result-object p1

    invoke-virtual {p0, p1}, Lcom/google/android/gms/drive/realtime/internal/m$a;->b(Lcom/google/android/gms/drive/realtime/internal/c;)V

    goto/16 :goto_0

    :pswitch_9
    invoke-virtual {p2, v2}, Landroid/os/Parcel;->enforceInterface(Ljava/lang/String;)V

    invoke-virtual {p2}, Landroid/os/Parcel;->readStrongBinder()Landroid/os/IBinder;

    move-result-object p1

    invoke-static {p1}, Lcom/google/android/gms/drive/realtime/internal/d$a;->Z(Landroid/os/IBinder;)Lcom/google/android/gms/drive/realtime/internal/d;

    move-result-object p1

    invoke-virtual {p0, p1}, Lcom/google/android/gms/drive/realtime/internal/m$a;->a(Lcom/google/android/gms/drive/realtime/internal/d;)V

    goto/16 :goto_0

    :pswitch_a
    invoke-virtual {p2, v2}, Landroid/os/Parcel;->enforceInterface(Ljava/lang/String;)V

    invoke-virtual {p2}, Landroid/os/Parcel;->readStrongBinder()Landroid/os/IBinder;

    move-result-object p1

    invoke-static {p1}, Lcom/google/android/gms/drive/realtime/internal/e$a;->aa(Landroid/os/IBinder;)Lcom/google/android/gms/drive/realtime/internal/e;

    move-result-object p1

    invoke-virtual {p0, p1}, Lcom/google/android/gms/drive/realtime/internal/m$a;->a(Lcom/google/android/gms/drive/realtime/internal/e;)V

    goto/16 :goto_0

    :pswitch_b
    invoke-virtual {p2, v2}, Landroid/os/Parcel;->enforceInterface(Ljava/lang/String;)V

    invoke-virtual {p2}, Landroid/os/Parcel;->readInt()I

    move-result p1

    invoke-virtual {p2}, Landroid/os/Parcel;->readStrongBinder()Landroid/os/IBinder;

    move-result-object p2

    invoke-static {p2}, Lcom/google/android/gms/drive/realtime/internal/j$a;->af(Landroid/os/IBinder;)Lcom/google/android/gms/drive/realtime/internal/j;

    move-result-object p2

    invoke-virtual {p0, p1, p2}, Lcom/google/android/gms/drive/realtime/internal/m$a;->a(ILcom/google/android/gms/drive/realtime/internal/j;)V

    goto/16 :goto_0

    :pswitch_c
    invoke-virtual {p2, v2}, Landroid/os/Parcel;->enforceInterface(Ljava/lang/String;)V

    invoke-virtual {p2}, Landroid/os/Parcel;->readStrongBinder()Landroid/os/IBinder;

    move-result-object p1

    invoke-static {p1}, Lcom/google/android/gms/drive/realtime/internal/l$a;->ah(Landroid/os/IBinder;)Lcom/google/android/gms/drive/realtime/internal/l;

    move-result-object p1

    invoke-virtual {p0, p1}, Lcom/google/android/gms/drive/realtime/internal/m$a;->b(Lcom/google/android/gms/drive/realtime/internal/l;)V

    goto/16 :goto_0

    :pswitch_d
    invoke-virtual {p2, v2}, Landroid/os/Parcel;->enforceInterface(Ljava/lang/String;)V

    invoke-virtual {p2}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p2}, Landroid/os/Parcel;->readInt()I

    move-result p4

    invoke-virtual {p2}, Landroid/os/Parcel;->readStrongBinder()Landroid/os/IBinder;

    move-result-object p2

    invoke-static {p2}, Lcom/google/android/gms/drive/realtime/internal/o$a;->ak(Landroid/os/IBinder;)Lcom/google/android/gms/drive/realtime/internal/o;

    move-result-object p2

    invoke-virtual {p0, p1, p4, p2}, Lcom/google/android/gms/drive/realtime/internal/m$a;->a(Ljava/lang/String;ILcom/google/android/gms/drive/realtime/internal/o;)V

    goto/16 :goto_0

    :pswitch_e
    invoke-virtual {p2, v2}, Landroid/os/Parcel;->enforceInterface(Ljava/lang/String;)V

    invoke-virtual {p2}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p2}, Landroid/os/Parcel;->readStrongBinder()Landroid/os/IBinder;

    move-result-object p2

    invoke-static {p2}, Lcom/google/android/gms/drive/realtime/internal/k$a;->ag(Landroid/os/IBinder;)Lcom/google/android/gms/drive/realtime/internal/k;

    move-result-object p2

    invoke-virtual {p0, p1, p2}, Lcom/google/android/gms/drive/realtime/internal/m$a;->a(Ljava/lang/String;Lcom/google/android/gms/drive/realtime/internal/k;)V

    goto/16 :goto_0

    :pswitch_f
    invoke-virtual {p2, v2}, Landroid/os/Parcel;->enforceInterface(Ljava/lang/String;)V

    invoke-virtual {p2}, Landroid/os/Parcel;->readInt()I

    move-result p1

    if-eqz p1, :cond_1

    sget-object p1, Lcom/google/android/gms/drive/realtime/internal/ParcelableIndexReference;->CREATOR:Landroid/os/Parcelable$Creator;

    invoke-interface {p1, p2}, Landroid/os/Parcelable$Creator;->createFromParcel(Landroid/os/Parcel;)Ljava/lang/Object;

    move-result-object p1

    move-object v0, p1

    check-cast v0, Lcom/google/android/gms/drive/realtime/internal/ParcelableIndexReference;

    :cond_1
    invoke-virtual {p2}, Landroid/os/Parcel;->readStrongBinder()Landroid/os/IBinder;

    move-result-object p1

    invoke-static {p1}, Lcom/google/android/gms/drive/realtime/internal/n$a;->aj(Landroid/os/IBinder;)Lcom/google/android/gms/drive/realtime/internal/n;

    move-result-object p1

    invoke-virtual {p0, v0, p1}, Lcom/google/android/gms/drive/realtime/internal/m$a;->a(Lcom/google/android/gms/drive/realtime/internal/ParcelableIndexReference;Lcom/google/android/gms/drive/realtime/internal/n;)V

    goto/16 :goto_0

    :pswitch_10
    invoke-virtual {p2, v2}, Landroid/os/Parcel;->enforceInterface(Ljava/lang/String;)V

    invoke-virtual {p2}, Landroid/os/Parcel;->readStrongBinder()Landroid/os/IBinder;

    move-result-object p1

    invoke-static {p1}, Lcom/google/android/gms/drive/realtime/internal/c$a;->Y(Landroid/os/IBinder;)Lcom/google/android/gms/drive/realtime/internal/c;

    move-result-object p1

    invoke-virtual {p0, p1}, Lcom/google/android/gms/drive/realtime/internal/m$a;->d(Lcom/google/android/gms/drive/realtime/internal/c;)V

    goto/16 :goto_0

    :pswitch_11
    invoke-virtual {p2, v2}, Landroid/os/Parcel;->enforceInterface(Ljava/lang/String;)V

    invoke-virtual {p2}, Landroid/os/Parcel;->readStrongBinder()Landroid/os/IBinder;

    move-result-object p1

    invoke-static {p1}, Lcom/google/android/gms/drive/realtime/internal/c$a;->Y(Landroid/os/IBinder;)Lcom/google/android/gms/drive/realtime/internal/c;

    move-result-object p1

    invoke-virtual {p0, p1}, Lcom/google/android/gms/drive/realtime/internal/m$a;->c(Lcom/google/android/gms/drive/realtime/internal/c;)V

    goto/16 :goto_0

    :pswitch_12
    invoke-virtual {p2, v2}, Landroid/os/Parcel;->enforceInterface(Ljava/lang/String;)V

    invoke-virtual {p2}, Landroid/os/Parcel;->readStrongBinder()Landroid/os/IBinder;

    move-result-object p1

    invoke-static {p1}, Lcom/google/android/gms/drive/realtime/internal/j$a;->af(Landroid/os/IBinder;)Lcom/google/android/gms/drive/realtime/internal/j;

    move-result-object p1

    invoke-virtual {p0, p1}, Lcom/google/android/gms/drive/realtime/internal/m$a;->b(Lcom/google/android/gms/drive/realtime/internal/j;)V

    goto/16 :goto_0

    :pswitch_13
    invoke-virtual {p2, v2}, Landroid/os/Parcel;->enforceInterface(Ljava/lang/String;)V

    invoke-virtual {p2}, Landroid/os/Parcel;->readStrongBinder()Landroid/os/IBinder;

    move-result-object p1

    invoke-static {p1}, Lcom/google/android/gms/drive/realtime/internal/j$a;->af(Landroid/os/IBinder;)Lcom/google/android/gms/drive/realtime/internal/j;

    move-result-object p1

    invoke-virtual {p0, p1}, Lcom/google/android/gms/drive/realtime/internal/m$a;->a(Lcom/google/android/gms/drive/realtime/internal/j;)V

    goto/16 :goto_0

    :pswitch_14
    invoke-virtual {p2, v2}, Landroid/os/Parcel;->enforceInterface(Ljava/lang/String;)V

    invoke-virtual {p2}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p2}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    move-result-object p4

    invoke-virtual {p2}, Landroid/os/Parcel;->readStrongBinder()Landroid/os/IBinder;

    move-result-object p2

    invoke-static {p2}, Lcom/google/android/gms/drive/realtime/internal/g$a;->ac(Landroid/os/IBinder;)Lcom/google/android/gms/drive/realtime/internal/g;

    move-result-object p2

    invoke-virtual {p0, p1, p4, p2}, Lcom/google/android/gms/drive/realtime/internal/m$a;->a(Ljava/lang/String;Ljava/lang/String;Lcom/google/android/gms/drive/realtime/internal/g;)V

    goto/16 :goto_0

    :pswitch_15
    invoke-virtual {p2, v2}, Landroid/os/Parcel;->enforceInterface(Ljava/lang/String;)V

    invoke-virtual {p2}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p2}, Landroid/os/Parcel;->readStrongBinder()Landroid/os/IBinder;

    move-result-object p2

    invoke-static {p2}, Lcom/google/android/gms/drive/realtime/internal/f$a;->ab(Landroid/os/IBinder;)Lcom/google/android/gms/drive/realtime/internal/f;

    move-result-object p2

    invoke-virtual {p0, p1, p2}, Lcom/google/android/gms/drive/realtime/internal/m$a;->a(Ljava/lang/String;Lcom/google/android/gms/drive/realtime/internal/f;)V

    goto/16 :goto_0

    :pswitch_16
    invoke-virtual {p2, v2}, Landroid/os/Parcel;->enforceInterface(Ljava/lang/String;)V

    invoke-virtual {p2}, Landroid/os/Parcel;->readInt()I

    move-result p1

    if-eqz p1, :cond_2

    sget-object p1, Lcom/google/android/gms/drive/realtime/internal/EndCompoundOperationRequest;->CREATOR:Landroid/os/Parcelable$Creator;

    invoke-interface {p1, p2}, Landroid/os/Parcelable$Creator;->createFromParcel(Landroid/os/Parcel;)Ljava/lang/Object;

    move-result-object p1

    move-object v0, p1

    check-cast v0, Lcom/google/android/gms/drive/realtime/internal/EndCompoundOperationRequest;

    :cond_2
    invoke-virtual {p2}, Landroid/os/Parcel;->readStrongBinder()Landroid/os/IBinder;

    move-result-object p1

    invoke-static {p1}, Lcom/google/android/gms/drive/realtime/internal/o$a;->ak(Landroid/os/IBinder;)Lcom/google/android/gms/drive/realtime/internal/o;

    move-result-object p1

    invoke-virtual {p0, v0, p1}, Lcom/google/android/gms/drive/realtime/internal/m$a;->a(Lcom/google/android/gms/drive/realtime/internal/EndCompoundOperationRequest;Lcom/google/android/gms/drive/realtime/internal/o;)V

    goto/16 :goto_0

    :pswitch_17
    invoke-virtual {p2, v2}, Landroid/os/Parcel;->enforceInterface(Ljava/lang/String;)V

    invoke-virtual {p2}, Landroid/os/Parcel;->readInt()I

    move-result p1

    if-eqz p1, :cond_3

    sget-object p1, Lcom/google/android/gms/drive/realtime/internal/BeginCompoundOperationRequest;->CREATOR:Landroid/os/Parcelable$Creator;

    invoke-interface {p1, p2}, Landroid/os/Parcelable$Creator;->createFromParcel(Landroid/os/Parcel;)Ljava/lang/Object;

    move-result-object p1

    move-object v0, p1

    check-cast v0, Lcom/google/android/gms/drive/realtime/internal/BeginCompoundOperationRequest;

    :cond_3
    invoke-virtual {p2}, Landroid/os/Parcel;->readStrongBinder()Landroid/os/IBinder;

    move-result-object p1

    invoke-static {p1}, Lcom/google/android/gms/drive/realtime/internal/o$a;->ak(Landroid/os/IBinder;)Lcom/google/android/gms/drive/realtime/internal/o;

    move-result-object p1

    invoke-virtual {p0, v0, p1}, Lcom/google/android/gms/drive/realtime/internal/m$a;->a(Lcom/google/android/gms/drive/realtime/internal/BeginCompoundOperationRequest;Lcom/google/android/gms/drive/realtime/internal/o;)V

    goto/16 :goto_0

    :pswitch_18
    invoke-virtual {p2, v2}, Landroid/os/Parcel;->enforceInterface(Ljava/lang/String;)V

    invoke-virtual {p2}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p2}, Landroid/os/Parcel;->readInt()I

    move-result p4

    invoke-virtual {p2}, Landroid/os/Parcel;->readInt()I

    move-result v0

    invoke-virtual {p2}, Landroid/os/Parcel;->readStrongBinder()Landroid/os/IBinder;

    move-result-object p2

    invoke-static {p2}, Lcom/google/android/gms/drive/realtime/internal/g$a;->ac(Landroid/os/IBinder;)Lcom/google/android/gms/drive/realtime/internal/g;

    move-result-object p2

    invoke-virtual {p0, p1, p4, v0, p2}, Lcom/google/android/gms/drive/realtime/internal/m$a;->a(Ljava/lang/String;IILcom/google/android/gms/drive/realtime/internal/g;)V

    goto/16 :goto_0

    :pswitch_19
    invoke-virtual {p2, v2}, Landroid/os/Parcel;->enforceInterface(Ljava/lang/String;)V

    invoke-virtual {p2}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p2}, Landroid/os/Parcel;->readInt()I

    move-result p4

    invoke-virtual {p2}, Landroid/os/Parcel;->readInt()I

    move-result v2

    if-eqz v2, :cond_4

    sget-object v0, Lcom/google/android/gms/common/data/DataHolder;->CREATOR:Lcom/google/android/gms/common/data/f;

    invoke-virtual {v0, p2}, Lcom/google/android/gms/common/data/f;->z(Landroid/os/Parcel;)Lcom/google/android/gms/common/data/DataHolder;

    move-result-object v0

    :cond_4
    invoke-virtual {p2}, Landroid/os/Parcel;->readStrongBinder()Landroid/os/IBinder;

    move-result-object p2

    invoke-static {p2}, Lcom/google/android/gms/drive/realtime/internal/g$a;->ac(Landroid/os/IBinder;)Lcom/google/android/gms/drive/realtime/internal/g;

    move-result-object p2

    invoke-virtual {p0, p1, p4, v0, p2}, Lcom/google/android/gms/drive/realtime/internal/m$a;->a(Ljava/lang/String;ILcom/google/android/gms/common/data/DataHolder;Lcom/google/android/gms/drive/realtime/internal/g;)V

    goto/16 :goto_0

    :pswitch_1a
    invoke-virtual {p2, v2}, Landroid/os/Parcel;->enforceInterface(Ljava/lang/String;)V

    invoke-virtual {p2}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p2}, Landroid/os/Parcel;->readInt()I

    move-result p4

    invoke-virtual {p2}, Landroid/os/Parcel;->readInt()I

    move-result v2

    if-eqz v2, :cond_5

    sget-object v0, Lcom/google/android/gms/common/data/DataHolder;->CREATOR:Lcom/google/android/gms/common/data/f;

    invoke-virtual {v0, p2}, Lcom/google/android/gms/common/data/f;->z(Landroid/os/Parcel;)Lcom/google/android/gms/common/data/DataHolder;

    move-result-object v0

    :cond_5
    invoke-virtual {p2}, Landroid/os/Parcel;->readStrongBinder()Landroid/os/IBinder;

    move-result-object p2

    invoke-static {p2}, Lcom/google/android/gms/drive/realtime/internal/j$a;->af(Landroid/os/IBinder;)Lcom/google/android/gms/drive/realtime/internal/j;

    move-result-object p2

    invoke-virtual {p0, p1, p4, v0, p2}, Lcom/google/android/gms/drive/realtime/internal/m$a;->a(Ljava/lang/String;ILcom/google/android/gms/common/data/DataHolder;Lcom/google/android/gms/drive/realtime/internal/j;)V

    goto/16 :goto_0

    :pswitch_1b
    invoke-virtual {p2, v2}, Landroid/os/Parcel;->enforceInterface(Ljava/lang/String;)V

    invoke-virtual {p2}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p2}, Landroid/os/Parcel;->readStrongBinder()Landroid/os/IBinder;

    move-result-object p2

    invoke-static {p2}, Lcom/google/android/gms/drive/realtime/internal/l$a;->ah(Landroid/os/IBinder;)Lcom/google/android/gms/drive/realtime/internal/l;

    move-result-object p2

    invoke-virtual {p0, p1, p2}, Lcom/google/android/gms/drive/realtime/internal/m$a;->c(Ljava/lang/String;Lcom/google/android/gms/drive/realtime/internal/l;)V

    goto/16 :goto_0

    :pswitch_1c
    invoke-virtual {p2, v2}, Landroid/os/Parcel;->enforceInterface(Ljava/lang/String;)V

    invoke-virtual {p2}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p2}, Landroid/os/Parcel;->readStrongBinder()Landroid/os/IBinder;

    move-result-object p2

    invoke-static {p2}, Lcom/google/android/gms/drive/realtime/internal/f$a;->ab(Landroid/os/IBinder;)Lcom/google/android/gms/drive/realtime/internal/f;

    move-result-object p2

    invoke-virtual {p0, p1, p2}, Lcom/google/android/gms/drive/realtime/internal/m$a;->b(Ljava/lang/String;Lcom/google/android/gms/drive/realtime/internal/f;)V

    goto/16 :goto_0

    :pswitch_1d
    invoke-virtual {p2, v2}, Landroid/os/Parcel;->enforceInterface(Ljava/lang/String;)V

    invoke-virtual {p2}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p2}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    move-result-object p4

    invoke-virtual {p2}, Landroid/os/Parcel;->readStrongBinder()Landroid/os/IBinder;

    move-result-object p2

    invoke-static {p2}, Lcom/google/android/gms/drive/realtime/internal/j$a;->af(Landroid/os/IBinder;)Lcom/google/android/gms/drive/realtime/internal/j;

    move-result-object p2

    invoke-virtual {p0, p1, p4, p2}, Lcom/google/android/gms/drive/realtime/internal/m$a;->a(Ljava/lang/String;Ljava/lang/String;Lcom/google/android/gms/drive/realtime/internal/j;)V

    goto/16 :goto_0

    :pswitch_1e
    invoke-virtual {p2, v2}, Landroid/os/Parcel;->enforceInterface(Ljava/lang/String;)V

    invoke-virtual {p2}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p2}, Landroid/os/Parcel;->readInt()I

    move-result p4

    invoke-virtual {p2}, Landroid/os/Parcel;->readInt()I

    move-result v0

    invoke-virtual {p2}, Landroid/os/Parcel;->readStrongBinder()Landroid/os/IBinder;

    move-result-object p2

    invoke-static {p2}, Lcom/google/android/gms/drive/realtime/internal/j$a;->af(Landroid/os/IBinder;)Lcom/google/android/gms/drive/realtime/internal/j;

    move-result-object p2

    invoke-virtual {p0, p1, p4, v0, p2}, Lcom/google/android/gms/drive/realtime/internal/m$a;->a(Ljava/lang/String;IILcom/google/android/gms/drive/realtime/internal/j;)V

    goto/16 :goto_0

    :pswitch_1f
    invoke-virtual {p2, v2}, Landroid/os/Parcel;->enforceInterface(Ljava/lang/String;)V

    invoke-virtual {p2}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p2}, Landroid/os/Parcel;->readInt()I

    move-result p4

    invoke-virtual {p2}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p2}, Landroid/os/Parcel;->readStrongBinder()Landroid/os/IBinder;

    move-result-object p2

    invoke-static {p2}, Lcom/google/android/gms/drive/realtime/internal/j$a;->af(Landroid/os/IBinder;)Lcom/google/android/gms/drive/realtime/internal/j;

    move-result-object p2

    invoke-virtual {p0, p1, p4, v0, p2}, Lcom/google/android/gms/drive/realtime/internal/m$a;->a(Ljava/lang/String;ILjava/lang/String;Lcom/google/android/gms/drive/realtime/internal/j;)V

    goto/16 :goto_0

    :pswitch_20
    invoke-virtual {p2, v2}, Landroid/os/Parcel;->enforceInterface(Ljava/lang/String;)V

    invoke-virtual {p2}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p2}, Landroid/os/Parcel;->readStrongBinder()Landroid/os/IBinder;

    move-result-object p2

    invoke-static {p2}, Lcom/google/android/gms/drive/realtime/internal/n$a;->aj(Landroid/os/IBinder;)Lcom/google/android/gms/drive/realtime/internal/n;

    move-result-object p2

    invoke-virtual {p0, p1, p2}, Lcom/google/android/gms/drive/realtime/internal/m$a;->b(Ljava/lang/String;Lcom/google/android/gms/drive/realtime/internal/n;)V

    goto/16 :goto_0

    :pswitch_21
    invoke-virtual {p2, v2}, Landroid/os/Parcel;->enforceInterface(Ljava/lang/String;)V

    invoke-virtual {p2}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p2}, Landroid/os/Parcel;->readStrongBinder()Landroid/os/IBinder;

    move-result-object p2

    invoke-static {p2}, Lcom/google/android/gms/drive/realtime/internal/l$a;->ah(Landroid/os/IBinder;)Lcom/google/android/gms/drive/realtime/internal/l;

    move-result-object p2

    invoke-virtual {p0, p1, p2}, Lcom/google/android/gms/drive/realtime/internal/m$a;->b(Ljava/lang/String;Lcom/google/android/gms/drive/realtime/internal/l;)V

    goto/16 :goto_0

    :pswitch_22
    invoke-virtual {p2, v2}, Landroid/os/Parcel;->enforceInterface(Ljava/lang/String;)V

    invoke-virtual {p2}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p2}, Landroid/os/Parcel;->readStrongBinder()Landroid/os/IBinder;

    move-result-object p2

    invoke-static {p2}, Lcom/google/android/gms/drive/realtime/internal/j$a;->af(Landroid/os/IBinder;)Lcom/google/android/gms/drive/realtime/internal/j;

    move-result-object p2

    invoke-virtual {p0, p1, p2}, Lcom/google/android/gms/drive/realtime/internal/m$a;->a(Ljava/lang/String;Lcom/google/android/gms/drive/realtime/internal/j;)V

    goto/16 :goto_0

    :pswitch_23
    invoke-virtual {p2, v2}, Landroid/os/Parcel;->enforceInterface(Ljava/lang/String;)V

    invoke-virtual {p2}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p2}, Landroid/os/Parcel;->readInt()I

    move-result p4

    if-eqz p4, :cond_6

    sget-object p4, Lcom/google/android/gms/common/data/DataHolder;->CREATOR:Lcom/google/android/gms/common/data/f;

    invoke-virtual {p4, p2}, Lcom/google/android/gms/common/data/f;->z(Landroid/os/Parcel;)Lcom/google/android/gms/common/data/DataHolder;

    move-result-object v0

    :cond_6
    invoke-virtual {p2}, Landroid/os/Parcel;->readStrongBinder()Landroid/os/IBinder;

    move-result-object p2

    invoke-static {p2}, Lcom/google/android/gms/drive/realtime/internal/j$a;->af(Landroid/os/IBinder;)Lcom/google/android/gms/drive/realtime/internal/j;

    move-result-object p2

    invoke-virtual {p0, p1, v0, p2}, Lcom/google/android/gms/drive/realtime/internal/m$a;->a(Ljava/lang/String;Lcom/google/android/gms/common/data/DataHolder;Lcom/google/android/gms/drive/realtime/internal/j;)V

    goto/16 :goto_0

    :pswitch_24
    invoke-virtual {p2, v2}, Landroid/os/Parcel;->enforceInterface(Ljava/lang/String;)V

    invoke-virtual {p2}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p2}, Landroid/os/Parcel;->readStrongBinder()Landroid/os/IBinder;

    move-result-object p2

    invoke-static {p2}, Lcom/google/android/gms/drive/realtime/internal/l$a;->ah(Landroid/os/IBinder;)Lcom/google/android/gms/drive/realtime/internal/l;

    move-result-object p2

    invoke-virtual {p0, p1, p2}, Lcom/google/android/gms/drive/realtime/internal/m$a;->a(Ljava/lang/String;Lcom/google/android/gms/drive/realtime/internal/l;)V

    goto/16 :goto_0

    :pswitch_25
    invoke-virtual {p2, v2}, Landroid/os/Parcel;->enforceInterface(Ljava/lang/String;)V

    invoke-virtual {p2}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p2}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    move-result-object p4

    invoke-virtual {p2}, Landroid/os/Parcel;->readStrongBinder()Landroid/os/IBinder;

    move-result-object p2

    invoke-static {p2}, Lcom/google/android/gms/drive/realtime/internal/f$a;->ab(Landroid/os/IBinder;)Lcom/google/android/gms/drive/realtime/internal/f;

    move-result-object p2

    invoke-virtual {p0, p1, p4, p2}, Lcom/google/android/gms/drive/realtime/internal/m$a;->a(Ljava/lang/String;Ljava/lang/String;Lcom/google/android/gms/drive/realtime/internal/f;)V

    goto/16 :goto_0

    :pswitch_26
    invoke-virtual {p2, v2}, Landroid/os/Parcel;->enforceInterface(Ljava/lang/String;)V

    invoke-virtual {p2}, Landroid/os/Parcel;->readStrongBinder()Landroid/os/IBinder;

    move-result-object p1

    invoke-static {p1}, Lcom/google/android/gms/drive/realtime/internal/o$a;->ak(Landroid/os/IBinder;)Lcom/google/android/gms/drive/realtime/internal/o;

    move-result-object p1

    invoke-virtual {p0, p1}, Lcom/google/android/gms/drive/realtime/internal/m$a;->a(Lcom/google/android/gms/drive/realtime/internal/o;)V

    goto/16 :goto_0

    :pswitch_27
    invoke-virtual {p2, v2}, Landroid/os/Parcel;->enforceInterface(Ljava/lang/String;)V

    invoke-virtual {p2}, Landroid/os/Parcel;->readStrongBinder()Landroid/os/IBinder;

    move-result-object p1

    invoke-static {p1}, Lcom/google/android/gms/drive/realtime/internal/c$a;->Y(Landroid/os/IBinder;)Lcom/google/android/gms/drive/realtime/internal/c;

    move-result-object p1

    invoke-virtual {p0, p1}, Lcom/google/android/gms/drive/realtime/internal/m$a;->a(Lcom/google/android/gms/drive/realtime/internal/c;)V

    goto/16 :goto_0

    :pswitch_28
    invoke-virtual {p2, v2}, Landroid/os/Parcel;->enforceInterface(Ljava/lang/String;)V

    invoke-virtual {p2}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p2}, Landroid/os/Parcel;->readStrongBinder()Landroid/os/IBinder;

    move-result-object p2

    invoke-static {p2}, Lcom/google/android/gms/drive/realtime/internal/n$a;->aj(Landroid/os/IBinder;)Lcom/google/android/gms/drive/realtime/internal/n;

    move-result-object p2

    invoke-virtual {p0, p1, p2}, Lcom/google/android/gms/drive/realtime/internal/m$a;->a(Ljava/lang/String;Lcom/google/android/gms/drive/realtime/internal/n;)V

    goto/16 :goto_0

    :cond_7
    invoke-virtual {p3, v2}, Landroid/os/Parcel;->writeString(Ljava/lang/String;)V

    return v1

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_28
        :pswitch_27
        :pswitch_26
        :pswitch_25
        :pswitch_24
        :pswitch_23
        :pswitch_22
        :pswitch_21
        :pswitch_20
        :pswitch_1f
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
