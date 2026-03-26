.class public Lcom/motorola/ccc/ota/sources/fota/FotaAutoDownloadSettings;
.super Landroidx/fragment/app/DialogFragment;
.source "FotaAutoDownloadSettings.java"

# interfaces
.implements Lcom/motorola/ccc/ota/utils/SmartUpdateUtils$SmartDialog;


# instance fields
.field cm:Landroid/net/ConnectivityManager;

.field private imgBack:Landroid/widget/ImageView;

.field private mActivity:Landroidx/fragment/app/FragmentActivity;

.field private mContext:Landroid/content/Context;

.field private mRootView:Landroid/view/View;

.field metaData:Lcom/motorola/otalib/common/metaData/MetaData;

.field private radioGroupWifiCellular:Landroid/widget/RadioGroup;

.field private radioWifi:Landroid/widget/RadioButton;

.field private radioWifiCellular:Landroid/widget/RadioButton;

.field private settings:Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;


# direct methods
.method static bridge synthetic -$$Nest$fgetmContext(Lcom/motorola/ccc/ota/sources/fota/FotaAutoDownloadSettings;)Landroid/content/Context;
    .locals 0

    iget-object p0, p0, Lcom/motorola/ccc/ota/sources/fota/FotaAutoDownloadSettings;->mContext:Landroid/content/Context;

    return-object p0
.end method

.method static bridge synthetic -$$Nest$fgetsettings(Lcom/motorola/ccc/ota/sources/fota/FotaAutoDownloadSettings;)Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;
    .locals 0

    iget-object p0, p0, Lcom/motorola/ccc/ota/sources/fota/FotaAutoDownloadSettings;->settings:Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    return-object p0
.end method

.method static bridge synthetic -$$Nest$mbroadcastPollingIntent(Lcom/motorola/ccc/ota/sources/fota/FotaAutoDownloadSettings;)V
    .locals 0

    invoke-direct {p0}, Lcom/motorola/ccc/ota/sources/fota/FotaAutoDownloadSettings;->broadcastPollingIntent()V

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    invoke-direct {p0}, Landroidx/fragment/app/DialogFragment;-><init>()V

    return-void
.end method

.method private broadcastPollingIntent()V
    .locals 3

    new-instance v0, Landroid/content/Intent;

    const-string v1, "com.motorola.ccc.ota.pm.POLLINGMGR_CONNECTIVITY"

    invoke-direct {v0, v1}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    iget-object v1, p0, Lcom/motorola/ccc/ota/sources/fota/FotaAutoDownloadSettings;->cm:Landroid/net/ConnectivityManager;

    invoke-static {v1}, Lcom/motorola/otalib/common/utils/NetworkUtils;->hasNetwork(Landroid/net/ConnectivityManager;)Z

    move-result v1

    const-string v2, "com.motorola.ccc.ota.pm.connectivity"

    invoke-virtual {v0, v2, v1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Z)Landroid/content/Intent;

    iget-object p0, p0, Lcom/motorola/ccc/ota/sources/fota/FotaAutoDownloadSettings;->cm:Landroid/net/ConnectivityManager;

    invoke-static {p0}, Lcom/motorola/otalib/common/utils/NetworkUtils;->getNetworkCapabilityType(Landroid/net/ConnectivityManager;)I

    move-result p0

    const-string v1, "com.motorola.ccc.ota.pm.connectivityType"

    invoke-virtual {v0, v1, p0}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    invoke-static {}, Lcom/motorola/ccc/ota/env/OtaApplication;->getGlobalContext()Landroid/content/Context;

    move-result-object p0

    invoke-static {p0, v0}, Lcom/motorola/otalib/common/utils/BroadcastUtils;->sendLocalBroadcast(Landroid/content/Context;Landroid/content/Intent;)V

    return-void
.end method

