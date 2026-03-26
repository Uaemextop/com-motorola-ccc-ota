.class public final Lcom/google/android/gms/internal/pf;
.super Ljava/lang/Object;


# instance fields
.field private awA:I

.field private awB:I

.field private awC:I

.field private awD:I

.field private awE:I

.field private awF:I

.field private awG:I

.field private awH:I

.field private awz:I

.field private final buffer:[B


# direct methods
.method private constructor <init>([BII)V
    .locals 1

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const v0, 0x7fffffff

    iput v0, p0, Lcom/google/android/gms/internal/pf;->awE:I

    const/16 v0, 0x40

    iput v0, p0, Lcom/google/android/gms/internal/pf;->awG:I

    const/high16 v0, 0x4000000

    iput v0, p0, Lcom/google/android/gms/internal/pf;->awH:I

    iput-object p1, p0, Lcom/google/android/gms/internal/pf;->buffer:[B

    iput p2, p0, Lcom/google/android/gms/internal/pf;->awz:I

    add-int/2addr p3, p2

    iput p3, p0, Lcom/google/android/gms/internal/pf;->awA:I

    iput p2, p0, Lcom/google/android/gms/internal/pf;->awC:I

    return-void
.end method

.method public static A(J)J
    .locals 4

    const/4 v0, 0x1

    ushr-long v0, p0, v0

    const-wide/16 v2, 0x1

    and-long/2addr p0, v2

    neg-long p0, p0

    xor-long/2addr p0, v0

    return-wide p0
.end method

.method public static a([BII)Lcom/google/android/gms/internal/pf;
    .locals 1

    new-instance v0, Lcom/google/android/gms/internal/pf;

    invoke-direct {v0, p0, p1, p2}, Lcom/google/android/gms/internal/pf;-><init>([BII)V

    return-object v0
.end method

.method public static go(I)I
    .locals 1

    ushr-int/lit8 v0, p0, 0x1

    and-int/lit8 p0, p0, 0x1

    neg-int p0, p0

    xor-int/2addr p0, v0

    return p0
.end method

.method public static p([B)Lcom/google/android/gms/internal/pf;
    .locals 2

    const/4 v0, 0x0

    array-length v1, p0

    invoke-static {p0, v0, v1}, Lcom/google/android/gms/internal/pf;->a([BII)Lcom/google/android/gms/internal/pf;

    move-result-object p0

    return-object p0
.end method

.method private qt()V
    .locals 2

    iget v0, p0, Lcom/google/android/gms/internal/pf;->awA:I

    iget v1, p0, Lcom/google/android/gms/internal/pf;->awB:I

    add-int/2addr v0, v1

    iput v0, p0, Lcom/google/android/gms/internal/pf;->awA:I

    iget v1, p0, Lcom/google/android/gms/internal/pf;->awE:I

    if-le v0, v1, :cond_0

    sub-int v1, v0, v1

    iput v1, p0, Lcom/google/android/gms/internal/pf;->awB:I

    sub-int/2addr v0, v1

    iput v0, p0, Lcom/google/android/gms/internal/pf;->awA:I

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    iput v0, p0, Lcom/google/android/gms/internal/pf;->awB:I

    :goto_0
    return-void
.end method


# virtual methods
.method public a(Lcom/google/android/gms/internal/pn;)V
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    invoke-virtual {p0}, Lcom/google/android/gms/internal/pf;->qp()I

    move-result v0

    iget v1, p0, Lcom/google/android/gms/internal/pf;->awF:I

    iget v2, p0, Lcom/google/android/gms/internal/pf;->awG:I

    if-ge v1, v2, :cond_0

    invoke-virtual {p0, v0}, Lcom/google/android/gms/internal/pf;->gp(I)I

    move-result v0

    iget v1, p0, Lcom/google/android/gms/internal/pf;->awF:I

    add-int/lit8 v1, v1, 0x1

    iput v1, p0, Lcom/google/android/gms/internal/pf;->awF:I

    invoke-virtual {p1, p0}, Lcom/google/android/gms/internal/pn;->b(Lcom/google/android/gms/internal/pf;)Lcom/google/android/gms/internal/pn;

    const/4 p1, 0x0

    invoke-virtual {p0, p1}, Lcom/google/android/gms/internal/pf;->gm(I)V

    iget p1, p0, Lcom/google/android/gms/internal/pf;->awF:I

    add-int/lit8 p1, p1, -0x1

    iput p1, p0, Lcom/google/android/gms/internal/pf;->awF:I

    invoke-virtual {p0, v0}, Lcom/google/android/gms/internal/pf;->gq(I)V

    return-void

    :cond_0
    invoke-static {}, Lcom/google/android/gms/internal/pm;->qG()Lcom/google/android/gms/internal/pm;

    move-result-object p0

    throw p0
.end method

.method public a(Lcom/google/android/gms/internal/pn;I)V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    iget v0, p0, Lcom/google/android/gms/internal/pf;->awF:I

    iget v1, p0, Lcom/google/android/gms/internal/pf;->awG:I

    if-ge v0, v1, :cond_0

    add-int/lit8 v0, v0, 0x1

    iput v0, p0, Lcom/google/android/gms/internal/pf;->awF:I

    invoke-virtual {p1, p0}, Lcom/google/android/gms/internal/pn;->b(Lcom/google/android/gms/internal/pf;)Lcom/google/android/gms/internal/pn;

    const/4 p1, 0x4

    invoke-static {p2, p1}, Lcom/google/android/gms/internal/pq;->x(II)I

    move-result p1

    invoke-virtual {p0, p1}, Lcom/google/android/gms/internal/pf;->gm(I)V

    iget p1, p0, Lcom/google/android/gms/internal/pf;->awF:I

    add-int/lit8 p1, p1, -0x1

    iput p1, p0, Lcom/google/android/gms/internal/pf;->awF:I

    return-void

    :cond_0
    invoke-static {}, Lcom/google/android/gms/internal/pm;->qG()Lcom/google/android/gms/internal/pm;

    move-result-object p0

    throw p0
.end method

.method public getPosition()I
    .locals 1

    iget v0, p0, Lcom/google/android/gms/internal/pf;->awC:I

    iget p0, p0, Lcom/google/android/gms/internal/pf;->awz:I

    sub-int/2addr v0, p0

    return v0
.end method

.method public gm(I)V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/android/gms/internal/pm;
        }
    .end annotation

    iget p0, p0, Lcom/google/android/gms/internal/pf;->awD:I

    if-ne p0, p1, :cond_0

    return-void

    :cond_0
    invoke-static {}, Lcom/google/android/gms/internal/pm;->qE()Lcom/google/android/gms/internal/pm;

    move-result-object p0

    throw p0
.end method

.method public gn(I)Z
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    invoke-static {p1}, Lcom/google/android/gms/internal/pq;->gH(I)I

    move-result v0

    const/4 v1, 0x1

    if-eqz v0, :cond_5

    if-eq v0, v1, :cond_4

    const/4 v2, 0x2

    if-eq v0, v2, :cond_3

    const/4 v2, 0x3

    const/4 v3, 0x4

    if-eq v0, v2, :cond_2

    if-eq v0, v3, :cond_1

    const/4 p1, 0x5

    if-ne v0, p1, :cond_0

    invoke-virtual {p0}, Lcom/google/android/gms/internal/pf;->qr()I

    return v1

    :cond_0
    invoke-static {}, Lcom/google/android/gms/internal/pm;->qF()Lcom/google/android/gms/internal/pm;

    move-result-object p0

    throw p0

    :cond_1
    const/4 p0, 0x0

    return p0

    :cond_2
    invoke-virtual {p0}, Lcom/google/android/gms/internal/pf;->qj()V

    invoke-static {p1}, Lcom/google/android/gms/internal/pq;->gI(I)I

    move-result p1

    invoke-static {p1, v3}, Lcom/google/android/gms/internal/pq;->x(II)I

    move-result p1

    invoke-virtual {p0, p1}, Lcom/google/android/gms/internal/pf;->gm(I)V

    return v1

    :cond_3
    invoke-virtual {p0}, Lcom/google/android/gms/internal/pf;->qp()I

    move-result p1

    invoke-virtual {p0, p1}, Lcom/google/android/gms/internal/pf;->gt(I)V

    return v1

    :cond_4
    invoke-virtual {p0}, Lcom/google/android/gms/internal/pf;->qs()J

    return v1

    :cond_5
    invoke-virtual {p0}, Lcom/google/android/gms/internal/pf;->ql()I

    return v1
.end method

.method public gp(I)I
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/android/gms/internal/pm;
        }
    .end annotation

    if-ltz p1, :cond_1

    iget v0, p0, Lcom/google/android/gms/internal/pf;->awC:I

    add-int/2addr p1, v0

    iget v0, p0, Lcom/google/android/gms/internal/pf;->awE:I

    if-gt p1, v0, :cond_0

    iput p1, p0, Lcom/google/android/gms/internal/pf;->awE:I

    invoke-direct {p0}, Lcom/google/android/gms/internal/pf;->qt()V

    return v0

    :cond_0
    invoke-static {}, Lcom/google/android/gms/internal/pm;->qA()Lcom/google/android/gms/internal/pm;

    move-result-object p0

    throw p0

    :cond_1
    invoke-static {}, Lcom/google/android/gms/internal/pm;->qB()Lcom/google/android/gms/internal/pm;

    move-result-object p0

    throw p0
.end method

.method public gq(I)V
    .locals 0

    iput p1, p0, Lcom/google/android/gms/internal/pf;->awE:I

    invoke-direct {p0}, Lcom/google/android/gms/internal/pf;->qt()V

    return-void
.end method

.method public gr(I)V
    .locals 3

    iget v0, p0, Lcom/google/android/gms/internal/pf;->awC:I

    iget v1, p0, Lcom/google/android/gms/internal/pf;->awz:I

    sub-int/2addr v0, v1

    if-gt p1, v0, :cond_1

    if-ltz p1, :cond_0

    add-int/2addr v1, p1

    iput v1, p0, Lcom/google/android/gms/internal/pf;->awC:I

    return-void

    :cond_0
    new-instance p0, Ljava/lang/IllegalArgumentException;

    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "Bad position "

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-direct {p0, p1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p0

    :cond_1
    new-instance v0, Ljava/lang/IllegalArgumentException;

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "Position "

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object p1

    const-string v1, " is beyond current "

    invoke-virtual {p1, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    iget v1, p0, Lcom/google/android/gms/internal/pf;->awC:I

    iget p0, p0, Lcom/google/android/gms/internal/pf;->awz:I

    sub-int/2addr v1, p0

    invoke-virtual {p1, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-direct {v0, p0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public gs(I)[B
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    if-ltz p1, :cond_2

    iget v0, p0, Lcom/google/android/gms/internal/pf;->awC:I

    add-int v1, v0, p1

    iget v2, p0, Lcom/google/android/gms/internal/pf;->awE:I

    if-gt v1, v2, :cond_1

    iget v1, p0, Lcom/google/android/gms/internal/pf;->awA:I

    sub-int/2addr v1, v0

    if-gt p1, v1, :cond_0

    new-array v1, p1, [B

    iget-object v2, p0, Lcom/google/android/gms/internal/pf;->buffer:[B

    const/4 v3, 0x0

    invoke-static {v2, v0, v1, v3, p1}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    iget v0, p0, Lcom/google/android/gms/internal/pf;->awC:I

    add-int/2addr v0, p1

    iput v0, p0, Lcom/google/android/gms/internal/pf;->awC:I

    return-object v1

    :cond_0
    invoke-static {}, Lcom/google/android/gms/internal/pm;->qA()Lcom/google/android/gms/internal/pm;

    move-result-object p0

    throw p0

    :cond_1
    sub-int/2addr v2, v0

    invoke-virtual {p0, v2}, Lcom/google/android/gms/internal/pf;->gt(I)V

    invoke-static {}, Lcom/google/android/gms/internal/pm;->qA()Lcom/google/android/gms/internal/pm;

    move-result-object p0

    throw p0

    :cond_2
    invoke-static {}, Lcom/google/android/gms/internal/pm;->qB()Lcom/google/android/gms/internal/pm;

    move-result-object p0

    throw p0
.end method

.method public gt(I)V
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    if-ltz p1, :cond_2

    iget v0, p0, Lcom/google/android/gms/internal/pf;->awC:I

    add-int v1, v0, p1

    iget v2, p0, Lcom/google/android/gms/internal/pf;->awE:I

    if-gt v1, v2, :cond_1

    iget v1, p0, Lcom/google/android/gms/internal/pf;->awA:I

    sub-int/2addr v1, v0

    if-gt p1, v1, :cond_0

    add-int/2addr v0, p1

    iput v0, p0, Lcom/google/android/gms/internal/pf;->awC:I

    return-void

    :cond_0
    invoke-static {}, Lcom/google/android/gms/internal/pm;->qA()Lcom/google/android/gms/internal/pm;

    move-result-object p0

    throw p0

    :cond_1
    sub-int/2addr v2, v0

    invoke-virtual {p0, v2}, Lcom/google/android/gms/internal/pf;->gt(I)V

    invoke-static {}, Lcom/google/android/gms/internal/pm;->qA()Lcom/google/android/gms/internal/pm;

    move-result-object p0

    throw p0

    :cond_2
    invoke-static {}, Lcom/google/android/gms/internal/pm;->qB()Lcom/google/android/gms/internal/pm;

    move-result-object p0

    throw p0
.end method

.method public qi()I
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    invoke-virtual {p0}, Lcom/google/android/gms/internal/pf;->qv()Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 v0, 0x0

    iput v0, p0, Lcom/google/android/gms/internal/pf;->awD:I

    return v0

    :cond_0
    invoke-virtual {p0}, Lcom/google/android/gms/internal/pf;->qp()I

    move-result v0

    iput v0, p0, Lcom/google/android/gms/internal/pf;->awD:I

    if-eqz v0, :cond_1

    return v0

    :cond_1
    invoke-static {}, Lcom/google/android/gms/internal/pm;->qD()Lcom/google/android/gms/internal/pm;

    move-result-object p0

    throw p0
.end method

.method public qj()V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    :cond_0
    invoke-virtual {p0}, Lcom/google/android/gms/internal/pf;->qi()I

    move-result v0

    if-eqz v0, :cond_1

    invoke-virtual {p0, v0}, Lcom/google/android/gms/internal/pf;->gn(I)Z

    move-result v0

    if-nez v0, :cond_0

    :cond_1
    return-void
.end method

.method public qk()J
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    invoke-virtual {p0}, Lcom/google/android/gms/internal/pf;->qq()J

    move-result-wide v0

    return-wide v0
.end method

.method public ql()I
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    invoke-virtual {p0}, Lcom/google/android/gms/internal/pf;->qp()I

    move-result p0

    return p0
.end method

.method public qm()Z
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    invoke-virtual {p0}, Lcom/google/android/gms/internal/pf;->qp()I

    move-result p0

    if-eqz p0, :cond_0

    const/4 p0, 0x1

    goto :goto_0

    :cond_0
    const/4 p0, 0x0

    :goto_0
    return p0
.end method

.method public qn()I
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    invoke-virtual {p0}, Lcom/google/android/gms/internal/pf;->qp()I

    move-result p0

    invoke-static {p0}, Lcom/google/android/gms/internal/pf;->go(I)I

    move-result p0

    return p0
.end method

.method public qo()J
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    invoke-virtual {p0}, Lcom/google/android/gms/internal/pf;->qq()J

    move-result-wide v0

    invoke-static {v0, v1}, Lcom/google/android/gms/internal/pf;->A(J)J

    move-result-wide v0

    return-wide v0
.end method

.method public qp()I
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    invoke-virtual {p0}, Lcom/google/android/gms/internal/pf;->qw()B

    move-result v0

    if-ltz v0, :cond_0

    return v0

    :cond_0
    and-int/lit8 v0, v0, 0x7f

    invoke-virtual {p0}, Lcom/google/android/gms/internal/pf;->qw()B

    move-result v1

    if-ltz v1, :cond_1

    shl-int/lit8 p0, v1, 0x7

    :goto_0
    or-int/2addr p0, v0

    goto :goto_2

    :cond_1
    and-int/lit8 v1, v1, 0x7f

    shl-int/lit8 v1, v1, 0x7

    or-int/2addr v0, v1

    invoke-virtual {p0}, Lcom/google/android/gms/internal/pf;->qw()B

    move-result v1

    if-ltz v1, :cond_2

    shl-int/lit8 p0, v1, 0xe

    goto :goto_0

    :cond_2
    and-int/lit8 v1, v1, 0x7f

    shl-int/lit8 v1, v1, 0xe

    or-int/2addr v0, v1

    invoke-virtual {p0}, Lcom/google/android/gms/internal/pf;->qw()B

    move-result v1

    if-ltz v1, :cond_3

    shl-int/lit8 p0, v1, 0x15

    goto :goto_0

    :cond_3
    and-int/lit8 v1, v1, 0x7f

    shl-int/lit8 v1, v1, 0x15

    or-int/2addr v0, v1

    invoke-virtual {p0}, Lcom/google/android/gms/internal/pf;->qw()B

    move-result v1

    shl-int/lit8 v2, v1, 0x1c

    or-int/2addr v0, v2

    if-gez v1, :cond_6

    const/4 v1, 0x0

    :goto_1
    const/4 v2, 0x5

    if-ge v1, v2, :cond_5

    invoke-virtual {p0}, Lcom/google/android/gms/internal/pf;->qw()B

    move-result v2

    if-ltz v2, :cond_4

    return v0

    :cond_4
    add-int/lit8 v1, v1, 0x1

    goto :goto_1

    :cond_5
    invoke-static {}, Lcom/google/android/gms/internal/pm;->qC()Lcom/google/android/gms/internal/pm;

    move-result-object p0

    throw p0

    :cond_6
    move p0, v0

    :goto_2
    return p0
.end method

.method public qq()J
    .locals 6
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    const/4 v0, 0x0

    const-wide/16 v1, 0x0

    :goto_0
    const/16 v3, 0x40

    if-ge v0, v3, :cond_1

    invoke-virtual {p0}, Lcom/google/android/gms/internal/pf;->qw()B

    move-result v3

    and-int/lit8 v4, v3, 0x7f

    int-to-long v4, v4

    shl-long/2addr v4, v0

    or-long/2addr v1, v4

    and-int/lit16 v3, v3, 0x80

    if-nez v3, :cond_0

    return-wide v1

    :cond_0
    add-int/lit8 v0, v0, 0x7

    goto :goto_0

    :cond_1
    invoke-static {}, Lcom/google/android/gms/internal/pm;->qC()Lcom/google/android/gms/internal/pm;

    move-result-object p0

    throw p0
.end method

.method public qr()I
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    invoke-virtual {p0}, Lcom/google/android/gms/internal/pf;->qw()B

    move-result v0

    invoke-virtual {p0}, Lcom/google/android/gms/internal/pf;->qw()B

    move-result v1

    invoke-virtual {p0}, Lcom/google/android/gms/internal/pf;->qw()B

    move-result v2

    invoke-virtual {p0}, Lcom/google/android/gms/internal/pf;->qw()B

    move-result p0

    and-int/lit16 v0, v0, 0xff

    and-int/lit16 v1, v1, 0xff

    shl-int/lit8 v1, v1, 0x8

    or-int/2addr v0, v1

    and-int/lit16 v1, v2, 0xff

    shl-int/lit8 v1, v1, 0x10

    or-int/2addr v0, v1

    and-int/lit16 p0, p0, 0xff

    shl-int/lit8 p0, p0, 0x18

    or-int/2addr p0, v0

    return p0
.end method

.method public qs()J
    .locals 12
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    invoke-virtual {p0}, Lcom/google/android/gms/internal/pf;->qw()B

    move-result v0

    invoke-virtual {p0}, Lcom/google/android/gms/internal/pf;->qw()B

    move-result v1

    invoke-virtual {p0}, Lcom/google/android/gms/internal/pf;->qw()B

    move-result v2

    invoke-virtual {p0}, Lcom/google/android/gms/internal/pf;->qw()B

    move-result v3

    invoke-virtual {p0}, Lcom/google/android/gms/internal/pf;->qw()B

    move-result v4

    invoke-virtual {p0}, Lcom/google/android/gms/internal/pf;->qw()B

    move-result v5

    invoke-virtual {p0}, Lcom/google/android/gms/internal/pf;->qw()B

    move-result v6

    invoke-virtual {p0}, Lcom/google/android/gms/internal/pf;->qw()B

    move-result p0

    int-to-long v7, v0

    const-wide/16 v9, 0xff

    and-long/2addr v7, v9

    int-to-long v0, v1

    and-long/2addr v0, v9

    const/16 v11, 0x8

    shl-long/2addr v0, v11

    or-long/2addr v0, v7

    int-to-long v7, v2

    and-long/2addr v7, v9

    const/16 v2, 0x10

    shl-long/2addr v7, v2

    or-long/2addr v0, v7

    int-to-long v2, v3

    and-long/2addr v2, v9

    const/16 v7, 0x18

    shl-long/2addr v2, v7

    or-long/2addr v0, v2

    int-to-long v2, v4

    and-long/2addr v2, v9

    const/16 v4, 0x20

    shl-long/2addr v2, v4

    or-long/2addr v0, v2

    int-to-long v2, v5

    and-long/2addr v2, v9

    const/16 v4, 0x28

    shl-long/2addr v2, v4

    or-long/2addr v0, v2

    int-to-long v2, v6

    and-long/2addr v2, v9

    const/16 v4, 0x30

    shl-long/2addr v2, v4

    or-long/2addr v0, v2

    int-to-long v2, p0

    and-long/2addr v2, v9

    const/16 p0, 0x38

    shl-long/2addr v2, p0

    or-long/2addr v0, v2

    return-wide v0
.end method

.method public qu()I
    .locals 2

    iget v0, p0, Lcom/google/android/gms/internal/pf;->awE:I

    const v1, 0x7fffffff

    if-ne v0, v1, :cond_0

    const/4 p0, -0x1

    return p0

    :cond_0
    iget p0, p0, Lcom/google/android/gms/internal/pf;->awC:I

    sub-int/2addr v0, p0

    return v0
.end method

.method public qv()Z
    .locals 1

    iget v0, p0, Lcom/google/android/gms/internal/pf;->awC:I

    iget p0, p0, Lcom/google/android/gms/internal/pf;->awA:I

    if-ne v0, p0, :cond_0

    const/4 p0, 0x1

    goto :goto_0

    :cond_0
    const/4 p0, 0x0

    :goto_0
    return p0
.end method

.method public qw()B
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    iget v0, p0, Lcom/google/android/gms/internal/pf;->awC:I

    iget v1, p0, Lcom/google/android/gms/internal/pf;->awA:I

    if-eq v0, v1, :cond_0

    iget-object v1, p0, Lcom/google/android/gms/internal/pf;->buffer:[B

    add-int/lit8 v2, v0, 0x1

    iput v2, p0, Lcom/google/android/gms/internal/pf;->awC:I

    aget-byte p0, v1, v0

    return p0

    :cond_0
    invoke-static {}, Lcom/google/android/gms/internal/pm;->qA()Lcom/google/android/gms/internal/pm;

    move-result-object p0

    throw p0
.end method

.method public r(II)[B
    .locals 2

    if-nez p2, :cond_0

    sget-object p0, Lcom/google/android/gms/internal/pq;->axd:[B

    return-object p0

    :cond_0
    new-array v0, p2, [B

    iget v1, p0, Lcom/google/android/gms/internal/pf;->awz:I

    add-int/2addr v1, p1

    iget-object p0, p0, Lcom/google/android/gms/internal/pf;->buffer:[B

    const/4 p1, 0x0

    invoke-static {p0, v1, v0, p1, p2}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    return-object v0
.end method

.method public readBytes()[B
    .locals 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    invoke-virtual {p0}, Lcom/google/android/gms/internal/pf;->qp()I

    move-result v0

    iget v1, p0, Lcom/google/android/gms/internal/pf;->awA:I

    iget v2, p0, Lcom/google/android/gms/internal/pf;->awC:I

    sub-int/2addr v1, v2

    if-gt v0, v1, :cond_0

    if-lez v0, :cond_0

    new-array v1, v0, [B

    iget-object v3, p0, Lcom/google/android/gms/internal/pf;->buffer:[B

    const/4 v4, 0x0

    invoke-static {v3, v2, v1, v4, v0}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    iget v2, p0, Lcom/google/android/gms/internal/pf;->awC:I

    add-int/2addr v2, v0

    iput v2, p0, Lcom/google/android/gms/internal/pf;->awC:I

    return-object v1

    :cond_0
    invoke-virtual {p0, v0}, Lcom/google/android/gms/internal/pf;->gs(I)[B

    move-result-object p0

    return-object p0
.end method

.method public readDouble()D
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    invoke-virtual {p0}, Lcom/google/android/gms/internal/pf;->qs()J

    move-result-wide v0

    invoke-static {v0, v1}, Ljava/lang/Double;->longBitsToDouble(J)D

    move-result-wide v0

    return-wide v0
.end method

.method public readFloat()F
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    invoke-virtual {p0}, Lcom/google/android/gms/internal/pf;->qr()I

    move-result p0

    invoke-static {p0}, Ljava/lang/Float;->intBitsToFloat(I)F

    move-result p0

    return p0
.end method

.method public readString()Ljava/lang/String;
    .locals 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    invoke-virtual {p0}, Lcom/google/android/gms/internal/pf;->qp()I

    move-result v0

    iget v1, p0, Lcom/google/android/gms/internal/pf;->awA:I

    iget v2, p0, Lcom/google/android/gms/internal/pf;->awC:I

    sub-int/2addr v1, v2

    const-string v2, "UTF-8"

    if-gt v0, v1, :cond_0

    if-lez v0, :cond_0

    new-instance v1, Ljava/lang/String;

    iget-object v3, p0, Lcom/google/android/gms/internal/pf;->buffer:[B

    iget v4, p0, Lcom/google/android/gms/internal/pf;->awC:I

    invoke-direct {v1, v3, v4, v0, v2}, Ljava/lang/String;-><init>([BIILjava/lang/String;)V

    iget v2, p0, Lcom/google/android/gms/internal/pf;->awC:I

    add-int/2addr v2, v0

    iput v2, p0, Lcom/google/android/gms/internal/pf;->awC:I

    return-object v1

    :cond_0
    new-instance v1, Ljava/lang/String;

    invoke-virtual {p0, v0}, Lcom/google/android/gms/internal/pf;->gs(I)[B

    move-result-object p0

    invoke-direct {v1, p0, v2}, Ljava/lang/String;-><init>([BLjava/lang/String;)V

    return-object v1
.end method
