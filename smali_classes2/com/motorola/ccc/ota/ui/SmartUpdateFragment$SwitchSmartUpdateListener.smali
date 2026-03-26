.class Lcom/motorola/ccc/ota/ui/SmartUpdateFragment$SwitchSmartUpdateListener;
.super Ljava/lang/Object;
.source "SmartUpdateFragment.java"

# interfaces
.implements Landroid/widget/CompoundButton$OnCheckedChangeListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/motorola/ccc/ota/ui/SmartUpdateFragment;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "SwitchSmartUpdateListener"
.end annotation


# instance fields
.field final synthetic this$0:Lcom/motorola/ccc/ota/ui/SmartUpdateFragment;


# direct methods
.method private constructor <init>(Lcom/motorola/ccc/ota/ui/SmartUpdateFragment;)V
    .locals 0

    iput-object p1, p0, Lcom/motorola/ccc/ota/ui/SmartUpdateFragment$SwitchSmartUpdateListener;->this$0:Lcom/motorola/ccc/ota/ui/SmartUpdateFragment;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method synthetic constructor <init>(Lcom/motorola/ccc/ota/ui/SmartUpdateFragment;Lcom/motorola/ccc/ota/ui/SmartUpdateFragment$SwitchSmartUpdateListener-IA;)V
    .locals 0

    invoke-direct {p0, p1}, Lcom/motorola/ccc/ota/ui/SmartUpdateFragment$SwitchSmartUpdateListener;-><init>(Lcom/motorola/ccc/ota/ui/SmartUpdateFragment;)V

    return-void
.end method

.method static synthetic lambda$onCheckedChanged$0(Landroid/content/DialogInterface;I)V
    .locals 0

    invoke-interface {p0}, Landroid/content/DialogInterface;->cancel()V

    return-void
.end method


# virtual methods
.method synthetic lambda$onCheckedChanged$1$com-motorola-ccc-ota-ui-SmartUpdateFragment$SwitchSmartUpdateListener(Landroid/content/DialogInterface;I)V
    .locals 2

    iget-object p2, p0, Lcom/motorola/ccc/ota/ui/SmartUpdateFragment$SwitchSmartUpdateListener;->this$0:Lcom/motorola/ccc/ota/ui/SmartUpdateFragment;

    invoke-static {p2}, Lcom/motorola/ccc/ota/ui/SmartUpdateFragment;->-$$Nest$msmartUpdateTurnOff(Lcom/motorola/ccc/ota/ui/SmartUpdateFragment;)V

    iget-object p2, p0, Lcom/motorola/ccc/ota/ui/SmartUpdateFragment$SwitchSmartUpdateListener;->this$0:Lcom/motorola/ccc/ota/ui/SmartUpdateFragment;

    invoke-static {p2}, Lcom/motorola/ccc/ota/ui/SmartUpdateFragment;->-$$Nest$fgetswitchSmartUpdate(Lcom/motorola/ccc/ota/ui/SmartUpdateFragment;)Landroid/widget/Switch;

    move-result-object p2

    const/4 v0, 0x0

    invoke-virtual {p2, v0}, Landroid/widget/Switch;->setChecked(Z)V

    iget-object p2, p0, Lcom/motorola/ccc/ota/ui/SmartUpdateFragment$SwitchSmartUpdateListener;->this$0:Lcom/motorola/ccc/ota/ui/SmartUpdateFragment;

    invoke-static {p2}, Lcom/motorola/ccc/ota/ui/SmartUpdateFragment;->-$$Nest$fgetuseSmartUpdates(Lcom/motorola/ccc/ota/ui/SmartUpdateFragment;)Landroid/widget/TextView;

    move-result-object p2

    iget-object v0, p0, Lcom/motorola/ccc/ota/ui/SmartUpdateFragment$SwitchSmartUpdateListener;->this$0:Lcom/motorola/ccc/ota/ui/SmartUpdateFragment;

    invoke-virtual {v0}, Lcom/motorola/ccc/ota/ui/SmartUpdateFragment;->getContext()Landroid/content/Context;

    move-result-object v0

    const v1, 0x7f060021

    invoke-virtual {v0, v1}, Landroid/content/Context;->getColor(I)I

    move-result v0

    invoke-virtual {p2, v0}, Landroid/widget/TextView;->setTextColor(I)V

    iget-object p2, p0, Lcom/motorola/ccc/ota/ui/SmartUpdateFragment$SwitchSmartUpdateListener;->this$0:Lcom/motorola/ccc/ota/ui/SmartUpdateFragment;

    invoke-static {p2}, Lcom/motorola/ccc/ota/ui/SmartUpdateFragment;->-$$Nest$fgetlnrSmartUpdateSwitch(Lcom/motorola/ccc/ota/ui/SmartUpdateFragment;)Landroid/widget/LinearLayout;

    move-result-object p2

    iget-object p0, p0, Lcom/motorola/ccc/ota/ui/SmartUpdateFragment$SwitchSmartUpdateListener;->this$0:Lcom/motorola/ccc/ota/ui/SmartUpdateFragment;

    invoke-virtual {p0}, Lcom/motorola/ccc/ota/ui/SmartUpdateFragment;->getContext()Landroid/content/Context;

    move-result-object p0

    const v0, 0x7f0800fc

    invoke-virtual {p0, v0}, Landroid/content/Context;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object p0

    invoke-virtual {p2, p0}, Landroid/widget/LinearLayout;->setBackground(Landroid/graphics/drawable/Drawable;)V

    invoke-interface {p1}, Landroid/content/DialogInterface;->cancel()V

    return-void
