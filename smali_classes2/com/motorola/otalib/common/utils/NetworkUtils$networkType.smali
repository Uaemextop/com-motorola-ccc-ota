.class public final enum Lcom/motorola/otalib/common/utils/NetworkUtils$networkType;
.super Ljava/lang/Enum;
.source "NetworkUtils.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/motorola/otalib/common/utils/NetworkUtils;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4019
    name = "networkType"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum<",
        "Lcom/motorola/otalib/common/utils/NetworkUtils$networkType;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcom/motorola/otalib/common/utils/NetworkUtils$networkType;

.field public static final enum CELL3G:Lcom/motorola/otalib/common/utils/NetworkUtils$networkType;

.field public static final enum CELL4G:Lcom/motorola/otalib/common/utils/NetworkUtils$networkType;

.field public static final enum CELL5G:Lcom/motorola/otalib/common/utils/NetworkUtils$networkType;

.field public static final enum CELLULAR:Lcom/motorola/otalib/common/utils/NetworkUtils$networkType;

.field public static final enum ROAMING:Lcom/motorola/otalib/common/utils/NetworkUtils$networkType;

.field public static final enum UNKNOWN:Lcom/motorola/otalib/common/utils/NetworkUtils$networkType;

.field public static final enum WIFI:Lcom/motorola/otalib/common/utils/NetworkUtils$networkType;


# direct methods
.method private static synthetic $values()[Lcom/motorola/otalib/common/utils/NetworkUtils$networkType;
    .locals 7

    sget-object v0, Lcom/motorola/otalib/common/utils/NetworkUtils$networkType;->WIFI:Lcom/motorola/otalib/common/utils/NetworkUtils$networkType;

    sget-object v1, Lcom/motorola/otalib/common/utils/NetworkUtils$networkType;->CELLULAR:Lcom/motorola/otalib/common/utils/NetworkUtils$networkType;

    sget-object v2, Lcom/motorola/otalib/common/utils/NetworkUtils$networkType;->CELL3G:Lcom/motorola/otalib/common/utils/NetworkUtils$networkType;

    sget-object v3, Lcom/motorola/otalib/common/utils/NetworkUtils$networkType;->CELL4G:Lcom/motorola/otalib/common/utils/NetworkUtils$networkType;

    sget-object v4, Lcom/motorola/otalib/common/utils/NetworkUtils$networkType;->CELL5G:Lcom/motorola/otalib/common/utils/NetworkUtils$networkType;

    sget-object v5, Lcom/motorola/otalib/common/utils/NetworkUtils$networkType;->ROAMING:Lcom/motorola/otalib/common/utils/NetworkUtils$networkType;

    sget-object v6, Lcom/motorola/otalib/common/utils/NetworkUtils$networkType;->UNKNOWN:Lcom/motorola/otalib/common/utils/NetworkUtils$networkType;

    filled-new-array/range {v0 .. v6}, [Lcom/motorola/otalib/common/utils/NetworkUtils$networkType;

    move-result-object v0

    return-object v0
.end method

.method static constructor <clinit>()V
    .locals 3

    new-instance v0, Lcom/motorola/otalib/common/utils/NetworkUtils$networkType;

    const-string v1, "WIFI"

    const/4 v2, 0x0

    invoke-direct {v0, v1, v2}, Lcom/motorola/otalib/common/utils/NetworkUtils$networkType;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/motorola/otalib/common/utils/NetworkUtils$networkType;->WIFI:Lcom/motorola/otalib/common/utils/NetworkUtils$networkType;

    new-instance v0, Lcom/motorola/otalib/common/utils/NetworkUtils$networkType;

    const-string v1, "CELLULAR"

    const/4 v2, 0x1

    invoke-direct {v0, v1, v2}, Lcom/motorola/otalib/common/utils/NetworkUtils$networkType;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/motorola/otalib/common/utils/NetworkUtils$networkType;->CELLULAR:Lcom/motorola/otalib/common/utils/NetworkUtils$networkType;

    new-instance v0, Lcom/motorola/otalib/common/utils/NetworkUtils$networkType;

    const-string v1, "CELL3G"

    const/4 v2, 0x2

    invoke-direct {v0, v1, v2}, Lcom/motorola/otalib/common/utils/NetworkUtils$networkType;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/motorola/otalib/common/utils/NetworkUtils$networkType;->CELL3G:Lcom/motorola/otalib/common/utils/NetworkUtils$networkType;

    new-instance v0, Lcom/motorola/otalib/common/utils/NetworkUtils$networkType;

    const-string v1, "CELL4G"

    const/4 v2, 0x3

    invoke-direct {v0, v1, v2}, Lcom/motorola/otalib/common/utils/NetworkUtils$networkType;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/motorola/otalib/common/utils/NetworkUtils$networkType;->CELL4G:Lcom/motorola/otalib/common/utils/NetworkUtils$networkType;

    new-instance v0, Lcom/motorola/otalib/common/utils/NetworkUtils$networkType;

    const-string v1, "CELL5G"

    const/4 v2, 0x4

    invoke-direct {v0, v1, v2}, Lcom/motorola/otalib/common/utils/NetworkUtils$networkType;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/motorola/otalib/common/utils/NetworkUtils$networkType;->CELL5G:Lcom/motorola/otalib/common/utils/NetworkUtils$networkType;

    new-instance v0, Lcom/motorola/otalib/common/utils/NetworkUtils$networkType;

    const-string v1, "ROAMING"

    const/4 v2, 0x5

    invoke-direct {v0, v1, v2}, Lcom/motorola/otalib/common/utils/NetworkUtils$networkType;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/motorola/otalib/common/utils/NetworkUtils$networkType;->ROAMING:Lcom/motorola/otalib/common/utils/NetworkUtils$networkType;

    new-instance v0, Lcom/motorola/otalib/common/utils/NetworkUtils$networkType;

    const-string v1, "UNKNOWN"

    const/4 v2, 0x6

    invoke-direct {v0, v1, v2}, Lcom/motorola/otalib/common/utils/NetworkUtils$networkType;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/motorola/otalib/common/utils/NetworkUtils$networkType;->UNKNOWN:Lcom/motorola/otalib/common/utils/NetworkUtils$networkType;

    invoke-static {}, Lcom/motorola/otalib/common/utils/NetworkUtils$networkType;->$values()[Lcom/motorola/otalib/common/utils/NetworkUtils$networkType;

    move-result-object v0

    sput-object v0, Lcom/motorola/otalib/common/utils/NetworkUtils$networkType;->$VALUES:[Lcom/motorola/otalib/common/utils/NetworkUtils$networkType;

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

.method public static valueOf(Ljava/lang/String;)Lcom/motorola/otalib/common/utils/NetworkUtils$networkType;
    .locals 1

    const-class v0, Lcom/motorola/otalib/common/utils/NetworkUtils$networkType;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object p0

    check-cast p0, Lcom/motorola/otalib/common/utils/NetworkUtils$networkType;

    return-object p0
.end method

.method public static values()[Lcom/motorola/otalib/common/utils/NetworkUtils$networkType;
    .locals 1

    sget-object v0, Lcom/motorola/otalib/common/utils/NetworkUtils$networkType;->$VALUES:[Lcom/motorola/otalib/common/utils/NetworkUtils$networkType;

    invoke-virtual {v0}, [Lcom/motorola/otalib/common/utils/NetworkUtils$networkType;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lcom/motorola/otalib/common/utils/NetworkUtils$networkType;

    return-object v0
.end method
