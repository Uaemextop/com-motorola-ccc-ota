.class public Lcom/motorola/ccc/ota/ui/VitalRestartFragment;
.super Landroidx/fragment/app/Fragment;
.source "VitalRestartFragment.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/motorola/ccc/ota/ui/VitalRestartFragment$PreInstallCounter;
    }
.end annotation


# static fields
.field private static final INSTALL_COUNTDOWN_IN_SECONDS:I = 0xa

.field private static mPreInstallCounter:Lcom/motorola/ccc/ota/ui/VitalRestartFragment$PreInstallCounter;


# instance fields
.field private activity:Landroid/app/Activity;

.field private activityIntent:Landroid/content/Intent;

.field private context:Landroid/content/Context;

.field private mDone:Landroid/widget/TextView;

.field private mDoneImg:Landroid/widget/ImageView;

.field private mRestartBtn:Landroid/widget/Button;

.field private mRestartText:Landroid/widget/TextView;

.field private mRestartTitle:Landroid/widget/TextView;

.field private rootView:Landroid/view/View;

.field private settings:Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;


# direct methods
.method static bridge synthetic -$$Nest$mproceedWithReboot(Lcom/motorola/ccc/ota/ui/VitalRestartFragment;)V
    .locals 0

    invoke-direct {p0}, Lcom/motorola/ccc/ota/ui/VitalRestartFragment;->proceedWithReboot()V

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    invoke-direct {p0}, Landroidx/fragment/app/Fragment;-><init>()V

    return-void
.end method

.method private findViewsById()V
    .locals 2

    iget-object v0, p0, Lcom/motorola/ccc/ota/ui/VitalRestartFragment;->rootView:Landroid/view/View;

    const v1, 0x7f0901fc

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p0, Lcom/motorola/ccc/ota/ui/VitalRestartFragment;->mRestartTitle:Landroid/widget/TextView;

    iget-object v0, p0, Lcom/motorola/ccc/ota/ui/VitalRestartFragment;->rootView:Landroid/view/View;

    const v1, 0x7f0901fb

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p0, Lcom/motorola/ccc/ota/ui/VitalRestartFragment;->mRestartText:Landroid/widget/TextView;

    iget-object v0, p0, Lcom/motorola/ccc/ota/ui/VitalRestartFragment;->rootView:Landroid/view/View;

    const v1, 0x7f090061

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/Button;

    iput-object v0, p0, Lcom/motorola/ccc/ota/ui/VitalRestartFragment;->mRestartBtn:Landroid/widget/Button;

    iget-object v0, p0, Lcom/motorola/ccc/ota/ui/VitalRestartFragment;->rootView:Landroid/view/View;

    const v1, 0x7f09011f

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p0, Lcom/motorola/ccc/ota/ui/VitalRestartFragment;->mDone:Landroid/widget/TextView;

    iget-object v0, p0, Lcom/motorola/ccc/ota/ui/VitalRestartFragment;->rootView:Landroid/view/View;

    const v1, 0x7f090141

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/ImageView;

    iput-object v0, p0, Lcom/motorola/ccc/ota/ui/VitalRestartFragment;->mDoneImg:Landroid/widget/ImageView;

    return-void
.end method

.method private proceedWithReboot()V
    .locals 4

    const-string v0, "OtaApp"

    const-string v1, "Vital Update, OTA restart accepted by user!"

    invoke-static {v0, v1}, Lcom/motorola/ccc/ota/utils/Logger;->info(Ljava/lang/String;Ljava/lang/String;)V

    iget-object v0, p0, Lcom/motorola/ccc/ota/ui/VitalRestartFragment;->activityIntent:Landroid/content/Intent;

    const-string v1, "com.motorola.blur.service.blur.upgrade.version"

    invoke-virtual {v0, v1}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    iget-object v1, p0, Lcom/motorola/ccc/ota/ui/VitalRestartFragment;->context:Landroid/content/Context;

    const/4 v2, 0x1

    invoke-static {}, Lcom/motorola/ccc/ota/ui/UpdaterUtils;->getInstallModeStats()Ljava/lang/String;

    move-result-object v3

    invoke-static {v1, v0, v2, v3}, Lcom/motorola/ccc/ota/utils/UpgradeUtilMethods;->sendUpgradeLaunchProceed(Landroid/content/Context;Ljava/lang/String;ZLjava/lang/String;)V

    iget-object v0, p0, Lcom/motorola/ccc/ota/ui/VitalRestartFragment;->settings:Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    invoke-static {v0}, Lcom/motorola/ccc/ota/utils/NotificationUtils;->clearNextPromptDetails(Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;)V

    const/4 v0, 0x0

    sput-object v0, Lcom/motorola/ccc/ota/ui/VitalRestartFragment;->mPreInstallCounter:Lcom/motorola/ccc/ota/ui/VitalRestartFragment$PreInstallCounter;

    iget-object p0, p0, Lcom/motorola/ccc/ota/ui/VitalRestartFragment;->activity:Landroid/app/Activity;

    invoke-virtual {p0}, Landroid/app/Activity;->finish()V

    return-void
