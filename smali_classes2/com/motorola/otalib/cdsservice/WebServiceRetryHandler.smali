.class public Lcom/motorola/otalib/cdsservice/WebServiceRetryHandler;
.super Ljava/lang/Object;
.source "WebServiceRetryHandler.java"

# interfaces
.implements Lcom/motorola/otalib/cdsservice/RetryHandler;


# direct methods
.method public constructor <init>()V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public retryRequest(Lcom/motorola/otalib/cdsservice/webdataobjects/WebResponse;)Z
    .locals 0

    if-eqz p1, :cond_0

    invoke-virtual {p1}, Lcom/motorola/otalib/cdsservice/webdataobjects/WebResponse;->getStatusCode()I

    move-result p0

    const/16 p1, 0x191

    if-ne p0, p1, :cond_0

    const/4 p0, 0x1

    goto :goto_0

    :cond_0
    const/4 p0, 0x0

    :goto_0
    return p0
.end method
