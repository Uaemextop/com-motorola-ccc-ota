.class public Lcom/google/android/gms/internal/ga;
.super Ljava/lang/Object;


# annotations
.annotation runtime Lcom/google/android/gms/internal/ez;
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/google/android/gms/internal/ga$a;
    }
.end annotation


# instance fields
.field private final mw:Ljava/lang/Object;

.field private uC:Z

.field private final vA:Ljava/lang/String;

.field private vB:J

.field private vC:J

.field private vD:J

.field private vE:J

.field private vF:J

.field private vG:J

.field private final vx:Lcom/google/android/gms/internal/gb;

.field private final vy:Ljava/util/LinkedList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/LinkedList<",
            "Lcom/google/android/gms/internal/ga$a;",
            ">;"
        }
    .end annotation
.end field

.field private final vz:Ljava/lang/String;


# direct methods
.method public constructor <init>(Lcom/google/android/gms/internal/gb;Ljava/lang/String;Ljava/lang/String;)V
    .locals 4

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance v0, Ljava/lang/Object;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    iput-object v0, p0, Lcom/google/android/gms/internal/ga;->mw:Ljava/lang/Object;

    const-wide/16 v0, -0x1

    iput-wide v0, p0, Lcom/google/android/gms/internal/ga;->vB:J

    iput-wide v0, p0, Lcom/google/android/gms/internal/ga;->vC:J

    const/4 v2, 0x0

    iput-boolean v2, p0, Lcom/google/android/gms/internal/ga;->uC:Z

    iput-wide v0, p0, Lcom/google/android/gms/internal/ga;->vD:J

    const-wide/16 v2, 0x0

    iput-wide v2, p0, Lcom/google/android/gms/internal/ga;->vE:J

    iput-wide v0, p0, Lcom/google/android/gms/internal/ga;->vF:J

    iput-wide v0, p0, Lcom/google/android/gms/internal/ga;->vG:J

    iput-object p1, p0, Lcom/google/android/gms/internal/ga;->vx:Lcom/google/android/gms/internal/gb;

    iput-object p2, p0, Lcom/google/android/gms/internal/ga;->vz:Ljava/lang/String;

    iput-object p3, p0, Lcom/google/android/gms/internal/ga;->vA:Ljava/lang/String;

    new-instance p1, Ljava/util/LinkedList;

    invoke-direct {p1}, Ljava/util/LinkedList;-><init>()V

    iput-object p1, p0, Lcom/google/android/gms/internal/ga;->vy:Ljava/util/LinkedList;

    return-void
.end method

