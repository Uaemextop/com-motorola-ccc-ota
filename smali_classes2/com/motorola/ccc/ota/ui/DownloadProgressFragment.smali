.class public Lcom/motorola/ccc/ota/ui/DownloadProgressFragment;
.super Landroidx/fragment/app/Fragment;
.source "DownloadProgressFragment.java"


# static fields
.field private static DEFAULT_RETRY_OR_SUSPEND_VALUE:I = -0x2


# instance fields
.field private activity:Landroid/app/Activity;

.field private activityIntent:Landroid/content/Intent;

.field private alertDialog:Landroidx/appcompat/app/AlertDialog;

.field private context:Landroid/content/Context;

.field private imgBack:Landroid/widget/ImageView;

.field private launchTimeInMillis:J

.field private mCancel:Landroid/widget/Button;

.field private mDataChargeWarningMessage:Landroid/widget/TextView;

.field private mDlCellularResume:Landroid/widget/Button;

.field private mDlPauseButtons:Landroid/widget/LinearLayout;

.field private mDlPauseCancel:Landroid/widget/Button;

.field private mDlPauseOkay:Landroid/widget/Button;

.field private mDlProgressButtons:Landroid/widget/LinearLayout;

.field private mDlProgressMessage:Landroid/widget/TextView;

.field private mDlWifiSettings:Landroid/widget/Button;

.field private mDownloadProgressStatus:Landroid/widget/TextView;

.field private mDownloadTimeleft:Landroid/widget/TextView;

.field private mDownloadpausedMsg:Landroid/widget/TextView;

.field private mExpTitle:Landroid/widget/TextView;

.field private mExpandableListView:Landroid/widget/ExpandableListView;

.field private mFinishReceiver:Landroid/content/BroadcastReceiver;

.field private mMeta:Lcom/motorola/otalib/common/metaData/MetaData;

.field private mOkay:Landroid/widget/Button;

.field private mPercentage:Landroid/widget/TextView;

.field private mProgressBar:Landroid/widget/ProgressBar;

.field private mProgressReceiver:Landroid/content/BroadcastReceiver;

.field private mRetriedOrSuspend:I

.field private mUpdateTypeInterface:Lcom/motorola/ccc/ota/ui/updateType/UpdateType$UpdateTypeInterface;

.field private mVersion:Landroid/widget/TextView;

.field private osReleaseNotes:Landroid/widget/TextView;

.field private rootView:Landroid/view/View;

.field private settings:Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;


# direct methods
.method static bridge synthetic -$$Nest$fgetactivity(Lcom/motorola/ccc/ota/ui/DownloadProgressFragment;)Landroid/app/Activity;
    .locals 0

    iget-object p0, p0, Lcom/motorola/ccc/ota/ui/DownloadProgressFragment;->activity:Landroid/app/Activity;

    return-object p0
.end method

.method static bridge synthetic -$$Nest$fgetcontext(Lcom/motorola/ccc/ota/ui/DownloadProgressFragment;)Landroid/content/Context;
    .locals 0

    iget-object p0, p0, Lcom/motorola/ccc/ota/ui/DownloadProgressFragment;->context:Landroid/content/Context;

    return-object p0
.end method

.method static bridge synthetic -$$Nest$fgetmDataChargeWarningMessage(Lcom/motorola/ccc/ota/ui/DownloadProgressFragment;)Landroid/widget/TextView;
    .locals 0

    iget-object p0, p0, Lcom/motorola/ccc/ota/ui/DownloadProgressFragment;->mDataChargeWarningMessage:Landroid/widget/TextView;

    return-object p0
.end method

.method static bridge synthetic -$$Nest$fgetmDlCellularResume(Lcom/motorola/ccc/ota/ui/DownloadProgressFragment;)Landroid/widget/Button;
    .locals 0

    iget-object p0, p0, Lcom/motorola/ccc/ota/ui/DownloadProgressFragment;->mDlCellularResume:Landroid/widget/Button;

    return-object p0
.end method

.method static bridge synthetic -$$Nest$maddCancelConfirmDialog(Lcom/motorola/ccc/ota/ui/DownloadProgressFragment;Landroid/content/Context;)V
    .locals 0

    invoke-direct {p0, p1}, Lcom/motorola/ccc/ota/ui/DownloadProgressFragment;->addCancelConfirmDialog(Landroid/content/Context;)V

    return-void
.end method

.method static bridge synthetic -$$Nest$mupdateUI(Lcom/motorola/ccc/ota/ui/DownloadProgressFragment;Landroid/content/Intent;)V
    .locals 0

    invoke-direct {p0, p1}, Lcom/motorola/ccc/ota/ui/DownloadProgressFragment;->updateUI(Landroid/content/Intent;)V

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

    iput-object v0, p0, Lcom/motorola/ccc/ota/ui/DownloadProgressFragment;->mUpdateTypeInterface:Lcom/motorola/ccc/ota/ui/updateType/UpdateType$UpdateTypeInterface;

    new-instance v0, Lcom/motorola/ccc/ota/ui/DownloadProgressFragment$8;

    invoke-direct {v0, p0}, Lcom/motorola/ccc/ota/ui/DownloadProgressFragment$8;-><init>(Lcom/motorola/ccc/ota/ui/DownloadProgressFragment;)V

    iput-object v0, p0, Lcom/motorola/ccc/ota/ui/DownloadProgressFragment;->mFinishReceiver:Landroid/content/BroadcastReceiver;

    new-instance v0, Lcom/motorola/ccc/ota/ui/DownloadProgressFragment$9;

    invoke-direct {v0, p0}, Lcom/motorola/ccc/ota/ui/DownloadProgressFragment$9;-><init>(Lcom/motorola/ccc/ota/ui/DownloadProgressFragment;)V

    iput-object v0, p0, Lcom/motorola/ccc/ota/ui/DownloadProgressFragment;->mProgressReceiver:Landroid/content/BroadcastReceiver;

    return-void
.end method

.method private addCancelConfirmDialog(Landroid/content/Context;)V
    .locals 5

    new-instance v0, Landroidx/appcompat/app/AlertDialog$Builder;

    invoke-direct {v0, p1}, Landroidx/appcompat/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    invoke-virtual {p0}, Lcom/motorola/ccc/ota/ui/DownloadProgressFragment;->getLayoutInflater()Landroid/view/LayoutInflater;

    move-result-object v1

    const v2, 0x7f0c0022

    const/4 v3, 0x0

    invoke-virtual {v1, v2, v3}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroidx/appcompat/app/AlertDialog$Builder;->setView(Landroid/view/View;)Landroidx/appcompat/app/AlertDialog$Builder;

    invoke-virtual {v0}, Landroidx/appcompat/app/AlertDialog$Builder;->create()Landroidx/appcompat/app/AlertDialog;

    move-result-object v0

    iput-object v0, p0, Lcom/motorola/ccc/ota/ui/DownloadProgressFragment;->alertDialog:Landroidx/appcompat/app/AlertDialog;

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

    new-instance v2, Lcom/motorola/ccc/ota/ui/DownloadProgressFragment$$ExternalSyntheticLambda0;

    invoke-direct {v2, p0}, Lcom/motorola/ccc/ota/ui/DownloadProgressFragment$$ExternalSyntheticLambda0;-><init>(Lcom/motorola/ccc/ota/ui/DownloadProgressFragment;)V

    invoke-virtual {v0, v2}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    new-instance v0, Lcom/motorola/ccc/ota/ui/DownloadProgressFragment$$ExternalSyntheticLambda1;

    invoke-direct {v0, p1}, Lcom/motorola/ccc/ota/ui/DownloadProgressFragment$$ExternalSyntheticLambda1;-><init>(Landroid/content/Context;)V

    invoke-virtual {v1, v0}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    iget-object v0, p0, Lcom/motorola/ccc/ota/ui/DownloadProgressFragment;->alertDialog:Landroidx/appcompat/app/AlertDialog;

    invoke-virtual {v0}, Landroidx/appcompat/app/AlertDialog;->create()V

    iget-object v0, p0, Lcom/motorola/ccc/ota/ui/DownloadProgressFragment;->alertDialog:Landroidx/appcompat/app/AlertDialog;

    invoke-static {p1, v0}, Lcom/motorola/ccc/ota/ui/UpdaterUtils;->setCornersRounded(Landroid/content/Context;Landroidx/appcompat/app/AlertDialog;)V

    iget-object p0, p0, Lcom/motorola/ccc/ota/ui/DownloadProgressFragment;->alertDialog:Landroidx/appcompat/app/AlertDialog;

    invoke-virtual {p0}, Landroidx/appcompat/app/AlertDialog;->show()V

    return-void
