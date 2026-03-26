.class Lcom/motorola/ccc/ota/env/PollingManagerService$1;
.super Lcom/motorola/ccc/ota/aidl/IPollingManagerService$Stub;
.source "PollingManagerService.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/motorola/ccc/ota/env/PollingManagerService;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/motorola/ccc/ota/env/PollingManagerService;


# direct methods
.method constructor <init>(Lcom/motorola/ccc/ota/env/PollingManagerService;)V
    .locals 0

    iput-object p1, p0, Lcom/motorola/ccc/ota/env/PollingManagerService$1;->this$0:Lcom/motorola/ccc/ota/env/PollingManagerService;

    invoke-direct {p0}, Lcom/motorola/ccc/ota/aidl/IPollingManagerService$Stub;-><init>()V

    return-void
.end method


# virtual methods
.method public registerApp(ILjava/lang/String;Ljava/lang/String;[Ljava/lang/String;JZZ)I
    .locals 14

    move-object v0, p0

    move v1, p1

    const-string v10, "registered app "

    const-string v2, "PollingManagerService, registerApp(): "

    const-string v3, "PollingManagerService, registerApp(): "

    iget-object v4, v0, Lcom/motorola/ccc/ota/env/PollingManagerService$1;->this$0:Lcom/motorola/ccc/ota/env/PollingManagerService;

    invoke-static {v4}, Lcom/motorola/ccc/ota/env/PollingManagerService;->-$$Nest$fgetmLock(Lcom/motorola/ccc/ota/env/PollingManagerService;)Ljava/lang/Object;

    move-result-object v11

    monitor-enter v11

    :try_start_0
    const-string v4, "OtaApp"

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v5, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v4, v3}, Lcom/motorola/ccc/ota/utils/Logger;->debug(Ljava/lang/String;Ljava/lang/String;)V

    if-lez v1, :cond_4

    if-eqz p2, :cond_4

    if-nez p3, :cond_0

    goto/16 :goto_1

    :cond_0
    const-wide/16 v3, 0x0

    cmp-long v3, p5, v3

    if-gtz v3, :cond_1

    const-wide/16 v3, -0x6c1

    cmp-long v3, p5, v3

    if-eqz v3, :cond_1

    monitor-exit v11

    const/4 v0, -0x2

    return v0

    :cond_1
    iget-object v3, v0, Lcom/motorola/ccc/ota/env/PollingManagerService$1;->this$0:Lcom/motorola/ccc/ota/env/PollingManagerService;

    invoke-static {v3}, Lcom/motorola/ccc/ota/env/PollingManagerService;->-$$Nest$fgetmRegisteredApps(Lcom/motorola/ccc/ota/env/PollingManagerService;)Ljava/util/HashMap;

    move-result-object v3

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/util/HashMap;->containsKey(Ljava/lang/Object;)Z

    move-result v3

    const/4 v12, -0x1

    if-eqz v3, :cond_2

    const-string v0, "OtaApp"

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v3, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " already registered."

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/motorola/ccc/ota/utils/Logger;->debug(Ljava/lang/String;Ljava/lang/String;)V

    monitor-exit v11

    return v12

    :cond_2
    new-instance v13, Lcom/motorola/ccc/ota/env/PollingManagerService$PMApp;

    move-object v2, v13

    move-object/from16 v3, p2

    move-object/from16 v4, p3

    move-object/from16 v5, p4

    move-wide/from16 v6, p5

    move/from16 v8, p7

    move/from16 v9, p8

    invoke-direct/range {v2 .. v9}, Lcom/motorola/ccc/ota/env/PollingManagerService$PMApp;-><init>(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;JZZ)V

    iget-object v2, v0, Lcom/motorola/ccc/ota/env/PollingManagerService$1;->this$0:Lcom/motorola/ccc/ota/env/PollingManagerService;

    invoke-static {v2}, Lcom/motorola/ccc/ota/env/PollingManagerService;->-$$Nest$fgetmRegisteredApps(Lcom/motorola/ccc/ota/env/PollingManagerService;)Ljava/util/HashMap;

    move-result-object v2

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    invoke-virtual {v2, v3, v13}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string v2, "OtaApp"

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3, v10}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-static {v13}, Lcom/motorola/ccc/ota/env/PollingManagerService$PMApp;->-$$Nest$fgetmAllowOnlyOnNetwork(Lcom/motorola/ccc/ota/env/PollingManagerService$PMApp;)Z

    move-result v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, " "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-static {v13}, Lcom/motorola/ccc/ota/env/PollingManagerService$PMApp;->-$$Nest$fgetmAllowOnRoaming(Lcom/motorola/ccc/ota/env/PollingManagerService$PMApp;)Z

    move-result v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Lcom/motorola/ccc/ota/utils/Logger;->verbose(Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v13}, Lcom/motorola/ccc/ota/env/PollingManagerService$PMApp;->getNextPollTime()J

    move-result-wide v2

    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    move-result-wide v4

    cmp-long v2, v2, v4

    if-lez v2, :cond_3

    iget-object v0, v0, Lcom/motorola/ccc/ota/env/PollingManagerService$1;->this$0:Lcom/motorola/ccc/ota/env/PollingManagerService;

    invoke-virtual {v13}, Lcom/motorola/ccc/ota/env/PollingManagerService$PMApp;->getNextPollTime()J

    move-result-wide v2

    invoke-static {v0, v2, v3, p1}, Lcom/motorola/ccc/ota/env/PollingManagerService;->-$$Nest$mscheduleTask(Lcom/motorola/ccc/ota/env/PollingManagerService;JI)V

    goto :goto_0

    :cond_3
    iget-object v0, v0, Lcom/motorola/ccc/ota/env/PollingManagerService$1;->this$0:Lcom/motorola/ccc/ota/env/PollingManagerService;

    invoke-static {v0, v12}, Lcom/motorola/ccc/ota/env/PollingManagerService;->-$$Nest$mdecideWhoNeedsPolling(Lcom/motorola/ccc/ota/env/PollingManagerService;I)V

    :goto_0
    monitor-exit v11

    const/4 v0, 0x0

    return v0

    :cond_4
    :goto_1
    monitor-exit v11

    const/4 v0, -0x3

    return v0

    :catchall_0
    move-exception v0

    monitor-exit v11
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v0
.end method

