.class public Lcom/motorola/otalib/common/errorCodes/UpdaterEngineErrorCodes;
.super Ljava/lang/Object;
.source "UpdaterEngineErrorCodes.java"


# static fields
.field public static ERROR_EXCEPTION:I = -0x1

.field public static ERROR_NETWORK:I = 0xce

.field public static HTTP_REQUESTED_RANGE_NOT_SATISFIABLE:I = 0x1a0

.field public static HTTP_TOO_MANY_REQUESTS:I = 0x1ad

.field public static K_DEVICE_CORRUPTED:I = 0x3d

.field public static K_DOWNLOAD_INVALID_METADATA_MAGIC_STRING:I = 0x15

.field public static K_DOWNLOAD_INVALID_METADATA_SIGNATURE:I = 0x21

.field public static K_DOWNLOAD_INVALID_METADATA_SIZE:I = 0x20

.field public static K_DOWNLOAD_MANIFEST_PARSE_ERROR:I = 0x17

.field public static K_DOWNLOAD_METADATA_SIGNATURE_ERROR:I = 0x18

.field public static K_DOWNLOAD_METADATA_SIGNATURE_MISMATCH:I = 0x1a

.field public static K_DOWNLOAD_METADATA_SIGNATURE_MISSING_ERROR:I = 0x27

.field public static K_DOWNLOAD_METADATA_SIGNATURE_VERIFICATION_ERROR:I = 0x19

.field public static K_DOWNLOAD_NEW_PARTITION_INFO_ERROR:I = 0xd

.field public static K_DOWNLOAD_OPERATION_EXECUTION_ERROR:I = 0x1c

.field public static K_DOWNLOAD_OPERATION_HASH_MISMATCH:I = 0x1d

.field public static K_DOWNLOAD_OPERATION_HASH_MISSING_ERROR:I = 0x26

.field public static K_DOWNLOAD_OPERATION_HASH_VERIFICATION_ERROR:I = 0x1b

.field public static K_DOWNLOAD_PAYLOAD_PUB_KEY_VERIFICATION_ERROR:I = 0x12

.field public static K_DOWNLOAD_PAYLOAD_VERIFICATION_ERROR:I = 0xc

.field public static K_DOWNLOAD_SIGNATURE_MISSING_IN_MANIFEST:I = 0x16

.field public static K_DOWNLOAD_STATE_INITIALIZATION_ERROR:I = 0x14

.field public static K_DOWNLOAD_TRANSFER_ERROR:I = 0x9

.field public static K_DOWNLOAD_WRITE_ERROR:I = 0xe

.field public static K_ERROR:I = 0x1

.field public static K_FILE_SYSTEM_COPIER_ERROR:I = 0x4

.field public static K_FILE_SYSTEM_VERIFIER_ERROR:I = 0x2f

.field public static K_INSTALL_DEVICE_OPEN_ERROR:I = 0x7

.field public static K_INTERNAL_LIB_CURL_ERROR:I = 0x39

.field public static K_KERNEL_DEVICE_OPEN_ERROR:I = 0x8

.field public static K_NEW_KERNEL_VERIFICATION_ERROR:I = 0x10

.field public static K_NEW_ROOT_FS_VERIFICATION_ERROR:I = 0xf

.field public static K_NOT_ENOUGH_SPACE:I = 0x3c

.field public static K_PAYLOAD_HASH_MISMATCH_ERROR:I = 0xa

.field public static K_PAYLOAD_MISMATCHED_TYPE:I = 0x6

.field public static K_PAYLOAD_SIZE_MISMATCH_ERROR:I = 0xb

.field public static K_PAYLOAD_TIME_STAMP_ERROR:I = 0x33

.field public static K_POST_INSTALL_BOOTED_FROM_FIRMWARE_B_ERROR:I = 0x13

.field public static K_POST_INSTALL_FIRMWARE_RO_NOT_UPDATABLE:I = 0x2b

.field public static K_POST_INSTALL_POWER_WASH_ERROR:I = 0x29

.field public static K_POST_INSTALL_RUNNER_ERROR:I = 0x5

.field public static K_SIGNED_DELTA_PAYLOAD_EXPECTED_ERROR:I = 0x11

.field public static K_SUCCESS:I = 0x0

.field public static K_UNRESOLVED_HOST_ERROR:I = 0x3a

