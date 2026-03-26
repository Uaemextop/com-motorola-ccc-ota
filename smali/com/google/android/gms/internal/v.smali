.class public Lcom/google/android/gms/internal/v;
.super Ljava/lang/Object;


# annotations
.annotation runtime Lcom/google/android/gms/internal/ez;
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/google/android/gms/internal/v$b;,
        Lcom/google/android/gms/internal/v$a;
    }
.end annotation


# instance fields
.field private lZ:Lcom/google/android/gms/internal/v$a;

.field private ma:Z

.field private mb:Z


# direct methods
.method public constructor <init>()V
    .locals 3

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    invoke-static {}, Lcom/google/android/gms/internal/gb;->bD()Landroid/os/Bundle;

    move-result-object v0

    const/4 v1, 0x0

    if-eqz v0, :cond_0

    const-string v2, "gads:block_autoclicks"

    invoke-virtual {v0, v2, v1}, Landroid/os/Bundle;->getBoolean(Ljava/lang/String;Z)Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 v1, 0x1

    :cond_0
    iput-boolean v1, p0, Lcom/google/android/gms/internal/v;->mb:Z

    return-void
.end method

.method public constructor <init>(Z)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-boolean p1, p0, Lcom/google/android/gms/internal/v;->mb:Z

    return-void
.end method


# virtual methods
.method public a(Lcom/google/android/gms/internal/v$a;)V
    .locals 0

    iput-object p1, p0, Lcom/google/android/gms/internal/v;->lZ:Lcom/google/android/gms/internal/v$a;

    return-void
.end method

.method public ar()V
    .locals 1

    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/google/android/gms/internal/v;->ma:Z

    return-void
.end method

.method public av()Z
    .locals 1

    iget-boolean v0, p0, Lcom/google/android/gms/internal/v;->mb:Z

    if-eqz v0, :cond_1

    iget-boolean p0, p0, Lcom/google/android/gms/internal/v;->ma:Z

    if-eqz p0, :cond_0

    goto :goto_0

    :cond_0
    const/4 p0, 0x0

    goto :goto_1

    :cond_1
    :goto_0
    const/4 p0, 0x1

    :goto_1
    return p0
.end method

.method public d(Ljava/lang/String;)V
    .locals 1

    const-string v0, "Action was blocked because no click was detected."

    invoke-static {v0}, Lcom/google/android/gms/internal/gs;->S(Ljava/lang/String;)V

    iget-object p0, p0, Lcom/google/android/gms/internal/v;->lZ:Lcom/google/android/gms/internal/v$a;

    if-eqz p0, :cond_0

    invoke-interface {p0, p1}, Lcom/google/android/gms/internal/v$a;->e(Ljava/lang/String;)V

    :cond_0
    return-void
.end method
