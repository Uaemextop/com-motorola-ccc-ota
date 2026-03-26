.class Lcom/motorola/ccc/ota/ui/UpdaterUtils$2;
.super Ljava/lang/Object;
.source "UpdaterUtils.java"

# interfaces
.implements Landroid/widget/ExpandableListView$OnGroupCollapseListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/motorola/ccc/ota/ui/UpdaterUtils;->handleExpList(Landroid/widget/ExpandableListView;Ljava/lang/String;)Landroid/widget/ExpandableListView;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic val$expandableListView:Landroid/widget/ExpandableListView;


# direct methods
.method constructor <init>(Landroid/widget/ExpandableListView;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    iput-object p1, p0, Lcom/motorola/ccc/ota/ui/UpdaterUtils$2;->val$expandableListView:Landroid/widget/ExpandableListView;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onGroupCollapse(I)V
    .locals 0

    iget-object p0, p0, Lcom/motorola/ccc/ota/ui/UpdaterUtils$2;->val$expandableListView:Landroid/widget/ExpandableListView;

    invoke-static {p0}, Lcom/motorola/ccc/ota/ui/UpdaterUtils;->setListViewHeight(Landroid/widget/ExpandableListView;)V

    return-void
.end method
