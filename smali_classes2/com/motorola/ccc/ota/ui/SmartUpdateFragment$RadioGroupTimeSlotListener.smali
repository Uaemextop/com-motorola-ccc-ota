.class Lcom/motorola/ccc/ota/ui/SmartUpdateFragment$RadioGroupTimeSlotListener;
.super Ljava/lang/Object;
.source "SmartUpdateFragment.java"

# interfaces
.implements Landroid/widget/RadioGroup$OnCheckedChangeListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/motorola/ccc/ota/ui/SmartUpdateFragment;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "RadioGroupTimeSlotListener"
.end annotation


# instance fields
.field final synthetic this$0:Lcom/motorola/ccc/ota/ui/SmartUpdateFragment;


# direct methods
.method private constructor <init>(Lcom/motorola/ccc/ota/ui/SmartUpdateFragment;)V
    .locals 0

    iput-object p1, p0, Lcom/motorola/ccc/ota/ui/SmartUpdateFragment$RadioGroupTimeSlotListener;->this$0:Lcom/motorola/ccc/ota/ui/SmartUpdateFragment;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method synthetic constructor <init>(Lcom/motorola/ccc/ota/ui/SmartUpdateFragment;Lcom/motorola/ccc/ota/ui/SmartUpdateFragment$RadioGroupTimeSlotListener-IA;)V
    .locals 0

    invoke-direct {p0, p1}, Lcom/motorola/ccc/ota/ui/SmartUpdateFragment$RadioGroupTimeSlotListener;-><init>(Lcom/motorola/ccc/ota/ui/SmartUpdateFragment;)V

    return-void
.end method


# virtual methods
.method public onCheckedChanged(Landroid/widget/RadioGroup;I)V
    .locals 0

    packed-switch p2, :pswitch_data_0

    goto :goto_0

    :pswitch_0
    iget-object p1, p0, Lcom/motorola/ccc/ota/ui/SmartUpdateFragment$RadioGroupTimeSlotListener;->this$0:Lcom/motorola/ccc/ota/ui/SmartUpdateFragment;

    invoke-static {p2}, Lcom/motorola/ccc/ota/utils/SmartUpdateUtils;->getMappedTimeSlotForPrefs(I)Ljava/lang/String;

    move-result-object p2

    invoke-static {p1, p2}, Lcom/motorola/ccc/ota/ui/SmartUpdateFragment;->-$$Nest$msaveTimeSlot(Lcom/motorola/ccc/ota/ui/SmartUpdateFragment;Ljava/lang/String;)V

    iget-object p0, p0, Lcom/motorola/ccc/ota/ui/SmartUpdateFragment$RadioGroupTimeSlotListener;->this$0:Lcom/motorola/ccc/ota/ui/SmartUpdateFragment;

    invoke-static {p0}, Lcom/motorola/ccc/ota/ui/SmartUpdateFragment;->-$$Nest$fgetsettings(Lcom/motorola/ccc/ota/ui/SmartUpdateFragment;)Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    move-result-object p0

    invoke-static {p0}, Lcom/motorola/ccc/ota/utils/SmartUpdateUtils;->settingInstallTimeIntervalForSmartUpdate(Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;)V

    :goto_0
    return-void

    nop

    :pswitch_data_0
    .packed-switch 0x7f090139
        :pswitch_0
        :pswitch_0
        :pswitch_0
    .end packed-switch
.end method
