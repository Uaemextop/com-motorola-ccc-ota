.class Lcom/motorola/ccc/ota/ui/WebViewFragment$3;
.super Landroid/webkit/WebViewClient;
.source "WebViewFragment.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/motorola/ccc/ota/ui/WebViewFragment;->fillWebViewParameters()V
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

    iput-object p1, p0, Lcom/motorola/ccc/ota/ui/WebViewFragment$3;->this$0:Lcom/motorola/ccc/ota/ui/WebViewFragment;

    invoke-direct {p0}, Landroid/webkit/WebViewClient;-><init>()V

    return-void
.end method


# virtual methods
.method public onPageCommitVisible(Landroid/webkit/WebView;Ljava/lang/String;)V
    .locals 1

    iget-object v0, p0, Lcom/motorola/ccc/ota/ui/WebViewFragment$3;->this$0:Lcom/motorola/ccc/ota/ui/WebViewFragment;

    invoke-static {v0}, Lcom/motorola/ccc/ota/ui/WebViewFragment;->-$$Nest$mdismissProgressBar(Lcom/motorola/ccc/ota/ui/WebViewFragment;)V

    invoke-super {p0, p1, p2}, Landroid/webkit/WebViewClient;->onPageCommitVisible(Landroid/webkit/WebView;Ljava/lang/String;)V

    return-void
.end method

.method public onPageFinished(Landroid/webkit/WebView;Ljava/lang/String;)V
    .locals 0

    invoke-super {p0, p1, p2}, Landroid/webkit/WebViewClient;->onPageFinished(Landroid/webkit/WebView;Ljava/lang/String;)V

    return-void
.end method

.method public onReceivedError(Landroid/webkit/WebView;Landroid/webkit/WebResourceRequest;Landroid/webkit/WebResourceError;)V
    .locals 2

    iget-object v0, p0, Lcom/motorola/ccc/ota/ui/WebViewFragment$3;->this$0:Lcom/motorola/ccc/ota/ui/WebViewFragment;

    invoke-static {v0}, Lcom/motorola/ccc/ota/ui/WebViewFragment;->-$$Nest$mdismissProgressBar(Lcom/motorola/ccc/ota/ui/WebViewFragment;)V

    const-string v0, "OtaApp"

    const-string v1, "URL recieved error"

    invoke-static {v0, v1}, Lcom/motorola/ccc/ota/utils/Logger;->debug(Ljava/lang/String;Ljava/lang/String;)V

    invoke-super {p0, p1, p2, p3}, Landroid/webkit/WebViewClient;->onReceivedError(Landroid/webkit/WebView;Landroid/webkit/WebResourceRequest;Landroid/webkit/WebResourceError;)V

    return-void
.end method

.method public shouldInterceptRequest(Landroid/webkit/WebView;Landroid/webkit/WebResourceRequest;)Landroid/webkit/WebResourceResponse;
    .locals 0

    invoke-super {p0, p1, p2}, Landroid/webkit/WebViewClient;->shouldInterceptRequest(Landroid/webkit/WebView;Landroid/webkit/WebResourceRequest;)Landroid/webkit/WebResourceResponse;

    move-result-object p0

    return-object p0
.end method

.method public shouldOverrideUrlLoading(Landroid/webkit/WebView;Landroid/webkit/WebResourceRequest;)Z
    .locals 0

    iget-object p0, p0, Lcom/motorola/ccc/ota/ui/WebViewFragment$3;->this$0:Lcom/motorola/ccc/ota/ui/WebViewFragment;

    invoke-static {p0}, Lcom/motorola/ccc/ota/ui/WebViewFragment;->-$$Nest$mshowProgressBar(Lcom/motorola/ccc/ota/ui/WebViewFragment;)V

    const/4 p0, 0x0

    return p0
.end method
