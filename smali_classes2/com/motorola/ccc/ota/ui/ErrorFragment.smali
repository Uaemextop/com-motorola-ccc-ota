.class public Lcom/motorola/ccc/ota/ui/ErrorFragment;
.super Landroidx/fragment/app/Fragment;
.source "ErrorFragment.java"


# instance fields
.field private activity:Landroid/app/Activity;

.field private btnRetry:Landroid/widget/Button;

.field private lottieAnimationView:Lcom/airbnb/lottie/LottieAnimationView;

.field private mErrorMsg:Ljava/lang/String;

.field private mErrorTitle:Ljava/lang/String;

.field private mIntent:Landroid/content/Intent;

.field private rootView:Landroid/view/View;

.field private txtBadConnBody:Landroid/widget/TextView;

.field private txtBadConnHeader:Landroid/widget/TextView;


# direct methods
.method static bridge synthetic -$$Nest$fgetactivity(Lcom/motorola/ccc/ota/ui/ErrorFragment;)Landroid/app/Activity;
    .locals 0

    iget-object p0, p0, Lcom/motorola/ccc/ota/ui/ErrorFragment;->activity:Landroid/app/Activity;

    return-object p0
.end method

.method public constructor <init>()V
    .locals 1

    invoke-direct {p0}, Landroidx/fragment/app/Fragment;-><init>()V

    const-string v0, ""

    iput-object v0, p0, Lcom/motorola/ccc/ota/ui/ErrorFragment;->mErrorMsg:Ljava/lang/String;

    iput-object v0, p0, Lcom/motorola/ccc/ota/ui/ErrorFragment;->mErrorTitle:Ljava/lang/String;

    return-void
.end method


# virtual methods
.method public onActivityCreated(Landroid/os/Bundle;)V
    .locals 0

    invoke-super {p0, p1}, Landroidx/fragment/app/Fragment;->onActivityCreated(Landroid/os/Bundle;)V

    return-void
.end method

.method public onAttach(Landroid/content/Context;)V
    .locals 1

    invoke-super {p0, p1}, Landroidx/fragment/app/Fragment;->onAttach(Landroid/content/Context;)V

    instance-of v0, p1, Landroid/app/Activity;

    if-eqz v0, :cond_0

    check-cast p1, Landroid/app/Activity;

    iput-object p1, p0, Lcom/motorola/ccc/ota/ui/ErrorFragment;->activity:Landroid/app/Activity;

    return-void

    :cond_0
    new-instance p0, Ljava/lang/RuntimeException;

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    const-string v0, " must be an instance of Activity"

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-direct {p0, p1}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw p0
.end method

.method public onCreate(Landroid/os/Bundle;)V
    .locals 1

    invoke-super {p0, p1}, Landroidx/fragment/app/Fragment;->onCreate(Landroid/os/Bundle;)V

    invoke-virtual {p0}, Lcom/motorola/ccc/ota/ui/ErrorFragment;->getArguments()Landroid/os/Bundle;

    move-result-object p1

    if-eqz p1, :cond_0

    const-string v0, "activityIntent"

    invoke-virtual {p1, v0}, Landroid/os/Bundle;->getParcelable(Ljava/lang/String;)Landroid/os/Parcelable;

    move-result-object v0

    check-cast v0, Landroid/content/Intent;

    iput-object v0, p0, Lcom/motorola/ccc/ota/ui/ErrorFragment;->mIntent:Landroid/content/Intent;

    const-string v0, "ErrorMessage"

    invoke-virtual {p1, v0}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/motorola/ccc/ota/ui/ErrorFragment;->mErrorMsg:Ljava/lang/String;

    const-string v0, "ErrorTitle"

    invoke-virtual {p1, v0}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    iput-object p1, p0, Lcom/motorola/ccc/ota/ui/ErrorFragment;->mErrorTitle:Ljava/lang/String;

    :cond_0
    return-void
.end method

