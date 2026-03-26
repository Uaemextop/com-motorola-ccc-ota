.class public Lcom/motorola/ccc/ota/ui/WarningAlertDialog;
.super Landroidx/fragment/app/DialogFragment;
.source "WarningAlertDialog.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/motorola/ccc/ota/ui/WarningAlertDialog$WarningAlertDialogBuilder;
    }
.end annotation


# static fields
.field private static final ARG_DISMISS_ACTIVITY:Ljava/lang/String; = "arg_dismiss_activity"

.field private static final ARG_ID:Ljava/lang/String; = "arg_id"

.field private static final ARG_MESSAGE:Ljava/lang/String; = "arg_message"

.field private static final ARG_NEGATIVE:Ljava/lang/String; = "arg_negative"

.field private static final ARG_POSITIVE:Ljava/lang/String; = "arg_positve"

.field private static final ARG_TITLE:Ljava/lang/String; = "arg_title"


# instance fields
.field private dismissActivity:Z

.field private id:I

.field private mFinishReceiver:Landroid/content/BroadcastReceiver;

.field private mListener:Lcom/motorola/ccc/ota/ui/UpdaterUtils$OnDialogInteractionListener;

.field private message:Ljava/lang/String;

.field private negativeText:Ljava/lang/String;

.field private positiveText:Ljava/lang/String;

.field private title:Ljava/lang/String;


# direct methods
.method public constructor <init>()V
    .locals 1

    invoke-direct {p0}, Landroidx/fragment/app/DialogFragment;-><init>()V

    new-instance v0, Lcom/motorola/ccc/ota/ui/WarningAlertDialog$1;

    invoke-direct {v0, p0}, Lcom/motorola/ccc/ota/ui/WarningAlertDialog$1;-><init>(Lcom/motorola/ccc/ota/ui/WarningAlertDialog;)V

    iput-object v0, p0, Lcom/motorola/ccc/ota/ui/WarningAlertDialog;->mFinishReceiver:Landroid/content/BroadcastReceiver;

    return-void
.end method

.method public static newInstance(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;ZII)Lcom/motorola/ccc/ota/ui/WarningAlertDialog;
    .locals 2

    new-instance p6, Lcom/motorola/ccc/ota/ui/WarningAlertDialog;

    invoke-direct {p6}, Lcom/motorola/ccc/ota/ui/WarningAlertDialog;-><init>()V

    new-instance v0, Landroid/os/Bundle;

    invoke-direct {v0}, Landroid/os/Bundle;-><init>()V

    const-string v1, "arg_message"

    invoke-virtual {v0, v1, p0}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    const-string p0, "arg_title"

    invoke-virtual {v0, p0, p1}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    const-string p0, "arg_positve"

    invoke-virtual {v0, p0, p2}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    const-string p0, "arg_negative"

    invoke-virtual {v0, p0, p3}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    const-string p0, "arg_dismiss_activity"

    invoke-virtual {v0, p0, p4}, Landroid/os/Bundle;->putBoolean(Ljava/lang/String;Z)V

    const-string p0, "arg_id"

    invoke-virtual {v0, p0, p5}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    invoke-virtual {p6, v0}, Lcom/motorola/ccc/ota/ui/WarningAlertDialog;->setArguments(Landroid/os/Bundle;)V

    return-object p6
.end method


# virtual methods
.method synthetic lambda$onCreateDialog$0$com-motorola-ccc-ota-ui-WarningAlertDialog(Landroid/view/View;)V
    .locals 2

    invoke-virtual {p0}, Lcom/motorola/ccc/ota/ui/WarningAlertDialog;->dismiss()V

    invoke-virtual {p0}, Lcom/motorola/ccc/ota/ui/WarningAlertDialog;->getTargetFragment()Landroidx/fragment/app/Fragment;

    move-result-object p1

    const/4 v0, 0x0

    if-eqz p1, :cond_0

    invoke-virtual {p0}, Lcom/motorola/ccc/ota/ui/WarningAlertDialog;->getTargetRequestCode()I

    move-result p0

    const/4 v1, 0x0

    invoke-virtual {p1, p0, v1, v0}, Landroidx/fragment/app/Fragment;->onActivityResult(IILandroid/content/Intent;)V

    goto :goto_0

    :cond_0
    iget-object p1, p0, Lcom/motorola/ccc/ota/ui/WarningAlertDialog;->mListener:Lcom/motorola/ccc/ota/ui/UpdaterUtils$OnDialogInteractionListener;

    iget p0, p0, Lcom/motorola/ccc/ota/ui/WarningAlertDialog;->id:I

    invoke-interface {p1, p0, v0}, Lcom/motorola/ccc/ota/ui/UpdaterUtils$OnDialogInteractionListener;->onPositiveClick(ILorg/json/JSONObject;)V

    :goto_0
    return-void
