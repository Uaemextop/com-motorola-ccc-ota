.class public final Lcom/google/android/gms/internal/d$a;
.super Lcom/google/android/gms/internal/ph;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/google/android/gms/internal/d;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "a"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/google/android/gms/internal/ph<",
        "Lcom/google/android/gms/internal/d$a;",
        ">;"
    }
.end annotation


# static fields
.field private static volatile gu:[Lcom/google/android/gms/internal/d$a;


# instance fields
.field public gA:Ljava/lang/String;

.field public gB:J

.field public gC:Z

.field public gD:[Lcom/google/android/gms/internal/d$a;

.field public gE:[I

.field public gF:Z

.field public gv:Ljava/lang/String;

.field public gw:[Lcom/google/android/gms/internal/d$a;

.field public gx:[Lcom/google/android/gms/internal/d$a;

.field public gy:[Lcom/google/android/gms/internal/d$a;

.field public gz:Ljava/lang/String;

.field public type:I


# direct methods
.method public constructor <init>()V
    .locals 0

    invoke-direct {p0}, Lcom/google/android/gms/internal/ph;-><init>()V

    invoke-virtual {p0}, Lcom/google/android/gms/internal/d$a;->s()Lcom/google/android/gms/internal/d$a;

    return-void
.end method

.method public static r()[Lcom/google/android/gms/internal/d$a;
    .locals 2

    sget-object v0, Lcom/google/android/gms/internal/d$a;->gu:[Lcom/google/android/gms/internal/d$a;

    if-nez v0, :cond_1

    sget-object v0, Lcom/google/android/gms/internal/pl;->awT:Ljava/lang/Object;

    monitor-enter v0

    :try_start_0
    sget-object v1, Lcom/google/android/gms/internal/d$a;->gu:[Lcom/google/android/gms/internal/d$a;

    if-nez v1, :cond_0

    const/4 v1, 0x0

    new-array v1, v1, [Lcom/google/android/gms/internal/d$a;

    sput-object v1, Lcom/google/android/gms/internal/d$a;->gu:[Lcom/google/android/gms/internal/d$a;

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
    sget-object v0, Lcom/google/android/gms/internal/d$a;->gu:[Lcom/google/android/gms/internal/d$a;

    return-object v0
.end method


# virtual methods
.method public a(Lcom/google/android/gms/internal/pg;)V
    .locals 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    const/4 v0, 0x1

    iget v1, p0, Lcom/google/android/gms/internal/d$a;->type:I

    invoke-virtual {p1, v0, v1}, Lcom/google/android/gms/internal/pg;->s(II)V

    iget-object v0, p0, Lcom/google/android/gms/internal/d$a;->gv:Ljava/lang/String;

    const-string v1, ""

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_0

    const/4 v0, 0x2

    iget-object v2, p0, Lcom/google/android/gms/internal/d$a;->gv:Ljava/lang/String;

    invoke-virtual {p1, v0, v2}, Lcom/google/android/gms/internal/pg;->b(ILjava/lang/String;)V

    :cond_0
    iget-object v0, p0, Lcom/google/android/gms/internal/d$a;->gw:[Lcom/google/android/gms/internal/d$a;

    const/4 v2, 0x0

    if-eqz v0, :cond_2

    array-length v0, v0

    if-lez v0, :cond_2

    move v0, v2

    :goto_0
    iget-object v3, p0, Lcom/google/android/gms/internal/d$a;->gw:[Lcom/google/android/gms/internal/d$a;

    array-length v4, v3

    if-ge v0, v4, :cond_2

    aget-object v3, v3, v0

    if-eqz v3, :cond_1

    const/4 v4, 0x3

    invoke-virtual {p1, v4, v3}, Lcom/google/android/gms/internal/pg;->a(ILcom/google/android/gms/internal/pn;)V

    :cond_1
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    :cond_2
    iget-object v0, p0, Lcom/google/android/gms/internal/d$a;->gx:[Lcom/google/android/gms/internal/d$a;

    if-eqz v0, :cond_4

    array-length v0, v0

    if-lez v0, :cond_4

    move v0, v2

    :goto_1
    iget-object v3, p0, Lcom/google/android/gms/internal/d$a;->gx:[Lcom/google/android/gms/internal/d$a;

    array-length v4, v3

    if-ge v0, v4, :cond_4

    aget-object v3, v3, v0

    if-eqz v3, :cond_3

    const/4 v4, 0x4

    invoke-virtual {p1, v4, v3}, Lcom/google/android/gms/internal/pg;->a(ILcom/google/android/gms/internal/pn;)V

    :cond_3
    add-int/lit8 v0, v0, 0x1

    goto :goto_1

    :cond_4
    iget-object v0, p0, Lcom/google/android/gms/internal/d$a;->gy:[Lcom/google/android/gms/internal/d$a;

    if-eqz v0, :cond_6

    array-length v0, v0

    if-lez v0, :cond_6

    move v0, v2

    :goto_2
    iget-object v3, p0, Lcom/google/android/gms/internal/d$a;->gy:[Lcom/google/android/gms/internal/d$a;

    array-length v4, v3

    if-ge v0, v4, :cond_6

    aget-object v3, v3, v0

    if-eqz v3, :cond_5

    const/4 v4, 0x5

    invoke-virtual {p1, v4, v3}, Lcom/google/android/gms/internal/pg;->a(ILcom/google/android/gms/internal/pn;)V

    :cond_5
    add-int/lit8 v0, v0, 0x1

    goto :goto_2

    :cond_6
    iget-object v0, p0, Lcom/google/android/gms/internal/d$a;->gz:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_7

    const/4 v0, 0x6

    iget-object v3, p0, Lcom/google/android/gms/internal/d$a;->gz:Ljava/lang/String;

    invoke-virtual {p1, v0, v3}, Lcom/google/android/gms/internal/pg;->b(ILjava/lang/String;)V

    :cond_7
    iget-object v0, p0, Lcom/google/android/gms/internal/d$a;->gA:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_8

    const/4 v0, 0x7

    iget-object v1, p0, Lcom/google/android/gms/internal/d$a;->gA:Ljava/lang/String;

    invoke-virtual {p1, v0, v1}, Lcom/google/android/gms/internal/pg;->b(ILjava/lang/String;)V

    :cond_8
    iget-wide v0, p0, Lcom/google/android/gms/internal/d$a;->gB:J

    const-wide/16 v3, 0x0

    cmp-long v3, v0, v3

    if-eqz v3, :cond_9

    const/16 v3, 0x8

    invoke-virtual {p1, v3, v0, v1}, Lcom/google/android/gms/internal/pg;->b(IJ)V

    :cond_9
    iget-boolean v0, p0, Lcom/google/android/gms/internal/d$a;->gF:Z

    if-eqz v0, :cond_a

    const/16 v1, 0x9

    invoke-virtual {p1, v1, v0}, Lcom/google/android/gms/internal/pg;->b(IZ)V

    :cond_a
    iget-object v0, p0, Lcom/google/android/gms/internal/d$a;->gE:[I

    if-eqz v0, :cond_b

    array-length v0, v0

    if-lez v0, :cond_b

    move v0, v2

    :goto_3
    iget-object v1, p0, Lcom/google/android/gms/internal/d$a;->gE:[I

    array-length v3, v1

    if-ge v0, v3, :cond_b

    const/16 v3, 0xa

    aget v1, v1, v0

    invoke-virtual {p1, v3, v1}, Lcom/google/android/gms/internal/pg;->s(II)V

    add-int/lit8 v0, v0, 0x1

    goto :goto_3

    :cond_b
    iget-object v0, p0, Lcom/google/android/gms/internal/d$a;->gD:[Lcom/google/android/gms/internal/d$a;

    if-eqz v0, :cond_d

    array-length v0, v0

    if-lez v0, :cond_d

    :goto_4
    iget-object v0, p0, Lcom/google/android/gms/internal/d$a;->gD:[Lcom/google/android/gms/internal/d$a;

    array-length v1, v0

    if-ge v2, v1, :cond_d

    aget-object v0, v0, v2

    if-eqz v0, :cond_c

    const/16 v1, 0xb

    invoke-virtual {p1, v1, v0}, Lcom/google/android/gms/internal/pg;->a(ILcom/google/android/gms/internal/pn;)V

    :cond_c
    add-int/lit8 v2, v2, 0x1

    goto :goto_4

    :cond_d
    iget-boolean v0, p0, Lcom/google/android/gms/internal/d$a;->gC:Z

    if-eqz v0, :cond_e

    const/16 v1, 0xc

    invoke-virtual {p1, v1, v0}, Lcom/google/android/gms/internal/pg;->b(IZ)V

    :cond_e
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

    invoke-virtual {p0, p1}, Lcom/google/android/gms/internal/d$a;->l(Lcom/google/android/gms/internal/pf;)Lcom/google/android/gms/internal/d$a;

    move-result-object p0

    return-object p0
.end method

.method protected c()I
    .locals 6

    invoke-super {p0}, Lcom/google/android/gms/internal/ph;->c()I

    move-result v0

    const/4 v1, 0x1

    iget v2, p0, Lcom/google/android/gms/internal/d$a;->type:I

    invoke-static {v1, v2}, Lcom/google/android/gms/internal/pg;->u(II)I

    move-result v1

    add-int/2addr v0, v1

    iget-object v1, p0, Lcom/google/android/gms/internal/d$a;->gv:Ljava/lang/String;

    const-string v2, ""

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_0

    const/4 v1, 0x2

    iget-object v3, p0, Lcom/google/android/gms/internal/d$a;->gv:Ljava/lang/String;

    invoke-static {v1, v3}, Lcom/google/android/gms/internal/pg;->j(ILjava/lang/String;)I

    move-result v1

    add-int/2addr v0, v1

    :cond_0
    iget-object v1, p0, Lcom/google/android/gms/internal/d$a;->gw:[Lcom/google/android/gms/internal/d$a;

    const/4 v3, 0x0

    if-eqz v1, :cond_2

    array-length v1, v1

    if-lez v1, :cond_2

    move v1, v3

    :goto_0
    iget-object v4, p0, Lcom/google/android/gms/internal/d$a;->gw:[Lcom/google/android/gms/internal/d$a;

    array-length v5, v4

    if-ge v1, v5, :cond_2

    aget-object v4, v4, v1

    if-eqz v4, :cond_1

    const/4 v5, 0x3

    invoke-static {v5, v4}, Lcom/google/android/gms/internal/pg;->c(ILcom/google/android/gms/internal/pn;)I

    move-result v4

    add-int/2addr v0, v4

    :cond_1
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    :cond_2
    iget-object v1, p0, Lcom/google/android/gms/internal/d$a;->gx:[Lcom/google/android/gms/internal/d$a;

    if-eqz v1, :cond_4

    array-length v1, v1

    if-lez v1, :cond_4

    move v1, v3

    :goto_1
    iget-object v4, p0, Lcom/google/android/gms/internal/d$a;->gx:[Lcom/google/android/gms/internal/d$a;

    array-length v5, v4

    if-ge v1, v5, :cond_4

    aget-object v4, v4, v1

    if-eqz v4, :cond_3

    const/4 v5, 0x4

    invoke-static {v5, v4}, Lcom/google/android/gms/internal/pg;->c(ILcom/google/android/gms/internal/pn;)I

    move-result v4

    add-int/2addr v0, v4

    :cond_3
    add-int/lit8 v1, v1, 0x1

    goto :goto_1

    :cond_4
    iget-object v1, p0, Lcom/google/android/gms/internal/d$a;->gy:[Lcom/google/android/gms/internal/d$a;

    if-eqz v1, :cond_6

    array-length v1, v1

    if-lez v1, :cond_6

    move v1, v3

    :goto_2
    iget-object v4, p0, Lcom/google/android/gms/internal/d$a;->gy:[Lcom/google/android/gms/internal/d$a;

    array-length v5, v4

    if-ge v1, v5, :cond_6

    aget-object v4, v4, v1

    if-eqz v4, :cond_5

    const/4 v5, 0x5

    invoke-static {v5, v4}, Lcom/google/android/gms/internal/pg;->c(ILcom/google/android/gms/internal/pn;)I

    move-result v4

    add-int/2addr v0, v4

    :cond_5
    add-int/lit8 v1, v1, 0x1

    goto :goto_2

    :cond_6
    iget-object v1, p0, Lcom/google/android/gms/internal/d$a;->gz:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_7

    const/4 v1, 0x6

    iget-object v4, p0, Lcom/google/android/gms/internal/d$a;->gz:Ljava/lang/String;

    invoke-static {v1, v4}, Lcom/google/android/gms/internal/pg;->j(ILjava/lang/String;)I

    move-result v1

    add-int/2addr v0, v1

    :cond_7
    iget-object v1, p0, Lcom/google/android/gms/internal/d$a;->gA:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_8

    const/4 v1, 0x7

    iget-object v2, p0, Lcom/google/android/gms/internal/d$a;->gA:Ljava/lang/String;

    invoke-static {v1, v2}, Lcom/google/android/gms/internal/pg;->j(ILjava/lang/String;)I

    move-result v1

    add-int/2addr v0, v1

    :cond_8
    iget-wide v1, p0, Lcom/google/android/gms/internal/d$a;->gB:J

    const-wide/16 v4, 0x0

    cmp-long v4, v1, v4

    if-eqz v4, :cond_9

    const/16 v4, 0x8

    invoke-static {v4, v1, v2}, Lcom/google/android/gms/internal/pg;->d(IJ)I

    move-result v1

    add-int/2addr v0, v1

    :cond_9
    iget-boolean v1, p0, Lcom/google/android/gms/internal/d$a;->gF:Z

    if-eqz v1, :cond_a

    const/16 v2, 0x9

    invoke-static {v2, v1}, Lcom/google/android/gms/internal/pg;->c(IZ)I

    move-result v1

    add-int/2addr v0, v1

    :cond_a
    iget-object v1, p0, Lcom/google/android/gms/internal/d$a;->gE:[I

    if-eqz v1, :cond_c

    array-length v1, v1

    if-lez v1, :cond_c

    move v1, v3

    move v2, v1

    :goto_3
    iget-object v4, p0, Lcom/google/android/gms/internal/d$a;->gE:[I

    array-length v5, v4

    if-ge v1, v5, :cond_b

    aget v4, v4, v1

    invoke-static {v4}, Lcom/google/android/gms/internal/pg;->gw(I)I

    move-result v4

    add-int/2addr v2, v4

    add-int/lit8 v1, v1, 0x1

    goto :goto_3

    :cond_b
    add-int/2addr v0, v2

    array-length v1, v4

    add-int/2addr v0, v1

    :cond_c
    iget-object v1, p0, Lcom/google/android/gms/internal/d$a;->gD:[Lcom/google/android/gms/internal/d$a;

    if-eqz v1, :cond_e

    array-length v1, v1

    if-lez v1, :cond_e

    :goto_4
    iget-object v1, p0, Lcom/google/android/gms/internal/d$a;->gD:[Lcom/google/android/gms/internal/d$a;

    array-length v2, v1

    if-ge v3, v2, :cond_e

    aget-object v1, v1, v3

    if-eqz v1, :cond_d

    const/16 v2, 0xb

    invoke-static {v2, v1}, Lcom/google/android/gms/internal/pg;->c(ILcom/google/android/gms/internal/pn;)I

    move-result v1

    add-int/2addr v0, v1

    :cond_d
    add-int/lit8 v3, v3, 0x1

    goto :goto_4

    :cond_e
    iget-boolean p0, p0, Lcom/google/android/gms/internal/d$a;->gC:Z

    if-eqz p0, :cond_f

    const/16 v1, 0xc

    invoke-static {v1, p0}, Lcom/google/android/gms/internal/pg;->c(IZ)I

    move-result p0

    add-int/2addr v0, p0

    :cond_f
    return v0
.end method

.method public equals(Ljava/lang/Object;)Z
    .locals 6

    if-ne p1, p0, :cond_0

    const/4 p0, 0x1

    return p0

    :cond_0
    instance-of v0, p1, Lcom/google/android/gms/internal/d$a;

    const/4 v1, 0x0

    if-nez v0, :cond_1

    return v1

    :cond_1
    check-cast p1, Lcom/google/android/gms/internal/d$a;

    iget v0, p0, Lcom/google/android/gms/internal/d$a;->type:I

    iget v2, p1, Lcom/google/android/gms/internal/d$a;->type:I

    if-eq v0, v2, :cond_2

    return v1

    :cond_2
    iget-object v0, p0, Lcom/google/android/gms/internal/d$a;->gv:Ljava/lang/String;

    if-nez v0, :cond_3

    iget-object v0, p1, Lcom/google/android/gms/internal/d$a;->gv:Ljava/lang/String;

    if-eqz v0, :cond_4

    return v1

    :cond_3
    iget-object v2, p1, Lcom/google/android/gms/internal/d$a;->gv:Ljava/lang/String;

    invoke-virtual {v0, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_4

    return v1

    :cond_4
    iget-object v0, p0, Lcom/google/android/gms/internal/d$a;->gw:[Lcom/google/android/gms/internal/d$a;

    iget-object v2, p1, Lcom/google/android/gms/internal/d$a;->gw:[Lcom/google/android/gms/internal/d$a;

    invoke-static {v0, v2}, Lcom/google/android/gms/internal/pl;->equals([Ljava/lang/Object;[Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_5

    return v1

    :cond_5
    iget-object v0, p0, Lcom/google/android/gms/internal/d$a;->gx:[Lcom/google/android/gms/internal/d$a;

    iget-object v2, p1, Lcom/google/android/gms/internal/d$a;->gx:[Lcom/google/android/gms/internal/d$a;

    invoke-static {v0, v2}, Lcom/google/android/gms/internal/pl;->equals([Ljava/lang/Object;[Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_6

    return v1

    :cond_6
    iget-object v0, p0, Lcom/google/android/gms/internal/d$a;->gy:[Lcom/google/android/gms/internal/d$a;

    iget-object v2, p1, Lcom/google/android/gms/internal/d$a;->gy:[Lcom/google/android/gms/internal/d$a;

    invoke-static {v0, v2}, Lcom/google/android/gms/internal/pl;->equals([Ljava/lang/Object;[Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_7

    return v1

    :cond_7
    iget-object v0, p0, Lcom/google/android/gms/internal/d$a;->gz:Ljava/lang/String;

    if-nez v0, :cond_8

    iget-object v0, p1, Lcom/google/android/gms/internal/d$a;->gz:Ljava/lang/String;

    if-eqz v0, :cond_9

    return v1

    :cond_8
    iget-object v2, p1, Lcom/google/android/gms/internal/d$a;->gz:Ljava/lang/String;

    invoke-virtual {v0, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_9

    return v1

    :cond_9
    iget-object v0, p0, Lcom/google/android/gms/internal/d$a;->gA:Ljava/lang/String;

    if-nez v0, :cond_a

    iget-object v0, p1, Lcom/google/android/gms/internal/d$a;->gA:Ljava/lang/String;

    if-eqz v0, :cond_b

    return v1

    :cond_a
    iget-object v2, p1, Lcom/google/android/gms/internal/d$a;->gA:Ljava/lang/String;

    invoke-virtual {v0, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_b

    return v1

    :cond_b
    iget-wide v2, p0, Lcom/google/android/gms/internal/d$a;->gB:J

    iget-wide v4, p1, Lcom/google/android/gms/internal/d$a;->gB:J

    cmp-long v0, v2, v4

    if-eqz v0, :cond_c

    return v1

    :cond_c
    iget-boolean v0, p0, Lcom/google/android/gms/internal/d$a;->gC:Z

    iget-boolean v2, p1, Lcom/google/android/gms/internal/d$a;->gC:Z

    if-eq v0, v2, :cond_d

    return v1

    :cond_d
    iget-object v0, p0, Lcom/google/android/gms/internal/d$a;->gD:[Lcom/google/android/gms/internal/d$a;

    iget-object v2, p1, Lcom/google/android/gms/internal/d$a;->gD:[Lcom/google/android/gms/internal/d$a;

    invoke-static {v0, v2}, Lcom/google/android/gms/internal/pl;->equals([Ljava/lang/Object;[Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_e

    return v1

    :cond_e
    iget-object v0, p0, Lcom/google/android/gms/internal/d$a;->gE:[I

    iget-object v2, p1, Lcom/google/android/gms/internal/d$a;->gE:[I

    invoke-static {v0, v2}, Lcom/google/android/gms/internal/pl;->equals([I[I)Z

    move-result v0

    if-nez v0, :cond_f

    return v1

    :cond_f
    iget-boolean v0, p0, Lcom/google/android/gms/internal/d$a;->gF:Z

    iget-boolean v2, p1, Lcom/google/android/gms/internal/d$a;->gF:Z

    if-eq v0, v2, :cond_10

    return v1

    :cond_10
    invoke-virtual {p0, p1}, Lcom/google/android/gms/internal/d$a;->a(Lcom/google/android/gms/internal/ph;)Z

    move-result p0

    return p0
.end method

.method public hashCode()I
    .locals 5

    const/16 v0, 0x20f

    iget v1, p0, Lcom/google/android/gms/internal/d$a;->type:I

    add-int/2addr v0, v1

    mul-int/lit8 v0, v0, 0x1f

    iget-object v1, p0, Lcom/google/android/gms/internal/d$a;->gv:Ljava/lang/String;

    const/4 v2, 0x0

    if-nez v1, :cond_0

    move v1, v2

    goto :goto_0

    :cond_0
    invoke-virtual {v1}, Ljava/lang/String;->hashCode()I

    move-result v1

    :goto_0
    add-int/2addr v0, v1

    mul-int/lit8 v0, v0, 0x1f

    iget-object v1, p0, Lcom/google/android/gms/internal/d$a;->gw:[Lcom/google/android/gms/internal/d$a;

    invoke-static {v1}, Lcom/google/android/gms/internal/pl;->hashCode([Ljava/lang/Object;)I

    move-result v1

    add-int/2addr v0, v1

    mul-int/lit8 v0, v0, 0x1f

    iget-object v1, p0, Lcom/google/android/gms/internal/d$a;->gx:[Lcom/google/android/gms/internal/d$a;

    invoke-static {v1}, Lcom/google/android/gms/internal/pl;->hashCode([Ljava/lang/Object;)I

    move-result v1

    add-int/2addr v0, v1

    mul-int/lit8 v0, v0, 0x1f

    iget-object v1, p0, Lcom/google/android/gms/internal/d$a;->gy:[Lcom/google/android/gms/internal/d$a;

    invoke-static {v1}, Lcom/google/android/gms/internal/pl;->hashCode([Ljava/lang/Object;)I

    move-result v1

    add-int/2addr v0, v1

    mul-int/lit8 v0, v0, 0x1f

    iget-object v1, p0, Lcom/google/android/gms/internal/d$a;->gz:Ljava/lang/String;

    if-nez v1, :cond_1

    move v1, v2

    goto :goto_1

    :cond_1
    invoke-virtual {v1}, Ljava/lang/String;->hashCode()I

    move-result v1

    :goto_1
    add-int/2addr v0, v1

    mul-int/lit8 v0, v0, 0x1f

    iget-object v1, p0, Lcom/google/android/gms/internal/d$a;->gA:Ljava/lang/String;

    if-nez v1, :cond_2

    goto :goto_2

    :cond_2
    invoke-virtual {v1}, Ljava/lang/String;->hashCode()I

    move-result v2

    :goto_2
    add-int/2addr v0, v2

    mul-int/lit8 v0, v0, 0x1f

    iget-wide v1, p0, Lcom/google/android/gms/internal/d$a;->gB:J

    const/16 v3, 0x20

    ushr-long v3, v1, v3

    xor-long/2addr v1, v3

    long-to-int v1, v1

    add-int/2addr v0, v1

    mul-int/lit8 v0, v0, 0x1f

    iget-boolean v1, p0, Lcom/google/android/gms/internal/d$a;->gC:Z

    const/16 v2, 0x4cf

    const/16 v3, 0x4d5

    if-eqz v1, :cond_3

    move v1, v2

    goto :goto_3

    :cond_3
    move v1, v3

    :goto_3
    add-int/2addr v0, v1

    mul-int/lit8 v0, v0, 0x1f

    iget-object v1, p0, Lcom/google/android/gms/internal/d$a;->gD:[Lcom/google/android/gms/internal/d$a;

    invoke-static {v1}, Lcom/google/android/gms/internal/pl;->hashCode([Ljava/lang/Object;)I

    move-result v1

    add-int/2addr v0, v1

    mul-int/lit8 v0, v0, 0x1f

    iget-object v1, p0, Lcom/google/android/gms/internal/d$a;->gE:[I

    invoke-static {v1}, Lcom/google/android/gms/internal/pl;->hashCode([I)I

    move-result v1

    add-int/2addr v0, v1

    mul-int/lit8 v0, v0, 0x1f

    iget-boolean v1, p0, Lcom/google/android/gms/internal/d$a;->gF:Z

    if-eqz v1, :cond_4

    goto :goto_4

    :cond_4
    move v2, v3

    :goto_4
    add-int/2addr v0, v2

    mul-int/lit8 v0, v0, 0x1f

    invoke-virtual {p0}, Lcom/google/android/gms/internal/d$a;->qz()I

    move-result p0

    add-int/2addr v0, p0

    return v0
.end method

.method public l(Lcom/google/android/gms/internal/pf;)Lcom/google/android/gms/internal/d$a;
    .locals 7
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

    invoke-virtual {p0, p1, v0}, Lcom/google/android/gms/internal/d$a;->a(Lcom/google/android/gms/internal/pf;I)Z

    move-result v0

    if-nez v0, :cond_0

    return-object p0

    :sswitch_0
    invoke-virtual {p1}, Lcom/google/android/gms/internal/pf;->qm()Z

    move-result v0

    iput-boolean v0, p0, Lcom/google/android/gms/internal/d$a;->gC:Z

    goto :goto_0

    :sswitch_1
    const/16 v0, 0x5a

    invoke-static {p1, v0}, Lcom/google/android/gms/internal/pq;->b(Lcom/google/android/gms/internal/pf;I)I

    move-result v0

    iget-object v2, p0, Lcom/google/android/gms/internal/d$a;->gD:[Lcom/google/android/gms/internal/d$a;

    if-nez v2, :cond_1

    move v3, v1

    goto :goto_1

    :cond_1
    array-length v3, v2

    :goto_1
    add-int/2addr v0, v3

    new-array v4, v0, [Lcom/google/android/gms/internal/d$a;

    if-eqz v3, :cond_2

    invoke-static {v2, v1, v4, v1, v3}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    :cond_2
    :goto_2
    add-int/lit8 v1, v0, -0x1

    if-ge v3, v1, :cond_3

    new-instance v1, Lcom/google/android/gms/internal/d$a;

    invoke-direct {v1}, Lcom/google/android/gms/internal/d$a;-><init>()V

    aput-object v1, v4, v3

    invoke-virtual {p1, v1}, Lcom/google/android/gms/internal/pf;->a(Lcom/google/android/gms/internal/pn;)V

    invoke-virtual {p1}, Lcom/google/android/gms/internal/pf;->qi()I

    add-int/lit8 v3, v3, 0x1

    goto :goto_2

    :cond_3
    new-instance v0, Lcom/google/android/gms/internal/d$a;

    invoke-direct {v0}, Lcom/google/android/gms/internal/d$a;-><init>()V

    aput-object v0, v4, v3

    invoke-virtual {p1, v0}, Lcom/google/android/gms/internal/pf;->a(Lcom/google/android/gms/internal/pn;)V

    iput-object v4, p0, Lcom/google/android/gms/internal/d$a;->gD:[Lcom/google/android/gms/internal/d$a;

    goto :goto_0

    :sswitch_2
    invoke-virtual {p1}, Lcom/google/android/gms/internal/pf;->qp()I

    move-result v0

    invoke-virtual {p1, v0}, Lcom/google/android/gms/internal/pf;->gp(I)I

    move-result v0

    invoke-virtual {p1}, Lcom/google/android/gms/internal/pf;->getPosition()I

    move-result v2

    move v3, v1

    :goto_3
    invoke-virtual {p1}, Lcom/google/android/gms/internal/pf;->qu()I

    move-result v4

    if-lez v4, :cond_4

    invoke-virtual {p1}, Lcom/google/android/gms/internal/pf;->ql()I

    move-result v4

    packed-switch v4, :pswitch_data_0

    goto :goto_3

    :pswitch_0
    add-int/lit8 v3, v3, 0x1

    goto :goto_3

    :cond_4
    if-eqz v3, :cond_8

    invoke-virtual {p1, v2}, Lcom/google/android/gms/internal/pf;->gr(I)V

    iget-object v2, p0, Lcom/google/android/gms/internal/d$a;->gE:[I

    if-nez v2, :cond_5

    move v4, v1

    goto :goto_4

    :cond_5
    array-length v4, v2

    :goto_4
    add-int/2addr v3, v4

    new-array v3, v3, [I

    if-eqz v4, :cond_6

    invoke-static {v2, v1, v3, v1, v4}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    :cond_6
    :goto_5
    invoke-virtual {p1}, Lcom/google/android/gms/internal/pf;->qu()I

    move-result v1

    if-lez v1, :cond_7

    invoke-virtual {p1}, Lcom/google/android/gms/internal/pf;->ql()I

    move-result v1

    packed-switch v1, :pswitch_data_1

    goto :goto_5

    :pswitch_1
    add-int/lit8 v2, v4, 0x1

    aput v1, v3, v4

    move v4, v2

    goto :goto_5

    :cond_7
    iput-object v3, p0, Lcom/google/android/gms/internal/d$a;->gE:[I

    :cond_8
    invoke-virtual {p1, v0}, Lcom/google/android/gms/internal/pf;->gq(I)V

    goto/16 :goto_0

    :sswitch_3
    const/16 v0, 0x50

    invoke-static {p1, v0}, Lcom/google/android/gms/internal/pq;->b(Lcom/google/android/gms/internal/pf;I)I

    move-result v0

    new-array v2, v0, [I

    move v3, v1

    move v4, v3

    :goto_6
    if-ge v3, v0, :cond_a

    if-eqz v3, :cond_9

    invoke-virtual {p1}, Lcom/google/android/gms/internal/pf;->qi()I

    :cond_9
    invoke-virtual {p1}, Lcom/google/android/gms/internal/pf;->ql()I

    move-result v5

    packed-switch v5, :pswitch_data_2

    goto :goto_7

    :pswitch_2
    add-int/lit8 v6, v4, 0x1

    aput v5, v2, v4

    move v4, v6

    :goto_7
    add-int/lit8 v3, v3, 0x1

    goto :goto_6

    :cond_a
    if-eqz v4, :cond_0

    iget-object v3, p0, Lcom/google/android/gms/internal/d$a;->gE:[I

    if-nez v3, :cond_b

    move v5, v1

    goto :goto_8

    :cond_b
    array-length v5, v3

    :goto_8
    if-nez v5, :cond_c

    if-ne v4, v0, :cond_c

    iput-object v2, p0, Lcom/google/android/gms/internal/d$a;->gE:[I

    goto/16 :goto_0

    :cond_c
    add-int v0, v5, v4

    new-array v0, v0, [I

    if-eqz v5, :cond_d

    invoke-static {v3, v1, v0, v1, v5}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    :cond_d
    invoke-static {v2, v1, v0, v5, v4}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    iput-object v0, p0, Lcom/google/android/gms/internal/d$a;->gE:[I

    goto/16 :goto_0

    :sswitch_4
    invoke-virtual {p1}, Lcom/google/android/gms/internal/pf;->qm()Z

    move-result v0

    iput-boolean v0, p0, Lcom/google/android/gms/internal/d$a;->gF:Z

    goto/16 :goto_0

    :sswitch_5
    invoke-virtual {p1}, Lcom/google/android/gms/internal/pf;->qk()J

    move-result-wide v0

    iput-wide v0, p0, Lcom/google/android/gms/internal/d$a;->gB:J

    goto/16 :goto_0

    :sswitch_6
    invoke-virtual {p1}, Lcom/google/android/gms/internal/pf;->readString()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/google/android/gms/internal/d$a;->gA:Ljava/lang/String;

    goto/16 :goto_0

    :sswitch_7
    invoke-virtual {p1}, Lcom/google/android/gms/internal/pf;->readString()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/google/android/gms/internal/d$a;->gz:Ljava/lang/String;

    goto/16 :goto_0

    :sswitch_8
    const/16 v0, 0x2a

    invoke-static {p1, v0}, Lcom/google/android/gms/internal/pq;->b(Lcom/google/android/gms/internal/pf;I)I

    move-result v0

    iget-object v2, p0, Lcom/google/android/gms/internal/d$a;->gy:[Lcom/google/android/gms/internal/d$a;

    if-nez v2, :cond_e

    move v3, v1

    goto :goto_9

    :cond_e
    array-length v3, v2

    :goto_9
    add-int/2addr v0, v3

    new-array v4, v0, [Lcom/google/android/gms/internal/d$a;

    if-eqz v3, :cond_f

    invoke-static {v2, v1, v4, v1, v3}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    :cond_f
    :goto_a
    add-int/lit8 v1, v0, -0x1

    if-ge v3, v1, :cond_10

    new-instance v1, Lcom/google/android/gms/internal/d$a;

    invoke-direct {v1}, Lcom/google/android/gms/internal/d$a;-><init>()V

    aput-object v1, v4, v3

    invoke-virtual {p1, v1}, Lcom/google/android/gms/internal/pf;->a(Lcom/google/android/gms/internal/pn;)V

    invoke-virtual {p1}, Lcom/google/android/gms/internal/pf;->qi()I

    add-int/lit8 v3, v3, 0x1

    goto :goto_a

    :cond_10
    new-instance v0, Lcom/google/android/gms/internal/d$a;

    invoke-direct {v0}, Lcom/google/android/gms/internal/d$a;-><init>()V

    aput-object v0, v4, v3

    invoke-virtual {p1, v0}, Lcom/google/android/gms/internal/pf;->a(Lcom/google/android/gms/internal/pn;)V

    iput-object v4, p0, Lcom/google/android/gms/internal/d$a;->gy:[Lcom/google/android/gms/internal/d$a;

    goto/16 :goto_0

    :sswitch_9
    const/16 v0, 0x22

    invoke-static {p1, v0}, Lcom/google/android/gms/internal/pq;->b(Lcom/google/android/gms/internal/pf;I)I

    move-result v0

    iget-object v2, p0, Lcom/google/android/gms/internal/d$a;->gx:[Lcom/google/android/gms/internal/d$a;

    if-nez v2, :cond_11

    move v3, v1

    goto :goto_b

    :cond_11
    array-length v3, v2

    :goto_b
    add-int/2addr v0, v3

    new-array v4, v0, [Lcom/google/android/gms/internal/d$a;

    if-eqz v3, :cond_12

    invoke-static {v2, v1, v4, v1, v3}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    :cond_12
    :goto_c
    add-int/lit8 v1, v0, -0x1

    if-ge v3, v1, :cond_13

    new-instance v1, Lcom/google/android/gms/internal/d$a;

    invoke-direct {v1}, Lcom/google/android/gms/internal/d$a;-><init>()V

    aput-object v1, v4, v3

    invoke-virtual {p1, v1}, Lcom/google/android/gms/internal/pf;->a(Lcom/google/android/gms/internal/pn;)V

    invoke-virtual {p1}, Lcom/google/android/gms/internal/pf;->qi()I

    add-int/lit8 v3, v3, 0x1

    goto :goto_c

    :cond_13
    new-instance v0, Lcom/google/android/gms/internal/d$a;

    invoke-direct {v0}, Lcom/google/android/gms/internal/d$a;-><init>()V

    aput-object v0, v4, v3

    invoke-virtual {p1, v0}, Lcom/google/android/gms/internal/pf;->a(Lcom/google/android/gms/internal/pn;)V

    iput-object v4, p0, Lcom/google/android/gms/internal/d$a;->gx:[Lcom/google/android/gms/internal/d$a;

    goto/16 :goto_0

    :sswitch_a
    const/16 v0, 0x1a

    invoke-static {p1, v0}, Lcom/google/android/gms/internal/pq;->b(Lcom/google/android/gms/internal/pf;I)I

    move-result v0

    iget-object v2, p0, Lcom/google/android/gms/internal/d$a;->gw:[Lcom/google/android/gms/internal/d$a;

    if-nez v2, :cond_14

    move v3, v1

    goto :goto_d

    :cond_14
    array-length v3, v2

    :goto_d
    add-int/2addr v0, v3

    new-array v4, v0, [Lcom/google/android/gms/internal/d$a;

    if-eqz v3, :cond_15

    invoke-static {v2, v1, v4, v1, v3}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    :cond_15
    :goto_e
    add-int/lit8 v1, v0, -0x1

    if-ge v3, v1, :cond_16

    new-instance v1, Lcom/google/android/gms/internal/d$a;

    invoke-direct {v1}, Lcom/google/android/gms/internal/d$a;-><init>()V

    aput-object v1, v4, v3

    invoke-virtual {p1, v1}, Lcom/google/android/gms/internal/pf;->a(Lcom/google/android/gms/internal/pn;)V

    invoke-virtual {p1}, Lcom/google/android/gms/internal/pf;->qi()I

    add-int/lit8 v3, v3, 0x1

    goto :goto_e

    :cond_16
    new-instance v0, Lcom/google/android/gms/internal/d$a;

    invoke-direct {v0}, Lcom/google/android/gms/internal/d$a;-><init>()V

    aput-object v0, v4, v3

    invoke-virtual {p1, v0}, Lcom/google/android/gms/internal/pf;->a(Lcom/google/android/gms/internal/pn;)V

    iput-object v4, p0, Lcom/google/android/gms/internal/d$a;->gw:[Lcom/google/android/gms/internal/d$a;

    goto/16 :goto_0

    :sswitch_b
    invoke-virtual {p1}, Lcom/google/android/gms/internal/pf;->readString()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/google/android/gms/internal/d$a;->gv:Ljava/lang/String;

    goto/16 :goto_0

    :sswitch_c
    invoke-virtual {p1}, Lcom/google/android/gms/internal/pf;->ql()I

    move-result v0

    packed-switch v0, :pswitch_data_3

    goto/16 :goto_0

    :pswitch_3
    iput v0, p0, Lcom/google/android/gms/internal/d$a;->type:I

    goto/16 :goto_0

    :sswitch_d
    return-object p0

    :sswitch_data_0
    .sparse-switch
        0x0 -> :sswitch_d
        0x8 -> :sswitch_c
        0x12 -> :sswitch_b
        0x1a -> :sswitch_a
        0x22 -> :sswitch_9
        0x2a -> :sswitch_8
        0x32 -> :sswitch_7
        0x3a -> :sswitch_6
        0x40 -> :sswitch_5
        0x48 -> :sswitch_4
        0x50 -> :sswitch_3
        0x52 -> :sswitch_2
        0x5a -> :sswitch_1
        0x60 -> :sswitch_0
    .end sparse-switch

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
    .end packed-switch

    :pswitch_data_1
    .packed-switch 0x1
        :pswitch_1
        :pswitch_1
        :pswitch_1
        :pswitch_1
        :pswitch_1
        :pswitch_1
        :pswitch_1
        :pswitch_1
        :pswitch_1
        :pswitch_1
        :pswitch_1
        :pswitch_1
        :pswitch_1
        :pswitch_1
        :pswitch_1
        :pswitch_1
        :pswitch_1
    .end packed-switch

    :pswitch_data_2
    .packed-switch 0x1
        :pswitch_2
        :pswitch_2
        :pswitch_2
        :pswitch_2
        :pswitch_2
        :pswitch_2
        :pswitch_2
        :pswitch_2
        :pswitch_2
        :pswitch_2
        :pswitch_2
        :pswitch_2
        :pswitch_2
        :pswitch_2
        :pswitch_2
        :pswitch_2
        :pswitch_2
    .end packed-switch

    :pswitch_data_3
    .packed-switch 0x1
        :pswitch_3
        :pswitch_3
        :pswitch_3
        :pswitch_3
        :pswitch_3
        :pswitch_3
        :pswitch_3
        :pswitch_3
    .end packed-switch
.end method

.method public s()Lcom/google/android/gms/internal/d$a;
    .locals 2

    const/4 v0, 0x1

    iput v0, p0, Lcom/google/android/gms/internal/d$a;->type:I

    const-string v0, ""

    iput-object v0, p0, Lcom/google/android/gms/internal/d$a;->gv:Ljava/lang/String;

    invoke-static {}, Lcom/google/android/gms/internal/d$a;->r()[Lcom/google/android/gms/internal/d$a;

    move-result-object v1

    iput-object v1, p0, Lcom/google/android/gms/internal/d$a;->gw:[Lcom/google/android/gms/internal/d$a;

    invoke-static {}, Lcom/google/android/gms/internal/d$a;->r()[Lcom/google/android/gms/internal/d$a;

    move-result-object v1

    iput-object v1, p0, Lcom/google/android/gms/internal/d$a;->gx:[Lcom/google/android/gms/internal/d$a;

    invoke-static {}, Lcom/google/android/gms/internal/d$a;->r()[Lcom/google/android/gms/internal/d$a;

    move-result-object v1

    iput-object v1, p0, Lcom/google/android/gms/internal/d$a;->gy:[Lcom/google/android/gms/internal/d$a;

    iput-object v0, p0, Lcom/google/android/gms/internal/d$a;->gz:Ljava/lang/String;

    iput-object v0, p0, Lcom/google/android/gms/internal/d$a;->gA:Ljava/lang/String;

    const-wide/16 v0, 0x0

    iput-wide v0, p0, Lcom/google/android/gms/internal/d$a;->gB:J

    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/google/android/gms/internal/d$a;->gC:Z

    invoke-static {}, Lcom/google/android/gms/internal/d$a;->r()[Lcom/google/android/gms/internal/d$a;

    move-result-object v1

    iput-object v1, p0, Lcom/google/android/gms/internal/d$a;->gD:[Lcom/google/android/gms/internal/d$a;

    sget-object v1, Lcom/google/android/gms/internal/pq;->awW:[I

    iput-object v1, p0, Lcom/google/android/gms/internal/d$a;->gE:[I

    iput-boolean v0, p0, Lcom/google/android/gms/internal/d$a;->gF:Z

    const/4 v0, 0x0

    iput-object v0, p0, Lcom/google/android/gms/internal/d$a;->awJ:Lcom/google/android/gms/internal/pj;

    const/4 v0, -0x1

    iput v0, p0, Lcom/google/android/gms/internal/d$a;->awU:I

    return-object p0
.end method
