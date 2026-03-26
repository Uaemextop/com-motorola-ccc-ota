.class public Lcom/google/android/gms/internal/gv;
.super Landroid/webkit/WebView;

# interfaces
.implements Landroid/webkit/DownloadListener;


# annotations
.annotation runtime Lcom/google/android/gms/internal/ez;
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/google/android/gms/internal/gv$a;
    }
.end annotation


# instance fields
.field private final mG:Landroid/view/WindowManager;

.field private final mw:Ljava/lang/Object;

.field private qr:Lcom/google/android/gms/internal/ay;

.field private final qs:Lcom/google/android/gms/internal/gt;

.field private final sX:Lcom/google/android/gms/internal/k;

.field private final wH:Lcom/google/android/gms/internal/gw;

.field private final wI:Lcom/google/android/gms/internal/gv$a;

.field private wJ:Lcom/google/android/gms/internal/dk;

.field private wK:Z

.field private wL:Z

.field private wM:Z

.field private wN:Z


# direct methods
.method protected constructor <init>(Lcom/google/android/gms/internal/gv$a;Lcom/google/android/gms/internal/ay;ZZLcom/google/android/gms/internal/k;Lcom/google/android/gms/internal/gt;)V
    .locals 1

    invoke-direct {p0, p1}, Landroid/webkit/WebView;-><init>(Landroid/content/Context;)V

    new-instance v0, Ljava/lang/Object;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    iput-object v0, p0, Lcom/google/android/gms/internal/gv;->mw:Ljava/lang/Object;

    iput-object p1, p0, Lcom/google/android/gms/internal/gv;->wI:Lcom/google/android/gms/internal/gv$a;

    iput-object p2, p0, Lcom/google/android/gms/internal/gv;->qr:Lcom/google/android/gms/internal/ay;

    iput-boolean p3, p0, Lcom/google/android/gms/internal/gv;->wK:Z

    iput-object p5, p0, Lcom/google/android/gms/internal/gv;->sX:Lcom/google/android/gms/internal/k;

    iput-object p6, p0, Lcom/google/android/gms/internal/gv;->qs:Lcom/google/android/gms/internal/gt;

    invoke-virtual {p0}, Lcom/google/android/gms/internal/gv;->getContext()Landroid/content/Context;

    move-result-object p2

    const-string p3, "window"

    invoke-virtual {p2, p3}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object p2

    check-cast p2, Landroid/view/WindowManager;

    iput-object p2, p0, Lcom/google/android/gms/internal/gv;->mG:Landroid/view/WindowManager;

    const/4 p2, 0x0

    invoke-virtual {p0, p2}, Lcom/google/android/gms/internal/gv;->setBackgroundColor(I)V

    invoke-virtual {p0}, Lcom/google/android/gms/internal/gv;->getSettings()Landroid/webkit/WebSettings;

    move-result-object p3

    const/4 p5, 0x1

    invoke-virtual {p3, p5}, Landroid/webkit/WebSettings;->setJavaScriptEnabled(Z)V

    invoke-virtual {p3, p2}, Landroid/webkit/WebSettings;->setSavePassword(Z)V

    invoke-virtual {p3, p5}, Landroid/webkit/WebSettings;->setSupportMultipleWindows(Z)V

    invoke-virtual {p3, p5}, Landroid/webkit/WebSettings;->setJavaScriptCanOpenWindowsAutomatically(Z)V

    iget-object p2, p6, Lcom/google/android/gms/internal/gt;->wD:Ljava/lang/String;

    invoke-static {p1, p2, p3}, Lcom/google/android/gms/internal/gj;->a(Landroid/content/Context;Ljava/lang/String;Landroid/webkit/WebSettings;)V

    invoke-virtual {p0}, Lcom/google/android/gms/internal/gv;->getContext()Landroid/content/Context;

    move-result-object p1

    invoke-static {p1, p3}, Lcom/google/android/gms/internal/gp;->a(Landroid/content/Context;Landroid/webkit/WebSettings;)V

    invoke-virtual {p0, p0}, Lcom/google/android/gms/internal/gv;->setDownloadListener(Landroid/webkit/DownloadListener;)V

    new-instance p1, Lcom/google/android/gms/internal/gy;

    invoke-direct {p1, p0, p4}, Lcom/google/android/gms/internal/gy;-><init>(Lcom/google/android/gms/internal/gv;Z)V

    iput-object p1, p0, Lcom/google/android/gms/internal/gv;->wH:Lcom/google/android/gms/internal/gw;

    invoke-virtual {p0, p1}, Lcom/google/android/gms/internal/gv;->setWebViewClient(Landroid/webkit/WebViewClient;)V

    new-instance p1, Lcom/google/android/gms/internal/gz;

    invoke-direct {p1, p0}, Lcom/google/android/gms/internal/gz;-><init>(Lcom/google/android/gms/internal/gv;)V

    invoke-virtual {p0, p1}, Lcom/google/android/gms/internal/gv;->setWebChromeClient(Landroid/webkit/WebChromeClient;)V

    invoke-direct {p0}, Lcom/google/android/gms/internal/gv;->dA()V

    return-void
