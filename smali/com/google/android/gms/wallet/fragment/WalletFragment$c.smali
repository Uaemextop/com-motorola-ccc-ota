.class Lcom/google/android/gms/wallet/fragment/WalletFragment$c;
.super Lcom/google/android/gms/dynamic/a;

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/google/android/gms/wallet/fragment/WalletFragment;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "c"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/google/android/gms/dynamic/a<",
        "Lcom/google/android/gms/wallet/fragment/WalletFragment$b;",
        ">;",
        "Landroid/view/View$OnClickListener;"
    }
.end annotation


# instance fields
.field final synthetic auj:Lcom/google/android/gms/wallet/fragment/WalletFragment;


# direct methods
.method private constructor <init>(Lcom/google/android/gms/wallet/fragment/WalletFragment;)V
    .locals 0

    iput-object p1, p0, Lcom/google/android/gms/wallet/fragment/WalletFragment$c;->auj:Lcom/google/android/gms/wallet/fragment/WalletFragment;

    invoke-direct {p0}, Lcom/google/android/gms/dynamic/a;-><init>()V

    return-void
.end method

.method synthetic constructor <init>(Lcom/google/android/gms/wallet/fragment/WalletFragment;Lcom/google/android/gms/wallet/fragment/WalletFragment$1;)V
    .locals 0

    invoke-direct {p0, p1}, Lcom/google/android/gms/wallet/fragment/WalletFragment$c;-><init>(Lcom/google/android/gms/wallet/fragment/WalletFragment;)V

    return-void
.end method


# virtual methods
.method protected a(Landroid/widget/FrameLayout;)V
    .locals 6

    new-instance v0, Landroid/widget/Button;

    iget-object v1, p0, Lcom/google/android/gms/wallet/fragment/WalletFragment$c;->auj:Lcom/google/android/gms/wallet/fragment/WalletFragment;

    invoke-static {v1}, Lcom/google/android/gms/wallet/fragment/WalletFragment;->a(Lcom/google/android/gms/wallet/fragment/WalletFragment;)Landroid/app/Fragment;

    move-result-object v1

    invoke-virtual {v1}, Landroid/app/Fragment;->getActivity()Landroid/app/Activity;

    move-result-object v1

    invoke-direct {v0, v1}, Landroid/widget/Button;-><init>(Landroid/content/Context;)V

    sget v1, Lcom/google/android/gms/R$string;->wallet_buy_button_place_holder:I

    invoke-virtual {v0, v1}, Landroid/widget/Button;->setText(I)V

    iget-object v1, p0, Lcom/google/android/gms/wallet/fragment/WalletFragment$c;->auj:Lcom/google/android/gms/wallet/fragment/WalletFragment;

    invoke-static {v1}, Lcom/google/android/gms/wallet/fragment/WalletFragment;->e(Lcom/google/android/gms/wallet/fragment/WalletFragment;)Lcom/google/android/gms/wallet/fragment/WalletFragmentOptions;

    move-result-object v1

    const/4 v2, -0x1

    const/4 v3, -0x2

    if-eqz v1, :cond_0

    iget-object v1, p0, Lcom/google/android/gms/wallet/fragment/WalletFragment$c;->auj:Lcom/google/android/gms/wallet/fragment/WalletFragment;

    invoke-static {v1}, Lcom/google/android/gms/wallet/fragment/WalletFragment;->e(Lcom/google/android/gms/wallet/fragment/WalletFragment;)Lcom/google/android/gms/wallet/fragment/WalletFragmentOptions;

    move-result-object v1

    invoke-virtual {v1}, Lcom/google/android/gms/wallet/fragment/WalletFragmentOptions;->getFragmentStyle()Lcom/google/android/gms/wallet/fragment/WalletFragmentStyle;

    move-result-object v1

    if-eqz v1, :cond_0

    iget-object v4, p0, Lcom/google/android/gms/wallet/fragment/WalletFragment$c;->auj:Lcom/google/android/gms/wallet/fragment/WalletFragment;

    invoke-static {v4}, Lcom/google/android/gms/wallet/fragment/WalletFragment;->a(Lcom/google/android/gms/wallet/fragment/WalletFragment;)Landroid/app/Fragment;

    move-result-object v4

    invoke-virtual {v4}, Landroid/app/Fragment;->getResources()Landroid/content/res/Resources;

    move-result-object v4

    invoke-virtual {v4}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object v4

    const-string v5, "buyButtonWidth"

    invoke-virtual {v1, v5, v4, v2}, Lcom/google/android/gms/wallet/fragment/WalletFragmentStyle;->a(Ljava/lang/String;Landroid/util/DisplayMetrics;I)I

    move-result v2

    const-string v5, "buyButtonHeight"

    invoke-virtual {v1, v5, v4, v3}, Lcom/google/android/gms/wallet/fragment/WalletFragmentStyle;->a(Ljava/lang/String;Landroid/util/DisplayMetrics;I)I

    move-result v3

    :cond_0
    new-instance v1, Landroid/view/ViewGroup$LayoutParams;

    invoke-direct {v1, v2, v3}, Landroid/view/ViewGroup$LayoutParams;-><init>(II)V

    invoke-virtual {v0, v1}, Landroid/widget/Button;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    invoke-virtual {v0, p0}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    invoke-virtual {p1, v0}, Landroid/widget/FrameLayout;->addView(Landroid/view/View;)V

    return-void
