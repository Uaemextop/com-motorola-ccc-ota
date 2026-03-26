.class public Lcom/motorola/ccc/ota/ui/VitalUpdateFailedFragment;
.super Landroidx/fragment/app/Fragment;
.source "VitalUpdateFailedFragment.java"


# instance fields
.field private mActivity:Landroid/app/Activity;

.field private mDone:Landroid/widget/Button;

.field private mIntent:Landroid/content/Intent;

.field private mRootView:Landroid/view/View;

.field private mUpdateFailedDesc:Landroid/widget/TextView;

.field private mUpdateFailedTitle:Landroid/widget/TextView;


# direct methods
.method static bridge synthetic -$$Nest$fgetmActivity(Lcom/motorola/ccc/ota/ui/VitalUpdateFailedFragment;)Landroid/app/Activity;
    .locals 0

    iget-object p0, p0, Lcom/motorola/ccc/ota/ui/VitalUpdateFailedFragment;->mActivity:Landroid/app/Activity;

    return-object p0
.end method

.method static bridge synthetic -$$Nest$mhandleOnCancelUpdateFragment(Lcom/motorola/ccc/ota/ui/VitalUpdateFailedFragment;)V
    .locals 0

    invoke-direct {p0}, Lcom/motorola/ccc/ota/ui/VitalUpdateFailedFragment;->handleOnCancelUpdateFragment()V

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    invoke-direct {p0}, Landroidx/fragment/app/Fragment;-><init>()V

    return-void
.end method

.method private handleOnCancelUpdateFragment()V
    .locals 0

    iget-object p0, p0, Lcom/motorola/ccc/ota/ui/VitalUpdateFailedFragment;->mActivity:Landroid/app/Activity;

    invoke-virtual {p0}, Landroid/app/Activity;->finish()V

    return-void
.end method


