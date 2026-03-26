.class Lcom/motorola/ccc/ota/ui/DownloadProgressFragment$4;
.super Ljava/lang/Object;
.source "DownloadProgressFragment.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/motorola/ccc/ota/ui/DownloadProgressFragment;->handleButtons()V
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

    iput-object p1, p0, Lcom/motorola/ccc/ota/ui/DownloadProgressFragment$4;->this$0:Lcom/motorola/ccc/ota/ui/DownloadProgressFragment;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 2

    iget-object p1, p0, Lcom/motorola/ccc/ota/ui/DownloadProgressFragment$4;->this$0:Lcom/motorola/ccc/ota/ui/DownloadProgressFragment;

    invoke-static {p1}, Lcom/motorola/ccc/ota/ui/DownloadProgressFragment;->-$$Nest$fgetcontext(Lcom/motorola/ccc/ota/ui/DownloadProgressFragment;)Landroid/content/Context;

    move-result-object p1

    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object p1

    const v0, 0x7f0e0026

    invoke-virtual {p1, v0}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object p1

    iget-object v0, p0, Lcom/motorola/ccc/ota/ui/DownloadProgressFragment$4;->this$0:Lcom/motorola/ccc/ota/ui/DownloadProgressFragment;

    invoke-static {v0}, Lcom/motorola/ccc/ota/ui/DownloadProgressFragment;->-$$Nest$fgetcontext(Lcom/motorola/ccc/ota/ui/DownloadProgressFragment;)Landroid/content/Context;

    move-result-object v0

    const/4 v1, 0x1

    invoke-static {v0, p1, v1}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object p1

    invoke-virtual {p1}, Landroid/widget/Toast;->show()V

    iget-object p1, p0, Lcom/motorola/ccc/ota/ui/DownloadProgressFragment$4;->this$0:Lcom/motorola/ccc/ota/ui/DownloadProgressFragment;

    invoke-static {p1}, Lcom/motorola/ccc/ota/ui/DownloadProgressFragment;->-$$Nest$fgetmDataChargeWarningMessage(Lcom/motorola/ccc/ota/ui/DownloadProgressFragment;)Landroid/widget/TextView;

    move-result-object p1

    const/16 v0, 0x8

    invoke-virtual {p1, v0}, Landroid/widget/TextView;->setVisibility(I)V

    iget-object p0, p0, Lcom/motorola/ccc/ota/ui/DownloadProgressFragment$4;->this$0:Lcom/motorola/ccc/ota/ui/DownloadProgressFragment;

    invoke-static {p0}, Lcom/motorola/ccc/ota/ui/DownloadProgressFragment;->-$$Nest$fgetmDlCellularResume(Lcom/motorola/ccc/ota/ui/DownloadProgressFragment;)Landroid/widget/Button;

    move-result-object p0

    invoke-virtual {p0, v0}, Landroid/widget/Button;->setVisibility(I)V

    invoke-static {}, Lcom/motorola/ccc/ota/env/OtaApplication;->getGlobalContext()Landroid/content/Context;

    move-result-object p0

    sget-object p1, Lcom/motorola/otalib/common/utils/UpgradeUtils$DownloadStatus;->STATUS_RESUME_ON_CELLULAR:Lcom/motorola/otalib/common/utils/UpgradeUtils$DownloadStatus;

    invoke-static {p0, p1}, Lcom/motorola/ccc/ota/utils/UpgradeUtilMethods;->sendDownloadNotificationResponse(Landroid/content/Context;Lcom/motorola/otalib/common/utils/UpgradeUtils$DownloadStatus;)V

    return-void
.end method
