.class Lcom/google/android/gms/internal/ij$c$4;
.super Ljava/lang/Object;

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/google/android/gms/internal/ij$c;->k(Ljava/lang/String;Ljava/lang/String;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic EE:Ljava/lang/String;

.field final synthetic GT:Lcom/google/android/gms/internal/ij$c;

.field final synthetic GW:Ljava/lang/String;


# direct methods
.method constructor <init>(Lcom/google/android/gms/internal/ij$c;Ljava/lang/String;Ljava/lang/String;)V
    .locals 0

    iput-object p1, p0, Lcom/google/android/gms/internal/ij$c$4;->GT:Lcom/google/android/gms/internal/ij$c;

    iput-object p2, p0, Lcom/google/android/gms/internal/ij$c$4;->EE:Ljava/lang/String;

    iput-object p3, p0, Lcom/google/android/gms/internal/ij$c$4;->GW:Ljava/lang/String;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 3

    iget-object v0, p0, Lcom/google/android/gms/internal/ij$c$4;->GT:Lcom/google/android/gms/internal/ij$c;

    iget-object v0, v0, Lcom/google/android/gms/internal/ij$c;->GQ:Lcom/google/android/gms/internal/ij;

    invoke-static {v0}, Lcom/google/android/gms/internal/ij;->g(Lcom/google/android/gms/internal/ij;)Ljava/util/Map;

    move-result-object v0

    monitor-enter v0

    :try_start_0
    iget-object v1, p0, Lcom/google/android/gms/internal/ij$c$4;->GT:Lcom/google/android/gms/internal/ij$c;

    iget-object v1, v1, Lcom/google/android/gms/internal/ij$c;->GQ:Lcom/google/android/gms/internal/ij;

    invoke-static {v1}, Lcom/google/android/gms/internal/ij;->g(Lcom/google/android/gms/internal/ij;)Ljava/util/Map;

    move-result-object v1

    iget-object v2, p0, Lcom/google/android/gms/internal/ij$c$4;->EE:Ljava/lang/String;

    invoke-interface {v1, v2}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/google/android/gms/cast/Cast$MessageReceivedCallback;

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    if-eqz v1, :cond_0

    iget-object v0, p0, Lcom/google/android/gms/internal/ij$c$4;->GT:Lcom/google/android/gms/internal/ij$c;

    iget-object v0, v0, Lcom/google/android/gms/internal/ij$c;->GQ:Lcom/google/android/gms/internal/ij;

    invoke-static {v0}, Lcom/google/android/gms/internal/ij;->h(Lcom/google/android/gms/internal/ij;)Lcom/google/android/gms/cast/CastDevice;

    move-result-object v0

    iget-object v2, p0, Lcom/google/android/gms/internal/ij$c$4;->EE:Ljava/lang/String;

    iget-object p0, p0, Lcom/google/android/gms/internal/ij$c$4;->GW:Ljava/lang/String;

    invoke-interface {v1, v0, v2, p0}, Lcom/google/android/gms/cast/Cast$MessageReceivedCallback;->onMessageReceived(Lcom/google/android/gms/cast/CastDevice;Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_0

    :cond_0
    invoke-static {}, Lcom/google/android/gms/internal/ij;->fH()Lcom/google/android/gms/internal/ip;

    move-result-object v0

    const-string v1, "Discarded message for unknown namespace \'%s\'"

    iget-object p0, p0, Lcom/google/android/gms/internal/ij$c$4;->EE:Ljava/lang/String;

    filled-new-array {p0}, [Ljava/lang/Object;

    move-result-object p0

    invoke-virtual {v0, v1, p0}, Lcom/google/android/gms/internal/ip;->b(Ljava/lang/String;[Ljava/lang/Object;)V

    :goto_0
    return-void

    :catchall_0
    move-exception p0

    :try_start_1
    monitor-exit v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw p0
.end method
