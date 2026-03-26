.class final Lcom/google/android/gms/internal/hb$1;
.super Ljava/lang/Object;

# interfaces
.implements Landroid/os/Parcelable$Creator;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/google/android/gms/internal/hb;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Landroid/os/Parcelable$Creator<",
        "Lcom/google/android/gms/internal/hb;",
        ">;"
    }
.end annotation


# direct methods
.method constructor <init>()V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public H(I)[Lcom/google/android/gms/internal/hb;
    .locals 0
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    new-array p0, p1, [Lcom/google/android/gms/internal/hb;

    return-object p0
.end method

.method public synthetic createFromParcel(Landroid/os/Parcel;)Ljava/lang/Object;
    .locals 0

    invoke-virtual {p0, p1}, Lcom/google/android/gms/internal/hb$1;->k(Landroid/os/Parcel;)Lcom/google/android/gms/internal/hb;

    move-result-object p0

    return-object p0
.end method

.method public k(Landroid/os/Parcel;)Lcom/google/android/gms/internal/hb;
    .locals 0
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    new-instance p0, Lcom/google/android/gms/internal/hb;

    invoke-direct {p0, p1}, Lcom/google/android/gms/internal/hb;-><init>(Landroid/os/Parcel;)V

    return-object p0
.end method

.method public synthetic newArray(I)[Ljava/lang/Object;
    .locals 0

    invoke-virtual {p0, p1}, Lcom/google/android/gms/internal/hb$1;->H(I)[Lcom/google/android/gms/internal/hb;

    move-result-object p0

    return-object p0
.end method
