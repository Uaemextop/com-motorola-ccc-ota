.class public final synthetic Lcom/motorola/ccc/ota/utils/SmartUpdateUtils$$ExternalSyntheticLambda3;
.super Ljava/lang/Object;
.source "D8$$SyntheticClass"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic f$0:Landroidx/appcompat/app/AlertDialog;

.field public final synthetic f$1:Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

.field public final synthetic f$2:Landroid/app/Activity;


# direct methods
.method public synthetic constructor <init>(Landroidx/appcompat/app/AlertDialog;Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;Landroid/app/Activity;)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/motorola/ccc/ota/utils/SmartUpdateUtils$$ExternalSyntheticLambda3;->f$0:Landroidx/appcompat/app/AlertDialog;

    iput-object p2, p0, Lcom/motorola/ccc/ota/utils/SmartUpdateUtils$$ExternalSyntheticLambda3;->f$1:Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    iput-object p3, p0, Lcom/motorola/ccc/ota/utils/SmartUpdateUtils$$ExternalSyntheticLambda3;->f$2:Landroid/app/Activity;

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .locals 2

    iget-object v0, p0, Lcom/motorola/ccc/ota/utils/SmartUpdateUtils$$ExternalSyntheticLambda3;->f$0:Landroidx/appcompat/app/AlertDialog;

    iget-object v1, p0, Lcom/motorola/ccc/ota/utils/SmartUpdateUtils$$ExternalSyntheticLambda3;->f$1:Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    iget-object p0, p0, Lcom/motorola/ccc/ota/utils/SmartUpdateUtils$$ExternalSyntheticLambda3;->f$2:Landroid/app/Activity;

    invoke-static {v0, v1, p0, p1}, Lcom/motorola/ccc/ota/utils/SmartUpdateUtils;->lambda$showTrySmartUpdatePopUp$3(Landroidx/appcompat/app/AlertDialog;Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;Landroid/app/Activity;Landroid/view/View;)V

    return-void
.end method
