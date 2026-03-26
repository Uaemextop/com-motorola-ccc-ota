.class public Lcom/motorola/otalib/downloadservice/download/policy/ZeroRatedServices;
.super Ljava/lang/Object;
.source "ZeroRatedServices.java"


# static fields
.field public static final CARRIER_ENABLED:Ljava/lang/String; = "carrier_enabled"

.field public static final CONTENT_URI:Landroid/net/Uri;

.field private static instance:Lcom/motorola/otalib/downloadservice/download/policy/ZeroRatedServices;

.field private static mDownloadServiceSettings:Lcom/motorola/otalib/downloadservice/utils/DownloadServiceSettings;


# instance fields
.field private context:Landroid/content/Context;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    const-string v0, "content://telephony/carriers"

    invoke-static {v0}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v0

    sput-object v0, Lcom/motorola/otalib/downloadservice/download/policy/ZeroRatedServices;->CONTENT_URI:Landroid/net/Uri;

    const/4 v0, 0x0

    sput-object v0, Lcom/motorola/otalib/downloadservice/download/policy/ZeroRatedServices;->instance:Lcom/motorola/otalib/downloadservice/download/policy/ZeroRatedServices;

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Lcom/motorola/otalib/downloadservice/utils/DownloadServiceSettings;)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/motorola/otalib/downloadservice/download/policy/ZeroRatedServices;->context:Landroid/content/Context;

    sput-object p2, Lcom/motorola/otalib/downloadservice/download/policy/ZeroRatedServices;->mDownloadServiceSettings:Lcom/motorola/otalib/downloadservice/utils/DownloadServiceSettings;

    return-void
.end method

.method public static declared-synchronized getZeroRatedServices(Landroid/content/Context;Lcom/motorola/otalib/downloadservice/utils/DownloadServiceSettings;)Lcom/motorola/otalib/downloadservice/download/policy/ZeroRatedServices;
    .locals 2

    const-class v0, Lcom/motorola/otalib/downloadservice/download/policy/ZeroRatedServices;

    monitor-enter v0

    :try_start_0
    sget-object v1, Lcom/motorola/otalib/downloadservice/download/policy/ZeroRatedServices;->instance:Lcom/motorola/otalib/downloadservice/download/policy/ZeroRatedServices;

    if-nez v1, :cond_0

    new-instance v1, Lcom/motorola/otalib/downloadservice/download/policy/ZeroRatedServices;

    invoke-direct {v1, p0, p1}, Lcom/motorola/otalib/downloadservice/download/policy/ZeroRatedServices;-><init>(Landroid/content/Context;Lcom/motorola/otalib/downloadservice/utils/DownloadServiceSettings;)V

    sput-object v1, Lcom/motorola/otalib/downloadservice/download/policy/ZeroRatedServices;->instance:Lcom/motorola/otalib/downloadservice/download/policy/ZeroRatedServices;

    :cond_0
    sget-object p0, Lcom/motorola/otalib/downloadservice/download/policy/ZeroRatedServices;->instance:Lcom/motorola/otalib/downloadservice/download/policy/ZeroRatedServices;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit v0

    return-object p0

    :catchall_0
    move-exception p0

    monitor-exit v0

    throw p0
.end method


