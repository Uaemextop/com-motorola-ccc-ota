.class Lcom/google/android/gms/analytics/v;
.super Ljava/lang/Object;

# interfaces
.implements Lcom/google/android/gms/analytics/i;


# instance fields
.field As:Ljava/lang/String;

.field At:I

.field Au:I

.field xL:Ljava/lang/String;

.field xM:Ljava/lang/String;


# direct methods
.method constructor <init>()V
    .locals 1

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, -0x1

    iput v0, p0, Lcom/google/android/gms/analytics/v;->At:I

    iput v0, p0, Lcom/google/android/gms/analytics/v;->Au:I

    return-void
.end method


# virtual methods
.method public eA()I
    .locals 0

    iget p0, p0, Lcom/google/android/gms/analytics/v;->At:I

    return p0
.end method

.method public eB()Z
    .locals 1

    iget p0, p0, Lcom/google/android/gms/analytics/v;->Au:I

    const/4 v0, -0x1

    if-eq p0, v0, :cond_0

    const/4 p0, 0x1

    goto :goto_0

    :cond_0
    const/4 p0, 0x0

    :goto_0
    return p0
.end method

.method public eC()Z
    .locals 1

    iget p0, p0, Lcom/google/android/gms/analytics/v;->Au:I

    const/4 v0, 0x1

    if-ne p0, v0, :cond_0

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method public et()Z
    .locals 0

    iget-object p0, p0, Lcom/google/android/gms/analytics/v;->xL:Ljava/lang/String;

    if-eqz p0, :cond_0

    const/4 p0, 0x1

    goto :goto_0

    :cond_0
    const/4 p0, 0x0

    :goto_0
    return p0
.end method

.method public eu()Ljava/lang/String;
    .locals 0

    iget-object p0, p0, Lcom/google/android/gms/analytics/v;->xL:Ljava/lang/String;

    return-object p0
.end method

.method public ev()Z
    .locals 0

    iget-object p0, p0, Lcom/google/android/gms/analytics/v;->xM:Ljava/lang/String;

    if-eqz p0, :cond_0

    const/4 p0, 0x1

    goto :goto_0

    :cond_0
    const/4 p0, 0x0

    :goto_0
    return p0
.end method

.method public ew()Ljava/lang/String;
    .locals 0

    iget-object p0, p0, Lcom/google/android/gms/analytics/v;->xM:Ljava/lang/String;

    return-object p0
.end method

.method public ex()Z
    .locals 0

    iget-object p0, p0, Lcom/google/android/gms/analytics/v;->As:Ljava/lang/String;

    if-eqz p0, :cond_0

    const/4 p0, 0x1

    goto :goto_0

    :cond_0
    const/4 p0, 0x0

    :goto_0
    return p0
.end method

.method public ey()Ljava/lang/String;
    .locals 0

    iget-object p0, p0, Lcom/google/android/gms/analytics/v;->As:Ljava/lang/String;

    return-object p0
.end method

.method public ez()Z
    .locals 0

    iget p0, p0, Lcom/google/android/gms/analytics/v;->At:I

    if-ltz p0, :cond_0

    const/4 p0, 0x1

    goto :goto_0

    :cond_0
    const/4 p0, 0x0

    :goto_0
    return p0
.end method
