.class Lcom/motorola/ccc/ota/ui/UptoDateFragment$3;
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

    iput-object p1, p0, Lcom/motorola/ccc/ota/ui/UptoDateFragment$3;->this$0:Lcom/motorola/ccc/ota/ui/UptoDateFragment;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 1

    iget-object p1, p0, Lcom/motorola/ccc/ota/ui/UptoDateFragment$3;->this$0:Lcom/motorola/ccc/ota/ui/UptoDateFragment;

    invoke-static {p1}, Lcom/motorola/ccc/ota/ui/UptoDateFragment;->-$$Nest$fgetbtnDone(Lcom/motorola/ccc/ota/ui/UptoDateFragment;)Landroid/widget/Button;

    move-result-object p1

    const/4 v0, 0x0

    invoke-virtual {p1, v0}, Landroid/widget/Button;->setVisibility(I)V

    iget-object p1, p0, Lcom/motorola/ccc/ota/ui/UptoDateFragment$3;->this$0:Lcom/motorola/ccc/ota/ui/UptoDateFragment;

    invoke-static {p1}, Lcom/motorola/ccc/ota/ui/UptoDateFragment;->-$$Nest$fgetsmartUpdateBottomSheet(Lcom/motorola/ccc/ota/ui/UptoDateFragment;)Landroid/widget/RelativeLayout;

    move-result-object p1

    const/16 v0, 0x8

    invoke-virtual {p1, v0}, Landroid/widget/RelativeLayout;->setVisibility(I)V

    iget-object p0, p0, Lcom/motorola/ccc/ota/ui/UptoDateFragment$3;->this$0:Lcom/motorola/ccc/ota/ui/UptoDateFragment;

    invoke-static {p0}, Lcom/motorola/ccc/ota/ui/UptoDateFragment;->-$$Nest$fgetsettings(Lcom/motorola/ccc/ota/ui/UptoDateFragment;)Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    move-result-object p0

    sget-object p1, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->STATS_SMART_UPDATE_BOTTOM_SHEET_NOT_NOW:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    invoke-virtual {p0, p1}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->incrementPrefs(Lcom/motorola/otalib/common/settings/ISetting;)V

    return-void
.end method