.end method

.method public static a(Landroid/content/Context;Lcom/google/android/gms/internal/ay;ZZLcom/google/android/gms/internal/k;Lcom/google/android/gms/internal/gt;)Lcom/google/android/gms/internal/gv;
    .locals 7

    new-instance v1, Lcom/google/android/gms/internal/gv$a;

    invoke-direct {v1, p0}, Lcom/google/android/gms/internal/gv$a;-><init>(Landroid/content/Context;)V

    new-instance p0, Lcom/google/android/gms/internal/gv;

    move-object v0, p0

    move-object v2, p1

    move v3, p2

    move v4, p3

    move-object v5, p4

    move-object v6, p5

    invoke-direct/range {v0 .. v6}, Lcom/google/android/gms/internal/gv;-><init>(Lcom/google/android/gms/internal/gv$a;Lcom/google/android/gms/internal/ay;ZZLcom/google/android/gms/internal/k;Lcom/google/android/gms/internal/gt;)V

    return-object p0
.end method

.method private dA()V
    .locals 2

    iget-object v0, p0, Lcom/google/android/gms/internal/gv;->mw:Ljava/lang/Object;

    monitor-enter v0

    :try_start_0
    iget-boolean v1, p0, Lcom/google/android/gms/internal/gv;->wK:Z

    if-nez v1, :cond_1

    iget-object v1, p0, Lcom/google/android/gms/internal/gv;->qr:Lcom/google/android/gms/internal/ay;

    iget-boolean v1, v1, Lcom/google/android/gms/internal/ay;->og:Z

    if-eqz v1, :cond_0

    goto :goto_1

    :cond_0
    const-string v1, "Enabling hardware acceleration on an AdView."

    invoke-static {v1}, Lcom/google/android/gms/internal/gs;->S(Ljava/lang/String;)V

    :goto_0
    invoke-direct {p0}, Lcom/google/android/gms/internal/gv;->dC()V

    goto :goto_2

    :cond_1
    :goto_1
    const-string v1, "Enabling hardware acceleration on an overlay."

    invoke-static {v1}, Lcom/google/android/gms/internal/gs;->S(Ljava/lang/String;)V

    goto :goto_0

    :goto_2
    monitor-exit v0

    return-void

    :catchall_0
    move-exception p0

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw p0
.end method

.method private dB()V
    .locals 2

    iget-object v0, p0, Lcom/google/android/gms/internal/gv;->mw:Ljava/lang/Object;

    monitor-enter v0

    :try_start_0
    iget-boolean v1, p0, Lcom/google/android/gms/internal/gv;->wL:Z

    if-nez v1, :cond_0

    invoke-static {p0}, Lcom/google/android/gms/internal/gn;->i(Landroid/view/View;)V

    :cond_0
    const/4 v1, 0x1

    iput-boolean v1, p0, Lcom/google/android/gms/internal/gv;->wL:Z

    monitor-exit v0

    return-void

    :catchall_0
    move-exception p0

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw p0
.end method

