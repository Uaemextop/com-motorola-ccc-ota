.class Lcom/motorola/ccc/ota/ui/BackgroundInstallationFragment$4;
.super Ljava/lang/Object;
.source "BackgroundInstallationFragment.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/motorola/ccc/ota/ui/BackgroundInstallationFragment;->handleButtons()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/motorola/ccc/ota/ui/BackgroundInstallationFragment;


# direct methods
.method constructor <init>(Lcom/motorola/ccc/ota/ui/BackgroundInstallationFragment;)V
    .locals 0

    iput-object p1, p0, Lcom/motorola/ccc/ota/ui/BackgroundInstallationFragment$4;->this$0:Lcom/motorola/ccc/ota/ui/BackgroundInstallationFragment;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 1

    new-instance p1, Landroid/content/Intent;

    invoke-direct {p1}, Landroid/content/Intent;-><init>()V

    const-string v0, "android.settings.WIFI_SETTINGS"

    invoke-virtual {p1, v0}, Landroid/content/Intent;->setAction(Ljava/lang/String;)Landroid/content/Intent;

    iget-object p0, p0, Lcom/motorola/ccc/ota/ui/BackgroundInstallationFragment$4;->this$0:Lcom/motorola/ccc/ota/ui/BackgroundInstallationFragment;

    invoke-static {p0}, Lcom/motorola/ccc/ota/ui/BackgroundInstallationFragment;->-$$Nest$fgetcontext(Lcom/motorola/ccc/ota/ui/BackgroundInstallationFragment;)Landroid/content/Context;

    move-result-object p0

    invoke-virtual {p0, p1}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    return-void
.end method
