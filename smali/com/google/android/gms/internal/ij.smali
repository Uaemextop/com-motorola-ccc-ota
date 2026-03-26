.class public final Lcom/google/android/gms/internal/ij;
.super Lcom/google/android/gms/common/internal/e;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/google/android/gms/internal/ij$c;,
        Lcom/google/android/gms/internal/ij$b;,
        Lcom/google/android/gms/internal/ij$a;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/google/android/gms/common/internal/e<",
        "Lcom/google/android/gms/internal/in;",
        ">;"
    }
.end annotation


# static fields
.field private static final GL:Ljava/lang/Object;

.field private static final GM:Ljava/lang/Object;

.field private static final Gr:Lcom/google/android/gms/internal/ip;


# instance fields
.field private final EO:Lcom/google/android/gms/cast/Cast$Listener;

.field private FA:D

.field private FB:Z

.field private GA:Z

.field private GB:I

.field private GC:I

.field private final GD:Ljava/util/concurrent/atomic/AtomicLong;

.field private GE:Ljava/lang/String;

.field private GF:Ljava/lang/String;

.field private GG:Landroid/os/Bundle;

.field private GH:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/Long;",
            "Lcom/google/android/gms/common/api/BaseImplementation$b<",
            "Lcom/google/android/gms/common/api/Status;",
            ">;>;"
        }
    .end annotation
.end field

.field private GI:Lcom/google/android/gms/internal/ij$b;

.field private GJ:Lcom/google/android/gms/common/api/BaseImplementation$b;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/google/android/gms/common/api/BaseImplementation$b<",
            "Lcom/google/android/gms/cast/Cast$ApplicationConnectionResult;",
            ">;"
        }
    .end annotation
.end field

.field private GK:Lcom/google/android/gms/common/api/BaseImplementation$b;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/google/android/gms/common/api/BaseImplementation$b<",
            "Lcom/google/android/gms/common/api/Status;",
            ">;"
        }
    .end annotation
.end field

.field private Gs:Lcom/google/android/gms/cast/ApplicationMetadata;

.field private final Gt:Lcom/google/android/gms/cast/CastDevice;

.field private final Gu:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Lcom/google/android/gms/cast/Cast$MessageReceivedCallback;",
            ">;"
        }
    .end annotation
.end field

.field private final Gv:J

.field private Gw:Lcom/google/android/gms/internal/ij$c;

.field private Gx:Ljava/lang/String;

.field private Gy:Z

.field private Gz:Z