.end method

.method private refreshOrStartInstallCounter()V
    .locals 8

    sget-object v0, Lcom/motorola/ccc/ota/ui/VitalRestartFragment;->mPreInstallCounter:Lcom/motorola/ccc/ota/ui/VitalRestartFragment$PreInstallCounter;

    if-eqz v0, :cond_0

    iget-object p0, p0, Lcom/motorola/ccc/ota/ui/VitalRestartFragment;->mRestartText:Landroid/widget/TextView;

    invoke-virtual {v0, p0}, Lcom/motorola/ccc/ota/ui/VitalRestartFragment$PreInstallCounter;->refreshUI(Landroid/widget/TextView;)V

    goto :goto_0

    :cond_0
    new-instance v0, Lcom/motorola/ccc/ota/ui/VitalRestartFragment$PreInstallCounter;

    const-wide/16 v5, 0x3e8

    iget-object v7, p0, Lcom/motorola/ccc/ota/ui/VitalRestartFragment;->mRestartText:Landroid/widget/TextView;

    const-wide/16 v3, 0x2710

    move-object v1, v0

    move-object v2, p0

    invoke-direct/range {v1 .. v7}, Lcom/motorola/ccc/ota/ui/VitalRestartFragment$PreInstallCounter;-><init>(Lcom/motorola/ccc/ota/ui/VitalRestartFragment;JJLandroid/widget/TextView;)V

    sput-object v0, Lcom/motorola/ccc/ota/ui/VitalRestartFragment;->mPreInstallCounter:Lcom/motorola/ccc/ota/ui/VitalRestartFragment$PreInstallCounter;

    invoke-virtual {v0}, Lcom/motorola/ccc/ota/ui/VitalRestartFragment$PreInstallCounter;->start()Landroid/os/CountDownTimer;

    :goto_0
    return-void
.end method


# virtual methods
.method public onActivityCreated(Landroid/os/Bundle;)V
    .locals 0

    invoke-super {p0, p1}, Landroidx/fragment/app/Fragment;->onActivityCreated(Landroid/os/Bundle;)V

    return-void
.end method

.method public onAttach(Landroid/content/Context;)V
    .locals 1

    invoke-super {p0, p1}, Landroidx/fragment/app/Fragment;->onAttach(Landroid/content/Context;)V

    iput-object p1, p0, Lcom/motorola/ccc/ota/ui/VitalRestartFragment;->context:Landroid/content/Context;

    instance-of v0, p1, Landroid/app/Activity;

    if-eqz v0, :cond_0

    check-cast p1, Landroid/app/Activity;

    iput-object p1, p0, Lcom/motorola/ccc/ota/ui/VitalRestartFragment;->activity:Landroid/app/Activity;

    return-void

    :cond_0
    new-instance p0, Ljava/lang/RuntimeException;

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    const-string v0, " must be an instance of Activity"

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-direct {p0, p1}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw p0
.end method

.method public onCreate(Landroid/os/Bundle;)V
    .locals 1

    invoke-super {p0, p1}, Landroidx/fragment/app/Fragment;->onCreate(Landroid/os/Bundle;)V

    new-instance p1, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    invoke-direct {p1}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;-><init>()V

    iput-object p1, p0, Lcom/motorola/ccc/ota/ui/VitalRestartFragment;->settings:Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    invoke-virtual {p0}, Lcom/motorola/ccc/ota/ui/VitalRestartFragment;->getArguments()Landroid/os/Bundle;

    move-result-object p1

    if-eqz p1, :cond_0

    const-string v0, "activityIntent"

    invoke-virtual {p1, v0}, Landroid/os/Bundle;->getParcelable(Ljava/lang/String;)Landroid/os/Parcelable;

    move-result-object p1

    check-cast p1, Landroid/content/Intent;

    iput-object p1, p0, Lcom/motorola/ccc/ota/ui/VitalRestartFragment;->activityIntent:Landroid/content/Intent;

    :cond_0
    return-void
