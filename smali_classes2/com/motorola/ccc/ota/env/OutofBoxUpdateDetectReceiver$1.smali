.class Lcom/motorola/ccc/ota/env/OutofBoxUpdateDetectReceiver$1;
.super Ljava/lang/Object;
.source "OutofBoxUpdateDetectReceiver.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/motorola/ccc/ota/env/OutofBoxUpdateDetectReceiver;->onReceive(Landroid/content/Context;Landroid/content/Intent;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/motorola/ccc/ota/env/OutofBoxUpdateDetectReceiver;

.field final synthetic val$c:Landroid/content/Context;

.field final synthetic val$i:Landroid/content/Intent;


# direct methods
.method constructor <init>(Lcom/motorola/ccc/ota/env/OutofBoxUpdateDetectReceiver;Landroid/content/Context;Landroid/content/Intent;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    iput-object p1, p0, Lcom/motorola/ccc/ota/env/OutofBoxUpdateDetectReceiver$1;->this$0:Lcom/motorola/ccc/ota/env/OutofBoxUpdateDetectReceiver;

    iput-object p2, p0, Lcom/motorola/ccc/ota/env/OutofBoxUpdateDetectReceiver$1;->val$c:Landroid/content/Context;

    iput-object p3, p0, Lcom/motorola/ccc/ota/env/OutofBoxUpdateDetectReceiver$1;->val$i:Landroid/content/Intent;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 3

    iget-object v0, p0, Lcom/motorola/ccc/ota/env/OutofBoxUpdateDetectReceiver$1;->this$0:Lcom/motorola/ccc/ota/env/OutofBoxUpdateDetectReceiver;

    iget-object v1, p0, Lcom/motorola/ccc/ota/env/OutofBoxUpdateDetectReceiver$1;->val$c:Landroid/content/Context;

    iget-object p0, p0, Lcom/motorola/ccc/ota/env/OutofBoxUpdateDetectReceiver$1;->val$i:Landroid/content/Intent;

    invoke-static {v0}, Lcom/motorola/ccc/ota/env/OutofBoxUpdateDetectReceiver;->-$$Nest$fgetsettings(Lcom/motorola/ccc/ota/env/OutofBoxUpdateDetectReceiver;)Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    move-result-object v2

    invoke-static {v0, v1, p0, v2}, Lcom/motorola/ccc/ota/env/OutofBoxUpdateDetectReceiver;->-$$Nest$mhandleIntent(Lcom/motorola/ccc/ota/env/OutofBoxUpdateDetectReceiver;Landroid/content/Context;Landroid/content/Intent;Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;)V

    return-void
.end method
