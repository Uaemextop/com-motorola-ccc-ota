.class Lcom/motorola/ccc/ota/sources/sdcard/SDCardDownloadHandler$1;
.super Ljava/lang/Object;
.source "SDCardDownloadHandler.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/motorola/ccc/ota/sources/sdcard/SDCardDownloadHandler;->copyFromSdCard(Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database$Descriptor;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/motorola/ccc/ota/sources/sdcard/SDCardDownloadHandler;

.field final synthetic val$dest:Ljava/lang/String;

.field final synthetic val$repo:Ljava/lang/String;

.field final synthetic val$size:J

.field final synthetic val$src:Ljava/lang/String;

.field final synthetic val$version:Ljava/lang/String;


# direct methods
.method constructor <init>(Lcom/motorola/ccc/ota/sources/sdcard/SDCardDownloadHandler;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;JLjava/lang/String;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    iput-object p1, p0, Lcom/motorola/ccc/ota/sources/sdcard/SDCardDownloadHandler$1;->this$0:Lcom/motorola/ccc/ota/sources/sdcard/SDCardDownloadHandler;

    iput-object p2, p0, Lcom/motorola/ccc/ota/sources/sdcard/SDCardDownloadHandler$1;->val$repo:Ljava/lang/String;

    iput-object p3, p0, Lcom/motorola/ccc/ota/sources/sdcard/SDCardDownloadHandler$1;->val$src:Ljava/lang/String;

    iput-object p4, p0, Lcom/motorola/ccc/ota/sources/sdcard/SDCardDownloadHandler$1;->val$dest:Ljava/lang/String;

    iput-wide p5, p0, Lcom/motorola/ccc/ota/sources/sdcard/SDCardDownloadHandler$1;->val$size:J

    iput-object p7, p0, Lcom/motorola/ccc/ota/sources/sdcard/SDCardDownloadHandler$1;->val$version:Ljava/lang/String;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 19

    move-object/from16 v1, p0

    const-string v0, " size "

    const-string v2, " to "

    const-string v3, "OtaApp"

    const-string v4, "SDCardUpgradeSource.copyFromSdCard.Runnable.run: copying for Repo: "

    const/4 v5, 0x0

    const/4 v6, 0x0

    :try_start_0
    iget-object v7, v1, Lcom/motorola/ccc/ota/sources/sdcard/SDCardDownloadHandler$1;->this$0:Lcom/motorola/ccc/ota/sources/sdcard/SDCardDownloadHandler;

    invoke-static {v7}, Lcom/motorola/ccc/ota/sources/sdcard/SDCardDownloadHandler;->-$$Nest$fgetmanager(Lcom/motorola/ccc/ota/sources/sdcard/SDCardDownloadHandler;)Landroid/os/PowerManager;

    move-result-object v7

    const/4 v8, 0x1

    invoke-virtual {v7, v8, v3}, Landroid/os/PowerManager;->newWakeLock(ILjava/lang/String;)Landroid/os/PowerManager$WakeLock;

    move-result-object v7
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_1
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    :try_start_1
    invoke-virtual {v7}, Landroid/os/PowerManager$WakeLock;->acquire()V

    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v4, v1, Lcom/motorola/ccc/ota/sources/sdcard/SDCardDownloadHandler$1;->val$repo:Ljava/lang/String;

    invoke-virtual {v8, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v8, " from "

    invoke-virtual {v4, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    iget-object v8, v1, Lcom/motorola/ccc/ota/sources/sdcard/SDCardDownloadHandler$1;->val$src:Ljava/lang/String;

    invoke-virtual {v4, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    iget-object v8, v1, Lcom/motorola/ccc/ota/sources/sdcard/SDCardDownloadHandler$1;->val$dest:Ljava/lang/String;

    invoke-virtual {v4, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v8, " of size "

    invoke-virtual {v4, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    iget-wide v8, v1, Lcom/motorola/ccc/ota/sources/sdcard/SDCardDownloadHandler$1;->val$size:J

    invoke-virtual {v4, v8, v9}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Lcom/motorola/ccc/ota/utils/Logger;->info(Ljava/lang/String;Ljava/lang/String;)V

    iget-object v4, v1, Lcom/motorola/ccc/ota/sources/sdcard/SDCardDownloadHandler$1;->val$dest:Ljava/lang/String;

    invoke-static {v4}, Lcom/motorola/ccc/ota/utils/FileUtils;->getFileSize(Ljava/lang/String;)J

    move-result-wide v15

    iget-object v4, v1, Lcom/motorola/ccc/ota/sources/sdcard/SDCardDownloadHandler$1;->this$0:Lcom/motorola/ccc/ota/sources/sdcard/SDCardDownloadHandler;

    invoke-static {v4}, Lcom/motorola/ccc/ota/sources/sdcard/SDCardDownloadHandler;->-$$Nest$fget_env(Lcom/motorola/ccc/ota/sources/sdcard/SDCardDownloadHandler;)Lcom/motorola/otalib/common/Environment/ApplicationEnv;

    move-result-object v4

    invoke-interface {v4}, Lcom/motorola/otalib/common/Environment/ApplicationEnv;->getUtilities()Lcom/motorola/otalib/common/Environment/ApplicationEnv$Utilities;

    move-result-object v8

    iget-object v9, v1, Lcom/motorola/ccc/ota/sources/sdcard/SDCardDownloadHandler$1;->val$version:Ljava/lang/String;

    iget-wide v12, v1, Lcom/motorola/ccc/ota/sources/sdcard/SDCardDownloadHandler$1;->val$size:J

    iget-object v14, v1, Lcom/motorola/ccc/ota/sources/sdcard/SDCardDownloadHandler$1;->val$repo:Ljava/lang/String;

    move-wide v10, v15

    invoke-interface/range {v8 .. v14}, Lcom/motorola/otalib/common/Environment/ApplicationEnv$Utilities;->sendUpdateDownloadStatusProgress(Ljava/lang/String;JJLjava/lang/String;)V

    :goto_0
    iget-wide v8, v1, Lcom/motorola/ccc/ota/sources/sdcard/SDCardDownloadHandler$1;->val$size:J

    cmp-long v4, v15, v8

    if-gez v4, :cond_2

    sub-long/2addr v8, v15

    const-wide/32 v10, 0x100000

    cmp-long v4, v8, v10

    if-lez v4, :cond_0

    move-wide/from16 v17, v10

    goto :goto_1

    :cond_0
    move-wide/from16 v17, v8

    :goto_1
    iget-object v8, v1, Lcom/motorola/ccc/ota/sources/sdcard/SDCardDownloadHandler$1;->val$src:Ljava/lang/String;

    iget-object v9, v1, Lcom/motorola/ccc/ota/sources/sdcard/SDCardDownloadHandler$1;->val$dest:Ljava/lang/String;

    move-wide v10, v15

    move-wide/from16 v12, v17

    invoke-static/range {v8 .. v13}, Lcom/motorola/ccc/ota/utils/FileUtils;->copy(Ljava/lang/String;Ljava/lang/String;JJ)Ljava/lang/String;

    move-result-object v6

    if-eqz v6, :cond_1

    goto :goto_2

    :cond_1
    add-long v15, v15, v17

    iget-object v4, v1, Lcom/motorola/ccc/ota/sources/sdcard/SDCardDownloadHandler$1;->this$0:Lcom/motorola/ccc/ota/sources/sdcard/SDCardDownloadHandler;

    invoke-static {v4}, Lcom/motorola/ccc/ota/sources/sdcard/SDCardDownloadHandler;->-$$Nest$fget_env(Lcom/motorola/ccc/ota/sources/sdcard/SDCardDownloadHandler;)Lcom/motorola/otalib/common/Environment/ApplicationEnv;

    move-result-object v4

    invoke-interface {v4}, Lcom/motorola/otalib/common/Environment/ApplicationEnv;->getUtilities()Lcom/motorola/otalib/common/Environment/ApplicationEnv$Utilities;

    move-result-object v8

    iget-object v9, v1, Lcom/motorola/ccc/ota/sources/sdcard/SDCardDownloadHandler$1;->val$version:Ljava/lang/String;

    iget-wide v12, v1, Lcom/motorola/ccc/ota/sources/sdcard/SDCardDownloadHandler$1;->val$size:J

    iget-object v14, v1, Lcom/motorola/ccc/ota/sources/sdcard/SDCardDownloadHandler$1;->val$repo:Ljava/lang/String;

    move-wide v10, v15

    invoke-interface/range {v8 .. v14}, Lcom/motorola/otalib/common/Environment/ApplicationEnv$Utilities;->sendUpdateDownloadStatusProgress(Ljava/lang/String;JJLjava/lang/String;)V

    goto :goto_0

    :cond_2
    :goto_2
    if-nez v6, :cond_3

    new-instance v4, Ljava/io/File;

    iget-object v8, v1, Lcom/motorola/ccc/ota/sources/sdcard/SDCardDownloadHandler$1;->val$dest:Ljava/lang/String;

    invoke-direct {v4, v8}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-virtual {v4}, Ljava/io/File;->length()J

    move-result-wide v8

    iget-wide v10, v1, Lcom/motorola/ccc/ota/sources/sdcard/SDCardDownloadHandler$1;->val$size:J

    cmp-long v8, v8, v10

    if-eqz v8, :cond_3

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "File size missmatch [source "

    invoke-virtual {v6, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    iget-object v8, v1, Lcom/motorola/ccc/ota/sources/sdcard/SDCardDownloadHandler$1;->val$src:Ljava/lang/String;

    invoke-virtual {v6, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    iget-wide v8, v1, Lcom/motorola/ccc/ota/sources/sdcard/SDCardDownloadHandler$1;->val$size:J

    invoke-virtual {v6, v8, v9}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string v8, " ] [ destination "

    invoke-virtual {v6, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    iget-object v8, v1, Lcom/motorola/ccc/ota/sources/sdcard/SDCardDownloadHandler$1;->val$dest:Ljava/lang/String;

    invoke-virtual {v6, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v4}, Ljava/io/File;->length()J

    move-result-wide v8

    invoke-virtual {v0, v8, v9}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v4, " ]"

    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    :cond_3
    if-eqz v6, :cond_4

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "SDCardUpgradeSource.copyFromSdCard.Runnable.run: "

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v3, v0}, Lcom/motorola/ccc/ota/utils/Logger;->error(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_3

    :cond_4
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "SDCardUpgradeSource.copyFromSdCard.Runnable.run: copy from "

    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v4, v1, Lcom/motorola/ccc/ota/sources/sdcard/SDCardDownloadHandler$1;->val$src:Ljava/lang/String;

    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v2, v1, Lcom/motorola/ccc/ota/sources/sdcard/SDCardDownloadHandler$1;->val$dest:Ljava/lang/String;

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v2, " is successful"

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v3, v0}, Lcom/motorola/ccc/ota/utils/Logger;->info(Ljava/lang/String;Ljava/lang/String;)V

    :goto_3
    iget-object v0, v1, Lcom/motorola/ccc/ota/sources/sdcard/SDCardDownloadHandler$1;->this$0:Lcom/motorola/ccc/ota/sources/sdcard/SDCardDownloadHandler;

    invoke-static {v0}, Lcom/motorola/ccc/ota/sources/sdcard/SDCardDownloadHandler;->-$$Nest$fget_env(Lcom/motorola/ccc/ota/sources/sdcard/SDCardDownloadHandler;)Lcom/motorola/otalib/common/Environment/ApplicationEnv;

    move-result-object v0

    invoke-interface {v0}, Lcom/motorola/otalib/common/Environment/ApplicationEnv;->getUtilities()Lcom/motorola/otalib/common/Environment/ApplicationEnv$Utilities;

    move-result-object v0

    iget-object v2, v1, Lcom/motorola/ccc/ota/sources/sdcard/SDCardDownloadHandler$1;->val$version:Ljava/lang/String;

    sget-object v3, Lcom/motorola/ccc/ota/sources/UpgradeSourceType;->sdcard:Lcom/motorola/ccc/ota/sources/UpgradeSourceType;

    invoke-virtual {v3}, Lcom/motorola/ccc/ota/sources/UpgradeSourceType;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-interface {v0, v2, v3, v6}, Lcom/motorola/otalib/common/Environment/ApplicationEnv$Utilities;->sendInternalNotification(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    iget-object v0, v1, Lcom/motorola/ccc/ota/sources/sdcard/SDCardDownloadHandler$1;->this$0:Lcom/motorola/ccc/ota/sources/sdcard/SDCardDownloadHandler;

    invoke-static {v0, v5}, Lcom/motorola/ccc/ota/sources/sdcard/SDCardDownloadHandler;->-$$Nest$fput_isCopying(Lcom/motorola/ccc/ota/sources/sdcard/SDCardDownloadHandler;Z)V

    if-eqz v7, :cond_5

    invoke-virtual {v7}, Landroid/os/PowerManager$WakeLock;->release()V

    goto :goto_5

    :catchall_0
    move-exception v0

    move-object v6, v7

    goto :goto_6

    :catch_0
    move-exception v0

    move-object v6, v7

    goto :goto_4

    :catchall_1
    move-exception v0

    goto :goto_6

    :catch_1
    move-exception v0

    :goto_4
    :try_start_2
    iget-object v2, v1, Lcom/motorola/ccc/ota/sources/sdcard/SDCardDownloadHandler$1;->this$0:Lcom/motorola/ccc/ota/sources/sdcard/SDCardDownloadHandler;

    invoke-static {v2}, Lcom/motorola/ccc/ota/sources/sdcard/SDCardDownloadHandler;->-$$Nest$fget_env(Lcom/motorola/ccc/ota/sources/sdcard/SDCardDownloadHandler;)Lcom/motorola/otalib/common/Environment/ApplicationEnv;

    move-result-object v2

    invoke-interface {v2}, Lcom/motorola/otalib/common/Environment/ApplicationEnv;->getUtilities()Lcom/motorola/otalib/common/Environment/ApplicationEnv$Utilities;

    move-result-object v2

    iget-object v3, v1, Lcom/motorola/ccc/ota/sources/sdcard/SDCardDownloadHandler$1;->val$version:Ljava/lang/String;

    sget-object v4, Lcom/motorola/ccc/ota/sources/UpgradeSourceType;->sdcard:Lcom/motorola/ccc/ota/sources/UpgradeSourceType;

    invoke-virtual {v4}, Lcom/motorola/ccc/ota/sources/UpgradeSourceType;->toString()Ljava/lang/String;

    move-result-object v4

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "SDCardUpgradeSource.copyFromSdCard.Runnable.run: got exception: "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v0}, Ljava/lang/Exception;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v7, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-interface {v2, v3, v4, v0}, Lcom/motorola/otalib/common/Environment/ApplicationEnv$Utilities;->sendInternalNotification(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    iget-object v0, v1, Lcom/motorola/ccc/ota/sources/sdcard/SDCardDownloadHandler$1;->this$0:Lcom/motorola/ccc/ota/sources/sdcard/SDCardDownloadHandler;

    invoke-static {v0, v5}, Lcom/motorola/ccc/ota/sources/sdcard/SDCardDownloadHandler;->-$$Nest$fput_isCopying(Lcom/motorola/ccc/ota/sources/sdcard/SDCardDownloadHandler;Z)V

    if-eqz v6, :cond_5

    invoke-virtual {v6}, Landroid/os/PowerManager$WakeLock;->release()V

    :cond_5
    :goto_5
    return-void

    :goto_6
    iget-object v1, v1, Lcom/motorola/ccc/ota/sources/sdcard/SDCardDownloadHandler$1;->this$0:Lcom/motorola/ccc/ota/sources/sdcard/SDCardDownloadHandler;

    invoke-static {v1, v5}, Lcom/motorola/ccc/ota/sources/sdcard/SDCardDownloadHandler;->-$$Nest$fput_isCopying(Lcom/motorola/ccc/ota/sources/sdcard/SDCardDownloadHandler;Z)V

    if-eqz v6, :cond_6

    invoke-virtual {v6}, Landroid/os/PowerManager$WakeLock;->release()V

    :cond_6
    throw v0
.end method
