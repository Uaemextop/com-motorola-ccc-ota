.class public Lcom/motorola/ccc/ota/ui/CloudPickerActivity;
.super Landroid/app/Activity;
.source "CloudPickerActivity.java"


# static fields
.field public static final TAG:Ljava/lang/String; = "TAG"

.field private static final cloud_groups:[Ljava/lang/String;

.field private static final cloud_names:[[Ljava/lang/String;

.field private static groups:[Ljava/lang/String;

.field private static masters:[[Ljava/lang/String;


# instance fields
.field private childData:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ljava/util/List<",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;>;>;"
        }
    .end annotation
.end field

.field private mAdapter:Landroid/widget/ExpandableListAdapter;

.field private topLevelData:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;>;"
        }
    .end annotation
.end field


# direct methods
.method static bridge synthetic -$$Nest$sfgetmasters()[[Ljava/lang/String;
    .locals 1

    sget-object v0, Lcom/motorola/ccc/ota/ui/CloudPickerActivity;->masters:[[Ljava/lang/String;

    return-object v0
.end method

.method static constructor <clinit>()V
    .locals 9

    const/4 v0, 0x6

    new-array v1, v0, [Ljava/lang/String;

    const-string v2, "QA"

    const/4 v3, 0x0

    aput-object v2, v1, v3

    const-string v2, "Production"

    const/4 v4, 0x1

    aput-object v2, v1, v4

    const-string v2, "Staging"

    const/4 v5, 0x2

    aput-object v2, v1, v5

    const-string v2, "Dev"

    const/4 v6, 0x3

    aput-object v2, v1, v6

    const-string v2, "China"

    const/4 v7, 0x4

    aput-object v2, v1, v7

    const-string v2, "ChinaStaging"

    const/4 v8, 0x5

    aput-object v2, v1, v8

    sput-object v1, Lcom/motorola/ccc/ota/ui/CloudPickerActivity;->cloud_groups:[Ljava/lang/String;

    new-array v0, v0, [[Ljava/lang/String;

    new-array v1, v4, [Ljava/lang/String;

    const-string v2, "moto-cds-qa.appspot.com"

    aput-object v2, v1, v3

    aput-object v1, v0, v3

    new-array v1, v4, [Ljava/lang/String;

    const-string v2, "moto-cds.appspot.com"

    aput-object v2, v1, v3

    aput-object v1, v0, v4

    new-array v1, v4, [Ljava/lang/String;

    const-string v2, "moto-cds-staging.appspot.com"

    aput-object v2, v1, v3

    aput-object v1, v0, v5

    new-array v1, v4, [Ljava/lang/String;

    const-string v2, "moto-cds-dev.appspot.com"

    aput-object v2, v1, v3

    aput-object v1, v0, v6

    new-array v1, v4, [Ljava/lang/String;

    const-string v2, "moto-cds.svcmot.cn"

    aput-object v2, v1, v3

    aput-object v1, v0, v7

    new-array v1, v4, [Ljava/lang/String;

    const-string v2, "ota-cn-sdc.blurdev.com"

    aput-object v2, v1, v3

    aput-object v1, v0, v8

    sput-object v0, Lcom/motorola/ccc/ota/ui/CloudPickerActivity;->cloud_names:[[Ljava/lang/String;

    return-void
.end method

.method public constructor <init>()V
    .locals 1

    invoke-direct {p0}, Landroid/app/Activity;-><init>()V

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/motorola/ccc/ota/ui/CloudPickerActivity;->topLevelData:Ljava/util/List;

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/motorola/ccc/ota/ui/CloudPickerActivity;->childData:Ljava/util/List;

    return-void
.end method


# virtual methods
.method public onCreate(Landroid/os/Bundle;)V
    .locals 13

    const-string v0, "OtaApp"

    const-string v1, "CloudPickerActivity.onCreate()"

    invoke-static {v0, v1}, Lcom/motorola/ccc/ota/utils/Logger;->debug(Ljava/lang/String;Ljava/lang/String;)V

    invoke-super {p0, p1}, Landroid/app/Activity;->onCreate(Landroid/os/Bundle;)V

    invoke-virtual {p0}, Lcom/motorola/ccc/ota/ui/CloudPickerActivity;->getResources()Landroid/content/res/Resources;

    move-result-object p1

    const v0, 0x7f0e0119

    invoke-virtual {p1, v0}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object p1

    invoke-static {p1}, Ljava/lang/Boolean;->valueOf(Ljava/lang/String;)Ljava/lang/Boolean;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/Boolean;->booleanValue()Z

    move-result p1

    const v0, 0x7f0c0021

    const/4 v1, 0x0

    const/4 v2, 0x1

    if-ne p1, v2, :cond_0

    invoke-virtual {p0, v2}, Lcom/motorola/ccc/ota/ui/CloudPickerActivity;->requestWindowFeature(I)Z

    invoke-virtual {p0, v0}, Lcom/motorola/ccc/ota/ui/CloudPickerActivity;->setContentView(I)V

    const p1, 0x7f090002

    invoke-virtual {p0, p1}, Lcom/motorola/ccc/ota/ui/CloudPickerActivity;->findViewById(I)Landroid/view/View;

    move-result-object p1

    invoke-virtual {p1, v1, v1, v1, v1}, Landroid/view/View;->setPadding(IIII)V

    goto :goto_0

    :cond_0
    invoke-virtual {p0, v0}, Lcom/motorola/ccc/ota/ui/CloudPickerActivity;->setContentView(I)V

    :goto_0
    sget-object p1, Lcom/motorola/ccc/ota/ui/CloudPickerActivity;->cloud_groups:[Ljava/lang/String;

    sput-object p1, Lcom/motorola/ccc/ota/ui/CloudPickerActivity;->groups:[Ljava/lang/String;

    sget-object p1, Lcom/motorola/ccc/ota/ui/CloudPickerActivity;->cloud_names:[[Ljava/lang/String;

    sput-object p1, Lcom/motorola/ccc/ota/ui/CloudPickerActivity;->masters:[[Ljava/lang/String;

    move p1, v1

    :goto_1
    sget-object v0, Lcom/motorola/ccc/ota/ui/CloudPickerActivity;->groups:[Ljava/lang/String;

    array-length v0, v0

    const-string v3, "TAG"

    if-ge p1, v0, :cond_2

    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iget-object v4, p0, Lcom/motorola/ccc/ota/ui/CloudPickerActivity;->topLevelData:Ljava/util/List;

    invoke-interface {v4, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    sget-object v4, Lcom/motorola/ccc/ota/ui/CloudPickerActivity;->groups:[Ljava/lang/String;

    aget-object v4, v4, p1

    invoke-interface {v0, v3, v4}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    move v4, v1

    :goto_2
    sget-object v5, Lcom/motorola/ccc/ota/ui/CloudPickerActivity;->masters:[[Ljava/lang/String;

    aget-object v5, v5, p1

    array-length v5, v5

    if-ge v4, v5, :cond_1

    new-instance v5, Ljava/util/HashMap;

    invoke-direct {v5}, Ljava/util/HashMap;-><init>()V

    invoke-interface {v0, v5}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    sget-object v6, Lcom/motorola/ccc/ota/ui/CloudPickerActivity;->masters:[[Ljava/lang/String;

    aget-object v6, v6, p1

    aget-object v6, v6, v4

    invoke-interface {v5, v3, v6}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    add-int/lit8 v4, v4, 0x1

    goto :goto_2

    :cond_1
    iget-object v3, p0, Lcom/motorola/ccc/ota/ui/CloudPickerActivity;->childData:Ljava/util/List;

    invoke-interface {v3, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    add-int/lit8 p1, p1, 0x1

    goto :goto_1

    :cond_2
    new-instance p1, Landroid/widget/SimpleExpandableListAdapter;

    iget-object v5, p0, Lcom/motorola/ccc/ota/ui/CloudPickerActivity;->topLevelData:Ljava/util/List;

    new-array v7, v2, [Ljava/lang/String;

    aput-object v3, v7, v1

    const v0, 0x1020014

    filled-new-array {v0}, [I

    move-result-object v8

    iget-object v9, p0, Lcom/motorola/ccc/ota/ui/CloudPickerActivity;->childData:Ljava/util/List;

    new-array v11, v2, [Ljava/lang/String;

    aput-object v3, v11, v1

    filled-new-array {v0}, [I

    move-result-object v12

    const v6, 0x1090006

    const v10, 0x1090007

    move-object v3, p1

    move-object v4, p0

    invoke-direct/range {v3 .. v12}, Landroid/widget/SimpleExpandableListAdapter;-><init>(Landroid/content/Context;Ljava/util/List;I[Ljava/lang/String;[ILjava/util/List;I[Ljava/lang/String;[I)V

    iput-object p1, p0, Lcom/motorola/ccc/ota/ui/CloudPickerActivity;->mAdapter:Landroid/widget/ExpandableListAdapter;

    const p1, 0x102000a

    invoke-virtual {p0, p1}, Lcom/motorola/ccc/ota/ui/CloudPickerActivity;->findViewById(I)Landroid/view/View;

    move-result-object p1

    check-cast p1, Landroid/widget/ExpandableListView;

    iget-object v0, p0, Lcom/motorola/ccc/ota/ui/CloudPickerActivity;->mAdapter:Landroid/widget/ExpandableListAdapter;

    invoke-virtual {p1, v0}, Landroid/widget/ExpandableListView;->setAdapter(Landroid/widget/ExpandableListAdapter;)V

    new-instance v0, Lcom/motorola/ccc/ota/ui/CloudPickerActivity$1;

    invoke-direct {v0, p0}, Lcom/motorola/ccc/ota/ui/CloudPickerActivity$1;-><init>(Lcom/motorola/ccc/ota/ui/CloudPickerActivity;)V

    invoke-virtual {p1, v0}, Landroid/widget/ExpandableListView;->setOnChildClickListener(Landroid/widget/ExpandableListView$OnChildClickListener;)V

    return-void
.end method

.method protected onDestroy()V
    .locals 0

    invoke-super {p0}, Landroid/app/Activity;->onDestroy()V

    return-void
.end method

.method public onStart()V
    .locals 6

    invoke-super {p0}, Landroid/app/Activity;->onStart()V

    new-instance v0, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    invoke-direct {v0}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;-><init>()V

    sget-object v1, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->MASTER_CLOUD:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    invoke-virtual {v0, v1}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->getString(Lcom/motorola/otalib/common/settings/ISetting;)Ljava/lang/String;

    move-result-object v0

    const v1, 0x7f090002

    invoke-virtual {p0, v1}, Lcom/motorola/ccc/ota/ui/CloudPickerActivity;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/TextView;

    new-instance v2, Ljava/lang/StringBuilder;

    const-string v3, "Current master cloud: "

    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    const v1, 0x102000a

    invoke-virtual {p0, v1}, Lcom/motorola/ccc/ota/ui/CloudPickerActivity;->findViewById(I)Landroid/view/View;

    move-result-object p0

    check-cast p0, Landroid/widget/ExpandableListView;

    const/4 v1, 0x0

    move v2, v1

    :goto_0
    sget-object v3, Lcom/motorola/ccc/ota/ui/CloudPickerActivity;->masters:[[Ljava/lang/String;

    array-length v3, v3

    if-ge v2, v3, :cond_2

    move v3, v1

    :goto_1
    sget-object v4, Lcom/motorola/ccc/ota/ui/CloudPickerActivity;->masters:[[Ljava/lang/String;

    aget-object v4, v4, v2

    array-length v5, v4

    if-ge v3, v5, :cond_1

    aget-object v4, v4, v3

    invoke-virtual {v0, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_0

    const/4 v4, 0x1

    invoke-virtual {p0, v2, v3, v4}, Landroid/widget/ExpandableListView;->setSelectedChild(IIZ)Z

    goto :goto_2

    :cond_0
    add-int/lit8 v3, v3, 0x1

    goto :goto_1

    :cond_1
    :goto_2
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    :cond_2
    return-void
.end method
