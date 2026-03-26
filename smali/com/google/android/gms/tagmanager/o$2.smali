.class Lcom/google/android/gms/tagmanager/o$2;
.super Ljava/lang/Object;

# interfaces
.implements Lcom/google/android/gms/tagmanager/o$a;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/google/android/gms/tagmanager/o;->T(Z)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic aoB:Lcom/google/android/gms/tagmanager/o;

.field final synthetic aoC:Z


# direct methods
.method constructor <init>(Lcom/google/android/gms/tagmanager/o;Z)V
    .locals 0

    iput-object p1, p0, Lcom/google/android/gms/tagmanager/o$2;->aoB:Lcom/google/android/gms/tagmanager/o;

    iput-boolean p2, p0, Lcom/google/android/gms/tagmanager/o$2;->aoC:Z

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public b(Lcom/google/android/gms/tagmanager/Container;)Z
    .locals 6

    iget-boolean v0, p0, Lcom/google/android/gms/tagmanager/o$2;->aoC:Z

    const/4 v1, 0x1

    if-eqz v0, :cond_1

    invoke-virtual {p1}, Lcom/google/android/gms/tagmanager/Container;->getLastRefreshTime()J

    move-result-wide v2

    const-wide/32 v4, 0x2932e00

    add-long/2addr v2, v4

    iget-object p0, p0, Lcom/google/android/gms/tagmanager/o$2;->aoB:Lcom/google/android/gms/tagmanager/o;

    invoke-static {p0}, Lcom/google/android/gms/tagmanager/o;->a(Lcom/google/android/gms/tagmanager/o;)Lcom/google/android/gms/internal/ju;

    move-result-object p0

    invoke-interface {p0}, Lcom/google/android/gms/internal/ju;->currentTimeMillis()J

    move-result-wide p0

    cmp-long p0, v2, p0

    if-ltz p0, :cond_0

    goto :goto_0

    :cond_0
    const/4 v1, 0x0

    :goto_0
    return v1

    :cond_1
    invoke-virtual {p1}, Lcom/google/android/gms/tagmanager/Container;->isDefault()Z

    move-result p0

    xor-int/2addr p0, v1

    return p0
.end method
