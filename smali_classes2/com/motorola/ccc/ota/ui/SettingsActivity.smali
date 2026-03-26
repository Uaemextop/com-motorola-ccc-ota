.class public Lcom/motorola/ccc/ota/ui/SettingsActivity;
.super Landroidx/appcompat/app/AppCompatActivity;
.source "SettingsActivity.java"


# instance fields
.field fragmentManager:Landroidx/fragment/app/FragmentManager;

.field fragmentTransaction:Landroidx/fragment/app/FragmentTransaction;

.field private frameLayout:Landroid/widget/FrameLayout;

.field private frameLayoutMenu:Landroid/widget/FrameLayout;


# direct methods
.method public constructor <init>()V
    .locals 0

    invoke-direct {p0}, Landroidx/appcompat/app/AppCompatActivity;-><init>()V

    return-void
.end method

.method private addMenuFragment(Landroid/content/Intent;)V
    .locals 2

    new-instance v0, Landroid/os/Bundle;

    invoke-direct {v0}, Landroid/os/Bundle;-><init>()V

    const-string v1, "activityIntent"

    invoke-virtual {v0, v1, p1}, Landroid/os/Bundle;->putParcelable(Ljava/lang/String;Landroid/os/Parcelable;)V

    iget-object p1, p0, Lcom/motorola/ccc/ota/ui/SettingsActivity;->fragmentManager:Landroidx/fragment/app/FragmentManager;

    invoke-virtual {p1}, Landroidx/fragment/app/FragmentManager;->beginTransaction()Landroidx/fragment/app/FragmentTransaction;

    move-result-object p1

    iput-object p1, p0, Lcom/motorola/ccc/ota/ui/SettingsActivity;->fragmentTransaction:Landroidx/fragment/app/FragmentTransaction;

    new-instance p1, Lcom/motorola/ccc/ota/ui/MenuFragment;

    invoke-direct {p1}, Lcom/motorola/ccc/ota/ui/MenuFragment;-><init>()V

    invoke-virtual {p1, v0}, Lcom/motorola/ccc/ota/ui/MenuFragment;->setArguments(Landroid/os/Bundle;)V

    iget-object v0, p0, Lcom/motorola/ccc/ota/ui/SettingsActivity;->fragmentTransaction:Landroidx/fragment/app/FragmentTransaction;

    const v1, 0x7f0900c4

    invoke-virtual {v0, v1, p1}, Landroidx/fragment/app/FragmentTransaction;->replace(ILandroidx/fragment/app/Fragment;)Landroidx/fragment/app/FragmentTransaction;

    iget-object p0, p0, Lcom/motorola/ccc/ota/ui/SettingsActivity;->fragmentTransaction:Landroidx/fragment/app/FragmentTransaction;

    invoke-virtual {p0}, Landroidx/fragment/app/FragmentTransaction;->commit()I

    return-void
.end method


