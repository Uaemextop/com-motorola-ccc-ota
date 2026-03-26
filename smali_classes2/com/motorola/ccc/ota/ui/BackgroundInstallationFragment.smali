.class public Lcom/motorola/ccc/ota/ui/BackgroundInstallationFragment;
.super Landroidx/fragment/app/Fragment;
.source "BackgroundInstallationFragment.java"


# static fields
.field private static DEFAULT_RETRY_OR_SUSPEND_VALUE:I = -0x2


# instance fields
.field private activity:Landroid/app/Activity;

.field private activityIntent:Landroid/content/Intent;

.field private alertDialog:Landroidx/appcompat/app/AlertDialog;

.field private context:Landroid/content/Context;

.field private imgBack:Landroid/widget/ImageView;

.field private info:Lcom/motorola/ccc/ota/ui/UpdaterUtils$UpgradeInfo;

.field private launchTimeInMillis:J

.field private mButtonLayout:Landroid/widget/LinearLayout;

.field private mCancel:Landroid/widget/Button;

.field private mCellularResume:Landroid/widget/Button;

.field private mDataChargeWarningMessage:Landroid/widget/TextView;

.field private mDone:Landroid/widget/Button;

.field private mFinishReceiver:Landroid/content/BroadcastReceiver;

.field private mInstallationMessage:Landroid/widget/TextView;

.field private mInstallationPercentage:Landroid/widget/TextView;

.field private mInstallationStep:Landroid/widget/TextView;

.field private mProgressBar:Landroid/widget/ProgressBar;

.field private mProgressReceiver:Landroid/content/BroadcastReceiver;

.field private mRetriedOrSuspend:I

.field private mUpdateTypeInterface:Lcom/motorola/ccc/ota/ui/updateType/UpdateType$UpdateTypeInterface;

.field private mWifiSettings:Landroid/widget/Button;

.field private meta:Lcom/motorola/otalib/common/metaData/MetaData;

.field private osReleaseNotes:Landroid/widget/TextView;

.field private rootView:Landroid/view/View;

.field private settings:Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;


# direct methods
.method static bridge synthetic -$$Nest$fgetactivity(Lcom/motorola/ccc/ota/ui/BackgroundInstallationFragment;)Landroid/app/Activity;
    .locals 0

    iget-object p0, p0, Lcom/motorola/ccc/ota/ui/BackgroundInstallationFragment;->activity:Landroid/app/Activity;

    return-object p0
.end method

.method static bridge synthetic -$$Nest$fgetcontext(Lcom/motorola/ccc/ota/ui/BackgroundInstallationFragment;)Landroid/content/Context;
    .locals 0

    iget-object p0, p0, Lcom/motorola/ccc/ota/ui/BackgroundInstallationFragment;->context:Landroid/content/Context;

    return-object p0
.end method

.method static bridge synthetic -$$Nest$fgetmProgressReceiver(Lcom/motorola/ccc/ota/ui/BackgroundInstallationFragment;)Landroid/content/BroadcastReceiver;
    .locals 0

    iget-object p0, p0, Lcom/motorola/ccc/ota/ui/BackgroundInstallationFragment;->mProgressReceiver:Landroid/content/BroadcastReceiver;

    return-object p0
.end method

.method static bridge synthetic -$$Nest$maddCancelConfirmDialog(Lcom/motorola/ccc/ota/ui/BackgroundInstallationFragment;Landroid/content/Context;)V
    .locals 0

    invoke-direct {p0, p1}, Lcom/motorola/ccc/ota/ui/BackgroundInstallationFragment;->addCancelConfirmDialog(Landroid/content/Context;)V

    return-void
.end method

.method static bridge synthetic -$$Nest$mhandleResumeOnCellular(Lcom/motorola/ccc/ota/ui/BackgroundInstallationFragment;)V
    .locals 0

    invoke-direct {p0}, Lcom/motorola/ccc/ota/ui/BackgroundInstallationFragment;->handleResumeOnCellular()V

    return-void
.end method

.method static bridge synthetic -$$Nest$minitializeCustomView(Lcom/motorola/ccc/ota/ui/BackgroundInstallationFragment;Landroid/content/Intent;)V
    .locals 0

    invoke-direct {p0, p1}, Lcom/motorola/ccc/ota/ui/BackgroundInstallationFragment;->initializeCustomView(Landroid/content/Intent;)V

    return-void
.end method

.method static bridge synthetic -$$Nest$mupdateUIDuringCompatibilityCheck(Lcom/motorola/ccc/ota/ui/BackgroundInstallationFragment;Landroid/content/Intent;)V
    .locals 0

    invoke-direct {p0, p1}, Lcom/motorola/ccc/ota/ui/BackgroundInstallationFragment;->updateUIDuringCompatibilityCheck(Landroid/content/Intent;)V

    return-void
.end method

.method static constructor <clinit>()V
    .locals 0

    return-void
.end method

.method public constructor <init>()V
    .locals 1

    invoke-direct {p0}, Landroidx/fragment/app/Fragment;-><init>()V

    const/4 v0, 0x0

    iput-object v0, p0, Lcom/motorola/ccc/ota/ui/BackgroundInstallationFragment;->mUpdateTypeInterface:Lcom/motorola/ccc/ota/ui/updateType/UpdateType$UpdateTypeInterface;

    new-instance v0, Lcom/motorola/ccc/ota/ui/BackgroundInstallationFragment$6;

    invoke-direct {v0, p0}, Lcom/motorola/ccc/ota/ui/BackgroundInstallationFragment$6;-><init>(Lcom/motorola/ccc/ota/ui/BackgroundInstallationFragment;)V

    iput-object v0, p0, Lcom/motorola/ccc/ota/ui/BackgroundInstallationFragment;->mFinishReceiver:Landroid/content/BroadcastReceiver;

    new-instance v0, Lcom/motorola/ccc/ota/ui/BackgroundInstallationFragment$7;

    invoke-direct {v0, p0}, Lcom/motorola/ccc/ota/ui/BackgroundInstallationFragment$7;-><init>(Lcom/motorola/ccc/ota/ui/BackgroundInstallationFragment;)V

    iput-object v0, p0, Lcom/motorola/ccc/ota/ui/BackgroundInstallationFragment;->mProgressReceiver:Landroid/content/BroadcastReceiver;

    return-void
.end method

.method private addCancelConfirmDialog(Landroid/content/Context;)V
    .locals 5

    new-instance v0, Landroidx/appcompat/app/AlertDialog$Builder;

    invoke-direct {v0, p1}, Landroidx/appcompat/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    invoke-virtual {p0}, Lcom/motorola/ccc/ota/ui/BackgroundInstallationFragment;->getLayoutInflater()Landroid/view/LayoutInflater;

    move-result-object v1

    const v2, 0x7f0c0022

    const/4 v3, 0x0

    invoke-virtual {v1, v2, v3}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroidx/appcompat/app/AlertDialog$Builder;->setView(Landroid/view/View;)Landroidx/appcompat/app/AlertDialog$Builder;

    invoke-virtual {v0}, Landroidx/appcompat/app/AlertDialog$Builder;->create()Landroidx/appcompat/app/AlertDialog;

    move-result-object v0

    iput-object v0, p0, Lcom/motorola/ccc/ota/ui/BackgroundInstallationFragment;->alertDialog:Landroidx/appcompat/app/AlertDialog;

    const v0, 0x7f09007d

    invoke-virtual {v1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    const/4 v2, 0x0

    invoke-virtual {v0, v2}, Landroid/widget/TextView;->setVisibility(I)V

    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v3

    const v4, 0x7f0e0054

    invoke-virtual {v3, v4}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v0, v3}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    const v0, 0x7f09007f

    invoke-virtual {v1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/Button;

    invoke-virtual {v0, v2}, Landroid/widget/Button;->setVisibility(I)V

    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v3

    const v4, 0x7f0e002b

    invoke-virtual {v3, v4}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v0, v3}, Landroid/widget/Button;->setText(Ljava/lang/CharSequence;)V

    const v3, 0x7f090080

    invoke-virtual {v1, v3}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/Button;

    invoke-virtual {v1, v2}, Landroid/widget/Button;->setVisibility(I)V

    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    const v3, 0x7f0e002a

    invoke-virtual {v2, v3}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Landroid/widget/Button;->setText(Ljava/lang/CharSequence;)V

    new-instance v2, Lcom/motorola/ccc/ota/ui/BackgroundInstallationFragment$$ExternalSyntheticLambda0;

    invoke-direct {v2, p0}, Lcom/motorola/ccc/ota/ui/BackgroundInstallationFragment$$ExternalSyntheticLambda0;-><init>(Lcom/motorola/ccc/ota/ui/BackgroundInstallationFragment;)V

    invoke-virtual {v0, v2}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    new-instance v0, Lcom/motorola/ccc/ota/ui/BackgroundInstallationFragment$$ExternalSyntheticLambda1;

    invoke-direct {v0, p1}, Lcom/motorola/ccc/ota/ui/BackgroundInstallationFragment$$ExternalSyntheticLambda1;-><init>(Landroid/content/Context;)V

    invoke-virtual {v1, v0}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    iget-object v0, p0, Lcom/motorola/ccc/ota/ui/BackgroundInstallationFragment;->alertDialog:Landroidx/appcompat/app/AlertDialog;

    invoke-virtual {v0}, Landroidx/appcompat/app/AlertDialog;->create()V

    iget-object v0, p0, Lcom/motorola/ccc/ota/ui/BackgroundInstallationFragment;->alertDialog:Landroidx/appcompat/app/AlertDialog;

    invoke-static {p1, v0}, Lcom/motorola/ccc/ota/ui/UpdaterUtils;->setCornersRounded(Landroid/content/Context;Landroidx/appcompat/app/AlertDialog;)V

    iget-object p0, p0, Lcom/motorola/ccc/ota/ui/BackgroundInstallationFragment;->alertDialog:Landroidx/appcompat/app/AlertDialog;

    invoke-virtual {p0}, Landroidx/appcompat/app/AlertDialog;->show()V

    return-void
