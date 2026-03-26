.class public final enum Lcom/motorola/ccc/ota/NewVersionHandler$ReturnCode;
.super Ljava/lang/Enum;
.source "NewVersionHandler.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/motorola/ccc/ota/NewVersionHandler;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4019
    name = "ReturnCode"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum<",
        "Lcom/motorola/ccc/ota/NewVersionHandler$ReturnCode;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcom/motorola/ccc/ota/NewVersionHandler$ReturnCode;

.field public static final enum NEW_VERSION_ALREADY:Lcom/motorola/ccc/ota/NewVersionHandler$ReturnCode;

.field public static final enum NEW_VERSION_FAIL:Lcom/motorola/ccc/ota/NewVersionHandler$ReturnCode;

.field public static final enum NEW_VERSION_FAIL_BOOTLOADER_UNLOCKED:Lcom/motorola/ccc/ota/NewVersionHandler$ReturnCode;

.field public static final enum NEW_VERSION_FAIL_DEVICE_CORRUPTED:Lcom/motorola/ccc/ota/NewVersionHandler$ReturnCode;

.field public static final enum NEW_VERSION_FAIL_ROOTED:Lcom/motorola/ccc/ota/NewVersionHandler$ReturnCode;

.field public static final enum NEW_VERSION_INVALID:Lcom/motorola/ccc/ota/NewVersionHandler$ReturnCode;

.field public static final enum NEW_VERSION_OK:Lcom/motorola/ccc/ota/NewVersionHandler$ReturnCode;

.field public static final enum NEW_VERSION_VERITY_DISABLED:Lcom/motorola/ccc/ota/NewVersionHandler$ReturnCode;

.field public static final enum UPDATE_BLOCKED_FREEZE_PERIOD:Lcom/motorola/ccc/ota/NewVersionHandler$ReturnCode;

.field public static final enum UPDATE_DISABLED_BY_MOTO_POLICY_MNGR:Lcom/motorola/ccc/ota/NewVersionHandler$ReturnCode;

.field public static final enum UPDATE_DISABLED_BY_POLICY_MNGR:Lcom/motorola/ccc/ota/NewVersionHandler$ReturnCode;

.field public static final enum VAB_VALIDATION_PKG_FOUND:Lcom/motorola/ccc/ota/NewVersionHandler$ReturnCode;

.field public static final enum VU_WIFI_ONLY_PACKAGE_WIFI_NOT_AVAILABLE:Lcom/motorola/ccc/ota/NewVersionHandler$ReturnCode;


