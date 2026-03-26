.class Lcom/google/android/gms/internal/iq$a;
.super Ljava/lang/Object;

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/google/android/gms/internal/iq;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "a"
.end annotation


# instance fields
.field final synthetic Hu:Lcom/google/android/gms/internal/iq;


# direct methods
.method private constructor <init>(Lcom/google/android/gms/internal/iq;)V
    .locals 0

    iput-object p1, p0, Lcom/google/android/gms/internal/iq$a;->Hu:Lcom/google/android/gms/internal/iq;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method synthetic constructor <init>(Lcom/google/android/gms/internal/iq;Lcom/google/android/gms/internal/iq$1;)V
    .locals 0

    invoke-direct {p0, p1}, Lcom/google/android/gms/internal/iq$a;-><init>(Lcom/google/android/gms/internal/iq;)V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 6

    iget-object v0, p0, Lcom/google/android/gms/internal/iq$a;->Hu:Lcom/google/android/gms/internal/iq;

    const/4 v1, 0x0

    invoke-static {v0, v1}, Lcom/google/android/gms/internal/iq;->a(Lcom/google/android/gms/internal/iq;Z)Z

    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    move-result-wide v2

    iget-object v0, p0, Lcom/google/android/gms/internal/iq$a;->Hu:Lcom/google/android/gms/internal/iq;

    invoke-static {v0}, Lcom/google/android/gms/internal/iq;->a(Lcom/google/android/gms/internal/iq;)Ljava/util/List;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_0

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lcom/google/android/gms/internal/it;

    const/16 v5, 0x836

    invoke-virtual {v4, v2, v3, v5}, Lcom/google/android/gms/internal/it;->e(JI)Z

    goto :goto_0

    :cond_0
    sget-object v0, Lcom/google/android/gms/internal/it;->Hz:Ljava/lang/Object;

    monitor-enter v0

    :try_start_0
    iget-object v2, p0, Lcom/google/android/gms/internal/iq$a;->Hu:Lcom/google/android/gms/internal/iq;

    invoke-static {v2}, Lcom/google/android/gms/internal/iq;->a(Lcom/google/android/gms/internal/iq;)Ljava/util/List;

    move-result-object v2

    invoke-interface {v2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :cond_1
    :goto_1
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_2

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/google/android/gms/internal/it;

    invoke-virtual {v3}, Lcom/google/android/gms/internal/it;->fV()Z

    move-result v3

    if-eqz v3, :cond_1

    const/4 v1, 0x1

    goto :goto_1

    :cond_2
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    iget-object p0, p0, Lcom/google/android/gms/internal/iq$a;->Hu:Lcom/google/android/gms/internal/iq;

    invoke-static {p0, v1}, Lcom/google/android/gms/internal/iq;->b(Lcom/google/android/gms/internal/iq;Z)V

    return-void

    :catchall_0
    move-exception p0

    :try_start_1
    monitor-exit v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw p0
.end method
