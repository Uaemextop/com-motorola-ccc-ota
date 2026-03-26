.class public final Lcom/google/android/gms/games/internal/constants/TurnBasedMatchTurnStatus;
.super Ljava/lang/Object;


# direct methods
.method public constructor <init>()V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static dH(I)Ljava/lang/String;
    .locals 2

    if-eqz p0, :cond_3

    const/4 v0, 0x1

    if-eq p0, v0, :cond_2

    const/4 v0, 0x2

    if-eq p0, v0, :cond_1

    const/4 v0, 0x3

    if-eq p0, v0, :cond_0

    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "Unknown match turn status: "

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    const-string v0, "MatchTurnStatus"

    invoke-static {v0, p0}, Lcom/google/android/gms/games/internal/GamesLog;->q(Ljava/lang/String;Ljava/lang/String;)V

    const-string p0, "TURN_STATUS_UNKNOWN"

    return-object p0

    :cond_0
    const-string p0, "TURN_STATUS_COMPLETE"

    return-object p0

    :cond_1
    const-string p0, "TURN_STATUS_THEIR_TURN"

    return-object p0

    :cond_2
    const-string p0, "TURN_STATUS_MY_TURN"

    return-object p0

    :cond_3
    const-string p0, "TURN_STATUS_INVITED"

    return-object p0
.end method
