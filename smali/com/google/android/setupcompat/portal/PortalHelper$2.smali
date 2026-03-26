.class Lcom/google/android/setupcompat/portal/PortalHelper$2;
.super Ljava/lang/Object;
.source "PortalHelper.java"

# interfaces
.implements Landroid/content/ServiceConnection;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/google/android/setupcompat/portal/PortalHelper;->isPortalAvailable(Landroid/content/Context;Lcom/google/android/setupcompat/portal/PortalHelper$PortalAvailableResultListener;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic val$context:Landroid/content/Context;

.field final synthetic val$listener:Lcom/google/android/setupcompat/portal/PortalHelper$PortalAvailableResultListener;


# direct methods
.method constructor <init>(Lcom/google/android/setupcompat/portal/PortalHelper$PortalAvailableResultListener;Landroid/content/Context;)V
    .locals 0

    iput-object p1, p0, Lcom/google/android/setupcompat/portal/PortalHelper$2;->val$listener:Lcom/google/android/setupcompat/portal/PortalHelper$PortalAvailableResultListener;

    iput-object p2, p0, Lcom/google/android/setupcompat/portal/PortalHelper$2;->val$context:Landroid/content/Context;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onServiceConnected(Landroid/content/ComponentName;Landroid/os/IBinder;)V
    .locals 0

    if-eqz p2, :cond_0

    invoke-static {p2}, Lcom/google/android/setupcompat/portal/ISetupNotificationService$Stub;->asInterface(Landroid/os/IBinder;)Lcom/google/android/setupcompat/portal/ISetupNotificationService;

    move-result-object p1

    :try_start_0
    iget-object p2, p0, Lcom/google/android/setupcompat/portal/PortalHelper$2;->val$listener:Lcom/google/android/setupcompat/portal/PortalHelper$PortalAvailableResultListener;

    invoke-interface {p1}, Lcom/google/android/setupcompat/portal/ISetupNotificationService;->isPortalAvailable()Z

    move-result p1

    invoke-interface {p2, p1}, Lcom/google/android/setupcompat/portal/PortalHelper$PortalAvailableResultListener;->onResult(Z)V
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    invoke-static {}, Lcom/google/android/setupcompat/portal/PortalHelper;->access$100()Lcom/google/android/setupcompat/util/Logger;

    move-result-object p1

    const-string p2, "Failed to invoke SetupNotificationService#isPortalAvailable"

    invoke-virtual {p1, p2}, Lcom/google/android/setupcompat/util/Logger;->e(Ljava/lang/String;)V

    iget-object p1, p0, Lcom/google/android/setupcompat/portal/PortalHelper$2;->val$listener:Lcom/google/android/setupcompat/portal/PortalHelper$PortalAvailableResultListener;

    const/4 p2, 0x0

    invoke-interface {p1, p2}, Lcom/google/android/setupcompat/portal/PortalHelper$PortalAvailableResultListener;->onResult(Z)V

    :cond_0
    :goto_0
    iget-object p1, p0, Lcom/google/android/setupcompat/portal/PortalHelper$2;->val$context:Landroid/content/Context;

    invoke-virtual {p1, p0}, Landroid/content/Context;->unbindService(Landroid/content/ServiceConnection;)V

    return-void
.end method

.method public onServiceDisconnected(Landroid/content/ComponentName;)V
    .locals 0

    return-void
.end method
