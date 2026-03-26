.class public Lcom/google/android/gms/maps/MapView;
.super Landroid/widget/FrameLayout;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/google/android/gms/maps/MapView$b;,
        Lcom/google/android/gms/maps/MapView$a;
    }
.end annotation


# instance fields
.field private aiR:Lcom/google/android/gms/maps/GoogleMap;

.field private final aiU:Lcom/google/android/gms/maps/MapView$b;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 2

    invoke-direct {p0, p1}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;)V

    new-instance v0, Lcom/google/android/gms/maps/MapView$b;

    const/4 v1, 0x0

    invoke-direct {v0, p0, p1, v1}, Lcom/google/android/gms/maps/MapView$b;-><init>(Landroid/view/ViewGroup;Landroid/content/Context;Lcom/google/android/gms/maps/GoogleMapOptions;)V

    iput-object v0, p0, Lcom/google/android/gms/maps/MapView;->aiU:Lcom/google/android/gms/maps/MapView$b;

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 1

    invoke-direct {p0, p1, p2}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    new-instance v0, Lcom/google/android/gms/maps/MapView$b;

    invoke-static {p1, p2}, Lcom/google/android/gms/maps/GoogleMapOptions;->createFromAttributes(Landroid/content/Context;Landroid/util/AttributeSet;)Lcom/google/android/gms/maps/GoogleMapOptions;

    move-result-object p2

    invoke-direct {v0, p0, p1, p2}, Lcom/google/android/gms/maps/MapView$b;-><init>(Landroid/view/ViewGroup;Landroid/content/Context;Lcom/google/android/gms/maps/GoogleMapOptions;)V

    iput-object v0, p0, Lcom/google/android/gms/maps/MapView;->aiU:Lcom/google/android/gms/maps/MapView$b;

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0

    invoke-direct {p0, p1, p2, p3}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    new-instance p3, Lcom/google/android/gms/maps/MapView$b;

    invoke-static {p1, p2}, Lcom/google/android/gms/maps/GoogleMapOptions;->createFromAttributes(Landroid/content/Context;Landroid/util/AttributeSet;)Lcom/google/android/gms/maps/GoogleMapOptions;

    move-result-object p2

    invoke-direct {p3, p0, p1, p2}, Lcom/google/android/gms/maps/MapView$b;-><init>(Landroid/view/ViewGroup;Landroid/content/Context;Lcom/google/android/gms/maps/GoogleMapOptions;)V

    iput-object p3, p0, Lcom/google/android/gms/maps/MapView;->aiU:Lcom/google/android/gms/maps/MapView$b;

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Lcom/google/android/gms/maps/GoogleMapOptions;)V
    .locals 1

    invoke-direct {p0, p1}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;)V

    new-instance v0, Lcom/google/android/gms/maps/MapView$b;

    invoke-direct {v0, p0, p1, p2}, Lcom/google/android/gms/maps/MapView$b;-><init>(Landroid/view/ViewGroup;Landroid/content/Context;Lcom/google/android/gms/maps/GoogleMapOptions;)V

    iput-object v0, p0, Lcom/google/android/gms/maps/MapView;->aiU:Lcom/google/android/gms/maps/MapView$b;

    return-void
.end method


