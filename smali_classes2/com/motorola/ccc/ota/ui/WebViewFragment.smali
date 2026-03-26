.class public Lcom/motorola/ccc/ota/ui/WebViewFragment;
.super Landroidx/fragment/app/DialogFragment;
.source "WebViewFragment.java"

# interfaces
.implements Lcom/motorola/ccc/ota/utils/SmartUpdateUtils$SmartDialog;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/motorola/ccc/ota/ui/WebViewFragment$ProgressDialogFragment;
    }
.end annotation


# instance fields
.field private handler:Landroid/os/Handler;

.field private mWebview:Landroid/webkit/WebView;

.field private rootView:Landroid/view/View;

.field private webViewBaseFragment:Ljava/lang/String;

.field private webViewURL:Ljava/lang/String;


# direct methods
.method static bridge synthetic -$$Nest$fgethandler(Lcom/motorola/ccc/ota/ui/WebViewFragment;)Landroid/os/Handler;
    .locals 0

    iget-object p0, p0, Lcom/motorola/ccc/ota/ui/WebViewFragment;->handler:Landroid/os/Handler;

    return-object p0
.end method

.method static bridge synthetic -$$Nest$fgetmWebview(Lcom/motorola/ccc/ota/ui/WebViewFragment;)Landroid/webkit/WebView;
    .locals 0

    iget-object p0, p0, Lcom/motorola/ccc/ota/ui/WebViewFragment;->mWebview:Landroid/webkit/WebView;

    return-object p0
.end method

.method static bridge synthetic -$$Nest$mdismissProgressBar(Lcom/motorola/ccc/ota/ui/WebViewFragment;)V
    .locals 0

    invoke-direct {p0}, Lcom/motorola/ccc/ota/ui/WebViewFragment;->dismissProgressBar()V

    return-void
.end method

.method static bridge synthetic -$$Nest$mshowProgressBar(Lcom/motorola/ccc/ota/ui/WebViewFragment;)V
    .locals 0

    invoke-direct {p0}, Lcom/motorola/ccc/ota/ui/WebViewFragment;->showProgressBar()V

    return-void
.end method

.method static bridge synthetic -$$Nest$mwebViewGoBack(Lcom/motorola/ccc/ota/ui/WebViewFragment;)V
    .locals 0

    invoke-direct {p0}, Lcom/motorola/ccc/ota/ui/WebViewFragment;->webViewGoBack()V

    return-void
.end method

.method public constructor <init>()V
    .locals 1

    invoke-direct {p0}, Landroidx/fragment/app/DialogFragment;-><init>()V

    new-instance v0, Lcom/motorola/ccc/ota/ui/WebViewFragment$1;

    invoke-direct {v0, p0}, Lcom/motorola/ccc/ota/ui/WebViewFragment$1;-><init>(Lcom/motorola/ccc/ota/ui/WebViewFragment;)V

    iput-object v0, p0, Lcom/motorola/ccc/ota/ui/WebViewFragment;->handler:Landroid/os/Handler;

    return-void
.end method

.method private collectStats()V
    .locals 3

    new-instance v0, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    invoke-direct {v0}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;-><init>()V

    iget-object v1, p0, Lcom/motorola/ccc/ota/ui/WebViewFragment;->webViewBaseFragment:Ljava/lang/String;

    invoke-virtual {v1}, Ljava/lang/String;->hashCode()I

    const-string v2, "whyUpdateMatters"

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_0

    sget-object v1, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->STATS_OS_LINK_LAUNCH_SCREEN:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    invoke-virtual {v0, v1}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->getString(Lcom/motorola/otalib/common/settings/ISetting;)Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    if-eqz v1, :cond_1

    sget-object v1, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->STATS_OS_LINK_LAUNCH_SCREEN:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    iget-object p0, p0, Lcom/motorola/ccc/ota/ui/WebViewFragment;->webViewBaseFragment:Ljava/lang/String;

    invoke-virtual {v0, v1, p0}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->setString(Lcom/motorola/otalib/common/settings/ISetting;Ljava/lang/String;)V

    goto :goto_0

    :cond_0
    sget-object p0, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->WHY_UPDATE_MATTERS_OS_LINK_COUNT:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    invoke-virtual {v0, p0}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->incrementPrefs(Lcom/motorola/otalib/common/settings/ISetting;)V

    :cond_1
    :goto_0
    return-void
.end method

.method private dismissProgressBar()V
    .locals 1

    invoke-virtual {p0}, Lcom/motorola/ccc/ota/ui/WebViewFragment;->getActivity()Landroidx/fragment/app/FragmentActivity;

    move-result-object p0

    if-nez p0, :cond_0

    return-void

    :cond_0
    invoke-virtual {p0}, Landroidx/fragment/app/FragmentActivity;->getSupportFragmentManager()Landroidx/fragment/app/FragmentManager;

    move-result-object p0

    const-string v0, "progressdialog"

    invoke-virtual {p0, v0}, Landroidx/fragment/app/FragmentManager;->findFragmentByTag(Ljava/lang/String;)Landroidx/fragment/app/Fragment;

    move-result-object p0

    if-eqz p0, :cond_1

    check-cast p0, Lcom/motorola/ccc/ota/ui/WebViewFragment$ProgressDialogFragment;

    invoke-virtual {p0}, Lcom/motorola/ccc/ota/ui/WebViewFragment$ProgressDialogFragment;->dismissAllowingStateLoss()V

    :cond_1
    return-void
