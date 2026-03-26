.class public final enum Lcom/motorola/otalib/main/Settings/LibConfigs;
.super Ljava/lang/Enum;
.source "LibConfigs.java"

# interfaces
.implements Lcom/motorola/otalib/common/settings/ISetting;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum<",
        "Lcom/motorola/otalib/main/Settings/LibConfigs;",
        ">;",
        "Lcom/motorola/otalib/common/settings/ISetting;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcom/motorola/otalib/main/Settings/LibConfigs;

.field public static final enum APPIID:Lcom/motorola/otalib/main/Settings/LibConfigs;

.field public static final enum APPSECERET:Lcom/motorola/otalib/main/Settings/LibConfigs;

.field public static final enum BACKOFF_VALUES:Lcom/motorola/otalib/main/Settings/LibConfigs;

.field public static final enum CDS_HTTP_PROXY_HOST:Lcom/motorola/otalib/main/Settings/LibConfigs;

.field public static final enum CDS_HTTP_PROXY_PORT:Lcom/motorola/otalib/main/Settings/LibConfigs;

.field public static final enum CHECK_FOR_UPGRADE_HTTP_METHOD:Lcom/motorola/otalib/main/Settings/LibConfigs;

.field public static final enum CHECK_FOR_UPGRADE_HTTP_SECURE:Lcom/motorola/otalib/main/Settings/LibConfigs;

.field public static final enum CHECK_FOR_UPGRADE_TEST_URL:Lcom/motorola/otalib/main/Settings/LibConfigs;

.field public static final enum CHECK_FOR_UPGRADE_URL:Lcom/motorola/otalib/main/Settings/LibConfigs;

.field public static final enum DISALLOWED_NETS:Lcom/motorola/otalib/main/Settings/LibConfigs;

.field public static final enum DOWNLOAD_DESCRIPTOR:Lcom/motorola/otalib/main/Settings/LibConfigs;

.field public static final enum DOWNLOAD_DESCRIPTOR_HTTP_METHOD:Lcom/motorola/otalib/main/Settings/LibConfigs;

.field public static final enum DOWNLOAD_DESCRIPTOR_HTTP_RETRIES:Lcom/motorola/otalib/main/Settings/LibConfigs;

.field public static final enum DOWNLOAD_DESCRIPTOR_HTTP_SECURE:Lcom/motorola/otalib/main/Settings/LibConfigs;

.field public static final enum DOWNLOAD_DESCRIPTOR_TEST_URL:Lcom/motorola/otalib/main/Settings/LibConfigs;

.field public static final enum DOWNLOAD_DESCRIPTOR_TIME:Lcom/motorola/otalib/main/Settings/LibConfigs;

.field public static final enum DOWNLOAD_DESCRIPTOR_URL:Lcom/motorola/otalib/main/Settings/LibConfigs;

.field public static final enum DOWNLOAD_HTTP_PROXY_HOST:Lcom/motorola/otalib/main/Settings/LibConfigs;

.field public static final enum DOWNLOAD_HTTP_PROXY_PORT:Lcom/motorola/otalib/main/Settings/LibConfigs;

.field public static final enum MAX_RETRY_COUNT_DL:Lcom/motorola/otalib/main/Settings/LibConfigs;

.field public static final enum OTA_CONTEXT:Lcom/motorola/otalib/main/Settings/LibConfigs;

.field public static final enum OTA_LIB_DOWNLOAD_EXCEPTION_RETRY_ATTEMPTS:Lcom/motorola/otalib/main/Settings/LibConfigs;

.field public static final enum OTA_LIB_DOWNLOAD_RETRY_ATTEMPTS:Lcom/motorola/otalib/main/Settings/LibConfigs;

.field public static final enum PROVISION_TIME:Lcom/motorola/otalib/main/Settings/LibConfigs;

.field public static final enum UPDATE_SESSION_MAPPER:Lcom/motorola/otalib/main/Settings/LibConfigs;

.field public static final enum UPGRADE_STATE_HTTP_METHOD:Lcom/motorola/otalib/main/Settings/LibConfigs;

.field public static final enum UPGRADE_STATE_HTTP_RETRIES:Lcom/motorola/otalib/main/Settings/LibConfigs;

.field public static final enum UPGRADE_STATE_HTTP_SECURE:Lcom/motorola/otalib/main/Settings/LibConfigs;

