.class Lcom/motorola/ccc/ota/ui/FileUploadService$3;
.super Ljava/lang/Object;
.source "FileUploadService.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/motorola/ccc/ota/ui/FileUploadService;->deleteZipFilePostUpload(Z)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/motorola/ccc/ota/ui/FileUploadService;

.field final synthetic val$success:Z


# direct methods
.method constructor <init>(Lcom/motorola/ccc/ota/ui/FileUploadService;Z)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    iput-object p1, p0, Lcom/motorola/ccc/ota/ui/FileUploadService$3;->this$0:Lcom/motorola/ccc/ota/ui/FileUploadService;

    iput-boolean p2, p0, Lcom/motorola/ccc/ota/ui/FileUploadService$3;->val$success:Z

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 4

    new-instance v0, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    invoke-direct {v0}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;-><init>()V

    invoke-static {}, Lcom/motorola/ccc/ota/utils/FileUtils;->getUEZipFilePath()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Lcom/motorola/ccc/ota/utils/FileUtils;->deleteFile(Ljava/lang/String;)V

    const-string v1, "FileUploadService, deleteZipFilePostUpload"

    const-string v2, "OtaApp"

    invoke-static {v2, v1}, Lcom/motorola/ccc/ota/utils/Logger;->debug(Ljava/lang/String;Ljava/lang/String;)V

    iget-boolean p0, p0, Lcom/motorola/ccc/ota/ui/FileUploadService$3;->val$success:Z

    if-eqz p0, :cond_0

    const-string p0, "FileUploadService, Successfully uploaded update engine log file to server"

    invoke-static {v2, p0}, Lcom/motorola/ccc/ota/utils/Logger;->debug(Ljava/lang/String;Ljava/lang/String;)V

    new-instance p0, Ljava/lang/StringBuilder;

    const-string v1, "FileUploadService: post upload,  LOG_FILE_UPLOAD_COUNT_TODAY:"

    invoke-direct {p0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    sget-object v1, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->LOG_FILE_UPLOAD_COUNT_TODAY:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    const-string v3, "0"

    invoke-virtual {v0, v1, v3}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->getConfig(Lcom/motorola/otalib/common/settings/ISetting;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p0

    const-string v1, " & LOG_FILE_UPLOAD_TIME:"

    invoke-virtual {p0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p0

    sget-object v1, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->PREV_LOG_FILE_UPLOAD_TIME:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    const-string v3, ""

    invoke-virtual {v0, v1, v3}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->getConfig(Lcom/motorola/otalib/common/settings/ISetting;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-static {v2, p0}, Lcom/motorola/ccc/ota/utils/Logger;->debug(Ljava/lang/String;Ljava/lang/String;)V

    :cond_0
    return-void
.end method
