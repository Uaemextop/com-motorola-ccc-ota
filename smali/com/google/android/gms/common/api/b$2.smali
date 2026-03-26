.class Lcom/google/android/gms/common/api/b$2;
.super Ljava/lang/Object;

# interfaces
.implements Lcom/google/android/gms/common/api/GoogleApiClient$ConnectionCallbacks;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/google/android/gms/common/api/b;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic Jq:Lcom/google/android/gms/common/api/b;


# direct methods
.method constructor <init>(Lcom/google/android/gms/common/api/b;)V
    .locals 0

    iput-object p1, p0, Lcom/google/android/gms/common/api/b$2;->Jq:Lcom/google/android/gms/common/api/b;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onConnected(Landroid/os/Bundle;)V
    .locals 2

    iget-object v0, p0, Lcom/google/android/gms/common/api/b$2;->Jq:Lcom/google/android/gms/common/api/b;

    invoke-static {v0}, Lcom/google/android/gms/common/api/b;->a(Lcom/google/android/gms/common/api/b;)Ljava/util/concurrent/locks/Lock;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/concurrent/locks/Lock;->lock()V

    :try_start_0
    iget-object v0, p0, Lcom/google/android/gms/common/api/b$2;->Jq:Lcom/google/android/gms/common/api/b;

    invoke-static {v0}, Lcom/google/android/gms/common/api/b;->b(Lcom/google/android/gms/common/api/b;)I

    move-result v0

    const/4 v1, 0x1

    if-ne v0, v1, :cond_1

    if-eqz p1, :cond_0

    iget-object v0, p0, Lcom/google/android/gms/common/api/b$2;->Jq:Lcom/google/android/gms/common/api/b;

    invoke-static {v0}, Lcom/google/android/gms/common/api/b;->c(Lcom/google/android/gms/common/api/b;)Landroid/os/Bundle;

    move-result-object v0

    invoke-virtual {v0, p1}, Landroid/os/Bundle;->putAll(Landroid/os/Bundle;)V

    :cond_0
    iget-object p1, p0, Lcom/google/android/gms/common/api/b$2;->Jq:Lcom/google/android/gms/common/api/b;

    invoke-static {p1}, Lcom/google/android/gms/common/api/b;->d(Lcom/google/android/gms/common/api/b;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    :cond_1
    iget-object p0, p0, Lcom/google/android/gms/common/api/b$2;->Jq:Lcom/google/android/gms/common/api/b;

    invoke-static {p0}, Lcom/google/android/gms/common/api/b;->a(Lcom/google/android/gms/common/api/b;)Ljava/util/concurrent/locks/Lock;

    move-result-object p0

    invoke-interface {p0}, Ljava/util/concurrent/locks/Lock;->unlock()V

    return-void

    :catchall_0
    move-exception p1

    iget-object p0, p0, Lcom/google/android/gms/common/api/b$2;->Jq:Lcom/google/android/gms/common/api/b;

    invoke-static {p0}, Lcom/google/android/gms/common/api/b;->a(Lcom/google/android/gms/common/api/b;)Ljava/util/concurrent/locks/Lock;

    move-result-object p0

    invoke-interface {p0}, Ljava/util/concurrent/locks/Lock;->unlock()V

    throw p1
.end method

.method public onConnectionSuspended(I)V
    .locals 3

    iget-object v0, p0, Lcom/google/android/gms/common/api/b$2;->Jq:Lcom/google/android/gms/common/api/b;

    invoke-static {v0}, Lcom/google/android/gms/common/api/b;->a(Lcom/google/android/gms/common/api/b;)Ljava/util/concurrent/locks/Lock;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/concurrent/locks/Lock;->lock()V

    :try_start_0
    iget-object v0, p0, Lcom/google/android/gms/common/api/b$2;->Jq:Lcom/google/android/gms/common/api/b;

    invoke-static {v0, p1}, Lcom/google/android/gms/common/api/b;->a(Lcom/google/android/gms/common/api/b;I)V

    const/4 v0, 0x1

    if-eq p1, v0, :cond_1

    const/4 v0, 0x2

    if-eq p1, v0, :cond_0

    goto :goto_0

    :cond_0
    iget-object p1, p0, Lcom/google/android/gms/common/api/b$2;->Jq:Lcom/google/android/gms/common/api/b;

    invoke-virtual {p1}, Lcom/google/android/gms/common/api/b;->connect()V

    goto :goto_0

    :cond_1
    iget-object p1, p0, Lcom/google/android/gms/common/api/b$2;->Jq:Lcom/google/android/gms/common/api/b;

    invoke-static {p1}, Lcom/google/android/gms/common/api/b;->e(Lcom/google/android/gms/common/api/b;)Z

    move-result p1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    if-eqz p1, :cond_2

    iget-object p0, p0, Lcom/google/android/gms/common/api/b$2;->Jq:Lcom/google/android/gms/common/api/b;

    invoke-static {p0}, Lcom/google/android/gms/common/api/b;->a(Lcom/google/android/gms/common/api/b;)Ljava/util/concurrent/locks/Lock;

    move-result-object p0

    invoke-interface {p0}, Ljava/util/concurrent/locks/Lock;->unlock()V

    return-void

    :cond_2
    :try_start_1
    iget-object p1, p0, Lcom/google/android/gms/common/api/b$2;->Jq:Lcom/google/android/gms/common/api/b;

    iget v1, p1, Lcom/google/android/gms/common/api/b;->IU:I

    invoke-static {p1, v1}, Lcom/google/android/gms/common/api/b;->b(Lcom/google/android/gms/common/api/b;I)I

    iget-object p1, p0, Lcom/google/android/gms/common/api/b$2;->Jq:Lcom/google/android/gms/common/api/b;

    iget-object p1, p1, Lcom/google/android/gms/common/api/b;->Jh:Landroid/os/Handler;

    iget-object v1, p0, Lcom/google/android/gms/common/api/b$2;->Jq:Lcom/google/android/gms/common/api/b;

    iget-object v1, v1, Lcom/google/android/gms/common/api/b;->Jh:Landroid/os/Handler;

    invoke-virtual {v1, v0}, Landroid/os/Handler;->obtainMessage(I)Landroid/os/Message;

    move-result-object v0

    iget-object v1, p0, Lcom/google/android/gms/common/api/b$2;->Jq:Lcom/google/android/gms/common/api/b;

    invoke-static {v1}, Lcom/google/android/gms/common/api/b;->f(Lcom/google/android/gms/common/api/b;)J

    move-result-wide v1

    invoke-virtual {p1, v0, v1, v2}, Landroid/os/Handler;->sendMessageDelayed(Landroid/os/Message;J)Z
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    :goto_0
    iget-object p0, p0, Lcom/google/android/gms/common/api/b$2;->Jq:Lcom/google/android/gms/common/api/b;

    invoke-static {p0}, Lcom/google/android/gms/common/api/b;->a(Lcom/google/android/gms/common/api/b;)Ljava/util/concurrent/locks/Lock;

    move-result-object p0

    invoke-interface {p0}, Ljava/util/concurrent/locks/Lock;->unlock()V

    return-void

    :catchall_0
    move-exception p1

    iget-object p0, p0, Lcom/google/android/gms/common/api/b$2;->Jq:Lcom/google/android/gms/common/api/b;

    invoke-static {p0}, Lcom/google/android/gms/common/api/b;->a(Lcom/google/android/gms/common/api/b;)Ljava/util/concurrent/locks/Lock;

    move-result-object p0

    invoke-interface {p0}, Ljava/util/concurrent/locks/Lock;->unlock()V

    throw p1
.end method
