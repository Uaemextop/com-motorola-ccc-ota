.class public final enum Lcom/motorola/ccc/ota/ui/UpdaterUtils$BitmapFeatures;
.super Ljava/lang/Enum;
.source "UpdaterUtils.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/motorola/ccc/ota/ui/UpdaterUtils;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4019
    name = "BitmapFeatures"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum<",
        "Lcom/motorola/ccc/ota/ui/UpdaterUtils$BitmapFeatures;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcom/motorola/ccc/ota/ui/UpdaterUtils$BitmapFeatures;

.field public static final enum bootloader:Lcom/motorola/ccc/ota/ui/UpdaterUtils$BitmapFeatures;

.field public static final enum enableResumeOnReboot:Lcom/motorola/ccc/ota/ui/UpdaterUtils$BitmapFeatures;

.field public static final enum enableVABMergeFeature:Lcom/motorola/ccc/ota/ui/UpdaterUtils$BitmapFeatures;

.field public static final enum intelligentNotification:Lcom/motorola/ccc/ota/ui/UpdaterUtils$BitmapFeatures;

.field public static final enum rooted:Lcom/motorola/ccc/ota/ui/UpdaterUtils$BitmapFeatures;

.field public static final enum softBankProxy:Lcom/motorola/ccc/ota/ui/UpdaterUtils$BitmapFeatures;

.field public static final enum swipableNotification:Lcom/motorola/ccc/ota/ui/UpdaterUtils$BitmapFeatures;