.end method

.method private fillWebViewParameters()V
    .locals 2

    iget-object v0, p0, Lcom/motorola/ccc/ota/ui/WebViewFragment;->mWebview:Landroid/webkit/WebView;

    invoke-virtual {v0}, Landroid/webkit/WebView;->getSettings()Landroid/webkit/WebSettings;

    move-result-object v0

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Landroid/webkit/WebSettings;->setJavaScriptEnabled(Z)V

    iget-object v0, p0, Lcom/motorola/ccc/ota/ui/WebViewFragment;->mWebview:Landroid/webkit/WebView;

    invoke-virtual {v0}, Landroid/webkit/WebView;->getSettings()Landroid/webkit/WebSettings;

    move-result-object v0

    invoke-virtual {v0, v1}, Landroid/webkit/WebSettings;->setBuiltInZoomControls(Z)V

    iget-object v0, p0, Lcom/motorola/ccc/ota/ui/WebViewFragment;->mWebview:Landroid/webkit/WebView;

    invoke-virtual {v0}, Landroid/webkit/WebView;->getSettings()Landroid/webkit/WebSettings;

    move-result-object v0

    invoke-virtual {v0}, Landroid/webkit/WebSettings;->supportZoom()Z

    iget-object v0, p0, Lcom/motorola/ccc/ota/ui/WebViewFragment;->mWebview:Landroid/webkit/WebView;

    invoke-virtual {v0}, Landroid/webkit/WebView;->getSettings()Landroid/webkit/WebSettings;

    move-result-object v0

    invoke-virtual {v0, v1}, Landroid/webkit/WebSettings;->setLoadWithOverviewMode(Z)V

    iget-object v0, p0, Lcom/motorola/ccc/ota/ui/WebViewFragment;->mWebview:Landroid/webkit/WebView;

    invoke-virtual {v0}, Landroid/webkit/WebView;->getSettings()Landroid/webkit/WebSettings;

    move-result-object v0

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/webkit/WebSettings;->setMediaPlaybackRequiresUserGesture(Z)V

    iget-object v0, p0, Lcom/motorola/ccc/ota/ui/WebViewFragment;->mWebview:Landroid/webkit/WebView;

    new-instance v1, Lcom/motorola/ccc/ota/ui/WebViewFragment$3;

    invoke-direct {v1, p0}, Lcom/motorola/ccc/ota/ui/WebViewFragment$3;-><init>(Lcom/motorola/ccc/ota/ui/WebViewFragment;)V

    invoke-virtual {v0, v1}, Landroid/webkit/WebView;->setWebViewClient(Landroid/webkit/WebViewClient;)V

    return-void
.end method

.method private findViewsById()V
    .locals 2

    iget-object v0, p0, Lcom/motorola/ccc/ota/ui/WebViewFragment;->rootView:Landroid/view/View;

    const v1, 0x7f0900d9

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/webkit/WebView;

    iput-object v0, p0, Lcom/motorola/ccc/ota/ui/WebViewFragment;->mWebview:Landroid/webkit/WebView;

    invoke-direct {p0}, Lcom/motorola/ccc/ota/ui/WebViewFragment;->fillWebViewParameters()V

    return-void
.end method

.method private showProgressBar()V
    .locals 3

    invoke-virtual {p0}, Lcom/motorola/ccc/ota/ui/WebViewFragment;->getActivity()Landroidx/fragment/app/FragmentActivity;

    move-result-object v0

    invoke-virtual {p0}, Lcom/motorola/ccc/ota/ui/WebViewFragment;->isRemoving()Z

    move-result v1

    if-nez v1, :cond_3

    invoke-virtual {p0}, Lcom/motorola/ccc/ota/ui/WebViewFragment;->isDetached()Z

    move-result p0

    if-eqz p0, :cond_0

    goto :goto_0

    :cond_0
    if-nez v0, :cond_1

    return-void

    :cond_1
    invoke-virtual {v0}, Landroidx/fragment/app/FragmentActivity;->getSupportFragmentManager()Landroidx/fragment/app/FragmentManager;

    move-result-object p0

    const-string v1, "progressdialog"

    invoke-virtual {p0, v1}, Landroidx/fragment/app/FragmentManager;->findFragmentByTag(Ljava/lang/String;)Landroidx/fragment/app/Fragment;

    move-result-object p0

    if-eqz p0, :cond_2

    return-void

    :cond_2
    new-instance p0, Lcom/motorola/ccc/ota/ui/WebViewFragment$ProgressDialogFragment;

    invoke-direct {p0}, Lcom/motorola/ccc/ota/ui/WebViewFragment$ProgressDialogFragment;-><init>()V

    const/4 v2, 0x1

    invoke-virtual {p0, v2}, Landroidx/fragment/app/DialogFragment;->setCancelable(Z)V

    invoke-virtual {v0}, Landroidx/fragment/app/FragmentActivity;->getSupportFragmentManager()Landroidx/fragment/app/FragmentManager;

    move-result-object v0

    invoke-virtual {v0}, Landroidx/fragment/app/FragmentManager;->beginTransaction()Landroidx/fragment/app/FragmentTransaction;

    move-result-object v0

    invoke-virtual {v0, p0, v1}, Landroidx/fragment/app/FragmentTransaction;->add(Landroidx/fragment/app/Fragment;Ljava/lang/String;)Landroidx/fragment/app/FragmentTransaction;

    invoke-virtual {v0}, Landroidx/fragment/app/FragmentTransaction;->commitAllowingStateLoss()I

    :cond_3
    :goto_0
    return-void
