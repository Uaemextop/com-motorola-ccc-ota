.class Lcom/motorola/ccc/ota/ui/AdvNoticeFragment$1;
.super Ljava/lang/Object;
.source "AdvNoticeFragment.java"

# interfaces
.implements Lcom/bumptech/glide/request/RequestListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/motorola/ccc/ota/ui/AdvNoticeFragment;->downloadImage()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Lcom/bumptech/glide/request/RequestListener<",
        "Ljava/lang/String;",
        "Lcom/bumptech/glide/load/resource/drawable/GlideDrawable;",
        ">;"
    }
.end annotation


# instance fields
.field final synthetic this$0:Lcom/motorola/ccc/ota/ui/AdvNoticeFragment;


# direct methods
.method constructor <init>(Lcom/motorola/ccc/ota/ui/AdvNoticeFragment;)V
    .locals 0

    iput-object p1, p0, Lcom/motorola/ccc/ota/ui/AdvNoticeFragment$1;->this$0:Lcom/motorola/ccc/ota/ui/AdvNoticeFragment;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public bridge synthetic onException(Ljava/lang/Exception;Ljava/lang/Object;Lcom/bumptech/glide/request/target/Target;Z)Z
    .locals 0

    check-cast p2, Ljava/lang/String;

    invoke-virtual {p0, p1, p2, p3, p4}, Lcom/motorola/ccc/ota/ui/AdvNoticeFragment$1;->onException(Ljava/lang/Exception;Ljava/lang/String;Lcom/bumptech/glide/request/target/Target;Z)Z

    move-result p0

    return p0
.end method

.method public onException(Ljava/lang/Exception;Ljava/lang/String;Lcom/bumptech/glide/request/target/Target;Z)Z
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Exception;",
            "Ljava/lang/String;",
            "Lcom/bumptech/glide/request/target/Target<",
            "Lcom/bumptech/glide/load/resource/drawable/GlideDrawable;",
            ">;Z)Z"
        }
    .end annotation

    const-string p1, "OtaApp"

    const-string p2, "downloadImage.onException"

    invoke-static {p1, p2}, Lcom/motorola/ccc/ota/utils/Logger;->debug(Ljava/lang/String;Ljava/lang/String;)V

    iget-object p1, p0, Lcom/motorola/ccc/ota/ui/AdvNoticeFragment$1;->this$0:Lcom/motorola/ccc/ota/ui/AdvNoticeFragment;

    invoke-static {p1}, Lcom/motorola/ccc/ota/ui/AdvNoticeFragment;->-$$Nest$fgetbtnDone(Lcom/motorola/ccc/ota/ui/AdvNoticeFragment;)Landroid/widget/Button;

    move-result-object p1

    const/16 p2, 0x8

    invoke-virtual {p1, p2}, Landroid/widget/Button;->setVisibility(I)V

    iget-object p1, p0, Lcom/motorola/ccc/ota/ui/AdvNoticeFragment$1;->this$0:Lcom/motorola/ccc/ota/ui/AdvNoticeFragment;

    invoke-static {p1}, Lcom/motorola/ccc/ota/ui/AdvNoticeFragment;->-$$Nest$fgetmProgressBar(Lcom/motorola/ccc/ota/ui/AdvNoticeFragment;)Landroid/widget/ProgressBar;

    move-result-object p1

    invoke-virtual {p1, p2}, Landroid/widget/ProgressBar;->setVisibility(I)V

    iget-object p0, p0, Lcom/motorola/ccc/ota/ui/AdvNoticeFragment$1;->this$0:Lcom/motorola/ccc/ota/ui/AdvNoticeFragment;

    invoke-static {p0}, Lcom/motorola/ccc/ota/ui/AdvNoticeFragment;->-$$Nest$mshowUptoDateScreen(Lcom/motorola/ccc/ota/ui/AdvNoticeFragment;)V

    const/4 p0, 0x0

    return p0
.end method

.method public onResourceReady(Lcom/bumptech/glide/load/resource/drawable/GlideDrawable;Ljava/lang/String;Lcom/bumptech/glide/request/target/Target;ZZ)Z
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/bumptech/glide/load/resource/drawable/GlideDrawable;",
            "Ljava/lang/String;",
            "Lcom/bumptech/glide/request/target/Target<",
            "Lcom/bumptech/glide/load/resource/drawable/GlideDrawable;",
            ">;ZZ)Z"
        }
    .end annotation

    iget-object p1, p0, Lcom/motorola/ccc/ota/ui/AdvNoticeFragment$1;->this$0:Lcom/motorola/ccc/ota/ui/AdvNoticeFragment;

    invoke-static {p1}, Lcom/motorola/ccc/ota/ui/AdvNoticeFragment;->-$$Nest$fgetmProgressBar(Lcom/motorola/ccc/ota/ui/AdvNoticeFragment;)Landroid/widget/ProgressBar;

    move-result-object p1

    const/16 p2, 0x8

    invoke-virtual {p1, p2}, Landroid/widget/ProgressBar;->setVisibility(I)V

    iget-object p0, p0, Lcom/motorola/ccc/ota/ui/AdvNoticeFragment$1;->this$0:Lcom/motorola/ccc/ota/ui/AdvNoticeFragment;

    invoke-static {p0}, Lcom/motorola/ccc/ota/ui/AdvNoticeFragment;->-$$Nest$fgetbtnDone(Lcom/motorola/ccc/ota/ui/AdvNoticeFragment;)Landroid/widget/Button;

    move-result-object p0

    const/4 p1, 0x0

    invoke-virtual {p0, p1}, Landroid/widget/Button;->setVisibility(I)V

    return p1
.end method

.method public bridge synthetic onResourceReady(Ljava/lang/Object;Ljava/lang/Object;Lcom/bumptech/glide/request/target/Target;ZZ)Z
    .locals 0

    check-cast p1, Lcom/bumptech/glide/load/resource/drawable/GlideDrawable;

    check-cast p2, Ljava/lang/String;

    invoke-virtual/range {p0 .. p5}, Lcom/motorola/ccc/ota/ui/AdvNoticeFragment$1;->onResourceReady(Lcom/bumptech/glide/load/resource/drawable/GlideDrawable;Ljava/lang/String;Lcom/bumptech/glide/request/target/Target;ZZ)Z

    move-result p0

    return p0
.end method
