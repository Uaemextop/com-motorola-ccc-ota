.class Lcom/motorola/ccc/ota/sources/modem/ModemUpgradeSource$2;
.super Ljava/lang/Object;
.source "ModemUpgradeSource.java"

# interfaces
.implements Lcom/motorola/otalib/cdsservice/ResponseHandler;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/motorola/ccc/ota/sources/modem/ModemUpgradeSource;->checkForDownloadDescriptor(Ljava/lang/String;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/motorola/ccc/ota/sources/modem/ModemUpgradeSource;


# direct methods
.method constructor <init>(Lcom/motorola/ccc/ota/sources/modem/ModemUpgradeSource;)V
    .locals 0

    iput-object p1, p0, Lcom/motorola/ccc/ota/sources/modem/ModemUpgradeSource$2;->this$0:Lcom/motorola/ccc/ota/sources/modem/ModemUpgradeSource;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public handleResponse(Lcom/motorola/otalib/cdsservice/webdataobjects/WebResponse;)V
    .locals 1

    iget-object p0, p0, Lcom/motorola/ccc/ota/sources/modem/ModemUpgradeSource$2;->this$0:Lcom/motorola/ccc/ota/sources/modem/ModemUpgradeSource;

    invoke-static {}, Lcom/motorola/ccc/ota/utils/BuildPropReader;->getDeviceModemConfigVersionSha1()Ljava/lang/String;

    move-result-object v0

    invoke-static {p0, p1, v0}, Lcom/motorola/ccc/ota/sources/modem/ModemUpgradeSource;->-$$Nest$mhandleResourceWSResponse(Lcom/motorola/ccc/ota/sources/modem/ModemUpgradeSource;Lcom/motorola/otalib/cdsservice/webdataobjects/WebResponse;Ljava/lang/String;)V

    return-void
.end method
