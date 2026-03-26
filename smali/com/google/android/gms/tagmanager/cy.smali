.class Lcom/google/android/gms/tagmanager/cy;
.super Lcom/google/android/gms/tagmanager/cx;


# static fields
.field private static arA:Lcom/google/android/gms/tagmanager/cy;

.field private static final yc:Ljava/lang/Object;


# instance fields
.field private arq:Landroid/content/Context;

.field private arr:Lcom/google/android/gms/tagmanager/at;

.field private volatile ars:Lcom/google/android/gms/tagmanager/ar;

.field private art:I

.field private aru:Z

.field private arv:Z

.field private arw:Z

.field private arx:Lcom/google/android/gms/tagmanager/au;

.field private ary:Lcom/google/android/gms/tagmanager/bo;

.field private arz:Z

.field private connected:Z

.field private handler:Landroid/os/Handler;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    new-instance v0, Ljava/lang/Object;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    sput-object v0, Lcom/google/android/gms/tagmanager/cy;->yc:Ljava/lang/Object;

    return-void
.end method

.method private constructor <init>()V
    .locals 2

    invoke-direct {p0}, Lcom/google/android/gms/tagmanager/cx;-><init>()V

    const v0, 0x1b7740

    iput v0, p0, Lcom/google/android/gms/tagmanager/cy;->art:I

    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/google/android/gms/tagmanager/cy;->aru:Z

    const/4 v1, 0x0

    iput-boolean v1, p0, Lcom/google/android/gms/tagmanager/cy;->arv:Z

    iput-boolean v0, p0, Lcom/google/android/gms/tagmanager/cy;->connected:Z

    iput-boolean v0, p0, Lcom/google/android/gms/tagmanager/cy;->arw:Z

    new-instance v0, Lcom/google/android/gms/tagmanager/cy$1;

    invoke-direct {v0, p0}, Lcom/google/android/gms/tagmanager/cy$1;-><init>(Lcom/google/android/gms/tagmanager/cy;)V

    iput-object v0, p0, Lcom/google/android/gms/tagmanager/cy;->arx:Lcom/google/android/gms/tagmanager/au;

    iput-boolean v1, p0, Lcom/google/android/gms/tagmanager/cy;->arz:Z

    return-void
.end method

.method static synthetic a(Lcom/google/android/gms/tagmanager/cy;)Z
    .locals 0

    iget-boolean p0, p0, Lcom/google/android/gms/tagmanager/cy;->connected:Z

    return p0
.end method

.method static synthetic b(Lcom/google/android/gms/tagmanager/cy;)I
    .locals 0

    iget p0, p0, Lcom/google/android/gms/tagmanager/cy;->art:I

    return p0
.end method

.method static synthetic c(Lcom/google/android/gms/tagmanager/cy;)Z
    .locals 0

    iget-boolean p0, p0, Lcom/google/android/gms/tagmanager/cy;->arz:Z

    return p0
.end method

.method static synthetic d(Lcom/google/android/gms/tagmanager/cy;)Landroid/os/Handler;
    .locals 0

    iget-object p0, p0, Lcom/google/android/gms/tagmanager/cy;->handler:Landroid/os/Handler;

    return-object p0
.end method

.method static synthetic e(Lcom/google/android/gms/tagmanager/cy;)Lcom/google/android/gms/tagmanager/at;
    .locals 0

    iget-object p0, p0, Lcom/google/android/gms/tagmanager/cy;->arr:Lcom/google/android/gms/tagmanager/at;

    return-object p0
.end method

.method private ea()V
    .locals 1

    new-instance v0, Lcom/google/android/gms/tagmanager/bo;

    invoke-direct {v0, p0}, Lcom/google/android/gms/tagmanager/bo;-><init>(Lcom/google/android/gms/tagmanager/cx;)V

    iput-object v0, p0, Lcom/google/android/gms/tagmanager/cy;->ary:Lcom/google/android/gms/tagmanager/bo;

    iget-object p0, p0, Lcom/google/android/gms/tagmanager/cy;->arq:Landroid/content/Context;

    invoke-virtual {v0, p0}, Lcom/google/android/gms/tagmanager/bo;->z(Landroid/content/Context;)V

    return-void
