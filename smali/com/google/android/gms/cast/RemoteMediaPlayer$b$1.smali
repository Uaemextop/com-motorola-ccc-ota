.class Lcom/google/android/gms/cast/RemoteMediaPlayer$b$1;
.super Ljava/lang/Object;

# interfaces
.implements Lcom/google/android/gms/internal/is;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/google/android/gms/cast/RemoteMediaPlayer$b;-><init>()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic Gc:Lcom/google/android/gms/cast/RemoteMediaPlayer$b;


# direct methods
.method constructor <init>(Lcom/google/android/gms/cast/RemoteMediaPlayer$b;)V
    .locals 0

    iput-object p1, p0, Lcom/google/android/gms/cast/RemoteMediaPlayer$b$1;->Gc:Lcom/google/android/gms/cast/RemoteMediaPlayer$b;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public a(JILorg/json/JSONObject;)V
    .locals 0

    iget-object p0, p0, Lcom/google/android/gms/cast/RemoteMediaPlayer$b$1;->Gc:Lcom/google/android/gms/cast/RemoteMediaPlayer$b;

    new-instance p1, Lcom/google/android/gms/cast/RemoteMediaPlayer$c;

    new-instance p2, Lcom/google/android/gms/common/api/Status;

    invoke-direct {p2, p3}, Lcom/google/android/gms/common/api/Status;-><init>(I)V

    invoke-direct {p1, p2, p4}, Lcom/google/android/gms/cast/RemoteMediaPlayer$c;-><init>(Lcom/google/android/gms/common/api/Status;Lorg/json/JSONObject;)V

    invoke-virtual {p0, p1}, Lcom/google/android/gms/cast/RemoteMediaPlayer$b;->b(Lcom/google/android/gms/common/api/Result;)V

    return-void
.end method

.method public n(J)V
    .locals 0

    iget-object p0, p0, Lcom/google/android/gms/cast/RemoteMediaPlayer$b$1;->Gc:Lcom/google/android/gms/cast/RemoteMediaPlayer$b;

    new-instance p1, Lcom/google/android/gms/common/api/Status;

    const/16 p2, 0x837

    invoke-direct {p1, p2}, Lcom/google/android/gms/common/api/Status;-><init>(I)V

    invoke-virtual {p0, p1}, Lcom/google/android/gms/cast/RemoteMediaPlayer$b;->l(Lcom/google/android/gms/common/api/Status;)Lcom/google/android/gms/cast/RemoteMediaPlayer$MediaChannelResult;

    move-result-object p1

    invoke-virtual {p0, p1}, Lcom/google/android/gms/cast/RemoteMediaPlayer$b;->b(Lcom/google/android/gms/common/api/Result;)V

    return-void
.end method
