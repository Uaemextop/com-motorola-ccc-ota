.class public final enum Lcom/motorola/ccc/ota/ui/UpdaterUtils$InternalUpdateType;
.super Ljava/lang/Enum;
.source "UpdaterUtils.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/motorola/ccc/ota/ui/UpdaterUtils;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4019
    name = "InternalUpdateType"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum<",
        "Lcom/motorola/ccc/ota/ui/UpdaterUtils$InternalUpdateType;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcom/motorola/ccc/ota/ui/UpdaterUtils$InternalUpdateType;

.field public static final enum CRITICAL_UPDATE:Lcom/motorola/ccc/ota/ui/UpdaterUtils$InternalUpdateType;

.field public static final enum DEFAULT_UPDATE:Lcom/motorola/ccc/ota/ui/UpdaterUtils$InternalUpdateType;

.field public static final enum FORCE_UPDATE:Lcom/motorola/ccc/ota/ui/UpdaterUtils$InternalUpdateType;

.field public static final enum SMART_UPDATE:Lcom/motorola/ccc/ota/ui/UpdaterUtils$InternalUpdateType;


# direct methods
.method private static synthetic $values()[Lcom/motorola/ccc/ota/ui/UpdaterUtils$InternalUpdateType;
    .locals 4

    sget-object v0, Lcom/motorola/ccc/ota/ui/UpdaterUtils$InternalUpdateType;->CRITICAL_UPDATE:Lcom/motorola/ccc/ota/ui/UpdaterUtils$InternalUpdateType;

    sget-object v1, Lcom/motorola/ccc/ota/ui/UpdaterUtils$InternalUpdateType;->FORCE_UPDATE:Lcom/motorola/ccc/ota/ui/UpdaterUtils$InternalUpdateType;

    sget-object v2, Lcom/motorola/ccc/ota/ui/UpdaterUtils$InternalUpdateType;->SMART_UPDATE:Lcom/motorola/ccc/ota/ui/UpdaterUtils$InternalUpdateType;

    sget-object v3, Lcom/motorola/ccc/ota/ui/UpdaterUtils$InternalUpdateType;->DEFAULT_UPDATE:Lcom/motorola/ccc/ota/ui/UpdaterUtils$InternalUpdateType;

    filled-new-array {v0, v1, v2, v3}, [Lcom/motorola/ccc/ota/ui/UpdaterUtils$InternalUpdateType;

    move-result-object v0

    return-object v0
.end method

.method static constructor <clinit>()V
    .locals 3

    new-instance v0, Lcom/motorola/ccc/ota/ui/UpdaterUtils$InternalUpdateType;

    const-string v1, "CRITICAL_UPDATE"

    const/4 v2, 0x0

    invoke-direct {v0, v1, v2}, Lcom/motorola/ccc/ota/ui/UpdaterUtils$InternalUpdateType;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/motorola/ccc/ota/ui/UpdaterUtils$InternalUpdateType;->CRITICAL_UPDATE:Lcom/motorola/ccc/ota/ui/UpdaterUtils$InternalUpdateType;

    new-instance v0, Lcom/motorola/ccc/ota/ui/UpdaterUtils$InternalUpdateType;

    const-string v1, "FORCE_UPDATE"

    const/4 v2, 0x1

    invoke-direct {v0, v1, v2}, Lcom/motorola/ccc/ota/ui/UpdaterUtils$InternalUpdateType;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/motorola/ccc/ota/ui/UpdaterUtils$InternalUpdateType;->FORCE_UPDATE:Lcom/motorola/ccc/ota/ui/UpdaterUtils$InternalUpdateType;

    new-instance v0, Lcom/motorola/ccc/ota/ui/UpdaterUtils$InternalUpdateType;

    const-string v1, "SMART_UPDATE"

    const/4 v2, 0x2

    invoke-direct {v0, v1, v2}, Lcom/motorola/ccc/ota/ui/UpdaterUtils$InternalUpdateType;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/motorola/ccc/ota/ui/UpdaterUtils$InternalUpdateType;->SMART_UPDATE:Lcom/motorola/ccc/ota/ui/UpdaterUtils$InternalUpdateType;

    new-instance v0, Lcom/motorola/ccc/ota/ui/UpdaterUtils$InternalUpdateType;

    const-string v1, "DEFAULT_UPDATE"

    const/4 v2, 0x3

    invoke-direct {v0, v1, v2}, Lcom/motorola/ccc/ota/ui/UpdaterUtils$InternalUpdateType;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/motorola/ccc/ota/ui/UpdaterUtils$InternalUpdateType;->DEFAULT_UPDATE:Lcom/motorola/ccc/ota/ui/UpdaterUtils$InternalUpdateType;

    invoke-static {}, Lcom/motorola/ccc/ota/ui/UpdaterUtils$InternalUpdateType;->$values()[Lcom/motorola/ccc/ota/ui/UpdaterUtils$InternalUpdateType;

    move-result-object v0

    sput-object v0, Lcom/motorola/ccc/ota/ui/UpdaterUtils$InternalUpdateType;->$VALUES:[Lcom/motorola/ccc/ota/ui/UpdaterUtils$InternalUpdateType;

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

.method public static valueOf(Ljava/lang/String;)Lcom/motorola/ccc/ota/ui/UpdaterUtils$InternalUpdateType;
    .locals 1

    const-class v0, Lcom/motorola/ccc/ota/ui/UpdaterUtils$InternalUpdateType;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object p0

    check-cast p0, Lcom/motorola/ccc/ota/ui/UpdaterUtils$InternalUpdateType;

    return-object p0
.end method

.method public static values()[Lcom/motorola/ccc/ota/ui/UpdaterUtils$InternalUpdateType;
    .locals 1

    sget-object v0, Lcom/motorola/ccc/ota/ui/UpdaterUtils$InternalUpdateType;->$VALUES:[Lcom/motorola/ccc/ota/ui/UpdaterUtils$InternalUpdateType;

    invoke-virtual {v0}, [Lcom/motorola/ccc/ota/ui/UpdaterUtils$InternalUpdateType;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lcom/motorola/ccc/ota/ui/UpdaterUtils$InternalUpdateType;

    return-object v0
.end method
