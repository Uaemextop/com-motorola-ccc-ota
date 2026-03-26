.class public Lcom/motorola/otalib/common/metaData/MetaData;
.super Ljava/lang/Object;
.source "MetaData.java"

# interfaces
.implements Ljava/io/Serializable;


# instance fields
.field private abInstallType:Ljava/lang/String;

.field private annoy:Ljava/lang/String;

.field private continueOnServiceError:Z

.field private displayVersion:Ljava/lang/String;

.field private downloadOptionsNotes:Ljava/lang/String;

.field private downloadTimes:Lcom/motorola/otalib/common/metaData/DownloadTimes;

.field private downloadUrl:Ljava/net/URI;

.field private extraSpace:J

.field private fingerprint:Ljava/lang/String;

.field private forced:Z

.field private installReminder:Ljava/lang/String;

.field private installTime:I

.field private mActualTargetVersion:Ljava/lang/String;

.field private mBitmap:I

.field private mBypassPreDownloadDialog:Z

.field private mChunkSize:J

.field private mCriticalDeferCount:I

.field private mCriticalUpdateExtraWaitCount:I

.field private mCriticalUpdateExtraWaitPeriod:J

.field private mCriticalUpdateReminder:I

.field private mDownloadEndTime:I

.field private mDownloadStartTime:I

.field private mEnterpriseOta:Z

.field private mExtraCacheSpace:J

.field private mForceDownloadTime:D

.field private mForceInstallTime:D

.field private final mForceOnCellular:Z

.field private mForceUpgradeTime:I

.field private mIncrementalVersion:I

.field private mMaxUpdateFailCount:I

.field private mMinBatteryLevelRequiredForInstall:I

.field private mOemConfigUpdate:Z

.field private mOptionalDeferCount:I

.field private mOptionalUpdateCancelReminderDays:I

.field private mPolicyBundle:Z

.field private mRebootRequired:Z

.field private mReserveSpaceInMb:J

.field private mSeverity:I

.field private mShowDownloadProgress:Z

.field private mShowPostInstallScreen:Z

.field private mShowPreInstallScreen:Z

.field private mUiWorkflowControl:Lorg/json/JSONObject;

.field private mUpdateType:Ljava/lang/String;

.field private md5Checksum:Ljava/lang/String;

.field private metaVersion:Ljava/lang/String;

.field private minVersion:Ljava/lang/String;

.field private offPeakDownload:Lcom/motorola/otalib/common/metaData/OffPeakDownload;

.field private osReleaseLink:Ljava/lang/String;

.field private final packageType:Ljava/lang/String;

.field private postInstallFailureMessage:Ljava/lang/String;

.field private postInstallNotes:Ljava/lang/String;

.field private preDownloadInstructions:Ljava/lang/String;

.field private preDownloadNotificationExpiryMins:I

.field private preInstallInstructions:Ljava/lang/String;

.field private preInstallNotes:Ljava/lang/String;

.field private preInstallNotificationExpiryMins:I

.field private releaseNotes:Ljava/lang/String;

.field private reportingTags:Ljava/lang/String;

.field private serviceControlEnabled:Z

.field private serviceTimeoutSeconds:I

.field private showDownloadOptions:Z

.field private showPreDownloadDialog:Z

.field private size:J

.field private sourceBuildTimestamp:J

.field private sourceSha1:Ljava/lang/String;

.field private streamingData:Lorg/json/JSONObject;

.field private targetOSVersion:Ljava/lang/String;

.field private targetSha1:Ljava/lang/String;

.field private trackingId:Ljava/lang/String;

.field private updateReqTriggeredBy:Ljava/lang/String;

.field private upgradeNotification:Ljava/lang/String;

.field private userDataRequiredForUpdate:J

.field private version:Ljava/lang/String;

.field private wifiOnly:Z


