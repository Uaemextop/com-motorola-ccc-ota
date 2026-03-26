.class public Lcom/motorola/ccc/ota/ui/UptoDateFragment;
.super Landroidx/fragment/app/Fragment;
.source "UptoDateFragment.java"

# interfaces
.implements Lcom/motorola/ccc/ota/utils/SmartUpdateUtils$OnSmartUpdateConfigChangedLister;


# instance fields
.field private activityIntent:Landroid/content/Intent;

.field private btnDone:Landroid/widget/Button;

.field private btnNotNow:Landroid/widget/Button;

.field private btnTurnOn:Landroid/widget/Button;

.field private isTransactionSafe:Z

.field private lottieAnimationView:Lcom/airbnb/lottie/LottieAnimationView;

.field private mActivity:Landroidx/fragment/app/FragmentActivity;

.field private mAndroidVersion:Landroid/widget/TextView;

.field private mCurrentVersion:Landroid/widget/TextView;

.field private mSecurityPatch:Landroid/widget/TextView;

.field private rootView:Landroid/view/View;

.field private settings:Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

.field private smartUpdateBottomSheet:Landroid/widget/RelativeLayout;


# direct methods
.method static bridge synthetic -$$Nest$fgetbtnDone(Lcom/motorola/ccc/ota/ui/UptoDateFragment;)Landroid/widget/Button;
    .locals 0

    iget-object p0, p0, Lcom/motorola/ccc/ota/ui/UptoDateFragment;->btnDone:Landroid/widget/Button;

    return-object p0
.end method

.method static bridge synthetic -$$Nest$fgetmActivity(Lcom/motorola/ccc/ota/ui/UptoDateFragment;)Landroidx/fragment/app/FragmentActivity;
    .locals 0

    iget-object p0, p0, Lcom/motorola/ccc/ota/ui/UptoDateFragment;->mActivity:Landroidx/fragment/app/FragmentActivity;

    return-object p0
.end method

.method static bridge synthetic -$$Nest$fgetsettings(Lcom/motorola/ccc/ota/ui/UptoDateFragment;)Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;
    .locals 0

    iget-object p0, p0, Lcom/motorola/ccc/ota/ui/UptoDateFragment;->settings:Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    return-object p0
.end method

.method static bridge synthetic -$$Nest$fgetsmartUpdateBottomSheet(Lcom/motorola/ccc/ota/ui/UptoDateFragment;)Landroid/widget/RelativeLayout;
    .locals 0

    iget-object p0, p0, Lcom/motorola/ccc/ota/ui/UptoDateFragment;->smartUpdateBottomSheet:Landroid/widget/RelativeLayout;

    return-object p0
.end method

.method static bridge synthetic -$$Nest$mlaunchSmartUpdate(Lcom/motorola/ccc/ota/ui/UptoDateFragment;)V
    .locals 0

    invoke-direct {p0}, Lcom/motorola/ccc/ota/ui/UptoDateFragment;->launchSmartUpdate()V

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    invoke-direct {p0}, Landroidx/fragment/app/Fragment;-><init>()V

    return-void
.end method

