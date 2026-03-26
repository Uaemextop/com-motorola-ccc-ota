.class Lcom/motorola/ccc/ota/ui/UpdateHistoryFragment$1;
.super Ljava/lang/Object;
.source "UpdateHistoryFragment.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/motorola/ccc/ota/ui/UpdateHistoryFragment;->addHistoryLayouts(Landroid/widget/LinearLayout;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;JLjava/lang/String;Ljava/lang/String;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/motorola/ccc/ota/ui/UpdateHistoryFragment;

.field final synthetic val$releaseNotes:Ljava/lang/String;

.field final synthetic val$sourceVersion:Ljava/lang/String;

.field final synthetic val$targetVersion:Ljava/lang/String;

.field final synthetic val$updateNotes:Ljava/lang/String;

.field final synthetic val$updateType:Ljava/lang/String;


# direct methods
.method constructor <init>(Lcom/motorola/ccc/ota/ui/UpdateHistoryFragment;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    iput-object p1, p0, Lcom/motorola/ccc/ota/ui/UpdateHistoryFragment$1;->this$0:Lcom/motorola/ccc/ota/ui/UpdateHistoryFragment;

    iput-object p2, p0, Lcom/motorola/ccc/ota/ui/UpdateHistoryFragment$1;->val$sourceVersion:Ljava/lang/String;

    iput-object p3, p0, Lcom/motorola/ccc/ota/ui/UpdateHistoryFragment$1;->val$targetVersion:Ljava/lang/String;

    iput-object p4, p0, Lcom/motorola/ccc/ota/ui/UpdateHistoryFragment$1;->val$updateType:Ljava/lang/String;

    iput-object p5, p0, Lcom/motorola/ccc/ota/ui/UpdateHistoryFragment$1;->val$releaseNotes:Ljava/lang/String;

    iput-object p6, p0, Lcom/motorola/ccc/ota/ui/UpdateHistoryFragment$1;->val$updateNotes:Ljava/lang/String;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 2

    iget-object p1, p0, Lcom/motorola/ccc/ota/ui/UpdateHistoryFragment$1;->this$0:Lcom/motorola/ccc/ota/ui/UpdateHistoryFragment;

    invoke-virtual {p1}, Lcom/motorola/ccc/ota/ui/UpdateHistoryFragment;->getActivity()Landroidx/fragment/app/FragmentActivity;

    move-result-object p1

    invoke-virtual {p1}, Landroidx/fragment/app/FragmentActivity;->getIntent()Landroid/content/Intent;

    move-result-object p1

    const-string v0, "sourceVersion"

    iget-object v1, p0, Lcom/motorola/ccc/ota/ui/UpdateHistoryFragment$1;->val$sourceVersion:Ljava/lang/String;

    invoke-virtual {p1, v0, v1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    const-string v0, "targetVersion"

    iget-object v1, p0, Lcom/motorola/ccc/ota/ui/UpdateHistoryFragment$1;->val$targetVersion:Ljava/lang/String;

    invoke-virtual {p1, v0, v1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    const-string v0, "updateType"

    iget-object v1, p0, Lcom/motorola/ccc/ota/ui/UpdateHistoryFragment$1;->val$updateType:Ljava/lang/String;

    invoke-virtual {p1, v0, v1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    const-string v0, "releaseNotes"

    iget-object v1, p0, Lcom/motorola/ccc/ota/ui/UpdateHistoryFragment$1;->val$releaseNotes:Ljava/lang/String;

    invoke-virtual {p1, v0, v1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    const-string v0, "upgradeNotes"

    iget-object v1, p0, Lcom/motorola/ccc/ota/ui/UpdateHistoryFragment$1;->val$updateNotes:Ljava/lang/String;

    invoke-virtual {p1, v0, v1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    new-instance v0, Landroid/os/Bundle;

    invoke-direct {v0}, Landroid/os/Bundle;-><init>()V

    const-string v1, "activityIntent"

    invoke-virtual {v0, v1, p1}, Landroid/os/Bundle;->putParcelable(Ljava/lang/String;Landroid/os/Parcelable;)V

    new-instance p1, Lcom/motorola/ccc/ota/ui/HistoryDialog;

    invoke-direct {p1}, Lcom/motorola/ccc/ota/ui/HistoryDialog;-><init>()V

    invoke-virtual {p1, v0}, Lcom/motorola/ccc/ota/ui/HistoryDialog;->setArguments(Landroid/os/Bundle;)V

    iget-object v0, p0, Lcom/motorola/ccc/ota/ui/UpdateHistoryFragment$1;->this$0:Lcom/motorola/ccc/ota/ui/UpdateHistoryFragment;

    invoke-static {v0}, Lcom/motorola/ccc/ota/ui/UpdateHistoryFragment;->-$$Nest$fgetisTransactionSafe(Lcom/motorola/ccc/ota/ui/UpdateHistoryFragment;)Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object p0, p0, Lcom/motorola/ccc/ota/ui/UpdateHistoryFragment$1;->this$0:Lcom/motorola/ccc/ota/ui/UpdateHistoryFragment;

    invoke-virtual {p0}, Lcom/motorola/ccc/ota/ui/UpdateHistoryFragment;->getActivity()Landroidx/fragment/app/FragmentActivity;

    move-result-object p0

    invoke-virtual {p0}, Landroidx/fragment/app/FragmentActivity;->getSupportFragmentManager()Landroidx/fragment/app/FragmentManager;

    move-result-object p0

    const-string v0, "HistoryDescriptionDialog"

    invoke-virtual {p1, p0, v0}, Lcom/motorola/ccc/ota/ui/HistoryDialog;->show(Landroidx/fragment/app/FragmentManager;Ljava/lang/String;)V

    :cond_0
    return-void
.end method