# direct methods
.method public constructor <init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;ZLjava/lang/String;Ljava/lang/String;JLjava/lang/String;JLjava/lang/String;Ljava/lang/String;ZLjava/lang/String;IZIZLjava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lcom/motorola/otalib/common/metaData/DownloadTimes;Lcom/motorola/otalib/common/metaData/OffPeakDownload;ZZIILorg/json/JSONObject;IIIIZZZZZIDDIZIIZJIJZLjava/lang/String;ZLjava/lang/String;JLjava/lang/String;IILjava/lang/String;Lorg/json/JSONObject;Ljava/lang/String;Ljava/lang/String;JLjava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;JIIJ)V
    .locals 3

    move-object v0, p0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    move-object v1, p1

    iput-object v1, v0, Lcom/motorola/otalib/common/metaData/MetaData;->metaVersion:Ljava/lang/String;

    move-object v1, p2

    iput-object v1, v0, Lcom/motorola/otalib/common/metaData/MetaData;->version:Ljava/lang/String;

    move-object v1, p3

    iput-object v1, v0, Lcom/motorola/otalib/common/metaData/MetaData;->minVersion:Ljava/lang/String;

    move v1, p4

    iput-boolean v1, v0, Lcom/motorola/otalib/common/metaData/MetaData;->forced:Z

    move-object v1, p6

    iput-object v1, v0, Lcom/motorola/otalib/common/metaData/MetaData;->releaseNotes:Ljava/lang/String;

    move-object v1, p5

    iput-object v1, v0, Lcom/motorola/otalib/common/metaData/MetaData;->downloadOptionsNotes:Ljava/lang/String;

    move-wide v1, p7

    iput-wide v1, v0, Lcom/motorola/otalib/common/metaData/MetaData;->size:J

    move-object v1, p9

    iput-object v1, v0, Lcom/motorola/otalib/common/metaData/MetaData;->md5Checksum:Ljava/lang/String;

    move-wide v1, p10

    iput-wide v1, v0, Lcom/motorola/otalib/common/metaData/MetaData;->extraSpace:J

    move-object v1, p12

    iput-object v1, v0, Lcom/motorola/otalib/common/metaData/MetaData;->annoy:Ljava/lang/String;

    move-object/from16 v1, p13

    iput-object v1, v0, Lcom/motorola/otalib/common/metaData/MetaData;->installReminder:Ljava/lang/String;

    move/from16 v1, p14

    iput-boolean v1, v0, Lcom/motorola/otalib/common/metaData/MetaData;->wifiOnly:Z

    move-object/from16 v1, p15

    iput-object v1, v0, Lcom/motorola/otalib/common/metaData/MetaData;->fingerprint:Ljava/lang/String;

    move/from16 v1, p16

    iput v1, v0, Lcom/motorola/otalib/common/metaData/MetaData;->installTime:I

    move/from16 v1, p17

    iput-boolean v1, v0, Lcom/motorola/otalib/common/metaData/MetaData;->serviceControlEnabled:Z

    move/from16 v1, p18

    iput v1, v0, Lcom/motorola/otalib/common/metaData/MetaData;->serviceTimeoutSeconds:I

    move/from16 v1, p19

    iput-boolean v1, v0, Lcom/motorola/otalib/common/metaData/MetaData;->continueOnServiceError:Z

    move-object/from16 v1, p20

    iput-object v1, v0, Lcom/motorola/otalib/common/metaData/MetaData;->upgradeNotification:Ljava/lang/String;

    move-object/from16 v1, p21

    iput-object v1, v0, Lcom/motorola/otalib/common/metaData/MetaData;->preInstallNotes:Ljava/lang/String;

    move-object/from16 v1, p22

    iput-object v1, v0, Lcom/motorola/otalib/common/metaData/MetaData;->postInstallNotes:Ljava/lang/String;

    move-object/from16 v1, p23

    iput-object v1, v0, Lcom/motorola/otalib/common/metaData/MetaData;->postInstallFailureMessage:Ljava/lang/String;

    move-object/from16 v1, p24

    iput-object v1, v0, Lcom/motorola/otalib/common/metaData/MetaData;->reportingTags:Ljava/lang/String;

    move-object/from16 v1, p25

    iput-object v1, v0, Lcom/motorola/otalib/common/metaData/MetaData;->trackingId:Ljava/lang/String;

    move-object/from16 v1, p26

    iput-object v1, v0, Lcom/motorola/otalib/common/metaData/MetaData;->updateReqTriggeredBy:Ljava/lang/String;

    move/from16 v1, p29

    iput-boolean v1, v0, Lcom/motorola/otalib/common/metaData/MetaData;->showPreDownloadDialog:Z

    move/from16 v1, p30

    iput-boolean v1, v0, Lcom/motorola/otalib/common/metaData/MetaData;->showDownloadOptions:Z

    move/from16 v1, p31

    iput v1, v0, Lcom/motorola/otalib/common/metaData/MetaData;->preDownloadNotificationExpiryMins:I

    move/from16 v1, p32

    iput v1, v0, Lcom/motorola/otalib/common/metaData/MetaData;->preInstallNotificationExpiryMins:I

    move-object/from16 v1, p33

    iput-object v1, v0, Lcom/motorola/otalib/common/metaData/MetaData;->mUiWorkflowControl:Lorg/json/JSONObject;

    move/from16 v1, p34

    iput v1, v0, Lcom/motorola/otalib/common/metaData/MetaData;->mOptionalDeferCount:I

    move/from16 v1, p35

    iput v1, v0, Lcom/motorola/otalib/common/metaData/MetaData;->mCriticalDeferCount:I

    move/from16 v1, p36

    iput v1, v0, Lcom/motorola/otalib/common/metaData/MetaData;->mMaxUpdateFailCount:I

    move/from16 v1, p37

    iput v1, v0, Lcom/motorola/otalib/common/metaData/MetaData;->mMinBatteryLevelRequiredForInstall:I

    move/from16 v1, p38

    iput-boolean v1, v0, Lcom/motorola/otalib/common/metaData/MetaData;->mBypassPreDownloadDialog:Z

    move/from16 v1, p39

    iput-boolean v1, v0, Lcom/motorola/otalib/common/metaData/MetaData;->mShowDownloadProgress:Z

    move/from16 v1, p40

    iput-boolean v1, v0, Lcom/motorola/otalib/common/metaData/MetaData;->mShowPreInstallScreen:Z

    move/from16 v1, p41

    iput-boolean v1, v0, Lcom/motorola/otalib/common/metaData/MetaData;->mShowPostInstallScreen:Z

    move/from16 v1, p42

    iput-boolean v1, v0, Lcom/motorola/otalib/common/metaData/MetaData;->mRebootRequired:Z

    move/from16 v1, p43

    iput v1, v0, Lcom/motorola/otalib/common/metaData/MetaData;->mIncrementalVersion:I

    move-wide/from16 v1, p44

    iput-wide v1, v0, Lcom/motorola/otalib/common/metaData/MetaData;->mForceDownloadTime:D

    move-wide/from16 v1, p46

    iput-wide v1, v0, Lcom/motorola/otalib/common/metaData/MetaData;->mForceInstallTime:D

    move/from16 v1, p48

    iput v1, v0, Lcom/motorola/otalib/common/metaData/MetaData;->mForceUpgradeTime:I

    move/from16 v1, p49

    iput-boolean v1, v0, Lcom/motorola/otalib/common/metaData/MetaData;->mForceOnCellular:Z

    move/from16 v1, p50

    iput v1, v0, Lcom/motorola/otalib/common/metaData/MetaData;->mDownloadStartTime:I

    move/from16 v1, p51

    iput v1, v0, Lcom/motorola/otalib/common/metaData/MetaData;->mDownloadEndTime:I

    move/from16 v1, p52

    iput-boolean v1, v0, Lcom/motorola/otalib/common/metaData/MetaData;->mPolicyBundle:Z

    move-wide/from16 v1, p53

    iput-wide v1, v0, Lcom/motorola/otalib/common/metaData/MetaData;->mExtraCacheSpace:J

    move/from16 v1, p55

    iput v1, v0, Lcom/motorola/otalib/common/metaData/MetaData;->mOptionalUpdateCancelReminderDays:I

    move-wide/from16 v1, p56

    iput-wide v1, v0, Lcom/motorola/otalib/common/metaData/MetaData;->mReserveSpaceInMb:J

    move/from16 v1, p58

    iput-boolean v1, v0, Lcom/motorola/otalib/common/metaData/MetaData;->mEnterpriseOta:Z

    move-object/from16 v1, p59

    iput-object v1, v0, Lcom/motorola/otalib/common/metaData/MetaData;->displayVersion:Ljava/lang/String;

    move/from16 v1, p60

    iput-boolean v1, v0, Lcom/motorola/otalib/common/metaData/MetaData;->mOemConfigUpdate:Z

    move-object/from16 v1, p61

    iput-object v1, v0, Lcom/motorola/otalib/common/metaData/MetaData;->mUpdateType:Ljava/lang/String;

    move-wide/from16 v1, p62

    iput-wide v1, v0, Lcom/motorola/otalib/common/metaData/MetaData;->mChunkSize:J

    move-object/from16 v1, p64

    iput-object v1, v0, Lcom/motorola/otalib/common/metaData/MetaData;->mActualTargetVersion:Ljava/lang/String;

    move/from16 v1, p65

    iput v1, v0, Lcom/motorola/otalib/common/metaData/MetaData;->mSeverity:I

    move/from16 v1, p66

    iput v1, v0, Lcom/motorola/otalib/common/metaData/MetaData;->mCriticalUpdateReminder:I

    move-object/from16 v1, p67

    iput-object v1, v0, Lcom/motorola/otalib/common/metaData/MetaData;->abInstallType:Ljava/lang/String;

    move-object/from16 v1, p68

    iput-object v1, v0, Lcom/motorola/otalib/common/metaData/MetaData;->streamingData:Lorg/json/JSONObject;

    move-object/from16 v1, p69

    iput-object v1, v0, Lcom/motorola/otalib/common/metaData/MetaData;->osReleaseLink:Ljava/lang/String;

    move-object/from16 v1, p70

    iput-object v1, v0, Lcom/motorola/otalib/common/metaData/MetaData;->targetOSVersion:Ljava/lang/String;

    move-object/from16 v1, p73

    iput-object v1, v0, Lcom/motorola/otalib/common/metaData/MetaData;->preDownloadInstructions:Ljava/lang/String;

    move-object/from16 v1, p74

    iput-object v1, v0, Lcom/motorola/otalib/common/metaData/MetaData;->preInstallInstructions:Ljava/lang/String;

    move-wide/from16 v1, p71

    iput-wide v1, v0, Lcom/motorola/otalib/common/metaData/MetaData;->sourceBuildTimestamp:J

    move-object/from16 v1, p75

    iput-object v1, v0, Lcom/motorola/otalib/common/metaData/MetaData;->sourceSha1:Ljava/lang/String;

    move-object/from16 v1, p76

    iput-object v1, v0, Lcom/motorola/otalib/common/metaData/MetaData;->targetSha1:Ljava/lang/String;

    move-object/from16 v1, p77

    iput-object v1, v0, Lcom/motorola/otalib/common/metaData/MetaData;->packageType:Ljava/lang/String;

    move/from16 v1, p80

    iput v1, v0, Lcom/motorola/otalib/common/metaData/MetaData;->mCriticalUpdateExtraWaitCount:I

    move-wide/from16 v1, p78

    iput-wide v1, v0, Lcom/motorola/otalib/common/metaData/MetaData;->mCriticalUpdateExtraWaitPeriod:J

    move/from16 v1, p81

    iput v1, v0, Lcom/motorola/otalib/common/metaData/MetaData;->mBitmap:I

    move-wide/from16 v1, p82

    iput-wide v1, v0, Lcom/motorola/otalib/common/metaData/MetaData;->userDataRequiredForUpdate:J

    return-void
