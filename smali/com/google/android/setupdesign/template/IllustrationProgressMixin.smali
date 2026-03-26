.class public Lcom/google/android/setupdesign/template/IllustrationProgressMixin;
.super Ljava/lang/Object;
.source "IllustrationProgressMixin.java"

# interfaces
.implements Lcom/google/android/setupcompat/template/Mixin;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/google/android/setupdesign/template/IllustrationProgressMixin$ProgressConfig;
    }
.end annotation

.annotation runtime Ljava/lang/Deprecated;
.end annotation


# instance fields
.field private final context:Landroid/content/Context;

.field private final glifLayout:Lcom/google/android/setupdesign/GlifLayout;

.field private progressConfig:Lcom/google/android/setupdesign/template/IllustrationProgressMixin$ProgressConfig;

.field private progressDescription:Ljava/lang/String;


# direct methods
.method public constructor <init>(Lcom/google/android/setupdesign/GlifLayout;)V
    .locals 1

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    sget-object v0, Lcom/google/android/setupdesign/template/IllustrationProgressMixin$ProgressConfig;->CONFIG_DEFAULT:Lcom/google/android/setupdesign/template/IllustrationProgressMixin$ProgressConfig;

    iput-object v0, p0, Lcom/google/android/setupdesign/template/IllustrationProgressMixin;->progressConfig:Lcom/google/android/setupdesign/template/IllustrationProgressMixin$ProgressConfig;

    iput-object p1, p0, Lcom/google/android/setupdesign/template/IllustrationProgressMixin;->glifLayout:Lcom/google/android/setupdesign/GlifLayout;

    invoke-virtual {p1}, Lcom/google/android/setupdesign/GlifLayout;->getContext()Landroid/content/Context;

    move-result-object p1

    iput-object p1, p0, Lcom/google/android/setupdesign/template/IllustrationProgressMixin;->context:Landroid/content/Context;

    return-void
.end method

.method private getProgressIllustrationLayout()Landroid/view/View;
    .locals 2

    invoke-direct {p0}, Lcom/google/android/setupdesign/template/IllustrationProgressMixin;->peekProgressIllustrationLayout()Landroid/view/View;

    move-result-object v0

    if-nez v0, :cond_0

    iget-object v0, p0, Lcom/google/android/setupdesign/template/IllustrationProgressMixin;->glifLayout:Lcom/google/android/setupdesign/GlifLayout;

    sget v1, Lcom/google/android/setupdesign/R$id;->sud_layout_illustration_progress_stub:I

    invoke-virtual {v0, v1}, Lcom/google/android/setupdesign/GlifLayout;->findManagedViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/view/ViewStub;

    if-eqz v0, :cond_0

    invoke-virtual {v0}, Landroid/view/ViewStub;->inflate()Landroid/view/View;

    invoke-direct {p0}, Lcom/google/android/setupdesign/template/IllustrationProgressMixin;->setIllustrationResource()V

    :cond_0
    invoke-direct {p0}, Lcom/google/android/setupdesign/template/IllustrationProgressMixin;->peekProgressIllustrationLayout()Landroid/view/View;

    move-result-object p0

    return-object p0
.end method

.method private peekProgressIllustrationLayout()Landroid/view/View;
    .locals 1

    iget-object p0, p0, Lcom/google/android/setupdesign/template/IllustrationProgressMixin;->glifLayout:Lcom/google/android/setupdesign/GlifLayout;

    sget v0, Lcom/google/android/setupdesign/R$id;->sud_layout_progress_illustration:I

    invoke-virtual {p0, v0}, Lcom/google/android/setupdesign/GlifLayout;->findViewById(I)Landroid/view/View;

    move-result-object p0

    return-object p0
.end method

.method private setIllustrationResource()V
    .locals 4

    iget-object v0, p0, Lcom/google/android/setupdesign/template/IllustrationProgressMixin;->glifLayout:Lcom/google/android/setupdesign/GlifLayout;

    sget v1, Lcom/google/android/setupdesign/R$id;->sud_progress_illustration:I

    invoke-virtual {v0, v1}, Lcom/google/android/setupdesign/GlifLayout;->findManagedViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Lcom/google/android/setupdesign/view/IllustrationVideoView;

    iget-object v1, p0, Lcom/google/android/setupdesign/template/IllustrationProgressMixin;->glifLayout:Lcom/google/android/setupdesign/GlifLayout;

    sget v2, Lcom/google/android/setupdesign/R$id;->sud_progress_bar:I

    invoke-virtual {v1, v2}, Lcom/google/android/setupdesign/GlifLayout;->findManagedViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/ProgressBar;

    iget-object v2, p0, Lcom/google/android/setupdesign/template/IllustrationProgressMixin;->context:Landroid/content/Context;

    invoke-static {v2}, Lcom/google/android/setupcompat/partnerconfig/PartnerConfigHelper;->get(Landroid/content/Context;)Lcom/google/android/setupcompat/partnerconfig/PartnerConfigHelper;

    move-result-object v2

    iget-object v3, p0, Lcom/google/android/setupdesign/template/IllustrationProgressMixin;->context:Landroid/content/Context;

    iget-object p0, p0, Lcom/google/android/setupdesign/template/IllustrationProgressMixin;->progressConfig:Lcom/google/android/setupdesign/template/IllustrationProgressMixin$ProgressConfig;

    invoke-virtual {p0}, Lcom/google/android/setupdesign/template/IllustrationProgressMixin$ProgressConfig;->getPartnerConfig()Lcom/google/android/setupcompat/partnerconfig/PartnerConfig;

    move-result-object p0

    invoke-virtual {v2, v3, p0}, Lcom/google/android/setupcompat/partnerconfig/PartnerConfigHelper;->getIllustrationResourceEntry(Landroid/content/Context;Lcom/google/android/setupcompat/partnerconfig/PartnerConfig;)Lcom/google/android/setupcompat/partnerconfig/ResourceEntry;

    move-result-object p0

    const/16 v2, 0x8

    const/4 v3, 0x0

    if-eqz p0, :cond_0

    invoke-virtual {v1, v2}, Landroid/widget/ProgressBar;->setVisibility(I)V

    invoke-virtual {v0, v3}, Lcom/google/android/setupdesign/view/IllustrationVideoView;->setVisibility(I)V

    invoke-virtual {v0, p0}, Lcom/google/android/setupdesign/view/IllustrationVideoView;->setVideoResourceEntry(Lcom/google/android/setupcompat/partnerconfig/ResourceEntry;)V

    goto :goto_0

    :cond_0
    invoke-virtual {v1, v3}, Landroid/widget/ProgressBar;->setVisibility(I)V

    invoke-virtual {v0, v2}, Lcom/google/android/setupdesign/view/IllustrationVideoView;->setVisibility(I)V

    :goto_0
    return-void
