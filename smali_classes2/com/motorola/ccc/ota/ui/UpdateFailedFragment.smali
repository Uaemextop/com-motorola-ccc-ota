.class public Lcom/motorola/ccc/ota/ui/UpdateFailedFragment;
.super Landroidx/fragment/app/Fragment;
.source "UpdateFailedFragment.java"


# instance fields
.field private isMergeFailure:Z

.field private lottieAnimationView:Lcom/airbnb/lottie/LottieAnimationView;

.field private mActivity:Landroid/app/Activity;

.field private mDone:Landroid/widget/Button;

.field private mInfo:Lcom/motorola/ccc/ota/ui/UpdaterUtils$UpgradeInfo;

.field private mIntent:Landroid/content/Intent;

.field private mPostInstallFailureNotes:Landroid/widget/TextView;

.field private mRootView:Landroid/view/View;

.field private mUpdateFailedDesc:Landroid/widget/TextView;

.field private mUpdateFailedTitle:Landroid/widget/TextView;

.field private mUpdateType:Lcom/motorola/ccc/ota/ui/updateType/UpdateType$UpdateTypeInterface;


# direct methods
.method static bridge synthetic -$$Nest$mhandleOnCancelUpdateFragment(Lcom/motorola/ccc/ota/ui/UpdateFailedFragment;)V
    .locals 0

    invoke-direct {p0}, Lcom/motorola/ccc/ota/ui/UpdateFailedFragment;->handleOnCancelUpdateFragment()V

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    invoke-direct {p0}, Landroidx/fragment/app/Fragment;-><init>()V

    return-void
.end method

.method private handleOnCancelUpdateFragment()V
    .locals 0

    iget-object p0, p0, Lcom/motorola/ccc/ota/ui/UpdateFailedFragment;->mActivity:Landroid/app/Activity;

    invoke-virtual {p0}, Landroid/app/Activity;->finish()V

    return-void
.end method