.end method

.method public onCreateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;Landroid/os/Bundle;)Landroid/view/View;
    .locals 1

    const p3, 0x7f0c00a7

    const/4 v0, 0x0

    invoke-virtual {p1, p3, p2, v0}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object p1

    iput-object p1, p0, Lcom/motorola/ccc/ota/ui/VitalRestartFragment;->rootView:Landroid/view/View;

    invoke-direct {p0}, Lcom/motorola/ccc/ota/ui/VitalRestartFragment;->findViewsById()V

    iget-object p1, p0, Lcom/motorola/ccc/ota/ui/VitalRestartFragment;->mRestartBtn:Landroid/widget/Button;

    new-instance p2, Lcom/motorola/ccc/ota/ui/VitalRestartFragment$1;

    invoke-direct {p2, p0}, Lcom/motorola/ccc/ota/ui/VitalRestartFragment$1;-><init>(Lcom/motorola/ccc/ota/ui/VitalRestartFragment;)V

    invoke-virtual {p1, p2}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    new-instance p1, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    invoke-direct {p1}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;-><init>()V

    iput-object p1, p0, Lcom/motorola/ccc/ota/ui/VitalRestartFragment;->settings:Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    iget-object p1, p0, Lcom/motorola/ccc/ota/ui/VitalRestartFragment;->mRestartTitle:Landroid/widget/TextView;

    invoke-virtual {p0}, Lcom/motorola/ccc/ota/ui/VitalRestartFragment;->getResources()Landroid/content/res/Resources;

    move-result-object p2

    const p3, 0x7f0e01f9

    invoke-virtual {p2, p3}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object p2

    invoke-virtual {p1, p2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    iget-object p1, p0, Lcom/motorola/ccc/ota/ui/VitalRestartFragment;->mRestartTitle:Landroid/widget/TextView;

    invoke-virtual {p0}, Lcom/motorola/ccc/ota/ui/VitalRestartFragment;->getResources()Landroid/content/res/Resources;

    move-result-object p2

    invoke-virtual {p2, p3}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object p2

    invoke-virtual {p1, p2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    iget-object p1, p0, Lcom/motorola/ccc/ota/ui/VitalRestartFragment;->mDone:Landroid/widget/TextView;

    invoke-virtual {p1, v0}, Landroid/widget/TextView;->setVisibility(I)V

    iget-object p1, p0, Lcom/motorola/ccc/ota/ui/VitalRestartFragment;->mDone:Landroid/widget/TextView;

    invoke-virtual {p0}, Lcom/motorola/ccc/ota/ui/VitalRestartFragment;->getResources()Landroid/content/res/Resources;

    move-result-object p2

    const p3, 0x7f0e01f5

    invoke-virtual {p2, p3}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object p2

    invoke-virtual {p1, p2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    iget-object p1, p0, Lcom/motorola/ccc/ota/ui/VitalRestartFragment;->mRestartBtn:Landroid/widget/Button;

    invoke-virtual {p1, v0}, Landroid/widget/Button;->setVisibility(I)V

    iget-object p1, p0, Lcom/motorola/ccc/ota/ui/VitalRestartFragment;->mDoneImg:Landroid/widget/ImageView;

    invoke-virtual {p1, v0}, Landroid/widget/ImageView;->setVisibility(I)V

    invoke-direct {p0}, Lcom/motorola/ccc/ota/ui/VitalRestartFragment;->refreshOrStartInstallCounter()V

    iget-object p0, p0, Lcom/motorola/ccc/ota/ui/VitalRestartFragment;->rootView:Landroid/view/View;

    return-object p0
.end method

.method public onDestroy()V
    .locals 0

    invoke-super {p0}, Landroidx/fragment/app/Fragment;->onDestroy()V

    return-void
.end method
