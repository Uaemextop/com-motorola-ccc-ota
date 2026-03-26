.class final Lcom/google/android/gms/internal/pp;
.super Ljava/lang/Object;


# instance fields
.field final awV:[B

.field final tag:I


# direct methods
.method constructor <init>(I[B)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput p1, p0, Lcom/google/android/gms/internal/pp;->tag:I

    iput-object p2, p0, Lcom/google/android/gms/internal/pp;->awV:[B

    return-void
.end method


# virtual methods
.method a(Lcom/google/android/gms/internal/pg;)V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    iget v0, p0, Lcom/google/android/gms/internal/pp;->tag:I

    invoke-virtual {p1, v0}, Lcom/google/android/gms/internal/pg;->gA(I)V

    iget-object p0, p0, Lcom/google/android/gms/internal/pp;->awV:[B

    invoke-virtual {p1, p0}, Lcom/google/android/gms/internal/pg;->t([B)V

    return-void
.end method

.method c()I
    .locals 1

    iget v0, p0, Lcom/google/android/gms/internal/pp;->tag:I

    invoke-static {v0}, Lcom/google/android/gms/internal/pg;->gB(I)I

    move-result v0

    iget-object p0, p0, Lcom/google/android/gms/internal/pp;->awV:[B

    array-length p0, p0

    add-int/2addr v0, p0

    return v0
.end method

.method public equals(Ljava/lang/Object;)Z
    .locals 4

    const/4 v0, 0x1

    if-ne p1, p0, :cond_0

    return v0

    :cond_0
    instance-of v1, p1, Lcom/google/android/gms/internal/pp;

    const/4 v2, 0x0

    if-nez v1, :cond_1

    return v2

    :cond_1
    check-cast p1, Lcom/google/android/gms/internal/pp;

    iget v1, p0, Lcom/google/android/gms/internal/pp;->tag:I

    iget v3, p1, Lcom/google/android/gms/internal/pp;->tag:I

    if-ne v1, v3, :cond_2

    iget-object p0, p0, Lcom/google/android/gms/internal/pp;->awV:[B

    iget-object p1, p1, Lcom/google/android/gms/internal/pp;->awV:[B

    invoke-static {p0, p1}, Ljava/util/Arrays;->equals([B[B)Z

    move-result p0

    if-eqz p0, :cond_2

    goto :goto_0

    :cond_2
    move v0, v2

    :goto_0
    return v0
.end method

.method public hashCode()I
    .locals 2

    const/16 v0, 0x20f

    iget v1, p0, Lcom/google/android/gms/internal/pp;->tag:I

    add-int/2addr v0, v1

    mul-int/lit8 v0, v0, 0x1f

    iget-object p0, p0, Lcom/google/android/gms/internal/pp;->awV:[B

    invoke-static {p0}, Ljava/util/Arrays;->hashCode([B)I

    move-result p0

    add-int/2addr v0, p0

    return v0
.end method
