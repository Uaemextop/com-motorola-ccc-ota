.class Lcom/google/android/gms/analytics/q$2;
.super Ljava/lang/Object;

# interfaces
.implements Landroid/os/Handler$Callback;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/google/android/gms/analytics/q;->eb()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic yp:Lcom/google/android/gms/analytics/q;


# direct methods
.method constructor <init>(Lcom/google/android/gms/analytics/q;)V
    .locals 0

    iput-object p1, p0, Lcom/google/android/gms/analytics/q$2;->yp:Lcom/google/android/gms/analytics/q;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public handleMessage(Landroid/os/Message;)Z
    .locals 4

    iget v0, p1, Landroid/os/Message;->what:I

    const/4 v1, 0x1

    if-ne v1, v0, :cond_0

    invoke-static {}, Lcom/google/android/gms/analytics/q;->ee()Ljava/lang/Object;

    move-result-object v0

    iget-object p1, p1, Landroid/os/Message;->obj:Ljava/lang/Object;

    invoke-virtual {v0, p1}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_0

    invoke-static {}, Lcom/google/android/gms/analytics/t;->ep()Lcom/google/android/gms/analytics/t;

    move-result-object p1

    invoke-virtual {p1, v1}, Lcom/google/android/gms/analytics/t;->B(Z)V

    iget-object p1, p0, Lcom/google/android/gms/analytics/q$2;->yp:Lcom/google/android/gms/analytics/q;

    invoke-virtual {p1}, Lcom/google/android/gms/analytics/q;->dispatchLocalHits()V

    invoke-static {}, Lcom/google/android/gms/analytics/t;->ep()Lcom/google/android/gms/analytics/t;

    move-result-object p1

    const/4 v0, 0x0

    invoke-virtual {p1, v0}, Lcom/google/android/gms/analytics/t;->B(Z)V

    iget-object p1, p0, Lcom/google/android/gms/analytics/q$2;->yp:Lcom/google/android/gms/analytics/q;

    invoke-static {p1}, Lcom/google/android/gms/analytics/q;->b(Lcom/google/android/gms/analytics/q;)I

    move-result p1

    if-lez p1, :cond_0

    iget-object p1, p0, Lcom/google/android/gms/analytics/q$2;->yp:Lcom/google/android/gms/analytics/q;

    invoke-static {p1}, Lcom/google/android/gms/analytics/q;->c(Lcom/google/android/gms/analytics/q;)Z

    move-result p1

    if-nez p1, :cond_0

    iget-object p1, p0, Lcom/google/android/gms/analytics/q$2;->yp:Lcom/google/android/gms/analytics/q;

    invoke-static {p1}, Lcom/google/android/gms/analytics/q;->d(Lcom/google/android/gms/analytics/q;)Landroid/os/Handler;

    move-result-object p1

    iget-object v0, p0, Lcom/google/android/gms/analytics/q$2;->yp:Lcom/google/android/gms/analytics/q;

    invoke-static {v0}, Lcom/google/android/gms/analytics/q;->d(Lcom/google/android/gms/analytics/q;)Landroid/os/Handler;

    move-result-object v0

    invoke-static {}, Lcom/google/android/gms/analytics/q;->ee()Ljava/lang/Object;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Landroid/os/Handler;->obtainMessage(ILjava/lang/Object;)Landroid/os/Message;

    move-result-object v0

    iget-object p0, p0, Lcom/google/android/gms/analytics/q$2;->yp:Lcom/google/android/gms/analytics/q;

    invoke-static {p0}, Lcom/google/android/gms/analytics/q;->b(Lcom/google/android/gms/analytics/q;)I

    move-result p0

    mul-int/lit16 p0, p0, 0x3e8

    int-to-long v2, p0

    invoke-virtual {p1, v0, v2, v3}, Landroid/os/Handler;->sendMessageDelayed(Landroid/os/Message;J)Z

    :cond_0
    return v1
.end method
