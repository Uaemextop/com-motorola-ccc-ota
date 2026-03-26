.class public final Lcom/google/android/gms/internal/ib;
.super Lcom/google/android/gms/common/internal/e;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/google/android/gms/internal/ib$b;,
        Lcom/google/android/gms/internal/ib$d;,
        Lcom/google/android/gms/internal/ib$f;,
        Lcom/google/android/gms/internal/ib$g;,
        Lcom/google/android/gms/internal/ib$a;,
        Lcom/google/android/gms/internal/ib$c;,
        Lcom/google/android/gms/internal/ib$e;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/google/android/gms/common/internal/e<",
        "Lcom/google/android/gms/internal/id;",
        ">;"
    }
.end annotation


# instance fields
.field private final Dd:Ljava/lang/String;


# direct methods
.method public constructor <init>(Landroid/content/Context;Landroid/os/Looper;Lcom/google/android/gms/common/api/GoogleApiClient$ConnectionCallbacks;Lcom/google/android/gms/common/api/GoogleApiClient$OnConnectionFailedListener;Ljava/lang/String;[Ljava/lang/String;)V
    .locals 6

    move-object v0, p0

    move-object v1, p1

    move-object v2, p2

    move-object v3, p3

    move-object v4, p4

    move-object v5, p6

    invoke-direct/range {v0 .. v5}, Lcom/google/android/gms/common/internal/e;-><init>(Landroid/content/Context;Landroid/os/Looper;Lcom/google/android/gms/common/api/GoogleApiClient$ConnectionCallbacks;Lcom/google/android/gms/common/api/GoogleApiClient$OnConnectionFailedListener;[Ljava/lang/String;)V

    invoke-static {p5}, Lcom/google/android/gms/common/internal/o;->i(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/lang/String;

    iput-object p1, p0, Lcom/google/android/gms/internal/ib;->Dd:Ljava/lang/String;

    return-void
.end method


# virtual methods
.method protected I(Landroid/os/IBinder;)Lcom/google/android/gms/internal/id;
    .locals 0

    invoke-static {p1}, Lcom/google/android/gms/internal/id$a;->K(Landroid/os/IBinder;)Lcom/google/android/gms/internal/id;

    move-result-object p0

    return-object p0
.end method

.method public a(Lcom/google/android/gms/common/api/BaseImplementation$b;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/google/android/gms/common/api/BaseImplementation$b<",
            "Lcom/google/android/gms/appstate/AppStateManager$StateListResult;",
            ">;)V"
        }
    .end annotation

    :try_start_0
    invoke-virtual {p0}, Lcom/google/android/gms/internal/ib;->gS()Landroid/os/IInterface;

    move-result-object p0

    check-cast p0, Lcom/google/android/gms/internal/id;

    new-instance v0, Lcom/google/android/gms/internal/ib$c;

    invoke-direct {v0, p1}, Lcom/google/android/gms/internal/ib$c;-><init>(Lcom/google/android/gms/common/api/BaseImplementation$b;)V

    invoke-interface {p0, v0}, Lcom/google/android/gms/internal/id;->a(Lcom/google/android/gms/internal/ic;)V
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    const-string p0, "AppStateClient"

    const-string p1, "service died"

    invoke-static {p0, p1}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    :goto_0
    return-void
.end method

.method public a(Lcom/google/android/gms/common/api/BaseImplementation$b;I)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/google/android/gms/common/api/BaseImplementation$b<",
            "Lcom/google/android/gms/appstate/AppStateManager$StateDeletedResult;",
            ">;I)V"
        }
    .end annotation

    :try_start_0
    invoke-virtual {p0}, Lcom/google/android/gms/internal/ib;->gS()Landroid/os/IInterface;

    move-result-object p0

    check-cast p0, Lcom/google/android/gms/internal/id;

    new-instance v0, Lcom/google/android/gms/internal/ib$a;

    invoke-direct {v0, p1}, Lcom/google/android/gms/internal/ib$a;-><init>(Lcom/google/android/gms/common/api/BaseImplementation$b;)V

    invoke-interface {p0, v0, p2}, Lcom/google/android/gms/internal/id;->b(Lcom/google/android/gms/internal/ic;I)V
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    const-string p0, "AppStateClient"

    const-string p1, "service died"

    invoke-static {p0, p1}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    :goto_0
    return-void
.end method

.method public a(Lcom/google/android/gms/common/api/BaseImplementation$b;ILjava/lang/String;[B)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/google/android/gms/common/api/BaseImplementation$b<",
            "Lcom/google/android/gms/appstate/AppStateManager$StateResult;",
            ">;I",
            "Ljava/lang/String;",
            "[B)V"
        }
    .end annotation

    :try_start_0
    invoke-virtual {p0}, Lcom/google/android/gms/internal/ib;->gS()Landroid/os/IInterface;

    move-result-object p0

    check-cast p0, Lcom/google/android/gms/internal/id;

    new-instance v0, Lcom/google/android/gms/internal/ib$e;

    invoke-direct {v0, p1}, Lcom/google/android/gms/internal/ib$e;-><init>(Lcom/google/android/gms/common/api/BaseImplementation$b;)V

    invoke-interface {p0, v0, p2, p3, p4}, Lcom/google/android/gms/internal/id;->a(Lcom/google/android/gms/internal/ic;ILjava/lang/String;[B)V
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    const-string p0, "AppStateClient"

    const-string p1, "service died"

    invoke-static {p0, p1}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    :goto_0
    return-void
.end method

.method public a(Lcom/google/android/gms/common/api/BaseImplementation$b;I[B)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/google/android/gms/common/api/BaseImplementation$b<",
            "Lcom/google/android/gms/appstate/AppStateManager$StateResult;",
            ">;I[B)V"
        }
    .end annotation

    if-nez p1, :cond_0

    const/4 p1, 0x0

    goto :goto_0

    :cond_0
    :try_start_0
    new-instance v0, Lcom/google/android/gms/internal/ib$e;

    invoke-direct {v0, p1}, Lcom/google/android/gms/internal/ib$e;-><init>(Lcom/google/android/gms/common/api/BaseImplementation$b;)V

    move-object p1, v0

    :goto_0
    invoke-virtual {p0}, Lcom/google/android/gms/internal/ib;->gS()Landroid/os/IInterface;

    move-result-object p0

    check-cast p0, Lcom/google/android/gms/internal/id;

    invoke-interface {p0, p1, p2, p3}, Lcom/google/android/gms/internal/id;->a(Lcom/google/android/gms/internal/ic;I[B)V
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_1

    :catch_0
    const-string p0, "AppStateClient"

    const-string p1, "service died"

    invoke-static {p0, p1}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    :goto_1
    return-void
.end method

.method protected a(Lcom/google/android/gms/common/internal/l;Lcom/google/android/gms/common/internal/e$e;)V
    .locals 7
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/os/RemoteException;
        }
    .end annotation

    invoke-virtual {p0}, Lcom/google/android/gms/internal/ib;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v4

    iget-object v5, p0, Lcom/google/android/gms/internal/ib;->Dd:Ljava/lang/String;

    invoke-virtual {p0}, Lcom/google/android/gms/internal/ib;->gR()[Ljava/lang/String;

    move-result-object v6

    const v3, 0x5e2978

    move-object v1, p1

    move-object v2, p2

    invoke-interface/range {v1 .. v6}, Lcom/google/android/gms/common/internal/l;->a(Lcom/google/android/gms/common/internal/k;ILjava/lang/String;Ljava/lang/String;[Ljava/lang/String;)V

    return-void
.end method

.method public b(Lcom/google/android/gms/common/api/BaseImplementation$b;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/google/android/gms/common/api/BaseImplementation$b<",
            "Lcom/google/android/gms/common/api/Status;",
            ">;)V"
        }
    .end annotation

    :try_start_0
    invoke-virtual {p0}, Lcom/google/android/gms/internal/ib;->gS()Landroid/os/IInterface;

    move-result-object p0

    check-cast p0, Lcom/google/android/gms/internal/id;

    new-instance v0, Lcom/google/android/gms/internal/ib$g;

    invoke-direct {v0, p1}, Lcom/google/android/gms/internal/ib$g;-><init>(Lcom/google/android/gms/common/api/BaseImplementation$b;)V

    invoke-interface {p0, v0}, Lcom/google/android/gms/internal/id;->b(Lcom/google/android/gms/internal/ic;)V
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    const-string p0, "AppStateClient"

    const-string p1, "service died"

    invoke-static {p0, p1}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    :goto_0
    return-void
.end method

.method public b(Lcom/google/android/gms/common/api/BaseImplementation$b;I)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/google/android/gms/common/api/BaseImplementation$b<",
            "Lcom/google/android/gms/appstate/AppStateManager$StateResult;",
            ">;I)V"
        }
    .end annotation

    :try_start_0
    invoke-virtual {p0}, Lcom/google/android/gms/internal/ib;->gS()Landroid/os/IInterface;

    move-result-object p0

    check-cast p0, Lcom/google/android/gms/internal/id;

    new-instance v0, Lcom/google/android/gms/internal/ib$e;

    invoke-direct {v0, p1}, Lcom/google/android/gms/internal/ib$e;-><init>(Lcom/google/android/gms/common/api/BaseImplementation$b;)V

    invoke-interface {p0, v0, p2}, Lcom/google/android/gms/internal/id;->a(Lcom/google/android/gms/internal/ic;I)V
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    const-string p0, "AppStateClient"

    const-string p1, "service died"

    invoke-static {p0, p1}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    :goto_0
    return-void
.end method

.method protected varargs c([Ljava/lang/String;)V
    .locals 3

    const/4 p0, 0x0

    move v0, p0

    :goto_0
    array-length v1, p1

    const-string v2, "https://www.googleapis.com/auth/appstate"

    if-ge p0, v1, :cond_1

    aget-object v1, p1, p0

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_0

    const/4 v0, 0x1

    :cond_0
    add-int/lit8 p0, p0, 0x1

    goto :goto_0

    :cond_1
    const-string p0, "App State APIs requires %s to function."

    filled-new-array {v2}, [Ljava/lang/Object;

    move-result-object p1

    invoke-static {p0, p1}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p0

    invoke-static {v0, p0}, Lcom/google/android/gms/common/internal/o;->a(ZLjava/lang/Object;)V

    return-void
.end method

.method public fq()I
    .locals 1

    :try_start_0
    invoke-virtual {p0}, Lcom/google/android/gms/internal/ib;->gS()Landroid/os/IInterface;

    move-result-object p0

    check-cast p0, Lcom/google/android/gms/internal/id;

    invoke-interface {p0}, Lcom/google/android/gms/internal/id;->fq()I

    move-result p0
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    const-string p0, "AppStateClient"

    const-string v0, "service died"

    invoke-static {p0, v0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    const/4 p0, 0x2

    :goto_0
    return p0
.end method

.method public fr()I
    .locals 1

    :try_start_0
    invoke-virtual {p0}, Lcom/google/android/gms/internal/ib;->gS()Landroid/os/IInterface;

    move-result-object p0

    check-cast p0, Lcom/google/android/gms/internal/id;

    invoke-interface {p0}, Lcom/google/android/gms/internal/id;->fr()I

    move-result p0
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    const-string p0, "AppStateClient"

    const-string v0, "service died"

    invoke-static {p0, v0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    const/4 p0, 0x2

    :goto_0
    return p0
.end method

.method protected getServiceDescriptor()Ljava/lang/String;
    .locals 0

    const-string p0, "com.google.android.gms.appstate.internal.IAppStateService"

    return-object p0
.end method

.method protected getStartServiceAction()Ljava/lang/String;
    .locals 0

    const-string p0, "com.google.android.gms.appstate.service.START"

    return-object p0
.end method

.method protected synthetic j(Landroid/os/IBinder;)Landroid/os/IInterface;
    .locals 0

    invoke-virtual {p0, p1}, Lcom/google/android/gms/internal/ib;->I(Landroid/os/IBinder;)Lcom/google/android/gms/internal/id;

    move-result-object p0

    return-object p0
.end method
