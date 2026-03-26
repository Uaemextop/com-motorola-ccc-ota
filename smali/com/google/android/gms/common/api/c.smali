.class public final Lcom/google/android/gms/common/api/c;
.super Ljava/lang/Object;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/google/android/gms/common/api/c$a;,
        Lcom/google/android/gms/common/api/c$b;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<",
        "L:Ljava/lang/Object;",
        ">",
        "Ljava/lang/Object;"
    }
.end annotation


# instance fields
.field private final Js:Lcom/google/android/gms/common/api/c$a;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/google/android/gms/common/api/c<",
            "T",
            "L;",
            ">.a;"
        }
    .end annotation
.end field

.field private volatile mListener:Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "T",
            "L;"
        }
    .end annotation
.end field


# direct methods
.method constructor <init>(Landroid/os/Looper;Ljava/lang/Object;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/os/Looper;",
            "T",
            "L;",
            ")V"
        }
    .end annotation

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance v0, Lcom/google/android/gms/common/api/c$a;

    invoke-direct {v0, p0, p1}, Lcom/google/android/gms/common/api/c$a;-><init>(Lcom/google/android/gms/common/api/c;Landroid/os/Looper;)V

    iput-object v0, p0, Lcom/google/android/gms/common/api/c;->Js:Lcom/google/android/gms/common/api/c$a;

    const-string p1, "Listener must not be null"

    invoke-static {p2, p1}, Lcom/google/android/gms/common/internal/o;->b(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    iput-object p1, p0, Lcom/google/android/gms/common/api/c;->mListener:Ljava/lang/Object;

    return-void
.end method


# virtual methods
.method public a(Lcom/google/android/gms/common/api/c$b;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/google/android/gms/common/api/c$b<",
            "T",
            "L;",
            ">;)V"
        }
    .end annotation

    const-string v0, "Notifier must not be null"

    invoke-static {p1, v0}, Lcom/google/android/gms/common/internal/o;->b(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    iget-object v0, p0, Lcom/google/android/gms/common/api/c;->Js:Lcom/google/android/gms/common/api/c$a;

    const/4 v1, 0x1

    invoke-virtual {v0, v1, p1}, Lcom/google/android/gms/common/api/c$a;->obtainMessage(ILjava/lang/Object;)Landroid/os/Message;

    move-result-object p1

    iget-object p0, p0, Lcom/google/android/gms/common/api/c;->Js:Lcom/google/android/gms/common/api/c$a;

    invoke-virtual {p0, p1}, Lcom/google/android/gms/common/api/c$a;->sendMessage(Landroid/os/Message;)Z

    return-void
.end method

.method b(Lcom/google/android/gms/common/api/c$b;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/google/android/gms/common/api/c$b<",
            "T",
            "L;",
            ">;)V"
        }
    .end annotation

    iget-object p0, p0, Lcom/google/android/gms/common/api/c;->mListener:Ljava/lang/Object;

    if-nez p0, :cond_0

    :goto_0
    invoke-interface {p1}, Lcom/google/android/gms/common/api/c$b;->gr()V

    goto :goto_1

    :cond_0
    :try_start_0
    invoke-interface {p1, p0}, Lcom/google/android/gms/common/api/c$b;->d(Ljava/lang/Object;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_1

    :catch_0
    move-exception p0

    const-string v0, "ListenerHolder"

    const-string v1, "Notifying listener failed"

    invoke-static {v0, v1, p0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto :goto_0

    :goto_1
    return-void
.end method

.method public clear()V
    .locals 1

    const/4 v0, 0x0

    iput-object v0, p0, Lcom/google/android/gms/common/api/c;->mListener:Ljava/lang/Object;

    return-void
.end method
