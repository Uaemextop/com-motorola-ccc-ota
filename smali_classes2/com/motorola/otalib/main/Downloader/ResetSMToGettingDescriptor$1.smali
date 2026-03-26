.class Lcom/motorola/otalib/main/Downloader/ResetSMToGettingDescriptor$1;
.super Ljava/lang/Object;
.source "ResetSMToGettingDescriptor.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/motorola/otalib/main/Downloader/ResetSMToGettingDescriptor;->shouldRetry(Ljava/lang/String;ZLjava/lang/String;)Z
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/motorola/otalib/main/Downloader/ResetSMToGettingDescriptor;

.field final synthetic val$reason:Ljava/lang/String;

.field final synthetic val$report:Z


# direct methods
.method constructor <init>(Lcom/motorola/otalib/main/Downloader/ResetSMToGettingDescriptor;ZLjava/lang/String;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    iput-object p1, p0, Lcom/motorola/otalib/main/Downloader/ResetSMToGettingDescriptor$1;->this$0:Lcom/motorola/otalib/main/Downloader/ResetSMToGettingDescriptor;

    iput-boolean p2, p0, Lcom/motorola/otalib/main/Downloader/ResetSMToGettingDescriptor$1;->val$report:Z

    iput-object p3, p0, Lcom/motorola/otalib/main/Downloader/ResetSMToGettingDescriptor$1;->val$reason:Ljava/lang/String;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 6

    const/4 v0, 0x0

    invoke-static {v0}, Lcom/motorola/otalib/main/Downloader/ResetSMToGettingDescriptor;->access$002(Z)Z

    iget-object v0, p0, Lcom/motorola/otalib/main/Downloader/ResetSMToGettingDescriptor$1;->this$0:Lcom/motorola/otalib/main/Downloader/ResetSMToGettingDescriptor;

    invoke-static {v0}, Lcom/motorola/otalib/main/Downloader/ResetSMToGettingDescriptor;->access$300(Lcom/motorola/otalib/main/Downloader/ResetSMToGettingDescriptor;)Lcom/motorola/otalib/main/LibCussm;

    move-result-object v0

    iget-object v1, p0, Lcom/motorola/otalib/main/Downloader/ResetSMToGettingDescriptor$1;->this$0:Lcom/motorola/otalib/main/Downloader/ResetSMToGettingDescriptor;

    invoke-static {v1}, Lcom/motorola/otalib/main/Downloader/ResetSMToGettingDescriptor;->access$100(Lcom/motorola/otalib/main/Downloader/ResetSMToGettingDescriptor;)Landroid/content/Context;

    move-result-object v1

    iget-object v2, p0, Lcom/motorola/otalib/main/Downloader/ResetSMToGettingDescriptor$1;->this$0:Lcom/motorola/otalib/main/Downloader/ResetSMToGettingDescriptor;

    invoke-static {v2}, Lcom/motorola/otalib/main/Downloader/ResetSMToGettingDescriptor;->access$200(Lcom/motorola/otalib/main/Downloader/ResetSMToGettingDescriptor;)Ljava/lang/String;

    move-result-object v2

    iget-boolean v3, p0, Lcom/motorola/otalib/main/Downloader/ResetSMToGettingDescriptor$1;->val$report:Z

    new-instance v4, Ljava/lang/StringBuilder;

    const-string v5, "encountered errorCode "

    invoke-direct {v4, v5}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object p0, p0, Lcom/motorola/otalib/main/Downloader/ResetSMToGettingDescriptor$1;->val$reason:Ljava/lang/String;

    invoke-virtual {v4, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p0

    const-string v4, " go and fetch new download url"

    invoke-virtual {p0, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-virtual {v0, v1, v2, v3, p0}, Lcom/motorola/otalib/main/LibCussm;->onActionGetDescriptor(Landroid/content/Context;Ljava/lang/String;ZLjava/lang/String;)V

    return-void
.end method