.method private dC()V
    .locals 2

    iget-object v0, p0, Lcom/google/android/gms/internal/gv;->mw:Ljava/lang/Object;

    monitor-enter v0

    :try_start_0
    iget-boolean v1, p0, Lcom/google/android/gms/internal/gv;->wL:Z

    if-eqz v1, :cond_0

    invoke-static {p0}, Lcom/google/android/gms/internal/gn;->j(Landroid/view/View;)V

    :cond_0
    const/4 v1, 0x0

    iput-boolean v1, p0, Lcom/google/android/gms/internal/gv;->wL:Z

    monitor-exit v0

    return-void

    :catchall_0
    move-exception p0

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw p0
.end method


# virtual methods
.method protected X(Ljava/lang/String;)V
    .locals 2

    iget-object v0, p0, Lcom/google/android/gms/internal/gv;->mw:Ljava/lang/Object;

    monitor-enter v0

    :try_start_0
    invoke-virtual {p0}, Lcom/google/android/gms/internal/gv;->isDestroyed()Z

    move-result v1

    if-nez v1, :cond_0

    invoke-virtual {p0, p1}, Lcom/google/android/gms/internal/gv;->loadUrl(Ljava/lang/String;)V

    goto :goto_0

    :cond_0
    const-string p0, "The webview is destroyed. Ignoring action."

    invoke-static {p0}, Lcom/google/android/gms/internal/gs;->W(Ljava/lang/String;)V

    :goto_0
    monitor-exit v0

    return-void

    :catchall_0
    move-exception p0

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw p0
.end method

.method public Y()Lcom/google/android/gms/internal/ay;
    .locals 1

    iget-object v0, p0, Lcom/google/android/gms/internal/gv;->mw:Ljava/lang/Object;

    monitor-enter v0

    :try_start_0
    iget-object p0, p0, Lcom/google/android/gms/internal/gv;->qr:Lcom/google/android/gms/internal/ay;

    monitor-exit v0

    return-object p0

    :catchall_0
    move-exception p0

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw p0
.end method

.method public a(Landroid/content/Context;Lcom/google/android/gms/internal/ay;)V
    .locals 2

    iget-object v0, p0, Lcom/google/android/gms/internal/gv;->mw:Ljava/lang/Object;

    monitor-enter v0

    :try_start_0
    iget-object v1, p0, Lcom/google/android/gms/internal/gv;->wI:Lcom/google/android/gms/internal/gv$a;

    invoke-virtual {v1, p1}, Lcom/google/android/gms/internal/gv$a;->setBaseContext(Landroid/content/Context;)V

    const/4 p1, 0x0

    iput-object p1, p0, Lcom/google/android/gms/internal/gv;->wJ:Lcom/google/android/gms/internal/dk;

    iput-object p2, p0, Lcom/google/android/gms/internal/gv;->qr:Lcom/google/android/gms/internal/ay;

    const/4 p2, 0x0

    iput-boolean p2, p0, Lcom/google/android/gms/internal/gv;->wK:Z

    iput-boolean p2, p0, Lcom/google/android/gms/internal/gv;->wN:Z

    invoke-static {p0}, Lcom/google/android/gms/internal/gj;->b(Landroid/webkit/WebView;)V

    const-string p2, "about:blank"

    invoke-virtual {p0, p2}, Lcom/google/android/gms/internal/gv;->loadUrl(Ljava/lang/String;)V

    iget-object p2, p0, Lcom/google/android/gms/internal/gv;->wH:Lcom/google/android/gms/internal/gw;

    invoke-virtual {p2}, Lcom/google/android/gms/internal/gw;->reset()V

    invoke-virtual {p0, p1}, Lcom/google/android/gms/internal/gv;->setOnTouchListener(Landroid/view/View$OnTouchListener;)V

    invoke-virtual {p0, p1}, Lcom/google/android/gms/internal/gv;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    monitor-exit v0

    return-void

    :catchall_0
    move-exception p0

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw p0
.end method

