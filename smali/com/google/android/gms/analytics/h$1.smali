.class Lcom/google/android/gms/analytics/h$1;
.super Ljava/lang/Thread;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/google/android/gms/analytics/h;->dU()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic xU:Lcom/google/android/gms/analytics/h;


# direct methods
.method constructor <init>(Lcom/google/android/gms/analytics/h;Ljava/lang/String;)V
    .locals 0

    iput-object p1, p0, Lcom/google/android/gms/analytics/h$1;->xU:Lcom/google/android/gms/analytics/h;

    invoke-direct {p0, p2}, Ljava/lang/Thread;-><init>(Ljava/lang/String;)V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 3

    iget-object v0, p0, Lcom/google/android/gms/analytics/h$1;->xU:Lcom/google/android/gms/analytics/h;

    invoke-static {v0}, Lcom/google/android/gms/analytics/h;->a(Lcom/google/android/gms/analytics/h;)Ljava/lang/Object;

    move-result-object v0

    monitor-enter v0

    :try_start_0
    iget-object v1, p0, Lcom/google/android/gms/analytics/h$1;->xU:Lcom/google/android/gms/analytics/h;

    invoke-virtual {v1}, Lcom/google/android/gms/analytics/h;->dV()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Lcom/google/android/gms/analytics/h;->a(Lcom/google/android/gms/analytics/h;Ljava/lang/String;)Ljava/lang/String;

    iget-object v1, p0, Lcom/google/android/gms/analytics/h$1;->xU:Lcom/google/android/gms/analytics/h;

    const/4 v2, 0x1

    invoke-static {v1, v2}, Lcom/google/android/gms/analytics/h;->a(Lcom/google/android/gms/analytics/h;Z)Z

    iget-object p0, p0, Lcom/google/android/gms/analytics/h$1;->xU:Lcom/google/android/gms/analytics/h;

    invoke-static {p0}, Lcom/google/android/gms/analytics/h;->a(Lcom/google/android/gms/analytics/h;)Ljava/lang/Object;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/Object;->notifyAll()V

    monitor-exit v0

    return-void

    :catchall_0
    move-exception p0

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw p0
.end method
