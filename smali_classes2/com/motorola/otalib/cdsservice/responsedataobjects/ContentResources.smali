.class public Lcom/motorola/otalib/cdsservice/responsedataobjects/ContentResources;
.super Ljava/lang/Object;
.source "ContentResources.java"


# instance fields
.field private mAdminApnHeaders:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private mAdminApnUrl:Ljava/lang/String;

.field private mCellularHeaders:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private mCellularUrl:Ljava/lang/String;

.field private mProceed:Z

.field private mTrackingId:Ljava/lang/String;

.field private mWifiHeaders:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private mWifiUrl:Ljava/lang/String;


# direct methods
.method public constructor <init>(ZLjava/lang/String;Ljava/util/Map;Ljava/lang/String;Ljava/util/Map;Ljava/lang/String;Ljava/util/Map;Ljava/lang/String;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(Z",
            "Ljava/lang/String;",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;",
            "Ljava/lang/String;",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;",
            "Ljava/lang/String;",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;",
            "Ljava/lang/String;",
            ")V"
        }
    .end annotation

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-boolean p1, p0, Lcom/motorola/otalib/cdsservice/responsedataobjects/ContentResources;->mProceed:Z

    iput-object p2, p0, Lcom/motorola/otalib/cdsservice/responsedataobjects/ContentResources;->mWifiUrl:Ljava/lang/String;

    iput-object p4, p0, Lcom/motorola/otalib/cdsservice/responsedataobjects/ContentResources;->mCellularUrl:Ljava/lang/String;

    iput-object p3, p0, Lcom/motorola/otalib/cdsservice/responsedataobjects/ContentResources;->mWifiHeaders:Ljava/util/Map;

    iput-object p5, p0, Lcom/motorola/otalib/cdsservice/responsedataobjects/ContentResources;->mCellularHeaders:Ljava/util/Map;

    iput-object p6, p0, Lcom/motorola/otalib/cdsservice/responsedataobjects/ContentResources;->mAdminApnUrl:Ljava/lang/String;

    iput-object p7, p0, Lcom/motorola/otalib/cdsservice/responsedataobjects/ContentResources;->mAdminApnHeaders:Ljava/util/Map;

    iput-object p8, p0, Lcom/motorola/otalib/cdsservice/responsedataobjects/ContentResources;->mTrackingId:Ljava/lang/String;

    return-void
.end method


# virtual methods
.method public getAdminApnHeaders()Ljava/util/Map;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    iget-object p0, p0, Lcom/motorola/otalib/cdsservice/responsedataobjects/ContentResources;->mAdminApnHeaders:Ljava/util/Map;

    return-object p0
.end method

.method public getAdminApnUrl()Ljava/lang/String;
    .locals 0

    iget-object p0, p0, Lcom/motorola/otalib/cdsservice/responsedataobjects/ContentResources;->mAdminApnUrl:Ljava/lang/String;

    return-object p0
.end method

.method public getCellularHeaders()Ljava/util/Map;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    iget-object p0, p0, Lcom/motorola/otalib/cdsservice/responsedataobjects/ContentResources;->mCellularHeaders:Ljava/util/Map;

    return-object p0
.end method

.method public getCellularUrl()Ljava/lang/String;
    .locals 0

    iget-object p0, p0, Lcom/motorola/otalib/cdsservice/responsedataobjects/ContentResources;->mCellularUrl:Ljava/lang/String;

    return-object p0
.end method

.method public getProceed()Z
    .locals 0

    iget-boolean p0, p0, Lcom/motorola/otalib/cdsservice/responsedataobjects/ContentResources;->mProceed:Z

    return p0
.end method

.method public getTrackingId()Ljava/lang/String;
    .locals 0

    iget-object p0, p0, Lcom/motorola/otalib/cdsservice/responsedataobjects/ContentResources;->mTrackingId:Ljava/lang/String;

    return-object p0
.end method

.method public getWifiHeaders()Ljava/util/Map;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    iget-object p0, p0, Lcom/motorola/otalib/cdsservice/responsedataobjects/ContentResources;->mWifiHeaders:Ljava/util/Map;

    return-object p0
.end method

.method public getWifiUrl()Ljava/lang/String;
    .locals 0

    iget-object p0, p0, Lcom/motorola/otalib/cdsservice/responsedataobjects/ContentResources;->mWifiUrl:Ljava/lang/String;

    return-object p0
.end method
