.class public final Lcom/google/android/gms/internal/fr;
.super Lcom/google/android/gms/internal/fm$a;


# annotations
.annotation runtime Lcom/google/android/gms/internal/ez;
.end annotation


# static fields
.field private static final uf:Ljava/lang/Object;

.field private static ug:Lcom/google/android/gms/internal/fr;


# instance fields
.field private final mContext:Landroid/content/Context;

.field private final uh:Lcom/google/android/gms/internal/fx;

.field private final ui:Lcom/google/android/gms/internal/ci;

.field private final uj:Lcom/google/android/gms/internal/bm;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    new-instance v0, Ljava/lang/Object;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    sput-object v0, Lcom/google/android/gms/internal/fr;->uf:Ljava/lang/Object;

    return-void
.end method

.method constructor <init>(Landroid/content/Context;Lcom/google/android/gms/internal/bm;Lcom/google/android/gms/internal/ci;Lcom/google/android/gms/internal/fx;)V
    .locals 0

    invoke-direct {p0}, Lcom/google/android/gms/internal/fm$a;-><init>()V

    iput-object p1, p0, Lcom/google/android/gms/internal/fr;->mContext:Landroid/content/Context;

    iput-object p4, p0, Lcom/google/android/gms/internal/fr;->uh:Lcom/google/android/gms/internal/fx;

    iput-object p3, p0, Lcom/google/android/gms/internal/fr;->ui:Lcom/google/android/gms/internal/ci;

    iput-object p2, p0, Lcom/google/android/gms/internal/fr;->uj:Lcom/google/android/gms/internal/bm;

    return-void
.end method

.method private static I(Ljava/lang/String;)Lcom/google/android/gms/internal/gw$a;
    .locals 1

    new-instance v0, Lcom/google/android/gms/internal/fr$2;

    invoke-direct {v0, p0}, Lcom/google/android/gms/internal/fr$2;-><init>(Ljava/lang/String;)V

    return-object v0
.end method