.method public unregisterApp(ILjava/lang/String;)I
    .locals 5

    const-string v0, "PollingManagerService, unregisterApp(): "

    const-string v1, "PollingManagerService, unregisterApp(): "

    iget-object v2, p0, Lcom/motorola/ccc/ota/env/PollingManagerService$1;->this$0:Lcom/motorola/ccc/ota/env/PollingManagerService;

    invoke-static {v2}, Lcom/motorola/ccc/ota/env/PollingManagerService;->-$$Nest$fgetmLock(Lcom/motorola/ccc/ota/env/PollingManagerService;)Ljava/lang/Object;

    move-result-object v2

    monitor-enter v2

    :try_start_0
    const-string v3, "OtaApp"

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v4, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v3, v1}, Lcom/motorola/ccc/ota/utils/Logger;->debug(Ljava/lang/String;Ljava/lang/String;)V

    if-lez p1, :cond_3

    if-nez p2, :cond_0

    goto/16 :goto_0

    :cond_0
    iget-object v1, p0, Lcom/motorola/ccc/ota/env/PollingManagerService$1;->this$0:Lcom/motorola/ccc/ota/env/PollingManagerService;

    invoke-static {v1}, Lcom/motorola/ccc/ota/env/PollingManagerService;->-$$Nest$fgetmRegisteredApps(Lcom/motorola/ccc/ota/env/PollingManagerService;)Ljava/util/HashMap;

    move-result-object v1

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    invoke-virtual {v1, v3}, Ljava/util/HashMap;->containsKey(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_1

    const-string p0, "OtaApp"

    new-instance p2, Ljava/lang/StringBuilder;

    invoke-direct {p2, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p2, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object p1

    const-string p2, " not registered."

    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {p0, p1}, Lcom/motorola/ccc/ota/utils/Logger;->debug(Ljava/lang/String;Ljava/lang/String;)V

    monitor-exit v2

    const/4 p0, -0x4

    return p0

    :cond_1
    iget-object v0, p0, Lcom/motorola/ccc/ota/env/PollingManagerService$1;->this$0:Lcom/motorola/ccc/ota/env/PollingManagerService;

    invoke-static {v0}, Lcom/motorola/ccc/ota/env/PollingManagerService;->-$$Nest$fgetmRegisteredApps(Lcom/motorola/ccc/ota/env/PollingManagerService;)Ljava/util/HashMap;

    move-result-object v0

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/motorola/ccc/ota/env/PollingManagerService$PMApp;

    invoke-virtual {v0}, Lcom/motorola/ccc/ota/env/PollingManagerService$PMApp;->getAppSecret()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p2

    if-nez p2, :cond_2

    monitor-exit v2

    const/4 p0, -0x5

    return p0

    :cond_2
    iget-object p2, p0, Lcom/motorola/ccc/ota/env/PollingManagerService$1;->this$0:Lcom/motorola/ccc/ota/env/PollingManagerService;

    invoke-static {p2}, Lcom/motorola/ccc/ota/env/PollingManagerService;->-$$Nest$fgetmRegisteredApps(Lcom/motorola/ccc/ota/env/PollingManagerService;)Ljava/util/HashMap;

    move-result-object p2

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    invoke-virtual {p2, v0}, Ljava/util/HashMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    new-instance p2, Landroid/content/Intent;

    const-string v0, "com.motorola.blur.service.blur.pm.alarmintent"

    invoke-direct {p2, v0}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    const-string v0, "requestId"

    invoke-virtual {p2, v0, p1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    iget-object v0, p0, Lcom/motorola/ccc/ota/env/PollingManagerService$1;->this$0:Lcom/motorola/ccc/ota/env/PollingManagerService;

    invoke-static {v0}, Lcom/motorola/ccc/ota/env/PollingManagerService;->-$$Nest$fgetmParent(Lcom/motorola/ccc/ota/env/PollingManagerService;)Landroid/app/Service;

    move-result-object v1

    const/high16 v3, 0x14000000

    invoke-static {v1, p1, p2, v3}, Landroid/app/PendingIntent;->getBroadcast(Landroid/content/Context;ILandroid/content/Intent;I)Landroid/app/PendingIntent;

    move-result-object p1

    invoke-static {v0, p1}, Lcom/motorola/ccc/ota/env/PollingManagerService;->-$$Nest$fputmPendingIntent(Lcom/motorola/ccc/ota/env/PollingManagerService;Landroid/app/PendingIntent;)V

    iget-object p1, p0, Lcom/motorola/ccc/ota/env/PollingManagerService$1;->this$0:Lcom/motorola/ccc/ota/env/PollingManagerService;

    invoke-static {p1}, Lcom/motorola/ccc/ota/env/PollingManagerService;->-$$Nest$fgetmAlarmManger(Lcom/motorola/ccc/ota/env/PollingManagerService;)Landroid/app/AlarmManager;

    move-result-object p1

    iget-object p0, p0, Lcom/motorola/ccc/ota/env/PollingManagerService$1;->this$0:Lcom/motorola/ccc/ota/env/PollingManagerService;

    invoke-static {p0}, Lcom/motorola/ccc/ota/env/PollingManagerService;->-$$Nest$fgetmPendingIntent(Lcom/motorola/ccc/ota/env/PollingManagerService;)Landroid/app/PendingIntent;

    move-result-object p0

    invoke-virtual {p1, p0}, Landroid/app/AlarmManager;->cancel(Landroid/app/PendingIntent;)V

    monitor-exit v2

    const/4 p0, 0x0

    return p0

    :cond_3
    :goto_0
    monitor-exit v2

    const/4 p0, -0x3

    return p0

    :catchall_0
    move-exception p0

    monitor-exit v2
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw p0
.end method
