.class public Lcom/google/android/gms/internal/dz;
.super Lcom/google/android/gms/internal/ei$a;

# interfaces
.implements Landroid/content/ServiceConnection;


# annotations
.annotation runtime Lcom/google/android/gms/internal/ez;
.end annotation


# instance fields
.field private final nr:Landroid/app/Activity;

.field private sm:Lcom/google/android/gms/internal/el;

.field private sn:Lcom/google/android/gms/internal/dw;

.field private final so:Lcom/google/android/gms/internal/ec;

.field private sq:Lcom/google/android/gms/internal/ee;

.field private sw:Landroid/content/Context;

.field private sx:Lcom/google/android/gms/internal/eg;

.field private sy:Lcom/google/android/gms/internal/ea;

.field private sz:Ljava/lang/String;


# direct methods
.method public constructor <init>(Landroid/app/Activity;)V
    .locals 1

    invoke-direct {p0}, Lcom/google/android/gms/internal/ei$a;-><init>()V

    const/4 v0, 0x0

    iput-object v0, p0, Lcom/google/android/gms/internal/dz;->sz:Ljava/lang/String;

    iput-object p1, p0, Lcom/google/android/gms/internal/dz;->nr:Landroid/app/Activity;

    invoke-virtual {p1}, Landroid/app/Activity;->getApplicationContext()Landroid/content/Context;

    move-result-object p1

    invoke-static {p1}, Lcom/google/android/gms/internal/ec;->j(Landroid/content/Context;)Lcom/google/android/gms/internal/ec;

    move-result-object p1

    iput-object p1, p0, Lcom/google/android/gms/internal/dz;->so:Lcom/google/android/gms/internal/ec;

    return-void
.end method

.method public static a(Landroid/content/Context;ZLcom/google/android/gms/internal/dv;)V
    .locals 2

    new-instance v0, Landroid/content/Intent;

    invoke-direct {v0}, Landroid/content/Intent;-><init>()V

    const-string v1, "com.google.android.gms.ads.purchase.InAppPurchaseActivity"

    invoke-virtual {v0, p0, v1}, Landroid/content/Intent;->setClassName(Landroid/content/Context;Ljava/lang/String;)Landroid/content/Intent;

    const-string v1, "com.google.android.gms.ads.internal.purchase.useClientJar"

    invoke-virtual {v0, v1, p1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Z)Landroid/content/Intent;

    invoke-static {v0, p2}, Lcom/google/android/gms/internal/dv;->a(Landroid/content/Intent;Lcom/google/android/gms/internal/dv;)V

    invoke-virtual {p0, v0}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    return-void
.end method

.method private a(Ljava/lang/String;ZILandroid/content/Intent;)V
    .locals 9

    :try_start_0
    iget-object v0, p0, Lcom/google/android/gms/internal/dz;->sm:Lcom/google/android/gms/internal/el;

    new-instance v8, Lcom/google/android/gms/internal/eb;

    iget-object v2, p0, Lcom/google/android/gms/internal/dz;->sw:Landroid/content/Context;

    iget-object v7, p0, Lcom/google/android/gms/internal/dz;->sy:Lcom/google/android/gms/internal/ea;

    move-object v1, v8

    move-object v3, p1

    move v4, p2

    move v5, p3

    move-object v6, p4

    invoke-direct/range {v1 .. v7}, Lcom/google/android/gms/internal/eb;-><init>(Landroid/content/Context;Ljava/lang/String;ZILandroid/content/Intent;Lcom/google/android/gms/internal/ea;)V

    invoke-interface {v0, v8}, Lcom/google/android/gms/internal/el;->a(Lcom/google/android/gms/internal/ek;)V
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    const-string p0, "Fail to invoke PlayStorePurchaseListener."

    invoke-static {p0}, Lcom/google/android/gms/internal/gs;->W(Ljava/lang/String;)V

    :goto_0
    return-void
.end method


