.class public final Lcom/google/android/gms/internal/at;
.super Lcom/google/android/gms/internal/bc$a;


# annotations
.annotation runtime Lcom/google/android/gms/internal/ez;
.end annotation


# instance fields
.field private final nR:Lcom/google/android/gms/ads/AdListener;


# direct methods
.method public constructor <init>(Lcom/google/android/gms/ads/AdListener;)V
    .locals 0

    invoke-direct {p0}, Lcom/google/android/gms/internal/bc$a;-><init>()V

    iput-object p1, p0, Lcom/google/android/gms/internal/at;->nR:Lcom/google/android/gms/ads/AdListener;

    return-void
.end method


# virtual methods
.method public onAdClosed()V
    .locals 0

    iget-object p0, p0, Lcom/google/android/gms/internal/at;->nR:Lcom/google/android/gms/ads/AdListener;

    invoke-virtual {p0}, Lcom/google/android/gms/ads/AdListener;->onAdClosed()V

    return-void
.end method

.method public onAdFailedToLoad(I)V
    .locals 0

    iget-object p0, p0, Lcom/google/android/gms/internal/at;->nR:Lcom/google/android/gms/ads/AdListener;

    invoke-virtual {p0, p1}, Lcom/google/android/gms/ads/AdListener;->onAdFailedToLoad(I)V

    return-void
.end method

.method public onAdLeftApplication()V
    .locals 0

    iget-object p0, p0, Lcom/google/android/gms/internal/at;->nR:Lcom/google/android/gms/ads/AdListener;

    invoke-virtual {p0}, Lcom/google/android/gms/ads/AdListener;->onAdLeftApplication()V

    return-void
.end method

.method public onAdLoaded()V
    .locals 0

    iget-object p0, p0, Lcom/google/android/gms/internal/at;->nR:Lcom/google/android/gms/ads/AdListener;

    invoke-virtual {p0}, Lcom/google/android/gms/ads/AdListener;->onAdLoaded()V

    return-void
.end method

.method public onAdOpened()V
    .locals 0

    iget-object p0, p0, Lcom/google/android/gms/internal/at;->nR:Lcom/google/android/gms/ads/AdListener;

    invoke-virtual {p0}, Lcom/google/android/gms/ads/AdListener;->onAdOpened()V

    return-void
.end method
