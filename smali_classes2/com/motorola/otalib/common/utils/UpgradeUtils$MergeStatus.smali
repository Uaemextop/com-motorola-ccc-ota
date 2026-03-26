.class public final Lcom/motorola/otalib/common/utils/UpgradeUtils$MergeStatus;
.super Ljava/lang/Object;
.source "UpgradeUtils.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/motorola/otalib/common/utils/UpgradeUtils;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "MergeStatus"
.end annotation


# static fields
.field public static final APPLY_MERGE_CORRUPTED:I

.field public static final APPLY_PAYLOAD_FAILURE:I

.field public static final APPLY_PAYLOAD_SUCCESS:I


# direct methods
.method static constructor <clinit>()V
    .locals 1

    sget v0, Lcom/motorola/otalib/common/errorCodes/UpdaterEngineErrorCodes;->K_SUCCESS:I

    sput v0, Lcom/motorola/otalib/common/utils/UpgradeUtils$MergeStatus;->APPLY_PAYLOAD_SUCCESS:I

    sget v0, Lcom/motorola/otalib/common/errorCodes/UpdaterEngineErrorCodes;->K_ERROR:I

    sput v0, Lcom/motorola/otalib/common/utils/UpgradeUtils$MergeStatus;->APPLY_PAYLOAD_FAILURE:I

    sget v0, Lcom/motorola/otalib/common/errorCodes/UpdaterEngineErrorCodes;->K_DEVICE_CORRUPTED:I

    sput v0, Lcom/motorola/otalib/common/utils/UpgradeUtils$MergeStatus;->APPLY_MERGE_CORRUPTED:I

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method
