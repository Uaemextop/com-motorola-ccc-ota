.class public Lcom/motorola/ccc/ota/ui/UpdatePreferenceFragment;
.super Landroidx/fragment/app/DialogFragment;
.source "UpdatePreferenceFragment.java"

# interfaces
.implements Lcom/motorola/ccc/ota/utils/SmartUpdateUtils$SmartDialog;
.implements Lcom/motorola/ccc/ota/utils/SmartUpdateUtils$OnSmartUpdateConfigChangedLister;


# instance fields
.field private activityIntent:Landroid/content/Intent;

.field private imgBack:Landroid/widget/ImageView;

.field private lnrSmartUpdateParent:Landroid/widget/LinearLayout;

.field private mActivity:Landroidx/fragment/app/FragmentActivity;

.field private mContext:Landroid/content/Context;

.field private mRootView:Landroid/view/View;

.field private settings:Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

.field private switchSmartUpdate:Landroid/widget/Switch;

.field private turnOffSureSmartUpdateDialog:Landroidx/appcompat/app/AlertDialog;

.field private txtUpdatePrefText:Landroid/widget/TextView;

.field private updateHistory:Landroid/widget/TextView;

.field private updatePrefsToolbar:Landroid/widget/LinearLayout;


# direct methods
.method static bridge synthetic -$$Nest$fgetmActivity(Lcom/motorola/ccc/ota/ui/UpdatePreferenceFragment;)Landroidx/fragment/app/FragmentActivity;
    .locals 0

    iget-object p0, p0, Lcom/motorola/ccc/ota/ui/UpdatePreferenceFragment;->mActivity:Landroidx/fragment/app/FragmentActivity;

    return-object p0
.end method

.method static bridge synthetic -$$Nest$fgetmContext(Lcom/motorola/ccc/ota/ui/UpdatePreferenceFragment;)Landroid/content/Context;
    .locals 0

    iget-object p0, p0, Lcom/motorola/ccc/ota/ui/UpdatePreferenceFragment;->mContext:Landroid/content/Context;

    return-object p0
.end method

.method static bridge synthetic -$$Nest$fgetsettings(Lcom/motorola/ccc/ota/ui/UpdatePreferenceFragment;)Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;
    .locals 0

    iget-object p0, p0, Lcom/motorola/ccc/ota/ui/UpdatePreferenceFragment;->settings:Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    return-object p0
.end method

.method static bridge synthetic -$$Nest$fputturnOffSureSmartUpdateDialog(Lcom/motorola/ccc/ota/ui/UpdatePreferenceFragment;Landroidx/appcompat/app/AlertDialog;)V
    .locals 0

    iput-object p1, p0, Lcom/motorola/ccc/ota/ui/UpdatePreferenceFragment;->turnOffSureSmartUpdateDialog:Landroidx/appcompat/app/AlertDialog;

    return-void
.end method

.method static bridge synthetic -$$Nest$minitUI(Lcom/motorola/ccc/ota/ui/UpdatePreferenceFragment;)V
    .locals 0

    invoke-direct {p0}, Lcom/motorola/ccc/ota/ui/UpdatePreferenceFragment;->initUI()V

    return-void
.end method

.method static bridge synthetic -$$Nest$mlaunchSmartUpdate(Lcom/motorola/ccc/ota/ui/UpdatePreferenceFragment;)V
    .locals 0

    invoke-direct {p0}, Lcom/motorola/ccc/ota/ui/UpdatePreferenceFragment;->launchSmartUpdate()V

    return-void
.end method

.method static bridge synthetic -$$Nest$mlaunchUpdateHistory(Lcom/motorola/ccc/ota/ui/UpdatePreferenceFragment;)V
    .locals 0

    invoke-direct {p0}, Lcom/motorola/ccc/ota/ui/UpdatePreferenceFragment;->launchUpdateHistory()V

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    invoke-direct {p0}, Landroidx/fragment/app/DialogFragment;-><init>()V

    return-void
.end method