.end method

.method public onCheckedChanged(Landroid/widget/CompoundButton;Z)V
    .locals 6

    if-eqz p2, :cond_0

    iget-object p1, p0, Lcom/motorola/ccc/ota/ui/SmartUpdateFragment$SwitchSmartUpdateListener;->this$0:Lcom/motorola/ccc/ota/ui/SmartUpdateFragment;

    invoke-static {p1}, Lcom/motorola/ccc/ota/ui/SmartUpdateFragment;->-$$Nest$msmartUpdateTurnOn(Lcom/motorola/ccc/ota/ui/SmartUpdateFragment;)V

    iget-object p1, p0, Lcom/motorola/ccc/ota/ui/SmartUpdateFragment$SwitchSmartUpdateListener;->this$0:Lcom/motorola/ccc/ota/ui/SmartUpdateFragment;

    invoke-static {p1}, Lcom/motorola/ccc/ota/ui/SmartUpdateFragment;->-$$Nest$fgetuseSmartUpdates(Lcom/motorola/ccc/ota/ui/SmartUpdateFragment;)Landroid/widget/TextView;

    move-result-object p1

    iget-object p2, p0, Lcom/motorola/ccc/ota/ui/SmartUpdateFragment$SwitchSmartUpdateListener;->this$0:Lcom/motorola/ccc/ota/ui/SmartUpdateFragment;

    invoke-virtual {p2}, Lcom/motorola/ccc/ota/ui/SmartUpdateFragment;->getContext()Landroid/content/Context;

    move-result-object p2

    const v0, 0x7f06001c

    invoke-virtual {p2, v0}, Landroid/content/Context;->getColor(I)I

    move-result p2

    invoke-virtual {p1, p2}, Landroid/widget/TextView;->setTextColor(I)V

    iget-object p1, p0, Lcom/motorola/ccc/ota/ui/SmartUpdateFragment$SwitchSmartUpdateListener;->this$0:Lcom/motorola/ccc/ota/ui/SmartUpdateFragment;

    invoke-static {p1}, Lcom/motorola/ccc/ota/ui/SmartUpdateFragment;->-$$Nest$fgetlnrSmartUpdateSwitch(Lcom/motorola/ccc/ota/ui/SmartUpdateFragment;)Landroid/widget/LinearLayout;

    move-result-object p1

    iget-object p0, p0, Lcom/motorola/ccc/ota/ui/SmartUpdateFragment$SwitchSmartUpdateListener;->this$0:Lcom/motorola/ccc/ota/ui/SmartUpdateFragment;

    invoke-virtual {p0}, Lcom/motorola/ccc/ota/ui/SmartUpdateFragment;->getContext()Landroid/content/Context;

    move-result-object p0

    const p2, 0x7f0800fd

    invoke-virtual {p0, p2}, Landroid/content/Context;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object p0

    invoke-virtual {p1, p0}, Landroid/widget/LinearLayout;->setBackground(Landroid/graphics/drawable/Drawable;)V

    goto :goto_0

    :cond_0
    iget-object p1, p0, Lcom/motorola/ccc/ota/ui/SmartUpdateFragment$SwitchSmartUpdateListener;->this$0:Lcom/motorola/ccc/ota/ui/SmartUpdateFragment;

    invoke-static {p1}, Lcom/motorola/ccc/ota/ui/SmartUpdateFragment;->-$$Nest$fgetsettings(Lcom/motorola/ccc/ota/ui/SmartUpdateFragment;)Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    move-result-object p1

    invoke-static {p1}, Lcom/motorola/ccc/ota/utils/SmartUpdateUtils;->isSmartUpdateEnabledByUser(Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;)Z

    move-result p1

    if-eqz p1, :cond_1

    iget-object p1, p0, Lcom/motorola/ccc/ota/ui/SmartUpdateFragment$SwitchSmartUpdateListener;->this$0:Lcom/motorola/ccc/ota/ui/SmartUpdateFragment;

    invoke-static {p1}, Lcom/motorola/ccc/ota/ui/SmartUpdateFragment;->-$$Nest$fgetmContext(Lcom/motorola/ccc/ota/ui/SmartUpdateFragment;)Landroid/content/Context;

    move-result-object p1

    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object p1

    const p2, 0x7f0e003a

    invoke-virtual {p1, p2}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v1

    iget-object p1, p0, Lcom/motorola/ccc/ota/ui/SmartUpdateFragment$SwitchSmartUpdateListener;->this$0:Lcom/motorola/ccc/ota/ui/SmartUpdateFragment;

    invoke-static {p1}, Lcom/motorola/ccc/ota/ui/SmartUpdateFragment;->-$$Nest$fgetmContext(Lcom/motorola/ccc/ota/ui/SmartUpdateFragment;)Landroid/content/Context;

    move-result-object p1

    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object p1

    const p2, 0x7f0e003b

    invoke-virtual {p1, p2}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v2

    iget-object p1, p0, Lcom/motorola/ccc/ota/ui/SmartUpdateFragment$SwitchSmartUpdateListener;->this$0:Lcom/motorola/ccc/ota/ui/SmartUpdateFragment;

    invoke-static {p1}, Lcom/motorola/ccc/ota/ui/SmartUpdateFragment;->-$$Nest$fgetmContext(Lcom/motorola/ccc/ota/ui/SmartUpdateFragment;)Landroid/content/Context;

    move-result-object v0

    iget-object p2, p0, Lcom/motorola/ccc/ota/ui/SmartUpdateFragment$SwitchSmartUpdateListener;->this$0:Lcom/motorola/ccc/ota/ui/SmartUpdateFragment;

    invoke-static {p2}, Lcom/motorola/ccc/ota/ui/SmartUpdateFragment;->-$$Nest$fgetmActivity(Lcom/motorola/ccc/ota/ui/SmartUpdateFragment;)Landroidx/fragment/app/FragmentActivity;

    move-result-object v3

    new-instance v4, Lcom/motorola/ccc/ota/ui/SmartUpdateFragment$SwitchSmartUpdateListener$$ExternalSyntheticLambda0;

    invoke-direct {v4}, Lcom/motorola/ccc/ota/ui/SmartUpdateFragment$SwitchSmartUpdateListener$$ExternalSyntheticLambda0;-><init>()V

    new-instance v5, Lcom/motorola/ccc/ota/ui/SmartUpdateFragment$SwitchSmartUpdateListener$$ExternalSyntheticLambda1;

    invoke-direct {v5, p0}, Lcom/motorola/ccc/ota/ui/SmartUpdateFragment$SwitchSmartUpdateListener$$ExternalSyntheticLambda1;-><init>(Lcom/motorola/ccc/ota/ui/SmartUpdateFragment$SwitchSmartUpdateListener;)V

    invoke-static/range {v0 .. v5}, Lcom/motorola/ccc/ota/utils/SmartUpdateUtils;->getAndShowAreYouSurePopUp(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Landroid/app/Activity;Landroid/content/DialogInterface$OnClickListener;Landroid/content/DialogInterface$OnClickListener;)Landroidx/appcompat/app/AlertDialog;

    move-result-object p2

    invoke-static {p1, p2}, Lcom/motorola/ccc/ota/ui/SmartUpdateFragment;->-$$Nest$fputturnOffSureSmartUpdateDialog(Lcom/motorola/ccc/ota/ui/SmartUpdateFragment;Landroidx/appcompat/app/AlertDialog;)V

    iget-object p0, p0, Lcom/motorola/ccc/ota/ui/SmartUpdateFragment$SwitchSmartUpdateListener;->this$0:Lcom/motorola/ccc/ota/ui/SmartUpdateFragment;

    invoke-static {p0}, Lcom/motorola/ccc/ota/ui/SmartUpdateFragment;->-$$Nest$minitUI(Lcom/motorola/ccc/ota/ui/SmartUpdateFragment;)V

    :cond_1
    :goto_0
    return-void
.end method
