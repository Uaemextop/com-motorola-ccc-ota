.class Lcom/google/android/gms/analytics/Tracker$a;
.super Ljava/lang/Object;

# interfaces
.implements Lcom/google/android/gms/analytics/GoogleAnalytics$a;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/google/android/gms/analytics/Tracker;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "a"
.end annotation


# instance fields
.field final synthetic BA:Lcom/google/android/gms/analytics/Tracker;

.field private Bv:Z

.field private Bw:I

.field private Bx:J

.field private By:Z

.field private Bz:J

.field private yD:Lcom/google/android/gms/internal/ju;


# direct methods
.method public constructor <init>(Lcom/google/android/gms/analytics/Tracker;)V
    .locals 2

    iput-object p1, p0, Lcom/google/android/gms/analytics/Tracker$a;->BA:Lcom/google/android/gms/analytics/Tracker;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 p1, 0x0

    iput-boolean p1, p0, Lcom/google/android/gms/analytics/Tracker$a;->Bv:Z

    iput p1, p0, Lcom/google/android/gms/analytics/Tracker$a;->Bw:I

    const-wide/16 v0, -0x1

    iput-wide v0, p0, Lcom/google/android/gms/analytics/Tracker$a;->Bx:J

    iput-boolean p1, p0, Lcom/google/android/gms/analytics/Tracker$a;->By:Z

    invoke-static {}, Lcom/google/android/gms/internal/jw;->hA()Lcom/google/android/gms/internal/ju;

    move-result-object p1

    iput-object p1, p0, Lcom/google/android/gms/analytics/Tracker$a;->yD:Lcom/google/android/gms/internal/ju;

    return-void
.end method

.method private eW()V
    .locals 5

    invoke-static {}, Lcom/google/android/gms/analytics/GoogleAnalytics;->eD()Lcom/google/android/gms/analytics/GoogleAnalytics;

    move-result-object v0

    if-nez v0, :cond_0

    const-string p0, "GoogleAnalytics isn\'t initialized for the Tracker!"

    invoke-static {p0}, Lcom/google/android/gms/analytics/z;->T(Ljava/lang/String;)V

    return-void

    :cond_0
    iget-wide v1, p0, Lcom/google/android/gms/analytics/Tracker$a;->Bx:J

    const-wide/16 v3, 0x0

    cmp-long v1, v1, v3

    if-gez v1, :cond_2

    iget-boolean v1, p0, Lcom/google/android/gms/analytics/Tracker$a;->Bv:Z

    if-eqz v1, :cond_1

    goto :goto_0

    :cond_1
    iget-object p0, p0, Lcom/google/android/gms/analytics/Tracker$a;->BA:Lcom/google/android/gms/analytics/Tracker;

    invoke-static {p0}, Lcom/google/android/gms/analytics/Tracker;->b(Lcom/google/android/gms/analytics/Tracker;)Lcom/google/android/gms/analytics/Tracker$a;

    move-result-object p0

    invoke-virtual {v0, p0}, Lcom/google/android/gms/analytics/GoogleAnalytics;->b(Lcom/google/android/gms/analytics/GoogleAnalytics$a;)V

    goto :goto_1

    :cond_2
    :goto_0
    iget-object p0, p0, Lcom/google/android/gms/analytics/Tracker$a;->BA:Lcom/google/android/gms/analytics/Tracker;

    invoke-static {p0}, Lcom/google/android/gms/analytics/Tracker;->b(Lcom/google/android/gms/analytics/Tracker;)Lcom/google/android/gms/analytics/Tracker$a;

    move-result-object p0

    invoke-virtual {v0, p0}, Lcom/google/android/gms/analytics/GoogleAnalytics;->a(Lcom/google/android/gms/analytics/GoogleAnalytics$a;)V

    :goto_1
    return-void
.end method


# virtual methods
.method public eT()J
    .locals 2

    iget-wide v0, p0, Lcom/google/android/gms/analytics/Tracker$a;->Bx:J

    return-wide v0
.end method

.method public eU()Z
    .locals 0

    iget-boolean p0, p0, Lcom/google/android/gms/analytics/Tracker$a;->Bv:Z

    return p0
.end method

.method public eV()Z
    .locals 2

    iget-boolean v0, p0, Lcom/google/android/gms/analytics/Tracker$a;->By:Z

    const/4 v1, 0x0

    iput-boolean v1, p0, Lcom/google/android/gms/analytics/Tracker$a;->By:Z

    return v0
.end method

.method eX()Z
    .locals 8

    iget-object v0, p0, Lcom/google/android/gms/analytics/Tracker$a;->yD:Lcom/google/android/gms/internal/ju;

    invoke-interface {v0}, Lcom/google/android/gms/internal/ju;->elapsedRealtime()J

    move-result-wide v0

    iget-wide v2, p0, Lcom/google/android/gms/analytics/Tracker$a;->Bz:J

    const-wide/16 v4, 0x3e8

    iget-wide v6, p0, Lcom/google/android/gms/analytics/Tracker$a;->Bx:J

    invoke-static {v4, v5, v6, v7}, Ljava/lang/Math;->max(JJ)J

    move-result-wide v4

    add-long/2addr v2, v4

    cmp-long p0, v0, v2

    if-ltz p0, :cond_0

    const/4 p0, 0x1

    goto :goto_0

    :cond_0
    const/4 p0, 0x0

    :goto_0
    return p0
.end method

