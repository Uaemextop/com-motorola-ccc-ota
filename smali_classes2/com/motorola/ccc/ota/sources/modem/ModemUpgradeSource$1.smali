.class Lcom/motorola/ccc/ota/sources/modem/ModemUpgradeSource$1;
.super Ljava/lang/Object;
.source "ModemUpgradeSource.java"

# interfaces
.implements Lcom/motorola/otalib/cdsservice/ResponseHandler;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/motorola/ccc/ota/sources/modem/ModemUpgradeSource;->checkForUpdate(Z)V
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

    iput-object p1, p0, Lcom/motorola/ccc/ota/sources/modem/ModemUpgradeSource$1;->this$0:Lcom/motorola/ccc/ota/sources/modem/ModemUpgradeSource;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public handleResponse(Lcom/motorola/otalib/cdsservice/webdataobjects/WebResponse;)V
    .locals 0

    iget-object p0, p0, Lcom/motorola/ccc/ota/sources/modem/ModemUpgradeSource$1;->this$0:Lcom/motorola/ccc/ota/sources/modem/ModemUpgradeSource;

    invoke-static {p0, p1}, Lcom/motorola/ccc/ota/sources/modem/ModemUpgradeSource;->-$$Nest$mhandleCheckWSResponse(Lcom/motorola/ccc/ota/sources/modem/ModemUpgradeSource;Lcom/motorola/otalib/cdsservice/webdataobjects/WebResponse;)V

    return-void
.end method
