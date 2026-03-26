.class public final Lcom/google/android/gms/common/internal/g;
.super Ljava/lang/Object;

# interfaces
.implements Landroid/os/Handler$Callback;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/google/android/gms/common/internal/g$a;
    }
.end annotation


# static fields
.field private static final LS:Ljava/lang/Object;

.field private static LT:Lcom/google/android/gms/common/internal/g;


# instance fields
.field private final LU:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap<",
            "Ljava/lang/String;",
            "Lcom/google/android/gms/common/internal/g$a;",
            ">;"
        }
    .end annotation
.end field

.field private final mD:Landroid/content/Context;

.field private final mHandler:Landroid/os/Handler;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    new-instance v0, Ljava/lang/Object;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    sput-object v0, Lcom/google/android/gms/common/internal/g;->LS:Ljava/lang/Object;

    return-void
.end method

.method private constructor <init>(Landroid/content/Context;)V
    .locals 2

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance v0, Landroid/os/Handler;

    invoke-virtual {p1}, Landroid/content/Context;->getMainLooper()Landroid/os/Looper;

    move-result-object v1

    invoke-direct {v0, v1, p0}, Landroid/os/Handler;-><init>(Landroid/os/Looper;Landroid/os/Handler$Callback;)V

    iput-object v0, p0, Lcom/google/android/gms/common/internal/g;->mHandler:Landroid/os/Handler;

    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lcom/google/android/gms/common/internal/g;->LU:Ljava/util/HashMap;

    invoke-virtual {p1}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object p1

    iput-object p1, p0, Lcom/google/android/gms/common/internal/g;->mD:Landroid/content/Context;

    return-void
.end method

.method public static J(Landroid/content/Context;)Lcom/google/android/gms/common/internal/g;
    .locals 2

    sget-object v0, Lcom/google/android/gms/common/internal/g;->LS:Ljava/lang/Object;

    monitor-enter v0

    :try_start_0
    sget-object v1, Lcom/google/android/gms/common/internal/g;->LT:Lcom/google/android/gms/common/internal/g;

    if-nez v1, :cond_0

    new-instance v1, Lcom/google/android/gms/common/internal/g;

    invoke-virtual {p0}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object p0

    invoke-direct {v1, p0}, Lcom/google/android/gms/common/internal/g;-><init>(Landroid/content/Context;)V

    sput-object v1, Lcom/google/android/gms/common/internal/g;->LT:Lcom/google/android/gms/common/internal/g;

    :cond_0
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    sget-object p0, Lcom/google/android/gms/common/internal/g;->LT:Lcom/google/android/gms/common/internal/g;

    return-object p0

    :catchall_0
    move-exception p0

    :try_start_1
    monitor-exit v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw p0
.end method

.method static synthetic a(Lcom/google/android/gms/common/internal/g;)Ljava/util/HashMap;
    .locals 0

    iget-object p0, p0, Lcom/google/android/gms/common/internal/g;->LU:Ljava/util/HashMap;

    return-object p0
.end method


