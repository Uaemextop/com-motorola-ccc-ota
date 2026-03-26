.class public final Lcom/google/android/gms/dynamic/h;
.super Lcom/google/android/gms/dynamic/c$a;


# instance fields
.field private Lt:Landroidx/fragment/app/Fragment;


# direct methods
.method private constructor <init>(Landroidx/fragment/app/Fragment;)V
    .locals 0

    invoke-direct {p0}, Lcom/google/android/gms/dynamic/c$a;-><init>()V

    iput-object p1, p0, Lcom/google/android/gms/dynamic/h;->Lt:Landroidx/fragment/app/Fragment;

    return-void
.end method

.method public static a(Landroidx/fragment/app/Fragment;)Lcom/google/android/gms/dynamic/h;
    .locals 1

    if-eqz p0, :cond_0

    new-instance v0, Lcom/google/android/gms/dynamic/h;

    invoke-direct {v0, p0}, Lcom/google/android/gms/dynamic/h;-><init>(Landroidx/fragment/app/Fragment;)V

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return-object v0
.end method


# virtual methods
.method public d(Lcom/google/android/gms/dynamic/d;)V
    .locals 0

    invoke-static {p1}, Lcom/google/android/gms/dynamic/e;->f(Lcom/google/android/gms/dynamic/d;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Landroid/view/View;

    iget-object p0, p0, Lcom/google/android/gms/dynamic/h;->Lt:Landroidx/fragment/app/Fragment;

    invoke-virtual {p0, p1}, Landroidx/fragment/app/Fragment;->registerForContextMenu(Landroid/view/View;)V

    return-void
.end method

.method public e(Lcom/google/android/gms/dynamic/d;)V
    .locals 0

    invoke-static {p1}, Lcom/google/android/gms/dynamic/e;->f(Lcom/google/android/gms/dynamic/d;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Landroid/view/View;

    iget-object p0, p0, Lcom/google/android/gms/dynamic/h;->Lt:Landroidx/fragment/app/Fragment;

    invoke-virtual {p0, p1}, Landroidx/fragment/app/Fragment;->unregisterForContextMenu(Landroid/view/View;)V

    return-void
.end method

.method public getArguments()Landroid/os/Bundle;
    .locals 0

    iget-object p0, p0, Lcom/google/android/gms/dynamic/h;->Lt:Landroidx/fragment/app/Fragment;

    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getArguments()Landroid/os/Bundle;

    move-result-object p0

    return-object p0
.end method

.method public getId()I
    .locals 0

    iget-object p0, p0, Lcom/google/android/gms/dynamic/h;->Lt:Landroidx/fragment/app/Fragment;

    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getId()I

    move-result p0

    return p0
.end method

.method public getRetainInstance()Z
    .locals 0

    iget-object p0, p0, Lcom/google/android/gms/dynamic/h;->Lt:Landroidx/fragment/app/Fragment;

    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getRetainInstance()Z

    move-result p0

    return p0
.end method

.method public getTag()Ljava/lang/String;
    .locals 0

    iget-object p0, p0, Lcom/google/android/gms/dynamic/h;->Lt:Landroidx/fragment/app/Fragment;

    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getTag()Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method public getTargetRequestCode()I
    .locals 0

    iget-object p0, p0, Lcom/google/android/gms/dynamic/h;->Lt:Landroidx/fragment/app/Fragment;

    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getTargetRequestCode()I

    move-result p0

    return p0
.end method

.method public getUserVisibleHint()Z
    .locals 0

    iget-object p0, p0, Lcom/google/android/gms/dynamic/h;->Lt:Landroidx/fragment/app/Fragment;

    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getUserVisibleHint()Z

    move-result p0

    return p0
.end method

.method public getView()Lcom/google/android/gms/dynamic/d;
    .locals 0

    iget-object p0, p0, Lcom/google/android/gms/dynamic/h;->Lt:Landroidx/fragment/app/Fragment;

    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getView()Landroid/view/View;

    move-result-object p0

    invoke-static {p0}, Lcom/google/android/gms/dynamic/e;->k(Ljava/lang/Object;)Lcom/google/android/gms/dynamic/d;

    move-result-object p0

    return-object p0
.end method

.method public isAdded()Z
    .locals 0

    iget-object p0, p0, Lcom/google/android/gms/dynamic/h;->Lt:Landroidx/fragment/app/Fragment;

    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->isAdded()Z

    move-result p0

    return p0
.end method

.method public isDetached()Z
    .locals 0

    iget-object p0, p0, Lcom/google/android/gms/dynamic/h;->Lt:Landroidx/fragment/app/Fragment;

    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->isDetached()Z

    move-result p0

    return p0
.end method

.method public isHidden()Z
    .locals 0

    iget-object p0, p0, Lcom/google/android/gms/dynamic/h;->Lt:Landroidx/fragment/app/Fragment;

    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->isHidden()Z

    move-result p0

    return p0
.end method

.method public isInLayout()Z
    .locals 0

    iget-object p0, p0, Lcom/google/android/gms/dynamic/h;->Lt:Landroidx/fragment/app/Fragment;

    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->isInLayout()Z

    move-result p0

    return p0
.end method

.method public isRemoving()Z
    .locals 0

    iget-object p0, p0, Lcom/google/android/gms/dynamic/h;->Lt:Landroidx/fragment/app/Fragment;

    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->isRemoving()Z

    move-result p0

    return p0
.end method

.method public isResumed()Z
    .locals 0

    iget-object p0, p0, Lcom/google/android/gms/dynamic/h;->Lt:Landroidx/fragment/app/Fragment;

    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->isResumed()Z

    move-result p0

    return p0
.end method

.method public isVisible()Z
    .locals 0

    iget-object p0, p0, Lcom/google/android/gms/dynamic/h;->Lt:Landroidx/fragment/app/Fragment;

    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->isVisible()Z

    move-result p0

    return p0
.end method

.method public iu()Lcom/google/android/gms/dynamic/d;
    .locals 0

    iget-object p0, p0, Lcom/google/android/gms/dynamic/h;->Lt:Landroidx/fragment/app/Fragment;

    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getActivity()Landroidx/fragment/app/FragmentActivity;

    move-result-object p0

    invoke-static {p0}, Lcom/google/android/gms/dynamic/e;->k(Ljava/lang/Object;)Lcom/google/android/gms/dynamic/d;

    move-result-object p0

    return-object p0
.end method

.method public iv()Lcom/google/android/gms/dynamic/c;
    .locals 0

    iget-object p0, p0, Lcom/google/android/gms/dynamic/h;->Lt:Landroidx/fragment/app/Fragment;

    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getParentFragment()Landroidx/fragment/app/Fragment;

    move-result-object p0

    invoke-static {p0}, Lcom/google/android/gms/dynamic/h;->a(Landroidx/fragment/app/Fragment;)Lcom/google/android/gms/dynamic/h;

    move-result-object p0

    return-object p0
.end method

.method public iw()Lcom/google/android/gms/dynamic/d;
    .locals 0

    iget-object p0, p0, Lcom/google/android/gms/dynamic/h;->Lt:Landroidx/fragment/app/Fragment;

    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getResources()Landroid/content/res/Resources;

    move-result-object p0

    invoke-static {p0}, Lcom/google/android/gms/dynamic/e;->k(Ljava/lang/Object;)Lcom/google/android/gms/dynamic/d;

    move-result-object p0

    return-object p0
.end method

.method public ix()Lcom/google/android/gms/dynamic/c;
    .locals 0

    iget-object p0, p0, Lcom/google/android/gms/dynamic/h;->Lt:Landroidx/fragment/app/Fragment;

    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getTargetFragment()Landroidx/fragment/app/Fragment;

    move-result-object p0

    invoke-static {p0}, Lcom/google/android/gms/dynamic/h;->a(Landroidx/fragment/app/Fragment;)Lcom/google/android/gms/dynamic/h;

    move-result-object p0

    return-object p0
.end method

.method public setHasOptionsMenu(Z)V
    .locals 0

    iget-object p0, p0, Lcom/google/android/gms/dynamic/h;->Lt:Landroidx/fragment/app/Fragment;

    invoke-virtual {p0, p1}, Landroidx/fragment/app/Fragment;->setHasOptionsMenu(Z)V

    return-void
.end method

.method public setMenuVisibility(Z)V
    .locals 0

    iget-object p0, p0, Lcom/google/android/gms/dynamic/h;->Lt:Landroidx/fragment/app/Fragment;

    invoke-virtual {p0, p1}, Landroidx/fragment/app/Fragment;->setMenuVisibility(Z)V

    return-void
.end method

.method public setRetainInstance(Z)V
    .locals 0

    iget-object p0, p0, Lcom/google/android/gms/dynamic/h;->Lt:Landroidx/fragment/app/Fragment;

    invoke-virtual {p0, p1}, Landroidx/fragment/app/Fragment;->setRetainInstance(Z)V

    return-void
.end method

.method public setUserVisibleHint(Z)V
    .locals 0

    iget-object p0, p0, Lcom/google/android/gms/dynamic/h;->Lt:Landroidx/fragment/app/Fragment;

    invoke-virtual {p0, p1}, Landroidx/fragment/app/Fragment;->setUserVisibleHint(Z)V

    return-void
.end method

.method public startActivity(Landroid/content/Intent;)V
    .locals 0

    iget-object p0, p0, Lcom/google/android/gms/dynamic/h;->Lt:Landroidx/fragment/app/Fragment;

    invoke-virtual {p0, p1}, Landroidx/fragment/app/Fragment;->startActivity(Landroid/content/Intent;)V

    return-void
.end method

.method public startActivityForResult(Landroid/content/Intent;I)V
    .locals 0

    iget-object p0, p0, Lcom/google/android/gms/dynamic/h;->Lt:Landroidx/fragment/app/Fragment;

    invoke-virtual {p0, p1, p2}, Landroidx/fragment/app/Fragment;->startActivityForResult(Landroid/content/Intent;I)V

    return-void
.end method
