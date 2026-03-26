.class public final Lcom/google/android/gms/internal/c$h;
.super Lcom/google/android/gms/internal/ph;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/google/android/gms/internal/c;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "h"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/google/android/gms/internal/ph<",
        "Lcom/google/android/gms/internal/c$h;",
        ">;"
    }
.end annotation


# static fields
.field public static final gf:Lcom/google/android/gms/internal/pi;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/google/android/gms/internal/pi<",
            "Lcom/google/android/gms/internal/d$a;",
            "Lcom/google/android/gms/internal/c$h;",
            ">;"
        }
    .end annotation
.end field

.field private static final gg:[Lcom/google/android/gms/internal/c$h;


# instance fields
.field public gh:[I

.field public gi:[I

.field public gj:[I

.field public gk:I

.field public gl:[I

.field public gm:I

.field public gn:I


# direct methods
.method static constructor <clinit>()V
    .locals 3

    const-class v0, Lcom/google/android/gms/internal/c$h;

    const/16 v1, 0x32a

    const/16 v2, 0xb

    invoke-static {v2, v0, v1}, Lcom/google/android/gms/internal/pi;->a(ILjava/lang/Class;I)Lcom/google/android/gms/internal/pi;

    move-result-object v0

    sput-object v0, Lcom/google/android/gms/internal/c$h;->gf:Lcom/google/android/gms/internal/pi;

    const/4 v0, 0x0

    new-array v0, v0, [Lcom/google/android/gms/internal/c$h;

    sput-object v0, Lcom/google/android/gms/internal/c$h;->gg:[Lcom/google/android/gms/internal/c$h;

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    invoke-direct {p0}, Lcom/google/android/gms/internal/ph;-><init>()V

    invoke-virtual {p0}, Lcom/google/android/gms/internal/c$h;->n()Lcom/google/android/gms/internal/c$h;

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

    iget-object v0, p0, Lcom/google/android/gms/internal/c$h;->gh:[I

    const/4 v1, 0x0

    if-eqz v0, :cond_0

    array-length v0, v0

    if-lez v0, :cond_0

    move v0, v1

    :goto_0
    iget-object v2, p0, Lcom/google/android/gms/internal/c$h;->gh:[I

    array-length v3, v2

    if-ge v0, v3, :cond_0

    aget v2, v2, v0

    const/4 v3, 0x1

    invoke-virtual {p1, v3, v2}, Lcom/google/android/gms/internal/pg;->s(II)V

    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    :cond_0
    iget-object v0, p0, Lcom/google/android/gms/internal/c$h;->gi:[I

    if-eqz v0, :cond_1

    array-length v0, v0

    if-lez v0, :cond_1

    move v0, v1

    :goto_1
    iget-object v2, p0, Lcom/google/android/gms/internal/c$h;->gi:[I

    array-length v3, v2

    if-ge v0, v3, :cond_1

    const/4 v3, 0x2

    aget v2, v2, v0

    invoke-virtual {p1, v3, v2}, Lcom/google/android/gms/internal/pg;->s(II)V

    add-int/lit8 v0, v0, 0x1

    goto :goto_1

    :cond_1
    iget-object v0, p0, Lcom/google/android/gms/internal/c$h;->gj:[I

    if-eqz v0, :cond_2

    array-length v0, v0

    if-lez v0, :cond_2

    move v0, v1

    :goto_2
    iget-object v2, p0, Lcom/google/android/gms/internal/c$h;->gj:[I

    array-length v3, v2

    if-ge v0, v3, :cond_2

    const/4 v3, 0x3

    aget v2, v2, v0

    invoke-virtual {p1, v3, v2}, Lcom/google/android/gms/internal/pg;->s(II)V

    add-int/lit8 v0, v0, 0x1

    goto :goto_2

    :cond_2
    iget v0, p0, Lcom/google/android/gms/internal/c$h;->gk:I

    if-eqz v0, :cond_3

    const/4 v2, 0x4

    invoke-virtual {p1, v2, v0}, Lcom/google/android/gms/internal/pg;->s(II)V

    :cond_3
    iget-object v0, p0, Lcom/google/android/gms/internal/c$h;->gl:[I

    if-eqz v0, :cond_4

    array-length v0, v0

    if-lez v0, :cond_4

    :goto_3
    iget-object v0, p0, Lcom/google/android/gms/internal/c$h;->gl:[I

    array-length v2, v0

    if-ge v1, v2, :cond_4

    const/4 v2, 0x5

    aget v0, v0, v1

    invoke-virtual {p1, v2, v0}, Lcom/google/android/gms/internal/pg;->s(II)V

    add-int/lit8 v1, v1, 0x1

    goto :goto_3

    :cond_4
    iget v0, p0, Lcom/google/android/gms/internal/c$h;->gm:I

    if-eqz v0, :cond_5

    const/4 v1, 0x6

    invoke-virtual {p1, v1, v0}, Lcom/google/android/gms/internal/pg;->s(II)V

    :cond_5
    iget v0, p0, Lcom/google/android/gms/internal/c$h;->gn:I

    if-eqz v0, :cond_6

    const/4 v1, 0x7

    invoke-virtual {p1, v1, v0}, Lcom/google/android/gms/internal/pg;->s(II)V

    :cond_6
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

    invoke-virtual {p0, p1}, Lcom/google/android/gms/internal/c$h;->i(Lcom/google/android/gms/internal/pf;)Lcom/google/android/gms/internal/c$h;

    move-result-object p0

    return-object p0
.end method

.method protected c()I
    .locals 6

    invoke-super {p0}, Lcom/google/android/gms/internal/ph;->c()I

    move-result v0

    iget-object v1, p0, Lcom/google/android/gms/internal/c$h;->gh:[I

    const/4 v2, 0x0

    if-eqz v1, :cond_1

    array-length v1, v1

    if-lez v1, :cond_1

    move v1, v2

    move v3, v1

    :goto_0
    iget-object v4, p0, Lcom/google/android/gms/internal/c$h;->gh:[I

    array-length v5, v4

    if-ge v1, v5, :cond_0

    aget v4, v4, v1

    invoke-static {v4}, Lcom/google/android/gms/internal/pg;->gw(I)I

    move-result v4

    add-int/2addr v3, v4

    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    :cond_0
    add-int/2addr v0, v3

    array-length v1, v4

    add-int/2addr v0, v1

    :cond_1
    iget-object v1, p0, Lcom/google/android/gms/internal/c$h;->gi:[I

    if-eqz v1, :cond_3

    array-length v1, v1

    if-lez v1, :cond_3

    move v1, v2

    move v3, v1

    :goto_1
    iget-object v4, p0, Lcom/google/android/gms/internal/c$h;->gi:[I

    array-length v5, v4

    if-ge v1, v5, :cond_2

    aget v4, v4, v1

    invoke-static {v4}, Lcom/google/android/gms/internal/pg;->gw(I)I

    move-result v4

    add-int/2addr v3, v4

    add-int/lit8 v1, v1, 0x1

    goto :goto_1

    :cond_2
    add-int/2addr v0, v3

    array-length v1, v4

    add-int/2addr v0, v1

    :cond_3
    iget-object v1, p0, Lcom/google/android/gms/internal/c$h;->gj:[I

    if-eqz v1, :cond_5

    array-length v1, v1

    if-lez v1, :cond_5

    move v1, v2

    move v3, v1

    :goto_2
    iget-object v4, p0, Lcom/google/android/gms/internal/c$h;->gj:[I

    array-length v5, v4

    if-ge v1, v5, :cond_4

    aget v4, v4, v1

    invoke-static {v4}, Lcom/google/android/gms/internal/pg;->gw(I)I

    move-result v4

    add-int/2addr v3, v4

    add-int/lit8 v1, v1, 0x1

    goto :goto_2

    :cond_4
    add-int/2addr v0, v3

    array-length v1, v4

    add-int/2addr v0, v1

    :cond_5
    iget v1, p0, Lcom/google/android/gms/internal/c$h;->gk:I

    if-eqz v1, :cond_6

    const/4 v3, 0x4

    invoke-static {v3, v1}, Lcom/google/android/gms/internal/pg;->u(II)I

    move-result v1

    add-int/2addr v0, v1

    :cond_6
    iget-object v1, p0, Lcom/google/android/gms/internal/c$h;->gl:[I

    if-eqz v1, :cond_8

    array-length v1, v1

    if-lez v1, :cond_8

    move v1, v2

    :goto_3
    iget-object v3, p0, Lcom/google/android/gms/internal/c$h;->gl:[I

    array-length v4, v3

    if-ge v2, v4, :cond_7

    aget v3, v3, v2

    invoke-static {v3}, Lcom/google/android/gms/internal/pg;->gw(I)I

    move-result v3

    add-int/2addr v1, v3

    add-int/lit8 v2, v2, 0x1

    goto :goto_3

    :cond_7
    add-int/2addr v0, v1

    array-length v1, v3

    add-int/2addr v0, v1

    :cond_8
    iget v1, p0, Lcom/google/android/gms/internal/c$h;->gm:I

    if-eqz v1, :cond_9

    const/4 v2, 0x6

    invoke-static {v2, v1}, Lcom/google/android/gms/internal/pg;->u(II)I

    move-result v1

    add-int/2addr v0, v1

    :cond_9
    iget p0, p0, Lcom/google/android/gms/internal/c$h;->gn:I

    if-eqz p0, :cond_a

    const/4 v1, 0x7

    invoke-static {v1, p0}, Lcom/google/android/gms/internal/pg;->u(II)I

    move-result p0

    add-int/2addr v0, p0

    :cond_a
    return v0
.end method

.method public equals(Ljava/lang/Object;)Z
    .locals 3

    if-ne p1, p0, :cond_0

    const/4 p0, 0x1

    return p0

    :cond_0
    instance-of v0, p1, Lcom/google/android/gms/internal/c$h;

    const/4 v1, 0x0

    if-nez v0, :cond_1

    return v1

    :cond_1
    check-cast p1, Lcom/google/android/gms/internal/c$h;

    iget-object v0, p0, Lcom/google/android/gms/internal/c$h;->gh:[I

    iget-object v2, p1, Lcom/google/android/gms/internal/c$h;->gh:[I

    invoke-static {v0, v2}, Lcom/google/android/gms/internal/pl;->equals([I[I)Z

    move-result v0

    if-nez v0, :cond_2

    return v1

    :cond_2
    iget-object v0, p0, Lcom/google/android/gms/internal/c$h;->gi:[I

    iget-object v2, p1, Lcom/google/android/gms/internal/c$h;->gi:[I

    invoke-static {v0, v2}, Lcom/google/android/gms/internal/pl;->equals([I[I)Z

    move-result v0

    if-nez v0, :cond_3

    return v1

    :cond_3
    iget-object v0, p0, Lcom/google/android/gms/internal/c$h;->gj:[I

    iget-object v2, p1, Lcom/google/android/gms/internal/c$h;->gj:[I

    invoke-static {v0, v2}, Lcom/google/android/gms/internal/pl;->equals([I[I)Z

    move-result v0

    if-nez v0, :cond_4

    return v1

    :cond_4
    iget v0, p0, Lcom/google/android/gms/internal/c$h;->gk:I

    iget v2, p1, Lcom/google/android/gms/internal/c$h;->gk:I

    if-eq v0, v2, :cond_5

    return v1

    :cond_5
    iget-object v0, p0, Lcom/google/android/gms/internal/c$h;->gl:[I

    iget-object v2, p1, Lcom/google/android/gms/internal/c$h;->gl:[I

    invoke-static {v0, v2}, Lcom/google/android/gms/internal/pl;->equals([I[I)Z

    move-result v0

    if-nez v0, :cond_6

    return v1

    :cond_6
    iget v0, p0, Lcom/google/android/gms/internal/c$h;->gm:I

    iget v2, p1, Lcom/google/android/gms/internal/c$h;->gm:I

    if-eq v0, v2, :cond_7

    return v1

    :cond_7
    iget v0, p0, Lcom/google/android/gms/internal/c$h;->gn:I

    iget v2, p1, Lcom/google/android/gms/internal/c$h;->gn:I

    if-eq v0, v2, :cond_8

    return v1

    :cond_8
    invoke-virtual {p0, p1}, Lcom/google/android/gms/internal/c$h;->a(Lcom/google/android/gms/internal/ph;)Z

    move-result p0

    return p0
.end method

.method public hashCode()I
    .locals 2

    iget-object v0, p0, Lcom/google/android/gms/internal/c$h;->gh:[I

    invoke-static {v0}, Lcom/google/android/gms/internal/pl;->hashCode([I)I

    move-result v0

    const/16 v1, 0x20f

    add-int/2addr v1, v0

    mul-int/lit8 v1, v1, 0x1f

    iget-object v0, p0, Lcom/google/android/gms/internal/c$h;->gi:[I

    invoke-static {v0}, Lcom/google/android/gms/internal/pl;->hashCode([I)I

    move-result v0

    add-int/2addr v1, v0

    mul-int/lit8 v1, v1, 0x1f

    iget-object v0, p0, Lcom/google/android/gms/internal/c$h;->gj:[I

    invoke-static {v0}, Lcom/google/android/gms/internal/pl;->hashCode([I)I

    move-result v0

    add-int/2addr v1, v0

    mul-int/lit8 v1, v1, 0x1f

    iget v0, p0, Lcom/google/android/gms/internal/c$h;->gk:I

    add-int/2addr v1, v0

    mul-int/lit8 v1, v1, 0x1f

    iget-object v0, p0, Lcom/google/android/gms/internal/c$h;->gl:[I

    invoke-static {v0}, Lcom/google/android/gms/internal/pl;->hashCode([I)I

    move-result v0

    add-int/2addr v1, v0

    mul-int/lit8 v1, v1, 0x1f

    iget v0, p0, Lcom/google/android/gms/internal/c$h;->gm:I

    add-int/2addr v1, v0

    mul-int/lit8 v1, v1, 0x1f

    iget v0, p0, Lcom/google/android/gms/internal/c$h;->gn:I

    add-int/2addr v1, v0

    mul-int/lit8 v1, v1, 0x1f

    invoke-virtual {p0}, Lcom/google/android/gms/internal/c$h;->qz()I

    move-result p0

    add-int/2addr v1, p0

    return v1
.end method

.method public i(Lcom/google/android/gms/internal/pf;)Lcom/google/android/gms/internal/c$h;
    .locals 6
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

    invoke-virtual {p0, p1, v0}, Lcom/google/android/gms/internal/c$h;->a(Lcom/google/android/gms/internal/pf;I)Z

    move-result v0

    if-nez v0, :cond_0

    return-object p0

    :sswitch_0
    invoke-virtual {p1}, Lcom/google/android/gms/internal/pf;->ql()I

    move-result v0

    iput v0, p0, Lcom/google/android/gms/internal/c$h;->gn:I

    goto :goto_0

    :sswitch_1
    invoke-virtual {p1}, Lcom/google/android/gms/internal/pf;->ql()I

    move-result v0

    iput v0, p0, Lcom/google/android/gms/internal/c$h;->gm:I

    goto :goto_0

    :sswitch_2
    invoke-virtual {p1}, Lcom/google/android/gms/internal/pf;->qp()I

    move-result v0

    invoke-virtual {p1, v0}, Lcom/google/android/gms/internal/pf;->gp(I)I

    move-result v0

    invoke-virtual {p1}, Lcom/google/android/gms/internal/pf;->getPosition()I

    move-result v2

    move v3, v1

    :goto_1
    invoke-virtual {p1}, Lcom/google/android/gms/internal/pf;->qu()I

    move-result v4

    if-lez v4, :cond_1

    invoke-virtual {p1}, Lcom/google/android/gms/internal/pf;->ql()I

    add-int/lit8 v3, v3, 0x1

    goto :goto_1

    :cond_1
    invoke-virtual {p1, v2}, Lcom/google/android/gms/internal/pf;->gr(I)V

    iget-object v2, p0, Lcom/google/android/gms/internal/c$h;->gl:[I

    if-nez v2, :cond_2

    move v4, v1

    goto :goto_2

    :cond_2
    array-length v4, v2

    :goto_2
    add-int/2addr v3, v4

    new-array v5, v3, [I

    if-eqz v4, :cond_3

    invoke-static {v2, v1, v5, v1, v4}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    :cond_3
    :goto_3
    if-ge v4, v3, :cond_4

    invoke-virtual {p1}, Lcom/google/android/gms/internal/pf;->ql()I

    move-result v1

    aput v1, v5, v4

    add-int/lit8 v4, v4, 0x1

    goto :goto_3

    :cond_4
    iput-object v5, p0, Lcom/google/android/gms/internal/c$h;->gl:[I

    goto/16 :goto_13

    :sswitch_3
    const/16 v0, 0x28

    invoke-static {p1, v0}, Lcom/google/android/gms/internal/pq;->b(Lcom/google/android/gms/internal/pf;I)I

    move-result v0

    iget-object v2, p0, Lcom/google/android/gms/internal/c$h;->gl:[I

    if-nez v2, :cond_5

    move v3, v1

    goto :goto_4

    :cond_5
    array-length v3, v2

    :goto_4
    add-int/2addr v0, v3

    new-array v4, v0, [I

    if-eqz v3, :cond_6

    invoke-static {v2, v1, v4, v1, v3}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    :cond_6
    :goto_5
    add-int/lit8 v1, v0, -0x1

    if-ge v3, v1, :cond_7

    invoke-virtual {p1}, Lcom/google/android/gms/internal/pf;->ql()I

    move-result v1

    aput v1, v4, v3

    invoke-virtual {p1}, Lcom/google/android/gms/internal/pf;->qi()I

    add-int/lit8 v3, v3, 0x1

    goto :goto_5

    :cond_7
    invoke-virtual {p1}, Lcom/google/android/gms/internal/pf;->ql()I

    move-result v0

    aput v0, v4, v3

    iput-object v4, p0, Lcom/google/android/gms/internal/c$h;->gl:[I

    goto/16 :goto_0

    :sswitch_4
    invoke-virtual {p1}, Lcom/google/android/gms/internal/pf;->ql()I

    move-result v0

    iput v0, p0, Lcom/google/android/gms/internal/c$h;->gk:I

    goto/16 :goto_0

    :sswitch_5
    invoke-virtual {p1}, Lcom/google/android/gms/internal/pf;->qp()I

    move-result v0

    invoke-virtual {p1, v0}, Lcom/google/android/gms/internal/pf;->gp(I)I

    move-result v0

    invoke-virtual {p1}, Lcom/google/android/gms/internal/pf;->getPosition()I

    move-result v2

    move v3, v1

    :goto_6
    invoke-virtual {p1}, Lcom/google/android/gms/internal/pf;->qu()I

    move-result v4

    if-lez v4, :cond_8

    invoke-virtual {p1}, Lcom/google/android/gms/internal/pf;->ql()I

    add-int/lit8 v3, v3, 0x1

    goto :goto_6

    :cond_8
    invoke-virtual {p1, v2}, Lcom/google/android/gms/internal/pf;->gr(I)V

    iget-object v2, p0, Lcom/google/android/gms/internal/c$h;->gj:[I

    if-nez v2, :cond_9

    move v4, v1

    goto :goto_7

    :cond_9
    array-length v4, v2

    :goto_7
    add-int/2addr v3, v4

    new-array v5, v3, [I

    if-eqz v4, :cond_a

    invoke-static {v2, v1, v5, v1, v4}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    :cond_a
    :goto_8
    if-ge v4, v3, :cond_b

    invoke-virtual {p1}, Lcom/google/android/gms/internal/pf;->ql()I

    move-result v1

    aput v1, v5, v4

    add-int/lit8 v4, v4, 0x1

    goto :goto_8

    :cond_b
    iput-object v5, p0, Lcom/google/android/gms/internal/c$h;->gj:[I

    goto/16 :goto_13

    :sswitch_6
    const/16 v0, 0x18

    invoke-static {p1, v0}, Lcom/google/android/gms/internal/pq;->b(Lcom/google/android/gms/internal/pf;I)I

    move-result v0

    iget-object v2, p0, Lcom/google/android/gms/internal/c$h;->gj:[I

    if-nez v2, :cond_c

    move v3, v1

    goto :goto_9

    :cond_c
    array-length v3, v2

    :goto_9
    add-int/2addr v0, v3

    new-array v4, v0, [I

    if-eqz v3, :cond_d

    invoke-static {v2, v1, v4, v1, v3}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    :cond_d
    :goto_a
    add-int/lit8 v1, v0, -0x1

    if-ge v3, v1, :cond_e

    invoke-virtual {p1}, Lcom/google/android/gms/internal/pf;->ql()I

    move-result v1

    aput v1, v4, v3

    invoke-virtual {p1}, Lcom/google/android/gms/internal/pf;->qi()I

    add-int/lit8 v3, v3, 0x1

    goto :goto_a

    :cond_e
    invoke-virtual {p1}, Lcom/google/android/gms/internal/pf;->ql()I

    move-result v0

    aput v0, v4, v3

    iput-object v4, p0, Lcom/google/android/gms/internal/c$h;->gj:[I

    goto/16 :goto_0

    :sswitch_7
    invoke-virtual {p1}, Lcom/google/android/gms/internal/pf;->qp()I

    move-result v0

    invoke-virtual {p1, v0}, Lcom/google/android/gms/internal/pf;->gp(I)I

    move-result v0

    invoke-virtual {p1}, Lcom/google/android/gms/internal/pf;->getPosition()I

    move-result v2

    move v3, v1

    :goto_b
    invoke-virtual {p1}, Lcom/google/android/gms/internal/pf;->qu()I

    move-result v4

    if-lez v4, :cond_f

    invoke-virtual {p1}, Lcom/google/android/gms/internal/pf;->ql()I

    add-int/lit8 v3, v3, 0x1

    goto :goto_b

    :cond_f
    invoke-virtual {p1, v2}, Lcom/google/android/gms/internal/pf;->gr(I)V

    iget-object v2, p0, Lcom/google/android/gms/internal/c$h;->gi:[I

    if-nez v2, :cond_10

    move v4, v1

    goto :goto_c

    :cond_10
    array-length v4, v2

    :goto_c
    add-int/2addr v3, v4

    new-array v5, v3, [I

    if-eqz v4, :cond_11

    invoke-static {v2, v1, v5, v1, v4}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    :cond_11
    :goto_d
    if-ge v4, v3, :cond_12

    invoke-virtual {p1}, Lcom/google/android/gms/internal/pf;->ql()I

    move-result v1

    aput v1, v5, v4

    add-int/lit8 v4, v4, 0x1

    goto :goto_d

    :cond_12
    iput-object v5, p0, Lcom/google/android/gms/internal/c$h;->gi:[I

    goto/16 :goto_13

    :sswitch_8
    const/16 v0, 0x10

    invoke-static {p1, v0}, Lcom/google/android/gms/internal/pq;->b(Lcom/google/android/gms/internal/pf;I)I

    move-result v0

    iget-object v2, p0, Lcom/google/android/gms/internal/c$h;->gi:[I

    if-nez v2, :cond_13

    move v3, v1

    goto :goto_e

    :cond_13
    array-length v3, v2

    :goto_e
    add-int/2addr v0, v3

    new-array v4, v0, [I

    if-eqz v3, :cond_14

    invoke-static {v2, v1, v4, v1, v3}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    :cond_14
    :goto_f
    add-int/lit8 v1, v0, -0x1

    if-ge v3, v1, :cond_15

    invoke-virtual {p1}, Lcom/google/android/gms/internal/pf;->ql()I

    move-result v1

    aput v1, v4, v3

    invoke-virtual {p1}, Lcom/google/android/gms/internal/pf;->qi()I

    add-int/lit8 v3, v3, 0x1

    goto :goto_f

    :cond_15
    invoke-virtual {p1}, Lcom/google/android/gms/internal/pf;->ql()I

    move-result v0

    aput v0, v4, v3

    iput-object v4, p0, Lcom/google/android/gms/internal/c$h;->gi:[I

    goto/16 :goto_0

    :sswitch_9
    invoke-virtual {p1}, Lcom/google/android/gms/internal/pf;->qp()I

    move-result v0

    invoke-virtual {p1, v0}, Lcom/google/android/gms/internal/pf;->gp(I)I

    move-result v0

    invoke-virtual {p1}, Lcom/google/android/gms/internal/pf;->getPosition()I

    move-result v2

    move v3, v1

    :goto_10
    invoke-virtual {p1}, Lcom/google/android/gms/internal/pf;->qu()I

    move-result v4

    if-lez v4, :cond_16

    invoke-virtual {p1}, Lcom/google/android/gms/internal/pf;->ql()I

    add-int/lit8 v3, v3, 0x1

    goto :goto_10

    :cond_16
    invoke-virtual {p1, v2}, Lcom/google/android/gms/internal/pf;->gr(I)V

    iget-object v2, p0, Lcom/google/android/gms/internal/c$h;->gh:[I

    if-nez v2, :cond_17

    move v4, v1

    goto :goto_11

    :cond_17
    array-length v4, v2

    :goto_11
    add-int/2addr v3, v4

    new-array v5, v3, [I

    if-eqz v4, :cond_18

    invoke-static {v2, v1, v5, v1, v4}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    :cond_18
    :goto_12
    if-ge v4, v3, :cond_19

    invoke-virtual {p1}, Lcom/google/android/gms/internal/pf;->ql()I

    move-result v1

    aput v1, v5, v4

    add-int/lit8 v4, v4, 0x1

    goto :goto_12

    :cond_19
    iput-object v5, p0, Lcom/google/android/gms/internal/c$h;->gh:[I

    :goto_13
    invoke-virtual {p1, v0}, Lcom/google/android/gms/internal/pf;->gq(I)V

    goto/16 :goto_0

    :sswitch_a
    const/16 v0, 0x8

    invoke-static {p1, v0}, Lcom/google/android/gms/internal/pq;->b(Lcom/google/android/gms/internal/pf;I)I

    move-result v0

    iget-object v2, p0, Lcom/google/android/gms/internal/c$h;->gh:[I

    if-nez v2, :cond_1a

    move v3, v1

    goto :goto_14

    :cond_1a
    array-length v3, v2

    :goto_14
    add-int/2addr v0, v3

    new-array v4, v0, [I

    if-eqz v3, :cond_1b

    invoke-static {v2, v1, v4, v1, v3}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    :cond_1b
    :goto_15
    add-int/lit8 v1, v0, -0x1

    if-ge v3, v1, :cond_1c

    invoke-virtual {p1}, Lcom/google/android/gms/internal/pf;->ql()I

    move-result v1

    aput v1, v4, v3

    invoke-virtual {p1}, Lcom/google/android/gms/internal/pf;->qi()I

    add-int/lit8 v3, v3, 0x1

    goto :goto_15

    :cond_1c
    invoke-virtual {p1}, Lcom/google/android/gms/internal/pf;->ql()I

    move-result v0

    aput v0, v4, v3

    iput-object v4, p0, Lcom/google/android/gms/internal/c$h;->gh:[I

    goto/16 :goto_0

    :sswitch_b
    return-object p0

    nop

    :sswitch_data_0
    .sparse-switch
        0x0 -> :sswitch_b
        0x8 -> :sswitch_a
        0xa -> :sswitch_9
        0x10 -> :sswitch_8
        0x12 -> :sswitch_7
        0x18 -> :sswitch_6
        0x1a -> :sswitch_5
        0x20 -> :sswitch_4
        0x28 -> :sswitch_3
        0x2a -> :sswitch_2
        0x30 -> :sswitch_1
        0x38 -> :sswitch_0
    .end sparse-switch
.end method

.method public n()Lcom/google/android/gms/internal/c$h;
    .locals 2

    sget-object v0, Lcom/google/android/gms/internal/pq;->awW:[I

    iput-object v0, p0, Lcom/google/android/gms/internal/c$h;->gh:[I

    sget-object v0, Lcom/google/android/gms/internal/pq;->awW:[I

    iput-object v0, p0, Lcom/google/android/gms/internal/c$h;->gi:[I

    sget-object v0, Lcom/google/android/gms/internal/pq;->awW:[I

    iput-object v0, p0, Lcom/google/android/gms/internal/c$h;->gj:[I

    const/4 v0, 0x0

    iput v0, p0, Lcom/google/android/gms/internal/c$h;->gk:I

    sget-object v1, Lcom/google/android/gms/internal/pq;->awW:[I

    iput-object v1, p0, Lcom/google/android/gms/internal/c$h;->gl:[I

    iput v0, p0, Lcom/google/android/gms/internal/c$h;->gm:I

    iput v0, p0, Lcom/google/android/gms/internal/c$h;->gn:I

    const/4 v0, 0x0

    iput-object v0, p0, Lcom/google/android/gms/internal/c$h;->awJ:Lcom/google/android/gms/internal/pj;

    const/4 v0, -0x1

    iput v0, p0, Lcom/google/android/gms/internal/c$h;->awU:I

    return-object p0
.end method
