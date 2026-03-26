.class public final enum Lcom/motorola/otalib/main/PublicUtilityMethods$TRIGGER_BY;
.super Ljava/lang/Enum;
.source "PublicUtilityMethods.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/motorola/otalib/main/PublicUtilityMethods;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4019
    name = "TRIGGER_BY"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum<",
        "Lcom/motorola/otalib/main/PublicUtilityMethods$TRIGGER_BY;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcom/motorola/otalib/main/PublicUtilityMethods$TRIGGER_BY;

.field public static final enum pairing:Lcom/motorola/otalib/main/PublicUtilityMethods$TRIGGER_BY;

.field public static final enum polling:Lcom/motorola/otalib/main/PublicUtilityMethods$TRIGGER_BY;

.field public static final enum setup:Lcom/motorola/otalib/main/PublicUtilityMethods$TRIGGER_BY;

.field public static final enum user:Lcom/motorola/otalib/main/PublicUtilityMethods$TRIGGER_BY;


# direct methods
.method private static synthetic $values()[Lcom/motorola/otalib/main/PublicUtilityMethods$TRIGGER_BY;
    .locals 4

    sget-object v0, Lcom/motorola/otalib/main/PublicUtilityMethods$TRIGGER_BY;->polling:Lcom/motorola/otalib/main/PublicUtilityMethods$TRIGGER_BY;

    sget-object v1, Lcom/motorola/otalib/main/PublicUtilityMethods$TRIGGER_BY;->user:Lcom/motorola/otalib/main/PublicUtilityMethods$TRIGGER_BY;

    sget-object v2, Lcom/motorola/otalib/main/PublicUtilityMethods$TRIGGER_BY;->pairing:Lcom/motorola/otalib/main/PublicUtilityMethods$TRIGGER_BY;

    sget-object v3, Lcom/motorola/otalib/main/PublicUtilityMethods$TRIGGER_BY;->setup:Lcom/motorola/otalib/main/PublicUtilityMethods$TRIGGER_BY;

    filled-new-array {v0, v1, v2, v3}, [Lcom/motorola/otalib/main/PublicUtilityMethods$TRIGGER_BY;

    move-result-object v0

    return-object v0
.end method

.method static constructor <clinit>()V
    .locals 3

    new-instance v0, Lcom/motorola/otalib/main/PublicUtilityMethods$TRIGGER_BY;

    const-string v1, "polling"

    const/4 v2, 0x0

    invoke-direct {v0, v1, v2}, Lcom/motorola/otalib/main/PublicUtilityMethods$TRIGGER_BY;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/motorola/otalib/main/PublicUtilityMethods$TRIGGER_BY;->polling:Lcom/motorola/otalib/main/PublicUtilityMethods$TRIGGER_BY;

    new-instance v0, Lcom/motorola/otalib/main/PublicUtilityMethods$TRIGGER_BY;

    const-string v1, "user"

    const/4 v2, 0x1

    invoke-direct {v0, v1, v2}, Lcom/motorola/otalib/main/PublicUtilityMethods$TRIGGER_BY;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/motorola/otalib/main/PublicUtilityMethods$TRIGGER_BY;->user:Lcom/motorola/otalib/main/PublicUtilityMethods$TRIGGER_BY;

    new-instance v0, Lcom/motorola/otalib/main/PublicUtilityMethods$TRIGGER_BY;

    const-string v1, "pairing"

    const/4 v2, 0x2

    invoke-direct {v0, v1, v2}, Lcom/motorola/otalib/main/PublicUtilityMethods$TRIGGER_BY;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/motorola/otalib/main/PublicUtilityMethods$TRIGGER_BY;->pairing:Lcom/motorola/otalib/main/PublicUtilityMethods$TRIGGER_BY;

    new-instance v0, Lcom/motorola/otalib/main/PublicUtilityMethods$TRIGGER_BY;

    const-string v1, "setup"

    const/4 v2, 0x3

    invoke-direct {v0, v1, v2}, Lcom/motorola/otalib/main/PublicUtilityMethods$TRIGGER_BY;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/motorola/otalib/main/PublicUtilityMethods$TRIGGER_BY;->setup:Lcom/motorola/otalib/main/PublicUtilityMethods$TRIGGER_BY;

    invoke-static {}, Lcom/motorola/otalib/main/PublicUtilityMethods$TRIGGER_BY;->$values()[Lcom/motorola/otalib/main/PublicUtilityMethods$TRIGGER_BY;

    move-result-object v0

    sput-object v0, Lcom/motorola/otalib/main/PublicUtilityMethods$TRIGGER_BY;->$VALUES:[Lcom/motorola/otalib/main/PublicUtilityMethods$TRIGGER_BY;

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

.method public static valueOf(Ljava/lang/String;)Lcom/motorola/otalib/main/PublicUtilityMethods$TRIGGER_BY;
    .locals 1

    const-class v0, Lcom/motorola/otalib/main/PublicUtilityMethods$TRIGGER_BY;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object p0

    check-cast p0, Lcom/motorola/otalib/main/PublicUtilityMethods$TRIGGER_BY;

    return-object p0
.end method

.method public static values()[Lcom/motorola/otalib/main/PublicUtilityMethods$TRIGGER_BY;
    .locals 1

    sget-object v0, Lcom/motorola/otalib/main/PublicUtilityMethods$TRIGGER_BY;->$VALUES:[Lcom/motorola/otalib/main/PublicUtilityMethods$TRIGGER_BY;

    invoke-virtual {v0}, [Lcom/motorola/otalib/main/PublicUtilityMethods$TRIGGER_BY;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lcom/motorola/otalib/main/PublicUtilityMethods$TRIGGER_BY;

    return-object v0
.end method
