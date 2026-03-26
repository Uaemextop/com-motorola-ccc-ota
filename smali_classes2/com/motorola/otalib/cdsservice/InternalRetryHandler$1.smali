.class Lcom/motorola/otalib/cdsservice/InternalRetryHandler$1;
.super Ljava/lang/Object;
.source "InternalRetryHandler.java"

# interfaces
.implements Landroid/os/Parcelable$Creator;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/motorola/otalib/cdsservice/InternalRetryHandler;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Landroid/os/Parcelable$Creator<",
        "Lcom/motorola/otalib/cdsservice/InternalRetryHandler;",
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
.method public createFromParcel(Landroid/os/Parcel;)Lcom/motorola/otalib/cdsservice/InternalRetryHandler;
    .locals 1

    new-instance p0, Lcom/motorola/otalib/cdsservice/InternalRetryHandler;

    const/4 v0, 0x0

    invoke-direct {p0, p1, v0}, Lcom/motorola/otalib/cdsservice/InternalRetryHandler;-><init>(Landroid/os/Parcel;Lcom/motorola/otalib/cdsservice/InternalRetryHandler$1;)V

    return-object p0
.end method

.method public bridge synthetic createFromParcel(Landroid/os/Parcel;)Ljava/lang/Object;
    .locals 0

    invoke-virtual {p0, p1}, Lcom/motorola/otalib/cdsservice/InternalRetryHandler$1;->createFromParcel(Landroid/os/Parcel;)Lcom/motorola/otalib/cdsservice/InternalRetryHandler;

    move-result-object p0

    return-object p0
.end method

.method public newArray(I)[Lcom/motorola/otalib/cdsservice/InternalRetryHandler;
    .locals 0

    new-array p0, p1, [Lcom/motorola/otalib/cdsservice/InternalRetryHandler;

    return-object p0
.end method

.method public bridge synthetic newArray(I)[Ljava/lang/Object;
    .locals 0

    invoke-virtual {p0, p1}, Lcom/motorola/otalib/cdsservice/InternalRetryHandler$1;->newArray(I)[Lcom/motorola/otalib/cdsservice/InternalRetryHandler;

    move-result-object p0

    return-object p0
.end method
