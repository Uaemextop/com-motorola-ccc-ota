.class public Lcom/google/android/gms/internal/iq;
.super Lcom/google/android/gms/internal/ii;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/google/android/gms/internal/iq$a;
    }
.end annotation


# static fields
.field private static final Hb:J

.field private static final Hc:J

.field private static final Hd:J

.field private static final He:J

.field private static final NAMESPACE:Ljava/lang/String;


# instance fields
.field private Hf:J

.field private Hg:Lcom/google/android/gms/cast/MediaStatus;

.field private final Hh:Lcom/google/android/gms/internal/it;

.field private final Hi:Lcom/google/android/gms/internal/it;

.field private final Hj:Lcom/google/android/gms/internal/it;

.field private final Hk:Lcom/google/android/gms/internal/it;

.field private final Hl:Lcom/google/android/gms/internal/it;

.field private final Hm:Lcom/google/android/gms/internal/it;

.field private final Hn:Lcom/google/android/gms/internal/it;

.field private final Ho:Lcom/google/android/gms/internal/it;

.field private final Hp:Lcom/google/android/gms/internal/it;

.field private final Hq:Lcom/google/android/gms/internal/it;

.field private final Hr:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/google/android/gms/internal/it;",
            ">;"
        }
    .end annotation
.end field

.field private final Hs:Ljava/lang/Runnable;

.field private Ht:Z

.field private final mHandler:Landroid/os/Handler;


