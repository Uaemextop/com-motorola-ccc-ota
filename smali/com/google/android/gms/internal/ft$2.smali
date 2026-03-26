.class Lcom/google/android/gms/internal/ft$2;
.super Ljava/lang/Object;

# interfaces
.implements Lcom/google/android/gms/internal/by;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/google/android/gms/internal/ft;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic uu:Lcom/google/android/gms/internal/ft;


# direct methods
.method constructor <init>(Lcom/google/android/gms/internal/ft;)V
    .locals 0

    iput-object p1, p0, Lcom/google/android/gms/internal/ft$2;->uu:Lcom/google/android/gms/internal/ft;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public a(Lcom/google/android/gms/internal/gv;Ljava/util/Map;)V
    .locals 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/google/android/gms/internal/gv;",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    const-string v0, "Ad request URL modified to "

    iget-object v1, p0, Lcom/google/android/gms/internal/ft$2;->uu:Lcom/google/android/gms/internal/ft;

    invoke-static {v1}, Lcom/google/android/gms/internal/ft;->a(Lcom/google/android/gms/internal/ft;)Ljava/lang/Object;

    move-result-object v1

    monitor-enter v1

    :try_start_0
    iget-object v2, p0, Lcom/google/android/gms/internal/ft$2;->uu:Lcom/google/android/gms/internal/ft;

    invoke-static {v2}, Lcom/google/android/gms/internal/ft;->b(Lcom/google/android/gms/internal/ft;)Lcom/google/android/gms/internal/gk;

    move-result-object v2

    invoke-virtual {v2}, Lcom/google/android/gms/internal/gk;->isDone()Z

    move-result v2

    if-eqz v2, :cond_0

    monitor-exit v1

    return-void

    :cond_0
    new-instance v2, Lcom/google/android/gms/internal/fv;

    const/4 v3, -0x2

    invoke-direct {v2, v3, p2}, Lcom/google/android/gms/internal/fv;-><init>(ILjava/util/Map;)V

    invoke-virtual {v2}, Lcom/google/android/gms/internal/fv;->getUrl()Ljava/lang/String;

    move-result-object v3

    if-nez v3, :cond_1

    const-string p0, "URL missing in loadAdUrl GMSG."

    invoke-static {p0}, Lcom/google/android/gms/internal/gs;->W(Ljava/lang/String;)V

    monitor-exit v1

    return-void

    :cond_1
    const-string v4, "%40mediation_adapters%40"

    invoke-virtual {v3, v4}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v4

    if-eqz v4, :cond_2

    invoke-virtual {p1}, Lcom/google/android/gms/internal/gv;->getContext()Landroid/content/Context;

    move-result-object p1

    const-string v4, "check_adapters"

    invoke-interface {p2, v4}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p2

    check-cast p2, Ljava/lang/String;

    iget-object v4, p0, Lcom/google/android/gms/internal/ft$2;->uu:Lcom/google/android/gms/internal/ft;

    invoke-static {v4}, Lcom/google/android/gms/internal/ft;->c(Lcom/google/android/gms/internal/ft;)Ljava/lang/String;

    move-result-object v4

    invoke-static {p1, p2, v4}, Lcom/google/android/gms/internal/gf;->a(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    const-string p2, "%40mediation_adapters%40"

    invoke-virtual {v3, p2, p1}, Ljava/lang/String;->replaceAll(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v2, p1}, Lcom/google/android/gms/internal/fv;->setUrl(Ljava/lang/String;)V

    new-instance p2, Ljava/lang/StringBuilder;

    invoke-direct {p2, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {p1}, Lcom/google/android/gms/internal/gs;->V(Ljava/lang/String;)V

    :cond_2
    iget-object p0, p0, Lcom/google/android/gms/internal/ft$2;->uu:Lcom/google/android/gms/internal/ft;

    invoke-static {p0}, Lcom/google/android/gms/internal/ft;->b(Lcom/google/android/gms/internal/ft;)Lcom/google/android/gms/internal/gk;

    move-result-object p0

    invoke-virtual {p0, v2}, Lcom/google/android/gms/internal/gk;->a(Ljava/lang/Object;)V

    monitor-exit v1

    return-void

    :catchall_0
    move-exception p0

    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw p0
.end method
