.class public final enum Lcom/motorola/ccc/ota/utils/UpgradeUtilConstants$CheckSpaceEnum;
.super Ljava/lang/Enum;
.source "UpgradeUtilConstants.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/motorola/ccc/ota/utils/UpgradeUtilConstants;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4019
    name = "CheckSpaceEnum"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum<",
        "Lcom/motorola/ccc/ota/utils/UpgradeUtilConstants$CheckSpaceEnum;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcom/motorola/ccc/ota/utils/UpgradeUtilConstants$CheckSpaceEnum;

.field public static final enum SPACE_AVAILABLE:Lcom/motorola/ccc/ota/utils/UpgradeUtilConstants$CheckSpaceEnum;

.field public static final enum SPACE_AVAILABLE_AFTER_LOW_STORAGE:Lcom/motorola/ccc/ota/utils/UpgradeUtilConstants$CheckSpaceEnum;

.field public static final enum SPACE_NOT_AVAILABLE:Lcom/motorola/ccc/ota/utils/UpgradeUtilConstants$CheckSpaceEnum;


# direct methods
.method private static synthetic $values()[Lcom/motorola/ccc/ota/utils/UpgradeUtilConstants$CheckSpaceEnum;
    .locals 3

    sget-object v0, Lcom/motorola/ccc/ota/utils/UpgradeUtilConstants$CheckSpaceEnum;->SPACE_AVAILABLE:Lcom/motorola/ccc/ota/utils/UpgradeUtilConstants$CheckSpaceEnum;

    sget-object v1, Lcom/motorola/ccc/ota/utils/UpgradeUtilConstants$CheckSpaceEnum;->SPACE_NOT_AVAILABLE:Lcom/motorola/ccc/ota/utils/UpgradeUtilConstants$CheckSpaceEnum;

    sget-object v2, Lcom/motorola/ccc/ota/utils/UpgradeUtilConstants$CheckSpaceEnum;->SPACE_AVAILABLE_AFTER_LOW_STORAGE:Lcom/motorola/ccc/ota/utils/UpgradeUtilConstants$CheckSpaceEnum;

    filled-new-array {v0, v1, v2}, [Lcom/motorola/ccc/ota/utils/UpgradeUtilConstants$CheckSpaceEnum;

    move-result-object v0

    return-object v0
.end method

.method static constructor <clinit>()V
    .locals 3

    new-instance v0, Lcom/motorola/ccc/ota/utils/UpgradeUtilConstants$CheckSpaceEnum;

    const-string v1, "SPACE_AVAILABLE"

    const/4 v2, 0x0

    invoke-direct {v0, v1, v2}, Lcom/motorola/ccc/ota/utils/UpgradeUtilConstants$CheckSpaceEnum;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/motorola/ccc/ota/utils/UpgradeUtilConstants$CheckSpaceEnum;->SPACE_AVAILABLE:Lcom/motorola/ccc/ota/utils/UpgradeUtilConstants$CheckSpaceEnum;

    new-instance v0, Lcom/motorola/ccc/ota/utils/UpgradeUtilConstants$CheckSpaceEnum;

    const-string v1, "SPACE_NOT_AVAILABLE"

    const/4 v2, 0x1

    invoke-direct {v0, v1, v2}, Lcom/motorola/ccc/ota/utils/UpgradeUtilConstants$CheckSpaceEnum;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/motorola/ccc/ota/utils/UpgradeUtilConstants$CheckSpaceEnum;->SPACE_NOT_AVAILABLE:Lcom/motorola/ccc/ota/utils/UpgradeUtilConstants$CheckSpaceEnum;

    new-instance v0, Lcom/motorola/ccc/ota/utils/UpgradeUtilConstants$CheckSpaceEnum;

    const-string v1, "SPACE_AVAILABLE_AFTER_LOW_STORAGE"

    const/4 v2, 0x2

    invoke-direct {v0, v1, v2}, Lcom/motorola/ccc/ota/utils/UpgradeUtilConstants$CheckSpaceEnum;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/motorola/ccc/ota/utils/UpgradeUtilConstants$CheckSpaceEnum;->SPACE_AVAILABLE_AFTER_LOW_STORAGE:Lcom/motorola/ccc/ota/utils/UpgradeUtilConstants$CheckSpaceEnum;

    invoke-static {}, Lcom/motorola/ccc/ota/utils/UpgradeUtilConstants$CheckSpaceEnum;->$values()[Lcom/motorola/ccc/ota/utils/UpgradeUtilConstants$CheckSpaceEnum;

    move-result-object v0

    sput-object v0, Lcom/motorola/ccc/ota/utils/UpgradeUtilConstants$CheckSpaceEnum;->$VALUES:[Lcom/motorola/ccc/ota/utils/UpgradeUtilConstants$CheckSpaceEnum;

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

.method public static valueOf(Ljava/lang/String;)Lcom/motorola/ccc/ota/utils/UpgradeUtilConstants$CheckSpaceEnum;
    .locals 1

    const-class v0, Lcom/motorola/ccc/ota/utils/UpgradeUtilConstants$CheckSpaceEnum;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object p0

    check-cast p0, Lcom/motorola/ccc/ota/utils/UpgradeUtilConstants$CheckSpaceEnum;

    return-object p0
.end method

.method public static values()[Lcom/motorola/ccc/ota/utils/UpgradeUtilConstants$CheckSpaceEnum;
    .locals 1

    sget-object v0, Lcom/motorola/ccc/ota/utils/UpgradeUtilConstants$CheckSpaceEnum;->$VALUES:[Lcom/motorola/ccc/ota/utils/UpgradeUtilConstants$CheckSpaceEnum;

    invoke-virtual {v0}, [Lcom/motorola/ccc/ota/utils/UpgradeUtilConstants$CheckSpaceEnum;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lcom/motorola/ccc/ota/utils/UpgradeUtilConstants$CheckSpaceEnum;

    return-object v0
.end method
