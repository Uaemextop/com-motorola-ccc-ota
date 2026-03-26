.class public final Lcom/google/android/gms/internal/iw;
.super Landroid/graphics/drawable/Drawable;

# interfaces
.implements Landroid/graphics/drawable/Drawable$Callback;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/google/android/gms/internal/iw$a;,
        Lcom/google/android/gms/internal/iw$b;
    }
.end annotation


# instance fields
.field private KL:Z

.field private KR:I

.field private KS:J

.field private KT:I

.field private KU:I

.field private KV:I

.field private KW:I

.field private KX:Z

.field private KY:Lcom/google/android/gms/internal/iw$b;

.field private KZ:Landroid/graphics/drawable/Drawable;

.field private La:Landroid/graphics/drawable/Drawable;

.field private Lb:Z

.field private Lc:Z

.field private Ld:Z

.field private Le:I

.field private mFrom:I


# direct methods
.method public constructor <init>(Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;)V
    .locals 2

    const/4 v0, 0x0

    invoke-direct {p0, v0}, Lcom/google/android/gms/internal/iw;-><init>(Lcom/google/android/gms/internal/iw$b;)V

    if-nez p1, :cond_0

    invoke-static {}, Lcom/google/android/gms/internal/iw$a;->gL()Lcom/google/android/gms/internal/iw$a;

    move-result-object p1

    :cond_0
    iput-object p1, p0, Lcom/google/android/gms/internal/iw;->KZ:Landroid/graphics/drawable/Drawable;

    invoke-virtual {p1, p0}, Landroid/graphics/drawable/Drawable;->setCallback(Landroid/graphics/drawable/Drawable$Callback;)V

    iget-object v0, p0, Lcom/google/android/gms/internal/iw;->KY:Lcom/google/android/gms/internal/iw$b;

    iget v1, v0, Lcom/google/android/gms/internal/iw$b;->Li:I

    invoke-virtual {p1}, Landroid/graphics/drawable/Drawable;->getChangingConfigurations()I

    move-result p1

    or-int/2addr p1, v1

    iput p1, v0, Lcom/google/android/gms/internal/iw$b;->Li:I

    if-nez p2, :cond_1

    invoke-static {}, Lcom/google/android/gms/internal/iw$a;->gL()Lcom/google/android/gms/internal/iw$a;

    move-result-object p2

    :cond_1
    iput-object p2, p0, Lcom/google/android/gms/internal/iw;->La:Landroid/graphics/drawable/Drawable;

    invoke-virtual {p2, p0}, Landroid/graphics/drawable/Drawable;->setCallback(Landroid/graphics/drawable/Drawable$Callback;)V

    iget-object p0, p0, Lcom/google/android/gms/internal/iw;->KY:Lcom/google/android/gms/internal/iw$b;

    iget p1, p0, Lcom/google/android/gms/internal/iw$b;->Li:I

    invoke-virtual {p2}, Landroid/graphics/drawable/Drawable;->getChangingConfigurations()I

    move-result p2

    or-int/2addr p1, p2

    iput p1, p0, Lcom/google/android/gms/internal/iw$b;->Li:I

    return-void
.end method

.method constructor <init>(Lcom/google/android/gms/internal/iw$b;)V
    .locals 2

    invoke-direct {p0}, Landroid/graphics/drawable/Drawable;-><init>()V

    const/4 v0, 0x0

    iput v0, p0, Lcom/google/android/gms/internal/iw;->KR:I

    const/16 v1, 0xff

    iput v1, p0, Lcom/google/android/gms/internal/iw;->KU:I

    iput v0, p0, Lcom/google/android/gms/internal/iw;->KW:I

    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/google/android/gms/internal/iw;->KL:Z

    new-instance v0, Lcom/google/android/gms/internal/iw$b;

    invoke-direct {v0, p1}, Lcom/google/android/gms/internal/iw$b;-><init>(Lcom/google/android/gms/internal/iw$b;)V

    iput-object v0, p0, Lcom/google/android/gms/internal/iw;->KY:Lcom/google/android/gms/internal/iw$b;

    return-void
