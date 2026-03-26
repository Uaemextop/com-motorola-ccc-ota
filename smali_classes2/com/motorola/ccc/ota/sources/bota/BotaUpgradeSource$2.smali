.class Lcom/motorola/ccc/ota/sources/bota/BotaUpgradeSource$2;
.super Ljava/lang/Object;
.source "BotaUpgradeSource.java"

# interfaces
.implements Lcom/motorola/otalib/cdsservice/ResponseHandler;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/motorola/ccc/ota/sources/bota/BotaUpgradeSource;->checkForDownloadDescriptor(Ljava/lang/String;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/motorola/ccc/ota/sources/bota/BotaUpgradeSource;


# direct methods
.method constructor <init>(Lcom/motorola/ccc/ota/sources/bota/BotaUpgradeSource;)V
    .locals 0

    iput-object p1, p0, Lcom/motorola/ccc/ota/sources/bota/BotaUpgradeSource$2;->this$0:Lcom/motorola/ccc/ota/sources/bota/BotaUpgradeSource;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public handleResponse(Lcom/motorola/otalib/cdsservice/webdataobjects/WebResponse;)V
    .locals 1

    iget-object p0, p0, Lcom/motorola/ccc/ota/sources/bota/BotaUpgradeSource$2;->this$0:Lcom/motorola/ccc/ota/sources/bota/BotaUpgradeSource;

    invoke-static {p0}, Lcom/motorola/ccc/ota/sources/bota/BotaUpgradeSource;->-$$Nest$fgetenv(Lcom/motorola/ccc/ota/sources/bota/BotaUpgradeSource;)Lcom/motorola/otalib/common/Environment/ApplicationEnv;

    move-result-object v0

    invoke-interface {v0}, Lcom/motorola/otalib/common/Environment/ApplicationEnv;->getServices()Lcom/motorola/otalib/common/Environment/ApplicationEnv$Services;

    move-result-object v0

    invoke-interface {v0}, Lcom/motorola/otalib/common/Environment/ApplicationEnv$Services;->getDeviceSha1()Ljava/lang/String;

    move-result-object v0

    invoke-static {p0, p1, v0}, Lcom/motorola/ccc/ota/sources/bota/BotaUpgradeSource;->-$$Nest$mhandleResouresWSResponse(Lcom/motorola/ccc/ota/sources/bota/BotaUpgradeSource;Lcom/motorola/otalib/cdsservice/webdataobjects/WebResponse;Ljava/lang/String;)V

    return-void
.end method
