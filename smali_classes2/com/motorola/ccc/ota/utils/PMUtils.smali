.class public Lcom/motorola/ccc/ota/utils/PMUtils;
.super Ljava/lang/Object;
.source "PMUtils.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/motorola/ccc/ota/utils/PMUtils$PMErrorCodes;
    }
.end annotation


# static fields
.field public static final APP_IS_EASY:I = 0x7fffffff

.field public static final ARBITRARY_TOLERANCE:I = -0x1

.field public static final BIND_POLLINGMANAGER_WSPROXY_SVC:Ljava/lang/String; = "com.motorola.ccc.ota.pm.BIND_POLLINGMANAGER_WSPROXY_SVC"

.field public static final DEFAULT_POLL_VALUE:I = 0x15180

.field public static final KEY_APPSECRET:Ljava/lang/String; = "com.motorola.ccc.ota.pm.appsecret"

.field public static final KEY_CONNECTIVITY_EXTRA:Ljava/lang/String; = "com.motorola.ccc.ota.pm.connectivity"

.field public static final KEY_CONNECTIVITY_TYPE_EXTRA:Ljava/lang/String; = "com.motorola.ccc.ota.pm.connectivityType"

.field public static final KEY_DATAROAMING_EXTRA:Ljava/lang/String; = "com.motorola.ccc.ota.pm.dataroaming"

.field public static final KEY_ROAMING_EXTRA:Ljava/lang/String; = "com.motorola.ccc.ota.pm.roaming"

.field public static final MAX_MODEM_POLLING_COUNT_PRIMARY:I = 0x7

.field public static final MAX_MODEM_POLLING_COUNT_SECONDARY:I = 0x3

.field public static final MODEM_POLL_VALUE_PRIMARY:I = 0x15180

.field public static final MODEM_POLL_VALUE_SECONDARY:I = 0x93a80

.field public static final MODEM_UNIQUE_WORK_NAME:Ljava/lang/String; = "MODEM_POLLING_TRIGGER"

.field public static final MODEM_WORK_TAG:Ljava/lang/String; = "MODEM_WORK_TAG"

.field public static final OTAAPP_WORK_TAG:Ljava/lang/String; = "OTAAPP_WORK_TAG"

.field public static final OTA_UNIQUE_WORK_NAME:Ljava/lang/String; = "OTA_POLLING_TRIGGER"

.field public static final POLLINGMGR_CONNECTIVITY:Ljava/lang/String; = "com.motorola.ccc.ota.pm.POLLINGMGR_CONNECTIVITY"

.field public static final POLLINGMGR_ROAMING_CHANGE:Ljava/lang/String; = "com.motorola.ccc.ota.pm.POLLINGMGR_ROAMING_CHANGE"


# direct methods
.method public constructor <init>()V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method
