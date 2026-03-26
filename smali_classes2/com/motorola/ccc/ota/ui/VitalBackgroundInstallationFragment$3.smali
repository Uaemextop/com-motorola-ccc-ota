.class Lcom/motorola/ccc/ota/ui/VitalBackgroundInstallationFragment$3;
.super Ljava/lang/Object;
.source "VitalBackgroundInstallationFragment.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/motorola/ccc/ota/ui/VitalBackgroundInstallationFragment;->handleButtons()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/motorola/ccc/ota/ui/VitalBackgroundInstallationFragment;


# direct methods
.method constructor <init>(Lcom/motorola/ccc/ota/ui/VitalBackgroundInstallationFragment;)V
    .locals 0

    iput-object p1, p0, Lcom/motorola/ccc/ota/ui/VitalBackgroundInstallationFragment$3;->this$0:Lcom/motorola/ccc/ota/ui/VitalBackgroundInstallationFragment;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 2

    iget-object p1, p0, Lcom/motorola/ccc/ota/ui/VitalBackgroundInstallationFragment$3;->this$0:Lcom/motorola/ccc/ota/ui/VitalBackgroundInstallationFragment;

    invoke-static {p1}, Lcom/motorola/ccc/ota/ui/VitalBackgroundInstallationFragment;->-$$Nest$fgetsettings(Lcom/motorola/ccc/ota/ui/VitalBackgroundInstallationFragment;)Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    move-result-object p1

    sget-object v0, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->VITAL_UPDATE_CANCEL_REASON:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    const-string v1, "User clicked on emergency call."

    invoke-virtual {p1, v0, v1}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->setString(Lcom/motorola/otalib/common/settings/ISetting;Ljava/lang/String;)V

    iget-object p1, p0, Lcom/motorola/ccc/ota/ui/VitalBackgroundInstallationFragment$3;->this$0:Lcom/motorola/ccc/ota/ui/VitalBackgroundInstallationFragment;

    invoke-static {p1}, Lcom/motorola/ccc/ota/ui/VitalBackgroundInstallationFragment;->-$$Nest$fgetsettings(Lcom/motorola/ccc/ota/ui/VitalBackgroundInstallationFragment;)Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    move-result-object p1

    sget-object v0, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->LAUNCHED_NEXT_SETUP_SCREEN_ON_SKIP_OR_STOP:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    const/4 v1, 0x1

    invoke-virtual {p1, v0, v1}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->setBoolean(Lcom/motorola/otalib/common/settings/ISetting;Z)V

    iget-object p1, p0, Lcom/motorola/ccc/ota/ui/VitalBackgroundInstallationFragment$3;->this$0:Lcom/motorola/ccc/ota/ui/VitalBackgroundInstallationFragment;

    invoke-virtual {p1}, Lcom/motorola/ccc/ota/ui/VitalBackgroundInstallationFragment;->onclickEmergencyCall()V

    iget-object p0, p0, Lcom/motorola/ccc/ota/ui/VitalBackgroundInstallationFragment$3;->this$0:Lcom/motorola/ccc/ota/ui/VitalBackgroundInstallationFragment;

    invoke-static {p0}, Lcom/motorola/ccc/ota/ui/VitalBackgroundInstallationFragment;->-$$Nest$fgetcontext(Lcom/motorola/ccc/ota/ui/VitalBackgroundInstallationFragment;)Landroid/content/Context;

    move-result-object p0

    sget-object p1, Lcom/motorola/otalib/common/utils/UpgradeUtils$DownloadStatus;->STATUS_INSTALL_CANCEL:Lcom/motorola/otalib/common/utils/UpgradeUtils$DownloadStatus;

    invoke-static {p0, p1}, Lcom/motorola/ccc/ota/utils/UpgradeUtilMethods;->sendUserResponseDuringBackgroundInstallation(Landroid/content/Context;Lcom/motorola/otalib/common/utils/UpgradeUtils$DownloadStatus;)V

    return-void
.end method
