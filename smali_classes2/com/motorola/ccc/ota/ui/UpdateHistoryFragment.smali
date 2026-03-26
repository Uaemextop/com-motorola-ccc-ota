.class public Lcom/motorola/ccc/ota/ui/UpdateHistoryFragment;
.super Landroidx/fragment/app/DialogFragment;
.source "UpdateHistoryFragment.java"

# interfaces
.implements Lcom/motorola/ccc/ota/utils/SmartUpdateUtils$SmartDialog;


# instance fields
.field private emptyHistory:Landroid/widget/LinearLayout;

.field private historyScroll:Landroid/widget/ScrollView;

.field private imgBack:Landroid/widget/ImageView;

.field private isTransactionSafe:Z

.field private mHistoryToolBar:Landroid/widget/LinearLayout;

.field private mRootView:Landroid/view/View;


# direct methods
.method static bridge synthetic -$$Nest$fgetisTransactionSafe(Lcom/motorola/ccc/ota/ui/UpdateHistoryFragment;)Z
    .locals 0

    iget-boolean p0, p0, Lcom/motorola/ccc/ota/ui/UpdateHistoryFragment;->isTransactionSafe:Z

    return p0
.end method

.method public constructor <init>()V
    .locals 0

    invoke-direct {p0}, Landroidx/fragment/app/DialogFragment;-><init>()V

    return-void
.end method

