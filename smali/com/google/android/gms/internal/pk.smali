.class Lcom/google/android/gms/internal/pk;
.super Ljava/lang/Object;


# instance fields
.field private awQ:Lcom/google/android/gms/internal/pi;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/google/android/gms/internal/pi<",
            "**>;"
        }
    .end annotation
.end field

.field private awR:Ljava/lang/Object;

.field private awS:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/google/android/gms/internal/pp;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method constructor <init>()V
    .locals 1

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/google/android/gms/internal/pk;->awS:Ljava/util/List;

    return-void
.end method

.method private toByteArray()[B
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    invoke-virtual {p0}, Lcom/google/android/gms/internal/pk;->c()I

    move-result v0

    new-array v0, v0, [B

    invoke-static {v0}, Lcom/google/android/gms/internal/pg;->q([B)Lcom/google/android/gms/internal/pg;

    move-result-object v1

    invoke-virtual {p0, v1}, Lcom/google/android/gms/internal/pk;->a(Lcom/google/android/gms/internal/pg;)V

    return-object v0
.end method


# virtual methods
.method a(Lcom/google/android/gms/internal/pg;)V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    iget-object v0, p0, Lcom/google/android/gms/internal/pk;->awR:Ljava/lang/Object;

    if-eqz v0, :cond_0

    iget-object p0, p0, Lcom/google/android/gms/internal/pk;->awQ:Lcom/google/android/gms/internal/pi;

    invoke-virtual {p0, v0, p1}, Lcom/google/android/gms/internal/pi;->a(Ljava/lang/Object;Lcom/google/android/gms/internal/pg;)V

    goto :goto_1

    :cond_0
    iget-object p0, p0, Lcom/google/android/gms/internal/pk;->awS:Ljava/util/List;

    invoke-interface {p0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object p0

    :goto_0
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_1

    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/google/android/gms/internal/pp;

    invoke-virtual {v0, p1}, Lcom/google/android/gms/internal/pp;->a(Lcom/google/android/gms/internal/pg;)V

    goto :goto_0

    :cond_1
    :goto_1
    return-void
.end method

.method a(Lcom/google/android/gms/internal/pp;)V
    .locals 0

    iget-object p0, p0, Lcom/google/android/gms/internal/pk;->awS:Ljava/util/List;

    invoke-interface {p0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    return-void
.end method

.method b(Lcom/google/android/gms/internal/pi;)Ljava/lang/Object;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Lcom/google/android/gms/internal/pi<",
            "*TT;>;)TT;"
        }
    .end annotation

    iget-object v0, p0, Lcom/google/android/gms/internal/pk;->awR:Ljava/lang/Object;

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/google/android/gms/internal/pk;->awQ:Lcom/google/android/gms/internal/pi;

    if-ne v0, p1, :cond_0

    goto :goto_0

    :cond_0
    new-instance p0, Ljava/lang/IllegalStateException;

    const-string p1, "Tried to getExtension with a differernt Extension."

    invoke-direct {p0, p1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw p0

    :cond_1
    iput-object p1, p0, Lcom/google/android/gms/internal/pk;->awQ:Lcom/google/android/gms/internal/pi;

    iget-object v0, p0, Lcom/google/android/gms/internal/pk;->awS:Ljava/util/List;

    invoke-virtual {p1, v0}, Lcom/google/android/gms/internal/pi;->l(Ljava/util/List;)Ljava/lang/Object;

    move-result-object p1

    iput-object p1, p0, Lcom/google/android/gms/internal/pk;->awR:Ljava/lang/Object;

    const/4 p1, 0x0

    iput-object p1, p0, Lcom/google/android/gms/internal/pk;->awS:Ljava/util/List;

    :goto_0
    iget-object p0, p0, Lcom/google/android/gms/internal/pk;->awR:Ljava/lang/Object;

    return-object p0
.end method

.method c()I
    .locals 2

    iget-object v0, p0, Lcom/google/android/gms/internal/pk;->awR:Ljava/lang/Object;

    if-eqz v0, :cond_0

    iget-object p0, p0, Lcom/google/android/gms/internal/pk;->awQ:Lcom/google/android/gms/internal/pi;

    invoke-virtual {p0, v0}, Lcom/google/android/gms/internal/pi;->A(Ljava/lang/Object;)I

    move-result p0

    goto :goto_1

    :cond_0
    iget-object p0, p0, Lcom/google/android/gms/internal/pk;->awS:Ljava/util/List;

    invoke-interface {p0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object p0

    const/4 v0, 0x0

    :goto_0
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_1

    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/google/android/gms/internal/pp;

    invoke-virtual {v1}, Lcom/google/android/gms/internal/pp;->c()I

    move-result v1

    add-int/2addr v0, v1

    goto :goto_0

    :cond_1
    move p0, v0

    :goto_1
    return p0
.end method

.method public equals(Ljava/lang/Object;)Z
    .locals 3

    if-ne p1, p0, :cond_0

    const/4 p0, 0x1

    return p0

    :cond_0
    instance-of v0, p1, Lcom/google/android/gms/internal/pk;

    const/4 v1, 0x0

    if-nez v0, :cond_1

    return v1

    :cond_1
    check-cast p1, Lcom/google/android/gms/internal/pk;

    iget-object v0, p0, Lcom/google/android/gms/internal/pk;->awR:Ljava/lang/Object;

    if-eqz v0, :cond_a

    iget-object v0, p1, Lcom/google/android/gms/internal/pk;->awR:Ljava/lang/Object;

    if-eqz v0, :cond_a

    iget-object v0, p0, Lcom/google/android/gms/internal/pk;->awQ:Lcom/google/android/gms/internal/pi;

    iget-object v2, p1, Lcom/google/android/gms/internal/pk;->awQ:Lcom/google/android/gms/internal/pi;

    if-eq v0, v2, :cond_2

    return v1

    :cond_2
    iget-object v0, v0, Lcom/google/android/gms/internal/pi;->awK:Ljava/lang/Class;

    invoke-virtual {v0}, Ljava/lang/Class;->isArray()Z

    move-result v0

    iget-object p0, p0, Lcom/google/android/gms/internal/pk;->awR:Ljava/lang/Object;

    if-nez v0, :cond_3

    iget-object p1, p1, Lcom/google/android/gms/internal/pk;->awR:Ljava/lang/Object;

    invoke-virtual {p0, p1}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result p0

    return p0

    :cond_3
    instance-of v0, p0, [B

    if-eqz v0, :cond_4

    check-cast p0, [B

    check-cast p0, [B

    iget-object p1, p1, Lcom/google/android/gms/internal/pk;->awR:Ljava/lang/Object;

    check-cast p1, [B

    check-cast p1, [B

    invoke-static {p0, p1}, Ljava/util/Arrays;->equals([B[B)Z

    move-result p0

    return p0

    :cond_4
    instance-of v0, p0, [I

    if-eqz v0, :cond_5

    check-cast p0, [I

    check-cast p0, [I

    iget-object p1, p1, Lcom/google/android/gms/internal/pk;->awR:Ljava/lang/Object;

    check-cast p1, [I

    check-cast p1, [I

    invoke-static {p0, p1}, Ljava/util/Arrays;->equals([I[I)Z

    move-result p0

    return p0

    :cond_5
    instance-of v0, p0, [J

    if-eqz v0, :cond_6

    check-cast p0, [J

    check-cast p0, [J

    iget-object p1, p1, Lcom/google/android/gms/internal/pk;->awR:Ljava/lang/Object;

    check-cast p1, [J

    check-cast p1, [J

    invoke-static {p0, p1}, Ljava/util/Arrays;->equals([J[J)Z

    move-result p0

    return p0

    :cond_6
    instance-of v0, p0, [F

    if-eqz v0, :cond_7

    check-cast p0, [F

    check-cast p0, [F

    iget-object p1, p1, Lcom/google/android/gms/internal/pk;->awR:Ljava/lang/Object;

    check-cast p1, [F

    check-cast p1, [F

    invoke-static {p0, p1}, Ljava/util/Arrays;->equals([F[F)Z

    move-result p0

    return p0

    :cond_7
    instance-of v0, p0, [D

    if-eqz v0, :cond_8

    check-cast p0, [D

    check-cast p0, [D

    iget-object p1, p1, Lcom/google/android/gms/internal/pk;->awR:Ljava/lang/Object;

    check-cast p1, [D

    check-cast p1, [D

    invoke-static {p0, p1}, Ljava/util/Arrays;->equals([D[D)Z

    move-result p0

    return p0

    :cond_8
    instance-of v0, p0, [Z

    if-eqz v0, :cond_9

    check-cast p0, [Z

    check-cast p0, [Z

    iget-object p1, p1, Lcom/google/android/gms/internal/pk;->awR:Ljava/lang/Object;

    check-cast p1, [Z

    check-cast p1, [Z

    invoke-static {p0, p1}, Ljava/util/Arrays;->equals([Z[Z)Z

    move-result p0

    return p0

    :cond_9
    check-cast p0, [Ljava/lang/Object;

    check-cast p0, [Ljava/lang/Object;

    iget-object p1, p1, Lcom/google/android/gms/internal/pk;->awR:Ljava/lang/Object;

    check-cast p1, [Ljava/lang/Object;

    check-cast p1, [Ljava/lang/Object;

    invoke-static {p0, p1}, Ljava/util/Arrays;->deepEquals([Ljava/lang/Object;[Ljava/lang/Object;)Z

    move-result p0

    return p0

    :cond_a
    iget-object v0, p0, Lcom/google/android/gms/internal/pk;->awS:Ljava/util/List;

    if-eqz v0, :cond_b

    iget-object v1, p1, Lcom/google/android/gms/internal/pk;->awS:Ljava/util/List;

    if-eqz v1, :cond_b

    invoke-interface {v0, v1}, Ljava/util/List;->equals(Ljava/lang/Object;)Z

    move-result p0

    return p0

    :cond_b
    :try_start_0
    invoke-direct {p0}, Lcom/google/android/gms/internal/pk;->toByteArray()[B

    move-result-object p0

    invoke-direct {p1}, Lcom/google/android/gms/internal/pk;->toByteArray()[B

    move-result-object p1

    invoke-static {p0, p1}, Ljava/util/Arrays;->equals([B[B)Z

    move-result p0
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    return p0

    :catch_0
    move-exception p0

    new-instance p1, Ljava/lang/IllegalStateException;

    invoke-direct {p1, p0}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/Throwable;)V

    throw p1
.end method

.method public hashCode()I
    .locals 1

    :try_start_0
    invoke-direct {p0}, Lcom/google/android/gms/internal/pk;->toByteArray()[B

    move-result-object p0

    invoke-static {p0}, Ljava/util/Arrays;->hashCode([B)I

    move-result p0
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    const/16 v0, 0x20f

    add-int/2addr v0, p0

    return v0

    :catch_0
    move-exception p0

    new-instance v0, Ljava/lang/IllegalStateException;

    invoke-direct {v0, p0}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/Throwable;)V

    throw v0
.end method
