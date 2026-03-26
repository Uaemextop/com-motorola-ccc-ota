.class final enum Lcom/motorola/ccc/ota/ui/UpdateReceiver$PendingIntentType;
.super Ljava/lang/Enum;
.source "UpdateReceiver.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/motorola/ccc/ota/ui/UpdateReceiver;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x401a
    name = "PendingIntentType"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum<",
        "Lcom/motorola/ccc/ota/ui/UpdateReceiver$PendingIntentType;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcom/motorola/ccc/ota/ui/UpdateReceiver$PendingIntentType;

.field public static final enum ACTIVITY:Lcom/motorola/ccc/ota/ui/UpdateReceiver$PendingIntentType;

.field public static final enum BROADCAST:Lcom/motorola/ccc/ota/ui/UpdateReceiver$PendingIntentType;

.field public static final enum SERVICE:Lcom/motorola/ccc/ota/ui/UpdateReceiver$PendingIntentType;


# direct methods
.method private static synthetic $values()[Lcom/motorola/ccc/ota/ui/UpdateReceiver$PendingIntentType;
    .locals 3

    sget-object v0, Lcom/motorola/ccc/ota/ui/UpdateReceiver$PendingIntentType;->ACTIVITY:Lcom/motorola/ccc/ota/ui/UpdateReceiver$PendingIntentType;

    sget-object v1, Lcom/motorola/ccc/ota/ui/UpdateReceiver$PendingIntentType;->SERVICE:Lcom/motorola/ccc/ota/ui/UpdateReceiver$PendingIntentType;

    sget-object v2, Lcom/motorola/ccc/ota/ui/UpdateReceiver$PendingIntentType;->BROADCAST:Lcom/motorola/ccc/ota/ui/UpdateReceiver$PendingIntentType;

    filled-new-array {v0, v1, v2}, [Lcom/motorola/ccc/ota/ui/UpdateReceiver$PendingIntentType;

    move-result-object v0

    return-object v0
.end method

.method static constructor <clinit>()V
    .locals 3

    new-instance v0, Lcom/motorola/ccc/ota/ui/UpdateReceiver$PendingIntentType;

    const-string v1, "ACTIVITY"

    const/4 v2, 0x0

    invoke-direct {v0, v1, v2}, Lcom/motorola/ccc/ota/ui/UpdateReceiver$PendingIntentType;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/motorola/ccc/ota/ui/UpdateReceiver$PendingIntentType;->ACTIVITY:Lcom/motorola/ccc/ota/ui/UpdateReceiver$PendingIntentType;

    new-instance v0, Lcom/motorola/ccc/ota/ui/UpdateReceiver$PendingIntentType;

    const-string v1, "SERVICE"

    const/4 v2, 0x1

    invoke-direct {v0, v1, v2}, Lcom/motorola/ccc/ota/ui/UpdateReceiver$PendingIntentType;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/motorola/ccc/ota/ui/UpdateReceiver$PendingIntentType;->SERVICE:Lcom/motorola/ccc/ota/ui/UpdateReceiver$PendingIntentType;

    new-instance v0, Lcom/motorola/ccc/ota/ui/UpdateReceiver$PendingIntentType;

    const-string v1, "BROADCAST"

    const/4 v2, 0x2

    invoke-direct {v0, v1, v2}, Lcom/motorola/ccc/ota/ui/UpdateReceiver$PendingIntentType;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/motorola/ccc/ota/ui/UpdateReceiver$PendingIntentType;->BROADCAST:Lcom/motorola/ccc/ota/ui/UpdateReceiver$PendingIntentType;

    invoke-static {}, Lcom/motorola/ccc/ota/ui/UpdateReceiver$PendingIntentType;->$values()[Lcom/motorola/ccc/ota/ui/UpdateReceiver$PendingIntentType;

    move-result-object v0

    sput-object v0, Lcom/motorola/ccc/ota/ui/UpdateReceiver$PendingIntentType;->$VALUES:[Lcom/motorola/ccc/ota/ui/UpdateReceiver$PendingIntentType;

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

.method public static valueOf(Ljava/lang/String;)Lcom/motorola/ccc/ota/ui/UpdateReceiver$PendingIntentType;
    .locals 1

    const-class v0, Lcom/motorola/ccc/ota/ui/UpdateReceiver$PendingIntentType;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object p0

    check-cast p0, Lcom/motorola/ccc/ota/ui/UpdateReceiver$PendingIntentType;

    return-object p0
.end method

.method public static values()[Lcom/motorola/ccc/ota/ui/UpdateReceiver$PendingIntentType;
    .locals 1

    sget-object v0, Lcom/motorola/ccc/ota/ui/UpdateReceiver$PendingIntentType;->$VALUES:[Lcom/motorola/ccc/ota/ui/UpdateReceiver$PendingIntentType;

    invoke-virtual {v0}, [Lcom/motorola/ccc/ota/ui/UpdateReceiver$PendingIntentType;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lcom/motorola/ccc/ota/ui/UpdateReceiver$PendingIntentType;

    return-object v0
.end method
