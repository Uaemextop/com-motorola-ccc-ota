.class public final synthetic Lcom/motorola/ccc/ota/utils/SmartUpdateUtils$$ExternalSyntheticLambda0;
.super Ljava/lang/Object;
.source "D8$$SyntheticClass"

# interfaces
.implements Landroid/widget/CompoundButton$OnCheckedChangeListener;


# instance fields
.field public final synthetic f$0:Landroid/widget/CheckBox;

.field public final synthetic f$1:Landroid/content/Context;

.field public final synthetic f$2:I

.field public final synthetic f$3:Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;


# direct methods
.method public synthetic constructor <init>(Landroid/widget/CheckBox;Landroid/content/Context;ILcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/motorola/ccc/ota/utils/SmartUpdateUtils$$ExternalSyntheticLambda0;->f$0:Landroid/widget/CheckBox;

    iput-object p2, p0, Lcom/motorola/ccc/ota/utils/SmartUpdateUtils$$ExternalSyntheticLambda0;->f$1:Landroid/content/Context;

    iput p3, p0, Lcom/motorola/ccc/ota/utils/SmartUpdateUtils$$ExternalSyntheticLambda0;->f$2:I

    iput-object p4, p0, Lcom/motorola/ccc/ota/utils/SmartUpdateUtils$$ExternalSyntheticLambda0;->f$3:Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    return-void
.end method


# virtual methods
.method public final onCheckedChanged(Landroid/widget/CompoundButton;Z)V
    .locals 6

    iget-object v0, p0, Lcom/motorola/ccc/ota/utils/SmartUpdateUtils$$ExternalSyntheticLambda0;->f$0:Landroid/widget/CheckBox;

    iget-object v1, p0, Lcom/motorola/ccc/ota/utils/SmartUpdateUtils$$ExternalSyntheticLambda0;->f$1:Landroid/content/Context;

    iget v2, p0, Lcom/motorola/ccc/ota/utils/SmartUpdateUtils$$ExternalSyntheticLambda0;->f$2:I

    iget-object v3, p0, Lcom/motorola/ccc/ota/utils/SmartUpdateUtils$$ExternalSyntheticLambda0;->f$3:Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    move-object v4, p1

    move v5, p2

    invoke-static/range {v0 .. v5}, Lcom/motorola/ccc/ota/utils/SmartUpdateUtils;->lambda$showTrySmartUpdatePopUp$0(Landroid/widget/CheckBox;Landroid/content/Context;ILcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;Landroid/widget/CompoundButton;Z)V

    return-void
.end method
