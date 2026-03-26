.class public final Lcom/google/android/gms/internal/c$f;
.super Lcom/google/android/gms/internal/ph;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/google/android/gms/internal/c;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "f"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/google/android/gms/internal/ph<",
        "Lcom/google/android/gms/internal/c$f;",
        ">;"
    }
.end annotation


# instance fields
.field public fE:[Ljava/lang/String;

.field public fF:[Ljava/lang/String;

.field public fG:[Lcom/google/android/gms/internal/d$a;

.field public fH:[Lcom/google/android/gms/internal/c$e;

.field public fI:[Lcom/google/android/gms/internal/c$b;

.field public fJ:[Lcom/google/android/gms/internal/c$b;

.field public fK:[Lcom/google/android/gms/internal/c$b;

.field public fL:[Lcom/google/android/gms/internal/c$g;

.field public fM:Ljava/lang/String;

.field public fN:Ljava/lang/String;

.field public fO:Ljava/lang/String;

.field public fP:Lcom/google/android/gms/internal/c$a;

.field public fQ:F

.field public fR:Z

.field public fS:[Ljava/lang/String;

.field public fT:I

.field public version:Ljava/lang/String;


# direct methods
.method public constructor <init>()V
    .locals 0

    invoke-direct {p0}, Lcom/google/android/gms/internal/ph;-><init>()V

    invoke-virtual {p0}, Lcom/google/android/gms/internal/c$f;->k()Lcom/google/android/gms/internal/c$f;

    return-void
.end method

.method public static a([B)Lcom/google/android/gms/internal/c$f;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/android/gms/internal/pm;
        }
    .end annotation

    new-instance v0, Lcom/google/android/gms/internal/c$f;

    invoke-direct {v0}, Lcom/google/android/gms/internal/c$f;-><init>()V

    invoke-static {v0, p0}, Lcom/google/android/gms/internal/pn;->a(Lcom/google/android/gms/internal/pn;[B)Lcom/google/android/gms/internal/pn;

    move-result-object p0

    check-cast p0, Lcom/google/android/gms/internal/c$f;

    return-object p0
.end method


# virtual methods
.method public a(Lcom/google/android/gms/internal/pg;)V
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    iget-object v0, p0, Lcom/google/android/gms/internal/c$f;->fF:[Ljava/lang/String;

    const/4 v1, 0x0

    if-eqz v0, :cond_1

    array-length v0, v0

    if-lez v0, :cond_1

    move v0, v1

    :goto_0
    iget-object v2, p0, Lcom/google/android/gms/internal/c$f;->fF:[Ljava/lang/String;

    array-length v3, v2

    if-ge v0, v3, :cond_1

    aget-object v2, v2, v0

    if-eqz v2, :cond_0

    const/4 v3, 0x1

    invoke-virtual {p1, v3, v2}, Lcom/google/android/gms/internal/pg;->b(ILjava/lang/String;)V

    :cond_0
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    :cond_1
    iget-object v0, p0, Lcom/google/android/gms/internal/c$f;->fG:[Lcom/google/android/gms/internal/d$a;

    if-eqz v0, :cond_3

    array-length v0, v0

    if-lez v0, :cond_3

    move v0, v1

    :goto_1
    iget-object v2, p0, Lcom/google/android/gms/internal/c$f;->fG:[Lcom/google/android/gms/internal/d$a;

    array-length v3, v2

    if-ge v0, v3, :cond_3

    aget-object v2, v2, v0

    if-eqz v2, :cond_2

    const/4 v3, 0x2

    invoke-virtual {p1, v3, v2}, Lcom/google/android/gms/internal/pg;->a(ILcom/google/android/gms/internal/pn;)V

    :cond_2
    add-int/lit8 v0, v0, 0x1

    goto :goto_1

    :cond_3
    iget-object v0, p0, Lcom/google/android/gms/internal/c$f;->fH:[Lcom/google/android/gms/internal/c$e;

    if-eqz v0, :cond_5

    array-length v0, v0

    if-lez v0, :cond_5

    move v0, v1

    :goto_2
    iget-object v2, p0, Lcom/google/android/gms/internal/c$f;->fH:[Lcom/google/android/gms/internal/c$e;

    array-length v3, v2

    if-ge v0, v3, :cond_5

    aget-object v2, v2, v0

    if-eqz v2, :cond_4

    const/4 v3, 0x3

    invoke-virtual {p1, v3, v2}, Lcom/google/android/gms/internal/pg;->a(ILcom/google/android/gms/internal/pn;)V

    :cond_4
    add-int/lit8 v0, v0, 0x1

    goto :goto_2

    :cond_5
    iget-object v0, p0, Lcom/google/android/gms/internal/c$f;->fI:[Lcom/google/android/gms/internal/c$b;

    if-eqz v0, :cond_7

    array-length v0, v0

    if-lez v0, :cond_7

    move v0, v1

    :goto_3
    iget-object v2, p0, Lcom/google/android/gms/internal/c$f;->fI:[Lcom/google/android/gms/internal/c$b;

    array-length v3, v2

    if-ge v0, v3, :cond_7

    aget-object v2, v2, v0

    if-eqz v2, :cond_6

    const/4 v3, 0x4

    invoke-virtual {p1, v3, v2}, Lcom/google/android/gms/internal/pg;->a(ILcom/google/android/gms/internal/pn;)V

    :cond_6
    add-int/lit8 v0, v0, 0x1

    goto :goto_3

    :cond_7
    iget-object v0, p0, Lcom/google/android/gms/internal/c$f;->fJ:[Lcom/google/android/gms/internal/c$b;

    if-eqz v0, :cond_9

    array-length v0, v0

    if-lez v0, :cond_9

    move v0, v1

    :goto_4
    iget-object v2, p0, Lcom/google/android/gms/internal/c$f;->fJ:[Lcom/google/android/gms/internal/c$b;

    array-length v3, v2

    if-ge v0, v3, :cond_9

    aget-object v2, v2, v0

    if-eqz v2, :cond_8

    const/4 v3, 0x5

    invoke-virtual {p1, v3, v2}, Lcom/google/android/gms/internal/pg;->a(ILcom/google/android/gms/internal/pn;)V

    :cond_8
    add-int/lit8 v0, v0, 0x1

    goto :goto_4

    :cond_9
    iget-object v0, p0, Lcom/google/android/gms/internal/c$f;->fK:[Lcom/google/android/gms/internal/c$b;

    if-eqz v0, :cond_b

    array-length v0, v0

    if-lez v0, :cond_b

    move v0, v1

    :goto_5
    iget-object v2, p0, Lcom/google/android/gms/internal/c$f;->fK:[Lcom/google/android/gms/internal/c$b;

    array-length v3, v2

    if-ge v0, v3, :cond_b

    aget-object v2, v2, v0

    if-eqz v2, :cond_a

    const/4 v3, 0x6

    invoke-virtual {p1, v3, v2}, Lcom/google/android/gms/internal/pg;->a(ILcom/google/android/gms/internal/pn;)V

    :cond_a
    add-int/lit8 v0, v0, 0x1

    goto :goto_5

    :cond_b
    iget-object v0, p0, Lcom/google/android/gms/internal/c$f;->fL:[Lcom/google/android/gms/internal/c$g;

    if-eqz v0, :cond_d

    array-length v0, v0

    if-lez v0, :cond_d

    move v0, v1

    :goto_6
    iget-object v2, p0, Lcom/google/android/gms/internal/c$f;->fL:[Lcom/google/android/gms/internal/c$g;

    array-length v3, v2

    if-ge v0, v3, :cond_d

    aget-object v2, v2, v0

    if-eqz v2, :cond_c

    const/4 v3, 0x7

    invoke-virtual {p1, v3, v2}, Lcom/google/android/gms/internal/pg;->a(ILcom/google/android/gms/internal/pn;)V

    :cond_c
    add-int/lit8 v0, v0, 0x1

    goto :goto_6

    :cond_d
    iget-object v0, p0, Lcom/google/android/gms/internal/c$f;->fM:Ljava/lang/String;

    const-string v2, ""

    invoke-virtual {v0, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_e

    const/16 v0, 0x9

    iget-object v3, p0, Lcom/google/android/gms/internal/c$f;->fM:Ljava/lang/String;

    invoke-virtual {p1, v0, v3}, Lcom/google/android/gms/internal/pg;->b(ILjava/lang/String;)V

    :cond_e
    iget-object v0, p0, Lcom/google/android/gms/internal/c$f;->fN:Ljava/lang/String;

    invoke-virtual {v0, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_f

    const/16 v0, 0xa

    iget-object v3, p0, Lcom/google/android/gms/internal/c$f;->fN:Ljava/lang/String;

    invoke-virtual {p1, v0, v3}, Lcom/google/android/gms/internal/pg;->b(ILjava/lang/String;)V

    :cond_f
    iget-object v0, p0, Lcom/google/android/gms/internal/c$f;->fO:Ljava/lang/String;

    const-string v3, "0"

    invoke-virtual {v0, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_10

    const/16 v0, 0xc

    iget-object v3, p0, Lcom/google/android/gms/internal/c$f;->fO:Ljava/lang/String;

    invoke-virtual {p1, v0, v3}, Lcom/google/android/gms/internal/pg;->b(ILjava/lang/String;)V

    :cond_10
    iget-object v0, p0, Lcom/google/android/gms/internal/c$f;->version:Ljava/lang/String;

    invoke-virtual {v0, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_11

    const/16 v0, 0xd

    iget-object v2, p0, Lcom/google/android/gms/internal/c$f;->version:Ljava/lang/String;

    invoke-virtual {p1, v0, v2}, Lcom/google/android/gms/internal/pg;->b(ILjava/lang/String;)V

    :cond_11
    iget-object v0, p0, Lcom/google/android/gms/internal/c$f;->fP:Lcom/google/android/gms/internal/c$a;

    if-eqz v0, :cond_12

    const/16 v2, 0xe

    invoke-virtual {p1, v2, v0}, Lcom/google/android/gms/internal/pg;->a(ILcom/google/android/gms/internal/pn;)V

    :cond_12
    iget v0, p0, Lcom/google/android/gms/internal/c$f;->fQ:F

    invoke-static {v0}, Ljava/lang/Float;->floatToIntBits(F)I

    move-result v0

    const/4 v2, 0x0

    invoke-static {v2}, Ljava/lang/Float;->floatToIntBits(F)I

    move-result v2

    if-eq v0, v2, :cond_13

    const/16 v0, 0xf

    iget v2, p0, Lcom/google/android/gms/internal/c$f;->fQ:F

    invoke-virtual {p1, v0, v2}, Lcom/google/android/gms/internal/pg;->b(IF)V

    :cond_13
    iget-object v0, p0, Lcom/google/android/gms/internal/c$f;->fS:[Ljava/lang/String;

    if-eqz v0, :cond_15

    array-length v0, v0

    if-lez v0, :cond_15

    move v0, v1

    :goto_7
    iget-object v2, p0, Lcom/google/android/gms/internal/c$f;->fS:[Ljava/lang/String;

    array-length v3, v2

    if-ge v0, v3, :cond_15

    aget-object v2, v2, v0

    if-eqz v2, :cond_14

    const/16 v3, 0x10

    invoke-virtual {p1, v3, v2}, Lcom/google/android/gms/internal/pg;->b(ILjava/lang/String;)V

    :cond_14
    add-int/lit8 v0, v0, 0x1

    goto :goto_7

    :cond_15
    iget v0, p0, Lcom/google/android/gms/internal/c$f;->fT:I

    if-eqz v0, :cond_16

    const/16 v2, 0x11

    invoke-virtual {p1, v2, v0}, Lcom/google/android/gms/internal/pg;->s(II)V

    :cond_16
    iget-boolean v0, p0, Lcom/google/android/gms/internal/c$f;->fR:Z

    if-eqz v0, :cond_17

    const/16 v2, 0x12

    invoke-virtual {p1, v2, v0}, Lcom/google/android/gms/internal/pg;->b(IZ)V

    :cond_17
    iget-object v0, p0, Lcom/google/android/gms/internal/c$f;->fE:[Ljava/lang/String;

    if-eqz v0, :cond_19

    array-length v0, v0

    if-lez v0, :cond_19

    :goto_8
    iget-object v0, p0, Lcom/google/android/gms/internal/c$f;->fE:[Ljava/lang/String;

    array-length v2, v0

    if-ge v1, v2, :cond_19

    aget-object v0, v0, v1

    if-eqz v0, :cond_18

    const/16 v2, 0x13

    invoke-virtual {p1, v2, v0}, Lcom/google/android/gms/internal/pg;->b(ILjava/lang/String;)V

    :cond_18
    add-int/lit8 v1, v1, 0x1

    goto :goto_8

    :cond_19
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

    invoke-virtual {p0, p1}, Lcom/google/android/gms/internal/c$f;->g(Lcom/google/android/gms/internal/pf;)Lcom/google/android/gms/internal/c$f;

    move-result-object p0

    return-object p0
.end method

.method protected c()I
    .locals 8

    invoke-super {p0}, Lcom/google/android/gms/internal/ph;->c()I

    move-result v0

    iget-object v1, p0, Lcom/google/android/gms/internal/c$f;->fF:[Ljava/lang/String;

    const/4 v2, 0x0

    if-eqz v1, :cond_2

    array-length v1, v1

    if-lez v1, :cond_2

    move v1, v2

    move v3, v1

    move v4, v3

    :goto_0
    iget-object v5, p0, Lcom/google/android/gms/internal/c$f;->fF:[Ljava/lang/String;

    array-length v6, v5

    if-ge v1, v6, :cond_1

    aget-object v5, v5, v1

    if-eqz v5, :cond_0

    add-int/lit8 v4, v4, 0x1

    invoke-static {v5}, Lcom/google/android/gms/internal/pg;->di(Ljava/lang/String;)I

    move-result v5

    add-int/2addr v3, v5

    :cond_0
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    :cond_1
    add-int/2addr v0, v3

    add-int/2addr v0, v4

    :cond_2
    iget-object v1, p0, Lcom/google/android/gms/internal/c$f;->fG:[Lcom/google/android/gms/internal/d$a;

    const/4 v3, 0x2

    if-eqz v1, :cond_4

    array-length v1, v1

    if-lez v1, :cond_4

    move v1, v2

    :goto_1
    iget-object v4, p0, Lcom/google/android/gms/internal/c$f;->fG:[Lcom/google/android/gms/internal/d$a;

    array-length v5, v4

    if-ge v1, v5, :cond_4

    aget-object v4, v4, v1

    if-eqz v4, :cond_3

    invoke-static {v3, v4}, Lcom/google/android/gms/internal/pg;->c(ILcom/google/android/gms/internal/pn;)I

    move-result v4

    add-int/2addr v0, v4

    :cond_3
    add-int/lit8 v1, v1, 0x1

    goto :goto_1

    :cond_4
    iget-object v1, p0, Lcom/google/android/gms/internal/c$f;->fH:[Lcom/google/android/gms/internal/c$e;

    if-eqz v1, :cond_6

    array-length v1, v1

    if-lez v1, :cond_6

    move v1, v2

    :goto_2
    iget-object v4, p0, Lcom/google/android/gms/internal/c$f;->fH:[Lcom/google/android/gms/internal/c$e;

    array-length v5, v4

    if-ge v1, v5, :cond_6

    aget-object v4, v4, v1

    if-eqz v4, :cond_5

    const/4 v5, 0x3

    invoke-static {v5, v4}, Lcom/google/android/gms/internal/pg;->c(ILcom/google/android/gms/internal/pn;)I

    move-result v4

    add-int/2addr v0, v4

    :cond_5
    add-int/lit8 v1, v1, 0x1

    goto :goto_2

    :cond_6
    iget-object v1, p0, Lcom/google/android/gms/internal/c$f;->fI:[Lcom/google/android/gms/internal/c$b;

    if-eqz v1, :cond_8

    array-length v1, v1

    if-lez v1, :cond_8

    move v1, v2

    :goto_3
    iget-object v4, p0, Lcom/google/android/gms/internal/c$f;->fI:[Lcom/google/android/gms/internal/c$b;

    array-length v5, v4

    if-ge v1, v5, :cond_8

    aget-object v4, v4, v1

    if-eqz v4, :cond_7

    const/4 v5, 0x4

    invoke-static {v5, v4}, Lcom/google/android/gms/internal/pg;->c(ILcom/google/android/gms/internal/pn;)I

    move-result v4

    add-int/2addr v0, v4

    :cond_7
    add-int/lit8 v1, v1, 0x1

    goto :goto_3

    :cond_8
    iget-object v1, p0, Lcom/google/android/gms/internal/c$f;->fJ:[Lcom/google/android/gms/internal/c$b;

    if-eqz v1, :cond_a

    array-length v1, v1

    if-lez v1, :cond_a

    move v1, v2

    :goto_4
    iget-object v4, p0, Lcom/google/android/gms/internal/c$f;->fJ:[Lcom/google/android/gms/internal/c$b;

    array-length v5, v4

    if-ge v1, v5, :cond_a

    aget-object v4, v4, v1

    if-eqz v4, :cond_9

    const/4 v5, 0x5

    invoke-static {v5, v4}, Lcom/google/android/gms/internal/pg;->c(ILcom/google/android/gms/internal/pn;)I

    move-result v4

    add-int/2addr v0, v4

    :cond_9
    add-int/lit8 v1, v1, 0x1

    goto :goto_4

    :cond_a
    iget-object v1, p0, Lcom/google/android/gms/internal/c$f;->fK:[Lcom/google/android/gms/internal/c$b;

    if-eqz v1, :cond_c

    array-length v1, v1

    if-lez v1, :cond_c

    move v1, v2

    :goto_5
    iget-object v4, p0, Lcom/google/android/gms/internal/c$f;->fK:[Lcom/google/android/gms/internal/c$b;

    array-length v5, v4

    if-ge v1, v5, :cond_c

    aget-object v4, v4, v1

    if-eqz v4, :cond_b

    const/4 v5, 0x6

    invoke-static {v5, v4}, Lcom/google/android/gms/internal/pg;->c(ILcom/google/android/gms/internal/pn;)I

    move-result v4

    add-int/2addr v0, v4

    :cond_b
    add-int/lit8 v1, v1, 0x1

    goto :goto_5

    :cond_c
    iget-object v1, p0, Lcom/google/android/gms/internal/c$f;->fL:[Lcom/google/android/gms/internal/c$g;

    if-eqz v1, :cond_e

    array-length v1, v1

    if-lez v1, :cond_e

    move v1, v2

    :goto_6
    iget-object v4, p0, Lcom/google/android/gms/internal/c$f;->fL:[Lcom/google/android/gms/internal/c$g;

    array-length v5, v4

    if-ge v1, v5, :cond_e

    aget-object v4, v4, v1

    if-eqz v4, :cond_d

    const/4 v5, 0x7

    invoke-static {v5, v4}, Lcom/google/android/gms/internal/pg;->c(ILcom/google/android/gms/internal/pn;)I

    move-result v4

    add-int/2addr v0, v4

    :cond_d
    add-int/lit8 v1, v1, 0x1

    goto :goto_6

    :cond_e
    iget-object v1, p0, Lcom/google/android/gms/internal/c$f;->fM:Ljava/lang/String;

    const-string v4, ""

    invoke-virtual {v1, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_f

    const/16 v1, 0x9

    iget-object v5, p0, Lcom/google/android/gms/internal/c$f;->fM:Ljava/lang/String;

    invoke-static {v1, v5}, Lcom/google/android/gms/internal/pg;->j(ILjava/lang/String;)I

    move-result v1

    add-int/2addr v0, v1

    :cond_f
    iget-object v1, p0, Lcom/google/android/gms/internal/c$f;->fN:Ljava/lang/String;

    invoke-virtual {v1, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_10

    const/16 v1, 0xa

    iget-object v5, p0, Lcom/google/android/gms/internal/c$f;->fN:Ljava/lang/String;

    invoke-static {v1, v5}, Lcom/google/android/gms/internal/pg;->j(ILjava/lang/String;)I

    move-result v1

    add-int/2addr v0, v1

    :cond_10
    iget-object v1, p0, Lcom/google/android/gms/internal/c$f;->fO:Ljava/lang/String;

    const-string v5, "0"

    invoke-virtual {v1, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_11

    const/16 v1, 0xc

    iget-object v5, p0, Lcom/google/android/gms/internal/c$f;->fO:Ljava/lang/String;

    invoke-static {v1, v5}, Lcom/google/android/gms/internal/pg;->j(ILjava/lang/String;)I

    move-result v1

    add-int/2addr v0, v1

    :cond_11
    iget-object v1, p0, Lcom/google/android/gms/internal/c$f;->version:Ljava/lang/String;

    invoke-virtual {v1, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_12

    const/16 v1, 0xd

    iget-object v4, p0, Lcom/google/android/gms/internal/c$f;->version:Ljava/lang/String;

    invoke-static {v1, v4}, Lcom/google/android/gms/internal/pg;->j(ILjava/lang/String;)I

    move-result v1

    add-int/2addr v0, v1

    :cond_12
    iget-object v1, p0, Lcom/google/android/gms/internal/c$f;->fP:Lcom/google/android/gms/internal/c$a;

    if-eqz v1, :cond_13

    const/16 v4, 0xe

    invoke-static {v4, v1}, Lcom/google/android/gms/internal/pg;->c(ILcom/google/android/gms/internal/pn;)I

    move-result v1

    add-int/2addr v0, v1

    :cond_13
    iget v1, p0, Lcom/google/android/gms/internal/c$f;->fQ:F

    invoke-static {v1}, Ljava/lang/Float;->floatToIntBits(F)I

    move-result v1

    const/4 v4, 0x0

    invoke-static {v4}, Ljava/lang/Float;->floatToIntBits(F)I

    move-result v4

    if-eq v1, v4, :cond_14

    const/16 v1, 0xf

    iget v4, p0, Lcom/google/android/gms/internal/c$f;->fQ:F

    invoke-static {v1, v4}, Lcom/google/android/gms/internal/pg;->c(IF)I

    move-result v1

    add-int/2addr v0, v1

    :cond_14
    iget-object v1, p0, Lcom/google/android/gms/internal/c$f;->fS:[Ljava/lang/String;

    if-eqz v1, :cond_17

    array-length v1, v1

    if-lez v1, :cond_17

    move v1, v2

    move v4, v1

    move v5, v4

    :goto_7
    iget-object v6, p0, Lcom/google/android/gms/internal/c$f;->fS:[Ljava/lang/String;

    array-length v7, v6

    if-ge v1, v7, :cond_16

    aget-object v6, v6, v1

    if-eqz v6, :cond_15

    add-int/lit8 v5, v5, 0x1

    invoke-static {v6}, Lcom/google/android/gms/internal/pg;->di(Ljava/lang/String;)I

    move-result v6

    add-int/2addr v4, v6

    :cond_15
    add-int/lit8 v1, v1, 0x1

    goto :goto_7

    :cond_16
    add-int/2addr v0, v4

    mul-int/2addr v5, v3

    add-int/2addr v0, v5

    :cond_17
    iget v1, p0, Lcom/google/android/gms/internal/c$f;->fT:I

    if-eqz v1, :cond_18

    const/16 v4, 0x11

    invoke-static {v4, v1}, Lcom/google/android/gms/internal/pg;->u(II)I

    move-result v1

    add-int/2addr v0, v1

    :cond_18
    iget-boolean v1, p0, Lcom/google/android/gms/internal/c$f;->fR:Z

    if-eqz v1, :cond_19

    const/16 v4, 0x12

    invoke-static {v4, v1}, Lcom/google/android/gms/internal/pg;->c(IZ)I

    move-result v1

    add-int/2addr v0, v1

    :cond_19
    iget-object v1, p0, Lcom/google/android/gms/internal/c$f;->fE:[Ljava/lang/String;

    if-eqz v1, :cond_1c

    array-length v1, v1

    if-lez v1, :cond_1c

    move v1, v2

    move v4, v1

    :goto_8
    iget-object v5, p0, Lcom/google/android/gms/internal/c$f;->fE:[Ljava/lang/String;

    array-length v6, v5

    if-ge v2, v6, :cond_1b

    aget-object v5, v5, v2

    if-eqz v5, :cond_1a

    add-int/lit8 v4, v4, 0x1

    invoke-static {v5}, Lcom/google/android/gms/internal/pg;->di(Ljava/lang/String;)I

    move-result v5

    add-int/2addr v1, v5

    :cond_1a
    add-int/lit8 v2, v2, 0x1

    goto :goto_8

    :cond_1b
    add-int/2addr v0, v1

    mul-int/2addr v4, v3

    add-int/2addr v0, v4

    :cond_1c
    return v0
.end method

.method public equals(Ljava/lang/Object;)Z
    .locals 3

    if-ne p1, p0, :cond_0

    const/4 p0, 0x1

    return p0

    :cond_0
    instance-of v0, p1, Lcom/google/android/gms/internal/c$f;

    const/4 v1, 0x0

    if-nez v0, :cond_1

    return v1

    :cond_1
    check-cast p1, Lcom/google/android/gms/internal/c$f;

    iget-object v0, p0, Lcom/google/android/gms/internal/c$f;->fE:[Ljava/lang/String;

    iget-object v2, p1, Lcom/google/android/gms/internal/c$f;->fE:[Ljava/lang/String;

    invoke-static {v0, v2}, Lcom/google/android/gms/internal/pl;->equals([Ljava/lang/Object;[Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_2

    return v1

    :cond_2
    iget-object v0, p0, Lcom/google/android/gms/internal/c$f;->fF:[Ljava/lang/String;

    iget-object v2, p1, Lcom/google/android/gms/internal/c$f;->fF:[Ljava/lang/String;

    invoke-static {v0, v2}, Lcom/google/android/gms/internal/pl;->equals([Ljava/lang/Object;[Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_3

    return v1

    :cond_3
    iget-object v0, p0, Lcom/google/android/gms/internal/c$f;->fG:[Lcom/google/android/gms/internal/d$a;

    iget-object v2, p1, Lcom/google/android/gms/internal/c$f;->fG:[Lcom/google/android/gms/internal/d$a;

    invoke-static {v0, v2}, Lcom/google/android/gms/internal/pl;->equals([Ljava/lang/Object;[Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_4

    return v1

    :cond_4
    iget-object v0, p0, Lcom/google/android/gms/internal/c$f;->fH:[Lcom/google/android/gms/internal/c$e;

    iget-object v2, p1, Lcom/google/android/gms/internal/c$f;->fH:[Lcom/google/android/gms/internal/c$e;

    invoke-static {v0, v2}, Lcom/google/android/gms/internal/pl;->equals([Ljava/lang/Object;[Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_5

    return v1

    :cond_5
    iget-object v0, p0, Lcom/google/android/gms/internal/c$f;->fI:[Lcom/google/android/gms/internal/c$b;

    iget-object v2, p1, Lcom/google/android/gms/internal/c$f;->fI:[Lcom/google/android/gms/internal/c$b;

    invoke-static {v0, v2}, Lcom/google/android/gms/internal/pl;->equals([Ljava/lang/Object;[Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_6

    return v1

    :cond_6
    iget-object v0, p0, Lcom/google/android/gms/internal/c$f;->fJ:[Lcom/google/android/gms/internal/c$b;

    iget-object v2, p1, Lcom/google/android/gms/internal/c$f;->fJ:[Lcom/google/android/gms/internal/c$b;

    invoke-static {v0, v2}, Lcom/google/android/gms/internal/pl;->equals([Ljava/lang/Object;[Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_7

    return v1

    :cond_7
    iget-object v0, p0, Lcom/google/android/gms/internal/c$f;->fK:[Lcom/google/android/gms/internal/c$b;

    iget-object v2, p1, Lcom/google/android/gms/internal/c$f;->fK:[Lcom/google/android/gms/internal/c$b;

    invoke-static {v0, v2}, Lcom/google/android/gms/internal/pl;->equals([Ljava/lang/Object;[Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_8

    return v1

    :cond_8
    iget-object v0, p0, Lcom/google/android/gms/internal/c$f;->fL:[Lcom/google/android/gms/internal/c$g;

    iget-object v2, p1, Lcom/google/android/gms/internal/c$f;->fL:[Lcom/google/android/gms/internal/c$g;

    invoke-static {v0, v2}, Lcom/google/android/gms/internal/pl;->equals([Ljava/lang/Object;[Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_9

    return v1

    :cond_9
    iget-object v0, p0, Lcom/google/android/gms/internal/c$f;->fM:Ljava/lang/String;

    if-nez v0, :cond_a

    iget-object v0, p1, Lcom/google/android/gms/internal/c$f;->fM:Ljava/lang/String;

    if-eqz v0, :cond_b

    return v1

    :cond_a
    iget-object v2, p1, Lcom/google/android/gms/internal/c$f;->fM:Ljava/lang/String;

    invoke-virtual {v0, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_b

    return v1

    :cond_b
    iget-object v0, p0, Lcom/google/android/gms/internal/c$f;->fN:Ljava/lang/String;

    if-nez v0, :cond_c

    iget-object v0, p1, Lcom/google/android/gms/internal/c$f;->fN:Ljava/lang/String;

    if-eqz v0, :cond_d

    return v1

    :cond_c
    iget-object v2, p1, Lcom/google/android/gms/internal/c$f;->fN:Ljava/lang/String;

    invoke-virtual {v0, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_d

    return v1

    :cond_d
    iget-object v0, p0, Lcom/google/android/gms/internal/c$f;->fO:Ljava/lang/String;

    if-nez v0, :cond_e

    iget-object v0, p1, Lcom/google/android/gms/internal/c$f;->fO:Ljava/lang/String;

    if-eqz v0, :cond_f

    return v1

    :cond_e
    iget-object v2, p1, Lcom/google/android/gms/internal/c$f;->fO:Ljava/lang/String;

    invoke-virtual {v0, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_f

    return v1

    :cond_f
    iget-object v0, p0, Lcom/google/android/gms/internal/c$f;->version:Ljava/lang/String;

    if-nez v0, :cond_10

    iget-object v0, p1, Lcom/google/android/gms/internal/c$f;->version:Ljava/lang/String;

    if-eqz v0, :cond_11

    return v1

    :cond_10
    iget-object v2, p1, Lcom/google/android/gms/internal/c$f;->version:Ljava/lang/String;

    invoke-virtual {v0, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_11

    return v1

    :cond_11
    iget-object v0, p0, Lcom/google/android/gms/internal/c$f;->fP:Lcom/google/android/gms/internal/c$a;

    if-nez v0, :cond_12

    iget-object v0, p1, Lcom/google/android/gms/internal/c$f;->fP:Lcom/google/android/gms/internal/c$a;

    if-eqz v0, :cond_13

    return v1

    :cond_12
    iget-object v2, p1, Lcom/google/android/gms/internal/c$f;->fP:Lcom/google/android/gms/internal/c$a;

    invoke-virtual {v0, v2}, Lcom/google/android/gms/internal/c$a;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_13

    return v1

    :cond_13
    iget v0, p0, Lcom/google/android/gms/internal/c$f;->fQ:F

    invoke-static {v0}, Ljava/lang/Float;->floatToIntBits(F)I

    move-result v0

    iget v2, p1, Lcom/google/android/gms/internal/c$f;->fQ:F

    invoke-static {v2}, Ljava/lang/Float;->floatToIntBits(F)I

    move-result v2

    if-eq v0, v2, :cond_14

    return v1

    :cond_14
    iget-boolean v0, p0, Lcom/google/android/gms/internal/c$f;->fR:Z

    iget-boolean v2, p1, Lcom/google/android/gms/internal/c$f;->fR:Z

    if-eq v0, v2, :cond_15

    return v1

    :cond_15
    iget-object v0, p0, Lcom/google/android/gms/internal/c$f;->fS:[Ljava/lang/String;

    iget-object v2, p1, Lcom/google/android/gms/internal/c$f;->fS:[Ljava/lang/String;

    invoke-static {v0, v2}, Lcom/google/android/gms/internal/pl;->equals([Ljava/lang/Object;[Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_16

    return v1

    :cond_16
    iget v0, p0, Lcom/google/android/gms/internal/c$f;->fT:I

    iget v2, p1, Lcom/google/android/gms/internal/c$f;->fT:I

    if-eq v0, v2, :cond_17

    return v1

    :cond_17
    invoke-virtual {p0, p1}, Lcom/google/android/gms/internal/c$f;->a(Lcom/google/android/gms/internal/ph;)Z

    move-result p0

    return p0
.end method

.method public g(Lcom/google/android/gms/internal/pf;)Lcom/google/android/gms/internal/c$f;
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

    const/4 v1, 0x0

    sparse-switch v0, :sswitch_data_0

    invoke-virtual {p0, p1, v0}, Lcom/google/android/gms/internal/c$f;->a(Lcom/google/android/gms/internal/pf;I)Z

    move-result v0

    if-nez v0, :cond_0

    return-object p0

    :sswitch_0
    const/16 v0, 0x9a

    invoke-static {p1, v0}, Lcom/google/android/gms/internal/pq;->b(Lcom/google/android/gms/internal/pf;I)I

    move-result v0

    iget-object v2, p0, Lcom/google/android/gms/internal/c$f;->fE:[Ljava/lang/String;

    if-nez v2, :cond_1

    move v3, v1

    goto :goto_1

    :cond_1
    array-length v3, v2

    :goto_1
    add-int/2addr v0, v3

    new-array v4, v0, [Ljava/lang/String;

    if-eqz v3, :cond_2

    invoke-static {v2, v1, v4, v1, v3}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    :cond_2
    :goto_2
    add-int/lit8 v1, v0, -0x1

    if-ge v3, v1, :cond_3

    invoke-virtual {p1}, Lcom/google/android/gms/internal/pf;->readString()Ljava/lang/String;

    move-result-object v1

    aput-object v1, v4, v3

    invoke-virtual {p1}, Lcom/google/android/gms/internal/pf;->qi()I

    add-int/lit8 v3, v3, 0x1

    goto :goto_2

    :cond_3
    invoke-virtual {p1}, Lcom/google/android/gms/internal/pf;->readString()Ljava/lang/String;

    move-result-object v0

    aput-object v0, v4, v3

    iput-object v4, p0, Lcom/google/android/gms/internal/c$f;->fE:[Ljava/lang/String;

    goto :goto_0

    :sswitch_1
    invoke-virtual {p1}, Lcom/google/android/gms/internal/pf;->qm()Z

    move-result v0

    iput-boolean v0, p0, Lcom/google/android/gms/internal/c$f;->fR:Z

    goto :goto_0

    :sswitch_2
    invoke-virtual {p1}, Lcom/google/android/gms/internal/pf;->ql()I

    move-result v0

    iput v0, p0, Lcom/google/android/gms/internal/c$f;->fT:I

    goto :goto_0

    :sswitch_3
    const/16 v0, 0x82

    invoke-static {p1, v0}, Lcom/google/android/gms/internal/pq;->b(Lcom/google/android/gms/internal/pf;I)I

    move-result v0

    iget-object v2, p0, Lcom/google/android/gms/internal/c$f;->fS:[Ljava/lang/String;

    if-nez v2, :cond_4

    move v3, v1

    goto :goto_3

    :cond_4
    array-length v3, v2

    :goto_3
    add-int/2addr v0, v3

    new-array v4, v0, [Ljava/lang/String;

    if-eqz v3, :cond_5

    invoke-static {v2, v1, v4, v1, v3}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    :cond_5
    :goto_4
    add-int/lit8 v1, v0, -0x1

    if-ge v3, v1, :cond_6

    invoke-virtual {p1}, Lcom/google/android/gms/internal/pf;->readString()Ljava/lang/String;

    move-result-object v1

    aput-object v1, v4, v3

    invoke-virtual {p1}, Lcom/google/android/gms/internal/pf;->qi()I

    add-int/lit8 v3, v3, 0x1

    goto :goto_4

    :cond_6
    invoke-virtual {p1}, Lcom/google/android/gms/internal/pf;->readString()Ljava/lang/String;

    move-result-object v0

    aput-object v0, v4, v3

    iput-object v4, p0, Lcom/google/android/gms/internal/c$f;->fS:[Ljava/lang/String;

    goto :goto_0

    :sswitch_4
    invoke-virtual {p1}, Lcom/google/android/gms/internal/pf;->readFloat()F

    move-result v0

    iput v0, p0, Lcom/google/android/gms/internal/c$f;->fQ:F

    goto :goto_0

    :sswitch_5
    iget-object v0, p0, Lcom/google/android/gms/internal/c$f;->fP:Lcom/google/android/gms/internal/c$a;

    if-nez v0, :cond_7

    new-instance v0, Lcom/google/android/gms/internal/c$a;

    invoke-direct {v0}, Lcom/google/android/gms/internal/c$a;-><init>()V

    iput-object v0, p0, Lcom/google/android/gms/internal/c$f;->fP:Lcom/google/android/gms/internal/c$a;

    :cond_7
    iget-object v0, p0, Lcom/google/android/gms/internal/c$f;->fP:Lcom/google/android/gms/internal/c$a;

    invoke-virtual {p1, v0}, Lcom/google/android/gms/internal/pf;->a(Lcom/google/android/gms/internal/pn;)V

    goto/16 :goto_0

    :sswitch_6
    invoke-virtual {p1}, Lcom/google/android/gms/internal/pf;->readString()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/google/android/gms/internal/c$f;->version:Ljava/lang/String;

    goto/16 :goto_0

    :sswitch_7
    invoke-virtual {p1}, Lcom/google/android/gms/internal/pf;->readString()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/google/android/gms/internal/c$f;->fO:Ljava/lang/String;

    goto/16 :goto_0

    :sswitch_8
    invoke-virtual {p1}, Lcom/google/android/gms/internal/pf;->readString()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/google/android/gms/internal/c$f;->fN:Ljava/lang/String;

    goto/16 :goto_0

    :sswitch_9
    invoke-virtual {p1}, Lcom/google/android/gms/internal/pf;->readString()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/google/android/gms/internal/c$f;->fM:Ljava/lang/String;

    goto/16 :goto_0

    :sswitch_a
    const/16 v0, 0x3a

    invoke-static {p1, v0}, Lcom/google/android/gms/internal/pq;->b(Lcom/google/android/gms/internal/pf;I)I

    move-result v0

    iget-object v2, p0, Lcom/google/android/gms/internal/c$f;->fL:[Lcom/google/android/gms/internal/c$g;

    if-nez v2, :cond_8

    move v3, v1

    goto :goto_5

    :cond_8
    array-length v3, v2

    :goto_5
    add-int/2addr v0, v3

    new-array v4, v0, [Lcom/google/android/gms/internal/c$g;

    if-eqz v3, :cond_9

    invoke-static {v2, v1, v4, v1, v3}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    :cond_9
    :goto_6
    add-int/lit8 v1, v0, -0x1

    if-ge v3, v1, :cond_a

    new-instance v1, Lcom/google/android/gms/internal/c$g;

    invoke-direct {v1}, Lcom/google/android/gms/internal/c$g;-><init>()V

    aput-object v1, v4, v3

    invoke-virtual {p1, v1}, Lcom/google/android/gms/internal/pf;->a(Lcom/google/android/gms/internal/pn;)V

    invoke-virtual {p1}, Lcom/google/android/gms/internal/pf;->qi()I

    add-int/lit8 v3, v3, 0x1

    goto :goto_6

    :cond_a
    new-instance v0, Lcom/google/android/gms/internal/c$g;

    invoke-direct {v0}, Lcom/google/android/gms/internal/c$g;-><init>()V

    aput-object v0, v4, v3

    invoke-virtual {p1, v0}, Lcom/google/android/gms/internal/pf;->a(Lcom/google/android/gms/internal/pn;)V

    iput-object v4, p0, Lcom/google/android/gms/internal/c$f;->fL:[Lcom/google/android/gms/internal/c$g;

    goto/16 :goto_0

    :sswitch_b
    const/16 v0, 0x32

    invoke-static {p1, v0}, Lcom/google/android/gms/internal/pq;->b(Lcom/google/android/gms/internal/pf;I)I

    move-result v0

    iget-object v2, p0, Lcom/google/android/gms/internal/c$f;->fK:[Lcom/google/android/gms/internal/c$b;

    if-nez v2, :cond_b

    move v3, v1

    goto :goto_7

    :cond_b
    array-length v3, v2

    :goto_7
    add-int/2addr v0, v3

    new-array v4, v0, [Lcom/google/android/gms/internal/c$b;

    if-eqz v3, :cond_c

    invoke-static {v2, v1, v4, v1, v3}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    :cond_c
    :goto_8
    add-int/lit8 v1, v0, -0x1

    if-ge v3, v1, :cond_d

    new-instance v1, Lcom/google/android/gms/internal/c$b;

    invoke-direct {v1}, Lcom/google/android/gms/internal/c$b;-><init>()V

    aput-object v1, v4, v3

    invoke-virtual {p1, v1}, Lcom/google/android/gms/internal/pf;->a(Lcom/google/android/gms/internal/pn;)V

    invoke-virtual {p1}, Lcom/google/android/gms/internal/pf;->qi()I

    add-int/lit8 v3, v3, 0x1

    goto :goto_8

    :cond_d
    new-instance v0, Lcom/google/android/gms/internal/c$b;

    invoke-direct {v0}, Lcom/google/android/gms/internal/c$b;-><init>()V

    aput-object v0, v4, v3

    invoke-virtual {p1, v0}, Lcom/google/android/gms/internal/pf;->a(Lcom/google/android/gms/internal/pn;)V

    iput-object v4, p0, Lcom/google/android/gms/internal/c$f;->fK:[Lcom/google/android/gms/internal/c$b;

    goto/16 :goto_0

    :sswitch_c
    const/16 v0, 0x2a

    invoke-static {p1, v0}, Lcom/google/android/gms/internal/pq;->b(Lcom/google/android/gms/internal/pf;I)I

    move-result v0

    iget-object v2, p0, Lcom/google/android/gms/internal/c$f;->fJ:[Lcom/google/android/gms/internal/c$b;

    if-nez v2, :cond_e

    move v3, v1

    goto :goto_9

    :cond_e
    array-length v3, v2

    :goto_9
    add-int/2addr v0, v3

    new-array v4, v0, [Lcom/google/android/gms/internal/c$b;

    if-eqz v3, :cond_f

    invoke-static {v2, v1, v4, v1, v3}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    :cond_f
    :goto_a
    add-int/lit8 v1, v0, -0x1

    if-ge v3, v1, :cond_10

    new-instance v1, Lcom/google/android/gms/internal/c$b;

    invoke-direct {v1}, Lcom/google/android/gms/internal/c$b;-><init>()V

    aput-object v1, v4, v3

    invoke-virtual {p1, v1}, Lcom/google/android/gms/internal/pf;->a(Lcom/google/android/gms/internal/pn;)V

    invoke-virtual {p1}, Lcom/google/android/gms/internal/pf;->qi()I

    add-int/lit8 v3, v3, 0x1

    goto :goto_a

    :cond_10
    new-instance v0, Lcom/google/android/gms/internal/c$b;

    invoke-direct {v0}, Lcom/google/android/gms/internal/c$b;-><init>()V

    aput-object v0, v4, v3

    invoke-virtual {p1, v0}, Lcom/google/android/gms/internal/pf;->a(Lcom/google/android/gms/internal/pn;)V

    iput-object v4, p0, Lcom/google/android/gms/internal/c$f;->fJ:[Lcom/google/android/gms/internal/c$b;

    goto/16 :goto_0

    :sswitch_d
    const/16 v0, 0x22

    invoke-static {p1, v0}, Lcom/google/android/gms/internal/pq;->b(Lcom/google/android/gms/internal/pf;I)I

    move-result v0

    iget-object v2, p0, Lcom/google/android/gms/internal/c$f;->fI:[Lcom/google/android/gms/internal/c$b;

    if-nez v2, :cond_11

    move v3, v1

    goto :goto_b

    :cond_11
    array-length v3, v2

    :goto_b
    add-int/2addr v0, v3

    new-array v4, v0, [Lcom/google/android/gms/internal/c$b;

    if-eqz v3, :cond_12

    invoke-static {v2, v1, v4, v1, v3}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    :cond_12
    :goto_c
    add-int/lit8 v1, v0, -0x1

    if-ge v3, v1, :cond_13

    new-instance v1, Lcom/google/android/gms/internal/c$b;

    invoke-direct {v1}, Lcom/google/android/gms/internal/c$b;-><init>()V

    aput-object v1, v4, v3

    invoke-virtual {p1, v1}, Lcom/google/android/gms/internal/pf;->a(Lcom/google/android/gms/internal/pn;)V

    invoke-virtual {p1}, Lcom/google/android/gms/internal/pf;->qi()I

    add-int/lit8 v3, v3, 0x1

    goto :goto_c

    :cond_13
    new-instance v0, Lcom/google/android/gms/internal/c$b;

    invoke-direct {v0}, Lcom/google/android/gms/internal/c$b;-><init>()V

    aput-object v0, v4, v3

    invoke-virtual {p1, v0}, Lcom/google/android/gms/internal/pf;->a(Lcom/google/android/gms/internal/pn;)V

    iput-object v4, p0, Lcom/google/android/gms/internal/c$f;->fI:[Lcom/google/android/gms/internal/c$b;

    goto/16 :goto_0

    :sswitch_e
    const/16 v0, 0x1a

    invoke-static {p1, v0}, Lcom/google/android/gms/internal/pq;->b(Lcom/google/android/gms/internal/pf;I)I

    move-result v0

    iget-object v2, p0, Lcom/google/android/gms/internal/c$f;->fH:[Lcom/google/android/gms/internal/c$e;

    if-nez v2, :cond_14

    move v3, v1

    goto :goto_d

    :cond_14
    array-length v3, v2

    :goto_d
    add-int/2addr v0, v3

    new-array v4, v0, [Lcom/google/android/gms/internal/c$e;

    if-eqz v3, :cond_15

    invoke-static {v2, v1, v4, v1, v3}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    :cond_15
    :goto_e
    add-int/lit8 v1, v0, -0x1

    if-ge v3, v1, :cond_16

    new-instance v1, Lcom/google/android/gms/internal/c$e;

    invoke-direct {v1}, Lcom/google/android/gms/internal/c$e;-><init>()V

    aput-object v1, v4, v3

    invoke-virtual {p1, v1}, Lcom/google/android/gms/internal/pf;->a(Lcom/google/android/gms/internal/pn;)V

    invoke-virtual {p1}, Lcom/google/android/gms/internal/pf;->qi()I

    add-int/lit8 v3, v3, 0x1

    goto :goto_e

    :cond_16
    new-instance v0, Lcom/google/android/gms/internal/c$e;

    invoke-direct {v0}, Lcom/google/android/gms/internal/c$e;-><init>()V

    aput-object v0, v4, v3

    invoke-virtual {p1, v0}, Lcom/google/android/gms/internal/pf;->a(Lcom/google/android/gms/internal/pn;)V

    iput-object v4, p0, Lcom/google/android/gms/internal/c$f;->fH:[Lcom/google/android/gms/internal/c$e;

    goto/16 :goto_0

    :sswitch_f
    const/16 v0, 0x12

    invoke-static {p1, v0}, Lcom/google/android/gms/internal/pq;->b(Lcom/google/android/gms/internal/pf;I)I

    move-result v0

    iget-object v2, p0, Lcom/google/android/gms/internal/c$f;->fG:[Lcom/google/android/gms/internal/d$a;

    if-nez v2, :cond_17

    move v3, v1

    goto :goto_f

    :cond_17
    array-length v3, v2

    :goto_f
    add-int/2addr v0, v3

    new-array v4, v0, [Lcom/google/android/gms/internal/d$a;

    if-eqz v3, :cond_18

    invoke-static {v2, v1, v4, v1, v3}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    :cond_18
    :goto_10
    add-int/lit8 v1, v0, -0x1

    if-ge v3, v1, :cond_19

    new-instance v1, Lcom/google/android/gms/internal/d$a;

    invoke-direct {v1}, Lcom/google/android/gms/internal/d$a;-><init>()V

    aput-object v1, v4, v3

    invoke-virtual {p1, v1}, Lcom/google/android/gms/internal/pf;->a(Lcom/google/android/gms/internal/pn;)V

    invoke-virtual {p1}, Lcom/google/android/gms/internal/pf;->qi()I

    add-int/lit8 v3, v3, 0x1

    goto :goto_10

    :cond_19
    new-instance v0, Lcom/google/android/gms/internal/d$a;

    invoke-direct {v0}, Lcom/google/android/gms/internal/d$a;-><init>()V

    aput-object v0, v4, v3

    invoke-virtual {p1, v0}, Lcom/google/android/gms/internal/pf;->a(Lcom/google/android/gms/internal/pn;)V

    iput-object v4, p0, Lcom/google/android/gms/internal/c$f;->fG:[Lcom/google/android/gms/internal/d$a;

    goto/16 :goto_0

    :sswitch_10
    const/16 v0, 0xa

    invoke-static {p1, v0}, Lcom/google/android/gms/internal/pq;->b(Lcom/google/android/gms/internal/pf;I)I

    move-result v0

    iget-object v2, p0, Lcom/google/android/gms/internal/c$f;->fF:[Ljava/lang/String;

    if-nez v2, :cond_1a

    move v3, v1

    goto :goto_11

    :cond_1a
    array-length v3, v2

    :goto_11
    add-int/2addr v0, v3

    new-array v4, v0, [Ljava/lang/String;

    if-eqz v3, :cond_1b

    invoke-static {v2, v1, v4, v1, v3}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    :cond_1b
    :goto_12
    add-int/lit8 v1, v0, -0x1

    if-ge v3, v1, :cond_1c

    invoke-virtual {p1}, Lcom/google/android/gms/internal/pf;->readString()Ljava/lang/String;

    move-result-object v1

    aput-object v1, v4, v3

    invoke-virtual {p1}, Lcom/google/android/gms/internal/pf;->qi()I

    add-int/lit8 v3, v3, 0x1

    goto :goto_12

    :cond_1c
    invoke-virtual {p1}, Lcom/google/android/gms/internal/pf;->readString()Ljava/lang/String;

    move-result-object v0

    aput-object v0, v4, v3

    iput-object v4, p0, Lcom/google/android/gms/internal/c$f;->fF:[Ljava/lang/String;

    goto/16 :goto_0

    :sswitch_11
    return-object p0

    :sswitch_data_0
    .sparse-switch
        0x0 -> :sswitch_11
        0xa -> :sswitch_10
        0x12 -> :sswitch_f
        0x1a -> :sswitch_e
        0x22 -> :sswitch_d
        0x2a -> :sswitch_c
        0x32 -> :sswitch_b
        0x3a -> :sswitch_a
        0x4a -> :sswitch_9
        0x52 -> :sswitch_8
        0x62 -> :sswitch_7
        0x6a -> :sswitch_6
        0x72 -> :sswitch_5
        0x7d -> :sswitch_4
        0x82 -> :sswitch_3
        0x88 -> :sswitch_2
        0x90 -> :sswitch_1
        0x9a -> :sswitch_0
    .end sparse-switch
.end method

.method public hashCode()I
    .locals 3

    iget-object v0, p0, Lcom/google/android/gms/internal/c$f;->fE:[Ljava/lang/String;

    invoke-static {v0}, Lcom/google/android/gms/internal/pl;->hashCode([Ljava/lang/Object;)I

    move-result v0

    const/16 v1, 0x20f

    add-int/2addr v1, v0

    mul-int/lit8 v1, v1, 0x1f

    iget-object v0, p0, Lcom/google/android/gms/internal/c$f;->fF:[Ljava/lang/String;

    invoke-static {v0}, Lcom/google/android/gms/internal/pl;->hashCode([Ljava/lang/Object;)I

    move-result v0

    add-int/2addr v1, v0

    mul-int/lit8 v1, v1, 0x1f

    iget-object v0, p0, Lcom/google/android/gms/internal/c$f;->fG:[Lcom/google/android/gms/internal/d$a;

    invoke-static {v0}, Lcom/google/android/gms/internal/pl;->hashCode([Ljava/lang/Object;)I

    move-result v0

    add-int/2addr v1, v0

    mul-int/lit8 v1, v1, 0x1f

    iget-object v0, p0, Lcom/google/android/gms/internal/c$f;->fH:[Lcom/google/android/gms/internal/c$e;

    invoke-static {v0}, Lcom/google/android/gms/internal/pl;->hashCode([Ljava/lang/Object;)I

    move-result v0

    add-int/2addr v1, v0

    mul-int/lit8 v1, v1, 0x1f

    iget-object v0, p0, Lcom/google/android/gms/internal/c$f;->fI:[Lcom/google/android/gms/internal/c$b;

    invoke-static {v0}, Lcom/google/android/gms/internal/pl;->hashCode([Ljava/lang/Object;)I

    move-result v0

    add-int/2addr v1, v0

    mul-int/lit8 v1, v1, 0x1f

    iget-object v0, p0, Lcom/google/android/gms/internal/c$f;->fJ:[Lcom/google/android/gms/internal/c$b;

    invoke-static {v0}, Lcom/google/android/gms/internal/pl;->hashCode([Ljava/lang/Object;)I

    move-result v0

    add-int/2addr v1, v0

    mul-int/lit8 v1, v1, 0x1f

    iget-object v0, p0, Lcom/google/android/gms/internal/c$f;->fK:[Lcom/google/android/gms/internal/c$b;

    invoke-static {v0}, Lcom/google/android/gms/internal/pl;->hashCode([Ljava/lang/Object;)I

    move-result v0

    add-int/2addr v1, v0

    mul-int/lit8 v1, v1, 0x1f

    iget-object v0, p0, Lcom/google/android/gms/internal/c$f;->fL:[Lcom/google/android/gms/internal/c$g;

    invoke-static {v0}, Lcom/google/android/gms/internal/pl;->hashCode([Ljava/lang/Object;)I

    move-result v0

    add-int/2addr v1, v0

    mul-int/lit8 v1, v1, 0x1f

    iget-object v0, p0, Lcom/google/android/gms/internal/c$f;->fM:Ljava/lang/String;

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

    iget-object v0, p0, Lcom/google/android/gms/internal/c$f;->fN:Ljava/lang/String;

    if-nez v0, :cond_1

    move v0, v2

    goto :goto_1

    :cond_1
    invoke-virtual {v0}, Ljava/lang/String;->hashCode()I

    move-result v0

    :goto_1
    add-int/2addr v1, v0

    mul-int/lit8 v1, v1, 0x1f

    iget-object v0, p0, Lcom/google/android/gms/internal/c$f;->fO:Ljava/lang/String;

    if-nez v0, :cond_2

    move v0, v2

    goto :goto_2

    :cond_2
    invoke-virtual {v0}, Ljava/lang/String;->hashCode()I

    move-result v0

    :goto_2
    add-int/2addr v1, v0

    mul-int/lit8 v1, v1, 0x1f

    iget-object v0, p0, Lcom/google/android/gms/internal/c$f;->version:Ljava/lang/String;

    if-nez v0, :cond_3

    move v0, v2

    goto :goto_3

    :cond_3
    invoke-virtual {v0}, Ljava/lang/String;->hashCode()I

    move-result v0

    :goto_3
    add-int/2addr v1, v0

    mul-int/lit8 v1, v1, 0x1f

    iget-object v0, p0, Lcom/google/android/gms/internal/c$f;->fP:Lcom/google/android/gms/internal/c$a;

    if-nez v0, :cond_4

    goto :goto_4

    :cond_4
    invoke-virtual {v0}, Lcom/google/android/gms/internal/c$a;->hashCode()I

    move-result v2

    :goto_4
    add-int/2addr v1, v2

    mul-int/lit8 v1, v1, 0x1f

    iget v0, p0, Lcom/google/android/gms/internal/c$f;->fQ:F

    invoke-static {v0}, Ljava/lang/Float;->floatToIntBits(F)I

    move-result v0

    add-int/2addr v1, v0

    mul-int/lit8 v1, v1, 0x1f

    iget-boolean v0, p0, Lcom/google/android/gms/internal/c$f;->fR:Z

    if-eqz v0, :cond_5

    const/16 v0, 0x4cf

    goto :goto_5

    :cond_5
    const/16 v0, 0x4d5

    :goto_5
    add-int/2addr v1, v0

    mul-int/lit8 v1, v1, 0x1f

    iget-object v0, p0, Lcom/google/android/gms/internal/c$f;->fS:[Ljava/lang/String;

    invoke-static {v0}, Lcom/google/android/gms/internal/pl;->hashCode([Ljava/lang/Object;)I

    move-result v0

    add-int/2addr v1, v0

    mul-int/lit8 v1, v1, 0x1f

    iget v0, p0, Lcom/google/android/gms/internal/c$f;->fT:I

    add-int/2addr v1, v0

    mul-int/lit8 v1, v1, 0x1f

    invoke-virtual {p0}, Lcom/google/android/gms/internal/c$f;->qz()I

    move-result p0

    add-int/2addr v1, p0

    return v1
.end method

.method public k()Lcom/google/android/gms/internal/c$f;
    .locals 3

    sget-object v0, Lcom/google/android/gms/internal/pq;->axb:[Ljava/lang/String;

    iput-object v0, p0, Lcom/google/android/gms/internal/c$f;->fE:[Ljava/lang/String;

    sget-object v0, Lcom/google/android/gms/internal/pq;->axb:[Ljava/lang/String;

    iput-object v0, p0, Lcom/google/android/gms/internal/c$f;->fF:[Ljava/lang/String;

    invoke-static {}, Lcom/google/android/gms/internal/d$a;->r()[Lcom/google/android/gms/internal/d$a;

    move-result-object v0

    iput-object v0, p0, Lcom/google/android/gms/internal/c$f;->fG:[Lcom/google/android/gms/internal/d$a;

    invoke-static {}, Lcom/google/android/gms/internal/c$e;->i()[Lcom/google/android/gms/internal/c$e;

    move-result-object v0

    iput-object v0, p0, Lcom/google/android/gms/internal/c$f;->fH:[Lcom/google/android/gms/internal/c$e;

    invoke-static {}, Lcom/google/android/gms/internal/c$b;->d()[Lcom/google/android/gms/internal/c$b;

    move-result-object v0

    iput-object v0, p0, Lcom/google/android/gms/internal/c$f;->fI:[Lcom/google/android/gms/internal/c$b;

    invoke-static {}, Lcom/google/android/gms/internal/c$b;->d()[Lcom/google/android/gms/internal/c$b;

    move-result-object v0

    iput-object v0, p0, Lcom/google/android/gms/internal/c$f;->fJ:[Lcom/google/android/gms/internal/c$b;

    invoke-static {}, Lcom/google/android/gms/internal/c$b;->d()[Lcom/google/android/gms/internal/c$b;

    move-result-object v0

    iput-object v0, p0, Lcom/google/android/gms/internal/c$f;->fK:[Lcom/google/android/gms/internal/c$b;

    invoke-static {}, Lcom/google/android/gms/internal/c$g;->l()[Lcom/google/android/gms/internal/c$g;

    move-result-object v0

    iput-object v0, p0, Lcom/google/android/gms/internal/c$f;->fL:[Lcom/google/android/gms/internal/c$g;

    const-string v0, ""

    iput-object v0, p0, Lcom/google/android/gms/internal/c$f;->fM:Ljava/lang/String;

    iput-object v0, p0, Lcom/google/android/gms/internal/c$f;->fN:Ljava/lang/String;

    const-string v1, "0"

    iput-object v1, p0, Lcom/google/android/gms/internal/c$f;->fO:Ljava/lang/String;

    iput-object v0, p0, Lcom/google/android/gms/internal/c$f;->version:Ljava/lang/String;

    const/4 v0, 0x0

    iput-object v0, p0, Lcom/google/android/gms/internal/c$f;->fP:Lcom/google/android/gms/internal/c$a;

    const/4 v1, 0x0

    iput v1, p0, Lcom/google/android/gms/internal/c$f;->fQ:F

    const/4 v1, 0x0

    iput-boolean v1, p0, Lcom/google/android/gms/internal/c$f;->fR:Z

    sget-object v2, Lcom/google/android/gms/internal/pq;->axb:[Ljava/lang/String;

    iput-object v2, p0, Lcom/google/android/gms/internal/c$f;->fS:[Ljava/lang/String;

    iput v1, p0, Lcom/google/android/gms/internal/c$f;->fT:I

    iput-object v0, p0, Lcom/google/android/gms/internal/c$f;->awJ:Lcom/google/android/gms/internal/pj;

    const/4 v0, -0x1

    iput v0, p0, Lcom/google/android/gms/internal/c$f;->awU:I

    return-object p0
.end method
