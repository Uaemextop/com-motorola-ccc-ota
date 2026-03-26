.class Lcom/motorola/ccc/ota/ui/UptoDateFragment$1;
.super Ljava/lang/Object;
.source "UptoDateFragment.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/motorola/ccc/ota/ui/UptoDateFragment;->onActivityCreated(Landroid/os/Bundle;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/motorola/ccc/ota/ui/UptoDateFragment;


# direct methods
.method constructor <init>(Lcom/motorola/ccc/ota/ui/UptoDateFragment;)V
    .locals 0

    iput-object p1, p0, Lcom/motorola/ccc/ota/ui/UptoDateFragment$1;->this$0:Lcom/motorola/ccc/ota/ui/UptoDateFragment;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 1

    :try_start_0
    iget-object p0, p0, Lcom/motorola/ccc/ota/ui/UptoDateFragment$1;->this$0:Lcom/motorola/ccc/ota/ui/UptoDateFragment;

    invoke-static {p0}, Lcom/motorola/ccc/ota/ui/UptoDateFragment;->-$$Nest$fgetmActivity(Lcom/motorola/ccc/ota/ui/UptoDateFragment;)Landroidx/fragment/app/FragmentActivity;

    move-result-object p0

    check-cast p0, Lcom/motorola/ccc/ota/ui/FragmentActionListener;

    invoke-interface {p0}, Lcom/motorola/ccc/ota/ui/FragmentActionListener;->onActionPerformed()V
    :try_end_0
    .catch Ljava/lang/ClassCastException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception p0

    new-instance p1, Ljava/lang/StringBuilder;

    const-string v0, "Exception in UpToDateFragment, btnDone.onClick: "

    invoke-direct {p1, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    const-string p1, "OtaApp"

    invoke-static {p1, p0}, Lcom/motorola/ccc/ota/utils/Logger;->error(Ljava/lang/String;Ljava/lang/String;)V

    :goto_0
    return-void
.end method
