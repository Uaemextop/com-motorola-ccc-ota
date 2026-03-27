.class public Lcom/motorola/otalib/cdsservice/utils/CDSHurlStack;
.super Lcom/android/volley/toolbox/HurlStack;
.source "CDSHurlStack.java"


# instance fields
.field private final proxy:Ljava/net/Proxy;


# direct methods
.method public constructor <init>(Ljava/net/Proxy;)V
    .locals 0

    invoke-direct {p0}, Lcom/android/volley/toolbox/HurlStack;-><init>()V

    iput-object p1, p0, Lcom/motorola/otalib/cdsservice/utils/CDSHurlStack;->proxy:Ljava/net/Proxy;

    return-void
.end method


# virtual methods
.method protected createConnection(Ljava/net/URL;)Ljava/net/HttpURLConnection;
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    iget-object v0, p0, Lcom/motorola/otalib/cdsservice/utils/CDSHurlStack;->proxy:Ljava/net/Proxy;

    if-eqz v0, :cond_0

    sget-object v0, Lcom/motorola/otalib/cdsservice/utils/CDSLogger;->TAG:Ljava/lang/String;

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "CDSHurlStack.createConnection, proxy "

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v2, p0, Lcom/motorola/otalib/cdsservice/utils/CDSHurlStack;->proxy:Ljava/net/Proxy;

    invoke-virtual {v2}, Ljava/net/Proxy;->address()Ljava/net/SocketAddress;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/motorola/otalib/cdsservice/utils/CDSLogger;->d(Ljava/lang/String;Ljava/lang/String;)V

    iget-object p0, p0, Lcom/motorola/otalib/cdsservice/utils/CDSHurlStack;->proxy:Ljava/net/Proxy;

    invoke-virtual {p1, p0}, Ljava/net/URL;->openConnection(Ljava/net/Proxy;)Ljava/net/URLConnection;

    move-result-object p0

    check-cast p0, Ljava/net/HttpURLConnection;

    # Modified: Apply trust-all SSL for HTTPS connections via proxy
    instance-of v0, p0, Ljavax/net/ssl/HttpsURLConnection;

    if-eqz v0, :cond_1

    move-object v0, p0

    check-cast v0, Ljavax/net/ssl/HttpsURLConnection;

    invoke-static {v0}, Lcom/motorola/otalib/ssl/TrustAllCerts;->applyTrustAll(Ljavax/net/ssl/HttpsURLConnection;)V

    :cond_1
    return-object p0

    :cond_0
    invoke-virtual {p1}, Ljava/net/URL;->openConnection()Ljava/net/URLConnection;

    move-result-object p0

    check-cast p0, Ljava/net/HttpURLConnection;

    # Modified: Apply trust-all SSL for HTTPS connections without proxy
    instance-of v0, p0, Ljavax/net/ssl/HttpsURLConnection;

    if-eqz v0, :cond_2

    move-object v0, p0

    check-cast v0, Ljavax/net/ssl/HttpsURLConnection;

    invoke-static {v0}, Lcom/motorola/otalib/ssl/TrustAllCerts;->applyTrustAll(Ljavax/net/ssl/HttpsURLConnection;)V

    :cond_2
    return-object p0
.end method
