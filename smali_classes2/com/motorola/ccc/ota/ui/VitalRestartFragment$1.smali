.class Lcom/motorola/ccc/ota/ui/VitalRestartFragment$1;
.super Ljava/lang/Object;
.source "VitalRestartFragment.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/motorola/ccc/ota/ui/VitalRestartFragment;->onCreateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;Landroid/os/Bundle;)Landroid/view/View;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/motorola/ccc/ota/ui/VitalRestartFragment;


# direct methods
.method constructor <init>(Lcom/motorola/ccc/ota/ui/VitalRestartFragment;)V
    .locals 0

    iput-object p1, p0, Lcom/motorola/ccc/ota/ui/VitalRestartFragment$1;->this$0:Lcom/motorola/ccc/ota/ui/VitalRestartFragment;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 0

    iget-object p0, p0, Lcom/motorola/ccc/ota/ui/VitalRestartFragment$1;->this$0:Lcom/motorola/ccc/ota/ui/VitalRestartFragment;

    invoke-static {p0}, Lcom/motorola/ccc/ota/ui/VitalRestartFragment;->-$$Nest$mproceedWithReboot(Lcom/motorola/ccc/ota/ui/VitalRestartFragment;)V

    return-void
.end method
