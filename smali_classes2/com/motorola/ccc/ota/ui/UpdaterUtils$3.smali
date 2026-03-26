.class Lcom/motorola/ccc/ota/ui/UpdaterUtils$3;
.super Lcom/motorola/ccc/ota/ui/ReleaseNotesAdapter;
.source "UpdaterUtils.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/motorola/ccc/ota/ui/UpdaterUtils;->setExpandableList(Landroid/widget/ExpandableListView;ZLjava/lang/String;Landroid/widget/TextView;Landroid/content/Context;Lcom/motorola/ccc/ota/ui/updateType/UpdateType$UpdateTypeInterface;Landroid/view/View;)Landroid/widget/ExpandableListView;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic val$context:Landroid/content/Context;


# direct methods
.method constructor <init>(Landroid/content/Context;Ljava/util/List;Ljava/util/HashMap;Landroid/content/Context;)V
    .locals 0

    iput-object p4, p0, Lcom/motorola/ccc/ota/ui/UpdaterUtils$3;->val$context:Landroid/content/Context;

    invoke-direct {p0, p1, p2, p3}, Lcom/motorola/ccc/ota/ui/ReleaseNotesAdapter;-><init>(Landroid/content/Context;Ljava/util/List;Ljava/util/HashMap;)V

    return-void
.end method


# virtual methods
.method public getGroupView(IZLandroid/view/View;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 0

    invoke-super {p0, p1, p2, p3, p4}, Lcom/motorola/ccc/ota/ui/ReleaseNotesAdapter;->getGroupView(IZLandroid/view/View;Landroid/view/ViewGroup;)Landroid/view/View;

    move-result-object p1

    const p2, 0x7f0900f4

    invoke-virtual {p1, p2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p2

    check-cast p2, Landroid/widget/TextView;

    iget-object p0, p0, Lcom/motorola/ccc/ota/ui/UpdaterUtils$3;->val$context:Landroid/content/Context;

    const p3, 0x7f060021

    invoke-virtual {p0, p3}, Landroid/content/Context;->getColor(I)I

    move-result p0

    invoke-virtual {p2, p0}, Landroid/widget/TextView;->setTextColor(I)V

    return-object p1
.end method
