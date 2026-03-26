.class public Lcom/motorola/ccc/ota/installer/updaterEngine/download/UEDownloadRequestBuilder$NetworkDetails;
.super Ljava/lang/Object;
.source "UEDownloadRequestBuilder.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/motorola/ccc/ota/installer/updaterEngine/download/UEDownloadRequestBuilder;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "NetworkDetails"
.end annotation


# instance fields
.field private downloadUrl:Ljava/lang/String;

.field private downloadingChoices:Lcom/motorola/ccc/ota/installer/updaterEngine/download/UEDownloadRequestBuilder$DownloadingChoices;

.field private netHandler:Ljava/lang/String;

.field private networkType:Ljava/lang/String;


# direct methods
.method constructor <init>(Lcom/motorola/ccc/ota/installer/updaterEngine/download/UEDownloadRequestBuilder$DownloadingChoices;)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/motorola/ccc/ota/installer/updaterEngine/download/UEDownloadRequestBuilder$NetworkDetails;->downloadingChoices:Lcom/motorola/ccc/ota/installer/updaterEngine/download/UEDownloadRequestBuilder$DownloadingChoices;

    return-void
.end method

.method constructor <init>(Ljava/lang/String;Ljava/lang/String;Lcom/motorola/ccc/ota/installer/updaterEngine/download/UEDownloadRequestBuilder$DownloadingChoices;Ljava/lang/String;)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p3, p0, Lcom/motorola/ccc/ota/installer/updaterEngine/download/UEDownloadRequestBuilder$NetworkDetails;->downloadingChoices:Lcom/motorola/ccc/ota/installer/updaterEngine/download/UEDownloadRequestBuilder$DownloadingChoices;

    iput-object p1, p0, Lcom/motorola/ccc/ota/installer/updaterEngine/download/UEDownloadRequestBuilder$NetworkDetails;->downloadUrl:Ljava/lang/String;

    iput-object p4, p0, Lcom/motorola/ccc/ota/installer/updaterEngine/download/UEDownloadRequestBuilder$NetworkDetails;->netHandler:Ljava/lang/String;

    iput-object p2, p0, Lcom/motorola/ccc/ota/installer/updaterEngine/download/UEDownloadRequestBuilder$NetworkDetails;->networkType:Ljava/lang/String;

    return-void
.end method