.end method

.method protected a(Lcom/google/android/gms/dynamic/f;)V
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/google/android/gms/dynamic/f<",
            "Lcom/google/android/gms/wallet/fragment/WalletFragment$b;",
            ">;)V"
        }
    .end annotation

    iget-object v0, p0, Lcom/google/android/gms/wallet/fragment/WalletFragment$c;->auj:Lcom/google/android/gms/wallet/fragment/WalletFragment;

    invoke-static {v0}, Lcom/google/android/gms/wallet/fragment/WalletFragment;->a(Lcom/google/android/gms/wallet/fragment/WalletFragment;)Landroid/app/Fragment;

    move-result-object v0

    invoke-virtual {v0}, Landroid/app/Fragment;->getActivity()Landroid/app/Activity;

    move-result-object v0

    iget-object v1, p0, Lcom/google/android/gms/wallet/fragment/WalletFragment$c;->auj:Lcom/google/android/gms/wallet/fragment/WalletFragment;

    invoke-static {v1}, Lcom/google/android/gms/wallet/fragment/WalletFragment;->b(Lcom/google/android/gms/wallet/fragment/WalletFragment;)Lcom/google/android/gms/wallet/fragment/WalletFragment$b;

    move-result-object v1

    if-nez v1, :cond_3

    iget-object v1, p0, Lcom/google/android/gms/wallet/fragment/WalletFragment$c;->auj:Lcom/google/android/gms/wallet/fragment/WalletFragment;

    invoke-static {v1}, Lcom/google/android/gms/wallet/fragment/WalletFragment;->c(Lcom/google/android/gms/wallet/fragment/WalletFragment;)Z

    move-result v1

    if-eqz v1, :cond_3

    if-eqz v0, :cond_3

    :try_start_0
    iget-object v1, p0, Lcom/google/android/gms/wallet/fragment/WalletFragment$c;->auj:Lcom/google/android/gms/wallet/fragment/WalletFragment;

    invoke-static {v1}, Lcom/google/android/gms/wallet/fragment/WalletFragment;->d(Lcom/google/android/gms/wallet/fragment/WalletFragment;)Lcom/google/android/gms/dynamic/b;

    move-result-object v1

    iget-object v2, p0, Lcom/google/android/gms/wallet/fragment/WalletFragment$c;->auj:Lcom/google/android/gms/wallet/fragment/WalletFragment;

    invoke-static {v2}, Lcom/google/android/gms/wallet/fragment/WalletFragment;->e(Lcom/google/android/gms/wallet/fragment/WalletFragment;)Lcom/google/android/gms/wallet/fragment/WalletFragmentOptions;

    move-result-object v2

    iget-object v3, p0, Lcom/google/android/gms/wallet/fragment/WalletFragment$c;->auj:Lcom/google/android/gms/wallet/fragment/WalletFragment;

    invoke-static {v3}, Lcom/google/android/gms/wallet/fragment/WalletFragment;->f(Lcom/google/android/gms/wallet/fragment/WalletFragment;)Lcom/google/android/gms/wallet/fragment/WalletFragment$a;

    move-result-object v3

    invoke-static {v0, v1, v2, v3}, Lcom/google/android/gms/internal/oz;->a(Landroid/app/Activity;Lcom/google/android/gms/dynamic/c;Lcom/google/android/gms/wallet/fragment/WalletFragmentOptions;Lcom/google/android/gms/internal/os;)Lcom/google/android/gms/internal/or;

    move-result-object v0

    iget-object v1, p0, Lcom/google/android/gms/wallet/fragment/WalletFragment$c;->auj:Lcom/google/android/gms/wallet/fragment/WalletFragment;

    new-instance v2, Lcom/google/android/gms/wallet/fragment/WalletFragment$b;

    const/4 v3, 0x0

    invoke-direct {v2, v0, v3}, Lcom/google/android/gms/wallet/fragment/WalletFragment$b;-><init>(Lcom/google/android/gms/internal/or;Lcom/google/android/gms/wallet/fragment/WalletFragment$1;)V

    invoke-static {v1, v2}, Lcom/google/android/gms/wallet/fragment/WalletFragment;->a(Lcom/google/android/gms/wallet/fragment/WalletFragment;Lcom/google/android/gms/wallet/fragment/WalletFragment$b;)Lcom/google/android/gms/wallet/fragment/WalletFragment$b;

    iget-object v0, p0, Lcom/google/android/gms/wallet/fragment/WalletFragment$c;->auj:Lcom/google/android/gms/wallet/fragment/WalletFragment;

    invoke-static {v0, v3}, Lcom/google/android/gms/wallet/fragment/WalletFragment;->a(Lcom/google/android/gms/wallet/fragment/WalletFragment;Lcom/google/android/gms/wallet/fragment/WalletFragmentOptions;)Lcom/google/android/gms/wallet/fragment/WalletFragmentOptions;
    :try_end_0
    .catch Lcom/google/android/gms/common/GooglePlayServicesNotAvailableException; {:try_start_0 .. :try_end_0} :catch_0

    iget-object v0, p0, Lcom/google/android/gms/wallet/fragment/WalletFragment$c;->auj:Lcom/google/android/gms/wallet/fragment/WalletFragment;

    invoke-static {v0}, Lcom/google/android/gms/wallet/fragment/WalletFragment;->b(Lcom/google/android/gms/wallet/fragment/WalletFragment;)Lcom/google/android/gms/wallet/fragment/WalletFragment$b;

    move-result-object v0

    invoke-interface {p1, v0}, Lcom/google/android/gms/dynamic/f;->a(Lcom/google/android/gms/dynamic/LifecycleDelegate;)V

    iget-object p1, p0, Lcom/google/android/gms/wallet/fragment/WalletFragment$c;->auj:Lcom/google/android/gms/wallet/fragment/WalletFragment;

    invoke-static {p1}, Lcom/google/android/gms/wallet/fragment/WalletFragment;->g(Lcom/google/android/gms/wallet/fragment/WalletFragment;)Lcom/google/android/gms/wallet/fragment/WalletFragmentInitParams;

    move-result-object p1

    if-eqz p1, :cond_0

    iget-object p1, p0, Lcom/google/android/gms/wallet/fragment/WalletFragment$c;->auj:Lcom/google/android/gms/wallet/fragment/WalletFragment;

    invoke-static {p1}, Lcom/google/android/gms/wallet/fragment/WalletFragment;->b(Lcom/google/android/gms/wallet/fragment/WalletFragment;)Lcom/google/android/gms/wallet/fragment/WalletFragment$b;

    move-result-object p1

    iget-object v0, p0, Lcom/google/android/gms/wallet/fragment/WalletFragment$c;->auj:Lcom/google/android/gms/wallet/fragment/WalletFragment;

    invoke-static {v0}, Lcom/google/android/gms/wallet/fragment/WalletFragment;->g(Lcom/google/android/gms/wallet/fragment/WalletFragment;)Lcom/google/android/gms/wallet/fragment/WalletFragmentInitParams;

    move-result-object v0

    invoke-static {p1, v0}, Lcom/google/android/gms/wallet/fragment/WalletFragment$b;->a(Lcom/google/android/gms/wallet/fragment/WalletFragment$b;Lcom/google/android/gms/wallet/fragment/WalletFragmentInitParams;)V

    iget-object p1, p0, Lcom/google/android/gms/wallet/fragment/WalletFragment$c;->auj:Lcom/google/android/gms/wallet/fragment/WalletFragment;

    invoke-static {p1, v3}, Lcom/google/android/gms/wallet/fragment/WalletFragment;->a(Lcom/google/android/gms/wallet/fragment/WalletFragment;Lcom/google/android/gms/wallet/fragment/WalletFragmentInitParams;)Lcom/google/android/gms/wallet/fragment/WalletFragmentInitParams;

    :cond_0
    iget-object p1, p0, Lcom/google/android/gms/wallet/fragment/WalletFragment$c;->auj:Lcom/google/android/gms/wallet/fragment/WalletFragment;

    invoke-static {p1}, Lcom/google/android/gms/wallet/fragment/WalletFragment;->h(Lcom/google/android/gms/wallet/fragment/WalletFragment;)Lcom/google/android/gms/wallet/MaskedWalletRequest;

    move-result-object p1

    if-eqz p1, :cond_1

    iget-object p1, p0, Lcom/google/android/gms/wallet/fragment/WalletFragment$c;->auj:Lcom/google/android/gms/wallet/fragment/WalletFragment;

    invoke-static {p1}, Lcom/google/android/gms/wallet/fragment/WalletFragment;->b(Lcom/google/android/gms/wallet/fragment/WalletFragment;)Lcom/google/android/gms/wallet/fragment/WalletFragment$b;

    move-result-object p1

    iget-object v0, p0, Lcom/google/android/gms/wallet/fragment/WalletFragment$c;->auj:Lcom/google/android/gms/wallet/fragment/WalletFragment;

    invoke-static {v0}, Lcom/google/android/gms/wallet/fragment/WalletFragment;->h(Lcom/google/android/gms/wallet/fragment/WalletFragment;)Lcom/google/android/gms/wallet/MaskedWalletRequest;

    move-result-object v0

    invoke-static {p1, v0}, Lcom/google/android/gms/wallet/fragment/WalletFragment$b;->a(Lcom/google/android/gms/wallet/fragment/WalletFragment$b;Lcom/google/android/gms/wallet/MaskedWalletRequest;)V

    iget-object p1, p0, Lcom/google/android/gms/wallet/fragment/WalletFragment$c;->auj:Lcom/google/android/gms/wallet/fragment/WalletFragment;

    invoke-static {p1, v3}, Lcom/google/android/gms/wallet/fragment/WalletFragment;->a(Lcom/google/android/gms/wallet/fragment/WalletFragment;Lcom/google/android/gms/wallet/MaskedWalletRequest;)Lcom/google/android/gms/wallet/MaskedWalletRequest;

    :cond_1
    iget-object p1, p0, Lcom/google/android/gms/wallet/fragment/WalletFragment$c;->auj:Lcom/google/android/gms/wallet/fragment/WalletFragment;

    invoke-static {p1}, Lcom/google/android/gms/wallet/fragment/WalletFragment;->i(Lcom/google/android/gms/wallet/fragment/WalletFragment;)Lcom/google/android/gms/wallet/MaskedWallet;

    move-result-object p1

    if-eqz p1, :cond_2

    iget-object p1, p0, Lcom/google/android/gms/wallet/fragment/WalletFragment$c;->auj:Lcom/google/android/gms/wallet/fragment/WalletFragment;

    invoke-static {p1}, Lcom/google/android/gms/wallet/fragment/WalletFragment;->b(Lcom/google/android/gms/wallet/fragment/WalletFragment;)Lcom/google/android/gms/wallet/fragment/WalletFragment$b;

    move-result-object p1

    iget-object v0, p0, Lcom/google/android/gms/wallet/fragment/WalletFragment$c;->auj:Lcom/google/android/gms/wallet/fragment/WalletFragment;

    invoke-static {v0}, Lcom/google/android/gms/wallet/fragment/WalletFragment;->i(Lcom/google/android/gms/wallet/fragment/WalletFragment;)Lcom/google/android/gms/wallet/MaskedWallet;

    move-result-object v0

    invoke-static {p1, v0}, Lcom/google/android/gms/wallet/fragment/WalletFragment$b;->a(Lcom/google/android/gms/wallet/fragment/WalletFragment$b;Lcom/google/android/gms/wallet/MaskedWallet;)V

    iget-object p1, p0, Lcom/google/android/gms/wallet/fragment/WalletFragment$c;->auj:Lcom/google/android/gms/wallet/fragment/WalletFragment;

    invoke-static {p1, v3}, Lcom/google/android/gms/wallet/fragment/WalletFragment;->a(Lcom/google/android/gms/wallet/fragment/WalletFragment;Lcom/google/android/gms/wallet/MaskedWallet;)Lcom/google/android/gms/wallet/MaskedWallet;

    :cond_2
    iget-object p1, p0, Lcom/google/android/gms/wallet/fragment/WalletFragment$c;->auj:Lcom/google/android/gms/wallet/fragment/WalletFragment;

    invoke-static {p1}, Lcom/google/android/gms/wallet/fragment/WalletFragment;->j(Lcom/google/android/gms/wallet/fragment/WalletFragment;)Ljava/lang/Boolean;

    move-result-object p1

    if-eqz p1, :cond_3

    iget-object p1, p0, Lcom/google/android/gms/wallet/fragment/WalletFragment$c;->auj:Lcom/google/android/gms/wallet/fragment/WalletFragment;

    invoke-static {p1}, Lcom/google/android/gms/wallet/fragment/WalletFragment;->b(Lcom/google/android/gms/wallet/fragment/WalletFragment;)Lcom/google/android/gms/wallet/fragment/WalletFragment$b;

    move-result-object p1

    iget-object v0, p0, Lcom/google/android/gms/wallet/fragment/WalletFragment$c;->auj:Lcom/google/android/gms/wallet/fragment/WalletFragment;

    invoke-static {v0}, Lcom/google/android/gms/wallet/fragment/WalletFragment;->j(Lcom/google/android/gms/wallet/fragment/WalletFragment;)Ljava/lang/Boolean;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    invoke-static {p1, v0}, Lcom/google/android/gms/wallet/fragment/WalletFragment$b;->a(Lcom/google/android/gms/wallet/fragment/WalletFragment$b;Z)V

    iget-object p0, p0, Lcom/google/android/gms/wallet/fragment/WalletFragment$c;->auj:Lcom/google/android/gms/wallet/fragment/WalletFragment;

    invoke-static {p0, v3}, Lcom/google/android/gms/wallet/fragment/WalletFragment;->a(Lcom/google/android/gms/wallet/fragment/WalletFragment;Ljava/lang/Boolean;)Ljava/lang/Boolean;

    nop

    :catch_0
    :cond_3
    return-void
.end method

.method public onClick(Landroid/view/View;)V
    .locals 1

    iget-object p0, p0, Lcom/google/android/gms/wallet/fragment/WalletFragment$c;->auj:Lcom/google/android/gms/wallet/fragment/WalletFragment;

    invoke-static {p0}, Lcom/google/android/gms/wallet/fragment/WalletFragment;->a(Lcom/google/android/gms/wallet/fragment/WalletFragment;)Landroid/app/Fragment;

    move-result-object p0

    invoke-virtual {p0}, Landroid/app/Fragment;->getActivity()Landroid/app/Activity;

    move-result-object p0

    invoke-static {p0}, Lcom/google/android/gms/common/GooglePlayServicesUtil;->isGooglePlayServicesAvailable(Landroid/content/Context;)I

    move-result p1

    const/4 v0, -0x1

    invoke-static {p1, p0, v0}, Lcom/google/android/gms/common/GooglePlayServicesUtil;->showErrorDialogFragment(ILandroid/app/Activity;I)Z

    return-void
.end method
