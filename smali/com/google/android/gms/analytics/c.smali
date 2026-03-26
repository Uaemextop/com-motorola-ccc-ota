.class Lcom/google/android/gms/analytics/c;
.super Ljava/lang/Object;

# interfaces
.implements Lcom/google/android/gms/analytics/b;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/google/android/gms/analytics/c$c;,
        Lcom/google/android/gms/analytics/c$b;,
        Lcom/google/android/gms/analytics/c$a;
    }
.end annotation


# instance fields
.field private mContext:Landroid/content/Context;

.field private xG:Landroid/content/ServiceConnection;

.field private xH:Lcom/google/android/gms/analytics/c$b;

.field private xI:Lcom/google/android/gms/analytics/c$c;

.field private xJ:Lcom/google/android/gms/internal/hc;


# direct methods
.method public constructor <init>(Landroid/content/Context;Lcom/google/android/gms/analytics/c$b;Lcom/google/android/gms/analytics/c$c;)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/google/android/gms/analytics/c;->mContext:Landroid/content/Context;

    if-eqz p2, :cond_1

    iput-object p2, p0, Lcom/google/android/gms/analytics/c;->xH:Lcom/google/android/gms/analytics/c$b;

    if-eqz p3, :cond_0

    iput-object p3, p0, Lcom/google/android/gms/analytics/c;->xI:Lcom/google/android/gms/analytics/c$c;

    return-void

    :cond_0
    new-instance p0, Ljava/lang/IllegalArgumentException;

    const-string p1, "onConnectionFailedListener cannot be null"

    invoke-direct {p0, p1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p0

    :cond_1
    new-instance p0, Ljava/lang/IllegalArgumentException;

    const-string p1, "onConnectedListener cannot be null"

    invoke-direct {p0, p1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p0
.end method

.method static synthetic a(Lcom/google/android/gms/analytics/c;Landroid/content/ServiceConnection;)Landroid/content/ServiceConnection;
    .locals 0

    iput-object p1, p0, Lcom/google/android/gms/analytics/c;->xG:Landroid/content/ServiceConnection;

    return-object p1
.end method

.method static synthetic a(Lcom/google/android/gms/analytics/c;Lcom/google/android/gms/internal/hc;)Lcom/google/android/gms/internal/hc;
    .locals 0

    iput-object p1, p0, Lcom/google/android/gms/analytics/c;->xJ:Lcom/google/android/gms/internal/hc;

    return-object p1
.end method

.method static synthetic a(Lcom/google/android/gms/analytics/c;)V
    .locals 0

    invoke-direct {p0}, Lcom/google/android/gms/analytics/c;->dK()V

    return-void
.end method

.method static synthetic b(Lcom/google/android/gms/analytics/c;)Landroid/content/Context;
    .locals 0

    iget-object p0, p0, Lcom/google/android/gms/analytics/c;->mContext:Landroid/content/Context;

    return-object p0
.end method

.method static synthetic c(Lcom/google/android/gms/analytics/c;)Lcom/google/android/gms/analytics/c$c;
    .locals 0

    iget-object p0, p0, Lcom/google/android/gms/analytics/c;->xI:Lcom/google/android/gms/analytics/c$c;

    return-object p0
.end method

.method static synthetic d(Lcom/google/android/gms/analytics/c;)Lcom/google/android/gms/analytics/c$b;
    .locals 0

    iget-object p0, p0, Lcom/google/android/gms/analytics/c;->xH:Lcom/google/android/gms/analytics/c$b;

    return-object p0
.end method

.method private dI()Lcom/google/android/gms/internal/hc;
    .locals 0

    invoke-virtual {p0}, Lcom/google/android/gms/analytics/c;->dJ()V

    iget-object p0, p0, Lcom/google/android/gms/analytics/c;->xJ:Lcom/google/android/gms/internal/hc;

    return-object p0
.end method

.method private dK()V
    .locals 0

    invoke-direct {p0}, Lcom/google/android/gms/analytics/c;->dL()V

    return-void
.end method

.method private dL()V
    .locals 0

    iget-object p0, p0, Lcom/google/android/gms/analytics/c;->xH:Lcom/google/android/gms/analytics/c$b;

    invoke-interface {p0}, Lcom/google/android/gms/analytics/c$b;->onConnected()V

    return-void
.end method


# virtual methods
.method public a(Ljava/util/Map;JLjava/lang/String;Ljava/util/List;)V
    .locals 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;J",
            "Ljava/lang/String;",
            "Ljava/util/List<",
            "Lcom/google/android/gms/internal/hb;",
            ">;)V"
        }
    .end annotation

    :try_start_0
    invoke-direct {p0}, Lcom/google/android/gms/analytics/c;->dI()Lcom/google/android/gms/internal/hc;

    move-result-object v0

    move-object v1, p1

    move-wide v2, p2

    move-object v4, p4

    move-object v5, p5

    invoke-interface/range {v0 .. v5}, Lcom/google/android/gms/internal/hc;->a(Ljava/util/Map;JLjava/lang/String;Ljava/util/List;)V
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception p0

    new-instance p1, Ljava/lang/StringBuilder;

    const-string p2, "sendHit failed: "

    invoke-direct {p1, p2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-static {p0}, Lcom/google/android/gms/analytics/z;->T(Ljava/lang/String;)V

    :goto_0
    return-void
.end method

.method public connect()V
    .locals 4

    new-instance v0, Landroid/content/Intent;

    const-string v1, "com.google.android.gms.analytics.service.START"

    invoke-direct {v0, v1}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    new-instance v1, Landroid/content/ComponentName;

    const-string v2, "com.google.android.gms"

    const-string v3, "com.google.android.gms.analytics.service.AnalyticsService"

    invoke-direct {v1, v2, v3}, Landroid/content/ComponentName;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v0, v1}, Landroid/content/Intent;->setComponent(Landroid/content/ComponentName;)Landroid/content/Intent;

    iget-object v1, p0, Lcom/google/android/gms/analytics/c;->mContext:Landroid/content/Context;

    invoke-virtual {v1}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v1

    const-string v2, "app_package_name"

    invoke-virtual {v0, v2, v1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    iget-object v1, p0, Lcom/google/android/gms/analytics/c;->xG:Landroid/content/ServiceConnection;

    if-eqz v1, :cond_0

    const-string p0, "Calling connect() while still connected, missing disconnect()."

    invoke-static {p0}, Lcom/google/android/gms/analytics/z;->T(Ljava/lang/String;)V

    return-void

    :cond_0
    new-instance v1, Lcom/google/android/gms/analytics/c$a;

    invoke-direct {v1, p0}, Lcom/google/android/gms/analytics/c$a;-><init>(Lcom/google/android/gms/analytics/c;)V

    iput-object v1, p0, Lcom/google/android/gms/analytics/c;->xG:Landroid/content/ServiceConnection;

    iget-object v2, p0, Lcom/google/android/gms/analytics/c;->mContext:Landroid/content/Context;

    const/16 v3, 0x81

    invoke-virtual {v2, v0, v1, v3}, Landroid/content/Context;->bindService(Landroid/content/Intent;Landroid/content/ServiceConnection;I)Z

    move-result v1

    new-instance v2, Ljava/lang/StringBuilder;

    const-string v3, "connect: bindService returned "

    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, " for "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/google/android/gms/analytics/z;->V(Ljava/lang/String;)V

    if-nez v1, :cond_1

    const/4 v0, 0x0

    iput-object v0, p0, Lcom/google/android/gms/analytics/c;->xG:Landroid/content/ServiceConnection;

    iget-object p0, p0, Lcom/google/android/gms/analytics/c;->xI:Lcom/google/android/gms/analytics/c$c;

    const/4 v1, 0x1

    invoke-interface {p0, v1, v0}, Lcom/google/android/gms/analytics/c$c;->a(ILandroid/content/Intent;)V

    :cond_1
    return-void
.end method

.method public dH()V
    .locals 2

    :try_start_0
    invoke-direct {p0}, Lcom/google/android/gms/analytics/c;->dI()Lcom/google/android/gms/internal/hc;

    move-result-object p0

    invoke-interface {p0}, Lcom/google/android/gms/internal/hc;->dH()V
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception p0

    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "clear hits failed: "

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-static {p0}, Lcom/google/android/gms/analytics/z;->T(Ljava/lang/String;)V

    :goto_0
    return-void
.end method

.method protected dJ()V
    .locals 1

    invoke-virtual {p0}, Lcom/google/android/gms/analytics/c;->isConnected()Z

    move-result p0

    if-eqz p0, :cond_0

    return-void

    :cond_0
    new-instance p0, Ljava/lang/IllegalStateException;

    const-string v0, "Not connected. Call connect() and wait for onConnected() to be called."

    invoke-direct {p0, v0}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw p0
.end method

.method public disconnect()V
    .locals 3

    const/4 v0, 0x0

    iput-object v0, p0, Lcom/google/android/gms/analytics/c;->xJ:Lcom/google/android/gms/internal/hc;

    iget-object v1, p0, Lcom/google/android/gms/analytics/c;->xG:Landroid/content/ServiceConnection;

    if-eqz v1, :cond_0

    :try_start_0
    iget-object v2, p0, Lcom/google/android/gms/analytics/c;->mContext:Landroid/content/Context;

    invoke-virtual {v2, v1}, Landroid/content/Context;->unbindService(Landroid/content/ServiceConnection;)V
    :try_end_0
    .catch Ljava/lang/IllegalStateException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/lang/IllegalArgumentException; {:try_start_0 .. :try_end_0} :catch_0

    :catch_0
    iput-object v0, p0, Lcom/google/android/gms/analytics/c;->xG:Landroid/content/ServiceConnection;

    iget-object p0, p0, Lcom/google/android/gms/analytics/c;->xH:Lcom/google/android/gms/analytics/c$b;

    invoke-interface {p0}, Lcom/google/android/gms/analytics/c$b;->onDisconnected()V

    :cond_0
    return-void
.end method

.method public isConnected()Z
    .locals 0

    iget-object p0, p0, Lcom/google/android/gms/analytics/c;->xJ:Lcom/google/android/gms/internal/hc;

    if-eqz p0, :cond_0

    const/4 p0, 0x1

    goto :goto_0

    :cond_0
    const/4 p0, 0x0

    :goto_0
    return p0
.end method
