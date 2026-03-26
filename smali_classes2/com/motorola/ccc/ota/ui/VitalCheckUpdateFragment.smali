.class public Lcom/motorola/ccc/ota/ui/VitalCheckUpdateFragment;
.super Landroidx/fragment/app/Fragment;
.source "VitalCheckUpdateFragment.java"


# instance fields
.field private activity:Landroid/app/Activity;

.field private context:Landroid/content/Context;

.field private lottieAnimationView:Lcom/airbnb/lottie/LottieAnimationView;

.field private lottieView:Landroid/view/View;

.field private mUpdateReceiver:Landroid/content/BroadcastReceiver;

.field private rootView:Landroid/view/View;


# direct methods
.method static bridge synthetic -$$Nest$fgetactivity(Lcom/motorola/ccc/ota/ui/VitalCheckUpdateFragment;)Landroid/app/Activity;
    .locals 0

    iget-object p0, p0, Lcom/motorola/ccc/ota/ui/VitalCheckUpdateFragment;->activity:Landroid/app/Activity;

    return-object p0
.end method

.method public constructor <init>()V
    .locals 0

    invoke-direct {p0}, Landroidx/fragment/app/Fragment;-><init>()V

    return-void
.end method

.method private registerCheckUpdateReceiver()V
    .locals 3

    iget-object v0, p0, Lcom/motorola/ccc/ota/ui/VitalCheckUpdateFragment;->mUpdateReceiver:Landroid/content/BroadcastReceiver;

    if-nez v0, :cond_0

    new-instance v0, Landroid/content/IntentFilter;

    invoke-direct {v0}, Landroid/content/IntentFilter;-><init>()V

    const-string v1, "com.motorola.blur.service.blur.Actions.UPGRADE_CHECK_FOR_UPDATE_RESPONSE"

    invoke-virtual {v0, v1}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    const-string v1, "com.motorola.blur.service.blur.Actions.UPGRADE_UPDATE_STATUS"

    invoke-virtual {v0, v1}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    new-instance v1, Lcom/motorola/ccc/ota/ui/VitalCheckUpdateFragment$1;

    invoke-direct {v1, p0}, Lcom/motorola/ccc/ota/ui/VitalCheckUpdateFragment$1;-><init>(Lcom/motorola/ccc/ota/ui/VitalCheckUpdateFragment;)V

    iput-object v1, p0, Lcom/motorola/ccc/ota/ui/VitalCheckUpdateFragment;->mUpdateReceiver:Landroid/content/BroadcastReceiver;

    iget-object p0, p0, Lcom/motorola/ccc/ota/ui/VitalCheckUpdateFragment;->context:Landroid/content/Context;

    const/4 v2, 0x2

    invoke-virtual {p0, v1, v0, v2}, Landroid/content/Context;->registerReceiver(Landroid/content/BroadcastReceiver;Landroid/content/IntentFilter;I)Landroid/content/Intent;

    :cond_0
    return-void
.end method


# virtual methods
.method public onActivityCreated(Landroid/os/Bundle;)V
    .locals 1

    invoke-super {p0, p1}, Landroidx/fragment/app/Fragment;->onActivityCreated(Landroid/os/Bundle;)V

    invoke-direct {p0}, Lcom/motorola/ccc/ota/ui/VitalCheckUpdateFragment;->registerCheckUpdateReceiver()V

    iget-object p1, p0, Lcom/motorola/ccc/ota/ui/VitalCheckUpdateFragment;->lottieAnimationView:Lcom/airbnb/lottie/LottieAnimationView;

    const/4 v0, -0x1

    invoke-virtual {p1, v0}, Lcom/airbnb/lottie/LottieAnimationView;->setRepeatCount(I)V

    iget-object p1, p0, Lcom/motorola/ccc/ota/ui/VitalCheckUpdateFragment;->lottieAnimationView:Lcom/airbnb/lottie/LottieAnimationView;

    const-string v0, "vitalCheckUpdate.json"

    invoke-virtual {p1, v0}, Lcom/airbnb/lottie/LottieAnimationView;->setAnimation(Ljava/lang/String;)V

    iget-object p0, p0, Lcom/motorola/ccc/ota/ui/VitalCheckUpdateFragment;->lottieAnimationView:Lcom/airbnb/lottie/LottieAnimationView;

    invoke-virtual {p0}, Lcom/airbnb/lottie/LottieAnimationView;->playAnimation()V

    return-void
.end method

.method public onAttach(Landroid/content/Context;)V
    .locals 1

    invoke-super {p0, p1}, Landroidx/fragment/app/Fragment;->onAttach(Landroid/content/Context;)V

    iput-object p1, p0, Lcom/motorola/ccc/ota/ui/VitalCheckUpdateFragment;->context:Landroid/content/Context;

    instance-of v0, p1, Landroid/app/Activity;

    if-eqz v0, :cond_0

    check-cast p1, Landroid/app/Activity;

    iput-object p1, p0, Lcom/motorola/ccc/ota/ui/VitalCheckUpdateFragment;->activity:Landroid/app/Activity;

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

.method public onCreateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;Landroid/os/Bundle;)Landroid/view/View;
    .locals 1

    const p3, 0x7f0c00a7

    const/4 v0, 0x0

    invoke-virtual {p1, p3, p2, v0}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object p1

    iput-object p1, p0, Lcom/motorola/ccc/ota/ui/VitalCheckUpdateFragment;->rootView:Landroid/view/View;

    const p2, 0x7f0900f9

    invoke-virtual {p1, p2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p1

    check-cast p1, Lcom/airbnb/lottie/LottieAnimationView;

    iput-object p1, p0, Lcom/motorola/ccc/ota/ui/VitalCheckUpdateFragment;->lottieAnimationView:Lcom/airbnb/lottie/LottieAnimationView;

    invoke-virtual {p1, v0}, Lcom/airbnb/lottie/LottieAnimationView;->setVisibility(I)V

    iget-object p0, p0, Lcom/motorola/ccc/ota/ui/VitalCheckUpdateFragment;->rootView:Landroid/view/View;

    return-object p0
.end method

.method public onDestroy()V
    .locals 2

    invoke-super {p0}, Landroidx/fragment/app/Fragment;->onDestroy()V

    iget-object v0, p0, Lcom/motorola/ccc/ota/ui/VitalCheckUpdateFragment;->mUpdateReceiver:Landroid/content/BroadcastReceiver;

    if-eqz v0, :cond_0

    iget-object v1, p0, Lcom/motorola/ccc/ota/ui/VitalCheckUpdateFragment;->context:Landroid/content/Context;

    invoke-virtual {v1, v0}, Landroid/content/Context;->unregisterReceiver(Landroid/content/BroadcastReceiver;)V

    const/4 v0, 0x0

    iput-object v0, p0, Lcom/motorola/ccc/ota/ui/VitalCheckUpdateFragment;->mUpdateReceiver:Landroid/content/BroadcastReceiver;

    :cond_0
    return-void
.end method
