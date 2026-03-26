.class Lcom/google/android/gms/tagmanager/o$c;
.super Ljava/lang/Object;

# interfaces
.implements Lcom/google/android/gms/tagmanager/bg;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/google/android/gms/tagmanager/o;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "c"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Lcom/google/android/gms/tagmanager/bg<",
        "Lcom/google/android/gms/internal/c$j;",
        ">;"
    }
.end annotation


# instance fields
.field final synthetic aoB:Lcom/google/android/gms/tagmanager/o;


# direct methods
.method private constructor <init>(Lcom/google/android/gms/tagmanager/o;)V
    .locals 0

    iput-object p1, p0, Lcom/google/android/gms/tagmanager/o$c;->aoB:Lcom/google/android/gms/tagmanager/o;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method synthetic constructor <init>(Lcom/google/android/gms/tagmanager/o;Lcom/google/android/gms/tagmanager/o$1;)V
    .locals 0

    invoke-direct {p0, p1}, Lcom/google/android/gms/tagmanager/o$c;-><init>(Lcom/google/android/gms/tagmanager/o;)V

    return-void
.end method


# virtual methods
.method public a(Lcom/google/android/gms/tagmanager/bg$a;)V
    .locals 2

    iget-object p1, p0, Lcom/google/android/gms/tagmanager/o$c;->aoB:Lcom/google/android/gms/tagmanager/o;

    invoke-static {p1}, Lcom/google/android/gms/tagmanager/o;->f(Lcom/google/android/gms/tagmanager/o;)Lcom/google/android/gms/tagmanager/n;

    move-result-object p1

    if-eqz p1, :cond_0

    iget-object p1, p0, Lcom/google/android/gms/tagmanager/o$c;->aoB:Lcom/google/android/gms/tagmanager/o;

    invoke-static {p1}, Lcom/google/android/gms/tagmanager/o;->f(Lcom/google/android/gms/tagmanager/o;)Lcom/google/android/gms/tagmanager/n;

    move-result-object v0

    goto :goto_0

    :cond_0
    iget-object p1, p0, Lcom/google/android/gms/tagmanager/o$c;->aoB:Lcom/google/android/gms/tagmanager/o;

    sget-object v0, Lcom/google/android/gms/common/api/Status;->Jy:Lcom/google/android/gms/common/api/Status;

    invoke-virtual {p1, v0}, Lcom/google/android/gms/tagmanager/o;->aE(Lcom/google/android/gms/common/api/Status;)Lcom/google/android/gms/tagmanager/ContainerHolder;

    move-result-object v0

    :goto_0
    invoke-virtual {p1, v0}, Lcom/google/android/gms/tagmanager/o;->b(Lcom/google/android/gms/common/api/Result;)V

    iget-object p0, p0, Lcom/google/android/gms/tagmanager/o$c;->aoB:Lcom/google/android/gms/tagmanager/o;

    const-wide/32 v0, 0x36ee80

    invoke-static {p0, v0, v1}, Lcom/google/android/gms/tagmanager/o;->a(Lcom/google/android/gms/tagmanager/o;J)V

    return-void
.end method

