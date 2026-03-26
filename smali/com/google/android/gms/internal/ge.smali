.class public Lcom/google/android/gms/internal/ge;
.super Ljava/lang/Object;


# annotations
.annotation runtime Lcom/google/android/gms/internal/ez;
.end annotation


# instance fields
.field private final mw:Ljava/lang/Object;

.field private final vA:Ljava/lang/String;

.field private final vx:Lcom/google/android/gms/internal/gb;

.field private wc:I

.field private wd:I


# direct methods
.method constructor <init>(Lcom/google/android/gms/internal/gb;Ljava/lang/String;)V
    .locals 1

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance v0, Ljava/lang/Object;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    iput-object v0, p0, Lcom/google/android/gms/internal/ge;->mw:Ljava/lang/Object;

    iput-object p1, p0, Lcom/google/android/gms/internal/ge;->vx:Lcom/google/android/gms/internal/gb;

    iput-object p2, p0, Lcom/google/android/gms/internal/ge;->vA:Ljava/lang/String;

    return-void
.end method

.method public constructor <init>(Ljava/lang/String;)V
    .locals 1

    invoke-static {}, Lcom/google/android/gms/internal/gb;->cU()Lcom/google/android/gms/internal/gb;

    move-result-object v0

    invoke-direct {p0, v0, p1}, Lcom/google/android/gms/internal/ge;-><init>(Lcom/google/android/gms/internal/gb;Ljava/lang/String;)V

    return-void
.end method


# virtual methods
.method public d(II)V
    .locals 1

    iget-object v0, p0, Lcom/google/android/gms/internal/ge;->mw:Ljava/lang/Object;

    monitor-enter v0

    :try_start_0
    iput p1, p0, Lcom/google/android/gms/internal/ge;->wc:I

    iput p2, p0, Lcom/google/android/gms/internal/ge;->wd:I

    iget-object p1, p0, Lcom/google/android/gms/internal/ge;->vx:Lcom/google/android/gms/internal/gb;

    iget-object p2, p0, Lcom/google/android/gms/internal/ge;->vA:Ljava/lang/String;

    invoke-virtual {p1, p2, p0}, Lcom/google/android/gms/internal/gb;->a(Ljava/lang/String;Lcom/google/android/gms/internal/ge;)V

    monitor-exit v0

    return-void

    :catchall_0
    move-exception p0

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw p0
.end method

.method public toBundle()Landroid/os/Bundle;
    .locals 4

    iget-object v0, p0, Lcom/google/android/gms/internal/ge;->mw:Ljava/lang/Object;

    monitor-enter v0

    :try_start_0
    new-instance v1, Landroid/os/Bundle;

    invoke-direct {v1}, Landroid/os/Bundle;-><init>()V

    const-string v2, "pmnli"

    iget v3, p0, Lcom/google/android/gms/internal/ge;->wc:I

    invoke-virtual {v1, v2, v3}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    const-string v2, "pmnll"

    iget p0, p0, Lcom/google/android/gms/internal/ge;->wd:I

    invoke-virtual {v1, v2, p0}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    monitor-exit v0

    return-object v1

    :catchall_0
    move-exception p0

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw p0
.end method
