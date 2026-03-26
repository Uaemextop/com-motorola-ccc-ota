.class public final Lcom/google/android/gms/games/leaderboard/LeaderboardBuffer;
.super Lcom/google/android/gms/common/data/g;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/google/android/gms/common/data/g<",
        "Lcom/google/android/gms/games/leaderboard/Leaderboard;",
        ">;"
    }
.end annotation


# direct methods
.method public constructor <init>(Lcom/google/android/gms/common/data/DataHolder;)V
    .locals 0

    invoke-direct {p0, p1}, Lcom/google/android/gms/common/data/g;-><init>(Lcom/google/android/gms/common/data/DataHolder;)V

    return-void
.end method


# virtual methods
.method protected synthetic f(II)Ljava/lang/Object;
    .locals 0

    invoke-virtual {p0, p1, p2}, Lcom/google/android/gms/games/leaderboard/LeaderboardBuffer;->i(II)Lcom/google/android/gms/games/leaderboard/Leaderboard;

    move-result-object p0

    return-object p0
.end method

.method protected gD()Ljava/lang/String;
    .locals 0

    const-string p0, "external_leaderboard_id"

    return-object p0
.end method

.method protected i(II)Lcom/google/android/gms/games/leaderboard/Leaderboard;
    .locals 1

    new-instance v0, Lcom/google/android/gms/games/leaderboard/LeaderboardRef;

    iget-object p0, p0, Lcom/google/android/gms/games/leaderboard/LeaderboardBuffer;->II:Lcom/google/android/gms/common/data/DataHolder;

    invoke-direct {v0, p0, p1, p2}, Lcom/google/android/gms/games/leaderboard/LeaderboardRef;-><init>(Lcom/google/android/gms/common/data/DataHolder;II)V

    return-object v0
.end method
