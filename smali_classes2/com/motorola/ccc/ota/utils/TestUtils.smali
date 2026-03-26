.class public Lcom/motorola/ccc/ota/utils/TestUtils;
.super Ljava/lang/Object;
.source "TestUtils.java"


# static fields
.field private static CLIENT_STATE:Ljava/lang/String; = "client_state_name"

.field private static SEND_STATE_RESPONSE:Ljava/lang/String; = "com.motorola.ccc.ota.CusAndroidUtils.SEND_STATE_RESPONSE"


# direct methods
.method static constructor <clinit>()V
    .locals 0

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static collectCrashDump()V
    .locals 5

    invoke-static {}, Lcom/motorola/otalib/common/utils/BuildPropertyUtils;->isDogfoodDevice()Z

    move-result v0

    if-nez v0, :cond_0

    return-void

    :cond_0
    invoke-static {}, Lcom/motorola/ccc/ota/env/OtaApplication;->getScheduledExecutorService()Ljava/util/concurrent/ScheduledExecutorService;

    move-result-object v0

    new-instance v1, Lcom/motorola/ccc/ota/utils/TestUtils$1;

    invoke-direct {v1}, Lcom/motorola/ccc/ota/utils/TestUtils$1;-><init>()V

    const-wide/16 v2, 0x14

    sget-object v4, Ljava/util/concurrent/TimeUnit;->SECONDS:Ljava/util/concurrent/TimeUnit;

    invoke-interface {v0, v1, v2, v3, v4}, Ljava/util/concurrent/ScheduledExecutorService;->schedule(Ljava/lang/Runnable;JLjava/util/concurrent/TimeUnit;)Ljava/util/concurrent/ScheduledFuture;

    return-void
.end method

.method public static final sendStateResponse(Landroid/content/Context;Ljava/lang/String;)V
    .locals 2

    invoke-static {}, Lcom/motorola/otalib/common/utils/BuildPropertyUtils;->isDogfoodDevice()Z

    move-result v0

    if-nez v0, :cond_0

    return-void

    :cond_0
    new-instance v0, Landroid/content/Intent;

    sget-object v1, Lcom/motorola/ccc/ota/utils/TestUtils;->SEND_STATE_RESPONSE:Ljava/lang/String;

    invoke-direct {v0, v1}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    sget-object v1, Lcom/motorola/ccc/ota/utils/TestUtils;->CLIENT_STATE:Ljava/lang/String;

    invoke-virtual {v0, v1, p1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    const-string p1, "com.motorola.ccc.ota.Permissions.INTERACT_OTA_SERVICE"

    invoke-virtual {p0, v0, p1}, Landroid/content/Context;->sendBroadcast(Landroid/content/Intent;Ljava/lang/String;)V

    return-void
.end method