.end method


# virtual methods
.method public getAbInstallType()Ljava/lang/String;
    .locals 0

    iget-object p0, p0, Lcom/motorola/otalib/common/metaData/MetaData;->abInstallType:Ljava/lang/String;

    return-object p0
.end method

.method public getAnnoy()Ljava/lang/String;
    .locals 0

    iget-object p0, p0, Lcom/motorola/otalib/common/metaData/MetaData;->annoy:Ljava/lang/String;

    return-object p0
.end method

.method public getBitmap()I
    .locals 0

    iget p0, p0, Lcom/motorola/otalib/common/metaData/MetaData;->mBitmap:I

    return p0
.end method

.method public getByPassPreDownloadDialog()Z
    .locals 0

    iget-boolean p0, p0, Lcom/motorola/otalib/common/metaData/MetaData;->mBypassPreDownloadDialog:Z

    return p0
.end method

.method public getChunkSize()J
    .locals 2

    iget-wide v0, p0, Lcom/motorola/otalib/common/metaData/MetaData;->mChunkSize:J

    return-wide v0
.end method

.method public getCriticalDeferCount()I
    .locals 0

    iget p0, p0, Lcom/motorola/otalib/common/metaData/MetaData;->mCriticalDeferCount:I

    if-ltz p0, :cond_0

    goto :goto_0

    :cond_0
    const/4 p0, 0x3

    :goto_0
    return p0
