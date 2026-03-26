.class public final enum Lcom/motorola/otalib/common/utils/UpgradeUtils$SeverityType;
.super Ljava/lang/Enum;
.source "UpgradeUtils.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/motorola/otalib/common/utils/UpgradeUtils;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4019
    name = "SeverityType"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum<",
        "Lcom/motorola/otalib/common/utils/UpgradeUtils$SeverityType;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcom/motorola/otalib/common/utils/UpgradeUtils$SeverityType;

.field public static final enum CRITICAL:Lcom/motorola/otalib/common/utils/UpgradeUtils$SeverityType;

.field public static final enum MANDATORY:Lcom/motorola/otalib/common/utils/UpgradeUtils$SeverityType;

.field public static final enum OPTIONAL:Lcom/motorola/otalib/common/utils/UpgradeUtils$SeverityType;


# direct methods
.method private static synthetic $values()[Lcom/motorola/otalib/common/utils/UpgradeUtils$SeverityType;
    .locals 3

    sget-object v0, Lcom/motorola/otalib/common/utils/UpgradeUtils$SeverityType;->OPTIONAL:Lcom/motorola/otalib/common/utils/UpgradeUtils$SeverityType;

    sget-object v1, Lcom/motorola/otalib/common/utils/UpgradeUtils$SeverityType;->MANDATORY:Lcom/motorola/otalib/common/utils/UpgradeUtils$SeverityType;

    sget-object v2, Lcom/motorola/otalib/common/utils/UpgradeUtils$SeverityType;->CRITICAL:Lcom/motorola/otalib/common/utils/UpgradeUtils$SeverityType;

    filled-new-array {v0, v1, v2}, [Lcom/motorola/otalib/common/utils/UpgradeUtils$SeverityType;

    move-result-object v0

    return-object v0
.end method

.method static constructor <clinit>()V
    .locals 3

    new-instance v0, Lcom/motorola/otalib/common/utils/UpgradeUtils$SeverityType;

    const-string v1, "OPTIONAL"

    const/4 v2, 0x0

    invoke-direct {v0, v1, v2}, Lcom/motorola/otalib/common/utils/UpgradeUtils$SeverityType;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/motorola/otalib/common/utils/UpgradeUtils$SeverityType;->OPTIONAL:Lcom/motorola/otalib/common/utils/UpgradeUtils$SeverityType;

    new-instance v0, Lcom/motorola/otalib/common/utils/UpgradeUtils$SeverityType;

    const-string v1, "MANDATORY"

    const/4 v2, 0x1

    invoke-direct {v0, v1, v2}, Lcom/motorola/otalib/common/utils/UpgradeUtils$SeverityType;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/motorola/otalib/common/utils/UpgradeUtils$SeverityType;->MANDATORY:Lcom/motorola/otalib/common/utils/UpgradeUtils$SeverityType;

    new-instance v0, Lcom/motorola/otalib/common/utils/UpgradeUtils$SeverityType;

    const-string v1, "CRITICAL"

    const/4 v2, 0x2

    invoke-direct {v0, v1, v2}, Lcom/motorola/otalib/common/utils/UpgradeUtils$SeverityType;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/motorola/otalib/common/utils/UpgradeUtils$SeverityType;->CRITICAL:Lcom/motorola/otalib/common/utils/UpgradeUtils$SeverityType;

    invoke-static {}, Lcom/motorola/otalib/common/utils/UpgradeUtils$SeverityType;->$values()[Lcom/motorola/otalib/common/utils/UpgradeUtils$SeverityType;

    move-result-object v0

    sput-object v0, Lcom/motorola/otalib/common/utils/UpgradeUtils$SeverityType;->$VALUES:[Lcom/motorola/otalib/common/utils/UpgradeUtils$SeverityType;

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

.method public static valueOf(Ljava/lang/String;)Lcom/motorola/otalib/common/utils/UpgradeUtils$SeverityType;
    .locals 1

    const-class v0, Lcom/motorola/otalib/common/utils/UpgradeUtils$SeverityType;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object p0

    check-cast p0, Lcom/motorola/otalib/common/utils/UpgradeUtils$SeverityType;

    return-object p0
.end method

.method public static values()[Lcom/motorola/otalib/common/utils/UpgradeUtils$SeverityType;
    .locals 1

    sget-object v0, Lcom/motorola/otalib/common/utils/UpgradeUtils$SeverityType;->$VALUES:[Lcom/motorola/otalib/common/utils/UpgradeUtils$SeverityType;

    invoke-virtual {v0}, [Lcom/motorola/otalib/common/utils/UpgradeUtils$SeverityType;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lcom/motorola/otalib/common/utils/UpgradeUtils$SeverityType;

    return-object v0
.end method
