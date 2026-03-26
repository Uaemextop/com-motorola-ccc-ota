.class public Lcom/motorola/ccc/ota/ui/AdvNoticeFragment;
.super Landroidx/fragment/app/Fragment;
.source "AdvNoticeFragment.java"


# instance fields
.field private btnDone:Landroid/widget/Button;

.field private imgAdvance:Landroid/widget/ImageView;

.field private mActivity:Landroid/app/Activity;

.field private mContext:Landroid/content/Context;

.field private mProgressBar:Landroid/widget/ProgressBar;

.field private mRootView:Landroid/view/View;

.field private settings:Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;


# direct methods
.method static bridge synthetic -$$Nest$fgetbtnDone(Lcom/motorola/ccc/ota/ui/AdvNoticeFragment;)Landroid/widget/Button;
    .locals 0

    iget-object p0, p0, Lcom/motorola/ccc/ota/ui/AdvNoticeFragment;->btnDone:Landroid/widget/Button;

    return-object p0
.end method

.method static bridge synthetic -$$Nest$fgetmProgressBar(Lcom/motorola/ccc/ota/ui/AdvNoticeFragment;)Landroid/widget/ProgressBar;
    .locals 0

    iget-object p0, p0, Lcom/motorola/ccc/ota/ui/AdvNoticeFragment;->mProgressBar:Landroid/widget/ProgressBar;

    return-object p0
.end method

.method static bridge synthetic -$$Nest$mshowUptoDateScreen(Lcom/motorola/ccc/ota/ui/AdvNoticeFragment;)V
    .locals 0

    invoke-direct {p0}, Lcom/motorola/ccc/ota/ui/AdvNoticeFragment;->showUptoDateScreen()V

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    invoke-direct {p0}, Landroidx/fragment/app/Fragment;-><init>()V

    return-void
.end method