.end method

.method private eb()V
    .locals 4

    new-instance v0, Landroid/os/Handler;

    iget-object v1, p0, Lcom/google/android/gms/tagmanager/cy;->arq:Landroid/content/Context;

    invoke-virtual {v1}, Landroid/content/Context;->getMainLooper()Landroid/os/Looper;

    move-result-object v1

    new-instance v2, Lcom/google/android/gms/tagmanager/cy$2;

    invoke-direct {v2, p0}, Lcom/google/android/gms/tagmanager/cy$2;-><init>(Lcom/google/android/gms/tagmanager/cy;)V

    invoke-direct {v0, v1, v2}, Landroid/os/Handler;-><init>(Landroid/os/Looper;Landroid/os/Handler$Callback;)V

    iput-object v0, p0, Lcom/google/android/gms/tagmanager/cy;->handler:Landroid/os/Handler;

    iget v1, p0, Lcom/google/android/gms/tagmanager/cy;->art:I

    if-lez v1, :cond_0

    const/4 v1, 0x1

    sget-object v2, Lcom/google/android/gms/tagmanager/cy;->yc:Ljava/lang/Object;

    invoke-virtual {v0, v1, v2}, Landroid/os/Handler;->obtainMessage(ILjava/lang/Object;)Landroid/os/Message;

    move-result-object v1

    iget p0, p0, Lcom/google/android/gms/tagmanager/cy;->art:I

    int-to-long v2, p0

    invoke-virtual {v0, v1, v2, v3}, Landroid/os/Handler;->sendMessageDelayed(Landroid/os/Message;J)Z

    :cond_0
    return-void
.end method

.method static synthetic ee()Ljava/lang/Object;
    .locals 1

    sget-object v0, Lcom/google/android/gms/tagmanager/cy;->yc:Ljava/lang/Object;

    return-object v0
.end method

.method public static pw()Lcom/google/android/gms/tagmanager/cy;
    .locals 1

    sget-object v0, Lcom/google/android/gms/tagmanager/cy;->arA:Lcom/google/android/gms/tagmanager/cy;

    if-nez v0, :cond_0

    new-instance v0, Lcom/google/android/gms/tagmanager/cy;

    invoke-direct {v0}, Lcom/google/android/gms/tagmanager/cy;-><init>()V

    sput-object v0, Lcom/google/android/gms/tagmanager/cy;->arA:Lcom/google/android/gms/tagmanager/cy;

    :cond_0
    sget-object v0, Lcom/google/android/gms/tagmanager/cy;->arA:Lcom/google/android/gms/tagmanager/cy;

    return-object v0
.end method


# virtual methods
.method declared-synchronized A(Z)V
    .locals 1

    monitor-enter p0

    :try_start_0
    iget-boolean v0, p0, Lcom/google/android/gms/tagmanager/cy;->arz:Z

    invoke-virtual {p0, v0, p1}, Lcom/google/android/gms/tagmanager/cy;->a(ZZ)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit p0

    return-void

    :catchall_0
    move-exception p1

    monitor-exit p0

    throw p1
.end method

.method declared-synchronized a(Landroid/content/Context;Lcom/google/android/gms/tagmanager/ar;)V
    .locals 1

    monitor-enter p0

    :try_start_0
    iget-object v0, p0, Lcom/google/android/gms/tagmanager/cy;->arq:Landroid/content/Context;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    if-eqz v0, :cond_0

    monitor-exit p0

    return-void

    :cond_0
    :try_start_1
    invoke-virtual {p1}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object p1

    iput-object p1, p0, Lcom/google/android/gms/tagmanager/cy;->arq:Landroid/content/Context;

    iget-object p1, p0, Lcom/google/android/gms/tagmanager/cy;->ars:Lcom/google/android/gms/tagmanager/ar;

    if-nez p1, :cond_1

    iput-object p2, p0, Lcom/google/android/gms/tagmanager/cy;->ars:Lcom/google/android/gms/tagmanager/ar;
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    :cond_1
    monitor-exit p0

    return-void

    :catchall_0
    move-exception p1

    monitor-exit p0

    throw p1
