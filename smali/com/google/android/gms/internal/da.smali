.class public final Lcom/google/android/gms/internal/da;
.super Ljava/lang/Object;

# interfaces
.implements Lcom/google/ads/mediation/MediationBannerListener;
.implements Lcom/google/ads/mediation/MediationInterstitialListener;


# annotations
.annotation runtime Lcom/google/android/gms/internal/ez;
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<NETWORK_EXTRAS::",
        "Lcom/google/ads/mediation/NetworkExtras;",
        "SERVER_PARAMETERS:",
        "Lcom/google/ads/mediation/MediationServerParameters;",
        ">",
        "Ljava/lang/Object;",
        "Lcom/google/ads/mediation/MediationBannerListener;",
        "Lcom/google/ads/mediation/MediationInterstitialListener;"
    }
.end annotation


# instance fields
.field private final qF:Lcom/google/android/gms/internal/cv;


# direct methods
.method public constructor <init>(Lcom/google/android/gms/internal/cv;)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/google/android/gms/internal/da;->qF:Lcom/google/android/gms/internal/cv;

    return-void
.end method

.method static synthetic a(Lcom/google/android/gms/internal/da;)Lcom/google/android/gms/internal/cv;
    .locals 0

    iget-object p0, p0, Lcom/google/android/gms/internal/da;->qF:Lcom/google/android/gms/internal/cv;

    return-object p0
.end method


# virtual methods
.method public onClick(Lcom/google/ads/mediation/MediationBannerAdapter;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/google/ads/mediation/MediationBannerAdapter<",
            "**>;)V"
        }
    .end annotation

    const-string p1, "Adapter called onClick."

    invoke-static {p1}, Lcom/google/android/gms/internal/gs;->S(Ljava/lang/String;)V

    invoke-static {}, Lcom/google/android/gms/internal/gr;->ds()Z

    move-result p1

    if-nez p1, :cond_0

    const-string p1, "onClick must be called on the main UI thread."

    invoke-static {p1}, Lcom/google/android/gms/internal/gs;->W(Ljava/lang/String;)V

    sget-object p1, Lcom/google/android/gms/internal/gr;->wC:Landroid/os/Handler;

    new-instance v0, Lcom/google/android/gms/internal/da$1;

    invoke-direct {v0, p0}, Lcom/google/android/gms/internal/da$1;-><init>(Lcom/google/android/gms/internal/da;)V

    invoke-virtual {p1, v0}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    return-void

    :cond_0
    :try_start_0
    iget-object p0, p0, Lcom/google/android/gms/internal/da;->qF:Lcom/google/android/gms/internal/cv;

    invoke-interface {p0}, Lcom/google/android/gms/internal/cv;->onAdClicked()V
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception p0

    const-string p1, "Could not call onAdClicked."

    invoke-static {p1, p0}, Lcom/google/android/gms/internal/gs;->d(Ljava/lang/String;Ljava/lang/Throwable;)V

    :goto_0
    return-void
.end method

.method public onDismissScreen(Lcom/google/ads/mediation/MediationBannerAdapter;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/google/ads/mediation/MediationBannerAdapter<",
            "**>;)V"
        }
    .end annotation

    const-string p1, "Adapter called onDismissScreen."

    invoke-static {p1}, Lcom/google/android/gms/internal/gs;->S(Ljava/lang/String;)V

    invoke-static {}, Lcom/google/android/gms/internal/gr;->ds()Z

    move-result p1

    if-nez p1, :cond_0

    const-string p1, "onDismissScreen must be called on the main UI thread."

    invoke-static {p1}, Lcom/google/android/gms/internal/gs;->W(Ljava/lang/String;)V

    sget-object p1, Lcom/google/android/gms/internal/gr;->wC:Landroid/os/Handler;

    new-instance v0, Lcom/google/android/gms/internal/da$4;

    invoke-direct {v0, p0}, Lcom/google/android/gms/internal/da$4;-><init>(Lcom/google/android/gms/internal/da;)V

    invoke-virtual {p1, v0}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    return-void

    :cond_0
    :try_start_0
    iget-object p0, p0, Lcom/google/android/gms/internal/da;->qF:Lcom/google/android/gms/internal/cv;

    invoke-interface {p0}, Lcom/google/android/gms/internal/cv;->onAdClosed()V
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception p0

    const-string p1, "Could not call onAdClosed."

    invoke-static {p1, p0}, Lcom/google/android/gms/internal/gs;->d(Ljava/lang/String;Ljava/lang/Throwable;)V

    :goto_0
    return-void