# direct methods
.method static constructor <clinit>()V
    .locals 5

    const-string v0, "com.google.cast.media"

    invoke-static {v0}, Lcom/google/android/gms/internal/ik;->aG(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/google/android/gms/internal/iq;->NAMESPACE:Ljava/lang/String;

    sget-object v0, Ljava/util/concurrent/TimeUnit;->HOURS:Ljava/util/concurrent/TimeUnit;

    const-wide/16 v1, 0x18

    invoke-virtual {v0, v1, v2}, Ljava/util/concurrent/TimeUnit;->toMillis(J)J

    move-result-wide v3

    sput-wide v3, Lcom/google/android/gms/internal/iq;->Hb:J

    sget-object v0, Ljava/util/concurrent/TimeUnit;->HOURS:Ljava/util/concurrent/TimeUnit;

    invoke-virtual {v0, v1, v2}, Ljava/util/concurrent/TimeUnit;->toMillis(J)J

    move-result-wide v3

    sput-wide v3, Lcom/google/android/gms/internal/iq;->Hc:J

    sget-object v0, Ljava/util/concurrent/TimeUnit;->HOURS:Ljava/util/concurrent/TimeUnit;

    invoke-virtual {v0, v1, v2}, Ljava/util/concurrent/TimeUnit;->toMillis(J)J

    move-result-wide v0

    sput-wide v0, Lcom/google/android/gms/internal/iq;->Hd:J

    sget-object v0, Ljava/util/concurrent/TimeUnit;->SECONDS:Ljava/util/concurrent/TimeUnit;

    const-wide/16 v1, 0x1

    invoke-virtual {v0, v1, v2}, Ljava/util/concurrent/TimeUnit;->toMillis(J)J

    move-result-wide v0

    sput-wide v0, Lcom/google/android/gms/internal/iq;->He:J

    return-void
.end method

.method public constructor <init>()V
    .locals 1

    const/4 v0, 0x0

    invoke-direct {p0, v0}, Lcom/google/android/gms/internal/iq;-><init>(Ljava/lang/String;)V

    return-void
.end method

.method public constructor <init>(Ljava/lang/String;)V
    .locals 5

    sget-object v0, Lcom/google/android/gms/internal/iq;->NAMESPACE:Ljava/lang/String;

    const-string v1, "MediaControlChannel"

    invoke-direct {p0, v0, v1, p1}, Lcom/google/android/gms/internal/ii;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    new-instance p1, Landroid/os/Handler;

    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    move-result-object v0

    invoke-direct {p1, v0}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    iput-object p1, p0, Lcom/google/android/gms/internal/iq;->mHandler:Landroid/os/Handler;

    new-instance p1, Lcom/google/android/gms/internal/iq$a;

    const/4 v0, 0x0

    invoke-direct {p1, p0, v0}, Lcom/google/android/gms/internal/iq$a;-><init>(Lcom/google/android/gms/internal/iq;Lcom/google/android/gms/internal/iq$1;)V

    iput-object p1, p0, Lcom/google/android/gms/internal/iq;->Hs:Ljava/lang/Runnable;

    new-instance p1, Ljava/util/ArrayList;

    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    iput-object p1, p0, Lcom/google/android/gms/internal/iq;->Hr:Ljava/util/List;

    new-instance v0, Lcom/google/android/gms/internal/it;

    sget-wide v1, Lcom/google/android/gms/internal/iq;->Hc:J

    invoke-direct {v0, v1, v2}, Lcom/google/android/gms/internal/it;-><init>(J)V

    iput-object v0, p0, Lcom/google/android/gms/internal/iq;->Hh:Lcom/google/android/gms/internal/it;

    invoke-interface {p1, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    new-instance v0, Lcom/google/android/gms/internal/it;

    sget-wide v1, Lcom/google/android/gms/internal/iq;->Hb:J

    invoke-direct {v0, v1, v2}, Lcom/google/android/gms/internal/it;-><init>(J)V

    iput-object v0, p0, Lcom/google/android/gms/internal/iq;->Hi:Lcom/google/android/gms/internal/it;

    invoke-interface {p1, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    new-instance v0, Lcom/google/android/gms/internal/it;

    invoke-direct {v0, v1, v2}, Lcom/google/android/gms/internal/it;-><init>(J)V

    iput-object v0, p0, Lcom/google/android/gms/internal/iq;->Hj:Lcom/google/android/gms/internal/it;

    invoke-interface {p1, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    new-instance v0, Lcom/google/android/gms/internal/it;

    invoke-direct {v0, v1, v2}, Lcom/google/android/gms/internal/it;-><init>(J)V

    iput-object v0, p0, Lcom/google/android/gms/internal/iq;->Hk:Lcom/google/android/gms/internal/it;

    invoke-interface {p1, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    new-instance v0, Lcom/google/android/gms/internal/it;

    sget-wide v3, Lcom/google/android/gms/internal/iq;->Hd:J

    invoke-direct {v0, v3, v4}, Lcom/google/android/gms/internal/it;-><init>(J)V

    iput-object v0, p0, Lcom/google/android/gms/internal/iq;->Hl:Lcom/google/android/gms/internal/it;

    invoke-interface {p1, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    new-instance v0, Lcom/google/android/gms/internal/it;

    invoke-direct {v0, v1, v2}, Lcom/google/android/gms/internal/it;-><init>(J)V

    iput-object v0, p0, Lcom/google/android/gms/internal/iq;->Hm:Lcom/google/android/gms/internal/it;

    invoke-interface {p1, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    new-instance v0, Lcom/google/android/gms/internal/it;

    invoke-direct {v0, v1, v2}, Lcom/google/android/gms/internal/it;-><init>(J)V

    iput-object v0, p0, Lcom/google/android/gms/internal/iq;->Hn:Lcom/google/android/gms/internal/it;

    invoke-interface {p1, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    new-instance v0, Lcom/google/android/gms/internal/it;

    invoke-direct {v0, v1, v2}, Lcom/google/android/gms/internal/it;-><init>(J)V

    iput-object v0, p0, Lcom/google/android/gms/internal/iq;->Ho:Lcom/google/android/gms/internal/it;

    invoke-interface {p1, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    new-instance v0, Lcom/google/android/gms/internal/it;

    invoke-direct {v0, v1, v2}, Lcom/google/android/gms/internal/it;-><init>(J)V

    iput-object v0, p0, Lcom/google/android/gms/internal/iq;->Hp:Lcom/google/android/gms/internal/it;

    invoke-interface {p1, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    new-instance v0, Lcom/google/android/gms/internal/it;

    invoke-direct {v0, v1, v2}, Lcom/google/android/gms/internal/it;-><init>(J)V

    iput-object v0, p0, Lcom/google/android/gms/internal/iq;->Hq:Lcom/google/android/gms/internal/it;

    invoke-interface {p1, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    invoke-direct {p0}, Lcom/google/android/gms/internal/iq;->fT()V

    return-void
.end method

.method private H(Z)V
    .locals 2

    iget-boolean v0, p0, Lcom/google/android/gms/internal/iq;->Ht:Z

    if-eq v0, p1, :cond_1

    iput-boolean p1, p0, Lcom/google/android/gms/internal/iq;->Ht:Z

    if-eqz p1, :cond_0

    iget-object p1, p0, Lcom/google/android/gms/internal/iq;->mHandler:Landroid/os/Handler;

    iget-object p0, p0, Lcom/google/android/gms/internal/iq;->Hs:Ljava/lang/Runnable;

    sget-wide v0, Lcom/google/android/gms/internal/iq;->He:J

    invoke-virtual {p1, p0, v0, v1}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    goto :goto_0

    :cond_0
    iget-object p1, p0, Lcom/google/android/gms/internal/iq;->mHandler:Landroid/os/Handler;

    iget-object p0, p0, Lcom/google/android/gms/internal/iq;->Hs:Ljava/lang/Runnable;

    invoke-virtual {p1, p0}, Landroid/os/Handler;->removeCallbacks(Ljava/lang/Runnable;)V

    :cond_1
    :goto_0
    return-void
.end method

.method static synthetic a(Lcom/google/android/gms/internal/iq;)Ljava/util/List;
    .locals 0

    iget-object p0, p0, Lcom/google/android/gms/internal/iq;->Hr:Ljava/util/List;

    return-object p0
.end method

.method private a(JLorg/json/JSONObject;)V
    .locals 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/json/JSONException;
        }
    .end annotation

    iget-object v0, p0, Lcom/google/android/gms/internal/iq;->Hh:Lcom/google/android/gms/internal/it;

    invoke-virtual {v0, p1, p2}, Lcom/google/android/gms/internal/it;->p(J)Z

    move-result v0

    iget-object v1, p0, Lcom/google/android/gms/internal/iq;->Hl:Lcom/google/android/gms/internal/it;

    invoke-virtual {v1}, Lcom/google/android/gms/internal/it;->fV()Z

    move-result v1

    const/4 v2, 0x1

    const/4 v3, 0x0

    if-eqz v1, :cond_0

    iget-object v1, p0, Lcom/google/android/gms/internal/iq;->Hl:Lcom/google/android/gms/internal/it;

    invoke-virtual {v1, p1, p2}, Lcom/google/android/gms/internal/it;->p(J)Z

    move-result v1

    if-nez v1, :cond_0

    move v1, v2

    goto :goto_0

    :cond_0
    move v1, v3

    :goto_0
    iget-object v4, p0, Lcom/google/android/gms/internal/iq;->Hm:Lcom/google/android/gms/internal/it;

    invoke-virtual {v4}, Lcom/google/android/gms/internal/it;->fV()Z

    move-result v4

    if-eqz v4, :cond_1

    iget-object v4, p0, Lcom/google/android/gms/internal/iq;->Hm:Lcom/google/android/gms/internal/it;

    invoke-virtual {v4, p1, p2}, Lcom/google/android/gms/internal/it;->p(J)Z

    move-result v4

    if-eqz v4, :cond_3

    :cond_1
    iget-object v4, p0, Lcom/google/android/gms/internal/iq;->Hn:Lcom/google/android/gms/internal/it;

    invoke-virtual {v4}, Lcom/google/android/gms/internal/it;->fV()Z

    move-result v4

    if-eqz v4, :cond_2

    iget-object v4, p0, Lcom/google/android/gms/internal/iq;->Hn:Lcom/google/android/gms/internal/it;

    invoke-virtual {v4, p1, p2}, Lcom/google/android/gms/internal/it;->p(J)Z

    move-result v4

    if-nez v4, :cond_2

    goto :goto_1

    :cond_2
    move v2, v3

    :cond_3
    :goto_1
    if-eqz v1, :cond_4

    const/4 v1, 0x2

    goto :goto_2

    :cond_4
    move v1, v3

    :goto_2
    if-eqz v2, :cond_5

    or-int/lit8 v1, v1, 0x1

    :cond_5
    if-nez v0, :cond_7

    iget-object v0, p0, Lcom/google/android/gms/internal/iq;->Hg:Lcom/google/android/gms/cast/MediaStatus;

    if-nez v0, :cond_6

    goto :goto_3

    :cond_6
    invoke-virtual {v0, p3, v1}, Lcom/google/android/gms/cast/MediaStatus;->a(Lorg/json/JSONObject;I)I

    move-result p3

    goto :goto_4

    :cond_7
    :goto_3
    new-instance v0, Lcom/google/android/gms/cast/MediaStatus;

    invoke-direct {v0, p3}, Lcom/google/android/gms/cast/MediaStatus;-><init>(Lorg/json/JSONObject;)V

    iput-object v0, p0, Lcom/google/android/gms/internal/iq;->Hg:Lcom/google/android/gms/cast/MediaStatus;

    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    move-result-wide v0

    iput-wide v0, p0, Lcom/google/android/gms/internal/iq;->Hf:J

    const/4 p3, 0x7

    :goto_4
    and-int/lit8 v0, p3, 0x1

    if-eqz v0, :cond_8

    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    move-result-wide v0

    iput-wide v0, p0, Lcom/google/android/gms/internal/iq;->Hf:J

    invoke-virtual {p0}, Lcom/google/android/gms/internal/iq;->onStatusUpdated()V

    :cond_8
    and-int/lit8 v0, p3, 0x2

    if-eqz v0, :cond_9

    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    move-result-wide v0

    iput-wide v0, p0, Lcom/google/android/gms/internal/iq;->Hf:J

    invoke-virtual {p0}, Lcom/google/android/gms/internal/iq;->onStatusUpdated()V

    :cond_9
    and-int/lit8 p3, p3, 0x4

    if-eqz p3, :cond_a

    invoke-virtual {p0}, Lcom/google/android/gms/internal/iq;->onMetadataUpdated()V

    :cond_a
    iget-object p0, p0, Lcom/google/android/gms/internal/iq;->Hr:Ljava/util/List;

    invoke-interface {p0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object p0

    :goto_5
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    move-result p3

    if-eqz p3, :cond_b

    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object p3

    check-cast p3, Lcom/google/android/gms/internal/it;

    invoke-virtual {p3, p1, p2, v3}, Lcom/google/android/gms/internal/it;->d(JI)Z

    goto :goto_5

    :cond_b
    return-void
.end method

.method static synthetic a(Lcom/google/android/gms/internal/iq;Z)Z
    .locals 0

    iput-boolean p1, p0, Lcom/google/android/gms/internal/iq;->Ht:Z

    return p1
.end method

.method static synthetic b(Lcom/google/android/gms/internal/iq;Z)V
    .locals 0

    invoke-direct {p0, p1}, Lcom/google/android/gms/internal/iq;->H(Z)V

    return-void
.end method

.method private fT()V
    .locals 2

    const/4 v0, 0x0

    invoke-direct {p0, v0}, Lcom/google/android/gms/internal/iq;->H(Z)V

    const-wide/16 v0, 0x0

    iput-wide v0, p0, Lcom/google/android/gms/internal/iq;->Hf:J

    const/4 v0, 0x0

    iput-object v0, p0, Lcom/google/android/gms/internal/iq;->Hg:Lcom/google/android/gms/cast/MediaStatus;

    iget-object v0, p0, Lcom/google/android/gms/internal/iq;->Hh:Lcom/google/android/gms/internal/it;

    invoke-virtual {v0}, Lcom/google/android/gms/internal/it;->clear()V

    iget-object v0, p0, Lcom/google/android/gms/internal/iq;->Hl:Lcom/google/android/gms/internal/it;

    invoke-virtual {v0}, Lcom/google/android/gms/internal/it;->clear()V

    iget-object p0, p0, Lcom/google/android/gms/internal/iq;->Hm:Lcom/google/android/gms/internal/it;

    invoke-virtual {p0}, Lcom/google/android/gms/internal/it;->clear()V

    return-void
.end method


# virtual methods
.method public a(Lcom/google/android/gms/internal/is;)J
    .locals 6
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    new-instance v0, Lorg/json/JSONObject;

    invoke-direct {v0}, Lorg/json/JSONObject;-><init>()V

    invoke-virtual {p0}, Lcom/google/android/gms/internal/iq;->fz()J

    move-result-wide v1

    iget-object v3, p0, Lcom/google/android/gms/internal/iq;->Ho:Lcom/google/android/gms/internal/it;

    invoke-virtual {v3, v1, v2, p1}, Lcom/google/android/gms/internal/it;->a(JLcom/google/android/gms/internal/is;)V

    const/4 p1, 0x1

    invoke-direct {p0, p1}, Lcom/google/android/gms/internal/iq;->H(Z)V

    :try_start_0
    const-string p1, "requestId"

    invoke-virtual {v0, p1, v1, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;J)Lorg/json/JSONObject;

    const-string p1, "type"

    const-string v3, "GET_STATUS"

    invoke-virtual {v0, p1, v3}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    iget-object p1, p0, Lcom/google/android/gms/internal/iq;->Hg:Lcom/google/android/gms/cast/MediaStatus;

    if-eqz p1, :cond_0

    const-string v3, "mediaSessionId"

    invoke-virtual {p1}, Lcom/google/android/gms/cast/MediaStatus;->fw()J

    move-result-wide v4

    invoke-virtual {v0, v3, v4, v5}, Lorg/json/JSONObject;->put(Ljava/lang/String;J)Lorg/json/JSONObject;
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    :catch_0
    :cond_0
    invoke-virtual {v0}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    move-result-object p1

    const/4 v0, 0x0

    invoke-virtual {p0, p1, v1, v2, v0}, Lcom/google/android/gms/internal/iq;->a(Ljava/lang/String;JLjava/lang/String;)V

    return-wide v1
.end method

.method public a(Lcom/google/android/gms/internal/is;DLorg/json/JSONObject;)J
    .locals 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Ljava/lang/IllegalStateException;,
            Ljava/lang/IllegalArgumentException;
        }
    .end annotation

    invoke-static {p2, p3}, Ljava/lang/Double;->isInfinite(D)Z

    move-result v0

    if-nez v0, :cond_1

    invoke-static {p2, p3}, Ljava/lang/Double;->isNaN(D)Z

    move-result v0

    if-nez v0, :cond_1

    new-instance v0, Lorg/json/JSONObject;

    invoke-direct {v0}, Lorg/json/JSONObject;-><init>()V

    invoke-virtual {p0}, Lcom/google/android/gms/internal/iq;->fz()J

    move-result-wide v1

    iget-object v3, p0, Lcom/google/android/gms/internal/iq;->Hm:Lcom/google/android/gms/internal/it;

    invoke-virtual {v3, v1, v2, p1}, Lcom/google/android/gms/internal/it;->a(JLcom/google/android/gms/internal/is;)V

    const/4 p1, 0x1

    invoke-direct {p0, p1}, Lcom/google/android/gms/internal/iq;->H(Z)V

    :try_start_0
    const-string p1, "requestId"

    invoke-virtual {v0, p1, v1, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;J)Lorg/json/JSONObject;

    const-string p1, "type"

    const-string v3, "SET_VOLUME"

    invoke-virtual {v0, p1, v3}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    const-string p1, "mediaSessionId"

    invoke-virtual {p0}, Lcom/google/android/gms/internal/iq;->fw()J

    move-result-wide v3

    invoke-virtual {v0, p1, v3, v4}, Lorg/json/JSONObject;->put(Ljava/lang/String;J)Lorg/json/JSONObject;

    new-instance p1, Lorg/json/JSONObject;

    invoke-direct {p1}, Lorg/json/JSONObject;-><init>()V

    const-string v3, "level"

    invoke-virtual {p1, v3, p2, p3}, Lorg/json/JSONObject;->put(Ljava/lang/String;D)Lorg/json/JSONObject;

    const-string p2, "volume"

    invoke-virtual {v0, p2, p1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    if-eqz p4, :cond_0

    const-string p1, "customData"

    invoke-virtual {v0, p1, p4}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    :catch_0
    :cond_0
    invoke-virtual {v0}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    move-result-object p1

    const/4 p2, 0x0

    invoke-virtual {p0, p1, v1, v2, p2}, Lcom/google/android/gms/internal/iq;->a(Ljava/lang/String;JLjava/lang/String;)V

    return-wide v1

    :cond_1
    new-instance p0, Ljava/lang/IllegalArgumentException;

    new-instance p1, Ljava/lang/StringBuilder;

    const-string p4, "Volume cannot be "

    invoke-direct {p1, p4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p1, p2, p3}, Ljava/lang/StringBuilder;->append(D)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-direct {p0, p1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p0
.end method

.method public a(Lcom/google/android/gms/internal/is;JILorg/json/JSONObject;)J
    .locals 6
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Ljava/lang/IllegalStateException;
        }
    .end annotation

    new-instance v0, Lorg/json/JSONObject;

    invoke-direct {v0}, Lorg/json/JSONObject;-><init>()V

    invoke-virtual {p0}, Lcom/google/android/gms/internal/iq;->fz()J

    move-result-wide v1

    iget-object v3, p0, Lcom/google/android/gms/internal/iq;->Hl:Lcom/google/android/gms/internal/it;

    invoke-virtual {v3, v1, v2, p1}, Lcom/google/android/gms/internal/it;->a(JLcom/google/android/gms/internal/is;)V

    const/4 p1, 0x1

    invoke-direct {p0, p1}, Lcom/google/android/gms/internal/iq;->H(Z)V

    :try_start_0
    const-string v3, "requestId"

    invoke-virtual {v0, v3, v1, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;J)Lorg/json/JSONObject;

    const-string v3, "type"

    const-string v4, "SEEK"

    invoke-virtual {v0, v3, v4}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    const-string v3, "mediaSessionId"

    invoke-virtual {p0}, Lcom/google/android/gms/internal/iq;->fw()J

    move-result-wide v4

    invoke-virtual {v0, v3, v4, v5}, Lorg/json/JSONObject;->put(Ljava/lang/String;J)Lorg/json/JSONObject;

    const-string v3, "currentTime"

    invoke-static {p2, p3}, Lcom/google/android/gms/internal/ik;->o(J)D

    move-result-wide p2

    invoke-virtual {v0, v3, p2, p3}, Lorg/json/JSONObject;->put(Ljava/lang/String;D)Lorg/json/JSONObject;
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    const-string p2, "resumeState"

    if-ne p4, p1, :cond_0

    :try_start_1
    const-string p1, "PLAYBACK_START"

    :goto_0
    invoke-virtual {v0, p2, p1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    goto :goto_1

    :cond_0
    const/4 p1, 0x2

    if-ne p4, p1, :cond_1

    const-string p1, "PLAYBACK_PAUSE"

    goto :goto_0

    :cond_1
    :goto_1
    if-eqz p5, :cond_2

    const-string p1, "customData"

    invoke-virtual {v0, p1, p5}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
    :try_end_1
    .catch Lorg/json/JSONException; {:try_start_1 .. :try_end_1} :catch_0

    :catch_0
    :cond_2
    invoke-virtual {v0}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    move-result-object p1

    const/4 p2, 0x0

    invoke-virtual {p0, p1, v1, v2, p2}, Lcom/google/android/gms/internal/iq;->a(Ljava/lang/String;JLjava/lang/String;)V

    return-wide v1
.end method

.method public a(Lcom/google/android/gms/internal/is;Lcom/google/android/gms/cast/MediaInfo;ZJ[JLorg/json/JSONObject;)J
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    new-instance v0, Lorg/json/JSONObject;

    invoke-direct {v0}, Lorg/json/JSONObject;-><init>()V

    invoke-virtual {p0}, Lcom/google/android/gms/internal/iq;->fz()J

    move-result-wide v1

    iget-object v3, p0, Lcom/google/android/gms/internal/iq;->Hh:Lcom/google/android/gms/internal/it;

    invoke-virtual {v3, v1, v2, p1}, Lcom/google/android/gms/internal/it;->a(JLcom/google/android/gms/internal/is;)V

    const/4 p1, 0x1

    invoke-direct {p0, p1}, Lcom/google/android/gms/internal/iq;->H(Z)V

    :try_start_0
    const-string p1, "requestId"

    invoke-virtual {v0, p1, v1, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;J)Lorg/json/JSONObject;

    const-string p1, "type"

    const-string v3, "LOAD"

    invoke-virtual {v0, p1, v3}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    const-string p1, "media"

    invoke-virtual {p2}, Lcom/google/android/gms/cast/MediaInfo;->bK()Lorg/json/JSONObject;

    move-result-object p2

    invoke-virtual {v0, p1, p2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    const-string p1, "autoplay"

    invoke-virtual {v0, p1, p3}, Lorg/json/JSONObject;->put(Ljava/lang/String;Z)Lorg/json/JSONObject;

    const-string p1, "currentTime"

    invoke-static {p4, p5}, Lcom/google/android/gms/internal/ik;->o(J)D

    move-result-wide p2

    invoke-virtual {v0, p1, p2, p3}, Lorg/json/JSONObject;->put(Ljava/lang/String;D)Lorg/json/JSONObject;

    if-eqz p6, :cond_1

    array-length p1, p6

    if-lez p1, :cond_1

    new-instance p1, Lorg/json/JSONArray;

    invoke-direct {p1}, Lorg/json/JSONArray;-><init>()V

    const/4 p2, 0x0

    :goto_0
    array-length p3, p6

    if-ge p2, p3, :cond_0

    aget-wide p3, p6, p2

    invoke-virtual {p1, p2, p3, p4}, Lorg/json/JSONArray;->put(IJ)Lorg/json/JSONArray;

    add-int/lit8 p2, p2, 0x1

    goto :goto_0

    :cond_0
    const-string p2, "activeTrackIds"

    invoke-virtual {v0, p2, p1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    :cond_1
    if-eqz p7, :cond_2

    const-string p1, "customData"

    invoke-virtual {v0, p1, p7}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    :catch_0
    :cond_2
    invoke-virtual {v0}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    move-result-object p1

    const/4 p2, 0x0

    invoke-virtual {p0, p1, v1, v2, p2}, Lcom/google/android/gms/internal/iq;->a(Ljava/lang/String;JLjava/lang/String;)V

    return-wide v1
.end method

.method public a(Lcom/google/android/gms/internal/is;Lcom/google/android/gms/cast/TextTrackStyle;)J
    .locals 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    new-instance v0, Lorg/json/JSONObject;

    invoke-direct {v0}, Lorg/json/JSONObject;-><init>()V

    invoke-virtual {p0}, Lcom/google/android/gms/internal/iq;->fz()J

    move-result-wide v1

    iget-object v3, p0, Lcom/google/android/gms/internal/iq;->Hq:Lcom/google/android/gms/internal/it;

    invoke-virtual {v3, v1, v2, p1}, Lcom/google/android/gms/internal/it;->a(JLcom/google/android/gms/internal/is;)V

    const/4 p1, 0x1

    invoke-direct {p0, p1}, Lcom/google/android/gms/internal/iq;->H(Z)V

    :try_start_0
    const-string p1, "requestId"

    invoke-virtual {v0, p1, v1, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;J)Lorg/json/JSONObject;

    const-string p1, "type"

    const-string v3, "EDIT_TRACKS_INFO"

    invoke-virtual {v0, p1, v3}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    if-eqz p2, :cond_0

    const-string p1, "textTrackStyle"

    invoke-virtual {p2}, Lcom/google/android/gms/cast/TextTrackStyle;->bK()Lorg/json/JSONObject;

    move-result-object p2

    invoke-virtual {v0, p1, p2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    :cond_0
    const-string p1, "mediaSessionId"

    invoke-virtual {p0}, Lcom/google/android/gms/internal/iq;->fw()J

    move-result-wide v3

    invoke-virtual {v0, p1, v3, v4}, Lorg/json/JSONObject;->put(Ljava/lang/String;J)Lorg/json/JSONObject;
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    :catch_0
    invoke-virtual {v0}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    move-result-object p1

    const/4 p2, 0x0

    invoke-virtual {p0, p1, v1, v2, p2}, Lcom/google/android/gms/internal/iq;->a(Ljava/lang/String;JLjava/lang/String;)V

    return-wide v1
.end method

.method public a(Lcom/google/android/gms/internal/is;Lorg/json/JSONObject;)J
    .locals 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    new-instance v0, Lorg/json/JSONObject;

    invoke-direct {v0}, Lorg/json/JSONObject;-><init>()V

    invoke-virtual {p0}, Lcom/google/android/gms/internal/iq;->fz()J

    move-result-wide v1

    iget-object v3, p0, Lcom/google/android/gms/internal/iq;->Hi:Lcom/google/android/gms/internal/it;

    invoke-virtual {v3, v1, v2, p1}, Lcom/google/android/gms/internal/it;->a(JLcom/google/android/gms/internal/is;)V

    const/4 p1, 0x1

    invoke-direct {p0, p1}, Lcom/google/android/gms/internal/iq;->H(Z)V

    :try_start_0
    const-string p1, "requestId"

    invoke-virtual {v0, p1, v1, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;J)Lorg/json/JSONObject;

    const-string p1, "type"

    const-string v3, "PAUSE"

    invoke-virtual {v0, p1, v3}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    const-string p1, "mediaSessionId"

    invoke-virtual {p0}, Lcom/google/android/gms/internal/iq;->fw()J

    move-result-wide v3

    invoke-virtual {v0, p1, v3, v4}, Lorg/json/JSONObject;->put(Ljava/lang/String;J)Lorg/json/JSONObject;

    if-eqz p2, :cond_0

    const-string p1, "customData"

    invoke-virtual {v0, p1, p2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    :catch_0
    :cond_0
    invoke-virtual {v0}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    move-result-object p1

    const/4 p2, 0x0

    invoke-virtual {p0, p1, v1, v2, p2}, Lcom/google/android/gms/internal/iq;->a(Ljava/lang/String;JLjava/lang/String;)V

    return-wide v1
.end method

.method public a(Lcom/google/android/gms/internal/is;ZLorg/json/JSONObject;)J
    .locals 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Ljava/lang/IllegalStateException;
        }
    .end annotation

    new-instance v0, Lorg/json/JSONObject;

    invoke-direct {v0}, Lorg/json/JSONObject;-><init>()V

    invoke-virtual {p0}, Lcom/google/android/gms/internal/iq;->fz()J

    move-result-wide v1

    iget-object v3, p0, Lcom/google/android/gms/internal/iq;->Hn:Lcom/google/android/gms/internal/it;

    invoke-virtual {v3, v1, v2, p1}, Lcom/google/android/gms/internal/it;->a(JLcom/google/android/gms/internal/is;)V

    const/4 p1, 0x1

    invoke-direct {p0, p1}, Lcom/google/android/gms/internal/iq;->H(Z)V

    :try_start_0
    const-string p1, "requestId"

    invoke-virtual {v0, p1, v1, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;J)Lorg/json/JSONObject;

    const-string p1, "type"

    const-string v3, "SET_VOLUME"

    invoke-virtual {v0, p1, v3}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    const-string p1, "mediaSessionId"

    invoke-virtual {p0}, Lcom/google/android/gms/internal/iq;->fw()J

    move-result-wide v3

    invoke-virtual {v0, p1, v3, v4}, Lorg/json/JSONObject;->put(Ljava/lang/String;J)Lorg/json/JSONObject;

    new-instance p1, Lorg/json/JSONObject;

    invoke-direct {p1}, Lorg/json/JSONObject;-><init>()V

    const-string v3, "muted"

    invoke-virtual {p1, v3, p2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Z)Lorg/json/JSONObject;

    const-string p2, "volume"

    invoke-virtual {v0, p2, p1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    if-eqz p3, :cond_0

    const-string p1, "customData"

    invoke-virtual {v0, p1, p3}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    :catch_0
    :cond_0
    invoke-virtual {v0}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    move-result-object p1

    const/4 p2, 0x0

    invoke-virtual {p0, p1, v1, v2, p2}, Lcom/google/android/gms/internal/iq;->a(Ljava/lang/String;JLjava/lang/String;)V

    return-wide v1
.end method

.method public a(Lcom/google/android/gms/internal/is;[J)J
    .locals 6
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    new-instance v0, Lorg/json/JSONObject;

    invoke-direct {v0}, Lorg/json/JSONObject;-><init>()V

    invoke-virtual {p0}, Lcom/google/android/gms/internal/iq;->fz()J

    move-result-wide v1

    iget-object v3, p0, Lcom/google/android/gms/internal/iq;->Hp:Lcom/google/android/gms/internal/it;

    invoke-virtual {v3, v1, v2, p1}, Lcom/google/android/gms/internal/it;->a(JLcom/google/android/gms/internal/is;)V

    const/4 p1, 0x1

    invoke-direct {p0, p1}, Lcom/google/android/gms/internal/iq;->H(Z)V

    :try_start_0
    const-string p1, "requestId"

    invoke-virtual {v0, p1, v1, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;J)Lorg/json/JSONObject;

    const-string p1, "type"

    const-string v3, "EDIT_TRACKS_INFO"

    invoke-virtual {v0, p1, v3}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    const-string p1, "mediaSessionId"

    invoke-virtual {p0}, Lcom/google/android/gms/internal/iq;->fw()J

    move-result-wide v3

    invoke-virtual {v0, p1, v3, v4}, Lorg/json/JSONObject;->put(Ljava/lang/String;J)Lorg/json/JSONObject;

    new-instance p1, Lorg/json/JSONArray;

    invoke-direct {p1}, Lorg/json/JSONArray;-><init>()V

    const/4 v3, 0x0

    :goto_0
    array-length v4, p2

    if-ge v3, v4, :cond_0

    aget-wide v4, p2, v3

    invoke-virtual {p1, v3, v4, v5}, Lorg/json/JSONArray;->put(IJ)Lorg/json/JSONArray;

    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    :cond_0
    const-string p2, "activeTrackIds"

    invoke-virtual {v0, p2, p1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    :catch_0
    invoke-virtual {v0}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    move-result-object p1

    const/4 p2, 0x0

    invoke-virtual {p0, p1, v1, v2, p2}, Lcom/google/android/gms/internal/iq;->a(Ljava/lang/String;JLjava/lang/String;)V

    return-wide v1
.end method

.method public final aD(Ljava/lang/String;)V
    .locals 8

    iget-object v0, p0, Lcom/google/android/gms/internal/iq;->Go:Lcom/google/android/gms/internal/ip;

    const-string v1, "message received: %s"

    filled-new-array {p1}, [Ljava/lang/Object;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Lcom/google/android/gms/internal/ip;->b(Ljava/lang/String;[Ljava/lang/Object;)V

    :try_start_0
    new-instance v0, Lorg/json/JSONObject;

    invoke-direct {v0, p1}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    const-string v1, "type"

    invoke-virtual {v0, v1}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    const-string v2, "requestId"

    const-wide/16 v3, -0x1

    invoke-virtual {v0, v2, v3, v4}, Lorg/json/JSONObject;->optLong(Ljava/lang/String;J)J

    move-result-wide v2

    const-string v4, "MEDIA_STATUS"

    invoke-virtual {v1, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    const/4 v5, 0x0

    if-eqz v4, :cond_1

    const-string v1, "status"

    invoke-virtual {v0, v1}, Lorg/json/JSONObject;->getJSONArray(Ljava/lang/String;)Lorg/json/JSONArray;

    move-result-object v0

    invoke-virtual {v0}, Lorg/json/JSONArray;->length()I

    move-result v1

    if-lez v1, :cond_0

    invoke-virtual {v0, v5}, Lorg/json/JSONArray;->getJSONObject(I)Lorg/json/JSONObject;

    move-result-object v0

    invoke-direct {p0, v2, v3, v0}, Lcom/google/android/gms/internal/iq;->a(JLorg/json/JSONObject;)V

    goto/16 :goto_2

    :cond_0
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/google/android/gms/internal/iq;->Hg:Lcom/google/android/gms/cast/MediaStatus;

    invoke-virtual {p0}, Lcom/google/android/gms/internal/iq;->onStatusUpdated()V

    invoke-virtual {p0}, Lcom/google/android/gms/internal/iq;->onMetadataUpdated()V

    iget-object v0, p0, Lcom/google/android/gms/internal/iq;->Ho:Lcom/google/android/gms/internal/it;

    invoke-virtual {v0, v2, v3, v5}, Lcom/google/android/gms/internal/it;->d(JI)Z

    goto/16 :goto_2

    :cond_1
    const-string v4, "INVALID_PLAYER_STATE"

    invoke-virtual {v1, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    const/16 v6, 0x834

    const-string v7, "customData"

    if-eqz v4, :cond_2

    :try_start_1
    iget-object v1, p0, Lcom/google/android/gms/internal/iq;->Go:Lcom/google/android/gms/internal/ip;

    const-string v4, "received unexpected error: Invalid Player State."

    new-array v5, v5, [Ljava/lang/Object;

    invoke-virtual {v1, v4, v5}, Lcom/google/android/gms/internal/ip;->d(Ljava/lang/String;[Ljava/lang/Object;)V

    invoke-virtual {v0, v7}, Lorg/json/JSONObject;->optJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v0

    iget-object v1, p0, Lcom/google/android/gms/internal/iq;->Hr:Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_5

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lcom/google/android/gms/internal/it;

    invoke-virtual {v4, v2, v3, v6, v0}, Lcom/google/android/gms/internal/it;->b(JILorg/json/JSONObject;)Z

    goto :goto_0

    :cond_2
    const-string v4, "LOAD_FAILED"

    invoke-virtual {v1, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_3

    invoke-virtual {v0, v7}, Lorg/json/JSONObject;->optJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v0

    iget-object v1, p0, Lcom/google/android/gms/internal/iq;->Hh:Lcom/google/android/gms/internal/it;

    invoke-virtual {v1, v2, v3, v6, v0}, Lcom/google/android/gms/internal/it;->b(JILorg/json/JSONObject;)Z

    goto :goto_2

    :cond_3
    const-string v4, "LOAD_CANCELLED"

    invoke-virtual {v1, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_4

    invoke-virtual {v0, v7}, Lorg/json/JSONObject;->optJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v0

    iget-object v1, p0, Lcom/google/android/gms/internal/iq;->Hh:Lcom/google/android/gms/internal/it;

    const/16 v4, 0x835

    invoke-virtual {v1, v2, v3, v4, v0}, Lcom/google/android/gms/internal/it;->b(JILorg/json/JSONObject;)Z

    goto :goto_2

    :cond_4
    const-string v4, "INVALID_REQUEST"

    invoke-virtual {v1, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_5

    iget-object v1, p0, Lcom/google/android/gms/internal/iq;->Go:Lcom/google/android/gms/internal/ip;

    const-string v4, "received unexpected error: Invalid Request."

    new-array v5, v5, [Ljava/lang/Object;

    invoke-virtual {v1, v4, v5}, Lcom/google/android/gms/internal/ip;->d(Ljava/lang/String;[Ljava/lang/Object;)V

    invoke-virtual {v0, v7}, Lorg/json/JSONObject;->optJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v0

    iget-object v1, p0, Lcom/google/android/gms/internal/iq;->Hr:Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_1
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_5

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lcom/google/android/gms/internal/it;

    invoke-virtual {v4, v2, v3, v6, v0}, Lcom/google/android/gms/internal/it;->b(JILorg/json/JSONObject;)Z
    :try_end_1
    .catch Lorg/json/JSONException; {:try_start_1 .. :try_end_1} :catch_0

    goto :goto_1

    :catch_0
    move-exception v0

    iget-object p0, p0, Lcom/google/android/gms/internal/iq;->Go:Lcom/google/android/gms/internal/ip;

    invoke-virtual {v0}, Lorg/json/JSONException;->getMessage()Ljava/lang/String;

    move-result-object v0

    filled-new-array {v0, p1}, [Ljava/lang/Object;

    move-result-object p1

    const-string v0, "Message is malformed (%s); ignoring: %s"

    invoke-virtual {p0, v0, p1}, Lcom/google/android/gms/internal/ip;->d(Ljava/lang/String;[Ljava/lang/Object;)V

    :cond_5
    :goto_2
    return-void
.end method

.method public b(Lcom/google/android/gms/internal/is;Lorg/json/JSONObject;)J
    .locals 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    new-instance v0, Lorg/json/JSONObject;

    invoke-direct {v0}, Lorg/json/JSONObject;-><init>()V

    invoke-virtual {p0}, Lcom/google/android/gms/internal/iq;->fz()J

    move-result-wide v1

    iget-object v3, p0, Lcom/google/android/gms/internal/iq;->Hk:Lcom/google/android/gms/internal/it;

    invoke-virtual {v3, v1, v2, p1}, Lcom/google/android/gms/internal/it;->a(JLcom/google/android/gms/internal/is;)V

    const/4 p1, 0x1

    invoke-direct {p0, p1}, Lcom/google/android/gms/internal/iq;->H(Z)V

    :try_start_0
    const-string p1, "requestId"

    invoke-virtual {v0, p1, v1, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;J)Lorg/json/JSONObject;

    const-string p1, "type"

    const-string v3, "STOP"

    invoke-virtual {v0, p1, v3}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    const-string p1, "mediaSessionId"

    invoke-virtual {p0}, Lcom/google/android/gms/internal/iq;->fw()J

    move-result-wide v3

    invoke-virtual {v0, p1, v3, v4}, Lorg/json/JSONObject;->put(Ljava/lang/String;J)Lorg/json/JSONObject;

    if-eqz p2, :cond_0

    const-string p1, "customData"

    invoke-virtual {v0, p1, p2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    :catch_0
    :cond_0
    invoke-virtual {v0}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    move-result-object p1

    const/4 p2, 0x0

    invoke-virtual {p0, p1, v1, v2, p2}, Lcom/google/android/gms/internal/iq;->a(Ljava/lang/String;JLjava/lang/String;)V

    return-wide v1
.end method

.method public b(JI)V
    .locals 1

    iget-object p0, p0, Lcom/google/android/gms/internal/iq;->Hr:Ljava/util/List;

    invoke-interface {p0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object p0

    :goto_0
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/google/android/gms/internal/it;

    invoke-virtual {v0, p1, p2, p3}, Lcom/google/android/gms/internal/it;->d(JI)Z

    goto :goto_0

    :cond_0
    return-void
.end method

.method public c(Lcom/google/android/gms/internal/is;Lorg/json/JSONObject;)J
    .locals 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Ljava/lang/IllegalStateException;
        }
    .end annotation

    new-instance v0, Lorg/json/JSONObject;

    invoke-direct {v0}, Lorg/json/JSONObject;-><init>()V

    invoke-virtual {p0}, Lcom/google/android/gms/internal/iq;->fz()J

    move-result-wide v1

    iget-object v3, p0, Lcom/google/android/gms/internal/iq;->Hj:Lcom/google/android/gms/internal/it;

    invoke-virtual {v3, v1, v2, p1}, Lcom/google/android/gms/internal/it;->a(JLcom/google/android/gms/internal/is;)V

    const/4 p1, 0x1

    invoke-direct {p0, p1}, Lcom/google/android/gms/internal/iq;->H(Z)V

    :try_start_0
    const-string p1, "requestId"

    invoke-virtual {v0, p1, v1, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;J)Lorg/json/JSONObject;

    const-string p1, "type"

    const-string v3, "PLAY"

    invoke-virtual {v0, p1, v3}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    const-string p1, "mediaSessionId"

    invoke-virtual {p0}, Lcom/google/android/gms/internal/iq;->fw()J

    move-result-wide v3

    invoke-virtual {v0, p1, v3, v4}, Lorg/json/JSONObject;->put(Ljava/lang/String;J)Lorg/json/JSONObject;

    if-eqz p2, :cond_0

    const-string p1, "customData"

    invoke-virtual {v0, p1, p2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    :catch_0
    :cond_0
    invoke-virtual {v0}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    move-result-object p1

    const/4 p2, 0x0

    invoke-virtual {p0, p1, v1, v2, p2}, Lcom/google/android/gms/internal/iq;->a(Ljava/lang/String;JLjava/lang/String;)V

    return-wide v1
.end method

.method public fA()V
    .locals 0

    invoke-direct {p0}, Lcom/google/android/gms/internal/iq;->fT()V

    return-void
.end method

.method public fw()J
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/IllegalStateException;
        }
    .end annotation

    iget-object p0, p0, Lcom/google/android/gms/internal/iq;->Hg:Lcom/google/android/gms/cast/MediaStatus;

    if-eqz p0, :cond_0

    invoke-virtual {p0}, Lcom/google/android/gms/cast/MediaStatus;->fw()J

    move-result-wide v0

    return-wide v0

    :cond_0
    new-instance p0, Ljava/lang/IllegalStateException;

    const-string v0, "No current media session"

    invoke-direct {p0, v0}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw p0
.end method

.method public getApproximateStreamPosition()J
    .locals 11

    invoke-virtual {p0}, Lcom/google/android/gms/internal/iq;->getMediaInfo()Lcom/google/android/gms/cast/MediaInfo;

    move-result-object v0

    const-wide/16 v1, 0x0

    if-nez v0, :cond_0

    return-wide v1

    :cond_0
    iget-wide v3, p0, Lcom/google/android/gms/internal/iq;->Hf:J

    cmp-long v3, v3, v1

    if-nez v3, :cond_1

    return-wide v1

    :cond_1
    iget-object v3, p0, Lcom/google/android/gms/internal/iq;->Hg:Lcom/google/android/gms/cast/MediaStatus;

    invoke-virtual {v3}, Lcom/google/android/gms/cast/MediaStatus;->getPlaybackRate()D

    move-result-wide v3

    iget-object v5, p0, Lcom/google/android/gms/internal/iq;->Hg:Lcom/google/android/gms/cast/MediaStatus;

    invoke-virtual {v5}, Lcom/google/android/gms/cast/MediaStatus;->getStreamPosition()J

    move-result-wide v5

    iget-object v7, p0, Lcom/google/android/gms/internal/iq;->Hg:Lcom/google/android/gms/cast/MediaStatus;

    invoke-virtual {v7}, Lcom/google/android/gms/cast/MediaStatus;->getPlayerState()I

    move-result v7

    const-wide/16 v8, 0x0

    cmpl-double v8, v3, v8

    if-eqz v8, :cond_7

    const/4 v8, 0x2

    if-eq v7, v8, :cond_2

    goto :goto_1

    :cond_2
    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    move-result-wide v7

    iget-wide v9, p0, Lcom/google/android/gms/internal/iq;->Hf:J

    sub-long/2addr v7, v9

    cmp-long p0, v7, v1

    if-gez p0, :cond_3

    move-wide v7, v1

    :cond_3
    cmp-long p0, v7, v1

    if-nez p0, :cond_4

    return-wide v5

    :cond_4
    invoke-virtual {v0}, Lcom/google/android/gms/cast/MediaInfo;->getStreamDuration()J

    move-result-wide v9

    long-to-double v7, v7

    mul-double/2addr v7, v3

    double-to-long v3, v7

    add-long/2addr v5, v3

    cmp-long p0, v9, v1

    if-lez p0, :cond_5

    cmp-long p0, v5, v9

    if-lez p0, :cond_5

    move-wide v1, v9

    goto :goto_0

    :cond_5
    cmp-long p0, v5, v1

    if-gez p0, :cond_6

    goto :goto_0

    :cond_6
    move-wide v1, v5

    :goto_0
    return-wide v1

    :cond_7
    :goto_1
    return-wide v5
.end method

.method public getMediaInfo()Lcom/google/android/gms/cast/MediaInfo;
    .locals 0

    iget-object p0, p0, Lcom/google/android/gms/internal/iq;->Hg:Lcom/google/android/gms/cast/MediaStatus;

    if-nez p0, :cond_0

    const/4 p0, 0x0

    goto :goto_0

    :cond_0
    invoke-virtual {p0}, Lcom/google/android/gms/cast/MediaStatus;->getMediaInfo()Lcom/google/android/gms/cast/MediaInfo;

    move-result-object p0

    :goto_0
    return-object p0
.end method

.method public getMediaStatus()Lcom/google/android/gms/cast/MediaStatus;
    .locals 0

    iget-object p0, p0, Lcom/google/android/gms/internal/iq;->Hg:Lcom/google/android/gms/cast/MediaStatus;

    return-object p0
.end method

.method public getStreamDuration()J
    .locals 2

    invoke-virtual {p0}, Lcom/google/android/gms/internal/iq;->getMediaInfo()Lcom/google/android/gms/cast/MediaInfo;

    move-result-object p0

    if-eqz p0, :cond_0

    invoke-virtual {p0}, Lcom/google/android/gms/cast/MediaInfo;->getStreamDuration()J

    move-result-wide v0

    goto :goto_0

    :cond_0
    const-wide/16 v0, 0x0

    :goto_0
    return-wide v0
.end method

.method protected onMetadataUpdated()V
    .locals 0

    return-void
.end method

.method protected onStatusUpdated()V
    .locals 0

    return-void
.end method
