.class public Lcom/motorola/otalib/common/utils/NetworkUtils;
.super Ljava/lang/Object;
.source "NetworkUtils.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/motorola/otalib/common/utils/NetworkUtils$networkType;
    }
.end annotation


# static fields
.field public static final DEFAULT_VZW_SIM:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap<",
            "Ljava/lang/String;",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;>;"
        }
    .end annotation
.end field

.field private static NETWORK_TAG_LIST:[Ljava/lang/String; = null

.field private static final SOFTBANK_APN_NAME:Ljava/lang/String; = "plus.acs.jp.v6"


# direct methods
.method static constructor <clinit>()V
    .locals 3

    const/4 v0, 0x3

    new-array v0, v0, [Ljava/lang/String;

    const/4 v1, 0x0

    const-string v2, "WIFI"

    aput-object v2, v0, v1

    const/4 v1, 0x1

    const-string v2, "CELL"

    aput-object v2, v0, v1

    const/4 v1, 0x2

    const-string v2, "USEADMINAPN"

    aput-object v2, v0, v1

    sput-object v0, Lcom/motorola/otalib/common/utils/NetworkUtils;->NETWORK_TAG_LIST:[Ljava/lang/String;

    new-instance v0, Lcom/motorola/otalib/common/utils/NetworkUtils$1;

    invoke-direct {v0}, Lcom/motorola/otalib/common/utils/NetworkUtils$1;-><init>()V

    sput-object v0, Lcom/motorola/otalib/common/utils/NetworkUtils;->DEFAULT_VZW_SIM:Ljava/util/HashMap;

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static checkWhetherUserDisabledCellularNetwork(Landroid/net/ConnectivityManager;)Z
    .locals 5

    if-eqz p0, :cond_1

    invoke-virtual {p0}, Landroid/net/ConnectivityManager;->getAllNetworks()[Landroid/net/Network;

    move-result-object v0

    if-eqz v0, :cond_1

    const/4 v1, 0x0

    move v2, v1

    :goto_0
    array-length v3, v0

    if-ge v2, v3, :cond_1

    aget-object v3, v0, v2

    invoke-virtual {p0, v3}, Landroid/net/ConnectivityManager;->getNetworkCapabilities(Landroid/net/Network;)Landroid/net/NetworkCapabilities;

    move-result-object v3

    if-eqz v3, :cond_0

    const/16 v4, 0xc

    invoke-virtual {v3, v4}, Landroid/net/NetworkCapabilities;->hasCapability(I)Z

    move-result v4

    if-eqz v4, :cond_0

    invoke-virtual {v3, v1}, Landroid/net/NetworkCapabilities;->hasTransport(I)Z

    move-result v3

    if-eqz v3, :cond_0

    return v1

    :cond_0
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    :cond_1
    const/4 p0, 0x1

    return p0
.end method

.method public static getCurrentNetworkType(Landroid/content/Context;Landroid/net/ConnectivityManager;Landroid/telephony/TelephonyManager;)Ljava/lang/String;
    .locals 2

    invoke-static {p1}, Lcom/motorola/otalib/common/utils/NetworkUtils;->isWifi(Landroid/net/ConnectivityManager;)Z

    move-result v0

    if-eqz v0, :cond_0

    const-string p0, "wifi"

    return-object p0

    :cond_0
    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "carrier_network("

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-static {p0, p1, p2}, Lcom/motorola/otalib/common/utils/NetworkUtils;->getWanTypeAsString(Landroid/content/Context;Landroid/net/ConnectivityManager;Landroid/telephony/TelephonyManager;)Ljava/lang/String;

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

.method public static getNetwork(Landroid/content/Context;)Ljava/lang/String;
    .locals 2

    const-string v0, "connectivity"

    invoke-virtual {p0, v0}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/net/ConnectivityManager;

    const-string v1, "phone"

    invoke-virtual {p0, v1}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/telephony/TelephonyManager;

    invoke-static {p0, v0, v1}, Lcom/motorola/otalib/common/utils/NetworkUtils;->getWanTypeAsString(Landroid/content/Context;Landroid/net/ConnectivityManager;Landroid/telephony/TelephonyManager;)Ljava/lang/String;

    move-result-object p0

    invoke-static {v0}, Lcom/motorola/otalib/common/utils/NetworkUtils;->isWifi(Landroid/net/ConnectivityManager;)Z

    move-result v1

    if-eqz v1, :cond_0

    sget-object p0, Lcom/motorola/otalib/common/utils/NetworkUtils$networkType;->WIFI:Lcom/motorola/otalib/common/utils/NetworkUtils$networkType;

    invoke-virtual {p0}, Lcom/motorola/otalib/common/utils/NetworkUtils$networkType;->name()Ljava/lang/String;

    move-result-object p0

    return-object p0

    :cond_0
    invoke-static {v0}, Lcom/motorola/otalib/common/utils/NetworkUtils;->isWan(Landroid/net/ConnectivityManager;)Z

    move-result v1

    if-eqz v1, :cond_7

    const-string v1, "UNKNOWN"

    invoke-virtual {v1, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_1

    goto :goto_1

    :cond_1
    invoke-static {v0}, Lcom/motorola/otalib/common/utils/NetworkUtils;->isRoaming(Landroid/net/ConnectivityManager;)Z

    move-result v0

    if-eqz v0, :cond_2

    sget-object p0, Lcom/motorola/otalib/common/utils/NetworkUtils$networkType;->ROAMING:Lcom/motorola/otalib/common/utils/NetworkUtils$networkType;

    invoke-virtual {p0}, Lcom/motorola/otalib/common/utils/NetworkUtils$networkType;->name()Ljava/lang/String;

    move-result-object p0

    return-object p0

    :cond_2
    const-string v0, "LTE"

    invoke-virtual {v0, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_3

    sget-object p0, Lcom/motorola/otalib/common/utils/NetworkUtils$networkType;->CELL4G:Lcom/motorola/otalib/common/utils/NetworkUtils$networkType;

    invoke-virtual {p0}, Lcom/motorola/otalib/common/utils/NetworkUtils$networkType;->name()Ljava/lang/String;

    move-result-object p0

    return-object p0

    :cond_3
    const-string v0, "EHRPD"

    invoke-virtual {v0, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_6

    const-string v0, "HSPA"

    invoke-virtual {v0, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_6

    const-string v0, "HSPAPLUS"

    invoke-virtual {v0, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_6

    const-string v0, "HSDPA"

    invoke-virtual {v0, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_6

    const-string v0, "UMTS"

    invoke-virtual {v0, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_4

    goto :goto_0

    :cond_4
    const-string v0, "NR"

    invoke-virtual {v0, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-eqz p0, :cond_5

    sget-object p0, Lcom/motorola/otalib/common/utils/NetworkUtils$networkType;->CELL5G:Lcom/motorola/otalib/common/utils/NetworkUtils$networkType;

    invoke-virtual {p0}, Lcom/motorola/otalib/common/utils/NetworkUtils$networkType;->name()Ljava/lang/String;

    move-result-object p0

    return-object p0

    :cond_5
    sget-object p0, Lcom/motorola/otalib/common/utils/NetworkUtils$networkType;->CELLULAR:Lcom/motorola/otalib/common/utils/NetworkUtils$networkType;

    invoke-virtual {p0}, Lcom/motorola/otalib/common/utils/NetworkUtils$networkType;->name()Ljava/lang/String;

    move-result-object p0

    return-object p0

    :cond_6
    :goto_0
    sget-object p0, Lcom/motorola/otalib/common/utils/NetworkUtils$networkType;->CELL3G:Lcom/motorola/otalib/common/utils/NetworkUtils$networkType;

    invoke-virtual {p0}, Lcom/motorola/otalib/common/utils/NetworkUtils$networkType;->name()Ljava/lang/String;

    move-result-object p0

    return-object p0

    :cond_7
    :goto_1
    sget-object p0, Lcom/motorola/otalib/common/utils/NetworkUtils$networkType;->UNKNOWN:Lcom/motorola/otalib/common/utils/NetworkUtils$networkType;

    invoke-virtual {p0}, Lcom/motorola/otalib/common/utils/NetworkUtils$networkType;->name()Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method public static getNetworkCapabilityType(Landroid/net/ConnectivityManager;)I
    .locals 1

    if-eqz p0, :cond_0

    invoke-virtual {p0}, Landroid/net/ConnectivityManager;->getActiveNetwork()Landroid/net/Network;

    move-result-object v0

    invoke-virtual {p0, v0}, Landroid/net/ConnectivityManager;->getNetworkCapabilities(Landroid/net/Network;)Landroid/net/NetworkCapabilities;

    move-result-object p0

    invoke-static {p0}, Lcom/motorola/otalib/common/utils/NetworkUtils;->getNetworkCapabilityType(Landroid/net/NetworkCapabilities;)I

    move-result p0

    goto :goto_0

    :cond_0
    const/4 p0, -0x1

    :goto_0
    return p0
.end method

.method public static getNetworkCapabilityType(Landroid/net/NetworkCapabilities;)I
    .locals 3

    if-eqz p0, :cond_6

    const/16 v0, 0xc

    invoke-virtual {p0, v0}, Landroid/net/NetworkCapabilities;->hasCapability(I)Z

    move-result v0

    if-eqz v0, :cond_6

    const/4 v0, 0x1

    invoke-virtual {p0, v0}, Landroid/net/NetworkCapabilities;->hasTransport(I)Z

    move-result v1

    if-eqz v1, :cond_0

    goto :goto_1

    :cond_0
    const/4 v0, 0x4

    invoke-virtual {p0, v0}, Landroid/net/NetworkCapabilities;->hasTransport(I)Z

    move-result v1

    if-eqz v1, :cond_1

    goto :goto_1

    :cond_1
    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Landroid/net/NetworkCapabilities;->hasTransport(I)Z

    move-result v1

    if-eqz v1, :cond_2

    goto :goto_1

    :cond_2
    const/4 v0, 0x3

    invoke-virtual {p0, v0}, Landroid/net/NetworkCapabilities;->hasTransport(I)Z

    move-result v1

    if-eqz v1, :cond_3

    goto :goto_1

    :cond_3
    const/4 v1, 0x2

    invoke-virtual {p0, v1}, Landroid/net/NetworkCapabilities;->hasCapability(I)Z

    move-result v2

    if-eqz v2, :cond_4

    :goto_0
    move v0, v1

    goto :goto_1

    :cond_4
    const/16 v1, 0xa

    invoke-virtual {p0, v1}, Landroid/net/NetworkCapabilities;->hasCapability(I)Z

    move-result v2

    if-eqz v2, :cond_5

    goto :goto_0

    :cond_5
    invoke-virtual {p0, v0}, Landroid/net/NetworkCapabilities;->hasCapability(I)Z

    move-result p0

    if-eqz p0, :cond_6

    goto :goto_1

    :cond_6
    const/4 v0, -0x1

    :goto_1
    return v0
.end method

.method public static getWanType(Landroid/content/Context;Landroid/net/ConnectivityManager;Landroid/telephony/TelephonyManager;)I
    .locals 1

    const-string v0, "android.permission.READ_PHONE_STATE"

    invoke-static {p0, v0}, Lcom/motorola/otalib/common/utils/UpgradeUtils;->checkIfAlreadyhavePermission(Landroid/content/Context;Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_0

    const-string v0, "android.permission.READ_PRIVILEGED_PHONE_STATE"

    invoke-static {p0, v0}, Lcom/motorola/otalib/common/utils/UpgradeUtils;->checkIfAlreadyhavePermission(Landroid/content/Context;Ljava/lang/String;)Z

    move-result p0

    if-eqz p0, :cond_1

    :cond_0
    invoke-static {p1}, Lcom/motorola/otalib/common/utils/NetworkUtils;->hasNetwork(Landroid/net/ConnectivityManager;)Z

    move-result p0

    if-eqz p0, :cond_1

    invoke-virtual {p2}, Landroid/telephony/TelephonyManager;->getNetworkType()I

    move-result p0

    invoke-static {p0}, Lcom/motorola/otalib/common/utils/NetworkType;->fromCode(I)Lcom/motorola/otalib/common/utils/NetworkType;

    move-result-object p0

    invoke-virtual {p0}, Lcom/motorola/otalib/common/utils/NetworkType;->getNetworkTypeInt()I

    move-result p0

    return p0

    :cond_1
    const/4 p0, -0x1

    return p0
.end method

.method public static getWanTypeAsString(Landroid/content/Context;Landroid/net/ConnectivityManager;Landroid/telephony/TelephonyManager;)Ljava/lang/String;
    .locals 1

    const-string v0, "android.permission.READ_PHONE_STATE"

    invoke-static {p0, v0}, Lcom/motorola/otalib/common/utils/UpgradeUtils;->checkIfAlreadyhavePermission(Landroid/content/Context;Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_0

    const-string v0, "android.permission.READ_PRIVILEGED_PHONE_STATE"

    invoke-static {p0, v0}, Lcom/motorola/otalib/common/utils/UpgradeUtils;->checkIfAlreadyhavePermission(Landroid/content/Context;Ljava/lang/String;)Z

    move-result p0

    if-eqz p0, :cond_1

    :cond_0
    invoke-static {p1}, Lcom/motorola/otalib/common/utils/NetworkUtils;->hasNetwork(Landroid/net/ConnectivityManager;)Z

    move-result p0

    if-eqz p0, :cond_1

    invoke-virtual {p2}, Landroid/telephony/TelephonyManager;->getNetworkType()I

    move-result p0

    invoke-static {p0}, Lcom/motorola/otalib/common/utils/NetworkType;->fromCode(I)Lcom/motorola/otalib/common/utils/NetworkType;

    move-result-object p0

    invoke-virtual {p0}, Lcom/motorola/otalib/common/utils/NetworkType;->name()Ljava/lang/String;

    move-result-object p0

    return-object p0

    :cond_1
    const/4 p0, 0x0

    return-object p0
.end method

.method public static hasNetwork(Landroid/net/ConnectivityManager;)Z
    .locals 2

    const/4 v0, 0x0

    if-nez p0, :cond_0

    return v0

    :cond_0
    invoke-virtual {p0}, Landroid/net/ConnectivityManager;->getActiveNetwork()Landroid/net/Network;

    move-result-object v1

    invoke-virtual {p0, v1}, Landroid/net/ConnectivityManager;->getNetworkCapabilities(Landroid/net/Network;)Landroid/net/NetworkCapabilities;

    move-result-object p0

    if-eqz p0, :cond_1

    const/16 v1, 0xc

    invoke-virtual {p0, v1}, Landroid/net/NetworkCapabilities;->hasCapability(I)Z

    move-result p0

    if-eqz p0, :cond_1

    const/4 v0, 0x1

    :cond_1
    return v0
.end method

.method public static isAdminApn(Landroid/net/ConnectivityManager;)Z
    .locals 1

    if-eqz p0, :cond_0

    invoke-virtual {p0}, Landroid/net/ConnectivityManager;->getActiveNetwork()Landroid/net/Network;

    move-result-object v0

    if-eqz v0, :cond_0

    invoke-virtual {p0, v0}, Landroid/net/ConnectivityManager;->getNetworkCapabilities(Landroid/net/Network;)Landroid/net/NetworkCapabilities;

    move-result-object p0

    if-eqz p0, :cond_0

    const/16 v0, 0xc

    invoke-virtual {p0, v0}, Landroid/net/NetworkCapabilities;->hasCapability(I)Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 v0, 0x3

    invoke-virtual {p0, v0}, Landroid/net/NetworkCapabilities;->hasCapability(I)Z

    move-result p0

    return p0

    :cond_0
    const/4 p0, 0x0

    return p0
.end method

.method public static isNetWorkConnected(Landroid/net/ConnectivityManager;)Z
    .locals 3

    const/4 v0, 0x0

    if-nez p0, :cond_0

    return v0

    :cond_0
    invoke-virtual {p0}, Landroid/net/ConnectivityManager;->getActiveNetwork()Landroid/net/Network;

    move-result-object v1

    invoke-virtual {p0, v1}, Landroid/net/ConnectivityManager;->getNetworkCapabilities(Landroid/net/Network;)Landroid/net/NetworkCapabilities;

    move-result-object p0

    if-eqz p0, :cond_2

    const/16 v1, 0xc

    invoke-virtual {p0, v1}, Landroid/net/NetworkCapabilities;->hasCapability(I)Z

    move-result v1

    if-eqz v1, :cond_2

    const/4 v1, 0x1

    invoke-virtual {p0, v1}, Landroid/net/NetworkCapabilities;->hasTransport(I)Z

    move-result v2

    if-nez v2, :cond_1

    invoke-virtual {p0, v0}, Landroid/net/NetworkCapabilities;->hasTransport(I)Z

    move-result v2

    if-nez v2, :cond_1

    const/4 v2, 0x3

    invoke-virtual {p0, v2}, Landroid/net/NetworkCapabilities;->hasTransport(I)Z

    move-result v2

    if-nez v2, :cond_1

    const/4 v2, 0x4

    invoke-virtual {p0, v2}, Landroid/net/NetworkCapabilities;->hasTransport(I)Z

    move-result p0

    if-eqz p0, :cond_2

    :cond_1
    move v0, v1

    :cond_2
    return v0
.end method

.method public static isNetworkTagValid(Ljava/lang/String;)Z
    .locals 5

    sget-object v0, Lcom/motorola/otalib/common/utils/NetworkUtils;->NETWORK_TAG_LIST:[Ljava/lang/String;

    array-length v1, v0

    const/4 v2, 0x0

    move v3, v2

    :goto_0
    if-ge v3, v1, :cond_1

    aget-object v4, v0, v3

    invoke-virtual {v4, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_0

    const/4 p0, 0x1

    return p0

    :cond_0
    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    :cond_1
    return v2
.end method

.method public static isRoaming(Landroid/net/ConnectivityManager;)Z
    .locals 1

    if-eqz p0, :cond_0

    invoke-virtual {p0}, Landroid/net/ConnectivityManager;->getActiveNetwork()Landroid/net/Network;

    move-result-object v0

    if-eqz v0, :cond_0

    invoke-virtual {p0, v0}, Landroid/net/ConnectivityManager;->getNetworkCapabilities(Landroid/net/Network;)Landroid/net/NetworkCapabilities;

    move-result-object p0

    if-eqz p0, :cond_0

    const/16 v0, 0xc

    invoke-virtual {p0, v0}, Landroid/net/NetworkCapabilities;->hasCapability(I)Z

    move-result v0

    if-eqz v0, :cond_0

    const/16 v0, 0x12

    invoke-virtual {p0, v0}, Landroid/net/NetworkCapabilities;->hasCapability(I)Z

    move-result p0

    xor-int/lit8 p0, p0, 0x1

    return p0

    :cond_0
    const/4 p0, 0x0

    return p0
.end method

.method public static isSoftBankApn(Landroid/content/Context;)Z
    .locals 1

    const-string v0, "connectivity"

    invoke-virtual {p0, v0}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Landroid/net/ConnectivityManager;

    invoke-virtual {p0}, Landroid/net/ConnectivityManager;->getActiveNetwork()Landroid/net/Network;

    move-result-object v0

    invoke-virtual {p0, v0}, Landroid/net/ConnectivityManager;->getNetworkInfo(Landroid/net/Network;)Landroid/net/NetworkInfo;

    move-result-object p0

    if-eqz p0, :cond_0

    invoke-virtual {p0}, Landroid/net/NetworkInfo;->getExtraInfo()Ljava/lang/String;

    move-result-object p0

    const-string v0, "plus.acs.jp.v6"

    invoke-virtual {v0, p0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result p0

    if-eqz p0, :cond_0

    sget-object p0, Lcom/motorola/otalib/common/CommonLogger;->TAG:Ljava/lang/String;

    const-string v0, "isSoftbankApn: Softbank apn network, return true"

    invoke-static {p0, v0}, Lcom/motorola/otalib/common/CommonLogger;->v(Ljava/lang/String;Ljava/lang/String;)V

    const/4 p0, 0x1

    return p0

    :cond_0
    sget-object p0, Lcom/motorola/otalib/common/CommonLogger;->TAG:Ljava/lang/String;

    const-string v0, "isSoftbankApn: not Softbank apn network, return false"

    invoke-static {p0, v0}, Lcom/motorola/otalib/common/CommonLogger;->v(Ljava/lang/String;Ljava/lang/String;)V

    const/4 p0, 0x0

    return p0
.end method

.method public static isVerizonSIM(Landroid/content/Context;)Z
    .locals 9

    const-string v0, "phone"

    invoke-virtual {p0, v0}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Landroid/telephony/TelephonyManager;

    invoke-virtual {p0}, Landroid/telephony/TelephonyManager;->getSimOperator()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0}, Landroid/telephony/TelephonyManager;->getGroupIdLevel1()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p0}, Landroid/telephony/TelephonyManager;->getSubscriberId()Ljava/lang/String;

    move-result-object p0

    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v2

    const/4 v3, 0x0

    if-nez v2, :cond_8

    invoke-static {p0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v2

    if-nez v2, :cond_8

    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v2

    if-eqz v2, :cond_0

    goto/16 :goto_1

    :cond_0
    const-string v2, "2023.4"

    invoke-static {v2}, Lcom/motorola/otalib/common/utils/BuildPropertyUtils;->isProductWaveAtleastRefWave(Ljava/lang/String;)Z

    move-result v2

    const/4 v4, 0x1

    if-eqz v2, :cond_3

    sget-object p0, Lcom/motorola/otalib/common/utils/NetworkUtils;->DEFAULT_VZW_SIM:Ljava/util/HashMap;

    invoke-virtual {p0, v0}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Ljava/util/List;

    if-eqz p0, :cond_2

    invoke-interface {p0}, Ljava/util/List;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_1

    sget-object v0, Ljava/util/Locale;->ROOT:Ljava/util/Locale;

    invoke-virtual {v1, v0}, Ljava/lang/String;->toUpperCase(Ljava/util/Locale;)Ljava/lang/String;

    move-result-object v0

    invoke-interface {p0, v0}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    move-result p0

    if-eqz p0, :cond_2

    :cond_1
    move v3, v4

    :cond_2
    return v3

    :cond_3
    const/4 v2, 0x2

    new-array v5, v2, [Ljava/lang/String;

    const-string v6, "311480"

    aput-object v6, v5, v3

    const-string v6, "20404"

    aput-object v6, v5, v4

    const/4 v6, 0x3

    new-array v6, v6, [Ljava/lang/String;

    const-string v7, ""

    aput-object v7, v6, v3

    const-string v7, "BAE0000000000000"

    aput-object v7, v6, v4

    const-string v7, "BA01270000000000"

    aput-object v7, v6, v2

    move v7, v3

    :goto_0
    if-ge v7, v2, :cond_8

    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v8

    if-nez v8, :cond_4

    aget-object v8, v5, v7

    invoke-virtual {v0, v8}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v8

    if-nez v8, :cond_5

    :cond_4
    invoke-static {p0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v8

    if-nez v8, :cond_7

    aget-object v8, v5, v7

    invoke-virtual {p0, v8}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v8

    if-eqz v8, :cond_7

    :cond_5
    aget-object v8, v6, v7

    invoke-static {v8}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v8

    if-nez v8, :cond_6

    aget-object v8, v6, v7

    invoke-virtual {v8, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v8

    if-eqz v8, :cond_7

    :cond_6
    sget-object p0, Lcom/motorola/otalib/common/CommonLogger;->TAG:Ljava/lang/String;

    const-string v0, "It is Verizon SIM"

    invoke-static {p0, v0}, Lcom/motorola/otalib/common/CommonLogger;->d(Ljava/lang/String;Ljava/lang/String;)V

    return v4

    :cond_7
    add-int/lit8 v7, v7, 0x1

    goto :goto_0

    :cond_8
    :goto_1
    return v3
.end method

.method public static isWan(Landroid/net/ConnectivityManager;)Z
    .locals 0

    if-eqz p0, :cond_0

    invoke-static {p0}, Lcom/motorola/otalib/common/utils/NetworkUtils;->getNetworkCapabilityType(Landroid/net/ConnectivityManager;)I

    move-result p0

    if-nez p0, :cond_0

    const/4 p0, 0x1

    goto :goto_0

    :cond_0
    const/4 p0, 0x0

    :goto_0
    return p0
.end method

.method public static isWifi(Landroid/net/ConnectivityManager;)Z
    .locals 2

    if-eqz p0, :cond_0

    invoke-static {p0}, Lcom/motorola/otalib/common/utils/NetworkUtils;->getNetworkCapabilityType(Landroid/net/ConnectivityManager;)I

    move-result v0

    const/4 v1, 0x1

    if-eq v1, v0, :cond_1

    const/4 v0, 0x4

    invoke-static {p0}, Lcom/motorola/otalib/common/utils/NetworkUtils;->getNetworkCapabilityType(Landroid/net/ConnectivityManager;)I

    move-result p0

    if-ne v0, p0, :cond_0

    goto :goto_0

    :cond_0
    const/4 v1, 0x0

    :cond_1
    :goto_0
    return v1
.end method

.method public static isZeroRatedNetworkActive(Landroid/net/ConnectivityManager;)Z
    .locals 1

    invoke-static {p0}, Lcom/motorola/otalib/common/utils/NetworkUtils;->getNetworkCapabilityType(Landroid/net/ConnectivityManager;)I

    move-result p0

    const/4 v0, 0x3

    if-ne p0, v0, :cond_0

    const/4 p0, 0x1

    goto :goto_0

    :cond_0
    const/4 p0, 0x0

    :goto_0
    return p0
.end method

.method public static returnActiveNetwork(Landroid/net/ConnectivityManager;)Landroid/net/Network;
    .locals 0

    if-nez p0, :cond_0

    const/4 p0, 0x0

    return-object p0

    :cond_0
    invoke-virtual {p0}, Landroid/net/ConnectivityManager;->getActiveNetwork()Landroid/net/Network;

    move-result-object p0

    return-object p0
.end method
