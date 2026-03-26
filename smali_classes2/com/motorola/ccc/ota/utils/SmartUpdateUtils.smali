.class public Lcom/motorola/ccc/ota/utils/SmartUpdateUtils;
.super Ljava/lang/Object;
.source "SmartUpdateUtils.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/motorola/ccc/ota/utils/SmartUpdateUtils$SmartDialog;,
        Lcom/motorola/ccc/ota/utils/SmartUpdateUtils$SmartUpdateBitmap;,
        Lcom/motorola/ccc/ota/utils/SmartUpdateUtils$OnSmartUpdateConfigChangedLister;,
        Lcom/motorola/ccc/ota/utils/SmartUpdateUtils$SmartUpdateLaunchMode;
    }
.end annotation


# static fields
.field public static final ENTERPRISE_EDITION:Ljava/lang/String; = "enterprise_edition"

.field public static final INTERVAL_HOURS:I = 0x2

.field public static final MASK_SEPARATOR:Ljava/lang/String; = ":"

.field public static final MASK_SLOT_TIME_MAPPING:Ljava/lang/String; = "%02d:%02d:%02d:%02d"

.field private static final MAX_TIME_INTERVAL:I = 0x1388

.field private static final MIN_TIME_INTERVAL:I = 0x64

.field public static final SLOT1_END_HOUR:I = 0x3

.field public static final SLOT1_START_HOUR:I = 0x1

.field public static final SLOT2_END_HOUR:I = 0x4

.field public static final SLOT2_START_HOUR:I = 0x2

.field public static final SLOT3_END_HOUR:I = 0x5

.field public static final SLOT3_START_HOUR:I = 0x3

.field public static final SLOT_CUSTOM_END_HOUR:I = 0x13

.field public static final SLOT_CUSTOM_START_HOUR:I = 0x11

.field public static final TIME_30_MINUTES:I = 0x1e

.field public static final TIME_ZERO_MINUTES:I

.field private static mDoubleBackToExitPressedOnce:J


# direct methods
.method public constructor <init>()V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method private static canSmartUpdateBlockForSystemUpdatePolicy()Z
    .locals 3

    new-instance v0, Lcom/motorola/ccc/ota/env/SystemUpdaterPolicy;

    invoke-direct {v0}, Lcom/motorola/ccc/ota/env/SystemUpdaterPolicy;-><init>()V

    invoke-static {}, Lcom/motorola/ccc/ota/env/OtaApplication;->getGlobalContext()Landroid/content/Context;

    move-result-object v1

    invoke-static {v1}, Lcom/motorola/ccc/ota/sources/bota/thinkshield/ThinkShieldUtils;->getASCCampaignStatusDetails(Landroid/content/Context;)Ljava/util/Map;

    move-result-object v1

    const-string v2, "ASC_CHK_DISABLE_STATUS"

    invoke-interface {v1, v2}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/Boolean;

    invoke-virtual {v1}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v1

    invoke-static {}, Lcom/motorola/ccc/ota/utils/SmartUpdateUtils;->isMotoSettingsGlobalEnterpriseEditionFlagSet()Z

    move-result v2

    if-nez v2, :cond_1

    invoke-virtual {v0}, Lcom/motorola/ccc/ota/env/SystemUpdaterPolicy;->isAutoDownloadOverAnyDataNetworkPolicySet()Z

    move-result v2

    if-nez v2, :cond_1

    invoke-virtual {v0}, Lcom/motorola/ccc/ota/env/SystemUpdaterPolicy;->isOtaUpdateDisabledByPolicyMngr()Z

    move-result v2

    if-nez v2, :cond_1

    invoke-virtual {v0}, Lcom/motorola/ccc/ota/env/SystemUpdaterPolicy;->getPolicyType()I

    move-result v0

    if-gtz v0, :cond_1

    if-eqz v1, :cond_0

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    return v0

    :cond_1
    :goto_0
    const/4 v0, 0x1

    return v0
.end method

.method private static changeSmartUpdateInstallTimestampsOnDeferBased(Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;Z)V
    .locals 9

    sget-object v0, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->SMART_UPDATE_MIN_INSTALL_TIME:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    const-wide/16 v1, -0x1

    invoke-virtual {p0, v0, v1, v2}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->getLong(Lcom/motorola/otalib/common/settings/ISetting;J)J

    move-result-wide v3

    sget-object v0, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->SMART_UPDATE_MAX_INSTALL_TIME:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    invoke-virtual {p0, v0, v1, v2}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->getLong(Lcom/motorola/otalib/common/settings/ISetting;J)J

    move-result-wide v0

    sub-long v5, v0, v3

    const-wide/16 v7, 0x0

    cmp-long v2, v5, v7

    if-gez v2, :cond_1

    const-string v2, "OtaApp"

    const-string v5, "Setting smart update install time stamps in Time Slot"

    invoke-static {v2, v5}, Lcom/motorola/ccc/ota/utils/Logger;->debug(Ljava/lang/String;Ljava/lang/String;)V

    const-wide/32 v5, 0x5265c00

    if-eqz p1, :cond_0

    add-long/2addr v0, v5

    sget-object p1, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->SMART_UPDATE_MAX_INSTALL_TIME:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    invoke-virtual {p0, p1, v0, v1}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->setLong(Lcom/motorola/otalib/common/settings/ISetting;J)V

    return-void

    :cond_0
    sub-long/2addr v3, v5

    sget-object p1, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->SMART_UPDATE_MIN_INSTALL_TIME:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    invoke-virtual {p0, p1, v3, v4}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->setLong(Lcom/motorola/otalib/common/settings/ISetting;J)V

    :cond_1
    return-void
.end method

.method public static decideToShowSmartUpdateSuggestion(Landroid/content/Context;)V
    .locals 3

    new-instance v0, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    invoke-direct {v0}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;-><init>()V

    invoke-static {v0}, Lcom/motorola/ccc/ota/utils/SmartUpdateUtils;->isSmartUpdateEnabledByUser(Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;)Z

    move-result v0

    invoke-static {}, Lcom/motorola/ccc/ota/utils/SmartUpdateUtils;->isSmartUpdateEnabledByServer()Z

    move-result v1

    invoke-static {}, Lcom/motorola/ccc/ota/ui/UpdaterUtils;->isVerizon()Z

    move-result v2

    if-nez v2, :cond_0

    if-eqz v1, :cond_0

    if-nez v0, :cond_0

    invoke-static {p0}, Lcom/motorola/ccc/ota/utils/SmartUpdateUtils;->enableSmartUpdateSuggestion(Landroid/content/Context;)V

    goto :goto_0

    :cond_0
    invoke-static {p0}, Lcom/motorola/ccc/ota/utils/SmartUpdateUtils;->disableSmartUpdateSuggestion(Landroid/content/Context;)V

    :goto_0
    return-void
.end method

.method public static disableSmartUpdateSuggestion(Landroid/content/Context;)V
    .locals 3

    invoke-virtual {p0}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v0

    const-string v1, "OtaApp"

    const-string v2, "SmartUpdateUtils.disableOTASuggestion"

    invoke-static {v1, v2}, Lcom/motorola/ccc/ota/utils/Logger;->debug(Ljava/lang/String;Ljava/lang/String;)V

    new-instance v1, Landroid/content/ComponentName;

    const-string v2, "com.motorola.ccc.ota.OTASuggestion"

    invoke-direct {v1, p0, v2}, Landroid/content/ComponentName;-><init>(Landroid/content/Context;Ljava/lang/String;)V

    const/4 p0, 0x2

    const/4 v2, 0x1

    invoke-virtual {v0, v1, p0, v2}, Landroid/content/pm/PackageManager;->setComponentEnabledSetting(Landroid/content/ComponentName;II)V

    return-void
.end method

