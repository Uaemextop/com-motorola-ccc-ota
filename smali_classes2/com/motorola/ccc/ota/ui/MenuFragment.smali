.class public Lcom/motorola/ccc/ota/ui/MenuFragment;
.super Landroidx/fragment/app/Fragment;
.source "MenuFragment.java"

# interfaces
.implements Lcom/motorola/ccc/ota/utils/SmartUpdateUtils$SmartDialog;
.implements Lcom/motorola/ccc/ota/utils/SmartUpdateUtils$OnSmartUpdateConfigChangedLister;


# instance fields
.field private activityIntent:Landroid/content/Intent;

.field private checkForUpdates:Landroid/widget/LinearLayout;

.field private imgBack:Landroid/widget/ImageView;

.field private isTransactionSafe:Z

.field private lnrSmartUpdateParent:Landroid/widget/LinearLayout;

.field private mActivity:Landroidx/fragment/app/FragmentActivity;

.field private mContext:Landroid/content/Context;

.field private mRootView:Landroid/view/View;

.field private mSuUpdate:Landroid/widget/LinearLayout;

.field private mSuUpdateSummary:Landroid/widget/TextView;

.field private mSuUpdateTitle:Landroid/widget/TextView;

.field private mUIRefreshSimChangeReceiver:Landroid/content/BroadcastReceiver;

.field private settings:Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

.field private switchSmartUpdate:Landroid/widget/Switch;

.field private turnOffSureSmartUpdateDialog:Landroidx/appcompat/app/AlertDialog;

.field private txtAutoDownloadSettings:Landroid/widget/TextView;

.field private txtChkDisableITAdmin:Landroid/widget/TextView;

.field private txtUpdatePrefText:Landroid/widget/TextView;

.field private updateHistory:Landroid/widget/TextView;

.field private updatePrefsToolbar:Landroid/widget/LinearLayout;


# direct methods
.method static bridge synthetic -$$Nest$fgetcheckForUpdates(Lcom/motorola/ccc/ota/ui/MenuFragment;)Landroid/widget/LinearLayout;
    .locals 0

    iget-object p0, p0, Lcom/motorola/ccc/ota/ui/MenuFragment;->checkForUpdates:Landroid/widget/LinearLayout;

    return-object p0
.end method

.method static bridge synthetic -$$Nest$fgetmActivity(Lcom/motorola/ccc/ota/ui/MenuFragment;)Landroidx/fragment/app/FragmentActivity;
    .locals 0

    iget-object p0, p0, Lcom/motorola/ccc/ota/ui/MenuFragment;->mActivity:Landroidx/fragment/app/FragmentActivity;

    return-object p0
.end method

.method static bridge synthetic -$$Nest$fgetmContext(Lcom/motorola/ccc/ota/ui/MenuFragment;)Landroid/content/Context;
    .locals 0

    iget-object p0, p0, Lcom/motorola/ccc/ota/ui/MenuFragment;->mContext:Landroid/content/Context;

    return-object p0
.end method

.method static bridge synthetic -$$Nest$fgetsettings(Lcom/motorola/ccc/ota/ui/MenuFragment;)Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;
    .locals 0

    iget-object p0, p0, Lcom/motorola/ccc/ota/ui/MenuFragment;->settings:Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    return-object p0
.end method

.method static bridge synthetic -$$Nest$fputturnOffSureSmartUpdateDialog(Lcom/motorola/ccc/ota/ui/MenuFragment;Landroidx/appcompat/app/AlertDialog;)V
    .locals 0

    iput-object p1, p0, Lcom/motorola/ccc/ota/ui/MenuFragment;->turnOffSureSmartUpdateDialog:Landroidx/appcompat/app/AlertDialog;

    return-void
.end method

.method static bridge synthetic -$$Nest$minitUI(Lcom/motorola/ccc/ota/ui/MenuFragment;)V
    .locals 0

    invoke-direct {p0}, Lcom/motorola/ccc/ota/ui/MenuFragment;->initUI()V

    return-void
.end method

.method static bridge synthetic -$$Nest$mlaunchAutoDownloadSettings(Lcom/motorola/ccc/ota/ui/MenuFragment;)V
    .locals 0

    invoke-direct {p0}, Lcom/motorola/ccc/ota/ui/MenuFragment;->launchAutoDownloadSettings()V

    return-void
.end method

.method static bridge synthetic -$$Nest$mlaunchCheckForUpdates(Lcom/motorola/ccc/ota/ui/MenuFragment;)V
    .locals 0

    invoke-direct {p0}, Lcom/motorola/ccc/ota/ui/MenuFragment;->launchCheckForUpdates()V

    return-void
.end method

.method static bridge synthetic -$$Nest$mlaunchSmartUpdate(Lcom/motorola/ccc/ota/ui/MenuFragment;)V
    .locals 0

    invoke-direct {p0}, Lcom/motorola/ccc/ota/ui/MenuFragment;->launchSmartUpdate()V

    return-void
.end method

.method static bridge synthetic -$$Nest$mlaunchUpdateHistory(Lcom/motorola/ccc/ota/ui/MenuFragment;)V
    .locals 0

    invoke-direct {p0}, Lcom/motorola/ccc/ota/ui/MenuFragment;->launchUpdateHistory()V

    return-void
.end method

