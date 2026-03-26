.class public final enum Lcom/motorola/ccc/ota/utils/UpgradeUtilConstants$FragmentTypeEnum;
.super Ljava/lang/Enum;
.source "UpgradeUtilConstants.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/motorola/ccc/ota/utils/UpgradeUtilConstants;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4019
    name = "FragmentTypeEnum"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum<",
        "Lcom/motorola/ccc/ota/utils/UpgradeUtilConstants$FragmentTypeEnum;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcom/motorola/ccc/ota/utils/UpgradeUtilConstants$FragmentTypeEnum;

.field public static final enum BACKGROUND_INSTALLATION_FRAGMENT:Lcom/motorola/ccc/ota/utils/UpgradeUtilConstants$FragmentTypeEnum;

.field public static final enum CHECK_UPDATE_FRAGMENT:Lcom/motorola/ccc/ota/utils/UpgradeUtilConstants$FragmentTypeEnum;

.field public static final enum DOWNLOAD_FRAGMENT:Lcom/motorola/ccc/ota/utils/UpgradeUtilConstants$FragmentTypeEnum;

.field public static final enum DOWNLOAD_PROGRESS_FRAGMENT:Lcom/motorola/ccc/ota/utils/UpgradeUtilConstants$FragmentTypeEnum;

.field public static final enum INSTALL_FRAGMENT:Lcom/motorola/ccc/ota/utils/UpgradeUtilConstants$FragmentTypeEnum;

.field public static final enum MERGE_RESTART_FRAGMENT:Lcom/motorola/ccc/ota/utils/UpgradeUtilConstants$FragmentTypeEnum;

.field public static final enum RESTART_FRAGMENT:Lcom/motorola/ccc/ota/utils/UpgradeUtilConstants$FragmentTypeEnum;

.field public static final enum SMART_UPDATE_FRAGMENT:Lcom/motorola/ccc/ota/utils/UpgradeUtilConstants$FragmentTypeEnum;

.field public static final enum UPDATE_COMPLETE_FRAGMENT:Lcom/motorola/ccc/ota/utils/UpgradeUtilConstants$FragmentTypeEnum;

.field public static final enum UPDATE_FAILED_FRAGMENT:Lcom/motorola/ccc/ota/utils/UpgradeUtilConstants$FragmentTypeEnum;

.field public static final enum UPDATE_PREF_FRAGMENT:Lcom/motorola/ccc/ota/utils/UpgradeUtilConstants$FragmentTypeEnum;


