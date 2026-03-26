.class Lcom/motorola/ccc/ota/ui/SmartUpdateFragment$1;
.super Ljava/lang/Object;
.source "SmartUpdateFragment.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/motorola/ccc/ota/ui/SmartUpdateFragment;->handleButtons()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/motorola/ccc/ota/ui/SmartUpdateFragment;


# direct methods
.method constructor <init>(Lcom/motorola/ccc/ota/ui/SmartUpdateFragment;)V
    .locals 0

    iput-object p1, p0, Lcom/motorola/ccc/ota/ui/SmartUpdateFragment$1;->this$0:Lcom/motorola/ccc/ota/ui/SmartUpdateFragment;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 2

    iget-object p1, p0, Lcom/motorola/ccc/ota/ui/SmartUpdateFragment$1;->this$0:Lcom/motorola/ccc/ota/ui/SmartUpdateFragment;

    invoke-static {p1}, Lcom/motorola/ccc/ota/ui/SmartUpdateFragment;->-$$Nest$fgetenableUpdateTypeSwitch(Lcom/motorola/ccc/ota/ui/SmartUpdateFragment;)Landroid/widget/Switch;

    move-result-object p1

    invoke-virtual {p1}, Landroid/widget/Switch;->getVisibility()I

    move-result p1

    const/4 v0, 0x0

    const/16 v1, 0x8

    if-ne v1, p1, :cond_0

    iget-object p1, p0, Lcom/motorola/ccc/ota/ui/SmartUpdateFragment$1;->this$0:Lcom/motorola/ccc/ota/ui/SmartUpdateFragment;

    invoke-static {p1}, Lcom/motorola/ccc/ota/ui/SmartUpdateFragment;->-$$Nest$fgetenableUpdateTypeSwitch(Lcom/motorola/ccc/ota/ui/SmartUpdateFragment;)Landroid/widget/Switch;

    move-result-object p1

    invoke-virtual {p1, v0}, Landroid/widget/Switch;->setVisibility(I)V

    iget-object p0, p0, Lcom/motorola/ccc/ota/ui/SmartUpdateFragment$1;->this$0:Lcom/motorola/ccc/ota/ui/SmartUpdateFragment;

    invoke-static {p0}, Lcom/motorola/ccc/ota/ui/SmartUpdateFragment;->-$$Nest$fgetadvancedOptions(Lcom/motorola/ccc/ota/ui/SmartUpdateFragment;)Landroid/widget/Button;

    move-result-object p0

    const p1, 0x7f0800ac

    invoke-virtual {p0, p1, v0, v0, v0}, Landroid/widget/Button;->setCompoundDrawablesWithIntrinsicBounds(IIII)V

    goto :goto_0

    :cond_0
    iget-object p1, p0, Lcom/motorola/ccc/ota/ui/SmartUpdateFragment$1;->this$0:Lcom/motorola/ccc/ota/ui/SmartUpdateFragment;

    invoke-static {p1}, Lcom/motorola/ccc/ota/ui/SmartUpdateFragment;->-$$Nest$fgetenableUpdateTypeSwitch(Lcom/motorola/ccc/ota/ui/SmartUpdateFragment;)Landroid/widget/Switch;

    move-result-object p1

    invoke-virtual {p1, v1}, Landroid/widget/Switch;->setVisibility(I)V

    iget-object p0, p0, Lcom/motorola/ccc/ota/ui/SmartUpdateFragment$1;->this$0:Lcom/motorola/ccc/ota/ui/SmartUpdateFragment;

    invoke-static {p0}, Lcom/motorola/ccc/ota/ui/SmartUpdateFragment;->-$$Nest$fgetadvancedOptions(Lcom/motorola/ccc/ota/ui/SmartUpdateFragment;)Landroid/widget/Button;

    move-result-object p0

    const p1, 0x7f0800ab

    invoke-virtual {p0, p1, v0, v0, v0}, Landroid/widget/Button;->setCompoundDrawablesWithIntrinsicBounds(IIII)V

    :goto_0
    return-void
.end method