.method public b(Lcom/google/android/gms/internal/c$j;)V
    .locals 6

    const-string v0, "setting refresh time to current time: "

    iget-object v1, p0, Lcom/google/android/gms/tagmanager/o$c;->aoB:Lcom/google/android/gms/tagmanager/o;

    monitor-enter v1

    :try_start_0
    iget-object v2, p1, Lcom/google/android/gms/internal/c$j;->gs:Lcom/google/android/gms/internal/c$f;

    if-nez v2, :cond_1

    iget-object v2, p0, Lcom/google/android/gms/tagmanager/o$c;->aoB:Lcom/google/android/gms/tagmanager/o;

    invoke-static {v2}, Lcom/google/android/gms/tagmanager/o;->c(Lcom/google/android/gms/tagmanager/o;)Lcom/google/android/gms/internal/c$j;

    move-result-object v2

    iget-object v2, v2, Lcom/google/android/gms/internal/c$j;->gs:Lcom/google/android/gms/internal/c$f;

    if-nez v2, :cond_0

    const-string p1, "Current resource is null; network resource is also null"

    invoke-static {p1}, Lcom/google/android/gms/tagmanager/bh;->T(Ljava/lang/String;)V

    iget-object p0, p0, Lcom/google/android/gms/tagmanager/o$c;->aoB:Lcom/google/android/gms/tagmanager/o;

    const-wide/32 v2, 0x36ee80

    invoke-static {p0, v2, v3}, Lcom/google/android/gms/tagmanager/o;->a(Lcom/google/android/gms/tagmanager/o;J)V

    monitor-exit v1

    return-void

    :cond_0
    iget-object v2, p0, Lcom/google/android/gms/tagmanager/o$c;->aoB:Lcom/google/android/gms/tagmanager/o;

    invoke-static {v2}, Lcom/google/android/gms/tagmanager/o;->c(Lcom/google/android/gms/tagmanager/o;)Lcom/google/android/gms/internal/c$j;

    move-result-object v2

    iget-object v2, v2, Lcom/google/android/gms/internal/c$j;->gs:Lcom/google/android/gms/internal/c$f;

    iput-object v2, p1, Lcom/google/android/gms/internal/c$j;->gs:Lcom/google/android/gms/internal/c$f;

    :cond_1
    iget-object v2, p0, Lcom/google/android/gms/tagmanager/o$c;->aoB:Lcom/google/android/gms/tagmanager/o;

    invoke-static {v2}, Lcom/google/android/gms/tagmanager/o;->a(Lcom/google/android/gms/tagmanager/o;)Lcom/google/android/gms/internal/ju;

    move-result-object v3

    invoke-interface {v3}, Lcom/google/android/gms/internal/ju;->currentTimeMillis()J

    move-result-wide v3

    const/4 v5, 0x0

    invoke-static {v2, p1, v3, v4, v5}, Lcom/google/android/gms/tagmanager/o;->a(Lcom/google/android/gms/tagmanager/o;Lcom/google/android/gms/internal/c$j;JZ)V

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v0, p0, Lcom/google/android/gms/tagmanager/o$c;->aoB:Lcom/google/android/gms/tagmanager/o;

    invoke-static {v0}, Lcom/google/android/gms/tagmanager/o;->d(Lcom/google/android/gms/tagmanager/o;)J

    move-result-wide v3

    invoke-virtual {v2, v3, v4}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/google/android/gms/tagmanager/bh;->V(Ljava/lang/String;)V

    iget-object v0, p0, Lcom/google/android/gms/tagmanager/o$c;->aoB:Lcom/google/android/gms/tagmanager/o;

    invoke-static {v0}, Lcom/google/android/gms/tagmanager/o;->e(Lcom/google/android/gms/tagmanager/o;)Z

    move-result v0

    if-nez v0, :cond_2

    iget-object p0, p0, Lcom/google/android/gms/tagmanager/o$c;->aoB:Lcom/google/android/gms/tagmanager/o;

    invoke-static {p0, p1}, Lcom/google/android/gms/tagmanager/o;->a(Lcom/google/android/gms/tagmanager/o;Lcom/google/android/gms/internal/c$j;)V

    :cond_2
    monitor-exit v1

    return-void

    :catchall_0
    move-exception p0

    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw p0
.end method

.method public synthetic l(Ljava/lang/Object;)V
    .locals 0

    check-cast p1, Lcom/google/android/gms/internal/c$j;

    invoke-virtual {p0, p1}, Lcom/google/android/gms/tagmanager/o$c;->b(Lcom/google/android/gms/internal/c$j;)V

    return-void
.end method

.method public ob()V
    .locals 0

    return-void
.end method
