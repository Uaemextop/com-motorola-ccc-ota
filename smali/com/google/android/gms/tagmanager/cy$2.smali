.class Lcom/google/android/gms/tagmanager/cy$2;
.super Ljava/lang/Object;

# interfaces
.implements Landroid/os/Handler$Callback;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/google/android/gms/tagmanager/cy;->eb()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic arB:Lcom/google/android/gms/tagmanager/cy;


# direct methods
.method constructor <init>(Lcom/google/android/gms/tagmanager/cy;)V
    .locals 0

    iput-object p1, p0, Lcom/google/android/gms/tagmanager/cy$2;->arB:Lcom/google/android/gms/tagmanager/cy;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public handleMessage(Landroid/os/Message;)Z
    .locals 4

    iget v0, p1, Landroid/os/Message;->what:I

    const/4 v1, 0x1

    if-ne v1, v0, :cond_0

    invoke-static {}, Lcom/google/android/gms/tagmanager/cy;->ee()Ljava/lang/Object;

    move-result-object v0

    iget-object p1, p1, Landroid/os/Message;->obj:Ljava/lang/Object;

    invoke-virtual {v0, p1}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_0

    iget-object p1, p0, Lcom/google/android/gms/tagmanager/cy$2;->arB:Lcom/google/android/gms/tagmanager/cy;

    invoke-virtual {p1}, Lcom/google/android/gms/tagmanager/cy;->dispatch()V

    iget-object p1, p0, Lcom/google/android/gms/tagmanager/cy$2;->arB:Lcom/google/android/gms/tagmanager/cy;

    invoke-static {p1}, Lcom/google/android/gms/tagmanager/cy;->b(Lcom/google/android/gms/tagmanager/cy;)I

    move-result p1

    if-lez p1, :cond_0

    iget-object p1, p0, Lcom/google/android/gms/tagmanager/cy$2;->arB:Lcom/google/android/gms/tagmanager/cy;

    invoke-static {p1}, Lcom/google/android/gms/tagmanager/cy;->c(Lcom/google/android/gms/tagmanager/cy;)Z

    move-result p1

    if-nez p1, :cond_0

    iget-object p1, p0, Lcom/google/android/gms/tagmanager/cy$2;->arB:Lcom/google/android/gms/tagmanager/cy;

    invoke-static {p1}, Lcom/google/android/gms/tagmanager/cy;->d(Lcom/google/android/gms/tagmanager/cy;)Landroid/os/Handler;

    move-result-object p1

    iget-object v0, p0, Lcom/google/android/gms/tagmanager/cy$2;->arB:Lcom/google/android/gms/tagmanager/cy;

    invoke-static {v0}, Lcom/google/android/gms/tagmanager/cy;->d(Lcom/google/android/gms/tagmanager/cy;)Landroid/os/Handler;

    move-result-object v0

    invoke-static {}, Lcom/google/android/gms/tagmanager/cy;->ee()Ljava/lang/Object;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Landroid/os/Handler;->obtainMessage(ILjava/lang/Object;)Landroid/os/Message;

    move-result-object v0

    iget-object p0, p0, Lcom/google/android/gms/tagmanager/cy$2;->arB:Lcom/google/android/gms/tagmanager/cy;

    invoke-static {p0}, Lcom/google/android/gms/tagmanager/cy;->b(Lcom/google/android/gms/tagmanager/cy;)I

    move-result p0

    int-to-long v2, p0

    invoke-virtual {p1, v0, v2, v3}, Landroid/os/Handler;->sendMessageDelayed(Landroid/os/Message;J)Z

    :cond_0
    return v1
.end method
