.class public Lcom/google/android/gms/internal/il;
.super Ljava/lang/Object;

# interfaces
.implements Lcom/google/android/gms/common/internal/safeparcel/SafeParcelable;


# static fields
.field public static final CREATOR:Landroid/os/Parcelable$Creator;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/os/Parcelable$Creator<",
            "Lcom/google/android/gms/internal/il;",
            ">;"
        }
    .end annotation
.end field


# instance fields
.field private final BR:I

.field private FA:D

.field private FB:Z

.field private GB:I

.field private GC:I

.field private GN:Lcom/google/android/gms/cast/ApplicationMetadata;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    new-instance v0, Lcom/google/android/gms/internal/im;

    invoke-direct {v0}, Lcom/google/android/gms/internal/im;-><init>()V

    sput-object v0, Lcom/google/android/gms/internal/il;->CREATOR:Landroid/os/Parcelable$Creator;

    return-void
.end method

.method public constructor <init>()V
    .locals 8

    const/4 v6, 0x0

    const/4 v7, -0x1

    const/4 v1, 0x3

    const-wide/high16 v2, 0x7ff8000000000000L    # Double.NaN

    const/4 v4, 0x0

    const/4 v5, -0x1

    move-object v0, p0

    invoke-direct/range {v0 .. v7}, Lcom/google/android/gms/internal/il;-><init>(IDZILcom/google/android/gms/cast/ApplicationMetadata;I)V

    return-void
.end method

.method constructor <init>(IDZILcom/google/android/gms/cast/ApplicationMetadata;I)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput p1, p0, Lcom/google/android/gms/internal/il;->BR:I

    iput-wide p2, p0, Lcom/google/android/gms/internal/il;->FA:D

    iput-boolean p4, p0, Lcom/google/android/gms/internal/il;->FB:Z

    iput p5, p0, Lcom/google/android/gms/internal/il;->GB:I

    iput-object p6, p0, Lcom/google/android/gms/internal/il;->GN:Lcom/google/android/gms/cast/ApplicationMetadata;

    iput p7, p0, Lcom/google/android/gms/internal/il;->GC:I

    return-void
.end method


# virtual methods
.method public describeContents()I
    .locals 0

    const/4 p0, 0x0

    return p0
.end method

.method public equals(Ljava/lang/Object;)Z
    .locals 7

    const/4 v0, 0x1

    if-ne p1, p0, :cond_0

    return v0

    :cond_0
    instance-of v1, p1, Lcom/google/android/gms/internal/il;

    const/4 v2, 0x0

    if-nez v1, :cond_1

    return v2

    :cond_1
    check-cast p1, Lcom/google/android/gms/internal/il;

    iget-wide v3, p0, Lcom/google/android/gms/internal/il;->FA:D

    iget-wide v5, p1, Lcom/google/android/gms/internal/il;->FA:D

    cmpl-double v1, v3, v5

    if-nez v1, :cond_2

    iget-boolean v1, p0, Lcom/google/android/gms/internal/il;->FB:Z

    iget-boolean v3, p1, Lcom/google/android/gms/internal/il;->FB:Z

    if-ne v1, v3, :cond_2

    iget v1, p0, Lcom/google/android/gms/internal/il;->GB:I

    iget v3, p1, Lcom/google/android/gms/internal/il;->GB:I

    if-ne v1, v3, :cond_2

    iget-object v1, p0, Lcom/google/android/gms/internal/il;->GN:Lcom/google/android/gms/cast/ApplicationMetadata;

    iget-object v3, p1, Lcom/google/android/gms/internal/il;->GN:Lcom/google/android/gms/cast/ApplicationMetadata;

    invoke-static {v1, v3}, Lcom/google/android/gms/internal/ik;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_2

    iget p0, p0, Lcom/google/android/gms/internal/il;->GC:I

    iget p1, p1, Lcom/google/android/gms/internal/il;->GC:I

    if-ne p0, p1, :cond_2

    goto :goto_0

    :cond_2
    move v0, v2

    :goto_0
    return v0
.end method

.method public fE()D
    .locals 2

    iget-wide v0, p0, Lcom/google/android/gms/internal/il;->FA:D

    return-wide v0
.end method

.method public fM()Z
    .locals 0

    iget-boolean p0, p0, Lcom/google/android/gms/internal/il;->FB:Z

    return p0
.end method

.method public fN()I
    .locals 0

    iget p0, p0, Lcom/google/android/gms/internal/il;->GB:I

    return p0
.end method

.method public fO()I
    .locals 0

    iget p0, p0, Lcom/google/android/gms/internal/il;->GC:I

    return p0
.end method

.method public getApplicationMetadata()Lcom/google/android/gms/cast/ApplicationMetadata;
    .locals 0

    iget-object p0, p0, Lcom/google/android/gms/internal/il;->GN:Lcom/google/android/gms/cast/ApplicationMetadata;

    return-object p0
.end method

.method public getVersionCode()I
    .locals 0

    iget p0, p0, Lcom/google/android/gms/internal/il;->BR:I

    return p0
.end method

.method public hashCode()I
    .locals 4

    iget-wide v0, p0, Lcom/google/android/gms/internal/il;->FA:D

    invoke-static {v0, v1}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    move-result-object v0

    iget-boolean v1, p0, Lcom/google/android/gms/internal/il;->FB:Z

    invoke-static {v1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v1

    iget v2, p0, Lcom/google/android/gms/internal/il;->GB:I

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    iget-object v3, p0, Lcom/google/android/gms/internal/il;->GN:Lcom/google/android/gms/cast/ApplicationMetadata;

    iget p0, p0, Lcom/google/android/gms/internal/il;->GC:I

    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p0

    filled-new-array {v0, v1, v2, v3, p0}, [Ljava/lang/Object;

    move-result-object p0

    invoke-static {p0}, Lcom/google/android/gms/common/internal/n;->hashCode([Ljava/lang/Object;)I

    move-result p0

    return p0
.end method

.method public writeToParcel(Landroid/os/Parcel;I)V
    .locals 0

    invoke-static {p0, p1, p2}, Lcom/google/android/gms/internal/im;->a(Lcom/google/android/gms/internal/il;Landroid/os/Parcel;I)V

    return-void
.end method
