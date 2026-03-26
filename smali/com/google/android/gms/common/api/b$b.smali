.class Lcom/google/android/gms/common/api/b$b;
.super Landroid/os/Handler;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/google/android/gms/common/api/b;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = "b"
.end annotation


# instance fields
.field final synthetic Jq:Lcom/google/android/gms/common/api/b;


# direct methods
.method constructor <init>(Lcom/google/android/gms/common/api/b;Landroid/os/Looper;)V
    .locals 0

    iput-object p1, p0, Lcom/google/android/gms/common/api/b$b;->Jq:Lcom/google/android/gms/common/api/b;

    invoke-direct {p0, p2}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    return-void
.end method


# virtual methods
.method public handleMessage(Landroid/os/Message;)V
    .locals 1

    iget p1, p1, Landroid/os/Message;->what:I

    const/4 v0, 0x1

    if-ne p1, v0, :cond_2

    iget-object p1, p0, Lcom/google/android/gms/common/api/b$b;->Jq:Lcom/google/android/gms/common/api/b;

    invoke-static {p1}, Lcom/google/android/gms/common/api/b;->a(Lcom/google/android/gms/common/api/b;)Ljava/util/concurrent/locks/Lock;

    move-result-object p1

    invoke-interface {p1}, Ljava/util/concurrent/locks/Lock;->lock()V

    :try_start_0
    iget-object p1, p0, Lcom/google/android/gms/common/api/b$b;->Jq:Lcom/google/android/gms/common/api/b;

    invoke-virtual {p1}, Lcom/google/android/gms/common/api/b;->isConnected()Z

    move-result p1

    if-nez p1, :cond_1

    iget-object p1, p0, Lcom/google/android/gms/common/api/b$b;->Jq:Lcom/google/android/gms/common/api/b;

    invoke-virtual {p1}, Lcom/google/android/gms/common/api/b;->isConnecting()Z

    move-result p1

    if-nez p1, :cond_1

    iget-object p1, p0, Lcom/google/android/gms/common/api/b$b;->Jq:Lcom/google/android/gms/common/api/b;

    invoke-static {p1}, Lcom/google/android/gms/common/api/b;->e(Lcom/google/android/gms/common/api/b;)Z

    move-result p1

    if-nez p1, :cond_0

    goto :goto_0

    :cond_0
    iget-object p1, p0, Lcom/google/android/gms/common/api/b$b;->Jq:Lcom/google/android/gms/common/api/b;

    invoke-static {p1}, Lcom/google/android/gms/common/api/b;->h(Lcom/google/android/gms/common/api/b;)I

    iget-object p1, p0, Lcom/google/android/gms/common/api/b$b;->Jq:Lcom/google/android/gms/common/api/b;

    invoke-virtual {p1}, Lcom/google/android/gms/common/api/b;->connect()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    iget-object p0, p0, Lcom/google/android/gms/common/api/b$b;->Jq:Lcom/google/android/gms/common/api/b;

    invoke-static {p0}, Lcom/google/android/gms/common/api/b;->a(Lcom/google/android/gms/common/api/b;)Ljava/util/concurrent/locks/Lock;

    move-result-object p0

    invoke-interface {p0}, Ljava/util/concurrent/locks/Lock;->unlock()V

    return-void

    :cond_1
    :goto_0
    iget-object p0, p0, Lcom/google/android/gms/common/api/b$b;->Jq:Lcom/google/android/gms/common/api/b;

    invoke-static {p0}, Lcom/google/android/gms/common/api/b;->a(Lcom/google/android/gms/common/api/b;)Ljava/util/concurrent/locks/Lock;

    move-result-object p0

    invoke-interface {p0}, Ljava/util/concurrent/locks/Lock;->unlock()V

    return-void

    :catchall_0
    move-exception p1

    iget-object p0, p0, Lcom/google/android/gms/common/api/b$b;->Jq:Lcom/google/android/gms/common/api/b;

    invoke-static {p0}, Lcom/google/android/gms/common/api/b;->a(Lcom/google/android/gms/common/api/b;)Ljava/util/concurrent/locks/Lock;

    move-result-object p0

    invoke-interface {p0}, Ljava/util/concurrent/locks/Lock;->unlock()V

    throw p1

    :cond_2
    const-string p0, "GoogleApiClientImpl"

    const-string p1, "Don\'t know how to handle this message."

    invoke-static {p0, p1}, Landroid/util/Log;->wtf(Ljava/lang/String;Ljava/lang/String;)I

    return-void
.end method
