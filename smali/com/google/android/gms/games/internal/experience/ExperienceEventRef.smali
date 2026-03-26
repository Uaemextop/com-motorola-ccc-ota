.class public final Lcom/google/android/gms/games/internal/experience/ExperienceEventRef;
.super Lcom/google/android/gms/common/data/d;

# interfaces
.implements Lcom/google/android/gms/games/internal/experience/ExperienceEvent;


# instance fields
.field private final aax:Lcom/google/android/gms/games/GameRef;


# direct methods
.method public constructor <init>(Lcom/google/android/gms/common/data/DataHolder;I)V
    .locals 1

    invoke-direct {p0, p1, p2}, Lcom/google/android/gms/common/data/d;-><init>(Lcom/google/android/gms/common/data/DataHolder;I)V

    const-string p1, "external_game_id"

    invoke-virtual {p0, p1}, Lcom/google/android/gms/games/internal/experience/ExperienceEventRef;->aS(Ljava/lang/String;)Z

    move-result p1

    if-eqz p1, :cond_0

    const/4 p1, 0x0

    goto :goto_0

    :cond_0
    new-instance p1, Lcom/google/android/gms/games/GameRef;

    iget-object p2, p0, Lcom/google/android/gms/games/internal/experience/ExperienceEventRef;->II:Lcom/google/android/gms/common/data/DataHolder;

    iget v0, p0, Lcom/google/android/gms/games/internal/experience/ExperienceEventRef;->JX:I

    invoke-direct {p1, p2, v0}, Lcom/google/android/gms/games/GameRef;-><init>(Lcom/google/android/gms/common/data/DataHolder;I)V

    :goto_0
    iput-object p1, p0, Lcom/google/android/gms/games/internal/experience/ExperienceEventRef;->aax:Lcom/google/android/gms/games/GameRef;

    return-void
.end method


# virtual methods
.method public getIconImageUrl()Ljava/lang/String;
    .locals 1

    const-string v0, "icon_url"

    invoke-virtual {p0, v0}, Lcom/google/android/gms/games/internal/experience/ExperienceEventRef;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method
