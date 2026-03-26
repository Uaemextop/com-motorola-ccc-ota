.class Lcom/google/android/gms/internal/nc$1;
.super Lcom/google/android/gms/internal/nc$d;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/google/android/gms/internal/nc;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/google/android/gms/internal/nc$d<",
        "Lcom/google/android/gms/panorama/PanoramaApi$a;",
        ">;"
    }
.end annotation


# instance fields
.field final synthetic aky:Landroid/net/Uri;

.field final synthetic akz:Landroid/os/Bundle;


# virtual methods
.method protected a(Landroid/content/Context;Lcom/google/android/gms/internal/nb;)V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/os/RemoteException;
        }
    .end annotation

    new-instance v0, Lcom/google/android/gms/internal/nc$a;

    invoke-direct {v0, p0}, Lcom/google/android/gms/internal/nc$a;-><init>(Lcom/google/android/gms/common/api/BaseImplementation$b;)V

    iget-object v1, p0, Lcom/google/android/gms/internal/nc$1;->aky:Landroid/net/Uri;

    iget-object p0, p0, Lcom/google/android/gms/internal/nc$1;->akz:Landroid/os/Bundle;

    invoke-static {p1, p2, v0, v1, p0}, Lcom/google/android/gms/internal/nc;->b(Landroid/content/Context;Lcom/google/android/gms/internal/nb;Lcom/google/android/gms/internal/na;Landroid/net/Uri;Landroid/os/Bundle;)V

    return-void
.end method

.method protected ay(Lcom/google/android/gms/common/api/Status;)Lcom/google/android/gms/panorama/PanoramaApi$a;
    .locals 2

    new-instance p0, Lcom/google/android/gms/internal/mz;

    const/4 v0, 0x0

    const/4 v1, 0x0

    invoke-direct {p0, p1, v0, v1}, Lcom/google/android/gms/internal/mz;-><init>(Lcom/google/android/gms/common/api/Status;Landroid/content/Intent;I)V

    return-object p0
.end method

.method protected synthetic c(Lcom/google/android/gms/common/api/Status;)Lcom/google/android/gms/common/api/Result;
    .locals 0

    invoke-virtual {p0, p1}, Lcom/google/android/gms/internal/nc$1;->ay(Lcom/google/android/gms/common/api/Status;)Lcom/google/android/gms/panorama/PanoramaApi$a;

    move-result-object p0

    return-object p0
.end method
