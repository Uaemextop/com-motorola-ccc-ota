.class public Lcom/google/android/gms/internal/hy;
.super Lcom/google/android/gms/common/internal/e;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/google/android/gms/common/internal/e<",
        "Lcom/google/android/gms/internal/hv;",
        ">;"
    }
.end annotation


# direct methods
.method public constructor <init>(Landroid/content/Context;Landroid/os/Looper;Lcom/google/android/gms/common/api/GoogleApiClient$ConnectionCallbacks;Lcom/google/android/gms/common/api/GoogleApiClient$OnConnectionFailedListener;)V
    .locals 7

    const/4 v0, 0x0

    new-array v6, v0, [Ljava/lang/String;

    move-object v1, p0

    move-object v2, p1

    move-object v3, p2

    move-object v4, p3

    move-object v5, p4

    invoke-direct/range {v1 .. v6}, Lcom/google/android/gms/common/internal/e;-><init>(Landroid/content/Context;Landroid/os/Looper;Lcom/google/android/gms/common/api/GoogleApiClient$ConnectionCallbacks;Lcom/google/android/gms/common/api/GoogleApiClient$OnConnectionFailedListener;[Ljava/lang/String;)V

    return-void
.end method


# virtual methods
.method protected H(Landroid/os/IBinder;)Lcom/google/android/gms/internal/hv;
    .locals 0

    invoke-static {p1}, Lcom/google/android/gms/internal/hv$a;->F(Landroid/os/IBinder;)Lcom/google/android/gms/internal/hv;

    move-result-object p0

    return-object p0
.end method

.method protected a(Lcom/google/android/gms/common/internal/l;Lcom/google/android/gms/common/internal/e$e;)V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/os/RemoteException;
        }
    .end annotation

    invoke-virtual {p0}, Lcom/google/android/gms/internal/hy;->getContext()Landroid/content/Context;

    move-result-object p0

    invoke-virtual {p0}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object p0

    const v0, 0x5e2978

    invoke-interface {p1, p2, v0, p0}, Lcom/google/android/gms/common/internal/l;->b(Lcom/google/android/gms/common/internal/k;ILjava/lang/String;)V

    return-void
.end method

.method public fn()Lcom/google/android/gms/internal/hv;
    .locals 0

    invoke-virtual {p0}, Lcom/google/android/gms/internal/hy;->gS()Landroid/os/IInterface;

    move-result-object p0

    check-cast p0, Lcom/google/android/gms/internal/hv;

    return-object p0
.end method

.method protected getServiceDescriptor()Ljava/lang/String;
    .locals 0

    const-string p0, "com.google.android.gms.appdatasearch.internal.ILightweightAppDataSearch"

    return-object p0
.end method

.method protected getStartServiceAction()Ljava/lang/String;
    .locals 0

    const-string p0, "com.google.android.gms.icing.LIGHTWEIGHT_INDEX_SERVICE"

    return-object p0
.end method

.method protected synthetic j(Landroid/os/IBinder;)Landroid/os/IInterface;
    .locals 0

    invoke-virtual {p0, p1}, Lcom/google/android/gms/internal/hy;->H(Landroid/os/IBinder;)Lcom/google/android/gms/internal/hv;

    move-result-object p0

    return-object p0
.end method