.field private final mHandler:Landroid/os/Handler;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    new-instance v0, Lcom/google/android/gms/internal/ip;

    const-string v1, "CastClientImpl"

    invoke-direct {v0, v1}, Lcom/google/android/gms/internal/ip;-><init>(Ljava/lang/String;)V

    sput-object v0, Lcom/google/android/gms/internal/ij;->Gr:Lcom/google/android/gms/internal/ip;

    new-instance v0, Ljava/lang/Object;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    sput-object v0, Lcom/google/android/gms/internal/ij;->GL:Ljava/lang/Object;

    new-instance v0, Ljava/lang/Object;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    sput-object v0, Lcom/google/android/gms/internal/ij;->GM:Ljava/lang/Object;

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/os/Looper;Lcom/google/android/gms/cast/CastDevice;JLcom/google/android/gms/cast/Cast$Listener;Lcom/google/android/gms/common/api/GoogleApiClient$ConnectionCallbacks;Lcom/google/android/gms/common/api/GoogleApiClient$OnConnectionFailedListener;)V
    .locals 6

    const/4 v5, 0x0

    move-object v0, v5

    check-cast v0, [Ljava/lang/String;

    move-object v0, p0

    move-object v1, p1

    move-object v2, p2

    move-object v3, p7

    move-object v4, p8

    invoke-direct/range {v0 .. v5}, Lcom/google/android/gms/common/internal/e;-><init>(Landroid/content/Context;Landroid/os/Looper;Lcom/google/android/gms/common/api/GoogleApiClient$ConnectionCallbacks;Lcom/google/android/gms/common/api/GoogleApiClient$OnConnectionFailedListener;[Ljava/lang/String;)V

    iput-object p3, p0, Lcom/google/android/gms/internal/ij;->Gt:Lcom/google/android/gms/cast/CastDevice;

    iput-object p6, p0, Lcom/google/android/gms/internal/ij;->EO:Lcom/google/android/gms/cast/Cast$Listener;

    iput-wide p4, p0, Lcom/google/android/gms/internal/ij;->Gv:J

    new-instance p1, Landroid/os/Handler;

    invoke-direct {p1, p2}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    iput-object p1, p0, Lcom/google/android/gms/internal/ij;->mHandler:Landroid/os/Handler;

    new-instance p1, Ljava/util/HashMap;

    invoke-direct {p1}, Ljava/util/HashMap;-><init>()V

    iput-object p1, p0, Lcom/google/android/gms/internal/ij;->Gu:Ljava/util/Map;

    new-instance p1, Ljava/util/concurrent/atomic/AtomicLong;

    const-wide/16 p2, 0x0

    invoke-direct {p1, p2, p3}, Ljava/util/concurrent/atomic/AtomicLong;-><init>(J)V

    iput-object p1, p0, Lcom/google/android/gms/internal/ij;->GD:Ljava/util/concurrent/atomic/AtomicLong;

    new-instance p1, Ljava/util/HashMap;

    invoke-direct {p1}, Ljava/util/HashMap;-><init>()V

    iput-object p1, p0, Lcom/google/android/gms/internal/ij;->GH:Ljava/util/Map;

    invoke-direct {p0}, Lcom/google/android/gms/internal/ij;->fB()V

    new-instance p1, Lcom/google/android/gms/internal/ij$b;

    const/4 p2, 0x0

    invoke-direct {p1, p0, p2}, Lcom/google/android/gms/internal/ij$b;-><init>(Lcom/google/android/gms/internal/ij;Lcom/google/android/gms/internal/ij$1;)V

    iput-object p1, p0, Lcom/google/android/gms/internal/ij;->GI:Lcom/google/android/gms/internal/ij$b;

    invoke-virtual {p0, p1}, Lcom/google/android/gms/internal/ij;->registerConnectionFailedListener(Lcom/google/android/gms/common/api/GoogleApiClient$OnConnectionFailedListener;)V

    return-void
.end method

.method static synthetic a(Lcom/google/android/gms/internal/ij;Lcom/google/android/gms/cast/ApplicationMetadata;)Lcom/google/android/gms/cast/ApplicationMetadata;
    .locals 0

    iput-object p1, p0, Lcom/google/android/gms/internal/ij;->Gs:Lcom/google/android/gms/cast/ApplicationMetadata;

    return-object p1
.end method

.method static synthetic a(Lcom/google/android/gms/internal/ij;Lcom/google/android/gms/common/api/BaseImplementation$b;)Lcom/google/android/gms/common/api/BaseImplementation$b;
    .locals 0

    iput-object p1, p0, Lcom/google/android/gms/internal/ij;->GJ:Lcom/google/android/gms/common/api/BaseImplementation$b;

    return-object p1
.end method

.method static synthetic a(Lcom/google/android/gms/internal/ij;Ljava/lang/String;)Ljava/lang/String;
    .locals 0

    iput-object p1, p0, Lcom/google/android/gms/internal/ij;->GE:Ljava/lang/String;

    return-object p1
.end method

.method private a(Lcom/google/android/gms/internal/ig;)V
    .locals 4

    invoke-virtual {p1}, Lcom/google/android/gms/internal/ig;->fy()Ljava/lang/String;

    move-result-object p1

    iget-object v0, p0, Lcom/google/android/gms/internal/ij;->Gx:Ljava/lang/String;

    invoke-static {p1, v0}, Lcom/google/android/gms/internal/ik;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v0

    const/4 v1, 0x0

    if-nez v0, :cond_0

    iput-object p1, p0, Lcom/google/android/gms/internal/ij;->Gx:Ljava/lang/String;

    const/4 p1, 0x1

    goto :goto_0

    :cond_0
    move p1, v1

    :goto_0
    sget-object v0, Lcom/google/android/gms/internal/ij;->Gr:Lcom/google/android/gms/internal/ip;

    invoke-static {p1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v2

    iget-boolean v3, p0, Lcom/google/android/gms/internal/ij;->Gy:Z

    invoke-static {v3}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v3

    filled-new-array {v2, v3}, [Ljava/lang/Object;

    move-result-object v2

    const-string v3, "hasChanged=%b, mFirstApplicationStatusUpdate=%b"

    invoke-virtual {v0, v3, v2}, Lcom/google/android/gms/internal/ip;->b(Ljava/lang/String;[Ljava/lang/Object;)V

    iget-object v0, p0, Lcom/google/android/gms/internal/ij;->EO:Lcom/google/android/gms/cast/Cast$Listener;

    if-eqz v0, :cond_2

    if-nez p1, :cond_1

    iget-boolean p1, p0, Lcom/google/android/gms/internal/ij;->Gy:Z

    if-eqz p1, :cond_2

    :cond_1
    invoke-virtual {v0}, Lcom/google/android/gms/cast/Cast$Listener;->onApplicationStatusChanged()V

    :cond_2
    iput-boolean v1, p0, Lcom/google/android/gms/internal/ij;->Gy:Z

    return-void
.end method

.method static synthetic a(Lcom/google/android/gms/internal/ij;Lcom/google/android/gms/internal/ig;)V
    .locals 0

    invoke-direct {p0, p1}, Lcom/google/android/gms/internal/ij;->a(Lcom/google/android/gms/internal/ig;)V

    return-void
.end method

.method static synthetic a(Lcom/google/android/gms/internal/ij;Lcom/google/android/gms/internal/il;)V
    .locals 0

    invoke-direct {p0, p1}, Lcom/google/android/gms/internal/ij;->a(Lcom/google/android/gms/internal/il;)V

    return-void
.end method

.method private a(Lcom/google/android/gms/internal/il;)V
    .locals 7

    invoke-virtual {p1}, Lcom/google/android/gms/internal/il;->getApplicationMetadata()Lcom/google/android/gms/cast/ApplicationMetadata;

    move-result-object v0

    iput-object v0, p0, Lcom/google/android/gms/internal/ij;->Gs:Lcom/google/android/gms/cast/ApplicationMetadata;

    invoke-virtual {p1}, Lcom/google/android/gms/internal/il;->fE()D

    move-result-wide v0

    const-wide/high16 v2, 0x7ff8000000000000L    # Double.NaN

    cmpl-double v2, v0, v2

    const/4 v3, 0x1

    const/4 v4, 0x0

    if-eqz v2, :cond_0

    iget-wide v5, p0, Lcom/google/android/gms/internal/ij;->FA:D

    cmpl-double v2, v0, v5

    if-eqz v2, :cond_0

    iput-wide v0, p0, Lcom/google/android/gms/internal/ij;->FA:D

    move v0, v3

    goto :goto_0

    :cond_0
    move v0, v4

    :goto_0
    invoke-virtual {p1}, Lcom/google/android/gms/internal/il;->fM()Z

    move-result v1

    iget-boolean v2, p0, Lcom/google/android/gms/internal/ij;->FB:Z

    if-eq v1, v2, :cond_1

    iput-boolean v1, p0, Lcom/google/android/gms/internal/ij;->FB:Z

    move v0, v3

    :cond_1
    sget-object v1, Lcom/google/android/gms/internal/ij;->Gr:Lcom/google/android/gms/internal/ip;

    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v2

    iget-boolean v5, p0, Lcom/google/android/gms/internal/ij;->Gz:Z

    invoke-static {v5}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v5

    filled-new-array {v2, v5}, [Ljava/lang/Object;

    move-result-object v2

    const-string v5, "hasVolumeChanged=%b, mFirstDeviceStatusUpdate=%b"

    invoke-virtual {v1, v5, v2}, Lcom/google/android/gms/internal/ip;->b(Ljava/lang/String;[Ljava/lang/Object;)V

    iget-object v2, p0, Lcom/google/android/gms/internal/ij;->EO:Lcom/google/android/gms/cast/Cast$Listener;

    if-eqz v2, :cond_3

    if-nez v0, :cond_2

    iget-boolean v0, p0, Lcom/google/android/gms/internal/ij;->Gz:Z

    if-eqz v0, :cond_3

    :cond_2
    invoke-virtual {v2}, Lcom/google/android/gms/cast/Cast$Listener;->onVolumeChanged()V

    :cond_3
    invoke-virtual {p1}, Lcom/google/android/gms/internal/il;->fN()I

    move-result v0

    iget v2, p0, Lcom/google/android/gms/internal/ij;->GB:I

    if-eq v0, v2, :cond_4

    iput v0, p0, Lcom/google/android/gms/internal/ij;->GB:I

    move v0, v3

    goto :goto_1

    :cond_4
    move v0, v4

    :goto_1
    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v2

    iget-boolean v5, p0, Lcom/google/android/gms/internal/ij;->Gz:Z

    invoke-static {v5}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v5

    filled-new-array {v2, v5}, [Ljava/lang/Object;

    move-result-object v2

    const-string v5, "hasActiveInputChanged=%b, mFirstDeviceStatusUpdate=%b"

    invoke-virtual {v1, v5, v2}, Lcom/google/android/gms/internal/ip;->b(Ljava/lang/String;[Ljava/lang/Object;)V

    iget-object v2, p0, Lcom/google/android/gms/internal/ij;->EO:Lcom/google/android/gms/cast/Cast$Listener;

    if-eqz v2, :cond_6

    if-nez v0, :cond_5

    iget-boolean v0, p0, Lcom/google/android/gms/internal/ij;->Gz:Z

    if-eqz v0, :cond_6

    :cond_5
    iget v0, p0, Lcom/google/android/gms/internal/ij;->GB:I

    invoke-virtual {v2, v0}, Lcom/google/android/gms/cast/Cast$Listener;->W(I)V

    :cond_6
    invoke-virtual {p1}, Lcom/google/android/gms/internal/il;->fO()I

    move-result p1

    iget v0, p0, Lcom/google/android/gms/internal/ij;->GC:I

    if-eq p1, v0, :cond_7

    iput p1, p0, Lcom/google/android/gms/internal/ij;->GC:I

    goto :goto_2

    :cond_7
    move v3, v4

    :goto_2
    invoke-static {v3}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object p1

    iget-boolean v0, p0, Lcom/google/android/gms/internal/ij;->Gz:Z

    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v0

    filled-new-array {p1, v0}, [Ljava/lang/Object;

    move-result-object p1

    const-string v0, "hasStandbyStateChanged=%b, mFirstDeviceStatusUpdate=%b"

    invoke-virtual {v1, v0, p1}, Lcom/google/android/gms/internal/ip;->b(Ljava/lang/String;[Ljava/lang/Object;)V

    iget-object p1, p0, Lcom/google/android/gms/internal/ij;->EO:Lcom/google/android/gms/cast/Cast$Listener;

    if-eqz p1, :cond_9

    if-nez v3, :cond_8

    iget-boolean v0, p0, Lcom/google/android/gms/internal/ij;->Gz:Z

    if-eqz v0, :cond_9

    :cond_8
    iget v0, p0, Lcom/google/android/gms/internal/ij;->GC:I

    invoke-virtual {p1, v0}, Lcom/google/android/gms/cast/Cast$Listener;->X(I)V

    :cond_9
    iput-boolean v4, p0, Lcom/google/android/gms/internal/ij;->Gz:Z

    return-void
.end method

.method static synthetic b(Lcom/google/android/gms/internal/ij;Lcom/google/android/gms/common/api/BaseImplementation$b;)Lcom/google/android/gms/common/api/BaseImplementation$b;
    .locals 0

    iput-object p1, p0, Lcom/google/android/gms/internal/ij;->GK:Lcom/google/android/gms/common/api/BaseImplementation$b;

    return-object p1
.end method

.method static synthetic b(Lcom/google/android/gms/internal/ij;Ljava/lang/String;)Ljava/lang/String;
    .locals 0

    iput-object p1, p0, Lcom/google/android/gms/internal/ij;->GF:Ljava/lang/String;

    return-object p1
.end method

.method static synthetic b(Lcom/google/android/gms/internal/ij;)V
    .locals 0

    invoke-direct {p0}, Lcom/google/android/gms/internal/ij;->fF()V

    return-void
.end method

.method private c(Lcom/google/android/gms/common/api/BaseImplementation$b;)V
    .locals 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/google/android/gms/common/api/BaseImplementation$b<",
            "Lcom/google/android/gms/cast/Cast$ApplicationConnectionResult;",
            ">;)V"
        }
    .end annotation

    sget-object v0, Lcom/google/android/gms/internal/ij;->GL:Ljava/lang/Object;

    monitor-enter v0

    :try_start_0
    iget-object v1, p0, Lcom/google/android/gms/internal/ij;->GJ:Lcom/google/android/gms/common/api/BaseImplementation$b;

    if-eqz v1, :cond_0

    new-instance v2, Lcom/google/android/gms/internal/ij$a;

    new-instance v3, Lcom/google/android/gms/common/api/Status;

    const/16 v4, 0x7d2

    invoke-direct {v3, v4}, Lcom/google/android/gms/common/api/Status;-><init>(I)V

    invoke-direct {v2, v3}, Lcom/google/android/gms/internal/ij$a;-><init>(Lcom/google/android/gms/common/api/Status;)V

    invoke-interface {v1, v2}, Lcom/google/android/gms/common/api/BaseImplementation$b;->b(Ljava/lang/Object;)V

    :cond_0
    iput-object p1, p0, Lcom/google/android/gms/internal/ij;->GJ:Lcom/google/android/gms/common/api/BaseImplementation$b;

    monitor-exit v0

    return-void

    :catchall_0
    move-exception p0

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw p0
.end method

.method static synthetic c(Lcom/google/android/gms/internal/ij;)V
    .locals 0

    invoke-direct {p0}, Lcom/google/android/gms/internal/ij;->fB()V

    return-void
.end method

.method static synthetic d(Lcom/google/android/gms/internal/ij;)Lcom/google/android/gms/common/api/BaseImplementation$b;
    .locals 0

    iget-object p0, p0, Lcom/google/android/gms/internal/ij;->GJ:Lcom/google/android/gms/common/api/BaseImplementation$b;

    return-object p0
.end method

.method static synthetic e(Lcom/google/android/gms/internal/ij;)Lcom/google/android/gms/cast/Cast$Listener;
    .locals 0

    iget-object p0, p0, Lcom/google/android/gms/internal/ij;->EO:Lcom/google/android/gms/cast/Cast$Listener;

    return-object p0
.end method

.method private e(Lcom/google/android/gms/common/api/BaseImplementation$b;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/google/android/gms/common/api/BaseImplementation$b<",
            "Lcom/google/android/gms/common/api/Status;",
            ">;)V"
        }
    .end annotation

    sget-object v0, Lcom/google/android/gms/internal/ij;->GM:Ljava/lang/Object;

    monitor-enter v0

    :try_start_0
    iget-object v1, p0, Lcom/google/android/gms/internal/ij;->GK:Lcom/google/android/gms/common/api/BaseImplementation$b;

    if-eqz v1, :cond_0

    new-instance p0, Lcom/google/android/gms/common/api/Status;

    const/16 v1, 0x7d1

    invoke-direct {p0, v1}, Lcom/google/android/gms/common/api/Status;-><init>(I)V

    invoke-interface {p1, p0}, Lcom/google/android/gms/common/api/BaseImplementation$b;->b(Ljava/lang/Object;)V

    monitor-exit v0

    return-void

    :cond_0
    iput-object p1, p0, Lcom/google/android/gms/internal/ij;->GK:Lcom/google/android/gms/common/api/BaseImplementation$b;

    monitor-exit v0

    return-void

    :catchall_0
    move-exception p0

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw p0
.end method

.method static synthetic f(Lcom/google/android/gms/internal/ij;)Landroid/os/Handler;
    .locals 0

    iget-object p0, p0, Lcom/google/android/gms/internal/ij;->mHandler:Landroid/os/Handler;

    return-object p0
.end method

.method private fB()V
    .locals 3

    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/google/android/gms/internal/ij;->GA:Z

    const/4 v1, -0x1

    iput v1, p0, Lcom/google/android/gms/internal/ij;->GB:I

    iput v1, p0, Lcom/google/android/gms/internal/ij;->GC:I

    const/4 v1, 0x0

    iput-object v1, p0, Lcom/google/android/gms/internal/ij;->Gs:Lcom/google/android/gms/cast/ApplicationMetadata;

    iput-object v1, p0, Lcom/google/android/gms/internal/ij;->Gx:Ljava/lang/String;

    const-wide/16 v1, 0x0

    iput-wide v1, p0, Lcom/google/android/gms/internal/ij;->FA:D

    iput-boolean v0, p0, Lcom/google/android/gms/internal/ij;->FB:Z

    return-void
.end method

.method private fF()V
    .locals 3

    sget-object v0, Lcom/google/android/gms/internal/ij;->Gr:Lcom/google/android/gms/internal/ip;

    const-string v1, "removing all MessageReceivedCallbacks"

    const/4 v2, 0x0

    new-array v2, v2, [Ljava/lang/Object;

    invoke-virtual {v0, v1, v2}, Lcom/google/android/gms/internal/ip;->b(Ljava/lang/String;[Ljava/lang/Object;)V

    iget-object v0, p0, Lcom/google/android/gms/internal/ij;->Gu:Ljava/util/Map;

    monitor-enter v0

    :try_start_0
    iget-object p0, p0, Lcom/google/android/gms/internal/ij;->Gu:Ljava/util/Map;

    invoke-interface {p0}, Ljava/util/Map;->clear()V

    monitor-exit v0

    return-void

    :catchall_0
    move-exception p0

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw p0
.end method

.method private fG()V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/IllegalStateException;
        }
    .end annotation

    iget-boolean v0, p0, Lcom/google/android/gms/internal/ij;->GA:Z

    if-eqz v0, :cond_0

    iget-object p0, p0, Lcom/google/android/gms/internal/ij;->Gw:Lcom/google/android/gms/internal/ij$c;

    if-eqz p0, :cond_0

    invoke-virtual {p0}, Lcom/google/android/gms/internal/ij$c;->fL()Z

    move-result p0

    if-nez p0, :cond_0

    return-void

    :cond_0
    new-instance p0, Ljava/lang/IllegalStateException;

    const-string v0, "Not connected to a device"

    invoke-direct {p0, v0}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw p0
.end method

.method static synthetic fH()Lcom/google/android/gms/internal/ip;
    .locals 1

    sget-object v0, Lcom/google/android/gms/internal/ij;->Gr:Lcom/google/android/gms/internal/ip;

    return-object v0
.end method

.method static synthetic fI()Ljava/lang/Object;
    .locals 1

    sget-object v0, Lcom/google/android/gms/internal/ij;->GL:Ljava/lang/Object;

    return-object v0
.end method

.method static synthetic fJ()Ljava/lang/Object;
    .locals 1

    sget-object v0, Lcom/google/android/gms/internal/ij;->GM:Ljava/lang/Object;

    return-object v0
.end method

.method static synthetic g(Lcom/google/android/gms/internal/ij;)Ljava/util/Map;
    .locals 0

    iget-object p0, p0, Lcom/google/android/gms/internal/ij;->Gu:Ljava/util/Map;

    return-object p0
.end method

.method static synthetic h(Lcom/google/android/gms/internal/ij;)Lcom/google/android/gms/cast/CastDevice;
    .locals 0

    iget-object p0, p0, Lcom/google/android/gms/internal/ij;->Gt:Lcom/google/android/gms/cast/CastDevice;

    return-object p0
.end method

.method static synthetic i(Lcom/google/android/gms/internal/ij;)Ljava/util/Map;
    .locals 0

    iget-object p0, p0, Lcom/google/android/gms/internal/ij;->GH:Ljava/util/Map;

    return-object p0
.end method

.method static synthetic j(Lcom/google/android/gms/internal/ij;)Lcom/google/android/gms/common/api/BaseImplementation$b;
    .locals 0

    iget-object p0, p0, Lcom/google/android/gms/internal/ij;->GK:Lcom/google/android/gms/common/api/BaseImplementation$b;

    return-object p0
.end method


# virtual methods
.method public G(Z)V
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/IllegalStateException;,
            Landroid/os/RemoteException;
        }
    .end annotation

    invoke-virtual {p0}, Lcom/google/android/gms/internal/ij;->gS()Landroid/os/IInterface;

    move-result-object v0

    check-cast v0, Lcom/google/android/gms/internal/in;

    iget-wide v1, p0, Lcom/google/android/gms/internal/ij;->FA:D

    iget-boolean p0, p0, Lcom/google/android/gms/internal/ij;->FB:Z

    invoke-interface {v0, p1, v1, v2, p0}, Lcom/google/android/gms/internal/in;->a(ZDZ)V

    return-void
.end method

.method protected L(Landroid/os/IBinder;)Lcom/google/android/gms/internal/in;
    .locals 0

    invoke-static {p1}, Lcom/google/android/gms/internal/in$a;->M(Landroid/os/IBinder;)Lcom/google/android/gms/internal/in;

    move-result-object p0

    return-object p0
.end method

.method public a(D)V
    .locals 7
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/IllegalArgumentException;,
            Ljava/lang/IllegalStateException;,
            Landroid/os/RemoteException;
        }
    .end annotation

    invoke-static {p1, p2}, Ljava/lang/Double;->isInfinite(D)Z

    move-result v0

    if-nez v0, :cond_0

    invoke-static {p1, p2}, Ljava/lang/Double;->isNaN(D)Z

    move-result v0

    if-nez v0, :cond_0

    invoke-virtual {p0}, Lcom/google/android/gms/internal/ij;->gS()Landroid/os/IInterface;

    move-result-object v0

    move-object v1, v0

    check-cast v1, Lcom/google/android/gms/internal/in;

    iget-wide v4, p0, Lcom/google/android/gms/internal/ij;->FA:D

    iget-boolean v6, p0, Lcom/google/android/gms/internal/ij;->FB:Z

    move-wide v2, p1

    invoke-interface/range {v1 .. v6}, Lcom/google/android/gms/internal/in;->a(DDZ)V

    return-void

    :cond_0
    new-instance p0, Ljava/lang/IllegalArgumentException;

    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "Volume cannot be "

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, p1, p2}, Ljava/lang/StringBuilder;->append(D)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-direct {p0, p1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p0
.end method

.method protected a(ILandroid/os/IBinder;Landroid/os/Bundle;)V
    .locals 3

    sget-object v0, Lcom/google/android/gms/internal/ij;->Gr:Lcom/google/android/gms/internal/ip;

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    filled-new-array {v1}, [Ljava/lang/Object;

    move-result-object v1

    const-string v2, "in onPostInitHandler; statusCode=%d"

    invoke-virtual {v0, v2, v1}, Lcom/google/android/gms/internal/ip;->b(Ljava/lang/String;[Ljava/lang/Object;)V

    const/4 v0, 0x0

    const/16 v1, 0x3e9

    const/4 v2, 0x1

    if-eqz p1, :cond_1

    if-ne p1, v1, :cond_0

    goto :goto_0

    :cond_0
    iput-boolean v0, p0, Lcom/google/android/gms/internal/ij;->GA:Z

    goto :goto_1

    :cond_1
    :goto_0
    iput-boolean v2, p0, Lcom/google/android/gms/internal/ij;->GA:Z

    iput-boolean v2, p0, Lcom/google/android/gms/internal/ij;->Gy:Z

    iput-boolean v2, p0, Lcom/google/android/gms/internal/ij;->Gz:Z

    :goto_1
    if-ne p1, v1, :cond_2

    new-instance p1, Landroid/os/Bundle;

    invoke-direct {p1}, Landroid/os/Bundle;-><init>()V

    iput-object p1, p0, Lcom/google/android/gms/internal/ij;->GG:Landroid/os/Bundle;

    const-string v1, "com.google.android.gms.cast.EXTRA_APP_NO_LONGER_RUNNING"

    invoke-virtual {p1, v1, v2}, Landroid/os/Bundle;->putBoolean(Ljava/lang/String;Z)V

    move p1, v0

    :cond_2
    invoke-super {p0, p1, p2, p3}, Lcom/google/android/gms/common/internal/e;->a(ILandroid/os/IBinder;Landroid/os/Bundle;)V

    return-void
.end method

.method protected a(Lcom/google/android/gms/common/internal/l;Lcom/google/android/gms/common/internal/e$e;)V
    .locals 6
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/os/RemoteException;
        }
    .end annotation

    new-instance v5, Landroid/os/Bundle;

    invoke-direct {v5}, Landroid/os/Bundle;-><init>()V

    sget-object v0, Lcom/google/android/gms/internal/ij;->Gr:Lcom/google/android/gms/internal/ip;

    iget-object v1, p0, Lcom/google/android/gms/internal/ij;->GE:Ljava/lang/String;

    iget-object v2, p0, Lcom/google/android/gms/internal/ij;->GF:Ljava/lang/String;

    filled-new-array {v1, v2}, [Ljava/lang/Object;

    move-result-object v1

    const-string v2, "getServiceFromBroker(): mLastApplicationId=%s, mLastSessionId=%s"

    invoke-virtual {v0, v2, v1}, Lcom/google/android/gms/internal/ip;->b(Ljava/lang/String;[Ljava/lang/Object;)V

    iget-object v0, p0, Lcom/google/android/gms/internal/ij;->Gt:Lcom/google/android/gms/cast/CastDevice;

    invoke-virtual {v0, v5}, Lcom/google/android/gms/cast/CastDevice;->putInBundle(Landroid/os/Bundle;)V

    const-string v0, "com.google.android.gms.cast.EXTRA_CAST_FLAGS"

    iget-wide v1, p0, Lcom/google/android/gms/internal/ij;->Gv:J

    invoke-virtual {v5, v0, v1, v2}, Landroid/os/Bundle;->putLong(Ljava/lang/String;J)V

    iget-object v0, p0, Lcom/google/android/gms/internal/ij;->GE:Ljava/lang/String;

    if-eqz v0, :cond_0

    const-string v1, "last_application_id"

    invoke-virtual {v5, v1, v0}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    iget-object v0, p0, Lcom/google/android/gms/internal/ij;->GF:Ljava/lang/String;

    if-eqz v0, :cond_0

    const-string v1, "last_session_id"

    invoke-virtual {v5, v1, v0}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    :cond_0
    new-instance v0, Lcom/google/android/gms/internal/ij$c;

    const/4 v1, 0x0

    invoke-direct {v0, p0, v1}, Lcom/google/android/gms/internal/ij$c;-><init>(Lcom/google/android/gms/internal/ij;Lcom/google/android/gms/internal/ij$1;)V

    iput-object v0, p0, Lcom/google/android/gms/internal/ij;->Gw:Lcom/google/android/gms/internal/ij$c;

    invoke-virtual {p0}, Lcom/google/android/gms/internal/ij;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v3

    iget-object p0, p0, Lcom/google/android/gms/internal/ij;->Gw:Lcom/google/android/gms/internal/ij$c;

    invoke-virtual {p0}, Lcom/google/android/gms/internal/ij$c;->asBinder()Landroid/os/IBinder;

    move-result-object v4

    const v2, 0x5e2978

    move-object v0, p1

    move-object v1, p2

    invoke-interface/range {v0 .. v5}, Lcom/google/android/gms/common/internal/l;->a(Lcom/google/android/gms/common/internal/k;ILjava/lang/String;Landroid/os/IBinder;Landroid/os/Bundle;)V

    return-void
.end method

.method public a(Ljava/lang/String;Lcom/google/android/gms/cast/Cast$MessageReceivedCallback;)V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/IllegalArgumentException;,
            Ljava/lang/IllegalStateException;,
            Landroid/os/RemoteException;
        }
    .end annotation

    invoke-static {p1}, Lcom/google/android/gms/internal/ik;->aF(Ljava/lang/String;)V

    invoke-virtual {p0, p1}, Lcom/google/android/gms/internal/ij;->aE(Ljava/lang/String;)V

    if-eqz p2, :cond_0

    iget-object v0, p0, Lcom/google/android/gms/internal/ij;->Gu:Ljava/util/Map;

    monitor-enter v0

    :try_start_0
    iget-object v1, p0, Lcom/google/android/gms/internal/ij;->Gu:Ljava/util/Map;

    invoke-interface {v1, p1, p2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    invoke-virtual {p0}, Lcom/google/android/gms/internal/ij;->gS()Landroid/os/IInterface;

    move-result-object p0

    check-cast p0, Lcom/google/android/gms/internal/in;

    invoke-interface {p0, p1}, Lcom/google/android/gms/internal/in;->aI(Ljava/lang/String;)V

    goto :goto_0

    :catchall_0
    move-exception p0

    :try_start_1
    monitor-exit v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw p0

    :cond_0
    :goto_0
    return-void
.end method

.method public a(Ljava/lang/String;Lcom/google/android/gms/cast/LaunchOptions;Lcom/google/android/gms/common/api/BaseImplementation$b;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Lcom/google/android/gms/cast/LaunchOptions;",
            "Lcom/google/android/gms/common/api/BaseImplementation$b<",
            "Lcom/google/android/gms/cast/Cast$ApplicationConnectionResult;",
            ">;)V"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/IllegalStateException;,
            Landroid/os/RemoteException;
        }
    .end annotation

    invoke-direct {p0, p3}, Lcom/google/android/gms/internal/ij;->c(Lcom/google/android/gms/common/api/BaseImplementation$b;)V

    invoke-virtual {p0}, Lcom/google/android/gms/internal/ij;->gS()Landroid/os/IInterface;

    move-result-object p0

    check-cast p0, Lcom/google/android/gms/internal/in;

    invoke-interface {p0, p1, p2}, Lcom/google/android/gms/internal/in;->a(Ljava/lang/String;Lcom/google/android/gms/cast/LaunchOptions;)V

    return-void
.end method

.method public a(Ljava/lang/String;Lcom/google/android/gms/common/api/BaseImplementation$b;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Lcom/google/android/gms/common/api/BaseImplementation$b<",
            "Lcom/google/android/gms/common/api/Status;",
            ">;)V"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/IllegalStateException;,
            Landroid/os/RemoteException;
        }
    .end annotation

    invoke-direct {p0, p2}, Lcom/google/android/gms/internal/ij;->e(Lcom/google/android/gms/common/api/BaseImplementation$b;)V

    invoke-virtual {p0}, Lcom/google/android/gms/internal/ij;->gS()Landroid/os/IInterface;

    move-result-object p0

    check-cast p0, Lcom/google/android/gms/internal/in;

    invoke-interface {p0, p1}, Lcom/google/android/gms/internal/in;->aH(Ljava/lang/String;)V

    return-void
.end method

.method public a(Ljava/lang/String;Ljava/lang/String;Lcom/google/android/gms/common/api/BaseImplementation$b;)V
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Lcom/google/android/gms/common/api/BaseImplementation$b<",
            "Lcom/google/android/gms/common/api/Status;",
            ">;)V"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/IllegalArgumentException;,
            Ljava/lang/IllegalStateException;,
            Landroid/os/RemoteException;
        }
    .end annotation

    invoke-static {p2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_1

    invoke-virtual {p2}, Ljava/lang/String;->length()I

    move-result v0

    const/high16 v1, 0x10000

    if-gt v0, v1, :cond_0

    invoke-static {p1}, Lcom/google/android/gms/internal/ik;->aF(Ljava/lang/String;)V

    invoke-direct {p0}, Lcom/google/android/gms/internal/ij;->fG()V

    iget-object v0, p0, Lcom/google/android/gms/internal/ij;->GD:Ljava/util/concurrent/atomic/AtomicLong;

    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicLong;->incrementAndGet()J

    move-result-wide v0

    :try_start_0
    iget-object v2, p0, Lcom/google/android/gms/internal/ij;->GH:Ljava/util/Map;

    invoke-static {v0, v1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v3

    invoke-interface {v2, v3, p3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    invoke-virtual {p0}, Lcom/google/android/gms/internal/ij;->gS()Landroid/os/IInterface;

    move-result-object p3

    check-cast p3, Lcom/google/android/gms/internal/in;

    invoke-interface {p3, p1, p2, v0, v1}, Lcom/google/android/gms/internal/in;->a(Ljava/lang/String;Ljava/lang/String;J)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    return-void

    :catchall_0
    move-exception p1

    iget-object p0, p0, Lcom/google/android/gms/internal/ij;->GH:Ljava/util/Map;

    invoke-static {v0, v1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object p2

    invoke-interface {p0, p2}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    throw p1

    :cond_0
    new-instance p0, Ljava/lang/IllegalArgumentException;

    const-string p1, "Message exceeds maximum size"

    invoke-direct {p0, p1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p0

    :cond_1
    new-instance p0, Ljava/lang/IllegalArgumentException;

    const-string p1, "The message payload cannot be null or empty"

    invoke-direct {p0, p1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p0
.end method

.method public a(Ljava/lang/String;ZLcom/google/android/gms/common/api/BaseImplementation$b;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Z",
            "Lcom/google/android/gms/common/api/BaseImplementation$b<",
            "Lcom/google/android/gms/cast/Cast$ApplicationConnectionResult;",
            ">;)V"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/IllegalStateException;,
            Landroid/os/RemoteException;
        }
    .end annotation

    invoke-direct {p0, p3}, Lcom/google/android/gms/internal/ij;->c(Lcom/google/android/gms/common/api/BaseImplementation$b;)V

    invoke-virtual {p0}, Lcom/google/android/gms/internal/ij;->gS()Landroid/os/IInterface;

    move-result-object p0

    check-cast p0, Lcom/google/android/gms/internal/in;

    invoke-interface {p0, p1, p2}, Lcom/google/android/gms/internal/in;->f(Ljava/lang/String;Z)V

    return-void
.end method

.method public aE(Ljava/lang/String;)V
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/IllegalArgumentException;,
            Landroid/os/RemoteException;
        }
    .end annotation

    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_1

    iget-object v0, p0, Lcom/google/android/gms/internal/ij;->Gu:Ljava/util/Map;

    monitor-enter v0

    :try_start_0
    iget-object v1, p0, Lcom/google/android/gms/internal/ij;->Gu:Ljava/util/Map;

    invoke-interface {v1, p1}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/google/android/gms/cast/Cast$MessageReceivedCallback;

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    if-eqz v1, :cond_0

    :try_start_1
    invoke-virtual {p0}, Lcom/google/android/gms/internal/ij;->gS()Landroid/os/IInterface;

    move-result-object p0

    check-cast p0, Lcom/google/android/gms/internal/in;

    invoke-interface {p0, p1}, Lcom/google/android/gms/internal/in;->aJ(Ljava/lang/String;)V
    :try_end_1
    .catch Ljava/lang/IllegalStateException; {:try_start_1 .. :try_end_1} :catch_0

    goto :goto_0

    :catch_0
    move-exception p0

    sget-object v0, Lcom/google/android/gms/internal/ij;->Gr:Lcom/google/android/gms/internal/ip;

    const-string v1, "Error unregistering namespace (%s): %s"

    invoke-virtual {p0}, Ljava/lang/IllegalStateException;->getMessage()Ljava/lang/String;

    move-result-object v2

    filled-new-array {p1, v2}, [Ljava/lang/Object;

    move-result-object p1

    invoke-virtual {v0, p0, v1, p1}, Lcom/google/android/gms/internal/ip;->a(Ljava/lang/Throwable;Ljava/lang/String;[Ljava/lang/Object;)V

    :cond_0
    :goto_0
    return-void

    :catchall_0
    move-exception p0

    :try_start_2
    monitor-exit v0
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    throw p0

    :cond_1
    new-instance p0, Ljava/lang/IllegalArgumentException;

    const-string p1, "Channel namespace cannot be null or empty"

    invoke-direct {p0, p1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p0
.end method

.method public b(Ljava/lang/String;Ljava/lang/String;Lcom/google/android/gms/common/api/BaseImplementation$b;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Lcom/google/android/gms/common/api/BaseImplementation$b<",
            "Lcom/google/android/gms/cast/Cast$ApplicationConnectionResult;",
            ">;)V"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/IllegalStateException;,
            Landroid/os/RemoteException;
        }
    .end annotation

    invoke-direct {p0, p3}, Lcom/google/android/gms/internal/ij;->c(Lcom/google/android/gms/common/api/BaseImplementation$b;)V

    invoke-virtual {p0}, Lcom/google/android/gms/internal/ij;->gS()Landroid/os/IInterface;

    move-result-object p0

    check-cast p0, Lcom/google/android/gms/internal/in;

    invoke-interface {p0, p1, p2}, Lcom/google/android/gms/internal/in;->l(Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method

.method public d(Lcom/google/android/gms/common/api/BaseImplementation$b;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/google/android/gms/common/api/BaseImplementation$b<",
            "Lcom/google/android/gms/common/api/Status;",
            ">;)V"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/IllegalStateException;,
            Landroid/os/RemoteException;
        }
    .end annotation

    invoke-direct {p0, p1}, Lcom/google/android/gms/internal/ij;->e(Lcom/google/android/gms/common/api/BaseImplementation$b;)V

    invoke-virtual {p0}, Lcom/google/android/gms/internal/ij;->gS()Landroid/os/IInterface;

    move-result-object p0

    check-cast p0, Lcom/google/android/gms/internal/in;

    invoke-interface {p0}, Lcom/google/android/gms/internal/in;->fP()V

    return-void
.end method

.method public disconnect()V
    .locals 4

    sget-object v0, Lcom/google/android/gms/internal/ij;->Gr:Lcom/google/android/gms/internal/ip;

    iget-object v1, p0, Lcom/google/android/gms/internal/ij;->Gw:Lcom/google/android/gms/internal/ij$c;

    invoke-virtual {p0}, Lcom/google/android/gms/internal/ij;->isConnected()Z

    move-result v2

    invoke-static {v2}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v2

    filled-new-array {v1, v2}, [Ljava/lang/Object;

    move-result-object v1

    const-string v2, "disconnect(); ServiceListener=%s, isConnected=%b"

    invoke-virtual {v0, v2, v1}, Lcom/google/android/gms/internal/ip;->b(Ljava/lang/String;[Ljava/lang/Object;)V

    iget-object v1, p0, Lcom/google/android/gms/internal/ij;->Gw:Lcom/google/android/gms/internal/ij$c;

    const/4 v2, 0x0

    iput-object v2, p0, Lcom/google/android/gms/internal/ij;->Gw:Lcom/google/android/gms/internal/ij$c;

    if-eqz v1, :cond_3

    invoke-virtual {v1}, Lcom/google/android/gms/internal/ij$c;->fK()Z

    move-result v1

    if-nez v1, :cond_0

    goto :goto_3

    :cond_0
    invoke-direct {p0}, Lcom/google/android/gms/internal/ij;->fF()V

    :try_start_0
    invoke-virtual {p0}, Lcom/google/android/gms/internal/ij;->isConnected()Z

    move-result v0

    if-nez v0, :cond_1

    invoke-virtual {p0}, Lcom/google/android/gms/internal/ij;->isConnecting()Z

    move-result v0

    if-eqz v0, :cond_2

    :cond_1
    invoke-virtual {p0}, Lcom/google/android/gms/internal/ij;->gS()Landroid/os/IInterface;

    move-result-object v0

    check-cast v0, Lcom/google/android/gms/internal/in;

    invoke-interface {v0}, Lcom/google/android/gms/internal/in;->disconnect()V
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    :cond_2
    :goto_0
    invoke-super {p0}, Lcom/google/android/gms/common/internal/e;->disconnect()V

    goto :goto_1

    :catchall_0
    move-exception v0

    goto :goto_2

    :catch_0
    move-exception v0

    :try_start_1
    sget-object v1, Lcom/google/android/gms/internal/ij;->Gr:Lcom/google/android/gms/internal/ip;

    const-string v2, "Error while disconnecting the controller interface: %s"

    invoke-virtual {v0}, Landroid/os/RemoteException;->getMessage()Ljava/lang/String;

    move-result-object v3

    filled-new-array {v3}, [Ljava/lang/Object;

    move-result-object v3

    invoke-virtual {v1, v0, v2, v3}, Lcom/google/android/gms/internal/ip;->a(Ljava/lang/Throwable;Ljava/lang/String;[Ljava/lang/Object;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_0

    :goto_1
    return-void

    :goto_2
    invoke-super {p0}, Lcom/google/android/gms/common/internal/e;->disconnect()V

    throw v0

    :cond_3
    :goto_3
    const/4 p0, 0x0

    new-array p0, p0, [Ljava/lang/Object;

    const-string v1, "already disposed, so short-circuiting"

    invoke-virtual {v0, v1, p0}, Lcom/google/android/gms/internal/ip;->b(Ljava/lang/String;[Ljava/lang/Object;)V

    return-void
.end method

.method public fC()Landroid/os/Bundle;
    .locals 2

    iget-object v0, p0, Lcom/google/android/gms/internal/ij;->GG:Landroid/os/Bundle;

    if-eqz v0, :cond_0

    const/4 v1, 0x0

    iput-object v1, p0, Lcom/google/android/gms/internal/ij;->GG:Landroid/os/Bundle;

    return-object v0

    :cond_0
    invoke-super {p0}, Lcom/google/android/gms/common/internal/e;->fC()Landroid/os/Bundle;

    move-result-object p0

    return-object p0
.end method

.method public fD()V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/IllegalStateException;,
            Landroid/os/RemoteException;
        }
    .end annotation

    invoke-virtual {p0}, Lcom/google/android/gms/internal/ij;->gS()Landroid/os/IInterface;

    move-result-object p0

    check-cast p0, Lcom/google/android/gms/internal/in;

    invoke-interface {p0}, Lcom/google/android/gms/internal/in;->fD()V

    return-void
.end method

.method public fE()D
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/IllegalStateException;
        }
    .end annotation

    invoke-direct {p0}, Lcom/google/android/gms/internal/ij;->fG()V

    iget-wide v0, p0, Lcom/google/android/gms/internal/ij;->FA:D

    return-wide v0
.end method

.method public getApplicationMetadata()Lcom/google/android/gms/cast/ApplicationMetadata;
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/IllegalStateException;
        }
    .end annotation

    invoke-direct {p0}, Lcom/google/android/gms/internal/ij;->fG()V

    iget-object p0, p0, Lcom/google/android/gms/internal/ij;->Gs:Lcom/google/android/gms/cast/ApplicationMetadata;

    return-object p0
.end method

.method public getApplicationStatus()Ljava/lang/String;
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/IllegalStateException;
        }
    .end annotation

    invoke-direct {p0}, Lcom/google/android/gms/internal/ij;->fG()V

    iget-object p0, p0, Lcom/google/android/gms/internal/ij;->Gx:Ljava/lang/String;

    return-object p0
.end method

.method protected getServiceDescriptor()Ljava/lang/String;
    .locals 0

    const-string p0, "com.google.android.gms.cast.internal.ICastDeviceController"

    return-object p0
.end method

.method protected getStartServiceAction()Ljava/lang/String;
    .locals 0

    const-string p0, "com.google.android.gms.cast.service.BIND_CAST_DEVICE_CONTROLLER_SERVICE"

    return-object p0
.end method

.method public isMute()Z
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/IllegalStateException;
        }
    .end annotation

    invoke-direct {p0}, Lcom/google/android/gms/internal/ij;->fG()V

    iget-boolean p0, p0, Lcom/google/android/gms/internal/ij;->FB:Z

    return p0
.end method

.method protected synthetic j(Landroid/os/IBinder;)Landroid/os/IInterface;
    .locals 0

    invoke-virtual {p0, p1}, Lcom/google/android/gms/internal/ij;->L(Landroid/os/IBinder;)Lcom/google/android/gms/internal/in;

    move-result-object p0

    return-object p0
.end method
