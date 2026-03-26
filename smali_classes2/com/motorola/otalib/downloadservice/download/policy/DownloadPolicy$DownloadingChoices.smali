.class public final enum Lcom/motorola/otalib/downloadservice/download/policy/DownloadPolicy$DownloadingChoices;
.super Ljava/lang/Enum;
.source "DownloadPolicy.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/motorola/otalib/downloadservice/download/policy/DownloadPolicy;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4019
    name = "DownloadingChoices"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum<",
        "Lcom/motorola/otalib/downloadservice/download/policy/DownloadPolicy$DownloadingChoices;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcom/motorola/otalib/downloadservice/download/policy/DownloadPolicy$DownloadingChoices;

.field public static final enum NO_WAN:Lcom/motorola/otalib/downloadservice/download/policy/DownloadPolicy$DownloadingChoices;

.field public static final enum PEAK_HOUR:Lcom/motorola/otalib/downloadservice/download/policy/DownloadPolicy$DownloadingChoices;

.field public static final enum ROAMING:Lcom/motorola/otalib/downloadservice/download/policy/DownloadPolicy$DownloadingChoices;

.field public static final enum WAN_DISALLOWED:Lcom/motorola/otalib/downloadservice/download/policy/DownloadPolicy$DownloadingChoices;

.field public static final enum WAN_OK:Lcom/motorola/otalib/downloadservice/download/policy/DownloadPolicy$DownloadingChoices;

.field public static final enum WIFI_OK:Lcom/motorola/otalib/downloadservice/download/policy/DownloadPolicy$DownloadingChoices;

.field public static final enum WIFI_ONLY:Lcom/motorola/otalib/downloadservice/download/policy/DownloadPolicy$DownloadingChoices;


