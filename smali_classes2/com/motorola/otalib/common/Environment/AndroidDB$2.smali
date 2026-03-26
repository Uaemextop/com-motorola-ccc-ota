.class Lcom/motorola/otalib/common/Environment/AndroidDB$2;
.super Ljava/lang/Object;
.source "AndroidDB.java"

# interfaces
.implements Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database$Status;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/motorola/otalib/common/Environment/AndroidDB;->get_statusInternal(Ljava/lang/String;)Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database$Status;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/motorola/otalib/common/Environment/AndroidDB;

.field final synthetic val$deviceVersion:Ljava/lang/String;

.field final synthetic val$id:I

.field final synthetic val$info:Ljava/lang/String;

.field final synthetic val$repo:Ljava/lang/String;

.field final synthetic val$reportingTag:Ljava/lang/String;

.field final synthetic val$srcSha1:Ljava/lang/String;

.field final synthetic val$state:Ljava/lang/String;

.field final synthetic val$status:Ljava/lang/String;

.field final synthetic val$targetSha1:Ljava/lang/String;

.field final synthetic val$time:J

.field final synthetic val$trackingId:Ljava/lang/String;


# direct methods
.method constructor <init>(Lcom/motorola/otalib/common/Environment/AndroidDB;IJLjava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    iput-object p1, p0, Lcom/motorola/otalib/common/Environment/AndroidDB$2;->this$0:Lcom/motorola/otalib/common/Environment/AndroidDB;

    iput p2, p0, Lcom/motorola/otalib/common/Environment/AndroidDB$2;->val$id:I

    iput-wide p3, p0, Lcom/motorola/otalib/common/Environment/AndroidDB$2;->val$time:J

    iput-object p5, p0, Lcom/motorola/otalib/common/Environment/AndroidDB$2;->val$state:Ljava/lang/String;

    iput-object p6, p0, Lcom/motorola/otalib/common/Environment/AndroidDB$2;->val$status:Ljava/lang/String;

    iput-object p7, p0, Lcom/motorola/otalib/common/Environment/AndroidDB$2;->val$info:Ljava/lang/String;

    iput-object p8, p0, Lcom/motorola/otalib/common/Environment/AndroidDB$2;->val$repo:Ljava/lang/String;

    iput-object p9, p0, Lcom/motorola/otalib/common/Environment/AndroidDB$2;->val$reportingTag:Ljava/lang/String;

    iput-object p10, p0, Lcom/motorola/otalib/common/Environment/AndroidDB$2;->val$trackingId:Ljava/lang/String;

    iput-object p11, p0, Lcom/motorola/otalib/common/Environment/AndroidDB$2;->val$srcSha1:Ljava/lang/String;

    iput-object p12, p0, Lcom/motorola/otalib/common/Environment/AndroidDB$2;->val$deviceVersion:Ljava/lang/String;

    iput-object p13, p0, Lcom/motorola/otalib/common/Environment/AndroidDB$2;->val$targetSha1:Ljava/lang/String;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public getDeviceVersion()Ljava/lang/String;
    .locals 0

    iget-object p0, p0, Lcom/motorola/otalib/common/Environment/AndroidDB$2;->val$deviceVersion:Ljava/lang/String;

    return-object p0
.end method

.method public getId()I
    .locals 0

    iget p0, p0, Lcom/motorola/otalib/common/Environment/AndroidDB$2;->val$id:I

    return p0
.end method

.method public getInfo()Ljava/lang/String;
    .locals 0

    iget-object p0, p0, Lcom/motorola/otalib/common/Environment/AndroidDB$2;->val$info:Ljava/lang/String;

    return-object p0
.end method

.method public getReportingTag()Ljava/lang/String;
    .locals 0

    iget-object p0, p0, Lcom/motorola/otalib/common/Environment/AndroidDB$2;->val$reportingTag:Ljava/lang/String;

    return-object p0
.end method

.method public getRepository()Ljava/lang/String;
    .locals 0

    iget-object p0, p0, Lcom/motorola/otalib/common/Environment/AndroidDB$2;->val$repo:Ljava/lang/String;

    return-object p0
.end method

.method public getSourceSha1()Ljava/lang/String;
    .locals 0

    iget-object p0, p0, Lcom/motorola/otalib/common/Environment/AndroidDB$2;->val$srcSha1:Ljava/lang/String;

    return-object p0
.end method

.method public getState()Ljava/lang/String;
    .locals 0

    iget-object p0, p0, Lcom/motorola/otalib/common/Environment/AndroidDB$2;->val$state:Ljava/lang/String;

    return-object p0
.end method

.method public getStatus()Ljava/lang/String;
    .locals 0

    iget-object p0, p0, Lcom/motorola/otalib/common/Environment/AndroidDB$2;->val$status:Ljava/lang/String;

    return-object p0
.end method

.method public getTargetSha1()Ljava/lang/String;
    .locals 0

    iget-object p0, p0, Lcom/motorola/otalib/common/Environment/AndroidDB$2;->val$targetSha1:Ljava/lang/String;

    return-object p0
.end method

.method public getTime()J
    .locals 2

    iget-wide v0, p0, Lcom/motorola/otalib/common/Environment/AndroidDB$2;->val$time:J

    return-wide v0
.end method

.method public getTrackingID()Ljava/lang/String;
    .locals 0

    iget-object p0, p0, Lcom/motorola/otalib/common/Environment/AndroidDB$2;->val$trackingId:Ljava/lang/String;

    return-object p0
.end method
