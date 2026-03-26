.class synthetic Lcom/motorola/ccc/ota/sources/bota/BotaUpgradeSource$3;
.super Ljava/lang/Object;
.source "BotaUpgradeSource.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/motorola/ccc/ota/sources/bota/BotaUpgradeSource;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1008
    name = null
.end annotation


# static fields
.field static final synthetic $SwitchMap$com$motorola$otalib$cdsservice$utils$NetworkTags:[I


# direct methods
.method static constructor <clinit>()V
    .locals 3

    invoke-static {}, Lcom/motorola/otalib/cdsservice/utils/NetworkTags;->values()[Lcom/motorola/otalib/cdsservice/utils/NetworkTags;

    move-result-object v0

    array-length v0, v0

    new-array v0, v0, [I

    sput-object v0, Lcom/motorola/ccc/ota/sources/bota/BotaUpgradeSource$3;->$SwitchMap$com$motorola$otalib$cdsservice$utils$NetworkTags:[I

    :try_start_0
    sget-object v1, Lcom/motorola/otalib/cdsservice/utils/NetworkTags;->CELL:Lcom/motorola/otalib/cdsservice/utils/NetworkTags;

    invoke-virtual {v1}, Lcom/motorola/otalib/cdsservice/utils/NetworkTags;->ordinal()I

    move-result v1

    const/4 v2, 0x1

    aput v2, v0, v1
    :try_end_0
    .catch Ljava/lang/NoSuchFieldError; {:try_start_0 .. :try_end_0} :catch_0

    :catch_0
    :try_start_1
    sget-object v0, Lcom/motorola/ccc/ota/sources/bota/BotaUpgradeSource$3;->$SwitchMap$com$motorola$otalib$cdsservice$utils$NetworkTags:[I

    sget-object v1, Lcom/motorola/otalib/cdsservice/utils/NetworkTags;->WIFI:Lcom/motorola/otalib/cdsservice/utils/NetworkTags;

    invoke-virtual {v1}, Lcom/motorola/otalib/cdsservice/utils/NetworkTags;->ordinal()I

    move-result v1

    const/4 v2, 0x2

    aput v2, v0, v1
    :try_end_1
    .catch Ljava/lang/NoSuchFieldError; {:try_start_1 .. :try_end_1} :catch_1

    :catch_1
    :try_start_2
    sget-object v0, Lcom/motorola/ccc/ota/sources/bota/BotaUpgradeSource$3;->$SwitchMap$com$motorola$otalib$cdsservice$utils$NetworkTags:[I

    sget-object v1, Lcom/motorola/otalib/cdsservice/utils/NetworkTags;->USEADMINAPN:Lcom/motorola/otalib/cdsservice/utils/NetworkTags;

    invoke-virtual {v1}, Lcom/motorola/otalib/cdsservice/utils/NetworkTags;->ordinal()I

    move-result v1

    const/4 v2, 0x3

    aput v2, v0, v1
    :try_end_2
    .catch Ljava/lang/NoSuchFieldError; {:try_start_2 .. :try_end_2} :catch_2

    :catch_2
    return-void
.end method
