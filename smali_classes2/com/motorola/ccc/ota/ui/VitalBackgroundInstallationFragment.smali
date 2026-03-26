.class public Lcom/motorola/ccc/ota/ui/VitalBackgroundInstallationFragment;
.super Landroidx/fragment/app/Fragment;
.source "VitalBackgroundInstallationFragment.java"


# static fields
.field private static DEFAULT_RETRY_OR_SUSPEND_VALUE:I = -0x2

.field public static final EMERGENCY_DIALER:Ljava/lang/String; = "com.android.phone.EmergencyDialer.DIAL"


# instance fields
.field private activity:Landroid/app/Activity;

.field private activityIntent:Landroid/content/Intent;

.field private alertDialog:Landroidx/appcompat/app/AlertDialog;

.field private context:Landroid/content/Context;

.field private emergencyCall:Landroid/widget/Button;

.field private info:Lcom/motorola/ccc/ota/ui/UpdaterUtils$UpgradeInfo;

.field private launchTimeInMillis:J

.field private mBGText:Landroid/widget/TextView;

.field private mBGTitle:Landroid/widget/TextView;

.field private mFinishReceiver:Landroid/content/BroadcastReceiver;

.field private mNewVersion:Landroid/widget/TextView;

.field private mPercentage:Landroid/widget/TextView;

.field private mProgressReceiver:Landroid/content/BroadcastReceiver;

.field private mRetriedOrSuspend:I

.field private mSkip:Landroid/widget/Button;

.field private mSkipReason:Ljava/lang/String;

.field private mUpdateTypeInterface:Lcom/motorola/ccc/ota/ui/updateType/UpdateType$UpdateTypeInterface;

.field private meta:Lcom/motorola/otalib/common/metaData/MetaData;

.field private progressBar:Landroid/widget/ProgressBar;

.field private rootView:Landroid/view/View;

.field private settings:Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;


# direct methods
.method static bridge synthetic -$$Nest$fgetactivity(Lcom/motorola/ccc/ota/ui/VitalBackgroundInstallationFragment;)Landroid/app/Activity;
    .locals 0

    iget-object p0, p0, Lcom/motorola/ccc/ota/ui/VitalBackgroundInstallationFragment;->activity:Landroid/app/Activity;

    return-object p0
.end method

.method static bridge synthetic -$$Nest$fgetcontext(Lcom/motorola/ccc/ota/ui/VitalBackgroundInstallationFragment;)Landroid/content/Context;
    .locals 0

    iget-object p0, p0, Lcom/motorola/ccc/ota/ui/VitalBackgroundInstallationFragment;->context:Landroid/content/Context;

    return-object p0
.end method

.method static bridge synthetic -$$Nest$fgetmProgressReceiver(Lcom/motorola/ccc/ota/ui/VitalBackgroundInstallationFragment;)Landroid/content/BroadcastReceiver;
    .locals 0

    iget-object p0, p0, Lcom/motorola/ccc/ota/ui/VitalBackgroundInstallationFragment;->mProgressReceiver:Landroid/content/BroadcastReceiver;

    return-object p0
.end method

.method static bridge synthetic -$$Nest$fgetmSkipReason(Lcom/motorola/ccc/ota/ui/VitalBackgroundInstallationFragment;)Ljava/lang/String;
    .locals 0

    iget-object p0, p0, Lcom/motorola/ccc/ota/ui/VitalBackgroundInstallationFragment;->mSkipReason:Ljava/lang/String;

    return-object p0
.end method

.method static bridge synthetic -$$Nest$fgetsettings(Lcom/motorola/ccc/ota/ui/VitalBackgroundInstallationFragment;)Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;
    .locals 0

    iget-object p0, p0, Lcom/motorola/ccc/ota/ui/VitalBackgroundInstallationFragment;->settings:Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    return-object p0
.end method

.method static bridge synthetic -$$Nest$fputmSkipReason(Lcom/motorola/ccc/ota/ui/VitalBackgroundInstallationFragment;Ljava/lang/String;)V
    .locals 0

    iput-object p1, p0, Lcom/motorola/ccc/ota/ui/VitalBackgroundInstallationFragment;->mSkipReason:Ljava/lang/String;

    return-void
.end method

.method static bridge synthetic -$$Nest$maddCancelConfirmDialog(Lcom/motorola/ccc/ota/ui/VitalBackgroundInstallationFragment;Landroid/content/Context;)V
    .locals 0

    invoke-direct {p0, p1}, Lcom/motorola/ccc/ota/ui/VitalBackgroundInstallationFragment;->addCancelConfirmDialog(Landroid/content/Context;)V

    return-void
.end method

.method static bridge synthetic -$$Nest$minitializeCustomView(Lcom/motorola/ccc/ota/ui/VitalBackgroundInstallationFragment;Landroid/content/Intent;)V
    .locals 0

    invoke-direct {p0, p1}, Lcom/motorola/ccc/ota/ui/VitalBackgroundInstallationFragment;->initializeCustomView(Landroid/content/Intent;)V

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

    iput-object v0, p0, Lcom/motorola/ccc/ota/ui/VitalBackgroundInstallationFragment;->mUpdateTypeInterface:Lcom/motorola/ccc/ota/ui/updateType/UpdateType$UpdateTypeInterface;

    const-string v0, ""

    iput-object v0, p0, Lcom/motorola/ccc/ota/ui/VitalBackgroundInstallationFragment;->mSkipReason:Ljava/lang/String;

    new-instance v0, Lcom/motorola/ccc/ota/ui/VitalBackgroundInstallationFragment$4;

    invoke-direct {v0, p0}, Lcom/motorola/ccc/ota/ui/VitalBackgroundInstallationFragment$4;-><init>(Lcom/motorola/ccc/ota/ui/VitalBackgroundInstallationFragment;)V

    iput-object v0, p0, Lcom/motorola/ccc/ota/ui/VitalBackgroundInstallationFragment;->mFinishReceiver:Landroid/content/BroadcastReceiver;

    new-instance v0, Lcom/motorola/ccc/ota/ui/VitalBackgroundInstallationFragment$5;

    invoke-direct {v0, p0}, Lcom/motorola/ccc/ota/ui/VitalBackgroundInstallationFragment$5;-><init>(Lcom/motorola/ccc/ota/ui/VitalBackgroundInstallationFragment;)V

    iput-object v0, p0, Lcom/motorola/ccc/ota/ui/VitalBackgroundInstallationFragment;->mProgressReceiver:Landroid/content/BroadcastReceiver;

    return-void