.end method

.method synthetic lambda$onCreateDialog$1$com-motorola-ccc-ota-ui-WarningAlertDialog(Landroid/view/View;)V
    .locals 0

    iget-object p1, p0, Lcom/motorola/ccc/ota/ui/WarningAlertDialog;->mListener:Lcom/motorola/ccc/ota/ui/UpdaterUtils$OnDialogInteractionListener;

    iget p0, p0, Lcom/motorola/ccc/ota/ui/WarningAlertDialog;->id:I

    invoke-interface {p1, p0}, Lcom/motorola/ccc/ota/ui/UpdaterUtils$OnDialogInteractionListener;->onNegativeClick(I)V

    return-void
.end method

.method public onAttach(Landroid/content/Context;)V
    .locals 1

    invoke-super {p0, p1}, Landroidx/fragment/app/DialogFragment;->onAttach(Landroid/content/Context;)V

    instance-of v0, p1, Lcom/motorola/ccc/ota/ui/UpdaterUtils$OnDialogInteractionListener;

    if-eqz v0, :cond_0

    check-cast p1, Lcom/motorola/ccc/ota/ui/UpdaterUtils$OnDialogInteractionListener;

    iput-object p1, p0, Lcom/motorola/ccc/ota/ui/WarningAlertDialog;->mListener:Lcom/motorola/ccc/ota/ui/UpdaterUtils$OnDialogInteractionListener;

    return-void

    :cond_0
    new-instance p0, Ljava/lang/RuntimeException;

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    const-string v0, " must implement OnDialogInteractionListener"

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-direct {p0, p1}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw p0
.end method

.method public onCreate(Landroid/os/Bundle;)V
    .locals 1

    invoke-super {p0, p1}, Landroidx/fragment/app/DialogFragment;->onCreate(Landroid/os/Bundle;)V

    invoke-virtual {p0}, Lcom/motorola/ccc/ota/ui/WarningAlertDialog;->getArguments()Landroid/os/Bundle;

    move-result-object p1

    if-eqz p1, :cond_0

    invoke-virtual {p0}, Lcom/motorola/ccc/ota/ui/WarningAlertDialog;->getArguments()Landroid/os/Bundle;

    move-result-object p1

    const-string v0, "arg_message"

    invoke-virtual {p1, v0}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    iput-object p1, p0, Lcom/motorola/ccc/ota/ui/WarningAlertDialog;->message:Ljava/lang/String;

    invoke-virtual {p0}, Lcom/motorola/ccc/ota/ui/WarningAlertDialog;->getArguments()Landroid/os/Bundle;

    move-result-object p1

    const-string v0, "arg_title"

    invoke-virtual {p1, v0}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    iput-object p1, p0, Lcom/motorola/ccc/ota/ui/WarningAlertDialog;->title:Ljava/lang/String;

    invoke-virtual {p0}, Lcom/motorola/ccc/ota/ui/WarningAlertDialog;->getArguments()Landroid/os/Bundle;

    move-result-object p1

    const-string v0, "arg_positve"

    invoke-virtual {p1, v0}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    iput-object p1, p0, Lcom/motorola/ccc/ota/ui/WarningAlertDialog;->positiveText:Ljava/lang/String;

    invoke-virtual {p0}, Lcom/motorola/ccc/ota/ui/WarningAlertDialog;->getArguments()Landroid/os/Bundle;

    move-result-object p1

    const-string v0, "arg_negative"

    invoke-virtual {p1, v0}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    iput-object p1, p0, Lcom/motorola/ccc/ota/ui/WarningAlertDialog;->negativeText:Ljava/lang/String;

    invoke-virtual {p0}, Lcom/motorola/ccc/ota/ui/WarningAlertDialog;->getArguments()Landroid/os/Bundle;

    move-result-object p1

    const-string v0, "arg_dismiss_activity"

    invoke-virtual {p1, v0}, Landroid/os/Bundle;->getBoolean(Ljava/lang/String;)Z

    move-result p1

    iput-boolean p1, p0, Lcom/motorola/ccc/ota/ui/WarningAlertDialog;->dismissActivity:Z

    invoke-virtual {p0}, Lcom/motorola/ccc/ota/ui/WarningAlertDialog;->getArguments()Landroid/os/Bundle;

    move-result-object p1

    const-string v0, "arg_id"

    invoke-virtual {p1, v0}, Landroid/os/Bundle;->getInt(Ljava/lang/String;)I

    move-result p1

    iput p1, p0, Lcom/motorola/ccc/ota/ui/WarningAlertDialog;->id:I

    :cond_0
    const/4 p1, 0x0

    invoke-virtual {p0, p1}, Lcom/motorola/ccc/ota/ui/WarningAlertDialog;->setCancelable(Z)V

    new-instance p1, Landroid/content/IntentFilter;

    invoke-direct {p1}, Landroid/content/IntentFilter;-><init>()V

    const-string v0, "com.motorola.ccc.ota.ui.finish_wad"

    invoke-virtual {p1, v0}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    invoke-virtual {p0}, Lcom/motorola/ccc/ota/ui/WarningAlertDialog;->getContext()Landroid/content/Context;

    move-result-object v0

    iget-object p0, p0, Lcom/motorola/ccc/ota/ui/WarningAlertDialog;->mFinishReceiver:Landroid/content/BroadcastReceiver;

    invoke-static {v0, p0, p1}, Lcom/motorola/otalib/common/utils/BroadcastUtils;->registerLocalReceiver(Landroid/content/Context;Landroid/content/BroadcastReceiver;Landroid/content/IntentFilter;)V

    return-void
