.class public Lcom/motorola/ccc/ota/ui/BaseActivity;
.super Landroidx/appcompat/app/AppCompatActivity;
.source "BaseActivity.java"

# interfaces
.implements Lcom/motorola/ccc/ota/ui/FragmentActionListener;
.implements Lcom/motorola/ccc/ota/ui/UpdaterUtils$OnDialogInteractionListener;


# static fields
.field private static final ERR_ALREADY:Ljava/lang/String;

.field private static final ERR_BACKGROUND_INSTALL:Ljava/lang/String;

.field private static final ERR_BADPARAM:Ljava/lang/String;

.field private static final ERR_CONTACTSERVER:Ljava/lang/String;

.field private static final ERR_CTA_BG_DATA_DISABLED:Ljava/lang/String;

.field private static final ERR_DOWNLOADING:Ljava/lang/String;

.field private static final ERR_FAIL:Ljava/lang/String;

.field private static final ERR_INIT_OTA_SERVICE:Ljava/lang/String;

.field private static final ERR_INTERNAL:Ljava/lang/String;

.field private static final ERR_IN_CALL:Ljava/lang/String;

.field private static final ERR_NET:Ljava/lang/String;

.field private static final ERR_NOTFOUND:Ljava/lang/String;

.field private static final ERR_NOTFOUND_ADV_NOTICE:Ljava/lang/String;

.field private static final ERR_NOTFOUND_BOOT_UNLOCK:Ljava/lang/String;

.field private static final ERR_NOTFOUND_DEVICE_CORRUPTED:Ljava/lang/String;

.field private static final ERR_NOTFOUND_EOL:Ljava/lang/String;

.field private static final ERR_NOTFOUND_ROOTED:Ljava/lang/String;

.field private static final ERR_OK:Ljava/lang/String;

.field private static final ERR_POLICY_SET:Ljava/lang/String;

.field private static final ERR_REQUESTING:Ljava/lang/String;

.field private static final ERR_ROAMING:Ljava/lang/String;

.field private static final ERR_STORAGE_LOW:Ljava/lang/String;

.field private static final ERR_TEMP:Ljava/lang/String;

.field private static final ERR_VAB_MERGE_PENDING:Ljava/lang/String;

.field private static final ERR_VAB_MERGE_RESTART:Ljava/lang/String;

.field private static final ERR_VAB_VALIDATION:Ljava/lang/String;

.field private static final ERR_VAB_VALIDATION_FAILURE:Ljava/lang/String;

.field private static final ERR_VAB_VALIDATION_SUCCESS:Ljava/lang/String;

.field private static final ERR_VERITY_DISABLED:Ljava/lang/String;

.field private static final ERR_VU_WIFI_ONLY_WIFI_NOT_AVAILABLE:Ljava/lang/String;

.field private static final ERR_WIFI_NEEDED:Ljava/lang/String;

.field private static final VITAL_CHECK_FOR_UPDATE_INTENT:Ljava/lang/String; = "com.motorola.ccc.ota.CHECK_FOR_VITAL_UPDATE"

.field public static vitalUpdateLaunchIntent:Landroid/content/Intent;


# instance fields
.field private checkUpdateFragment:Lcom/motorola/ccc/ota/ui/CheckUpdateFragment;

.field private checkUpdateText:Landroid/widget/TextView;

.field private errorCodeToRefresh:Ljava/lang/String;

.field fragmentManager:Landroidx/fragment/app/FragmentManager;

.field fragmentTransaction:Landroidx/fragment/app/FragmentTransaction;

.field private isRunning:Z

.field private responseBundle:Landroid/os/Bundle;

.field private settings:Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

.field private smartUpdateDialogFragment:Landroidx/fragment/app/DialogFragment;

.field private updatePreferenceDialogFragment:Landroidx/fragment/app/DialogFragment;

.field private updateReceiver:Landroid/content/BroadcastReceiver;

.field private vitalCheckUpdateFragment:Lcom/motorola/ccc/ota/ui/VitalCheckUpdateFragment;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    sget-object v0, Lcom/motorola/otalib/common/utils/UpgradeUtils$Error;->ERR_OK:Lcom/motorola/otalib/common/utils/UpgradeUtils$Error;

    invoke-virtual {v0}, Lcom/motorola/otalib/common/utils/UpgradeUtils$Error;->toString()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/motorola/ccc/ota/ui/BaseActivity;->ERR_OK:Ljava/lang/String;

    sget-object v0, Lcom/motorola/otalib/common/utils/UpgradeUtils$Error;->ERR_ALREADY:Lcom/motorola/otalib/common/utils/UpgradeUtils$Error;

    invoke-virtual {v0}, Lcom/motorola/otalib/common/utils/UpgradeUtils$Error;->toString()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/motorola/ccc/ota/ui/BaseActivity;->ERR_ALREADY:Ljava/lang/String;

    sget-object v0, Lcom/motorola/otalib/common/utils/UpgradeUtils$Error;->ERR_REQUESTING:Lcom/motorola/otalib/common/utils/UpgradeUtils$Error;

    invoke-virtual {v0}, Lcom/motorola/otalib/common/utils/UpgradeUtils$Error;->toString()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/motorola/ccc/ota/ui/BaseActivity;->ERR_REQUESTING:Ljava/lang/String;

    sget-object v0, Lcom/motorola/otalib/common/utils/UpgradeUtils$Error;->ERR_DOWNLOADING:Lcom/motorola/otalib/common/utils/UpgradeUtils$Error;

    invoke-virtual {v0}, Lcom/motorola/otalib/common/utils/UpgradeUtils$Error;->toString()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/motorola/ccc/ota/ui/BaseActivity;->ERR_DOWNLOADING:Ljava/lang/String;

    sget-object v0, Lcom/motorola/otalib/common/utils/UpgradeUtils$Error;->ERR_CONTACTING_SERVER:Lcom/motorola/otalib/common/utils/UpgradeUtils$Error;

    invoke-virtual {v0}, Lcom/motorola/otalib/common/utils/UpgradeUtils$Error;->toString()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/motorola/ccc/ota/ui/BaseActivity;->ERR_CONTACTSERVER:Ljava/lang/String;

    sget-object v0, Lcom/motorola/otalib/common/utils/UpgradeUtils$Error;->ERR_NET:Lcom/motorola/otalib/common/utils/UpgradeUtils$Error;

    invoke-virtual {v0}, Lcom/motorola/otalib/common/utils/UpgradeUtils$Error;->toString()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/motorola/ccc/ota/ui/BaseActivity;->ERR_NET:Ljava/lang/String;

    sget-object v0, Lcom/motorola/otalib/common/utils/UpgradeUtils$Error;->ERR_POLICY_SET:Lcom/motorola/otalib/common/utils/UpgradeUtils$Error;

    invoke-virtual {v0}, Lcom/motorola/otalib/common/utils/UpgradeUtils$Error;->toString()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/motorola/ccc/ota/ui/BaseActivity;->ERR_POLICY_SET:Ljava/lang/String;

    sget-object v0, Lcom/motorola/otalib/common/utils/UpgradeUtils$Error;->ERR_NOTFOUND:Lcom/motorola/otalib/common/utils/UpgradeUtils$Error;

    invoke-virtual {v0}, Lcom/motorola/otalib/common/utils/UpgradeUtils$Error;->toString()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/motorola/ccc/ota/ui/BaseActivity;->ERR_NOTFOUND:Ljava/lang/String;

    sget-object v0, Lcom/motorola/otalib/common/utils/UpgradeUtils$Error;->ERR_NOTFOUND_ROOTED:Lcom/motorola/otalib/common/utils/UpgradeUtils$Error;

    invoke-virtual {v0}, Lcom/motorola/otalib/common/utils/UpgradeUtils$Error;->toString()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/motorola/ccc/ota/ui/BaseActivity;->ERR_NOTFOUND_ROOTED:Ljava/lang/String;

    sget-object v0, Lcom/motorola/otalib/common/utils/UpgradeUtils$Error;->ERR_VERITY_DISABLED:Lcom/motorola/otalib/common/utils/UpgradeUtils$Error;

    invoke-virtual {v0}, Lcom/motorola/otalib/common/utils/UpgradeUtils$Error;->toString()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/motorola/ccc/ota/ui/BaseActivity;->ERR_VERITY_DISABLED:Ljava/lang/String;

    sget-object v0, Lcom/motorola/otalib/common/utils/UpgradeUtils$Error;->ERR_NOTFOUND_BOOT_UNLOCK:Lcom/motorola/otalib/common/utils/UpgradeUtils$Error;

    invoke-virtual {v0}, Lcom/motorola/otalib/common/utils/UpgradeUtils$Error;->toString()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/motorola/ccc/ota/ui/BaseActivity;->ERR_NOTFOUND_BOOT_UNLOCK:Ljava/lang/String;

    sget-object v0, Lcom/motorola/otalib/common/utils/UpgradeUtils$Error;->ERR_VU_WIFI_ONLY_WIFI_NOT_AVAILABLE:Lcom/motorola/otalib/common/utils/UpgradeUtils$Error;

    invoke-virtual {v0}, Lcom/motorola/otalib/common/utils/UpgradeUtils$Error;->toString()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/motorola/ccc/ota/ui/BaseActivity;->ERR_VU_WIFI_ONLY_WIFI_NOT_AVAILABLE:Ljava/lang/String;

    sget-object v0, Lcom/motorola/otalib/common/utils/UpgradeUtils$Error;->ERR_NOTFOUND_DEVICE_CORRUPTED:Lcom/motorola/otalib/common/utils/UpgradeUtils$Error;

    invoke-virtual {v0}, Lcom/motorola/otalib/common/utils/UpgradeUtils$Error;->toString()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/motorola/ccc/ota/ui/BaseActivity;->ERR_NOTFOUND_DEVICE_CORRUPTED:Ljava/lang/String;

    sget-object v0, Lcom/motorola/otalib/common/utils/UpgradeUtils$Error;->ERR_NOTFOUND_ADV_NOTICE:Lcom/motorola/otalib/common/utils/UpgradeUtils$Error;

    invoke-virtual {v0}, Lcom/motorola/otalib/common/utils/UpgradeUtils$Error;->toString()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/motorola/ccc/ota/ui/BaseActivity;->ERR_NOTFOUND_ADV_NOTICE:Ljava/lang/String;

    sget-object v0, Lcom/motorola/otalib/common/utils/UpgradeUtils$Error;->ERR_NOTFOUND_EOL:Lcom/motorola/otalib/common/utils/UpgradeUtils$Error;

    invoke-virtual {v0}, Lcom/motorola/otalib/common/utils/UpgradeUtils$Error;->toString()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/motorola/ccc/ota/ui/BaseActivity;->ERR_NOTFOUND_EOL:Ljava/lang/String;

    sget-object v0, Lcom/motorola/otalib/common/utils/UpgradeUtils$Error;->ERR_TEMP:Lcom/motorola/otalib/common/utils/UpgradeUtils$Error;

    invoke-virtual {v0}, Lcom/motorola/otalib/common/utils/UpgradeUtils$Error;->toString()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/motorola/ccc/ota/ui/BaseActivity;->ERR_TEMP:Ljava/lang/String;

    sget-object v0, Lcom/motorola/otalib/common/utils/UpgradeUtils$Error;->ERR_FAIL:Lcom/motorola/otalib/common/utils/UpgradeUtils$Error;

    invoke-virtual {v0}, Lcom/motorola/otalib/common/utils/UpgradeUtils$Error;->toString()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/motorola/ccc/ota/ui/BaseActivity;->ERR_FAIL:Ljava/lang/String;

    sget-object v0, Lcom/motorola/otalib/common/utils/UpgradeUtils$Error;->ERR_BADPARAM:Lcom/motorola/otalib/common/utils/UpgradeUtils$Error;

    invoke-virtual {v0}, Lcom/motorola/otalib/common/utils/UpgradeUtils$Error;->toString()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/motorola/ccc/ota/ui/BaseActivity;->ERR_BADPARAM:Ljava/lang/String;

    sget-object v0, Lcom/motorola/otalib/common/utils/UpgradeUtils$Error;->ERR_WIFI_NEEDED:Lcom/motorola/otalib/common/utils/UpgradeUtils$Error;

    invoke-virtual {v0}, Lcom/motorola/otalib/common/utils/UpgradeUtils$Error;->toString()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/motorola/ccc/ota/ui/BaseActivity;->ERR_WIFI_NEEDED:Ljava/lang/String;

    sget-object v0, Lcom/motorola/otalib/common/utils/UpgradeUtils$Error;->ERR_INTERNAL:Lcom/motorola/otalib/common/utils/UpgradeUtils$Error;

    invoke-virtual {v0}, Lcom/motorola/otalib/common/utils/UpgradeUtils$Error;->toString()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/motorola/ccc/ota/ui/BaseActivity;->ERR_INTERNAL:Ljava/lang/String;

    sget-object v0, Lcom/motorola/otalib/common/utils/UpgradeUtils$Error;->ERR_INIT_OTA_SERVICE:Lcom/motorola/otalib/common/utils/UpgradeUtils$Error;

    invoke-virtual {v0}, Lcom/motorola/otalib/common/utils/UpgradeUtils$Error;->toString()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/motorola/ccc/ota/ui/BaseActivity;->ERR_INIT_OTA_SERVICE:Ljava/lang/String;

    sget-object v0, Lcom/motorola/otalib/common/utils/UpgradeUtils$Error;->ERR_VAB_VALIDATION:Lcom/motorola/otalib/common/utils/UpgradeUtils$Error;

    invoke-virtual {v0}, Lcom/motorola/otalib/common/utils/UpgradeUtils$Error;->toString()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/motorola/ccc/ota/ui/BaseActivity;->ERR_VAB_VALIDATION:Ljava/lang/String;

    sget-object v0, Lcom/motorola/otalib/common/utils/UpgradeUtils$Error;->ERR_VAB_VALIDATION_SUCCESS:Lcom/motorola/otalib/common/utils/UpgradeUtils$Error;

    invoke-virtual {v0}, Lcom/motorola/otalib/common/utils/UpgradeUtils$Error;->toString()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/motorola/ccc/ota/ui/BaseActivity;->ERR_VAB_VALIDATION_SUCCESS:Ljava/lang/String;

    sget-object v0, Lcom/motorola/otalib/common/utils/UpgradeUtils$Error;->ERR_VAB_VALIDATION_FAILURE:Lcom/motorola/otalib/common/utils/UpgradeUtils$Error;

    invoke-virtual {v0}, Lcom/motorola/otalib/common/utils/UpgradeUtils$Error;->toString()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/motorola/ccc/ota/ui/BaseActivity;->ERR_VAB_VALIDATION_FAILURE:Ljava/lang/String;

    sget-object v0, Lcom/motorola/otalib/common/utils/UpgradeUtils$Error;->ERR_ROAMING:Lcom/motorola/otalib/common/utils/UpgradeUtils$Error;

    invoke-virtual {v0}, Lcom/motorola/otalib/common/utils/UpgradeUtils$Error;->toString()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/motorola/ccc/ota/ui/BaseActivity;->ERR_ROAMING:Ljava/lang/String;

    sget-object v0, Lcom/motorola/otalib/common/utils/UpgradeUtils$Error;->ERR_IN_CALL:Lcom/motorola/otalib/common/utils/UpgradeUtils$Error;

    invoke-virtual {v0}, Lcom/motorola/otalib/common/utils/UpgradeUtils$Error;->toString()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/motorola/ccc/ota/ui/BaseActivity;->ERR_IN_CALL:Ljava/lang/String;

    sget-object v0, Lcom/motorola/otalib/common/utils/UpgradeUtils$Error;->ERR_STORAGE_LOW:Lcom/motorola/otalib/common/utils/UpgradeUtils$Error;

    invoke-virtual {v0}, Lcom/motorola/otalib/common/utils/UpgradeUtils$Error;->toString()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/motorola/ccc/ota/ui/BaseActivity;->ERR_STORAGE_LOW:Ljava/lang/String;

    sget-object v0, Lcom/motorola/otalib/common/utils/UpgradeUtils$Error;->ERR_BACKGROUND_INSTALL:Lcom/motorola/otalib/common/utils/UpgradeUtils$Error;

    invoke-virtual {v0}, Lcom/motorola/otalib/common/utils/UpgradeUtils$Error;->toString()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/motorola/ccc/ota/ui/BaseActivity;->ERR_BACKGROUND_INSTALL:Ljava/lang/String;

    sget-object v0, Lcom/motorola/otalib/common/utils/UpgradeUtils$Error;->ERR_VAB_MERGE_PENDING:Lcom/motorola/otalib/common/utils/UpgradeUtils$Error;

    invoke-virtual {v0}, Lcom/motorola/otalib/common/utils/UpgradeUtils$Error;->toString()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/motorola/ccc/ota/ui/BaseActivity;->ERR_VAB_MERGE_PENDING:Ljava/lang/String;

    sget-object v0, Lcom/motorola/otalib/common/utils/UpgradeUtils$Error;->ERR_VAB_MERGE_RESTART:Lcom/motorola/otalib/common/utils/UpgradeUtils$Error;

    invoke-virtual {v0}, Lcom/motorola/otalib/common/utils/UpgradeUtils$Error;->toString()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/motorola/ccc/ota/ui/BaseActivity;->ERR_VAB_MERGE_RESTART:Ljava/lang/String;

    sget-object v0, Lcom/motorola/otalib/common/utils/UpgradeUtils$Error;->ERR_CTA_BG_DATA_DISABLED:Lcom/motorola/otalib/common/utils/UpgradeUtils$Error;

    invoke-virtual {v0}, Lcom/motorola/otalib/common/utils/UpgradeUtils$Error;->toString()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/motorola/ccc/ota/ui/BaseActivity;->ERR_CTA_BG_DATA_DISABLED:Ljava/lang/String;

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    invoke-direct {p0}, Landroidx/appcompat/app/AppCompatActivity;-><init>()V

    return-void
