.class public final Lcom/motorola/ccc/ota/env/AndroidENV;
.super Ljava/lang/Object;
.source "AndroidENV.java"

# interfaces
.implements Lcom/motorola/otalib/common/Environment/ApplicationEnv;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/motorola/ccc/ota/env/AndroidENV$Utilities;,
        Lcom/motorola/ccc/ota/env/AndroidENV$Services;,
        Lcom/motorola/ccc/ota/env/AndroidENV$FotaServices;
    }
.end annotation


# instance fields
.field private final _context:Landroid/content/Context;

.field private final _dbpath:Ljava/lang/String;

.field private final _fotaServices:Lcom/motorola/otalib/common/Environment/ApplicationEnv$FotaServices;

.field private final _services:Lcom/motorola/otalib/common/Environment/ApplicationEnv$Services;

.field private final _utilities:Lcom/motorola/otalib/common/Environment/ApplicationEnv$Utilities;

.field private final settings:Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;


# direct methods
.method static bridge synthetic -$$Nest$fget_context(Lcom/motorola/ccc/ota/env/AndroidENV;)Landroid/content/Context;
    .locals 0

    iget-object p0, p0, Lcom/motorola/ccc/ota/env/AndroidENV;->_context:Landroid/content/Context;

    return-object p0
.end method

.method static bridge synthetic -$$Nest$fgetsettings(Lcom/motorola/ccc/ota/env/AndroidENV;)Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;
    .locals 0

    iget-object p0, p0, Lcom/motorola/ccc/ota/env/AndroidENV;->settings:Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    return-object p0
.end method

.method constructor <init>(Ljava/lang/String;Landroid/content/Context;Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/motorola/ccc/ota/env/AndroidENV;->_dbpath:Ljava/lang/String;

    iput-object p2, p0, Lcom/motorola/ccc/ota/env/AndroidENV;->_context:Landroid/content/Context;

    iput-object p3, p0, Lcom/motorola/ccc/ota/env/AndroidENV;->settings:Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    new-instance p1, Lcom/motorola/ccc/ota/env/AndroidENV$Utilities;

    invoke-direct {p1, p0}, Lcom/motorola/ccc/ota/env/AndroidENV$Utilities;-><init>(Lcom/motorola/ccc/ota/env/AndroidENV;)V

    iput-object p1, p0, Lcom/motorola/ccc/ota/env/AndroidENV;->_utilities:Lcom/motorola/otalib/common/Environment/ApplicationEnv$Utilities;

    new-instance p1, Lcom/motorola/ccc/ota/env/AndroidENV$Services;

    invoke-direct {p1}, Lcom/motorola/ccc/ota/env/AndroidENV$Services;-><init>()V

    iput-object p1, p0, Lcom/motorola/ccc/ota/env/AndroidENV;->_services:Lcom/motorola/otalib/common/Environment/ApplicationEnv$Services;

    new-instance p1, Lcom/motorola/ccc/ota/env/AndroidENV$FotaServices;

    invoke-direct {p1, p0}, Lcom/motorola/ccc/ota/env/AndroidENV$FotaServices;-><init>(Lcom/motorola/ccc/ota/env/AndroidENV;)V

    iput-object p1, p0, Lcom/motorola/ccc/ota/env/AndroidENV;->_fotaServices:Lcom/motorola/otalib/common/Environment/ApplicationEnv$FotaServices;

    return-void
.end method


# virtual methods
.method public createDatabase()Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database;
    .locals 2

    new-instance v0, Lcom/motorola/otalib/common/Environment/AndroidDB;

    iget-object v1, p0, Lcom/motorola/ccc/ota/env/AndroidENV;->_dbpath:Ljava/lang/String;

    iget-object p0, p0, Lcom/motorola/ccc/ota/env/AndroidENV;->_context:Landroid/content/Context;

    invoke-direct {v0, v1, p0}, Lcom/motorola/otalib/common/Environment/AndroidDB;-><init>(Ljava/lang/String;Landroid/content/Context;)V

    return-object v0
.end method

.method public getFotaServices()Lcom/motorola/otalib/common/Environment/ApplicationEnv$FotaServices;
    .locals 0

    iget-object p0, p0, Lcom/motorola/ccc/ota/env/AndroidENV;->_fotaServices:Lcom/motorola/otalib/common/Environment/ApplicationEnv$FotaServices;

    return-object p0
.end method

.method public getServices()Lcom/motorola/otalib/common/Environment/ApplicationEnv$Services;
    .locals 0

    iget-object p0, p0, Lcom/motorola/ccc/ota/env/AndroidENV;->_services:Lcom/motorola/otalib/common/Environment/ApplicationEnv$Services;

    return-object p0
.end method

.method public getUtilities()Lcom/motorola/otalib/common/Environment/ApplicationEnv$Utilities;
    .locals 0

    iget-object p0, p0, Lcom/motorola/ccc/ota/env/AndroidENV;->_utilities:Lcom/motorola/otalib/common/Environment/ApplicationEnv$Utilities;

    return-object p0
.end method
