.class public Lcom/motorola/ccc/ota/ui/WarningAlertDialog$WarningAlertDialogBuilder;
.super Ljava/lang/Object;
.source "WarningAlertDialog.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/motorola/ccc/ota/ui/WarningAlertDialog;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "WarningAlertDialogBuilder"
.end annotation


# instance fields
.field mButtonColor:I

.field mDismissActivity:Z

.field mId:I

.field mMessage:Ljava/lang/String;

.field mNegativeMessage:Ljava/lang/String;

.field mPositiveMessage:Ljava/lang/String;

.field mTitle:Ljava/lang/String;


# direct methods
.method public constructor <init>(I)V
    .locals 1

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/motorola/ccc/ota/ui/WarningAlertDialog$WarningAlertDialogBuilder;->mDismissActivity:Z

    iput p1, p0, Lcom/motorola/ccc/ota/ui/WarningAlertDialog$WarningAlertDialogBuilder;->mId:I

    return-void
.end method


# virtual methods
.method public buildDialog()Lcom/motorola/ccc/ota/ui/WarningAlertDialog;
    .locals 7

    iget-object v0, p0, Lcom/motorola/ccc/ota/ui/WarningAlertDialog$WarningAlertDialogBuilder;->mMessage:Ljava/lang/String;

    iget-object v1, p0, Lcom/motorola/ccc/ota/ui/WarningAlertDialog$WarningAlertDialogBuilder;->mTitle:Ljava/lang/String;

    iget-object v2, p0, Lcom/motorola/ccc/ota/ui/WarningAlertDialog$WarningAlertDialogBuilder;->mPositiveMessage:Ljava/lang/String;

    iget-object v3, p0, Lcom/motorola/ccc/ota/ui/WarningAlertDialog$WarningAlertDialogBuilder;->mNegativeMessage:Ljava/lang/String;

    iget-boolean v4, p0, Lcom/motorola/ccc/ota/ui/WarningAlertDialog$WarningAlertDialogBuilder;->mDismissActivity:Z

    iget v5, p0, Lcom/motorola/ccc/ota/ui/WarningAlertDialog$WarningAlertDialogBuilder;->mId:I

    iget v6, p0, Lcom/motorola/ccc/ota/ui/WarningAlertDialog$WarningAlertDialogBuilder;->mButtonColor:I

    invoke-static/range {v0 .. v6}, Lcom/motorola/ccc/ota/ui/WarningAlertDialog;->newInstance(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;ZII)Lcom/motorola/ccc/ota/ui/WarningAlertDialog;

    move-result-object p0

    return-object p0
.end method

.method public isEmpty()Z
    .locals 1

    iget-object v0, p0, Lcom/motorola/ccc/ota/ui/WarningAlertDialog$WarningAlertDialogBuilder;->mMessage:Ljava/lang/String;

    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/motorola/ccc/ota/ui/WarningAlertDialog$WarningAlertDialogBuilder;->mTitle:Ljava/lang/String;

    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/motorola/ccc/ota/ui/WarningAlertDialog$WarningAlertDialogBuilder;->mPositiveMessage:Ljava/lang/String;

    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object p0, p0, Lcom/motorola/ccc/ota/ui/WarningAlertDialog$WarningAlertDialogBuilder;->mNegativeMessage:Ljava/lang/String;

    invoke-static {p0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result p0

    if-eqz p0, :cond_0

    const/4 p0, 0x1

    goto :goto_0

    :cond_0
    const/4 p0, 0x0

    :goto_0
    return p0
.end method

.method public setButtonColor(I)Lcom/motorola/ccc/ota/ui/WarningAlertDialog$WarningAlertDialogBuilder;
    .locals 0

    iput p1, p0, Lcom/motorola/ccc/ota/ui/WarningAlertDialog$WarningAlertDialogBuilder;->mButtonColor:I

    return-object p0
.end method

.method public setDismissActivity(Z)Lcom/motorola/ccc/ota/ui/WarningAlertDialog$WarningAlertDialogBuilder;
    .locals 0

    iput-boolean p1, p0, Lcom/motorola/ccc/ota/ui/WarningAlertDialog$WarningAlertDialogBuilder;->mDismissActivity:Z

    return-object p0
.end method

.method public setMessage(Ljava/lang/String;)Lcom/motorola/ccc/ota/ui/WarningAlertDialog$WarningAlertDialogBuilder;
    .locals 0

    iput-object p1, p0, Lcom/motorola/ccc/ota/ui/WarningAlertDialog$WarningAlertDialogBuilder;->mMessage:Ljava/lang/String;

    return-object p0
.end method

.method public setNegativeText(Ljava/lang/String;)Lcom/motorola/ccc/ota/ui/WarningAlertDialog$WarningAlertDialogBuilder;
    .locals 0

    iput-object p1, p0, Lcom/motorola/ccc/ota/ui/WarningAlertDialog$WarningAlertDialogBuilder;->mNegativeMessage:Ljava/lang/String;

    return-object p0
.end method

.method public setPositiveText(Ljava/lang/String;)Lcom/motorola/ccc/ota/ui/WarningAlertDialog$WarningAlertDialogBuilder;
    .locals 0

    iput-object p1, p0, Lcom/motorola/ccc/ota/ui/WarningAlertDialog$WarningAlertDialogBuilder;->mPositiveMessage:Ljava/lang/String;

    return-object p0
.end method

.method public setTitle(Ljava/lang/String;)Lcom/motorola/ccc/ota/ui/WarningAlertDialog$WarningAlertDialogBuilder;
    .locals 0

    iput-object p1, p0, Lcom/motorola/ccc/ota/ui/WarningAlertDialog$WarningAlertDialogBuilder;->mTitle:Ljava/lang/String;

    return-object p0
.end method
