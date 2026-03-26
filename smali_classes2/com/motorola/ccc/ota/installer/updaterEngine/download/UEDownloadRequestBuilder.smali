.class public Lcom/motorola/ccc/ota/installer/updaterEngine/download/UEDownloadRequestBuilder;
.super Ljava/lang/Object;
.source "UEDownloadRequestBuilder.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/motorola/ccc/ota/installer/updaterEngine/download/UEDownloadRequestBuilder$DownloadingChoices;,
        Lcom/motorola/ccc/ota/installer/updaterEngine/download/UEDownloadRequestBuilder$NetworkDetails;
    }
.end annotation


# static fields
.field private static final NETWORK_ID_KEY:Ljava/lang/String; = "NETWORK_ID"

.field private static final NETWORK_TYPE_KEY:Ljava/lang/String; = "NETWORK_TYPE"

.field private static final USER_AGENT_KEY:Ljava/lang/String; = "USER_AGENT"

.field private static settings:Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;


# instance fields
.field private mCm:Landroid/net/ConnectivityManager;

.field private mTm:Landroid/telephony/TelephonyManager;


# direct methods
.method static bridge synthetic -$$Nest$sfgetsettings()Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;
    .locals 1

    sget-object v0, Lcom/motorola/ccc/ota/installer/updaterEngine/download/UEDownloadRequestBuilder;->settings:Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    return-object v0
.end method

.method public constructor <init>(Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;Landroid/net/ConnectivityManager;Landroid/telephony/TelephonyManager;)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p2, p0, Lcom/motorola/ccc/ota/installer/updaterEngine/download/UEDownloadRequestBuilder;->mCm:Landroid/net/ConnectivityManager;

    iput-object p3, p0, Lcom/motorola/ccc/ota/installer/updaterEngine/download/UEDownloadRequestBuilder;->mTm:Landroid/telephony/TelephonyManager;

    sput-object p1, Lcom/motorola/ccc/ota/installer/updaterEngine/download/UEDownloadRequestBuilder;->settings:Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    return-void
.end method