.method public a(Lcom/google/android/gms/internal/ay;)V
    .locals 1

    iget-object v0, p0, Lcom/google/android/gms/internal/gv;->mw:Ljava/lang/Object;

    monitor-enter v0

    :try_start_0
    iput-object p1, p0, Lcom/google/android/gms/internal/gv;->qr:Lcom/google/android/gms/internal/ay;

    invoke-virtual {p0}, Lcom/google/android/gms/internal/gv;->requestLayout()V

    monitor-exit v0

    return-void

    :catchall_0
    move-exception p0

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw p0
.end method

.method public a(Lcom/google/android/gms/internal/dk;)V
    .locals 1

    iget-object v0, p0, Lcom/google/android/gms/internal/gv;->mw:Ljava/lang/Object;

    monitor-enter v0

    :try_start_0
    iput-object p1, p0, Lcom/google/android/gms/internal/gv;->wJ:Lcom/google/android/gms/internal/dk;

    monitor-exit v0

    return-void

    :catchall_0
    move-exception p0

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw p0
.end method

.method public a(Ljava/lang/String;Ljava/util/Map;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "*>;)V"
        }
    .end annotation

    :try_start_0
    invoke-static {p2}, Lcom/google/android/gms/internal/gj;->t(Ljava/util/Map;)Lorg/json/JSONObject;

    move-result-object p2
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    invoke-virtual {p0, p1, p2}, Lcom/google/android/gms/internal/gv;->b(Ljava/lang/String;Lorg/json/JSONObject;)V

    return-void

    :catch_0
    const-string p0, "Could not convert parameters to JSON."

    invoke-static {p0}, Lcom/google/android/gms/internal/gs;->W(Ljava/lang/String;)V

    return-void
.end method

.method public a(Ljava/lang/String;Lorg/json/JSONObject;)V
    .locals 3

    if-nez p2, :cond_0

    new-instance p2, Lorg/json/JSONObject;

    invoke-direct {p2}, Lorg/json/JSONObject;-><init>()V

    :cond_0
    invoke-virtual {p2}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    move-result-object p2

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "javascript:"

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    const-string v1, "("

    invoke-virtual {p1, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p1, ");"

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p0, p1}, Lcom/google/android/gms/internal/gv;->X(Ljava/lang/String;)V

    return-void
.end method

.method public b(Ljava/lang/String;Lorg/json/JSONObject;)V
    .locals 2

    if-nez p2, :cond_0

    new-instance p2, Lorg/json/JSONObject;

    invoke-direct {p2}, Lorg/json/JSONObject;-><init>()V

    :cond_0
    invoke-virtual {p2}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    move-result-object p2

    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "javascript:AFMA_ReceiveMessage(\'"

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p1, "\',"

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p1, ");"

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    new-instance p1, Ljava/lang/StringBuilder;

    const-string p2, "Dispatching AFMA event: "

    invoke-direct {p1, p2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {p1}, Lcom/google/android/gms/internal/gs;->V(Ljava/lang/String;)V

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p0, p1}, Lcom/google/android/gms/internal/gv;->X(Ljava/lang/String;)V

    return-void
.end method

