.class public Lcom/motorola/ccc/ota/ui/CriticalUpdate;
.super Ljava/lang/Object;
.source "CriticalUpdate.java"


# instance fields
.field private mCriticalAnnoyValue:J

.field private mLocationType:Ljava/lang/String;

.field private mSeverity:I

.field private mUpgradeInfo:Lcom/motorola/ccc/ota/ui/UpdaterUtils$UpgradeInfo;

.field private settings:Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;


# direct methods
.method public constructor <init>(Lcom/motorola/ccc/ota/ui/UpdaterUtils$UpgradeInfo;)V
    .locals 4

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/motorola/ccc/ota/ui/CriticalUpdate;->mUpgradeInfo:Lcom/motorola/ccc/ota/ui/UpdaterUtils$UpgradeInfo;

    new-instance v0, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    invoke-direct {v0}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;-><init>()V

    iput-object v0, p0, Lcom/motorola/ccc/ota/ui/CriticalUpdate;->settings:Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    invoke-virtual {p1}, Lcom/motorola/ccc/ota/ui/UpdaterUtils$UpgradeInfo;->getCriticalUpdateReminder()I

    move-result v0

    mul-int/lit8 v0, v0, 0x3c

    int-to-long v0, v0

    const-wide/16 v2, 0x3e8

    mul-long/2addr v0, v2

    iput-wide v0, p0, Lcom/motorola/ccc/ota/ui/CriticalUpdate;->mCriticalAnnoyValue:J

    invoke-virtual {p1}, Lcom/motorola/ccc/ota/ui/UpdaterUtils$UpgradeInfo;->getSeverity()I

    move-result v0

    iput v0, p0, Lcom/motorola/ccc/ota/ui/CriticalUpdate;->mSeverity:I

    invoke-virtual {p1}, Lcom/motorola/ccc/ota/ui/UpdaterUtils$UpgradeInfo;->getLocationType()Ljava/lang/String;

    move-result-object p1

    iput-object p1, p0, Lcom/motorola/ccc/ota/ui/CriticalUpdate;->mLocationType:Ljava/lang/String;

    return-void
.end method

.method private isInCriticalUpdateExtraPopUpTime()Z
    .locals 6

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v0

    iget-object v2, p0, Lcom/motorola/ccc/ota/ui/CriticalUpdate;->settings:Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    sget-object v3, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->MAX_CRITICAL_UPDATE_DEFER_TIME:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    const-wide/16 v4, -0x1

    invoke-virtual {v2, v3, v4, v5}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->getLong(Lcom/motorola/otalib/common/settings/ISetting;J)J

    move-result-wide v2

    const-wide/16 v4, 0x0

    cmp-long v4, v2, v4

    const/4 v5, 0x0

    if-ltz v4, :cond_0

    sub-long/2addr v2, v0

    invoke-direct {p0}, Lcom/motorola/ccc/ota/ui/CriticalUpdate;->totalExtraPopUpTime()J

    move-result-wide v0

    cmp-long p0, v2, v0

    if-gtz p0, :cond_0

    const/4 v5, 0x1

    :cond_0
    return v5
.end method

.method static synthetic lambda$buildPopUp$0(Landroidx/appcompat/app/AlertDialog;Landroid/view/View;)V
    .locals 0

    invoke-virtual {p0}, Landroidx/appcompat/app/AlertDialog;->cancel()V

    return-void
.end method

.method private totalExtraPopUpTime()J
    .locals 4

    iget-object v0, p0, Lcom/motorola/ccc/ota/ui/CriticalUpdate;->mUpgradeInfo:Lcom/motorola/ccc/ota/ui/UpdaterUtils$UpgradeInfo;

    invoke-virtual {v0}, Lcom/motorola/ccc/ota/ui/UpdaterUtils$UpgradeInfo;->getCriticalUpdateExtraWaitPeriodInMillis()J

    move-result-wide v0

    iget-object p0, p0, Lcom/motorola/ccc/ota/ui/CriticalUpdate;->mUpgradeInfo:Lcom/motorola/ccc/ota/ui/UpdaterUtils$UpgradeInfo;

    invoke-virtual {p0}, Lcom/motorola/ccc/ota/ui/UpdaterUtils$UpgradeInfo;->getCriticalUpdateExtraWaitCount()J

    move-result-wide v2

    mul-long/2addr v0, v2

    return-wide v0
.end method


