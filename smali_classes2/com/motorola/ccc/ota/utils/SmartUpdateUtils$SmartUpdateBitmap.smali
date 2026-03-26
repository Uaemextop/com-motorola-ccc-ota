.class public final enum Lcom/motorola/ccc/ota/utils/SmartUpdateUtils$SmartUpdateBitmap;
.super Ljava/lang/Enum;
.source "SmartUpdateUtils.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/motorola/ccc/ota/utils/SmartUpdateUtils;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4019
    name = "SmartUpdateBitmap"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum<",
        "Lcom/motorola/ccc/ota/utils/SmartUpdateUtils$SmartUpdateBitmap;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcom/motorola/ccc/ota/utils/SmartUpdateUtils$SmartUpdateBitmap;

.field public static final enum forceMRUpdate:Lcom/motorola/ccc/ota/utils/SmartUpdateUtils$SmartUpdateBitmap;

.field public static final enum showAdvancedSetting:Lcom/motorola/ccc/ota/utils/SmartUpdateUtils$SmartUpdateBitmap;

.field public static final enum showDNDForPopUp:Lcom/motorola/ccc/ota/utils/SmartUpdateUtils$SmartUpdateBitmap;

.field public static final enum superSmartUpdateControlFlag:Lcom/motorola/ccc/ota/utils/SmartUpdateUtils$SmartUpdateBitmap;


# direct methods
.method private static synthetic $values()[Lcom/motorola/ccc/ota/utils/SmartUpdateUtils$SmartUpdateBitmap;
    .locals 4

    sget-object v0, Lcom/motorola/ccc/ota/utils/SmartUpdateUtils$SmartUpdateBitmap;->superSmartUpdateControlFlag:Lcom/motorola/ccc/ota/utils/SmartUpdateUtils$SmartUpdateBitmap;

    sget-object v1, Lcom/motorola/ccc/ota/utils/SmartUpdateUtils$SmartUpdateBitmap;->forceMRUpdate:Lcom/motorola/ccc/ota/utils/SmartUpdateUtils$SmartUpdateBitmap;

    sget-object v2, Lcom/motorola/ccc/ota/utils/SmartUpdateUtils$SmartUpdateBitmap;->showAdvancedSetting:Lcom/motorola/ccc/ota/utils/SmartUpdateUtils$SmartUpdateBitmap;

    sget-object v3, Lcom/motorola/ccc/ota/utils/SmartUpdateUtils$SmartUpdateBitmap;->showDNDForPopUp:Lcom/motorola/ccc/ota/utils/SmartUpdateUtils$SmartUpdateBitmap;

    filled-new-array {v0, v1, v2, v3}, [Lcom/motorola/ccc/ota/utils/SmartUpdateUtils$SmartUpdateBitmap;

    move-result-object v0

    return-object v0
.end method

.method static constructor <clinit>()V
    .locals 3

    new-instance v0, Lcom/motorola/ccc/ota/utils/SmartUpdateUtils$SmartUpdateBitmap;

    const-string v1, "superSmartUpdateControlFlag"

    const/4 v2, 0x0

    invoke-direct {v0, v1, v2}, Lcom/motorola/ccc/ota/utils/SmartUpdateUtils$SmartUpdateBitmap;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/motorola/ccc/ota/utils/SmartUpdateUtils$SmartUpdateBitmap;->superSmartUpdateControlFlag:Lcom/motorola/ccc/ota/utils/SmartUpdateUtils$SmartUpdateBitmap;

    new-instance v0, Lcom/motorola/ccc/ota/utils/SmartUpdateUtils$SmartUpdateBitmap;

    const-string v1, "forceMRUpdate"

    const/4 v2, 0x1

    invoke-direct {v0, v1, v2}, Lcom/motorola/ccc/ota/utils/SmartUpdateUtils$SmartUpdateBitmap;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/motorola/ccc/ota/utils/SmartUpdateUtils$SmartUpdateBitmap;->forceMRUpdate:Lcom/motorola/ccc/ota/utils/SmartUpdateUtils$SmartUpdateBitmap;

    new-instance v0, Lcom/motorola/ccc/ota/utils/SmartUpdateUtils$SmartUpdateBitmap;

    const-string v1, "showAdvancedSetting"

    const/4 v2, 0x2

    invoke-direct {v0, v1, v2}, Lcom/motorola/ccc/ota/utils/SmartUpdateUtils$SmartUpdateBitmap;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/motorola/ccc/ota/utils/SmartUpdateUtils$SmartUpdateBitmap;->showAdvancedSetting:Lcom/motorola/ccc/ota/utils/SmartUpdateUtils$SmartUpdateBitmap;

    new-instance v0, Lcom/motorola/ccc/ota/utils/SmartUpdateUtils$SmartUpdateBitmap;

    const-string v1, "showDNDForPopUp"

    const/4 v2, 0x3

    invoke-direct {v0, v1, v2}, Lcom/motorola/ccc/ota/utils/SmartUpdateUtils$SmartUpdateBitmap;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/motorola/ccc/ota/utils/SmartUpdateUtils$SmartUpdateBitmap;->showDNDForPopUp:Lcom/motorola/ccc/ota/utils/SmartUpdateUtils$SmartUpdateBitmap;

    invoke-static {}, Lcom/motorola/ccc/ota/utils/SmartUpdateUtils$SmartUpdateBitmap;->$values()[Lcom/motorola/ccc/ota/utils/SmartUpdateUtils$SmartUpdateBitmap;

    move-result-object v0

    sput-object v0, Lcom/motorola/ccc/ota/utils/SmartUpdateUtils$SmartUpdateBitmap;->$VALUES:[Lcom/motorola/ccc/ota/utils/SmartUpdateUtils$SmartUpdateBitmap;

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

.method public static valueOf(Ljava/lang/String;)Lcom/motorola/ccc/ota/utils/SmartUpdateUtils$SmartUpdateBitmap;
    .locals 1

    const-class v0, Lcom/motorola/ccc/ota/utils/SmartUpdateUtils$SmartUpdateBitmap;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object p0

    check-cast p0, Lcom/motorola/ccc/ota/utils/SmartUpdateUtils$SmartUpdateBitmap;

    return-object p0
.end method

.method public static values()[Lcom/motorola/ccc/ota/utils/SmartUpdateUtils$SmartUpdateBitmap;
    .locals 1

    sget-object v0, Lcom/motorola/ccc/ota/utils/SmartUpdateUtils$SmartUpdateBitmap;->$VALUES:[Lcom/motorola/ccc/ota/utils/SmartUpdateUtils$SmartUpdateBitmap;

    invoke-virtual {v0}, [Lcom/motorola/ccc/ota/utils/SmartUpdateUtils$SmartUpdateBitmap;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lcom/motorola/ccc/ota/utils/SmartUpdateUtils$SmartUpdateBitmap;

    return-object v0
.end method
