.class public Lcom/motorola/ccc/ota/stats/StatsDownloadIface;
.super Ljava/lang/Object;
.source "StatsDownloadIface.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/motorola/ccc/ota/stats/StatsDownloadIface$IfaceName;
    }
.end annotation


# instance fields
.field public iface:Lcom/motorola/ccc/ota/stats/StatsDownloadIface$IfaceName;

.field public rxBytes:J

.field public txBytes:J


# direct methods
.method public constructor <init>(Lcom/motorola/ccc/ota/stats/StatsDownloadIface$IfaceName;JJ)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/motorola/ccc/ota/stats/StatsDownloadIface;->iface:Lcom/motorola/ccc/ota/stats/StatsDownloadIface$IfaceName;

    iput-wide p2, p0, Lcom/motorola/ccc/ota/stats/StatsDownloadIface;->rxBytes:J

    iput-wide p4, p0, Lcom/motorola/ccc/ota/stats/StatsDownloadIface;->txBytes:J

    return-void
.end method
