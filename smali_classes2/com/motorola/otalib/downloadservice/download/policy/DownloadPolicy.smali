.class public Lcom/motorola/otalib/downloadservice/download/policy/DownloadPolicy;
.super Ljava/lang/Object;
.source "DownloadPolicy.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/motorola/otalib/downloadservice/download/policy/DownloadPolicy$DownloadingChoices;
    }
.end annotation


# instance fields
.field private cm:Landroid/net/ConnectivityManager;

.field private tm:Landroid/telephony/TelephonyManager;

.field private zs:Lcom/motorola/otalib/downloadservice/download/policy/ZeroRatedServices;


# direct methods
.method public constructor <init>(Landroid/net/ConnectivityManager;Landroid/telephony/TelephonyManager;Lcom/motorola/otalib/downloadservice/download/policy/ZeroRatedServices;)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/motorola/otalib/downloadservice/download/policy/DownloadPolicy;->cm:Landroid/net/ConnectivityManager;

    iput-object p2, p0, Lcom/motorola/otalib/downloadservice/download/policy/DownloadPolicy;->tm:Landroid/telephony/TelephonyManager;

    iput-object p3, p0, Lcom/motorola/otalib/downloadservice/download/policy/DownloadPolicy;->zs:Lcom/motorola/otalib/downloadservice/download/policy/ZeroRatedServices;

    return-void
.end method


