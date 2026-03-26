.class public final enum Lcom/motorola/otalib/main/PublicUtilityMethods$STATUS_CODE;
.super Ljava/lang/Enum;
.source "PublicUtilityMethods.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/motorola/otalib/main/PublicUtilityMethods;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4019
    name = "STATUS_CODE"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum<",
        "Lcom/motorola/otalib/main/PublicUtilityMethods$STATUS_CODE;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcom/motorola/otalib/main/PublicUtilityMethods$STATUS_CODE;

.field public static final enum ERROR_CASE_CLOSED:Lcom/motorola/otalib/main/PublicUtilityMethods$STATUS_CODE;

.field public static final enum ERROR_CORRUPT_FIRMWARE:Lcom/motorola/otalib/main/PublicUtilityMethods$STATUS_CODE;

.field public static final enum ERROR_DEVICE_DISCONNECTED:Lcom/motorola/otalib/main/PublicUtilityMethods$STATUS_CODE;

.field public static final enum ERROR_DEVICE_OUT_OF_RANGE:Lcom/motorola/otalib/main/PublicUtilityMethods$STATUS_CODE;

.field public static final enum ERROR_LOW_BATTERY:Lcom/motorola/otalib/main/PublicUtilityMethods$STATUS_CODE;

.field public static final enum ERROR_OTHER:Lcom/motorola/otalib/main/PublicUtilityMethods$STATUS_CODE;

.field public static final enum ERROR_USER_CANCELLED:Lcom/motorola/otalib/main/PublicUtilityMethods$STATUS_CODE;

.field public static final enum ERROR_VERSION_MISMATCH:Lcom/motorola/otalib/main/PublicUtilityMethods$STATUS_CODE;

.field public static final enum SUCCESS:Lcom/motorola/otalib/main/PublicUtilityMethods$STATUS_CODE;


