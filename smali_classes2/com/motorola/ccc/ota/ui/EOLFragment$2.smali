.class Lcom/motorola/ccc/ota/ui/EOLFragment$2;
.super Ljava/lang/Object;
.source "EOLFragment.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/motorola/ccc/ota/ui/EOLFragment;->onActivityCreated(Landroid/os/Bundle;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/motorola/ccc/ota/ui/EOLFragment;


# direct methods
.method constructor <init>(Lcom/motorola/ccc/ota/ui/EOLFragment;)V
    .locals 0

    iput-object p1, p0, Lcom/motorola/ccc/ota/ui/EOLFragment$2;->this$0:Lcom/motorola/ccc/ota/ui/EOLFragment;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 0

    iget-object p0, p0, Lcom/motorola/ccc/ota/ui/EOLFragment$2;->this$0:Lcom/motorola/ccc/ota/ui/EOLFragment;

    invoke-static {p0}, Lcom/motorola/ccc/ota/ui/EOLFragment;->-$$Nest$msendIntentToWebsite(Lcom/motorola/ccc/ota/ui/EOLFragment;)V

    return-void
.end method
