.class Lcom/motorola/ccc/ota/installer/updaterEngine/download/UEDownloadRetry$1;
.super Ljava/lang/Object;
.source "UEDownloadRetry.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/motorola/ccc/ota/installer/updaterEngine/download/UEDownloadRetry;->handleRetry(ILjava/lang/String;)Z
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/motorola/ccc/ota/installer/updaterEngine/download/UEDownloadRetry;

.field final synthetic val$errorCode:I

.field final synthetic val$fetchNewUrl:Ljava/lang/Boolean;

.field final synthetic val$mVersion:Ljava/lang/String;

.field final synthetic val$retryReason:Ljava/lang/String;


# direct methods
.method constructor <init>(Lcom/motorola/ccc/ota/installer/updaterEngine/download/UEDownloadRetry;Ljava/lang/String;Ljava/lang/Boolean;Ljava/lang/String;I)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    iput-object p1, p0, Lcom/motorola/ccc/ota/installer/updaterEngine/download/UEDownloadRetry$1;->this$0:Lcom/motorola/ccc/ota/installer/updaterEngine/download/UEDownloadRetry;

    iput-object p2, p0, Lcom/motorola/ccc/ota/installer/updaterEngine/download/UEDownloadRetry$1;->val$retryReason:Ljava/lang/String;

    iput-object p3, p0, Lcom/motorola/ccc/ota/installer/updaterEngine/download/UEDownloadRetry$1;->val$fetchNewUrl:Ljava/lang/Boolean;

    iput-object p4, p0, Lcom/motorola/ccc/ota/installer/updaterEngine/download/UEDownloadRetry$1;->val$mVersion:Ljava/lang/String;

    iput p5, p0, Lcom/motorola/ccc/ota/installer/updaterEngine/download/UEDownloadRetry$1;->val$errorCode:I

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 5

    invoke-static {}, Lcom/motorola/ccc/ota/installer/updaterEngine/download/UEDownloadRetry;->-$$Nest$sfgetsettings()Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    move-result-object v0

    sget-object v1, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->OTA_DOWNLOAD_RETRY_ATTEMPTS:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    invoke-virtual {v0, v1}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->incrementPrefs(Lcom/motorola/otalib/common/settings/ISetting;)V

    invoke-static {}, Lcom/motorola/ccc/ota/installer/updaterEngine/download/UEDownloadRetry;->-$$Nest$sfgetsettings()Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    move-result-object v0

    sget-object v1, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->OTA_GET_DESCRIPTOR_REASON:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    iget-object v2, p0, Lcom/motorola/ccc/ota/installer/updaterEngine/download/UEDownloadRetry$1;->val$retryReason:Ljava/lang/String;

    invoke-virtual {v0, v1, v2}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->setString(Lcom/motorola/otalib/common/settings/ISetting;Ljava/lang/String;)V

    iget-object v0, p0, Lcom/motorola/ccc/ota/installer/updaterEngine/download/UEDownloadRetry$1;->val$fetchNewUrl:Ljava/lang/Boolean;

    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    const/4 v1, 0x0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/motorola/ccc/ota/installer/updaterEngine/download/UEDownloadRetry$1;->this$0:Lcom/motorola/ccc/ota/installer/updaterEngine/download/UEDownloadRetry;

    invoke-static {v0}, Lcom/motorola/ccc/ota/installer/updaterEngine/download/UEDownloadRetry;->-$$Nest$fgetcontext(Lcom/motorola/ccc/ota/installer/updaterEngine/download/UEDownloadRetry;)Landroid/content/Context;

    move-result-object v0

    iget-object v2, p0, Lcom/motorola/ccc/ota/installer/updaterEngine/download/UEDownloadRetry$1;->val$mVersion:Ljava/lang/String;

    new-instance v3, Ljava/lang/StringBuilder;

    const-string v4, "encountered errorCode "

    invoke-direct {v3, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget p0, p0, Lcom/motorola/ccc/ota/installer/updaterEngine/download/UEDownloadRetry$1;->val$errorCode:I

    invoke-virtual {v3, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object p0

    const-string v3, "during ABApplying go and fetch new download url"

    invoke-virtual {p0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-static {v0, v2, p0, v1}, Lcom/motorola/ccc/ota/env/CusAndroidUtils;->sendGetDescriptor(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Z)V

    goto :goto_0

    :cond_0
    new-instance p0, Landroid/content/Intent;

    const-string v0, "com.motorola.ccc.ota.RUN_STATE_MACHINE"

    invoke-direct {p0, v0}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    invoke-static {}, Lcom/motorola/ccc/ota/env/OtaApplication;->getGlobalContext()Landroid/content/Context;

    move-result-object v0

    const-string v2, "com.motorola.ccc.ota.Permissions.INTERACT_OTA_SERVICE"

    invoke-virtual {v0, p0, v2}, Landroid/content/Context;->sendBroadcast(Landroid/content/Intent;Ljava/lang/String;)V

    :goto_0
    invoke-static {v1}, Lcom/motorola/ccc/ota/installer/updaterEngine/download/UEDownloadRetry;->-$$Nest$sfputmRetryPending(Z)V

    return-void
.end method
