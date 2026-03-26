.class final enum Lcom/motorola/ccc/ota/CusPolicy$ConnectionChoice;
.super Ljava/lang/Enum;
.source "CusPolicy.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/motorola/ccc/ota/CusPolicy;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4018
    name = "ConnectionChoice"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum<",
        "Lcom/motorola/ccc/ota/CusPolicy$ConnectionChoice;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcom/motorola/ccc/ota/CusPolicy$ConnectionChoice;

.field public static final enum WIFI:Lcom/motorola/ccc/ota/CusPolicy$ConnectionChoice;


# direct methods
.method private static synthetic $values()[Lcom/motorola/ccc/ota/CusPolicy$ConnectionChoice;
    .locals 1

    sget-object v0, Lcom/motorola/ccc/ota/CusPolicy$ConnectionChoice;->WIFI:Lcom/motorola/ccc/ota/CusPolicy$ConnectionChoice;

    filled-new-array {v0}, [Lcom/motorola/ccc/ota/CusPolicy$ConnectionChoice;

    move-result-object v0

    return-object v0
.end method

.method static constructor <clinit>()V
    .locals 3

    new-instance v0, Lcom/motorola/ccc/ota/CusPolicy$ConnectionChoice;

    const-string v1, "WIFI"

    const/4 v2, 0x0

    invoke-direct {v0, v1, v2}, Lcom/motorola/ccc/ota/CusPolicy$ConnectionChoice;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/motorola/ccc/ota/CusPolicy$ConnectionChoice;->WIFI:Lcom/motorola/ccc/ota/CusPolicy$ConnectionChoice;

    invoke-static {}, Lcom/motorola/ccc/ota/CusPolicy$ConnectionChoice;->$values()[Lcom/motorola/ccc/ota/CusPolicy$ConnectionChoice;

    move-result-object v0

    sput-object v0, Lcom/motorola/ccc/ota/CusPolicy$ConnectionChoice;->$VALUES:[Lcom/motorola/ccc/ota/CusPolicy$ConnectionChoice;

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

.method public static valueOf(Ljava/lang/String;)Lcom/motorola/ccc/ota/CusPolicy$ConnectionChoice;
    .locals 1

    const-class v0, Lcom/motorola/ccc/ota/CusPolicy$ConnectionChoice;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object p0

    check-cast p0, Lcom/motorola/ccc/ota/CusPolicy$ConnectionChoice;

    return-object p0
.end method

.method public static values()[Lcom/motorola/ccc/ota/CusPolicy$ConnectionChoice;
    .locals 1

    sget-object v0, Lcom/motorola/ccc/ota/CusPolicy$ConnectionChoice;->$VALUES:[Lcom/motorola/ccc/ota/CusPolicy$ConnectionChoice;

    invoke-virtual {v0}, [Lcom/motorola/ccc/ota/CusPolicy$ConnectionChoice;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lcom/motorola/ccc/ota/CusPolicy$ConnectionChoice;

    return-object v0
.end method
