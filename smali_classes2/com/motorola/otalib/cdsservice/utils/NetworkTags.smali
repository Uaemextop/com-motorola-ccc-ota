.class public final enum Lcom/motorola/otalib/cdsservice/utils/NetworkTags;
.super Ljava/lang/Enum;
.source "NetworkTags.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum<",
        "Lcom/motorola/otalib/cdsservice/utils/NetworkTags;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcom/motorola/otalib/cdsservice/utils/NetworkTags;

.field public static final enum CELL:Lcom/motorola/otalib/cdsservice/utils/NetworkTags;

.field public static final enum USEADMINAPN:Lcom/motorola/otalib/cdsservice/utils/NetworkTags;

.field public static final enum WIFI:Lcom/motorola/otalib/cdsservice/utils/NetworkTags;


# direct methods
.method private static synthetic $values()[Lcom/motorola/otalib/cdsservice/utils/NetworkTags;
    .locals 3

    sget-object v0, Lcom/motorola/otalib/cdsservice/utils/NetworkTags;->WIFI:Lcom/motorola/otalib/cdsservice/utils/NetworkTags;

    sget-object v1, Lcom/motorola/otalib/cdsservice/utils/NetworkTags;->CELL:Lcom/motorola/otalib/cdsservice/utils/NetworkTags;

    sget-object v2, Lcom/motorola/otalib/cdsservice/utils/NetworkTags;->USEADMINAPN:Lcom/motorola/otalib/cdsservice/utils/NetworkTags;

    filled-new-array {v0, v1, v2}, [Lcom/motorola/otalib/cdsservice/utils/NetworkTags;

    move-result-object v0

    return-object v0
.end method

.method static constructor <clinit>()V
    .locals 3

    new-instance v0, Lcom/motorola/otalib/cdsservice/utils/NetworkTags;

    const-string v1, "WIFI"

    const/4 v2, 0x0

    invoke-direct {v0, v1, v2}, Lcom/motorola/otalib/cdsservice/utils/NetworkTags;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/motorola/otalib/cdsservice/utils/NetworkTags;->WIFI:Lcom/motorola/otalib/cdsservice/utils/NetworkTags;

    new-instance v0, Lcom/motorola/otalib/cdsservice/utils/NetworkTags;

    const-string v1, "CELL"

    const/4 v2, 0x1

    invoke-direct {v0, v1, v2}, Lcom/motorola/otalib/cdsservice/utils/NetworkTags;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/motorola/otalib/cdsservice/utils/NetworkTags;->CELL:Lcom/motorola/otalib/cdsservice/utils/NetworkTags;

    new-instance v0, Lcom/motorola/otalib/cdsservice/utils/NetworkTags;

    const-string v1, "USEADMINAPN"

    const/4 v2, 0x2

    invoke-direct {v0, v1, v2}, Lcom/motorola/otalib/cdsservice/utils/NetworkTags;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/motorola/otalib/cdsservice/utils/NetworkTags;->USEADMINAPN:Lcom/motorola/otalib/cdsservice/utils/NetworkTags;

    invoke-static {}, Lcom/motorola/otalib/cdsservice/utils/NetworkTags;->$values()[Lcom/motorola/otalib/cdsservice/utils/NetworkTags;

    move-result-object v0

    sput-object v0, Lcom/motorola/otalib/cdsservice/utils/NetworkTags;->$VALUES:[Lcom/motorola/otalib/cdsservice/utils/NetworkTags;

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

.method public static valueOf(Ljava/lang/String;)Lcom/motorola/otalib/cdsservice/utils/NetworkTags;
    .locals 1

    const-class v0, Lcom/motorola/otalib/cdsservice/utils/NetworkTags;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object p0

    check-cast p0, Lcom/motorola/otalib/cdsservice/utils/NetworkTags;

    return-object p0
.end method

.method public static values()[Lcom/motorola/otalib/cdsservice/utils/NetworkTags;
    .locals 1

    sget-object v0, Lcom/motorola/otalib/cdsservice/utils/NetworkTags;->$VALUES:[Lcom/motorola/otalib/cdsservice/utils/NetworkTags;

    invoke-virtual {v0}, [Lcom/motorola/otalib/cdsservice/utils/NetworkTags;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lcom/motorola/otalib/cdsservice/utils/NetworkTags;

    return-object v0
.end method
