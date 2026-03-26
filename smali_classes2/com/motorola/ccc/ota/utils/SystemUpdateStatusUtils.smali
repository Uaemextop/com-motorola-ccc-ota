.class public Lcom/motorola/ccc/ota/utils/SystemUpdateStatusUtils;
.super Ljava/lang/Object;
.source "SystemUpdateStatusUtils.java"


# static fields
.field public static final ABAPPLYINGPATCH:Ljava/lang/String; = "ABApplyingPatch"

.field public static final ABUPDATE_IN_PROGRESS:I = 0xfd

.field public static final ALERT_CORRUPTED_FIRMWARE_UPDATE_PACKAGE:I = 0x192

.field public static final ALERT_DOWNLOAD_FAILED_DUE_TO_MEMORY_FULL:I = 0x1f5

.field public static final ALERT_DOWNLOAD_FAILED_DUE_TO_NETWORK_ISSUE:I = 0x1f7

.field public static final ALERT_DOWNLOAD_FAILED_DUE_TO_TIMEOUT:I = 0x197

.field public static final ALERT_FAILED_FIRMWARE_UPDATE_PACKAGE_CERT_VALIDATE:I = 0x194

.field public static final ALERT_FIRMWARE_UPDATE_FAILED:I = 0x19a

.field public static final ALERT_FIRMWARE_UPDATE_FAILED_DUE_TO_SYSTEM_UPDATE_POLICY_ENABLED:I = 0x1f3

.field public static final ALERT_INSTALL_FAILED_DUE_TO_MEMORY_FULL:I = 0x1f6

.field public static final ALERT_MISMATCH_FIRMWARE_UPDATE_PACKAGE:I = 0x193

.field public static final ALERT_SUCCESSFUL:I = 0xc8

.field public static final ALERT_UNDEFINED_ERROR_FIRMWARE_UPDATE_PACKAGE:I = 0x199

.field public static final ALERT_UPDATE_CANCELED_BY_SERVER:I = 0x1f8

.field public static final ALERT_USER_CANCEL:I = 0x191

.field public static final DEFAULT_STRING:Ljava/lang/String; = "Not available"

.field public static final DOWNLOAD_DEFERRED:I = 0xfa

.field public static final DOWNLOAD_FAILED:I = 0x1c2

.field public static final DOWNLOAD_IN_PROGRESS:I = 0xfb

.field public static final FIELD_SEPERATOR:Ljava/lang/String; = " : "

.field public static final GETTING_DESCRIPTOR:Ljava/lang/String; = "GettingDescriptor"

.field public static final GETTING_PACKAGE:Ljava/lang/String; = "GettingPackage"

.field public static final INSTALL_DEFERRED:I = 0xfc

.field public static final KEY_ALREADY_WORKING:Ljava/lang/String; = "already working on version"

.field public static final KEY_CANCEL_OTA_LOW_BATTERY:Ljava/lang/String; = "low battery"

.field public static final KEY_DM_CANCEL_OTA:Ljava/lang/String; = "cancelled by DM"

.field public static final KEY_DOWNLOAD_CANCELLED:Ljava/lang/String; = "user declined to accept the download"

.field public static final KEY_DOWNLOAD_CANCELLED_VITAL:Ljava/lang/String; = "User cancelled vital update"

.field public static final KEY_DOWNLOAD_SKIPPED_VITAL:Ljava/lang/String; = "User skipped vital update"

.field public static final KEY_UPATE_SUCCESS:Ljava/lang/String; = "woohoo"

.field public static final KEY_UPDATE_CANCELLED:Ljava/lang/String; = "user declined to accept the upgrade"

.field public static final KEY_UPDATE_FAIL:Ljava/lang/String; = "Installation aborted"

.field private static final LEARN_MORE_LINK_SHOW_TIME:J = -0x65813800L

.field public static final NEWLINE_SEPERATOR:Ljava/lang/String; = "\n"

.field public static final NOTIFIED:Ljava/lang/String; = "Notified"

.field public static final OTA_DATA_PREF:Ljava/lang/String; = "OtaData"

.field public static final OTA_DOWNLOAD_SUCCESS:Ljava/lang/String; = "255"

.field public static final OTA_UPDATE_SUCCESS:Ljava/lang/String; = "200"

.field public static final OTA_VITAL_UPDATE_SUCCESS:Ljava/lang/String; = "214"

.field private static final PREFS_FILE:Ljava/lang/String; = "DMUpdatePrefs"

.field public static final QUERYING:Ljava/lang/String; = "Querying"

.field public static final QUERYINGINSTALL:Ljava/lang/String; = "QueryingInstall"

.field public static final REQUEST_PERMISSION:Ljava/lang/String; = "RequestPermission"

.field public static final RESULT:Ljava/lang/String; = "Result"

.field public static final SMART_UPDATE_DISABLED:Ljava/lang/String; = "216"

.field public static final SMART_UPDATE_ENABLED:Ljava/lang/String; = "215"

.field public static final SOFTWARE_UPDATE:Ljava/lang/String; = "SU"

.field public static final SPACE:Ljava/lang/String; = " "

.field public static final STATUS_INDEX:I = 0x2

.field public static final SUCANCEL_AFTER_UPDATE:Ljava/lang/String; = "552"

.field public static final SUCANCEL_PRIOR_TO_DOWNLOAD:Ljava/lang/String; = "553"

.field public static final SUCANCEL_PRIOR_TO_UPDATE:Ljava/lang/String; = "554"

.field public static final SUMMARY_SEPERATOR:Ljava/lang/String; = " - "

.field public static final SU_LINK_OR_ERR_INDEX:I = 0x4

.field public static final SU_TIMESTAMP_INDEX:I = 0x3