.end method

.method public getCriticalUpdateExtraWaitCount()I
    .locals 0

    iget p0, p0, Lcom/motorola/otalib/common/metaData/MetaData;->mCriticalUpdateExtraWaitCount:I

    if-ltz p0, :cond_0

    goto :goto_0

    :cond_0
    const/4 p0, 0x6

    :goto_0
    return p0
.end method

.method public getCriticalUpdateExtraWaitPeriod()J
    .locals 4

    iget-wide v0, p0, Lcom/motorola/otalib/common/metaData/MetaData;->mCriticalUpdateExtraWaitPeriod:J

    const-wide/16 v2, 0x0

    cmp-long p0, v0, v2

    if-ltz p0, :cond_0

    goto :goto_0

    :cond_0
    const-wide/16 v0, 0xa

    :goto_0
    return-wide v0
.end method

.method public getCriticalUpdateReminder()I
    .locals 0

    iget p0, p0, Lcom/motorola/otalib/common/metaData/MetaData;->mCriticalUpdateReminder:I

    if-ltz p0, :cond_0

    goto :goto_0

    :cond_0
    const/16 p0, 0xf0

    :goto_0
    return p0
.end method

.method public getDisplayVersion()Ljava/lang/String;
    .locals 0

    iget-object p0, p0, Lcom/motorola/otalib/common/metaData/MetaData;->displayVersion:Ljava/lang/String;

    return-object p0
