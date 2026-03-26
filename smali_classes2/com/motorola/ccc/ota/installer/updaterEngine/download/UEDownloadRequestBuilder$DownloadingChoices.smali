.class public final enum Lcom/motorola/ccc/ota/installer/updaterEngine/download/UEDownloadRequestBuilder$DownloadingChoices;
.super Ljava/lang/Enum;
.source "UEDownloadRequestBuilder.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/motorola/ccc/ota/installer/updaterEngine/download/UEDownloadRequestBuilder;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4019
    name = "DownloadingChoices"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum<",
        "Lcom/motorola/ccc/ota/installer/updaterEngine/download/UEDownloadRequestBuilder$DownloadingChoices;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcom/motorola/ccc/ota/installer/updaterEngine/download/UEDownloadRequestBuilder$DownloadingChoices;

.field public static final enum ADMIN_OK:Lcom/motorola/ccc/ota/installer/updaterEngine/download/UEDownloadRequestBuilder$DownloadingChoices;

.field public static final enum NO_WAN:Lcom/motorola/ccc/ota/installer/updaterEngine/download/UEDownloadRequestBuilder$DownloadingChoices;

.field public static final enum ROAMING:Lcom/motorola/ccc/ota/installer/updaterEngine/download/UEDownloadRequestBuilder$DownloadingChoices;

.field public static final enum WAN_DISALLOWED:Lcom/motorola/ccc/ota/installer/updaterEngine/download/UEDownloadRequestBuilder$DownloadingChoices;

.field public static final enum WAN_OK:Lcom/motorola/ccc/ota/installer/updaterEngine/download/UEDownloadRequestBuilder$DownloadingChoices;

.field public static final enum WIFI_OK:Lcom/motorola/ccc/ota/installer/updaterEngine/download/UEDownloadRequestBuilder$DownloadingChoices;

.field public static final enum WIFI_ONLY:Lcom/motorola/ccc/ota/installer/updaterEngine/download/UEDownloadRequestBuilder$DownloadingChoices;


