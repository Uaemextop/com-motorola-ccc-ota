.class public Lcom/google/android/gms/games/internal/game/ExtendedGameRef;
.super Lcom/google/android/gms/common/data/d;

# interfaces
.implements Lcom/google/android/gms/games/internal/game/ExtendedGame;


# instance fields
.field private final aaJ:Lcom/google/android/gms/games/snapshot/SnapshotMetadataRef;

.field private final aaK:I

.field private final aax:Lcom/google/android/gms/games/GameRef;


# direct methods
.method constructor <init>(Lcom/google/android/gms/common/data/DataHolder;II)V
    .locals 1

    invoke-direct {p0, p1, p2}, Lcom/google/android/gms/common/data/d;-><init>(Lcom/google/android/gms/common/data/DataHolder;I)V

    new-instance v0, Lcom/google/android/gms/games/GameRef;

    invoke-direct {v0, p1, p2}, Lcom/google/android/gms/games/GameRef;-><init>(Lcom/google/android/gms/common/data/DataHolder;I)V

    iput-object v0, p0, Lcom/google/android/gms/games/internal/game/ExtendedGameRef;->aax:Lcom/google/android/gms/games/GameRef;

    iput p3, p0, Lcom/google/android/gms/games/internal/game/ExtendedGameRef;->aaK:I

    const-string p3, "external_snapshot_id"

    invoke-virtual {p0, p3}, Lcom/google/android/gms/games/internal/game/ExtendedGameRef;->aQ(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-virtual {p0, p3}, Lcom/google/android/gms/games/internal/game/ExtendedGameRef;->aS(Ljava/lang/String;)Z

    move-result p3

    if-nez p3, :cond_0

    new-instance p3, Lcom/google/android/gms/games/snapshot/SnapshotMetadataRef;

    invoke-direct {p3, p1, p2}, Lcom/google/android/gms/games/snapshot/SnapshotMetadataRef;-><init>(Lcom/google/android/gms/common/data/DataHolder;I)V

    iput-object p3, p0, Lcom/google/android/gms/games/internal/game/ExtendedGameRef;->aaJ:Lcom/google/android/gms/games/snapshot/SnapshotMetadataRef;

    goto :goto_0

    :cond_0
    const/4 p1, 0x0

    iput-object p1, p0, Lcom/google/android/gms/games/internal/game/ExtendedGameRef;->aaJ:Lcom/google/android/gms/games/snapshot/SnapshotMetadataRef;

    :goto_0
    return-void
.end method


# virtual methods
.method public describeContents()I
    .locals 0

    const/4 p0, 0x0

    return p0
.end method

.method public equals(Ljava/lang/Object;)Z
    .locals 0

    invoke-static {p0, p1}, Lcom/google/android/gms/games/internal/game/ExtendedGameEntity;->a(Lcom/google/android/gms/games/internal/game/ExtendedGame;Ljava/lang/Object;)Z

    move-result p0

    return p0
.end method

.method public synthetic freeze()Ljava/lang/Object;
    .locals 0

    invoke-virtual {p0}, Lcom/google/android/gms/games/internal/game/ExtendedGameRef;->lc()Lcom/google/android/gms/games/internal/game/ExtendedGame;

    move-result-object p0

    return-object p0
.end method

.method public getGame()Lcom/google/android/gms/games/Game;
    .locals 0

    iget-object p0, p0, Lcom/google/android/gms/games/internal/game/ExtendedGameRef;->aax:Lcom/google/android/gms/games/GameRef;

    return-object p0
.end method

.method public hashCode()I
    .locals 0

    invoke-static {p0}, Lcom/google/android/gms/games/internal/game/ExtendedGameEntity;->a(Lcom/google/android/gms/games/internal/game/ExtendedGame;)I

    move-result p0

    return p0
.end method

.method public kR()Ljava/util/ArrayList;
    .locals 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/ArrayList<",
            "Lcom/google/android/gms/games/internal/game/GameBadge;",
            ">;"
        }
    .end annotation

    iget-object v0, p0, Lcom/google/android/gms/games/internal/game/ExtendedGameRef;->II:Lcom/google/android/gms/common/data/DataHolder;

    iget v1, p0, Lcom/google/android/gms/games/internal/game/ExtendedGameRef;->JX:I

    iget-object v2, p0, Lcom/google/android/gms/games/internal/game/ExtendedGameRef;->II:Lcom/google/android/gms/common/data/DataHolder;

    iget v3, p0, Lcom/google/android/gms/games/internal/game/ExtendedGameRef;->JX:I

    invoke-virtual {v2, v3}, Lcom/google/android/gms/common/data/DataHolder;->ar(I)I

    move-result v2

    const-string v3, "badge_title"

    invoke-virtual {v0, v3, v1, v2}, Lcom/google/android/gms/common/data/DataHolder;->c(Ljava/lang/String;II)Ljava/lang/String;

    move-result-object v0

    const/4 v1, 0x0

    if-nez v0, :cond_0

    new-instance p0, Ljava/util/ArrayList;

    invoke-direct {p0, v1}, Ljava/util/ArrayList;-><init>(I)V

    return-object p0

    :cond_0
    new-instance v0, Ljava/util/ArrayList;

    iget v2, p0, Lcom/google/android/gms/games/internal/game/ExtendedGameRef;->aaK:I

    invoke-direct {v0, v2}, Ljava/util/ArrayList;-><init>(I)V

    :goto_0
    iget v2, p0, Lcom/google/android/gms/games/internal/game/ExtendedGameRef;->aaK:I

    if-ge v1, v2, :cond_1

    new-instance v2, Lcom/google/android/gms/games/internal/game/GameBadgeRef;

    iget-object v3, p0, Lcom/google/android/gms/games/internal/game/ExtendedGameRef;->II:Lcom/google/android/gms/common/data/DataHolder;

    iget v4, p0, Lcom/google/android/gms/games/internal/game/ExtendedGameRef;->JX:I

    add-int/2addr v4, v1

    invoke-direct {v2, v3, v4}, Lcom/google/android/gms/games/internal/game/GameBadgeRef;-><init>(Lcom/google/android/gms/common/data/DataHolder;I)V

    invoke-virtual {v0, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    :cond_1
    return-object v0
.end method

.method public kS()I
    .locals 1

    const-string v0, "availability"

    invoke-virtual {p0, v0}, Lcom/google/android/gms/games/internal/game/ExtendedGameRef;->getInteger(Ljava/lang/String;)I

    move-result p0

    return p0
.end method

.method public kT()Z
    .locals 1

    const-string v0, "owned"

    invoke-virtual {p0, v0}, Lcom/google/android/gms/games/internal/game/ExtendedGameRef;->getBoolean(Ljava/lang/String;)Z

    move-result p0

    return p0
.end method

.method public kU()I
    .locals 1

    const-string v0, "achievement_unlocked_count"

    invoke-virtual {p0, v0}, Lcom/google/android/gms/games/internal/game/ExtendedGameRef;->getInteger(Ljava/lang/String;)I

    move-result p0

    return p0
.end method

.method public kV()J
    .locals 2

    const-string v0, "last_played_server_time"

    invoke-virtual {p0, v0}, Lcom/google/android/gms/games/internal/game/ExtendedGameRef;->getLong(Ljava/lang/String;)J

    move-result-wide v0

    return-wide v0
.end method

.method public kW()J
    .locals 2

    const-string v0, "price_micros"

    invoke-virtual {p0, v0}, Lcom/google/android/gms/games/internal/game/ExtendedGameRef;->getLong(Ljava/lang/String;)J

    move-result-wide v0

    return-wide v0
.end method

.method public kX()Ljava/lang/String;
    .locals 1

    const-string v0, "formatted_price"

    invoke-virtual {p0, v0}, Lcom/google/android/gms/games/internal/game/ExtendedGameRef;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method public kY()J
    .locals 2

    const-string v0, "full_price_micros"

    invoke-virtual {p0, v0}, Lcom/google/android/gms/games/internal/game/ExtendedGameRef;->getLong(Ljava/lang/String;)J

    move-result-wide v0

    return-wide v0
.end method

.method public kZ()Ljava/lang/String;
    .locals 1

    const-string v0, "formatted_full_price"

    invoke-virtual {p0, v0}, Lcom/google/android/gms/games/internal/game/ExtendedGameRef;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method public la()Lcom/google/android/gms/games/snapshot/SnapshotMetadata;
    .locals 0

    iget-object p0, p0, Lcom/google/android/gms/games/internal/game/ExtendedGameRef;->aaJ:Lcom/google/android/gms/games/snapshot/SnapshotMetadataRef;

    return-object p0
.end method

.method public lc()Lcom/google/android/gms/games/internal/game/ExtendedGame;
    .locals 1

    new-instance v0, Lcom/google/android/gms/games/internal/game/ExtendedGameEntity;

    invoke-direct {v0, p0}, Lcom/google/android/gms/games/internal/game/ExtendedGameEntity;-><init>(Lcom/google/android/gms/games/internal/game/ExtendedGame;)V

    return-object v0
.end method

.method public toString()Ljava/lang/String;
    .locals 0

    invoke-static {p0}, Lcom/google/android/gms/games/internal/game/ExtendedGameEntity;->b(Lcom/google/android/gms/games/internal/game/ExtendedGame;)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method public writeToParcel(Landroid/os/Parcel;I)V
    .locals 0

    invoke-virtual {p0}, Lcom/google/android/gms/games/internal/game/ExtendedGameRef;->lc()Lcom/google/android/gms/games/internal/game/ExtendedGame;

    move-result-object p0

    check-cast p0, Lcom/google/android/gms/games/internal/game/ExtendedGameEntity;

    invoke-virtual {p0, p1, p2}, Lcom/google/android/gms/games/internal/game/ExtendedGameEntity;->writeToParcel(Landroid/os/Parcel;I)V

    return-void
.end method