.end method

.method public onCreateDialog(Landroid/os/Bundle;)Landroid/app/Dialog;
    .locals 4

    new-instance p1, Landroidx/appcompat/app/AlertDialog$Builder;

    invoke-virtual {p0}, Lcom/motorola/ccc/ota/ui/WarningAlertDialog;->getActivity()Landroidx/fragment/app/FragmentActivity;

    move-result-object v0

    invoke-direct {p1, v0}, Landroidx/appcompat/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    invoke-virtual {p0}, Lcom/motorola/ccc/ota/ui/WarningAlertDialog;->getActivity()Landroidx/fragment/app/FragmentActivity;

    move-result-object v0

    invoke-virtual {v0}, Landroidx/fragment/app/FragmentActivity;->getLayoutInflater()Landroid/view/LayoutInflater;

    move-result-object v0

    const v1, 0x7f0c001d

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    move-result-object v0

    iget-object v1, p0, Lcom/motorola/ccc/ota/ui/WarningAlertDialog;->title:Ljava/lang/String;

    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    const/4 v2, 0x0

    if-nez v1, :cond_0

    const v1, 0x7f0901de

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/TextView;

    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setVisibility(I)V

    iget-object v3, p0, Lcom/motorola/ccc/ota/ui/WarningAlertDialog;->title:Ljava/lang/String;

    invoke-virtual {v1, v3}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    :cond_0
    iget-object v1, p0, Lcom/motorola/ccc/ota/ui/WarningAlertDialog;->message:Ljava/lang/String;

    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    if-nez v1, :cond_1

    const v1, 0x7f0901e3

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/TextView;

    iget-object v3, p0, Lcom/motorola/ccc/ota/ui/WarningAlertDialog;->message:Ljava/lang/String;

    invoke-virtual {v1, v3}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    iget-object v3, p0, Lcom/motorola/ccc/ota/ui/WarningAlertDialog;->message:Ljava/lang/String;

    invoke-static {v1, v3}, Lcom/motorola/ccc/ota/ui/UpdaterUtils;->makeTextViewLinkify(Landroid/widget/TextView;Ljava/lang/String;)V

    :cond_1
    iget-object v1, p0, Lcom/motorola/ccc/ota/ui/WarningAlertDialog;->positiveText:Ljava/lang/String;

    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    if-nez v1, :cond_2

    const v1, 0x7f09005b

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/Button;

    invoke-virtual {v1, v2}, Landroid/widget/Button;->setVisibility(I)V

    iget-object v3, p0, Lcom/motorola/ccc/ota/ui/WarningAlertDialog;->positiveText:Ljava/lang/String;

    invoke-virtual {v1, v3}, Landroid/widget/Button;->setText(Ljava/lang/CharSequence;)V

    new-instance v3, Lcom/motorola/ccc/ota/ui/WarningAlertDialog$$ExternalSyntheticLambda0;

    invoke-direct {v3, p0}, Lcom/motorola/ccc/ota/ui/WarningAlertDialog$$ExternalSyntheticLambda0;-><init>(Lcom/motorola/ccc/ota/ui/WarningAlertDialog;)V

    invoke-virtual {v1, v3}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    :cond_2
    iget-object v1, p0, Lcom/motorola/ccc/ota/ui/WarningAlertDialog;->negativeText:Ljava/lang/String;

    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    if-nez v1, :cond_3

    const v1, 0x7f090058

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/Button;

    invoke-virtual {v1, v2}, Landroid/widget/Button;->setVisibility(I)V

    iget-object v2, p0, Lcom/motorola/ccc/ota/ui/WarningAlertDialog;->negativeText:Ljava/lang/String;

    invoke-virtual {v1, v2}, Landroid/widget/Button;->setText(Ljava/lang/CharSequence;)V

    new-instance v2, Lcom/motorola/ccc/ota/ui/WarningAlertDialog$$ExternalSyntheticLambda1;

    invoke-direct {v2, p0}, Lcom/motorola/ccc/ota/ui/WarningAlertDialog$$ExternalSyntheticLambda1;-><init>(Lcom/motorola/ccc/ota/ui/WarningAlertDialog;)V

    invoke-virtual {v1, v2}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    :cond_3
    invoke-virtual {p1, v0}, Landroidx/appcompat/app/AlertDialog$Builder;->setView(Landroid/view/View;)Landroidx/appcompat/app/AlertDialog$Builder;

    invoke-virtual {p1}, Landroidx/appcompat/app/AlertDialog$Builder;->create()Landroidx/appcompat/app/AlertDialog;

    move-result-object p1

    invoke-virtual {p0}, Lcom/motorola/ccc/ota/ui/WarningAlertDialog;->getContext()Landroid/content/Context;

    move-result-object p0

    invoke-static {p0, p1}, Lcom/motorola/ccc/ota/ui/UpdaterUtils;->setCornersRounded(Landroid/content/Context;Landroidx/appcompat/app/AlertDialog;)V

    return-object p1
