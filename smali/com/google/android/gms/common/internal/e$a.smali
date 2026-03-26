.class final Lcom/google/android/gms/common/internal/e$a;
.super Landroid/os/Handler;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/google/android/gms/common/internal/e;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x10
    name = "a"
.end annotation


# instance fields
.field final synthetic LF:Lcom/google/android/gms/common/internal/e;


# direct methods
.method public constructor <init>(Lcom/google/android/gms/common/internal/e;Landroid/os/Looper;)V
    .locals 0

    iput-object p1, p0, Lcom/google/android/gms/common/internal/e$a;->LF:Lcom/google/android/gms/common/internal/e;

    invoke-direct {p0, p2}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    return-void
.end method


# virtual methods
.method public handleMessage(Landroid/os/Message;)V
    .locals 4

    iget v0, p1, Landroid/os/Message;->what:I

    const/4 v1, 0x1

    if-ne v0, v1, :cond_0

    iget-object v0, p0, Lcom/google/android/gms/common/internal/e$a;->LF:Lcom/google/android/gms/common/internal/e;

    invoke-virtual {v0}, Lcom/google/android/gms/common/internal/e;->isConnecting()Z

    move-result v0

    if-nez v0, :cond_0

    iget-object p0, p1, Landroid/os/Message;->obj:Ljava/lang/Object;

    check-cast p0, Lcom/google/android/gms/common/internal/e$b;

    invoke-virtual {p0}, Lcom/google/android/gms/common/internal/e$b;->gT()V

    invoke-virtual {p0}, Lcom/google/android/gms/common/internal/e$b;->unregister()V

    return-void

    :cond_0
    iget v0, p1, Landroid/os/Message;->what:I

    const/4 v2, 0x3

    const/4 v3, 0x0

    if-ne v0, v2, :cond_1

    iget-object p0, p0, Lcom/google/android/gms/common/internal/e$a;->LF:Lcom/google/android/gms/common/internal/e;

    invoke-static {p0}, Lcom/google/android/gms/common/internal/e;->a(Lcom/google/android/gms/common/internal/e;)Lcom/google/android/gms/common/internal/f;

    move-result-object p0

    new-instance v0, Lcom/google/android/gms/common/ConnectionResult;

    iget-object p1, p1, Landroid/os/Message;->obj:Ljava/lang/Object;

    check-cast p1, Ljava/lang/Integer;

    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    move-result p1

    invoke-direct {v0, p1, v3}, Lcom/google/android/gms/common/ConnectionResult;-><init>(ILandroid/app/PendingIntent;)V

    invoke-virtual {p0, v0}, Lcom/google/android/gms/common/internal/f;->b(Lcom/google/android/gms/common/ConnectionResult;)V

    return-void

    :cond_1
    iget v0, p1, Landroid/os/Message;->what:I

    const/4 v2, 0x4

    if-ne v0, v2, :cond_2

    iget-object v0, p0, Lcom/google/android/gms/common/internal/e$a;->LF:Lcom/google/android/gms/common/internal/e;

    invoke-static {v0, v1}, Lcom/google/android/gms/common/internal/e;->a(Lcom/google/android/gms/common/internal/e;I)V

    iget-object v0, p0, Lcom/google/android/gms/common/internal/e$a;->LF:Lcom/google/android/gms/common/internal/e;

    invoke-static {v0, v3}, Lcom/google/android/gms/common/internal/e;->a(Lcom/google/android/gms/common/internal/e;Landroid/os/IInterface;)Landroid/os/IInterface;

    iget-object p0, p0, Lcom/google/android/gms/common/internal/e$a;->LF:Lcom/google/android/gms/common/internal/e;

    invoke-static {p0}, Lcom/google/android/gms/common/internal/e;->a(Lcom/google/android/gms/common/internal/e;)Lcom/google/android/gms/common/internal/f;

    move-result-object p0

    iget-object p1, p1, Landroid/os/Message;->obj:Ljava/lang/Object;

    check-cast p1, Ljava/lang/Integer;

    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    move-result p1

    invoke-virtual {p0, p1}, Lcom/google/android/gms/common/internal/f;->aB(I)V

    return-void

    :cond_2
    iget v0, p1, Landroid/os/Message;->what:I

    const/4 v2, 0x2

    if-ne v0, v2, :cond_3

    iget-object p0, p0, Lcom/google/android/gms/common/internal/e$a;->LF:Lcom/google/android/gms/common/internal/e;

    invoke-virtual {p0}, Lcom/google/android/gms/common/internal/e;->isConnected()Z

    move-result p0

    if-nez p0, :cond_3

    iget-object p0, p1, Landroid/os/Message;->obj:Ljava/lang/Object;

    check-cast p0, Lcom/google/android/gms/common/internal/e$b;

    invoke-virtual {p0}, Lcom/google/android/gms/common/internal/e$b;->gT()V

    invoke-virtual {p0}, Lcom/google/android/gms/common/internal/e$b;->unregister()V

    return-void

    :cond_3
    iget p0, p1, Landroid/os/Message;->what:I

    if-eq p0, v2, :cond_5

    iget p0, p1, Landroid/os/Message;->what:I

    if-ne p0, v1, :cond_4

    goto :goto_0

    :cond_4
    const-string p0, "GmsClient"

    const-string p1, "Don\'t know how to handle this message."

    invoke-static {p0, p1}, Landroid/util/Log;->wtf(Ljava/lang/String;Ljava/lang/String;)I

    return-void

    :cond_5
    :goto_0
    iget-object p0, p1, Landroid/os/Message;->obj:Ljava/lang/Object;

    check-cast p0, Lcom/google/android/gms/common/internal/e$b;

    invoke-virtual {p0}, Lcom/google/android/gms/common/internal/e$b;->gU()V

    return-void
.end method
