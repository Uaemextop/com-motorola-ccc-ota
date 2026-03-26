.class Lcom/motorola/ccc/ota/stats/StatsListener$StatsBuilderBroadcastReceiver$1;
.super Ljava/lang/Object;
.source "StatsListener.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/motorola/ccc/ota/stats/StatsListener$StatsBuilderBroadcastReceiver;->onReceive(Landroid/content/Context;Landroid/content/Intent;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Lcom/motorola/ccc/ota/stats/StatsListener$StatsBuilderBroadcastReceiver;

.field final synthetic val$context:Landroid/content/Context;

.field final synthetic val$intent:Landroid/content/Intent;


# direct methods
.method constructor <init>(Lcom/motorola/ccc/ota/stats/StatsListener$StatsBuilderBroadcastReceiver;Landroid/content/Context;Landroid/content/Intent;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    iput-object p1, p0, Lcom/motorola/ccc/ota/stats/StatsListener$StatsBuilderBroadcastReceiver$1;->this$1:Lcom/motorola/ccc/ota/stats/StatsListener$StatsBuilderBroadcastReceiver;

    iput-object p2, p0, Lcom/motorola/ccc/ota/stats/StatsListener$StatsBuilderBroadcastReceiver$1;->val$context:Landroid/content/Context;

    iput-object p3, p0, Lcom/motorola/ccc/ota/stats/StatsListener$StatsBuilderBroadcastReceiver$1;->val$intent:Landroid/content/Intent;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 2

    iget-object v0, p0, Lcom/motorola/ccc/ota/stats/StatsListener$StatsBuilderBroadcastReceiver$1;->this$1:Lcom/motorola/ccc/ota/stats/StatsListener$StatsBuilderBroadcastReceiver;

    iget-object v1, p0, Lcom/motorola/ccc/ota/stats/StatsListener$StatsBuilderBroadcastReceiver$1;->val$context:Landroid/content/Context;

    iget-object p0, p0, Lcom/motorola/ccc/ota/stats/StatsListener$StatsBuilderBroadcastReceiver$1;->val$intent:Landroid/content/Intent;

    invoke-virtual {v0, v1, p0}, Lcom/motorola/ccc/ota/stats/StatsListener$StatsBuilderBroadcastReceiver;->handleIntent(Landroid/content/Context;Landroid/content/Intent;)V

    return-void
.end method