.method private static a(Landroid/content/Context;Lcom/google/android/gms/internal/bm;Lcom/google/android/gms/internal/ci;Lcom/google/android/gms/internal/fx;Lcom/google/android/gms/internal/fi;)Lcom/google/android/gms/internal/fk;
    .locals 8

    const-string v0, "Starting ad request from service."

    invoke-static {v0}, Lcom/google/android/gms/internal/gs;->S(Ljava/lang/String;)V

    invoke-interface {p2}, Lcom/google/android/gms/internal/ci;->init()V

    new-instance v0, Lcom/google/android/gms/internal/fw;

    invoke-direct {v0, p0}, Lcom/google/android/gms/internal/fw;-><init>(Landroid/content/Context;)V

    iget v1, v0, Lcom/google/android/gms/internal/fw;->vd:I

    const/4 v2, -0x1

    if-ne v1, v2, :cond_0

    const-string p0, "Device is offline."

    invoke-static {p0}, Lcom/google/android/gms/internal/gs;->S(Ljava/lang/String;)V

    new-instance p0, Lcom/google/android/gms/internal/fk;

    const/4 p1, 0x2

    invoke-direct {p0, p1}, Lcom/google/android/gms/internal/fk;-><init>(I)V

    return-object p0

    :cond_0
    new-instance v6, Lcom/google/android/gms/internal/ft;

    iget-object v1, p4, Lcom/google/android/gms/internal/fi;->applicationInfo:Landroid/content/pm/ApplicationInfo;

    iget-object v1, v1, Landroid/content/pm/ApplicationInfo;->packageName:Ljava/lang/String;

    invoke-direct {v6, v1}, Lcom/google/android/gms/internal/ft;-><init>(Ljava/lang/String;)V

    iget-object v1, p4, Lcom/google/android/gms/internal/fi;->tx:Lcom/google/android/gms/internal/av;

    iget-object v1, v1, Lcom/google/android/gms/internal/av;->extras:Landroid/os/Bundle;

    if-eqz v1, :cond_1

    iget-object v1, p4, Lcom/google/android/gms/internal/fi;->tx:Lcom/google/android/gms/internal/av;

    iget-object v1, v1, Lcom/google/android/gms/internal/av;->extras:Landroid/os/Bundle;

    const-string v2, "_ad"

    invoke-virtual {v1, v2}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    if-eqz v1, :cond_1

    invoke-static {p0, p4, v1}, Lcom/google/android/gms/internal/fs;->a(Landroid/content/Context;Lcom/google/android/gms/internal/fi;Ljava/lang/String;)Lcom/google/android/gms/internal/fk;

    move-result-object p0

    return-object p0

    :cond_1
    const-wide/16 v1, 0xfa

    invoke-interface {p2, v1, v2}, Lcom/google/android/gms/internal/ci;->a(J)Landroid/location/Location;

    move-result-object p2

    invoke-virtual {p1}, Lcom/google/android/gms/internal/bm;->bp()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {p1}, Lcom/google/android/gms/internal/bm;->bq()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p1}, Lcom/google/android/gms/internal/bm;->br()Ljava/lang/String;

    move-result-object p1

    invoke-static {p4, v0, p2, v1, p1}, Lcom/google/android/gms/internal/fs;->a(Lcom/google/android/gms/internal/fi;Lcom/google/android/gms/internal/fw;Landroid/location/Location;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    const/4 p2, 0x0

    if-nez p1, :cond_2

    new-instance p0, Lcom/google/android/gms/internal/fk;

    invoke-direct {p0, p2}, Lcom/google/android/gms/internal/fk;-><init>(I)V

    return-object p0

    :cond_2
    invoke-static {p1}, Lcom/google/android/gms/internal/fr;->I(Ljava/lang/String;)Lcom/google/android/gms/internal/gw$a;

    move-result-object v4

    sget-object p1, Lcom/google/android/gms/internal/gr;->wC:Landroid/os/Handler;

    new-instance v7, Lcom/google/android/gms/internal/fr$1;

    move-object v0, v7

    move-object v1, p0

    move-object v2, p4

    move-object v3, v6

    invoke-direct/range {v0 .. v5}, Lcom/google/android/gms/internal/fr$1;-><init>(Landroid/content/Context;Lcom/google/android/gms/internal/fi;Lcom/google/android/gms/internal/ft;Lcom/google/android/gms/internal/gw$a;Ljava/lang/String;)V

    invoke-virtual {p1, v7}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    :try_start_0
    invoke-virtual {v6}, Lcom/google/android/gms/internal/ft;->cK()Ljava/util/concurrent/Future;

    move-result-object p1

    sget-object v0, Ljava/util/concurrent/TimeUnit;->SECONDS:Ljava/util/concurrent/TimeUnit;

    const-wide/16 v1, 0xa

    invoke-interface {p1, v1, v2, v0}, Ljava/util/concurrent/Future;->get(JLjava/util/concurrent/TimeUnit;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lcom/google/android/gms/internal/fv;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    if-nez p1, :cond_3

    new-instance p0, Lcom/google/android/gms/internal/fk;

    invoke-direct {p0, p2}, Lcom/google/android/gms/internal/fk;-><init>(I)V

    return-object p0

    :cond_3
    invoke-virtual {p1}, Lcom/google/android/gms/internal/fv;->getErrorCode()I

    move-result p2

    const/4 v0, -0x2

    if-eq p2, v0, :cond_4

    new-instance p0, Lcom/google/android/gms/internal/fk;

    invoke-virtual {p1}, Lcom/google/android/gms/internal/fv;->getErrorCode()I

    move-result p1

    invoke-direct {p0, p1}, Lcom/google/android/gms/internal/fk;-><init>(I)V

    return-object p0

    :cond_4
    invoke-virtual {p1}, Lcom/google/android/gms/internal/fv;->cN()Z

    move-result p2

    if-eqz p2, :cond_5

    iget-object p2, p4, Lcom/google/android/gms/internal/fi;->ty:Landroid/content/pm/PackageInfo;

    iget-object p2, p2, Landroid/content/pm/PackageInfo;->packageName:Ljava/lang/String;

    invoke-interface {p3, p2}, Lcom/google/android/gms/internal/fx;->K(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p2

    goto :goto_0

    :cond_5
    const/4 p2, 0x0

    :goto_0
    iget-object p3, p4, Lcom/google/android/gms/internal/fi;->lD:Lcom/google/android/gms/internal/gt;

    iget-object p3, p3, Lcom/google/android/gms/internal/gt;->wD:Ljava/lang/String;

    invoke-virtual {p1}, Lcom/google/android/gms/internal/fv;->getUrl()Ljava/lang/String;

    move-result-object p4

    invoke-static {p0, p3, p4, p2, p1}, Lcom/google/android/gms/internal/fr;->a(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lcom/google/android/gms/internal/fv;)Lcom/google/android/gms/internal/fk;

    move-result-object p0

    return-object p0

    :catch_0
    new-instance p0, Lcom/google/android/gms/internal/fk;

    invoke-direct {p0, p2}, Lcom/google/android/gms/internal/fk;-><init>(I)V

    return-object p0
.end method

.method public static a(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lcom/google/android/gms/internal/fv;)Lcom/google/android/gms/internal/fk;
    .locals 11

    const-string v0, "AdRequestServiceImpl: Sending request: "

    :try_start_0
    new-instance v1, Lcom/google/android/gms/internal/fu;

    invoke-direct {v1}, Lcom/google/android/gms/internal/fu;-><init>()V

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v2, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/google/android/gms/internal/gs;->S(Ljava/lang/String;)V

    new-instance v0, Ljava/net/URL;

    invoke-direct {v0, p2}, Ljava/net/URL;-><init>(Ljava/lang/String;)V

    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    move-result-wide v2

    const/4 p2, 0x0

    move v4, p2

    :goto_0
    invoke-virtual {v0}, Ljava/net/URL;->openConnection()Ljava/net/URLConnection;

    move-result-object v5

    check-cast v5, Ljava/net/HttpURLConnection;
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    :try_start_1
    invoke-static {p0, p1, p2, v5}, Lcom/google/android/gms/internal/gj;->a(Landroid/content/Context;Ljava/lang/String;ZLjava/net/HttpURLConnection;)V

    invoke-static {p3}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v6

    if-nez v6, :cond_0

    const-string v6, "x-afma-drt-cookie"

    invoke-virtual {v5, v6, p3}, Ljava/net/HttpURLConnection;->addRequestProperty(Ljava/lang/String;Ljava/lang/String;)V

    :cond_0
    const/4 v6, 0x1

    if-eqz p4, :cond_1

    invoke-virtual {p4}, Lcom/google/android/gms/internal/fv;->cM()Ljava/lang/String;

    move-result-object v7

    invoke-static {v7}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v7

    if-nez v7, :cond_1

    invoke-virtual {v5, v6}, Ljava/net/HttpURLConnection;->setDoOutput(Z)V

    invoke-virtual {p4}, Lcom/google/android/gms/internal/fv;->cM()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/String;->getBytes()[B

    move-result-object v7

    array-length v8, v7

    invoke-virtual {v5, v8}, Ljava/net/HttpURLConnection;->setFixedLengthStreamingMode(I)V

    new-instance v8, Ljava/io/BufferedOutputStream;

    invoke-virtual {v5}, Ljava/net/HttpURLConnection;->getOutputStream()Ljava/io/OutputStream;

    move-result-object v9

    invoke-direct {v8, v9}, Ljava/io/BufferedOutputStream;-><init>(Ljava/io/OutputStream;)V

    invoke-virtual {v8, v7}, Ljava/io/BufferedOutputStream;->write([B)V

    invoke-virtual {v8}, Ljava/io/BufferedOutputStream;->close()V

    :cond_1
    invoke-virtual {v5}, Ljava/net/HttpURLConnection;->getResponseCode()I

    move-result v7

    invoke-virtual {v5}, Ljava/net/HttpURLConnection;->getHeaderFields()Ljava/util/Map;

    move-result-object v8

    const/16 v9, 0xc8

    const/16 v10, 0x12c

    if-lt v7, v9, :cond_2

    if-ge v7, v10, :cond_2

    invoke-virtual {v0}, Ljava/net/URL;->toString()Ljava/lang/String;

    move-result-object p0

    new-instance p1, Ljava/io/InputStreamReader;

    invoke-virtual {v5}, Ljava/net/HttpURLConnection;->getInputStream()Ljava/io/InputStream;

    move-result-object p2

    invoke-direct {p1, p2}, Ljava/io/InputStreamReader;-><init>(Ljava/io/InputStream;)V

    invoke-static {p1}, Lcom/google/android/gms/internal/gj;->a(Ljava/lang/Readable;)Ljava/lang/String;

    move-result-object p1

    invoke-static {p0, v8, p1, v7}, Lcom/google/android/gms/internal/fr;->a(Ljava/lang/String;Ljava/util/Map;Ljava/lang/String;I)V

    invoke-virtual {v1, p0, v8, p1}, Lcom/google/android/gms/internal/fu;->a(Ljava/lang/String;Ljava/util/Map;Ljava/lang/String;)V

    invoke-virtual {v1, v2, v3}, Lcom/google/android/gms/internal/fu;->i(J)Lcom/google/android/gms/internal/fk;

    move-result-object p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    :try_start_2
    invoke-virtual {v5}, Ljava/net/HttpURLConnection;->disconnect()V
    :try_end_2
    .catch Ljava/io/IOException; {:try_start_2 .. :try_end_2} :catch_0

    return-object p0

    :cond_2
    :try_start_3
    invoke-virtual {v0}, Ljava/net/URL;->toString()Ljava/lang/String;

    move-result-object v0

    const/4 v9, 0x0

    invoke-static {v0, v8, v9, v7}, Lcom/google/android/gms/internal/fr;->a(Ljava/lang/String;Ljava/util/Map;Ljava/lang/String;I)V

    if-lt v7, v10, :cond_5

    const/16 v0, 0x190

    if-ge v7, v0, :cond_5

    const-string v0, "Location"

    invoke-virtual {v5, v0}, Ljava/net/HttpURLConnection;->getHeaderField(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v7

    if-eqz v7, :cond_3

    const-string p0, "No location header to follow redirect."

    invoke-static {p0}, Lcom/google/android/gms/internal/gs;->W(Ljava/lang/String;)V

    new-instance p0, Lcom/google/android/gms/internal/fk;

    invoke-direct {p0, p2}, Lcom/google/android/gms/internal/fk;-><init>(I)V
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    :try_start_4
    invoke-virtual {v5}, Ljava/net/HttpURLConnection;->disconnect()V
    :try_end_4
    .catch Ljava/io/IOException; {:try_start_4 .. :try_end_4} :catch_0

    return-object p0

    :cond_3
    :try_start_5
    new-instance v7, Ljava/net/URL;

    invoke-direct {v7, v0}, Ljava/net/URL;-><init>(Ljava/lang/String;)V

    add-int/2addr v4, v6

    const/4 v0, 0x5

    if-le v4, v0, :cond_4

    const-string p0, "Too many redirects."

    invoke-static {p0}, Lcom/google/android/gms/internal/gs;->W(Ljava/lang/String;)V

    new-instance p0, Lcom/google/android/gms/internal/fk;

    invoke-direct {p0, p2}, Lcom/google/android/gms/internal/fk;-><init>(I)V
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_0

    :try_start_6
    invoke-virtual {v5}, Ljava/net/HttpURLConnection;->disconnect()V
    :try_end_6
    .catch Ljava/io/IOException; {:try_start_6 .. :try_end_6} :catch_0

    return-object p0

    :cond_4
    :try_start_7
    invoke-virtual {v1, v8}, Lcom/google/android/gms/internal/fu;->e(Ljava/util/Map;)V
    :try_end_7
    .catchall {:try_start_7 .. :try_end_7} :catchall_0

    :try_start_8
    invoke-virtual {v5}, Ljava/net/HttpURLConnection;->disconnect()V
    :try_end_8
    .catch Ljava/io/IOException; {:try_start_8 .. :try_end_8} :catch_0

    move-object v0, v7

    goto/16 :goto_0

    :cond_5
    :try_start_9
    new-instance p0, Ljava/lang/StringBuilder;

    invoke-direct {p0}, Ljava/lang/StringBuilder;-><init>()V

    const-string p1, "Received error HTTP response code: "

    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p0

    invoke-virtual {p0, v7}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-static {p0}, Lcom/google/android/gms/internal/gs;->W(Ljava/lang/String;)V

    new-instance p0, Lcom/google/android/gms/internal/fk;

    invoke-direct {p0, p2}, Lcom/google/android/gms/internal/fk;-><init>(I)V
    :try_end_9
    .catchall {:try_start_9 .. :try_end_9} :catchall_0

    :try_start_a
    invoke-virtual {v5}, Ljava/net/HttpURLConnection;->disconnect()V

    return-object p0

    :catchall_0
    move-exception p0

    invoke-virtual {v5}, Ljava/net/HttpURLConnection;->disconnect()V

    throw p0
    :try_end_a
    .catch Ljava/io/IOException; {:try_start_a .. :try_end_a} :catch_0

    :catch_0
    move-exception p0

    new-instance p1, Ljava/lang/StringBuilder;

    const-string p2, "Error while connecting to ad server: "

    invoke-direct {p1, p2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p0}, Ljava/io/IOException;->getMessage()Ljava/lang/String;

    move-result-object p0

    invoke-virtual {p1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-static {p0}, Lcom/google/android/gms/internal/gs;->W(Ljava/lang/String;)V

    new-instance p0, Lcom/google/android/gms/internal/fk;

    const/4 p1, 0x2

    invoke-direct {p0, p1}, Lcom/google/android/gms/internal/fk;-><init>(I)V

    return-object p0
.end method

.method public static a(Landroid/content/Context;Lcom/google/android/gms/internal/bm;Lcom/google/android/gms/internal/ci;Lcom/google/android/gms/internal/fx;)Lcom/google/android/gms/internal/fr;
    .locals 2

    sget-object v0, Lcom/google/android/gms/internal/fr;->uf:Ljava/lang/Object;

    monitor-enter v0

    :try_start_0
    sget-object v1, Lcom/google/android/gms/internal/fr;->ug:Lcom/google/android/gms/internal/fr;

    if-nez v1, :cond_0

    new-instance v1, Lcom/google/android/gms/internal/fr;

    invoke-virtual {p0}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object p0

    invoke-direct {v1, p0, p1, p2, p3}, Lcom/google/android/gms/internal/fr;-><init>(Landroid/content/Context;Lcom/google/android/gms/internal/bm;Lcom/google/android/gms/internal/ci;Lcom/google/android/gms/internal/fx;)V

    sput-object v1, Lcom/google/android/gms/internal/fr;->ug:Lcom/google/android/gms/internal/fr;

    :cond_0
    sget-object p0, Lcom/google/android/gms/internal/fr;->ug:Lcom/google/android/gms/internal/fr;

    monitor-exit v0

    return-object p0

    :catchall_0
    move-exception p0

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw p0
.end method

.method private static a(Ljava/lang/String;Ljava/util/Map;Ljava/lang/String;I)V
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;>;",
            "Ljava/lang/String;",
            "I)V"
        }
    .end annotation

    const/4 v0, 0x2

    invoke-static {v0}, Lcom/google/android/gms/internal/gs;->u(I)Z

    move-result v0

    if-eqz v0, :cond_4

    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "Http Response: {\n  URL:\n    "

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p0

    const-string v0, "\n  Headers:"

    invoke-virtual {p0, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-static {p0}, Lcom/google/android/gms/internal/gs;->V(Ljava/lang/String;)V

    if-eqz p1, :cond_1

    invoke-interface {p1}, Ljava/util/Map;->keySet()Ljava/util/Set;

    move-result-object p0

    invoke-interface {p0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object p0

    :cond_0
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_1

    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "    "

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, ":"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Lcom/google/android/gms/internal/gs;->V(Ljava/lang/String;)V

    invoke-interface {p1, v0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_0

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    new-instance v2, Ljava/lang/StringBuilder;

    const-string v3, "      "

    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Lcom/google/android/gms/internal/gs;->V(Ljava/lang/String;)V

    goto :goto_0

    :cond_1
    const-string p0, "  Body:"

    invoke-static {p0}, Lcom/google/android/gms/internal/gs;->V(Ljava/lang/String;)V

    if-eqz p2, :cond_2

    const/4 p0, 0x0

    :goto_1
    invoke-virtual {p2}, Ljava/lang/String;->length()I

    move-result p1

    const v0, 0x186a0

    invoke-static {p1, v0}, Ljava/lang/Math;->min(II)I

    move-result p1

    if-ge p0, p1, :cond_3

    invoke-virtual {p2}, Ljava/lang/String;->length()I

    move-result p1

    add-int/lit16 v0, p0, 0x3e8

    invoke-static {p1, v0}, Ljava/lang/Math;->min(II)I

    move-result p1

    invoke-virtual {p2, p0, p1}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object p0

    invoke-static {p0}, Lcom/google/android/gms/internal/gs;->V(Ljava/lang/String;)V

    move p0, v0

    goto :goto_1

    :cond_2
    const-string p0, "    null"

    invoke-static {p0}, Lcom/google/android/gms/internal/gs;->V(Ljava/lang/String;)V

    :cond_3
    new-instance p0, Ljava/lang/StringBuilder;

    const-string p1, "  Response Code:\n    "

    invoke-direct {p0, p1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p0, p3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object p0

    const-string p1, "\n}"

    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-static {p0}, Lcom/google/android/gms/internal/gs;->V(Ljava/lang/String;)V

    :cond_4
    return-void
.end method


# virtual methods
.method public b(Lcom/google/android/gms/internal/fi;)Lcom/google/android/gms/internal/fk;
    .locals 3

    iget-object v0, p0, Lcom/google/android/gms/internal/fr;->mContext:Landroid/content/Context;

    iget-object v1, p0, Lcom/google/android/gms/internal/fr;->uj:Lcom/google/android/gms/internal/bm;

    iget-object v2, p0, Lcom/google/android/gms/internal/fr;->ui:Lcom/google/android/gms/internal/ci;

    iget-object p0, p0, Lcom/google/android/gms/internal/fr;->uh:Lcom/google/android/gms/internal/fx;

    invoke-static {v0, v1, v2, p0, p1}, Lcom/google/android/gms/internal/fr;->a(Landroid/content/Context;Lcom/google/android/gms/internal/bm;Lcom/google/android/gms/internal/ci;Lcom/google/android/gms/internal/fx;Lcom/google/android/gms/internal/fi;)Lcom/google/android/gms/internal/fk;

    move-result-object p0

    return-object p0
.end method
