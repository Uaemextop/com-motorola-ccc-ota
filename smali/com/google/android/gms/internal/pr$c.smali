.class public final Lcom/google/android/gms/internal/pr$c;
.super Lcom/google/android/gms/internal/ph;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/google/android/gms/internal/pr;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "c"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/google/android/gms/internal/ph<",
        "Lcom/google/android/gms/internal/pr$c;",
        ">;"
    }
.end annotation


# instance fields
.field public axj:J

.field public axk:I

.field public axl:I

.field public axm:Z

.field public axn:[Lcom/google/android/gms/internal/pr$d;

.field public axo:Lcom/google/android/gms/internal/pr$b;

.field public axp:[B

.field public axq:[B

.field public axr:[B

.field public axs:Lcom/google/android/gms/internal/pr$a;

.field public axt:Ljava/lang/String;

.field public tag:Ljava/lang/String;


# direct methods
.method public constructor <init>()V
    .locals 0

    invoke-direct {p0}, Lcom/google/android/gms/internal/ph;-><init>()V

    invoke-virtual {p0}, Lcom/google/android/gms/internal/pr$c;->qL()Lcom/google/android/gms/internal/pr$c;

    return-void
.end method


# virtual methods
.method public a(Lcom/google/android/gms/internal/pg;)V
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    iget-wide v0, p0, Lcom/google/android/gms/internal/pr$c;->axj:J

    const-wide/16 v2, 0x0

    cmp-long v2, v0, v2

    if-eqz v2, :cond_0

    const/4 v2, 0x1

    invoke-virtual {p1, v2, v0, v1}, Lcom/google/android/gms/internal/pg;->b(IJ)V

    :cond_0
    iget-object v0, p0, Lcom/google/android/gms/internal/pr$c;->tag:Ljava/lang/String;

    const-string v1, ""

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_1

    const/4 v0, 0x2

    iget-object v2, p0, Lcom/google/android/gms/internal/pr$c;->tag:Ljava/lang/String;

    invoke-virtual {p1, v0, v2}, Lcom/google/android/gms/internal/pg;->b(ILjava/lang/String;)V

    :cond_1
    iget-object v0, p0, Lcom/google/android/gms/internal/pr$c;->axn:[Lcom/google/android/gms/internal/pr$d;

    if-eqz v0, :cond_3

    array-length v0, v0

    if-lez v0, :cond_3

    const/4 v0, 0x0

    :goto_0
    iget-object v2, p0, Lcom/google/android/gms/internal/pr$c;->axn:[Lcom/google/android/gms/internal/pr$d;

    array-length v3, v2

    if-ge v0, v3, :cond_3

    aget-object v2, v2, v0

    if-eqz v2, :cond_2

    const/4 v3, 0x3

    invoke-virtual {p1, v3, v2}, Lcom/google/android/gms/internal/pg;->a(ILcom/google/android/gms/internal/pn;)V

    :cond_2
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    :cond_3
    iget-object v0, p0, Lcom/google/android/gms/internal/pr$c;->axp:[B

    sget-object v2, Lcom/google/android/gms/internal/pq;->axd:[B

    invoke-static {v0, v2}, Ljava/util/Arrays;->equals([B[B)Z

    move-result v0

    if-nez v0, :cond_4

    const/4 v0, 0x6

    iget-object v2, p0, Lcom/google/android/gms/internal/pr$c;->axp:[B

    invoke-virtual {p1, v0, v2}, Lcom/google/android/gms/internal/pg;->a(I[B)V

    :cond_4
    iget-object v0, p0, Lcom/google/android/gms/internal/pr$c;->axs:Lcom/google/android/gms/internal/pr$a;

    if-eqz v0, :cond_5

    const/4 v2, 0x7

    invoke-virtual {p1, v2, v0}, Lcom/google/android/gms/internal/pg;->a(ILcom/google/android/gms/internal/pn;)V

    :cond_5
    iget-object v0, p0, Lcom/google/android/gms/internal/pr$c;->axq:[B

    sget-object v2, Lcom/google/android/gms/internal/pq;->axd:[B

    invoke-static {v0, v2}, Ljava/util/Arrays;->equals([B[B)Z

    move-result v0

    if-nez v0, :cond_6

    const/16 v0, 0x8

    iget-object v2, p0, Lcom/google/android/gms/internal/pr$c;->axq:[B

    invoke-virtual {p1, v0, v2}, Lcom/google/android/gms/internal/pg;->a(I[B)V

    :cond_6
    iget-object v0, p0, Lcom/google/android/gms/internal/pr$c;->axo:Lcom/google/android/gms/internal/pr$b;

    if-eqz v0, :cond_7

    const/16 v2, 0x9

    invoke-virtual {p1, v2, v0}, Lcom/google/android/gms/internal/pg;->a(ILcom/google/android/gms/internal/pn;)V

    :cond_7
    iget-boolean v0, p0, Lcom/google/android/gms/internal/pr$c;->axm:Z

    if-eqz v0, :cond_8

    const/16 v2, 0xa

    invoke-virtual {p1, v2, v0}, Lcom/google/android/gms/internal/pg;->b(IZ)V

    :cond_8
    iget v0, p0, Lcom/google/android/gms/internal/pr$c;->axk:I

    if-eqz v0, :cond_9

    const/16 v2, 0xb

    invoke-virtual {p1, v2, v0}, Lcom/google/android/gms/internal/pg;->s(II)V

    :cond_9
    iget v0, p0, Lcom/google/android/gms/internal/pr$c;->axl:I

    if-eqz v0, :cond_a

    const/16 v2, 0xc

    invoke-virtual {p1, v2, v0}, Lcom/google/android/gms/internal/pg;->s(II)V

    :cond_a
    iget-object v0, p0, Lcom/google/android/gms/internal/pr$c;->axr:[B

    sget-object v2, Lcom/google/android/gms/internal/pq;->axd:[B

    invoke-static {v0, v2}, Ljava/util/Arrays;->equals([B[B)Z

    move-result v0

    if-nez v0, :cond_b

    const/16 v0, 0xd

    iget-object v2, p0, Lcom/google/android/gms/internal/pr$c;->axr:[B

    invoke-virtual {p1, v0, v2}, Lcom/google/android/gms/internal/pg;->a(I[B)V

    :cond_b
    iget-object v0, p0, Lcom/google/android/gms/internal/pr$c;->axt:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_c

    const/16 v0, 0xe

    iget-object v1, p0, Lcom/google/android/gms/internal/pr$c;->axt:Ljava/lang/String;

    invoke-virtual {p1, v0, v1}, Lcom/google/android/gms/internal/pg;->b(ILjava/lang/String;)V

    :cond_c
    invoke-super {p0, p1}, Lcom/google/android/gms/internal/ph;->a(Lcom/google/android/gms/internal/pg;)V

    return-void
.end method

.method public synthetic b(Lcom/google/android/gms/internal/pf;)Lcom/google/android/gms/internal/pn;
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    invoke-virtual {p0, p1}, Lcom/google/android/gms/internal/pr$c;->x(Lcom/google/android/gms/internal/pf;)Lcom/google/android/gms/internal/pr$c;

    move-result-object p0

    return-object p0
.end method

.method protected c()I
    .locals 5

    invoke-super {p0}, Lcom/google/android/gms/internal/ph;->c()I

    move-result v0

    iget-wide v1, p0, Lcom/google/android/gms/internal/pr$c;->axj:J

    const-wide/16 v3, 0x0

    cmp-long v3, v1, v3

    if-eqz v3, :cond_0

    const/4 v3, 0x1

    invoke-static {v3, v1, v2}, Lcom/google/android/gms/internal/pg;->d(IJ)I

    move-result v1

    add-int/2addr v0, v1

    :cond_0
    iget-object v1, p0, Lcom/google/android/gms/internal/pr$c;->tag:Ljava/lang/String;

    const-string v2, ""

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_1

    const/4 v1, 0x2

    iget-object v3, p0, Lcom/google/android/gms/internal/pr$c;->tag:Ljava/lang/String;

    invoke-static {v1, v3}, Lcom/google/android/gms/internal/pg;->j(ILjava/lang/String;)I

    move-result v1

    add-int/2addr v0, v1

    :cond_1
    iget-object v1, p0, Lcom/google/android/gms/internal/pr$c;->axn:[Lcom/google/android/gms/internal/pr$d;

    if-eqz v1, :cond_3

    array-length v1, v1

    if-lez v1, :cond_3

    const/4 v1, 0x0

    :goto_0
    iget-object v3, p0, Lcom/google/android/gms/internal/pr$c;->axn:[Lcom/google/android/gms/internal/pr$d;

    array-length v4, v3

    if-ge v1, v4, :cond_3

    aget-object v3, v3, v1

    if-eqz v3, :cond_2

    const/4 v4, 0x3

    invoke-static {v4, v3}, Lcom/google/android/gms/internal/pg;->c(ILcom/google/android/gms/internal/pn;)I

    move-result v3

    add-int/2addr v0, v3

    :cond_2
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    :cond_3
    iget-object v1, p0, Lcom/google/android/gms/internal/pr$c;->axp:[B

    sget-object v3, Lcom/google/android/gms/internal/pq;->axd:[B

    invoke-static {v1, v3}, Ljava/util/Arrays;->equals([B[B)Z

    move-result v1

    if-nez v1, :cond_4

    const/4 v1, 0x6

    iget-object v3, p0, Lcom/google/android/gms/internal/pr$c;->axp:[B

    invoke-static {v1, v3}, Lcom/google/android/gms/internal/pg;->b(I[B)I

    move-result v1

    add-int/2addr v0, v1

    :cond_4
    iget-object v1, p0, Lcom/google/android/gms/internal/pr$c;->axs:Lcom/google/android/gms/internal/pr$a;

    if-eqz v1, :cond_5

    const/4 v3, 0x7

    invoke-static {v3, v1}, Lcom/google/android/gms/internal/pg;->c(ILcom/google/android/gms/internal/pn;)I

    move-result v1

    add-int/2addr v0, v1

    :cond_5
    iget-object v1, p0, Lcom/google/android/gms/internal/pr$c;->axq:[B

    sget-object v3, Lcom/google/android/gms/internal/pq;->axd:[B

    invoke-static {v1, v3}, Ljava/util/Arrays;->equals([B[B)Z

    move-result v1

    if-nez v1, :cond_6

    const/16 v1, 0x8

    iget-object v3, p0, Lcom/google/android/gms/internal/pr$c;->axq:[B

    invoke-static {v1, v3}, Lcom/google/android/gms/internal/pg;->b(I[B)I

    move-result v1

    add-int/2addr v0, v1

    :cond_6
    iget-object v1, p0, Lcom/google/android/gms/internal/pr$c;->axo:Lcom/google/android/gms/internal/pr$b;

    if-eqz v1, :cond_7

    const/16 v3, 0x9

    invoke-static {v3, v1}, Lcom/google/android/gms/internal/pg;->c(ILcom/google/android/gms/internal/pn;)I

    move-result v1

    add-int/2addr v0, v1

    :cond_7
    iget-boolean v1, p0, Lcom/google/android/gms/internal/pr$c;->axm:Z

    if-eqz v1, :cond_8

    const/16 v3, 0xa

    invoke-static {v3, v1}, Lcom/google/android/gms/internal/pg;->c(IZ)I

    move-result v1

    add-int/2addr v0, v1

    :cond_8
    iget v1, p0, Lcom/google/android/gms/internal/pr$c;->axk:I

    if-eqz v1, :cond_9

    const/16 v3, 0xb

    invoke-static {v3, v1}, Lcom/google/android/gms/internal/pg;->u(II)I

    move-result v1

    add-int/2addr v0, v1

    :cond_9
    iget v1, p0, Lcom/google/android/gms/internal/pr$c;->axl:I

    if-eqz v1, :cond_a

    const/16 v3, 0xc

    invoke-static {v3, v1}, Lcom/google/android/gms/internal/pg;->u(II)I

    move-result v1

    add-int/2addr v0, v1

    :cond_a
    iget-object v1, p0, Lcom/google/android/gms/internal/pr$c;->axr:[B

    sget-object v3, Lcom/google/android/gms/internal/pq;->axd:[B

    invoke-static {v1, v3}, Ljava/util/Arrays;->equals([B[B)Z

    move-result v1

    if-nez v1, :cond_b

    const/16 v1, 0xd

    iget-object v3, p0, Lcom/google/android/gms/internal/pr$c;->axr:[B

    invoke-static {v1, v3}, Lcom/google/android/gms/internal/pg;->b(I[B)I

    move-result v1

    add-int/2addr v0, v1

    :cond_b
    iget-object v1, p0, Lcom/google/android/gms/internal/pr$c;->axt:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_c

    const/16 v1, 0xe

    iget-object p0, p0, Lcom/google/android/gms/internal/pr$c;->axt:Ljava/lang/String;

    invoke-static {v1, p0}, Lcom/google/android/gms/internal/pg;->j(ILjava/lang/String;)I

    move-result p0

    add-int/2addr v0, p0

    :cond_c
    return v0
.end method

.method public equals(Ljava/lang/Object;)Z
    .locals 6

    if-ne p1, p0, :cond_0

    const/4 p0, 0x1

    return p0

    :cond_0
    instance-of v0, p1, Lcom/google/android/gms/internal/pr$c;

    const/4 v1, 0x0

    if-nez v0, :cond_1

    return v1

    :cond_1
    check-cast p1, Lcom/google/android/gms/internal/pr$c;

    iget-wide v2, p0, Lcom/google/android/gms/internal/pr$c;->axj:J

    iget-wide v4, p1, Lcom/google/android/gms/internal/pr$c;->axj:J

    cmp-long v0, v2, v4

    if-eqz v0, :cond_2

    return v1

    :cond_2
    iget-object v0, p0, Lcom/google/android/gms/internal/pr$c;->tag:Ljava/lang/String;

    if-nez v0, :cond_3

    iget-object v0, p1, Lcom/google/android/gms/internal/pr$c;->tag:Ljava/lang/String;

    if-eqz v0, :cond_4

    return v1

    :cond_3
    iget-object v2, p1, Lcom/google/android/gms/internal/pr$c;->tag:Ljava/lang/String;

    invoke-virtual {v0, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_4

    return v1

    :cond_4
    iget v0, p0, Lcom/google/android/gms/internal/pr$c;->axk:I

    iget v2, p1, Lcom/google/android/gms/internal/pr$c;->axk:I

    if-eq v0, v2, :cond_5

    return v1

    :cond_5
    iget v0, p0, Lcom/google/android/gms/internal/pr$c;->axl:I

    iget v2, p1, Lcom/google/android/gms/internal/pr$c;->axl:I

    if-eq v0, v2, :cond_6

    return v1

    :cond_6
    iget-boolean v0, p0, Lcom/google/android/gms/internal/pr$c;->axm:Z

    iget-boolean v2, p1, Lcom/google/android/gms/internal/pr$c;->axm:Z

    if-eq v0, v2, :cond_7

    return v1

    :cond_7
    iget-object v0, p0, Lcom/google/android/gms/internal/pr$c;->axn:[Lcom/google/android/gms/internal/pr$d;

    iget-object v2, p1, Lcom/google/android/gms/internal/pr$c;->axn:[Lcom/google/android/gms/internal/pr$d;

    invoke-static {v0, v2}, Lcom/google/android/gms/internal/pl;->equals([Ljava/lang/Object;[Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_8

    return v1

    :cond_8
    iget-object v0, p0, Lcom/google/android/gms/internal/pr$c;->axo:Lcom/google/android/gms/internal/pr$b;

    if-nez v0, :cond_9

    iget-object v0, p1, Lcom/google/android/gms/internal/pr$c;->axo:Lcom/google/android/gms/internal/pr$b;

    if-eqz v0, :cond_a

    return v1

    :cond_9
    iget-object v2, p1, Lcom/google/android/gms/internal/pr$c;->axo:Lcom/google/android/gms/internal/pr$b;

    invoke-virtual {v0, v2}, Lcom/google/android/gms/internal/pr$b;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_a

    return v1

    :cond_a
    iget-object v0, p0, Lcom/google/android/gms/internal/pr$c;->axp:[B

    iget-object v2, p1, Lcom/google/android/gms/internal/pr$c;->axp:[B

    invoke-static {v0, v2}, Ljava/util/Arrays;->equals([B[B)Z

    move-result v0

    if-nez v0, :cond_b

    return v1

    :cond_b
    iget-object v0, p0, Lcom/google/android/gms/internal/pr$c;->axq:[B

    iget-object v2, p1, Lcom/google/android/gms/internal/pr$c;->axq:[B

    invoke-static {v0, v2}, Ljava/util/Arrays;->equals([B[B)Z

    move-result v0

    if-nez v0, :cond_c

    return v1

    :cond_c
    iget-object v0, p0, Lcom/google/android/gms/internal/pr$c;->axr:[B

    iget-object v2, p1, Lcom/google/android/gms/internal/pr$c;->axr:[B

    invoke-static {v0, v2}, Ljava/util/Arrays;->equals([B[B)Z

    move-result v0

    if-nez v0, :cond_d

    return v1

    :cond_d
    iget-object v0, p0, Lcom/google/android/gms/internal/pr$c;->axs:Lcom/google/android/gms/internal/pr$a;

    if-nez v0, :cond_e

    iget-object v0, p1, Lcom/google/android/gms/internal/pr$c;->axs:Lcom/google/android/gms/internal/pr$a;

    if-eqz v0, :cond_f

    return v1

    :cond_e
    iget-object v2, p1, Lcom/google/android/gms/internal/pr$c;->axs:Lcom/google/android/gms/internal/pr$a;

    invoke-virtual {v0, v2}, Lcom/google/android/gms/internal/pr$a;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_f

    return v1

    :cond_f
    iget-object v0, p0, Lcom/google/android/gms/internal/pr$c;->axt:Ljava/lang/String;

    if-nez v0, :cond_10

    iget-object v0, p1, Lcom/google/android/gms/internal/pr$c;->axt:Ljava/lang/String;

    if-eqz v0, :cond_11

    return v1

    :cond_10
    iget-object v2, p1, Lcom/google/android/gms/internal/pr$c;->axt:Ljava/lang/String;

    invoke-virtual {v0, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_11

    return v1

    :cond_11
    invoke-virtual {p0, p1}, Lcom/google/android/gms/internal/pr$c;->a(Lcom/google/android/gms/internal/ph;)Z

    move-result p0

    return p0
.end method

.method public hashCode()I
    .locals 4

    iget-wide v0, p0, Lcom/google/android/gms/internal/pr$c;->axj:J

    const/16 v2, 0x20

    ushr-long v2, v0, v2

    xor-long/2addr v0, v2

    long-to-int v0, v0

    const/16 v1, 0x20f

    add-int/2addr v1, v0

    mul-int/lit8 v1, v1, 0x1f

    iget-object v0, p0, Lcom/google/android/gms/internal/pr$c;->tag:Ljava/lang/String;

    const/4 v2, 0x0

    if-nez v0, :cond_0

    move v0, v2

    goto :goto_0

    :cond_0
    invoke-virtual {v0}, Ljava/lang/String;->hashCode()I

    move-result v0

    :goto_0
    add-int/2addr v1, v0

    mul-int/lit8 v1, v1, 0x1f

    iget v0, p0, Lcom/google/android/gms/internal/pr$c;->axk:I

    add-int/2addr v1, v0

    mul-int/lit8 v1, v1, 0x1f

    iget v0, p0, Lcom/google/android/gms/internal/pr$c;->axl:I

    add-int/2addr v1, v0

    mul-int/lit8 v1, v1, 0x1f

    iget-boolean v0, p0, Lcom/google/android/gms/internal/pr$c;->axm:Z

    if-eqz v0, :cond_1

    const/16 v0, 0x4cf

    goto :goto_1

    :cond_1
    const/16 v0, 0x4d5

    :goto_1
    add-int/2addr v1, v0

    mul-int/lit8 v1, v1, 0x1f

    iget-object v0, p0, Lcom/google/android/gms/internal/pr$c;->axn:[Lcom/google/android/gms/internal/pr$d;

    invoke-static {v0}, Lcom/google/android/gms/internal/pl;->hashCode([Ljava/lang/Object;)I

    move-result v0

    add-int/2addr v1, v0

    mul-int/lit8 v1, v1, 0x1f

    iget-object v0, p0, Lcom/google/android/gms/internal/pr$c;->axo:Lcom/google/android/gms/internal/pr$b;

    if-nez v0, :cond_2

    move v0, v2

    goto :goto_2

    :cond_2
    invoke-virtual {v0}, Lcom/google/android/gms/internal/pr$b;->hashCode()I

    move-result v0

    :goto_2
    add-int/2addr v1, v0

    mul-int/lit8 v1, v1, 0x1f

    iget-object v0, p0, Lcom/google/android/gms/internal/pr$c;->axp:[B

    invoke-static {v0}, Ljava/util/Arrays;->hashCode([B)I

    move-result v0

    add-int/2addr v1, v0

    mul-int/lit8 v1, v1, 0x1f

    iget-object v0, p0, Lcom/google/android/gms/internal/pr$c;->axq:[B

    invoke-static {v0}, Ljava/util/Arrays;->hashCode([B)I

    move-result v0

    add-int/2addr v1, v0

    mul-int/lit8 v1, v1, 0x1f

    iget-object v0, p0, Lcom/google/android/gms/internal/pr$c;->axr:[B

    invoke-static {v0}, Ljava/util/Arrays;->hashCode([B)I

    move-result v0

    add-int/2addr v1, v0

    mul-int/lit8 v1, v1, 0x1f

    iget-object v0, p0, Lcom/google/android/gms/internal/pr$c;->axs:Lcom/google/android/gms/internal/pr$a;

    if-nez v0, :cond_3

    move v0, v2

    goto :goto_3

    :cond_3
    invoke-virtual {v0}, Lcom/google/android/gms/internal/pr$a;->hashCode()I

    move-result v0

    :goto_3
    add-int/2addr v1, v0

    mul-int/lit8 v1, v1, 0x1f

    iget-object v0, p0, Lcom/google/android/gms/internal/pr$c;->axt:Ljava/lang/String;

    if-nez v0, :cond_4

    goto :goto_4

    :cond_4
    invoke-virtual {v0}, Ljava/lang/String;->hashCode()I

    move-result v2

    :goto_4
    add-int/2addr v1, v2

    mul-int/lit8 v1, v1, 0x1f

    invoke-virtual {p0}, Lcom/google/android/gms/internal/pr$c;->qz()I

    move-result p0

    add-int/2addr v1, p0

    return v1
.end method

.method public qL()Lcom/google/android/gms/internal/pr$c;
    .locals 3

    const-wide/16 v0, 0x0

    iput-wide v0, p0, Lcom/google/android/gms/internal/pr$c;->axj:J

    const-string v0, ""

    iput-object v0, p0, Lcom/google/android/gms/internal/pr$c;->tag:Ljava/lang/String;

    const/4 v1, 0x0

    iput v1, p0, Lcom/google/android/gms/internal/pr$c;->axk:I

    iput v1, p0, Lcom/google/android/gms/internal/pr$c;->axl:I

    iput-boolean v1, p0, Lcom/google/android/gms/internal/pr$c;->axm:Z

    invoke-static {}, Lcom/google/android/gms/internal/pr$d;->qM()[Lcom/google/android/gms/internal/pr$d;

    move-result-object v1

    iput-object v1, p0, Lcom/google/android/gms/internal/pr$c;->axn:[Lcom/google/android/gms/internal/pr$d;

    const/4 v1, 0x0

    iput-object v1, p0, Lcom/google/android/gms/internal/pr$c;->axo:Lcom/google/android/gms/internal/pr$b;

    sget-object v2, Lcom/google/android/gms/internal/pq;->axd:[B

    iput-object v2, p0, Lcom/google/android/gms/internal/pr$c;->axp:[B

    sget-object v2, Lcom/google/android/gms/internal/pq;->axd:[B

    iput-object v2, p0, Lcom/google/android/gms/internal/pr$c;->axq:[B

    sget-object v2, Lcom/google/android/gms/internal/pq;->axd:[B

    iput-object v2, p0, Lcom/google/android/gms/internal/pr$c;->axr:[B

    iput-object v1, p0, Lcom/google/android/gms/internal/pr$c;->axs:Lcom/google/android/gms/internal/pr$a;

    iput-object v0, p0, Lcom/google/android/gms/internal/pr$c;->axt:Ljava/lang/String;

    iput-object v1, p0, Lcom/google/android/gms/internal/pr$c;->awJ:Lcom/google/android/gms/internal/pj;

    const/4 v0, -0x1

    iput v0, p0, Lcom/google/android/gms/internal/pr$c;->awU:I

    return-object p0
.end method

.method public x(Lcom/google/android/gms/internal/pf;)Lcom/google/android/gms/internal/pr$c;
    .locals 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    :cond_0
    :goto_0
    invoke-virtual {p1}, Lcom/google/android/gms/internal/pf;->qi()I

    move-result v0

    sparse-switch v0, :sswitch_data_0

    invoke-virtual {p0, p1, v0}, Lcom/google/android/gms/internal/pr$c;->a(Lcom/google/android/gms/internal/pf;I)Z

    move-result v0

    if-nez v0, :cond_0

    return-object p0

    :sswitch_0
    invoke-virtual {p1}, Lcom/google/android/gms/internal/pf;->readString()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/google/android/gms/internal/pr$c;->axt:Ljava/lang/String;

    goto :goto_0

    :sswitch_1
    invoke-virtual {p1}, Lcom/google/android/gms/internal/pf;->readBytes()[B

    move-result-object v0

    iput-object v0, p0, Lcom/google/android/gms/internal/pr$c;->axr:[B

    goto :goto_0

    :sswitch_2
    invoke-virtual {p1}, Lcom/google/android/gms/internal/pf;->ql()I

    move-result v0

    iput v0, p0, Lcom/google/android/gms/internal/pr$c;->axl:I

    goto :goto_0

    :sswitch_3
    invoke-virtual {p1}, Lcom/google/android/gms/internal/pf;->ql()I

    move-result v0

    iput v0, p0, Lcom/google/android/gms/internal/pr$c;->axk:I

    goto :goto_0

    :sswitch_4
    invoke-virtual {p1}, Lcom/google/android/gms/internal/pf;->qm()Z

    move-result v0

    iput-boolean v0, p0, Lcom/google/android/gms/internal/pr$c;->axm:Z

    goto :goto_0

    :sswitch_5
    iget-object v0, p0, Lcom/google/android/gms/internal/pr$c;->axo:Lcom/google/android/gms/internal/pr$b;

    if-nez v0, :cond_1

    new-instance v0, Lcom/google/android/gms/internal/pr$b;

    invoke-direct {v0}, Lcom/google/android/gms/internal/pr$b;-><init>()V

    iput-object v0, p0, Lcom/google/android/gms/internal/pr$c;->axo:Lcom/google/android/gms/internal/pr$b;

    :cond_1
    iget-object v0, p0, Lcom/google/android/gms/internal/pr$c;->axo:Lcom/google/android/gms/internal/pr$b;

    goto :goto_1

    :sswitch_6
    invoke-virtual {p1}, Lcom/google/android/gms/internal/pf;->readBytes()[B

    move-result-object v0

    iput-object v0, p0, Lcom/google/android/gms/internal/pr$c;->axq:[B

    goto :goto_0

    :sswitch_7
    iget-object v0, p0, Lcom/google/android/gms/internal/pr$c;->axs:Lcom/google/android/gms/internal/pr$a;

    if-nez v0, :cond_2

    new-instance v0, Lcom/google/android/gms/internal/pr$a;

    invoke-direct {v0}, Lcom/google/android/gms/internal/pr$a;-><init>()V

    iput-object v0, p0, Lcom/google/android/gms/internal/pr$c;->axs:Lcom/google/android/gms/internal/pr$a;

    :cond_2
    iget-object v0, p0, Lcom/google/android/gms/internal/pr$c;->axs:Lcom/google/android/gms/internal/pr$a;

    :goto_1
    invoke-virtual {p1, v0}, Lcom/google/android/gms/internal/pf;->a(Lcom/google/android/gms/internal/pn;)V

    goto :goto_0

    :sswitch_8
    invoke-virtual {p1}, Lcom/google/android/gms/internal/pf;->readBytes()[B

    move-result-object v0

    iput-object v0, p0, Lcom/google/android/gms/internal/pr$c;->axp:[B

    goto :goto_0

    :sswitch_9
    const/16 v0, 0x1a

    invoke-static {p1, v0}, Lcom/google/android/gms/internal/pq;->b(Lcom/google/android/gms/internal/pf;I)I

    move-result v0

    iget-object v1, p0, Lcom/google/android/gms/internal/pr$c;->axn:[Lcom/google/android/gms/internal/pr$d;

    const/4 v2, 0x0

    if-nez v1, :cond_3

    move v3, v2

    goto :goto_2

    :cond_3
    array-length v3, v1

    :goto_2
    add-int/2addr v0, v3

    new-array v4, v0, [Lcom/google/android/gms/internal/pr$d;

    if-eqz v3, :cond_4

    invoke-static {v1, v2, v4, v2, v3}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    :cond_4
    :goto_3
    add-int/lit8 v1, v0, -0x1

    if-ge v3, v1, :cond_5

    new-instance v1, Lcom/google/android/gms/internal/pr$d;

    invoke-direct {v1}, Lcom/google/android/gms/internal/pr$d;-><init>()V

    aput-object v1, v4, v3

    invoke-virtual {p1, v1}, Lcom/google/android/gms/internal/pf;->a(Lcom/google/android/gms/internal/pn;)V

    invoke-virtual {p1}, Lcom/google/android/gms/internal/pf;->qi()I

    add-int/lit8 v3, v3, 0x1

    goto :goto_3

    :cond_5
    new-instance v0, Lcom/google/android/gms/internal/pr$d;

    invoke-direct {v0}, Lcom/google/android/gms/internal/pr$d;-><init>()V

    aput-object v0, v4, v3

    invoke-virtual {p1, v0}, Lcom/google/android/gms/internal/pf;->a(Lcom/google/android/gms/internal/pn;)V

    iput-object v4, p0, Lcom/google/android/gms/internal/pr$c;->axn:[Lcom/google/android/gms/internal/pr$d;

    goto/16 :goto_0

    :sswitch_a
    invoke-virtual {p1}, Lcom/google/android/gms/internal/pf;->readString()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/google/android/gms/internal/pr$c;->tag:Ljava/lang/String;

    goto/16 :goto_0

    :sswitch_b
    invoke-virtual {p1}, Lcom/google/android/gms/internal/pf;->qk()J

    move-result-wide v0

    iput-wide v0, p0, Lcom/google/android/gms/internal/pr$c;->axj:J

    goto/16 :goto_0

    :sswitch_c
    return-object p0

    nop

    :sswitch_data_0
    .sparse-switch
        0x0 -> :sswitch_c
        0x8 -> :sswitch_b
        0x12 -> :sswitch_a
        0x1a -> :sswitch_9
        0x32 -> :sswitch_8
        0x3a -> :sswitch_7
        0x42 -> :sswitch_6
        0x4a -> :sswitch_5
        0x50 -> :sswitch_4
        0x58 -> :sswitch_3
        0x60 -> :sswitch_2
        0x6a -> :sswitch_1
        0x72 -> :sswitch_0
    .end sparse-switch
.end method
