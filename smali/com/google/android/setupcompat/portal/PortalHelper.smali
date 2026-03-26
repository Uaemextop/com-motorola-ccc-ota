.class public Lcom/google/android/setupcompat/portal/PortalHelper;
.super Ljava/lang/Object;
.source "PortalHelper.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/google/android/setupcompat/portal/PortalHelper$RemainingValueBuilder;,
        Lcom/google/android/setupcompat/portal/PortalHelper$PortalAvailableResultListener;,
        Lcom/google/android/setupcompat/portal/PortalHelper$ProgressServiceAliveResultListener;,
        Lcom/google/android/setupcompat/portal/PortalHelper$RegisterNotificationCallback;,
        Lcom/google/android/setupcompat/portal/PortalHelper$RegisterCallback;
    }
.end annotation


# static fields
.field public static final ACTION_BIND_SETUP_NOTIFICATION_SERVICE:Ljava/lang/String; = "com.google.android.setupcompat.portal.SetupNotificationService.BIND"

.field public static final EXTRA_KEY_IS_SETUP_WIZARD:Ljava/lang/String; = "isSetupWizard"

.field private static final LOG:Lcom/google/android/setupcompat/util/Logger;

.field public static final NOTIFICATION_SERVICE_INTENT:Landroid/content/Intent;

.field public static final RESULT_BUNDLE_KEY_ERROR:Ljava/lang/String; = "Error"

.field public static final RESULT_BUNDLE_KEY_PORTAL_NOTIFICATION_AVAILABLE:Ljava/lang/String; = "PortalNotificationAvailable"

.field public static final RESULT_BUNDLE_KEY_RESULT:Ljava/lang/String; = "Result"


# direct methods
.method static constructor <clinit>()V
    .locals 2

    new-instance v0, Lcom/google/android/setupcompat/util/Logger;

    const-string v1, "PortalHelper"

    invoke-direct {v0, v1}, Lcom/google/android/setupcompat/util/Logger;-><init>(Ljava/lang/String;)V

    sput-object v0, Lcom/google/android/setupcompat/portal/PortalHelper;->LOG:Lcom/google/android/setupcompat/util/Logger;

    new-instance v0, Landroid/content/Intent;

    const-string v1, "com.google.android.setupcompat.portal.SetupNotificationService.BIND"

    invoke-direct {v0, v1}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    const-string v1, "com.google.android.setupwizard"

    invoke-virtual {v0, v1}, Landroid/content/Intent;->setPackage(Ljava/lang/String;)Landroid/content/Intent;

    move-result-object v0

    sput-object v0, Lcom/google/android/setupcompat/portal/PortalHelper;->NOTIFICATION_SERVICE_INTENT:Landroid/content/Intent;

    return-void
.end method

.method private constructor <init>()V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method static synthetic access$000()Landroid/os/UserHandle;
    .locals 1

    invoke-static {}, Lcom/google/android/setupcompat/portal/PortalHelper;->getCurrentUserHandle()Landroid/os/UserHandle;

    move-result-object v0

    return-object v0
.end method

.method static synthetic access$100()Lcom/google/android/setupcompat/util/Logger;
    .locals 1

    sget-object v0, Lcom/google/android/setupcompat/portal/PortalHelper;->LOG:Lcom/google/android/setupcompat/util/Logger;

    return-object v0
.end method