.method public enableAutoActivityTracking(Z)V
    .locals 0

    iput-boolean p1, p0, Lcom/google/android/gms/analytics/Tracker$a;->Bv:Z

    invoke-direct {p0}, Lcom/google/android/gms/analytics/Tracker$a;->eW()V

    return-void
.end method

.method public i(Landroid/app/Activity;)V
    .locals 4

    invoke-static {}, Lcom/google/android/gms/analytics/t;->ep()Lcom/google/android/gms/analytics/t;

    move-result-object v0

    sget-object v1, Lcom/google/android/gms/analytics/t$a;->An:Lcom/google/android/gms/analytics/t$a;

    invoke-virtual {v0, v1}, Lcom/google/android/gms/analytics/t;->a(Lcom/google/android/gms/analytics/t$a;)V

    iget v0, p0, Lcom/google/android/gms/analytics/Tracker$a;->Bw:I

    const/4 v1, 0x1

    if-nez v0, :cond_0

    invoke-virtual {p0}, Lcom/google/android/gms/analytics/Tracker$a;->eX()Z

    move-result v0

    if-eqz v0, :cond_0

    iput-boolean v1, p0, Lcom/google/android/gms/analytics/Tracker$a;->By:Z

    :cond_0
    iget v0, p0, Lcom/google/android/gms/analytics/Tracker$a;->Bw:I

    add-int/2addr v0, v1

    iput v0, p0, Lcom/google/android/gms/analytics/Tracker$a;->Bw:I

    iget-boolean v0, p0, Lcom/google/android/gms/analytics/Tracker$a;->Bv:Z

    if-eqz v0, :cond_2

    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    const-string v2, "&t"

    const-string v3, "screenview"

    invoke-interface {v0, v2, v3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    invoke-static {}, Lcom/google/android/gms/analytics/t;->ep()Lcom/google/android/gms/analytics/t;

    move-result-object v2

    invoke-virtual {v2, v1}, Lcom/google/android/gms/analytics/t;->B(Z)V

    iget-object v1, p0, Lcom/google/android/gms/analytics/Tracker$a;->BA:Lcom/google/android/gms/analytics/Tracker;

    invoke-static {v1}, Lcom/google/android/gms/analytics/Tracker;->c(Lcom/google/android/gms/analytics/Tracker;)Lcom/google/android/gms/analytics/ai;

    move-result-object v2

    if-eqz v2, :cond_1

    iget-object v2, p0, Lcom/google/android/gms/analytics/Tracker$a;->BA:Lcom/google/android/gms/analytics/Tracker;

    invoke-static {v2}, Lcom/google/android/gms/analytics/Tracker;->c(Lcom/google/android/gms/analytics/Tracker;)Lcom/google/android/gms/analytics/ai;

    move-result-object v2

    invoke-virtual {v2, p1}, Lcom/google/android/gms/analytics/ai;->k(Landroid/app/Activity;)Ljava/lang/String;

    move-result-object p1

    goto :goto_0

    :cond_1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/Class;->getCanonicalName()Ljava/lang/String;

    move-result-object p1

    :goto_0
    const-string v2, "&cd"

    invoke-virtual {v1, v2, p1}, Lcom/google/android/gms/analytics/Tracker;->set(Ljava/lang/String;Ljava/lang/String;)V

    iget-object p0, p0, Lcom/google/android/gms/analytics/Tracker$a;->BA:Lcom/google/android/gms/analytics/Tracker;

    invoke-virtual {p0, v0}, Lcom/google/android/gms/analytics/Tracker;->send(Ljava/util/Map;)V

    invoke-static {}, Lcom/google/android/gms/analytics/t;->ep()Lcom/google/android/gms/analytics/t;

    move-result-object p0

    const/4 p1, 0x0

    invoke-virtual {p0, p1}, Lcom/google/android/gms/analytics/t;->B(Z)V

    :cond_2
    return-void
.end method

.method public j(Landroid/app/Activity;)V
    .locals 2

    invoke-static {}, Lcom/google/android/gms/analytics/t;->ep()Lcom/google/android/gms/analytics/t;

    move-result-object p1

    sget-object v0, Lcom/google/android/gms/analytics/t$a;->Ao:Lcom/google/android/gms/analytics/t$a;

    invoke-virtual {p1, v0}, Lcom/google/android/gms/analytics/t;->a(Lcom/google/android/gms/analytics/t$a;)V

    iget p1, p0, Lcom/google/android/gms/analytics/Tracker$a;->Bw:I

    add-int/lit8 p1, p1, -0x1

    iput p1, p0, Lcom/google/android/gms/analytics/Tracker$a;->Bw:I

    const/4 v0, 0x0

    invoke-static {v0, p1}, Ljava/lang/Math;->max(II)I

    move-result p1

    iput p1, p0, Lcom/google/android/gms/analytics/Tracker$a;->Bw:I

    if-nez p1, :cond_0

    iget-object p1, p0, Lcom/google/android/gms/analytics/Tracker$a;->yD:Lcom/google/android/gms/internal/ju;

    invoke-interface {p1}, Lcom/google/android/gms/internal/ju;->elapsedRealtime()J

    move-result-wide v0

    iput-wide v0, p0, Lcom/google/android/gms/analytics/Tracker$a;->Bz:J

    :cond_0
    return-void
.end method

.method public setSessionTimeout(J)V
    .locals 0

    iput-wide p1, p0, Lcom/google/android/gms/analytics/Tracker$a;->Bx:J

    invoke-direct {p0}, Lcom/google/android/gms/analytics/Tracker$a;->eW()V

    return-void
.end method
