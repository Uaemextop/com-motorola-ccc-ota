.class Lcom/motorola/ccc/ota/ui/RestartFragment$2;
.super Ljava/lang/Object;
.source "RestartFragment.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/motorola/ccc/ota/ui/RestartFragment;->handleButtons()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/motorola/ccc/ota/ui/RestartFragment;


# direct methods
.method constructor <init>(Lcom/motorola/ccc/ota/ui/RestartFragment;)V
    .locals 0

    iput-object p1, p0, Lcom/motorola/ccc/ota/ui/RestartFragment$2;->this$0:Lcom/motorola/ccc/ota/ui/RestartFragment;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 5

    invoke-static {}, Lcom/motorola/ccc/ota/env/OtaApplication;->getGlobalContext()Landroid/content/Context;

    move-result-object p1

    sget-object v0, Ljava/util/concurrent/TimeUnit;->MILLISECONDS:Ljava/util/concurrent/TimeUnit;

    iget-object v1, p0, Lcom/motorola/ccc/ota/ui/RestartFragment$2;->this$0:Lcom/motorola/ccc/ota/ui/RestartFragment;

    invoke-static {v1}, Lcom/motorola/ccc/ota/ui/RestartFragment;->-$$Nest$fgetmNextPrompt(Lcom/motorola/ccc/ota/ui/RestartFragment;)J

    move-result-wide v1

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v3

    sub-long/2addr v1, v3

    invoke-virtual {v0, v1, v2}, Ljava/util/concurrent/TimeUnit;->toMinutes(J)J

    move-result-wide v0

    const-wide/16 v2, 0x1

    add-long/2addr v0, v2

    const-string v2, "RESTART_DEFERRED"

    const/4 v3, 0x0

    invoke-static {p1, v2, v3, v0, v1}, Lcom/motorola/ccc/ota/ui/UpdaterUtils;->setDeferStats(Landroid/content/Context;Ljava/lang/String;ZJ)V

    iget-object p1, p0, Lcom/motorola/ccc/ota/ui/RestartFragment$2;->this$0:Lcom/motorola/ccc/ota/ui/RestartFragment;

    const/4 v0, 0x1

    invoke-static {p1, v0}, Lcom/motorola/ccc/ota/ui/RestartFragment;->-$$Nest$fputmDoNotShowNotification(Lcom/motorola/ccc/ota/ui/RestartFragment;Z)V

    iget-object p1, p0, Lcom/motorola/ccc/ota/ui/RestartFragment$2;->this$0:Lcom/motorola/ccc/ota/ui/RestartFragment;

    invoke-virtual {p1}, Lcom/motorola/ccc/ota/ui/RestartFragment;->getResources()Landroid/content/res/Resources;

    move-result-object p1

    const v0, 0x7f0e016c

    invoke-virtual {p1, v0}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object p1

    iget-object v0, p0, Lcom/motorola/ccc/ota/ui/RestartFragment$2;->this$0:Lcom/motorola/ccc/ota/ui/RestartFragment;

    invoke-static {v0}, Lcom/motorola/ccc/ota/ui/RestartFragment;->-$$Nest$fgetmRebootLater(Lcom/motorola/ccc/ota/ui/RestartFragment;)Landroid/widget/Button;

    move-result-object v0

    invoke-virtual {v0}, Landroid/widget/Button;->getText()Ljava/lang/CharSequence;

    move-result-object v0

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_0

    iget-object p0, p0, Lcom/motorola/ccc/ota/ui/RestartFragment$2;->this$0:Lcom/motorola/ccc/ota/ui/RestartFragment;

    invoke-static {p0}, Lcom/motorola/ccc/ota/ui/RestartFragment;->-$$Nest$mhandleCriticalUpdateExtendRestart(Lcom/motorola/ccc/ota/ui/RestartFragment;)V

    goto :goto_0

    :cond_0
    invoke-static {}, Lcom/motorola/ccc/ota/utils/BuildPropReader;->isATT()Z

    move-result p1

    if-nez p1, :cond_1

    iget-object p1, p0, Lcom/motorola/ccc/ota/ui/RestartFragment$2;->this$0:Lcom/motorola/ccc/ota/ui/RestartFragment;

    invoke-static {p1, v3}, Lcom/motorola/ccc/ota/ui/RestartFragment;->-$$Nest$fputmDoNotShowNotification(Lcom/motorola/ccc/ota/ui/RestartFragment;Z)V

    :cond_1
    iget-object p1, p0, Lcom/motorola/ccc/ota/ui/RestartFragment$2;->this$0:Lcom/motorola/ccc/ota/ui/RestartFragment;

    invoke-static {p1}, Lcom/motorola/ccc/ota/ui/RestartFragment;->-$$Nest$fgetmPromptCount(Lcom/motorola/ccc/ota/ui/RestartFragment;)I

    move-result p1

    const/4 v0, 0x5

    if-lt p1, v0, :cond_2

    iget-object p0, p0, Lcom/motorola/ccc/ota/ui/RestartFragment$2;->this$0:Lcom/motorola/ccc/ota/ui/RestartFragment;

    invoke-static {p0}, Lcom/motorola/ccc/ota/ui/RestartFragment;->-$$Nest$mshowTrySmartUpdatePopUp(Lcom/motorola/ccc/ota/ui/RestartFragment;)V

    goto :goto_0

    :cond_2
    iget-object p0, p0, Lcom/motorola/ccc/ota/ui/RestartFragment$2;->this$0:Lcom/motorola/ccc/ota/ui/RestartFragment;

    invoke-static {p0}, Lcom/motorola/ccc/ota/ui/RestartFragment;->-$$Nest$fgetactivity(Lcom/motorola/ccc/ota/ui/RestartFragment;)Landroid/app/Activity;

    move-result-object p0

    invoke-virtual {p0}, Landroid/app/Activity;->finish()V

    :goto_0
    return-void
.end method
