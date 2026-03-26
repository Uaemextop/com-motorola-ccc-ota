.class Lcom/google/android/gms/internal/ft$1;
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

    iput-object p1, p0, Lcom/google/android/gms/internal/ft$1;->uu:Lcom/google/android/gms/internal/ft;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public a(Lcom/google/android/gms/internal/gv;Ljava/util/Map;)V
    .locals 3
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

    const-string p1, "Invalid "

    iget-object v0, p0, Lcom/google/android/gms/internal/ft$1;->uu:Lcom/google/android/gms/internal/ft;

    invoke-static {v0}, Lcom/google/android/gms/internal/ft;->a(Lcom/google/android/gms/internal/ft;)Ljava/lang/Object;

    move-result-object v0

    monitor-enter v0

    :try_start_0
    iget-object v1, p0, Lcom/google/android/gms/internal/ft$1;->uu:Lcom/google/android/gms/internal/ft;

    invoke-static {v1}, Lcom/google/android/gms/internal/ft;->b(Lcom/google/android/gms/internal/ft;)Lcom/google/android/gms/internal/gk;

    move-result-object v1

    invoke-virtual {v1}, Lcom/google/android/gms/internal/gk;->isDone()Z

    move-result v1

    if-eqz v1, :cond_0

    monitor-exit v0

    return-void

    :cond_0
    new-instance v1, Lcom/google/android/gms/internal/fv;

    const/4 v2, 0x1

    invoke-direct {v1, v2, p2}, Lcom/google/android/gms/internal/fv;-><init>(ILjava/util/Map;)V

    new-instance p2, Ljava/lang/StringBuilder;

    invoke-direct {p2, p1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1}, Lcom/google/android/gms/internal/fv;->getType()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    const-string p2, " request error: "

    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {v1}, Lcom/google/android/gms/internal/fv;->cL()Ljava/util/List;

    move-result-object p2

    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {p1}, Lcom/google/android/gms/internal/gs;->W(Ljava/lang/String;)V

    iget-object p0, p0, Lcom/google/android/gms/internal/ft$1;->uu:Lcom/google/android/gms/internal/ft;

    invoke-static {p0}, Lcom/google/android/gms/internal/ft;->b(Lcom/google/android/gms/internal/ft;)Lcom/google/android/gms/internal/gk;

    move-result-object p0

    invoke-virtual {p0, v1}, Lcom/google/android/gms/internal/gk;->a(Ljava/lang/Object;)V

    monitor-exit v0

    return-void

    :catchall_0
    move-exception p0

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw p0
.end method
