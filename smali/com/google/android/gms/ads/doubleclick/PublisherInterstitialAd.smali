.class public final Lcom/google/android/gms/ads/doubleclick/PublisherInterstitialAd;
.super Ljava/lang/Object;


# instance fields
.field private final lj:Lcom/google/android/gms/internal/bi;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 1

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance v0, Lcom/google/android/gms/internal/bi;

    invoke-direct {v0, p1, p0}, Lcom/google/android/gms/internal/bi;-><init>(Landroid/content/Context;Lcom/google/android/gms/ads/doubleclick/PublisherInterstitialAd;)V

    iput-object v0, p0, Lcom/google/android/gms/ads/doubleclick/PublisherInterstitialAd;->lj:Lcom/google/android/gms/internal/bi;

    return-void
.end method


# virtual methods
.method public getAdListener()Lcom/google/android/gms/ads/AdListener;
    .locals 0

    iget-object p0, p0, Lcom/google/android/gms/ads/doubleclick/PublisherInterstitialAd;->lj:Lcom/google/android/gms/internal/bi;

    invoke-virtual {p0}, Lcom/google/android/gms/internal/bi;->getAdListener()Lcom/google/android/gms/ads/AdListener;

    move-result-object p0

    return-object p0
.end method

.method public getAdUnitId()Ljava/lang/String;
    .locals 0

    iget-object p0, p0, Lcom/google/android/gms/ads/doubleclick/PublisherInterstitialAd;->lj:Lcom/google/android/gms/internal/bi;

    invoke-virtual {p0}, Lcom/google/android/gms/internal/bi;->getAdUnitId()Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method public getAppEventListener()Lcom/google/android/gms/ads/doubleclick/AppEventListener;
    .locals 0

    iget-object p0, p0, Lcom/google/android/gms/ads/doubleclick/PublisherInterstitialAd;->lj:Lcom/google/android/gms/internal/bi;

    invoke-virtual {p0}, Lcom/google/android/gms/internal/bi;->getAppEventListener()Lcom/google/android/gms/ads/doubleclick/AppEventListener;

    move-result-object p0

    return-object p0
.end method

.method public getMediationAdapterClassName()Ljava/lang/String;
    .locals 0

    iget-object p0, p0, Lcom/google/android/gms/ads/doubleclick/PublisherInterstitialAd;->lj:Lcom/google/android/gms/internal/bi;

    invoke-virtual {p0}, Lcom/google/android/gms/internal/bi;->getMediationAdapterClassName()Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method public isLoaded()Z
    .locals 0

    iget-object p0, p0, Lcom/google/android/gms/ads/doubleclick/PublisherInterstitialAd;->lj:Lcom/google/android/gms/internal/bi;

    invoke-virtual {p0}, Lcom/google/android/gms/internal/bi;->isLoaded()Z

    move-result p0

    return p0
.end method

.method public loadAd(Lcom/google/android/gms/ads/doubleclick/PublisherAdRequest;)V
    .locals 0

    iget-object p0, p0, Lcom/google/android/gms/ads/doubleclick/PublisherInterstitialAd;->lj:Lcom/google/android/gms/internal/bi;

    invoke-virtual {p1}, Lcom/google/android/gms/ads/doubleclick/PublisherAdRequest;->V()Lcom/google/android/gms/internal/bg;

    move-result-object p1

    invoke-virtual {p0, p1}, Lcom/google/android/gms/internal/bi;->a(Lcom/google/android/gms/internal/bg;)V

    return-void
.end method

.method public setAdListener(Lcom/google/android/gms/ads/AdListener;)V
    .locals 0

    iget-object p0, p0, Lcom/google/android/gms/ads/doubleclick/PublisherInterstitialAd;->lj:Lcom/google/android/gms/internal/bi;

    invoke-virtual {p0, p1}, Lcom/google/android/gms/internal/bi;->setAdListener(Lcom/google/android/gms/ads/AdListener;)V

    return-void
.end method

.method public setAdUnitId(Ljava/lang/String;)V
    .locals 0

    iget-object p0, p0, Lcom/google/android/gms/ads/doubleclick/PublisherInterstitialAd;->lj:Lcom/google/android/gms/internal/bi;

    invoke-virtual {p0, p1}, Lcom/google/android/gms/internal/bi;->setAdUnitId(Ljava/lang/String;)V

    return-void
.end method

.method public setAppEventListener(Lcom/google/android/gms/ads/doubleclick/AppEventListener;)V
    .locals 0

    iget-object p0, p0, Lcom/google/android/gms/ads/doubleclick/PublisherInterstitialAd;->lj:Lcom/google/android/gms/internal/bi;

    invoke-virtual {p0, p1}, Lcom/google/android/gms/internal/bi;->setAppEventListener(Lcom/google/android/gms/ads/doubleclick/AppEventListener;)V

    return-void
.end method

.method public show()V
    .locals 0

    iget-object p0, p0, Lcom/google/android/gms/ads/doubleclick/PublisherInterstitialAd;->lj:Lcom/google/android/gms/internal/bi;

    invoke-virtual {p0}, Lcom/google/android/gms/internal/bi;->show()V

    return-void
.end method
