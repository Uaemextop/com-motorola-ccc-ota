.class public Lcom/motorola/otalib/downloadservice/utils/DownloadServiceSettings;
.super Lcom/motorola/otalib/common/settings/Settings;
.source "DownloadServiceSettings.java"


# static fields
.field public static final DOWNLOAD_SOCKET_TIMEOUT:I = 0x493e0

.field public static final KEY_ADMIN_APN_STATUS:Ljava/lang/String; = "adminapnstatus"

.field public static final KEY_DOWNLOAD_BACKOFF_VALUE:Ljava/lang/String; = "downloadBackoffValues"

.field public static final KEY_DOWNLOAD_REQUEST:Ljava/lang/String; = "downloadRequest"

.field public static final KEY_DOWNLOAD_SOCKET_TIMEOUT:Ljava/lang/String; = "downloadSocketTimeout"

.field public static final KEY_DO_NOT_BIND_OTA_PROCESS:Ljava/lang/String; = "doNotBindOtaProcess"

.field public static final KEY_FEATURE_NAME:Ljava/lang/String; = "feature"

.field public static final KEY_ID:Ljava/lang/String; = "id"

.field public static final KEY_NETWORK_TYPE:Ljava/lang/String; = "networktype"

.field public static final KEY_PREFS_NAME:Ljava/lang/String; = "dl_prefs"


# direct methods
.method public constructor <init>(Landroid/content/SharedPreferences;)V
    .locals 0

    invoke-direct {p0, p1}, Lcom/motorola/otalib/common/settings/Settings;-><init>(Landroid/content/SharedPreferences;)V

    return-void
.end method


# virtual methods
.method public clearConfigValue(Ljava/lang/String;)V
    .locals 0

    invoke-virtual {p0, p1}, Lcom/motorola/otalib/downloadservice/utils/DownloadServiceSettings;->removeConfig(Ljava/lang/String;)V

    return-void
.end method

.method public getConfigValue(Ljava/lang/String;)Ljava/lang/String;
    .locals 0

    invoke-virtual {p0, p1}, Lcom/motorola/otalib/downloadservice/utils/DownloadServiceSettings;->getConfig(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method public getConfigValueInt(Ljava/lang/String;)I
    .locals 0

    :try_start_0
    invoke-virtual {p0, p1}, Lcom/motorola/otalib/downloadservice/utils/DownloadServiceSettings;->getConfig(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    invoke-static {p0}, Ljava/lang/Integer;->valueOf(Ljava/lang/String;)Ljava/lang/Integer;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/Integer;->intValue()I

    move-result p0
    :try_end_0
    .catch Ljava/lang/NumberFormatException; {:try_start_0 .. :try_end_0} :catch_0

    return p0

    :catch_0
    const/4 p0, 0x0

    return p0
.end method

.method public setConfigValue(Ljava/lang/String;Ljava/lang/String;)V
    .locals 0

    invoke-virtual {p0, p1, p2}, Lcom/motorola/otalib/downloadservice/utils/DownloadServiceSettings;->setConfig(Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method
