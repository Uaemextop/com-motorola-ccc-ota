.class Lcom/google/android/gms/tagmanager/n;
.super Ljava/lang/Object;

# interfaces
.implements Lcom/google/android/gms/tagmanager/ContainerHolder;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/google/android/gms/tagmanager/n$b;,
        Lcom/google/android/gms/tagmanager/n$a;
    }
.end annotation


# instance fields
.field private CM:Lcom/google/android/gms/common/api/Status;

.field private final IH:Landroid/os/Looper;

.field private NU:Z

.field private aok:Lcom/google/android/gms/tagmanager/Container;

.field private aol:Lcom/google/android/gms/tagmanager/Container;

.field private aom:Lcom/google/android/gms/tagmanager/n$b;

.field private aon:Lcom/google/android/gms/tagmanager/n$a;

.field private aoo:Lcom/google/android/gms/tagmanager/TagManager;


# direct methods
.method public constructor <init>(Lcom/google/android/gms/common/api/Status;)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/google/android/gms/tagmanager/n;->CM:Lcom/google/android/gms/common/api/Status;

    const/4 p1, 0x0

    iput-object p1, p0, Lcom/google/android/gms/tagmanager/n;->IH:Landroid/os/Looper;

    return-void
.end method

.method public constructor <init>(Lcom/google/android/gms/tagmanager/TagManager;Landroid/os/Looper;Lcom/google/android/gms/tagmanager/Container;Lcom/google/android/gms/tagmanager/n$a;)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/google/android/gms/tagmanager/n;->aoo:Lcom/google/android/gms/tagmanager/TagManager;

    if-eqz p2, :cond_0

    goto :goto_0

    :cond_0
    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    move-result-object p2

    :goto_0
    iput-object p2, p0, Lcom/google/android/gms/tagmanager/n;->IH:Landroid/os/Looper;

    iput-object p3, p0, Lcom/google/android/gms/tagmanager/n;->aok:Lcom/google/android/gms/tagmanager/Container;

    iput-object p4, p0, Lcom/google/android/gms/tagmanager/n;->aon:Lcom/google/android/gms/tagmanager/n$a;

    sget-object p2, Lcom/google/android/gms/common/api/Status;->Jv:Lcom/google/android/gms/common/api/Status;

    iput-object p2, p0, Lcom/google/android/gms/tagmanager/n;->CM:Lcom/google/android/gms/common/api/Status;

    invoke-virtual {p1, p0}, Lcom/google/android/gms/tagmanager/TagManager;->a(Lcom/google/android/gms/tagmanager/n;)V

    return-void
.end method

.method private nV()V
    .locals 1

    iget-object v0, p0, Lcom/google/android/gms/tagmanager/n;->aom:Lcom/google/android/gms/tagmanager/n$b;

    if-eqz v0, :cond_0

    iget-object p0, p0, Lcom/google/android/gms/tagmanager/n;->aol:Lcom/google/android/gms/tagmanager/Container;

    invoke-virtual {p0}, Lcom/google/android/gms/tagmanager/Container;->nS()Ljava/lang/String;

    move-result-object p0

    invoke-virtual {v0, p0}, Lcom/google/android/gms/tagmanager/n$b;->cs(Ljava/lang/String;)V

    :cond_0
    return-void
.end method


