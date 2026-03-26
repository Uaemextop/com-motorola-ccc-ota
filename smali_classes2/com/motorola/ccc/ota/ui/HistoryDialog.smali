.class public Lcom/motorola/ccc/ota/ui/HistoryDialog;
.super Landroidx/fragment/app/DialogFragment;
.source "HistoryDialog.java"

# interfaces
.implements Lcom/motorola/ccc/ota/utils/SmartUpdateUtils$SmartDialog;


# instance fields
.field private activityIntent:Landroid/content/Intent;

.field private expandableListView:Landroid/widget/ExpandableListView;

.field private mExpandableHeading:Landroid/widget/TextView;

.field private mHeading:Landroid/widget/TextView;

.field private mOkayButton:Landroid/widget/Button;

.field private mReleaseNotes:Ljava/lang/String;

.field private mRootView:Landroid/view/View;

.field private mSourceVersion:Ljava/lang/String;

.field private mTargetVersion:Ljava/lang/String;

.field private mUpdateNotes:Ljava/lang/String;

.field private mUpdateType:Ljava/lang/String;

.field private mUpgradeNotesTextView:Landroid/widget/TextView;


# direct methods
.method public constructor <init>()V
    .locals 0

    invoke-direct {p0}, Landroidx/fragment/app/DialogFragment;-><init>()V

    return-void
.end method

.method private findViewsById()V
    .locals 2

    iget-object v0, p0, Lcom/motorola/ccc/ota/ui/HistoryDialog;->mRootView:Landroid/view/View;

    const v1, 0x7f0900d0

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p0, Lcom/motorola/ccc/ota/ui/HistoryDialog;->mHeading:Landroid/widget/TextView;

    iget-object v0, p0, Lcom/motorola/ccc/ota/ui/HistoryDialog;->mRootView:Landroid/view/View;

    const v1, 0x7f0900ba

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p0, Lcom/motorola/ccc/ota/ui/HistoryDialog;->mExpandableHeading:Landroid/widget/TextView;

    iget-object v0, p0, Lcom/motorola/ccc/ota/ui/HistoryDialog;->mRootView:Landroid/view/View;

    const v1, 0x7f0901ec

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p0, Lcom/motorola/ccc/ota/ui/HistoryDialog;->mUpgradeNotesTextView:Landroid/widget/TextView;

    iget-object v0, p0, Lcom/motorola/ccc/ota/ui/HistoryDialog;->mRootView:Landroid/view/View;

    const v1, 0x7f0900cf

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/ExpandableListView;

    iput-object v0, p0, Lcom/motorola/ccc/ota/ui/HistoryDialog;->expandableListView:Landroid/widget/ExpandableListView;

    iget-object v0, p0, Lcom/motorola/ccc/ota/ui/HistoryDialog;->mRootView:Landroid/view/View;

    const v1, 0x7f0900d1

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/Button;

    iput-object v0, p0, Lcom/motorola/ccc/ota/ui/HistoryDialog;->mOkayButton:Landroid/widget/Button;

    return-void
.end method

.method private handleButtons()V
    .locals 2

    iget-object v0, p0, Lcom/motorola/ccc/ota/ui/HistoryDialog;->mOkayButton:Landroid/widget/Button;

    new-instance v1, Lcom/motorola/ccc/ota/ui/HistoryDialog$1;

    invoke-direct {v1, p0}, Lcom/motorola/ccc/ota/ui/HistoryDialog$1;-><init>(Lcom/motorola/ccc/ota/ui/HistoryDialog;)V

    invoke-virtual {v0, v1}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    return-void
.end method


# virtual methods
.method public dismissSmartDialog()V
    .locals 0

    invoke-virtual {p0}, Lcom/motorola/ccc/ota/ui/HistoryDialog;->dismiss()V

    return-void
.end method

