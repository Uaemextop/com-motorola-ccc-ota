.class Lcom/motorola/ccc/ota/env/CheckUpdateWorker$1;
.super Ljava/lang/Object;
.source "CheckUpdateWorker.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/motorola/ccc/ota/env/CheckUpdateWorker;->doWork()Landroidx/work/ListenableWorker$Result;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/motorola/ccc/ota/env/CheckUpdateWorker;

.field final synthetic val$context:Landroid/content/Context;

.field final synthetic val$pollingIntent:Landroid/content/Intent;


# direct methods
.method constructor <init>(Lcom/motorola/ccc/ota/env/CheckUpdateWorker;Landroid/content/Intent;Landroid/content/Context;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    iput-object p1, p0, Lcom/motorola/ccc/ota/env/CheckUpdateWorker$1;->this$0:Lcom/motorola/ccc/ota/env/CheckUpdateWorker;

    iput-object p2, p0, Lcom/motorola/ccc/ota/env/CheckUpdateWorker$1;->val$pollingIntent:Landroid/content/Intent;

    iput-object p3, p0, Lcom/motorola/ccc/ota/env/CheckUpdateWorker$1;->val$context:Landroid/content/Context;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 2

    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "CusSM.CheckUpdateWorker sending broadcast "

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v1, p0, Lcom/motorola/ccc/ota/env/CheckUpdateWorker$1;->val$pollingIntent:Landroid/content/Intent;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    const-string v1, "OtaApp"

    invoke-static {v1, v0}, Lcom/motorola/ccc/ota/utils/Logger;->debug(Ljava/lang/String;Ljava/lang/String;)V

    iget-object v0, p0, Lcom/motorola/ccc/ota/env/CheckUpdateWorker$1;->val$context:Landroid/content/Context;

    iget-object p0, p0, Lcom/motorola/ccc/ota/env/CheckUpdateWorker$1;->val$pollingIntent:Landroid/content/Intent;

    invoke-virtual {v0, p0}, Landroid/content/Context;->sendBroadcast(Landroid/content/Intent;)V

    return-void
.end method