.end method


# virtual methods
.method public canConstantState()Z
    .locals 2

    iget-boolean v0, p0, Lcom/google/android/gms/internal/iw;->Lb:Z

    if-nez v0, :cond_1

    iget-object v0, p0, Lcom/google/android/gms/internal/iw;->KZ:Landroid/graphics/drawable/Drawable;

    invoke-virtual {v0}, Landroid/graphics/drawable/Drawable;->getConstantState()Landroid/graphics/drawable/Drawable$ConstantState;

    move-result-object v0

    const/4 v1, 0x1

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/google/android/gms/internal/iw;->La:Landroid/graphics/drawable/Drawable;

    invoke-virtual {v0}, Landroid/graphics/drawable/Drawable;->getConstantState()Landroid/graphics/drawable/Drawable$ConstantState;

    move-result-object v0

    if-eqz v0, :cond_0

    move v0, v1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    iput-boolean v0, p0, Lcom/google/android/gms/internal/iw;->Lc:Z

    iput-boolean v1, p0, Lcom/google/android/gms/internal/iw;->Lb:Z

    :cond_1
    iget-boolean p0, p0, Lcom/google/android/gms/internal/iw;->Lc:Z

    return p0
.end method

.method public draw(Landroid/graphics/Canvas;)V
    .locals 6

    iget v0, p0, Lcom/google/android/gms/internal/iw;->KR:I

    const/4 v1, 0x2

    const/4 v2, 0x0

    const/4 v3, 0x1

    if-eq v0, v3, :cond_4

    if-eq v0, v1, :cond_0

    goto :goto_1

    :cond_0
    iget-wide v0, p0, Lcom/google/android/gms/internal/iw;->KS:J

    const-wide/16 v4, 0x0

    cmp-long v0, v0, v4

    if-ltz v0, :cond_3

    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    move-result-wide v0

    iget-wide v4, p0, Lcom/google/android/gms/internal/iw;->KS:J

    sub-long/2addr v0, v4

    long-to-float v0, v0

    iget v1, p0, Lcom/google/android/gms/internal/iw;->KV:I

    int-to-float v1, v1

    div-float/2addr v0, v1

    const/high16 v1, 0x3f800000    # 1.0f

    cmpl-float v4, v0, v1

    if-ltz v4, :cond_1

    goto :goto_0

    :cond_1
    move v3, v2

    :goto_0
    if-eqz v3, :cond_2

    iput v2, p0, Lcom/google/android/gms/internal/iw;->KR:I

    :cond_2
    invoke-static {v0, v1}, Ljava/lang/Math;->min(FF)F

    move-result v0

    iget v1, p0, Lcom/google/android/gms/internal/iw;->mFrom:I

    int-to-float v2, v1

    iget v4, p0, Lcom/google/android/gms/internal/iw;->KT:I

    sub-int/2addr v4, v1

    int-to-float v1, v4

    mul-float/2addr v1, v0

    add-float/2addr v2, v1

    float-to-int v0, v2

    iput v0, p0, Lcom/google/android/gms/internal/iw;->KW:I

    :cond_3
    :goto_1
    move v2, v3

    goto :goto_2

    :cond_4
    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    move-result-wide v3

    iput-wide v3, p0, Lcom/google/android/gms/internal/iw;->KS:J

    iput v1, p0, Lcom/google/android/gms/internal/iw;->KR:I

    :goto_2
    iget v0, p0, Lcom/google/android/gms/internal/iw;->KW:I

    iget-boolean v1, p0, Lcom/google/android/gms/internal/iw;->KL:Z

    iget-object v3, p0, Lcom/google/android/gms/internal/iw;->KZ:Landroid/graphics/drawable/Drawable;

    iget-object v4, p0, Lcom/google/android/gms/internal/iw;->La:Landroid/graphics/drawable/Drawable;

    if-eqz v2, :cond_8

    if-eqz v1, :cond_5

    if-nez v0, :cond_6

    :cond_5
    invoke-virtual {v3, p1}, Landroid/graphics/drawable/Drawable;->draw(Landroid/graphics/Canvas;)V

    :cond_6
    iget p0, p0, Lcom/google/android/gms/internal/iw;->KU:I

    if-ne v0, p0, :cond_7

    invoke-virtual {v4, p0}, Landroid/graphics/drawable/Drawable;->setAlpha(I)V

    invoke-virtual {v4, p1}, Landroid/graphics/drawable/Drawable;->draw(Landroid/graphics/Canvas;)V

    :cond_7
    return-void

    :cond_8
    if-eqz v1, :cond_9

    iget v2, p0, Lcom/google/android/gms/internal/iw;->KU:I

    sub-int/2addr v2, v0

    invoke-virtual {v3, v2}, Landroid/graphics/drawable/Drawable;->setAlpha(I)V

    :cond_9
    invoke-virtual {v3, p1}, Landroid/graphics/drawable/Drawable;->draw(Landroid/graphics/Canvas;)V

    if-eqz v1, :cond_a

    iget v1, p0, Lcom/google/android/gms/internal/iw;->KU:I

    invoke-virtual {v3, v1}, Landroid/graphics/drawable/Drawable;->setAlpha(I)V

    :cond_a
    if-lez v0, :cond_b

    invoke-virtual {v4, v0}, Landroid/graphics/drawable/Drawable;->setAlpha(I)V

    invoke-virtual {v4, p1}, Landroid/graphics/drawable/Drawable;->draw(Landroid/graphics/Canvas;)V

    iget p1, p0, Lcom/google/android/gms/internal/iw;->KU:I

    invoke-virtual {v4, p1}, Landroid/graphics/drawable/Drawable;->setAlpha(I)V

    :cond_b
    invoke-virtual {p0}, Lcom/google/android/gms/internal/iw;->invalidateSelf()V

    return-void
