.class Lcom/google/android/gms/internal/p;
.super Ljava/lang/Object;

# interfaces
.implements Lcom/google/android/gms/internal/n;


# instance fields
.field private kY:Lcom/google/android/gms/internal/pg;

.field private kZ:[B

.field private final la:I


# direct methods
.method public constructor <init>(I)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput p1, p0, Lcom/google/android/gms/internal/p;->la:I

    invoke-virtual {p0}, Lcom/google/android/gms/internal/p;->reset()V

    return-void
.end method


# virtual methods
.method public A()[B
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    iget-object v0, p0, Lcom/google/android/gms/internal/p;->kY:Lcom/google/android/gms/internal/pg;

    invoke-virtual {v0}, Lcom/google/android/gms/internal/pg;->qx()I

    move-result v0

    if-ltz v0, :cond_1

    iget-object p0, p0, Lcom/google/android/gms/internal/p;->kZ:[B

    if-nez v0, :cond_0

    return-object p0

    :cond_0
    array-length v1, p0

    sub-int/2addr v1, v0

    new-array v0, v1, [B

    const/4 v2, 0x0

    invoke-static {p0, v2, v0, v2, v1}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    return-object v0

    :cond_1
    new-instance p0, Ljava/io/IOException;

    invoke-direct {p0}, Ljava/io/IOException;-><init>()V

    throw p0
.end method

.method public b(IJ)V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    iget-object p0, p0, Lcom/google/android/gms/internal/p;->kY:Lcom/google/android/gms/internal/pg;

    invoke-virtual {p0, p1, p2, p3}, Lcom/google/android/gms/internal/pg;->b(IJ)V

    return-void
.end method

.method public b(ILjava/lang/String;)V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    iget-object p0, p0, Lcom/google/android/gms/internal/p;->kY:Lcom/google/android/gms/internal/pg;

    invoke-virtual {p0, p1, p2}, Lcom/google/android/gms/internal/pg;->b(ILjava/lang/String;)V

    return-void
.end method

.method public reset()V
    .locals 1

    iget v0, p0, Lcom/google/android/gms/internal/p;->la:I

    new-array v0, v0, [B

    iput-object v0, p0, Lcom/google/android/gms/internal/p;->kZ:[B

    invoke-static {v0}, Lcom/google/android/gms/internal/pg;->q([B)Lcom/google/android/gms/internal/pg;

    move-result-object v0

    iput-object v0, p0, Lcom/google/android/gms/internal/p;->kY:Lcom/google/android/gms/internal/pg;

    return-void
.end method
