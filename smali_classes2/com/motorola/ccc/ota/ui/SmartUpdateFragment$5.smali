.class Lcom/motorola/ccc/ota/ui/SmartUpdateFragment$5;
.super Ljava/lang/Object;
.source "SmartUpdateFragment.java"

# interfaces
.implements Landroid/widget/CompoundButton$OnCheckedChangeListener;


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

    iput-object p1, p0, Lcom/motorola/ccc/ota/ui/SmartUpdateFragment$5;->this$0:Lcom/motorola/ccc/ota/ui/SmartUpdateFragment;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onCheckedChanged(Landroid/widget/CompoundButton;Z)V
    .locals 1

    const p1, 0x7f0e0038

    if-eqz p2, :cond_1

    iget-object p2, p0, Lcom/motorola/ccc/ota/ui/SmartUpdateFragment$5;->this$0:Lcom/motorola/ccc/ota/ui/SmartUpdateFragment;

    invoke-static {p2}, Lcom/motorola/ccc/ota/ui/SmartUpdateFragment;->-$$Nest$fgetenableUpdateTypeSwitch(Lcom/motorola/ccc/ota/ui/SmartUpdateFragment;)Landroid/widget/Switch;

    move-result-object p2

    invoke-virtual {p2}, Landroid/widget/Switch;->getText()Ljava/lang/CharSequence;

    move-result-object p2

    iget-object v0, p0, Lcom/motorola/ccc/ota/ui/SmartUpdateFragment$5;->this$0:Lcom/motorola/ccc/ota/ui/SmartUpdateFragment;

    invoke-virtual {v0, p1}, Lcom/motorola/ccc/ota/ui/SmartUpdateFragment;->getString(I)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p2, p1}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result p1

    const/4 p2, 0x1

    if-eqz p1, :cond_0

    iget-object p0, p0, Lcom/motorola/ccc/ota/ui/SmartUpdateFragment$5;->this$0:Lcom/motorola/ccc/ota/ui/SmartUpdateFragment;

    invoke-static {p0}, Lcom/motorola/ccc/ota/ui/SmartUpdateFragment;->-$$Nest$fgetsettings(Lcom/motorola/ccc/ota/ui/SmartUpdateFragment;)Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    move-result-object p0

    sget-object p1, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->SMART_UPDATE_OS_ENABLE_BY_USER:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    invoke-virtual {p0, p1, p2}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->setBoolean(Lcom/motorola/otalib/common/settings/ISetting;Z)V

    goto :goto_0

    :cond_0
    iget-object p0, p0, Lcom/motorola/ccc/ota/ui/SmartUpdateFragment$5;->this$0:Lcom/motorola/ccc/ota/ui/SmartUpdateFragment;

    invoke-static {p0}, Lcom/motorola/ccc/ota/ui/SmartUpdateFragment;->-$$Nest$fgetsettings(Lcom/motorola/ccc/ota/ui/SmartUpdateFragment;)Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    move-result-object p0

    sget-object p1, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->SMART_UPDATE_MR_ENABLE_BY_USER:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    invoke-virtual {p0, p1, p2}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->setBoolean(Lcom/motorola/otalib/common/settings/ISetting;Z)V

    goto :goto_0

    :cond_1
    iget-object p2, p0, Lcom/motorola/ccc/ota/ui/SmartUpdateFragment$5;->this$0:Lcom/motorola/ccc/ota/ui/SmartUpdateFragment;

    invoke-static {p2}, Lcom/motorola/ccc/ota/ui/SmartUpdateFragment;->-$$Nest$fgetenableUpdateTypeSwitch(Lcom/motorola/ccc/ota/ui/SmartUpdateFragment;)Landroid/widget/Switch;

    move-result-object p2

    invoke-virtual {p2}, Landroid/widget/Switch;->getText()Ljava/lang/CharSequence;

    move-result-object p2

    iget-object v0, p0, Lcom/motorola/ccc/ota/ui/SmartUpdateFragment$5;->this$0:Lcom/motorola/ccc/ota/ui/SmartUpdateFragment;

    invoke-virtual {v0, p1}, Lcom/motorola/ccc/ota/ui/SmartUpdateFragment;->getString(I)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p2, p1}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result p1

    const/4 p2, 0x0

    if-eqz p1, :cond_2

    iget-object p0, p0, Lcom/motorola/ccc/ota/ui/SmartUpdateFragment$5;->this$0:Lcom/motorola/ccc/ota/ui/SmartUpdateFragment;

    invoke-static {p0}, Lcom/motorola/ccc/ota/ui/SmartUpdateFragment;->-$$Nest$fgetsettings(Lcom/motorola/ccc/ota/ui/SmartUpdateFragment;)Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    move-result-object p0

    sget-object p1, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->SMART_UPDATE_OS_ENABLE_BY_USER:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    invoke-virtual {p0, p1, p2}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->setBoolean(Lcom/motorola/otalib/common/settings/ISetting;Z)V

    goto :goto_0

    :cond_2
    iget-object p0, p0, Lcom/motorola/ccc/ota/ui/SmartUpdateFragment$5;->this$0:Lcom/motorola/ccc/ota/ui/SmartUpdateFragment;

    invoke-static {p0}, Lcom/motorola/ccc/ota/ui/SmartUpdateFragment;->-$$Nest$fgetsettings(Lcom/motorola/ccc/ota/ui/SmartUpdateFragment;)Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    move-result-object p0

    sget-object p1, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->SMART_UPDATE_MR_ENABLE_BY_USER:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    invoke-virtual {p0, p1, p2}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->setBoolean(Lcom/motorola/otalib/common/settings/ISetting;Z)V

    :goto_0
    return-void
.end method
