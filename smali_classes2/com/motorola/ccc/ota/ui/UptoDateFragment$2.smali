.class Lcom/motorola/ccc/ota/ui/UptoDateFragment$2;
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

    iput-object p1, p0, Lcom/motorola/ccc/ota/ui/UptoDateFragment$2;->this$0:Lcom/motorola/ccc/ota/ui/UptoDateFragment;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 0

    sget-object p1, Lcom/motorola/ccc/ota/utils/SmartUpdateUtils$SmartUpdateLaunchMode;->UP_TO_DATE_FRAGMENT:Lcom/motorola/ccc/ota/utils/SmartUpdateUtils$SmartUpdateLaunchMode;

    invoke-virtual {p1}, Lcom/motorola/ccc/ota/utils/SmartUpdateUtils$SmartUpdateLaunchMode;->name()Ljava/lang/String;

    move-result-object p1

    invoke-static {p1}, Lcom/motorola/ccc/ota/utils/SmartUpdateUtils;->turnSmartUpdateOn(Ljava/lang/String;)V

    iget-object p0, p0, Lcom/motorola/ccc/ota/ui/UptoDateFragment$2;->this$0:Lcom/motorola/ccc/ota/ui/UptoDateFragment;

    invoke-static {p0}, Lcom/motorola/ccc/ota/ui/UptoDateFragment;->-$$Nest$mlaunchSmartUpdate(Lcom/motorola/ccc/ota/ui/UptoDateFragment;)V

    return-void
.end method
