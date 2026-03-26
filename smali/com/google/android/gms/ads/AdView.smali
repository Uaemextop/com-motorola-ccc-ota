.class public final Lcom/google/android/gms/ads/AdView;
.super Landroid/view/ViewGroup;


# instance fields
.field private final li:Lcom/google/android/gms/internal/bh;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 0

    invoke-direct {p0, p1}, Landroid/view/ViewGroup;-><init>(Landroid/content/Context;)V

    new-instance p1, Lcom/google/android/gms/internal/bh;

    invoke-direct {p1, p0}, Lcom/google/android/gms/internal/bh;-><init>(Landroid/view/ViewGroup;)V

    iput-object p1, p0, Lcom/google/android/gms/ads/AdView;->li:Lcom/google/android/gms/internal/bh;

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 1

    invoke-direct {p0, p1, p2}, Landroid/view/ViewGroup;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    new-instance p1, Lcom/google/android/gms/internal/bh;

    const/4 v0, 0x0

    invoke-direct {p1, p0, p2, v0}, Lcom/google/android/gms/internal/bh;-><init>(Landroid/view/ViewGroup;Landroid/util/AttributeSet;Z)V

    iput-object p1, p0, Lcom/google/android/gms/ads/AdView;->li:Lcom/google/android/gms/internal/bh;

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0

    invoke-direct {p0, p1, p2, p3}, Landroid/view/ViewGroup;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    new-instance p1, Lcom/google/android/gms/internal/bh;

    const/4 p3, 0x0

    invoke-direct {p1, p0, p2, p3}, Lcom/google/android/gms/internal/bh;-><init>(Landroid/view/ViewGroup;Landroid/util/AttributeSet;Z)V

    iput-object p1, p0, Lcom/google/android/gms/ads/AdView;->li:Lcom/google/android/gms/internal/bh;

    return-void
.end method


# virtual methods
.method public destroy()V
    .locals 0

    iget-object p0, p0, Lcom/google/android/gms/ads/AdView;->li:Lcom/google/android/gms/internal/bh;

    invoke-virtual {p0}, Lcom/google/android/gms/internal/bh;->destroy()V

    return-void
.end method

.method public getAdListener()Lcom/google/android/gms/ads/AdListener;
    .locals 0

    iget-object p0, p0, Lcom/google/android/gms/ads/AdView;->li:Lcom/google/android/gms/internal/bh;

    invoke-virtual {p0}, Lcom/google/android/gms/internal/bh;->getAdListener()Lcom/google/android/gms/ads/AdListener;

    move-result-object p0

    return-object p0
.end method

.method public getAdSize()Lcom/google/android/gms/ads/AdSize;
    .locals 0

    iget-object p0, p0, Lcom/google/android/gms/ads/AdView;->li:Lcom/google/android/gms/internal/bh;

    invoke-virtual {p0}, Lcom/google/android/gms/internal/bh;->getAdSize()Lcom/google/android/gms/ads/AdSize;

    move-result-object p0

    return-object p0
.end method

.method public getAdUnitId()Ljava/lang/String;
    .locals 0

    iget-object p0, p0, Lcom/google/android/gms/ads/AdView;->li:Lcom/google/android/gms/internal/bh;

    invoke-virtual {p0}, Lcom/google/android/gms/internal/bh;->getAdUnitId()Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method public getInAppPurchaseListener()Lcom/google/android/gms/ads/purchase/InAppPurchaseListener;
    .locals 0

    iget-object p0, p0, Lcom/google/android/gms/ads/AdView;->li:Lcom/google/android/gms/internal/bh;

    invoke-virtual {p0}, Lcom/google/android/gms/internal/bh;->getInAppPurchaseListener()Lcom/google/android/gms/ads/purchase/InAppPurchaseListener;

    move-result-object p0

    return-object p0
.end method

.method public getMediationAdapterClassName()Ljava/lang/String;
    .locals 0

    iget-object p0, p0, Lcom/google/android/gms/ads/AdView;->li:Lcom/google/android/gms/internal/bh;

    invoke-virtual {p0}, Lcom/google/android/gms/internal/bh;->getMediationAdapterClassName()Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method public loadAd(Lcom/google/android/gms/ads/AdRequest;)V
    .locals 0

    iget-object p0, p0, Lcom/google/android/gms/ads/AdView;->li:Lcom/google/android/gms/internal/bh;

    invoke-virtual {p1}, Lcom/google/android/gms/ads/AdRequest;->V()Lcom/google/android/gms/internal/bg;

    move-result-object p1

    invoke-virtual {p0, p1}, Lcom/google/android/gms/internal/bh;->a(Lcom/google/android/gms/internal/bg;)V

    return-void
.end method

.method protected onLayout(ZIIII)V
    .locals 1

    const/4 p1, 0x0

    invoke-virtual {p0, p1}, Lcom/google/android/gms/ads/AdView;->getChildAt(I)Landroid/view/View;

    move-result-object p0

    if-eqz p0, :cond_0

    invoke-virtual {p0}, Landroid/view/View;->getVisibility()I

    move-result p1

    const/16 v0, 0x8

    if-eq p1, v0, :cond_0

    invoke-virtual {p0}, Landroid/view/View;->getMeasuredWidth()I

    move-result p1

    invoke-virtual {p0}, Landroid/view/View;->getMeasuredHeight()I

    move-result v0

    sub-int/2addr p4, p2

    sub-int/2addr p4, p1

    div-int/lit8 p4, p4, 0x2

    sub-int/2addr p5, p3

    sub-int/2addr p5, v0

    div-int/lit8 p5, p5, 0x2

    add-int/2addr p1, p4

    add-int/2addr v0, p5

    invoke-virtual {p0, p4, p5, p1, v0}, Landroid/view/View;->layout(IIII)V

    :cond_0
    return-void