.field public static K_UNRESOLVED_HOST_RECOVERED:I = 0x3b

.field public static K_UNSUPPORTED_MAJOR_PAYLOAD_VERSION:I = 0x2c

.field public static K_UNSUPPORTED_MINOR_PAYLOAD_VERSION:I = 0x2d

.field public static K_UPDATED_BUT_NOT_ACTIVE:I = 0x34

.field public static K_USER_CANCELED:I = 0x30

.field public static K_VERITY_CALCULATION_ERROR:I = 0x38

.field public static SERVER_INSUFFICIENT_STORAGE:I = 0x1fb

.field private static errorCodeHandler_4XX:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/Integer;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private static errorCodeHandler_UE:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/Integer;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 3

    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    sput-object v0, Lcom/motorola/otalib/common/errorCodes/UpdaterEngineErrorCodes;->errorCodeHandler_4XX:Ljava/util/Map;

    const/16 v1, 0x190

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "400 Bad Request"

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    sget-object v0, Lcom/motorola/otalib/common/errorCodes/UpdaterEngineErrorCodes;->errorCodeHandler_4XX:Ljava/util/Map;

    const/16 v1, 0x191

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "401 Unauthorized"

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    sget-object v0, Lcom/motorola/otalib/common/errorCodes/UpdaterEngineErrorCodes;->errorCodeHandler_4XX:Ljava/util/Map;

    const/16 v1, 0x193

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "403 Forbidden"

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    sget-object v0, Lcom/motorola/otalib/common/errorCodes/UpdaterEngineErrorCodes;->errorCodeHandler_4XX:Ljava/util/Map;

    const/16 v1, 0x194

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "404 Not Found"

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    sget-object v0, Lcom/motorola/otalib/common/errorCodes/UpdaterEngineErrorCodes;->errorCodeHandler_4XX:Ljava/util/Map;

    const/16 v1, 0x19a

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "410 Gone"

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    sget-object v0, Lcom/motorola/otalib/common/errorCodes/UpdaterEngineErrorCodes;->errorCodeHandler_4XX:Ljava/util/Map;

    const/16 v1, 0x19c

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "412 Precondition failed"

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    sget-object v0, Lcom/motorola/otalib/common/errorCodes/UpdaterEngineErrorCodes;->errorCodeHandler_4XX:Ljava/util/Map;

    sget v1, Lcom/motorola/otalib/common/errorCodes/UpdaterEngineErrorCodes;->HTTP_REQUESTED_RANGE_NOT_SATISFIABLE:I

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "416 Requested range not satisfiable"

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    sget-object v0, Lcom/motorola/otalib/common/errorCodes/UpdaterEngineErrorCodes;->errorCodeHandler_4XX:Ljava/util/Map;

    sget v1, Lcom/motorola/otalib/common/errorCodes/UpdaterEngineErrorCodes;->HTTP_TOO_MANY_REQUESTS:I

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "429 Too many requests"

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    sput-object v0, Lcom/motorola/otalib/common/errorCodes/UpdaterEngineErrorCodes;->errorCodeHandler_UE:Ljava/util/Map;

    sget v1, Lcom/motorola/otalib/common/errorCodes/UpdaterEngineErrorCodes;->K_ERROR:I

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "METADATA_VERIFICATION_ERROR3_1."

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    sget-object v0, Lcom/motorola/otalib/common/errorCodes/UpdaterEngineErrorCodes;->errorCodeHandler_UE:Ljava/util/Map;

    sget v1, Lcom/motorola/otalib/common/errorCodes/UpdaterEngineErrorCodes;->K_FILE_SYSTEM_COPIER_ERROR:I

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "INSTALL_ERROR_3_4."

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    sget-object v0, Lcom/motorola/otalib/common/errorCodes/UpdaterEngineErrorCodes;->errorCodeHandler_UE:Ljava/util/Map;

    sget v1, Lcom/motorola/otalib/common/errorCodes/UpdaterEngineErrorCodes;->K_POST_INSTALL_RUNNER_ERROR:I

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "POST_INSTALL_ERROR_5_5."

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    sget-object v0, Lcom/motorola/otalib/common/errorCodes/UpdaterEngineErrorCodes;->errorCodeHandler_UE:Ljava/util/Map;

    sget v1, Lcom/motorola/otalib/common/errorCodes/UpdaterEngineErrorCodes;->K_PAYLOAD_MISMATCHED_TYPE:I

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "INSTALL_ERROR_3_6."

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    sget-object v0, Lcom/motorola/otalib/common/errorCodes/UpdaterEngineErrorCodes;->errorCodeHandler_UE:Ljava/util/Map;

    sget v1, Lcom/motorola/otalib/common/errorCodes/UpdaterEngineErrorCodes;->K_INSTALL_DEVICE_OPEN_ERROR:I

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "INSTALL_ERROR_3_7."

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    sget-object v0, Lcom/motorola/otalib/common/errorCodes/UpdaterEngineErrorCodes;->errorCodeHandler_UE:Ljava/util/Map;

    sget v1, Lcom/motorola/otalib/common/errorCodes/UpdaterEngineErrorCodes;->K_KERNEL_DEVICE_OPEN_ERROR:I

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "INSTALL_ERROR_3_8."

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    sget-object v0, Lcom/motorola/otalib/common/errorCodes/UpdaterEngineErrorCodes;->errorCodeHandler_UE:Ljava/util/Map;

    sget v1, Lcom/motorola/otalib/common/errorCodes/UpdaterEngineErrorCodes;->K_DOWNLOAD_TRANSFER_ERROR:I

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "DOWNLOAD_FAILED_9."

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    sget-object v0, Lcom/motorola/otalib/common/errorCodes/UpdaterEngineErrorCodes;->errorCodeHandler_UE:Ljava/util/Map;

    sget v1, Lcom/motorola/otalib/common/errorCodes/UpdaterEngineErrorCodes;->K_PAYLOAD_HASH_MISMATCH_ERROR:I

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "FILESYSTEM_VERIFICATION_ERROR_4_10."

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    sget-object v0, Lcom/motorola/otalib/common/errorCodes/UpdaterEngineErrorCodes;->errorCodeHandler_UE:Ljava/util/Map;

    sget v1, Lcom/motorola/otalib/common/errorCodes/UpdaterEngineErrorCodes;->K_PAYLOAD_SIZE_MISMATCH_ERROR:I

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "FILESYSTEM_VERIFICATION_ERROR_4_11."

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    sget-object v0, Lcom/motorola/otalib/common/errorCodes/UpdaterEngineErrorCodes;->errorCodeHandler_UE:Ljava/util/Map;

    sget v1, Lcom/motorola/otalib/common/errorCodes/UpdaterEngineErrorCodes;->K_DOWNLOAD_PAYLOAD_VERIFICATION_ERROR:I

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "METADATA_VERIFICATION_FAILURE_3_12."

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    sget-object v0, Lcom/motorola/otalib/common/errorCodes/UpdaterEngineErrorCodes;->errorCodeHandler_UE:Ljava/util/Map;

    sget v1, Lcom/motorola/otalib/common/errorCodes/UpdaterEngineErrorCodes;->K_DOWNLOAD_NEW_PARTITION_INFO_ERROR:I

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "INSTALL_ERROR_3_13."

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    sget-object v0, Lcom/motorola/otalib/common/errorCodes/UpdaterEngineErrorCodes;->errorCodeHandler_UE:Ljava/util/Map;

    sget v1, Lcom/motorola/otalib/common/errorCodes/UpdaterEngineErrorCodes;->K_DOWNLOAD_WRITE_ERROR:I

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "INSTALL_ERROR_3_14."

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    sget-object v0, Lcom/motorola/otalib/common/errorCodes/UpdaterEngineErrorCodes;->errorCodeHandler_UE:Ljava/util/Map;

    sget v1, Lcom/motorola/otalib/common/errorCodes/UpdaterEngineErrorCodes;->K_NEW_ROOT_FS_VERIFICATION_ERROR:I

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "INSTALL_ERROR_3_15."

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    sget-object v0, Lcom/motorola/otalib/common/errorCodes/UpdaterEngineErrorCodes;->errorCodeHandler_UE:Ljava/util/Map;

    sget v1, Lcom/motorola/otalib/common/errorCodes/UpdaterEngineErrorCodes;->K_NEW_KERNEL_VERIFICATION_ERROR:I

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "INSTALL_ERROR_3_16."

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    sget-object v0, Lcom/motorola/otalib/common/errorCodes/UpdaterEngineErrorCodes;->errorCodeHandler_UE:Ljava/util/Map;

    sget v1, Lcom/motorola/otalib/common/errorCodes/UpdaterEngineErrorCodes;->K_SIGNED_DELTA_PAYLOAD_EXPECTED_ERROR:I

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "INSTALL_ERROR_3_17."

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    sget-object v0, Lcom/motorola/otalib/common/errorCodes/UpdaterEngineErrorCodes;->errorCodeHandler_UE:Ljava/util/Map;

    sget v1, Lcom/motorola/otalib/common/errorCodes/UpdaterEngineErrorCodes;->K_DOWNLOAD_PAYLOAD_PUB_KEY_VERIFICATION_ERROR:I

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "INSTALL_ERROR_3_18."

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    sget-object v0, Lcom/motorola/otalib/common/errorCodes/UpdaterEngineErrorCodes;->errorCodeHandler_UE:Ljava/util/Map;

    sget v1, Lcom/motorola/otalib/common/errorCodes/UpdaterEngineErrorCodes;->K_POST_INSTALL_BOOTED_FROM_FIRMWARE_B_ERROR:I

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "POST_INSTALL_ERROR_5_19."

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    sget-object v0, Lcom/motorola/otalib/common/errorCodes/UpdaterEngineErrorCodes;->errorCodeHandler_UE:Ljava/util/Map;

    sget v1, Lcom/motorola/otalib/common/errorCodes/UpdaterEngineErrorCodes;->K_DOWNLOAD_STATE_INITIALIZATION_ERROR:I

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "INSTALL_ERROR_3_20."

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    sget-object v0, Lcom/motorola/otalib/common/errorCodes/UpdaterEngineErrorCodes;->errorCodeHandler_UE:Ljava/util/Map;

    sget v1, Lcom/motorola/otalib/common/errorCodes/UpdaterEngineErrorCodes;->K_DOWNLOAD_INVALID_METADATA_MAGIC_STRING:I

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "METADATA_VERIFICATION_FAILURE_3_21."

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    sget-object v0, Lcom/motorola/otalib/common/errorCodes/UpdaterEngineErrorCodes;->errorCodeHandler_UE:Ljava/util/Map;

    sget v1, Lcom/motorola/otalib/common/errorCodes/UpdaterEngineErrorCodes;->K_DOWNLOAD_SIGNATURE_MISSING_IN_MANIFEST:I

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "METADATA_VERIFICATION_FAILURE_3_22."

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    sget-object v0, Lcom/motorola/otalib/common/errorCodes/UpdaterEngineErrorCodes;->errorCodeHandler_UE:Ljava/util/Map;

    sget v1, Lcom/motorola/otalib/common/errorCodes/UpdaterEngineErrorCodes;->K_DOWNLOAD_MANIFEST_PARSE_ERROR:I

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "METADATA_VERIFICATION_FAILURE_3_23."

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    sget-object v0, Lcom/motorola/otalib/common/errorCodes/UpdaterEngineErrorCodes;->errorCodeHandler_UE:Ljava/util/Map;

    sget v1, Lcom/motorola/otalib/common/errorCodes/UpdaterEngineErrorCodes;->K_DOWNLOAD_METADATA_SIGNATURE_ERROR:I

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "METADATA_VERIFICATION-FAILURE_3_24."

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    sget-object v0, Lcom/motorola/otalib/common/errorCodes/UpdaterEngineErrorCodes;->errorCodeHandler_UE:Ljava/util/Map;

    sget v1, Lcom/motorola/otalib/common/errorCodes/UpdaterEngineErrorCodes;->K_DOWNLOAD_METADATA_SIGNATURE_VERIFICATION_ERROR:I

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "METADATA_VERIFICATION_FAILURE_3_25."

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    sget-object v0, Lcom/motorola/otalib/common/errorCodes/UpdaterEngineErrorCodes;->errorCodeHandler_UE:Ljava/util/Map;

    sget v1, Lcom/motorola/otalib/common/errorCodes/UpdaterEngineErrorCodes;->K_DOWNLOAD_METADATA_SIGNATURE_MISMATCH:I

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "METADATA_VERIFICATION_FAILURE_3_26."

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    sget-object v0, Lcom/motorola/otalib/common/errorCodes/UpdaterEngineErrorCodes;->errorCodeHandler_UE:Ljava/util/Map;

    sget v1, Lcom/motorola/otalib/common/errorCodes/UpdaterEngineErrorCodes;->K_DOWNLOAD_OPERATION_HASH_VERIFICATION_ERROR:I

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "INSTALL_ERROR_3_27."

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    sget-object v0, Lcom/motorola/otalib/common/errorCodes/UpdaterEngineErrorCodes;->errorCodeHandler_UE:Ljava/util/Map;

    sget v1, Lcom/motorola/otalib/common/errorCodes/UpdaterEngineErrorCodes;->K_DOWNLOAD_OPERATION_EXECUTION_ERROR:I

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "INSTALL_ERROR_3_28."

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    sget-object v0, Lcom/motorola/otalib/common/errorCodes/UpdaterEngineErrorCodes;->errorCodeHandler_UE:Ljava/util/Map;

    sget v1, Lcom/motorola/otalib/common/errorCodes/UpdaterEngineErrorCodes;->K_DOWNLOAD_OPERATION_HASH_MISMATCH:I

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "INSTALL_ERROR_3_29."

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    sget-object v0, Lcom/motorola/otalib/common/errorCodes/UpdaterEngineErrorCodes;->errorCodeHandler_UE:Ljava/util/Map;

    sget v1, Lcom/motorola/otalib/common/errorCodes/UpdaterEngineErrorCodes;->K_DOWNLOAD_INVALID_METADATA_SIZE:I

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "METADATA_VERIFICATION_FAILURE_3_32."

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    sget-object v0, Lcom/motorola/otalib/common/errorCodes/UpdaterEngineErrorCodes;->errorCodeHandler_UE:Ljava/util/Map;

    sget v1, Lcom/motorola/otalib/common/errorCodes/UpdaterEngineErrorCodes;->K_DOWNLOAD_INVALID_METADATA_SIGNATURE:I

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "METADATA_VERIFICATION_FAILURE_3_33."

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    sget-object v0, Lcom/motorola/otalib/common/errorCodes/UpdaterEngineErrorCodes;->errorCodeHandler_UE:Ljava/util/Map;

    sget v1, Lcom/motorola/otalib/common/errorCodes/UpdaterEngineErrorCodes;->K_DOWNLOAD_OPERATION_HASH_MISSING_ERROR:I

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "INSTALL_ERROR_3_38."

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    sget-object v0, Lcom/motorola/otalib/common/errorCodes/UpdaterEngineErrorCodes;->errorCodeHandler_UE:Ljava/util/Map;

    sget v1, Lcom/motorola/otalib/common/errorCodes/UpdaterEngineErrorCodes;->K_DOWNLOAD_METADATA_SIGNATURE_MISSING_ERROR:I

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "METADATA_VERIFICATION_FAILURE_3_39."

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    sget-object v0, Lcom/motorola/otalib/common/errorCodes/UpdaterEngineErrorCodes;->errorCodeHandler_UE:Ljava/util/Map;

    sget v1, Lcom/motorola/otalib/common/errorCodes/UpdaterEngineErrorCodes;->K_POST_INSTALL_POWER_WASH_ERROR:I

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "POST_INSTALL_ERROR_5_41."

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    sget-object v0, Lcom/motorola/otalib/common/errorCodes/UpdaterEngineErrorCodes;->errorCodeHandler_UE:Ljava/util/Map;

    sget v1, Lcom/motorola/otalib/common/errorCodes/UpdaterEngineErrorCodes;->K_POST_INSTALL_FIRMWARE_RO_NOT_UPDATABLE:I

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "POST_INSTALL_ERROR_5_43."

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    sget-object v0, Lcom/motorola/otalib/common/errorCodes/UpdaterEngineErrorCodes;->errorCodeHandler_UE:Ljava/util/Map;

    sget v1, Lcom/motorola/otalib/common/errorCodes/UpdaterEngineErrorCodes;->K_UNSUPPORTED_MAJOR_PAYLOAD_VERSION:I

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "METADATA_VERIFICATION_FAILURE_3_44."

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    sget-object v0, Lcom/motorola/otalib/common/errorCodes/UpdaterEngineErrorCodes;->errorCodeHandler_UE:Ljava/util/Map;

    sget v1, Lcom/motorola/otalib/common/errorCodes/UpdaterEngineErrorCodes;->K_UNSUPPORTED_MINOR_PAYLOAD_VERSION:I

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "METADATA_VERIFICATION_FAILURE_3_45."

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    sget-object v0, Lcom/motorola/otalib/common/errorCodes/UpdaterEngineErrorCodes;->errorCodeHandler_UE:Ljava/util/Map;

    sget v1, Lcom/motorola/otalib/common/errorCodes/UpdaterEngineErrorCodes;->K_FILE_SYSTEM_VERIFIER_ERROR:I

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "FILESYSTEM_VERIFICATION_ERROR_4_47."

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    sget-object v0, Lcom/motorola/otalib/common/errorCodes/UpdaterEngineErrorCodes;->errorCodeHandler_UE:Ljava/util/Map;

    sget v1, Lcom/motorola/otalib/common/errorCodes/UpdaterEngineErrorCodes;->K_USER_CANCELED:I

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "USER_CANCELED_DOWNLOAD."

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    sget-object v0, Lcom/motorola/otalib/common/errorCodes/UpdaterEngineErrorCodes;->errorCodeHandler_UE:Ljava/util/Map;

    sget v1, Lcom/motorola/otalib/common/errorCodes/UpdaterEngineErrorCodes;->K_PAYLOAD_TIME_STAMP_ERROR:I

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "METADATA_VERIFICATION_FAILURE_3_51."

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    sget-object v0, Lcom/motorola/otalib/common/errorCodes/UpdaterEngineErrorCodes;->errorCodeHandler_UE:Ljava/util/Map;

    sget v1, Lcom/motorola/otalib/common/errorCodes/UpdaterEngineErrorCodes;->K_UPDATED_BUT_NOT_ACTIVE:I

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "POST_INSTALL_ERROR_5_52."

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    sget-object v0, Lcom/motorola/otalib/common/errorCodes/UpdaterEngineErrorCodes;->errorCodeHandler_UE:Ljava/util/Map;

    sget v1, Lcom/motorola/otalib/common/errorCodes/UpdaterEngineErrorCodes;->K_VERITY_CALCULATION_ERROR:I

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "FILESYSTEM_VERIFICATION_ERROR_4_56."

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    sget-object v0, Lcom/motorola/otalib/common/errorCodes/UpdaterEngineErrorCodes;->errorCodeHandler_UE:Ljava/util/Map;

    sget v1, Lcom/motorola/otalib/common/errorCodes/UpdaterEngineErrorCodes;->K_INTERNAL_LIB_CURL_ERROR:I

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "DOWNLOAD_FAILED_57."

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    sget-object v0, Lcom/motorola/otalib/common/errorCodes/UpdaterEngineErrorCodes;->errorCodeHandler_UE:Ljava/util/Map;

    sget v1, Lcom/motorola/otalib/common/errorCodes/UpdaterEngineErrorCodes;->K_UNRESOLVED_HOST_ERROR:I

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "DOWNLOAD_FAILED_58."

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    sget-object v0, Lcom/motorola/otalib/common/errorCodes/UpdaterEngineErrorCodes;->errorCodeHandler_UE:Ljava/util/Map;

    sget v1, Lcom/motorola/otalib/common/errorCodes/UpdaterEngineErrorCodes;->K_UNRESOLVED_HOST_RECOVERED:I

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "DOWNLOAD_FAILED_59."

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    sget-object v0, Lcom/motorola/otalib/common/errorCodes/UpdaterEngineErrorCodes;->errorCodeHandler_UE:Ljava/util/Map;

    sget v1, Lcom/motorola/otalib/common/errorCodes/UpdaterEngineErrorCodes;->K_NOT_ENOUGH_SPACE:I

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "INSTALL_ERROR_3_60."

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    sget-object v0, Lcom/motorola/otalib/common/errorCodes/UpdaterEngineErrorCodes;->errorCodeHandler_UE:Ljava/util/Map;

    sget v1, Lcom/motorola/otalib/common/errorCodes/UpdaterEngineErrorCodes;->K_DEVICE_CORRUPTED:I

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "MERGE_FAILURE_61."

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static getErrorCodeDescription(I)Ljava/lang/String;
    .locals 2

    sget-object v0, Lcom/motorola/otalib/common/errorCodes/UpdaterEngineErrorCodes;->errorCodeHandler_4XX:Ljava/util/Map;

    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-interface {v0, v1}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    sget-object v0, Lcom/motorola/otalib/common/errorCodes/UpdaterEngineErrorCodes;->errorCodeHandler_4XX:Ljava/util/Map;

    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p0

    invoke-interface {v0, p0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Ljava/lang/String;

    return-object p0

    :cond_0
    const/16 v0, 0x9

    if-ne p0, v0, :cond_1

    const-string p0, "9 UE DL transfer error"

    return-object p0

    :cond_1
    invoke-static {p0}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method public static getFailureResultStatus(I)Ljava/lang/String;
    .locals 2

    const/16 v0, 0x1f4

    if-lt p0, v0, :cond_0

    sget v0, Lcom/motorola/otalib/common/errorCodes/UpdaterEngineErrorCodes;->SERVER_INSUFFICIENT_STORAGE:I

    if-gt p0, v0, :cond_0

    const-string p0, "DOWNLOAD_FAILED_5XX."

    return-object p0

    :cond_0
    sget-object v0, Lcom/motorola/otalib/common/errorCodes/UpdaterEngineErrorCodes;->errorCodeHandler_4XX:Ljava/util/Map;

    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-interface {v0, v1}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1

    const-string p0, "DOWNLOAD_FAILED_UE_4XX."

    return-object p0

    :cond_1
    sget-object v0, Lcom/motorola/otalib/common/errorCodes/UpdaterEngineErrorCodes;->errorCodeHandler_UE:Ljava/util/Map;

    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-interface {v0, v1}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_2

    sget-object v0, Lcom/motorola/otalib/common/errorCodes/UpdaterEngineErrorCodes;->errorCodeHandler_UE:Ljava/util/Map;

    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p0

    invoke-interface {v0, p0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Ljava/lang/String;

    return-object p0

    :cond_2
    const-string p0, "OTHER."

    return-object p0
.end method

.method public static getFailureResultStatus(Ljava/lang/String;)Ljava/lang/String;
    .locals 3

    sget-object v0, Lcom/motorola/otalib/common/errorCodes/UpdaterEngineErrorCodes;->errorCodeHandler_UE:Ljava/util/Map;

    invoke-interface {v0}, Ljava/util/Map;->values()Ljava/util/Collection;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :cond_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_1

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    invoke-virtual {p0, v1}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v2

    if-eqz v2, :cond_0

    invoke-virtual {v1}, Ljava/lang/String;->length()I

    move-result p0

    add-int/lit8 p0, p0, -0x1

    const/4 v0, 0x0

    invoke-virtual {v1, v0, p0}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object p0

    return-object p0

    :cond_1
    const/4 p0, 0x0

    return-object p0
.end method

.method public static isItaRetriableError(I)Z
    .locals 2

    sget-object v0, Lcom/motorola/otalib/common/errorCodes/UpdaterEngineErrorCodes;->errorCodeHandler_4XX:Ljava/util/Map;

    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-interface {v0, v1}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v0

    const/4 v1, 0x1

    if-eqz v0, :cond_0

    return v1

    :cond_0
    sget v0, Lcom/motorola/otalib/common/errorCodes/UpdaterEngineErrorCodes;->K_DOWNLOAD_TRANSFER_ERROR:I

    if-ne p0, v0, :cond_1

    return v1

    :cond_1
    const/16 v0, 0x1f4

    if-lt p0, v0, :cond_2

    sget v0, Lcom/motorola/otalib/common/errorCodes/UpdaterEngineErrorCodes;->SERVER_INSUFFICIENT_STORAGE:I

    if-gt p0, v0, :cond_2

    goto :goto_0

    :cond_2
    const/4 v1, 0x0

    :goto_0
    return v1
.end method

.method public static shouldWeFetchNewUrl(I)Z
    .locals 1

    sget v0, Lcom/motorola/otalib/common/errorCodes/UpdaterEngineErrorCodes;->K_DOWNLOAD_TRANSFER_ERROR:I

    if-ne p0, v0, :cond_0

    const/4 p0, 0x1

    return p0

    :cond_0
    sget-object v0, Lcom/motorola/otalib/common/errorCodes/UpdaterEngineErrorCodes;->errorCodeHandler_4XX:Ljava/util/Map;

    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p0

    invoke-interface {v0, p0}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result p0

    return p0
.end method