.end method

.method private webViewGoBack()V
    .locals 0

    iget-object p0, p0, Lcom/motorola/ccc/ota/ui/WebViewFragment;->mWebview:Landroid/webkit/WebView;

    invoke-virtual {p0}, Landroid/webkit/WebView;->goBack()V

    return-void
.end method


# virtual methods
.method public dismissSmartDialog()V
    .locals 0

    invoke-virtual {p0}, Lcom/motorola/ccc/ota/ui/WebViewFragment;->dismiss()V

    return-void
.end method

.method public onAttach(Landroid/content/Context;)V
    .locals 0

    invoke-super {p0, p1}, Landroidx/fragment/app/DialogFragment;->onAttach(Landroid/content/Context;)V

    return-void
.end method

.method public onCreate(Landroid/os/Bundle;)V
    .locals 1

    invoke-super {p0, p1}, Landroidx/fragment/app/DialogFragment;->onCreate(Landroid/os/Bundle;)V

    const/4 p1, 0x0

    const v0, 0x7f0f00ca

    invoke-virtual {p0, p1, v0}, Lcom/motorola/ccc/ota/ui/WebViewFragment;->setStyle(II)V

    invoke-virtual {p0}, Lcom/motorola/ccc/ota/ui/WebViewFragment;->getArguments()Landroid/os/Bundle;

    move-result-object p1

    if-eqz p1, :cond_0

    const-string v0, "webViewURL"

    invoke-virtual {p1, v0}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/motorola/ccc/ota/ui/WebViewFragment;->webViewURL:Ljava/lang/String;

    const-string v0, "webViewBaseFragmentStats"

    invoke-virtual {p1, v0}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    iput-object p1, p0, Lcom/motorola/ccc/ota/ui/WebViewFragment;->webViewBaseFragment:Ljava/lang/String;

    :cond_0
    invoke-direct {p0}, Lcom/motorola/ccc/ota/ui/WebViewFragment;->collectStats()V

    return-void
.end method

.method public onCreateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;Landroid/os/Bundle;)Landroid/view/View;
    .locals 2

    const v0, 0x7f0c00a8

    const/4 v1, 0x0

    invoke-virtual {p1, v0, p2, v1}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object p1

    iput-object p1, p0, Lcom/motorola/ccc/ota/ui/WebViewFragment;->rootView:Landroid/view/View;

    invoke-direct {p0}, Lcom/motorola/ccc/ota/ui/WebViewFragment;->findViewsById()V

    if-eqz p3, :cond_0

    iget-object p1, p0, Lcom/motorola/ccc/ota/ui/WebViewFragment;->mWebview:Landroid/webkit/WebView;

    invoke-virtual {p1, p3}, Landroid/webkit/WebView;->restoreState(Landroid/os/Bundle;)Landroid/webkit/WebBackForwardList;

    goto :goto_0

    :cond_0
    invoke-direct {p0}, Lcom/motorola/ccc/ota/ui/WebViewFragment;->showProgressBar()V

    iget-object p1, p0, Lcom/motorola/ccc/ota/ui/WebViewFragment;->mWebview:Landroid/webkit/WebView;

    iget-object p2, p0, Lcom/motorola/ccc/ota/ui/WebViewFragment;->webViewURL:Ljava/lang/String;

    invoke-virtual {p1, p2}, Landroid/webkit/WebView;->loadUrl(Ljava/lang/String;)V

    :goto_0
    iget-object p1, p0, Lcom/motorola/ccc/ota/ui/WebViewFragment;->mWebview:Landroid/webkit/WebView;

    new-instance p2, Lcom/motorola/ccc/ota/ui/WebViewFragment$2;

    invoke-direct {p2, p0}, Lcom/motorola/ccc/ota/ui/WebViewFragment$2;-><init>(Lcom/motorola/ccc/ota/ui/WebViewFragment;)V

    invoke-virtual {p1, p2}, Landroid/webkit/WebView;->setOnKeyListener(Landroid/view/View$OnKeyListener;)V

    iget-object p0, p0, Lcom/motorola/ccc/ota/ui/WebViewFragment;->rootView:Landroid/view/View;

    return-object p0
.end method