.end method

.method public getDownloadEndTime()I
    .locals 0

    iget p0, p0, Lcom/motorola/otalib/common/metaData/MetaData;->mDownloadEndTime:I

    return p0
.end method

.method public getDownloadOptionsNotes()Ljava/lang/String;
    .locals 0

    iget-object p0, p0, Lcom/motorola/otalib/common/metaData/MetaData;->downloadOptionsNotes:Ljava/lang/String;

    return-object p0
.end method

.method public getDownloadStartTime()I
    .locals 0

    iget p0, p0, Lcom/motorola/otalib/common/metaData/MetaData;->mDownloadStartTime:I

    return p0
.end method

.method public getDownloadTimes()Lcom/motorola/otalib/common/metaData/DownloadTimes;
    .locals 0

    iget-object p0, p0, Lcom/motorola/otalib/common/metaData/MetaData;->downloadTimes:Lcom/motorola/otalib/common/metaData/DownloadTimes;

    return-object p0
.end method

.method public getDownloadUrl()Ljava/net/URI;
    .locals 0

    iget-object p0, p0, Lcom/motorola/otalib/common/metaData/MetaData;->downloadUrl:Ljava/net/URI;

    return-object p0
.end method

.method public getEnterpriseOta()Z
    .locals 0

    iget-boolean p0, p0, Lcom/motorola/otalib/common/metaData/MetaData;->mEnterpriseOta:Z

    return p0
.end method

.method public getExtraSpace()J
    .locals 2

    iget-wide v0, p0, Lcom/motorola/otalib/common/metaData/MetaData;->extraSpace:J

    return-wide v0
.end method

.method public getFingerprint()Ljava/lang/String;
    .locals 0

    iget-object p0, p0, Lcom/motorola/otalib/common/metaData/MetaData;->fingerprint:Ljava/lang/String;

    return-object p0
.end method

.method public getForceDownloadTime()D
    .locals 2

    iget-wide v0, p0, Lcom/motorola/otalib/common/metaData/MetaData;->mForceDownloadTime:D

    return-wide v0
.end method

.method public getForceInstallTime()D
    .locals 2

    iget-wide v0, p0, Lcom/motorola/otalib/common/metaData/MetaData;->mForceInstallTime:D

    return-wide v0
