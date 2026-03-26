.class Lcom/motorola/ccc/ota/ui/UpdatePreferenceFragment$1;
.super Ljava/lang/Object;
.source "UpdatePreferenceFragment.java"

# interfaces
.implements Landroid/widget/CompoundButton$OnCheckedChangeListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/motorola/ccc/ota/ui/UpdatePreferenceFragment;->handleButtons()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/motorola/ccc/ota/ui/UpdatePreferenceFragment;


# direct methods
.method constructor <init>(Lcom/motorola/ccc/ota/ui/UpdatePreferenceFragment;)V
    .locals 0

    iput-object p1, p0, Lcom/motorola/ccc/ota/ui/UpdatePreferenceFragment$1;->this$0:Lcom/motorola/ccc/ota/ui/UpdatePreferenceFragment;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method static synthetic lambda$onCheckedChanged$0(Landroid/content/DialogInterface;I)V
    .locals 0

    invoke-interface {p0}, Landroid/content/DialogInterface;->cancel()V

    return-void
.end method


# virtual methods
.method synthetic lambda$onCheckedChanged$1$com-motorola-ccc-ota-ui-UpdatePreferenceFragment$1(Landroid/content/DialogInterface;I)V
    .locals 0

    sget-object p2, Lcom/motorola/ccc/ota/utils/SmartUpdateUtils$SmartUpdateLaunchMode;->UPGRADE_PREFERENCE_FRAGMENT:Lcom/motorola/ccc/ota/utils/SmartUpdateUtils$SmartUpdateLaunchMode;

    invoke-virtual {p2}, Lcom/motorola/ccc/ota/utils/SmartUpdateUtils$SmartUpdateLaunchMode;->name()Ljava/lang/String;

    move-result-object p2

    invoke-static {p2}, Lcom/motorola/ccc/ota/utils/SmartUpdateUtils;->turnSmartUpdateOff(Ljava/lang/String;)V

    iget-object p0, p0, Lcom/motorola/ccc/ota/ui/UpdatePreferenceFragment$1;->this$0:Lcom/motorola/ccc/ota/ui/UpdatePreferenceFragment;

    invoke-static {p0}, Lcom/motorola/ccc/ota/ui/UpdatePreferenceFragment;->-$$Nest$minitUI(Lcom/motorola/ccc/ota/ui/UpdatePreferenceFragment;)V

    invoke-interface {p1}, Landroid/content/DialogInterface;->cancel()V

    return-void
.end method

