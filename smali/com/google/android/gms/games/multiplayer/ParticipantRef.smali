.class public final Lcom/google/android/gms/games/multiplayer/ParticipantRef;
.super Lcom/google/android/gms/common/data/d;

# interfaces
.implements Lcom/google/android/gms/games/multiplayer/Participant;


# instance fields
.field private final aci:Lcom/google/android/gms/games/PlayerRef;


# direct methods
.method public constructor <init>(Lcom/google/android/gms/common/data/DataHolder;I)V
    .locals 1

    invoke-direct {p0, p1, p2}, Lcom/google/android/gms/common/data/d;-><init>(Lcom/google/android/gms/common/data/DataHolder;I)V

    new-instance v0, Lcom/google/android/gms/games/PlayerRef;

    invoke-direct {v0, p1, p2}, Lcom/google/android/gms/games/PlayerRef;-><init>(Lcom/google/android/gms/common/data/DataHolder;I)V

    iput-object v0, p0, Lcom/google/android/gms/games/multiplayer/ParticipantRef;->aci:Lcom/google/android/gms/games/PlayerRef;

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

    invoke-static {p0, p1}, Lcom/google/android/gms/games/multiplayer/ParticipantEntity;->a(Lcom/google/android/gms/games/multiplayer/Participant;Ljava/lang/Object;)Z

    move-result p0

    return p0
.end method

.method public freeze()Lcom/google/android/gms/games/multiplayer/Participant;
    .locals 1

    new-instance v0, Lcom/google/android/gms/games/multiplayer/ParticipantEntity;

    invoke-direct {v0, p0}, Lcom/google/android/gms/games/multiplayer/ParticipantEntity;-><init>(Lcom/google/android/gms/games/multiplayer/Participant;)V

    return-object v0
.end method

.method public bridge synthetic freeze()Ljava/lang/Object;
    .locals 0

    invoke-virtual {p0}, Lcom/google/android/gms/games/multiplayer/ParticipantRef;->freeze()Lcom/google/android/gms/games/multiplayer/Participant;

    move-result-object p0

    return-object p0
.end method

.method public getCapabilities()I
    .locals 1

    const-string v0, "capabilities"

    invoke-virtual {p0, v0}, Lcom/google/android/gms/games/multiplayer/ParticipantRef;->getInteger(Ljava/lang/String;)I

    move-result p0

    return p0
.end method

