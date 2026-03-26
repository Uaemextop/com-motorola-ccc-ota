.class public final Lcom/google/android/gms/common/internal/ClientSettings;
.super Ljava/lang/Object;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/google/android/gms/common/internal/ClientSettings$ParcelableClientSettings;
    }
.end annotation


# instance fields
.field private final IL:Landroid/view/View;

.field private final Ls:Lcom/google/android/gms/common/internal/ClientSettings$ParcelableClientSettings;


# direct methods
.method public constructor <init>(Ljava/lang/String;Ljava/util/Collection;ILandroid/view/View;Ljava/lang/String;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/util/Collection<",
            "Ljava/lang/String;",
            ">;I",
            "Landroid/view/View;",
            "Ljava/lang/String;",
            ")V"
        }
    .end annotation

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance v0, Lcom/google/android/gms/common/internal/ClientSettings$ParcelableClientSettings;

    invoke-direct {v0, p1, p2, p3, p5}, Lcom/google/android/gms/common/internal/ClientSettings$ParcelableClientSettings;-><init>(Ljava/lang/String;Ljava/util/Collection;ILjava/lang/String;)V

    iput-object v0, p0, Lcom/google/android/gms/common/internal/ClientSettings;->Ls:Lcom/google/android/gms/common/internal/ClientSettings$ParcelableClientSettings;

    iput-object p4, p0, Lcom/google/android/gms/common/internal/ClientSettings;->IL:Landroid/view/View;

    return-void
.end method


# virtual methods
.method public getAccountName()Ljava/lang/String;
    .locals 0

    iget-object p0, p0, Lcom/google/android/gms/common/internal/ClientSettings;->Ls:Lcom/google/android/gms/common/internal/ClientSettings$ParcelableClientSettings;

    invoke-virtual {p0}, Lcom/google/android/gms/common/internal/ClientSettings$ParcelableClientSettings;->getAccountName()Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method public getAccountNameOrDefault()Ljava/lang/String;
    .locals 0

    iget-object p0, p0, Lcom/google/android/gms/common/internal/ClientSettings;->Ls:Lcom/google/android/gms/common/internal/ClientSettings$ParcelableClientSettings;

    invoke-virtual {p0}, Lcom/google/android/gms/common/internal/ClientSettings$ParcelableClientSettings;->getAccountNameOrDefault()Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method public getGravityForPopups()I
    .locals 0

    iget-object p0, p0, Lcom/google/android/gms/common/internal/ClientSettings;->Ls:Lcom/google/android/gms/common/internal/ClientSettings$ParcelableClientSettings;

    invoke-virtual {p0}, Lcom/google/android/gms/common/internal/ClientSettings$ParcelableClientSettings;->getGravityForPopups()I

    move-result p0

    return p0
.end method

.method public getParcelableClientSettings()Lcom/google/android/gms/common/internal/ClientSettings$ParcelableClientSettings;
    .locals 0

    iget-object p0, p0, Lcom/google/android/gms/common/internal/ClientSettings;->Ls:Lcom/google/android/gms/common/internal/ClientSettings$ParcelableClientSettings;

    return-object p0
.end method

.method public getRealClientPackageName()Ljava/lang/String;
    .locals 0

    iget-object p0, p0, Lcom/google/android/gms/common/internal/ClientSettings;->Ls:Lcom/google/android/gms/common/internal/ClientSettings$ParcelableClientSettings;

    invoke-virtual {p0}, Lcom/google/android/gms/common/internal/ClientSettings$ParcelableClientSettings;->getRealClientPackageName()Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method public getScopes()Ljava/util/List;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    iget-object p0, p0, Lcom/google/android/gms/common/internal/ClientSettings;->Ls:Lcom/google/android/gms/common/internal/ClientSettings$ParcelableClientSettings;

    invoke-virtual {p0}, Lcom/google/android/gms/common/internal/ClientSettings$ParcelableClientSettings;->getScopes()Ljava/util/List;

    move-result-object p0

    return-object p0
.end method

.method public getScopesArray()[Ljava/lang/String;
    .locals 1

    iget-object p0, p0, Lcom/google/android/gms/common/internal/ClientSettings;->Ls:Lcom/google/android/gms/common/internal/ClientSettings$ParcelableClientSettings;

    invoke-virtual {p0}, Lcom/google/android/gms/common/internal/ClientSettings$ParcelableClientSettings;->getScopes()Ljava/util/List;

    move-result-object p0

    const/4 v0, 0x0

    new-array v0, v0, [Ljava/lang/String;

    invoke-interface {p0, v0}, Ljava/util/List;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object p0

    check-cast p0, [Ljava/lang/String;

    return-object p0
.end method

.method public getViewForPopups()Landroid/view/View;
    .locals 0

    iget-object p0, p0, Lcom/google/android/gms/common/internal/ClientSettings;->IL:Landroid/view/View;

    return-object p0
.end method