# virtual methods
.method public onCreate(Landroid/os/Bundle;)V
    .locals 2

    invoke-super {p0, p1}, Landroidx/appcompat/app/AppCompatActivity;->onCreate(Landroid/os/Bundle;)V

    const-string p1, "OtaApp"

    const-string v0, "SettingsActivity, onCreate"

    invoke-static {p1, v0}, Lcom/motorola/ccc/ota/utils/Logger;->debug(Ljava/lang/String;Ljava/lang/String;)V

    const p1, 0x7f0c0050

    invoke-virtual {p0, p1}, Lcom/motorola/ccc/ota/ui/SettingsActivity;->setContentView(I)V

    const p1, 0x7f0900c3

    invoke-virtual {p0, p1}, Lcom/motorola/ccc/ota/ui/SettingsActivity;->findViewById(I)Landroid/view/View;

    move-result-object p1

    check-cast p1, Landroid/widget/FrameLayout;

    iput-object p1, p0, Lcom/motorola/ccc/ota/ui/SettingsActivity;->frameLayout:Landroid/widget/FrameLayout;

    const p1, 0x7f0900c4

    invoke-virtual {p0, p1}, Lcom/motorola/ccc/ota/ui/SettingsActivity;->findViewById(I)Landroid/view/View;

    move-result-object p1

    check-cast p1, Landroid/widget/FrameLayout;

    iput-object p1, p0, Lcom/motorola/ccc/ota/ui/SettingsActivity;->frameLayoutMenu:Landroid/widget/FrameLayout;

    iget-object p1, p0, Lcom/motorola/ccc/ota/ui/SettingsActivity;->frameLayout:Landroid/widget/FrameLayout;

    const/16 v0, 0x8

    invoke-virtual {p1, v0}, Landroid/widget/FrameLayout;->setVisibility(I)V

    iget-object p1, p0, Lcom/motorola/ccc/ota/ui/SettingsActivity;->frameLayoutMenu:Landroid/widget/FrameLayout;

    const/4 v0, 0x0

    invoke-virtual {p1, v0}, Landroid/widget/FrameLayout;->setVisibility(I)V

    invoke-virtual {p0}, Lcom/motorola/ccc/ota/ui/SettingsActivity;->getSupportFragmentManager()Landroidx/fragment/app/FragmentManager;

    move-result-object p1

    iput-object p1, p0, Lcom/motorola/ccc/ota/ui/SettingsActivity;->fragmentManager:Landroidx/fragment/app/FragmentManager;

    invoke-virtual {p0}, Lcom/motorola/ccc/ota/ui/SettingsActivity;->getIntent()Landroid/content/Intent;

    move-result-object p1

    invoke-direct {p0, p1}, Lcom/motorola/ccc/ota/ui/SettingsActivity;->addMenuFragment(Landroid/content/Intent;)V

    invoke-static {p0}, Lcom/motorola/ccc/ota/ui/UpdaterUtils;->isBatterySaverEnabled(Landroid/content/Context;)Z

    move-result p1

    if-nez p1, :cond_0

    invoke-virtual {p0}, Lcom/motorola/ccc/ota/ui/SettingsActivity;->getWindow()Landroid/view/Window;

    move-result-object p1

    new-instance v0, Landroidx/core/view/WindowInsetsControllerCompat;

    invoke-virtual {p1}, Landroid/view/Window;->getDecorView()Landroid/view/View;

    move-result-object v1

    invoke-direct {v0, p1, v1}, Landroidx/core/view/WindowInsetsControllerCompat;-><init>(Landroid/view/Window;Landroid/view/View;)V

    const-string p1, "uimode"

    invoke-virtual {p0, p1}, Lcom/motorola/ccc/ota/ui/SettingsActivity;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Landroid/app/UiModeManager;

    invoke-virtual {p0}, Landroid/app/UiModeManager;->getNightMode()I

    move-result p0

    const/4 p1, 0x2

    if-eq p0, p1, :cond_0

    const/4 p0, 0x1

    invoke-virtual {v0, p0}, Landroidx/core/view/WindowInsetsControllerCompat;->setAppearanceLightStatusBars(Z)V

    invoke-virtual {v0, p0}, Landroidx/core/view/WindowInsetsControllerCompat;->setAppearanceLightNavigationBars(Z)V

    :cond_0
    return-void
.end method

.method protected onResume()V
    .locals 2

    invoke-super {p0}, Landroidx/appcompat/app/AppCompatActivity;->onResume()V

    const-string v0, "OtaApp"

    const-string v1, "SettingsActivity, onResume"

    invoke-static {v0, v1}, Lcom/motorola/ccc/ota/utils/Logger;->debug(Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {p0}, Lcom/motorola/ccc/ota/ui/SettingsActivity;->getIntent()Landroid/content/Intent;

    move-result-object v0

    invoke-direct {p0, v0}, Lcom/motorola/ccc/ota/ui/SettingsActivity;->addMenuFragment(Landroid/content/Intent;)V

    return-void
.end method
