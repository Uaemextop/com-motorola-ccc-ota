.class public Lcom/motorola/ccc/ota/ui/DownloadOptionsFragment;
.super Landroidx/fragment/app/DialogFragment;
.source "DownloadOptionsFragment.java"


# static fields
.field public static final ARG_PARAM_ID:Ljava/lang/String; = "param_id"

.field public static final ARG_PARAM_MODE:Ljava/lang/String; = "param_mode"

.field private static final ARG_PARAM_SIZE:Ljava/lang/String; = "param_size"

.field private static final ARG_PARAM_UPDATE_TYPE:Ljava/lang/String; = "param_update_type"


# instance fields
.field private mDlOptionNotes:Landroid/widget/TextView;

.field private mFinishReceiver:Landroid/content/BroadcastReceiver;

.field private mParamDownloadMode:Ljava/lang/String;

.field private mParamId:I

.field private mParamSize:J

.field private mParamUpdateType:Ljava/lang/String;

.field private mUpdateType:Lcom/motorola/ccc/ota/ui/updateType/UpdateType$UpdateTypeInterface;

.field private mWifiAndMobile:Landroid/widget/RadioButton;

.field private mWifiOnly:Landroid/widget/RadioButton;


# direct methods
.method static bridge synthetic -$$Nest$fgetmDlOptionNotes(Lcom/motorola/ccc/ota/ui/DownloadOptionsFragment;)Landroid/widget/TextView;
    .locals 0

    iget-object p0, p0, Lcom/motorola/ccc/ota/ui/DownloadOptionsFragment;->mDlOptionNotes:Landroid/widget/TextView;

    return-object p0
.end method

.method public constructor <init>()V
    .locals 1

    invoke-direct {p0}, Landroidx/fragment/app/DialogFragment;-><init>()V

    new-instance v0, Lcom/motorola/ccc/ota/ui/DownloadOptionsFragment$2;

    invoke-direct {v0, p0}, Lcom/motorola/ccc/ota/ui/DownloadOptionsFragment$2;-><init>(Lcom/motorola/ccc/ota/ui/DownloadOptionsFragment;)V

    iput-object v0, p0, Lcom/motorola/ccc/ota/ui/DownloadOptionsFragment;->mFinishReceiver:Landroid/content/BroadcastReceiver;

    return-void
.end method

.method private handleRadioGroup(Landroid/view/View;)V
    .locals 1

    const v0, 0x7f090123

    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/RadioButton;

    iput-object v0, p0, Lcom/motorola/ccc/ota/ui/DownloadOptionsFragment;->mWifiOnly:Landroid/widget/RadioButton;

    const v0, 0x7f090120

    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p1

    check-cast p1, Landroid/widget/RadioButton;

    iput-object p1, p0, Lcom/motorola/ccc/ota/ui/DownloadOptionsFragment;->mWifiAndMobile:Landroid/widget/RadioButton;

    const/4 v0, 0x1

    invoke-virtual {p1, v0}, Landroid/widget/RadioButton;->setChecked(Z)V

    iget-object p0, p0, Lcom/motorola/ccc/ota/ui/DownloadOptionsFragment;->mDlOptionNotes:Landroid/widget/TextView;

    const/4 p1, 0x0

    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setVisibility(I)V

    return-void
.end method

.method public static newInstance(Ljava/lang/String;JLjava/lang/String;I)Lcom/motorola/ccc/ota/ui/DownloadOptionsFragment;
    .locals 3

    new-instance v0, Lcom/motorola/ccc/ota/ui/DownloadOptionsFragment;

    invoke-direct {v0}, Lcom/motorola/ccc/ota/ui/DownloadOptionsFragment;-><init>()V

    new-instance v1, Landroid/os/Bundle;

    invoke-direct {v1}, Landroid/os/Bundle;-><init>()V

    const-string v2, "param_update_type"

    invoke-virtual {v1, v2, p0}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    const-string p0, "param_size"

    invoke-virtual {v1, p0, p1, p2}, Landroid/os/Bundle;->putLong(Ljava/lang/String;J)V

    const-string p0, "param_id"

    invoke-virtual {v1, p0, p4}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    const-string p0, "param_mode"

    invoke-virtual {v1, p0, p3}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v0, v1}, Lcom/motorola/ccc/ota/ui/DownloadOptionsFragment;->setArguments(Landroid/os/Bundle;)V

    return-object v0