# virtual methods
.method public getZeroRatedDBStatus()Z
    .locals 8

    const-string v3, "apn=\'VZWADMIN\'"

    const/4 v6, 0x0

    const/4 v7, 0x0

    :try_start_0
    iget-object p0, p0, Lcom/motorola/otalib/downloadservice/download/policy/ZeroRatedServices;->context:Landroid/content/Context;

    invoke-virtual {p0}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v0

    sget-object v1, Lcom/motorola/otalib/downloadservice/download/policy/ZeroRatedServices;->CONTENT_URI:Landroid/net/Uri;

    const/4 p0, 0x1

    new-array v2, p0, [Ljava/lang/String;

    const-string v4, "carrier_enabled"

    aput-object v4, v2, v7

    const/4 v4, 0x0

    const/4 v5, 0x0

    invoke-virtual/range {v0 .. v5}, Landroid/content/ContentResolver;->query(Landroid/net/Uri;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v6

    if-eqz v6, :cond_0

    invoke-interface {v6}, Landroid/database/Cursor;->getCount()I

    move-result v0

    if-lez v0, :cond_0

    invoke-interface {v6}, Landroid/database/Cursor;->moveToFirst()Z

    invoke-interface {v6, v7}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v0
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    if-eqz v0, :cond_0

    move v7, p0

    :cond_0
    if-eqz v6, :cond_1

    invoke-interface {v6}, Landroid/database/Cursor;->close()V

    :cond_1
    if-nez v7, :cond_2

    sget-object p0, Lcom/motorola/otalib/downloadservice/utils/DownloadServiceLogger;->TAG:Ljava/lang/String;

    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "ZeroRatedServices.getZeroRatedDBStatus::.ZeroRated(VZWADMIN) db status: "

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, v7}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {p0, v0}, Lcom/motorola/otalib/downloadservice/utils/DownloadServiceLogger;->i(Ljava/lang/String;Ljava/lang/String;)V

    :cond_2
    return v7

    :catchall_0
    move-exception p0

    goto :goto_0

    :catch_0
    :try_start_1
    sget-object p0, Lcom/motorola/otalib/downloadservice/utils/DownloadServiceLogger;->TAG:Ljava/lang/String;

    const-string v0, "ZeroRatedServices.getZeroRatedDBStatus::ZeroRated(VZWADMIN) apn class doesn\'t exist"

    invoke-static {p0, v0}, Lcom/motorola/otalib/downloadservice/utils/DownloadServiceLogger;->e(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    if-eqz v6, :cond_3

    invoke-interface {v6}, Landroid/database/Cursor;->close()V

    :cond_3
    return v7

    :goto_0
    if-eqz v6, :cond_4

    invoke-interface {v6}, Landroid/database/Cursor;->close()V

    :cond_4
    throw p0
.end method

.method public getZeroRatedHostName(Ljava/lang/String;)Ljava/lang/String;
    .locals 3

    const-string p0, "getZeroRatedHostName:: adminApnHost : "

    const/4 v0, 0x0

    :try_start_0
    new-instance v1, Lorg/json/JSONObject;

    invoke-direct {v1, p1}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    const-string p1, "adminApnUrl"

    const-string v2, ""

    invoke-virtual {v1, p1, v2}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    if-eqz v1, :cond_0

    sget-object p0, Lcom/motorola/otalib/downloadservice/utils/DownloadServiceLogger;->TAG:Ljava/lang/String;

    const-string p1, "getZeroRatedHostName:: could not find adminApnUrl in contentResources"

    invoke-static {p0, p1}, Lcom/motorola/otalib/downloadservice/utils/DownloadServiceLogger;->i(Ljava/lang/String;Ljava/lang/String;)V

    return-object v0

    :cond_0
    new-instance v1, Ljava/net/URL;

    invoke-direct {v1, p1}, Ljava/net/URL;-><init>(Ljava/lang/String;)V

    sget-object p1, Lcom/motorola/otalib/downloadservice/utils/DownloadServiceLogger;->TAG:Ljava/lang/String;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2, p0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1}, Ljava/net/URL;->getHost()Ljava/lang/String;

    move-result-object p0

    invoke-virtual {v2, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-static {p1, p0}, Lcom/motorola/otalib/downloadservice/utils/DownloadServiceLogger;->i(Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v1}, Ljava/net/URL;->getHost()Ljava/lang/String;

    move-result-object p0
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    return-object p0

    :catch_0
    sget-object p0, Lcom/motorola/otalib/downloadservice/utils/DownloadServiceLogger;->TAG:Ljava/lang/String;

    const-string p1, "getZeroRatedHostName:: error parsing adminApnUrl from contentResources"

    invoke-static {p0, p1}, Lcom/motorola/otalib/downloadservice/utils/DownloadServiceLogger;->i(Ljava/lang/String;Ljava/lang/String;)V

    return-object v0
.end method

.method public startZeroRatedChannel()V
    .locals 2

    new-instance v0, Lcom/motorola/otalib/downloadservice/download/policy/ZeroRatedManager;

    iget-object p0, p0, Lcom/motorola/otalib/downloadservice/download/policy/ZeroRatedServices;->context:Landroid/content/Context;

    sget-object v1, Lcom/motorola/otalib/downloadservice/download/policy/ZeroRatedServices;->mDownloadServiceSettings:Lcom/motorola/otalib/downloadservice/utils/DownloadServiceSettings;

    invoke-direct {v0, p0, v1}, Lcom/motorola/otalib/downloadservice/download/policy/ZeroRatedManager;-><init>(Landroid/content/Context;Lcom/motorola/otalib/downloadservice/utils/DownloadServiceSettings;)V

    invoke-virtual {v0}, Lcom/motorola/otalib/downloadservice/download/policy/ZeroRatedManager;->requestZeroRatedNetworkChannel()V

    return-void
.end method

.method public stopZeroRatedChannel()V
    .locals 2

    new-instance v0, Lcom/motorola/otalib/downloadservice/download/policy/ZeroRatedManager;

    iget-object p0, p0, Lcom/motorola/otalib/downloadservice/download/policy/ZeroRatedServices;->context:Landroid/content/Context;

    sget-object v1, Lcom/motorola/otalib/downloadservice/download/policy/ZeroRatedServices;->mDownloadServiceSettings:Lcom/motorola/otalib/downloadservice/utils/DownloadServiceSettings;

    invoke-direct {v0, p0, v1}, Lcom/motorola/otalib/downloadservice/download/policy/ZeroRatedManager;-><init>(Landroid/content/Context;Lcom/motorola/otalib/downloadservice/utils/DownloadServiceSettings;)V

    invoke-virtual {v0}, Lcom/motorola/otalib/downloadservice/download/policy/ZeroRatedManager;->stopZeroRatedChannel()V

    return-void
.end method

.method public zeroRatedChannelStatus()Z
    .locals 2

    new-instance v0, Lcom/motorola/otalib/downloadservice/download/policy/ZeroRatedManager;

    iget-object p0, p0, Lcom/motorola/otalib/downloadservice/download/policy/ZeroRatedServices;->context:Landroid/content/Context;

    sget-object v1, Lcom/motorola/otalib/downloadservice/download/policy/ZeroRatedServices;->mDownloadServiceSettings:Lcom/motorola/otalib/downloadservice/utils/DownloadServiceSettings;

    invoke-direct {v0, p0, v1}, Lcom/motorola/otalib/downloadservice/download/policy/ZeroRatedManager;-><init>(Landroid/content/Context;Lcom/motorola/otalib/downloadservice/utils/DownloadServiceSettings;)V

    invoke-virtual {v0}, Lcom/motorola/otalib/downloadservice/download/policy/ZeroRatedManager;->isZeroRatedNetworkActive()Z

    move-result p0

    if-nez p0, :cond_0

    sget-object p0, Lcom/motorola/otalib/downloadservice/utils/DownloadServiceLogger;->TAG:Ljava/lang/String;

    const-string v0, "ZeroRatedServices.zeroRatedChannelStatus:: zero rated nw not active"

    invoke-static {p0, v0}, Lcom/motorola/otalib/downloadservice/utils/DownloadServiceLogger;->d(Ljava/lang/String;Ljava/lang/String;)V

    const/4 p0, 0x0

    return p0

    :cond_0
    const/4 p0, 0x1

    return p0
.end method