.end method

.method public onCreateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;Landroid/os/Bundle;)Landroid/view/View;
    .locals 0

    invoke-super {p0, p1, p2, p3}, Landroidx/fragment/app/DialogFragment;->onCreateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;Landroid/os/Bundle;)Landroid/view/View;

    move-result-object p0

    return-object p0
.end method

.method public onDestroy()V
    .locals 1

    invoke-super {p0}, Landroidx/fragment/app/DialogFragment;->onDestroy()V

    invoke-virtual {p0}, Lcom/motorola/ccc/ota/ui/WarningAlertDialog;->getContext()Landroid/content/Context;

    move-result-object v0

    iget-object p0, p0, Lcom/motorola/ccc/ota/ui/WarningAlertDialog;->mFinishReceiver:Landroid/content/BroadcastReceiver;

    invoke-static {v0, p0}, Lcom/motorola/otalib/common/utils/BroadcastUtils;->unregisterLocalReceiver(Landroid/content/Context;Landroid/content/BroadcastReceiver;)V

    return-void
.end method

.method public onDetach()V
    .locals 1

    invoke-super {p0}, Landroidx/fragment/app/DialogFragment;->onDetach()V

    const/4 v0, 0x0

    iput-object v0, p0, Lcom/motorola/ccc/ota/ui/WarningAlertDialog;->mListener:Lcom/motorola/ccc/ota/ui/UpdaterUtils$OnDialogInteractionListener;

    return-void
.end method

.method public onDismiss(Landroid/content/DialogInterface;)V
    .locals 1

    invoke-super {p0, p1}, Landroidx/fragment/app/DialogFragment;->onDismiss(Landroid/content/DialogInterface;)V

    iget-object p1, p0, Lcom/motorola/ccc/ota/ui/WarningAlertDialog;->mListener:Lcom/motorola/ccc/ota/ui/UpdaterUtils$OnDialogInteractionListener;

    if-eqz p1, :cond_0

    iget v0, p0, Lcom/motorola/ccc/ota/ui/WarningAlertDialog;->id:I

    iget-boolean p0, p0, Lcom/motorola/ccc/ota/ui/WarningAlertDialog;->dismissActivity:Z

    invoke-interface {p1, v0, p0}, Lcom/motorola/ccc/ota/ui/UpdaterUtils$OnDialogInteractionListener;->onDismiss(IZ)V

    :cond_0
    return-void
.end method

.method public onStop()V
    .locals 0

    invoke-super {p0}, Landroidx/fragment/app/DialogFragment;->onStop()V

    return-void
.end method