.end method

.method private findViewsById()V
    .locals 2

    iget-object v0, p0, Lcom/motorola/ccc/ota/ui/BackgroundInstallationFragment;->rootView:Landroid/view/View;

    const v1, 0x7f090060

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/LinearLayout;

    iput-object v0, p0, Lcom/motorola/ccc/ota/ui/BackgroundInstallationFragment;->mButtonLayout:Landroid/widget/LinearLayout;

    iget-object v0, p0, Lcom/motorola/ccc/ota/ui/BackgroundInstallationFragment;->rootView:Landroid/view/View;

    const v1, 0x7f09009b

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/Button;

    iput-object v0, p0, Lcom/motorola/ccc/ota/ui/BackgroundInstallationFragment;->mDone:Landroid/widget/Button;

    iget-object v0, p0, Lcom/motorola/ccc/ota/ui/BackgroundInstallationFragment;->rootView:Landroid/view/View;

    const v1, 0x7f090065

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/Button;

    iput-object v0, p0, Lcom/motorola/ccc/ota/ui/BackgroundInstallationFragment;->mCancel:Landroid/widget/Button;

    iget-object v0, p0, Lcom/motorola/ccc/ota/ui/BackgroundInstallationFragment;->rootView:Landroid/view/View;

    const v1, 0x7f090067

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/Button;

    iput-object v0, p0, Lcom/motorola/ccc/ota/ui/BackgroundInstallationFragment;->mCellularResume:Landroid/widget/Button;

    iget-object v0, p0, Lcom/motorola/ccc/ota/ui/BackgroundInstallationFragment;->rootView:Landroid/view/View;

    const v1, 0x7f0901fd

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/Button;

    iput-object v0, p0, Lcom/motorola/ccc/ota/ui/BackgroundInstallationFragment;->mWifiSettings:Landroid/widget/Button;

    iget-object v0, p0, Lcom/motorola/ccc/ota/ui/BackgroundInstallationFragment;->rootView:Landroid/view/View;

    const v1, 0x7f0900e4

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p0, Lcom/motorola/ccc/ota/ui/BackgroundInstallationFragment;->mInstallationPercentage:Landroid/widget/TextView;

    iget-object v0, p0, Lcom/motorola/ccc/ota/ui/BackgroundInstallationFragment;->rootView:Landroid/view/View;

    const v1, 0x7f09004e

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p0, Lcom/motorola/ccc/ota/ui/BackgroundInstallationFragment;->mInstallationMessage:Landroid/widget/TextView;

    iget-object v0, p0, Lcom/motorola/ccc/ota/ui/BackgroundInstallationFragment;->rootView:Landroid/view/View;

    const v1, 0x7f0900e5

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p0, Lcom/motorola/ccc/ota/ui/BackgroundInstallationFragment;->mInstallationStep:Landroid/widget/TextView;

    iget-object v0, p0, Lcom/motorola/ccc/ota/ui/BackgroundInstallationFragment;->rootView:Landroid/view/View;

    const v1, 0x7f09012f

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/ProgressBar;

    iput-object v0, p0, Lcom/motorola/ccc/ota/ui/BackgroundInstallationFragment;->mProgressBar:Landroid/widget/ProgressBar;

    iget-object v0, p0, Lcom/motorola/ccc/ota/ui/BackgroundInstallationFragment;->rootView:Landroid/view/View;

    const v1, 0x7f0900e0

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/ImageView;

    iput-object v0, p0, Lcom/motorola/ccc/ota/ui/BackgroundInstallationFragment;->imgBack:Landroid/widget/ImageView;

    iget-object v0, p0, Lcom/motorola/ccc/ota/ui/BackgroundInstallationFragment;->rootView:Landroid/view/View;

    const v1, 0x7f090083

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p0, Lcom/motorola/ccc/ota/ui/BackgroundInstallationFragment;->mDataChargeWarningMessage:Landroid/widget/TextView;

    return-void
.end method

.method private handleButtons()V
    .locals 2

    iget-object v0, p0, Lcom/motorola/ccc/ota/ui/BackgroundInstallationFragment;->mDone:Landroid/widget/Button;

    new-instance v1, Lcom/motorola/ccc/ota/ui/BackgroundInstallationFragment$1;

    invoke-direct {v1, p0}, Lcom/motorola/ccc/ota/ui/BackgroundInstallationFragment$1;-><init>(Lcom/motorola/ccc/ota/ui/BackgroundInstallationFragment;)V

    invoke-virtual {v0, v1}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    iget-object v0, p0, Lcom/motorola/ccc/ota/ui/BackgroundInstallationFragment;->mCancel:Landroid/widget/Button;

    new-instance v1, Lcom/motorola/ccc/ota/ui/BackgroundInstallationFragment$2;

    invoke-direct {v1, p0}, Lcom/motorola/ccc/ota/ui/BackgroundInstallationFragment$2;-><init>(Lcom/motorola/ccc/ota/ui/BackgroundInstallationFragment;)V

    invoke-virtual {v0, v1}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    iget-object v0, p0, Lcom/motorola/ccc/ota/ui/BackgroundInstallationFragment;->mCellularResume:Landroid/widget/Button;

    new-instance v1, Lcom/motorola/ccc/ota/ui/BackgroundInstallationFragment$3;

    invoke-direct {v1, p0}, Lcom/motorola/ccc/ota/ui/BackgroundInstallationFragment$3;-><init>(Lcom/motorola/ccc/ota/ui/BackgroundInstallationFragment;)V

    invoke-virtual {v0, v1}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    iget-object v0, p0, Lcom/motorola/ccc/ota/ui/BackgroundInstallationFragment;->mWifiSettings:Landroid/widget/Button;

    new-instance v1, Lcom/motorola/ccc/ota/ui/BackgroundInstallationFragment$4;

    invoke-direct {v1, p0}, Lcom/motorola/ccc/ota/ui/BackgroundInstallationFragment$4;-><init>(Lcom/motorola/ccc/ota/ui/BackgroundInstallationFragment;)V

    invoke-virtual {v0, v1}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    iget-object v0, p0, Lcom/motorola/ccc/ota/ui/BackgroundInstallationFragment;->imgBack:Landroid/widget/ImageView;

    new-instance v1, Lcom/motorola/ccc/ota/ui/BackgroundInstallationFragment$5;

    invoke-direct {v1, p0}, Lcom/motorola/ccc/ota/ui/BackgroundInstallationFragment$5;-><init>(Lcom/motorola/ccc/ota/ui/BackgroundInstallationFragment;)V

    invoke-virtual {v0, v1}, Landroid/widget/ImageView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    return-void
.end method

