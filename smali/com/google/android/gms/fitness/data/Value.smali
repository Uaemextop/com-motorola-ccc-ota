.class public final Lcom/google/android/gms/fitness/data/Value;
.super Ljava/lang/Object;

# interfaces
.implements Lcom/google/android/gms/common/internal/safeparcel/SafeParcelable;


# static fields
.field public static final CREATOR:Landroid/os/Parcelable$Creator;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/os/Parcelable$Creator<",
            "Lcom/google/android/gms/fitness/data/Value;",
            ">;"
        }
    .end annotation
.end field


# instance fields
.field private final BR:I

.field private final Th:I

.field private Tv:Z

.field private Tw:F


# direct methods
.method static constructor <clinit>()V
    .locals 1

    new-instance v0, Lcom/google/android/gms/fitness/data/u;

    invoke-direct {v0}, Lcom/google/android/gms/fitness/data/u;-><init>()V

    sput-object v0, Lcom/google/android/gms/fitness/data/Value;->CREATOR:Landroid/os/Parcelable$Creator;

    return-void
.end method

.method constructor <init>(I)V
    .locals 3

    const/4 v0, 0x0

    const/4 v1, 0x0

    const/4 v2, 0x1

    invoke-direct {p0, v2, p1, v0, v1}, Lcom/google/android/gms/fitness/data/Value;-><init>(IIZF)V

    return-void
.end method

.method constructor <init>(IIZF)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput p1, p0, Lcom/google/android/gms/fitness/data/Value;->BR:I

    iput p2, p0, Lcom/google/android/gms/fitness/data/Value;->Th:I

    iput-boolean p3, p0, Lcom/google/android/gms/fitness/data/Value;->Tv:Z

    iput p4, p0, Lcom/google/android/gms/fitness/data/Value;->Tw:F

    return-void
.end method

.method private a(Lcom/google/android/gms/fitness/data/Value;)Z
    .locals 4

    iget v0, p0, Lcom/google/android/gms/fitness/data/Value;->Th:I

    iget v1, p1, Lcom/google/android/gms/fitness/data/Value;->Th:I

    const/4 v2, 0x0

    if-ne v0, v1, :cond_4

    iget-boolean v1, p0, Lcom/google/android/gms/fitness/data/Value;->Tv:Z

    iget-boolean v3, p1, Lcom/google/android/gms/fitness/data/Value;->Tv:Z

    if-ne v1, v3, :cond_4

    const/4 v1, 0x1

    if-eq v0, v1, :cond_3

    const/4 v3, 0x2

    if-eq v0, v3, :cond_1

    iget p0, p0, Lcom/google/android/gms/fitness/data/Value;->Tw:F

    iget p1, p1, Lcom/google/android/gms/fitness/data/Value;->Tw:F

    cmpl-float p0, p0, p1

    if-nez p0, :cond_0

    move v2, v1

    :cond_0
    return v2

    :cond_1
    invoke-virtual {p0}, Lcom/google/android/gms/fitness/data/Value;->asFloat()F

    move-result p0

    invoke-virtual {p1}, Lcom/google/android/gms/fitness/data/Value;->asFloat()F

    move-result p1

    cmpl-float p0, p0, p1

    if-nez p0, :cond_2

    move v2, v1

    :cond_2
    return v2

    :cond_3
    invoke-virtual {p0}, Lcom/google/android/gms/fitness/data/Value;->asInt()I

    move-result p0

    invoke-virtual {p1}, Lcom/google/android/gms/fitness/data/Value;->asInt()I

    move-result p1

    if-ne p0, p1, :cond_4

    move v2, v1

    :cond_4
    return v2
.end method


# virtual methods
.method public asFloat()F
    .locals 2

    iget v0, p0, Lcom/google/android/gms/fitness/data/Value;->Th:I

    const/4 v1, 0x2

    if-ne v0, v1, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    const-string v1, "Value is not in float format"

    invoke-static {v0, v1}, Lcom/google/android/gms/common/internal/o;->a(ZLjava/lang/Object;)V

    iget p0, p0, Lcom/google/android/gms/fitness/data/Value;->Tw:F

    return p0
.end method

.method public asInt()I
    .locals 2

    iget v0, p0, Lcom/google/android/gms/fitness/data/Value;->Th:I

    const/4 v1, 0x1

    if-ne v0, v1, :cond_0

    goto :goto_0

    :cond_0
    const/4 v1, 0x0

    :goto_0
    const-string v0, "Value is not in int format"

    invoke-static {v1, v0}, Lcom/google/android/gms/common/internal/o;->a(ZLjava/lang/Object;)V

    iget p0, p0, Lcom/google/android/gms/fitness/data/Value;->Tw:F

    invoke-static {p0}, Ljava/lang/Float;->floatToRawIntBits(F)I

    move-result p0

    return p0
