.class public Lcom/google/android/gms/analytics/Tracker;
.super Ljava/lang/Object;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/google/android/gms/analytics/Tracker$a;
    }
.end annotation


# instance fields
.field private final Bm:Lcom/google/android/gms/analytics/TrackerHandler;

.field private Bn:Lcom/google/android/gms/analytics/ac;

.field private final Bo:Lcom/google/android/gms/analytics/h;

.field private final Bp:Lcom/google/android/gms/analytics/ad;

.field private final Bq:Lcom/google/android/gms/analytics/g;

.field private Br:Z

.field private Bs:Lcom/google/android/gms/analytics/Tracker$a;

.field private Bt:Lcom/google/android/gms/analytics/ai;

.field private Bu:Lcom/google/android/gms/analytics/ExceptionReporter;

.field private mContext:Landroid/content/Context;

.field private final qM:Ljava/util/Map;
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
.method constructor <init>(Ljava/lang/String;Lcom/google/android/gms/analytics/TrackerHandler;Landroid/content/Context;)V
    .locals 8

    invoke-static {}, Lcom/google/android/gms/analytics/h;->dQ()Lcom/google/android/gms/analytics/h;

    move-result-object v3

    invoke-static {}, Lcom/google/android/gms/analytics/ad;->eQ()Lcom/google/android/gms/analytics/ad;

    move-result-object v4

    invoke-static {}, Lcom/google/android/gms/analytics/g;->dP()Lcom/google/android/gms/analytics/g;

    move-result-object v5

    new-instance v6, Lcom/google/android/gms/analytics/y;

    const-string v0, "tracking"

    invoke-direct {v6, v0}, Lcom/google/android/gms/analytics/y;-><init>(Ljava/lang/String;)V

    move-object v0, p0

    move-object v1, p1

    move-object v2, p2

    move-object v7, p3

    invoke-direct/range {v0 .. v7}, Lcom/google/android/gms/analytics/Tracker;-><init>(Ljava/lang/String;Lcom/google/android/gms/analytics/TrackerHandler;Lcom/google/android/gms/analytics/h;Lcom/google/android/gms/analytics/ad;Lcom/google/android/gms/analytics/g;Lcom/google/android/gms/analytics/ac;Landroid/content/Context;)V

    return-void
.end method