# direct methods
.method private static synthetic $values()[Lcom/motorola/ccc/ota/NewVersionHandler$ReturnCode;
    .locals 13

    sget-object v0, Lcom/motorola/ccc/ota/NewVersionHandler$ReturnCode;->NEW_VERSION_OK:Lcom/motorola/ccc/ota/NewVersionHandler$ReturnCode;

    sget-object v1, Lcom/motorola/ccc/ota/NewVersionHandler$ReturnCode;->NEW_VERSION_FAIL:Lcom/motorola/ccc/ota/NewVersionHandler$ReturnCode;

    sget-object v2, Lcom/motorola/ccc/ota/NewVersionHandler$ReturnCode;->NEW_VERSION_ALREADY:Lcom/motorola/ccc/ota/NewVersionHandler$ReturnCode;

    sget-object v3, Lcom/motorola/ccc/ota/NewVersionHandler$ReturnCode;->NEW_VERSION_INVALID:Lcom/motorola/ccc/ota/NewVersionHandler$ReturnCode;

    sget-object v4, Lcom/motorola/ccc/ota/NewVersionHandler$ReturnCode;->NEW_VERSION_FAIL_ROOTED:Lcom/motorola/ccc/ota/NewVersionHandler$ReturnCode;

    sget-object v5, Lcom/motorola/ccc/ota/NewVersionHandler$ReturnCode;->NEW_VERSION_FAIL_BOOTLOADER_UNLOCKED:Lcom/motorola/ccc/ota/NewVersionHandler$ReturnCode;

    sget-object v6, Lcom/motorola/ccc/ota/NewVersionHandler$ReturnCode;->NEW_VERSION_VERITY_DISABLED:Lcom/motorola/ccc/ota/NewVersionHandler$ReturnCode;

    sget-object v7, Lcom/motorola/ccc/ota/NewVersionHandler$ReturnCode;->NEW_VERSION_FAIL_DEVICE_CORRUPTED:Lcom/motorola/ccc/ota/NewVersionHandler$ReturnCode;

    sget-object v8, Lcom/motorola/ccc/ota/NewVersionHandler$ReturnCode;->VAB_VALIDATION_PKG_FOUND:Lcom/motorola/ccc/ota/NewVersionHandler$ReturnCode;

    sget-object v9, Lcom/motorola/ccc/ota/NewVersionHandler$ReturnCode;->UPDATE_DISABLED_BY_POLICY_MNGR:Lcom/motorola/ccc/ota/NewVersionHandler$ReturnCode;

    sget-object v10, Lcom/motorola/ccc/ota/NewVersionHandler$ReturnCode;->UPDATE_DISABLED_BY_MOTO_POLICY_MNGR:Lcom/motorola/ccc/ota/NewVersionHandler$ReturnCode;

    sget-object v11, Lcom/motorola/ccc/ota/NewVersionHandler$ReturnCode;->UPDATE_BLOCKED_FREEZE_PERIOD:Lcom/motorola/ccc/ota/NewVersionHandler$ReturnCode;

    sget-object v12, Lcom/motorola/ccc/ota/NewVersionHandler$ReturnCode;->VU_WIFI_ONLY_PACKAGE_WIFI_NOT_AVAILABLE:Lcom/motorola/ccc/ota/NewVersionHandler$ReturnCode;

    filled-new-array/range {v0 .. v12}, [Lcom/motorola/ccc/ota/NewVersionHandler$ReturnCode;

    move-result-object v0

    return-object v0
.end method

.method static constructor <clinit>()V
    .locals 3

    new-instance v0, Lcom/motorola/ccc/ota/NewVersionHandler$ReturnCode;

    const-string v1, "NEW_VERSION_OK"

    const/4 v2, 0x0

    invoke-direct {v0, v1, v2}, Lcom/motorola/ccc/ota/NewVersionHandler$ReturnCode;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/motorola/ccc/ota/NewVersionHandler$ReturnCode;->NEW_VERSION_OK:Lcom/motorola/ccc/ota/NewVersionHandler$ReturnCode;

    new-instance v0, Lcom/motorola/ccc/ota/NewVersionHandler$ReturnCode;

    const-string v1, "NEW_VERSION_FAIL"

    const/4 v2, 0x1

    invoke-direct {v0, v1, v2}, Lcom/motorola/ccc/ota/NewVersionHandler$ReturnCode;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/motorola/ccc/ota/NewVersionHandler$ReturnCode;->NEW_VERSION_FAIL:Lcom/motorola/ccc/ota/NewVersionHandler$ReturnCode;

    new-instance v0, Lcom/motorola/ccc/ota/NewVersionHandler$ReturnCode;

    const-string v1, "NEW_VERSION_ALREADY"

    const/4 v2, 0x2

    invoke-direct {v0, v1, v2}, Lcom/motorola/ccc/ota/NewVersionHandler$ReturnCode;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/motorola/ccc/ota/NewVersionHandler$ReturnCode;->NEW_VERSION_ALREADY:Lcom/motorola/ccc/ota/NewVersionHandler$ReturnCode;

    new-instance v0, Lcom/motorola/ccc/ota/NewVersionHandler$ReturnCode;

    const-string v1, "NEW_VERSION_INVALID"

    const/4 v2, 0x3

    invoke-direct {v0, v1, v2}, Lcom/motorola/ccc/ota/NewVersionHandler$ReturnCode;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/motorola/ccc/ota/NewVersionHandler$ReturnCode;->NEW_VERSION_INVALID:Lcom/motorola/ccc/ota/NewVersionHandler$ReturnCode;

    new-instance v0, Lcom/motorola/ccc/ota/NewVersionHandler$ReturnCode;

    const-string v1, "NEW_VERSION_FAIL_ROOTED"

    const/4 v2, 0x4

    invoke-direct {v0, v1, v2}, Lcom/motorola/ccc/ota/NewVersionHandler$ReturnCode;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/motorola/ccc/ota/NewVersionHandler$ReturnCode;->NEW_VERSION_FAIL_ROOTED:Lcom/motorola/ccc/ota/NewVersionHandler$ReturnCode;

    new-instance v0, Lcom/motorola/ccc/ota/NewVersionHandler$ReturnCode;

    const-string v1, "NEW_VERSION_FAIL_BOOTLOADER_UNLOCKED"

    const/4 v2, 0x5

    invoke-direct {v0, v1, v2}, Lcom/motorola/ccc/ota/NewVersionHandler$ReturnCode;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/motorola/ccc/ota/NewVersionHandler$ReturnCode;->NEW_VERSION_FAIL_BOOTLOADER_UNLOCKED:Lcom/motorola/ccc/ota/NewVersionHandler$ReturnCode;

    new-instance v0, Lcom/motorola/ccc/ota/NewVersionHandler$ReturnCode;

    const-string v1, "NEW_VERSION_VERITY_DISABLED"

    const/4 v2, 0x6

    invoke-direct {v0, v1, v2}, Lcom/motorola/ccc/ota/NewVersionHandler$ReturnCode;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/motorola/ccc/ota/NewVersionHandler$ReturnCode;->NEW_VERSION_VERITY_DISABLED:Lcom/motorola/ccc/ota/NewVersionHandler$ReturnCode;

    new-instance v0, Lcom/motorola/ccc/ota/NewVersionHandler$ReturnCode;

    const-string v1, "NEW_VERSION_FAIL_DEVICE_CORRUPTED"

    const/4 v2, 0x7

    invoke-direct {v0, v1, v2}, Lcom/motorola/ccc/ota/NewVersionHandler$ReturnCode;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/motorola/ccc/ota/NewVersionHandler$ReturnCode;->NEW_VERSION_FAIL_DEVICE_CORRUPTED:Lcom/motorola/ccc/ota/NewVersionHandler$ReturnCode;

    new-instance v0, Lcom/motorola/ccc/ota/NewVersionHandler$ReturnCode;

    const-string v1, "VAB_VALIDATION_PKG_FOUND"

    const/16 v2, 0x8

    invoke-direct {v0, v1, v2}, Lcom/motorola/ccc/ota/NewVersionHandler$ReturnCode;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/motorola/ccc/ota/NewVersionHandler$ReturnCode;->VAB_VALIDATION_PKG_FOUND:Lcom/motorola/ccc/ota/NewVersionHandler$ReturnCode;

    new-instance v0, Lcom/motorola/ccc/ota/NewVersionHandler$ReturnCode;

    const-string v1, "UPDATE_DISABLED_BY_POLICY_MNGR"

    const/16 v2, 0x9

    invoke-direct {v0, v1, v2}, Lcom/motorola/ccc/ota/NewVersionHandler$ReturnCode;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/motorola/ccc/ota/NewVersionHandler$ReturnCode;->UPDATE_DISABLED_BY_POLICY_MNGR:Lcom/motorola/ccc/ota/NewVersionHandler$ReturnCode;

    new-instance v0, Lcom/motorola/ccc/ota/NewVersionHandler$ReturnCode;

    const-string v1, "UPDATE_DISABLED_BY_MOTO_POLICY_MNGR"

    const/16 v2, 0xa

    invoke-direct {v0, v1, v2}, Lcom/motorola/ccc/ota/NewVersionHandler$ReturnCode;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/motorola/ccc/ota/NewVersionHandler$ReturnCode;->UPDATE_DISABLED_BY_MOTO_POLICY_MNGR:Lcom/motorola/ccc/ota/NewVersionHandler$ReturnCode;

    new-instance v0, Lcom/motorola/ccc/ota/NewVersionHandler$ReturnCode;

    const-string v1, "UPDATE_BLOCKED_FREEZE_PERIOD"

    const/16 v2, 0xb

    invoke-direct {v0, v1, v2}, Lcom/motorola/ccc/ota/NewVersionHandler$ReturnCode;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/motorola/ccc/ota/NewVersionHandler$ReturnCode;->UPDATE_BLOCKED_FREEZE_PERIOD:Lcom/motorola/ccc/ota/NewVersionHandler$ReturnCode;

    new-instance v0, Lcom/motorola/ccc/ota/NewVersionHandler$ReturnCode;

    const-string v1, "VU_WIFI_ONLY_PACKAGE_WIFI_NOT_AVAILABLE"

    const/16 v2, 0xc

    invoke-direct {v0, v1, v2}, Lcom/motorola/ccc/ota/NewVersionHandler$ReturnCode;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/motorola/ccc/ota/NewVersionHandler$ReturnCode;->VU_WIFI_ONLY_PACKAGE_WIFI_NOT_AVAILABLE:Lcom/motorola/ccc/ota/NewVersionHandler$ReturnCode;

    invoke-static {}, Lcom/motorola/ccc/ota/NewVersionHandler$ReturnCode;->$values()[Lcom/motorola/ccc/ota/NewVersionHandler$ReturnCode;

    move-result-object v0

    sput-object v0, Lcom/motorola/ccc/ota/NewVersionHandler$ReturnCode;->$VALUES:[Lcom/motorola/ccc/ota/NewVersionHandler$ReturnCode;

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

.method public static valueOf(Ljava/lang/String;)Lcom/motorola/ccc/ota/NewVersionHandler$ReturnCode;
    .locals 1

    const-class v0, Lcom/motorola/ccc/ota/NewVersionHandler$ReturnCode;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object p0

    check-cast p0, Lcom/motorola/ccc/ota/NewVersionHandler$ReturnCode;

    return-object p0
.end method

.method public static values()[Lcom/motorola/ccc/ota/NewVersionHandler$ReturnCode;
    .locals 1

    sget-object v0, Lcom/motorola/ccc/ota/NewVersionHandler$ReturnCode;->$VALUES:[Lcom/motorola/ccc/ota/NewVersionHandler$ReturnCode;

    invoke-virtual {v0}, [Lcom/motorola/ccc/ota/NewVersionHandler$ReturnCode;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lcom/motorola/ccc/ota/NewVersionHandler$ReturnCode;

    return-object v0
.end method
