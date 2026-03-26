.class public Lcom/motorola/ccc/ota/ui/EOLFragment;
.super Landroidx/fragment/app/Fragment;
.source "EOLFragment.java"


# instance fields
.field private btnCheckNow:Landroid/widget/Button;

.field private imgEOL:Landroid/widget/ImageView;

.field private launchTimeInMillis:J

.field private mActivity:Landroid/app/Activity;

.field private mContext:Landroid/content/Context;

.field private mCouponShown:Z

.field private mEOLAdditionalInfo:Landroid/widget/TextView;

.field private mProgressBar:Landroid/widget/ProgressBar;

.field private mRootView:Landroid/view/View;

.field private mSecurityPatch:Landroid/widget/TextView;

.field private settings:Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;


# direct methods
.method static bridge synthetic -$$Nest$fgetmProgressBar(Lcom/motorola/ccc/ota/ui/EOLFragment;)Landroid/widget/ProgressBar;
    .locals 0

    iget-object p0, p0, Lcom/motorola/ccc/ota/ui/EOLFragment;->mProgressBar:Landroid/widget/ProgressBar;

    return-object p0
.end method

.method static bridge synthetic -$$Nest$msendIntentToWebsite(Lcom/motorola/ccc/ota/ui/EOLFragment;)V
    .locals 0

    invoke-direct {p0}, Lcom/motorola/ccc/ota/ui/EOLFragment;->sendIntentToWebsite()V

    return-void
.end method

.method static bridge synthetic -$$Nest$mshowUptoDateScreen(Lcom/motorola/ccc/ota/ui/EOLFragment;)V
    .locals 0

    invoke-direct {p0}, Lcom/motorola/ccc/ota/ui/EOLFragment;->showUptoDateScreen()V

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

.method private downloadImage(Ljava/lang/String;)V
    .locals 2

    :try_start_0
    invoke-static {p0}, Lcom/bumptech/glide/Glide;->with(Landroidx/fragment/app/Fragment;)Lcom/bumptech/glide/RequestManager;

    move-result-object v0

    invoke-virtual {v0, p1}, Lcom/bumptech/glide/RequestManager;->load(Ljava/lang/String;)Lcom/bumptech/glide/DrawableTypeRequest;

    move-result-object p1

    new-instance v0, Lcom/motorola/ccc/ota/ui/EOLFragment$3;

    invoke-direct {v0, p0}, Lcom/motorola/ccc/ota/ui/EOLFragment$3;-><init>(Lcom/motorola/ccc/ota/ui/EOLFragment;)V

    invoke-virtual {p1, v0}, Lcom/bumptech/glide/DrawableTypeRequest;->listener(Lcom/bumptech/glide/request/RequestListener;)Lcom/bumptech/glide/DrawableRequestBuilder;

    move-result-object p1

    iget-object v0, p0, Lcom/motorola/ccc/ota/ui/EOLFragment;->imgEOL:Landroid/widget/ImageView;

    invoke-virtual {p1, v0}, Lcom/bumptech/glide/DrawableRequestBuilder;->into(Landroid/widget/ImageView;)Lcom/bumptech/glide/request/target/Target;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception p1

    iget-object v0, p0, Lcom/motorola/ccc/ota/ui/EOLFragment;->mProgressBar:Landroid/widget/ProgressBar;

    const/16 v1, 0x8

    invoke-virtual {v0, v1}, Landroid/widget/ProgressBar;->setVisibility(I)V

    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "Glide library exception : "

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    const-string v0, "OtaApp"

    invoke-static {v0, p1}, Lcom/motorola/ccc/ota/utils/Logger;->error(Ljava/lang/String;Ljava/lang/String;)V

    invoke-direct {p0}, Lcom/motorola/ccc/ota/ui/EOLFragment;->showUptoDateScreen()V

    :goto_0
    return-void
.end method

.method private findViewsById()V
    .locals 2

    iget-object v0, p0, Lcom/motorola/ccc/ota/ui/EOLFragment;->mRootView:Landroid/view/View;

    const v1, 0x7f09012e

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/ProgressBar;

    iput-object v0, p0, Lcom/motorola/ccc/ota/ui/EOLFragment;->mProgressBar:Landroid/widget/ProgressBar;

    iget-object v0, p0, Lcom/motorola/ccc/ota/ui/EOLFragment;->mRootView:Landroid/view/View;

    const v1, 0x7f09006e

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/Button;

    iput-object v0, p0, Lcom/motorola/ccc/ota/ui/EOLFragment;->btnCheckNow:Landroid/widget/Button;

    iget-object v0, p0, Lcom/motorola/ccc/ota/ui/EOLFragment;->mRootView:Landroid/view/View;

    const v1, 0x7f0900b5

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/ImageView;

    iput-object v0, p0, Lcom/motorola/ccc/ota/ui/EOLFragment;->imgEOL:Landroid/widget/ImageView;

    iget-object v0, p0, Lcom/motorola/ccc/ota/ui/EOLFragment;->mRootView:Landroid/view/View;

    const v1, 0x7f09015e

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p0, Lcom/motorola/ccc/ota/ui/EOLFragment;->mSecurityPatch:Landroid/widget/TextView;

    iget-object v0, p0, Lcom/motorola/ccc/ota/ui/EOLFragment;->mRootView:Landroid/view/View;

    const v1, 0x7f0900b4

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p0, Lcom/motorola/ccc/ota/ui/EOLFragment;->mEOLAdditionalInfo:Landroid/widget/TextView;

    return-void
