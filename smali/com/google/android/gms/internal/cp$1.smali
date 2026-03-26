.class Lcom/google/android/gms/internal/cp$1;
.super Ljava/lang/Object;

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/google/android/gms/internal/cp;->b(JJ)Lcom/google/android/gms/internal/cq;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic qv:Lcom/google/android/gms/internal/co;

.field final synthetic qw:Lcom/google/android/gms/internal/cp;


# direct methods
.method constructor <init>(Lcom/google/android/gms/internal/cp;Lcom/google/android/gms/internal/co;)V
    .locals 0

    iput-object p1, p0, Lcom/google/android/gms/internal/cp$1;->qw:Lcom/google/android/gms/internal/cp;

    iput-object p2, p0, Lcom/google/android/gms/internal/cp$1;->qv:Lcom/google/android/gms/internal/co;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 3

    iget-object v0, p0, Lcom/google/android/gms/internal/cp$1;->qw:Lcom/google/android/gms/internal/cp;

    invoke-static {v0}, Lcom/google/android/gms/internal/cp;->a(Lcom/google/android/gms/internal/cp;)Ljava/lang/Object;

    move-result-object v0

    monitor-enter v0

    :try_start_0
    iget-object v1, p0, Lcom/google/android/gms/internal/cp$1;->qw:Lcom/google/android/gms/internal/cp;

    invoke-static {v1}, Lcom/google/android/gms/internal/cp;->b(Lcom/google/android/gms/internal/cp;)I

    move-result v1

    const/4 v2, -0x2

    if-eq v1, v2, :cond_0

    monitor-exit v0

    return-void

    :cond_0
    iget-object v1, p0, Lcom/google/android/gms/internal/cp$1;->qw:Lcom/google/android/gms/internal/cp;

    invoke-static {v1}, Lcom/google/android/gms/internal/cp;->c(Lcom/google/android/gms/internal/cp;)Lcom/google/android/gms/internal/cu;

    move-result-object v2

    invoke-static {v1, v2}, Lcom/google/android/gms/internal/cp;->a(Lcom/google/android/gms/internal/cp;Lcom/google/android/gms/internal/cu;)Lcom/google/android/gms/internal/cu;

    iget-object v1, p0, Lcom/google/android/gms/internal/cp$1;->qw:Lcom/google/android/gms/internal/cp;

    invoke-static {v1}, Lcom/google/android/gms/internal/cp;->d(Lcom/google/android/gms/internal/cp;)Lcom/google/android/gms/internal/cu;

    move-result-object v1

    if-nez v1, :cond_1

    iget-object p0, p0, Lcom/google/android/gms/internal/cp$1;->qw:Lcom/google/android/gms/internal/cp;

    const/4 v1, 0x4

    invoke-virtual {p0, v1}, Lcom/google/android/gms/internal/cp;->j(I)V

    monitor-exit v0

    return-void

    :cond_1
    iget-object v1, p0, Lcom/google/android/gms/internal/cp$1;->qv:Lcom/google/android/gms/internal/co;

    iget-object v2, p0, Lcom/google/android/gms/internal/cp$1;->qw:Lcom/google/android/gms/internal/cp;

    invoke-virtual {v1, v2}, Lcom/google/android/gms/internal/co;->a(Lcom/google/android/gms/internal/cq$a;)V

    iget-object v1, p0, Lcom/google/android/gms/internal/cp$1;->qw:Lcom/google/android/gms/internal/cp;

    iget-object p0, p0, Lcom/google/android/gms/internal/cp$1;->qv:Lcom/google/android/gms/internal/co;

    invoke-static {v1, p0}, Lcom/google/android/gms/internal/cp;->a(Lcom/google/android/gms/internal/cp;Lcom/google/android/gms/internal/co;)V

    monitor-exit v0

    return-void

    :catchall_0
    move-exception p0

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw p0
.end method
