.class public Lcom/google/android/gms/internal/fb;
.super Lcom/google/android/gms/internal/gg;

# interfaces
.implements Lcom/google/android/gms/internal/ff$a;


# annotations
.annotation runtime Lcom/google/android/gms/internal/ez;
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/google/android/gms/internal/fb$a;
    }
.end annotation


# instance fields
.field private final mContext:Landroid/content/Context;

.field private final mw:Ljava/lang/Object;

.field private pR:Lcom/google/android/gms/internal/cm;

.field private final sU:Lcom/google/android/gms/internal/fa$a;

.field private final sV:Ljava/lang/Object;

.field private final sW:Lcom/google/android/gms/internal/fi$a;

.field private final sX:Lcom/google/android/gms/internal/k;

.field private sY:Lcom/google/android/gms/internal/gg;

.field private sZ:Lcom/google/android/gms/internal/fk;


# direct methods
.method public constructor <init>(Landroid/content/Context;Lcom/google/android/gms/internal/fi$a;Lcom/google/android/gms/internal/k;Lcom/google/android/gms/internal/fa$a;)V
    .locals 1

    invoke-direct {p0}, Lcom/google/android/gms/internal/gg;-><init>()V

    new-instance v0, Ljava/lang/Object;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    iput-object v0, p0, Lcom/google/android/gms/internal/fb;->sV:Ljava/lang/Object;

    new-instance v0, Ljava/lang/Object;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    iput-object v0, p0, Lcom/google/android/gms/internal/fb;->mw:Ljava/lang/Object;

    iput-object p4, p0, Lcom/google/android/gms/internal/fb;->sU:Lcom/google/android/gms/internal/fa$a;

    iput-object p1, p0, Lcom/google/android/gms/internal/fb;->mContext:Landroid/content/Context;

    iput-object p2, p0, Lcom/google/android/gms/internal/fb;->sW:Lcom/google/android/gms/internal/fi$a;

    iput-object p3, p0, Lcom/google/android/gms/internal/fb;->sX:Lcom/google/android/gms/internal/k;

    return-void
.end method

