.class Lcom/motorola/ccc/ota/ui/SmartUpdateFragment$7;
.super Ljava/lang/Object;
.source "SmartUpdateFragment.java"

# interfaces
.implements Landroid/app/TimePickerDialog$OnTimeSetListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/motorola/ccc/ota/ui/SmartUpdateFragment;->showTimePickerDialog()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/motorola/ccc/ota/ui/SmartUpdateFragment;


# direct methods
.method constructor <init>(Lcom/motorola/ccc/ota/ui/SmartUpdateFragment;)V
    .locals 0

    iput-object p1, p0, Lcom/motorola/ccc/ota/ui/SmartUpdateFragment$7;->this$0:Lcom/motorola/ccc/ota/ui/SmartUpdateFragment;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onTimeSet(Landroid/widget/TimePicker;II)V
    .locals 2

    iget-object p1, p0, Lcom/motorola/ccc/ota/ui/SmartUpdateFragment$7;->this$0:Lcom/motorola/ccc/ota/ui/SmartUpdateFragment;

    invoke-static {p1, p2}, Lcom/motorola/ccc/ota/ui/SmartUpdateFragment;->-$$Nest$fputselectedHour(Lcom/motorola/ccc/ota/ui/SmartUpdateFragment;I)V

    iget-object p1, p0, Lcom/motorola/ccc/ota/ui/SmartUpdateFragment$7;->this$0:Lcom/motorola/ccc/ota/ui/SmartUpdateFragment;

    invoke-static {p1, p3}, Lcom/motorola/ccc/ota/ui/SmartUpdateFragment;->-$$Nest$fputselectedMinute(Lcom/motorola/ccc/ota/ui/SmartUpdateFragment;I)V

    iget-object p1, p0, Lcom/motorola/ccc/ota/ui/SmartUpdateFragment$7;->this$0:Lcom/motorola/ccc/ota/ui/SmartUpdateFragment;

    invoke-static {p1}, Lcom/motorola/ccc/ota/ui/SmartUpdateFragment;->-$$Nest$fgetcustomStartTimeEd(Lcom/motorola/ccc/ota/ui/SmartUpdateFragment;)Landroid/widget/EditText;

    move-result-object p1

    iget-object v0, p0, Lcom/motorola/ccc/ota/ui/SmartUpdateFragment$7;->this$0:Lcom/motorola/ccc/ota/ui/SmartUpdateFragment;

    invoke-virtual {v0}, Lcom/motorola/ccc/ota/ui/SmartUpdateFragment;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0, p2, p3}, Lcom/motorola/ccc/ota/utils/DateFormatUtils;->formatTimeContent(Landroid/content/Context;II)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1, v0}, Landroid/widget/EditText;->setText(Ljava/lang/CharSequence;)V

    iget-object p1, p0, Lcom/motorola/ccc/ota/ui/SmartUpdateFragment$7;->this$0:Lcom/motorola/ccc/ota/ui/SmartUpdateFragment;

    invoke-static {p1}, Lcom/motorola/ccc/ota/ui/SmartUpdateFragment;->-$$Nest$fgetcustomEndTimeEd(Lcom/motorola/ccc/ota/ui/SmartUpdateFragment;)Landroid/widget/EditText;

    move-result-object p1

    iget-object v0, p0, Lcom/motorola/ccc/ota/ui/SmartUpdateFragment$7;->this$0:Lcom/motorola/ccc/ota/ui/SmartUpdateFragment;

    invoke-virtual {v0}, Lcom/motorola/ccc/ota/ui/SmartUpdateFragment;->getContext()Landroid/content/Context;

    move-result-object v0

    add-int/lit8 v1, p2, 0x2

    invoke-static {v0, v1, p3}, Lcom/motorola/ccc/ota/utils/DateFormatUtils;->formatTimeContent(Landroid/content/Context;II)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1, v0}, Landroid/widget/EditText;->setText(Ljava/lang/CharSequence;)V

    invoke-static {p2, p3, v1, p3}, Lcom/motorola/ccc/ota/utils/SmartUpdateUtils;->getMappedTimeSlotForPrefs(IIII)Ljava/lang/String;

    move-result-object p1

    const p2, 0x7f090139

    invoke-static {p2}, Lcom/motorola/ccc/ota/utils/SmartUpdateUtils;->getMappedTimeSlotForPrefs(I)Ljava/lang/String;

    move-result-object p2

    invoke-virtual {p2, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p2

    const/4 p3, 0x1

    if-eqz p2, :cond_0

    iget-object p0, p0, Lcom/motorola/ccc/ota/ui/SmartUpdateFragment$7;->this$0:Lcom/motorola/ccc/ota/ui/SmartUpdateFragment;

    invoke-static {p0}, Lcom/motorola/ccc/ota/ui/SmartUpdateFragment;->-$$Nest$fgetradioSlot1(Lcom/motorola/ccc/ota/ui/SmartUpdateFragment;)Landroid/widget/RadioButton;

    move-result-object p0

    invoke-virtual {p0, p3}, Landroid/widget/RadioButton;->setChecked(Z)V

    goto :goto_0

    :cond_0
    const p2, 0x7f09013a

    invoke-static {p2}, Lcom/motorola/ccc/ota/utils/SmartUpdateUtils;->getMappedTimeSlotForPrefs(I)Ljava/lang/String;

    move-result-object p2

    invoke-virtual {p2, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p2

    if-eqz p2, :cond_1

    iget-object p0, p0, Lcom/motorola/ccc/ota/ui/SmartUpdateFragment$7;->this$0:Lcom/motorola/ccc/ota/ui/SmartUpdateFragment;

    invoke-static {p0}, Lcom/motorola/ccc/ota/ui/SmartUpdateFragment;->-$$Nest$fgetradioSlot2(Lcom/motorola/ccc/ota/ui/SmartUpdateFragment;)Landroid/widget/RadioButton;

    move-result-object p0

    invoke-virtual {p0, p3}, Landroid/widget/RadioButton;->setChecked(Z)V

    goto :goto_0

    :cond_1
    const p2, 0x7f09013b

    invoke-static {p2}, Lcom/motorola/ccc/ota/utils/SmartUpdateUtils;->getMappedTimeSlotForPrefs(I)Ljava/lang/String;

    move-result-object p2

    invoke-virtual {p2, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p2

    if-eqz p2, :cond_2

    iget-object p0, p0, Lcom/motorola/ccc/ota/ui/SmartUpdateFragment$7;->this$0:Lcom/motorola/ccc/ota/ui/SmartUpdateFragment;

    invoke-static {p0}, Lcom/motorola/ccc/ota/ui/SmartUpdateFragment;->-$$Nest$fgetradioSlot3(Lcom/motorola/ccc/ota/ui/SmartUpdateFragment;)Landroid/widget/RadioButton;

    move-result-object p0

    invoke-virtual {p0, p3}, Landroid/widget/RadioButton;->setChecked(Z)V

    goto :goto_0

    :cond_2
    iget-object p2, p0, Lcom/motorola/ccc/ota/ui/SmartUpdateFragment$7;->this$0:Lcom/motorola/ccc/ota/ui/SmartUpdateFragment;

    invoke-static {p2}, Lcom/motorola/ccc/ota/ui/SmartUpdateFragment;->-$$Nest$fgetradioSlotCustom(Lcom/motorola/ccc/ota/ui/SmartUpdateFragment;)Landroid/widget/RadioButton;

    move-result-object p2

    invoke-virtual {p2, p3}, Landroid/widget/RadioButton;->setChecked(Z)V

    iget-object p2, p0, Lcom/motorola/ccc/ota/ui/SmartUpdateFragment$7;->this$0:Lcom/motorola/ccc/ota/ui/SmartUpdateFragment;

    invoke-static {p2, p1}, Lcom/motorola/ccc/ota/ui/SmartUpdateFragment;->-$$Nest$msaveTimeSlot(Lcom/motorola/ccc/ota/ui/SmartUpdateFragment;Ljava/lang/String;)V

    iget-object p0, p0, Lcom/motorola/ccc/ota/ui/SmartUpdateFragment$7;->this$0:Lcom/motorola/ccc/ota/ui/SmartUpdateFragment;

    invoke-static {p0}, Lcom/motorola/ccc/ota/ui/SmartUpdateFragment;->-$$Nest$fgetsettings(Lcom/motorola/ccc/ota/ui/SmartUpdateFragment;)Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    move-result-object p0

    invoke-static {p0}, Lcom/motorola/ccc/ota/utils/SmartUpdateUtils;->settingInstallTimeIntervalForSmartUpdate(Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;)V

    :goto_0
    return-void
.end method