# virtual methods
.method public onActivityResult(IILandroid/content/Intent;)V
    .locals 4

    const/16 v0, 0x3e9

    if-ne p1, v0, :cond_2

    const/4 p1, 0x0

    :try_start_0
    invoke-static {p3}, Lcom/google/android/gms/internal/ed;->d(Landroid/content/Intent;)I

    move-result v0

    const/4 v1, -0x1

    const/4 v2, 0x0

    if-ne p2, v1, :cond_1

    if-nez v0, :cond_1

    iget-object v1, p0, Lcom/google/android/gms/internal/dz;->sq:Lcom/google/android/gms/internal/ee;

    iget-object v3, p0, Lcom/google/android/gms/internal/dz;->sz:Ljava/lang/String;

    invoke-virtual {v1, v3, p2, p3}, Lcom/google/android/gms/internal/ee;->a(Ljava/lang/String;ILandroid/content/Intent;)Z

    move-result v1

    if-eqz v1, :cond_0

    iget-object v1, p0, Lcom/google/android/gms/internal/dz;->sx:Lcom/google/android/gms/internal/eg;

    invoke-interface {v1}, Lcom/google/android/gms/internal/eg;->getProductId()Ljava/lang/String;

    move-result-object v1

    const/4 v2, 0x1

    invoke-direct {p0, v1, v2, p2, p3}, Lcom/google/android/gms/internal/dz;->a(Ljava/lang/String;ZILandroid/content/Intent;)V

    goto :goto_1

    :cond_0
    iget-object v1, p0, Lcom/google/android/gms/internal/dz;->sx:Lcom/google/android/gms/internal/eg;

    invoke-interface {v1}, Lcom/google/android/gms/internal/eg;->getProductId()Ljava/lang/String;

    move-result-object v1

    :goto_0
    invoke-direct {p0, v1, v2, p2, p3}, Lcom/google/android/gms/internal/dz;->a(Ljava/lang/String;ZILandroid/content/Intent;)V

    goto :goto_1

    :cond_1
    iget-object v1, p0, Lcom/google/android/gms/internal/dz;->so:Lcom/google/android/gms/internal/ec;

    iget-object v3, p0, Lcom/google/android/gms/internal/dz;->sy:Lcom/google/android/gms/internal/ea;

    invoke-virtual {v1, v3}, Lcom/google/android/gms/internal/ec;->a(Lcom/google/android/gms/internal/ea;)V

    iget-object v1, p0, Lcom/google/android/gms/internal/dz;->sx:Lcom/google/android/gms/internal/eg;

    invoke-interface {v1}, Lcom/google/android/gms/internal/eg;->getProductId()Ljava/lang/String;

    move-result-object v1

    goto :goto_0

    :goto_1
    iget-object p2, p0, Lcom/google/android/gms/internal/dz;->sx:Lcom/google/android/gms/internal/eg;

    invoke-interface {p2, v0}, Lcom/google/android/gms/internal/eg;->recordPlayBillingResolution(I)V
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    goto :goto_2

    :catchall_0
    move-exception p2

    goto :goto_3

    :catch_0
    :try_start_1
    const-string p2, "Fail to process purchase result."

    invoke-static {p2}, Lcom/google/android/gms/internal/gs;->W(Ljava/lang/String;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    :goto_2
    iput-object p1, p0, Lcom/google/android/gms/internal/dz;->sz:Ljava/lang/String;

    iget-object p0, p0, Lcom/google/android/gms/internal/dz;->nr:Landroid/app/Activity;

    invoke-virtual {p0}, Landroid/app/Activity;->finish()V

    goto :goto_4

    :goto_3
    iput-object p1, p0, Lcom/google/android/gms/internal/dz;->sz:Ljava/lang/String;

    iget-object p0, p0, Lcom/google/android/gms/internal/dz;->nr:Landroid/app/Activity;

    invoke-virtual {p0}, Landroid/app/Activity;->finish()V

    throw p2

    :cond_2
    :goto_4
    return-void
.end method

.method public onCreate()V
    .locals 3

    iget-object v0, p0, Lcom/google/android/gms/internal/dz;->nr:Landroid/app/Activity;

    invoke-virtual {v0}, Landroid/app/Activity;->getIntent()Landroid/content/Intent;

    move-result-object v0

    invoke-static {v0}, Lcom/google/android/gms/internal/dv;->c(Landroid/content/Intent;)Lcom/google/android/gms/internal/dv;

    move-result-object v0

    iget-object v1, v0, Lcom/google/android/gms/internal/dv;->lM:Lcom/google/android/gms/internal/el;

    iput-object v1, p0, Lcom/google/android/gms/internal/dz;->sm:Lcom/google/android/gms/internal/el;

    iget-object v1, v0, Lcom/google/android/gms/internal/dv;->lT:Lcom/google/android/gms/internal/ee;

    iput-object v1, p0, Lcom/google/android/gms/internal/dz;->sq:Lcom/google/android/gms/internal/ee;

    iget-object v1, v0, Lcom/google/android/gms/internal/dv;->si:Lcom/google/android/gms/internal/eg;

    iput-object v1, p0, Lcom/google/android/gms/internal/dz;->sx:Lcom/google/android/gms/internal/eg;

    new-instance v1, Lcom/google/android/gms/internal/dw;

    iget-object v2, p0, Lcom/google/android/gms/internal/dz;->nr:Landroid/app/Activity;

    invoke-virtual {v2}, Landroid/app/Activity;->getApplicationContext()Landroid/content/Context;

    move-result-object v2

    invoke-direct {v1, v2}, Lcom/google/android/gms/internal/dw;-><init>(Landroid/content/Context;)V

    iput-object v1, p0, Lcom/google/android/gms/internal/dz;->sn:Lcom/google/android/gms/internal/dw;

    iget-object v0, v0, Lcom/google/android/gms/internal/dv;->sj:Landroid/content/Context;

    iput-object v0, p0, Lcom/google/android/gms/internal/dz;->sw:Landroid/content/Context;

    new-instance v0, Landroid/content/Intent;

    const-string v1, "com.android.vending.billing.InAppBillingService.BIND"

    invoke-direct {v0, v1}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    const-string v1, "com.android.vending"

    invoke-virtual {v0, v1}, Landroid/content/Intent;->setPackage(Ljava/lang/String;)Landroid/content/Intent;

    iget-object v1, p0, Lcom/google/android/gms/internal/dz;->nr:Landroid/app/Activity;

    const/4 v2, 0x1

    invoke-virtual {v1, v0, p0, v2}, Landroid/app/Activity;->bindService(Landroid/content/Intent;Landroid/content/ServiceConnection;I)Z

    return-void
.end method

.method public onDestroy()V
    .locals 1

    iget-object v0, p0, Lcom/google/android/gms/internal/dz;->nr:Landroid/app/Activity;

    invoke-virtual {v0, p0}, Landroid/app/Activity;->unbindService(Landroid/content/ServiceConnection;)V

    iget-object p0, p0, Lcom/google/android/gms/internal/dz;->sn:Lcom/google/android/gms/internal/dw;

    invoke-virtual {p0}, Lcom/google/android/gms/internal/dw;->destroy()V

    return-void
.end method

.method public onServiceConnected(Landroid/content/ComponentName;Landroid/os/IBinder;)V
    .locals 9

    iget-object p1, p0, Lcom/google/android/gms/internal/dz;->sn:Lcom/google/android/gms/internal/dw;

    invoke-virtual {p1, p2}, Lcom/google/android/gms/internal/dw;->r(Landroid/os/IBinder;)V

    :try_start_0
    iget-object p1, p0, Lcom/google/android/gms/internal/dz;->sq:Lcom/google/android/gms/internal/ee;

    invoke-virtual {p1}, Lcom/google/android/gms/internal/ee;->ct()Ljava/lang/String;

    move-result-object p1

    iput-object p1, p0, Lcom/google/android/gms/internal/dz;->sz:Ljava/lang/String;

    iget-object p1, p0, Lcom/google/android/gms/internal/dz;->sn:Lcom/google/android/gms/internal/dw;

    iget-object p2, p0, Lcom/google/android/gms/internal/dz;->nr:Landroid/app/Activity;

    invoke-virtual {p2}, Landroid/app/Activity;->getPackageName()Ljava/lang/String;

    move-result-object p2

    iget-object v0, p0, Lcom/google/android/gms/internal/dz;->sx:Lcom/google/android/gms/internal/eg;

    invoke-interface {v0}, Lcom/google/android/gms/internal/eg;->getProductId()Ljava/lang/String;

    move-result-object v0

    iget-object v1, p0, Lcom/google/android/gms/internal/dz;->sz:Ljava/lang/String;

    invoke-virtual {p1, p2, v0, v1}, Lcom/google/android/gms/internal/dw;->a(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Landroid/os/Bundle;

    move-result-object p1

    const-string p2, "BUY_INTENT"

    invoke-virtual {p1, p2}, Landroid/os/Bundle;->getParcelable(Ljava/lang/String;)Landroid/os/Parcelable;

    move-result-object p2

    check-cast p2, Landroid/app/PendingIntent;

    const/4 v0, 0x0

    if-nez p2, :cond_0

    invoke-static {p1}, Lcom/google/android/gms/internal/ed;->b(Landroid/os/Bundle;)I

    move-result p1

    iget-object p2, p0, Lcom/google/android/gms/internal/dz;->sx:Lcom/google/android/gms/internal/eg;

    invoke-interface {p2, p1}, Lcom/google/android/gms/internal/eg;->recordPlayBillingResolution(I)V

    iget-object p2, p0, Lcom/google/android/gms/internal/dz;->sx:Lcom/google/android/gms/internal/eg;

    invoke-interface {p2}, Lcom/google/android/gms/internal/eg;->getProductId()Ljava/lang/String;

    move-result-object p2

    const/4 v1, 0x0

    invoke-direct {p0, p2, v0, p1, v1}, Lcom/google/android/gms/internal/dz;->a(Ljava/lang/String;ZILandroid/content/Intent;)V

    iget-object p1, p0, Lcom/google/android/gms/internal/dz;->nr:Landroid/app/Activity;

    invoke-virtual {p1}, Landroid/app/Activity;->finish()V

    goto :goto_0

    :cond_0
    new-instance p1, Lcom/google/android/gms/internal/ea;

    iget-object v1, p0, Lcom/google/android/gms/internal/dz;->sx:Lcom/google/android/gms/internal/eg;

    invoke-interface {v1}, Lcom/google/android/gms/internal/eg;->getProductId()Ljava/lang/String;

    move-result-object v1

    iget-object v2, p0, Lcom/google/android/gms/internal/dz;->sz:Ljava/lang/String;

    invoke-direct {p1, v1, v2}, Lcom/google/android/gms/internal/ea;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    iput-object p1, p0, Lcom/google/android/gms/internal/dz;->sy:Lcom/google/android/gms/internal/ea;

    iget-object v1, p0, Lcom/google/android/gms/internal/dz;->so:Lcom/google/android/gms/internal/ec;

    invoke-virtual {v1, p1}, Lcom/google/android/gms/internal/ec;->b(Lcom/google/android/gms/internal/ea;)V

    iget-object v2, p0, Lcom/google/android/gms/internal/dz;->nr:Landroid/app/Activity;

    invoke-virtual {p2}, Landroid/app/PendingIntent;->getIntentSender()Landroid/content/IntentSender;

    move-result-object v3

    new-instance v5, Landroid/content/Intent;

    invoke-direct {v5}, Landroid/content/Intent;-><init>()V

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    move-result v6

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    move-result v7

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    move-result v8

    const/16 v4, 0x3e9

    invoke-virtual/range {v2 .. v8}, Landroid/app/Activity;->startIntentSenderForResult(Landroid/content/IntentSender;ILandroid/content/Intent;III)V
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Landroid/content/IntentSender$SendIntentException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception p1

    const-string p2, "Error when connecting in-app billing service"

    invoke-static {p2, p1}, Lcom/google/android/gms/internal/gs;->d(Ljava/lang/String;Ljava/lang/Throwable;)V

    iget-object p0, p0, Lcom/google/android/gms/internal/dz;->nr:Landroid/app/Activity;

    invoke-virtual {p0}, Landroid/app/Activity;->finish()V

    :goto_0
    return-void
.end method

.method public onServiceDisconnected(Landroid/content/ComponentName;)V
    .locals 0

    const-string p1, "In-app billing service disconnected."

    invoke-static {p1}, Lcom/google/android/gms/internal/gs;->U(Ljava/lang/String;)V

    iget-object p0, p0, Lcom/google/android/gms/internal/dz;->sn:Lcom/google/android/gms/internal/dw;

    invoke-virtual {p0}, Lcom/google/android/gms/internal/dw;->destroy()V

    return-void
.end method
