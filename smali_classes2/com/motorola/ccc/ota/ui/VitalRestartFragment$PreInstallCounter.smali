.class Lcom/motorola/ccc/ota/ui/VitalRestartFragment$PreInstallCounter;
.super Landroid/os/CountDownTimer;
.source "VitalRestartFragment.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/motorola/ccc/ota/ui/VitalRestartFragment;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "PreInstallCounter"
.end annotation


# instance fields
.field private mWarningTextCounter:Landroid/widget/TextView;

.field resources:Landroid/content/res/Resources;

.field final synthetic this$0:Lcom/motorola/ccc/ota/ui/VitalRestartFragment;


# direct methods
.method public constructor <init>(Lcom/motorola/ccc/ota/ui/VitalRestartFragment;JJLandroid/widget/TextView;)V
    .locals 0

    iput-object p1, p0, Lcom/motorola/ccc/ota/ui/VitalRestartFragment$PreInstallCounter;->this$0:Lcom/motorola/ccc/ota/ui/VitalRestartFragment;

    invoke-direct {p0, p2, p3, p4, p5}, Landroid/os/CountDownTimer;-><init>(JJ)V

    iput-object p6, p0, Lcom/motorola/ccc/ota/ui/VitalRestartFragment$PreInstallCounter;->mWarningTextCounter:Landroid/widget/TextView;

    invoke-virtual {p1}, Lcom/motorola/ccc/ota/ui/VitalRestartFragment;->getResources()Landroid/content/res/Resources;

    move-result-object p1

    iput-object p1, p0, Lcom/motorola/ccc/ota/ui/VitalRestartFragment$PreInstallCounter;->resources:Landroid/content/res/Resources;

    return-void
.end method

.method private showPreInstallWarningText(I)V
    .locals 4

    new-instance v0, Landroid/text/SpannableString;

    iget-object v1, p0, Lcom/motorola/ccc/ota/ui/VitalRestartFragment$PreInstallCounter;->resources:Landroid/content/res/Resources;

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    filled-new-array {v2}, [Ljava/lang/Object;

    move-result-object v2

    const/high16 v3, 0x7f0d0000

    invoke-virtual {v1, v3, p1, v2}, Landroid/content/res/Resources;->getQuantityString(II[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p1

    invoke-direct {v0, p1}, Landroid/text/SpannableString;-><init>(Ljava/lang/CharSequence;)V

    iget-object p0, p0, Lcom/motorola/ccc/ota/ui/VitalRestartFragment$PreInstallCounter;->mWarningTextCounter:Landroid/widget/TextView;

    invoke-virtual {p0, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    return-void
.end method


# virtual methods
.method public onFinish()V
    .locals 0

    iget-object p0, p0, Lcom/motorola/ccc/ota/ui/VitalRestartFragment$PreInstallCounter;->this$0:Lcom/motorola/ccc/ota/ui/VitalRestartFragment;

    invoke-static {p0}, Lcom/motorola/ccc/ota/ui/VitalRestartFragment;->-$$Nest$mproceedWithReboot(Lcom/motorola/ccc/ota/ui/VitalRestartFragment;)V

    return-void
.end method

.method public onTick(J)V
    .locals 0

    long-to-int p1, p1

    div-int/lit16 p1, p1, 0x3e8

    invoke-direct {p0, p1}, Lcom/motorola/ccc/ota/ui/VitalRestartFragment$PreInstallCounter;->showPreInstallWarningText(I)V

    return-void
.end method

.method public refreshUI(Landroid/widget/TextView;)V
    .locals 0

    iput-object p1, p0, Lcom/motorola/ccc/ota/ui/VitalRestartFragment$PreInstallCounter;->mWarningTextCounter:Landroid/widget/TextView;

    return-void
.end method

.method public stop()V
    .locals 0

    invoke-virtual {p0}, Lcom/motorola/ccc/ota/ui/VitalRestartFragment$PreInstallCounter;->cancel()V

    return-void
.end method
