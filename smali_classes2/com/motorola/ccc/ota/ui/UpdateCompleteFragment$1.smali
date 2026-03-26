.class Lcom/motorola/ccc/ota/ui/UpdateCompleteFragment$1;
.super Ljava/lang/Object;
.source "UpdateCompleteFragment.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/motorola/ccc/ota/ui/UpdateCompleteFragment;->initUI()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/motorola/ccc/ota/ui/UpdateCompleteFragment;


# direct methods
.method constructor <init>(Lcom/motorola/ccc/ota/ui/UpdateCompleteFragment;)V
    .locals 0

    iput-object p1, p0, Lcom/motorola/ccc/ota/ui/UpdateCompleteFragment$1;->this$0:Lcom/motorola/ccc/ota/ui/UpdateCompleteFragment;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 1

    const-string p1, "OtaApp"

    const-string v0, "OTA Update Status accepted by user!"

    invoke-static {p1, v0}, Lcom/motorola/ccc/ota/utils/Logger;->info(Ljava/lang/String;Ljava/lang/String;)V

    iget-object p0, p0, Lcom/motorola/ccc/ota/ui/UpdateCompleteFragment$1;->this$0:Lcom/motorola/ccc/ota/ui/UpdateCompleteFragment;

    invoke-static {p0}, Lcom/motorola/ccc/ota/ui/UpdateCompleteFragment;->-$$Nest$mhandleOnCancelUpdateFragment(Lcom/motorola/ccc/ota/ui/UpdateCompleteFragment;)V

    return-void
.end method
