.class public Lcom/google/android/gms/fitness/data/q;
.super Ljava/lang/Object;

# interfaces
.implements Lcom/google/android/gms/common/internal/safeparcel/SafeParcelable;


# static fields
.field public static final CREATOR:Landroid/os/Parcelable$Creator;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/os/Parcelable$Creator<",
            "Lcom/google/android/gms/fitness/data/q;",
            ">;"
        }
    .end annotation
.end field


# instance fields
.field final BR:I

.field private final St:Lcom/google/android/gms/fitness/data/Session;

.field private final Ts:Lcom/google/android/gms/fitness/data/DataSet;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    new-instance v0, Lcom/google/android/gms/fitness/data/r;

    invoke-direct {v0}, Lcom/google/android/gms/fitness/data/r;-><init>()V

    sput-object v0, Lcom/google/android/gms/fitness/data/q;->CREATOR:Landroid/os/Parcelable$Creator;

    return-void
.end method

.method constructor <init>(ILcom/google/android/gms/fitness/data/Session;Lcom/google/android/gms/fitness/data/DataSet;)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput p1, p0, Lcom/google/android/gms/fitness/data/q;->BR:I

    iput-object p2, p0, Lcom/google/android/gms/fitness/data/q;->St:Lcom/google/android/gms/fitness/data/Session;

    iput-object p3, p0, Lcom/google/android/gms/fitness/data/q;->Ts:Lcom/google/android/gms/fitness/data/DataSet;

    return-void
.end method

.method private a(Lcom/google/android/gms/fitness/data/q;)Z
    .locals 2

    iget-object v0, p0, Lcom/google/android/gms/fitness/data/q;->St:Lcom/google/android/gms/fitness/data/Session;

    iget-object v1, p1, Lcom/google/android/gms/fitness/data/q;->St:Lcom/google/android/gms/fitness/data/Session;

    invoke-static {v0, v1}, Lcom/google/android/gms/common/internal/n;->equal(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object p0, p0, Lcom/google/android/gms/fitness/data/q;->Ts:Lcom/google/android/gms/fitness/data/DataSet;

    iget-object p1, p1, Lcom/google/android/gms/fitness/data/q;->Ts:Lcom/google/android/gms/fitness/data/DataSet;

    invoke-static {p0, p1}, Lcom/google/android/gms/common/internal/n;->equal(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result p0

    if-eqz p0, :cond_0

    const/4 p0, 0x1

    goto :goto_0

    :cond_0
    const/4 p0, 0x0

    :goto_0
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

    instance-of v0, p1, Lcom/google/android/gms/fitness/data/q;

    if-eqz v0, :cond_0

    check-cast p1, Lcom/google/android/gms/fitness/data/q;

    invoke-direct {p0, p1}, Lcom/google/android/gms/fitness/data/q;->a(Lcom/google/android/gms/fitness/data/q;)Z

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

.method public getSession()Lcom/google/android/gms/fitness/data/Session;
    .locals 0

    iget-object p0, p0, Lcom/google/android/gms/fitness/data/q;->St:Lcom/google/android/gms/fitness/data/Session;

    return-object p0
.end method

.method public hashCode()I
    .locals 1

    iget-object v0, p0, Lcom/google/android/gms/fitness/data/q;->St:Lcom/google/android/gms/fitness/data/Session;

    iget-object p0, p0, Lcom/google/android/gms/fitness/data/q;->Ts:Lcom/google/android/gms/fitness/data/DataSet;

    filled-new-array {v0, p0}, [Ljava/lang/Object;

    move-result-object p0

    invoke-static {p0}, Lcom/google/android/gms/common/internal/n;->hashCode([Ljava/lang/Object;)I

    move-result p0

    return p0
.end method

.method public iW()Lcom/google/android/gms/fitness/data/DataSet;
    .locals 0

    iget-object p0, p0, Lcom/google/android/gms/fitness/data/q;->Ts:Lcom/google/android/gms/fitness/data/DataSet;

    return-object p0
.end method

.method public toString()Ljava/lang/String;
    .locals 3

    invoke-static {p0}, Lcom/google/android/gms/common/internal/n;->h(Ljava/lang/Object;)Lcom/google/android/gms/common/internal/n$a;

    move-result-object v0

    const-string v1, "session"

    iget-object v2, p0, Lcom/google/android/gms/fitness/data/q;->St:Lcom/google/android/gms/fitness/data/Session;

    invoke-virtual {v0, v1, v2}, Lcom/google/android/gms/common/internal/n$a;->a(Ljava/lang/String;Ljava/lang/Object;)Lcom/google/android/gms/common/internal/n$a;

    move-result-object v0

    const-string v1, "dataSet"

    iget-object p0, p0, Lcom/google/android/gms/fitness/data/q;->Ts:Lcom/google/android/gms/fitness/data/DataSet;

    invoke-virtual {v0, v1, p0}, Lcom/google/android/gms/common/internal/n$a;->a(Ljava/lang/String;Ljava/lang/Object;)Lcom/google/android/gms/common/internal/n$a;

    move-result-object p0

    invoke-virtual {p0}, Lcom/google/android/gms/common/internal/n$a;->toString()Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method public writeToParcel(Landroid/os/Parcel;I)V
    .locals 0

    invoke-static {p0, p1, p2}, Lcom/google/android/gms/fitness/data/r;->a(Lcom/google/android/gms/fitness/data/q;Landroid/os/Parcel;I)V

    return-void
.end method