# virtual methods
.method initUI()V
    .locals 3

    const-string v0, "OtaApp"

    const-string v1, "Vital Update Fail Status displayed to user"

    invoke-static {v0, v1}, Lcom/motorola/ccc/ota/utils/Logger;->debug(Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {p0}, Lcom/motorola/ccc/ota/ui/VitalUpdateFailedFragment;->getArguments()Landroid/os/Bundle;

    move-result-object v0

    if-eqz v0, :cond_0

    const-string v1, "activityIntent"

    invoke-virtual {v0, v1}, Landroid/os/Bundle;->getParcelable(Ljava/lang/String;)Landroid/os/Parcelable;

    move-result-object v0

    check-cast v0, Landroid/content/Intent;

    iput-object v0, p0, Lcom/motorola/ccc/ota/ui/VitalUpdateFailedFragment;->mIntent:Landroid/content/Intent;

    :cond_0
    iget-object v0, p0, Lcom/motorola/ccc/ota/ui/VitalUpdateFailedFragment;->mRootView:Landroid/view/View;

    const v1, 0x7f0901fb

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p0, Lcom/motorola/ccc/ota/ui/VitalUpdateFailedFragment;->mUpdateFailedDesc:Landroid/widget/TextView;

    iget-object v0, p0, Lcom/motorola/ccc/ota/ui/VitalUpdateFailedFragment;->mRootView:Landroid/view/View;

    const v1, 0x7f0901fc

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p0, Lcom/motorola/ccc/ota/ui/VitalUpdateFailedFragment;->mUpdateFailedTitle:Landroid/widget/TextView;

    iget-object v0, p0, Lcom/motorola/ccc/ota/ui/VitalUpdateFailedFragment;->mRootView:Landroid/view/View;

    const v1, 0x7f090061

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/Button;

    iput-object v0, p0, Lcom/motorola/ccc/ota/ui/VitalUpdateFailedFragment;->mDone:Landroid/widget/Button;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/widget/Button;->setVisibility(I)V

    iget-object v0, p0, Lcom/motorola/ccc/ota/ui/VitalUpdateFailedFragment;->mUpdateFailedDesc:Landroid/widget/TextView;

    invoke-virtual {p0}, Lcom/motorola/ccc/ota/ui/VitalUpdateFailedFragment;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    const v2, 0x7f0e01f6

    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    iget-object v0, p0, Lcom/motorola/ccc/ota/ui/VitalUpdateFailedFragment;->mUpdateFailedTitle:Landroid/widget/TextView;

    invoke-virtual {p0}, Lcom/motorola/ccc/ota/ui/VitalUpdateFailedFragment;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    const v2, 0x7f0e01d4

    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    iget-object v0, p0, Lcom/motorola/ccc/ota/ui/VitalUpdateFailedFragment;->mDone:Landroid/widget/Button;

    invoke-virtual {p0}, Lcom/motorola/ccc/ota/ui/VitalUpdateFailedFragment;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    const v2, 0x7f0e002d

    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/Button;->setText(Ljava/lang/CharSequence;)V

    iget-object v0, p0, Lcom/motorola/ccc/ota/ui/VitalUpdateFailedFragment;->mDone:Landroid/widget/Button;

    new-instance v1, Lcom/motorola/ccc/ota/ui/VitalUpdateFailedFragment$2;

    invoke-direct {v1, p0}, Lcom/motorola/ccc/ota/ui/VitalUpdateFailedFragment$2;-><init>(Lcom/motorola/ccc/ota/ui/VitalUpdateFailedFragment;)V

    invoke-virtual {v0, v1}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    return-void
.end method

.method public onActivityCreated(Landroid/os/Bundle;)V
    .locals 0

    invoke-super {p0, p1}, Landroidx/fragment/app/Fragment;->onActivityCreated(Landroid/os/Bundle;)V

    invoke-virtual {p0}, Lcom/motorola/ccc/ota/ui/VitalUpdateFailedFragment;->getResources()Landroid/content/res/Resources;

    return-void
.end method

.method public onAttach(Landroid/content/Context;)V
    .locals 1

    invoke-super {p0, p1}, Landroidx/fragment/app/Fragment;->onAttach(Landroid/content/Context;)V

    instance-of v0, p1, Landroid/app/Activity;

    if-eqz v0, :cond_0

    check-cast p1, Landroid/app/Activity;

    iput-object p1, p0, Lcom/motorola/ccc/ota/ui/VitalUpdateFailedFragment;->mActivity:Landroid/app/Activity;

    :cond_0
    return-void
.end method

.method public onCreate(Landroid/os/Bundle;)V
    .locals 1

    invoke-super {p0, p1}, Landroidx/fragment/app/Fragment;->onCreate(Landroid/os/Bundle;)V

    new-instance p1, Lcom/motorola/ccc/ota/ui/VitalUpdateFailedFragment$1;

    const/4 v0, 0x1

    invoke-direct {p1, p0, v0}, Lcom/motorola/ccc/ota/ui/VitalUpdateFailedFragment$1;-><init>(Lcom/motorola/ccc/ota/ui/VitalUpdateFailedFragment;Z)V

    invoke-virtual {p0}, Lcom/motorola/ccc/ota/ui/VitalUpdateFailedFragment;->requireActivity()Landroidx/fragment/app/FragmentActivity;

    move-result-object v0

    invoke-virtual {v0}, Landroidx/fragment/app/FragmentActivity;->getOnBackPressedDispatcher()Landroidx/activity/OnBackPressedDispatcher;

    move-result-object v0

    invoke-virtual {v0, p0, p1}, Landroidx/activity/OnBackPressedDispatcher;->addCallback(Landroidx/lifecycle/LifecycleOwner;Landroidx/activity/OnBackPressedCallback;)V

    return-void
.end method

.method public onCreateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;Landroid/os/Bundle;)Landroid/view/View;
    .locals 1

    const p3, 0x7f0c00a7

    const/4 v0, 0x0

    invoke-virtual {p1, p3, p2, v0}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object p1

    iput-object p1, p0, Lcom/motorola/ccc/ota/ui/VitalUpdateFailedFragment;->mRootView:Landroid/view/View;

    invoke-virtual {p0}, Lcom/motorola/ccc/ota/ui/VitalUpdateFailedFragment;->initUI()V

    iget-object p0, p0, Lcom/motorola/ccc/ota/ui/VitalUpdateFailedFragment;->mRootView:Landroid/view/View;

    return-object p0
.end method

.method public onDestroyView()V
    .locals 1

    iget-object v0, p0, Lcom/motorola/ccc/ota/ui/VitalUpdateFailedFragment;->mActivity:Landroid/app/Activity;

    invoke-virtual {v0}, Landroid/app/Activity;->finish()V

    invoke-super {p0}, Landroidx/fragment/app/Fragment;->onDestroyView()V

    return-void
.end method

.method public onStart()V
    .locals 0

    invoke-super {p0}, Landroidx/fragment/app/Fragment;->onStart()V

    return-void
.end method

.method public onStop()V
    .locals 0

    invoke-super {p0}, Landroidx/fragment/app/Fragment;->onStop()V

    return-void
.end method

.method public onViewCreated(Landroid/view/View;Landroid/os/Bundle;)V
    .locals 0

    invoke-super {p0, p1, p2}, Landroidx/fragment/app/Fragment;->onViewCreated(Landroid/view/View;Landroid/os/Bundle;)V

    return-void
.end method
