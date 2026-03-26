.class Lcom/google/android/gms/internal/fe$2;
.super Ljava/lang/Object;

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/google/android/gms/internal/fe;->co()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic tr:Lcom/google/android/gms/internal/fe;

.field final synthetic ts:Lcom/google/android/gms/internal/fz;


# direct methods
.method constructor <init>(Lcom/google/android/gms/internal/fe;Lcom/google/android/gms/internal/fz;)V
    .locals 0

    iput-object p1, p0, Lcom/google/android/gms/internal/fe$2;->tr:Lcom/google/android/gms/internal/fe;

    iput-object p2, p0, Lcom/google/android/gms/internal/fe$2;->ts:Lcom/google/android/gms/internal/fz;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 2

    iget-object v0, p0, Lcom/google/android/gms/internal/fe$2;->tr:Lcom/google/android/gms/internal/fe;

    invoke-static {v0}, Lcom/google/android/gms/internal/fe;->a(Lcom/google/android/gms/internal/fe;)Ljava/lang/Object;

    move-result-object v0

    monitor-enter v0

    :try_start_0
    iget-object v1, p0, Lcom/google/android/gms/internal/fe$2;->tr:Lcom/google/android/gms/internal/fe;

    invoke-static {v1}, Lcom/google/android/gms/internal/fe;->b(Lcom/google/android/gms/internal/fe;)Lcom/google/android/gms/internal/fd$a;

    move-result-object v1

    iget-object p0, p0, Lcom/google/android/gms/internal/fe$2;->ts:Lcom/google/android/gms/internal/fz;

    invoke-interface {v1, p0}, Lcom/google/android/gms/internal/fd$a;->a(Lcom/google/android/gms/internal/fz;)V

    monitor-exit v0

    return-void

    :catchall_0
    move-exception p0

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw p0
.end method
