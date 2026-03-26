.class public Lcom/google/android/gms/fitness/request/aj;
.super Ljava/lang/Object;

# interfaces
.implements Lcom/google/android/gms/common/internal/safeparcel/SafeParcelable;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/google/android/gms/fitness/request/aj$a;
    }
.end annotation


# static fields
.field public static final CREATOR:Landroid/os/Parcelable$Creator;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/os/Parcelable$Creator<",
            "Lcom/google/android/gms/fitness/request/aj;",
            ">;"
        }
    .end annotation
.end field


# instance fields
.field private final BR:I

.field private final Sp:Lcom/google/android/gms/fitness/data/DataType;

.field private final Sq:Lcom/google/android/gms/fitness/data/DataSource;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    new-instance v0, Lcom/google/android/gms/fitness/request/ak;

    invoke-direct {v0}, Lcom/google/android/gms/fitness/request/ak;-><init>()V

    sput-object v0, Lcom/google/android/gms/fitness/request/aj;->CREATOR:Landroid/os/Parcelable$Creator;

    return-void
.end method

.method constructor <init>(ILcom/google/android/gms/fitness/data/DataType;Lcom/google/android/gms/fitness/data/DataSource;)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput p1, p0, Lcom/google/android/gms/fitness/request/aj;->BR:I

    iput-object p2, p0, Lcom/google/android/gms/fitness/request/aj;->Sp:Lcom/google/android/gms/fitness/data/DataType;

    iput-object p3, p0, Lcom/google/android/gms/fitness/request/aj;->Sq:Lcom/google/android/gms/fitness/data/DataSource;

    return-void
.end method

.method private constructor <init>(Lcom/google/android/gms/fitness/request/aj$a;)V
    .locals 1

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, 0x1

    iput v0, p0, Lcom/google/android/gms/fitness/request/aj;->BR:I

    invoke-static {p1}, Lcom/google/android/gms/fitness/request/aj$a;->a(Lcom/google/android/gms/fitness/request/aj$a;)Lcom/google/android/gms/fitness/data/DataType;

    move-result-object v0

    iput-object v0, p0, Lcom/google/android/gms/fitness/request/aj;->Sp:Lcom/google/android/gms/fitness/data/DataType;

    invoke-static {p1}, Lcom/google/android/gms/fitness/request/aj$a;->b(Lcom/google/android/gms/fitness/request/aj$a;)Lcom/google/android/gms/fitness/data/DataSource;

    move-result-object p1

    iput-object p1, p0, Lcom/google/android/gms/fitness/request/aj;->Sq:Lcom/google/android/gms/fitness/data/DataSource;

    return-void
.end method

.method synthetic constructor <init>(Lcom/google/android/gms/fitness/request/aj$a;Lcom/google/android/gms/fitness/request/aj$1;)V
    .locals 0

    invoke-direct {p0, p1}, Lcom/google/android/gms/fitness/request/aj;-><init>(Lcom/google/android/gms/fitness/request/aj$a;)V

    return-void
.end method

.method private a(Lcom/google/android/gms/fitness/request/aj;)Z
    .locals 2

    iget-object v0, p0, Lcom/google/android/gms/fitness/request/aj;->Sq:Lcom/google/android/gms/fitness/data/DataSource;

    iget-object v1, p1, Lcom/google/android/gms/fitness/request/aj;->Sq:Lcom/google/android/gms/fitness/data/DataSource;

    invoke-static {v0, v1}, Lcom/google/android/gms/common/internal/n;->equal(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object p0, p0, Lcom/google/android/gms/fitness/request/aj;->Sp:Lcom/google/android/gms/fitness/data/DataType;

    iget-object p1, p1, Lcom/google/android/gms/fitness/request/aj;->Sp:Lcom/google/android/gms/fitness/data/DataType;

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

    if-eq p0, p1, :cond_1

    instance-of v0, p1, Lcom/google/android/gms/fitness/request/aj;

    if-eqz v0, :cond_0

    check-cast p1, Lcom/google/android/gms/fitness/request/aj;

    invoke-direct {p0, p1}, Lcom/google/android/gms/fitness/request/aj;->a(Lcom/google/android/gms/fitness/request/aj;)Z

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

.method public getDataSource()Lcom/google/android/gms/fitness/data/DataSource;
    .locals 0

    iget-object p0, p0, Lcom/google/android/gms/fitness/request/aj;->Sq:Lcom/google/android/gms/fitness/data/DataSource;

    return-object p0
.end method

.method public getDataType()Lcom/google/android/gms/fitness/data/DataType;
    .locals 0

    iget-object p0, p0, Lcom/google/android/gms/fitness/request/aj;->Sp:Lcom/google/android/gms/fitness/data/DataType;

    return-object p0
.end method

.method getVersionCode()I
    .locals 0

    iget p0, p0, Lcom/google/android/gms/fitness/request/aj;->BR:I

    return p0
.end method

.method public hashCode()I
    .locals 1

    iget-object v0, p0, Lcom/google/android/gms/fitness/request/aj;->Sq:Lcom/google/android/gms/fitness/data/DataSource;

    iget-object p0, p0, Lcom/google/android/gms/fitness/request/aj;->Sp:Lcom/google/android/gms/fitness/data/DataType;

    filled-new-array {v0, p0}, [Ljava/lang/Object;

    move-result-object p0

    invoke-static {p0}, Lcom/google/android/gms/common/internal/n;->hashCode([Ljava/lang/Object;)I

    move-result p0

    return p0
.end method

.method public writeToParcel(Landroid/os/Parcel;I)V
    .locals 0

    invoke-static {p0, p1, p2}, Lcom/google/android/gms/fitness/request/ak;->a(Lcom/google/android/gms/fitness/request/aj;Landroid/os/Parcel;I)V

    return-void
.end method
