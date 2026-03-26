.class Lcom/motorola/ccc/ota/ui/UpdaterUtils$1;
.super Ljava/lang/Object;
.source "UpdaterUtils.java"

# interfaces
.implements Landroid/widget/ExpandableListView$OnGroupExpandListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/motorola/ccc/ota/ui/UpdaterUtils;->handleExpList(Landroid/widget/ExpandableListView;Ljava/lang/String;)Landroid/widget/ExpandableListView;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field private firstgroup:Z

.field private lastExpandedPosition:I

.field final synthetic val$baseScreenStats:Ljava/lang/String;

.field final synthetic val$expandableListView:Landroid/widget/ExpandableListView;


# direct methods
.method constructor <init>(Landroid/widget/ExpandableListView;Ljava/lang/String;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    iput-object p1, p0, Lcom/motorola/ccc/ota/ui/UpdaterUtils$1;->val$expandableListView:Landroid/widget/ExpandableListView;

    iput-object p2, p0, Lcom/motorola/ccc/ota/ui/UpdaterUtils$1;->val$baseScreenStats:Ljava/lang/String;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 p1, -0x1

    iput p1, p0, Lcom/motorola/ccc/ota/ui/UpdaterUtils$1;->lastExpandedPosition:I

    const/4 p1, 0x1

    iput-boolean p1, p0, Lcom/motorola/ccc/ota/ui/UpdaterUtils$1;->firstgroup:Z

    return-void
.end method


# virtual methods
.method public onGroupExpand(I)V
    .locals 2

    iget-boolean v0, p0, Lcom/motorola/ccc/ota/ui/UpdaterUtils$1;->firstgroup:Z

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/motorola/ccc/ota/ui/UpdaterUtils$1;->val$expandableListView:Landroid/widget/ExpandableListView;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/widget/ExpandableListView;->collapseGroup(I)Z

    iput-boolean v1, p0, Lcom/motorola/ccc/ota/ui/UpdaterUtils$1;->firstgroup:Z

    goto :goto_0

    :cond_0
    iget v0, p0, Lcom/motorola/ccc/ota/ui/UpdaterUtils$1;->lastExpandedPosition:I

    const/4 v1, -0x1

    if-eq v0, v1, :cond_1

    if-eq p1, v0, :cond_1

    iget-object v1, p0, Lcom/motorola/ccc/ota/ui/UpdaterUtils$1;->val$expandableListView:Landroid/widget/ExpandableListView;

    invoke-virtual {v1, v0}, Landroid/widget/ExpandableListView;->collapseGroup(I)Z

    :cond_1
    :goto_0
    iput p1, p0, Lcom/motorola/ccc/ota/ui/UpdaterUtils$1;->lastExpandedPosition:I

    invoke-static {}, Lcom/motorola/ccc/ota/ui/UpdaterUtils;->-$$Nest$sfgetsettings()Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    move-result-object p1

    sget-object v0, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->STATS_EXPANDABLE_LIST_CLICK_SCREEN:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    invoke-virtual {p1, v0}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->getString(Lcom/motorola/otalib/common/settings/ISetting;)Ljava/lang/String;

    move-result-object p1

    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result p1

    if-eqz p1, :cond_2

    const-string p1, "history"

    iget-object v0, p0, Lcom/motorola/ccc/ota/ui/UpdaterUtils$1;->val$baseScreenStats:Ljava/lang/String;

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-nez p1, :cond_2

    invoke-static {}, Lcom/motorola/ccc/ota/ui/UpdaterUtils;->-$$Nest$sfgetsettings()Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    move-result-object p1

    sget-object v0, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->STATS_EXPANDABLE_LIST_CLICK_SCREEN:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    iget-object v1, p0, Lcom/motorola/ccc/ota/ui/UpdaterUtils$1;->val$baseScreenStats:Ljava/lang/String;

    invoke-virtual {p1, v0, v1}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->setString(Lcom/motorola/otalib/common/settings/ISetting;Ljava/lang/String;)V

    :cond_2
    iget-object p0, p0, Lcom/motorola/ccc/ota/ui/UpdaterUtils$1;->val$expandableListView:Landroid/widget/ExpandableListView;

    invoke-static {p0}, Lcom/motorola/ccc/ota/ui/UpdaterUtils;->setListViewHeight(Landroid/widget/ExpandableListView;)V

    return-void
.end method
