.class Lcom/google/android/gms/analytics/ag;
.super Ljava/lang/Object;

# interfaces
.implements Lcom/google/android/gms/analytics/m;


# instance fields
.field private final Bj:Lorg/apache/http/client/HttpClient;

.field private Bk:Ljava/net/URL;

.field private final mContext:Landroid/content/Context;

.field private final vW:Ljava/lang/String;

.field private yu:Lcom/google/android/gms/analytics/GoogleAnalytics;


# direct methods
.method constructor <init>(Lorg/apache/http/client/HttpClient;Landroid/content/Context;)V
    .locals 1

    invoke-static {p2}, Lcom/google/android/gms/analytics/GoogleAnalytics;->getInstance(Landroid/content/Context;)Lcom/google/android/gms/analytics/GoogleAnalytics;

    move-result-object v0

    invoke-direct {p0, p1, v0, p2}, Lcom/google/android/gms/analytics/ag;-><init>(Lorg/apache/http/client/HttpClient;Lcom/google/android/gms/analytics/GoogleAnalytics;Landroid/content/Context;)V

    return-void
.end method

.method constructor <init>(Lorg/apache/http/client/HttpClient;Lcom/google/android/gms/analytics/GoogleAnalytics;Landroid/content/Context;)V
    .locals 7

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    invoke-virtual {p3}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object p3

    iput-object p3, p0, Lcom/google/android/gms/analytics/ag;->mContext:Landroid/content/Context;

    sget-object v3, Landroid/os/Build$VERSION;->RELEASE:Ljava/lang/String;

    invoke-static {}, Ljava/util/Locale;->getDefault()Ljava/util/Locale;

    move-result-object p3

    invoke-static {p3}, Lcom/google/android/gms/analytics/aj;->a(Ljava/util/Locale;)Ljava/lang/String;

    move-result-object v4

    sget-object v5, Landroid/os/Build;->MODEL:Ljava/lang/String;

    sget-object v6, Landroid/os/Build;->ID:Ljava/lang/String;

    const-string v1, "GoogleAnalytics"

    const-string v2, "3.0"

    move-object v0, p0

    invoke-virtual/range {v0 .. v6}, Lcom/google/android/gms/analytics/ag;->a(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p3

    iput-object p3, p0, Lcom/google/android/gms/analytics/ag;->vW:Ljava/lang/String;

    iput-object p1, p0, Lcom/google/android/gms/analytics/ag;->Bj:Lorg/apache/http/client/HttpClient;

    iput-object p2, p0, Lcom/google/android/gms/analytics/ag;->yu:Lcom/google/android/gms/analytics/GoogleAnalytics;

    return-void
.end method

.method private a(Lcom/google/android/gms/analytics/aa;Ljava/net/URL;Z)V
    .locals 5

    const-string v0, "Bad response: "

    invoke-virtual {p1}, Lcom/google/android/gms/analytics/aa;->eL()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    if-nez v1, :cond_7

    invoke-virtual {p0}, Lcom/google/android/gms/analytics/ag;->eS()Z

    move-result v1

    if-nez v1, :cond_0

    goto/16 :goto_1

    :cond_0
    if-nez p2, :cond_2

    :try_start_0
    iget-object p2, p0, Lcom/google/android/gms/analytics/ag;->Bk:Ljava/net/URL;

    if-eqz p2, :cond_1

    goto :goto_0

    :cond_1
    new-instance p2, Ljava/net/URL;

    const-string v1, "https://ssl.google-analytics.com/collect"

    invoke-direct {p2, v1}, Ljava/net/URL;-><init>(Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/net/MalformedURLException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    return-void

    :cond_2
    :goto_0
    new-instance v1, Lorg/apache/http/HttpHost;

    invoke-virtual {p2}, Ljava/net/URL;->getHost()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {p2}, Ljava/net/URL;->getPort()I

    move-result v3

    invoke-virtual {p2}, Ljava/net/URL;->getProtocol()Ljava/lang/String;

    move-result-object v4

    invoke-direct {v1, v2, v3, v4}, Lorg/apache/http/HttpHost;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    :try_start_1
    invoke-virtual {p1}, Lcom/google/android/gms/analytics/aa;->eL()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p2}, Ljava/net/URL;->getPath()Ljava/lang/String;

    move-result-object p2

    invoke-direct {p0, p1, p2}, Lcom/google/android/gms/analytics/ag;->h(Ljava/lang/String;Ljava/lang/String;)Lorg/apache/http/HttpEntityEnclosingRequest;

    move-result-object p1

    if-nez p1, :cond_3

    return-void

    :cond_3
    const-string p2, "Host"

    invoke-virtual {v1}, Lorg/apache/http/HttpHost;->toHostString()Ljava/lang/String;

    move-result-object v2

    invoke-interface {p1, p2, v2}, Lorg/apache/http/HttpEntityEnclosingRequest;->addHeader(Ljava/lang/String;Ljava/lang/String;)V

    invoke-static {}, Lcom/google/android/gms/analytics/z;->eK()Z

    move-result p2

    if-eqz p2, :cond_4

    invoke-direct {p0, p1}, Lcom/google/android/gms/analytics/ag;->a(Lorg/apache/http/HttpEntityEnclosingRequest;)V

    :cond_4
    if-eqz p3, :cond_5

    iget-object p2, p0, Lcom/google/android/gms/analytics/ag;->mContext:Landroid/content/Context;

    invoke-static {p2}, Lcom/google/android/gms/analytics/p;->A(Landroid/content/Context;)V

    :cond_5
    iget-object p0, p0, Lcom/google/android/gms/analytics/ag;->Bj:Lorg/apache/http/client/HttpClient;

    invoke-interface {p0, v1, p1}, Lorg/apache/http/client/HttpClient;->execute(Lorg/apache/http/HttpHost;Lorg/apache/http/HttpRequest;)Lorg/apache/http/HttpResponse;

    move-result-object p0

    invoke-interface {p0}, Lorg/apache/http/HttpResponse;->getStatusLine()Lorg/apache/http/StatusLine;

    move-result-object p1

    invoke-interface {p1}, Lorg/apache/http/StatusLine;->getStatusCode()I

    move-result p1

    invoke-interface {p0}, Lorg/apache/http/HttpResponse;->getEntity()Lorg/apache/http/HttpEntity;

    move-result-object p2

    if-eqz p2, :cond_6

    invoke-interface {p2}, Lorg/apache/http/HttpEntity;->consumeContent()V

    :cond_6
    const/16 p2, 0xc8

    if-eq p1, p2, :cond_7

    new-instance p1, Ljava/lang/StringBuilder;

    invoke-direct {p1, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-interface {p0}, Lorg/apache/http/HttpResponse;->getStatusLine()Lorg/apache/http/StatusLine;

    move-result-object p0

    invoke-interface {p0}, Lorg/apache/http/StatusLine;->getStatusCode()I

    move-result p0

    invoke-virtual {p1, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-static {p0}, Lcom/google/android/gms/analytics/z;->W(Ljava/lang/String;)V
    :try_end_1
    .catch Lorg/apache/http/client/ClientProtocolException; {:try_start_1 .. :try_end_1} :catch_2
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_1

    goto :goto_1

    :catch_1
    move-exception p0

    new-instance p1, Ljava/lang/StringBuilder;

    const-string p2, "Exception sending monitoring hit: "

    invoke-direct {p1, p2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object p2

    invoke-virtual {p2}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object p2

    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {p1}, Lcom/google/android/gms/analytics/z;->W(Ljava/lang/String;)V

    invoke-virtual {p0}, Ljava/io/IOException;->getMessage()Ljava/lang/String;

    move-result-object p0

    invoke-static {p0}, Lcom/google/android/gms/analytics/z;->W(Ljava/lang/String;)V

    return-void

    :catch_2
    const-string p0, "ClientProtocolException sending monitoring hit."

    invoke-static {p0}, Lcom/google/android/gms/analytics/z;->W(Ljava/lang/String;)V

    :cond_7
    :goto_1
    return-void
.end method

.method private a(Lorg/apache/http/HttpEntityEnclosingRequest;)V
    .locals 5

    new-instance p0, Ljava/lang/StringBuffer;

    invoke-direct {p0}, Ljava/lang/StringBuffer;-><init>()V

    invoke-interface {p1}, Lorg/apache/http/HttpEntityEnclosingRequest;->getAllHeaders()[Lorg/apache/http/Header;

    move-result-object v0

    array-length v1, v0

    const/4 v2, 0x0

    :goto_0
    const-string v3, "\n"

    if-ge v2, v1, :cond_0

    aget-object v4, v0, v2

    invoke-virtual {v4}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {p0, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v4

    invoke-virtual {v4, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    :cond_0
    invoke-interface {p1}, Lorg/apache/http/HttpEntityEnclosingRequest;->getRequestLine()Lorg/apache/http/RequestLine;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v0

    invoke-virtual {v0, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    invoke-interface {p1}, Lorg/apache/http/HttpEntityEnclosingRequest;->getEntity()Lorg/apache/http/HttpEntity;

    move-result-object v0

    if-eqz v0, :cond_1

    :try_start_0
    invoke-interface {p1}, Lorg/apache/http/HttpEntityEnclosingRequest;->getEntity()Lorg/apache/http/HttpEntity;

    move-result-object p1

    invoke-interface {p1}, Lorg/apache/http/HttpEntity;->getContent()Ljava/io/InputStream;

    move-result-object p1

    if-eqz p1, :cond_1

    invoke-virtual {p1}, Ljava/io/InputStream;->available()I

    move-result v0

    if-lez v0, :cond_1

    new-array v0, v0, [B

    invoke-virtual {p1, v0}, Ljava/io/InputStream;->read([B)I

    const-string p1, "POST:\n"

    invoke-virtual {p0, p1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    new-instance p1, Ljava/lang/String;

    invoke-direct {p1, v0}, Ljava/lang/String;-><init>([B)V

    invoke-virtual {p0, p1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object p1

    invoke-virtual {p1, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_1

    :catch_0
    const-string p1, "Error Writing hit to log..."

    invoke-static {p1}, Lcom/google/android/gms/analytics/z;->V(Ljava/lang/String;)V

    :cond_1
    :goto_1
    invoke-virtual {p0}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-static {p0}, Lcom/google/android/gms/analytics/z;->V(Ljava/lang/String;)V

    return-void
.end method

.method private h(Ljava/lang/String;Ljava/lang/String;)Lorg/apache/http/HttpEntityEnclosingRequest;
    .locals 4

    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    const/4 v1, 0x0

    if-eqz v0, :cond_0

    const-string p0, "Empty hit, discarding."

    :goto_0
    invoke-static {p0}, Lcom/google/android/gms/analytics/z;->W(Ljava/lang/String;)V

    return-object v1

    :cond_0
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v2, "?"

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v2

    const/16 v3, 0x7f4

    if-ge v2, v3, :cond_1

    new-instance p1, Lorg/apache/http/message/BasicHttpEntityEnclosingRequest;

    const-string p2, "GET"

    invoke-direct {p1, p2, v0}, Lorg/apache/http/message/BasicHttpEntityEnclosingRequest;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_1

    :cond_1
    new-instance v0, Lorg/apache/http/message/BasicHttpEntityEnclosingRequest;

    const-string v2, "POST"

    invoke-direct {v0, v2, p2}, Lorg/apache/http/message/BasicHttpEntityEnclosingRequest;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    :try_start_0
    new-instance p2, Lorg/apache/http/entity/StringEntity;

    invoke-direct {p2, p1}, Lorg/apache/http/entity/StringEntity;-><init>(Ljava/lang/String;)V

    invoke-interface {v0, p2}, Lorg/apache/http/HttpEntityEnclosingRequest;->setEntity(Lorg/apache/http/HttpEntity;)V
    :try_end_0
    .catch Ljava/io/UnsupportedEncodingException; {:try_start_0 .. :try_end_0} :catch_0

    move-object p1, v0

    :goto_1
    const-string p2, "User-Agent"

    iget-object p0, p0, Lcom/google/android/gms/analytics/ag;->vW:Ljava/lang/String;

    invoke-interface {p1, p2, p0}, Lorg/apache/http/HttpEntityEnclosingRequest;->addHeader(Ljava/lang/String;Ljava/lang/String;)V

    return-object p1

    :catch_0
    const-string p0, "Encoding error, discarding hit"

    goto :goto_0
.end method


# virtual methods
.method public a(Ljava/util/List;Lcom/google/android/gms/analytics/aa;Z)I
    .locals 16
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/google/android/gms/analytics/w;",
            ">;",
            "Lcom/google/android/gms/analytics/aa;",
            "Z)I"
        }
    .end annotation

    move-object/from16 v1, p0

    move-object/from16 v2, p2

    invoke-interface/range {p1 .. p1}, Ljava/util/List;->size()I

    move-result v0

    const/16 v3, 0x28

    invoke-static {v0, v3}, Ljava/lang/Math;->min(II)I

    move-result v0

    const-string v3, "_hr"

    invoke-interface/range {p1 .. p1}, Ljava/util/List;->size()I

    move-result v4

    invoke-virtual {v2, v3, v4}, Lcom/google/android/gms/analytics/aa;->e(Ljava/lang/String;I)V

    const/4 v4, 0x0

    const/4 v6, 0x0

    const/4 v7, 0x0

    const/4 v8, 0x0

    const/4 v9, 0x1

    :goto_0
    const-string v10, "_hs"

    const-string v11, "_hd"

    if-ge v6, v0, :cond_a

    move-object/from16 v12, p1

    invoke-interface {v12, v6}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v13

    check-cast v13, Lcom/google/android/gms/analytics/w;

    invoke-virtual {v1, v13}, Lcom/google/android/gms/analytics/ag;->a(Lcom/google/android/gms/analytics/w;)Ljava/net/URL;

    move-result-object v14

    if-nez v14, :cond_1

    invoke-static {}, Lcom/google/android/gms/analytics/z;->eK()Z

    move-result v10

    if-eqz v10, :cond_0

    new-instance v10, Ljava/lang/StringBuilder;

    const-string v11, "No destination: discarding hit: "

    invoke-direct {v10, v11}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v13}, Lcom/google/android/gms/analytics/w;->eF()Ljava/lang/String;

    move-result-object v11

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v10

    goto :goto_1

    :cond_0
    const-string v10, "No destination: discarding hit."

    :goto_1
    invoke-static {v10}, Lcom/google/android/gms/analytics/z;->W(Ljava/lang/String;)V

    add-int/lit8 v8, v8, 0x1

    add-int/lit8 v7, v7, 0x1

    move v15, v6

    :goto_2
    const/4 v3, 0x1

    goto/16 :goto_6

    :cond_1
    new-instance v4, Lorg/apache/http/HttpHost;

    invoke-virtual {v14}, Ljava/net/URL;->getHost()Ljava/lang/String;

    move-result-object v15

    invoke-virtual {v14}, Ljava/net/URL;->getPort()I

    move-result v3

    invoke-virtual {v14}, Ljava/net/URL;->getProtocol()Ljava/lang/String;

    move-result-object v5

    invoke-direct {v4, v15, v3, v5}, Lorg/apache/http/HttpHost;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    invoke-virtual {v14}, Ljava/net/URL;->getPath()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v13}, Lcom/google/android/gms/analytics/w;->eF()Ljava/lang/String;

    move-result-object v5

    invoke-static {v5}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v5

    if-eqz v5, :cond_2

    const-string v5, ""

    move v15, v6

    goto :goto_3

    :cond_2
    move v15, v6

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v5

    invoke-static {v13, v5, v6}, Lcom/google/android/gms/analytics/x;->a(Lcom/google/android/gms/analytics/w;J)Ljava/lang/String;

    move-result-object v5

    :goto_3
    invoke-direct {v1, v5, v3}, Lcom/google/android/gms/analytics/ag;->h(Ljava/lang/String;Ljava/lang/String;)Lorg/apache/http/HttpEntityEnclosingRequest;

    move-result-object v3

    if-nez v3, :cond_3

    add-int/lit8 v8, v8, 0x1

    add-int/lit8 v7, v7, 0x1

    move-object v4, v14

    goto :goto_2

    :cond_3
    const-string v6, "Host"

    invoke-virtual {v4}, Lorg/apache/http/HttpHost;->toHostString()Ljava/lang/String;

    move-result-object v13

    invoke-interface {v3, v6, v13}, Lorg/apache/http/HttpEntityEnclosingRequest;->addHeader(Ljava/lang/String;Ljava/lang/String;)V

    invoke-static {}, Lcom/google/android/gms/analytics/z;->eK()Z

    move-result v6

    if-eqz v6, :cond_4

    invoke-direct {v1, v3}, Lcom/google/android/gms/analytics/ag;->a(Lorg/apache/http/HttpEntityEnclosingRequest;)V

    :cond_4
    invoke-virtual {v5}, Ljava/lang/String;->length()I

    move-result v6

    const/16 v13, 0x2000

    if-le v6, v13, :cond_6

    const-string v3, "Hit too long (> 8192 bytes)--not sent"

    invoke-static {v3}, Lcom/google/android/gms/analytics/z;->W(Ljava/lang/String;)V

    add-int/lit8 v7, v7, 0x1

    :cond_5
    :goto_4
    const/4 v3, 0x1

    goto/16 :goto_5

    :cond_6
    iget-object v6, v1, Lcom/google/android/gms/analytics/ag;->yu:Lcom/google/android/gms/analytics/GoogleAnalytics;

    invoke-virtual {v6}, Lcom/google/android/gms/analytics/GoogleAnalytics;->isDryRunEnabled()Z

    move-result v6

    if-eqz v6, :cond_7

    const-string v3, "Dry run enabled. Hit not actually sent."

    invoke-static {v3}, Lcom/google/android/gms/analytics/z;->U(Ljava/lang/String;)V

    goto :goto_4

    :cond_7
    if-eqz v9, :cond_8

    :try_start_0
    iget-object v6, v1, Lcom/google/android/gms/analytics/ag;->mContext:Landroid/content/Context;

    invoke-static {v6}, Lcom/google/android/gms/analytics/p;->A(Landroid/content/Context;)V

    const/4 v9, 0x0

    :cond_8
    iget-object v6, v1, Lcom/google/android/gms/analytics/ag;->Bj:Lorg/apache/http/client/HttpClient;

    invoke-interface {v6, v4, v3}, Lorg/apache/http/client/HttpClient;->execute(Lorg/apache/http/HttpHost;Lorg/apache/http/HttpRequest;)Lorg/apache/http/HttpResponse;

    move-result-object v3

    invoke-interface {v3}, Lorg/apache/http/HttpResponse;->getStatusLine()Lorg/apache/http/StatusLine;

    move-result-object v4

    invoke-interface {v4}, Lorg/apache/http/StatusLine;->getStatusCode()I

    move-result v4

    invoke-interface {v3}, Lorg/apache/http/HttpResponse;->getEntity()Lorg/apache/http/HttpEntity;

    move-result-object v6

    if-eqz v6, :cond_9

    invoke-interface {v6}, Lorg/apache/http/HttpEntity;->consumeContent()V

    :cond_9
    const/16 v6, 0xc8

    if-eq v4, v6, :cond_5

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "Bad response: "

    invoke-virtual {v4, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-interface {v3}, Lorg/apache/http/HttpResponse;->getStatusLine()Lorg/apache/http/StatusLine;

    move-result-object v3

    invoke-interface {v3}, Lorg/apache/http/StatusLine;->getStatusCode()I

    move-result v3

    invoke-virtual {v4, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v3}, Lcom/google/android/gms/analytics/z;->W(Ljava/lang/String;)V
    :try_end_0
    .catch Lorg/apache/http/client/ClientProtocolException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_4

    :catch_0
    move-exception v0

    new-instance v3, Ljava/lang/StringBuilder;

    const-string v4, "Exception sending hit: "

    invoke-direct {v3, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v3}, Lcom/google/android/gms/analytics/z;->W(Ljava/lang/String;)V

    invoke-virtual {v0}, Ljava/io/IOException;->getMessage()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/google/android/gms/analytics/z;->W(Ljava/lang/String;)V

    const-string v0, "_de"

    const/4 v3, 0x1

    invoke-virtual {v2, v0, v3}, Lcom/google/android/gms/analytics/aa;->e(Ljava/lang/String;I)V

    invoke-virtual {v2, v11, v7}, Lcom/google/android/gms/analytics/aa;->e(Ljava/lang/String;I)V

    invoke-virtual {v2, v10, v8}, Lcom/google/android/gms/analytics/aa;->e(Ljava/lang/String;I)V

    invoke-direct {v1, v2, v14, v9}, Lcom/google/android/gms/analytics/ag;->a(Lcom/google/android/gms/analytics/aa;Ljava/net/URL;Z)V

    return v8

    :catch_1
    const/4 v3, 0x1

    const-string v4, "ClientProtocolException sending hit; discarding hit..."

    invoke-static {v4}, Lcom/google/android/gms/analytics/z;->W(Ljava/lang/String;)V

    invoke-virtual {v2, v11, v7}, Lcom/google/android/gms/analytics/aa;->e(Ljava/lang/String;I)V

    :goto_5
    invoke-virtual {v5}, Ljava/lang/String;->getBytes()[B

    move-result-object v4

    array-length v4, v4

    const-string v5, "_td"

    invoke-virtual {v2, v5, v4}, Lcom/google/android/gms/analytics/aa;->e(Ljava/lang/String;I)V

    add-int/lit8 v8, v8, 0x1

    move-object v4, v14

    :goto_6
    add-int/lit8 v6, v15, 0x1

    goto/16 :goto_0

    :cond_a
    invoke-virtual {v2, v11, v7}, Lcom/google/android/gms/analytics/aa;->e(Ljava/lang/String;I)V

    invoke-virtual {v2, v10, v8}, Lcom/google/android/gms/analytics/aa;->e(Ljava/lang/String;I)V

    if-eqz p3, :cond_b

    invoke-direct {v1, v2, v4, v9}, Lcom/google/android/gms/analytics/ag;->a(Lcom/google/android/gms/analytics/aa;Ljava/net/URL;Z)V

    :cond_b
    return v8
.end method

.method a(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    .locals 0

    const-string p0, "%s/%s (Linux; U; Android %s; %s; %s Build/%s)"

    filled-new-array/range {p1 .. p6}, [Ljava/lang/Object;

    move-result-object p1

    invoke-static {p0, p1}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method a(Lcom/google/android/gms/analytics/w;)Ljava/net/URL;
    .locals 1

    iget-object p0, p0, Lcom/google/android/gms/analytics/ag;->Bk:Ljava/net/URL;

    if-eqz p0, :cond_0

    return-object p0

    :cond_0
    invoke-virtual {p1}, Lcom/google/android/gms/analytics/w;->eI()Ljava/lang/String;

    move-result-object p0

    :try_start_0
    new-instance p1, Ljava/net/URL;

    const-string v0, "http:"

    invoke-virtual {v0, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-eqz p0, :cond_1

    const-string p0, "http://www.google-analytics.com/collect"

    goto :goto_0

    :cond_1
    const-string p0, "https://ssl.google-analytics.com/collect"

    :goto_0
    invoke-direct {p1, p0}, Ljava/net/URL;-><init>(Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/net/MalformedURLException; {:try_start_0 .. :try_end_0} :catch_0

    return-object p1

    :catch_0
    const-string p0, "Error trying to parse the hardcoded host url. This really shouldn\'t happen."

    invoke-static {p0}, Lcom/google/android/gms/analytics/z;->T(Ljava/lang/String;)V

    const/4 p0, 0x0

    return-object p0
.end method

.method public af(Ljava/lang/String;)V
    .locals 1

    :try_start_0
    new-instance v0, Ljava/net/URL;

    invoke-direct {v0, p1}, Ljava/net/URL;-><init>(Ljava/lang/String;)V

    iput-object v0, p0, Lcom/google/android/gms/analytics/ag;->Bk:Ljava/net/URL;
    :try_end_0
    .catch Ljava/net/MalformedURLException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    const/4 p1, 0x0

    iput-object p1, p0, Lcom/google/android/gms/analytics/ag;->Bk:Ljava/net/URL;

    :goto_0
    return-void
.end method

.method public dX()Z
    .locals 1

    iget-object p0, p0, Lcom/google/android/gms/analytics/ag;->mContext:Landroid/content/Context;

    const-string v0, "connectivity"

    invoke-virtual {p0, v0}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Landroid/net/ConnectivityManager;

    invoke-virtual {p0}, Landroid/net/ConnectivityManager;->getActiveNetworkInfo()Landroid/net/NetworkInfo;

    move-result-object p0

    if-eqz p0, :cond_1

    invoke-virtual {p0}, Landroid/net/NetworkInfo;->isConnected()Z

    move-result p0

    if-nez p0, :cond_0

    goto :goto_0

    :cond_0
    const/4 p0, 0x1

    return p0

    :cond_1
    :goto_0
    const-string p0, "...no network connectivity"

    invoke-static {p0}, Lcom/google/android/gms/analytics/z;->V(Ljava/lang/String;)V

    const/4 p0, 0x0

    return p0
.end method

.method eS()Z
    .locals 4

    invoke-static {}, Ljava/lang/Math;->random()D

    move-result-wide v0

    const-wide/high16 v2, 0x4059000000000000L    # 100.0

    mul-double/2addr v0, v2

    const-wide/high16 v2, 0x3ff0000000000000L    # 1.0

    cmpg-double p0, v0, v2

    if-gtz p0, :cond_0

    const/4 p0, 0x1

    return p0

    :cond_0
    const/4 p0, 0x0

    return p0
.end method
