.class public Lcom/google/android/gms/internal/bi;
.super Ljava/lang/Object;


# instance fields
.field private final mContext:Landroid/content/Context;

.field private nR:Lcom/google/android/gms/ads/AdListener;

.field private oA:Ljava/lang/String;

.field private oC:Lcom/google/android/gms/ads/purchase/InAppPurchaseListener;

.field private oD:Lcom/google/android/gms/ads/purchase/PlayStorePurchaseListener;

.field private oF:Lcom/google/android/gms/ads/doubleclick/PublisherInterstitialAd;

.field private oG:Lcom/google/android/gms/ads/doubleclick/c;

.field private oi:Lcom/google/android/gms/ads/doubleclick/AppEventListener;

.field private ok:Ljava/lang/String;

.field private final ox:Lcom/google/android/gms/internal/cs;

.field private final oy:Lcom/google/android/gms/internal/ax;

.field private oz:Lcom/google/android/gms/internal/bd;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 2

    invoke-static {}, Lcom/google/android/gms/internal/ax;->bb()Lcom/google/android/gms/internal/ax;

    move-result-object v0

    const/4 v1, 0x0

    invoke-direct {p0, p1, v0, v1}, Lcom/google/android/gms/internal/bi;-><init>(Landroid/content/Context;Lcom/google/android/gms/internal/ax;Lcom/google/android/gms/ads/doubleclick/PublisherInterstitialAd;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Lcom/google/android/gms/ads/doubleclick/PublisherInterstitialAd;)V
    .locals 1

    invoke-static {}, Lcom/google/android/gms/internal/ax;->bb()Lcom/google/android/gms/internal/ax;

    move-result-object v0

    invoke-direct {p0, p1, v0, p2}, Lcom/google/android/gms/internal/bi;-><init>(Landroid/content/Context;Lcom/google/android/gms/internal/ax;Lcom/google/android/gms/ads/doubleclick/PublisherInterstitialAd;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Lcom/google/android/gms/internal/ax;Lcom/google/android/gms/ads/doubleclick/PublisherInterstitialAd;)V
    .locals 1

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance v0, Lcom/google/android/gms/internal/cs;

    invoke-direct {v0}, Lcom/google/android/gms/internal/cs;-><init>()V

    iput-object v0, p0, Lcom/google/android/gms/internal/bi;->ox:Lcom/google/android/gms/internal/cs;

    iput-object p1, p0, Lcom/google/android/gms/internal/bi;->mContext:Landroid/content/Context;

    iput-object p2, p0, Lcom/google/android/gms/internal/bi;->oy:Lcom/google/android/gms/internal/ax;

    iput-object p3, p0, Lcom/google/android/gms/internal/bi;->oF:Lcom/google/android/gms/ads/doubleclick/PublisherInterstitialAd;

    return-void
.end method