.method private handleResumeOnCellular()V
    .locals 3

    iget-object v0, p0, Lcom/motorola/ccc/ota/ui/BackgroundInstallationFragment;->context:Landroid/content/Context;

    invoke-virtual {v0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    const v1, 0x7f0e0026

    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v0

    iget-object v1, p0, Lcom/motorola/ccc/ota/ui/BackgroundInstallationFragment;->context:Landroid/content/Context;

    const/4 v2, 0x1

    invoke-static {v1, v0, v2}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v0

    invoke-virtual {v0}, Landroid/widget/Toast;->show()V

    iget-object v0, p0, Lcom/motorola/ccc/ota/ui/BackgroundInstallationFragment;->mDataChargeWarningMessage:Landroid/widget/TextView;

    const/16 v1, 0x8

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setVisibility(I)V

    iget-object v0, p0, Lcom/motorola/ccc/ota/ui/BackgroundInstallationFragment;->mCellularResume:Landroid/widget/Button;

    invoke-virtual {v0, v1}, Landroid/widget/Button;->setVisibility(I)V

    iget-object v0, p0, Lcom/motorola/ccc/ota/ui/BackgroundInstallationFragment;->context:Landroid/content/Context;

    sget-object v1, Lcom/motorola/otalib/common/utils/UpgradeUtils$DownloadStatus;->STATUS_RESUME_ON_CELLULAR:Lcom/motorola/otalib/common/utils/UpgradeUtils$DownloadStatus;

    invoke-static {v0, v1}, Lcom/motorola/ccc/ota/utils/UpgradeUtilMethods;->sendUserResponseDuringBackgroundInstallation(Landroid/content/Context;Lcom/motorola/otalib/common/utils/UpgradeUtils$DownloadStatus;)V

    iget-object p0, p0, Lcom/motorola/ccc/ota/ui/BackgroundInstallationFragment;->context:Landroid/content/Context;

    invoke-static {p0}, Lcom/motorola/ccc/ota/utils/CusUtilMethods;->showPopupToOptCellularDataAtt(Landroid/content/Context;)V

    return-void
.end method

.method private initializeCommonLayout()V
    .locals 8

    invoke-virtual {p0}, Lcom/motorola/ccc/ota/ui/BackgroundInstallationFragment;->getActivity()Landroidx/fragment/app/FragmentActivity;

    move-result-object v0

    if-eqz v0, :cond_2

    invoke-virtual {p0}, Lcom/motorola/ccc/ota/ui/BackgroundInstallationFragment;->isAdded()Z

    move-result v1

    if-nez v1, :cond_0

    goto/16 :goto_0

    :cond_0
    invoke-virtual {v0}, Landroid/app/Activity;->getWindow()Landroid/view/Window;

    move-result-object v0

    const/high16 v1, -0x80000000

    invoke-virtual {v0, v1}, Landroid/view/Window;->addFlags(I)V

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/view/Window;->setStatusBarColor(I)V

    iget-object v2, p0, Lcom/motorola/ccc/ota/ui/BackgroundInstallationFragment;->mDataChargeWarningMessage:Landroid/widget/TextView;

    const v3, 0x7f0e00bc

    invoke-virtual {p0, v3}, Lcom/motorola/ccc/ota/ui/BackgroundInstallationFragment;->getString(I)Ljava/lang/String;

    move-result-object v3

    const-string v4, "\n"

    invoke-virtual {v3, v4}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v3

    aget-object v1, v3, v1

    invoke-virtual {v2, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    iget-object v1, p0, Lcom/motorola/ccc/ota/ui/BackgroundInstallationFragment;->context:Landroid/content/Context;

    invoke-static {v1}, Lcom/motorola/ccc/ota/ui/UpdaterUtils;->isBatterySaverEnabled(Landroid/content/Context;)Z

    move-result v1

    if-nez v1, :cond_1

    new-instance v1, Landroidx/core/view/WindowInsetsControllerCompat;

    invoke-virtual {v0}, Landroid/view/Window;->getDecorView()Landroid/view/View;

    move-result-object v2

    invoke-direct {v1, v0, v2}, Landroidx/core/view/WindowInsetsControllerCompat;-><init>(Landroid/view/Window;Landroid/view/View;)V

    iget-object v0, p0, Lcom/motorola/ccc/ota/ui/BackgroundInstallationFragment;->context:Landroid/content/Context;

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
    iget-object v0, p0, Lcom/motorola/ccc/ota/ui/BackgroundInstallationFragment;->settings:Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    sget-object v1, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->SCREEN_ANIMATION_VIEW:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    const-string v2, "downloading"

    invoke-virtual {v0, v1, v2}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->setString(Lcom/motorola/otalib/common/settings/ISetting;Ljava/lang/String;)V

    iget-object v0, p0, Lcom/motorola/ccc/ota/ui/BackgroundInstallationFragment;->rootView:Landroid/view/View;

    const v1, 0x7f0900b7

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    move-object v4, v0

    check-cast v4, Landroid/widget/TextView;

    iget-object v0, p0, Lcom/motorola/ccc/ota/ui/BackgroundInstallationFragment;->rootView:Landroid/view/View;

    const v1, 0x7f0900b9

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    move-object v1, v0

    check-cast v1, Landroid/widget/ExpandableListView;

    iget-object v0, p0, Lcom/motorola/ccc/ota/ui/BackgroundInstallationFragment;->rootView:Landroid/view/View;

    const v2, 0x7f090082

    invoke-virtual {v0, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v7

    iget-object v0, p0, Lcom/motorola/ccc/ota/ui/BackgroundInstallationFragment;->info:Lcom/motorola/ccc/ota/ui/UpdaterUtils$UpgradeInfo;

    invoke-virtual {v0}, Lcom/motorola/ccc/ota/ui/UpdaterUtils$UpgradeInfo;->hasReleaseNotes()Z

    move-result v2

    iget-object v0, p0, Lcom/motorola/ccc/ota/ui/BackgroundInstallationFragment;->info:Lcom/motorola/ccc/ota/ui/UpdaterUtils$UpgradeInfo;

    invoke-virtual {v0}, Lcom/motorola/ccc/ota/ui/UpdaterUtils$UpgradeInfo;->getReleaseNotes()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {p0}, Lcom/motorola/ccc/ota/ui/BackgroundInstallationFragment;->getActivity()Landroidx/fragment/app/FragmentActivity;

    move-result-object v5

    iget-object v6, p0, Lcom/motorola/ccc/ota/ui/BackgroundInstallationFragment;->mUpdateTypeInterface:Lcom/motorola/ccc/ota/ui/updateType/UpdateType$UpdateTypeInterface;

    invoke-static/range {v1 .. v7}, Lcom/motorola/ccc/ota/ui/UpdaterUtils;->setExpandableList(Landroid/widget/ExpandableListView;ZLjava/lang/String;Landroid/widget/TextView;Landroid/content/Context;Lcom/motorola/ccc/ota/ui/updateType/UpdateType$UpdateTypeInterface;Landroid/view/View;)Landroid/widget/ExpandableListView;

    move-result-object v0

    const-string v1, "BGProgress"

    invoke-static {v0, v1}, Lcom/motorola/ccc/ota/ui/UpdaterUtils;->handleExpList(Landroid/widget/ExpandableListView;Ljava/lang/String;)Landroid/widget/ExpandableListView;

    iget-object v0, p0, Lcom/motorola/ccc/ota/ui/BackgroundInstallationFragment;->rootView:Landroid/view/View;

    const v2, 0x7f090116

    invoke-virtual {v0, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p0, Lcom/motorola/ccc/ota/ui/BackgroundInstallationFragment;->osReleaseNotes:Landroid/widget/TextView;

    iget-object v2, p0, Lcom/motorola/ccc/ota/ui/BackgroundInstallationFragment;->context:Landroid/content/Context;

    iget-object v3, p0, Lcom/motorola/ccc/ota/ui/BackgroundInstallationFragment;->info:Lcom/motorola/ccc/ota/ui/UpdaterUtils$UpgradeInfo;

    invoke-static {v2, v0, v3, v1}, Lcom/motorola/ccc/ota/ui/UpdaterUtils;->setOsReleaseNotes(Landroid/content/Context;Landroid/widget/TextView;Lcom/motorola/ccc/ota/ui/UpdaterUtils$UpgradeInfo;Ljava/lang/String;)V

    iget-object v0, p0, Lcom/motorola/ccc/ota/ui/BackgroundInstallationFragment;->meta:Lcom/motorola/otalib/common/metaData/MetaData;

    invoke-virtual {v0}, Lcom/motorola/otalib/common/metaData/MetaData;->getDisplayVersion()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0}, Lcom/motorola/ccc/ota/ui/BackgroundInstallationFragment;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    invoke-virtual {p0}, Lcom/motorola/ccc/ota/ui/BackgroundInstallationFragment;->getContext()Landroid/content/Context;

    move-result-object v2

    iget-object v3, p0, Lcom/motorola/ccc/ota/ui/BackgroundInstallationFragment;->meta:Lcom/motorola/otalib/common/metaData/MetaData;

    invoke-virtual {v3}, Lcom/motorola/otalib/common/metaData/MetaData;->getSize()J

    move-result-wide v3

    invoke-static {v2, v3, v4}, Landroid/text/format/Formatter;->formatFileSize(Landroid/content/Context;J)Ljava/lang/String;

    move-result-object v2

    filled-new-array {v2}, [Ljava/lang/Object;

    move-result-object v2

    const v3, 0x7f0e01cb

    invoke-virtual {v1, v3, v2}, Landroid/content/res/Resources;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    filled-new-array {v0, v1}, [Ljava/lang/Object;

    move-result-object v0

    const v1, 0x7f0e00d1

    invoke-virtual {p0, v1, v0}, Lcom/motorola/ccc/ota/ui/BackgroundInstallationFragment;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    iget-object p0, p0, Lcom/motorola/ccc/ota/ui/BackgroundInstallationFragment;->rootView:Landroid/view/View;

    const v1, 0x7f0900e6

    invoke-virtual {p0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p0

    check-cast p0, Landroid/widget/TextView;

    invoke-virtual {p0, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    :cond_2
    :goto_0
    return-void
.end method

.method private initializeCustomView(Landroid/content/Intent;)V
    .locals 11

    const-string v0, "com.motorola.ccc.ota.upgrade_status"

    const/4 v1, -0x1

    invoke-virtual {p1, v0, v1}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I

    move-result v0

    const-string v2, "com.motorola.ccc.ota.upgrade_percentage"

    const/high16 v3, -0x40800000    # -1.0f

    invoke-virtual {p1, v2, v3}, Landroid/content/Intent;->getFloatExtra(Ljava/lang/String;F)F

    move-result v2

    const-string v4, "com.motorola.blur.service.blur.upgrade.download.deferred"

    sget v5, Lcom/motorola/ccc/ota/ui/BackgroundInstallationFragment;->DEFAULT_RETRY_OR_SUSPEND_VALUE:I

    invoke-virtual {p1, v4, v5}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I

    move-result p1

    iput p1, p0, Lcom/motorola/ccc/ota/ui/BackgroundInstallationFragment;->mRetriedOrSuspend:I

    sget v4, Lcom/motorola/ccc/ota/ui/BackgroundInstallationFragment;->DEFAULT_RETRY_OR_SUSPEND_VALUE:I

    const/4 v5, 0x4

    const/4 v6, 0x0

    if-ne p1, v4, :cond_3

    const-string p1, "User did check for update during BG install"

    const-string v0, "OtaApp"

    invoke-static {v0, p1}, Lcom/motorola/ccc/ota/utils/Logger;->debug(Ljava/lang/String;Ljava/lang/String;)V

    iget-object p1, p0, Lcom/motorola/ccc/ota/ui/BackgroundInstallationFragment;->settings:Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    sget-object v2, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->STORED_AB_STATUS:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    invoke-virtual {p1, v2, v1}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->getInt(Lcom/motorola/otalib/common/settings/ISetting;I)I

    move-result p1

    iget-object v2, p0, Lcom/motorola/ccc/ota/ui/BackgroundInstallationFragment;->settings:Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    sget-object v4, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->STORED_AB_PROGRESS_PERCENT:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    invoke-virtual {v2, v4, v3}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->getFloat(Lcom/motorola/otalib/common/settings/ISetting;F)F

    move-result v2

    iget-object v3, p0, Lcom/motorola/ccc/ota/ui/BackgroundInstallationFragment;->context:Landroid/content/Context;

    const-string v4, "connectivity"

    invoke-virtual {v3, v4}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Landroid/net/ConnectivityManager;

    iget-object v4, p0, Lcom/motorola/ccc/ota/ui/BackgroundInstallationFragment;->settings:Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    sget-object v7, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->BATTERY_LOW:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    invoke-virtual {v4, v7}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->getBoolean(Lcom/motorola/otalib/common/settings/ISetting;)Z

    move-result v4

    if-eqz v4, :cond_0

    if-gez p1, :cond_1

    :cond_0
    invoke-static {v3}, Lcom/motorola/otalib/common/utils/NetworkUtils;->isNetWorkConnected(Landroid/net/ConnectivityManager;)Z

    move-result v3

    if-nez v3, :cond_2

    if-ge p1, v5, :cond_2

    :cond_1
    iput v1, p0, Lcom/motorola/ccc/ota/ui/BackgroundInstallationFragment;->mRetriedOrSuspend:I

    goto :goto_0

    :cond_2
    iput v6, p0, Lcom/motorola/ccc/ota/ui/BackgroundInstallationFragment;->mRetriedOrSuspend:I

    :goto_0
    new-instance v1, Ljava/lang/StringBuilder;

    const-string v3, "Updated progress details, progress "

    invoke-direct {v1, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v3, " status "

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v3, " mRetriedOrSuspend "

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget v3, p0, Lcom/motorola/ccc/ota/ui/BackgroundInstallationFragment;->mRetriedOrSuspend:I

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/motorola/ccc/ota/utils/Logger;->debug(Ljava/lang/String;Ljava/lang/String;)V

    move v0, p1

    :cond_3
    invoke-static {}, Ljava/text/NumberFormat;->getPercentInstance()Ljava/text/NumberFormat;

    move-result-object p1

    const/high16 v1, 0x42c80000    # 100.0f

    div-float v1, v2, v1

    float-to-double v3, v1

    invoke-virtual {p1, v3, v4}, Ljava/text/NumberFormat;->format(D)Ljava/lang/String;

    move-result-object p1

    invoke-static {}, Lcom/motorola/ccc/ota/ui/UpdaterUtils;->showCancelOption()Z

    move-result v1

    const/4 v3, 0x6

    if-eqz v1, :cond_4

    if-ge v0, v3, :cond_4

    iget-object v1, p0, Lcom/motorola/ccc/ota/ui/BackgroundInstallationFragment;->mCancel:Landroid/widget/Button;

    invoke-virtual {v1, v6}, Landroid/widget/Button;->setVisibility(I)V

    goto :goto_1

    :cond_4
    iget-object v1, p0, Lcom/motorola/ccc/ota/ui/BackgroundInstallationFragment;->mCancel:Landroid/widget/Button;

    const/16 v4, 0x8

    invoke-virtual {v1, v4}, Landroid/widget/Button;->setVisibility(I)V

    :goto_1
    if-ltz v0, :cond_8

    iget-object v1, p0, Lcom/motorola/ccc/ota/ui/BackgroundInstallationFragment;->mInstallationPercentage:Landroid/widget/TextView;

    invoke-virtual {v1, v6}, Landroid/widget/TextView;->setVisibility(I)V

    iget-object v1, p0, Lcom/motorola/ccc/ota/ui/BackgroundInstallationFragment;->mProgressBar:Landroid/widget/ProgressBar;

    invoke-virtual {v1, v6}, Landroid/widget/ProgressBar;->setVisibility(I)V

    iget-object v1, p0, Lcom/motorola/ccc/ota/ui/BackgroundInstallationFragment;->mInstallationPercentage:Landroid/widget/TextView;

    invoke-virtual {p0}, Lcom/motorola/ccc/ota/ui/BackgroundInstallationFragment;->getResources()Landroid/content/res/Resources;

    move-result-object v4

    filled-new-array {p1}, [Ljava/lang/Object;

    move-result-object v7

    const v8, 0x7f0e00a0

    invoke-virtual {v4, v8, v7}, Landroid/content/res/Resources;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v1, v4}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    iget-object v1, p0, Lcom/motorola/ccc/ota/ui/BackgroundInstallationFragment;->mProgressBar:Landroid/widget/ProgressBar;

    invoke-static {v2}, Ljava/lang/Math;->round(F)I

    move-result v4

    invoke-virtual {v1, v4}, Landroid/widget/ProgressBar;->setProgress(I)V

    iget-object v1, p0, Lcom/motorola/ccc/ota/ui/BackgroundInstallationFragment;->mInstallationStep:Landroid/widget/TextView;

    invoke-virtual {v1, v6}, Landroid/widget/TextView;->setVisibility(I)V

    invoke-virtual {p0}, Lcom/motorola/ccc/ota/ui/BackgroundInstallationFragment;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v7

    filled-new-array {v4, v7}, [Ljava/lang/Object;

    move-result-object v4

    const v7, 0x7f0e0039

    invoke-virtual {v1, v7, v4}, Landroid/content/res/Resources;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    if-ne v0, v5, :cond_5

    invoke-virtual {p0}, Lcom/motorola/ccc/ota/ui/BackgroundInstallationFragment;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    const v4, 0x7f0e01ec

    invoke-virtual {v1, v4}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v1

    :cond_5
    const/4 v4, 0x5

    if-ne v0, v4, :cond_6

    invoke-virtual {p0}, Lcom/motorola/ccc/ota/ui/BackgroundInstallationFragment;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    const v4, 0x7f0e00fe

    invoke-virtual {v1, v4}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v1

    :cond_6
    if-ne v0, v3, :cond_7

    iget-object v1, p0, Lcom/motorola/ccc/ota/ui/BackgroundInstallationFragment;->mInstallationPercentage:Landroid/widget/TextView;

    invoke-virtual {p0}, Lcom/motorola/ccc/ota/ui/BackgroundInstallationFragment;->getResources()Landroid/content/res/Resources;

    move-result-object v4

    invoke-static {}, Ljava/text/NumberFormat;->getPercentInstance()Ljava/text/NumberFormat;

    move-result-object v5

    const-wide/high16 v9, 0x3ff0000000000000L    # 1.0

    invoke-virtual {v5, v9, v10}, Ljava/text/NumberFormat;->format(D)Ljava/lang/String;

    move-result-object v5

    filled-new-array {v5}, [Ljava/lang/Object;

    move-result-object v5

    invoke-virtual {v4, v8, v5}, Landroid/content/res/Resources;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v1, v4}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    invoke-virtual {p0}, Lcom/motorola/ccc/ota/ui/BackgroundInstallationFragment;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    filled-new-array {v0, v3}, [Ljava/lang/Object;

    move-result-object v0

    const v3, 0x7f0e009f

    invoke-virtual {v1, v3, v0}, Landroid/content/res/Resources;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    :cond_7
    iget-object v0, p0, Lcom/motorola/ccc/ota/ui/BackgroundInstallationFragment;->mInstallationStep:Landroid/widget/TextView;

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    :cond_8
    iget-object v0, p0, Lcom/motorola/ccc/ota/ui/BackgroundInstallationFragment;->mInstallationMessage:Landroid/widget/TextView;

    iget-object v1, p0, Lcom/motorola/ccc/ota/ui/BackgroundInstallationFragment;->context:Landroid/content/Context;

    invoke-virtual {v1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    const v3, 0x7f0e0050

    invoke-virtual {v1, v3}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    invoke-static {}, Lcom/motorola/ccc/ota/utils/BuildPropReader;->isStreamingUpdate()Z

    move-result v0

    const v1, 0x7f0e0116

    if-eqz v0, :cond_c

    iget v0, p0, Lcom/motorola/ccc/ota/ui/BackgroundInstallationFragment;->mRetriedOrSuspend:I

    if-eqz v0, :cond_b

    iget-object v0, p0, Lcom/motorola/ccc/ota/ui/BackgroundInstallationFragment;->mInstallationPercentage:Landroid/widget/TextView;

    invoke-virtual {p0}, Lcom/motorola/ccc/ota/ui/BackgroundInstallationFragment;->getResources()Landroid/content/res/Resources;

    move-result-object v3

    filled-new-array {p1}, [Ljava/lang/Object;

    move-result-object p1

    invoke-virtual {v3, v1, p1}, Landroid/content/res/Resources;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    iget-object p1, p0, Lcom/motorola/ccc/ota/ui/BackgroundInstallationFragment;->mProgressBar:Landroid/widget/ProgressBar;

    invoke-static {v2}, Ljava/lang/Math;->round(F)I

    move-result v0

    invoke-virtual {p1, v0}, Landroid/widget/ProgressBar;->setProgress(I)V

    invoke-direct {p0}, Lcom/motorola/ccc/ota/ui/BackgroundInstallationFragment;->updatePauseView()V

    iget-object p1, p0, Lcom/motorola/ccc/ota/ui/BackgroundInstallationFragment;->meta:Lcom/motorola/otalib/common/metaData/MetaData;

    invoke-virtual {p1}, Lcom/motorola/otalib/common/metaData/MetaData;->getForceDownloadTime()D

    move-result-wide v0

    const-wide/16 v2, 0x0

    cmpl-double p1, v0, v2

    if-ltz p1, :cond_9

    const/4 v6, 0x1

    :cond_9
    iget p1, p0, Lcom/motorola/ccc/ota/ui/BackgroundInstallationFragment;->mRetriedOrSuspend:I

    iget-object v0, p0, Lcom/motorola/ccc/ota/ui/BackgroundInstallationFragment;->settings:Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    iget-object v1, p0, Lcom/motorola/ccc/ota/ui/BackgroundInstallationFragment;->context:Landroid/content/Context;

    invoke-static {p1, v6, v0, v1}, Lcom/motorola/ccc/ota/utils/NotificationUtils;->getErrorNotificationText(IZLcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;Landroid/content/Context;)Ljava/lang/String;

    move-result-object p1

    invoke-static {}, Lcom/motorola/ccc/ota/ui/UpdaterUtils;->checkForFinalDeferTimeForForceUpdate()Z

    move-result v0

    if-eqz v0, :cond_a

    invoke-static {}, Lcom/motorola/ccc/ota/ui/UpdaterUtils;->getAutomaticDownloadForCellular()Z

    move-result v0

    if-nez v0, :cond_a

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-static {}, Ljava/lang/System;->lineSeparator()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p0}, Lcom/motorola/ccc/ota/ui/BackgroundInstallationFragment;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    iget-object v1, p0, Lcom/motorola/ccc/ota/ui/BackgroundInstallationFragment;->context:Landroid/content/Context;

    invoke-static {}, Lcom/motorola/ccc/ota/ui/UpdaterUtils;->getMaxForceDownloadDeferTime()J

    move-result-wide v2

    invoke-static {v1, v2, v3}, Lcom/motorola/ccc/ota/utils/DateFormatUtils;->getCalendarString(Landroid/content/Context;J)Ljava/lang/String;

    move-result-object v1

    filled-new-array {v1}, [Ljava/lang/Object;

    move-result-object v1

    const v2, 0x7f0e004e

    invoke-virtual {v0, v2, v1}, Landroid/content/res/Resources;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    :cond_a
    iget-object p0, p0, Lcom/motorola/ccc/ota/ui/BackgroundInstallationFragment;->mInstallationMessage:Landroid/widget/TextView;

    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    goto :goto_2

    :cond_b
    invoke-direct {p0}, Lcom/motorola/ccc/ota/ui/BackgroundInstallationFragment;->updateResumeView()V

    goto :goto_2

    :cond_c
    iget v0, p0, Lcom/motorola/ccc/ota/ui/BackgroundInstallationFragment;->mRetriedOrSuspend:I

    if-eqz v0, :cond_d

    invoke-static {}, Lcom/motorola/ccc/ota/utils/BuildPropReader;->isATT()Z

    move-result v0

    if-eqz v0, :cond_d

    iget-object v0, p0, Lcom/motorola/ccc/ota/ui/BackgroundInstallationFragment;->settings:Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    sget-object v3, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->BATTERY_LOW:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    invoke-virtual {v0, v3}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->getBoolean(Lcom/motorola/otalib/common/settings/ISetting;)Z

    move-result v0

    if-eqz v0, :cond_d

    iget-object v0, p0, Lcom/motorola/ccc/ota/ui/BackgroundInstallationFragment;->mInstallationPercentage:Landroid/widget/TextView;

    invoke-virtual {p0}, Lcom/motorola/ccc/ota/ui/BackgroundInstallationFragment;->getResources()Landroid/content/res/Resources;

    move-result-object v3

    filled-new-array {p1}, [Ljava/lang/Object;

    move-result-object p1

    invoke-virtual {v3, v1, p1}, Landroid/content/res/Resources;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    iget-object p1, p0, Lcom/motorola/ccc/ota/ui/BackgroundInstallationFragment;->mProgressBar:Landroid/widget/ProgressBar;

    invoke-static {v2}, Ljava/lang/Math;->round(F)I

    move-result v0

    invoke-virtual {p1, v0}, Landroid/widget/ProgressBar;->setProgress(I)V

    iget-object p1, p0, Lcom/motorola/ccc/ota/ui/BackgroundInstallationFragment;->mInstallationMessage:Landroid/widget/TextView;

    iget-object p0, p0, Lcom/motorola/ccc/ota/ui/BackgroundInstallationFragment;->context:Landroid/content/Context;

    invoke-static {p0}, Lcom/motorola/ccc/ota/ui/UpdaterUtils;->getBatteryLowMessage(Landroid/content/Context;)Ljava/lang/String;

    move-result-object p0

    invoke-virtual {p1, p0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    :cond_d
    :goto_2
    return-void
.end method

.method static synthetic lambda$addCancelConfirmDialog$1(Landroid/content/Context;Landroid/view/View;)V
    .locals 0

    sget-object p1, Lcom/motorola/otalib/common/utils/UpgradeUtils$DownloadStatus;->STATUS_INSTALL_CANCEL:Lcom/motorola/otalib/common/utils/UpgradeUtils$DownloadStatus;

    invoke-static {p0, p1}, Lcom/motorola/ccc/ota/utils/UpgradeUtilMethods;->sendUserResponseDuringBackgroundInstallation(Landroid/content/Context;Lcom/motorola/otalib/common/utils/UpgradeUtils$DownloadStatus;)V

    return-void
.end method

.method private updatePauseView()V
    .locals 5

    iget-object v0, p0, Lcom/motorola/ccc/ota/ui/BackgroundInstallationFragment;->meta:Lcom/motorola/otalib/common/metaData/MetaData;

    invoke-virtual {v0}, Lcom/motorola/otalib/common/metaData/MetaData;->getForceDownloadTime()D

    move-result-wide v0

    const-wide/16 v2, 0x0

    cmpl-double v0, v0, v2

    const/4 v1, 0x1

    const/4 v2, 0x0

    if-ltz v0, :cond_0

    move v0, v1

    goto :goto_0

    :cond_0
    move v0, v2

    :goto_0
    new-instance v3, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    invoke-direct {v3}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;-><init>()V

    iget-object v4, p0, Lcom/motorola/ccc/ota/ui/BackgroundInstallationFragment;->mButtonLayout:Landroid/widget/LinearLayout;

    invoke-virtual {v4, v1}, Landroid/widget/LinearLayout;->setOrientation(I)V

    iget-object v4, p0, Lcom/motorola/ccc/ota/ui/BackgroundInstallationFragment;->mButtonLayout:Landroid/widget/LinearLayout;

    invoke-virtual {v4, v1}, Landroid/widget/LinearLayout;->setGravity(I)V

    iget-object v1, p0, Lcom/motorola/ccc/ota/ui/BackgroundInstallationFragment;->settings:Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    sget-object v4, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->BATTERY_LOW:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    invoke-virtual {v1, v4}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->getBoolean(Lcom/motorola/otalib/common/settings/ISetting;)Z

    move-result v1

    const/16 v4, 0x8

    if-nez v1, :cond_4

    invoke-static {}, Lcom/motorola/ccc/ota/ui/UpdaterUtils;->isWifiOnly()Z

    move-result v1

    if-nez v1, :cond_2

    if-nez v0, :cond_1

    invoke-static {v3}, Lcom/motorola/ccc/ota/utils/SmartUpdateUtils;->isDownloadForcedForSmartUpdate(Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;)Z

    move-result v0

    if-eqz v0, :cond_2

    :cond_1
    invoke-static {}, Lcom/motorola/ccc/ota/ui/UpdaterUtils;->getAutomaticDownloadForCellular()Z

    move-result v0

    if-nez v0, :cond_2

    iget-object v0, p0, Lcom/motorola/ccc/ota/ui/BackgroundInstallationFragment;->mDataChargeWarningMessage:Landroid/widget/TextView;

    invoke-virtual {v0, v2}, Landroid/widget/TextView;->setVisibility(I)V

    iget-object v0, p0, Lcom/motorola/ccc/ota/ui/BackgroundInstallationFragment;->mCellularResume:Landroid/widget/Button;

    invoke-virtual {v0, v2}, Landroid/widget/Button;->setVisibility(I)V

    :cond_2
    invoke-static {}, Lcom/motorola/ccc/ota/utils/BuildPropReader;->isBotaATT()Z

    move-result v0

    if-eqz v0, :cond_3

    invoke-static {}, Lcom/motorola/ccc/ota/ui/UpdaterUtils;->isWifiOnly()Z

    move-result v0

    if-eqz v0, :cond_3

    invoke-static {}, Lcom/motorola/ccc/ota/ui/UpdaterUtils;->isWifiOnlyPkg()Z

    move-result v0

    if-nez v0, :cond_3

    iget-object v0, p0, Lcom/motorola/ccc/ota/ui/BackgroundInstallationFragment;->mDataChargeWarningMessage:Landroid/widget/TextView;

    invoke-virtual {v0, v2}, Landroid/widget/TextView;->setVisibility(I)V

    iget-object v0, p0, Lcom/motorola/ccc/ota/ui/BackgroundInstallationFragment;->mCellularResume:Landroid/widget/Button;

    invoke-virtual {v0, v2}, Landroid/widget/Button;->setVisibility(I)V

    :cond_3
    iget-object v0, p0, Lcom/motorola/ccc/ota/ui/BackgroundInstallationFragment;->mWifiSettings:Landroid/widget/Button;

    invoke-virtual {v0, v2}, Landroid/widget/Button;->setVisibility(I)V

    iget-object v0, p0, Lcom/motorola/ccc/ota/ui/BackgroundInstallationFragment;->mDone:Landroid/widget/Button;

    invoke-virtual {v0, v4}, Landroid/widget/Button;->setVisibility(I)V

    goto :goto_1

    :cond_4
    iget-object v0, p0, Lcom/motorola/ccc/ota/ui/BackgroundInstallationFragment;->mButtonLayout:Landroid/widget/LinearLayout;

    invoke-virtual {v0, v2}, Landroid/widget/LinearLayout;->setOrientation(I)V

    iget-object v0, p0, Lcom/motorola/ccc/ota/ui/BackgroundInstallationFragment;->mButtonLayout:Landroid/widget/LinearLayout;

    const v1, 0x800005

    invoke-virtual {v0, v1}, Landroid/widget/LinearLayout;->setGravity(I)V

    iget-object v0, p0, Lcom/motorola/ccc/ota/ui/BackgroundInstallationFragment;->mDataChargeWarningMessage:Landroid/widget/TextView;

    invoke-virtual {v0, v4}, Landroid/widget/TextView;->setVisibility(I)V

    iget-object v0, p0, Lcom/motorola/ccc/ota/ui/BackgroundInstallationFragment;->mCellularResume:Landroid/widget/Button;

    invoke-virtual {v0, v4}, Landroid/widget/Button;->setVisibility(I)V

    iget-object v0, p0, Lcom/motorola/ccc/ota/ui/BackgroundInstallationFragment;->mWifiSettings:Landroid/widget/Button;

    invoke-virtual {v0, v4}, Landroid/widget/Button;->setVisibility(I)V

    iget-object v0, p0, Lcom/motorola/ccc/ota/ui/BackgroundInstallationFragment;->mDone:Landroid/widget/Button;

    invoke-virtual {v0, v2}, Landroid/widget/Button;->setVisibility(I)V

    :goto_1
    iget-object p0, p0, Lcom/motorola/ccc/ota/ui/BackgroundInstallationFragment;->settings:Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    sget-object v0, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->SCREEN_ANIMATION_VIEW:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    const-string v1, "download_stop"

    invoke-virtual {p0, v0, v1}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->setString(Lcom/motorola/otalib/common/settings/ISetting;Ljava/lang/String;)V

    return-void
.end method

.method private updateResumeView()V
    .locals 3

    iget-object v0, p0, Lcom/motorola/ccc/ota/ui/BackgroundInstallationFragment;->mButtonLayout:Landroid/widget/LinearLayout;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/widget/LinearLayout;->setOrientation(I)V

    iget-object v0, p0, Lcom/motorola/ccc/ota/ui/BackgroundInstallationFragment;->mButtonLayout:Landroid/widget/LinearLayout;

    const v2, 0x800005

    invoke-virtual {v0, v2}, Landroid/widget/LinearLayout;->setGravity(I)V

    iget-object v0, p0, Lcom/motorola/ccc/ota/ui/BackgroundInstallationFragment;->mDataChargeWarningMessage:Landroid/widget/TextView;

    const/16 v2, 0x8

    invoke-virtual {v0, v2}, Landroid/widget/TextView;->setVisibility(I)V

    iget-object v0, p0, Lcom/motorola/ccc/ota/ui/BackgroundInstallationFragment;->mCellularResume:Landroid/widget/Button;

    invoke-virtual {v0, v2}, Landroid/widget/Button;->setVisibility(I)V

    iget-object v0, p0, Lcom/motorola/ccc/ota/ui/BackgroundInstallationFragment;->mWifiSettings:Landroid/widget/Button;

    invoke-virtual {v0, v2}, Landroid/widget/Button;->setVisibility(I)V

    iget-object v0, p0, Lcom/motorola/ccc/ota/ui/BackgroundInstallationFragment;->mDone:Landroid/widget/Button;

    invoke-virtual {v0, v1}, Landroid/widget/Button;->setVisibility(I)V

    iget-object v0, p0, Lcom/motorola/ccc/ota/ui/BackgroundInstallationFragment;->settings:Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    sget-object v1, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->SCREEN_ANIMATION_VIEW:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    invoke-virtual {v0, v1}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->getString(Lcom/motorola/otalib/common/settings/ISetting;)Ljava/lang/String;

    move-result-object v0

    if-eqz v0, :cond_0

    const-string v1, "downloading"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_0

    iget-object p0, p0, Lcom/motorola/ccc/ota/ui/BackgroundInstallationFragment;->settings:Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    sget-object v0, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->SCREEN_ANIMATION_VIEW:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    invoke-virtual {p0, v0, v1}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->setString(Lcom/motorola/otalib/common/settings/ISetting;Ljava/lang/String;)V

    :cond_0
    return-void
.end method

.method private updateUIDuringCompatibilityCheck(Landroid/content/Intent;)V
    .locals 3

    const-string v0, "streaming_compatibility_status"

    invoke-virtual {p1, v0}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/motorola/otalib/common/utils/UpgradeUtils$DownloadStatus;->valueOf(Ljava/lang/String;)Lcom/motorola/otalib/common/utils/UpgradeUtils$DownloadStatus;

    move-result-object v0

    sget-object v1, Lcom/motorola/ccc/ota/ui/BackgroundInstallationFragment$8;->$SwitchMap$com$motorola$otalib$common$utils$UpgradeUtils$DownloadStatus:[I

    invoke-virtual {v0}, Lcom/motorola/otalib/common/utils/UpgradeUtils$DownloadStatus;->ordinal()I

    move-result v0

    aget v0, v1, v0

    const v1, 0x7f0e0152

    packed-switch v0, :pswitch_data_0

    iget-object p1, p0, Lcom/motorola/ccc/ota/ui/BackgroundInstallationFragment;->context:Landroid/content/Context;

    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object p1

    invoke-virtual {p1, v1}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object p1

    goto/16 :goto_0

    :pswitch_0
    const-string v0, "com.motorola.blur.service.blur.upgrade.free_space_req"

    invoke-virtual {p1, v0}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    invoke-static {p1}, Ljava/lang/Long;->valueOf(Ljava/lang/String;)Ljava/lang/Long;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/Long;->longValue()J

    move-result-wide v0

    iget-object p1, p0, Lcom/motorola/ccc/ota/ui/BackgroundInstallationFragment;->context:Landroid/content/Context;

    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object p1

    iget-object v2, p0, Lcom/motorola/ccc/ota/ui/BackgroundInstallationFragment;->context:Landroid/content/Context;

    invoke-static {v2, v0, v1}, Landroid/text/format/Formatter;->formatFileSize(Landroid/content/Context;J)Ljava/lang/String;

    move-result-object v0

    filled-new-array {v0}, [Ljava/lang/Object;

    move-result-object v0

    const v1, 0x7f0e00f5

    invoke-virtual {p1, v1, v0}, Landroid/content/res/Resources;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p1

    goto/16 :goto_0

    :pswitch_1
    iget-object p1, p0, Lcom/motorola/ccc/ota/ui/BackgroundInstallationFragment;->context:Landroid/content/Context;

    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object p1

    const v0, 0x7f0e002f

    invoke-virtual {p1, v0}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object p1

    goto/16 :goto_0

    :pswitch_2
    iget-object p1, p0, Lcom/motorola/ccc/ota/ui/BackgroundInstallationFragment;->context:Landroid/content/Context;

    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object p1

    const v0, 0x7f0e0153

    invoke-virtual {p1, v0}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object p1

    goto/16 :goto_0

    :pswitch_3
    iget-object p1, p0, Lcom/motorola/ccc/ota/ui/BackgroundInstallationFragment;->context:Landroid/content/Context;

    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object p1

    const v0, 0x7f0e009e

    invoke-virtual {p1, v0}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object p1

    goto :goto_0

    :pswitch_4
    invoke-direct {p0}, Lcom/motorola/ccc/ota/ui/BackgroundInstallationFragment;->updateResumeView()V

    iget-object p1, p0, Lcom/motorola/ccc/ota/ui/BackgroundInstallationFragment;->context:Landroid/content/Context;

    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object p1

    invoke-virtual {p1, v1}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object p1

    goto :goto_0

    :pswitch_5
    invoke-direct {p0}, Lcom/motorola/ccc/ota/ui/BackgroundInstallationFragment;->updatePauseView()V

    iget-object p1, p0, Lcom/motorola/ccc/ota/ui/BackgroundInstallationFragment;->context:Landroid/content/Context;

    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object p1

    const v0, 0x7f0e0055

    invoke-virtual {p1, v0}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object p1

    goto :goto_0

    :pswitch_6
    invoke-direct {p0}, Lcom/motorola/ccc/ota/ui/BackgroundInstallationFragment;->updatePauseView()V

    invoke-static {}, Lcom/motorola/ccc/ota/env/CusAndroidUtils;->isDeviceInDatasaverMode()Z

    move-result p1

    if-eqz p1, :cond_0

    iget-object p1, p0, Lcom/motorola/ccc/ota/ui/BackgroundInstallationFragment;->context:Landroid/content/Context;

    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object p1

    const v0, 0x7f0e014e

    invoke-virtual {p1, v0}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object p1

    goto :goto_0

    :cond_0
    iget-object p1, p0, Lcom/motorola/ccc/ota/ui/BackgroundInstallationFragment;->context:Landroid/content/Context;

    invoke-static {p1}, Lcom/motorola/ccc/ota/ui/UpdaterUtils;->isDataNetworkRoaming(Landroid/content/Context;)Z

    move-result p1

    if-eqz p1, :cond_1

    iget-object p1, p0, Lcom/motorola/ccc/ota/ui/BackgroundInstallationFragment;->context:Landroid/content/Context;

    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object p1

    const v0, 0x7f0e0150

    invoke-virtual {p1, v0}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object p1

    goto :goto_0

    :cond_1
    invoke-static {}, Lcom/motorola/ccc/ota/ui/UpdaterUtils;->isAdminAPNEnabled()Z

    move-result p1

    if-eqz p1, :cond_2

    iget-object p1, p0, Lcom/motorola/ccc/ota/ui/BackgroundInstallationFragment;->context:Landroid/content/Context;

    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object p1

    const v0, 0x7f0e014f

    invoke-virtual {p1, v0}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object p1

    goto :goto_0

    :cond_2
    iget-object p1, p0, Lcom/motorola/ccc/ota/ui/BackgroundInstallationFragment;->context:Landroid/content/Context;

    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object p1

    const v0, 0x7f0e014d

    invoke-virtual {p1, v0}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object p1

    :goto_0
    iget-object p0, p0, Lcom/motorola/ccc/ota/ui/BackgroundInstallationFragment;->mInstallationMessage:Landroid/widget/TextView;

    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    return-void

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_6
        :pswitch_5
        :pswitch_4
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method


# virtual methods
.method synthetic lambda$addCancelConfirmDialog$0$com-motorola-ccc-ota-ui-BackgroundInstallationFragment(Landroid/view/View;)V
    .locals 0

    iget-object p0, p0, Lcom/motorola/ccc/ota/ui/BackgroundInstallationFragment;->alertDialog:Landroidx/appcompat/app/AlertDialog;

    invoke-virtual {p0}, Landroidx/appcompat/app/AlertDialog;->dismiss()V

    return-void
.end method

.method public onAttach(Landroid/content/Context;)V
    .locals 1

    invoke-super {p0, p1}, Landroidx/fragment/app/Fragment;->onAttach(Landroid/content/Context;)V

    iput-object p1, p0, Lcom/motorola/ccc/ota/ui/BackgroundInstallationFragment;->context:Landroid/content/Context;

    instance-of v0, p1, Landroid/app/Activity;

    if-eqz v0, :cond_0

    check-cast p1, Landroid/app/Activity;

    iput-object p1, p0, Lcom/motorola/ccc/ota/ui/BackgroundInstallationFragment;->activity:Landroid/app/Activity;

    :cond_0
    return-void
.end method

.method public onCreate(Landroid/os/Bundle;)V
    .locals 3

    invoke-super {p0, p1}, Landroidx/fragment/app/Fragment;->onCreate(Landroid/os/Bundle;)V

    new-instance p1, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    invoke-direct {p1}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;-><init>()V

    iput-object p1, p0, Lcom/motorola/ccc/ota/ui/BackgroundInstallationFragment;->settings:Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    new-instance p1, Landroid/content/IntentFilter;

    invoke-direct {p1}, Landroid/content/IntentFilter;-><init>()V

    const-string v0, "com.motorola.ccc.ota.Actions.FINISH_BG_INSTALL_ACTIVITY"

    invoke-virtual {p1, v0}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    iget-object v0, p0, Lcom/motorola/ccc/ota/ui/BackgroundInstallationFragment;->context:Landroid/content/Context;

    iget-object v1, p0, Lcom/motorola/ccc/ota/ui/BackgroundInstallationFragment;->mFinishReceiver:Landroid/content/BroadcastReceiver;

    invoke-static {v0, v1, p1}, Lcom/motorola/otalib/common/utils/BroadcastUtils;->registerLocalReceiver(Landroid/content/Context;Landroid/content/BroadcastReceiver;Landroid/content/IntentFilter;)V

    new-instance p1, Landroid/content/IntentFilter;

    invoke-direct {p1}, Landroid/content/IntentFilter;-><init>()V

    const-string v0, "com.motorola.ccc.ota.ACTION_AB_UPDATE_PROGRESS"

    invoke-virtual {p1, v0}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    const-string v0, "com.motorola.blur.service.blur.Actions.UPGRADE_UPDATE_VERIFY_PAYLOAD_METADATA_DOWNLOAD_STATUS"

    invoke-virtual {p1, v0}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    const-string v0, "com.motorola.ccc.ota.START_RESTART_ACTIVITY_INTENT"

    invoke-virtual {p1, v0}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    const-string v0, "com.motorola.ccc.ota.UPGRADE_RESTART_NOTIFICATION"

    invoke-virtual {p1, v0}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    iget-object v0, p0, Lcom/motorola/ccc/ota/ui/BackgroundInstallationFragment;->context:Landroid/content/Context;

    iget-object v1, p0, Lcom/motorola/ccc/ota/ui/BackgroundInstallationFragment;->mProgressReceiver:Landroid/content/BroadcastReceiver;

    const/4 v2, 0x2

    invoke-virtual {v0, v1, p1, v2}, Landroid/content/Context;->registerReceiver(Landroid/content/BroadcastReceiver;Landroid/content/IntentFilter;I)Landroid/content/Intent;

    invoke-virtual {p0}, Lcom/motorola/ccc/ota/ui/BackgroundInstallationFragment;->getArguments()Landroid/os/Bundle;

    move-result-object p1

    if-eqz p1, :cond_0

    const-string v0, "activityIntent"

    invoke-virtual {p1, v0}, Landroid/os/Bundle;->getParcelable(Ljava/lang/String;)Landroid/os/Parcelable;

    move-result-object p1

    check-cast p1, Landroid/content/Intent;

    iput-object p1, p0, Lcom/motorola/ccc/ota/ui/BackgroundInstallationFragment;->activityIntent:Landroid/content/Intent;

    :cond_0
    iget-object p1, p0, Lcom/motorola/ccc/ota/ui/BackgroundInstallationFragment;->settings:Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    sget-object v0, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->METADATA:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    invoke-virtual {p1, v0}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->getString(Lcom/motorola/otalib/common/settings/ISetting;)Ljava/lang/String;

    move-result-object p1

    invoke-static {p1}, Lcom/motorola/otalib/common/metaData/builder/MetaDataBuilder;->from(Ljava/lang/String;)Lcom/motorola/otalib/common/metaData/MetaData;

    move-result-object p1

    iput-object p1, p0, Lcom/motorola/ccc/ota/ui/BackgroundInstallationFragment;->meta:Lcom/motorola/otalib/common/metaData/MetaData;

    iget-object p1, p0, Lcom/motorola/ccc/ota/ui/BackgroundInstallationFragment;->activityIntent:Landroid/content/Intent;

    invoke-static {p1}, Lcom/motorola/ccc/ota/ui/UpdaterUtils;->getUpgradeInfoDuringOTAUpdate(Landroid/content/Intent;)Lcom/motorola/ccc/ota/ui/UpdaterUtils$UpgradeInfo;

    move-result-object p1

    iput-object p1, p0, Lcom/motorola/ccc/ota/ui/BackgroundInstallationFragment;->info:Lcom/motorola/ccc/ota/ui/UpdaterUtils$UpgradeInfo;

    iget-object p1, p0, Lcom/motorola/ccc/ota/ui/BackgroundInstallationFragment;->meta:Lcom/motorola/otalib/common/metaData/MetaData;

    if-nez p1, :cond_1

    iget-object p1, p0, Lcom/motorola/ccc/ota/ui/BackgroundInstallationFragment;->activity:Landroid/app/Activity;

    invoke-virtual {p1}, Landroid/app/Activity;->finish()V

    goto :goto_0

    :cond_1
    invoke-virtual {p1}, Lcom/motorola/otalib/common/metaData/MetaData;->getUpdateTypeData()Ljava/lang/String;

    move-result-object p1

    invoke-static {p1}, Lcom/motorola/ccc/ota/ui/updateType/UpdateType;->getUpdateType(Ljava/lang/String;)Lcom/motorola/ccc/ota/ui/updateType/UpdateType$UpdateTypeInterface;

    move-result-object p1

    iput-object p1, p0, Lcom/motorola/ccc/ota/ui/BackgroundInstallationFragment;->mUpdateTypeInterface:Lcom/motorola/ccc/ota/ui/updateType/UpdateType$UpdateTypeInterface;

    :goto_0
    iget-object p0, p0, Lcom/motorola/ccc/ota/ui/BackgroundInstallationFragment;->context:Landroid/content/Context;

    invoke-static {p0}, Lcom/motorola/ccc/ota/ui/UpdaterUtils;->stopWarningAlertDialog(Landroid/content/Context;)V

    return-void
.end method

.method public onCreateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;Landroid/os/Bundle;)Landroid/view/View;
    .locals 1

    const p3, 0x7f0c001f

    const/4 v0, 0x0

    invoke-virtual {p1, p3, p2, v0}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object p1

    iput-object p1, p0, Lcom/motorola/ccc/ota/ui/BackgroundInstallationFragment;->rootView:Landroid/view/View;

    invoke-direct {p0}, Lcom/motorola/ccc/ota/ui/BackgroundInstallationFragment;->findViewsById()V

    invoke-direct {p0}, Lcom/motorola/ccc/ota/ui/BackgroundInstallationFragment;->initializeCommonLayout()V

    invoke-direct {p0}, Lcom/motorola/ccc/ota/ui/BackgroundInstallationFragment;->handleButtons()V

    iget-object p1, p0, Lcom/motorola/ccc/ota/ui/BackgroundInstallationFragment;->activityIntent:Landroid/content/Intent;

    invoke-direct {p0, p1}, Lcom/motorola/ccc/ota/ui/BackgroundInstallationFragment;->initializeCustomView(Landroid/content/Intent;)V

    iget-object p0, p0, Lcom/motorola/ccc/ota/ui/BackgroundInstallationFragment;->rootView:Landroid/view/View;

    return-object p0
.end method

.method public onDestroy()V
    .locals 3

    invoke-super {p0}, Landroidx/fragment/app/Fragment;->onDestroy()V

    :try_start_0
    iget-object v0, p0, Lcom/motorola/ccc/ota/ui/BackgroundInstallationFragment;->context:Landroid/content/Context;

    iget-object v1, p0, Lcom/motorola/ccc/ota/ui/BackgroundInstallationFragment;->mProgressReceiver:Landroid/content/BroadcastReceiver;

    invoke-virtual {v0, v1}, Landroid/content/Context;->unregisterReceiver(Landroid/content/BroadcastReceiver;)V
    :try_end_0
    .catch Ljava/lang/IllegalArgumentException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception v0

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "BGI Fragment:onDestroy:Receiver already unregistered:msg="

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    const-string v1, "OtaApp"

    invoke-static {v1, v0}, Lcom/motorola/ccc/ota/utils/Logger;->error(Ljava/lang/String;Ljava/lang/String;)V

    :goto_0
    iget-object v0, p0, Lcom/motorola/ccc/ota/ui/BackgroundInstallationFragment;->context:Landroid/content/Context;

    iget-object p0, p0, Lcom/motorola/ccc/ota/ui/BackgroundInstallationFragment;->mFinishReceiver:Landroid/content/BroadcastReceiver;

    invoke-static {v0, p0}, Lcom/motorola/otalib/common/utils/BroadcastUtils;->unregisterLocalReceiver(Landroid/content/Context;Landroid/content/BroadcastReceiver;)V

    return-void
.end method

.method public onResume()V
    .locals 2

    invoke-super {p0}, Landroidx/fragment/app/Fragment;->onResume()V

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v0

    iput-wide v0, p0, Lcom/motorola/ccc/ota/ui/BackgroundInstallationFragment;->launchTimeInMillis:J

    return-void
.end method

.method public onStop()V
    .locals 8

    invoke-super {p0}, Landroidx/fragment/app/Fragment;->onStop()V

    iget v0, p0, Lcom/motorola/ccc/ota/ui/BackgroundInstallationFragment;->mRetriedOrSuspend:I

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/motorola/ccc/ota/ui/BackgroundInstallationFragment;->meta:Lcom/motorola/otalib/common/metaData/MetaData;

    invoke-virtual {v0}, Lcom/motorola/otalib/common/metaData/MetaData;->getForceDownloadTime()D

    move-result-wide v0

    const-wide/16 v2, 0x0

    cmpl-double v0, v0, v2

    if-ltz v0, :cond_0

    invoke-static {}, Lcom/motorola/ccc/ota/ui/UpdaterUtils;->getAutomaticDownloadForCellular()Z

    move-result v0

    if-nez v0, :cond_0

    invoke-static {}, Lcom/motorola/ccc/ota/ui/UpdaterUtils;->checkForFinalDeferTimeForForceUpdate()Z

    move-result v0

    if-eqz v0, :cond_0

    new-instance v0, Landroid/content/Intent;

    const-string v1, "com.motorola.ccc.ota.RUN_STATE_MACHINE"

    invoke-direct {v0, v1}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    iget-object v1, p0, Lcom/motorola/ccc/ota/ui/BackgroundInstallationFragment;->context:Landroid/content/Context;

    const-string v2, "com.motorola.ccc.ota.Permissions.INTERACT_OTA_SERVICE"

    invoke-virtual {v1, v0, v2}, Landroid/content/Context;->sendBroadcast(Landroid/content/Intent;Ljava/lang/String;)V

    :cond_0
    iget-object v0, p0, Lcom/motorola/ccc/ota/ui/BackgroundInstallationFragment;->alertDialog:Landroidx/appcompat/app/AlertDialog;

    if-eqz v0, :cond_1

    invoke-virtual {v0}, Landroidx/appcompat/app/AlertDialog;->dismiss()V

    :cond_1
    iget-object v0, p0, Lcom/motorola/ccc/ota/ui/BackgroundInstallationFragment;->settings:Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    sget-object v1, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->TOTAL_TIME_SPEND_ON_BG_SCREEN:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    iget-object v2, p0, Lcom/motorola/ccc/ota/ui/BackgroundInstallationFragment;->settings:Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    sget-object v3, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->TOTAL_TIME_SPEND_ON_BG_SCREEN:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    const-wide/16 v4, 0x0

    invoke-virtual {v2, v3, v4, v5}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->getLong(Lcom/motorola/otalib/common/settings/ISetting;J)J

    move-result-wide v2

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v4

    iget-wide v6, p0, Lcom/motorola/ccc/ota/ui/BackgroundInstallationFragment;->launchTimeInMillis:J

    sub-long/2addr v4, v6

    add-long/2addr v2, v4

    invoke-virtual {v0, v1, v2, v3}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->setLong(Lcom/motorola/otalib/common/settings/ISetting;J)V

    return-void
.end method