.end method

.method declared-synchronized a(ZZ)V
    .locals 5

    const-string v0, "PowerSaveMode "

    monitor-enter p0

    :try_start_0
    iget-boolean v1, p0, Lcom/google/android/gms/tagmanager/cy;->arz:Z

    if-ne v1, p1, :cond_0

    iget-boolean v1, p0, Lcom/google/android/gms/tagmanager/cy;->connected:Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    if-ne v1, p2, :cond_0

    monitor-exit p0

    return-void

    :cond_0
    const/4 v1, 0x1

    if-nez p1, :cond_1

    if-nez p2, :cond_2

    :cond_1
    :try_start_1
    iget v2, p0, Lcom/google/android/gms/tagmanager/cy;->art:I

    if-lez v2, :cond_2

    iget-object v2, p0, Lcom/google/android/gms/tagmanager/cy;->handler:Landroid/os/Handler;

    sget-object v3, Lcom/google/android/gms/tagmanager/cy;->yc:Ljava/lang/Object;

    invoke-virtual {v2, v1, v3}, Landroid/os/Handler;->removeMessages(ILjava/lang/Object;)V

    :cond_2
    if-nez p1, :cond_3

    if-eqz p2, :cond_3

    iget v2, p0, Lcom/google/android/gms/tagmanager/cy;->art:I

    if-lez v2, :cond_3

    iget-object v2, p0, Lcom/google/android/gms/tagmanager/cy;->handler:Landroid/os/Handler;

    sget-object v3, Lcom/google/android/gms/tagmanager/cy;->yc:Ljava/lang/Object;

    invoke-virtual {v2, v1, v3}, Landroid/os/Handler;->obtainMessage(ILjava/lang/Object;)Landroid/os/Message;

    move-result-object v1

    iget v3, p0, Lcom/google/android/gms/tagmanager/cy;->art:I

    int-to-long v3, v3

    invoke-virtual {v2, v1, v3, v4}, Landroid/os/Handler;->sendMessageDelayed(Landroid/os/Message;J)Z

    :cond_3
    if-nez p1, :cond_5

    if-nez p2, :cond_4

    goto :goto_0

    :cond_4
    const-string v1, "terminated."

    goto :goto_1

    :cond_5
    :goto_0
    const-string v1, "initiated."

    :goto_1
    invoke-virtual {v0, v1}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/google/android/gms/tagmanager/bh;->V(Ljava/lang/String;)V

    iput-boolean p1, p0, Lcom/google/android/gms/tagmanager/cy;->arz:Z

    iput-boolean p2, p0, Lcom/google/android/gms/tagmanager/cy;->connected:Z
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    monitor-exit p0

    return-void

    :catchall_0
    move-exception p1

    monitor-exit p0

    throw p1
.end method

