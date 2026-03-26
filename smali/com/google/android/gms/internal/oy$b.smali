.class final Lcom/google/android/gms/internal/oy$b;
.super Lcom/google/android/gms/internal/oy$a;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/google/android/gms/internal/oy;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x10
    name = "b"
.end annotation


# instance fields
.field private final Lu:I

.field final synthetic auw:Lcom/google/android/gms/internal/oy;


# direct methods
.method public constructor <init>(Lcom/google/android/gms/internal/oy;I)V
    .locals 0

    iput-object p1, p0, Lcom/google/android/gms/internal/oy$b;->auw:Lcom/google/android/gms/internal/oy;

    const/4 p1, 0x0

    invoke-direct {p0, p1}, Lcom/google/android/gms/internal/oy$a;-><init>(Lcom/google/android/gms/internal/oy$1;)V

    iput p2, p0, Lcom/google/android/gms/internal/oy$b;->Lu:I

    return-void
.end method


# virtual methods
.method public a(ILcom/google/android/gms/wallet/FullWallet;Landroid/os/Bundle;)V
    .locals 2

    if-eqz p3, :cond_0

    const-string v0, "com.google.android.gms.wallet.EXTRA_PENDING_INTENT"

    invoke-virtual {p3, v0}, Landroid/os/Bundle;->getParcelable(Ljava/lang/String;)Landroid/os/Parcelable;

    move-result-object p3

    check-cast p3, Landroid/app/PendingIntent;

    goto :goto_0

    :cond_0
    const/4 p3, 0x0

    :goto_0
    new-instance v0, Lcom/google/android/gms/common/ConnectionResult;

    invoke-direct {v0, p1, p3}, Lcom/google/android/gms/common/ConnectionResult;-><init>(ILandroid/app/PendingIntent;)V

    invoke-virtual {v0}, Lcom/google/android/gms/common/ConnectionResult;->hasResolution()Z

    move-result p3

    const-string v1, "WalletClientImpl"

    if-eqz p3, :cond_1

    :try_start_0
    iget-object p1, p0, Lcom/google/android/gms/internal/oy$b;->auw:Lcom/google/android/gms/internal/oy;

    invoke-static {p1}, Lcom/google/android/gms/internal/oy;->b(Lcom/google/android/gms/internal/oy;)Landroid/app/Activity;

    move-result-object p1

    iget p0, p0, Lcom/google/android/gms/internal/oy$b;->Lu:I

    invoke-virtual {v0, p1, p0}, Lcom/google/android/gms/common/ConnectionResult;->startResolutionForResult(Landroid/app/Activity;I)V
    :try_end_0
    .catch Landroid/content/IntentSender$SendIntentException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_4

    :catch_0
    move-exception p0

    const-string p1, "Exception starting pending intent"

    :goto_1
    invoke-static {v1, p1, p0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto :goto_4

    :cond_1
    new-instance p3, Landroid/content/Intent;

    invoke-direct {p3}, Landroid/content/Intent;-><init>()V

    invoke-virtual {v0}, Lcom/google/android/gms/common/ConnectionResult;->isSuccess()Z

    move-result v0

    if-eqz v0, :cond_2

    const-string p1, "com.google.android.gms.wallet.EXTRA_FULL_WALLET"

    invoke-virtual {p3, p1, p2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Landroid/os/Parcelable;)Landroid/content/Intent;

    const/4 p1, -0x1

    goto :goto_3

    :cond_2
    const/16 p2, 0x198

    if-ne p1, p2, :cond_3

    const/4 p2, 0x0

    goto :goto_2

    :cond_3
    const/4 p2, 0x1

    :goto_2
    const-string v0, "com.google.android.gms.wallet.EXTRA_ERROR_CODE"

    invoke-virtual {p3, v0, p1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    move p1, p2

    :goto_3
    iget-object p2, p0, Lcom/google/android/gms/internal/oy$b;->auw:Lcom/google/android/gms/internal/oy;

    invoke-static {p2}, Lcom/google/android/gms/internal/oy;->b(Lcom/google/android/gms/internal/oy;)Landroid/app/Activity;

    move-result-object p2

    iget p0, p0, Lcom/google/android/gms/internal/oy$b;->Lu:I

    const/high16 v0, 0x40000000    # 2.0f

    invoke-virtual {p2, p0, p3, v0}, Landroid/app/Activity;->createPendingResult(ILandroid/content/Intent;I)Landroid/app/PendingIntent;

    move-result-object p0

    if-nez p0, :cond_4

    const-string p0, "Null pending result returned for onFullWalletLoaded"

    invoke-static {v1, p0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    return-void

    :cond_4
    :try_start_1
    invoke-virtual {p0, p1}, Landroid/app/PendingIntent;->send(I)V
    :try_end_1
    .catch Landroid/app/PendingIntent$CanceledException; {:try_start_1 .. :try_end_1} :catch_1

    goto :goto_4

    :catch_1
    move-exception p0

    const-string p1, "Exception setting pending result"

    goto :goto_1

    :goto_4
    return-void
.end method

.method public a(ILcom/google/android/gms/wallet/MaskedWallet;Landroid/os/Bundle;)V
    .locals 2

    if-eqz p3, :cond_0

    const-string v0, "com.google.android.gms.wallet.EXTRA_PENDING_INTENT"

    invoke-virtual {p3, v0}, Landroid/os/Bundle;->getParcelable(Ljava/lang/String;)Landroid/os/Parcelable;

    move-result-object p3

    check-cast p3, Landroid/app/PendingIntent;

    goto :goto_0

    :cond_0
    const/4 p3, 0x0

    :goto_0
    new-instance v0, Lcom/google/android/gms/common/ConnectionResult;

    invoke-direct {v0, p1, p3}, Lcom/google/android/gms/common/ConnectionResult;-><init>(ILandroid/app/PendingIntent;)V

    invoke-virtual {v0}, Lcom/google/android/gms/common/ConnectionResult;->hasResolution()Z

    move-result p3

    const-string v1, "WalletClientImpl"

    if-eqz p3, :cond_1

    :try_start_0
    iget-object p1, p0, Lcom/google/android/gms/internal/oy$b;->auw:Lcom/google/android/gms/internal/oy;

    invoke-static {p1}, Lcom/google/android/gms/internal/oy;->b(Lcom/google/android/gms/internal/oy;)Landroid/app/Activity;

    move-result-object p1

    iget p0, p0, Lcom/google/android/gms/internal/oy$b;->Lu:I

    invoke-virtual {v0, p1, p0}, Lcom/google/android/gms/common/ConnectionResult;->startResolutionForResult(Landroid/app/Activity;I)V
    :try_end_0
    .catch Landroid/content/IntentSender$SendIntentException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_4

    :catch_0
    move-exception p0

    const-string p1, "Exception starting pending intent"

    :goto_1
    invoke-static {v1, p1, p0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto :goto_4

    :cond_1
    new-instance p3, Landroid/content/Intent;

    invoke-direct {p3}, Landroid/content/Intent;-><init>()V

    invoke-virtual {v0}, Lcom/google/android/gms/common/ConnectionResult;->isSuccess()Z

    move-result v0

    if-eqz v0, :cond_2

    const-string p1, "com.google.android.gms.wallet.EXTRA_MASKED_WALLET"

    invoke-virtual {p3, p1, p2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Landroid/os/Parcelable;)Landroid/content/Intent;

    const/4 p1, -0x1

    goto :goto_3

    :cond_2
    const/16 p2, 0x198

    if-ne p1, p2, :cond_3

    const/4 p2, 0x0

    goto :goto_2

    :cond_3
    const/4 p2, 0x1

    :goto_2
    const-string v0, "com.google.android.gms.wallet.EXTRA_ERROR_CODE"

    invoke-virtual {p3, v0, p1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    move p1, p2

    :goto_3
    iget-object p2, p0, Lcom/google/android/gms/internal/oy$b;->auw:Lcom/google/android/gms/internal/oy;

    invoke-static {p2}, Lcom/google/android/gms/internal/oy;->b(Lcom/google/android/gms/internal/oy;)Landroid/app/Activity;

    move-result-object p2

    iget p0, p0, Lcom/google/android/gms/internal/oy$b;->Lu:I

    const/high16 v0, 0x40000000    # 2.0f

    invoke-virtual {p2, p0, p3, v0}, Landroid/app/Activity;->createPendingResult(ILandroid/content/Intent;I)Landroid/app/PendingIntent;

    move-result-object p0

    if-nez p0, :cond_4

    const-string p0, "Null pending result returned for onMaskedWalletLoaded"

    invoke-static {v1, p0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    return-void

    :cond_4
    :try_start_1
    invoke-virtual {p0, p1}, Landroid/app/PendingIntent;->send(I)V
    :try_end_1
    .catch Landroid/app/PendingIntent$CanceledException; {:try_start_1 .. :try_end_1} :catch_1

    goto :goto_4

    :catch_1
    move-exception p0

    const-string p1, "Exception setting pending result"

    goto :goto_1

    :goto_4
    return-void
.end method

.method public a(IZLandroid/os/Bundle;)V
    .locals 0

    new-instance p1, Landroid/content/Intent;

    invoke-direct {p1}, Landroid/content/Intent;-><init>()V

    const-string p3, "com.google.android.gm.wallet.EXTRA_IS_USER_PREAUTHORIZED"

    invoke-virtual {p1, p3, p2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Z)Landroid/content/Intent;

    iget-object p2, p0, Lcom/google/android/gms/internal/oy$b;->auw:Lcom/google/android/gms/internal/oy;

    invoke-static {p2}, Lcom/google/android/gms/internal/oy;->b(Lcom/google/android/gms/internal/oy;)Landroid/app/Activity;

    move-result-object p2

    iget p0, p0, Lcom/google/android/gms/internal/oy$b;->Lu:I

    const/high16 p3, 0x40000000    # 2.0f

    invoke-virtual {p2, p0, p1, p3}, Landroid/app/Activity;->createPendingResult(ILandroid/content/Intent;I)Landroid/app/PendingIntent;

    move-result-object p0

    const-string p1, "WalletClientImpl"

    if-nez p0, :cond_0

    const-string p0, "Null pending result returned for onPreAuthorizationDetermined"

    invoke-static {p1, p0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    return-void

    :cond_0
    const/4 p2, -0x1

    :try_start_0
    invoke-virtual {p0, p2}, Landroid/app/PendingIntent;->send(I)V
    :try_end_0
    .catch Landroid/app/PendingIntent$CanceledException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception p0

    const-string p2, "Exception setting pending result"

    invoke-static {p1, p2, p0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    :goto_0
    return-void
.end method

.method public i(ILandroid/os/Bundle;)V
    .locals 2

    const-string v0, "Bundle should not be null"

    invoke-static {p2, v0}, Lcom/google/android/gms/common/internal/o;->b(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string v0, "com.google.android.gms.wallet.EXTRA_PENDING_INTENT"

    invoke-virtual {p2, v0}, Landroid/os/Bundle;->getParcelable(Ljava/lang/String;)Landroid/os/Parcelable;

    move-result-object p2

    check-cast p2, Landroid/app/PendingIntent;

    new-instance v0, Lcom/google/android/gms/common/ConnectionResult;

    invoke-direct {v0, p1, p2}, Lcom/google/android/gms/common/ConnectionResult;-><init>(ILandroid/app/PendingIntent;)V

    invoke-virtual {v0}, Lcom/google/android/gms/common/ConnectionResult;->hasResolution()Z

    move-result p1

    const-string p2, "WalletClientImpl"

    if-eqz p1, :cond_0

    :try_start_0
    iget-object p1, p0, Lcom/google/android/gms/internal/oy$b;->auw:Lcom/google/android/gms/internal/oy;

    invoke-static {p1}, Lcom/google/android/gms/internal/oy;->b(Lcom/google/android/gms/internal/oy;)Landroid/app/Activity;

    move-result-object p1

    iget p0, p0, Lcom/google/android/gms/internal/oy$b;->Lu:I

    invoke-virtual {v0, p1, p0}, Lcom/google/android/gms/common/ConnectionResult;->startResolutionForResult(Landroid/app/Activity;I)V
    :try_end_0
    .catch Landroid/content/IntentSender$SendIntentException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_1

    :catch_0
    move-exception p0

    const-string p1, "Exception starting pending intent"

    :goto_0
    invoke-static {p2, p1, p0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto :goto_1

    :cond_0
    new-instance p1, Ljava/lang/StringBuilder;

    const-string v1, "Create Wallet Objects confirmation UI will not be shown connection result: "

    invoke-direct {p1, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {p2, p1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    new-instance p1, Landroid/content/Intent;

    invoke-direct {p1}, Landroid/content/Intent;-><init>()V

    const-string v0, "com.google.android.gms.wallet.EXTRA_ERROR_CODE"

    const/16 v1, 0x19d

    invoke-virtual {p1, v0, v1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    iget-object v0, p0, Lcom/google/android/gms/internal/oy$b;->auw:Lcom/google/android/gms/internal/oy;

    invoke-static {v0}, Lcom/google/android/gms/internal/oy;->b(Lcom/google/android/gms/internal/oy;)Landroid/app/Activity;

    move-result-object v0

    iget p0, p0, Lcom/google/android/gms/internal/oy$b;->Lu:I

    const/high16 v1, 0x40000000    # 2.0f

    invoke-virtual {v0, p0, p1, v1}, Landroid/app/Activity;->createPendingResult(ILandroid/content/Intent;I)Landroid/app/PendingIntent;

    move-result-object p0

    if-nez p0, :cond_1

    const-string p0, "Null pending result returned for onWalletObjectsCreated"

    invoke-static {p2, p0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    return-void

    :cond_1
    const/4 p1, 0x1

    :try_start_1
    invoke-virtual {p0, p1}, Landroid/app/PendingIntent;->send(I)V
    :try_end_1
    .catch Landroid/app/PendingIntent$CanceledException; {:try_start_1 .. :try_end_1} :catch_1

    goto :goto_1

    :catch_1
    move-exception p0

    const-string p1, "Exception setting pending result"

    goto :goto_0

    :goto_1
    return-void
.end method
