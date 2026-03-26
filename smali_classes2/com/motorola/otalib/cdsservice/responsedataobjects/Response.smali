.class public Lcom/motorola/otalib/cdsservice/responsedataobjects/Response;
.super Ljava/lang/Object;
.source "Response.java"


# instance fields
.field private mContent:Lorg/json/JSONObject;

.field private mContentTimestamp:J

.field private mContext:Ljava/lang/String;

.field private mContextKey:Ljava/lang/String;

.field private mIsUploadFailureLogsEnabled:Z

.field private mPollAfterSeconds:J

.field private mProceed:Z

.field private mReportingTags:Ljava/lang/String;

.field private mSmartUpdateBitmap:I

.field private mTrackingId:Ljava/lang/String;


# direct methods
.method public constructor <init>(ZLjava/lang/String;Ljava/lang/String;JLjava/lang/String;Ljava/lang/String;JILorg/json/JSONObject;Z)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-boolean p1, p0, Lcom/motorola/otalib/cdsservice/responsedataobjects/Response;->mProceed:Z

    iput-object p2, p0, Lcom/motorola/otalib/cdsservice/responsedataobjects/Response;->mContext:Ljava/lang/String;

    iput-object p3, p0, Lcom/motorola/otalib/cdsservice/responsedataobjects/Response;->mContextKey:Ljava/lang/String;

    iput-wide p4, p0, Lcom/motorola/otalib/cdsservice/responsedataobjects/Response;->mContentTimestamp:J

    iput-object p6, p0, Lcom/motorola/otalib/cdsservice/responsedataobjects/Response;->mReportingTags:Ljava/lang/String;

    iput-object p7, p0, Lcom/motorola/otalib/cdsservice/responsedataobjects/Response;->mTrackingId:Ljava/lang/String;

    iput-wide p8, p0, Lcom/motorola/otalib/cdsservice/responsedataobjects/Response;->mPollAfterSeconds:J

    iput p10, p0, Lcom/motorola/otalib/cdsservice/responsedataobjects/Response;->mSmartUpdateBitmap:I

    iput-object p11, p0, Lcom/motorola/otalib/cdsservice/responsedataobjects/Response;->mContent:Lorg/json/JSONObject;

    iput-boolean p12, p0, Lcom/motorola/otalib/cdsservice/responsedataobjects/Response;->mIsUploadFailureLogsEnabled:Z

    return-void
.end method


# virtual methods
.method public getContent()Lorg/json/JSONObject;
    .locals 0

    iget-object p0, p0, Lcom/motorola/otalib/cdsservice/responsedataobjects/Response;->mContent:Lorg/json/JSONObject;

    return-object p0
.end method

.method public getContext()Ljava/lang/String;
    .locals 0

    iget-object p0, p0, Lcom/motorola/otalib/cdsservice/responsedataobjects/Response;->mContext:Ljava/lang/String;

    return-object p0
.end method

.method public getContextKey()Ljava/lang/String;
    .locals 0

    iget-object p0, p0, Lcom/motorola/otalib/cdsservice/responsedataobjects/Response;->mContextKey:Ljava/lang/String;

    return-object p0
.end method

.method public getContextTimeStamp()J
    .locals 2

    iget-wide v0, p0, Lcom/motorola/otalib/cdsservice/responsedataobjects/Response;->mContentTimestamp:J

    return-wide v0
.end method

.method public getPollAfterSeconds()J
    .locals 2

    iget-wide v0, p0, Lcom/motorola/otalib/cdsservice/responsedataobjects/Response;->mPollAfterSeconds:J

    return-wide v0
.end method

.method public getReportingTags()Ljava/lang/String;
    .locals 0

    iget-object p0, p0, Lcom/motorola/otalib/cdsservice/responsedataobjects/Response;->mReportingTags:Ljava/lang/String;

    return-object p0
.end method

.method public getSmartUpdateBitmap()I
    .locals 0

    iget p0, p0, Lcom/motorola/otalib/cdsservice/responsedataobjects/Response;->mSmartUpdateBitmap:I

    return p0
.end method

.method public getTrackingId()Ljava/lang/String;
    .locals 0

    iget-object p0, p0, Lcom/motorola/otalib/cdsservice/responsedataobjects/Response;->mTrackingId:Ljava/lang/String;

    return-object p0
.end method

.method public isUploadFailureLogsEnabled()Z
    .locals 0

    iget-boolean p0, p0, Lcom/motorola/otalib/cdsservice/responsedataobjects/Response;->mIsUploadFailureLogsEnabled:Z

    return p0
.end method

.method public proceed()Z
    .locals 0

    iget-boolean p0, p0, Lcom/motorola/otalib/cdsservice/responsedataobjects/Response;->mProceed:Z

    return p0
.end method
