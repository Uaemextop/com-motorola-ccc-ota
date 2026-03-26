.class Lcom/motorola/ccc/ota/ui/MessageActivity$1;
.super Landroid/content/BroadcastReceiver;
.source "MessageActivity.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/motorola/ccc/ota/ui/MessageActivity;->handleLowMemory()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/motorola/ccc/ota/ui/MessageActivity;


# direct methods
.method constructor <init>(Lcom/motorola/ccc/ota/ui/MessageActivity;)V
    .locals 0

    iput-object p1, p0, Lcom/motorola/ccc/ota/ui/MessageActivity$1;->this$0:Lcom/motorola/ccc/ota/ui/MessageActivity;

    invoke-direct {p0}, Landroid/content/BroadcastReceiver;-><init>()V

    return-void
.end method


# virtual methods
.method public onReceive(Landroid/content/Context;Landroid/content/Intent;)V
    .locals 0

    const-string p1, "reason"

    invoke-virtual {p2, p1}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    if-eqz p1, :cond_1

    const-string p2, "homekey"

    invoke-virtual {p2, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p2

    if-nez p2, :cond_0

    const-string p2, "recentapps"

    invoke-virtual {p2, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_1

    :cond_0
    const-string p1, "OtaApp"

    const-string p2, "MessageActivity.onCreate, home/recent app key pressed."

    invoke-static {p1, p2}, Lcom/motorola/ccc/ota/utils/Logger;->debug(Ljava/lang/String;Ljava/lang/String;)V

    iget-object p0, p0, Lcom/motorola/ccc/ota/ui/MessageActivity$1;->this$0:Lcom/motorola/ccc/ota/ui/MessageActivity;

    invoke-virtual {p0}, Lcom/motorola/ccc/ota/ui/MessageActivity;->finish()V

    :cond_1
    return-void
.end method