# direct methods
.method private static synthetic $values()[Lcom/motorola/ccc/ota/utils/UpgradeUtilConstants$FragmentTypeEnum;
    .locals 11

    sget-object v0, Lcom/motorola/ccc/ota/utils/UpgradeUtilConstants$FragmentTypeEnum;->CHECK_UPDATE_FRAGMENT:Lcom/motorola/ccc/ota/utils/UpgradeUtilConstants$FragmentTypeEnum;

    sget-object v1, Lcom/motorola/ccc/ota/utils/UpgradeUtilConstants$FragmentTypeEnum;->DOWNLOAD_FRAGMENT:Lcom/motorola/ccc/ota/utils/UpgradeUtilConstants$FragmentTypeEnum;

    sget-object v2, Lcom/motorola/ccc/ota/utils/UpgradeUtilConstants$FragmentTypeEnum;->DOWNLOAD_PROGRESS_FRAGMENT:Lcom/motorola/ccc/ota/utils/UpgradeUtilConstants$FragmentTypeEnum;

    sget-object v3, Lcom/motorola/ccc/ota/utils/UpgradeUtilConstants$FragmentTypeEnum;->BACKGROUND_INSTALLATION_FRAGMENT:Lcom/motorola/ccc/ota/utils/UpgradeUtilConstants$FragmentTypeEnum;

    sget-object v4, Lcom/motorola/ccc/ota/utils/UpgradeUtilConstants$FragmentTypeEnum;->INSTALL_FRAGMENT:Lcom/motorola/ccc/ota/utils/UpgradeUtilConstants$FragmentTypeEnum;

    sget-object v5, Lcom/motorola/ccc/ota/utils/UpgradeUtilConstants$FragmentTypeEnum;->RESTART_FRAGMENT:Lcom/motorola/ccc/ota/utils/UpgradeUtilConstants$FragmentTypeEnum;

    sget-object v6, Lcom/motorola/ccc/ota/utils/UpgradeUtilConstants$FragmentTypeEnum;->MERGE_RESTART_FRAGMENT:Lcom/motorola/ccc/ota/utils/UpgradeUtilConstants$FragmentTypeEnum;

    sget-object v7, Lcom/motorola/ccc/ota/utils/UpgradeUtilConstants$FragmentTypeEnum;->UPDATE_COMPLETE_FRAGMENT:Lcom/motorola/ccc/ota/utils/UpgradeUtilConstants$FragmentTypeEnum;

    sget-object v8, Lcom/motorola/ccc/ota/utils/UpgradeUtilConstants$FragmentTypeEnum;->SMART_UPDATE_FRAGMENT:Lcom/motorola/ccc/ota/utils/UpgradeUtilConstants$FragmentTypeEnum;

    sget-object v9, Lcom/motorola/ccc/ota/utils/UpgradeUtilConstants$FragmentTypeEnum;->UPDATE_PREF_FRAGMENT:Lcom/motorola/ccc/ota/utils/UpgradeUtilConstants$FragmentTypeEnum;

    sget-object v10, Lcom/motorola/ccc/ota/utils/UpgradeUtilConstants$FragmentTypeEnum;->UPDATE_FAILED_FRAGMENT:Lcom/motorola/ccc/ota/utils/UpgradeUtilConstants$FragmentTypeEnum;

    filled-new-array/range {v0 .. v10}, [Lcom/motorola/ccc/ota/utils/UpgradeUtilConstants$FragmentTypeEnum;

    move-result-object v0

    return-object v0
.end method

.method static constructor <clinit>()V
    .locals 3

    new-instance v0, Lcom/motorola/ccc/ota/utils/UpgradeUtilConstants$FragmentTypeEnum;

    const-string v1, "CHECK_UPDATE_FRAGMENT"

    const/4 v2, 0x0

    invoke-direct {v0, v1, v2}, Lcom/motorola/ccc/ota/utils/UpgradeUtilConstants$FragmentTypeEnum;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/motorola/ccc/ota/utils/UpgradeUtilConstants$FragmentTypeEnum;->CHECK_UPDATE_FRAGMENT:Lcom/motorola/ccc/ota/utils/UpgradeUtilConstants$FragmentTypeEnum;

    new-instance v0, Lcom/motorola/ccc/ota/utils/UpgradeUtilConstants$FragmentTypeEnum;

    const-string v1, "DOWNLOAD_FRAGMENT"

    const/4 v2, 0x1

    invoke-direct {v0, v1, v2}, Lcom/motorola/ccc/ota/utils/UpgradeUtilConstants$FragmentTypeEnum;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/motorola/ccc/ota/utils/UpgradeUtilConstants$FragmentTypeEnum;->DOWNLOAD_FRAGMENT:Lcom/motorola/ccc/ota/utils/UpgradeUtilConstants$FragmentTypeEnum;

    new-instance v0, Lcom/motorola/ccc/ota/utils/UpgradeUtilConstants$FragmentTypeEnum;

    const-string v1, "DOWNLOAD_PROGRESS_FRAGMENT"

    const/4 v2, 0x2

    invoke-direct {v0, v1, v2}, Lcom/motorola/ccc/ota/utils/UpgradeUtilConstants$FragmentTypeEnum;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/motorola/ccc/ota/utils/UpgradeUtilConstants$FragmentTypeEnum;->DOWNLOAD_PROGRESS_FRAGMENT:Lcom/motorola/ccc/ota/utils/UpgradeUtilConstants$FragmentTypeEnum;

    new-instance v0, Lcom/motorola/ccc/ota/utils/UpgradeUtilConstants$FragmentTypeEnum;

    const-string v1, "BACKGROUND_INSTALLATION_FRAGMENT"

    const/4 v2, 0x3

    invoke-direct {v0, v1, v2}, Lcom/motorola/ccc/ota/utils/UpgradeUtilConstants$FragmentTypeEnum;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/motorola/ccc/ota/utils/UpgradeUtilConstants$FragmentTypeEnum;->BACKGROUND_INSTALLATION_FRAGMENT:Lcom/motorola/ccc/ota/utils/UpgradeUtilConstants$FragmentTypeEnum;

    new-instance v0, Lcom/motorola/ccc/ota/utils/UpgradeUtilConstants$FragmentTypeEnum;

    const-string v1, "INSTALL_FRAGMENT"

    const/4 v2, 0x4

    invoke-direct {v0, v1, v2}, Lcom/motorola/ccc/ota/utils/UpgradeUtilConstants$FragmentTypeEnum;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/motorola/ccc/ota/utils/UpgradeUtilConstants$FragmentTypeEnum;->INSTALL_FRAGMENT:Lcom/motorola/ccc/ota/utils/UpgradeUtilConstants$FragmentTypeEnum;

    new-instance v0, Lcom/motorola/ccc/ota/utils/UpgradeUtilConstants$FragmentTypeEnum;

    const-string v1, "RESTART_FRAGMENT"

    const/4 v2, 0x5

    invoke-direct {v0, v1, v2}, Lcom/motorola/ccc/ota/utils/UpgradeUtilConstants$FragmentTypeEnum;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/motorola/ccc/ota/utils/UpgradeUtilConstants$FragmentTypeEnum;->RESTART_FRAGMENT:Lcom/motorola/ccc/ota/utils/UpgradeUtilConstants$FragmentTypeEnum;

    new-instance v0, Lcom/motorola/ccc/ota/utils/UpgradeUtilConstants$FragmentTypeEnum;

    const-string v1, "MERGE_RESTART_FRAGMENT"

    const/4 v2, 0x6

    invoke-direct {v0, v1, v2}, Lcom/motorola/ccc/ota/utils/UpgradeUtilConstants$FragmentTypeEnum;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/motorola/ccc/ota/utils/UpgradeUtilConstants$FragmentTypeEnum;->MERGE_RESTART_FRAGMENT:Lcom/motorola/ccc/ota/utils/UpgradeUtilConstants$FragmentTypeEnum;

    new-instance v0, Lcom/motorola/ccc/ota/utils/UpgradeUtilConstants$FragmentTypeEnum;

    const-string v1, "UPDATE_COMPLETE_FRAGMENT"

    const/4 v2, 0x7

    invoke-direct {v0, v1, v2}, Lcom/motorola/ccc/ota/utils/UpgradeUtilConstants$FragmentTypeEnum;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/motorola/ccc/ota/utils/UpgradeUtilConstants$FragmentTypeEnum;->UPDATE_COMPLETE_FRAGMENT:Lcom/motorola/ccc/ota/utils/UpgradeUtilConstants$FragmentTypeEnum;

    new-instance v0, Lcom/motorola/ccc/ota/utils/UpgradeUtilConstants$FragmentTypeEnum;

    const-string v1, "SMART_UPDATE_FRAGMENT"

    const/16 v2, 0x8

    invoke-direct {v0, v1, v2}, Lcom/motorola/ccc/ota/utils/UpgradeUtilConstants$FragmentTypeEnum;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/motorola/ccc/ota/utils/UpgradeUtilConstants$FragmentTypeEnum;->SMART_UPDATE_FRAGMENT:Lcom/motorola/ccc/ota/utils/UpgradeUtilConstants$FragmentTypeEnum;

    new-instance v0, Lcom/motorola/ccc/ota/utils/UpgradeUtilConstants$FragmentTypeEnum;

    const-string v1, "UPDATE_PREF_FRAGMENT"

    const/16 v2, 0x9

    invoke-direct {v0, v1, v2}, Lcom/motorola/ccc/ota/utils/UpgradeUtilConstants$FragmentTypeEnum;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/motorola/ccc/ota/utils/UpgradeUtilConstants$FragmentTypeEnum;->UPDATE_PREF_FRAGMENT:Lcom/motorola/ccc/ota/utils/UpgradeUtilConstants$FragmentTypeEnum;

    new-instance v0, Lcom/motorola/ccc/ota/utils/UpgradeUtilConstants$FragmentTypeEnum;

    const-string v1, "UPDATE_FAILED_FRAGMENT"

    const/16 v2, 0xa

    invoke-direct {v0, v1, v2}, Lcom/motorola/ccc/ota/utils/UpgradeUtilConstants$FragmentTypeEnum;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/motorola/ccc/ota/utils/UpgradeUtilConstants$FragmentTypeEnum;->UPDATE_FAILED_FRAGMENT:Lcom/motorola/ccc/ota/utils/UpgradeUtilConstants$FragmentTypeEnum;

    invoke-static {}, Lcom/motorola/ccc/ota/utils/UpgradeUtilConstants$FragmentTypeEnum;->$values()[Lcom/motorola/ccc/ota/utils/UpgradeUtilConstants$FragmentTypeEnum;

    move-result-object v0

    sput-object v0, Lcom/motorola/ccc/ota/utils/UpgradeUtilConstants$FragmentTypeEnum;->$VALUES:[Lcom/motorola/ccc/ota/utils/UpgradeUtilConstants$FragmentTypeEnum;

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

.method public static valueOf(Ljava/lang/String;)Lcom/motorola/ccc/ota/utils/UpgradeUtilConstants$FragmentTypeEnum;
    .locals 1

    const-class v0, Lcom/motorola/ccc/ota/utils/UpgradeUtilConstants$FragmentTypeEnum;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object p0

    check-cast p0, Lcom/motorola/ccc/ota/utils/UpgradeUtilConstants$FragmentTypeEnum;

    return-object p0
.end method

.method public static values()[Lcom/motorola/ccc/ota/utils/UpgradeUtilConstants$FragmentTypeEnum;
    .locals 1

    sget-object v0, Lcom/motorola/ccc/ota/utils/UpgradeUtilConstants$FragmentTypeEnum;->$VALUES:[Lcom/motorola/ccc/ota/utils/UpgradeUtilConstants$FragmentTypeEnum;

    invoke-virtual {v0}, [Lcom/motorola/ccc/ota/utils/UpgradeUtilConstants$FragmentTypeEnum;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lcom/motorola/ccc/ota/utils/UpgradeUtilConstants$FragmentTypeEnum;

    return-object v0
.end method