.method private checkAndDisplayText(Landroid/widget/TextView;Ljava/lang/String;Ljava/lang/String;)V
    .locals 0

    if-eqz p3, :cond_0

    new-instance p0, Ljava/lang/StringBuilder;

    invoke-direct {p0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p0

    const-string p2, " "

    invoke-virtual {p0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p0

    invoke-virtual {p0, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-virtual {p1, p0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    goto :goto_0

    :cond_0
    const/16 p0, 0x8

    invoke-virtual {p1, p0}, Landroid/widget/TextView;->setVisibility(I)V

    :goto_0
    return-void
.end method

.method private handleBottomSheet()V
    .locals 3

    iget-object v0, p0, Lcom/motorola/ccc/ota/ui/UptoDateFragment;->settings:Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    invoke-static {v0}, Lcom/motorola/ccc/ota/utils/SmartUpdateUtils;->shouldShowSmartUpdateBottomSheet(Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;)Z

    move-result v0

    const/16 v1, 0x8

    const/4 v2, 0x0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/motorola/ccc/ota/ui/UptoDateFragment;->smartUpdateBottomSheet:Landroid/widget/RelativeLayout;

    invoke-virtual {v0, v2}, Landroid/widget/RelativeLayout;->setVisibility(I)V

    iget-object p0, p0, Lcom/motorola/ccc/ota/ui/UptoDateFragment;->btnDone:Landroid/widget/Button;

    invoke-virtual {p0, v1}, Landroid/widget/Button;->setVisibility(I)V

    goto :goto_0

    :cond_0
    iget-object v0, p0, Lcom/motorola/ccc/ota/ui/UptoDateFragment;->btnDone:Landroid/widget/Button;

    invoke-virtual {v0, v2}, Landroid/widget/Button;->setVisibility(I)V

    iget-object p0, p0, Lcom/motorola/ccc/ota/ui/UptoDateFragment;->smartUpdateBottomSheet:Landroid/widget/RelativeLayout;

    invoke-virtual {p0, v1}, Landroid/widget/RelativeLayout;->setVisibility(I)V

    :goto_0
    return-void
.end method

.method private launchSmartUpdate()V
    .locals 4

    new-instance v0, Landroid/os/Bundle;

    invoke-direct {v0}, Landroid/os/Bundle;-><init>()V

    iget-object v1, p0, Lcom/motorola/ccc/ota/ui/UptoDateFragment;->mActivity:Landroidx/fragment/app/FragmentActivity;

    invoke-virtual {v1}, Landroidx/fragment/app/FragmentActivity;->getIntent()Landroid/content/Intent;

    move-result-object v1

    iput-object v1, p0, Lcom/motorola/ccc/ota/ui/UptoDateFragment;->activityIntent:Landroid/content/Intent;

    sget-object v2, Lcom/motorola/ccc/ota/utils/SmartUpdateUtils$SmartUpdateLaunchMode;->UP_TO_DATE_FRAGMENT:Lcom/motorola/ccc/ota/utils/SmartUpdateUtils$SmartUpdateLaunchMode;

    invoke-virtual {v2}, Lcom/motorola/ccc/ota/utils/SmartUpdateUtils$SmartUpdateLaunchMode;->name()Ljava/lang/String;

    move-result-object v2

    const-string v3, "com.motorola.blur.service.blur.update.launch_mode"

    invoke-virtual {v1, v3, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    const-string v1, "activityIntent"

    iget-object v2, p0, Lcom/motorola/ccc/ota/ui/UptoDateFragment;->activityIntent:Landroid/content/Intent;

    invoke-virtual {v0, v1, v2}, Landroid/os/Bundle;->putParcelable(Ljava/lang/String;Landroid/os/Parcelable;)V

    new-instance v1, Lcom/motorola/ccc/ota/ui/SmartUpdateFragment;

    invoke-direct {v1}, Lcom/motorola/ccc/ota/ui/SmartUpdateFragment;-><init>()V

    invoke-virtual {v1, v0}, Lcom/motorola/ccc/ota/ui/SmartUpdateFragment;->setArguments(Landroid/os/Bundle;)V

    iget-boolean v0, p0, Lcom/motorola/ccc/ota/ui/UptoDateFragment;->isTransactionSafe:Z

    if-eqz v0, :cond_0

    iget-object p0, p0, Lcom/motorola/ccc/ota/ui/UptoDateFragment;->mActivity:Landroidx/fragment/app/FragmentActivity;

    invoke-virtual {p0}, Landroidx/fragment/app/FragmentActivity;->getSupportFragmentManager()Landroidx/fragment/app/FragmentManager;

    move-result-object p0

    const-string v0, "SmartUpdateDialog"

    invoke-virtual {v1, p0, v0}, Lcom/motorola/ccc/ota/ui/SmartUpdateFragment;->show(Landroidx/fragment/app/FragmentManager;Ljava/lang/String;)V

    :cond_0
    return-void
.end method

.method private setVersionData()V
    .locals 3

    iget-object v0, p0, Lcom/motorola/ccc/ota/ui/UptoDateFragment;->mAndroidVersion:Landroid/widget/TextView;

    invoke-virtual {p0}, Lcom/motorola/ccc/ota/ui/UptoDateFragment;->getContext()Landroid/content/Context;

    move-result-object v1

    const v2, 0x7f0e0032

    invoke-virtual {v1, v2}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v1

    invoke-static {}, Lcom/motorola/ccc/ota/utils/BuildPropReader;->getAndroidVersion()Ljava/lang/String;

    move-result-object v2

    invoke-direct {p0, v0, v1, v2}, Lcom/motorola/ccc/ota/ui/UptoDateFragment;->checkAndDisplayText(Landroid/widget/TextView;Ljava/lang/String;Ljava/lang/String;)V

    iget-object v0, p0, Lcom/motorola/ccc/ota/ui/UptoDateFragment;->mSecurityPatch:Landroid/widget/TextView;

    invoke-virtual {p0}, Lcom/motorola/ccc/ota/ui/UptoDateFragment;->getContext()Landroid/content/Context;

    move-result-object v1

    const v2, 0x7f0e017f

    invoke-virtual {v1, v2}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v1

    invoke-static {}, Lcom/motorola/ccc/ota/utils/DateFormatUtils;->getSecurityPatch()Ljava/lang/String;

    move-result-object v2

    invoke-direct {p0, v0, v1, v2}, Lcom/motorola/ccc/ota/ui/UptoDateFragment;->checkAndDisplayText(Landroid/widget/TextView;Ljava/lang/String;Ljava/lang/String;)V

    iget-object v0, p0, Lcom/motorola/ccc/ota/ui/UptoDateFragment;->mCurrentVersion:Landroid/widget/TextView;

    invoke-virtual {p0}, Lcom/motorola/ccc/ota/ui/UptoDateFragment;->getContext()Landroid/content/Context;

    move-result-object v1

    const v2, 0x7f0e00ad

    invoke-virtual {v1, v2}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v1

    invoke-static {}, Lcom/motorola/ccc/ota/utils/BuildPropReader;->getBuildDescription()Ljava/lang/String;

    move-result-object v2

    invoke-direct {p0, v0, v1, v2}, Lcom/motorola/ccc/ota/ui/UptoDateFragment;->checkAndDisplayText(Landroid/widget/TextView;Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method


# virtual methods
.method public onActivityCreated(Landroid/os/Bundle;)V
    .locals 1

    invoke-super {p0, p1}, Landroidx/fragment/app/Fragment;->onActivityCreated(Landroid/os/Bundle;)V

    invoke-virtual {p0}, Lcom/motorola/ccc/ota/ui/UptoDateFragment;->getArguments()Landroid/os/Bundle;

    move-result-object p1

    if-eqz p1, :cond_0

    const-string v0, "activityIntent"

    invoke-virtual {p1, v0}, Landroid/os/Bundle;->getParcelable(Ljava/lang/String;)Landroid/os/Parcelable;

    move-result-object p1

    check-cast p1, Landroid/content/Intent;

    iput-object p1, p0, Lcom/motorola/ccc/ota/ui/UptoDateFragment;->activityIntent:Landroid/content/Intent;

    :cond_0
    invoke-virtual {p0}, Lcom/motorola/ccc/ota/ui/UptoDateFragment;->getResources()Landroid/content/res/Resources;

    new-instance p1, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    invoke-direct {p1}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;-><init>()V

    iput-object p1, p0, Lcom/motorola/ccc/ota/ui/UptoDateFragment;->settings:Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    iget-object p1, p0, Lcom/motorola/ccc/ota/ui/UptoDateFragment;->mActivity:Landroidx/fragment/app/FragmentActivity;

    invoke-virtual {p1}, Landroidx/fragment/app/FragmentActivity;->getWindow()Landroid/view/Window;

    move-result-object p1

    const/high16 v0, -0x80000000

    invoke-virtual {p1, v0}, Landroid/view/Window;->addFlags(I)V

    const/4 v0, 0x0

    invoke-virtual {p1, v0}, Landroid/view/Window;->setStatusBarColor(I)V

    invoke-virtual {p1, v0}, Landroid/view/Window;->setNavigationBarColor(I)V

    iget-object p1, p0, Lcom/motorola/ccc/ota/ui/UptoDateFragment;->lottieAnimationView:Lcom/airbnb/lottie/LottieAnimationView;

    const/4 v0, -0x1

    invoke-virtual {p1, v0}, Lcom/airbnb/lottie/LottieAnimationView;->setRepeatCount(I)V

    iget-object p1, p0, Lcom/motorola/ccc/ota/ui/UptoDateFragment;->lottieAnimationView:Lcom/airbnb/lottie/LottieAnimationView;

    const-string v0, "check_mark.json"

    invoke-virtual {p1, v0}, Lcom/airbnb/lottie/LottieAnimationView;->setAnimation(Ljava/lang/String;)V

    iget-object p1, p0, Lcom/motorola/ccc/ota/ui/UptoDateFragment;->lottieAnimationView:Lcom/airbnb/lottie/LottieAnimationView;

    invoke-virtual {p1}, Lcom/airbnb/lottie/LottieAnimationView;->playAnimation()V

    invoke-direct {p0}, Lcom/motorola/ccc/ota/ui/UptoDateFragment;->setVersionData()V

    invoke-direct {p0}, Lcom/motorola/ccc/ota/ui/UptoDateFragment;->handleBottomSheet()V

    iget-object p1, p0, Lcom/motorola/ccc/ota/ui/UptoDateFragment;->btnDone:Landroid/widget/Button;

    new-instance v0, Lcom/motorola/ccc/ota/ui/UptoDateFragment$1;

    invoke-direct {v0, p0}, Lcom/motorola/ccc/ota/ui/UptoDateFragment$1;-><init>(Lcom/motorola/ccc/ota/ui/UptoDateFragment;)V

    invoke-virtual {p1, v0}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    iget-object p1, p0, Lcom/motorola/ccc/ota/ui/UptoDateFragment;->btnTurnOn:Landroid/widget/Button;

    new-instance v0, Lcom/motorola/ccc/ota/ui/UptoDateFragment$2;

    invoke-direct {v0, p0}, Lcom/motorola/ccc/ota/ui/UptoDateFragment$2;-><init>(Lcom/motorola/ccc/ota/ui/UptoDateFragment;)V

    invoke-virtual {p1, v0}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    iget-object p1, p0, Lcom/motorola/ccc/ota/ui/UptoDateFragment;->btnNotNow:Landroid/widget/Button;

    new-instance v0, Lcom/motorola/ccc/ota/ui/UptoDateFragment$3;

    invoke-direct {v0, p0}, Lcom/motorola/ccc/ota/ui/UptoDateFragment$3;-><init>(Lcom/motorola/ccc/ota/ui/UptoDateFragment;)V

    invoke-virtual {p1, v0}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    return-void
.end method

.method public onAttach(Landroid/content/Context;)V
    .locals 1

    invoke-super {p0, p1}, Landroidx/fragment/app/Fragment;->onAttach(Landroid/content/Context;)V

    instance-of v0, p1, Landroid/app/Activity;

    if-eqz v0, :cond_0

    check-cast p1, Landroidx/fragment/app/FragmentActivity;

    iput-object p1, p0, Lcom/motorola/ccc/ota/ui/UptoDateFragment;->mActivity:Landroidx/fragment/app/FragmentActivity;

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

.method public onCreateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;Landroid/os/Bundle;)Landroid/view/View;
    .locals 1

    const p3, 0x7f0c005b

    const/4 v0, 0x0

    invoke-virtual {p1, p3, p2, v0}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object p1

    iput-object p1, p0, Lcom/motorola/ccc/ota/ui/UptoDateFragment;->rootView:Landroid/view/View;

    const p2, 0x7f090057

    invoke-virtual {p1, p2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p1

    check-cast p1, Landroid/widget/Button;

    iput-object p1, p0, Lcom/motorola/ccc/ota/ui/UptoDateFragment;->btnDone:Landroid/widget/Button;

    iget-object p1, p0, Lcom/motorola/ccc/ota/ui/UptoDateFragment;->rootView:Landroid/view/View;

    const p2, 0x7f09005d

    invoke-virtual {p1, p2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p1

    check-cast p1, Landroid/widget/Button;

    iput-object p1, p0, Lcom/motorola/ccc/ota/ui/UptoDateFragment;->btnTurnOn:Landroid/widget/Button;

    iget-object p1, p0, Lcom/motorola/ccc/ota/ui/UptoDateFragment;->rootView:Landroid/view/View;

    const p2, 0x7f09005a

    invoke-virtual {p1, p2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p1

    check-cast p1, Landroid/widget/Button;

    iput-object p1, p0, Lcom/motorola/ccc/ota/ui/UptoDateFragment;->btnNotNow:Landroid/widget/Button;

    iget-object p1, p0, Lcom/motorola/ccc/ota/ui/UptoDateFragment;->rootView:Landroid/view/View;

    const p2, 0x7f090047

    invoke-virtual {p1, p2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p1

    check-cast p1, Landroid/widget/TextView;

    iput-object p1, p0, Lcom/motorola/ccc/ota/ui/UptoDateFragment;->mAndroidVersion:Landroid/widget/TextView;

    iget-object p1, p0, Lcom/motorola/ccc/ota/ui/UptoDateFragment;->rootView:Landroid/view/View;

    const p2, 0x7f09015e

    invoke-virtual {p1, p2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p1

    check-cast p1, Landroid/widget/TextView;

    iput-object p1, p0, Lcom/motorola/ccc/ota/ui/UptoDateFragment;->mSecurityPatch:Landroid/widget/TextView;

    iget-object p1, p0, Lcom/motorola/ccc/ota/ui/UptoDateFragment;->rootView:Landroid/view/View;

    const p2, 0x7f09005e

    invoke-virtual {p1, p2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p1

    check-cast p1, Landroid/widget/TextView;

    iput-object p1, p0, Lcom/motorola/ccc/ota/ui/UptoDateFragment;->mCurrentVersion:Landroid/widget/TextView;

    iget-object p1, p0, Lcom/motorola/ccc/ota/ui/UptoDateFragment;->rootView:Landroid/view/View;

    const p2, 0x7f090053

    invoke-virtual {p1, p2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p1

    check-cast p1, Landroid/widget/RelativeLayout;

    iput-object p1, p0, Lcom/motorola/ccc/ota/ui/UptoDateFragment;->smartUpdateBottomSheet:Landroid/widget/RelativeLayout;

    iget-object p1, p0, Lcom/motorola/ccc/ota/ui/UptoDateFragment;->rootView:Landroid/view/View;

    const p2, 0x7f0900fb

    invoke-virtual {p1, p2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p1

    check-cast p1, Lcom/airbnb/lottie/LottieAnimationView;

    iput-object p1, p0, Lcom/motorola/ccc/ota/ui/UptoDateFragment;->lottieAnimationView:Lcom/airbnb/lottie/LottieAnimationView;

    iget-object p0, p0, Lcom/motorola/ccc/ota/ui/UptoDateFragment;->rootView:Landroid/view/View;

    return-object p0
.end method

.method public onDestroy()V
    .locals 0

    invoke-super {p0}, Landroidx/fragment/app/Fragment;->onDestroy()V

    return-void
.end method

.method public onDestroyView()V
    .locals 0

    invoke-super {p0}, Landroidx/fragment/app/Fragment;->onDestroyView()V

    return-void
.end method

.method public onPause()V
    .locals 1

    invoke-super {p0}, Landroidx/fragment/app/Fragment;->onPause()V

    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/motorola/ccc/ota/ui/UptoDateFragment;->isTransactionSafe:Z

    return-void
.end method

.method public onResume()V
    .locals 1

    invoke-super {p0}, Landroidx/fragment/app/Fragment;->onResume()V

    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/motorola/ccc/ota/ui/UptoDateFragment;->isTransactionSafe:Z

    return-void
.end method

.method public onSmartUpdateConfigChanged()V
    .locals 2

    const-string v0, "OtaApp"

    const-string v1, "UptoDateFragment,onSmartUpdateConfigChanged"

    invoke-static {v0, v1}, Lcom/motorola/ccc/ota/utils/Logger;->debug(Ljava/lang/String;Ljava/lang/String;)V

    invoke-direct {p0}, Lcom/motorola/ccc/ota/ui/UptoDateFragment;->handleBottomSheet()V

    return-void
.end method

.method public onStop()V
    .locals 0

    invoke-super {p0}, Landroidx/fragment/app/Fragment;->onStop()V

    return-void
.end method
