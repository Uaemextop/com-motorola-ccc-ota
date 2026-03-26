.class public Lcom/motorola/ccc/ota/ui/MessageActivity;
.super Landroidx/appcompat/app/AppCompatActivity;
.source "MessageActivity.java"

# interfaces
.implements Lcom/motorola/ccc/ota/ui/UpdaterUtils$OnDialogInteractionListener;


# static fields
.field private static final BOTA_FAILURE_DIALOG_CLEARED_ACTION:Ljava/lang/String; = "com.motorola.blur.updater.FAILURE_DIALOG_CLEARED"

.field private static final DEFAULT_SPACE_REQUIRED:I = 0x32

.field private static final DIALOG_ID:I = 0x1

.field private static final MEGABYTE:I = 0x100000

.field private static final SYSTEM_DIALOG_REASON_HOME_KEY:Ljava/lang/String; = "homekey"

.field private static final SYSTEM_DIALOG_REASON_KEY:Ljava/lang/String; = "reason"

.field private static final SYSTEM_DIALOG_REASON_RECENT_APPS:Ljava/lang/String; = "recentapps"


# instance fields
.field private error_message:Ljava/lang/String;

.field private error_title:Ljava/lang/String;

.field private intent:Landroid/content/Intent;

.field private isTransactionSafe:Z

.field private mCloseSystemDialogsIntentReceiver:Landroid/content/BroadcastReceiver;

.field private mFinishReceiver:Landroid/content/BroadcastReceiver;

.field private mMemoryLow:Z

.field private settings:Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

.field private status:Lcom/motorola/otalib/common/utils/UpgradeUtils$DownloadStatus;


# direct methods
.method public constructor <init>()V
    .locals 1

    invoke-direct {p0}, Landroidx/appcompat/app/AppCompatActivity;-><init>()V

    const/4 v0, 0x0

    iput-object v0, p0, Lcom/motorola/ccc/ota/ui/MessageActivity;->mCloseSystemDialogsIntentReceiver:Landroid/content/BroadcastReceiver;

    new-instance v0, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    invoke-direct {v0}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;-><init>()V

    iput-object v0, p0, Lcom/motorola/ccc/ota/ui/MessageActivity;->settings:Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    new-instance v0, Lcom/motorola/ccc/ota/ui/MessageActivity$2;

    invoke-direct {v0, p0}, Lcom/motorola/ccc/ota/ui/MessageActivity$2;-><init>(Lcom/motorola/ccc/ota/ui/MessageActivity;)V

    iput-object v0, p0, Lcom/motorola/ccc/ota/ui/MessageActivity;->mFinishReceiver:Landroid/content/BroadcastReceiver;

    return-void
.end method

.method public static getAvailableDataPartitionSize()J
    .locals 5

    new-instance v0, Landroid/os/StatFs;

    invoke-static {}, Landroid/os/Environment;->getDataDirectory()Ljava/io/File;

    move-result-object v1

    invoke-virtual {v1}, Ljava/io/File;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Landroid/os/StatFs;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0}, Landroid/os/StatFs;->getAvailableBlocksLong()J

    move-result-wide v1

    invoke-virtual {v0}, Landroid/os/StatFs;->getBlockSizeLong()J

    move-result-wide v3

    mul-long/2addr v1, v3

    return-wide v1
.end method

