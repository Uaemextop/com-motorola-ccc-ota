.class Lcom/motorola/ccc/ota/ui/MessageActivity$2;
.super Landroid/content/BroadcastReceiver;
.source "MessageActivity.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/motorola/ccc/ota/ui/MessageActivity;
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

    iput-object p1, p0, Lcom/motorola/ccc/ota/ui/MessageActivity$2;->this$0:Lcom/motorola/ccc/ota/ui/MessageActivity;

    invoke-direct {p0}, Landroid/content/BroadcastReceiver;-><init>()V

    return-void
.end method


# virtual methods
.method public onReceive(Landroid/content/Context;Landroid/content/Intent;)V
    .locals 0

    invoke-virtual {p2}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object p1

    const-string p2, "com.motorola.ccc.ota.ui.finish_message_activity"

    invoke-virtual {p2, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_0

    iget-object p0, p0, Lcom/motorola/ccc/ota/ui/MessageActivity$2;->this$0:Lcom/motorola/ccc/ota/ui/MessageActivity;

    invoke-virtual {p0}, Lcom/motorola/ccc/ota/ui/MessageActivity;->finish()V

    :cond_0
    return-void
.end method
