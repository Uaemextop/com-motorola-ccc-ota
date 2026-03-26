.class Lcom/motorola/ccc/ota/ui/SmartUpdateFragment$6;
.super Ljava/lang/Object;
.source "SmartUpdateFragment.java"

# interfaces
.implements Landroid/content/DialogInterface$OnKeyListener;


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

    iput-object p1, p0, Lcom/motorola/ccc/ota/ui/SmartUpdateFragment$6;->this$0:Lcom/motorola/ccc/ota/ui/SmartUpdateFragment;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onKey(Landroid/content/DialogInterface;ILandroid/view/KeyEvent;)Z
    .locals 0

    const/4 p1, 0x4

    if-ne p2, p1, :cond_1

    iget-object p1, p0, Lcom/motorola/ccc/ota/ui/SmartUpdateFragment$6;->this$0:Lcom/motorola/ccc/ota/ui/SmartUpdateFragment;

    invoke-virtual {p1}, Lcom/motorola/ccc/ota/ui/SmartUpdateFragment;->getFragmentManager()Landroidx/fragment/app/FragmentManager;

    move-result-object p1

    invoke-virtual {p1}, Landroidx/fragment/app/FragmentManager;->getFragments()Ljava/util/List;

    move-result-object p1

    invoke-interface {p1}, Ljava/util/List;->toArray()[Ljava/lang/Object;

    move-result-object p1

    array-length p1, p1

    const/4 p2, 0x1

    if-gt p1, p2, :cond_0

    iget-object p1, p0, Lcom/motorola/ccc/ota/ui/SmartUpdateFragment$6;->this$0:Lcom/motorola/ccc/ota/ui/SmartUpdateFragment;

    invoke-static {p1}, Lcom/motorola/ccc/ota/ui/SmartUpdateFragment;->-$$Nest$fgetmActivity(Lcom/motorola/ccc/ota/ui/SmartUpdateFragment;)Landroidx/fragment/app/FragmentActivity;

    move-result-object p1

    invoke-virtual {p1}, Landroidx/fragment/app/FragmentActivity;->finish()V

    :cond_0
    iget-object p0, p0, Lcom/motorola/ccc/ota/ui/SmartUpdateFragment$6;->this$0:Lcom/motorola/ccc/ota/ui/SmartUpdateFragment;

    invoke-virtual {p0}, Lcom/motorola/ccc/ota/ui/SmartUpdateFragment;->dismiss()V

    return p2

    :cond_1
    const/4 p0, 0x0

    return p0
.end method
