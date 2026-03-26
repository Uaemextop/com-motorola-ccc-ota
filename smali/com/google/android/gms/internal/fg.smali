.class public abstract Lcom/google/android/gms/internal/fg;
.super Lcom/google/android/gms/internal/gg;


# annotations
.annotation runtime Lcom/google/android/gms/internal/ez;
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/google/android/gms/internal/fg$b;,
        Lcom/google/android/gms/internal/fg$a;
    }
.end annotation


# instance fields
.field private final pQ:Lcom/google/android/gms/internal/fi;

.field private final tu:Lcom/google/android/gms/internal/ff$a;


# direct methods
.method public constructor <init>(Lcom/google/android/gms/internal/fi;Lcom/google/android/gms/internal/ff$a;)V
    .locals 0

    invoke-direct {p0}, Lcom/google/android/gms/internal/gg;-><init>()V

    iput-object p1, p0, Lcom/google/android/gms/internal/fg;->pQ:Lcom/google/android/gms/internal/fi;

    iput-object p2, p0, Lcom/google/android/gms/internal/fg;->tu:Lcom/google/android/gms/internal/ff$a;

    return-void
.end method

.method private static a(Lcom/google/android/gms/internal/fm;Lcom/google/android/gms/internal/fi;)Lcom/google/android/gms/internal/fk;
    .locals 2

    const-string v0, "Could not fetch ad response from ad request service due to an Exception."

    const/4 v1, 0x0

    :try_start_0
    invoke-interface {p0, p1}, Lcom/google/android/gms/internal/fm;->b(Lcom/google/android/gms/internal/fi;)Lcom/google/android/gms/internal/fk;

    move-result-object p0
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_2
    .catch Ljava/lang/NullPointerException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/lang/SecurityException; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    return-object p0

    :catchall_0
    move-exception p0

    invoke-static {p0}, Lcom/google/android/gms/internal/gb;->e(Ljava/lang/Throwable;)V

    return-object v1

    :catch_0
    move-exception p0

    invoke-static {v0, p0}, Lcom/google/android/gms/internal/gs;->d(Ljava/lang/String;Ljava/lang/Throwable;)V

    return-object v1

    :catch_1
    move-exception p0

    invoke-static {v0, p0}, Lcom/google/android/gms/internal/gs;->d(Ljava/lang/String;Ljava/lang/Throwable;)V

    return-object v1

    :catch_2
    move-exception p0

    const-string p1, "Could not fetch ad response from ad request service."

    invoke-static {p1, p0}, Lcom/google/android/gms/internal/gs;->d(Ljava/lang/String;Ljava/lang/Throwable;)V

    return-object v1
.end method


# virtual methods
.method public abstract cC()V
.end method

.method public abstract cD()Lcom/google/android/gms/internal/fm;
.end method

.method public final co()V
    .locals 3

    :try_start_0
    invoke-virtual {p0}, Lcom/google/android/gms/internal/fg;->cD()Lcom/google/android/gms/internal/fm;

    move-result-object v0

    const/4 v1, 0x0

    if-nez v0, :cond_0

    new-instance v0, Lcom/google/android/gms/internal/fk;

    invoke-direct {v0, v1}, Lcom/google/android/gms/internal/fk;-><init>(I)V

    goto :goto_0

    :cond_0
    iget-object v2, p0, Lcom/google/android/gms/internal/fg;->pQ:Lcom/google/android/gms/internal/fi;

    invoke-static {v0, v2}, Lcom/google/android/gms/internal/fg;->a(Lcom/google/android/gms/internal/fm;Lcom/google/android/gms/internal/fi;)Lcom/google/android/gms/internal/fk;

    move-result-object v0

    if-nez v0, :cond_1

    new-instance v0, Lcom/google/android/gms/internal/fk;

    invoke-direct {v0, v1}, Lcom/google/android/gms/internal/fk;-><init>(I)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    :cond_1
    :goto_0
    invoke-virtual {p0}, Lcom/google/android/gms/internal/fg;->cC()V

    iget-object p0, p0, Lcom/google/android/gms/internal/fg;->tu:Lcom/google/android/gms/internal/ff$a;

    invoke-interface {p0, v0}, Lcom/google/android/gms/internal/ff$a;->a(Lcom/google/android/gms/internal/fk;)V

    return-void

    :catchall_0
    move-exception v0

    invoke-virtual {p0}, Lcom/google/android/gms/internal/fg;->cC()V

    throw v0
.end method

.method public final onStop()V
    .locals 0

    invoke-virtual {p0}, Lcom/google/android/gms/internal/fg;->cC()V

    return-void
.end method