.method private findViewsById()V
    .locals 2

    iget-object v0, p0, Lcom/motorola/ccc/ota/sources/fota/FotaAutoDownloadSettings;->mRootView:Landroid/view/View;

    const v1, 0x7f0900e0

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/ImageView;

    iput-object v0, p0, Lcom/motorola/ccc/ota/sources/fota/FotaAutoDownloadSettings;->imgBack:Landroid/widget/ImageView;

    iget-object v0, p0, Lcom/motorola/ccc/ota/sources/fota/FotaAutoDownloadSettings;->mRootView:Landroid/view/View;

    const v1, 0x7f090138

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/RadioGroup;

    iput-object v0, p0, Lcom/motorola/ccc/ota/sources/fota/FotaAutoDownloadSettings;->radioGroupWifiCellular:Landroid/widget/RadioGroup;

    iget-object v0, p0, Lcom/motorola/ccc/ota/sources/fota/FotaAutoDownloadSettings;->mRootView:Landroid/view/View;

    const v1, 0x7f09013d

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/RadioButton;

    iput-object v0, p0, Lcom/motorola/ccc/ota/sources/fota/FotaAutoDownloadSettings;->radioWifi:Landroid/widget/RadioButton;

    iget-object v0, p0, Lcom/motorola/ccc/ota/sources/fota/FotaAutoDownloadSettings;->mRootView:Landroid/view/View;

    const v1, 0x7f09013e

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/RadioButton;

    iput-object v0, p0, Lcom/motorola/ccc/ota/sources/fota/FotaAutoDownloadSettings;->radioWifiCellular:Landroid/widget/RadioButton;

    return-void
.end method

.method private handleListeners()V
    .locals 2

    iget-object v0, p0, Lcom/motorola/ccc/ota/sources/fota/FotaAutoDownloadSettings;->radioGroupWifiCellular:Landroid/widget/RadioGroup;

    new-instance v1, Lcom/motorola/ccc/ota/sources/fota/FotaAutoDownloadSettings$1;

    invoke-direct {v1, p0}, Lcom/motorola/ccc/ota/sources/fota/FotaAutoDownloadSettings$1;-><init>(Lcom/motorola/ccc/ota/sources/fota/FotaAutoDownloadSettings;)V

    invoke-virtual {v0, v1}, Landroid/widget/RadioGroup;->setOnCheckedChangeListener(Landroid/widget/RadioGroup$OnCheckedChangeListener;)V

    iget-object v0, p0, Lcom/motorola/ccc/ota/sources/fota/FotaAutoDownloadSettings;->imgBack:Landroid/widget/ImageView;

    new-instance v1, Lcom/motorola/ccc/ota/sources/fota/FotaAutoDownloadSettings$$ExternalSyntheticLambda0;

    invoke-direct {v1, p0}, Lcom/motorola/ccc/ota/sources/fota/FotaAutoDownloadSettings$$ExternalSyntheticLambda0;-><init>(Lcom/motorola/ccc/ota/sources/fota/FotaAutoDownloadSettings;)V

    invoke-virtual {v0, v1}, Landroid/widget/ImageView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    return-void
.end method

