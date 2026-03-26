.class public Lcom/google/android/gms/internal/ep;
.super Ljava/lang/Object;

# interfaces
.implements Lcom/google/android/gms/ads/purchase/InAppPurchase;


# annotations
.annotation runtime Lcom/google/android/gms/internal/ez;
.end annotation


# instance fields
.field private final sx:Lcom/google/android/gms/internal/eg;


# direct methods
.method public constructor <init>(Lcom/google/android/gms/internal/eg;)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/google/android/gms/internal/ep;->sx:Lcom/google/android/gms/internal/eg;

    return-void
.end method


# virtual methods
.method public getProductId()Ljava/lang/String;
    .locals 1

    :try_start_0
    iget-object p0, p0, Lcom/google/android/gms/internal/ep;->sx:Lcom/google/android/gms/internal/eg;

    invoke-interface {p0}, Lcom/google/android/gms/internal/eg;->getProductId()Ljava/lang/String;

    move-result-object p0
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    return-object p0

    :catch_0
    move-exception p0

    const-string v0, "Could not forward getProductId to InAppPurchase"

    invoke-static {v0, p0}, Lcom/google/android/gms/internal/gs;->d(Ljava/lang/String;Ljava/lang/Throwable;)V

    const/4 p0, 0x0

    return-object p0
.end method

.method public recordPlayBillingResolution(I)V
    .locals 0

    :try_start_0
    iget-object p0, p0, Lcom/google/android/gms/internal/ep;->sx:Lcom/google/android/gms/internal/eg;

    invoke-interface {p0, p1}, Lcom/google/android/gms/internal/eg;->recordPlayBillingResolution(I)V
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception p0

    const-string p1, "Could not forward recordPlayBillingResolution to InAppPurchase"

    invoke-static {p1, p0}, Lcom/google/android/gms/internal/gs;->d(Ljava/lang/String;Ljava/lang/Throwable;)V

    :goto_0
    return-void
.end method

.method public recordResolution(I)V
    .locals 0

    :try_start_0
    iget-object p0, p0, Lcom/google/android/gms/internal/ep;->sx:Lcom/google/android/gms/internal/eg;

    invoke-interface {p0, p1}, Lcom/google/android/gms/internal/eg;->recordResolution(I)V
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception p0

    const-string p1, "Could not forward recordResolution to InAppPurchase"

    invoke-static {p1, p0}, Lcom/google/android/gms/internal/gs;->d(Ljava/lang/String;Ljava/lang/Throwable;)V

    :goto_0
    return-void
.end method
