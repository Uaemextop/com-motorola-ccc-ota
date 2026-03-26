.class public final enum Lcom/motorola/ccc/ota/stats/StatsDownloadIface$IfaceName;
.super Ljava/lang/Enum;
.source "StatsDownloadIface.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/motorola/ccc/ota/stats/StatsDownloadIface;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4019
    name = "IfaceName"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum<",
        "Lcom/motorola/ccc/ota/stats/StatsDownloadIface$IfaceName;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcom/motorola/ccc/ota/stats/StatsDownloadIface$IfaceName;

.field public static final enum admin:Lcom/motorola/ccc/ota/stats/StatsDownloadIface$IfaceName;

.field public static final enum all:Lcom/motorola/ccc/ota/stats/StatsDownloadIface$IfaceName;

.field public static final enum internet:Lcom/motorola/ccc/ota/stats/StatsDownloadIface$IfaceName;

.field public static final enum wifi:Lcom/motorola/ccc/ota/stats/StatsDownloadIface$IfaceName;


# direct methods
.method private static synthetic $values()[Lcom/motorola/ccc/ota/stats/StatsDownloadIface$IfaceName;
    .locals 4

    sget-object v0, Lcom/motorola/ccc/ota/stats/StatsDownloadIface$IfaceName;->admin:Lcom/motorola/ccc/ota/stats/StatsDownloadIface$IfaceName;

    sget-object v1, Lcom/motorola/ccc/ota/stats/StatsDownloadIface$IfaceName;->internet:Lcom/motorola/ccc/ota/stats/StatsDownloadIface$IfaceName;

    sget-object v2, Lcom/motorola/ccc/ota/stats/StatsDownloadIface$IfaceName;->wifi:Lcom/motorola/ccc/ota/stats/StatsDownloadIface$IfaceName;

    sget-object v3, Lcom/motorola/ccc/ota/stats/StatsDownloadIface$IfaceName;->all:Lcom/motorola/ccc/ota/stats/StatsDownloadIface$IfaceName;

    filled-new-array {v0, v1, v2, v3}, [Lcom/motorola/ccc/ota/stats/StatsDownloadIface$IfaceName;

    move-result-object v0

    return-object v0
.end method

.method static constructor <clinit>()V
    .locals 3

    new-instance v0, Lcom/motorola/ccc/ota/stats/StatsDownloadIface$IfaceName;

    const-string v1, "admin"

    const/4 v2, 0x0

    invoke-direct {v0, v1, v2}, Lcom/motorola/ccc/ota/stats/StatsDownloadIface$IfaceName;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/motorola/ccc/ota/stats/StatsDownloadIface$IfaceName;->admin:Lcom/motorola/ccc/ota/stats/StatsDownloadIface$IfaceName;

    new-instance v0, Lcom/motorola/ccc/ota/stats/StatsDownloadIface$IfaceName;

    const-string v1, "internet"

    const/4 v2, 0x1

    invoke-direct {v0, v1, v2}, Lcom/motorola/ccc/ota/stats/StatsDownloadIface$IfaceName;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/motorola/ccc/ota/stats/StatsDownloadIface$IfaceName;->internet:Lcom/motorola/ccc/ota/stats/StatsDownloadIface$IfaceName;

    new-instance v0, Lcom/motorola/ccc/ota/stats/StatsDownloadIface$IfaceName;

    const-string v1, "wifi"

    const/4 v2, 0x2

    invoke-direct {v0, v1, v2}, Lcom/motorola/ccc/ota/stats/StatsDownloadIface$IfaceName;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/motorola/ccc/ota/stats/StatsDownloadIface$IfaceName;->wifi:Lcom/motorola/ccc/ota/stats/StatsDownloadIface$IfaceName;

    new-instance v0, Lcom/motorola/ccc/ota/stats/StatsDownloadIface$IfaceName;

    const-string v1, "all"

    const/4 v2, 0x3

    invoke-direct {v0, v1, v2}, Lcom/motorola/ccc/ota/stats/StatsDownloadIface$IfaceName;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/motorola/ccc/ota/stats/StatsDownloadIface$IfaceName;->all:Lcom/motorola/ccc/ota/stats/StatsDownloadIface$IfaceName;

    invoke-static {}, Lcom/motorola/ccc/ota/stats/StatsDownloadIface$IfaceName;->$values()[Lcom/motorola/ccc/ota/stats/StatsDownloadIface$IfaceName;

    move-result-object v0

    sput-object v0, Lcom/motorola/ccc/ota/stats/StatsDownloadIface$IfaceName;->$VALUES:[Lcom/motorola/ccc/ota/stats/StatsDownloadIface$IfaceName;

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

.method public static valueOf(Ljava/lang/String;)Lcom/motorola/ccc/ota/stats/StatsDownloadIface$IfaceName;
    .locals 1

    const-class v0, Lcom/motorola/ccc/ota/stats/StatsDownloadIface$IfaceName;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object p0

    check-cast p0, Lcom/motorola/ccc/ota/stats/StatsDownloadIface$IfaceName;

    return-object p0
.end method

.method public static values()[Lcom/motorola/ccc/ota/stats/StatsDownloadIface$IfaceName;
    .locals 1

    sget-object v0, Lcom/motorola/ccc/ota/stats/StatsDownloadIface$IfaceName;->$VALUES:[Lcom/motorola/ccc/ota/stats/StatsDownloadIface$IfaceName;

    invoke-virtual {v0}, [Lcom/motorola/ccc/ota/stats/StatsDownloadIface$IfaceName;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lcom/motorola/ccc/ota/stats/StatsDownloadIface$IfaceName;

    return-object v0
.end method