.end method

.method private findViewsById()V
    .locals 2

    iget-object v0, p0, Lcom/motorola/ccc/ota/ui/DownloadProgressFragment;->rootView:Landroid/view/View;

    const v1, 0x7f0900a5

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p0, Lcom/motorola/ccc/ota/ui/DownloadProgressFragment;->mVersion:Landroid/widget/TextView;

    iget-object v0, p0, Lcom/motorola/ccc/ota/ui/DownloadProgressFragment;->rootView:Landroid/view/View;

    const v1, 0x7f0900a0

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p0, Lcom/motorola/ccc/ota/ui/DownloadProgressFragment;->mDlProgressMessage:Landroid/widget/TextView;

    iget-object v0, p0, Lcom/motorola/ccc/ota/ui/DownloadProgressFragment;->rootView:Landroid/view/View;

    const v1, 0x7f0901e7

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p0, Lcom/motorola/ccc/ota/ui/DownloadProgressFragment;->mPercentage:Landroid/widget/TextView;

    iget-object v0, p0, Lcom/motorola/ccc/ota/ui/DownloadProgressFragment;->rootView:Landroid/view/View;

    const v1, 0x7f0900a1

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p0, Lcom/motorola/ccc/ota/ui/DownloadProgressFragment;->mDownloadProgressStatus:Landroid/widget/TextView;

    iget-object v0, p0, Lcom/motorola/ccc/ota/ui/DownloadProgressFragment;->rootView:Landroid/view/View;

    const v1, 0x7f0900a4

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p0, Lcom/motorola/ccc/ota/ui/DownloadProgressFragment;->mDownloadTimeleft:Landroid/widget/TextView;

    iget-object v0, p0, Lcom/motorola/ccc/ota/ui/DownloadProgressFragment;->rootView:Landroid/view/View;

    const v1, 0x7f09012f

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/ProgressBar;

    iput-object v0, p0, Lcom/motorola/ccc/ota/ui/DownloadProgressFragment;->mProgressBar:Landroid/widget/ProgressBar;

    iget-object v0, p0, Lcom/motorola/ccc/ota/ui/DownloadProgressFragment;->rootView:Landroid/view/View;

    const v1, 0x7f0900b7

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p0, Lcom/motorola/ccc/ota/ui/DownloadProgressFragment;->mExpTitle:Landroid/widget/TextView;

    iget-object v0, p0, Lcom/motorola/ccc/ota/ui/DownloadProgressFragment;->rootView:Landroid/view/View;

    const v1, 0x7f0900b9

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/ExpandableListView;

    iput-object v0, p0, Lcom/motorola/ccc/ota/ui/DownloadProgressFragment;->mExpandableListView:Landroid/widget/ExpandableListView;

    iget-object v0, p0, Lcom/motorola/ccc/ota/ui/DownloadProgressFragment;->rootView:Landroid/view/View;

    const v1, 0x7f090116

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p0, Lcom/motorola/ccc/ota/ui/DownloadProgressFragment;->osReleaseNotes:Landroid/widget/TextView;

    iget-object v0, p0, Lcom/motorola/ccc/ota/ui/DownloadProgressFragment;->rootView:Landroid/view/View;

    const v1, 0x7f090095

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p0, Lcom/motorola/ccc/ota/ui/DownloadProgressFragment;->mDataChargeWarningMessage:Landroid/widget/TextView;

    iget-object v0, p0, Lcom/motorola/ccc/ota/ui/DownloadProgressFragment;->rootView:Landroid/view/View;

    const v1, 0x7f09009e

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p0, Lcom/motorola/ccc/ota/ui/DownloadProgressFragment;->mDownloadpausedMsg:Landroid/widget/TextView;

    iget-object v0, p0, Lcom/motorola/ccc/ota/ui/DownloadProgressFragment;->rootView:Landroid/view/View;

    const v1, 0x7f09009d

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/LinearLayout;

    iput-object v0, p0, Lcom/motorola/ccc/ota/ui/DownloadProgressFragment;->mDlPauseButtons:Landroid/widget/LinearLayout;

    iget-object v0, p0, Lcom/motorola/ccc/ota/ui/DownloadProgressFragment;->rootView:Landroid/view/View;

    const v1, 0x7f090099

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/Button;

    iput-object v0, p0, Lcom/motorola/ccc/ota/ui/DownloadProgressFragment;->mDlWifiSettings:Landroid/widget/Button;

    iget-object v0, p0, Lcom/motorola/ccc/ota/ui/DownloadProgressFragment;->rootView:Landroid/view/View;

    const v1, 0x7f090097

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/Button;

    iput-object v0, p0, Lcom/motorola/ccc/ota/ui/DownloadProgressFragment;->mDlPauseCancel:Landroid/widget/Button;

    iget-object v0, p0, Lcom/motorola/ccc/ota/ui/DownloadProgressFragment;->rootView:Landroid/view/View;

    const v1, 0x7f090094

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/Button;

    iput-object v0, p0, Lcom/motorola/ccc/ota/ui/DownloadProgressFragment;->mDlCellularResume:Landroid/widget/Button;

    iget-object v0, p0, Lcom/motorola/ccc/ota/ui/DownloadProgressFragment;->rootView:Landroid/view/View;

    const v1, 0x7f090098

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/Button;

    iput-object v0, p0, Lcom/motorola/ccc/ota/ui/DownloadProgressFragment;->mDlPauseOkay:Landroid/widget/Button;

    iget-object v0, p0, Lcom/motorola/ccc/ota/ui/DownloadProgressFragment;->rootView:Landroid/view/View;

    const v1, 0x7f09009f

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/LinearLayout;

    iput-object v0, p0, Lcom/motorola/ccc/ota/ui/DownloadProgressFragment;->mDlProgressButtons:Landroid/widget/LinearLayout;

    iget-object v0, p0, Lcom/motorola/ccc/ota/ui/DownloadProgressFragment;->rootView:Landroid/view/View;

    const v1, 0x7f090093

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/Button;

    iput-object v0, p0, Lcom/motorola/ccc/ota/ui/DownloadProgressFragment;->mCancel:Landroid/widget/Button;

    iget-object v0, p0, Lcom/motorola/ccc/ota/ui/DownloadProgressFragment;->rootView:Landroid/view/View;

    const v1, 0x7f090096

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/Button;

    iput-object v0, p0, Lcom/motorola/ccc/ota/ui/DownloadProgressFragment;->mOkay:Landroid/widget/Button;

    iget-object v0, p0, Lcom/motorola/ccc/ota/ui/DownloadProgressFragment;->rootView:Landroid/view/View;

    const v1, 0x7f0900e0

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/ImageView;

    iput-object v0, p0, Lcom/motorola/ccc/ota/ui/DownloadProgressFragment;->imgBack:Landroid/widget/ImageView;

    return-void
.end method

.method private getDownloadPercentage(JJ)I
    .locals 2

    const-wide/16 v0, 0x64

    mul-long/2addr p3, v0

    :try_start_0
    div-long/2addr p3, p1
    :try_end_0
    .catch Ljava/lang/ArithmeticException; {:try_start_0 .. :try_end_0} :catch_0

    long-to-int p0, p3

    return p0

    :catch_0
    const-string p0, "OtaApp"

    const-string p1, "Exception occured while calculating downloading percentage."

    invoke-static {p0, p1}, Lcom/motorola/ccc/ota/utils/Logger;->error(Ljava/lang/String;Ljava/lang/String;)V

    const/4 p0, 0x0

    return p0
