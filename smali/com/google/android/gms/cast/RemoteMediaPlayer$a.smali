.class Lcom/google/android/gms/cast/RemoteMediaPlayer$a;
.super Ljava/lang/Object;

# interfaces
.implements Lcom/google/android/gms/internal/ir;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/google/android/gms/cast/RemoteMediaPlayer;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "a"
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/google/android/gms/cast/RemoteMediaPlayer$a$a;
    }
.end annotation


# instance fields
.field final synthetic FK:Lcom/google/android/gms/cast/RemoteMediaPlayer;

.field private FX:Lcom/google/android/gms/common/api/GoogleApiClient;

.field private FY:J


# direct methods
.method public constructor <init>(Lcom/google/android/gms/cast/RemoteMediaPlayer;)V
    .locals 2

    iput-object p1, p0, Lcom/google/android/gms/cast/RemoteMediaPlayer$a;->FK:Lcom/google/android/gms/cast/RemoteMediaPlayer;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const-wide/16 v0, 0x0

    iput-wide v0, p0, Lcom/google/android/gms/cast/RemoteMediaPlayer$a;->FY:J

    return-void
.end method


# virtual methods
.method public a(Ljava/lang/String;Ljava/lang/String;JLjava/lang/String;)V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    iget-object p5, p0, Lcom/google/android/gms/cast/RemoteMediaPlayer$a;->FX:Lcom/google/android/gms/common/api/GoogleApiClient;

    if-eqz p5, :cond_0

    sget-object p5, Lcom/google/android/gms/cast/Cast;->CastApi:Lcom/google/android/gms/cast/Cast$CastApi;

    iget-object v0, p0, Lcom/google/android/gms/cast/RemoteMediaPlayer$a;->FX:Lcom/google/android/gms/common/api/GoogleApiClient;

    invoke-interface {p5, v0, p1, p2}, Lcom/google/android/gms/cast/Cast$CastApi;->sendMessage(Lcom/google/android/gms/common/api/GoogleApiClient;Ljava/lang/String;Ljava/lang/String;)Lcom/google/android/gms/common/api/PendingResult;

    move-result-object p1

    new-instance p2, Lcom/google/android/gms/cast/RemoteMediaPlayer$a$a;

    invoke-direct {p2, p0, p3, p4}, Lcom/google/android/gms/cast/RemoteMediaPlayer$a$a;-><init>(Lcom/google/android/gms/cast/RemoteMediaPlayer$a;J)V

    invoke-interface {p1, p2}, Lcom/google/android/gms/common/api/PendingResult;->setResultCallback(Lcom/google/android/gms/common/api/ResultCallback;)V

    return-void

    :cond_0
    new-instance p0, Ljava/io/IOException;

    const-string p1, "No GoogleApiClient available"

    invoke-direct {p0, p1}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw p0
.end method

.method public b(Lcom/google/android/gms/common/api/GoogleApiClient;)V
    .locals 0

    iput-object p1, p0, Lcom/google/android/gms/cast/RemoteMediaPlayer$a;->FX:Lcom/google/android/gms/common/api/GoogleApiClient;

    return-void
.end method

.method public fx()J
    .locals 4

    iget-wide v0, p0, Lcom/google/android/gms/cast/RemoteMediaPlayer$a;->FY:J

    const-wide/16 v2, 0x1

    add-long/2addr v0, v2

    iput-wide v0, p0, Lcom/google/android/gms/cast/RemoteMediaPlayer$a;->FY:J

    return-wide v0
.end method
