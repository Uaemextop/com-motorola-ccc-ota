.class Lcom/motorola/ccc/ota/env/AndroidPollingManager$MyIntentReceiver;
.super Landroid/content/BroadcastReceiver;
.source "AndroidPollingManager.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/motorola/ccc/ota/env/AndroidPollingManager;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "MyIntentReceiver"
.end annotation


# instance fields
.field final synthetic this$0:Lcom/motorola/ccc/ota/env/AndroidPollingManager;


# direct methods
.method private constructor <init>(Lcom/motorola/ccc/ota/env/AndroidPollingManager;)V
    .locals 0

    iput-object p1, p0, Lcom/motorola/ccc/ota/env/AndroidPollingManager$MyIntentReceiver;->this$0:Lcom/motorola/ccc/ota/env/AndroidPollingManager;

    invoke-direct {p0}, Landroid/content/BroadcastReceiver;-><init>()V

    return-void
.end method

.method synthetic constructor <init>(Lcom/motorola/ccc/ota/env/AndroidPollingManager;Lcom/motorola/ccc/ota/env/AndroidPollingManager$MyIntentReceiver-IA;)V
    .locals 0

    invoke-direct {p0, p1}, Lcom/motorola/ccc/ota/env/AndroidPollingManager$MyIntentReceiver;-><init>(Lcom/motorola/ccc/ota/env/AndroidPollingManager;)V

    return-void
.end method


# virtual methods
.method public onReceive(Landroid/content/Context;Landroid/content/Intent;)V
    .locals 1

    new-instance p1, Ljava/lang/StringBuilder;

    const-string v0, "AndroidPollingManager.handleIntent: "

    invoke-direct {p1, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p2}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    const-string v0, "OtaApp"

    invoke-static {v0, p1}, Lcom/motorola/ccc/ota/utils/Logger;->debug(Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {p2}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object p1

    const-string p2, "com.motorola.blur.service.blur.upgrade_poll"

    invoke-virtual {p1, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_0

    iget-object p0, p0, Lcom/motorola/ccc/ota/env/AndroidPollingManager$MyIntentReceiver;->this$0:Lcom/motorola/ccc/ota/env/AndroidPollingManager;

    invoke-static {p0}, Lcom/motorola/ccc/ota/env/AndroidPollingManager;->-$$Nest$mconfigurePolling(Lcom/motorola/ccc/ota/env/AndroidPollingManager;)V

    :cond_0
    return-void
.end method
