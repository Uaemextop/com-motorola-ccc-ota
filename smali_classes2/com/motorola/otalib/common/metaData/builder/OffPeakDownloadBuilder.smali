.class Lcom/motorola/otalib/common/metaData/builder/OffPeakDownloadBuilder;
.super Ljava/lang/Object;
.source "OffPeakDownloadBuilder.java"


# direct methods
.method constructor <init>()V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static from(Ljava/lang/String;)Lcom/motorola/otalib/common/metaData/OffPeakDownload;
    .locals 1

    :try_start_0
    new-instance v0, Lorg/json/JSONObject;

    invoke-direct {v0, p0}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    invoke-static {v0}, Lcom/motorola/otalib/common/metaData/builder/OffPeakDownloadBuilder;->from(Lorg/json/JSONObject;)Lcom/motorola/otalib/common/metaData/OffPeakDownload;

    move-result-object p0
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    return-object p0

    :catch_0
    const/4 p0, 0x0

    return-object p0
.end method

.method public static from(Lorg/json/JSONObject;)Lcom/motorola/otalib/common/metaData/OffPeakDownload;
    .locals 6

    const/4 v0, 0x0

    if-nez p0, :cond_0

    return-object v0

    :cond_0
    :try_start_0
    new-instance v1, Lcom/motorola/otalib/common/metaData/OffPeakDownload;

    const-string v2, "useLocalTz"

    invoke-virtual {p0, v2}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    const-string v3, "promotionTime"

    invoke-virtual {p0, v3}, Lorg/json/JSONObject;->getInt(Ljava/lang/String;)I

    move-result v3

    const-string v4, "startTime"

    invoke-virtual {p0, v4}, Lorg/json/JSONObject;->getInt(Ljava/lang/String;)I

    move-result v4

    const-string v5, "duration"

    invoke-virtual {p0, v5}, Lorg/json/JSONObject;->getInt(Ljava/lang/String;)I

    move-result p0

    invoke-direct {v1, v2, v3, v4, p0}, Lcom/motorola/otalib/common/metaData/OffPeakDownload;-><init>(Ljava/lang/String;III)V
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    return-object v1

    :catch_0
    return-object v0
.end method

.method public static toJSONObject(Lcom/motorola/otalib/common/metaData/OffPeakDownload;)Lorg/json/JSONObject;
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/json/JSONException;
        }
    .end annotation

    if-nez p0, :cond_0

    const/4 p0, 0x0

    return-object p0

    :cond_0
    new-instance v0, Lorg/json/JSONObject;

    invoke-direct {v0}, Lorg/json/JSONObject;-><init>()V

    const-string v1, "useLocalTz"

    invoke-virtual {p0}, Lcom/motorola/otalib/common/metaData/OffPeakDownload;->isUseLocalTz()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    move-result-object v0

    const-string v1, "promotionTime"

    invoke-virtual {p0}, Lcom/motorola/otalib/common/metaData/OffPeakDownload;->getPromotionTime()I

    move-result v2

    invoke-virtual {v0, v1, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;I)Lorg/json/JSONObject;

    move-result-object v0

    const-string v1, "startTime"

    invoke-virtual {p0}, Lcom/motorola/otalib/common/metaData/OffPeakDownload;->getStartTime()I

    move-result v2

    invoke-virtual {v0, v1, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;I)Lorg/json/JSONObject;

    move-result-object v0

    const-string v1, "duration"

    invoke-virtual {p0}, Lcom/motorola/otalib/common/metaData/OffPeakDownload;->getDuration()I

    move-result p0

    invoke-virtual {v0, v1, p0}, Lorg/json/JSONObject;->put(Ljava/lang/String;I)Lorg/json/JSONObject;

    move-result-object p0

    return-object p0
.end method

.method public static toJSONString(Lcom/motorola/otalib/common/metaData/OffPeakDownload;)Ljava/lang/String;
    .locals 0

    if-nez p0, :cond_0

    const/4 p0, 0x0

    return-object p0

    :cond_0
    invoke-static {p0}, Lcom/motorola/otalib/common/metaData/builder/OffPeakDownloadBuilder;->toJSONString(Lcom/motorola/otalib/common/metaData/OffPeakDownload;)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method