.end method

.method public onDismissScreen(Lcom/google/ads/mediation/MediationInterstitialAdapter;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/google/ads/mediation/MediationInterstitialAdapter<",
            "**>;)V"
        }
    .end annotation

    const-string p1, "Adapter called onDismissScreen."

    invoke-static {p1}, Lcom/google/android/gms/internal/gs;->S(Ljava/lang/String;)V

    invoke-static {}, Lcom/google/android/gms/internal/gr;->ds()Z

    move-result p1

    if-nez p1, :cond_0

    const-string p1, "onDismissScreen must be called on the main UI thread."

    invoke-static {p1}, Lcom/google/android/gms/internal/gs;->W(Ljava/lang/String;)V

    sget-object p1, Lcom/google/android/gms/internal/gr;->wC:Landroid/os/Handler;

    new-instance v0, Lcom/google/android/gms/internal/da$9;

    invoke-direct {v0, p0}, Lcom/google/android/gms/internal/da$9;-><init>(Lcom/google/android/gms/internal/da;)V

    invoke-virtual {p1, v0}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    return-void

    :cond_0
    :try_start_0
    iget-object p0, p0, Lcom/google/android/gms/internal/da;->qF:Lcom/google/android/gms/internal/cv;

    invoke-interface {p0}, Lcom/google/android/gms/internal/cv;->onAdClosed()V
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception p0

    const-string p1, "Could not call onAdClosed."

    invoke-static {p1, p0}, Lcom/google/android/gms/internal/gs;->d(Ljava/lang/String;Ljava/lang/Throwable;)V

    :goto_0
    return-void
.end method

