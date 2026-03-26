.class public Lcom/google/android/gms/internal/eo;
.super Ljava/lang/Object;

# interfaces
.implements Lcom/google/android/gms/ads/purchase/InAppPurchaseResult;


# annotations
.annotation runtime Lcom/google/android/gms/internal/ez;
.end annotation


# instance fields
.field private final sL:Lcom/google/android/gms/internal/ek;


# direct methods
.method public constructor <init>(Lcom/google/android/gms/internal/ek;)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/google/android/gms/internal/eo;->sL:Lcom/google/android/gms/internal/ek;

    return-void
.end method


# virtual methods
.method public finishPurchase()V
    .locals 1

    :try_start_0
    iget-object p0, p0, Lcom/google/android/gms/internal/eo;->sL:Lcom/google/android/gms/internal/ek;

    invoke-interface {p0}, Lcom/google/android/gms/internal/ek;->finishPurchase()V
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception p0

    const-string v0, "Could not forward finishPurchase to InAppPurchaseResult"

    invoke-static {v0, p0}, Lcom/google/android/gms/internal/gs;->d(Ljava/lang/String;Ljava/lang/Throwable;)V

    :goto_0
    return-void
.end method

.method public getProductId()Ljava/lang/String;
    .locals 1

    :try_start_0
    iget-object p0, p0, Lcom/google/android/gms/internal/eo;->sL:Lcom/google/android/gms/internal/ek;

    invoke-interface {p0}, Lcom/google/android/gms/internal/ek;->getProductId()Ljava/lang/String;

    move-result-object p0
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    return-object p0

    :catch_0
    move-exception p0

    const-string v0, "Could not forward getProductId to InAppPurchaseResult"

    invoke-static {v0, p0}, Lcom/google/android/gms/internal/gs;->d(Ljava/lang/String;Ljava/lang/Throwable;)V

    const/4 p0, 0x0

    return-object p0
.end method

.method public getPurchaseData()Landroid/content/Intent;
    .locals 1

    :try_start_0
    iget-object p0, p0, Lcom/google/android/gms/internal/eo;->sL:Lcom/google/android/gms/internal/ek;

    invoke-interface {p0}, Lcom/google/android/gms/internal/ek;->getPurchaseData()Landroid/content/Intent;

    move-result-object p0
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    return-object p0

    :catch_0
    move-exception p0

    const-string v0, "Could not forward getPurchaseData to InAppPurchaseResult"

    invoke-static {v0, p0}, Lcom/google/android/gms/internal/gs;->d(Ljava/lang/String;Ljava/lang/Throwable;)V

    const/4 p0, 0x0

    return-object p0
.end method

.method public getResultCode()I
    .locals 1

    :try_start_0
    iget-object p0, p0, Lcom/google/android/gms/internal/eo;->sL:Lcom/google/android/gms/internal/ek;

    invoke-interface {p0}, Lcom/google/android/gms/internal/ek;->getResultCode()I

    move-result p0
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    return p0

    :catch_0
    move-exception p0

    const-string v0, "Could not forward getPurchaseData to InAppPurchaseResult"

    invoke-static {v0, p0}, Lcom/google/android/gms/internal/gs;->d(Ljava/lang/String;Ljava/lang/Throwable;)V

    const/4 p0, 0x0

    return p0
.end method

.method public isVerified()Z
    .locals 1

    :try_start_0
    iget-object p0, p0, Lcom/google/android/gms/internal/eo;->sL:Lcom/google/android/gms/internal/ek;

    invoke-interface {p0}, Lcom/google/android/gms/internal/ek;->isVerified()Z

    move-result p0
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    return p0

    :catch_0
    move-exception p0

    const-string v0, "Could not forward isVerified to InAppPurchaseResult"

    invoke-static {v0, p0}, Lcom/google/android/gms/internal/gs;->d(Ljava/lang/String;Ljava/lang/Throwable;)V

    const/4 p0, 0x0

    return p0
.end method