.method private findViewsById()V
    .locals 2

    iget-object v0, p0, Lcom/motorola/ccc/ota/ui/UpdatePreferenceFragment;->mRootView:Landroid/view/View;

    const v1, 0x7f0900f7

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/LinearLayout;

    iput-object v0, p0, Lcom/motorola/ccc/ota/ui/UpdatePreferenceFragment;->lnrSmartUpdateParent:Landroid/widget/LinearLayout;

    iget-object v0, p0, Lcom/motorola/ccc/ota/ui/UpdatePreferenceFragment;->mRootView:Landroid/view/View;

    const v1, 0x7f0901b2

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/Switch;

    iput-object v0, p0, Lcom/motorola/ccc/ota/ui/UpdatePreferenceFragment;->switchSmartUpdate:Landroid/widget/Switch;

    iget-object v0, p0, Lcom/motorola/ccc/ota/ui/UpdatePreferenceFragment;->mRootView:Landroid/view/View;

    const v1, 0x7f0901e6

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p0, Lcom/motorola/ccc/ota/ui/UpdatePreferenceFragment;->txtUpdatePrefText:Landroid/widget/TextView;

    iget-object v0, p0, Lcom/motorola/ccc/ota/ui/UpdatePreferenceFragment;->mRootView:Landroid/view/View;

    const v1, 0x7f0900e0

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/ImageView;

    iput-object v0, p0, Lcom/motorola/ccc/ota/ui/UpdatePreferenceFragment;->imgBack:Landroid/widget/ImageView;

    iget-object v0, p0, Lcom/motorola/ccc/ota/ui/UpdatePreferenceFragment;->mRootView:Landroid/view/View;

    const v1, 0x7f0901f2

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/LinearLayout;

    iput-object v0, p0, Lcom/motorola/ccc/ota/ui/UpdatePreferenceFragment;->updatePrefsToolbar:Landroid/widget/LinearLayout;

    iget-object v0, p0, Lcom/motorola/ccc/ota/ui/UpdatePreferenceFragment;->mRootView:Landroid/view/View;

    const v1, 0x7f0900d3

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p0, Lcom/motorola/ccc/ota/ui/UpdatePreferenceFragment;->updateHistory:Landroid/widget/TextView;

    return-void
.end method

.method private handleButtons()V
    .locals 2

    iget-object v0, p0, Lcom/motorola/ccc/ota/ui/UpdatePreferenceFragment;->switchSmartUpdate:Landroid/widget/Switch;

    new-instance v1, Lcom/motorola/ccc/ota/ui/UpdatePreferenceFragment$1;

    invoke-direct {v1, p0}, Lcom/motorola/ccc/ota/ui/UpdatePreferenceFragment$1;-><init>(Lcom/motorola/ccc/ota/ui/UpdatePreferenceFragment;)V

    invoke-virtual {v0, v1}, Landroid/widget/Switch;->setOnCheckedChangeListener(Landroid/widget/CompoundButton$OnCheckedChangeListener;)V

    iget-object v0, p0, Lcom/motorola/ccc/ota/ui/UpdatePreferenceFragment;->imgBack:Landroid/widget/ImageView;

    new-instance v1, Lcom/motorola/ccc/ota/ui/UpdatePreferenceFragment$2;

    invoke-direct {v1, p0}, Lcom/motorola/ccc/ota/ui/UpdatePreferenceFragment$2;-><init>(Lcom/motorola/ccc/ota/ui/UpdatePreferenceFragment;)V

    invoke-virtual {v0, v1}, Landroid/widget/ImageView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    iget-object v0, p0, Lcom/motorola/ccc/ota/ui/UpdatePreferenceFragment;->lnrSmartUpdateParent:Landroid/widget/LinearLayout;

    new-instance v1, Lcom/motorola/ccc/ota/ui/UpdatePreferenceFragment$3;

    invoke-direct {v1, p0}, Lcom/motorola/ccc/ota/ui/UpdatePreferenceFragment$3;-><init>(Lcom/motorola/ccc/ota/ui/UpdatePreferenceFragment;)V

    invoke-virtual {v0, v1}, Landroid/widget/LinearLayout;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    iget-object v0, p0, Lcom/motorola/ccc/ota/ui/UpdatePreferenceFragment;->updateHistory:Landroid/widget/TextView;

    new-instance v1, Lcom/motorola/ccc/ota/ui/UpdatePreferenceFragment$4;

    invoke-direct {v1, p0}, Lcom/motorola/ccc/ota/ui/UpdatePreferenceFragment$4;-><init>(Lcom/motorola/ccc/ota/ui/UpdatePreferenceFragment;)V

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    return-void
.end method

