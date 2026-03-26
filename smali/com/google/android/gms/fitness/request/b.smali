.class public Lcom/google/android/gms/fitness/request/b;
.super Ljava/lang/Object;

# interfaces
.implements Lcom/google/android/gms/common/internal/safeparcel/SafeParcelable;


# static fields
.field public static final CREATOR:Landroid/os/Parcelable$Creator;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/os/Parcelable$Creator<",
            "Lcom/google/android/gms/fitness/request/b;",
            ">;"
        }
    .end annotation
.end field


# instance fields
.field private final BR:I

.field private final Ui:Ljava/lang/String;

.field private final Uj:Lcom/google/android/gms/fitness/data/BleDevice;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    new-instance v0, Lcom/google/android/gms/fitness/request/c;

    invoke-direct {v0}, Lcom/google/android/gms/fitness/request/c;-><init>()V

    sput-object v0, Lcom/google/android/gms/fitness/request/b;->CREATOR:Landroid/os/Parcelable$Creator;

    return-void
.end method

.method constructor <init>(ILjava/lang/String;Lcom/google/android/gms/fitness/data/BleDevice;)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput p1, p0, Lcom/google/android/gms/fitness/request/b;->BR:I

    iput-object p2, p0, Lcom/google/android/gms/fitness/request/b;->Ui:Ljava/lang/String;

    iput-object p3, p0, Lcom/google/android/gms/fitness/request/b;->Uj:Lcom/google/android/gms/fitness/data/BleDevice;

    return-void
.end method

.method public constructor <init>(Lcom/google/android/gms/fitness/data/BleDevice;)V
    .locals 2

    const/4 v0, 0x2

    invoke-virtual {p1}, Lcom/google/android/gms/fitness/data/BleDevice;->getAddress()Ljava/lang/String;

    move-result-object v1

    invoke-direct {p0, v0, v1, p1}, Lcom/google/android/gms/fitness/request/b;-><init>(ILjava/lang/String;Lcom/google/android/gms/fitness/data/BleDevice;)V

    return-void
.end method

.method public constructor <init>(Ljava/lang/String;)V
    .locals 2

    const/4 v0, 0x2

    const/4 v1, 0x0

    invoke-direct {p0, v0, p1, v1}, Lcom/google/android/gms/fitness/request/b;-><init>(ILjava/lang/String;Lcom/google/android/gms/fitness/data/BleDevice;)V

    return-void
.end method


# virtual methods
.method public describeContents()I
    .locals 0

    const/4 p0, 0x0

    return p0
.end method

.method public getDeviceAddress()Ljava/lang/String;
    .locals 0

    iget-object p0, p0, Lcom/google/android/gms/fitness/request/b;->Ui:Ljava/lang/String;

    return-object p0
.end method

.method getVersionCode()I
    .locals 0

    iget p0, p0, Lcom/google/android/gms/fitness/request/b;->BR:I

    return p0
.end method

.method public jf()Lcom/google/android/gms/fitness/data/BleDevice;
    .locals 0

    iget-object p0, p0, Lcom/google/android/gms/fitness/request/b;->Uj:Lcom/google/android/gms/fitness/data/BleDevice;

    return-object p0
.end method

.method public toString()Ljava/lang/String;
    .locals 1

    iget-object v0, p0, Lcom/google/android/gms/fitness/request/b;->Ui:Ljava/lang/String;

    iget-object p0, p0, Lcom/google/android/gms/fitness/request/b;->Uj:Lcom/google/android/gms/fitness/data/BleDevice;

    filled-new-array {v0, p0}, [Ljava/lang/Object;

    move-result-object p0

    const-string v0, "ClaimBleDeviceRequest{%s %s}"

    invoke-static {v0, p0}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method public writeToParcel(Landroid/os/Parcel;I)V
    .locals 0

    invoke-static {p0, p1, p2}, Lcom/google/android/gms/fitness/request/c;->a(Lcom/google/android/gms/fitness/request/b;Landroid/os/Parcel;I)V

    return-void
.end method
