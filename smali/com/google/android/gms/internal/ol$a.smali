.class public final Lcom/google/android/gms/internal/ol$a;
.super Lcom/google/android/gms/internal/ph;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/google/android/gms/internal/ol;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "a"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/google/android/gms/internal/ph<",
        "Lcom/google/android/gms/internal/ol$a;",
        ">;"
    }
.end annotation


# instance fields
.field public asr:J

.field public ass:Lcom/google/android/gms/internal/c$j;

.field public gs:Lcom/google/android/gms/internal/c$f;


# direct methods
.method public constructor <init>()V
    .locals 0

    invoke-direct {p0}, Lcom/google/android/gms/internal/ph;-><init>()V

    invoke-virtual {p0}, Lcom/google/android/gms/internal/ol$a;->pL()Lcom/google/android/gms/internal/ol$a;

    return-void
.end method

.method public static l([B)Lcom/google/android/gms/internal/ol$a;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/android/gms/internal/pm;
        }
    .end annotation

    new-instance v0, Lcom/google/android/gms/internal/ol$a;

    invoke-direct {v0}, Lcom/google/android/gms/internal/ol$a;-><init>()V

    invoke-static {v0, p0}, Lcom/google/android/gms/internal/pn;->a(Lcom/google/android/gms/internal/pn;[B)Lcom/google/android/gms/internal/pn;

    move-result-object p0

    check-cast p0, Lcom/google/android/gms/internal/ol$a;

    return-object p0
.end method


# virtual methods
.method public a(Lcom/google/android/gms/internal/pg;)V
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    const/4 v0, 0x1

    iget-wide v1, p0, Lcom/google/android/gms/internal/ol$a;->asr:J

    invoke-virtual {p1, v0, v1, v2}, Lcom/google/android/gms/internal/pg;->b(IJ)V

    iget-object v0, p0, Lcom/google/android/gms/internal/ol$a;->gs:Lcom/google/android/gms/internal/c$f;

    if-eqz v0, :cond_0

    const/4 v1, 0x2

    invoke-virtual {p1, v1, v0}, Lcom/google/android/gms/internal/pg;->a(ILcom/google/android/gms/internal/pn;)V

    :cond_0
    iget-object v0, p0, Lcom/google/android/gms/internal/ol$a;->ass:Lcom/google/android/gms/internal/c$j;

    if-eqz v0, :cond_1

    const/4 v1, 0x3

    invoke-virtual {p1, v1, v0}, Lcom/google/android/gms/internal/pg;->a(ILcom/google/android/gms/internal/pn;)V

    :cond_1
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

    invoke-virtual {p0, p1}, Lcom/google/android/gms/internal/ol$a;->p(Lcom/google/android/gms/internal/pf;)Lcom/google/android/gms/internal/ol$a;

    move-result-object p0

    return-object p0
.end method

.method protected c()I
    .locals 4

    invoke-super {p0}, Lcom/google/android/gms/internal/ph;->c()I

    move-result v0

    const/4 v1, 0x1

    iget-wide v2, p0, Lcom/google/android/gms/internal/ol$a;->asr:J

    invoke-static {v1, v2, v3}, Lcom/google/android/gms/internal/pg;->d(IJ)I

    move-result v1

    add-int/2addr v0, v1

    iget-object v1, p0, Lcom/google/android/gms/internal/ol$a;->gs:Lcom/google/android/gms/internal/c$f;

    if-eqz v1, :cond_0

    const/4 v2, 0x2

    invoke-static {v2, v1}, Lcom/google/android/gms/internal/pg;->c(ILcom/google/android/gms/internal/pn;)I

    move-result v1

    add-int/2addr v0, v1

    :cond_0
    iget-object p0, p0, Lcom/google/android/gms/internal/ol$a;->ass:Lcom/google/android/gms/internal/c$j;

    if-eqz p0, :cond_1

    const/4 v1, 0x3

    invoke-static {v1, p0}, Lcom/google/android/gms/internal/pg;->c(ILcom/google/android/gms/internal/pn;)I

    move-result p0

    add-int/2addr v0, p0

    :cond_1
    return v0
.end method

.method public equals(Ljava/lang/Object;)Z
    .locals 6

    if-ne p1, p0, :cond_0

    const/4 p0, 0x1

    return p0

    :cond_0
    instance-of v0, p1, Lcom/google/android/gms/internal/ol$a;

    const/4 v1, 0x0

    if-nez v0, :cond_1

    return v1

    :cond_1
    check-cast p1, Lcom/google/android/gms/internal/ol$a;

    iget-wide v2, p0, Lcom/google/android/gms/internal/ol$a;->asr:J

    iget-wide v4, p1, Lcom/google/android/gms/internal/ol$a;->asr:J

    cmp-long v0, v2, v4

    if-eqz v0, :cond_2

    return v1

    :cond_2
    iget-object v0, p0, Lcom/google/android/gms/internal/ol$a;->gs:Lcom/google/android/gms/internal/c$f;

    if-nez v0, :cond_3

    iget-object v0, p1, Lcom/google/android/gms/internal/ol$a;->gs:Lcom/google/android/gms/internal/c$f;

    if-eqz v0, :cond_4

    return v1

    :cond_3
    iget-object v2, p1, Lcom/google/android/gms/internal/ol$a;->gs:Lcom/google/android/gms/internal/c$f;

    invoke-virtual {v0, v2}, Lcom/google/android/gms/internal/c$f;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_4

    return v1

    :cond_4
    iget-object v0, p0, Lcom/google/android/gms/internal/ol$a;->ass:Lcom/google/android/gms/internal/c$j;

    if-nez v0, :cond_5

    iget-object v0, p1, Lcom/google/android/gms/internal/ol$a;->ass:Lcom/google/android/gms/internal/c$j;

    if-eqz v0, :cond_6

    return v1

    :cond_5
    iget-object v2, p1, Lcom/google/android/gms/internal/ol$a;->ass:Lcom/google/android/gms/internal/c$j;

    invoke-virtual {v0, v2}, Lcom/google/android/gms/internal/c$j;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_6

    return v1

    :cond_6
    invoke-virtual {p0, p1}, Lcom/google/android/gms/internal/ol$a;->a(Lcom/google/android/gms/internal/ph;)Z

    move-result p0

    return p0
.end method

.method public hashCode()I
    .locals 4

    iget-wide v0, p0, Lcom/google/android/gms/internal/ol$a;->asr:J

    const/16 v2, 0x20

    ushr-long v2, v0, v2

    xor-long/2addr v0, v2

    long-to-int v0, v0

    const/16 v1, 0x20f

    add-int/2addr v1, v0

    mul-int/lit8 v1, v1, 0x1f

    iget-object v0, p0, Lcom/google/android/gms/internal/ol$a;->gs:Lcom/google/android/gms/internal/c$f;

    const/4 v2, 0x0

    if-nez v0, :cond_0

    move v0, v2

    goto :goto_0

    :cond_0
    invoke-virtual {v0}, Lcom/google/android/gms/internal/c$f;->hashCode()I

    move-result v0

    :goto_0
    add-int/2addr v1, v0

    mul-int/lit8 v1, v1, 0x1f

    iget-object v0, p0, Lcom/google/android/gms/internal/ol$a;->ass:Lcom/google/android/gms/internal/c$j;

    if-nez v0, :cond_1

    goto :goto_1

    :cond_1
    invoke-virtual {v0}, Lcom/google/android/gms/internal/c$j;->hashCode()I

    move-result v2

    :goto_1
    add-int/2addr v1, v2

    mul-int/lit8 v1, v1, 0x1f

    invoke-virtual {p0}, Lcom/google/android/gms/internal/ol$a;->qz()I

    move-result p0

    add-int/2addr v1, p0

    return v1
.end method

.method public p(Lcom/google/android/gms/internal/pf;)Lcom/google/android/gms/internal/ol$a;
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    :cond_0
    :goto_0
    invoke-virtual {p1}, Lcom/google/android/gms/internal/pf;->qi()I

    move-result v0

    if-eqz v0, :cond_6

    const/16 v1, 0x8

    if-eq v0, v1, :cond_5

    const/16 v1, 0x12

    if-eq v0, v1, :cond_3

    const/16 v1, 0x1a

    if-eq v0, v1, :cond_1

    invoke-virtual {p0, p1, v0}, Lcom/google/android/gms/internal/ol$a;->a(Lcom/google/android/gms/internal/pf;I)Z

    move-result v0

    if-nez v0, :cond_0

    return-object p0

    :cond_1
    iget-object v0, p0, Lcom/google/android/gms/internal/ol$a;->ass:Lcom/google/android/gms/internal/c$j;

    if-nez v0, :cond_2

    new-instance v0, Lcom/google/android/gms/internal/c$j;

    invoke-direct {v0}, Lcom/google/android/gms/internal/c$j;-><init>()V

    iput-object v0, p0, Lcom/google/android/gms/internal/ol$a;->ass:Lcom/google/android/gms/internal/c$j;

    :cond_2
    iget-object v0, p0, Lcom/google/android/gms/internal/ol$a;->ass:Lcom/google/android/gms/internal/c$j;

    goto :goto_1

    :cond_3
    iget-object v0, p0, Lcom/google/android/gms/internal/ol$a;->gs:Lcom/google/android/gms/internal/c$f;

    if-nez v0, :cond_4

    new-instance v0, Lcom/google/android/gms/internal/c$f;

    invoke-direct {v0}, Lcom/google/android/gms/internal/c$f;-><init>()V

    iput-object v0, p0, Lcom/google/android/gms/internal/ol$a;->gs:Lcom/google/android/gms/internal/c$f;

    :cond_4
    iget-object v0, p0, Lcom/google/android/gms/internal/ol$a;->gs:Lcom/google/android/gms/internal/c$f;

    :goto_1
    invoke-virtual {p1, v0}, Lcom/google/android/gms/internal/pf;->a(Lcom/google/android/gms/internal/pn;)V

    goto :goto_0

    :cond_5
    invoke-virtual {p1}, Lcom/google/android/gms/internal/pf;->qk()J

    move-result-wide v0

    iput-wide v0, p0, Lcom/google/android/gms/internal/ol$a;->asr:J

    goto :goto_0

    :cond_6
    return-object p0
.end method

.method public pL()Lcom/google/android/gms/internal/ol$a;
    .locals 2

    const-wide/16 v0, 0x0

    iput-wide v0, p0, Lcom/google/android/gms/internal/ol$a;->asr:J

    const/4 v0, 0x0

    iput-object v0, p0, Lcom/google/android/gms/internal/ol$a;->gs:Lcom/google/android/gms/internal/c$f;

    iput-object v0, p0, Lcom/google/android/gms/internal/ol$a;->ass:Lcom/google/android/gms/internal/c$j;

    iput-object v0, p0, Lcom/google/android/gms/internal/ol$a;->awJ:Lcom/google/android/gms/internal/pj;

    const/4 v0, -0x1

    iput v0, p0, Lcom/google/android/gms/internal/ol$a;->awU:I

    return-object p0
.end method
