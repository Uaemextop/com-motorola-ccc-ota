.class Lcom/motorola/ccc/ota/sources/bota/BotaUpgradeSource$1;
.super Ljava/lang/Object;
.source "BotaUpgradeSource.java"

# interfaces
.implements Lcom/motorola/otalib/cdsservice/ResponseHandler;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/motorola/ccc/ota/sources/bota/BotaUpgradeSource;->checkForUpdate(ZIZ)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/motorola/ccc/ota/sources/bota/BotaUpgradeSource;

.field final synthetic val$interactive:Z

.field final synthetic val$reqId:I


# direct methods
.method constructor <init>(Lcom/motorola/ccc/ota/sources/bota/BotaUpgradeSource;IZ)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    iput-object p1, p0, Lcom/motorola/ccc/ota/sources/bota/BotaUpgradeSource$1;->this$0:Lcom/motorola/ccc/ota/sources/bota/BotaUpgradeSource;

    iput p2, p0, Lcom/motorola/ccc/ota/sources/bota/BotaUpgradeSource$1;->val$reqId:I

    iput-boolean p3, p0, Lcom/motorola/ccc/ota/sources/bota/BotaUpgradeSource$1;->val$interactive:Z

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public handleResponse(Lcom/motorola/otalib/cdsservice/webdataobjects/WebResponse;)V
    .locals 2

    iget-object v0, p0, Lcom/motorola/ccc/ota/sources/bota/BotaUpgradeSource$1;->this$0:Lcom/motorola/ccc/ota/sources/bota/BotaUpgradeSource;

    iget v1, p0, Lcom/motorola/ccc/ota/sources/bota/BotaUpgradeSource$1;->val$reqId:I

    iget-boolean p0, p0, Lcom/motorola/ccc/ota/sources/bota/BotaUpgradeSource$1;->val$interactive:Z

    invoke-static {v0, p1, v1, p0}, Lcom/motorola/ccc/ota/sources/bota/BotaUpgradeSource;->-$$Nest$mhandleCheckWSResponse(Lcom/motorola/ccc/ota/sources/bota/BotaUpgradeSource;Lcom/motorola/otalib/cdsservice/webdataobjects/WebResponse;IZ)V

    return-void
.end method
