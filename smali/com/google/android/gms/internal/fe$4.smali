.class Lcom/google/android/gms/internal/fe$4;
.super Ljava/lang/Object;

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/google/android/gms/internal/fe;->g(J)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic tr:Lcom/google/android/gms/internal/fe;

.field final synthetic tt:Lcom/google/android/gms/internal/fc;


# direct methods
.method constructor <init>(Lcom/google/android/gms/internal/fe;Lcom/google/android/gms/internal/fc;)V
    .locals 0

    iput-object p1, p0, Lcom/google/android/gms/internal/fe$4;->tr:Lcom/google/android/gms/internal/fe;

    iput-object p2, p0, Lcom/google/android/gms/internal/fe$4;->tt:Lcom/google/android/gms/internal/fc;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 3

    iget-object v0, p0, Lcom/google/android/gms/internal/fe$4;->tr:Lcom/google/android/gms/internal/fe;

    invoke-static {v0}, Lcom/google/android/gms/internal/fe;->a(Lcom/google/android/gms/internal/fe;)Ljava/lang/Object;

    move-result-object v0

    monitor-enter v0

    :try_start_0
    iget-object v1, p0, Lcom/google/android/gms/internal/fe$4;->tr:Lcom/google/android/gms/internal/fe;

    invoke-static {v1}, Lcom/google/android/gms/internal/fe;->c(Lcom/google/android/gms/internal/fe;)Lcom/google/android/gms/internal/fk;

    move-result-object v1

    iget v1, v1, Lcom/google/android/gms/internal/fk;->errorCode:I

    const/4 v2, -0x2

    if-eq v1, v2, :cond_0

    monitor-exit v0

    return-void

    :cond_0
    iget-object v1, p0, Lcom/google/android/gms/internal/fe$4;->tr:Lcom/google/android/gms/internal/fe;

    invoke-static {v1}, Lcom/google/android/gms/internal/fe;->d(Lcom/google/android/gms/internal/fe;)Lcom/google/android/gms/internal/gv;

    move-result-object v1

    invoke-virtual {v1}, Lcom/google/android/gms/internal/gv;->du()Lcom/google/android/gms/internal/gw;

    move-result-object v1

    iget-object v2, p0, Lcom/google/android/gms/internal/fe$4;->tr:Lcom/google/android/gms/internal/fe;

    invoke-virtual {v1, v2}, Lcom/google/android/gms/internal/gw;->a(Lcom/google/android/gms/internal/gw$a;)V

    iget-object v1, p0, Lcom/google/android/gms/internal/fe$4;->tt:Lcom/google/android/gms/internal/fc;

    iget-object p0, p0, Lcom/google/android/gms/internal/fe$4;->tr:Lcom/google/android/gms/internal/fe;

    invoke-static {p0}, Lcom/google/android/gms/internal/fe;->c(Lcom/google/android/gms/internal/fe;)Lcom/google/android/gms/internal/fk;

    move-result-object p0

    invoke-virtual {v1, p0}, Lcom/google/android/gms/internal/fc;->b(Lcom/google/android/gms/internal/fk;)V

    monitor-exit v0

    return-void

    :catchall_0
    move-exception p0

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw p0
.end method
