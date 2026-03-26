.class Lcom/motorola/ccc/ota/env/OobSetupCompletionObserver$MessageHandler;
.super Landroid/os/Handler;
.source "OobSetupCompletionObserver.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/motorola/ccc/ota/env/OobSetupCompletionObserver;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "MessageHandler"
.end annotation


# instance fields
.field final synthetic this$0:Lcom/motorola/ccc/ota/env/OobSetupCompletionObserver;


# direct methods
.method public constructor <init>(Lcom/motorola/ccc/ota/env/OobSetupCompletionObserver;)V
    .locals 0

    iput-object p1, p0, Lcom/motorola/ccc/ota/env/OobSetupCompletionObserver$MessageHandler;->this$0:Lcom/motorola/ccc/ota/env/OobSetupCompletionObserver;

    invoke-direct {p0}, Landroid/os/Handler;-><init>()V

    return-void
.end method

.method public constructor <init>(Lcom/motorola/ccc/ota/env/OobSetupCompletionObserver;Landroid/os/Looper;)V
    .locals 0

    iput-object p1, p0, Lcom/motorola/ccc/ota/env/OobSetupCompletionObserver$MessageHandler;->this$0:Lcom/motorola/ccc/ota/env/OobSetupCompletionObserver;

    invoke-direct {p0, p2}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    return-void
.end method


# virtual methods
.method public handleMessage(Landroid/os/Message;)V
    .locals 2

    invoke-super {p0, p1}, Landroid/os/Handler;->handleMessage(Landroid/os/Message;)V

    iget p1, p1, Landroid/os/Message;->what:I

    if-eqz p1, :cond_1

    const/4 v0, 0x1

    if-eq p1, v0, :cond_0

    goto :goto_1

    :cond_0
    iget-object p1, p0, Lcom/motorola/ccc/ota/env/OobSetupCompletionObserver$MessageHandler;->this$0:Lcom/motorola/ccc/ota/env/OobSetupCompletionObserver;

    invoke-static {p1}, Lcom/motorola/ccc/ota/env/OobSetupCompletionObserver;->-$$Nest$mgetSetupCompletedStatus(Lcom/motorola/ccc/ota/env/OobSetupCompletionObserver;)I

    move-result p1

    if-ne p1, v0, :cond_2

    :try_start_0
    invoke-static {}, Lcom/motorola/ccc/ota/env/OobSetupCompletionObserver;->-$$Nest$sfgetmCtx()Landroid/content/Context;

    move-result-object p1

    invoke-virtual {p1}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object p1

    iget-object v0, p0, Lcom/motorola/ccc/ota/env/OobSetupCompletionObserver$MessageHandler;->this$0:Lcom/motorola/ccc/ota/env/OobSetupCompletionObserver;

    invoke-static {v0}, Lcom/motorola/ccc/ota/env/OobSetupCompletionObserver;->-$$Nest$fgetmContentObserver(Lcom/motorola/ccc/ota/env/OobSetupCompletionObserver;)Landroid/database/ContentObserver;

    move-result-object v0

    invoke-virtual {p1, v0}, Landroid/content/ContentResolver;->unregisterContentObserver(Landroid/database/ContentObserver;)V
    :try_end_0
    .catch Ljava/lang/NullPointerException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception p1

    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "OobSetupCompletionObserver: unregister failed."

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    const-string v0, "OtaApp"

    invoke-static {v0, p1}, Lcom/motorola/ccc/ota/utils/Logger;->error(Ljava/lang/String;Ljava/lang/String;)V

    :goto_0
    iget-object p0, p0, Lcom/motorola/ccc/ota/env/OobSetupCompletionObserver$MessageHandler;->this$0:Lcom/motorola/ccc/ota/env/OobSetupCompletionObserver;

    invoke-static {p0}, Lcom/motorola/ccc/ota/env/OobSetupCompletionObserver;->-$$Nest$fgetmMessageHandler(Lcom/motorola/ccc/ota/env/OobSetupCompletionObserver;)Lcom/motorola/ccc/ota/env/OobSetupCompletionObserver$MessageHandler;

    move-result-object p0

    const/4 p1, 0x0

    invoke-virtual {p0, p1}, Lcom/motorola/ccc/ota/env/OobSetupCompletionObserver$MessageHandler;->sendEmptyMessage(I)Z

    goto :goto_1

    :cond_1
    invoke-static {}, Lcom/motorola/ccc/ota/env/OobSetupCompletionObserver;->-$$Nest$sfgetmCtx()Landroid/content/Context;

    move-result-object p0

    invoke-static {p0}, Lcom/motorola/ccc/ota/env/CusAndroidUtils;->postSetupCompleted(Landroid/content/Context;)V

    :cond_2
    :goto_1
    return-void
.end method