.end method

.method private sendIntentToWebsite()V
    .locals 4

    iget-object v0, p0, Lcom/motorola/ccc/ota/ui/EOLFragment;->settings:Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    sget-object v1, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->END_OF_LIFE_PROMO_LINK_URL:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    invoke-virtual {v0, v1}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->getString(Lcom/motorola/otalib/common/settings/ISetting;)Ljava/lang/String;

    move-result-object v0

    new-instance v1, Landroid/content/Intent;

    const-string v2, "android.intent.action.VIEW"

    invoke-direct {v1, v2}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    iget-boolean v2, p0, Lcom/motorola/ccc/ota/ui/EOLFragment;->mCouponShown:Z

    if-eqz v2, :cond_0

    invoke-static {v0}, Landroid/webkit/URLUtil;->isHttpsUrl(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_0

    iget-object v2, p0, Lcom/motorola/ccc/ota/ui/EOLFragment;->settings:Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    sget-object v3, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->PROMOTIONAL_LINK_CLICK_COUNT:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    invoke-virtual {v2, v3}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->incrementPrefs(Lcom/motorola/otalib/common/settings/ISetting;)V

    invoke-static {v0}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v0

    invoke-virtual {v1, v0}, Landroid/content/Intent;->setData(Landroid/net/Uri;)Landroid/content/Intent;

    goto :goto_0

    :cond_0
    iget-object v0, p0, Lcom/motorola/ccc/ota/ui/EOLFragment;->settings:Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    sget-object v2, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->NON_PROMOTIONAL_LINK_CLICK_COUNT:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    invoke-virtual {v0, v2}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->incrementPrefs(Lcom/motorola/otalib/common/settings/ISetting;)V

    const-string v0, "https://www.motorola.com"

    invoke-static {v0}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v0

    invoke-virtual {v1, v0}, Landroid/content/Intent;->setData(Landroid/net/Uri;)Landroid/content/Intent;

    :goto_0
    invoke-virtual {p0, v1}, Lcom/motorola/ccc/ota/ui/EOLFragment;->startActivity(Landroid/content/Intent;)V

    return-void
.end method

.method private showUptoDateScreen()V
    .locals 2

    invoke-virtual {p0}, Lcom/motorola/ccc/ota/ui/EOLFragment;->getFragmentManager()Landroidx/fragment/app/FragmentManager;

    move-result-object p0

    invoke-virtual {p0}, Landroidx/fragment/app/FragmentManager;->beginTransaction()Landroidx/fragment/app/FragmentTransaction;

    move-result-object p0

    new-instance v0, Lcom/motorola/ccc/ota/ui/UptoDateFragment;

    invoke-direct {v0}, Lcom/motorola/ccc/ota/ui/UptoDateFragment;-><init>()V

    const v1, 0x7f0900c3

    invoke-virtual {p0, v1, v0}, Landroidx/fragment/app/FragmentTransaction;->replace(ILandroidx/fragment/app/Fragment;)Landroidx/fragment/app/FragmentTransaction;

    invoke-virtual {p0}, Landroidx/fragment/app/FragmentTransaction;->commit()I

    return-void
.end method


# virtual methods
.method public onActivityCreated(Landroid/os/Bundle;)V
    .locals 4

    invoke-super {p0, p1}, Landroidx/fragment/app/Fragment;->onActivityCreated(Landroid/os/Bundle;)V

    iget-object p1, p0, Lcom/motorola/ccc/ota/ui/EOLFragment;->mSecurityPatch:Landroid/widget/TextView;

    invoke-virtual {p0}, Lcom/motorola/ccc/ota/ui/EOLFragment;->getContext()Landroid/content/Context;

    move-result-object v0

    const v1, 0x7f0e00d8

    invoke-virtual {v0, v1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v0

    invoke-static {}, Lcom/motorola/ccc/ota/utils/DateFormatUtils;->getSecurityPatch()Ljava/lang/String;

    move-result-object v1

    invoke-direct {p0, p1, v0, v1}, Lcom/motorola/ccc/ota/ui/EOLFragment;->checkAndDisplayText(Landroid/widget/TextView;Ljava/lang/String;Ljava/lang/String;)V

    iget-object p1, p0, Lcom/motorola/ccc/ota/ui/EOLFragment;->settings:Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    sget-object v0, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->END_OF_LIFE_ADDITIONAL_INFO:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    invoke-virtual {p1, v0}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->getString(Lcom/motorola/otalib/common/settings/ISetting;)Ljava/lang/String;

    move-result-object p1

    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result p1

    if-nez p1, :cond_0

    iget-object p1, p0, Lcom/motorola/ccc/ota/ui/EOLFragment;->mEOLAdditionalInfo:Landroid/widget/TextView;

    iget-object v0, p0, Lcom/motorola/ccc/ota/ui/EOLFragment;->settings:Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    sget-object v1, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->END_OF_LIFE_ADDITIONAL_INFO:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    invoke-virtual {v0, v1}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->getString(Lcom/motorola/otalib/common/settings/ISetting;)Ljava/lang/String;

    move-result-object v0

    new-instance v1, Lcom/motorola/ccc/ota/ui/HtmlUtils;

    iget-object v2, p0, Lcom/motorola/ccc/ota/ui/EOLFragment;->settings:Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    sget-object v3, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->END_OF_LIFE_ADDITIONAL_INFO:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    invoke-virtual {v2, v3}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->getString(Lcom/motorola/otalib/common/settings/ISetting;)Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Lcom/motorola/ccc/ota/ui/HtmlUtils;-><init>(Ljava/lang/String;)V

    const/4 v2, 0x0

    const/4 v3, 0x0

    invoke-static {v0, v2, v3, v1}, Landroid/text/Html;->fromHtml(Ljava/lang/String;ILandroid/text/Html$ImageGetter;Landroid/text/Html$TagHandler;)Landroid/text/Spanned;

    move-result-object v0

    invoke-virtual {p1, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    goto :goto_0

    :cond_0
    iget-object p1, p0, Lcom/motorola/ccc/ota/ui/EOLFragment;->mEOLAdditionalInfo:Landroid/widget/TextView;

    const/16 v0, 0x8

    invoke-virtual {p1, v0}, Landroid/widget/TextView;->setVisibility(I)V

    :goto_0
    iget-object p1, p0, Lcom/motorola/ccc/ota/ui/EOLFragment;->settings:Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    sget-object v0, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->END_OF_LIFE_PROMO_IMAGE_URL:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    invoke-virtual {p1, v0}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->getString(Lcom/motorola/otalib/common/settings/ISetting;)Ljava/lang/String;

    move-result-object p1

    invoke-static {p1}, Landroid/webkit/URLUtil;->isHttpsUrl(Ljava/lang/String;)Z

    move-result p1

    if-eqz p1, :cond_1

    const/4 p1, 0x1

    iput-boolean p1, p0, Lcom/motorola/ccc/ota/ui/EOLFragment;->mCouponShown:Z

    iget-object p1, p0, Lcom/motorola/ccc/ota/ui/EOLFragment;->btnCheckNow:Landroid/widget/Button;

    invoke-virtual {p0}, Lcom/motorola/ccc/ota/ui/EOLFragment;->getContext()Landroid/content/Context;

    move-result-object v0

    const v1, 0x7f0e00d9

    invoke-virtual {v0, v1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1, v0}, Landroid/widget/Button;->setText(Ljava/lang/CharSequence;)V

    iget-object p1, p0, Lcom/motorola/ccc/ota/ui/EOLFragment;->settings:Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    sget-object v0, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->END_OF_LIFE_PROMO_IMAGE_URL:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    invoke-virtual {p1, v0}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->getString(Lcom/motorola/otalib/common/settings/ISetting;)Ljava/lang/String;

    move-result-object p1

    invoke-direct {p0, p1}, Lcom/motorola/ccc/ota/ui/EOLFragment;->downloadImage(Ljava/lang/String;)V

    goto :goto_1

    :cond_1
    iget-object p1, p0, Lcom/motorola/ccc/ota/ui/EOLFragment;->btnCheckNow:Landroid/widget/Button;

    invoke-virtual {p0}, Lcom/motorola/ccc/ota/ui/EOLFragment;->getContext()Landroid/content/Context;

    move-result-object v0

    const v1, 0x7f0e00d7

    invoke-virtual {v0, v1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1, v0}, Landroid/widget/Button;->setText(Ljava/lang/CharSequence;)V

    iget-object p1, p0, Lcom/motorola/ccc/ota/ui/EOLFragment;->settings:Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    sget-object v0, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->END_OF_LIFE_MAIN_IMAGE_URL:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    invoke-virtual {p1, v0}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->getString(Lcom/motorola/otalib/common/settings/ISetting;)Ljava/lang/String;

    move-result-object p1

    invoke-direct {p0, p1}, Lcom/motorola/ccc/ota/ui/EOLFragment;->downloadImage(Ljava/lang/String;)V

    :goto_1
    iget-object p1, p0, Lcom/motorola/ccc/ota/ui/EOLFragment;->imgEOL:Landroid/widget/ImageView;

    new-instance v0, Lcom/motorola/ccc/ota/ui/EOLFragment$1;

    invoke-direct {v0, p0}, Lcom/motorola/ccc/ota/ui/EOLFragment$1;-><init>(Lcom/motorola/ccc/ota/ui/EOLFragment;)V

    invoke-virtual {p1, v0}, Landroid/widget/ImageView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    iget-object p1, p0, Lcom/motorola/ccc/ota/ui/EOLFragment;->btnCheckNow:Landroid/widget/Button;

    new-instance v0, Lcom/motorola/ccc/ota/ui/EOLFragment$2;

    invoke-direct {v0, p0}, Lcom/motorola/ccc/ota/ui/EOLFragment$2;-><init>(Lcom/motorola/ccc/ota/ui/EOLFragment;)V

    invoke-virtual {p1, v0}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    return-void
.end method

.method public onAttach(Landroid/content/Context;)V
    .locals 1

    invoke-super {p0, p1}, Landroidx/fragment/app/Fragment;->onAttach(Landroid/content/Context;)V

    iput-object p1, p0, Lcom/motorola/ccc/ota/ui/EOLFragment;->mContext:Landroid/content/Context;

    instance-of v0, p1, Landroid/app/Activity;

    if-eqz v0, :cond_0

    check-cast p1, Landroid/app/Activity;

    iput-object p1, p0, Lcom/motorola/ccc/ota/ui/EOLFragment;->mActivity:Landroid/app/Activity;

    :cond_0
    return-void
.end method

.method public onCreate(Landroid/os/Bundle;)V
    .locals 0

    invoke-super {p0, p1}, Landroidx/fragment/app/Fragment;->onCreate(Landroid/os/Bundle;)V

    new-instance p1, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    invoke-direct {p1}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;-><init>()V

    iput-object p1, p0, Lcom/motorola/ccc/ota/ui/EOLFragment;->settings:Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    return-void
.end method

.method public onCreateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;Landroid/os/Bundle;)Landroid/view/View;
    .locals 1

    const p3, 0x7f0c0037

    const/4 v0, 0x0

    invoke-virtual {p1, p3, p2, v0}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object p1

    iput-object p1, p0, Lcom/motorola/ccc/ota/ui/EOLFragment;->mRootView:Landroid/view/View;

    invoke-direct {p0}, Lcom/motorola/ccc/ota/ui/EOLFragment;->findViewsById()V

    iget-object p1, p0, Lcom/motorola/ccc/ota/ui/EOLFragment;->settings:Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    sget-object p2, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->EOL_VISIT_COUNT:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    invoke-virtual {p1, p2}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->incrementPrefs(Lcom/motorola/otalib/common/settings/ISetting;)V

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide p1

    iput-wide p1, p0, Lcom/motorola/ccc/ota/ui/EOLFragment;->launchTimeInMillis:J

    iget-object p0, p0, Lcom/motorola/ccc/ota/ui/EOLFragment;->mRootView:Landroid/view/View;

    return-object p0
.end method

.method public onStop()V
    .locals 8

    invoke-super {p0}, Landroidx/fragment/app/Fragment;->onStop()V

    iget-object v0, p0, Lcom/motorola/ccc/ota/ui/EOLFragment;->settings:Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    sget-object v1, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->TOTAL_TIME_SPEND_ON_EOL_SCREEN:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    iget-object v2, p0, Lcom/motorola/ccc/ota/ui/EOLFragment;->settings:Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    sget-object v3, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->TOTAL_TIME_SPEND_ON_EOL_SCREEN:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    const-wide/16 v4, 0x0

    invoke-virtual {v2, v3, v4, v5}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->getLong(Lcom/motorola/otalib/common/settings/ISetting;J)J

    move-result-wide v2

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v4

    iget-wide v6, p0, Lcom/motorola/ccc/ota/ui/EOLFragment;->launchTimeInMillis:J

    sub-long/2addr v4, v6

    add-long/2addr v2, v4

    invoke-virtual {v0, v1, v2, v3}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->setLong(Lcom/motorola/otalib/common/settings/ISetting;J)V

    return-void
.end method