.method private getLowSpaceMessage(Lcom/motorola/ccc/ota/ui/UpdaterUtils$UpgradeInfo;Lcom/motorola/otalib/common/utils/UpgradeUtils$DownloadStatus;)Ljava/lang/String;
    .locals 22

    move-object/from16 v0, p0

    move-object/from16 v1, p2

    invoke-virtual/range {p0 .. p0}, Lcom/motorola/ccc/ota/ui/MessageActivity;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    invoke-virtual/range {p1 .. p1}, Lcom/motorola/ccc/ota/ui/UpdaterUtils$UpgradeInfo;->getExtraSize()J

    move-result-wide v3

    invoke-virtual/range {p1 .. p1}, Lcom/motorola/ccc/ota/ui/UpdaterUtils$UpgradeInfo;->getSize()J

    move-result-wide v5

    sget-object v7, Lcom/motorola/otalib/common/utils/UpgradeUtils$DownloadStatus;->STATUS_SPACE:Lcom/motorola/otalib/common/utils/UpgradeUtils$DownloadStatus;

    const v8, 0x7f0e00f3

    const-string v9, "MessageActivity.getLowSpaceMessage, requiredsize matches with availableSize, show it as 2"

    const-string v10, "OtaApp"

    const-wide/32 v11, 0x200000

    const-wide/32 v13, 0x3200000

    const v15, 0x7f0e00f4

    const-wide/16 v16, 0x0

    if-ne v1, v7, :cond_3

    invoke-static {}, Lcom/motorola/ccc/ota/ui/MessageActivity;->getAvailableDataPartitionSize()J

    move-result-wide v5

    invoke-virtual/range {p1 .. p1}, Lcom/motorola/ccc/ota/ui/UpdaterUtils$UpgradeInfo;->getSize()J

    move-result-wide v18

    invoke-static {}, Lcom/motorola/ccc/ota/utils/FileUtils;->getAvailableReserveSpace()J

    move-result-wide v20

    cmp-long v1, v3, v16

    if-gtz v1, :cond_0

    add-long v18, v18, v13

    goto :goto_0

    :cond_0
    add-long v18, v3, v18

    :goto_0
    move-wide/from16 v3, v18

    add-long v5, v5, v20

    sub-long v5, v3, v5

    invoke-static {v5, v6}, Ljava/lang/Math;->abs(J)J

    move-result-wide v5

    cmp-long v1, v5, v16

    if-nez v1, :cond_1

    invoke-static {v10, v9}, Lcom/motorola/ccc/ota/utils/Logger;->info(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_1

    :cond_1
    move-wide v11, v5

    :goto_1
    invoke-direct/range {p0 .. p0}, Lcom/motorola/ccc/ota/ui/MessageActivity;->isOtaSessionDone()Z

    move-result v1

    if-eqz v1, :cond_2

    invoke-static {v0, v3, v4}, Landroid/text/format/Formatter;->formatFileSize(Landroid/content/Context;J)Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v11, v12}, Landroid/text/format/Formatter;->formatFileSize(Landroid/content/Context;J)Ljava/lang/String;

    move-result-object v0

    filled-new-array {v1, v0}, [Ljava/lang/Object;

    move-result-object v0

    invoke-virtual {v2, v8, v0}, Landroid/content/res/Resources;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    goto/16 :goto_7

    :cond_2
    invoke-static {v0, v3, v4}, Landroid/text/format/Formatter;->formatFileSize(Landroid/content/Context;J)Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v11, v12}, Landroid/text/format/Formatter;->formatFileSize(Landroid/content/Context;J)Ljava/lang/String;

    move-result-object v0

    filled-new-array {v1, v0}, [Ljava/lang/Object;

    move-result-object v0

    invoke-virtual {v2, v15, v0}, Landroid/content/res/Resources;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    goto/16 :goto_7

    :cond_3
    sget-object v7, Lcom/motorola/otalib/common/utils/UpgradeUtils$DownloadStatus;->STATUS_SPACE_BACKGROUND_INSTALL:Lcom/motorola/otalib/common/utils/UpgradeUtils$DownloadStatus;

    const-wide/16 v18, 0x1

    if-ne v1, v7, :cond_5

    invoke-static {}, Lcom/motorola/ccc/ota/ui/MessageActivity;->getAvailableDataPartitionSize()J

    move-result-wide v3

    invoke-virtual/range {p1 .. p1}, Lcom/motorola/ccc/ota/ui/UpdaterUtils$UpgradeInfo;->getChunkSize()J

    move-result-wide v5

    cmp-long v1, v5, v16

    if-gtz v1, :cond_4

    goto :goto_2

    :cond_4
    invoke-virtual/range {p1 .. p1}, Lcom/motorola/ccc/ota/ui/UpdaterUtils$UpgradeInfo;->getChunkSize()J

    move-result-wide v16

    :goto_2
    move-wide/from16 v5, v16

    sub-long v3, v5, v3

    invoke-static {v3, v4}, Ljava/lang/Math;->abs(J)J

    move-result-wide v3

    add-long v3, v3, v18

    invoke-static {v0, v5, v6}, Landroid/text/format/Formatter;->formatFileSize(Landroid/content/Context;J)Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v3, v4}, Landroid/text/format/Formatter;->formatFileSize(Landroid/content/Context;J)Ljava/lang/String;

    move-result-object v0

    filled-new-array {v1, v0}, [Ljava/lang/Object;

    move-result-object v0

    invoke-virtual {v2, v15, v0}, Landroid/content/res/Resources;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    goto/16 :goto_7

    :cond_5
    sget-object v7, Lcom/motorola/otalib/common/utils/UpgradeUtils$DownloadStatus;->STATUS_SPACE_PAYLOAD_METADATA_CHECK:Lcom/motorola/otalib/common/utils/UpgradeUtils$DownloadStatus;

    if-ne v1, v7, :cond_8

    invoke-static {}, Lcom/motorola/ccc/ota/ui/MessageActivity;->getAvailableDataPartitionSize()J

    move-result-wide v1

    invoke-virtual/range {p1 .. p1}, Lcom/motorola/ccc/ota/ui/UpdaterUtils$UpgradeInfo;->getCompatibilityFileSize()J

    move-result-wide v3

    cmp-long v3, v3, v16

    const-wide/32 v4, 0x100000

    if-gtz v3, :cond_6

    move-wide v6, v4

    goto :goto_3

    :cond_6
    invoke-virtual/range {p1 .. p1}, Lcom/motorola/ccc/ota/ui/UpdaterUtils$UpgradeInfo;->getCompatibilityFileSize()J

    move-result-wide v6

    :goto_3
    sub-long v1, v6, v1

    invoke-static {v1, v2}, Ljava/lang/Math;->abs(J)J

    move-result-wide v1

    add-long v1, v1, v18

    cmp-long v3, v6, v4

    if-gez v3, :cond_7

    goto :goto_4

    :cond_7
    move-wide v4, v6

    :goto_4
    invoke-virtual/range {p0 .. p0}, Lcom/motorola/ccc/ota/ui/MessageActivity;->getResources()Landroid/content/res/Resources;

    move-result-object v3

    invoke-static {v0, v4, v5}, Landroid/text/format/Formatter;->formatFileSize(Landroid/content/Context;J)Ljava/lang/String;

    move-result-object v4

    invoke-static {v0, v1, v2}, Landroid/text/format/Formatter;->formatFileSize(Landroid/content/Context;J)Ljava/lang/String;

    move-result-object v0

    filled-new-array {v4, v0}, [Ljava/lang/Object;

    move-result-object v0

    invoke-virtual {v3, v15, v0}, Landroid/content/res/Resources;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    goto :goto_7

    :cond_8
    sget-object v7, Lcom/motorola/otalib/common/utils/UpgradeUtils$DownloadStatus;->STATUS_SDCARD_RESOURCES_SPACE:Lcom/motorola/otalib/common/utils/UpgradeUtils$DownloadStatus;

    if-ne v1, v7, :cond_9

    invoke-static {v0, v5, v6}, Landroid/text/format/Formatter;->formatFileSize(Landroid/content/Context;J)Ljava/lang/String;

    move-result-object v0

    filled-new-array {v0}, [Ljava/lang/Object;

    move-result-object v0

    const v1, 0x7f0e00ef

    invoke-virtual {v2, v1, v0}, Landroid/content/res/Resources;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    goto :goto_7

    :cond_9
    sget-object v5, Lcom/motorola/otalib/common/utils/UpgradeUtils$DownloadStatus;->STATUS_SPACE_INSTALL:Lcom/motorola/otalib/common/utils/UpgradeUtils$DownloadStatus;

    if-ne v1, v5, :cond_d

    invoke-static {}, Lcom/motorola/ccc/ota/ui/MessageActivity;->getAvailableDataPartitionSize()J

    move-result-wide v5

    invoke-static {}, Lcom/motorola/ccc/ota/utils/FileUtils;->getAvailableReserveSpace()J

    move-result-wide v18

    cmp-long v1, v3, v16

    if-gtz v1, :cond_a

    move-wide v3, v13

    :cond_a
    add-long v5, v5, v18

    sub-long v5, v3, v5

    invoke-static {v5, v6}, Ljava/lang/Math;->abs(J)J

    move-result-wide v5

    cmp-long v1, v5, v16

    if-nez v1, :cond_b

    invoke-static {v10, v9}, Lcom/motorola/ccc/ota/utils/Logger;->info(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_5

    :cond_b
    move-wide v11, v5

    :goto_5
    invoke-direct/range {p0 .. p0}, Lcom/motorola/ccc/ota/ui/MessageActivity;->isOtaSessionDone()Z

    move-result v1

    if-eqz v1, :cond_c

    invoke-static {v0, v3, v4}, Landroid/text/format/Formatter;->formatFileSize(Landroid/content/Context;J)Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v11, v12}, Landroid/text/format/Formatter;->formatFileSize(Landroid/content/Context;J)Ljava/lang/String;

    move-result-object v0

    filled-new-array {v1, v0}, [Ljava/lang/Object;

    move-result-object v0

    invoke-virtual {v2, v8, v0}, Landroid/content/res/Resources;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    goto :goto_6

    :cond_c
    invoke-static {v0, v3, v4}, Landroid/text/format/Formatter;->formatFileSize(Landroid/content/Context;J)Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v11, v12}, Landroid/text/format/Formatter;->formatFileSize(Landroid/content/Context;J)Ljava/lang/String;

    move-result-object v0

    filled-new-array {v1, v0}, [Ljava/lang/Object;

    move-result-object v0

    invoke-virtual {v2, v15, v0}, Landroid/content/res/Resources;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    goto :goto_7

    :cond_d
    :goto_6
    const-string v0, ""

    :goto_7
    return-object v0
.end method

.method private getLowSpaceMessage(Lcom/motorola/otalib/common/utils/UpgradeUtils$DownloadStatus;)Ljava/lang/String;
    .locals 7

    invoke-static {}, Lcom/motorola/ccc/ota/ui/MessageActivity;->getAvailableDataPartitionSize()J

    move-result-wide v0

    invoke-virtual {p0}, Lcom/motorola/ccc/ota/ui/MessageActivity;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    sget-object v3, Lcom/motorola/otalib/common/utils/UpgradeUtils$DownloadStatus;->STATUS_VAB_MAKE_SPACE_REQUEST_USER:Lcom/motorola/otalib/common/utils/UpgradeUtils$DownloadStatus;

    if-ne p1, v3, :cond_2

    invoke-static {}, Lcom/motorola/ccc/ota/utils/BuildPropReader;->isATT()Z

    move-result p1

    if-eqz p1, :cond_1

    iget-object p1, p0, Lcom/motorola/ccc/ota/ui/MessageActivity;->intent:Landroid/content/Intent;

    const-string v3, "com.motorola.blur.service.blur.upgrade.metadata"

    invoke-virtual {p1, v3}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    invoke-static {p1}, Lcom/motorola/otalib/common/metaData/builder/MetaDataBuilder;->from(Ljava/lang/String;)Lcom/motorola/otalib/common/metaData/MetaData;

    move-result-object p1

    invoke-static {p1}, Lcom/motorola/ccc/ota/ui/UpdaterUtils;->getUserdataSpaceRequired(Lcom/motorola/otalib/common/metaData/MetaData;)J

    move-result-wide v3

    invoke-static {}, Lcom/motorola/ccc/ota/utils/BuildPropReader;->isStreamingUpdate()Z

    move-result v5

    if-nez v5, :cond_0

    invoke-virtual {p1}, Lcom/motorola/otalib/common/metaData/MetaData;->getSize()J

    move-result-wide v5

    sub-long/2addr v0, v5

    :cond_0
    invoke-static {p0, v3, v4}, Landroid/text/format/Formatter;->formatFileSize(Landroid/content/Context;J)Ljava/lang/String;

    move-result-object p1

    sub-long/2addr v3, v0

    invoke-static {p0, v3, v4}, Landroid/text/format/Formatter;->formatFileSize(Landroid/content/Context;J)Ljava/lang/String;

    move-result-object p0

    filled-new-array {p1, p0}, [Ljava/lang/Object;

    move-result-object p0

    const p1, 0x7f0e00f3

    invoke-virtual {v2, p1, p0}, Landroid/content/res/Resources;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p0

    goto :goto_0

    :cond_1
    iget-object p1, p0, Lcom/motorola/ccc/ota/ui/MessageActivity;->intent:Landroid/content/Intent;

    invoke-static {p1}, Lcom/motorola/ccc/ota/utils/UpgradeUtilMethods;->getFreeSpaceFromIntent(Landroid/content/Intent;)J

    move-result-wide v3

    sub-long/2addr v3, v0

    invoke-static {p0, v3, v4}, Landroid/text/format/Formatter;->formatFileSize(Landroid/content/Context;J)Ljava/lang/String;

    move-result-object p0

    filled-new-array {p0}, [Ljava/lang/Object;

    move-result-object p0

    const p1, 0x7f0e00f6

    invoke-virtual {v2, p1, p0}, Landroid/content/res/Resources;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p0

    goto :goto_0

    :cond_2
    const-string p0, ""

    :goto_0
    return-object p0
.end method

.method private getUpdateTypeInterfaceAfterOTAUpdate()Lcom/motorola/ccc/ota/ui/updateType/UpdateType$UpdateTypeInterface;
    .locals 0

    invoke-virtual {p0}, Lcom/motorola/ccc/ota/ui/MessageActivity;->getIntent()Landroid/content/Intent;

    move-result-object p0

    invoke-static {p0}, Lcom/motorola/ccc/ota/ui/UpdaterUtils;->getUpgradeInfoAfterOTAUpdate(Landroid/content/Intent;)Lcom/motorola/ccc/ota/ui/UpdaterUtils$UpgradeInfo;

    move-result-object p0

    if-eqz p0, :cond_0

    invoke-virtual {p0}, Lcom/motorola/ccc/ota/ui/UpdaterUtils$UpgradeInfo;->getUpdateTypeData()Ljava/lang/String;

    move-result-object p0

    invoke-static {p0}, Lcom/motorola/ccc/ota/ui/updateType/UpdateType;->getUpdateType(Ljava/lang/String;)Lcom/motorola/ccc/ota/ui/updateType/UpdateType$UpdateTypeInterface;

    move-result-object p0

    return-object p0

    :cond_0
    sget-object p0, Lcom/motorola/ccc/ota/ui/updateType/UpdateType$DIFFUpdateType;->DEFAULT:Lcom/motorola/ccc/ota/ui/updateType/UpdateType$DIFFUpdateType;

    invoke-virtual {p0}, Lcom/motorola/ccc/ota/ui/updateType/UpdateType$DIFFUpdateType;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-static {p0}, Lcom/motorola/ccc/ota/ui/updateType/UpdateType;->getUpdateType(Ljava/lang/String;)Lcom/motorola/ccc/ota/ui/updateType/UpdateType$UpdateTypeInterface;

    move-result-object p0

    return-object p0
.end method

.method private getUpdateTypeInterfaceDuringOTAUpdate()Lcom/motorola/ccc/ota/ui/updateType/UpdateType$UpdateTypeInterface;
    .locals 0

    invoke-virtual {p0}, Lcom/motorola/ccc/ota/ui/MessageActivity;->getIntent()Landroid/content/Intent;

    move-result-object p0

    invoke-static {p0}, Lcom/motorola/ccc/ota/ui/UpdaterUtils;->getUpgradeInfoDuringOTAUpdate(Landroid/content/Intent;)Lcom/motorola/ccc/ota/ui/UpdaterUtils$UpgradeInfo;

    move-result-object p0

    if-eqz p0, :cond_0

    invoke-virtual {p0}, Lcom/motorola/ccc/ota/ui/UpdaterUtils$UpgradeInfo;->getUpdateTypeData()Ljava/lang/String;

    move-result-object p0

    invoke-static {p0}, Lcom/motorola/ccc/ota/ui/updateType/UpdateType;->getUpdateType(Ljava/lang/String;)Lcom/motorola/ccc/ota/ui/updateType/UpdateType$UpdateTypeInterface;

    move-result-object p0

    return-object p0

    :cond_0
    sget-object p0, Lcom/motorola/ccc/ota/ui/updateType/UpdateType$DIFFUpdateType;->DEFAULT:Lcom/motorola/ccc/ota/ui/updateType/UpdateType$DIFFUpdateType;

    invoke-virtual {p0}, Lcom/motorola/ccc/ota/ui/updateType/UpdateType$DIFFUpdateType;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-static {p0}, Lcom/motorola/ccc/ota/ui/updateType/UpdateType;->getUpdateType(Ljava/lang/String;)Lcom/motorola/ccc/ota/ui/updateType/UpdateType$UpdateTypeInterface;

    move-result-object p0

    return-object p0
.end method

.method private handleLowMemory()V
    .locals 3

    invoke-virtual {p0}, Lcom/motorola/ccc/ota/ui/MessageActivity;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    const v1, 0x7f0e01a7

    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/motorola/ccc/ota/ui/MessageActivity;->error_title:Ljava/lang/String;

    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/motorola/ccc/ota/ui/MessageActivity;->mMemoryLow:Z

    new-instance v0, Lcom/motorola/ccc/ota/ui/MessageActivity$1;

    invoke-direct {v0, p0}, Lcom/motorola/ccc/ota/ui/MessageActivity$1;-><init>(Lcom/motorola/ccc/ota/ui/MessageActivity;)V

    iput-object v0, p0, Lcom/motorola/ccc/ota/ui/MessageActivity;->mCloseSystemDialogsIntentReceiver:Landroid/content/BroadcastReceiver;

    new-instance v0, Landroid/content/IntentFilter;

    const-string v1, "android.intent.action.CLOSE_SYSTEM_DIALOGS"

    invoke-direct {v0, v1}, Landroid/content/IntentFilter;-><init>(Ljava/lang/String;)V

    iget-object v1, p0, Lcom/motorola/ccc/ota/ui/MessageActivity;->mCloseSystemDialogsIntentReceiver:Landroid/content/BroadcastReceiver;

    const/4 v2, 0x2

    invoke-virtual {p0, v1, v0, v2}, Lcom/motorola/ccc/ota/ui/MessageActivity;->registerReceiver(Landroid/content/BroadcastReceiver;Landroid/content/IntentFilter;I)Landroid/content/Intent;

    iget-object v0, p0, Lcom/motorola/ccc/ota/ui/MessageActivity;->mFinishReceiver:Landroid/content/BroadcastReceiver;

    new-instance v1, Landroid/content/IntentFilter;

    const-string v2, "com.motorola.ccc.ota.ui.finish_message_activity"

    invoke-direct {v1, v2}, Landroid/content/IntentFilter;-><init>(Ljava/lang/String;)V

    invoke-static {p0, v0, v1}, Lcom/motorola/otalib/common/utils/BroadcastUtils;->registerLocalReceiver(Landroid/content/Context;Landroid/content/BroadcastReceiver;Landroid/content/IntentFilter;)V

    return-void
.end method

.method private isOtaSessionDone()Z
    .locals 3

    iget-object v0, p0, Lcom/motorola/ccc/ota/ui/MessageActivity;->settings:Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    sget-object v1, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->TRACKINGID:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    invoke-virtual {v0, v1}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->getString(Lcom/motorola/otalib/common/settings/ISetting;)Ljava/lang/String;

    move-result-object v0

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "isOtaSessionDone, trackingId: "

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    const-string v2, "OtaApp"

    invoke-static {v2, v1}, Lcom/motorola/ccc/ota/utils/Logger;->debug(Ljava/lang/String;Ljava/lang/String;)V

    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    const/4 v1, 0x1

    if-eqz v0, :cond_0

    return v1

    :cond_0
    invoke-virtual {p0}, Lcom/motorola/ccc/ota/ui/MessageActivity;->getIntent()Landroid/content/Intent;

    move-result-object v0

    invoke-static {v0}, Lcom/motorola/ccc/ota/ui/UpdaterUtils;->isDeviceAtInstallPhase(Landroid/content/Intent;)Z

    move-result v0

    const/4 v2, 0x0

    if-eqz v0, :cond_2

    invoke-static {}, Lcom/motorola/ccc/ota/utils/BuildPropReader;->isATT()Z

    move-result v0

    if-eqz v0, :cond_1

    iget-object p0, p0, Lcom/motorola/ccc/ota/ui/MessageActivity;->settings:Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    sget-object v0, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->CHECKBOX_SELECTED:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    invoke-virtual {p0, v0, v1}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->setBoolean(Lcom/motorola/otalib/common/settings/ISetting;Z)V

    goto :goto_0

    :cond_1
    iget-object p0, p0, Lcom/motorola/ccc/ota/ui/MessageActivity;->settings:Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    sget-object v0, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->CHECKBOX_SELECTED:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    invoke-virtual {p0, v0, v2}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->setBoolean(Lcom/motorola/otalib/common/settings/ISetting;Z)V

    :cond_2
    :goto_0
    return v2
.end method

.method private isSpaceAvailable(Ljava/lang/String;J)Z
    .locals 2

    new-instance p0, Landroid/os/StatFs;

    invoke-direct {p0, p1}, Landroid/os/StatFs;-><init>(Ljava/lang/String;)V

    invoke-virtual {p0}, Landroid/os/StatFs;->getAvailableBlocksLong()J

    move-result-wide v0

    invoke-virtual {p0}, Landroid/os/StatFs;->getBlockSizeLong()J

    move-result-wide p0

    mul-long/2addr v0, p0

    cmp-long p0, v0, p2

    if-ltz p0, :cond_0

    const/4 p0, 0x1

    goto :goto_0

    :cond_0
    const/4 p0, 0x0

    :goto_0
    return p0
.end method

.method private showErrorMessage()V
    .locals 3

    new-instance v0, Lcom/motorola/ccc/ota/ui/WarningAlertDialog$WarningAlertDialogBuilder;

    const/4 v1, 0x1

    invoke-direct {v0, v1}, Lcom/motorola/ccc/ota/ui/WarningAlertDialog$WarningAlertDialogBuilder;-><init>(I)V

    iget-object v1, p0, Lcom/motorola/ccc/ota/ui/MessageActivity;->error_message:Ljava/lang/String;

    invoke-virtual {v0, v1}, Lcom/motorola/ccc/ota/ui/WarningAlertDialog$WarningAlertDialogBuilder;->setMessage(Ljava/lang/String;)Lcom/motorola/ccc/ota/ui/WarningAlertDialog$WarningAlertDialogBuilder;

    iget-object v1, p0, Lcom/motorola/ccc/ota/ui/MessageActivity;->error_title:Ljava/lang/String;

    invoke-virtual {v0, v1}, Lcom/motorola/ccc/ota/ui/WarningAlertDialog$WarningAlertDialogBuilder;->setTitle(Ljava/lang/String;)Lcom/motorola/ccc/ota/ui/WarningAlertDialog$WarningAlertDialogBuilder;

    invoke-direct {p0}, Lcom/motorola/ccc/ota/ui/MessageActivity;->getUpdateTypeInterfaceAfterOTAUpdate()Lcom/motorola/ccc/ota/ui/updateType/UpdateType$UpdateTypeInterface;

    iget-object v1, p0, Lcom/motorola/ccc/ota/ui/MessageActivity;->status:Lcom/motorola/otalib/common/utils/UpgradeUtils$DownloadStatus;

    sget-object v2, Lcom/motorola/otalib/common/utils/UpgradeUtils$DownloadStatus;->STATUS_DOWNLOAD_CANCEL_NOTIFICATION:Lcom/motorola/otalib/common/utils/UpgradeUtils$DownloadStatus;

    if-eq v1, v2, :cond_5

    iget-object v1, p0, Lcom/motorola/ccc/ota/ui/MessageActivity;->status:Lcom/motorola/otalib/common/utils/UpgradeUtils$DownloadStatus;

    sget-object v2, Lcom/motorola/otalib/common/utils/UpgradeUtils$DownloadStatus;->STATUS_INSTALL_CANCEL_NOTIFICATION:Lcom/motorola/otalib/common/utils/UpgradeUtils$DownloadStatus;

    if-ne v1, v2, :cond_0

    goto :goto_2

    :cond_0
    iget-object v1, p0, Lcom/motorola/ccc/ota/ui/MessageActivity;->status:Lcom/motorola/otalib/common/utils/UpgradeUtils$DownloadStatus;

    sget-object v2, Lcom/motorola/otalib/common/utils/UpgradeUtils$DownloadStatus;->FOTA_SHOW_ALERT_CELLULAR_POPUP:Lcom/motorola/otalib/common/utils/UpgradeUtils$DownloadStatus;

    if-ne v1, v2, :cond_1

    invoke-virtual {p0}, Lcom/motorola/ccc/ota/ui/MessageActivity;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    const v2, 0x7f0e002e

    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/motorola/ccc/ota/ui/WarningAlertDialog$WarningAlertDialogBuilder;->setPositiveText(Ljava/lang/String;)Lcom/motorola/ccc/ota/ui/WarningAlertDialog$WarningAlertDialogBuilder;

    invoke-virtual {p0}, Lcom/motorola/ccc/ota/ui/MessageActivity;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    const v2, 0x7f0e002c

    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/motorola/ccc/ota/ui/WarningAlertDialog$WarningAlertDialogBuilder;->setNegativeText(Ljava/lang/String;)Lcom/motorola/ccc/ota/ui/WarningAlertDialog$WarningAlertDialogBuilder;

    goto :goto_3

    :cond_1
    iget-boolean v1, p0, Lcom/motorola/ccc/ota/ui/MessageActivity;->mMemoryLow:Z

    if-eqz v1, :cond_4

    iget-object v1, p0, Lcom/motorola/ccc/ota/ui/MessageActivity;->status:Lcom/motorola/otalib/common/utils/UpgradeUtils$DownloadStatus;

    sget-object v2, Lcom/motorola/otalib/common/utils/UpgradeUtils$DownloadStatus;->STATUS_VAB_MAKE_SPACE_REQUEST_USER:Lcom/motorola/otalib/common/utils/UpgradeUtils$DownloadStatus;

    if-ne v1, v2, :cond_2

    const v1, 0x7f0e007d

    invoke-virtual {p0, v1}, Lcom/motorola/ccc/ota/ui/MessageActivity;->getString(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/motorola/ccc/ota/ui/WarningAlertDialog$WarningAlertDialogBuilder;->setPositiveText(Ljava/lang/String;)Lcom/motorola/ccc/ota/ui/WarningAlertDialog$WarningAlertDialogBuilder;

    invoke-direct {p0}, Lcom/motorola/ccc/ota/ui/MessageActivity;->getUpdateTypeInterfaceDuringOTAUpdate()Lcom/motorola/ccc/ota/ui/updateType/UpdateType$UpdateTypeInterface;

    goto :goto_0

    :cond_2
    const v1, 0x7f0e0121

    invoke-virtual {p0, v1}, Lcom/motorola/ccc/ota/ui/MessageActivity;->getString(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/motorola/ccc/ota/ui/WarningAlertDialog$WarningAlertDialogBuilder;->setPositiveText(Ljava/lang/String;)Lcom/motorola/ccc/ota/ui/WarningAlertDialog$WarningAlertDialogBuilder;

    :goto_0
    invoke-direct {p0}, Lcom/motorola/ccc/ota/ui/MessageActivity;->isOtaSessionDone()Z

    move-result v1

    if-eqz v1, :cond_3

    const v1, 0x7f0e00c4

    goto :goto_1

    :cond_3
    const v1, 0x7f0e0137

    :goto_1
    invoke-virtual {p0, v1}, Lcom/motorola/ccc/ota/ui/MessageActivity;->getString(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/motorola/ccc/ota/ui/WarningAlertDialog$WarningAlertDialogBuilder;->setNegativeText(Ljava/lang/String;)Lcom/motorola/ccc/ota/ui/WarningAlertDialog$WarningAlertDialogBuilder;

    goto :goto_3

    :cond_4
    const v1, 0x7f0e002d

    invoke-virtual {p0, v1}, Lcom/motorola/ccc/ota/ui/MessageActivity;->getString(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/motorola/ccc/ota/ui/WarningAlertDialog$WarningAlertDialogBuilder;->setPositiveText(Ljava/lang/String;)Lcom/motorola/ccc/ota/ui/WarningAlertDialog$WarningAlertDialogBuilder;

    goto :goto_3

    :cond_5
    :goto_2
    invoke-direct {p0}, Lcom/motorola/ccc/ota/ui/MessageActivity;->getUpdateTypeInterfaceDuringOTAUpdate()Lcom/motorola/ccc/ota/ui/updateType/UpdateType$UpdateTypeInterface;

    invoke-virtual {p0}, Lcom/motorola/ccc/ota/ui/MessageActivity;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    const v2, 0x7f0e002b

    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/motorola/ccc/ota/ui/WarningAlertDialog$WarningAlertDialogBuilder;->setPositiveText(Ljava/lang/String;)Lcom/motorola/ccc/ota/ui/WarningAlertDialog$WarningAlertDialogBuilder;

    invoke-virtual {p0}, Lcom/motorola/ccc/ota/ui/MessageActivity;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    const v2, 0x7f0e002a

    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/motorola/ccc/ota/ui/WarningAlertDialog$WarningAlertDialogBuilder;->setNegativeText(Ljava/lang/String;)Lcom/motorola/ccc/ota/ui/WarningAlertDialog$WarningAlertDialogBuilder;

    :goto_3
    const v1, 0x7f060021

    invoke-virtual {v0, v1}, Lcom/motorola/ccc/ota/ui/WarningAlertDialog$WarningAlertDialogBuilder;->setButtonColor(I)Lcom/motorola/ccc/ota/ui/WarningAlertDialog$WarningAlertDialogBuilder;

    invoke-virtual {p0}, Lcom/motorola/ccc/ota/ui/MessageActivity;->getSupportFragmentManager()Landroidx/fragment/app/FragmentManager;

    move-result-object v1

    invoke-virtual {v0}, Lcom/motorola/ccc/ota/ui/WarningAlertDialog$WarningAlertDialogBuilder;->buildDialog()Lcom/motorola/ccc/ota/ui/WarningAlertDialog;

    move-result-object v0

    iget-boolean p0, p0, Lcom/motorola/ccc/ota/ui/MessageActivity;->isTransactionSafe:Z

    if-eqz p0, :cond_6

    const-string p0, "alert"

    invoke-virtual {v0, v1, p0}, Lcom/motorola/ccc/ota/ui/WarningAlertDialog;->show(Landroidx/fragment/app/FragmentManager;Ljava/lang/String;)V

    :cond_6
    return-void
.end method


# virtual methods
.method public onCreate(Landroid/os/Bundle;)V
    .locals 5

    invoke-super {p0, p1}, Landroidx/appcompat/app/AppCompatActivity;->onCreate(Landroid/os/Bundle;)V

    invoke-virtual {p0}, Lcom/motorola/ccc/ota/ui/MessageActivity;->getIntent()Landroid/content/Intent;

    move-result-object p1

    iput-object p1, p0, Lcom/motorola/ccc/ota/ui/MessageActivity;->intent:Landroid/content/Intent;

    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/motorola/ccc/ota/ui/MessageActivity;->isTransactionSafe:Z

    invoke-static {p1}, Lcom/motorola/ccc/ota/utils/UpgradeUtilMethods;->downloadStatusFromIntent(Landroid/content/Intent;)Lcom/motorola/otalib/common/utils/UpgradeUtils$DownloadStatus;

    move-result-object p1

    iput-object p1, p0, Lcom/motorola/ccc/ota/ui/MessageActivity;->status:Lcom/motorola/otalib/common/utils/UpgradeUtils$DownloadStatus;

    new-instance p1, Ljava/lang/StringBuilder;

    const-string v1, "MessageActivity:onCreate:status:"

    invoke-direct {p1, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v1, p0, Lcom/motorola/ccc/ota/ui/MessageActivity;->status:Lcom/motorola/otalib/common/utils/UpgradeUtils$DownloadStatus;

    invoke-virtual {p1, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    const-string v1, "OtaApp"

    invoke-static {v1, p1}, Lcom/motorola/ccc/ota/utils/Logger;->debug(Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {p0}, Lcom/motorola/ccc/ota/ui/MessageActivity;->getResources()Landroid/content/res/Resources;

    move-result-object p1

    const v1, 0x7f0e00f7

    invoke-virtual {p1, v1}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object p1

    iput-object p1, p0, Lcom/motorola/ccc/ota/ui/MessageActivity;->error_title:Ljava/lang/String;

    sget-object p1, Lcom/motorola/ccc/ota/ui/MessageActivity$3;->$SwitchMap$com$motorola$otalib$common$utils$UpgradeUtils$DownloadStatus:[I

    iget-object v1, p0, Lcom/motorola/ccc/ota/ui/MessageActivity;->status:Lcom/motorola/otalib/common/utils/UpgradeUtils$DownloadStatus;

    invoke-virtual {v1}, Lcom/motorola/otalib/common/utils/UpgradeUtils$DownloadStatus;->ordinal()I

    move-result v1

    aget p1, p1, v1

    const-string v1, ""

    const v2, 0x7f0e00e2

    const/4 v3, 0x0

    const v4, 0x7f0e00f0

    packed-switch p1, :pswitch_data_0

    new-instance p0, Ljava/lang/IllegalStateException;

    invoke-direct {p0}, Ljava/lang/IllegalStateException;-><init>()V

    throw p0

    :pswitch_0
    iput-object v1, p0, Lcom/motorola/ccc/ota/ui/MessageActivity;->error_title:Ljava/lang/String;

    invoke-virtual {p0}, Lcom/motorola/ccc/ota/ui/MessageActivity;->getResources()Landroid/content/res/Resources;

    move-result-object p1

    const v0, 0x7f0e0046

    invoke-virtual {p1, v0}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object p1

    iput-object p1, p0, Lcom/motorola/ccc/ota/ui/MessageActivity;->error_message:Ljava/lang/String;

    goto/16 :goto_0

    :pswitch_1
    iput-object v1, p0, Lcom/motorola/ccc/ota/ui/MessageActivity;->error_title:Ljava/lang/String;

    invoke-virtual {p0}, Lcom/motorola/ccc/ota/ui/MessageActivity;->getResources()Landroid/content/res/Resources;

    move-result-object p1

    const v0, 0x7f0e0054

    invoke-virtual {p1, v0}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object p1

    iput-object p1, p0, Lcom/motorola/ccc/ota/ui/MessageActivity;->error_message:Ljava/lang/String;

    goto/16 :goto_0

    :pswitch_2
    invoke-virtual {p0}, Lcom/motorola/ccc/ota/ui/MessageActivity;->getResources()Landroid/content/res/Resources;

    move-result-object p1

    const v0, 0x7f0e009b

    invoke-virtual {p1, v0}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object p1

    iput-object p1, p0, Lcom/motorola/ccc/ota/ui/MessageActivity;->error_title:Ljava/lang/String;

    invoke-virtual {p0}, Lcom/motorola/ccc/ota/ui/MessageActivity;->getResources()Landroid/content/res/Resources;

    move-result-object p1

    const v0, 0x7f0e009c

    invoke-virtual {p1, v0}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object p1

    new-array v0, v3, [Ljava/lang/Object;

    invoke-static {p1, v0}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p1

    iput-object p1, p0, Lcom/motorola/ccc/ota/ui/MessageActivity;->error_message:Ljava/lang/String;

    invoke-static {}, Lcom/motorola/otalib/common/utils/BuildPropertyUtils;->isDogfoodDevice()Z

    move-result p1

    if-eqz p1, :cond_1

    new-instance p1, Ljava/lang/StringBuilder;

    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v0, p0, Lcom/motorola/ccc/ota/ui/MessageActivity;->error_message:Ljava/lang/String;

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p0}, Lcom/motorola/ccc/ota/ui/MessageActivity;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    const v1, 0x7f0e009d

    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    iput-object p1, p0, Lcom/motorola/ccc/ota/ui/MessageActivity;->error_message:Ljava/lang/String;

    goto/16 :goto_0

    :pswitch_3
    invoke-virtual {p0}, Lcom/motorola/ccc/ota/ui/MessageActivity;->getResources()Landroid/content/res/Resources;

    move-result-object p1

    const v0, 0x7f0e00bf

    invoke-virtual {p1, v0}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object p1

    iput-object p1, p0, Lcom/motorola/ccc/ota/ui/MessageActivity;->error_title:Ljava/lang/String;

    const p1, 0x7f0e00c9

    invoke-virtual {p0, p1}, Lcom/motorola/ccc/ota/ui/MessageActivity;->getString(I)Ljava/lang/String;

    move-result-object p1

    iput-object p1, p0, Lcom/motorola/ccc/ota/ui/MessageActivity;->error_message:Ljava/lang/String;

    goto/16 :goto_0

    :pswitch_4
    invoke-virtual {p0}, Lcom/motorola/ccc/ota/ui/MessageActivity;->getResources()Landroid/content/res/Resources;

    move-result-object p1

    const v0, 0x7f0e010e

    invoke-virtual {p1, v0}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object p1

    iput-object p1, p0, Lcom/motorola/ccc/ota/ui/MessageActivity;->error_title:Ljava/lang/String;

    const p1, 0x7f0e0115

    invoke-virtual {p0, p1}, Lcom/motorola/ccc/ota/ui/MessageActivity;->getString(I)Ljava/lang/String;

    move-result-object p1

    iput-object p1, p0, Lcom/motorola/ccc/ota/ui/MessageActivity;->error_message:Ljava/lang/String;

    goto/16 :goto_0

    :pswitch_5
    invoke-virtual {p0}, Lcom/motorola/ccc/ota/ui/MessageActivity;->getResources()Landroid/content/res/Resources;

    move-result-object p1

    invoke-virtual {p1, v4}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object p1

    iput-object p1, p0, Lcom/motorola/ccc/ota/ui/MessageActivity;->error_title:Ljava/lang/String;

    const p1, 0x7f0e00ec

    invoke-virtual {p0, p1}, Lcom/motorola/ccc/ota/ui/MessageActivity;->getString(I)Ljava/lang/String;

    move-result-object p1

    iput-object p1, p0, Lcom/motorola/ccc/ota/ui/MessageActivity;->error_message:Ljava/lang/String;

    goto/16 :goto_0

    :pswitch_6
    invoke-virtual {p0}, Lcom/motorola/ccc/ota/ui/MessageActivity;->getResources()Landroid/content/res/Resources;

    move-result-object p1

    invoke-virtual {p1, v4}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object p1

    iput-object p1, p0, Lcom/motorola/ccc/ota/ui/MessageActivity;->error_title:Ljava/lang/String;

    const p1, 0x7f0e00eb

    invoke-virtual {p0, p1}, Lcom/motorola/ccc/ota/ui/MessageActivity;->getString(I)Ljava/lang/String;

    move-result-object p1

    iput-object p1, p0, Lcom/motorola/ccc/ota/ui/MessageActivity;->error_message:Ljava/lang/String;

    goto/16 :goto_0

    :pswitch_7
    invoke-virtual {p0}, Lcom/motorola/ccc/ota/ui/MessageActivity;->getResources()Landroid/content/res/Resources;

    move-result-object p1

    invoke-virtual {p1, v4}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object p1

    iput-object p1, p0, Lcom/motorola/ccc/ota/ui/MessageActivity;->error_title:Ljava/lang/String;

    iget-object p1, p0, Lcom/motorola/ccc/ota/ui/MessageActivity;->intent:Landroid/content/Intent;

    invoke-static {p1}, Lcom/motorola/ccc/ota/ui/UpdaterUtils;->getUpgradeInfoAfterOTAUpdate(Landroid/content/Intent;)Lcom/motorola/ccc/ota/ui/UpdaterUtils$UpgradeInfo;

    move-result-object p1

    iget-object v0, p0, Lcom/motorola/ccc/ota/ui/MessageActivity;->status:Lcom/motorola/otalib/common/utils/UpgradeUtils$DownloadStatus;

    invoke-direct {p0, p1, v0}, Lcom/motorola/ccc/ota/ui/MessageActivity;->getLowSpaceMessage(Lcom/motorola/ccc/ota/ui/UpdaterUtils$UpgradeInfo;Lcom/motorola/otalib/common/utils/UpgradeUtils$DownloadStatus;)Ljava/lang/String;

    move-result-object p1

    iput-object p1, p0, Lcom/motorola/ccc/ota/ui/MessageActivity;->error_message:Ljava/lang/String;

    goto/16 :goto_0

    :pswitch_8
    const p1, 0x7f0e00f1

    invoke-virtual {p0, p1}, Lcom/motorola/ccc/ota/ui/MessageActivity;->getString(I)Ljava/lang/String;

    move-result-object p1

    iput-object p1, p0, Lcom/motorola/ccc/ota/ui/MessageActivity;->error_message:Ljava/lang/String;

    goto/16 :goto_0

    :pswitch_9
    invoke-virtual {p0}, Lcom/motorola/ccc/ota/ui/MessageActivity;->getResources()Landroid/content/res/Resources;

    move-result-object p1

    invoke-virtual {p1, v4}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object p1

    iput-object p1, p0, Lcom/motorola/ccc/ota/ui/MessageActivity;->error_title:Ljava/lang/String;

    const p1, 0x7f0e00ee

    invoke-virtual {p0, p1}, Lcom/motorola/ccc/ota/ui/MessageActivity;->getString(I)Ljava/lang/String;

    move-result-object p1

    iput-object p1, p0, Lcom/motorola/ccc/ota/ui/MessageActivity;->error_message:Ljava/lang/String;

    goto/16 :goto_0

    :pswitch_a
    invoke-virtual {p0}, Lcom/motorola/ccc/ota/ui/MessageActivity;->getResources()Landroid/content/res/Resources;

    move-result-object p1

    invoke-virtual {p1, v4}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object p1

    iput-object p1, p0, Lcom/motorola/ccc/ota/ui/MessageActivity;->error_title:Ljava/lang/String;

    const p1, 0x7f0e00ed

    invoke-virtual {p0, p1}, Lcom/motorola/ccc/ota/ui/MessageActivity;->getString(I)Ljava/lang/String;

    move-result-object p1

    iput-object p1, p0, Lcom/motorola/ccc/ota/ui/MessageActivity;->error_message:Ljava/lang/String;

    goto/16 :goto_0

    :pswitch_b
    const p1, 0x7f0e00f2

    invoke-virtual {p0, p1}, Lcom/motorola/ccc/ota/ui/MessageActivity;->getString(I)Ljava/lang/String;

    move-result-object p1

    iput-object p1, p0, Lcom/motorola/ccc/ota/ui/MessageActivity;->error_message:Ljava/lang/String;

    goto/16 :goto_0

    :pswitch_c
    const p1, 0x7f0e00e0

    invoke-virtual {p0, p1}, Lcom/motorola/ccc/ota/ui/MessageActivity;->getString(I)Ljava/lang/String;

    move-result-object p1

    iput-object p1, p0, Lcom/motorola/ccc/ota/ui/MessageActivity;->error_message:Ljava/lang/String;

    goto/16 :goto_0

    :pswitch_d
    iget-object p1, p0, Lcom/motorola/ccc/ota/ui/MessageActivity;->intent:Landroid/content/Intent;

    invoke-static {p1}, Lcom/motorola/ccc/ota/utils/UpgradeUtilMethods;->locationTypeFromIntent(Landroid/content/Intent;)Ljava/lang/String;

    move-result-object p1

    const-string v0, "sdcard"

    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_0

    const p1, 0x7f0e00e7

    invoke-virtual {p0, p1}, Lcom/motorola/ccc/ota/ui/MessageActivity;->getString(I)Ljava/lang/String;

    move-result-object p1

    iput-object p1, p0, Lcom/motorola/ccc/ota/ui/MessageActivity;->error_message:Ljava/lang/String;

    goto/16 :goto_0

    :cond_0
    const p1, 0x7f0e00e6

    invoke-virtual {p0, p1}, Lcom/motorola/ccc/ota/ui/MessageActivity;->getString(I)Ljava/lang/String;

    move-result-object p1

    iput-object p1, p0, Lcom/motorola/ccc/ota/ui/MessageActivity;->error_message:Ljava/lang/String;

    goto/16 :goto_0

    :pswitch_e
    invoke-virtual {p0}, Lcom/motorola/ccc/ota/ui/MessageActivity;->getResources()Landroid/content/res/Resources;

    move-result-object p1

    const v0, 0x7f0e00e5

    invoke-virtual {p1, v0}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object p1

    iput-object p1, p0, Lcom/motorola/ccc/ota/ui/MessageActivity;->error_title:Ljava/lang/String;

    invoke-virtual {p0}, Lcom/motorola/ccc/ota/ui/MessageActivity;->getResources()Landroid/content/res/Resources;

    move-result-object p1

    invoke-static {}, Lcom/motorola/ccc/ota/utils/BuildPropReader;->getModel()Ljava/lang/String;

    move-result-object v0

    filled-new-array {v0}, [Ljava/lang/Object;

    move-result-object v0

    invoke-virtual {p1, v2, v0}, Landroid/content/res/Resources;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p1

    new-array v0, v3, [Ljava/lang/Object;

    invoke-static {p1, v0}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p1

    iput-object p1, p0, Lcom/motorola/ccc/ota/ui/MessageActivity;->error_message:Ljava/lang/String;

    goto/16 :goto_0

    :pswitch_f
    invoke-virtual {p0}, Lcom/motorola/ccc/ota/ui/MessageActivity;->getResources()Landroid/content/res/Resources;

    move-result-object p1

    invoke-static {}, Lcom/motorola/ccc/ota/utils/BuildPropReader;->getModel()Ljava/lang/String;

    move-result-object v0

    filled-new-array {v0}, [Ljava/lang/Object;

    move-result-object v0

    invoke-virtual {p1, v2, v0}, Landroid/content/res/Resources;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p1

    new-array v0, v3, [Ljava/lang/Object;

    invoke-static {p1, v0}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p1

    iput-object p1, p0, Lcom/motorola/ccc/ota/ui/MessageActivity;->error_message:Ljava/lang/String;

    goto/16 :goto_0

    :pswitch_10
    const p1, 0x7f0e00f8

    invoke-virtual {p0, p1}, Lcom/motorola/ccc/ota/ui/MessageActivity;->getString(I)Ljava/lang/String;

    move-result-object p1

    iput-object p1, p0, Lcom/motorola/ccc/ota/ui/MessageActivity;->error_message:Ljava/lang/String;

    goto/16 :goto_0

    :pswitch_11
    const p1, 0x7f0e00e8

    invoke-virtual {p0, p1}, Lcom/motorola/ccc/ota/ui/MessageActivity;->getString(I)Ljava/lang/String;

    move-result-object p1

    iput-object p1, p0, Lcom/motorola/ccc/ota/ui/MessageActivity;->error_message:Ljava/lang/String;

    goto/16 :goto_0

    :pswitch_12
    const p1, 0x7f0e00e1

    invoke-virtual {p0, p1}, Lcom/motorola/ccc/ota/ui/MessageActivity;->getString(I)Ljava/lang/String;

    move-result-object p1

    iput-object p1, p0, Lcom/motorola/ccc/ota/ui/MessageActivity;->error_message:Ljava/lang/String;

    goto/16 :goto_0

    :pswitch_13
    const p1, 0x7f0e00e9

    invoke-virtual {p0, p1}, Lcom/motorola/ccc/ota/ui/MessageActivity;->getString(I)Ljava/lang/String;

    move-result-object p1

    iput-object p1, p0, Lcom/motorola/ccc/ota/ui/MessageActivity;->error_message:Ljava/lang/String;

    goto :goto_0

    :pswitch_14
    const p1, 0x7f0e00ea

    invoke-virtual {p0, p1}, Lcom/motorola/ccc/ota/ui/MessageActivity;->getString(I)Ljava/lang/String;

    move-result-object p1

    iput-object p1, p0, Lcom/motorola/ccc/ota/ui/MessageActivity;->error_message:Ljava/lang/String;

    goto :goto_0

    :pswitch_15
    const p1, 0x7f0e00ba

    invoke-virtual {p0, p1}, Lcom/motorola/ccc/ota/ui/MessageActivity;->getString(I)Ljava/lang/String;

    move-result-object p1

    iput-object p1, p0, Lcom/motorola/ccc/ota/ui/MessageActivity;->error_title:Ljava/lang/String;

    invoke-virtual {p0}, Lcom/motorola/ccc/ota/ui/MessageActivity;->getIntent()Landroid/content/Intent;

    move-result-object p1

    invoke-static {p1}, Lcom/motorola/ccc/ota/ui/UpdaterUtils;->getUpgradeInfoDuringOTAUpdate(Landroid/content/Intent;)Lcom/motorola/ccc/ota/ui/UpdaterUtils$UpgradeInfo;

    move-result-object p1

    invoke-virtual {p1}, Lcom/motorola/ccc/ota/ui/UpdaterUtils$UpgradeInfo;->getminBatteryRequiredForInstall()I

    move-result p1

    invoke-static {p1}, Lcom/motorola/ccc/ota/ui/UpdaterUtils;->getminBatteryRequiredForInstall(I)I

    move-result p1

    invoke-static {}, Ljava/text/NumberFormat;->getPercentInstance()Ljava/text/NumberFormat;

    move-result-object v0

    int-to-float p1, p1

    const/high16 v1, 0x42c80000    # 100.0f

    div-float/2addr p1, v1

    float-to-double v1, p1

    invoke-virtual {v0, v1, v2}, Ljava/text/NumberFormat;->format(D)Ljava/lang/String;

    move-result-object p1

    const v0, 0x7f0e0120

    filled-new-array {p1}, [Ljava/lang/Object;

    move-result-object p1

    invoke-virtual {p0, v0, p1}, Lcom/motorola/ccc/ota/ui/MessageActivity;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p1

    iput-object p1, p0, Lcom/motorola/ccc/ota/ui/MessageActivity;->error_message:Ljava/lang/String;

    invoke-static {}, Lcom/motorola/ccc/ota/ui/UpdaterUtils;->enableReceiversForBatteryLow()V

    goto :goto_0

    :pswitch_16
    invoke-direct {p0}, Lcom/motorola/ccc/ota/ui/MessageActivity;->handleLowMemory()V

    iget-object p1, p0, Lcom/motorola/ccc/ota/ui/MessageActivity;->status:Lcom/motorola/otalib/common/utils/UpgradeUtils$DownloadStatus;

    invoke-direct {p0, p1}, Lcom/motorola/ccc/ota/ui/MessageActivity;->getLowSpaceMessage(Lcom/motorola/otalib/common/utils/UpgradeUtils$DownloadStatus;)Ljava/lang/String;

    move-result-object p1

    iput-object p1, p0, Lcom/motorola/ccc/ota/ui/MessageActivity;->error_message:Ljava/lang/String;

    goto :goto_0

    :pswitch_17
    invoke-virtual {p0}, Lcom/motorola/ccc/ota/ui/MessageActivity;->getResources()Landroid/content/res/Resources;

    move-result-object p1

    const v1, 0x7f0e01a7

    invoke-virtual {p1, v1}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object p1

    iput-object p1, p0, Lcom/motorola/ccc/ota/ui/MessageActivity;->error_title:Ljava/lang/String;

    iput-boolean v0, p0, Lcom/motorola/ccc/ota/ui/MessageActivity;->mMemoryLow:Z

    iget-object p1, p0, Lcom/motorola/ccc/ota/ui/MessageActivity;->intent:Landroid/content/Intent;

    invoke-static {p1}, Lcom/motorola/ccc/ota/ui/UpdaterUtils;->getUpgradeInfoAfterOTAUpdate(Landroid/content/Intent;)Lcom/motorola/ccc/ota/ui/UpdaterUtils$UpgradeInfo;

    move-result-object p1

    invoke-direct {p0}, Lcom/motorola/ccc/ota/ui/MessageActivity;->handleLowMemory()V

    iget-object v0, p0, Lcom/motorola/ccc/ota/ui/MessageActivity;->status:Lcom/motorola/otalib/common/utils/UpgradeUtils$DownloadStatus;

    invoke-direct {p0, p1, v0}, Lcom/motorola/ccc/ota/ui/MessageActivity;->getLowSpaceMessage(Lcom/motorola/ccc/ota/ui/UpdaterUtils$UpgradeInfo;Lcom/motorola/otalib/common/utils/UpgradeUtils$DownloadStatus;)Ljava/lang/String;

    move-result-object p1

    iput-object p1, p0, Lcom/motorola/ccc/ota/ui/MessageActivity;->error_message:Ljava/lang/String;

    :cond_1
    :goto_0
    invoke-direct {p0}, Lcom/motorola/ccc/ota/ui/MessageActivity;->showErrorMessage()V

    return-void

    nop

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_17
        :pswitch_17
        :pswitch_17
        :pswitch_17
        :pswitch_16
        :pswitch_15
        :pswitch_14
        :pswitch_14
        :pswitch_14
        :pswitch_13
        :pswitch_12
        :pswitch_11
        :pswitch_10
        :pswitch_f
        :pswitch_e
        :pswitch_d
        :pswitch_c
        :pswitch_b
        :pswitch_a
        :pswitch_9
        :pswitch_8
        :pswitch_7
        :pswitch_6
        :pswitch_5
        :pswitch_4
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method public onDestroy()V
    .locals 2

    invoke-super {p0}, Landroidx/appcompat/app/AppCompatActivity;->onDestroy()V

    iget-boolean v0, p0, Lcom/motorola/ccc/ota/ui/MessageActivity;->mMemoryLow:Z

    if-eqz v0, :cond_2

    invoke-static {}, Lcom/motorola/ccc/ota/utils/BuildPropReader;->isATT()Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/motorola/ccc/ota/ui/MessageActivity;->error_message:Ljava/lang/String;

    invoke-static {v0}, Lcom/motorola/ccc/ota/utils/NotificationUtils;->showLowMemoryNotification(Ljava/lang/String;)V

    :cond_0
    invoke-direct {p0}, Lcom/motorola/ccc/ota/ui/MessageActivity;->isOtaSessionDone()Z

    move-result v0

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/motorola/ccc/ota/ui/MessageActivity;->settings:Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    sget-object v1, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->DATA_SPACE_RETRY_COUNT:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    invoke-virtual {v0, v1}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->removeConfig(Lcom/motorola/otalib/common/settings/ISetting;)V

    invoke-static {p0}, Lcom/motorola/ccc/ota/utils/NotificationUtils;->stopNotificationService(Landroid/content/Context;)V

    goto :goto_0

    :cond_1
    iget-object v0, p0, Lcom/motorola/ccc/ota/ui/MessageActivity;->settings:Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    sget-object v1, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->DATA_SPACE_RETRY_COUNT:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    invoke-virtual {v0, v1}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->incrementPrefs(Lcom/motorola/otalib/common/settings/ISetting;)V

    invoke-virtual {p0}, Lcom/motorola/ccc/ota/ui/MessageActivity;->getIntent()Landroid/content/Intent;

    move-result-object v0

    invoke-static {p0, v0}, Lcom/motorola/ccc/ota/utils/NotificationUtils;->showOtaLowMemoryNotification(Landroid/content/Context;Landroid/content/Intent;)V

    :cond_2
    :goto_0
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/motorola/ccc/ota/ui/MessageActivity;->mMemoryLow:Z

    iget-object v0, p0, Lcom/motorola/ccc/ota/ui/MessageActivity;->mCloseSystemDialogsIntentReceiver:Landroid/content/BroadcastReceiver;

    if-eqz v0, :cond_3

    invoke-virtual {p0, v0}, Lcom/motorola/ccc/ota/ui/MessageActivity;->unregisterReceiver(Landroid/content/BroadcastReceiver;)V

    :cond_3
    iget-object v0, p0, Lcom/motorola/ccc/ota/ui/MessageActivity;->mFinishReceiver:Landroid/content/BroadcastReceiver;

    invoke-static {p0, v0}, Lcom/motorola/otalib/common/utils/BroadcastUtils;->unregisterLocalReceiver(Landroid/content/Context;Landroid/content/BroadcastReceiver;)V

    return-void
.end method

.method public onDismiss(IZ)V
    .locals 0

    if-eqz p2, :cond_0

    invoke-virtual {p0}, Lcom/motorola/ccc/ota/ui/MessageActivity;->finish()V

    :cond_0
    invoke-static {p0}, Lcom/motorola/ccc/ota/ui/UpdaterUtils;->stopDownloadProgressActivity(Landroid/content/Context;)V

    return-void
.end method

.method public onNegativeClick(I)V
    .locals 1

    sget-object p1, Lcom/motorola/otalib/common/utils/UpgradeUtils$DownloadStatus;->STATUS_INSTALL_CANCEL_NOTIFICATION:Lcom/motorola/otalib/common/utils/UpgradeUtils$DownloadStatus;

    iget-object v0, p0, Lcom/motorola/ccc/ota/ui/MessageActivity;->status:Lcom/motorola/otalib/common/utils/UpgradeUtils$DownloadStatus;

    invoke-virtual {p1, v0}, Lcom/motorola/otalib/common/utils/UpgradeUtils$DownloadStatus;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_0

    sget-object p1, Lcom/motorola/otalib/common/utils/UpgradeUtils$DownloadStatus;->STATUS_INSTALL_CANCEL:Lcom/motorola/otalib/common/utils/UpgradeUtils$DownloadStatus;

    invoke-static {p0, p1}, Lcom/motorola/ccc/ota/utils/UpgradeUtilMethods;->sendUserResponseDuringBackgroundInstallation(Landroid/content/Context;Lcom/motorola/otalib/common/utils/UpgradeUtils$DownloadStatus;)V

    goto :goto_0

    :cond_0
    sget-object p1, Lcom/motorola/otalib/common/utils/UpgradeUtils$DownloadStatus;->STATUS_DOWNLOAD_CANCEL_NOTIFICATION:Lcom/motorola/otalib/common/utils/UpgradeUtils$DownloadStatus;

    iget-object v0, p0, Lcom/motorola/ccc/ota/ui/MessageActivity;->status:Lcom/motorola/otalib/common/utils/UpgradeUtils$DownloadStatus;

    invoke-virtual {p1, v0}, Lcom/motorola/otalib/common/utils/UpgradeUtils$DownloadStatus;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_1

    sget-object p1, Lcom/motorola/otalib/common/utils/UpgradeUtils$DownloadStatus;->STATUS_CANCEL:Lcom/motorola/otalib/common/utils/UpgradeUtils$DownloadStatus;

    invoke-static {p0, p1}, Lcom/motorola/ccc/ota/utils/UpgradeUtilMethods;->sendDownloadNotificationResponse(Landroid/content/Context;Lcom/motorola/otalib/common/utils/UpgradeUtils$DownloadStatus;)V

    :cond_1
    :goto_0
    invoke-virtual {p0}, Lcom/motorola/ccc/ota/ui/MessageActivity;->finish()V

    invoke-static {p0}, Lcom/motorola/ccc/ota/ui/UpdaterUtils;->stopDownloadProgressActivity(Landroid/content/Context;)V

    return-void
.end method

.method protected onPause()V
    .locals 1

    invoke-super {p0}, Landroidx/appcompat/app/AppCompatActivity;->onPause()V

    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/motorola/ccc/ota/ui/MessageActivity;->isTransactionSafe:Z

    return-void
.end method

.method public onPositiveClick(ILorg/json/JSONObject;)V
    .locals 1

    iget-boolean p1, p0, Lcom/motorola/ccc/ota/ui/MessageActivity;->mMemoryLow:Z

    if-eqz p1, :cond_0

    new-instance p1, Landroid/content/Intent;

    const-string p2, "android.settings.INTERNAL_STORAGE_SETTINGS"

    invoke-direct {p1, p2}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    invoke-virtual {p0, p1}, Lcom/motorola/ccc/ota/ui/MessageActivity;->startActivity(Landroid/content/Intent;)V

    invoke-virtual {p0}, Lcom/motorola/ccc/ota/ui/MessageActivity;->finish()V

    goto :goto_1

    :cond_0
    iget-object p1, p0, Lcom/motorola/ccc/ota/ui/MessageActivity;->status:Lcom/motorola/otalib/common/utils/UpgradeUtils$DownloadStatus;

    sget-object p2, Lcom/motorola/otalib/common/utils/UpgradeUtils$DownloadStatus;->STATUS_MISMATCH:Lcom/motorola/otalib/common/utils/UpgradeUtils$DownloadStatus;

    if-ne p1, p2, :cond_1

    const/4 p1, 0x0

    const/16 p2, 0xa

    invoke-static {p0, p1, p2}, Lcom/motorola/ccc/ota/utils/UpgradeUtilMethods;->sendCheckForUpdate(Landroid/content/Context;ZI)V

    goto :goto_0

    :cond_1
    iget-object p1, p0, Lcom/motorola/ccc/ota/ui/MessageActivity;->status:Lcom/motorola/otalib/common/utils/UpgradeUtils$DownloadStatus;

    sget-object p2, Lcom/motorola/otalib/common/utils/UpgradeUtils$DownloadStatus;->LOW_BATTERY_INSTALL:Lcom/motorola/otalib/common/utils/UpgradeUtils$DownloadStatus;

    if-ne p1, p2, :cond_2

    iget-object p1, p0, Lcom/motorola/ccc/ota/ui/MessageActivity;->settings:Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    sget-object p2, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->BATTERY_LOW:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    const/4 v0, 0x1

    invoke-virtual {p1, p2, v0}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->setBoolean(Lcom/motorola/otalib/common/settings/ISetting;Z)V

    invoke-static {}, Lcom/motorola/ccc/ota/ui/UpdaterUtils;->checkAndEnableBatteryStatusReceiver()Z

    invoke-static {}, Lcom/motorola/ccc/ota/ui/UpdaterUtils;->checkAndEnablePowerDownReceiver()Z

    goto :goto_0

    :cond_2
    iget-object p1, p0, Lcom/motorola/ccc/ota/ui/MessageActivity;->status:Lcom/motorola/otalib/common/utils/UpgradeUtils$DownloadStatus;

    sget-object p2, Lcom/motorola/otalib/common/utils/UpgradeUtils$DownloadStatus;->FOTA_SHOW_ALERT_CELLULAR_POPUP:Lcom/motorola/otalib/common/utils/UpgradeUtils$DownloadStatus;

    if-ne p1, p2, :cond_3

    iget-object p1, p0, Lcom/motorola/ccc/ota/ui/MessageActivity;->settings:Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    sget-object p2, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->USER_AUTO_DOWNLOAD_OPTION:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    sget-object v0, Lcom/motorola/ccc/ota/sources/fota/FotaConstants$AutoDownloadOption;->OTAorWiFi:Lcom/motorola/ccc/ota/sources/fota/FotaConstants$AutoDownloadOption;

    invoke-virtual {v0}, Lcom/motorola/ccc/ota/sources/fota/FotaConstants$AutoDownloadOption;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1, p2, v0}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->setString(Lcom/motorola/otalib/common/settings/ISetting;Ljava/lang/String;)V

    invoke-static {}, Lcom/motorola/ccc/ota/utils/BuildPropReader;->isFotaATT()Z

    move-result p1

    if-eqz p1, :cond_3

    sget-object p1, Lcom/motorola/ccc/ota/sources/fota/FotaConstants$AutoDownloadOption;->OTAorWiFi:Lcom/motorola/ccc/ota/sources/fota/FotaConstants$AutoDownloadOption;

    invoke-static {p0, p1}, Lcom/motorola/ccc/ota/env/AndroidFotaInterface;->sendAutoDownloadSettingsToFota(Landroid/content/Context;Lcom/motorola/ccc/ota/sources/fota/FotaConstants$AutoDownloadOption;)V

    :cond_3
    :goto_0
    invoke-virtual {p0}, Lcom/motorola/ccc/ota/ui/MessageActivity;->finish()V

    :goto_1
    invoke-static {p0}, Lcom/motorola/ccc/ota/ui/UpdaterUtils;->stopDownloadProgressActivity(Landroid/content/Context;)V

    return-void
.end method

.method protected onResume()V
    .locals 1

    invoke-super {p0}, Landroidx/appcompat/app/AppCompatActivity;->onResume()V

    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/motorola/ccc/ota/ui/MessageActivity;->isTransactionSafe:Z

    return-void
.end method

.method protected onStop()V
    .locals 2

    new-instance v0, Landroid/content/Intent;

    const-string v1, "com.motorola.blur.updater.FAILURE_DIALOG_CLEARED"

    invoke-direct {v0, v1}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    const-string v1, "com.motorola.ccc.ota.Permissions.INTERACT_OTA_SERVICE"

    invoke-virtual {p0, v0, v1}, Lcom/motorola/ccc/ota/ui/MessageActivity;->sendBroadcast(Landroid/content/Intent;Ljava/lang/String;)V

    invoke-super {p0}, Landroidx/appcompat/app/AppCompatActivity;->onStop()V

    return-void
.end method