.method public onFailedToReceiveAd(Lcom/google/ads/mediation/MediationBannerAdapter;Lcom/google/ads/AdRequest$ErrorCode;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/google/ads/mediation/MediationBannerAdapter<",
            "**>;",
            "Lcom/google/ads/AdRequest$ErrorCode;",
            ")V"
        }
    .end annotation

    new-instance p1, Ljava/lang/StringBuilder;

    const-string v0, "Adapter called onFailedToReceiveAd with error. "

    invoke-direct {p1, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {p1}, Lcom/google/android/gms/internal/gs;->S(Ljava/lang/String;)V

    invoke-static {}, Lcom/google/android/gms/internal/gr;->ds()Z

    move-result p1

    if-nez p1, :cond_0

    const-string p1, "onFailedToReceiveAd must be called on the main UI thread."

    invoke-static {p1}, Lcom/google/android/gms/internal/gs;->W(Ljava/lang/String;)V

    sget-object p1, Lcom/google/android/gms/internal/gr;->wC:Landroid/os/Handler;

    new-instance v0, Lcom/google/android/gms/internal/da$5;

    invoke-direct {v0, p0, p2}, Lcom/google/android/gms/internal/da$5;-><init>(Lcom/google/android/gms/internal/da;Lcom/google/ads/AdRequest$ErrorCode;)V

    invoke-virtual {p1, v0}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    return-void

    :cond_0
    :try_start_0
    iget-object p0, p0, Lcom/google/android/gms/internal/da;->qF:Lcom/google/android/gms/internal/cv;

    invoke-static {p2}, Lcom/google/android/gms/internal/db;->a(Lcom/google/ads/AdRequest$ErrorCode;)I

    move-result p1

    invoke-interface {p0, p1}, Lcom/google/android/gms/internal/cv;->onAdFailedToLoad(I)V
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception p0

    const-string p1, "Could not call onAdFailedToLoad."

    invoke-static {p1, p0}, Lcom/google/android/gms/internal/gs;->d(Ljava/lang/String;Ljava/lang/Throwable;)V

    :goto_0
    return-void
.end method

.method public onFailedToReceiveAd(Lcom/google/ads/mediation/MediationInterstitialAdapter;Lcom/google/ads/AdRequest$ErrorCode;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/google/ads/mediation/MediationInterstitialAdapter<",
            "**>;",
            "Lcom/google/ads/AdRequest$ErrorCode;",
            ")V"
        }
    .end annotation

    new-instance p1, Ljava/lang/StringBuilder;

    const-string v0, "Adapter called onFailedToReceiveAd with error "

    invoke-direct {p1, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object p1

    const-string v0, "."

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {p1}, Lcom/google/android/gms/internal/gs;->S(Ljava/lang/String;)V

    invoke-static {}, Lcom/google/android/gms/internal/gr;->ds()Z

    move-result p1

    if-nez p1, :cond_0

    const-string p1, "onFailedToReceiveAd must be called on the main UI thread."

    invoke-static {p1}, Lcom/google/android/gms/internal/gs;->W(Ljava/lang/String;)V

    sget-object p1, Lcom/google/android/gms/internal/gr;->wC:Landroid/os/Handler;

    new-instance v0, Lcom/google/android/gms/internal/da$10;

    invoke-direct {v0, p0, p2}, Lcom/google/android/gms/internal/da$10;-><init>(Lcom/google/android/gms/internal/da;Lcom/google/ads/AdRequest$ErrorCode;)V

    invoke-virtual {p1, v0}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    return-void

    :cond_0
    :try_start_0
    iget-object p0, p0, Lcom/google/android/gms/internal/da;->qF:Lcom/google/android/gms/internal/cv;

    invoke-static {p2}, Lcom/google/android/gms/internal/db;->a(Lcom/google/ads/AdRequest$ErrorCode;)I

    move-result p1

    invoke-interface {p0, p1}, Lcom/google/android/gms/internal/cv;->onAdFailedToLoad(I)V
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception p0

    const-string p1, "Could not call onAdFailedToLoad."

    invoke-static {p1, p0}, Lcom/google/android/gms/internal/gs;->d(Ljava/lang/String;Ljava/lang/Throwable;)V

    :goto_0
    return-void
.end method

.method public onLeaveApplication(Lcom/google/ads/mediation/MediationBannerAdapter;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/google/ads/mediation/MediationBannerAdapter<",
            "**>;)V"
        }
    .end annotation

    const-string p1, "Adapter called onLeaveApplication."

    invoke-static {p1}, Lcom/google/android/gms/internal/gs;->S(Ljava/lang/String;)V

    invoke-static {}, Lcom/google/android/gms/internal/gr;->ds()Z

    move-result p1

    if-nez p1, :cond_0

    const-string p1, "onLeaveApplication must be called on the main UI thread."

    invoke-static {p1}, Lcom/google/android/gms/internal/gs;->W(Ljava/lang/String;)V

    sget-object p1, Lcom/google/android/gms/internal/gr;->wC:Landroid/os/Handler;

    new-instance v0, Lcom/google/android/gms/internal/da$6;

    invoke-direct {v0, p0}, Lcom/google/android/gms/internal/da$6;-><init>(Lcom/google/android/gms/internal/da;)V

    invoke-virtual {p1, v0}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    return-void

    :cond_0
    :try_start_0
    iget-object p0, p0, Lcom/google/android/gms/internal/da;->qF:Lcom/google/android/gms/internal/cv;

    invoke-interface {p0}, Lcom/google/android/gms/internal/cv;->onAdLeftApplication()V
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception p0

    const-string p1, "Could not call onAdLeftApplication."

    invoke-static {p1, p0}, Lcom/google/android/gms/internal/gs;->d(Ljava/lang/String;Ljava/lang/Throwable;)V

    :goto_0
    return-void
.end method

.method public onLeaveApplication(Lcom/google/ads/mediation/MediationInterstitialAdapter;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/google/ads/mediation/MediationInterstitialAdapter<",
            "**>;)V"
        }
    .end annotation

    const-string p1, "Adapter called onLeaveApplication."

    invoke-static {p1}, Lcom/google/android/gms/internal/gs;->S(Ljava/lang/String;)V

    invoke-static {}, Lcom/google/android/gms/internal/gr;->ds()Z

    move-result p1

    if-nez p1, :cond_0

    const-string p1, "onLeaveApplication must be called on the main UI thread."

    invoke-static {p1}, Lcom/google/android/gms/internal/gs;->W(Ljava/lang/String;)V

    sget-object p1, Lcom/google/android/gms/internal/gr;->wC:Landroid/os/Handler;

    new-instance v0, Lcom/google/android/gms/internal/da$11;

    invoke-direct {v0, p0}, Lcom/google/android/gms/internal/da$11;-><init>(Lcom/google/android/gms/internal/da;)V

    invoke-virtual {p1, v0}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    return-void

    :cond_0
    :try_start_0
    iget-object p0, p0, Lcom/google/android/gms/internal/da;->qF:Lcom/google/android/gms/internal/cv;

    invoke-interface {p0}, Lcom/google/android/gms/internal/cv;->onAdLeftApplication()V
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception p0

    const-string p1, "Could not call onAdLeftApplication."

    invoke-static {p1, p0}, Lcom/google/android/gms/internal/gs;->d(Ljava/lang/String;Ljava/lang/Throwable;)V

    :goto_0
    return-void
.end method

.method public onPresentScreen(Lcom/google/ads/mediation/MediationBannerAdapter;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/google/ads/mediation/MediationBannerAdapter<",
            "**>;)V"
        }
    .end annotation

    const-string p1, "Adapter called onPresentScreen."

    invoke-static {p1}, Lcom/google/android/gms/internal/gs;->S(Ljava/lang/String;)V

    invoke-static {}, Lcom/google/android/gms/internal/gr;->ds()Z

    move-result p1

    if-nez p1, :cond_0

    const-string p1, "onPresentScreen must be called on the main UI thread."

    invoke-static {p1}, Lcom/google/android/gms/internal/gs;->W(Ljava/lang/String;)V

    sget-object p1, Lcom/google/android/gms/internal/gr;->wC:Landroid/os/Handler;

    new-instance v0, Lcom/google/android/gms/internal/da$7;

    invoke-direct {v0, p0}, Lcom/google/android/gms/internal/da$7;-><init>(Lcom/google/android/gms/internal/da;)V

    invoke-virtual {p1, v0}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    return-void

    :cond_0
    :try_start_0
    iget-object p0, p0, Lcom/google/android/gms/internal/da;->qF:Lcom/google/android/gms/internal/cv;

    invoke-interface {p0}, Lcom/google/android/gms/internal/cv;->onAdOpened()V
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception p0

    const-string p1, "Could not call onAdOpened."

    invoke-static {p1, p0}, Lcom/google/android/gms/internal/gs;->d(Ljava/lang/String;Ljava/lang/Throwable;)V

    :goto_0
    return-void
.end method

.method public onPresentScreen(Lcom/google/ads/mediation/MediationInterstitialAdapter;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/google/ads/mediation/MediationInterstitialAdapter<",
            "**>;)V"
        }
    .end annotation

    const-string p1, "Adapter called onPresentScreen."

    invoke-static {p1}, Lcom/google/android/gms/internal/gs;->S(Ljava/lang/String;)V

    invoke-static {}, Lcom/google/android/gms/internal/gr;->ds()Z

    move-result p1

    if-nez p1, :cond_0

    const-string p1, "onPresentScreen must be called on the main UI thread."

    invoke-static {p1}, Lcom/google/android/gms/internal/gs;->W(Ljava/lang/String;)V

    sget-object p1, Lcom/google/android/gms/internal/gr;->wC:Landroid/os/Handler;

    new-instance v0, Lcom/google/android/gms/internal/da$2;

    invoke-direct {v0, p0}, Lcom/google/android/gms/internal/da$2;-><init>(Lcom/google/android/gms/internal/da;)V

    invoke-virtual {p1, v0}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    return-void

    :cond_0
    :try_start_0
    iget-object p0, p0, Lcom/google/android/gms/internal/da;->qF:Lcom/google/android/gms/internal/cv;

    invoke-interface {p0}, Lcom/google/android/gms/internal/cv;->onAdOpened()V
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception p0

    const-string p1, "Could not call onAdOpened."

    invoke-static {p1, p0}, Lcom/google/android/gms/internal/gs;->d(Ljava/lang/String;Ljava/lang/Throwable;)V

    :goto_0
    return-void
.end method

.method public onReceivedAd(Lcom/google/ads/mediation/MediationBannerAdapter;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/google/ads/mediation/MediationBannerAdapter<",
            "**>;)V"
        }
    .end annotation

    const-string p1, "Adapter called onReceivedAd."

    invoke-static {p1}, Lcom/google/android/gms/internal/gs;->S(Ljava/lang/String;)V

    invoke-static {}, Lcom/google/android/gms/internal/gr;->ds()Z

    move-result p1

    if-nez p1, :cond_0

    const-string p1, "onReceivedAd must be called on the main UI thread."

    invoke-static {p1}, Lcom/google/android/gms/internal/gs;->W(Ljava/lang/String;)V

    sget-object p1, Lcom/google/android/gms/internal/gr;->wC:Landroid/os/Handler;

    new-instance v0, Lcom/google/android/gms/internal/da$8;

    invoke-direct {v0, p0}, Lcom/google/android/gms/internal/da$8;-><init>(Lcom/google/android/gms/internal/da;)V

    invoke-virtual {p1, v0}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    return-void

    :cond_0
    :try_start_0
    iget-object p0, p0, Lcom/google/android/gms/internal/da;->qF:Lcom/google/android/gms/internal/cv;

    invoke-interface {p0}, Lcom/google/android/gms/internal/cv;->onAdLoaded()V
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception p0

    const-string p1, "Could not call onAdLoaded."

    invoke-static {p1, p0}, Lcom/google/android/gms/internal/gs;->d(Ljava/lang/String;Ljava/lang/Throwable;)V

    :goto_0
    return-void
.end method

.method public onReceivedAd(Lcom/google/ads/mediation/MediationInterstitialAdapter;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/google/ads/mediation/MediationInterstitialAdapter<",
            "**>;)V"
        }
    .end annotation

    const-string p1, "Adapter called onReceivedAd."

    invoke-static {p1}, Lcom/google/android/gms/internal/gs;->S(Ljava/lang/String;)V

    invoke-static {}, Lcom/google/android/gms/internal/gr;->ds()Z

    move-result p1

    if-nez p1, :cond_0

    const-string p1, "onReceivedAd must be called on the main UI thread."

    invoke-static {p1}, Lcom/google/android/gms/internal/gs;->W(Ljava/lang/String;)V

    sget-object p1, Lcom/google/android/gms/internal/gr;->wC:Landroid/os/Handler;

    new-instance v0, Lcom/google/android/gms/internal/da$3;

    invoke-direct {v0, p0}, Lcom/google/android/gms/internal/da$3;-><init>(Lcom/google/android/gms/internal/da;)V

    invoke-virtual {p1, v0}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    return-void

    :cond_0
    :try_start_0
    iget-object p0, p0, Lcom/google/android/gms/internal/da;->qF:Lcom/google/android/gms/internal/cv;

    invoke-interface {p0}, Lcom/google/android/gms/internal/cv;->onAdLoaded()V
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception p0

    const-string p1, "Could not call onAdLoaded."

    invoke-static {p1, p0}, Lcom/google/android/gms/internal/gs;->d(Ljava/lang/String;Ljava/lang/Throwable;)V

    :goto_0
    return-void
.end method
