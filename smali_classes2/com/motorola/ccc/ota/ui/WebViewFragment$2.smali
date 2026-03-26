.class Lcom/motorola/ccc/ota/ui/WebViewFragment$2;
.super Ljava/lang/Object;
.source "WebViewFragment.java"

# interfaces
.implements Landroid/view/View$OnKeyListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/motorola/ccc/ota/ui/WebViewFragment;->onCreateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;Landroid/os/Bundle;)Landroid/view/View;
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

    iput-object p1, p0, Lcom/motorola/ccc/ota/ui/WebViewFragment$2;->this$0:Lcom/motorola/ccc/ota/ui/WebViewFragment;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onKey(Landroid/view/View;ILandroid/view/KeyEvent;)Z
    .locals 0

    const/4 p1, 0x4

    if-ne p2, p1, :cond_0

    invoke-virtual {p3}, Landroid/view/KeyEvent;->getAction()I

    move-result p1

    const/4 p2, 0x1

    if-ne p1, p2, :cond_0

    iget-object p1, p0, Lcom/motorola/ccc/ota/ui/WebViewFragment$2;->this$0:Lcom/motorola/ccc/ota/ui/WebViewFragment;

    invoke-static {p1}, Lcom/motorola/ccc/ota/ui/WebViewFragment;->-$$Nest$fgetmWebview(Lcom/motorola/ccc/ota/ui/WebViewFragment;)Landroid/webkit/WebView;

    move-result-object p1

    invoke-virtual {p1}, Landroid/webkit/WebView;->canGoBack()Z

    move-result p1

    if-eqz p1, :cond_0

    iget-object p0, p0, Lcom/motorola/ccc/ota/ui/WebViewFragment$2;->this$0:Lcom/motorola/ccc/ota/ui/WebViewFragment;

    invoke-static {p0}, Lcom/motorola/ccc/ota/ui/WebViewFragment;->-$$Nest$fgethandler(Lcom/motorola/ccc/ota/ui/WebViewFragment;)Landroid/os/Handler;

    move-result-object p0

    invoke-virtual {p0, p2}, Landroid/os/Handler;->sendEmptyMessage(I)Z

    return p2

    :cond_0
    const/4 p0, 0x0

    return p0
.end method
