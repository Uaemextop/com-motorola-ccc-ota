.class Lcom/motorola/ccc/ota/ui/DownloadFragment$5;
.super Landroid/content/BroadcastReceiver;
.source "DownloadFragment.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/motorola/ccc/ota/ui/DownloadFragment;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/motorola/ccc/ota/ui/DownloadFragment;


# direct methods
.method constructor <init>(Lcom/motorola/ccc/ota/ui/DownloadFragment;)V
    .locals 0

    iput-object p1, p0, Lcom/motorola/ccc/ota/ui/DownloadFragment$5;->this$0:Lcom/motorola/ccc/ota/ui/DownloadFragment;

    invoke-direct {p0}, Landroid/content/BroadcastReceiver;-><init>()V

    return-void
.end method


# virtual methods
.method public onReceive(Landroid/content/Context;Landroid/content/Intent;)V
    .locals 0

    invoke-virtual {p2}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object p1

    const-string p2, "com.motorola.ccc.ota.Actions.FINISH_DOWNLOAD_ACTIVITY"

    invoke-virtual {p2, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_0

    const-string p1, "OtaApp"

    const-string p2, "DownloadActivity:mFinishReceiver, finish download activity as force upgrade timer expired"

    invoke-static {p1, p2}, Lcom/motorola/ccc/ota/utils/Logger;->info(Ljava/lang/String;Ljava/lang/String;)V

    iget-object p1, p0, Lcom/motorola/ccc/ota/ui/DownloadFragment$5;->this$0:Lcom/motorola/ccc/ota/ui/DownloadFragment;

    const/4 p2, 0x1

    invoke-static {p1, p2}, Lcom/motorola/ccc/ota/ui/DownloadFragment;->-$$Nest$fputmDoNotShowNotification(Lcom/motorola/ccc/ota/ui/DownloadFragment;Z)V

    iget-object p0, p0, Lcom/motorola/ccc/ota/ui/DownloadFragment$5;->this$0:Lcom/motorola/ccc/ota/ui/DownloadFragment;

    invoke-static {p0}, Lcom/motorola/ccc/ota/ui/DownloadFragment;->-$$Nest$fgetactivity(Lcom/motorola/ccc/ota/ui/DownloadFragment;)Landroid/app/Activity;

    move-result-object p0

    invoke-virtual {p0}, Landroid/app/Activity;->finish()V

    :cond_0
    return-void
.end method
