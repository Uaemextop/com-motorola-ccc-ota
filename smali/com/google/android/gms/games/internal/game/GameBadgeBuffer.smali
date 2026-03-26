.class public final Lcom/google/android/gms/games/internal/game/GameBadgeBuffer;
.super Lcom/google/android/gms/common/data/DataBuffer;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/google/android/gms/common/data/DataBuffer<",
        "Lcom/google/android/gms/games/internal/game/GameBadge;",
        ">;"
    }
.end annotation


# virtual methods
.method public dK(I)Lcom/google/android/gms/games/internal/game/GameBadge;
    .locals 1

    new-instance v0, Lcom/google/android/gms/games/internal/game/GameBadgeRef;

    iget-object p0, p0, Lcom/google/android/gms/games/internal/game/GameBadgeBuffer;->II:Lcom/google/android/gms/common/data/DataHolder;

    invoke-direct {v0, p0, p1}, Lcom/google/android/gms/games/internal/game/GameBadgeRef;-><init>(Lcom/google/android/gms/common/data/DataHolder;I)V

    return-object v0
.end method

.method public synthetic get(I)Ljava/lang/Object;
    .locals 0

    invoke-virtual {p0, p1}, Lcom/google/android/gms/games/internal/game/GameBadgeBuffer;->dK(I)Lcom/google/android/gms/games/internal/game/GameBadge;

    move-result-object p0

    return-object p0
.end method
