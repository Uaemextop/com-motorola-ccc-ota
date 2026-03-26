.class public final enum Lcom/motorola/otalib/common/utils/NetworkType;
.super Ljava/lang/Enum;
.source "NetworkType.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum<",
        "Lcom/motorola/otalib/common/utils/NetworkType;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcom/motorola/otalib/common/utils/NetworkType;

.field public static final enum CDMA:Lcom/motorola/otalib/common/utils/NetworkType;

.field public static final enum EDGE:Lcom/motorola/otalib/common/utils/NetworkType;

.field public static final enum EHRPD:Lcom/motorola/otalib/common/utils/NetworkType;

.field public static final enum EVDO_0:Lcom/motorola/otalib/common/utils/NetworkType;

.field public static final enum EVDO_A:Lcom/motorola/otalib/common/utils/NetworkType;

.field public static final enum EVDO_B:Lcom/motorola/otalib/common/utils/NetworkType;

.field public static final enum GPRS:Lcom/motorola/otalib/common/utils/NetworkType;

.field public static final enum HSDPA:Lcom/motorola/otalib/common/utils/NetworkType;

.field public static final enum HSPA:Lcom/motorola/otalib/common/utils/NetworkType;

.field public static final enum HSPAPLUS:Lcom/motorola/otalib/common/utils/NetworkType;

.field public static final enum IDEN:Lcom/motorola/otalib/common/utils/NetworkType;

.field public static final enum LTE:Lcom/motorola/otalib/common/utils/NetworkType;

.field public static final enum NR:Lcom/motorola/otalib/common/utils/NetworkType;

.field public static final enum OnexRTT:Lcom/motorola/otalib/common/utils/NetworkType;

.field public static final enum UMTS:Lcom/motorola/otalib/common/utils/NetworkType;

.field public static final enum UNKNOWN:Lcom/motorola/otalib/common/utils/NetworkType;


# instance fields
.field private networkType:I


