.class Lcom/motorola/ccc/ota/CusPolicy;
.super Ljava/lang/Object;
.source "CusPolicy.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/motorola/ccc/ota/CusPolicy$ConnectionChoice;
    }
.end annotation


# instance fields
.field private final CHECK_WIFI_FOR_BOTA:Ljava/lang/String;

.field private cm:Landroid/net/ConnectivityManager;

.field preferredCheckForUpdateConnections:Ljava/util/EnumSet;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/EnumSet<",
            "Lcom/motorola/ccc/ota/CusPolicy$ConnectionChoice;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Landroid/net/ConnectivityManager;)V
    .locals 1

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const-string v0, "com.motorola.ccc.ota.R.bool.check_WIFI_for_BOTA"

    iput-object v0, p0, Lcom/motorola/ccc/ota/CusPolicy;->CHECK_WIFI_FOR_BOTA:Ljava/lang/String;

    const/4 v0, 0x0

    iput-object v0, p0, Lcom/motorola/ccc/ota/CusPolicy;->preferredCheckForUpdateConnections:Ljava/util/EnumSet;

    iput-object p1, p0, Lcom/motorola/ccc/ota/CusPolicy;->cm:Landroid/net/ConnectivityManager;

    return-void
.end method


# virtual methods
.method public canICheckForUpdate(Z)Z
    .locals 0

    invoke-virtual {p0}, Lcom/motorola/ccc/ota/CusPolicy;->checkForUpdateOnWifiOnly()Z

    move-result p1

    if-eqz p1, :cond_1

    iget-object p1, p0, Lcom/motorola/ccc/ota/CusPolicy;->preferredCheckForUpdateConnections:Ljava/util/EnumSet;

    if-eqz p1, :cond_1

    iget-object p1, p0, Lcom/motorola/ccc/ota/CusPolicy;->cm:Landroid/net/ConnectivityManager;

    invoke-static {p1}, Lcom/motorola/otalib/common/utils/NetworkUtils;->isWifi(Landroid/net/ConnectivityManager;)Z

    move-result p1

    if-eqz p1, :cond_0

    sget-object p1, Lcom/motorola/ccc/ota/CusPolicy$ConnectionChoice;->WIFI:Lcom/motorola/ccc/ota/CusPolicy$ConnectionChoice;

    goto :goto_0

    :cond_0
    const/4 p1, 0x0

    :goto_0
    iget-object p0, p0, Lcom/motorola/ccc/ota/CusPolicy;->preferredCheckForUpdateConnections:Ljava/util/EnumSet;

    invoke-virtual {p0, p1}, Ljava/util/EnumSet;->contains(Ljava/lang/Object;)Z

    move-result p0

    return p0

    :cond_1
    const/4 p0, 0x1

    return p0
.end method

.method checkForUpdateOnWifiOnly()Z
    .locals 0

    const/4 p0, 0x0

    return p0
.end method
