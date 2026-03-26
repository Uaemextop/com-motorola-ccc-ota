.class Lcom/motorola/ccc/ota/sources/bota/download/error/ResetSMToGettingDescriptor$1;
.super Ljava/lang/Object;
.source "ResetSMToGettingDescriptor.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/motorola/ccc/ota/sources/bota/download/error/ResetSMToGettingDescriptor;->shouldRetry(Ljava/lang/String;ZLjava/lang/String;)Z
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/motorola/ccc/ota/sources/bota/download/error/ResetSMToGettingDescriptor;

.field final synthetic val$reason:Ljava/lang/String;

.field final synthetic val$report:Z


# direct methods
.method constructor <init>(Lcom/motorola/ccc/ota/sources/bota/download/error/ResetSMToGettingDescriptor;Ljava/lang/String;Z)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    iput-object p1, p0, Lcom/motorola/ccc/ota/sources/bota/download/error/ResetSMToGettingDescriptor$1;->this$0:Lcom/motorola/ccc/ota/sources/bota/download/error/ResetSMToGettingDescriptor;

    iput-object p2, p0, Lcom/motorola/ccc/ota/sources/bota/download/error/ResetSMToGettingDescriptor$1;->val$reason:Ljava/lang/String;

    iput-boolean p3, p0, Lcom/motorola/ccc/ota/sources/bota/download/error/ResetSMToGettingDescriptor$1;->val$report:Z

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 4

    const/4 v0, 0x0

    invoke-static {v0}, Lcom/motorola/ccc/ota/sources/bota/download/error/ResetSMToGettingDescriptor;->-$$Nest$sfputmRetryPending(Z)V

    iget-object v0, p0, Lcom/motorola/ccc/ota/sources/bota/download/error/ResetSMToGettingDescriptor$1;->this$0:Lcom/motorola/ccc/ota/sources/bota/download/error/ResetSMToGettingDescriptor;

    invoke-static {v0}, Lcom/motorola/ccc/ota/sources/bota/download/error/ResetSMToGettingDescriptor;->-$$Nest$fgetsettings(Lcom/motorola/ccc/ota/sources/bota/download/error/ResetSMToGettingDescriptor;)Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    move-result-object v0

    sget-object v1, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->OTA_GET_DESCRIPTOR_REASON:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    iget-object v2, p0, Lcom/motorola/ccc/ota/sources/bota/download/error/ResetSMToGettingDescriptor$1;->this$0:Lcom/motorola/ccc/ota/sources/bota/download/error/ResetSMToGettingDescriptor;

    invoke-static {v2}, Lcom/motorola/ccc/ota/sources/bota/download/error/ResetSMToGettingDescriptor;->-$$Nest$fgeterrorTitle(Lcom/motorola/ccc/ota/sources/bota/download/error/ResetSMToGettingDescriptor;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->setString(Lcom/motorola/otalib/common/settings/ISetting;Ljava/lang/String;)V

    iget-object v0, p0, Lcom/motorola/ccc/ota/sources/bota/download/error/ResetSMToGettingDescriptor$1;->this$0:Lcom/motorola/ccc/ota/sources/bota/download/error/ResetSMToGettingDescriptor;

    invoke-static {v0}, Lcom/motorola/ccc/ota/sources/bota/download/error/ResetSMToGettingDescriptor;->-$$Nest$fgetctx(Lcom/motorola/ccc/ota/sources/bota/download/error/ResetSMToGettingDescriptor;)Landroid/content/Context;

    move-result-object v0

    iget-object v1, p0, Lcom/motorola/ccc/ota/sources/bota/download/error/ResetSMToGettingDescriptor$1;->this$0:Lcom/motorola/ccc/ota/sources/bota/download/error/ResetSMToGettingDescriptor;

    invoke-static {v1}, Lcom/motorola/ccc/ota/sources/bota/download/error/ResetSMToGettingDescriptor;->-$$Nest$fgetversion(Lcom/motorola/ccc/ota/sources/bota/download/error/ResetSMToGettingDescriptor;)Ljava/lang/String;

    move-result-object v1

    new-instance v2, Ljava/lang/StringBuilder;

    const-string v3, "encountered errorCode "

    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v3, p0, Lcom/motorola/ccc/ota/sources/bota/download/error/ResetSMToGettingDescriptor$1;->val$reason:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, " go and fetch new download url"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    iget-boolean p0, p0, Lcom/motorola/ccc/ota/sources/bota/download/error/ResetSMToGettingDescriptor$1;->val$report:Z

    invoke-static {v0, v1, v2, p0}, Lcom/motorola/ccc/ota/env/CusAndroidUtils;->sendGetDescriptor(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Z)V

    return-void
.end method
