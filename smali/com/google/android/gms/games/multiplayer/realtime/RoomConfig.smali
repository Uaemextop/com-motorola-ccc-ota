.class public final Lcom/google/android/gms/games/multiplayer/realtime/RoomConfig;
.super Ljava/lang/Object;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/google/android/gms/games/multiplayer/realtime/RoomConfig$Builder;
    }
.end annotation


# instance fields
.field private final WO:Ljava/lang/String;

.field private final acd:I

.field private final aco:Lcom/google/android/gms/games/multiplayer/realtime/RoomUpdateListener;

.field private final acp:Lcom/google/android/gms/games/multiplayer/realtime/RoomStatusUpdateListener;

.field private final acq:Lcom/google/android/gms/games/multiplayer/realtime/RealTimeMessageReceivedListener;

.field private final acr:[Ljava/lang/String;

.field private final acs:Landroid/os/Bundle;

.field private final act:Z


# direct methods
.method private constructor <init>(Lcom/google/android/gms/games/multiplayer/realtime/RoomConfig$Builder;)V
    .locals 3

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iget-object v0, p1, Lcom/google/android/gms/games/multiplayer/realtime/RoomConfig$Builder;->aco:Lcom/google/android/gms/games/multiplayer/realtime/RoomUpdateListener;

    iput-object v0, p0, Lcom/google/android/gms/games/multiplayer/realtime/RoomConfig;->aco:Lcom/google/android/gms/games/multiplayer/realtime/RoomUpdateListener;

    iget-object v0, p1, Lcom/google/android/gms/games/multiplayer/realtime/RoomConfig$Builder;->acp:Lcom/google/android/gms/games/multiplayer/realtime/RoomStatusUpdateListener;

    iput-object v0, p0, Lcom/google/android/gms/games/multiplayer/realtime/RoomConfig;->acp:Lcom/google/android/gms/games/multiplayer/realtime/RoomStatusUpdateListener;

    iget-object v0, p1, Lcom/google/android/gms/games/multiplayer/realtime/RoomConfig$Builder;->acq:Lcom/google/android/gms/games/multiplayer/realtime/RealTimeMessageReceivedListener;

    iput-object v0, p0, Lcom/google/android/gms/games/multiplayer/realtime/RoomConfig;->acq:Lcom/google/android/gms/games/multiplayer/realtime/RealTimeMessageReceivedListener;

    iget-object v1, p1, Lcom/google/android/gms/games/multiplayer/realtime/RoomConfig$Builder;->acu:Ljava/lang/String;

    iput-object v1, p0, Lcom/google/android/gms/games/multiplayer/realtime/RoomConfig;->WO:Ljava/lang/String;

    iget v1, p1, Lcom/google/android/gms/games/multiplayer/realtime/RoomConfig$Builder;->acd:I

    iput v1, p0, Lcom/google/android/gms/games/multiplayer/realtime/RoomConfig;->acd:I

    iget-object v1, p1, Lcom/google/android/gms/games/multiplayer/realtime/RoomConfig$Builder;->acs:Landroid/os/Bundle;

    iput-object v1, p0, Lcom/google/android/gms/games/multiplayer/realtime/RoomConfig;->acs:Landroid/os/Bundle;

    iget-boolean v1, p1, Lcom/google/android/gms/games/multiplayer/realtime/RoomConfig$Builder;->act:Z

    iput-boolean v1, p0, Lcom/google/android/gms/games/multiplayer/realtime/RoomConfig;->act:Z

    iget-object v2, p1, Lcom/google/android/gms/games/multiplayer/realtime/RoomConfig$Builder;->acv:Ljava/util/ArrayList;

    invoke-virtual {v2}, Ljava/util/ArrayList;->size()I

    move-result v2

    iget-object p1, p1, Lcom/google/android/gms/games/multiplayer/realtime/RoomConfig$Builder;->acv:Ljava/util/ArrayList;

    new-array v2, v2, [Ljava/lang/String;

    invoke-virtual {p1, v2}, Ljava/util/ArrayList;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object p1

    check-cast p1, [Ljava/lang/String;

    iput-object p1, p0, Lcom/google/android/gms/games/multiplayer/realtime/RoomConfig;->acr:[Ljava/lang/String;

    if-nez v0, :cond_0

    const-string p0, "Must either enable sockets OR specify a message listener"

    invoke-static {v1, p0}, Lcom/google/android/gms/common/internal/o;->a(ZLjava/lang/Object;)V

    :cond_0
    return-void
.end method

.method synthetic constructor <init>(Lcom/google/android/gms/games/multiplayer/realtime/RoomConfig$Builder;Lcom/google/android/gms/games/multiplayer/realtime/RoomConfig$1;)V
    .locals 0

    invoke-direct {p0, p1}, Lcom/google/android/gms/games/multiplayer/realtime/RoomConfig;-><init>(Lcom/google/android/gms/games/multiplayer/realtime/RoomConfig$Builder;)V

    return-void
.end method

.method public static builder(Lcom/google/android/gms/games/multiplayer/realtime/RoomUpdateListener;)Lcom/google/android/gms/games/multiplayer/realtime/RoomConfig$Builder;
    .locals 2

    new-instance v0, Lcom/google/android/gms/games/multiplayer/realtime/RoomConfig$Builder;

    const/4 v1, 0x0

    invoke-direct {v0, p0, v1}, Lcom/google/android/gms/games/multiplayer/realtime/RoomConfig$Builder;-><init>(Lcom/google/android/gms/games/multiplayer/realtime/RoomUpdateListener;Lcom/google/android/gms/games/multiplayer/realtime/RoomConfig$1;)V

    return-object v0
.end method

.method public static createAutoMatchCriteria(IIJ)Landroid/os/Bundle;
    .locals 2

    new-instance v0, Landroid/os/Bundle;

    invoke-direct {v0}, Landroid/os/Bundle;-><init>()V

    const-string v1, "min_automatch_players"

    invoke-virtual {v0, v1, p0}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    const-string p0, "max_automatch_players"

    invoke-virtual {v0, p0, p1}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    const-string p0, "exclusive_bit_mask"

    invoke-virtual {v0, p0, p2, p3}, Landroid/os/Bundle;->putLong(Ljava/lang/String;J)V

    return-object v0
.end method


# virtual methods
.method public getAutoMatchCriteria()Landroid/os/Bundle;
    .locals 0

    iget-object p0, p0, Lcom/google/android/gms/games/multiplayer/realtime/RoomConfig;->acs:Landroid/os/Bundle;

    return-object p0
.end method

.method public getInvitationId()Ljava/lang/String;
    .locals 0

    iget-object p0, p0, Lcom/google/android/gms/games/multiplayer/realtime/RoomConfig;->WO:Ljava/lang/String;

    return-object p0
.end method

.method public getInvitedPlayerIds()[Ljava/lang/String;
    .locals 0

    iget-object p0, p0, Lcom/google/android/gms/games/multiplayer/realtime/RoomConfig;->acr:[Ljava/lang/String;

    return-object p0
.end method

.method public getMessageReceivedListener()Lcom/google/android/gms/games/multiplayer/realtime/RealTimeMessageReceivedListener;
    .locals 0

    iget-object p0, p0, Lcom/google/android/gms/games/multiplayer/realtime/RoomConfig;->acq:Lcom/google/android/gms/games/multiplayer/realtime/RealTimeMessageReceivedListener;

    return-object p0
.end method

.method public getRoomStatusUpdateListener()Lcom/google/android/gms/games/multiplayer/realtime/RoomStatusUpdateListener;
    .locals 0

    iget-object p0, p0, Lcom/google/android/gms/games/multiplayer/realtime/RoomConfig;->acp:Lcom/google/android/gms/games/multiplayer/realtime/RoomStatusUpdateListener;

    return-object p0
.end method

.method public getRoomUpdateListener()Lcom/google/android/gms/games/multiplayer/realtime/RoomUpdateListener;
    .locals 0

    iget-object p0, p0, Lcom/google/android/gms/games/multiplayer/realtime/RoomConfig;->aco:Lcom/google/android/gms/games/multiplayer/realtime/RoomUpdateListener;

    return-object p0
.end method

.method public getVariant()I
    .locals 0

    iget p0, p0, Lcom/google/android/gms/games/multiplayer/realtime/RoomConfig;->acd:I

    return p0
.end method

.method public isSocketEnabled()Z
    .locals 0

    iget-boolean p0, p0, Lcom/google/android/gms/games/multiplayer/realtime/RoomConfig;->act:Z

    return p0
.end method