.method public constructor <init>()V
    .locals 1

    invoke-direct {p0}, Landroidx/fragment/app/Fragment;-><init>()V

    new-instance v0, Lcom/motorola/ccc/ota/ui/MenuFragment$7;

    invoke-direct {v0, p0}, Lcom/motorola/ccc/ota/ui/MenuFragment$7;-><init>(Lcom/motorola/ccc/ota/ui/MenuFragment;)V

    iput-object v0, p0, Lcom/motorola/ccc/ota/ui/MenuFragment;->mUIRefreshSimChangeReceiver:Landroid/content/BroadcastReceiver;

    return-void
.end method

.method private findViewsById()V
    .locals 2

    iget-object v0, p0, Lcom/motorola/ccc/ota/ui/MenuFragment;->mRootView:Landroid/view/View;

    const v1, 0x7f0900f7

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/LinearLayout;

    iput-object v0, p0, Lcom/motorola/ccc/ota/ui/MenuFragment;->lnrSmartUpdateParent:Landroid/widget/LinearLayout;

    iget-object v0, p0, Lcom/motorola/ccc/ota/ui/MenuFragment;->mRootView:Landroid/view/View;

    const v1, 0x7f0901b2

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/Switch;

    iput-object v0, p0, Lcom/motorola/ccc/ota/ui/MenuFragment;->switchSmartUpdate:Landroid/widget/Switch;

    iget-object v0, p0, Lcom/motorola/ccc/ota/ui/MenuFragment;->mRootView:Landroid/view/View;

    const v1, 0x7f0901e6

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p0, Lcom/motorola/ccc/ota/ui/MenuFragment;->txtUpdatePrefText:Landroid/widget/TextView;

    iget-object v0, p0, Lcom/motorola/ccc/ota/ui/MenuFragment;->mRootView:Landroid/view/View;

    const v1, 0x7f09004b

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/ImageView;

    iput-object v0, p0, Lcom/motorola/ccc/ota/ui/MenuFragment;->imgBack:Landroid/widget/ImageView;

    iget-object v0, p0, Lcom/motorola/ccc/ota/ui/MenuFragment;->mRootView:Landroid/view/View;

    const v1, 0x7f0901d8

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p0, Lcom/motorola/ccc/ota/ui/MenuFragment;->txtAutoDownloadSettings:Landroid/widget/TextView;

    iget-object v0, p0, Lcom/motorola/ccc/ota/ui/MenuFragment;->mRootView:Landroid/view/View;

    const v1, 0x7f0901f2

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/LinearLayout;

    iput-object v0, p0, Lcom/motorola/ccc/ota/ui/MenuFragment;->updatePrefsToolbar:Landroid/widget/LinearLayout;

    iget-object v0, p0, Lcom/motorola/ccc/ota/ui/MenuFragment;->mRootView:Landroid/view/View;

    const v1, 0x7f0900d3

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p0, Lcom/motorola/ccc/ota/ui/MenuFragment;->updateHistory:Landroid/widget/TextView;

    iget-object v0, p0, Lcom/motorola/ccc/ota/ui/MenuFragment;->mRootView:Landroid/view/View;

    const v1, 0x7f09006d

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/LinearLayout;

    iput-object v0, p0, Lcom/motorola/ccc/ota/ui/MenuFragment;->checkForUpdates:Landroid/widget/LinearLayout;

    iget-object v0, p0, Lcom/motorola/ccc/ota/ui/MenuFragment;->mRootView:Landroid/view/View;

    const v1, 0x7f0901dd

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p0, Lcom/motorola/ccc/ota/ui/MenuFragment;->txtChkDisableITAdmin:Landroid/widget/TextView;

    iget-object v0, p0, Lcom/motorola/ccc/ota/ui/MenuFragment;->mRootView:Landroid/view/View;

    const v1, 0x7f09017f

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/LinearLayout;

    iput-object v0, p0, Lcom/motorola/ccc/ota/ui/MenuFragment;->mSuUpdate:Landroid/widget/LinearLayout;

    iget-object v0, p0, Lcom/motorola/ccc/ota/ui/MenuFragment;->mRootView:Landroid/view/View;

    const v1, 0x7f090182

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p0, Lcom/motorola/ccc/ota/ui/MenuFragment;->mSuUpdateTitle:Landroid/widget/TextView;

    iget-object v0, p0, Lcom/motorola/ccc/ota/ui/MenuFragment;->mRootView:Landroid/view/View;

    const v1, 0x7f090181

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p0, Lcom/motorola/ccc/ota/ui/MenuFragment;->mSuUpdateSummary:Landroid/widget/TextView;

    return-void
.end method