.method private v(Ljava/lang/String;)V
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/os/RemoteException;
        }
    .end annotation

    iget-object v0, p0, Lcom/google/android/gms/internal/bi;->ok:Ljava/lang/String;

    if-nez v0, :cond_0

    invoke-direct {p0, p1}, Lcom/google/android/gms/internal/bi;->w(Ljava/lang/String;)V

    :cond_0
    iget-object p1, p0, Lcom/google/android/gms/internal/bi;->mContext:Landroid/content/Context;

    new-instance v0, Lcom/google/android/gms/internal/ay;

    invoke-direct {v0}, Lcom/google/android/gms/internal/ay;-><init>()V

    iget-object v1, p0, Lcom/google/android/gms/internal/bi;->ok:Ljava/lang/String;

    iget-object v2, p0, Lcom/google/android/gms/internal/bi;->ox:Lcom/google/android/gms/internal/cs;

    invoke-static {p1, v0, v1, v2}, Lcom/google/android/gms/internal/au;->a(Landroid/content/Context;Lcom/google/android/gms/internal/ay;Ljava/lang/String;Lcom/google/android/gms/internal/cs;)Lcom/google/android/gms/internal/bd;

    move-result-object p1

    iput-object p1, p0, Lcom/google/android/gms/internal/bi;->oz:Lcom/google/android/gms/internal/bd;

    iget-object v0, p0, Lcom/google/android/gms/internal/bi;->nR:Lcom/google/android/gms/ads/AdListener;

    if-eqz v0, :cond_1

    new-instance v0, Lcom/google/android/gms/internal/at;

    iget-object v1, p0, Lcom/google/android/gms/internal/bi;->nR:Lcom/google/android/gms/ads/AdListener;

    invoke-direct {v0, v1}, Lcom/google/android/gms/internal/at;-><init>(Lcom/google/android/gms/ads/AdListener;)V

    invoke-interface {p1, v0}, Lcom/google/android/gms/internal/bd;->a(Lcom/google/android/gms/internal/bc;)V

    :cond_1
    iget-object p1, p0, Lcom/google/android/gms/internal/bi;->oi:Lcom/google/android/gms/ads/doubleclick/AppEventListener;

    if-eqz p1, :cond_2

    iget-object p1, p0, Lcom/google/android/gms/internal/bi;->oz:Lcom/google/android/gms/internal/bd;

    new-instance v0, Lcom/google/android/gms/internal/ba;

    iget-object v1, p0, Lcom/google/android/gms/internal/bi;->oi:Lcom/google/android/gms/ads/doubleclick/AppEventListener;

    invoke-direct {v0, v1}, Lcom/google/android/gms/internal/ba;-><init>(Lcom/google/android/gms/ads/doubleclick/AppEventListener;)V

    invoke-interface {p1, v0}, Lcom/google/android/gms/internal/bd;->a(Lcom/google/android/gms/internal/bf;)V

    :cond_2
    iget-object p1, p0, Lcom/google/android/gms/internal/bi;->oC:Lcom/google/android/gms/ads/purchase/InAppPurchaseListener;

    if-eqz p1, :cond_3

    iget-object p1, p0, Lcom/google/android/gms/internal/bi;->oz:Lcom/google/android/gms/internal/bd;

    new-instance v0, Lcom/google/android/gms/internal/em;

    iget-object v1, p0, Lcom/google/android/gms/internal/bi;->oC:Lcom/google/android/gms/ads/purchase/InAppPurchaseListener;

    invoke-direct {v0, v1}, Lcom/google/android/gms/internal/em;-><init>(Lcom/google/android/gms/ads/purchase/InAppPurchaseListener;)V

    invoke-interface {p1, v0}, Lcom/google/android/gms/internal/bd;->a(Lcom/google/android/gms/internal/eh;)V

    :cond_3
    iget-object p1, p0, Lcom/google/android/gms/internal/bi;->oD:Lcom/google/android/gms/ads/purchase/PlayStorePurchaseListener;

    if-eqz p1, :cond_4

    iget-object p1, p0, Lcom/google/android/gms/internal/bi;->oz:Lcom/google/android/gms/internal/bd;

    new-instance v0, Lcom/google/android/gms/internal/eq;

    iget-object v1, p0, Lcom/google/android/gms/internal/bi;->oD:Lcom/google/android/gms/ads/purchase/PlayStorePurchaseListener;

    invoke-direct {v0, v1}, Lcom/google/android/gms/internal/eq;-><init>(Lcom/google/android/gms/ads/purchase/PlayStorePurchaseListener;)V

    iget-object v1, p0, Lcom/google/android/gms/internal/bi;->oA:Ljava/lang/String;

    invoke-interface {p1, v0, v1}, Lcom/google/android/gms/internal/bd;->a(Lcom/google/android/gms/internal/el;Ljava/lang/String;)V

    :cond_4
    iget-object p1, p0, Lcom/google/android/gms/internal/bi;->oG:Lcom/google/android/gms/ads/doubleclick/c;

    if-eqz p1, :cond_5

    iget-object p1, p0, Lcom/google/android/gms/internal/bi;->oz:Lcom/google/android/gms/internal/bd;

    new-instance v0, Lcom/google/android/gms/internal/ex;

    iget-object v1, p0, Lcom/google/android/gms/internal/bi;->oG:Lcom/google/android/gms/ads/doubleclick/c;

    iget-object p0, p0, Lcom/google/android/gms/internal/bi;->oF:Lcom/google/android/gms/ads/doubleclick/PublisherInterstitialAd;

    invoke-direct {v0, v1, p0}, Lcom/google/android/gms/internal/ex;-><init>(Lcom/google/android/gms/ads/doubleclick/c;Lcom/google/android/gms/ads/doubleclick/PublisherInterstitialAd;)V

    invoke-interface {p1, v0}, Lcom/google/android/gms/internal/bd;->a(Lcom/google/android/gms/internal/eu;)V

    :cond_5
    return-void
