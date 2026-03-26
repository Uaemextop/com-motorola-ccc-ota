.class public Lcom/motorola/ccc/ota/ui/SmartUpdateFragment;
.super Landroidx/fragment/app/DialogFragment;
.source "SmartUpdateFragment.java"

# interfaces
.implements Lcom/motorola/ccc/ota/utils/SmartUpdateUtils$SmartDialog;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/motorola/ccc/ota/ui/SmartUpdateFragment$SwitchSmartUpdateListener;,
        Lcom/motorola/ccc/ota/ui/SmartUpdateFragment$RadioGroupTimeSlotListener;
    }
.end annotation


# instance fields
.field private activityIntent:Landroid/content/Intent;

.field private advancedOptions:Landroid/widget/Button;

.field private customEndTime:Lcom/google/android/material/textfield/TextInputLayout;

.field private customEndTimeEd:Landroid/widget/EditText;

.field private customStartTime:Lcom/google/android/material/textfield/TextInputLayout;

.field private customStartTimeEd:Landroid/widget/EditText;

.field private enableUpdateTypeSwitch:Landroid/widget/Switch;

.field private imgBack:Landroid/widget/ImageView;

.field private lnrSmartUpdateSwitch:Landroid/widget/LinearLayout;

.field private mActivity:Landroidx/fragment/app/FragmentActivity;

.field private mContext:Landroid/content/Context;

.field private mLaunchMode:Ljava/lang/String;

.field private mRootView:Landroid/view/View;

.field private radioGroupTimeSlot:Landroid/widget/RadioGroup;

.field private radioSlot1:Landroid/widget/RadioButton;

.field private radioSlot2:Landroid/widget/RadioButton;

.field private radioSlot3:Landroid/widget/RadioButton;

.field private radioSlotCustom:Landroid/widget/RadioButton;

.field private selectedHour:I

.field private selectedMinute:I

.field private settings:Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

.field private smartUpdateNote:Landroid/widget/TextView;

.field private smartUpdateText:Landroid/widget/TextView;

.field private switchSmartUpdate:Landroid/widget/Switch;

.field private timePickerDialog:Landroid/app/TimePickerDialog;

.field private timeSlotText:Landroid/widget/TextView;

.field private turnOffSureSmartUpdateDialog:Landroidx/appcompat/app/AlertDialog;

.field private useSmartUpdates:Landroid/widget/TextView;


# direct methods
.method static bridge synthetic -$$Nest$fgetadvancedOptions(Lcom/motorola/ccc/ota/ui/SmartUpdateFragment;)Landroid/widget/Button;
    .locals 0

    iget-object p0, p0, Lcom/motorola/ccc/ota/ui/SmartUpdateFragment;->advancedOptions:Landroid/widget/Button;

    return-object p0
.end method

.method static bridge synthetic -$$Nest$fgetcustomEndTimeEd(Lcom/motorola/ccc/ota/ui/SmartUpdateFragment;)Landroid/widget/EditText;
    .locals 0

    iget-object p0, p0, Lcom/motorola/ccc/ota/ui/SmartUpdateFragment;->customEndTimeEd:Landroid/widget/EditText;

    return-object p0
.end method

.method static bridge synthetic -$$Nest$fgetcustomStartTimeEd(Lcom/motorola/ccc/ota/ui/SmartUpdateFragment;)Landroid/widget/EditText;
    .locals 0

    iget-object p0, p0, Lcom/motorola/ccc/ota/ui/SmartUpdateFragment;->customStartTimeEd:Landroid/widget/EditText;

    return-object p0
.end method

.method static bridge synthetic -$$Nest$fgetenableUpdateTypeSwitch(Lcom/motorola/ccc/ota/ui/SmartUpdateFragment;)Landroid/widget/Switch;
    .locals 0

    iget-object p0, p0, Lcom/motorola/ccc/ota/ui/SmartUpdateFragment;->enableUpdateTypeSwitch:Landroid/widget/Switch;

    return-object p0
.end method

.method static bridge synthetic -$$Nest$fgetlnrSmartUpdateSwitch(Lcom/motorola/ccc/ota/ui/SmartUpdateFragment;)Landroid/widget/LinearLayout;
    .locals 0

    iget-object p0, p0, Lcom/motorola/ccc/ota/ui/SmartUpdateFragment;->lnrSmartUpdateSwitch:Landroid/widget/LinearLayout;

    return-object p0
.end method

.method static bridge synthetic -$$Nest$fgetmActivity(Lcom/motorola/ccc/ota/ui/SmartUpdateFragment;)Landroidx/fragment/app/FragmentActivity;
    .locals 0

    iget-object p0, p0, Lcom/motorola/ccc/ota/ui/SmartUpdateFragment;->mActivity:Landroidx/fragment/app/FragmentActivity;

    return-object p0
.end method

.method static bridge synthetic -$$Nest$fgetmContext(Lcom/motorola/ccc/ota/ui/SmartUpdateFragment;)Landroid/content/Context;
    .locals 0

    iget-object p0, p0, Lcom/motorola/ccc/ota/ui/SmartUpdateFragment;->mContext:Landroid/content/Context;

    return-object p0
.end method

.method static bridge synthetic -$$Nest$fgetradioSlot1(Lcom/motorola/ccc/ota/ui/SmartUpdateFragment;)Landroid/widget/RadioButton;
    .locals 0

    iget-object p0, p0, Lcom/motorola/ccc/ota/ui/SmartUpdateFragment;->radioSlot1:Landroid/widget/RadioButton;

    return-object p0
.end method

.method static bridge synthetic -$$Nest$fgetradioSlot2(Lcom/motorola/ccc/ota/ui/SmartUpdateFragment;)Landroid/widget/RadioButton;
    .locals 0

    iget-object p0, p0, Lcom/motorola/ccc/ota/ui/SmartUpdateFragment;->radioSlot2:Landroid/widget/RadioButton;

    return-object p0
.end method

.method static bridge synthetic -$$Nest$fgetradioSlot3(Lcom/motorola/ccc/ota/ui/SmartUpdateFragment;)Landroid/widget/RadioButton;
    .locals 0

    iget-object p0, p0, Lcom/motorola/ccc/ota/ui/SmartUpdateFragment;->radioSlot3:Landroid/widget/RadioButton;

    return-object p0
.end method

.method static bridge synthetic -$$Nest$fgetradioSlotCustom(Lcom/motorola/ccc/ota/ui/SmartUpdateFragment;)Landroid/widget/RadioButton;
    .locals 0

    iget-object p0, p0, Lcom/motorola/ccc/ota/ui/SmartUpdateFragment;->radioSlotCustom:Landroid/widget/RadioButton;

    return-object p0
.end method

.method static bridge synthetic -$$Nest$fgetsettings(Lcom/motorola/ccc/ota/ui/SmartUpdateFragment;)Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;
    .locals 0

    iget-object p0, p0, Lcom/motorola/ccc/ota/ui/SmartUpdateFragment;->settings:Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    return-object p0
.end method

.method static bridge synthetic -$$Nest$fgetswitchSmartUpdate(Lcom/motorola/ccc/ota/ui/SmartUpdateFragment;)Landroid/widget/Switch;
    .locals 0

    iget-object p0, p0, Lcom/motorola/ccc/ota/ui/SmartUpdateFragment;->switchSmartUpdate:Landroid/widget/Switch;

    return-object p0
.end method

.method static bridge synthetic -$$Nest$fgetuseSmartUpdates(Lcom/motorola/ccc/ota/ui/SmartUpdateFragment;)Landroid/widget/TextView;
    .locals 0

    iget-object p0, p0, Lcom/motorola/ccc/ota/ui/SmartUpdateFragment;->useSmartUpdates:Landroid/widget/TextView;

    return-object p0
.end method

.method static bridge synthetic -$$Nest$fputselectedHour(Lcom/motorola/ccc/ota/ui/SmartUpdateFragment;I)V
    .locals 0

    iput p1, p0, Lcom/motorola/ccc/ota/ui/SmartUpdateFragment;->selectedHour:I

    return-void
.end method