.method public getDisplayName()Ljava/lang/String;
    .locals 1

    const-string v0, "external_player_id"

    invoke-virtual {p0, v0}, Lcom/google/android/gms/games/multiplayer/ParticipantRef;->aS(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_0

    const-string v0, "default_display_name"

    invoke-virtual {p0, v0}, Lcom/google/android/gms/games/multiplayer/ParticipantRef;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    return-object p0

    :cond_0
    iget-object p0, p0, Lcom/google/android/gms/games/multiplayer/ParticipantRef;->aci:Lcom/google/android/gms/games/PlayerRef;

    invoke-virtual {p0}, Lcom/google/android/gms/games/PlayerRef;->getDisplayName()Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method public getDisplayName(Landroid/database/CharArrayBuffer;)V
    .locals 1

    const-string v0, "external_player_id"

    invoke-virtual {p0, v0}, Lcom/google/android/gms/games/multiplayer/ParticipantRef;->aS(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_0

    const-string v0, "default_display_name"

    invoke-virtual {p0, v0, p1}, Lcom/google/android/gms/games/multiplayer/ParticipantRef;->a(Ljava/lang/String;Landroid/database/CharArrayBuffer;)V

    return-void

    :cond_0
    iget-object p0, p0, Lcom/google/android/gms/games/multiplayer/ParticipantRef;->aci:Lcom/google/android/gms/games/PlayerRef;

    invoke-virtual {p0, p1}, Lcom/google/android/gms/games/PlayerRef;->getDisplayName(Landroid/database/CharArrayBuffer;)V

    return-void
.end method

.method public getHiResImageUri()Landroid/net/Uri;
    .locals 1

    const-string v0, "external_player_id"

    invoke-virtual {p0, v0}, Lcom/google/android/gms/games/multiplayer/ParticipantRef;->aS(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_0

    const-string v0, "default_display_hi_res_image_uri"

    invoke-virtual {p0, v0}, Lcom/google/android/gms/games/multiplayer/ParticipantRef;->aR(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object p0

    return-object p0

    :cond_0
    iget-object p0, p0, Lcom/google/android/gms/games/multiplayer/ParticipantRef;->aci:Lcom/google/android/gms/games/PlayerRef;

    invoke-virtual {p0}, Lcom/google/android/gms/games/PlayerRef;->getHiResImageUri()Landroid/net/Uri;

    move-result-object p0

    return-object p0
.end method

.method public getHiResImageUrl()Ljava/lang/String;
    .locals 1

    const-string v0, "external_player_id"

    invoke-virtual {p0, v0}, Lcom/google/android/gms/games/multiplayer/ParticipantRef;->aS(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_0

    const-string v0, "default_display_hi_res_image_url"

    invoke-virtual {p0, v0}, Lcom/google/android/gms/games/multiplayer/ParticipantRef;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    return-object p0

    :cond_0
    iget-object p0, p0, Lcom/google/android/gms/games/multiplayer/ParticipantRef;->aci:Lcom/google/android/gms/games/PlayerRef;

    invoke-virtual {p0}, Lcom/google/android/gms/games/PlayerRef;->getHiResImageUrl()Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method public getIconImageUri()Landroid/net/Uri;
    .locals 1

    const-string v0, "external_player_id"

    invoke-virtual {p0, v0}, Lcom/google/android/gms/games/multiplayer/ParticipantRef;->aS(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_0

    const-string v0, "default_display_image_uri"

    invoke-virtual {p0, v0}, Lcom/google/android/gms/games/multiplayer/ParticipantRef;->aR(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object p0

    return-object p0

    :cond_0
    iget-object p0, p0, Lcom/google/android/gms/games/multiplayer/ParticipantRef;->aci:Lcom/google/android/gms/games/PlayerRef;

    invoke-virtual {p0}, Lcom/google/android/gms/games/PlayerRef;->getIconImageUri()Landroid/net/Uri;

    move-result-object p0

    return-object p0
.end method

.method public getIconImageUrl()Ljava/lang/String;
    .locals 1

    const-string v0, "external_player_id"

    invoke-virtual {p0, v0}, Lcom/google/android/gms/games/multiplayer/ParticipantRef;->aS(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_0

    const-string v0, "default_display_image_url"

    invoke-virtual {p0, v0}, Lcom/google/android/gms/games/multiplayer/ParticipantRef;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    return-object p0

    :cond_0
    iget-object p0, p0, Lcom/google/android/gms/games/multiplayer/ParticipantRef;->aci:Lcom/google/android/gms/games/PlayerRef;

    invoke-virtual {p0}, Lcom/google/android/gms/games/PlayerRef;->getIconImageUrl()Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method public getParticipantId()Ljava/lang/String;
    .locals 1

    const-string v0, "external_participant_id"

    invoke-virtual {p0, v0}, Lcom/google/android/gms/games/multiplayer/ParticipantRef;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method public getPlayer()Lcom/google/android/gms/games/Player;
    .locals 1

    const-string v0, "external_player_id"

    invoke-virtual {p0, v0}, Lcom/google/android/gms/games/multiplayer/ParticipantRef;->aS(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 p0, 0x0

    return-object p0

    :cond_0
    iget-object p0, p0, Lcom/google/android/gms/games/multiplayer/ParticipantRef;->aci:Lcom/google/android/gms/games/PlayerRef;

    return-object p0
.end method

.method public getResult()Lcom/google/android/gms/games/multiplayer/ParticipantResult;
    .locals 3

    const-string v0, "result_type"

    invoke-virtual {p0, v0}, Lcom/google/android/gms/games/multiplayer/ParticipantRef;->aS(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_0

    const/4 p0, 0x0

    return-object p0

    :cond_0
    invoke-virtual {p0, v0}, Lcom/google/android/gms/games/multiplayer/ParticipantRef;->getInteger(Ljava/lang/String;)I

    move-result v0

    const-string v1, "placing"

    invoke-virtual {p0, v1}, Lcom/google/android/gms/games/multiplayer/ParticipantRef;->getInteger(Ljava/lang/String;)I

    move-result v1

    new-instance v2, Lcom/google/android/gms/games/multiplayer/ParticipantResult;

    invoke-virtual {p0}, Lcom/google/android/gms/games/multiplayer/ParticipantRef;->getParticipantId()Ljava/lang/String;

    move-result-object p0

    invoke-direct {v2, p0, v0, v1}, Lcom/google/android/gms/games/multiplayer/ParticipantResult;-><init>(Ljava/lang/String;II)V

    return-object v2
.end method

.method public getStatus()I
    .locals 1

    const-string v0, "player_status"

    invoke-virtual {p0, v0}, Lcom/google/android/gms/games/multiplayer/ParticipantRef;->getInteger(Ljava/lang/String;)I

    move-result p0

    return p0
.end method

.method public hashCode()I
    .locals 0

    invoke-static {p0}, Lcom/google/android/gms/games/multiplayer/ParticipantEntity;->a(Lcom/google/android/gms/games/multiplayer/Participant;)I

    move-result p0

    return p0
.end method

.method public isConnectedToRoom()Z
    .locals 1

    const-string v0, "connected"

    invoke-virtual {p0, v0}, Lcom/google/android/gms/games/multiplayer/ParticipantRef;->getInteger(Ljava/lang/String;)I

    move-result p0

    if-lez p0, :cond_0

    const/4 p0, 0x1

    goto :goto_0

    :cond_0
    const/4 p0, 0x0

    :goto_0
    return p0
.end method

.method public jX()Ljava/lang/String;
    .locals 1

    const-string v0, "client_address"

    invoke-virtual {p0, v0}, Lcom/google/android/gms/games/multiplayer/ParticipantRef;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method public toString()Ljava/lang/String;
    .locals 0

    invoke-static {p0}, Lcom/google/android/gms/games/multiplayer/ParticipantEntity;->b(Lcom/google/android/gms/games/multiplayer/Participant;)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method public writeToParcel(Landroid/os/Parcel;I)V
    .locals 0

    invoke-virtual {p0}, Lcom/google/android/gms/games/multiplayer/ParticipantRef;->freeze()Lcom/google/android/gms/games/multiplayer/Participant;

    move-result-object p0

    check-cast p0, Lcom/google/android/gms/games/multiplayer/ParticipantEntity;

    invoke-virtual {p0, p1, p2}, Lcom/google/android/gms/games/multiplayer/ParticipantEntity;->writeToParcel(Landroid/os/Parcel;I)V

    return-void
.end method
