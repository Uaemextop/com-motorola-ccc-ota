.class public Lcom/google/android/gms/internal/nf;
.super Ljava/lang/Object;

# interfaces
.implements Lcom/google/android/gms/internal/ng$a;


# instance fields
.field private final akD:Lcom/google/android/gms/internal/ng;

.field private akE:Z


# direct methods
.method public constructor <init>(Landroid/content/Context;I)V
    .locals 1

    const/4 v0, 0x0

    invoke-direct {p0, p1, p2, v0}, Lcom/google/android/gms/internal/nf;-><init>(Landroid/content/Context;ILjava/lang/String;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;ILjava/lang/String;)V
    .locals 6

    const/4 v4, 0x0

    const/4 v5, 0x1

    move-object v0, p0

    move-object v1, p1

    move v2, p2

    move-object v3, p3

    invoke-direct/range {v0 .. v5}, Lcom/google/android/gms/internal/nf;-><init>(Landroid/content/Context;ILjava/lang/String;Ljava/lang/String;Z)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;ILjava/lang/String;Ljava/lang/String;Z)V
    .locals 8

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance v7, Lcom/google/android/gms/internal/ng;

    move-object v0, v7

    move-object v1, p1

    move v2, p2

    move-object v3, p3

    move-object v4, p4

    move-object v5, p0

    move v6, p5

    invoke-direct/range {v0 .. v6}, Lcom/google/android/gms/internal/ng;-><init>(Landroid/content/Context;ILjava/lang/String;Ljava/lang/String;Lcom/google/android/gms/internal/ng$a;Z)V

    iput-object v7, p0, Lcom/google/android/gms/internal/nf;->akD:Lcom/google/android/gms/internal/ng;

    const/4 p1, 0x1

    iput-boolean p1, p0, Lcom/google/android/gms/internal/nf;->akE:Z

    return-void
.end method

.method private mT()V
    .locals 1

    iget-boolean p0, p0, Lcom/google/android/gms/internal/nf;->akE:Z

    if-eqz p0, :cond_0

    return-void

    :cond_0
    new-instance p0, Ljava/lang/IllegalStateException;

    const-string v0, "Cannot reuse one-time logger after sending."

    invoke-direct {p0, v0}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw p0
.end method


# virtual methods
.method public varargs a(Ljava/lang/String;[B[Ljava/lang/String;)V
    .locals 0

    invoke-direct {p0}, Lcom/google/android/gms/internal/nf;->mT()V

    iget-object p0, p0, Lcom/google/android/gms/internal/nf;->akD:Lcom/google/android/gms/internal/ng;

    invoke-virtual {p0, p1, p2, p3}, Lcom/google/android/gms/internal/ng;->b(Ljava/lang/String;[B[Ljava/lang/String;)V

    return-void
.end method

.method public b(Landroid/app/PendingIntent;)V
    .locals 1

    new-instance p0, Ljava/lang/StringBuilder;

    const-string v0, "logger connection failed: "

    invoke-direct {p0, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    const-string p1, "OneTimePlayLogger"

    invoke-static {p1, p0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    return-void
.end method

.method public mU()V
    .locals 0

    iget-object p0, p0, Lcom/google/android/gms/internal/nf;->akD:Lcom/google/android/gms/internal/ng;

    invoke-virtual {p0}, Lcom/google/android/gms/internal/ng;->stop()V

    return-void
.end method

.method public mV()V
    .locals 1

    const-string p0, "OneTimePlayLogger"

    const-string v0, "logger connection failed"

    invoke-static {p0, v0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    return-void
.end method

.method public send()V
    .locals 1

    invoke-direct {p0}, Lcom/google/android/gms/internal/nf;->mT()V

    iget-object v0, p0, Lcom/google/android/gms/internal/nf;->akD:Lcom/google/android/gms/internal/ng;

    invoke-virtual {v0}, Lcom/google/android/gms/internal/ng;->start()V

    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/google/android/gms/internal/nf;->akE:Z

    return-void
.end method
