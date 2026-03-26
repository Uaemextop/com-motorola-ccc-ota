.class Lcom/google/android/gms/games/internal/GamesClientImpl$GameClientEventIncrementCache;
.super Lcom/google/android/gms/games/internal/events/EventIncrementCache;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/google/android/gms/games/internal/GamesClientImpl;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "GameClientEventIncrementCache"
.end annotation


# instance fields
.field final synthetic WC:Lcom/google/android/gms/games/internal/GamesClientImpl;


# direct methods
.method public constructor <init>(Lcom/google/android/gms/games/internal/GamesClientImpl;)V
    .locals 1

    iput-object p1, p0, Lcom/google/android/gms/games/internal/GamesClientImpl$GameClientEventIncrementCache;->WC:Lcom/google/android/gms/games/internal/GamesClientImpl;

    invoke-virtual {p1}, Lcom/google/android/gms/games/internal/GamesClientImpl;->getContext()Landroid/content/Context;

    move-result-object p1

    invoke-virtual {p1}, Landroid/content/Context;->getMainLooper()Landroid/os/Looper;

    move-result-object p1

    const/16 v0, 0x3e8

    invoke-direct {p0, p1, v0}, Lcom/google/android/gms/games/internal/events/EventIncrementCache;-><init>(Landroid/os/Looper;I)V

    return-void
.end method


# virtual methods
.method protected q(Ljava/lang/String;I)V
    .locals 3

    const-string v0, "GamesClientImpl"

    const-string v1, "Unable to increment event "

    :try_start_0
    iget-object v2, p0, Lcom/google/android/gms/games/internal/GamesClientImpl$GameClientEventIncrementCache;->WC:Lcom/google/android/gms/games/internal/GamesClientImpl;

    invoke-virtual {v2}, Lcom/google/android/gms/games/internal/GamesClientImpl;->isConnected()Z

    move-result v2

    if-eqz v2, :cond_0

    iget-object p0, p0, Lcom/google/android/gms/games/internal/GamesClientImpl$GameClientEventIncrementCache;->WC:Lcom/google/android/gms/games/internal/GamesClientImpl;

    invoke-virtual {p0}, Lcom/google/android/gms/games/internal/GamesClientImpl;->gS()Landroid/os/IInterface;

    move-result-object p0

    check-cast p0, Lcom/google/android/gms/games/internal/IGamesService;

    invoke-interface {p0, p1, p2}, Lcom/google/android/gms/games/internal/IGamesService;->n(Ljava/lang/String;I)V

    goto :goto_0

    :cond_0
    new-instance p0, Ljava/lang/StringBuilder;

    invoke-direct {p0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p0

    const-string p1, " by "

    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p0

    invoke-virtual {p0, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object p0

    const-string p1, " because the games client is no longer connected"

    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-static {v0, p0}, Lcom/google/android/gms/games/internal/GamesLog;->q(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    const-string p0, "service died"

    invoke-static {v0, p0}, Lcom/google/android/gms/games/internal/GamesLog;->p(Ljava/lang/String;Ljava/lang/String;)V

    :goto_0
    return-void
.end method
