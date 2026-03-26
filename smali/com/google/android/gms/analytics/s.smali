.class Lcom/google/android/gms/analytics/s;
.super Ljava/lang/Thread;

# interfaces
.implements Lcom/google/android/gms/analytics/f;


# static fields
.field private static yX:Lcom/google/android/gms/analytics/s;


# instance fields
.field private volatile mClosed:Z

.field private final mContext:Landroid/content/Context;

.field private final yT:Ljava/util/concurrent/LinkedBlockingQueue;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/concurrent/LinkedBlockingQueue<",
            "Ljava/lang/Runnable;",
            ">;"
        }
    .end annotation
.end field

.field private volatile yU:Z

.field private volatile yV:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/google/android/gms/internal/hb;",
            ">;"
        }
    .end annotation
.end field

.field private volatile yW:Ljava/lang/String;

.field private volatile yY:Lcom/google/android/gms/analytics/af;


# direct methods
.method private constructor <init>(Landroid/content/Context;)V
    .locals 1

    const-string v0, "GAThread"

    invoke-direct {p0, v0}, Ljava/lang/Thread;-><init>(Ljava/lang/String;)V

    new-instance v0, Ljava/util/concurrent/LinkedBlockingQueue;

    invoke-direct {v0}, Ljava/util/concurrent/LinkedBlockingQueue;-><init>()V

    iput-object v0, p0, Lcom/google/android/gms/analytics/s;->yT:Ljava/util/concurrent/LinkedBlockingQueue;

    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/google/android/gms/analytics/s;->yU:Z

    iput-boolean v0, p0, Lcom/google/android/gms/analytics/s;->mClosed:Z

    if-eqz p1, :cond_0

    invoke-virtual {p1}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object p1

    :cond_0
    iput-object p1, p0, Lcom/google/android/gms/analytics/s;->mContext:Landroid/content/Context;

    invoke-virtual {p0}, Lcom/google/android/gms/analytics/s;->start()V

    return-void
.end method

.method static B(Landroid/content/Context;)Lcom/google/android/gms/analytics/s;
    .locals 1

    sget-object v0, Lcom/google/android/gms/analytics/s;->yX:Lcom/google/android/gms/analytics/s;

    if-nez v0, :cond_0

    new-instance v0, Lcom/google/android/gms/analytics/s;

    invoke-direct {v0, p0}, Lcom/google/android/gms/analytics/s;-><init>(Landroid/content/Context;)V

    sput-object v0, Lcom/google/android/gms/analytics/s;->yX:Lcom/google/android/gms/analytics/s;

    :cond_0
    sget-object p0, Lcom/google/android/gms/analytics/s;->yX:Lcom/google/android/gms/analytics/s;

    return-object p0
.end method