.end method

.method public gK()Landroid/graphics/drawable/Drawable;
    .locals 0

    iget-object p0, p0, Lcom/google/android/gms/internal/iw;->La:Landroid/graphics/drawable/Drawable;

    return-object p0
.end method

.method public getChangingConfigurations()I
    .locals 2

    invoke-super {p0}, Landroid/graphics/drawable/Drawable;->getChangingConfigurations()I

    move-result v0

    iget-object v1, p0, Lcom/google/android/gms/internal/iw;->KY:Lcom/google/android/gms/internal/iw$b;

    iget v1, v1, Lcom/google/android/gms/internal/iw$b;->Lh:I

    or-int/2addr v0, v1

    iget-object p0, p0, Lcom/google/android/gms/internal/iw;->KY:Lcom/google/android/gms/internal/iw$b;

    iget p0, p0, Lcom/google/android/gms/internal/iw$b;->Li:I

    or-int/2addr p0, v0

    return p0
.end method

.method public getConstantState()Landroid/graphics/drawable/Drawable$ConstantState;
    .locals 2

    invoke-virtual {p0}, Lcom/google/android/gms/internal/iw;->canConstantState()Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/google/android/gms/internal/iw;->KY:Lcom/google/android/gms/internal/iw$b;

    invoke-virtual {p0}, Lcom/google/android/gms/internal/iw;->getChangingConfigurations()I

    move-result v1

    iput v1, v0, Lcom/google/android/gms/internal/iw$b;->Lh:I

    iget-object p0, p0, Lcom/google/android/gms/internal/iw;->KY:Lcom/google/android/gms/internal/iw$b;

    return-object p0

    :cond_0
    const/4 p0, 0x0

    return-object p0
.end method

.method public getIntrinsicHeight()I
    .locals 1

    iget-object v0, p0, Lcom/google/android/gms/internal/iw;->KZ:Landroid/graphics/drawable/Drawable;

    invoke-virtual {v0}, Landroid/graphics/drawable/Drawable;->getIntrinsicHeight()I

    move-result v0

    iget-object p0, p0, Lcom/google/android/gms/internal/iw;->La:Landroid/graphics/drawable/Drawable;

    invoke-virtual {p0}, Landroid/graphics/drawable/Drawable;->getIntrinsicHeight()I

    move-result p0

    invoke-static {v0, p0}, Ljava/lang/Math;->max(II)I

    move-result p0

    return p0
