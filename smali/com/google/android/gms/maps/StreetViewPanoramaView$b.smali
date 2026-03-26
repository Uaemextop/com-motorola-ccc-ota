.class Lcom/google/android/gms/maps/StreetViewPanoramaView$b;
.super Ljava/lang/Object;

# interfaces
.implements Lcom/google/android/gms/dynamic/LifecycleDelegate;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/google/android/gms/maps/StreetViewPanoramaView;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = "b"
.end annotation


# instance fields
.field private final aiV:Landroid/view/ViewGroup;

.field private final ajs:Lcom/google/android/gms/maps/internal/IStreetViewPanoramaViewDelegate;

.field private ajt:Landroid/view/View;


# direct methods
.method public constructor <init>(Landroid/view/ViewGroup;Lcom/google/android/gms/maps/internal/IStreetViewPanoramaViewDelegate;)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    invoke-static {p2}, Lcom/google/android/gms/common/internal/o;->i(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p2

    check-cast p2, Lcom/google/android/gms/maps/internal/IStreetViewPanoramaViewDelegate;

    iput-object p2, p0, Lcom/google/android/gms/maps/StreetViewPanoramaView$b;->ajs:Lcom/google/android/gms/maps/internal/IStreetViewPanoramaViewDelegate;

    invoke-static {p1}, Lcom/google/android/gms/common/internal/o;->i(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Landroid/view/ViewGroup;

    iput-object p1, p0, Lcom/google/android/gms/maps/StreetViewPanoramaView$b;->aiV:Landroid/view/ViewGroup;

    return-void
.end method


# virtual methods
.method public mH()Lcom/google/android/gms/maps/internal/IStreetViewPanoramaViewDelegate;
    .locals 0

    iget-object p0, p0, Lcom/google/android/gms/maps/StreetViewPanoramaView$b;->ajs:Lcom/google/android/gms/maps/internal/IStreetViewPanoramaViewDelegate;

    return-object p0
.end method

.method public onCreate(Landroid/os/Bundle;)V
    .locals 1

    :try_start_0
    iget-object v0, p0, Lcom/google/android/gms/maps/StreetViewPanoramaView$b;->ajs:Lcom/google/android/gms/maps/internal/IStreetViewPanoramaViewDelegate;

    invoke-interface {v0, p1}, Lcom/google/android/gms/maps/internal/IStreetViewPanoramaViewDelegate;->onCreate(Landroid/os/Bundle;)V

    iget-object p1, p0, Lcom/google/android/gms/maps/StreetViewPanoramaView$b;->ajs:Lcom/google/android/gms/maps/internal/IStreetViewPanoramaViewDelegate;

    invoke-interface {p1}, Lcom/google/android/gms/maps/internal/IStreetViewPanoramaViewDelegate;->getView()Lcom/google/android/gms/dynamic/d;

    move-result-object p1

    invoke-static {p1}, Lcom/google/android/gms/dynamic/e;->f(Lcom/google/android/gms/dynamic/d;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Landroid/view/View;

    iput-object p1, p0, Lcom/google/android/gms/maps/StreetViewPanoramaView$b;->ajt:Landroid/view/View;

    iget-object p1, p0, Lcom/google/android/gms/maps/StreetViewPanoramaView$b;->aiV:Landroid/view/ViewGroup;

    invoke-virtual {p1}, Landroid/view/ViewGroup;->removeAllViews()V

    iget-object p1, p0, Lcom/google/android/gms/maps/StreetViewPanoramaView$b;->aiV:Landroid/view/ViewGroup;

    iget-object p0, p0, Lcom/google/android/gms/maps/StreetViewPanoramaView$b;->ajt:Landroid/view/View;

    invoke-virtual {p1, p0}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    return-void

    :catch_0
    move-exception p0

    new-instance p1, Lcom/google/android/gms/maps/model/RuntimeRemoteException;

    invoke-direct {p1, p0}, Lcom/google/android/gms/maps/model/RuntimeRemoteException;-><init>(Landroid/os/RemoteException;)V

    throw p1
.end method

.method public onCreateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;Landroid/os/Bundle;)Landroid/view/View;
    .locals 0

    new-instance p0, Ljava/lang/UnsupportedOperationException;

    const-string p1, "onCreateView not allowed on StreetViewPanoramaViewDelegate"

    invoke-direct {p0, p1}, Ljava/lang/UnsupportedOperationException;-><init>(Ljava/lang/String;)V

    throw p0
.end method

.method public onDestroy()V
    .locals 1

    :try_start_0
    iget-object p0, p0, Lcom/google/android/gms/maps/StreetViewPanoramaView$b;->ajs:Lcom/google/android/gms/maps/internal/IStreetViewPanoramaViewDelegate;

    invoke-interface {p0}, Lcom/google/android/gms/maps/internal/IStreetViewPanoramaViewDelegate;->onDestroy()V
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    return-void

    :catch_0
    move-exception p0

    new-instance v0, Lcom/google/android/gms/maps/model/RuntimeRemoteException;

    invoke-direct {v0, p0}, Lcom/google/android/gms/maps/model/RuntimeRemoteException;-><init>(Landroid/os/RemoteException;)V

    throw v0
.end method

.method public onDestroyView()V
    .locals 1

    new-instance p0, Ljava/lang/UnsupportedOperationException;

    const-string v0, "onDestroyView not allowed on StreetViewPanoramaViewDelegate"

    invoke-direct {p0, v0}, Ljava/lang/UnsupportedOperationException;-><init>(Ljava/lang/String;)V

    throw p0
.end method

.method public onInflate(Landroid/app/Activity;Landroid/os/Bundle;Landroid/os/Bundle;)V
    .locals 0

    new-instance p0, Ljava/lang/UnsupportedOperationException;

    const-string p1, "onInflate not allowed on StreetViewPanoramaViewDelegate"

    invoke-direct {p0, p1}, Ljava/lang/UnsupportedOperationException;-><init>(Ljava/lang/String;)V

    throw p0
.end method

.method public onLowMemory()V
    .locals 1

    :try_start_0
    iget-object p0, p0, Lcom/google/android/gms/maps/StreetViewPanoramaView$b;->ajs:Lcom/google/android/gms/maps/internal/IStreetViewPanoramaViewDelegate;

    invoke-interface {p0}, Lcom/google/android/gms/maps/internal/IStreetViewPanoramaViewDelegate;->onLowMemory()V
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    return-void

    :catch_0
    move-exception p0

    new-instance v0, Lcom/google/android/gms/maps/model/RuntimeRemoteException;

    invoke-direct {v0, p0}, Lcom/google/android/gms/maps/model/RuntimeRemoteException;-><init>(Landroid/os/RemoteException;)V

    throw v0
.end method

.method public onPause()V
    .locals 1

    :try_start_0
    iget-object p0, p0, Lcom/google/android/gms/maps/StreetViewPanoramaView$b;->ajs:Lcom/google/android/gms/maps/internal/IStreetViewPanoramaViewDelegate;

    invoke-interface {p0}, Lcom/google/android/gms/maps/internal/IStreetViewPanoramaViewDelegate;->onPause()V
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    return-void

    :catch_0
    move-exception p0

    new-instance v0, Lcom/google/android/gms/maps/model/RuntimeRemoteException;

    invoke-direct {v0, p0}, Lcom/google/android/gms/maps/model/RuntimeRemoteException;-><init>(Landroid/os/RemoteException;)V

    throw v0
.end method

.method public onResume()V
    .locals 1

    :try_start_0
    iget-object p0, p0, Lcom/google/android/gms/maps/StreetViewPanoramaView$b;->ajs:Lcom/google/android/gms/maps/internal/IStreetViewPanoramaViewDelegate;

    invoke-interface {p0}, Lcom/google/android/gms/maps/internal/IStreetViewPanoramaViewDelegate;->onResume()V
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    return-void

    :catch_0
    move-exception p0

    new-instance v0, Lcom/google/android/gms/maps/model/RuntimeRemoteException;

    invoke-direct {v0, p0}, Lcom/google/android/gms/maps/model/RuntimeRemoteException;-><init>(Landroid/os/RemoteException;)V

    throw v0
.end method

.method public onSaveInstanceState(Landroid/os/Bundle;)V
    .locals 0

    :try_start_0
    iget-object p0, p0, Lcom/google/android/gms/maps/StreetViewPanoramaView$b;->ajs:Lcom/google/android/gms/maps/internal/IStreetViewPanoramaViewDelegate;

    invoke-interface {p0, p1}, Lcom/google/android/gms/maps/internal/IStreetViewPanoramaViewDelegate;->onSaveInstanceState(Landroid/os/Bundle;)V
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    return-void

    :catch_0
    move-exception p0

    new-instance p1, Lcom/google/android/gms/maps/model/RuntimeRemoteException;

    invoke-direct {p1, p0}, Lcom/google/android/gms/maps/model/RuntimeRemoteException;-><init>(Landroid/os/RemoteException;)V

    throw p1
.end method

.method public onStart()V
    .locals 0

    return-void
.end method

.method public onStop()V
    .locals 0

    return-void
.end method