.method private addHistoryLayouts(Landroid/widget/LinearLayout;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;JLjava/lang/String;Ljava/lang/String;)V
    .locals 11

    const-wide/16 v0, 0x0

    cmp-long v0, p5, v0

    if-nez v0, :cond_0

    const-string v0, "OtaApp"

    const-string v1, "Entry in the database is wrong let\'s ignore this row"

    invoke-static {v0, v1}, Lcom/motorola/ccc/ota/utils/Logger;->debug(Ljava/lang/String;Ljava/lang/String;)V

    return-void

    :cond_0
    new-instance v0, Landroid/widget/LinearLayout$LayoutParams;

    const/4 v1, -0x2

    invoke-direct {v0, v1, v1}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    const/4 v1, 0x0

    invoke-virtual {v0, v1, v1, v1, v1}, Landroid/widget/LinearLayout$LayoutParams;->setMargins(IIII)V

    invoke-virtual {p0}, Lcom/motorola/ccc/ota/ui/UpdateHistoryFragment;->getContext()Landroid/content/Context;

    move-result-object v1

    const-string v2, "layout_inflater"

    invoke-virtual {v1, v2}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/view/LayoutInflater;

    const v2, 0x7f0c003a

    const/4 v3, 0x0

    invoke-virtual {v1, v2, v3}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/LinearLayout;

    const v2, 0x7f0900ce

    invoke-virtual {v1, v2}, Landroid/widget/LinearLayout;->findViewById(I)Landroid/view/View;

    move-result-object v2

    check-cast v2, Landroid/widget/TextView;

    const v3, 0x7f0900cd

    invoke-virtual {v1, v3}, Landroid/widget/LinearLayout;->findViewById(I)Landroid/view/View;

    move-result-object v3

    check-cast v3, Landroid/widget/TextView;

    invoke-virtual {p0}, Lcom/motorola/ccc/ota/ui/UpdateHistoryFragment;->getContext()Landroid/content/Context;

    move-result-object v4

    invoke-virtual {v4}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v4

    const v5, 0x7f0e01db

    filled-new-array {p3}, [Ljava/lang/Object;

    move-result-object v6

    invoke-virtual {v4, v5, v6}, Landroid/content/res/Resources;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v2, v4}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    invoke-virtual {p0}, Lcom/motorola/ccc/ota/ui/UpdateHistoryFragment;->getContext()Landroid/content/Context;

    move-result-object v2

    invoke-virtual {v2}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    invoke-static/range {p5 .. p6}, Lcom/motorola/ccc/ota/utils/DateFormatUtils;->getHistoryDate(J)Ljava/lang/String;

    move-result-object v4

    filled-new-array {v4}, [Ljava/lang/Object;

    move-result-object v4

    const v5, 0x7f0e01d9

    invoke-virtual {v2, v5, v4}, Landroid/content/res/Resources;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v3, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    invoke-virtual {v1, v0}, Landroid/widget/LinearLayout;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    new-instance v0, Lcom/motorola/ccc/ota/ui/UpdateHistoryFragment$1;

    move-object v4, v0

    move-object v5, p0

    move-object v6, p2

    move-object v7, p3

    move-object v8, p4

    move-object/from16 v9, p7

    move-object/from16 v10, p8

    invoke-direct/range {v4 .. v10}, Lcom/motorola/ccc/ota/ui/UpdateHistoryFragment$1;-><init>(Lcom/motorola/ccc/ota/ui/UpdateHistoryFragment;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v1, v0}, Landroid/widget/LinearLayout;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    move-object v0, p1

    invoke-virtual {p1, v1}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    return-void
.end method

.method private findViewsById()V
    .locals 2

    iget-object v0, p0, Lcom/motorola/ccc/ota/ui/UpdateHistoryFragment;->mRootView:Landroid/view/View;

    const v1, 0x7f0900e0

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/ImageView;

    iput-object v0, p0, Lcom/motorola/ccc/ota/ui/UpdateHistoryFragment;->imgBack:Landroid/widget/ImageView;

    iget-object v0, p0, Lcom/motorola/ccc/ota/ui/UpdateHistoryFragment;->mRootView:Landroid/view/View;

    const v1, 0x7f0900d4

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/ScrollView;

    iput-object v0, p0, Lcom/motorola/ccc/ota/ui/UpdateHistoryFragment;->historyScroll:Landroid/widget/ScrollView;

    iget-object v0, p0, Lcom/motorola/ccc/ota/ui/UpdateHistoryFragment;->mRootView:Landroid/view/View;

    const v1, 0x7f0901f1

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/LinearLayout;

    iput-object v0, p0, Lcom/motorola/ccc/ota/ui/UpdateHistoryFragment;->mHistoryToolBar:Landroid/widget/LinearLayout;

    iget-object v0, p0, Lcom/motorola/ccc/ota/ui/UpdateHistoryFragment;->mRootView:Landroid/view/View;

    const v1, 0x7f09010b

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/LinearLayout;

    iput-object v0, p0, Lcom/motorola/ccc/ota/ui/UpdateHistoryFragment;->emptyHistory:Landroid/widget/LinearLayout;

    return-void
.end method

.method private handleButtons()V
    .locals 2

    iget-object v0, p0, Lcom/motorola/ccc/ota/ui/UpdateHistoryFragment;->imgBack:Landroid/widget/ImageView;

    new-instance v1, Lcom/motorola/ccc/ota/ui/UpdateHistoryFragment$2;

    invoke-direct {v1, p0}, Lcom/motorola/ccc/ota/ui/UpdateHistoryFragment$2;-><init>(Lcom/motorola/ccc/ota/ui/UpdateHistoryFragment;)V

    invoke-virtual {v0, v1}, Landroid/widget/ImageView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    return-void
.end method

.method private initUI()V
    .locals 11

    invoke-direct {p0}, Lcom/motorola/ccc/ota/ui/UpdateHistoryFragment;->handleButtons()V

    iget-object v0, p0, Lcom/motorola/ccc/ota/ui/UpdateHistoryFragment;->mRootView:Landroid/view/View;

    const v1, 0x7f0900d2

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/LinearLayout;

    new-instance v1, Lcom/motorola/ccc/ota/utils/HistoryDbHandler;

    invoke-virtual {p0}, Lcom/motorola/ccc/ota/ui/UpdateHistoryFragment;->getContext()Landroid/content/Context;

    move-result-object v2

    invoke-direct {v1, v2}, Lcom/motorola/ccc/ota/utils/HistoryDbHandler;-><init>(Landroid/content/Context;)V

    invoke-virtual {v1}, Lcom/motorola/ccc/ota/utils/HistoryDbHandler;->getHistory()Ljava/util/ArrayList;

    move-result-object v1

    iget-object v2, p0, Lcom/motorola/ccc/ota/ui/UpdateHistoryFragment;->emptyHistory:Landroid/widget/LinearLayout;

    const/16 v3, 0x8

    invoke-virtual {v2, v3}, Landroid/widget/LinearLayout;->setVisibility(I)V

    iget-object v2, p0, Lcom/motorola/ccc/ota/ui/UpdateHistoryFragment;->historyScroll:Landroid/widget/ScrollView;

    const/4 v4, 0x0

    invoke-virtual {v2, v4}, Landroid/widget/ScrollView;->setVisibility(I)V

    if-eqz v1, :cond_0

    invoke-virtual {v1}, Ljava/util/ArrayList;->isEmpty()Z

    move-result v2

    if-nez v2, :cond_0

    iget-object v2, p0, Lcom/motorola/ccc/ota/ui/UpdateHistoryFragment;->emptyHistory:Landroid/widget/LinearLayout;

    invoke-virtual {v2, v3}, Landroid/widget/LinearLayout;->setVisibility(I)V

    iget-object v2, p0, Lcom/motorola/ccc/ota/ui/UpdateHistoryFragment;->historyScroll:Landroid/widget/ScrollView;

    invoke-virtual {v2, v4}, Landroid/widget/ScrollView;->setVisibility(I)V

    invoke-static {v1}, Ljava/util/Collections;->reverse(Ljava/util/List;)V

    invoke-virtual {v1}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v10

    :goto_0
    invoke-interface {v10}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_1

    invoke-interface {v10}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/motorola/ccc/ota/utils/HistoryDbHandler$History;

    invoke-virtual {v1}, Lcom/motorola/ccc/ota/utils/HistoryDbHandler$History;->getSourceVersion()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v1}, Lcom/motorola/ccc/ota/utils/HistoryDbHandler$History;->getTargetVersion()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v1}, Lcom/motorola/ccc/ota/utils/HistoryDbHandler$History;->getUpdateType()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v1}, Lcom/motorola/ccc/ota/utils/HistoryDbHandler$History;->getUpdateTime()J

    move-result-wide v6

    invoke-virtual {v1}, Lcom/motorola/ccc/ota/utils/HistoryDbHandler$History;->getReleaseNotes()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v1}, Lcom/motorola/ccc/ota/utils/HistoryDbHandler$History;->getUpgradeNotes()Ljava/lang/String;

    move-result-object v9

    move-object v1, p0

    move-object v2, v0

    invoke-direct/range {v1 .. v9}, Lcom/motorola/ccc/ota/ui/UpdateHistoryFragment;->addHistoryLayouts(Landroid/widget/LinearLayout;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;JLjava/lang/String;Ljava/lang/String;)V

    goto :goto_0

    :cond_0
    iget-object v0, p0, Lcom/motorola/ccc/ota/ui/UpdateHistoryFragment;->emptyHistory:Landroid/widget/LinearLayout;

    invoke-virtual {v0, v4}, Landroid/widget/LinearLayout;->setVisibility(I)V

    iget-object p0, p0, Lcom/motorola/ccc/ota/ui/UpdateHistoryFragment;->historyScroll:Landroid/widget/ScrollView;

    invoke-virtual {p0, v3}, Landroid/widget/ScrollView;->setVisibility(I)V

    :cond_1
    return-void