.end method

.method private handleButtons()V
    .locals 2

    iget-object v0, p0, Lcom/motorola/ccc/ota/ui/DownloadProgressFragment;->mOkay:Landroid/widget/Button;

    new-instance v1, Lcom/motorola/ccc/ota/ui/DownloadProgressFragment$1;

    invoke-direct {v1, p0}, Lcom/motorola/ccc/ota/ui/DownloadProgressFragment$1;-><init>(Lcom/motorola/ccc/ota/ui/DownloadProgressFragment;)V

    invoke-virtual {v0, v1}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    iget-object v0, p0, Lcom/motorola/ccc/ota/ui/DownloadProgressFragment;->mDlPauseOkay:Landroid/widget/Button;

    new-instance v1, Lcom/motorola/ccc/ota/ui/DownloadProgressFragment$2;

    invoke-direct {v1, p0}, Lcom/motorola/ccc/ota/ui/DownloadProgressFragment$2;-><init>(Lcom/motorola/ccc/ota/ui/DownloadProgressFragment;)V

    invoke-virtual {v0, v1}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    iget-object v0, p0, Lcom/motorola/ccc/ota/ui/DownloadProgressFragment;->mCancel:Landroid/widget/Button;

    new-instance v1, Lcom/motorola/ccc/ota/ui/DownloadProgressFragment$3;

    invoke-direct {v1, p0}, Lcom/motorola/ccc/ota/ui/DownloadProgressFragment$3;-><init>(Lcom/motorola/ccc/ota/ui/DownloadProgressFragment;)V

    invoke-virtual {v0, v1}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    iget-object v0, p0, Lcom/motorola/ccc/ota/ui/DownloadProgressFragment;->mDlCellularResume:Landroid/widget/Button;

    new-instance v1, Lcom/motorola/ccc/ota/ui/DownloadProgressFragment$4;

    invoke-direct {v1, p0}, Lcom/motorola/ccc/ota/ui/DownloadProgressFragment$4;-><init>(Lcom/motorola/ccc/ota/ui/DownloadProgressFragment;)V

    invoke-virtual {v0, v1}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    iget-object v0, p0, Lcom/motorola/ccc/ota/ui/DownloadProgressFragment;->mDlWifiSettings:Landroid/widget/Button;

    new-instance v1, Lcom/motorola/ccc/ota/ui/DownloadProgressFragment$5;

    invoke-direct {v1, p0}, Lcom/motorola/ccc/ota/ui/DownloadProgressFragment$5;-><init>(Lcom/motorola/ccc/ota/ui/DownloadProgressFragment;)V

    invoke-virtual {v0, v1}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    iget-object v0, p0, Lcom/motorola/ccc/ota/ui/DownloadProgressFragment;->mDlPauseCancel:Landroid/widget/Button;

    new-instance v1, Lcom/motorola/ccc/ota/ui/DownloadProgressFragment$6;

    invoke-direct {v1, p0}, Lcom/motorola/ccc/ota/ui/DownloadProgressFragment$6;-><init>(Lcom/motorola/ccc/ota/ui/DownloadProgressFragment;)V

    invoke-virtual {v0, v1}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    iget-object v0, p0, Lcom/motorola/ccc/ota/ui/DownloadProgressFragment;->imgBack:Landroid/widget/ImageView;

    new-instance v1, Lcom/motorola/ccc/ota/ui/DownloadProgressFragment$7;

    invoke-direct {v1, p0}, Lcom/motorola/ccc/ota/ui/DownloadProgressFragment$7;-><init>(Lcom/motorola/ccc/ota/ui/DownloadProgressFragment;)V

    invoke-virtual {v0, v1}, Landroid/widget/ImageView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    return-void
.end method

.method static synthetic lambda$addCancelConfirmDialog$1(Landroid/content/Context;Landroid/view/View;)V
    .locals 0

    sget-object p1, Lcom/motorola/otalib/common/utils/UpgradeUtils$DownloadStatus;->STATUS_CANCEL:Lcom/motorola/otalib/common/utils/UpgradeUtils$DownloadStatus;

    invoke-static {p0, p1}, Lcom/motorola/ccc/ota/utils/UpgradeUtilMethods;->sendDownloadNotificationResponse(Landroid/content/Context;Lcom/motorola/otalib/common/utils/UpgradeUtils$DownloadStatus;)V

    return-void
.end method

