.class public final Lcom/google/android/gms/games/internal/player/MostRecentGameInfoEntity;
.super Ljava/lang/Object;

# interfaces
.implements Lcom/google/android/gms/common/internal/safeparcel/SafeParcelable;
.implements Lcom/google/android/gms/games/internal/player/MostRecentGameInfo;


# static fields
.field public static final CREATOR:Lcom/google/android/gms/games/internal/player/MostRecentGameInfoEntityCreator;


# instance fields
.field private final BR:I

.field private final aaM:Ljava/lang/String;

.field private final aaN:Ljava/lang/String;

.field private final aaO:J

.field private final aaP:Landroid/net/Uri;

.field private final aaQ:Landroid/net/Uri;

.field private final aaR:Landroid/net/Uri;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    new-instance v0, Lcom/google/android/gms/games/internal/player/MostRecentGameInfoEntityCreator;

    invoke-direct {v0}, Lcom/google/android/gms/games/internal/player/MostRecentGameInfoEntityCreator;-><init>()V

    sput-object v0, Lcom/google/android/gms/games/internal/player/MostRecentGameInfoEntity;->CREATOR:Lcom/google/android/gms/games/internal/player/MostRecentGameInfoEntityCreator;

    return-void
.end method

.method constructor <init>(ILjava/lang/String;Ljava/lang/String;JLandroid/net/Uri;Landroid/net/Uri;Landroid/net/Uri;)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput p1, p0, Lcom/google/android/gms/games/internal/player/MostRecentGameInfoEntity;->BR:I

    iput-object p2, p0, Lcom/google/android/gms/games/internal/player/MostRecentGameInfoEntity;->aaM:Ljava/lang/String;

    iput-object p3, p0, Lcom/google/android/gms/games/internal/player/MostRecentGameInfoEntity;->aaN:Ljava/lang/String;

    iput-wide p4, p0, Lcom/google/android/gms/games/internal/player/MostRecentGameInfoEntity;->aaO:J

    iput-object p6, p0, Lcom/google/android/gms/games/internal/player/MostRecentGameInfoEntity;->aaP:Landroid/net/Uri;

    iput-object p7, p0, Lcom/google/android/gms/games/internal/player/MostRecentGameInfoEntity;->aaQ:Landroid/net/Uri;

    iput-object p8, p0, Lcom/google/android/gms/games/internal/player/MostRecentGameInfoEntity;->aaR:Landroid/net/Uri;

    return-void
.end method

.method public constructor <init>(Lcom/google/android/gms/games/internal/player/MostRecentGameInfo;)V
    .locals 2

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, 0x2

    iput v0, p0, Lcom/google/android/gms/games/internal/player/MostRecentGameInfoEntity;->BR:I

    invoke-interface {p1}, Lcom/google/android/gms/games/internal/player/MostRecentGameInfo;->lp()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/google/android/gms/games/internal/player/MostRecentGameInfoEntity;->aaM:Ljava/lang/String;

    invoke-interface {p1}, Lcom/google/android/gms/games/internal/player/MostRecentGameInfo;->lq()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/google/android/gms/games/internal/player/MostRecentGameInfoEntity;->aaN:Ljava/lang/String;

    invoke-interface {p1}, Lcom/google/android/gms/games/internal/player/MostRecentGameInfo;->lr()J

    move-result-wide v0

    iput-wide v0, p0, Lcom/google/android/gms/games/internal/player/MostRecentGameInfoEntity;->aaO:J

    invoke-interface {p1}, Lcom/google/android/gms/games/internal/player/MostRecentGameInfo;->ls()Landroid/net/Uri;

    move-result-object v0

    iput-object v0, p0, Lcom/google/android/gms/games/internal/player/MostRecentGameInfoEntity;->aaP:Landroid/net/Uri;

    invoke-interface {p1}, Lcom/google/android/gms/games/internal/player/MostRecentGameInfo;->lt()Landroid/net/Uri;

    move-result-object v0

    iput-object v0, p0, Lcom/google/android/gms/games/internal/player/MostRecentGameInfoEntity;->aaQ:Landroid/net/Uri;

    invoke-interface {p1}, Lcom/google/android/gms/games/internal/player/MostRecentGameInfo;->lu()Landroid/net/Uri;

    move-result-object p1

    iput-object p1, p0, Lcom/google/android/gms/games/internal/player/MostRecentGameInfoEntity;->aaR:Landroid/net/Uri;

    return-void
.end method

