.class Lcom/google/android/setupcompat/portal/PortalHelper$1$1;
.super Lcom/google/android/setupcompat/portal/IPortalRegisterResultListener$Stub;
.source "PortalHelper.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/google/android/setupcompat/portal/PortalHelper$1;->onServiceConnected(Landroid/content/ComponentName;Landroid/os/IBinder;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/google/android/setupcompat/portal/PortalHelper$1;

.field final synthetic val$serviceConnection:Landroid/content/ServiceConnection;


# direct methods
.method constructor <init>(Lcom/google/android/setupcompat/portal/PortalHelper$1;Landroid/content/ServiceConnection;)V
    .locals 0

    iput-object p1, p0, Lcom/google/android/setupcompat/portal/PortalHelper$1$1;->this$0:Lcom/google/android/setupcompat/portal/PortalHelper$1;

    iput-object p2, p0, Lcom/google/android/setupcompat/portal/PortalHelper$1$1;->val$serviceConnection:Landroid/content/ServiceConnection;

    invoke-direct {p0}, Lcom/google/android/setupcompat/portal/IPortalRegisterResultListener$Stub;-><init>()V

    return-void
.end method


# virtual methods
.method public onResult(Landroid/os/Bundle;)V
    .locals 4

    const-string v0, "Result"

    const/4 v1, 0x0

    invoke-virtual {p1, v0, v1}, Landroid/os/Bundle;->getBoolean(Ljava/lang/String;Z)Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/google/android/setupcompat/portal/PortalHelper$1$1;->this$0:Lcom/google/android/setupcompat/portal/PortalHelper$1;

    iget-object v0, v0, Lcom/google/android/setupcompat/portal/PortalHelper$1;->val$callback:Lcom/google/android/setupcompat/portal/PortalHelper$RegisterCallback;

    const-string v2, "PortalNotificationAvailable"

    invoke-virtual {p1, v2, v1}, Landroid/os/Bundle;->getBoolean(Ljava/lang/String;Z)Z

    move-result p1

    invoke-interface {v0, p1}, Lcom/google/android/setupcompat/portal/PortalHelper$RegisterCallback;->onSuccess(Z)V

    goto :goto_0

    :cond_0
    iget-object v0, p0, Lcom/google/android/setupcompat/portal/PortalHelper$1$1;->this$0:Lcom/google/android/setupcompat/portal/PortalHelper$1;

    iget-object v0, v0, Lcom/google/android/setupcompat/portal/PortalHelper$1;->val$callback:Lcom/google/android/setupcompat/portal/PortalHelper$RegisterCallback;

    new-instance v1, Ljava/lang/IllegalStateException;

    const-string v2, "Error"

    const-string v3, "Unknown error"

    invoke-virtual {p1, v2, v3}, Landroid/os/Bundle;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    invoke-direct {v1, p1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    invoke-interface {v0, v1}, Lcom/google/android/setupcompat/portal/PortalHelper$RegisterCallback;->onFailure(Ljava/lang/Throwable;)V

    :goto_0
    iget-object p1, p0, Lcom/google/android/setupcompat/portal/PortalHelper$1$1;->this$0:Lcom/google/android/setupcompat/portal/PortalHelper$1;

    iget-object p1, p1, Lcom/google/android/setupcompat/portal/PortalHelper$1;->val$context:Landroid/content/Context;

    iget-object p0, p0, Lcom/google/android/setupcompat/portal/PortalHelper$1$1;->val$serviceConnection:Landroid/content/ServiceConnection;

    invoke-virtual {p1, p0}, Landroid/content/Context;->unbindService(Landroid/content/ServiceConnection;)V

    return-void
.end method