.method private updateUI(Landroid/content/Intent;)V
    .locals 20

    move-object/from16 v0, p0

    move-object/from16 v1, p1

    const-string v2, "com.motorola.blur.service.blur.upgrade.download.deferred"

    sget v3, Lcom/motorola/ccc/ota/ui/DownloadProgressFragment;->DEFAULT_RETRY_OR_SUSPEND_VALUE:I

    invoke-virtual {v1, v2, v3}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I

    move-result v2

    iput v2, v0, Lcom/motorola/ccc/ota/ui/DownloadProgressFragment;->mRetriedOrSuspend:I

    const-string v2, "com.motorola.blur.service.blur.upgrade.bytes_total"

    const-wide/16 v3, 0x0

    invoke-virtual {v1, v2, v3, v4}, Landroid/content/Intent;->getLongExtra(Ljava/lang/String;J)J

    move-result-wide v2

    const-string v4, "com.motorola.blur.service.blur.upgrade.bytes_received"

    const-wide/16 v5, -0x1

    invoke-virtual {v1, v4, v5, v6}, Landroid/content/Intent;->getLongExtra(Ljava/lang/String;J)J

    move-result-wide v11

    const-string v4, "com.motorola.blur.service.blur.upgrade.location_type"

    invoke-virtual {v1, v4}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    invoke-static {}, Lcom/motorola/ccc/ota/ui/UpdaterUtils;->isWifiOnly()Z

    move-result v7

    iget v8, v0, Lcom/motorola/ccc/ota/ui/DownloadProgressFragment;->mRetriedOrSuspend:I

    sget v9, Lcom/motorola/ccc/ota/ui/DownloadProgressFragment;->DEFAULT_RETRY_OR_SUSPEND_VALUE:I

    const/4 v13, 0x0

    if-ne v8, v9, :cond_2

    iget-object v8, v0, Lcom/motorola/ccc/ota/ui/DownloadProgressFragment;->context:Landroid/content/Context;

    const-string v9, "connectivity"

    invoke-virtual {v8, v9}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Landroid/net/ConnectivityManager;

    invoke-static {v8}, Lcom/motorola/otalib/common/utils/NetworkUtils;->isNetWorkConnected(Landroid/net/ConnectivityManager;)Z

    move-result v8

    if-eqz v8, :cond_1

    iget-object v8, v0, Lcom/motorola/ccc/ota/ui/DownloadProgressFragment;->settings:Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    sget-object v9, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->BATTERY_LOW:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    invoke-virtual {v8, v9}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->getBoolean(Lcom/motorola/otalib/common/settings/ISetting;)Z

    move-result v8

    if-eqz v8, :cond_0

    goto :goto_0

    :cond_0
    iput v13, v0, Lcom/motorola/ccc/ota/ui/DownloadProgressFragment;->mRetriedOrSuspend:I

    goto :goto_1

    :cond_1
    :goto_0
    const/4 v8, -0x1

    iput v8, v0, Lcom/motorola/ccc/ota/ui/DownloadProgressFragment;->mRetriedOrSuspend:I

    :cond_2
    :goto_1
    iget-object v8, v0, Lcom/motorola/ccc/ota/ui/DownloadProgressFragment;->mDlProgressMessage:Landroid/widget/TextView;

    iget-object v9, v0, Lcom/motorola/ccc/ota/ui/DownloadProgressFragment;->context:Landroid/content/Context;

    invoke-virtual {v9}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v9

    const v10, 0x7f0e00cd

    invoke-virtual {v9, v10}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v8, v9}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    iget-object v8, v0, Lcom/motorola/ccc/ota/ui/DownloadProgressFragment;->settings:Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    sget-object v9, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->METADATA:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    invoke-virtual {v8, v9}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->getString(Lcom/motorola/otalib/common/settings/ISetting;)Ljava/lang/String;

    move-result-object v8

    invoke-static {v8}, Lcom/motorola/otalib/common/metaData/builder/MetaDataBuilder;->from(Ljava/lang/String;)Lcom/motorola/otalib/common/metaData/MetaData;

    move-result-object v8

    iput-object v8, v0, Lcom/motorola/ccc/ota/ui/DownloadProgressFragment;->mMeta:Lcom/motorola/otalib/common/metaData/MetaData;

    if-nez v8, :cond_3

    const-string v0, "OtaApp"

    const-string v1, "empty metadata, returning"

    invoke-static {v0, v1}, Lcom/motorola/ccc/ota/utils/Logger;->debug(Ljava/lang/String;Ljava/lang/String;)V

    return-void

    :cond_3
    invoke-virtual/range {p0 .. p0}, Lcom/motorola/ccc/ota/ui/DownloadProgressFragment;->getActivity()Landroidx/fragment/app/FragmentActivity;

    move-result-object v14

    if-eqz v14, :cond_17

    invoke-virtual/range {p0 .. p0}, Lcom/motorola/ccc/ota/ui/DownloadProgressFragment;->isAdded()Z

    move-result v8

    if-nez v8, :cond_4

    goto/16 :goto_8

    :cond_4
    invoke-direct {v0, v2, v3, v11, v12}, Lcom/motorola/ccc/ota/ui/DownloadProgressFragment;->getDownloadPercentage(JJ)I

    move-result v8

    invoke-virtual/range {p0 .. p0}, Lcom/motorola/ccc/ota/ui/DownloadProgressFragment;->getResources()Landroid/content/res/Resources;

    move-result-object v15

    invoke-static {}, Ljava/text/NumberFormat;->getPercentInstance()Ljava/text/NumberFormat;

    move-result-object v9

    int-to-double v5, v8

    const-wide/high16 v18, 0x4059000000000000L    # 100.0

    div-double v5, v5, v18

    invoke-virtual {v9, v5, v6}, Ljava/text/NumberFormat;->format(D)Ljava/lang/String;

    move-result-object v5

    iget v6, v0, Lcom/motorola/ccc/ota/ui/DownloadProgressFragment;->mRetriedOrSuspend:I

    const-string v10, "sdcard"

    const/16 v9, 0x8

    if-eqz v6, :cond_f

    iget-object v1, v0, Lcom/motorola/ccc/ota/ui/DownloadProgressFragment;->mDlProgressMessage:Landroid/widget/TextView;

    invoke-virtual {v1, v9}, Landroid/widget/TextView;->setVisibility(I)V

    iget-object v1, v0, Lcom/motorola/ccc/ota/ui/DownloadProgressFragment;->mDlProgressButtons:Landroid/widget/LinearLayout;

    invoke-virtual {v1, v9}, Landroid/widget/LinearLayout;->setVisibility(I)V

    iget-object v1, v0, Lcom/motorola/ccc/ota/ui/DownloadProgressFragment;->mDlPauseButtons:Landroid/widget/LinearLayout;

    invoke-virtual {v1, v13}, Landroid/widget/LinearLayout;->setVisibility(I)V

    iget-object v1, v0, Lcom/motorola/ccc/ota/ui/DownloadProgressFragment;->settings:Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    sget-object v5, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->SCREEN_ANIMATION_VIEW:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    const-string v6, "download_stop"

    invoke-virtual {v1, v5, v6}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->setString(Lcom/motorola/otalib/common/settings/ISetting;Ljava/lang/String;)V

    iget-object v1, v0, Lcom/motorola/ccc/ota/ui/DownloadProgressFragment;->mPercentage:Landroid/widget/TextView;

    invoke-static {v8}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v5

    filled-new-array {v5}, [Ljava/lang/Object;

    move-result-object v5

    const v6, 0x7f0e00cc

    invoke-virtual {v15, v6, v5}, Landroid/content/res/Resources;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v1, v5}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    iget-object v1, v0, Lcom/motorola/ccc/ota/ui/DownloadProgressFragment;->mProgressBar:Landroid/widget/ProgressBar;

    invoke-virtual {v1, v8}, Landroid/widget/ProgressBar;->setProgress(I)V

    invoke-static {}, Lcom/motorola/ccc/ota/ui/UpdaterUtils;->showCancelOption()Z

    move-result v1

    if-eqz v1, :cond_5

    invoke-virtual {v10, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_5

    iget-object v1, v0, Lcom/motorola/ccc/ota/ui/DownloadProgressFragment;->mDlPauseCancel:Landroid/widget/Button;

    invoke-virtual {v1, v13}, Landroid/widget/Button;->setVisibility(I)V

    :cond_5
    invoke-static {}, Lcom/motorola/ccc/ota/ui/UpdaterUtils;->isDeviceInDatasaverMode()Z

    move-result v1

    if-eqz v1, :cond_6

    const v1, 0x7f0e014e

    invoke-virtual {v15, v1}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v1

    goto/16 :goto_3

    :cond_6
    iget v1, v0, Lcom/motorola/ccc/ota/ui/DownloadProgressFragment;->mRetriedOrSuspend:I

    const/4 v5, 0x1

    if-ne v1, v5, :cond_7

    const v1, 0x7f0e014c

    invoke-virtual {v15, v1}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v1

    goto/16 :goto_3

    :cond_7
    iget-object v1, v0, Lcom/motorola/ccc/ota/ui/DownloadProgressFragment;->settings:Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    sget-object v5, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->BATTERY_LOW:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    invoke-virtual {v1, v5}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->getBoolean(Lcom/motorola/otalib/common/settings/ISetting;)Z

    move-result v1

    if-eqz v1, :cond_8

    const v1, 0x7f0e011f

    invoke-virtual {v15, v1}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v1

    iget-object v5, v0, Lcom/motorola/ccc/ota/ui/DownloadProgressFragment;->mDlWifiSettings:Landroid/widget/Button;

    invoke-virtual {v5, v9}, Landroid/widget/Button;->setVisibility(I)V

    goto/16 :goto_3

    :cond_8
    const v1, 0x7f0e0151

    if-eqz v7, :cond_9

    invoke-virtual {v15, v1}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v1

    iget-object v5, v0, Lcom/motorola/ccc/ota/ui/DownloadProgressFragment;->mDlWifiSettings:Landroid/widget/Button;

    invoke-virtual {v5, v13}, Landroid/widget/Button;->setVisibility(I)V

    goto/16 :goto_3

    :cond_9
    iget-object v5, v0, Lcom/motorola/ccc/ota/ui/DownloadProgressFragment;->mMeta:Lcom/motorola/otalib/common/metaData/MetaData;

    invoke-virtual {v5}, Lcom/motorola/otalib/common/metaData/MetaData;->getForceDownloadTime()D

    move-result-wide v5

    const-wide/16 v7, 0x0

    cmpl-double v5, v5, v7

    if-ltz v5, :cond_b

    invoke-static {}, Lcom/motorola/ccc/ota/ui/UpdaterUtils;->getAutomaticDownloadForCellular()Z

    move-result v5

    if-nez v5, :cond_b

    invoke-static {}, Lcom/motorola/ccc/ota/ui/UpdaterUtils;->checkForFinalDeferTimeForForceUpdate()Z

    move-result v5

    if-eqz v5, :cond_a

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v15, v1}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v5, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-static {}, Ljava/lang/System;->lineSeparator()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v1, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v5, v0, Lcom/motorola/ccc/ota/ui/DownloadProgressFragment;->context:Landroid/content/Context;

    invoke-static {}, Lcom/motorola/ccc/ota/ui/UpdaterUtils;->getMaxForceDownloadDeferTime()J

    move-result-wide v6

    invoke-static {v5, v6, v7}, Lcom/motorola/ccc/ota/utils/DateFormatUtils;->getCalendarString(Landroid/content/Context;J)Ljava/lang/String;

    move-result-object v5

    filled-new-array {v5}, [Ljava/lang/Object;

    move-result-object v5

    const v6, 0x7f0e004f

    invoke-virtual {v15, v6, v5}, Landroid/content/res/Resources;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v1, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    goto :goto_2

    :cond_a
    invoke-virtual {v15, v1}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v1

    :goto_2
    iget-object v5, v0, Lcom/motorola/ccc/ota/ui/DownloadProgressFragment;->mDataChargeWarningMessage:Landroid/widget/TextView;

    invoke-virtual {v5, v13}, Landroid/widget/TextView;->setVisibility(I)V

    iget-object v5, v0, Lcom/motorola/ccc/ota/ui/DownloadProgressFragment;->mDlCellularResume:Landroid/widget/Button;

    invoke-virtual {v5, v13}, Landroid/widget/Button;->setVisibility(I)V

    iget-object v5, v0, Lcom/motorola/ccc/ota/ui/DownloadProgressFragment;->mDlWifiSettings:Landroid/widget/Button;

    invoke-virtual {v5, v13}, Landroid/widget/Button;->setVisibility(I)V

    goto :goto_3

    :cond_b
    iget-object v1, v0, Lcom/motorola/ccc/ota/ui/DownloadProgressFragment;->context:Landroid/content/Context;

    invoke-static {v1}, Lcom/motorola/ccc/ota/ui/UpdaterUtils;->isDataNetworkRoaming(Landroid/content/Context;)Z

    move-result v1

    if-eqz v1, :cond_c

    const v1, 0x7f0e0150

    invoke-virtual {v15, v1}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v1

    goto :goto_3

    :cond_c
    invoke-static {}, Lcom/motorola/ccc/ota/ui/UpdaterUtils;->isAdminAPNEnabled()Z

    move-result v1

    if-eqz v1, :cond_d

    const v1, 0x7f0e014f

    invoke-virtual {v15, v1}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v1

    goto :goto_3

    :cond_d
    const v1, 0x7f0e014d

    invoke-virtual {v15, v1}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v1

    invoke-static {}, Lcom/motorola/ccc/ota/ui/UpdaterUtils;->getAutomaticDownloadForCellular()Z

    move-result v5

    if-nez v5, :cond_e

    iget-object v5, v0, Lcom/motorola/ccc/ota/ui/DownloadProgressFragment;->mDataChargeWarningMessage:Landroid/widget/TextView;

    invoke-virtual {v5, v13}, Landroid/widget/TextView;->setVisibility(I)V

    iget-object v5, v0, Lcom/motorola/ccc/ota/ui/DownloadProgressFragment;->mDlCellularResume:Landroid/widget/Button;

    invoke-virtual {v5, v13}, Landroid/widget/Button;->setVisibility(I)V

    :cond_e
    :goto_3
    iget-object v5, v0, Lcom/motorola/ccc/ota/ui/DownloadProgressFragment;->mDownloadpausedMsg:Landroid/widget/TextView;

    invoke-virtual {v5, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    iget-object v1, v0, Lcom/motorola/ccc/ota/ui/DownloadProgressFragment;->mDownloadpausedMsg:Landroid/widget/TextView;

    invoke-virtual {v1, v13}, Landroid/widget/TextView;->setVisibility(I)V

    goto/16 :goto_4

    :cond_f
    iget-object v6, v0, Lcom/motorola/ccc/ota/ui/DownloadProgressFragment;->mDlPauseButtons:Landroid/widget/LinearLayout;

    invoke-virtual {v6, v9}, Landroid/widget/LinearLayout;->setVisibility(I)V

    iget-object v6, v0, Lcom/motorola/ccc/ota/ui/DownloadProgressFragment;->mDlProgressButtons:Landroid/widget/LinearLayout;

    invoke-virtual {v6, v13}, Landroid/widget/LinearLayout;->setVisibility(I)V

    iget-object v6, v0, Lcom/motorola/ccc/ota/ui/DownloadProgressFragment;->mDownloadpausedMsg:Landroid/widget/TextView;

    invoke-virtual {v6, v9}, Landroid/widget/TextView;->setVisibility(I)V

    iget-object v6, v0, Lcom/motorola/ccc/ota/ui/DownloadProgressFragment;->mDlProgressMessage:Landroid/widget/TextView;

    invoke-virtual {v6, v13}, Landroid/widget/TextView;->setVisibility(I)V

    iget-object v6, v0, Lcom/motorola/ccc/ota/ui/DownloadProgressFragment;->settings:Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    sget-object v7, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->SCREEN_ANIMATION_VIEW:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    invoke-virtual {v6, v7}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->getString(Lcom/motorola/otalib/common/settings/ISetting;)Ljava/lang/String;

    move-result-object v6

    if-eqz v6, :cond_10

    const-string v7, "downloading"

    invoke-virtual {v6, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-nez v6, :cond_10

    iget-object v6, v0, Lcom/motorola/ccc/ota/ui/DownloadProgressFragment;->settings:Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    sget-object v9, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->SCREEN_ANIMATION_VIEW:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    invoke-virtual {v6, v9, v7}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->setString(Lcom/motorola/otalib/common/settings/ISetting;Ljava/lang/String;)V

    :cond_10
    invoke-static {}, Lcom/motorola/ccc/ota/ui/UpdaterUtils;->showCancelOption()Z

    move-result v6

    if-eqz v6, :cond_11

    invoke-virtual {v10, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-nez v6, :cond_11

    iget-object v6, v0, Lcom/motorola/ccc/ota/ui/DownloadProgressFragment;->mCancel:Landroid/widget/Button;

    invoke-virtual {v6, v13}, Landroid/widget/Button;->setVisibility(I)V

    :cond_11
    const-string v6, "com.motorola.blur.service.blur.Actions.UPGRADE_DOWNLOAD_STATUS"

    invoke-virtual/range {p1 .. p1}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v6, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_12

    iget-object v1, v0, Lcom/motorola/ccc/ota/ui/DownloadProgressFragment;->mPercentage:Landroid/widget/TextView;

    const/16 v9, 0x8

    invoke-virtual {v1, v9}, Landroid/widget/TextView;->setVisibility(I)V

    iget-object v1, v0, Lcom/motorola/ccc/ota/ui/DownloadProgressFragment;->mProgressBar:Landroid/widget/ProgressBar;

    invoke-virtual {v1, v9}, Landroid/widget/ProgressBar;->setVisibility(I)V

    goto :goto_4

    :cond_12
    const/16 v9, 0x8

    iget-object v1, v0, Lcom/motorola/ccc/ota/ui/DownloadProgressFragment;->mPercentage:Landroid/widget/TextView;

    invoke-virtual {v1, v13}, Landroid/widget/TextView;->setVisibility(I)V

    iget-object v1, v0, Lcom/motorola/ccc/ota/ui/DownloadProgressFragment;->mProgressBar:Landroid/widget/ProgressBar;

    invoke-virtual {v1, v13}, Landroid/widget/ProgressBar;->setVisibility(I)V

    iget-object v1, v0, Lcom/motorola/ccc/ota/ui/DownloadProgressFragment;->mPercentage:Landroid/widget/TextView;

    const v6, 0x7f0e00d3

    filled-new-array {v5}, [Ljava/lang/Object;

    move-result-object v5

    invoke-virtual {v15, v6, v5}, Landroid/content/res/Resources;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v1, v5}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    iget-object v1, v0, Lcom/motorola/ccc/ota/ui/DownloadProgressFragment;->mProgressBar:Landroid/widget/ProgressBar;

    invoke-virtual {v1, v8}, Landroid/widget/ProgressBar;->setProgress(I)V

    :goto_4
    iget-object v1, v0, Lcom/motorola/ccc/ota/ui/DownloadProgressFragment;->settings:Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    sget-object v5, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->KEY_RECEIVED_BYTES:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    const-wide/16 v6, -0x1

    invoke-virtual {v1, v5, v6, v7}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->getLong(Lcom/motorola/otalib/common/settings/ISetting;J)J

    move-result-wide v16

    iget-object v1, v0, Lcom/motorola/ccc/ota/ui/DownloadProgressFragment;->settings:Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    sget-object v5, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->KEY_TIME_RECEIVED_BYTES:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    invoke-virtual {v1, v5, v6, v7}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->getLong(Lcom/motorola/otalib/common/settings/ISetting;J)J

    move-result-wide v5

    const/4 v1, 0x2

    new-array v1, v1, [J

    aput-wide v16, v1, v13

    const/4 v7, 0x1

    aput-wide v5, v1, v7

    move-wide v5, v2

    move-wide v7, v11

    move v13, v9

    move-object v9, v1

    move-object v1, v10

    move-object v10, v15

    invoke-static/range {v5 .. v10}, Lcom/motorola/ccc/ota/ui/UpdaterUtils;->getEstimatedTime(JJ[JLandroid/content/res/Resources;)Ljava/lang/String;

    move-result-object v5

    cmp-long v6, v2, v11

    if-nez v6, :cond_14

    const v1, 0x7f0e0152

    invoke-virtual {v15, v1}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v1

    new-instance v2, Landroid/os/Bundle;

    invoke-direct {v2}, Landroid/os/Bundle;-><init>()V

    invoke-static {}, Lcom/motorola/ccc/ota/utils/BuildPropReader;->isUEUpdateEnabled()Z

    move-result v3

    if-eqz v3, :cond_13

    sget-object v3, Lcom/motorola/otalib/common/utils/UpgradeUtils$Error;->ERR_BACKGROUND_INSTALL:Lcom/motorola/otalib/common/utils/UpgradeUtils$Error;

    invoke-virtual {v3}, Lcom/motorola/otalib/common/utils/UpgradeUtils$Error;->toString()Ljava/lang/String;

    move-result-object v3

    goto :goto_5

    :cond_13
    sget-object v3, Lcom/motorola/otalib/common/utils/UpgradeUtils$Error;->ERR_INSTALL:Lcom/motorola/otalib/common/utils/UpgradeUtils$Error;

    invoke-virtual {v3}, Lcom/motorola/otalib/common/utils/UpgradeUtils$Error;->toString()Ljava/lang/String;

    move-result-object v3

    :goto_5
    const-string v4, "com.motorola.blur.service.blur.upgrade.check_error"

    invoke-virtual {v2, v4, v3}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    check-cast v14, Lcom/motorola/ccc/ota/ui/FragmentActionListener;

    invoke-interface {v14, v2}, Lcom/motorola/ccc/ota/ui/FragmentActionListener;->onUpdateActionResponse(Landroid/os/Bundle;)V

    goto :goto_6

    :cond_14
    invoke-virtual {v1, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_15

    const v1, 0x7f0e0148

    invoke-virtual {v15, v1}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v1

    :goto_6
    const/4 v3, 0x0

    goto :goto_7

    :cond_15
    if-nez v5, :cond_16

    iget-object v1, v0, Lcom/motorola/ccc/ota/ui/DownloadProgressFragment;->mDownloadTimeleft:Landroid/widget/TextView;

    invoke-virtual {v1, v13}, Landroid/widget/TextView;->setVisibility(I)V

    const/4 v1, 0x0

    goto :goto_6

    :cond_16
    invoke-virtual/range {p0 .. p0}, Lcom/motorola/ccc/ota/ui/DownloadProgressFragment;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-static {v1, v11, v12}, Landroid/text/format/Formatter;->formatFileSize(Landroid/content/Context;J)Ljava/lang/String;

    move-result-object v1

    invoke-virtual/range {p0 .. p0}, Lcom/motorola/ccc/ota/ui/DownloadProgressFragment;->getContext()Landroid/content/Context;

    move-result-object v4

    invoke-static {v4, v2, v3}, Landroid/text/format/Formatter;->formatFileSize(Landroid/content/Context;J)Ljava/lang/String;

    move-result-object v2

    filled-new-array {v1, v2}, [Ljava/lang/Object;

    move-result-object v1

    const v2, 0x7f0e00ca

    invoke-virtual {v15, v2, v1}, Landroid/content/res/Resources;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    const v2, 0x7f0e00d0

    filled-new-array {v5}, [Ljava/lang/Object;

    move-result-object v3

    invoke-virtual {v15, v2, v3}, Landroid/content/res/Resources;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    iget-object v3, v0, Lcom/motorola/ccc/ota/ui/DownloadProgressFragment;->mDownloadTimeleft:Landroid/widget/TextView;

    invoke-virtual {v3, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    iget-object v2, v0, Lcom/motorola/ccc/ota/ui/DownloadProgressFragment;->mDownloadTimeleft:Landroid/widget/TextView;

    const/4 v3, 0x0

    invoke-virtual {v2, v3}, Landroid/widget/TextView;->setVisibility(I)V

    :goto_7
    iget-object v2, v0, Lcom/motorola/ccc/ota/ui/DownloadProgressFragment;->mDownloadProgressStatus:Landroid/widget/TextView;

    invoke-virtual {v2, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    iget-object v0, v0, Lcom/motorola/ccc/ota/ui/DownloadProgressFragment;->mDownloadProgressStatus:Landroid/widget/TextView;

    invoke-virtual {v0, v3}, Landroid/widget/TextView;->setVisibility(I)V

    :cond_17
    :goto_8
    return-void
.end method


# virtual methods
.method synthetic lambda$addCancelConfirmDialog$0$com-motorola-ccc-ota-ui-DownloadProgressFragment(Landroid/view/View;)V
    .locals 0

    iget-object p0, p0, Lcom/motorola/ccc/ota/ui/DownloadProgressFragment;->alertDialog:Landroidx/appcompat/app/AlertDialog;

    invoke-virtual {p0}, Landroidx/appcompat/app/AlertDialog;->dismiss()V

    return-void
.end method

.method public onAttach(Landroid/content/Context;)V
    .locals 1

    invoke-super {p0, p1}, Landroidx/fragment/app/Fragment;->onAttach(Landroid/content/Context;)V

    iput-object p1, p0, Lcom/motorola/ccc/ota/ui/DownloadProgressFragment;->context:Landroid/content/Context;

    instance-of v0, p1, Landroid/app/Activity;

    if-eqz v0, :cond_0

    check-cast p1, Landroid/app/Activity;

    iput-object p1, p0, Lcom/motorola/ccc/ota/ui/DownloadProgressFragment;->activity:Landroid/app/Activity;

    :cond_0
    return-void
.end method

.method public onCreate(Landroid/os/Bundle;)V
    .locals 3

    invoke-super {p0, p1}, Landroidx/fragment/app/Fragment;->onCreate(Landroid/os/Bundle;)V

    new-instance p1, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    invoke-direct {p1}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;-><init>()V

    iput-object p1, p0, Lcom/motorola/ccc/ota/ui/DownloadProgressFragment;->settings:Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    new-instance p1, Landroid/content/IntentFilter;

    invoke-direct {p1}, Landroid/content/IntentFilter;-><init>()V

    const-string v0, "com.motorola.ccc.ota.Actions.FINISH_DOWNLOAD_PROGRESS_ACTIVITY"

    invoke-virtual {p1, v0}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    iget-object v0, p0, Lcom/motorola/ccc/ota/ui/DownloadProgressFragment;->context:Landroid/content/Context;

    iget-object v1, p0, Lcom/motorola/ccc/ota/ui/DownloadProgressFragment;->mFinishReceiver:Landroid/content/BroadcastReceiver;

    invoke-static {v0, v1, p1}, Lcom/motorola/otalib/common/utils/BroadcastUtils;->registerLocalReceiver(Landroid/content/Context;Landroid/content/BroadcastReceiver;Landroid/content/IntentFilter;)V

    new-instance p1, Landroid/content/IntentFilter;

    invoke-direct {p1}, Landroid/content/IntentFilter;-><init>()V

    const-string v0, "com.motorola.blur.service.blur.Actions.UPGRADE_DOWNLOAD_STATUS"

    invoke-virtual {p1, v0}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    iget-object v0, p0, Lcom/motorola/ccc/ota/ui/DownloadProgressFragment;->context:Landroid/content/Context;

    iget-object v1, p0, Lcom/motorola/ccc/ota/ui/DownloadProgressFragment;->mProgressReceiver:Landroid/content/BroadcastReceiver;

    const/4 v2, 0x2

    invoke-virtual {v0, v1, p1, v2}, Landroid/content/Context;->registerReceiver(Landroid/content/BroadcastReceiver;Landroid/content/IntentFilter;I)Landroid/content/Intent;

    invoke-virtual {p0}, Lcom/motorola/ccc/ota/ui/DownloadProgressFragment;->getArguments()Landroid/os/Bundle;

    move-result-object p1

    if-eqz p1, :cond_0

    const-string v0, "activityIntent"

    invoke-virtual {p1, v0}, Landroid/os/Bundle;->getParcelable(Ljava/lang/String;)Landroid/os/Parcelable;

    move-result-object p1

    check-cast p1, Landroid/content/Intent;

    iput-object p1, p0, Lcom/motorola/ccc/ota/ui/DownloadProgressFragment;->activityIntent:Landroid/content/Intent;

    :cond_0
    iget-object p0, p0, Lcom/motorola/ccc/ota/ui/DownloadProgressFragment;->context:Landroid/content/Context;

    invoke-static {p0}, Lcom/motorola/ccc/ota/ui/UpdaterUtils;->stopWarningAlertDialog(Landroid/content/Context;)V

    return-void
.end method

.method public onCreateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;Landroid/os/Bundle;)Landroid/view/View;
    .locals 8

    const p3, 0x7f0c0035

    const/4 v0, 0x0

    invoke-virtual {p1, p3, p2, v0}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object p1

    iput-object p1, p0, Lcom/motorola/ccc/ota/ui/DownloadProgressFragment;->rootView:Landroid/view/View;

    invoke-direct {p0}, Lcom/motorola/ccc/ota/ui/DownloadProgressFragment;->findViewsById()V

    invoke-direct {p0}, Lcom/motorola/ccc/ota/ui/DownloadProgressFragment;->handleButtons()V

    iget-object p1, p0, Lcom/motorola/ccc/ota/ui/DownloadProgressFragment;->activityIntent:Landroid/content/Intent;

    invoke-static {p1}, Lcom/motorola/ccc/ota/ui/UpdaterUtils;->getUpgradeInfoDuringOTAUpdate(Landroid/content/Intent;)Lcom/motorola/ccc/ota/ui/UpdaterUtils$UpgradeInfo;

    move-result-object p1

    if-nez p1, :cond_0

    const-string p1, "OtaApp"

    const-string p2, "DownloadProgressFragment, No upgradeInfo found."

    invoke-static {p1, p2}, Lcom/motorola/ccc/ota/utils/Logger;->error(Ljava/lang/String;Ljava/lang/String;)V

    iget-object p0, p0, Lcom/motorola/ccc/ota/ui/DownloadProgressFragment;->activity:Landroid/app/Activity;

    invoke-virtual {p0}, Landroid/app/Activity;->finish()V

    const/4 p0, 0x0

    return-object p0

    :cond_0
    iget-object p2, p0, Lcom/motorola/ccc/ota/ui/DownloadProgressFragment;->mDataChargeWarningMessage:Landroid/widget/TextView;

    const p3, 0x7f0e00bc

    invoke-virtual {p0, p3}, Lcom/motorola/ccc/ota/ui/DownloadProgressFragment;->getString(I)Ljava/lang/String;

    move-result-object p3

    const-string v1, "\n"

    invoke-virtual {p3, v1}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object p3

    aget-object p3, p3, v0

    invoke-virtual {p2, p3}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    iget-object p2, p0, Lcom/motorola/ccc/ota/ui/DownloadProgressFragment;->settings:Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    sget-object p3, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->METADATA:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    invoke-virtual {p2, p3}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->getString(Lcom/motorola/otalib/common/settings/ISetting;)Ljava/lang/String;

    move-result-object p2

    invoke-static {p2}, Lcom/motorola/otalib/common/metaData/builder/MetaDataBuilder;->from(Ljava/lang/String;)Lcom/motorola/otalib/common/metaData/MetaData;

    move-result-object p2

    iput-object p2, p0, Lcom/motorola/ccc/ota/ui/DownloadProgressFragment;->mMeta:Lcom/motorola/otalib/common/metaData/MetaData;

    if-eqz p2, :cond_1

    invoke-virtual {p2}, Lcom/motorola/otalib/common/metaData/MetaData;->getUpdateTypeData()Ljava/lang/String;

    move-result-object p2

    invoke-static {p2}, Lcom/motorola/ccc/ota/ui/updateType/UpdateType;->getUpdateType(Ljava/lang/String;)Lcom/motorola/ccc/ota/ui/updateType/UpdateType$UpdateTypeInterface;

    move-result-object p2

    iput-object p2, p0, Lcom/motorola/ccc/ota/ui/DownloadProgressFragment;->mUpdateTypeInterface:Lcom/motorola/ccc/ota/ui/updateType/UpdateType$UpdateTypeInterface;

    iget-object p2, p0, Lcom/motorola/ccc/ota/ui/DownloadProgressFragment;->mVersion:Landroid/widget/TextView;

    invoke-virtual {p1}, Lcom/motorola/ccc/ota/ui/UpdaterUtils$UpgradeInfo;->getDisplayVersion()Ljava/lang/String;

    move-result-object p3

    invoke-virtual {p0}, Lcom/motorola/ccc/ota/ui/DownloadProgressFragment;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    invoke-virtual {p0}, Lcom/motorola/ccc/ota/ui/DownloadProgressFragment;->getContext()Landroid/content/Context;

    move-result-object v2

    invoke-virtual {p1}, Lcom/motorola/ccc/ota/ui/UpdaterUtils$UpgradeInfo;->getSize()J

    move-result-wide v3

    invoke-static {v2, v3, v4}, Landroid/text/format/Formatter;->formatFileSize(Landroid/content/Context;J)Ljava/lang/String;

    move-result-object v2

    filled-new-array {v2}, [Ljava/lang/Object;

    move-result-object v2

    const v3, 0x7f0e01cb

    invoke-virtual {v1, v3, v2}, Landroid/content/res/Resources;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    filled-new-array {p3, v1}, [Ljava/lang/Object;

    move-result-object p3

    const v1, 0x7f0e00d1

    invoke-virtual {p0, v1, p3}, Lcom/motorola/ccc/ota/ui/DownloadProgressFragment;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p3

    invoke-virtual {p2, p3}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    iget-object p2, p0, Lcom/motorola/ccc/ota/ui/DownloadProgressFragment;->settings:Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    sget-object p3, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->SCREEN_ANIMATION_VIEW:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    const-string v1, "downloading"

    invoke-virtual {p2, p3, v1}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->setString(Lcom/motorola/otalib/common/settings/ISetting;Ljava/lang/String;)V

    iget-object p2, p0, Lcom/motorola/ccc/ota/ui/DownloadProgressFragment;->rootView:Landroid/view/View;

    const p3, 0x7f090082

    invoke-virtual {p2, p3}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v7

    iget-object v1, p0, Lcom/motorola/ccc/ota/ui/DownloadProgressFragment;->mExpandableListView:Landroid/widget/ExpandableListView;

    invoke-virtual {p1}, Lcom/motorola/ccc/ota/ui/UpdaterUtils$UpgradeInfo;->hasReleaseNotes()Z

    move-result v2

    invoke-virtual {p1}, Lcom/motorola/ccc/ota/ui/UpdaterUtils$UpgradeInfo;->getReleaseNotes()Ljava/lang/String;

    move-result-object v3

    iget-object v4, p0, Lcom/motorola/ccc/ota/ui/DownloadProgressFragment;->mExpTitle:Landroid/widget/TextView;

    invoke-virtual {p0}, Lcom/motorola/ccc/ota/ui/DownloadProgressFragment;->getActivity()Landroidx/fragment/app/FragmentActivity;

    move-result-object v5

    iget-object v6, p0, Lcom/motorola/ccc/ota/ui/DownloadProgressFragment;->mUpdateTypeInterface:Lcom/motorola/ccc/ota/ui/updateType/UpdateType$UpdateTypeInterface;

    invoke-static/range {v1 .. v7}, Lcom/motorola/ccc/ota/ui/UpdaterUtils;->setExpandableList(Landroid/widget/ExpandableListView;ZLjava/lang/String;Landroid/widget/TextView;Landroid/content/Context;Lcom/motorola/ccc/ota/ui/updateType/UpdateType$UpdateTypeInterface;Landroid/view/View;)Landroid/widget/ExpandableListView;

    move-result-object p2

    iput-object p2, p0, Lcom/motorola/ccc/ota/ui/DownloadProgressFragment;->mExpandableListView:Landroid/widget/ExpandableListView;

    const-string p3, "DLProgress"

    invoke-static {p2, p3}, Lcom/motorola/ccc/ota/ui/UpdaterUtils;->handleExpList(Landroid/widget/ExpandableListView;Ljava/lang/String;)Landroid/widget/ExpandableListView;

    move-result-object p2

    iput-object p2, p0, Lcom/motorola/ccc/ota/ui/DownloadProgressFragment;->mExpandableListView:Landroid/widget/ExpandableListView;

    iget-object p2, p0, Lcom/motorola/ccc/ota/ui/DownloadProgressFragment;->context:Landroid/content/Context;

    iget-object v1, p0, Lcom/motorola/ccc/ota/ui/DownloadProgressFragment;->osReleaseNotes:Landroid/widget/TextView;

    invoke-static {p2, v1, p1, p3}, Lcom/motorola/ccc/ota/ui/UpdaterUtils;->setOsReleaseNotes(Landroid/content/Context;Landroid/widget/TextView;Lcom/motorola/ccc/ota/ui/UpdaterUtils$UpgradeInfo;Ljava/lang/String;)V

    iget-object p1, p0, Lcom/motorola/ccc/ota/ui/DownloadProgressFragment;->activity:Landroid/app/Activity;

    invoke-virtual {p1}, Landroid/app/Activity;->getWindow()Landroid/view/Window;

    move-result-object p1

    const/high16 p2, -0x80000000

    invoke-virtual {p1, p2}, Landroid/view/Window;->addFlags(I)V

    invoke-virtual {p1, v0}, Landroid/view/Window;->setStatusBarColor(I)V

    iget-object p2, p0, Lcom/motorola/ccc/ota/ui/DownloadProgressFragment;->context:Landroid/content/Context;

    invoke-static {p2}, Lcom/motorola/ccc/ota/ui/UpdaterUtils;->isBatterySaverEnabled(Landroid/content/Context;)Z

    move-result p2

    if-nez p2, :cond_1

    new-instance p2, Landroidx/core/view/WindowInsetsControllerCompat;

    invoke-virtual {p1}, Landroid/view/Window;->getDecorView()Landroid/view/View;

    move-result-object p3

    invoke-direct {p2, p1, p3}, Landroidx/core/view/WindowInsetsControllerCompat;-><init>(Landroid/view/Window;Landroid/view/View;)V

    iget-object p1, p0, Lcom/motorola/ccc/ota/ui/DownloadProgressFragment;->context:Landroid/content/Context;

    const-string p3, "uimode"

    invoke-virtual {p1, p3}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Landroid/app/UiModeManager;

    invoke-virtual {p1}, Landroid/app/UiModeManager;->getNightMode()I

    move-result p1

    const/4 p3, 0x2

    if-eq p1, p3, :cond_1

    const/4 p1, 0x1

    invoke-virtual {p2, p1}, Landroidx/core/view/WindowInsetsControllerCompat;->setAppearanceLightStatusBars(Z)V

    invoke-virtual {p2, p1}, Landroidx/core/view/WindowInsetsControllerCompat;->setAppearanceLightNavigationBars(Z)V

    :cond_1
    iget-object p1, p0, Lcom/motorola/ccc/ota/ui/DownloadProgressFragment;->activityIntent:Landroid/content/Intent;

    invoke-direct {p0, p1}, Lcom/motorola/ccc/ota/ui/DownloadProgressFragment;->updateUI(Landroid/content/Intent;)V

    iget-object p0, p0, Lcom/motorola/ccc/ota/ui/DownloadProgressFragment;->rootView:Landroid/view/View;

    return-object p0
.end method

.method public onDestroy()V
    .locals 2

    invoke-super {p0}, Landroidx/fragment/app/Fragment;->onDestroy()V

    iget-object v0, p0, Lcom/motorola/ccc/ota/ui/DownloadProgressFragment;->context:Landroid/content/Context;

    iget-object v1, p0, Lcom/motorola/ccc/ota/ui/DownloadProgressFragment;->mProgressReceiver:Landroid/content/BroadcastReceiver;

    invoke-virtual {v0, v1}, Landroid/content/Context;->unregisterReceiver(Landroid/content/BroadcastReceiver;)V

    iget-object v0, p0, Lcom/motorola/ccc/ota/ui/DownloadProgressFragment;->context:Landroid/content/Context;

    iget-object p0, p0, Lcom/motorola/ccc/ota/ui/DownloadProgressFragment;->mFinishReceiver:Landroid/content/BroadcastReceiver;

    invoke-static {v0, p0}, Lcom/motorola/otalib/common/utils/BroadcastUtils;->unregisterLocalReceiver(Landroid/content/Context;Landroid/content/BroadcastReceiver;)V

    return-void
.end method

.method public onResume()V
    .locals 2

    invoke-super {p0}, Landroidx/fragment/app/Fragment;->onResume()V

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v0

    iput-wide v0, p0, Lcom/motorola/ccc/ota/ui/DownloadProgressFragment;->launchTimeInMillis:J

    return-void
.end method

.method public onStop()V
    .locals 8

    invoke-super {p0}, Landroidx/fragment/app/Fragment;->onStop()V

    iget v0, p0, Lcom/motorola/ccc/ota/ui/DownloadProgressFragment;->mRetriedOrSuspend:I

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/motorola/ccc/ota/ui/DownloadProgressFragment;->mMeta:Lcom/motorola/otalib/common/metaData/MetaData;

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

    iget-object v1, p0, Lcom/motorola/ccc/ota/ui/DownloadProgressFragment;->context:Landroid/content/Context;

    const-string v2, "com.motorola.ccc.ota.Permissions.INTERACT_OTA_SERVICE"

    invoke-virtual {v1, v0, v2}, Landroid/content/Context;->sendBroadcast(Landroid/content/Intent;Ljava/lang/String;)V

    :cond_0
    iget-object v0, p0, Lcom/motorola/ccc/ota/ui/DownloadProgressFragment;->alertDialog:Landroidx/appcompat/app/AlertDialog;

    if-eqz v0, :cond_1

    invoke-virtual {v0}, Landroidx/appcompat/app/AlertDialog;->dismiss()V

    :cond_1
    iget-object v0, p0, Lcom/motorola/ccc/ota/ui/DownloadProgressFragment;->settings:Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    sget-object v1, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->TOTAL_TIME_SPEND_ON_DLP_SCREEN:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    iget-object v2, p0, Lcom/motorola/ccc/ota/ui/DownloadProgressFragment;->settings:Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    sget-object v3, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->TOTAL_TIME_SPEND_ON_DLP_SCREEN:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    const-wide/16 v4, 0x0

    invoke-virtual {v2, v3, v4, v5}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->getLong(Lcom/motorola/otalib/common/settings/ISetting;J)J

    move-result-wide v2

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v4

    iget-wide v6, p0, Lcom/motorola/ccc/ota/ui/DownloadProgressFragment;->launchTimeInMillis:J

    sub-long/2addr v4, v6

    add-long/2addr v2, v4

    invoke-virtual {v0, v1, v2, v3}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->setLong(Lcom/motorola/otalib/common/settings/ISetting;J)V

    return-void
.end method
