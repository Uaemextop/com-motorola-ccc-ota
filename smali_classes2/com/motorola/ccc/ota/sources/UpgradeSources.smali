.class public final Lcom/motorola/ccc/ota/sources/UpgradeSources;
.super Ljava/lang/Object;
.source "UpgradeSources.java"


# instance fields
.field private final sources:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Lcom/motorola/ccc/ota/sources/UpgradeSourceType;",
            "Lcom/motorola/ccc/ota/sources/UpgradeSource;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Lcom/motorola/ccc/ota/CusSM;Lcom/motorola/ccc/ota/NewVersionHandler;Lcom/motorola/otalib/common/Environment/ApplicationEnv;Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;)V
    .locals 2

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lcom/motorola/ccc/ota/sources/UpgradeSources;->sources:Ljava/util/Map;

    sget-object p0, Lcom/motorola/ccc/ota/sources/UpgradeSourceType;->sdcard:Lcom/motorola/ccc/ota/sources/UpgradeSourceType;

    new-instance v1, Lcom/motorola/ccc/ota/sources/sdcard/SDCardUpgradeSource;

    invoke-direct {v1, p1, p2, p3, p4}, Lcom/motorola/ccc/ota/sources/sdcard/SDCardUpgradeSource;-><init>(Lcom/motorola/ccc/ota/CusSM;Lcom/motorola/ccc/ota/NewVersionHandler;Lcom/motorola/otalib/common/Environment/ApplicationEnv;Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;)V

    invoke-interface {v0, p0, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    new-instance p0, Lcom/motorola/ccc/ota/sources/bota/BotaUpgradeSource;

    invoke-direct {p0, p1, p2, p3, p4}, Lcom/motorola/ccc/ota/sources/bota/BotaUpgradeSource;-><init>(Lcom/motorola/ccc/ota/CusSM;Lcom/motorola/ccc/ota/NewVersionHandler;Lcom/motorola/otalib/common/Environment/ApplicationEnv;Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;)V

    sget-object v1, Lcom/motorola/ccc/ota/sources/UpgradeSourceType;->upgrade:Lcom/motorola/ccc/ota/sources/UpgradeSourceType;

    invoke-interface {v0, v1, p0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    sget-object v1, Lcom/motorola/ccc/ota/sources/UpgradeSourceType;->bootstrap:Lcom/motorola/ccc/ota/sources/UpgradeSourceType;

    invoke-interface {v0, v1, p0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    sget-object p0, Lcom/motorola/ccc/ota/sources/UpgradeSourceType;->fota:Lcom/motorola/ccc/ota/sources/UpgradeSourceType;

    new-instance v1, Lcom/motorola/ccc/ota/sources/fota/FotaUpgradeSource;

    invoke-direct {v1, p1, p2, p3, p4}, Lcom/motorola/ccc/ota/sources/fota/FotaUpgradeSource;-><init>(Lcom/motorola/ccc/ota/CusSM;Lcom/motorola/ccc/ota/NewVersionHandler;Lcom/motorola/otalib/common/Environment/ApplicationEnv;Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;)V

    invoke-interface {v0, p0, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    sget-object p0, Lcom/motorola/ccc/ota/sources/UpgradeSourceType;->modem:Lcom/motorola/ccc/ota/sources/UpgradeSourceType;

    new-instance v1, Lcom/motorola/ccc/ota/sources/modem/ModemUpgradeSource;

    invoke-direct {v1, p1, p2, p3, p4}, Lcom/motorola/ccc/ota/sources/modem/ModemUpgradeSource;-><init>(Lcom/motorola/ccc/ota/CusSM;Lcom/motorola/ccc/ota/NewVersionHandler;Lcom/motorola/otalib/common/Environment/ApplicationEnv;Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;)V

    invoke-interface {v0, p0, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    return-void
.end method


# virtual methods
.method public getUpgradeSource(Lcom/motorola/ccc/ota/sources/UpgradeSourceType;)Lcom/motorola/ccc/ota/sources/UpgradeSource;
    .locals 0

    iget-object p0, p0, Lcom/motorola/ccc/ota/sources/UpgradeSources;->sources:Ljava/util/Map;

    invoke-interface {p0, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lcom/motorola/ccc/ota/sources/UpgradeSource;

    return-object p0
.end method

.method public initializePlugins(Ljava/util/List;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database$Descriptor;",
            ">;)V"
        }
    .end annotation

    iget-object p0, p0, Lcom/motorola/ccc/ota/sources/UpgradeSources;->sources:Ljava/util/Map;

    invoke-interface {p0}, Ljava/util/Map;->values()Ljava/util/Collection;

    move-result-object p0

    invoke-interface {p0}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object p0

    :goto_0
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/motorola/ccc/ota/sources/UpgradeSource;

    invoke-virtual {v0, p1}, Lcom/motorola/ccc/ota/sources/UpgradeSource;->plugin_init(Ljava/util/List;)V

    goto :goto_0

    :cond_0
    return-void
.end method

.method public releasePlugins()V
    .locals 0

    return-void
.end method
