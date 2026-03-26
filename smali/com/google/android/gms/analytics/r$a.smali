.class final enum Lcom/google/android/gms/analytics/r$a;
.super Ljava/lang/Enum;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/google/android/gms/analytics/r;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x401a
    name = "a"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum<",
        "Lcom/google/android/gms/analytics/r$a;",
        ">;"
    }
.end annotation


# static fields
.field public static final enum yH:Lcom/google/android/gms/analytics/r$a;

.field public static final enum yI:Lcom/google/android/gms/analytics/r$a;

.field public static final enum yJ:Lcom/google/android/gms/analytics/r$a;

.field public static final enum yK:Lcom/google/android/gms/analytics/r$a;

.field public static final enum yL:Lcom/google/android/gms/analytics/r$a;

.field public static final enum yM:Lcom/google/android/gms/analytics/r$a;

.field public static final enum yN:Lcom/google/android/gms/analytics/r$a;

.field private static final synthetic yO:[Lcom/google/android/gms/analytics/r$a;


# direct methods
.method static constructor <clinit>()V
    .locals 9

    new-instance v0, Lcom/google/android/gms/analytics/r$a;

    const-string v1, "CONNECTING"

    const/4 v2, 0x0

    invoke-direct {v0, v1, v2}, Lcom/google/android/gms/analytics/r$a;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/google/android/gms/analytics/r$a;->yH:Lcom/google/android/gms/analytics/r$a;

    new-instance v1, Lcom/google/android/gms/analytics/r$a;

    const-string v2, "CONNECTED_SERVICE"

    const/4 v3, 0x1

    invoke-direct {v1, v2, v3}, Lcom/google/android/gms/analytics/r$a;-><init>(Ljava/lang/String;I)V

    sput-object v1, Lcom/google/android/gms/analytics/r$a;->yI:Lcom/google/android/gms/analytics/r$a;

    new-instance v2, Lcom/google/android/gms/analytics/r$a;

    const-string v3, "CONNECTED_LOCAL"

    const/4 v4, 0x2

    invoke-direct {v2, v3, v4}, Lcom/google/android/gms/analytics/r$a;-><init>(Ljava/lang/String;I)V

    sput-object v2, Lcom/google/android/gms/analytics/r$a;->yJ:Lcom/google/android/gms/analytics/r$a;

    new-instance v3, Lcom/google/android/gms/analytics/r$a;

    const-string v4, "BLOCKED"

    const/4 v5, 0x3

    invoke-direct {v3, v4, v5}, Lcom/google/android/gms/analytics/r$a;-><init>(Ljava/lang/String;I)V

    sput-object v3, Lcom/google/android/gms/analytics/r$a;->yK:Lcom/google/android/gms/analytics/r$a;

    new-instance v4, Lcom/google/android/gms/analytics/r$a;

    const-string v5, "PENDING_CONNECTION"

    const/4 v6, 0x4

    invoke-direct {v4, v5, v6}, Lcom/google/android/gms/analytics/r$a;-><init>(Ljava/lang/String;I)V

    sput-object v4, Lcom/google/android/gms/analytics/r$a;->yL:Lcom/google/android/gms/analytics/r$a;

    new-instance v5, Lcom/google/android/gms/analytics/r$a;

    const-string v6, "PENDING_DISCONNECT"

    const/4 v7, 0x5

    invoke-direct {v5, v6, v7}, Lcom/google/android/gms/analytics/r$a;-><init>(Ljava/lang/String;I)V

    sput-object v5, Lcom/google/android/gms/analytics/r$a;->yM:Lcom/google/android/gms/analytics/r$a;

    new-instance v6, Lcom/google/android/gms/analytics/r$a;

    const-string v7, "DISCONNECTED"

    const/4 v8, 0x6

    invoke-direct {v6, v7, v8}, Lcom/google/android/gms/analytics/r$a;-><init>(Ljava/lang/String;I)V

    sput-object v6, Lcom/google/android/gms/analytics/r$a;->yN:Lcom/google/android/gms/analytics/r$a;

    filled-new-array/range {v0 .. v6}, [Lcom/google/android/gms/analytics/r$a;

    move-result-object v0

    sput-object v0, Lcom/google/android/gms/analytics/r$a;->yO:[Lcom/google/android/gms/analytics/r$a;

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

.method public static valueOf(Ljava/lang/String;)Lcom/google/android/gms/analytics/r$a;
    .locals 1

    const-class v0, Lcom/google/android/gms/analytics/r$a;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object p0

    check-cast p0, Lcom/google/android/gms/analytics/r$a;

    return-object p0
.end method

.method public static values()[Lcom/google/android/gms/analytics/r$a;
    .locals 1

    sget-object v0, Lcom/google/android/gms/analytics/r$a;->yO:[Lcom/google/android/gms/analytics/r$a;

    invoke-virtual {v0}, [Lcom/google/android/gms/analytics/r$a;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lcom/google/android/gms/analytics/r$a;

    return-object v0
.end method