.method public bS()V
    .locals 6

    invoke-virtual {p0}, Lcom/google/android/gms/internal/gv;->du()Lcom/google/android/gms/internal/gw;

    move-result-object v0

    invoke-virtual {v0}, Lcom/google/android/gms/internal/gw;->dE()Z

    move-result v0

    if-nez v0, :cond_0

    return-void

    :cond_0
    new-instance v0, Landroid/util/DisplayMetrics;

    invoke-direct {v0}, Landroid/util/DisplayMetrics;-><init>()V

    iget-object v1, p0, Lcom/google/android/gms/internal/gv;->mG:Landroid/view/WindowManager;

    invoke-interface {v1}, Landroid/view/WindowManager;->getDefaultDisplay()Landroid/view/Display;

    move-result-object v1

    invoke-virtual {v1, v0}, Landroid/view/Display;->getMetrics(Landroid/util/DisplayMetrics;)V

    invoke-virtual {p0}, Lcom/google/android/gms/internal/gv;->getContext()Landroid/content/Context;

    move-result-object v2

    invoke-static {v2}, Lcom/google/android/gms/internal/gj;->s(Landroid/content/Context;)I

    move-result v2

    iget v3, v0, Landroid/util/DisplayMetrics;->densityDpi:I

    int-to-float v3, v3

    const/high16 v4, 0x43200000    # 160.0f

    div-float/2addr v4, v3

    iget v3, v0, Landroid/util/DisplayMetrics;->widthPixels:I

    int-to-float v3, v3

    mul-float/2addr v3, v4

    invoke-static {v3}, Ljava/lang/Math;->round(F)I

    move-result v3

    iget v5, v0, Landroid/util/DisplayMetrics;->heightPixels:I

    sub-int/2addr v5, v2

    int-to-float v2, v5

    mul-float/2addr v2, v4

    invoke-static {v2}, Ljava/lang/Math;->round(F)I

    move-result v2

    :try_start_0
    new-instance v4, Lorg/json/JSONObject;

    invoke-direct {v4}, Lorg/json/JSONObject;-><init>()V

    const-string v5, "width"

    invoke-virtual {v4, v5, v3}, Lorg/json/JSONObject;->put(Ljava/lang/String;I)Lorg/json/JSONObject;

    move-result-object v3

    const-string v4, "height"

    invoke-virtual {v3, v4, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;I)Lorg/json/JSONObject;

    move-result-object v2

    const-string v3, "density"

    iget v0, v0, Landroid/util/DisplayMetrics;->density:F

    float-to-double v4, v0

    invoke-virtual {v2, v3, v4, v5}, Lorg/json/JSONObject;->put(Ljava/lang/String;D)Lorg/json/JSONObject;

    move-result-object v0

    const-string v2, "rotation"

    invoke-virtual {v1}, Landroid/view/Display;->getRotation()I

    move-result v1

    invoke-virtual {v0, v2, v1}, Lorg/json/JSONObject;->put(Ljava/lang/String;I)Lorg/json/JSONObject;

    move-result-object v0

    const-string v1, "onScreenInfoChanged"

    invoke-virtual {p0, v1, v0}, Lcom/google/android/gms/internal/gv;->b(Ljava/lang/String;Lorg/json/JSONObject;)V
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception p0

    const-string v0, "Error occured while obtaining screen information."

    invoke-static {v0, p0}, Lcom/google/android/gms/internal/gs;->b(Ljava/lang/String;Ljava/lang/Throwable;)V

    :goto_0
    return-void
.end method