# direct methods
.method private static synthetic $values()[Lcom/motorola/otalib/common/utils/NetworkType;
    .locals 16

    sget-object v0, Lcom/motorola/otalib/common/utils/NetworkType;->UNKNOWN:Lcom/motorola/otalib/common/utils/NetworkType;

    sget-object v1, Lcom/motorola/otalib/common/utils/NetworkType;->GPRS:Lcom/motorola/otalib/common/utils/NetworkType;

    sget-object v2, Lcom/motorola/otalib/common/utils/NetworkType;->EDGE:Lcom/motorola/otalib/common/utils/NetworkType;

    sget-object v3, Lcom/motorola/otalib/common/utils/NetworkType;->UMTS:Lcom/motorola/otalib/common/utils/NetworkType;

    sget-object v4, Lcom/motorola/otalib/common/utils/NetworkType;->CDMA:Lcom/motorola/otalib/common/utils/NetworkType;

    sget-object v5, Lcom/motorola/otalib/common/utils/NetworkType;->EVDO_0:Lcom/motorola/otalib/common/utils/NetworkType;

    sget-object v6, Lcom/motorola/otalib/common/utils/NetworkType;->EVDO_A:Lcom/motorola/otalib/common/utils/NetworkType;

    sget-object v7, Lcom/motorola/otalib/common/utils/NetworkType;->EVDO_B:Lcom/motorola/otalib/common/utils/NetworkType;

    sget-object v8, Lcom/motorola/otalib/common/utils/NetworkType;->OnexRTT:Lcom/motorola/otalib/common/utils/NetworkType;

    sget-object v9, Lcom/motorola/otalib/common/utils/NetworkType;->HSDPA:Lcom/motorola/otalib/common/utils/NetworkType;

    sget-object v10, Lcom/motorola/otalib/common/utils/NetworkType;->HSPA:Lcom/motorola/otalib/common/utils/NetworkType;

    sget-object v11, Lcom/motorola/otalib/common/utils/NetworkType;->IDEN:Lcom/motorola/otalib/common/utils/NetworkType;

    sget-object v12, Lcom/motorola/otalib/common/utils/NetworkType;->LTE:Lcom/motorola/otalib/common/utils/NetworkType;

    sget-object v13, Lcom/motorola/otalib/common/utils/NetworkType;->EHRPD:Lcom/motorola/otalib/common/utils/NetworkType;

    sget-object v14, Lcom/motorola/otalib/common/utils/NetworkType;->HSPAPLUS:Lcom/motorola/otalib/common/utils/NetworkType;

    sget-object v15, Lcom/motorola/otalib/common/utils/NetworkType;->NR:Lcom/motorola/otalib/common/utils/NetworkType;

    filled-new-array/range {v0 .. v15}, [Lcom/motorola/otalib/common/utils/NetworkType;

    move-result-object v0

    return-object v0
.end method

.method static constructor <clinit>()V
    .locals 5

    new-instance v0, Lcom/motorola/otalib/common/utils/NetworkType;

    const-string v1, "UNKNOWN"

    const/4 v2, 0x0

    invoke-direct {v0, v1, v2, v2}, Lcom/motorola/otalib/common/utils/NetworkType;-><init>(Ljava/lang/String;II)V

    sput-object v0, Lcom/motorola/otalib/common/utils/NetworkType;->UNKNOWN:Lcom/motorola/otalib/common/utils/NetworkType;

    new-instance v0, Lcom/motorola/otalib/common/utils/NetworkType;

    const-string v1, "GPRS"

    const/4 v2, 0x1

    invoke-direct {v0, v1, v2, v2}, Lcom/motorola/otalib/common/utils/NetworkType;-><init>(Ljava/lang/String;II)V

    sput-object v0, Lcom/motorola/otalib/common/utils/NetworkType;->GPRS:Lcom/motorola/otalib/common/utils/NetworkType;

    new-instance v0, Lcom/motorola/otalib/common/utils/NetworkType;

    const-string v1, "EDGE"

    const/4 v2, 0x2

    invoke-direct {v0, v1, v2, v2}, Lcom/motorola/otalib/common/utils/NetworkType;-><init>(Ljava/lang/String;II)V

    sput-object v0, Lcom/motorola/otalib/common/utils/NetworkType;->EDGE:Lcom/motorola/otalib/common/utils/NetworkType;

    new-instance v0, Lcom/motorola/otalib/common/utils/NetworkType;

    const-string v1, "UMTS"

    const/4 v2, 0x3

    invoke-direct {v0, v1, v2, v2}, Lcom/motorola/otalib/common/utils/NetworkType;-><init>(Ljava/lang/String;II)V

    sput-object v0, Lcom/motorola/otalib/common/utils/NetworkType;->UMTS:Lcom/motorola/otalib/common/utils/NetworkType;

    new-instance v0, Lcom/motorola/otalib/common/utils/NetworkType;

    const-string v1, "CDMA"

    const/4 v2, 0x4

    invoke-direct {v0, v1, v2, v2}, Lcom/motorola/otalib/common/utils/NetworkType;-><init>(Ljava/lang/String;II)V

    sput-object v0, Lcom/motorola/otalib/common/utils/NetworkType;->CDMA:Lcom/motorola/otalib/common/utils/NetworkType;

    new-instance v0, Lcom/motorola/otalib/common/utils/NetworkType;

    const-string v1, "EVDO_0"

    const/4 v2, 0x5

    invoke-direct {v0, v1, v2, v2}, Lcom/motorola/otalib/common/utils/NetworkType;-><init>(Ljava/lang/String;II)V

    sput-object v0, Lcom/motorola/otalib/common/utils/NetworkType;->EVDO_0:Lcom/motorola/otalib/common/utils/NetworkType;

    new-instance v0, Lcom/motorola/otalib/common/utils/NetworkType;

    const-string v1, "EVDO_A"

    const/4 v2, 0x6

    invoke-direct {v0, v1, v2, v2}, Lcom/motorola/otalib/common/utils/NetworkType;-><init>(Ljava/lang/String;II)V

    sput-object v0, Lcom/motorola/otalib/common/utils/NetworkType;->EVDO_A:Lcom/motorola/otalib/common/utils/NetworkType;

    new-instance v0, Lcom/motorola/otalib/common/utils/NetworkType;

    const-string v1, "EVDO_B"

    const/4 v2, 0x7

    const/16 v3, 0xc

    invoke-direct {v0, v1, v2, v3}, Lcom/motorola/otalib/common/utils/NetworkType;-><init>(Ljava/lang/String;II)V

    sput-object v0, Lcom/motorola/otalib/common/utils/NetworkType;->EVDO_B:Lcom/motorola/otalib/common/utils/NetworkType;

    new-instance v0, Lcom/motorola/otalib/common/utils/NetworkType;

    const-string v1, "OnexRTT"

    const/16 v4, 0x8

    invoke-direct {v0, v1, v4, v2}, Lcom/motorola/otalib/common/utils/NetworkType;-><init>(Ljava/lang/String;II)V

    sput-object v0, Lcom/motorola/otalib/common/utils/NetworkType;->OnexRTT:Lcom/motorola/otalib/common/utils/NetworkType;

    new-instance v0, Lcom/motorola/otalib/common/utils/NetworkType;

    const-string v1, "HSDPA"

    const/16 v2, 0x9

    invoke-direct {v0, v1, v2, v4}, Lcom/motorola/otalib/common/utils/NetworkType;-><init>(Ljava/lang/String;II)V

    sput-object v0, Lcom/motorola/otalib/common/utils/NetworkType;->HSDPA:Lcom/motorola/otalib/common/utils/NetworkType;

    new-instance v0, Lcom/motorola/otalib/common/utils/NetworkType;

    const-string v1, "HSPA"

    const/16 v2, 0xa

    invoke-direct {v0, v1, v2, v2}, Lcom/motorola/otalib/common/utils/NetworkType;-><init>(Ljava/lang/String;II)V

    sput-object v0, Lcom/motorola/otalib/common/utils/NetworkType;->HSPA:Lcom/motorola/otalib/common/utils/NetworkType;

    new-instance v0, Lcom/motorola/otalib/common/utils/NetworkType;

    const-string v1, "IDEN"

    const/16 v2, 0xb

    invoke-direct {v0, v1, v2, v2}, Lcom/motorola/otalib/common/utils/NetworkType;-><init>(Ljava/lang/String;II)V

    sput-object v0, Lcom/motorola/otalib/common/utils/NetworkType;->IDEN:Lcom/motorola/otalib/common/utils/NetworkType;

    new-instance v0, Lcom/motorola/otalib/common/utils/NetworkType;

    const-string v1, "LTE"

    const/16 v2, 0xd

    invoke-direct {v0, v1, v3, v2}, Lcom/motorola/otalib/common/utils/NetworkType;-><init>(Ljava/lang/String;II)V

    sput-object v0, Lcom/motorola/otalib/common/utils/NetworkType;->LTE:Lcom/motorola/otalib/common/utils/NetworkType;

    new-instance v0, Lcom/motorola/otalib/common/utils/NetworkType;

    const-string v1, "EHRPD"

    const/16 v3, 0xe

    invoke-direct {v0, v1, v2, v3}, Lcom/motorola/otalib/common/utils/NetworkType;-><init>(Ljava/lang/String;II)V

    sput-object v0, Lcom/motorola/otalib/common/utils/NetworkType;->EHRPD:Lcom/motorola/otalib/common/utils/NetworkType;

    new-instance v0, Lcom/motorola/otalib/common/utils/NetworkType;

    const-string v1, "HSPAPLUS"

    const/16 v2, 0xf

    invoke-direct {v0, v1, v3, v2}, Lcom/motorola/otalib/common/utils/NetworkType;-><init>(Ljava/lang/String;II)V

    sput-object v0, Lcom/motorola/otalib/common/utils/NetworkType;->HSPAPLUS:Lcom/motorola/otalib/common/utils/NetworkType;

    new-instance v0, Lcom/motorola/otalib/common/utils/NetworkType;

    const-string v1, "NR"

    const/16 v3, 0x14

    invoke-direct {v0, v1, v2, v3}, Lcom/motorola/otalib/common/utils/NetworkType;-><init>(Ljava/lang/String;II)V

    sput-object v0, Lcom/motorola/otalib/common/utils/NetworkType;->NR:Lcom/motorola/otalib/common/utils/NetworkType;

    invoke-static {}, Lcom/motorola/otalib/common/utils/NetworkType;->$values()[Lcom/motorola/otalib/common/utils/NetworkType;

    move-result-object v0

    sput-object v0, Lcom/motorola/otalib/common/utils/NetworkType;->$VALUES:[Lcom/motorola/otalib/common/utils/NetworkType;

    return-void
.end method

.method private constructor <init>(Ljava/lang/String;II)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I)V"
        }
    .end annotation

    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    iput p3, p0, Lcom/motorola/otalib/common/utils/NetworkType;->networkType:I

    return-void
.end method

.method public static fromCode(I)Lcom/motorola/otalib/common/utils/NetworkType;
    .locals 5

    invoke-static {}, Lcom/motorola/otalib/common/utils/NetworkType;->values()[Lcom/motorola/otalib/common/utils/NetworkType;

    move-result-object v0

    array-length v1, v0

    const/4 v2, 0x0

    :goto_0
    if-ge v2, v1, :cond_1

    aget-object v3, v0, v2

    iget v4, v3, Lcom/motorola/otalib/common/utils/NetworkType;->networkType:I

    if-ne v4, p0, :cond_0

    return-object v3

    :cond_0
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    :cond_1
    sget-object p0, Lcom/motorola/otalib/common/utils/NetworkType;->UNKNOWN:Lcom/motorola/otalib/common/utils/NetworkType;

    return-object p0
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/motorola/otalib/common/utils/NetworkType;
    .locals 1

    const-class v0, Lcom/motorola/otalib/common/utils/NetworkType;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object p0

    check-cast p0, Lcom/motorola/otalib/common/utils/NetworkType;

    return-object p0
.end method

.method public static values()[Lcom/motorola/otalib/common/utils/NetworkType;
    .locals 1

    sget-object v0, Lcom/motorola/otalib/common/utils/NetworkType;->$VALUES:[Lcom/motorola/otalib/common/utils/NetworkType;

    invoke-virtual {v0}, [Lcom/motorola/otalib/common/utils/NetworkType;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lcom/motorola/otalib/common/utils/NetworkType;

    return-object v0
.end method


# virtual methods
.method public getNetworkTypeInt()I
    .locals 0

    iget p0, p0, Lcom/motorola/otalib/common/utils/NetworkType;->networkType:I

    return p0
.end method
