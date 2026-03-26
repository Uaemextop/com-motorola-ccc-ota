.class public final Lcom/google/android/gms/common/internal/e$h;
.super Lcom/google/android/gms/common/internal/e$b;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/google/android/gms/common/internal/e;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x14
    name = "h"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/google/android/gms/common/internal/e<",
        "TT;>.b<",
        "Ljava/lang/Boolean;",
        ">;"
    }
.end annotation


# instance fields
.field final synthetic LF:Lcom/google/android/gms/common/internal/e;

.field public final LK:Landroid/os/Bundle;

.field public final LL:Landroid/os/IBinder;

.field public final statusCode:I


# direct methods
.method public constructor <init>(Lcom/google/android/gms/common/internal/e;ILandroid/os/IBinder;Landroid/os/Bundle;)V
    .locals 1

    iput-object p1, p0, Lcom/google/android/gms/common/internal/e$h;->LF:Lcom/google/android/gms/common/internal/e;

    const/4 v0, 0x1

    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v0

    invoke-direct {p0, p1, v0}, Lcom/google/android/gms/common/internal/e$b;-><init>(Lcom/google/android/gms/common/internal/e;Ljava/lang/Object;)V

    iput p2, p0, Lcom/google/android/gms/common/internal/e$h;->statusCode:I

    iput-object p3, p0, Lcom/google/android/gms/common/internal/e$h;->LL:Landroid/os/IBinder;

    iput-object p4, p0, Lcom/google/android/gms/common/internal/e$h;->LK:Landroid/os/Bundle;

    return-void
.end method


