.class public final enum Lcom/motorola/ccc/ota/utils/FileUtils$ReturnCode;
.super Ljava/lang/Enum;
.source "FileUtils.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/motorola/ccc/ota/utils/FileUtils;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4019
    name = "ReturnCode"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum<",
        "Lcom/motorola/ccc/ota/utils/FileUtils$ReturnCode;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcom/motorola/ccc/ota/utils/FileUtils$ReturnCode;

.field public static final enum OK:Lcom/motorola/ccc/ota/utils/FileUtils$ReturnCode;

.field public static final enum PACKAGE_PATH_FAIL_CACHE:Lcom/motorola/ccc/ota/utils/FileUtils$ReturnCode;

.field public static final enum PACKAGE_PATH_FAIL_DATA:Lcom/motorola/ccc/ota/utils/FileUtils$ReturnCode;

.field public static final enum PACKAGE_PATH_FAIL_SDCARD:Lcom/motorola/ccc/ota/utils/FileUtils$ReturnCode;


# direct methods
.method private static synthetic $values()[Lcom/motorola/ccc/ota/utils/FileUtils$ReturnCode;
    .locals 4

    sget-object v0, Lcom/motorola/ccc/ota/utils/FileUtils$ReturnCode;->OK:Lcom/motorola/ccc/ota/utils/FileUtils$ReturnCode;

    sget-object v1, Lcom/motorola/ccc/ota/utils/FileUtils$ReturnCode;->PACKAGE_PATH_FAIL_CACHE:Lcom/motorola/ccc/ota/utils/FileUtils$ReturnCode;

    sget-object v2, Lcom/motorola/ccc/ota/utils/FileUtils$ReturnCode;->PACKAGE_PATH_FAIL_DATA:Lcom/motorola/ccc/ota/utils/FileUtils$ReturnCode;

    sget-object v3, Lcom/motorola/ccc/ota/utils/FileUtils$ReturnCode;->PACKAGE_PATH_FAIL_SDCARD:Lcom/motorola/ccc/ota/utils/FileUtils$ReturnCode;

    filled-new-array {v0, v1, v2, v3}, [Lcom/motorola/ccc/ota/utils/FileUtils$ReturnCode;

    move-result-object v0

    return-object v0
.end method

.method static constructor <clinit>()V
    .locals 3

    new-instance v0, Lcom/motorola/ccc/ota/utils/FileUtils$ReturnCode;

    const-string v1, "OK"

    const/4 v2, 0x0

    invoke-direct {v0, v1, v2}, Lcom/motorola/ccc/ota/utils/FileUtils$ReturnCode;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/motorola/ccc/ota/utils/FileUtils$ReturnCode;->OK:Lcom/motorola/ccc/ota/utils/FileUtils$ReturnCode;

    new-instance v0, Lcom/motorola/ccc/ota/utils/FileUtils$ReturnCode;

    const-string v1, "PACKAGE_PATH_FAIL_CACHE"

    const/4 v2, 0x1

    invoke-direct {v0, v1, v2}, Lcom/motorola/ccc/ota/utils/FileUtils$ReturnCode;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/motorola/ccc/ota/utils/FileUtils$ReturnCode;->PACKAGE_PATH_FAIL_CACHE:Lcom/motorola/ccc/ota/utils/FileUtils$ReturnCode;

    new-instance v0, Lcom/motorola/ccc/ota/utils/FileUtils$ReturnCode;

    const-string v1, "PACKAGE_PATH_FAIL_DATA"

    const/4 v2, 0x2

    invoke-direct {v0, v1, v2}, Lcom/motorola/ccc/ota/utils/FileUtils$ReturnCode;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/motorola/ccc/ota/utils/FileUtils$ReturnCode;->PACKAGE_PATH_FAIL_DATA:Lcom/motorola/ccc/ota/utils/FileUtils$ReturnCode;

    new-instance v0, Lcom/motorola/ccc/ota/utils/FileUtils$ReturnCode;

    const-string v1, "PACKAGE_PATH_FAIL_SDCARD"

    const/4 v2, 0x3

    invoke-direct {v0, v1, v2}, Lcom/motorola/ccc/ota/utils/FileUtils$ReturnCode;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/motorola/ccc/ota/utils/FileUtils$ReturnCode;->PACKAGE_PATH_FAIL_SDCARD:Lcom/motorola/ccc/ota/utils/FileUtils$ReturnCode;

    invoke-static {}, Lcom/motorola/ccc/ota/utils/FileUtils$ReturnCode;->$values()[Lcom/motorola/ccc/ota/utils/FileUtils$ReturnCode;

    move-result-object v0

    sput-object v0, Lcom/motorola/ccc/ota/utils/FileUtils$ReturnCode;->$VALUES:[Lcom/motorola/ccc/ota/utils/FileUtils$ReturnCode;

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

.method public static valueOf(Ljava/lang/String;)Lcom/motorola/ccc/ota/utils/FileUtils$ReturnCode;
    .locals 1

    const-class v0, Lcom/motorola/ccc/ota/utils/FileUtils$ReturnCode;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object p0

    check-cast p0, Lcom/motorola/ccc/ota/utils/FileUtils$ReturnCode;

    return-object p0
.end method

.method public static values()[Lcom/motorola/ccc/ota/utils/FileUtils$ReturnCode;
    .locals 1

    sget-object v0, Lcom/motorola/ccc/ota/utils/FileUtils$ReturnCode;->$VALUES:[Lcom/motorola/ccc/ota/utils/FileUtils$ReturnCode;

    invoke-virtual {v0}, [Lcom/motorola/ccc/ota/utils/FileUtils$ReturnCode;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lcom/motorola/ccc/ota/utils/FileUtils$ReturnCode;

    return-object v0
.end method