.end method


# virtual methods
.method public isShown()Z
    .locals 0

    invoke-direct {p0}, Lcom/google/android/setupdesign/template/IllustrationProgressMixin;->peekProgressIllustrationLayout()Landroid/view/View;

    move-result-object p0

    if-eqz p0, :cond_0

    invoke-virtual {p0}, Landroid/view/View;->getVisibility()I

    move-result p0

    if-nez p0, :cond_0

    const/4 p0, 0x1

    goto :goto_0

    :cond_0
    const/4 p0, 0x0

    :goto_0
    return p0
.end method

.method public setProgressConfig(Lcom/google/android/setupdesign/template/IllustrationProgressMixin$ProgressConfig;)V
    .locals 0

    iput-object p1, p0, Lcom/google/android/setupdesign/template/IllustrationProgressMixin;->progressConfig:Lcom/google/android/setupdesign/template/IllustrationProgressMixin$ProgressConfig;

    invoke-direct {p0}, Lcom/google/android/setupdesign/template/IllustrationProgressMixin;->peekProgressIllustrationLayout()Landroid/view/View;

    move-result-object p1

    if-eqz p1, :cond_0

    invoke-direct {p0}, Lcom/google/android/setupdesign/template/IllustrationProgressMixin;->setIllustrationResource()V

    :cond_0
    return-void
.end method

.method public setProgressIllustrationDescription(Ljava/lang/String;)V
    .locals 1

    iput-object p1, p0, Lcom/google/android/setupdesign/template/IllustrationProgressMixin;->progressDescription:Ljava/lang/String;

    invoke-virtual {p0}, Lcom/google/android/setupdesign/template/IllustrationProgressMixin;->isShown()Z

    move-result v0

    if-eqz v0, :cond_1

    invoke-direct {p0}, Lcom/google/android/setupdesign/template/IllustrationProgressMixin;->getProgressIllustrationLayout()Landroid/view/View;

    move-result-object p0

    if-eqz p0, :cond_1

    sget v0, Lcom/google/android/setupdesign/R$id;->sud_layout_description:I

    invoke-virtual {p0, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p0

    check-cast p0, Landroid/widget/TextView;

    if-eqz p1, :cond_0

    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Landroid/widget/TextView;->setVisibility(I)V

    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    goto :goto_0

    :cond_0
    const/4 v0, 0x4

    invoke-virtual {p0, v0}, Landroid/widget/TextView;->setVisibility(I)V

    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    :cond_1
    :goto_0
    return-void
.end method

.method public setShown(Z)V
    .locals 2

    if-nez p1, :cond_0

    invoke-direct {p0}, Lcom/google/android/setupdesign/template/IllustrationProgressMixin;->peekProgressIllustrationLayout()Landroid/view/View;

    move-result-object p0

    if-eqz p0, :cond_1

    const/16 p1, 0x8

    invoke-virtual {p0, p1}, Landroid/view/View;->setVisibility(I)V

    goto :goto_0

    :cond_0
    invoke-direct {p0}, Lcom/google/android/setupdesign/template/IllustrationProgressMixin;->getProgressIllustrationLayout()Landroid/view/View;

    move-result-object p1

    if-eqz p1, :cond_1

    const/4 v0, 0x0

    invoke-virtual {p1, v0}, Landroid/view/View;->setVisibility(I)V

    iget-object v1, p0, Lcom/google/android/setupdesign/template/IllustrationProgressMixin;->progressDescription:Ljava/lang/String;

    if-eqz v1, :cond_1

    sget v1, Lcom/google/android/setupdesign/R$id;->sud_layout_description:I

    invoke-virtual {p1, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p1

    check-cast p1, Landroid/widget/TextView;

    if-eqz p1, :cond_1

    invoke-virtual {p1, v0}, Landroid/widget/TextView;->setVisibility(I)V

    iget-object p0, p0, Lcom/google/android/setupdesign/template/IllustrationProgressMixin;->progressDescription:Ljava/lang/String;

    invoke-virtual {p1, p0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    :cond_1
    :goto_0
    return-void
.end method
