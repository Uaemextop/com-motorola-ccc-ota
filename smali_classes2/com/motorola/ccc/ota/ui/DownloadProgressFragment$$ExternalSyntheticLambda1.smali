.class public final synthetic Lcom/motorola/ccc/ota/ui/DownloadProgressFragment$$ExternalSyntheticLambda1;
.super Ljava/lang/Object;
.source "D8$$SyntheticClass"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic f$0:Landroid/content/Context;


# direct methods
.method public synthetic constructor <init>(Landroid/content/Context;)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/motorola/ccc/ota/ui/DownloadProgressFragment$$ExternalSyntheticLambda1;->f$0:Landroid/content/Context;

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .locals 0

    iget-object p0, p0, Lcom/motorola/ccc/ota/ui/DownloadProgressFragment$$ExternalSyntheticLambda1;->f$0:Landroid/content/Context;

    invoke-static {p0, p1}, Lcom/motorola/ccc/ota/ui/DownloadProgressFragment;->lambda$addCancelConfirmDialog$1(Landroid/content/Context;Landroid/view/View;)V

    return-void
.end method
