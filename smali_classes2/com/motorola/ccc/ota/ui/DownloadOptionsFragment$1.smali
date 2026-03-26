.class Lcom/motorola/ccc/ota/ui/DownloadOptionsFragment$1;
.super Ljava/lang/Object;
.source "DownloadOptionsFragment.java"

# interfaces
.implements Landroid/widget/CompoundButton$OnCheckedChangeListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/motorola/ccc/ota/ui/DownloadOptionsFragment;->onCreateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;Landroid/os/Bundle;)Landroid/view/View;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/motorola/ccc/ota/ui/DownloadOptionsFragment;


# direct methods
.method constructor <init>(Lcom/motorola/ccc/ota/ui/DownloadOptionsFragment;)V
    .locals 0

    iput-object p1, p0, Lcom/motorola/ccc/ota/ui/DownloadOptionsFragment$1;->this$0:Lcom/motorola/ccc/ota/ui/DownloadOptionsFragment;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onCheckedChanged(Landroid/widget/CompoundButton;Z)V
    .locals 0

    if-eqz p2, :cond_0

    iget-object p0, p0, Lcom/motorola/ccc/ota/ui/DownloadOptionsFragment$1;->this$0:Lcom/motorola/ccc/ota/ui/DownloadOptionsFragment;

    invoke-static {p0}, Lcom/motorola/ccc/ota/ui/DownloadOptionsFragment;->-$$Nest$fgetmDlOptionNotes(Lcom/motorola/ccc/ota/ui/DownloadOptionsFragment;)Landroid/widget/TextView;

    move-result-object p0

    const/4 p1, 0x0

    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setVisibility(I)V

    goto :goto_0

    :cond_0
    iget-object p0, p0, Lcom/motorola/ccc/ota/ui/DownloadOptionsFragment$1;->this$0:Lcom/motorola/ccc/ota/ui/DownloadOptionsFragment;

    invoke-static {p0}, Lcom/motorola/ccc/ota/ui/DownloadOptionsFragment;->-$$Nest$fgetmDlOptionNotes(Lcom/motorola/ccc/ota/ui/DownloadOptionsFragment;)Landroid/widget/TextView;

    move-result-object p0

    const/16 p1, 0x8

    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setVisibility(I)V

    :goto_0
    return-void
.end method