.method public static buildAndReturnNetworkDetails(Lcom/motorola/ccc/ota/installer/updaterEngine/download/UEDownloadRequestBuilder$DownloadingChoices;Landroid/net/Network;)Lcom/motorola/ccc/ota/installer/updaterEngine/download/UEDownloadRequestBuilder$NetworkDetails;
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/json/JSONException;
        }
    .end annotation

    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "buildAndReturnNetworkDetails: downloadingChoice "

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    const-string v1, "OtaApp"

    invoke-static {v1, v0}, Lcom/motorola/ccc/ota/utils/Logger;->debug(Ljava/lang/String;Ljava/lang/String;)V

    invoke-static {}, Lcom/motorola/ccc/ota/installer/updaterEngine/download/UEDownloadRequestBuilder;->-$$Nest$sfgetsettings()Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    move-result-object v0

    sget-object v1, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->DOWNLOAD_DESCRIPTOR:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    invoke-virtual {v0, v1}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->getString(Lcom/motorola/otalib/common/settings/ISetting;)Ljava/lang/String;

    move-result-object v0

    new-instance v1, Lorg/json/JSONObject;

    invoke-direct {v1, v0}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    sget-object v0, Lcom/motorola/ccc/ota/installer/updaterEngine/download/UEDownloadRequestBuilder$1;->$SwitchMap$com$motorola$ccc$ota$installer$updaterEngine$download$UEDownloadRequestBuilder$DownloadingChoices:[I

    invoke-virtual {p0}, Lcom/motorola/ccc/ota/installer/updaterEngine/download/UEDownloadRequestBuilder$DownloadingChoices;->ordinal()I

    move-result v2

    aget v0, v0, v2

    const/4 v2, 0x1

    if-eq v0, v2, :cond_2

    const/4 v2, 0x2

    if-eq v0, v2, :cond_1

    const/4 v2, 0x3

    if-eq v0, v2, :cond_0

    new-instance p1, Lcom/motorola/ccc/ota/installer/updaterEngine/download/UEDownloadRequestBuilder$NetworkDetails;

    invoke-direct {p1, p0}, Lcom/motorola/ccc/ota/installer/updaterEngine/download/UEDownloadRequestBuilder$NetworkDetails;-><init>(Lcom/motorola/ccc/ota/installer/updaterEngine/download/UEDownloadRequestBuilder$DownloadingChoices;)V

    return-object p1

    :cond_0
    new-instance v0, Lcom/motorola/ccc/ota/installer/updaterEngine/download/UEDownloadRequestBuilder$NetworkDetails;

    const-string v2, "adminApnUrl"

    invoke-virtual {v1, v2}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p1}, Landroid/net/Network;->getNetworkHandle()J

    move-result-wide v2

    invoke-static {v2, v3}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    move-result-object p1

    const-string v2, "ADMINAPN"

    invoke-direct {v0, v1, v2, p0, p1}, Lcom/motorola/ccc/ota/installer/updaterEngine/download/UEDownloadRequestBuilder$NetworkDetails;-><init>(Ljava/lang/String;Ljava/lang/String;Lcom/motorola/ccc/ota/installer/updaterEngine/download/UEDownloadRequestBuilder$DownloadingChoices;Ljava/lang/String;)V

    return-object v0

    :cond_1
    new-instance v0, Lcom/motorola/ccc/ota/installer/updaterEngine/download/UEDownloadRequestBuilder$NetworkDetails;

    const-string v2, "cellUrl"

    invoke-virtual {v1, v2}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p1}, Landroid/net/Network;->getNetworkHandle()J

    move-result-wide v2

    invoke-static {v2, v3}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    move-result-object p1

    const-string v2, "CELLULAR"

    invoke-direct {v0, v1, v2, p0, p1}, Lcom/motorola/ccc/ota/installer/updaterEngine/download/UEDownloadRequestBuilder$NetworkDetails;-><init>(Ljava/lang/String;Ljava/lang/String;Lcom/motorola/ccc/ota/installer/updaterEngine/download/UEDownloadRequestBuilder$DownloadingChoices;Ljava/lang/String;)V

    return-object v0

    :cond_2
    new-instance v0, Lcom/motorola/ccc/ota/installer/updaterEngine/download/UEDownloadRequestBuilder$NetworkDetails;

    const-string v2, "wifiUrl"

    invoke-virtual {v1, v2}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p1}, Landroid/net/Network;->getNetworkHandle()J

    move-result-wide v2

    invoke-static {v2, v3}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    move-result-object p1

    const-string v2, "WIFI"

    invoke-direct {v0, v1, v2, p0, p1}, Lcom/motorola/ccc/ota/installer/updaterEngine/download/UEDownloadRequestBuilder$NetworkDetails;-><init>(Ljava/lang/String;Ljava/lang/String;Lcom/motorola/ccc/ota/installer/updaterEngine/download/UEDownloadRequestBuilder$DownloadingChoices;Ljava/lang/String;)V

    return-object v0
.end method


# virtual methods
.method public getDownloadUrl()Ljava/lang/String;
    .locals 0

    iget-object p0, p0, Lcom/motorola/ccc/ota/installer/updaterEngine/download/UEDownloadRequestBuilder$NetworkDetails;->downloadUrl:Ljava/lang/String;

    return-object p0
.end method

.method public getDownloadingChoices()Lcom/motorola/ccc/ota/installer/updaterEngine/download/UEDownloadRequestBuilder$DownloadingChoices;
    .locals 0

    iget-object p0, p0, Lcom/motorola/ccc/ota/installer/updaterEngine/download/UEDownloadRequestBuilder$NetworkDetails;->downloadingChoices:Lcom/motorola/ccc/ota/installer/updaterEngine/download/UEDownloadRequestBuilder$DownloadingChoices;

    return-object p0
.end method

.method public getNetHandler()Ljava/lang/String;
    .locals 0

    iget-object p0, p0, Lcom/motorola/ccc/ota/installer/updaterEngine/download/UEDownloadRequestBuilder$NetworkDetails;->netHandler:Ljava/lang/String;

    return-object p0
.end method

.method public getNetworkType()Ljava/lang/String;
    .locals 0

    iget-object p0, p0, Lcom/motorola/ccc/ota/installer/updaterEngine/download/UEDownloadRequestBuilder$NetworkDetails;->networkType:Ljava/lang/String;

    return-object p0
.end method
