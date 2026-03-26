.class Lcom/motorola/ccc/ota/CusSM$defaultAction;
.super Ljava/util/TimerTask;
.source "CusSM.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/motorola/ccc/ota/CusSM;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = "defaultAction"
.end annotation


# instance fields
.field md:Lcom/motorola/otalib/common/metaData/MetaData;

.field final synthetic this$0:Lcom/motorola/ccc/ota/CusSM;


# direct methods
.method public constructor <init>(Lcom/motorola/ccc/ota/CusSM;Lcom/motorola/otalib/common/metaData/MetaData;)V
    .locals 0

    iput-object p1, p0, Lcom/motorola/ccc/ota/CusSM$defaultAction;->this$0:Lcom/motorola/ccc/ota/CusSM;

    invoke-direct {p0}, Ljava/util/TimerTask;-><init>()V

    iput-object p2, p0, Lcom/motorola/ccc/ota/CusSM$defaultAction;->md:Lcom/motorola/otalib/common/metaData/MetaData;

    return-void
.end method


# virtual methods
.method public run()V
    .locals 3

    const-string v0, "OtaApp"

    const-string v1, "No Service response, taking  defaultAction"

    invoke-static {v0, v1}, Lcom/motorola/ccc/ota/utils/Logger;->debug(Ljava/lang/String;Ljava/lang/String;)V

    iget-object v0, p0, Lcom/motorola/ccc/ota/CusSM$defaultAction;->this$0:Lcom/motorola/ccc/ota/CusSM;

    invoke-static {v0}, Lcom/motorola/ccc/ota/CusSM;->-$$Nest$mstopTimer(Lcom/motorola/ccc/ota/CusSM;)V

    iget-object v0, p0, Lcom/motorola/ccc/ota/CusSM$defaultAction;->md:Lcom/motorola/otalib/common/metaData/MetaData;

    invoke-virtual {v0}, Lcom/motorola/otalib/common/metaData/MetaData;->isContinueOnServiceError()Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/motorola/ccc/ota/CusSM$defaultAction;->this$0:Lcom/motorola/ccc/ota/CusSM;

    invoke-static {v0}, Lcom/motorola/ccc/ota/CusSM;->-$$Nest$fgetsettings(Lcom/motorola/ccc/ota/CusSM;)Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    move-result-object v0

    sget-object v1, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->SERVICE_CONTROL_RESPONSE:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    const-string v2, "continue"

    invoke-virtual {v0, v1, v2}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->setString(Lcom/motorola/otalib/common/settings/ISetting;Ljava/lang/String;)V

    iget-object p0, p0, Lcom/motorola/ccc/ota/CusSM$defaultAction;->this$0:Lcom/motorola/ccc/ota/CusSM;

    invoke-static {p0}, Lcom/motorola/ccc/ota/CusSM;->-$$Nest$mrunStateMachine(Lcom/motorola/ccc/ota/CusSM;)V

    goto :goto_0

    :cond_0
    iget-object p0, p0, Lcom/motorola/ccc/ota/CusSM$defaultAction;->this$0:Lcom/motorola/ccc/ota/CusSM;

    const/4 v0, 0x0

    new-array v0, v0, [Ljava/lang/String;

    invoke-virtual {p0, v0}, Lcom/motorola/ccc/ota/CusSM;->cancelOTA([Ljava/lang/String;)V

    :goto_0
    return-void
.end method