.end method

.method public describeContents()I
    .locals 0

    const/4 p0, 0x0

    return p0
.end method

.method public equals(Ljava/lang/Object;)Z
    .locals 1

    if-eq p0, p1, :cond_1

    instance-of v0, p1, Lcom/google/android/gms/fitness/data/Value;

    if-eqz v0, :cond_0

    check-cast p1, Lcom/google/android/gms/fitness/data/Value;

    invoke-direct {p0, p1}, Lcom/google/android/gms/fitness/data/Value;->a(Lcom/google/android/gms/fitness/data/Value;)Z

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

.method public getFormat()I
    .locals 0

    iget p0, p0, Lcom/google/android/gms/fitness/data/Value;->Th:I

    return p0
.end method

.method getVersionCode()I
    .locals 0

    iget p0, p0, Lcom/google/android/gms/fitness/data/Value;->BR:I

    return p0
.end method

.method public hashCode()I
    .locals 2

    iget v0, p0, Lcom/google/android/gms/fitness/data/Value;->Tw:F

    invoke-static {v0}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v0

    iget v1, p0, Lcom/google/android/gms/fitness/data/Value;->Th:I

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    iget-boolean p0, p0, Lcom/google/android/gms/fitness/data/Value;->Tv:Z

    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object p0

    filled-new-array {v0, v1, p0}, [Ljava/lang/Object;

    move-result-object p0

    invoke-static {p0}, Lcom/google/android/gms/common/internal/n;->hashCode([Ljava/lang/Object;)I

    move-result p0

    return p0
.end method

.method public isSet()Z
    .locals 0

    iget-boolean p0, p0, Lcom/google/android/gms/fitness/data/Value;->Tv:Z

    return p0
.end method

.method ja()F
    .locals 0

    iget p0, p0, Lcom/google/android/gms/fitness/data/Value;->Tw:F

    return p0
.end method

.method public setFloat(F)V
    .locals 3

    iget v0, p0, Lcom/google/android/gms/fitness/data/Value;->Th:I

    const/4 v1, 0x2

    const/4 v2, 0x1

    if-ne v0, v1, :cond_0

    move v0, v2

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    const-string v1, "Attempting to set an float value to a field that is not in FLOAT format.  Please check the data type definition and use the right format."

    invoke-static {v0, v1}, Lcom/google/android/gms/common/internal/o;->a(ZLjava/lang/Object;)V

    iput-boolean v2, p0, Lcom/google/android/gms/fitness/data/Value;->Tv:Z

    iput p1, p0, Lcom/google/android/gms/fitness/data/Value;->Tw:F

    return-void
.end method

.method public setInt(I)V
    .locals 3

    iget v0, p0, Lcom/google/android/gms/fitness/data/Value;->Th:I

    const/4 v1, 0x1

    if-ne v0, v1, :cond_0

    move v0, v1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    const-string v2, "Attempting to set an int value to a field that is not in INT32 format.  Please check the data type definition and use the right format."

    invoke-static {v0, v2}, Lcom/google/android/gms/common/internal/o;->a(ZLjava/lang/Object;)V

    iput-boolean v1, p0, Lcom/google/android/gms/fitness/data/Value;->Tv:Z

    invoke-static {p1}, Ljava/lang/Float;->intBitsToFloat(I)F

    move-result p1

    iput p1, p0, Lcom/google/android/gms/fitness/data/Value;->Tw:F

    return-void
.end method

.method public toString()Ljava/lang/String;
    .locals 2

    iget-boolean v0, p0, Lcom/google/android/gms/fitness/data/Value;->Tv:Z

    if-nez v0, :cond_0

    const-string p0, "unset"

    return-object p0

    :cond_0
    iget v0, p0, Lcom/google/android/gms/fitness/data/Value;->Th:I

    const/4 v1, 0x1

    if-eq v0, v1, :cond_2

    const/4 v1, 0x2

    if-eq v0, v1, :cond_1

    const-string p0, "unknown"

    return-object p0

    :cond_1
    invoke-virtual {p0}, Lcom/google/android/gms/fitness/data/Value;->asFloat()F

    move-result p0

    invoke-static {p0}, Ljava/lang/Float;->toString(F)Ljava/lang/String;

    move-result-object p0

    return-object p0

    :cond_2
    invoke-virtual {p0}, Lcom/google/android/gms/fitness/data/Value;->asInt()I

    move-result p0

    invoke-static {p0}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method public writeToParcel(Landroid/os/Parcel;I)V
    .locals 0

    invoke-static {p0, p1, p2}, Lcom/google/android/gms/fitness/data/u;->a(Lcom/google/android/gms/fitness/data/Value;Landroid/os/Parcel;I)V

    return-void
.end method
