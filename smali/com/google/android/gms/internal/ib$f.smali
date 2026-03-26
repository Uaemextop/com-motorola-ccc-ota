.class final Lcom/google/android/gms/internal/ib$f;
.super Lcom/google/android/gms/common/api/a;

# interfaces
.implements Lcom/google/android/gms/appstate/AppStateManager$StateConflictResult;
.implements Lcom/google/android/gms/appstate/AppStateManager$StateLoadedResult;
.implements Lcom/google/android/gms/appstate/AppStateManager$StateResult;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/google/android/gms/internal/ib;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1a
    name = "f"
.end annotation


# instance fields
.field private final Df:I

.field private final Dg:Lcom/google/android/gms/appstate/AppStateBuffer;


# direct methods
.method public constructor <init>(ILcom/google/android/gms/common/data/DataHolder;)V
    .locals 0

    invoke-direct {p0, p2}, Lcom/google/android/gms/common/api/a;-><init>(Lcom/google/android/gms/common/data/DataHolder;)V

    iput p1, p0, Lcom/google/android/gms/internal/ib$f;->Df:I

    new-instance p1, Lcom/google/android/gms/appstate/AppStateBuffer;

    invoke-direct {p1, p2}, Lcom/google/android/gms/appstate/AppStateBuffer;-><init>(Lcom/google/android/gms/common/data/DataHolder;)V

    iput-object p1, p0, Lcom/google/android/gms/internal/ib$f;->Dg:Lcom/google/android/gms/appstate/AppStateBuffer;

    return-void
.end method

.method private fs()Z
    .locals 1

    iget-object p0, p0, Lcom/google/android/gms/internal/ib$f;->CM:Lcom/google/android/gms/common/api/Status;

    invoke-virtual {p0}, Lcom/google/android/gms/common/api/Status;->getStatusCode()I

    move-result p0

    const/16 v0, 0x7d0

    if-ne p0, v0, :cond_0

    const/4 p0, 0x1

    goto :goto_0

    :cond_0
    const/4 p0, 0x0

    :goto_0
    return p0
.end method


# virtual methods
.method public getConflictResult()Lcom/google/android/gms/appstate/AppStateManager$StateConflictResult;
    .locals 1

    invoke-direct {p0}, Lcom/google/android/gms/internal/ib$f;->fs()Z

    move-result v0

    if-eqz v0, :cond_0

    goto :goto_0

    :cond_0
    const/4 p0, 0x0

    :goto_0
    return-object p0
.end method

.method public getLoadedResult()Lcom/google/android/gms/appstate/AppStateManager$StateLoadedResult;
    .locals 1

    invoke-direct {p0}, Lcom/google/android/gms/internal/ib$f;->fs()Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 p0, 0x0

    :cond_0
    return-object p0
.end method

.method public getLocalData()[B
    .locals 1

    iget-object v0, p0, Lcom/google/android/gms/internal/ib$f;->Dg:Lcom/google/android/gms/appstate/AppStateBuffer;

    invoke-virtual {v0}, Lcom/google/android/gms/appstate/AppStateBuffer;->getCount()I

    move-result v0

    if-nez v0, :cond_0

    const/4 p0, 0x0

    return-object p0

    :cond_0
    iget-object p0, p0, Lcom/google/android/gms/internal/ib$f;->Dg:Lcom/google/android/gms/appstate/AppStateBuffer;

    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Lcom/google/android/gms/appstate/AppStateBuffer;->get(I)Lcom/google/android/gms/appstate/AppState;

    move-result-object p0

    invoke-interface {p0}, Lcom/google/android/gms/appstate/AppState;->getLocalData()[B

    move-result-object p0

    return-object p0
.end method

.method public getResolvedVersion()Ljava/lang/String;
    .locals 1

    iget-object v0, p0, Lcom/google/android/gms/internal/ib$f;->Dg:Lcom/google/android/gms/appstate/AppStateBuffer;

    invoke-virtual {v0}, Lcom/google/android/gms/appstate/AppStateBuffer;->getCount()I

    move-result v0

    if-nez v0, :cond_0

    const/4 p0, 0x0

    return-object p0

    :cond_0
    iget-object p0, p0, Lcom/google/android/gms/internal/ib$f;->Dg:Lcom/google/android/gms/appstate/AppStateBuffer;

    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Lcom/google/android/gms/appstate/AppStateBuffer;->get(I)Lcom/google/android/gms/appstate/AppState;

    move-result-object p0

    invoke-interface {p0}, Lcom/google/android/gms/appstate/AppState;->getConflictVersion()Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method public getServerData()[B
    .locals 1

    iget-object v0, p0, Lcom/google/android/gms/internal/ib$f;->Dg:Lcom/google/android/gms/appstate/AppStateBuffer;

    invoke-virtual {v0}, Lcom/google/android/gms/appstate/AppStateBuffer;->getCount()I

    move-result v0

    if-nez v0, :cond_0

    const/4 p0, 0x0

    return-object p0

    :cond_0
    iget-object p0, p0, Lcom/google/android/gms/internal/ib$f;->Dg:Lcom/google/android/gms/appstate/AppStateBuffer;

    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Lcom/google/android/gms/appstate/AppStateBuffer;->get(I)Lcom/google/android/gms/appstate/AppState;

    move-result-object p0

    invoke-interface {p0}, Lcom/google/android/gms/appstate/AppState;->getConflictData()[B

    move-result-object p0

    return-object p0
.end method

.method public getStateKey()I
    .locals 0

    iget p0, p0, Lcom/google/android/gms/internal/ib$f;->Df:I

    return p0
.end method

.method public release()V
    .locals 0

    iget-object p0, p0, Lcom/google/android/gms/internal/ib$f;->Dg:Lcom/google/android/gms/appstate/AppStateBuffer;

    invoke-virtual {p0}, Lcom/google/android/gms/appstate/AppStateBuffer;->close()V

    return-void
.end method
