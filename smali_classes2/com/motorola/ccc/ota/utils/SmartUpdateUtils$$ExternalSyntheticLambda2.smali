.class public final synthetic Lcom/motorola/ccc/ota/utils/SmartUpdateUtils$$ExternalSyntheticLambda2;
.super Ljava/lang/Object;
.source "D8$$SyntheticClass"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic f$0:Landroid/app/Activity;

.field public final synthetic f$1:Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

.field public final synthetic f$2:Landroid/content/Context;

.field public final synthetic f$3:Ljava/lang/String;

.field public final synthetic f$4:Landroidx/appcompat/app/AlertDialog;


# direct methods
.method public synthetic constructor <init>(Landroid/app/Activity;Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;Landroid/content/Context;Ljava/lang/String;Landroidx/appcompat/app/AlertDialog;)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/motorola/ccc/ota/utils/SmartUpdateUtils$$ExternalSyntheticLambda2;->f$0:Landroid/app/Activity;

    iput-object p2, p0, Lcom/motorola/ccc/ota/utils/SmartUpdateUtils$$ExternalSyntheticLambda2;->f$1:Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    iput-object p3, p0, Lcom/motorola/ccc/ota/utils/SmartUpdateUtils$$ExternalSyntheticLambda2;->f$2:Landroid/content/Context;

    iput-object p4, p0, Lcom/motorola/ccc/ota/utils/SmartUpdateUtils$$ExternalSyntheticLambda2;->f$3:Ljava/lang/String;

    iput-object p5, p0, Lcom/motorola/ccc/ota/utils/SmartUpdateUtils$$ExternalSyntheticLambda2;->f$4:Landroidx/appcompat/app/AlertDialog;

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .locals 6

    iget-object v0, p0, Lcom/motorola/ccc/ota/utils/SmartUpdateUtils$$ExternalSyntheticLambda2;->f$0:Landroid/app/Activity;

    iget-object v1, p0, Lcom/motorola/ccc/ota/utils/SmartUpdateUtils$$ExternalSyntheticLambda2;->f$1:Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    iget-object v2, p0, Lcom/motorola/ccc/ota/utils/SmartUpdateUtils$$ExternalSyntheticLambda2;->f$2:Landroid/content/Context;

    iget-object v3, p0, Lcom/motorola/ccc/ota/utils/SmartUpdateUtils$$ExternalSyntheticLambda2;->f$3:Ljava/lang/String;

    iget-object v4, p0, Lcom/motorola/ccc/ota/utils/SmartUpdateUtils$$ExternalSyntheticLambda2;->f$4:Landroidx/appcompat/app/AlertDialog;

    move-object v5, p1

    invoke-static/range {v0 .. v5}, Lcom/motorola/ccc/ota/utils/SmartUpdateUtils;->lambda$showTrySmartUpdatePopUp$2(Landroid/app/Activity;Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;Landroid/content/Context;Ljava/lang/String;Landroidx/appcompat/app/AlertDialog;Landroid/view/View;)V

    return-void
.end method