.method private setPostInstallNotes(Lcom/motorola/ccc/ota/ui/UpdaterUtils$UpgradeInfo;)V
    .locals 4

    invoke-virtual {p1}, Lcom/motorola/ccc/ota/ui/UpdaterUtils$UpgradeInfo;->getLocationType()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1}, Lcom/motorola/ccc/ota/ui/UpdaterUtils$UpgradeInfo;->getPostInstallFailureMessage()Ljava/lang/String;

    move-result-object p1

    :try_start_0
    const-string v1, "sdcard"

    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_0

    iget-object v0, p0, Lcom/motorola/ccc/ota/ui/UpdateFailedFragment;->mPostInstallFailureNotes:Landroid/widget/TextView;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setVisibility(I)V

    iget-object v0, p0, Lcom/motorola/ccc/ota/ui/UpdateFailedFragment;->mPostInstallFailureNotes:Landroid/widget/TextView;

    new-instance v2, Lcom/motorola/ccc/ota/ui/HtmlUtils;

    invoke-direct {v2, p1}, Lcom/motorola/ccc/ota/ui/HtmlUtils;-><init>(Ljava/lang/String;)V

    const/4 v3, 0x0

    invoke-static {p1, v1, v3, v2}, Landroid/text/Html;->fromHtml(Ljava/lang/String;ILandroid/text/Html$ImageGetter;Landroid/text/Html$TagHandler;)Landroid/text/Spanned;

    move-result-object p1

    invoke-virtual {v0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    iget-object p1, p0, Lcom/motorola/ccc/ota/ui/UpdateFailedFragment;->mPostInstallFailureNotes:Landroid/widget/TextView;

    invoke-static {}, Landroid/text/method/LinkMovementMethod;->getInstance()Landroid/text/method/MovementMethod;

    move-result-object v0

    invoke-virtual {p1, v0}, Landroid/widget/TextView;->setMovementMethod(Landroid/text/method/MovementMethod;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception p1

    iget-object p0, p0, Lcom/motorola/ccc/ota/ui/UpdateFailedFragment;->mPostInstallFailureNotes:Landroid/widget/TextView;

    const/4 v0, 0x4

    invoke-virtual {p0, v0}, Landroid/widget/TextView;->setVisibility(I)V

    new-instance p0, Ljava/lang/StringBuilder;

    const-string v0, "UpdateFailedFragment, error setting PostInstallFailureNotes."

    invoke-direct {p0, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    const-string p1, "OtaApp"

    invoke-static {p1, p0}, Lcom/motorola/ccc/ota/utils/Logger;->error(Ljava/lang/String;Ljava/lang/String;)V

    :cond_0
    :goto_0
    return-void
.end method


# virtual methods
.method initUI()V
    .locals 2

    const-string v0, "OtaApp"

    const-string v1, "Update Fail Status displayed to user"

    invoke-static {v0, v1}, Lcom/motorola/ccc/ota/utils/Logger;->debug(Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {p0}, Lcom/motorola/ccc/ota/ui/UpdateFailedFragment;->getArguments()Landroid/os/Bundle;

    move-result-object v0

    if-eqz v0, :cond_0

    const-string v1, "activityIntent"

    invoke-virtual {v0, v1}, Landroid/os/Bundle;->getParcelable(Ljava/lang/String;)Landroid/os/Parcelable;

    move-result-object v1

    check-cast v1, Landroid/content/Intent;

    iput-object v1, p0, Lcom/motorola/ccc/ota/ui/UpdateFailedFragment;->mIntent:Landroid/content/Intent;

    const-string v1, "MergeStatusFailure"

    invoke-virtual {v0, v1}, Landroid/os/Bundle;->getBoolean(Ljava/lang/String;)Z

    move-result v0

    iput-boolean v0, p0, Lcom/motorola/ccc/ota/ui/UpdateFailedFragment;->isMergeFailure:Z

    :cond_0
    iget-object v0, p0, Lcom/motorola/ccc/ota/ui/UpdateFailedFragment;->mRootView:Landroid/view/View;

    const v1, 0x7f0901f0

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p0, Lcom/motorola/ccc/ota/ui/UpdateFailedFragment;->mUpdateFailedTitle:Landroid/widget/TextView;

    iget-object v0, p0, Lcom/motorola/ccc/ota/ui/UpdateFailedFragment;->mRootView:Landroid/view/View;

    const v1, 0x7f0901ee

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p0, Lcom/motorola/ccc/ota/ui/UpdateFailedFragment;->mUpdateFailedDesc:Landroid/widget/TextView;

    iget-object v0, p0, Lcom/motorola/ccc/ota/ui/UpdateFailedFragment;->mRootView:Landroid/view/View;

    const v1, 0x7f09012a

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p0, Lcom/motorola/ccc/ota/ui/UpdateFailedFragment;->mPostInstallFailureNotes:Landroid/widget/TextView;

    invoke-static {}, Landroid/text/method/ScrollingMovementMethod;->getInstance()Landroid/text/method/MovementMethod;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setMovementMethod(Landroid/text/method/MovementMethod;)V

    iget-object v0, p0, Lcom/motorola/ccc/ota/ui/UpdateFailedFragment;->mRootView:Landroid/view/View;

    const v1, 0x7f0901f4

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/Button;

    iput-object v0, p0, Lcom/motorola/ccc/ota/ui/UpdateFailedFragment;->mDone:Landroid/widget/Button;

    iget-object v0, p0, Lcom/motorola/ccc/ota/ui/UpdateFailedFragment;->mRootView:Landroid/view/View;

    const v1, 0x7f0900fa

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Lcom/airbnb/lottie/LottieAnimationView;

    iput-object v0, p0, Lcom/motorola/ccc/ota/ui/UpdateFailedFragment;->lottieAnimationView:Lcom/airbnb/lottie/LottieAnimationView;

    iget-object v0, p0, Lcom/motorola/ccc/ota/ui/UpdateFailedFragment;->mDone:Landroid/widget/Button;

    new-instance v1, Lcom/motorola/ccc/ota/ui/UpdateFailedFragment$1;

    invoke-direct {v1, p0}, Lcom/motorola/ccc/ota/ui/UpdateFailedFragment$1;-><init>(Lcom/motorola/ccc/ota/ui/UpdateFailedFragment;)V

    invoke-virtual {v0, v1}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    return-void
.end method

.method public onActivityCreated(Landroid/os/Bundle;)V
    .locals 3

    invoke-super {p0, p1}, Landroidx/fragment/app/Fragment;->onActivityCreated(Landroid/os/Bundle;)V

    invoke-virtual {p0}, Lcom/motorola/ccc/ota/ui/UpdateFailedFragment;->getResources()Landroid/content/res/Resources;

    move-result-object p1

    iget-object v0, p0, Lcom/motorola/ccc/ota/ui/UpdateFailedFragment;->mIntent:Landroid/content/Intent;

    invoke-static {v0}, Lcom/motorola/ccc/ota/ui/UpdaterUtils;->getUpgradeInfoAfterOTAUpdate(Landroid/content/Intent;)Lcom/motorola/ccc/ota/ui/UpdaterUtils$UpgradeInfo;

    move-result-object v0

    iput-object v0, p0, Lcom/motorola/ccc/ota/ui/UpdateFailedFragment;->mInfo:Lcom/motorola/ccc/ota/ui/UpdaterUtils$UpgradeInfo;

    if-nez v0, :cond_0

    const-string p1, "OtaApp"

    const-string v0, "updateFailFragment, No upgradeInfo found."

    invoke-static {p1, v0}, Lcom/motorola/ccc/ota/utils/Logger;->error(Ljava/lang/String;Ljava/lang/String;)V

    iget-object p0, p0, Lcom/motorola/ccc/ota/ui/UpdateFailedFragment;->mActivity:Landroid/app/Activity;

    invoke-virtual {p0}, Landroid/app/Activity;->finishAndRemoveTask()V

    return-void

    :cond_0
    invoke-virtual {v0}, Lcom/motorola/ccc/ota/ui/UpdaterUtils$UpgradeInfo;->getUpdateTypeData()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/motorola/ccc/ota/ui/updateType/UpdateType;->getUpdateType(Ljava/lang/String;)Lcom/motorola/ccc/ota/ui/updateType/UpdateType$UpdateTypeInterface;

    move-result-object v0

    iput-object v0, p0, Lcom/motorola/ccc/ota/ui/UpdateFailedFragment;->mUpdateType:Lcom/motorola/ccc/ota/ui/updateType/UpdateType$UpdateTypeInterface;

    iget-object v0, p0, Lcom/motorola/ccc/ota/ui/UpdateFailedFragment;->mActivity:Landroid/app/Activity;

    invoke-virtual {v0}, Landroid/app/Activity;->getWindow()Landroid/view/Window;

    move-result-object v0

    const/high16 v1, -0x80000000

    invoke-virtual {v0, v1}, Landroid/view/Window;->addFlags(I)V

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/view/Window;->setStatusBarColor(I)V

    invoke-virtual {p0}, Lcom/motorola/ccc/ota/ui/UpdateFailedFragment;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-static {v1}, Lcom/motorola/ccc/ota/ui/UpdaterUtils;->isBatterySaverEnabled(Landroid/content/Context;)Z

    move-result v1

    if-nez v1, :cond_1

    new-instance v1, Landroidx/core/view/WindowInsetsControllerCompat;

    invoke-virtual {v0}, Landroid/view/Window;->getDecorView()Landroid/view/View;

    move-result-object v2

    invoke-direct {v1, v0, v2}, Landroidx/core/view/WindowInsetsControllerCompat;-><init>(Landroid/view/Window;Landroid/view/View;)V

    invoke-virtual {p0}, Lcom/motorola/ccc/ota/ui/UpdateFailedFragment;->getContext()Landroid/content/Context;

    move-result-object v0

    const-string v2, "uimode"

    invoke-virtual {v0, v2}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/app/UiModeManager;

    invoke-virtual {v0}, Landroid/app/UiModeManager;->getNightMode()I

    move-result v0

    const/4 v2, 0x2

    if-eq v0, v2, :cond_1

    const/4 v0, 0x1

    invoke-virtual {v1, v0}, Landroidx/core/view/WindowInsetsControllerCompat;->setAppearanceLightStatusBars(Z)V

    invoke-virtual {v1, v0}, Landroidx/core/view/WindowInsetsControllerCompat;->setAppearanceLightNavigationBars(Z)V

    :cond_1
    iget-object v0, p0, Lcom/motorola/ccc/ota/ui/UpdateFailedFragment;->lottieAnimationView:Lcom/airbnb/lottie/LottieAnimationView;

    const/4 v1, -0x1

    invoke-virtual {v0, v1}, Lcom/airbnb/lottie/LottieAnimationView;->setRepeatCount(I)V

    iget-object v0, p0, Lcom/motorola/ccc/ota/ui/UpdateFailedFragment;->lottieAnimationView:Lcom/airbnb/lottie/LottieAnimationView;

    const-string v1, "alert_state.json"

    invoke-virtual {v0, v1}, Lcom/airbnb/lottie/LottieAnimationView;->setAnimation(Ljava/lang/String;)V

    iget-object v0, p0, Lcom/motorola/ccc/ota/ui/UpdateFailedFragment;->lottieAnimationView:Lcom/airbnb/lottie/LottieAnimationView;

    invoke-virtual {v0}, Lcom/airbnb/lottie/LottieAnimationView;->playAnimation()V

    iget-object v0, p0, Lcom/motorola/ccc/ota/ui/UpdateFailedFragment;->mIntent:Landroid/content/Intent;

    invoke-static {v0}, Lcom/motorola/ccc/ota/ui/UpdaterUtils;->isMaxRetryCountReachedForVerizon(Landroid/content/Intent;)Z

    move-result v0

    if-nez v0, :cond_2

    const v0, 0x7f0e01d3

    invoke-virtual {p1, v0}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v0

    iget-object v1, p0, Lcom/motorola/ccc/ota/ui/UpdateFailedFragment;->mUpdateFailedDesc:Landroid/widget/TextView;

    invoke-virtual {v1, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    :cond_2
    iget-object v0, p0, Lcom/motorola/ccc/ota/ui/UpdateFailedFragment;->mInfo:Lcom/motorola/ccc/ota/ui/UpdaterUtils$UpgradeInfo;

    invoke-virtual {v0}, Lcom/motorola/ccc/ota/ui/UpdaterUtils$UpgradeInfo;->hasPostInstallFailureMessage()Z

    move-result v0

    if-eqz v0, :cond_3

    iget-object v0, p0, Lcom/motorola/ccc/ota/ui/UpdateFailedFragment;->mInfo:Lcom/motorola/ccc/ota/ui/UpdaterUtils$UpgradeInfo;

    invoke-direct {p0, v0}, Lcom/motorola/ccc/ota/ui/UpdateFailedFragment;->setPostInstallNotes(Lcom/motorola/ccc/ota/ui/UpdaterUtils$UpgradeInfo;)V

    goto :goto_0

    :cond_3
    iget-object v0, p0, Lcom/motorola/ccc/ota/ui/UpdateFailedFragment;->mIntent:Landroid/content/Intent;

    invoke-static {v0}, Lcom/motorola/ccc/ota/ui/UpdaterUtils;->isMaxRetryCountReachedForVerizon(Landroid/content/Intent;)Z

    move-result v0

    if-eqz v0, :cond_4

    const-string v0, "2024.2"

    invoke-static {v0}, Lcom/motorola/otalib/common/utils/BuildPropertyUtils;->isProductWaveAtleastRefWave(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_4

    const v0, 0x7f0e01f0

    invoke-virtual {p1, v0}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v0

    iget-object v1, p0, Lcom/motorola/ccc/ota/ui/UpdateFailedFragment;->mUpdateFailedDesc:Landroid/widget/TextView;

    invoke-virtual {v1, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    :cond_4
    iget-object v0, p0, Lcom/motorola/ccc/ota/ui/UpdateFailedFragment;->mPostInstallFailureNotes:Landroid/widget/TextView;

    const/16 v1, 0x8

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setVisibility(I)V

    :goto_0
    iget-boolean v0, p0, Lcom/motorola/ccc/ota/ui/UpdateFailedFragment;->isMergeFailure:Z

    if-eqz v0, :cond_5

    iget-object v0, p0, Lcom/motorola/ccc/ota/ui/UpdateFailedFragment;->mUpdateFailedTitle:Landroid/widget/TextView;

    const v1, 0x7f0e012e

    invoke-virtual {p1, v1}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    iget-object p0, p0, Lcom/motorola/ccc/ota/ui/UpdateFailedFragment;->mUpdateFailedDesc:Landroid/widget/TextView;

    const v0, 0x7f0e012f

    invoke-virtual {p1, v0}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    :cond_5
    return-void
.end method

.method public onAttach(Landroid/content/Context;)V
    .locals 1

    invoke-super {p0, p1}, Landroidx/fragment/app/Fragment;->onAttach(Landroid/content/Context;)V

    instance-of v0, p1, Landroid/app/Activity;

    if-eqz v0, :cond_0

    move-object v0, p1

    check-cast v0, Landroid/app/Activity;

    iput-object v0, p0, Lcom/motorola/ccc/ota/ui/UpdateFailedFragment;->mActivity:Landroid/app/Activity;

    const-string p0, "notification"

    invoke-virtual {p1, p0}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Landroid/app/NotificationManager;

    const/4 p1, 0x4

    invoke-virtual {p0, p1}, Landroid/app/NotificationManager;->cancel(I)V

    :cond_0
    return-void
.end method

.method public onCreate(Landroid/os/Bundle;)V
    .locals 0

    invoke-super {p0, p1}, Landroidx/fragment/app/Fragment;->onCreate(Landroid/os/Bundle;)V

    return-void
.end method

.method public onCreateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;Landroid/os/Bundle;)Landroid/view/View;
    .locals 1

    const p3, 0x7f0c00a6

    const/4 v0, 0x0

    invoke-virtual {p1, p3, p2, v0}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object p1

    iput-object p1, p0, Lcom/motorola/ccc/ota/ui/UpdateFailedFragment;->mRootView:Landroid/view/View;

    invoke-virtual {p0}, Lcom/motorola/ccc/ota/ui/UpdateFailedFragment;->initUI()V

    iget-object p0, p0, Lcom/motorola/ccc/ota/ui/UpdateFailedFragment;->mRootView:Landroid/view/View;

    return-object p0
.end method

.method public onDestroyView()V
    .locals 1

    iget-object v0, p0, Lcom/motorola/ccc/ota/ui/UpdateFailedFragment;->mActivity:Landroid/app/Activity;

    invoke-virtual {v0}, Landroid/app/Activity;->finish()V

    invoke-super {p0}, Landroidx/fragment/app/Fragment;->onDestroyView()V

    return-void
.end method

.method public onStart()V
    .locals 0

    invoke-super {p0}, Landroidx/fragment/app/Fragment;->onStart()V

    return-void
.end method

.method public onStop()V
    .locals 0

    invoke-super {p0}, Landroidx/fragment/app/Fragment;->onStop()V

    return-void
.end method

.method public onViewCreated(Landroid/view/View;Landroid/os/Bundle;)V
    .locals 0

    invoke-super {p0, p1, p2}, Landroidx/fragment/app/Fragment;->onViewCreated(Landroid/view/View;Landroid/os/Bundle;)V

    return-void
.end method
