.class public Lcom/motorola/ccc/ota/ui/RestartFragment;
.super Landroidx/fragment/app/Fragment;
.source "RestartFragment.java"

# interfaces
.implements Lcom/motorola/ccc/ota/utils/SmartUpdateUtils$OnSmartUpdateConfigChangedLister;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/motorola/ccc/ota/ui/RestartFragment$PreInstallCounter;
    }
.end annotation


# static fields
.field private static INSTALL_COUNTDOWN_IN_SECONDS:I

.field private static isSmartUpdateTimerRunning:Z

.field private static isTimerRunning:Z

.field private static mPreInstallCounter:Lcom/motorola/ccc/ota/ui/RestartFragment$PreInstallCounter;


# instance fields
.field private activity:Landroid/app/Activity;

.field private activityIntent:Landroid/content/Intent;

.field private context:Landroid/content/Context;

.field private expandableListView:Landroid/widget/ExpandableListView;

.field private imgBack:Landroid/widget/ImageView;

.field private launchTimeInMillis:J

.field private mAbRestartCriticalPrompt:Landroid/widget/TextView;

.field private mAlarmManager:Landroid/app/AlarmManager;

.field private mAlert:Landroidx/appcompat/app/AlertDialog;

.field private mCriticalUpdate:Lcom/motorola/ccc/ota/ui/CriticalUpdate;

.field private mDoNotShowNotification:Z

.field private mEmergencyCallText:Landroid/widget/TextView;

.field private mExpTitle:Landroid/widget/TextView;

.field private mFinishReceiver:Landroid/content/BroadcastReceiver;

.field private mInstructionLayout:Landroid/widget/LinearLayout;

.field private mInstructionTitle:Landroid/widget/TextView;

.field private mLocationType:Ljava/lang/String;

.field private mMinVersion:Ljava/lang/String;

.field private mNextPrompt:J

.field private mPendingIntent:Landroid/app/PendingIntent;

.field private mPreInstallNotes:Landroid/widget/TextView;

.field private mPromptCount:I

.field private mRebootLater:Landroid/widget/Button;

.field private mRebootNow:Landroid/widget/Button;

.field private mRestartCancel:Landroid/widget/Button;

.field private mTargetIntent:Landroid/content/Intent;

.field private mUpdateType:Lcom/motorola/ccc/ota/ui/updateType/UpdateType$UpdateTypeInterface;

.field private mUpgradeInfo:Lcom/motorola/ccc/ota/ui/UpdaterUtils$UpgradeInfo;

.field private mVersion:Landroid/widget/TextView;

.field private mWarningText:Landroid/widget/TextView;

.field private osReleaseNotes:Landroid/widget/TextView;

.field private rootView:Landroid/view/View;

.field private settings:Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;


# direct methods
.method static bridge synthetic -$$Nest$fgetactivity(Lcom/motorola/ccc/ota/ui/RestartFragment;)Landroid/app/Activity;
    .locals 0

    iget-object p0, p0, Lcom/motorola/ccc/ota/ui/RestartFragment;->activity:Landroid/app/Activity;

    return-object p0
.end method

.method static bridge synthetic -$$Nest$fgetmCriticalUpdate(Lcom/motorola/ccc/ota/ui/RestartFragment;)Lcom/motorola/ccc/ota/ui/CriticalUpdate;
    .locals 0

    iget-object p0, p0, Lcom/motorola/ccc/ota/ui/RestartFragment;->mCriticalUpdate:Lcom/motorola/ccc/ota/ui/CriticalUpdate;

    return-object p0
.end method

.method static bridge synthetic -$$Nest$fgetmNextPrompt(Lcom/motorola/ccc/ota/ui/RestartFragment;)J
    .locals 2

    iget-wide v0, p0, Lcom/motorola/ccc/ota/ui/RestartFragment;->mNextPrompt:J

    return-wide v0
.end method

.method static bridge synthetic -$$Nest$fgetmPromptCount(Lcom/motorola/ccc/ota/ui/RestartFragment;)I
    .locals 0

    iget p0, p0, Lcom/motorola/ccc/ota/ui/RestartFragment;->mPromptCount:I

    return p0
.end method

.method static bridge synthetic -$$Nest$fgetmRebootLater(Lcom/motorola/ccc/ota/ui/RestartFragment;)Landroid/widget/Button;
    .locals 0

    iget-object p0, p0, Lcom/motorola/ccc/ota/ui/RestartFragment;->mRebootLater:Landroid/widget/Button;

    return-object p0
.end method

.method static bridge synthetic -$$Nest$fgetmUpdateType(Lcom/motorola/ccc/ota/ui/RestartFragment;)Lcom/motorola/ccc/ota/ui/updateType/UpdateType$UpdateTypeInterface;
    .locals 0

    iget-object p0, p0, Lcom/motorola/ccc/ota/ui/RestartFragment;->mUpdateType:Lcom/motorola/ccc/ota/ui/updateType/UpdateType$UpdateTypeInterface;

    return-object p0
.end method

.method static bridge synthetic -$$Nest$fgetmUpgradeInfo(Lcom/motorola/ccc/ota/ui/RestartFragment;)Lcom/motorola/ccc/ota/ui/UpdaterUtils$UpgradeInfo;
    .locals 0

    iget-object p0, p0, Lcom/motorola/ccc/ota/ui/RestartFragment;->mUpgradeInfo:Lcom/motorola/ccc/ota/ui/UpdaterUtils$UpgradeInfo;

    return-object p0
.end method

.method static bridge synthetic -$$Nest$fgetsettings(Lcom/motorola/ccc/ota/ui/RestartFragment;)Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;
    .locals 0

    iget-object p0, p0, Lcom/motorola/ccc/ota/ui/RestartFragment;->settings:Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    return-object p0
.end method

.method static bridge synthetic -$$Nest$fputmDoNotShowNotification(Lcom/motorola/ccc/ota/ui/RestartFragment;Z)V
    .locals 0

    iput-boolean p1, p0, Lcom/motorola/ccc/ota/ui/RestartFragment;->mDoNotShowNotification:Z

    return-void
.end method

.method static bridge synthetic -$$Nest$mhandleCriticalUpdateExtendRestart(Lcom/motorola/ccc/ota/ui/RestartFragment;)V
    .locals 0

    invoke-direct {p0}, Lcom/motorola/ccc/ota/ui/RestartFragment;->handleCriticalUpdateExtendRestart()V

    return-void
.end method

.method static bridge synthetic -$$Nest$mhandleRestartCancelOrPostponeToNextDay(Lcom/motorola/ccc/ota/ui/RestartFragment;)V
    .locals 0

    invoke-direct {p0}, Lcom/motorola/ccc/ota/ui/RestartFragment;->handleRestartCancelOrPostponeToNextDay()V

    return-void
.end method

.method static bridge synthetic -$$Nest$mproceedWithReboot(Lcom/motorola/ccc/ota/ui/RestartFragment;)V
    .locals 0

    invoke-direct {p0}, Lcom/motorola/ccc/ota/ui/RestartFragment;->proceedWithReboot()V

    return-void
.end method

.method static bridge synthetic -$$Nest$mshowTrySmartUpdatePopUp(Lcom/motorola/ccc/ota/ui/RestartFragment;)V
    .locals 0

    invoke-direct {p0}, Lcom/motorola/ccc/ota/ui/RestartFragment;->showTrySmartUpdatePopUp()V

    return-void
.end method

.method static bridge synthetic -$$Nest$sfputINSTALL_COUNTDOWN_IN_SECONDS(I)V
    .locals 0

    sput p0, Lcom/motorola/ccc/ota/ui/RestartFragment;->INSTALL_COUNTDOWN_IN_SECONDS:I

    return-void
.end method

.method static bridge synthetic -$$Nest$sfputisSmartUpdateTimerRunning(Z)V
    .locals 0

    sput-boolean p0, Lcom/motorola/ccc/ota/ui/RestartFragment;->isSmartUpdateTimerRunning:Z

    return-void
.end method

.method static bridge synthetic -$$Nest$sfputisTimerRunning(Z)V
    .locals 0

    sput-boolean p0, Lcom/motorola/ccc/ota/ui/RestartFragment;->isTimerRunning:Z

    return-void
.end method

.method public constructor <init>()V
    .locals 1

    invoke-direct {p0}, Landroidx/fragment/app/Fragment;-><init>()V

    new-instance v0, Lcom/motorola/ccc/ota/ui/RestartFragment$5;

    invoke-direct {v0, p0}, Lcom/motorola/ccc/ota/ui/RestartFragment$5;-><init>(Lcom/motorola/ccc/ota/ui/RestartFragment;)V

    iput-object v0, p0, Lcom/motorola/ccc/ota/ui/RestartFragment;->mFinishReceiver:Landroid/content/BroadcastReceiver;

    return-void
.end method

.method private dismissAlert()V
    .locals 1

    iget-object v0, p0, Lcom/motorola/ccc/ota/ui/RestartFragment;->mAlert:Landroidx/appcompat/app/AlertDialog;

    if-eqz v0, :cond_0

    invoke-virtual {v0}, Landroidx/appcompat/app/AlertDialog;->isShowing()Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/motorola/ccc/ota/ui/RestartFragment;->mAlert:Landroidx/appcompat/app/AlertDialog;

    invoke-virtual {v0}, Landroidx/appcompat/app/AlertDialog;->dismiss()V

    const/4 v0, 0x0

    iput-object v0, p0, Lcom/motorola/ccc/ota/ui/RestartFragment;->mAlert:Landroidx/appcompat/app/AlertDialog;

    :cond_0
    return-void
.end method

.method private findViewsById()V
    .locals 2

    iget-object v0, p0, Lcom/motorola/ccc/ota/ui/RestartFragment;->rootView:Landroid/view/View;

    const v1, 0x7f090007

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p0, Lcom/motorola/ccc/ota/ui/RestartFragment;->mVersion:Landroid/widget/TextView;

    iget-object v0, p0, Lcom/motorola/ccc/ota/ui/RestartFragment;->rootView:Landroid/view/View;

    const v1, 0x7f090143

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/Button;

    iput-object v0, p0, Lcom/motorola/ccc/ota/ui/RestartFragment;->mRebootNow:Landroid/widget/Button;

    iget-object v0, p0, Lcom/motorola/ccc/ota/ui/RestartFragment;->rootView:Landroid/view/View;

    const v1, 0x7f090144

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p0, Lcom/motorola/ccc/ota/ui/RestartFragment;->mPreInstallNotes:Landroid/widget/TextView;

    iget-object v0, p0, Lcom/motorola/ccc/ota/ui/RestartFragment;->rootView:Landroid/view/View;

    const v1, 0x7f090142

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/Button;

    iput-object v0, p0, Lcom/motorola/ccc/ota/ui/RestartFragment;->mRebootLater:Landroid/widget/Button;

    iget-object v0, p0, Lcom/motorola/ccc/ota/ui/RestartFragment;->rootView:Landroid/view/View;

    const v1, 0x7f090140

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/Button;

    iput-object v0, p0, Lcom/motorola/ccc/ota/ui/RestartFragment;->mRestartCancel:Landroid/widget/Button;

    iget-object v0, p0, Lcom/motorola/ccc/ota/ui/RestartFragment;->rootView:Landroid/view/View;

    const v1, 0x7f090009

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p0, Lcom/motorola/ccc/ota/ui/RestartFragment;->mWarningText:Landroid/widget/TextView;

    iget-object v0, p0, Lcom/motorola/ccc/ota/ui/RestartFragment;->rootView:Landroid/view/View;

    const v1, 0x7f0900ad

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p0, Lcom/motorola/ccc/ota/ui/RestartFragment;->mEmergencyCallText:Landroid/widget/TextView;

    iget-object v0, p0, Lcom/motorola/ccc/ota/ui/RestartFragment;->rootView:Landroid/view/View;

    const v1, 0x7f090008

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p0, Lcom/motorola/ccc/ota/ui/RestartFragment;->mAbRestartCriticalPrompt:Landroid/widget/TextView;

    iget-object v0, p0, Lcom/motorola/ccc/ota/ui/RestartFragment;->rootView:Landroid/view/View;

    const v1, 0x7f0900b7

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p0, Lcom/motorola/ccc/ota/ui/RestartFragment;->mExpTitle:Landroid/widget/TextView;

    iget-object v0, p0, Lcom/motorola/ccc/ota/ui/RestartFragment;->rootView:Landroid/view/View;

    const v1, 0x7f0900b9

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/ExpandableListView;

    iput-object v0, p0, Lcom/motorola/ccc/ota/ui/RestartFragment;->expandableListView:Landroid/widget/ExpandableListView;

    iget-object v0, p0, Lcom/motorola/ccc/ota/ui/RestartFragment;->rootView:Landroid/view/View;

    const v1, 0x7f090116

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p0, Lcom/motorola/ccc/ota/ui/RestartFragment;->osReleaseNotes:Landroid/widget/TextView;

    iget-object v0, p0, Lcom/motorola/ccc/ota/ui/RestartFragment;->rootView:Landroid/view/View;

    const v1, 0x7f0900e8

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p0, Lcom/motorola/ccc/ota/ui/RestartFragment;->mInstructionTitle:Landroid/widget/TextView;

    iget-object v0, p0, Lcom/motorola/ccc/ota/ui/RestartFragment;->rootView:Landroid/view/View;

    const v1, 0x7f0900e7

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/LinearLayout;

    iput-object v0, p0, Lcom/motorola/ccc/ota/ui/RestartFragment;->mInstructionLayout:Landroid/widget/LinearLayout;

    iget-object v0, p0, Lcom/motorola/ccc/ota/ui/RestartFragment;->rootView:Landroid/view/View;

    const v1, 0x7f0900e0

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/ImageView;

    iput-object v0, p0, Lcom/motorola/ccc/ota/ui/RestartFragment;->imgBack:Landroid/widget/ImageView;

    return-void
.end method

