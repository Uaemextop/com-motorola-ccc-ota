.class public final enum Lcom/motorola/ccc/ota/sources/fota/FotaConstants$AutoDownloadOption;
.super Ljava/lang/Enum;
.source "FotaConstants.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/motorola/ccc/ota/sources/fota/FotaConstants;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4019
    name = "AutoDownloadOption"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum<",
        "Lcom/motorola/ccc/ota/sources/fota/FotaConstants$AutoDownloadOption;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcom/motorola/ccc/ota/sources/fota/FotaConstants$AutoDownloadOption;

.field public static final enum OTAorWiFi:Lcom/motorola/ccc/ota/sources/fota/FotaConstants$AutoDownloadOption;

.field public static final enum RAN:Lcom/motorola/ccc/ota/sources/fota/FotaConstants$AutoDownloadOption;

.field public static final enum WiFi:Lcom/motorola/ccc/ota/sources/fota/FotaConstants$AutoDownloadOption;


# direct methods
.method private static synthetic $values()[Lcom/motorola/ccc/ota/sources/fota/FotaConstants$AutoDownloadOption;
    .locals 3

    sget-object v0, Lcom/motorola/ccc/ota/sources/fota/FotaConstants$AutoDownloadOption;->WiFi:Lcom/motorola/ccc/ota/sources/fota/FotaConstants$AutoDownloadOption;

    sget-object v1, Lcom/motorola/ccc/ota/sources/fota/FotaConstants$AutoDownloadOption;->OTAorWiFi:Lcom/motorola/ccc/ota/sources/fota/FotaConstants$AutoDownloadOption;

    sget-object v2, Lcom/motorola/ccc/ota/sources/fota/FotaConstants$AutoDownloadOption;->RAN:Lcom/motorola/ccc/ota/sources/fota/FotaConstants$AutoDownloadOption;

    filled-new-array {v0, v1, v2}, [Lcom/motorola/ccc/ota/sources/fota/FotaConstants$AutoDownloadOption;

    move-result-object v0

    return-object v0
.end method

.method static constructor <clinit>()V
    .locals 3

    new-instance v0, Lcom/motorola/ccc/ota/sources/fota/FotaConstants$AutoDownloadOption;

    const-string v1, "WiFi"

    const/4 v2, 0x0

    invoke-direct {v0, v1, v2}, Lcom/motorola/ccc/ota/sources/fota/FotaConstants$AutoDownloadOption;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/motorola/ccc/ota/sources/fota/FotaConstants$AutoDownloadOption;->WiFi:Lcom/motorola/ccc/ota/sources/fota/FotaConstants$AutoDownloadOption;

    new-instance v0, Lcom/motorola/ccc/ota/sources/fota/FotaConstants$AutoDownloadOption;

    const-string v1, "OTAorWiFi"

    const/4 v2, 0x1

    invoke-direct {v0, v1, v2}, Lcom/motorola/ccc/ota/sources/fota/FotaConstants$AutoDownloadOption;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/motorola/ccc/ota/sources/fota/FotaConstants$AutoDownloadOption;->OTAorWiFi:Lcom/motorola/ccc/ota/sources/fota/FotaConstants$AutoDownloadOption;

    new-instance v0, Lcom/motorola/ccc/ota/sources/fota/FotaConstants$AutoDownloadOption;

    const-string v1, "RAN"

    const/4 v2, 0x2

    invoke-direct {v0, v1, v2}, Lcom/motorola/ccc/ota/sources/fota/FotaConstants$AutoDownloadOption;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/motorola/ccc/ota/sources/fota/FotaConstants$AutoDownloadOption;->RAN:Lcom/motorola/ccc/ota/sources/fota/FotaConstants$AutoDownloadOption;

    invoke-static {}, Lcom/motorola/ccc/ota/sources/fota/FotaConstants$AutoDownloadOption;->$values()[Lcom/motorola/ccc/ota/sources/fota/FotaConstants$AutoDownloadOption;

    move-result-object v0

    sput-object v0, Lcom/motorola/ccc/ota/sources/fota/FotaConstants$AutoDownloadOption;->$VALUES:[Lcom/motorola/ccc/ota/sources/fota/FotaConstants$AutoDownloadOption;

    return-void
.end method

.method private constructor <init>(Ljava/lang/String;I)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/motorola/ccc/ota/sources/fota/FotaConstants$AutoDownloadOption;
    .locals 1

    const-class v0, Lcom/motorola/ccc/ota/sources/fota/FotaConstants$AutoDownloadOption;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object p0

    check-cast p0, Lcom/motorola/ccc/ota/sources/fota/FotaConstants$AutoDownloadOption;

    return-object p0
.end method

.method public static values()[Lcom/motorola/ccc/ota/sources/fota/FotaConstants$AutoDownloadOption;
    .locals 1

    sget-object v0, Lcom/motorola/ccc/ota/sources/fota/FotaConstants$AutoDownloadOption;->$VALUES:[Lcom/motorola/ccc/ota/sources/fota/FotaConstants$AutoDownloadOption;

    invoke-virtual {v0}, [Lcom/motorola/ccc/ota/sources/fota/FotaConstants$AutoDownloadOption;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lcom/motorola/ccc/ota/sources/fota/FotaConstants$AutoDownloadOption;

    return-object v0
.end method
