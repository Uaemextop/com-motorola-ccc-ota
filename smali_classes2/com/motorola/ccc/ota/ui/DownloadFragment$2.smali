.class Lcom/motorola/ccc/ota/ui/DownloadFragment$2;
.super Ljava/lang/Object;
.source "DownloadFragment.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/motorola/ccc/ota/ui/DownloadFragment;->handleButtons()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/motorola/ccc/ota/ui/DownloadFragment;


# direct methods
.method constructor <init>(Lcom/motorola/ccc/ota/ui/DownloadFragment;)V
    .locals 0

    iput-object p1, p0, Lcom/motorola/ccc/ota/ui/DownloadFragment$2;->this$0:Lcom/motorola/ccc/ota/ui/DownloadFragment;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 0

    iget-object p0, p0, Lcom/motorola/ccc/ota/ui/DownloadFragment$2;->this$0:Lcom/motorola/ccc/ota/ui/DownloadFragment;

    const-string p1, "userInitiated"

    invoke-virtual {p0, p1}, Lcom/motorola/ccc/ota/ui/DownloadFragment;->handleDownloadOption(Ljava/lang/String;)V

    return-void
.end method
