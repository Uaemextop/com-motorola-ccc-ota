.class public Lcom/motorola/ccc/ota/ui/DownloadFragment;
.super Landroidx/fragment/app/Fragment;
.source "DownloadFragment.java"


# static fields
.field private static final DIALOG_CANCEL:I = 0x2

.field private static final DIALOG_DATASAVER_ON:I = 0x3

.field private static final DIALOG_NO_NETWORK:I = 0x4

.field private static final DIALOG_USER_CHOICE:I = 0x1

.field private static final REQ_CODE:I


# instance fields
.field private activity:Landroid/app/Activity;

.field private activityIntent:Landroid/content/Intent;

.field private cm:Landroid/net/ConnectivityManager;

.field private context:Landroid/content/Context;

.field private expandableListView:Landroid/widget/ExpandableListView;

.field private imgBack:Landroid/widget/ImageView;

.field private isTransactionSafe:Z

.field private launchTimeInMillis:J

.field private mAlarmManager:Landroid/app/AlarmManager;

.field private mByPassPreDownloadDialog:Z

.field private mCancelBtn:Landroid/widget/Button;

.field private mDoNotShowNotification:Z

.field private mDownloadBtn:Landroid/widget/Button;

.field private mExpTitle:Landroid/widget/TextView;

.field private mFinishReceiver:Landroid/content/BroadcastReceiver;

.field private mForced:Z

.field private mLaterBtn:Landroid/widget/Button;

.field private mLinearLayout:Landroid/widget/LinearLayout;

.field private mLocationType:Ljava/lang/String;

.field private mNextPrompt:J

.field private mPendingIntent:Landroid/app/PendingIntent;

.field private mPreDownloadNotes:Landroid/widget/TextView;

.field private mPromptCount:I

.field private mShowDownloadOptions:Z

.field private mTargetIntent:Landroid/content/Intent;

.field private mUpdateType:Lcom/motorola/ccc/ota/ui/updateType/UpdateType$UpdateTypeInterface;

.field private mVersion:Landroid/widget/TextView;

.field private mWifiOnly:Z

.field private notificationTitle:Ljava/lang/String;

.field private notificationTxt:Ljava/lang/String;

.field private osReleaseNotes:Landroid/widget/TextView;

.field private rootView:Landroid/view/View;

.field private settings:Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

.field private updateTypeString:Ljava/lang/String;

.field private upgradeInfo:Lcom/motorola/ccc/ota/ui/UpdaterUtils$UpgradeInfo;


# direct methods
.method static bridge synthetic -$$Nest$fgetactivity(Lcom/motorola/ccc/ota/ui/DownloadFragment;)Landroid/app/Activity;
    .locals 0

    iget-object p0, p0, Lcom/motorola/ccc/ota/ui/DownloadFragment;->activity:Landroid/app/Activity;

    return-object p0
.end method

.method static bridge synthetic -$$Nest$fgetmPromptCount(Lcom/motorola/ccc/ota/ui/DownloadFragment;)I
    .locals 0

    iget p0, p0, Lcom/motorola/ccc/ota/ui/DownloadFragment;->mPromptCount:I

    return p0
.end method

.method static bridge synthetic -$$Nest$fputmDoNotShowNotification(Lcom/motorola/ccc/ota/ui/DownloadFragment;Z)V
    .locals 0

    iput-boolean p1, p0, Lcom/motorola/ccc/ota/ui/DownloadFragment;->mDoNotShowNotification:Z

    return-void
.end method

.method static bridge synthetic -$$Nest$mshowTrySmartUpdatePopUp(Lcom/motorola/ccc/ota/ui/DownloadFragment;)V
    .locals 0

    invoke-direct {p0}, Lcom/motorola/ccc/ota/ui/DownloadFragment;->showTrySmartUpdatePopUp()V

    return-void
.end method

.method public constructor <init>()V
    .locals 1

    invoke-direct {p0}, Landroidx/fragment/app/Fragment;-><init>()V

    const/4 v0, 0x0

    iput-object v0, p0, Lcom/motorola/ccc/ota/ui/DownloadFragment;->notificationTitle:Ljava/lang/String;

    iput-object v0, p0, Lcom/motorola/ccc/ota/ui/DownloadFragment;->notificationTxt:Ljava/lang/String;

    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/motorola/ccc/ota/ui/DownloadFragment;->mDoNotShowNotification:Z

    new-instance v0, Lcom/motorola/ccc/ota/ui/DownloadFragment$5;

    invoke-direct {v0, p0}, Lcom/motorola/ccc/ota/ui/DownloadFragment$5;-><init>(Lcom/motorola/ccc/ota/ui/DownloadFragment;)V

    iput-object v0, p0, Lcom/motorola/ccc/ota/ui/DownloadFragment;->mFinishReceiver:Landroid/content/BroadcastReceiver;

    return-void
.end method

