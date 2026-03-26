.class public final Lcom/google/android/gms/internal/en;
.super Lcom/google/android/gms/dynamic/g;


# annotations
.annotation runtime Lcom/google/android/gms/internal/ez;
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/google/android/gms/internal/en$a;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/google/android/gms/dynamic/g<",
        "Lcom/google/android/gms/internal/ej;",
        ">;"
    }
.end annotation


# static fields
.field private static final sK:Lcom/google/android/gms/internal/en;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    new-instance v0, Lcom/google/android/gms/internal/en;

    invoke-direct {v0}, Lcom/google/android/gms/internal/en;-><init>()V

    sput-object v0, Lcom/google/android/gms/internal/en;->sK:Lcom/google/android/gms/internal/en;

    return-void
.end method

.method private constructor <init>()V
    .locals 1

    const-string v0, "com.google.android.gms.ads.InAppPurchaseManagerCreatorImpl"

    invoke-direct {p0, v0}, Lcom/google/android/gms/dynamic/g;-><init>(Ljava/lang/String;)V

    return-void
.end method

.method private static c(Landroid/app/Activity;)Z
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/android/gms/internal/en$a;
        }
    .end annotation

    invoke-virtual {p0}, Landroid/app/Activity;->getIntent()Landroid/content/Intent;

    move-result-object p0

    const-string v0, "com.google.android.gms.ads.internal.purchase.useClientJar"

    invoke-virtual {p0, v0}, Landroid/content/Intent;->hasExtra(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_0

    const/4 v1, 0x0

    invoke-virtual {p0, v0, v1}, Landroid/content/Intent;->getBooleanExtra(Ljava/lang/String;Z)Z

    move-result p0

    return p0

    :cond_0
    new-instance p0, Lcom/google/android/gms/internal/en$a;

    const-string v0, "InAppPurchaseManager requires the useClientJar flag in intent extras."

    invoke-direct {p0, v0}, Lcom/google/android/gms/internal/en$a;-><init>(Ljava/lang/String;)V

    throw p0
.end method

.method public static e(Landroid/app/Activity;)Lcom/google/android/gms/internal/ei;
    .locals 1

    :try_start_0
    invoke-static {p0}, Lcom/google/android/gms/internal/en;->c(Landroid/app/Activity;)Z

    move-result v0

    if-eqz v0, :cond_0

    const-string v0, "Using AdOverlay from the client jar."

    invoke-static {v0}, Lcom/google/android/gms/internal/gs;->S(Ljava/lang/String;)V

    new-instance v0, Lcom/google/android/gms/internal/dz;

    invoke-direct {v0, p0}, Lcom/google/android/gms/internal/dz;-><init>(Landroid/app/Activity;)V

    return-object v0

    :cond_0
    sget-object v0, Lcom/google/android/gms/internal/en;->sK:Lcom/google/android/gms/internal/en;

    invoke-direct {v0, p0}, Lcom/google/android/gms/internal/en;->f(Landroid/app/Activity;)Lcom/google/android/gms/internal/ei;

    move-result-object p0
    :try_end_0
    .catch Lcom/google/android/gms/internal/en$a; {:try_start_0 .. :try_end_0} :catch_0

    return-object p0

    :catch_0
    move-exception p0

    invoke-virtual {p0}, Lcom/google/android/gms/internal/en$a;->getMessage()Ljava/lang/String;

    move-result-object p0

    invoke-static {p0}, Lcom/google/android/gms/internal/gs;->W(Ljava/lang/String;)V

    const/4 p0, 0x0

    return-object p0
.end method

.method private f(Landroid/app/Activity;)Lcom/google/android/gms/internal/ei;
    .locals 3

    const-string v0, "Could not create remote InAppPurchaseManager."

    const/4 v1, 0x0

    :try_start_0
    invoke-static {p1}, Lcom/google/android/gms/dynamic/e;->k(Ljava/lang/Object;)Lcom/google/android/gms/dynamic/d;

    move-result-object v2

    invoke-virtual {p0, p1}, Lcom/google/android/gms/internal/en;->L(Landroid/content/Context;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lcom/google/android/gms/internal/ej;

    invoke-interface {p0, v2}, Lcom/google/android/gms/internal/ej;->b(Lcom/google/android/gms/dynamic/d;)Landroid/os/IBinder;

    move-result-object p0

    invoke-static {p0}, Lcom/google/android/gms/internal/ei$a;->u(Landroid/os/IBinder;)Lcom/google/android/gms/internal/ei;

    move-result-object p0
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Lcom/google/android/gms/dynamic/g$a; {:try_start_0 .. :try_end_0} :catch_0

    return-object p0

    :catch_0
    move-exception p0

    invoke-static {v0, p0}, Lcom/google/android/gms/internal/gs;->d(Ljava/lang/String;Ljava/lang/Throwable;)V

    return-object v1

    :catch_1
    move-exception p0

    invoke-static {v0, p0}, Lcom/google/android/gms/internal/gs;->d(Ljava/lang/String;Ljava/lang/Throwable;)V

    return-object v1
.end method


# virtual methods
.method protected synthetic d(Landroid/os/IBinder;)Ljava/lang/Object;
    .locals 0

    invoke-virtual {p0, p1}, Lcom/google/android/gms/internal/en;->y(Landroid/os/IBinder;)Lcom/google/android/gms/internal/ej;

    move-result-object p0

    return-object p0
.end method

.method protected y(Landroid/os/IBinder;)Lcom/google/android/gms/internal/ej;
    .locals 0

    invoke-static {p1}, Lcom/google/android/gms/internal/ej$a;->v(Landroid/os/IBinder;)Lcom/google/android/gms/internal/ej;

    move-result-object p0

    return-object p0
.end method
