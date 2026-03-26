.class synthetic Lcom/motorola/ccc/ota/sources/fota/FotaUpgradeSource$1;
.super Ljava/lang/Object;
.source "FotaUpgradeSource.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/motorola/ccc/ota/sources/fota/FotaUpgradeSource;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1008
    name = null
.end annotation


# static fields
.field static final synthetic $SwitchMap$com$motorola$ccc$ota$NewVersionHandler$ReturnCode:[I

.field static final synthetic $SwitchMap$com$motorola$ccc$ota$sources$UpgradeStatusConstents:[I

.field static final synthetic $SwitchMap$com$motorola$ccc$ota$sources$fota$FotaUpdateTypes$Type:[I


# direct methods
.method static constructor <clinit>()V
    .locals 7

    invoke-static {}, Lcom/motorola/ccc/ota/sources/UpgradeStatusConstents;->values()[Lcom/motorola/ccc/ota/sources/UpgradeStatusConstents;

    move-result-object v0

    array-length v0, v0

    new-array v0, v0, [I

    sput-object v0, Lcom/motorola/ccc/ota/sources/fota/FotaUpgradeSource$1;->$SwitchMap$com$motorola$ccc$ota$sources$UpgradeStatusConstents:[I

    const/4 v1, 0x1

    :try_start_0
    sget-object v2, Lcom/motorola/ccc/ota/sources/UpgradeStatusConstents;->User_Declined_The_Request_Notification:Lcom/motorola/ccc/ota/sources/UpgradeStatusConstents;

    invoke-virtual {v2}, Lcom/motorola/ccc/ota/sources/UpgradeStatusConstents;->ordinal()I

    move-result v2

    aput v1, v0, v2
    :try_end_0
    .catch Ljava/lang/NoSuchFieldError; {:try_start_0 .. :try_end_0} :catch_0

    :catch_0
    const/4 v0, 0x2

    :try_start_1
    sget-object v2, Lcom/motorola/ccc/ota/sources/fota/FotaUpgradeSource$1;->$SwitchMap$com$motorola$ccc$ota$sources$UpgradeStatusConstents:[I

    sget-object v3, Lcom/motorola/ccc/ota/sources/UpgradeStatusConstents;->User_Declined_Launching_The_Upgrade:Lcom/motorola/ccc/ota/sources/UpgradeStatusConstents;

    invoke-virtual {v3}, Lcom/motorola/ccc/ota/sources/UpgradeStatusConstents;->ordinal()I

    move-result v3

    aput v0, v2, v3
    :try_end_1
    .catch Ljava/lang/NoSuchFieldError; {:try_start_1 .. :try_end_1} :catch_1

    :catch_1
    const/4 v2, 0x3

    :try_start_2
    sget-object v3, Lcom/motorola/ccc/ota/sources/fota/FotaUpgradeSource$1;->$SwitchMap$com$motorola$ccc$ota$sources$UpgradeStatusConstents:[I

    sget-object v4, Lcom/motorola/ccc/ota/sources/UpgradeStatusConstents;->Successfully_Launched_The_Upgrade:Lcom/motorola/ccc/ota/sources/UpgradeStatusConstents;

    invoke-virtual {v4}, Lcom/motorola/ccc/ota/sources/UpgradeStatusConstents;->ordinal()I

    move-result v4

    aput v2, v3, v4
    :try_end_2
    .catch Ljava/lang/NoSuchFieldError; {:try_start_2 .. :try_end_2} :catch_2

    :catch_2
    const/4 v3, 0x4

    :try_start_3
    sget-object v4, Lcom/motorola/ccc/ota/sources/fota/FotaUpgradeSource$1;->$SwitchMap$com$motorola$ccc$ota$sources$UpgradeStatusConstents:[I

    sget-object v5, Lcom/motorola/ccc/ota/sources/UpgradeStatusConstents;->Unsuccessfully_Launched_The_Upgrade:Lcom/motorola/ccc/ota/sources/UpgradeStatusConstents;

    invoke-virtual {v5}, Lcom/motorola/ccc/ota/sources/UpgradeStatusConstents;->ordinal()I

    move-result v5

    aput v3, v4, v5
    :try_end_3
    .catch Ljava/lang/NoSuchFieldError; {:try_start_3 .. :try_end_3} :catch_3

    :catch_3
    :try_start_4
    sget-object v4, Lcom/motorola/ccc/ota/sources/fota/FotaUpgradeSource$1;->$SwitchMap$com$motorola$ccc$ota$sources$UpgradeStatusConstents:[I

    sget-object v5, Lcom/motorola/ccc/ota/sources/UpgradeStatusConstents;->Internal_Error_Aborting_The_Query:Lcom/motorola/ccc/ota/sources/UpgradeStatusConstents;

    invoke-virtual {v5}, Lcom/motorola/ccc/ota/sources/UpgradeStatusConstents;->ordinal()I

    move-result v5

    const/4 v6, 0x5

    aput v6, v4, v5
    :try_end_4
    .catch Ljava/lang/NoSuchFieldError; {:try_start_4 .. :try_end_4} :catch_4

    :catch_4
    :try_start_5
    sget-object v4, Lcom/motorola/ccc/ota/sources/fota/FotaUpgradeSource$1;->$SwitchMap$com$motorola$ccc$ota$sources$UpgradeStatusConstents:[I

    sget-object v5, Lcom/motorola/ccc/ota/sources/UpgradeStatusConstents;->Internal_Error_Aborting_The_Upgrade:Lcom/motorola/ccc/ota/sources/UpgradeStatusConstents;

    invoke-virtual {v5}, Lcom/motorola/ccc/ota/sources/UpgradeStatusConstents;->ordinal()I

    move-result v5

    const/4 v6, 0x6

    aput v6, v4, v5
    :try_end_5
    .catch Ljava/lang/NoSuchFieldError; {:try_start_5 .. :try_end_5} :catch_5

    :catch_5
    :try_start_6
    sget-object v4, Lcom/motorola/ccc/ota/sources/fota/FotaUpgradeSource$1;->$SwitchMap$com$motorola$ccc$ota$sources$UpgradeStatusConstents:[I

    sget-object v5, Lcom/motorola/ccc/ota/sources/UpgradeStatusConstents;->Resources_Error_Aborting_The_Query:Lcom/motorola/ccc/ota/sources/UpgradeStatusConstents;

    invoke-virtual {v5}, Lcom/motorola/ccc/ota/sources/UpgradeStatusConstents;->ordinal()I

    move-result v5

    const/4 v6, 0x7

    aput v6, v4, v5
    :try_end_6
    .catch Ljava/lang/NoSuchFieldError; {:try_start_6 .. :try_end_6} :catch_6

    :catch_6
    :try_start_7
    sget-object v4, Lcom/motorola/ccc/ota/sources/fota/FotaUpgradeSource$1;->$SwitchMap$com$motorola$ccc$ota$sources$UpgradeStatusConstents:[I

    sget-object v5, Lcom/motorola/ccc/ota/sources/UpgradeStatusConstents;->Resources_Error_Aborting_The_Installation:Lcom/motorola/ccc/ota/sources/UpgradeStatusConstents;

    invoke-virtual {v5}, Lcom/motorola/ccc/ota/sources/UpgradeStatusConstents;->ordinal()I

    move-result v5

    const/16 v6, 0x8

    aput v6, v4, v5
    :try_end_7
    .catch Ljava/lang/NoSuchFieldError; {:try_start_7 .. :try_end_7} :catch_7

    :catch_7
    :try_start_8
    sget-object v4, Lcom/motorola/ccc/ota/sources/fota/FotaUpgradeSource$1;->$SwitchMap$com$motorola$ccc$ota$sources$UpgradeStatusConstents:[I

    sget-object v5, Lcom/motorola/ccc/ota/sources/UpgradeStatusConstents;->User_Canceled_The_Update:Lcom/motorola/ccc/ota/sources/UpgradeStatusConstents;

    invoke-virtual {v5}, Lcom/motorola/ccc/ota/sources/UpgradeStatusConstents;->ordinal()I

    move-result v5

    const/16 v6, 0x9

    aput v6, v4, v5
    :try_end_8
    .catch Ljava/lang/NoSuchFieldError; {:try_start_8 .. :try_end_8} :catch_8

    :catch_8
    :try_start_9
    sget-object v4, Lcom/motorola/ccc/ota/sources/fota/FotaUpgradeSource$1;->$SwitchMap$com$motorola$ccc$ota$sources$UpgradeStatusConstents:[I

    sget-object v5, Lcom/motorola/ccc/ota/sources/UpgradeStatusConstents;->Package_Verification_failed:Lcom/motorola/ccc/ota/sources/UpgradeStatusConstents;

    invoke-virtual {v5}, Lcom/motorola/ccc/ota/sources/UpgradeStatusConstents;->ordinal()I

    move-result v5

    const/16 v6, 0xa

    aput v6, v4, v5
    :try_end_9
    .catch Ljava/lang/NoSuchFieldError; {:try_start_9 .. :try_end_9} :catch_9

    :catch_9
    :try_start_a
    sget-object v4, Lcom/motorola/ccc/ota/sources/fota/FotaUpgradeSource$1;->$SwitchMap$com$motorola$ccc$ota$sources$UpgradeStatusConstents:[I

    sget-object v5, Lcom/motorola/ccc/ota/sources/UpgradeStatusConstents;->System_Update_Policy_Enabled:Lcom/motorola/ccc/ota/sources/UpgradeStatusConstents;

    invoke-virtual {v5}, Lcom/motorola/ccc/ota/sources/UpgradeStatusConstents;->ordinal()I

    move-result v5

    const/16 v6, 0xb

    aput v6, v4, v5
    :try_end_a
    .catch Ljava/lang/NoSuchFieldError; {:try_start_a .. :try_end_a} :catch_a

    :catch_a
    :try_start_b
    sget-object v4, Lcom/motorola/ccc/ota/sources/fota/FotaUpgradeSource$1;->$SwitchMap$com$motorola$ccc$ota$sources$UpgradeStatusConstents:[I

    sget-object v5, Lcom/motorola/ccc/ota/sources/UpgradeStatusConstents;->Download_Failed_Due_To_WiFi_Timeout:Lcom/motorola/ccc/ota/sources/UpgradeStatusConstents;

    invoke-virtual {v5}, Lcom/motorola/ccc/ota/sources/UpgradeStatusConstents;->ordinal()I

    move-result v5

    const/16 v6, 0xc

    aput v6, v4, v5
    :try_end_b
    .catch Ljava/lang/NoSuchFieldError; {:try_start_b .. :try_end_b} :catch_b

    :catch_b
    invoke-static {}, Lcom/motorola/ccc/ota/NewVersionHandler$ReturnCode;->values()[Lcom/motorola/ccc/ota/NewVersionHandler$ReturnCode;

    move-result-object v4

    array-length v4, v4

    new-array v4, v4, [I

    sput-object v4, Lcom/motorola/ccc/ota/sources/fota/FotaUpgradeSource$1;->$SwitchMap$com$motorola$ccc$ota$NewVersionHandler$ReturnCode:[I

    :try_start_c
    sget-object v5, Lcom/motorola/ccc/ota/NewVersionHandler$ReturnCode;->NEW_VERSION_ALREADY:Lcom/motorola/ccc/ota/NewVersionHandler$ReturnCode;

    invoke-virtual {v5}, Lcom/motorola/ccc/ota/NewVersionHandler$ReturnCode;->ordinal()I

    move-result v5

    aput v1, v4, v5
    :try_end_c
    .catch Ljava/lang/NoSuchFieldError; {:try_start_c .. :try_end_c} :catch_c

    :catch_c
    :try_start_d
    sget-object v4, Lcom/motorola/ccc/ota/sources/fota/FotaUpgradeSource$1;->$SwitchMap$com$motorola$ccc$ota$NewVersionHandler$ReturnCode:[I

    sget-object v5, Lcom/motorola/ccc/ota/NewVersionHandler$ReturnCode;->NEW_VERSION_INVALID:Lcom/motorola/ccc/ota/NewVersionHandler$ReturnCode;

    invoke-virtual {v5}, Lcom/motorola/ccc/ota/NewVersionHandler$ReturnCode;->ordinal()I

    move-result v5

    aput v0, v4, v5
    :try_end_d
    .catch Ljava/lang/NoSuchFieldError; {:try_start_d .. :try_end_d} :catch_d

    :catch_d
    :try_start_e
    sget-object v4, Lcom/motorola/ccc/ota/sources/fota/FotaUpgradeSource$1;->$SwitchMap$com$motorola$ccc$ota$NewVersionHandler$ReturnCode:[I

    sget-object v5, Lcom/motorola/ccc/ota/NewVersionHandler$ReturnCode;->NEW_VERSION_OK:Lcom/motorola/ccc/ota/NewVersionHandler$ReturnCode;

    invoke-virtual {v5}, Lcom/motorola/ccc/ota/NewVersionHandler$ReturnCode;->ordinal()I

    move-result v5

    aput v2, v4, v5
    :try_end_e
    .catch Ljava/lang/NoSuchFieldError; {:try_start_e .. :try_end_e} :catch_e

    :catch_e
    :try_start_f
    sget-object v4, Lcom/motorola/ccc/ota/sources/fota/FotaUpgradeSource$1;->$SwitchMap$com$motorola$ccc$ota$NewVersionHandler$ReturnCode:[I

    sget-object v5, Lcom/motorola/ccc/ota/NewVersionHandler$ReturnCode;->NEW_VERSION_FAIL:Lcom/motorola/ccc/ota/NewVersionHandler$ReturnCode;

    invoke-virtual {v5}, Lcom/motorola/ccc/ota/NewVersionHandler$ReturnCode;->ordinal()I

    move-result v5

    aput v3, v4, v5
    :try_end_f
    .catch Ljava/lang/NoSuchFieldError; {:try_start_f .. :try_end_f} :catch_f

    :catch_f
    invoke-static {}, Lcom/motorola/ccc/ota/sources/fota/FotaUpdateTypes$Type;->values()[Lcom/motorola/ccc/ota/sources/fota/FotaUpdateTypes$Type;

    move-result-object v3

    array-length v3, v3

    new-array v3, v3, [I

    sput-object v3, Lcom/motorola/ccc/ota/sources/fota/FotaUpgradeSource$1;->$SwitchMap$com$motorola$ccc$ota$sources$fota$FotaUpdateTypes$Type:[I

    :try_start_10
    sget-object v4, Lcom/motorola/ccc/ota/sources/fota/FotaUpdateTypes$Type;->USER_INITIATED:Lcom/motorola/ccc/ota/sources/fota/FotaUpdateTypes$Type;

    invoke-virtual {v4}, Lcom/motorola/ccc/ota/sources/fota/FotaUpdateTypes$Type;->ordinal()I

    move-result v4

    aput v1, v3, v4
    :try_end_10
    .catch Ljava/lang/NoSuchFieldError; {:try_start_10 .. :try_end_10} :catch_10

    :catch_10
    :try_start_11
    sget-object v1, Lcom/motorola/ccc/ota/sources/fota/FotaUpgradeSource$1;->$SwitchMap$com$motorola$ccc$ota$sources$fota$FotaUpdateTypes$Type:[I

    sget-object v3, Lcom/motorola/ccc/ota/sources/fota/FotaUpdateTypes$Type;->DEVICE_INITIATED:Lcom/motorola/ccc/ota/sources/fota/FotaUpdateTypes$Type;

    invoke-virtual {v3}, Lcom/motorola/ccc/ota/sources/fota/FotaUpdateTypes$Type;->ordinal()I

    move-result v3

    aput v0, v1, v3
    :try_end_11
    .catch Ljava/lang/NoSuchFieldError; {:try_start_11 .. :try_end_11} :catch_11

    :catch_11
    :try_start_12
    sget-object v0, Lcom/motorola/ccc/ota/sources/fota/FotaUpgradeSource$1;->$SwitchMap$com$motorola$ccc$ota$sources$fota$FotaUpdateTypes$Type:[I

    sget-object v1, Lcom/motorola/ccc/ota/sources/fota/FotaUpdateTypes$Type;->NETWORK_INITIATED:Lcom/motorola/ccc/ota/sources/fota/FotaUpdateTypes$Type;

    invoke-virtual {v1}, Lcom/motorola/ccc/ota/sources/fota/FotaUpdateTypes$Type;->ordinal()I

    move-result v1

    aput v2, v0, v1
    :try_end_12
    .catch Ljava/lang/NoSuchFieldError; {:try_start_12 .. :try_end_12} :catch_12

    :catch_12
    return-void
.end method
