.class Lcom/motorola/otalib/common/metaData/builder/DownloadTimesBuilder;
.super Ljava/lang/Object;
.source "DownloadTimesBuilder.java"


# direct methods
.method constructor <init>()V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static from(Ljava/lang/String;)Lcom/motorola/otalib/common/metaData/DownloadTimes;
    .locals 1

    :try_start_0
    new-instance v0, Lorg/json/JSONObject;

    invoke-direct {v0, p0}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    invoke-static {v0}, Lcom/motorola/otalib/common/metaData/builder/DownloadTimesBuilder;->from(Lorg/json/JSONObject;)Lcom/motorola/otalib/common/metaData/DownloadTimes;

    move-result-object p0
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    return-object p0

    :catch_0
    const/4 p0, 0x0

    return-object p0
.end method

.method public static from(Lorg/json/JSONObject;)Lcom/motorola/otalib/common/metaData/DownloadTimes;
    .locals 4

    const/4 v0, 0x0

    if-nez p0, :cond_0

    return-object v0

    :cond_0
    :try_start_0
    new-instance v1, Lcom/motorola/otalib/common/metaData/DownloadTimes;

    const-string v2, "useLocalTz"

    invoke-virtual {p0, v2}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    const-string v3, "timeSlots"

    invoke-virtual {p0, v3}, Lorg/json/JSONObject;->getJSONArray(Ljava/lang/String;)Lorg/json/JSONArray;

    move-result-object p0

    invoke-static {p0}, Lcom/motorola/otalib/common/metaData/builder/DownloadTimesBuilder;->getDownloadTimes(Lorg/json/JSONArray;)[[J

    move-result-object p0

    invoke-direct {v1, v2, p0}, Lcom/motorola/otalib/common/metaData/DownloadTimes;-><init>(Ljava/lang/String;[[J)V
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    return-object v1

    :catch_0
    return-object v0
.end method

.method private static getDownloadTimes(Lorg/json/JSONArray;)[[J
    .locals 2

    new-instance p0, Ljava/util/Vector;

    invoke-direct {p0}, Ljava/util/Vector;-><init>()V

    const/4 p0, 0x2

    new-array p0, p0, [I

    const/4 v0, 0x1

    const/4 v1, 0x0

    aput v1, p0, v0

    aput v1, p0, v1

    sget-object v0, Ljava/lang/Long;->TYPE:Ljava/lang/Class;

    invoke-static {v0, p0}, Ljava/lang/reflect/Array;->newInstance(Ljava/lang/Class;[I)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, [[J

    return-object p0
.end method

.method public static toJSONObject(Lcom/motorola/otalib/common/metaData/DownloadTimes;)Lorg/json/JSONObject;
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
    new-instance v0, Lorg/json/JSONArray;

    invoke-static {}, Ljava/util/Collections;->emptyList()Ljava/util/List;

    move-result-object v1

    invoke-direct {v0, v1}, Lorg/json/JSONArray;-><init>(Ljava/util/Collection;)V

    new-instance v1, Lorg/json/JSONObject;

    invoke-direct {v1}, Lorg/json/JSONObject;-><init>()V

    const-string v2, "useLocalTz"

    invoke-virtual {p0}, Lcom/motorola/otalib/common/metaData/DownloadTimes;->isUseLocalTz()Ljava/lang/String;

    move-result-object p0

    invoke-virtual {v1, v2, p0}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    move-result-object p0

    const-string v1, "timeSlots"

    invoke-virtual {p0, v1, v0}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    move-result-object p0

    return-object p0
.end method

.method public static toJSONString(Lcom/motorola/otalib/common/metaData/DownloadTimes;)Ljava/lang/String;
    .locals 0

    if-nez p0, :cond_0

    const/4 p0, 0x0

    return-object p0

    :cond_0
    invoke-static {p0}, Lcom/motorola/otalib/common/metaData/builder/DownloadTimesBuilder;->toJSONString(Lcom/motorola/otalib/common/metaData/DownloadTimes;)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method