# virtual methods
.method public a(Ljava/lang/String;Lcom/google/android/gms/common/internal/e$f;)Z
    .locals 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Lcom/google/android/gms/common/internal/e<",
            "*>.f;)Z"
        }
    .end annotation

    const-string v0, "Trying to bind a GmsServiceConnection that was already connected before.  startServiceAction="

    iget-object v1, p0, Lcom/google/android/gms/common/internal/g;->LU:Ljava/util/HashMap;

    monitor-enter v1

    :try_start_0
    iget-object v2, p0, Lcom/google/android/gms/common/internal/g;->LU:Ljava/util/HashMap;

    invoke-virtual {v2, p1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/google/android/gms/common/internal/g$a;

    const/16 v3, 0x81

    if-nez v2, :cond_0

    new-instance v2, Lcom/google/android/gms/common/internal/g$a;

    invoke-direct {v2, p0, p1}, Lcom/google/android/gms/common/internal/g$a;-><init>(Lcom/google/android/gms/common/internal/g;Ljava/lang/String;)V

    invoke-virtual {v2, p2}, Lcom/google/android/gms/common/internal/g$a;->a(Lcom/google/android/gms/common/internal/e$f;)V

    new-instance p2, Landroid/content/Intent;

    invoke-direct {p2, p1}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    const-string v0, "com.google.android.gms"

    invoke-virtual {p2, v0}, Landroid/content/Intent;->setPackage(Ljava/lang/String;)Landroid/content/Intent;

    move-result-object p2

    iget-object v0, p0, Lcom/google/android/gms/common/internal/g;->mD:Landroid/content/Context;

    invoke-virtual {v2}, Lcom/google/android/gms/common/internal/g$a;->gW()Lcom/google/android/gms/common/internal/g$a$a;

    move-result-object v4

    invoke-virtual {v0, p2, v4, v3}, Landroid/content/Context;->bindService(Landroid/content/Intent;Landroid/content/ServiceConnection;I)Z

    move-result p2

    invoke-virtual {v2, p2}, Lcom/google/android/gms/common/internal/g$a;->J(Z)V

    iget-object p0, p0, Lcom/google/android/gms/common/internal/g;->LU:Ljava/util/HashMap;

    invoke-virtual {p0, p1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_0

    :cond_0
    iget-object v4, p0, Lcom/google/android/gms/common/internal/g;->mHandler:Landroid/os/Handler;

    const/4 v5, 0x0

    invoke-virtual {v4, v5, v2}, Landroid/os/Handler;->removeMessages(ILjava/lang/Object;)V

    invoke-virtual {v2, p2}, Lcom/google/android/gms/common/internal/g$a;->c(Lcom/google/android/gms/common/internal/e$f;)Z

    move-result v4

    if-nez v4, :cond_3

    invoke-virtual {v2, p2}, Lcom/google/android/gms/common/internal/g$a;->a(Lcom/google/android/gms/common/internal/e$f;)V

    invoke-virtual {v2}, Lcom/google/android/gms/common/internal/g$a;->getState()I

    move-result v0

    const/4 v4, 0x1

    if-eq v0, v4, :cond_2

    const/4 p2, 0x2

    if-eq v0, p2, :cond_1

    goto :goto_0

    :cond_1
    new-instance p2, Landroid/content/Intent;

    invoke-direct {p2, p1}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    const-string p1, "com.google.android.gms"

    invoke-virtual {p2, p1}, Landroid/content/Intent;->setPackage(Ljava/lang/String;)Landroid/content/Intent;

    move-result-object p1

    iget-object p0, p0, Lcom/google/android/gms/common/internal/g;->mD:Landroid/content/Context;

    invoke-virtual {v2}, Lcom/google/android/gms/common/internal/g$a;->gW()Lcom/google/android/gms/common/internal/g$a$a;

    move-result-object p2

    invoke-virtual {p0, p1, p2, v3}, Landroid/content/Context;->bindService(Landroid/content/Intent;Landroid/content/ServiceConnection;I)Z

    move-result p0

    invoke-virtual {v2, p0}, Lcom/google/android/gms/common/internal/g$a;->J(Z)V

    goto :goto_0

    :cond_2
    invoke-virtual {v2}, Lcom/google/android/gms/common/internal/g$a;->getComponentName()Landroid/content/ComponentName;

    move-result-object p0

    invoke-virtual {v2}, Lcom/google/android/gms/common/internal/g$a;->getBinder()Landroid/os/IBinder;

    move-result-object p1

    invoke-virtual {p2, p0, p1}, Lcom/google/android/gms/common/internal/e$f;->onServiceConnected(Landroid/content/ComponentName;Landroid/os/IBinder;)V

    :goto_0
    invoke-virtual {v2}, Lcom/google/android/gms/common/internal/g$a;->isBound()Z

    move-result p0

    monitor-exit v1

    return p0

    :cond_3
    new-instance p0, Ljava/lang/IllegalStateException;

    new-instance p2, Ljava/lang/StringBuilder;

    invoke-direct {p2, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-direct {p0, p1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw p0

    :catchall_0
    move-exception p0

    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw p0
.end method

.method public b(Ljava/lang/String;Lcom/google/android/gms/common/internal/e$f;)V
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Lcom/google/android/gms/common/internal/e<",
            "*>.f;)V"
        }
    .end annotation

    const-string v0, "Trying to unbind a GmsServiceConnection  that was not bound before.  startServiceAction="

    const-string v1, "Nonexistent connection status for service action: "

    iget-object v2, p0, Lcom/google/android/gms/common/internal/g;->LU:Ljava/util/HashMap;

    monitor-enter v2

    :try_start_0
    iget-object v3, p0, Lcom/google/android/gms/common/internal/g;->LU:Ljava/util/HashMap;

    invoke-virtual {v3, p1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/google/android/gms/common/internal/g$a;

    if-eqz v3, :cond_2

    invoke-virtual {v3, p2}, Lcom/google/android/gms/common/internal/g$a;->c(Lcom/google/android/gms/common/internal/e$f;)Z

    move-result v1

    if-eqz v1, :cond_1

    invoke-virtual {v3, p2}, Lcom/google/android/gms/common/internal/g$a;->b(Lcom/google/android/gms/common/internal/e$f;)V

    invoke-virtual {v3}, Lcom/google/android/gms/common/internal/g$a;->gY()Z

    move-result p1

    if-eqz p1, :cond_0

    iget-object p1, p0, Lcom/google/android/gms/common/internal/g;->mHandler:Landroid/os/Handler;

    const/4 p2, 0x0

    invoke-virtual {p1, p2, v3}, Landroid/os/Handler;->obtainMessage(ILjava/lang/Object;)Landroid/os/Message;

    move-result-object p1

    iget-object p0, p0, Lcom/google/android/gms/common/internal/g;->mHandler:Landroid/os/Handler;

    const-wide/16 v0, 0x1388

    invoke-virtual {p0, p1, v0, v1}, Landroid/os/Handler;->sendMessageDelayed(Landroid/os/Message;J)Z

    :cond_0
    monitor-exit v2

    return-void

    :cond_1
    new-instance p0, Ljava/lang/IllegalStateException;

    new-instance p2, Ljava/lang/StringBuilder;

    invoke-direct {p2, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-direct {p0, p1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw p0

    :cond_2
    new-instance p0, Ljava/lang/IllegalStateException;

    new-instance p2, Ljava/lang/StringBuilder;

    invoke-direct {p2, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-direct {p0, p1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw p0

    :catchall_0
    move-exception p0

    monitor-exit v2
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw p0
.end method

.method public handleMessage(Landroid/os/Message;)Z
    .locals 3

    iget v0, p1, Landroid/os/Message;->what:I

    if-eqz v0, :cond_0

    const/4 p0, 0x0

    return p0

    :cond_0
    iget-object p1, p1, Landroid/os/Message;->obj:Ljava/lang/Object;

    check-cast p1, Lcom/google/android/gms/common/internal/g$a;

    iget-object v0, p0, Lcom/google/android/gms/common/internal/g;->LU:Ljava/util/HashMap;

    monitor-enter v0

    :try_start_0
    invoke-virtual {p1}, Lcom/google/android/gms/common/internal/g$a;->gY()Z

    move-result v1

    if-eqz v1, :cond_1

    iget-object v1, p0, Lcom/google/android/gms/common/internal/g;->mD:Landroid/content/Context;

    invoke-virtual {p1}, Lcom/google/android/gms/common/internal/g$a;->gW()Lcom/google/android/gms/common/internal/g$a$a;

    move-result-object v2

    invoke-virtual {v1, v2}, Landroid/content/Context;->unbindService(Landroid/content/ServiceConnection;)V

    iget-object p0, p0, Lcom/google/android/gms/common/internal/g;->LU:Ljava/util/HashMap;

    invoke-virtual {p1}, Lcom/google/android/gms/common/internal/g$a;->gX()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p0, p1}, Ljava/util/HashMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    :cond_1
    monitor-exit v0

    const/4 p0, 0x1

    return p0

    :catchall_0
    move-exception p0

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw p0
.end method