.end method

.method private addBackgroundInstallationFragment(Landroid/content/Intent;)V
    .locals 3

    invoke-virtual {p0}, Lcom/motorola/ccc/ota/ui/BaseActivity;->getIntent()Landroid/content/Intent;

    move-result-object v0

    sget-object v1, Lcom/motorola/ccc/ota/utils/UpgradeUtilConstants$FragmentTypeEnum;->BACKGROUND_INSTALLATION_FRAGMENT:Lcom/motorola/ccc/ota/utils/UpgradeUtilConstants$FragmentTypeEnum;

    invoke-virtual {v1}, Lcom/motorola/ccc/ota/utils/UpgradeUtilConstants$FragmentTypeEnum;->toString()Ljava/lang/String;

    move-result-object v1

    const-string v2, "fragment_type"

    invoke-virtual {v0, v2, v1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    invoke-virtual {p0, v0}, Lcom/motorola/ccc/ota/ui/BaseActivity;->setIntent(Landroid/content/Intent;)V

    new-instance v0, Landroid/os/Bundle;

    invoke-direct {v0}, Landroid/os/Bundle;-><init>()V

    const-string v1, "activityIntent"

    invoke-virtual {v0, v1, p1}, Landroid/os/Bundle;->putParcelable(Ljava/lang/String;Landroid/os/Parcelable;)V

    iget-object p1, p0, Lcom/motorola/ccc/ota/ui/BaseActivity;->fragmentManager:Landroidx/fragment/app/FragmentManager;

    invoke-virtual {p1}, Landroidx/fragment/app/FragmentManager;->beginTransaction()Landroidx/fragment/app/FragmentTransaction;

    move-result-object p1

    iput-object p1, p0, Lcom/motorola/ccc/ota/ui/BaseActivity;->fragmentTransaction:Landroidx/fragment/app/FragmentTransaction;

    iget-object p1, p0, Lcom/motorola/ccc/ota/ui/BaseActivity;->settings:Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    sget-object v1, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->FLAG_IS_VITAL_UPDATE:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    invoke-virtual {p1, v1}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->getBoolean(Lcom/motorola/otalib/common/settings/ISetting;)Z

    move-result p1

    const v1, 0x7f0900c3

    if-eqz p1, :cond_0

    new-instance p1, Lcom/motorola/ccc/ota/ui/VitalBackgroundInstallationFragment;

    invoke-direct {p1}, Lcom/motorola/ccc/ota/ui/VitalBackgroundInstallationFragment;-><init>()V

    invoke-virtual {p1, v0}, Lcom/motorola/ccc/ota/ui/VitalBackgroundInstallationFragment;->setArguments(Landroid/os/Bundle;)V

    iget-object v0, p0, Lcom/motorola/ccc/ota/ui/BaseActivity;->fragmentTransaction:Landroidx/fragment/app/FragmentTransaction;

    invoke-virtual {v0, v1, p1}, Landroidx/fragment/app/FragmentTransaction;->replace(ILandroidx/fragment/app/Fragment;)Landroidx/fragment/app/FragmentTransaction;

    goto :goto_0

    :cond_0
    new-instance p1, Lcom/motorola/ccc/ota/ui/BackgroundInstallationFragment;

    invoke-direct {p1}, Lcom/motorola/ccc/ota/ui/BackgroundInstallationFragment;-><init>()V

    invoke-virtual {p1, v0}, Lcom/motorola/ccc/ota/ui/BackgroundInstallationFragment;->setArguments(Landroid/os/Bundle;)V

    iget-object v0, p0, Lcom/motorola/ccc/ota/ui/BaseActivity;->fragmentTransaction:Landroidx/fragment/app/FragmentTransaction;

    invoke-virtual {v0, v1, p1}, Landroidx/fragment/app/FragmentTransaction;->replace(ILandroidx/fragment/app/Fragment;)Landroidx/fragment/app/FragmentTransaction;

    :goto_0
    invoke-virtual {p0}, Lcom/motorola/ccc/ota/ui/BaseActivity;->commit()V

    return-void
.end method

.method private addCheckUpdateFragment(Ljava/lang/String;Ljava/lang/String;)V
    .locals 2

    new-instance v0, Landroid/os/Bundle;

    invoke-direct {v0}, Landroid/os/Bundle;-><init>()V

    const-string v1, "CheckTitle"

    invoke-virtual {v0, v1, p1}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    const-string p1, "CheckBody"

    invoke-virtual {v0, p1, p2}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    iget-object p1, p0, Lcom/motorola/ccc/ota/ui/BaseActivity;->fragmentManager:Landroidx/fragment/app/FragmentManager;

    invoke-virtual {p1}, Landroidx/fragment/app/FragmentManager;->beginTransaction()Landroidx/fragment/app/FragmentTransaction;

    move-result-object p1

    iput-object p1, p0, Lcom/motorola/ccc/ota/ui/BaseActivity;->fragmentTransaction:Landroidx/fragment/app/FragmentTransaction;

    iget-object p1, p0, Lcom/motorola/ccc/ota/ui/BaseActivity;->settings:Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    sget-object p2, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->FLAG_IS_VITAL_UPDATE:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    invoke-virtual {p1, p2}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->getBoolean(Lcom/motorola/otalib/common/settings/ISetting;)Z

    move-result p1

    const p2, 0x7f0900c3

    if-eqz p1, :cond_1

    iget-object p1, p0, Lcom/motorola/ccc/ota/ui/BaseActivity;->settings:Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    sget-object v1, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->VAB_MERGE_PROCESS_RUNNING:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    invoke-virtual {p1, v1}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->getBoolean(Lcom/motorola/otalib/common/settings/ISetting;)Z

    move-result p1

    if-eqz p1, :cond_0

    const-string p1, "OtaApp"

    const-string p2, "Vital update request and merge process is running so don\'t send check update request; finish the activity"

    invoke-static {p1, p2}, Lcom/motorola/ccc/ota/utils/Logger;->debug(Ljava/lang/String;Ljava/lang/String;)V

    invoke-static {p0}, Lcom/motorola/ccc/ota/ui/UpdaterUtils;->launchNextSetupActivityVitalUpdate(Landroid/content/Context;)V

    invoke-virtual {p0}, Lcom/motorola/ccc/ota/ui/BaseActivity;->finish()V

    return-void

    :cond_0
    new-instance p1, Lcom/motorola/ccc/ota/ui/VitalCheckUpdateFragment;

    invoke-direct {p1}, Lcom/motorola/ccc/ota/ui/VitalCheckUpdateFragment;-><init>()V

    iput-object p1, p0, Lcom/motorola/ccc/ota/ui/BaseActivity;->vitalCheckUpdateFragment:Lcom/motorola/ccc/ota/ui/VitalCheckUpdateFragment;

    invoke-virtual {p1, v0}, Lcom/motorola/ccc/ota/ui/VitalCheckUpdateFragment;->setArguments(Landroid/os/Bundle;)V

    iget-object p1, p0, Lcom/motorola/ccc/ota/ui/BaseActivity;->fragmentTransaction:Landroidx/fragment/app/FragmentTransaction;

    iget-object v0, p0, Lcom/motorola/ccc/ota/ui/BaseActivity;->vitalCheckUpdateFragment:Lcom/motorola/ccc/ota/ui/VitalCheckUpdateFragment;

    const-string v1, "VitalCheckUpdateFragment"

    invoke-virtual {p1, p2, v0, v1}, Landroidx/fragment/app/FragmentTransaction;->replace(ILandroidx/fragment/app/Fragment;Ljava/lang/String;)Landroidx/fragment/app/FragmentTransaction;

    goto :goto_0

    :cond_1
    new-instance p1, Lcom/motorola/ccc/ota/ui/CheckUpdateFragment;

    invoke-direct {p1}, Lcom/motorola/ccc/ota/ui/CheckUpdateFragment;-><init>()V

    iput-object p1, p0, Lcom/motorola/ccc/ota/ui/BaseActivity;->checkUpdateFragment:Lcom/motorola/ccc/ota/ui/CheckUpdateFragment;

    invoke-virtual {p1, v0}, Lcom/motorola/ccc/ota/ui/CheckUpdateFragment;->setArguments(Landroid/os/Bundle;)V

    iget-object p1, p0, Lcom/motorola/ccc/ota/ui/BaseActivity;->fragmentTransaction:Landroidx/fragment/app/FragmentTransaction;

    iget-object v0, p0, Lcom/motorola/ccc/ota/ui/BaseActivity;->checkUpdateFragment:Lcom/motorola/ccc/ota/ui/CheckUpdateFragment;

    const-string v1, "CheckUpdateFragment"

    invoke-virtual {p1, p2, v0, v1}, Landroidx/fragment/app/FragmentTransaction;->replace(ILandroidx/fragment/app/Fragment;Ljava/lang/String;)Landroidx/fragment/app/FragmentTransaction;

    :goto_0
    invoke-virtual {p0}, Lcom/motorola/ccc/ota/ui/BaseActivity;->commit()V

    return-void
.end method

.method private addDownloadFragment(Landroid/content/Intent;)V
    .locals 2

    new-instance v0, Landroid/os/Bundle;

    invoke-direct {v0}, Landroid/os/Bundle;-><init>()V

    const-string v1, "activityIntent"

    invoke-virtual {v0, v1, p1}, Landroid/os/Bundle;->putParcelable(Ljava/lang/String;Landroid/os/Parcelable;)V

    iget-object p1, p0, Lcom/motorola/ccc/ota/ui/BaseActivity;->fragmentManager:Landroidx/fragment/app/FragmentManager;

    invoke-virtual {p1}, Landroidx/fragment/app/FragmentManager;->beginTransaction()Landroidx/fragment/app/FragmentTransaction;

    move-result-object p1

    iput-object p1, p0, Lcom/motorola/ccc/ota/ui/BaseActivity;->fragmentTransaction:Landroidx/fragment/app/FragmentTransaction;

    new-instance p1, Lcom/motorola/ccc/ota/ui/DownloadFragment;

    invoke-direct {p1}, Lcom/motorola/ccc/ota/ui/DownloadFragment;-><init>()V

    invoke-virtual {p1, v0}, Lcom/motorola/ccc/ota/ui/DownloadFragment;->setArguments(Landroid/os/Bundle;)V

    iget-object v0, p0, Lcom/motorola/ccc/ota/ui/BaseActivity;->fragmentTransaction:Landroidx/fragment/app/FragmentTransaction;

    const v1, 0x7f0900c3

    invoke-virtual {v0, v1, p1}, Landroidx/fragment/app/FragmentTransaction;->replace(ILandroidx/fragment/app/Fragment;)Landroidx/fragment/app/FragmentTransaction;

    invoke-virtual {p0}, Lcom/motorola/ccc/ota/ui/BaseActivity;->commit()V

    return-void
.end method

.method private addDownloadProgressFragment(Landroid/content/Intent;)V
    .locals 3

    invoke-virtual {p0}, Lcom/motorola/ccc/ota/ui/BaseActivity;->getIntent()Landroid/content/Intent;

    move-result-object v0

    sget-object v1, Lcom/motorola/ccc/ota/utils/UpgradeUtilConstants$FragmentTypeEnum;->DOWNLOAD_PROGRESS_FRAGMENT:Lcom/motorola/ccc/ota/utils/UpgradeUtilConstants$FragmentTypeEnum;

    invoke-virtual {v1}, Lcom/motorola/ccc/ota/utils/UpgradeUtilConstants$FragmentTypeEnum;->toString()Ljava/lang/String;

    move-result-object v1

    const-string v2, "fragment_type"

    invoke-virtual {v0, v2, v1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    invoke-virtual {p0, v0}, Lcom/motorola/ccc/ota/ui/BaseActivity;->setIntent(Landroid/content/Intent;)V

    new-instance v0, Landroid/os/Bundle;

    invoke-direct {v0}, Landroid/os/Bundle;-><init>()V

    const-string v1, "activityIntent"

    invoke-virtual {v0, v1, p1}, Landroid/os/Bundle;->putParcelable(Ljava/lang/String;Landroid/os/Parcelable;)V

    iget-object p1, p0, Lcom/motorola/ccc/ota/ui/BaseActivity;->fragmentManager:Landroidx/fragment/app/FragmentManager;

    invoke-virtual {p1}, Landroidx/fragment/app/FragmentManager;->beginTransaction()Landroidx/fragment/app/FragmentTransaction;

    move-result-object p1

    iput-object p1, p0, Lcom/motorola/ccc/ota/ui/BaseActivity;->fragmentTransaction:Landroidx/fragment/app/FragmentTransaction;

    new-instance p1, Lcom/motorola/ccc/ota/ui/DownloadProgressFragment;

    invoke-direct {p1}, Lcom/motorola/ccc/ota/ui/DownloadProgressFragment;-><init>()V

    invoke-virtual {p1, v0}, Lcom/motorola/ccc/ota/ui/DownloadProgressFragment;->setArguments(Landroid/os/Bundle;)V

    iget-object v0, p0, Lcom/motorola/ccc/ota/ui/BaseActivity;->fragmentTransaction:Landroidx/fragment/app/FragmentTransaction;

    const v1, 0x7f0900c3

    invoke-virtual {v0, v1, p1}, Landroidx/fragment/app/FragmentTransaction;->replace(ILandroidx/fragment/app/Fragment;)Landroidx/fragment/app/FragmentTransaction;

    invoke-virtual {p0}, Lcom/motorola/ccc/ota/ui/BaseActivity;->commit()V

    return-void
.end method

.method private addErrorFragment(Landroid/content/Intent;Ljava/lang/String;Ljava/lang/String;)V
    .locals 2

    iget-object v0, p0, Lcom/motorola/ccc/ota/ui/BaseActivity;->settings:Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    sget-object v1, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->FLAG_IS_VITAL_UPDATE:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    invoke-virtual {v0, v1}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->getBoolean(Lcom/motorola/otalib/common/settings/ISetting;)Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-static {p0}, Lcom/motorola/ccc/ota/ui/UpdaterUtils;->launchNextSetupActivityVitalUpdate(Landroid/content/Context;)V

    invoke-virtual {p0}, Lcom/motorola/ccc/ota/ui/BaseActivity;->finish()V

    return-void

    :cond_0
    new-instance v0, Landroid/os/Bundle;

    invoke-direct {v0}, Landroid/os/Bundle;-><init>()V

    const-string v1, "activityIntent"

    invoke-virtual {v0, v1, p1}, Landroid/os/Bundle;->putParcelable(Ljava/lang/String;Landroid/os/Parcelable;)V

    const-string p1, "ErrorMessage"

    invoke-virtual {v0, p1, p3}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    const-string p1, "ErrorTitle"

    invoke-virtual {v0, p1, p2}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    iget-object p1, p0, Lcom/motorola/ccc/ota/ui/BaseActivity;->fragmentManager:Landroidx/fragment/app/FragmentManager;

    invoke-virtual {p1}, Landroidx/fragment/app/FragmentManager;->beginTransaction()Landroidx/fragment/app/FragmentTransaction;

    move-result-object p1

    iput-object p1, p0, Lcom/motorola/ccc/ota/ui/BaseActivity;->fragmentTransaction:Landroidx/fragment/app/FragmentTransaction;

    new-instance p1, Lcom/motorola/ccc/ota/ui/ErrorFragment;

    invoke-direct {p1}, Lcom/motorola/ccc/ota/ui/ErrorFragment;-><init>()V

    invoke-virtual {p1, v0}, Lcom/motorola/ccc/ota/ui/ErrorFragment;->setArguments(Landroid/os/Bundle;)V

    iget-object p2, p0, Lcom/motorola/ccc/ota/ui/BaseActivity;->fragmentTransaction:Landroidx/fragment/app/FragmentTransaction;

    const p3, 0x7f0900c3

    invoke-virtual {p2, p3, p1}, Landroidx/fragment/app/FragmentTransaction;->replace(ILandroidx/fragment/app/Fragment;)Landroidx/fragment/app/FragmentTransaction;

    invoke-virtual {p0}, Lcom/motorola/ccc/ota/ui/BaseActivity;->commit()V

    return-void
.end method

.method private addMergeRestartFragment(Landroid/content/Intent;)V
    .locals 2

    iget-object v0, p0, Lcom/motorola/ccc/ota/ui/BaseActivity;->settings:Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    sget-object v1, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->FLAG_IS_VITAL_UPDATE:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    invoke-virtual {v0, v1}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->getBoolean(Lcom/motorola/otalib/common/settings/ISetting;)Z

    move-result v0

    if-eqz v0, :cond_0

    const-string p1, "OtaApp"

    const-string v0, "Vital update request and merge process is running so don\'t send check update request; finish the activity"

    invoke-static {p1, v0}, Lcom/motorola/ccc/ota/utils/Logger;->debug(Ljava/lang/String;Ljava/lang/String;)V

    invoke-static {p0}, Lcom/motorola/ccc/ota/ui/UpdaterUtils;->launchNextSetupActivityVitalUpdate(Landroid/content/Context;)V

    invoke-virtual {p0}, Lcom/motorola/ccc/ota/ui/BaseActivity;->finish()V

    return-void

    :cond_0
    new-instance v0, Landroid/os/Bundle;

    invoke-direct {v0}, Landroid/os/Bundle;-><init>()V

    const-string v1, "activityIntent"

    invoke-virtual {v0, v1, p1}, Landroid/os/Bundle;->putParcelable(Ljava/lang/String;Landroid/os/Parcelable;)V

    iget-object p1, p0, Lcom/motorola/ccc/ota/ui/BaseActivity;->fragmentManager:Landroidx/fragment/app/FragmentManager;

    invoke-virtual {p1}, Landroidx/fragment/app/FragmentManager;->beginTransaction()Landroidx/fragment/app/FragmentTransaction;

    move-result-object p1

    iput-object p1, p0, Lcom/motorola/ccc/ota/ui/BaseActivity;->fragmentTransaction:Landroidx/fragment/app/FragmentTransaction;

    new-instance p1, Lcom/motorola/ccc/ota/ui/MergeRestartFragment;

    invoke-direct {p1}, Lcom/motorola/ccc/ota/ui/MergeRestartFragment;-><init>()V

    invoke-virtual {p1, v0}, Lcom/motorola/ccc/ota/ui/MergeRestartFragment;->setArguments(Landroid/os/Bundle;)V

    iget-object v0, p0, Lcom/motorola/ccc/ota/ui/BaseActivity;->fragmentTransaction:Landroidx/fragment/app/FragmentTransaction;

    const v1, 0x7f0900c3

    invoke-virtual {v0, v1, p1}, Landroidx/fragment/app/FragmentTransaction;->replace(ILandroidx/fragment/app/Fragment;)Landroidx/fragment/app/FragmentTransaction;

    invoke-virtual {p0}, Lcom/motorola/ccc/ota/ui/BaseActivity;->commit()V

    return-void
.end method

.method private addRestartFragment(Landroid/content/Intent;)V
    .locals 3

    new-instance v0, Landroid/os/Bundle;

    invoke-direct {v0}, Landroid/os/Bundle;-><init>()V

    const-string v1, "activityIntent"

    invoke-virtual {v0, v1, p1}, Landroid/os/Bundle;->putParcelable(Ljava/lang/String;Landroid/os/Parcelable;)V

    iget-object p1, p0, Lcom/motorola/ccc/ota/ui/BaseActivity;->fragmentManager:Landroidx/fragment/app/FragmentManager;

    invoke-virtual {p1}, Landroidx/fragment/app/FragmentManager;->beginTransaction()Landroidx/fragment/app/FragmentTransaction;

    move-result-object p1

    iput-object p1, p0, Lcom/motorola/ccc/ota/ui/BaseActivity;->fragmentTransaction:Landroidx/fragment/app/FragmentTransaction;

    iget-object p1, p0, Lcom/motorola/ccc/ota/ui/BaseActivity;->settings:Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    sget-object v1, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->FLAG_IS_VITAL_UPDATE:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    invoke-virtual {p1, v1}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->getBoolean(Lcom/motorola/otalib/common/settings/ISetting;)Z

    move-result p1

    const v1, 0x7f0900c3

    if-eqz p1, :cond_0

    new-instance p1, Lcom/motorola/ccc/ota/ui/VitalRestartFragment;

    invoke-direct {p1}, Lcom/motorola/ccc/ota/ui/VitalRestartFragment;-><init>()V

    invoke-virtual {p1, v0}, Lcom/motorola/ccc/ota/ui/VitalRestartFragment;->setArguments(Landroid/os/Bundle;)V

    iget-object v0, p0, Lcom/motorola/ccc/ota/ui/BaseActivity;->fragmentTransaction:Landroidx/fragment/app/FragmentTransaction;

    invoke-virtual {v0, v1, p1}, Landroidx/fragment/app/FragmentTransaction;->replace(ILandroidx/fragment/app/Fragment;)Landroidx/fragment/app/FragmentTransaction;

    goto :goto_0

    :cond_0
    new-instance p1, Lcom/motorola/ccc/ota/ui/RestartFragment;

    invoke-direct {p1}, Lcom/motorola/ccc/ota/ui/RestartFragment;-><init>()V

    iget-object v2, p0, Lcom/motorola/ccc/ota/ui/BaseActivity;->fragmentManager:Landroidx/fragment/app/FragmentManager;

    invoke-virtual {v2, v1}, Landroidx/fragment/app/FragmentManager;->findFragmentById(I)Landroidx/fragment/app/Fragment;

    move-result-object v2

    instance-of v2, v2, Lcom/motorola/ccc/ota/ui/RestartFragment;

    if-eqz v2, :cond_1

    return-void

    :cond_1
    invoke-virtual {p1, v0}, Lcom/motorola/ccc/ota/ui/RestartFragment;->setArguments(Landroid/os/Bundle;)V

    iget-object v0, p0, Lcom/motorola/ccc/ota/ui/BaseActivity;->fragmentTransaction:Landroidx/fragment/app/FragmentTransaction;

    invoke-virtual {v0, v1, p1}, Landroidx/fragment/app/FragmentTransaction;->replace(ILandroidx/fragment/app/Fragment;)Landroidx/fragment/app/FragmentTransaction;

    :goto_0
    invoke-virtual {p0}, Lcom/motorola/ccc/ota/ui/BaseActivity;->commit()V

    return-void
.end method

.method private addSmartUpdateFragment(Landroid/content/Intent;)V
    .locals 2

    iget-boolean v0, p0, Lcom/motorola/ccc/ota/ui/BaseActivity;->isRunning:Z

    if-nez v0, :cond_0

    return-void

    :cond_0
    new-instance v0, Landroid/os/Bundle;

    invoke-direct {v0}, Landroid/os/Bundle;-><init>()V

    const-string v1, "activityIntent"

    invoke-virtual {v0, v1, p1}, Landroid/os/Bundle;->putParcelable(Ljava/lang/String;Landroid/os/Parcelable;)V

    new-instance p1, Lcom/motorola/ccc/ota/ui/SmartUpdateFragment;

    invoke-direct {p1}, Lcom/motorola/ccc/ota/ui/SmartUpdateFragment;-><init>()V

    iput-object p1, p0, Lcom/motorola/ccc/ota/ui/BaseActivity;->smartUpdateDialogFragment:Landroidx/fragment/app/DialogFragment;

    invoke-virtual {p1, v0}, Landroidx/fragment/app/DialogFragment;->setArguments(Landroid/os/Bundle;)V

    iget-object p1, p0, Lcom/motorola/ccc/ota/ui/BaseActivity;->smartUpdateDialogFragment:Landroidx/fragment/app/DialogFragment;

    iget-object p0, p0, Lcom/motorola/ccc/ota/ui/BaseActivity;->fragmentManager:Landroidx/fragment/app/FragmentManager;

    const-string v0, "SmartUpdateDialog"

    invoke-virtual {p1, p0, v0}, Landroidx/fragment/app/DialogFragment;->show(Landroidx/fragment/app/FragmentManager;Ljava/lang/String;)V

    return-void
.end method

.method private addUpdateCompleteFragment(Landroid/content/Intent;)V
    .locals 2

    new-instance v0, Landroid/os/Bundle;

    invoke-direct {v0}, Landroid/os/Bundle;-><init>()V

    const-string v1, "activityIntent"

    invoke-virtual {v0, v1, p1}, Landroid/os/Bundle;->putParcelable(Ljava/lang/String;Landroid/os/Parcelable;)V

    iget-object p1, p0, Lcom/motorola/ccc/ota/ui/BaseActivity;->fragmentManager:Landroidx/fragment/app/FragmentManager;

    invoke-virtual {p1}, Landroidx/fragment/app/FragmentManager;->beginTransaction()Landroidx/fragment/app/FragmentTransaction;

    move-result-object p1

    iput-object p1, p0, Lcom/motorola/ccc/ota/ui/BaseActivity;->fragmentTransaction:Landroidx/fragment/app/FragmentTransaction;

    new-instance p1, Lcom/motorola/ccc/ota/ui/UpdateCompleteFragment;

    invoke-direct {p1}, Lcom/motorola/ccc/ota/ui/UpdateCompleteFragment;-><init>()V

    invoke-virtual {p1, v0}, Lcom/motorola/ccc/ota/ui/UpdateCompleteFragment;->setArguments(Landroid/os/Bundle;)V

    iget-object v0, p0, Lcom/motorola/ccc/ota/ui/BaseActivity;->fragmentTransaction:Landroidx/fragment/app/FragmentTransaction;

    const v1, 0x7f0900c3

    invoke-virtual {v0, v1, p1}, Landroidx/fragment/app/FragmentTransaction;->replace(ILandroidx/fragment/app/Fragment;)Landroidx/fragment/app/FragmentTransaction;

    invoke-virtual {p0}, Lcom/motorola/ccc/ota/ui/BaseActivity;->commit()V

    return-void
.end method

.method private addUpdateFailedFragment(Landroid/content/Intent;)V
    .locals 3

    new-instance v0, Landroid/os/Bundle;

    invoke-direct {v0}, Landroid/os/Bundle;-><init>()V

    const-string v1, "activityIntent"

    invoke-virtual {v0, v1, p1}, Landroid/os/Bundle;->putParcelable(Ljava/lang/String;Landroid/os/Parcelable;)V

    const/4 v1, 0x0

    const-string v2, "MergeStatusFailure"

    invoke-virtual {p1, v2, v1}, Landroid/content/Intent;->getBooleanExtra(Ljava/lang/String;Z)Z

    move-result p1

    invoke-virtual {v0, v2, p1}, Landroid/os/Bundle;->putBoolean(Ljava/lang/String;Z)V

    iget-object p1, p0, Lcom/motorola/ccc/ota/ui/BaseActivity;->fragmentManager:Landroidx/fragment/app/FragmentManager;

    invoke-virtual {p1}, Landroidx/fragment/app/FragmentManager;->beginTransaction()Landroidx/fragment/app/FragmentTransaction;

    move-result-object p1

    iput-object p1, p0, Lcom/motorola/ccc/ota/ui/BaseActivity;->fragmentTransaction:Landroidx/fragment/app/FragmentTransaction;

    iget-object p1, p0, Lcom/motorola/ccc/ota/ui/BaseActivity;->settings:Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    sget-object v1, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->FLAG_IS_VITAL_UPDATE:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    invoke-virtual {p1, v1}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->getBoolean(Lcom/motorola/otalib/common/settings/ISetting;)Z

    move-result p1

    const v1, 0x7f0900c3

    if-eqz p1, :cond_0

    new-instance p1, Lcom/motorola/ccc/ota/ui/VitalUpdateFailedFragment;

    invoke-direct {p1}, Lcom/motorola/ccc/ota/ui/VitalUpdateFailedFragment;-><init>()V

    invoke-virtual {p1, v0}, Lcom/motorola/ccc/ota/ui/VitalUpdateFailedFragment;->setArguments(Landroid/os/Bundle;)V

    iget-object v0, p0, Lcom/motorola/ccc/ota/ui/BaseActivity;->fragmentTransaction:Landroidx/fragment/app/FragmentTransaction;

    invoke-virtual {v0, v1, p1}, Landroidx/fragment/app/FragmentTransaction;->replace(ILandroidx/fragment/app/Fragment;)Landroidx/fragment/app/FragmentTransaction;

    goto :goto_0

    :cond_0
    new-instance p1, Lcom/motorola/ccc/ota/ui/UpdateFailedFragment;

    invoke-direct {p1}, Lcom/motorola/ccc/ota/ui/UpdateFailedFragment;-><init>()V

    invoke-virtual {p1, v0}, Lcom/motorola/ccc/ota/ui/UpdateFailedFragment;->setArguments(Landroid/os/Bundle;)V

    iget-object v0, p0, Lcom/motorola/ccc/ota/ui/BaseActivity;->fragmentTransaction:Landroidx/fragment/app/FragmentTransaction;

    invoke-virtual {v0, v1, p1}, Landroidx/fragment/app/FragmentTransaction;->replace(ILandroidx/fragment/app/Fragment;)Landroidx/fragment/app/FragmentTransaction;

    :goto_0
    invoke-virtual {p0}, Lcom/motorola/ccc/ota/ui/BaseActivity;->commit()V

    return-void
.end method

.method private addUpdatePreferenceFragment(Landroid/content/Intent;)V
    .locals 1

    iget-object v0, p0, Lcom/motorola/ccc/ota/ui/BaseActivity;->fragmentManager:Landroidx/fragment/app/FragmentManager;

    iget-boolean p0, p0, Lcom/motorola/ccc/ota/ui/BaseActivity;->isRunning:Z

    invoke-static {p1, v0, p0}, Lcom/motorola/ccc/ota/utils/SmartUpdateUtils;->launchUpdatePreferences(Landroid/content/Intent;Landroidx/fragment/app/FragmentManager;Z)V

    return-void
.end method

.method private initFragment(Lcom/motorola/ccc/ota/utils/UpgradeUtilConstants$FragmentTypeEnum;)V
    .locals 4

    invoke-static {p0}, Lcom/motorola/ccc/ota/utils/SmartUpdateUtils;->dismissSmartDialogs(Landroidx/fragment/app/FragmentActivity;)V

    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "fragment type is "

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    const-string v1, "OtaApp"

    invoke-static {v1, v0}, Lcom/motorola/ccc/ota/utils/Logger;->debug(Ljava/lang/String;Ljava/lang/String;)V

    const-string v0, "com.motorola.ccc.ota.Permissions.INTERACT_OTA_SERVICE"

    const-string v1, "com.motorola.blur.service.blur.Actions.MANUAL_CHECK_UPDATE"

    if-nez p1, :cond_0

    new-instance p1, Landroid/content/Intent;

    invoke-direct {p1, v1}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    invoke-virtual {p0, p1, v0}, Lcom/motorola/ccc/ota/ui/BaseActivity;->sendBroadcast(Landroid/content/Intent;Ljava/lang/String;)V

    invoke-static {p0}, Lcom/motorola/ccc/ota/ui/UpdaterUtils;->sendCheckUpdateIntent(Landroid/content/Context;)V

    goto :goto_0

    :cond_0
    invoke-virtual {p0}, Lcom/motorola/ccc/ota/ui/BaseActivity;->getIntent()Landroid/content/Intent;

    move-result-object v2

    const-string v3, "fragment_type"

    invoke-virtual {v2, v3, p1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/io/Serializable;)Landroid/content/Intent;

    invoke-virtual {p0, v2}, Lcom/motorola/ccc/ota/ui/BaseActivity;->setIntent(Landroid/content/Intent;)V

    sget-object v2, Lcom/motorola/ccc/ota/ui/BaseActivity$2;->$SwitchMap$com$motorola$ccc$ota$utils$UpgradeUtilConstants$FragmentTypeEnum:[I

    invoke-virtual {p1}, Lcom/motorola/ccc/ota/utils/UpgradeUtilConstants$FragmentTypeEnum;->ordinal()I

    move-result p1

    aget p1, v2, p1

    packed-switch p1, :pswitch_data_0

    new-instance p1, Landroid/content/Intent;

    invoke-direct {p1, v1}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    invoke-virtual {p0, p1, v0}, Lcom/motorola/ccc/ota/ui/BaseActivity;->sendBroadcast(Landroid/content/Intent;Ljava/lang/String;)V

    invoke-static {p0}, Lcom/motorola/ccc/ota/ui/UpdaterUtils;->sendCheckUpdateIntent(Landroid/content/Context;)V

    goto :goto_0

    :pswitch_0
    invoke-virtual {p0}, Lcom/motorola/ccc/ota/ui/BaseActivity;->getIntent()Landroid/content/Intent;

    move-result-object p1

    invoke-direct {p0, p1}, Lcom/motorola/ccc/ota/ui/BaseActivity;->addUpdatePreferenceFragment(Landroid/content/Intent;)V

    goto :goto_0

    :pswitch_1
    invoke-virtual {p0}, Lcom/motorola/ccc/ota/ui/BaseActivity;->getIntent()Landroid/content/Intent;

    move-result-object p1

    invoke-direct {p0, p1}, Lcom/motorola/ccc/ota/ui/BaseActivity;->addSmartUpdateFragment(Landroid/content/Intent;)V

    goto :goto_0

    :pswitch_2
    invoke-virtual {p0}, Lcom/motorola/ccc/ota/ui/BaseActivity;->getIntent()Landroid/content/Intent;

    move-result-object p1

    invoke-direct {p0, p1}, Lcom/motorola/ccc/ota/ui/BaseActivity;->addMergeRestartFragment(Landroid/content/Intent;)V

    goto :goto_0

    :pswitch_3
    invoke-virtual {p0}, Lcom/motorola/ccc/ota/ui/BaseActivity;->getIntent()Landroid/content/Intent;

    move-result-object p1

    invoke-direct {p0, p1}, Lcom/motorola/ccc/ota/ui/BaseActivity;->addRestartFragment(Landroid/content/Intent;)V

    goto :goto_0

    :pswitch_4
    invoke-virtual {p0}, Lcom/motorola/ccc/ota/ui/BaseActivity;->getIntent()Landroid/content/Intent;

    move-result-object p1

    invoke-direct {p0, p1}, Lcom/motorola/ccc/ota/ui/BaseActivity;->addBackgroundInstallationFragment(Landroid/content/Intent;)V

    goto :goto_0

    :pswitch_5
    invoke-virtual {p0}, Lcom/motorola/ccc/ota/ui/BaseActivity;->getIntent()Landroid/content/Intent;

    move-result-object p1

    invoke-direct {p0, p1}, Lcom/motorola/ccc/ota/ui/BaseActivity;->addDownloadProgressFragment(Landroid/content/Intent;)V

    goto :goto_0

    :pswitch_6
    invoke-virtual {p0}, Lcom/motorola/ccc/ota/ui/BaseActivity;->getIntent()Landroid/content/Intent;

    move-result-object p1

    invoke-direct {p0, p1}, Lcom/motorola/ccc/ota/ui/BaseActivity;->addDownloadFragment(Landroid/content/Intent;)V

    goto :goto_0

    :pswitch_7
    invoke-virtual {p0}, Lcom/motorola/ccc/ota/ui/BaseActivity;->getIntent()Landroid/content/Intent;

    move-result-object p1

    invoke-direct {p0, p1}, Lcom/motorola/ccc/ota/ui/BaseActivity;->addUpdateFailedFragment(Landroid/content/Intent;)V

    goto :goto_0

    :pswitch_8
    invoke-virtual {p0}, Lcom/motorola/ccc/ota/ui/BaseActivity;->getIntent()Landroid/content/Intent;

    move-result-object p1

    invoke-direct {p0, p1}, Lcom/motorola/ccc/ota/ui/BaseActivity;->addUpdateCompleteFragment(Landroid/content/Intent;)V

    :goto_0
    return-void

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_8
        :pswitch_7
        :pswitch_6
        :pswitch_5
        :pswitch_4
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method private performCheckUpdateAction(Landroid/os/Bundle;)V
    .locals 10

    const-string v0, "com.motorola.blur.service.blur.upgrade.check_error"

    invoke-virtual {p1, v0}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/motorola/ccc/ota/ui/BaseActivity;->errorCodeToRefresh:Ljava/lang/String;

    const v1, 0x7f0e00fd

    invoke-virtual {p0, v1}, Lcom/motorola/ccc/ota/ui/BaseActivity;->getString(I)Ljava/lang/String;

    move-result-object v1

    sget-object v2, Lcom/motorola/ccc/ota/ui/BaseActivity;->ERR_VAB_MERGE_PENDING:Ljava/lang/String;

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_0

    const p1, 0x7f0e012a

    invoke-virtual {p0, p1}, Lcom/motorola/ccc/ota/ui/BaseActivity;->getString(I)Ljava/lang/String;

    move-result-object p1

    const v0, 0x7f0e0129

    invoke-virtual {p0, v0}, Lcom/motorola/ccc/ota/ui/BaseActivity;->getString(I)Ljava/lang/String;

    move-result-object v0

    invoke-direct {p0, p1, v0}, Lcom/motorola/ccc/ota/ui/BaseActivity;->addCheckUpdateFragment(Ljava/lang/String;Ljava/lang/String;)V

    return-void

    :cond_0
    sget-object v2, Lcom/motorola/ccc/ota/ui/BaseActivity;->ERR_VAB_MERGE_RESTART:Ljava/lang/String;

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_1

    invoke-virtual {p0}, Lcom/motorola/ccc/ota/ui/BaseActivity;->getIntent()Landroid/content/Intent;

    move-result-object p1

    invoke-direct {p0, p1}, Lcom/motorola/ccc/ota/ui/BaseActivity;->addMergeRestartFragment(Landroid/content/Intent;)V

    return-void

    :cond_1
    sget-object v2, Lcom/motorola/ccc/ota/ui/BaseActivity;->ERR_ALREADY:Ljava/lang/String;

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    const/4 v4, 0x0

    if-eqz v3, :cond_2

    sput-boolean v4, Lcom/motorola/ccc/ota/ui/UpdaterUtils;->sDeviceIdleModeRequired:Z

    :cond_2
    sget-object v3, Lcom/motorola/ccc/ota/ui/BaseActivity;->ERR_OK:Ljava/lang/String;

    invoke-virtual {v3, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_2e

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_3

    goto/16 :goto_6

    :cond_3
    sget-object v2, Lcom/motorola/ccc/ota/ui/BaseActivity;->ERR_NET:Ljava/lang/String;

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    const v3, 0x7f0e0070

    const v5, 0x7f0e0052

    const/4 v6, 0x0

    if-eqz v2, :cond_9

    invoke-virtual {p0}, Lcom/motorola/ccc/ota/ui/BaseActivity;->getResources()Landroid/content/res/Resources;

    move-result-object p1

    const v0, 0x7f050003

    invoke-virtual {p1, v0}, Landroid/content/res/Resources;->getBoolean(I)Z

    move-result p1

    const v0, 0x7f0e0072

    const-string v2, "2024.2"

    const v7, 0x7f0e0071

    if-eqz p1, :cond_7

    const-string p1, "connectivity"

    invoke-virtual {p0, p1}, Lcom/motorola/ccc/ota/ui/BaseActivity;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Landroid/net/ConnectivityManager;

    invoke-virtual {p1}, Landroid/net/ConnectivityManager;->getAllNetworks()[Landroid/net/Network;

    move-result-object v8

    :goto_0
    array-length v9, v8

    if-ge v4, v9, :cond_2c

    aget-object v6, v8, v4

    invoke-virtual {p1, v6}, Landroid/net/ConnectivityManager;->getNetworkCapabilities(Landroid/net/Network;)Landroid/net/NetworkCapabilities;

    move-result-object v6

    if-eqz v6, :cond_5

    const/16 v9, 0xc

    invoke-virtual {v6, v9}, Landroid/net/NetworkCapabilities;->hasCapability(I)Z

    move-result v9

    if-eqz v9, :cond_4

    const/4 v9, 0x1

    invoke-virtual {v6, v9}, Landroid/net/NetworkCapabilities;->hasTransport(I)Z

    move-result v6

    if-eqz v6, :cond_4

    invoke-virtual {p0, v3}, Lcom/motorola/ccc/ota/ui/BaseActivity;->getString(I)Ljava/lang/String;

    move-result-object v6

    goto :goto_1

    :cond_4
    invoke-virtual {p0, v5}, Lcom/motorola/ccc/ota/ui/BaseActivity;->getString(I)Ljava/lang/String;

    move-result-object v1

    const v6, 0x7f0e007b

    invoke-virtual {p0, v6}, Lcom/motorola/ccc/ota/ui/BaseActivity;->getString(I)Ljava/lang/String;

    move-result-object v6

    goto :goto_1

    :cond_5
    invoke-virtual {p0, v5}, Lcom/motorola/ccc/ota/ui/BaseActivity;->getString(I)Ljava/lang/String;

    move-result-object v1

    invoke-static {}, Lcom/motorola/ccc/ota/ui/UpdaterUtils;->isVerizon()Z

    move-result v6

    if-eqz v6, :cond_6

    invoke-static {v2}, Lcom/motorola/otalib/common/utils/BuildPropertyUtils;->isProductWaveAtleastRefWave(Ljava/lang/String;)Z

    move-result v6

    if-nez v6, :cond_6

    invoke-virtual {p0, v0}, Lcom/motorola/ccc/ota/ui/BaseActivity;->getString(I)Ljava/lang/String;

    move-result-object v6

    goto :goto_1

    :cond_6
    invoke-virtual {p0, v7}, Lcom/motorola/ccc/ota/ui/BaseActivity;->getString(I)Ljava/lang/String;

    move-result-object v6

    :goto_1
    add-int/lit8 v4, v4, 0x1

    goto :goto_0

    :cond_7
    invoke-virtual {p0, v5}, Lcom/motorola/ccc/ota/ui/BaseActivity;->getString(I)Ljava/lang/String;

    move-result-object v1

    invoke-static {}, Lcom/motorola/ccc/ota/ui/UpdaterUtils;->isVerizon()Z

    move-result p1

    if-eqz p1, :cond_8

    invoke-static {v2}, Lcom/motorola/otalib/common/utils/BuildPropertyUtils;->isProductWaveAtleastRefWave(Ljava/lang/String;)Z

    move-result p1

    if-nez p1, :cond_8

    invoke-virtual {p0, v0}, Lcom/motorola/ccc/ota/ui/BaseActivity;->getString(I)Ljava/lang/String;

    move-result-object v6

    goto/16 :goto_5

    :cond_8
    invoke-virtual {p0, v7}, Lcom/motorola/ccc/ota/ui/BaseActivity;->getString(I)Ljava/lang/String;

    move-result-object v6

    goto/16 :goto_5

    :cond_9
    sget-object v2, Lcom/motorola/ccc/ota/ui/BaseActivity;->ERR_REQUESTING:Ljava/lang/String;

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-nez v4, :cond_29

    sget-object v4, Lcom/motorola/ccc/ota/ui/BaseActivity;->ERR_VAB_VALIDATION:Ljava/lang/String;

    invoke-virtual {v4, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_a

    goto/16 :goto_3

    :cond_a
    sget-object v2, Lcom/motorola/ccc/ota/ui/BaseActivity;->ERR_DOWNLOADING:Ljava/lang/String;

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    const-string v4, "com.motorola.blur.service.blur.check_response_intent"

    if-eqz v2, :cond_d

    invoke-static {}, Lcom/motorola/ccc/ota/utils/BuildPropReader;->isFotaATT()Z

    move-result v0

    if-eqz v0, :cond_b

    const p1, 0x7f0e0079

    invoke-virtual {p0, p1}, Lcom/motorola/ccc/ota/ui/BaseActivity;->getString(I)Ljava/lang/String;

    move-result-object v1

    const p1, 0x7f0e006e

    invoke-virtual {p0, p1}, Lcom/motorola/ccc/ota/ui/BaseActivity;->getString(I)Ljava/lang/String;

    move-result-object v6

    goto/16 :goto_5

    :cond_b
    invoke-virtual {p1, v4}, Landroid/os/Bundle;->getParcelable(Ljava/lang/String;)Landroid/os/Parcelable;

    move-result-object v0

    if-eqz v0, :cond_c

    invoke-virtual {p1, v4}, Landroid/os/Bundle;->getParcelable(Ljava/lang/String;)Landroid/os/Parcelable;

    move-result-object p1

    check-cast p1, Landroid/content/Intent;

    invoke-direct {p0, p1}, Lcom/motorola/ccc/ota/ui/BaseActivity;->addDownloadProgressFragment(Landroid/content/Intent;)V

    goto/16 :goto_5

    :cond_c
    invoke-virtual {p0}, Lcom/motorola/ccc/ota/ui/BaseActivity;->getIntent()Landroid/content/Intent;

    move-result-object p1

    invoke-direct {p0, p1}, Lcom/motorola/ccc/ota/ui/BaseActivity;->addDownloadProgressFragment(Landroid/content/Intent;)V

    goto/16 :goto_5

    :cond_d
    sget-object v2, Lcom/motorola/ccc/ota/ui/BaseActivity;->ERR_CONTACTSERVER:Ljava/lang/String;

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_e

    const p1, 0x7f0e00db

    invoke-virtual {p0, p1}, Lcom/motorola/ccc/ota/ui/BaseActivity;->getString(I)Ljava/lang/String;

    move-result-object v1

    const p1, 0x7f0e0074

    invoke-virtual {p0, p1}, Lcom/motorola/ccc/ota/ui/BaseActivity;->getString(I)Ljava/lang/String;

    move-result-object v6

    goto/16 :goto_5

    :cond_e
    sget-object v2, Lcom/motorola/ccc/ota/ui/BaseActivity;->ERR_POLICY_SET:Ljava/lang/String;

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_f

    const p1, 0x7f0e0146

    invoke-virtual {p0, p1}, Lcom/motorola/ccc/ota/ui/BaseActivity;->getString(I)Ljava/lang/String;

    move-result-object v6

    goto/16 :goto_5

    :cond_f
    sget-object v2, Lcom/motorola/ccc/ota/ui/BaseActivity;->ERR_NOTFOUND:Ljava/lang/String;

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    const v7, 0x7f0900c3

    if-eqz v2, :cond_11

    new-instance p1, Landroid/content/Intent;

    const-string v0, "com.motorola.ccc.ota.ALREADY_UP_TO_DATE"

    invoke-direct {p1, v0}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    invoke-static {}, Lcom/motorola/ccc/ota/env/OtaApplication;->getGlobalContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0, p1}, Lcom/motorola/ccc/ota/utils/SystemUpdateStatusUtils;->storeOngoingSystemUpdateStatus(Landroid/content/Context;Landroid/content/Intent;)V

    iget-object p1, p0, Lcom/motorola/ccc/ota/ui/BaseActivity;->settings:Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    sget-object v0, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->FLAG_IS_VITAL_UPDATE:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    invoke-virtual {p1, v0}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->getBoolean(Lcom/motorola/otalib/common/settings/ISetting;)Z

    move-result p1

    if-eqz p1, :cond_10

    invoke-static {p0}, Lcom/motorola/ccc/ota/ui/UpdaterUtils;->launchNextSetupActivityVitalUpdate(Landroid/content/Context;)V

    invoke-virtual {p0}, Lcom/motorola/ccc/ota/ui/BaseActivity;->finish()V

    return-void

    :cond_10
    iget-object p1, p0, Lcom/motorola/ccc/ota/ui/BaseActivity;->fragmentManager:Landroidx/fragment/app/FragmentManager;

    invoke-virtual {p1}, Landroidx/fragment/app/FragmentManager;->beginTransaction()Landroidx/fragment/app/FragmentTransaction;

    move-result-object p1

    iput-object p1, p0, Lcom/motorola/ccc/ota/ui/BaseActivity;->fragmentTransaction:Landroidx/fragment/app/FragmentTransaction;

    new-instance p1, Lcom/motorola/ccc/ota/ui/UptoDateFragment;

    invoke-direct {p1}, Lcom/motorola/ccc/ota/ui/UptoDateFragment;-><init>()V

    iget-object v0, p0, Lcom/motorola/ccc/ota/ui/BaseActivity;->fragmentTransaction:Landroidx/fragment/app/FragmentTransaction;

    invoke-virtual {v0, v7, p1}, Landroidx/fragment/app/FragmentTransaction;->replace(ILandroidx/fragment/app/Fragment;)Landroidx/fragment/app/FragmentTransaction;

    invoke-virtual {p0}, Lcom/motorola/ccc/ota/ui/BaseActivity;->commit()V

    goto/16 :goto_5

    :cond_11
    sget-object v2, Lcom/motorola/ccc/ota/ui/BaseActivity;->ERR_NOTFOUND_BOOT_UNLOCK:Ljava/lang/String;

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_28

    sget-object v2, Lcom/motorola/ccc/ota/ui/BaseActivity;->ERR_NOTFOUND_ROOTED:Ljava/lang/String;

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_12

    goto/16 :goto_2

    :cond_12
    sget-object v2, Lcom/motorola/ccc/ota/ui/BaseActivity;->ERR_VU_WIFI_ONLY_WIFI_NOT_AVAILABLE:Ljava/lang/String;

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_13

    invoke-virtual {p0}, Lcom/motorola/ccc/ota/ui/BaseActivity;->getIntent()Landroid/content/Intent;

    move-result-object p1

    const-string v0, ""

    invoke-direct {p0, p1, v0, v0}, Lcom/motorola/ccc/ota/ui/BaseActivity;->addErrorFragment(Landroid/content/Intent;Ljava/lang/String;Ljava/lang/String;)V

    goto/16 :goto_5

    :cond_13
    sget-object v2, Lcom/motorola/ccc/ota/ui/BaseActivity;->ERR_NOTFOUND_DEVICE_CORRUPTED:Ljava/lang/String;

    invoke-virtual {v2, v0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_14

    invoke-virtual {p0}, Lcom/motorola/ccc/ota/ui/BaseActivity;->getIntent()Landroid/content/Intent;

    move-result-object p1

    const v0, 0x7f0e00b7

    invoke-virtual {p0, v0}, Lcom/motorola/ccc/ota/ui/BaseActivity;->getString(I)Ljava/lang/String;

    move-result-object v0

    const v2, 0x7f0e00b6

    invoke-virtual {p0, v2}, Lcom/motorola/ccc/ota/ui/BaseActivity;->getString(I)Ljava/lang/String;

    move-result-object v2

    invoke-direct {p0, p1, v0, v2}, Lcom/motorola/ccc/ota/ui/BaseActivity;->addErrorFragment(Landroid/content/Intent;Ljava/lang/String;Ljava/lang/String;)V

    goto/16 :goto_5

    :cond_14
    sget-object v2, Lcom/motorola/ccc/ota/ui/BaseActivity;->ERR_VERITY_DISABLED:Ljava/lang/String;

    invoke-virtual {v2, v0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_15

    invoke-virtual {p0}, Lcom/motorola/ccc/ota/ui/BaseActivity;->getIntent()Landroid/content/Intent;

    move-result-object p1

    const v0, 0x7f0e01ee

    invoke-virtual {p0, v0}, Lcom/motorola/ccc/ota/ui/BaseActivity;->getString(I)Ljava/lang/String;

    move-result-object v0

    const v2, 0x7f0e01ed

    invoke-virtual {p0, v2}, Lcom/motorola/ccc/ota/ui/BaseActivity;->getString(I)Ljava/lang/String;

    move-result-object v2

    invoke-direct {p0, p1, v0, v2}, Lcom/motorola/ccc/ota/ui/BaseActivity;->addErrorFragment(Landroid/content/Intent;Ljava/lang/String;Ljava/lang/String;)V

    goto/16 :goto_5

    :cond_15
    sget-object v2, Lcom/motorola/ccc/ota/ui/BaseActivity;->ERR_NOTFOUND_ADV_NOTICE:Ljava/lang/String;

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_17

    iget-object p1, p0, Lcom/motorola/ccc/ota/ui/BaseActivity;->settings:Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    sget-object v0, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->FLAG_IS_VITAL_UPDATE:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    invoke-virtual {p1, v0}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->getBoolean(Lcom/motorola/otalib/common/settings/ISetting;)Z

    move-result p1

    if-eqz p1, :cond_16

    invoke-static {p0}, Lcom/motorola/ccc/ota/ui/UpdaterUtils;->launchNextSetupActivityVitalUpdate(Landroid/content/Context;)V

    invoke-virtual {p0}, Lcom/motorola/ccc/ota/ui/BaseActivity;->finish()V

    return-void

    :cond_16
    iget-object p1, p0, Lcom/motorola/ccc/ota/ui/BaseActivity;->fragmentManager:Landroidx/fragment/app/FragmentManager;

    invoke-virtual {p1}, Landroidx/fragment/app/FragmentManager;->beginTransaction()Landroidx/fragment/app/FragmentTransaction;

    move-result-object p1

    iput-object p1, p0, Lcom/motorola/ccc/ota/ui/BaseActivity;->fragmentTransaction:Landroidx/fragment/app/FragmentTransaction;

    new-instance p1, Lcom/motorola/ccc/ota/ui/AdvNoticeFragment;

    invoke-direct {p1}, Lcom/motorola/ccc/ota/ui/AdvNoticeFragment;-><init>()V

    iget-object v0, p0, Lcom/motorola/ccc/ota/ui/BaseActivity;->fragmentTransaction:Landroidx/fragment/app/FragmentTransaction;

    invoke-virtual {v0, v7, p1}, Landroidx/fragment/app/FragmentTransaction;->replace(ILandroidx/fragment/app/Fragment;)Landroidx/fragment/app/FragmentTransaction;

    invoke-virtual {p0}, Lcom/motorola/ccc/ota/ui/BaseActivity;->commit()V

    goto/16 :goto_5

    :cond_17
    sget-object v2, Lcom/motorola/ccc/ota/ui/BaseActivity;->ERR_NOTFOUND_EOL:Ljava/lang/String;

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_19

    iget-object p1, p0, Lcom/motorola/ccc/ota/ui/BaseActivity;->settings:Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    sget-object v0, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->FLAG_IS_VITAL_UPDATE:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    invoke-virtual {p1, v0}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->getBoolean(Lcom/motorola/otalib/common/settings/ISetting;)Z

    move-result p1

    if-eqz p1, :cond_18

    invoke-static {p0}, Lcom/motorola/ccc/ota/ui/UpdaterUtils;->launchNextSetupActivityVitalUpdate(Landroid/content/Context;)V

    invoke-virtual {p0}, Lcom/motorola/ccc/ota/ui/BaseActivity;->finish()V

    return-void

    :cond_18
    iget-object p1, p0, Lcom/motorola/ccc/ota/ui/BaseActivity;->fragmentManager:Landroidx/fragment/app/FragmentManager;

    invoke-virtual {p1}, Landroidx/fragment/app/FragmentManager;->beginTransaction()Landroidx/fragment/app/FragmentTransaction;

    move-result-object p1

    iput-object p1, p0, Lcom/motorola/ccc/ota/ui/BaseActivity;->fragmentTransaction:Landroidx/fragment/app/FragmentTransaction;

    new-instance p1, Lcom/motorola/ccc/ota/ui/EOLFragment;

    invoke-direct {p1}, Lcom/motorola/ccc/ota/ui/EOLFragment;-><init>()V

    iget-object v0, p0, Lcom/motorola/ccc/ota/ui/BaseActivity;->fragmentTransaction:Landroidx/fragment/app/FragmentTransaction;

    invoke-virtual {v0, v7, p1}, Landroidx/fragment/app/FragmentTransaction;->replace(ILandroidx/fragment/app/Fragment;)Landroidx/fragment/app/FragmentTransaction;

    invoke-virtual {p0}, Lcom/motorola/ccc/ota/ui/BaseActivity;->commit()V

    goto/16 :goto_5

    :cond_19
    sget-object v2, Lcom/motorola/ccc/ota/ui/BaseActivity;->ERR_TEMP:Ljava/lang/String;

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_1a

    const p1, 0x7f0e00dd

    invoke-virtual {p0, p1}, Lcom/motorola/ccc/ota/ui/BaseActivity;->getString(I)Ljava/lang/String;

    move-result-object v1

    const p1, 0x7f0e0077

    invoke-virtual {p0, p1}, Lcom/motorola/ccc/ota/ui/BaseActivity;->getString(I)Ljava/lang/String;

    move-result-object v6

    goto/16 :goto_5

    :cond_1a
    sget-object v2, Lcom/motorola/ccc/ota/ui/BaseActivity;->ERR_FAIL:Ljava/lang/String;

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    const v7, 0x7f0e00de

    if-eqz v2, :cond_1b

    invoke-virtual {p0, v7}, Lcom/motorola/ccc/ota/ui/BaseActivity;->getString(I)Ljava/lang/String;

    move-result-object v1

    const p1, 0x7f0e006f

    invoke-virtual {p0, p1}, Lcom/motorola/ccc/ota/ui/BaseActivity;->getString(I)Ljava/lang/String;

    move-result-object v6

    goto/16 :goto_5

    :cond_1b
    sget-object v2, Lcom/motorola/ccc/ota/ui/BaseActivity;->ERR_BADPARAM:Ljava/lang/String;

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_1c

    invoke-virtual {p0, v7}, Lcom/motorola/ccc/ota/ui/BaseActivity;->getString(I)Ljava/lang/String;

    move-result-object v1

    const p1, 0x7f0e006b

    invoke-virtual {p0, p1}, Lcom/motorola/ccc/ota/ui/BaseActivity;->getString(I)Ljava/lang/String;

    move-result-object v6

    goto/16 :goto_5

    :cond_1c
    sget-object v2, Lcom/motorola/ccc/ota/ui/BaseActivity;->ERR_WIFI_NEEDED:Ljava/lang/String;

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_1d

    invoke-virtual {p0, v5}, Lcom/motorola/ccc/ota/ui/BaseActivity;->getString(I)Ljava/lang/String;

    move-result-object v1

    const p1, 0x7f0e00d2

    invoke-virtual {p0, p1}, Lcom/motorola/ccc/ota/ui/BaseActivity;->getString(I)Ljava/lang/String;

    move-result-object v6

    goto/16 :goto_5

    :cond_1d
    sget-object v2, Lcom/motorola/ccc/ota/ui/BaseActivity;->ERR_INTERNAL:Ljava/lang/String;

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_1e

    invoke-virtual {p0, v3}, Lcom/motorola/ccc/ota/ui/BaseActivity;->getString(I)Ljava/lang/String;

    move-result-object v6

    goto/16 :goto_5

    :cond_1e
    sget-object v2, Lcom/motorola/ccc/ota/ui/BaseActivity;->ERR_INIT_OTA_SERVICE:Ljava/lang/String;

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_1f

    const p1, 0x7f0e010b

    invoke-virtual {p0, p1}, Lcom/motorola/ccc/ota/ui/BaseActivity;->getString(I)Ljava/lang/String;

    move-result-object p1

    const v0, 0x7f0e010a

    invoke-virtual {p0, v0}, Lcom/motorola/ccc/ota/ui/BaseActivity;->getString(I)Ljava/lang/String;

    move-result-object v0

    invoke-direct {p0, p1, v0}, Lcom/motorola/ccc/ota/ui/BaseActivity;->addCheckUpdateFragment(Ljava/lang/String;Ljava/lang/String;)V

    goto/16 :goto_5

    :cond_1f
    sget-object v2, Lcom/motorola/ccc/ota/ui/BaseActivity;->ERR_ROAMING:Ljava/lang/String;

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_20

    const p1, 0x7f0e00fc

    invoke-virtual {p0, p1}, Lcom/motorola/ccc/ota/ui/BaseActivity;->getString(I)Ljava/lang/String;

    move-result-object v1

    const p1, 0x7f0e0075

    invoke-virtual {p0, p1}, Lcom/motorola/ccc/ota/ui/BaseActivity;->getString(I)Ljava/lang/String;

    move-result-object v6

    goto/16 :goto_5

    :cond_20
    sget-object v2, Lcom/motorola/ccc/ota/ui/BaseActivity;->ERR_IN_CALL:Ljava/lang/String;

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_21

    const p1, 0x7f0e00e4

    invoke-virtual {p0, p1}, Lcom/motorola/ccc/ota/ui/BaseActivity;->getString(I)Ljava/lang/String;

    move-result-object v1

    const p1, 0x7f0e00e3

    invoke-virtual {p0, p1}, Lcom/motorola/ccc/ota/ui/BaseActivity;->getString(I)Ljava/lang/String;

    move-result-object v6

    goto/16 :goto_5

    :cond_21
    sget-object v2, Lcom/motorola/ccc/ota/ui/BaseActivity;->ERR_STORAGE_LOW:Ljava/lang/String;

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_22

    const p1, 0x7f0e00dc

    invoke-virtual {p0, p1}, Lcom/motorola/ccc/ota/ui/BaseActivity;->getString(I)Ljava/lang/String;

    move-result-object v1

    const p1, 0x7f0e0076

    invoke-virtual {p0, p1}, Lcom/motorola/ccc/ota/ui/BaseActivity;->getString(I)Ljava/lang/String;

    move-result-object v6

    goto/16 :goto_5

    :cond_22
    sget-object v2, Lcom/motorola/ccc/ota/ui/BaseActivity;->ERR_BACKGROUND_INSTALL:Ljava/lang/String;

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_24

    invoke-virtual {p1, v4}, Landroid/os/Bundle;->getParcelable(Ljava/lang/String;)Landroid/os/Parcelable;

    move-result-object v0

    if-eqz v0, :cond_23

    invoke-virtual {p1, v4}, Landroid/os/Bundle;->getParcelable(Ljava/lang/String;)Landroid/os/Parcelable;

    move-result-object p1

    check-cast p1, Landroid/content/Intent;

    invoke-direct {p0, p1}, Lcom/motorola/ccc/ota/ui/BaseActivity;->addBackgroundInstallationFragment(Landroid/content/Intent;)V

    goto/16 :goto_5

    :cond_23
    invoke-virtual {p0}, Lcom/motorola/ccc/ota/ui/BaseActivity;->getIntent()Landroid/content/Intent;

    move-result-object p1

    invoke-direct {p0, p1}, Lcom/motorola/ccc/ota/ui/BaseActivity;->addBackgroundInstallationFragment(Landroid/content/Intent;)V

    goto/16 :goto_5

    :cond_24
    sget-object p1, Lcom/motorola/ccc/ota/ui/BaseActivity;->ERR_VAB_VALIDATION_SUCCESS:Ljava/lang/String;

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_25

    const p1, 0x7f0e01ea

    invoke-virtual {p0, p1}, Lcom/motorola/ccc/ota/ui/BaseActivity;->getString(I)Ljava/lang/String;

    move-result-object v1

    const p1, 0x7f0e01e9

    invoke-virtual {p0, p1}, Lcom/motorola/ccc/ota/ui/BaseActivity;->getString(I)Ljava/lang/String;

    move-result-object v6

    goto/16 :goto_5

    :cond_25
    sget-object p1, Lcom/motorola/ccc/ota/ui/BaseActivity;->ERR_VAB_VALIDATION_FAILURE:Ljava/lang/String;

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_26

    const p1, 0x7f0e01e8

    invoke-virtual {p0, p1}, Lcom/motorola/ccc/ota/ui/BaseActivity;->getString(I)Ljava/lang/String;

    move-result-object v1

    const p1, 0x7f0e01e7

    invoke-virtual {p0, p1}, Lcom/motorola/ccc/ota/ui/BaseActivity;->getString(I)Ljava/lang/String;

    move-result-object v6

    goto :goto_5

    :cond_26
    sget-object p1, Lcom/motorola/ccc/ota/ui/BaseActivity;->ERR_CTA_BG_DATA_DISABLED:Ljava/lang/String;

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_2c

    iget-object p1, p0, Lcom/motorola/ccc/ota/ui/BaseActivity;->settings:Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    sget-object v0, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->FLAG_IS_VITAL_UPDATE:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    invoke-virtual {p1, v0}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->getBoolean(Lcom/motorola/otalib/common/settings/ISetting;)Z

    move-result p1

    if-eqz p1, :cond_27

    invoke-static {p0}, Lcom/motorola/ccc/ota/ui/UpdaterUtils;->launchNextSetupActivityVitalUpdate(Landroid/content/Context;)V

    invoke-virtual {p0}, Lcom/motorola/ccc/ota/ui/BaseActivity;->finish()V

    return-void

    :cond_27
    invoke-direct {p0}, Lcom/motorola/ccc/ota/ui/BaseActivity;->showPermissionDialog()V

    goto :goto_5

    :cond_28
    :goto_2
    invoke-virtual {p0}, Lcom/motorola/ccc/ota/ui/BaseActivity;->getIntent()Landroid/content/Intent;

    move-result-object p1

    const v0, 0x7f0e005b

    invoke-virtual {p0, v0}, Lcom/motorola/ccc/ota/ui/BaseActivity;->getString(I)Ljava/lang/String;

    move-result-object v0

    const v2, 0x7f0e005a

    invoke-virtual {p0, v2}, Lcom/motorola/ccc/ota/ui/BaseActivity;->getString(I)Ljava/lang/String;

    move-result-object v2

    invoke-direct {p0, p1, v0, v2}, Lcom/motorola/ccc/ota/ui/BaseActivity;->addErrorFragment(Landroid/content/Intent;Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_5

    :cond_29
    :goto_3
    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    const v0, 0x7f0e006c

    if-eqz p1, :cond_2b

    iget-object p1, p0, Lcom/motorola/ccc/ota/ui/BaseActivity;->settings:Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    sget-object v2, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->FLAG_IS_VITAL_UPDATE:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    invoke-virtual {p1, v2}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->getBoolean(Lcom/motorola/otalib/common/settings/ISetting;)Z

    move-result p1

    if-eqz p1, :cond_2a

    const v0, 0x7f0e01f3

    const p1, 0x7f0e01f4

    goto :goto_4

    :cond_2a
    const p1, 0x7f0e0078

    goto :goto_4

    :cond_2b
    const p1, 0x7f0e007a

    :goto_4
    invoke-virtual {p0, v0}, Lcom/motorola/ccc/ota/ui/BaseActivity;->getString(I)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, p1}, Lcom/motorola/ccc/ota/ui/BaseActivity;->getString(I)Ljava/lang/String;

    move-result-object p1

    invoke-direct {p0, v0, p1}, Lcom/motorola/ccc/ota/ui/BaseActivity;->addCheckUpdateFragment(Ljava/lang/String;Ljava/lang/String;)V

    :cond_2c
    :goto_5
    if-eqz v6, :cond_2d

    invoke-virtual {p0}, Lcom/motorola/ccc/ota/ui/BaseActivity;->getIntent()Landroid/content/Intent;

    move-result-object p1

    invoke-direct {p0, p1, v1, v6}, Lcom/motorola/ccc/ota/ui/BaseActivity;->addErrorFragment(Landroid/content/Intent;Ljava/lang/String;Ljava/lang/String;)V

    :cond_2d
    return-void

    :cond_2e
    :goto_6
    invoke-static {}, Lcom/motorola/ccc/ota/utils/BuildPropReader;->isFotaATT()Z

    move-result p1

    if-eqz p1, :cond_2f

    invoke-virtual {p0}, Lcom/motorola/ccc/ota/ui/BaseActivity;->finish()V

    :cond_2f
    return-void
.end method

.method private registerActionUpdateReceiver()V
    .locals 3

    iget-object v0, p0, Lcom/motorola/ccc/ota/ui/BaseActivity;->updateReceiver:Landroid/content/BroadcastReceiver;

    if-nez v0, :cond_0

    new-instance v0, Landroid/content/IntentFilter;

    const-string v1, "com.motorola.blur.service.blur.Actions.UPGRADE_ACTION_UPDATE_RESPONSE"

    invoke-direct {v0, v1}, Landroid/content/IntentFilter;-><init>(Ljava/lang/String;)V

    new-instance v1, Lcom/motorola/ccc/ota/ui/BaseActivity$1;

    invoke-direct {v1, p0}, Lcom/motorola/ccc/ota/ui/BaseActivity$1;-><init>(Lcom/motorola/ccc/ota/ui/BaseActivity;)V

    iput-object v1, p0, Lcom/motorola/ccc/ota/ui/BaseActivity;->updateReceiver:Landroid/content/BroadcastReceiver;

    const/4 v2, 0x2

    invoke-virtual {p0, v1, v0, v2}, Lcom/motorola/ccc/ota/ui/BaseActivity;->registerReceiver(Landroid/content/BroadcastReceiver;Landroid/content/IntentFilter;I)Landroid/content/Intent;

    :cond_0
    return-void
.end method

.method private showPermissionDialog()V
    .locals 4

    new-instance v0, Landroidx/appcompat/app/AlertDialog$Builder;

    invoke-direct {v0, p0}, Landroidx/appcompat/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    invoke-virtual {p0}, Lcom/motorola/ccc/ota/ui/BaseActivity;->getLayoutInflater()Landroid/view/LayoutInflater;

    move-result-object v1

    const v2, 0x7f0c0025

    const/4 v3, 0x0

    invoke-virtual {v1, v2, v3}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroidx/appcompat/app/AlertDialog$Builder;->setView(Landroid/view/View;)Landroidx/appcompat/app/AlertDialog$Builder;

    invoke-virtual {v0}, Landroidx/appcompat/app/AlertDialog$Builder;->create()Landroidx/appcompat/app/AlertDialog;

    move-result-object v0

    const v2, 0x7f090056

    invoke-virtual {v1, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v2

    check-cast v2, Landroid/widget/Button;

    const v3, 0x7f090055

    invoke-virtual {v1, v3}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/Button;

    new-instance v3, Lcom/motorola/ccc/ota/ui/BaseActivity$$ExternalSyntheticLambda0;

    invoke-direct {v3, p0, v0}, Lcom/motorola/ccc/ota/ui/BaseActivity$$ExternalSyntheticLambda0;-><init>(Lcom/motorola/ccc/ota/ui/BaseActivity;Landroidx/appcompat/app/AlertDialog;)V

    invoke-virtual {v1, v3}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    new-instance v1, Lcom/motorola/ccc/ota/ui/BaseActivity$$ExternalSyntheticLambda1;

    invoke-direct {v1, p0}, Lcom/motorola/ccc/ota/ui/BaseActivity$$ExternalSyntheticLambda1;-><init>(Lcom/motorola/ccc/ota/ui/BaseActivity;)V

    invoke-virtual {v2, v1}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    invoke-static {p0, v0}, Lcom/motorola/ccc/ota/ui/UpdaterUtils;->setCornersRounded(Landroid/content/Context;Landroidx/appcompat/app/AlertDialog;)V

    invoke-virtual {v0}, Landroidx/appcompat/app/AlertDialog;->show()V

    return-void
.end method


# virtual methods
.method commit()V
    .locals 0

    iget-object p0, p0, Lcom/motorola/ccc/ota/ui/BaseActivity;->fragmentTransaction:Landroidx/fragment/app/FragmentTransaction;

    invoke-virtual {p0}, Landroidx/fragment/app/FragmentTransaction;->commit()I

    return-void
.end method

.method public dispatchTouchEvent(Landroid/view/MotionEvent;)Z
    .locals 1

    :try_start_0
    invoke-super {p0, p1}, Landroidx/appcompat/app/AppCompatActivity;->dispatchTouchEvent(Landroid/view/MotionEvent;)Z
    :try_end_0
    .catch Landroid/content/ActivityNotFoundException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception p0

    new-instance p1, Ljava/lang/StringBuilder;

    const-string v0, "Exception caught "

    invoke-direct {p1, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p0}, Landroid/content/ActivityNotFoundException;->getMessage()Ljava/lang/String;

    move-result-object p0

    invoke-virtual {p1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    const-string p1, "OtaApp"

    invoke-static {p1, p0}, Lcom/motorola/ccc/ota/utils/Logger;->error(Ljava/lang/String;Ljava/lang/String;)V

    :goto_0
    const/4 p0, 0x1

    return p0
.end method

.method synthetic lambda$showPermissionDialog$0$com-motorola-ccc-ota-ui-BaseActivity(Landroidx/appcompat/app/AlertDialog;Landroid/view/View;)V
    .locals 2

    new-instance p2, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    invoke-direct {p2}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;-><init>()V

    sget-object v0, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->SETUP_TOS_ACCEPTED:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    const/4 v1, 0x1

    invoke-virtual {p2, v0, v1}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->setBoolean(Lcom/motorola/otalib/common/settings/ISetting;Z)V

    new-instance p2, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    invoke-direct {p2}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;-><init>()V

    sget-object v0, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->USER_ACCEPTED_CTA_BG_DATA:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    invoke-virtual {p2, v0, v1}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->setBoolean(Lcom/motorola/otalib/common/settings/ISetting;Z)V

    const/4 p2, 0x0

    invoke-direct {p0, p2}, Lcom/motorola/ccc/ota/ui/BaseActivity;->initFragment(Lcom/motorola/ccc/ota/utils/UpgradeUtilConstants$FragmentTypeEnum;)V

    invoke-virtual {p1}, Landroidx/appcompat/app/AlertDialog;->dismiss()V

    return-void
.end method

.method synthetic lambda$showPermissionDialog$1$com-motorola-ccc-ota-ui-BaseActivity(Landroid/view/View;)V
    .locals 0

    invoke-virtual {p0}, Lcom/motorola/ccc/ota/ui/BaseActivity;->finish()V

    return-void
.end method

.method public onActionPerformed()V
    .locals 0

    invoke-virtual {p0}, Lcom/motorola/ccc/ota/ui/BaseActivity;->finish()V

    return-void
.end method

.method public onCreate(Landroid/os/Bundle;)V
    .locals 7

    invoke-super {p0, p1}, Landroidx/appcompat/app/AppCompatActivity;->onCreate(Landroid/os/Bundle;)V

    new-instance p1, Ljava/lang/StringBuilder;

    const-string v0, "BaseActivity, onCreate: Intent Action"

    invoke-direct {p1, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p0}, Lcom/motorola/ccc/ota/ui/BaseActivity;->getIntent()Landroid/content/Intent;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    const-string v0, "OtaApp"

    invoke-static {v0, p1}, Lcom/motorola/ccc/ota/utils/Logger;->debug(Ljava/lang/String;Ljava/lang/String;)V

    const/4 p1, 0x1

    iput-boolean p1, p0, Lcom/motorola/ccc/ota/ui/BaseActivity;->isRunning:Z

    new-instance v1, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    invoke-direct {v1}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;-><init>()V

    iput-object v1, p0, Lcom/motorola/ccc/ota/ui/BaseActivity;->settings:Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    invoke-static {}, Lcom/motorola/ccc/ota/env/OtaApplication;->getGlobalContext()Landroid/content/Context;

    move-result-object v1

    invoke-static {p0}, Lcom/motorola/ccc/ota/utils/UpgradeUtilMethods;->isSystemUser(Landroid/content/Context;)Z

    move-result v2

    if-nez v2, :cond_0

    const v0, 0x7f0e0073

    invoke-virtual {p0, v0}, Lcom/motorola/ccc/ota/ui/BaseActivity;->getString(I)Ljava/lang/String;

    move-result-object v0

    invoke-static {p0, v0, p1}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object p1

    invoke-virtual {p1}, Landroid/widget/Toast;->show()V

    invoke-virtual {p0}, Lcom/motorola/ccc/ota/ui/BaseActivity;->finish()V

    return-void

    :cond_0
    invoke-virtual {p0}, Lcom/motorola/ccc/ota/ui/BaseActivity;->getIntent()Landroid/content/Intent;

    move-result-object v2

    invoke-virtual {v2}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object v2

    const-string v3, "com.motorola.ccc.ota.CHECK_FOR_VITAL_UPDATE"

    invoke-virtual {v3, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    const-string v3, "com.motorola.ccc.ota.SERVICE_STARTED_ON_CHK_UPDATE"

    if-eqz v2, :cond_3

    new-instance v2, Lcom/motorola/ccc/ota/env/OtaMainBroadcastReceiver;

    invoke-direct {v2}, Lcom/motorola/ccc/ota/env/OtaMainBroadcastReceiver;-><init>()V

    invoke-static {p0, v2}, Lcom/motorola/ccc/ota/env/CusAndroidUtils;->registerCheckUpdateActions(Landroid/content/Context;Landroid/content/BroadcastReceiver;)V

    invoke-static {v1}, Lcom/motorola/ccc/ota/ui/UpdaterUtils;->isOtaServiceRunning(Landroid/content/Context;)Z

    move-result v2

    if-nez v2, :cond_1

    const-string v2, "OTA service is started for vital check update"

    invoke-static {v0, v2}, Lcom/motorola/ccc/ota/utils/Logger;->debug(Ljava/lang/String;Ljava/lang/String;)V

    new-instance v2, Landroid/content/Intent;

    const-class v4, Lcom/motorola/ccc/ota/env/OtaService;

    invoke-direct {v2, p0, v4}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    invoke-virtual {v2, v3, p1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Z)Landroid/content/Intent;

    invoke-virtual {p0, v2}, Lcom/motorola/ccc/ota/ui/BaseActivity;->startService(Landroid/content/Intent;)Landroid/content/ComponentName;

    :cond_1
    iget-object v2, p0, Lcom/motorola/ccc/ota/ui/BaseActivity;->settings:Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    sget-object v4, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->INITIAL_SETUP_COMPLETED:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    invoke-virtual {v2, v4}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->getBoolean(Lcom/motorola/otalib/common/settings/ISetting;)Z

    move-result v2

    if-nez v2, :cond_2

    iget-object v2, p0, Lcom/motorola/ccc/ota/ui/BaseActivity;->settings:Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    sget-object v4, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->FLAG_IS_VITAL_UPDATE:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    invoke-virtual {v2, v4, p1}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->setBoolean(Lcom/motorola/otalib/common/settings/ISetting;Z)V

    iget-object v2, p0, Lcom/motorola/ccc/ota/ui/BaseActivity;->settings:Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    invoke-virtual {v2}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->setVitalUpdateValues()V

    invoke-virtual {p0}, Lcom/motorola/ccc/ota/ui/BaseActivity;->getIntent()Landroid/content/Intent;

    move-result-object v2

    sput-object v2, Lcom/motorola/ccc/ota/ui/BaseActivity;->vitalUpdateLaunchIntent:Landroid/content/Intent;

    goto :goto_0

    :cond_2
    invoke-virtual {p0}, Lcom/motorola/ccc/ota/ui/BaseActivity;->getIntent()Landroid/content/Intent;

    move-result-object p1

    sput-object p1, Lcom/motorola/ccc/ota/ui/BaseActivity;->vitalUpdateLaunchIntent:Landroid/content/Intent;

    invoke-static {p0}, Lcom/motorola/ccc/ota/ui/UpdaterUtils;->launchNextSetupActivityVitalUpdate(Landroid/content/Context;)V

    invoke-virtual {p0}, Lcom/motorola/ccc/ota/ui/BaseActivity;->finish()V

    return-void

    :cond_3
    iget-object v2, p0, Lcom/motorola/ccc/ota/ui/BaseActivity;->settings:Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    sget-object v4, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->INITIAL_SETUP_COMPLETED:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    invoke-virtual {v2, v4}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->getBoolean(Lcom/motorola/otalib/common/settings/ISetting;)Z

    move-result v2

    if-eqz v2, :cond_4

    iget-object v2, p0, Lcom/motorola/ccc/ota/ui/BaseActivity;->settings:Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    sget-object v4, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->FLAG_IS_VITAL_UPDATE:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    invoke-virtual {v2, v4}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->getBoolean(Lcom/motorola/otalib/common/settings/ISetting;)Z

    move-result v2

    if-eqz v2, :cond_4

    const-string v2, "resetting vital update flag"

    invoke-static {v0, v2}, Lcom/motorola/ccc/ota/utils/Logger;->debug(Ljava/lang/String;Ljava/lang/String;)V

    iget-object v2, p0, Lcom/motorola/ccc/ota/ui/BaseActivity;->settings:Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    sget-object v4, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->FLAG_IS_VITAL_UPDATE:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    invoke-virtual {v2, v4}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->removeConfig(Lcom/motorola/otalib/common/settings/ISetting;)V

    :cond_4
    :goto_0
    iget-object v2, p0, Lcom/motorola/ccc/ota/ui/BaseActivity;->settings:Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    sget-object v4, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->FLAG_IS_VITAL_UPDATE:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    invoke-virtual {v2, v4}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->getBoolean(Lcom/motorola/otalib/common/settings/ISetting;)Z

    move-result v2

    if-eqz v2, :cond_5

    const v2, 0x7f0f0229

    invoke-virtual {p0, v2}, Lcom/motorola/ccc/ota/ui/BaseActivity;->setTheme(I)V

    goto :goto_1

    :cond_5
    invoke-virtual {p0, p1}, Lcom/motorola/ccc/ota/ui/BaseActivity;->setRequestedOrientation(I)V

    const v2, 0x7f0f00c5

    invoke-virtual {p0, v2}, Lcom/motorola/ccc/ota/ui/BaseActivity;->setTheme(I)V

    :goto_1
    const v2, 0x7f0c0050

    invoke-virtual {p0, v2}, Lcom/motorola/ccc/ota/ui/BaseActivity;->setContentView(I)V

    invoke-virtual {p0}, Lcom/motorola/ccc/ota/ui/BaseActivity;->getSupportFragmentManager()Landroidx/fragment/app/FragmentManager;

    move-result-object v2

    iput-object v2, p0, Lcom/motorola/ccc/ota/ui/BaseActivity;->fragmentManager:Landroidx/fragment/app/FragmentManager;

    invoke-virtual {p0}, Lcom/motorola/ccc/ota/ui/BaseActivity;->getWindow()Landroid/view/Window;

    move-result-object v2

    iget-object v4, p0, Lcom/motorola/ccc/ota/ui/BaseActivity;->settings:Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    sget-object v5, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->FLAG_IS_VITAL_UPDATE:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    invoke-virtual {v4, v5}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->getBoolean(Lcom/motorola/otalib/common/settings/ISetting;)Z

    move-result v4

    const/4 v5, 0x0

    if-nez v4, :cond_6

    const/high16 v4, -0x80000000

    invoke-virtual {v2, v4}, Landroid/view/Window;->addFlags(I)V

    invoke-virtual {v2, v5}, Landroid/view/Window;->setStatusBarColor(I)V

    invoke-virtual {v2, v5}, Landroid/view/Window;->setNavigationBarColor(I)V

    :cond_6
    invoke-static {p0}, Lcom/motorola/ccc/ota/ui/UpdaterUtils;->isBatterySaverEnabled(Landroid/content/Context;)Z

    move-result v4

    if-nez v4, :cond_7

    new-instance v4, Landroidx/core/view/WindowInsetsControllerCompat;

    invoke-virtual {v2}, Landroid/view/Window;->getDecorView()Landroid/view/View;

    move-result-object v6

    invoke-direct {v4, v2, v6}, Landroidx/core/view/WindowInsetsControllerCompat;-><init>(Landroid/view/Window;Landroid/view/View;)V

    const-string v2, "uimode"

    invoke-virtual {p0, v2}, Lcom/motorola/ccc/ota/ui/BaseActivity;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroid/app/UiModeManager;

    invoke-virtual {v2}, Landroid/app/UiModeManager;->getNightMode()I

    move-result v2

    const/4 v6, 0x2

    if-eq v2, v6, :cond_7

    invoke-virtual {v4, p1}, Landroidx/core/view/WindowInsetsControllerCompat;->setAppearanceLightStatusBars(Z)V

    invoke-virtual {v4, p1}, Landroidx/core/view/WindowInsetsControllerCompat;->setAppearanceLightNavigationBars(Z)V

    :cond_7
    invoke-direct {p0}, Lcom/motorola/ccc/ota/ui/BaseActivity;->registerActionUpdateReceiver()V

    invoke-static {v1}, Lcom/motorola/ccc/ota/ui/UpdaterUtils;->isOtaServiceRunning(Landroid/content/Context;)Z

    move-result v1

    invoke-virtual {p0}, Lcom/motorola/ccc/ota/ui/BaseActivity;->getIntent()Landroid/content/Intent;

    move-result-object v2

    invoke-virtual {v2}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object v2

    const-string v4, "com.motorola.blur.service.blur.Actions.UPGRADE_UPDATE_STATUS"

    invoke-virtual {v4, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_8

    if-nez v1, :cond_8

    new-instance v2, Ljava/lang/StringBuilder;

    const-string v4, "ota service running status "

    invoke-direct {v2, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/motorola/ccc/ota/utils/Logger;->debug(Ljava/lang/String;Ljava/lang/String;)V

    new-instance v0, Landroid/os/Bundle;

    invoke-direct {v0}, Landroid/os/Bundle;-><init>()V

    sget-object v1, Lcom/motorola/otalib/common/utils/UpgradeUtils$Error;->ERR_INIT_OTA_SERVICE:Lcom/motorola/otalib/common/utils/UpgradeUtils$Error;

    invoke-virtual {v1}, Lcom/motorola/otalib/common/utils/UpgradeUtils$Error;->toString()Ljava/lang/String;

    move-result-object v1

    const-string v2, "com.motorola.blur.service.blur.upgrade.check_error"

    invoke-virtual {v0, v2, v1}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {p0, v0}, Lcom/motorola/ccc/ota/ui/BaseActivity;->onUpdateActionResponse(Landroid/os/Bundle;)V

    new-instance v0, Landroid/content/Intent;

    const-class v1, Lcom/motorola/ccc/ota/env/OtaService;

    invoke-direct {v0, p0, v1}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    invoke-virtual {v0, v3, p1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Z)Landroid/content/Intent;

    invoke-virtual {p0, v0}, Lcom/motorola/ccc/ota/ui/BaseActivity;->startService(Landroid/content/Intent;)Landroid/content/ComponentName;

    return-void

    :cond_8
    invoke-virtual {p0}, Lcom/motorola/ccc/ota/ui/BaseActivity;->getIntent()Landroid/content/Intent;

    move-result-object p1

    const-string v1, "fragment_type"

    invoke-virtual {p1, v1}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p0}, Lcom/motorola/ccc/ota/ui/BaseActivity;->getIntent()Landroid/content/Intent;

    move-result-object v1

    const-string v2, "notification_id"

    invoke-virtual {v1, v2, v5}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I

    move-result v1

    const/4 v2, 0x5

    if-ne v2, v1, :cond_9

    invoke-static {}, Lcom/motorola/ccc/ota/utils/NotificationUtils;->cancelSmartUpdateNotification()V

    :cond_9
    const/4 v1, 0x0

    :try_start_0
    invoke-static {p1}, Lcom/motorola/ccc/ota/utils/UpgradeUtilConstants$FragmentTypeEnum;->valueOf(Ljava/lang/String;)Lcom/motorola/ccc/ota/utils/UpgradeUtilConstants$FragmentTypeEnum;

    move-result-object p1
    :try_end_0
    .catch Ljava/lang/IllegalArgumentException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/lang/NullPointerException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_2

    :catch_0
    move-exception p1

    new-instance v2, Ljava/lang/StringBuilder;

    const-string v3, "Exception in getting fragment type, BaseActivity, onCreate: "

    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {v0, p1}, Lcom/motorola/ccc/ota/utils/Logger;->debug(Ljava/lang/String;Ljava/lang/String;)V

    move-object p1, v1

    :goto_2
    invoke-virtual {p0}, Lcom/motorola/ccc/ota/ui/BaseActivity;->getIntent()Landroid/content/Intent;

    move-result-object v2

    invoke-virtual {v2}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v4, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_a

    invoke-virtual {p0}, Lcom/motorola/ccc/ota/ui/BaseActivity;->getIntent()Landroid/content/Intent;

    move-result-object v2

    invoke-virtual {v2}, Landroid/content/Intent;->getFlags()I

    move-result v2

    const/high16 v3, 0x100000

    and-int/2addr v2, v3

    if-eqz v2, :cond_a

    const-string p1, "activity launched from recent apps"

    invoke-static {v0, p1}, Lcom/motorola/ccc/ota/utils/Logger;->debug(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_3

    :cond_a
    move-object v1, p1

    :goto_3
    invoke-virtual {p0}, Lcom/motorola/ccc/ota/ui/BaseActivity;->getIntent()Landroid/content/Intent;

    move-result-object p1

    invoke-virtual {p1}, Landroid/content/Intent;->getComponent()Landroid/content/ComponentName;

    move-result-object p1

    invoke-virtual {p1}, Landroid/content/ComponentName;->toString()Ljava/lang/String;

    move-result-object p1

    const-string v0, ".OTASuggestion"

    invoke-virtual {p1, v0}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result p1

    if-eqz p1, :cond_b

    iget-object p1, p0, Lcom/motorola/ccc/ota/ui/BaseActivity;->settings:Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    sget-object v0, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->STATS_SMART_UPDATE_USER_VISITED_SUGGESTIONS:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    invoke-virtual {p1, v0}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->incrementPrefs(Lcom/motorola/otalib/common/settings/ISetting;)V

    invoke-virtual {p0}, Lcom/motorola/ccc/ota/ui/BaseActivity;->getIntent()Landroid/content/Intent;

    move-result-object p1

    sget-object v0, Lcom/motorola/ccc/ota/utils/SmartUpdateUtils$SmartUpdateLaunchMode;->SMART_UPDATE_SUGGESTIONS:Lcom/motorola/ccc/ota/utils/SmartUpdateUtils$SmartUpdateLaunchMode;

    invoke-virtual {v0}, Lcom/motorola/ccc/ota/utils/SmartUpdateUtils$SmartUpdateLaunchMode;->name()Ljava/lang/String;

    move-result-object v0

    const-string v1, "com.motorola.blur.service.blur.update.launch_mode"

    invoke-virtual {p1, v1, v0}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    sget-object v1, Lcom/motorola/ccc/ota/utils/UpgradeUtilConstants$FragmentTypeEnum;->SMART_UPDATE_FRAGMENT:Lcom/motorola/ccc/ota/utils/UpgradeUtilConstants$FragmentTypeEnum;

    :cond_b
    invoke-direct {p0, v1}, Lcom/motorola/ccc/ota/ui/BaseActivity;->initFragment(Lcom/motorola/ccc/ota/utils/UpgradeUtilConstants$FragmentTypeEnum;)V

    return-void
.end method

.method protected onDestroy()V
    .locals 1

    invoke-super {p0}, Landroidx/appcompat/app/AppCompatActivity;->onDestroy()V

    iget-object v0, p0, Lcom/motorola/ccc/ota/ui/BaseActivity;->updateReceiver:Landroid/content/BroadcastReceiver;

    if-eqz v0, :cond_0

    invoke-virtual {p0, v0}, Lcom/motorola/ccc/ota/ui/BaseActivity;->unregisterReceiver(Landroid/content/BroadcastReceiver;)V

    const/4 v0, 0x0

    iput-object v0, p0, Lcom/motorola/ccc/ota/ui/BaseActivity;->updateReceiver:Landroid/content/BroadcastReceiver;

    :cond_0
    return-void
.end method

.method public onDismiss(IZ)V
    .locals 0

    if-eqz p2, :cond_0

    invoke-virtual {p0}, Lcom/motorola/ccc/ota/ui/BaseActivity;->finish()V

    :cond_0
    return-void
.end method

.method protected onNewIntent(Landroid/content/Intent;)V
    .locals 3

    invoke-super {p0, p1}, Landroidx/appcompat/app/AppCompatActivity;->onNewIntent(Landroid/content/Intent;)V

    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "New Intent : "

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    const-string v1, "OtaApp"

    invoke-static {v1, v0}, Lcom/motorola/ccc/ota/utils/Logger;->debug(Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {p0, p1}, Lcom/motorola/ccc/ota/ui/BaseActivity;->setIntent(Landroid/content/Intent;)V

    invoke-virtual {p0}, Lcom/motorola/ccc/ota/ui/BaseActivity;->getIntent()Landroid/content/Intent;

    move-result-object p1

    const-string v0, "fragment_type"

    invoke-virtual {p1, v0}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    :try_start_0
    invoke-static {p1}, Lcom/motorola/ccc/ota/utils/UpgradeUtilConstants$FragmentTypeEnum;->valueOf(Ljava/lang/String;)Lcom/motorola/ccc/ota/utils/UpgradeUtilConstants$FragmentTypeEnum;

    move-result-object p1
    :try_end_0
    .catch Ljava/lang/IllegalArgumentException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/lang/NullPointerException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception p1

    new-instance v0, Ljava/lang/StringBuilder;

    const-string v2, "Exception in getting fragment type, BaseActivity, onNewIntent: "

    invoke-direct {v0, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {v1, p1}, Lcom/motorola/ccc/ota/utils/Logger;->debug(Ljava/lang/String;Ljava/lang/String;)V

    const/4 p1, 0x0

    :goto_0
    invoke-direct {p0, p1}, Lcom/motorola/ccc/ota/ui/BaseActivity;->initFragment(Lcom/motorola/ccc/ota/utils/UpgradeUtilConstants$FragmentTypeEnum;)V

    return-void
.end method

.method protected onPause()V
    .locals 1

    invoke-super {p0}, Landroidx/appcompat/app/AppCompatActivity;->onPause()V

    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/motorola/ccc/ota/ui/BaseActivity;->isRunning:Z

    return-void
.end method

.method public onPositiveClick(ILorg/json/JSONObject;)V
    .locals 0

    invoke-virtual {p0}, Lcom/motorola/ccc/ota/ui/BaseActivity;->finish()V

    return-void
.end method

.method protected onPostResume()V
    .locals 1

    invoke-super {p0}, Landroidx/appcompat/app/AppCompatActivity;->onPostResume()V

    iget-object v0, p0, Lcom/motorola/ccc/ota/ui/BaseActivity;->responseBundle:Landroid/os/Bundle;

    if-eqz v0, :cond_0

    invoke-direct {p0, v0}, Lcom/motorola/ccc/ota/ui/BaseActivity;->performCheckUpdateAction(Landroid/os/Bundle;)V

    const/4 v0, 0x0

    iput-object v0, p0, Lcom/motorola/ccc/ota/ui/BaseActivity;->responseBundle:Landroid/os/Bundle;

    :cond_0
    return-void
.end method

.method protected onResume()V
    .locals 1

    invoke-super {p0}, Landroidx/appcompat/app/AppCompatActivity;->onResume()V

    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/motorola/ccc/ota/ui/BaseActivity;->isRunning:Z

    return-void
.end method

.method protected onStop()V
    .locals 2

    invoke-super {p0}, Landroidx/appcompat/app/AppCompatActivity;->onStop()V

    invoke-virtual {p0}, Lcom/motorola/ccc/ota/ui/BaseActivity;->getSupportFragmentManager()Landroidx/fragment/app/FragmentManager;

    move-result-object v0

    const-string v1, "CheckUpdateFragment"

    invoke-virtual {v0, v1}, Landroidx/fragment/app/FragmentManager;->findFragmentByTag(Ljava/lang/String;)Landroidx/fragment/app/Fragment;

    move-result-object v0

    if-eqz v0, :cond_0

    sget-object v0, Lcom/motorola/ccc/ota/ui/BaseActivity;->ERR_NET:Ljava/lang/String;

    iget-object v1, p0, Lcom/motorola/ccc/ota/ui/BaseActivity;->errorCodeToRefresh:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-virtual {p0}, Lcom/motorola/ccc/ota/ui/BaseActivity;->finish()V

    :cond_0
    return-void
.end method

.method public onUpdateActionResponse(Landroid/os/Bundle;)V
    .locals 1

    iget-boolean v0, p0, Lcom/motorola/ccc/ota/ui/BaseActivity;->isRunning:Z

    if-nez v0, :cond_0

    iput-object p1, p0, Lcom/motorola/ccc/ota/ui/BaseActivity;->responseBundle:Landroid/os/Bundle;

    goto :goto_0

    :cond_0
    invoke-direct {p0, p1}, Lcom/motorola/ccc/ota/ui/BaseActivity;->performCheckUpdateAction(Landroid/os/Bundle;)V

    :goto_0
    return-void
.end method
