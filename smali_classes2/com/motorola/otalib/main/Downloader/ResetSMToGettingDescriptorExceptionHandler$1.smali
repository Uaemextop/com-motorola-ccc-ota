.class Lcom/motorola/otalib/main/Downloader/ResetSMToGettingDescriptorExceptionHandler$1;
.super Ljava/lang/Object;
.source "ResetSMToGettingDescriptorExceptionHandler.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/motorola/otalib/main/Downloader/ResetSMToGettingDescriptorExceptionHandler;->handleException(Ljava/lang/String;Ljava/lang/String;ZLjava/lang/String;)Z
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/motorola/otalib/main/Downloader/ResetSMToGettingDescriptorExceptionHandler;

.field final synthetic val$reason:Ljava/lang/String;

.field final synthetic val$report:Z

.field final synthetic val$retryCount:I


# direct methods
.method constructor <init>(Lcom/motorola/otalib/main/Downloader/ResetSMToGettingDescriptorExceptionHandler;ILjava/lang/String;Z)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    iput-object p1, p0, Lcom/motorola/otalib/main/Downloader/ResetSMToGettingDescriptorExceptionHandler$1;->this$0:Lcom/motorola/otalib/main/Downloader/ResetSMToGettingDescriptorExceptionHandler;

    iput p2, p0, Lcom/motorola/otalib/main/Downloader/ResetSMToGettingDescriptorExceptionHandler$1;->val$retryCount:I

    iput-object p3, p0, Lcom/motorola/otalib/main/Downloader/ResetSMToGettingDescriptorExceptionHandler$1;->val$reason:Ljava/lang/String;

    iput-boolean p4, p0, Lcom/motorola/otalib/main/Downloader/ResetSMToGettingDescriptorExceptionHandler$1;->val$report:Z

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 4

    iget v0, p0, Lcom/motorola/otalib/main/Downloader/ResetSMToGettingDescriptorExceptionHandler$1;->val$retryCount:I

    const-string v1, "ResetSMToGettingDescriptorExceptionHandler.handleException, encountered exception "

    if-lez v0, :cond_0

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v1, p0, Lcom/motorola/otalib/main/Downloader/ResetSMToGettingDescriptorExceptionHandler$1;->val$reason:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, " go and fetch new download url"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    sget-object v1, Lcom/motorola/otalib/main/Logger;->OTALib_TAG:Ljava/lang/String;

    invoke-static {v1, v0}, Lcom/motorola/otalib/main/Logger;->info(Ljava/lang/String;Ljava/lang/String;)V

    const/4 v1, 0x0

    invoke-static {v1}, Lcom/motorola/otalib/main/Downloader/ResetSMToGettingDescriptorExceptionHandler;->access$002(Z)Z

    iget-object v1, p0, Lcom/motorola/otalib/main/Downloader/ResetSMToGettingDescriptorExceptionHandler$1;->this$0:Lcom/motorola/otalib/main/Downloader/ResetSMToGettingDescriptorExceptionHandler;

    invoke-static {v1}, Lcom/motorola/otalib/main/Downloader/ResetSMToGettingDescriptorExceptionHandler;->access$300(Lcom/motorola/otalib/main/Downloader/ResetSMToGettingDescriptorExceptionHandler;)Lcom/motorola/otalib/main/LibCussm;

    move-result-object v1

    iget-object v2, p0, Lcom/motorola/otalib/main/Downloader/ResetSMToGettingDescriptorExceptionHandler$1;->this$0:Lcom/motorola/otalib/main/Downloader/ResetSMToGettingDescriptorExceptionHandler;

    invoke-static {v2}, Lcom/motorola/otalib/main/Downloader/ResetSMToGettingDescriptorExceptionHandler;->access$100(Lcom/motorola/otalib/main/Downloader/ResetSMToGettingDescriptorExceptionHandler;)Landroid/content/Context;

    move-result-object v2

    iget-object v3, p0, Lcom/motorola/otalib/main/Downloader/ResetSMToGettingDescriptorExceptionHandler$1;->this$0:Lcom/motorola/otalib/main/Downloader/ResetSMToGettingDescriptorExceptionHandler;

    invoke-static {v3}, Lcom/motorola/otalib/main/Downloader/ResetSMToGettingDescriptorExceptionHandler;->access$200(Lcom/motorola/otalib/main/Downloader/ResetSMToGettingDescriptorExceptionHandler;)Ljava/lang/String;

    move-result-object v3

    iget-boolean p0, p0, Lcom/motorola/otalib/main/Downloader/ResetSMToGettingDescriptorExceptionHandler$1;->val$report:Z

    invoke-virtual {v1, v2, v3, p0, v0}, Lcom/motorola/otalib/main/LibCussm;->onActionGetDescriptor(Landroid/content/Context;Ljava/lang/String;ZLjava/lang/String;)V

    goto :goto_0

    :cond_0
    sget-object v0, Lcom/motorola/otalib/main/Logger;->OTALib_TAG:Ljava/lang/String;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v1, p0, Lcom/motorola/otalib/main/Downloader/ResetSMToGettingDescriptorExceptionHandler$1;->val$reason:Ljava/lang/String;

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " but retryCount "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget p0, p0, Lcom/motorola/otalib/main/Downloader/ResetSMToGettingDescriptorExceptionHandler$1;->val$retryCount:I

    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object p0

    const-string v1, "so drop this to floor"

    invoke-virtual {p0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-static {v0, p0}, Lcom/motorola/otalib/main/Logger;->info(Ljava/lang/String;Ljava/lang/String;)V

    :goto_0
    return-void
.end method
