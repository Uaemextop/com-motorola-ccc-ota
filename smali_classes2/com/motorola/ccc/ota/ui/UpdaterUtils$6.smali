.class Lcom/motorola/ccc/ota/ui/UpdaterUtils$6;
.super Ljava/lang/Object;
.source "UpdaterUtils.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/motorola/ccc/ota/ui/UpdaterUtils;->setOsReleaseNotes(Landroid/content/Context;Landroid/widget/TextView;Lcom/motorola/ccc/ota/ui/UpdaterUtils$UpgradeInfo;Ljava/lang/String;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic val$context:Landroid/content/Context;

.field final synthetic val$newOsURL:Ljava/lang/String;

.field final synthetic val$webViewBaseFragmentStats:Ljava/lang/String;


# direct methods
.method constructor <init>(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    iput-object p1, p0, Lcom/motorola/ccc/ota/ui/UpdaterUtils$6;->val$context:Landroid/content/Context;

    iput-object p2, p0, Lcom/motorola/ccc/ota/ui/UpdaterUtils$6;->val$newOsURL:Ljava/lang/String;

    iput-object p3, p0, Lcom/motorola/ccc/ota/ui/UpdaterUtils$6;->val$webViewBaseFragmentStats:Ljava/lang/String;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 1

    iget-object p1, p0, Lcom/motorola/ccc/ota/ui/UpdaterUtils$6;->val$context:Landroid/content/Context;

    iget-object v0, p0, Lcom/motorola/ccc/ota/ui/UpdaterUtils$6;->val$newOsURL:Ljava/lang/String;

    iget-object p0, p0, Lcom/motorola/ccc/ota/ui/UpdaterUtils$6;->val$webViewBaseFragmentStats:Ljava/lang/String;

    invoke-static {p1, v0, p0}, Lcom/motorola/ccc/ota/ui/UpdaterUtils;->displayWebViewFragment(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method