# virtual methods
.method public final getMap()Lcom/google/android/gms/maps/GoogleMap;
    .locals 2

    iget-object v0, p0, Lcom/google/android/gms/maps/MapView;->aiR:Lcom/google/android/gms/maps/GoogleMap;

    if-eqz v0, :cond_0

    return-object v0

    :cond_0
    iget-object v0, p0, Lcom/google/android/gms/maps/MapView;->aiU:Lcom/google/android/gms/maps/MapView$b;

    invoke-virtual {v0}, Lcom/google/android/gms/maps/MapView$b;->mA()V

    iget-object v0, p0, Lcom/google/android/gms/maps/MapView;->aiU:Lcom/google/android/gms/maps/MapView$b;

    invoke-virtual {v0}, Lcom/google/android/gms/maps/MapView$b;->it()Lcom/google/android/gms/dynamic/LifecycleDelegate;

    move-result-object v0

    if-nez v0, :cond_1

    const/4 p0, 0x0

    return-object p0

    :cond_1
    :try_start_0
    new-instance v0, Lcom/google/android/gms/maps/GoogleMap;

    iget-object v1, p0, Lcom/google/android/gms/maps/MapView;->aiU:Lcom/google/android/gms/maps/MapView$b;

    invoke-virtual {v1}, Lcom/google/android/gms/maps/MapView$b;->it()Lcom/google/android/gms/dynamic/LifecycleDelegate;

    move-result-object v1

    check-cast v1, Lcom/google/android/gms/maps/MapView$a;

    invoke-virtual {v1}, Lcom/google/android/gms/maps/MapView$a;->mB()Lcom/google/android/gms/maps/internal/IMapViewDelegate;

    move-result-object v1

    invoke-interface {v1}, Lcom/google/android/gms/maps/internal/IMapViewDelegate;->getMap()Lcom/google/android/gms/maps/internal/IGoogleMapDelegate;

    move-result-object v1

    invoke-direct {v0, v1}, Lcom/google/android/gms/maps/GoogleMap;-><init>(Lcom/google/android/gms/maps/internal/IGoogleMapDelegate;)V

    iput-object v0, p0, Lcom/google/android/gms/maps/MapView;->aiR:Lcom/google/android/gms/maps/GoogleMap;
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    return-object v0

    :catch_0
    move-exception p0

    new-instance v0, Lcom/google/android/gms/maps/model/RuntimeRemoteException;

    invoke-direct {v0, p0}, Lcom/google/android/gms/maps/model/RuntimeRemoteException;-><init>(Landroid/os/RemoteException;)V

    throw v0
.end method

.method public final onCreate(Landroid/os/Bundle;)V
    .locals 1

    iget-object v0, p0, Lcom/google/android/gms/maps/MapView;->aiU:Lcom/google/android/gms/maps/MapView$b;

    invoke-virtual {v0, p1}, Lcom/google/android/gms/maps/MapView$b;->onCreate(Landroid/os/Bundle;)V

    iget-object p1, p0, Lcom/google/android/gms/maps/MapView;->aiU:Lcom/google/android/gms/maps/MapView$b;

    invoke-virtual {p1}, Lcom/google/android/gms/maps/MapView$b;->it()Lcom/google/android/gms/dynamic/LifecycleDelegate;

    move-result-object p1

    if-nez p1, :cond_0

    invoke-static {p0}, Lcom/google/android/gms/maps/MapView$b;->b(Landroid/widget/FrameLayout;)V

    :cond_0
    return-void
.end method

.method public final onDestroy()V
    .locals 0

    iget-object p0, p0, Lcom/google/android/gms/maps/MapView;->aiU:Lcom/google/android/gms/maps/MapView$b;

    invoke-virtual {p0}, Lcom/google/android/gms/maps/MapView$b;->onDestroy()V

    return-void
.end method

.method public final onLowMemory()V
    .locals 0

    iget-object p0, p0, Lcom/google/android/gms/maps/MapView;->aiU:Lcom/google/android/gms/maps/MapView$b;

    invoke-virtual {p0}, Lcom/google/android/gms/maps/MapView$b;->onLowMemory()V

    return-void
.end method

.method public final onPause()V
    .locals 0

    iget-object p0, p0, Lcom/google/android/gms/maps/MapView;->aiU:Lcom/google/android/gms/maps/MapView$b;

    invoke-virtual {p0}, Lcom/google/android/gms/maps/MapView$b;->onPause()V

    return-void
.end method

.method public final onResume()V
    .locals 0

    iget-object p0, p0, Lcom/google/android/gms/maps/MapView;->aiU:Lcom/google/android/gms/maps/MapView$b;

    invoke-virtual {p0}, Lcom/google/android/gms/maps/MapView$b;->onResume()V

    return-void
.end method

.method public final onSaveInstanceState(Landroid/os/Bundle;)V
    .locals 0

    iget-object p0, p0, Lcom/google/android/gms/maps/MapView;->aiU:Lcom/google/android/gms/maps/MapView$b;

    invoke-virtual {p0, p1}, Lcom/google/android/gms/maps/MapView$b;->onSaveInstanceState(Landroid/os/Bundle;)V

    return-void
.end method
