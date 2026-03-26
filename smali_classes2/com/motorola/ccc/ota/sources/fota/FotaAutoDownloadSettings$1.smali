.class Lcom/motorola/ccc/ota/sources/fota/FotaAutoDownloadSettings$1;
.super Ljava/lang/Object;
.source "FotaAutoDownloadSettings.java"

# interfaces
.implements Landroid/widget/RadioGroup$OnCheckedChangeListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/motorola/ccc/ota/sources/fota/FotaAutoDownloadSettings;->handleListeners()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/motorola/ccc/ota/sources/fota/FotaAutoDownloadSettings;


# direct methods
.method constructor <init>(Lcom/motorola/ccc/ota/sources/fota/FotaAutoDownloadSettings;)V
    .locals 0

    iput-object p1, p0, Lcom/motorola/ccc/ota/sources/fota/FotaAutoDownloadSettings$1;->this$0:Lcom/motorola/ccc/ota/sources/fota/FotaAutoDownloadSettings;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onCheckedChanged(Landroid/widget/RadioGroup;I)V
    .locals 1

    packed-switch p2, :pswitch_data_0

    goto/16 :goto_0

    :pswitch_0
    iget-object p1, p0, Lcom/motorola/ccc/ota/sources/fota/FotaAutoDownloadSettings$1;->this$0:Lcom/motorola/ccc/ota/sources/fota/FotaAutoDownloadSettings;

    invoke-static {p1}, Lcom/motorola/ccc/ota/sources/fota/FotaAutoDownloadSettings;->-$$Nest$fgetsettings(Lcom/motorola/ccc/ota/sources/fota/FotaAutoDownloadSettings;)Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    move-result-object p1

    sget-object p2, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->USER_AUTO_DOWNLOAD_OPTION:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    sget-object v0, Lcom/motorola/ccc/ota/sources/fota/FotaConstants$AutoDownloadOption;->OTAorWiFi:Lcom/motorola/ccc/ota/sources/fota/FotaConstants$AutoDownloadOption;

    invoke-virtual {v0}, Lcom/motorola/ccc/ota/sources/fota/FotaConstants$AutoDownloadOption;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1, p2, v0}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->setString(Lcom/motorola/otalib/common/settings/ISetting;Ljava/lang/String;)V

    invoke-static {}, Lcom/motorola/ccc/ota/utils/BuildPropReader;->isFotaATT()Z

    move-result p1

    if-eqz p1, :cond_0

    iget-object p0, p0, Lcom/motorola/ccc/ota/sources/fota/FotaAutoDownloadSettings$1;->this$0:Lcom/motorola/ccc/ota/sources/fota/FotaAutoDownloadSettings;

    invoke-static {p0}, Lcom/motorola/ccc/ota/sources/fota/FotaAutoDownloadSettings;->-$$Nest$fgetmContext(Lcom/motorola/ccc/ota/sources/fota/FotaAutoDownloadSettings;)Landroid/content/Context;

    move-result-object p0

    sget-object p1, Lcom/motorola/ccc/ota/sources/fota/FotaConstants$AutoDownloadOption;->OTAorWiFi:Lcom/motorola/ccc/ota/sources/fota/FotaConstants$AutoDownloadOption;

    invoke-static {p0, p1}, Lcom/motorola/ccc/ota/env/AndroidFotaInterface;->sendAutoDownloadSettingsToFota(Landroid/content/Context;Lcom/motorola/ccc/ota/sources/fota/FotaConstants$AutoDownloadOption;)V

    return-void

    :cond_0
    iget-object p1, p0, Lcom/motorola/ccc/ota/sources/fota/FotaAutoDownloadSettings$1;->this$0:Lcom/motorola/ccc/ota/sources/fota/FotaAutoDownloadSettings;

    invoke-static {p1}, Lcom/motorola/ccc/ota/sources/fota/FotaAutoDownloadSettings;->-$$Nest$fgetmContext(Lcom/motorola/ccc/ota/sources/fota/FotaAutoDownloadSettings;)Landroid/content/Context;

    move-result-object p1

    invoke-static {p1}, Lcom/motorola/ccc/ota/sources/fota/FotaUpgradeSource;->sendFotaDownloadModeChanged(Landroid/content/Context;)V

    iget-object p1, p0, Lcom/motorola/ccc/ota/sources/fota/FotaAutoDownloadSettings$1;->this$0:Lcom/motorola/ccc/ota/sources/fota/FotaAutoDownloadSettings;

    iget-object p1, p1, Lcom/motorola/ccc/ota/sources/fota/FotaAutoDownloadSettings;->metaData:Lcom/motorola/otalib/common/metaData/MetaData;

    if-eqz p1, :cond_2

    iget-object p1, p0, Lcom/motorola/ccc/ota/sources/fota/FotaAutoDownloadSettings$1;->this$0:Lcom/motorola/ccc/ota/sources/fota/FotaAutoDownloadSettings;

    invoke-static {p1}, Lcom/motorola/ccc/ota/sources/fota/FotaAutoDownloadSettings;->-$$Nest$fgetsettings(Lcom/motorola/ccc/ota/sources/fota/FotaAutoDownloadSettings;)Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    move-result-object p1

    sget-object p2, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->FLAVOUR:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    sget-object v0, Lcom/motorola/ccc/ota/utils/UpgradeUtilConstants$ResponseFlavour;->RESPONSE_FLAVOUR_WIFI_AND_MOBILE:Lcom/motorola/ccc/ota/utils/UpgradeUtilConstants$ResponseFlavour;

    invoke-virtual {v0}, Lcom/motorola/ccc/ota/utils/UpgradeUtilConstants$ResponseFlavour;->name()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1, p2, v0}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->setString(Lcom/motorola/otalib/common/settings/ISetting;Ljava/lang/String;)V

    iget-object p0, p0, Lcom/motorola/ccc/ota/sources/fota/FotaAutoDownloadSettings$1;->this$0:Lcom/motorola/ccc/ota/sources/fota/FotaAutoDownloadSettings;

    invoke-static {p0}, Lcom/motorola/ccc/ota/sources/fota/FotaAutoDownloadSettings;->-$$Nest$mbroadcastPollingIntent(Lcom/motorola/ccc/ota/sources/fota/FotaAutoDownloadSettings;)V

    goto :goto_0

    :pswitch_1
    iget-object p1, p0, Lcom/motorola/ccc/ota/sources/fota/FotaAutoDownloadSettings$1;->this$0:Lcom/motorola/ccc/ota/sources/fota/FotaAutoDownloadSettings;

    invoke-static {p1}, Lcom/motorola/ccc/ota/sources/fota/FotaAutoDownloadSettings;->-$$Nest$fgetsettings(Lcom/motorola/ccc/ota/sources/fota/FotaAutoDownloadSettings;)Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    move-result-object p1

    sget-object p2, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->USER_AUTO_DOWNLOAD_OPTION:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    sget-object v0, Lcom/motorola/ccc/ota/sources/fota/FotaConstants$AutoDownloadOption;->WiFi:Lcom/motorola/ccc/ota/sources/fota/FotaConstants$AutoDownloadOption;

    invoke-virtual {v0}, Lcom/motorola/ccc/ota/sources/fota/FotaConstants$AutoDownloadOption;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1, p2, v0}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->setString(Lcom/motorola/otalib/common/settings/ISetting;Ljava/lang/String;)V

    invoke-static {}, Lcom/motorola/ccc/ota/utils/BuildPropReader;->isFotaATT()Z

    move-result p1

    if-eqz p1, :cond_1

    iget-object p0, p0, Lcom/motorola/ccc/ota/sources/fota/FotaAutoDownloadSettings$1;->this$0:Lcom/motorola/ccc/ota/sources/fota/FotaAutoDownloadSettings;

    invoke-static {p0}, Lcom/motorola/ccc/ota/sources/fota/FotaAutoDownloadSettings;->-$$Nest$fgetmContext(Lcom/motorola/ccc/ota/sources/fota/FotaAutoDownloadSettings;)Landroid/content/Context;

    move-result-object p0

    sget-object p1, Lcom/motorola/ccc/ota/sources/fota/FotaConstants$AutoDownloadOption;->WiFi:Lcom/motorola/ccc/ota/sources/fota/FotaConstants$AutoDownloadOption;

    invoke-static {p0, p1}, Lcom/motorola/ccc/ota/env/AndroidFotaInterface;->sendAutoDownloadSettingsToFota(Landroid/content/Context;Lcom/motorola/ccc/ota/sources/fota/FotaConstants$AutoDownloadOption;)V

    return-void

    :cond_1
    iget-object p1, p0, Lcom/motorola/ccc/ota/sources/fota/FotaAutoDownloadSettings$1;->this$0:Lcom/motorola/ccc/ota/sources/fota/FotaAutoDownloadSettings;

    invoke-static {p1}, Lcom/motorola/ccc/ota/sources/fota/FotaAutoDownloadSettings;->-$$Nest$fgetmContext(Lcom/motorola/ccc/ota/sources/fota/FotaAutoDownloadSettings;)Landroid/content/Context;

    move-result-object p1

    invoke-static {p1}, Lcom/motorola/ccc/ota/sources/fota/FotaUpgradeSource;->sendFotaDownloadModeChanged(Landroid/content/Context;)V

    iget-object p1, p0, Lcom/motorola/ccc/ota/sources/fota/FotaAutoDownloadSettings$1;->this$0:Lcom/motorola/ccc/ota/sources/fota/FotaAutoDownloadSettings;

    iget-object p1, p1, Lcom/motorola/ccc/ota/sources/fota/FotaAutoDownloadSettings;->metaData:Lcom/motorola/otalib/common/metaData/MetaData;

    if-eqz p1, :cond_2

    iget-object p1, p0, Lcom/motorola/ccc/ota/sources/fota/FotaAutoDownloadSettings$1;->this$0:Lcom/motorola/ccc/ota/sources/fota/FotaAutoDownloadSettings;

    invoke-static {p1}, Lcom/motorola/ccc/ota/sources/fota/FotaAutoDownloadSettings;->-$$Nest$fgetsettings(Lcom/motorola/ccc/ota/sources/fota/FotaAutoDownloadSettings;)Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    move-result-object p1

    sget-object p2, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->FLAVOUR:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    sget-object v0, Lcom/motorola/ccc/ota/utils/UpgradeUtilConstants$ResponseFlavour;->RESPONSE_FLAVOUR_WIFI:Lcom/motorola/ccc/ota/utils/UpgradeUtilConstants$ResponseFlavour;

    invoke-virtual {v0}, Lcom/motorola/ccc/ota/utils/UpgradeUtilConstants$ResponseFlavour;->name()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1, p2, v0}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->setString(Lcom/motorola/otalib/common/settings/ISetting;Ljava/lang/String;)V

    iget-object p1, p0, Lcom/motorola/ccc/ota/sources/fota/FotaAutoDownloadSettings$1;->this$0:Lcom/motorola/ccc/ota/sources/fota/FotaAutoDownloadSettings;

    iget-object p1, p1, Lcom/motorola/ccc/ota/sources/fota/FotaAutoDownloadSettings;->metaData:Lcom/motorola/otalib/common/metaData/MetaData;

    invoke-virtual {p1}, Lcom/motorola/otalib/common/metaData/MetaData;->isWifiOnly()Z

    move-result p1

    if-nez p1, :cond_2

    iget-object p0, p0, Lcom/motorola/ccc/ota/sources/fota/FotaAutoDownloadSettings$1;->this$0:Lcom/motorola/ccc/ota/sources/fota/FotaAutoDownloadSettings;

    invoke-static {p0}, Lcom/motorola/ccc/ota/sources/fota/FotaAutoDownloadSettings;->-$$Nest$mbroadcastPollingIntent(Lcom/motorola/ccc/ota/sources/fota/FotaAutoDownloadSettings;)V

    :cond_2
    :goto_0
    return-void

    nop

    :pswitch_data_0
    .packed-switch 0x7f09013d
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method
