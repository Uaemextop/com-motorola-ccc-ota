.class Lcom/motorola/ccc/ota/CusSM$4;
.super Ljava/lang/Object;
.source "CusSM.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/motorola/ccc/ota/CusSM;->createReserveSpace()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/motorola/ccc/ota/CusSM;


# direct methods
.method constructor <init>(Lcom/motorola/ccc/ota/CusSM;)V
    .locals 0

    iput-object p1, p0, Lcom/motorola/ccc/ota/CusSM$4;->this$0:Lcom/motorola/ccc/ota/CusSM;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 3

    iget-object p0, p0, Lcom/motorola/ccc/ota/CusSM$4;->this$0:Lcom/motorola/ccc/ota/CusSM;

    invoke-static {p0}, Lcom/motorola/ccc/ota/CusSM;->-$$Nest$fgetsettings(Lcom/motorola/ccc/ota/CusSM;)Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    move-result-object p0

    sget-object v0, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->RESERVE_SPACE_IN_MB:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    const-wide/16 v1, -0x1

    invoke-virtual {p0, v0, v1, v2}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->getLong(Lcom/motorola/otalib/common/settings/ISetting;J)J

    move-result-wide v0

    invoke-static {v0, v1}, Lcom/motorola/ccc/ota/utils/FileUtils;->checkAndCreateReserveSpace(J)V

    return-void
.end method