.end method

.method public getForceUpgradeTime()I
    .locals 0

    iget p0, p0, Lcom/motorola/otalib/common/metaData/MetaData;->mForceUpgradeTime:I

    return p0
.end method

.method public getIncrementalVersion()I
    .locals 0

    iget p0, p0, Lcom/motorola/otalib/common/metaData/MetaData;->mIncrementalVersion:I

    return p0
.end method

.method public getInstallReminder()Ljava/lang/String;
    .locals 0

    iget-object p0, p0, Lcom/motorola/otalib/common/metaData/MetaData;->installReminder:Ljava/lang/String;

    return-object p0
.end method

.method public getInstallTime()I
    .locals 0

    iget p0, p0, Lcom/motorola/otalib/common/metaData/MetaData;->installTime:I

    return p0
.end method

.method public getMaxUpdateFailCount()I
    .locals 0

    iget p0, p0, Lcom/motorola/otalib/common/metaData/MetaData;->mMaxUpdateFailCount:I

    return p0
.end method

.method public getMetaVersion()Ljava/lang/String;
    .locals 0

    iget-object p0, p0, Lcom/motorola/otalib/common/metaData/MetaData;->metaVersion:Ljava/lang/String;

    return-object p0
.end method

.method public getMinVersion()Ljava/lang/String;
    .locals 0

    iget-object p0, p0, Lcom/motorola/otalib/common/metaData/MetaData;->minVersion:Ljava/lang/String;

    return-object p0
.end method

.method public getOSreleaseLink()Ljava/lang/String;
    .locals 0

    iget-object p0, p0, Lcom/motorola/otalib/common/metaData/MetaData;->osReleaseLink:Ljava/lang/String;

    return-object p0
.end method

.method public getOemConfigUpdateData()Z
    .locals 0

    iget-boolean p0, p0, Lcom/motorola/otalib/common/metaData/MetaData;->mOemConfigUpdate:Z

    return p0
.end method

.method public getOffPeakDownload()Lcom/motorola/otalib/common/metaData/OffPeakDownload;
    .locals 0

    iget-object p0, p0, Lcom/motorola/otalib/common/metaData/MetaData;->offPeakDownload:Lcom/motorola/otalib/common/metaData/OffPeakDownload;

    return-object p0
.end method

.method public getOptionalDeferCount()I
    .locals 0

    iget p0, p0, Lcom/motorola/otalib/common/metaData/MetaData;->mOptionalDeferCount:I

    return p0
.end method

.method public getOptionalUpdateCancelReminderDays()I
    .locals 0

    iget p0, p0, Lcom/motorola/otalib/common/metaData/MetaData;->mOptionalUpdateCancelReminderDays:I

    return p0
.end method

.method public getPackageType()Ljava/lang/String;
    .locals 0

    iget-object p0, p0, Lcom/motorola/otalib/common/metaData/MetaData;->packageType:Ljava/lang/String;

    return-object p0
.end method

.method public getPolicyBundle()Z
    .locals 0

    iget-boolean p0, p0, Lcom/motorola/otalib/common/metaData/MetaData;->mPolicyBundle:Z

    return p0
.end method

.method public getPostInstallFailureMessage()Ljava/lang/String;
    .locals 0

    iget-object p0, p0, Lcom/motorola/otalib/common/metaData/MetaData;->postInstallFailureMessage:Ljava/lang/String;

    return-object p0
.end method

.method public getPostInstallNotes()Ljava/lang/String;
    .locals 0

    iget-object p0, p0, Lcom/motorola/otalib/common/metaData/MetaData;->postInstallNotes:Ljava/lang/String;

    return-object p0
.end method

.method public getPreDownloadInstructions()Ljava/lang/String;
    .locals 0

    iget-object p0, p0, Lcom/motorola/otalib/common/metaData/MetaData;->preDownloadInstructions:Ljava/lang/String;

    return-object p0
.end method

.method public getPreDownloadNotificationExpiryMins()I
    .locals 0

    iget p0, p0, Lcom/motorola/otalib/common/metaData/MetaData;->preDownloadNotificationExpiryMins:I

    return p0
.end method

