.class public Lcom/motorola/otalib/main/checkUpdate/CheckRequestObj;
.super Ljava/lang/Object;
.source "CheckRequestObj.java"


# instance fields
.field private accsSerialNumber:Ljava/lang/String;

.field private carrier:Ljava/lang/String;

.field private colorId:Ljava/lang/String;

.field private contextKey:Ljava/lang/String;

.field private forceDownload:Z

.field private forceInstall:Z

.field private internalName:Ljava/lang/String;

.field private isPRCDevice:Z

.field private isProductionDevice:Z

.field private manufacturer:Ljava/lang/String;

.field private modelId:Ljava/lang/String;

.field private primaryKey:Ljava/lang/String;

.field private product:Ljava/lang/String;

.field private sourceVersion:J

.field private triggeredBy:Lcom/motorola/otalib/main/PublicUtilityMethods$TRIGGER_BY;


# direct methods
.method public constructor <init>()V
    .locals 2

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/motorola/otalib/main/checkUpdate/CheckRequestObj;->isPRCDevice:Z

    const/4 v1, 0x1

    iput-boolean v1, p0, Lcom/motorola/otalib/main/checkUpdate/CheckRequestObj;->isProductionDevice:Z

    iput-boolean v0, p0, Lcom/motorola/otalib/main/checkUpdate/CheckRequestObj;->forceDownload:Z

    iput-boolean v0, p0, Lcom/motorola/otalib/main/checkUpdate/CheckRequestObj;->forceInstall:Z

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
            "Lcom/motorola/otalib/main/checkUpdate/CheckRequestObj;",
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

    const-class v4, Lcom/motorola/otalib/main/checkUpdate/CheckRequestObj;

    invoke-virtual {v0, v3, v4}, Lcom/google/gson/Gson;->fromJson(Lcom/google/gson/JsonElement;Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/motorola/otalib/main/checkUpdate/CheckRequestObj;

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
            "Lcom/motorola/otalib/main/checkUpdate/CheckRequestObj;",
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

    check-cast v2, Lcom/motorola/otalib/main/checkUpdate/CheckRequestObj;

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

.method public static fromJsonString(Ljava/lang/String;)Lcom/motorola/otalib/main/checkUpdate/CheckRequestObj;
    .locals 2

    new-instance v0, Lcom/google/gson/Gson;

    invoke-direct {v0}, Lcom/google/gson/Gson;-><init>()V

    const-class v1, Lcom/motorola/otalib/main/checkUpdate/CheckRequestObj;

    invoke-virtual {v0, p0, v1}, Lcom/google/gson/Gson;->fromJson(Ljava/lang/String;Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lcom/motorola/otalib/main/checkUpdate/CheckRequestObj;

    return-object p0
.end method


# virtual methods
.method public getAccsSerialNumber()Ljava/lang/String;
    .locals 0

    iget-object p0, p0, Lcom/motorola/otalib/main/checkUpdate/CheckRequestObj;->accsSerialNumber:Ljava/lang/String;

    return-object p0
.end method

.method public getCarrier()Ljava/lang/String;
    .locals 0

    iget-object p0, p0, Lcom/motorola/otalib/main/checkUpdate/CheckRequestObj;->carrier:Ljava/lang/String;

    return-object p0
.end method

.method public getColorId()Ljava/lang/String;
    .locals 0

    iget-object p0, p0, Lcom/motorola/otalib/main/checkUpdate/CheckRequestObj;->colorId:Ljava/lang/String;

    return-object p0
.end method

.method public getContextKey()Ljava/lang/String;
    .locals 0

    iget-object p0, p0, Lcom/motorola/otalib/main/checkUpdate/CheckRequestObj;->contextKey:Ljava/lang/String;

    return-object p0
.end method

.method public getInternalName()Ljava/lang/String;
    .locals 0

    iget-object p0, p0, Lcom/motorola/otalib/main/checkUpdate/CheckRequestObj;->internalName:Ljava/lang/String;

    return-object p0
.end method

.method public getIsPRCDevice()Z
    .locals 0

    iget-boolean p0, p0, Lcom/motorola/otalib/main/checkUpdate/CheckRequestObj;->isPRCDevice:Z

    return p0
.end method

.method public getIsProductionDevice()Z
    .locals 0

    iget-boolean p0, p0, Lcom/motorola/otalib/main/checkUpdate/CheckRequestObj;->isProductionDevice:Z

    return p0
.end method

.method public getManufacturer()Ljava/lang/String;
    .locals 0

    iget-object p0, p0, Lcom/motorola/otalib/main/checkUpdate/CheckRequestObj;->manufacturer:Ljava/lang/String;

    return-object p0
.end method

.method public getModelId()Ljava/lang/String;
    .locals 0

    iget-object p0, p0, Lcom/motorola/otalib/main/checkUpdate/CheckRequestObj;->modelId:Ljava/lang/String;

    return-object p0
.end method

.method public getPrimaryKey()Ljava/lang/String;
    .locals 2

    invoke-virtual {p0}, Lcom/motorola/otalib/main/checkUpdate/CheckRequestObj;->getContextKey()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_0

    invoke-virtual {p0}, Lcom/motorola/otalib/main/checkUpdate/CheckRequestObj;->getAccsSerialNumber()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_0

    invoke-virtual {p0}, Lcom/motorola/otalib/main/checkUpdate/CheckRequestObj;->getContextKey()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0}, Lcom/motorola/otalib/main/checkUpdate/CheckRequestObj;->getAccsSerialNumber()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/motorola/otalib/main/PublicUtilityMethods;->SHA1Generator(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/motorola/otalib/main/checkUpdate/CheckRequestObj;->primaryKey:Ljava/lang/String;

    :cond_0
    iget-object p0, p0, Lcom/motorola/otalib/main/checkUpdate/CheckRequestObj;->primaryKey:Ljava/lang/String;

    return-object p0
.end method

.method public getProduct()Ljava/lang/String;
    .locals 0

    iget-object p0, p0, Lcom/motorola/otalib/main/checkUpdate/CheckRequestObj;->product:Ljava/lang/String;

    return-object p0
.end method

.method public getSourceVersion()J
    .locals 2

    iget-wide v0, p0, Lcom/motorola/otalib/main/checkUpdate/CheckRequestObj;->sourceVersion:J

    return-wide v0
.end method

.method public getTriggeredBy()Lcom/motorola/otalib/main/PublicUtilityMethods$TRIGGER_BY;
    .locals 0

    iget-object p0, p0, Lcom/motorola/otalib/main/checkUpdate/CheckRequestObj;->triggeredBy:Lcom/motorola/otalib/main/PublicUtilityMethods$TRIGGER_BY;

    return-object p0
.end method

.method public isForceDownload()Z
    .locals 0

    iget-boolean p0, p0, Lcom/motorola/otalib/main/checkUpdate/CheckRequestObj;->forceDownload:Z

    return p0
.end method

.method public isForceInstall()Z
    .locals 0

    iget-boolean p0, p0, Lcom/motorola/otalib/main/checkUpdate/CheckRequestObj;->forceInstall:Z

    return p0
.end method

.method public isValidRequest()Z
    .locals 4

    iget-object v0, p0, Lcom/motorola/otalib/main/checkUpdate/CheckRequestObj;->accsSerialNumber:Ljava/lang/String;

    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_1

    iget-object v0, p0, Lcom/motorola/otalib/main/checkUpdate/CheckRequestObj;->contextKey:Ljava/lang/String;

    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_1

    iget-wide v0, p0, Lcom/motorola/otalib/main/checkUpdate/CheckRequestObj;->sourceVersion:J

    const-wide/16 v2, 0x0

    cmp-long v0, v0, v2

    if-lez v0, :cond_1

    iget-object p0, p0, Lcom/motorola/otalib/main/checkUpdate/CheckRequestObj;->modelId:Ljava/lang/String;

    invoke-static {p0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result p0

    if-eqz p0, :cond_0

    goto :goto_0

    :cond_0
    const/4 p0, 0x1

    return p0

    :cond_1
    :goto_0
    const/4 p0, 0x0

    return p0
.end method

.method public setAccsSerialNumber(Ljava/lang/String;)V
    .locals 0

    iput-object p1, p0, Lcom/motorola/otalib/main/checkUpdate/CheckRequestObj;->accsSerialNumber:Ljava/lang/String;

    return-void
.end method

.method public setCarrier(Ljava/lang/String;)V
    .locals 0

    iput-object p1, p0, Lcom/motorola/otalib/main/checkUpdate/CheckRequestObj;->carrier:Ljava/lang/String;

    return-void
.end method

.method public setColorId(Ljava/lang/String;)V
    .locals 0

    iput-object p1, p0, Lcom/motorola/otalib/main/checkUpdate/CheckRequestObj;->colorId:Ljava/lang/String;

    return-void
.end method

.method public setContextKey(Ljava/lang/String;)V
    .locals 0

    iput-object p1, p0, Lcom/motorola/otalib/main/checkUpdate/CheckRequestObj;->contextKey:Ljava/lang/String;

    return-void
.end method

.method public setForceDownload(Z)V
    .locals 0

    iput-boolean p1, p0, Lcom/motorola/otalib/main/checkUpdate/CheckRequestObj;->forceDownload:Z

    return-void
.end method

.method public setForceInstall(Z)V
    .locals 0

    iput-boolean p1, p0, Lcom/motorola/otalib/main/checkUpdate/CheckRequestObj;->forceInstall:Z

    return-void
.end method

.method public setInternalName(Ljava/lang/String;)V
    .locals 0

    iput-object p1, p0, Lcom/motorola/otalib/main/checkUpdate/CheckRequestObj;->internalName:Ljava/lang/String;

    return-void
.end method

.method public setManufacturer(Ljava/lang/String;)V
    .locals 0

    iput-object p1, p0, Lcom/motorola/otalib/main/checkUpdate/CheckRequestObj;->manufacturer:Ljava/lang/String;

    return-void
.end method

.method public setModelId(Ljava/lang/String;)V
    .locals 0

    iput-object p1, p0, Lcom/motorola/otalib/main/checkUpdate/CheckRequestObj;->modelId:Ljava/lang/String;

    return-void
.end method

.method public setPRCDevice(Z)V
    .locals 0

    iput-boolean p1, p0, Lcom/motorola/otalib/main/checkUpdate/CheckRequestObj;->isPRCDevice:Z

    return-void
.end method

.method public setProduct(Ljava/lang/String;)V
    .locals 0

    iput-object p1, p0, Lcom/motorola/otalib/main/checkUpdate/CheckRequestObj;->product:Ljava/lang/String;

    return-void
.end method

.method public setProductionDevice(Z)V
    .locals 0

    iput-boolean p1, p0, Lcom/motorola/otalib/main/checkUpdate/CheckRequestObj;->isProductionDevice:Z

    return-void
.end method

.method public setSourceVersion(J)Lcom/motorola/otalib/main/checkUpdate/CheckRequestObj;
    .locals 0

    iput-wide p1, p0, Lcom/motorola/otalib/main/checkUpdate/CheckRequestObj;->sourceVersion:J

    return-object p0
.end method

.method public setTriggeredBy(Lcom/motorola/otalib/main/PublicUtilityMethods$TRIGGER_BY;)V
    .locals 0

    if-nez p1, :cond_0

    sget-object p1, Lcom/motorola/otalib/main/PublicUtilityMethods$TRIGGER_BY;->polling:Lcom/motorola/otalib/main/PublicUtilityMethods$TRIGGER_BY;

    :cond_0
    iput-object p1, p0, Lcom/motorola/otalib/main/checkUpdate/CheckRequestObj;->triggeredBy:Lcom/motorola/otalib/main/PublicUtilityMethods$TRIGGER_BY;

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