# virtual methods
.method public canIDownload(Landroid/content/Context;Ljava/lang/String;ZLjava/lang/String;Z)Lcom/motorola/otalib/downloadservice/download/policy/DownloadPolicy$DownloadingChoices;
    .locals 4

    iget-object v0, p0, Lcom/motorola/otalib/downloadservice/download/policy/DownloadPolicy;->cm:Landroid/net/ConnectivityManager;

    iget-object v1, p0, Lcom/motorola/otalib/downloadservice/download/policy/DownloadPolicy;->tm:Landroid/telephony/TelephonyManager;

    invoke-static {p1, v0, v1}, Lcom/motorola/otalib/common/utils/NetworkUtils;->getWanTypeAsString(Landroid/content/Context;Landroid/net/ConnectivityManager;Landroid/telephony/TelephonyManager;)Ljava/lang/String;

    move-result-object v0

    sget-object v1, Lcom/motorola/otalib/downloadservice/utils/DownloadServiceLogger;->TAG:Ljava/lang/String;

    new-instance v2, Ljava/lang/StringBuilder;

    const-string v3, "DownloadPolicy.canIDownload: current wantype "

    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Lcom/motorola/otalib/downloadservice/utils/DownloadServiceLogger;->d(Ljava/lang/String;Ljava/lang/String;)V

    iget-object v1, p0, Lcom/motorola/otalib/downloadservice/download/policy/DownloadPolicy;->cm:Landroid/net/ConnectivityManager;

    invoke-static {v1}, Lcom/motorola/otalib/common/utils/NetworkUtils;->isWifi(Landroid/net/ConnectivityManager;)Z

    move-result v1

    if-eqz v1, :cond_0

    sget-object p0, Lcom/motorola/otalib/downloadservice/utils/DownloadServiceLogger;->TAG:Ljava/lang/String;

    const-string p1, "DownloadPolicy.canIDownload:: on WiFi we can continue the on-going download"

    invoke-static {p0, p1}, Lcom/motorola/otalib/downloadservice/utils/DownloadServiceLogger;->d(Ljava/lang/String;Ljava/lang/String;)V

    sget-object p0, Lcom/motorola/otalib/downloadservice/download/policy/DownloadPolicy$DownloadingChoices;->WIFI_OK:Lcom/motorola/otalib/downloadservice/download/policy/DownloadPolicy$DownloadingChoices;

    return-object p0

    :cond_0
    if-eqz p3, :cond_1

    sget-object p0, Lcom/motorola/otalib/downloadservice/utils/DownloadServiceLogger;->TAG:Ljava/lang/String;

    const-string p1, "DownloadPolicy.canIDownload:: WiFi-only package but not on WiFi; we cannot start a new download"

    invoke-static {p0, p1}, Lcom/motorola/otalib/downloadservice/utils/DownloadServiceLogger;->d(Ljava/lang/String;Ljava/lang/String;)V

    sget-object p0, Lcom/motorola/otalib/downloadservice/download/policy/DownloadPolicy$DownloadingChoices;->WIFI_ONLY:Lcom/motorola/otalib/downloadservice/download/policy/DownloadPolicy$DownloadingChoices;

    return-object p0

    :cond_1
    if-nez p5, :cond_2

    iget-object p3, p0, Lcom/motorola/otalib/downloadservice/download/policy/DownloadPolicy;->cm:Landroid/net/ConnectivityManager;

    invoke-static {p3}, Lcom/motorola/otalib/common/utils/NetworkUtils;->isRoaming(Landroid/net/ConnectivityManager;)Z

    move-result p3

    if-eqz p3, :cond_2

    sget-object p0, Lcom/motorola/otalib/downloadservice/utils/DownloadServiceLogger;->TAG:Ljava/lang/String;

    const-string p1, "DownloadPolicy.canIDownload:: downloading is discontinuted due to roaming"

    invoke-static {p0, p1}, Lcom/motorola/otalib/downloadservice/utils/DownloadServiceLogger;->d(Ljava/lang/String;Ljava/lang/String;)V

    sget-object p0, Lcom/motorola/otalib/downloadservice/download/policy/DownloadPolicy$DownloadingChoices;->ROAMING:Lcom/motorola/otalib/downloadservice/download/policy/DownloadPolicy$DownloadingChoices;

    return-object p0

    :cond_2
    iget-object p3, p0, Lcom/motorola/otalib/downloadservice/download/policy/DownloadPolicy;->cm:Landroid/net/ConnectivityManager;

    invoke-static {p3}, Lcom/motorola/otalib/common/utils/NetworkUtils;->isWan(Landroid/net/ConnectivityManager;)Z

    move-result p3

    if-nez p3, :cond_3

    sget-object p2, Lcom/motorola/otalib/downloadservice/utils/DownloadServiceLogger;->TAG:Ljava/lang/String;

    new-instance p3, Ljava/lang/StringBuilder;

    const-string p4, "DownloadPolicy.canIDownload: cannot continue downloading over a non wifi and non wan network; current network "

    invoke-direct {p3, p4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object p4, p0, Lcom/motorola/otalib/downloadservice/download/policy/DownloadPolicy;->cm:Landroid/net/ConnectivityManager;

    iget-object p0, p0, Lcom/motorola/otalib/downloadservice/download/policy/DownloadPolicy;->tm:Landroid/telephony/TelephonyManager;

    invoke-static {p1, p4, p0}, Lcom/motorola/otalib/common/utils/NetworkUtils;->getWanTypeAsString(Landroid/content/Context;Landroid/net/ConnectivityManager;Landroid/telephony/TelephonyManager;)Ljava/lang/String;

    move-result-object p0

    invoke-virtual {p3, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p0

    const-string p1, " seems to be down"

    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-static {p2, p0}, Lcom/motorola/otalib/downloadservice/utils/DownloadServiceLogger;->e(Ljava/lang/String;Ljava/lang/String;)V

    sget-object p0, Lcom/motorola/otalib/downloadservice/download/policy/DownloadPolicy$DownloadingChoices;->NO_WAN:Lcom/motorola/otalib/downloadservice/download/policy/DownloadPolicy$DownloadingChoices;

    return-object p0

    :cond_3
    invoke-virtual {p0, p1, p4}, Lcom/motorola/otalib/downloadservice/download/policy/DownloadPolicy;->isDownloadAllowed(Landroid/content/Context;Ljava/lang/String;)Z

    move-result p3

    if-nez p3, :cond_4

    sget-object p2, Lcom/motorola/otalib/downloadservice/utils/DownloadServiceLogger;->TAG:Ljava/lang/String;

    new-instance p3, Ljava/lang/StringBuilder;

    const-string p4, "DownloadPolicy.canIDownload: cannot downloaded over a disallowed network "

    invoke-direct {p3, p4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object p4, p0, Lcom/motorola/otalib/downloadservice/download/policy/DownloadPolicy;->cm:Landroid/net/ConnectivityManager;

    iget-object p0, p0, Lcom/motorola/otalib/downloadservice/download/policy/DownloadPolicy;->tm:Landroid/telephony/TelephonyManager;

    invoke-static {p1, p4, p0}, Lcom/motorola/otalib/common/utils/NetworkUtils;->getWanTypeAsString(Landroid/content/Context;Landroid/net/ConnectivityManager;Landroid/telephony/TelephonyManager;)Ljava/lang/String;

    move-result-object p0

    invoke-virtual {p3, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-static {p2, p0}, Lcom/motorola/otalib/downloadservice/utils/DownloadServiceLogger;->d(Ljava/lang/String;Ljava/lang/String;)V

    sget-object p0, Lcom/motorola/otalib/downloadservice/download/policy/DownloadPolicy$DownloadingChoices;->WAN_DISALLOWED:Lcom/motorola/otalib/downloadservice/download/policy/DownloadPolicy$DownloadingChoices;

    return-object p0

    :cond_4
    invoke-static {p2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result p0

    if-nez p0, :cond_5

    sget-object p0, Lcom/motorola/otalib/downloadservice/utils/DownloadServiceLogger;->TAG:Ljava/lang/String;

    new-instance p1, Ljava/lang/StringBuilder;

    const-string p2, "DownloadPolicy.canIDownload: cannot downloaded over non-AdminAPN N/W "

    invoke-direct {p1, p2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {p0, p1}, Lcom/motorola/otalib/downloadservice/utils/DownloadServiceLogger;->d(Ljava/lang/String;Ljava/lang/String;)V

    sget-object p0, Lcom/motorola/otalib/downloadservice/download/policy/DownloadPolicy$DownloadingChoices;->WAN_DISALLOWED:Lcom/motorola/otalib/downloadservice/download/policy/DownloadPolicy$DownloadingChoices;

    return-object p0

    :cond_5
    sget-object p0, Lcom/motorola/otalib/downloadservice/utils/DownloadServiceLogger;->TAG:Ljava/lang/String;

    const-string p1, "DownloadPolicy.canIDownload: no restriction in continuing the on-going download"

    invoke-static {p0, p1}, Lcom/motorola/otalib/downloadservice/utils/DownloadServiceLogger;->d(Ljava/lang/String;Ljava/lang/String;)V

    sget-object p0, Lcom/motorola/otalib/downloadservice/download/policy/DownloadPolicy$DownloadingChoices;->WAN_OK:Lcom/motorola/otalib/downloadservice/download/policy/DownloadPolicy$DownloadingChoices;

    return-object p0
.end method

.method public canIDownloadUsingZeroRatedChannel()Z
    .locals 0

    iget-object p0, p0, Lcom/motorola/otalib/downloadservice/download/policy/DownloadPolicy;->zs:Lcom/motorola/otalib/downloadservice/download/policy/ZeroRatedServices;

    invoke-virtual {p0}, Lcom/motorola/otalib/downloadservice/download/policy/ZeroRatedServices;->zeroRatedChannelStatus()Z

    move-result p0

    return p0
.end method

.method public canIUseZeroRatedNetwork(Landroid/content/Context;ZLjava/lang/String;Ljava/lang/String;Ljava/lang/String;)Z
    .locals 3

    iget-object v0, p0, Lcom/motorola/otalib/downloadservice/download/policy/DownloadPolicy;->cm:Landroid/net/ConnectivityManager;

    iget-object v1, p0, Lcom/motorola/otalib/downloadservice/download/policy/DownloadPolicy;->tm:Landroid/telephony/TelephonyManager;

    invoke-static {p1, v0, v1}, Lcom/motorola/otalib/common/utils/NetworkUtils;->getWanTypeAsString(Landroid/content/Context;Landroid/net/ConnectivityManager;Landroid/telephony/TelephonyManager;)Ljava/lang/String;

    move-result-object v0

    invoke-static {p1}, Lcom/motorola/otalib/common/utils/NetworkUtils;->isVerizonSIM(Landroid/content/Context;)Z

    move-result v1

    const/4 v2, 0x0

    if-nez v1, :cond_0

    sget-object p0, Lcom/motorola/otalib/downloadservice/utils/DownloadServiceLogger;->TAG:Ljava/lang/String;

    const-string p1, "DownloadPolicy.canIUseZeroRatedNetwork: cannot download in zero rated Network over non-VZW network "

    invoke-static {p0, p1}, Lcom/motorola/otalib/downloadservice/utils/DownloadServiceLogger;->d(Ljava/lang/String;Ljava/lang/String;)V

    return v2

    :cond_0
    iget-object v1, p0, Lcom/motorola/otalib/downloadservice/download/policy/DownloadPolicy;->cm:Landroid/net/ConnectivityManager;

    invoke-static {v1}, Lcom/motorola/otalib/common/utils/NetworkUtils;->isWifi(Landroid/net/ConnectivityManager;)Z

    move-result v1

    if-eqz v1, :cond_1

    sget-object p0, Lcom/motorola/otalib/downloadservice/utils/DownloadServiceLogger;->TAG:Ljava/lang/String;

    const-string p1, "DownloadPolicy.canIUseZeroRatedNetwork:: on WiFi; we can continue the on-going download"

    invoke-static {p0, p1}, Lcom/motorola/otalib/downloadservice/utils/DownloadServiceLogger;->d(Ljava/lang/String;Ljava/lang/String;)V

    return v2

    :cond_1
    invoke-static {p3}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result p3

    if-eqz p3, :cond_2

    sget-object p0, Lcom/motorola/otalib/downloadservice/utils/DownloadServiceLogger;->TAG:Ljava/lang/String;

    const-string p1, "DownloadPolicy.canIUseZeroRatedNetwork:: ZeroRated feature off"

    invoke-static {p0, p1}, Lcom/motorola/otalib/downloadservice/utils/DownloadServiceLogger;->d(Ljava/lang/String;Ljava/lang/String;)V

    return v2

    :cond_2
    if-eqz p2, :cond_3

    sget-object p0, Lcom/motorola/otalib/downloadservice/utils/DownloadServiceLogger;->TAG:Ljava/lang/String;

    const-string p1, "DownloadPolicy.canIUseZeroRatedNetwork:: WiFi-only package but not on WiFi; we cannot start a new download"

    invoke-static {p0, p1}, Lcom/motorola/otalib/downloadservice/utils/DownloadServiceLogger;->d(Ljava/lang/String;Ljava/lang/String;)V

    return v2

    :cond_3
    iget-object p2, p0, Lcom/motorola/otalib/downloadservice/download/policy/DownloadPolicy;->cm:Landroid/net/ConnectivityManager;

    invoke-static {p2}, Lcom/motorola/otalib/common/utils/NetworkUtils;->isRoaming(Landroid/net/ConnectivityManager;)Z

    move-result p2

    if-eqz p2, :cond_4

    sget-object p0, Lcom/motorola/otalib/downloadservice/utils/DownloadServiceLogger;->TAG:Ljava/lang/String;

    const-string p1, "DownloadPolicy.canIUseZeroRatedNetwork:: downloading is discontinuted due to roaming"

    invoke-static {p0, p1}, Lcom/motorola/otalib/downloadservice/utils/DownloadServiceLogger;->d(Ljava/lang/String;Ljava/lang/String;)V

    return v2

    :cond_4
    iget-object p2, p0, Lcom/motorola/otalib/downloadservice/download/policy/DownloadPolicy;->cm:Landroid/net/ConnectivityManager;

    invoke-static {p2}, Lcom/motorola/otalib/common/utils/NetworkUtils;->isWan(Landroid/net/ConnectivityManager;)Z

    move-result p2

    if-nez p2, :cond_5

    sget-object p0, Lcom/motorola/otalib/downloadservice/utils/DownloadServiceLogger;->TAG:Ljava/lang/String;

    new-instance p1, Ljava/lang/StringBuilder;

    const-string p2, "DownloadPolicy.canIUseZeroRatedNetwork: cannot start/continue download over a non wifi and non wan network; current network "

    invoke-direct {p1, p2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    const-string p2, " seems to be down"

    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {p0, p1}, Lcom/motorola/otalib/downloadservice/utils/DownloadServiceLogger;->e(Ljava/lang/String;Ljava/lang/String;)V

    return v2

    :cond_5
    invoke-virtual {p0, p1, p4}, Lcom/motorola/otalib/downloadservice/download/policy/DownloadPolicy;->isDownloadAllowed(Landroid/content/Context;Ljava/lang/String;)Z

    move-result p1

    if-nez p1, :cond_6

    sget-object p0, Lcom/motorola/otalib/downloadservice/utils/DownloadServiceLogger;->TAG:Ljava/lang/String;

    new-instance p1, Ljava/lang/StringBuilder;

    const-string p2, "DownloadPolicy.canIUseZeroRatedNetwork: cannot downloaded over the disallowed network "

    invoke-direct {p1, p2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {p0, p1}, Lcom/motorola/otalib/downloadservice/utils/DownloadServiceLogger;->d(Ljava/lang/String;Ljava/lang/String;)V

    return v2

    :cond_6
    iget-object p1, p0, Lcom/motorola/otalib/downloadservice/download/policy/DownloadPolicy;->zs:Lcom/motorola/otalib/downloadservice/download/policy/ZeroRatedServices;

    invoke-virtual {p1, p5}, Lcom/motorola/otalib/downloadservice/download/policy/ZeroRatedServices;->getZeroRatedHostName(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    if-nez p1, :cond_7

    sget-object p0, Lcom/motorola/otalib/downloadservice/utils/DownloadServiceLogger;->TAG:Ljava/lang/String;

    const-string p1, "DownloadPolicy.canIUseZeroRatedNetwork: cannot download in zero rated Network over null gratis hostname "

    invoke-static {p0, p1}, Lcom/motorola/otalib/downloadservice/utils/DownloadServiceLogger;->d(Ljava/lang/String;Ljava/lang/String;)V

    return v2

    :cond_7
    if-eqz v0, :cond_8

    const-string p1, "LTE"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result p1

    if-nez p1, :cond_8

    const-string p1, "EHRPD"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result p1

    if-nez p1, :cond_8

    sget-object p0, Lcom/motorola/otalib/downloadservice/utils/DownloadServiceLogger;->TAG:Ljava/lang/String;

    const-string p1, "DownloadPolicy.canIUseZeroRatedNetwork:: Not on LTE/EHRPD network , we can\'t allow download over zero rated NW"

    invoke-static {p0, p1}, Lcom/motorola/otalib/downloadservice/utils/DownloadServiceLogger;->d(Ljava/lang/String;Ljava/lang/String;)V

    return v2

    :cond_8
    iget-object p0, p0, Lcom/motorola/otalib/downloadservice/download/policy/DownloadPolicy;->zs:Lcom/motorola/otalib/downloadservice/download/policy/ZeroRatedServices;

    invoke-virtual {p0}, Lcom/motorola/otalib/downloadservice/download/policy/ZeroRatedServices;->getZeroRatedDBStatus()Z

    move-result p0

    if-nez p0, :cond_9

    sget-object p0, Lcom/motorola/otalib/downloadservice/utils/DownloadServiceLogger;->TAG:Ljava/lang/String;

    const-string p1, "DownloadPolicy.canIUseZeroRatedNetwork: cannot download in zero rated Network over disabled/non-existing zero Rated pdn "

    invoke-static {p0, p1}, Lcom/motorola/otalib/downloadservice/utils/DownloadServiceLogger;->d(Ljava/lang/String;Ljava/lang/String;)V

    return v2

    :cond_9
    const/4 p0, 0x1

    return p0
.end method

.method public getCurrentNetworkType(Landroid/content/Context;)Ljava/lang/String;
    .locals 2

    iget-object v0, p0, Lcom/motorola/otalib/downloadservice/download/policy/DownloadPolicy;->cm:Landroid/net/ConnectivityManager;

    invoke-static {v0}, Lcom/motorola/otalib/common/utils/NetworkUtils;->isWifi(Landroid/net/ConnectivityManager;)Z

    move-result v0

    if-eqz v0, :cond_0

    const-string p0, "wifi"

    return-object p0

    :cond_0
    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "carrier_network("

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v1, p0, Lcom/motorola/otalib/downloadservice/download/policy/DownloadPolicy;->cm:Landroid/net/ConnectivityManager;

    iget-object p0, p0, Lcom/motorola/otalib/downloadservice/download/policy/DownloadPolicy;->tm:Landroid/telephony/TelephonyManager;

    invoke-static {p1, v1, p0}, Lcom/motorola/otalib/common/utils/NetworkUtils;->getWanTypeAsString(Landroid/content/Context;Landroid/net/ConnectivityManager;Landroid/telephony/TelephonyManager;)Ljava/lang/String;

    move-result-object p0

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p0

    const-string p1, ")"

    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method public isDownloadAllowed(Landroid/content/Context;Ljava/lang/String;)Z
    .locals 3

    const/4 v0, 0x1

    if-eqz p2, :cond_3

    invoke-virtual {p2}, Ljava/lang/String;->length()I

    move-result v1

    if-nez v1, :cond_0

    goto :goto_0

    :cond_0
    iget-object v1, p0, Lcom/motorola/otalib/downloadservice/download/policy/DownloadPolicy;->cm:Landroid/net/ConnectivityManager;

    iget-object p0, p0, Lcom/motorola/otalib/downloadservice/download/policy/DownloadPolicy;->tm:Landroid/telephony/TelephonyManager;

    invoke-static {p1, v1, p0}, Lcom/motorola/otalib/common/utils/NetworkUtils;->getWanTypeAsString(Landroid/content/Context;Landroid/net/ConnectivityManager;Landroid/telephony/TelephonyManager;)Ljava/lang/String;

    move-result-object p0

    if-nez p0, :cond_1

    const-string p0, "OTHER"

    :cond_1
    sget-object p1, Lcom/motorola/otalib/downloadservice/utils/DownloadServiceLogger;->TAG:Ljava/lang/String;

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "isDownloadAllowed: currently on: "

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "; disallowed nets are: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {p1, v1}, Lcom/motorola/otalib/downloadservice/utils/DownloadServiceLogger;->d(Ljava/lang/String;Ljava/lang/String;)V

    new-instance p1, Ljava/util/StringTokenizer;

    const-string v1, ","

    invoke-direct {p1, p2, v1}, Ljava/util/StringTokenizer;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    :cond_2
    invoke-virtual {p1}, Ljava/util/StringTokenizer;->hasMoreTokens()Z

    move-result p2

    if-eqz p2, :cond_3

    invoke-virtual {p1}, Ljava/util/StringTokenizer;->nextToken()Ljava/lang/String;

    move-result-object p2

    invoke-virtual {p2, p0}, Ljava/lang/String;->compareToIgnoreCase(Ljava/lang/String;)I

    move-result v1

    if-nez v1, :cond_2

    sget-object p0, Lcom/motorola/otalib/downloadservice/utils/DownloadServiceLogger;->TAG:Ljava/lang/String;

    new-instance p1, Ljava/lang/StringBuilder;

    const-string v0, "isDownloadAllowed: network not allowed "

    invoke-direct {p1, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {p0, p1}, Lcom/motorola/otalib/downloadservice/utils/DownloadServiceLogger;->i(Ljava/lang/String;Ljava/lang/String;)V

    const/4 p0, 0x0

    return p0

    :cond_3
    :goto_0
    return v0
.end method

.method public startZeroRatedProcess()V
    .locals 0

    iget-object p0, p0, Lcom/motorola/otalib/downloadservice/download/policy/DownloadPolicy;->zs:Lcom/motorola/otalib/downloadservice/download/policy/ZeroRatedServices;

    invoke-virtual {p0}, Lcom/motorola/otalib/downloadservice/download/policy/ZeroRatedServices;->startZeroRatedChannel()V

    return-void
.end method

.method public stopUsingZeroRatedChannel()V
    .locals 0

    iget-object p0, p0, Lcom/motorola/otalib/downloadservice/download/policy/DownloadPolicy;->zs:Lcom/motorola/otalib/downloadservice/download/policy/ZeroRatedServices;

    invoke-virtual {p0}, Lcom/motorola/otalib/downloadservice/download/policy/ZeroRatedServices;->stopZeroRatedChannel()V

    return-void
.end method
