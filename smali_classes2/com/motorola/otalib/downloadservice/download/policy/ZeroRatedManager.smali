.class public Lcom/motorola/otalib/downloadservice/download/policy/ZeroRatedManager;
.super Ljava/lang/Object;
.source "ZeroRatedManager.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/motorola/otalib/downloadservice/download/policy/ZeroRatedManager$AdminApnNetworkCallback;
    }
.end annotation


# static fields
.field public static final ACTION_ZERORATED_CHANNEL_ACTIVE:Ljava/lang/String; = "com.motorola.downloadservice.ACTION_ZERORATED_CHANNEL_ACTIVE"

.field public static final ACTION_ZERORATED_CHANNEL_INACTIVE:Ljava/lang/String; = "com.motorola.downloadservice.ACTION_ZERORATED_CHANNEL_INACTIVE"

.field public static final ACTION_ZERORATED_CLEANUP:Ljava/lang/String; = "com.motorola.downloadservice.ACTION_ZERORATED_CLEANUP"

.field public static final ACTION_ZERORATED_CLEANUP_MESSAGE:Ljava/lang/String; = "com.motorola.downloadservice.ACTION_ZERORATED_CLEANUP_MESSAGE"

.field private static final CONNECTED:Ljava/lang/String; = "connected"

.field private static final DISCONNECTED:Ljava/lang/String; = "disconnected"

.field public static final KEY_INACTIVE_REASON:Ljava/lang/String; = "key_inactive_reason"

.field private static mActiveAdminApnNetwork:Landroid/net/Network;

.field private static mAdminApnNetworkCallback:Landroid/net/ConnectivityManager$NetworkCallback;


# instance fields
.field private doIneedToBroadcast:Z

.field private doIneedToBroadcastInActive:Z

.field private mConnectivityManager:Landroid/net/ConnectivityManager;

.field private mContext:Landroid/content/Context;

.field private mSettings:Lcom/motorola/otalib/downloadservice/utils/DownloadServiceSettings;


# direct methods
.method public constructor <init>(Landroid/content/Context;Lcom/motorola/otalib/downloadservice/utils/DownloadServiceSettings;)V
    .locals 1

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/motorola/otalib/downloadservice/download/policy/ZeroRatedManager;->doIneedToBroadcast:Z

    iput-boolean v0, p0, Lcom/motorola/otalib/downloadservice/download/policy/ZeroRatedManager;->doIneedToBroadcastInActive:Z

    iput-object p1, p0, Lcom/motorola/otalib/downloadservice/download/policy/ZeroRatedManager;->mContext:Landroid/content/Context;

    iput-object p2, p0, Lcom/motorola/otalib/downloadservice/download/policy/ZeroRatedManager;->mSettings:Lcom/motorola/otalib/downloadservice/utils/DownloadServiceSettings;

    return-void
.end method

.method static synthetic access$000(Lcom/motorola/otalib/downloadservice/download/policy/ZeroRatedManager;)Landroid/net/ConnectivityManager;
    .locals 0

    iget-object p0, p0, Lcom/motorola/otalib/downloadservice/download/policy/ZeroRatedManager;->mConnectivityManager:Landroid/net/ConnectivityManager;

    return-object p0
.end method

.method static synthetic access$002(Lcom/motorola/otalib/downloadservice/download/policy/ZeroRatedManager;Landroid/net/ConnectivityManager;)Landroid/net/ConnectivityManager;
    .locals 0

    iput-object p1, p0, Lcom/motorola/otalib/downloadservice/download/policy/ZeroRatedManager;->mConnectivityManager:Landroid/net/ConnectivityManager;

    return-object p1
.end method

.method static synthetic access$100(Lcom/motorola/otalib/downloadservice/download/policy/ZeroRatedManager;)Landroid/content/Context;
    .locals 0

    iget-object p0, p0, Lcom/motorola/otalib/downloadservice/download/policy/ZeroRatedManager;->mContext:Landroid/content/Context;

    return-object p0
.end method

.method static synthetic access$200(Lcom/motorola/otalib/downloadservice/download/policy/ZeroRatedManager;)Lcom/motorola/otalib/downloadservice/utils/DownloadServiceSettings;
    .locals 0

    iget-object p0, p0, Lcom/motorola/otalib/downloadservice/download/policy/ZeroRatedManager;->mSettings:Lcom/motorola/otalib/downloadservice/utils/DownloadServiceSettings;

    return-object p0
.end method

.method static synthetic access$300()Landroid/net/Network;
    .locals 1

    sget-object v0, Lcom/motorola/otalib/downloadservice/download/policy/ZeroRatedManager;->mActiveAdminApnNetwork:Landroid/net/Network;

    return-object v0
