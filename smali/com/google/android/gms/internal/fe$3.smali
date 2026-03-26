.class Lcom/google/android/gms/internal/fe$3;
.super Ljava/lang/Object;

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/google/android/gms/internal/fe;->f(J)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic tr:Lcom/google/android/gms/internal/fe;


# direct methods
.method constructor <init>(Lcom/google/android/gms/internal/fe;)V
    .locals 0

    iput-object p1, p0, Lcom/google/android/gms/internal/fe$3;->tr:Lcom/google/android/gms/internal/fe;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 8

    const-string v0, "Loading URL in WebView: "

    iget-object v1, p0, Lcom/google/android/gms/internal/fe$3;->tr:Lcom/google/android/gms/internal/fe;

    invoke-static {v1}, Lcom/google/android/gms/internal/fe;->a(Lcom/google/android/gms/internal/fe;)Ljava/lang/Object;

    move-result-object v1

    monitor-enter v1

    :try_start_0
    iget-object v2, p0, Lcom/google/android/gms/internal/fe$3;->tr:Lcom/google/android/gms/internal/fe;

    invoke-static {v2}, Lcom/google/android/gms/internal/fe;->c(Lcom/google/android/gms/internal/fe;)Lcom/google/android/gms/internal/fk;

    move-result-object v2

    iget v2, v2, Lcom/google/android/gms/internal/fk;->errorCode:I

    const/4 v3, -0x2

    if-eq v2, v3, :cond_0

    monitor-exit v1

    return-void

    :cond_0
    iget-object v2, p0, Lcom/google/android/gms/internal/fe$3;->tr:Lcom/google/android/gms/internal/fe;

    invoke-static {v2}, Lcom/google/android/gms/internal/fe;->d(Lcom/google/android/gms/internal/fe;)Lcom/google/android/gms/internal/gv;

    move-result-object v2

    invoke-virtual {v2}, Lcom/google/android/gms/internal/gv;->du()Lcom/google/android/gms/internal/gw;

    move-result-object v2

    iget-object v3, p0, Lcom/google/android/gms/internal/fe$3;->tr:Lcom/google/android/gms/internal/fe;

    invoke-virtual {v2, v3}, Lcom/google/android/gms/internal/gw;->a(Lcom/google/android/gms/internal/gw$a;)V

    iget-object v2, p0, Lcom/google/android/gms/internal/fe$3;->tr:Lcom/google/android/gms/internal/fe;

    invoke-static {v2}, Lcom/google/android/gms/internal/fe;->c(Lcom/google/android/gms/internal/fe;)Lcom/google/android/gms/internal/fk;

    move-result-object v2

    iget v2, v2, Lcom/google/android/gms/internal/fk;->errorCode:I

    const/4 v3, -0x3

    if-ne v2, v3, :cond_1

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v0, p0, Lcom/google/android/gms/internal/fe$3;->tr:Lcom/google/android/gms/internal/fe;

    invoke-static {v0}, Lcom/google/android/gms/internal/fe;->c(Lcom/google/android/gms/internal/fe;)Lcom/google/android/gms/internal/fk;

    move-result-object v0

    iget-object v0, v0, Lcom/google/android/gms/internal/fk;->rP:Ljava/lang/String;

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/google/android/gms/internal/gs;->V(Ljava/lang/String;)V

    iget-object v0, p0, Lcom/google/android/gms/internal/fe$3;->tr:Lcom/google/android/gms/internal/fe;

    invoke-static {v0}, Lcom/google/android/gms/internal/fe;->d(Lcom/google/android/gms/internal/fe;)Lcom/google/android/gms/internal/gv;

    move-result-object v0

    iget-object p0, p0, Lcom/google/android/gms/internal/fe$3;->tr:Lcom/google/android/gms/internal/fe;

    invoke-static {p0}, Lcom/google/android/gms/internal/fe;->c(Lcom/google/android/gms/internal/fe;)Lcom/google/android/gms/internal/fk;

    move-result-object p0

    iget-object p0, p0, Lcom/google/android/gms/internal/fk;->rP:Ljava/lang/String;

    invoke-virtual {v0, p0}, Lcom/google/android/gms/internal/gv;->loadUrl(Ljava/lang/String;)V

    goto :goto_0

    :cond_1
    const-string v0, "Loading HTML in WebView."

    invoke-static {v0}, Lcom/google/android/gms/internal/gs;->V(Ljava/lang/String;)V

    iget-object v0, p0, Lcom/google/android/gms/internal/fe$3;->tr:Lcom/google/android/gms/internal/fe;

    invoke-static {v0}, Lcom/google/android/gms/internal/fe;->d(Lcom/google/android/gms/internal/fe;)Lcom/google/android/gms/internal/gv;

    move-result-object v2

    iget-object v0, p0, Lcom/google/android/gms/internal/fe$3;->tr:Lcom/google/android/gms/internal/fe;

    invoke-static {v0}, Lcom/google/android/gms/internal/fe;->c(Lcom/google/android/gms/internal/fe;)Lcom/google/android/gms/internal/fk;

    move-result-object v0

    iget-object v0, v0, Lcom/google/android/gms/internal/fk;->rP:Ljava/lang/String;

    invoke-static {v0}, Lcom/google/android/gms/internal/gj;->L(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    iget-object p0, p0, Lcom/google/android/gms/internal/fe$3;->tr:Lcom/google/android/gms/internal/fe;

    invoke-static {p0}, Lcom/google/android/gms/internal/fe;->c(Lcom/google/android/gms/internal/fe;)Lcom/google/android/gms/internal/fk;

    move-result-object p0

    iget-object v4, p0, Lcom/google/android/gms/internal/fk;->tG:Ljava/lang/String;

    const-string v5, "text/html"

    const-string v6, "UTF-8"

    const/4 v7, 0x0

    invoke-virtual/range {v2 .. v7}, Lcom/google/android/gms/internal/gv;->loadDataWithBaseURL(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    :goto_0
    monitor-exit v1

    return-void

    :catchall_0
    move-exception p0

    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw p0
.end method