.method public static bindSetupNotificationService(Landroid/content/Context;Landroid/content/ServiceConnection;)Z
    .locals 2

    const-string v0, "Context cannot be null"

    invoke-static {p0, v0}, Lcom/google/android/setupcompat/internal/Preconditions;->checkNotNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    const-string v0, "ServiceConnection cannot be null"

    invoke-static {p1, v0}, Lcom/google/android/setupcompat/internal/Preconditions;->checkNotNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    :try_start_0
    sget-object v0, Lcom/google/android/setupcompat/portal/PortalHelper;->NOTIFICATION_SERVICE_INTENT:Landroid/content/Intent;

    const/4 v1, 0x1

    invoke-virtual {p0, v0, p1, v1}, Landroid/content/Context;->bindService(Landroid/content/Intent;Landroid/content/ServiceConnection;I)Z

    move-result p0
    :try_end_0
    .catch Ljava/lang/SecurityException; {:try_start_0 .. :try_end_0} :catch_0

    return p0

    :catch_0
    move-exception p0

    sget-object p1, Lcom/google/android/setupcompat/portal/PortalHelper;->LOG:Lcom/google/android/setupcompat/util/Logger;

    const-string v0, "Exception occurred while binding SetupNotificationService"

    invoke-virtual {p1, v0, p0}, Lcom/google/android/setupcompat/util/Logger;->e(Ljava/lang/String;Ljava/lang/Throwable;)V

    const/4 p0, 0x0

    return p0
.end method

.method public static createResultBundle(ZLjava/lang/String;Z)Landroid/os/Bundle;
    .locals 2

    new-instance v0, Landroid/os/Bundle;

    invoke-direct {v0}, Landroid/os/Bundle;-><init>()V

    const-string v1, "Result"

    invoke-virtual {v0, v1, p0}, Landroid/os/Bundle;->putBoolean(Ljava/lang/String;Z)V

    if-nez p0, :cond_0

    const-string p0, "Error"

    invoke-virtual {v0, p0, p1}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    :cond_0
    const-string p0, "PortalNotificationAvailable"

    invoke-virtual {v0, p0, p2}, Landroid/os/Bundle;->putBoolean(Ljava/lang/String;Z)V

    return-object v0
.end method

.method private static getCurrentUserHandle()Landroid/os/UserHandle;
    .locals 1

    invoke-static {}, Landroid/os/Process;->myUid()I

    move-result v0

    invoke-static {v0}, Landroid/os/UserHandle;->getUserHandleForUid(I)Landroid/os/UserHandle;

    move-result-object v0

    return-object v0
.end method

.method public static isFromSUW(Landroid/content/Intent;)Z
    .locals 2

    const/4 v0, 0x0

    if-eqz p0, :cond_0

    const-string v1, "isSetupWizard"

    invoke-virtual {p0, v1, v0}, Landroid/content/Intent;->getBooleanExtra(Ljava/lang/String;Z)Z

    move-result p0

    if-eqz p0, :cond_0

    const/4 v0, 0x1

    :cond_0
    return v0
.end method

.method public static isPortalAvailable(Landroid/content/Context;Lcom/google/android/setupcompat/portal/PortalHelper$PortalAvailableResultListener;)V
    .locals 1

    new-instance v0, Lcom/google/android/setupcompat/portal/PortalHelper$2;

    invoke-direct {v0, p1, p0}, Lcom/google/android/setupcompat/portal/PortalHelper$2;-><init>(Lcom/google/android/setupcompat/portal/PortalHelper$PortalAvailableResultListener;Landroid/content/Context;)V

    invoke-static {p0, v0}, Lcom/google/android/setupcompat/portal/PortalHelper;->bindSetupNotificationService(Landroid/content/Context;Landroid/content/ServiceConnection;)Z

    move-result p0

    if-nez p0, :cond_0

    sget-object p0, Lcom/google/android/setupcompat/portal/PortalHelper;->LOG:Lcom/google/android/setupcompat/util/Logger;

    const-string v0, "Failed to bind SetupNotificationService. Do you have permission \"com.google.android.setupwizard.SETUP_PROGRESS_SERVICE\""

    invoke-virtual {p0, v0}, Lcom/google/android/setupcompat/util/Logger;->e(Ljava/lang/String;)V

    const/4 p0, 0x0

    invoke-interface {p1, p0}, Lcom/google/android/setupcompat/portal/PortalHelper$PortalAvailableResultListener;->onResult(Z)V

    :cond_0
    return-void
.end method