.method private handleButtons()V
    .locals 2

    iget-object v0, p0, Lcom/motorola/ccc/ota/ui/MenuFragment;->switchSmartUpdate:Landroid/widget/Switch;

    new-instance v1, Lcom/motorola/ccc/ota/ui/MenuFragment$1;

    invoke-direct {v1, p0}, Lcom/motorola/ccc/ota/ui/MenuFragment$1;-><init>(Lcom/motorola/ccc/ota/ui/MenuFragment;)V

    invoke-virtual {v0, v1}, Landroid/widget/Switch;->setOnCheckedChangeListener(Landroid/widget/CompoundButton$OnCheckedChangeListener;)V

    iget-object v0, p0, Lcom/motorola/ccc/ota/ui/MenuFragment;->imgBack:Landroid/widget/ImageView;

    new-instance v1, Lcom/motorola/ccc/ota/ui/MenuFragment$2;

    invoke-direct {v1, p0}, Lcom/motorola/ccc/ota/ui/MenuFragment$2;-><init>(Lcom/motorola/ccc/ota/ui/MenuFragment;)V

    invoke-virtual {v0, v1}, Landroid/widget/ImageView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    iget-object v0, p0, Lcom/motorola/ccc/ota/ui/MenuFragment;->lnrSmartUpdateParent:Landroid/widget/LinearLayout;

    new-instance v1, Lcom/motorola/ccc/ota/ui/MenuFragment$3;

    invoke-direct {v1, p0}, Lcom/motorola/ccc/ota/ui/MenuFragment$3;-><init>(Lcom/motorola/ccc/ota/ui/MenuFragment;)V

    invoke-virtual {v0, v1}, Landroid/widget/LinearLayout;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    iget-object v0, p0, Lcom/motorola/ccc/ota/ui/MenuFragment;->txtAutoDownloadSettings:Landroid/widget/TextView;

    new-instance v1, Lcom/motorola/ccc/ota/ui/MenuFragment$4;

    invoke-direct {v1, p0}, Lcom/motorola/ccc/ota/ui/MenuFragment$4;-><init>(Lcom/motorola/ccc/ota/ui/MenuFragment;)V

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    iget-object v0, p0, Lcom/motorola/ccc/ota/ui/MenuFragment;->updateHistory:Landroid/widget/TextView;

    new-instance v1, Lcom/motorola/ccc/ota/ui/MenuFragment$5;

    invoke-direct {v1, p0}, Lcom/motorola/ccc/ota/ui/MenuFragment$5;-><init>(Lcom/motorola/ccc/ota/ui/MenuFragment;)V

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    iget-object v0, p0, Lcom/motorola/ccc/ota/ui/MenuFragment;->checkForUpdates:Landroid/widget/LinearLayout;

    new-instance v1, Lcom/motorola/ccc/ota/ui/MenuFragment$6;

    invoke-direct {v1, p0}, Lcom/motorola/ccc/ota/ui/MenuFragment$6;-><init>(Lcom/motorola/ccc/ota/ui/MenuFragment;)V

    invoke-virtual {v0, v1}, Landroid/widget/LinearLayout;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    return-void
.end method