# virtual methods
.method public declared-synchronized a(Lcom/google/android/gms/tagmanager/Container;)V
    .locals 1

    monitor-enter p0

    :try_start_0
    iget-boolean v0, p0, Lcom/google/android/gms/tagmanager/n;->NU:Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    if-eqz v0, :cond_0

    monitor-exit p0

    return-void

    :cond_0
    if-nez p1, :cond_1

    :try_start_1
    const-string p1, "Unexpected null container."

    invoke-static {p1}, Lcom/google/android/gms/tagmanager/bh;->T(Ljava/lang/String;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    monitor-exit p0

    return-void

    :cond_1
    :try_start_2
    iput-object p1, p0, Lcom/google/android/gms/tagmanager/n;->aol:Lcom/google/android/gms/tagmanager/Container;

    invoke-direct {p0}, Lcom/google/android/gms/tagmanager/n;->nV()V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    monitor-exit p0

    return-void

    :catchall_0
    move-exception p1

    monitor-exit p0

    throw p1
.end method

.method public declared-synchronized cp(Ljava/lang/String;)V
    .locals 1

    monitor-enter p0

    :try_start_0
    iget-boolean v0, p0, Lcom/google/android/gms/tagmanager/n;->NU:Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    if-eqz v0, :cond_0

    monitor-exit p0

    return-void

    :cond_0
    :try_start_1
    iget-object v0, p0, Lcom/google/android/gms/tagmanager/n;->aok:Lcom/google/android/gms/tagmanager/Container;

    invoke-virtual {v0, p1}, Lcom/google/android/gms/tagmanager/Container;->cp(Ljava/lang/String;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    monitor-exit p0

    return-void

    :catchall_0
    move-exception p1

    monitor-exit p0

    throw p1
.end method

.method cr(Ljava/lang/String;)V
    .locals 1

    iget-boolean v0, p0, Lcom/google/android/gms/tagmanager/n;->NU:Z

    if-eqz v0, :cond_0

    const-string p0, "setCtfeUrlPathAndQuery called on a released ContainerHolder."

    invoke-static {p0}, Lcom/google/android/gms/tagmanager/bh;->T(Ljava/lang/String;)V

    return-void

    :cond_0
    iget-object p0, p0, Lcom/google/android/gms/tagmanager/n;->aon:Lcom/google/android/gms/tagmanager/n$a;

    invoke-interface {p0, p1}, Lcom/google/android/gms/tagmanager/n$a;->cr(Ljava/lang/String;)V

    return-void
.end method

.method public declared-synchronized getContainer()Lcom/google/android/gms/tagmanager/Container;
    .locals 2

    monitor-enter p0

    :try_start_0
    iget-boolean v0, p0, Lcom/google/android/gms/tagmanager/n;->NU:Z

    const/4 v1, 0x0

    if-eqz v0, :cond_0

    const-string v0, "ContainerHolder is released."

    invoke-static {v0}, Lcom/google/android/gms/tagmanager/bh;->T(Ljava/lang/String;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit p0

    return-object v1

    :cond_0
    :try_start_1
    iget-object v0, p0, Lcom/google/android/gms/tagmanager/n;->aol:Lcom/google/android/gms/tagmanager/Container;

    if-eqz v0, :cond_1

    iput-object v0, p0, Lcom/google/android/gms/tagmanager/n;->aok:Lcom/google/android/gms/tagmanager/Container;

    iput-object v1, p0, Lcom/google/android/gms/tagmanager/n;->aol:Lcom/google/android/gms/tagmanager/Container;

    :cond_1
    iget-object v0, p0, Lcom/google/android/gms/tagmanager/n;->aok:Lcom/google/android/gms/tagmanager/Container;
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    monitor-exit p0

    return-object v0

    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method getContainerId()Ljava/lang/String;
    .locals 1

    iget-boolean v0, p0, Lcom/google/android/gms/tagmanager/n;->NU:Z

    if-eqz v0, :cond_0

    const-string p0, "getContainerId called on a released ContainerHolder."

    invoke-static {p0}, Lcom/google/android/gms/tagmanager/bh;->T(Ljava/lang/String;)V

    const-string p0, ""

    return-object p0

    :cond_0
    iget-object p0, p0, Lcom/google/android/gms/tagmanager/n;->aok:Lcom/google/android/gms/tagmanager/Container;

    invoke-virtual {p0}, Lcom/google/android/gms/tagmanager/Container;->getContainerId()Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method public getStatus()Lcom/google/android/gms/common/api/Status;
    .locals 0

    iget-object p0, p0, Lcom/google/android/gms/tagmanager/n;->CM:Lcom/google/android/gms/common/api/Status;

    return-object p0
.end method

.method nU()Ljava/lang/String;
    .locals 1

    iget-boolean v0, p0, Lcom/google/android/gms/tagmanager/n;->NU:Z

    if-eqz v0, :cond_0

    const-string p0, "setCtfeUrlPathAndQuery called on a released ContainerHolder."

    invoke-static {p0}, Lcom/google/android/gms/tagmanager/bh;->T(Ljava/lang/String;)V

    const-string p0, ""

    return-object p0

    :cond_0
    iget-object p0, p0, Lcom/google/android/gms/tagmanager/n;->aon:Lcom/google/android/gms/tagmanager/n$a;

    invoke-interface {p0}, Lcom/google/android/gms/tagmanager/n$a;->nU()Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method public declared-synchronized refresh()V
    .locals 1

    monitor-enter p0

    :try_start_0
    iget-boolean v0, p0, Lcom/google/android/gms/tagmanager/n;->NU:Z

    if-eqz v0, :cond_0

    const-string v0, "Refreshing a released ContainerHolder."

    invoke-static {v0}, Lcom/google/android/gms/tagmanager/bh;->T(Ljava/lang/String;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit p0

    return-void

    :cond_0
    :try_start_1
    iget-object v0, p0, Lcom/google/android/gms/tagmanager/n;->aon:Lcom/google/android/gms/tagmanager/n$a;

    invoke-interface {v0}, Lcom/google/android/gms/tagmanager/n$a;->nW()V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    monitor-exit p0

    return-void

    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized release()V
    .locals 1

    monitor-enter p0

    :try_start_0
    iget-boolean v0, p0, Lcom/google/android/gms/tagmanager/n;->NU:Z

    if-eqz v0, :cond_0

    const-string v0, "Releasing a released ContainerHolder."

    invoke-static {v0}, Lcom/google/android/gms/tagmanager/bh;->T(Ljava/lang/String;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit p0

    return-void

    :cond_0
    const/4 v0, 0x1

    :try_start_1
    iput-boolean v0, p0, Lcom/google/android/gms/tagmanager/n;->NU:Z

    iget-object v0, p0, Lcom/google/android/gms/tagmanager/n;->aoo:Lcom/google/android/gms/tagmanager/TagManager;

    invoke-virtual {v0, p0}, Lcom/google/android/gms/tagmanager/TagManager;->b(Lcom/google/android/gms/tagmanager/n;)Z

    iget-object v0, p0, Lcom/google/android/gms/tagmanager/n;->aok:Lcom/google/android/gms/tagmanager/Container;

    invoke-virtual {v0}, Lcom/google/android/gms/tagmanager/Container;->release()V

    const/4 v0, 0x0

    iput-object v0, p0, Lcom/google/android/gms/tagmanager/n;->aok:Lcom/google/android/gms/tagmanager/Container;

    iput-object v0, p0, Lcom/google/android/gms/tagmanager/n;->aol:Lcom/google/android/gms/tagmanager/Container;

    iput-object v0, p0, Lcom/google/android/gms/tagmanager/n;->aon:Lcom/google/android/gms/tagmanager/n$a;

    iput-object v0, p0, Lcom/google/android/gms/tagmanager/n;->aom:Lcom/google/android/gms/tagmanager/n$b;
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    monitor-exit p0

    return-void

    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized setContainerAvailableListener(Lcom/google/android/gms/tagmanager/ContainerHolder$ContainerAvailableListener;)V
    .locals 2

    monitor-enter p0

    :try_start_0
    iget-boolean v0, p0, Lcom/google/android/gms/tagmanager/n;->NU:Z

    if-eqz v0, :cond_0

    const-string p1, "ContainerHolder is released."

    invoke-static {p1}, Lcom/google/android/gms/tagmanager/bh;->T(Ljava/lang/String;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit p0

    return-void

    :cond_0
    if-nez p1, :cond_1

    const/4 p1, 0x0

    :try_start_1
    iput-object p1, p0, Lcom/google/android/gms/tagmanager/n;->aom:Lcom/google/android/gms/tagmanager/n$b;

    goto :goto_0

    :cond_1
    new-instance v0, Lcom/google/android/gms/tagmanager/n$b;

    iget-object v1, p0, Lcom/google/android/gms/tagmanager/n;->IH:Landroid/os/Looper;

    invoke-direct {v0, p0, p1, v1}, Lcom/google/android/gms/tagmanager/n$b;-><init>(Lcom/google/android/gms/tagmanager/n;Lcom/google/android/gms/tagmanager/ContainerHolder$ContainerAvailableListener;Landroid/os/Looper;)V

    iput-object v0, p0, Lcom/google/android/gms/tagmanager/n;->aom:Lcom/google/android/gms/tagmanager/n$b;

    iget-object p1, p0, Lcom/google/android/gms/tagmanager/n;->aol:Lcom/google/android/gms/tagmanager/Container;

    if-eqz p1, :cond_2

    invoke-direct {p0}, Lcom/google/android/gms/tagmanager/n;->nV()V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    :cond_2
    :goto_0
    monitor-exit p0

    return-void

    :catchall_0
    move-exception p1

    monitor-exit p0

    throw p1
.end method
