.class public Lcom/motorola/ccc/ota/ui/WebViewFragment$ProgressDialogFragment;
.super Landroidx/fragment/app/DialogFragment;
.source "WebViewFragment.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/motorola/ccc/ota/ui/WebViewFragment;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "ProgressDialogFragment"
.end annotation


# direct methods
.method public constructor <init>()V
    .locals 0

    invoke-direct {p0}, Landroidx/fragment/app/DialogFragment;-><init>()V

    return-void
.end method


# virtual methods
.method public onCreateDialog(Landroid/os/Bundle;)Landroid/app/Dialog;
    .locals 0

    new-instance p1, Landroid/app/ProgressDialog;

    invoke-virtual {p0}, Lcom/motorola/ccc/ota/ui/WebViewFragment$ProgressDialogFragment;->getActivity()Landroidx/fragment/app/FragmentActivity;

    move-result-object p0

    invoke-direct {p1, p0}, Landroid/app/ProgressDialog;-><init>(Landroid/content/Context;)V

    const p0, 0x7f0e00bb

    invoke-virtual {p1, p0}, Landroid/app/ProgressDialog;->setTitle(I)V

    return-object p1
.end method