# virtual methods
.method public build(Lcom/motorola/ccc/ota/installer/updaterEngine/download/UEDownloadRequestBuilder$NetworkDetails;Lorg/json/JSONObject;)Lcom/motorola/ccc/ota/installer/updaterEngine/download/DownloadRequestToUE;
    .locals 9
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/motorola/ccc/ota/installer/updaterEngine/download/DownloadBuilderException;,
            Lorg/json/JSONException;
        }
    .end annotation

    const-string v0, "building UE download request"

    const-string v1, "OtaApp"

    invoke-static {v1, v0}, Lcom/motorola/ccc/ota/utils/Logger;->debug(Ljava/lang/String;Ljava/lang/String;)V

    if-eqz p2, :cond_0

    invoke-virtual {p1}, Lcom/motorola/ccc/ota/installer/updaterEngine/download/UEDownloadRequestBuilder$NetworkDetails;->getDownloadUrl()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {p0, p2}, Lcom/motorola/ccc/ota/installer/updaterEngine/download/UEDownloadRequestBuilder;->getPayloadOffsetAndSize(Lorg/json/JSONObject;)[J

    move-result-object v0

    invoke-virtual {p0, p2, p1}, Lcom/motorola/ccc/ota/installer/updaterEngine/download/UEDownloadRequestBuilder;->getHeaderKeyValuePair(Lorg/json/JSONObject;Lcom/motorola/ccc/ota/installer/updaterEngine/download/UEDownloadRequestBuilder$NetworkDetails;)[Ljava/lang/String;

    move-result-object v8

    new-instance p0, Ljava/lang/StringBuilder;

    const-string p1, "Download url "

    invoke-direct {p0, p1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p0

    const-string p1, " Offset value "

    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p0

    const/4 p1, 0x0

    aget-wide v4, v0, p1

    invoke-virtual {p0, v4, v5}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object p0

    const-string p2, " File size "

    invoke-virtual {p0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p0

    const/4 p2, 0x1

    aget-wide v4, v0, p2

    invoke-virtual {p0, v4, v5}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-static {v1, p0}, Lcom/motorola/ccc/ota/utils/Logger;->verbose(Ljava/lang/String;Ljava/lang/String;)V

    new-instance p0, Lcom/motorola/ccc/ota/installer/updaterEngine/download/DownloadRequestToUE;

    aget-wide v4, v0, p1

    aget-wide v6, v0, p2

    move-object v2, p0

    invoke-direct/range {v2 .. v8}, Lcom/motorola/ccc/ota/installer/updaterEngine/download/DownloadRequestToUE;-><init>(Ljava/lang/String;JJ[Ljava/lang/String;)V

    return-object p0

    :cond_0
    new-instance p0, Lcom/motorola/ccc/ota/installer/updaterEngine/download/DownloadBuilderException;

    const-string p1, "streamingData is null in metadata"

    invoke-direct {p0, p1}, Lcom/motorola/ccc/ota/installer/updaterEngine/download/DownloadBuilderException;-><init>(Ljava/lang/String;)V

    throw p0
.end method

.method public fetchAdminapnNetworkDetails()Lcom/motorola/ccc/ota/installer/updaterEngine/download/UEDownloadRequestBuilder$NetworkDetails;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/json/JSONException;
        }
    .end annotation

    sget-object p0, Lcom/motorola/ccc/ota/installer/updaterEngine/download/UEDownloadRequestBuilder$DownloadingChoices;->ADMIN_OK:Lcom/motorola/ccc/ota/installer/updaterEngine/download/UEDownloadRequestBuilder$DownloadingChoices;

    invoke-static {}, Lcom/motorola/otalib/downloadservice/download/policy/ZeroRatedManager;->returnActiveAdminApnNetwork()Landroid/net/Network;

    move-result-object v0

    invoke-static {p0, v0}, Lcom/motorola/ccc/ota/installer/updaterEngine/download/UEDownloadRequestBuilder$NetworkDetails;->buildAndReturnNetworkDetails(Lcom/motorola/ccc/ota/installer/updaterEngine/download/UEDownloadRequestBuilder$DownloadingChoices;Landroid/net/Network;)Lcom/motorola/ccc/ota/installer/updaterEngine/download/UEDownloadRequestBuilder$NetworkDetails;

    move-result-object p0

    return-object p0
.end method

.method public fetchNonAdminapnNetworkDetails(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Z)Lcom/motorola/ccc/ota/installer/updaterEngine/download/UEDownloadRequestBuilder$NetworkDetails;
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/json/JSONException;
        }
    .end annotation

    iget-object v0, p0, Lcom/motorola/ccc/ota/installer/updaterEngine/download/UEDownloadRequestBuilder;->mCm:Landroid/net/ConnectivityManager;

    iget-object v1, p0, Lcom/motorola/ccc/ota/installer/updaterEngine/download/UEDownloadRequestBuilder;->mTm:Landroid/telephony/TelephonyManager;

    invoke-static {p1, v0, v1}, Lcom/motorola/otalib/common/utils/NetworkUtils;->getWanTypeAsString(Landroid/content/Context;Landroid/net/ConnectivityManager;Landroid/telephony/TelephonyManager;)Ljava/lang/String;

    move-result-object v0

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "UEDownloadRequestBuilder.canIDownload: current wantype "

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    const-string v2, "OtaApp"

    invoke-static {v2, v1}, Lcom/motorola/ccc/ota/utils/Logger;->debug(Ljava/lang/String;Ljava/lang/String;)V

    iget-object v1, p0, Lcom/motorola/ccc/ota/installer/updaterEngine/download/UEDownloadRequestBuilder;->mCm:Landroid/net/ConnectivityManager;

    invoke-virtual {v1}, Landroid/net/ConnectivityManager;->getActiveNetwork()Landroid/net/Network;

    move-result-object v1

    if-nez v1, :cond_0

    sget-object p0, Lcom/motorola/ccc/ota/installer/updaterEngine/download/UEDownloadRequestBuilder$DownloadingChoices;->NO_WAN:Lcom/motorola/ccc/ota/installer/updaterEngine/download/UEDownloadRequestBuilder$DownloadingChoices;

    invoke-static {p0, v1}, Lcom/motorola/ccc/ota/installer/updaterEngine/download/UEDownloadRequestBuilder$NetworkDetails;->buildAndReturnNetworkDetails(Lcom/motorola/ccc/ota/installer/updaterEngine/download/UEDownloadRequestBuilder$DownloadingChoices;Landroid/net/Network;)Lcom/motorola/ccc/ota/installer/updaterEngine/download/UEDownloadRequestBuilder$NetworkDetails;

    move-result-object p0

    return-object p0

    :cond_0
    iget-object v3, p0, Lcom/motorola/ccc/ota/installer/updaterEngine/download/UEDownloadRequestBuilder;->mCm:Landroid/net/ConnectivityManager;

    invoke-static {v3}, Lcom/motorola/otalib/common/utils/NetworkUtils;->hasNetwork(Landroid/net/ConnectivityManager;)Z

    move-result v3

    if-eqz v3, :cond_1

    iget-object v3, p0, Lcom/motorola/ccc/ota/installer/updaterEngine/download/UEDownloadRequestBuilder;->mCm:Landroid/net/ConnectivityManager;

    invoke-static {v3}, Lcom/motorola/otalib/common/utils/NetworkUtils;->isWifi(Landroid/net/ConnectivityManager;)Z

    move-result v3

    if-eqz v3, :cond_1

    const-string p0, "UEDownloadRequestBuilder.canIDownload:: on WiFi; we can continue the on-going download"

    invoke-static {v2, p0}, Lcom/motorola/ccc/ota/utils/Logger;->debug(Ljava/lang/String;Ljava/lang/String;)V

    sget-object p0, Lcom/motorola/ccc/ota/installer/updaterEngine/download/UEDownloadRequestBuilder$DownloadingChoices;->WIFI_OK:Lcom/motorola/ccc/ota/installer/updaterEngine/download/UEDownloadRequestBuilder$DownloadingChoices;

    invoke-static {p0, v1}, Lcom/motorola/ccc/ota/installer/updaterEngine/download/UEDownloadRequestBuilder$NetworkDetails;->buildAndReturnNetworkDetails(Lcom/motorola/ccc/ota/installer/updaterEngine/download/UEDownloadRequestBuilder$DownloadingChoices;Landroid/net/Network;)Lcom/motorola/ccc/ota/installer/updaterEngine/download/UEDownloadRequestBuilder$NetworkDetails;

    move-result-object p0

    return-object p0

    :cond_1
    invoke-static {}, Lcom/motorola/ccc/ota/ui/UpdaterUtils;->isWifiOnly()Z

    move-result v3

    if-eqz v3, :cond_2

    const-string p0, "UEDownloadRequestBuilder.canIDownload:: WiFi-only package but not on WiFi; we cannot start a new download"

    invoke-static {v2, p0}, Lcom/motorola/ccc/ota/utils/Logger;->debug(Ljava/lang/String;Ljava/lang/String;)V

    sget-object p0, Lcom/motorola/ccc/ota/installer/updaterEngine/download/UEDownloadRequestBuilder$DownloadingChoices;->WIFI_ONLY:Lcom/motorola/ccc/ota/installer/updaterEngine/download/UEDownloadRequestBuilder$DownloadingChoices;

    invoke-static {p0, v1}, Lcom/motorola/ccc/ota/installer/updaterEngine/download/UEDownloadRequestBuilder$NetworkDetails;->buildAndReturnNetworkDetails(Lcom/motorola/ccc/ota/installer/updaterEngine/download/UEDownloadRequestBuilder$DownloadingChoices;Landroid/net/Network;)Lcom/motorola/ccc/ota/installer/updaterEngine/download/UEDownloadRequestBuilder$NetworkDetails;

    move-result-object p0

    return-object p0

    :cond_2
    if-nez p4, :cond_3

    iget-object p4, p0, Lcom/motorola/ccc/ota/installer/updaterEngine/download/UEDownloadRequestBuilder;->mCm:Landroid/net/ConnectivityManager;

    invoke-static {p4}, Lcom/motorola/otalib/common/utils/NetworkUtils;->isRoaming(Landroid/net/ConnectivityManager;)Z

    move-result p4

    if-eqz p4, :cond_3

    const-string p0, "UEDownloadRequestBuilder.canIDownload:: downloading is discontinued due to roaming"

    invoke-static {v2, p0}, Lcom/motorola/ccc/ota/utils/Logger;->debug(Ljava/lang/String;Ljava/lang/String;)V

    sget-object p0, Lcom/motorola/ccc/ota/installer/updaterEngine/download/UEDownloadRequestBuilder$DownloadingChoices;->ROAMING:Lcom/motorola/ccc/ota/installer/updaterEngine/download/UEDownloadRequestBuilder$DownloadingChoices;

    invoke-static {p0, v1}, Lcom/motorola/ccc/ota/installer/updaterEngine/download/UEDownloadRequestBuilder$NetworkDetails;->buildAndReturnNetworkDetails(Lcom/motorola/ccc/ota/installer/updaterEngine/download/UEDownloadRequestBuilder$DownloadingChoices;Landroid/net/Network;)Lcom/motorola/ccc/ota/installer/updaterEngine/download/UEDownloadRequestBuilder$NetworkDetails;

    move-result-object p0

    return-object p0

    :cond_3
    iget-object p4, p0, Lcom/motorola/ccc/ota/installer/updaterEngine/download/UEDownloadRequestBuilder;->mCm:Landroid/net/ConnectivityManager;

    invoke-static {p4}, Lcom/motorola/otalib/common/utils/NetworkUtils;->hasNetwork(Landroid/net/ConnectivityManager;)Z

    move-result p4

    if-eqz p4, :cond_4

    iget-object p4, p0, Lcom/motorola/ccc/ota/installer/updaterEngine/download/UEDownloadRequestBuilder;->mCm:Landroid/net/ConnectivityManager;

    invoke-static {p4}, Lcom/motorola/otalib/common/utils/NetworkUtils;->isWan(Landroid/net/ConnectivityManager;)Z

    move-result p4

    if-nez p4, :cond_4

    const-string p0, "UEDownloadRequestBuilder.canIDownload: cannot continue download network seems to be down"

    invoke-static {v2, p0}, Lcom/motorola/ccc/ota/utils/Logger;->debug(Ljava/lang/String;Ljava/lang/String;)V

    sget-object p0, Lcom/motorola/ccc/ota/installer/updaterEngine/download/UEDownloadRequestBuilder$DownloadingChoices;->NO_WAN:Lcom/motorola/ccc/ota/installer/updaterEngine/download/UEDownloadRequestBuilder$DownloadingChoices;

    invoke-static {p0, v1}, Lcom/motorola/ccc/ota/installer/updaterEngine/download/UEDownloadRequestBuilder$NetworkDetails;->buildAndReturnNetworkDetails(Lcom/motorola/ccc/ota/installer/updaterEngine/download/UEDownloadRequestBuilder$DownloadingChoices;Landroid/net/Network;)Lcom/motorola/ccc/ota/installer/updaterEngine/download/UEDownloadRequestBuilder$NetworkDetails;

    move-result-object p0

    return-object p0

    :cond_4
    iget-object p4, p0, Lcom/motorola/ccc/ota/installer/updaterEngine/download/UEDownloadRequestBuilder;->mCm:Landroid/net/ConnectivityManager;

    iget-object p0, p0, Lcom/motorola/ccc/ota/installer/updaterEngine/download/UEDownloadRequestBuilder;->mTm:Landroid/telephony/TelephonyManager;

    invoke-static {p1, p3, p4, p0}, Lcom/motorola/ccc/ota/installer/updaterEngine/common/InstallerUtilMethods;->isDownloadAllowed(Landroid/content/Context;Ljava/lang/String;Landroid/net/ConnectivityManager;Landroid/telephony/TelephonyManager;)Z

    move-result p0

    if-nez p0, :cond_5

    new-instance p0, Ljava/lang/StringBuilder;

    const-string p1, "UEDownloadRequestBuilder.canIDownload: cannot downloaded over a disallowed network "

    invoke-direct {p0, p1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p0, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-static {v2, p0}, Lcom/motorola/ccc/ota/utils/Logger;->debug(Ljava/lang/String;Ljava/lang/String;)V

    sget-object p0, Lcom/motorola/ccc/ota/installer/updaterEngine/download/UEDownloadRequestBuilder$DownloadingChoices;->WAN_DISALLOWED:Lcom/motorola/ccc/ota/installer/updaterEngine/download/UEDownloadRequestBuilder$DownloadingChoices;

    invoke-static {p0, v1}, Lcom/motorola/ccc/ota/installer/updaterEngine/download/UEDownloadRequestBuilder$NetworkDetails;->buildAndReturnNetworkDetails(Lcom/motorola/ccc/ota/installer/updaterEngine/download/UEDownloadRequestBuilder$DownloadingChoices;Landroid/net/Network;)Lcom/motorola/ccc/ota/installer/updaterEngine/download/UEDownloadRequestBuilder$NetworkDetails;

    move-result-object p0

    return-object p0

    :cond_5
    invoke-static {p2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result p0

    if-nez p0, :cond_6

    new-instance p0, Ljava/lang/StringBuilder;

    const-string p1, "UEDownloadRequestBuilder.canIDownload: cannot downloaded over non-AdminAPN N/W "

    invoke-direct {p0, p1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p0, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-static {v2, p0}, Lcom/motorola/ccc/ota/utils/Logger;->debug(Ljava/lang/String;Ljava/lang/String;)V

    sget-object p0, Lcom/motorola/ccc/ota/installer/updaterEngine/download/UEDownloadRequestBuilder$DownloadingChoices;->WAN_DISALLOWED:Lcom/motorola/ccc/ota/installer/updaterEngine/download/UEDownloadRequestBuilder$DownloadingChoices;

    invoke-static {p0, v1}, Lcom/motorola/ccc/ota/installer/updaterEngine/download/UEDownloadRequestBuilder$NetworkDetails;->buildAndReturnNetworkDetails(Lcom/motorola/ccc/ota/installer/updaterEngine/download/UEDownloadRequestBuilder$DownloadingChoices;Landroid/net/Network;)Lcom/motorola/ccc/ota/installer/updaterEngine/download/UEDownloadRequestBuilder$NetworkDetails;

    move-result-object p0

    return-object p0

    :cond_6
    const-string p0, "UEDownloadRequestBuilder.canIDownload: no restriction in continuing the on-going download"

    invoke-static {v2, p0}, Lcom/motorola/ccc/ota/utils/Logger;->debug(Ljava/lang/String;Ljava/lang/String;)V

    sget-object p0, Lcom/motorola/ccc/ota/installer/updaterEngine/download/UEDownloadRequestBuilder$DownloadingChoices;->WAN_OK:Lcom/motorola/ccc/ota/installer/updaterEngine/download/UEDownloadRequestBuilder$DownloadingChoices;

    invoke-static {p0, v1}, Lcom/motorola/ccc/ota/installer/updaterEngine/download/UEDownloadRequestBuilder$NetworkDetails;->buildAndReturnNetworkDetails(Lcom/motorola/ccc/ota/installer/updaterEngine/download/UEDownloadRequestBuilder$DownloadingChoices;Landroid/net/Network;)Lcom/motorola/ccc/ota/installer/updaterEngine/download/UEDownloadRequestBuilder$NetworkDetails;

    move-result-object p0

    return-object p0
.end method

.method public getHeaderKeyValuePair(Lorg/json/JSONObject;Lcom/motorola/ccc/ota/installer/updaterEngine/download/UEDownloadRequestBuilder$NetworkDetails;)[Ljava/lang/String;
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/motorola/ccc/ota/installer/updaterEngine/download/DownloadBuilderException;,
            Lorg/json/JSONException;
        }
    .end annotation

    new-instance p0, Ljava/util/ArrayList;

    invoke-direct {p0}, Ljava/util/ArrayList;-><init>()V

    const-string v0, "header"

    invoke-virtual {p1, v0}, Lorg/json/JSONObject;->optJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object p1

    if-eqz p1, :cond_2

    invoke-virtual {p1}, Lorg/json/JSONObject;->keys()Ljava/util/Iterator;

    move-result-object v0

    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_0

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, "="

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {p1, v1}, Lorg/json/JSONObject;->get(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v1

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-interface {p0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_0

    :cond_0
    new-instance p1, Ljava/lang/StringBuilder;

    const-string v0, "NETWORK_ID="

    invoke-direct {p1, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p2}, Lcom/motorola/ccc/ota/installer/updaterEngine/download/UEDownloadRequestBuilder$NetworkDetails;->getNetHandler()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-interface {p0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    new-instance p1, Ljava/lang/StringBuilder;

    const-string v0, "NETWORK_TYPE="

    invoke-direct {p1, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p2}, Lcom/motorola/ccc/ota/installer/updaterEngine/download/UEDownloadRequestBuilder$NetworkDetails;->getNetworkType()Ljava/lang/String;

    move-result-object p2

    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-interface {p0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    new-instance p1, Ljava/lang/StringBuilder;

    const-string p2, "USER_AGENT="

    invoke-direct {p1, p2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string p2, "http.agent"

    invoke-static {p2}, Ljava/lang/System;->getProperty(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p2

    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-interface {p0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    invoke-static {}, Lcom/motorola/ccc/ota/env/OtaApplication;->getGlobalContext()Landroid/content/Context;

    move-result-object p1

    invoke-static {p1}, Lcom/motorola/ccc/ota/ui/UpdaterUtils;->isSoftBankApn(Landroid/content/Context;)Z

    move-result p1

    if-eqz p1, :cond_1

    const-string p1, "PROXY_HOST=dmint.softbank.ne.jp"

    invoke-interface {p0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    const-string p1, "PROXY_PORT=8080"

    invoke-interface {p0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    :cond_1
    new-instance p1, Ljava/lang/StringBuilder;

    const-string p2, "Header key value pair"

    invoke-direct {p1, p2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object p2

    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    const-string p2, "OtaApp"

    invoke-static {p2, p1}, Lcom/motorola/ccc/ota/utils/Logger;->verbose(Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {p0}, Ljava/util/List;->size()I

    move-result p1

    new-array p1, p1, [Ljava/lang/String;

    invoke-interface {p0, p1}, Ljava/util/List;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object p0

    check-cast p0, [Ljava/lang/String;

    return-object p0

    :cond_2
    new-instance p0, Lcom/motorola/ccc/ota/installer/updaterEngine/download/DownloadBuilderException;

    const-string p1, "StreamingUpdate.getHeaderKeyValuePair:: null value came from server"

    invoke-direct {p0, p1}, Lcom/motorola/ccc/ota/installer/updaterEngine/download/DownloadBuilderException;-><init>(Ljava/lang/String;)V

    throw p0
.end method

.method public getPayloadOffsetAndSize(Lorg/json/JSONObject;)[J
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/motorola/ccc/ota/installer/updaterEngine/download/DownloadBuilderException;,
            Lorg/json/JSONException;
        }
    .end annotation

    const-string p0, "additionalInfo"

    invoke-virtual {p1, p0}, Lorg/json/JSONObject;->optJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object p0

    if-eqz p0, :cond_0

    const-string p1, "payload"

    invoke-virtual {p0, p1}, Lorg/json/JSONObject;->optJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object p0

    if-eqz p0, :cond_0

    const-string p1, "offset"

    invoke-virtual {p0, p1}, Lorg/json/JSONObject;->getLong(Ljava/lang/String;)J

    move-result-wide v0

    const-string p1, "size"

    invoke-virtual {p0, p1}, Lorg/json/JSONObject;->getLong(Ljava/lang/String;)J

    move-result-wide p0

    const/4 v2, 0x2

    new-array v2, v2, [J

    const/4 v3, 0x0

    aput-wide v0, v2, v3

    const/4 v0, 0x1

    aput-wide p0, v2, v0

    return-object v2

    :cond_0
    new-instance p0, Lcom/motorola/ccc/ota/installer/updaterEngine/download/DownloadBuilderException;

    const-string p1, "StreamingUpdate.getOffsetValue: server did not sendpayload properties"

    invoke-direct {p0, p1}, Lcom/motorola/ccc/ota/installer/updaterEngine/download/DownloadBuilderException;-><init>(Ljava/lang/String;)V

    throw p0
.end method
