.class public Lcom/motorola/ccc/ota/ui/UpdateCompleteFragment;
.super Landroidx/fragment/app/Fragment;
.source "UpdateCompleteFragment.java"


# instance fields
.field private expandableListView:Landroid/widget/ExpandableListView;

.field private isTransactionSafe:Z

.field private mActivity:Landroidx/fragment/app/FragmentActivity;

.field private mAndroidVersion:Landroid/widget/TextView;

.field private mDone:Landroid/widget/Button;

.field private mExpTitle:Landroid/widget/TextView;

.field private mInfo:Lcom/motorola/ccc/ota/ui/UpdaterUtils$UpgradeInfo;

.field private mIntent:Landroid/content/Intent;

.field private mPostInstallNotes:Landroid/widget/TextView;

.field private mRootView:Landroid/view/View;

.field private mSecurityPatch:Landroid/widget/TextView;

.field private mUpdateComplete:Landroid/widget/TextView;

.field private mUpdateStatusDesc:Landroid/widget/TextView;

.field private mUpdateType:Lcom/motorola/ccc/ota/ui/updateType/UpdateType$UpdateTypeInterface;

.field private osReleaseNotes:Landroid/widget/TextView;

.field private settings:Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

.field private updateStatusAnimation:Lcom/airbnb/lottie/LottieAnimationView;


# direct methods
.method static bridge synthetic -$$Nest$mhandleOnCancelUpdateFragment(Lcom/motorola/ccc/ota/ui/UpdateCompleteFragment;)V
    .locals 0

    invoke-direct {p0}, Lcom/motorola/ccc/ota/ui/UpdateCompleteFragment;->handleOnCancelUpdateFragment()V

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

.method private handleOnCancelUpdateFragment()V
    .locals 8

    iget-object v0, p0, Lcom/motorola/ccc/ota/ui/UpdateCompleteFragment;->settings:Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    iget-object v1, p0, Lcom/motorola/ccc/ota/ui/UpdateCompleteFragment;->mInfo:Lcom/motorola/ccc/ota/ui/UpdaterUtils$UpgradeInfo;

    invoke-virtual {v1}, Lcom/motorola/ccc/ota/ui/UpdaterUtils$UpgradeInfo;->getUpdateTypeData()Ljava/lang/String;

    move-result-object v1

    const/4 v2, 0x0

    invoke-static {v0, v1, v2}, Lcom/motorola/ccc/ota/utils/SmartUpdateUtils;->shouldShowTrySmartUpdatePopUp(Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;Ljava/lang/String;Z)Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-virtual {p0}, Lcom/motorola/ccc/ota/ui/UpdateCompleteFragment;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    const v1, 0x7f0e0197

    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {p0}, Lcom/motorola/ccc/ota/ui/UpdateCompleteFragment;->getContext()Landroid/content/Context;

    move-result-object v2

    iget-object v4, p0, Lcom/motorola/ccc/ota/ui/UpdateCompleteFragment;->mUpdateType:Lcom/motorola/ccc/ota/ui/updateType/UpdateType$UpdateTypeInterface;

    iget-object v5, p0, Lcom/motorola/ccc/ota/ui/UpdateCompleteFragment;->mActivity:Landroidx/fragment/app/FragmentActivity;

    iget-object v6, p0, Lcom/motorola/ccc/ota/ui/UpdateCompleteFragment;->settings:Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    sget-object p0, Lcom/motorola/ccc/ota/utils/SmartUpdateUtils$SmartUpdateLaunchMode;->TRY_SMART_UPDATES_POPUP_UPDATE_COMPLETE:Lcom/motorola/ccc/ota/utils/SmartUpdateUtils$SmartUpdateLaunchMode;

    invoke-virtual {p0}, Lcom/motorola/ccc/ota/utils/SmartUpdateUtils$SmartUpdateLaunchMode;->name()Ljava/lang/String;

    move-result-object v7

    invoke-static/range {v2 .. v7}, Lcom/motorola/ccc/ota/utils/SmartUpdateUtils;->showTrySmartUpdatePopUp(Landroid/content/Context;Ljava/lang/String;Lcom/motorola/ccc/ota/ui/updateType/UpdateType$UpdateTypeInterface;Landroid/app/Activity;Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;Ljava/lang/String;)V

    goto :goto_0

    :cond_0
    iget-object p0, p0, Lcom/motorola/ccc/ota/ui/UpdateCompleteFragment;->mActivity:Landroidx/fragment/app/FragmentActivity;

    invoke-virtual {p0}, Landroidx/fragment/app/FragmentActivity;->finish()V

    :goto_0
    return-void
