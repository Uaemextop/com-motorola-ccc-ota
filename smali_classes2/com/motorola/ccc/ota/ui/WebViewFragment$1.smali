.class Lcom/motorola/ccc/ota/ui/WebViewFragment$1;
.super Landroid/os/Handler;
.source "WebViewFragment.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/motorola/ccc/ota/ui/WebViewFragment;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/motorola/ccc/ota/ui/WebViewFragment;


# direct methods
.method constructor <init>(Lcom/motorola/ccc/ota/ui/WebViewFragment;)V
    .locals 0

    iput-object p1, p0, Lcom/motorola/ccc/ota/ui/WebViewFragment$1;->this$0:Lcom/motorola/ccc/ota/ui/WebViewFragment;

    invoke-direct {p0}, Landroid/os/Handler;-><init>()V

    return-void
.end method


# virtual methods
.method public handleMessage(Landroid/os/Message;)V
    .locals 1

    iget p1, p1, Landroid/os/Message;->what:I

    const/4 v0, 0x1

    if-eq p1, v0, :cond_0

    goto :goto_0

    :cond_0
    iget-object p0, p0, Lcom/motorola/ccc/ota/ui/WebViewFragment$1;->this$0:Lcom/motorola/ccc/ota/ui/WebViewFragment;

    invoke-static {p0}, Lcom/motorola/ccc/ota/ui/WebViewFragment;->-$$Nest$mwebViewGoBack(Lcom/motorola/ccc/ota/ui/WebViewFragment;)V

    :goto_0
    return-void
.end method
