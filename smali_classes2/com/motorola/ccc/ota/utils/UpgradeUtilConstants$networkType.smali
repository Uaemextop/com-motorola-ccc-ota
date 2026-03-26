.class public final enum Lcom/motorola/ccc/ota/utils/UpgradeUtilConstants$networkType;
.super Ljava/lang/Enum;
.source "UpgradeUtilConstants.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/motorola/ccc/ota/utils/UpgradeUtilConstants;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4019
    name = "networkType"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum<",
        "Lcom/motorola/ccc/ota/utils/UpgradeUtilConstants$networkType;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcom/motorola/ccc/ota/utils/UpgradeUtilConstants$networkType;

.field public static final enum CELL3G:Lcom/motorola/ccc/ota/utils/UpgradeUtilConstants$networkType;

.field public static final enum CELL4G:Lcom/motorola/ccc/ota/utils/UpgradeUtilConstants$networkType;

.field public static final enum CELLULAR:Lcom/motorola/ccc/ota/utils/UpgradeUtilConstants$networkType;

.field public static final enum ROAMING:Lcom/motorola/ccc/ota/utils/UpgradeUtilConstants$networkType;

.field public static final enum UNKNOWN:Lcom/motorola/ccc/ota/utils/UpgradeUtilConstants$networkType;

.field public static final enum WIFI:Lcom/motorola/ccc/ota/utils/UpgradeUtilConstants$networkType;


# direct methods
.method private static synthetic $values()[Lcom/motorola/ccc/ota/utils/UpgradeUtilConstants$networkType;
    .locals 6

    sget-object v0, Lcom/motorola/ccc/ota/utils/UpgradeUtilConstants$networkType;->WIFI:Lcom/motorola/ccc/ota/utils/UpgradeUtilConstants$networkType;

    sget-object v1, Lcom/motorola/ccc/ota/utils/UpgradeUtilConstants$networkType;->CELLULAR:Lcom/motorola/ccc/ota/utils/UpgradeUtilConstants$networkType;

    sget-object v2, Lcom/motorola/ccc/ota/utils/UpgradeUtilConstants$networkType;->CELL3G:Lcom/motorola/ccc/ota/utils/UpgradeUtilConstants$networkType;

    sget-object v3, Lcom/motorola/ccc/ota/utils/UpgradeUtilConstants$networkType;->CELL4G:Lcom/motorola/ccc/ota/utils/UpgradeUtilConstants$networkType;

    sget-object v4, Lcom/motorola/ccc/ota/utils/UpgradeUtilConstants$networkType;->ROAMING:Lcom/motorola/ccc/ota/utils/UpgradeUtilConstants$networkType;

    sget-object v5, Lcom/motorola/ccc/ota/utils/UpgradeUtilConstants$networkType;->UNKNOWN:Lcom/motorola/ccc/ota/utils/UpgradeUtilConstants$networkType;

    filled-new-array/range {v0 .. v5}, [Lcom/motorola/ccc/ota/utils/UpgradeUtilConstants$networkType;

    move-result-object v0

    return-object v0
.end method

.method static constructor <clinit>()V
    .locals 3

    new-instance v0, Lcom/motorola/ccc/ota/utils/UpgradeUtilConstants$networkType;

    const-string v1, "WIFI"

    const/4 v2, 0x0

    invoke-direct {v0, v1, v2}, Lcom/motorola/ccc/ota/utils/UpgradeUtilConstants$networkType;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/motorola/ccc/ota/utils/UpgradeUtilConstants$networkType;->WIFI:Lcom/motorola/ccc/ota/utils/UpgradeUtilConstants$networkType;

    new-instance v0, Lcom/motorola/ccc/ota/utils/UpgradeUtilConstants$networkType;

    const-string v1, "CELLULAR"

    const/4 v2, 0x1

    invoke-direct {v0, v1, v2}, Lcom/motorola/ccc/ota/utils/UpgradeUtilConstants$networkType;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/motorola/ccc/ota/utils/UpgradeUtilConstants$networkType;->CELLULAR:Lcom/motorola/ccc/ota/utils/UpgradeUtilConstants$networkType;

    new-instance v0, Lcom/motorola/ccc/ota/utils/UpgradeUtilConstants$networkType;

    const-string v1, "CELL3G"

    const/4 v2, 0x2

    invoke-direct {v0, v1, v2}, Lcom/motorola/ccc/ota/utils/UpgradeUtilConstants$networkType;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/motorola/ccc/ota/utils/UpgradeUtilConstants$networkType;->CELL3G:Lcom/motorola/ccc/ota/utils/UpgradeUtilConstants$networkType;

    new-instance v0, Lcom/motorola/ccc/ota/utils/UpgradeUtilConstants$networkType;

    const-string v1, "CELL4G"

    const/4 v2, 0x3

    invoke-direct {v0, v1, v2}, Lcom/motorola/ccc/ota/utils/UpgradeUtilConstants$networkType;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/motorola/ccc/ota/utils/UpgradeUtilConstants$networkType;->CELL4G:Lcom/motorola/ccc/ota/utils/UpgradeUtilConstants$networkType;

    new-instance v0, Lcom/motorola/ccc/ota/utils/UpgradeUtilConstants$networkType;

    const-string v1, "ROAMING"

    const/4 v2, 0x4

    invoke-direct {v0, v1, v2}, Lcom/motorola/ccc/ota/utils/UpgradeUtilConstants$networkType;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/motorola/ccc/ota/utils/UpgradeUtilConstants$networkType;->ROAMING:Lcom/motorola/ccc/ota/utils/UpgradeUtilConstants$networkType;

    new-instance v0, Lcom/motorola/ccc/ota/utils/UpgradeUtilConstants$networkType;

    const-string v1, "UNKNOWN"

    const/4 v2, 0x5

    invoke-direct {v0, v1, v2}, Lcom/motorola/ccc/ota/utils/UpgradeUtilConstants$networkType;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/motorola/ccc/ota/utils/UpgradeUtilConstants$networkType;->UNKNOWN:Lcom/motorola/ccc/ota/utils/UpgradeUtilConstants$networkType;

    invoke-static {}, Lcom/motorola/ccc/ota/utils/UpgradeUtilConstants$networkType;->$values()[Lcom/motorola/ccc/ota/utils/UpgradeUtilConstants$networkType;

    move-result-object v0

    sput-object v0, Lcom/motorola/ccc/ota/utils/UpgradeUtilConstants$networkType;->$VALUES:[Lcom/motorola/ccc/ota/utils/UpgradeUtilConstants$networkType;

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

.method public static valueOf(Ljava/lang/String;)Lcom/motorola/ccc/ota/utils/UpgradeUtilConstants$networkType;
    .locals 1

    const-class v0, Lcom/motorola/ccc/ota/utils/UpgradeUtilConstants$networkType;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object p0

    check-cast p0, Lcom/motorola/ccc/ota/utils/UpgradeUtilConstants$networkType;

    return-object p0
.end method

.method public static values()[Lcom/motorola/ccc/ota/utils/UpgradeUtilConstants$networkType;
    .locals 1

    sget-object v0, Lcom/motorola/ccc/ota/utils/UpgradeUtilConstants$networkType;->$VALUES:[Lcom/motorola/ccc/ota/utils/UpgradeUtilConstants$networkType;

    invoke-virtual {v0}, [Lcom/motorola/ccc/ota/utils/UpgradeUtilConstants$networkType;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lcom/motorola/ccc/ota/utils/UpgradeUtilConstants$networkType;

    return-object v0
.end method