.method public declared-synchronized dispatch()V
    .locals 2

    monitor-enter p0

    :try_start_0
    iget-boolean v0, p0, Lcom/google/android/gms/tagmanager/cy;->arv:Z

    if-nez v0, :cond_0

    const-string v0, "Dispatch call queued. Dispatch will run once initialization is complete."

    invoke-static {v0}, Lcom/google/android/gms/tagmanager/bh;->V(Ljava/lang/String;)V

    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/google/android/gms/tagmanager/cy;->aru:Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit p0

    return-void

    :cond_0
    :try_start_1
    iget-object v0, p0, Lcom/google/android/gms/tagmanager/cy;->ars:Lcom/google/android/gms/tagmanager/ar;

    new-instance v1, Lcom/google/android/gms/tagmanager/cy$3;

    invoke-direct {v1, p0}, Lcom/google/android/gms/tagmanager/cy$3;-><init>(Lcom/google/android/gms/tagmanager/cy;)V

    invoke-interface {v0, v1}, Lcom/google/android/gms/tagmanager/ar;->b(Ljava/lang/Runnable;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    monitor-exit p0

    return-void

    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method declared-synchronized ed()V
    .locals 3

    monitor-enter p0

    :try_start_0
    iget-boolean v0, p0, Lcom/google/android/gms/tagmanager/cy;->arz:Z

    if-nez v0, :cond_0

    iget-boolean v0, p0, Lcom/google/android/gms/tagmanager/cy;->connected:Z

    if-eqz v0, :cond_0

    iget v0, p0, Lcom/google/android/gms/tagmanager/cy;->art:I

    if-lez v0, :cond_0

    iget-object v0, p0, Lcom/google/android/gms/tagmanager/cy;->handler:Landroid/os/Handler;

    sget-object v1, Lcom/google/android/gms/tagmanager/cy;->yc:Ljava/lang/Object;

    const/4 v2, 0x1

    invoke-virtual {v0, v2, v1}, Landroid/os/Handler;->removeMessages(ILjava/lang/Object;)V

    iget-object v0, p0, Lcom/google/android/gms/tagmanager/cy;->handler:Landroid/os/Handler;

    invoke-virtual {v0, v2, v1}, Landroid/os/Handler;->obtainMessage(ILjava/lang/Object;)Landroid/os/Message;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/os/Handler;->sendMessage(Landroid/os/Message;)Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    :cond_0
    monitor-exit p0

    return-void

    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method declared-synchronized px()Lcom/google/android/gms/tagmanager/at;
    .locals 3

    monitor-enter p0

    :try_start_0
    iget-object v0, p0, Lcom/google/android/gms/tagmanager/cy;->arr:Lcom/google/android/gms/tagmanager/at;

    if-nez v0, :cond_1

    iget-object v0, p0, Lcom/google/android/gms/tagmanager/cy;->arq:Landroid/content/Context;

    if-eqz v0, :cond_0

    new-instance v0, Lcom/google/android/gms/tagmanager/cb;

    iget-object v1, p0, Lcom/google/android/gms/tagmanager/cy;->arx:Lcom/google/android/gms/tagmanager/au;

    iget-object v2, p0, Lcom/google/android/gms/tagmanager/cy;->arq:Landroid/content/Context;

    invoke-direct {v0, v1, v2}, Lcom/google/android/gms/tagmanager/cb;-><init>(Lcom/google/android/gms/tagmanager/au;Landroid/content/Context;)V

    iput-object v0, p0, Lcom/google/android/gms/tagmanager/cy;->arr:Lcom/google/android/gms/tagmanager/at;

    goto :goto_0

    :cond_0
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "Cant get a store unless we have a context"

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0

    :cond_1
    :goto_0
    iget-object v0, p0, Lcom/google/android/gms/tagmanager/cy;->handler:Landroid/os/Handler;

    if-nez v0, :cond_2

    invoke-direct {p0}, Lcom/google/android/gms/tagmanager/cy;->eb()V

    :cond_2
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/google/android/gms/tagmanager/cy;->arv:Z

    iget-boolean v0, p0, Lcom/google/android/gms/tagmanager/cy;->aru:Z

    if-eqz v0, :cond_3

    invoke-virtual {p0}, Lcom/google/android/gms/tagmanager/cy;->dispatch()V

    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/google/android/gms/tagmanager/cy;->aru:Z

    :cond_3
    iget-object v0, p0, Lcom/google/android/gms/tagmanager/cy;->ary:Lcom/google/android/gms/tagmanager/bo;

    if-nez v0, :cond_4

    iget-boolean v0, p0, Lcom/google/android/gms/tagmanager/cy;->arw:Z

    if-eqz v0, :cond_4

    invoke-direct {p0}, Lcom/google/android/gms/tagmanager/cy;->ea()V

    :cond_4
    iget-object v0, p0, Lcom/google/android/gms/tagmanager/cy;->arr:Lcom/google/android/gms/tagmanager/at;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit p0

    return-object v0

    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method