.method constructor <init>(Ljava/lang/String;Lcom/google/android/gms/analytics/TrackerHandler;Lcom/google/android/gms/analytics/h;Lcom/google/android/gms/analytics/ad;Lcom/google/android/gms/analytics/g;Lcom/google/android/gms/analytics/ac;Landroid/content/Context;)V
    .locals 1

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lcom/google/android/gms/analytics/Tracker;->qM:Ljava/util/Map;

    iput-object p2, p0, Lcom/google/android/gms/analytics/Tracker;->Bm:Lcom/google/android/gms/analytics/TrackerHandler;

    if-eqz p7, :cond_0

    invoke-virtual {p7}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object p2

    iput-object p2, p0, Lcom/google/android/gms/analytics/Tracker;->mContext:Landroid/content/Context;

    :cond_0
    if-eqz p1, :cond_1

    const-string p2, "&tid"

    invoke-interface {v0, p2, p1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    :cond_1
    const-string p1, "useSecure"

    const-string p2, "1"

    invoke-interface {v0, p1, p2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    iput-object p3, p0, Lcom/google/android/gms/analytics/Tracker;->Bo:Lcom/google/android/gms/analytics/h;

    iput-object p4, p0, Lcom/google/android/gms/analytics/Tracker;->Bp:Lcom/google/android/gms/analytics/ad;

    iput-object p5, p0, Lcom/google/android/gms/analytics/Tracker;->Bq:Lcom/google/android/gms/analytics/g;

    new-instance p1, Ljava/util/Random;

    invoke-direct {p1}, Ljava/util/Random;-><init>()V

    const p2, 0x7fffffff

    invoke-virtual {p1, p2}, Ljava/util/Random;->nextInt(I)I

    move-result p1

    add-int/lit8 p1, p1, 0x1

    invoke-static {p1}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    move-result-object p1

    const-string p2, "&a"

    invoke-interface {v0, p2, p1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    iput-object p6, p0, Lcom/google/android/gms/analytics/Tracker;->Bn:Lcom/google/android/gms/analytics/ac;

    new-instance p1, Lcom/google/android/gms/analytics/Tracker$a;

    invoke-direct {p1, p0}, Lcom/google/android/gms/analytics/Tracker$a;-><init>(Lcom/google/android/gms/analytics/Tracker;)V

    iput-object p1, p0, Lcom/google/android/gms/analytics/Tracker;->Bs:Lcom/google/android/gms/analytics/Tracker$a;

    const/4 p1, 0x0

    invoke-virtual {p0, p1}, Lcom/google/android/gms/analytics/Tracker;->enableAdvertisingIdCollection(Z)V

    return-void
.end method

.method static synthetic b(Lcom/google/android/gms/analytics/Tracker;)Lcom/google/android/gms/analytics/Tracker$a;
    .locals 0

    iget-object p0, p0, Lcom/google/android/gms/analytics/Tracker;->Bs:Lcom/google/android/gms/analytics/Tracker$a;

    return-object p0
.end method

.method static synthetic c(Lcom/google/android/gms/analytics/Tracker;)Lcom/google/android/gms/analytics/ai;
    .locals 0

    iget-object p0, p0, Lcom/google/android/gms/analytics/Tracker;->Bt:Lcom/google/android/gms/analytics/ai;

    return-object p0
.end method


# virtual methods
.method a(Lcom/google/android/gms/analytics/ai;)V
    .locals 2

    const-string v0, "Loading Tracker config values."

    invoke-static {v0}, Lcom/google/android/gms/analytics/z;->V(Ljava/lang/String;)V

    iput-object p1, p0, Lcom/google/android/gms/analytics/Tracker;->Bt:Lcom/google/android/gms/analytics/ai;

    invoke-virtual {p1}, Lcom/google/android/gms/analytics/ai;->eZ()Z

    move-result p1

    if-eqz p1, :cond_0

    iget-object p1, p0, Lcom/google/android/gms/analytics/Tracker;->Bt:Lcom/google/android/gms/analytics/ai;

    invoke-virtual {p1}, Lcom/google/android/gms/analytics/ai;->fa()Ljava/lang/String;

    move-result-object p1

    const-string v0, "&tid"

    invoke-virtual {p0, v0, p1}, Lcom/google/android/gms/analytics/Tracker;->set(Ljava/lang/String;Ljava/lang/String;)V

    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "[Tracker] trackingId loaded: "

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {p1}, Lcom/google/android/gms/analytics/z;->V(Ljava/lang/String;)V

    :cond_0
    iget-object p1, p0, Lcom/google/android/gms/analytics/Tracker;->Bt:Lcom/google/android/gms/analytics/ai;

    invoke-virtual {p1}, Lcom/google/android/gms/analytics/ai;->fb()Z

    move-result p1

    if-eqz p1, :cond_1

    iget-object p1, p0, Lcom/google/android/gms/analytics/Tracker;->Bt:Lcom/google/android/gms/analytics/ai;

    invoke-virtual {p1}, Lcom/google/android/gms/analytics/ai;->fc()D

    move-result-wide v0

    invoke-static {v0, v1}, Ljava/lang/Double;->toString(D)Ljava/lang/String;

    move-result-object p1

    const-string v0, "&sf"

    invoke-virtual {p0, v0, p1}, Lcom/google/android/gms/analytics/Tracker;->set(Ljava/lang/String;Ljava/lang/String;)V

    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "[Tracker] sample frequency loaded: "

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {p1}, Lcom/google/android/gms/analytics/z;->V(Ljava/lang/String;)V

    :cond_1
    iget-object p1, p0, Lcom/google/android/gms/analytics/Tracker;->Bt:Lcom/google/android/gms/analytics/ai;

    invoke-virtual {p1}, Lcom/google/android/gms/analytics/ai;->fd()Z

    move-result p1

    if-eqz p1, :cond_2

    iget-object p1, p0, Lcom/google/android/gms/analytics/Tracker;->Bt:Lcom/google/android/gms/analytics/ai;

    invoke-virtual {p1}, Lcom/google/android/gms/analytics/ai;->getSessionTimeout()I

    move-result p1

    int-to-long v0, p1

    invoke-virtual {p0, v0, v1}, Lcom/google/android/gms/analytics/Tracker;->setSessionTimeout(J)V

    new-instance p1, Ljava/lang/StringBuilder;

    const-string v0, "[Tracker] session timeout loaded: "

    invoke-direct {p1, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p0}, Lcom/google/android/gms/analytics/Tracker;->eT()J

    move-result-wide v0

    invoke-virtual {p1, v0, v1}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {p1}, Lcom/google/android/gms/analytics/z;->V(Ljava/lang/String;)V

    :cond_2
    iget-object p1, p0, Lcom/google/android/gms/analytics/Tracker;->Bt:Lcom/google/android/gms/analytics/ai;

    invoke-virtual {p1}, Lcom/google/android/gms/analytics/ai;->fe()Z

    move-result p1

    if-eqz p1, :cond_3

    iget-object p1, p0, Lcom/google/android/gms/analytics/Tracker;->Bt:Lcom/google/android/gms/analytics/ai;

    invoke-virtual {p1}, Lcom/google/android/gms/analytics/ai;->ff()Z

    move-result p1

    invoke-virtual {p0, p1}, Lcom/google/android/gms/analytics/Tracker;->enableAutoActivityTracking(Z)V

    new-instance p1, Ljava/lang/StringBuilder;

    const-string v0, "[Tracker] auto activity tracking loaded: "

    invoke-direct {p1, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p0}, Lcom/google/android/gms/analytics/Tracker;->eU()Z

    move-result v0

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {p1}, Lcom/google/android/gms/analytics/z;->V(Ljava/lang/String;)V

    :cond_3
    iget-object p1, p0, Lcom/google/android/gms/analytics/Tracker;->Bt:Lcom/google/android/gms/analytics/ai;

    invoke-virtual {p1}, Lcom/google/android/gms/analytics/ai;->fg()Z

    move-result p1

    if-eqz p1, :cond_5

    iget-object p1, p0, Lcom/google/android/gms/analytics/Tracker;->Bt:Lcom/google/android/gms/analytics/ai;

    invoke-virtual {p1}, Lcom/google/android/gms/analytics/ai;->fh()Z

    move-result p1

    if-eqz p1, :cond_4

    const-string p1, "&aip"

    const-string v0, "1"

    invoke-virtual {p0, p1, v0}, Lcom/google/android/gms/analytics/Tracker;->set(Ljava/lang/String;Ljava/lang/String;)V

    const-string p1, "[Tracker] anonymize ip loaded: true"

    invoke-static {p1}, Lcom/google/android/gms/analytics/z;->V(Ljava/lang/String;)V

    :cond_4
    const-string p1, "[Tracker] anonymize ip loaded: false"

    invoke-static {p1}, Lcom/google/android/gms/analytics/z;->V(Ljava/lang/String;)V

    :cond_5
    iget-object p1, p0, Lcom/google/android/gms/analytics/Tracker;->Bt:Lcom/google/android/gms/analytics/ai;

    invoke-virtual {p1}, Lcom/google/android/gms/analytics/ai;->fi()Z

    move-result p1

    invoke-virtual {p0, p1}, Lcom/google/android/gms/analytics/Tracker;->enableExceptionReporting(Z)V

    return-void
.end method

.method eT()J
    .locals 2

    iget-object p0, p0, Lcom/google/android/gms/analytics/Tracker;->Bs:Lcom/google/android/gms/analytics/Tracker$a;

    invoke-virtual {p0}, Lcom/google/android/gms/analytics/Tracker$a;->eT()J

    move-result-wide v0

    return-wide v0
.end method

.method eU()Z
    .locals 0

    iget-object p0, p0, Lcom/google/android/gms/analytics/Tracker;->Bs:Lcom/google/android/gms/analytics/Tracker$a;

    invoke-virtual {p0}, Lcom/google/android/gms/analytics/Tracker$a;->eU()Z

    move-result p0

    return p0
.end method

.method public enableAdvertisingIdCollection(Z)V
    .locals 3

    const-string v0, "&adid"

    const-string v1, "&ate"

    if-nez p1, :cond_0

    iget-object p1, p0, Lcom/google/android/gms/analytics/Tracker;->qM:Ljava/util/Map;

    const/4 v2, 0x0

    invoke-interface {p1, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    iget-object p0, p0, Lcom/google/android/gms/analytics/Tracker;->qM:Ljava/util/Map;

    invoke-interface {p0, v0, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_0

    :cond_0
    iget-object p1, p0, Lcom/google/android/gms/analytics/Tracker;->qM:Ljava/util/Map;

    invoke-interface {p1, v1}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_1

    iget-object p1, p0, Lcom/google/android/gms/analytics/Tracker;->qM:Ljava/util/Map;

    invoke-interface {p1, v1}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    :cond_1
    iget-object p1, p0, Lcom/google/android/gms/analytics/Tracker;->qM:Ljava/util/Map;

    invoke-interface {p1, v0}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_2

    iget-object p0, p0, Lcom/google/android/gms/analytics/Tracker;->qM:Ljava/util/Map;

    invoke-interface {p0, v0}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    :cond_2
    :goto_0
    return-void
.end method

.method public enableAutoActivityTracking(Z)V
    .locals 0

    iget-object p0, p0, Lcom/google/android/gms/analytics/Tracker;->Bs:Lcom/google/android/gms/analytics/Tracker$a;

    invoke-virtual {p0, p1}, Lcom/google/android/gms/analytics/Tracker$a;->enableAutoActivityTracking(Z)V

    return-void
.end method

.method public enableExceptionReporting(Z)V
    .locals 2

    iget-boolean v0, p0, Lcom/google/android/gms/analytics/Tracker;->Br:Z

    if-ne v0, p1, :cond_0

    return-void

    :cond_0
    iput-boolean p1, p0, Lcom/google/android/gms/analytics/Tracker;->Br:Z

    if-eqz p1, :cond_1

    new-instance p1, Lcom/google/android/gms/analytics/ExceptionReporter;

    invoke-static {}, Ljava/lang/Thread;->getDefaultUncaughtExceptionHandler()Ljava/lang/Thread$UncaughtExceptionHandler;

    move-result-object v0

    iget-object v1, p0, Lcom/google/android/gms/analytics/Tracker;->mContext:Landroid/content/Context;

    invoke-direct {p1, p0, v0, v1}, Lcom/google/android/gms/analytics/ExceptionReporter;-><init>(Lcom/google/android/gms/analytics/Tracker;Ljava/lang/Thread$UncaughtExceptionHandler;Landroid/content/Context;)V

    iput-object p1, p0, Lcom/google/android/gms/analytics/Tracker;->Bu:Lcom/google/android/gms/analytics/ExceptionReporter;

    invoke-static {p1}, Ljava/lang/Thread;->setDefaultUncaughtExceptionHandler(Ljava/lang/Thread$UncaughtExceptionHandler;)V

    const-string p0, "Uncaught exceptions will be reported to Google Analytics."

    :goto_0
    invoke-static {p0}, Lcom/google/android/gms/analytics/z;->V(Ljava/lang/String;)V

    goto :goto_2

    :cond_1
    iget-object p0, p0, Lcom/google/android/gms/analytics/Tracker;->Bu:Lcom/google/android/gms/analytics/ExceptionReporter;

    if-eqz p0, :cond_2

    invoke-virtual {p0}, Lcom/google/android/gms/analytics/ExceptionReporter;->dY()Ljava/lang/Thread$UncaughtExceptionHandler;

    move-result-object p0

    goto :goto_1

    :cond_2
    const/4 p0, 0x0

    :goto_1
    invoke-static {p0}, Ljava/lang/Thread;->setDefaultUncaughtExceptionHandler(Ljava/lang/Thread$UncaughtExceptionHandler;)V

    const-string p0, "Uncaught exceptions will not be reported to Google Analytics."

    goto :goto_0

    :goto_2
    return-void
.end method

.method public get(Ljava/lang/String;)Ljava/lang/String;
    .locals 2

    invoke-static {}, Lcom/google/android/gms/analytics/t;->ep()Lcom/google/android/gms/analytics/t;

    move-result-object v0

    sget-object v1, Lcom/google/android/gms/analytics/t$a;->zo:Lcom/google/android/gms/analytics/t$a;

    invoke-virtual {v0, v1}, Lcom/google/android/gms/analytics/t;->a(Lcom/google/android/gms/analytics/t$a;)V

    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    const/4 v1, 0x0

    if-eqz v0, :cond_0

    return-object v1

    :cond_0
    iget-object v0, p0, Lcom/google/android/gms/analytics/Tracker;->qM:Ljava/util/Map;

    invoke-interface {v0, p1}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1

    iget-object p0, p0, Lcom/google/android/gms/analytics/Tracker;->qM:Ljava/util/Map;

    invoke-interface {p0, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Ljava/lang/String;

    return-object p0

    :cond_1
    const-string v0, "&ul"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_2

    invoke-static {}, Ljava/util/Locale;->getDefault()Ljava/util/Locale;

    move-result-object p0

    invoke-static {p0}, Lcom/google/android/gms/analytics/aj;->a(Ljava/util/Locale;)Ljava/lang/String;

    move-result-object p0

    return-object p0

    :cond_2
    iget-object v0, p0, Lcom/google/android/gms/analytics/Tracker;->Bo:Lcom/google/android/gms/analytics/h;

    if-eqz v0, :cond_3

    invoke-virtual {v0, p1}, Lcom/google/android/gms/analytics/h;->ac(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_3

    iget-object p0, p0, Lcom/google/android/gms/analytics/Tracker;->Bo:Lcom/google/android/gms/analytics/h;

    invoke-virtual {p0, p1}, Lcom/google/android/gms/analytics/h;->getValue(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    return-object p0

    :cond_3
    iget-object v0, p0, Lcom/google/android/gms/analytics/Tracker;->Bp:Lcom/google/android/gms/analytics/ad;

    if-eqz v0, :cond_4

    invoke-virtual {v0, p1}, Lcom/google/android/gms/analytics/ad;->ac(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_4

    iget-object p0, p0, Lcom/google/android/gms/analytics/Tracker;->Bp:Lcom/google/android/gms/analytics/ad;

    invoke-virtual {p0, p1}, Lcom/google/android/gms/analytics/ad;->getValue(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    return-object p0

    :cond_4
    iget-object v0, p0, Lcom/google/android/gms/analytics/Tracker;->Bq:Lcom/google/android/gms/analytics/g;

    if-eqz v0, :cond_5

    invoke-virtual {v0, p1}, Lcom/google/android/gms/analytics/g;->ac(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_5

    iget-object p0, p0, Lcom/google/android/gms/analytics/Tracker;->Bq:Lcom/google/android/gms/analytics/g;

    invoke-virtual {p0, p1}, Lcom/google/android/gms/analytics/g;->getValue(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    return-object p0

    :cond_5
    return-object v1
.end method

.method public send(Ljava/util/Map;)V
    .locals 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    invoke-static {}, Lcom/google/android/gms/analytics/t;->ep()Lcom/google/android/gms/analytics/t;

    move-result-object v0

    sget-object v1, Lcom/google/android/gms/analytics/t$a;->zq:Lcom/google/android/gms/analytics/t$a;

    invoke-virtual {v0, v1}, Lcom/google/android/gms/analytics/t;->a(Lcom/google/android/gms/analytics/t$a;)V

    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iget-object v1, p0, Lcom/google/android/gms/analytics/Tracker;->qM:Ljava/util/Map;

    invoke-interface {v0, v1}, Ljava/util/Map;->putAll(Ljava/util/Map;)V

    if-eqz p1, :cond_0

    invoke-interface {v0, p1}, Ljava/util/Map;->putAll(Ljava/util/Map;)V

    :cond_0
    const-string p1, "&tid"

    invoke-interface {v0, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/CharSequence;

    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    if-eqz v1, :cond_1

    const-string v1, "Missing tracking id (%s) parameter."

    filled-new-array {p1}, [Ljava/lang/Object;

    move-result-object p1

    invoke-static {v1, p1}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p1

    invoke-static {p1}, Lcom/google/android/gms/analytics/z;->W(Ljava/lang/String;)V

    :cond_1
    const-string p1, "&t"

    invoke-interface {v0, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v2

    if-eqz v2, :cond_2

    const-string v1, "Missing hit type (%s) parameter."

    filled-new-array {p1}, [Ljava/lang/Object;

    move-result-object p1

    invoke-static {v1, p1}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p1

    invoke-static {p1}, Lcom/google/android/gms/analytics/z;->W(Ljava/lang/String;)V

    const-string v1, ""

    :cond_2
    iget-object p1, p0, Lcom/google/android/gms/analytics/Tracker;->Bs:Lcom/google/android/gms/analytics/Tracker$a;

    invoke-virtual {p1}, Lcom/google/android/gms/analytics/Tracker$a;->eV()Z

    move-result p1

    if-eqz p1, :cond_3

    const-string p1, "&sc"

    const-string v2, "start"

    invoke-interface {v0, p1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    :cond_3
    invoke-virtual {v1}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object p1

    const-string v1, "screenview"

    invoke-virtual {v1, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_4

    const-string v1, "pageview"

    invoke-virtual {v1, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_4

    const-string v1, "appview"

    invoke-virtual {v1, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_4

    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    if-eqz v1, :cond_6

    :cond_4
    iget-object v1, p0, Lcom/google/android/gms/analytics/Tracker;->qM:Ljava/util/Map;

    const-string v2, "&a"

    invoke-interface {v1, v2}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    invoke-static {v1}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v1

    const/4 v3, 0x1

    add-int/2addr v1, v3

    const v4, 0x7fffffff

    if-lt v1, v4, :cond_5

    goto :goto_0

    :cond_5
    move v3, v1

    :goto_0
    iget-object v1, p0, Lcom/google/android/gms/analytics/Tracker;->qM:Ljava/util/Map;

    invoke-static {v3}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    move-result-object v3

    invoke-interface {v1, v2, v3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    :cond_6
    const-string v1, "transaction"

    invoke-virtual {p1, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_7

    const-string v1, "item"

    invoke-virtual {p1, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-nez p1, :cond_7

    iget-object p1, p0, Lcom/google/android/gms/analytics/Tracker;->Bn:Lcom/google/android/gms/analytics/ac;

    invoke-interface {p1}, Lcom/google/android/gms/analytics/ac;->eJ()Z

    move-result p1

    if-nez p1, :cond_7

    const-string p0, "Too many hits sent too quickly, rate limiting invoked."

    invoke-static {p0}, Lcom/google/android/gms/analytics/z;->W(Ljava/lang/String;)V

    goto :goto_1

    :cond_7
    iget-object p0, p0, Lcom/google/android/gms/analytics/Tracker;->Bm:Lcom/google/android/gms/analytics/TrackerHandler;

    invoke-virtual {p0, v0}, Lcom/google/android/gms/analytics/TrackerHandler;->u(Ljava/util/Map;)V

    :goto_1
    return-void
.end method

.method public set(Ljava/lang/String;Ljava/lang/String;)V
    .locals 2

    const-string v0, "Key should be non-null"

    invoke-static {p1, v0}, Lcom/google/android/gms/common/internal/o;->b(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    invoke-static {}, Lcom/google/android/gms/analytics/t;->ep()Lcom/google/android/gms/analytics/t;

    move-result-object v0

    sget-object v1, Lcom/google/android/gms/analytics/t$a;->zp:Lcom/google/android/gms/analytics/t$a;

    invoke-virtual {v0, v1}, Lcom/google/android/gms/analytics/t;->a(Lcom/google/android/gms/analytics/t$a;)V

    iget-object p0, p0, Lcom/google/android/gms/analytics/Tracker;->qM:Ljava/util/Map;

    invoke-interface {p0, p1, p2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    return-void
.end method

.method public setAnonymizeIp(Z)V
    .locals 1

    const-string v0, "&aip"

    invoke-static {p1}, Lcom/google/android/gms/analytics/aj;->C(Z)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p0, v0, p1}, Lcom/google/android/gms/analytics/Tracker;->set(Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method

.method public setAppId(Ljava/lang/String;)V
    .locals 1

    const-string v0, "&aid"

    invoke-virtual {p0, v0, p1}, Lcom/google/android/gms/analytics/Tracker;->set(Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method

.method public setAppInstallerId(Ljava/lang/String;)V
    .locals 1

    const-string v0, "&aiid"

    invoke-virtual {p0, v0, p1}, Lcom/google/android/gms/analytics/Tracker;->set(Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method

.method public setAppName(Ljava/lang/String;)V
    .locals 1

    const-string v0, "&an"

    invoke-virtual {p0, v0, p1}, Lcom/google/android/gms/analytics/Tracker;->set(Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method

.method public setAppVersion(Ljava/lang/String;)V
    .locals 1

    const-string v0, "&av"

    invoke-virtual {p0, v0, p1}, Lcom/google/android/gms/analytics/Tracker;->set(Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method

.method public setClientId(Ljava/lang/String;)V
    .locals 1

    const-string v0, "&cid"

    invoke-virtual {p0, v0, p1}, Lcom/google/android/gms/analytics/Tracker;->set(Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method

.method public setEncoding(Ljava/lang/String;)V
    .locals 1

    const-string v0, "&de"

    invoke-virtual {p0, v0, p1}, Lcom/google/android/gms/analytics/Tracker;->set(Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method

.method public setHostname(Ljava/lang/String;)V
    .locals 1

    const-string v0, "&dh"

    invoke-virtual {p0, v0, p1}, Lcom/google/android/gms/analytics/Tracker;->set(Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method

.method public setLanguage(Ljava/lang/String;)V
    .locals 1

    const-string v0, "&ul"

    invoke-virtual {p0, v0, p1}, Lcom/google/android/gms/analytics/Tracker;->set(Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method

.method public setLocation(Ljava/lang/String;)V
    .locals 1

    const-string v0, "&dl"

    invoke-virtual {p0, v0, p1}, Lcom/google/android/gms/analytics/Tracker;->set(Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method

.method public setPage(Ljava/lang/String;)V
    .locals 1

    const-string v0, "&dp"

    invoke-virtual {p0, v0, p1}, Lcom/google/android/gms/analytics/Tracker;->set(Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method

.method public setReferrer(Ljava/lang/String;)V
    .locals 1

    const-string v0, "&dr"

    invoke-virtual {p0, v0, p1}, Lcom/google/android/gms/analytics/Tracker;->set(Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method

.method public setSampleRate(D)V
    .locals 1

    const-string v0, "&sf"

    invoke-static {p1, p2}, Ljava/lang/Double;->toHexString(D)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p0, v0, p1}, Lcom/google/android/gms/analytics/Tracker;->set(Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method

.method public setScreenColors(Ljava/lang/String;)V
    .locals 1

    const-string v0, "&sd"

    invoke-virtual {p0, v0, p1}, Lcom/google/android/gms/analytics/Tracker;->set(Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method

.method public setScreenName(Ljava/lang/String;)V
    .locals 1

    const-string v0, "&cd"

    invoke-virtual {p0, v0, p1}, Lcom/google/android/gms/analytics/Tracker;->set(Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method

.method public setScreenResolution(II)V
    .locals 1

    if-gez p1, :cond_0

    if-gez p2, :cond_0

    const-string p0, "Invalid width or height. The values should be non-negative."

    invoke-static {p0}, Lcom/google/android/gms/analytics/z;->W(Ljava/lang/String;)V

    return-void

    :cond_0
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object p1

    const-string v0, "x"

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    const-string p2, "&sr"

    invoke-virtual {p0, p2, p1}, Lcom/google/android/gms/analytics/Tracker;->set(Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method

.method public setSessionTimeout(J)V
    .locals 2

    iget-object p0, p0, Lcom/google/android/gms/analytics/Tracker;->Bs:Lcom/google/android/gms/analytics/Tracker$a;

    const-wide/16 v0, 0x3e8

    mul-long/2addr p1, v0

    invoke-virtual {p0, p1, p2}, Lcom/google/android/gms/analytics/Tracker$a;->setSessionTimeout(J)V

    return-void
.end method

.method public setTitle(Ljava/lang/String;)V
    .locals 1

    const-string v0, "&dt"

    invoke-virtual {p0, v0, p1}, Lcom/google/android/gms/analytics/Tracker;->set(Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method

.method public setUseSecure(Z)V
    .locals 1

    const-string v0, "useSecure"

    invoke-static {p1}, Lcom/google/android/gms/analytics/aj;->C(Z)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p0, v0, p1}, Lcom/google/android/gms/analytics/Tracker;->set(Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method

.method public setViewportSize(Ljava/lang/String;)V
    .locals 1

    const-string v0, "&vp"

    invoke-virtual {p0, v0, p1}, Lcom/google/android/gms/analytics/Tracker;->set(Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method