# virtual methods
.method public buildPopUp(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)Landroidx/appcompat/app/AlertDialog;
    .locals 3

    new-instance p0, Landroidx/appcompat/app/AlertDialog$Builder;

    invoke-direct {p0, p1}, Landroidx/appcompat/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    const-string v0, "layout_inflater"

    invoke-virtual {p1, v0}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/view/LayoutInflater;

    const v1, 0x7f0c0022

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    move-result-object v0

    invoke-virtual {p0, v0}, Landroidx/appcompat/app/AlertDialog$Builder;->setView(Landroid/view/View;)Landroidx/appcompat/app/AlertDialog$Builder;

    invoke-virtual {p0}, Landroidx/appcompat/app/AlertDialog$Builder;->create()Landroidx/appcompat/app/AlertDialog;

    move-result-object p0

    const v1, 0x7f09007e

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/TextView;

    const/4 v2, 0x0

    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setVisibility(I)V

    invoke-virtual {v1, p2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    const p2, 0x7f09007d

    invoke-virtual {v0, p2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p2

    check-cast p2, Landroid/widget/TextView;

    invoke-virtual {p2, v2}, Landroid/widget/TextView;->setVisibility(I)V

    invoke-virtual {p2, p3}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    const/4 p2, 0x1

    invoke-virtual {p0, p2}, Landroidx/appcompat/app/AlertDialog;->setCancelable(Z)V

    const p2, 0x7f09007f

    invoke-virtual {v0, p2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p2

    check-cast p2, Landroid/widget/Button;

    invoke-virtual {p2, v2}, Landroid/widget/Button;->setVisibility(I)V

    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object p3

    const v0, 0x7f0e0106

    invoke-virtual {p3, v0}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object p3

    invoke-virtual {p2, p3}, Landroid/widget/Button;->setText(Ljava/lang/CharSequence;)V

    new-instance p3, Lcom/motorola/ccc/ota/ui/CriticalUpdate$$ExternalSyntheticLambda0;

    invoke-direct {p3, p0}, Lcom/motorola/ccc/ota/ui/CriticalUpdate$$ExternalSyntheticLambda0;-><init>(Landroidx/appcompat/app/AlertDialog;)V

    invoke-virtual {p2, p3}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    invoke-static {p1, p0}, Lcom/motorola/ccc/ota/ui/UpdaterUtils;->setCornersRounded(Landroid/content/Context;Landroidx/appcompat/app/AlertDialog;)V

    return-object p0
.end method

.method public getAndSetNextPromptValue(J)J
    .locals 7

    iget-object v0, p0, Lcom/motorola/ccc/ota/ui/CriticalUpdate;->settings:Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    sget-object v1, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->MAX_CRITICAL_UPDATE_DEFER_TIME:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    const-wide/16 v2, -0x1

    invoke-virtual {v0, v1, v2, v3}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->getLong(Lcom/motorola/otalib/common/settings/ISetting;J)J

    move-result-wide v0

    sub-long/2addr v0, p1

    iget-object v4, p0, Lcom/motorola/ccc/ota/ui/CriticalUpdate;->settings:Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    sget-object v5, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->NEXT_CRITICAL_UPDATE_PROMPT_TIME:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    invoke-virtual {v4, v5, v2, v3}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->getLong(Lcom/motorola/otalib/common/settings/ISetting;J)J

    move-result-wide v2

    invoke-static {}, Lcom/motorola/ccc/ota/utils/BuildPropReader;->isFotaATT()Z

    move-result v4

    if-eqz v4, :cond_2

    const-wide/32 v4, 0xdbba00

    iput-wide v4, p0, Lcom/motorola/ccc/ota/ui/CriticalUpdate;->mCriticalAnnoyValue:J

    cmp-long v6, v2, p1

    if-lez v6, :cond_0

    goto :goto_1

    :cond_0
    cmp-long v2, v0, v4

    if-gez v2, :cond_1

    goto :goto_0

    :cond_1
    add-long v2, p1, v4

    goto :goto_1

    :cond_2
    cmp-long v4, v2, p1

    if-lez v4, :cond_3

    goto :goto_1

    :cond_3
    iget-object v2, p0, Lcom/motorola/ccc/ota/ui/CriticalUpdate;->mUpgradeInfo:Lcom/motorola/ccc/ota/ui/UpdaterUtils$UpgradeInfo;

    invoke-virtual {v2}, Lcom/motorola/ccc/ota/ui/UpdaterUtils$UpgradeInfo;->getCriticalUpdateExtraWaitPeriodInMillis()J

    move-result-wide v2

    cmp-long v2, v0, v2

    if-gtz v2, :cond_4

    :goto_0
    add-long v2, p1, v0

    goto :goto_1

    :cond_4
    invoke-direct {p0}, Lcom/motorola/ccc/ota/ui/CriticalUpdate;->totalExtraPopUpTime()J

    move-result-wide v2

    cmp-long v0, v0, v2

    if-gtz v0, :cond_5

    iget-object v0, p0, Lcom/motorola/ccc/ota/ui/CriticalUpdate;->mUpgradeInfo:Lcom/motorola/ccc/ota/ui/UpdaterUtils$UpgradeInfo;

    invoke-virtual {v0}, Lcom/motorola/ccc/ota/ui/UpdaterUtils$UpgradeInfo;->getCriticalUpdateExtraWaitPeriodInMillis()J

    move-result-wide v0

    goto :goto_0

    :cond_5
    iget-wide v0, p0, Lcom/motorola/ccc/ota/ui/CriticalUpdate;->mCriticalAnnoyValue:J

    goto :goto_0

    :goto_1
    iget-object p0, p0, Lcom/motorola/ccc/ota/ui/CriticalUpdate;->settings:Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    sget-object p1, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->NEXT_CRITICAL_UPDATE_PROMPT_TIME:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    invoke-virtual {p0, p1, v2, v3}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->setLong(Lcom/motorola/otalib/common/settings/ISetting;J)V

    new-instance p0, Ljava/lang/StringBuilder;

    const-string p1, "next prompt is : "

    invoke-direct {p0, p1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p0, v2, v3}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    const-string p1, "OtaApp"

    invoke-static {p1, p0}, Lcom/motorola/ccc/ota/utils/Logger;->debug(Ljava/lang/String;Ljava/lang/String;)V

    return-wide v2
.end method

.method public getExtendRestartTime()J
    .locals 3

    iget-object p0, p0, Lcom/motorola/ccc/ota/ui/CriticalUpdate;->settings:Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    sget-object v0, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->MAX_CRITICAL_UPDATE_EXTENDED_TIME:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    const-wide/16 v1, -0x1

    invoke-virtual {p0, v0, v1, v2}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->getLong(Lcom/motorola/otalib/common/settings/ISetting;J)J

    move-result-wide v0

    return-wide v0
.end method

.method public getMaxUpdateCalendarString(Landroid/content/Context;)Ljava/lang/String;
    .locals 3

    iget-object p0, p0, Lcom/motorola/ccc/ota/ui/CriticalUpdate;->settings:Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    sget-object v0, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->MAX_CRITICAL_UPDATE_DEFER_TIME:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    const-wide/16 v1, -0x1

    invoke-virtual {p0, v0, v1, v2}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->getLong(Lcom/motorola/otalib/common/settings/ISetting;J)J

    move-result-wide v0

    invoke-static {p1, v0, v1}, Lcom/motorola/ccc/ota/utils/DateFormatUtils;->getCalendarString(Landroid/content/Context;J)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method public isCriticalUpdate()Z
    .locals 0

    iget-object p0, p0, Lcom/motorola/ccc/ota/ui/CriticalUpdate;->mUpgradeInfo:Lcom/motorola/ccc/ota/ui/UpdaterUtils$UpgradeInfo;

    invoke-virtual {p0}, Lcom/motorola/ccc/ota/ui/UpdaterUtils$UpgradeInfo;->isCriticalUpdate()Z

    move-result p0

    if-eqz p0, :cond_0

    const/4 p0, 0x1

    return p0

    :cond_0
    invoke-static {}, Lcom/motorola/ccc/ota/ui/UpdaterUtils;->isWaitForDozeModeOver()Z

    move-result p0

    return p0
.end method

.method public isCriticalUpdateTimerExpired()Z
    .locals 1

    iget-object p0, p0, Lcom/motorola/ccc/ota/ui/CriticalUpdate;->mUpgradeInfo:Lcom/motorola/ccc/ota/ui/UpdaterUtils$UpgradeInfo;

    invoke-static {p0}, Lcom/motorola/ccc/ota/ui/UpdaterUtils;->isCriticalUpdateTimerExpired(Lcom/motorola/ccc/ota/ui/UpdaterUtils$UpgradeInfo;)Z

    move-result p0

    const/4 v0, 0x1

    if-eqz p0, :cond_0

    const-string p0, "criticalUpdateAutoInstall"

    invoke-static {p0}, Lcom/motorola/ccc/ota/ui/UpdaterUtils;->sendInstallModeStats(Ljava/lang/String;)V

    return v0

    :cond_0
    invoke-static {}, Lcom/motorola/ccc/ota/ui/UpdaterUtils;->isWaitForDozeModeOver()Z

    move-result p0

    if-eqz p0, :cond_1

    const-string p0, "forceInstallAfterDozeWait"

    invoke-static {p0}, Lcom/motorola/ccc/ota/ui/UpdaterUtils;->sendInstallModeStats(Ljava/lang/String;)V

    return v0

    :cond_1
    const/4 p0, 0x0

    return p0
.end method

.method public isOutsideCriticalUpdateExtendedTime()Z
    .locals 9

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v0

    iget-object p0, p0, Lcom/motorola/ccc/ota/ui/CriticalUpdate;->settings:Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    sget-object v2, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->MAX_CRITICAL_UPDATE_EXTENDED_TIME:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    const-wide/16 v3, -0x1

    invoke-virtual {p0, v2, v3, v4}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->getLong(Lcom/motorola/otalib/common/settings/ISetting;J)J

    move-result-wide v5

    sub-long v0, v5, v0

    const-wide/16 v7, 0x0

    cmp-long p0, v5, v7

    if-lez p0, :cond_0

    cmp-long p0, v0, v7

    if-gtz p0, :cond_0

    const-string p0, "criticalUpdateExtendedAutoInstall"

    invoke-static {p0}, Lcom/motorola/ccc/ota/ui/UpdaterUtils;->sendInstallModeStats(Ljava/lang/String;)V

    :cond_0
    cmp-long p0, v0, v7

    if-lez p0, :cond_2

    cmp-long p0, v5, v3

    if-nez p0, :cond_1

    goto :goto_0

    :cond_1
    const/4 p0, 0x0

    goto :goto_1

    :cond_2
    :goto_0
    const/4 p0, 0x1

    :goto_1
    return p0
.end method

.method public isUpdateBotaCritical()Z
    .locals 2

    const-string v0, "upgrade"

    iget-object v1, p0, Lcom/motorola/ccc/ota/ui/CriticalUpdate;->mLocationType:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/String;->contentEquals(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_0

    iget p0, p0, Lcom/motorola/ccc/ota/ui/CriticalUpdate;->mSeverity:I

    sget-object v0, Lcom/motorola/otalib/common/utils/UpgradeUtils$SeverityType;->CRITICAL:Lcom/motorola/otalib/common/utils/UpgradeUtils$SeverityType;

    invoke-virtual {v0}, Lcom/motorola/otalib/common/utils/UpgradeUtils$SeverityType;->ordinal()I

    move-result v0

    if-ne p0, v0, :cond_0

    const/4 p0, 0x1

    goto :goto_0

    :cond_0
    const/4 p0, 0x0

    :goto_0
    return p0
.end method

.method public isUpdateFotaCritical()Z
    .locals 1

    invoke-static {}, Lcom/motorola/ccc/ota/utils/BuildPropReader;->isATT()Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object p0, p0, Lcom/motorola/ccc/ota/ui/CriticalUpdate;->mUpgradeInfo:Lcom/motorola/ccc/ota/ui/UpdaterUtils$UpgradeInfo;

    invoke-static {p0}, Lcom/motorola/ccc/ota/ui/UpdaterUtils;->isCriticalUpdateTimerExpired(Lcom/motorola/ccc/ota/ui/UpdaterUtils$UpgradeInfo;)Z

    move-result p0

    if-eqz p0, :cond_0

    const/4 p0, 0x1

    goto :goto_0

    :cond_0
    const/4 p0, 0x0

    :goto_0
    return p0
.end method

.method public setExtendRestartTime(J)V
    .locals 3

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v0

    iget-object p0, p0, Lcom/motorola/ccc/ota/ui/CriticalUpdate;->settings:Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    sget-object v2, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->MAX_CRITICAL_UPDATE_EXTENDED_TIME:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    add-long/2addr v0, p1

    invoke-virtual {p0, v2, v0, v1}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->setLong(Lcom/motorola/otalib/common/settings/ISetting;J)V

    return-void
.end method

.method public setInstallStats()V
    .locals 1

    iget-object v0, p0, Lcom/motorola/ccc/ota/ui/CriticalUpdate;->mUpgradeInfo:Lcom/motorola/ccc/ota/ui/UpdaterUtils$UpgradeInfo;

    invoke-static {v0}, Lcom/motorola/ccc/ota/ui/UpdaterUtils;->isCriticalUpdateTimerExpired(Lcom/motorola/ccc/ota/ui/UpdaterUtils$UpgradeInfo;)Z

    move-result v0

    if-eqz v0, :cond_1

    invoke-virtual {p0}, Lcom/motorola/ccc/ota/ui/CriticalUpdate;->isOutsideCriticalUpdateExtendedTime()Z

    move-result p0

    if-nez p0, :cond_0

    const-string p0, "userInitiatedDuringCriticalUpdateExtendedPeriod"

    invoke-static {p0}, Lcom/motorola/ccc/ota/ui/UpdaterUtils;->sendInstallModeStats(Ljava/lang/String;)V

    return-void

    :cond_0
    const-string p0, "criticalUpdateAutoInstall"

    invoke-static {p0}, Lcom/motorola/ccc/ota/ui/UpdaterUtils;->sendInstallModeStats(Ljava/lang/String;)V

    goto :goto_0

    :cond_1
    invoke-direct {p0}, Lcom/motorola/ccc/ota/ui/CriticalUpdate;->isInCriticalUpdateExtraPopUpTime()Z

    move-result v0

    if-eqz v0, :cond_2

    const-string p0, "userInitiatedAfterCriticalAnnoy"

    invoke-static {p0}, Lcom/motorola/ccc/ota/ui/UpdaterUtils;->sendInstallModeStats(Ljava/lang/String;)V

    goto :goto_0

    :cond_2
    invoke-static {}, Lcom/motorola/ccc/ota/ui/UpdaterUtils;->isWaitForDozeModeOver()Z

    move-result v0

    if-eqz v0, :cond_3

    const-string p0, "forceInstallAfterDozeWait"

    invoke-static {p0}, Lcom/motorola/ccc/ota/ui/UpdaterUtils;->sendInstallModeStats(Ljava/lang/String;)V

    goto :goto_0

    :cond_3
    iget-object v0, p0, Lcom/motorola/ccc/ota/ui/CriticalUpdate;->settings:Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    iget-object p0, p0, Lcom/motorola/ccc/ota/ui/CriticalUpdate;->mUpgradeInfo:Lcom/motorola/ccc/ota/ui/UpdaterUtils$UpgradeInfo;

    invoke-static {v0, p0}, Lcom/motorola/ccc/ota/utils/SmartUpdateUtils;->isSmartUpdateTimerExpired(Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;Lcom/motorola/ccc/ota/ui/UpdaterUtils$UpgradeInfo;)Z

    move-result p0

    if-eqz p0, :cond_4

    const-string p0, "installedViaSmartUpdate"

    invoke-static {p0}, Lcom/motorola/ccc/ota/ui/UpdaterUtils;->sendInstallModeStats(Ljava/lang/String;)V

    goto :goto_0

    :cond_4
    const-string p0, "userInitiated"

    invoke-static {p0}, Lcom/motorola/ccc/ota/ui/UpdaterUtils;->sendInstallModeStats(Ljava/lang/String;)V

    :goto_0
    return-void
.end method

.method public shouldAllowExtendedCriticalUpdate()Z
    .locals 4

    invoke-virtual {p0}, Lcom/motorola/ccc/ota/ui/CriticalUpdate;->isCriticalUpdate()Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-static {}, Lcom/motorola/ccc/ota/utils/BuildPropReader;->isATT()Z

    move-result v0

    if-nez v0, :cond_0

    iget-object v0, p0, Lcom/motorola/ccc/ota/ui/CriticalUpdate;->settings:Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    sget-object v1, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->MAX_CRITICAL_UPDATE_EXTENDED_TIME:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    const-wide/16 v2, -0x1

    invoke-virtual {v0, v1, v2, v3}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->getLong(Lcom/motorola/otalib/common/settings/ISetting;J)J

    move-result-wide v0

    const-wide/16 v2, 0x0

    cmp-long v0, v0, v2

    if-gez v0, :cond_0

    iget-object p0, p0, Lcom/motorola/ccc/ota/ui/CriticalUpdate;->mUpgradeInfo:Lcom/motorola/ccc/ota/ui/UpdaterUtils$UpgradeInfo;

    invoke-static {p0}, Lcom/motorola/ccc/ota/ui/UpdaterUtils;->isCriticalUpdateTimerExpired(Lcom/motorola/ccc/ota/ui/UpdaterUtils$UpgradeInfo;)Z

    move-result p0

    if-eqz p0, :cond_0

    const/4 p0, 0x1

    goto :goto_0

    :cond_0
    const/4 p0, 0x0

    :goto_0
    return p0
.end method

.method public shouldDisplayPopUp(Landroid/content/Context;)Z
    .locals 8

    const-string v0, "Install"

    const/4 v1, 0x0

    invoke-virtual {p1, v0, v1}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object p1

    const-string v0, "checkbox_selected"

    invoke-interface {p1, v0, v1}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result p1

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v2

    iget-object v0, p0, Lcom/motorola/ccc/ota/ui/CriticalUpdate;->settings:Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    sget-object v4, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->MAX_CRITICAL_UPDATE_DEFER_TIME:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    const-wide/16 v5, -0x1

    invoke-virtual {v0, v4, v5, v6}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->getLong(Lcom/motorola/otalib/common/settings/ISetting;J)J

    move-result-wide v4

    sub-long/2addr v4, v2

    invoke-direct {p0}, Lcom/motorola/ccc/ota/ui/CriticalUpdate;->totalExtraPopUpTime()J

    move-result-wide v2

    iget-object p0, p0, Lcom/motorola/ccc/ota/ui/CriticalUpdate;->mUpgradeInfo:Lcom/motorola/ccc/ota/ui/UpdaterUtils$UpgradeInfo;

    invoke-virtual {p0}, Lcom/motorola/ccc/ota/ui/UpdaterUtils$UpgradeInfo;->getCriticalUpdateExtraWaitPeriodInMillis()J

    move-result-wide v6

    sub-long/2addr v2, v6

    cmp-long p0, v4, v2

    if-gtz p0, :cond_0

    const-wide/16 v2, 0x0

    cmp-long p0, v4, v2

    if-lez p0, :cond_0

    if-nez p1, :cond_0

    const/4 v1, 0x1

    :cond_0
    return v1
.end method

.method public updatePrompts(Landroid/content/Context;)V
    .locals 10

    iget-object v0, p0, Lcom/motorola/ccc/ota/ui/CriticalUpdate;->settings:Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    sget-object v1, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->NEXT_CRITICAL_UPDATE_PROMPT_TIME:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    const-wide/16 v2, -0x1

    invoke-virtual {v0, v1, v2, v3}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->getLong(Lcom/motorola/otalib/common/settings/ISetting;J)J

    move-result-wide v0

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v4

    iget-object v6, p0, Lcom/motorola/ccc/ota/ui/CriticalUpdate;->settings:Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    sget-object v7, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->MAX_CRITICAL_UPDATE_DEFER_TIME:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    invoke-virtual {v6, v7, v2, v3}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->getLong(Lcom/motorola/otalib/common/settings/ISetting;J)J

    move-result-wide v2

    iget-wide v6, p0, Lcom/motorola/ccc/ota/ui/CriticalUpdate;->mCriticalAnnoyValue:J

    add-long/2addr v6, v4

    iget-object v8, p0, Lcom/motorola/ccc/ota/ui/CriticalUpdate;->settings:Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    sget-object v9, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->NEXT_CRITICAL_UPDATE_PROMPT_TIME:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    invoke-virtual {v8, v9, v6, v7}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->setLong(Lcom/motorola/otalib/common/settings/ISetting;J)V

    sub-long/2addr v6, v0

    add-long/2addr v2, v6

    sub-long/2addr v2, v4

    iget-object v0, p0, Lcom/motorola/ccc/ota/ui/CriticalUpdate;->settings:Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    sget-object v1, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->MAX_CRITICAL_UPDATE_DEFER_TIME:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v4

    add-long/2addr v4, v2

    invoke-virtual {v0, v1, v4, v5}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->setLong(Lcom/motorola/otalib/common/settings/ISetting;J)V

    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "new maxupdate prompt : "

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p0, p1}, Lcom/motorola/ccc/ota/ui/CriticalUpdate;->getMaxUpdateCalendarString(Landroid/content/Context;)Ljava/lang/String;

    move-result-object p0

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    const-string p1, "OtaApp"

    invoke-static {p1, p0}, Lcom/motorola/ccc/ota/utils/Logger;->debug(Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method
