.class Lcom/motorola/ccc/ota/ui/RestartFragment$PreInstallCounter;
.super Landroid/os/CountDownTimer;
.source "RestartFragment.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/motorola/ccc/ota/ui/RestartFragment;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "PreInstallCounter"
.end annotation


# instance fields
.field private mWarningTextCounter:Landroid/widget/TextView;

.field resources:Landroid/content/res/Resources;

.field final synthetic this$0:Lcom/motorola/ccc/ota/ui/RestartFragment;


# direct methods
.method public constructor <init>(Lcom/motorola/ccc/ota/ui/RestartFragment;JJLandroid/widget/TextView;)V
    .locals 0

    iput-object p1, p0, Lcom/motorola/ccc/ota/ui/RestartFragment$PreInstallCounter;->this$0:Lcom/motorola/ccc/ota/ui/RestartFragment;

    invoke-direct {p0, p2, p3, p4, p5}, Landroid/os/CountDownTimer;-><init>(JJ)V

    iput-object p6, p0, Lcom/motorola/ccc/ota/ui/RestartFragment$PreInstallCounter;->mWarningTextCounter:Landroid/widget/TextView;

    invoke-virtual {p1}, Lcom/motorola/ccc/ota/ui/RestartFragment;->getResources()Landroid/content/res/Resources;

    move-result-object p1

    iput-object p1, p0, Lcom/motorola/ccc/ota/ui/RestartFragment$PreInstallCounter;->resources:Landroid/content/res/Resources;

    return-void
.end method

