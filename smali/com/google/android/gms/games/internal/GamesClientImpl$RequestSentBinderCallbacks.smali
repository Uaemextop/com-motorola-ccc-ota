.class final Lcom/google/android/gms/games/internal/GamesClientImpl$RequestSentBinderCallbacks;
.super Lcom/google/android/gms/games/internal/AbstractGamesCallbacks;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/google/android/gms/games/internal/GamesClientImpl;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x12
    name = "RequestSentBinderCallbacks"
.end annotation


# instance fields
.field final synthetic WC:Lcom/google/android/gms/games/internal/GamesClientImpl;

.field private final XD:Lcom/google/android/gms/common/api/BaseImplementation$b;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/google/android/gms/common/api/BaseImplementation$b<",
            "Lcom/google/android/gms/games/request/Requests$SendRequestResult;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Lcom/google/android/gms/games/internal/GamesClientImpl;Lcom/google/android/gms/common/api/BaseImplementation$b;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/google/android/gms/common/api/BaseImplementation$b<",
            "Lcom/google/android/gms/games/request/Requests$SendRequestResult;",
            ">;)V"
        }
    .end annotation

    iput-object p1, p0, Lcom/google/android/gms/games/internal/GamesClientImpl$RequestSentBinderCallbacks;->WC:Lcom/google/android/gms/games/internal/GamesClientImpl;

    invoke-direct {p0}, Lcom/google/android/gms/games/internal/AbstractGamesCallbacks;-><init>()V

    const-string p1, "Holder must not be null"

    invoke-static {p2, p1}, Lcom/google/android/gms/common/internal/o;->b(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lcom/google/android/gms/common/api/BaseImplementation$b;

    iput-object p1, p0, Lcom/google/android/gms/games/internal/GamesClientImpl$RequestSentBinderCallbacks;->XD:Lcom/google/android/gms/common/api/BaseImplementation$b;

    return-void
.end method


# virtual methods
.method public G(Lcom/google/android/gms/common/data/DataHolder;)V
    .locals 1

    iget-object p0, p0, Lcom/google/android/gms/games/internal/GamesClientImpl$RequestSentBinderCallbacks;->XD:Lcom/google/android/gms/common/api/BaseImplementation$b;

    new-instance v0, Lcom/google/android/gms/games/internal/GamesClientImpl$SendRequestResultImpl;

    invoke-direct {v0, p1}, Lcom/google/android/gms/games/internal/GamesClientImpl$SendRequestResultImpl;-><init>(Lcom/google/android/gms/common/data/DataHolder;)V

    invoke-interface {p0, v0}, Lcom/google/android/gms/common/api/BaseImplementation$b;->b(Ljava/lang/Object;)V

    return-void
.end method
