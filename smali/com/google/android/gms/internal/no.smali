.class public Lcom/google/android/gms/internal/no;
.super Lcom/google/android/gms/common/internal/e;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/google/android/gms/common/internal/e<",
        "Lcom/google/android/gms/internal/nh;",
        ">;"
    }
.end annotation


# instance fields
.field private final BZ:Ljava/lang/String;

.field private final akW:Lcom/google/android/gms/internal/nl;

.field private final akX:Lcom/google/android/gms/internal/nj;

.field private akY:Z

.field private final mw:Ljava/lang/Object;


# direct methods
.method public constructor <init>(Landroid/content/Context;Lcom/google/android/gms/internal/nl;)V
    .locals 1

    const/4 v0, 0x0

    new-array v0, v0, [Ljava/lang/String;

    invoke-direct {p0, p1, p2, p2, v0}, Lcom/google/android/gms/common/internal/e;-><init>(Landroid/content/Context;Lcom/google/android/gms/common/GooglePlayServicesClient$ConnectionCallbacks;Lcom/google/android/gms/common/GooglePlayServicesClient$OnConnectionFailedListener;[Ljava/lang/String;)V

    invoke-virtual {p1}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object p1

    iput-object p1, p0, Lcom/google/android/gms/internal/no;->BZ:Ljava/lang/String;

    invoke-static {p2}, Lcom/google/android/gms/common/internal/o;->i(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lcom/google/android/gms/internal/nl;

    iput-object p1, p0, Lcom/google/android/gms/internal/no;->akW:Lcom/google/android/gms/internal/nl;

    invoke-virtual {p1, p0}, Lcom/google/android/gms/internal/nl;->a(Lcom/google/android/gms/internal/no;)V

    new-instance p1, Lcom/google/android/gms/internal/nj;

    invoke-direct {p1}, Lcom/google/android/gms/internal/nj;-><init>()V

    iput-object p1, p0, Lcom/google/android/gms/internal/no;->akX:Lcom/google/android/gms/internal/nj;

    new-instance p1, Ljava/lang/Object;

    invoke-direct {p1}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/google/android/gms/internal/no;->mw:Ljava/lang/Object;

    const/4 p1, 0x1

    iput-boolean p1, p0, Lcom/google/android/gms/internal/no;->akY:Z

    return-void
.end method

.method private c(Lcom/google/android/gms/internal/nm;Lcom/google/android/gms/internal/ni;)V
    .locals 0

    iget-object p0, p0, Lcom/google/android/gms/internal/no;->akX:Lcom/google/android/gms/internal/nj;

    invoke-virtual {p0, p1, p2}, Lcom/google/android/gms/internal/nj;->a(Lcom/google/android/gms/internal/nm;Lcom/google/android/gms/internal/ni;)V

    return-void
.end method

.method private d(Lcom/google/android/gms/internal/nm;Lcom/google/android/gms/internal/ni;)V
    .locals 3

    const-string v0, "PlayLoggerImpl"

    :try_start_0
    invoke-direct {p0}, Lcom/google/android/gms/internal/no;->mY()V

    invoke-virtual {p0}, Lcom/google/android/gms/internal/no;->gS()Landroid/os/IInterface;

    move-result-object v1

    check-cast v1, Lcom/google/android/gms/internal/nh;

    iget-object v2, p0, Lcom/google/android/gms/internal/no;->BZ:Ljava/lang/String;

    invoke-interface {v1, v2, p1, p2}, Lcom/google/android/gms/internal/nh;->a(Ljava/lang/String;Lcom/google/android/gms/internal/nm;Lcom/google/android/gms/internal/ni;)V
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/lang/IllegalStateException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_1

    :catch_0
    const-string v1, "Service was disconnected.  Will try caching."

    goto :goto_0

    :catch_1
    const-string v1, "Couldn\'t send log event.  Will try caching."

    :goto_0
    invoke-static {v0, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    invoke-direct {p0, p1, p2}, Lcom/google/android/gms/internal/no;->c(Lcom/google/android/gms/internal/nm;Lcom/google/android/gms/internal/ni;)V

    :goto_1
    return-void
.end method

.method private mY()V
    .locals 7

    iget-boolean v0, p0, Lcom/google/android/gms/internal/no;->akY:Z

    xor-int/lit8 v0, v0, 0x1

    invoke-static {v0}, Lcom/google/android/gms/common/internal/a;->I(Z)V

    iget-object v0, p0, Lcom/google/android/gms/internal/no;->akX:Lcom/google/android/gms/internal/nj;

    invoke-virtual {v0}, Lcom/google/android/gms/internal/nj;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_5

    :try_start_0
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iget-object v1, p0, Lcom/google/android/gms/internal/no;->akX:Lcom/google/android/gms/internal/nj;

    invoke-virtual {v1}, Lcom/google/android/gms/internal/nj;->mW()Ljava/util/ArrayList;

    move-result-object v1

    invoke-virtual {v1}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v1

    const/4 v2, 0x0

    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_3

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/google/android/gms/internal/nj$a;

    iget-object v4, v3, Lcom/google/android/gms/internal/nj$a;->akO:Lcom/google/android/gms/internal/pr$c;

    if-eqz v4, :cond_0

    invoke-virtual {p0}, Lcom/google/android/gms/internal/no;->gS()Landroid/os/IInterface;

    move-result-object v4

    check-cast v4, Lcom/google/android/gms/internal/nh;

    iget-object v5, p0, Lcom/google/android/gms/internal/no;->BZ:Ljava/lang/String;

    iget-object v6, v3, Lcom/google/android/gms/internal/nj$a;->akM:Lcom/google/android/gms/internal/nm;

    iget-object v3, v3, Lcom/google/android/gms/internal/nj$a;->akO:Lcom/google/android/gms/internal/pr$c;

    invoke-static {v3}, Lcom/google/android/gms/internal/pn;->f(Lcom/google/android/gms/internal/pn;)[B

    move-result-object v3

    invoke-interface {v4, v5, v6, v3}, Lcom/google/android/gms/internal/nh;->a(Ljava/lang/String;Lcom/google/android/gms/internal/nm;[B)V

    goto :goto_0

    :cond_0
    iget-object v4, v3, Lcom/google/android/gms/internal/nj$a;->akM:Lcom/google/android/gms/internal/nm;

    invoke-virtual {v4, v2}, Lcom/google/android/gms/internal/nm;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_1

    :goto_1
    iget-object v3, v3, Lcom/google/android/gms/internal/nj$a;->akN:Lcom/google/android/gms/internal/ni;

    invoke-virtual {v0, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_0

    :cond_1
    invoke-virtual {v0}, Ljava/util/ArrayList;->isEmpty()Z

    move-result v4

    if-nez v4, :cond_2

    invoke-virtual {p0}, Lcom/google/android/gms/internal/no;->gS()Landroid/os/IInterface;

    move-result-object v4

    check-cast v4, Lcom/google/android/gms/internal/nh;

    iget-object v5, p0, Lcom/google/android/gms/internal/no;->BZ:Ljava/lang/String;

    invoke-interface {v4, v5, v2, v0}, Lcom/google/android/gms/internal/nh;->a(Ljava/lang/String;Lcom/google/android/gms/internal/nm;Ljava/util/List;)V

    invoke-virtual {v0}, Ljava/util/ArrayList;->clear()V

    :cond_2
    iget-object v2, v3, Lcom/google/android/gms/internal/nj$a;->akM:Lcom/google/android/gms/internal/nm;

    goto :goto_1

    :cond_3
    invoke-virtual {v0}, Ljava/util/ArrayList;->isEmpty()Z

    move-result v1

    if-nez v1, :cond_4

    invoke-virtual {p0}, Lcom/google/android/gms/internal/no;->gS()Landroid/os/IInterface;

    move-result-object v1

    check-cast v1, Lcom/google/android/gms/internal/nh;

    iget-object v3, p0, Lcom/google/android/gms/internal/no;->BZ:Ljava/lang/String;

    invoke-interface {v1, v3, v2, v0}, Lcom/google/android/gms/internal/nh;->a(Ljava/lang/String;Lcom/google/android/gms/internal/nm;Ljava/util/List;)V

    :cond_4
    iget-object p0, p0, Lcom/google/android/gms/internal/no;->akX:Lcom/google/android/gms/internal/nj;

    invoke-virtual {p0}, Lcom/google/android/gms/internal/nj;->clear()V
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_2

    :catch_0
    const-string p0, "PlayLoggerImpl"

    const-string v0, "Couldn\'t send cached log events to AndroidLog service.  Retaining in memory cache."

    invoke-static {p0, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    :cond_5
    :goto_2
    return-void
.end method


# virtual methods
.method S(Z)V
    .locals 2

    iget-object v0, p0, Lcom/google/android/gms/internal/no;->mw:Ljava/lang/Object;

    monitor-enter v0

    :try_start_0
    iget-boolean v1, p0, Lcom/google/android/gms/internal/no;->akY:Z

    iput-boolean p1, p0, Lcom/google/android/gms/internal/no;->akY:Z

    if-eqz v1, :cond_0

    if-nez p1, :cond_0

    invoke-direct {p0}, Lcom/google/android/gms/internal/no;->mY()V

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

.method protected a(Lcom/google/android/gms/common/internal/l;Lcom/google/android/gms/common/internal/e$e;)V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/os/RemoteException;
        }
    .end annotation

    new-instance v0, Landroid/os/Bundle;

    invoke-direct {v0}, Landroid/os/Bundle;-><init>()V

    invoke-virtual {p0}, Lcom/google/android/gms/internal/no;->getContext()Landroid/content/Context;

    move-result-object p0

    invoke-virtual {p0}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object p0

    const v1, 0x5e2978

    invoke-interface {p1, p2, v1, p0, v0}, Lcom/google/android/gms/common/internal/l;->f(Lcom/google/android/gms/common/internal/k;ILjava/lang/String;Landroid/os/Bundle;)V

    return-void
.end method

.method public b(Lcom/google/android/gms/internal/nm;Lcom/google/android/gms/internal/ni;)V
    .locals 2

    iget-object v0, p0, Lcom/google/android/gms/internal/no;->mw:Ljava/lang/Object;

    monitor-enter v0

    :try_start_0
    iget-boolean v1, p0, Lcom/google/android/gms/internal/no;->akY:Z

    if-eqz v1, :cond_0

    invoke-direct {p0, p1, p2}, Lcom/google/android/gms/internal/no;->c(Lcom/google/android/gms/internal/nm;Lcom/google/android/gms/internal/ni;)V

    goto :goto_0

    :cond_0
    invoke-direct {p0, p1, p2}, Lcom/google/android/gms/internal/no;->d(Lcom/google/android/gms/internal/nm;Lcom/google/android/gms/internal/ni;)V

    :goto_0
    monitor-exit v0

    return-void

    :catchall_0
    move-exception p0

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw p0
.end method

.method protected bD(Landroid/os/IBinder;)Lcom/google/android/gms/internal/nh;
    .locals 0

    invoke-static {p1}, Lcom/google/android/gms/internal/nh$a;->bC(Landroid/os/IBinder;)Lcom/google/android/gms/internal/nh;

    move-result-object p0

    return-object p0
.end method

.method protected getServiceDescriptor()Ljava/lang/String;
    .locals 0

    const-string p0, "com.google.android.gms.playlog.internal.IPlayLogService"

    return-object p0
.end method

.method protected getStartServiceAction()Ljava/lang/String;
    .locals 0

    const-string p0, "com.google.android.gms.playlog.service.START"

    return-object p0
.end method

.method protected synthetic j(Landroid/os/IBinder;)Landroid/os/IInterface;
    .locals 0

    invoke-virtual {p0, p1}, Lcom/google/android/gms/internal/no;->bD(Landroid/os/IBinder;)Lcom/google/android/gms/internal/nh;

    move-result-object p0

    return-object p0
.end method

.method public start()V
    .locals 3

    iget-object v0, p0, Lcom/google/android/gms/internal/no;->mw:Ljava/lang/Object;

    monitor-enter v0

    :try_start_0
    invoke-virtual {p0}, Lcom/google/android/gms/internal/no;->isConnecting()Z

    move-result v1

    if-nez v1, :cond_1

    invoke-virtual {p0}, Lcom/google/android/gms/internal/no;->isConnected()Z

    move-result v1

    if-eqz v1, :cond_0

    goto :goto_0

    :cond_0
    iget-object v1, p0, Lcom/google/android/gms/internal/no;->akW:Lcom/google/android/gms/internal/nl;

    const/4 v2, 0x1

    invoke-virtual {v1, v2}, Lcom/google/android/gms/internal/nl;->R(Z)V

    invoke-virtual {p0}, Lcom/google/android/gms/internal/no;->connect()V

    monitor-exit v0

    return-void

    :cond_1
    :goto_0
    monitor-exit v0

    return-void

    :catchall_0
    move-exception p0

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw p0
.end method

.method public stop()V
    .locals 3

    iget-object v0, p0, Lcom/google/android/gms/internal/no;->mw:Ljava/lang/Object;

    monitor-enter v0

    :try_start_0
    iget-object v1, p0, Lcom/google/android/gms/internal/no;->akW:Lcom/google/android/gms/internal/nl;

    const/4 v2, 0x0

    invoke-virtual {v1, v2}, Lcom/google/android/gms/internal/nl;->R(Z)V

    invoke-virtual {p0}, Lcom/google/android/gms/internal/no;->disconnect()V

    monitor-exit v0

    return-void

    :catchall_0
    move-exception p0

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw p0
.end method