# virtual methods
.method protected b(Ljava/lang/Boolean;)V
    .locals 5

    const/4 v0, 0x1

    if-nez p1, :cond_0

    iget-object p0, p0, Lcom/google/android/gms/common/internal/e$h;->LF:Lcom/google/android/gms/common/internal/e;

    invoke-static {p0, v0}, Lcom/google/android/gms/common/internal/e;->a(Lcom/google/android/gms/common/internal/e;I)V

    return-void

    :cond_0
    iget p1, p0, Lcom/google/android/gms/common/internal/e$h;->statusCode:I

    const/4 v1, 0x0

    if-eqz p1, :cond_4

    const/16 v2, 0xa

    if-eq p1, v2, :cond_3

    iget-object p1, p0, Lcom/google/android/gms/common/internal/e$h;->LK:Landroid/os/Bundle;

    if-eqz p1, :cond_1

    const-string v2, "pendingIntent"

    invoke-virtual {p1, v2}, Landroid/os/Bundle;->getParcelable(Ljava/lang/String;)Landroid/os/Parcelable;

    move-result-object p1

    check-cast p1, Landroid/app/PendingIntent;

    goto :goto_0

    :cond_1
    move-object p1, v1

    :goto_0
    iget-object v2, p0, Lcom/google/android/gms/common/internal/e$h;->LF:Lcom/google/android/gms/common/internal/e;

    invoke-static {v2}, Lcom/google/android/gms/common/internal/e;->d(Lcom/google/android/gms/common/internal/e;)Lcom/google/android/gms/common/internal/e$f;

    move-result-object v2

    if-eqz v2, :cond_2

    iget-object v2, p0, Lcom/google/android/gms/common/internal/e$h;->LF:Lcom/google/android/gms/common/internal/e;

    invoke-static {v2}, Lcom/google/android/gms/common/internal/e;->e(Lcom/google/android/gms/common/internal/e;)Landroid/content/Context;

    move-result-object v2

    invoke-static {v2}, Lcom/google/android/gms/common/internal/g;->J(Landroid/content/Context;)Lcom/google/android/gms/common/internal/g;

    move-result-object v2

    iget-object v3, p0, Lcom/google/android/gms/common/internal/e$h;->LF:Lcom/google/android/gms/common/internal/e;

    invoke-virtual {v3}, Lcom/google/android/gms/common/internal/e;->getStartServiceAction()Ljava/lang/String;

    move-result-object v3

    iget-object v4, p0, Lcom/google/android/gms/common/internal/e$h;->LF:Lcom/google/android/gms/common/internal/e;

    invoke-static {v4}, Lcom/google/android/gms/common/internal/e;->d(Lcom/google/android/gms/common/internal/e;)Lcom/google/android/gms/common/internal/e$f;

    move-result-object v4

    invoke-virtual {v2, v3, v4}, Lcom/google/android/gms/common/internal/g;->b(Ljava/lang/String;Lcom/google/android/gms/common/internal/e$f;)V

    iget-object v2, p0, Lcom/google/android/gms/common/internal/e$h;->LF:Lcom/google/android/gms/common/internal/e;

    invoke-static {v2, v1}, Lcom/google/android/gms/common/internal/e;->a(Lcom/google/android/gms/common/internal/e;Lcom/google/android/gms/common/internal/e$f;)Lcom/google/android/gms/common/internal/e$f;

    :cond_2
    iget-object v2, p0, Lcom/google/android/gms/common/internal/e$h;->LF:Lcom/google/android/gms/common/internal/e;

    invoke-static {v2, v0}, Lcom/google/android/gms/common/internal/e;->a(Lcom/google/android/gms/common/internal/e;I)V

    iget-object v0, p0, Lcom/google/android/gms/common/internal/e$h;->LF:Lcom/google/android/gms/common/internal/e;

    invoke-static {v0, v1}, Lcom/google/android/gms/common/internal/e;->a(Lcom/google/android/gms/common/internal/e;Landroid/os/IInterface;)Landroid/os/IInterface;

    iget-object v0, p0, Lcom/google/android/gms/common/internal/e$h;->LF:Lcom/google/android/gms/common/internal/e;

    invoke-static {v0}, Lcom/google/android/gms/common/internal/e;->a(Lcom/google/android/gms/common/internal/e;)Lcom/google/android/gms/common/internal/f;

    move-result-object v0

    new-instance v1, Lcom/google/android/gms/common/ConnectionResult;

    iget p0, p0, Lcom/google/android/gms/common/internal/e$h;->statusCode:I

    invoke-direct {v1, p0, p1}, Lcom/google/android/gms/common/ConnectionResult;-><init>(ILandroid/app/PendingIntent;)V

    invoke-virtual {v0, v1}, Lcom/google/android/gms/common/internal/f;->b(Lcom/google/android/gms/common/ConnectionResult;)V

    goto :goto_1

    :cond_3
    iget-object p0, p0, Lcom/google/android/gms/common/internal/e$h;->LF:Lcom/google/android/gms/common/internal/e;

    invoke-static {p0, v0}, Lcom/google/android/gms/common/internal/e;->a(Lcom/google/android/gms/common/internal/e;I)V

    new-instance p0, Ljava/lang/IllegalStateException;

    const-string p1, "A fatal developer error has occurred. Check the logs for further information."

    invoke-direct {p0, p1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw p0

    :cond_4
    :try_start_0
    iget-object p1, p0, Lcom/google/android/gms/common/internal/e$h;->LL:Landroid/os/IBinder;

    invoke-interface {p1}, Landroid/os/IBinder;->getInterfaceDescriptor()Ljava/lang/String;

    move-result-object p1

    iget-object v2, p0, Lcom/google/android/gms/common/internal/e$h;->LF:Lcom/google/android/gms/common/internal/e;

    invoke-virtual {v2}, Lcom/google/android/gms/common/internal/e;->getServiceDescriptor()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v2, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_5

    iget-object p1, p0, Lcom/google/android/gms/common/internal/e$h;->LF:Lcom/google/android/gms/common/internal/e;

    iget-object v2, p0, Lcom/google/android/gms/common/internal/e$h;->LL:Landroid/os/IBinder;

    invoke-virtual {p1, v2}, Lcom/google/android/gms/common/internal/e;->j(Landroid/os/IBinder;)Landroid/os/IInterface;

    move-result-object v2

    invoke-static {p1, v2}, Lcom/google/android/gms/common/internal/e;->a(Lcom/google/android/gms/common/internal/e;Landroid/os/IInterface;)Landroid/os/IInterface;

    iget-object p1, p0, Lcom/google/android/gms/common/internal/e$h;->LF:Lcom/google/android/gms/common/internal/e;

    invoke-static {p1}, Lcom/google/android/gms/common/internal/e;->c(Lcom/google/android/gms/common/internal/e;)Landroid/os/IInterface;

    move-result-object p1

    if-eqz p1, :cond_5

    iget-object p1, p0, Lcom/google/android/gms/common/internal/e$h;->LF:Lcom/google/android/gms/common/internal/e;

    const/4 v2, 0x3

    invoke-static {p1, v2}, Lcom/google/android/gms/common/internal/e;->a(Lcom/google/android/gms/common/internal/e;I)V

    iget-object p1, p0, Lcom/google/android/gms/common/internal/e$h;->LF:Lcom/google/android/gms/common/internal/e;

    invoke-static {p1}, Lcom/google/android/gms/common/internal/e;->a(Lcom/google/android/gms/common/internal/e;)Lcom/google/android/gms/common/internal/f;

    move-result-object p1

    invoke-virtual {p1}, Lcom/google/android/gms/common/internal/f;->dL()V
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    return-void

    :catch_0
    :cond_5
    iget-object p1, p0, Lcom/google/android/gms/common/internal/e$h;->LF:Lcom/google/android/gms/common/internal/e;

    invoke-static {p1}, Lcom/google/android/gms/common/internal/e;->e(Lcom/google/android/gms/common/internal/e;)Landroid/content/Context;

    move-result-object p1

    invoke-static {p1}, Lcom/google/android/gms/common/internal/g;->J(Landroid/content/Context;)Lcom/google/android/gms/common/internal/g;

    move-result-object p1

    iget-object v2, p0, Lcom/google/android/gms/common/internal/e$h;->LF:Lcom/google/android/gms/common/internal/e;

    invoke-virtual {v2}, Lcom/google/android/gms/common/internal/e;->getStartServiceAction()Ljava/lang/String;

    move-result-object v2

    iget-object v3, p0, Lcom/google/android/gms/common/internal/e$h;->LF:Lcom/google/android/gms/common/internal/e;

    invoke-static {v3}, Lcom/google/android/gms/common/internal/e;->d(Lcom/google/android/gms/common/internal/e;)Lcom/google/android/gms/common/internal/e$f;

    move-result-object v3

    invoke-virtual {p1, v2, v3}, Lcom/google/android/gms/common/internal/g;->b(Ljava/lang/String;Lcom/google/android/gms/common/internal/e$f;)V

    iget-object p1, p0, Lcom/google/android/gms/common/internal/e$h;->LF:Lcom/google/android/gms/common/internal/e;

    invoke-static {p1, v1}, Lcom/google/android/gms/common/internal/e;->a(Lcom/google/android/gms/common/internal/e;Lcom/google/android/gms/common/internal/e$f;)Lcom/google/android/gms/common/internal/e$f;

    iget-object p1, p0, Lcom/google/android/gms/common/internal/e$h;->LF:Lcom/google/android/gms/common/internal/e;

    invoke-static {p1, v0}, Lcom/google/android/gms/common/internal/e;->a(Lcom/google/android/gms/common/internal/e;I)V

    iget-object p1, p0, Lcom/google/android/gms/common/internal/e$h;->LF:Lcom/google/android/gms/common/internal/e;

    invoke-static {p1, v1}, Lcom/google/android/gms/common/internal/e;->a(Lcom/google/android/gms/common/internal/e;Landroid/os/IInterface;)Landroid/os/IInterface;

    iget-object p0, p0, Lcom/google/android/gms/common/internal/e$h;->LF:Lcom/google/android/gms/common/internal/e;

    invoke-static {p0}, Lcom/google/android/gms/common/internal/e;->a(Lcom/google/android/gms/common/internal/e;)Lcom/google/android/gms/common/internal/f;

    move-result-object p0

    new-instance p1, Lcom/google/android/gms/common/ConnectionResult;

    const/16 v0, 0x8

    invoke-direct {p1, v0, v1}, Lcom/google/android/gms/common/ConnectionResult;-><init>(ILandroid/app/PendingIntent;)V

    invoke-virtual {p0, p1}, Lcom/google/android/gms/common/internal/f;->b(Lcom/google/android/gms/common/ConnectionResult;)V

    :goto_1
    return-void
.end method

.method protected synthetic g(Ljava/lang/Object;)V
    .locals 0

    check-cast p1, Ljava/lang/Boolean;

    invoke-virtual {p0, p1}, Lcom/google/android/gms/common/internal/e$h;->b(Ljava/lang/Boolean;)V

    return-void
.end method

.method protected gT()V
    .locals 0

    return-void
.end method
