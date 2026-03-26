.class Lcom/motorola/ccc/ota/ui/MenuFragment$2;
.super Ljava/lang/Object;
.source "MenuFragment.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/motorola/ccc/ota/ui/MenuFragment;->handleButtons()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/motorola/ccc/ota/ui/MenuFragment;


# direct methods
.method constructor <init>(Lcom/motorola/ccc/ota/ui/MenuFragment;)V
    .locals 0

    iput-object p1, p0, Lcom/motorola/ccc/ota/ui/MenuFragment$2;->this$0:Lcom/motorola/ccc/ota/ui/MenuFragment;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 0

    iget-object p0, p0, Lcom/motorola/ccc/ota/ui/MenuFragment$2;->this$0:Lcom/motorola/ccc/ota/ui/MenuFragment;

    invoke-static {p0}, Lcom/motorola/ccc/ota/ui/MenuFragment;->-$$Nest$fgetmActivity(Lcom/motorola/ccc/ota/ui/MenuFragment;)Landroidx/fragment/app/FragmentActivity;

    move-result-object p0

    invoke-virtual {p0}, Landroidx/fragment/app/FragmentActivity;->finish()V

    return-void
.end method