.method private initUI()V
    .locals 6

    iget-object v0, p0, Lcom/motorola/ccc/ota/sources/fota/FotaAutoDownloadSettings;->settings:Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    sget-object v1, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->USER_AUTO_DOWNLOAD_OPTION:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    invoke-virtual {v0, v1}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->getString(Lcom/motorola/otalib/common/settings/ISetting;)Ljava/lang/String;

    move-result-object v0

    sget-object v1, Lcom/motorola/ccc/ota/sources/fota/FotaConstants$AutoDownloadOption;->OTAorWiFi:Lcom/motorola/ccc/ota/sources/fota/FotaConstants$AutoDownloadOption;

    invoke-virtual {v1}, Lcom/motorola/ccc/ota/sources/fota/FotaConstants$AutoDownloadOption;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    const/4 v1, 0x1

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/motorola/ccc/ota/sources/fota/FotaAutoDownloadSettings;->radioWifiCellular:Landroid/widget/RadioButton;

    invoke-virtual {v0, v1}, Landroid/widget/RadioButton;->setChecked(Z)V

    goto :goto_0

    :cond_0
    iget-object v0, p0, Lcom/motorola/ccc/ota/sources/fota/FotaAutoDownloadSettings;->radioWifi:Landroid/widget/RadioButton;

    invoke-virtual {v0, v1}, Landroid/widget/RadioButton;->setChecked(Z)V

    :goto_0
    iget-object v0, p0, Lcom/motorola/ccc/ota/sources/fota/FotaAutoDownloadSettings;->metaData:Lcom/motorola/otalib/common/metaData/MetaData;

    const/4 v2, 0x0

    if-eqz v0, :cond_1

    invoke-virtual {v0}, Lcom/motorola/otalib/common/metaData/MetaData;->isWifiOnly()Z

    move-result v0

    goto :goto_1

    :cond_1
    move v0, v2

    :goto_1
    iget-object v3, p0, Lcom/motorola/ccc/ota/sources/fota/FotaAutoDownloadSettings;->settings:Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    sget-object v4, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->SERVER_FOTA_TRANSPORTMEDIA_VALUE:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    invoke-virtual {v3, v4}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->getString(Lcom/motorola/otalib/common/settings/ISetting;)Ljava/lang/String;

    move-result-object v3

    invoke-static {}, Lcom/motorola/ccc/ota/utils/BuildPropReader;->isFotaATT()Z

    move-result v4

    if-eqz v4, :cond_2

    sget-object v0, Lcom/motorola/ccc/ota/sources/fota/FotaConstants$AutoDownloadOption;->WiFi:Lcom/motorola/ccc/ota/sources/fota/FotaConstants$AutoDownloadOption;

    invoke-virtual {v0}, Lcom/motorola/ccc/ota/sources/fota/FotaConstants$AutoDownloadOption;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0, v3}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v0

    :cond_2
    invoke-static {}, Lcom/motorola/ccc/ota/utils/BuildPropReader;->isFotaATT()Z

    move-result v4

    if-eqz v4, :cond_3

    sget-object v4, Lcom/motorola/ccc/ota/sources/fota/FotaConstants$AutoDownloadOption;->RAN:Lcom/motorola/ccc/ota/sources/fota/FotaConstants$AutoDownloadOption;

    invoke-virtual {v4}, Lcom/motorola/ccc/ota/sources/fota/FotaConstants$AutoDownloadOption;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v4, v3}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v3

    goto :goto_2

    :cond_3
    invoke-static {}, Lcom/motorola/ccc/ota/ui/UpdaterUtils;->isForceOnCellular()Z

    move-result v3

    :goto_2
    new-instance v4, Ljava/lang/StringBuilder;

    const-string v5, "FotaAutoDownloadSettings:pkg wifiOnly="

    invoke-direct {v4, v5}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, " : isForceOnCellular="

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v3}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    const-string v5, "OtaApp"

    invoke-static {v5, v4}, Lcom/motorola/ccc/ota/utils/Logger;->debug(Ljava/lang/String;Ljava/lang/String;)V

    const/high16 v4, 0x3f000000    # 0.5f

    if-nez v3, :cond_6

    invoke-static {}, Lcom/motorola/ccc/ota/ui/UpdaterUtils;->getAutomaticDownloadForCellular()Z

    move-result v3

    if-eqz v3, :cond_4

    goto :goto_3

    :cond_4
    const/high16 v3, 0x3f800000    # 1.0f

    if-eqz v0, :cond_5

    iget-object v0, p0, Lcom/motorola/ccc/ota/sources/fota/FotaAutoDownloadSettings;->radioWifiCellular:Landroid/widget/RadioButton;

    invoke-virtual {v0, v2}, Landroid/widget/RadioButton;->setEnabled(Z)V

    iget-object v0, p0, Lcom/motorola/ccc/ota/sources/fota/FotaAutoDownloadSettings;->radioWifiCellular:Landroid/widget/RadioButton;

    invoke-virtual {v0, v4}, Landroid/widget/RadioButton;->setAlpha(F)V

    iget-object v0, p0, Lcom/motorola/ccc/ota/sources/fota/FotaAutoDownloadSettings;->radioWifi:Landroid/widget/RadioButton;

    invoke-virtual {v0, v1}, Landroid/widget/RadioButton;->setEnabled(Z)V

    iget-object p0, p0, Lcom/motorola/ccc/ota/sources/fota/FotaAutoDownloadSettings;->radioWifi:Landroid/widget/RadioButton;

    invoke-virtual {p0, v3}, Landroid/widget/RadioButton;->setAlpha(F)V

    goto :goto_4

    :cond_5
    iget-object v0, p0, Lcom/motorola/ccc/ota/sources/fota/FotaAutoDownloadSettings;->radioWifiCellular:Landroid/widget/RadioButton;

    invoke-virtual {v0, v1}, Landroid/widget/RadioButton;->setEnabled(Z)V

    iget-object v0, p0, Lcom/motorola/ccc/ota/sources/fota/FotaAutoDownloadSettings;->radioWifiCellular:Landroid/widget/RadioButton;

    invoke-virtual {v0, v3}, Landroid/widget/RadioButton;->setAlpha(F)V

    iget-object v0, p0, Lcom/motorola/ccc/ota/sources/fota/FotaAutoDownloadSettings;->radioWifi:Landroid/widget/RadioButton;

    invoke-virtual {v0, v1}, Landroid/widget/RadioButton;->setEnabled(Z)V

    iget-object p0, p0, Lcom/motorola/ccc/ota/sources/fota/FotaAutoDownloadSettings;->radioWifi:Landroid/widget/RadioButton;

    invoke-virtual {p0, v3}, Landroid/widget/RadioButton;->setAlpha(F)V

    goto :goto_4

    :cond_6
    :goto_3
    iget-object v0, p0, Lcom/motorola/ccc/ota/sources/fota/FotaAutoDownloadSettings;->radioWifiCellular:Landroid/widget/RadioButton;

    invoke-virtual {v0, v2}, Landroid/widget/RadioButton;->setEnabled(Z)V

    iget-object v0, p0, Lcom/motorola/ccc/ota/sources/fota/FotaAutoDownloadSettings;->radioWifiCellular:Landroid/widget/RadioButton;

    invoke-virtual {v0, v4}, Landroid/widget/RadioButton;->setAlpha(F)V

    iget-object v0, p0, Lcom/motorola/ccc/ota/sources/fota/FotaAutoDownloadSettings;->radioWifi:Landroid/widget/RadioButton;

    invoke-virtual {v0, v2}, Landroid/widget/RadioButton;->setEnabled(Z)V

    iget-object p0, p0, Lcom/motorola/ccc/ota/sources/fota/FotaAutoDownloadSettings;->radioWifi:Landroid/widget/RadioButton;

    invoke-virtual {p0, v4}, Landroid/widget/RadioButton;->setAlpha(F)V

    :goto_4
    return-void