.method static bridge synthetic -$$Nest$fputselectedMinute(Lcom/motorola/ccc/ota/ui/SmartUpdateFragment;I)V
    .locals 0

    iput p1, p0, Lcom/motorola/ccc/ota/ui/SmartUpdateFragment;->selectedMinute:I

    return-void
.end method

.method static bridge synthetic -$$Nest$fputturnOffSureSmartUpdateDialog(Lcom/motorola/ccc/ota/ui/SmartUpdateFragment;Landroidx/appcompat/app/AlertDialog;)V
    .locals 0

    iput-object p1, p0, Lcom/motorola/ccc/ota/ui/SmartUpdateFragment;->turnOffSureSmartUpdateDialog:Landroidx/appcompat/app/AlertDialog;

    return-void
.end method

.method static bridge synthetic -$$Nest$minitUI(Lcom/motorola/ccc/ota/ui/SmartUpdateFragment;)V
    .locals 0

    invoke-direct {p0}, Lcom/motorola/ccc/ota/ui/SmartUpdateFragment;->initUI()V

    return-void
.end method

.method static bridge synthetic -$$Nest$msaveTimeSlot(Lcom/motorola/ccc/ota/ui/SmartUpdateFragment;Ljava/lang/String;)V
    .locals 0

    invoke-direct {p0, p1}, Lcom/motorola/ccc/ota/ui/SmartUpdateFragment;->saveTimeSlot(Ljava/lang/String;)V

    return-void
.end method

.method static bridge synthetic -$$Nest$mshowTimePickerDialog(Lcom/motorola/ccc/ota/ui/SmartUpdateFragment;)V
    .locals 0

    invoke-direct {p0}, Lcom/motorola/ccc/ota/ui/SmartUpdateFragment;->showTimePickerDialog()V

    return-void
.end method

.method static bridge synthetic -$$Nest$msmartUpdateTurnOff(Lcom/motorola/ccc/ota/ui/SmartUpdateFragment;)V
    .locals 0

    invoke-direct {p0}, Lcom/motorola/ccc/ota/ui/SmartUpdateFragment;->smartUpdateTurnOff()V

    return-void
.end method

.method static bridge synthetic -$$Nest$msmartUpdateTurnOn(Lcom/motorola/ccc/ota/ui/SmartUpdateFragment;)V
    .locals 0

    invoke-direct {p0}, Lcom/motorola/ccc/ota/ui/SmartUpdateFragment;->smartUpdateTurnOn()V

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    invoke-direct {p0}, Landroidx/fragment/app/DialogFragment;-><init>()V

    return-void
.end method

