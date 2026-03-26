.class Lcom/google/android/gms/internal/af$6;
.super Ljava/lang/Object;

# interfaces
.implements Lcom/google/android/gms/internal/by;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/google/android/gms/internal/af;->b(Lcom/google/android/gms/internal/ah;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic mT:Lcom/google/android/gms/internal/af;


# direct methods
.method constructor <init>(Lcom/google/android/gms/internal/af;)V
    .locals 0

    iput-object p1, p0, Lcom/google/android/gms/internal/af$6;->mT:Lcom/google/android/gms/internal/af;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public a(Lcom/google/android/gms/internal/gv;Ljava/util/Map;)V
    .locals 0
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

    iget-object p1, p0, Lcom/google/android/gms/internal/af$6;->mT:Lcom/google/android/gms/internal/af;

    invoke-virtual {p1, p2}, Lcom/google/android/gms/internal/af;->a(Ljava/util/Map;)Z

    move-result p1

    if-nez p1, :cond_0

    return-void

    :cond_0
    new-instance p1, Ljava/lang/StringBuilder;

    const-string p2, "Received request to untrack: "

    invoke-direct {p1, p2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object p2, p0, Lcom/google/android/gms/internal/af$6;->mT:Lcom/google/android/gms/internal/af;

    invoke-static {p2}, Lcom/google/android/gms/internal/af;->b(Lcom/google/android/gms/internal/af;)Lcom/google/android/gms/internal/ad;

    move-result-object p2

    invoke-virtual {p2}, Lcom/google/android/gms/internal/ad;->aC()Ljava/lang/String;

    move-result-object p2

    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {p1}, Lcom/google/android/gms/internal/gs;->S(Ljava/lang/String;)V

    iget-object p0, p0, Lcom/google/android/gms/internal/af$6;->mT:Lcom/google/android/gms/internal/af;

    invoke-virtual {p0}, Lcom/google/android/gms/internal/af;->destroy()V

    return-void
.end method