.method private showPreInstallWarningText(I)V
    .locals 4

    iget-object v0, p0, Lcom/motorola/ccc/ota/ui/RestartFragment$PreInstallCounter;->mWarningTextCounter:Landroid/widget/TextView;

    iget-object v1, p0, Lcom/motorola/ccc/ota/ui/RestartFragment$PreInstallCounter;->this$0:Lcom/motorola/ccc/ota/ui/RestartFragment;

    invoke-static {v1}, Lcom/motorola/ccc/ota/ui/RestartFragment;->-$$Nest$fgetmUpdateType(Lcom/motorola/ccc/ota/ui/RestartFragment;)Lcom/motorola/ccc/ota/ui/updateType/UpdateType$UpdateTypeInterface;

    move-result-object v1

    invoke-interface {v1}, Lcom/motorola/ccc/ota/ui/updateType/UpdateType$UpdateTypeInterface;->getABRestartWarning()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    new-instance v0, Landroid/text/SpannableString;

    iget-object v1, p0, Lcom/motorola/ccc/ota/ui/RestartFragment$PreInstallCounter;->resources:Landroid/content/res/Resources;

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    filled-new-array {v2}, [Ljava/lang/Object;

    move-result-object v2

    const v3, 0x7f0d0001

    invoke-virtual {v1, v3, p1, v2}, Landroid/content/res/Resources;->getQuantityString(II[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Landroid/text/SpannableString;-><init>(Ljava/lang/CharSequence;)V

    invoke-static {p1}, Lcom/motorola/ccc/ota/ui/RestartFragment;->-$$Nest$sfputINSTALL_COUNTDOWN_IN_SECONDS(I)V

    new-instance p1, Landroid/text/style/ForegroundColorSpan;

    const/high16 v1, -0x10000

    invoke-direct {p1, v1}, Landroid/text/style/ForegroundColorSpan;-><init>(I)V

    invoke-interface {v0}, Landroid/text/Spannable;->length()I

    move-result v1

    const/16 v2, 0x21

    const/4 v3, 0x0

    invoke-interface {v0, p1, v3, v1, v2}, Landroid/text/Spannable;->setSpan(Ljava/lang/Object;III)V

    iget-object p1, p0, Lcom/motorola/ccc/ota/ui/RestartFragment$PreInstallCounter;->mWarningTextCounter:Landroid/widget/TextView;

    invoke-virtual {p1, v0}, Landroid/widget/TextView;->append(Ljava/lang/CharSequence;)V

    iget-object p1, p0, Lcom/motorola/ccc/ota/ui/RestartFragment$PreInstallCounter;->mWarningTextCounter:Landroid/widget/TextView;

    iget-object p0, p0, Lcom/motorola/ccc/ota/ui/RestartFragment$PreInstallCounter;->resources:Landroid/content/res/Resources;

    const v0, 0x7f0e0008

    invoke-virtual {p0, v0}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object p0

    invoke-virtual {p1, p0}, Landroid/widget/TextView;->append(Ljava/lang/CharSequence;)V

    return-void
.end method


# virtual methods
.method public onFinish()V
    .locals 2

    const/4 v0, 0x0

    invoke-static {v0}, Lcom/motorola/ccc/ota/ui/RestartFragment;->-$$Nest$sfputisTimerRunning(Z)V

    invoke-static {v0}, Lcom/motorola/ccc/ota/ui/RestartFragment;->-$$Nest$sfputisSmartUpdateTimerRunning(Z)V

    iget-object v0, p0, Lcom/motorola/ccc/ota/ui/RestartFragment$PreInstallCounter;->this$0:Lcom/motorola/ccc/ota/ui/RestartFragment;

    invoke-static {v0}, Lcom/motorola/ccc/ota/ui/RestartFragment;->-$$Nest$fgetsettings(Lcom/motorola/ccc/ota/ui/RestartFragment;)Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    move-result-object v0

    iget-object v1, p0, Lcom/motorola/ccc/ota/ui/RestartFragment$PreInstallCounter;->this$0:Lcom/motorola/ccc/ota/ui/RestartFragment;

    invoke-static {v1}, Lcom/motorola/ccc/ota/ui/RestartFragment;->-$$Nest$fgetmUpgradeInfo(Lcom/motorola/ccc/ota/ui/RestartFragment;)Lcom/motorola/ccc/ota/ui/UpdaterUtils$UpgradeInfo;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/motorola/ccc/ota/utils/SmartUpdateUtils;->getTimerValue(Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;Lcom/motorola/ccc/ota/ui/UpdaterUtils$UpgradeInfo;)I

    move-result v0

    invoke-static {v0}, Lcom/motorola/ccc/ota/ui/RestartFragment;->-$$Nest$sfputINSTALL_COUNTDOWN_IN_SECONDS(I)V

    iget-object p0, p0, Lcom/motorola/ccc/ota/ui/RestartFragment$PreInstallCounter;->this$0:Lcom/motorola/ccc/ota/ui/RestartFragment;

    invoke-static {p0}, Lcom/motorola/ccc/ota/ui/RestartFragment;->-$$Nest$mproceedWithReboot(Lcom/motorola/ccc/ota/ui/RestartFragment;)V

    return-void
.end method

.method public onTick(J)V
    .locals 1

    const/4 v0, 0x1

    invoke-static {v0}, Lcom/motorola/ccc/ota/ui/RestartFragment;->-$$Nest$sfputisTimerRunning(Z)V

    long-to-int p1, p1

    div-int/lit16 p1, p1, 0x3e8

    invoke-direct {p0, p1}, Lcom/motorola/ccc/ota/ui/RestartFragment$PreInstallCounter;->showPreInstallWarningText(I)V

    return-void
.end method

.method public refreshUI(Landroid/widget/TextView;)V
    .locals 0

    iput-object p1, p0, Lcom/motorola/ccc/ota/ui/RestartFragment$PreInstallCounter;->mWarningTextCounter:Landroid/widget/TextView;

    return-void
.end method

.method public stop()V
    .locals 1

    invoke-virtual {p0}, Lcom/motorola/ccc/ota/ui/RestartFragment$PreInstallCounter;->cancel()V

    const/4 v0, 0x0

    invoke-static {v0}, Lcom/motorola/ccc/ota/ui/RestartFragment;->-$$Nest$sfputisTimerRunning(Z)V

    invoke-static {v0}, Lcom/motorola/ccc/ota/ui/RestartFragment;->-$$Nest$sfputisSmartUpdateTimerRunning(Z)V

    iget-object v0, p0, Lcom/motorola/ccc/ota/ui/RestartFragment$PreInstallCounter;->this$0:Lcom/motorola/ccc/ota/ui/RestartFragment;

    invoke-static {v0}, Lcom/motorola/ccc/ota/ui/RestartFragment;->-$$Nest$fgetsettings(Lcom/motorola/ccc/ota/ui/RestartFragment;)Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    move-result-object v0

    iget-object p0, p0, Lcom/motorola/ccc/ota/ui/RestartFragment$PreInstallCounter;->this$0:Lcom/motorola/ccc/ota/ui/RestartFragment;

    invoke-static {p0}, Lcom/motorola/ccc/ota/ui/RestartFragment;->-$$Nest$fgetmUpgradeInfo(Lcom/motorola/ccc/ota/ui/RestartFragment;)Lcom/motorola/ccc/ota/ui/UpdaterUtils$UpgradeInfo;

    move-result-object p0

    invoke-static {v0, p0}, Lcom/motorola/ccc/ota/utils/SmartUpdateUtils;->getTimerValue(Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;Lcom/motorola/ccc/ota/ui/UpdaterUtils$UpgradeInfo;)I

    move-result p0

    invoke-static {p0}, Lcom/motorola/ccc/ota/ui/RestartFragment;->-$$Nest$sfputINSTALL_COUNTDOWN_IN_SECONDS(I)V

    return-void
.end method