.method public constructor <init>(Ljava/lang/String;Ljava/lang/String;)V
    .locals 1

    invoke-static {}, Lcom/google/android/gms/internal/gb;->cU()Lcom/google/android/gms/internal/gb;

    move-result-object v0

    invoke-direct {p0, v0, p1, p2}, Lcom/google/android/gms/internal/ga;-><init>(Lcom/google/android/gms/internal/gb;Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method


# virtual methods
.method public cO()V
    .locals 5

    iget-object v0, p0, Lcom/google/android/gms/internal/ga;->mw:Ljava/lang/Object;

    monitor-enter v0

    :try_start_0
    iget-wide v1, p0, Lcom/google/android/gms/internal/ga;->vG:J

    const-wide/16 v3, -0x1

    cmp-long v1, v1, v3

    if-eqz v1, :cond_0

    iget-wide v1, p0, Lcom/google/android/gms/internal/ga;->vC:J

    cmp-long v1, v1, v3

    if-nez v1, :cond_0

    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    move-result-wide v1

    iput-wide v1, p0, Lcom/google/android/gms/internal/ga;->vC:J

    iget-object v1, p0, Lcom/google/android/gms/internal/ga;->vx:Lcom/google/android/gms/internal/gb;

    invoke-virtual {v1, p0}, Lcom/google/android/gms/internal/gb;->a(Lcom/google/android/gms/internal/ga;)V

    :cond_0
    invoke-static {}, Lcom/google/android/gms/internal/gb;->cY()Lcom/google/android/gms/internal/gc;

    move-result-object p0

    invoke-virtual {p0}, Lcom/google/android/gms/internal/gc;->cO()V

    monitor-exit v0

    return-void

    :catchall_0
    move-exception p0

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw p0
.end method

.method public cP()V
    .locals 5

    iget-object v0, p0, Lcom/google/android/gms/internal/ga;->mw:Ljava/lang/Object;

    monitor-enter v0

    :try_start_0
    iget-wide v1, p0, Lcom/google/android/gms/internal/ga;->vG:J

    const-wide/16 v3, -0x1

    cmp-long v1, v1, v3

    if-eqz v1, :cond_0

    new-instance v1, Lcom/google/android/gms/internal/ga$a;

    invoke-direct {v1}, Lcom/google/android/gms/internal/ga$a;-><init>()V

    invoke-virtual {v1}, Lcom/google/android/gms/internal/ga$a;->cT()V

    iget-object v2, p0, Lcom/google/android/gms/internal/ga;->vy:Ljava/util/LinkedList;

    invoke-virtual {v2, v1}, Ljava/util/LinkedList;->add(Ljava/lang/Object;)Z

    iget-wide v1, p0, Lcom/google/android/gms/internal/ga;->vE:J

    const-wide/16 v3, 0x1

    add-long/2addr v1, v3

    iput-wide v1, p0, Lcom/google/android/gms/internal/ga;->vE:J

    invoke-static {}, Lcom/google/android/gms/internal/gb;->cY()Lcom/google/android/gms/internal/gc;

    move-result-object v1

    invoke-virtual {v1}, Lcom/google/android/gms/internal/gc;->cP()V

    iget-object v1, p0, Lcom/google/android/gms/internal/ga;->vx:Lcom/google/android/gms/internal/gb;

    invoke-virtual {v1, p0}, Lcom/google/android/gms/internal/gb;->a(Lcom/google/android/gms/internal/ga;)V

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

.method public cQ()V
    .locals 7

    iget-object v0, p0, Lcom/google/android/gms/internal/ga;->mw:Ljava/lang/Object;

    monitor-enter v0

    :try_start_0
    iget-wide v1, p0, Lcom/google/android/gms/internal/ga;->vG:J

    const-wide/16 v3, -0x1

    cmp-long v1, v1, v3

    if-eqz v1, :cond_0

    iget-object v1, p0, Lcom/google/android/gms/internal/ga;->vy:Ljava/util/LinkedList;

    invoke-virtual {v1}, Ljava/util/LinkedList;->isEmpty()Z

    move-result v1

    if-nez v1, :cond_0

    iget-object v1, p0, Lcom/google/android/gms/internal/ga;->vy:Ljava/util/LinkedList;

    invoke-virtual {v1}, Ljava/util/LinkedList;->getLast()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/google/android/gms/internal/ga$a;

    invoke-virtual {v1}, Lcom/google/android/gms/internal/ga$a;->cR()J

    move-result-wide v5

    cmp-long v2, v5, v3

    if-nez v2, :cond_0

    invoke-virtual {v1}, Lcom/google/android/gms/internal/ga$a;->cS()V

    iget-object v1, p0, Lcom/google/android/gms/internal/ga;->vx:Lcom/google/android/gms/internal/gb;

    invoke-virtual {v1, p0}, Lcom/google/android/gms/internal/gb;->a(Lcom/google/android/gms/internal/ga;)V

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

.method public e(Lcom/google/android/gms/internal/av;)V
    .locals 4

    iget-object v0, p0, Lcom/google/android/gms/internal/ga;->mw:Ljava/lang/Object;

    monitor-enter v0

    :try_start_0
    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    move-result-wide v1

    iput-wide v1, p0, Lcom/google/android/gms/internal/ga;->vF:J

    invoke-static {}, Lcom/google/android/gms/internal/gb;->cY()Lcom/google/android/gms/internal/gc;

    move-result-object v1

    iget-wide v2, p0, Lcom/google/android/gms/internal/ga;->vF:J

    invoke-virtual {v1, p1, v2, v3}, Lcom/google/android/gms/internal/gc;->b(Lcom/google/android/gms/internal/av;J)V

    monitor-exit v0

    return-void

    :catchall_0
    move-exception p0

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw p0
.end method

.method public j(J)V
    .locals 3

    iget-object v0, p0, Lcom/google/android/gms/internal/ga;->mw:Ljava/lang/Object;

    monitor-enter v0

    :try_start_0
    iput-wide p1, p0, Lcom/google/android/gms/internal/ga;->vG:J

    const-wide/16 v1, -0x1

    cmp-long p1, p1, v1

    if-eqz p1, :cond_0

    iget-object p1, p0, Lcom/google/android/gms/internal/ga;->vx:Lcom/google/android/gms/internal/gb;

    invoke-virtual {p1, p0}, Lcom/google/android/gms/internal/gb;->a(Lcom/google/android/gms/internal/ga;)V

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

.method public k(J)V
    .locals 5

    iget-object v0, p0, Lcom/google/android/gms/internal/ga;->mw:Ljava/lang/Object;

    monitor-enter v0

    :try_start_0
    iget-wide v1, p0, Lcom/google/android/gms/internal/ga;->vG:J

    const-wide/16 v3, -0x1

    cmp-long v1, v1, v3

    if-eqz v1, :cond_0

    iput-wide p1, p0, Lcom/google/android/gms/internal/ga;->vB:J

    iget-object p1, p0, Lcom/google/android/gms/internal/ga;->vx:Lcom/google/android/gms/internal/gb;

    invoke-virtual {p1, p0}, Lcom/google/android/gms/internal/gb;->a(Lcom/google/android/gms/internal/ga;)V

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

.method public t(Z)V
    .locals 5

    iget-object v0, p0, Lcom/google/android/gms/internal/ga;->mw:Ljava/lang/Object;

    monitor-enter v0

    :try_start_0
    iget-wide v1, p0, Lcom/google/android/gms/internal/ga;->vG:J

    const-wide/16 v3, -0x1

    cmp-long v1, v1, v3

    if-eqz v1, :cond_0

    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    move-result-wide v1

    iput-wide v1, p0, Lcom/google/android/gms/internal/ga;->vD:J

    if-nez p1, :cond_0

    iput-wide v1, p0, Lcom/google/android/gms/internal/ga;->vC:J

    iget-object p1, p0, Lcom/google/android/gms/internal/ga;->vx:Lcom/google/android/gms/internal/gb;

    invoke-virtual {p1, p0}, Lcom/google/android/gms/internal/gb;->a(Lcom/google/android/gms/internal/ga;)V

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

.method public toBundle()Landroid/os/Bundle;
    .locals 5

    iget-object v0, p0, Lcom/google/android/gms/internal/ga;->mw:Ljava/lang/Object;

    monitor-enter v0

    :try_start_0
    new-instance v1, Landroid/os/Bundle;

    invoke-direct {v1}, Landroid/os/Bundle;-><init>()V

    const-string v2, "seq_num"

    iget-object v3, p0, Lcom/google/android/gms/internal/ga;->vz:Ljava/lang/String;

    invoke-virtual {v1, v2, v3}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    const-string v2, "slotid"

    iget-object v3, p0, Lcom/google/android/gms/internal/ga;->vA:Ljava/lang/String;

    invoke-virtual {v1, v2, v3}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    const-string v2, "ismediation"

    iget-boolean v3, p0, Lcom/google/android/gms/internal/ga;->uC:Z

    invoke-virtual {v1, v2, v3}, Landroid/os/Bundle;->putBoolean(Ljava/lang/String;Z)V

    const-string v2, "treq"

    iget-wide v3, p0, Lcom/google/android/gms/internal/ga;->vF:J

    invoke-virtual {v1, v2, v3, v4}, Landroid/os/Bundle;->putLong(Ljava/lang/String;J)V

    const-string v2, "tresponse"

    iget-wide v3, p0, Lcom/google/android/gms/internal/ga;->vG:J

    invoke-virtual {v1, v2, v3, v4}, Landroid/os/Bundle;->putLong(Ljava/lang/String;J)V

    const-string v2, "timp"

    iget-wide v3, p0, Lcom/google/android/gms/internal/ga;->vC:J

    invoke-virtual {v1, v2, v3, v4}, Landroid/os/Bundle;->putLong(Ljava/lang/String;J)V

    const-string v2, "tload"

    iget-wide v3, p0, Lcom/google/android/gms/internal/ga;->vD:J

    invoke-virtual {v1, v2, v3, v4}, Landroid/os/Bundle;->putLong(Ljava/lang/String;J)V

    const-string v2, "pcc"

    iget-wide v3, p0, Lcom/google/android/gms/internal/ga;->vE:J

    invoke-virtual {v1, v2, v3, v4}, Landroid/os/Bundle;->putLong(Ljava/lang/String;J)V

    const-string v2, "tfetch"

    iget-wide v3, p0, Lcom/google/android/gms/internal/ga;->vB:J

    invoke-virtual {v1, v2, v3, v4}, Landroid/os/Bundle;->putLong(Ljava/lang/String;J)V

    new-instance v2, Ljava/util/ArrayList;

    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    iget-object p0, p0, Lcom/google/android/gms/internal/ga;->vy:Ljava/util/LinkedList;

    invoke-virtual {p0}, Ljava/util/LinkedList;->iterator()Ljava/util/Iterator;

    move-result-object p0

    :goto_0
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_0

    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/google/android/gms/internal/ga$a;

    invoke-virtual {v3}, Lcom/google/android/gms/internal/ga$a;->toBundle()Landroid/os/Bundle;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_0

    :cond_0
    const-string p0, "tclick"

    invoke-virtual {v1, p0, v2}, Landroid/os/Bundle;->putParcelableArrayList(Ljava/lang/String;Ljava/util/ArrayList;)V

    monitor-exit v0

    return-object v1

    :catchall_0
    move-exception p0

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw p0
.end method

.method public u(Z)V
    .locals 5

    iget-object v0, p0, Lcom/google/android/gms/internal/ga;->mw:Ljava/lang/Object;

    monitor-enter v0

    :try_start_0
    iget-wide v1, p0, Lcom/google/android/gms/internal/ga;->vG:J

    const-wide/16 v3, -0x1

    cmp-long v1, v1, v3

    if-eqz v1, :cond_0

    iput-boolean p1, p0, Lcom/google/android/gms/internal/ga;->uC:Z

    iget-object p1, p0, Lcom/google/android/gms/internal/ga;->vx:Lcom/google/android/gms/internal/gb;

    invoke-virtual {p1, p0}, Lcom/google/android/gms/internal/gb;->a(Lcom/google/android/gms/internal/ga;)V

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
