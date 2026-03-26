.class Lcom/google/android/gms/analytics/ai;
.super Ljava/lang/Object;

# interfaces
.implements Lcom/google/android/gms/analytics/i;


# instance fields
.field BC:Ljava/lang/String;

.field BD:D

.field BE:I

.field BF:I

.field BG:I

.field BH:I

.field BI:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method constructor <init>()V
    .locals 2

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const-wide/high16 v0, -0x4010000000000000L    # -1.0

    iput-wide v0, p0, Lcom/google/android/gms/analytics/ai;->BD:D

    const/4 v0, -0x1

    iput v0, p0, Lcom/google/android/gms/analytics/ai;->BE:I

    iput v0, p0, Lcom/google/android/gms/analytics/ai;->BF:I

    iput v0, p0, Lcom/google/android/gms/analytics/ai;->BG:I

    iput v0, p0, Lcom/google/android/gms/analytics/ai;->BH:I

    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lcom/google/android/gms/analytics/ai;->BI:Ljava/util/Map;

    return-void
.end method


# virtual methods
.method public am(Ljava/lang/String;)Ljava/lang/String;
    .locals 0

    iget-object p0, p0, Lcom/google/android/gms/analytics/ai;->BI:Ljava/util/Map;

    invoke-interface {p0, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Ljava/lang/String;

    if-eqz p0, :cond_0

    move-object p1, p0

    :cond_0
    return-object p1
.end method

.method public eZ()Z
    .locals 0

    iget-object p0, p0, Lcom/google/android/gms/analytics/ai;->BC:Ljava/lang/String;

    if-eqz p0, :cond_0

    const/4 p0, 0x1

    goto :goto_0

    :cond_0
    const/4 p0, 0x0

    :goto_0
    return p0
.end method

.method public fa()Ljava/lang/String;
    .locals 0

    iget-object p0, p0, Lcom/google/android/gms/analytics/ai;->BC:Ljava/lang/String;

    return-object p0
.end method

.method public fb()Z
    .locals 4

    iget-wide v0, p0, Lcom/google/android/gms/analytics/ai;->BD:D

    const-wide/16 v2, 0x0

    cmpl-double p0, v0, v2

    if-ltz p0, :cond_0

    const/4 p0, 0x1

    goto :goto_0

    :cond_0
    const/4 p0, 0x0

    :goto_0
    return p0
.end method

.method public fc()D
    .locals 2

    iget-wide v0, p0, Lcom/google/android/gms/analytics/ai;->BD:D

    return-wide v0
.end method

.method public fd()Z
    .locals 0

    iget p0, p0, Lcom/google/android/gms/analytics/ai;->BE:I

    if-ltz p0, :cond_0

    const/4 p0, 0x1

    goto :goto_0

    :cond_0
    const/4 p0, 0x0

    :goto_0
    return p0
.end method

.method public fe()Z
    .locals 1

    iget p0, p0, Lcom/google/android/gms/analytics/ai;->BF:I

    const/4 v0, -0x1

    if-eq p0, v0, :cond_0

    const/4 p0, 0x1

    goto :goto_0

    :cond_0
    const/4 p0, 0x0

    :goto_0
    return p0
.end method

.method public ff()Z
    .locals 1

    iget p0, p0, Lcom/google/android/gms/analytics/ai;->BF:I

    const/4 v0, 0x1

    if-ne p0, v0, :cond_0

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method public fg()Z
    .locals 1

    iget p0, p0, Lcom/google/android/gms/analytics/ai;->BG:I

    const/4 v0, -0x1

    if-eq p0, v0, :cond_0

    const/4 p0, 0x1

    goto :goto_0

    :cond_0
    const/4 p0, 0x0

    :goto_0
    return p0
.end method

.method public fh()Z
    .locals 1

    iget p0, p0, Lcom/google/android/gms/analytics/ai;->BG:I

    const/4 v0, 0x1

    if-ne p0, v0, :cond_0

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method public fi()Z
    .locals 1

    iget p0, p0, Lcom/google/android/gms/analytics/ai;->BH:I

    const/4 v0, 0x1

    if-ne p0, v0, :cond_0

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method public getSessionTimeout()I
    .locals 0

    iget p0, p0, Lcom/google/android/gms/analytics/ai;->BE:I

    return p0
.end method

.method public k(Landroid/app/Activity;)Ljava/lang/String;
    .locals 0

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/Class;->getCanonicalName()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p0, p1}, Lcom/google/android/gms/analytics/ai;->am(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method
