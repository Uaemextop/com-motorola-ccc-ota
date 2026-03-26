.class public Lcom/google/android/gms/fitness/request/q;
.super Ljava/lang/Object;

# interfaces
.implements Lcom/google/android/gms/common/internal/safeparcel/SafeParcelable;


# static fields
.field public static final CREATOR:Landroid/os/Parcelable$Creator;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/os/Parcelable$Creator<",
            "Lcom/google/android/gms/fitness/request/q;",
            ">;"
        }
    .end annotation
.end field


# instance fields
.field private final BR:I

.field private final UA:Lcom/google/android/gms/fitness/data/k;

.field private final mPendingIntent:Landroid/app/PendingIntent;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    new-instance v0, Lcom/google/android/gms/fitness/request/r;

    invoke-direct {v0}, Lcom/google/android/gms/fitness/request/r;-><init>()V

    sput-object v0, Lcom/google/android/gms/fitness/request/q;->CREATOR:Landroid/os/Parcelable$Creator;

    return-void
.end method

.method constructor <init>(ILandroid/os/IBinder;Landroid/app/PendingIntent;)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput p1, p0, Lcom/google/android/gms/fitness/request/q;->BR:I

    if-nez p2, :cond_0

    const/4 p1, 0x0

    goto :goto_0

    :cond_0
    invoke-static {p2}, Lcom/google/android/gms/fitness/data/k$a;->an(Landroid/os/IBinder;)Lcom/google/android/gms/fitness/data/k;

    move-result-object p1

    :goto_0
    iput-object p1, p0, Lcom/google/android/gms/fitness/request/q;->UA:Lcom/google/android/gms/fitness/data/k;

    iput-object p3, p0, Lcom/google/android/gms/fitness/request/q;->mPendingIntent:Landroid/app/PendingIntent;

    return-void
.end method

.method public constructor <init>(Lcom/google/android/gms/fitness/data/k;Landroid/app/PendingIntent;)V
    .locals 1

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, 0x2

    iput v0, p0, Lcom/google/android/gms/fitness/request/q;->BR:I

    iput-object p1, p0, Lcom/google/android/gms/fitness/request/q;->UA:Lcom/google/android/gms/fitness/data/k;

    iput-object p2, p0, Lcom/google/android/gms/fitness/request/q;->mPendingIntent:Landroid/app/PendingIntent;

    return-void
.end method


# virtual methods
.method public describeContents()I
    .locals 0

    const/4 p0, 0x0

    return p0
.end method

.method getVersionCode()I
    .locals 0

    iget p0, p0, Lcom/google/android/gms/fitness/request/q;->BR:I

    return p0
.end method

.method public jr()Landroid/app/PendingIntent;
    .locals 0

    iget-object p0, p0, Lcom/google/android/gms/fitness/request/q;->mPendingIntent:Landroid/app/PendingIntent;

    return-object p0
.end method

.method jw()Landroid/os/IBinder;
    .locals 0

    iget-object p0, p0, Lcom/google/android/gms/fitness/request/q;->UA:Lcom/google/android/gms/fitness/data/k;

    if-nez p0, :cond_0

    const/4 p0, 0x0

    goto :goto_0

    :cond_0
    invoke-interface {p0}, Lcom/google/android/gms/fitness/data/k;->asBinder()Landroid/os/IBinder;

    move-result-object p0

    :goto_0
    return-object p0
.end method

.method public toString()Ljava/lang/String;
    .locals 1

    iget-object p0, p0, Lcom/google/android/gms/fitness/request/q;->UA:Lcom/google/android/gms/fitness/data/k;

    filled-new-array {p0}, [Ljava/lang/Object;

    move-result-object p0

    const-string v0, "SensorUnregistrationRequest{%s}"

    invoke-static {v0, p0}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method public writeToParcel(Landroid/os/Parcel;I)V
    .locals 0

    invoke-static {p0, p1, p2}, Lcom/google/android/gms/fitness/request/r;->a(Lcom/google/android/gms/fitness/request/q;Landroid/os/Parcel;I)V

    return-void
.end method
