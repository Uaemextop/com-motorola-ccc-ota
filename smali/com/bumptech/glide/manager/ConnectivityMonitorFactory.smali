.class public Lcom/bumptech/glide/manager/ConnectivityMonitorFactory;
.super Ljava/lang/Object;
.source "ConnectivityMonitorFactory.java"


# direct methods
.method public constructor <init>()V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public build(Landroid/content/Context;Lcom/bumptech/glide/manager/ConnectivityMonitor$ConnectivityListener;)Lcom/bumptech/glide/manager/ConnectivityMonitor;
    .locals 0

    const-string p0, "android.permission.ACCESS_NETWORK_STATE"

    invoke-virtual {p1, p0}, Landroid/content/Context;->checkCallingOrSelfPermission(Ljava/lang/String;)I

    move-result p0

    if-nez p0, :cond_0

    new-instance p0, Lcom/bumptech/glide/manager/DefaultConnectivityMonitor;

    invoke-direct {p0, p1, p2}, Lcom/bumptech/glide/manager/DefaultConnectivityMonitor;-><init>(Landroid/content/Context;Lcom/bumptech/glide/manager/ConnectivityMonitor$ConnectivityListener;)V

    return-object p0

    :cond_0
    new-instance p0, Lcom/bumptech/glide/manager/NullConnectivityMonitor;

    invoke-direct {p0}, Lcom/bumptech/glide/manager/NullConnectivityMonitor;-><init>()V

    return-object p0
.end method
