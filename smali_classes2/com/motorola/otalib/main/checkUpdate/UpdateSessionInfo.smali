.class public Lcom/motorola/otalib/main/checkUpdate/UpdateSessionInfo;
.super Ljava/lang/Object;
.source "UpdateSessionInfo.java"


# instance fields
.field checkRequestObj:Lcom/motorola/otalib/main/checkUpdate/CheckRequestObj;

.field contentTimeSTamp:J

.field keepPackage:Z

.field reportingTag:Ljava/lang/String;

.field serviceControlResponse:Ljava/lang/String;

.field statusCode:I

.field trackingId:Ljava/lang/String;


# direct methods
.method public constructor <init>()V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static arrayListFromJson(Ljava/lang/String;)Ljava/util/List;
    .locals 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            ")",
            "Ljava/util/List<",
            "Lcom/motorola/otalib/main/checkUpdate/UpdateSessionInfo;",
            ">;"
        }
    .end annotation

    new-instance v0, Lcom/google/gson/Gson;

    invoke-direct {v0}, Lcom/google/gson/Gson;-><init>()V

    const-class v1, Lcom/google/gson/JsonArray;

    invoke-virtual {v0, p0, v1}, Lcom/google/gson/Gson;->fromJson(Ljava/lang/String;Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lcom/google/gson/JsonArray;

    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    const/4 v2, 0x0

    :goto_0
    invoke-virtual {p0}, Lcom/google/gson/JsonArray;->size()I

    move-result v3

    if-ge v2, v3, :cond_0

    invoke-virtual {p0, v2}, Lcom/google/gson/JsonArray;->get(I)Lcom/google/gson/JsonElement;

    move-result-object v3

    invoke-virtual {v3}, Lcom/google/gson/JsonElement;->getAsJsonObject()Lcom/google/gson/JsonObject;

    move-result-object v3

    const-class v4, Lcom/motorola/otalib/main/checkUpdate/UpdateSessionInfo;

    invoke-virtual {v0, v3, v4}, Lcom/google/gson/Gson;->fromJson(Lcom/google/gson/JsonElement;Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/motorola/otalib/main/checkUpdate/UpdateSessionInfo;

    invoke-interface {v1, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    :cond_0
    return-object v1
.end method

.method public static arrayListToJson(Ljava/util/List;)Ljava/lang/String;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/motorola/otalib/main/checkUpdate/UpdateSessionInfo;",
            ">;)",
            "Ljava/lang/String;"
        }
    .end annotation

    new-instance v0, Lcom/google/gson/Gson;

    invoke-direct {v0}, Lcom/google/gson/Gson;-><init>()V

    new-instance v1, Lcom/google/gson/JsonArray;

    invoke-direct {v1}, Lcom/google/gson/JsonArray;-><init>()V

    invoke-interface {p0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object p0

    :goto_0
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_0

    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/motorola/otalib/main/checkUpdate/UpdateSessionInfo;

    invoke-virtual {v0, v2}, Lcom/google/gson/Gson;->toJsonTree(Ljava/lang/Object;)Lcom/google/gson/JsonElement;

    move-result-object v2

    invoke-virtual {v2}, Lcom/google/gson/JsonElement;->getAsJsonObject()Lcom/google/gson/JsonObject;

    move-result-object v2

    invoke-virtual {v1, v2}, Lcom/google/gson/JsonArray;->add(Lcom/google/gson/JsonElement;)V

    goto :goto_0

    :cond_0
    invoke-virtual {v1}, Lcom/google/gson/JsonArray;->toString()Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method public static deleteSessionDetails(Lcom/motorola/otalib/common/settings/Settings;Ljava/lang/String;)V
    .locals 5

    sget-object v0, Lcom/motorola/otalib/main/Settings/LibConfigs;->UPDATE_SESSION_MAPPER:Lcom/motorola/otalib/main/Settings/LibConfigs;

    invoke-virtual {p0, v0}, Lcom/motorola/otalib/common/settings/Settings;->getString(Lcom/motorola/otalib/common/settings/ISetting;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    if-eqz v1, :cond_0

    return-void

    :cond_0
    new-instance v1, Ljava/util/LinkedHashMap;

    invoke-direct {v1}, Ljava/util/LinkedHashMap;-><init>()V

    :try_start_0
    new-instance v2, Lorg/json/JSONObject;

    invoke-direct {v2, v0}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    invoke-virtual {v2}, Lorg/json/JSONObject;->keys()Ljava/util/Iterator;

    move-result-object v0

    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_1

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/String;

    invoke-virtual {v2, v3}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    invoke-interface {v1, v3, v4}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception v0

    sget-object v2, Lcom/motorola/otalib/main/Logger;->OTALib_TAG:Ljava/lang/String;

    new-instance v3, Ljava/lang/StringBuilder;

    const-string v4, "deleteSessionDetails:Exception:msg="

    invoke-direct {v3, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v2, v0}, Lcom/motorola/otalib/main/Logger;->error(Ljava/lang/String;Ljava/lang/String;)V

    :cond_1
    invoke-interface {v1, p1}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    sget-object p1, Lcom/motorola/otalib/main/Settings/LibConfigs;->UPDATE_SESSION_MAPPER:Lcom/motorola/otalib/main/Settings/LibConfigs;

    new-instance v0, Lorg/json/JSONObject;

    invoke-direct {v0, v1}, Lorg/json/JSONObject;-><init>(Ljava/util/Map;)V

    invoke-virtual {v0}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, p1, v0}, Lcom/motorola/otalib/common/settings/Settings;->setString(Lcom/motorola/otalib/common/settings/ISetting;Ljava/lang/String;)V

    return-void
.end method

.method public static fromJsonString(Ljava/lang/String;)Lcom/motorola/otalib/main/checkUpdate/UpdateSessionInfo;
    .locals 2

    new-instance v0, Lcom/google/gson/Gson;

    invoke-direct {v0}, Lcom/google/gson/Gson;-><init>()V

    const-class v1, Lcom/motorola/otalib/main/checkUpdate/UpdateSessionInfo;

    invoke-virtual {v0, p0, v1}, Lcom/google/gson/Gson;->fromJson(Ljava/lang/String;Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lcom/motorola/otalib/main/checkUpdate/UpdateSessionInfo;

    return-object p0
.end method

.method public static getSessionDetails(Lcom/motorola/otalib/common/settings/Settings;Ljava/lang/String;)Lcom/motorola/otalib/main/checkUpdate/UpdateSessionInfo;
    .locals 4

    sget-object v0, Lcom/motorola/otalib/main/Settings/LibConfigs;->UPDATE_SESSION_MAPPER:Lcom/motorola/otalib/main/Settings/LibConfigs;

    invoke-virtual {p0, v0}, Lcom/motorola/otalib/common/settings/Settings;->getString(Lcom/motorola/otalib/common/settings/ISetting;)Ljava/lang/String;

    move-result-object p0

    invoke-static {p0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_0

    new-instance p0, Lcom/motorola/otalib/main/checkUpdate/UpdateSessionInfo;

    invoke-direct {p0}, Lcom/motorola/otalib/main/checkUpdate/UpdateSessionInfo;-><init>()V

    return-object p0

    :cond_0
    new-instance v0, Ljava/util/LinkedHashMap;

    invoke-direct {v0}, Ljava/util/LinkedHashMap;-><init>()V

    :try_start_0
    new-instance v1, Lorg/json/JSONObject;

    invoke-direct {v1, p0}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1}, Lorg/json/JSONObject;->keys()Ljava/util/Iterator;

    move-result-object p0

    :goto_0
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_1

    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    invoke-virtual {v1, v2}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-interface {v0, v2, v3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception p0

    sget-object v1, Lcom/motorola/otalib/main/Logger;->OTALib_TAG:Ljava/lang/String;

    new-instance v2, Ljava/lang/StringBuilder;

    const-string v3, "getSessionDetails:Exception:msg="

    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v2, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-static {v1, p0}, Lcom/motorola/otalib/main/Logger;->error(Ljava/lang/String;Ljava/lang/String;)V

    :cond_1
    invoke-interface {v0, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Ljava/lang/String;

    invoke-static {p0}, Lcom/motorola/otalib/main/checkUpdate/UpdateSessionInfo;->fromJsonString(Ljava/lang/String;)Lcom/motorola/otalib/main/checkUpdate/UpdateSessionInfo;

    move-result-object p0

    if-nez p0, :cond_2

    new-instance p0, Lcom/motorola/otalib/main/checkUpdate/UpdateSessionInfo;

    invoke-direct {p0}, Lcom/motorola/otalib/main/checkUpdate/UpdateSessionInfo;-><init>()V

    :cond_2
    return-object p0
.end method

.method public static isUpdateGoingOn(Lcom/motorola/otalib/common/settings/Settings;Ljava/lang/String;)Z
    .locals 5

    sget-object v0, Lcom/motorola/otalib/main/Settings/LibConfigs;->UPDATE_SESSION_MAPPER:Lcom/motorola/otalib/main/Settings/LibConfigs;

    invoke-virtual {p0, v0}, Lcom/motorola/otalib/common/settings/Settings;->getString(Lcom/motorola/otalib/common/settings/ISetting;)Ljava/lang/String;

    move-result-object p0

    invoke-static {p0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    const/4 v1, 0x0

    if-eqz v0, :cond_0

    return v1

    :cond_0
    new-instance v0, Ljava/util/LinkedHashMap;

    invoke-direct {v0}, Ljava/util/LinkedHashMap;-><init>()V

    :try_start_0
    new-instance v2, Lorg/json/JSONObject;

    invoke-direct {v2, p0}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    invoke-virtual {v2}, Lorg/json/JSONObject;->keys()Ljava/util/Iterator;

    move-result-object p0

    :goto_0
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_1

    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/String;

    invoke-virtual {v2, v3}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    invoke-interface {v0, v3, v4}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception p0

    sget-object v2, Lcom/motorola/otalib/main/Logger;->OTALib_TAG:Ljava/lang/String;

    new-instance v3, Ljava/lang/StringBuilder;

    const-string v4, "isUpdateGoingOn:Exception:msg="

    invoke-direct {v3, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v3, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-static {v2, p0}, Lcom/motorola/otalib/main/Logger;->error(Ljava/lang/String;Ljava/lang/String;)V

    :cond_1
    invoke-interface {v0, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Ljava/lang/String;

    invoke-static {p0}, Lcom/motorola/otalib/main/checkUpdate/UpdateSessionInfo;->fromJsonString(Ljava/lang/String;)Lcom/motorola/otalib/main/checkUpdate/UpdateSessionInfo;

    move-result-object p0

    if-nez p0, :cond_2

    return v1

    :cond_2
    const/4 p0, 0x1

    return p0
.end method

.method public static setSessionDetails(Lcom/motorola/otalib/common/settings/Settings;Ljava/lang/String;Lcom/motorola/otalib/main/checkUpdate/UpdateSessionInfo;)Ljava/util/Map;
    .locals 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/motorola/otalib/common/settings/Settings;",
            "Ljava/lang/String;",
            "Lcom/motorola/otalib/main/checkUpdate/UpdateSessionInfo;",
            ")",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    sget-object v0, Lcom/motorola/otalib/main/Settings/LibConfigs;->UPDATE_SESSION_MAPPER:Lcom/motorola/otalib/main/Settings/LibConfigs;

    invoke-virtual {p0, v0}, Lcom/motorola/otalib/common/settings/Settings;->getString(Lcom/motorola/otalib/common/settings/ISetting;)Ljava/lang/String;

    move-result-object v0

    new-instance v1, Ljava/util/LinkedHashMap;

    invoke-direct {v1}, Ljava/util/LinkedHashMap;-><init>()V

    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v2

    if-nez v2, :cond_0

    :try_start_0
    new-instance v2, Lorg/json/JSONObject;

    invoke-direct {v2, v0}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    invoke-virtual {v2}, Lorg/json/JSONObject;->keys()Ljava/util/Iterator;

    move-result-object v0

    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_0

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/String;

    invoke-virtual {v2, v3}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    invoke-interface {v1, v3, v4}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception v0

    sget-object v2, Lcom/motorola/otalib/main/Logger;->OTALib_TAG:Ljava/lang/String;

    new-instance v3, Ljava/lang/StringBuilder;

    const-string v4, "setSessionDetails:Exception:msg="

    invoke-direct {v3, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v2, v0}, Lcom/motorola/otalib/main/Logger;->error(Ljava/lang/String;Ljava/lang/String;)V

    :cond_0
    invoke-virtual {p2}, Lcom/motorola/otalib/main/checkUpdate/UpdateSessionInfo;->toString()Ljava/lang/String;

    move-result-object p2

    invoke-interface {v1, p1, p2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    sget-object p1, Lcom/motorola/otalib/main/Settings/LibConfigs;->UPDATE_SESSION_MAPPER:Lcom/motorola/otalib/main/Settings/LibConfigs;

    new-instance p2, Lorg/json/JSONObject;

    invoke-direct {p2, v1}, Lorg/json/JSONObject;-><init>(Ljava/util/Map;)V

    invoke-virtual {p2}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    move-result-object p2

    invoke-virtual {p0, p1, p2}, Lcom/motorola/otalib/common/settings/Settings;->setString(Lcom/motorola/otalib/common/settings/ISetting;Ljava/lang/String;)V

    return-object v1
.end method


# virtual methods
.method public getCheckRequestObj()Lcom/motorola/otalib/main/checkUpdate/CheckRequestObj;
    .locals 0

    iget-object p0, p0, Lcom/motorola/otalib/main/checkUpdate/UpdateSessionInfo;->checkRequestObj:Lcom/motorola/otalib/main/checkUpdate/CheckRequestObj;

    return-object p0
.end method

.method public getContentTimeSTamp()J
    .locals 2

    iget-wide v0, p0, Lcom/motorola/otalib/main/checkUpdate/UpdateSessionInfo;->contentTimeSTamp:J

    return-wide v0
.end method

.method public getReportingTag()Ljava/lang/String;
    .locals 0

    iget-object p0, p0, Lcom/motorola/otalib/main/checkUpdate/UpdateSessionInfo;->reportingTag:Ljava/lang/String;

    return-object p0
.end method

.method public getServiceControlResponse()Ljava/lang/String;
    .locals 0

    iget-object p0, p0, Lcom/motorola/otalib/main/checkUpdate/UpdateSessionInfo;->serviceControlResponse:Ljava/lang/String;

    return-object p0
.end method

.method public getStatusCode()I
    .locals 0

    iget p0, p0, Lcom/motorola/otalib/main/checkUpdate/UpdateSessionInfo;->statusCode:I

    return p0
.end method

.method public getTrackingId()Ljava/lang/String;
    .locals 0

    iget-object p0, p0, Lcom/motorola/otalib/main/checkUpdate/UpdateSessionInfo;->trackingId:Ljava/lang/String;

    return-object p0
.end method

.method public isKeepPackage()Z
    .locals 0

    iget-boolean p0, p0, Lcom/motorola/otalib/main/checkUpdate/UpdateSessionInfo;->keepPackage:Z

    return p0
.end method

.method public setCheckRequestObj(Ljava/lang/String;Lcom/motorola/otalib/common/settings/Settings;)Lcom/motorola/otalib/main/checkUpdate/CheckRequestObj;
    .locals 1

    invoke-static {p1}, Lcom/motorola/otalib/main/checkUpdate/CheckRequestObj;->fromJsonString(Ljava/lang/String;)Lcom/motorola/otalib/main/checkUpdate/CheckRequestObj;

    move-result-object p1

    iput-object p1, p0, Lcom/motorola/otalib/main/checkUpdate/UpdateSessionInfo;->checkRequestObj:Lcom/motorola/otalib/main/checkUpdate/CheckRequestObj;

    invoke-virtual {p1}, Lcom/motorola/otalib/main/checkUpdate/CheckRequestObj;->getPrimaryKey()Ljava/lang/String;

    move-result-object v0

    invoke-static {p2, v0, p0}, Lcom/motorola/otalib/main/checkUpdate/UpdateSessionInfo;->setSessionDetails(Lcom/motorola/otalib/common/settings/Settings;Ljava/lang/String;Lcom/motorola/otalib/main/checkUpdate/UpdateSessionInfo;)Ljava/util/Map;

    return-object p1
.end method

.method public setContentTimeSTamp(J)V
    .locals 0

    iput-wide p1, p0, Lcom/motorola/otalib/main/checkUpdate/UpdateSessionInfo;->contentTimeSTamp:J

    return-void
.end method

.method public setKeepPackage(Z)V
    .locals 0

    iput-boolean p1, p0, Lcom/motorola/otalib/main/checkUpdate/UpdateSessionInfo;->keepPackage:Z

    return-void
.end method

.method public setReportingTag(Ljava/lang/String;)V
    .locals 0

    iput-object p1, p0, Lcom/motorola/otalib/main/checkUpdate/UpdateSessionInfo;->reportingTag:Ljava/lang/String;

    return-void
.end method

.method public setServiceControlResponse(Lcom/motorola/otalib/common/settings/Settings;Ljava/lang/String;Ljava/lang/String;)Lcom/motorola/otalib/main/checkUpdate/UpdateSessionInfo;
    .locals 0

    iput-object p3, p0, Lcom/motorola/otalib/main/checkUpdate/UpdateSessionInfo;->serviceControlResponse:Ljava/lang/String;

    invoke-static {p1, p2, p0}, Lcom/motorola/otalib/main/checkUpdate/UpdateSessionInfo;->setSessionDetails(Lcom/motorola/otalib/common/settings/Settings;Ljava/lang/String;Lcom/motorola/otalib/main/checkUpdate/UpdateSessionInfo;)Ljava/util/Map;

    return-object p0
.end method

.method public setStatusCode(I)V
    .locals 0

    iput p1, p0, Lcom/motorola/otalib/main/checkUpdate/UpdateSessionInfo;->statusCode:I

    return-void
.end method

.method public setTrackingId(Ljava/lang/String;)V
    .locals 0

    iput-object p1, p0, Lcom/motorola/otalib/main/checkUpdate/UpdateSessionInfo;->trackingId:Ljava/lang/String;

    return-void
.end method

.method public toString()Ljava/lang/String;
    .locals 1

    new-instance v0, Lcom/google/gson/Gson;

    invoke-direct {v0}, Lcom/google/gson/Gson;-><init>()V

    invoke-virtual {v0, p0}, Lcom/google/gson/Gson;->toJson(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method