.end method

.method private addCancelConfirmDialog(Landroid/content/Context;)V
    .locals 5

    new-instance v0, Landroidx/appcompat/app/AlertDialog$Builder;

    invoke-direct {v0, p1}, Landroidx/appcompat/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    invoke-virtual {p0}, Lcom/motorola/ccc/ota/ui/VitalBackgroundInstallationFragment;->getLayoutInflater()Landroid/view/LayoutInflater;

    move-result-object v1

    const v2, 0x7f0c0022

    const/4 v3, 0x0

    invoke-virtual {v1, v2, v3}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroidx/appcompat/app/AlertDialog$Builder;->setView(Landroid/view/View;)Landroidx/appcompat/app/AlertDialog$Builder;

    invoke-virtual {v0}, Landroidx/appcompat/app/AlertDialog$Builder;->create()Landroidx/appcompat/app/AlertDialog;

    move-result-object v0

    iput-object v0, p0, Lcom/motorola/ccc/ota/ui/VitalBackgroundInstallationFragment;->alertDialog:Landroidx/appcompat/app/AlertDialog;

    const v0, 0x7f09007d

    invoke-virtual {v1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    const/4 v2, 0x0

    invoke-virtual {v0, v2}, Landroid/widget/TextView;->setVisibility(I)V

    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v3

    const v4, 0x7f0e01f7

    invoke-virtual {v3, v4}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v0, v3}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    const v0, 0x7f090080

    invoke-virtual {v1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/Button;

    invoke-virtual {v0, v2}, Landroid/widget/Button;->setVisibility(I)V

    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v3

    const v4, 0x7f0e01fb

    invoke-virtual {v3, v4}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v0, v3}, Landroid/widget/Button;->setText(Ljava/lang/CharSequence;)V

    new-instance v3, Lcom/motorola/ccc/ota/ui/VitalBackgroundInstallationFragment$$ExternalSyntheticLambda0;

    invoke-direct {v3, p0, p1}, Lcom/motorola/ccc/ota/ui/VitalBackgroundInstallationFragment$$ExternalSyntheticLambda0;-><init>(Lcom/motorola/ccc/ota/ui/VitalBackgroundInstallationFragment;Landroid/content/Context;)V

    invoke-virtual {v0, v3}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    const v0, 0x7f09007f

    invoke-virtual {v1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/Button;

    invoke-virtual {v0, v2}, Landroid/widget/Button;->setVisibility(I)V

    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    const v2, 0x7f0e002b

    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/Button;->setText(Ljava/lang/CharSequence;)V

    new-instance v1, Lcom/motorola/ccc/ota/ui/VitalBackgroundInstallationFragment$$ExternalSyntheticLambda1;

    invoke-direct {v1, p0}, Lcom/motorola/ccc/ota/ui/VitalBackgroundInstallationFragment$$ExternalSyntheticLambda1;-><init>(Lcom/motorola/ccc/ota/ui/VitalBackgroundInstallationFragment;)V

    invoke-virtual {v0, v1}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    iget-object v0, p0, Lcom/motorola/ccc/ota/ui/VitalBackgroundInstallationFragment;->alertDialog:Landroidx/appcompat/app/AlertDialog;

    invoke-virtual {v0}, Landroidx/appcompat/app/AlertDialog;->create()V

    iget-object v0, p0, Lcom/motorola/ccc/ota/ui/VitalBackgroundInstallationFragment;->alertDialog:Landroidx/appcompat/app/AlertDialog;

    invoke-static {p1, v0}, Lcom/motorola/ccc/ota/ui/UpdaterUtils;->setCornersRounded(Landroid/content/Context;Landroidx/appcompat/app/AlertDialog;)V

    iget-object p0, p0, Lcom/motorola/ccc/ota/ui/VitalBackgroundInstallationFragment;->alertDialog:Landroidx/appcompat/app/AlertDialog;

    invoke-virtual {p0}, Landroidx/appcompat/app/AlertDialog;->show()V

    return-void
.end method

.method private findViewsById()V
    .locals 2

    iget-object v0, p0, Lcom/motorola/ccc/ota/ui/VitalBackgroundInstallationFragment;->rootView:Landroid/view/View;

    const v1, 0x7f0901fc

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p0, Lcom/motorola/ccc/ota/ui/VitalBackgroundInstallationFragment;->mBGTitle:Landroid/widget/TextView;

    iget-object v0, p0, Lcom/motorola/ccc/ota/ui/VitalBackgroundInstallationFragment;->rootView:Landroid/view/View;

    const v1, 0x7f0901fb

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p0, Lcom/motorola/ccc/ota/ui/VitalBackgroundInstallationFragment;->mBGText:Landroid/widget/TextView;

    iget-object v0, p0, Lcom/motorola/ccc/ota/ui/VitalBackgroundInstallationFragment;->rootView:Landroid/view/View;

    const v1, 0x7f09011f

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p0, Lcom/motorola/ccc/ota/ui/VitalBackgroundInstallationFragment;->mPercentage:Landroid/widget/TextView;

    iget-object v0, p0, Lcom/motorola/ccc/ota/ui/VitalBackgroundInstallationFragment;->rootView:Landroid/view/View;

    const v1, 0x7f090109

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p0, Lcom/motorola/ccc/ota/ui/VitalBackgroundInstallationFragment;->mNewVersion:Landroid/widget/TextView;

    iget-object v0, p0, Lcom/motorola/ccc/ota/ui/VitalBackgroundInstallationFragment;->rootView:Landroid/view/View;

    const v1, 0x7f090131

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/ProgressBar;

    iput-object v0, p0, Lcom/motorola/ccc/ota/ui/VitalBackgroundInstallationFragment;->progressBar:Landroid/widget/ProgressBar;

    iget-object v0, p0, Lcom/motorola/ccc/ota/ui/VitalBackgroundInstallationFragment;->rootView:Landroid/view/View;

    const v1, 0x7f090168

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/Button;

    iput-object v0, p0, Lcom/motorola/ccc/ota/ui/VitalBackgroundInstallationFragment;->mSkip:Landroid/widget/Button;

    iget-object v0, p0, Lcom/motorola/ccc/ota/ui/VitalBackgroundInstallationFragment;->rootView:Landroid/view/View;

    const v1, 0x7f0900ac

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/Button;

    iput-object v0, p0, Lcom/motorola/ccc/ota/ui/VitalBackgroundInstallationFragment;->emergencyCall:Landroid/widget/Button;

    return-void
.end method

.method private handleButtons()V
    .locals 2

    iget-object v0, p0, Lcom/motorola/ccc/ota/ui/VitalBackgroundInstallationFragment;->mSkip:Landroid/widget/Button;

    new-instance v1, Lcom/motorola/ccc/ota/ui/VitalBackgroundInstallationFragment$2;

    invoke-direct {v1, p0}, Lcom/motorola/ccc/ota/ui/VitalBackgroundInstallationFragment$2;-><init>(Lcom/motorola/ccc/ota/ui/VitalBackgroundInstallationFragment;)V

    invoke-virtual {v0, v1}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    iget-object v0, p0, Lcom/motorola/ccc/ota/ui/VitalBackgroundInstallationFragment;->emergencyCall:Landroid/widget/Button;

    new-instance v1, Lcom/motorola/ccc/ota/ui/VitalBackgroundInstallationFragment$3;

    invoke-direct {v1, p0}, Lcom/motorola/ccc/ota/ui/VitalBackgroundInstallationFragment$3;-><init>(Lcom/motorola/ccc/ota/ui/VitalBackgroundInstallationFragment;)V

    invoke-virtual {v0, v1}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    return-void
.end method

.method private initializeCommonLayout()V
    .locals 5

    invoke-virtual {p0}, Lcom/motorola/ccc/ota/ui/VitalBackgroundInstallationFragment;->getActivity()Landroidx/fragment/app/FragmentActivity;

    move-result-object v0

    if-eqz v0, :cond_1

    invoke-virtual {p0}, Lcom/motorola/ccc/ota/ui/VitalBackgroundInstallationFragment;->isAdded()Z

    move-result v0

    if-nez v0, :cond_0

    goto :goto_0

    :cond_0
    iget-object v0, p0, Lcom/motorola/ccc/ota/ui/VitalBackgroundInstallationFragment;->mPercentage:Landroid/widget/TextView;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setVisibility(I)V

    iget-object v0, p0, Lcom/motorola/ccc/ota/ui/VitalBackgroundInstallationFragment;->mNewVersion:Landroid/widget/TextView;

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setVisibility(I)V

    iget-object v0, p0, Lcom/motorola/ccc/ota/ui/VitalBackgroundInstallationFragment;->progressBar:Landroid/widget/ProgressBar;

    invoke-virtual {v0, v1}, Landroid/widget/ProgressBar;->setVisibility(I)V

    iget-object v0, p0, Lcom/motorola/ccc/ota/ui/VitalBackgroundInstallationFragment;->meta:Lcom/motorola/otalib/common/metaData/MetaData;

    invoke-virtual {v0}, Lcom/motorola/otalib/common/metaData/MetaData;->getDisplayVersion()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0}, Lcom/motorola/ccc/ota/ui/VitalBackgroundInstallationFragment;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    invoke-virtual {p0}, Lcom/motorola/ccc/ota/ui/VitalBackgroundInstallationFragment;->getContext()Landroid/content/Context;

    move-result-object v2

    iget-object v3, p0, Lcom/motorola/ccc/ota/ui/VitalBackgroundInstallationFragment;->meta:Lcom/motorola/otalib/common/metaData/MetaData;

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

    invoke-virtual {p0, v1, v0}, Lcom/motorola/ccc/ota/ui/VitalBackgroundInstallationFragment;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    iget-object p0, p0, Lcom/motorola/ccc/ota/ui/VitalBackgroundInstallationFragment;->mNewVersion:Landroid/widget/TextView;

    invoke-virtual {p0, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    :cond_1
    :goto_0
    return-void
.end method

.method private initializeCustomView(Landroid/content/Intent;)V
    .locals 7

    const-string v0, "com.motorola.ccc.ota.upgrade_status"

    const/4 v1, -0x1

    invoke-virtual {p1, v0, v1}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I

    move-result v0

    const-string v2, "com.motorola.ccc.ota.upgrade_percentage"

    const/high16 v3, -0x40800000    # -1.0f

    invoke-virtual {p1, v2, v3}, Landroid/content/Intent;->getFloatExtra(Ljava/lang/String;F)F

    move-result v2

    const-string v4, "com.motorola.blur.service.blur.upgrade.download.deferred"

    sget v5, Lcom/motorola/ccc/ota/ui/VitalBackgroundInstallationFragment;->DEFAULT_RETRY_OR_SUSPEND_VALUE:I

    invoke-virtual {p1, v4, v5}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I

    move-result p1

    iput p1, p0, Lcom/motorola/ccc/ota/ui/VitalBackgroundInstallationFragment;->mRetriedOrSuspend:I

    sget v4, Lcom/motorola/ccc/ota/ui/VitalBackgroundInstallationFragment;->DEFAULT_RETRY_OR_SUSPEND_VALUE:I

    const/4 v5, 0x0

    if-ne p1, v4, :cond_3

    const-string p1, "Vital Update, User did check for update during BG install"

    const-string v0, "OtaApp"

    invoke-static {v0, p1}, Lcom/motorola/ccc/ota/utils/Logger;->debug(Ljava/lang/String;Ljava/lang/String;)V

    iget-object p1, p0, Lcom/motorola/ccc/ota/ui/VitalBackgroundInstallationFragment;->settings:Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    sget-object v2, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->STORED_AB_STATUS:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    invoke-virtual {p1, v2, v1}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->getInt(Lcom/motorola/otalib/common/settings/ISetting;I)I

    move-result p1

    iget-object v2, p0, Lcom/motorola/ccc/ota/ui/VitalBackgroundInstallationFragment;->settings:Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    sget-object v4, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->STORED_AB_PROGRESS_PERCENT:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    invoke-virtual {v2, v4, v3}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->getFloat(Lcom/motorola/otalib/common/settings/ISetting;F)F

    move-result v2

    iget-object v3, p0, Lcom/motorola/ccc/ota/ui/VitalBackgroundInstallationFragment;->context:Landroid/content/Context;

    const-string v4, "connectivity"

    invoke-virtual {v3, v4}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Landroid/net/ConnectivityManager;

    iget-object v4, p0, Lcom/motorola/ccc/ota/ui/VitalBackgroundInstallationFragment;->settings:Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    sget-object v6, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->BATTERY_LOW:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    invoke-virtual {v4, v6}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->getBoolean(Lcom/motorola/otalib/common/settings/ISetting;)Z

    move-result v4

    if-eqz v4, :cond_0

    if-gez p1, :cond_1

    :cond_0
    invoke-static {v3}, Lcom/motorola/otalib/common/utils/NetworkUtils;->isNetWorkConnected(Landroid/net/ConnectivityManager;)Z

    move-result v3

    if-nez v3, :cond_2

    const/4 v3, 0x4

    if-ge p1, v3, :cond_2

    :cond_1
    iput v1, p0, Lcom/motorola/ccc/ota/ui/VitalBackgroundInstallationFragment;->mRetriedOrSuspend:I

    goto :goto_0

    :cond_2
    iput v5, p0, Lcom/motorola/ccc/ota/ui/VitalBackgroundInstallationFragment;->mRetriedOrSuspend:I

    :goto_0
    new-instance v1, Ljava/lang/StringBuilder;

    const-string v3, "Vital Update, Updated progress details, progress "

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

    iget v3, p0, Lcom/motorola/ccc/ota/ui/VitalBackgroundInstallationFragment;->mRetriedOrSuspend:I

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

    const v1, 0x7f0e01f8

    if-ltz v0, :cond_4

    iget-object v0, p0, Lcom/motorola/ccc/ota/ui/VitalBackgroundInstallationFragment;->mPercentage:Landroid/widget/TextView;

    invoke-virtual {v0, v5}, Landroid/widget/TextView;->setVisibility(I)V

    iget-object v0, p0, Lcom/motorola/ccc/ota/ui/VitalBackgroundInstallationFragment;->mPercentage:Landroid/widget/TextView;

    invoke-virtual {p0}, Lcom/motorola/ccc/ota/ui/VitalBackgroundInstallationFragment;->getResources()Landroid/content/res/Resources;

    move-result-object v3

    filled-new-array {p1}, [Ljava/lang/Object;

    move-result-object v4

    invoke-virtual {v3, v1, v4}, Landroid/content/res/Resources;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v0, v3}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    iget-object v0, p0, Lcom/motorola/ccc/ota/ui/VitalBackgroundInstallationFragment;->progressBar:Landroid/widget/ProgressBar;

    invoke-static {v2}, Ljava/lang/Math;->round(F)I

    move-result v3

    invoke-virtual {v0, v3}, Landroid/widget/ProgressBar;->setProgress(I)V

    :cond_4
    iget-object v0, p0, Lcom/motorola/ccc/ota/ui/VitalBackgroundInstallationFragment;->mBGText:Landroid/widget/TextView;

    iget-object v3, p0, Lcom/motorola/ccc/ota/ui/VitalBackgroundInstallationFragment;->context:Landroid/content/Context;

    invoke-virtual {v3}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v3

    const v4, 0x7f0e01f2

    invoke-virtual {v3, v4}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v0, v3}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    iget-object v0, p0, Lcom/motorola/ccc/ota/ui/VitalBackgroundInstallationFragment;->mBGTitle:Landroid/widget/TextView;

    iget-object v3, p0, Lcom/motorola/ccc/ota/ui/VitalBackgroundInstallationFragment;->context:Landroid/content/Context;

    invoke-virtual {v3}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v3

    const v4, 0x7f0e01f1

    invoke-virtual {v3, v4}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v0, v3}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    invoke-static {}, Lcom/motorola/ccc/ota/utils/BuildPropReader;->isStreamingUpdate()Z

    move-result v0

    if-eqz v0, :cond_8

    iget v0, p0, Lcom/motorola/ccc/ota/ui/VitalBackgroundInstallationFragment;->mRetriedOrSuspend:I

    if-eqz v0, :cond_7

    iget-object v0, p0, Lcom/motorola/ccc/ota/ui/VitalBackgroundInstallationFragment;->mPercentage:Landroid/widget/TextView;

    invoke-virtual {p0}, Lcom/motorola/ccc/ota/ui/VitalBackgroundInstallationFragment;->getResources()Landroid/content/res/Resources;

    move-result-object v3

    filled-new-array {p1}, [Ljava/lang/Object;

    move-result-object p1

    invoke-virtual {v3, v1, p1}, Landroid/content/res/Resources;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    iget-object p1, p0, Lcom/motorola/ccc/ota/ui/VitalBackgroundInstallationFragment;->progressBar:Landroid/widget/ProgressBar;

    invoke-static {v2}, Ljava/lang/Math;->round(F)I

    move-result v0

    invoke-virtual {p1, v0}, Landroid/widget/ProgressBar;->setProgress(I)V

    invoke-direct {p0}, Lcom/motorola/ccc/ota/ui/VitalBackgroundInstallationFragment;->updatePauseView()V

    iget-object p1, p0, Lcom/motorola/ccc/ota/ui/VitalBackgroundInstallationFragment;->meta:Lcom/motorola/otalib/common/metaData/MetaData;

    invoke-virtual {p1}, Lcom/motorola/otalib/common/metaData/MetaData;->getForceDownloadTime()D

    move-result-wide v0

    const-wide/16 v2, 0x0

    cmpl-double p1, v0, v2

    if-ltz p1, :cond_5

    const/4 v5, 0x1

    :cond_5
    iget p1, p0, Lcom/motorola/ccc/ota/ui/VitalBackgroundInstallationFragment;->mRetriedOrSuspend:I

    iget-object v0, p0, Lcom/motorola/ccc/ota/ui/VitalBackgroundInstallationFragment;->settings:Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    iget-object v1, p0, Lcom/motorola/ccc/ota/ui/VitalBackgroundInstallationFragment;->context:Landroid/content/Context;

    invoke-static {p1, v5, v0, v1}, Lcom/motorola/ccc/ota/utils/NotificationUtils;->getErrorNotificationText(IZLcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;Landroid/content/Context;)Ljava/lang/String;

    move-result-object p1

    invoke-static {}, Lcom/motorola/ccc/ota/ui/UpdaterUtils;->checkForFinalDeferTimeForForceUpdate()Z

    move-result v0

    if-eqz v0, :cond_6

    invoke-static {}, Lcom/motorola/ccc/ota/ui/UpdaterUtils;->getAutomaticDownloadForCellular()Z

    move-result v0

    if-nez v0, :cond_6

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-static {}, Ljava/lang/System;->lineSeparator()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p0}, Lcom/motorola/ccc/ota/ui/VitalBackgroundInstallationFragment;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    iget-object v1, p0, Lcom/motorola/ccc/ota/ui/VitalBackgroundInstallationFragment;->context:Landroid/content/Context;

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

    :cond_6
    iget-object v0, p0, Lcom/motorola/ccc/ota/ui/VitalBackgroundInstallationFragment;->mBGText:Landroid/widget/TextView;

    invoke-virtual {v0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    iput-object p1, p0, Lcom/motorola/ccc/ota/ui/VitalBackgroundInstallationFragment;->mSkipReason:Ljava/lang/String;

    goto :goto_1

    :cond_7
    invoke-direct {p0}, Lcom/motorola/ccc/ota/ui/VitalBackgroundInstallationFragment;->updateResumeView()V

    :cond_8
    :goto_1
    return-void
.end method

.method private updatePauseView()V
    .locals 2

    iget-object v0, p0, Lcom/motorola/ccc/ota/ui/VitalBackgroundInstallationFragment;->mPercentage:Landroid/widget/TextView;

    const/16 v1, 0x8

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setVisibility(I)V

    iget-object v0, p0, Lcom/motorola/ccc/ota/ui/VitalBackgroundInstallationFragment;->mNewVersion:Landroid/widget/TextView;

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setVisibility(I)V

    iget-object v0, p0, Lcom/motorola/ccc/ota/ui/VitalBackgroundInstallationFragment;->progressBar:Landroid/widget/ProgressBar;

    invoke-virtual {v0, v1}, Landroid/widget/ProgressBar;->setVisibility(I)V

    invoke-static {}, Lcom/motorola/ccc/ota/ui/UpdaterUtils;->isVerizon()Z

    move-result v0

    const/4 v1, 0x0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/motorola/ccc/ota/ui/VitalBackgroundInstallationFragment;->emergencyCall:Landroid/widget/Button;

    invoke-virtual {v0, v1}, Landroid/widget/Button;->setVisibility(I)V

    :cond_0
    iget-object p0, p0, Lcom/motorola/ccc/ota/ui/VitalBackgroundInstallationFragment;->mSkip:Landroid/widget/Button;

    invoke-virtual {p0, v1}, Landroid/widget/Button;->setVisibility(I)V

    return-void
.end method

.method private updateResumeView()V
    .locals 3

    iget-object v0, p0, Lcom/motorola/ccc/ota/ui/VitalBackgroundInstallationFragment;->mPercentage:Landroid/widget/TextView;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setVisibility(I)V

    iget-object v0, p0, Lcom/motorola/ccc/ota/ui/VitalBackgroundInstallationFragment;->mNewVersion:Landroid/widget/TextView;

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setVisibility(I)V

    iget-object v0, p0, Lcom/motorola/ccc/ota/ui/VitalBackgroundInstallationFragment;->progressBar:Landroid/widget/ProgressBar;

    invoke-virtual {v0, v1}, Landroid/widget/ProgressBar;->setVisibility(I)V

    iget-object v0, p0, Lcom/motorola/ccc/ota/ui/VitalBackgroundInstallationFragment;->mSkip:Landroid/widget/Button;

    const/16 v2, 0x8

    invoke-virtual {v0, v2}, Landroid/widget/Button;->setVisibility(I)V

    invoke-static {}, Lcom/motorola/ccc/ota/ui/UpdaterUtils;->isVerizon()Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/motorola/ccc/ota/ui/VitalBackgroundInstallationFragment;->emergencyCall:Landroid/widget/Button;

    invoke-virtual {v0, v1}, Landroid/widget/Button;->setVisibility(I)V

    :cond_0
    const-string v0, ""

    iput-object v0, p0, Lcom/motorola/ccc/ota/ui/VitalBackgroundInstallationFragment;->mSkipReason:Ljava/lang/String;

    return-void
.end method


# virtual methods
.method synthetic lambda$addCancelConfirmDialog$0$com-motorola-ccc-ota-ui-VitalBackgroundInstallationFragment(Landroid/content/Context;Landroid/view/View;)V
    .locals 2

    iget-object p2, p0, Lcom/motorola/ccc/ota/ui/VitalBackgroundInstallationFragment;->settings:Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    sget-object v0, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->VITAL_UPDATE_CANCEL_REASON:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    const-string v1, "User cancelled vital update from popup onBackClick"

    invoke-virtual {p2, v0, v1}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->setString(Lcom/motorola/otalib/common/settings/ISetting;Ljava/lang/String;)V

    iget-object p0, p0, Lcom/motorola/ccc/ota/ui/VitalBackgroundInstallationFragment;->settings:Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    sget-object p2, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->LAUNCHED_NEXT_SETUP_SCREEN_ON_SKIP_OR_STOP:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    const/4 v0, 0x1

    invoke-virtual {p0, p2, v0}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->setBoolean(Lcom/motorola/otalib/common/settings/ISetting;Z)V

    invoke-static {p1}, Lcom/motorola/ccc/ota/ui/UpdaterUtils;->launchNextSetupActivityVitalUpdate(Landroid/content/Context;)V

    sget-object p0, Lcom/motorola/otalib/common/utils/UpgradeUtils$DownloadStatus;->STATUS_INSTALL_CANCEL:Lcom/motorola/otalib/common/utils/UpgradeUtils$DownloadStatus;

    invoke-static {p1, p0}, Lcom/motorola/ccc/ota/utils/UpgradeUtilMethods;->sendUserResponseDuringBackgroundInstallation(Landroid/content/Context;Lcom/motorola/otalib/common/utils/UpgradeUtils$DownloadStatus;)V

    return-void
.end method

.method synthetic lambda$addCancelConfirmDialog$1$com-motorola-ccc-ota-ui-VitalBackgroundInstallationFragment(Landroid/view/View;)V
    .locals 0

    iget-object p0, p0, Lcom/motorola/ccc/ota/ui/VitalBackgroundInstallationFragment;->alertDialog:Landroidx/appcompat/app/AlertDialog;

    invoke-virtual {p0}, Landroidx/appcompat/app/AlertDialog;->dismiss()V

    return-void
.end method

.method public onAttach(Landroid/content/Context;)V
    .locals 1

    invoke-super {p0, p1}, Landroidx/fragment/app/Fragment;->onAttach(Landroid/content/Context;)V

    iput-object p1, p0, Lcom/motorola/ccc/ota/ui/VitalBackgroundInstallationFragment;->context:Landroid/content/Context;

    instance-of v0, p1, Landroid/app/Activity;

    if-eqz v0, :cond_0

    check-cast p1, Landroid/app/Activity;

    iput-object p1, p0, Lcom/motorola/ccc/ota/ui/VitalBackgroundInstallationFragment;->activity:Landroid/app/Activity;

    :cond_0
    return-void
.end method

.method public onCreate(Landroid/os/Bundle;)V
    .locals 3

    invoke-super {p0, p1}, Landroidx/fragment/app/Fragment;->onCreate(Landroid/os/Bundle;)V

    new-instance p1, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    invoke-direct {p1}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;-><init>()V

    iput-object p1, p0, Lcom/motorola/ccc/ota/ui/VitalBackgroundInstallationFragment;->settings:Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    new-instance p1, Lcom/motorola/ccc/ota/ui/VitalBackgroundInstallationFragment$1;

    const/4 v0, 0x1

    invoke-direct {p1, p0, v0}, Lcom/motorola/ccc/ota/ui/VitalBackgroundInstallationFragment$1;-><init>(Lcom/motorola/ccc/ota/ui/VitalBackgroundInstallationFragment;Z)V

    invoke-virtual {p0}, Lcom/motorola/ccc/ota/ui/VitalBackgroundInstallationFragment;->requireActivity()Landroidx/fragment/app/FragmentActivity;

    move-result-object v0

    invoke-virtual {v0}, Landroidx/fragment/app/FragmentActivity;->getOnBackPressedDispatcher()Landroidx/activity/OnBackPressedDispatcher;

    move-result-object v0

    invoke-virtual {v0, p0, p1}, Landroidx/activity/OnBackPressedDispatcher;->addCallback(Landroidx/lifecycle/LifecycleOwner;Landroidx/activity/OnBackPressedCallback;)V

    new-instance p1, Landroid/content/IntentFilter;

    invoke-direct {p1}, Landroid/content/IntentFilter;-><init>()V

    const-string v0, "com.motorola.ccc.ota.Actions.FINISH_BG_INSTALL_ACTIVITY"

    invoke-virtual {p1, v0}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    iget-object v0, p0, Lcom/motorola/ccc/ota/ui/VitalBackgroundInstallationFragment;->context:Landroid/content/Context;

    iget-object v1, p0, Lcom/motorola/ccc/ota/ui/VitalBackgroundInstallationFragment;->mFinishReceiver:Landroid/content/BroadcastReceiver;

    invoke-static {v0, v1, p1}, Lcom/motorola/otalib/common/utils/BroadcastUtils;->registerLocalReceiver(Landroid/content/Context;Landroid/content/BroadcastReceiver;Landroid/content/IntentFilter;)V

    new-instance p1, Landroid/content/IntentFilter;

    invoke-direct {p1}, Landroid/content/IntentFilter;-><init>()V

    const-string v0, "com.motorola.ccc.ota.ACTION_AB_UPDATE_PROGRESS"

    invoke-virtual {p1, v0}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    const-string v0, "com.motorola.ccc.ota.START_RESTART_ACTIVITY_INTENT"

    invoke-virtual {p1, v0}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    const-string v0, "com.motorola.ccc.ota.UPGRADE_RESTART_NOTIFICATION"

    invoke-virtual {p1, v0}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    iget-object v0, p0, Lcom/motorola/ccc/ota/ui/VitalBackgroundInstallationFragment;->context:Landroid/content/Context;

    iget-object v1, p0, Lcom/motorola/ccc/ota/ui/VitalBackgroundInstallationFragment;->mProgressReceiver:Landroid/content/BroadcastReceiver;

    const/4 v2, 0x2

    invoke-virtual {v0, v1, p1, v2}, Landroid/content/Context;->registerReceiver(Landroid/content/BroadcastReceiver;Landroid/content/IntentFilter;I)Landroid/content/Intent;

    invoke-virtual {p0}, Lcom/motorola/ccc/ota/ui/VitalBackgroundInstallationFragment;->getArguments()Landroid/os/Bundle;

    move-result-object p1

    if-eqz p1, :cond_0

    const-string v0, "activityIntent"

    invoke-virtual {p1, v0}, Landroid/os/Bundle;->getParcelable(Ljava/lang/String;)Landroid/os/Parcelable;

    move-result-object p1

    check-cast p1, Landroid/content/Intent;

    iput-object p1, p0, Lcom/motorola/ccc/ota/ui/VitalBackgroundInstallationFragment;->activityIntent:Landroid/content/Intent;

    :cond_0
    iget-object p1, p0, Lcom/motorola/ccc/ota/ui/VitalBackgroundInstallationFragment;->settings:Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    sget-object v0, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->METADATA:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    invoke-virtual {p1, v0}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->getString(Lcom/motorola/otalib/common/settings/ISetting;)Ljava/lang/String;

    move-result-object p1

    invoke-static {p1}, Lcom/motorola/otalib/common/metaData/builder/MetaDataBuilder;->from(Ljava/lang/String;)Lcom/motorola/otalib/common/metaData/MetaData;

    move-result-object p1

    iput-object p1, p0, Lcom/motorola/ccc/ota/ui/VitalBackgroundInstallationFragment;->meta:Lcom/motorola/otalib/common/metaData/MetaData;

    iget-object p1, p0, Lcom/motorola/ccc/ota/ui/VitalBackgroundInstallationFragment;->activityIntent:Landroid/content/Intent;

    invoke-static {p1}, Lcom/motorola/ccc/ota/ui/UpdaterUtils;->getUpgradeInfoDuringOTAUpdate(Landroid/content/Intent;)Lcom/motorola/ccc/ota/ui/UpdaterUtils$UpgradeInfo;

    move-result-object p1

    iput-object p1, p0, Lcom/motorola/ccc/ota/ui/VitalBackgroundInstallationFragment;->info:Lcom/motorola/ccc/ota/ui/UpdaterUtils$UpgradeInfo;

    iget-object p1, p0, Lcom/motorola/ccc/ota/ui/VitalBackgroundInstallationFragment;->meta:Lcom/motorola/otalib/common/metaData/MetaData;

    if-nez p1, :cond_1

    iget-object p1, p0, Lcom/motorola/ccc/ota/ui/VitalBackgroundInstallationFragment;->activity:Landroid/app/Activity;

    invoke-virtual {p1}, Landroid/app/Activity;->finish()V

    :cond_1
    iget-object p1, p0, Lcom/motorola/ccc/ota/ui/VitalBackgroundInstallationFragment;->meta:Lcom/motorola/otalib/common/metaData/MetaData;

    invoke-virtual {p1}, Lcom/motorola/otalib/common/metaData/MetaData;->getUpdateTypeData()Ljava/lang/String;

    move-result-object p1

    invoke-static {p1}, Lcom/motorola/ccc/ota/ui/updateType/UpdateType;->getUpdateType(Ljava/lang/String;)Lcom/motorola/ccc/ota/ui/updateType/UpdateType$UpdateTypeInterface;

    move-result-object p1

    iput-object p1, p0, Lcom/motorola/ccc/ota/ui/VitalBackgroundInstallationFragment;->mUpdateTypeInterface:Lcom/motorola/ccc/ota/ui/updateType/UpdateType$UpdateTypeInterface;

    iget-object p0, p0, Lcom/motorola/ccc/ota/ui/VitalBackgroundInstallationFragment;->context:Landroid/content/Context;

    invoke-static {p0}, Lcom/motorola/ccc/ota/ui/UpdaterUtils;->stopWarningAlertDialog(Landroid/content/Context;)V

    return-void
.end method

.method public onCreateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;Landroid/os/Bundle;)Landroid/view/View;
    .locals 1

    const p3, 0x7f0c00a7

    const/4 v0, 0x0

    invoke-virtual {p1, p3, p2, v0}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object p1

    iput-object p1, p0, Lcom/motorola/ccc/ota/ui/VitalBackgroundInstallationFragment;->rootView:Landroid/view/View;

    invoke-direct {p0}, Lcom/motorola/ccc/ota/ui/VitalBackgroundInstallationFragment;->findViewsById()V

    invoke-direct {p0}, Lcom/motorola/ccc/ota/ui/VitalBackgroundInstallationFragment;->initializeCommonLayout()V

    invoke-direct {p0}, Lcom/motorola/ccc/ota/ui/VitalBackgroundInstallationFragment;->handleButtons()V

    iget-object p1, p0, Lcom/motorola/ccc/ota/ui/VitalBackgroundInstallationFragment;->activityIntent:Landroid/content/Intent;

    invoke-direct {p0, p1}, Lcom/motorola/ccc/ota/ui/VitalBackgroundInstallationFragment;->initializeCustomView(Landroid/content/Intent;)V

    iget-object p0, p0, Lcom/motorola/ccc/ota/ui/VitalBackgroundInstallationFragment;->rootView:Landroid/view/View;

    return-object p0
