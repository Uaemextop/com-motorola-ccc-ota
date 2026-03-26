.class public final Lcom/google/android/gms/internal/iy;
.super Landroid/widget/ImageView;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/google/android/gms/internal/iy$a;
    }
.end annotation


# instance fields
.field private Lj:Landroid/net/Uri;

.field private Lk:I

.field private Ll:I

.field private Lm:Lcom/google/android/gms/internal/iy$a;

.field private Ln:I

.field private Lo:F


# virtual methods
.method public ay(I)V
    .locals 0

    iput p1, p0, Lcom/google/android/gms/internal/iy;->Lk:I

    return-void
.end method

.method public g(Landroid/net/Uri;)V
    .locals 0

    iput-object p1, p0, Lcom/google/android/gms/internal/iy;->Lj:Landroid/net/Uri;

    return-void
.end method

.method public gM()I
    .locals 0

    iget p0, p0, Lcom/google/android/gms/internal/iy;->Lk:I

    return p0
.end method

.method protected onDraw(Landroid/graphics/Canvas;)V
    .locals 3

    iget-object v0, p0, Lcom/google/android/gms/internal/iy;->Lm:Lcom/google/android/gms/internal/iy$a;

    if-eqz v0, :cond_0

    invoke-virtual {p0}, Lcom/google/android/gms/internal/iy;->getWidth()I

    move-result v1

    invoke-virtual {p0}, Lcom/google/android/gms/internal/iy;->getHeight()I

    move-result v2

    invoke-interface {v0, v1, v2}, Lcom/google/android/gms/internal/iy$a;->g(II)Landroid/graphics/Path;

    move-result-object v0

    invoke-virtual {p1, v0}, Landroid/graphics/Canvas;->clipPath(Landroid/graphics/Path;)Z

    :cond_0
    invoke-super {p0, p1}, Landroid/widget/ImageView;->onDraw(Landroid/graphics/Canvas;)V

    iget p0, p0, Lcom/google/android/gms/internal/iy;->Ll:I

    if-eqz p0, :cond_1

    invoke-virtual {p1, p0}, Landroid/graphics/Canvas;->drawColor(I)V

    :cond_1
    return-void
.end method

.method protected onMeasure(II)V
    .locals 1

    invoke-super {p0, p1, p2}, Landroid/widget/ImageView;->onMeasure(II)V

    iget p1, p0, Lcom/google/android/gms/internal/iy;->Ln:I

    const/4 p2, 0x1

    if-eq p1, p2, :cond_1

    const/4 p2, 0x2

    if-eq p1, p2, :cond_0

    return-void

    :cond_0
    invoke-virtual {p0}, Lcom/google/android/gms/internal/iy;->getMeasuredWidth()I

    move-result p1

    int-to-float p2, p1

    iget v0, p0, Lcom/google/android/gms/internal/iy;->Lo:F

    div-float/2addr p2, v0

    float-to-int p2, p2

    goto :goto_0

    :cond_1
    invoke-virtual {p0}, Lcom/google/android/gms/internal/iy;->getMeasuredHeight()I

    move-result p2

    int-to-float p1, p2

    iget v0, p0, Lcom/google/android/gms/internal/iy;->Lo:F

    mul-float/2addr p1, v0

    float-to-int p1, p1

    :goto_0
    invoke-virtual {p0, p1, p2}, Lcom/google/android/gms/internal/iy;->setMeasuredDimension(II)V

    return-void
.end method