# direct methods
.method private static synthetic $values()[Lcom/motorola/otalib/main/PublicUtilityMethods$STATUS_CODE;
    .locals 9

    sget-object v0, Lcom/motorola/otalib/main/PublicUtilityMethods$STATUS_CODE;->ERROR_LOW_BATTERY:Lcom/motorola/otalib/main/PublicUtilityMethods$STATUS_CODE;

    sget-object v1, Lcom/motorola/otalib/main/PublicUtilityMethods$STATUS_CODE;->ERROR_DEVICE_OUT_OF_RANGE:Lcom/motorola/otalib/main/PublicUtilityMethods$STATUS_CODE;

    sget-object v2, Lcom/motorola/otalib/main/PublicUtilityMethods$STATUS_CODE;->ERROR_DEVICE_DISCONNECTED:Lcom/motorola/otalib/main/PublicUtilityMethods$STATUS_CODE;

    sget-object v3, Lcom/motorola/otalib/main/PublicUtilityMethods$STATUS_CODE;->ERROR_CORRUPT_FIRMWARE:Lcom/motorola/otalib/main/PublicUtilityMethods$STATUS_CODE;

    sget-object v4, Lcom/motorola/otalib/main/PublicUtilityMethods$STATUS_CODE;->ERROR_CASE_CLOSED:Lcom/motorola/otalib/main/PublicUtilityMethods$STATUS_CODE;

    sget-object v5, Lcom/motorola/otalib/main/PublicUtilityMethods$STATUS_CODE;->ERROR_USER_CANCELLED:Lcom/motorola/otalib/main/PublicUtilityMethods$STATUS_CODE;

    sget-object v6, Lcom/motorola/otalib/main/PublicUtilityMethods$STATUS_CODE;->ERROR_VERSION_MISMATCH:Lcom/motorola/otalib/main/PublicUtilityMethods$STATUS_CODE;

    sget-object v7, Lcom/motorola/otalib/main/PublicUtilityMethods$STATUS_CODE;->ERROR_OTHER:Lcom/motorola/otalib/main/PublicUtilityMethods$STATUS_CODE;

    sget-object v8, Lcom/motorola/otalib/main/PublicUtilityMethods$STATUS_CODE;->SUCCESS:Lcom/motorola/otalib/main/PublicUtilityMethods$STATUS_CODE;

    filled-new-array/range {v0 .. v8}, [Lcom/motorola/otalib/main/PublicUtilityMethods$STATUS_CODE;

    move-result-object v0

    return-object v0
.end method

.method static constructor <clinit>()V
    .locals 3

    new-instance v0, Lcom/motorola/otalib/main/PublicUtilityMethods$STATUS_CODE;

    const-string v1, "ERROR_LOW_BATTERY"

    const/4 v2, 0x0

    invoke-direct {v0, v1, v2}, Lcom/motorola/otalib/main/PublicUtilityMethods$STATUS_CODE;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/motorola/otalib/main/PublicUtilityMethods$STATUS_CODE;->ERROR_LOW_BATTERY:Lcom/motorola/otalib/main/PublicUtilityMethods$STATUS_CODE;

    new-instance v0, Lcom/motorola/otalib/main/PublicUtilityMethods$STATUS_CODE;

    const-string v1, "ERROR_DEVICE_OUT_OF_RANGE"

    const/4 v2, 0x1

    invoke-direct {v0, v1, v2}, Lcom/motorola/otalib/main/PublicUtilityMethods$STATUS_CODE;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/motorola/otalib/main/PublicUtilityMethods$STATUS_CODE;->ERROR_DEVICE_OUT_OF_RANGE:Lcom/motorola/otalib/main/PublicUtilityMethods$STATUS_CODE;

    new-instance v0, Lcom/motorola/otalib/main/PublicUtilityMethods$STATUS_CODE;

    const-string v1, "ERROR_DEVICE_DISCONNECTED"

    const/4 v2, 0x2

    invoke-direct {v0, v1, v2}, Lcom/motorola/otalib/main/PublicUtilityMethods$STATUS_CODE;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/motorola/otalib/main/PublicUtilityMethods$STATUS_CODE;->ERROR_DEVICE_DISCONNECTED:Lcom/motorola/otalib/main/PublicUtilityMethods$STATUS_CODE;

    new-instance v0, Lcom/motorola/otalib/main/PublicUtilityMethods$STATUS_CODE;

    const-string v1, "ERROR_CORRUPT_FIRMWARE"

    const/4 v2, 0x3

    invoke-direct {v0, v1, v2}, Lcom/motorola/otalib/main/PublicUtilityMethods$STATUS_CODE;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/motorola/otalib/main/PublicUtilityMethods$STATUS_CODE;->ERROR_CORRUPT_FIRMWARE:Lcom/motorola/otalib/main/PublicUtilityMethods$STATUS_CODE;

    new-instance v0, Lcom/motorola/otalib/main/PublicUtilityMethods$STATUS_CODE;

    const-string v1, "ERROR_CASE_CLOSED"

    const/4 v2, 0x4

    invoke-direct {v0, v1, v2}, Lcom/motorola/otalib/main/PublicUtilityMethods$STATUS_CODE;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/motorola/otalib/main/PublicUtilityMethods$STATUS_CODE;->ERROR_CASE_CLOSED:Lcom/motorola/otalib/main/PublicUtilityMethods$STATUS_CODE;

    new-instance v0, Lcom/motorola/otalib/main/PublicUtilityMethods$STATUS_CODE;

    const-string v1, "ERROR_USER_CANCELLED"

    const/4 v2, 0x5

    invoke-direct {v0, v1, v2}, Lcom/motorola/otalib/main/PublicUtilityMethods$STATUS_CODE;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/motorola/otalib/main/PublicUtilityMethods$STATUS_CODE;->ERROR_USER_CANCELLED:Lcom/motorola/otalib/main/PublicUtilityMethods$STATUS_CODE;

    new-instance v0, Lcom/motorola/otalib/main/PublicUtilityMethods$STATUS_CODE;

    const-string v1, "ERROR_VERSION_MISMATCH"

    const/4 v2, 0x6

    invoke-direct {v0, v1, v2}, Lcom/motorola/otalib/main/PublicUtilityMethods$STATUS_CODE;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/motorola/otalib/main/PublicUtilityMethods$STATUS_CODE;->ERROR_VERSION_MISMATCH:Lcom/motorola/otalib/main/PublicUtilityMethods$STATUS_CODE;

    new-instance v0, Lcom/motorola/otalib/main/PublicUtilityMethods$STATUS_CODE;

    const-string v1, "ERROR_OTHER"

    const/4 v2, 0x7

    invoke-direct {v0, v1, v2}, Lcom/motorola/otalib/main/PublicUtilityMethods$STATUS_CODE;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/motorola/otalib/main/PublicUtilityMethods$STATUS_CODE;->ERROR_OTHER:Lcom/motorola/otalib/main/PublicUtilityMethods$STATUS_CODE;

    new-instance v0, Lcom/motorola/otalib/main/PublicUtilityMethods$STATUS_CODE;

    const-string v1, "SUCCESS"

    const/16 v2, 0x8

    invoke-direct {v0, v1, v2}, Lcom/motorola/otalib/main/PublicUtilityMethods$STATUS_CODE;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/motorola/otalib/main/PublicUtilityMethods$STATUS_CODE;->SUCCESS:Lcom/motorola/otalib/main/PublicUtilityMethods$STATUS_CODE;

    invoke-static {}, Lcom/motorola/otalib/main/PublicUtilityMethods$STATUS_CODE;->$values()[Lcom/motorola/otalib/main/PublicUtilityMethods$STATUS_CODE;

    move-result-object v0

    sput-object v0, Lcom/motorola/otalib/main/PublicUtilityMethods$STATUS_CODE;->$VALUES:[Lcom/motorola/otalib/main/PublicUtilityMethods$STATUS_CODE;

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

.method public static valueOf(Ljava/lang/String;)Lcom/motorola/otalib/main/PublicUtilityMethods$STATUS_CODE;
    .locals 1

    const-class v0, Lcom/motorola/otalib/main/PublicUtilityMethods$STATUS_CODE;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object p0

    check-cast p0, Lcom/motorola/otalib/main/PublicUtilityMethods$STATUS_CODE;

    return-object p0
.end method

.method public static values()[Lcom/motorola/otalib/main/PublicUtilityMethods$STATUS_CODE;
    .locals 1

    sget-object v0, Lcom/motorola/otalib/main/PublicUtilityMethods$STATUS_CODE;->$VALUES:[Lcom/motorola/otalib/main/PublicUtilityMethods$STATUS_CODE;

    invoke-virtual {v0}, [Lcom/motorola/otalib/main/PublicUtilityMethods$STATUS_CODE;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lcom/motorola/otalib/main/PublicUtilityMethods$STATUS_CODE;

    return-object v0
.end method
