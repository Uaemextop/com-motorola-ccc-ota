.class Lcom/motorola/ccc/ota/ui/DownloadProgressFragment$7;
.super Ljava/lang/Object;
.source "DownloadProgressFragment.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/motorola/ccc/ota/ui/DownloadProgressFragment;->handleButtons()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/motorola/ccc/ota/ui/DownloadProgressFragment;


# direct methods
.method constructor <init>(Lcom/motorola/ccc/ota/ui/DownloadProgressFragment;)V
    .locals 0

    iput-object p1, p0, Lcom/motorola/ccc/ota/ui/DownloadProgressFragment$7;->this$0:Lcom/motorola/ccc/ota/ui/DownloadProgressFragment;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 0

    iget-object p0, p0, Lcom/motorola/ccc/ota/ui/DownloadProgressFragment$7;->this$0:Lcom/motorola/ccc/ota/ui/DownloadProgressFragment;

    invoke-static {p0}, Lcom/motorola/ccc/ota/ui/DownloadProgressFragment;->-$$Nest$fgetactivity(Lcom/motorola/ccc/ota/ui/DownloadProgressFragment;)Landroid/app/Activity;

    move-result-object p0

    invoke-virtual {p0}, Landroid/app/Activity;->finish()V

    return-void
.end method
