.class abstract Lcom/google/android/gms/tagmanager/by;
.super Lcom/google/android/gms/tagmanager/cd;


# direct methods
.method public constructor <init>(Ljava/lang/String;)V
    .locals 0

    invoke-direct {p0, p1}, Lcom/google/android/gms/tagmanager/cd;-><init>(Ljava/lang/String;)V

    return-void
.end method


# virtual methods
.method protected a(Lcom/google/android/gms/internal/d$a;Lcom/google/android/gms/internal/d$a;Ljava/util/Map;)Z
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/google/android/gms/internal/d$a;",
            "Lcom/google/android/gms/internal/d$a;",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Lcom/google/android/gms/internal/d$a;",
            ">;)Z"
        }
    .end annotation

    invoke-static {p1}, Lcom/google/android/gms/tagmanager/di;->k(Lcom/google/android/gms/internal/d$a;)Lcom/google/android/gms/tagmanager/dh;

    move-result-object p1

    invoke-static {p2}, Lcom/google/android/gms/tagmanager/di;->k(Lcom/google/android/gms/internal/d$a;)Lcom/google/android/gms/tagmanager/dh;

    move-result-object p2

    invoke-static {}, Lcom/google/android/gms/tagmanager/di;->pI()Lcom/google/android/gms/tagmanager/dh;

    move-result-object v0

    if-eq p1, v0, :cond_1

    invoke-static {}, Lcom/google/android/gms/tagmanager/di;->pI()Lcom/google/android/gms/tagmanager/dh;

    move-result-object v0

    if-ne p2, v0, :cond_0

    goto :goto_0

    :cond_0
    invoke-virtual {p0, p1, p2, p3}, Lcom/google/android/gms/tagmanager/by;->a(Lcom/google/android/gms/tagmanager/dh;Lcom/google/android/gms/tagmanager/dh;Ljava/util/Map;)Z

    move-result p0

    goto :goto_1

    :cond_1
    :goto_0
    const/4 p0, 0x0

    :goto_1
    return p0
.end method

.method protected abstract a(Lcom/google/android/gms/tagmanager/dh;Lcom/google/android/gms/tagmanager/dh;Ljava/util/Map;)Z
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/google/android/gms/tagmanager/dh;",
            "Lcom/google/android/gms/tagmanager/dh;",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Lcom/google/android/gms/internal/d$a;",
            ">;)Z"
        }
    .end annotation
.end method