.method private a(Lcom/google/android/gms/internal/fi;)Lcom/google/android/gms/internal/ay;
    .locals 11
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/android/gms/internal/fb$a;
        }
    .end annotation

    iget-object v0, p0, Lcom/google/android/gms/internal/fb;->sZ:Lcom/google/android/gms/internal/fk;

    iget-object v0, v0, Lcom/google/android/gms/internal/fk;->tL:Ljava/lang/String;

    const/4 v1, 0x0

    if-eqz v0, :cond_5

    iget-object v0, p0, Lcom/google/android/gms/internal/fb;->sZ:Lcom/google/android/gms/internal/fk;

    iget-object v0, v0, Lcom/google/android/gms/internal/fk;->tL:Ljava/lang/String;

    const-string v2, "x"

    invoke-virtual {v0, v2}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v0

    array-length v2, v0

    const/4 v3, 0x2

    const-string v4, "Could not parse the ad size from the ad response: "

    if-ne v2, v3, :cond_4

    :try_start_0
    aget-object v2, v0, v1

    invoke-static {v2}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v2

    const/4 v3, 0x1

    aget-object v0, v0, v3

    invoke-static {v0}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v0
    :try_end_0
    .catch Ljava/lang/NumberFormatException; {:try_start_0 .. :try_end_0} :catch_0

    iget-object v3, p1, Lcom/google/android/gms/internal/fi;->lH:Lcom/google/android/gms/internal/ay;

    iget-object v3, v3, Lcom/google/android/gms/internal/ay;->oh:[Lcom/google/android/gms/internal/ay;

    array-length v4, v3

    move v5, v1

    :goto_0
    if-ge v5, v4, :cond_3

    aget-object v6, v3, v5

    iget-object v7, p0, Lcom/google/android/gms/internal/fb;->mContext:Landroid/content/Context;

    invoke-virtual {v7}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v7

    invoke-virtual {v7}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object v7

    iget v7, v7, Landroid/util/DisplayMetrics;->density:F

    iget v8, v6, Lcom/google/android/gms/internal/ay;->width:I

    const/4 v9, -0x1

    if-ne v8, v9, :cond_0

    iget v8, v6, Lcom/google/android/gms/internal/ay;->widthPixels:I

    int-to-float v8, v8

    div-float/2addr v8, v7

    float-to-int v8, v8

    goto :goto_1

    :cond_0
    iget v8, v6, Lcom/google/android/gms/internal/ay;->width:I

    :goto_1
    iget v9, v6, Lcom/google/android/gms/internal/ay;->height:I

    const/4 v10, -0x2

    if-ne v9, v10, :cond_1

    iget v9, v6, Lcom/google/android/gms/internal/ay;->heightPixels:I

    int-to-float v9, v9

    div-float/2addr v9, v7

    float-to-int v7, v9

    goto :goto_2

    :cond_1
    iget v7, v6, Lcom/google/android/gms/internal/ay;->height:I

    :goto_2
    if-ne v2, v8, :cond_2

    if-ne v0, v7, :cond_2

    new-instance p0, Lcom/google/android/gms/internal/ay;

    iget-object p1, p1, Lcom/google/android/gms/internal/fi;->lH:Lcom/google/android/gms/internal/ay;

    iget-object p1, p1, Lcom/google/android/gms/internal/ay;->oh:[Lcom/google/android/gms/internal/ay;

    invoke-direct {p0, v6, p1}, Lcom/google/android/gms/internal/ay;-><init>(Lcom/google/android/gms/internal/ay;[Lcom/google/android/gms/internal/ay;)V

    return-object p0

    :cond_2
    add-int/lit8 v5, v5, 0x1

    goto :goto_0

    :cond_3
    new-instance p1, Lcom/google/android/gms/internal/fb$a;

    new-instance v0, Ljava/lang/StringBuilder;

    const-string v2, "The ad size from the ad response was not one of the requested sizes: "

    invoke-direct {v0, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object p0, p0, Lcom/google/android/gms/internal/fb;->sZ:Lcom/google/android/gms/internal/fk;

    iget-object p0, p0, Lcom/google/android/gms/internal/fk;->tL:Ljava/lang/String;

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-direct {p1, p0, v1}, Lcom/google/android/gms/internal/fb$a;-><init>(Ljava/lang/String;I)V

    throw p1

    :catch_0
    new-instance p1, Lcom/google/android/gms/internal/fb$a;

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object p0, p0, Lcom/google/android/gms/internal/fb;->sZ:Lcom/google/android/gms/internal/fk;

    iget-object p0, p0, Lcom/google/android/gms/internal/fk;->tL:Ljava/lang/String;

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-direct {p1, p0, v1}, Lcom/google/android/gms/internal/fb$a;-><init>(Ljava/lang/String;I)V

    throw p1

    :cond_4
    new-instance p1, Lcom/google/android/gms/internal/fb$a;

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object p0, p0, Lcom/google/android/gms/internal/fb;->sZ:Lcom/google/android/gms/internal/fk;

    iget-object p0, p0, Lcom/google/android/gms/internal/fk;->tL:Ljava/lang/String;

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-direct {p1, p0, v1}, Lcom/google/android/gms/internal/fb$a;-><init>(Ljava/lang/String;I)V

    throw p1

    :cond_5
    new-instance p0, Lcom/google/android/gms/internal/fb$a;

    const-string p1, "The ad response must specify one of the supported ad sizes."

    invoke-direct {p0, p1, v1}, Lcom/google/android/gms/internal/fb$a;-><init>(Ljava/lang/String;I)V

    throw p0
.end method

.method static synthetic a(Lcom/google/android/gms/internal/fb;)Ljava/lang/Object;
    .locals 0

    iget-object p0, p0, Lcom/google/android/gms/internal/fb;->mw:Ljava/lang/Object;

    return-object p0
.end method

.method static synthetic b(Lcom/google/android/gms/internal/fb;)Lcom/google/android/gms/internal/fa$a;
    .locals 0

    iget-object p0, p0, Lcom/google/android/gms/internal/fb;->sU:Lcom/google/android/gms/internal/fa$a;

    return-object p0
.end method

.method private c(J)Z
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/android/gms/internal/fb$a;
        }
    .end annotation

    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    move-result-wide v0

    sub-long/2addr v0, p1

    const-wide/32 p1, 0xea60

    sub-long/2addr p1, v0

    const-wide/16 v0, 0x0

    cmp-long v0, p1, v0

    if-gtz v0, :cond_0

    const/4 p0, 0x0

    return p0

    :cond_0
    :try_start_0
    iget-object p0, p0, Lcom/google/android/gms/internal/fb;->mw:Ljava/lang/Object;

    invoke-virtual {p0, p1, p2}, Ljava/lang/Object;->wait(J)V
    :try_end_0
    .catch Ljava/lang/InterruptedException; {:try_start_0 .. :try_end_0} :catch_0

    const/4 p0, 0x1

    return p0

    :catch_0
    new-instance p0, Lcom/google/android/gms/internal/fb$a;

    const-string p1, "Ad request cancelled."

    const/4 p2, -0x1

    invoke-direct {p0, p1, p2}, Lcom/google/android/gms/internal/fb$a;-><init>(Ljava/lang/String;I)V

    throw p0
.end method

.method private cx()V
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/android/gms/internal/fb$a;
        }
    .end annotation

    iget-object v0, p0, Lcom/google/android/gms/internal/fb;->sZ:Lcom/google/android/gms/internal/fk;

    iget v0, v0, Lcom/google/android/gms/internal/fk;->errorCode:I

    const/4 v1, -0x3

    if-ne v0, v1, :cond_0

    return-void

    :cond_0
    iget-object v0, p0, Lcom/google/android/gms/internal/fb;->sZ:Lcom/google/android/gms/internal/fk;

    iget-object v0, v0, Lcom/google/android/gms/internal/fk;->tG:Ljava/lang/String;

    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_2

    iget-object v0, p0, Lcom/google/android/gms/internal/fb;->mContext:Landroid/content/Context;

    iget-object v1, p0, Lcom/google/android/gms/internal/fb;->sZ:Lcom/google/android/gms/internal/fk;

    iget-boolean v1, v1, Lcom/google/android/gms/internal/fk;->tF:Z

    invoke-static {v0, v1}, Lcom/google/android/gms/internal/gb;->a(Landroid/content/Context;Z)V

    iget-object v0, p0, Lcom/google/android/gms/internal/fb;->sZ:Lcom/google/android/gms/internal/fk;

    iget-boolean v0, v0, Lcom/google/android/gms/internal/fk;->tI:Z

    if-eqz v0, :cond_1

    :try_start_0
    new-instance v0, Lcom/google/android/gms/internal/cm;

    iget-object v1, p0, Lcom/google/android/gms/internal/fb;->sZ:Lcom/google/android/gms/internal/fk;

    iget-object v1, v1, Lcom/google/android/gms/internal/fk;->tG:Ljava/lang/String;

    invoke-direct {v0, v1}, Lcom/google/android/gms/internal/cm;-><init>(Ljava/lang/String;)V

    iput-object v0, p0, Lcom/google/android/gms/internal/fb;->pR:Lcom/google/android/gms/internal/cm;
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    new-instance v0, Lcom/google/android/gms/internal/fb$a;

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "Could not parse mediation config: "

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object p0, p0, Lcom/google/android/gms/internal/fb;->sZ:Lcom/google/android/gms/internal/fk;

    iget-object p0, p0, Lcom/google/android/gms/internal/fk;->tG:Ljava/lang/String;

    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    const/4 v1, 0x0

    invoke-direct {v0, p0, v1}, Lcom/google/android/gms/internal/fb$a;-><init>(Ljava/lang/String;I)V

    throw v0

    :cond_1
    :goto_0
    return-void

    :cond_2
    new-instance p0, Lcom/google/android/gms/internal/fb$a;

    const-string v0, "No fill from ad server."

    const/4 v1, 0x3

    invoke-direct {p0, v0, v1}, Lcom/google/android/gms/internal/fb$a;-><init>(Ljava/lang/String;I)V

    throw p0
.end method

.method private e(J)V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/android/gms/internal/fb$a;
        }
    .end annotation

    :cond_0
    invoke-direct {p0, p1, p2}, Lcom/google/android/gms/internal/fb;->c(J)Z

    move-result v0

    if-eqz v0, :cond_3

    iget-object v0, p0, Lcom/google/android/gms/internal/fb;->sZ:Lcom/google/android/gms/internal/fk;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/google/android/gms/internal/fb;->sV:Ljava/lang/Object;

    monitor-enter v0

    const/4 p1, 0x0

    :try_start_0
    iput-object p1, p0, Lcom/google/android/gms/internal/fb;->sY:Lcom/google/android/gms/internal/gg;

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    iget-object p1, p0, Lcom/google/android/gms/internal/fb;->sZ:Lcom/google/android/gms/internal/fk;

    iget p1, p1, Lcom/google/android/gms/internal/fk;->errorCode:I

    const/4 p2, -0x2

    if-eq p1, p2, :cond_2

    iget-object p1, p0, Lcom/google/android/gms/internal/fb;->sZ:Lcom/google/android/gms/internal/fk;

    iget p1, p1, Lcom/google/android/gms/internal/fk;->errorCode:I

    const/4 p2, -0x3

    if-ne p1, p2, :cond_1

    goto :goto_0

    :cond_1
    new-instance p1, Lcom/google/android/gms/internal/fb$a;

    new-instance p2, Ljava/lang/StringBuilder;

    const-string v0, "There was a problem getting an ad response. ErrorCode: "

    invoke-direct {p2, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v0, p0, Lcom/google/android/gms/internal/fb;->sZ:Lcom/google/android/gms/internal/fk;

    iget v0, v0, Lcom/google/android/gms/internal/fk;->errorCode:I

    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object p2

    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    iget-object p0, p0, Lcom/google/android/gms/internal/fb;->sZ:Lcom/google/android/gms/internal/fk;

    iget p0, p0, Lcom/google/android/gms/internal/fk;->errorCode:I

    invoke-direct {p1, p2, p0}, Lcom/google/android/gms/internal/fb$a;-><init>(Ljava/lang/String;I)V

    throw p1

    :cond_2
    :goto_0
    return-void

    :catchall_0
    move-exception p0

    :try_start_1
    monitor-exit v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw p0

    :cond_3
    new-instance p0, Lcom/google/android/gms/internal/fb$a;

    const-string p1, "Timed out waiting for ad response."

    const/4 p2, 0x2

    invoke-direct {p0, p1, p2}, Lcom/google/android/gms/internal/fb$a;-><init>(Ljava/lang/String;I)V

    throw p0
.end method

.method private r(Z)V
    .locals 1

    invoke-static {}, Lcom/google/android/gms/internal/gb;->cU()Lcom/google/android/gms/internal/gb;

    move-result-object v0

    invoke-virtual {v0, p1}, Lcom/google/android/gms/internal/gb;->v(Z)V

    invoke-static {}, Lcom/google/android/gms/internal/gb;->cU()Lcom/google/android/gms/internal/gb;

    move-result-object p1

    iget-object p0, p0, Lcom/google/android/gms/internal/fb;->mContext:Landroid/content/Context;

    invoke-virtual {p1, p0}, Lcom/google/android/gms/internal/gb;->l(Landroid/content/Context;)Lcom/google/android/gms/internal/an;

    move-result-object p0

    if-eqz p0, :cond_0

    invoke-virtual {p0}, Lcom/google/android/gms/internal/an;->isAlive()Z

    move-result p1

    if-nez p1, :cond_0

    const-string p1, "start fetching content..."

    invoke-static {p1}, Lcom/google/android/gms/internal/gs;->S(Ljava/lang/String;)V

    invoke-virtual {p0}, Lcom/google/android/gms/internal/an;->aV()V

    :cond_0
    return-void
.end method


# virtual methods
.method public a(Lcom/google/android/gms/internal/fk;)V
    .locals 2

    iget-object v0, p0, Lcom/google/android/gms/internal/fb;->mw:Ljava/lang/Object;

    monitor-enter v0

    :try_start_0
    const-string v1, "Received ad response."

    invoke-static {v1}, Lcom/google/android/gms/internal/gs;->S(Ljava/lang/String;)V

    iput-object p1, p0, Lcom/google/android/gms/internal/fb;->sZ:Lcom/google/android/gms/internal/fk;

    iget-object p0, p0, Lcom/google/android/gms/internal/fb;->mw:Ljava/lang/Object;

    invoke-virtual {p0}, Ljava/lang/Object;->notify()V

    monitor-exit v0

    return-void

    :catchall_0
    move-exception p0

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw p0
.end method

.method public co()V
    .locals 15

    iget-object v0, p0, Lcom/google/android/gms/internal/fb;->mw:Ljava/lang/Object;

    monitor-enter v0

    :try_start_0
    const-string v1, "AdLoaderBackgroundTask started."

    invoke-static {v1}, Lcom/google/android/gms/internal/gs;->S(Ljava/lang/String;)V

    iget-object v1, p0, Lcom/google/android/gms/internal/fb;->sX:Lcom/google/android/gms/internal/k;

    invoke-virtual {v1}, Lcom/google/android/gms/internal/k;->z()Lcom/google/android/gms/internal/g;

    move-result-object v1

    iget-object v2, p0, Lcom/google/android/gms/internal/fb;->mContext:Landroid/content/Context;

    invoke-interface {v1, v2}, Lcom/google/android/gms/internal/g;->a(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v1

    new-instance v3, Lcom/google/android/gms/internal/fi;

    iget-object v2, p0, Lcom/google/android/gms/internal/fb;->sW:Lcom/google/android/gms/internal/fi$a;

    invoke-direct {v3, v2, v1}, Lcom/google/android/gms/internal/fi;-><init>(Lcom/google/android/gms/internal/fi$a;Ljava/lang/String;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    const/4 v1, 0x0

    const-wide/16 v4, -0x1

    :try_start_1
    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    move-result-wide v6

    iget-object v2, p0, Lcom/google/android/gms/internal/fb;->mContext:Landroid/content/Context;

    invoke-static {v2, v3, p0}, Lcom/google/android/gms/internal/ff;->a(Landroid/content/Context;Lcom/google/android/gms/internal/fi;Lcom/google/android/gms/internal/ff$a;)Lcom/google/android/gms/internal/gg;

    move-result-object v2

    iget-object v8, p0, Lcom/google/android/gms/internal/fb;->sV:Ljava/lang/Object;

    monitor-enter v8
    :try_end_1
    .catch Lcom/google/android/gms/internal/fb$a; {:try_start_1 .. :try_end_1} :catch_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    :try_start_2
    iput-object v2, p0, Lcom/google/android/gms/internal/fb;->sY:Lcom/google/android/gms/internal/gg;

    if-eqz v2, :cond_1

    monitor-exit v8
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    :try_start_3
    invoke-direct {p0, v6, v7}, Lcom/google/android/gms/internal/fb;->e(J)V

    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    move-result-wide v4

    invoke-direct {p0}, Lcom/google/android/gms/internal/fb;->cx()V

    iget-object v2, v3, Lcom/google/android/gms/internal/fi;->lH:Lcom/google/android/gms/internal/ay;

    iget-object v2, v2, Lcom/google/android/gms/internal/ay;->oh:[Lcom/google/android/gms/internal/ay;

    if-eqz v2, :cond_0

    invoke-direct {p0, v3}, Lcom/google/android/gms/internal/fb;->a(Lcom/google/android/gms/internal/fi;)Lcom/google/android/gms/internal/ay;

    move-result-object v2
    :try_end_3
    .catch Lcom/google/android/gms/internal/fb$a; {:try_start_3 .. :try_end_3} :catch_1
    .catchall {:try_start_3 .. :try_end_3} :catchall_1

    goto :goto_0

    :cond_0
    move-object v2, v1

    :goto_0
    :try_start_4
    iget-object v6, p0, Lcom/google/android/gms/internal/fb;->sZ:Lcom/google/android/gms/internal/fk;

    iget-boolean v6, v6, Lcom/google/android/gms/internal/fk;->tT:Z

    invoke-direct {p0, v6}, Lcom/google/android/gms/internal/fb;->r(Z)V
    :try_end_4
    .catch Lcom/google/android/gms/internal/fb$a; {:try_start_4 .. :try_end_4} :catch_0
    .catchall {:try_start_4 .. :try_end_4} :catchall_1

    const/4 v6, -0x2

    move-wide v8, v4

    move v7, v6

    move-object v6, v2

    goto :goto_6

    :catch_0
    move-exception v6

    move-wide v13, v4

    move-object v4, v2

    move-object v2, v6

    move-wide v5, v13

    goto :goto_1

    :cond_1
    :try_start_5
    new-instance v2, Lcom/google/android/gms/internal/fb$a;

    const-string v6, "Could not start the ad request service."

    const/4 v7, 0x0

    invoke-direct {v2, v6, v7}, Lcom/google/android/gms/internal/fb$a;-><init>(Ljava/lang/String;I)V

    throw v2

    :catchall_0
    move-exception v2

    monitor-exit v8
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_0

    :try_start_6
    throw v2
    :try_end_6
    .catch Lcom/google/android/gms/internal/fb$a; {:try_start_6 .. :try_end_6} :catch_1
    .catchall {:try_start_6 .. :try_end_6} :catchall_1

    :catch_1
    move-exception v2

    move-wide v5, v4

    move-object v4, v1

    :goto_1
    :try_start_7
    invoke-virtual {v2}, Lcom/google/android/gms/internal/fb$a;->getErrorCode()I

    move-result v7

    const/4 v8, 0x3

    if-eq v7, v8, :cond_3

    const/4 v8, -0x1

    if-ne v7, v8, :cond_2

    goto :goto_2

    :cond_2
    invoke-virtual {v2}, Lcom/google/android/gms/internal/fb$a;->getMessage()Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Lcom/google/android/gms/internal/gs;->W(Ljava/lang/String;)V

    goto :goto_3

    :cond_3
    :goto_2
    invoke-virtual {v2}, Lcom/google/android/gms/internal/fb$a;->getMessage()Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Lcom/google/android/gms/internal/gs;->U(Ljava/lang/String;)V

    :goto_3
    iget-object v2, p0, Lcom/google/android/gms/internal/fb;->sZ:Lcom/google/android/gms/internal/fk;

    if-nez v2, :cond_4

    new-instance v2, Lcom/google/android/gms/internal/fk;

    invoke-direct {v2, v7}, Lcom/google/android/gms/internal/fk;-><init>(I)V

    :goto_4
    iput-object v2, p0, Lcom/google/android/gms/internal/fb;->sZ:Lcom/google/android/gms/internal/fk;

    goto :goto_5

    :cond_4
    new-instance v2, Lcom/google/android/gms/internal/fk;

    iget-object v8, p0, Lcom/google/android/gms/internal/fb;->sZ:Lcom/google/android/gms/internal/fk;

    iget-wide v8, v8, Lcom/google/android/gms/internal/fk;->qj:J

    invoke-direct {v2, v7, v8, v9}, Lcom/google/android/gms/internal/fk;-><init>(IJ)V

    goto :goto_4

    :goto_5
    sget-object v2, Lcom/google/android/gms/internal/gr;->wC:Landroid/os/Handler;

    new-instance v8, Lcom/google/android/gms/internal/fb$1;

    invoke-direct {v8, p0}, Lcom/google/android/gms/internal/fb$1;-><init>(Lcom/google/android/gms/internal/fb;)V

    invoke-virtual {v2, v8}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    move-wide v8, v5

    move-object v6, v4

    :goto_6
    iget-object v2, p0, Lcom/google/android/gms/internal/fb;->sZ:Lcom/google/android/gms/internal/fk;

    iget-object v2, v2, Lcom/google/android/gms/internal/fk;->tQ:Ljava/lang/String;

    invoke-static {v2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v2
    :try_end_7
    .catchall {:try_start_7 .. :try_end_7} :catchall_1

    if-nez v2, :cond_5

    :try_start_8
    new-instance v2, Lorg/json/JSONObject;

    iget-object v4, p0, Lcom/google/android/gms/internal/fb;->sZ:Lcom/google/android/gms/internal/fk;

    iget-object v4, v4, Lcom/google/android/gms/internal/fk;->tQ:Ljava/lang/String;

    invoke-direct {v2, v4}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V
    :try_end_8
    .catch Ljava/lang/Exception; {:try_start_8 .. :try_end_8} :catch_2
    .catchall {:try_start_8 .. :try_end_8} :catchall_1

    move-object v12, v2

    goto :goto_7

    :catch_2
    move-exception v2

    :try_start_9
    const-string v4, "Error parsing the JSON for Active View."

    invoke-static {v4, v2}, Lcom/google/android/gms/internal/gs;->b(Ljava/lang/String;Ljava/lang/Throwable;)V

    :cond_5
    move-object v12, v1

    :goto_7
    new-instance v1, Lcom/google/android/gms/internal/fz$a;

    iget-object v4, p0, Lcom/google/android/gms/internal/fb;->sZ:Lcom/google/android/gms/internal/fk;

    iget-object v5, p0, Lcom/google/android/gms/internal/fb;->pR:Lcom/google/android/gms/internal/cm;

    iget-wide v10, v4, Lcom/google/android/gms/internal/fk;->tM:J

    move-object v2, v1

    invoke-direct/range {v2 .. v12}, Lcom/google/android/gms/internal/fz$a;-><init>(Lcom/google/android/gms/internal/fi;Lcom/google/android/gms/internal/fk;Lcom/google/android/gms/internal/cm;Lcom/google/android/gms/internal/ay;IJJLorg/json/JSONObject;)V

    sget-object v2, Lcom/google/android/gms/internal/gr;->wC:Landroid/os/Handler;

    new-instance v3, Lcom/google/android/gms/internal/fb$2;

    invoke-direct {v3, p0, v1}, Lcom/google/android/gms/internal/fb$2;-><init>(Lcom/google/android/gms/internal/fb;Lcom/google/android/gms/internal/fz$a;)V

    invoke-virtual {v2, v3}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    monitor-exit v0

    return-void

    :catchall_1
    move-exception p0

    monitor-exit v0
    :try_end_9
    .catchall {:try_start_9 .. :try_end_9} :catchall_1

    throw p0
.end method

.method public onStop()V
    .locals 1

    iget-object v0, p0, Lcom/google/android/gms/internal/fb;->sV:Ljava/lang/Object;

    monitor-enter v0

    :try_start_0
    iget-object p0, p0, Lcom/google/android/gms/internal/fb;->sY:Lcom/google/android/gms/internal/gg;

    if-eqz p0, :cond_0

    invoke-virtual {p0}, Lcom/google/android/gms/internal/gg;->cancel()V

    :cond_0
    monitor-exit v0

    return-void

    :catchall_0
    move-exception p0

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw p0
.end method
