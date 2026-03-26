.class public final Lcom/google/android/gms/internal/eb;
.super Lcom/google/android/gms/internal/ek$a;

# interfaces
.implements Landroid/content/ServiceConnection;


# annotations
.annotation runtime Lcom/google/android/gms/internal/ez;
.end annotation


# instance fields
.field private mContext:Landroid/content/Context;

.field private sD:Z

.field private sE:I

.field private sF:Landroid/content/Intent;

.field private sn:Lcom/google/android/gms/internal/dw;

.field private su:Ljava/lang/String;

.field private sy:Lcom/google/android/gms/internal/ea;


# direct methods
.method public constructor <init>(Landroid/content/Context;Ljava/lang/String;ZILandroid/content/Intent;Lcom/google/android/gms/internal/ea;)V
    .locals 0

    invoke-direct {p0}, Lcom/google/android/gms/internal/ek$a;-><init>()V

    iput-object p2, p0, Lcom/google/android/gms/internal/eb;->su:Ljava/lang/String;

    iput p4, p0, Lcom/google/android/gms/internal/eb;->sE:I

    iput-object p5, p0, Lcom/google/android/gms/internal/eb;->sF:Landroid/content/Intent;

    iput-boolean p3, p0, Lcom/google/android/gms/internal/eb;->sD:Z

    iput-object p1, p0, Lcom/google/android/gms/internal/eb;->mContext:Landroid/content/Context;

    iput-object p6, p0, Lcom/google/android/gms/internal/eb;->sy:Lcom/google/android/gms/internal/ea;

    return-void
.end method


# virtual methods
.method public finishPurchase()V
    .locals 3

    iget-object v0, p0, Lcom/google/android/gms/internal/eb;->sF:Landroid/content/Intent;

    invoke-static {v0}, Lcom/google/android/gms/internal/ed;->d(Landroid/content/Intent;)I

    move-result v0

    iget v1, p0, Lcom/google/android/gms/internal/eb;->sE:I

    const/4 v2, -0x1

    if-ne v1, v2, :cond_1

    if-eqz v0, :cond_0

    goto :goto_0

    :cond_0
    new-instance v0, Lcom/google/android/gms/internal/dw;

    iget-object v1, p0, Lcom/google/android/gms/internal/eb;->mContext:Landroid/content/Context;

    invoke-direct {v0, v1}, Lcom/google/android/gms/internal/dw;-><init>(Landroid/content/Context;)V

    iput-object v0, p0, Lcom/google/android/gms/internal/eb;->sn:Lcom/google/android/gms/internal/dw;

    iget-object v0, p0, Lcom/google/android/gms/internal/eb;->mContext:Landroid/content/Context;

    new-instance v1, Landroid/content/Intent;

    const-string v2, "com.android.vending.billing.InAppBillingService.BIND"

    invoke-direct {v1, v2}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    const/4 v2, 0x1

    invoke-virtual {v0, v1, p0, v2}, Landroid/content/Context;->bindService(Landroid/content/Intent;Landroid/content/ServiceConnection;I)Z

    :cond_1
    :goto_0
    return-void
.end method

.method public getProductId()Ljava/lang/String;
    .locals 0

    iget-object p0, p0, Lcom/google/android/gms/internal/eb;->su:Ljava/lang/String;

    return-object p0
.end method

.method public getPurchaseData()Landroid/content/Intent;
    .locals 0

    iget-object p0, p0, Lcom/google/android/gms/internal/eb;->sF:Landroid/content/Intent;

    return-object p0
.end method

.method public getResultCode()I
    .locals 0

    iget p0, p0, Lcom/google/android/gms/internal/eb;->sE:I

    return p0
.end method

.method public isVerified()Z
    .locals 0

    iget-boolean p0, p0, Lcom/google/android/gms/internal/eb;->sD:Z

    return p0
.end method

.method public onServiceConnected(Landroid/content/ComponentName;Landroid/os/IBinder;)V
    .locals 1

    const-string p1, "In-app billing service connected."

    invoke-static {p1}, Lcom/google/android/gms/internal/gs;->U(Ljava/lang/String;)V

    iget-object p1, p0, Lcom/google/android/gms/internal/eb;->sn:Lcom/google/android/gms/internal/dw;

    invoke-virtual {p1, p2}, Lcom/google/android/gms/internal/dw;->r(Landroid/os/IBinder;)V

    iget-object p1, p0, Lcom/google/android/gms/internal/eb;->sF:Landroid/content/Intent;

    invoke-static {p1}, Lcom/google/android/gms/internal/ed;->e(Landroid/content/Intent;)Ljava/lang/String;

    move-result-object p1

    invoke-static {p1}, Lcom/google/android/gms/internal/ed;->E(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    if-nez p1, :cond_0

    return-void

    :cond_0
    iget-object p2, p0, Lcom/google/android/gms/internal/eb;->sn:Lcom/google/android/gms/internal/dw;

    iget-object v0, p0, Lcom/google/android/gms/internal/eb;->mContext:Landroid/content/Context;

    invoke-virtual {v0}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p2, v0, p1}, Lcom/google/android/gms/internal/dw;->c(Ljava/lang/String;Ljava/lang/String;)I

    move-result p1

    if-nez p1, :cond_1

    iget-object p1, p0, Lcom/google/android/gms/internal/eb;->mContext:Landroid/content/Context;

    invoke-static {p1}, Lcom/google/android/gms/internal/ec;->j(Landroid/content/Context;)Lcom/google/android/gms/internal/ec;

    move-result-object p1

    iget-object p2, p0, Lcom/google/android/gms/internal/eb;->sy:Lcom/google/android/gms/internal/ea;

    invoke-virtual {p1, p2}, Lcom/google/android/gms/internal/ec;->a(Lcom/google/android/gms/internal/ea;)V

    :cond_1
    iget-object p1, p0, Lcom/google/android/gms/internal/eb;->mContext:Landroid/content/Context;

    invoke-virtual {p1, p0}, Landroid/content/Context;->unbindService(Landroid/content/ServiceConnection;)V

    iget-object p0, p0, Lcom/google/android/gms/internal/eb;->sn:Lcom/google/android/gms/internal/dw;

    invoke-virtual {p0}, Lcom/google/android/gms/internal/dw;->destroy()V

    return-void
.end method

.method public onServiceDisconnected(Landroid/content/ComponentName;)V
    .locals 0

    const-string p1, "In-app billing service disconnected."

    invoke-static {p1}, Lcom/google/android/gms/internal/gs;->U(Ljava/lang/String;)V

    iget-object p0, p0, Lcom/google/android/gms/internal/eb;->sn:Lcom/google/android/gms/internal/dw;

    invoke-virtual {p0}, Lcom/google/android/gms/internal/dw;->destroy()V

    return-void
.end method
