.class final Lcom/google/android/gms/analytics/c$a;
.super Ljava/lang/Object;

# interfaces
.implements Landroid/content/ServiceConnection;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/google/android/gms/analytics/c;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x10
    name = "a"
.end annotation


# instance fields
.field final synthetic xK:Lcom/google/android/gms/analytics/c;


# direct methods
.method constructor <init>(Lcom/google/android/gms/analytics/c;)V
    .locals 0

    iput-object p1, p0, Lcom/google/android/gms/analytics/c$a;->xK:Lcom/google/android/gms/analytics/c;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onServiceConnected(Landroid/content/ComponentName;Landroid/os/IBinder;)V
    .locals 1

    new-instance p1, Ljava/lang/StringBuilder;

    const-string v0, "service connected, binder: "

    invoke-direct {p1, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {p1}, Lcom/google/android/gms/analytics/z;->V(Ljava/lang/String;)V

    :try_start_0
    invoke-interface {p2}, Landroid/os/IBinder;->getInterfaceDescriptor()Ljava/lang/String;

    move-result-object p1

    const-string v0, "com.google.android.gms.analytics.internal.IAnalyticsService"

    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_0

    const-string p1, "bound to service"

    invoke-static {p1}, Lcom/google/android/gms/analytics/z;->V(Ljava/lang/String;)V

    iget-object p1, p0, Lcom/google/android/gms/analytics/c$a;->xK:Lcom/google/android/gms/analytics/c;

    invoke-static {p2}, Lcom/google/android/gms/internal/hc$a;->E(Landroid/os/IBinder;)Lcom/google/android/gms/internal/hc;

    move-result-object p2

    invoke-static {p1, p2}, Lcom/google/android/gms/analytics/c;->a(Lcom/google/android/gms/analytics/c;Lcom/google/android/gms/internal/hc;)Lcom/google/android/gms/internal/hc;

    iget-object p1, p0, Lcom/google/android/gms/analytics/c$a;->xK:Lcom/google/android/gms/analytics/c;

    invoke-static {p1}, Lcom/google/android/gms/analytics/c;->a(Lcom/google/android/gms/analytics/c;)V
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    return-void

    :catch_0
    :cond_0
    :try_start_1
    iget-object p1, p0, Lcom/google/android/gms/analytics/c$a;->xK:Lcom/google/android/gms/analytics/c;

    invoke-static {p1}, Lcom/google/android/gms/analytics/c;->b(Lcom/google/android/gms/analytics/c;)Landroid/content/Context;

    move-result-object p1

    invoke-virtual {p1, p0}, Landroid/content/Context;->unbindService(Landroid/content/ServiceConnection;)V
    :try_end_1
    .catch Ljava/lang/IllegalArgumentException; {:try_start_1 .. :try_end_1} :catch_1

    :catch_1
    iget-object p1, p0, Lcom/google/android/gms/analytics/c$a;->xK:Lcom/google/android/gms/analytics/c;

    const/4 p2, 0x0

    invoke-static {p1, p2}, Lcom/google/android/gms/analytics/c;->a(Lcom/google/android/gms/analytics/c;Landroid/content/ServiceConnection;)Landroid/content/ServiceConnection;

    iget-object p0, p0, Lcom/google/android/gms/analytics/c$a;->xK:Lcom/google/android/gms/analytics/c;

    invoke-static {p0}, Lcom/google/android/gms/analytics/c;->c(Lcom/google/android/gms/analytics/c;)Lcom/google/android/gms/analytics/c$c;

    move-result-object p0

    const/4 p1, 0x2

    invoke-interface {p0, p1, p2}, Lcom/google/android/gms/analytics/c$c;->a(ILandroid/content/Intent;)V

    return-void
.end method

.method public onServiceDisconnected(Landroid/content/ComponentName;)V
    .locals 2

    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "service disconnected: "

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {p1}, Lcom/google/android/gms/analytics/z;->V(Ljava/lang/String;)V

    iget-object p1, p0, Lcom/google/android/gms/analytics/c$a;->xK:Lcom/google/android/gms/analytics/c;

    const/4 v0, 0x0

    invoke-static {p1, v0}, Lcom/google/android/gms/analytics/c;->a(Lcom/google/android/gms/analytics/c;Landroid/content/ServiceConnection;)Landroid/content/ServiceConnection;

    iget-object p0, p0, Lcom/google/android/gms/analytics/c$a;->xK:Lcom/google/android/gms/analytics/c;

    invoke-static {p0}, Lcom/google/android/gms/analytics/c;->d(Lcom/google/android/gms/analytics/c;)Lcom/google/android/gms/analytics/c$b;

    move-result-object p0

    invoke-interface {p0}, Lcom/google/android/gms/analytics/c$b;->onDisconnected()V

    return-void
.end method
