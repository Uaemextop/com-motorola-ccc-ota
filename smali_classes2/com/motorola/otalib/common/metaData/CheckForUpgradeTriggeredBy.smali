.class public final enum Lcom/motorola/otalib/common/metaData/CheckForUpgradeTriggeredBy;
.super Ljava/lang/Enum;
.source "CheckForUpgradeTriggeredBy.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum<",
        "Lcom/motorola/otalib/common/metaData/CheckForUpgradeTriggeredBy;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcom/motorola/otalib/common/metaData/CheckForUpgradeTriggeredBy;

.field public static final enum notification:Lcom/motorola/otalib/common/metaData/CheckForUpgradeTriggeredBy;

.field public static final enum other:Lcom/motorola/otalib/common/metaData/CheckForUpgradeTriggeredBy;

.field public static final enum polling:Lcom/motorola/otalib/common/metaData/CheckForUpgradeTriggeredBy;

.field public static final enum setup:Lcom/motorola/otalib/common/metaData/CheckForUpgradeTriggeredBy;

.field public static final enum user:Lcom/motorola/otalib/common/metaData/CheckForUpgradeTriggeredBy;


# direct methods
.method private static synthetic $values()[Lcom/motorola/otalib/common/metaData/CheckForUpgradeTriggeredBy;
    .locals 5

    sget-object v0, Lcom/motorola/otalib/common/metaData/CheckForUpgradeTriggeredBy;->user:Lcom/motorola/otalib/common/metaData/CheckForUpgradeTriggeredBy;

    sget-object v1, Lcom/motorola/otalib/common/metaData/CheckForUpgradeTriggeredBy;->setup:Lcom/motorola/otalib/common/metaData/CheckForUpgradeTriggeredBy;

    sget-object v2, Lcom/motorola/otalib/common/metaData/CheckForUpgradeTriggeredBy;->polling:Lcom/motorola/otalib/common/metaData/CheckForUpgradeTriggeredBy;

    sget-object v3, Lcom/motorola/otalib/common/metaData/CheckForUpgradeTriggeredBy;->notification:Lcom/motorola/otalib/common/metaData/CheckForUpgradeTriggeredBy;

    sget-object v4, Lcom/motorola/otalib/common/metaData/CheckForUpgradeTriggeredBy;->other:Lcom/motorola/otalib/common/metaData/CheckForUpgradeTriggeredBy;

    filled-new-array {v0, v1, v2, v3, v4}, [Lcom/motorola/otalib/common/metaData/CheckForUpgradeTriggeredBy;

    move-result-object v0

    return-object v0
.end method

.method static constructor <clinit>()V
    .locals 3

    new-instance v0, Lcom/motorola/otalib/common/metaData/CheckForUpgradeTriggeredBy;

    const-string v1, "user"

    const/4 v2, 0x0

    invoke-direct {v0, v1, v2}, Lcom/motorola/otalib/common/metaData/CheckForUpgradeTriggeredBy;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/motorola/otalib/common/metaData/CheckForUpgradeTriggeredBy;->user:Lcom/motorola/otalib/common/metaData/CheckForUpgradeTriggeredBy;

    new-instance v0, Lcom/motorola/otalib/common/metaData/CheckForUpgradeTriggeredBy;

    const-string v1, "setup"

    const/4 v2, 0x1

    invoke-direct {v0, v1, v2}, Lcom/motorola/otalib/common/metaData/CheckForUpgradeTriggeredBy;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/motorola/otalib/common/metaData/CheckForUpgradeTriggeredBy;->setup:Lcom/motorola/otalib/common/metaData/CheckForUpgradeTriggeredBy;

    new-instance v0, Lcom/motorola/otalib/common/metaData/CheckForUpgradeTriggeredBy;

    const-string v1, "polling"

    const/4 v2, 0x2

    invoke-direct {v0, v1, v2}, Lcom/motorola/otalib/common/metaData/CheckForUpgradeTriggeredBy;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/motorola/otalib/common/metaData/CheckForUpgradeTriggeredBy;->polling:Lcom/motorola/otalib/common/metaData/CheckForUpgradeTriggeredBy;

    new-instance v0, Lcom/motorola/otalib/common/metaData/CheckForUpgradeTriggeredBy;

    const-string v1, "notification"

    const/4 v2, 0x3

    invoke-direct {v0, v1, v2}, Lcom/motorola/otalib/common/metaData/CheckForUpgradeTriggeredBy;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/motorola/otalib/common/metaData/CheckForUpgradeTriggeredBy;->notification:Lcom/motorola/otalib/common/metaData/CheckForUpgradeTriggeredBy;

    new-instance v0, Lcom/motorola/otalib/common/metaData/CheckForUpgradeTriggeredBy;

    const-string v1, "other"

    const/4 v2, 0x4

    invoke-direct {v0, v1, v2}, Lcom/motorola/otalib/common/metaData/CheckForUpgradeTriggeredBy;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/motorola/otalib/common/metaData/CheckForUpgradeTriggeredBy;->other:Lcom/motorola/otalib/common/metaData/CheckForUpgradeTriggeredBy;

    invoke-static {}, Lcom/motorola/otalib/common/metaData/CheckForUpgradeTriggeredBy;->$values()[Lcom/motorola/otalib/common/metaData/CheckForUpgradeTriggeredBy;

    move-result-object v0

    sput-object v0, Lcom/motorola/otalib/common/metaData/CheckForUpgradeTriggeredBy;->$VALUES:[Lcom/motorola/otalib/common/metaData/CheckForUpgradeTriggeredBy;

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

.method public static valueOf(Ljava/lang/String;)Lcom/motorola/otalib/common/metaData/CheckForUpgradeTriggeredBy;
    .locals 1

    const-class v0, Lcom/motorola/otalib/common/metaData/CheckForUpgradeTriggeredBy;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object p0

    check-cast p0, Lcom/motorola/otalib/common/metaData/CheckForUpgradeTriggeredBy;

    return-object p0
.end method

.method public static values()[Lcom/motorola/otalib/common/metaData/CheckForUpgradeTriggeredBy;
    .locals 1

    sget-object v0, Lcom/motorola/otalib/common/metaData/CheckForUpgradeTriggeredBy;->$VALUES:[Lcom/motorola/otalib/common/metaData/CheckForUpgradeTriggeredBy;

    invoke-virtual {v0}, [Lcom/motorola/otalib/common/metaData/CheckForUpgradeTriggeredBy;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lcom/motorola/otalib/common/metaData/CheckForUpgradeTriggeredBy;

    return-object v0
.end method