.end method

.method public getIntrinsicWidth()I
    .locals 1

    iget-object v0, p0, Lcom/google/android/gms/internal/iw;->KZ:Landroid/graphics/drawable/Drawable;

    invoke-virtual {v0}, Landroid/graphics/drawable/Drawable;->getIntrinsicWidth()I

    move-result v0

    iget-object p0, p0, Lcom/google/android/gms/internal/iw;->La:Landroid/graphics/drawable/Drawable;

    invoke-virtual {p0}, Landroid/graphics/drawable/Drawable;->getIntrinsicWidth()I

    move-result p0

    invoke-static {v0, p0}, Ljava/lang/Math;->max(II)I

    move-result p0

    return p0
.end method

.method public getOpacity()I
    .locals 2

    iget-boolean v0, p0, Lcom/google/android/gms/internal/iw;->Ld:Z

    if-nez v0, :cond_0

    iget-object v0, p0, Lcom/google/android/gms/internal/iw;->KZ:Landroid/graphics/drawable/Drawable;

    invoke-virtual {v0}, Landroid/graphics/drawable/Drawable;->getOpacity()I

    move-result v0

    iget-object v1, p0, Lcom/google/android/gms/internal/iw;->La:Landroid/graphics/drawable/Drawable;

    invoke-virtual {v1}, Landroid/graphics/drawable/Drawable;->getOpacity()I

    move-result v1

    invoke-static {v0, v1}, Landroid/graphics/drawable/Drawable;->resolveOpacity(II)I

    move-result v0

    iput v0, p0, Lcom/google/android/gms/internal/iw;->Le:I

    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/google/android/gms/internal/iw;->Ld:Z

    :cond_0
    iget p0, p0, Lcom/google/android/gms/internal/iw;->Le:I

    return p0
.end method

.method public invalidateDrawable(Landroid/graphics/drawable/Drawable;)V
    .locals 0

    invoke-static {}, Lcom/google/android/gms/internal/kc;->hB()Z

    move-result p1

    if-eqz p1, :cond_0

    invoke-virtual {p0}, Lcom/google/android/gms/internal/iw;->getCallback()Landroid/graphics/drawable/Drawable$Callback;

    move-result-object p1

    if-eqz p1, :cond_0

    invoke-interface {p1, p0}, Landroid/graphics/drawable/Drawable$Callback;->invalidateDrawable(Landroid/graphics/drawable/Drawable;)V

    :cond_0
    return-void
.end method

.method public mutate()Landroid/graphics/drawable/Drawable;
    .locals 1

    iget-boolean v0, p0, Lcom/google/android/gms/internal/iw;->KX:Z

    if-nez v0, :cond_1

    invoke-super {p0}, Landroid/graphics/drawable/Drawable;->mutate()Landroid/graphics/drawable/Drawable;

    move-result-object v0

    if-ne v0, p0, :cond_1

    invoke-virtual {p0}, Lcom/google/android/gms/internal/iw;->canConstantState()Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/google/android/gms/internal/iw;->KZ:Landroid/graphics/drawable/Drawable;

    invoke-virtual {v0}, Landroid/graphics/drawable/Drawable;->mutate()Landroid/graphics/drawable/Drawable;

    iget-object v0, p0, Lcom/google/android/gms/internal/iw;->La:Landroid/graphics/drawable/Drawable;

    invoke-virtual {v0}, Landroid/graphics/drawable/Drawable;->mutate()Landroid/graphics/drawable/Drawable;

    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/google/android/gms/internal/iw;->KX:Z

    goto :goto_0

    :cond_0
    new-instance p0, Ljava/lang/IllegalStateException;

    const-string v0, "One or more children of this LayerDrawable does not have constant state; this drawable cannot be mutated."

    invoke-direct {p0, v0}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw p0

    :cond_1
    :goto_0
    return-object p0
.end method

