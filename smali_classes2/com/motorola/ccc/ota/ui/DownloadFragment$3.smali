.class Lcom/motorola/ccc/ota/ui/DownloadFragment$3;
.super Ljava/lang/Object;
.source "DownloadFragment.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/motorola/ccc/ota/ui/DownloadFragment;->handleButtons()V
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

    iput-object p1, p0, Lcom/motorola/ccc/ota/ui/DownloadFragment$3;->this$0:Lcom/motorola/ccc/ota/ui/DownloadFragment;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 1

    iget-object p1, p0, Lcom/motorola/ccc/ota/ui/DownloadFragment$3;->this$0:Lcom/motorola/ccc/ota/ui/DownloadFragment;

    invoke-virtual {p1}, Lcom/motorola/ccc/ota/ui/DownloadFragment;->handleDownloadLaterOption()V

    iget-object p1, p0, Lcom/motorola/ccc/ota/ui/DownloadFragment$3;->this$0:Lcom/motorola/ccc/ota/ui/DownloadFragment;

    invoke-static {p1}, Lcom/motorola/ccc/ota/ui/DownloadFragment;->-$$Nest$fgetmPromptCount(Lcom/motorola/ccc/ota/ui/DownloadFragment;)I

    move-result p1

    const/4 v0, 0x5

    if-lt p1, v0, :cond_0

    iget-object p0, p0, Lcom/motorola/ccc/ota/ui/DownloadFragment$3;->this$0:Lcom/motorola/ccc/ota/ui/DownloadFragment;

    invoke-static {p0}, Lcom/motorola/ccc/ota/ui/DownloadFragment;->-$$Nest$mshowTrySmartUpdatePopUp(Lcom/motorola/ccc/ota/ui/DownloadFragment;)V

    goto :goto_0

    :cond_0
    iget-object p0, p0, Lcom/motorola/ccc/ota/ui/DownloadFragment$3;->this$0:Lcom/motorola/ccc/ota/ui/DownloadFragment;

    invoke-virtual {p0}, Lcom/motorola/ccc/ota/ui/DownloadFragment;->getActivity()Landroidx/fragment/app/FragmentActivity;

    move-result-object p0

    invoke-virtual {p0}, Landroidx/fragment/app/FragmentActivity;->finish()V

    :goto_0
    return-void
.end method
