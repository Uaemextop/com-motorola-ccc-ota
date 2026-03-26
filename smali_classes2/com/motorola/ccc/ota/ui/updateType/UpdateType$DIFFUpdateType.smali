.class public final enum Lcom/motorola/ccc/ota/ui/updateType/UpdateType$DIFFUpdateType;
.super Ljava/lang/Enum;
.source "UpdateType.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/motorola/ccc/ota/ui/updateType/UpdateType;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4019
    name = "DIFFUpdateType"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum<",
        "Lcom/motorola/ccc/ota/ui/updateType/UpdateType$DIFFUpdateType;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcom/motorola/ccc/ota/ui/updateType/UpdateType$DIFFUpdateType;

.field public static final enum DEFAULT:Lcom/motorola/ccc/ota/ui/updateType/UpdateType$DIFFUpdateType;

.field public static final enum MR:Lcom/motorola/ccc/ota/ui/updateType/UpdateType$DIFFUpdateType;

.field public static final enum OS:Lcom/motorola/ccc/ota/ui/updateType/UpdateType$DIFFUpdateType;

.field public static final enum SMR:Lcom/motorola/ccc/ota/ui/updateType/UpdateType$DIFFUpdateType;


# direct methods
.method private static synthetic $values()[Lcom/motorola/ccc/ota/ui/updateType/UpdateType$DIFFUpdateType;
    .locals 4

    sget-object v0, Lcom/motorola/ccc/ota/ui/updateType/UpdateType$DIFFUpdateType;->DEFAULT:Lcom/motorola/ccc/ota/ui/updateType/UpdateType$DIFFUpdateType;

    sget-object v1, Lcom/motorola/ccc/ota/ui/updateType/UpdateType$DIFFUpdateType;->OS:Lcom/motorola/ccc/ota/ui/updateType/UpdateType$DIFFUpdateType;

    sget-object v2, Lcom/motorola/ccc/ota/ui/updateType/UpdateType$DIFFUpdateType;->SMR:Lcom/motorola/ccc/ota/ui/updateType/UpdateType$DIFFUpdateType;

    sget-object v3, Lcom/motorola/ccc/ota/ui/updateType/UpdateType$DIFFUpdateType;->MR:Lcom/motorola/ccc/ota/ui/updateType/UpdateType$DIFFUpdateType;

    filled-new-array {v0, v1, v2, v3}, [Lcom/motorola/ccc/ota/ui/updateType/UpdateType$DIFFUpdateType;

    move-result-object v0

    return-object v0
.end method

.method static constructor <clinit>()V
    .locals 3

    new-instance v0, Lcom/motorola/ccc/ota/ui/updateType/UpdateType$DIFFUpdateType;

    const-string v1, "DEFAULT"

    const/4 v2, 0x0

    invoke-direct {v0, v1, v2}, Lcom/motorola/ccc/ota/ui/updateType/UpdateType$DIFFUpdateType;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/motorola/ccc/ota/ui/updateType/UpdateType$DIFFUpdateType;->DEFAULT:Lcom/motorola/ccc/ota/ui/updateType/UpdateType$DIFFUpdateType;

    new-instance v0, Lcom/motorola/ccc/ota/ui/updateType/UpdateType$DIFFUpdateType;

    const-string v1, "OS"

    const/4 v2, 0x1

    invoke-direct {v0, v1, v2}, Lcom/motorola/ccc/ota/ui/updateType/UpdateType$DIFFUpdateType;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/motorola/ccc/ota/ui/updateType/UpdateType$DIFFUpdateType;->OS:Lcom/motorola/ccc/ota/ui/updateType/UpdateType$DIFFUpdateType;

    new-instance v0, Lcom/motorola/ccc/ota/ui/updateType/UpdateType$DIFFUpdateType;

    const-string v1, "SMR"

    const/4 v2, 0x2

    invoke-direct {v0, v1, v2}, Lcom/motorola/ccc/ota/ui/updateType/UpdateType$DIFFUpdateType;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/motorola/ccc/ota/ui/updateType/UpdateType$DIFFUpdateType;->SMR:Lcom/motorola/ccc/ota/ui/updateType/UpdateType$DIFFUpdateType;

    new-instance v0, Lcom/motorola/ccc/ota/ui/updateType/UpdateType$DIFFUpdateType;

    const-string v1, "MR"

    const/4 v2, 0x3

    invoke-direct {v0, v1, v2}, Lcom/motorola/ccc/ota/ui/updateType/UpdateType$DIFFUpdateType;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/motorola/ccc/ota/ui/updateType/UpdateType$DIFFUpdateType;->MR:Lcom/motorola/ccc/ota/ui/updateType/UpdateType$DIFFUpdateType;

    invoke-static {}, Lcom/motorola/ccc/ota/ui/updateType/UpdateType$DIFFUpdateType;->$values()[Lcom/motorola/ccc/ota/ui/updateType/UpdateType$DIFFUpdateType;

    move-result-object v0

    sput-object v0, Lcom/motorola/ccc/ota/ui/updateType/UpdateType$DIFFUpdateType;->$VALUES:[Lcom/motorola/ccc/ota/ui/updateType/UpdateType$DIFFUpdateType;

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

.method public static valueOf(Ljava/lang/String;)Lcom/motorola/ccc/ota/ui/updateType/UpdateType$DIFFUpdateType;
    .locals 1

    const-class v0, Lcom/motorola/ccc/ota/ui/updateType/UpdateType$DIFFUpdateType;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object p0

    check-cast p0, Lcom/motorola/ccc/ota/ui/updateType/UpdateType$DIFFUpdateType;

    return-object p0
.end method

.method public static values()[Lcom/motorola/ccc/ota/ui/updateType/UpdateType$DIFFUpdateType;
    .locals 1

    sget-object v0, Lcom/motorola/ccc/ota/ui/updateType/UpdateType$DIFFUpdateType;->$VALUES:[Lcom/motorola/ccc/ota/ui/updateType/UpdateType$DIFFUpdateType;

    invoke-virtual {v0}, [Lcom/motorola/ccc/ota/ui/updateType/UpdateType$DIFFUpdateType;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lcom/motorola/ccc/ota/ui/updateType/UpdateType$DIFFUpdateType;

    return-object v0
.end method