# direct methods
.method private static synthetic $values()[Lcom/motorola/otalib/downloadservice/download/policy/DownloadPolicy$DownloadingChoices;
    .locals 7

    sget-object v0, Lcom/motorola/otalib/downloadservice/download/policy/DownloadPolicy$DownloadingChoices;->WIFI_OK:Lcom/motorola/otalib/downloadservice/download/policy/DownloadPolicy$DownloadingChoices;

    sget-object v1, Lcom/motorola/otalib/downloadservice/download/policy/DownloadPolicy$DownloadingChoices;->WAN_OK:Lcom/motorola/otalib/downloadservice/download/policy/DownloadPolicy$DownloadingChoices;

    sget-object v2, Lcom/motorola/otalib/downloadservice/download/policy/DownloadPolicy$DownloadingChoices;->WIFI_ONLY:Lcom/motorola/otalib/downloadservice/download/policy/DownloadPolicy$DownloadingChoices;

    sget-object v3, Lcom/motorola/otalib/downloadservice/download/policy/DownloadPolicy$DownloadingChoices;->ROAMING:Lcom/motorola/otalib/downloadservice/download/policy/DownloadPolicy$DownloadingChoices;

    sget-object v4, Lcom/motorola/otalib/downloadservice/download/policy/DownloadPolicy$DownloadingChoices;->NO_WAN:Lcom/motorola/otalib/downloadservice/download/policy/DownloadPolicy$DownloadingChoices;

    sget-object v5, Lcom/motorola/otalib/downloadservice/download/policy/DownloadPolicy$DownloadingChoices;->WAN_DISALLOWED:Lcom/motorola/otalib/downloadservice/download/policy/DownloadPolicy$DownloadingChoices;

    sget-object v6, Lcom/motorola/otalib/downloadservice/download/policy/DownloadPolicy$DownloadingChoices;->PEAK_HOUR:Lcom/motorola/otalib/downloadservice/download/policy/DownloadPolicy$DownloadingChoices;

    filled-new-array/range {v0 .. v6}, [Lcom/motorola/otalib/downloadservice/download/policy/DownloadPolicy$DownloadingChoices;

    move-result-object v0

    return-object v0
.end method

.method static constructor <clinit>()V
    .locals 3

    new-instance v0, Lcom/motorola/otalib/downloadservice/download/policy/DownloadPolicy$DownloadingChoices;

    const-string v1, "WIFI_OK"

    const/4 v2, 0x0

    invoke-direct {v0, v1, v2}, Lcom/motorola/otalib/downloadservice/download/policy/DownloadPolicy$DownloadingChoices;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/motorola/otalib/downloadservice/download/policy/DownloadPolicy$DownloadingChoices;->WIFI_OK:Lcom/motorola/otalib/downloadservice/download/policy/DownloadPolicy$DownloadingChoices;

    new-instance v0, Lcom/motorola/otalib/downloadservice/download/policy/DownloadPolicy$DownloadingChoices;

    const-string v1, "WAN_OK"

    const/4 v2, 0x1

    invoke-direct {v0, v1, v2}, Lcom/motorola/otalib/downloadservice/download/policy/DownloadPolicy$DownloadingChoices;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/motorola/otalib/downloadservice/download/policy/DownloadPolicy$DownloadingChoices;->WAN_OK:Lcom/motorola/otalib/downloadservice/download/policy/DownloadPolicy$DownloadingChoices;

    new-instance v0, Lcom/motorola/otalib/downloadservice/download/policy/DownloadPolicy$DownloadingChoices;

    const-string v1, "WIFI_ONLY"

    const/4 v2, 0x2

    invoke-direct {v0, v1, v2}, Lcom/motorola/otalib/downloadservice/download/policy/DownloadPolicy$DownloadingChoices;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/motorola/otalib/downloadservice/download/policy/DownloadPolicy$DownloadingChoices;->WIFI_ONLY:Lcom/motorola/otalib/downloadservice/download/policy/DownloadPolicy$DownloadingChoices;

    new-instance v0, Lcom/motorola/otalib/downloadservice/download/policy/DownloadPolicy$DownloadingChoices;

    const-string v1, "ROAMING"

    const/4 v2, 0x3

    invoke-direct {v0, v1, v2}, Lcom/motorola/otalib/downloadservice/download/policy/DownloadPolicy$DownloadingChoices;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/motorola/otalib/downloadservice/download/policy/DownloadPolicy$DownloadingChoices;->ROAMING:Lcom/motorola/otalib/downloadservice/download/policy/DownloadPolicy$DownloadingChoices;

    new-instance v0, Lcom/motorola/otalib/downloadservice/download/policy/DownloadPolicy$DownloadingChoices;

    const-string v1, "NO_WAN"

    const/4 v2, 0x4

    invoke-direct {v0, v1, v2}, Lcom/motorola/otalib/downloadservice/download/policy/DownloadPolicy$DownloadingChoices;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/motorola/otalib/downloadservice/download/policy/DownloadPolicy$DownloadingChoices;->NO_WAN:Lcom/motorola/otalib/downloadservice/download/policy/DownloadPolicy$DownloadingChoices;

    new-instance v0, Lcom/motorola/otalib/downloadservice/download/policy/DownloadPolicy$DownloadingChoices;

    const-string v1, "WAN_DISALLOWED"

    const/4 v2, 0x5

    invoke-direct {v0, v1, v2}, Lcom/motorola/otalib/downloadservice/download/policy/DownloadPolicy$DownloadingChoices;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/motorola/otalib/downloadservice/download/policy/DownloadPolicy$DownloadingChoices;->WAN_DISALLOWED:Lcom/motorola/otalib/downloadservice/download/policy/DownloadPolicy$DownloadingChoices;

    new-instance v0, Lcom/motorola/otalib/downloadservice/download/policy/DownloadPolicy$DownloadingChoices;

    const-string v1, "PEAK_HOUR"

    const/4 v2, 0x6

    invoke-direct {v0, v1, v2}, Lcom/motorola/otalib/downloadservice/download/policy/DownloadPolicy$DownloadingChoices;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/motorola/otalib/downloadservice/download/policy/DownloadPolicy$DownloadingChoices;->PEAK_HOUR:Lcom/motorola/otalib/downloadservice/download/policy/DownloadPolicy$DownloadingChoices;

    invoke-static {}, Lcom/motorola/otalib/downloadservice/download/policy/DownloadPolicy$DownloadingChoices;->$values()[Lcom/motorola/otalib/downloadservice/download/policy/DownloadPolicy$DownloadingChoices;

    move-result-object v0

    sput-object v0, Lcom/motorola/otalib/downloadservice/download/policy/DownloadPolicy$DownloadingChoices;->$VALUES:[Lcom/motorola/otalib/downloadservice/download/policy/DownloadPolicy$DownloadingChoices;

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

.method public static valueOf(Ljava/lang/String;)Lcom/motorola/otalib/downloadservice/download/policy/DownloadPolicy$DownloadingChoices;
    .locals 1

    const-class v0, Lcom/motorola/otalib/downloadservice/download/policy/DownloadPolicy$DownloadingChoices;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object p0

    check-cast p0, Lcom/motorola/otalib/downloadservice/download/policy/DownloadPolicy$DownloadingChoices;

    return-object p0
.end method

.method public static values()[Lcom/motorola/otalib/downloadservice/download/policy/DownloadPolicy$DownloadingChoices;
    .locals 1

    sget-object v0, Lcom/motorola/otalib/downloadservice/download/policy/DownloadPolicy$DownloadingChoices;->$VALUES:[Lcom/motorola/otalib/downloadservice/download/policy/DownloadPolicy$DownloadingChoices;

    invoke-virtual {v0}, [Lcom/motorola/otalib/downloadservice/download/policy/DownloadPolicy$DownloadingChoices;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lcom/motorola/otalib/downloadservice/download/policy/DownloadPolicy$DownloadingChoices;

    return-object v0
.end method
