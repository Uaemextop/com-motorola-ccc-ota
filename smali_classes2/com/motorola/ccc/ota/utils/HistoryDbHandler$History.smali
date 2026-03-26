.class public Lcom/motorola/ccc/ota/utils/HistoryDbHandler$History;
.super Ljava/lang/Object;
.source "HistoryDbHandler.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/motorola/ccc/ota/utils/HistoryDbHandler;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = "History"
.end annotation


# instance fields
.field private releaseNotes:Ljava/lang/String;

.field private sourceVersion:Ljava/lang/String;

.field private targetVersion:Ljava/lang/String;

.field final synthetic this$0:Lcom/motorola/ccc/ota/utils/HistoryDbHandler;

.field private updateTime:J

.field private updateType:Ljava/lang/String;

.field private upgradeNotes:Ljava/lang/String;


# direct methods
.method public constructor <init>(Lcom/motorola/ccc/ota/utils/HistoryDbHandler;)V
    .locals 0

    iput-object p1, p0, Lcom/motorola/ccc/ota/utils/HistoryDbHandler$History;->this$0:Lcom/motorola/ccc/ota/utils/HistoryDbHandler;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public getReleaseNotes()Ljava/lang/String;
    .locals 0

    iget-object p0, p0, Lcom/motorola/ccc/ota/utils/HistoryDbHandler$History;->releaseNotes:Ljava/lang/String;

    return-object p0
.end method

.method public getSourceVersion()Ljava/lang/String;
    .locals 0

    iget-object p0, p0, Lcom/motorola/ccc/ota/utils/HistoryDbHandler$History;->sourceVersion:Ljava/lang/String;

    return-object p0
.end method

.method public getTargetVersion()Ljava/lang/String;
    .locals 0

    iget-object p0, p0, Lcom/motorola/ccc/ota/utils/HistoryDbHandler$History;->targetVersion:Ljava/lang/String;

    return-object p0
.end method

.method public getUpdateTime()J
    .locals 2

    iget-wide v0, p0, Lcom/motorola/ccc/ota/utils/HistoryDbHandler$History;->updateTime:J

    return-wide v0
.end method

.method public getUpdateType()Ljava/lang/String;
    .locals 0

    iget-object p0, p0, Lcom/motorola/ccc/ota/utils/HistoryDbHandler$History;->updateType:Ljava/lang/String;

    return-object p0
.end method

.method public getUpgradeNotes()Ljava/lang/String;
    .locals 0

    iget-object p0, p0, Lcom/motorola/ccc/ota/utils/HistoryDbHandler$History;->upgradeNotes:Ljava/lang/String;

    return-object p0
.end method

.method public setReleaseNotes(Ljava/lang/String;)V
    .locals 0

    iput-object p1, p0, Lcom/motorola/ccc/ota/utils/HistoryDbHandler$History;->releaseNotes:Ljava/lang/String;

    return-void
.end method

.method public setSourceVersion(Ljava/lang/String;)V
    .locals 0

    iput-object p1, p0, Lcom/motorola/ccc/ota/utils/HistoryDbHandler$History;->sourceVersion:Ljava/lang/String;

    return-void
.end method

.method public setTargetVersion(Ljava/lang/String;)V
    .locals 0

    iput-object p1, p0, Lcom/motorola/ccc/ota/utils/HistoryDbHandler$History;->targetVersion:Ljava/lang/String;

    return-void
.end method

.method public setUpdateTime(J)V
    .locals 0

    iput-wide p1, p0, Lcom/motorola/ccc/ota/utils/HistoryDbHandler$History;->updateTime:J

    return-void
.end method

.method public setUpdateType(Ljava/lang/String;)V
    .locals 0

    iput-object p1, p0, Lcom/motorola/ccc/ota/utils/HistoryDbHandler$History;->updateType:Ljava/lang/String;

    return-void
.end method

.method public setUpgradeNotes(Ljava/lang/String;)V
    .locals 0

    iput-object p1, p0, Lcom/motorola/ccc/ota/utils/HistoryDbHandler$History;->upgradeNotes:Ljava/lang/String;

    return-void
.end method