.method private initUI()V
    .locals 3

    iget-object v0, p0, Lcom/motorola/ccc/ota/ui/UpdatePreferenceFragment;->updatePrefsToolbar:Landroid/widget/LinearLayout;

    iget-object v1, p0, Lcom/motorola/ccc/ota/ui/UpdatePreferenceFragment;->mActivity:Landroidx/fragment/app/FragmentActivity;

    invoke-virtual {v1}, Landroidx/fragment/app/FragmentActivity;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    const v2, 0x7f06006c

    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getColor(I)I

    move-result v1

    invoke-virtual {v0, v1}, Landroid/widget/LinearLayout;->setBackgroundColor(I)V

    invoke-static {}, Lcom/motorola/ccc/ota/ui/UpdaterUtils;->isVerizon()Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/motorola/ccc/ota/ui/UpdatePreferenceFragment;->txtUpdatePrefText:Landroid/widget/TextView;

    const v1, 0x7f0e0190

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(I)V

    goto :goto_0

    :cond_0
    invoke-static {}, Lcom/motorola/ccc/ota/utils/BuildPropReader;->isSoftbank()Z

    move-result v0

    if-eqz v0, :cond_1

    invoke-static {}, Lcom/motorola/ccc/ota/utils/BuildPropReader;->isSoftbankSIM()Z

    move-result v0

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/motorola/ccc/ota/ui/UpdatePreferenceFragment;->txtUpdatePrefText:Landroid/widget/TextView;

    const v1, 0x7f0e018f

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(I)V

    goto :goto_0

    :cond_1
    iget-object v0, p0, Lcom/motorola/ccc/ota/ui/UpdatePreferenceFragment;->txtUpdatePrefText:Landroid/widget/TextView;

    const v1, 0x7f0e018e

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(I)V

    :goto_0
    invoke-static {}, Lcom/motorola/ccc/ota/utils/SmartUpdateUtils;->isSmartUpdateEnabledByServer()Z

    move-result v0

    const/4 v1, 0x0

    if-nez v0, :cond_2

    iget-object v0, p0, Lcom/motorola/ccc/ota/ui/UpdatePreferenceFragment;->lnrSmartUpdateParent:Landroid/widget/LinearLayout;

    const/16 v2, 0x8

    invoke-virtual {v0, v2}, Landroid/widget/LinearLayout;->setVisibility(I)V

    goto :goto_1

    :cond_2
    iget-object v0, p0, Lcom/motorola/ccc/ota/ui/UpdatePreferenceFragment;->lnrSmartUpdateParent:Landroid/widget/LinearLayout;

    invoke-virtual {v0, v1}, Landroid/widget/LinearLayout;->setVisibility(I)V

    :goto_1
    iget-object v0, p0, Lcom/motorola/ccc/ota/ui/UpdatePreferenceFragment;->settings:Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    invoke-static {v0}, Lcom/motorola/ccc/ota/utils/SmartUpdateUtils;->isSmartUpdateEnabledByUser(Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;)Z

    move-result v0

    if-eqz v0, :cond_3

    iget-object p0, p0, Lcom/motorola/ccc/ota/ui/UpdatePreferenceFragment;->switchSmartUpdate:Landroid/widget/Switch;

    const/4 v0, 0x1

    invoke-virtual {p0, v0}, Landroid/widget/Switch;->setChecked(Z)V

    goto :goto_2

    :cond_3
    iget-object p0, p0, Lcom/motorola/ccc/ota/ui/UpdatePreferenceFragment;->switchSmartUpdate:Landroid/widget/Switch;

    invoke-virtual {p0, v1}, Landroid/widget/Switch;->setChecked(Z)V

    :goto_2
    return-void
.end method

