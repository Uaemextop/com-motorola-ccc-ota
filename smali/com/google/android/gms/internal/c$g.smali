.class public final Lcom/google/android/gms/internal/c$g;
.super Lcom/google/android/gms/internal/ph;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/google/android/gms/internal/c;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "g"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/google/android/gms/internal/ph<",
        "Lcom/google/android/gms/internal/c$g;",
        ">;"
    }
.end annotation


# static fields
.field private static volatile fU:[Lcom/google/android/gms/internal/c$g;


# instance fields
.field public fV:[I

.field public fW:[I

.field public fX:[I

.field public fY:[I

.field public fZ:[I

.field public ga:[I

.field public gb:[I

.field public gc:[I

.field public gd:[I

.field public ge:[I


# direct methods
.method public constructor <init>()V
    .locals 0

    invoke-direct {p0}, Lcom/google/android/gms/internal/ph;-><init>()V

    invoke-virtual {p0}, Lcom/google/android/gms/internal/c$g;->m()Lcom/google/android/gms/internal/c$g;

    return-void
.end method

.method public static l()[Lcom/google/android/gms/internal/c$g;
    .locals 2

    sget-object v0, Lcom/google/android/gms/internal/c$g;->fU:[Lcom/google/android/gms/internal/c$g;

    if-nez v0, :cond_1

    sget-object v0, Lcom/google/android/gms/internal/pl;->awT:Ljava/lang/Object;

    monitor-enter v0

    :try_start_0
    sget-object v1, Lcom/google/android/gms/internal/c$g;->fU:[Lcom/google/android/gms/internal/c$g;

    if-nez v1, :cond_0

    const/4 v1, 0x0

    new-array v1, v1, [Lcom/google/android/gms/internal/c$g;

    sput-object v1, Lcom/google/android/gms/internal/c$g;->fU:[Lcom/google/android/gms/internal/c$g;

    :cond_0
    monitor-exit v0

    goto :goto_0

    :catchall_0
    move-exception v1

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v1

    :cond_1
    :goto_0
    sget-object v0, Lcom/google/android/gms/internal/c$g;->fU:[Lcom/google/android/gms/internal/c$g;

    return-object v0
.end method


# virtual methods
.method public a(Lcom/google/android/gms/internal/pg;)V
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    iget-object v0, p0, Lcom/google/android/gms/internal/c$g;->fV:[I

    const/4 v1, 0x0

    if-eqz v0, :cond_0

    array-length v0, v0

    if-lez v0, :cond_0

    move v0, v1

    :goto_0
    iget-object v2, p0, Lcom/google/android/gms/internal/c$g;->fV:[I

    array-length v3, v2

    if-ge v0, v3, :cond_0

    aget v2, v2, v0

    const/4 v3, 0x1

    invoke-virtual {p1, v3, v2}, Lcom/google/android/gms/internal/pg;->s(II)V

    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    :cond_0
    iget-object v0, p0, Lcom/google/android/gms/internal/c$g;->fW:[I

    if-eqz v0, :cond_1

    array-length v0, v0

    if-lez v0, :cond_1

    move v0, v1

    :goto_1
    iget-object v2, p0, Lcom/google/android/gms/internal/c$g;->fW:[I

    array-length v3, v2

    if-ge v0, v3, :cond_1

    const/4 v3, 0x2

    aget v2, v2, v0

    invoke-virtual {p1, v3, v2}, Lcom/google/android/gms/internal/pg;->s(II)V

    add-int/lit8 v0, v0, 0x1

    goto :goto_1

    :cond_1
    iget-object v0, p0, Lcom/google/android/gms/internal/c$g;->fX:[I

    if-eqz v0, :cond_2

    array-length v0, v0

    if-lez v0, :cond_2

    move v0, v1

    :goto_2
    iget-object v2, p0, Lcom/google/android/gms/internal/c$g;->fX:[I

    array-length v3, v2

    if-ge v0, v3, :cond_2

    const/4 v3, 0x3

    aget v2, v2, v0

    invoke-virtual {p1, v3, v2}, Lcom/google/android/gms/internal/pg;->s(II)V

    add-int/lit8 v0, v0, 0x1

    goto :goto_2

    :cond_2
    iget-object v0, p0, Lcom/google/android/gms/internal/c$g;->fY:[I

    if-eqz v0, :cond_3

    array-length v0, v0

    if-lez v0, :cond_3

    move v0, v1

    :goto_3
    iget-object v2, p0, Lcom/google/android/gms/internal/c$g;->fY:[I

    array-length v3, v2

    if-ge v0, v3, :cond_3

    const/4 v3, 0x4

    aget v2, v2, v0

    invoke-virtual {p1, v3, v2}, Lcom/google/android/gms/internal/pg;->s(II)V

    add-int/lit8 v0, v0, 0x1

    goto :goto_3

    :cond_3
    iget-object v0, p0, Lcom/google/android/gms/internal/c$g;->fZ:[I

    if-eqz v0, :cond_4

    array-length v0, v0

    if-lez v0, :cond_4

    move v0, v1

    :goto_4
    iget-object v2, p0, Lcom/google/android/gms/internal/c$g;->fZ:[I

    array-length v3, v2

    if-ge v0, v3, :cond_4

    const/4 v3, 0x5

    aget v2, v2, v0

    invoke-virtual {p1, v3, v2}, Lcom/google/android/gms/internal/pg;->s(II)V

    add-int/lit8 v0, v0, 0x1

    goto :goto_4

    :cond_4
    iget-object v0, p0, Lcom/google/android/gms/internal/c$g;->ga:[I

    if-eqz v0, :cond_5

    array-length v0, v0

    if-lez v0, :cond_5

    move v0, v1

    :goto_5
    iget-object v2, p0, Lcom/google/android/gms/internal/c$g;->ga:[I

    array-length v3, v2

    if-ge v0, v3, :cond_5

    const/4 v3, 0x6

    aget v2, v2, v0

    invoke-virtual {p1, v3, v2}, Lcom/google/android/gms/internal/pg;->s(II)V

    add-int/lit8 v0, v0, 0x1

    goto :goto_5

    :cond_5
    iget-object v0, p0, Lcom/google/android/gms/internal/c$g;->gb:[I

    if-eqz v0, :cond_6

    array-length v0, v0

    if-lez v0, :cond_6

    move v0, v1

    :goto_6
    iget-object v2, p0, Lcom/google/android/gms/internal/c$g;->gb:[I

    array-length v3, v2

    if-ge v0, v3, :cond_6

    const/4 v3, 0x7

    aget v2, v2, v0

    invoke-virtual {p1, v3, v2}, Lcom/google/android/gms/internal/pg;->s(II)V

    add-int/lit8 v0, v0, 0x1

    goto :goto_6

    :cond_6
    iget-object v0, p0, Lcom/google/android/gms/internal/c$g;->gc:[I

    if-eqz v0, :cond_7

    array-length v0, v0

    if-lez v0, :cond_7

    move v0, v1

    :goto_7
    iget-object v2, p0, Lcom/google/android/gms/internal/c$g;->gc:[I

    array-length v3, v2

    if-ge v0, v3, :cond_7

    const/16 v3, 0x8

    aget v2, v2, v0

    invoke-virtual {p1, v3, v2}, Lcom/google/android/gms/internal/pg;->s(II)V

    add-int/lit8 v0, v0, 0x1

    goto :goto_7

    :cond_7
    iget-object v0, p0, Lcom/google/android/gms/internal/c$g;->gd:[I

    if-eqz v0, :cond_8

    array-length v0, v0

    if-lez v0, :cond_8

    move v0, v1

    :goto_8
    iget-object v2, p0, Lcom/google/android/gms/internal/c$g;->gd:[I

    array-length v3, v2

    if-ge v0, v3, :cond_8

    const/16 v3, 0x9

    aget v2, v2, v0

    invoke-virtual {p1, v3, v2}, Lcom/google/android/gms/internal/pg;->s(II)V

    add-int/lit8 v0, v0, 0x1

    goto :goto_8

    :cond_8
    iget-object v0, p0, Lcom/google/android/gms/internal/c$g;->ge:[I

    if-eqz v0, :cond_9

    array-length v0, v0

    if-lez v0, :cond_9

    :goto_9
    iget-object v0, p0, Lcom/google/android/gms/internal/c$g;->ge:[I

    array-length v2, v0

    if-ge v1, v2, :cond_9

    const/16 v2, 0xa

    aget v0, v0, v1

    invoke-virtual {p1, v2, v0}, Lcom/google/android/gms/internal/pg;->s(II)V

    add-int/lit8 v1, v1, 0x1

    goto :goto_9

    :cond_9
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

    invoke-virtual {p0, p1}, Lcom/google/android/gms/internal/c$g;->h(Lcom/google/android/gms/internal/pf;)Lcom/google/android/gms/internal/c$g;

    move-result-object p0

    return-object p0
.end method

.method protected c()I
    .locals 6

    invoke-super {p0}, Lcom/google/android/gms/internal/ph;->c()I

    move-result v0

    iget-object v1, p0, Lcom/google/android/gms/internal/c$g;->fV:[I

    const/4 v2, 0x0

    if-eqz v1, :cond_1

    array-length v1, v1

    if-lez v1, :cond_1

    move v1, v2

    move v3, v1

    :goto_0
    iget-object v4, p0, Lcom/google/android/gms/internal/c$g;->fV:[I

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
    iget-object v1, p0, Lcom/google/android/gms/internal/c$g;->fW:[I

    if-eqz v1, :cond_3

    array-length v1, v1

    if-lez v1, :cond_3

    move v1, v2

    move v3, v1

    :goto_1
    iget-object v4, p0, Lcom/google/android/gms/internal/c$g;->fW:[I

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
    iget-object v1, p0, Lcom/google/android/gms/internal/c$g;->fX:[I

    if-eqz v1, :cond_5

    array-length v1, v1

    if-lez v1, :cond_5

    move v1, v2

    move v3, v1

    :goto_2
    iget-object v4, p0, Lcom/google/android/gms/internal/c$g;->fX:[I

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
    iget-object v1, p0, Lcom/google/android/gms/internal/c$g;->fY:[I

    if-eqz v1, :cond_7

    array-length v1, v1

    if-lez v1, :cond_7

    move v1, v2

    move v3, v1

    :goto_3
    iget-object v4, p0, Lcom/google/android/gms/internal/c$g;->fY:[I

    array-length v5, v4

    if-ge v1, v5, :cond_6

    aget v4, v4, v1

    invoke-static {v4}, Lcom/google/android/gms/internal/pg;->gw(I)I

    move-result v4

    add-int/2addr v3, v4

    add-int/lit8 v1, v1, 0x1

    goto :goto_3

    :cond_6
    add-int/2addr v0, v3

    array-length v1, v4

    add-int/2addr v0, v1

    :cond_7
    iget-object v1, p0, Lcom/google/android/gms/internal/c$g;->fZ:[I

    if-eqz v1, :cond_9

    array-length v1, v1

    if-lez v1, :cond_9

    move v1, v2

    move v3, v1

    :goto_4
    iget-object v4, p0, Lcom/google/android/gms/internal/c$g;->fZ:[I

    array-length v5, v4

    if-ge v1, v5, :cond_8

    aget v4, v4, v1

    invoke-static {v4}, Lcom/google/android/gms/internal/pg;->gw(I)I

    move-result v4

    add-int/2addr v3, v4

    add-int/lit8 v1, v1, 0x1

    goto :goto_4

    :cond_8
    add-int/2addr v0, v3

    array-length v1, v4

    add-int/2addr v0, v1

    :cond_9
    iget-object v1, p0, Lcom/google/android/gms/internal/c$g;->ga:[I

    if-eqz v1, :cond_b

    array-length v1, v1

    if-lez v1, :cond_b

    move v1, v2

    move v3, v1

    :goto_5
    iget-object v4, p0, Lcom/google/android/gms/internal/c$g;->ga:[I

    array-length v5, v4

    if-ge v1, v5, :cond_a

    aget v4, v4, v1

    invoke-static {v4}, Lcom/google/android/gms/internal/pg;->gw(I)I

    move-result v4

    add-int/2addr v3, v4

    add-int/lit8 v1, v1, 0x1

    goto :goto_5

    :cond_a
    add-int/2addr v0, v3

    array-length v1, v4

    add-int/2addr v0, v1

    :cond_b
    iget-object v1, p0, Lcom/google/android/gms/internal/c$g;->gb:[I

    if-eqz v1, :cond_d

    array-length v1, v1

    if-lez v1, :cond_d

    move v1, v2

    move v3, v1

    :goto_6
    iget-object v4, p0, Lcom/google/android/gms/internal/c$g;->gb:[I

    array-length v5, v4

    if-ge v1, v5, :cond_c

    aget v4, v4, v1

    invoke-static {v4}, Lcom/google/android/gms/internal/pg;->gw(I)I

    move-result v4

    add-int/2addr v3, v4

    add-int/lit8 v1, v1, 0x1

    goto :goto_6

    :cond_c
    add-int/2addr v0, v3

    array-length v1, v4

    add-int/2addr v0, v1

    :cond_d
    iget-object v1, p0, Lcom/google/android/gms/internal/c$g;->gc:[I

    if-eqz v1, :cond_f

    array-length v1, v1

    if-lez v1, :cond_f

    move v1, v2

    move v3, v1

    :goto_7
    iget-object v4, p0, Lcom/google/android/gms/internal/c$g;->gc:[I

    array-length v5, v4

    if-ge v1, v5, :cond_e

    aget v4, v4, v1

    invoke-static {v4}, Lcom/google/android/gms/internal/pg;->gw(I)I

    move-result v4

    add-int/2addr v3, v4

    add-int/lit8 v1, v1, 0x1

    goto :goto_7

    :cond_e
    add-int/2addr v0, v3

    array-length v1, v4

    add-int/2addr v0, v1

    :cond_f
    iget-object v1, p0, Lcom/google/android/gms/internal/c$g;->gd:[I

    if-eqz v1, :cond_11

    array-length v1, v1

    if-lez v1, :cond_11

    move v1, v2

    move v3, v1

    :goto_8
    iget-object v4, p0, Lcom/google/android/gms/internal/c$g;->gd:[I

    array-length v5, v4

    if-ge v1, v5, :cond_10

    aget v4, v4, v1

    invoke-static {v4}, Lcom/google/android/gms/internal/pg;->gw(I)I

    move-result v4

    add-int/2addr v3, v4

    add-int/lit8 v1, v1, 0x1

    goto :goto_8

    :cond_10
    add-int/2addr v0, v3

    array-length v1, v4

    add-int/2addr v0, v1

    :cond_11
    iget-object v1, p0, Lcom/google/android/gms/internal/c$g;->ge:[I

    if-eqz v1, :cond_13

    array-length v1, v1

    if-lez v1, :cond_13

    move v1, v2

    :goto_9
    iget-object v3, p0, Lcom/google/android/gms/internal/c$g;->ge:[I

    array-length v4, v3

    if-ge v2, v4, :cond_12

    aget v3, v3, v2

    invoke-static {v3}, Lcom/google/android/gms/internal/pg;->gw(I)I

    move-result v3

    add-int/2addr v1, v3

    add-int/lit8 v2, v2, 0x1

    goto :goto_9

    :cond_12
    add-int/2addr v0, v1

    array-length p0, v3

    add-int/2addr v0, p0

    :cond_13
    return v0
.end method

.method public equals(Ljava/lang/Object;)Z
    .locals 3

    if-ne p1, p0, :cond_0

    const/4 p0, 0x1

    return p0

    :cond_0
    instance-of v0, p1, Lcom/google/android/gms/internal/c$g;

    const/4 v1, 0x0

    if-nez v0, :cond_1

    return v1

    :cond_1
    check-cast p1, Lcom/google/android/gms/internal/c$g;

    iget-object v0, p0, Lcom/google/android/gms/internal/c$g;->fV:[I

    iget-object v2, p1, Lcom/google/android/gms/internal/c$g;->fV:[I

    invoke-static {v0, v2}, Lcom/google/android/gms/internal/pl;->equals([I[I)Z

    move-result v0

    if-nez v0, :cond_2

    return v1

    :cond_2
    iget-object v0, p0, Lcom/google/android/gms/internal/c$g;->fW:[I

    iget-object v2, p1, Lcom/google/android/gms/internal/c$g;->fW:[I

    invoke-static {v0, v2}, Lcom/google/android/gms/internal/pl;->equals([I[I)Z

    move-result v0

    if-nez v0, :cond_3

    return v1

    :cond_3
    iget-object v0, p0, Lcom/google/android/gms/internal/c$g;->fX:[I

    iget-object v2, p1, Lcom/google/android/gms/internal/c$g;->fX:[I

    invoke-static {v0, v2}, Lcom/google/android/gms/internal/pl;->equals([I[I)Z

    move-result v0

    if-nez v0, :cond_4

    return v1

    :cond_4
    iget-object v0, p0, Lcom/google/android/gms/internal/c$g;->fY:[I

    iget-object v2, p1, Lcom/google/android/gms/internal/c$g;->fY:[I

    invoke-static {v0, v2}, Lcom/google/android/gms/internal/pl;->equals([I[I)Z

    move-result v0

    if-nez v0, :cond_5

    return v1

    :cond_5
    iget-object v0, p0, Lcom/google/android/gms/internal/c$g;->fZ:[I

    iget-object v2, p1, Lcom/google/android/gms/internal/c$g;->fZ:[I

    invoke-static {v0, v2}, Lcom/google/android/gms/internal/pl;->equals([I[I)Z

    move-result v0

    if-nez v0, :cond_6

    return v1

    :cond_6
    iget-object v0, p0, Lcom/google/android/gms/internal/c$g;->ga:[I

    iget-object v2, p1, Lcom/google/android/gms/internal/c$g;->ga:[I

    invoke-static {v0, v2}, Lcom/google/android/gms/internal/pl;->equals([I[I)Z

    move-result v0

    if-nez v0, :cond_7

    return v1

    :cond_7
    iget-object v0, p0, Lcom/google/android/gms/internal/c$g;->gb:[I

    iget-object v2, p1, Lcom/google/android/gms/internal/c$g;->gb:[I

    invoke-static {v0, v2}, Lcom/google/android/gms/internal/pl;->equals([I[I)Z

    move-result v0

    if-nez v0, :cond_8

    return v1

    :cond_8
    iget-object v0, p0, Lcom/google/android/gms/internal/c$g;->gc:[I

    iget-object v2, p1, Lcom/google/android/gms/internal/c$g;->gc:[I

    invoke-static {v0, v2}, Lcom/google/android/gms/internal/pl;->equals([I[I)Z

    move-result v0

    if-nez v0, :cond_9

    return v1

    :cond_9
    iget-object v0, p0, Lcom/google/android/gms/internal/c$g;->gd:[I

    iget-object v2, p1, Lcom/google/android/gms/internal/c$g;->gd:[I

    invoke-static {v0, v2}, Lcom/google/android/gms/internal/pl;->equals([I[I)Z

    move-result v0

    if-nez v0, :cond_a

    return v1

    :cond_a
    iget-object v0, p0, Lcom/google/android/gms/internal/c$g;->ge:[I

    iget-object v2, p1, Lcom/google/android/gms/internal/c$g;->ge:[I

    invoke-static {v0, v2}, Lcom/google/android/gms/internal/pl;->equals([I[I)Z

    move-result v0

    if-nez v0, :cond_b

    return v1

    :cond_b
    invoke-virtual {p0, p1}, Lcom/google/android/gms/internal/c$g;->a(Lcom/google/android/gms/internal/ph;)Z

    move-result p0

    return p0
.end method

.method public h(Lcom/google/android/gms/internal/pf;)Lcom/google/android/gms/internal/c$g;
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

    invoke-virtual {p0, p1, v0}, Lcom/google/android/gms/internal/c$g;->a(Lcom/google/android/gms/internal/pf;I)Z

    move-result v0

    if-nez v0, :cond_0

    return-object p0

    :sswitch_0
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

    iget-object v2, p0, Lcom/google/android/gms/internal/c$g;->ge:[I

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
    iput-object v5, p0, Lcom/google/android/gms/internal/c$g;->ge:[I

    goto/16 :goto_31

    :sswitch_1
    const/16 v0, 0x50

    invoke-static {p1, v0}, Lcom/google/android/gms/internal/pq;->b(Lcom/google/android/gms/internal/pf;I)I

    move-result v0

    iget-object v2, p0, Lcom/google/android/gms/internal/c$g;->ge:[I

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

    iput-object v4, p0, Lcom/google/android/gms/internal/c$g;->ge:[I

    goto :goto_0

    :sswitch_2
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

    iget-object v2, p0, Lcom/google/android/gms/internal/c$g;->gd:[I

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
    iput-object v5, p0, Lcom/google/android/gms/internal/c$g;->gd:[I

    goto/16 :goto_31

    :sswitch_3
    const/16 v0, 0x48

    invoke-static {p1, v0}, Lcom/google/android/gms/internal/pq;->b(Lcom/google/android/gms/internal/pf;I)I

    move-result v0

    iget-object v2, p0, Lcom/google/android/gms/internal/c$g;->gd:[I

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

    iput-object v4, p0, Lcom/google/android/gms/internal/c$g;->gd:[I

    goto/16 :goto_0

    :sswitch_4
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

    iget-object v2, p0, Lcom/google/android/gms/internal/c$g;->gc:[I

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
    iput-object v5, p0, Lcom/google/android/gms/internal/c$g;->gc:[I

    goto/16 :goto_31

    :sswitch_5
    const/16 v0, 0x40

    invoke-static {p1, v0}, Lcom/google/android/gms/internal/pq;->b(Lcom/google/android/gms/internal/pf;I)I

    move-result v0

    iget-object v2, p0, Lcom/google/android/gms/internal/c$g;->gc:[I

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

    iput-object v4, p0, Lcom/google/android/gms/internal/c$g;->gc:[I

    goto/16 :goto_0

    :sswitch_6
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

    iget-object v2, p0, Lcom/google/android/gms/internal/c$g;->gb:[I

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
    iput-object v5, p0, Lcom/google/android/gms/internal/c$g;->gb:[I

    goto/16 :goto_31

    :sswitch_7
    const/16 v0, 0x38

    invoke-static {p1, v0}, Lcom/google/android/gms/internal/pq;->b(Lcom/google/android/gms/internal/pf;I)I

    move-result v0

    iget-object v2, p0, Lcom/google/android/gms/internal/c$g;->gb:[I

    if-nez v2, :cond_1a

    move v3, v1

    goto :goto_13

    :cond_1a
    array-length v3, v2

    :goto_13
    add-int/2addr v0, v3

    new-array v4, v0, [I

    if-eqz v3, :cond_1b

    invoke-static {v2, v1, v4, v1, v3}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    :cond_1b
    :goto_14
    add-int/lit8 v1, v0, -0x1

    if-ge v3, v1, :cond_1c

    invoke-virtual {p1}, Lcom/google/android/gms/internal/pf;->ql()I

    move-result v1

    aput v1, v4, v3

    invoke-virtual {p1}, Lcom/google/android/gms/internal/pf;->qi()I

    add-int/lit8 v3, v3, 0x1

    goto :goto_14

    :cond_1c
    invoke-virtual {p1}, Lcom/google/android/gms/internal/pf;->ql()I

    move-result v0

    aput v0, v4, v3

    iput-object v4, p0, Lcom/google/android/gms/internal/c$g;->gb:[I

    goto/16 :goto_0

    :sswitch_8
    invoke-virtual {p1}, Lcom/google/android/gms/internal/pf;->qp()I

    move-result v0

    invoke-virtual {p1, v0}, Lcom/google/android/gms/internal/pf;->gp(I)I

    move-result v0

    invoke-virtual {p1}, Lcom/google/android/gms/internal/pf;->getPosition()I

    move-result v2

    move v3, v1

    :goto_15
    invoke-virtual {p1}, Lcom/google/android/gms/internal/pf;->qu()I

    move-result v4

    if-lez v4, :cond_1d

    invoke-virtual {p1}, Lcom/google/android/gms/internal/pf;->ql()I

    add-int/lit8 v3, v3, 0x1

    goto :goto_15

    :cond_1d
    invoke-virtual {p1, v2}, Lcom/google/android/gms/internal/pf;->gr(I)V

    iget-object v2, p0, Lcom/google/android/gms/internal/c$g;->ga:[I

    if-nez v2, :cond_1e

    move v4, v1

    goto :goto_16

    :cond_1e
    array-length v4, v2

    :goto_16
    add-int/2addr v3, v4

    new-array v5, v3, [I

    if-eqz v4, :cond_1f

    invoke-static {v2, v1, v5, v1, v4}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    :cond_1f
    :goto_17
    if-ge v4, v3, :cond_20

    invoke-virtual {p1}, Lcom/google/android/gms/internal/pf;->ql()I

    move-result v1

    aput v1, v5, v4

    add-int/lit8 v4, v4, 0x1

    goto :goto_17

    :cond_20
    iput-object v5, p0, Lcom/google/android/gms/internal/c$g;->ga:[I

    goto/16 :goto_31

    :sswitch_9
    const/16 v0, 0x30

    invoke-static {p1, v0}, Lcom/google/android/gms/internal/pq;->b(Lcom/google/android/gms/internal/pf;I)I

    move-result v0

    iget-object v2, p0, Lcom/google/android/gms/internal/c$g;->ga:[I

    if-nez v2, :cond_21

    move v3, v1

    goto :goto_18

    :cond_21
    array-length v3, v2

    :goto_18
    add-int/2addr v0, v3

    new-array v4, v0, [I

    if-eqz v3, :cond_22

    invoke-static {v2, v1, v4, v1, v3}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    :cond_22
    :goto_19
    add-int/lit8 v1, v0, -0x1

    if-ge v3, v1, :cond_23

    invoke-virtual {p1}, Lcom/google/android/gms/internal/pf;->ql()I

    move-result v1

    aput v1, v4, v3

    invoke-virtual {p1}, Lcom/google/android/gms/internal/pf;->qi()I

    add-int/lit8 v3, v3, 0x1

    goto :goto_19

    :cond_23
    invoke-virtual {p1}, Lcom/google/android/gms/internal/pf;->ql()I

    move-result v0

    aput v0, v4, v3

    iput-object v4, p0, Lcom/google/android/gms/internal/c$g;->ga:[I

    goto/16 :goto_0

    :sswitch_a
    invoke-virtual {p1}, Lcom/google/android/gms/internal/pf;->qp()I

    move-result v0

    invoke-virtual {p1, v0}, Lcom/google/android/gms/internal/pf;->gp(I)I

    move-result v0

    invoke-virtual {p1}, Lcom/google/android/gms/internal/pf;->getPosition()I

    move-result v2

    move v3, v1

    :goto_1a
    invoke-virtual {p1}, Lcom/google/android/gms/internal/pf;->qu()I

    move-result v4

    if-lez v4, :cond_24

    invoke-virtual {p1}, Lcom/google/android/gms/internal/pf;->ql()I

    add-int/lit8 v3, v3, 0x1

    goto :goto_1a

    :cond_24
    invoke-virtual {p1, v2}, Lcom/google/android/gms/internal/pf;->gr(I)V

    iget-object v2, p0, Lcom/google/android/gms/internal/c$g;->fZ:[I

    if-nez v2, :cond_25

    move v4, v1

    goto :goto_1b

    :cond_25
    array-length v4, v2

    :goto_1b
    add-int/2addr v3, v4

    new-array v5, v3, [I

    if-eqz v4, :cond_26

    invoke-static {v2, v1, v5, v1, v4}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    :cond_26
    :goto_1c
    if-ge v4, v3, :cond_27

    invoke-virtual {p1}, Lcom/google/android/gms/internal/pf;->ql()I

    move-result v1

    aput v1, v5, v4

    add-int/lit8 v4, v4, 0x1

    goto :goto_1c

    :cond_27
    iput-object v5, p0, Lcom/google/android/gms/internal/c$g;->fZ:[I

    goto/16 :goto_31

    :sswitch_b
    const/16 v0, 0x28

    invoke-static {p1, v0}, Lcom/google/android/gms/internal/pq;->b(Lcom/google/android/gms/internal/pf;I)I

    move-result v0

    iget-object v2, p0, Lcom/google/android/gms/internal/c$g;->fZ:[I

    if-nez v2, :cond_28

    move v3, v1

    goto :goto_1d

    :cond_28
    array-length v3, v2

    :goto_1d
    add-int/2addr v0, v3

    new-array v4, v0, [I

    if-eqz v3, :cond_29

    invoke-static {v2, v1, v4, v1, v3}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    :cond_29
    :goto_1e
    add-int/lit8 v1, v0, -0x1

    if-ge v3, v1, :cond_2a

    invoke-virtual {p1}, Lcom/google/android/gms/internal/pf;->ql()I

    move-result v1

    aput v1, v4, v3

    invoke-virtual {p1}, Lcom/google/android/gms/internal/pf;->qi()I

    add-int/lit8 v3, v3, 0x1

    goto :goto_1e

    :cond_2a
    invoke-virtual {p1}, Lcom/google/android/gms/internal/pf;->ql()I

    move-result v0

    aput v0, v4, v3

    iput-object v4, p0, Lcom/google/android/gms/internal/c$g;->fZ:[I

    goto/16 :goto_0

    :sswitch_c
    invoke-virtual {p1}, Lcom/google/android/gms/internal/pf;->qp()I

    move-result v0

    invoke-virtual {p1, v0}, Lcom/google/android/gms/internal/pf;->gp(I)I

    move-result v0

    invoke-virtual {p1}, Lcom/google/android/gms/internal/pf;->getPosition()I

    move-result v2

    move v3, v1

    :goto_1f
    invoke-virtual {p1}, Lcom/google/android/gms/internal/pf;->qu()I

    move-result v4

    if-lez v4, :cond_2b

    invoke-virtual {p1}, Lcom/google/android/gms/internal/pf;->ql()I

    add-int/lit8 v3, v3, 0x1

    goto :goto_1f

    :cond_2b
    invoke-virtual {p1, v2}, Lcom/google/android/gms/internal/pf;->gr(I)V

    iget-object v2, p0, Lcom/google/android/gms/internal/c$g;->fY:[I

    if-nez v2, :cond_2c

    move v4, v1

    goto :goto_20

    :cond_2c
    array-length v4, v2

    :goto_20
    add-int/2addr v3, v4

    new-array v5, v3, [I

    if-eqz v4, :cond_2d

    invoke-static {v2, v1, v5, v1, v4}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    :cond_2d
    :goto_21
    if-ge v4, v3, :cond_2e

    invoke-virtual {p1}, Lcom/google/android/gms/internal/pf;->ql()I

    move-result v1

    aput v1, v5, v4

    add-int/lit8 v4, v4, 0x1

    goto :goto_21

    :cond_2e
    iput-object v5, p0, Lcom/google/android/gms/internal/c$g;->fY:[I

    goto/16 :goto_31

    :sswitch_d
    const/16 v0, 0x20

    invoke-static {p1, v0}, Lcom/google/android/gms/internal/pq;->b(Lcom/google/android/gms/internal/pf;I)I

    move-result v0

    iget-object v2, p0, Lcom/google/android/gms/internal/c$g;->fY:[I

    if-nez v2, :cond_2f

    move v3, v1

    goto :goto_22

    :cond_2f
    array-length v3, v2

    :goto_22
    add-int/2addr v0, v3

    new-array v4, v0, [I

    if-eqz v3, :cond_30

    invoke-static {v2, v1, v4, v1, v3}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    :cond_30
    :goto_23
    add-int/lit8 v1, v0, -0x1

    if-ge v3, v1, :cond_31

    invoke-virtual {p1}, Lcom/google/android/gms/internal/pf;->ql()I

    move-result v1

    aput v1, v4, v3

    invoke-virtual {p1}, Lcom/google/android/gms/internal/pf;->qi()I

    add-int/lit8 v3, v3, 0x1

    goto :goto_23

    :cond_31
    invoke-virtual {p1}, Lcom/google/android/gms/internal/pf;->ql()I

    move-result v0

    aput v0, v4, v3

    iput-object v4, p0, Lcom/google/android/gms/internal/c$g;->fY:[I

    goto/16 :goto_0

    :sswitch_e
    invoke-virtual {p1}, Lcom/google/android/gms/internal/pf;->qp()I

    move-result v0

    invoke-virtual {p1, v0}, Lcom/google/android/gms/internal/pf;->gp(I)I

    move-result v0

    invoke-virtual {p1}, Lcom/google/android/gms/internal/pf;->getPosition()I

    move-result v2

    move v3, v1

    :goto_24
    invoke-virtual {p1}, Lcom/google/android/gms/internal/pf;->qu()I

    move-result v4

    if-lez v4, :cond_32

    invoke-virtual {p1}, Lcom/google/android/gms/internal/pf;->ql()I

    add-int/lit8 v3, v3, 0x1

    goto :goto_24

    :cond_32
    invoke-virtual {p1, v2}, Lcom/google/android/gms/internal/pf;->gr(I)V

    iget-object v2, p0, Lcom/google/android/gms/internal/c$g;->fX:[I

    if-nez v2, :cond_33

    move v4, v1

    goto :goto_25

    :cond_33
    array-length v4, v2

    :goto_25
    add-int/2addr v3, v4

    new-array v5, v3, [I

    if-eqz v4, :cond_34

    invoke-static {v2, v1, v5, v1, v4}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    :cond_34
    :goto_26
    if-ge v4, v3, :cond_35

    invoke-virtual {p1}, Lcom/google/android/gms/internal/pf;->ql()I

    move-result v1

    aput v1, v5, v4

    add-int/lit8 v4, v4, 0x1

    goto :goto_26

    :cond_35
    iput-object v5, p0, Lcom/google/android/gms/internal/c$g;->fX:[I

    goto/16 :goto_31

    :sswitch_f
    const/16 v0, 0x18

    invoke-static {p1, v0}, Lcom/google/android/gms/internal/pq;->b(Lcom/google/android/gms/internal/pf;I)I

    move-result v0

    iget-object v2, p0, Lcom/google/android/gms/internal/c$g;->fX:[I

    if-nez v2, :cond_36

    move v3, v1

    goto :goto_27

    :cond_36
    array-length v3, v2

    :goto_27
    add-int/2addr v0, v3

    new-array v4, v0, [I

    if-eqz v3, :cond_37

    invoke-static {v2, v1, v4, v1, v3}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    :cond_37
    :goto_28
    add-int/lit8 v1, v0, -0x1

    if-ge v3, v1, :cond_38

    invoke-virtual {p1}, Lcom/google/android/gms/internal/pf;->ql()I

    move-result v1

    aput v1, v4, v3

    invoke-virtual {p1}, Lcom/google/android/gms/internal/pf;->qi()I

    add-int/lit8 v3, v3, 0x1

    goto :goto_28

    :cond_38
    invoke-virtual {p1}, Lcom/google/android/gms/internal/pf;->ql()I

    move-result v0

    aput v0, v4, v3

    iput-object v4, p0, Lcom/google/android/gms/internal/c$g;->fX:[I

    goto/16 :goto_0

    :sswitch_10
    invoke-virtual {p1}, Lcom/google/android/gms/internal/pf;->qp()I

    move-result v0

    invoke-virtual {p1, v0}, Lcom/google/android/gms/internal/pf;->gp(I)I

    move-result v0

    invoke-virtual {p1}, Lcom/google/android/gms/internal/pf;->getPosition()I

    move-result v2

    move v3, v1

    :goto_29
    invoke-virtual {p1}, Lcom/google/android/gms/internal/pf;->qu()I

    move-result v4

    if-lez v4, :cond_39

    invoke-virtual {p1}, Lcom/google/android/gms/internal/pf;->ql()I

    add-int/lit8 v3, v3, 0x1

    goto :goto_29

    :cond_39
    invoke-virtual {p1, v2}, Lcom/google/android/gms/internal/pf;->gr(I)V

    iget-object v2, p0, Lcom/google/android/gms/internal/c$g;->fW:[I

    if-nez v2, :cond_3a

    move v4, v1

    goto :goto_2a

    :cond_3a
    array-length v4, v2

    :goto_2a
    add-int/2addr v3, v4

    new-array v5, v3, [I

    if-eqz v4, :cond_3b

    invoke-static {v2, v1, v5, v1, v4}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    :cond_3b
    :goto_2b
    if-ge v4, v3, :cond_3c

    invoke-virtual {p1}, Lcom/google/android/gms/internal/pf;->ql()I

    move-result v1

    aput v1, v5, v4

    add-int/lit8 v4, v4, 0x1

    goto :goto_2b

    :cond_3c
    iput-object v5, p0, Lcom/google/android/gms/internal/c$g;->fW:[I

    goto/16 :goto_31

    :sswitch_11
    const/16 v0, 0x10

    invoke-static {p1, v0}, Lcom/google/android/gms/internal/pq;->b(Lcom/google/android/gms/internal/pf;I)I

    move-result v0

    iget-object v2, p0, Lcom/google/android/gms/internal/c$g;->fW:[I

    if-nez v2, :cond_3d

    move v3, v1

    goto :goto_2c

    :cond_3d
    array-length v3, v2

    :goto_2c
    add-int/2addr v0, v3

    new-array v4, v0, [I

    if-eqz v3, :cond_3e

    invoke-static {v2, v1, v4, v1, v3}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    :cond_3e
    :goto_2d
    add-int/lit8 v1, v0, -0x1

    if-ge v3, v1, :cond_3f

    invoke-virtual {p1}, Lcom/google/android/gms/internal/pf;->ql()I

    move-result v1

    aput v1, v4, v3

    invoke-virtual {p1}, Lcom/google/android/gms/internal/pf;->qi()I

    add-int/lit8 v3, v3, 0x1

    goto :goto_2d

    :cond_3f
    invoke-virtual {p1}, Lcom/google/android/gms/internal/pf;->ql()I

    move-result v0

    aput v0, v4, v3

    iput-object v4, p0, Lcom/google/android/gms/internal/c$g;->fW:[I

    goto/16 :goto_0

    :sswitch_12
    invoke-virtual {p1}, Lcom/google/android/gms/internal/pf;->qp()I

    move-result v0

    invoke-virtual {p1, v0}, Lcom/google/android/gms/internal/pf;->gp(I)I

    move-result v0

    invoke-virtual {p1}, Lcom/google/android/gms/internal/pf;->getPosition()I

    move-result v2

    move v3, v1

    :goto_2e
    invoke-virtual {p1}, Lcom/google/android/gms/internal/pf;->qu()I

    move-result v4

    if-lez v4, :cond_40

    invoke-virtual {p1}, Lcom/google/android/gms/internal/pf;->ql()I

    add-int/lit8 v3, v3, 0x1

    goto :goto_2e

    :cond_40
    invoke-virtual {p1, v2}, Lcom/google/android/gms/internal/pf;->gr(I)V

    iget-object v2, p0, Lcom/google/android/gms/internal/c$g;->fV:[I

    if-nez v2, :cond_41

    move v4, v1

    goto :goto_2f

    :cond_41
    array-length v4, v2

    :goto_2f
    add-int/2addr v3, v4

    new-array v5, v3, [I

    if-eqz v4, :cond_42

    invoke-static {v2, v1, v5, v1, v4}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    :cond_42
    :goto_30
    if-ge v4, v3, :cond_43

    invoke-virtual {p1}, Lcom/google/android/gms/internal/pf;->ql()I

    move-result v1

    aput v1, v5, v4

    add-int/lit8 v4, v4, 0x1

    goto :goto_30

    :cond_43
    iput-object v5, p0, Lcom/google/android/gms/internal/c$g;->fV:[I

    :goto_31
    invoke-virtual {p1, v0}, Lcom/google/android/gms/internal/pf;->gq(I)V

    goto/16 :goto_0

    :sswitch_13
    const/16 v0, 0x8

    invoke-static {p1, v0}, Lcom/google/android/gms/internal/pq;->b(Lcom/google/android/gms/internal/pf;I)I

    move-result v0

    iget-object v2, p0, Lcom/google/android/gms/internal/c$g;->fV:[I

    if-nez v2, :cond_44

    move v3, v1

    goto :goto_32

    :cond_44
    array-length v3, v2

    :goto_32
    add-int/2addr v0, v3

    new-array v4, v0, [I

    if-eqz v3, :cond_45

    invoke-static {v2, v1, v4, v1, v3}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    :cond_45
    :goto_33
    add-int/lit8 v1, v0, -0x1

    if-ge v3, v1, :cond_46

    invoke-virtual {p1}, Lcom/google/android/gms/internal/pf;->ql()I

    move-result v1

    aput v1, v4, v3

    invoke-virtual {p1}, Lcom/google/android/gms/internal/pf;->qi()I

    add-int/lit8 v3, v3, 0x1

    goto :goto_33

    :cond_46
    invoke-virtual {p1}, Lcom/google/android/gms/internal/pf;->ql()I

    move-result v0

    aput v0, v4, v3

    iput-object v4, p0, Lcom/google/android/gms/internal/c$g;->fV:[I

    goto/16 :goto_0

    :sswitch_14
    return-object p0

    :sswitch_data_0
    .sparse-switch
        0x0 -> :sswitch_14
        0x8 -> :sswitch_13
        0xa -> :sswitch_12
        0x10 -> :sswitch_11
        0x12 -> :sswitch_10
        0x18 -> :sswitch_f
        0x1a -> :sswitch_e
        0x20 -> :sswitch_d
        0x22 -> :sswitch_c
        0x28 -> :sswitch_b
        0x2a -> :sswitch_a
        0x30 -> :sswitch_9
        0x32 -> :sswitch_8
        0x38 -> :sswitch_7
        0x3a -> :sswitch_6
        0x40 -> :sswitch_5
        0x42 -> :sswitch_4
        0x48 -> :sswitch_3
        0x4a -> :sswitch_2
        0x50 -> :sswitch_1
        0x52 -> :sswitch_0
    .end sparse-switch
.end method

.method public hashCode()I
    .locals 2

    iget-object v0, p0, Lcom/google/android/gms/internal/c$g;->fV:[I

    invoke-static {v0}, Lcom/google/android/gms/internal/pl;->hashCode([I)I

    move-result v0

    const/16 v1, 0x20f

    add-int/2addr v1, v0

    mul-int/lit8 v1, v1, 0x1f

    iget-object v0, p0, Lcom/google/android/gms/internal/c$g;->fW:[I

    invoke-static {v0}, Lcom/google/android/gms/internal/pl;->hashCode([I)I

    move-result v0

    add-int/2addr v1, v0

    mul-int/lit8 v1, v1, 0x1f

    iget-object v0, p0, Lcom/google/android/gms/internal/c$g;->fX:[I

    invoke-static {v0}, Lcom/google/android/gms/internal/pl;->hashCode([I)I

    move-result v0

    add-int/2addr v1, v0

    mul-int/lit8 v1, v1, 0x1f

    iget-object v0, p0, Lcom/google/android/gms/internal/c$g;->fY:[I

    invoke-static {v0}, Lcom/google/android/gms/internal/pl;->hashCode([I)I

    move-result v0

    add-int/2addr v1, v0

    mul-int/lit8 v1, v1, 0x1f

    iget-object v0, p0, Lcom/google/android/gms/internal/c$g;->fZ:[I

    invoke-static {v0}, Lcom/google/android/gms/internal/pl;->hashCode([I)I

    move-result v0

    add-int/2addr v1, v0

    mul-int/lit8 v1, v1, 0x1f

    iget-object v0, p0, Lcom/google/android/gms/internal/c$g;->ga:[I

    invoke-static {v0}, Lcom/google/android/gms/internal/pl;->hashCode([I)I

    move-result v0

    add-int/2addr v1, v0

    mul-int/lit8 v1, v1, 0x1f

    iget-object v0, p0, Lcom/google/android/gms/internal/c$g;->gb:[I

    invoke-static {v0}, Lcom/google/android/gms/internal/pl;->hashCode([I)I

    move-result v0

    add-int/2addr v1, v0

    mul-int/lit8 v1, v1, 0x1f

    iget-object v0, p0, Lcom/google/android/gms/internal/c$g;->gc:[I

    invoke-static {v0}, Lcom/google/android/gms/internal/pl;->hashCode([I)I

    move-result v0

    add-int/2addr v1, v0

    mul-int/lit8 v1, v1, 0x1f

    iget-object v0, p0, Lcom/google/android/gms/internal/c$g;->gd:[I

    invoke-static {v0}, Lcom/google/android/gms/internal/pl;->hashCode([I)I

    move-result v0

    add-int/2addr v1, v0

    mul-int/lit8 v1, v1, 0x1f

    iget-object v0, p0, Lcom/google/android/gms/internal/c$g;->ge:[I

    invoke-static {v0}, Lcom/google/android/gms/internal/pl;->hashCode([I)I

    move-result v0

    add-int/2addr v1, v0

    mul-int/lit8 v1, v1, 0x1f

    invoke-virtual {p0}, Lcom/google/android/gms/internal/c$g;->qz()I

    move-result p0

    add-int/2addr v1, p0

    return v1
.end method

.method public m()Lcom/google/android/gms/internal/c$g;
    .locals 1

    sget-object v0, Lcom/google/android/gms/internal/pq;->awW:[I

    iput-object v0, p0, Lcom/google/android/gms/internal/c$g;->fV:[I

    sget-object v0, Lcom/google/android/gms/internal/pq;->awW:[I

    iput-object v0, p0, Lcom/google/android/gms/internal/c$g;->fW:[I

    sget-object v0, Lcom/google/android/gms/internal/pq;->awW:[I

    iput-object v0, p0, Lcom/google/android/gms/internal/c$g;->fX:[I

    sget-object v0, Lcom/google/android/gms/internal/pq;->awW:[I

    iput-object v0, p0, Lcom/google/android/gms/internal/c$g;->fY:[I

    sget-object v0, Lcom/google/android/gms/internal/pq;->awW:[I

    iput-object v0, p0, Lcom/google/android/gms/internal/c$g;->fZ:[I

    sget-object v0, Lcom/google/android/gms/internal/pq;->awW:[I

    iput-object v0, p0, Lcom/google/android/gms/internal/c$g;->ga:[I

    sget-object v0, Lcom/google/android/gms/internal/pq;->awW:[I

    iput-object v0, p0, Lcom/google/android/gms/internal/c$g;->gb:[I

    sget-object v0, Lcom/google/android/gms/internal/pq;->awW:[I

    iput-object v0, p0, Lcom/google/android/gms/internal/c$g;->gc:[I

    sget-object v0, Lcom/google/android/gms/internal/pq;->awW:[I

    iput-object v0, p0, Lcom/google/android/gms/internal/c$g;->gd:[I

    sget-object v0, Lcom/google/android/gms/internal/pq;->awW:[I

    iput-object v0, p0, Lcom/google/android/gms/internal/c$g;->ge:[I

    const/4 v0, 0x0

    iput-object v0, p0, Lcom/google/android/gms/internal/c$g;->awJ:Lcom/google/android/gms/internal/pj;

    const/4 v0, -0x1

    iput v0, p0, Lcom/google/android/gms/internal/c$g;->awU:I

    return-object p0
.end method