.field public static final enum UPGRADE_STATE_TEST_URL:Lcom/motorola/otalib/main/Settings/LibConfigs;

.field public static final enum UPGRADE_STATE_URL:Lcom/motorola/otalib/main/Settings/LibConfigs;


# instance fields
.field private key:Ljava/lang/String;

.field private value:Ljava/lang/String;


# direct methods
.method private static synthetic $values()[Lcom/motorola/otalib/main/Settings/LibConfigs;
    .locals 30

    sget-object v0, Lcom/motorola/otalib/main/Settings/LibConfigs;->PROVISION_TIME:Lcom/motorola/otalib/main/Settings/LibConfigs;

    sget-object v1, Lcom/motorola/otalib/main/Settings/LibConfigs;->CHECK_FOR_UPGRADE_URL:Lcom/motorola/otalib/main/Settings/LibConfigs;

    sget-object v2, Lcom/motorola/otalib/main/Settings/LibConfigs;->OTA_CONTEXT:Lcom/motorola/otalib/main/Settings/LibConfigs;

    sget-object v3, Lcom/motorola/otalib/main/Settings/LibConfigs;->CHECK_FOR_UPGRADE_HTTP_SECURE:Lcom/motorola/otalib/main/Settings/LibConfigs;

    sget-object v4, Lcom/motorola/otalib/main/Settings/LibConfigs;->CDS_HTTP_PROXY_HOST:Lcom/motorola/otalib/main/Settings/LibConfigs;

    sget-object v5, Lcom/motorola/otalib/main/Settings/LibConfigs;->CDS_HTTP_PROXY_PORT:Lcom/motorola/otalib/main/Settings/LibConfigs;

    sget-object v6, Lcom/motorola/otalib/main/Settings/LibConfigs;->BACKOFF_VALUES:Lcom/motorola/otalib/main/Settings/LibConfigs;

    sget-object v7, Lcom/motorola/otalib/main/Settings/LibConfigs;->CHECK_FOR_UPGRADE_HTTP_METHOD:Lcom/motorola/otalib/main/Settings/LibConfigs;

    sget-object v8, Lcom/motorola/otalib/main/Settings/LibConfigs;->DOWNLOAD_DESCRIPTOR_URL:Lcom/motorola/otalib/main/Settings/LibConfigs;

    sget-object v9, Lcom/motorola/otalib/main/Settings/LibConfigs;->DOWNLOAD_DESCRIPTOR_HTTP_METHOD:Lcom/motorola/otalib/main/Settings/LibConfigs;

    sget-object v10, Lcom/motorola/otalib/main/Settings/LibConfigs;->DOWNLOAD_DESCRIPTOR_HTTP_SECURE:Lcom/motorola/otalib/main/Settings/LibConfigs;

    sget-object v11, Lcom/motorola/otalib/main/Settings/LibConfigs;->DOWNLOAD_DESCRIPTOR_HTTP_RETRIES:Lcom/motorola/otalib/main/Settings/LibConfigs;

    sget-object v12, Lcom/motorola/otalib/main/Settings/LibConfigs;->UPGRADE_STATE_URL:Lcom/motorola/otalib/main/Settings/LibConfigs;

    sget-object v13, Lcom/motorola/otalib/main/Settings/LibConfigs;->UPGRADE_STATE_HTTP_METHOD:Lcom/motorola/otalib/main/Settings/LibConfigs;

    sget-object v14, Lcom/motorola/otalib/main/Settings/LibConfigs;->UPGRADE_STATE_HTTP_SECURE:Lcom/motorola/otalib/main/Settings/LibConfigs;

    sget-object v15, Lcom/motorola/otalib/main/Settings/LibConfigs;->UPGRADE_STATE_HTTP_RETRIES:Lcom/motorola/otalib/main/Settings/LibConfigs;

    sget-object v16, Lcom/motorola/otalib/main/Settings/LibConfigs;->DOWNLOAD_HTTP_PROXY_HOST:Lcom/motorola/otalib/main/Settings/LibConfigs;

    sget-object v17, Lcom/motorola/otalib/main/Settings/LibConfigs;->DOWNLOAD_HTTP_PROXY_PORT:Lcom/motorola/otalib/main/Settings/LibConfigs;

    sget-object v18, Lcom/motorola/otalib/main/Settings/LibConfigs;->DISALLOWED_NETS:Lcom/motorola/otalib/main/Settings/LibConfigs;

    sget-object v19, Lcom/motorola/otalib/main/Settings/LibConfigs;->APPIID:Lcom/motorola/otalib/main/Settings/LibConfigs;

    sget-object v20, Lcom/motorola/otalib/main/Settings/LibConfigs;->APPSECERET:Lcom/motorola/otalib/main/Settings/LibConfigs;

    sget-object v21, Lcom/motorola/otalib/main/Settings/LibConfigs;->CHECK_FOR_UPGRADE_TEST_URL:Lcom/motorola/otalib/main/Settings/LibConfigs;

    sget-object v22, Lcom/motorola/otalib/main/Settings/LibConfigs;->UPGRADE_STATE_TEST_URL:Lcom/motorola/otalib/main/Settings/LibConfigs;

    sget-object v23, Lcom/motorola/otalib/main/Settings/LibConfigs;->DOWNLOAD_DESCRIPTOR_TEST_URL:Lcom/motorola/otalib/main/Settings/LibConfigs;

    sget-object v24, Lcom/motorola/otalib/main/Settings/LibConfigs;->MAX_RETRY_COUNT_DL:Lcom/motorola/otalib/main/Settings/LibConfigs;

    sget-object v25, Lcom/motorola/otalib/main/Settings/LibConfigs;->OTA_LIB_DOWNLOAD_RETRY_ATTEMPTS:Lcom/motorola/otalib/main/Settings/LibConfigs;

    sget-object v26, Lcom/motorola/otalib/main/Settings/LibConfigs;->OTA_LIB_DOWNLOAD_EXCEPTION_RETRY_ATTEMPTS:Lcom/motorola/otalib/main/Settings/LibConfigs;

    sget-object v27, Lcom/motorola/otalib/main/Settings/LibConfigs;->DOWNLOAD_DESCRIPTOR:Lcom/motorola/otalib/main/Settings/LibConfigs;

    sget-object v28, Lcom/motorola/otalib/main/Settings/LibConfigs;->DOWNLOAD_DESCRIPTOR_TIME:Lcom/motorola/otalib/main/Settings/LibConfigs;

    sget-object v29, Lcom/motorola/otalib/main/Settings/LibConfigs;->UPDATE_SESSION_MAPPER:Lcom/motorola/otalib/main/Settings/LibConfigs;

    filled-new-array/range {v0 .. v29}, [Lcom/motorola/otalib/main/Settings/LibConfigs;

    move-result-object v0

    return-object v0
.end method

.method static constructor <clinit>()V
    .locals 10

    new-instance v0, Lcom/motorola/otalib/main/Settings/LibConfigs;

    const-string v1, "PROVISION_TIME"

    const/4 v2, 0x0

    const-string v3, "otalib.service.update.provisionTime"

    const-string v4, ""

    invoke-direct {v0, v1, v2, v3, v4}, Lcom/motorola/otalib/main/Settings/LibConfigs;-><init>(Ljava/lang/String;ILjava/lang/String;Ljava/lang/String;)V

    sput-object v0, Lcom/motorola/otalib/main/Settings/LibConfigs;->PROVISION_TIME:Lcom/motorola/otalib/main/Settings/LibConfigs;

    new-instance v0, Lcom/motorola/otalib/main/Settings/LibConfigs;

    const-string v1, "ota.service.update.check.url"

    const-string v2, "cds/upgrade/1/check"

    const-string v3, "CHECK_FOR_UPGRADE_URL"

    const/4 v5, 0x1

    invoke-direct {v0, v3, v5, v1, v2}, Lcom/motorola/otalib/main/Settings/LibConfigs;-><init>(Ljava/lang/String;ILjava/lang/String;Ljava/lang/String;)V

    sput-object v0, Lcom/motorola/otalib/main/Settings/LibConfigs;->CHECK_FOR_UPGRADE_URL:Lcom/motorola/otalib/main/Settings/LibConfigs;

    new-instance v0, Lcom/motorola/otalib/main/Settings/LibConfigs;

    const-string v1, "ota.service.update.context"

    const-string v2, "ota"

    const-string v3, "OTA_CONTEXT"

    const/4 v5, 0x2

    invoke-direct {v0, v3, v5, v1, v2}, Lcom/motorola/otalib/main/Settings/LibConfigs;-><init>(Ljava/lang/String;ILjava/lang/String;Ljava/lang/String;)V

    sput-object v0, Lcom/motorola/otalib/main/Settings/LibConfigs;->OTA_CONTEXT:Lcom/motorola/otalib/main/Settings/LibConfigs;

    new-instance v0, Lcom/motorola/otalib/main/Settings/LibConfigs;

    const-string v1, "CHECK_FOR_UPGRADE_HTTP_SECURE"

    const/4 v2, 0x3

    const-string v3, "ota.service.update.check.issecure"

    const-string v5, "true"

    invoke-direct {v0, v1, v2, v3, v5}, Lcom/motorola/otalib/main/Settings/LibConfigs;-><init>(Ljava/lang/String;ILjava/lang/String;Ljava/lang/String;)V

    sput-object v0, Lcom/motorola/otalib/main/Settings/LibConfigs;->CHECK_FOR_UPGRADE_HTTP_SECURE:Lcom/motorola/otalib/main/Settings/LibConfigs;

    new-instance v0, Lcom/motorola/otalib/main/Settings/LibConfigs;

    const/4 v1, 0x4

    const-string v2, "ota.service.update.cds.httpProxyHost"

    const-string v3, "CDS_HTTP_PROXY_HOST"

    invoke-direct {v0, v3, v1, v2, v4}, Lcom/motorola/otalib/main/Settings/LibConfigs;-><init>(Ljava/lang/String;ILjava/lang/String;Ljava/lang/String;)V

    sput-object v0, Lcom/motorola/otalib/main/Settings/LibConfigs;->CDS_HTTP_PROXY_HOST:Lcom/motorola/otalib/main/Settings/LibConfigs;

    new-instance v0, Lcom/motorola/otalib/main/Settings/LibConfigs;

    const-string v1, "CDS_HTTP_PROXY_PORT"

    const/4 v2, 0x5

    const-string v3, "ota.service.update.cds.httpProxyPort"

    const-string v6, "-1"

    invoke-direct {v0, v1, v2, v3, v6}, Lcom/motorola/otalib/main/Settings/LibConfigs;-><init>(Ljava/lang/String;ILjava/lang/String;Ljava/lang/String;)V

    sput-object v0, Lcom/motorola/otalib/main/Settings/LibConfigs;->CDS_HTTP_PROXY_PORT:Lcom/motorola/otalib/main/Settings/LibConfigs;

    new-instance v0, Lcom/motorola/otalib/main/Settings/LibConfigs;

    const-string v1, "ota.service.update.backOffValues"

    const-string v2, "5000,15000,30000"

    const-string v3, "BACKOFF_VALUES"

    const/4 v7, 0x6

    invoke-direct {v0, v3, v7, v1, v2}, Lcom/motorola/otalib/main/Settings/LibConfigs;-><init>(Ljava/lang/String;ILjava/lang/String;Ljava/lang/String;)V

    sput-object v0, Lcom/motorola/otalib/main/Settings/LibConfigs;->BACKOFF_VALUES:Lcom/motorola/otalib/main/Settings/LibConfigs;

    new-instance v0, Lcom/motorola/otalib/main/Settings/LibConfigs;

    const-string v1, "CHECK_FOR_UPGRADE_HTTP_METHOD"

    const/4 v2, 0x7

    const-string v3, "ota.service.update.check.httpmethod"

    const-string v7, "post"

    invoke-direct {v0, v1, v2, v3, v7}, Lcom/motorola/otalib/main/Settings/LibConfigs;-><init>(Ljava/lang/String;ILjava/lang/String;Ljava/lang/String;)V

    sput-object v0, Lcom/motorola/otalib/main/Settings/LibConfigs;->CHECK_FOR_UPGRADE_HTTP_METHOD:Lcom/motorola/otalib/main/Settings/LibConfigs;

    new-instance v0, Lcom/motorola/otalib/main/Settings/LibConfigs;

    const-string v1, "ota.service.update.dd.url"

    const-string v2, "cds/upgrade/1/resources"

    const-string v3, "DOWNLOAD_DESCRIPTOR_URL"

    const/16 v8, 0x8

    invoke-direct {v0, v3, v8, v1, v2}, Lcom/motorola/otalib/main/Settings/LibConfigs;-><init>(Ljava/lang/String;ILjava/lang/String;Ljava/lang/String;)V

    sput-object v0, Lcom/motorola/otalib/main/Settings/LibConfigs;->DOWNLOAD_DESCRIPTOR_URL:Lcom/motorola/otalib/main/Settings/LibConfigs;

    new-instance v0, Lcom/motorola/otalib/main/Settings/LibConfigs;

    const/16 v1, 0x9

    const-string v2, "ota.service.update.dd.httpmethod"

    const-string v3, "DOWNLOAD_DESCRIPTOR_HTTP_METHOD"

    invoke-direct {v0, v3, v1, v2, v7}, Lcom/motorola/otalib/main/Settings/LibConfigs;-><init>(Ljava/lang/String;ILjava/lang/String;Ljava/lang/String;)V

    sput-object v0, Lcom/motorola/otalib/main/Settings/LibConfigs;->DOWNLOAD_DESCRIPTOR_HTTP_METHOD:Lcom/motorola/otalib/main/Settings/LibConfigs;

    new-instance v0, Lcom/motorola/otalib/main/Settings/LibConfigs;

    const/16 v1, 0xa

    const-string v2, "ota.service.update.dd.issecure"

    const-string v3, "DOWNLOAD_DESCRIPTOR_HTTP_SECURE"

    invoke-direct {v0, v3, v1, v2, v5}, Lcom/motorola/otalib/main/Settings/LibConfigs;-><init>(Ljava/lang/String;ILjava/lang/String;Ljava/lang/String;)V

    sput-object v0, Lcom/motorola/otalib/main/Settings/LibConfigs;->DOWNLOAD_DESCRIPTOR_HTTP_SECURE:Lcom/motorola/otalib/main/Settings/LibConfigs;

    new-instance v0, Lcom/motorola/otalib/main/Settings/LibConfigs;

    const-string v1, "DOWNLOAD_DESCRIPTOR_HTTP_RETRIES"

    const/16 v2, 0xb

    const-string v3, "ota.service.update.dd.retries"

    const-string v8, "3"

    invoke-direct {v0, v1, v2, v3, v8}, Lcom/motorola/otalib/main/Settings/LibConfigs;-><init>(Ljava/lang/String;ILjava/lang/String;Ljava/lang/String;)V

    sput-object v0, Lcom/motorola/otalib/main/Settings/LibConfigs;->DOWNLOAD_DESCRIPTOR_HTTP_RETRIES:Lcom/motorola/otalib/main/Settings/LibConfigs;

    new-instance v0, Lcom/motorola/otalib/main/Settings/LibConfigs;

    const-string v1, "ota.service.update.state.url"

    const-string v2, "cds/upgrade/1/state"

    const-string v3, "UPGRADE_STATE_URL"

    const/16 v9, 0xc

    invoke-direct {v0, v3, v9, v1, v2}, Lcom/motorola/otalib/main/Settings/LibConfigs;-><init>(Ljava/lang/String;ILjava/lang/String;Ljava/lang/String;)V

    sput-object v0, Lcom/motorola/otalib/main/Settings/LibConfigs;->UPGRADE_STATE_URL:Lcom/motorola/otalib/main/Settings/LibConfigs;

    new-instance v0, Lcom/motorola/otalib/main/Settings/LibConfigs;

    const/16 v1, 0xd

    const-string v2, "ota.service.update.state.httpmethod"

    const-string v3, "UPGRADE_STATE_HTTP_METHOD"

    invoke-direct {v0, v3, v1, v2, v7}, Lcom/motorola/otalib/main/Settings/LibConfigs;-><init>(Ljava/lang/String;ILjava/lang/String;Ljava/lang/String;)V

    sput-object v0, Lcom/motorola/otalib/main/Settings/LibConfigs;->UPGRADE_STATE_HTTP_METHOD:Lcom/motorola/otalib/main/Settings/LibConfigs;

    new-instance v0, Lcom/motorola/otalib/main/Settings/LibConfigs;

    const/16 v1, 0xe

    const-string v2, "ota.service.update.state.issecure"

    const-string v3, "UPGRADE_STATE_HTTP_SECURE"

    invoke-direct {v0, v3, v1, v2, v5}, Lcom/motorola/otalib/main/Settings/LibConfigs;-><init>(Ljava/lang/String;ILjava/lang/String;Ljava/lang/String;)V

    sput-object v0, Lcom/motorola/otalib/main/Settings/LibConfigs;->UPGRADE_STATE_HTTP_SECURE:Lcom/motorola/otalib/main/Settings/LibConfigs;

    new-instance v0, Lcom/motorola/otalib/main/Settings/LibConfigs;

    const/16 v1, 0xf

    const-string v2, "ota.service.update.state.retries"

    const-string v3, "UPGRADE_STATE_HTTP_RETRIES"

    invoke-direct {v0, v3, v1, v2, v8}, Lcom/motorola/otalib/main/Settings/LibConfigs;-><init>(Ljava/lang/String;ILjava/lang/String;Ljava/lang/String;)V

    sput-object v0, Lcom/motorola/otalib/main/Settings/LibConfigs;->UPGRADE_STATE_HTTP_RETRIES:Lcom/motorola/otalib/main/Settings/LibConfigs;

    new-instance v0, Lcom/motorola/otalib/main/Settings/LibConfigs;

    const/16 v1, 0x10

    const-string v2, "ota.service.update.download.httpProxyHost"

    const-string v3, "DOWNLOAD_HTTP_PROXY_HOST"

    invoke-direct {v0, v3, v1, v2, v4}, Lcom/motorola/otalib/main/Settings/LibConfigs;-><init>(Ljava/lang/String;ILjava/lang/String;Ljava/lang/String;)V

    sput-object v0, Lcom/motorola/otalib/main/Settings/LibConfigs;->DOWNLOAD_HTTP_PROXY_HOST:Lcom/motorola/otalib/main/Settings/LibConfigs;

    new-instance v0, Lcom/motorola/otalib/main/Settings/LibConfigs;

    const/16 v1, 0x11

    const-string v2, "ota.service.update.download.httpProxyPort"

    const-string v3, "DOWNLOAD_HTTP_PROXY_PORT"

    invoke-direct {v0, v3, v1, v2, v6}, Lcom/motorola/otalib/main/Settings/LibConfigs;-><init>(Ljava/lang/String;ILjava/lang/String;Ljava/lang/String;)V

    sput-object v0, Lcom/motorola/otalib/main/Settings/LibConfigs;->DOWNLOAD_HTTP_PROXY_PORT:Lcom/motorola/otalib/main/Settings/LibConfigs;

    new-instance v0, Lcom/motorola/otalib/main/Settings/LibConfigs;

    const/16 v1, 0x12

    const-string v2, "ota.service.update.disallowed_networks"

    const-string v3, "DISALLOWED_NETS"

    invoke-direct {v0, v3, v1, v2, v4}, Lcom/motorola/otalib/main/Settings/LibConfigs;-><init>(Ljava/lang/String;ILjava/lang/String;Ljava/lang/String;)V

    sput-object v0, Lcom/motorola/otalib/main/Settings/LibConfigs;->DISALLOWED_NETS:Lcom/motorola/otalib/main/Settings/LibConfigs;

    new-instance v0, Lcom/motorola/otalib/main/Settings/LibConfigs;

    const-string v1, "com.motorola.ccc.ota.botaplugin.appid"

    const-string v2, "MGVKHZWFLNFPYQYLCTOVJLD5LURFMPKZ"

    const-string v3, "APPIID"

    const/16 v5, 0x13

    invoke-direct {v0, v3, v5, v1, v2}, Lcom/motorola/otalib/main/Settings/LibConfigs;-><init>(Ljava/lang/String;ILjava/lang/String;Ljava/lang/String;)V

    sput-object v0, Lcom/motorola/otalib/main/Settings/LibConfigs;->APPIID:Lcom/motorola/otalib/main/Settings/LibConfigs;

    new-instance v0, Lcom/motorola/otalib/main/Settings/LibConfigs;

    const-string v1, "com.motorola.ccc.ota.botaplugin.appsecret"

    const-string v2, "zdG4h4k2NOm6MSh"

    const-string v3, "APPSECERET"

    const/16 v5, 0x14

    invoke-direct {v0, v3, v5, v1, v2}, Lcom/motorola/otalib/main/Settings/LibConfigs;-><init>(Ljava/lang/String;ILjava/lang/String;Ljava/lang/String;)V

    sput-object v0, Lcom/motorola/otalib/main/Settings/LibConfigs;->APPSECERET:Lcom/motorola/otalib/main/Settings/LibConfigs;

    new-instance v0, Lcom/motorola/otalib/main/Settings/LibConfigs;

    const/16 v1, 0x15

    const-string v2, "ota.service.update.checkrequest.test.url"

    const-string v3, "CHECK_FOR_UPGRADE_TEST_URL"

    invoke-direct {v0, v3, v1, v2, v4}, Lcom/motorola/otalib/main/Settings/LibConfigs;-><init>(Ljava/lang/String;ILjava/lang/String;Ljava/lang/String;)V

    sput-object v0, Lcom/motorola/otalib/main/Settings/LibConfigs;->CHECK_FOR_UPGRADE_TEST_URL:Lcom/motorola/otalib/main/Settings/LibConfigs;

    new-instance v0, Lcom/motorola/otalib/main/Settings/LibConfigs;

    const/16 v1, 0x16

    const-string v2, "ota.service.update.staterequest.test.url"

    const-string v3, "UPGRADE_STATE_TEST_URL"

    invoke-direct {v0, v3, v1, v2, v4}, Lcom/motorola/otalib/main/Settings/LibConfigs;-><init>(Ljava/lang/String;ILjava/lang/String;Ljava/lang/String;)V

    sput-object v0, Lcom/motorola/otalib/main/Settings/LibConfigs;->UPGRADE_STATE_TEST_URL:Lcom/motorola/otalib/main/Settings/LibConfigs;

    new-instance v0, Lcom/motorola/otalib/main/Settings/LibConfigs;

    const/16 v1, 0x17

    const-string v2, "ota.service.update.resourcerequest.test.url"

    const-string v3, "DOWNLOAD_DESCRIPTOR_TEST_URL"

    invoke-direct {v0, v3, v1, v2, v4}, Lcom/motorola/otalib/main/Settings/LibConfigs;-><init>(Ljava/lang/String;ILjava/lang/String;Ljava/lang/String;)V

    sput-object v0, Lcom/motorola/otalib/main/Settings/LibConfigs;->DOWNLOAD_DESCRIPTOR_TEST_URL:Lcom/motorola/otalib/main/Settings/LibConfigs;

    new-instance v0, Lcom/motorola/otalib/main/Settings/LibConfigs;

    const/16 v1, 0x18

    const-string v2, "ota.service.update.maxRetryCountDownload"

    const-string v3, "MAX_RETRY_COUNT_DL"

    invoke-direct {v0, v3, v1, v2, v8}, Lcom/motorola/otalib/main/Settings/LibConfigs;-><init>(Ljava/lang/String;ILjava/lang/String;Ljava/lang/String;)V

    sput-object v0, Lcom/motorola/otalib/main/Settings/LibConfigs;->MAX_RETRY_COUNT_DL:Lcom/motorola/otalib/main/Settings/LibConfigs;

    new-instance v0, Lcom/motorola/otalib/main/Settings/LibConfigs;

    const/16 v1, 0x19

    const-string v2, "com.motorola.otalib.OTA_LIB_DOWNLOAD_RETRY_ATTEMPTS"

    const-string v3, "OTA_LIB_DOWNLOAD_RETRY_ATTEMPTS"

    invoke-direct {v0, v3, v1, v2, v4}, Lcom/motorola/otalib/main/Settings/LibConfigs;-><init>(Ljava/lang/String;ILjava/lang/String;Ljava/lang/String;)V

    sput-object v0, Lcom/motorola/otalib/main/Settings/LibConfigs;->OTA_LIB_DOWNLOAD_RETRY_ATTEMPTS:Lcom/motorola/otalib/main/Settings/LibConfigs;

    new-instance v0, Lcom/motorola/otalib/main/Settings/LibConfigs;

    const/16 v1, 0x1a

    const-string v2, "com.motorola.otalib.OTA_LIB_DOWNLOAD_EXCEPTION_RETRY_ATTEMPTS"

    const-string v3, "OTA_LIB_DOWNLOAD_EXCEPTION_RETRY_ATTEMPTS"

    invoke-direct {v0, v3, v1, v2, v4}, Lcom/motorola/otalib/main/Settings/LibConfigs;-><init>(Ljava/lang/String;ILjava/lang/String;Ljava/lang/String;)V

    sput-object v0, Lcom/motorola/otalib/main/Settings/LibConfigs;->OTA_LIB_DOWNLOAD_EXCEPTION_RETRY_ATTEMPTS:Lcom/motorola/otalib/main/Settings/LibConfigs;

    new-instance v0, Lcom/motorola/otalib/main/Settings/LibConfigs;

    const/16 v1, 0x1b

    const-string v2, "com.motorola.ccc.ota.botaplugin.download_descriptor"

    const-string v3, "DOWNLOAD_DESCRIPTOR"

    invoke-direct {v0, v3, v1, v2, v4}, Lcom/motorola/otalib/main/Settings/LibConfigs;-><init>(Ljava/lang/String;ILjava/lang/String;Ljava/lang/String;)V

    sput-object v0, Lcom/motorola/otalib/main/Settings/LibConfigs;->DOWNLOAD_DESCRIPTOR:Lcom/motorola/otalib/main/Settings/LibConfigs;

    new-instance v0, Lcom/motorola/otalib/main/Settings/LibConfigs;

    const/16 v1, 0x1c

    const-string v2, "com.motorola.ccc.ota.botaplugin.download_descriptor_time"

    const-string v3, "DOWNLOAD_DESCRIPTOR_TIME"

    invoke-direct {v0, v3, v1, v2, v4}, Lcom/motorola/otalib/main/Settings/LibConfigs;-><init>(Ljava/lang/String;ILjava/lang/String;Ljava/lang/String;)V

    sput-object v0, Lcom/motorola/otalib/main/Settings/LibConfigs;->DOWNLOAD_DESCRIPTOR_TIME:Lcom/motorola/otalib/main/Settings/LibConfigs;

    new-instance v0, Lcom/motorola/otalib/main/Settings/LibConfigs;

    const/16 v1, 0x1d

    const-string v2, "com.motorola.ccc.ota.UPDATE_SESSION_MAPPER"

    const-string v3, "UPDATE_SESSION_MAPPER"

    invoke-direct {v0, v3, v1, v2, v4}, Lcom/motorola/otalib/main/Settings/LibConfigs;-><init>(Ljava/lang/String;ILjava/lang/String;Ljava/lang/String;)V

    sput-object v0, Lcom/motorola/otalib/main/Settings/LibConfigs;->UPDATE_SESSION_MAPPER:Lcom/motorola/otalib/main/Settings/LibConfigs;

    invoke-static {}, Lcom/motorola/otalib/main/Settings/LibConfigs;->$values()[Lcom/motorola/otalib/main/Settings/LibConfigs;

    move-result-object v0

    sput-object v0, Lcom/motorola/otalib/main/Settings/LibConfigs;->$VALUES:[Lcom/motorola/otalib/main/Settings/LibConfigs;

    return-void
.end method

.method private constructor <init>(Ljava/lang/String;ILjava/lang/String;Ljava/lang/String;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ")V"
        }
    .end annotation

    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    iput-object p3, p0, Lcom/motorola/otalib/main/Settings/LibConfigs;->key:Ljava/lang/String;

    iput-object p4, p0, Lcom/motorola/otalib/main/Settings/LibConfigs;->value:Ljava/lang/String;

    return-void
.end method

.method public static returnAll()Ljava/util/List;
    .locals 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    invoke-static {}, Lcom/motorola/otalib/main/Settings/LibConfigs;->values()[Lcom/motorola/otalib/main/Settings/LibConfigs;

    move-result-object v0

    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    array-length v2, v0

    const/4 v3, 0x0

    :goto_0
    if-ge v3, v2, :cond_0

    aget-object v4, v0, v3

    invoke-virtual {v4}, Lcom/motorola/otalib/main/Settings/LibConfigs;->key()Ljava/lang/String;

    move-result-object v4

    invoke-interface {v1, v4}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    :cond_0
    return-object v1
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/motorola/otalib/main/Settings/LibConfigs;
    .locals 1

    const-class v0, Lcom/motorola/otalib/main/Settings/LibConfigs;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object p0

    check-cast p0, Lcom/motorola/otalib/main/Settings/LibConfigs;

    return-object p0
.end method

.method public static values()[Lcom/motorola/otalib/main/Settings/LibConfigs;
    .locals 1

    sget-object v0, Lcom/motorola/otalib/main/Settings/LibConfigs;->$VALUES:[Lcom/motorola/otalib/main/Settings/LibConfigs;

    invoke-virtual {v0}, [Lcom/motorola/otalib/main/Settings/LibConfigs;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lcom/motorola/otalib/main/Settings/LibConfigs;

    return-object v0
.end method


# virtual methods
.method public key()Ljava/lang/String;
    .locals 0

    iget-object p0, p0, Lcom/motorola/otalib/main/Settings/LibConfigs;->key:Ljava/lang/String;

    return-object p0
.end method

.method public value()Ljava/lang/String;
    .locals 0

    iget-object p0, p0, Lcom/motorola/otalib/main/Settings/LibConfigs;->value:Ljava/lang/String;

    return-object p0
.end method