.method protected onBoundsChange(Landroid/graphics/Rect;)V
    .locals 1

    iget-object v0, p0, Lcom/google/android/gms/internal/iw;->KZ:Landroid/graphics/drawable/Drawable;

    invoke-virtual {v0, p1}, Landroid/graphics/drawable/Drawable;->setBounds(Landroid/graphics/Rect;)V

    iget-object p0, p0, Lcom/google/android/gms/internal/iw;->La:Landroid/graphics/drawable/Drawable;

    invoke-virtual {p0, p1}, Landroid/graphics/drawable/Drawable;->setBounds(Landroid/graphics/Rect;)V

    return-void
.end method

.method public scheduleDrawable(Landroid/graphics/drawable/Drawable;Ljava/lang/Runnable;J)V
    .locals 0

    invoke-static {}, Lcom/google/android/gms/internal/kc;->hB()Z

    move-result p1

    if-eqz p1, :cond_0

    invoke-virtual {p0}, Lcom/google/android/gms/internal/iw;->getCallback()Landroid/graphics/drawable/Drawable$Callback;

    move-result-object p1

    if-eqz p1, :cond_0

    invoke-interface {p1, p0, p2, p3, p4}, Landroid/graphics/drawable/Drawable$Callback;->scheduleDrawable(Landroid/graphics/drawable/Drawable;Ljava/lang/Runnable;J)V

    :cond_0
    return-void
.end method

.method public setAlpha(I)V
    .locals 2

    iget v0, p0, Lcom/google/android/gms/internal/iw;->KW:I

    iget v1, p0, Lcom/google/android/gms/internal/iw;->KU:I

    if-ne v0, v1, :cond_0

    iput p1, p0, Lcom/google/android/gms/internal/iw;->KW:I

    :cond_0
    iput p1, p0, Lcom/google/android/gms/internal/iw;->KU:I

    invoke-virtual {p0}, Lcom/google/android/gms/internal/iw;->invalidateSelf()V

    return-void
.end method

.method public setColorFilter(Landroid/graphics/ColorFilter;)V
    .locals 1

    iget-object v0, p0, Lcom/google/android/gms/internal/iw;->KZ:Landroid/graphics/drawable/Drawable;

    invoke-virtual {v0, p1}, Landroid/graphics/drawable/Drawable;->setColorFilter(Landroid/graphics/ColorFilter;)V

    iget-object p0, p0, Lcom/google/android/gms/internal/iw;->La:Landroid/graphics/drawable/Drawable;

    invoke-virtual {p0, p1}, Landroid/graphics/drawable/Drawable;->setColorFilter(Landroid/graphics/ColorFilter;)V

    return-void
.end method

.method public startTransition(I)V
    .locals 2

    const/4 v0, 0x0

    iput v0, p0, Lcom/google/android/gms/internal/iw;->mFrom:I

    iget v1, p0, Lcom/google/android/gms/internal/iw;->KU:I

    iput v1, p0, Lcom/google/android/gms/internal/iw;->KT:I

    iput v0, p0, Lcom/google/android/gms/internal/iw;->KW:I

    iput p1, p0, Lcom/google/android/gms/internal/iw;->KV:I

    const/4 p1, 0x1

    iput p1, p0, Lcom/google/android/gms/internal/iw;->KR:I

    invoke-virtual {p0}, Lcom/google/android/gms/internal/iw;->invalidateSelf()V

    return-void
.end method

.method public unscheduleDrawable(Landroid/graphics/drawable/Drawable;Ljava/lang/Runnable;)V
    .locals 0

    invoke-static {}, Lcom/google/android/gms/internal/kc;->hB()Z

    move-result p1

    if-eqz p1, :cond_0

    invoke-virtual {p0}, Lcom/google/android/gms/internal/iw;->getCallback()Landroid/graphics/drawable/Drawable$Callback;

    move-result-object p1

    if-eqz p1, :cond_0

    invoke-interface {p1, p0, p2}, Landroid/graphics/drawable/Drawable$Callback;->unscheduleDrawable(Landroid/graphics/drawable/Drawable;Ljava/lang/Runnable;)V

    :cond_0
    return-void
.end method