.end method

.method protected onMeasure(II)V
    .locals 6

    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Lcom/google/android/gms/ads/AdView;->getChildAt(I)Landroid/view/View;

    move-result-object v1

    invoke-virtual {p0}, Lcom/google/android/gms/ads/AdView;->getAdSize()Lcom/google/android/gms/ads/AdSize;

    move-result-object v2

    if-eqz v1, :cond_0

    invoke-virtual {v1}, Landroid/view/View;->getVisibility()I

    move-result v3

    const/16 v4, 0x8

    if-eq v3, v4, :cond_0

    invoke-virtual {p0, v1, p1, p2}, Lcom/google/android/gms/ads/AdView;->measureChild(Landroid/view/View;II)V

    invoke-virtual {v1}, Landroid/view/View;->getMeasuredWidth()I

    move-result v0

    invoke-virtual {v1}, Landroid/view/View;->getMeasuredHeight()I

    move-result v1

    goto :goto_0

    :cond_0
    if-eqz v2, :cond_1

    invoke-virtual {p0}, Lcom/google/android/gms/ads/AdView;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-virtual {v2, v0}, Lcom/google/android/gms/ads/AdSize;->getWidthInPixels(Landroid/content/Context;)I

    move-result v1

    invoke-virtual {v2, v0}, Lcom/google/android/gms/ads/AdSize;->getHeightInPixels(Landroid/content/Context;)I

    move-result v0

    move v5, v1

    move v1, v0

    move v0, v5

    goto :goto_0

    :cond_1
    move v1, v0

    :goto_0
    invoke-virtual {p0}, Lcom/google/android/gms/ads/AdView;->getSuggestedMinimumWidth()I

    move-result v2

    invoke-static {v0, v2}, Ljava/lang/Math;->max(II)I

    move-result v0

    invoke-virtual {p0}, Lcom/google/android/gms/ads/AdView;->getSuggestedMinimumHeight()I

    move-result v2

    invoke-static {v1, v2}, Ljava/lang/Math;->max(II)I

    move-result v1

    invoke-static {v0, p1}, Landroid/view/View;->resolveSize(II)I

    move-result p1

    invoke-static {v1, p2}, Landroid/view/View;->resolveSize(II)I

    move-result p2

    invoke-virtual {p0, p1, p2}, Lcom/google/android/gms/ads/AdView;->setMeasuredDimension(II)V

    return-void
.end method

.method public pause()V
    .locals 0

    iget-object p0, p0, Lcom/google/android/gms/ads/AdView;->li:Lcom/google/android/gms/internal/bh;

    invoke-virtual {p0}, Lcom/google/android/gms/internal/bh;->pause()V

    return-void
.end method

.method public resume()V
    .locals 0

    iget-object p0, p0, Lcom/google/android/gms/ads/AdView;->li:Lcom/google/android/gms/internal/bh;

    invoke-virtual {p0}, Lcom/google/android/gms/internal/bh;->resume()V

    return-void
.end method

.method public setAdListener(Lcom/google/android/gms/ads/AdListener;)V
    .locals 0

    iget-object p0, p0, Lcom/google/android/gms/ads/AdView;->li:Lcom/google/android/gms/internal/bh;

    invoke-virtual {p0, p1}, Lcom/google/android/gms/internal/bh;->setAdListener(Lcom/google/android/gms/ads/AdListener;)V

    return-void
.end method

.method public setAdSize(Lcom/google/android/gms/ads/AdSize;)V
    .locals 2

    iget-object p0, p0, Lcom/google/android/gms/ads/AdView;->li:Lcom/google/android/gms/internal/bh;

    const/4 v0, 0x1

    new-array v0, v0, [Lcom/google/android/gms/ads/AdSize;

    const/4 v1, 0x0

    aput-object p1, v0, v1

    invoke-virtual {p0, v0}, Lcom/google/android/gms/internal/bh;->setAdSizes([Lcom/google/android/gms/ads/AdSize;)V

    return-void
.end method

.method public setAdUnitId(Ljava/lang/String;)V
    .locals 0

    iget-object p0, p0, Lcom/google/android/gms/ads/AdView;->li:Lcom/google/android/gms/internal/bh;

    invoke-virtual {p0, p1}, Lcom/google/android/gms/internal/bh;->setAdUnitId(Ljava/lang/String;)V

    return-void
.end method

.method public setInAppPurchaseListener(Lcom/google/android/gms/ads/purchase/InAppPurchaseListener;)V
    .locals 0

    iget-object p0, p0, Lcom/google/android/gms/ads/AdView;->li:Lcom/google/android/gms/internal/bh;

    invoke-virtual {p0, p1}, Lcom/google/android/gms/internal/bh;->setInAppPurchaseListener(Lcom/google/android/gms/ads/purchase/InAppPurchaseListener;)V

    return-void
.end method

.method public setPlayStorePurchaseParams(Lcom/google/android/gms/ads/purchase/PlayStorePurchaseListener;Ljava/lang/String;)V
    .locals 0

    iget-object p0, p0, Lcom/google/android/gms/ads/AdView;->li:Lcom/google/android/gms/internal/bh;

    invoke-virtual {p0, p1, p2}, Lcom/google/android/gms/internal/bh;->setPlayStorePurchaseParams(Lcom/google/android/gms/ads/purchase/PlayStorePurchaseListener;Ljava/lang/String;)V

    return-void
.end method