.end method


# virtual methods
.method public dismissSmartDialog()V
    .locals 0

    invoke-virtual {p0}, Lcom/motorola/ccc/ota/ui/UpdateHistoryFragment;->dismiss()V

    return-void
.end method

.method public onCreate(Landroid/os/Bundle;)V
    .locals 1

    invoke-super {p0, p1}, Landroidx/fragment/app/DialogFragment;->onCreate(Landroid/os/Bundle;)V

    const/4 p1, 0x0

    const v0, 0x7f0f00ca

    invoke-virtual {p0, p1, v0}, Lcom/motorola/ccc/ota/ui/UpdateHistoryFragment;->setStyle(II)V

    new-instance p0, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    invoke-direct {p0}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;-><init>()V

    sget-object p1, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->HISTORY_VISIT_COUNT:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    invoke-virtual {p0, p1}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->incrementPrefs(Lcom/motorola/otalib/common/settings/ISetting;)V

    return-void
.end method

.method public onCreateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;Landroid/os/Bundle;)Landroid/view/View;
    .locals 1

    const p3, 0x7f0c00a3

    const/4 v0, 0x0

    invoke-virtual {p1, p3, p2, v0}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object p1

    iput-object p1, p0, Lcom/motorola/ccc/ota/ui/UpdateHistoryFragment;->mRootView:Landroid/view/View;

    invoke-virtual {p0}, Lcom/motorola/ccc/ota/ui/UpdateHistoryFragment;->getDialog()Landroid/app/Dialog;

    move-result-object p1

    invoke-virtual {p1}, Landroid/app/Dialog;->getWindow()Landroid/view/Window;

    move-result-object p1

    const/high16 p2, -0x80000000

    invoke-virtual {p1, p2}, Landroid/view/Window;->addFlags(I)V

    invoke-virtual {p1, v0}, Landroid/view/Window;->setStatusBarColor(I)V

    invoke-virtual {p0}, Lcom/motorola/ccc/ota/ui/UpdateHistoryFragment;->getContext()Landroid/content/Context;

    move-result-object p2

    invoke-static {p2}, Lcom/motorola/ccc/ota/ui/UpdaterUtils;->isBatterySaverEnabled(Landroid/content/Context;)Z

    move-result p2

    if-nez p2, :cond_0

    new-instance p2, Landroidx/core/view/WindowInsetsControllerCompat;

    invoke-virtual {p1}, Landroid/view/Window;->getDecorView()Landroid/view/View;

    move-result-object p3

    invoke-direct {p2, p1, p3}, Landroidx/core/view/WindowInsetsControllerCompat;-><init>(Landroid/view/Window;Landroid/view/View;)V

    invoke-virtual {p0}, Lcom/motorola/ccc/ota/ui/UpdateHistoryFragment;->getContext()Landroid/content/Context;

    move-result-object p1

    const-string p3, "uimode"

    invoke-virtual {p1, p3}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Landroid/app/UiModeManager;

    invoke-virtual {p1}, Landroid/app/UiModeManager;->getNightMode()I

    move-result p1

    const/4 p3, 0x2

    if-eq p1, p3, :cond_0

    const/4 p1, 0x1

    invoke-virtual {p2, p1}, Landroidx/core/view/WindowInsetsControllerCompat;->setAppearanceLightStatusBars(Z)V

    invoke-virtual {p2, p1}, Landroidx/core/view/WindowInsetsControllerCompat;->setAppearanceLightNavigationBars(Z)V

    :cond_0
    invoke-virtual {p0}, Lcom/motorola/ccc/ota/ui/UpdateHistoryFragment;->getDialog()Landroid/app/Dialog;

    move-result-object p1

    invoke-static {p1}, Lcom/motorola/ccc/ota/ui/UpdaterUtils;->setNavBarColorFromDialog(Landroid/app/Dialog;)V

    invoke-direct {p0}, Lcom/motorola/ccc/ota/ui/UpdateHistoryFragment;->findViewsById()V

    invoke-direct {p0}, Lcom/motorola/ccc/ota/ui/UpdateHistoryFragment;->initUI()V

    iget-object p0, p0, Lcom/motorola/ccc/ota/ui/UpdateHistoryFragment;->mRootView:Landroid/view/View;

    return-object p0
.end method

.method public onPause()V
    .locals 1

    invoke-super {p0}, Landroidx/fragment/app/DialogFragment;->onPause()V

    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/motorola/ccc/ota/ui/UpdateHistoryFragment;->isTransactionSafe:Z

    return-void
.end method

.method public onResume()V
    .locals 1

    invoke-super {p0}, Landroidx/fragment/app/DialogFragment;->onResume()V

    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/motorola/ccc/ota/ui/UpdateHistoryFragment;->isTransactionSafe:Z

    return-void
.end method