.end method

.method private setDisplaySize(JLandroid/widget/TextView;)V
    .locals 1

    invoke-virtual {p0}, Lcom/motorola/ccc/ota/ui/DownloadOptionsFragment;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    invoke-virtual {p0}, Lcom/motorola/ccc/ota/ui/DownloadOptionsFragment;->getContext()Landroid/content/Context;

    move-result-object p0

    invoke-static {p0, p1, p2}, Landroid/text/format/Formatter;->formatFileSize(Landroid/content/Context;J)Ljava/lang/String;

    move-result-object p0

    filled-new-array {p0}, [Ljava/lang/Object;

    move-result-object p0

    const p1, 0x7f0e013b

    invoke-virtual {v0, p1, p0}, Landroid/content/res/Resources;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p0

    invoke-virtual {p3, p0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    return-void
.end method


# virtual methods
.method synthetic lambda$onCreateView$1$com-motorola-ccc-ota-ui-DownloadOptionsFragment(Landroid/view/View;)V
    .locals 3

    new-instance p1, Landroid/content/Intent;

    invoke-direct {p1}, Landroid/content/Intent;-><init>()V

    const-string v0, "param_mode"

    iget-object v1, p0, Lcom/motorola/ccc/ota/ui/DownloadOptionsFragment;->mParamDownloadMode:Ljava/lang/String;

    invoke-virtual {p1, v0, v1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    iget-object v0, p0, Lcom/motorola/ccc/ota/ui/DownloadOptionsFragment;->mWifiAndMobile:Landroid/widget/RadioButton;

    invoke-virtual {v0}, Landroid/widget/RadioButton;->isChecked()Z

    move-result v0

    if-eqz v0, :cond_0

    sget-object v0, Lcom/motorola/ccc/ota/utils/UpgradeUtilConstants$ResponseFlavour;->RESPONSE_FLAVOUR_WIFI_AND_MOBILE:Lcom/motorola/ccc/ota/utils/UpgradeUtilConstants$ResponseFlavour;

    invoke-virtual {v0}, Lcom/motorola/ccc/ota/utils/UpgradeUtilConstants$ResponseFlavour;->ordinal()I

    move-result v0

    goto :goto_0

    :cond_0
    sget-object v0, Lcom/motorola/ccc/ota/utils/UpgradeUtilConstants$ResponseFlavour;->RESPONSE_FLAVOUR_WIFI:Lcom/motorola/ccc/ota/utils/UpgradeUtilConstants$ResponseFlavour;

    invoke-virtual {v0}, Lcom/motorola/ccc/ota/utils/UpgradeUtilConstants$ResponseFlavour;->ordinal()I

    move-result v0

    :goto_0
    const-string v1, "param_id"

    invoke-virtual {p1, v1, v0}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    invoke-virtual {p0}, Lcom/motorola/ccc/ota/ui/DownloadOptionsFragment;->getTargetFragment()Landroidx/fragment/app/Fragment;

    move-result-object v0

    if-eqz v0, :cond_1

    invoke-virtual {p0}, Lcom/motorola/ccc/ota/ui/DownloadOptionsFragment;->getTargetRequestCode()I

    move-result v1

    const/4 v2, 0x2

    invoke-virtual {v0, v1, v2, p1}, Landroidx/fragment/app/Fragment;->onActivityResult(IILandroid/content/Intent;)V

    :cond_1
    invoke-virtual {p0}, Lcom/motorola/ccc/ota/ui/DownloadOptionsFragment;->dismiss()V

    return-void
.end method

.method synthetic lambda$onResume$0$com-motorola-ccc-ota-ui-DownloadOptionsFragment(Landroid/content/DialogInterface;ILandroid/view/KeyEvent;)Z
    .locals 0

    const/4 p1, 0x4

    if-ne p2, p1, :cond_0

    invoke-virtual {p0}, Lcom/motorola/ccc/ota/ui/DownloadOptionsFragment;->dismiss()V

    const/4 p0, 0x1

    return p0

    :cond_0
    const/4 p0, 0x0

    return p0
.end method

.method public onCreate(Landroid/os/Bundle;)V
    .locals 2

    invoke-super {p0, p1}, Landroidx/fragment/app/DialogFragment;->onCreate(Landroid/os/Bundle;)V

    invoke-virtual {p0}, Lcom/motorola/ccc/ota/ui/DownloadOptionsFragment;->getArguments()Landroid/os/Bundle;

    move-result-object p1

    if-eqz p1, :cond_0

    invoke-virtual {p0}, Lcom/motorola/ccc/ota/ui/DownloadOptionsFragment;->getArguments()Landroid/os/Bundle;

    move-result-object p1

    const-string v0, "param_update_type"

    invoke-virtual {p1, v0}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    iput-object p1, p0, Lcom/motorola/ccc/ota/ui/DownloadOptionsFragment;->mParamUpdateType:Ljava/lang/String;

    invoke-virtual {p0}, Lcom/motorola/ccc/ota/ui/DownloadOptionsFragment;->getArguments()Landroid/os/Bundle;

    move-result-object p1

    const-string v0, "param_size"

    invoke-virtual {p1, v0}, Landroid/os/Bundle;->getLong(Ljava/lang/String;)J

    move-result-wide v0

    iput-wide v0, p0, Lcom/motorola/ccc/ota/ui/DownloadOptionsFragment;->mParamSize:J

    invoke-virtual {p0}, Lcom/motorola/ccc/ota/ui/DownloadOptionsFragment;->getArguments()Landroid/os/Bundle;

    move-result-object p1

    const-string v0, "param_id"

    invoke-virtual {p1, v0}, Landroid/os/Bundle;->getInt(Ljava/lang/String;)I

    move-result p1

    iput p1, p0, Lcom/motorola/ccc/ota/ui/DownloadOptionsFragment;->mParamId:I

    invoke-virtual {p0}, Lcom/motorola/ccc/ota/ui/DownloadOptionsFragment;->getArguments()Landroid/os/Bundle;

    move-result-object p1

    const-string v0, "param_mode"

    invoke-virtual {p1, v0}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    iput-object p1, p0, Lcom/motorola/ccc/ota/ui/DownloadOptionsFragment;->mParamDownloadMode:Ljava/lang/String;

    :cond_0
    new-instance p1, Landroid/content/IntentFilter;

    invoke-direct {p1}, Landroid/content/IntentFilter;-><init>()V

    const-string v0, "com.motorola.ccc.ota.ui.finish_download_options_fragment"

    invoke-virtual {p1, v0}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    invoke-virtual {p0}, Lcom/motorola/ccc/ota/ui/DownloadOptionsFragment;->getContext()Landroid/content/Context;

    move-result-object v0

    iget-object p0, p0, Lcom/motorola/ccc/ota/ui/DownloadOptionsFragment;->mFinishReceiver:Landroid/content/BroadcastReceiver;

    invoke-static {v0, p0, p1}, Lcom/motorola/otalib/common/utils/BroadcastUtils;->registerLocalReceiver(Landroid/content/Context;Landroid/content/BroadcastReceiver;Landroid/content/IntentFilter;)V

    return-void
.end method

.method public onCreateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;Landroid/os/Bundle;)Landroid/view/View;
    .locals 2

    const p3, 0x7f0c0036

    const/4 v0, 0x0

    invoke-virtual {p1, p3, p2, v0}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object p1

    invoke-virtual {p0}, Lcom/motorola/ccc/ota/ui/DownloadOptionsFragment;->getDialog()Landroid/app/Dialog;

    move-result-object p2

    invoke-virtual {p2}, Landroid/app/Dialog;->getWindow()Landroid/view/Window;

    move-result-object p2

    const p3, 0x7f0800a2

    invoke-virtual {p2, p3}, Landroid/view/Window;->setBackgroundDrawableResource(I)V

    iget-object p2, p0, Lcom/motorola/ccc/ota/ui/DownloadOptionsFragment;->mParamUpdateType:Ljava/lang/String;

    invoke-static {p2}, Lcom/motorola/ccc/ota/ui/updateType/UpdateType;->getUpdateType(Ljava/lang/String;)Lcom/motorola/ccc/ota/ui/updateType/UpdateType$UpdateTypeInterface;

    move-result-object p2

    iput-object p2, p0, Lcom/motorola/ccc/ota/ui/DownloadOptionsFragment;->mUpdateType:Lcom/motorola/ccc/ota/ui/updateType/UpdateType$UpdateTypeInterface;

    const p2, 0x7f0900a3

    invoke-virtual {p1, p2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p2

    check-cast p2, Landroid/widget/TextView;

    iget-wide v0, p0, Lcom/motorola/ccc/ota/ui/DownloadOptionsFragment;->mParamSize:J

    invoke-direct {p0, v0, v1, p2}, Lcom/motorola/ccc/ota/ui/DownloadOptionsFragment;->setDisplaySize(JLandroid/widget/TextView;)V

    const p2, 0x7f09009a

    invoke-virtual {p1, p2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p2

    check-cast p2, Landroid/widget/TextView;

    iput-object p2, p0, Lcom/motorola/ccc/ota/ui/DownloadOptionsFragment;->mDlOptionNotes:Landroid/widget/TextView;

    invoke-direct {p0, p1}, Lcom/motorola/ccc/ota/ui/DownloadOptionsFragment;->handleRadioGroup(Landroid/view/View;)V

    const p2, 0x7f09009b

    invoke-virtual {p1, p2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p2

    check-cast p2, Landroid/widget/Button;

    new-instance p3, Lcom/motorola/ccc/ota/ui/DownloadOptionsFragment$$ExternalSyntheticLambda0;

    invoke-direct {p3, p0}, Lcom/motorola/ccc/ota/ui/DownloadOptionsFragment$$ExternalSyntheticLambda0;-><init>(Lcom/motorola/ccc/ota/ui/DownloadOptionsFragment;)V

    invoke-virtual {p2, p3}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    iget-object p2, p0, Lcom/motorola/ccc/ota/ui/DownloadOptionsFragment;->mWifiAndMobile:Landroid/widget/RadioButton;

    new-instance p3, Lcom/motorola/ccc/ota/ui/DownloadOptionsFragment$1;

    invoke-direct {p3, p0}, Lcom/motorola/ccc/ota/ui/DownloadOptionsFragment$1;-><init>(Lcom/motorola/ccc/ota/ui/DownloadOptionsFragment;)V

    invoke-virtual {p2, p3}, Landroid/widget/RadioButton;->setOnCheckedChangeListener(Landroid/widget/CompoundButton$OnCheckedChangeListener;)V

    return-object p1
.end method

.method public onDestroy()V
    .locals 1

    invoke-super {p0}, Landroidx/fragment/app/DialogFragment;->onDestroy()V

    invoke-virtual {p0}, Lcom/motorola/ccc/ota/ui/DownloadOptionsFragment;->getContext()Landroid/content/Context;

    move-result-object v0

    iget-object p0, p0, Lcom/motorola/ccc/ota/ui/DownloadOptionsFragment;->mFinishReceiver:Landroid/content/BroadcastReceiver;

    invoke-static {v0, p0}, Lcom/motorola/otalib/common/utils/BroadcastUtils;->unregisterLocalReceiver(Landroid/content/Context;Landroid/content/BroadcastReceiver;)V

    return-void
.end method

.method public onDismiss(Landroid/content/DialogInterface;)V
    .locals 0

    invoke-super {p0, p1}, Landroidx/fragment/app/DialogFragment;->onDismiss(Landroid/content/DialogInterface;)V

    return-void
.end method

.method public onResume()V
    .locals 2

    invoke-super {p0}, Landroidx/fragment/app/DialogFragment;->onResume()V

    invoke-virtual {p0}, Lcom/motorola/ccc/ota/ui/DownloadOptionsFragment;->getDialog()Landroid/app/Dialog;

    move-result-object v0

    new-instance v1, Lcom/motorola/ccc/ota/ui/DownloadOptionsFragment$$ExternalSyntheticLambda1;

    invoke-direct {v1, p0}, Lcom/motorola/ccc/ota/ui/DownloadOptionsFragment$$ExternalSyntheticLambda1;-><init>(Lcom/motorola/ccc/ota/ui/DownloadOptionsFragment;)V

    invoke-virtual {v0, v1}, Landroid/app/Dialog;->setOnKeyListener(Landroid/content/DialogInterface$OnKeyListener;)V

    return-void
.end method