.end method

.method public onDestroy()V
    .locals 3

    invoke-super {p0}, Landroidx/fragment/app/Fragment;->onDestroy()V

    :try_start_0
    iget-object v0, p0, Lcom/motorola/ccc/ota/ui/VitalBackgroundInstallationFragment;->context:Landroid/content/Context;

    iget-object v1, p0, Lcom/motorola/ccc/ota/ui/VitalBackgroundInstallationFragment;->mProgressReceiver:Landroid/content/BroadcastReceiver;

    invoke-virtual {v0, v1}, Landroid/content/Context;->unregisterReceiver(Landroid/content/BroadcastReceiver;)V
    :try_end_0
    .catch Ljava/lang/IllegalArgumentException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception v0

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "Vital Update, BGI Fragment:onDestroy:Receiver already unregistered:msg="

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    const-string v1, "OtaApp"

    invoke-static {v1, v0}, Lcom/motorola/ccc/ota/utils/Logger;->error(Ljava/lang/String;Ljava/lang/String;)V

    :goto_0
    iget-object v0, p0, Lcom/motorola/ccc/ota/ui/VitalBackgroundInstallationFragment;->context:Landroid/content/Context;

    iget-object p0, p0, Lcom/motorola/ccc/ota/ui/VitalBackgroundInstallationFragment;->mFinishReceiver:Landroid/content/BroadcastReceiver;

    invoke-static {v0, p0}, Lcom/motorola/otalib/common/utils/BroadcastUtils;->unregisterLocalReceiver(Landroid/content/Context;Landroid/content/BroadcastReceiver;)V

    return-void
