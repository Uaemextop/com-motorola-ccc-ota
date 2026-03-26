.class public abstract Lcom/google/android/gms/common/data/d;
.super Ljava/lang/Object;


# instance fields
.field protected final II:Lcom/google/android/gms/common/data/DataHolder;

.field protected JX:I

.field private JY:I


# direct methods
.method public constructor <init>(Lcom/google/android/gms/common/data/DataHolder;I)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    invoke-static {p1}, Lcom/google/android/gms/common/internal/o;->i(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lcom/google/android/gms/common/data/DataHolder;

    iput-object p1, p0, Lcom/google/android/gms/common/data/d;->II:Lcom/google/android/gms/common/data/DataHolder;

    invoke-virtual {p0, p2}, Lcom/google/android/gms/common/data/d;->ap(I)V

    return-void
.end method


# virtual methods
.method protected a(Ljava/lang/String;Landroid/database/CharArrayBuffer;)V
    .locals 2

    iget-object v0, p0, Lcom/google/android/gms/common/data/d;->II:Lcom/google/android/gms/common/data/DataHolder;

    iget v1, p0, Lcom/google/android/gms/common/data/d;->JX:I

    iget p0, p0, Lcom/google/android/gms/common/data/d;->JY:I

    invoke-virtual {v0, p1, v1, p0, p2}, Lcom/google/android/gms/common/data/DataHolder;->a(Ljava/lang/String;IILandroid/database/CharArrayBuffer;)V

    return-void
.end method

.method public aQ(Ljava/lang/String;)Z
    .locals 0

    iget-object p0, p0, Lcom/google/android/gms/common/data/d;->II:Lcom/google/android/gms/common/data/DataHolder;

    invoke-virtual {p0, p1}, Lcom/google/android/gms/common/data/DataHolder;->aQ(Ljava/lang/String;)Z

    move-result p0

    return p0
.end method

.method protected aR(Ljava/lang/String;)Landroid/net/Uri;
    .locals 2

    iget-object v0, p0, Lcom/google/android/gms/common/data/d;->II:Lcom/google/android/gms/common/data/DataHolder;

    iget v1, p0, Lcom/google/android/gms/common/data/d;->JX:I

    iget p0, p0, Lcom/google/android/gms/common/data/d;->JY:I

    invoke-virtual {v0, p1, v1, p0}, Lcom/google/android/gms/common/data/DataHolder;->g(Ljava/lang/String;II)Landroid/net/Uri;

    move-result-object p0

    return-object p0
.end method

.method protected aS(Ljava/lang/String;)Z
    .locals 2

    iget-object v0, p0, Lcom/google/android/gms/common/data/d;->II:Lcom/google/android/gms/common/data/DataHolder;

    iget v1, p0, Lcom/google/android/gms/common/data/d;->JX:I

    iget p0, p0, Lcom/google/android/gms/common/data/d;->JY:I

    invoke-virtual {v0, p1, v1, p0}, Lcom/google/android/gms/common/data/DataHolder;->h(Ljava/lang/String;II)Z

    move-result p0

    return p0
.end method

.method protected ap(I)V
    .locals 1

    if-ltz p1, :cond_0

    iget-object v0, p0, Lcom/google/android/gms/common/data/d;->II:Lcom/google/android/gms/common/data/DataHolder;

    invoke-virtual {v0}, Lcom/google/android/gms/common/data/DataHolder;->getCount()I

    move-result v0

    if-ge p1, v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    invoke-static {v0}, Lcom/google/android/gms/common/internal/o;->I(Z)V

    iput p1, p0, Lcom/google/android/gms/common/data/d;->JX:I

    iget-object v0, p0, Lcom/google/android/gms/common/data/d;->II:Lcom/google/android/gms/common/data/DataHolder;

    invoke-virtual {v0, p1}, Lcom/google/android/gms/common/data/DataHolder;->ar(I)I

    move-result p1

    iput p1, p0, Lcom/google/android/gms/common/data/d;->JY:I

    return-void
.end method

.method public equals(Ljava/lang/Object;)Z
    .locals 3

    instance-of v0, p1, Lcom/google/android/gms/common/data/d;

    const/4 v1, 0x0

    if-eqz v0, :cond_0

    check-cast p1, Lcom/google/android/gms/common/data/d;

    iget v0, p1, Lcom/google/android/gms/common/data/d;->JX:I

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    iget v2, p0, Lcom/google/android/gms/common/data/d;->JX:I

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-static {v0, v2}, Lcom/google/android/gms/common/internal/n;->equal(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    iget v0, p1, Lcom/google/android/gms/common/data/d;->JY:I

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    iget v2, p0, Lcom/google/android/gms/common/data/d;->JY:I

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-static {v0, v2}, Lcom/google/android/gms/common/internal/n;->equal(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object p1, p1, Lcom/google/android/gms/common/data/d;->II:Lcom/google/android/gms/common/data/DataHolder;

    iget-object p0, p0, Lcom/google/android/gms/common/data/d;->II:Lcom/google/android/gms/common/data/DataHolder;

    if-ne p1, p0, :cond_0

    const/4 v1, 0x1

    :cond_0
    return v1
.end method

.method protected getBoolean(Ljava/lang/String;)Z
    .locals 2

    iget-object v0, p0, Lcom/google/android/gms/common/data/d;->II:Lcom/google/android/gms/common/data/DataHolder;

    iget v1, p0, Lcom/google/android/gms/common/data/d;->JX:I

    iget p0, p0, Lcom/google/android/gms/common/data/d;->JY:I

    invoke-virtual {v0, p1, v1, p0}, Lcom/google/android/gms/common/data/DataHolder;->d(Ljava/lang/String;II)Z

    move-result p0

    return p0
.end method

.method protected getByteArray(Ljava/lang/String;)[B
    .locals 2

    iget-object v0, p0, Lcom/google/android/gms/common/data/d;->II:Lcom/google/android/gms/common/data/DataHolder;

    iget v1, p0, Lcom/google/android/gms/common/data/d;->JX:I

    iget p0, p0, Lcom/google/android/gms/common/data/d;->JY:I

    invoke-virtual {v0, p1, v1, p0}, Lcom/google/android/gms/common/data/DataHolder;->f(Ljava/lang/String;II)[B

    move-result-object p0

    return-object p0
.end method

.method protected getFloat(Ljava/lang/String;)F
    .locals 2

    iget-object v0, p0, Lcom/google/android/gms/common/data/d;->II:Lcom/google/android/gms/common/data/DataHolder;

    iget v1, p0, Lcom/google/android/gms/common/data/d;->JX:I

    iget p0, p0, Lcom/google/android/gms/common/data/d;->JY:I

    invoke-virtual {v0, p1, v1, p0}, Lcom/google/android/gms/common/data/DataHolder;->e(Ljava/lang/String;II)F

    move-result p0

    return p0
.end method

.method protected getInteger(Ljava/lang/String;)I
    .locals 2

    iget-object v0, p0, Lcom/google/android/gms/common/data/d;->II:Lcom/google/android/gms/common/data/DataHolder;

    iget v1, p0, Lcom/google/android/gms/common/data/d;->JX:I

    iget p0, p0, Lcom/google/android/gms/common/data/d;->JY:I

    invoke-virtual {v0, p1, v1, p0}, Lcom/google/android/gms/common/data/DataHolder;->b(Ljava/lang/String;II)I

    move-result p0

    return p0
.end method

.method protected getLong(Ljava/lang/String;)J
    .locals 2

    iget-object v0, p0, Lcom/google/android/gms/common/data/d;->II:Lcom/google/android/gms/common/data/DataHolder;

    iget v1, p0, Lcom/google/android/gms/common/data/d;->JX:I

    iget p0, p0, Lcom/google/android/gms/common/data/d;->JY:I

    invoke-virtual {v0, p1, v1, p0}, Lcom/google/android/gms/common/data/DataHolder;->a(Ljava/lang/String;II)J

    move-result-wide p0

    return-wide p0
.end method

.method protected getString(Ljava/lang/String;)Ljava/lang/String;
    .locals 2

    iget-object v0, p0, Lcom/google/android/gms/common/data/d;->II:Lcom/google/android/gms/common/data/DataHolder;

    iget v1, p0, Lcom/google/android/gms/common/data/d;->JX:I

    iget p0, p0, Lcom/google/android/gms/common/data/d;->JY:I

    invoke-virtual {v0, p1, v1, p0}, Lcom/google/android/gms/common/data/DataHolder;->c(Ljava/lang/String;II)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method protected gz()I
    .locals 0

    iget p0, p0, Lcom/google/android/gms/common/data/d;->JX:I

    return p0
.end method

.method public hashCode()I
    .locals 2

    iget v0, p0, Lcom/google/android/gms/common/data/d;->JX:I

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    iget v1, p0, Lcom/google/android/gms/common/data/d;->JY:I

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    iget-object p0, p0, Lcom/google/android/gms/common/data/d;->II:Lcom/google/android/gms/common/data/DataHolder;

    filled-new-array {v0, v1, p0}, [Ljava/lang/Object;

    move-result-object p0

    invoke-static {p0}, Lcom/google/android/gms/common/internal/n;->hashCode([Ljava/lang/Object;)I

    move-result p0

    return p0
.end method

.method public isDataValid()Z
    .locals 0

    iget-object p0, p0, Lcom/google/android/gms/common/data/d;->II:Lcom/google/android/gms/common/data/DataHolder;

    invoke-virtual {p0}, Lcom/google/android/gms/common/data/DataHolder;->isClosed()Z

    move-result p0

    xor-int/lit8 p0, p0, 0x1

    return p0
.end method
