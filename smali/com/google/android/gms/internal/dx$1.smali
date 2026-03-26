.class Lcom/google/android/gms/internal/dx$1;
.super Ljava/lang/Object;

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/google/android/gms/internal/dx;->a(Lcom/google/android/gms/internal/ea;Ljava/lang/String;Ljava/lang/String;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic sr:Lcom/google/android/gms/internal/ea;

.field final synthetic ss:Landroid/content/Intent;

.field final synthetic st:Lcom/google/android/gms/internal/dx;


# direct methods
.method constructor <init>(Lcom/google/android/gms/internal/dx;Lcom/google/android/gms/internal/ea;Landroid/content/Intent;)V
    .locals 0

    iput-object p1, p0, Lcom/google/android/gms/internal/dx$1;->st:Lcom/google/android/gms/internal/dx;

    iput-object p2, p0, Lcom/google/android/gms/internal/dx$1;->sr:Lcom/google/android/gms/internal/ea;

    iput-object p3, p0, Lcom/google/android/gms/internal/dx$1;->ss:Landroid/content/Intent;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 9

    :try_start_0
    iget-object v0, p0, Lcom/google/android/gms/internal/dx$1;->st:Lcom/google/android/gms/internal/dx;

    invoke-static {v0}, Lcom/google/android/gms/internal/dx;->a(Lcom/google/android/gms/internal/dx;)Lcom/google/android/gms/internal/ee;

    move-result-object v0

    iget-object v1, p0, Lcom/google/android/gms/internal/dx$1;->sr:Lcom/google/android/gms/internal/ea;

    iget-object v1, v1, Lcom/google/android/gms/internal/ea;->sB:Ljava/lang/String;

    iget-object v2, p0, Lcom/google/android/gms/internal/dx$1;->ss:Landroid/content/Intent;

    const/4 v3, -0x1

    invoke-virtual {v0, v1, v3, v2}, Lcom/google/android/gms/internal/ee;->a(Ljava/lang/String;ILandroid/content/Intent;)Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/google/android/gms/internal/dx$1;->st:Lcom/google/android/gms/internal/dx;

    invoke-static {v0}, Lcom/google/android/gms/internal/dx;->c(Lcom/google/android/gms/internal/dx;)Lcom/google/android/gms/internal/el;

    move-result-object v0

    new-instance v8, Lcom/google/android/gms/internal/eb;

    iget-object v1, p0, Lcom/google/android/gms/internal/dx$1;->st:Lcom/google/android/gms/internal/dx;

    invoke-static {v1}, Lcom/google/android/gms/internal/dx;->b(Lcom/google/android/gms/internal/dx;)Landroid/content/Context;

    move-result-object v2

    iget-object v1, p0, Lcom/google/android/gms/internal/dx$1;->sr:Lcom/google/android/gms/internal/ea;

    iget-object v3, v1, Lcom/google/android/gms/internal/ea;->sC:Ljava/lang/String;

    iget-object v6, p0, Lcom/google/android/gms/internal/dx$1;->ss:Landroid/content/Intent;

    iget-object v7, p0, Lcom/google/android/gms/internal/dx$1;->sr:Lcom/google/android/gms/internal/ea;

    const/4 v4, 0x1

    const/4 v5, -0x1

    move-object v1, v8

    invoke-direct/range {v1 .. v7}, Lcom/google/android/gms/internal/eb;-><init>(Landroid/content/Context;Ljava/lang/String;ZILandroid/content/Intent;Lcom/google/android/gms/internal/ea;)V

    :goto_0
    invoke-interface {v0, v8}, Lcom/google/android/gms/internal/el;->a(Lcom/google/android/gms/internal/ek;)V

    goto :goto_1

    :cond_0
    iget-object v0, p0, Lcom/google/android/gms/internal/dx$1;->st:Lcom/google/android/gms/internal/dx;

    invoke-static {v0}, Lcom/google/android/gms/internal/dx;->c(Lcom/google/android/gms/internal/dx;)Lcom/google/android/gms/internal/el;

    move-result-object v0

    new-instance v8, Lcom/google/android/gms/internal/eb;

    iget-object v1, p0, Lcom/google/android/gms/internal/dx$1;->st:Lcom/google/android/gms/internal/dx;

    invoke-static {v1}, Lcom/google/android/gms/internal/dx;->b(Lcom/google/android/gms/internal/dx;)Landroid/content/Context;

    move-result-object v2

    iget-object v1, p0, Lcom/google/android/gms/internal/dx$1;->sr:Lcom/google/android/gms/internal/ea;

    iget-object v3, v1, Lcom/google/android/gms/internal/ea;->sC:Ljava/lang/String;

    iget-object v6, p0, Lcom/google/android/gms/internal/dx$1;->ss:Landroid/content/Intent;

    iget-object v7, p0, Lcom/google/android/gms/internal/dx$1;->sr:Lcom/google/android/gms/internal/ea;

    const/4 v4, 0x0

    const/4 v5, -0x1

    move-object v1, v8

    invoke-direct/range {v1 .. v7}, Lcom/google/android/gms/internal/eb;-><init>(Landroid/content/Context;Ljava/lang/String;ZILandroid/content/Intent;Lcom/google/android/gms/internal/ea;)V
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    const-string p0, "Fail to verify and dispatch pending transaction"

    invoke-static {p0}, Lcom/google/android/gms/internal/gs;->W(Ljava/lang/String;)V

    :goto_1
    return-void
.end method