.method public onCheckedChanged(Landroid/widget/CompoundButton;Z)V
    .locals 6

    if-eqz p2, :cond_0

    iget-object p1, p0, Lcom/motorola/ccc/ota/ui/UpdatePreferenceFragment$1;->this$0:Lcom/motorola/ccc/ota/ui/UpdatePreferenceFragment;

    invoke-static {p1}, Lcom/motorola/ccc/ota/ui/UpdatePreferenceFragment;->-$$Nest$fgetsettings(Lcom/motorola/ccc/ota/ui/UpdatePreferenceFragment;)Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    move-result-object p1

    invoke-static {p1}, Lcom/motorola/ccc/ota/utils/SmartUpdateUtils;->isSmartUpdateEnabledByUser(Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;)Z

    move-result p1

    if-nez p1, :cond_1

    sget-object p1, Lcom/motorola/ccc/ota/utils/SmartUpdateUtils$SmartUpdateLaunchMode;->UPGRADE_PREFERENCE_FRAGMENT:Lcom/motorola/ccc/ota/utils/SmartUpdateUtils$SmartUpdateLaunchMode;

    invoke-virtual {p1}, Lcom/motorola/ccc/ota/utils/SmartUpdateUtils$SmartUpdateLaunchMode;->name()Ljava/lang/String;

    move-result-object p1

    invoke-static {p1}, Lcom/motorola/ccc/ota/utils/SmartUpdateUtils;->turnSmartUpdateOn(Ljava/lang/String;)V

    iget-object p0, p0, Lcom/motorola/ccc/ota/ui/UpdatePreferenceFragment$1;->this$0:Lcom/motorola/ccc/ota/ui/UpdatePreferenceFragment;

    invoke-static {p0}, Lcom/motorola/ccc/ota/ui/UpdatePreferenceFragment;->-$$Nest$mlaunchSmartUpdate(Lcom/motorola/ccc/ota/ui/UpdatePreferenceFragment;)V

    goto :goto_0

    :cond_0
    iget-object p1, p0, Lcom/motorola/ccc/ota/ui/UpdatePreferenceFragment$1;->this$0:Lcom/motorola/ccc/ota/ui/UpdatePreferenceFragment;

    invoke-static {p1}, Lcom/motorola/ccc/ota/ui/UpdatePreferenceFragment;->-$$Nest$fgetsettings(Lcom/motorola/ccc/ota/ui/UpdatePreferenceFragment;)Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    move-result-object p1

    invoke-static {p1}, Lcom/motorola/ccc/ota/utils/SmartUpdateUtils;->isSmartUpdateEnabledByUser(Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;)Z

    move-result p1

    if-eqz p1, :cond_1

    iget-object p1, p0, Lcom/motorola/ccc/ota/ui/UpdatePreferenceFragment$1;->this$0:Lcom/motorola/ccc/ota/ui/UpdatePreferenceFragment;

    invoke-static {p1}, Lcom/motorola/ccc/ota/ui/UpdatePreferenceFragment;->-$$Nest$fgetmContext(Lcom/motorola/ccc/ota/ui/UpdatePreferenceFragment;)Landroid/content/Context;

    move-result-object p1

    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object p1

    const p2, 0x7f0e003a

    invoke-virtual {p1, p2}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v1

    iget-object p1, p0, Lcom/motorola/ccc/ota/ui/UpdatePreferenceFragment$1;->this$0:Lcom/motorola/ccc/ota/ui/UpdatePreferenceFragment;

    invoke-static {p1}, Lcom/motorola/ccc/ota/ui/UpdatePreferenceFragment;->-$$Nest$fgetmContext(Lcom/motorola/ccc/ota/ui/UpdatePreferenceFragment;)Landroid/content/Context;

    move-result-object p1

    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object p1

    const p2, 0x7f0e003b

    invoke-virtual {p1, p2}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v2

    iget-object p1, p0, Lcom/motorola/ccc/ota/ui/UpdatePreferenceFragment$1;->this$0:Lcom/motorola/ccc/ota/ui/UpdatePreferenceFragment;

    invoke-static {p1}, Lcom/motorola/ccc/ota/ui/UpdatePreferenceFragment;->-$$Nest$fgetmContext(Lcom/motorola/ccc/ota/ui/UpdatePreferenceFragment;)Landroid/content/Context;

    move-result-object v0

    iget-object p2, p0, Lcom/motorola/ccc/ota/ui/UpdatePreferenceFragment$1;->this$0:Lcom/motorola/ccc/ota/ui/UpdatePreferenceFragment;

    invoke-static {p2}, Lcom/motorola/ccc/ota/ui/UpdatePreferenceFragment;->-$$Nest$fgetmActivity(Lcom/motorola/ccc/ota/ui/UpdatePreferenceFragment;)Landroidx/fragment/app/FragmentActivity;

    move-result-object v3

    new-instance v4, Lcom/motorola/ccc/ota/ui/UpdatePreferenceFragment$1$$ExternalSyntheticLambda0;

    invoke-direct {v4}, Lcom/motorola/ccc/ota/ui/UpdatePreferenceFragment$1$$ExternalSyntheticLambda0;-><init>()V

    new-instance v5, Lcom/motorola/ccc/ota/ui/UpdatePreferenceFragment$1$$ExternalSyntheticLambda1;

    invoke-direct {v5, p0}, Lcom/motorola/ccc/ota/ui/UpdatePreferenceFragment$1$$ExternalSyntheticLambda1;-><init>(Lcom/motorola/ccc/ota/ui/UpdatePreferenceFragment$1;)V

    invoke-static/range {v0 .. v5}, Lcom/motorola/ccc/ota/utils/SmartUpdateUtils;->getAndShowAreYouSurePopUp(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Landroid/app/Activity;Landroid/content/DialogInterface$OnClickListener;Landroid/content/DialogInterface$OnClickListener;)Landroidx/appcompat/app/AlertDialog;

    move-result-object p2

    invoke-static {p1, p2}, Lcom/motorola/ccc/ota/ui/UpdatePreferenceFragment;->-$$Nest$fputturnOffSureSmartUpdateDialog(Lcom/motorola/ccc/ota/ui/UpdatePreferenceFragment;Landroidx/appcompat/app/AlertDialog;)V

    iget-object p0, p0, Lcom/motorola/ccc/ota/ui/UpdatePreferenceFragment$1;->this$0:Lcom/motorola/ccc/ota/ui/UpdatePreferenceFragment;

    invoke-static {p0}, Lcom/motorola/ccc/ota/ui/UpdatePreferenceFragment;->-$$Nest$minitUI(Lcom/motorola/ccc/ota/ui/UpdatePreferenceFragment;)V

    :cond_1
    :goto_0
    return-void
.end method