.method private checkSelectedTimeSlot()V
    .locals 5

    iget-object v0, p0, Lcom/motorola/ccc/ota/ui/SmartUpdateFragment;->radioGroupTimeSlot:Landroid/widget/RadioGroup;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/widget/RadioGroup;->setOnCheckedChangeListener(Landroid/widget/RadioGroup$OnCheckedChangeListener;)V

    iget-object v0, p0, Lcom/motorola/ccc/ota/ui/SmartUpdateFragment;->settings:Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    sget-object v2, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->SMART_UPDATE_TIME_SLOT:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    invoke-virtual {v0, v2}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->getString(Lcom/motorola/otalib/common/settings/ISetting;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v2

    const v3, 0x7f090139

    if-nez v2, :cond_3

    invoke-static {v3}, Lcom/motorola/ccc/ota/utils/SmartUpdateUtils;->getMappedTimeSlotForPrefs(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_0

    goto/16 :goto_0

    :cond_0
    const v2, 0x7f09013a

    invoke-static {v2}, Lcom/motorola/ccc/ota/utils/SmartUpdateUtils;->getMappedTimeSlotForPrefs(I)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v3, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_1

    iget-object v0, p0, Lcom/motorola/ccc/ota/ui/SmartUpdateFragment;->radioGroupTimeSlot:Landroid/widget/RadioGroup;

    invoke-virtual {v0, v2}, Landroid/widget/RadioGroup;->check(I)V

    goto :goto_1

    :cond_1
    const v2, 0x7f09013b

    invoke-static {v2}, Lcom/motorola/ccc/ota/utils/SmartUpdateUtils;->getMappedTimeSlotForPrefs(I)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v3, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_2

    iget-object v0, p0, Lcom/motorola/ccc/ota/ui/SmartUpdateFragment;->radioGroupTimeSlot:Landroid/widget/RadioGroup;

    invoke-virtual {v0, v2}, Landroid/widget/RadioGroup;->check(I)V

    goto :goto_1

    :cond_2
    iget-object v2, p0, Lcom/motorola/ccc/ota/ui/SmartUpdateFragment;->radioGroupTimeSlot:Landroid/widget/RadioGroup;

    const v3, 0x7f09013c

    invoke-virtual {v2, v3}, Landroid/widget/RadioGroup;->check(I)V

    invoke-static {v0}, Lcom/motorola/ccc/ota/utils/SmartUpdateUtils;->parseTimeslot(Ljava/lang/String;)Ljava/util/List;

    move-result-object v0

    if-eqz v0, :cond_4

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v2

    const/4 v3, 0x2

    if-ne v2, v3, :cond_4

    const/4 v2, 0x0

    invoke-interface {v0, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroid/icu/util/Calendar;

    const/4 v3, 0x1

    invoke-interface {v0, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/icu/util/Calendar;

    invoke-virtual {p0}, Lcom/motorola/ccc/ota/ui/SmartUpdateFragment;->getContext()Landroid/content/Context;

    move-result-object v3

    invoke-static {v3, v2}, Lcom/motorola/ccc/ota/utils/DateFormatUtils;->formatTimeContent(Landroid/content/Context;Landroid/icu/util/Calendar;)Ljava/lang/String;

    move-result-object v3

    iget-object v4, p0, Lcom/motorola/ccc/ota/ui/SmartUpdateFragment;->customStartTime:Lcom/google/android/material/textfield/TextInputLayout;

    invoke-virtual {v4}, Lcom/google/android/material/textfield/TextInputLayout;->getEditText()Landroid/widget/EditText;

    move-result-object v4

    invoke-virtual {v4, v3}, Landroid/widget/EditText;->setText(Ljava/lang/CharSequence;)V

    invoke-virtual {p0}, Lcom/motorola/ccc/ota/ui/SmartUpdateFragment;->getContext()Landroid/content/Context;

    move-result-object v3

    invoke-static {v3, v0}, Lcom/motorola/ccc/ota/utils/DateFormatUtils;->formatTimeContent(Landroid/content/Context;Landroid/icu/util/Calendar;)Ljava/lang/String;

    move-result-object v0

    iget-object v3, p0, Lcom/motorola/ccc/ota/ui/SmartUpdateFragment;->customEndTime:Lcom/google/android/material/textfield/TextInputLayout;

    invoke-virtual {v3}, Lcom/google/android/material/textfield/TextInputLayout;->getEditText()Landroid/widget/EditText;

    move-result-object v3

    invoke-virtual {v3, v0}, Landroid/widget/EditText;->setText(Ljava/lang/CharSequence;)V

    const/16 v0, 0xb

    invoke-virtual {v2, v0}, Landroid/icu/util/Calendar;->get(I)I

    move-result v0

    iput v0, p0, Lcom/motorola/ccc/ota/ui/SmartUpdateFragment;->selectedHour:I

    const/16 v0, 0xc

    invoke-virtual {v2, v0}, Landroid/icu/util/Calendar;->get(I)I

    move-result v0

    iput v0, p0, Lcom/motorola/ccc/ota/ui/SmartUpdateFragment;->selectedMinute:I

    goto :goto_1

    :cond_3
    :goto_0
    iget-object v0, p0, Lcom/motorola/ccc/ota/ui/SmartUpdateFragment;->radioGroupTimeSlot:Landroid/widget/RadioGroup;

    invoke-virtual {v0, v3}, Landroid/widget/RadioGroup;->check(I)V

    :cond_4
    :goto_1
    iget-object v0, p0, Lcom/motorola/ccc/ota/ui/SmartUpdateFragment;->radioGroupTimeSlot:Landroid/widget/RadioGroup;

    new-instance v2, Lcom/motorola/ccc/ota/ui/SmartUpdateFragment$RadioGroupTimeSlotListener;

    invoke-direct {v2, p0, v1}, Lcom/motorola/ccc/ota/ui/SmartUpdateFragment$RadioGroupTimeSlotListener;-><init>(Lcom/motorola/ccc/ota/ui/SmartUpdateFragment;Lcom/motorola/ccc/ota/ui/SmartUpdateFragment$RadioGroupTimeSlotListener-IA;)V

    invoke-virtual {v0, v2}, Landroid/widget/RadioGroup;->setOnCheckedChangeListener(Landroid/widget/RadioGroup$OnCheckedChangeListener;)V

    return-void
.end method

.method private findViewsById()V
    .locals 2

    iget-object v0, p0, Lcom/motorola/ccc/ota/ui/SmartUpdateFragment;->mRootView:Landroid/view/View;

    const v1, 0x7f0900f8

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/LinearLayout;

    iput-object v0, p0, Lcom/motorola/ccc/ota/ui/SmartUpdateFragment;->lnrSmartUpdateSwitch:Landroid/widget/LinearLayout;

    iget-object v0, p0, Lcom/motorola/ccc/ota/ui/SmartUpdateFragment;->mRootView:Landroid/view/View;

    const v1, 0x7f0901b2

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/Switch;

    iput-object v0, p0, Lcom/motorola/ccc/ota/ui/SmartUpdateFragment;->switchSmartUpdate:Landroid/widget/Switch;

    iget-object v0, p0, Lcom/motorola/ccc/ota/ui/SmartUpdateFragment;->mRootView:Landroid/view/View;

    const v1, 0x7f090137

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/RadioGroup;

    iput-object v0, p0, Lcom/motorola/ccc/ota/ui/SmartUpdateFragment;->radioGroupTimeSlot:Landroid/widget/RadioGroup;

    iget-object v0, p0, Lcom/motorola/ccc/ota/ui/SmartUpdateFragment;->mRootView:Landroid/view/View;

    const v1, 0x7f090139

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/RadioButton;

    iput-object v0, p0, Lcom/motorola/ccc/ota/ui/SmartUpdateFragment;->radioSlot1:Landroid/widget/RadioButton;

    iget-object v0, p0, Lcom/motorola/ccc/ota/ui/SmartUpdateFragment;->mRootView:Landroid/view/View;

    const v1, 0x7f09013a

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/RadioButton;

    iput-object v0, p0, Lcom/motorola/ccc/ota/ui/SmartUpdateFragment;->radioSlot2:Landroid/widget/RadioButton;

    iget-object v0, p0, Lcom/motorola/ccc/ota/ui/SmartUpdateFragment;->mRootView:Landroid/view/View;

    const v1, 0x7f09013b

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/RadioButton;

    iput-object v0, p0, Lcom/motorola/ccc/ota/ui/SmartUpdateFragment;->radioSlot3:Landroid/widget/RadioButton;

    iget-object v0, p0, Lcom/motorola/ccc/ota/ui/SmartUpdateFragment;->mRootView:Landroid/view/View;

    const v1, 0x7f09013c

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/RadioButton;

    iput-object v0, p0, Lcom/motorola/ccc/ota/ui/SmartUpdateFragment;->radioSlotCustom:Landroid/widget/RadioButton;

    iget-object v0, p0, Lcom/motorola/ccc/ota/ui/SmartUpdateFragment;->mRootView:Landroid/view/View;

    const v1, 0x7f0900aa

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Lcom/google/android/material/textfield/TextInputLayout;

    iput-object v0, p0, Lcom/motorola/ccc/ota/ui/SmartUpdateFragment;->customStartTime:Lcom/google/android/material/textfield/TextInputLayout;

    iget-object v0, p0, Lcom/motorola/ccc/ota/ui/SmartUpdateFragment;->mRootView:Landroid/view/View;

    const v1, 0x7f0900a9

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/EditText;

    iput-object v0, p0, Lcom/motorola/ccc/ota/ui/SmartUpdateFragment;->customStartTimeEd:Landroid/widget/EditText;

    iget-object v0, p0, Lcom/motorola/ccc/ota/ui/SmartUpdateFragment;->mRootView:Landroid/view/View;

    const v1, 0x7f0901df

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Lcom/google/android/material/textfield/TextInputLayout;

    iput-object v0, p0, Lcom/motorola/ccc/ota/ui/SmartUpdateFragment;->customEndTime:Lcom/google/android/material/textfield/TextInputLayout;

    iget-object v0, p0, Lcom/motorola/ccc/ota/ui/SmartUpdateFragment;->mRootView:Landroid/view/View;

    const v1, 0x7f0900a8

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/EditText;

    iput-object v0, p0, Lcom/motorola/ccc/ota/ui/SmartUpdateFragment;->customEndTimeEd:Landroid/widget/EditText;

    iget-object v0, p0, Lcom/motorola/ccc/ota/ui/SmartUpdateFragment;->mRootView:Landroid/view/View;

    const v1, 0x7f09016b

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p0, Lcom/motorola/ccc/ota/ui/SmartUpdateFragment;->smartUpdateText:Landroid/widget/TextView;

    iget-object v0, p0, Lcom/motorola/ccc/ota/ui/SmartUpdateFragment;->mRootView:Landroid/view/View;

    const v1, 0x7f0900e0

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/ImageView;

    iput-object v0, p0, Lcom/motorola/ccc/ota/ui/SmartUpdateFragment;->imgBack:Landroid/widget/ImageView;

    iget-object v0, p0, Lcom/motorola/ccc/ota/ui/SmartUpdateFragment;->mRootView:Landroid/view/View;

    const v1, 0x7f090041

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/Button;

    iput-object v0, p0, Lcom/motorola/ccc/ota/ui/SmartUpdateFragment;->advancedOptions:Landroid/widget/Button;

    iget-object v0, p0, Lcom/motorola/ccc/ota/ui/SmartUpdateFragment;->mRootView:Landroid/view/View;

    const v1, 0x7f0901cc

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p0, Lcom/motorola/ccc/ota/ui/SmartUpdateFragment;->timeSlotText:Landroid/widget/TextView;

    iget-object v0, p0, Lcom/motorola/ccc/ota/ui/SmartUpdateFragment;->mRootView:Landroid/view/View;

    const v1, 0x7f0900af

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/Switch;

    iput-object v0, p0, Lcom/motorola/ccc/ota/ui/SmartUpdateFragment;->enableUpdateTypeSwitch:Landroid/widget/Switch;

    iget-object v0, p0, Lcom/motorola/ccc/ota/ui/SmartUpdateFragment;->mRootView:Landroid/view/View;

    const v1, 0x7f09016a

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p0, Lcom/motorola/ccc/ota/ui/SmartUpdateFragment;->smartUpdateNote:Landroid/widget/TextView;

    iget-object v0, p0, Lcom/motorola/ccc/ota/ui/SmartUpdateFragment;->mRootView:Landroid/view/View;

    const v1, 0x7f0901f7

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p0, Lcom/motorola/ccc/ota/ui/SmartUpdateFragment;->useSmartUpdates:Landroid/widget/TextView;

    return-void
.end method

.method private handleButtons()V
    .locals 2

    iget-object v0, p0, Lcom/motorola/ccc/ota/ui/SmartUpdateFragment;->advancedOptions:Landroid/widget/Button;

    new-instance v1, Lcom/motorola/ccc/ota/ui/SmartUpdateFragment$1;

    invoke-direct {v1, p0}, Lcom/motorola/ccc/ota/ui/SmartUpdateFragment$1;-><init>(Lcom/motorola/ccc/ota/ui/SmartUpdateFragment;)V

    invoke-virtual {v0, v1}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    iget-object v0, p0, Lcom/motorola/ccc/ota/ui/SmartUpdateFragment;->radioSlotCustom:Landroid/widget/RadioButton;

    new-instance v1, Lcom/motorola/ccc/ota/ui/SmartUpdateFragment$2;

    invoke-direct {v1, p0}, Lcom/motorola/ccc/ota/ui/SmartUpdateFragment$2;-><init>(Lcom/motorola/ccc/ota/ui/SmartUpdateFragment;)V

    invoke-virtual {v0, v1}, Landroid/widget/RadioButton;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    iget-object v0, p0, Lcom/motorola/ccc/ota/ui/SmartUpdateFragment;->customStartTime:Lcom/google/android/material/textfield/TextInputLayout;

    invoke-virtual {v0}, Lcom/google/android/material/textfield/TextInputLayout;->getEditText()Landroid/widget/EditText;

    move-result-object v0

    new-instance v1, Lcom/motorola/ccc/ota/ui/SmartUpdateFragment$3;

    invoke-direct {v1, p0}, Lcom/motorola/ccc/ota/ui/SmartUpdateFragment$3;-><init>(Lcom/motorola/ccc/ota/ui/SmartUpdateFragment;)V

    invoke-virtual {v0, v1}, Landroid/widget/EditText;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    iget-object v0, p0, Lcom/motorola/ccc/ota/ui/SmartUpdateFragment;->imgBack:Landroid/widget/ImageView;

    new-instance v1, Lcom/motorola/ccc/ota/ui/SmartUpdateFragment$4;

    invoke-direct {v1, p0}, Lcom/motorola/ccc/ota/ui/SmartUpdateFragment$4;-><init>(Lcom/motorola/ccc/ota/ui/SmartUpdateFragment;)V

    invoke-virtual {v0, v1}, Landroid/widget/ImageView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    iget-object v0, p0, Lcom/motorola/ccc/ota/ui/SmartUpdateFragment;->enableUpdateTypeSwitch:Landroid/widget/Switch;

    new-instance v1, Lcom/motorola/ccc/ota/ui/SmartUpdateFragment$5;

    invoke-direct {v1, p0}, Lcom/motorola/ccc/ota/ui/SmartUpdateFragment$5;-><init>(Lcom/motorola/ccc/ota/ui/SmartUpdateFragment;)V

    invoke-virtual {v0, v1}, Landroid/widget/Switch;->setOnCheckedChangeListener(Landroid/widget/CompoundButton$OnCheckedChangeListener;)V

    invoke-virtual {p0}, Lcom/motorola/ccc/ota/ui/SmartUpdateFragment;->getDialog()Landroid/app/Dialog;

    move-result-object v0

    new-instance v1, Lcom/motorola/ccc/ota/ui/SmartUpdateFragment$6;

    invoke-direct {v1, p0}, Lcom/motorola/ccc/ota/ui/SmartUpdateFragment$6;-><init>(Lcom/motorola/ccc/ota/ui/SmartUpdateFragment;)V

    invoke-virtual {v0, v1}, Landroid/app/Dialog;->setOnKeyListener(Landroid/content/DialogInterface$OnKeyListener;)V

    return-void
.end method

.method private initUI()V
    .locals 7

    iget-object v0, p0, Lcom/motorola/ccc/ota/ui/SmartUpdateFragment;->customStartTime:Lcom/google/android/material/textfield/TextInputLayout;

    invoke-virtual {v0}, Lcom/google/android/material/textfield/TextInputLayout;->getEditText()Landroid/widget/EditText;

    move-result-object v0

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/widget/EditText;->setInputType(I)V

    iget-object v0, p0, Lcom/motorola/ccc/ota/ui/SmartUpdateFragment;->customStartTime:Lcom/google/android/material/textfield/TextInputLayout;

    invoke-virtual {v0, v1}, Lcom/google/android/material/textfield/TextInputLayout;->setFocusable(Z)V

    iget-object v0, p0, Lcom/motorola/ccc/ota/ui/SmartUpdateFragment;->radioSlot1:Landroid/widget/RadioButton;

    invoke-virtual {p0}, Lcom/motorola/ccc/ota/ui/SmartUpdateFragment;->getContext()Landroid/content/Context;

    move-result-object v2

    const v3, 0x7f090139

    invoke-static {v2, v3}, Lcom/motorola/ccc/ota/utils/SmartUpdateUtils;->getDefaultTextForTimeSlot(Landroid/content/Context;I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v2}, Landroid/widget/RadioButton;->setText(Ljava/lang/CharSequence;)V

    iget-object v0, p0, Lcom/motorola/ccc/ota/ui/SmartUpdateFragment;->radioSlot2:Landroid/widget/RadioButton;

    invoke-virtual {p0}, Lcom/motorola/ccc/ota/ui/SmartUpdateFragment;->getContext()Landroid/content/Context;

    move-result-object v2

    const v3, 0x7f09013a

    invoke-static {v2, v3}, Lcom/motorola/ccc/ota/utils/SmartUpdateUtils;->getDefaultTextForTimeSlot(Landroid/content/Context;I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v2}, Landroid/widget/RadioButton;->setText(Ljava/lang/CharSequence;)V

    iget-object v0, p0, Lcom/motorola/ccc/ota/ui/SmartUpdateFragment;->radioSlot3:Landroid/widget/RadioButton;

    invoke-virtual {p0}, Lcom/motorola/ccc/ota/ui/SmartUpdateFragment;->getContext()Landroid/content/Context;

    move-result-object v2

    const v3, 0x7f09013b

    invoke-static {v2, v3}, Lcom/motorola/ccc/ota/utils/SmartUpdateUtils;->getDefaultTextForTimeSlot(Landroid/content/Context;I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v2}, Landroid/widget/RadioButton;->setText(Ljava/lang/CharSequence;)V

    invoke-direct {p0}, Lcom/motorola/ccc/ota/ui/SmartUpdateFragment;->checkSelectedTimeSlot()V

    invoke-static {}, Lcom/motorola/ccc/ota/utils/BuildPropReader;->isUEUpdateEnabled()Z

    move-result v0

    if-eqz v0, :cond_1

    invoke-static {}, Lcom/motorola/ccc/ota/ui/UpdaterUtils;->isVerizon()Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/motorola/ccc/ota/ui/SmartUpdateFragment;->smartUpdateText:Landroid/widget/TextView;

    const v2, 0x7f0e019a

    invoke-virtual {v0, v2}, Landroid/widget/TextView;->setText(I)V

    goto :goto_0

    :cond_0
    iget-object v0, p0, Lcom/motorola/ccc/ota/ui/SmartUpdateFragment;->smartUpdateText:Landroid/widget/TextView;

    const v2, 0x7f0e0199

    invoke-virtual {v0, v2}, Landroid/widget/TextView;->setText(I)V

    :goto_0
    iget-object v0, p0, Lcom/motorola/ccc/ota/ui/SmartUpdateFragment;->timeSlotText:Landroid/widget/TextView;

    invoke-virtual {p0}, Lcom/motorola/ccc/ota/ui/SmartUpdateFragment;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    const v3, 0x7f0e019d

    invoke-virtual {v2, v3}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    goto :goto_2

    :cond_1
    invoke-static {}, Lcom/motorola/ccc/ota/ui/UpdaterUtils;->isVerizon()Z

    move-result v0

    if-eqz v0, :cond_2

    iget-object v0, p0, Lcom/motorola/ccc/ota/ui/SmartUpdateFragment;->smartUpdateText:Landroid/widget/TextView;

    const v2, 0x7f0e019c

    invoke-virtual {v0, v2}, Landroid/widget/TextView;->setText(I)V

    goto :goto_1

    :cond_2
    iget-object v0, p0, Lcom/motorola/ccc/ota/ui/SmartUpdateFragment;->smartUpdateText:Landroid/widget/TextView;

    const v2, 0x7f0e019b

    invoke-virtual {v0, v2}, Landroid/widget/TextView;->setText(I)V

    :goto_1
    iget-object v0, p0, Lcom/motorola/ccc/ota/ui/SmartUpdateFragment;->timeSlotText:Landroid/widget/TextView;

    invoke-virtual {p0}, Lcom/motorola/ccc/ota/ui/SmartUpdateFragment;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    const v3, 0x7f0e019e

    invoke-virtual {v2, v3}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    :goto_2
    invoke-static {}, Lcom/motorola/ccc/ota/ui/UpdaterUtils;->isVerizon()Z

    move-result v0

    if-eqz v0, :cond_3

    iget-object v0, p0, Lcom/motorola/ccc/ota/ui/SmartUpdateFragment;->smartUpdateNote:Landroid/widget/TextView;

    const v2, 0x7f0e0195

    invoke-virtual {v0, v2}, Landroid/widget/TextView;->setText(I)V

    goto :goto_3

    :cond_3
    iget-object v0, p0, Lcom/motorola/ccc/ota/ui/SmartUpdateFragment;->smartUpdateNote:Landroid/widget/TextView;

    const v2, 0x7f0e0194

    invoke-virtual {v0, v2}, Landroid/widget/TextView;->setText(I)V

    :goto_3
    iget-object v0, p0, Lcom/motorola/ccc/ota/ui/SmartUpdateFragment;->switchSmartUpdate:Landroid/widget/Switch;

    const/4 v2, 0x0

    invoke-virtual {v0, v2}, Landroid/widget/Switch;->setOnCheckedChangeListener(Landroid/widget/CompoundButton$OnCheckedChangeListener;)V

    iget-object v0, p0, Lcom/motorola/ccc/ota/ui/SmartUpdateFragment;->settings:Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    invoke-static {v0}, Lcom/motorola/ccc/ota/utils/SmartUpdateUtils;->isSmartUpdateEnabledByUser(Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;)Z

    move-result v0

    const v3, 0x7f0800fd

    const v4, 0x7f06001c

    const/4 v5, 0x1

    if-eqz v0, :cond_4

    iget-object v0, p0, Lcom/motorola/ccc/ota/ui/SmartUpdateFragment;->switchSmartUpdate:Landroid/widget/Switch;

    invoke-virtual {v0, v5}, Landroid/widget/Switch;->setChecked(Z)V

    iget-object v0, p0, Lcom/motorola/ccc/ota/ui/SmartUpdateFragment;->useSmartUpdates:Landroid/widget/TextView;

    invoke-virtual {p0}, Lcom/motorola/ccc/ota/ui/SmartUpdateFragment;->getContext()Landroid/content/Context;

    move-result-object v5

    invoke-virtual {v5, v4}, Landroid/content/Context;->getColor(I)I

    move-result v4

    invoke-virtual {v0, v4}, Landroid/widget/TextView;->setTextColor(I)V

    iget-object v0, p0, Lcom/motorola/ccc/ota/ui/SmartUpdateFragment;->lnrSmartUpdateSwitch:Landroid/widget/LinearLayout;

    invoke-virtual {p0}, Lcom/motorola/ccc/ota/ui/SmartUpdateFragment;->getContext()Landroid/content/Context;

    move-result-object v4

    invoke-virtual {v4, v3}, Landroid/content/Context;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object v3

    invoke-virtual {v0, v3}, Landroid/widget/LinearLayout;->setBackground(Landroid/graphics/drawable/Drawable;)V

    goto :goto_4

    :cond_4
    iget-object v0, p0, Lcom/motorola/ccc/ota/ui/SmartUpdateFragment;->mLaunchMode:Ljava/lang/String;

    if-eqz v0, :cond_6

    sget-object v6, Lcom/motorola/ccc/ota/utils/SmartUpdateUtils$SmartUpdateLaunchMode;->TRY_SMART_UPDATES_POPUP_DOWNLOAD:Lcom/motorola/ccc/ota/utils/SmartUpdateUtils$SmartUpdateLaunchMode;

    invoke-virtual {v6}, Lcom/motorola/ccc/ota/utils/SmartUpdateUtils$SmartUpdateLaunchMode;->name()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v0, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_5

    iget-object v0, p0, Lcom/motorola/ccc/ota/ui/SmartUpdateFragment;->mLaunchMode:Ljava/lang/String;

    sget-object v6, Lcom/motorola/ccc/ota/utils/SmartUpdateUtils$SmartUpdateLaunchMode;->TRY_SMART_UPDATES_POPUP_RESTART:Lcom/motorola/ccc/ota/utils/SmartUpdateUtils$SmartUpdateLaunchMode;

    invoke-virtual {v6}, Lcom/motorola/ccc/ota/utils/SmartUpdateUtils$SmartUpdateLaunchMode;->name()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v0, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_5

    iget-object v0, p0, Lcom/motorola/ccc/ota/ui/SmartUpdateFragment;->mLaunchMode:Ljava/lang/String;

    sget-object v6, Lcom/motorola/ccc/ota/utils/SmartUpdateUtils$SmartUpdateLaunchMode;->TRY_SMART_UPDATES_POPUP_INSTALL:Lcom/motorola/ccc/ota/utils/SmartUpdateUtils$SmartUpdateLaunchMode;

    invoke-virtual {v6}, Lcom/motorola/ccc/ota/utils/SmartUpdateUtils$SmartUpdateLaunchMode;->name()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v0, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_5

    iget-object v0, p0, Lcom/motorola/ccc/ota/ui/SmartUpdateFragment;->mLaunchMode:Ljava/lang/String;

    sget-object v6, Lcom/motorola/ccc/ota/utils/SmartUpdateUtils$SmartUpdateLaunchMode;->TRY_SMART_UPDATES_POPUP_UPDATE_COMPLETE:Lcom/motorola/ccc/ota/utils/SmartUpdateUtils$SmartUpdateLaunchMode;

    invoke-virtual {v6}, Lcom/motorola/ccc/ota/utils/SmartUpdateUtils$SmartUpdateLaunchMode;->name()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v0, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_6

    :cond_5
    iput-object v2, p0, Lcom/motorola/ccc/ota/ui/SmartUpdateFragment;->mLaunchMode:Ljava/lang/String;

    iget-object v0, p0, Lcom/motorola/ccc/ota/ui/SmartUpdateFragment;->switchSmartUpdate:Landroid/widget/Switch;

    invoke-virtual {v0, v5}, Landroid/widget/Switch;->setChecked(Z)V

    iget-object v0, p0, Lcom/motorola/ccc/ota/ui/SmartUpdateFragment;->useSmartUpdates:Landroid/widget/TextView;

    invoke-virtual {p0}, Lcom/motorola/ccc/ota/ui/SmartUpdateFragment;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-virtual {v1, v4}, Landroid/content/Context;->getColor(I)I

    move-result v1

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setTextColor(I)V

    iget-object v0, p0, Lcom/motorola/ccc/ota/ui/SmartUpdateFragment;->lnrSmartUpdateSwitch:Landroid/widget/LinearLayout;

    invoke-virtual {p0}, Lcom/motorola/ccc/ota/ui/SmartUpdateFragment;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-virtual {v1, v3}, Landroid/content/Context;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/LinearLayout;->setBackground(Landroid/graphics/drawable/Drawable;)V

    invoke-direct {p0}, Lcom/motorola/ccc/ota/ui/SmartUpdateFragment;->smartUpdateTurnOn()V

    invoke-direct {p0}, Lcom/motorola/ccc/ota/ui/SmartUpdateFragment;->initUI()V

    return-void

    :cond_6
    invoke-direct {p0, v1}, Lcom/motorola/ccc/ota/ui/SmartUpdateFragment;->setViewsVisibility(Z)V

    :goto_4
    iget-object v0, p0, Lcom/motorola/ccc/ota/ui/SmartUpdateFragment;->switchSmartUpdate:Landroid/widget/Switch;

    new-instance v3, Lcom/motorola/ccc/ota/ui/SmartUpdateFragment$SwitchSmartUpdateListener;

    invoke-direct {v3, p0, v2}, Lcom/motorola/ccc/ota/ui/SmartUpdateFragment$SwitchSmartUpdateListener;-><init>(Lcom/motorola/ccc/ota/ui/SmartUpdateFragment;Lcom/motorola/ccc/ota/ui/SmartUpdateFragment$SwitchSmartUpdateListener-IA;)V

    invoke-virtual {v0, v3}, Landroid/widget/Switch;->setOnCheckedChangeListener(Landroid/widget/CompoundButton$OnCheckedChangeListener;)V

    iget-object v0, p0, Lcom/motorola/ccc/ota/ui/SmartUpdateFragment;->mRootView:Landroid/view/View;

    const v2, 0x7f090082

    invoke-virtual {v0, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    invoke-static {}, Lcom/motorola/ccc/ota/utils/SmartUpdateUtils;->isForcedMRUpdateEnabledByServer()Z

    move-result v2

    const v3, 0x7f0800ac

    const/16 v4, 0x8

    if-eqz v2, :cond_8

    invoke-static {}, Lcom/motorola/ccc/ota/utils/SmartUpdateUtils;->isShowAdvancedSettingValueEnabledByServer()Z

    move-result v2

    if-eqz v2, :cond_7

    iget-object v2, p0, Lcom/motorola/ccc/ota/ui/SmartUpdateFragment;->advancedOptions:Landroid/widget/Button;

    invoke-virtual {v2, v1}, Landroid/widget/Button;->setVisibility(I)V

    iget-object v2, p0, Lcom/motorola/ccc/ota/ui/SmartUpdateFragment;->enableUpdateTypeSwitch:Landroid/widget/Switch;

    invoke-virtual {v2, v1}, Landroid/widget/Switch;->setVisibility(I)V

    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    iget-object v0, p0, Lcom/motorola/ccc/ota/ui/SmartUpdateFragment;->advancedOptions:Landroid/widget/Button;

    invoke-virtual {v0, v3, v1, v1, v1}, Landroid/widget/Button;->setCompoundDrawablesWithIntrinsicBounds(IIII)V

    iget-object v0, p0, Lcom/motorola/ccc/ota/ui/SmartUpdateFragment;->enableUpdateTypeSwitch:Landroid/widget/Switch;

    const v1, 0x7f0e0038

    invoke-virtual {v0, v1}, Landroid/widget/Switch;->setText(I)V

    iget-object v0, p0, Lcom/motorola/ccc/ota/ui/SmartUpdateFragment;->enableUpdateTypeSwitch:Landroid/widget/Switch;

    iget-object p0, p0, Lcom/motorola/ccc/ota/ui/SmartUpdateFragment;->settings:Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    sget-object v1, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->SMART_UPDATE_OS_ENABLE_BY_USER:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    invoke-virtual {p0, v1}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->getBoolean(Lcom/motorola/otalib/common/settings/ISetting;)Z

    move-result p0

    invoke-virtual {v0, p0}, Landroid/widget/Switch;->setChecked(Z)V

    goto :goto_5

    :cond_7
    iget-object p0, p0, Lcom/motorola/ccc/ota/ui/SmartUpdateFragment;->advancedOptions:Landroid/widget/Button;

    invoke-virtual {p0, v4}, Landroid/widget/Button;->setVisibility(I)V

    invoke-virtual {v0, v4}, Landroid/view/View;->setVisibility(I)V

    goto :goto_5

    :cond_8
    invoke-static {}, Lcom/motorola/ccc/ota/utils/SmartUpdateUtils;->isShowAdvancedSettingValueEnabledByServer()Z

    move-result v2

    if-eqz v2, :cond_9

    iget-object v2, p0, Lcom/motorola/ccc/ota/ui/SmartUpdateFragment;->advancedOptions:Landroid/widget/Button;

    invoke-virtual {v2, v1}, Landroid/widget/Button;->setVisibility(I)V

    iget-object v2, p0, Lcom/motorola/ccc/ota/ui/SmartUpdateFragment;->enableUpdateTypeSwitch:Landroid/widget/Switch;

    invoke-virtual {v2, v1}, Landroid/widget/Switch;->setVisibility(I)V

    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    iget-object v0, p0, Lcom/motorola/ccc/ota/ui/SmartUpdateFragment;->advancedOptions:Landroid/widget/Button;

    invoke-virtual {v0, v3, v1, v1, v1}, Landroid/widget/Button;->setCompoundDrawablesWithIntrinsicBounds(IIII)V

    iget-object v0, p0, Lcom/motorola/ccc/ota/ui/SmartUpdateFragment;->enableUpdateTypeSwitch:Landroid/widget/Switch;

    const v1, 0x7f0e0037

    invoke-virtual {v0, v1}, Landroid/widget/Switch;->setText(I)V

    iget-object v0, p0, Lcom/motorola/ccc/ota/ui/SmartUpdateFragment;->enableUpdateTypeSwitch:Landroid/widget/Switch;

    iget-object p0, p0, Lcom/motorola/ccc/ota/ui/SmartUpdateFragment;->settings:Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    sget-object v1, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->SMART_UPDATE_MR_ENABLE_BY_USER:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    invoke-virtual {p0, v1}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->getBoolean(Lcom/motorola/otalib/common/settings/ISetting;)Z

    move-result p0

    invoke-virtual {v0, p0}, Landroid/widget/Switch;->setChecked(Z)V

    goto :goto_5

    :cond_9
    iget-object p0, p0, Lcom/motorola/ccc/ota/ui/SmartUpdateFragment;->advancedOptions:Landroid/widget/Button;

    invoke-virtual {p0, v4}, Landroid/widget/Button;->setVisibility(I)V

    invoke-virtual {v0, v4}, Landroid/view/View;->setVisibility(I)V

    :goto_5
    return-void
.end method

.method private saveTimeSlot(Ljava/lang/String;)V
    .locals 1

    iget-object p0, p0, Lcom/motorola/ccc/ota/ui/SmartUpdateFragment;->settings:Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    sget-object v0, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->SMART_UPDATE_TIME_SLOT:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    invoke-virtual {p0, v0, p1}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->setString(Lcom/motorola/otalib/common/settings/ISetting;Ljava/lang/String;)V

    return-void
.end method

.method private setViewsVisibility(Z)V
    .locals 2

    const/4 v0, 0x0

    :goto_0
    iget-object v1, p0, Lcom/motorola/ccc/ota/ui/SmartUpdateFragment;->radioGroupTimeSlot:Landroid/widget/RadioGroup;

    invoke-virtual {v1}, Landroid/widget/RadioGroup;->getChildCount()I

    move-result v1

    if-ge v0, v1, :cond_0

    iget-object v1, p0, Lcom/motorola/ccc/ota/ui/SmartUpdateFragment;->radioGroupTimeSlot:Landroid/widget/RadioGroup;

    invoke-virtual {v1, v0}, Landroid/widget/RadioGroup;->getChildAt(I)Landroid/view/View;

    move-result-object v1

    invoke-virtual {v1, p1}, Landroid/view/View;->setEnabled(Z)V

    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    :cond_0
    iget-object v0, p0, Lcom/motorola/ccc/ota/ui/SmartUpdateFragment;->customStartTime:Lcom/google/android/material/textfield/TextInputLayout;

    invoke-virtual {v0, p1}, Lcom/google/android/material/textfield/TextInputLayout;->setEnabled(Z)V

    iget-object v0, p0, Lcom/motorola/ccc/ota/ui/SmartUpdateFragment;->customEndTime:Lcom/google/android/material/textfield/TextInputLayout;

    invoke-virtual {v0, p1}, Lcom/google/android/material/textfield/TextInputLayout;->setEnabled(Z)V

    iget-object v0, p0, Lcom/motorola/ccc/ota/ui/SmartUpdateFragment;->timeSlotText:Landroid/widget/TextView;

    invoke-virtual {v0, p1}, Landroid/widget/TextView;->setEnabled(Z)V

    iget-object v0, p0, Lcom/motorola/ccc/ota/ui/SmartUpdateFragment;->advancedOptions:Landroid/widget/Button;

    invoke-virtual {v0, p1}, Landroid/widget/Button;->setEnabled(Z)V

    iget-object p0, p0, Lcom/motorola/ccc/ota/ui/SmartUpdateFragment;->enableUpdateTypeSwitch:Landroid/widget/Switch;

    invoke-virtual {p0, p1}, Landroid/widget/Switch;->setEnabled(Z)V

    return-void
.end method

.method private showTimePickerDialog()V
    .locals 8

    new-instance v7, Landroid/app/TimePickerDialog;

    iget-object v1, p0, Lcom/motorola/ccc/ota/ui/SmartUpdateFragment;->mContext:Landroid/content/Context;

    new-instance v3, Lcom/motorola/ccc/ota/ui/SmartUpdateFragment$7;

    invoke-direct {v3, p0}, Lcom/motorola/ccc/ota/ui/SmartUpdateFragment$7;-><init>(Lcom/motorola/ccc/ota/ui/SmartUpdateFragment;)V

    iget v4, p0, Lcom/motorola/ccc/ota/ui/SmartUpdateFragment;->selectedHour:I

    iget v5, p0, Lcom/motorola/ccc/ota/ui/SmartUpdateFragment;->selectedMinute:I

    invoke-virtual {p0}, Lcom/motorola/ccc/ota/ui/SmartUpdateFragment;->getActivity()Landroidx/fragment/app/FragmentActivity;

    move-result-object v0

    invoke-static {v0}, Landroid/text/format/DateFormat;->is24HourFormat(Landroid/content/Context;)Z

    move-result v6

    const v2, 0x7f0f00c9

    move-object v0, v7

    invoke-direct/range {v0 .. v6}, Landroid/app/TimePickerDialog;-><init>(Landroid/content/Context;ILandroid/app/TimePickerDialog$OnTimeSetListener;IIZ)V

    iput-object v7, p0, Lcom/motorola/ccc/ota/ui/SmartUpdateFragment;->timePickerDialog:Landroid/app/TimePickerDialog;

    invoke-virtual {v7}, Landroid/app/TimePickerDialog;->show()V

    return-void
.end method

.method private smartUpdateTurnOff()V
    .locals 3

    iget-object v0, p0, Lcom/motorola/ccc/ota/ui/SmartUpdateFragment;->mContext:Landroid/content/Context;

    const/4 v1, 0x0

    invoke-static {v0, v1}, Lcom/motorola/ccc/ota/utils/SmartUpdateUtils;->sendSmartUpdateConfigChangedIntent(Landroid/content/Context;Z)V

    invoke-direct {p0, v1}, Lcom/motorola/ccc/ota/ui/SmartUpdateFragment;->setViewsVisibility(Z)V

    iget-object v0, p0, Lcom/motorola/ccc/ota/ui/SmartUpdateFragment;->settings:Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    invoke-static {v0}, Lcom/motorola/ccc/ota/utils/SmartUpdateUtils;->resetSmartUpdatePrefs(Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;)V

    iget-object v0, p0, Lcom/motorola/ccc/ota/ui/SmartUpdateFragment;->settings:Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    sget-object v1, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->STATS_SMART_UPDATE_DISABLED_VIA:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    const-string v2, "smart_frgment"

    invoke-virtual {v0, v1, v2}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->setString(Lcom/motorola/otalib/common/settings/ISetting;Ljava/lang/String;)V

    iget-object v0, p0, Lcom/motorola/ccc/ota/ui/SmartUpdateFragment;->customStartTimeEd:Landroid/widget/EditText;

    const-string v1, ""

    invoke-virtual {v0, v1}, Landroid/widget/EditText;->setText(Ljava/lang/CharSequence;)V

    iget-object v0, p0, Lcom/motorola/ccc/ota/ui/SmartUpdateFragment;->customEndTimeEd:Landroid/widget/EditText;

    invoke-virtual {v0, v1}, Landroid/widget/EditText;->setText(Ljava/lang/CharSequence;)V

    iget-object v0, p0, Lcom/motorola/ccc/ota/ui/SmartUpdateFragment;->settings:Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    sget-object v1, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->STATS_INSTALL_VIA_SMART_UPDATE:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    invoke-virtual {v0, v1}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->getBoolean(Lcom/motorola/otalib/common/settings/ISetting;)Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/motorola/ccc/ota/ui/SmartUpdateFragment;->settings:Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    sget-object v1, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->STATS_DISABLED_SMART_UPDATE_AFTER_INSTALL:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    const/4 v2, 0x1

    invoke-virtual {v0, v1, v2}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->setBoolean(Lcom/motorola/otalib/common/settings/ISetting;Z)V

    :cond_0
    invoke-direct {p0}, Lcom/motorola/ccc/ota/ui/SmartUpdateFragment;->initUI()V

    return-void
.end method

.method private smartUpdateTurnOn()V
    .locals 2

    iget-object v0, p0, Lcom/motorola/ccc/ota/ui/SmartUpdateFragment;->mContext:Landroid/content/Context;

    const/4 v1, 0x1

    invoke-static {v0, v1}, Lcom/motorola/ccc/ota/utils/SmartUpdateUtils;->sendSmartUpdateConfigChangedIntent(Landroid/content/Context;Z)V

    invoke-direct {p0, v1}, Lcom/motorola/ccc/ota/ui/SmartUpdateFragment;->setViewsVisibility(Z)V

    iget-object v0, p0, Lcom/motorola/ccc/ota/ui/SmartUpdateFragment;->settings:Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    invoke-static {v0, v1}, Lcom/motorola/ccc/ota/utils/SmartUpdateUtils;->setSmartUpdateEnableByUser(Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;Z)V

    iget-object v0, p0, Lcom/motorola/ccc/ota/ui/SmartUpdateFragment;->settings:Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    sget-object v1, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->SMART_UPDATE_TIME_SLOT:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    invoke-virtual {v0, v1}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->getString(Lcom/motorola/otalib/common/settings/ISetting;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_0

    const v0, 0x7f090139

    invoke-static {v0}, Lcom/motorola/ccc/ota/utils/SmartUpdateUtils;->getMappedTimeSlotForPrefs(I)Ljava/lang/String;

    move-result-object v0

    invoke-direct {p0, v0}, Lcom/motorola/ccc/ota/ui/SmartUpdateFragment;->saveTimeSlot(Ljava/lang/String;)V

    :cond_0
    iget-object v0, p0, Lcom/motorola/ccc/ota/ui/SmartUpdateFragment;->settings:Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    invoke-static {v0}, Lcom/motorola/ccc/ota/utils/SmartUpdateUtils;->settingInstallTimeIntervalForSmartUpdate(Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;)V

    iget-object v0, p0, Lcom/motorola/ccc/ota/ui/SmartUpdateFragment;->settings:Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    sget-object v1, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->STATS_DISABLED_SMART_UPDATE_AFTER_INSTALL:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    invoke-virtual {v0, v1}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->removeConfig(Lcom/motorola/otalib/common/settings/ISetting;)V

    iget-object p0, p0, Lcom/motorola/ccc/ota/ui/SmartUpdateFragment;->settings:Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    sget-object v0, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->STATS_SMART_UPDATE_ENABLED_VIA:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    const-string v1, "smart_frgment"

    invoke-virtual {p0, v0, v1}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->setString(Lcom/motorola/otalib/common/settings/ISetting;Ljava/lang/String;)V

    return-void
.end method


# virtual methods
.method public dismissSmartDialog()V
    .locals 1

    iget-object v0, p0, Lcom/motorola/ccc/ota/ui/SmartUpdateFragment;->turnOffSureSmartUpdateDialog:Landroidx/appcompat/app/AlertDialog;

    if-eqz v0, :cond_0

    invoke-virtual {v0}, Landroidx/appcompat/app/AlertDialog;->dismiss()V

    :cond_0
    invoke-virtual {p0}, Lcom/motorola/ccc/ota/ui/SmartUpdateFragment;->dismiss()V

    return-void
.end method

.method public onActivityCreated(Landroid/os/Bundle;)V
    .locals 1

    invoke-super {p0, p1}, Landroidx/fragment/app/DialogFragment;->onActivityCreated(Landroid/os/Bundle;)V

    invoke-virtual {p0}, Lcom/motorola/ccc/ota/ui/SmartUpdateFragment;->getArguments()Landroid/os/Bundle;

    move-result-object p1

    if-eqz p1, :cond_0

    iget-object p1, p0, Lcom/motorola/ccc/ota/ui/SmartUpdateFragment;->activityIntent:Landroid/content/Intent;

    if-eqz p1, :cond_0

    iget-object p1, p0, Lcom/motorola/ccc/ota/ui/SmartUpdateFragment;->settings:Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    sget-object v0, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->STATS_SMART_UPDATE_LAUNCH_MODE:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    iget-object p0, p0, Lcom/motorola/ccc/ota/ui/SmartUpdateFragment;->mLaunchMode:Ljava/lang/String;

    invoke-virtual {p1, v0, p0}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->setString(Lcom/motorola/otalib/common/settings/ISetting;Ljava/lang/String;)V

    :cond_0
    return-void
.end method

.method public onAttach(Landroid/content/Context;)V
    .locals 1

    invoke-super {p0, p1}, Landroidx/fragment/app/DialogFragment;->onAttach(Landroid/content/Context;)V

    iput-object p1, p0, Lcom/motorola/ccc/ota/ui/SmartUpdateFragment;->mContext:Landroid/content/Context;

    instance-of v0, p1, Landroidx/fragment/app/FragmentActivity;

    if-eqz v0, :cond_0

    check-cast p1, Landroidx/fragment/app/FragmentActivity;

    iput-object p1, p0, Lcom/motorola/ccc/ota/ui/SmartUpdateFragment;->mActivity:Landroidx/fragment/app/FragmentActivity;

    :cond_0
    return-void
.end method

.method public onConfigurationChanged(Landroid/content/res/Configuration;)V
    .locals 0

    invoke-super {p0, p1}, Landroidx/fragment/app/DialogFragment;->onConfigurationChanged(Landroid/content/res/Configuration;)V

    iget-object p0, p0, Lcom/motorola/ccc/ota/ui/SmartUpdateFragment;->timePickerDialog:Landroid/app/TimePickerDialog;

    if-eqz p0, :cond_0

    invoke-virtual {p0}, Landroid/app/TimePickerDialog;->dismiss()V

    :cond_0
    return-void
.end method

.method public onCreate(Landroid/os/Bundle;)V
    .locals 1

    invoke-super {p0, p1}, Landroidx/fragment/app/DialogFragment;->onCreate(Landroid/os/Bundle;)V

    new-instance p1, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    invoke-direct {p1}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;-><init>()V

    iput-object p1, p0, Lcom/motorola/ccc/ota/ui/SmartUpdateFragment;->settings:Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    const/4 p1, 0x0

    const v0, 0x7f0f00ca

    invoke-virtual {p0, p1, v0}, Lcom/motorola/ccc/ota/ui/SmartUpdateFragment;->setStyle(II)V

    return-void
.end method

.method public onCreateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;Landroid/os/Bundle;)Landroid/view/View;
    .locals 1

    const p3, 0x7f0c005a

    const/4 v0, 0x0

    invoke-virtual {p1, p3, p2, v0}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object p1

    iput-object p1, p0, Lcom/motorola/ccc/ota/ui/SmartUpdateFragment;->mRootView:Landroid/view/View;

    invoke-virtual {p0}, Lcom/motorola/ccc/ota/ui/SmartUpdateFragment;->getArguments()Landroid/os/Bundle;

    move-result-object p1

    const-string p2, "activityIntent"

    invoke-virtual {p1, p2}, Landroid/os/Bundle;->getParcelable(Ljava/lang/String;)Landroid/os/Parcelable;

    move-result-object p1

    check-cast p1, Landroid/content/Intent;

    iput-object p1, p0, Lcom/motorola/ccc/ota/ui/SmartUpdateFragment;->activityIntent:Landroid/content/Intent;

    const-string p2, "com.motorola.blur.service.blur.update.launch_mode"

    invoke-virtual {p1, p2}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    iput-object p1, p0, Lcom/motorola/ccc/ota/ui/SmartUpdateFragment;->mLaunchMode:Ljava/lang/String;

    invoke-virtual {p0}, Lcom/motorola/ccc/ota/ui/SmartUpdateFragment;->getDialog()Landroid/app/Dialog;

    move-result-object p1

    invoke-static {p1}, Lcom/motorola/ccc/ota/ui/UpdaterUtils;->setNavBarColorFromDialog(Landroid/app/Dialog;)V

    invoke-virtual {p0}, Lcom/motorola/ccc/ota/ui/SmartUpdateFragment;->getDialog()Landroid/app/Dialog;

    move-result-object p1

    invoke-virtual {p1}, Landroid/app/Dialog;->getWindow()Landroid/view/Window;

    move-result-object p1

    invoke-virtual {p1, v0}, Landroid/view/Window;->setStatusBarColor(I)V

    iget-object p2, p0, Lcom/motorola/ccc/ota/ui/SmartUpdateFragment;->mContext:Landroid/content/Context;

    invoke-static {p2}, Lcom/motorola/ccc/ota/ui/UpdaterUtils;->isBatterySaverEnabled(Landroid/content/Context;)Z

    move-result p2

    if-nez p2, :cond_0

    new-instance p2, Landroidx/core/view/WindowInsetsControllerCompat;

    invoke-virtual {p1}, Landroid/view/Window;->getDecorView()Landroid/view/View;

    move-result-object p3

    invoke-direct {p2, p1, p3}, Landroidx/core/view/WindowInsetsControllerCompat;-><init>(Landroid/view/Window;Landroid/view/View;)V

    iget-object p1, p0, Lcom/motorola/ccc/ota/ui/SmartUpdateFragment;->mContext:Landroid/content/Context;

    const-string p3, "uimode"

    invoke-virtual {p1, p3}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Landroid/app/UiModeManager;

    invoke-virtual {p1}, Landroid/app/UiModeManager;->getNightMode()I

    move-result p1

    const/4 p3, 0x2

    if-eq p1, p3, :cond_0

    const/4 p1, 0x1

    invoke-virtual {p2, p1}, Landroidx/core/view/WindowInsetsControllerCompat;->setAppearanceLightStatusBars(Z)V

    invoke-virtual {p2, p1}, Landroidx/core/view/WindowInsetsControllerCompat;->setAppearanceLightNavigationBars(Z)V

    :cond_0
    invoke-direct {p0}, Lcom/motorola/ccc/ota/ui/SmartUpdateFragment;->findViewsById()V

    invoke-direct {p0}, Lcom/motorola/ccc/ota/ui/SmartUpdateFragment;->handleButtons()V

    invoke-direct {p0}, Lcom/motorola/ccc/ota/ui/SmartUpdateFragment;->initUI()V

    iget-object p0, p0, Lcom/motorola/ccc/ota/ui/SmartUpdateFragment;->mRootView:Landroid/view/View;

    return-object p0
.end method

.method public onDestroyView()V
    .locals 3

    iget-object v0, p0, Lcom/motorola/ccc/ota/ui/SmartUpdateFragment;->settings:Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    invoke-static {v0}, Lcom/motorola/ccc/ota/utils/SmartUpdateUtils;->isSmartUpdateEnabledByUser(Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;)Z

    move-result v0

    if-nez v0, :cond_0

    iget-object v0, p0, Lcom/motorola/ccc/ota/ui/SmartUpdateFragment;->settings:Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    sget-object v1, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->STATS_SMART_UPDATE_VISITED_BUT_DISABLED:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    invoke-virtual {v0, v1}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->incrementPrefs(Lcom/motorola/otalib/common/settings/ISetting;)V

    :cond_0
    invoke-static {}, Lcom/motorola/ccc/ota/env/OtaApplication;->getGlobalContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0}, Lcom/motorola/ccc/ota/utils/SmartUpdateUtils;->decideToShowSmartUpdateSuggestion(Landroid/content/Context;)V

    invoke-virtual {p0}, Lcom/motorola/ccc/ota/ui/SmartUpdateFragment;->getFragmentManager()Landroidx/fragment/app/FragmentManager;

    move-result-object v0

    invoke-virtual {v0}, Landroidx/fragment/app/FragmentManager;->getFragments()Ljava/util/List;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :cond_1
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_2

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroidx/fragment/app/Fragment;

    iget-object v2, p0, Lcom/motorola/ccc/ota/ui/SmartUpdateFragment;->mActivity:Landroidx/fragment/app/FragmentActivity;

    invoke-virtual {v2}, Landroidx/fragment/app/FragmentActivity;->isFinishing()Z

    move-result v2

    if-nez v2, :cond_1

    instance-of v2, v1, Lcom/motorola/ccc/ota/utils/SmartUpdateUtils$OnSmartUpdateConfigChangedLister;

    if-eqz v2, :cond_1

    check-cast v1, Lcom/motorola/ccc/ota/utils/SmartUpdateUtils$OnSmartUpdateConfigChangedLister;

    invoke-interface {v1}, Lcom/motorola/ccc/ota/utils/SmartUpdateUtils$OnSmartUpdateConfigChangedLister;->onSmartUpdateConfigChanged()V

    goto :goto_0

    :cond_2
    invoke-super {p0}, Landroidx/fragment/app/DialogFragment;->onDestroyView()V

    return-void
.end method
