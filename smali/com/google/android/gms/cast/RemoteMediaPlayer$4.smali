.class Lcom/google/android/gms/cast/RemoteMediaPlayer$4;
.super Lcom/google/android/gms/cast/RemoteMediaPlayer$b;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/google/android/gms/cast/RemoteMediaPlayer;->load(Lcom/google/android/gms/common/api/GoogleApiClient;Lcom/google/android/gms/cast/MediaInfo;ZJ[JLorg/json/JSONObject;)Lcom/google/android/gms/common/api/PendingResult;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic FK:Lcom/google/android/gms/cast/RemoteMediaPlayer;

.field final synthetic FL:Lcom/google/android/gms/common/api/GoogleApiClient;

.field final synthetic FO:Lcom/google/android/gms/cast/MediaInfo;

.field final synthetic FP:Z

.field final synthetic FQ:J

.field final synthetic FR:[J

.field final synthetic FS:Lorg/json/JSONObject;


# direct methods
.method constructor <init>(Lcom/google/android/gms/cast/RemoteMediaPlayer;Lcom/google/android/gms/common/api/GoogleApiClient;Lcom/google/android/gms/cast/MediaInfo;ZJ[JLorg/json/JSONObject;)V
    .locals 0

    iput-object p1, p0, Lcom/google/android/gms/cast/RemoteMediaPlayer$4;->FK:Lcom/google/android/gms/cast/RemoteMediaPlayer;

    iput-object p2, p0, Lcom/google/android/gms/cast/RemoteMediaPlayer$4;->FL:Lcom/google/android/gms/common/api/GoogleApiClient;

    iput-object p3, p0, Lcom/google/android/gms/cast/RemoteMediaPlayer$4;->FO:Lcom/google/android/gms/cast/MediaInfo;

    iput-boolean p4, p0, Lcom/google/android/gms/cast/RemoteMediaPlayer$4;->FP:Z

    iput-wide p5, p0, Lcom/google/android/gms/cast/RemoteMediaPlayer$4;->FQ:J

    iput-object p7, p0, Lcom/google/android/gms/cast/RemoteMediaPlayer$4;->FR:[J

    iput-object p8, p0, Lcom/google/android/gms/cast/RemoteMediaPlayer$4;->FS:Lorg/json/JSONObject;

    invoke-direct {p0}, Lcom/google/android/gms/cast/RemoteMediaPlayer$b;-><init>()V

    return-void
.end method


# virtual methods
.method protected bridge synthetic a(Lcom/google/android/gms/common/api/Api$a;)V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/os/RemoteException;
        }
    .end annotation

    check-cast p1, Lcom/google/android/gms/internal/ij;

    invoke-virtual {p0, p1}, Lcom/google/android/gms/cast/RemoteMediaPlayer$4;->a(Lcom/google/android/gms/internal/ij;)V

    return-void
.end method

.method protected a(Lcom/google/android/gms/internal/ij;)V
    .locals 10

    iget-object p1, p0, Lcom/google/android/gms/cast/RemoteMediaPlayer$4;->FK:Lcom/google/android/gms/cast/RemoteMediaPlayer;

    invoke-static {p1}, Lcom/google/android/gms/cast/RemoteMediaPlayer;->c(Lcom/google/android/gms/cast/RemoteMediaPlayer;)Ljava/lang/Object;

    move-result-object p1

    monitor-enter p1

    :try_start_0
    iget-object v0, p0, Lcom/google/android/gms/cast/RemoteMediaPlayer$4;->FK:Lcom/google/android/gms/cast/RemoteMediaPlayer;

    invoke-static {v0}, Lcom/google/android/gms/cast/RemoteMediaPlayer;->d(Lcom/google/android/gms/cast/RemoteMediaPlayer;)Lcom/google/android/gms/cast/RemoteMediaPlayer$a;

    move-result-object v0

    iget-object v1, p0, Lcom/google/android/gms/cast/RemoteMediaPlayer$4;->FL:Lcom/google/android/gms/common/api/GoogleApiClient;

    invoke-virtual {v0, v1}, Lcom/google/android/gms/cast/RemoteMediaPlayer$a;->b(Lcom/google/android/gms/common/api/GoogleApiClient;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    const/4 v0, 0x0

    :try_start_1
    iget-object v1, p0, Lcom/google/android/gms/cast/RemoteMediaPlayer$4;->FK:Lcom/google/android/gms/cast/RemoteMediaPlayer;

    invoke-static {v1}, Lcom/google/android/gms/cast/RemoteMediaPlayer;->e(Lcom/google/android/gms/cast/RemoteMediaPlayer;)Lcom/google/android/gms/internal/iq;

    move-result-object v2

    iget-object v3, p0, Lcom/google/android/gms/cast/RemoteMediaPlayer$4;->Gb:Lcom/google/android/gms/internal/is;

    iget-object v4, p0, Lcom/google/android/gms/cast/RemoteMediaPlayer$4;->FO:Lcom/google/android/gms/cast/MediaInfo;

    iget-boolean v5, p0, Lcom/google/android/gms/cast/RemoteMediaPlayer$4;->FP:Z

    iget-wide v6, p0, Lcom/google/android/gms/cast/RemoteMediaPlayer$4;->FQ:J

    iget-object v8, p0, Lcom/google/android/gms/cast/RemoteMediaPlayer$4;->FR:[J

    iget-object v9, p0, Lcom/google/android/gms/cast/RemoteMediaPlayer$4;->FS:Lorg/json/JSONObject;

    invoke-virtual/range {v2 .. v9}, Lcom/google/android/gms/internal/iq;->a(Lcom/google/android/gms/internal/is;Lcom/google/android/gms/cast/MediaInfo;ZJ[JLorg/json/JSONObject;)J
    :try_end_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    :try_start_2
    iget-object p0, p0, Lcom/google/android/gms/cast/RemoteMediaPlayer$4;->FK:Lcom/google/android/gms/cast/RemoteMediaPlayer;

    invoke-static {p0}, Lcom/google/android/gms/cast/RemoteMediaPlayer;->d(Lcom/google/android/gms/cast/RemoteMediaPlayer;)Lcom/google/android/gms/cast/RemoteMediaPlayer$a;

    move-result-object p0

    :goto_0
    invoke-virtual {p0, v0}, Lcom/google/android/gms/cast/RemoteMediaPlayer$a;->b(Lcom/google/android/gms/common/api/GoogleApiClient;)V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    goto :goto_1

    :catchall_0
    move-exception v1

    goto :goto_2

    :catch_0
    :try_start_3
    new-instance v1, Lcom/google/android/gms/common/api/Status;

    const/16 v2, 0x834

    invoke-direct {v1, v2}, Lcom/google/android/gms/common/api/Status;-><init>(I)V

    invoke-virtual {p0, v1}, Lcom/google/android/gms/cast/RemoteMediaPlayer$4;->l(Lcom/google/android/gms/common/api/Status;)Lcom/google/android/gms/cast/RemoteMediaPlayer$MediaChannelResult;

    move-result-object v1

    invoke-virtual {p0, v1}, Lcom/google/android/gms/cast/RemoteMediaPlayer$4;->b(Lcom/google/android/gms/common/api/Result;)V
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    :try_start_4
    iget-object p0, p0, Lcom/google/android/gms/cast/RemoteMediaPlayer$4;->FK:Lcom/google/android/gms/cast/RemoteMediaPlayer;

    invoke-static {p0}, Lcom/google/android/gms/cast/RemoteMediaPlayer;->d(Lcom/google/android/gms/cast/RemoteMediaPlayer;)Lcom/google/android/gms/cast/RemoteMediaPlayer$a;

    move-result-object p0

    goto :goto_0

    :goto_1
    monitor-exit p1

    return-void

    :goto_2
    iget-object p0, p0, Lcom/google/android/gms/cast/RemoteMediaPlayer$4;->FK:Lcom/google/android/gms/cast/RemoteMediaPlayer;

    invoke-static {p0}, Lcom/google/android/gms/cast/RemoteMediaPlayer;->d(Lcom/google/android/gms/cast/RemoteMediaPlayer;)Lcom/google/android/gms/cast/RemoteMediaPlayer$a;

    move-result-object p0

    invoke-virtual {p0, v0}, Lcom/google/android/gms/cast/RemoteMediaPlayer$a;->b(Lcom/google/android/gms/common/api/GoogleApiClient;)V

    throw v1

    :catchall_1
    move-exception p0

    monitor-exit p1
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_1

    throw p0
.end method
