.class Lcom/motorola/ccc/ota/ui/CloudPickerActivity$1;
.super Ljava/lang/Object;
.source "CloudPickerActivity.java"

# interfaces
.implements Landroid/widget/ExpandableListView$OnChildClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/motorola/ccc/ota/ui/CloudPickerActivity;->onCreate(Landroid/os/Bundle;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/motorola/ccc/ota/ui/CloudPickerActivity;


# direct methods
.method constructor <init>(Lcom/motorola/ccc/ota/ui/CloudPickerActivity;)V
    .locals 0

    iput-object p1, p0, Lcom/motorola/ccc/ota/ui/CloudPickerActivity$1;->this$0:Lcom/motorola/ccc/ota/ui/CloudPickerActivity;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onChildClick(Landroid/widget/ExpandableListView;Landroid/view/View;IIJ)Z
    .locals 0

    new-instance p1, Ljava/lang/StringBuilder;

    const-string p2, "changing master cloud to: "

    invoke-direct {p1, p2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-static {}, Lcom/motorola/ccc/ota/ui/CloudPickerActivity;->-$$Nest$sfgetmasters()[[Ljava/lang/String;

    move-result-object p2

    aget-object p2, p2, p3

    aget-object p2, p2, p4

    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    const-string p2, "OtaApp"

    invoke-static {p2, p1}, Lcom/motorola/ccc/ota/utils/Logger;->debug(Ljava/lang/String;Ljava/lang/String;)V

    new-instance p1, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    invoke-direct {p1}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;-><init>()V

    sget-object p2, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->MASTER_CLOUD:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    invoke-static {}, Lcom/motorola/ccc/ota/ui/CloudPickerActivity;->-$$Nest$sfgetmasters()[[Ljava/lang/String;

    move-result-object p5

    aget-object p3, p5, p3

    aget-object p3, p3, p4

    invoke-virtual {p1, p2, p3}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->setString(Lcom/motorola/otalib/common/settings/ISetting;Ljava/lang/String;)V

    iget-object p0, p0, Lcom/motorola/ccc/ota/ui/CloudPickerActivity$1;->this$0:Lcom/motorola/ccc/ota/ui/CloudPickerActivity;

    invoke-virtual {p0}, Lcom/motorola/ccc/ota/ui/CloudPickerActivity;->finish()V

    const/4 p0, 0x1

    return p0
.end method
