.class public final enum Lcom/motorola/ccc/ota/sources/UpgradeSourceType;
.super Ljava/lang/Enum;
.source "UpgradeSourceType.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum<",
        "Lcom/motorola/ccc/ota/sources/UpgradeSourceType;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcom/motorola/ccc/ota/sources/UpgradeSourceType;

.field public static final enum bootstrap:Lcom/motorola/ccc/ota/sources/UpgradeSourceType;

.field public static final enum fota:Lcom/motorola/ccc/ota/sources/UpgradeSourceType;

.field public static final enum modem:Lcom/motorola/ccc/ota/sources/UpgradeSourceType;

.field public static final enum sdcard:Lcom/motorola/ccc/ota/sources/UpgradeSourceType;

.field public static final enum upgrade:Lcom/motorola/ccc/ota/sources/UpgradeSourceType;


# direct methods
.method private static synthetic $values()[Lcom/motorola/ccc/ota/sources/UpgradeSourceType;
    .locals 5

    sget-object v0, Lcom/motorola/ccc/ota/sources/UpgradeSourceType;->bootstrap:Lcom/motorola/ccc/ota/sources/UpgradeSourceType;

    sget-object v1, Lcom/motorola/ccc/ota/sources/UpgradeSourceType;->upgrade:Lcom/motorola/ccc/ota/sources/UpgradeSourceType;

    sget-object v2, Lcom/motorola/ccc/ota/sources/UpgradeSourceType;->sdcard:Lcom/motorola/ccc/ota/sources/UpgradeSourceType;

    sget-object v3, Lcom/motorola/ccc/ota/sources/UpgradeSourceType;->fota:Lcom/motorola/ccc/ota/sources/UpgradeSourceType;

    sget-object v4, Lcom/motorola/ccc/ota/sources/UpgradeSourceType;->modem:Lcom/motorola/ccc/ota/sources/UpgradeSourceType;

    filled-new-array {v0, v1, v2, v3, v4}, [Lcom/motorola/ccc/ota/sources/UpgradeSourceType;

    move-result-object v0

    return-object v0
.end method

.method static constructor <clinit>()V
    .locals 3

    new-instance v0, Lcom/motorola/ccc/ota/sources/UpgradeSourceType;

    const-string v1, "bootstrap"

    const/4 v2, 0x0

    invoke-direct {v0, v1, v2}, Lcom/motorola/ccc/ota/sources/UpgradeSourceType;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/motorola/ccc/ota/sources/UpgradeSourceType;->bootstrap:Lcom/motorola/ccc/ota/sources/UpgradeSourceType;

    new-instance v0, Lcom/motorola/ccc/ota/sources/UpgradeSourceType;

    const-string v1, "upgrade"

    const/4 v2, 0x1

    invoke-direct {v0, v1, v2}, Lcom/motorola/ccc/ota/sources/UpgradeSourceType;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/motorola/ccc/ota/sources/UpgradeSourceType;->upgrade:Lcom/motorola/ccc/ota/sources/UpgradeSourceType;

    new-instance v0, Lcom/motorola/ccc/ota/sources/UpgradeSourceType;

    const-string v1, "sdcard"

    const/4 v2, 0x2

    invoke-direct {v0, v1, v2}, Lcom/motorola/ccc/ota/sources/UpgradeSourceType;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/motorola/ccc/ota/sources/UpgradeSourceType;->sdcard:Lcom/motorola/ccc/ota/sources/UpgradeSourceType;

    new-instance v0, Lcom/motorola/ccc/ota/sources/UpgradeSourceType;

    const-string v1, "fota"

    const/4 v2, 0x3

    invoke-direct {v0, v1, v2}, Lcom/motorola/ccc/ota/sources/UpgradeSourceType;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/motorola/ccc/ota/sources/UpgradeSourceType;->fota:Lcom/motorola/ccc/ota/sources/UpgradeSourceType;

    new-instance v0, Lcom/motorola/ccc/ota/sources/UpgradeSourceType;

    const-string v1, "modem"

    const/4 v2, 0x4

    invoke-direct {v0, v1, v2}, Lcom/motorola/ccc/ota/sources/UpgradeSourceType;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/motorola/ccc/ota/sources/UpgradeSourceType;->modem:Lcom/motorola/ccc/ota/sources/UpgradeSourceType;

    invoke-static {}, Lcom/motorola/ccc/ota/sources/UpgradeSourceType;->$values()[Lcom/motorola/ccc/ota/sources/UpgradeSourceType;

    move-result-object v0

    sput-object v0, Lcom/motorola/ccc/ota/sources/UpgradeSourceType;->$VALUES:[Lcom/motorola/ccc/ota/sources/UpgradeSourceType;

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

.method public static valueOf(Ljava/lang/String;)Lcom/motorola/ccc/ota/sources/UpgradeSourceType;
    .locals 1

    const-class v0, Lcom/motorola/ccc/ota/sources/UpgradeSourceType;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object p0

    check-cast p0, Lcom/motorola/ccc/ota/sources/UpgradeSourceType;

    return-object p0
.end method

.method public static values()[Lcom/motorola/ccc/ota/sources/UpgradeSourceType;
    .locals 1

    sget-object v0, Lcom/motorola/ccc/ota/sources/UpgradeSourceType;->$VALUES:[Lcom/motorola/ccc/ota/sources/UpgradeSourceType;

    invoke-virtual {v0}, [Lcom/motorola/ccc/ota/sources/UpgradeSourceType;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lcom/motorola/ccc/ota/sources/UpgradeSourceType;

    return-object v0
.end method
