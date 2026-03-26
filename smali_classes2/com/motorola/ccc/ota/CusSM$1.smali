.class Lcom/motorola/ccc/ota/CusSM$1;
.super Ljava/lang/Object;
.source "CusSM.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/motorola/ccc/ota/CusSM;->onIntentLaunchUpgrade(Ljava/lang/String;ZZLjava/lang/String;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/motorola/ccc/ota/CusSM;

.field final synthetic val$context:Landroid/content/Context;

.field final synthetic val$toastMsg:Ljava/lang/String;


# direct methods
.method constructor <init>(Lcom/motorola/ccc/ota/CusSM;Landroid/content/Context;Ljava/lang/String;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    iput-object p1, p0, Lcom/motorola/ccc/ota/CusSM$1;->this$0:Lcom/motorola/ccc/ota/CusSM;

    iput-object p2, p0, Lcom/motorola/ccc/ota/CusSM$1;->val$context:Landroid/content/Context;

    iput-object p3, p0, Lcom/motorola/ccc/ota/CusSM$1;->val$toastMsg:Ljava/lang/String;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 2

    iget-object v0, p0, Lcom/motorola/ccc/ota/CusSM$1;->val$context:Landroid/content/Context;

    iget-object p0, p0, Lcom/motorola/ccc/ota/CusSM$1;->val$toastMsg:Ljava/lang/String;

    const/4 v1, 0x1

    invoke-static {v0, p0, v1}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object p0

    invoke-virtual {p0}, Landroid/widget/Toast;->show()V

    return-void
.end method
