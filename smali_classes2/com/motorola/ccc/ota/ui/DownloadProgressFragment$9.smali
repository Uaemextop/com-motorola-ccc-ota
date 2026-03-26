.class Lcom/motorola/ccc/ota/ui/DownloadProgressFragment$9;
.super Landroid/content/BroadcastReceiver;
.source "DownloadProgressFragment.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/motorola/ccc/ota/ui/DownloadProgressFragment;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/motorola/ccc/ota/ui/DownloadProgressFragment;


# direct methods
.method constructor <init>(Lcom/motorola/ccc/ota/ui/DownloadProgressFragment;)V
    .locals 0

    iput-object p1, p0, Lcom/motorola/ccc/ota/ui/DownloadProgressFragment$9;->this$0:Lcom/motorola/ccc/ota/ui/DownloadProgressFragment;

    invoke-direct {p0}, Landroid/content/BroadcastReceiver;-><init>()V

    return-void
.end method


# virtual methods
.method public onReceive(Landroid/content/Context;Landroid/content/Intent;)V
    .locals 0

    iget-object p0, p0, Lcom/motorola/ccc/ota/ui/DownloadProgressFragment$9;->this$0:Lcom/motorola/ccc/ota/ui/DownloadProgressFragment;

    invoke-static {p0, p2}, Lcom/motorola/ccc/ota/ui/DownloadProgressFragment;->-$$Nest$mupdateUI(Lcom/motorola/ccc/ota/ui/DownloadProgressFragment;Landroid/content/Intent;)V

    return-void
.end method