.method public onCreateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;Landroid/os/Bundle;)Landroid/view/View;
    .locals 1

    const p3, 0x7f0c0038

    const/4 v0, 0x0

    invoke-virtual {p1, p3, p2, v0}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object p1

    iput-object p1, p0, Lcom/motorola/ccc/ota/ui/ErrorFragment;->rootView:Landroid/view/View;

    const p2, 0x7f0901d9

    invoke-virtual {p1, p2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p1

    check-cast p1, Landroid/widget/TextView;

    iput-object p1, p0, Lcom/motorola/ccc/ota/ui/ErrorFragment;->txtBadConnBody:Landroid/widget/TextView;

    new-instance p2, Landroid/text/method/ScrollingMovementMethod;

    invoke-direct {p2}, Landroid/text/method/ScrollingMovementMethod;-><init>()V

    invoke-virtual {p1, p2}, Landroid/widget/TextView;->setMovementMethod(Landroid/text/method/MovementMethod;)V

    iget-object p1, p0, Lcom/motorola/ccc/ota/ui/ErrorFragment;->rootView:Landroid/view/View;

    const p2, 0x7f0901da

    invoke-virtual {p1, p2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p1

    check-cast p1, Landroid/widget/TextView;

    iput-object p1, p0, Lcom/motorola/ccc/ota/ui/ErrorFragment;->txtBadConnHeader:Landroid/widget/TextView;

    iget-object p1, p0, Lcom/motorola/ccc/ota/ui/ErrorFragment;->rootView:Landroid/view/View;

    const p2, 0x7f09005c

    invoke-virtual {p1, p2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p1

    check-cast p1, Landroid/widget/Button;

    iput-object p1, p0, Lcom/motorola/ccc/ota/ui/ErrorFragment;->btnRetry:Landroid/widget/Button;

    iget-object p1, p0, Lcom/motorola/ccc/ota/ui/ErrorFragment;->rootView:Landroid/view/View;

    const p2, 0x7f0900fa

    invoke-virtual {p1, p2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p1

    check-cast p1, Lcom/airbnb/lottie/LottieAnimationView;

    iput-object p1, p0, Lcom/motorola/ccc/ota/ui/ErrorFragment;->lottieAnimationView:Lcom/airbnb/lottie/LottieAnimationView;

    const/4 p2, -0x1

    invoke-virtual {p1, p2}, Lcom/airbnb/lottie/LottieAnimationView;->setRepeatCount(I)V

    iget-object p1, p0, Lcom/motorola/ccc/ota/ui/ErrorFragment;->lottieAnimationView:Lcom/airbnb/lottie/LottieAnimationView;

    const-string p2, "alert_state.json"

    invoke-virtual {p1, p2}, Lcom/airbnb/lottie/LottieAnimationView;->setAnimation(Ljava/lang/String;)V

    iget-object p1, p0, Lcom/motorola/ccc/ota/ui/ErrorFragment;->txtBadConnBody:Landroid/widget/TextView;

    iget-object p2, p0, Lcom/motorola/ccc/ota/ui/ErrorFragment;->mErrorMsg:Ljava/lang/String;

    invoke-virtual {p1, p2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    iget-object p1, p0, Lcom/motorola/ccc/ota/ui/ErrorFragment;->txtBadConnHeader:Landroid/widget/TextView;

    iget-object p2, p0, Lcom/motorola/ccc/ota/ui/ErrorFragment;->mErrorTitle:Ljava/lang/String;

    invoke-virtual {p1, p2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    const p1, 0x7f0e005b

    invoke-virtual {p0, p1}, Lcom/motorola/ccc/ota/ui/ErrorFragment;->getString(I)Ljava/lang/String;

    move-result-object p1

    iget-object p2, p0, Lcom/motorola/ccc/ota/ui/ErrorFragment;->mErrorTitle:Ljava/lang/String;

    invoke-virtual {p1, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    const p2, 0x7f0e00bd

    if-eqz p1, :cond_0

    iget-object p1, p0, Lcom/motorola/ccc/ota/ui/ErrorFragment;->btnRetry:Landroid/widget/Button;

    invoke-virtual {p0, p2}, Lcom/motorola/ccc/ota/ui/ErrorFragment;->getString(I)Ljava/lang/String;

    move-result-object p3

    invoke-virtual {p1, p3}, Landroid/widget/Button;->setText(Ljava/lang/CharSequence;)V

    goto :goto_0

    :cond_0
    const p1, 0x7f0e01ea

    invoke-virtual {p0, p1}, Lcom/motorola/ccc/ota/ui/ErrorFragment;->getString(I)Ljava/lang/String;

    move-result-object p1

    iget-object p3, p0, Lcom/motorola/ccc/ota/ui/ErrorFragment;->mErrorTitle:Ljava/lang/String;

    invoke-virtual {p1, p3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_1

    iget-object p1, p0, Lcom/motorola/ccc/ota/ui/ErrorFragment;->btnRetry:Landroid/widget/Button;

    invoke-virtual {p0, p2}, Lcom/motorola/ccc/ota/ui/ErrorFragment;->getString(I)Ljava/lang/String;

    move-result-object p3

    invoke-virtual {p1, p3}, Landroid/widget/Button;->setText(Ljava/lang/CharSequence;)V

    iget-object p1, p0, Lcom/motorola/ccc/ota/ui/ErrorFragment;->lottieAnimationView:Lcom/airbnb/lottie/LottieAnimationView;

    const-string p3, "check_mark.json"

    invoke-virtual {p1, p3}, Lcom/airbnb/lottie/LottieAnimationView;->setAnimation(Ljava/lang/String;)V

    goto :goto_0

    :cond_1
    const p1, 0x7f0e01e8

    invoke-virtual {p0, p1}, Lcom/motorola/ccc/ota/ui/ErrorFragment;->getString(I)Ljava/lang/String;

    move-result-object p1

    iget-object p3, p0, Lcom/motorola/ccc/ota/ui/ErrorFragment;->mErrorTitle:Ljava/lang/String;

    invoke-virtual {p1, p3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_2

    iget-object p1, p0, Lcom/motorola/ccc/ota/ui/ErrorFragment;->btnRetry:Landroid/widget/Button;

    invoke-virtual {p0, p2}, Lcom/motorola/ccc/ota/ui/ErrorFragment;->getString(I)Ljava/lang/String;

    move-result-object p3

    invoke-virtual {p1, p3}, Landroid/widget/Button;->setText(Ljava/lang/CharSequence;)V

    :cond_2
    :goto_0
    iget-object p1, p0, Lcom/motorola/ccc/ota/ui/ErrorFragment;->lottieAnimationView:Lcom/airbnb/lottie/LottieAnimationView;

    invoke-virtual {p1}, Lcom/airbnb/lottie/LottieAnimationView;->playAnimation()V

    iget-object p1, p0, Lcom/motorola/ccc/ota/ui/ErrorFragment;->btnRetry:Landroid/widget/Button;

    new-instance p3, Lcom/motorola/ccc/ota/ui/ErrorFragment$1;

    invoke-direct {p3, p0}, Lcom/motorola/ccc/ota/ui/ErrorFragment$1;-><init>(Lcom/motorola/ccc/ota/ui/ErrorFragment;)V

    invoke-virtual {p1, p3}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    invoke-static {}, Lcom/motorola/ccc/ota/utils/BuildPropReader;->isATT()Z

    move-result p1

    if-eqz p1, :cond_3

    iget-object p1, p0, Lcom/motorola/ccc/ota/ui/ErrorFragment;->btnRetry:Landroid/widget/Button;

    invoke-virtual {p0, p2}, Lcom/motorola/ccc/ota/ui/ErrorFragment;->getString(I)Ljava/lang/String;

    move-result-object p2

    invoke-virtual {p1, p2}, Landroid/widget/Button;->setText(Ljava/lang/CharSequence;)V

    :cond_3
    iget-object p0, p0, Lcom/motorola/ccc/ota/ui/ErrorFragment;->rootView:Landroid/view/View;

    return-object p0
.end method

.method public onDestroy()V
    .locals 0

    invoke-super {p0}, Landroidx/fragment/app/Fragment;->onDestroy()V

    return-void
.end method

.method public onDestroyView()V
    .locals 0

    invoke-super {p0}, Landroidx/fragment/app/Fragment;->onDestroyView()V

    return-void
.end method

.method public onStop()V
    .locals 0

    invoke-super {p0}, Landroidx/fragment/app/Fragment;->onStop()V

    return-void
.end method