.method static C(Landroid/content/Context;)Ljava/lang/String;
    .locals 8

    const-string v0, "gaInstallData"

    const-string v1, "Campaign found: "

    const/4 v2, 0x0

    :try_start_0
    invoke-virtual {p0, v0}, Landroid/content/Context;->openFileInput(Ljava/lang/String;)Ljava/io/FileInputStream;

    move-result-object v3

    const/16 v4, 0x2000

    new-array v5, v4, [B

    const/4 v6, 0x0

    invoke-virtual {v3, v5, v6, v4}, Ljava/io/FileInputStream;->read([BII)I

    move-result v4

    invoke-virtual {v3}, Ljava/io/FileInputStream;->available()I

    move-result v7

    if-lez v7, :cond_0

    const-string v1, "Too much campaign data, ignoring it."

    invoke-static {v1}, Lcom/google/android/gms/analytics/z;->T(Ljava/lang/String;)V

    invoke-virtual {v3}, Ljava/io/FileInputStream;->close()V

    invoke-virtual {p0, v0}, Landroid/content/Context;->deleteFile(Ljava/lang/String;)Z

    return-object v2

    :cond_0
    invoke-virtual {v3}, Ljava/io/FileInputStream;->close()V

    invoke-virtual {p0, v0}, Landroid/content/Context;->deleteFile(Ljava/lang/String;)Z

    if-gtz v4, :cond_1

    const-string v1, "Campaign file is empty."

    invoke-static {v1}, Lcom/google/android/gms/analytics/z;->W(Ljava/lang/String;)V

    return-object v2

    :cond_1
    new-instance v3, Ljava/lang/String;

    invoke-direct {v3, v5, v6, v4}, Ljava/lang/String;-><init>([BII)V

    invoke-virtual {v1, v3}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Lcom/google/android/gms/analytics/z;->U(Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/io/FileNotFoundException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    return-object v3

    :catch_0
    const-string v1, "Error reading campaign data."

    invoke-static {v1}, Lcom/google/android/gms/analytics/z;->T(Ljava/lang/String;)V

    invoke-virtual {p0, v0}, Landroid/content/Context;->deleteFile(Ljava/lang/String;)Z

    return-object v2

    :catch_1
    const-string p0, "No campaign data found."

    invoke-static {p0}, Lcom/google/android/gms/analytics/z;->U(Ljava/lang/String;)V

    return-object v2
.end method

.method static synthetic a(Lcom/google/android/gms/analytics/s;)Landroid/content/Context;
    .locals 0

    iget-object p0, p0, Lcom/google/android/gms/analytics/s;->mContext:Landroid/content/Context;

    return-object p0
.end method

.method static synthetic a(Lcom/google/android/gms/analytics/s;Ljava/lang/String;)Ljava/lang/String;
    .locals 0

    iput-object p1, p0, Lcom/google/android/gms/analytics/s;->yW:Ljava/lang/String;

    return-object p1
.end method

.method static synthetic a(Lcom/google/android/gms/analytics/s;Ljava/util/Map;)V
    .locals 0

    invoke-direct {p0, p1}, Lcom/google/android/gms/analytics/s;->x(Ljava/util/Map;)V

    return-void
.end method

.method static ah(Ljava/lang/String;)I
    .locals 4

    invoke-static {p0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    const/4 v1, 0x1

    if-nez v0, :cond_1

    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v0

    sub-int/2addr v0, v1

    const/4 v1, 0x0

    :goto_0
    if-ltz v0, :cond_1

    invoke-virtual {p0, v0}, Ljava/lang/String;->charAt(I)C

    move-result v2

    shl-int/lit8 v1, v1, 0x6

    const v3, 0xfffffff

    and-int/2addr v1, v3

    add-int/2addr v1, v2

    shl-int/lit8 v2, v2, 0xe

    add-int/2addr v1, v2

    const/high16 v2, 0xfe00000

    and-int/2addr v2, v1

    if-eqz v2, :cond_0

    shr-int/lit8 v2, v2, 0x15

    xor-int/2addr v1, v2

    :cond_0
    add-int/lit8 v0, v0, -0x1

    goto :goto_0

    :cond_1
    return v1
.end method

.method static synthetic b(Lcom/google/android/gms/analytics/s;)Ljava/lang/String;
    .locals 0

    iget-object p0, p0, Lcom/google/android/gms/analytics/s;->yW:Ljava/lang/String;

    return-object p0
.end method

.method static synthetic b(Lcom/google/android/gms/analytics/s;Ljava/util/Map;)Z
    .locals 0

    invoke-direct {p0, p1}, Lcom/google/android/gms/analytics/s;->w(Ljava/util/Map;)Z

    move-result p0

    return p0
.end method

.method static synthetic c(Lcom/google/android/gms/analytics/s;)Ljava/util/List;
    .locals 0

    iget-object p0, p0, Lcom/google/android/gms/analytics/s;->yV:Ljava/util/List;

    return-object p0
.end method

.method static synthetic c(Lcom/google/android/gms/analytics/s;Ljava/util/Map;)V
    .locals 0

    invoke-direct {p0, p1}, Lcom/google/android/gms/analytics/s;->y(Ljava/util/Map;)V

    return-void
.end method

.method static synthetic d(Lcom/google/android/gms/analytics/s;)Lcom/google/android/gms/analytics/af;
    .locals 0

    iget-object p0, p0, Lcom/google/android/gms/analytics/s;->yY:Lcom/google/android/gms/analytics/af;

    return-object p0
.end method

.method static synthetic d(Lcom/google/android/gms/analytics/s;Ljava/util/Map;)Ljava/lang/String;
    .locals 0

    invoke-direct {p0, p1}, Lcom/google/android/gms/analytics/s;->v(Ljava/util/Map;)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method private g(Ljava/lang/Throwable;)Ljava/lang/String;
    .locals 1

    new-instance p0, Ljava/io/ByteArrayOutputStream;

    invoke-direct {p0}, Ljava/io/ByteArrayOutputStream;-><init>()V

    new-instance v0, Ljava/io/PrintStream;

    invoke-direct {v0, p0}, Ljava/io/PrintStream;-><init>(Ljava/io/OutputStream;)V

    invoke-virtual {p1, v0}, Ljava/lang/Throwable;->printStackTrace(Ljava/io/PrintStream;)V

    invoke-virtual {v0}, Ljava/io/PrintStream;->flush()V

    new-instance p1, Ljava/lang/String;

    invoke-virtual {p0}, Ljava/io/ByteArrayOutputStream;->toByteArray()[B

    move-result-object p0

    invoke-direct {p1, p0}, Ljava/lang/String;-><init>([B)V

    return-object p1
.end method

.method private v(Ljava/util/Map;)Ljava/lang/String;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;)",
            "Ljava/lang/String;"
        }
    .end annotation

    const-string p0, "useSecure"

    invoke-interface {p1, p0}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v0

    const-string v1, "https:"

    if-eqz v0, :cond_1

    invoke-interface {p1, p0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Ljava/lang/String;

    const/4 p1, 0x1

    invoke-static {p0, p1}, Lcom/google/android/gms/analytics/aj;->e(Ljava/lang/String;Z)Z

    move-result p0

    if-eqz p0, :cond_0

    goto :goto_0

    :cond_0
    const-string v1, "http:"

    :cond_1
    :goto_0
    return-object v1
.end method

.method private w(Ljava/util/Map;)Z
    .locals 8
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;)Z"
        }
    .end annotation

    const-string p0, "&sf"

    invoke-interface {p1, p0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    const/4 v1, 0x0

    if-nez v0, :cond_0

    return v1

    :cond_0
    invoke-interface {p1, p0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Ljava/lang/String;

    const-wide/high16 v2, 0x4059000000000000L    # 100.0

    invoke-static {p0, v2, v3}, Lcom/google/android/gms/analytics/aj;->a(Ljava/lang/String;D)D

    move-result-wide v4

    cmpl-double p0, v4, v2

    if-ltz p0, :cond_1

    return v1

    :cond_1
    const-string p0, "&cid"

    invoke-interface {p1, p0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Ljava/lang/String;

    invoke-static {p0}, Lcom/google/android/gms/analytics/s;->ah(Ljava/lang/String;)I

    move-result p0

    rem-int/lit16 p0, p0, 0x2710

    int-to-double v6, p0

    mul-double/2addr v4, v2

    cmpl-double p0, v6, v4

    if-ltz p0, :cond_3

    const-string p0, "&t"

    invoke-interface {p1, p0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    if-nez v0, :cond_2

    const-string p0, "unknown"

    goto :goto_0

    :cond_2
    invoke-interface {p1, p0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Ljava/lang/String;

    :goto_0
    const-string p1, "%s hit sampled out"

    filled-new-array {p0}, [Ljava/lang/Object;

    move-result-object p0

    invoke-static {p1, p0}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p0

    invoke-static {p0}, Lcom/google/android/gms/analytics/z;->V(Ljava/lang/String;)V

    const/4 p0, 0x1

    return p0

    :cond_3
    return v1
.end method

.method private x(Ljava/util/Map;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    iget-object p0, p0, Lcom/google/android/gms/analytics/s;->mContext:Landroid/content/Context;

    invoke-static {p0}, Lcom/google/android/gms/analytics/a;->w(Landroid/content/Context;)Lcom/google/android/gms/analytics/l;

    move-result-object p0

    const-string v0, "&adid"

    invoke-static {p1, v0, p0}, Lcom/google/android/gms/analytics/aj;->a(Ljava/util/Map;Ljava/lang/String;Lcom/google/android/gms/analytics/l;)V

    const-string v0, "&ate"

    invoke-static {p1, v0, p0}, Lcom/google/android/gms/analytics/aj;->a(Ljava/util/Map;Ljava/lang/String;Lcom/google/android/gms/analytics/l;)V

    return-void
.end method

.method private y(Ljava/util/Map;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    invoke-static {}, Lcom/google/android/gms/analytics/g;->dP()Lcom/google/android/gms/analytics/g;

    move-result-object p0

    const-string v0, "&an"

    invoke-static {p1, v0, p0}, Lcom/google/android/gms/analytics/aj;->a(Ljava/util/Map;Ljava/lang/String;Lcom/google/android/gms/analytics/l;)V

    const-string v0, "&av"

    invoke-static {p1, v0, p0}, Lcom/google/android/gms/analytics/aj;->a(Ljava/util/Map;Ljava/lang/String;Lcom/google/android/gms/analytics/l;)V

    const-string v0, "&aid"

    invoke-static {p1, v0, p0}, Lcom/google/android/gms/analytics/aj;->a(Ljava/util/Map;Ljava/lang/String;Lcom/google/android/gms/analytics/l;)V

    const-string v0, "&aiid"

    invoke-static {p1, v0, p0}, Lcom/google/android/gms/analytics/aj;->a(Ljava/util/Map;Ljava/lang/String;Lcom/google/android/gms/analytics/l;)V

    const-string p0, "&v"

    const-string v0, "1"

    invoke-interface {p1, p0, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    return-void
.end method


# virtual methods
.method b(Ljava/lang/Runnable;)V
    .locals 0

    iget-object p0, p0, Lcom/google/android/gms/analytics/s;->yT:Ljava/util/concurrent/LinkedBlockingQueue;

    invoke-virtual {p0, p1}, Ljava/util/concurrent/LinkedBlockingQueue;->add(Ljava/lang/Object;)Z

    return-void
.end method

.method public dH()V
    .locals 1

    new-instance v0, Lcom/google/android/gms/analytics/s$3;

    invoke-direct {v0, p0}, Lcom/google/android/gms/analytics/s$3;-><init>(Lcom/google/android/gms/analytics/s;)V

    invoke-virtual {p0, v0}, Lcom/google/android/gms/analytics/s;->b(Ljava/lang/Runnable;)V

    return-void
.end method

.method public dN()V
    .locals 1

    new-instance v0, Lcom/google/android/gms/analytics/s$4;

    invoke-direct {v0, p0}, Lcom/google/android/gms/analytics/s$4;-><init>(Lcom/google/android/gms/analytics/s;)V

    invoke-virtual {p0, v0}, Lcom/google/android/gms/analytics/s;->b(Ljava/lang/Runnable;)V

    return-void
.end method

.method public dO()Ljava/util/concurrent/LinkedBlockingQueue;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/concurrent/LinkedBlockingQueue<",
            "Ljava/lang/Runnable;",
            ">;"
        }
    .end annotation

    iget-object p0, p0, Lcom/google/android/gms/analytics/s;->yT:Ljava/util/concurrent/LinkedBlockingQueue;

    return-object p0
.end method

.method public dispatch()V
    .locals 1

    new-instance v0, Lcom/google/android/gms/analytics/s$2;

    invoke-direct {v0, p0}, Lcom/google/android/gms/analytics/s$2;-><init>(Lcom/google/android/gms/analytics/s;)V

    invoke-virtual {p0, v0}, Lcom/google/android/gms/analytics/s;->b(Ljava/lang/Runnable;)V

    return-void
.end method

.method public getThread()Ljava/lang/Thread;
    .locals 0

    return-object p0
.end method

.method protected init()V
    .locals 5

    iget-object v0, p0, Lcom/google/android/gms/analytics/s;->yY:Lcom/google/android/gms/analytics/af;

    invoke-interface {v0}, Lcom/google/android/gms/analytics/af;->eg()V

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/google/android/gms/analytics/s;->yV:Ljava/util/List;

    iget-object v0, p0, Lcom/google/android/gms/analytics/s;->yV:Ljava/util/List;

    new-instance v1, Lcom/google/android/gms/internal/hb;

    const-string v2, "_v"

    const-string v3, "ma4.0.3"

    const-string v4, "appendVersion"

    invoke-direct {v1, v4, v2, v3}, Lcom/google/android/gms/internal/hb;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    iget-object v0, p0, Lcom/google/android/gms/analytics/s;->yV:Ljava/util/List;

    new-instance v1, Lcom/google/android/gms/internal/hb;

    const-string v2, "appendQueueTime"

    const-string v3, "qt"

    const/4 v4, 0x0

    invoke-direct {v1, v2, v3, v4}, Lcom/google/android/gms/internal/hb;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    iget-object p0, p0, Lcom/google/android/gms/analytics/s;->yV:Ljava/util/List;

    new-instance v0, Lcom/google/android/gms/internal/hb;

    const-string v1, "appendCacheBuster"

    const-string v2, "z"

    invoke-direct {v0, v1, v2, v4}, Lcom/google/android/gms/internal/hb;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {p0, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    return-void
.end method

.method public run()V
    .locals 4

    const/16 v0, 0xa

    invoke-static {v0}, Landroid/os/Process;->setThreadPriority(I)V

    const-wide/16 v0, 0x1388

    :try_start_0
    invoke-static {v0, v1}, Ljava/lang/Thread;->sleep(J)V
    :try_end_0
    .catch Ljava/lang/InterruptedException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    const-string v0, "sleep interrupted in GAThread initialize"

    invoke-static {v0}, Lcom/google/android/gms/analytics/z;->W(Ljava/lang/String;)V

    :goto_0
    const/4 v0, 0x1

    :try_start_1
    iget-object v1, p0, Lcom/google/android/gms/analytics/s;->yY:Lcom/google/android/gms/analytics/af;

    if-nez v1, :cond_0

    new-instance v1, Lcom/google/android/gms/analytics/r;

    iget-object v2, p0, Lcom/google/android/gms/analytics/s;->mContext:Landroid/content/Context;

    invoke-direct {v1, v2, p0}, Lcom/google/android/gms/analytics/r;-><init>(Landroid/content/Context;Lcom/google/android/gms/analytics/f;)V

    iput-object v1, p0, Lcom/google/android/gms/analytics/s;->yY:Lcom/google/android/gms/analytics/af;

    :cond_0
    invoke-virtual {p0}, Lcom/google/android/gms/analytics/s;->init()V

    iget-object v1, p0, Lcom/google/android/gms/analytics/s;->mContext:Landroid/content/Context;

    invoke-static {v1}, Lcom/google/android/gms/analytics/s;->C(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v1

    iput-object v1, p0, Lcom/google/android/gms/analytics/s;->yW:Ljava/lang/String;

    const-string v1, "Initialized GA Thread"

    invoke-static {v1}, Lcom/google/android/gms/analytics/z;->V(Ljava/lang/String;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_2

    :catchall_0
    move-exception v1

    new-instance v2, Ljava/lang/StringBuilder;

    const-string v3, "Error initializing the GAThread: "

    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-direct {p0, v1}, Lcom/google/android/gms/analytics/s;->g(Ljava/lang/Throwable;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Lcom/google/android/gms/analytics/z;->T(Ljava/lang/String;)V

    const-string v1, "Google Analytics will not start up."

    :goto_1
    invoke-static {v1}, Lcom/google/android/gms/analytics/z;->T(Ljava/lang/String;)V

    iput-boolean v0, p0, Lcom/google/android/gms/analytics/s;->yU:Z

    :cond_1
    :goto_2
    iget-boolean v1, p0, Lcom/google/android/gms/analytics/s;->mClosed:Z

    if-nez v1, :cond_2

    :try_start_2
    iget-object v1, p0, Lcom/google/android/gms/analytics/s;->yT:Ljava/util/concurrent/LinkedBlockingQueue;

    invoke-virtual {v1}, Ljava/util/concurrent/LinkedBlockingQueue;->take()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/Runnable;

    iget-boolean v2, p0, Lcom/google/android/gms/analytics/s;->yU:Z

    if-nez v2, :cond_1

    invoke-interface {v1}, Ljava/lang/Runnable;->run()V
    :try_end_2
    .catch Ljava/lang/InterruptedException; {:try_start_2 .. :try_end_2} :catch_1
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    goto :goto_2

    :catchall_1
    move-exception v1

    goto :goto_3

    :catch_1
    move-exception v1

    :try_start_3
    invoke-virtual {v1}, Ljava/lang/InterruptedException;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Lcom/google/android/gms/analytics/z;->U(Ljava/lang/String;)V
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_1

    goto :goto_2

    :goto_3
    new-instance v2, Ljava/lang/StringBuilder;

    const-string v3, "Error on GAThread: "

    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-direct {p0, v1}, Lcom/google/android/gms/analytics/s;->g(Ljava/lang/Throwable;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Lcom/google/android/gms/analytics/z;->T(Ljava/lang/String;)V

    const-string v1, "Google Analytics is shutting down."

    goto :goto_1

    :cond_2
    return-void
.end method

.method public u(Ljava/util/Map;)V
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0, p1}, Ljava/util/HashMap;-><init>(Ljava/util/Map;)V

    const-string v1, "&ht"

    invoke-interface {p1, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/lang/String;

    if-eqz p1, :cond_0

    :try_start_0
    invoke-static {p1}, Ljava/lang/Long;->valueOf(Ljava/lang/String;)Ljava/lang/Long;
    :try_end_0
    .catch Ljava/lang/NumberFormatException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    const/4 p1, 0x0

    :cond_0
    :goto_0
    if-nez p1, :cond_1

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v2

    invoke-static {v2, v3}, Ljava/lang/Long;->toString(J)Ljava/lang/String;

    move-result-object p1

    invoke-interface {v0, v1, p1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    :cond_1
    new-instance p1, Lcom/google/android/gms/analytics/s$1;

    invoke-direct {p1, p0, v0}, Lcom/google/android/gms/analytics/s$1;-><init>(Lcom/google/android/gms/analytics/s;Ljava/util/Map;)V

    invoke-virtual {p0, p1}, Lcom/google/android/gms/analytics/s;->b(Ljava/lang/Runnable;)V

    return-void
.end method