.method public bZ()V
    .locals 3

    new-instance v0, Ljava/util/HashMap;

    const/4 v1, 0x1

    invoke-direct {v0, v1}, Ljava/util/HashMap;-><init>(I)V

    iget-object v1, p0, Lcom/google/android/gms/internal/gv;->qs:Lcom/google/android/gms/internal/gt;

    iget-object v1, v1, Lcom/google/android/gms/internal/gt;->wD:Ljava/lang/String;

    const-string v2, "version"

    invoke-virtual {v0, v2, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string v1, "onshow"

    invoke-virtual {p0, v1, v0}, Lcom/google/android/gms/internal/gv;->a(Ljava/lang/String;Ljava/util/Map;)V

    return-void
.end method

.method public ca()V
    .locals 3

    new-instance v0, Ljava/util/HashMap;

    const/4 v1, 0x1

    invoke-direct {v0, v1}, Ljava/util/HashMap;-><init>(I)V

    iget-object v1, p0, Lcom/google/android/gms/internal/gv;->qs:Lcom/google/android/gms/internal/gt;

    iget-object v1, v1, Lcom/google/android/gms/internal/gt;->wD:Ljava/lang/String;

    const-string v2, "version"

    invoke-virtual {v0, v2, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string v1, "onhide"

    invoke-virtual {p0, v1, v0}, Lcom/google/android/gms/internal/gv;->a(Ljava/lang/String;Ljava/util/Map;)V

    return-void
.end method

.method public destroy()V
    .locals 2

    iget-object v0, p0, Lcom/google/android/gms/internal/gv;->mw:Ljava/lang/Object;

    monitor-enter v0

    :try_start_0
    invoke-super {p0}, Landroid/webkit/WebView;->destroy()V

    const/4 v1, 0x1

    iput-boolean v1, p0, Lcom/google/android/gms/internal/gv;->wM:Z

    monitor-exit v0

    return-void

    :catchall_0
    move-exception p0

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw p0
.end method

.method public dt()Lcom/google/android/gms/internal/dk;
    .locals 1

    iget-object v0, p0, Lcom/google/android/gms/internal/gv;->mw:Ljava/lang/Object;

    monitor-enter v0

    :try_start_0
    iget-object p0, p0, Lcom/google/android/gms/internal/gv;->wJ:Lcom/google/android/gms/internal/dk;

    monitor-exit v0

    return-object p0

    :catchall_0
    move-exception p0

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw p0
.end method

.method public du()Lcom/google/android/gms/internal/gw;
    .locals 0

    iget-object p0, p0, Lcom/google/android/gms/internal/gv;->wH:Lcom/google/android/gms/internal/gw;

    return-object p0
.end method

.method public dv()Z
    .locals 0

    iget-boolean p0, p0, Lcom/google/android/gms/internal/gv;->wN:Z

    return p0
.end method

.method public dw()Lcom/google/android/gms/internal/k;
    .locals 0

    iget-object p0, p0, Lcom/google/android/gms/internal/gv;->sX:Lcom/google/android/gms/internal/k;

    return-object p0
.end method

.method public dx()Lcom/google/android/gms/internal/gt;
    .locals 0

    iget-object p0, p0, Lcom/google/android/gms/internal/gv;->qs:Lcom/google/android/gms/internal/gt;

    return-object p0
.end method

.method public dy()Z
    .locals 1

    iget-object v0, p0, Lcom/google/android/gms/internal/gv;->mw:Ljava/lang/Object;

    monitor-enter v0

    :try_start_0
    iget-boolean p0, p0, Lcom/google/android/gms/internal/gv;->wK:Z

    monitor-exit v0

    return p0

    :catchall_0
    move-exception p0

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw p0
.end method

.method public dz()Landroid/content/Context;
    .locals 0

    iget-object p0, p0, Lcom/google/android/gms/internal/gv;->wI:Lcom/google/android/gms/internal/gv$a;

    invoke-virtual {p0}, Lcom/google/android/gms/internal/gv$a;->dz()Landroid/content/Context;

    move-result-object p0

    return-object p0
.end method

.method public evaluateJavascript(Ljava/lang/String;Landroid/webkit/ValueCallback;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Landroid/webkit/ValueCallback<",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    iget-object v0, p0, Lcom/google/android/gms/internal/gv;->mw:Ljava/lang/Object;

    monitor-enter v0

    :try_start_0
    invoke-virtual {p0}, Lcom/google/android/gms/internal/gv;->isDestroyed()Z

    move-result v1

    if-eqz v1, :cond_1

    const-string p0, "The webview is destroyed. Ignoring action."

    invoke-static {p0}, Lcom/google/android/gms/internal/gs;->W(Ljava/lang/String;)V

    if-eqz p2, :cond_0

    const/4 p0, 0x0

    invoke-interface {p2, p0}, Landroid/webkit/ValueCallback;->onReceiveValue(Ljava/lang/Object;)V

    :cond_0
    monitor-exit v0

    return-void

    :cond_1
    invoke-super {p0, p1, p2}, Landroid/webkit/WebView;->evaluateJavascript(Ljava/lang/String;Landroid/webkit/ValueCallback;)V

    monitor-exit v0

    return-void

    :catchall_0
    move-exception p0

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw p0
.end method

.method public isDestroyed()Z
    .locals 1

    iget-object v0, p0, Lcom/google/android/gms/internal/gv;->mw:Ljava/lang/Object;

    monitor-enter v0

    :try_start_0
    iget-boolean p0, p0, Lcom/google/android/gms/internal/gv;->wM:Z

    monitor-exit v0

    return p0

    :catchall_0
    move-exception p0

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw p0
.end method

.method public o(Z)V
    .locals 2

    iget-object v0, p0, Lcom/google/android/gms/internal/gv;->mw:Ljava/lang/Object;

    monitor-enter v0

    :try_start_0
    iget-object v1, p0, Lcom/google/android/gms/internal/gv;->wJ:Lcom/google/android/gms/internal/dk;

    if-eqz v1, :cond_0

    invoke-virtual {v1, p1}, Lcom/google/android/gms/internal/dk;->o(Z)V

    goto :goto_0

    :cond_0
    iput-boolean p1, p0, Lcom/google/android/gms/internal/gv;->wN:Z

    :goto_0
    monitor-exit v0

    return-void

    :catchall_0
    move-exception p0

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw p0
.end method

.method public onDownloadStart(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;J)V
    .locals 0

    :try_start_0
    new-instance p2, Landroid/content/Intent;

    const-string p3, "android.intent.action.VIEW"

    invoke-direct {p2, p3}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    invoke-static {p1}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object p3

    invoke-virtual {p2, p3, p4}, Landroid/content/Intent;->setDataAndType(Landroid/net/Uri;Ljava/lang/String;)Landroid/content/Intent;

    invoke-virtual {p0}, Lcom/google/android/gms/internal/gv;->getContext()Landroid/content/Context;

    move-result-object p0

    invoke-virtual {p0, p2}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V
    :try_end_0
    .catch Landroid/content/ActivityNotFoundException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    new-instance p0, Ljava/lang/StringBuilder;

    const-string p2, "Couldn\'t find an Activity to view url/mimetype: "

    invoke-direct {p0, p2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p0

    const-string p1, " / "

    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p0

    invoke-virtual {p0, p4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-static {p0}, Lcom/google/android/gms/internal/gs;->S(Ljava/lang/String;)V

    :goto_0
    return-void
.end method

.method protected onMeasure(II)V
    .locals 7

    const-string v0, "Not enough space to show ad. Needs "

    iget-object v1, p0, Lcom/google/android/gms/internal/gv;->mw:Ljava/lang/Object;

    monitor-enter v1

    :try_start_0
    invoke-virtual {p0}, Lcom/google/android/gms/internal/gv;->isInEditMode()Z

    move-result v2

    if-nez v2, :cond_9

    iget-boolean v2, p0, Lcom/google/android/gms/internal/gv;->wK:Z

    if-eqz v2, :cond_0

    goto/16 :goto_4

    :cond_0
    invoke-static {p1}, Landroid/view/View$MeasureSpec;->getMode(I)I

    move-result v2

    invoke-static {p1}, Landroid/view/View$MeasureSpec;->getSize(I)I

    move-result p1

    invoke-static {p2}, Landroid/view/View$MeasureSpec;->getMode(I)I

    move-result v3

    invoke-static {p2}, Landroid/view/View$MeasureSpec;->getSize(I)I

    move-result p2

    const/high16 v4, 0x40000000    # 2.0f

    const/high16 v5, -0x80000000

    const v6, 0x7fffffff

    if-eq v2, v5, :cond_2

    if-ne v2, v4, :cond_1

    goto :goto_0

    :cond_1
    move v2, v6

    goto :goto_1

    :cond_2
    :goto_0
    move v2, p1

    :goto_1
    if-eq v3, v5, :cond_3

    if-ne v3, v4, :cond_4

    :cond_3
    move v6, p2

    :cond_4
    iget-object v3, p0, Lcom/google/android/gms/internal/gv;->qr:Lcom/google/android/gms/internal/ay;

    iget v3, v3, Lcom/google/android/gms/internal/ay;->widthPixels:I

    const/16 v4, 0x8

    const/4 v5, 0x0

    if-gt v3, v2, :cond_7

    iget-object v2, p0, Lcom/google/android/gms/internal/gv;->qr:Lcom/google/android/gms/internal/ay;

    iget v2, v2, Lcom/google/android/gms/internal/ay;->heightPixels:I

    if-le v2, v6, :cond_5

    goto :goto_2

    :cond_5
    invoke-virtual {p0}, Lcom/google/android/gms/internal/gv;->getVisibility()I

    move-result p1

    if-eq p1, v4, :cond_6

    invoke-virtual {p0, v5}, Lcom/google/android/gms/internal/gv;->setVisibility(I)V

    :cond_6
    iget-object p1, p0, Lcom/google/android/gms/internal/gv;->qr:Lcom/google/android/gms/internal/ay;

    iget p1, p1, Lcom/google/android/gms/internal/ay;->widthPixels:I

    iget-object p2, p0, Lcom/google/android/gms/internal/gv;->qr:Lcom/google/android/gms/internal/ay;

    iget p2, p2, Lcom/google/android/gms/internal/ay;->heightPixels:I

    invoke-virtual {p0, p1, p2}, Lcom/google/android/gms/internal/gv;->setMeasuredDimension(II)V

    goto :goto_3

    :cond_7
    :goto_2
    iget-object v2, p0, Lcom/google/android/gms/internal/gv;->wI:Lcom/google/android/gms/internal/gv$a;

    invoke-virtual {v2}, Lcom/google/android/gms/internal/gv$a;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    invoke-virtual {v2}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object v2

    iget v2, v2, Landroid/util/DisplayMetrics;->density:F

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v0, p0, Lcom/google/android/gms/internal/gv;->qr:Lcom/google/android/gms/internal/ay;

    iget v0, v0, Lcom/google/android/gms/internal/ay;->widthPixels:I

    int-to-float v0, v0

    div-float/2addr v0, v2

    float-to-int v0, v0

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v3, "x"

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v3, p0, Lcom/google/android/gms/internal/gv;->qr:Lcom/google/android/gms/internal/ay;

    iget v3, v3, Lcom/google/android/gms/internal/ay;->heightPixels:I

    int-to-float v3, v3

    div-float/2addr v3, v2

    float-to-int v3, v3

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v3, " dp, but only has "

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    int-to-float p1, p1

    div-float/2addr p1, v2

    float-to-int p1, p1

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object p1

    const-string v0, "x"

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    int-to-float p2, p2

    div-float/2addr p2, v2

    float-to-int p2, p2

    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object p1

    const-string p2, " dp."

    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {p1}, Lcom/google/android/gms/internal/gs;->W(Ljava/lang/String;)V

    invoke-virtual {p0}, Lcom/google/android/gms/internal/gv;->getVisibility()I

    move-result p1

    if-eq p1, v4, :cond_8

    const/4 p1, 0x4

    invoke-virtual {p0, p1}, Lcom/google/android/gms/internal/gv;->setVisibility(I)V

    :cond_8
    invoke-virtual {p0, v5, v5}, Lcom/google/android/gms/internal/gv;->setMeasuredDimension(II)V

    :goto_3
    monitor-exit v1

    return-void

    :cond_9
    :goto_4
    invoke-super {p0, p1, p2}, Landroid/webkit/WebView;->onMeasure(II)V

    monitor-exit v1

    return-void

    :catchall_0
    move-exception p0

    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw p0
.end method

.method public onTouchEvent(Landroid/view/MotionEvent;)Z
    .locals 1

    iget-object v0, p0, Lcom/google/android/gms/internal/gv;->sX:Lcom/google/android/gms/internal/k;

    if-eqz v0, :cond_0

    invoke-virtual {v0, p1}, Lcom/google/android/gms/internal/k;->a(Landroid/view/MotionEvent;)V

    :cond_0
    invoke-super {p0, p1}, Landroid/webkit/WebView;->onTouchEvent(Landroid/view/MotionEvent;)Z

    move-result p0

    return p0
.end method

.method public setContext(Landroid/content/Context;)V
    .locals 0

    iget-object p0, p0, Lcom/google/android/gms/internal/gv;->wI:Lcom/google/android/gms/internal/gv$a;

    invoke-virtual {p0, p1}, Lcom/google/android/gms/internal/gv$a;->setBaseContext(Landroid/content/Context;)V

    return-void
.end method

.method public x(Z)V
    .locals 1

    iget-object v0, p0, Lcom/google/android/gms/internal/gv;->mw:Ljava/lang/Object;

    monitor-enter v0

    :try_start_0
    iput-boolean p1, p0, Lcom/google/android/gms/internal/gv;->wK:Z

    invoke-direct {p0}, Lcom/google/android/gms/internal/gv;->dA()V

    monitor-exit v0

    return-void

    :catchall_0
    move-exception p0

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw p0
.end method