.method private launchSmartUpdate()V
    .locals 4

    new-instance v0, Landroid/os/Bundle;

    invoke-direct {v0}, Landroid/os/Bundle;-><init>()V

    iget-object v1, p0, Lcom/motorola/ccc/ota/ui/UpdatePreferenceFragment;->mActivity:Landroidx/fragment/app/FragmentActivity;

    invoke-virtual {v1}, Landroidx/fragment/app/FragmentActivity;->getIntent()Landroid/content/Intent;

    move-result-object v1

    iput-object v1, p0, Lcom/motorola/ccc/ota/ui/UpdatePreferenceFragment;->activityIntent:Landroid/content/Intent;

    sget-object v2, Lcom/motorola/ccc/ota/utils/SmartUpdateUtils$SmartUpdateLaunchMode;->UPGRADE_PREFERENCE_FRAGMENT:Lcom/motorola/ccc/ota/utils/SmartUpdateUtils$SmartUpdateLaunchMode;

    invoke-virtual {v2}, Lcom/motorola/ccc/ota/utils/SmartUpdateUtils$SmartUpdateLaunchMode;->name()Ljava/lang/String;

    move-result-object v2

    const-string v3, "com.motorola.blur.service.blur.update.launch_mode"

    invoke-virtual {v1, v3, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    const-string v1, "activityIntent"

    iget-object v2, p0, Lcom/motorola/ccc/ota/ui/UpdatePreferenceFragment;->activityIntent:Landroid/content/Intent;

    invoke-virtual {v0, v1, v2}, Landroid/os/Bundle;->putParcelable(Ljava/lang/String;Landroid/os/Parcelable;)V

    new-instance v1, Lcom/motorola/ccc/ota/ui/SmartUpdateFragment;

    invoke-direct {v1}, Lcom/motorola/ccc/ota/ui/SmartUpdateFragment;-><init>()V

    invoke-virtual {v1, v0}, Lcom/motorola/ccc/ota/ui/SmartUpdateFragment;->setArguments(Landroid/os/Bundle;)V

    iget-object p0, p0, Lcom/motorola/ccc/ota/ui/UpdatePreferenceFragment;->mActivity:Landroidx/fragment/app/FragmentActivity;

    invoke-virtual {p0}, Landroidx/fragment/app/FragmentActivity;->getSupportFragmentManager()Landroidx/fragment/app/FragmentManager;

    move-result-object p0

    const-string v0, "SmartUpdateDialog"

    invoke-virtual {v1, p0, v0}, Lcom/motorola/ccc/ota/ui/SmartUpdateFragment;->show(Landroidx/fragment/app/FragmentManager;Ljava/lang/String;)V

    return-void
.end method

.method private launchUpdateHistory()V
    .locals 3

    new-instance v0, Landroid/os/Bundle;

    invoke-direct {v0}, Landroid/os/Bundle;-><init>()V

    iget-object v1, p0, Lcom/motorola/ccc/ota/ui/UpdatePreferenceFragment;->mActivity:Landroidx/fragment/app/FragmentActivity;

    invoke-virtual {v1}, Landroidx/fragment/app/FragmentActivity;->getIntent()Landroid/content/Intent;

    move-result-object v1

    iput-object v1, p0, Lcom/motorola/ccc/ota/ui/UpdatePreferenceFragment;->activityIntent:Landroid/content/Intent;

    const-string v2, "activityIntent"

    invoke-virtual {v0, v2, v1}, Landroid/os/Bundle;->putParcelable(Ljava/lang/String;Landroid/os/Parcelable;)V

    new-instance v1, Lcom/motorola/ccc/ota/ui/UpdateHistoryFragment;

    invoke-direct {v1}, Lcom/motorola/ccc/ota/ui/UpdateHistoryFragment;-><init>()V

    invoke-virtual {v1, v0}, Lcom/motorola/ccc/ota/ui/UpdateHistoryFragment;->setArguments(Landroid/os/Bundle;)V

    iget-object p0, p0, Lcom/motorola/ccc/ota/ui/UpdatePreferenceFragment;->mActivity:Landroidx/fragment/app/FragmentActivity;

    invoke-virtual {p0}, Landroidx/fragment/app/FragmentActivity;->getSupportFragmentManager()Landroidx/fragment/app/FragmentManager;

    move-result-object p0

    const-string v0, "UpdateHistoryDialog"

    invoke-virtual {v1, p0, v0}, Lcom/motorola/ccc/ota/ui/UpdateHistoryFragment;->show(Landroidx/fragment/app/FragmentManager;Ljava/lang/String;)V

    return-void
.end method


# virtual methods
.method public dismissSmartDialog()V
    .locals 1

    iget-object v0, p0, Lcom/motorola/ccc/ota/ui/UpdatePreferenceFragment;->turnOffSureSmartUpdateDialog:Landroidx/appcompat/app/AlertDialog;

    if-eqz v0, :cond_0

    invoke-virtual {v0}, Landroidx/appcompat/app/AlertDialog;->dismiss()V

    :cond_0
    invoke-virtual {p0}, Lcom/motorola/ccc/ota/ui/UpdatePreferenceFragment;->dismiss()V

    return-void
.end method

.method public onActivityCreated(Landroid/os/Bundle;)V
    .locals 1

    invoke-super {p0, p1}, Landroidx/fragment/app/DialogFragment;->onActivityCreated(Landroid/os/Bundle;)V

    invoke-virtual {p0}, Lcom/motorola/ccc/ota/ui/UpdatePreferenceFragment;->getArguments()Landroid/os/Bundle;

    move-result-object p1

    invoke-virtual {p0}, Lcom/motorola/ccc/ota/ui/UpdatePreferenceFragment;->getActivity()Landroidx/fragment/app/FragmentActivity;

    move-result-object v0

    iput-object v0, p0, Lcom/motorola/ccc/ota/ui/UpdatePreferenceFragment;->mActivity:Landroidx/fragment/app/FragmentActivity;

    invoke-virtual {p0}, Lcom/motorola/ccc/ota/ui/UpdatePreferenceFragment;->getContext()Landroid/content/Context;

    move-result-object v0

    iput-object v0, p0, Lcom/motorola/ccc/ota/ui/UpdatePreferenceFragment;->mContext:Landroid/content/Context;

    if-eqz p1, :cond_0

    const-string v0, "activityIntent"

    invoke-virtual {p1, v0}, Landroid/os/Bundle;->getParcelable(Ljava/lang/String;)Landroid/os/Parcelable;

    move-result-object p1

    check-cast p1, Landroid/content/Intent;

    iput-object p1, p0, Lcom/motorola/ccc/ota/ui/UpdatePreferenceFragment;->activityIntent:Landroid/content/Intent;

    :cond_0
    return-void
.end method

.method public onAttach(Landroid/content/Context;)V
    .locals 1

    invoke-super {p0, p1}, Landroidx/fragment/app/DialogFragment;->onAttach(Landroid/content/Context;)V

    iput-object p1, p0, Lcom/motorola/ccc/ota/ui/UpdatePreferenceFragment;->mContext:Landroid/content/Context;

    instance-of v0, p1, Landroidx/fragment/app/FragmentActivity;

    if-eqz v0, :cond_0

    check-cast p1, Landroidx/fragment/app/FragmentActivity;

    iput-object p1, p0, Lcom/motorola/ccc/ota/ui/UpdatePreferenceFragment;->mActivity:Landroidx/fragment/app/FragmentActivity;

    :cond_0
    return-void
.end method

.method public onCreate(Landroid/os/Bundle;)V
    .locals 1

    invoke-super {p0, p1}, Landroidx/fragment/app/DialogFragment;->onCreate(Landroid/os/Bundle;)V

    new-instance p1, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    invoke-direct {p1}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;-><init>()V

    iput-object p1, p0, Lcom/motorola/ccc/ota/ui/UpdatePreferenceFragment;->settings:Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    const/4 p1, 0x0

    const v0, 0x7f0f00ca

    invoke-virtual {p0, p1, v0}, Lcom/motorola/ccc/ota/ui/UpdatePreferenceFragment;->setStyle(II)V

    return-void
.end method

.method public onCreateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;Landroid/os/Bundle;)Landroid/view/View;
    .locals 1

    const p3, 0x7f0c00a4

    const/4 v0, 0x0

    invoke-virtual {p1, p3, p2, v0}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object p1

    iput-object p1, p0, Lcom/motorola/ccc/ota/ui/UpdatePreferenceFragment;->mRootView:Landroid/view/View;

    invoke-virtual {p0}, Lcom/motorola/ccc/ota/ui/UpdatePreferenceFragment;->getDialog()Landroid/app/Dialog;

    move-result-object p1

    invoke-static {p1}, Lcom/motorola/ccc/ota/ui/UpdaterUtils;->setNavBarColorFromDialog(Landroid/app/Dialog;)V

    invoke-direct {p0}, Lcom/motorola/ccc/ota/ui/UpdatePreferenceFragment;->findViewsById()V

    invoke-direct {p0}, Lcom/motorola/ccc/ota/ui/UpdatePreferenceFragment;->handleButtons()V

    invoke-direct {p0}, Lcom/motorola/ccc/ota/ui/UpdatePreferenceFragment;->initUI()V

    iget-object p0, p0, Lcom/motorola/ccc/ota/ui/UpdatePreferenceFragment;->mRootView:Landroid/view/View;

    return-object p0
.end method

.method public onDestroyView()V
    .locals 3

    invoke-virtual {p0}, Lcom/motorola/ccc/ota/ui/UpdatePreferenceFragment;->getFragmentManager()Landroidx/fragment/app/FragmentManager;

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

    iget-object v2, p0, Lcom/motorola/ccc/ota/ui/UpdatePreferenceFragment;->mActivity:Landroidx/fragment/app/FragmentActivity;

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

    invoke-super {p0}, Landroidx/fragment/app/DialogFragment;->onDestroyView()V

    return-void
.end method

.method public onSmartUpdateConfigChanged()V
    .locals 0

    invoke-direct {p0}, Lcom/motorola/ccc/ota/ui/UpdatePreferenceFragment;->initUI()V

    return-void
.end method