.method public static createBulletTextView(Landroid/content/Context;Landroid/widget/LinearLayout;Ljava/lang/String;)V
    .locals 5

    new-instance v0, Landroid/widget/LinearLayout$LayoutParams;

    const/4 v1, -0x2

    invoke-direct {v0, v1, v1}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    const/16 v1, 0x14

    const/4 v2, 0x0

    invoke-virtual {v0, v2, v1, v2, v2}, Landroid/widget/LinearLayout$LayoutParams;->setMargins(IIII)V

    invoke-virtual {v0, v2}, Landroid/widget/LinearLayout$LayoutParams;->setMarginStart(I)V

    invoke-virtual {v0, v2}, Landroid/widget/LinearLayout$LayoutParams;->setMarginEnd(I)V

    const-string v1, "layout_inflater"

    invoke-virtual {p0, v1}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/view/LayoutInflater;

    const v3, 0x7f0c003d

    const/4 v4, 0x0

    invoke-virtual {v1, v3, v4}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/TextView;

    invoke-virtual {v1, v0}, Landroid/widget/TextView;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    new-instance v0, Landroid/text/SpannableStringBuilder;

    invoke-direct {v0}, Landroid/text/SpannableStringBuilder;-><init>()V

    invoke-virtual {v0, p2}, Landroid/text/SpannableStringBuilder;->append(Ljava/lang/CharSequence;)Landroid/text/SpannableStringBuilder;

    new-instance p2, Landroid/text/style/BulletSpan;

    invoke-virtual {p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object p0

    const v3, 0x7f060021

    invoke-virtual {p0, v3}, Landroid/content/res/Resources;->getColor(I)I

    move-result p0

    const/4 v3, 0x3

    const/16 v4, 0x18

    invoke-direct {p2, v4, p0, v3}, Landroid/text/style/BulletSpan;-><init>(III)V

    invoke-virtual {v0}, Landroid/text/SpannableStringBuilder;->length()I

    move-result p0

    const/16 v3, 0x21

    invoke-virtual {v0, p2, v2, p0, v3}, Landroid/text/SpannableStringBuilder;->setSpan(Ljava/lang/Object;III)V

    new-instance p0, Landroid/text/style/StyleSpan;

    invoke-direct {p0, v2}, Landroid/text/style/StyleSpan;-><init>(I)V

    invoke-virtual {v0}, Landroid/text/SpannableStringBuilder;->length()I

    move-result p2

    invoke-virtual {v0, p0, v2, p2, v3}, Landroid/text/SpannableStringBuilder;->setSpan(Ljava/lang/Object;III)V

    invoke-virtual {v1, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    invoke-virtual {p1, v1}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    return-void
.end method

.method private displayDialog(ILjava/lang/String;)V
    .locals 2

    iget-boolean v0, p0, Lcom/motorola/ccc/ota/ui/DownloadFragment;->isTransactionSafe:Z

    if-nez v0, :cond_0

    return-void

    :cond_0
    const/4 v0, 0x1

    if-eq p1, v0, :cond_4

    const/4 p2, 0x2

    if-eq p1, p2, :cond_3

    const/4 p2, 0x3

    if-eq p1, p2, :cond_2

    const/4 p2, 0x4

    if-eq p1, p2, :cond_1

    goto :goto_0

    :cond_1
    iget-object p1, p0, Lcom/motorola/ccc/ota/ui/DownloadFragment;->mUpdateType:Lcom/motorola/ccc/ota/ui/updateType/UpdateType$UpdateTypeInterface;

    invoke-interface {p1}, Lcom/motorola/ccc/ota/ui/updateType/UpdateType$UpdateTypeInterface;->getSystemUpdatePausedNotificationTitle()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p0}, Lcom/motorola/ccc/ota/ui/DownloadFragment;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    const v1, 0x7f0e016b

    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v0

    const-string v1, "no_network"

    invoke-direct {p0, p2, v1, p1, v0}, Lcom/motorola/ccc/ota/ui/DownloadFragment;->displayDialogInternal(ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_0

    :cond_2
    iget-object p1, p0, Lcom/motorola/ccc/ota/ui/DownloadFragment;->mUpdateType:Lcom/motorola/ccc/ota/ui/updateType/UpdateType$UpdateTypeInterface;

    invoke-interface {p1}, Lcom/motorola/ccc/ota/ui/updateType/UpdateType$UpdateTypeInterface;->getSystemUpdatePausedNotificationTitle()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p0}, Lcom/motorola/ccc/ota/ui/DownloadFragment;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    const v1, 0x7f0e016a

    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v0

    const-string v1, "data_saver"

    invoke-direct {p0, p2, v1, p1, v0}, Lcom/motorola/ccc/ota/ui/DownloadFragment;->displayDialogInternal(ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_0

    :cond_3
    invoke-virtual {p0}, Lcom/motorola/ccc/ota/ui/DownloadFragment;->getResources()Landroid/content/res/Resources;

    move-result-object p1

    const v0, 0x7f0e00bf

    invoke-virtual {p1, v0}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p0}, Lcom/motorola/ccc/ota/ui/DownloadFragment;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    const v1, 0x7f0e0135

    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v0

    const-string v1, "Dialog_Cancel"

    invoke-direct {p0, p2, v1, p1, v0}, Lcom/motorola/ccc/ota/ui/DownloadFragment;->displayDialogInternal(ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_0

    :cond_4
    const-string p1, "DownloadOptions"

    invoke-direct {p0, p1, p2}, Lcom/motorola/ccc/ota/ui/DownloadFragment;->displayUserChoiceDialogInternal(Ljava/lang/String;Ljava/lang/String;)V

    :goto_0
    return-void
.end method

.method private displayDialogInternal(ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .locals 1

    new-instance v0, Lcom/motorola/ccc/ota/ui/WarningAlertDialog$WarningAlertDialogBuilder;

    invoke-direct {v0, p1}, Lcom/motorola/ccc/ota/ui/WarningAlertDialog$WarningAlertDialogBuilder;-><init>(I)V

    invoke-virtual {v0, p3}, Lcom/motorola/ccc/ota/ui/WarningAlertDialog$WarningAlertDialogBuilder;->setTitle(Ljava/lang/String;)Lcom/motorola/ccc/ota/ui/WarningAlertDialog$WarningAlertDialogBuilder;

    move-result-object p1

    invoke-virtual {p1, p4}, Lcom/motorola/ccc/ota/ui/WarningAlertDialog$WarningAlertDialogBuilder;->setMessage(Ljava/lang/String;)Lcom/motorola/ccc/ota/ui/WarningAlertDialog$WarningAlertDialogBuilder;

    move-result-object p1

    invoke-virtual {p0}, Lcom/motorola/ccc/ota/ui/DownloadFragment;->getResources()Landroid/content/res/Resources;

    move-result-object p3

    const p4, 0x7f0e002d

    invoke-virtual {p3, p4}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object p3

    invoke-virtual {p1, p3}, Lcom/motorola/ccc/ota/ui/WarningAlertDialog$WarningAlertDialogBuilder;->setPositiveText(Ljava/lang/String;)Lcom/motorola/ccc/ota/ui/WarningAlertDialog$WarningAlertDialogBuilder;

    move-result-object p1

    const p3, 0x7f060021

    invoke-virtual {p1, p3}, Lcom/motorola/ccc/ota/ui/WarningAlertDialog$WarningAlertDialogBuilder;->setButtonColor(I)Lcom/motorola/ccc/ota/ui/WarningAlertDialog$WarningAlertDialogBuilder;

    invoke-virtual {v0}, Lcom/motorola/ccc/ota/ui/WarningAlertDialog$WarningAlertDialogBuilder;->buildDialog()Lcom/motorola/ccc/ota/ui/WarningAlertDialog;

    move-result-object p1

    invoke-virtual {p0}, Lcom/motorola/ccc/ota/ui/DownloadFragment;->getFragmentManager()Landroidx/fragment/app/FragmentManager;

    move-result-object p0

    if-eqz p0, :cond_0

    invoke-virtual {p1, p0, p2}, Landroidx/fragment/app/DialogFragment;->show(Landroidx/fragment/app/FragmentManager;Ljava/lang/String;)V

    :cond_0
    return-void
.end method

.method private displayUserChoiceDialogInternal(Ljava/lang/String;Ljava/lang/String;)V
    .locals 4

    iget-object v0, p0, Lcom/motorola/ccc/ota/ui/DownloadFragment;->activityIntent:Landroid/content/Intent;

    invoke-static {v0}, Lcom/motorola/ccc/ota/ui/UpdaterUtils;->getUpgradeInfoDuringOTAUpdate(Landroid/content/Intent;)Lcom/motorola/ccc/ota/ui/UpdaterUtils$UpgradeInfo;

    move-result-object v0

    if-nez v0, :cond_0

    return-void

    :cond_0
    invoke-virtual {v0}, Lcom/motorola/ccc/ota/ui/UpdaterUtils$UpgradeInfo;->getUpdateTypeData()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0}, Lcom/motorola/ccc/ota/ui/UpdaterUtils$UpgradeInfo;->getSize()J

    move-result-wide v2

    const/4 v0, 0x1

    invoke-static {v1, v2, v3, p2, v0}, Lcom/motorola/ccc/ota/ui/DownloadOptionsFragment;->newInstance(Ljava/lang/String;JLjava/lang/String;I)Lcom/motorola/ccc/ota/ui/DownloadOptionsFragment;

    move-result-object p2

    const/4 v0, 0x0

    invoke-virtual {p2, p0, v0}, Landroidx/fragment/app/DialogFragment;->setTargetFragment(Landroidx/fragment/app/Fragment;I)V

    invoke-virtual {p0}, Lcom/motorola/ccc/ota/ui/DownloadFragment;->getFragmentManager()Landroidx/fragment/app/FragmentManager;

    move-result-object p0

    if-eqz p0, :cond_1

    invoke-virtual {p2, p0, p1}, Landroidx/fragment/app/DialogFragment;->show(Landroidx/fragment/app/FragmentManager;Ljava/lang/String;)V

    :cond_1
    return-void
.end method

.method private getTargetIntent(Landroid/content/Intent;)Landroid/content/Intent;
    .locals 3

    const-string v0, "com.motorola.blur.service.blur.upgrade.version"

    invoke-virtual {p1, v0}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    iget-object p0, p0, Lcom/motorola/ccc/ota/ui/DownloadFragment;->settings:Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    sget-object v1, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->METADATA:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    invoke-virtual {p0, v1}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->getString(Lcom/motorola/otalib/common/settings/ISetting;)Ljava/lang/String;

    move-result-object p0

    const-string v1, "com.motorola.blur.service.blur.upgrade.location_type"

    invoke-virtual {p1, v1}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    const-string v2, "com.motorola.blur.service.blur.upgrade.download_opt_check"

    invoke-virtual {p1, v2}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    invoke-static {v0, p0, v1, p1}, Lcom/motorola/ccc/ota/utils/UpgradeUtilMethods;->getUpdateNotificationIntent(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    move-result-object p0

    return-object p0
.end method

.method private handleButtons()V
    .locals 2

    iget-object v0, p0, Lcom/motorola/ccc/ota/ui/DownloadFragment;->rootView:Landroid/view/View;

    const v1, 0x7f09010d

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/Button;

    iput-object v0, p0, Lcom/motorola/ccc/ota/ui/DownloadFragment;->mCancelBtn:Landroid/widget/Button;

    new-instance v1, Lcom/motorola/ccc/ota/ui/DownloadFragment$1;

    invoke-direct {v1, p0}, Lcom/motorola/ccc/ota/ui/DownloadFragment$1;-><init>(Lcom/motorola/ccc/ota/ui/DownloadFragment;)V

    invoke-virtual {v0, v1}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    iget-object v0, p0, Lcom/motorola/ccc/ota/ui/DownloadFragment;->rootView:Landroid/view/View;

    const v1, 0x7f09009c

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/Button;

    iput-object v0, p0, Lcom/motorola/ccc/ota/ui/DownloadFragment;->mDownloadBtn:Landroid/widget/Button;

    new-instance v1, Lcom/motorola/ccc/ota/ui/DownloadFragment$2;

    invoke-direct {v1, p0}, Lcom/motorola/ccc/ota/ui/DownloadFragment$2;-><init>(Lcom/motorola/ccc/ota/ui/DownloadFragment;)V

    invoke-virtual {v0, v1}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    iget-object v0, p0, Lcom/motorola/ccc/ota/ui/DownloadFragment;->rootView:Landroid/view/View;

    const v1, 0x7f09010c

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/Button;

    iput-object v0, p0, Lcom/motorola/ccc/ota/ui/DownloadFragment;->mLaterBtn:Landroid/widget/Button;

    new-instance v1, Lcom/motorola/ccc/ota/ui/DownloadFragment$3;

    invoke-direct {v1, p0}, Lcom/motorola/ccc/ota/ui/DownloadFragment$3;-><init>(Lcom/motorola/ccc/ota/ui/DownloadFragment;)V

    invoke-virtual {v0, v1}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    iget-object v0, p0, Lcom/motorola/ccc/ota/ui/DownloadFragment;->rootView:Landroid/view/View;

    const v1, 0x7f0900e0

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/ImageView;

    iput-object v0, p0, Lcom/motorola/ccc/ota/ui/DownloadFragment;->imgBack:Landroid/widget/ImageView;

    new-instance v1, Lcom/motorola/ccc/ota/ui/DownloadFragment$4;

    invoke-direct {v1, p0}, Lcom/motorola/ccc/ota/ui/DownloadFragment$4;-><init>(Lcom/motorola/ccc/ota/ui/DownloadFragment;)V

    invoke-virtual {v0, v1}, Landroid/widget/ImageView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    return-void
.end method

.method private handleLaterOption()V
    .locals 8

    iget-object v0, p0, Lcom/motorola/ccc/ota/ui/DownloadFragment;->upgradeInfo:Lcom/motorola/ccc/ota/ui/UpdaterUtils$UpgradeInfo;

    iget v1, p0, Lcom/motorola/ccc/ota/ui/DownloadFragment;->mPromptCount:I

    invoke-virtual {v0, v1}, Lcom/motorola/ccc/ota/ui/UpdaterUtils$UpgradeInfo;->getDelay(I)I

    move-result v0

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "Next download reminder at status bar scheduled in: "

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " mins."

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    const-string v2, "OtaApp"

    invoke-static {v2, v1}, Lcom/motorola/ccc/ota/utils/Logger;->info(Ljava/lang/String;Ljava/lang/String;)V

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v1

    int-to-long v3, v0

    const-wide/32 v5, 0xea60

    mul-long/2addr v5, v3

    add-long/2addr v1, v5

    iput-wide v1, p0, Lcom/motorola/ccc/ota/ui/DownloadFragment;->mNextPrompt:J

    iget-object v0, p0, Lcom/motorola/ccc/ota/ui/DownloadFragment;->context:Landroid/content/Context;

    iget-object v1, p0, Lcom/motorola/ccc/ota/ui/DownloadFragment;->notificationTitle:Ljava/lang/String;

    iget-object v2, p0, Lcom/motorola/ccc/ota/ui/DownloadFragment;->notificationTxt:Ljava/lang/String;

    iget-object v5, p0, Lcom/motorola/ccc/ota/ui/DownloadFragment;->mTargetIntent:Landroid/content/Intent;

    invoke-static {v0, v1, v2, v5}, Lcom/motorola/ccc/ota/utils/NotificationUtils;->fillDownloadLaterNotificationDetails(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Landroid/content/Intent;)Landroid/content/Intent;

    move-result-object v0

    iget-object v1, p0, Lcom/motorola/ccc/ota/ui/DownloadFragment;->context:Landroid/content/Context;

    const/high16 v2, 0x14000000

    const/4 v5, 0x0

    invoke-static {v1, v5, v0, v2}, Landroid/app/PendingIntent;->getService(Landroid/content/Context;ILandroid/content/Intent;I)Landroid/app/PendingIntent;

    move-result-object v0

    const/4 v1, 0x1

    iput-boolean v1, p0, Lcom/motorola/ccc/ota/ui/DownloadFragment;->mDoNotShowNotification:Z

    iget-object v1, p0, Lcom/motorola/ccc/ota/ui/DownloadFragment;->mAlarmManager:Landroid/app/AlarmManager;

    iget-object v2, p0, Lcom/motorola/ccc/ota/ui/DownloadFragment;->mPendingIntent:Landroid/app/PendingIntent;

    invoke-virtual {v1, v2}, Landroid/app/AlarmManager;->cancel(Landroid/app/PendingIntent;)V

    iget-object v1, p0, Lcom/motorola/ccc/ota/ui/DownloadFragment;->mAlarmManager:Landroid/app/AlarmManager;

    iget-wide v6, p0, Lcom/motorola/ccc/ota/ui/DownloadFragment;->mNextPrompt:J

    invoke-virtual {v1, v5, v6, v7, v0}, Landroid/app/AlarmManager;->setExactAndAllowWhileIdle(IJLandroid/app/PendingIntent;)V

    iget-object v0, p0, Lcom/motorola/ccc/ota/ui/DownloadFragment;->context:Landroid/content/Context;

    const-string v1, "DOWNLOAD_DEFERRED"

    invoke-static {v0, v1, v5, v3, v4}, Lcom/motorola/ccc/ota/ui/UpdaterUtils;->setDeferStats(Landroid/content/Context;Ljava/lang/String;ZJ)V

    iget-wide v0, p0, Lcom/motorola/ccc/ota/ui/DownloadFragment;->mNextPrompt:J

    invoke-static {v0, v1}, Lcom/motorola/ccc/ota/ui/UpdaterUtils;->saveNextPrompt(J)V

    return-void
.end method

.method private initUI()V
    .locals 2

    invoke-virtual {p0}, Lcom/motorola/ccc/ota/ui/DownloadFragment;->getArguments()Landroid/os/Bundle;

    move-result-object v0

    if-eqz v0, :cond_0

    const-string v1, "activityIntent"

    invoke-virtual {v0, v1}, Landroid/os/Bundle;->getParcelable(Ljava/lang/String;)Landroid/os/Parcelable;

    move-result-object v0

    check-cast v0, Landroid/content/Intent;

    iput-object v0, p0, Lcom/motorola/ccc/ota/ui/DownloadFragment;->activityIntent:Landroid/content/Intent;

    :cond_0
    iget-object v0, p0, Lcom/motorola/ccc/ota/ui/DownloadFragment;->rootView:Landroid/view/View;

    const v1, 0x7f0900a5

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p0, Lcom/motorola/ccc/ota/ui/DownloadFragment;->mVersion:Landroid/widget/TextView;

    iget-object v0, p0, Lcom/motorola/ccc/ota/ui/DownloadFragment;->rootView:Landroid/view/View;

    const v1, 0x7f09012c

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p0, Lcom/motorola/ccc/ota/ui/DownloadFragment;->mPreDownloadNotes:Landroid/widget/TextView;

    invoke-direct {p0}, Lcom/motorola/ccc/ota/ui/DownloadFragment;->handleButtons()V

    iget-object v0, p0, Lcom/motorola/ccc/ota/ui/DownloadFragment;->rootView:Landroid/view/View;

    const v1, 0x7f0900b7

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p0, Lcom/motorola/ccc/ota/ui/DownloadFragment;->mExpTitle:Landroid/widget/TextView;

    iget-object v0, p0, Lcom/motorola/ccc/ota/ui/DownloadFragment;->rootView:Landroid/view/View;

    const v1, 0x7f0900b9

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/ExpandableListView;

    iput-object v0, p0, Lcom/motorola/ccc/ota/ui/DownloadFragment;->expandableListView:Landroid/widget/ExpandableListView;

    iget-object v0, p0, Lcom/motorola/ccc/ota/ui/DownloadFragment;->rootView:Landroid/view/View;

    const v1, 0x7f090116

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p0, Lcom/motorola/ccc/ota/ui/DownloadFragment;->osReleaseNotes:Landroid/widget/TextView;

    iget-object v0, p0, Lcom/motorola/ccc/ota/ui/DownloadFragment;->rootView:Landroid/view/View;

    const v1, 0x7f0900f2

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/LinearLayout;

    iput-object v0, p0, Lcom/motorola/ccc/ota/ui/DownloadFragment;->mLinearLayout:Landroid/widget/LinearLayout;

    return-void
.end method

.method private setDeferTimeAutomatically(I)V
    .locals 8

    iget-object v0, p0, Lcom/motorola/ccc/ota/ui/DownloadFragment;->context:Landroid/content/Context;

    iget-object v1, p0, Lcom/motorola/ccc/ota/ui/DownloadFragment;->notificationTitle:Ljava/lang/String;

    iget-object v2, p0, Lcom/motorola/ccc/ota/ui/DownloadFragment;->notificationTxt:Ljava/lang/String;

    iget-object v3, p0, Lcom/motorola/ccc/ota/ui/DownloadFragment;->mTargetIntent:Landroid/content/Intent;

    invoke-static {v0, v1, v2, v3}, Lcom/motorola/ccc/ota/utils/NotificationUtils;->fillDownloadLaterNotificationDetails(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Landroid/content/Intent;)Landroid/content/Intent;

    move-result-object v0

    iget-object v1, p0, Lcom/motorola/ccc/ota/ui/DownloadFragment;->context:Landroid/content/Context;

    const/high16 v2, 0x14000000

    const/4 v3, 0x0

    invoke-static {v1, v3, v0, v2}, Landroid/app/PendingIntent;->getService(Landroid/content/Context;ILandroid/content/Intent;I)Landroid/app/PendingIntent;

    move-result-object v0

    const-string v1, "OtaApp"

    if-eqz v0, :cond_0

    const-string v2, "cancelling the previous pending intent set for download later"

    invoke-static {v1, v2}, Lcom/motorola/ccc/ota/utils/Logger;->debug(Ljava/lang/String;Ljava/lang/String;)V

    iget-object v2, p0, Lcom/motorola/ccc/ota/ui/DownloadFragment;->mAlarmManager:Landroid/app/AlarmManager;

    invoke-virtual {v2, v0}, Landroid/app/AlarmManager;->cancel(Landroid/app/PendingIntent;)V

    :cond_0
    new-instance v0, Ljava/lang/StringBuilder;

    const-string v2, "next automatic download prompt (serverAnnoy)  is scheduled in : "

    invoke-direct {v0, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v2, " mins."

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v1, v0}, Lcom/motorola/ccc/ota/utils/Logger;->debug(Ljava/lang/String;Ljava/lang/String;)V

    iget-object v0, p0, Lcom/motorola/ccc/ota/ui/DownloadFragment;->mAlarmManager:Landroid/app/AlarmManager;

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v1

    int-to-long v4, p1

    const-wide/32 v6, 0xea60

    mul-long/2addr v4, v6

    add-long/2addr v1, v4

    iget-object p0, p0, Lcom/motorola/ccc/ota/ui/DownloadFragment;->mPendingIntent:Landroid/app/PendingIntent;

    invoke-virtual {v0, v3, v1, v2, p0}, Landroid/app/AlarmManager;->set(IJLandroid/app/PendingIntent;)V

    return-void
.end method

.method private setPreDownloadInstructions()V
    .locals 4

    iget-object v0, p0, Lcom/motorola/ccc/ota/ui/DownloadFragment;->context:Landroid/content/Context;

    iget-object v1, p0, Lcom/motorola/ccc/ota/ui/DownloadFragment;->mLinearLayout:Landroid/widget/LinearLayout;

    invoke-virtual {v0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    const v3, 0x7f0e017b

    invoke-virtual {v2, v3}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v2

    invoke-static {v0, v1, v2}, Lcom/motorola/ccc/ota/ui/DownloadFragment;->createBulletTextView(Landroid/content/Context;Landroid/widget/LinearLayout;Ljava/lang/String;)V

    iget-object v0, p0, Lcom/motorola/ccc/ota/ui/DownloadFragment;->context:Landroid/content/Context;

    iget-object v1, p0, Lcom/motorola/ccc/ota/ui/DownloadFragment;->mLinearLayout:Landroid/widget/LinearLayout;

    invoke-virtual {v0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    const v3, 0x7f0e0141

    invoke-virtual {v2, v3}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v2

    invoke-static {v0, v1, v2}, Lcom/motorola/ccc/ota/ui/DownloadFragment;->createBulletTextView(Landroid/content/Context;Landroid/widget/LinearLayout;Ljava/lang/String;)V

    invoke-static {}, Lcom/motorola/ccc/ota/utils/BuildPropReader;->isUEUpdateEnabled()Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/motorola/ccc/ota/ui/DownloadFragment;->context:Landroid/content/Context;

    iget-object p0, p0, Lcom/motorola/ccc/ota/ui/DownloadFragment;->mLinearLayout:Landroid/widget/LinearLayout;

    invoke-virtual {v0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    const v2, 0x7f0e00c5

    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, p0, v1}, Lcom/motorola/ccc/ota/ui/DownloadFragment;->createBulletTextView(Landroid/content/Context;Landroid/widget/LinearLayout;Ljava/lang/String;)V

    :cond_0
    return-void
.end method

.method private showTrySmartUpdatePopUp()V
    .locals 8

    iget-object v0, p0, Lcom/motorola/ccc/ota/ui/DownloadFragment;->settings:Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    iget-object v1, p0, Lcom/motorola/ccc/ota/ui/DownloadFragment;->updateTypeString:Ljava/lang/String;

    const/4 v2, 0x1

    invoke-static {v0, v1, v2}, Lcom/motorola/ccc/ota/utils/SmartUpdateUtils;->shouldShowTrySmartUpdatePopUp(Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;Ljava/lang/String;Z)Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-virtual {p0}, Lcom/motorola/ccc/ota/ui/DownloadFragment;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    const v1, 0x7f0e0197

    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {p0}, Lcom/motorola/ccc/ota/ui/DownloadFragment;->getContext()Landroid/content/Context;

    move-result-object v2

    iget-object v4, p0, Lcom/motorola/ccc/ota/ui/DownloadFragment;->mUpdateType:Lcom/motorola/ccc/ota/ui/updateType/UpdateType$UpdateTypeInterface;

    iget-object v5, p0, Lcom/motorola/ccc/ota/ui/DownloadFragment;->activity:Landroid/app/Activity;

    iget-object v6, p0, Lcom/motorola/ccc/ota/ui/DownloadFragment;->settings:Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    sget-object p0, Lcom/motorola/ccc/ota/utils/SmartUpdateUtils$SmartUpdateLaunchMode;->TRY_SMART_UPDATES_POPUP_DOWNLOAD:Lcom/motorola/ccc/ota/utils/SmartUpdateUtils$SmartUpdateLaunchMode;

    invoke-virtual {p0}, Lcom/motorola/ccc/ota/utils/SmartUpdateUtils$SmartUpdateLaunchMode;->name()Ljava/lang/String;

    move-result-object v7

    invoke-static/range {v2 .. v7}, Lcom/motorola/ccc/ota/utils/SmartUpdateUtils;->showTrySmartUpdatePopUp(Landroid/content/Context;Ljava/lang/String;Lcom/motorola/ccc/ota/ui/updateType/UpdateType$UpdateTypeInterface;Landroid/app/Activity;Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;Ljava/lang/String;)V

    goto :goto_0

    :cond_0
    iget-object p0, p0, Lcom/motorola/ccc/ota/ui/DownloadFragment;->activity:Landroid/app/Activity;

    invoke-virtual {p0}, Landroid/app/Activity;->finish()V

    :goto_0
    return-void
.end method


# virtual methods
.method cancel()V
    .locals 4

    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/motorola/ccc/ota/ui/DownloadFragment;->mDoNotShowNotification:Z

    iget-object v0, p0, Lcom/motorola/ccc/ota/ui/DownloadFragment;->mAlarmManager:Landroid/app/AlarmManager;

    iget-object v1, p0, Lcom/motorola/ccc/ota/ui/DownloadFragment;->mPendingIntent:Landroid/app/PendingIntent;

    invoke-virtual {v0, v1}, Landroid/app/AlarmManager;->cancel(Landroid/app/PendingIntent;)V

    iget-object v0, p0, Lcom/motorola/ccc/ota/ui/DownloadFragment;->activityIntent:Landroid/content/Intent;

    const-string v1, "com.motorola.blur.service.blur.upgrade.version"

    invoke-virtual {v0, v1}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    iget-object v1, p0, Lcom/motorola/ccc/ota/ui/DownloadFragment;->context:Landroid/content/Context;

    const/4 v2, 0x0

    const/4 v3, 0x0

    invoke-static {v1, v0, v2, v3, v3}, Lcom/motorola/ccc/ota/utils/UpgradeUtilMethods;->sendUpdateNotificationResponse(Landroid/content/Context;Ljava/lang/String;ZLjava/lang/String;Ljava/lang/String;)V

    iget-object v0, p0, Lcom/motorola/ccc/ota/ui/DownloadFragment;->settings:Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    sget-object v1, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->USERCHOICE:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    invoke-virtual {v0, v1}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->removeConfig(Lcom/motorola/otalib/common/settings/ISetting;)V

    iget-object p0, p0, Lcom/motorola/ccc/ota/ui/DownloadFragment;->settings:Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    invoke-static {p0}, Lcom/motorola/ccc/ota/utils/NotificationUtils;->clearNextPromptDetails(Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;)V

    return-void
.end method

.method downloadNow(Ljava/lang/String;)V
    .locals 5

    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/motorola/ccc/ota/ui/DownloadFragment;->mDoNotShowNotification:Z

    iget-object v1, p0, Lcom/motorola/ccc/ota/ui/DownloadFragment;->mAlarmManager:Landroid/app/AlarmManager;

    iget-object v2, p0, Lcom/motorola/ccc/ota/ui/DownloadFragment;->mPendingIntent:Landroid/app/PendingIntent;

    invoke-virtual {v1, v2}, Landroid/app/AlarmManager;->cancel(Landroid/app/PendingIntent;)V

    iget-object v1, p0, Lcom/motorola/ccc/ota/ui/DownloadFragment;->activityIntent:Landroid/content/Intent;

    const-string v2, "com.motorola.blur.service.blur.upgrade.version"

    invoke-virtual {v1, v2}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    iget-boolean v2, p0, Lcom/motorola/ccc/ota/ui/DownloadFragment;->mShowDownloadOptions:Z

    if-eqz v2, :cond_2

    iget-boolean v2, p0, Lcom/motorola/ccc/ota/ui/DownloadFragment;->mForced:Z

    if-eqz v2, :cond_0

    iget-boolean v2, p0, Lcom/motorola/ccc/ota/ui/DownloadFragment;->mByPassPreDownloadDialog:Z

    invoke-static {v2}, Lcom/motorola/ccc/ota/ui/UpdaterUtils;->bypassPreDownloadDialog(Z)Z

    move-result v2

    if-nez v2, :cond_2

    :cond_0
    iget-object v2, p0, Lcom/motorola/ccc/ota/ui/DownloadFragment;->settings:Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    sget-object v3, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->USERCHOICE:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    const/4 v4, 0x0

    invoke-virtual {v2, v3, v4}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->getInt(Lcom/motorola/otalib/common/settings/ISetting;I)I

    move-result v2

    sget-object v3, Lcom/motorola/ccc/ota/utils/UpgradeUtilConstants$ResponseFlavour;->RESPONSE_FLAVOUR_WIFI:Lcom/motorola/ccc/ota/utils/UpgradeUtilConstants$ResponseFlavour;

    invoke-virtual {v3}, Lcom/motorola/ccc/ota/utils/UpgradeUtilConstants$ResponseFlavour;->ordinal()I

    move-result v3

    if-ne v2, v3, :cond_1

    sget-object v2, Lcom/motorola/ccc/ota/utils/UpgradeUtilConstants$ResponseFlavour;->RESPONSE_FLAVOUR_WIFI:Lcom/motorola/ccc/ota/utils/UpgradeUtilConstants$ResponseFlavour;

    invoke-virtual {v2}, Lcom/motorola/ccc/ota/utils/UpgradeUtilConstants$ResponseFlavour;->name()Ljava/lang/String;

    move-result-object v2

    goto :goto_0

    :cond_1
    sget-object v2, Lcom/motorola/ccc/ota/utils/UpgradeUtilConstants$ResponseFlavour;->RESPONSE_FLAVOUR_WIFI_AND_MOBILE:Lcom/motorola/ccc/ota/utils/UpgradeUtilConstants$ResponseFlavour;

    invoke-virtual {v2}, Lcom/motorola/ccc/ota/utils/UpgradeUtilConstants$ResponseFlavour;->name()Ljava/lang/String;

    move-result-object v2

    invoke-static {v0}, Lcom/motorola/ccc/ota/ui/UpdaterUtils;->setAutomaticDownloadForCellular(Z)V

    goto :goto_0

    :cond_2
    const/4 v2, 0x0

    :goto_0
    iget-object v3, p0, Lcom/motorola/ccc/ota/ui/DownloadFragment;->context:Landroid/content/Context;

    invoke-static {v3}, Lcom/motorola/ccc/ota/ui/UpdaterUtils;->isBatteryLowToStartDownload(Landroid/content/Context;)Z

    move-result v3

    if-eqz v3, :cond_3

    invoke-static {}, Lcom/motorola/ccc/ota/ui/UpdaterUtils;->enableReceiversForBatteryLow()V

    :cond_3
    iget-object v3, p0, Lcom/motorola/ccc/ota/ui/DownloadFragment;->context:Landroid/content/Context;

    invoke-static {v3, v1, v0, v2, p1}, Lcom/motorola/ccc/ota/utils/UpgradeUtilMethods;->sendUpdateNotificationResponse(Landroid/content/Context;Ljava/lang/String;ZLjava/lang/String;Ljava/lang/String;)V

    iget-object p1, p0, Lcom/motorola/ccc/ota/ui/DownloadFragment;->settings:Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    sget-object v0, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->USERCHOICE:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    invoke-virtual {p1, v0}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->removeConfig(Lcom/motorola/otalib/common/settings/ISetting;)V

    iget-object p1, p0, Lcom/motorola/ccc/ota/ui/DownloadFragment;->settings:Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    invoke-static {p1}, Lcom/motorola/ccc/ota/utils/NotificationUtils;->clearNextPromptDetails(Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;)V

    invoke-static {}, Lcom/motorola/ccc/ota/utils/BuildPropReader;->isFotaATT()Z

    move-result p1

    if-eqz p1, :cond_4

    iget-object p0, p0, Lcom/motorola/ccc/ota/ui/DownloadFragment;->activity:Landroid/app/Activity;

    invoke-virtual {p0}, Landroid/app/Activity;->finish()V

    return-void

    :cond_4
    new-instance p1, Landroid/os/Bundle;

    invoke-direct {p1}, Landroid/os/Bundle;-><init>()V

    invoke-static {}, Lcom/motorola/ccc/ota/utils/BuildPropReader;->isStreamingUpdate()Z

    move-result v0

    if-eqz v0, :cond_5

    sget-object v0, Lcom/motorola/otalib/common/utils/UpgradeUtils$Error;->ERR_BACKGROUND_INSTALL:Lcom/motorola/otalib/common/utils/UpgradeUtils$Error;

    invoke-virtual {v0}, Lcom/motorola/otalib/common/utils/UpgradeUtils$Error;->toString()Ljava/lang/String;

    move-result-object v0

    goto :goto_1

    :cond_5
    sget-object v0, Lcom/motorola/otalib/common/utils/UpgradeUtils$Error;->ERR_DOWNLOADING:Lcom/motorola/otalib/common/utils/UpgradeUtils$Error;

    invoke-virtual {v0}, Lcom/motorola/otalib/common/utils/UpgradeUtils$Error;->toString()Ljava/lang/String;

    move-result-object v0

    :goto_1
    const-string v1, "com.motorola.blur.service.blur.upgrade.check_error"

    invoke-virtual {p1, v1, v0}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    iget-object p0, p0, Lcom/motorola/ccc/ota/ui/DownloadFragment;->activity:Landroid/app/Activity;

    check-cast p0, Lcom/motorola/ccc/ota/ui/FragmentActionListener;

    invoke-interface {p0, p1}, Lcom/motorola/ccc/ota/ui/FragmentActionListener;->onUpdateActionResponse(Landroid/os/Bundle;)V

    return-void
.end method

.method handleCancelOption()V
    .locals 2

    const-string v0, "OtaApp"

    const-string v1, "User declined to accept the upgrade, setting don\'t annoy user preferences"

    invoke-static {v0, v1}, Lcom/motorola/ccc/ota/utils/Logger;->info(Ljava/lang/String;Ljava/lang/String;)V

    iget-object v0, p0, Lcom/motorola/ccc/ota/ui/DownloadFragment;->upgradeInfo:Lcom/motorola/ccc/ota/ui/UpdaterUtils$UpgradeInfo;

    invoke-virtual {v0}, Lcom/motorola/ccc/ota/ui/UpdaterUtils$UpgradeInfo;->getOptionalUpdateCancelReminderDays()I

    move-result v0

    invoke-static {v0}, Lcom/motorola/ccc/ota/ui/UpdaterUtils;->setDontBotherPreferences(I)V

    invoke-virtual {p0}, Lcom/motorola/ccc/ota/ui/DownloadFragment;->cancel()V

    const/4 v0, 0x2

    const/4 v1, 0x0

    invoke-direct {p0, v0, v1}, Lcom/motorola/ccc/ota/ui/DownloadFragment;->displayDialog(ILjava/lang/String;)V

    return-void
.end method

.method handleDownloadLaterOption()V
    .locals 2

    const-string v0, "OtaApp"

    const-string v1, "OTA download postponed by user"

    invoke-static {v0, v1}, Lcom/motorola/ccc/ota/utils/Logger;->info(Ljava/lang/String;Ljava/lang/String;)V

    invoke-direct {p0}, Lcom/motorola/ccc/ota/ui/DownloadFragment;->handleLaterOption()V

    return-void
.end method

.method handleDownloadOption(Ljava/lang/String;)V
    .locals 3

    const-string v0, "OTA download accepted by user!"

    const-string v1, "OtaApp"

    invoke-static {v1, v0}, Lcom/motorola/ccc/ota/utils/Logger;->info(Ljava/lang/String;Ljava/lang/String;)V

    const-string v0, "sdcard"

    iget-object v2, p0, Lcom/motorola/ccc/ota/ui/DownloadFragment;->mLocationType:Ljava/lang/String;

    invoke-virtual {v0, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    const-string v0, "Sdcard update,proceed with download"

    invoke-static {v1, v0}, Lcom/motorola/ccc/ota/utils/Logger;->debug(Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {p0, p1}, Lcom/motorola/ccc/ota/ui/DownloadFragment;->downloadNow(Ljava/lang/String;)V

    return-void

    :cond_0
    iget-object v0, p0, Lcom/motorola/ccc/ota/ui/DownloadFragment;->cm:Landroid/net/ConnectivityManager;

    invoke-static {v0}, Lcom/motorola/otalib/common/utils/NetworkUtils;->isNetWorkConnected(Landroid/net/ConnectivityManager;)Z

    move-result v0

    if-nez v0, :cond_1

    const/4 v0, 0x4

    invoke-direct {p0, v0, p1}, Lcom/motorola/ccc/ota/ui/DownloadFragment;->displayDialog(ILjava/lang/String;)V

    return-void

    :cond_1
    invoke-static {}, Lcom/motorola/ccc/ota/ui/UpdaterUtils;->isDeviceInDatasaverMode()Z

    move-result v0

    if-eqz v0, :cond_2

    const/4 v0, 0x3

    invoke-direct {p0, v0, p1}, Lcom/motorola/ccc/ota/ui/DownloadFragment;->displayDialog(ILjava/lang/String;)V

    return-void

    :cond_2
    iget-object v0, p0, Lcom/motorola/ccc/ota/ui/DownloadFragment;->context:Landroid/content/Context;

    invoke-static {v0}, Lcom/motorola/ccc/ota/ui/UpdaterUtils;->isBatteryLowToStartDownload(Landroid/content/Context;)Z

    move-result v0

    if-eqz v0, :cond_3

    iget-boolean v0, p0, Lcom/motorola/ccc/ota/ui/DownloadFragment;->mShowDownloadOptions:Z

    if-nez v0, :cond_3

    invoke-static {}, Lcom/motorola/ccc/ota/ui/UpdaterUtils;->enableReceiversForBatteryLow()V

    invoke-virtual {p0, p1}, Lcom/motorola/ccc/ota/ui/DownloadFragment;->downloadNow(Ljava/lang/String;)V

    return-void

    :cond_3
    invoke-static {}, Lcom/motorola/ccc/ota/utils/BuildPropReader;->isBotaATT()Z

    move-result v0

    if-nez v0, :cond_6

    iget-boolean v0, p0, Lcom/motorola/ccc/ota/ui/DownloadFragment;->mWifiOnly:Z

    if-eqz v0, :cond_4

    iget-boolean v0, p0, Lcom/motorola/ccc/ota/ui/DownloadFragment;->mShowDownloadOptions:Z

    if-nez v0, :cond_4

    goto :goto_1

    :cond_4
    iget-boolean v0, p0, Lcom/motorola/ccc/ota/ui/DownloadFragment;->mShowDownloadOptions:Z

    if-eqz v0, :cond_5

    const/4 v0, 0x1

    invoke-direct {p0, v0, p1}, Lcom/motorola/ccc/ota/ui/DownloadFragment;->displayDialog(ILjava/lang/String;)V

    goto :goto_0

    :cond_5
    invoke-virtual {p0, p1}, Lcom/motorola/ccc/ota/ui/DownloadFragment;->downloadNow(Ljava/lang/String;)V

    :goto_0
    return-void

    :cond_6
    :goto_1
    const-string v0, "Wi-Fi only package or ATT, proceed with download"

    invoke-static {v1, v0}, Lcom/motorola/ccc/ota/utils/Logger;->debug(Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {p0, p1}, Lcom/motorola/ccc/ota/ui/DownloadFragment;->downloadNow(Ljava/lang/String;)V

    return-void
.end method

.method initView(Lcom/motorola/ccc/ota/ui/UpdaterUtils$UpgradeInfo;)V
    .locals 5

    invoke-virtual {p1}, Lcom/motorola/ccc/ota/ui/UpdaterUtils$UpgradeInfo;->getDisplayVersion()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0}, Lcom/motorola/ccc/ota/ui/DownloadFragment;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    invoke-virtual {p0}, Lcom/motorola/ccc/ota/ui/DownloadFragment;->getContext()Landroid/content/Context;

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

    invoke-virtual {p0, v0, p1}, Lcom/motorola/ccc/ota/ui/DownloadFragment;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p1

    iget-object v0, p0, Lcom/motorola/ccc/ota/ui/DownloadFragment;->mVersion:Landroid/widget/TextView;

    invoke-virtual {p0, v0, p1}, Lcom/motorola/ccc/ota/ui/DownloadFragment;->setVersionOTA(Landroid/widget/TextView;Ljava/lang/String;)V

    return-void
.end method

.method synthetic lambda$onViewCreated$0$com-motorola-ccc-ota-ui-DownloadFragment(Landroid/view/View;ILandroid/view/KeyEvent;)Z
    .locals 0

    const/4 p1, 0x4

    if-ne p2, p1, :cond_1

    iget p1, p0, Lcom/motorola/ccc/ota/ui/DownloadFragment;->mPromptCount:I

    const/4 p2, 0x5

    if-lt p1, p2, :cond_0

    invoke-direct {p0}, Lcom/motorola/ccc/ota/ui/DownloadFragment;->showTrySmartUpdatePopUp()V

    goto :goto_0

    :cond_0
    iget-object p0, p0, Lcom/motorola/ccc/ota/ui/DownloadFragment;->activity:Landroid/app/Activity;

    invoke-virtual {p0}, Landroid/app/Activity;->finish()V

    :goto_0
    const/4 p0, 0x1

    return p0

    :cond_1
    const/4 p0, 0x0

    return p0
.end method

.method public onActivityCreated(Landroid/os/Bundle;)V
    .locals 13

    invoke-super {p0, p1}, Landroidx/fragment/app/Fragment;->onActivityCreated(Landroid/os/Bundle;)V

    new-instance p1, Landroid/content/IntentFilter;

    invoke-direct {p1}, Landroid/content/IntentFilter;-><init>()V

    const-string v0, "com.motorola.ccc.ota.Actions.FINISH_DOWNLOAD_ACTIVITY"

    invoke-virtual {p1, v0}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    iget-object v0, p0, Lcom/motorola/ccc/ota/ui/DownloadFragment;->context:Landroid/content/Context;

    iget-object v1, p0, Lcom/motorola/ccc/ota/ui/DownloadFragment;->mFinishReceiver:Landroid/content/BroadcastReceiver;

    invoke-static {v0, v1, p1}, Lcom/motorola/otalib/common/utils/BroadcastUtils;->registerLocalReceiver(Landroid/content/Context;Landroid/content/BroadcastReceiver;Landroid/content/IntentFilter;)V

    invoke-static {}, Lcom/motorola/ccc/ota/ui/UpdaterUtils;->disableBatteryStatusReceiver()Z

    iget-object p1, p0, Lcom/motorola/ccc/ota/ui/DownloadFragment;->activityIntent:Landroid/content/Intent;

    invoke-direct {p0, p1}, Lcom/motorola/ccc/ota/ui/DownloadFragment;->getTargetIntent(Landroid/content/Intent;)Landroid/content/Intent;

    move-result-object p1

    iput-object p1, p0, Lcom/motorola/ccc/ota/ui/DownloadFragment;->mTargetIntent:Landroid/content/Intent;

    const-string v0, "Download"

    invoke-static {v0, p1}, Lcom/motorola/ccc/ota/ui/UpdaterUtils;->fillAnnoyValueExpiryDetails(Ljava/lang/String;Landroid/content/Intent;)Landroid/content/Intent;

    move-result-object p1

    iget-object v1, p0, Lcom/motorola/ccc/ota/ui/DownloadFragment;->context:Landroid/content/Context;

    const/high16 v2, 0x14000000

    const/4 v3, 0x0

    invoke-static {v1, v3, p1, v2}, Landroid/app/PendingIntent;->getBroadcast(Landroid/content/Context;ILandroid/content/Intent;I)Landroid/app/PendingIntent;

    move-result-object p1

    iput-object p1, p0, Lcom/motorola/ccc/ota/ui/DownloadFragment;->mPendingIntent:Landroid/app/PendingIntent;

    iget-object p1, p0, Lcom/motorola/ccc/ota/ui/DownloadFragment;->activityIntent:Landroid/content/Intent;

    invoke-static {p1}, Lcom/motorola/ccc/ota/ui/UpdaterUtils;->getUpgradeInfoDuringOTAUpdate(Landroid/content/Intent;)Lcom/motorola/ccc/ota/ui/UpdaterUtils$UpgradeInfo;

    move-result-object p1

    iput-object p1, p0, Lcom/motorola/ccc/ota/ui/DownloadFragment;->upgradeInfo:Lcom/motorola/ccc/ota/ui/UpdaterUtils$UpgradeInfo;

    const/4 v1, 0x1

    const-string v2, "OtaApp"

    if-nez p1, :cond_0

    const-string p1, "DownloadActivity, No upgradeInfo found."

    invoke-static {v2, p1}, Lcom/motorola/ccc/ota/utils/Logger;->error(Ljava/lang/String;Ljava/lang/String;)V

    iput-boolean v1, p0, Lcom/motorola/ccc/ota/ui/DownloadFragment;->mDoNotShowNotification:Z

    iget-object p0, p0, Lcom/motorola/ccc/ota/ui/DownloadFragment;->activity:Landroid/app/Activity;

    invoke-virtual {p0}, Landroid/app/Activity;->finishAndRemoveTask()V

    return-void

    :cond_0
    invoke-virtual {p1}, Lcom/motorola/ccc/ota/ui/UpdaterUtils$UpgradeInfo;->getUpdateTypeData()Ljava/lang/String;

    move-result-object p1

    invoke-static {p1}, Lcom/motorola/ccc/ota/ui/updateType/UpdateType;->getUpdateType(Ljava/lang/String;)Lcom/motorola/ccc/ota/ui/updateType/UpdateType$UpdateTypeInterface;

    move-result-object p1

    iput-object p1, p0, Lcom/motorola/ccc/ota/ui/DownloadFragment;->mUpdateType:Lcom/motorola/ccc/ota/ui/updateType/UpdateType$UpdateTypeInterface;

    iget-object p1, p0, Lcom/motorola/ccc/ota/ui/DownloadFragment;->upgradeInfo:Lcom/motorola/ccc/ota/ui/UpdaterUtils$UpgradeInfo;

    invoke-virtual {p1}, Lcom/motorola/ccc/ota/ui/UpdaterUtils$UpgradeInfo;->getUpdateTypeData()Ljava/lang/String;

    move-result-object p1

    iput-object p1, p0, Lcom/motorola/ccc/ota/ui/DownloadFragment;->updateTypeString:Ljava/lang/String;

    iget-object p1, p0, Lcom/motorola/ccc/ota/ui/DownloadFragment;->settings:Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    sget-object v4, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->STATS_PRE_DL_PACKAGE_NOTIFIED:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    const-wide/16 v5, 0x0

    invoke-virtual {p1, v4, v5, v6}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->getLong(Lcom/motorola/otalib/common/settings/ISetting;J)J

    move-result-wide v7

    const-wide/32 v9, 0x4d3f6400

    add-long/2addr v9, v7

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v11

    cmp-long p1, v7, v5

    const-wide/16 v4, 0xf

    if-lez p1, :cond_1

    cmp-long p1, v9, v11

    if-gez p1, :cond_1

    sub-long/2addr v11, v9

    const-wide/32 v6, 0x5265c00

    div-long/2addr v11, v6

    add-long/2addr v11, v4

    long-to-int p1, v11

    goto :goto_0

    :cond_1
    move p1, v3

    :goto_0
    iget-object v6, p0, Lcom/motorola/ccc/ota/ui/DownloadFragment;->mUpdateType:Lcom/motorola/ccc/ota/ui/updateType/UpdateType$UpdateTypeInterface;

    invoke-interface {v6}, Lcom/motorola/ccc/ota/ui/updateType/UpdateType$UpdateTypeInterface;->getPDLNotificationTitle()Ljava/lang/String;

    move-result-object v6

    iput-object v6, p0, Lcom/motorola/ccc/ota/ui/DownloadFragment;->notificationTitle:Ljava/lang/String;

    int-to-long v6, p1

    cmp-long v4, v6, v4

    if-lez v4, :cond_2

    invoke-virtual {p0}, Lcom/motorola/ccc/ota/ui/DownloadFragment;->getResources()Landroid/content/res/Resources;

    move-result-object v4

    iget-object v5, p0, Lcom/motorola/ccc/ota/ui/DownloadFragment;->mUpdateType:Lcom/motorola/ccc/ota/ui/updateType/UpdateType$UpdateTypeInterface;

    invoke-interface {v5}, Lcom/motorola/ccc/ota/ui/updateType/UpdateType$UpdateTypeInterface;->getSystemUpdateAvailablePendingNotificationText()I

    move-result v5

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p1

    filled-new-array {p1}, [Ljava/lang/Object;

    move-result-object p1

    invoke-virtual {v4, v5, p1}, Landroid/content/res/Resources;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p1

    iput-object p1, p0, Lcom/motorola/ccc/ota/ui/DownloadFragment;->notificationTxt:Ljava/lang/String;

    goto :goto_1

    :cond_2
    iget-object p1, p0, Lcom/motorola/ccc/ota/ui/DownloadFragment;->mUpdateType:Lcom/motorola/ccc/ota/ui/updateType/UpdateType$UpdateTypeInterface;

    invoke-interface {p1}, Lcom/motorola/ccc/ota/ui/updateType/UpdateType$UpdateTypeInterface;->getSystemUpdateAvailableNotificationText()Ljava/lang/String;

    move-result-object p1

    iput-object p1, p0, Lcom/motorola/ccc/ota/ui/DownloadFragment;->notificationTxt:Ljava/lang/String;

    :goto_1
    iget-object p1, p0, Lcom/motorola/ccc/ota/ui/DownloadFragment;->activity:Landroid/app/Activity;

    invoke-virtual {p1}, Landroid/app/Activity;->getWindow()Landroid/view/Window;

    move-result-object p1

    const/high16 v4, -0x80000000

    invoke-virtual {p1, v4}, Landroid/view/Window;->addFlags(I)V

    invoke-virtual {p1, v3}, Landroid/view/Window;->setStatusBarColor(I)V

    iget-object v4, p0, Lcom/motorola/ccc/ota/ui/DownloadFragment;->context:Landroid/content/Context;

    invoke-static {v4}, Lcom/motorola/ccc/ota/ui/UpdaterUtils;->isBatterySaverEnabled(Landroid/content/Context;)Z

    move-result v4

    if-nez v4, :cond_3

    new-instance v4, Landroidx/core/view/WindowInsetsControllerCompat;

    invoke-virtual {p1}, Landroid/view/Window;->getDecorView()Landroid/view/View;

    move-result-object v5

    invoke-direct {v4, p1, v5}, Landroidx/core/view/WindowInsetsControllerCompat;-><init>(Landroid/view/Window;Landroid/view/View;)V

    iget-object p1, p0, Lcom/motorola/ccc/ota/ui/DownloadFragment;->context:Landroid/content/Context;

    const-string v5, "uimode"

    invoke-virtual {p1, v5}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Landroid/app/UiModeManager;

    invoke-virtual {p1}, Landroid/app/UiModeManager;->getNightMode()I

    move-result p1

    const/4 v5, 0x2

    if-eq p1, v5, :cond_3

    invoke-virtual {v4, v1}, Landroidx/core/view/WindowInsetsControllerCompat;->setAppearanceLightStatusBars(Z)V

    invoke-virtual {v4, v1}, Landroidx/core/view/WindowInsetsControllerCompat;->setAppearanceLightNavigationBars(Z)V

    :cond_3
    iget-object p1, p0, Lcom/motorola/ccc/ota/ui/DownloadFragment;->settings:Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    sget-object v4, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->STATS_DOWNLOAD_ACTIVITY_PROMPT_COUNT:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    invoke-virtual {p1, v4, v3}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->getInt(Lcom/motorola/otalib/common/settings/ISetting;I)I

    move-result p1

    iput p1, p0, Lcom/motorola/ccc/ota/ui/DownloadFragment;->mPromptCount:I

    iget-object p1, p0, Lcom/motorola/ccc/ota/ui/DownloadFragment;->upgradeInfo:Lcom/motorola/ccc/ota/ui/UpdaterUtils$UpgradeInfo;

    invoke-virtual {p1}, Lcom/motorola/ccc/ota/ui/UpdaterUtils$UpgradeInfo;->isWifiOnly()Z

    move-result p1

    iput-boolean p1, p0, Lcom/motorola/ccc/ota/ui/DownloadFragment;->mWifiOnly:Z

    iget-object p1, p0, Lcom/motorola/ccc/ota/ui/DownloadFragment;->upgradeInfo:Lcom/motorola/ccc/ota/ui/UpdaterUtils$UpgradeInfo;

    invoke-virtual {p1}, Lcom/motorola/ccc/ota/ui/UpdaterUtils$UpgradeInfo;->showDownloadOptions()Z

    move-result p1

    iput-boolean p1, p0, Lcom/motorola/ccc/ota/ui/DownloadFragment;->mShowDownloadOptions:Z

    iget-object p1, p0, Lcom/motorola/ccc/ota/ui/DownloadFragment;->upgradeInfo:Lcom/motorola/ccc/ota/ui/UpdaterUtils$UpgradeInfo;

    invoke-virtual {p1}, Lcom/motorola/ccc/ota/ui/UpdaterUtils$UpgradeInfo;->getByPassPreDownloadDialog()Z

    move-result p1

    iput-boolean p1, p0, Lcom/motorola/ccc/ota/ui/DownloadFragment;->mByPassPreDownloadDialog:Z

    iget-object p1, p0, Lcom/motorola/ccc/ota/ui/DownloadFragment;->upgradeInfo:Lcom/motorola/ccc/ota/ui/UpdaterUtils$UpgradeInfo;

    invoke-virtual {p1}, Lcom/motorola/ccc/ota/ui/UpdaterUtils$UpgradeInfo;->isForced()Z

    move-result p1

    iput-boolean p1, p0, Lcom/motorola/ccc/ota/ui/DownloadFragment;->mForced:Z

    iget-object p1, p0, Lcom/motorola/ccc/ota/ui/DownloadFragment;->context:Landroid/content/Context;

    invoke-static {p1, v0}, Lcom/motorola/ccc/ota/ui/UpdaterUtils;->isPromptAllowed(Landroid/content/Context;Ljava/lang/String;)Z

    move-result p1

    if-nez p1, :cond_4

    const-string p1, "OTA download postponed by phone call/ECB/roaming"

    invoke-static {v2, p1}, Lcom/motorola/ccc/ota/utils/Logger;->info(Ljava/lang/String;Ljava/lang/String;)V

    iget-object p1, p0, Lcom/motorola/ccc/ota/ui/DownloadFragment;->upgradeInfo:Lcom/motorola/ccc/ota/ui/UpdaterUtils$UpgradeInfo;

    iget v0, p0, Lcom/motorola/ccc/ota/ui/DownloadFragment;->mPromptCount:I

    invoke-virtual {p1, v0}, Lcom/motorola/ccc/ota/ui/UpdaterUtils$UpgradeInfo;->getDelay(I)I

    move-result p1

    invoke-direct {p0, p1}, Lcom/motorola/ccc/ota/ui/DownloadFragment;->setDeferTimeAutomatically(I)V

    iget-object p0, p0, Lcom/motorola/ccc/ota/ui/DownloadFragment;->activity:Landroid/app/Activity;

    invoke-virtual {p0}, Landroid/app/Activity;->finish()V

    return-void

    :cond_4
    iget-object p1, p0, Lcom/motorola/ccc/ota/ui/DownloadFragment;->upgradeInfo:Lcom/motorola/ccc/ota/ui/UpdaterUtils$UpgradeInfo;

    invoke-virtual {p1}, Lcom/motorola/ccc/ota/ui/UpdaterUtils$UpgradeInfo;->getLocationType()Ljava/lang/String;

    move-result-object p1

    iput-object p1, p0, Lcom/motorola/ccc/ota/ui/DownloadFragment;->mLocationType:Ljava/lang/String;

    iget-object v5, p0, Lcom/motorola/ccc/ota/ui/DownloadFragment;->mPreDownloadNotes:Landroid/widget/TextView;

    iget-object p1, p0, Lcom/motorola/ccc/ota/ui/DownloadFragment;->upgradeInfo:Lcom/motorola/ccc/ota/ui/UpdaterUtils$UpgradeInfo;

    invoke-virtual {p1}, Lcom/motorola/ccc/ota/ui/UpdaterUtils$UpgradeInfo;->hasUpgradeNotification()Z

    move-result v6

    iget-object p1, p0, Lcom/motorola/ccc/ota/ui/DownloadFragment;->upgradeInfo:Lcom/motorola/ccc/ota/ui/UpdaterUtils$UpgradeInfo;

    invoke-virtual {p1}, Lcom/motorola/ccc/ota/ui/UpdaterUtils$UpgradeInfo;->getUpgradeNotification()Ljava/lang/String;

    move-result-object v7

    iget-object p1, p0, Lcom/motorola/ccc/ota/ui/DownloadFragment;->upgradeInfo:Lcom/motorola/ccc/ota/ui/UpdaterUtils$UpgradeInfo;

    invoke-virtual {p1}, Lcom/motorola/ccc/ota/ui/UpdaterUtils$UpgradeInfo;->getOSreleaseLink()Ljava/lang/String;

    move-result-object v8

    iget-object p1, p0, Lcom/motorola/ccc/ota/ui/DownloadFragment;->upgradeInfo:Lcom/motorola/ccc/ota/ui/UpdaterUtils$UpgradeInfo;

    invoke-virtual {p1}, Lcom/motorola/ccc/ota/ui/UpdaterUtils$UpgradeInfo;->getTargetOSVersion()Ljava/lang/String;

    move-result-object v9

    move-object v4, p0

    invoke-virtual/range {v4 .. v9}, Lcom/motorola/ccc/ota/ui/DownloadFragment;->setUpgradeNotification(Landroid/widget/TextView;ZLjava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    iget-object p1, p0, Lcom/motorola/ccc/ota/ui/DownloadFragment;->rootView:Landroid/view/View;

    const v0, 0x7f090082

    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v10

    iget-object v4, p0, Lcom/motorola/ccc/ota/ui/DownloadFragment;->expandableListView:Landroid/widget/ExpandableListView;

    iget-object p1, p0, Lcom/motorola/ccc/ota/ui/DownloadFragment;->upgradeInfo:Lcom/motorola/ccc/ota/ui/UpdaterUtils$UpgradeInfo;

    invoke-virtual {p1}, Lcom/motorola/ccc/ota/ui/UpdaterUtils$UpgradeInfo;->hasReleaseNotes()Z

    move-result v5

    iget-object p1, p0, Lcom/motorola/ccc/ota/ui/DownloadFragment;->upgradeInfo:Lcom/motorola/ccc/ota/ui/UpdaterUtils$UpgradeInfo;

    invoke-virtual {p1}, Lcom/motorola/ccc/ota/ui/UpdaterUtils$UpgradeInfo;->getReleaseNotes()Ljava/lang/String;

    move-result-object v6

    iget-object v7, p0, Lcom/motorola/ccc/ota/ui/DownloadFragment;->mExpTitle:Landroid/widget/TextView;

    invoke-virtual {p0}, Lcom/motorola/ccc/ota/ui/DownloadFragment;->getActivity()Landroidx/fragment/app/FragmentActivity;

    move-result-object v8

    iget-object v9, p0, Lcom/motorola/ccc/ota/ui/DownloadFragment;->mUpdateType:Lcom/motorola/ccc/ota/ui/updateType/UpdateType$UpdateTypeInterface;

    invoke-static/range {v4 .. v10}, Lcom/motorola/ccc/ota/ui/UpdaterUtils;->setExpandableList(Landroid/widget/ExpandableListView;ZLjava/lang/String;Landroid/widget/TextView;Landroid/content/Context;Lcom/motorola/ccc/ota/ui/updateType/UpdateType$UpdateTypeInterface;Landroid/view/View;)Landroid/widget/ExpandableListView;

    move-result-object p1

    iput-object p1, p0, Lcom/motorola/ccc/ota/ui/DownloadFragment;->expandableListView:Landroid/widget/ExpandableListView;

    const-string v0, "download"

    invoke-static {p1, v0}, Lcom/motorola/ccc/ota/ui/UpdaterUtils;->handleExpList(Landroid/widget/ExpandableListView;Ljava/lang/String;)Landroid/widget/ExpandableListView;

    move-result-object p1

    iput-object p1, p0, Lcom/motorola/ccc/ota/ui/DownloadFragment;->expandableListView:Landroid/widget/ExpandableListView;

    iget-object p1, p0, Lcom/motorola/ccc/ota/ui/DownloadFragment;->context:Landroid/content/Context;

    iget-object v4, p0, Lcom/motorola/ccc/ota/ui/DownloadFragment;->osReleaseNotes:Landroid/widget/TextView;

    iget-object v5, p0, Lcom/motorola/ccc/ota/ui/DownloadFragment;->upgradeInfo:Lcom/motorola/ccc/ota/ui/UpdaterUtils$UpgradeInfo;

    invoke-static {p1, v4, v5, v0}, Lcom/motorola/ccc/ota/ui/UpdaterUtils;->setOsReleaseNotes(Landroid/content/Context;Landroid/widget/TextView;Lcom/motorola/ccc/ota/ui/UpdaterUtils$UpgradeInfo;Ljava/lang/String;)V

    invoke-direct {p0}, Lcom/motorola/ccc/ota/ui/DownloadFragment;->setPreDownloadInstructions()V

    iget-object p1, p0, Lcom/motorola/ccc/ota/ui/DownloadFragment;->upgradeInfo:Lcom/motorola/ccc/ota/ui/UpdaterUtils$UpgradeInfo;

    invoke-virtual {p1}, Lcom/motorola/ccc/ota/ui/UpdaterUtils$UpgradeInfo;->getVersion()Ljava/lang/String;

    move-result-object p1

    if-nez p1, :cond_5

    const-string p1, "DownloadActivity, invalid version parameter."

    invoke-static {v2, p1}, Lcom/motorola/ccc/ota/utils/Logger;->error(Ljava/lang/String;Ljava/lang/String;)V

    iput-boolean v1, p0, Lcom/motorola/ccc/ota/ui/DownloadFragment;->mDoNotShowNotification:Z

    iget-object p0, p0, Lcom/motorola/ccc/ota/ui/DownloadFragment;->activity:Landroid/app/Activity;

    invoke-virtual {p0}, Landroid/app/Activity;->finishAndRemoveTask()V

    return-void

    :cond_5
    const-string v0, "fota"

    iget-object v1, p0, Lcom/motorola/ccc/ota/ui/DownloadFragment;->mLocationType:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_6

    iget-object v0, p0, Lcom/motorola/ccc/ota/ui/DownloadFragment;->upgradeInfo:Lcom/motorola/ccc/ota/ui/UpdaterUtils$UpgradeInfo;

    invoke-virtual {p0, v0}, Lcom/motorola/ccc/ota/ui/DownloadFragment;->initView(Lcom/motorola/ccc/ota/ui/UpdaterUtils$UpgradeInfo;)V

    :cond_6
    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "DownloadActivity, handling ("

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    const-string v0, ") from ( "

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    iget-object v0, p0, Lcom/motorola/ccc/ota/ui/DownloadFragment;->mLocationType:Ljava/lang/String;

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    const-string v0, ")"

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {v2, p1}, Lcom/motorola/ccc/ota/utils/Logger;->debug(Ljava/lang/String;Ljava/lang/String;)V

    iget-object p1, p0, Lcom/motorola/ccc/ota/ui/DownloadFragment;->upgradeInfo:Lcom/motorola/ccc/ota/ui/UpdaterUtils$UpgradeInfo;

    invoke-virtual {p1}, Lcom/motorola/ccc/ota/ui/UpdaterUtils$UpgradeInfo;->isForced()Z

    move-result p1

    iget-object v0, p0, Lcom/motorola/ccc/ota/ui/DownloadFragment;->mLocationType:Ljava/lang/String;

    iget-boolean v1, p0, Lcom/motorola/ccc/ota/ui/DownloadFragment;->mWifiOnly:Z

    invoke-virtual {p0, p1, v0, v1}, Lcom/motorola/ccc/ota/ui/DownloadFragment;->setCommonDisplay(ZLjava/lang/String;Z)V

    iget-object p1, p0, Lcom/motorola/ccc/ota/ui/DownloadFragment;->upgradeInfo:Lcom/motorola/ccc/ota/ui/UpdaterUtils$UpgradeInfo;

    invoke-virtual {p1}, Lcom/motorola/ccc/ota/ui/UpdaterUtils$UpgradeInfo;->getPreDownloadInstructions()Ljava/lang/String;

    move-result-object p1

    iget-object v0, p0, Lcom/motorola/ccc/ota/ui/DownloadFragment;->upgradeInfo:Lcom/motorola/ccc/ota/ui/UpdaterUtils$UpgradeInfo;

    invoke-virtual {v0}, Lcom/motorola/ccc/ota/ui/UpdaterUtils$UpgradeInfo;->hasPreDownloadInstructions()Z

    move-result v0

    iget-object v1, p0, Lcom/motorola/ccc/ota/ui/DownloadFragment;->mLinearLayout:Landroid/widget/LinearLayout;

    invoke-virtual {p0}, Lcom/motorola/ccc/ota/ui/DownloadFragment;->getActivity()Landroidx/fragment/app/FragmentActivity;

    move-result-object v4

    iget-object v5, p0, Lcom/motorola/ccc/ota/ui/DownloadFragment;->mUpdateType:Lcom/motorola/ccc/ota/ui/updateType/UpdateType$UpdateTypeInterface;

    invoke-static {p1, v0, v1, v4, v5}, Lcom/motorola/ccc/ota/ui/UpdaterUtils;->setInstructions(Ljava/lang/String;ZLandroid/widget/LinearLayout;Landroid/content/Context;Lcom/motorola/ccc/ota/ui/updateType/UpdateType$UpdateTypeInterface;)V

    iget-object p1, p0, Lcom/motorola/ccc/ota/ui/DownloadFragment;->upgradeInfo:Lcom/motorola/ccc/ota/ui/UpdaterUtils$UpgradeInfo;

    invoke-virtual {p1}, Lcom/motorola/ccc/ota/ui/UpdaterUtils$UpgradeInfo;->isForced()Z

    move-result p1

    const/16 v0, 0x8

    if-eqz p1, :cond_7

    iget-object p1, p0, Lcom/motorola/ccc/ota/ui/DownloadFragment;->upgradeInfo:Lcom/motorola/ccc/ota/ui/UpdaterUtils$UpgradeInfo;

    iget v1, p0, Lcom/motorola/ccc/ota/ui/DownloadFragment;->mPromptCount:I

    invoke-virtual {p1, v1}, Lcom/motorola/ccc/ota/ui/UpdaterUtils$UpgradeInfo;->isTimeout(I)Z

    move-result p1

    if-eqz p1, :cond_7

    const-string p1, "annoy value reminder\'s expired, show yes I got it option only"

    invoke-static {v2, p1}, Lcom/motorola/ccc/ota/utils/Logger;->info(Ljava/lang/String;Ljava/lang/String;)V

    iget-object p1, p0, Lcom/motorola/ccc/ota/ui/DownloadFragment;->mLaterBtn:Landroid/widget/Button;

    invoke-virtual {p1, v0}, Landroid/widget/Button;->setVisibility(I)V

    iget-object p1, p0, Lcom/motorola/ccc/ota/ui/DownloadFragment;->mCancelBtn:Landroid/widget/Button;

    invoke-virtual {p1, v0}, Landroid/widget/Button;->setVisibility(I)V

    iget-object p1, p0, Lcom/motorola/ccc/ota/ui/DownloadFragment;->mDownloadBtn:Landroid/widget/Button;

    invoke-virtual {p0}, Lcom/motorola/ccc/ota/ui/DownloadFragment;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    const v4, 0x7f0e00b3

    invoke-virtual {v1, v4}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p1, v1}, Landroid/widget/Button;->setText(Ljava/lang/CharSequence;)V

    :cond_7
    iget-object p1, p0, Lcom/motorola/ccc/ota/ui/DownloadFragment;->upgradeInfo:Lcom/motorola/ccc/ota/ui/UpdaterUtils$UpgradeInfo;

    invoke-virtual {p1}, Lcom/motorola/ccc/ota/ui/UpdaterUtils$UpgradeInfo;->isForced()Z

    move-result p1

    if-nez p1, :cond_8

    iget-object p1, p0, Lcom/motorola/ccc/ota/ui/DownloadFragment;->upgradeInfo:Lcom/motorola/ccc/ota/ui/UpdaterUtils$UpgradeInfo;

    invoke-virtual {p1}, Lcom/motorola/ccc/ota/ui/UpdaterUtils$UpgradeInfo;->getOptionalDeferCount()I

    move-result p1

    iget v1, p0, Lcom/motorola/ccc/ota/ui/DownloadFragment;->mPromptCount:I

    invoke-static {p1, v1}, Lcom/motorola/ccc/ota/ui/UpdaterUtils;->optionalUpdateDeferCountExpired(II)Z

    move-result p1

    if-eqz p1, :cond_8

    const-string p1, "Exceed max defer attempts for optional update, suppresing later btn"

    invoke-static {v2, p1}, Lcom/motorola/ccc/ota/utils/Logger;->info(Ljava/lang/String;Ljava/lang/String;)V

    iget-object p1, p0, Lcom/motorola/ccc/ota/ui/DownloadFragment;->mLaterBtn:Landroid/widget/Button;

    invoke-virtual {p1, v0}, Landroid/widget/Button;->setVisibility(I)V

    iget-object p1, p0, Lcom/motorola/ccc/ota/ui/DownloadFragment;->mCancelBtn:Landroid/widget/Button;

    invoke-virtual {p1, v3}, Landroid/widget/Button;->setVisibility(I)V

    :cond_8
    iget-object p1, p0, Lcom/motorola/ccc/ota/ui/DownloadFragment;->settings:Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    sget-object v0, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->DOWNLOAD_REQ_FROM_NOTIFY:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    invoke-virtual {p1, v0}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->getBoolean(Lcom/motorola/otalib/common/settings/ISetting;)Z

    move-result p1

    if-eqz p1, :cond_9

    const-string p1, "userInitiatedDLFromNotification"

    invoke-virtual {p0, p1}, Lcom/motorola/ccc/ota/ui/DownloadFragment;->handleDownloadOption(Ljava/lang/String;)V

    iget-object p1, p0, Lcom/motorola/ccc/ota/ui/DownloadFragment;->settings:Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    sget-object v0, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->DOWNLOAD_REQ_FROM_NOTIFY:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    invoke-virtual {p1, v0}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->removeConfig(Lcom/motorola/otalib/common/settings/ISetting;)V

    :cond_9
    iget-object p1, p0, Lcom/motorola/ccc/ota/ui/DownloadFragment;->upgradeInfo:Lcom/motorola/ccc/ota/ui/UpdaterUtils$UpgradeInfo;

    iget v0, p0, Lcom/motorola/ccc/ota/ui/DownloadFragment;->mPromptCount:I

    invoke-virtual {p1, v0}, Lcom/motorola/ccc/ota/ui/UpdaterUtils$UpgradeInfo;->getDelay(I)I

    move-result p1

    invoke-direct {p0, p1}, Lcom/motorola/ccc/ota/ui/DownloadFragment;->setDeferTimeAutomatically(I)V

    return-void
.end method

.method public onActivityResult(IILandroid/content/Intent;)V
    .locals 1

    invoke-super {p0, p1, p2, p3}, Landroidx/fragment/app/Fragment;->onActivityResult(IILandroid/content/Intent;)V

    if-nez p1, :cond_4

    if-nez p2, :cond_0

    iget-object p0, p0, Lcom/motorola/ccc/ota/ui/DownloadFragment;->activity:Landroid/app/Activity;

    invoke-virtual {p0}, Landroid/app/Activity;->finishAndRemoveTask()V

    goto :goto_0

    :cond_0
    const/4 p1, 0x2

    if-ne p2, p1, :cond_4

    sget-object p1, Lcom/motorola/ccc/ota/utils/UpgradeUtilConstants$ResponseFlavour;->RESPONSE_FLAVOUR_WIFI:Lcom/motorola/ccc/ota/utils/UpgradeUtilConstants$ResponseFlavour;

    invoke-virtual {p1}, Lcom/motorola/ccc/ota/utils/UpgradeUtilConstants$ResponseFlavour;->ordinal()I

    move-result p1

    const-string p2, "param_id"

    invoke-virtual {p3, p2, p1}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I

    move-result p1

    const-string p2, "param_mode"

    invoke-virtual {p3, p2}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p2

    iget-object p3, p0, Lcom/motorola/ccc/ota/ui/DownloadFragment;->settings:Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    sget-object v0, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->USERCHOICE:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    invoke-virtual {p3, v0, p1}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->setInt(Lcom/motorola/otalib/common/settings/ISetting;I)V

    iget-object p1, p0, Lcom/motorola/ccc/ota/ui/DownloadFragment;->cm:Landroid/net/ConnectivityManager;

    invoke-static {p1}, Lcom/motorola/otalib/common/utils/NetworkUtils;->isNetWorkConnected(Landroid/net/ConnectivityManager;)Z

    move-result p1

    if-nez p1, :cond_1

    const/4 p1, 0x4

    invoke-direct {p0, p1, p2}, Lcom/motorola/ccc/ota/ui/DownloadFragment;->displayDialog(ILjava/lang/String;)V

    return-void

    :cond_1
    invoke-static {}, Lcom/motorola/ccc/ota/ui/UpdaterUtils;->isDeviceInDatasaverMode()Z

    move-result p1

    if-eqz p1, :cond_2

    const/4 p1, 0x3

    invoke-direct {p0, p1, p2}, Lcom/motorola/ccc/ota/ui/DownloadFragment;->displayDialog(ILjava/lang/String;)V

    return-void

    :cond_2
    iget-object p1, p0, Lcom/motorola/ccc/ota/ui/DownloadFragment;->context:Landroid/content/Context;

    invoke-static {p1}, Lcom/motorola/ccc/ota/ui/UpdaterUtils;->isBatteryLowToStartDownload(Landroid/content/Context;)Z

    move-result p1

    if-eqz p1, :cond_3

    invoke-static {}, Lcom/motorola/ccc/ota/ui/UpdaterUtils;->enableReceiversForBatteryLow()V

    :cond_3
    invoke-virtual {p0, p2}, Lcom/motorola/ccc/ota/ui/DownloadFragment;->downloadNow(Ljava/lang/String;)V

    :cond_4
    :goto_0
    return-void
.end method

.method public onAttach(Landroid/content/Context;)V
    .locals 1

    invoke-super {p0, p1}, Landroidx/fragment/app/Fragment;->onAttach(Landroid/content/Context;)V

    iput-object p1, p0, Lcom/motorola/ccc/ota/ui/DownloadFragment;->context:Landroid/content/Context;

    instance-of v0, p1, Landroid/app/Activity;

    if-eqz v0, :cond_0

    check-cast p1, Landroid/app/Activity;

    iput-object p1, p0, Lcom/motorola/ccc/ota/ui/DownloadFragment;->activity:Landroid/app/Activity;

    :cond_0
    return-void
.end method

.method public onCreate(Landroid/os/Bundle;)V
    .locals 1

    invoke-super {p0, p1}, Landroidx/fragment/app/Fragment;->onCreate(Landroid/os/Bundle;)V

    iget-object p1, p0, Lcom/motorola/ccc/ota/ui/DownloadFragment;->context:Landroid/content/Context;

    const-string v0, "alarm"

    invoke-virtual {p1, v0}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Landroid/app/AlarmManager;

    iput-object p1, p0, Lcom/motorola/ccc/ota/ui/DownloadFragment;->mAlarmManager:Landroid/app/AlarmManager;

    iget-object p1, p0, Lcom/motorola/ccc/ota/ui/DownloadFragment;->context:Landroid/content/Context;

    const-string v0, "connectivity"

    invoke-virtual {p1, v0}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Landroid/net/ConnectivityManager;

    iput-object p1, p0, Lcom/motorola/ccc/ota/ui/DownloadFragment;->cm:Landroid/net/ConnectivityManager;

    new-instance p1, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    invoke-direct {p1}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;-><init>()V

    iput-object p1, p0, Lcom/motorola/ccc/ota/ui/DownloadFragment;->settings:Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    iget-object p0, p0, Lcom/motorola/ccc/ota/ui/DownloadFragment;->context:Landroid/content/Context;

    invoke-static {p0}, Lcom/motorola/ccc/ota/ui/UpdaterUtils;->stopWarningAlertDialog(Landroid/content/Context;)V

    return-void
.end method

.method public onCreateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;Landroid/os/Bundle;)Landroid/view/View;
    .locals 1

    const p3, 0x7f0c0034

    const/4 v0, 0x0

    invoke-virtual {p1, p3, p2, v0}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object p1

    iput-object p1, p0, Lcom/motorola/ccc/ota/ui/DownloadFragment;->rootView:Landroid/view/View;

    const/4 p1, 0x1

    iput-boolean p1, p0, Lcom/motorola/ccc/ota/ui/DownloadFragment;->isTransactionSafe:Z

    invoke-direct {p0}, Lcom/motorola/ccc/ota/ui/DownloadFragment;->initUI()V

    iget-object p0, p0, Lcom/motorola/ccc/ota/ui/DownloadFragment;->rootView:Landroid/view/View;

    return-object p0
.end method

.method public onDestroy()V
    .locals 4

    invoke-super {p0}, Landroidx/fragment/app/Fragment;->onDestroy()V

    iget-object v0, p0, Lcom/motorola/ccc/ota/ui/DownloadFragment;->settings:Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    sget-object v1, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->STATS_DOWNLOAD_ACTIVITY_PROMPT_COUNT:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    invoke-virtual {v0, v1}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->incrementPrefs(Lcom/motorola/otalib/common/settings/ISetting;)V

    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "Download fragment prompt count "

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v1, p0, Lcom/motorola/ccc/ota/ui/DownloadFragment;->settings:Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    sget-object v2, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->STATS_DOWNLOAD_ACTIVITY_PROMPT_COUNT:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    const/4 v3, 0x0

    invoke-virtual {v1, v2, v3}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->getInt(Lcom/motorola/otalib/common/settings/ISetting;I)I

    move-result v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    const-string v1, "OtaApp"

    invoke-static {v1, v0}, Lcom/motorola/ccc/ota/utils/Logger;->debug(Ljava/lang/String;Ljava/lang/String;)V

    iget-object v0, p0, Lcom/motorola/ccc/ota/ui/DownloadFragment;->context:Landroid/content/Context;

    iget-object v1, p0, Lcom/motorola/ccc/ota/ui/DownloadFragment;->mFinishReceiver:Landroid/content/BroadcastReceiver;

    invoke-static {v0, v1}, Lcom/motorola/otalib/common/utils/BroadcastUtils;->unregisterLocalReceiver(Landroid/content/Context;Landroid/content/BroadcastReceiver;)V

    iget-object v0, p0, Lcom/motorola/ccc/ota/ui/DownloadFragment;->context:Landroid/content/Context;

    invoke-static {v0}, Lcom/motorola/ccc/ota/ui/UpdaterUtils;->stopWarningAlertDialog(Landroid/content/Context;)V

    iget-object p0, p0, Lcom/motorola/ccc/ota/ui/DownloadFragment;->context:Landroid/content/Context;

    invoke-static {p0}, Lcom/motorola/ccc/ota/ui/UpdaterUtils;->stopDownloadOptionsFragment(Landroid/content/Context;)V

    return-void
.end method

.method public onPause()V
    .locals 1

    invoke-super {p0}, Landroidx/fragment/app/Fragment;->onPause()V

    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/motorola/ccc/ota/ui/DownloadFragment;->isTransactionSafe:Z

    return-void
.end method

.method public onResume()V
    .locals 2

    invoke-super {p0}, Landroidx/fragment/app/Fragment;->onResume()V

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v0

    iput-wide v0, p0, Lcom/motorola/ccc/ota/ui/DownloadFragment;->launchTimeInMillis:J

    iget-object v0, p0, Lcom/motorola/ccc/ota/ui/DownloadFragment;->context:Landroid/content/Context;

    invoke-static {v0}, Lcom/motorola/ccc/ota/utils/NotificationUtils;->stopNotificationService(Landroid/content/Context;)V

    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/motorola/ccc/ota/ui/DownloadFragment;->isTransactionSafe:Z

    return-void
.end method

.method public onStop()V
    .locals 8

    invoke-super {p0}, Landroidx/fragment/app/Fragment;->onStop()V

    iget-boolean v0, p0, Lcom/motorola/ccc/ota/ui/DownloadFragment;->mDoNotShowNotification:Z

    if-nez v0, :cond_0

    invoke-virtual {p0}, Lcom/motorola/ccc/ota/ui/DownloadFragment;->showDownloadNotification()V

    :cond_0
    iget-object v0, p0, Lcom/motorola/ccc/ota/ui/DownloadFragment;->settings:Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    sget-object v1, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->TOTAL_TIME_SPEND_ON_DOWNLOAD_SCREEN:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    iget-object v2, p0, Lcom/motorola/ccc/ota/ui/DownloadFragment;->settings:Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    sget-object v3, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->TOTAL_TIME_SPEND_ON_DOWNLOAD_SCREEN:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    const-wide/16 v4, 0x0

    invoke-virtual {v2, v3, v4, v5}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->getLong(Lcom/motorola/otalib/common/settings/ISetting;J)J

    move-result-wide v2

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v4

    iget-wide v6, p0, Lcom/motorola/ccc/ota/ui/DownloadFragment;->launchTimeInMillis:J

    sub-long/2addr v4, v6

    add-long/2addr v2, v4

    invoke-virtual {v0, v1, v2, v3}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->setLong(Lcom/motorola/otalib/common/settings/ISetting;J)V

    return-void
.end method

.method public onViewCreated(Landroid/view/View;Landroid/os/Bundle;)V
    .locals 0

    invoke-super {p0, p1, p2}, Landroidx/fragment/app/Fragment;->onViewCreated(Landroid/view/View;Landroid/os/Bundle;)V

    invoke-virtual {p0}, Lcom/motorola/ccc/ota/ui/DownloadFragment;->getView()Landroid/view/View;

    move-result-object p1

    const/4 p2, 0x1

    invoke-virtual {p1, p2}, Landroid/view/View;->setFocusableInTouchMode(Z)V

    invoke-virtual {p0}, Lcom/motorola/ccc/ota/ui/DownloadFragment;->getView()Landroid/view/View;

    move-result-object p1

    invoke-virtual {p1}, Landroid/view/View;->requestFocus()Z

    invoke-virtual {p0}, Lcom/motorola/ccc/ota/ui/DownloadFragment;->getView()Landroid/view/View;

    move-result-object p1

    new-instance p2, Lcom/motorola/ccc/ota/ui/DownloadFragment$$ExternalSyntheticLambda0;

    invoke-direct {p2, p0}, Lcom/motorola/ccc/ota/ui/DownloadFragment$$ExternalSyntheticLambda0;-><init>(Lcom/motorola/ccc/ota/ui/DownloadFragment;)V

    invoke-virtual {p1, p2}, Landroid/view/View;->setOnKeyListener(Landroid/view/View$OnKeyListener;)V

    return-void
.end method

.method setCommonDisplay(ZLjava/lang/String;Z)V
    .locals 1

    invoke-static {}, Lcom/motorola/ccc/ota/utils/BuildPropReader;->isStreamingUpdate()Z

    move-result p1

    if-eqz p1, :cond_0

    iget-object p1, p0, Lcom/motorola/ccc/ota/ui/DownloadFragment;->mDownloadBtn:Landroid/widget/Button;

    invoke-virtual {p0}, Lcom/motorola/ccc/ota/ui/DownloadFragment;->getResources()Landroid/content/res/Resources;

    move-result-object p3

    const v0, 0x7f0e0001

    invoke-virtual {p3, v0}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object p3

    invoke-virtual {p1, p3}, Landroid/widget/Button;->setText(Ljava/lang/CharSequence;)V

    iget-object p1, p0, Lcom/motorola/ccc/ota/ui/DownloadFragment;->mLaterBtn:Landroid/widget/Button;

    invoke-virtual {p0}, Lcom/motorola/ccc/ota/ui/DownloadFragment;->getResources()Landroid/content/res/Resources;

    move-result-object p3

    const/high16 v0, 0x7f0e0000

    invoke-virtual {p3, v0}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object p3

    invoke-virtual {p1, p3}, Landroid/widget/Button;->setText(Ljava/lang/CharSequence;)V

    :cond_0
    const-string p1, "sdcard"

    invoke-virtual {p1, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    const/16 p2, 0x8

    const/4 p3, 0x0

    if-eqz p1, :cond_1

    iget-object p1, p0, Lcom/motorola/ccc/ota/ui/DownloadFragment;->mLaterBtn:Landroid/widget/Button;

    invoke-virtual {p1, p2}, Landroid/widget/Button;->setVisibility(I)V

    iget-object p1, p0, Lcom/motorola/ccc/ota/ui/DownloadFragment;->mCancelBtn:Landroid/widget/Button;

    invoke-virtual {p1, p3}, Landroid/widget/Button;->setVisibility(I)V

    invoke-virtual {p0}, Lcom/motorola/ccc/ota/ui/DownloadFragment;->getResources()Landroid/content/res/Resources;

    move-result-object p1

    const p2, 0x7f0e0179

    invoke-virtual {p1, p2}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object p1

    iget-object p2, p0, Lcom/motorola/ccc/ota/ui/DownloadFragment;->mPreDownloadNotes:Landroid/widget/TextView;

    invoke-virtual {p2, p3}, Landroid/widget/TextView;->setVisibility(I)V

    iget-object p0, p0, Lcom/motorola/ccc/ota/ui/DownloadFragment;->mPreDownloadNotes:Landroid/widget/TextView;

    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    return-void

    :cond_1
    iget-object p1, p0, Lcom/motorola/ccc/ota/ui/DownloadFragment;->mCancelBtn:Landroid/widget/Button;

    invoke-virtual {p1, p2}, Landroid/widget/Button;->setVisibility(I)V

    iget-object p0, p0, Lcom/motorola/ccc/ota/ui/DownloadFragment;->mLaterBtn:Landroid/widget/Button;

    invoke-virtual {p0, p3}, Landroid/widget/Button;->setVisibility(I)V

    return-void
.end method

.method setUpgradeNotification(Landroid/widget/TextView;ZLjava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .locals 0

    if-eqz p2, :cond_0

    const-string p0, "DownloadActivity, FormattedText"

    const-string p2, "OtaApp"

    invoke-static {p2, p0}, Lcom/motorola/ccc/ota/utils/Logger;->debug(Ljava/lang/String;Ljava/lang/String;)V

    :try_start_0
    new-instance p0, Lcom/motorola/ccc/ota/ui/HtmlUtils;

    invoke-direct {p0, p3}, Lcom/motorola/ccc/ota/ui/HtmlUtils;-><init>(Ljava/lang/String;)V

    const/4 p4, 0x0

    const/4 p5, 0x0

    invoke-static {p3, p4, p5, p0}, Landroid/text/Html;->fromHtml(Ljava/lang/String;ILandroid/text/Html$ImageGetter;Landroid/text/Html$TagHandler;)Landroid/text/Spanned;

    move-result-object p0

    invoke-virtual {p1, p0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    invoke-virtual {p1, p4}, Landroid/widget/TextView;->setVisibility(I)V

    invoke-static {}, Landroid/text/method/LinkMovementMethod;->getInstance()Landroid/text/method/MovementMethod;

    move-result-object p0

    invoke-virtual {p1, p0}, Landroid/widget/TextView;->setMovementMethod(Landroid/text/method/MovementMethod;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception p0

    new-instance p1, Ljava/lang/StringBuilder;

    const-string p3, "DownloadActivity, error setting PreDownloadNotes."

    invoke-direct {p1, p3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-static {p2, p0}, Lcom/motorola/ccc/ota/utils/Logger;->error(Ljava/lang/String;Ljava/lang/String;)V

    :cond_0
    :goto_0
    return-void
.end method

.method setVersionOTA(Landroid/widget/TextView;Ljava/lang/String;)V
    .locals 0

    invoke-virtual {p1, p2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    return-void
.end method

.method public showDownloadNotification()V
    .locals 4

    iget-object v0, p0, Lcom/motorola/ccc/ota/ui/DownloadFragment;->mAlarmManager:Landroid/app/AlarmManager;

    iget-object v1, p0, Lcom/motorola/ccc/ota/ui/DownloadFragment;->mPendingIntent:Landroid/app/PendingIntent;

    invoke-virtual {v0, v1}, Landroid/app/AlarmManager;->cancel(Landroid/app/PendingIntent;)V

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v0

    invoke-static {}, Lcom/motorola/ccc/ota/utils/NotificationUtils;->getPreDownloadNotificationExpiryMins()I

    move-result v2

    const v3, 0xea60

    mul-int/2addr v2, v3

    int-to-long v2, v2

    add-long/2addr v0, v2

    iput-wide v0, p0, Lcom/motorola/ccc/ota/ui/DownloadFragment;->mNextPrompt:J

    invoke-static {v0, v1}, Lcom/motorola/ccc/ota/ui/UpdaterUtils;->saveNextPrompt(J)V

    invoke-static {}, Lcom/motorola/ccc/ota/env/OtaApplication;->getGlobalContext()Landroid/content/Context;

    move-result-object v0

    iget-object v1, p0, Lcom/motorola/ccc/ota/ui/DownloadFragment;->notificationTitle:Ljava/lang/String;

    iget-object v2, p0, Lcom/motorola/ccc/ota/ui/DownloadFragment;->notificationTxt:Ljava/lang/String;

    iget-object v3, p0, Lcom/motorola/ccc/ota/ui/DownloadFragment;->mTargetIntent:Landroid/content/Intent;

    invoke-static {v0, v1, v2, v3}, Lcom/motorola/ccc/ota/utils/NotificationUtils;->fillDownloadLaterNotificationDetails(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Landroid/content/Intent;)Landroid/content/Intent;

    move-result-object v0

    invoke-static {}, Lcom/motorola/ccc/ota/env/OtaApplication;->getGlobalContext()Landroid/content/Context;

    move-result-object v1

    invoke-static {v1, v0}, Lcom/motorola/ccc/ota/utils/NotificationUtils;->startNotificationService(Landroid/content/Context;Landroid/content/Intent;)V

    iget-object p0, p0, Lcom/motorola/ccc/ota/ui/DownloadFragment;->context:Landroid/content/Context;

    invoke-static {}, Lcom/motorola/ccc/ota/utils/NotificationUtils;->getPreDownloadNotificationExpiryMins()I

    move-result v0

    int-to-long v0, v0

    const-string v2, "DOWNLOAD_DEFERRED"

    const/4 v3, 0x0

    invoke-static {p0, v2, v3, v0, v1}, Lcom/motorola/ccc/ota/ui/UpdaterUtils;->setDeferStats(Landroid/content/Context;Ljava/lang/String;ZJ)V

    return-void
.end method