.method private initUI()V
    .locals 6

    invoke-static {}, Lcom/motorola/ccc/ota/utils/BuildPropReader;->isATT()Z

    move-result v0

    const/4 v1, 0x0

    if-nez v0, :cond_0

    iget-object v0, p0, Lcom/motorola/ccc/ota/ui/MenuFragment;->mSuUpdate:Landroid/widget/LinearLayout;

    invoke-virtual {v0, v1}, Landroid/widget/LinearLayout;->setVisibility(I)V

    invoke-direct {p0}, Lcom/motorola/ccc/ota/ui/MenuFragment;->setPrefsData()V

    goto :goto_0

    :cond_0
    iget-object v0, p0, Lcom/motorola/ccc/ota/ui/MenuFragment;->txtAutoDownloadSettings:Landroid/widget/TextView;

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setVisibility(I)V

    :goto_0
    iget-object v0, p0, Lcom/motorola/ccc/ota/ui/MenuFragment;->updatePrefsToolbar:Landroid/widget/LinearLayout;

    const/16 v2, 0x8

    invoke-virtual {v0, v2}, Landroid/widget/LinearLayout;->setVisibility(I)V

    iget-object v0, p0, Lcom/motorola/ccc/ota/ui/MenuFragment;->checkForUpdates:Landroid/widget/LinearLayout;

    invoke-virtual {v0, v1}, Landroid/widget/LinearLayout;->setVisibility(I)V

    invoke-static {}, Lcom/motorola/ccc/ota/ui/UpdaterUtils;->isVerizon()Z

    move-result v0

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/motorola/ccc/ota/ui/MenuFragment;->txtUpdatePrefText:Landroid/widget/TextView;

    const v3, 0x7f0e0190

    invoke-virtual {v0, v3}, Landroid/widget/TextView;->setText(I)V

    goto :goto_1

    :cond_1
    invoke-static {}, Lcom/motorola/ccc/ota/utils/BuildPropReader;->isSoftbank()Z

    move-result v0

    if-eqz v0, :cond_2

    invoke-static {}, Lcom/motorola/ccc/ota/utils/BuildPropReader;->isSoftbankSIM()Z

    move-result v0

    if-eqz v0, :cond_2

    iget-object v0, p0, Lcom/motorola/ccc/ota/ui/MenuFragment;->txtUpdatePrefText:Landroid/widget/TextView;

    const v3, 0x7f0e018f

    invoke-virtual {v0, v3}, Landroid/widget/TextView;->setText(I)V

    goto :goto_1

    :cond_2
    iget-object v0, p0, Lcom/motorola/ccc/ota/ui/MenuFragment;->txtUpdatePrefText:Landroid/widget/TextView;

    const v3, 0x7f0e018e

    invoke-virtual {v0, v3}, Landroid/widget/TextView;->setText(I)V

    :goto_1
    invoke-static {}, Lcom/motorola/ccc/ota/utils/SmartUpdateUtils;->isSmartUpdateEnabledByServer()Z

    move-result v0

    if-nez v0, :cond_3

    iget-object v0, p0, Lcom/motorola/ccc/ota/ui/MenuFragment;->lnrSmartUpdateParent:Landroid/widget/LinearLayout;

    invoke-virtual {v0, v2}, Landroid/widget/LinearLayout;->setVisibility(I)V

    goto :goto_2

    :cond_3
    iget-object v0, p0, Lcom/motorola/ccc/ota/ui/MenuFragment;->lnrSmartUpdateParent:Landroid/widget/LinearLayout;

    invoke-virtual {v0, v1}, Landroid/widget/LinearLayout;->setVisibility(I)V

    :goto_2
    iget-object v0, p0, Lcom/motorola/ccc/ota/ui/MenuFragment;->settings:Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    invoke-static {v0}, Lcom/motorola/ccc/ota/utils/SmartUpdateUtils;->isSmartUpdateEnabledByUser(Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;)Z

    move-result v0

    const/4 v3, 0x1

    if-eqz v0, :cond_4

    iget-object v0, p0, Lcom/motorola/ccc/ota/ui/MenuFragment;->switchSmartUpdate:Landroid/widget/Switch;

    invoke-virtual {v0, v3}, Landroid/widget/Switch;->setChecked(Z)V

    goto :goto_3

    :cond_4
    iget-object v0, p0, Lcom/motorola/ccc/ota/ui/MenuFragment;->switchSmartUpdate:Landroid/widget/Switch;

    invoke-virtual {v0, v1}, Landroid/widget/Switch;->setChecked(Z)V

    :goto_3
    iget-object v0, p0, Lcom/motorola/ccc/ota/ui/MenuFragment;->mContext:Landroid/content/Context;

    invoke-static {v0}, Lcom/motorola/ccc/ota/sources/bota/thinkshield/ThinkShieldUtils;->getASCCampaignStatusDetails(Landroid/content/Context;)Ljava/util/Map;

    move-result-object v0

    const-string v4, "ASC_CHK_DISABLE_STATUS"

    invoke-interface {v0, v4}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/Boolean;

    invoke-virtual {v4}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v4

    const-string v5, "ASC_STATUS_STRING"

    invoke-interface {v0, v5}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    iget-object v5, p0, Lcom/motorola/ccc/ota/ui/MenuFragment;->mContext:Landroid/content/Context;

    invoke-static {v5}, Lcom/motorola/ccc/ota/utils/CusUtilMethods;->isCheckUpdateDisabled(Landroid/content/Context;)Z

    move-result v5

    if-eqz v5, :cond_7

    iget-object v3, p0, Lcom/motorola/ccc/ota/ui/MenuFragment;->checkForUpdates:Landroid/widget/LinearLayout;

    invoke-virtual {v3, v1}, Landroid/widget/LinearLayout;->setEnabled(Z)V

    iget-object v3, p0, Lcom/motorola/ccc/ota/ui/MenuFragment;->checkForUpdates:Landroid/widget/LinearLayout;

    const/high16 v5, 0x3f000000    # 0.5f

    invoke-virtual {v3, v5}, Landroid/widget/LinearLayout;->setAlpha(F)V

    new-instance v3, Lcom/motorola/ccc/ota/env/SystemUpdaterPolicy;

    invoke-direct {v3}, Lcom/motorola/ccc/ota/env/SystemUpdaterPolicy;-><init>()V

    invoke-virtual {v3}, Lcom/motorola/ccc/ota/env/SystemUpdaterPolicy;->isOtaUpdateDisabledByPolicyMngr()Z

    move-result v3

    if-nez v3, :cond_6

    if-eqz v4, :cond_5

    goto :goto_4

    :cond_5
    iget-object p0, p0, Lcom/motorola/ccc/ota/ui/MenuFragment;->txtChkDisableITAdmin:Landroid/widget/TextView;

    invoke-virtual {p0, v2}, Landroid/widget/TextView;->setVisibility(I)V

    goto :goto_5

    :cond_6
    :goto_4
    iget-object v2, p0, Lcom/motorola/ccc/ota/ui/MenuFragment;->txtChkDisableITAdmin:Landroid/widget/TextView;

    invoke-virtual {v2, v1}, Landroid/widget/TextView;->setVisibility(I)V

    iget-object p0, p0, Lcom/motorola/ccc/ota/ui/MenuFragment;->txtChkDisableITAdmin:Landroid/widget/TextView;

    invoke-virtual {p0, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    return-void

    :cond_7
    iget-object v4, p0, Lcom/motorola/ccc/ota/ui/MenuFragment;->checkForUpdates:Landroid/widget/LinearLayout;

    invoke-virtual {v4, v3}, Landroid/widget/LinearLayout;->setEnabled(Z)V

    iget-object v3, p0, Lcom/motorola/ccc/ota/ui/MenuFragment;->checkForUpdates:Landroid/widget/LinearLayout;

    const/high16 v4, 0x3f800000    # 1.0f

    invoke-virtual {v3, v4}, Landroid/widget/LinearLayout;->setAlpha(F)V

    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v3

    if-nez v3, :cond_8

    iget-object v2, p0, Lcom/motorola/ccc/ota/ui/MenuFragment;->txtChkDisableITAdmin:Landroid/widget/TextView;

    invoke-virtual {v2, v1}, Landroid/widget/TextView;->setVisibility(I)V

    iget-object p0, p0, Lcom/motorola/ccc/ota/ui/MenuFragment;->txtChkDisableITAdmin:Landroid/widget/TextView;

    invoke-virtual {p0, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    goto :goto_5

    :cond_8
    iget-object p0, p0, Lcom/motorola/ccc/ota/ui/MenuFragment;->txtChkDisableITAdmin:Landroid/widget/TextView;

    invoke-virtual {p0, v2}, Landroid/widget/TextView;->setVisibility(I)V

    :goto_5
    return-void
.end method

.method private launchAutoDownloadSettings()V
    .locals 3

    new-instance v0, Landroid/os/Bundle;

    invoke-direct {v0}, Landroid/os/Bundle;-><init>()V

    const-string v1, "activityIntent"

    iget-object v2, p0, Lcom/motorola/ccc/ota/ui/MenuFragment;->activityIntent:Landroid/content/Intent;

    invoke-virtual {v0, v1, v2}, Landroid/os/Bundle;->putParcelable(Ljava/lang/String;Landroid/os/Parcelable;)V

    new-instance v1, Lcom/motorola/ccc/ota/sources/fota/FotaAutoDownloadSettings;

    invoke-direct {v1}, Lcom/motorola/ccc/ota/sources/fota/FotaAutoDownloadSettings;-><init>()V

    invoke-virtual {v1, v0}, Lcom/motorola/ccc/ota/sources/fota/FotaAutoDownloadSettings;->setArguments(Landroid/os/Bundle;)V

    iget-boolean v0, p0, Lcom/motorola/ccc/ota/ui/MenuFragment;->isTransactionSafe:Z

    if-eqz v0, :cond_0

    iget-object p0, p0, Lcom/motorola/ccc/ota/ui/MenuFragment;->mActivity:Landroidx/fragment/app/FragmentActivity;

    invoke-virtual {p0}, Landroidx/fragment/app/FragmentActivity;->getSupportFragmentManager()Landroidx/fragment/app/FragmentManager;

    move-result-object p0

    const-string v0, "AutoDownloadSettingsDialog"

    invoke-virtual {v1, p0, v0}, Lcom/motorola/ccc/ota/sources/fota/FotaAutoDownloadSettings;->show(Landroidx/fragment/app/FragmentManager;Ljava/lang/String;)V

    :cond_0
    return-void
.end method

.method private launchCheckForUpdates()V
    .locals 3

    iget-object v0, p0, Lcom/motorola/ccc/ota/ui/MenuFragment;->mContext:Landroid/content/Context;

    invoke-static {v0}, Lcom/motorola/ccc/ota/utils/DmSendAlertService;->startManualDMSync(Landroid/content/Context;)V

    new-instance v0, Landroid/content/Intent;

    invoke-direct {v0}, Landroid/content/Intent;-><init>()V

    iget-object v1, p0, Lcom/motorola/ccc/ota/ui/MenuFragment;->mContext:Landroid/content/Context;

    const-class v2, Lcom/motorola/ccc/ota/ui/BaseActivity;

    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->setClass(Landroid/content/Context;Ljava/lang/Class;)Landroid/content/Intent;

    sget-object v1, Lcom/motorola/ccc/ota/utils/UpgradeUtilConstants$FragmentTypeEnum;->CHECK_UPDATE_FRAGMENT:Lcom/motorola/ccc/ota/utils/UpgradeUtilConstants$FragmentTypeEnum;

    invoke-virtual {v1}, Lcom/motorola/ccc/ota/utils/UpgradeUtilConstants$FragmentTypeEnum;->toString()Ljava/lang/String;

    move-result-object v1

    const-string v2, "fragment_type"

    invoke-virtual {v0, v2, v1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    const/high16 v1, 0x10000000

    invoke-virtual {v0, v1}, Landroid/content/Intent;->setFlags(I)Landroid/content/Intent;

    invoke-virtual {p0, v0}, Lcom/motorola/ccc/ota/ui/MenuFragment;->startActivity(Landroid/content/Intent;)V

    return-void
.end method

.method private launchSmartUpdate()V
    .locals 4

    new-instance v0, Landroid/os/Bundle;

    invoke-direct {v0}, Landroid/os/Bundle;-><init>()V

    iget-object v1, p0, Lcom/motorola/ccc/ota/ui/MenuFragment;->activityIntent:Landroid/content/Intent;

    sget-object v2, Lcom/motorola/ccc/ota/utils/SmartUpdateUtils$SmartUpdateLaunchMode;->SETTINGS_MENU_FRAGMENT:Lcom/motorola/ccc/ota/utils/SmartUpdateUtils$SmartUpdateLaunchMode;

    invoke-virtual {v2}, Lcom/motorola/ccc/ota/utils/SmartUpdateUtils$SmartUpdateLaunchMode;->name()Ljava/lang/String;

    move-result-object v2

    const-string v3, "com.motorola.blur.service.blur.update.launch_mode"

    invoke-virtual {v1, v3, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    const-string v1, "activityIntent"

    iget-object v2, p0, Lcom/motorola/ccc/ota/ui/MenuFragment;->activityIntent:Landroid/content/Intent;

    invoke-virtual {v0, v1, v2}, Landroid/os/Bundle;->putParcelable(Ljava/lang/String;Landroid/os/Parcelable;)V

    new-instance v1, Lcom/motorola/ccc/ota/ui/SmartUpdateFragment;

    invoke-direct {v1}, Lcom/motorola/ccc/ota/ui/SmartUpdateFragment;-><init>()V

    invoke-virtual {v1, v0}, Lcom/motorola/ccc/ota/ui/SmartUpdateFragment;->setArguments(Landroid/os/Bundle;)V

    iget-boolean v0, p0, Lcom/motorola/ccc/ota/ui/MenuFragment;->isTransactionSafe:Z

    if-eqz v0, :cond_0

    iget-object p0, p0, Lcom/motorola/ccc/ota/ui/MenuFragment;->mActivity:Landroidx/fragment/app/FragmentActivity;

    invoke-virtual {p0}, Landroidx/fragment/app/FragmentActivity;->getSupportFragmentManager()Landroidx/fragment/app/FragmentManager;

    move-result-object p0

    const-string v0, "SmartUpdateDialog"

    invoke-virtual {v1, p0, v0}, Lcom/motorola/ccc/ota/ui/SmartUpdateFragment;->show(Landroidx/fragment/app/FragmentManager;Ljava/lang/String;)V

    :cond_0
    return-void
.end method

.method private launchUpdateHistory()V
    .locals 3

    new-instance v0, Landroid/os/Bundle;

    invoke-direct {v0}, Landroid/os/Bundle;-><init>()V

    const-string v1, "activityIntent"

    iget-object v2, p0, Lcom/motorola/ccc/ota/ui/MenuFragment;->activityIntent:Landroid/content/Intent;

    invoke-virtual {v0, v1, v2}, Landroid/os/Bundle;->putParcelable(Ljava/lang/String;Landroid/os/Parcelable;)V

    new-instance v1, Lcom/motorola/ccc/ota/ui/UpdateHistoryFragment;

    invoke-direct {v1}, Lcom/motorola/ccc/ota/ui/UpdateHistoryFragment;-><init>()V

    invoke-virtual {v1, v0}, Lcom/motorola/ccc/ota/ui/UpdateHistoryFragment;->setArguments(Landroid/os/Bundle;)V

    iget-boolean v0, p0, Lcom/motorola/ccc/ota/ui/MenuFragment;->isTransactionSafe:Z

    if-eqz v0, :cond_0

    iget-object p0, p0, Lcom/motorola/ccc/ota/ui/MenuFragment;->mActivity:Landroidx/fragment/app/FragmentActivity;

    invoke-virtual {p0}, Landroidx/fragment/app/FragmentActivity;->getSupportFragmentManager()Landroidx/fragment/app/FragmentManager;

    move-result-object p0

    const-string v0, "UpdateHistoryDialog"

    invoke-virtual {v1, p0, v0}, Lcom/motorola/ccc/ota/ui/UpdateHistoryFragment;->show(Landroidx/fragment/app/FragmentManager;Ljava/lang/String;)V

    :cond_0
    return-void
.end method

.method private setPrefsData()V
    .locals 8

    iget-object v0, p0, Lcom/motorola/ccc/ota/ui/MenuFragment;->mContext:Landroid/content/Context;

    invoke-static {v0}, Lcom/motorola/ccc/ota/utils/SystemUpdateStatusUtils;->readLastUpdateVersionFromPref(Landroid/content/Context;)Ljava/util/List;

    move-result-object v0

    iget-object v1, p0, Lcom/motorola/ccc/ota/ui/MenuFragment;->mContext:Landroid/content/Context;

    invoke-static {v1}, Lcom/motorola/ccc/ota/utils/SystemUpdateStatusUtils;->getSwUpdatePlannedInfo(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v2

    if-nez v2, :cond_0

    const v0, 0x7f0e01a2

    filled-new-array {v1}, [Ljava/lang/Object;

    move-result-object v1

    invoke-virtual {p0, v0, v1}, Lcom/motorola/ccc/ota/ui/MenuFragment;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    iget-object v1, p0, Lcom/motorola/ccc/ota/ui/MenuFragment;->mSuUpdateTitle:Landroid/widget/TextView;

    invoke-virtual {p0}, Lcom/motorola/ccc/ota/ui/MenuFragment;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    const v3, 0x7f0e01a3

    invoke-virtual {v2, v3}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    iget-object p0, p0, Lcom/motorola/ccc/ota/ui/MenuFragment;->mSuUpdateSummary:Landroid/widget/TextView;

    invoke-virtual {p0, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    return-void

    :cond_0
    const/16 v1, 0x8

    if-nez v0, :cond_1

    iget-object p0, p0, Lcom/motorola/ccc/ota/ui/MenuFragment;->mSuUpdateSummary:Landroid/widget/TextView;

    invoke-virtual {p0, v1}, Landroid/widget/TextView;->setVisibility(I)V

    return-void

    :cond_1
    const/4 v2, 0x0

    move v3, v2

    :goto_0
    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v4

    if-ge v3, v4, :cond_4

    invoke-interface {v0, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/String;

    const-string v5, " : "

    invoke-virtual {v4, v5}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v4

    :try_start_0
    const-string v5, "SU"

    aget-object v6, v4, v2

    invoke-virtual {v5, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_3

    iget-object v5, p0, Lcom/motorola/ccc/ota/ui/MenuFragment;->settings:Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    sget-object v6, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->ONGOING_HISTORY_POLICY_DISPLAY_NAME:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    invoke-virtual {v5, v6}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->getString(Lcom/motorola/otalib/common/settings/ISetting;)Ljava/lang/String;

    move-result-object v5

    invoke-static {v5}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v5

    if-nez v5, :cond_2

    iget-object v5, p0, Lcom/motorola/ccc/ota/ui/MenuFragment;->mSuUpdateTitle:Landroid/widget/TextView;

    iget-object v6, p0, Lcom/motorola/ccc/ota/ui/MenuFragment;->settings:Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    sget-object v7, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->ONGOING_HISTORY_POLICY_DISPLAY_NAME:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    invoke-virtual {v6, v7}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->getString(Lcom/motorola/otalib/common/settings/ISetting;)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    iget-object v5, p0, Lcom/motorola/ccc/ota/ui/MenuFragment;->mSuUpdateSummary:Landroid/widget/TextView;

    invoke-virtual {v5, v1}, Landroid/widget/TextView;->setVisibility(I)V

    goto :goto_1

    :cond_2
    iget-object v5, p0, Lcom/motorola/ccc/ota/ui/MenuFragment;->mSuUpdateTitle:Landroid/widget/TextView;

    const/4 v6, 0x1

    aget-object v6, v4, v6

    invoke-virtual {v5, v6}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    iget-object v5, p0, Lcom/motorola/ccc/ota/ui/MenuFragment;->mSuUpdateSummary:Landroid/widget/TextView;

    invoke-virtual {v5, v2}, Landroid/widget/TextView;->setVisibility(I)V

    :goto_1
    iget-object v5, p0, Lcom/motorola/ccc/ota/ui/MenuFragment;->mSuUpdateSummary:Landroid/widget/TextView;

    const/4 v6, 0x2

    aget-object v4, v4, v6

    invoke-virtual {v5, v4}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_2

    :catch_0
    move-exception v4

    new-instance v5, Ljava/lang/StringBuilder;

    const-string v6, "This exception is caused while setting the Update Status in the MenuFragment "

    invoke-direct {v5, v6}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v5, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    const-string v5, "OtaApp"

    invoke-static {v5, v4}, Lcom/motorola/ccc/ota/utils/Logger;->error(Ljava/lang/String;Ljava/lang/String;)V

    :cond_3
    :goto_2
    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    :cond_4
    return-void
.end method


# virtual methods
.method public dismissSmartDialog()V
    .locals 0

    iget-object p0, p0, Lcom/motorola/ccc/ota/ui/MenuFragment;->turnOffSureSmartUpdateDialog:Landroidx/appcompat/app/AlertDialog;

    if-eqz p0, :cond_0

    invoke-virtual {p0}, Landroidx/appcompat/app/AlertDialog;->dismiss()V

    :cond_0
    return-void
.end method

.method public onActivityCreated(Landroid/os/Bundle;)V
    .locals 2

    invoke-super {p0, p1}, Landroidx/fragment/app/Fragment;->onActivityCreated(Landroid/os/Bundle;)V

    const-string p1, "OtaApp"

    const-string v0, "MenuFragment, onActivityCreated"

    invoke-static {p1, v0}, Lcom/motorola/ccc/ota/utils/Logger;->debug(Ljava/lang/String;Ljava/lang/String;)V

    new-instance p1, Landroid/content/IntentFilter;

    invoke-direct {p1}, Landroid/content/IntentFilter;-><init>()V

    const-string v0, "com.motorola.ccc.ota.Actions.REFRESH_CHKUPDATE_UI_ON_SIMCHANGE"

    invoke-virtual {p1, v0}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    iget-object v0, p0, Lcom/motorola/ccc/ota/ui/MenuFragment;->mContext:Landroid/content/Context;

    iget-object v1, p0, Lcom/motorola/ccc/ota/ui/MenuFragment;->mUIRefreshSimChangeReceiver:Landroid/content/BroadcastReceiver;

    invoke-static {v0, v1, p1}, Lcom/motorola/otalib/common/utils/BroadcastUtils;->registerLocalReceiver(Landroid/content/Context;Landroid/content/BroadcastReceiver;Landroid/content/IntentFilter;)V

    invoke-virtual {p0}, Lcom/motorola/ccc/ota/ui/MenuFragment;->getArguments()Landroid/os/Bundle;

    move-result-object p1

    invoke-virtual {p0}, Lcom/motorola/ccc/ota/ui/MenuFragment;->getActivity()Landroidx/fragment/app/FragmentActivity;

    move-result-object v0

    iput-object v0, p0, Lcom/motorola/ccc/ota/ui/MenuFragment;->mActivity:Landroidx/fragment/app/FragmentActivity;

    invoke-virtual {p0}, Lcom/motorola/ccc/ota/ui/MenuFragment;->getContext()Landroid/content/Context;

    move-result-object v0

    iput-object v0, p0, Lcom/motorola/ccc/ota/ui/MenuFragment;->mContext:Landroid/content/Context;

    iget-object v0, p0, Lcom/motorola/ccc/ota/ui/MenuFragment;->mActivity:Landroidx/fragment/app/FragmentActivity;

    invoke-virtual {v0}, Landroidx/fragment/app/FragmentActivity;->getIntent()Landroid/content/Intent;

    move-result-object v0

    iput-object v0, p0, Lcom/motorola/ccc/ota/ui/MenuFragment;->activityIntent:Landroid/content/Intent;

    iget-object v0, p0, Lcom/motorola/ccc/ota/ui/MenuFragment;->mActivity:Landroidx/fragment/app/FragmentActivity;

    invoke-virtual {v0}, Landroidx/fragment/app/FragmentActivity;->getWindow()Landroid/view/Window;

    move-result-object v0

    const/high16 v1, -0x80000000

    invoke-virtual {v0, v1}, Landroid/view/Window;->addFlags(I)V

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/view/Window;->setStatusBarColor(I)V

    invoke-virtual {v0, v1}, Landroid/view/Window;->setNavigationBarColor(I)V

    if-eqz p1, :cond_0

    const-string v0, "activityIntent"

    invoke-virtual {p1, v0}, Landroid/os/Bundle;->getParcelable(Ljava/lang/String;)Landroid/os/Parcelable;

    move-result-object p1

    check-cast p1, Landroid/content/Intent;

    iput-object p1, p0, Lcom/motorola/ccc/ota/ui/MenuFragment;->activityIntent:Landroid/content/Intent;

    :cond_0
    return-void
.end method

.method public onAttach(Landroid/content/Context;)V
    .locals 1

    invoke-super {p0, p1}, Landroidx/fragment/app/Fragment;->onAttach(Landroid/content/Context;)V

    iput-object p1, p0, Lcom/motorola/ccc/ota/ui/MenuFragment;->mContext:Landroid/content/Context;

    instance-of v0, p1, Landroidx/fragment/app/FragmentActivity;

    if-eqz v0, :cond_0

    check-cast p1, Landroidx/fragment/app/FragmentActivity;

    iput-object p1, p0, Lcom/motorola/ccc/ota/ui/MenuFragment;->mActivity:Landroidx/fragment/app/FragmentActivity;

    :cond_0
    return-void
.end method

.method public onCreate(Landroid/os/Bundle;)V
    .locals 2

    const-string v0, "OtaApp"

    const-string v1, "MenuFragment, onCreate"

    invoke-static {v0, v1}, Lcom/motorola/ccc/ota/utils/Logger;->debug(Ljava/lang/String;Ljava/lang/String;)V

    invoke-super {p0, p1}, Landroidx/fragment/app/Fragment;->onCreate(Landroid/os/Bundle;)V

    new-instance p1, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    invoke-direct {p1}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;-><init>()V

    iput-object p1, p0, Lcom/motorola/ccc/ota/ui/MenuFragment;->settings:Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    return-void
.end method

.method public onCreateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;Landroid/os/Bundle;)Landroid/view/View;
    .locals 1

    const-string p3, "OtaApp"

    const-string v0, "MenuFragment, onCreateView"

    invoke-static {p3, v0}, Lcom/motorola/ccc/ota/utils/Logger;->debug(Ljava/lang/String;Ljava/lang/String;)V

    const p3, 0x7f0c00a4

    const/4 v0, 0x0

    invoke-virtual {p1, p3, p2, v0}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object p1

    iput-object p1, p0, Lcom/motorola/ccc/ota/ui/MenuFragment;->mRootView:Landroid/view/View;

    invoke-direct {p0}, Lcom/motorola/ccc/ota/ui/MenuFragment;->findViewsById()V

    invoke-direct {p0}, Lcom/motorola/ccc/ota/ui/MenuFragment;->handleButtons()V

    invoke-direct {p0}, Lcom/motorola/ccc/ota/ui/MenuFragment;->initUI()V

    iget-object p0, p0, Lcom/motorola/ccc/ota/ui/MenuFragment;->mRootView:Landroid/view/View;

    return-object p0
.end method

.method public onDestroyView()V
    .locals 3

    const-string v0, "OtaApp"

    const-string v1, "MenuFragment, onDestroyView"

    invoke-static {v0, v1}, Lcom/motorola/ccc/ota/utils/Logger;->debug(Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {p0}, Lcom/motorola/ccc/ota/ui/MenuFragment;->getFragmentManager()Landroidx/fragment/app/FragmentManager;

    move-result-object v0

    invoke-virtual {v0}, Landroidx/fragment/app/FragmentManager;->getFragments()Ljava/util/List;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :cond_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_1

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroidx/fragment/app/Fragment;

    iget-object v2, p0, Lcom/motorola/ccc/ota/ui/MenuFragment;->mActivity:Landroidx/fragment/app/FragmentActivity;

    invoke-virtual {v2}, Landroidx/fragment/app/FragmentActivity;->isFinishing()Z

    move-result v2

    if-nez v2, :cond_0

    instance-of v2, v1, Lcom/motorola/ccc/ota/utils/SmartUpdateUtils$OnSmartUpdateConfigChangedLister;

    if-eqz v2, :cond_0

    check-cast v1, Lcom/motorola/ccc/ota/utils/SmartUpdateUtils$OnSmartUpdateConfigChangedLister;

    invoke-interface {v1}, Lcom/motorola/ccc/ota/utils/SmartUpdateUtils$OnSmartUpdateConfigChangedLister;->onSmartUpdateConfigChanged()V

    :cond_1
    invoke-static {}, Lcom/motorola/ccc/ota/env/OtaApplication;->getGlobalContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0}, Lcom/motorola/ccc/ota/utils/SmartUpdateUtils;->decideToShowSmartUpdateSuggestion(Landroid/content/Context;)V

    iget-object v0, p0, Lcom/motorola/ccc/ota/ui/MenuFragment;->mContext:Landroid/content/Context;

    iget-object v1, p0, Lcom/motorola/ccc/ota/ui/MenuFragment;->mUIRefreshSimChangeReceiver:Landroid/content/BroadcastReceiver;

    invoke-static {v0, v1}, Lcom/motorola/otalib/common/utils/BroadcastUtils;->unregisterLocalReceiver(Landroid/content/Context;Landroid/content/BroadcastReceiver;)V

    invoke-super {p0}, Landroidx/fragment/app/Fragment;->onDestroyView()V

    return-void
.end method

.method public onPause()V
    .locals 1

    invoke-super {p0}, Landroidx/fragment/app/Fragment;->onPause()V

    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/motorola/ccc/ota/ui/MenuFragment;->isTransactionSafe:Z

    return-void
.end method

.method public onResume()V
    .locals 1

    invoke-super {p0}, Landroidx/fragment/app/Fragment;->onResume()V

    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/motorola/ccc/ota/ui/MenuFragment;->isTransactionSafe:Z

    return-void
.end method

.method public onSmartUpdateConfigChanged()V
    .locals 0

    invoke-direct {p0}, Lcom/motorola/ccc/ota/ui/MenuFragment;->initUI()V

    return-void
.end method