.field private static final SW_UPDATE_PLANNED_CHECKED_KEY:Ljava/lang/String; = "sw_update_planned_checked_date"

.field private static final TAG:Ljava/lang/String; = "SystemUpdateStatusUtils"

.field public static final UPDATE_ALREADY_IN_PROGRESS:I = 0x9e1

.field public static final UPDATE_CANCELLED:I = 0x191

.field public static final UPDATE_FAIL:I = 0x19a

.field public static final UPDATE_FAIL_SUCANCEL_DM:I = 0x228

.field public static final UPDATE_SUCCESS:I = 0xc8

.field public static final UPGRADING:Ljava/lang/String; = "Upgrading"

.field public static final UP_TO_DATE:I = 0xc9

.field public static final VER_INDEX:I = 0x1

.field public static final VITAL_UPDATE_LOW_BATTERY:I = 0x193

.field private static final error_codes:[[Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .locals 6

    const/4 v0, 0x7

    new-array v0, v0, [[Ljava/lang/String;

    const/4 v1, 0x2

    new-array v2, v1, [Ljava/lang/String;

    const-string v3, "short read"

    const/4 v4, 0x0

    aput-object v3, v2, v4

    const-string v3, " Short Read"

    const/4 v5, 0x1

    aput-object v3, v2, v5

    aput-object v2, v0, v4

    new-array v2, v1, [Ljava/lang/String;

    const-string v3, "has unexpected contents"

    aput-object v3, v2, v4

    const-string v3, " SHA1 Failure"

    aput-object v3, v2, v5

    aput-object v2, v0, v5

    new-array v2, v1, [Ljava/lang/String;

    const-string v3, "script aborted"

    aput-object v3, v2, v4

    const-string v3, " Upgrade Failure"

    aput-object v3, v2, v5

    aput-object v2, v0, v1

    new-array v2, v1, [Ljava/lang/String;

    const-string v3, "Package expects build fingerprint of"

    aput-object v3, v2, v4

    const-string v3, " Fingerprint mismatch"

    aput-object v3, v2, v5

    const/4 v3, 0x3

    aput-object v2, v0, v3

    new-array v2, v1, [Ljava/lang/String;

    const-string v3, "signature verification failed"

    aput-object v3, v2, v4

    const-string v3, " Signature verification failure"

    aput-object v3, v2, v5

    const/4 v3, 0x4

    aput-object v2, v0, v3

    new-array v2, v1, [Ljava/lang/String;

    const-string v3, "Not enough free space"

    aput-object v3, v2, v4

    const-string v3, " No Free Space"

    aput-object v3, v2, v5

    const/4 v3, 0x5

    aput-object v2, v0, v3

    new-array v1, v1, [Ljava/lang/String;

    const-string v2, "Can\'t open"

    aput-object v2, v1, v4

    const-string v2, " Package Open Fail"

    aput-object v2, v1, v5

    const/4 v2, 0x6

    aput-object v1, v0, v2

    sput-object v0, Lcom/motorola/ccc/ota/utils/SystemUpdateStatusUtils;->error_codes:[[Ljava/lang/String;

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static final getCodeFromInfo(Ljava/lang/String;Ljava/lang/String;)I
    .locals 2

    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, " SystemUpdateStatusUtils, state: "

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "; info: "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    const-string v1, "OtaApp"

    invoke-static {v1, v0}, Lcom/motorola/ccc/ota/utils/Logger;->debug(Ljava/lang/String;Ljava/lang/String;)V

    const-string v0, "Notified"

    invoke-virtual {v0, p0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_f

    const-string v0, "RequestPermission"

    invoke-virtual {v0, p0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_0

    goto/16 :goto_4

    :cond_0
    const-string v0, "Querying"

    invoke-virtual {v0, p0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_e

    const-string v0, "QueryingInstall"

    invoke-virtual {v0, p0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_1

    goto/16 :goto_3

    :cond_1
    const-string v0, "GettingDescriptor"

    invoke-virtual {v0, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_d

    const-string v0, "GettingPackage"

    invoke-virtual {v0, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_2

    goto/16 :goto_2

    :cond_2
    const-string v0, "ABApplyingPatch"

    invoke-virtual {v0, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_c

    const-string v0, "Upgrading"

    invoke-virtual {v0, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-eqz p0, :cond_3

    goto :goto_1

    :cond_3
    const-string p0, "user declined to accept the upgrade"

    invoke-virtual {p1, p0}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result p0

    const/16 v0, 0x191

    if-nez p0, :cond_b

    const-string p0, "user declined to accept the download"

    invoke-virtual {p1, p0}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result p0

    if-nez p0, :cond_b

    const-string p0, "User cancelled vital update"

    invoke-virtual {p1, p0}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result p0

    if-eqz p0, :cond_4

    goto :goto_0

    :cond_4
    const-string p0, "User skipped vital update"

    invoke-virtual {p1, p0}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result p0

    if-eqz p0, :cond_6

    const-string p0, "low battery"

    invoke-virtual {p1, p0}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result p0

    if-eqz p0, :cond_5

    const/16 p0, 0x193

    return p0

    :cond_5
    return v0

    :cond_6
    const-string p0, "woohoo"

    invoke-virtual {p1, p0}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result p0

    if-eqz p0, :cond_7

    const/16 p0, 0xc8

    return p0

    :cond_7
    const-string p0, "Installation aborted"

    invoke-virtual {p1, p0}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result p0

    if-eqz p0, :cond_8

    const/16 p0, 0x19a

    return p0

    :cond_8
    const-string p0, "cancelled by DM"

    invoke-virtual {p1, p0}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result p0

    if-eqz p0, :cond_9

    const/16 p0, 0x228

    return p0

    :cond_9
    const-string p0, "already working on version"

    invoke-virtual {p1, p0}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result p0

    if-eqz p0, :cond_a

    const/16 p0, 0x9e1

    return p0

    :cond_a
    const/16 p0, 0x1c2

    return p0

    :cond_b
    :goto_0
    return v0

    :cond_c
    :goto_1
    const/16 p0, 0xfd

    return p0

    :cond_d
    :goto_2
    const/16 p0, 0xfb

    return p0

    :cond_e
    :goto_3
    const/16 p0, 0xfc

    return p0

    :cond_f
    :goto_4
    const/16 p0, 0xfa

    return p0
.end method

.method private static getDate(JLandroid/content/Context;)Ljava/lang/String;
    .locals 3

    invoke-static {}, Ljava/util/Locale;->getDefault()Ljava/util/Locale;

    move-result-object v0

    const-string v1, "yyyyMMMMd"

    invoke-static {v0, v1}, Landroid/text/format/DateFormat;->getBestDateTimePattern(Ljava/util/Locale;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0, p0, p1}, Landroid/text/format/DateFormat;->format(Ljava/lang/CharSequence;J)Ljava/lang/CharSequence;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    invoke-static {p2}, Landroid/text/format/DateFormat;->is24HourFormat(Landroid/content/Context;)Z

    move-result v1

    if-eqz v1, :cond_0

    const-string v1, "Hm"

    goto :goto_0

    :cond_0
    const-string v1, "hm"

    :goto_0
    invoke-static {}, Ljava/util/Locale;->getDefault()Ljava/util/Locale;

    move-result-object v2

    invoke-static {v2, v1}, Landroid/text/format/DateFormat;->getBestDateTimePattern(Ljava/util/Locale;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-static {v1, p0, p1}, Landroid/text/format/DateFormat;->format(Ljava/lang/CharSequence;J)Ljava/lang/CharSequence;

    move-result-object p0

    check-cast p0, Ljava/lang/String;

    invoke-virtual {p2}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object p1

    const p2, 0x7f0e00b1

    filled-new-array {v0, p0}, [Ljava/lang/Object;

    move-result-object p0

    invoke-virtual {p1, p2, p0}, Landroid/content/res/Resources;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method public static getErrorString(Ljava/lang/String;)Ljava/lang/String;
    .locals 5

    const-string v0, ""

    if-eqz p0, :cond_2

    invoke-static {p0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    if-eqz v1, :cond_0

    goto :goto_1

    :cond_0
    const/4 v1, 0x0

    move v2, v1

    :goto_0
    sget-object v3, Lcom/motorola/ccc/ota/utils/SystemUpdateStatusUtils;->error_codes:[[Ljava/lang/String;

    array-length v4, v3

    if-ge v2, v4, :cond_2

    aget-object v4, v3, v2

    aget-object v4, v4, v1

    invoke-virtual {p0, v4}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v4

    if-eqz v4, :cond_1

    aget-object p0, v3, v2

    const/4 v0, 0x1

    aget-object v0, p0, v0

    goto :goto_1

    :cond_1
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    :cond_2
    :goto_1
    return-object v0
.end method

.method public static final getStatusFromCode(ILandroid/content/Context;)Ljava/lang/String;
    .locals 1

    const/16 v0, 0xc8

    if-eq p0, v0, :cond_4

    const/16 v0, 0xc9

    if-eq p0, v0, :cond_3

    const/16 v0, 0x191

    if-eq p0, v0, :cond_2

    const/16 v0, 0x19a

    if-eq p0, v0, :cond_1

    const/16 v0, 0x228

    if-eq p0, v0, :cond_0

    packed-switch p0, :pswitch_data_0

    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object p0

    const p1, 0x7f0e00c1

    invoke-virtual {p0, p1}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object p0

    return-object p0

    :pswitch_0
    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object p0

    const p1, 0x7f0e0024

    invoke-virtual {p0, p1}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object p0

    return-object p0

    :pswitch_1
    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object p0

    const p1, 0x7f0e010f

    invoke-virtual {p0, p1}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object p0

    return-object p0

    :pswitch_2
    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object p0

    const p1, 0x7f0e00c2

    invoke-virtual {p0, p1}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object p0

    return-object p0

    :pswitch_3
    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object p0

    const p1, 0x7f0e00c0

    invoke-virtual {p0, p1}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object p0

    return-object p0

    :cond_0
    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object p0

    const p1, 0x7f0e01d5

    invoke-virtual {p0, p1}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object p0

    return-object p0

    :cond_1
    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object p0

    const p1, 0x7f0e01d4

    invoke-virtual {p0, p1}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object p0

    return-object p0

    :cond_2
    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object p0

    const p1, 0x7f0e01d2

    invoke-virtual {p0, p1}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object p0

    return-object p0

    :cond_3
    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object p0

    const p1, 0x7f0e0031

    invoke-virtual {p0, p1}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object p0

    return-object p0

    :cond_4
    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object p0

    const p1, 0x7f0e01e1

    invoke-virtual {p0, p1}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object p0

    return-object p0

    nop

    :pswitch_data_0
    .packed-switch 0xfa
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method public static getSwUpdatePlannedInfo(Landroid/content/Context;)Ljava/lang/String;
    .locals 5

    const-string v0, "DMUpdatePrefs"

    const/4 v1, 0x0

    invoke-virtual {p0, v0, v1}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v0

    const-string v1, "sw_update_planned_checked_date"

    const-wide/16 v2, -0x1

    invoke-interface {v0, v1, v2, v3}, Landroid/content/SharedPreferences;->getLong(Ljava/lang/String;J)J

    move-result-wide v0

    cmp-long v2, v0, v2

    const-string v3, "OtaApp"

    if-nez v2, :cond_0

    const-string p0, "SystemUpdateStatusUtils, getSwUpdatePlannedInfo: There is no SW Update planned."

    invoke-static {v3, p0}, Lcom/motorola/ccc/ota/utils/Logger;->debug(Ljava/lang/String;Ljava/lang/String;)V

    const/4 p0, 0x0

    return-object p0

    :cond_0
    invoke-static {v0, v1, p0}, Lcom/motorola/ccc/ota/utils/SystemUpdateStatusUtils;->getDate(JLandroid/content/Context;)Ljava/lang/String;

    move-result-object p0

    new-instance v2, Ljava/lang/StringBuilder;

    const-string v4, "SystemUpdateStatusUtils, getSwUpdatePlannedInfo: checkedAt = "

    invoke-direct {v2, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v2, v0, v1}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ", formattedDateTime = "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v3, v0}, Lcom/motorola/ccc/ota/utils/Logger;->debug(Ljava/lang/String;Ljava/lang/String;)V

    return-object p0
.end method

.method public static getUrl(Ljava/lang/String;)Ljava/lang/String;
    .locals 5

    const/4 v0, 0x0

    if-eqz p0, :cond_1

    invoke-static {p0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    if-eqz v1, :cond_0

    goto :goto_1

    :cond_0
    const-string v1, " "

    invoke-virtual {p0, v1}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object p0

    array-length v1, p0

    const/4 v2, 0x0

    :goto_0
    if-ge v2, v1, :cond_1

    aget-object v3, p0, v2

    :try_start_0
    new-instance v4, Ljava/net/URL;

    invoke-direct {v4, v3}, Ljava/net/URL;-><init>(Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/net/MalformedURLException; {:try_start_0 .. :try_end_0} :catch_0

    move-object v0, v3

    goto :goto_1

    :catch_0
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    :cond_1
    :goto_1
    return-object v0
.end method

.method private static hasSuLinkNeeded([Ljava/lang/String;)Z
    .locals 2

    const/4 v0, 0x2

    aget-object v0, p0, v0

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(Ljava/lang/String;)Ljava/lang/Integer;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v0

    const/16 v1, 0xc8

    if-ne v0, v1, :cond_0

    array-length v0, p0

    const/4 v1, 0x4

    if-ge v1, v0, :cond_0

    aget-object p0, p0, v1

    if-eqz p0, :cond_0

    const/4 p0, 0x1

    goto :goto_0

    :cond_0
    const/4 p0, 0x0

    :goto_0
    return p0
.end method

.method private static isSuValid([Ljava/lang/String;)Z
    .locals 1

    array-length p0, p0

    const/4 v0, 0x4

    if-ge p0, v0, :cond_0

    const-string p0, "OtaApp"

    const-string v0, "SystemUpdateStatusUtils, Required data is not found hence read next Item"

    invoke-static {p0, v0}, Lcom/motorola/ccc/ota/utils/Logger;->debug(Ljava/lang/String;Ljava/lang/String;)V

    const/4 p0, 0x0

    return p0

    :cond_0
    const/4 p0, 0x1

    return p0
.end method

.method private static parseLastSu(Landroid/content/Context;[Ljava/lang/String;)Ljava/lang/String;
    .locals 14

    invoke-static {p1}, Lcom/motorola/ccc/ota/utils/SystemUpdateStatusUtils;->isSuValid([Ljava/lang/String;)Z

    move-result v0

    const/4 v1, 0x0

    if-eqz v0, :cond_9

    const/4 v0, 0x1

    aget-object v0, p1, v0

    const/4 v2, 0x2

    aget-object v2, p1, v2

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(Ljava/lang/String;)Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Integer;->intValue()I

    move-result v2

    const/4 v3, 0x3

    aget-object v3, p1, v3

    invoke-static {v3}, Ljava/lang/Long;->valueOf(Ljava/lang/String;)Ljava/lang/Long;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/Long;->longValue()J

    move-result-wide v3

    new-instance v5, Ljava/lang/StringBuilder;

    const-string v6, "SystemUpdateStatusUtils, Version: "

    invoke-direct {v5, v6}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v5, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, " Code: "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, " time stamp: "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, v3, v4}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    const-string v6, "OtaApp"

    invoke-static {v6, v5}, Lcom/motorola/ccc/ota/utils/Logger;->debug(Ljava/lang/String;Ljava/lang/String;)V

    if-nez v0, :cond_0

    return-object v1

    :cond_0
    invoke-virtual {p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v5

    const/16 v7, 0xc8

    const/4 v8, 0x4

    if-ne v2, v7, :cond_2

    const v7, 0x7f0e01a4

    invoke-virtual {v5, v7}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v7

    const v9, 0x7f0e0036

    invoke-virtual {v5, v9}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v5

    array-length v9, p1

    if-ge v8, v9, :cond_1

    aget-object p1, p1, v8

    goto/16 :goto_3

    :cond_1
    :goto_0
    move-object p1, v1

    goto :goto_3

    :cond_2
    const/16 v7, 0x19a

    const v9, 0x7f0e01a0

    if-ne v2, v7, :cond_4

    invoke-virtual {v5, v9}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v7

    const v9, 0x7f0e00fb

    invoke-virtual {v5, v9}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v9

    array-length v10, p1

    if-ge v8, v10, :cond_3

    aget-object v10, p1, v8

    invoke-static {v10}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v10

    if-nez v10, :cond_3

    new-instance v10, Ljava/lang/StringBuilder;

    invoke-direct {v10}, Ljava/lang/StringBuilder;-><init>()V

    const v11, 0x7f0e00df

    invoke-virtual {v5, v11}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v10, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    aget-object p1, p1, v8

    invoke-virtual {v5, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    move-object v5, v9

    move-object v13, v1

    move-object v1, p1

    move-object p1, v13

    goto :goto_3

    :cond_3
    move-object p1, v1

    move-object v5, v9

    goto :goto_3

    :cond_4
    const/16 p1, 0xfb

    if-eq v2, p1, :cond_6

    const/16 p1, 0xfd

    if-ne v2, p1, :cond_5

    goto :goto_1

    :cond_5
    invoke-virtual {v5, v9}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object p1

    goto :goto_2

    :cond_6
    :goto_1
    const p1, 0x7f0e01a1

    invoke-virtual {v5, p1}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object p1

    :goto_2
    move-object v7, p1

    invoke-static {v2, p0}, Lcom/motorola/ccc/ota/utils/SystemUpdateStatusUtils;->getStatusFromCode(ILandroid/content/Context;)Ljava/lang/String;

    move-result-object v5

    goto :goto_0

    :goto_3
    const-string v8, "\n"

    const-string v9, "SU : "

    const-string v10, " : "

    const-string v11, " "

    if-eqz v1, :cond_7

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2, v9}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v2, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-static {v3, v4, p0}, Lcom/motorola/ccc/ota/utils/SystemUpdateStatusUtils;->getDate(JLandroid/content/Context;)Ljava/lang/String;

    move-result-object p0

    invoke-virtual {v2, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p0

    invoke-virtual {p0, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p0

    invoke-virtual {p0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p0

    invoke-virtual {p0, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p0

    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    goto :goto_4

    :cond_7
    if-nez v1, :cond_8

    const/16 v12, 0xc9

    if-ne v2, v12, :cond_8

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2, v9}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v2, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object p0

    invoke-static {}, Lcom/motorola/ccc/ota/utils/BuildPropReader;->getBuildDescription()Ljava/lang/String;

    move-result-object v3

    invoke-static {v3}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v3

    filled-new-array {v3}, [Ljava/lang/Object;

    move-result-object v3

    const v4, 0x7f0e01db

    invoke-virtual {p0, v4, v3}, Landroid/content/res/Resources;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p0

    invoke-virtual {v2, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    goto :goto_4

    :cond_8
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2, v9}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v2, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-static {v3, v4, p0}, Lcom/motorola/ccc/ota/utils/SystemUpdateStatusUtils;->getDate(JLandroid/content/Context;)Ljava/lang/String;

    move-result-object p0

    invoke-virtual {v2, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p0

    invoke-virtual {p0, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p0

    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    :goto_4
    new-instance v2, Ljava/lang/StringBuilder;

    const-string v3, "SystemUpdateStatusUtils, SU Version: "

    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v2, " Status: "

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v2, " Error string: "

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, " Link: "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {v6, p1}, Lcom/motorola/ccc/ota/utils/Logger;->debug(Ljava/lang/String;Ljava/lang/String;)V

    move-object v1, p0

    :cond_9
    return-object v1
.end method

.method public static readLastUpdateVersionFromPref(Landroid/content/Context;)Ljava/util/List;
    .locals 9
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Context;",
            ")",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    new-instance v1, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    invoke-direct {v1}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;-><init>()V

    const/4 v2, 0x5

    new-array v2, v2, [Ljava/lang/String;

    const-string v3, "SU"

    const/4 v4, 0x0

    aput-object v3, v2, v4

    sget-object v3, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->ONGOING_HISTORY_VERSION_NAME:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    invoke-virtual {v1, v3}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->getString(Lcom/motorola/otalib/common/settings/ISetting;)Ljava/lang/String;

    move-result-object v3

    const/4 v5, 0x1

    aput-object v3, v2, v5

    sget-object v3, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->ONGOING_HISTORY_UPDATE_STATUS:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    invoke-virtual {v1, v3, v4}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->getInt(Lcom/motorola/otalib/common/settings/ISetting;I)I

    move-result v3

    invoke-static {v3}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v3

    const/4 v4, 0x2

    aput-object v3, v2, v4

    sget-object v3, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->ONGOING_HISTORY_TIME_STAMP:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    const-wide/16 v4, 0x0

    invoke-virtual {v1, v3, v4, v5}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->getLong(Lcom/motorola/otalib/common/settings/ISetting;J)J

    move-result-wide v3

    invoke-static {v3, v4}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    move-result-object v3

    const/4 v4, 0x3

    aput-object v3, v2, v4

    sget-object v3, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->ONGOING_HISTORY_LINK_ERROR_VALUE:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    invoke-virtual {v1, v3}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->getString(Lcom/motorola/otalib/common/settings/ISetting;)Ljava/lang/String;

    move-result-object v1

    const/4 v3, 0x4

    aput-object v1, v2, v3

    invoke-static {p0, v2}, Lcom/motorola/ccc/ota/utils/SystemUpdateStatusUtils;->parseLastSu(Landroid/content/Context;[Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    if-eqz v1, :cond_1

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    aget-object v1, v2, v4

    invoke-static {v1}, Ljava/lang/Long;->valueOf(Ljava/lang/String;)Ljava/lang/Long;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Long;->longValue()J

    move-result-wide v3

    invoke-static {v2}, Lcom/motorola/ccc/ota/utils/SystemUpdateStatusUtils;->hasSuLinkNeeded([Ljava/lang/String;)Z

    move-result v1

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v5

    const-wide/32 v7, -0x65813800

    sub-long/2addr v5, v7

    const-wide/16 v7, -0x1

    cmp-long v2, v3, v7

    if-eqz v2, :cond_0

    cmp-long v2, v3, v5

    if-gez v2, :cond_0

    if-eqz v1, :cond_0

    invoke-virtual {p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object p0

    const v1, 0x7f0e011d

    invoke-virtual {p0, v1}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object p0

    invoke-interface {v0, p0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    :cond_0
    return-object v0

    :cond_1
    const/4 p0, 0x0

    return-object p0
.end method

.method private static readSharedPrefKey(Ljava/lang/String;Landroid/content/Context;)Ljava/lang/String;
    .locals 2

    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "SystemUpdateStatusUtils, readSharedPrefKey, key = "

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    const-string v1, "OtaApp"

    invoke-static {v1, v0}, Lcom/motorola/ccc/ota/utils/Logger;->debug(Ljava/lang/String;Ljava/lang/String;)V

    const-string v0, "OtaData"

    const/4 v1, 0x0

    invoke-virtual {p1, v0, v1}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object p1

    const-string v0, ""

    invoke-interface {p1, p0, v0}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method public static removeSwUpdatePlannedInfo(Landroid/content/Context;)V
    .locals 2

    const-string v0, "OtaApp"

    const-string v1, "SystemUpdateStatusUtils, removeSwUpdatePlannedInfo: There is no SW Update planned. Remove (if any) previous info"

    invoke-static {v0, v1}, Lcom/motorola/ccc/ota/utils/Logger;->debug(Ljava/lang/String;Ljava/lang/String;)V

    const-string v0, "DMUpdatePrefs"

    const/4 v1, 0x0

    invoke-virtual {p0, v0, v1}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object p0

    invoke-interface {p0}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object p0

    const-string v0, "sw_update_planned_checked_date"

    invoke-interface {p0, v0}, Landroid/content/SharedPreferences$Editor;->remove(Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    move-result-object p0

    invoke-interface {p0}, Landroid/content/SharedPreferences$Editor;->apply()V

    return-void
.end method

.method public static setSwUpdatePlannedInfo(Landroid/content/Context;)V
    .locals 4

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v0

    new-instance v2, Ljava/lang/StringBuilder;

    const-string v3, "SystemUpdateStatusUtils, setSwUpdatePlannedInfo: There is a new SW Update planned. Checked at "

    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v2, v0, v1}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    const-string v3, "OtaApp"

    invoke-static {v3, v2}, Lcom/motorola/ccc/ota/utils/Logger;->debug(Ljava/lang/String;Ljava/lang/String;)V

    const-string v2, "DMUpdatePrefs"

    const/4 v3, 0x0

    invoke-virtual {p0, v2, v3}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object p0

    invoke-interface {p0}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object p0

    const-string v2, "sw_update_planned_checked_date"

    invoke-interface {p0, v2, v0, v1}, Landroid/content/SharedPreferences$Editor;->putLong(Ljava/lang/String;J)Landroid/content/SharedPreferences$Editor;

    move-result-object p0

    invoke-interface {p0}, Landroid/content/SharedPreferences$Editor;->apply()V

    return-void
.end method

.method public static storeOngoingSystemUpdateStatus(Landroid/content/Context;Landroid/content/Intent;)V
    .locals 14

    invoke-virtual {p1}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object v0

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "SystemUpdateStatusUtils: storeOngoingSystemUpdateStatus, Action: "

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    const-string v2, "OtaApp"

    invoke-static {v2, v1}, Lcom/motorola/ccc/ota/utils/Logger;->debug(Ljava/lang/String;Ljava/lang/String;)V

    const-string v1, "com.motorola.blur.service.blur.Actions.UPGRADE_UPDATE_STATUS"

    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    const-string v3, " Update Status: "

    const-string v4, "SystemUpdateStatusUtils: storeOngoingSystemUpdateStatus, Software Version : "

    const/4 v5, 0x0

    const/4 v6, 0x0

    const-string v7, "com.motorola.app.release.notes"

    const-string v8, "com.motorola.ota.service.upgrade.displayVersion"

    if-eqz v1, :cond_4

    const-string v0, "com.motorola.blur.service.blur.upgrade.update_status"

    invoke-virtual {p1, v0, v6}, Landroid/content/Intent;->getBooleanExtra(Ljava/lang/String;Z)Z

    move-result v0

    if-eqz v0, :cond_0

    const-string v1, "woohoo"

    goto :goto_0

    :cond_0
    const-string v1, "Installation aborted"

    :goto_0
    invoke-static {v5, v1}, Lcom/motorola/ccc/ota/utils/SystemUpdateStatusUtils;->getCodeFromInfo(Ljava/lang/String;Ljava/lang/String;)I

    move-result v1

    invoke-static {v8, p0}, Lcom/motorola/ccc/ota/utils/SystemUpdateStatusUtils;->readSharedPrefKey(Ljava/lang/String;Landroid/content/Context;)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/String;->isEmpty()Z

    move-result v6

    if-eqz v6, :cond_1

    invoke-static {}, Lcom/motorola/ccc/ota/utils/BuildPropReader;->getBuildDescription()Ljava/lang/String;

    move-result-object v5

    :cond_1
    const/16 v6, 0x19a

    if-ne v1, v6, :cond_2

    const-string v6, "com.motorola.ccc.ota.UPDATE_FAILURE_REASON"

    invoke-virtual {p1, v6}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    invoke-static {p1}, Lcom/motorola/ccc/ota/utils/SystemUpdateStatusUtils;->getErrorString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    goto :goto_1

    :cond_2
    invoke-static {v7, p0}, Lcom/motorola/ccc/ota/utils/SystemUpdateStatusUtils;->readSharedPrefKey(Ljava/lang/String;Landroid/content/Context;)Ljava/lang/String;

    move-result-object p1

    :goto_1
    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v6, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v3, " Error/Link : "

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v2, v0}, Lcom/motorola/ccc/ota/utils/Logger;->debug(Ljava/lang/String;Ljava/lang/String;)V

    invoke-static {p0, v5, v1, p1}, Lcom/motorola/ccc/ota/utils/SystemUpdateStatusUtils;->updateSoftwareStatusInPds(Landroid/content/Context;Ljava/lang/String;ILjava/lang/String;)V

    const/16 p1, 0xc8

    if-ne v1, p1, :cond_13

    const-string p1, "SystemUpdateStatusUtils: storeOngoingSystemUpdateStatus, Software Upgrade Success. sending DM alert Notification"

    invoke-static {v2, p1}, Lcom/motorola/ccc/ota/utils/Logger;->debug(Ljava/lang/String;Ljava/lang/String;)V

    new-instance p1, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    invoke-direct {p1}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;-><init>()V

    sget-object v0, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->FLAG_IS_VITAL_UPDATE:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    invoke-virtual {p1, v0}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->getBoolean(Lcom/motorola/otalib/common/settings/ISetting;)Z

    move-result p1

    if-eqz p1, :cond_3

    const-string p1, "214"

    invoke-static {p0, p1}, Lcom/motorola/ccc/ota/utils/DmSendAlertService;->sendDmAlertNotification(Landroid/content/Context;Ljava/lang/String;)V

    goto/16 :goto_5

    :cond_3
    const-string p1, "200"

    invoke-static {p0, p1}, Lcom/motorola/ccc/ota/utils/DmSendAlertService;->sendDmAlertNotification(Landroid/content/Context;Ljava/lang/String;)V

    goto/16 :goto_5

    :cond_4
    const-string v1, "com.motorola.ccc.ota.ALREADY_UP_TO_DATE"

    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_5

    invoke-static {}, Lcom/motorola/ccc/ota/utils/BuildPropReader;->getBuildDescription()Ljava/lang/String;

    move-result-object p1

    const/16 v0, 0xc9

    invoke-static {p0, p1, v0, v5}, Lcom/motorola/ccc/ota/utils/SystemUpdateStatusUtils;->updateSoftwareStatusInPds(Landroid/content/Context;Ljava/lang/String;ILjava/lang/String;)V

    goto/16 :goto_5

    :cond_5
    const-string v1, "com.motorola.app.action.UPGRADE_UPDATE_STATUS"

    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_11

    const-string v0, "com.motorola.app.cus.state"

    invoke-virtual {p1, v0}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    const-string v5, "com.motorola.app.cus.info"

    invoke-virtual {p1, v5}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    const-string v6, "com.motorola.app.download.source"

    invoke-virtual {p1, v6}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    sget-object v9, Lcom/motorola/ccc/ota/sources/UpgradeSourceType;->modem:Lcom/motorola/ccc/ota/sources/UpgradeSourceType;

    invoke-virtual {v9}, Lcom/motorola/ccc/ota/sources/UpgradeSourceType;->name()Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v9, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_6

    return-void

    :cond_6
    if-nez v5, :cond_7

    const-string v5, "Not available"

    :cond_7
    const-string v6, "cancelled by DM"

    invoke-virtual {v5, v6}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v6

    const-string v9, "Querying"

    const-string v10, "Notified"

    if-eqz v6, :cond_b

    invoke-static {v0, p0}, Lcom/motorola/ccc/ota/utils/SystemUpdateStatusUtils;->readSharedPrefKey(Ljava/lang/String;Landroid/content/Context;)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v10, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v11

    if-nez v11, :cond_a

    const-string v11, "GettingDescriptor"

    invoke-virtual {v11, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v11

    if-nez v11, :cond_a

    const-string v11, "GettingPackage"

    invoke-virtual {v11, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v11

    if-eqz v11, :cond_8

    goto :goto_2

    :cond_8
    invoke-virtual {v9, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v11

    if-eqz v11, :cond_9

    const-string v11, "554"

    goto :goto_3

    :cond_9
    const-string v11, "552"

    goto :goto_3

    :cond_a
    :goto_2
    const-string v11, "553"

    :goto_3
    new-instance v12, Ljava/lang/StringBuilder;

    const-string v13, "SystemUpdateStatusUtils: storeOngoingSystemUpdateStatus, SU Cancel Alert sending ... Prev State: "

    invoke-direct {v12, v13}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v12, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string v12, " Alert Code: "

    invoke-virtual {v6, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-static {v2, v6}, Lcom/motorola/ccc/ota/utils/Logger;->debug(Ljava/lang/String;Ljava/lang/String;)V

    invoke-static {p0, v11}, Lcom/motorola/ccc/ota/utils/DmSendAlertService;->sendDmAlertNotification(Landroid/content/Context;Ljava/lang/String;)V

    :cond_b
    const-string v6, "SRC_VALIDATION_FAILED."

    invoke-virtual {v5, v6}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v6

    if-eqz v6, :cond_c

    return-void

    :cond_c
    invoke-static {v0, v1, p0}, Lcom/motorola/ccc/ota/utils/SystemUpdateStatusUtils;->storeSharedPrefKey(Ljava/lang/String;Ljava/lang/String;Landroid/content/Context;)V

    invoke-virtual {v9, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_d

    const-string v0, "255"

    invoke-static {p0, v0}, Lcom/motorola/ccc/ota/utils/DmSendAlertService;->sendDmAlertNotification(Landroid/content/Context;Ljava/lang/String;)V

    :cond_d
    invoke-static {v1, v5}, Lcom/motorola/ccc/ota/utils/SystemUpdateStatusUtils;->getCodeFromInfo(Ljava/lang/String;Ljava/lang/String;)I

    move-result v0

    const/16 v5, 0x193

    if-ne v0, v5, :cond_e

    const-string v5, "403"

    invoke-static {p0, v5}, Lcom/motorola/ccc/ota/utils/DmSendAlertService;->sendDmAlertNotification(Landroid/content/Context;Ljava/lang/String;)V

    :cond_e
    const/16 v5, 0x9e1

    if-ne v0, v5, :cond_f

    return-void

    :cond_f
    invoke-virtual {v10, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_10

    invoke-virtual {p1, v8}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-static {v8, v1, p0}, Lcom/motorola/ccc/ota/utils/SystemUpdateStatusUtils;->storeSharedPrefKey(Ljava/lang/String;Ljava/lang/String;Landroid/content/Context;)V

    invoke-virtual {p1, v7}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    invoke-static {p1}, Lcom/motorola/ccc/ota/utils/SystemUpdateStatusUtils;->getUrl(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    invoke-static {v7, p1, p0}, Lcom/motorola/ccc/ota/utils/SystemUpdateStatusUtils;->storeSharedPrefKey(Ljava/lang/String;Ljava/lang/String;Landroid/content/Context;)V

    goto :goto_4

    :cond_10
    invoke-static {v8, p0}, Lcom/motorola/ccc/ota/utils/SystemUpdateStatusUtils;->readSharedPrefKey(Ljava/lang/String;Landroid/content/Context;)Ljava/lang/String;

    move-result-object v1

    invoke-static {v7, p0}, Lcom/motorola/ccc/ota/utils/SystemUpdateStatusUtils;->readSharedPrefKey(Ljava/lang/String;Landroid/content/Context;)Ljava/lang/String;

    move-result-object p1

    :goto_4
    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v5, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, " Release notes: "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Lcom/motorola/ccc/ota/utils/Logger;->debug(Ljava/lang/String;Ljava/lang/String;)V

    invoke-static {p0, v1, v0, p1}, Lcom/motorola/ccc/ota/utils/SystemUpdateStatusUtils;->updateSoftwareStatusInPds(Landroid/content/Context;Ljava/lang/String;ILjava/lang/String;)V

    goto :goto_5

    :cond_11
    const-string v1, "com.motorola.blur.service.blur.Actions.UPGRADE_CHECK_FOR_UPDATE_RESPONSE"

    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_13

    const-string v0, "com.motorola.blur.service.blur.upgrade.ota_update_planned"

    invoke-virtual {p1, v0, v6}, Landroid/content/Intent;->getBooleanExtra(Ljava/lang/String;Z)Z

    move-result p1

    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "SystemUpdateStatusUtils: storeOngoingSystemUpdateStatus, Software Update Planned : "

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v2, v0}, Lcom/motorola/ccc/ota/utils/Logger;->debug(Ljava/lang/String;Ljava/lang/String;)V

    if-eqz p1, :cond_12

    invoke-static {p0}, Lcom/motorola/ccc/ota/utils/SystemUpdateStatusUtils;->setSwUpdatePlannedInfo(Landroid/content/Context;)V

    goto :goto_5

    :cond_12
    invoke-static {p0}, Lcom/motorola/ccc/ota/utils/SystemUpdateStatusUtils;->removeSwUpdatePlannedInfo(Landroid/content/Context;)V

    :cond_13
    :goto_5
    return-void
.end method

.method private static storeSharedPrefKey(Ljava/lang/String;Ljava/lang/String;Landroid/content/Context;)V
    .locals 2

    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "SystemUpdateStatusUtils, storeSharedPrefKey, key = "

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, " value = "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    const-string v1, "OtaApp"

    invoke-static {v1, v0}, Lcom/motorola/ccc/ota/utils/Logger;->debug(Ljava/lang/String;Ljava/lang/String;)V

    const-string v0, "OtaData"

    const/4 v1, 0x0

    invoke-virtual {p2, v0, v1}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object p2

    invoke-interface {p2}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object p2

    invoke-interface {p2, p0, p1}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    invoke-interface {p2}, Landroid/content/SharedPreferences$Editor;->apply()V

    return-void
.end method

.method public static updateSoftwareStatusInPds(Landroid/content/Context;Ljava/lang/String;ILjava/lang/String;)V
    .locals 2

    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "SystemUpdateStatusUtils, Received Version: "

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, " Code: "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, " LinkOrError: "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    const-string v1, "OtaApp"

    invoke-static {v1, v0}, Lcom/motorola/ccc/ota/utils/Logger;->debug(Ljava/lang/String;Ljava/lang/String;)V

    new-instance v0, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    invoke-direct {v0}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;-><init>()V

    sget-object v1, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->ONGOING_HISTORY_VERSION_NAME:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    invoke-virtual {v0, v1, p1}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->setString(Lcom/motorola/otalib/common/settings/ISetting;Ljava/lang/String;)V

    sget-object p1, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->ONGOING_HISTORY_LINK_ERROR_VALUE:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    invoke-virtual {v0, p1, p3}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->setString(Lcom/motorola/otalib/common/settings/ISetting;Ljava/lang/String;)V

    sget-object p1, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->ONGOING_HISTORY_UPDATE_STATUS:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    invoke-virtual {v0, p1, p2}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->setInt(Lcom/motorola/otalib/common/settings/ISetting;I)V

    sget-object p1, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->ONGOING_HISTORY_TIME_STAMP:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide p2

    invoke-virtual {v0, p1, p2, p3}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->setLong(Lcom/motorola/otalib/common/settings/ISetting;J)V

    invoke-static {p0}, Lcom/motorola/ccc/ota/utils/SystemUpdateStatusUtils;->removeSwUpdatePlannedInfo(Landroid/content/Context;)V

    return-void
.end method