.end method

.method private setPostInstallNotes(Lcom/motorola/ccc/ota/ui/UpdaterUtils$UpgradeInfo;)V
    .locals 4

    invoke-virtual {p1}, Lcom/motorola/ccc/ota/ui/UpdaterUtils$UpgradeInfo;->getLocationType()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1}, Lcom/motorola/ccc/ota/ui/UpdaterUtils$UpgradeInfo;->getPostInstallNotes()Ljava/lang/String;

    move-result-object p1

    :try_start_0
    const-string v1, "sdcard"

    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_0

    iget-object v0, p0, Lcom/motorola/ccc/ota/ui/UpdateCompleteFragment;->mPostInstallNotes:Landroid/widget/TextView;

    new-instance v1, Lcom/motorola/ccc/ota/ui/HtmlUtils;

    invoke-direct {v1, p1}, Lcom/motorola/ccc/ota/ui/HtmlUtils;-><init>(Ljava/lang/String;)V

    const/4 v2, 0x0

    const/4 v3, 0x0

    invoke-static {p1, v2, v3, v1}, Landroid/text/Html;->fromHtml(Ljava/lang/String;ILandroid/text/Html$ImageGetter;Landroid/text/Html$TagHandler;)Landroid/text/Spanned;

    move-result-object p1

    invoke-virtual {v0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    iget-object p1, p0, Lcom/motorola/ccc/ota/ui/UpdateCompleteFragment;->mPostInstallNotes:Landroid/widget/TextView;

    invoke-virtual {p1, v2}, Landroid/widget/TextView;->setVisibility(I)V

    iget-object p1, p0, Lcom/motorola/ccc/ota/ui/UpdateCompleteFragment;->mPostInstallNotes:Landroid/widget/TextView;

    invoke-static {}, Landroid/text/method/LinkMovementMethod;->getInstance()Landroid/text/method/MovementMethod;

    move-result-object v0

    invoke-virtual {p1, v0}, Landroid/widget/TextView;->setMovementMethod(Landroid/text/method/MovementMethod;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception p1

    iget-object p0, p0, Lcom/motorola/ccc/ota/ui/UpdateCompleteFragment;->mPostInstallNotes:Landroid/widget/TextView;

    const/4 v0, 0x4

    invoke-virtual {p0, v0}, Landroid/widget/TextView;->setVisibility(I)V

    new-instance p0, Ljava/lang/StringBuilder;

    const-string v0, "UpdateCompleteFragment, error setting PostInstallNotes."

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

.method private setTextViewText(Landroid/view/View;)V
    .locals 2

    const v0, 0x7f090047

    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p0, Lcom/motorola/ccc/ota/ui/UpdateCompleteFragment;->mAndroidVersion:Landroid/widget/TextView;

    const v0, 0x7f09015e

    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p1

    check-cast p1, Landroid/widget/TextView;

    iput-object p1, p0, Lcom/motorola/ccc/ota/ui/UpdateCompleteFragment;->mSecurityPatch:Landroid/widget/TextView;

    invoke-virtual {p0}, Lcom/motorola/ccc/ota/ui/UpdateCompleteFragment;->getContext()Landroid/content/Context;

    move-result-object v0

    const v1, 0x7f0e017f

    invoke-virtual {v0, v1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v0

    invoke-static {}, Lcom/motorola/ccc/ota/utils/DateFormatUtils;->getSecurityPatch()Ljava/lang/String;

    move-result-object v1

    invoke-direct {p0, p1, v0, v1}, Lcom/motorola/ccc/ota/ui/UpdateCompleteFragment;->checkAndDisplayText(Landroid/widget/TextView;Ljava/lang/String;Ljava/lang/String;)V

    iget-object p1, p0, Lcom/motorola/ccc/ota/ui/UpdateCompleteFragment;->mAndroidVersion:Landroid/widget/TextView;

    invoke-virtual {p0}, Lcom/motorola/ccc/ota/ui/UpdateCompleteFragment;->getContext()Landroid/content/Context;

    move-result-object v0

    const v1, 0x7f0e0032

    invoke-virtual {v0, v1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v0

    invoke-static {}, Lcom/motorola/ccc/ota/utils/BuildPropReader;->getAndroidVersion()Ljava/lang/String;

    move-result-object v1

    invoke-direct {p0, p1, v0, v1}, Lcom/motorola/ccc/ota/ui/UpdateCompleteFragment;->checkAndDisplayText(Landroid/widget/TextView;Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method


# virtual methods
.method initUI()V
    .locals 2

    const-string v0, "OtaApp"

    const-string v1, "Update Status displayed to user"

    invoke-static {v0, v1}, Lcom/motorola/ccc/ota/utils/Logger;->debug(Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {p0}, Lcom/motorola/ccc/ota/ui/UpdateCompleteFragment;->getArguments()Landroid/os/Bundle;

    move-result-object v0

    if-eqz v0, :cond_0

    const-string v1, "activityIntent"

    invoke-virtual {v0, v1}, Landroid/os/Bundle;->getParcelable(Ljava/lang/String;)Landroid/os/Parcelable;

    move-result-object v0

    check-cast v0, Landroid/content/Intent;

    iput-object v0, p0, Lcom/motorola/ccc/ota/ui/UpdateCompleteFragment;->mIntent:Landroid/content/Intent;

    :cond_0
    iget-object v0, p0, Lcom/motorola/ccc/ota/ui/UpdateCompleteFragment;->mRootView:Landroid/view/View;

    const v1, 0x7f0901f3

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p0, Lcom/motorola/ccc/ota/ui/UpdateCompleteFragment;->mUpdateStatusDesc:Landroid/widget/TextView;

    iget-object v0, p0, Lcom/motorola/ccc/ota/ui/UpdateCompleteFragment;->mRootView:Landroid/view/View;

    const v1, 0x7f09012b

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p0, Lcom/motorola/ccc/ota/ui/UpdateCompleteFragment;->mPostInstallNotes:Landroid/widget/TextView;

    iget-object v0, p0, Lcom/motorola/ccc/ota/ui/UpdateCompleteFragment;->mRootView:Landroid/view/View;

    const v1, 0x7f0900b7

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p0, Lcom/motorola/ccc/ota/ui/UpdateCompleteFragment;->mExpTitle:Landroid/widget/TextView;

    iget-object v0, p0, Lcom/motorola/ccc/ota/ui/UpdateCompleteFragment;->mRootView:Landroid/view/View;

    const v1, 0x7f0900b9

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/ExpandableListView;

    iput-object v0, p0, Lcom/motorola/ccc/ota/ui/UpdateCompleteFragment;->expandableListView:Landroid/widget/ExpandableListView;

    iget-object v0, p0, Lcom/motorola/ccc/ota/ui/UpdateCompleteFragment;->mRootView:Landroid/view/View;

    const v1, 0x7f090116

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p0, Lcom/motorola/ccc/ota/ui/UpdateCompleteFragment;->osReleaseNotes:Landroid/widget/TextView;

    iget-object v0, p0, Lcom/motorola/ccc/ota/ui/UpdateCompleteFragment;->mRootView:Landroid/view/View;

    const v1, 0x7f0900ec

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Lcom/airbnb/lottie/LottieAnimationView;

    iput-object v0, p0, Lcom/motorola/ccc/ota/ui/UpdateCompleteFragment;->updateStatusAnimation:Lcom/airbnb/lottie/LottieAnimationView;

    iget-object v0, p0, Lcom/motorola/ccc/ota/ui/UpdateCompleteFragment;->mPostInstallNotes:Landroid/widget/TextView;

    invoke-static {}, Landroid/text/method/ScrollingMovementMethod;->getInstance()Landroid/text/method/MovementMethod;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setMovementMethod(Landroid/text/method/MovementMethod;)V

    iget-object v0, p0, Lcom/motorola/ccc/ota/ui/UpdateCompleteFragment;->mRootView:Landroid/view/View;

    const v1, 0x7f0901f4

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/Button;

    iput-object v0, p0, Lcom/motorola/ccc/ota/ui/UpdateCompleteFragment;->mDone:Landroid/widget/Button;

    iget-object v0, p0, Lcom/motorola/ccc/ota/ui/UpdateCompleteFragment;->mRootView:Landroid/view/View;

    const v1, 0x7f0901ed

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p0, Lcom/motorola/ccc/ota/ui/UpdateCompleteFragment;->mUpdateComplete:Landroid/widget/TextView;

    iget-object v0, p0, Lcom/motorola/ccc/ota/ui/UpdateCompleteFragment;->mDone:Landroid/widget/Button;

    new-instance v1, Lcom/motorola/ccc/ota/ui/UpdateCompleteFragment$1;

    invoke-direct {v1, p0}, Lcom/motorola/ccc/ota/ui/UpdateCompleteFragment$1;-><init>(Lcom/motorola/ccc/ota/ui/UpdateCompleteFragment;)V

    invoke-virtual {v0, v1}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    iget-object v0, p0, Lcom/motorola/ccc/ota/ui/UpdateCompleteFragment;->mRootView:Landroid/view/View;

    invoke-direct {p0, v0}, Lcom/motorola/ccc/ota/ui/UpdateCompleteFragment;->setTextViewText(Landroid/view/View;)V

    return-void
.end method

.method synthetic lambda$onViewCreated$0$com-motorola-ccc-ota-ui-UpdateCompleteFragment(Landroid/view/View;ILandroid/view/KeyEvent;)Z
    .locals 0

    const/4 p1, 0x4

    if-ne p2, p1, :cond_0

    invoke-direct {p0}, Lcom/motorola/ccc/ota/ui/UpdateCompleteFragment;->handleOnCancelUpdateFragment()V

    const/4 p0, 0x1

    return p0

    :cond_0
    const/4 p0, 0x0

    return p0
.end method

.method public onActivityCreated(Landroid/os/Bundle;)V
    .locals 8

    invoke-super {p0, p1}, Landroidx/fragment/app/Fragment;->onActivityCreated(Landroid/os/Bundle;)V

    invoke-virtual {p0}, Lcom/motorola/ccc/ota/ui/UpdateCompleteFragment;->getResources()Landroid/content/res/Resources;

    iget-object p1, p0, Lcom/motorola/ccc/ota/ui/UpdateCompleteFragment;->mIntent:Landroid/content/Intent;

    invoke-static {p1}, Lcom/motorola/ccc/ota/ui/UpdaterUtils;->getUpgradeInfoAfterOTAUpdate(Landroid/content/Intent;)Lcom/motorola/ccc/ota/ui/UpdaterUtils$UpgradeInfo;

    move-result-object p1

    iput-object p1, p0, Lcom/motorola/ccc/ota/ui/UpdateCompleteFragment;->mInfo:Lcom/motorola/ccc/ota/ui/UpdaterUtils$UpgradeInfo;

    if-nez p1, :cond_0

    const-string p1, "OtaApp"

    const-string v0, "updateStatusFragment, No upgradeInfo found."

    invoke-static {p1, v0}, Lcom/motorola/ccc/ota/utils/Logger;->error(Ljava/lang/String;Ljava/lang/String;)V

    iget-object p0, p0, Lcom/motorola/ccc/ota/ui/UpdateCompleteFragment;->mActivity:Landroidx/fragment/app/FragmentActivity;

    invoke-virtual {p0}, Landroidx/fragment/app/FragmentActivity;->finishAndRemoveTask()V

    return-void

    :cond_0
    invoke-virtual {p1}, Lcom/motorola/ccc/ota/ui/UpdaterUtils$UpgradeInfo;->getUpdateTypeData()Ljava/lang/String;

    move-result-object p1

    invoke-static {p1}, Lcom/motorola/ccc/ota/ui/updateType/UpdateType;->getUpdateType(Ljava/lang/String;)Lcom/motorola/ccc/ota/ui/updateType/UpdateType$UpdateTypeInterface;

    move-result-object p1

    iput-object p1, p0, Lcom/motorola/ccc/ota/ui/UpdateCompleteFragment;->mUpdateType:Lcom/motorola/ccc/ota/ui/updateType/UpdateType$UpdateTypeInterface;

    iget-object p1, p0, Lcom/motorola/ccc/ota/ui/UpdateCompleteFragment;->mActivity:Landroidx/fragment/app/FragmentActivity;

    invoke-virtual {p1}, Landroidx/fragment/app/FragmentActivity;->getWindow()Landroid/view/Window;

    move-result-object p1

    const/high16 v0, -0x80000000

    invoke-virtual {p1, v0}, Landroid/view/Window;->addFlags(I)V

    const/4 v0, 0x0

    invoke-virtual {p1, v0}, Landroid/view/Window;->setStatusBarColor(I)V

    invoke-virtual {p0}, Lcom/motorola/ccc/ota/ui/UpdateCompleteFragment;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0}, Lcom/motorola/ccc/ota/ui/UpdaterUtils;->isBatterySaverEnabled(Landroid/content/Context;)Z

    move-result v0

    if-nez v0, :cond_1

    new-instance v0, Landroidx/core/view/WindowInsetsControllerCompat;

    invoke-virtual {p1}, Landroid/view/Window;->getDecorView()Landroid/view/View;

    move-result-object v1

    invoke-direct {v0, p1, v1}, Landroidx/core/view/WindowInsetsControllerCompat;-><init>(Landroid/view/Window;Landroid/view/View;)V

    invoke-virtual {p0}, Lcom/motorola/ccc/ota/ui/UpdateCompleteFragment;->getContext()Landroid/content/Context;

    move-result-object p1

    const-string v1, "uimode"

    invoke-virtual {p1, v1}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Landroid/app/UiModeManager;

    invoke-virtual {p1}, Landroid/app/UiModeManager;->getNightMode()I

    move-result p1

    const/4 v1, 0x2

    if-eq p1, v1, :cond_1

    const/4 p1, 0x1

    invoke-virtual {v0, p1}, Landroidx/core/view/WindowInsetsControllerCompat;->setAppearanceLightStatusBars(Z)V

    invoke-virtual {v0, p1}, Landroidx/core/view/WindowInsetsControllerCompat;->setAppearanceLightNavigationBars(Z)V

    :cond_1
    sget-object p1, Lcom/motorola/ccc/ota/ui/updateType/UpdateType$DIFFUpdateType;->OS:Lcom/motorola/ccc/ota/ui/updateType/UpdateType$DIFFUpdateType;

    invoke-virtual {p1}, Lcom/motorola/ccc/ota/ui/updateType/UpdateType$DIFFUpdateType;->toString()Ljava/lang/String;

    move-result-object p1

    iget-object v0, p0, Lcom/motorola/ccc/ota/ui/UpdateCompleteFragment;->mInfo:Lcom/motorola/ccc/ota/ui/UpdaterUtils$UpgradeInfo;

    invoke-virtual {v0}, Lcom/motorola/ccc/ota/ui/UpdaterUtils$UpgradeInfo;->getUpdateTypeData()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1, v0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result p1

    if-eqz p1, :cond_2

    invoke-virtual {p0}, Lcom/motorola/ccc/ota/ui/UpdateCompleteFragment;->getResources()Landroid/content/res/Resources;

    move-result-object p1

    invoke-static {}, Lcom/motorola/ccc/ota/utils/BuildPropReader;->getAndroidVersion()Ljava/lang/String;

    move-result-object v0

    filled-new-array {v0}, [Ljava/lang/Object;

    move-result-object v0

    const v1, 0x7f0e01e0

    invoke-virtual {p1, v1, v0}, Landroid/content/res/Resources;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p1

    goto :goto_0

    :cond_2
    invoke-virtual {p0}, Lcom/motorola/ccc/ota/ui/UpdateCompleteFragment;->getResources()Landroid/content/res/Resources;

    move-result-object p1

    iget-object v0, p0, Lcom/motorola/ccc/ota/ui/UpdateCompleteFragment;->mInfo:Lcom/motorola/ccc/ota/ui/UpdaterUtils$UpgradeInfo;

    invoke-virtual {v0}, Lcom/motorola/ccc/ota/ui/UpdaterUtils$UpgradeInfo;->getDisplayVersion()Ljava/lang/String;

    move-result-object v0

    filled-new-array {v0}, [Ljava/lang/Object;

    move-result-object v0

    const v1, 0x7f0e01df

    invoke-virtual {p1, v1, v0}, Landroid/content/res/Resources;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p1

    :goto_0
    iget-object v0, p0, Lcom/motorola/ccc/ota/ui/UpdateCompleteFragment;->mUpdateStatusDesc:Landroid/widget/TextView;

    invoke-virtual {v0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    iget-object p1, p0, Lcom/motorola/ccc/ota/ui/UpdateCompleteFragment;->mRootView:Landroid/view/View;

    const v0, 0x7f090082

    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v7

    iget-object v1, p0, Lcom/motorola/ccc/ota/ui/UpdateCompleteFragment;->expandableListView:Landroid/widget/ExpandableListView;

    iget-object p1, p0, Lcom/motorola/ccc/ota/ui/UpdateCompleteFragment;->mInfo:Lcom/motorola/ccc/ota/ui/UpdaterUtils$UpgradeInfo;

    invoke-virtual {p1}, Lcom/motorola/ccc/ota/ui/UpdaterUtils$UpgradeInfo;->hasReleaseNotes()Z

    move-result v2

    iget-object p1, p0, Lcom/motorola/ccc/ota/ui/UpdateCompleteFragment;->mInfo:Lcom/motorola/ccc/ota/ui/UpdaterUtils$UpgradeInfo;

    invoke-virtual {p1}, Lcom/motorola/ccc/ota/ui/UpdaterUtils$UpgradeInfo;->getReleaseNotes()Ljava/lang/String;

    move-result-object v3

    iget-object v4, p0, Lcom/motorola/ccc/ota/ui/UpdateCompleteFragment;->mExpTitle:Landroid/widget/TextView;

    invoke-virtual {p0}, Lcom/motorola/ccc/ota/ui/UpdateCompleteFragment;->getActivity()Landroidx/fragment/app/FragmentActivity;

    move-result-object v5

    iget-object v6, p0, Lcom/motorola/ccc/ota/ui/UpdateCompleteFragment;->mUpdateType:Lcom/motorola/ccc/ota/ui/updateType/UpdateType$UpdateTypeInterface;

    invoke-static/range {v1 .. v7}, Lcom/motorola/ccc/ota/ui/UpdaterUtils;->setExpandableList(Landroid/widget/ExpandableListView;ZLjava/lang/String;Landroid/widget/TextView;Landroid/content/Context;Lcom/motorola/ccc/ota/ui/updateType/UpdateType$UpdateTypeInterface;Landroid/view/View;)Landroid/widget/ExpandableListView;

    move-result-object p1

    iput-object p1, p0, Lcom/motorola/ccc/ota/ui/UpdateCompleteFragment;->expandableListView:Landroid/widget/ExpandableListView;

    const-string v0, ""

    invoke-static {p1, v0}, Lcom/motorola/ccc/ota/ui/UpdaterUtils;->handleExpList(Landroid/widget/ExpandableListView;Ljava/lang/String;)Landroid/widget/ExpandableListView;

    move-result-object p1

    iput-object p1, p0, Lcom/motorola/ccc/ota/ui/UpdateCompleteFragment;->expandableListView:Landroid/widget/ExpandableListView;

    invoke-virtual {p0}, Lcom/motorola/ccc/ota/ui/UpdateCompleteFragment;->getContext()Landroid/content/Context;

    move-result-object p1

    iget-object v1, p0, Lcom/motorola/ccc/ota/ui/UpdateCompleteFragment;->osReleaseNotes:Landroid/widget/TextView;

    iget-object v2, p0, Lcom/motorola/ccc/ota/ui/UpdateCompleteFragment;->mInfo:Lcom/motorola/ccc/ota/ui/UpdaterUtils$UpgradeInfo;

    invoke-static {p1, v1, v2, v0}, Lcom/motorola/ccc/ota/ui/UpdaterUtils;->setOsReleaseNotes(Landroid/content/Context;Landroid/widget/TextView;Lcom/motorola/ccc/ota/ui/UpdaterUtils$UpgradeInfo;Ljava/lang/String;)V

    iget-object p1, p0, Lcom/motorola/ccc/ota/ui/UpdateCompleteFragment;->updateStatusAnimation:Lcom/airbnb/lottie/LottieAnimationView;

    const/4 v0, -0x1

    invoke-virtual {p1, v0}, Lcom/airbnb/lottie/LottieAnimationView;->setRepeatCount(I)V

    iget-object p1, p0, Lcom/motorola/ccc/ota/ui/UpdateCompleteFragment;->updateStatusAnimation:Lcom/airbnb/lottie/LottieAnimationView;

    const-string v0, "check_mark.json"

    invoke-virtual {p1, v0}, Lcom/airbnb/lottie/LottieAnimationView;->setAnimation(Ljava/lang/String;)V

    iget-object p1, p0, Lcom/motorola/ccc/ota/ui/UpdateCompleteFragment;->updateStatusAnimation:Lcom/airbnb/lottie/LottieAnimationView;

    invoke-virtual {p1}, Lcom/airbnb/lottie/LottieAnimationView;->playAnimation()V

    iget-object p1, p0, Lcom/motorola/ccc/ota/ui/UpdateCompleteFragment;->mInfo:Lcom/motorola/ccc/ota/ui/UpdaterUtils$UpgradeInfo;

    invoke-virtual {p1}, Lcom/motorola/ccc/ota/ui/UpdaterUtils$UpgradeInfo;->hasPostInstallNotes()Z

    move-result p1

    if-eqz p1, :cond_3

    iget-object p1, p0, Lcom/motorola/ccc/ota/ui/UpdateCompleteFragment;->mInfo:Lcom/motorola/ccc/ota/ui/UpdaterUtils$UpgradeInfo;

    invoke-direct {p0, p1}, Lcom/motorola/ccc/ota/ui/UpdateCompleteFragment;->setPostInstallNotes(Lcom/motorola/ccc/ota/ui/UpdaterUtils$UpgradeInfo;)V

    goto :goto_1

    :cond_3
    iget-object p0, p0, Lcom/motorola/ccc/ota/ui/UpdateCompleteFragment;->mPostInstallNotes:Landroid/widget/TextView;

    const/16 p1, 0x8

    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setVisibility(I)V

    :goto_1
    return-void
.end method

.method public onAttach(Landroid/content/Context;)V
    .locals 1

    invoke-super {p0, p1}, Landroidx/fragment/app/Fragment;->onAttach(Landroid/content/Context;)V

    instance-of v0, p1, Landroid/app/Activity;

    if-eqz v0, :cond_0

    move-object v0, p1

    check-cast v0, Landroidx/fragment/app/FragmentActivity;

    iput-object v0, p0, Lcom/motorola/ccc/ota/ui/UpdateCompleteFragment;->mActivity:Landroidx/fragment/app/FragmentActivity;

    const-string p0, "notification"

    invoke-virtual {p1, p0}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Landroid/app/NotificationManager;

    if-eqz p0, :cond_0

    const/4 p1, 0x4

    invoke-virtual {p0, p1}, Landroid/app/NotificationManager;->cancel(I)V

    :cond_0
    return-void
.end method

.method public onCreate(Landroid/os/Bundle;)V
    .locals 0

    invoke-super {p0, p1}, Landroidx/fragment/app/Fragment;->onCreate(Landroid/os/Bundle;)V

    new-instance p1, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    invoke-direct {p1}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;-><init>()V

    iput-object p1, p0, Lcom/motorola/ccc/ota/ui/UpdateCompleteFragment;->settings:Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    return-void
.end method

.method public onCreateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;Landroid/os/Bundle;)Landroid/view/View;
    .locals 1

    const p3, 0x7f0c00a5

    const/4 v0, 0x0

    invoke-virtual {p1, p3, p2, v0}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object p1

    iput-object p1, p0, Lcom/motorola/ccc/ota/ui/UpdateCompleteFragment;->mRootView:Landroid/view/View;

    invoke-virtual {p0}, Lcom/motorola/ccc/ota/ui/UpdateCompleteFragment;->initUI()V

    iget-object p0, p0, Lcom/motorola/ccc/ota/ui/UpdateCompleteFragment;->mRootView:Landroid/view/View;

    return-object p0
.end method

.method public onDestroyView()V
    .locals 1

    iget-object v0, p0, Lcom/motorola/ccc/ota/ui/UpdateCompleteFragment;->mActivity:Landroidx/fragment/app/FragmentActivity;

    invoke-virtual {v0}, Landroidx/fragment/app/FragmentActivity;->finish()V

    invoke-super {p0}, Landroidx/fragment/app/Fragment;->onDestroyView()V

    return-void
.end method

.method public onPause()V
    .locals 1

    invoke-super {p0}, Landroidx/fragment/app/Fragment;->onPause()V

    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/motorola/ccc/ota/ui/UpdateCompleteFragment;->isTransactionSafe:Z

    return-void
.end method

.method public onResume()V
    .locals 1

    invoke-super {p0}, Landroidx/fragment/app/Fragment;->onResume()V

    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/motorola/ccc/ota/ui/UpdateCompleteFragment;->isTransactionSafe:Z

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

    invoke-virtual {p0}, Lcom/motorola/ccc/ota/ui/UpdateCompleteFragment;->getView()Landroid/view/View;

    move-result-object p1

    const/4 p2, 0x1

    invoke-virtual {p1, p2}, Landroid/view/View;->setFocusableInTouchMode(Z)V

    invoke-virtual {p0}, Lcom/motorola/ccc/ota/ui/UpdateCompleteFragment;->getView()Landroid/view/View;

    move-result-object p1

    invoke-virtual {p1}, Landroid/view/View;->requestFocus()Z

    invoke-virtual {p0}, Lcom/motorola/ccc/ota/ui/UpdateCompleteFragment;->getView()Landroid/view/View;

    move-result-object p1

    new-instance p2, Lcom/motorola/ccc/ota/ui/UpdateCompleteFragment$$ExternalSyntheticLambda0;

    invoke-direct {p2, p0}, Lcom/motorola/ccc/ota/ui/UpdateCompleteFragment$$ExternalSyntheticLambda0;-><init>(Lcom/motorola/ccc/ota/ui/UpdateCompleteFragment;)V

    invoke-virtual {p1, p2}, Landroid/view/View;->setOnKeyListener(Landroid/view/View$OnKeyListener;)V

    return-void
.end method