.method private downloadImage()V
    .locals 3

    :try_start_0
    invoke-static {p0}, Lcom/bumptech/glide/Glide;->with(Landroidx/fragment/app/Fragment;)Lcom/bumptech/glide/RequestManager;

    move-result-object v0

    iget-object v1, p0, Lcom/motorola/ccc/ota/ui/AdvNoticeFragment;->settings:Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    sget-object v2, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->ADVANCE_NOTICE_URL:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    invoke-virtual {v1, v2}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->getString(Lcom/motorola/otalib/common/settings/ISetting;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/bumptech/glide/RequestManager;->load(Ljava/lang/String;)Lcom/bumptech/glide/DrawableTypeRequest;

    move-result-object v0

    new-instance v1, Lcom/motorola/ccc/ota/ui/AdvNoticeFragment$1;

    invoke-direct {v1, p0}, Lcom/motorola/ccc/ota/ui/AdvNoticeFragment$1;-><init>(Lcom/motorola/ccc/ota/ui/AdvNoticeFragment;)V

    invoke-virtual {v0, v1}, Lcom/bumptech/glide/DrawableTypeRequest;->listener(Lcom/bumptech/glide/request/RequestListener;)Lcom/bumptech/glide/DrawableRequestBuilder;

    move-result-object v0

    iget-object v1, p0, Lcom/motorola/ccc/ota/ui/AdvNoticeFragment;->imgAdvance:Landroid/widget/ImageView;

    invoke-virtual {v0, v1}, Lcom/bumptech/glide/DrawableRequestBuilder;->into(Landroid/widget/ImageView;)Lcom/bumptech/glide/request/target/Target;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception v0

    iget-object v1, p0, Lcom/motorola/ccc/ota/ui/AdvNoticeFragment;->mProgressBar:Landroid/widget/ProgressBar;

    const/16 v2, 0x8

    invoke-virtual {v1, v2}, Landroid/widget/ProgressBar;->setVisibility(I)V

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "Glide library exception : "

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    const-string v1, "OtaApp"

    invoke-static {v1, v0}, Lcom/motorola/ccc/ota/utils/Logger;->error(Ljava/lang/String;Ljava/lang/String;)V

    invoke-direct {p0}, Lcom/motorola/ccc/ota/ui/AdvNoticeFragment;->showUptoDateScreen()V

    :goto_0
    return-void
.end method

.method private findViewsById()V
    .locals 2

    iget-object v0, p0, Lcom/motorola/ccc/ota/ui/AdvNoticeFragment;->mRootView:Landroid/view/View;

    const v1, 0x7f09012e

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/ProgressBar;

    iput-object v0, p0, Lcom/motorola/ccc/ota/ui/AdvNoticeFragment;->mProgressBar:Landroid/widget/ProgressBar;

    iget-object v0, p0, Lcom/motorola/ccc/ota/ui/AdvNoticeFragment;->mRootView:Landroid/view/View;

    const v1, 0x7f090057

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/Button;

    iput-object v0, p0, Lcom/motorola/ccc/ota/ui/AdvNoticeFragment;->btnDone:Landroid/widget/Button;

    iget-object v0, p0, Lcom/motorola/ccc/ota/ui/AdvNoticeFragment;->mRootView:Landroid/view/View;

    const v1, 0x7f0900df

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/ImageView;

    iput-object v0, p0, Lcom/motorola/ccc/ota/ui/AdvNoticeFragment;->imgAdvance:Landroid/widget/ImageView;

    return-void
.end method

.method private showUptoDateScreen()V
    .locals 2

    invoke-virtual {p0}, Lcom/motorola/ccc/ota/ui/AdvNoticeFragment;->getFragmentManager()Landroidx/fragment/app/FragmentManager;

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
.method synthetic lambda$onActivityCreated$0$com-motorola-ccc-ota-ui-AdvNoticeFragment(Landroid/view/View;)V
    .locals 0

    iget-object p0, p0, Lcom/motorola/ccc/ota/ui/AdvNoticeFragment;->mActivity:Landroid/app/Activity;

    invoke-virtual {p0}, Landroid/app/Activity;->finish()V

    return-void
.end method

.method public onActivityCreated(Landroid/os/Bundle;)V
    .locals 1

    invoke-super {p0, p1}, Landroidx/fragment/app/Fragment;->onActivityCreated(Landroid/os/Bundle;)V

    invoke-direct {p0}, Lcom/motorola/ccc/ota/ui/AdvNoticeFragment;->downloadImage()V

    iget-object p1, p0, Lcom/motorola/ccc/ota/ui/AdvNoticeFragment;->btnDone:Landroid/widget/Button;

    new-instance v0, Lcom/motorola/ccc/ota/ui/AdvNoticeFragment$$ExternalSyntheticLambda0;

    invoke-direct {v0, p0}, Lcom/motorola/ccc/ota/ui/AdvNoticeFragment$$ExternalSyntheticLambda0;-><init>(Lcom/motorola/ccc/ota/ui/AdvNoticeFragment;)V

    invoke-virtual {p1, v0}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    return-void
.end method

.method public onAttach(Landroid/content/Context;)V
    .locals 1

    invoke-super {p0, p1}, Landroidx/fragment/app/Fragment;->onAttach(Landroid/content/Context;)V

    iput-object p1, p0, Lcom/motorola/ccc/ota/ui/AdvNoticeFragment;->mContext:Landroid/content/Context;

    instance-of v0, p1, Landroid/app/Activity;

    if-eqz v0, :cond_0

    check-cast p1, Landroid/app/Activity;

    iput-object p1, p0, Lcom/motorola/ccc/ota/ui/AdvNoticeFragment;->mActivity:Landroid/app/Activity;

    :cond_0
    return-void
.end method

.method public onCreate(Landroid/os/Bundle;)V
    .locals 0

    invoke-super {p0, p1}, Landroidx/fragment/app/Fragment;->onCreate(Landroid/os/Bundle;)V

    new-instance p1, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    invoke-direct {p1}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;-><init>()V

    iput-object p1, p0, Lcom/motorola/ccc/ota/ui/AdvNoticeFragment;->settings:Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    return-void
.end method

.method public onCreateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;Landroid/os/Bundle;)Landroid/view/View;
    .locals 1

    const p3, 0x7f0c001c

    const/4 v0, 0x0

    invoke-virtual {p1, p3, p2, v0}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object p1

    iput-object p1, p0, Lcom/motorola/ccc/ota/ui/AdvNoticeFragment;->mRootView:Landroid/view/View;

    invoke-direct {p0}, Lcom/motorola/ccc/ota/ui/AdvNoticeFragment;->findViewsById()V

    iget-object p0, p0, Lcom/motorola/ccc/ota/ui/AdvNoticeFragment;->mRootView:Landroid/view/View;

    return-object p0
.end method
