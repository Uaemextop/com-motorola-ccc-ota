.class public final synthetic Lcom/motorola/ccc/ota/utils/SmartUpdateUtils$$ExternalSyntheticLambda5;
.super Ljava/lang/Object;
.source "D8$$SyntheticClass"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic f$0:Landroid/content/DialogInterface$OnClickListener;

.field public final synthetic f$1:Landroidx/appcompat/app/AlertDialog;


# direct methods
.method public synthetic constructor <init>(Landroid/content/DialogInterface$OnClickListener;Landroidx/appcompat/app/AlertDialog;)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/motorola/ccc/ota/utils/SmartUpdateUtils$$ExternalSyntheticLambda5;->f$0:Landroid/content/DialogInterface$OnClickListener;

    iput-object p2, p0, Lcom/motorola/ccc/ota/utils/SmartUpdateUtils$$ExternalSyntheticLambda5;->f$1:Landroidx/appcompat/app/AlertDialog;

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .locals 1

    iget-object v0, p0, Lcom/motorola/ccc/ota/utils/SmartUpdateUtils$$ExternalSyntheticLambda5;->f$0:Landroid/content/DialogInterface$OnClickListener;

    iget-object p0, p0, Lcom/motorola/ccc/ota/utils/SmartUpdateUtils$$ExternalSyntheticLambda5;->f$1:Landroidx/appcompat/app/AlertDialog;

    invoke-static {v0, p0, p1}, Lcom/motorola/ccc/ota/utils/SmartUpdateUtils;->lambda$getAndShowAreYouSurePopUp$5(Landroid/content/DialogInterface$OnClickListener;Landroidx/appcompat/app/AlertDialog;Landroid/view/View;)V

    return-void
.end method