# direct methods
.method private static synthetic $values()[Lcom/motorola/ccc/ota/ui/UpdaterUtils$BitmapFeatures;
    .locals 7

    sget-object v0, Lcom/motorola/ccc/ota/ui/UpdaterUtils$BitmapFeatures;->bootloader:Lcom/motorola/ccc/ota/ui/UpdaterUtils$BitmapFeatures;

    sget-object v1, Lcom/motorola/ccc/ota/ui/UpdaterUtils$BitmapFeatures;->rooted:Lcom/motorola/ccc/ota/ui/UpdaterUtils$BitmapFeatures;

    sget-object v2, Lcom/motorola/ccc/ota/ui/UpdaterUtils$BitmapFeatures;->intelligentNotification:Lcom/motorola/ccc/ota/ui/UpdaterUtils$BitmapFeatures;

    sget-object v3, Lcom/motorola/ccc/ota/ui/UpdaterUtils$BitmapFeatures;->swipableNotification:Lcom/motorola/ccc/ota/ui/UpdaterUtils$BitmapFeatures;

    sget-object v4, Lcom/motorola/ccc/ota/ui/UpdaterUtils$BitmapFeatures;->softBankProxy:Lcom/motorola/ccc/ota/ui/UpdaterUtils$BitmapFeatures;

    sget-object v5, Lcom/motorola/ccc/ota/ui/UpdaterUtils$BitmapFeatures;->enableVABMergeFeature:Lcom/motorola/ccc/ota/ui/UpdaterUtils$BitmapFeatures;

    sget-object v6, Lcom/motorola/ccc/ota/ui/UpdaterUtils$BitmapFeatures;->enableResumeOnReboot:Lcom/motorola/ccc/ota/ui/UpdaterUtils$BitmapFeatures;

    filled-new-array/range {v0 .. v6}, [Lcom/motorola/ccc/ota/ui/UpdaterUtils$BitmapFeatures;

    move-result-object v0

    return-object v0
.end method

.method static constructor <clinit>()V
    .locals 3

    new-instance v0, Lcom/motorola/ccc/ota/ui/UpdaterUtils$BitmapFeatures;

    const-string v1, "bootloader"

    const/4 v2, 0x0

    invoke-direct {v0, v1, v2}, Lcom/motorola/ccc/ota/ui/UpdaterUtils$BitmapFeatures;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/motorola/ccc/ota/ui/UpdaterUtils$BitmapFeatures;->bootloader:Lcom/motorola/ccc/ota/ui/UpdaterUtils$BitmapFeatures;

    new-instance v0, Lcom/motorola/ccc/ota/ui/UpdaterUtils$BitmapFeatures;

    const-string v1, "rooted"

    const/4 v2, 0x1

    invoke-direct {v0, v1, v2}, Lcom/motorola/ccc/ota/ui/UpdaterUtils$BitmapFeatures;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/motorola/ccc/ota/ui/UpdaterUtils$BitmapFeatures;->rooted:Lcom/motorola/ccc/ota/ui/UpdaterUtils$BitmapFeatures;

    new-instance v0, Lcom/motorola/ccc/ota/ui/UpdaterUtils$BitmapFeatures;

    const-string v1, "intelligentNotification"

    const/4 v2, 0x2

    invoke-direct {v0, v1, v2}, Lcom/motorola/ccc/ota/ui/UpdaterUtils$BitmapFeatures;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/motorola/ccc/ota/ui/UpdaterUtils$BitmapFeatures;->intelligentNotification:Lcom/motorola/ccc/ota/ui/UpdaterUtils$BitmapFeatures;

    new-instance v0, Lcom/motorola/ccc/ota/ui/UpdaterUtils$BitmapFeatures;

    const-string v1, "swipableNotification"

    const/4 v2, 0x3

    invoke-direct {v0, v1, v2}, Lcom/motorola/ccc/ota/ui/UpdaterUtils$BitmapFeatures;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/motorola/ccc/ota/ui/UpdaterUtils$BitmapFeatures;->swipableNotification:Lcom/motorola/ccc/ota/ui/UpdaterUtils$BitmapFeatures;

    new-instance v0, Lcom/motorola/ccc/ota/ui/UpdaterUtils$BitmapFeatures;

    const-string v1, "softBankProxy"

    const/4 v2, 0x4

    invoke-direct {v0, v1, v2}, Lcom/motorola/ccc/ota/ui/UpdaterUtils$BitmapFeatures;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/motorola/ccc/ota/ui/UpdaterUtils$BitmapFeatures;->softBankProxy:Lcom/motorola/ccc/ota/ui/UpdaterUtils$BitmapFeatures;

    new-instance v0, Lcom/motorola/ccc/ota/ui/UpdaterUtils$BitmapFeatures;

    const-string v1, "enableVABMergeFeature"

    const/4 v2, 0x5

    invoke-direct {v0, v1, v2}, Lcom/motorola/ccc/ota/ui/UpdaterUtils$BitmapFeatures;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/motorola/ccc/ota/ui/UpdaterUtils$BitmapFeatures;->enableVABMergeFeature:Lcom/motorola/ccc/ota/ui/UpdaterUtils$BitmapFeatures;

    new-instance v0, Lcom/motorola/ccc/ota/ui/UpdaterUtils$BitmapFeatures;

    const-string v1, "enableResumeOnReboot"

    const/4 v2, 0x6

    invoke-direct {v0, v1, v2}, Lcom/motorola/ccc/ota/ui/UpdaterUtils$BitmapFeatures;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/motorola/ccc/ota/ui/UpdaterUtils$BitmapFeatures;->enableResumeOnReboot:Lcom/motorola/ccc/ota/ui/UpdaterUtils$BitmapFeatures;

    invoke-static {}, Lcom/motorola/ccc/ota/ui/UpdaterUtils$BitmapFeatures;->$values()[Lcom/motorola/ccc/ota/ui/UpdaterUtils$BitmapFeatures;

    move-result-object v0

    sput-object v0, Lcom/motorola/ccc/ota/ui/UpdaterUtils$BitmapFeatures;->$VALUES:[Lcom/motorola/ccc/ota/ui/UpdaterUtils$BitmapFeatures;

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

.method public static valueOf(Ljava/lang/String;)Lcom/motorola/ccc/ota/ui/UpdaterUtils$BitmapFeatures;
    .locals 1

    const-class v0, Lcom/motorola/ccc/ota/ui/UpdaterUtils$BitmapFeatures;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object p0

    check-cast p0, Lcom/motorola/ccc/ota/ui/UpdaterUtils$BitmapFeatures;

    return-object p0
.end method

.method public static values()[Lcom/motorola/ccc/ota/ui/UpdaterUtils$BitmapFeatures;
    .locals 1

    sget-object v0, Lcom/motorola/ccc/ota/ui/UpdaterUtils$BitmapFeatures;->$VALUES:[Lcom/motorola/ccc/ota/ui/UpdaterUtils$BitmapFeatures;

    invoke-virtual {v0}, [Lcom/motorola/ccc/ota/ui/UpdaterUtils$BitmapFeatures;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lcom/motorola/ccc/ota/ui/UpdaterUtils$BitmapFeatures;

    return-object v0
.end method