.method private getRestartWarningText()Ljava/lang/String;
    .locals 7

    iget-object v0, p0, Lcom/motorola/ccc/ota/ui/RestartFragment;->settings:Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    sget-object v1, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->RESTART_EXPIRY_TIMER:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    const-wide/16 v2, -0x1

    invoke-virtual {v0, v1, v2, v3}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->getLong(Lcom/motorola/otalib/common/settings/ISetting;J)J

    move-result-wide v0

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v2

    const-wide/16 v4, 0x0

    cmp-long v4, v0, v4

    const-wide/16 v5, 0xf

    if-lez v4, :cond_0

    cmp-long v4, v0, v2

    if-gez v4, :cond_0

    sub-long/2addr v2, v0

    const-wide/32 v0, 0x5265c00

    div-long/2addr v2, v0

    add-long/2addr v2, v5

    long-to-int v0, v2

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    iget-object v1, p0, Lcom/motorola/ccc/ota/ui/RestartFragment;->context:Landroid/content/Context;

    const v2, 0x7f0e0005

    invoke-virtual {v1, v2}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v1

    int-to-long v2, v0

    cmp-long v2, v2, v5

    if-lez v2, :cond_1

    iget-object p0, p0, Lcom/motorola/ccc/ota/ui/RestartFragment;->context:Landroid/content/Context;

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    filled-new-array {v0}, [Ljava/lang/Object;

    move-result-object v0

    const v1, 0x7f0e0004

    invoke-virtual {p0, v1, v0}, Landroid/content/Context;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    :cond_1
    return-object v1
.end method

.method private getTargetIntent(Landroid/content/Intent;)Landroid/content/Intent;
    .locals 2

    iget-object p0, p0, Lcom/motorola/ccc/ota/ui/RestartFragment;->settings:Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    sget-object v0, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->METADATA:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    invoke-virtual {p0, v0}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->getString(Lcom/motorola/otalib/common/settings/ISetting;)Ljava/lang/String;

    move-result-object p0

    const-string v0, "com.motorola.blur.service.blur.upgrade.version"

    invoke-virtual {p1, v0}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    const-string v1, "com.motorola.blur.service.blur.upgrade.location_type"

    invoke-virtual {p1, v1}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    invoke-static {p0, v0, p1}, Lcom/motorola/ccc/ota/utils/UpgradeUtilMethods;->getStartRestartActivityIntent(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    move-result-object p0

    return-object p0
.end method

.method private handleButtons()V
    .locals 2

    iget-object v0, p0, Lcom/motorola/ccc/ota/ui/RestartFragment;->mRebootNow:Landroid/widget/Button;

    new-instance v1, Lcom/motorola/ccc/ota/ui/RestartFragment$1;

    invoke-direct {v1, p0}, Lcom/motorola/ccc/ota/ui/RestartFragment$1;-><init>(Lcom/motorola/ccc/ota/ui/RestartFragment;)V

    invoke-virtual {v0, v1}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    iget-object v0, p0, Lcom/motorola/ccc/ota/ui/RestartFragment;->mRebootLater:Landroid/widget/Button;

    new-instance v1, Lcom/motorola/ccc/ota/ui/RestartFragment$2;

    invoke-direct {v1, p0}, Lcom/motorola/ccc/ota/ui/RestartFragment$2;-><init>(Lcom/motorola/ccc/ota/ui/RestartFragment;)V

    invoke-virtual {v0, v1}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    iget-object v0, p0, Lcom/motorola/ccc/ota/ui/RestartFragment;->mRestartCancel:Landroid/widget/Button;

    new-instance v1, Lcom/motorola/ccc/ota/ui/RestartFragment$3;

    invoke-direct {v1, p0}, Lcom/motorola/ccc/ota/ui/RestartFragment$3;-><init>(Lcom/motorola/ccc/ota/ui/RestartFragment;)V

    invoke-virtual {v0, v1}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    iget-object v0, p0, Lcom/motorola/ccc/ota/ui/RestartFragment;->imgBack:Landroid/widget/ImageView;

    new-instance v1, Lcom/motorola/ccc/ota/ui/RestartFragment$4;

    invoke-direct {v1, p0}, Lcom/motorola/ccc/ota/ui/RestartFragment$4;-><init>(Lcom/motorola/ccc/ota/ui/RestartFragment;)V

    invoke-virtual {v0, v1}, Landroid/widget/ImageView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    return-void
.end method

.method private handleCriticalUpdateExtendRestart()V
    .locals 3

    invoke-direct {p0}, Lcom/motorola/ccc/ota/ui/RestartFragment;->stopRestartTimer()V

    iget-object v0, p0, Lcom/motorola/ccc/ota/ui/RestartFragment;->mCriticalUpdate:Lcom/motorola/ccc/ota/ui/CriticalUpdate;

    const-wide/32 v1, 0x36ee80

    invoke-virtual {v0, v1, v2}, Lcom/motorola/ccc/ota/ui/CriticalUpdate;->setExtendRestartTime(J)V

    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/motorola/ccc/ota/ui/RestartFragment;->mDoNotShowNotification:Z

    invoke-direct {p0}, Lcom/motorola/ccc/ota/ui/RestartFragment;->initializeViewAndSaveNextPrompt()V

    iget-object v0, p0, Lcom/motorola/ccc/ota/ui/RestartFragment;->context:Landroid/content/Context;

    iget-object v1, p0, Lcom/motorola/ccc/ota/ui/RestartFragment;->mCriticalUpdate:Lcom/motorola/ccc/ota/ui/CriticalUpdate;

    invoke-virtual {v1}, Lcom/motorola/ccc/ota/ui/CriticalUpdate;->getExtendRestartTime()J

    move-result-wide v1

    invoke-static {v0, v1, v2}, Lcom/motorola/ccc/ota/utils/DateFormatUtils;->getCalendarString(Landroid/content/Context;J)Ljava/lang/String;

    move-result-object v1

    filled-new-array {v1}, [Ljava/lang/Object;

    move-result-object v1

    const v2, 0x7f0e00a9

    invoke-virtual {v0, v2, v1}, Landroid/content/Context;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    invoke-direct {p0, v0}, Lcom/motorola/ccc/ota/ui/RestartFragment;->showRestartPostponedDialog(Ljava/lang/String;)V

    return-void
.end method

.method private handleRestartCancelOrPostponeToNextDay()V
    .locals 4

    iget-object v0, p0, Lcom/motorola/ccc/ota/ui/RestartFragment;->settings:Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    invoke-static {v0}, Lcom/motorola/ccc/ota/utils/SmartUpdateUtils;->isSmartUpdateEnabledByUser(Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;)Z

    move-result v0

    const/4 v1, 0x1

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/motorola/ccc/ota/ui/RestartFragment;->settings:Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    sget-object v2, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->STATS_SMART_UPDATE_DEFERRED_ON_RESTART:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    invoke-virtual {v0, v2}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->incrementPrefs(Lcom/motorola/otalib/common/settings/ISetting;)V

    iget-object v0, p0, Lcom/motorola/ccc/ota/ui/RestartFragment;->settings:Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    invoke-static {v0, v1}, Lcom/motorola/ccc/ota/utils/SmartUpdateUtils;->settingInstallTimeIntervalForSmartUpdate(Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;Z)V

    :cond_0
    invoke-direct {p0}, Lcom/motorola/ccc/ota/ui/RestartFragment;->stopRestartTimer()V

    invoke-direct {p0}, Lcom/motorola/ccc/ota/ui/RestartFragment;->initializeViewAndSaveNextPrompt()V

    sget-object v0, Lcom/motorola/ccc/ota/ui/UpdaterUtils$InternalUpdateType;->DEFAULT_UPDATE:Lcom/motorola/ccc/ota/ui/UpdaterUtils$InternalUpdateType;

    iget-object v2, p0, Lcom/motorola/ccc/ota/ui/RestartFragment;->mUpgradeInfo:Lcom/motorola/ccc/ota/ui/UpdaterUtils$UpgradeInfo;

    invoke-static {v2}, Lcom/motorola/ccc/ota/ui/UpdaterUtils;->getInternalUpdateType(Lcom/motorola/ccc/ota/ui/UpdaterUtils$UpgradeInfo;)Lcom/motorola/ccc/ota/ui/UpdaterUtils$InternalUpdateType;

    move-result-object v2

    if-eq v0, v2, :cond_1

    sget-object v0, Lcom/motorola/ccc/ota/ui/UpdaterUtils$InternalUpdateType;->FORCE_UPDATE:Lcom/motorola/ccc/ota/ui/UpdaterUtils$InternalUpdateType;

    iget-object v2, p0, Lcom/motorola/ccc/ota/ui/RestartFragment;->mUpgradeInfo:Lcom/motorola/ccc/ota/ui/UpdaterUtils$UpgradeInfo;

    invoke-static {v2}, Lcom/motorola/ccc/ota/ui/UpdaterUtils;->getInternalUpdateType(Lcom/motorola/ccc/ota/ui/UpdaterUtils$UpgradeInfo;)Lcom/motorola/ccc/ota/ui/UpdaterUtils$InternalUpdateType;

    move-result-object v2

    if-eq v0, v2, :cond_1

    iget-object v0, p0, Lcom/motorola/ccc/ota/ui/RestartFragment;->context:Landroid/content/Context;

    iget-wide v2, p0, Lcom/motorola/ccc/ota/ui/RestartFragment;->mNextPrompt:J

    invoke-static {v0, v2, v3}, Lcom/motorola/ccc/ota/utils/DateFormatUtils;->getCalendarString(Landroid/content/Context;J)Ljava/lang/String;

    move-result-object v2

    filled-new-array {v2}, [Ljava/lang/Object;

    move-result-object v2

    const v3, 0x7f0e018a

    invoke-virtual {p0, v3, v2}, Lcom/motorola/ccc/ota/ui/RestartFragment;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p0

    invoke-static {v0, p0, v1}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object p0

    invoke-virtual {p0}, Landroid/widget/Toast;->show()V

    :cond_1
    return-void
.end method

.method private initViewForCriticalUpdate()V
    .locals 5

    invoke-virtual {p0}, Lcom/motorola/ccc/ota/ui/RestartFragment;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    const v1, 0x7f0e00ac

    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v0

    invoke-direct {p0, v0}, Lcom/motorola/ccc/ota/ui/RestartFragment;->setTextViewTitle(Ljava/lang/String;)V

    iget-object v0, p0, Lcom/motorola/ccc/ota/ui/RestartFragment;->mCriticalUpdate:Lcom/motorola/ccc/ota/ui/CriticalUpdate;

    iget-object v1, p0, Lcom/motorola/ccc/ota/ui/RestartFragment;->context:Landroid/content/Context;

    invoke-virtual {v0, v1}, Lcom/motorola/ccc/ota/ui/CriticalUpdate;->getMaxUpdateCalendarString(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v0

    iget-object v1, p0, Lcom/motorola/ccc/ota/ui/RestartFragment;->mAbRestartCriticalPrompt:Landroid/widget/TextView;

    const/4 v2, 0x0

    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setVisibility(I)V

    iget-object v1, p0, Lcom/motorola/ccc/ota/ui/RestartFragment;->mCriticalUpdate:Lcom/motorola/ccc/ota/ui/CriticalUpdate;

    invoke-virtual {v1}, Lcom/motorola/ccc/ota/ui/CriticalUpdate;->isCriticalUpdateTimerExpired()Z

    move-result v1

    const v2, 0x7f0e00aa

    if-eqz v1, :cond_1

    iget-object v0, p0, Lcom/motorola/ccc/ota/ui/RestartFragment;->mCriticalUpdate:Lcom/motorola/ccc/ota/ui/CriticalUpdate;

    invoke-virtual {v0}, Lcom/motorola/ccc/ota/ui/CriticalUpdate;->isOutsideCriticalUpdateExtendedTime()Z

    move-result v0

    if-nez v0, :cond_0

    iget-object v0, p0, Lcom/motorola/ccc/ota/ui/RestartFragment;->mCriticalUpdate:Lcom/motorola/ccc/ota/ui/CriticalUpdate;

    invoke-virtual {v0}, Lcom/motorola/ccc/ota/ui/CriticalUpdate;->getExtendRestartTime()J

    move-result-wide v0

    iget-object v3, p0, Lcom/motorola/ccc/ota/ui/RestartFragment;->context:Landroid/content/Context;

    invoke-static {v3, v0, v1}, Lcom/motorola/ccc/ota/utils/DateFormatUtils;->getCalendarString(Landroid/content/Context;J)Ljava/lang/String;

    move-result-object v0

    iget-object v1, p0, Lcom/motorola/ccc/ota/ui/RestartFragment;->mAbRestartCriticalPrompt:Landroid/widget/TextView;

    invoke-virtual {p0}, Lcom/motorola/ccc/ota/ui/RestartFragment;->getResources()Landroid/content/res/Resources;

    move-result-object v3

    filled-new-array {v0}, [Ljava/lang/Object;

    move-result-object v0

    invoke-virtual {v3, v2, v0}, Landroid/content/res/Resources;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v1, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    goto :goto_0

    :cond_0
    iget-object v0, p0, Lcom/motorola/ccc/ota/ui/RestartFragment;->mAbRestartCriticalPrompt:Landroid/widget/TextView;

    invoke-virtual {p0}, Lcom/motorola/ccc/ota/ui/RestartFragment;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    const v2, 0x7f0e0109

    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    goto :goto_0

    :cond_1
    iget-object v1, p0, Lcom/motorola/ccc/ota/ui/RestartFragment;->mAbRestartCriticalPrompt:Landroid/widget/TextView;

    invoke-virtual {p0}, Lcom/motorola/ccc/ota/ui/RestartFragment;->getResources()Landroid/content/res/Resources;

    move-result-object v3

    filled-new-array {v0}, [Ljava/lang/Object;

    move-result-object v0

    invoke-virtual {v3, v2, v0}, Landroid/content/res/Resources;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v1, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    :goto_0
    iget-object v0, p0, Lcom/motorola/ccc/ota/ui/RestartFragment;->mCriticalUpdate:Lcom/motorola/ccc/ota/ui/CriticalUpdate;

    iget-object v1, p0, Lcom/motorola/ccc/ota/ui/RestartFragment;->context:Landroid/content/Context;

    invoke-virtual {v0, v1}, Lcom/motorola/ccc/ota/ui/CriticalUpdate;->shouldDisplayPopUp(Landroid/content/Context;)Z

    move-result v0

    if-eqz v0, :cond_3

    iget-object v0, p0, Lcom/motorola/ccc/ota/ui/RestartFragment;->mAlert:Landroidx/appcompat/app/AlertDialog;

    if-eqz v0, :cond_2

    invoke-virtual {v0}, Landroidx/appcompat/app/AlertDialog;->isShowing()Z

    move-result v0

    if-eqz v0, :cond_2

    iget-object v0, p0, Lcom/motorola/ccc/ota/ui/RestartFragment;->mAlert:Landroidx/appcompat/app/AlertDialog;

    invoke-virtual {v0}, Landroidx/appcompat/app/AlertDialog;->dismiss()V

    :cond_2
    invoke-virtual {p0}, Lcom/motorola/ccc/ota/ui/RestartFragment;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    iget-object v1, p0, Lcom/motorola/ccc/ota/ui/RestartFragment;->mCriticalUpdate:Lcom/motorola/ccc/ota/ui/CriticalUpdate;

    iget-object v2, p0, Lcom/motorola/ccc/ota/ui/RestartFragment;->context:Landroid/content/Context;

    invoke-virtual {v1, v2}, Lcom/motorola/ccc/ota/ui/CriticalUpdate;->getMaxUpdateCalendarString(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v1

    filled-new-array {v1}, [Ljava/lang/Object;

    move-result-object v1

    const v2, 0x7f0e00a9

    invoke-virtual {v0, v2, v1}, Landroid/content/res/Resources;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    iget-object v1, p0, Lcom/motorola/ccc/ota/ui/RestartFragment;->mCriticalUpdate:Lcom/motorola/ccc/ota/ui/CriticalUpdate;

    iget-object v2, p0, Lcom/motorola/ccc/ota/ui/RestartFragment;->context:Landroid/content/Context;

    invoke-virtual {p0}, Lcom/motorola/ccc/ota/ui/RestartFragment;->getResources()Landroid/content/res/Resources;

    move-result-object v3

    const v4, 0x7f0e0176

    invoke-virtual {v3, v4}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v1, v2, v3, v0}, Lcom/motorola/ccc/ota/ui/CriticalUpdate;->buildPopUp(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)Landroidx/appcompat/app/AlertDialog;

    move-result-object v0

    iput-object v0, p0, Lcom/motorola/ccc/ota/ui/RestartFragment;->mAlert:Landroidx/appcompat/app/AlertDialog;

    invoke-virtual {v0}, Landroidx/appcompat/app/AlertDialog;->show()V

    :cond_3
    return-void
.end method

.method private initViewForFOTAUpgrade()V
    .locals 7

    iget-object v0, p0, Lcom/motorola/ccc/ota/ui/RestartFragment;->mRebootLater:Landroid/widget/Button;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/widget/Button;->setVisibility(I)V

    iget-object v0, p0, Lcom/motorola/ccc/ota/ui/RestartFragment;->mEmergencyCallText:Landroid/widget/TextView;

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setVisibility(I)V

    iget-object v0, p0, Lcom/motorola/ccc/ota/ui/RestartFragment;->settings:Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    sget-object v2, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->MAX_CRITICAL_UPDATE_DEFER_TIME:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    const-wide/16 v3, -0x1

    invoke-virtual {v0, v2, v3, v4}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->getLong(Lcom/motorola/otalib/common/settings/ISetting;J)J

    move-result-wide v5

    cmp-long v0, v5, v3

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/motorola/ccc/ota/ui/RestartFragment;->context:Landroid/content/Context;

    invoke-static {v0}, Lcom/motorola/ccc/ota/utils/CusUtilMethods;->isItFirstNetOnFota(Landroid/content/Context;)Z

    move-result v0

    if-nez v0, :cond_0

    iget-object v0, p0, Lcom/motorola/ccc/ota/ui/RestartFragment;->mAbRestartCriticalPrompt:Landroid/widget/TextView;

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setVisibility(I)V

    iget-object v0, p0, Lcom/motorola/ccc/ota/ui/RestartFragment;->mAbRestartCriticalPrompt:Landroid/widget/TextView;

    invoke-virtual {p0}, Lcom/motorola/ccc/ota/ui/RestartFragment;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    iget-object p0, p0, Lcom/motorola/ccc/ota/ui/RestartFragment;->context:Landroid/content/Context;

    invoke-static {p0, v5, v6}, Lcom/motorola/ccc/ota/utils/DateFormatUtils;->getCalendarString(Landroid/content/Context;J)Ljava/lang/String;

    move-result-object p0

    filled-new-array {p0}, [Ljava/lang/Object;

    move-result-object p0

    const v2, 0x7f0e00aa

    invoke-virtual {v1, v2, p0}, Landroid/content/res/Resources;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p0

    invoke-virtual {v0, p0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    :cond_0
    return-void
.end method

.method private initViewForForceUpdate()V
    .locals 6

    iget-object v0, p0, Lcom/motorola/ccc/ota/ui/RestartFragment;->mAbRestartCriticalPrompt:Landroid/widget/TextView;

    invoke-virtual {p0}, Lcom/motorola/ccc/ota/ui/RestartFragment;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    iget-object v2, p0, Lcom/motorola/ccc/ota/ui/RestartFragment;->settings:Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    sget-object v3, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->MAX_FORCE_INSTALL_DEFER_TIME:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    const-wide/16 v4, -0x1

    invoke-virtual {v2, v3, v4, v5}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->getLong(Lcom/motorola/otalib/common/settings/ISetting;J)J

    move-result-wide v2

    invoke-static {v2, v3}, Lcom/motorola/ccc/ota/utils/DateFormatUtils;->getCalendarDate(J)Ljava/lang/String;

    move-result-object v2

    filled-new-array {v2}, [Ljava/lang/Object;

    move-result-object v2

    const v3, 0x7f0e0104

    invoke-virtual {v1, v3, v2}, Landroid/content/res/Resources;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    iget-object p0, p0, Lcom/motorola/ccc/ota/ui/RestartFragment;->mAbRestartCriticalPrompt:Landroid/widget/TextView;

    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Landroid/widget/TextView;->setVisibility(I)V

    return-void
.end method

.method private initViewForSmartUpdate()V
    .locals 6

    iget-object v0, p0, Lcom/motorola/ccc/ota/ui/RestartFragment;->mAbRestartCriticalPrompt:Landroid/widget/TextView;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setVisibility(I)V

    iget-object v0, p0, Lcom/motorola/ccc/ota/ui/RestartFragment;->mAbRestartCriticalPrompt:Landroid/widget/TextView;

    invoke-virtual {p0}, Lcom/motorola/ccc/ota/ui/RestartFragment;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    invoke-virtual {p0}, Lcom/motorola/ccc/ota/ui/RestartFragment;->getContext()Landroid/content/Context;

    move-result-object v2

    iget-object p0, p0, Lcom/motorola/ccc/ota/ui/RestartFragment;->settings:Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    sget-object v3, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->SMART_UPDATE_MIN_INSTALL_TIME:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    const-wide/16 v4, -0x1

    invoke-virtual {p0, v3, v4, v5}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->getLong(Lcom/motorola/otalib/common/settings/ISetting;J)J

    move-result-wide v3

    invoke-static {v2, v3, v4}, Lcom/motorola/ccc/ota/utils/DateFormatUtils;->getCalendarString(Landroid/content/Context;J)Ljava/lang/String;

    move-result-object p0

    filled-new-array {p0}, [Ljava/lang/Object;

    move-result-object p0

    const v2, 0x7f0e018d

    invoke-virtual {v1, v2, p0}, Landroid/content/res/Resources;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p0

    invoke-virtual {v0, p0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    return-void
.end method

.method private initializeView()V
    .locals 2

    iget-object v0, p0, Lcom/motorola/ccc/ota/ui/RestartFragment;->mAbRestartCriticalPrompt:Landroid/widget/TextView;

    const/16 v1, 0x8

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setVisibility(I)V

    iget-object v0, p0, Lcom/motorola/ccc/ota/ui/RestartFragment;->mCriticalUpdate:Lcom/motorola/ccc/ota/ui/CriticalUpdate;

    invoke-virtual {v0}, Lcom/motorola/ccc/ota/ui/CriticalUpdate;->isCriticalUpdate()Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-static {}, Lcom/motorola/ccc/ota/utils/BuildPropReader;->isATT()Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-direct {p0}, Lcom/motorola/ccc/ota/ui/RestartFragment;->initViewForFOTAUpgrade()V

    return-void

    :cond_0
    sget-boolean v0, Lcom/motorola/ccc/ota/ui/RestartFragment;->isTimerRunning:Z

    if-eqz v0, :cond_1

    return-void

    :cond_1
    sget-object v0, Lcom/motorola/ccc/ota/ui/RestartFragment$6;->$SwitchMap$com$motorola$ccc$ota$ui$UpdaterUtils$InternalUpdateType:[I

    iget-object v1, p0, Lcom/motorola/ccc/ota/ui/RestartFragment;->mUpgradeInfo:Lcom/motorola/ccc/ota/ui/UpdaterUtils$UpgradeInfo;

    invoke-static {v1}, Lcom/motorola/ccc/ota/ui/UpdaterUtils;->getInternalUpdateType(Lcom/motorola/ccc/ota/ui/UpdaterUtils$UpgradeInfo;)Lcom/motorola/ccc/ota/ui/UpdaterUtils$InternalUpdateType;

    move-result-object v1

    invoke-virtual {v1}, Lcom/motorola/ccc/ota/ui/UpdaterUtils$InternalUpdateType;->ordinal()I

    move-result v1

    aget v0, v0, v1

    const/4 v1, 0x1

    if-eq v0, v1, :cond_4

    const/4 v1, 0x2

    if-eq v0, v1, :cond_3

    const/4 v1, 0x3

    if-eq v0, v1, :cond_2

    goto :goto_0

    :cond_2
    invoke-direct {p0}, Lcom/motorola/ccc/ota/ui/RestartFragment;->initViewForSmartUpdate()V

    goto :goto_0

    :cond_3
    invoke-direct {p0}, Lcom/motorola/ccc/ota/ui/RestartFragment;->initViewForForceUpdate()V

    goto :goto_0

    :cond_4
    invoke-direct {p0}, Lcom/motorola/ccc/ota/ui/RestartFragment;->initViewForCriticalUpdate()V

    :goto_0
    return-void
.end method

.method private initializeViewAndSaveNextPrompt()V
    .locals 7

    iget-object v0, p0, Lcom/motorola/ccc/ota/ui/RestartFragment;->mUpgradeInfo:Lcom/motorola/ccc/ota/ui/UpdaterUtils$UpgradeInfo;

    iget v1, p0, Lcom/motorola/ccc/ota/ui/RestartFragment;->mPromptCount:I

    invoke-static {v0, v1}, Lcom/motorola/ccc/ota/ui/UpdaterUtils;->getNextPromptForActivity(Lcom/motorola/ccc/ota/ui/UpdaterUtils$UpgradeInfo;I)J

    move-result-wide v0

    iput-wide v0, p0, Lcom/motorola/ccc/ota/ui/RestartFragment;->mNextPrompt:J

    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "initializeViewAndSaveNextPrompt:isTimerRunning="

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    sget-boolean v1, Lcom/motorola/ccc/ota/ui/RestartFragment;->isTimerRunning:Z

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    const-string v1, "OtaApp"

    invoke-static {v1, v0}, Lcom/motorola/ccc/ota/utils/Logger;->debug(Ljava/lang/String;Ljava/lang/String;)V

    sget-boolean v0, Lcom/motorola/ccc/ota/ui/RestartFragment;->isTimerRunning:Z

    if-nez v0, :cond_0

    iget-object v0, p0, Lcom/motorola/ccc/ota/ui/RestartFragment;->settings:Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    iget-object v2, p0, Lcom/motorola/ccc/ota/ui/RestartFragment;->mUpgradeInfo:Lcom/motorola/ccc/ota/ui/UpdaterUtils$UpgradeInfo;

    invoke-static {v0, v2}, Lcom/motorola/ccc/ota/utils/SmartUpdateUtils;->getTimerValue(Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;Lcom/motorola/ccc/ota/ui/UpdaterUtils$UpgradeInfo;)I

    move-result v0

    sput v0, Lcom/motorola/ccc/ota/ui/RestartFragment;->INSTALL_COUNTDOWN_IN_SECONDS:I

    :cond_0
    invoke-direct {p0}, Lcom/motorola/ccc/ota/ui/RestartFragment;->initializeView()V

    iget-object v0, p0, Lcom/motorola/ccc/ota/ui/RestartFragment;->mUpgradeInfo:Lcom/motorola/ccc/ota/ui/UpdaterUtils$UpgradeInfo;

    invoke-direct {p0, v0}, Lcom/motorola/ccc/ota/ui/RestartFragment;->isAutoUpdateTimerExpired(Lcom/motorola/ccc/ota/ui/UpdaterUtils$UpgradeInfo;)Z

    move-result v0

    if-eqz v0, :cond_1

    invoke-direct {p0}, Lcom/motorola/ccc/ota/ui/RestartFragment;->showNormalUIForRestartTimer()V

    return-void

    :cond_1
    new-instance v0, Ljava/lang/StringBuilder;

    const-string v2, "Next restart reminder at status bar scheduled in: "

    invoke-direct {v0, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    sget-object v2, Ljava/util/concurrent/TimeUnit;->MILLISECONDS:Ljava/util/concurrent/TimeUnit;

    iget-wide v3, p0, Lcom/motorola/ccc/ota/ui/RestartFragment;->mNextPrompt:J

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v5

    sub-long/2addr v3, v5

    invoke-virtual {v2, v3, v4}, Ljava/util/concurrent/TimeUnit;->toMinutes(J)J

    move-result-wide v2

    invoke-virtual {v0, v2, v3}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v2, " mins"

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v1, v0}, Lcom/motorola/ccc/ota/utils/Logger;->debug(Ljava/lang/String;Ljava/lang/String;)V

    iget-object v0, p0, Lcom/motorola/ccc/ota/ui/RestartFragment;->mAlarmManager:Landroid/app/AlarmManager;

    iget-object v1, p0, Lcom/motorola/ccc/ota/ui/RestartFragment;->mPendingIntent:Landroid/app/PendingIntent;

    invoke-virtual {v0, v1}, Landroid/app/AlarmManager;->cancel(Landroid/app/PendingIntent;)V

    iget-object v0, p0, Lcom/motorola/ccc/ota/ui/RestartFragment;->mAlarmManager:Landroid/app/AlarmManager;

    iget-wide v1, p0, Lcom/motorola/ccc/ota/ui/RestartFragment;->mNextPrompt:J

    iget-object v3, p0, Lcom/motorola/ccc/ota/ui/RestartFragment;->mPendingIntent:Landroid/app/PendingIntent;

    const/4 v4, 0x0

    invoke-virtual {v0, v4, v1, v2, v3}, Landroid/app/AlarmManager;->setExactAndAllowWhileIdle(IJLandroid/app/PendingIntent;)V

    iget-wide v0, p0, Lcom/motorola/ccc/ota/ui/RestartFragment;->mNextPrompt:J

    invoke-static {v0, v1}, Lcom/motorola/ccc/ota/ui/UpdaterUtils;->saveNextPrompt(J)V

    return-void
.end method

.method private isAutoUpdateTimerExpired(Lcom/motorola/ccc/ota/ui/UpdaterUtils$UpgradeInfo;)Z
    .locals 9

    sget-boolean v0, Lcom/motorola/ccc/ota/ui/RestartFragment;->isTimerRunning:Z

    const/4 v1, 0x1

    if-eqz v0, :cond_0

    return v1

    :cond_0
    iget-object v0, p0, Lcom/motorola/ccc/ota/ui/RestartFragment;->settings:Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    iget-object v2, p0, Lcom/motorola/ccc/ota/ui/RestartFragment;->mUpgradeInfo:Lcom/motorola/ccc/ota/ui/UpdaterUtils$UpgradeInfo;

    invoke-static {v0, v2}, Lcom/motorola/ccc/ota/utils/SmartUpdateUtils;->isSmartUpdateTimerExpired(Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;Lcom/motorola/ccc/ota/ui/UpdaterUtils$UpgradeInfo;)Z

    move-result v0

    const/4 v2, 0x0

    if-eqz v0, :cond_2

    iget-object p1, p0, Lcom/motorola/ccc/ota/ui/RestartFragment;->settings:Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    sget-object v0, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->SMART_UPDATE_MAX_INSTALL_TIME:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    const-wide/16 v3, -0x1

    invoke-virtual {p1, v0, v3, v4}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->getLong(Lcom/motorola/otalib/common/settings/ISetting;J)J

    move-result-wide v5

    const-wide/16 v7, 0x0

    cmp-long p1, v5, v7

    if-lez p1, :cond_1

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v5

    iget-object p1, p0, Lcom/motorola/ccc/ota/ui/RestartFragment;->settings:Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    sget-object v0, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->SMART_UPDATE_MAX_INSTALL_TIME:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    invoke-virtual {p1, v0, v3, v4}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->getLong(Lcom/motorola/otalib/common/settings/ISetting;J)J

    move-result-wide v3

    cmp-long p1, v5, v3

    if-ltz p1, :cond_1

    iget-object p1, p0, Lcom/motorola/ccc/ota/ui/RestartFragment;->settings:Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    invoke-static {p1}, Lcom/motorola/ccc/ota/utils/SmartUpdateUtils;->settingInstallTimeIntervalForSmartUpdate(Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;)V

    invoke-direct {p0}, Lcom/motorola/ccc/ota/ui/RestartFragment;->initializeView()V

    const-string p0, "OtaApp"

    const-string p1, "Oh..now it\'s beyond of smart update max time, so scheduling to next day smart update selected time slot"

    invoke-static {p0, p1}, Lcom/motorola/ccc/ota/utils/Logger;->debug(Ljava/lang/String;Ljava/lang/String;)V

    return v2

    :cond_1
    const-string p0, "installedViaSmartUpdate"

    invoke-static {p0}, Lcom/motorola/ccc/ota/ui/UpdaterUtils;->sendInstallModeStats(Ljava/lang/String;)V

    return v1

    :cond_2
    new-instance v0, Lcom/motorola/ccc/ota/ui/CriticalUpdate;

    invoke-direct {v0, p1}, Lcom/motorola/ccc/ota/ui/CriticalUpdate;-><init>(Lcom/motorola/ccc/ota/ui/UpdaterUtils$UpgradeInfo;)V

    invoke-virtual {v0}, Lcom/motorola/ccc/ota/ui/CriticalUpdate;->isCriticalUpdateTimerExpired()Z

    move-result p1

    if-eqz p1, :cond_4

    iget-object p0, p0, Lcom/motorola/ccc/ota/ui/RestartFragment;->mCriticalUpdate:Lcom/motorola/ccc/ota/ui/CriticalUpdate;

    invoke-virtual {p0}, Lcom/motorola/ccc/ota/ui/CriticalUpdate;->isOutsideCriticalUpdateExtendedTime()Z

    move-result p0

    if-nez p0, :cond_3

    return v2

    :cond_3
    return v1

    :cond_4
    return v2
.end method

.method static synthetic lambda$showRestartPostponedDialog$1(Landroid/app/Dialog;Landroid/view/View;)V
    .locals 0

    invoke-virtual {p0}, Landroid/app/Dialog;->cancel()V

    return-void
.end method

.method private proceedWithReboot()V
    .locals 4

    iget-object v0, p0, Lcom/motorola/ccc/ota/ui/RestartFragment;->context:Landroid/content/Context;

    invoke-static {v0}, Lcom/motorola/ccc/ota/ui/UpdaterUtils;->isPriorityAppRunning(Landroid/content/Context;)Z

    move-result v0

    const-string v1, "Restart"

    const/4 v2, 0x1

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/motorola/ccc/ota/ui/RestartFragment;->context:Landroid/content/Context;

    iget-object v3, p0, Lcom/motorola/ccc/ota/ui/RestartFragment;->activityIntent:Landroid/content/Intent;

    invoke-static {v0, v1, v3, v2}, Lcom/motorola/ccc/ota/ui/UpdaterUtils;->priorityAppRunningPostponeActivity(Landroid/content/Context;Ljava/lang/String;Landroid/content/Intent;Z)V

    goto :goto_0

    :cond_0
    iget-object v0, p0, Lcom/motorola/ccc/ota/ui/RestartFragment;->context:Landroid/content/Context;

    invoke-static {v0, v1}, Lcom/motorola/ccc/ota/ui/UpdaterUtils;->isPromptAllowed(Landroid/content/Context;Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_1

    const-string v0, "OtaApp"

    const-string v1, "OTA restart accepted by user!"

    invoke-static {v0, v1}, Lcom/motorola/ccc/ota/utils/Logger;->info(Ljava/lang/String;Ljava/lang/String;)V

    iput-boolean v2, p0, Lcom/motorola/ccc/ota/ui/RestartFragment;->mDoNotShowNotification:Z

    iget-object v0, p0, Lcom/motorola/ccc/ota/ui/RestartFragment;->mAlarmManager:Landroid/app/AlarmManager;

    iget-object v1, p0, Lcom/motorola/ccc/ota/ui/RestartFragment;->mPendingIntent:Landroid/app/PendingIntent;

    invoke-virtual {v0, v1}, Landroid/app/AlarmManager;->cancel(Landroid/app/PendingIntent;)V

    iget-object v0, p0, Lcom/motorola/ccc/ota/ui/RestartFragment;->activityIntent:Landroid/content/Intent;

    const-string v1, "com.motorola.blur.service.blur.upgrade.version"

    invoke-virtual {v0, v1}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    iget-object v1, p0, Lcom/motorola/ccc/ota/ui/RestartFragment;->context:Landroid/content/Context;

    invoke-static {}, Lcom/motorola/ccc/ota/ui/UpdaterUtils;->getInstallModeStats()Ljava/lang/String;

    move-result-object v3

    invoke-static {v1, v0, v2, v3}, Lcom/motorola/ccc/ota/utils/UpgradeUtilMethods;->sendUpgradeLaunchProceed(Landroid/content/Context;Ljava/lang/String;ZLjava/lang/String;)V

    :cond_1
    :goto_0
    iget-object v0, p0, Lcom/motorola/ccc/ota/ui/RestartFragment;->settings:Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    invoke-static {v0}, Lcom/motorola/ccc/ota/utils/NotificationUtils;->clearNextPromptDetails(Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;)V

    const/4 v0, 0x0

    sput-object v0, Lcom/motorola/ccc/ota/ui/RestartFragment;->mPreInstallCounter:Lcom/motorola/ccc/ota/ui/RestartFragment$PreInstallCounter;

    iget-object p0, p0, Lcom/motorola/ccc/ota/ui/RestartFragment;->activity:Landroid/app/Activity;

    invoke-virtual {p0}, Landroid/app/Activity;->finish()V

    return-void
.end method

.method private refreshOrStartInstallCounter()V
    .locals 8

    sget-object v0, Lcom/motorola/ccc/ota/ui/RestartFragment;->mPreInstallCounter:Lcom/motorola/ccc/ota/ui/RestartFragment$PreInstallCounter;

    if-eqz v0, :cond_0

    iget-object p0, p0, Lcom/motorola/ccc/ota/ui/RestartFragment;->mWarningText:Landroid/widget/TextView;

    invoke-virtual {v0, p0}, Lcom/motorola/ccc/ota/ui/RestartFragment$PreInstallCounter;->refreshUI(Landroid/widget/TextView;)V

    goto :goto_0

    :cond_0
    new-instance v0, Lcom/motorola/ccc/ota/ui/RestartFragment$PreInstallCounter;

    sget v1, Lcom/motorola/ccc/ota/ui/RestartFragment;->INSTALL_COUNTDOWN_IN_SECONDS:I

    mul-int/lit16 v1, v1, 0x3e8

    int-to-long v3, v1

    const-wide/16 v5, 0x3e8

    iget-object v7, p0, Lcom/motorola/ccc/ota/ui/RestartFragment;->mWarningText:Landroid/widget/TextView;

    move-object v1, v0

    move-object v2, p0

    invoke-direct/range {v1 .. v7}, Lcom/motorola/ccc/ota/ui/RestartFragment$PreInstallCounter;-><init>(Lcom/motorola/ccc/ota/ui/RestartFragment;JJLandroid/widget/TextView;)V

    sput-object v0, Lcom/motorola/ccc/ota/ui/RestartFragment;->mPreInstallCounter:Lcom/motorola/ccc/ota/ui/RestartFragment$PreInstallCounter;

    invoke-virtual {v0}, Lcom/motorola/ccc/ota/ui/RestartFragment$PreInstallCounter;->start()Landroid/os/CountDownTimer;

    :goto_0
    return-void
.end method

.method private setTextViewTitle(Ljava/lang/String;)V
    .locals 1

    iget-object p0, p0, Lcom/motorola/ccc/ota/ui/RestartFragment;->rootView:Landroid/view/View;

    const v0, 0x7f0900cb

    invoke-virtual {p0, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p0

    check-cast p0, Landroid/widget/TextView;

    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    return-void
.end method

.method private setVersionOTA(Lcom/motorola/ccc/ota/ui/UpdaterUtils$UpgradeInfo;)V
    .locals 5

    invoke-virtual {p1}, Lcom/motorola/ccc/ota/ui/UpdaterUtils$UpgradeInfo;->getDisplayVersion()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0}, Lcom/motorola/ccc/ota/ui/RestartFragment;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    invoke-virtual {p0}, Lcom/motorola/ccc/ota/ui/RestartFragment;->getContext()Landroid/content/Context;

    move-result-object v2

    invoke-virtual {p1}, Lcom/motorola/ccc/ota/ui/UpdaterUtils$UpgradeInfo;->getSize()J

    move-result-wide v3

    invoke-static {v2, v3, v4}, Landroid/text/format/Formatter;->formatFileSize(Landroid/content/Context;J)Ljava/lang/String;

    move-result-object p1

    filled-new-array {p1}, [Ljava/lang/Object;

    move-result-object p1

    const v2, 0x7f0e01cb

    invoke-virtual {v1, v2, p1}, Landroid/content/res/Resources;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p1

    filled-new-array {v0, p1}, [Ljava/lang/Object;

    move-result-object p1

    const v0, 0x7f0e00d1

    invoke-virtual {p0, v0, p1}, Lcom/motorola/ccc/ota/ui/RestartFragment;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p1

    iget-object p0, p0, Lcom/motorola/ccc/ota/ui/RestartFragment;->mVersion:Landroid/widget/TextView;

    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    return-void
.end method

.method private showFirstNetUIForCritical()V
    .locals 2

    iget-object v0, p0, Lcom/motorola/ccc/ota/ui/RestartFragment;->mRebootLater:Landroid/widget/Button;

    const/16 v1, 0x8

    invoke-virtual {v0, v1}, Landroid/widget/Button;->setVisibility(I)V

    iget-object v0, p0, Lcom/motorola/ccc/ota/ui/RestartFragment;->mRebootNow:Landroid/widget/Button;

    invoke-virtual {p0}, Lcom/motorola/ccc/ota/ui/RestartFragment;->getResources()Landroid/content/res/Resources;

    move-result-object p0

    const v1, 0x7f0e0174

    invoke-virtual {p0, v1}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object p0

    invoke-virtual {v0, p0}, Landroid/widget/Button;->setText(Ljava/lang/CharSequence;)V

    return-void
.end method

.method private showNormalUIForRestartTimer()V
    .locals 4

    iget-object v0, p0, Lcom/motorola/ccc/ota/ui/RestartFragment;->mRebootLater:Landroid/widget/Button;

    const/16 v1, 0x8

    invoke-virtual {v0, v1}, Landroid/widget/Button;->setVisibility(I)V

    iget-object v0, p0, Lcom/motorola/ccc/ota/ui/RestartFragment;->mRebootNow:Landroid/widget/Button;

    invoke-virtual {p0}, Lcom/motorola/ccc/ota/ui/RestartFragment;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    const v3, 0x7f0e0174

    invoke-virtual {v2, v3}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v2}, Landroid/widget/Button;->setText(Ljava/lang/CharSequence;)V

    iget-object v0, p0, Lcom/motorola/ccc/ota/ui/RestartFragment;->mAbRestartCriticalPrompt:Landroid/widget/TextView;

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setVisibility(I)V

    sget-boolean v0, Lcom/motorola/ccc/ota/ui/RestartFragment;->isSmartUpdateTimerRunning:Z

    const/4 v1, 0x0

    if-nez v0, :cond_3

    iget-object v0, p0, Lcom/motorola/ccc/ota/ui/RestartFragment;->settings:Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    iget-object v2, p0, Lcom/motorola/ccc/ota/ui/RestartFragment;->mUpgradeInfo:Lcom/motorola/ccc/ota/ui/UpdaterUtils$UpgradeInfo;

    invoke-virtual {v2}, Lcom/motorola/ccc/ota/ui/UpdaterUtils$UpgradeInfo;->getUpdateTypeData()Ljava/lang/String;

    move-result-object v2

    invoke-static {v0, v2}, Lcom/motorola/ccc/ota/utils/SmartUpdateUtils;->isSmartUpdateNearestToInstall(Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_0

    goto :goto_0

    :cond_0
    iget-object v0, p0, Lcom/motorola/ccc/ota/ui/RestartFragment;->mUpgradeInfo:Lcom/motorola/ccc/ota/ui/UpdaterUtils$UpgradeInfo;

    invoke-virtual {v0}, Lcom/motorola/ccc/ota/ui/UpdaterUtils$UpgradeInfo;->isCriticalUpdate()Z

    move-result v0

    if-eqz v0, :cond_5

    iget-object v0, p0, Lcom/motorola/ccc/ota/ui/RestartFragment;->context:Landroid/content/Context;

    invoke-static {v0}, Lcom/motorola/ccc/ota/utils/CusUtilMethods;->isItFirstNetOnFota(Landroid/content/Context;)Z

    move-result v0

    if-eqz v0, :cond_1

    invoke-direct {p0}, Lcom/motorola/ccc/ota/ui/RestartFragment;->showFirstNetUIForCritical()V

    return-void

    :cond_1
    iget-object v0, p0, Lcom/motorola/ccc/ota/ui/RestartFragment;->mCriticalUpdate:Lcom/motorola/ccc/ota/ui/CriticalUpdate;

    invoke-virtual {v0}, Lcom/motorola/ccc/ota/ui/CriticalUpdate;->shouldAllowExtendedCriticalUpdate()Z

    move-result v0

    if-eqz v0, :cond_2

    iget-object v0, p0, Lcom/motorola/ccc/ota/ui/RestartFragment;->mRebootLater:Landroid/widget/Button;

    invoke-virtual {p0}, Lcom/motorola/ccc/ota/ui/RestartFragment;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    const v3, 0x7f0e016c

    invoke-virtual {v2, v3}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v2}, Landroid/widget/Button;->setText(Ljava/lang/CharSequence;)V

    iget-object v0, p0, Lcom/motorola/ccc/ota/ui/RestartFragment;->mRebootLater:Landroid/widget/Button;

    invoke-virtual {v0, v1}, Landroid/widget/Button;->setVisibility(I)V

    :cond_2
    invoke-static {}, Lcom/motorola/ccc/ota/utils/BuildPropReader;->isATT()Z

    move-result v0

    if-nez v0, :cond_5

    invoke-virtual {p0}, Lcom/motorola/ccc/ota/ui/RestartFragment;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    const v1, 0x7f0e00ac

    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v0

    invoke-direct {p0, v0}, Lcom/motorola/ccc/ota/ui/RestartFragment;->setTextViewTitle(Ljava/lang/String;)V

    goto :goto_1

    :cond_3
    :goto_0
    iget-object v0, p0, Lcom/motorola/ccc/ota/ui/RestartFragment;->context:Landroid/content/Context;

    iget-object v2, p0, Lcom/motorola/ccc/ota/ui/RestartFragment;->settings:Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    invoke-static {v0, v2}, Lcom/motorola/ccc/ota/utils/SmartUpdateUtils;->postponeSmartUpdateROR(Landroid/content/Context;Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;)Z

    move-result v0

    if-eqz v0, :cond_4

    invoke-direct {p0}, Lcom/motorola/ccc/ota/ui/RestartFragment;->handleRestartCancelOrPostponeToNextDay()V

    return-void

    :cond_4
    const/4 v0, 0x1

    sput-boolean v0, Lcom/motorola/ccc/ota/ui/RestartFragment;->isSmartUpdateTimerRunning:Z

    iget-object v0, p0, Lcom/motorola/ccc/ota/ui/RestartFragment;->mRestartCancel:Landroid/widget/Button;

    invoke-virtual {v0, v1}, Landroid/widget/Button;->setVisibility(I)V

    iget-object v0, p0, Lcom/motorola/ccc/ota/ui/RestartFragment;->mUpdateType:Lcom/motorola/ccc/ota/ui/updateType/UpdateType$UpdateTypeInterface;

    invoke-interface {v0}, Lcom/motorola/ccc/ota/ui/updateType/UpdateType$UpdateTypeInterface;->getToolbarTitle()Ljava/lang/String;

    move-result-object v0

    invoke-direct {p0, v0}, Lcom/motorola/ccc/ota/ui/RestartFragment;->setTextViewTitle(Ljava/lang/String;)V

    :cond_5
    :goto_1
    invoke-direct {p0}, Lcom/motorola/ccc/ota/ui/RestartFragment;->dismissAlert()V

    invoke-direct {p0}, Lcom/motorola/ccc/ota/ui/RestartFragment;->refreshOrStartInstallCounter()V

    return-void
.end method

.method private showRestartPostponedDialog(Ljava/lang/String;)V
    .locals 3

    new-instance v0, Landroid/app/Dialog;

    iget-object v1, p0, Lcom/motorola/ccc/ota/ui/RestartFragment;->context:Landroid/content/Context;

    invoke-direct {v0, v1}, Landroid/app/Dialog;-><init>(Landroid/content/Context;)V

    const v1, 0x7f0c0056

    invoke-virtual {v0, v1}, Landroid/app/Dialog;->setContentView(I)V

    const v1, 0x7f09008d

    invoke-virtual {v0, v1}, Landroid/app/Dialog;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/TextView;

    const v2, 0x7f09008e

    invoke-virtual {v0, v2}, Landroid/app/Dialog;->findViewById(I)Landroid/view/View;

    move-result-object v2

    check-cast v2, Landroid/widget/Button;

    invoke-virtual {v1, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    invoke-virtual {p0}, Lcom/motorola/ccc/ota/ui/RestartFragment;->getResources()Landroid/content/res/Resources;

    move-result-object p1

    const v1, 0x7f0800a2

    invoke-virtual {p1, v1}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object p1

    invoke-virtual {v0}, Landroid/app/Dialog;->getWindow()Landroid/view/Window;

    move-result-object v1

    invoke-virtual {v1, p1}, Landroid/view/Window;->setBackgroundDrawable(Landroid/graphics/drawable/Drawable;)V

    new-instance p1, Landroid/view/WindowManager$LayoutParams;

    invoke-direct {p1}, Landroid/view/WindowManager$LayoutParams;-><init>()V

    invoke-virtual {v0}, Landroid/app/Dialog;->getWindow()Landroid/view/Window;

    move-result-object v1

    invoke-virtual {v1}, Landroid/view/Window;->getAttributes()Landroid/view/WindowManager$LayoutParams;

    move-result-object v1

    invoke-virtual {p1, v1}, Landroid/view/WindowManager$LayoutParams;->copyFrom(Landroid/view/WindowManager$LayoutParams;)I

    const/4 v1, -0x2

    iput v1, p1, Landroid/view/WindowManager$LayoutParams;->width:I

    iput v1, p1, Landroid/view/WindowManager$LayoutParams;->height:I

    invoke-virtual {v0}, Landroid/app/Dialog;->getWindow()Landroid/view/Window;

    move-result-object v1

    invoke-virtual {v1, p1}, Landroid/view/Window;->setAttributes(Landroid/view/WindowManager$LayoutParams;)V

    invoke-virtual {v0}, Landroid/app/Dialog;->show()V

    new-instance p1, Lcom/motorola/ccc/ota/ui/RestartFragment$$ExternalSyntheticLambda1;

    invoke-direct {p1, v0}, Lcom/motorola/ccc/ota/ui/RestartFragment$$ExternalSyntheticLambda1;-><init>(Landroid/app/Dialog;)V

    invoke-virtual {v2, p1}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    new-instance p1, Lcom/motorola/ccc/ota/ui/RestartFragment$$ExternalSyntheticLambda2;

    invoke-direct {p1, p0}, Lcom/motorola/ccc/ota/ui/RestartFragment$$ExternalSyntheticLambda2;-><init>(Lcom/motorola/ccc/ota/ui/RestartFragment;)V

    invoke-virtual {v0, p1}, Landroid/app/Dialog;->setOnCancelListener(Landroid/content/DialogInterface$OnCancelListener;)V

    return-void
.end method

.method private showRestartSystemNotification()V
    .locals 9

    iget-object v0, p0, Lcom/motorola/ccc/ota/ui/RestartFragment;->mAlarmManager:Landroid/app/AlarmManager;

    iget-object v1, p0, Lcom/motorola/ccc/ota/ui/RestartFragment;->mPendingIntent:Landroid/app/PendingIntent;

    invoke-virtual {v0, v1}, Landroid/app/AlarmManager;->cancel(Landroid/app/PendingIntent;)V

    iget-object v0, p0, Lcom/motorola/ccc/ota/ui/RestartFragment;->mCriticalUpdate:Lcom/motorola/ccc/ota/ui/CriticalUpdate;

    invoke-virtual {v0}, Lcom/motorola/ccc/ota/ui/CriticalUpdate;->isCriticalUpdate()Z

    move-result v0

    const-wide/16 v1, -0x1

    if-eqz v0, :cond_1

    sget-object v0, Lcom/motorola/ccc/ota/ui/RestartFragment;->mPreInstallCounter:Lcom/motorola/ccc/ota/ui/RestartFragment$PreInstallCounter;

    if-eqz v0, :cond_0

    return-void

    :cond_0
    sget-object v0, Ljava/util/concurrent/TimeUnit;->MILLISECONDS:Ljava/util/concurrent/TimeUnit;

    iget-wide v3, p0, Lcom/motorola/ccc/ota/ui/RestartFragment;->mNextPrompt:J

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v5

    sub-long/2addr v3, v5

    invoke-virtual {v0, v3, v4}, Ljava/util/concurrent/TimeUnit;->toMinutes(J)J

    move-result-wide v3

    long-to-int v0, v3

    add-int/lit8 v0, v0, 0x1

    iget-object v3, p0, Lcom/motorola/ccc/ota/ui/RestartFragment;->settings:Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    sget-object v4, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->MAX_CRITICAL_UPDATE_DEFER_TIME:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    invoke-virtual {v3, v4, v1, v2}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->getLong(Lcom/motorola/otalib/common/settings/ISetting;J)J

    move-result-wide v1

    const-wide/16 v3, 0x0

    cmp-long v3, v1, v3

    if-lez v3, :cond_4

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v3

    cmp-long v1, v3, v1

    if-ltz v1, :cond_4

    iget-object v1, p0, Lcom/motorola/ccc/ota/ui/RestartFragment;->context:Landroid/content/Context;

    invoke-static {v1}, Lcom/motorola/ccc/ota/utils/CusUtilMethods;->isItFirstNetOnFota(Landroid/content/Context;)Z

    move-result v1

    if-eqz v1, :cond_4

    const/4 v0, -0x1

    goto :goto_0

    :cond_1
    iget-object v0, p0, Lcom/motorola/ccc/ota/ui/RestartFragment;->mUpgradeInfo:Lcom/motorola/ccc/ota/ui/UpdaterUtils$UpgradeInfo;

    invoke-static {v0}, Lcom/motorola/ccc/ota/utils/NotificationUtils;->getPreInstallNotificationExpiryMins(Lcom/motorola/ccc/ota/ui/UpdaterUtils$UpgradeInfo;)I

    move-result v0

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v3

    mul-int/lit8 v5, v0, 0x3c

    int-to-long v5, v5

    const-wide/16 v7, 0x3e8

    mul-long/2addr v5, v7

    add-long/2addr v3, v5

    iput-wide v3, p0, Lcom/motorola/ccc/ota/ui/RestartFragment;->mNextPrompt:J

    iget-object v3, p0, Lcom/motorola/ccc/ota/ui/RestartFragment;->mUpgradeInfo:Lcom/motorola/ccc/ota/ui/UpdaterUtils$UpgradeInfo;

    invoke-virtual {v3}, Lcom/motorola/ccc/ota/ui/UpdaterUtils$UpgradeInfo;->isForceInstallTimeSet()Z

    move-result v3

    if-eqz v3, :cond_3

    iget-object v3, p0, Lcom/motorola/ccc/ota/ui/RestartFragment;->settings:Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    sget-object v4, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->MAX_FORCE_INSTALL_DEFER_TIME:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    invoke-virtual {v3, v4, v1, v2}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->getLong(Lcom/motorola/otalib/common/settings/ISetting;J)J

    move-result-wide v1

    iget-object v3, p0, Lcom/motorola/ccc/ota/ui/RestartFragment;->mUpgradeInfo:Lcom/motorola/ccc/ota/ui/UpdaterUtils$UpgradeInfo;

    invoke-virtual {v3}, Lcom/motorola/ccc/ota/ui/UpdaterUtils$UpgradeInfo;->isForceInstallTimerExpired()Z

    move-result v3

    if-eqz v3, :cond_2

    const-wide/32 v3, 0x337f9800

    add-long/2addr v1, v3

    :cond_2
    sget-object v3, Ljava/util/concurrent/TimeUnit;->MILLISECONDS:Ljava/util/concurrent/TimeUnit;

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v4

    sub-long/2addr v1, v4

    invoke-virtual {v3, v1, v2}, Ljava/util/concurrent/TimeUnit;->toMinutes(J)J

    move-result-wide v1

    const-wide/16 v3, 0x1

    add-long/2addr v1, v3

    int-to-long v3, v0

    cmp-long v3, v1, v3

    if-gez v3, :cond_3

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v3

    const-wide/32 v5, 0xea60

    mul-long/2addr v5, v1

    add-long/2addr v3, v5

    iput-wide v3, p0, Lcom/motorola/ccc/ota/ui/RestartFragment;->mNextPrompt:J

    long-to-int v0, v1

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "RestartFragment.showRestartSystemNotification: Force install delay changed: "

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    const-string v2, "OtaApp"

    invoke-static {v2, v1}, Lcom/motorola/ccc/ota/utils/Logger;->debug(Ljava/lang/String;Ljava/lang/String;)V

    :cond_3
    iget-wide v1, p0, Lcom/motorola/ccc/ota/ui/RestartFragment;->mNextPrompt:J

    invoke-static {v1, v2}, Lcom/motorola/ccc/ota/ui/UpdaterUtils;->saveNextPrompt(J)V

    :cond_4
    :goto_0
    invoke-static {}, Lcom/motorola/ccc/ota/env/OtaApplication;->getGlobalContext()Landroid/content/Context;

    move-result-object v1

    iget-object v2, p0, Lcom/motorola/ccc/ota/ui/RestartFragment;->mMinVersion:Ljava/lang/String;

    iget-object v3, p0, Lcom/motorola/ccc/ota/ui/RestartFragment;->mTargetIntent:Landroid/content/Intent;

    iget-object v4, p0, Lcom/motorola/ccc/ota/ui/RestartFragment;->mUpgradeInfo:Lcom/motorola/ccc/ota/ui/UpdaterUtils$UpgradeInfo;

    invoke-static {v1, v2, v0, v3, v4}, Lcom/motorola/ccc/ota/utils/NotificationUtils;->fillRestartSystemNotificationDetails(Landroid/content/Context;Ljava/lang/String;ILandroid/content/Intent;Lcom/motorola/ccc/ota/ui/UpdaterUtils$UpgradeInfo;)Landroid/content/Intent;

    move-result-object v1

    invoke-static {}, Lcom/motorola/ccc/ota/env/OtaApplication;->getGlobalContext()Landroid/content/Context;

    move-result-object v2

    invoke-static {v2, v1}, Lcom/motorola/ccc/ota/utils/NotificationUtils;->startNotificationService(Landroid/content/Context;Landroid/content/Intent;)V

    iget-object p0, p0, Lcom/motorola/ccc/ota/ui/RestartFragment;->context:Landroid/content/Context;

    const/4 v1, 0x0

    int-to-long v2, v0

    const-string v0, "RESTART_DEFERRED"

    invoke-static {p0, v0, v1, v2, v3}, Lcom/motorola/ccc/ota/ui/UpdaterUtils;->setDeferStats(Landroid/content/Context;Ljava/lang/String;ZJ)V

    return-void
.end method

.method private showTrySmartUpdatePopUp()V
    .locals 8

    iget-object v0, p0, Lcom/motorola/ccc/ota/ui/RestartFragment;->settings:Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    iget-object v1, p0, Lcom/motorola/ccc/ota/ui/RestartFragment;->mUpgradeInfo:Lcom/motorola/ccc/ota/ui/UpdaterUtils$UpgradeInfo;

    invoke-virtual {v1}, Lcom/motorola/ccc/ota/ui/UpdaterUtils$UpgradeInfo;->getUpdateTypeData()Ljava/lang/String;

    move-result-object v1

    const/4 v2, 0x1

    invoke-static {v0, v1, v2}, Lcom/motorola/ccc/ota/utils/SmartUpdateUtils;->shouldShowTrySmartUpdatePopUp(Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;Ljava/lang/String;Z)Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-virtual {p0}, Lcom/motorola/ccc/ota/ui/RestartFragment;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    const v1, 0x7f0e0197

    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {p0}, Lcom/motorola/ccc/ota/ui/RestartFragment;->getContext()Landroid/content/Context;

    move-result-object v2

    iget-object v4, p0, Lcom/motorola/ccc/ota/ui/RestartFragment;->mUpdateType:Lcom/motorola/ccc/ota/ui/updateType/UpdateType$UpdateTypeInterface;

    iget-object v5, p0, Lcom/motorola/ccc/ota/ui/RestartFragment;->activity:Landroid/app/Activity;

    iget-object v6, p0, Lcom/motorola/ccc/ota/ui/RestartFragment;->settings:Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    sget-object p0, Lcom/motorola/ccc/ota/utils/SmartUpdateUtils$SmartUpdateLaunchMode;->TRY_SMART_UPDATES_POPUP_RESTART:Lcom/motorola/ccc/ota/utils/SmartUpdateUtils$SmartUpdateLaunchMode;

    invoke-virtual {p0}, Lcom/motorola/ccc/ota/utils/SmartUpdateUtils$SmartUpdateLaunchMode;->name()Ljava/lang/String;

    move-result-object v7

    invoke-static/range {v2 .. v7}, Lcom/motorola/ccc/ota/utils/SmartUpdateUtils;->showTrySmartUpdatePopUp(Landroid/content/Context;Ljava/lang/String;Lcom/motorola/ccc/ota/ui/updateType/UpdateType$UpdateTypeInterface;Landroid/app/Activity;Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;Ljava/lang/String;)V

    goto :goto_0

    :cond_0
    iget-object p0, p0, Lcom/motorola/ccc/ota/ui/RestartFragment;->activity:Landroid/app/Activity;

    invoke-virtual {p0}, Landroid/app/Activity;->finish()V

    :goto_0
    return-void
.end method

.method private stopRestartTimer()V
    .locals 2

    sget-object v0, Lcom/motorola/ccc/ota/ui/RestartFragment;->mPreInstallCounter:Lcom/motorola/ccc/ota/ui/RestartFragment$PreInstallCounter;

    if-nez v0, :cond_0

    return-void

    :cond_0
    iget-object v0, p0, Lcom/motorola/ccc/ota/ui/RestartFragment;->mRestartCancel:Landroid/widget/Button;

    const/16 v1, 0x8

    invoke-virtual {v0, v1}, Landroid/widget/Button;->setVisibility(I)V

    iget-object v0, p0, Lcom/motorola/ccc/ota/ui/RestartFragment;->mRebootNow:Landroid/widget/Button;

    const v1, 0x7f0e0174

    invoke-virtual {v0, v1}, Landroid/widget/Button;->setText(I)V

    iget-object v0, p0, Lcom/motorola/ccc/ota/ui/RestartFragment;->mRebootLater:Landroid/widget/Button;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/widget/Button;->setVisibility(I)V

    iget-object v0, p0, Lcom/motorola/ccc/ota/ui/RestartFragment;->mWarningText:Landroid/widget/TextView;

    invoke-direct {p0}, Lcom/motorola/ccc/ota/ui/RestartFragment;->getRestartWarningText()Ljava/lang/String;

    move-result-object p0

    invoke-virtual {v0, p0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    sget-object p0, Lcom/motorola/ccc/ota/ui/RestartFragment;->mPreInstallCounter:Lcom/motorola/ccc/ota/ui/RestartFragment$PreInstallCounter;

    invoke-virtual {p0}, Lcom/motorola/ccc/ota/ui/RestartFragment$PreInstallCounter;->stop()V

    const/4 p0, 0x0

    sput-object p0, Lcom/motorola/ccc/ota/ui/RestartFragment;->mPreInstallCounter:Lcom/motorola/ccc/ota/ui/RestartFragment$PreInstallCounter;

    return-void
.end method


# virtual methods
.method synthetic lambda$onViewCreated$0$com-motorola-ccc-ota-ui-RestartFragment(Landroid/view/View;ILandroid/view/KeyEvent;)Z
    .locals 0

    const/4 p1, 0x4

    if-ne p2, p1, :cond_1

    iget p1, p0, Lcom/motorola/ccc/ota/ui/RestartFragment;->mPromptCount:I

    const/4 p2, 0x5

    if-lt p1, p2, :cond_0

    invoke-direct {p0}, Lcom/motorola/ccc/ota/ui/RestartFragment;->showTrySmartUpdatePopUp()V

    goto :goto_0

    :cond_0
    iget-object p0, p0, Lcom/motorola/ccc/ota/ui/RestartFragment;->activity:Landroid/app/Activity;

    invoke-virtual {p0}, Landroid/app/Activity;->finish()V

    :goto_0
    const/4 p0, 0x1

    return p0

    :cond_1
    const/4 p0, 0x0

    return p0
.end method

.method synthetic lambda$showRestartPostponedDialog$2$com-motorola-ccc-ota-ui-RestartFragment(Landroid/content/DialogInterface;)V
    .locals 0

    iget-object p0, p0, Lcom/motorola/ccc/ota/ui/RestartFragment;->activity:Landroid/app/Activity;

    invoke-virtual {p0}, Landroid/app/Activity;->finish()V

    return-void
.end method

.method public onActivityCreated(Landroid/os/Bundle;)V
    .locals 11

    invoke-super {p0, p1}, Landroidx/fragment/app/Fragment;->onActivityCreated(Landroid/os/Bundle;)V

    iget-object p1, p0, Lcom/motorola/ccc/ota/ui/RestartFragment;->activityIntent:Landroid/content/Intent;

    invoke-direct {p0, p1}, Lcom/motorola/ccc/ota/ui/RestartFragment;->getTargetIntent(Landroid/content/Intent;)Landroid/content/Intent;

    move-result-object p1

    iput-object p1, p0, Lcom/motorola/ccc/ota/ui/RestartFragment;->mTargetIntent:Landroid/content/Intent;

    const-string v0, "Restart"

    invoke-static {v0, p1}, Lcom/motorola/ccc/ota/ui/UpdaterUtils;->fillAnnoyValueExpiryDetails(Ljava/lang/String;Landroid/content/Intent;)Landroid/content/Intent;

    move-result-object p1

    iget-object v1, p0, Lcom/motorola/ccc/ota/ui/RestartFragment;->context:Landroid/content/Context;

    const/high16 v2, 0x14000000

    const/4 v3, 0x0

    invoke-static {v1, v3, p1, v2}, Landroid/app/PendingIntent;->getBroadcast(Landroid/content/Context;ILandroid/content/Intent;I)Landroid/app/PendingIntent;

    move-result-object p1

    iput-object p1, p0, Lcom/motorola/ccc/ota/ui/RestartFragment;->mPendingIntent:Landroid/app/PendingIntent;

    invoke-static {}, Lcom/motorola/ccc/ota/ui/UpdaterUtils;->disableBatteryStatusReceiver()Z

    iget-object p1, p0, Lcom/motorola/ccc/ota/ui/RestartFragment;->activityIntent:Landroid/content/Intent;

    invoke-static {p1}, Lcom/motorola/ccc/ota/ui/UpdaterUtils;->getUpgradeInfoDuringOTAUpdate(Landroid/content/Intent;)Lcom/motorola/ccc/ota/ui/UpdaterUtils$UpgradeInfo;

    move-result-object p1

    iput-object p1, p0, Lcom/motorola/ccc/ota/ui/RestartFragment;->mUpgradeInfo:Lcom/motorola/ccc/ota/ui/UpdaterUtils$UpgradeInfo;

    iget-object p1, p0, Lcom/motorola/ccc/ota/ui/RestartFragment;->activityIntent:Landroid/content/Intent;

    const-string v1, "com.motorola.blur.service.blur.upgrade.version"

    invoke-virtual {p1, v1}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    iput-object p1, p0, Lcom/motorola/ccc/ota/ui/RestartFragment;->mMinVersion:Ljava/lang/String;

    iget-object p1, p0, Lcom/motorola/ccc/ota/ui/RestartFragment;->activityIntent:Landroid/content/Intent;

    const-string v1, "com.motorola.blur.service.blur.upgrade.location_type"

    invoke-virtual {p1, v1}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    iput-object p1, p0, Lcom/motorola/ccc/ota/ui/RestartFragment;->mLocationType:Ljava/lang/String;

    iget-object p1, p0, Lcom/motorola/ccc/ota/ui/RestartFragment;->mUpgradeInfo:Lcom/motorola/ccc/ota/ui/UpdaterUtils$UpgradeInfo;

    const-string v1, "OtaApp"

    if-nez p1, :cond_0

    const-string p1, "RestartFragment, No upgradeInfo found."

    invoke-static {v1, p1}, Lcom/motorola/ccc/ota/utils/Logger;->error(Ljava/lang/String;Ljava/lang/String;)V

    iget-object p0, p0, Lcom/motorola/ccc/ota/ui/RestartFragment;->activity:Landroid/app/Activity;

    invoke-virtual {p0}, Landroid/app/Activity;->finishAndRemoveTask()V

    return-void

    :cond_0
    new-instance p1, Lcom/motorola/ccc/ota/ui/CriticalUpdate;

    iget-object v2, p0, Lcom/motorola/ccc/ota/ui/RestartFragment;->mUpgradeInfo:Lcom/motorola/ccc/ota/ui/UpdaterUtils$UpgradeInfo;

    invoke-direct {p1, v2}, Lcom/motorola/ccc/ota/ui/CriticalUpdate;-><init>(Lcom/motorola/ccc/ota/ui/UpdaterUtils$UpgradeInfo;)V

    iput-object p1, p0, Lcom/motorola/ccc/ota/ui/RestartFragment;->mCriticalUpdate:Lcom/motorola/ccc/ota/ui/CriticalUpdate;

    iget-object p1, p0, Lcom/motorola/ccc/ota/ui/RestartFragment;->mUpgradeInfo:Lcom/motorola/ccc/ota/ui/UpdaterUtils$UpgradeInfo;

    invoke-virtual {p1}, Lcom/motorola/ccc/ota/ui/UpdaterUtils$UpgradeInfo;->getUpdateTypeData()Ljava/lang/String;

    move-result-object p1

    invoke-static {p1}, Lcom/motorola/ccc/ota/ui/updateType/UpdateType;->getUpdateType(Ljava/lang/String;)Lcom/motorola/ccc/ota/ui/updateType/UpdateType$UpdateTypeInterface;

    move-result-object p1

    iput-object p1, p0, Lcom/motorola/ccc/ota/ui/RestartFragment;->mUpdateType:Lcom/motorola/ccc/ota/ui/updateType/UpdateType$UpdateTypeInterface;

    iget-object p1, p0, Lcom/motorola/ccc/ota/ui/RestartFragment;->context:Landroid/content/Context;

    invoke-static {p1, v0}, Lcom/motorola/ccc/ota/ui/UpdaterUtils;->isPromptAllowed(Landroid/content/Context;Ljava/lang/String;)Z

    move-result p1

    if-nez p1, :cond_1

    const-string p1, "Restart postponed by phone call/ECB"

    invoke-static {v1, p1}, Lcom/motorola/ccc/ota/utils/Logger;->info(Ljava/lang/String;Ljava/lang/String;)V

    iget-object p0, p0, Lcom/motorola/ccc/ota/ui/RestartFragment;->activity:Landroid/app/Activity;

    invoke-virtual {p0}, Landroid/app/Activity;->finish()V

    return-void

    :cond_1
    iget-object p1, p0, Lcom/motorola/ccc/ota/ui/RestartFragment;->mUpgradeInfo:Lcom/motorola/ccc/ota/ui/UpdaterUtils$UpgradeInfo;

    invoke-direct {p0, p1}, Lcom/motorola/ccc/ota/ui/RestartFragment;->setVersionOTA(Lcom/motorola/ccc/ota/ui/UpdaterUtils$UpgradeInfo;)V

    iget-object p1, p0, Lcom/motorola/ccc/ota/ui/RestartFragment;->activity:Landroid/app/Activity;

    invoke-virtual {p1}, Landroid/app/Activity;->getWindow()Landroid/view/Window;

    move-result-object p1

    const/high16 v0, -0x80000000

    invoke-virtual {p1, v0}, Landroid/view/Window;->addFlags(I)V

    invoke-virtual {p1, v3}, Landroid/view/Window;->setStatusBarColor(I)V

    iget-object v0, p0, Lcom/motorola/ccc/ota/ui/RestartFragment;->context:Landroid/content/Context;

    invoke-static {v0}, Lcom/motorola/ccc/ota/ui/UpdaterUtils;->isBatterySaverEnabled(Landroid/content/Context;)Z

    move-result v0

    if-nez v0, :cond_2

    new-instance v0, Landroidx/core/view/WindowInsetsControllerCompat;

    invoke-virtual {p1}, Landroid/view/Window;->getDecorView()Landroid/view/View;

    move-result-object v2

    invoke-direct {v0, p1, v2}, Landroidx/core/view/WindowInsetsControllerCompat;-><init>(Landroid/view/Window;Landroid/view/View;)V

    iget-object p1, p0, Lcom/motorola/ccc/ota/ui/RestartFragment;->context:Landroid/content/Context;

    const-string v2, "uimode"

    invoke-virtual {p1, v2}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Landroid/app/UiModeManager;

    invoke-virtual {p1}, Landroid/app/UiModeManager;->getNightMode()I

    move-result p1

    const/4 v2, 0x2

    if-eq p1, v2, :cond_2

    const/4 p1, 0x1

    invoke-virtual {v0, p1}, Landroidx/core/view/WindowInsetsControllerCompat;->setAppearanceLightStatusBars(Z)V

    invoke-virtual {v0, p1}, Landroidx/core/view/WindowInsetsControllerCompat;->setAppearanceLightNavigationBars(Z)V

    :cond_2
    iget-object p1, p0, Lcom/motorola/ccc/ota/ui/RestartFragment;->mUpdateType:Lcom/motorola/ccc/ota/ui/updateType/UpdateType$UpdateTypeInterface;

    invoke-interface {p1}, Lcom/motorola/ccc/ota/ui/updateType/UpdateType$UpdateTypeInterface;->getToolbarTitle()Ljava/lang/String;

    move-result-object p1

    invoke-direct {p0, p1}, Lcom/motorola/ccc/ota/ui/RestartFragment;->setTextViewTitle(Ljava/lang/String;)V

    iget-object p1, p0, Lcom/motorola/ccc/ota/ui/RestartFragment;->rootView:Landroid/view/View;

    const v0, 0x7f090082

    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v10

    iget-object v4, p0, Lcom/motorola/ccc/ota/ui/RestartFragment;->expandableListView:Landroid/widget/ExpandableListView;

    iget-object p1, p0, Lcom/motorola/ccc/ota/ui/RestartFragment;->mUpgradeInfo:Lcom/motorola/ccc/ota/ui/UpdaterUtils$UpgradeInfo;

    invoke-virtual {p1}, Lcom/motorola/ccc/ota/ui/UpdaterUtils$UpgradeInfo;->hasReleaseNotes()Z

    move-result v5

    iget-object p1, p0, Lcom/motorola/ccc/ota/ui/RestartFragment;->mUpgradeInfo:Lcom/motorola/ccc/ota/ui/UpdaterUtils$UpgradeInfo;

    invoke-virtual {p1}, Lcom/motorola/ccc/ota/ui/UpdaterUtils$UpgradeInfo;->getReleaseNotes()Ljava/lang/String;

    move-result-object v6

    iget-object v7, p0, Lcom/motorola/ccc/ota/ui/RestartFragment;->mExpTitle:Landroid/widget/TextView;

    invoke-virtual {p0}, Lcom/motorola/ccc/ota/ui/RestartFragment;->getActivity()Landroidx/fragment/app/FragmentActivity;

    move-result-object v8

    iget-object v9, p0, Lcom/motorola/ccc/ota/ui/RestartFragment;->mUpdateType:Lcom/motorola/ccc/ota/ui/updateType/UpdateType$UpdateTypeInterface;

    invoke-static/range {v4 .. v10}, Lcom/motorola/ccc/ota/ui/UpdaterUtils;->setExpandableList(Landroid/widget/ExpandableListView;ZLjava/lang/String;Landroid/widget/TextView;Landroid/content/Context;Lcom/motorola/ccc/ota/ui/updateType/UpdateType$UpdateTypeInterface;Landroid/view/View;)Landroid/widget/ExpandableListView;

    move-result-object p1

    iput-object p1, p0, Lcom/motorola/ccc/ota/ui/RestartFragment;->expandableListView:Landroid/widget/ExpandableListView;

    const-string v0, "restart"

    invoke-static {p1, v0}, Lcom/motorola/ccc/ota/ui/UpdaterUtils;->handleExpList(Landroid/widget/ExpandableListView;Ljava/lang/String;)Landroid/widget/ExpandableListView;

    move-result-object p1

    iput-object p1, p0, Lcom/motorola/ccc/ota/ui/RestartFragment;->expandableListView:Landroid/widget/ExpandableListView;

    iget-object p1, p0, Lcom/motorola/ccc/ota/ui/RestartFragment;->context:Landroid/content/Context;

    iget-object v2, p0, Lcom/motorola/ccc/ota/ui/RestartFragment;->osReleaseNotes:Landroid/widget/TextView;

    iget-object v4, p0, Lcom/motorola/ccc/ota/ui/RestartFragment;->mUpgradeInfo:Lcom/motorola/ccc/ota/ui/UpdaterUtils$UpgradeInfo;

    invoke-static {p1, v2, v4, v0}, Lcom/motorola/ccc/ota/ui/UpdaterUtils;->setOsReleaseNotes(Landroid/content/Context;Landroid/widget/TextView;Lcom/motorola/ccc/ota/ui/UpdaterUtils$UpgradeInfo;Ljava/lang/String;)V

    iget-object p1, p0, Lcom/motorola/ccc/ota/ui/RestartFragment;->mUpgradeInfo:Lcom/motorola/ccc/ota/ui/UpdaterUtils$UpgradeInfo;

    invoke-virtual {p1}, Lcom/motorola/ccc/ota/ui/UpdaterUtils$UpgradeInfo;->hasPreInstallInstructions()Z

    move-result p1

    if-eqz p1, :cond_3

    iget-object p1, p0, Lcom/motorola/ccc/ota/ui/RestartFragment;->mUpgradeInfo:Lcom/motorola/ccc/ota/ui/UpdaterUtils$UpgradeInfo;

    invoke-virtual {p1}, Lcom/motorola/ccc/ota/ui/UpdaterUtils$UpgradeInfo;->getPreInstallInstructions()Ljava/lang/String;

    move-result-object p1

    iget-object v0, p0, Lcom/motorola/ccc/ota/ui/RestartFragment;->mUpgradeInfo:Lcom/motorola/ccc/ota/ui/UpdaterUtils$UpgradeInfo;

    invoke-virtual {v0}, Lcom/motorola/ccc/ota/ui/UpdaterUtils$UpgradeInfo;->hasPreInstallInstructions()Z

    move-result v0

    iget-object v2, p0, Lcom/motorola/ccc/ota/ui/RestartFragment;->mInstructionLayout:Landroid/widget/LinearLayout;

    invoke-virtual {p0}, Lcom/motorola/ccc/ota/ui/RestartFragment;->getActivity()Landroidx/fragment/app/FragmentActivity;

    move-result-object v4

    iget-object v5, p0, Lcom/motorola/ccc/ota/ui/RestartFragment;->mUpdateType:Lcom/motorola/ccc/ota/ui/updateType/UpdateType$UpdateTypeInterface;

    invoke-static {p1, v0, v2, v4, v5}, Lcom/motorola/ccc/ota/ui/UpdaterUtils;->setInstructions(Ljava/lang/String;ZLandroid/widget/LinearLayout;Landroid/content/Context;Lcom/motorola/ccc/ota/ui/updateType/UpdateType$UpdateTypeInterface;)V

    iget-object p1, p0, Lcom/motorola/ccc/ota/ui/RestartFragment;->mInstructionLayout:Landroid/widget/LinearLayout;

    invoke-virtual {p1, v3}, Landroid/widget/LinearLayout;->setVisibility(I)V

    iget-object p1, p0, Lcom/motorola/ccc/ota/ui/RestartFragment;->mInstructionTitle:Landroid/widget/TextView;

    invoke-virtual {p1, v3}, Landroid/widget/TextView;->setVisibility(I)V

    :cond_3
    iget-object p1, p0, Lcom/motorola/ccc/ota/ui/RestartFragment;->mUpgradeInfo:Lcom/motorola/ccc/ota/ui/UpdaterUtils$UpgradeInfo;

    invoke-virtual {p1}, Lcom/motorola/ccc/ota/ui/UpdaterUtils$UpgradeInfo;->hasPreInstallNotes()Z

    move-result p1

    const/16 v0, 0x8

    if-eqz p1, :cond_4

    :try_start_0
    iget-object p1, p0, Lcom/motorola/ccc/ota/ui/RestartFragment;->mPreInstallNotes:Landroid/widget/TextView;

    iget-object v2, p0, Lcom/motorola/ccc/ota/ui/RestartFragment;->mUpgradeInfo:Lcom/motorola/ccc/ota/ui/UpdaterUtils$UpgradeInfo;

    invoke-virtual {v2}, Lcom/motorola/ccc/ota/ui/UpdaterUtils$UpgradeInfo;->getPreInstallNotes()Ljava/lang/String;

    move-result-object v2

    new-instance v4, Lcom/motorola/ccc/ota/ui/HtmlUtils;

    iget-object v5, p0, Lcom/motorola/ccc/ota/ui/RestartFragment;->mUpgradeInfo:Lcom/motorola/ccc/ota/ui/UpdaterUtils$UpgradeInfo;

    invoke-virtual {v5}, Lcom/motorola/ccc/ota/ui/UpdaterUtils$UpgradeInfo;->getPreInstallNotes()Ljava/lang/String;

    move-result-object v5

    invoke-direct {v4, v5}, Lcom/motorola/ccc/ota/ui/HtmlUtils;-><init>(Ljava/lang/String;)V

    const/4 v5, 0x0

    invoke-static {v2, v3, v5, v4}, Landroid/text/Html;->fromHtml(Ljava/lang/String;ILandroid/text/Html$ImageGetter;Landroid/text/Html$TagHandler;)Landroid/text/Spanned;

    move-result-object v2

    invoke-virtual {p1, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    iget-object p1, p0, Lcom/motorola/ccc/ota/ui/RestartFragment;->mPreInstallNotes:Landroid/widget/TextView;

    invoke-virtual {p1, v3}, Landroid/widget/TextView;->setVisibility(I)V

    iget-object p1, p0, Lcom/motorola/ccc/ota/ui/RestartFragment;->mPreInstallNotes:Landroid/widget/TextView;

    invoke-static {}, Landroid/text/method/LinkMovementMethod;->getInstance()Landroid/text/method/MovementMethod;

    move-result-object v2

    invoke-virtual {p1, v2}, Landroid/widget/TextView;->setMovementMethod(Landroid/text/method/MovementMethod;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception p1

    iget-object p0, p0, Lcom/motorola/ccc/ota/ui/RestartFragment;->mPreInstallNotes:Landroid/widget/TextView;

    invoke-virtual {p0, v0}, Landroid/widget/TextView;->setVisibility(I)V

    new-instance p0, Ljava/lang/StringBuilder;

    const-string v0, "RestartFragment, error setting PreInstallNotes."

    invoke-direct {p0, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-static {v1, p0}, Lcom/motorola/ccc/ota/utils/Logger;->error(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_0

    :cond_4
    iget-object p0, p0, Lcom/motorola/ccc/ota/ui/RestartFragment;->mPreInstallNotes:Landroid/widget/TextView;

    invoke-virtual {p0, v0}, Landroid/widget/TextView;->setVisibility(I)V

    :goto_0
    return-void
.end method

.method public onAttach(Landroid/content/Context;)V
    .locals 1

    invoke-super {p0, p1}, Landroidx/fragment/app/Fragment;->onAttach(Landroid/content/Context;)V

    iput-object p1, p0, Lcom/motorola/ccc/ota/ui/RestartFragment;->context:Landroid/content/Context;

    instance-of v0, p1, Landroid/app/Activity;

    if-eqz v0, :cond_0

    check-cast p1, Landroid/app/Activity;

    iput-object p1, p0, Lcom/motorola/ccc/ota/ui/RestartFragment;->activity:Landroid/app/Activity;

    :cond_0
    return-void
.end method

.method public onCreate(Landroid/os/Bundle;)V
    .locals 2

    invoke-super {p0, p1}, Landroidx/fragment/app/Fragment;->onCreate(Landroid/os/Bundle;)V

    new-instance p1, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    invoke-direct {p1}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;-><init>()V

    iput-object p1, p0, Lcom/motorola/ccc/ota/ui/RestartFragment;->settings:Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    sget-object v0, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->STATS_RESTART_ACTIVITY_PROMPT_COUNT:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    const/4 v1, 0x0

    invoke-virtual {p1, v0, v1}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->getInt(Lcom/motorola/otalib/common/settings/ISetting;I)I

    move-result p1

    iput p1, p0, Lcom/motorola/ccc/ota/ui/RestartFragment;->mPromptCount:I

    new-instance p1, Landroid/content/IntentFilter;

    invoke-direct {p1}, Landroid/content/IntentFilter;-><init>()V

    const-string v0, "com.motorola.ccc.ota.Actions.FINISH_RESTART_ACTIVITY"

    invoke-virtual {p1, v0}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    iget-object v0, p0, Lcom/motorola/ccc/ota/ui/RestartFragment;->context:Landroid/content/Context;

    iget-object v1, p0, Lcom/motorola/ccc/ota/ui/RestartFragment;->mFinishReceiver:Landroid/content/BroadcastReceiver;

    invoke-static {v0, v1, p1}, Lcom/motorola/otalib/common/utils/BroadcastUtils;->registerLocalReceiver(Landroid/content/Context;Landroid/content/BroadcastReceiver;Landroid/content/IntentFilter;)V

    iget-object p1, p0, Lcom/motorola/ccc/ota/ui/RestartFragment;->context:Landroid/content/Context;

    const-string v0, "alarm"

    invoke-virtual {p1, v0}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Landroid/app/AlarmManager;

    iput-object p1, p0, Lcom/motorola/ccc/ota/ui/RestartFragment;->mAlarmManager:Landroid/app/AlarmManager;

    invoke-virtual {p0}, Lcom/motorola/ccc/ota/ui/RestartFragment;->getArguments()Landroid/os/Bundle;

    move-result-object p1

    if-eqz p1, :cond_0

    const-string v0, "activityIntent"

    invoke-virtual {p1, v0}, Landroid/os/Bundle;->getParcelable(Ljava/lang/String;)Landroid/os/Parcelable;

    move-result-object p1

    check-cast p1, Landroid/content/Intent;

    iput-object p1, p0, Lcom/motorola/ccc/ota/ui/RestartFragment;->activityIntent:Landroid/content/Intent;

    :cond_0
    return-void
.end method

.method public onCreateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;Landroid/os/Bundle;)Landroid/view/View;
    .locals 1

    const p3, 0x7f0c0055

    const/4 v0, 0x0

    invoke-virtual {p1, p3, p2, v0}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object p1

    iput-object p1, p0, Lcom/motorola/ccc/ota/ui/RestartFragment;->rootView:Landroid/view/View;

    invoke-direct {p0}, Lcom/motorola/ccc/ota/ui/RestartFragment;->findViewsById()V

    iget-object p1, p0, Lcom/motorola/ccc/ota/ui/RestartFragment;->mWarningText:Landroid/widget/TextView;

    invoke-direct {p0}, Lcom/motorola/ccc/ota/ui/RestartFragment;->getRestartWarningText()Ljava/lang/String;

    move-result-object p2

    invoke-virtual {p1, p2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    invoke-direct {p0}, Lcom/motorola/ccc/ota/ui/RestartFragment;->handleButtons()V

    iget-object p0, p0, Lcom/motorola/ccc/ota/ui/RestartFragment;->rootView:Landroid/view/View;

    return-object p0
.end method

.method public onDestroy()V
    .locals 4

    invoke-super {p0}, Landroidx/fragment/app/Fragment;->onDestroy()V

    iget-object v0, p0, Lcom/motorola/ccc/ota/ui/RestartFragment;->settings:Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    sget-object v1, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->STATS_RESTART_ACTIVITY_PROMPT_COUNT:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    invoke-virtual {v0, v1}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->incrementPrefs(Lcom/motorola/otalib/common/settings/ISetting;)V

    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "Restart fragment prompt count "

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v1, p0, Lcom/motorola/ccc/ota/ui/RestartFragment;->settings:Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    sget-object v2, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->STATS_RESTART_ACTIVITY_PROMPT_COUNT:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    const/4 v3, 0x0

    invoke-virtual {v1, v2, v3}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->getInt(Lcom/motorola/otalib/common/settings/ISetting;I)I

    move-result v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    const-string v1, "OtaApp"

    invoke-static {v1, v0}, Lcom/motorola/ccc/ota/utils/Logger;->debug(Ljava/lang/String;Ljava/lang/String;)V

    iget-object v0, p0, Lcom/motorola/ccc/ota/ui/RestartFragment;->context:Landroid/content/Context;

    iget-object p0, p0, Lcom/motorola/ccc/ota/ui/RestartFragment;->mFinishReceiver:Landroid/content/BroadcastReceiver;

    invoke-static {v0, p0}, Lcom/motorola/otalib/common/utils/BroadcastUtils;->unregisterLocalReceiver(Landroid/content/Context;Landroid/content/BroadcastReceiver;)V

    return-void
.end method

.method public onResume()V
    .locals 2

    invoke-super {p0}, Landroidx/fragment/app/Fragment;->onResume()V

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v0

    iput-wide v0, p0, Lcom/motorola/ccc/ota/ui/RestartFragment;->launchTimeInMillis:J

    iget-object v0, p0, Lcom/motorola/ccc/ota/ui/RestartFragment;->context:Landroid/content/Context;

    invoke-static {v0}, Lcom/motorola/ccc/ota/ui/UpdaterUtils;->stopMessageActivity(Landroid/content/Context;)V

    iget-object p0, p0, Lcom/motorola/ccc/ota/ui/RestartFragment;->context:Landroid/content/Context;

    invoke-static {p0}, Lcom/motorola/ccc/ota/utils/NotificationUtils;->stopNotificationService(Landroid/content/Context;)V

    return-void
.end method

.method public onSmartUpdateConfigChanged()V
    .locals 0

    invoke-direct {p0}, Lcom/motorola/ccc/ota/ui/RestartFragment;->initializeViewAndSaveNextPrompt()V

    return-void
.end method

.method public onStart()V
    .locals 0

    invoke-super {p0}, Landroidx/fragment/app/Fragment;->onStart()V

    invoke-direct {p0}, Lcom/motorola/ccc/ota/ui/RestartFragment;->initializeViewAndSaveNextPrompt()V

    return-void
.end method

.method public onStop()V
    .locals 8

    invoke-super {p0}, Landroidx/fragment/app/Fragment;->onStop()V

    iget-object v0, p0, Lcom/motorola/ccc/ota/ui/RestartFragment;->settings:Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    sget-object v1, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->TOTAL_TIME_SPEND_ON_RESTART_SCREEN:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    iget-object v2, p0, Lcom/motorola/ccc/ota/ui/RestartFragment;->settings:Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    sget-object v3, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->TOTAL_TIME_SPEND_ON_RESTART_SCREEN:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    const-wide/16 v4, 0x0

    invoke-virtual {v2, v3, v4, v5}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->getLong(Lcom/motorola/otalib/common/settings/ISetting;J)J

    move-result-wide v2

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v4

    iget-wide v6, p0, Lcom/motorola/ccc/ota/ui/RestartFragment;->launchTimeInMillis:J

    sub-long/2addr v4, v6

    add-long/2addr v2, v4

    invoke-virtual {v0, v1, v2, v3}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->setLong(Lcom/motorola/otalib/common/settings/ISetting;J)V

    iget-object v0, p0, Lcom/motorola/ccc/ota/ui/RestartFragment;->activityIntent:Landroid/content/Intent;

    invoke-static {v0}, Lcom/motorola/ccc/ota/ui/UpdaterUtils;->getUpgradeInfoDuringOTAUpdate(Landroid/content/Intent;)Lcom/motorola/ccc/ota/ui/UpdaterUtils$UpgradeInfo;

    move-result-object v0

    iput-object v0, p0, Lcom/motorola/ccc/ota/ui/RestartFragment;->mUpgradeInfo:Lcom/motorola/ccc/ota/ui/UpdaterUtils$UpgradeInfo;

    if-nez v0, :cond_0

    return-void

    :cond_0
    iget-object v1, p0, Lcom/motorola/ccc/ota/ui/RestartFragment;->settings:Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    invoke-virtual {v0}, Lcom/motorola/ccc/ota/ui/UpdaterUtils$UpgradeInfo;->getUpdateTypeData()Ljava/lang/String;

    move-result-object v0

    invoke-static {v1, v0}, Lcom/motorola/ccc/ota/utils/SmartUpdateUtils;->isSmartUpdateNearestToInstall(Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_2

    iget-object v0, p0, Lcom/motorola/ccc/ota/ui/RestartFragment;->context:Landroid/content/Context;

    invoke-static {v0}, Lcom/motorola/ccc/ota/ui/UpdaterUtils;->isScreenOff(Landroid/content/Context;)Z

    move-result v0

    if-nez v0, :cond_1

    sget-boolean v0, Lcom/motorola/ccc/ota/ui/RestartFragment;->isTimerRunning:Z

    if-eqz v0, :cond_1

    invoke-direct {p0}, Lcom/motorola/ccc/ota/ui/RestartFragment;->handleRestartCancelOrPostponeToNextDay()V

    :cond_1
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/motorola/ccc/ota/ui/RestartFragment;->mDoNotShowNotification:Z

    const-string v0, "OtaApp"

    const-string v1, "User deferred - no notification for smart update"

    invoke-static {v0, v1}, Lcom/motorola/ccc/ota/utils/Logger;->debug(Ljava/lang/String;Ljava/lang/String;)V

    iget-object v0, p0, Lcom/motorola/ccc/ota/ui/RestartFragment;->context:Landroid/content/Context;

    const/4 v1, 0x0

    iget-wide v2, p0, Lcom/motorola/ccc/ota/ui/RestartFragment;->mNextPrompt:J

    const-string p0, "RESTART_DEFERRED"

    invoke-static {v0, p0, v1, v2, v3}, Lcom/motorola/ccc/ota/ui/UpdaterUtils;->setDeferStats(Landroid/content/Context;Ljava/lang/String;ZJ)V

    return-void

    :cond_2
    iget-object v0, p0, Lcom/motorola/ccc/ota/ui/RestartFragment;->context:Landroid/content/Context;

    invoke-static {v0}, Lcom/motorola/ccc/ota/ui/UpdaterUtils;->isDeviceLocked(Landroid/content/Context;)Z

    move-result v0

    if-nez v0, :cond_3

    iget-boolean v0, p0, Lcom/motorola/ccc/ota/ui/RestartFragment;->mDoNotShowNotification:Z

    if-nez v0, :cond_3

    invoke-direct {p0}, Lcom/motorola/ccc/ota/ui/RestartFragment;->showRestartSystemNotification()V

    :cond_3
    return-void
.end method

.method public onViewCreated(Landroid/view/View;Landroid/os/Bundle;)V
    .locals 0

    invoke-super {p0, p1, p2}, Landroidx/fragment/app/Fragment;->onViewCreated(Landroid/view/View;Landroid/os/Bundle;)V

    invoke-virtual {p0}, Lcom/motorola/ccc/ota/ui/RestartFragment;->getView()Landroid/view/View;

    move-result-object p1

    const/4 p2, 0x1

    invoke-virtual {p1, p2}, Landroid/view/View;->setFocusableInTouchMode(Z)V

    invoke-virtual {p0}, Lcom/motorola/ccc/ota/ui/RestartFragment;->getView()Landroid/view/View;

    move-result-object p1

    invoke-virtual {p1}, Landroid/view/View;->requestFocus()Z

    invoke-virtual {p0}, Lcom/motorola/ccc/ota/ui/RestartFragment;->getView()Landroid/view/View;

    move-result-object p1

    new-instance p2, Lcom/motorola/ccc/ota/ui/RestartFragment$$ExternalSyntheticLambda0;

    invoke-direct {p2, p0}, Lcom/motorola/ccc/ota/ui/RestartFragment$$ExternalSyntheticLambda0;-><init>(Lcom/motorola/ccc/ota/ui/RestartFragment;)V

    invoke-virtual {p1, p2}, Landroid/view/View;->setOnKeyListener(Landroid/view/View$OnKeyListener;)V

    return-void
.end method