.method static a(Lcom/google/android/gms/games/internal/player/MostRecentGameInfo;)I
    .locals 6

    invoke-interface {p0}, Lcom/google/android/gms/games/internal/player/MostRecentGameInfo;->lp()Ljava/lang/String;

    move-result-object v0

    invoke-interface {p0}, Lcom/google/android/gms/games/internal/player/MostRecentGameInfo;->lq()Ljava/lang/String;

    move-result-object v1

    invoke-interface {p0}, Lcom/google/android/gms/games/internal/player/MostRecentGameInfo;->lr()J

    move-result-wide v2

    invoke-static {v2, v3}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v2

    invoke-interface {p0}, Lcom/google/android/gms/games/internal/player/MostRecentGameInfo;->ls()Landroid/net/Uri;

    move-result-object v3

    invoke-interface {p0}, Lcom/google/android/gms/games/internal/player/MostRecentGameInfo;->lt()Landroid/net/Uri;

    move-result-object v4

    invoke-interface {p0}, Lcom/google/android/gms/games/internal/player/MostRecentGameInfo;->lu()Landroid/net/Uri;

    move-result-object v5

    filled-new-array/range {v0 .. v5}, [Ljava/lang/Object;

    move-result-object p0

    invoke-static {p0}, Lcom/google/android/gms/common/internal/n;->hashCode([Ljava/lang/Object;)I

    move-result p0

    return p0
.end method

.method static a(Lcom/google/android/gms/games/internal/player/MostRecentGameInfo;Ljava/lang/Object;)Z
    .locals 5

    instance-of v0, p1, Lcom/google/android/gms/games/internal/player/MostRecentGameInfo;

    const/4 v1, 0x0

    if-nez v0, :cond_0

    return v1

    :cond_0
    const/4 v0, 0x1

    if-ne p0, p1, :cond_1

    return v0

    :cond_1
    check-cast p1, Lcom/google/android/gms/games/internal/player/MostRecentGameInfo;

    invoke-interface {p1}, Lcom/google/android/gms/games/internal/player/MostRecentGameInfo;->lp()Ljava/lang/String;

    move-result-object v2

    invoke-interface {p0}, Lcom/google/android/gms/games/internal/player/MostRecentGameInfo;->lp()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Lcom/google/android/gms/common/internal/n;->equal(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_2

    invoke-interface {p1}, Lcom/google/android/gms/games/internal/player/MostRecentGameInfo;->lq()Ljava/lang/String;

    move-result-object v2

    invoke-interface {p0}, Lcom/google/android/gms/games/internal/player/MostRecentGameInfo;->lq()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Lcom/google/android/gms/common/internal/n;->equal(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_2

    invoke-interface {p1}, Lcom/google/android/gms/games/internal/player/MostRecentGameInfo;->lr()J

    move-result-wide v2

    invoke-static {v2, v3}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v2

    invoke-interface {p0}, Lcom/google/android/gms/games/internal/player/MostRecentGameInfo;->lr()J

    move-result-wide v3

    invoke-static {v3, v4}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v3

    invoke-static {v2, v3}, Lcom/google/android/gms/common/internal/n;->equal(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_2

    invoke-interface {p1}, Lcom/google/android/gms/games/internal/player/MostRecentGameInfo;->ls()Landroid/net/Uri;

    move-result-object v2

    invoke-interface {p0}, Lcom/google/android/gms/games/internal/player/MostRecentGameInfo;->ls()Landroid/net/Uri;

    move-result-object v3

    invoke-static {v2, v3}, Lcom/google/android/gms/common/internal/n;->equal(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_2

    invoke-interface {p1}, Lcom/google/android/gms/games/internal/player/MostRecentGameInfo;->lt()Landroid/net/Uri;

    move-result-object v2

    invoke-interface {p0}, Lcom/google/android/gms/games/internal/player/MostRecentGameInfo;->lt()Landroid/net/Uri;

    move-result-object v3

    invoke-static {v2, v3}, Lcom/google/android/gms/common/internal/n;->equal(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_2

    invoke-interface {p1}, Lcom/google/android/gms/games/internal/player/MostRecentGameInfo;->lu()Landroid/net/Uri;

    move-result-object p1

    invoke-interface {p0}, Lcom/google/android/gms/games/internal/player/MostRecentGameInfo;->lu()Landroid/net/Uri;

    move-result-object p0

    invoke-static {p1, p0}, Lcom/google/android/gms/common/internal/n;->equal(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result p0

    if-eqz p0, :cond_2

    move v1, v0

    :cond_2
    return v1
.end method

.method static b(Lcom/google/android/gms/games/internal/player/MostRecentGameInfo;)Ljava/lang/String;
    .locals 3

    invoke-static {p0}, Lcom/google/android/gms/common/internal/n;->h(Ljava/lang/Object;)Lcom/google/android/gms/common/internal/n$a;

    move-result-object v0

    const-string v1, "GameId"

    invoke-interface {p0}, Lcom/google/android/gms/games/internal/player/MostRecentGameInfo;->lp()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Lcom/google/android/gms/common/internal/n$a;->a(Ljava/lang/String;Ljava/lang/Object;)Lcom/google/android/gms/common/internal/n$a;

    move-result-object v0

    const-string v1, "GameName"

    invoke-interface {p0}, Lcom/google/android/gms/games/internal/player/MostRecentGameInfo;->lq()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Lcom/google/android/gms/common/internal/n$a;->a(Ljava/lang/String;Ljava/lang/Object;)Lcom/google/android/gms/common/internal/n$a;

    move-result-object v0

    invoke-interface {p0}, Lcom/google/android/gms/games/internal/player/MostRecentGameInfo;->lr()J

    move-result-wide v1

    invoke-static {v1, v2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v1

    const-string v2, "ActivityTimestampMillis"

    invoke-virtual {v0, v2, v1}, Lcom/google/android/gms/common/internal/n$a;->a(Ljava/lang/String;Ljava/lang/Object;)Lcom/google/android/gms/common/internal/n$a;

    move-result-object v0

    const-string v1, "GameIconUri"

    invoke-interface {p0}, Lcom/google/android/gms/games/internal/player/MostRecentGameInfo;->ls()Landroid/net/Uri;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Lcom/google/android/gms/common/internal/n$a;->a(Ljava/lang/String;Ljava/lang/Object;)Lcom/google/android/gms/common/internal/n$a;

    move-result-object v0

    const-string v1, "GameHiResUri"

    invoke-interface {p0}, Lcom/google/android/gms/games/internal/player/MostRecentGameInfo;->lt()Landroid/net/Uri;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Lcom/google/android/gms/common/internal/n$a;->a(Ljava/lang/String;Ljava/lang/Object;)Lcom/google/android/gms/common/internal/n$a;

    move-result-object v0

    const-string v1, "GameFeaturedUri"

    invoke-interface {p0}, Lcom/google/android/gms/games/internal/player/MostRecentGameInfo;->lu()Landroid/net/Uri;

    move-result-object p0

    invoke-virtual {v0, v1, p0}, Lcom/google/android/gms/common/internal/n$a;->a(Ljava/lang/String;Ljava/lang/Object;)Lcom/google/android/gms/common/internal/n$a;

    move-result-object p0

    invoke-virtual {p0}, Lcom/google/android/gms/common/internal/n$a;->toString()Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method


# virtual methods
.method public describeContents()I
    .locals 0

    const/4 p0, 0x0

    return p0
.end method

.method public equals(Ljava/lang/Object;)Z
    .locals 0

    invoke-static {p0, p1}, Lcom/google/android/gms/games/internal/player/MostRecentGameInfoEntity;->a(Lcom/google/android/gms/games/internal/player/MostRecentGameInfo;Ljava/lang/Object;)Z

    move-result p0

    return p0
.end method

.method public synthetic freeze()Ljava/lang/Object;
    .locals 0

    invoke-virtual {p0}, Lcom/google/android/gms/games/internal/player/MostRecentGameInfoEntity;->lv()Lcom/google/android/gms/games/internal/player/MostRecentGameInfo;

    move-result-object p0

    return-object p0
.end method

.method public getVersionCode()I
    .locals 0

    iget p0, p0, Lcom/google/android/gms/games/internal/player/MostRecentGameInfoEntity;->BR:I

    return p0
.end method

.method public hashCode()I
    .locals 0

    invoke-static {p0}, Lcom/google/android/gms/games/internal/player/MostRecentGameInfoEntity;->a(Lcom/google/android/gms/games/internal/player/MostRecentGameInfo;)I

    move-result p0

    return p0
.end method

.method public isDataValid()Z
    .locals 0

    const/4 p0, 0x1

    return p0
.end method

.method public lp()Ljava/lang/String;
    .locals 0

    iget-object p0, p0, Lcom/google/android/gms/games/internal/player/MostRecentGameInfoEntity;->aaM:Ljava/lang/String;

    return-object p0
.end method

.method public lq()Ljava/lang/String;
    .locals 0

    iget-object p0, p0, Lcom/google/android/gms/games/internal/player/MostRecentGameInfoEntity;->aaN:Ljava/lang/String;

    return-object p0
.end method

.method public lr()J
    .locals 2

    iget-wide v0, p0, Lcom/google/android/gms/games/internal/player/MostRecentGameInfoEntity;->aaO:J

    return-wide v0
.end method

.method public ls()Landroid/net/Uri;
    .locals 0

    iget-object p0, p0, Lcom/google/android/gms/games/internal/player/MostRecentGameInfoEntity;->aaP:Landroid/net/Uri;

    return-object p0
.end method

.method public lt()Landroid/net/Uri;
    .locals 0

    iget-object p0, p0, Lcom/google/android/gms/games/internal/player/MostRecentGameInfoEntity;->aaQ:Landroid/net/Uri;

    return-object p0
.end method

.method public lu()Landroid/net/Uri;
    .locals 0

    iget-object p0, p0, Lcom/google/android/gms/games/internal/player/MostRecentGameInfoEntity;->aaR:Landroid/net/Uri;

    return-object p0
.end method

.method public lv()Lcom/google/android/gms/games/internal/player/MostRecentGameInfo;
    .locals 0

    return-object p0
.end method

.method public toString()Ljava/lang/String;
    .locals 0

    invoke-static {p0}, Lcom/google/android/gms/games/internal/player/MostRecentGameInfoEntity;->b(Lcom/google/android/gms/games/internal/player/MostRecentGameInfo;)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method public writeToParcel(Landroid/os/Parcel;I)V
    .locals 0

    invoke-static {p0, p1, p2}, Lcom/google/android/gms/games/internal/player/MostRecentGameInfoEntityCreator;->a(Lcom/google/android/gms/games/internal/player/MostRecentGameInfoEntity;Landroid/os/Parcel;I)V

    return-void
.end method
