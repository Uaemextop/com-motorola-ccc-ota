.class Lcom/google/android/setupdesign/view/IconUniformityAppImageView$1;
.super Landroid/view/ViewOutlineProvider;
.source "IconUniformityAppImageView.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/google/android/setupdesign/view/IconUniformityAppImageView;->bindView(Lcom/google/android/setupdesign/view/IconUniformityAppImageViewBindable$IconUniformityAppImageViewData;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/google/android/setupdesign/view/IconUniformityAppImageView;

.field final synthetic val$radius:F


# direct methods
.method constructor <init>(Lcom/google/android/setupdesign/view/IconUniformityAppImageView;F)V
    .locals 0

    iput-object p1, p0, Lcom/google/android/setupdesign/view/IconUniformityAppImageView$1;->this$0:Lcom/google/android/setupdesign/view/IconUniformityAppImageView;

    iput p2, p0, Lcom/google/android/setupdesign/view/IconUniformityAppImageView$1;->val$radius:F

    invoke-direct {p0}, Landroid/view/ViewOutlineProvider;-><init>()V

    return-void
.end method


# virtual methods
.method public getOutline(Landroid/view/View;Landroid/graphics/Outline;)V
    .locals 6

    iget-object p1, p0, Lcom/google/android/setupdesign/view/IconUniformityAppImageView$1;->this$0:Lcom/google/android/setupdesign/view/IconUniformityAppImageView;

    invoke-virtual {p1}, Lcom/google/android/setupdesign/view/IconUniformityAppImageView;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object p1

    iget v3, p1, Landroid/view/ViewGroup$LayoutParams;->width:I

    iget-object p1, p0, Lcom/google/android/setupdesign/view/IconUniformityAppImageView$1;->this$0:Lcom/google/android/setupdesign/view/IconUniformityAppImageView;

    invoke-virtual {p1}, Lcom/google/android/setupdesign/view/IconUniformityAppImageView;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object p1

    iget v4, p1, Landroid/view/ViewGroup$LayoutParams;->height:I

    iget v5, p0, Lcom/google/android/setupdesign/view/IconUniformityAppImageView$1;->val$radius:F

    const/4 v1, 0x0

    const/4 v2, 0x0

    move-object v0, p2

    invoke-virtual/range {v0 .. v5}, Landroid/graphics/Outline;->setRoundRect(IIIIF)V

    return-void
.end method
