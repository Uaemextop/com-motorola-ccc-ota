.class public final enum Lcom/motorola/ccc/ota/utils/UpgradeUtilConstants$ResponseFlavour;
.super Ljava/lang/Enum;
.source "UpgradeUtilConstants.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/motorola/ccc/ota/utils/UpgradeUtilConstants;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4019
    name = "ResponseFlavour"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum<",
        "Lcom/motorola/ccc/ota/utils/UpgradeUtilConstants$ResponseFlavour;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcom/motorola/ccc/ota/utils/UpgradeUtilConstants$ResponseFlavour;

.field public static final enum RESPONSE_FLAVOUR_WIFI:Lcom/motorola/ccc/ota/utils/UpgradeUtilConstants$ResponseFlavour;

.field public static final enum RESPONSE_FLAVOUR_WIFI_AND_MOBILE:Lcom/motorola/ccc/ota/utils/UpgradeUtilConstants$ResponseFlavour;


# direct methods
.method private static synthetic $values()[Lcom/motorola/ccc/ota/utils/UpgradeUtilConstants$ResponseFlavour;
    .locals 2

    sget-object v0, Lcom/motorola/ccc/ota/utils/UpgradeUtilConstants$ResponseFlavour;->RESPONSE_FLAVOUR_WIFI:Lcom/motorola/ccc/ota/utils/UpgradeUtilConstants$ResponseFlavour;

    sget-object v1, Lcom/motorola/ccc/ota/utils/UpgradeUtilConstants$ResponseFlavour;->RESPONSE_FLAVOUR_WIFI_AND_MOBILE:Lcom/motorola/ccc/ota/utils/UpgradeUtilConstants$ResponseFlavour;

    filled-new-array {v0, v1}, [Lcom/motorola/ccc/ota/utils/UpgradeUtilConstants$ResponseFlavour;

    move-result-object v0

    return-object v0
.end method

.method static constructor <clinit>()V
    .locals 3

    new-instance v0, Lcom/motorola/ccc/ota/utils/UpgradeUtilConstants$ResponseFlavour;

    const-string v1, "RESPONSE_FLAVOUR_WIFI"

    const/4 v2, 0x0

    invoke-direct {v0, v1, v2}, Lcom/motorola/ccc/ota/utils/UpgradeUtilConstants$ResponseFlavour;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/motorola/ccc/ota/utils/UpgradeUtilConstants$ResponseFlavour;->RESPONSE_FLAVOUR_WIFI:Lcom/motorola/ccc/ota/utils/UpgradeUtilConstants$ResponseFlavour;

    new-instance v0, Lcom/motorola/ccc/ota/utils/UpgradeUtilConstants$ResponseFlavour;

    const-string v1, "RESPONSE_FLAVOUR_WIFI_AND_MOBILE"

    const/4 v2, 0x1

    invoke-direct {v0, v1, v2}, Lcom/motorola/ccc/ota/utils/UpgradeUtilConstants$ResponseFlavour;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/motorola/ccc/ota/utils/UpgradeUtilConstants$ResponseFlavour;->RESPONSE_FLAVOUR_WIFI_AND_MOBILE:Lcom/motorola/ccc/ota/utils/UpgradeUtilConstants$ResponseFlavour;

    invoke-static {}, Lcom/motorola/ccc/ota/utils/UpgradeUtilConstants$ResponseFlavour;->$values()[Lcom/motorola/ccc/ota/utils/UpgradeUtilConstants$ResponseFlavour;

    move-result-object v0

    sput-object v0, Lcom/motorola/ccc/ota/utils/UpgradeUtilConstants$ResponseFlavour;->$VALUES:[Lcom/motorola/ccc/ota/utils/UpgradeUtilConstants$ResponseFlavour;

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

.method public static valueOf(Ljava/lang/String;)Lcom/motorola/ccc/ota/utils/UpgradeUtilConstants$ResponseFlavour;
    .locals 1

    const-class v0, Lcom/motorola/ccc/ota/utils/UpgradeUtilConstants$ResponseFlavour;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object p0

    check-cast p0, Lcom/motorola/ccc/ota/utils/UpgradeUtilConstants$ResponseFlavour;

    return-object p0
.end method

.method public static values()[Lcom/motorola/ccc/ota/utils/UpgradeUtilConstants$ResponseFlavour;
    .locals 1

    sget-object v0, Lcom/motorola/ccc/ota/utils/UpgradeUtilConstants$ResponseFlavour;->$VALUES:[Lcom/motorola/ccc/ota/utils/UpgradeUtilConstants$ResponseFlavour;

    invoke-virtual {v0}, [Lcom/motorola/ccc/ota/utils/UpgradeUtilConstants$ResponseFlavour;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lcom/motorola/ccc/ota/utils/UpgradeUtilConstants$ResponseFlavour;

    return-object v0
.end method