.end method

.method static synthetic access$302(Landroid/net/Network;)Landroid/net/Network;
    .locals 0

    sput-object p0, Lcom/motorola/otalib/downloadservice/download/policy/ZeroRatedManager;->mActiveAdminApnNetwork:Landroid/net/Network;

    return-object p0
.end method

.method static synthetic access$402(Lcom/motorola/otalib/downloadservice/download/policy/ZeroRatedManager;Z)Z
    .locals 0

    iput-boolean p1, p0, Lcom/motorola/otalib/downloadservice/download/policy/ZeroRatedManager;->doIneedToBroadcast:Z

    return p1
.end method

.method static synthetic access$502(Lcom/motorola/otalib/downloadservice/download/policy/ZeroRatedManager;Z)Z
    .locals 0

    iput-boolean p1, p0, Lcom/motorola/otalib/downloadservice/download/policy/ZeroRatedManager;->doIneedToBroadcastInActive:Z

    return p1
.end method

.method public static returnActiveAdminApnNetwork()Landroid/net/Network;
    .locals 1

    sget-object v0, Lcom/motorola/otalib/downloadservice/download/policy/ZeroRatedManager;->mActiveAdminApnNetwork:Landroid/net/Network;

    return-object v0
.end method


# virtual methods
.method protected informZeroRatedChannelActive()V
    .locals 2

    iget-boolean v0, p0, Lcom/motorola/otalib/downloadservice/download/policy/ZeroRatedManager;->doIneedToBroadcast:Z

    if-eqz v0, :cond_0

    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/motorola/otalib/downloadservice/download/policy/ZeroRatedManager;->doIneedToBroadcast:Z

    sget-object v0, Lcom/motorola/otalib/downloadservice/utils/DownloadServiceLogger;->TAG:Ljava/lang/String;

    const-string v1, "zeroRatedManager, Broadcasting ZERORATED_CHANNEL_ACTIVE intent "

    invoke-static {v0, v1}, Lcom/motorola/otalib/downloadservice/utils/DownloadServiceLogger;->d(Ljava/lang/String;Ljava/lang/String;)V

    new-instance v0, Landroid/content/Intent;

    const-string v1, "com.motorola.downloadservice.ACTION_ZERORATED_CHANNEL_ACTIVE"

    invoke-direct {v0, v1}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    iget-object p0, p0, Lcom/motorola/otalib/downloadservice/download/policy/ZeroRatedManager;->mContext:Landroid/content/Context;

    invoke-static {p0, v0}, Lcom/motorola/otalib/common/utils/BroadcastUtils;->sendLocalBroadcast(Landroid/content/Context;Landroid/content/Intent;)V

    goto :goto_0

    :cond_0
    sget-object p0, Lcom/motorola/otalib/downloadservice/utils/DownloadServiceLogger;->TAG:Ljava/lang/String;

    const-string v0, "zeroRatedManager, ZERORATED_CHANNEL_ACTIVE intent already broadcasted "

    invoke-static {p0, v0}, Lcom/motorola/otalib/downloadservice/utils/DownloadServiceLogger;->d(Ljava/lang/String;Ljava/lang/String;)V

    :goto_0
    return-void
.end method

