.class public final synthetic Lcom/motorola/ccc/ota/ui/BaseActivity$$ExternalSyntheticLambda0;
.super Ljava/lang/Object;
.source "D8$$SyntheticClass"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic f$0:Lcom/motorola/ccc/ota/ui/BaseActivity;

.field public final synthetic f$1:Landroidx/appcompat/app/AlertDialog;


# direct methods
.method public synthetic constructor <init>(Lcom/motorola/ccc/ota/ui/BaseActivity;Landroidx/appcompat/app/AlertDialog;)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/motorola/ccc/ota/ui/BaseActivity$$ExternalSyntheticLambda0;->f$0:Lcom/motorola/ccc/ota/ui/BaseActivity;

    iput-object p2, p0, Lcom/motorola/ccc/ota/ui/BaseActivity$$ExternalSyntheticLambda0;->f$1:Landroidx/appcompat/app/AlertDialog;

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .locals 1

    iget-object v0, p0, Lcom/motorola/ccc/ota/ui/BaseActivity$$ExternalSyntheticLambda0;->f$0:Lcom/motorola/ccc/ota/ui/BaseActivity;

    iget-object p0, p0, Lcom/motorola/ccc/ota/ui/BaseActivity$$ExternalSyntheticLambda0;->f$1:Landroidx/appcompat/app/AlertDialog;

    invoke-virtual {v0, p0, p1}, Lcom/motorola/ccc/ota/ui/BaseActivity;->lambda$showPermissionDialog$0$com-motorola-ccc-ota-ui-BaseActivity(Landroidx/appcompat/app/AlertDialog;Landroid/view/View;)V

    return-void
.end method