.end method


# virtual methods
.method public dismissSmartDialog()V
    .locals 0

    invoke-virtual {p0}, Lcom/motorola/ccc/ota/sources/fota/FotaAutoDownloadSettings;->dismiss()V

    return-void
.end method

.method synthetic lambda$handleListeners$0$com-motorola-ccc-ota-sources-fota-FotaAutoDownloadSettings(Landroid/view/View;)V
    .locals 1

    invoke-virtual {p0}, Lcom/motorola/ccc/ota/sources/fota/FotaAutoDownloadSettings;->getFragmentManager()Landroidx/fragment/app/FragmentManager;

    move-result-object p1

    invoke-virtual {p1}, Landroidx/fragment/app/FragmentManager;->getFragments()Ljava/util/List;

    move-result-object p1

    invoke-interface {p1}, Ljava/util/List;->toArray()[Ljava/lang/Object;

    move-result-object p1

    array-length p1, p1

    const/4 v0, 0x1

    if-gt p1, v0, :cond_0

    iget-object p1, p0, Lcom/motorola/ccc/ota/sources/fota/FotaAutoDownloadSettings;->mActivity:Landroidx/fragment/app/FragmentActivity;

    invoke-virtual {p1}, Landroidx/fragment/app/FragmentActivity;->finish()V

    :cond_0
    invoke-virtual {p0}, Lcom/motorola/ccc/ota/sources/fota/FotaAutoDownloadSettings;->dismiss()V

    return-void
.end method

.method public onAttach(Landroid/content/Context;)V
    .locals 1

    invoke-super {p0, p1}, Landroidx/fragment/app/DialogFragment;->onAttach(Landroid/content/Context;)V

    iput-object p1, p0, Lcom/motorola/ccc/ota/sources/fota/FotaAutoDownloadSettings;->mContext:Landroid/content/Context;

    instance-of v0, p1, Landroidx/fragment/app/FragmentActivity;

    if-eqz v0, :cond_0

    check-cast p1, Landroidx/fragment/app/FragmentActivity;

    iput-object p1, p0, Lcom/motorola/ccc/ota/sources/fota/FotaAutoDownloadSettings;->mActivity:Landroidx/fragment/app/FragmentActivity;

    :cond_0
    return-void
.end method

.method public onCreate(Landroid/os/Bundle;)V
    .locals 1

    invoke-super {p0, p1}, Landroidx/fragment/app/DialogFragment;->onCreate(Landroid/os/Bundle;)V

    new-instance p1, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    invoke-direct {p1}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;-><init>()V

    iput-object p1, p0, Lcom/motorola/ccc/ota/sources/fota/FotaAutoDownloadSettings;->settings:Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    iget-object p1, p0, Lcom/motorola/ccc/ota/sources/fota/FotaAutoDownloadSettings;->mContext:Landroid/content/Context;

    const-string v0, "connectivity"

    invoke-virtual {p1, v0}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Landroid/net/ConnectivityManager;

    iput-object p1, p0, Lcom/motorola/ccc/ota/sources/fota/FotaAutoDownloadSettings;->cm:Landroid/net/ConnectivityManager;

    const/4 p1, 0x0

    const v0, 0x7f0f00ca

    invoke-virtual {p0, p1, v0}, Lcom/motorola/ccc/ota/sources/fota/FotaAutoDownloadSettings;->setStyle(II)V

    return-void
.end method

.method public onCreateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;Landroid/os/Bundle;)Landroid/view/View;
    .locals 1

    const p3, 0x7f0c001e

    const/4 v0, 0x0

    invoke-virtual {p1, p3, p2, v0}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object p1

    iput-object p1, p0, Lcom/motorola/ccc/ota/sources/fota/FotaAutoDownloadSettings;->mRootView:Landroid/view/View;

    iget-object p1, p0, Lcom/motorola/ccc/ota/sources/fota/FotaAutoDownloadSettings;->settings:Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    sget-object p2, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->METADATA:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    invoke-virtual {p1, p2}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->getString(Lcom/motorola/otalib/common/settings/ISetting;)Ljava/lang/String;

    move-result-object p1

    invoke-static {p1}, Lcom/motorola/otalib/common/metaData/builder/MetaDataBuilder;->from(Ljava/lang/String;)Lcom/motorola/otalib/common/metaData/MetaData;

    move-result-object p1

    iput-object p1, p0, Lcom/motorola/ccc/ota/sources/fota/FotaAutoDownloadSettings;->metaData:Lcom/motorola/otalib/common/metaData/MetaData;

    invoke-virtual {p0}, Lcom/motorola/ccc/ota/sources/fota/FotaAutoDownloadSettings;->getDialog()Landroid/app/Dialog;

    move-result-object p1

    invoke-static {p1}, Lcom/motorola/ccc/ota/ui/UpdaterUtils;->setNavBarColorFromDialog(Landroid/app/Dialog;)V

    invoke-virtual {p0}, Lcom/motorola/ccc/ota/sources/fota/FotaAutoDownloadSettings;->getDialog()Landroid/app/Dialog;

    move-result-object p1

    invoke-virtual {p1}, Landroid/app/Dialog;->getWindow()Landroid/view/Window;

    move-result-object p1

    invoke-virtual {p1, v0}, Landroid/view/Window;->setStatusBarColor(I)V

    iget-object p2, p0, Lcom/motorola/ccc/ota/sources/fota/FotaAutoDownloadSettings;->mContext:Landroid/content/Context;

    invoke-static {p2}, Lcom/motorola/ccc/ota/ui/UpdaterUtils;->isBatterySaverEnabled(Landroid/content/Context;)Z

    move-result p2

    if-nez p2, :cond_0

    new-instance p2, Landroidx/core/view/WindowInsetsControllerCompat;

    invoke-virtual {p1}, Landroid/view/Window;->getDecorView()Landroid/view/View;

    move-result-object p3

    invoke-direct {p2, p1, p3}, Landroidx/core/view/WindowInsetsControllerCompat;-><init>(Landroid/view/Window;Landroid/view/View;)V

    iget-object p1, p0, Lcom/motorola/ccc/ota/sources/fota/FotaAutoDownloadSettings;->mContext:Landroid/content/Context;

    const-string p3, "uimode"

    invoke-virtual {p1, p3}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Landroid/app/UiModeManager;

    invoke-virtual {p1}, Landroid/app/UiModeManager;->getNightMode()I

    move-result p1

    const/4 p3, 0x2

    if-eq p1, p3, :cond_0

    const/4 p1, 0x1

    invoke-virtual {p2, p1}, Landroidx/core/view/WindowInsetsControllerCompat;->setAppearanceLightStatusBars(Z)V

    invoke-virtual {p2, p1}, Landroidx/core/view/WindowInsetsControllerCompat;->setAppearanceLightNavigationBars(Z)V

    :cond_0
    invoke-direct {p0}, Lcom/motorola/ccc/ota/sources/fota/FotaAutoDownloadSettings;->findViewsById()V

    invoke-direct {p0}, Lcom/motorola/ccc/ota/sources/fota/FotaAutoDownloadSettings;->handleListeners()V

    iget-object p0, p0, Lcom/motorola/ccc/ota/sources/fota/FotaAutoDownloadSettings;->mRootView:Landroid/view/View;

    return-object p0
.end method

.method public onResume()V
    .locals 0

    invoke-super {p0}, Landroidx/fragment/app/DialogFragment;->onResume()V

    invoke-direct {p0}, Lcom/motorola/ccc/ota/sources/fota/FotaAutoDownloadSettings;->initUI()V

    return-void
.end method