.method protected informZeroRatedChannelInActive(Ljava/lang/String;)V
    .locals 2

    iget-boolean v0, p0, Lcom/motorola/otalib/downloadservice/download/policy/ZeroRatedManager;->doIneedToBroadcastInActive:Z

    if-eqz v0, :cond_0

    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/motorola/otalib/downloadservice/download/policy/ZeroRatedManager;->doIneedToBroadcastInActive:Z

    sget-object v0, Lcom/motorola/otalib/downloadservice/utils/DownloadServiceLogger;->TAG:Ljava/lang/String;

    const-string v1, "zeroRatedManager, Broadcasting ZERORATED_CHANNEL_INACTIVE intent "

    invoke-static {v0, v1}, Lcom/motorola/otalib/downloadservice/utils/DownloadServiceLogger;->d(Ljava/lang/String;Ljava/lang/String;)V

    new-instance v0, Landroid/content/Intent;

    const-string v1, "com.motorola.downloadservice.ACTION_ZERORATED_CHANNEL_INACTIVE"

    invoke-direct {v0, v1}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    const-string v1, "key_inactive_reason"

    invoke-virtual {v0, v1, p1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    iget-object p0, p0, Lcom/motorola/otalib/downloadservice/download/policy/ZeroRatedManager;->mContext:Landroid/content/Context;

    invoke-static {p0, v0}, Lcom/motorola/otalib/common/utils/BroadcastUtils;->sendLocalBroadcast(Landroid/content/Context;Landroid/content/Intent;)V

    goto :goto_0

    :cond_0
    sget-object p0, Lcom/motorola/otalib/downloadservice/utils/DownloadServiceLogger;->TAG:Ljava/lang/String;

    const-string p1, "zeroRatedManager, ZERORATED_CHANNEL_INACTIVE intent already broadcasted "

    invoke-static {p0, p1}, Lcom/motorola/otalib/downloadservice/utils/DownloadServiceLogger;->d(Ljava/lang/String;Ljava/lang/String;)V

    :goto_0
    return-void
.end method

.method public isZeroRatedNetworkActive()Z
    .locals 6

    iget-object p0, p0, Lcom/motorola/otalib/downloadservice/download/policy/ZeroRatedManager;->mSettings:Lcom/motorola/otalib/downloadservice/utils/DownloadServiceSettings;

    const-string v0, "adminapnstatus"

    invoke-virtual {p0, v0}, Lcom/motorola/otalib/downloadservice/utils/DownloadServiceSettings;->getConfigValue(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    const-string v0, "connected"

    invoke-virtual {v0, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    sget-object v0, Lcom/motorola/otalib/downloadservice/download/policy/ZeroRatedManager;->mActiveAdminApnNetwork:Landroid/net/Network;

    const/4 v1, 0x1

    const/4 v2, 0x0

    if-eqz v0, :cond_0

    move v0, v1

    goto :goto_0

    :cond_0
    move v0, v2

    :goto_0
    sget-object v3, Lcom/motorola/otalib/downloadservice/utils/DownloadServiceLogger;->TAG:Ljava/lang/String;

    new-instance v4, Ljava/lang/StringBuilder;

    const-string v5, "ZeroRatedManager.isZeroRatedNetworkActive, adminApnStatus: "

    invoke-direct {v4, v5}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v4, p0}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, "; adminApnNetworkActive: "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Lcom/motorola/otalib/downloadservice/utils/DownloadServiceLogger;->i(Ljava/lang/String;Ljava/lang/String;)V

    if-eqz p0, :cond_1

    if-eqz v0, :cond_1

    goto :goto_1

    :cond_1
    move v1, v2

    :goto_1
    return v1
.end method

.method public requestZeroRatedNetworkChannel()V
    .locals 3

    new-instance v0, Landroid/net/NetworkRequest$Builder;

    invoke-direct {v0}, Landroid/net/NetworkRequest$Builder;-><init>()V

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/net/NetworkRequest$Builder;->addTransportType(I)Landroid/net/NetworkRequest$Builder;

    move-result-object v0

    const/4 v1, 0x3

    invoke-virtual {v0, v1}, Landroid/net/NetworkRequest$Builder;->addCapability(I)Landroid/net/NetworkRequest$Builder;

    move-result-object v0

    invoke-virtual {v0}, Landroid/net/NetworkRequest$Builder;->build()Landroid/net/NetworkRequest;

    move-result-object v0

    new-instance v1, Lcom/motorola/otalib/downloadservice/download/policy/ZeroRatedManager$AdminApnNetworkCallback;

    invoke-direct {v1, p0}, Lcom/motorola/otalib/downloadservice/download/policy/ZeroRatedManager$AdminApnNetworkCallback;-><init>(Lcom/motorola/otalib/downloadservice/download/policy/ZeroRatedManager;)V

    sput-object v1, Lcom/motorola/otalib/downloadservice/download/policy/ZeroRatedManager;->mAdminApnNetworkCallback:Landroid/net/ConnectivityManager$NetworkCallback;

    iget-object v1, p0, Lcom/motorola/otalib/downloadservice/download/policy/ZeroRatedManager;->mContext:Landroid/content/Context;

    const-string v2, "connectivity"

    invoke-virtual {v1, v2}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/net/ConnectivityManager;

    iput-object v1, p0, Lcom/motorola/otalib/downloadservice/download/policy/ZeroRatedManager;->mConnectivityManager:Landroid/net/ConnectivityManager;

    sget-object v1, Lcom/motorola/otalib/downloadservice/utils/DownloadServiceLogger;->TAG:Ljava/lang/String;

    const-string v2, "ZeroRatedManager.requestZeroRatedNetworkChannel, requesting for VZWADMIN network"

    invoke-static {v1, v2}, Lcom/motorola/otalib/downloadservice/utils/DownloadServiceLogger;->d(Ljava/lang/String;Ljava/lang/String;)V

    iget-object p0, p0, Lcom/motorola/otalib/downloadservice/download/policy/ZeroRatedManager;->mConnectivityManager:Landroid/net/ConnectivityManager;

    sget-object v1, Lcom/motorola/otalib/downloadservice/download/policy/ZeroRatedManager;->mAdminApnNetworkCallback:Landroid/net/ConnectivityManager$NetworkCallback;

    const v2, 0x493e0

    invoke-virtual {p0, v0, v1, v2}, Landroid/net/ConnectivityManager;->requestNetwork(Landroid/net/NetworkRequest;Landroid/net/ConnectivityManager$NetworkCallback;I)V

    return-void
.end method

.method public sendCleanUpNotification(Ljava/lang/String;)V
    .locals 2

    new-instance v0, Landroid/content/Intent;

    const-string v1, "com.motorola.downloadservice.ACTION_ZERORATED_CLEANUP"

    invoke-direct {v0, v1}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    const-string v1, "com.motorola.downloadservice.ACTION_ZERORATED_CLEANUP_MESSAGE"

    invoke-virtual {v0, v1, p1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    iget-object p0, p0, Lcom/motorola/otalib/downloadservice/download/policy/ZeroRatedManager;->mContext:Landroid/content/Context;

    invoke-static {p0, v0}, Lcom/motorola/otalib/common/utils/BroadcastUtils;->sendLocalBroadcast(Landroid/content/Context;Landroid/content/Intent;)V

    return-void
.end method

.method public stopZeroRatedChannel()V
    .locals 4

    iget-object v0, p0, Lcom/motorola/otalib/downloadservice/download/policy/ZeroRatedManager;->mContext:Landroid/content/Context;

    const-string v1, "connectivity"

    invoke-virtual {v0, v1}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/net/ConnectivityManager;

    iput-object v0, p0, Lcom/motorola/otalib/downloadservice/download/policy/ZeroRatedManager;->mConnectivityManager:Landroid/net/ConnectivityManager;

    sget-object v1, Lcom/motorola/otalib/downloadservice/download/policy/ZeroRatedManager;->mAdminApnNetworkCallback:Landroid/net/ConnectivityManager$NetworkCallback;

    const/4 v2, 0x0

    if-eqz v1, :cond_0

    invoke-virtual {v0, v1}, Landroid/net/ConnectivityManager;->unregisterNetworkCallback(Landroid/net/ConnectivityManager$NetworkCallback;)V

    sget-object v0, Lcom/motorola/otalib/downloadservice/utils/DownloadServiceLogger;->TAG:Ljava/lang/String;

    const-string v1, "zeroRatedManager, stopZeroRatedChannel(): unregistered admin apn network callback"

    invoke-static {v0, v1}, Lcom/motorola/otalib/downloadservice/utils/DownloadServiceLogger;->d(Ljava/lang/String;Ljava/lang/String;)V

    sput-object v2, Lcom/motorola/otalib/downloadservice/download/policy/ZeroRatedManager;->mAdminApnNetworkCallback:Landroid/net/ConnectivityManager$NetworkCallback;

    :cond_0
    iget-object v0, p0, Lcom/motorola/otalib/downloadservice/download/policy/ZeroRatedManager;->mSettings:Lcom/motorola/otalib/downloadservice/utils/DownloadServiceSettings;

    const-string v1, "adminapnstatus"

    const-string v3, "disconnected"

    invoke-virtual {v0, v1, v3}, Lcom/motorola/otalib/downloadservice/utils/DownloadServiceSettings;->setConfigValue(Ljava/lang/String;Ljava/lang/String;)V

    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/motorola/otalib/downloadservice/download/policy/ZeroRatedManager;->doIneedToBroadcast:Z

    iput-boolean v0, p0, Lcom/motorola/otalib/downloadservice/download/policy/ZeroRatedManager;->doIneedToBroadcastInActive:Z

    iget-object p0, p0, Lcom/motorola/otalib/downloadservice/download/policy/ZeroRatedManager;->mConnectivityManager:Landroid/net/ConnectivityManager;

    invoke-virtual {p0, v2}, Landroid/net/ConnectivityManager;->bindProcessToNetwork(Landroid/net/Network;)Z

    move-result p0

    sget-object v0, Lcom/motorola/otalib/downloadservice/utils/DownloadServiceLogger;->TAG:Ljava/lang/String;

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "zeroRatedManager, stopZeroRatedChannel stopResult: "

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-static {v0, p0}, Lcom/motorola/otalib/downloadservice/utils/DownloadServiceLogger;->d(Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method
