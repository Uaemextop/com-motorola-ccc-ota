.class Lcom/motorola/ccc/ota/ui/RestartFragment$1;
.super Ljava/lang/Object;
.source "RestartFragment.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/motorola/ccc/ota/ui/RestartFragment;->handleButtons()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/motorola/ccc/ota/ui/RestartFragment;


# direct methods
.method constructor <init>(Lcom/motorola/ccc/ota/ui/RestartFragment;)V
    .locals 0

    iput-object p1, p0, Lcom/motorola/ccc/ota/ui/RestartFragment$1;->this$0:Lcom/motorola/ccc/ota/ui/RestartFragment;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 0

    iget-object p1, p0, Lcom/motorola/ccc/ota/ui/RestartFragment$1;->this$0:Lcom/motorola/ccc/ota/ui/RestartFragment;

    invoke-static {p1}, Lcom/motorola/ccc/ota/ui/RestartFragment;->-$$Nest$fgetmCriticalUpdate(Lcom/motorola/ccc/ota/ui/RestartFragment;)Lcom/motorola/ccc/ota/ui/CriticalUpdate;

    move-result-object p1

    invoke-virtual {p1}, Lcom/motorola/ccc/ota/ui/CriticalUpdate;->setInstallStats()V

    iget-object p0, p0, Lcom/motorola/ccc/ota/ui/RestartFragment$1;->this$0:Lcom/motorola/ccc/ota/ui/RestartFragment;

    invoke-static {p0}, Lcom/motorola/ccc/ota/ui/RestartFragment;->-$$Nest$mproceedWithReboot(Lcom/motorola/ccc/ota/ui/RestartFragment;)V

    return-void
.end method
