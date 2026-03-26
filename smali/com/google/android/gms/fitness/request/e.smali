.class public Lcom/google/android/gms/fitness/request/e;
.super Ljava/lang/Object;

# interfaces
.implements Lcom/google/android/gms/common/internal/safeparcel/SafeParcelable;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/google/android/gms/fitness/request/e$a;
    }
.end annotation


# static fields
.field public static final CREATOR:Landroid/os/Parcelable$Creator;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/os/Parcelable$Creator<",
            "Lcom/google/android/gms/fitness/request/e;",
            ">;"
        }
    .end annotation
.end field


# instance fields
.field private final BR:I

.field private final Ts:Lcom/google/android/gms/fitness/data/DataSet;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    new-instance v0, Lcom/google/android/gms/fitness/request/f;

    invoke-direct {v0}, Lcom/google/android/gms/fitness/request/f;-><init>()V

    sput-object v0, Lcom/google/android/gms/fitness/request/e;->CREATOR:Landroid/os/Parcelable$Creator;

    return-void
.end method

.method constructor <init>(ILcom/google/android/gms/fitness/data/DataSet;)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput p1, p0, Lcom/google/android/gms/fitness/request/e;->BR:I

    iput-object p2, p0, Lcom/google/android/gms/fitness/request/e;->Ts:Lcom/google/android/gms/fitness/data/DataSet;

    return-void
.end method

.method private constructor <init>(Lcom/google/android/gms/fitness/request/e$a;)V
    .locals 1

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, 0x1

    iput v0, p0, Lcom/google/android/gms/fitness/request/e;->BR:I

    invoke-static {p1}, Lcom/google/android/gms/fitness/request/e$a;->a(Lcom/google/android/gms/fitness/request/e$a;)Lcom/google/android/gms/fitness/data/DataSet;

    move-result-object p1

    iput-object p1, p0, Lcom/google/android/gms/fitness/request/e;->Ts:Lcom/google/android/gms/fitness/data/DataSet;

    return-void
.end method

.method synthetic constructor <init>(Lcom/google/android/gms/fitness/request/e$a;Lcom/google/android/gms/fitness/request/e$1;)V
    .locals 0

    invoke-direct {p0, p1}, Lcom/google/android/gms/fitness/request/e;-><init>(Lcom/google/android/gms/fitness/request/e$a;)V

    return-void
.end method

.method private a(Lcom/google/android/gms/fitness/request/e;)Z
    .locals 0

    iget-object p0, p0, Lcom/google/android/gms/fitness/request/e;->Ts:Lcom/google/android/gms/fitness/data/DataSet;

    iget-object p1, p1, Lcom/google/android/gms/fitness/request/e;->Ts:Lcom/google/android/gms/fitness/data/DataSet;

    invoke-static {p0, p1}, Lcom/google/android/gms/common/internal/n;->equal(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result p0

    return p0
.end method


# virtual methods
.method public describeContents()I
    .locals 0

    const/4 p0, 0x0

    return p0
.end method

.method public equals(Ljava/lang/Object;)Z
    .locals 1

    if-eq p1, p0, :cond_1

    instance-of v0, p1, Lcom/google/android/gms/fitness/request/e;

    if-eqz v0, :cond_0

    check-cast p1, Lcom/google/android/gms/fitness/request/e;

    invoke-direct {p0, p1}, Lcom/google/android/gms/fitness/request/e;->a(Lcom/google/android/gms/fitness/request/e;)Z

    move-result p0

    if-eqz p0, :cond_0

    goto :goto_0

    :cond_0
    const/4 p0, 0x0

    goto :goto_1

    :cond_1
    :goto_0
    const/4 p0, 0x1

    :goto_1
    return p0
.end method

.method getVersionCode()I
    .locals 0

    iget p0, p0, Lcom/google/android/gms/fitness/request/e;->BR:I

    return p0
.end method

.method public hashCode()I
    .locals 0

    iget-object p0, p0, Lcom/google/android/gms/fitness/request/e;->Ts:Lcom/google/android/gms/fitness/data/DataSet;

    filled-new-array {p0}, [Ljava/lang/Object;

    move-result-object p0

    invoke-static {p0}, Lcom/google/android/gms/common/internal/n;->hashCode([Ljava/lang/Object;)I

    move-result p0

    return p0
.end method

.method public iW()Lcom/google/android/gms/fitness/data/DataSet;
    .locals 0

    iget-object p0, p0, Lcom/google/android/gms/fitness/request/e;->Ts:Lcom/google/android/gms/fitness/data/DataSet;

    return-object p0
.end method

.method public toString()Ljava/lang/String;
    .locals 2

    invoke-static {p0}, Lcom/google/android/gms/common/internal/n;->h(Ljava/lang/Object;)Lcom/google/android/gms/common/internal/n$a;

    move-result-object v0

    const-string v1, "dataSet"

    iget-object p0, p0, Lcom/google/android/gms/fitness/request/e;->Ts:Lcom/google/android/gms/fitness/data/DataSet;

    invoke-virtual {v0, v1, p0}, Lcom/google/android/gms/common/internal/n$a;->a(Ljava/lang/String;Ljava/lang/Object;)Lcom/google/android/gms/common/internal/n$a;

    move-result-object p0

    invoke-virtual {p0}, Lcom/google/android/gms/common/internal/n$a;->toString()Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method public writeToParcel(Landroid/os/Parcel;I)V
    .locals 0

    invoke-static {p0, p1, p2}, Lcom/google/android/gms/fitness/request/f;->a(Lcom/google/android/gms/fitness/request/e;Landroid/os/Parcel;I)V

    return-void
.end method
