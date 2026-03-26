.class public Lcom/motorola/otalib/cdsservice/requestdataobjects/UrlRequest;
.super Ljava/lang/Object;
.source "UrlRequest.java"


# instance fields
.field private mBaseUrl:Ljava/lang/String;

.field private mContext:Ljava/lang/String;

.field private mContextKey:Ljava/lang/String;

.field private mIsSecure:Ljava/lang/String;

.field private mServerUrl:Ljava/lang/String;

.field private mState:Ljava/lang/String;

.field private mTestUrl:Ljava/lang/String;

.field private mTrackingId:Ljava/lang/String;


# direct methods
.method public constructor <init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/motorola/otalib/cdsservice/requestdataobjects/UrlRequest;->mServerUrl:Ljava/lang/String;

    iput-object p2, p0, Lcom/motorola/otalib/cdsservice/requestdataobjects/UrlRequest;->mBaseUrl:Ljava/lang/String;

    iput-object p3, p0, Lcom/motorola/otalib/cdsservice/requestdataobjects/UrlRequest;->mContext:Ljava/lang/String;

    iput-object p4, p0, Lcom/motorola/otalib/cdsservice/requestdataobjects/UrlRequest;->mContextKey:Ljava/lang/String;

    iput-object p5, p0, Lcom/motorola/otalib/cdsservice/requestdataobjects/UrlRequest;->mIsSecure:Ljava/lang/String;

    iput-object p6, p0, Lcom/motorola/otalib/cdsservice/requestdataobjects/UrlRequest;->mTestUrl:Ljava/lang/String;

    return-void
.end method

.method public constructor <init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/motorola/otalib/cdsservice/requestdataobjects/UrlRequest;->mServerUrl:Ljava/lang/String;

    iput-object p2, p0, Lcom/motorola/otalib/cdsservice/requestdataobjects/UrlRequest;->mBaseUrl:Ljava/lang/String;

    iput-object p3, p0, Lcom/motorola/otalib/cdsservice/requestdataobjects/UrlRequest;->mContext:Ljava/lang/String;

    iput-object p4, p0, Lcom/motorola/otalib/cdsservice/requestdataobjects/UrlRequest;->mContextKey:Ljava/lang/String;

    iput-object p5, p0, Lcom/motorola/otalib/cdsservice/requestdataobjects/UrlRequest;->mTrackingId:Ljava/lang/String;

    iput-object p6, p0, Lcom/motorola/otalib/cdsservice/requestdataobjects/UrlRequest;->mIsSecure:Ljava/lang/String;

    iput-object p7, p0, Lcom/motorola/otalib/cdsservice/requestdataobjects/UrlRequest;->mTestUrl:Ljava/lang/String;

    return-void
.end method

.method public constructor <init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/motorola/otalib/cdsservice/requestdataobjects/UrlRequest;->mServerUrl:Ljava/lang/String;

    iput-object p2, p0, Lcom/motorola/otalib/cdsservice/requestdataobjects/UrlRequest;->mBaseUrl:Ljava/lang/String;

    iput-object p3, p0, Lcom/motorola/otalib/cdsservice/requestdataobjects/UrlRequest;->mContext:Ljava/lang/String;

    iput-object p4, p0, Lcom/motorola/otalib/cdsservice/requestdataobjects/UrlRequest;->mContextKey:Ljava/lang/String;

    iput-object p5, p0, Lcom/motorola/otalib/cdsservice/requestdataobjects/UrlRequest;->mState:Ljava/lang/String;

    iput-object p6, p0, Lcom/motorola/otalib/cdsservice/requestdataobjects/UrlRequest;->mTrackingId:Ljava/lang/String;

    iput-object p7, p0, Lcom/motorola/otalib/cdsservice/requestdataobjects/UrlRequest;->mIsSecure:Ljava/lang/String;

    iput-object p8, p0, Lcom/motorola/otalib/cdsservice/requestdataobjects/UrlRequest;->mTestUrl:Ljava/lang/String;

    return-void
.end method

.method public static fromJsonString(Ljava/lang/String;)Lcom/motorola/otalib/cdsservice/requestdataobjects/UrlRequest;
    .locals 2

    new-instance v0, Lcom/google/gson/Gson;

    invoke-direct {v0}, Lcom/google/gson/Gson;-><init>()V

    const-class v1, Lcom/motorola/otalib/cdsservice/requestdataobjects/UrlRequest;

    invoke-virtual {v0, p0, v1}, Lcom/google/gson/Gson;->fromJson(Ljava/lang/String;Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lcom/motorola/otalib/cdsservice/requestdataobjects/UrlRequest;

    return-object p0
.end method


# virtual methods
.method public getBaseUrl()Ljava/lang/String;
    .locals 0

    iget-object p0, p0, Lcom/motorola/otalib/cdsservice/requestdataobjects/UrlRequest;->mBaseUrl:Ljava/lang/String;

    return-object p0
.end method

.method public getContext()Ljava/lang/String;
    .locals 0

    iget-object p0, p0, Lcom/motorola/otalib/cdsservice/requestdataobjects/UrlRequest;->mContext:Ljava/lang/String;

    return-object p0
.end method

.method public getContextKey()Ljava/lang/String;
    .locals 0

    iget-object p0, p0, Lcom/motorola/otalib/cdsservice/requestdataobjects/UrlRequest;->mContextKey:Ljava/lang/String;

    return-object p0
.end method

.method public getIsSecure()Ljava/lang/String;
    .locals 0

    iget-object p0, p0, Lcom/motorola/otalib/cdsservice/requestdataobjects/UrlRequest;->mIsSecure:Ljava/lang/String;

    return-object p0
.end method

.method public getServerUrl()Ljava/lang/String;
    .locals 0

    iget-object p0, p0, Lcom/motorola/otalib/cdsservice/requestdataobjects/UrlRequest;->mServerUrl:Ljava/lang/String;

    return-object p0
.end method

.method public getState()Ljava/lang/String;
    .locals 0

    iget-object p0, p0, Lcom/motorola/otalib/cdsservice/requestdataobjects/UrlRequest;->mState:Ljava/lang/String;

    return-object p0
.end method

.method public getTestUrl()Ljava/lang/String;
    .locals 0

    iget-object p0, p0, Lcom/motorola/otalib/cdsservice/requestdataobjects/UrlRequest;->mTestUrl:Ljava/lang/String;

    return-object p0
.end method

.method public getTrackingId()Ljava/lang/String;
    .locals 0

    iget-object p0, p0, Lcom/motorola/otalib/cdsservice/requestdataobjects/UrlRequest;->mTrackingId:Ljava/lang/String;

    return-object p0
.end method

.method public toString()Ljava/lang/String;
    .locals 1

    new-instance v0, Lcom/google/gson/Gson;

    invoke-direct {v0}, Lcom/google/gson/Gson;-><init>()V

    invoke-virtual {v0, p0}, Lcom/google/gson/Gson;->toJson(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method