.method public onActivityCreated(Landroid/os/Bundle;)V
    .locals 8

    invoke-super {p0, p1}, Landroidx/fragment/app/DialogFragment;->onActivityCreated(Landroid/os/Bundle;)V

    iget-object p1, p0, Lcom/motorola/ccc/ota/ui/HistoryDialog;->mSourceVersion:Ljava/lang/String;

    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result p1

    if-eqz p1, :cond_0

    iget-object p1, p0, Lcom/motorola/ccc/ota/ui/HistoryDialog;->mHeading:Landroid/widget/TextView;

    invoke-virtual {p0}, Lcom/motorola/ccc/ota/ui/HistoryDialog;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    iget-object v1, p0, Lcom/motorola/ccc/ota/ui/HistoryDialog;->mTargetVersion:Ljava/lang/String;

    filled-new-array {v1}, [Ljava/lang/Object;

    move-result-object v1

    const v2, 0x7f0e01db

    invoke-virtual {v0, v2, v1}, Landroid/content/res/Resources;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    goto :goto_0

    :cond_0
    iget-object p1, p0, Lcom/motorola/ccc/ota/ui/HistoryDialog;->mHeading:Landroid/widget/TextView;

    invoke-virtual {p0}, Lcom/motorola/ccc/ota/ui/HistoryDialog;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    iget-object v1, p0, Lcom/motorola/ccc/ota/ui/HistoryDialog;->mSourceVersion:Ljava/lang/String;

    iget-object v2, p0, Lcom/motorola/ccc/ota/ui/HistoryDialog;->mTargetVersion:Ljava/lang/String;

    filled-new-array {v1, v2}, [Ljava/lang/Object;

    move-result-object v1

    const v2, 0x7f0e01d8

    invoke-virtual {v0, v2, v1}, Landroid/content/res/Resources;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    :goto_0
    iget-object p1, p0, Lcom/motorola/ccc/ota/ui/HistoryDialog;->mReleaseNotes:Ljava/lang/String;

    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result p1

    if-nez p1, :cond_1

    iget-object p1, p0, Lcom/motorola/ccc/ota/ui/HistoryDialog;->mRootView:Landroid/view/View;

    const v0, 0x7f090082

    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v7

    iget-object v1, p0, Lcom/motorola/ccc/ota/ui/HistoryDialog;->expandableListView:Landroid/widget/ExpandableListView;

    iget-object v3, p0, Lcom/motorola/ccc/ota/ui/HistoryDialog;->mReleaseNotes:Ljava/lang/String;

    iget-object v4, p0, Lcom/motorola/ccc/ota/ui/HistoryDialog;->mExpandableHeading:Landroid/widget/TextView;

    invoke-virtual {p0}, Lcom/motorola/ccc/ota/ui/HistoryDialog;->getActivity()Landroidx/fragment/app/FragmentActivity;

    move-result-object v5

    iget-object p1, p0, Lcom/motorola/ccc/ota/ui/HistoryDialog;->mUpdateType:Ljava/lang/String;

    invoke-static {p1}, Lcom/motorola/ccc/ota/ui/updateType/UpdateType;->getUpdateType(Ljava/lang/String;)Lcom/motorola/ccc/ota/ui/updateType/UpdateType$UpdateTypeInterface;

    move-result-object v6

    const/4 v2, 0x1

    invoke-static/range {v1 .. v7}, Lcom/motorola/ccc/ota/ui/UpdaterUtils;->setExpandableList(Landroid/widget/ExpandableListView;ZLjava/lang/String;Landroid/widget/TextView;Landroid/content/Context;Lcom/motorola/ccc/ota/ui/updateType/UpdateType$UpdateTypeInterface;Landroid/view/View;)Landroid/widget/ExpandableListView;

    move-result-object p1

    iput-object p1, p0, Lcom/motorola/ccc/ota/ui/HistoryDialog;->expandableListView:Landroid/widget/ExpandableListView;

    const-string v0, "history"

    invoke-static {p1, v0}, Lcom/motorola/ccc/ota/ui/UpdaterUtils;->handleExpList(Landroid/widget/ExpandableListView;Ljava/lang/String;)Landroid/widget/ExpandableListView;

    move-result-object p1

    iput-object p1, p0, Lcom/motorola/ccc/ota/ui/HistoryDialog;->expandableListView:Landroid/widget/ExpandableListView;

    goto :goto_1

    :cond_1
    iget-object p1, p0, Lcom/motorola/ccc/ota/ui/HistoryDialog;->mUpdateNotes:Ljava/lang/String;

    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result p1

    if-nez p1, :cond_2

    iget-object p1, p0, Lcom/motorola/ccc/ota/ui/HistoryDialog;->mUpgradeNotesTextView:Landroid/widget/TextView;

    iget-object v0, p0, Lcom/motorola/ccc/ota/ui/HistoryDialog;->mUpdateNotes:Ljava/lang/String;

    new-instance v1, Lcom/motorola/ccc/ota/ui/HtmlUtils;

    iget-object v2, p0, Lcom/motorola/ccc/ota/ui/HistoryDialog;->mUpdateNotes:Ljava/lang/String;

    invoke-direct {v1, v2}, Lcom/motorola/ccc/ota/ui/HtmlUtils;-><init>(Ljava/lang/String;)V

    const/4 v2, 0x0

    const/4 v3, 0x0

    invoke-static {v0, v2, v3, v1}, Landroid/text/Html;->fromHtml(Ljava/lang/String;ILandroid/text/Html$ImageGetter;Landroid/text/Html$TagHandler;)Landroid/text/Spanned;

    move-result-object v0

    invoke-virtual {p1, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    iget-object p1, p0, Lcom/motorola/ccc/ota/ui/HistoryDialog;->mUpgradeNotesTextView:Landroid/widget/TextView;

    invoke-static {}, Landroid/text/method/LinkMovementMethod;->getInstance()Landroid/text/method/MovementMethod;

    move-result-object v0

    invoke-virtual {p1, v0}, Landroid/widget/TextView;->setMovementMethod(Landroid/text/method/MovementMethod;)V

    iget-object p0, p0, Lcom/motorola/ccc/ota/ui/HistoryDialog;->mUpgradeNotesTextView:Landroid/widget/TextView;

    invoke-virtual {p0, v2}, Landroid/widget/TextView;->setVisibility(I)V

    :cond_2
    :goto_1
    return-void
.end method

.method public onCreate(Landroid/os/Bundle;)V
    .locals 2

    invoke-super {p0, p1}, Landroidx/fragment/app/DialogFragment;->onCreate(Landroid/os/Bundle;)V

    invoke-virtual {p0}, Lcom/motorola/ccc/ota/ui/HistoryDialog;->getArguments()Landroid/os/Bundle;

    move-result-object p1

    new-instance v0, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    invoke-direct {v0}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;-><init>()V

    if-eqz p1, :cond_0

    const-string v1, "activityIntent"

    invoke-virtual {p1, v1}, Landroid/os/Bundle;->getParcelable(Ljava/lang/String;)Landroid/os/Parcelable;

    move-result-object p1

    check-cast p1, Landroid/content/Intent;

    iput-object p1, p0, Lcom/motorola/ccc/ota/ui/HistoryDialog;->activityIntent:Landroid/content/Intent;

    const-string v1, "sourceVersion"

    invoke-virtual {p1, v1}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    iput-object p1, p0, Lcom/motorola/ccc/ota/ui/HistoryDialog;->mSourceVersion:Ljava/lang/String;

    iget-object p1, p0, Lcom/motorola/ccc/ota/ui/HistoryDialog;->activityIntent:Landroid/content/Intent;

    const-string v1, "targetVersion"

    invoke-virtual {p1, v1}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    iput-object p1, p0, Lcom/motorola/ccc/ota/ui/HistoryDialog;->mTargetVersion:Ljava/lang/String;

    iget-object p1, p0, Lcom/motorola/ccc/ota/ui/HistoryDialog;->activityIntent:Landroid/content/Intent;

    const-string v1, "com.motorola.blur.service.upgrade.updateType"

    invoke-virtual {p1, v1}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    iput-object p1, p0, Lcom/motorola/ccc/ota/ui/HistoryDialog;->mUpdateType:Ljava/lang/String;

    iget-object p1, p0, Lcom/motorola/ccc/ota/ui/HistoryDialog;->activityIntent:Landroid/content/Intent;

    const-string v1, "releaseNotes"

    invoke-virtual {p1, v1}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    iput-object p1, p0, Lcom/motorola/ccc/ota/ui/HistoryDialog;->mReleaseNotes:Ljava/lang/String;

    iget-object p1, p0, Lcom/motorola/ccc/ota/ui/HistoryDialog;->activityIntent:Landroid/content/Intent;

    const-string v1, "upgradeNotes"

    invoke-virtual {p1, v1}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    iput-object p1, p0, Lcom/motorola/ccc/ota/ui/HistoryDialog;->mUpdateNotes:Ljava/lang/String;

    :cond_0
    sget-object p0, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->HISTORY_TAB_CLICK_COUNT:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    invoke-virtual {v0, p0}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->incrementPrefs(Lcom/motorola/otalib/common/settings/ISetting;)V

    return-void
.end method

.method public onCreateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;Landroid/os/Bundle;)Landroid/view/View;
    .locals 1

    const p3, 0x7f0c0039

    const/4 v0, 0x0

    invoke-virtual {p1, p3, p2, v0}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object p1

    iput-object p1, p0, Lcom/motorola/ccc/ota/ui/HistoryDialog;->mRootView:Landroid/view/View;

    invoke-virtual {p0}, Lcom/motorola/ccc/ota/ui/HistoryDialog;->getDialog()Landroid/app/Dialog;

    move-result-object p1

    invoke-virtual {p1}, Landroid/app/Dialog;->getWindow()Landroid/view/Window;

    move-result-object p1

    const p2, 0x7f0800a2

    invoke-virtual {p1, p2}, Landroid/view/Window;->setBackgroundDrawableResource(I)V

    invoke-virtual {p0}, Lcom/motorola/ccc/ota/ui/HistoryDialog;->getDialog()Landroid/app/Dialog;

    move-result-object p1

    invoke-static {p1}, Lcom/motorola/ccc/ota/ui/UpdaterUtils;->setNavBarColorFromDialog(Landroid/app/Dialog;)V

    invoke-direct {p0}, Lcom/motorola/ccc/ota/ui/HistoryDialog;->findViewsById()V

    invoke-direct {p0}, Lcom/motorola/ccc/ota/ui/HistoryDialog;->handleButtons()V

    iget-object p0, p0, Lcom/motorola/ccc/ota/ui/HistoryDialog;->mRootView:Landroid/view/View;

    return-object p0
.end method