.method public static isProgressServiceAlive(Landroid/content/Context;Lcom/google/android/setupcompat/portal/ProgressServiceComponent;Lcom/google/android/setupcompat/portal/PortalHelper$ProgressServiceAliveResultListener;)V
    .locals 1

    const-string v0, "Context cannot be null"

    invoke-static {p0, v0}, Lcom/google/android/setupcompat/internal/Preconditions;->checkNotNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    const-string v0, "ProgressServiceComponent cannot be null"

    invoke-static {p1, v0}, Lcom/google/android/setupcompat/internal/Preconditions;->checkNotNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    const-string v0, "ProgressServiceAliveResultCallback cannot be null"

    invoke-static {p2, v0}, Lcom/google/android/setupcompat/internal/Preconditions;->checkNotNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    new-instance v0, Lcom/google/android/setupcompat/portal/PortalHelper$3;

    invoke-direct {v0, p2, p1, p0}, Lcom/google/android/setupcompat/portal/PortalHelper$3;-><init>(Lcom/google/android/setupcompat/portal/PortalHelper$ProgressServiceAliveResultListener;Lcom/google/android/setupcompat/portal/ProgressServiceComponent;Landroid/content/Context;)V

    invoke-static {p0, v0}, Lcom/google/android/setupcompat/portal/PortalHelper;->bindSetupNotificationService(Landroid/content/Context;Landroid/content/ServiceConnection;)Z

    move-result p0

    if-nez p0, :cond_0

    sget-object p0, Lcom/google/android/setupcompat/portal/PortalHelper;->LOG:Lcom/google/android/setupcompat/util/Logger;

    const-string p1, "Failed to bind SetupNotificationService. Do you have permission \"com.google.android.setupwizard.SETUP_PROGRESS_SERVICE\""

    invoke-virtual {p0, p1}, Lcom/google/android/setupcompat/util/Logger;->e(Ljava/lang/String;)V

    const/4 p0, 0x0

    invoke-interface {p2, p0}, Lcom/google/android/setupcompat/portal/PortalHelper$ProgressServiceAliveResultListener;->onResult(Z)V

    :cond_0
    return-void
.end method

.method public static registerProgressService(Landroid/content/Context;Lcom/google/android/setupcompat/portal/ProgressServiceComponent;Lcom/google/android/setupcompat/portal/PortalHelper$RegisterCallback;)V
    .locals 1

    const-string v0, "Context cannot be null"

    invoke-static {p0, v0}, Lcom/google/android/setupcompat/internal/Preconditions;->checkNotNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    const-string v0, "ProgressServiceComponent cannot be null"

    invoke-static {p1, v0}, Lcom/google/android/setupcompat/internal/Preconditions;->checkNotNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    const-string v0, "RegisterCallback cannot be null"

    invoke-static {p2, v0}, Lcom/google/android/setupcompat/internal/Preconditions;->checkNotNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    new-instance v0, Lcom/google/android/setupcompat/portal/PortalHelper$1;

    invoke-direct {v0, p1, p2, p0}, Lcom/google/android/setupcompat/portal/PortalHelper$1;-><init>(Lcom/google/android/setupcompat/portal/ProgressServiceComponent;Lcom/google/android/setupcompat/portal/PortalHelper$RegisterCallback;Landroid/content/Context;)V

    invoke-static {p0, v0}, Lcom/google/android/setupcompat/portal/PortalHelper;->bindSetupNotificationService(Landroid/content/Context;Landroid/content/ServiceConnection;)Z

    move-result p0

    if-nez p0, :cond_0

    sget-object p0, Lcom/google/android/setupcompat/portal/PortalHelper;->LOG:Lcom/google/android/setupcompat/util/Logger;

    const-string p1, "Failed to bind SetupNotificationService."

    invoke-virtual {p0, p1}, Lcom/google/android/setupcompat/util/Logger;->e(Ljava/lang/String;)V

    new-instance p0, Ljava/lang/SecurityException;

    invoke-direct {p0, p1}, Ljava/lang/SecurityException;-><init>(Ljava/lang/String;)V

    invoke-interface {p2, p0}, Lcom/google/android/setupcompat/portal/PortalHelper$RegisterCallback;->onFailure(Ljava/lang/Throwable;)V

    :cond_0
    return-void
.end method
