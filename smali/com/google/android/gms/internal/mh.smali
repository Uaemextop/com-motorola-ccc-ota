.class public final Lcom/google/android/gms/internal/mh;
.super Ljava/lang/Object;

# interfaces
.implements Lcom/google/android/gms/common/internal/safeparcel/SafeParcelable;


# static fields
.field public static final CREATOR:Lcom/google/android/gms/internal/mi;


# instance fields
.field private final BR:I

.field private final aeh:I

.field private final afp:I

.field private final afq:Lcom/google/android/gms/internal/mj;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    new-instance v0, Lcom/google/android/gms/internal/mi;

    invoke-direct {v0}, Lcom/google/android/gms/internal/mi;-><init>()V

    sput-object v0, Lcom/google/android/gms/internal/mh;->CREATOR:Lcom/google/android/gms/internal/mi;

    return-void
.end method

.method constructor <init>(IIILcom/google/android/gms/internal/mj;)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput p1, p0, Lcom/google/android/gms/internal/mh;->BR:I

    iput p2, p0, Lcom/google/android/gms/internal/mh;->aeh:I

    iput p3, p0, Lcom/google/android/gms/internal/mh;->afp:I

    iput-object p4, p0, Lcom/google/android/gms/internal/mh;->afq:Lcom/google/android/gms/internal/mj;

    return-void
.end method


# virtual methods
.method public describeContents()I
    .locals 0

    const/4 p0, 0x0

    return p0
.end method

.method public equals(Ljava/lang/Object;)Z
    .locals 4

    const/4 v0, 0x1

    if-ne p0, p1, :cond_0

    return v0

    :cond_0
    instance-of v1, p1, Lcom/google/android/gms/internal/mh;

    const/4 v2, 0x0

    if-nez v1, :cond_1

    return v2

    :cond_1
    check-cast p1, Lcom/google/android/gms/internal/mh;

    iget v1, p0, Lcom/google/android/gms/internal/mh;->aeh:I

    iget v3, p1, Lcom/google/android/gms/internal/mh;->aeh:I

    if-ne v1, v3, :cond_2

    iget v1, p0, Lcom/google/android/gms/internal/mh;->afp:I

    iget v3, p1, Lcom/google/android/gms/internal/mh;->afp:I

    if-ne v1, v3, :cond_2

    iget-object p0, p0, Lcom/google/android/gms/internal/mh;->afq:Lcom/google/android/gms/internal/mj;

    iget-object p1, p1, Lcom/google/android/gms/internal/mh;->afq:Lcom/google/android/gms/internal/mj;

    invoke-virtual {p0, p1}, Lcom/google/android/gms/internal/mj;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-eqz p0, :cond_2

    goto :goto_0

    :cond_2
    move v0, v2

    :goto_0
    return v0
.end method

.method public getVersionCode()I
    .locals 0

    iget p0, p0, Lcom/google/android/gms/internal/mh;->BR:I

    return p0
.end method

.method public hashCode()I
    .locals 1

    iget v0, p0, Lcom/google/android/gms/internal/mh;->aeh:I

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    iget p0, p0, Lcom/google/android/gms/internal/mh;->afp:I

    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p0

    filled-new-array {v0, p0}, [Ljava/lang/Object;

    move-result-object p0

    invoke-static {p0}, Lcom/google/android/gms/common/internal/n;->hashCode([Ljava/lang/Object;)I

    move-result p0

    return p0
.end method

.method public mc()I
    .locals 0

    iget p0, p0, Lcom/google/android/gms/internal/mh;->aeh:I

    return p0
.end method

.method public mg()I
    .locals 0

    iget p0, p0, Lcom/google/android/gms/internal/mh;->afp:I

    return p0
.end method

.method public mh()Lcom/google/android/gms/internal/mj;
    .locals 0

    iget-object p0, p0, Lcom/google/android/gms/internal/mh;->afq:Lcom/google/android/gms/internal/mj;

    return-object p0
.end method

.method public toString()Ljava/lang/String;
    .locals 3

    invoke-static {p0}, Lcom/google/android/gms/common/internal/n;->h(Ljava/lang/Object;)Lcom/google/android/gms/common/internal/n$a;

    move-result-object v0

    iget v1, p0, Lcom/google/android/gms/internal/mh;->aeh:I

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "transitionTypes"

    invoke-virtual {v0, v2, v1}, Lcom/google/android/gms/common/internal/n$a;->a(Ljava/lang/String;Ljava/lang/Object;)Lcom/google/android/gms/common/internal/n$a;

    move-result-object v0

    iget v1, p0, Lcom/google/android/gms/internal/mh;->afp:I

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "loiteringTimeMillis"

    invoke-virtual {v0, v2, v1}, Lcom/google/android/gms/common/internal/n$a;->a(Ljava/lang/String;Ljava/lang/Object;)Lcom/google/android/gms/common/internal/n$a;

    move-result-object v0

    const-string v1, "placeFilter"

    iget-object p0, p0, Lcom/google/android/gms/internal/mh;->afq:Lcom/google/android/gms/internal/mj;

    invoke-virtual {v0, v1, p0}, Lcom/google/android/gms/common/internal/n$a;->a(Ljava/lang/String;Ljava/lang/Object;)Lcom/google/android/gms/common/internal/n$a;

    move-result-object p0

    invoke-virtual {p0}, Lcom/google/android/gms/common/internal/n$a;->toString()Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method public writeToParcel(Landroid/os/Parcel;I)V
    .locals 0

    invoke-static {p0, p1, p2}, Lcom/google/android/gms/internal/mi;->a(Lcom/google/android/gms/internal/mh;Landroid/os/Parcel;I)V

    return-void
.end method