.end method

.method public onResume()V
    .locals 2

    invoke-super {p0}, Landroidx/fragment/app/Fragment;->onResume()V

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v0

    iput-wide v0, p0, Lcom/motorola/ccc/ota/ui/VitalBackgroundInstallationFragment;->launchTimeInMillis:J

    return-void
.end method

.method public onStop()V
    .locals 8

    invoke-super {p0}, Landroidx/fragment/app/Fragment;->onStop()V

    iget-object v0, p0, Lcom/motorola/ccc/ota/ui/VitalBackgroundInstallationFragment;->settings:Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    sget-object v1, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->TOTAL_TIME_SPEND_ON_BG_SCREEN:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    iget-object v2, p0, Lcom/motorola/ccc/ota/ui/VitalBackgroundInstallationFragment;->settings:Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    sget-object v3, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->TOTAL_TIME_SPEND_ON_BG_SCREEN:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    const-wide/16 v4, 0x0

    invoke-virtual {v2, v3, v4, v5}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->getLong(Lcom/motorola/otalib/common/settings/ISetting;J)J

    move-result-wide v2

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v4

    iget-wide v6, p0, Lcom/motorola/ccc/ota/ui/VitalBackgroundInstallationFragment;->launchTimeInMillis:J

    sub-long/2addr v4, v6

    add-long/2addr v2, v4

    invoke-virtual {v0, v1, v2, v3}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->setLong(Lcom/motorola/otalib/common/settings/ISetting;J)V

    iget-object p0, p0, Lcom/motorola/ccc/ota/ui/VitalBackgroundInstallationFragment;->alertDialog:Landroidx/appcompat/app/AlertDialog;

    if-eqz p0, :cond_0

    invoke-virtual {p0}, Landroidx/appcompat/app/AlertDialog;->dismiss()V

    :cond_0
    return-void
.end method

.method public onclickEmergencyCall()V
    .locals 2

    new-instance v0, Landroid/content/Intent;

    const-string v1, "com.android.phone.EmergencyDialer.DIAL"

    invoke-direct {v0, v1}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    const/high16 v1, 0x40000000    # 2.0f

    invoke-virtual {v0, v1}, Landroid/content/Intent;->setFlags(I)Landroid/content/Intent;

    invoke-virtual {p0, v0}, Lcom/motorola/ccc/ota/ui/VitalBackgroundInstallationFragment;->startActivity(Landroid/content/Intent;)V

    return-void
.end method