.end method

.method private w(Ljava/lang/String;)V
    .locals 2

    iget-object p0, p0, Lcom/google/android/gms/internal/bi;->oz:Lcom/google/android/gms/internal/bd;

    if-eqz p0, :cond_0

    return-void

    :cond_0
    new-instance p0, Ljava/lang/IllegalStateException;

    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "The ad unit ID must be set on InterstitialAd before "

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    const-string v0, " is called."

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-direct {p0, p1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw p0
.end method


# virtual methods
.method public a(Lcom/google/android/gms/internal/bg;)V
    .locals 3

    :try_start_0
    iget-object v0, p0, Lcom/google/android/gms/internal/bi;->oz:Lcom/google/android/gms/internal/bd;

    if-nez v0, :cond_0

    const-string v0, "loadAd"

    invoke-direct {p0, v0}, Lcom/google/android/gms/internal/bi;->v(Ljava/lang/String;)V

    :cond_0
    iget-object v0, p0, Lcom/google/android/gms/internal/bi;->oz:Lcom/google/android/gms/internal/bd;

    iget-object v1, p0, Lcom/google/android/gms/internal/bi;->oy:Lcom/google/android/gms/internal/ax;

    iget-object v2, p0, Lcom/google/android/gms/internal/bi;->mContext:Landroid/content/Context;

    invoke-virtual {v1, v2, p1}, Lcom/google/android/gms/internal/ax;->a(Landroid/content/Context;Lcom/google/android/gms/internal/bg;)Lcom/google/android/gms/internal/av;

    move-result-object v1

    invoke-interface {v0, v1}, Lcom/google/android/gms/internal/bd;->a(Lcom/google/android/gms/internal/av;)Z

    move-result v0

    if-eqz v0, :cond_1

    iget-object p0, p0, Lcom/google/android/gms/internal/bi;->ox:Lcom/google/android/gms/internal/cs;

    invoke-virtual {p1}, Lcom/google/android/gms/internal/bg;->be()Ljava/util/Map;

    move-result-object p1

    invoke-virtual {p0, p1}, Lcom/google/android/gms/internal/cs;->d(Ljava/util/Map;)V
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception p0

    const-string p1, "Failed to load ad."

    invoke-static {p1, p0}, Lcom/google/android/gms/internal/gs;->d(Ljava/lang/String;Ljava/lang/Throwable;)V

    :cond_1
    :goto_0
    return-void
.end method

.method public getAdListener()Lcom/google/android/gms/ads/AdListener;
    .locals 0

    iget-object p0, p0, Lcom/google/android/gms/internal/bi;->nR:Lcom/google/android/gms/ads/AdListener;

    return-object p0
.end method

.method public getAdUnitId()Ljava/lang/String;
    .locals 0

    iget-object p0, p0, Lcom/google/android/gms/internal/bi;->ok:Ljava/lang/String;

    return-object p0
.end method

.method public getAppEventListener()Lcom/google/android/gms/ads/doubleclick/AppEventListener;
    .locals 0

    iget-object p0, p0, Lcom/google/android/gms/internal/bi;->oi:Lcom/google/android/gms/ads/doubleclick/AppEventListener;

    return-object p0
.end method

.method public getInAppPurchaseListener()Lcom/google/android/gms/ads/purchase/InAppPurchaseListener;
    .locals 0

    iget-object p0, p0, Lcom/google/android/gms/internal/bi;->oC:Lcom/google/android/gms/ads/purchase/InAppPurchaseListener;

    return-object p0
.end method

.method public getMediationAdapterClassName()Ljava/lang/String;
    .locals 1

    :try_start_0
    iget-object p0, p0, Lcom/google/android/gms/internal/bi;->oz:Lcom/google/android/gms/internal/bd;

    if-eqz p0, :cond_0

    invoke-interface {p0}, Lcom/google/android/gms/internal/bd;->getMediationAdapterClassName()Ljava/lang/String;

    move-result-object p0
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    return-object p0

    :catch_0
    move-exception p0

    const-string v0, "Failed to get the mediation adapter class name."

    invoke-static {v0, p0}, Lcom/google/android/gms/internal/gs;->d(Ljava/lang/String;Ljava/lang/Throwable;)V

    :cond_0
    const/4 p0, 0x0

    return-object p0
.end method

.method public isLoaded()Z
    .locals 2

    const/4 v0, 0x0

    :try_start_0
    iget-object p0, p0, Lcom/google/android/gms/internal/bi;->oz:Lcom/google/android/gms/internal/bd;

    if-nez p0, :cond_0

    return v0

    :cond_0
    invoke-interface {p0}, Lcom/google/android/gms/internal/bd;->isReady()Z

    move-result p0
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    return p0

    :catch_0
    move-exception p0

    const-string v1, "Failed to check if ad is ready."

    invoke-static {v1, p0}, Lcom/google/android/gms/internal/gs;->d(Ljava/lang/String;Ljava/lang/Throwable;)V

    return v0
.end method

.method public setAdListener(Lcom/google/android/gms/ads/AdListener;)V
    .locals 1

    :try_start_0
    iput-object p1, p0, Lcom/google/android/gms/internal/bi;->nR:Lcom/google/android/gms/ads/AdListener;

    iget-object p0, p0, Lcom/google/android/gms/internal/bi;->oz:Lcom/google/android/gms/internal/bd;

    if-eqz p0, :cond_1

    if-eqz p1, :cond_0

    new-instance v0, Lcom/google/android/gms/internal/at;

    invoke-direct {v0, p1}, Lcom/google/android/gms/internal/at;-><init>(Lcom/google/android/gms/ads/AdListener;)V

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    invoke-interface {p0, v0}, Lcom/google/android/gms/internal/bd;->a(Lcom/google/android/gms/internal/bc;)V
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_1

    :catch_0
    move-exception p0

    const-string p1, "Failed to set the AdListener."

    invoke-static {p1, p0}, Lcom/google/android/gms/internal/gs;->d(Ljava/lang/String;Ljava/lang/Throwable;)V

    :cond_1
    :goto_1
    return-void
.end method

.method public setAdUnitId(Ljava/lang/String;)V
    .locals 1

    iget-object v0, p0, Lcom/google/android/gms/internal/bi;->ok:Ljava/lang/String;

    if-nez v0, :cond_0

    iput-object p1, p0, Lcom/google/android/gms/internal/bi;->ok:Ljava/lang/String;

    return-void

    :cond_0
    new-instance p0, Ljava/lang/IllegalStateException;

    const-string p1, "The ad unit ID can only be set once on InterstitialAd."

    invoke-direct {p0, p1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw p0
.end method

.method public setAppEventListener(Lcom/google/android/gms/ads/doubleclick/AppEventListener;)V
    .locals 1

    :try_start_0
    iput-object p1, p0, Lcom/google/android/gms/internal/bi;->oi:Lcom/google/android/gms/ads/doubleclick/AppEventListener;

    iget-object p0, p0, Lcom/google/android/gms/internal/bi;->oz:Lcom/google/android/gms/internal/bd;

    if-eqz p0, :cond_1

    if-eqz p1, :cond_0

    new-instance v0, Lcom/google/android/gms/internal/ba;

    invoke-direct {v0, p1}, Lcom/google/android/gms/internal/ba;-><init>(Lcom/google/android/gms/ads/doubleclick/AppEventListener;)V

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    invoke-interface {p0, v0}, Lcom/google/android/gms/internal/bd;->a(Lcom/google/android/gms/internal/bf;)V
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_1

    :catch_0
    move-exception p0

    const-string p1, "Failed to set the AppEventListener."

    invoke-static {p1, p0}, Lcom/google/android/gms/internal/gs;->d(Ljava/lang/String;Ljava/lang/Throwable;)V

    :cond_1
    :goto_1
    return-void
.end method

.method public setInAppPurchaseListener(Lcom/google/android/gms/ads/purchase/InAppPurchaseListener;)V
    .locals 1

    iget-object v0, p0, Lcom/google/android/gms/internal/bi;->oD:Lcom/google/android/gms/ads/purchase/PlayStorePurchaseListener;

    if-nez v0, :cond_2

    :try_start_0
    iput-object p1, p0, Lcom/google/android/gms/internal/bi;->oC:Lcom/google/android/gms/ads/purchase/InAppPurchaseListener;

    iget-object p0, p0, Lcom/google/android/gms/internal/bi;->oz:Lcom/google/android/gms/internal/bd;

    if-eqz p0, :cond_1

    if-eqz p1, :cond_0

    new-instance v0, Lcom/google/android/gms/internal/em;

    invoke-direct {v0, p1}, Lcom/google/android/gms/internal/em;-><init>(Lcom/google/android/gms/ads/purchase/InAppPurchaseListener;)V

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    invoke-interface {p0, v0}, Lcom/google/android/gms/internal/bd;->a(Lcom/google/android/gms/internal/eh;)V
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_1

    :catch_0
    move-exception p0

    const-string p1, "Failed to set the InAppPurchaseListener."

    invoke-static {p1, p0}, Lcom/google/android/gms/internal/gs;->d(Ljava/lang/String;Ljava/lang/Throwable;)V

    :cond_1
    :goto_1
    return-void

    :cond_2
    new-instance p0, Ljava/lang/IllegalStateException;

    const-string p1, "Play store purchase parameter has already been set."

    invoke-direct {p0, p1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw p0
.end method

.method public setPlayStorePurchaseParams(Lcom/google/android/gms/ads/purchase/PlayStorePurchaseListener;Ljava/lang/String;)V
    .locals 1

    :try_start_0
    iput-object p1, p0, Lcom/google/android/gms/internal/bi;->oD:Lcom/google/android/gms/ads/purchase/PlayStorePurchaseListener;

    iget-object p0, p0, Lcom/google/android/gms/internal/bi;->oz:Lcom/google/android/gms/internal/bd;

    if-eqz p0, :cond_1

    if-eqz p1, :cond_0

    new-instance v0, Lcom/google/android/gms/internal/eq;

    invoke-direct {v0, p1}, Lcom/google/android/gms/internal/eq;-><init>(Lcom/google/android/gms/ads/purchase/PlayStorePurchaseListener;)V

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    invoke-interface {p0, v0, p2}, Lcom/google/android/gms/internal/bd;->a(Lcom/google/android/gms/internal/el;Ljava/lang/String;)V
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_1

    :catch_0
    move-exception p0

    const-string p1, "Failed to set the play store purchase parameter."

    invoke-static {p1, p0}, Lcom/google/android/gms/internal/gs;->d(Ljava/lang/String;Ljava/lang/Throwable;)V

    :cond_1
    :goto_1
    return-void
.end method

.method public show()V
    .locals 1

    :try_start_0
    const-string v0, "show"

    invoke-direct {p0, v0}, Lcom/google/android/gms/internal/bi;->w(Ljava/lang/String;)V

    iget-object p0, p0, Lcom/google/android/gms/internal/bi;->oz:Lcom/google/android/gms/internal/bd;

    invoke-interface {p0}, Lcom/google/android/gms/internal/bd;->showInterstitial()V
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception p0

    const-string v0, "Failed to show interstitial."

    invoke-static {v0, p0}, Lcom/google/android/gms/internal/gs;->d(Ljava/lang/String;Ljava/lang/Throwable;)V

    :goto_0
    return-void
.end method