.method public getPreInstallInstructions()Ljava/lang/String;
    .locals 0

    iget-object p0, p0, Lcom/motorola/otalib/common/metaData/MetaData;->preInstallInstructions:Ljava/lang/String;

    return-object p0
.end method

.method public getPreInstallNotes()Ljava/lang/String;
    .locals 0

    iget-object p0, p0, Lcom/motorola/otalib/common/metaData/MetaData;->preInstallNotes:Ljava/lang/String;

    return-object p0
.end method

.method public getPreInstallNotificationExpiryMins()I
    .locals 0

    iget p0, p0, Lcom/motorola/otalib/common/metaData/MetaData;->preInstallNotificationExpiryMins:I

    return p0
.end method

.method public getRebootRequired()Z
    .locals 0

    iget-boolean p0, p0, Lcom/motorola/otalib/common/metaData/MetaData;->mRebootRequired:Z

    return p0
.end method

.method public getReleaseNotes()Ljava/lang/String;
    .locals 0

    iget-object p0, p0, Lcom/motorola/otalib/common/metaData/MetaData;->releaseNotes:Ljava/lang/String;

    return-object p0
.end method

.method public getReportingTags()Ljava/lang/String;
    .locals 0

    iget-object p0, p0, Lcom/motorola/otalib/common/metaData/MetaData;->reportingTags:Ljava/lang/String;

    return-object p0
.end method

.method public getReserveSpaceInMb()J
    .locals 2

    iget-wide v0, p0, Lcom/motorola/otalib/common/metaData/MetaData;->mReserveSpaceInMb:J

    return-wide v0
.end method

.method public getServiceTimeoutSeconds()I
    .locals 0

    iget p0, p0, Lcom/motorola/otalib/common/metaData/MetaData;->serviceTimeoutSeconds:I

    return p0
.end method

.method public getSeverity()I
    .locals 0

    iget p0, p0, Lcom/motorola/otalib/common/metaData/MetaData;->mSeverity:I

    return p0
.end method

.method public getSize()J
    .locals 2

    iget-wide v0, p0, Lcom/motorola/otalib/common/metaData/MetaData;->size:J

    return-wide v0
.end method

.method public getSourceBuildTimeStamp()J
    .locals 2

    iget-wide v0, p0, Lcom/motorola/otalib/common/metaData/MetaData;->sourceBuildTimestamp:J

    return-wide v0
.end method

.method public getSourceSha1()Ljava/lang/String;
    .locals 0

    iget-object p0, p0, Lcom/motorola/otalib/common/metaData/MetaData;->sourceSha1:Ljava/lang/String;

    return-object p0
.end method

.method public getStreamingData()Lorg/json/JSONObject;
    .locals 0

    iget-object p0, p0, Lcom/motorola/otalib/common/metaData/MetaData;->streamingData:Lorg/json/JSONObject;

    return-object p0
.end method

.method public getTargetOSVersion()Ljava/lang/String;
    .locals 0

    iget-object p0, p0, Lcom/motorola/otalib/common/metaData/MetaData;->targetOSVersion:Ljava/lang/String;

    return-object p0
.end method

.method public getTargetSha1()Ljava/lang/String;
    .locals 0

    iget-object p0, p0, Lcom/motorola/otalib/common/metaData/MetaData;->targetSha1:Ljava/lang/String;

    return-object p0
.end method

.method public getTrackingId()Ljava/lang/String;
    .locals 0

    iget-object p0, p0, Lcom/motorola/otalib/common/metaData/MetaData;->trackingId:Ljava/lang/String;

    return-object p0
.end method

.method public getUiWorkflowControl()Lorg/json/JSONObject;
    .locals 0

    iget-object p0, p0, Lcom/motorola/otalib/common/metaData/MetaData;->mUiWorkflowControl:Lorg/json/JSONObject;

    return-object p0
.end method

.method public getUpdateReqTriggeredBy()Ljava/lang/String;
    .locals 0

    iget-object p0, p0, Lcom/motorola/otalib/common/metaData/MetaData;->updateReqTriggeredBy:Ljava/lang/String;

    return-object p0
.end method

