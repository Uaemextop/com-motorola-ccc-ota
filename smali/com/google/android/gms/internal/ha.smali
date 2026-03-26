.class public Lcom/google/android/gms/internal/ha;
.super Landroid/webkit/WebViewClient;


# annotations
.annotation runtime Lcom/google/android/gms/internal/ez;
.end annotation


# instance fields
.field private final md:Lcom/google/android/gms/internal/gv;

.field private final xc:Ljava/lang/String;

.field private xd:Z

.field private final xe:Lcom/google/android/gms/internal/fc;


# direct methods
.method public constructor <init>(Lcom/google/android/gms/internal/fc;Lcom/google/android/gms/internal/gv;Ljava/lang/String;)V
    .locals 0

    invoke-direct {p0}, Landroid/webkit/WebViewClient;-><init>()V

    invoke-direct {p0, p3}, Lcom/google/android/gms/internal/ha;->Z(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p3

    iput-object p3, p0, Lcom/google/android/gms/internal/ha;->xc:Ljava/lang/String;

    const/4 p3, 0x0

    iput-boolean p3, p0, Lcom/google/android/gms/internal/ha;->xd:Z

    iput-object p2, p0, Lcom/google/android/gms/internal/ha;->md:Lcom/google/android/gms/internal/gv;

    iput-object p1, p0, Lcom/google/android/gms/internal/ha;->xe:Lcom/google/android/gms/internal/fc;

    return-void
.end method

.method private Z(Ljava/lang/String;)Ljava/lang/String;
    .locals 1

    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result p0

    if-eqz p0, :cond_0

    return-object p1

    :cond_0
    :try_start_0
    const-string p0, "/"

    invoke-virtual {p1, p0}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result p0

    if-eqz p0, :cond_1

    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result p0

    add-int/lit8 p0, p0, -0x1

    const/4 v0, 0x0

    invoke-virtual {p1, v0, p0}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object p0
    :try_end_0
    .catch Ljava/lang/IndexOutOfBoundsException; {:try_start_0 .. :try_end_0} :catch_0

    return-object p0

    :catch_0
    move-exception p0

    invoke-virtual {p0}, Ljava/lang/IndexOutOfBoundsException;->getMessage()Ljava/lang/String;

    move-result-object p0

    invoke-static {p0}, Lcom/google/android/gms/internal/gs;->T(Ljava/lang/String;)V

    :cond_1
    return-object p1
.end method


# virtual methods
.method protected Y(Ljava/lang/String;)Z
    .locals 6

    invoke-direct {p0, p1}, Lcom/google/android/gms/internal/ha;->Z(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    const/4 v1, 0x0

    if-eqz v0, :cond_0

    return v1

    :cond_0
    :try_start_0
    new-instance v0, Ljava/net/URI;

    invoke-direct {v0, p1}, Ljava/net/URI;-><init>(Ljava/lang/String;)V

    const-string p1, "passback"

    invoke-virtual {v0}, Ljava/net/URI;->getScheme()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {p1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1
    :try_end_0
    .catch Ljava/net/URISyntaxException; {:try_start_0 .. :try_end_0} :catch_0

    const/4 v2, 0x1

    const-string v3, "Passback received"

    if-eqz p1, :cond_1

    :try_start_1
    invoke-static {v3}, Lcom/google/android/gms/internal/gs;->S(Ljava/lang/String;)V

    iget-object p0, p0, Lcom/google/android/gms/internal/ha;->xe:Lcom/google/android/gms/internal/fc;

    invoke-virtual {p0}, Lcom/google/android/gms/internal/fc;->cz()V

    return v2

    :cond_1
    iget-object p1, p0, Lcom/google/android/gms/internal/ha;->xc:Ljava/lang/String;

    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result p1

    if-nez p1, :cond_2

    new-instance p1, Ljava/net/URI;

    iget-object v4, p0, Lcom/google/android/gms/internal/ha;->xc:Ljava/lang/String;

    invoke-direct {p1, v4}, Ljava/net/URI;-><init>(Ljava/lang/String;)V

    invoke-virtual {p1}, Ljava/net/URI;->getHost()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v0}, Ljava/net/URI;->getHost()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {p1}, Ljava/net/URI;->getPath()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v0}, Ljava/net/URI;->getPath()Ljava/lang/String;

    move-result-object v0

    invoke-static {v4, v5}, Lcom/google/android/gms/common/internal/n;->equal(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_2

    invoke-static {p1, v0}, Lcom/google/android/gms/common/internal/n;->equal(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_2

    invoke-static {v3}, Lcom/google/android/gms/internal/gs;->S(Ljava/lang/String;)V

    iget-object p0, p0, Lcom/google/android/gms/internal/ha;->xe:Lcom/google/android/gms/internal/fc;

    invoke-virtual {p0}, Lcom/google/android/gms/internal/fc;->cz()V
    :try_end_1
    .catch Ljava/net/URISyntaxException; {:try_start_1 .. :try_end_1} :catch_0

    return v2

    :catch_0
    move-exception p0

    invoke-virtual {p0}, Ljava/net/URISyntaxException;->getMessage()Ljava/lang/String;

    move-result-object p0

    invoke-static {p0}, Lcom/google/android/gms/internal/gs;->T(Ljava/lang/String;)V

    :cond_2
    return v1
.end method

.method public onLoadResource(Landroid/webkit/WebView;Ljava/lang/String;)V
    .locals 1

    new-instance p1, Ljava/lang/StringBuilder;

    const-string v0, "JavascriptAdWebViewClient::onLoadResource: "

    invoke-direct {p1, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {p1}, Lcom/google/android/gms/internal/gs;->S(Ljava/lang/String;)V

    invoke-virtual {p0, p2}, Lcom/google/android/gms/internal/ha;->Y(Ljava/lang/String;)Z

    move-result p1

    if-nez p1, :cond_0

    iget-object p1, p0, Lcom/google/android/gms/internal/ha;->md:Lcom/google/android/gms/internal/gv;

    invoke-virtual {p1}, Lcom/google/android/gms/internal/gv;->du()Lcom/google/android/gms/internal/gw;

    move-result-object p1

    iget-object p0, p0, Lcom/google/android/gms/internal/ha;->md:Lcom/google/android/gms/internal/gv;

    invoke-virtual {p1, p0, p2}, Lcom/google/android/gms/internal/gw;->onLoadResource(Landroid/webkit/WebView;Ljava/lang/String;)V

    :cond_0
    return-void
.end method

.method public onPageFinished(Landroid/webkit/WebView;Ljava/lang/String;)V
    .locals 1

    new-instance p1, Ljava/lang/StringBuilder;

    const-string v0, "JavascriptAdWebViewClient::onPageFinished: "

    invoke-direct {p1, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {p1}, Lcom/google/android/gms/internal/gs;->S(Ljava/lang/String;)V

    iget-boolean p1, p0, Lcom/google/android/gms/internal/ha;->xd:Z

    if-nez p1, :cond_0

    iget-object p1, p0, Lcom/google/android/gms/internal/ha;->xe:Lcom/google/android/gms/internal/fc;

    invoke-virtual {p1}, Lcom/google/android/gms/internal/fc;->cy()V

    const/4 p1, 0x1

    iput-boolean p1, p0, Lcom/google/android/gms/internal/ha;->xd:Z

    :cond_0
    return-void
.end method

.method public shouldOverrideUrlLoading(Landroid/webkit/WebView;Ljava/lang/String;)Z
    .locals 1

    new-instance p1, Ljava/lang/StringBuilder;

    const-string v0, "JavascriptAdWebViewClient::shouldOverrideUrlLoading: "

    invoke-direct {p1, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {p1}, Lcom/google/android/gms/internal/gs;->S(Ljava/lang/String;)V

    invoke-virtual {p0, p2}, Lcom/google/android/gms/internal/ha;->Y(Ljava/lang/String;)Z

    move-result p1

    if-eqz p1, :cond_0

    const-string p0, "shouldOverrideUrlLoading: received passback url"

    invoke-static {p0}, Lcom/google/android/gms/internal/gs;->S(Ljava/lang/String;)V

    const/4 p0, 0x1

    return p0

    :cond_0
    iget-object p1, p0, Lcom/google/android/gms/internal/ha;->md:Lcom/google/android/gms/internal/gv;

    invoke-virtual {p1}, Lcom/google/android/gms/internal/gv;->du()Lcom/google/android/gms/internal/gw;

    move-result-object p1

    iget-object p0, p0, Lcom/google/android/gms/internal/ha;->md:Lcom/google/android/gms/internal/gv;

    invoke-virtual {p1, p0, p2}, Lcom/google/android/gms/internal/gw;->shouldOverrideUrlLoading(Landroid/webkit/WebView;Ljava/lang/String;)Z

    move-result p0

    return p0
.end method