.method public static dismissSmartDialogs(Landroidx/fragment/app/FragmentActivity;)V
    .locals 2

    if-nez p0, :cond_0

    return-void

    :cond_0
    invoke-virtual {p0}, Landroidx/fragment/app/FragmentActivity;->getSupportFragmentManager()Landroidx/fragment/app/FragmentManager;

    move-result-object p0

    invoke-virtual {p0}, Landroidx/fragment/app/FragmentManager;->getFragments()Ljava/util/List;

    move-result-object p0

    if-nez p0, :cond_1

    return-void

    :cond_1
    invoke-interface {p0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object p0

    :cond_2
    :goto_0
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_3

    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroidx/fragment/app/Fragment;

    instance-of v1, v0, Lcom/motorola/ccc/ota/utils/SmartUpdateUtils$SmartDialog;

    if-eqz v1, :cond_2

    check-cast v0, Lcom/motorola/ccc/ota/utils/SmartUpdateUtils$SmartDialog;

    invoke-interface {v0}, Lcom/motorola/ccc/ota/utils/SmartUpdateUtils$SmartDialog;->dismissSmartDialog()V

    goto :goto_0

    :cond_3
    return-void
.end method

.method public static enableSmartUpdateSuggestion(Landroid/content/Context;)V
    .locals 3

    invoke-virtual {p0}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v0

    const-string v1, "OtaApp"

    const-string v2, "SmartUpdateUtils.enableOTASuggestion"

    invoke-static {v1, v2}, Lcom/motorola/ccc/ota/utils/Logger;->debug(Ljava/lang/String;Ljava/lang/String;)V

    new-instance v1, Landroid/content/ComponentName;

    const-string v2, "com.motorola.ccc.ota.OTASuggestion"

    invoke-direct {v1, p0, v2}, Landroid/content/ComponentName;-><init>(Landroid/content/Context;Ljava/lang/String;)V

    const/4 p0, 0x1

    invoke-virtual {v0, v1, p0, p0}, Landroid/content/pm/PackageManager;->setComponentEnabledSetting(Landroid/content/ComponentName;II)V

    return-void
.end method

.method public static generateRandomNumber()J
    .locals 4

    new-instance v0, Ljava/util/Random;

    invoke-direct {v0}, Ljava/util/Random;-><init>()V

    const/16 v1, 0x1770

    invoke-virtual {v0, v1}, Ljava/util/Random;->nextInt(I)I

    move-result v0

    int-to-long v0, v0

    const-wide/16 v2, 0x3e8

    mul-long/2addr v0, v2

    return-wide v0
.end method

.method public static getAndShowAreYouSurePopUp(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Landroid/app/Activity;Landroid/content/DialogInterface$OnClickListener;Landroid/content/DialogInterface$OnClickListener;)Landroidx/appcompat/app/AlertDialog;
    .locals 3

    invoke-virtual {p3}, Landroid/app/Activity;->getLayoutInflater()Landroid/view/LayoutInflater;

    move-result-object p3

    const v0, 0x7f0c0052

    const/4 v1, 0x0

    invoke-virtual {p3, v0, v1}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    move-result-object p3

    const v0, 0x7f090128

    invoke-virtual {p3, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    const v1, 0x7f090127

    invoke-virtual {p3, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/CheckBox;

    const/16 v2, 0x8

    invoke-virtual {v1, v2}, Landroid/widget/CheckBox;->setVisibility(I)V

    invoke-virtual {v0, p2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    new-instance p2, Landroidx/appcompat/app/AlertDialog$Builder;

    invoke-direct {p2, p0}, Landroidx/appcompat/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    invoke-virtual {p2, p3}, Landroidx/appcompat/app/AlertDialog$Builder;->setView(Landroid/view/View;)Landroidx/appcompat/app/AlertDialog$Builder;

    const v0, 0x7f090129

    invoke-virtual {p3, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    invoke-virtual {v0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    const/4 p1, 0x1

    invoke-virtual {p2, p1}, Landroidx/appcompat/app/AlertDialog$Builder;->setCancelable(Z)Landroidx/appcompat/app/AlertDialog$Builder;

    const p1, 0x7f090126

    invoke-virtual {p3, p1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p1

    check-cast p1, Landroid/widget/Button;

    invoke-virtual {p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    const v1, 0x7f0e011b

    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1, v0}, Landroid/widget/Button;->setText(Ljava/lang/CharSequence;)V

    const v0, 0x7f090125

    invoke-virtual {p3, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p3

    check-cast p3, Landroid/widget/Button;

    invoke-virtual {p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    const v1, 0x7f0e01cd

    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p3, v0}, Landroid/widget/Button;->setText(Ljava/lang/CharSequence;)V

    invoke-virtual {p2}, Landroidx/appcompat/app/AlertDialog$Builder;->create()Landroidx/appcompat/app/AlertDialog;

    move-result-object p2

    new-instance v0, Lcom/motorola/ccc/ota/utils/SmartUpdateUtils$$ExternalSyntheticLambda4;

    invoke-direct {v0, p4, p2}, Lcom/motorola/ccc/ota/utils/SmartUpdateUtils$$ExternalSyntheticLambda4;-><init>(Landroid/content/DialogInterface$OnClickListener;Landroidx/appcompat/app/AlertDialog;)V

    invoke-virtual {p1, v0}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    new-instance p1, Lcom/motorola/ccc/ota/utils/SmartUpdateUtils$$ExternalSyntheticLambda5;

    invoke-direct {p1, p5, p2}, Lcom/motorola/ccc/ota/utils/SmartUpdateUtils$$ExternalSyntheticLambda5;-><init>(Landroid/content/DialogInterface$OnClickListener;Landroidx/appcompat/app/AlertDialog;)V

    invoke-virtual {p3, p1}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    invoke-static {p0, p2}, Lcom/motorola/ccc/ota/ui/UpdaterUtils;->setCornersRounded(Landroid/content/Context;Landroidx/appcompat/app/AlertDialog;)V

    invoke-virtual {p2}, Landroidx/appcompat/app/AlertDialog;->show()V

    return-object p2
.end method

.method private static getDefaultSmartUpdateFlag(Lcom/motorola/ccc/ota/utils/SmartUpdateUtils$SmartUpdateBitmap;)Z
    .locals 3

    new-instance v0, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    invoke-direct {v0}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;-><init>()V

    sget-object v1, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->DEFAULT_SMART_UPDATE_BITMAP:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    const/4 v2, 0x7

    invoke-virtual {v0, v1, v2}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->getInt(Lcom/motorola/otalib/common/settings/ISetting;I)I

    move-result v0

    invoke-virtual {p0}, Lcom/motorola/ccc/ota/utils/SmartUpdateUtils$SmartUpdateBitmap;->ordinal()I

    move-result p0

    invoke-static {v0, p0}, Lcom/motorola/ccc/ota/ui/UpdaterUtils;->isBitMapSet(II)Z

    move-result p0

    return p0
.end method

.method public static getDefaultTextForTimeSlot(Landroid/content/Context;I)Ljava/lang/String;
    .locals 3

    const v0, 0x7f090139

    const/4 v1, 0x3

    const/4 v2, 0x0

    if-ne p1, v0, :cond_0

    const/4 p1, 0x1

    invoke-static {p0, p1, v2, v1, v2}, Lcom/motorola/ccc/ota/utils/DateFormatUtils;->generateTimeSlotContent(Landroid/content/Context;IIII)Ljava/lang/String;

    move-result-object p0

    return-object p0

    :cond_0
    const v0, 0x7f09013a

    if-ne p1, v0, :cond_1

    const/4 p1, 0x2

    const/4 v0, 0x4

    invoke-static {p0, p1, v2, v0, v2}, Lcom/motorola/ccc/ota/utils/DateFormatUtils;->generateTimeSlotContent(Landroid/content/Context;IIII)Ljava/lang/String;

    move-result-object p0

    return-object p0

    :cond_1
    const v0, 0x7f09013b

    if-ne p1, v0, :cond_2

    const/4 p1, 0x5

    invoke-static {p0, v1, v2, p1, v2}, Lcom/motorola/ccc/ota/utils/DateFormatUtils;->generateTimeSlotContent(Landroid/content/Context;IIII)Ljava/lang/String;

    move-result-object p0

    return-object p0

    :cond_2
    const/16 p1, 0x11

    const/16 v0, 0x13

    const/16 v1, 0x1e

    invoke-static {p0, p1, v1, v0, v1}, Lcom/motorola/ccc/ota/utils/DateFormatUtils;->generateTimeSlotContent(Landroid/content/Context;IIII)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method private static getDownloadOrInstallNotifiedTime(Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;)J
    .locals 3

    invoke-static {}, Lcom/motorola/ccc/ota/utils/BuildPropReader;->isUEUpdateEnabled()Z

    move-result v0

    if-eqz v0, :cond_0

    sget-object v0, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->STATS_INSTALL_COMPLETED:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v1

    invoke-virtual {p0, v0, v1, v2}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->getLong(Lcom/motorola/otalib/common/settings/ISetting;J)J

    move-result-wide v0

    return-wide v0

    :cond_0
    sget-object v0, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->STATS_INSTALL_NOTIFIED:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v1

    invoke-virtual {p0, v0, v1, v2}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->getLong(Lcom/motorola/otalib/common/settings/ISetting;J)J

    move-result-wide v0

    return-wide v0
.end method

.method public static getMappedTimeSlotForPrefs(I)Ljava/lang/String;
    .locals 3

    const v0, 0x7f090139

    const/4 v1, 0x3

    const/4 v2, 0x0

    if-ne p0, v0, :cond_0

    const/4 p0, 0x1

    invoke-static {p0, v2, v1, v2}, Lcom/motorola/ccc/ota/utils/SmartUpdateUtils;->getMappedTimeSlotForPrefs(IIII)Ljava/lang/String;

    move-result-object p0

    return-object p0

    :cond_0
    const v0, 0x7f09013a

    if-ne p0, v0, :cond_1

    const/4 p0, 0x2

    const/4 v0, 0x4

    invoke-static {p0, v2, v0, v2}, Lcom/motorola/ccc/ota/utils/SmartUpdateUtils;->getMappedTimeSlotForPrefs(IIII)Ljava/lang/String;

    move-result-object p0

    return-object p0

    :cond_1
    const v0, 0x7f09013b

    if-ne p0, v0, :cond_2

    const/4 p0, 0x5

    invoke-static {v1, v2, p0, v2}, Lcom/motorola/ccc/ota/utils/SmartUpdateUtils;->getMappedTimeSlotForPrefs(IIII)Ljava/lang/String;

    move-result-object p0

    return-object p0

    :cond_2
    const/4 p0, 0x0

    return-object p0
.end method

.method public static getMappedTimeSlotForPrefs(IIII)Ljava/lang/String;
    .locals 0

    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p0

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p1

    invoke-static {p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p2

    invoke-static {p3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p3

    filled-new-array {p0, p1, p2, p3}, [Ljava/lang/Object;

    move-result-object p0

    const-string p1, "%02d:%02d:%02d:%02d"

    invoke-static {p1, p0}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method public static getOverriddenSmartUpdateBitMap()I
    .locals 3

    invoke-static {}, Lcom/motorola/ccc/ota/utils/SmartUpdateUtils;->isShowDNDForPopUpEnabledByServer()Z

    move-result v0

    invoke-static {v0}, Lcom/motorola/ccc/ota/utils/SmartUpdateUtils;->getValueFromBoolean(Z)I

    move-result v0

    shl-int/lit8 v0, v0, 0x1

    invoke-static {}, Lcom/motorola/ccc/ota/utils/SmartUpdateUtils;->isShowAdvancedSettingValueEnabledByServer()Z

    move-result v1

    invoke-static {v1}, Lcom/motorola/ccc/ota/utils/SmartUpdateUtils;->getValueFromBoolean(Z)I

    move-result v1

    add-int/2addr v0, v1

    shl-int/lit8 v0, v0, 0x1

    invoke-static {}, Lcom/motorola/ccc/ota/utils/SmartUpdateUtils;->isForcedMRUpdateEnabledByServer()Z

    move-result v1

    invoke-static {v1}, Lcom/motorola/ccc/ota/utils/SmartUpdateUtils;->getValueFromBoolean(Z)I

    move-result v1

    add-int/2addr v0, v1

    shl-int/lit8 v0, v0, 0x1

    invoke-static {}, Lcom/motorola/ccc/ota/utils/SmartUpdateUtils;->isSmartUpdateEnabledByServer()Z

    move-result v1

    invoke-static {v1}, Lcom/motorola/ccc/ota/utils/SmartUpdateUtils;->getValueFromBoolean(Z)I

    move-result v1

    add-int/2addr v0, v1

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "SmartUpdateUtils.getOverriddenSmartUpdateBitMap = "

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    const-string v2, "OtaApp"

    invoke-static {v2, v1}, Lcom/motorola/ccc/ota/utils/Logger;->debug(Ljava/lang/String;Ljava/lang/String;)V

    return v0
.end method

.method public static getTimerValue(Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;Lcom/motorola/ccc/ota/ui/UpdaterUtils$UpgradeInfo;)I
    .locals 2

    sget-object v0, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->DEFAULT_INSTALL_COUNT_DOWN_SECS:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    const/16 v1, 0x3d

    invoke-virtual {p0, v0, v1}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->getInt(Lcom/motorola/otalib/common/settings/ISetting;I)I

    move-result v0

    invoke-virtual {p1}, Lcom/motorola/ccc/ota/ui/UpdaterUtils$UpgradeInfo;->getUpdateTypeData()Ljava/lang/String;

    move-result-object p1

    invoke-static {p0, p1}, Lcom/motorola/ccc/ota/utils/SmartUpdateUtils;->isSmartUpdateNearestToInstall(Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;Ljava/lang/String;)Z

    move-result p0

    if-eqz p0, :cond_0

    const/16 v0, 0xb5

    :cond_0
    return v0
.end method

.method public static getValueFromBoolean(Z)I
    .locals 0

    if-eqz p0, :cond_0

    const/4 p0, 0x1

    return p0

    :cond_0
    const/4 p0, 0x0

    return p0
.end method

.method public static isDownloadForcedForSmartUpdate(Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;)Z
    .locals 5

    sget-object v0, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->METADATA:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    invoke-virtual {p0, v0}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->getString(Lcom/motorola/otalib/common/settings/ISetting;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/motorola/ccc/ota/ui/UpdaterUtils;->getUpdateType(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-static {v0}, Lcom/motorola/otalib/common/metaData/builder/MetaDataBuilder;->from(Ljava/lang/String;)Lcom/motorola/otalib/common/metaData/MetaData;

    move-result-object v0

    sget-object v2, Lcom/motorola/otalib/common/metaData/CheckForUpgradeTriggeredBy;->user:Lcom/motorola/otalib/common/metaData/CheckForUpgradeTriggeredBy;

    invoke-virtual {v2}, Lcom/motorola/otalib/common/metaData/CheckForUpgradeTriggeredBy;->name()Ljava/lang/String;

    move-result-object v2

    sget-object v3, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->TRIGGERED_BY:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    invoke-virtual {p0, v3}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->getString(Lcom/motorola/otalib/common/settings/ISetting;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    const/4 v3, 0x0

    const/4 v4, 0x1

    if-nez v2, :cond_1

    if-eqz v0, :cond_0

    sget-object v2, Lcom/motorola/otalib/common/metaData/CheckForUpgradeTriggeredBy;->user:Lcom/motorola/otalib/common/metaData/CheckForUpgradeTriggeredBy;

    invoke-virtual {v2}, Lcom/motorola/otalib/common/metaData/CheckForUpgradeTriggeredBy;->name()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0}, Lcom/motorola/otalib/common/metaData/MetaData;->getUpdateReqTriggeredBy()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v2, v0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_0

    goto :goto_0

    :cond_0
    move v0, v3

    goto :goto_1

    :cond_1
    :goto_0
    move v0, v4

    :goto_1
    invoke-static {p0, v1}, Lcom/motorola/ccc/ota/utils/SmartUpdateUtils;->shouldIForceSmartUpdate(Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;Ljava/lang/String;)Z

    move-result p0

    if-eqz p0, :cond_2

    if-nez v0, :cond_2

    move v3, v4

    :cond_2
    return v3
.end method

.method public static isForcedMRUpdateEnabledByServer()Z
    .locals 3

    new-instance v0, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    invoke-direct {v0}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;-><init>()V

    sget-object v1, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->SMART_UPDATE_MR_FORCED_BY_SERVER:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    sget-object v2, Lcom/motorola/ccc/ota/utils/SmartUpdateUtils$SmartUpdateBitmap;->forceMRUpdate:Lcom/motorola/ccc/ota/utils/SmartUpdateUtils$SmartUpdateBitmap;

    invoke-static {v2}, Lcom/motorola/ccc/ota/utils/SmartUpdateUtils;->getDefaultSmartUpdateFlag(Lcom/motorola/ccc/ota/utils/SmartUpdateUtils$SmartUpdateBitmap;)Z

    move-result v2

    invoke-virtual {v0, v1, v2}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->getBoolean(Lcom/motorola/otalib/common/settings/ISetting;Z)Z

    move-result v0

    return v0
.end method

.method public static isMotoSettingsGlobalEnterpriseEditionFlagSet()Z
    .locals 2

    invoke-static {}, Lcom/motorola/ccc/ota/env/OtaApplication;->getGlobalContext()Landroid/content/Context;

    move-result-object v0

    const-string v1, "enterprise_edition"

    invoke-static {v0, v1}, Lcom/motorola/ccc/ota/utils/BuildPropReader;->getMotoSettingValueAsString(Landroid/content/Context;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    const-string v1, "1"

    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    const-string v0, "OtaApp"

    const-string v1, "isMotoSettingsGlobalEnterpriseEditionFlagSet:EnterpriseFlag is set:return true"

    invoke-static {v0, v1}, Lcom/motorola/ccc/ota/utils/Logger;->debug(Ljava/lang/String;Ljava/lang/String;)V

    const/4 v0, 0x1

    return v0

    :cond_0
    const/4 v0, 0x0

    return v0
.end method

.method public static isShowAdvancedSettingValueEnabledByServer()Z
    .locals 3

    new-instance v0, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    invoke-direct {v0}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;-><init>()V

    sget-object v1, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->SMART_UPDATE_ADV_OPT_BY_SERVER:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    sget-object v2, Lcom/motorola/ccc/ota/utils/SmartUpdateUtils$SmartUpdateBitmap;->showAdvancedSetting:Lcom/motorola/ccc/ota/utils/SmartUpdateUtils$SmartUpdateBitmap;

    invoke-static {v2}, Lcom/motorola/ccc/ota/utils/SmartUpdateUtils;->getDefaultSmartUpdateFlag(Lcom/motorola/ccc/ota/utils/SmartUpdateUtils$SmartUpdateBitmap;)Z

    move-result v2

    invoke-virtual {v0, v1, v2}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->getBoolean(Lcom/motorola/otalib/common/settings/ISetting;Z)Z

    move-result v0

    return v0
.end method

.method public static isShowDNDForPopUpEnabledByServer()Z
    .locals 3

    new-instance v0, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    invoke-direct {v0}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;-><init>()V

    sget-object v1, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->SMART_UPDATE_SHOW_DND_POPUP_BY_SERVER:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    sget-object v2, Lcom/motorola/ccc/ota/utils/SmartUpdateUtils$SmartUpdateBitmap;->showDNDForPopUp:Lcom/motorola/ccc/ota/utils/SmartUpdateUtils$SmartUpdateBitmap;

    invoke-static {v2}, Lcom/motorola/ccc/ota/utils/SmartUpdateUtils;->getDefaultSmartUpdateFlag(Lcom/motorola/ccc/ota/utils/SmartUpdateUtils$SmartUpdateBitmap;)Z

    move-result v2

    invoke-virtual {v0, v1, v2}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->getBoolean(Lcom/motorola/otalib/common/settings/ISetting;Z)Z

    move-result v0

    return v0
.end method

.method public static isSmartUpdateEnabledByServer()Z
    .locals 3

    new-instance v0, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    invoke-direct {v0}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;-><init>()V

    invoke-static {}, Lcom/motorola/ccc/ota/utils/BuildPropReader;->isATT()Z

    move-result v1

    if-nez v1, :cond_1

    invoke-static {}, Lcom/motorola/ccc/ota/utils/SmartUpdateUtils;->canSmartUpdateBlockForSystemUpdatePolicy()Z

    move-result v1

    if-eqz v1, :cond_0

    goto :goto_0

    :cond_0
    sget-object v1, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->SMART_UPDATE_ENABLE_BY_SERVER:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    sget-object v2, Lcom/motorola/ccc/ota/utils/SmartUpdateUtils$SmartUpdateBitmap;->superSmartUpdateControlFlag:Lcom/motorola/ccc/ota/utils/SmartUpdateUtils$SmartUpdateBitmap;

    invoke-static {v2}, Lcom/motorola/ccc/ota/utils/SmartUpdateUtils;->getDefaultSmartUpdateFlag(Lcom/motorola/ccc/ota/utils/SmartUpdateUtils$SmartUpdateBitmap;)Z

    move-result v2

    invoke-virtual {v0, v1, v2}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->getBoolean(Lcom/motorola/otalib/common/settings/ISetting;Z)Z

    move-result v0

    return v0

    :cond_1
    :goto_0
    const-string v0, "OtaApp"

    const-string v1, "isSmartUpdateEnabledByServer: smart update feature is disabled for Fota/Softbank/Sys Policy"

    invoke-static {v0, v1}, Lcom/motorola/ccc/ota/utils/Logger;->debug(Ljava/lang/String;Ljava/lang/String;)V

    const/4 v0, 0x0

    return v0
.end method

.method public static isSmartUpdateEnabledByUser(Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;)Z
    .locals 1

    sget-object v0, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->SMART_UPDATE_ENABLE_BY_USER:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    invoke-virtual {p0, v0}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->getBoolean(Lcom/motorola/otalib/common/settings/ISetting;)Z

    move-result p0

    return p0
.end method

.method public static isSmartUpdateForcedByUpdateType(Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;Ljava/lang/String;)Z
    .locals 3

    sget-object v0, Lcom/motorola/ccc/ota/ui/updateType/UpdateType$DIFFUpdateType;->SMR:Lcom/motorola/ccc/ota/ui/updateType/UpdateType$DIFFUpdateType;

    invoke-virtual {v0}, Lcom/motorola/ccc/ota/ui/updateType/UpdateType$DIFFUpdateType;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    const/4 v1, 0x1

    const-string v2, "OtaApp"

    if-eqz v0, :cond_0

    const-string p0, "isSmartUpdateForcedByUpdateType:SMR update"

    invoke-static {v2, p0}, Lcom/motorola/ccc/ota/utils/Logger;->debug(Ljava/lang/String;Ljava/lang/String;)V

    return v1

    :cond_0
    sget-object v0, Lcom/motorola/ccc/ota/ui/updateType/UpdateType$DIFFUpdateType;->MR:Lcom/motorola/ccc/ota/ui/updateType/UpdateType$DIFFUpdateType;

    invoke-virtual {v0}, Lcom/motorola/ccc/ota/ui/updateType/UpdateType$DIFFUpdateType;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_2

    invoke-static {}, Lcom/motorola/ccc/ota/utils/SmartUpdateUtils;->isForcedMRUpdateEnabledByServer()Z

    move-result v0

    if-eqz v0, :cond_1

    const-string p0, "isSmartUpdateForcedByUpdateType:Forced MR update"

    invoke-static {v2, p0}, Lcom/motorola/ccc/ota/utils/Logger;->debug(Ljava/lang/String;Ljava/lang/String;)V

    return v1

    :cond_1
    invoke-static {}, Lcom/motorola/ccc/ota/utils/SmartUpdateUtils;->isShowAdvancedSettingValueEnabledByServer()Z

    move-result v0

    if-eqz v0, :cond_2

    new-instance p1, Ljava/lang/StringBuilder;

    const-string v0, "isSmartUpdateForcedByUpdateType:User enabled MR update "

    invoke-direct {p1, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    sget-object v0, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->SMART_UPDATE_MR_ENABLE_BY_USER:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    invoke-virtual {p0, v0}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->getBoolean(Lcom/motorola/otalib/common/settings/ISetting;)Z

    move-result v0

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {v2, p1}, Lcom/motorola/ccc/ota/utils/Logger;->debug(Ljava/lang/String;Ljava/lang/String;)V

    sget-object p1, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->SMART_UPDATE_MR_ENABLE_BY_USER:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    invoke-virtual {p0, p1}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->getBoolean(Lcom/motorola/otalib/common/settings/ISetting;)Z

    move-result p0

    return p0

    :cond_2
    sget-object v0, Lcom/motorola/ccc/ota/ui/updateType/UpdateType$DIFFUpdateType;->OS:Lcom/motorola/ccc/ota/ui/updateType/UpdateType$DIFFUpdateType;

    invoke-virtual {v0}, Lcom/motorola/ccc/ota/ui/updateType/UpdateType$DIFFUpdateType;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_3

    invoke-static {}, Lcom/motorola/ccc/ota/utils/SmartUpdateUtils;->isForcedMRUpdateEnabledByServer()Z

    move-result p1

    if-eqz p1, :cond_3

    invoke-static {}, Lcom/motorola/ccc/ota/utils/SmartUpdateUtils;->isShowAdvancedSettingValueEnabledByServer()Z

    move-result p1

    if-eqz p1, :cond_3

    new-instance p1, Ljava/lang/StringBuilder;

    const-string v0, "isSmartUpdateForcedByUpdateType: User enabled OS update "

    invoke-direct {p1, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    sget-object v0, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->SMART_UPDATE_OS_ENABLE_BY_USER:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    invoke-virtual {p0, v0}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->getBoolean(Lcom/motorola/otalib/common/settings/ISetting;)Z

    move-result v0

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {v2, p1}, Lcom/motorola/ccc/ota/utils/Logger;->debug(Ljava/lang/String;Ljava/lang/String;)V

    sget-object p1, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->SMART_UPDATE_OS_ENABLE_BY_USER:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    invoke-virtual {p0, p1}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->getBoolean(Lcom/motorola/otalib/common/settings/ISetting;)Z

    move-result p0

    return p0

    :cond_3
    const-string p0, "isSmartUpdateForcedByUpdateType: return false"

    invoke-static {v2, p0}, Lcom/motorola/ccc/ota/utils/Logger;->debug(Ljava/lang/String;Ljava/lang/String;)V

    const/4 p0, 0x0

    return p0
.end method

.method public static isSmartUpdateNearestToInstall(Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;Ljava/lang/String;)Z
    .locals 10

    invoke-static {}, Lcom/motorola/ccc/ota/utils/SmartUpdateUtils;->isSmartUpdateEnabledByServer()Z

    move-result v0

    const/4 v1, 0x0

    if-eqz v0, :cond_4

    invoke-static {p0}, Lcom/motorola/ccc/ota/utils/SmartUpdateUtils;->isSmartUpdateEnabledByUser(Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;)Z

    move-result v0

    if-eqz v0, :cond_4

    invoke-static {p0, p1}, Lcom/motorola/ccc/ota/utils/SmartUpdateUtils;->isSmartUpdateForcedByUpdateType(Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;Ljava/lang/String;)Z

    move-result p1

    if-eqz p1, :cond_4

    invoke-static {p0}, Lcom/motorola/ccc/ota/utils/SmartUpdateUtils;->smartUpdateReachedMaxDeferTime(Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;)Z

    move-result p1

    if-eqz p1, :cond_0

    goto :goto_0

    :cond_0
    sget-object p1, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->MAX_CRITICAL_UPDATE_DEFER_TIME:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    const-wide/16 v2, -0x1

    invoke-virtual {p0, p1, v2, v3}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->getLong(Lcom/motorola/otalib/common/settings/ISetting;J)J

    move-result-wide v4

    sget-object p1, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->MAX_CRITICAL_UPDATE_EXTENDED_TIME:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    invoke-virtual {p0, p1, v2, v3}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->getLong(Lcom/motorola/otalib/common/settings/ISetting;J)J

    move-result-wide v6

    sget-object p1, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->SMART_UPDATE_MIN_INSTALL_TIME:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    invoke-virtual {p0, p1, v2, v3}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->getLong(Lcom/motorola/otalib/common/settings/ISetting;J)J

    move-result-wide v8

    sget-object p1, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->MAX_FORCE_INSTALL_DEFER_TIME:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    invoke-virtual {p0, p1, v2, v3}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->getLong(Lcom/motorola/otalib/common/settings/ISetting;J)J

    move-result-wide p0

    cmp-long v0, v4, v2

    if-lez v0, :cond_1

    cmp-long v0, v4, v8

    if-gez v0, :cond_1

    return v1

    :cond_1
    cmp-long v0, v6, v2

    if-lez v0, :cond_2

    cmp-long v0, v6, v8

    if-gez v0, :cond_2

    return v1

    :cond_2
    cmp-long v0, p0, v2

    if-lez v0, :cond_3

    cmp-long p0, p0, v8

    if-gez p0, :cond_3

    return v1

    :cond_3
    const/4 p0, 0x1

    return p0

    :cond_4
    :goto_0
    return v1
.end method

.method public static isSmartUpdateTimerExpired(Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;Lcom/motorola/ccc/ota/ui/UpdaterUtils$UpgradeInfo;)Z
    .locals 6

    invoke-virtual {p1}, Lcom/motorola/ccc/ota/ui/UpdaterUtils$UpgradeInfo;->getUpdateTypeData()Ljava/lang/String;

    move-result-object p1

    invoke-static {p0, p1}, Lcom/motorola/ccc/ota/utils/SmartUpdateUtils;->isSmartUpdateNearestToInstall(Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;Ljava/lang/String;)Z

    move-result p1

    if-eqz p1, :cond_0

    sget-object p1, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->SMART_UPDATE_MIN_INSTALL_TIME:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    const-wide/16 v0, -0x1

    invoke-virtual {p0, p1, v0, v1}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->getLong(Lcom/motorola/otalib/common/settings/ISetting;J)J

    move-result-wide v2

    const-wide/16 v4, 0x0

    cmp-long p1, v2, v4

    if-lez p1, :cond_0

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v2

    sget-object p1, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->SMART_UPDATE_MIN_INSTALL_TIME:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    invoke-virtual {p0, p1, v0, v1}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->getLong(Lcom/motorola/otalib/common/settings/ISetting;J)J

    move-result-wide p0

    cmp-long p0, v2, p0

    if-ltz p0, :cond_0

    const/4 p0, 0x1

    goto :goto_0

    :cond_0
    const/4 p0, 0x0

    :goto_0
    return p0
.end method

.method static synthetic lambda$getAndShowAreYouSurePopUp$4(Landroid/content/DialogInterface$OnClickListener;Landroidx/appcompat/app/AlertDialog;Landroid/view/View;)V
    .locals 0

    if-eqz p0, :cond_0

    const/4 p2, -0x1

    invoke-interface {p0, p1, p2}, Landroid/content/DialogInterface$OnClickListener;->onClick(Landroid/content/DialogInterface;I)V

    :cond_0
    return-void
.end method

.method static synthetic lambda$getAndShowAreYouSurePopUp$5(Landroid/content/DialogInterface$OnClickListener;Landroidx/appcompat/app/AlertDialog;Landroid/view/View;)V
    .locals 0

    if-eqz p0, :cond_0

    const/4 p2, -0x2

    invoke-interface {p0, p1, p2}, Landroid/content/DialogInterface$OnClickListener;->onClick(Landroid/content/DialogInterface;I)V

    :cond_0
    return-void
.end method

.method static synthetic lambda$showTrySmartUpdatePopUp$0(Landroid/widget/CheckBox;Landroid/content/Context;ILcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;Landroid/widget/CompoundButton;Z)V
    .locals 0

    if-eqz p5, :cond_0

    invoke-static {p1, p2}, Landroidx/core/content/ContextCompat;->getColorStateList(Landroid/content/Context;I)Landroid/content/res/ColorStateList;

    move-result-object p1

    invoke-virtual {p0, p1}, Landroid/widget/CheckBox;->setButtonTintList(Landroid/content/res/ColorStateList;)V

    goto :goto_0

    :cond_0
    const p2, 0x7f06003b

    invoke-static {p1, p2}, Landroidx/core/content/ContextCompat;->getColorStateList(Landroid/content/Context;I)Landroid/content/res/ColorStateList;

    move-result-object p1

    invoke-virtual {p0, p1}, Landroid/widget/CheckBox;->setButtonTintList(Landroid/content/res/ColorStateList;)V

    :goto_0
    sget-object p0, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->SMART_UPDATE_POP_UP_DISABLE:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    invoke-virtual {p3, p0, p5}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->setBoolean(Lcom/motorola/otalib/common/settings/ISetting;Z)V

    return-void
.end method

.method static synthetic lambda$showTrySmartUpdatePopUp$1(Landroid/app/Activity;Landroid/content/Context;Landroid/content/DialogInterface;ILandroid/view/KeyEvent;)Z
    .locals 3

    const/4 p4, 0x4

    const/4 v0, 0x0

    if-ne p3, p4, :cond_1

    sget-wide p3, Lcom/motorola/ccc/ota/utils/SmartUpdateUtils;->mDoubleBackToExitPressedOnce:J

    const-wide/16 v1, 0x64

    add-long/2addr p3, v1

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v1

    cmp-long p3, p3, v1

    if-gez p3, :cond_0

    sget-wide p3, Lcom/motorola/ccc/ota/utils/SmartUpdateUtils;->mDoubleBackToExitPressedOnce:J

    const-wide/16 v1, 0x1388

    add-long/2addr p3, v1

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v1

    cmp-long p3, p3, v1

    if-lez p3, :cond_0

    invoke-interface {p2}, Landroid/content/DialogInterface;->cancel()V

    invoke-virtual {p0}, Landroid/app/Activity;->finish()V

    goto :goto_0

    :cond_0
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide p2

    sput-wide p2, Lcom/motorola/ccc/ota/utils/SmartUpdateUtils;->mDoubleBackToExitPressedOnce:J

    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object p0

    const p2, 0x7f0e0147

    invoke-virtual {p0, p2}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object p0

    invoke-static {p1, p0, v0}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object p0

    invoke-virtual {p0}, Landroid/widget/Toast;->show()V

    :cond_1
    :goto_0
    return v0
.end method

.method static synthetic lambda$showTrySmartUpdatePopUp$2(Landroid/app/Activity;Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;Landroid/content/Context;Ljava/lang/String;Landroidx/appcompat/app/AlertDialog;Landroid/view/View;)V
    .locals 0

    invoke-virtual {p0}, Landroid/app/Activity;->finish()V

    sget-object p5, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->STATS_SMART_UPDATE_POP_UP_GET_STARTED:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    invoke-virtual {p1, p5}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->incrementPrefs(Lcom/motorola/otalib/common/settings/ISetting;)V

    invoke-virtual {p0}, Landroid/app/Activity;->getIntent()Landroid/content/Intent;

    move-result-object p0

    new-instance p1, Landroid/content/Intent;

    invoke-virtual {p0}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object p5

    invoke-direct {p1, p5}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    const-class p5, Lcom/motorola/ccc/ota/ui/BaseActivity;

    invoke-virtual {p1, p2, p5}, Landroid/content/Intent;->setClass(Landroid/content/Context;Ljava/lang/Class;)Landroid/content/Intent;

    const-string p5, "com.motorola.blur.service.blur.upgrade.location_type"

    invoke-virtual {p0, p5}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    invoke-virtual {p1, p5, p0}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    const-string p0, "com.motorola.blur.service.blur.update.launch_mode"

    invoke-virtual {p1, p0, p3}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    sget-object p0, Lcom/motorola/ccc/ota/utils/UpgradeUtilConstants$FragmentTypeEnum;->SMART_UPDATE_FRAGMENT:Lcom/motorola/ccc/ota/utils/UpgradeUtilConstants$FragmentTypeEnum;

    invoke-virtual {p0}, Lcom/motorola/ccc/ota/utils/UpgradeUtilConstants$FragmentTypeEnum;->toString()Ljava/lang/String;

    move-result-object p0

    const-string p3, "fragment_type"

    invoke-virtual {p1, p3, p0}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    invoke-virtual {p2, p1}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    invoke-virtual {p4}, Landroidx/appcompat/app/AlertDialog;->dismiss()V

    return-void
.end method

.method static synthetic lambda$showTrySmartUpdatePopUp$3(Landroidx/appcompat/app/AlertDialog;Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;Landroid/app/Activity;Landroid/view/View;)V
    .locals 0

    invoke-virtual {p0}, Landroidx/appcompat/app/AlertDialog;->dismiss()V

    sget-object p0, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->STATS_SMART_UPDATE_POP_UP_NOT_NOW:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    invoke-virtual {p1, p0}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->incrementPrefs(Lcom/motorola/otalib/common/settings/ISetting;)V

    invoke-virtual {p2}, Landroid/app/Activity;->finish()V

    return-void
.end method

.method public static launchUpdatePreferences(Landroid/content/Intent;Landroidx/fragment/app/FragmentManager;Z)V
    .locals 2

    new-instance v0, Landroid/os/Bundle;

    invoke-direct {v0}, Landroid/os/Bundle;-><init>()V

    const-string v1, "activityIntent"

    invoke-virtual {v0, v1, p0}, Landroid/os/Bundle;->putParcelable(Ljava/lang/String;Landroid/os/Parcelable;)V

    new-instance p0, Lcom/motorola/ccc/ota/ui/UpdatePreferenceFragment;

    invoke-direct {p0}, Lcom/motorola/ccc/ota/ui/UpdatePreferenceFragment;-><init>()V

    invoke-virtual {p0, v0}, Lcom/motorola/ccc/ota/ui/UpdatePreferenceFragment;->setArguments(Landroid/os/Bundle;)V

    if-eqz p2, :cond_0

    const-string p2, "updatePreferenceFragment"

    invoke-virtual {p0, p1, p2}, Lcom/motorola/ccc/ota/ui/UpdatePreferenceFragment;->show(Landroidx/fragment/app/FragmentManager;Ljava/lang/String;)V

    :cond_0
    return-void
.end method

.method public static parseTimeslot(Ljava/lang/String;)Ljava/util/List;
    .locals 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            ")",
            "Ljava/util/List<",
            "Landroid/icu/util/Calendar;",
            ">;"
        }
    .end annotation

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    if-eqz p0, :cond_0

    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v1

    if-lez v1, :cond_0

    const-string v1, ":"

    invoke-virtual {p0, v1}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object p0

    array-length v1, p0

    const/4 v2, 0x4

    if-ne v1, v2, :cond_0

    invoke-static {}, Landroid/icu/util/Calendar;->getInstance()Landroid/icu/util/Calendar;

    move-result-object v1

    const/4 v2, 0x0

    aget-object v2, p0, v2

    invoke-static {v2}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v2

    const/16 v3, 0xb

    invoke-virtual {v1, v3, v2}, Landroid/icu/util/Calendar;->set(II)V

    const/4 v2, 0x1

    aget-object v2, p0, v2

    invoke-static {v2}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v2

    const/16 v4, 0xc

    invoke-virtual {v1, v4, v2}, Landroid/icu/util/Calendar;->set(II)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    invoke-static {}, Landroid/icu/util/Calendar;->getInstance()Landroid/icu/util/Calendar;

    move-result-object v1

    const/4 v2, 0x2

    aget-object v2, p0, v2

    invoke-static {v2}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v2

    invoke-virtual {v1, v3, v2}, Landroid/icu/util/Calendar;->set(II)V

    const/4 v2, 0x3

    aget-object p0, p0, v2

    invoke-static {p0}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result p0

    invoke-virtual {v1, v4, p0}, Landroid/icu/util/Calendar;->set(II)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    :cond_0
    return-object v0
.end method

.method public static postponeSmartUpdateROR(Landroid/content/Context;Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;)Z
    .locals 1

    const-string v0, "connectivity"

    invoke-virtual {p0, v0}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Landroid/net/ConnectivityManager;

    invoke-static {}, Lcom/motorola/ccc/ota/ui/UpdaterUtils;->isPreparedForUnattendedUpdate()Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-static {p0}, Lcom/motorola/otalib/common/utils/NetworkUtils;->isNetWorkConnected(Landroid/net/ConnectivityManager;)Z

    move-result p0

    if-nez p0, :cond_0

    invoke-static {p1}, Lcom/motorola/ccc/ota/utils/SmartUpdateUtils;->smartUpdateReachedMaxDeferTimeRORNoNetwork(Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;)Z

    move-result p0

    if-nez p0, :cond_0

    const-string p0, "OtaApp"

    const-string p1, "Device is prepared for update but no network available, postponing smart update to next day"

    invoke-static {p0, p1}, Lcom/motorola/ccc/ota/utils/Logger;->debug(Ljava/lang/String;Ljava/lang/String;)V

    const/4 p0, 0x1

    return p0

    :cond_0
    const/4 p0, 0x0

    return p0
.end method

.method public static resetSmartUpdatePrefs(Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;)V
    .locals 2

    const-string v0, "OtaApp"

    const-string v1, "Reset SmartUpdate Prefs"

    invoke-static {v0, v1}, Lcom/motorola/ccc/ota/utils/Logger;->debug(Ljava/lang/String;Ljava/lang/String;)V

    sget-object v0, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->SMART_UPDATE_MAX_INSTALL_TIME:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    invoke-virtual {p0, v0}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->removeConfig(Lcom/motorola/otalib/common/settings/ISetting;)V

    sget-object v0, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->SMART_UPDATE_MIN_INSTALL_TIME:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    invoke-virtual {p0, v0}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->removeConfig(Lcom/motorola/otalib/common/settings/ISetting;)V

    sget-object v0, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->SMART_UPDATE_TIME_SLOT:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    const-string v1, ""

    invoke-virtual {p0, v0, v1}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->setString(Lcom/motorola/otalib/common/settings/ISetting;Ljava/lang/String;)V

    sget-object v0, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->SMART_UPDATE_ENABLE_BY_USER:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    const/4 v1, 0x0

    invoke-virtual {p0, v0, v1}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->setBoolean(Lcom/motorola/otalib/common/settings/ISetting;Z)V

    sget-object v0, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->SMART_UPDATE_MR_ENABLE_BY_USER:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    invoke-virtual {p0, v0, v1}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->setBoolean(Lcom/motorola/otalib/common/settings/ISetting;Z)V

    sget-object v0, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->SMART_UPDATE_OS_ENABLE_BY_USER:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    invoke-virtual {p0, v0, v1}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->setBoolean(Lcom/motorola/otalib/common/settings/ISetting;Z)V

    return-void
.end method

.method public static sendSmartUpdateConfigChangedIntent(Landroid/content/Context;Z)V
    .locals 2

    new-instance v0, Landroid/content/Intent;

    const-string v1, "com.motorola.ccc.ota.ACTION_SMART_UPDATE_CONFIG_CHANGED"

    invoke-direct {v0, v1}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    const-string v1, "com.motorola.ccc.ota.SMART_UPDATE_ENABLED"

    invoke-virtual {v0, v1, p1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Z)Landroid/content/Intent;

    invoke-static {p0, v0}, Lcom/motorola/otalib/common/utils/BroadcastUtils;->sendLocalBroadcast(Landroid/content/Context;Landroid/content/Intent;)V

    return-void
.end method

.method private static setDefaultTimeIntervalForSmartUpdate(Landroid/content/Context;Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;Z)V
    .locals 7

    sget-object v0, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->SMART_UPDATE_MIN_INSTALL_TIME:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    const/4 v1, 0x1

    const/4 v2, 0x0

    invoke-static {v1, v2}, Lcom/motorola/ccc/ota/ui/UpdaterUtils;->getTimestampOfNextHourMinFromNow(II)J

    move-result-wide v3

    invoke-static {}, Lcom/motorola/ccc/ota/utils/SmartUpdateUtils;->generateRandomNumber()J

    move-result-wide v5

    add-long/2addr v3, v5

    invoke-virtual {p1, v0, v3, v4}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->setLong(Lcom/motorola/otalib/common/settings/ISetting;J)V

    sget-object v0, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->SMART_UPDATE_MAX_INSTALL_TIME:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    const/4 v3, 0x3

    invoke-static {v3, v2}, Lcom/motorola/ccc/ota/ui/UpdaterUtils;->getTimestampOfNextHourMinFromNow(II)J

    move-result-wide v4

    invoke-virtual {p1, v0, v4, v5}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->setLong(Lcom/motorola/otalib/common/settings/ISetting;J)V

    invoke-static {p1, p2}, Lcom/motorola/ccc/ota/utils/SmartUpdateUtils;->changeSmartUpdateInstallTimestampsOnDeferBased(Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;Z)V

    new-instance p1, Ljava/lang/StringBuilder;

    const-string p2, "Set to default Smart update time interval : "

    invoke-direct {p1, p2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-static {p0, v1, v2, v3, v2}, Lcom/motorola/ccc/ota/utils/DateFormatUtils;->generateTimeSlotContent(Landroid/content/Context;IIII)Ljava/lang/String;

    move-result-object p0

    invoke-virtual {p1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    const-string p1, "OtaApp"

    invoke-static {p1, p0}, Lcom/motorola/ccc/ota/utils/Logger;->debug(Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method

.method public static setSmartUpdateEnableByUser(Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;Z)V
    .locals 1

    sget-object v0, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->SMART_UPDATE_ENABLE_BY_USER:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    invoke-virtual {p0, v0, p1}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->setBoolean(Lcom/motorola/otalib/common/settings/ISetting;Z)V

    return-void
.end method

.method public static settingInstallTimeIntervalForSmartUpdate(Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;)V
    .locals 1

    const/4 v0, 0x0

    invoke-static {p0, v0}, Lcom/motorola/ccc/ota/utils/SmartUpdateUtils;->settingInstallTimeIntervalForSmartUpdate(Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;Z)V

    return-void
.end method

.method public static settingInstallTimeIntervalForSmartUpdate(Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;Z)V
    .locals 10

    invoke-static {}, Lcom/motorola/ccc/ota/env/OtaApplication;->getGlobalContext()Landroid/content/Context;

    move-result-object v0

    sget-object v1, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->SMART_UPDATE_TIME_SLOT:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    invoke-virtual {p0, v1}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->getString(Lcom/motorola/otalib/common/settings/ISetting;)Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Lcom/motorola/ccc/ota/utils/SmartUpdateUtils;->parseTimeslot(Ljava/lang/String;)Ljava/util/List;

    move-result-object v1

    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v2

    const/4 v3, 0x2

    if-eq v2, v3, :cond_0

    invoke-static {v0, p0, p1}, Lcom/motorola/ccc/ota/utils/SmartUpdateUtils;->setDefaultTimeIntervalForSmartUpdate(Landroid/content/Context;Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;Z)V

    return-void

    :cond_0
    const/4 v2, 0x0

    :goto_0
    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v4

    const-string v5, "OtaApp"

    if-ge v2, v4, :cond_5

    invoke-interface {v1, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Landroid/icu/util/Calendar;

    const/16 v6, 0xb

    invoke-virtual {v4, v6}, Landroid/icu/util/Calendar;->get(I)I

    move-result v6

    const/16 v7, 0xc

    invoke-virtual {v4, v7}, Landroid/icu/util/Calendar;->get(I)I

    move-result v4

    const/4 v7, -0x1

    if-ne v6, v7, :cond_1

    const-string v1, "Invalid time format of Smart Update time slot, setting to default time interval"

    invoke-static {v5, v1}, Lcom/motorola/ccc/ota/utils/Logger;->error(Ljava/lang/String;Ljava/lang/String;)V

    invoke-static {v0, p0, p1}, Lcom/motorola/ccc/ota/utils/SmartUpdateUtils;->setDefaultTimeIntervalForSmartUpdate(Landroid/content/Context;Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;Z)V

    return-void

    :cond_1
    invoke-static {v6, v4}, Lcom/motorola/ccc/ota/ui/UpdaterUtils;->getTimestampOfNextHourMinFromNow(II)J

    move-result-wide v7

    if-nez v2, :cond_4

    const/4 v5, 0x1

    if-eq v6, v5, :cond_2

    if-eq v6, v3, :cond_2

    const/4 v5, 0x3

    if-ne v6, v5, :cond_3

    :cond_2
    if-nez v4, :cond_3

    invoke-static {}, Lcom/motorola/ccc/ota/utils/SmartUpdateUtils;->generateRandomNumber()J

    move-result-wide v4

    add-long/2addr v7, v4

    :cond_3
    sget-object v4, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->SMART_UPDATE_MIN_INSTALL_TIME:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    invoke-virtual {p0, v4, v7, v8}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->setLong(Lcom/motorola/otalib/common/settings/ISetting;J)V

    goto :goto_1

    :cond_4
    sget-object v4, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->SMART_UPDATE_MAX_INSTALL_TIME:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    invoke-virtual {p0, v4, v7, v8}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->setLong(Lcom/motorola/otalib/common/settings/ISetting;J)V

    :goto_1
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    :cond_5
    invoke-static {p0, p1}, Lcom/motorola/ccc/ota/utils/SmartUpdateUtils;->changeSmartUpdateInstallTimestampsOnDeferBased(Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;Z)V

    new-instance p1, Ljava/lang/StringBuilder;

    const-string v0, "Smart Update installation set for : min = "

    invoke-direct {p1, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    sget-object v0, Ljava/util/concurrent/TimeUnit;->MILLISECONDS:Ljava/util/concurrent/TimeUnit;

    sget-object v1, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->SMART_UPDATE_MIN_INSTALL_TIME:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    const-wide/16 v2, -0x1

    invoke-virtual {p0, v1, v2, v3}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->getLong(Lcom/motorola/otalib/common/settings/ISetting;J)J

    move-result-wide v6

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v8

    sub-long/2addr v6, v8

    invoke-virtual {v0, v6, v7}, Ljava/util/concurrent/TimeUnit;->toMinutes(J)J

    move-result-wide v0

    invoke-virtual {p1, v0, v1}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object p1

    const-string v0, " minutes; max = "

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    sget-object v0, Ljava/util/concurrent/TimeUnit;->MILLISECONDS:Ljava/util/concurrent/TimeUnit;

    sget-object v1, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->SMART_UPDATE_MAX_INSTALL_TIME:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    invoke-virtual {p0, v1, v2, v3}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->getLong(Lcom/motorola/otalib/common/settings/ISetting;J)J

    move-result-wide v1

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v3

    sub-long/2addr v1, v3

    invoke-virtual {v0, v1, v2}, Ljava/util/concurrent/TimeUnit;->toMinutes(J)J

    move-result-wide v0

    invoke-virtual {p1, v0, v1}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-static {v5, p0}, Lcom/motorola/ccc/ota/utils/Logger;->debug(Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method

.method public static shouldIForceSmartUpdate(Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;Ljava/lang/String;)Z
    .locals 1

    invoke-static {p0}, Lcom/motorola/ccc/ota/utils/SmartUpdateUtils;->isSmartUpdateEnabledByUser(Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;)Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-static {}, Lcom/motorola/ccc/ota/utils/SmartUpdateUtils;->isSmartUpdateEnabledByServer()Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-static {p0, p1}, Lcom/motorola/ccc/ota/utils/SmartUpdateUtils;->isSmartUpdateForcedByUpdateType(Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;Ljava/lang/String;)Z

    move-result p0

    if-eqz p0, :cond_0

    const/4 p0, 0x1

    return p0

    :cond_0
    const/4 p0, 0x0

    return p0
.end method

.method public static shouldShowSmartUpdateBottomSheet(Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;)Z
    .locals 0

    invoke-static {p0}, Lcom/motorola/ccc/ota/utils/SmartUpdateUtils;->isSmartUpdateEnabledByUser(Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;)Z

    move-result p0

    if-nez p0, :cond_0

    invoke-static {}, Lcom/motorola/ccc/ota/utils/SmartUpdateUtils;->isSmartUpdateEnabledByServer()Z

    move-result p0

    if-eqz p0, :cond_0

    invoke-static {}, Lcom/motorola/ccc/ota/utils/BuildPropReader;->isVerizon()Z

    move-result p0

    if-nez p0, :cond_0

    invoke-static {}, Lcom/motorola/ccc/ota/utils/BuildPropReader;->isATT()Z

    move-result p0

    if-nez p0, :cond_0

    const/4 p0, 0x1

    goto :goto_0

    :cond_0
    const/4 p0, 0x0

    :goto_0
    return p0
.end method

.method public static shouldShowTrySmartUpdatePopUp(Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;Ljava/lang/String;Z)Z
    .locals 3

    sget-object v0, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->SMART_UPDATE_POP_UP_DISABLE:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    invoke-virtual {p0, v0}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->getBoolean(Lcom/motorola/otalib/common/settings/ISetting;)Z

    move-result v0

    sget-object v1, Lcom/motorola/ccc/ota/ui/updateType/UpdateType$DIFFUpdateType;->SMR:Lcom/motorola/ccc/ota/ui/updateType/UpdateType$DIFFUpdateType;

    invoke-virtual {v1}, Lcom/motorola/ccc/ota/ui/updateType/UpdateType$DIFFUpdateType;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    const/4 v1, 0x0

    const/4 v2, 0x1

    if-eqz p2, :cond_1

    invoke-static {}, Lcom/motorola/ccc/ota/utils/BuildPropReader;->isVerizon()Z

    move-result p2

    if-nez p2, :cond_0

    goto :goto_0

    :cond_0
    move p2, v1

    goto :goto_1

    :cond_1
    :goto_0
    move p2, v2

    :goto_1
    invoke-static {p0}, Lcom/motorola/ccc/ota/utils/SmartUpdateUtils;->isSmartUpdateEnabledByUser(Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;)Z

    move-result p0

    if-nez p0, :cond_3

    if-nez v0, :cond_3

    if-nez p1, :cond_2

    invoke-static {}, Lcom/motorola/ccc/ota/utils/SmartUpdateUtils;->isForcedMRUpdateEnabledByServer()Z

    move-result p0

    if-eqz p0, :cond_3

    :cond_2
    invoke-static {}, Lcom/motorola/ccc/ota/utils/SmartUpdateUtils;->isSmartUpdateEnabledByServer()Z

    move-result p0

    if-eqz p0, :cond_3

    if-eqz p2, :cond_3

    move v1, v2

    :cond_3
    return v1
.end method

.method public static showTrySmartUpdatePopUp(Landroid/content/Context;Ljava/lang/String;Lcom/motorola/ccc/ota/ui/updateType/UpdateType$UpdateTypeInterface;Landroid/app/Activity;Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;Ljava/lang/String;)V
    .locals 8

    invoke-interface {p2}, Lcom/motorola/ccc/ota/ui/updateType/UpdateType$UpdateTypeInterface;->getUpdateSpecificColor()I

    move-result p2

    invoke-virtual {p3}, Landroid/app/Activity;->getLayoutInflater()Landroid/view/LayoutInflater;

    move-result-object v0

    const v1, 0x7f0c0052

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    move-result-object v0

    const v1, 0x7f090127

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/CheckBox;

    new-instance v2, Lcom/motorola/ccc/ota/utils/SmartUpdateUtils$$ExternalSyntheticLambda0;

    invoke-direct {v2, v1, p0, p2, p4}, Lcom/motorola/ccc/ota/utils/SmartUpdateUtils$$ExternalSyntheticLambda0;-><init>(Landroid/widget/CheckBox;Landroid/content/Context;ILcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;)V

    invoke-virtual {v1, v2}, Landroid/widget/CheckBox;->setOnCheckedChangeListener(Landroid/widget/CompoundButton$OnCheckedChangeListener;)V

    invoke-static {}, Lcom/motorola/ccc/ota/utils/SmartUpdateUtils;->isShowDNDForPopUpEnabledByServer()Z

    move-result p2

    if-nez p2, :cond_0

    const/16 p2, 0x8

    invoke-virtual {v1, p2}, Landroid/widget/CheckBox;->setVisibility(I)V

    :cond_0
    new-instance p2, Landroidx/appcompat/app/AlertDialog$Builder;

    invoke-direct {p2, p0}, Landroidx/appcompat/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    const v1, 0x7f090129

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/TextView;

    invoke-virtual {v1, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    invoke-virtual {p2, v0}, Landroidx/appcompat/app/AlertDialog$Builder;->setView(Landroid/view/View;)Landroidx/appcompat/app/AlertDialog$Builder;

    const/4 p1, 0x0

    invoke-virtual {p2, p1}, Landroidx/appcompat/app/AlertDialog$Builder;->setCancelable(Z)Landroidx/appcompat/app/AlertDialog$Builder;

    const p1, 0x7f090126

    invoke-virtual {v0, p1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p1

    check-cast p1, Landroid/widget/Button;

    invoke-virtual {p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    const v2, 0x7f0e01ce

    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p1, v1}, Landroid/widget/Button;->setText(Ljava/lang/CharSequence;)V

    const v1, 0x7f090125

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/Button;

    invoke-virtual {p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    const v2, 0x7f0e0137

    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/Button;->setText(Ljava/lang/CharSequence;)V

    new-instance v1, Lcom/motorola/ccc/ota/utils/SmartUpdateUtils$$ExternalSyntheticLambda1;

    invoke-direct {v1, p3, p0}, Lcom/motorola/ccc/ota/utils/SmartUpdateUtils$$ExternalSyntheticLambda1;-><init>(Landroid/app/Activity;Landroid/content/Context;)V

    invoke-virtual {p2, v1}, Landroidx/appcompat/app/AlertDialog$Builder;->setOnKeyListener(Landroid/content/DialogInterface$OnKeyListener;)Landroidx/appcompat/app/AlertDialog$Builder;

    invoke-virtual {p2}, Landroidx/appcompat/app/AlertDialog$Builder;->create()Landroidx/appcompat/app/AlertDialog;

    move-result-object p2

    new-instance v1, Lcom/motorola/ccc/ota/utils/SmartUpdateUtils$$ExternalSyntheticLambda2;

    move-object v2, v1

    move-object v3, p3

    move-object v4, p4

    move-object v5, p0

    move-object v6, p5

    move-object v7, p2

    invoke-direct/range {v2 .. v7}, Lcom/motorola/ccc/ota/utils/SmartUpdateUtils$$ExternalSyntheticLambda2;-><init>(Landroid/app/Activity;Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;Landroid/content/Context;Ljava/lang/String;Landroidx/appcompat/app/AlertDialog;)V

    invoke-virtual {p1, v1}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    new-instance p1, Lcom/motorola/ccc/ota/utils/SmartUpdateUtils$$ExternalSyntheticLambda3;

    invoke-direct {p1, p2, p4, p3}, Lcom/motorola/ccc/ota/utils/SmartUpdateUtils$$ExternalSyntheticLambda3;-><init>(Landroidx/appcompat/app/AlertDialog;Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;Landroid/app/Activity;)V

    invoke-virtual {v0, p1}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    invoke-static {p0, p2}, Lcom/motorola/ccc/ota/ui/UpdaterUtils;->setCornersRounded(Landroid/content/Context;Landroidx/appcompat/app/AlertDialog;)V

    sget-object p0, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->STATS_SMART_UPDATE_POPUP_SHOWN_COUNT:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    invoke-virtual {p4, p0}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->incrementPrefs(Lcom/motorola/otalib/common/settings/ISetting;)V

    invoke-virtual {p2}, Landroidx/appcompat/app/AlertDialog;->show()V

    return-void
.end method

.method public static smartUpdateReachedMaxDeferTime(Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;)Z
    .locals 6

    invoke-static {p0}, Lcom/motorola/ccc/ota/utils/SmartUpdateUtils;->getDownloadOrInstallNotifiedTime(Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;)J

    move-result-wide v0

    const-wide/16 v2, -0x1

    cmp-long v4, v0, v2

    if-lez v4, :cond_0

    sget-object v4, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->SMART_UPDATE_MIN_INSTALL_TIME:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    invoke-virtual {p0, v4, v2, v3}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->getLong(Lcom/motorola/otalib/common/settings/ISetting;J)J

    move-result-wide v2

    const-wide/32 v4, 0x337f9800

    add-long/2addr v0, v4

    cmp-long p0, v2, v0

    if-ltz p0, :cond_0

    const/4 p0, 0x1

    return p0

    :cond_0
    const/4 p0, 0x0

    return p0
.end method

.method public static smartUpdateReachedMaxDeferTimeRORNoNetwork(Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;)Z
    .locals 6

    invoke-static {p0}, Lcom/motorola/ccc/ota/utils/SmartUpdateUtils;->getDownloadOrInstallNotifiedTime(Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;)J

    move-result-wide v0

    const-wide/16 v2, -0x1

    cmp-long v4, v0, v2

    if-lez v4, :cond_0

    sget-object v4, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->SMART_UPDATE_MIN_INSTALL_TIME:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    invoke-virtual {p0, v4, v2, v3}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->getLong(Lcom/motorola/otalib/common/settings/ISetting;J)J

    move-result-wide v2

    const-wide/32 v4, 0x2e593c00

    add-long/2addr v0, v4

    cmp-long p0, v2, v0

    if-ltz p0, :cond_0

    const/4 p0, 0x1

    return p0

    :cond_0
    const/4 p0, 0x0

    return p0
.end method

.method public static storeBits(Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;I)V
    .locals 2

    invoke-static {p0}, Lcom/motorola/ccc/ota/utils/SmartUpdateUtils;->isSmartUpdateEnabledByUser(Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;)Z

    move-result v0

    if-nez v0, :cond_0

    sget-object v0, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->SMART_UPDATE_MR_FORCED_BY_SERVER:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    sget-object v1, Lcom/motorola/ccc/ota/utils/SmartUpdateUtils$SmartUpdateBitmap;->forceMRUpdate:Lcom/motorola/ccc/ota/utils/SmartUpdateUtils$SmartUpdateBitmap;

    invoke-virtual {v1}, Lcom/motorola/ccc/ota/utils/SmartUpdateUtils$SmartUpdateBitmap;->ordinal()I

    move-result v1

    invoke-static {p1, v1}, Lcom/motorola/ccc/ota/ui/UpdaterUtils;->isBitMapSet(II)Z

    move-result v1

    invoke-virtual {p0, v0, v1}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->setBoolean(Lcom/motorola/otalib/common/settings/ISetting;Z)V

    :cond_0
    sget-object v0, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->SMART_UPDATE_ENABLE_BY_SERVER:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    sget-object v1, Lcom/motorola/ccc/ota/utils/SmartUpdateUtils$SmartUpdateBitmap;->superSmartUpdateControlFlag:Lcom/motorola/ccc/ota/utils/SmartUpdateUtils$SmartUpdateBitmap;

    invoke-virtual {v1}, Lcom/motorola/ccc/ota/utils/SmartUpdateUtils$SmartUpdateBitmap;->ordinal()I

    move-result v1

    invoke-static {p1, v1}, Lcom/motorola/ccc/ota/ui/UpdaterUtils;->isBitMapSet(II)Z

    move-result v1

    invoke-virtual {p0, v0, v1}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->setBoolean(Lcom/motorola/otalib/common/settings/ISetting;Z)V

    sget-object v0, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->SMART_UPDATE_ADV_OPT_BY_SERVER:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    sget-object v1, Lcom/motorola/ccc/ota/utils/SmartUpdateUtils$SmartUpdateBitmap;->showAdvancedSetting:Lcom/motorola/ccc/ota/utils/SmartUpdateUtils$SmartUpdateBitmap;

    invoke-virtual {v1}, Lcom/motorola/ccc/ota/utils/SmartUpdateUtils$SmartUpdateBitmap;->ordinal()I

    move-result v1

    invoke-static {p1, v1}, Lcom/motorola/ccc/ota/ui/UpdaterUtils;->isBitMapSet(II)Z

    move-result v1

    invoke-virtual {p0, v0, v1}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->setBoolean(Lcom/motorola/otalib/common/settings/ISetting;Z)V

    sget-object v0, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->SMART_UPDATE_SHOW_DND_POPUP_BY_SERVER:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    sget-object v1, Lcom/motorola/ccc/ota/utils/SmartUpdateUtils$SmartUpdateBitmap;->showDNDForPopUp:Lcom/motorola/ccc/ota/utils/SmartUpdateUtils$SmartUpdateBitmap;

    invoke-virtual {v1}, Lcom/motorola/ccc/ota/utils/SmartUpdateUtils$SmartUpdateBitmap;->ordinal()I

    move-result v1

    invoke-static {p1, v1}, Lcom/motorola/ccc/ota/ui/UpdaterUtils;->isBitMapSet(II)Z

    move-result p1

    invoke-virtual {p0, v0, p1}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->setBoolean(Lcom/motorola/otalib/common/settings/ISetting;Z)V

    return-void
.end method

.method public static turnSmartUpdateOff(Ljava/lang/String;)V
    .locals 3

    invoke-static {}, Lcom/motorola/ccc/ota/env/OtaApplication;->getGlobalContext()Landroid/content/Context;

    move-result-object v0

    const/4 v1, 0x0

    invoke-static {v0, v1}, Lcom/motorola/ccc/ota/utils/SmartUpdateUtils;->sendSmartUpdateConfigChangedIntent(Landroid/content/Context;Z)V

    new-instance v0, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    invoke-direct {v0}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;-><init>()V

    invoke-static {v0, v1}, Lcom/motorola/ccc/ota/utils/SmartUpdateUtils;->setSmartUpdateEnableByUser(Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;Z)V

    invoke-static {v0}, Lcom/motorola/ccc/ota/utils/SmartUpdateUtils;->resetSmartUpdatePrefs(Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;)V

    sget-object v1, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->STATS_INSTALL_VIA_SMART_UPDATE:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    invoke-virtual {v0, v1}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->getBoolean(Lcom/motorola/otalib/common/settings/ISetting;)Z

    move-result v1

    if-eqz v1, :cond_0

    sget-object v1, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->STATS_DISABLED_SMART_UPDATE_AFTER_INSTALL:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    const/4 v2, 0x1

    invoke-virtual {v0, v1, v2}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->setBoolean(Lcom/motorola/otalib/common/settings/ISetting;Z)V

    :cond_0
    sget-object v1, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->STATS_SMART_UPDATE_DISABLED_VIA:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    invoke-virtual {v0, v1, p0}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->setString(Lcom/motorola/otalib/common/settings/ISetting;Ljava/lang/String;)V

    return-void
.end method

.method public static turnSmartUpdateOn(Ljava/lang/String;)V
    .locals 3

    invoke-static {}, Lcom/motorola/ccc/ota/env/OtaApplication;->getGlobalContext()Landroid/content/Context;

    move-result-object v0

    const/4 v1, 0x1

    invoke-static {v0, v1}, Lcom/motorola/ccc/ota/utils/SmartUpdateUtils;->sendSmartUpdateConfigChangedIntent(Landroid/content/Context;Z)V

    new-instance v0, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    invoke-direct {v0}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;-><init>()V

    invoke-static {v0, v1}, Lcom/motorola/ccc/ota/utils/SmartUpdateUtils;->setSmartUpdateEnableByUser(Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;Z)V

    sget-object v1, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->SMART_UPDATE_TIME_SLOT:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    invoke-virtual {v0, v1}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->getString(Lcom/motorola/otalib/common/settings/ISetting;)Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    if-eqz v1, :cond_0

    sget-object v1, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->SMART_UPDATE_TIME_SLOT:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    const v2, 0x7f090139

    invoke-static {v2}, Lcom/motorola/ccc/ota/utils/SmartUpdateUtils;->getMappedTimeSlotForPrefs(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->setString(Lcom/motorola/otalib/common/settings/ISetting;Ljava/lang/String;)V

    :cond_0
    invoke-static {v0}, Lcom/motorola/ccc/ota/utils/SmartUpdateUtils;->settingInstallTimeIntervalForSmartUpdate(Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;)V

    sget-object v1, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->STATS_SMART_UPDATE_ENABLED_VIA:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    invoke-virtual {v0, v1, p0}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->setString(Lcom/motorola/otalib/common/settings/ISetting;Ljava/lang/String;)V

    sget-object p0, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->STATS_DISABLED_SMART_UPDATE_AFTER_INSTALL:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    invoke-virtual {v0, p0}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->removeConfig(Lcom/motorola/otalib/common/settings/ISetting;)V

    return-void
.end method