.method public getUpdateTypeData()Ljava/lang/String;
    .locals 0

    iget-object p0, p0, Lcom/motorola/otalib/common/metaData/MetaData;->mUpdateType:Ljava/lang/String;

    return-object p0
.end method

.method public getUpgradeNotification()Ljava/lang/String;
    .locals 0

    iget-object p0, p0, Lcom/motorola/otalib/common/metaData/MetaData;->upgradeNotification:Ljava/lang/String;

    return-object p0
.end method

.method public getUserDataRequiredForUpdate()J
    .locals 2

    iget-wide v0, p0, Lcom/motorola/otalib/common/metaData/MetaData;->userDataRequiredForUpdate:J

    return-wide v0
.end method

.method public getVersion()Ljava/lang/String;
    .locals 0

    iget-object p0, p0, Lcom/motorola/otalib/common/metaData/MetaData;->version:Ljava/lang/String;

    return-object p0
.end method

.method public getmActualTargetVersion()Ljava/lang/String;
    .locals 0

    iget-object p0, p0, Lcom/motorola/otalib/common/metaData/MetaData;->mActualTargetVersion:Ljava/lang/String;

    return-object p0
.end method

.method public getmd5CheckSum()Ljava/lang/String;
    .locals 0

    iget-object p0, p0, Lcom/motorola/otalib/common/metaData/MetaData;->md5Checksum:Ljava/lang/String;

    return-object p0
.end method

.method public getminBatteryRequiredForInstall()I
    .locals 0

    iget p0, p0, Lcom/motorola/otalib/common/metaData/MetaData;->mMinBatteryLevelRequiredForInstall:I

    return p0
.end method

.method public isContinueOnServiceError()Z
    .locals 0

    iget-boolean p0, p0, Lcom/motorola/otalib/common/metaData/MetaData;->continueOnServiceError:Z

    return p0
.end method

.method public isForceInstallTimeSet()Z
    .locals 4

    invoke-virtual {p0}, Lcom/motorola/otalib/common/metaData/MetaData;->getForceInstallTime()D

    move-result-wide v0

    const-wide/high16 v2, -0x4010000000000000L    # -1.0

    invoke-static {v0, v1, v2, v3}, Ljava/lang/Double;->compare(DD)I

    move-result p0

    if-lez p0, :cond_0

    const/4 p0, 0x1

    goto :goto_0

    :cond_0
    const/4 p0, 0x0

    :goto_0
    return p0
.end method

.method public isForceOnCellular()Z
    .locals 0

    iget-boolean p0, p0, Lcom/motorola/otalib/common/metaData/MetaData;->mForceOnCellular:Z

    return p0
.end method

.method public isForced()Z
    .locals 0

    iget-boolean p0, p0, Lcom/motorola/otalib/common/metaData/MetaData;->forced:Z

    return p0
.end method

.method public isServiceControlEnabled()Z
    .locals 0

    iget-boolean p0, p0, Lcom/motorola/otalib/common/metaData/MetaData;->serviceControlEnabled:Z

    return p0
.end method

.method public isWifiOnly()Z
    .locals 0

    iget-boolean p0, p0, Lcom/motorola/otalib/common/metaData/MetaData;->wifiOnly:Z

    return p0
.end method

.method public showDownloadOptions()Z
    .locals 0

    iget-boolean p0, p0, Lcom/motorola/otalib/common/metaData/MetaData;->showDownloadOptions:Z

    return p0
.end method

.method public showDownloadProgress()Z
    .locals 0

    iget-boolean p0, p0, Lcom/motorola/otalib/common/metaData/MetaData;->mShowDownloadProgress:Z

    return p0
.end method

.method public showPostInstallScreen()Z
    .locals 0

    iget-boolean p0, p0, Lcom/motorola/otalib/common/metaData/MetaData;->mShowPostInstallScreen:Z

    return p0
.end method

.method public showPreDownloadDialog()Z
    .locals 0

    iget-boolean p0, p0, Lcom/motorola/otalib/common/metaData/MetaData;->showPreDownloadDialog:Z

    return p0
.end method

.method public showPreInstallScreen()Z
    .locals 0

    iget-boolean p0, p0, Lcom/motorola/otalib/common/metaData/MetaData;->mShowPreInstallScreen:Z

    return p0
.end method