# direct methods
.method private static synthetic $values()[Lcom/motorola/ccc/ota/installer/updaterEngine/download/UEDownloadRequestBuilder$DownloadingChoices;
    .locals 7

    sget-object v0, Lcom/motorola/ccc/ota/installer/updaterEngine/download/UEDownloadRequestBuilder$DownloadingChoices;->WIFI_OK:Lcom/motorola/ccc/ota/installer/updaterEngine/download/UEDownloadRequestBuilder$DownloadingChoices;

    sget-object v1, Lcom/motorola/ccc/ota/installer/updaterEngine/download/UEDownloadRequestBuilder$DownloadingChoices;->WAN_OK:Lcom/motorola/ccc/ota/installer/updaterEngine/download/UEDownloadRequestBuilder$DownloadingChoices;

    sget-object v2, Lcom/motorola/ccc/ota/installer/updaterEngine/download/UEDownloadRequestBuilder$DownloadingChoices;->WIFI_ONLY:Lcom/motorola/ccc/ota/installer/updaterEngine/download/UEDownloadRequestBuilder$DownloadingChoices;

    sget-object v3, Lcom/motorola/ccc/ota/installer/updaterEngine/download/UEDownloadRequestBuilder$DownloadingChoices;->ROAMING:Lcom/motorola/ccc/ota/installer/updaterEngine/download/UEDownloadRequestBuilder$DownloadingChoices;

    sget-object v4, Lcom/motorola/ccc/ota/installer/updaterEngine/download/UEDownloadRequestBuilder$DownloadingChoices;->NO_WAN:Lcom/motorola/ccc/ota/installer/updaterEngine/download/UEDownloadRequestBuilder$DownloadingChoices;

    sget-object v5, Lcom/motorola/ccc/ota/installer/updaterEngine/download/UEDownloadRequestBuilder$DownloadingChoices;->WAN_DISALLOWED:Lcom/motorola/ccc/ota/installer/updaterEngine/download/UEDownloadRequestBuilder$DownloadingChoices;

    sget-object v6, Lcom/motorola/ccc/ota/installer/updaterEngine/download/UEDownloadRequestBuilder$DownloadingChoices;->ADMIN_OK:Lcom/motorola/ccc/ota/installer/updaterEngine/download/UEDownloadRequestBuilder$DownloadingChoices;

    filled-new-array/range {v0 .. v6}, [Lcom/motorola/ccc/ota/installer/updaterEngine/download/UEDownloadRequestBuilder$DownloadingChoices;

    move-result-object v0

    return-object v0
.end method

.method static constructor <clinit>()V
    .locals 3

    new-instance v0, Lcom/motorola/ccc/ota/installer/updaterEngine/download/UEDownloadRequestBuilder$DownloadingChoices;

    const-string v1, "WIFI_OK"

    const/4 v2, 0x0

    invoke-direct {v0, v1, v2}, Lcom/motorola/ccc/ota/installer/updaterEngine/download/UEDownloadRequestBuilder$DownloadingChoices;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/motorola/ccc/ota/installer/updaterEngine/download/UEDownloadRequestBuilder$DownloadingChoices;->WIFI_OK:Lcom/motorola/ccc/ota/installer/updaterEngine/download/UEDownloadRequestBuilder$DownloadingChoices;

    new-instance v0, Lcom/motorola/ccc/ota/installer/updaterEngine/download/UEDownloadRequestBuilder$DownloadingChoices;

    const-string v1, "WAN_OK"

    const/4 v2, 0x1

    invoke-direct {v0, v1, v2}, Lcom/motorola/ccc/ota/installer/updaterEngine/download/UEDownloadRequestBuilder$DownloadingChoices;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/motorola/ccc/ota/installer/updaterEngine/download/UEDownloadRequestBuilder$DownloadingChoices;->WAN_OK:Lcom/motorola/ccc/ota/installer/updaterEngine/download/UEDownloadRequestBuilder$DownloadingChoices;

    new-instance v0, Lcom/motorola/ccc/ota/installer/updaterEngine/download/UEDownloadRequestBuilder$DownloadingChoices;

    const-string v1, "WIFI_ONLY"

    const/4 v2, 0x2

    invoke-direct {v0, v1, v2}, Lcom/motorola/ccc/ota/installer/updaterEngine/download/UEDownloadRequestBuilder$DownloadingChoices;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/motorola/ccc/ota/installer/updaterEngine/download/UEDownloadRequestBuilder$DownloadingChoices;->WIFI_ONLY:Lcom/motorola/ccc/ota/installer/updaterEngine/download/UEDownloadRequestBuilder$DownloadingChoices;

    new-instance v0, Lcom/motorola/ccc/ota/installer/updaterEngine/download/UEDownloadRequestBuilder$DownloadingChoices;

    const-string v1, "ROAMING"

    const/4 v2, 0x3

    invoke-direct {v0, v1, v2}, Lcom/motorola/ccc/ota/installer/updaterEngine/download/UEDownloadRequestBuilder$DownloadingChoices;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/motorola/ccc/ota/installer/updaterEngine/download/UEDownloadRequestBuilder$DownloadingChoices;->ROAMING:Lcom/motorola/ccc/ota/installer/updaterEngine/download/UEDownloadRequestBuilder$DownloadingChoices;

    new-instance v0, Lcom/motorola/ccc/ota/installer/updaterEngine/download/UEDownloadRequestBuilder$DownloadingChoices;

    const-string v1, "NO_WAN"

    const/4 v2, 0x4

    invoke-direct {v0, v1, v2}, Lcom/motorola/ccc/ota/installer/updaterEngine/download/UEDownloadRequestBuilder$DownloadingChoices;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/motorola/ccc/ota/installer/updaterEngine/download/UEDownloadRequestBuilder$DownloadingChoices;->NO_WAN:Lcom/motorola/ccc/ota/installer/updaterEngine/download/UEDownloadRequestBuilder$DownloadingChoices;

    new-instance v0, Lcom/motorola/ccc/ota/installer/updaterEngine/download/UEDownloadRequestBuilder$DownloadingChoices;

    const-string v1, "WAN_DISALLOWED"

    const/4 v2, 0x5

    invoke-direct {v0, v1, v2}, Lcom/motorola/ccc/ota/installer/updaterEngine/download/UEDownloadRequestBuilder$DownloadingChoices;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/motorola/ccc/ota/installer/updaterEngine/download/UEDownloadRequestBuilder$DownloadingChoices;->WAN_DISALLOWED:Lcom/motorola/ccc/ota/installer/updaterEngine/download/UEDownloadRequestBuilder$DownloadingChoices;

    new-instance v0, Lcom/motorola/ccc/ota/installer/updaterEngine/download/UEDownloadRequestBuilder$DownloadingChoices;

    const-string v1, "ADMIN_OK"

    const/4 v2, 0x6

    invoke-direct {v0, v1, v2}, Lcom/motorola/ccc/ota/installer/updaterEngine/download/UEDownloadRequestBuilder$DownloadingChoices;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/motorola/ccc/ota/installer/updaterEngine/download/UEDownloadRequestBuilder$DownloadingChoices;->ADMIN_OK:Lcom/motorola/ccc/ota/installer/updaterEngine/download/UEDownloadRequestBuilder$DownloadingChoices;

    invoke-static {}, Lcom/motorola/ccc/ota/installer/updaterEngine/download/UEDownloadRequestBuilder$DownloadingChoices;->$values()[Lcom/motorola/ccc/ota/installer/updaterEngine/download/UEDownloadRequestBuilder$DownloadingChoices;

    move-result-object v0

    sput-object v0, Lcom/motorola/ccc/ota/installer/updaterEngine/download/UEDownloadRequestBuilder$DownloadingChoices;->$VALUES:[Lcom/motorola/ccc/ota/installer/updaterEngine/download/UEDownloadRequestBuilder$DownloadingChoices;

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

.method public static valueOf(Ljava/lang/String;)Lcom/motorola/ccc/ota/installer/updaterEngine/download/UEDownloadRequestBuilder$DownloadingChoices;
    .locals 1

    const-class v0, Lcom/motorola/ccc/ota/installer/updaterEngine/download/UEDownloadRequestBuilder$DownloadingChoices;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object p0

    check-cast p0, Lcom/motorola/ccc/ota/installer/updaterEngine/download/UEDownloadRequestBuilder$DownloadingChoices;

    return-object p0
.end method

.method public static values()[Lcom/motorola/ccc/ota/installer/updaterEngine/download/UEDownloadRequestBuilder$DownloadingChoices;
    .locals 1

    sget-object v0, Lcom/motorola/ccc/ota/installer/updaterEngine/download/UEDownloadRequestBuilder$DownloadingChoices;->$VALUES:[Lcom/motorola/ccc/ota/installer/updaterEngine/download/UEDownloadRequestBuilder$DownloadingChoices;

    invoke-virtual {v0}, [Lcom/motorola/ccc/ota/installer/updaterEngine/download/UEDownloadRequestBuilder$DownloadingChoices;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lcom/motorola/ccc/ota/installer/updaterEngine/download/UEDownloadRequestBuilder$DownloadingChoices;

    return-object v0
.end method
