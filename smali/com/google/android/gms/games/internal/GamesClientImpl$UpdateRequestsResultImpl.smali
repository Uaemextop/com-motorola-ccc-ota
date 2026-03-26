.class final Lcom/google/android/gms/games/internal/GamesClientImpl$UpdateRequestsResultImpl;
.super Lcom/google/android/gms/common/api/a;

# interfaces
.implements Lcom/google/android/gms/games/request/Requests$UpdateRequestsResult;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/google/android/gms/games/internal/GamesClientImpl;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1a
    name = "UpdateRequestsResultImpl"
.end annotation


# instance fields
.field private final XU:Lcom/google/android/gms/games/internal/request/RequestUpdateOutcomes;


# direct methods
.method constructor <init>(Lcom/google/android/gms/common/data/DataHolder;)V
    .locals 0

    invoke-direct {p0, p1}, Lcom/google/android/gms/common/api/a;-><init>(Lcom/google/android/gms/common/data/DataHolder;)V

    invoke-static {p1}, Lcom/google/android/gms/games/internal/request/RequestUpdateOutcomes;->V(Lcom/google/android/gms/common/data/DataHolder;)Lcom/google/android/gms/games/internal/request/RequestUpdateOutcomes;

    move-result-object p1

    iput-object p1, p0, Lcom/google/android/gms/games/internal/GamesClientImpl$UpdateRequestsResultImpl;->XU:Lcom/google/android/gms/games/internal/request/RequestUpdateOutcomes;

    return-void
.end method


# virtual methods
.method public getRequestIds()Ljava/util/Set;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Set<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    iget-object p0, p0, Lcom/google/android/gms/games/internal/GamesClientImpl$UpdateRequestsResultImpl;->XU:Lcom/google/android/gms/games/internal/request/RequestUpdateOutcomes;

    invoke-virtual {p0}, Lcom/google/android/gms/games/internal/request/RequestUpdateOutcomes;->getRequestIds()Ljava/util/Set;

    move-result-object p0

    return-object p0
.end method

.method public getRequestOutcome(Ljava/lang/String;)I
    .locals 0

    iget-object p0, p0, Lcom/google/android/gms/games/internal/GamesClientImpl$UpdateRequestsResultImpl;->XU:Lcom/google/android/gms/games/internal/request/RequestUpdateOutcomes;

    invoke-virtual {p0, p1}, Lcom/google/android/gms/games/internal/request/RequestUpdateOutcomes;->getRequestOutcome(Ljava/lang/String;)I

    move-result p0

    return p0
.end method
