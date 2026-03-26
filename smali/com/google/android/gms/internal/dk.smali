.class public Lcom/google/android/gms/internal/dk;
.super Lcom/google/android/gms/internal/ds$a;


# annotations
.annotation runtime Lcom/google/android/gms/internal/ez;
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/google/android/gms/internal/dk$b;,
        Lcom/google/android/gms/internal/dk$c;,
        Lcom/google/android/gms/internal/dk$a;
    }
.end annotation


# static fields
.field private static final ru:I


# instance fields
.field private md:Lcom/google/android/gms/internal/gv;

.field private final nr:Landroid/app/Activity;

.field private rA:Z

.field private rB:Landroid/widget/FrameLayout;

.field private rC:Landroid/webkit/WebChromeClient$CustomViewCallback;

.field private rD:Z

.field private rE:Z

.field private rF:Z

.field private rG:Landroid/widget/RelativeLayout;

.field private rv:Lcom/google/android/gms/internal/dm;

.field private rw:Lcom/google/android/gms/internal/do;

.field private rx:Lcom/google/android/gms/internal/dk$c;

.field private ry:Lcom/google/android/gms/internal/dp;

.field private rz:Z


# direct methods
.method static constructor <clinit>()V
    .locals 1

    const/4 v0, 0x0

    invoke-static {v0, v0, v0, v0}, Landroid/graphics/Color;->argb(IIII)I

    move-result v0

    sput v0, Lcom/google/android/gms/internal/dk;->ru:I

    return-void
.end method

.method public constructor <init>(Landroid/app/Activity;)V
    .locals 1

    invoke-direct {p0}, Lcom/google/android/gms/internal/ds$a;-><init>()V

    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/google/android/gms/internal/dk;->rA:Z

    iput-boolean v0, p0, Lcom/google/android/gms/internal/dk;->rD:Z

    iput-boolean v0, p0, Lcom/google/android/gms/internal/dk;->rE:Z

    iput-boolean v0, p0, Lcom/google/android/gms/internal/dk;->rF:Z

    iput-object p1, p0, Lcom/google/android/gms/internal/dk;->nr:Landroid/app/Activity;

    return-void
.end method

.method private static a(IIII)Landroid/widget/RelativeLayout$LayoutParams;
    .locals 1

    new-instance v0, Landroid/widget/RelativeLayout$LayoutParams;

    invoke-direct {v0, p2, p3}, Landroid/widget/RelativeLayout$LayoutParams;-><init>(II)V

    const/4 p2, 0x0

    invoke-virtual {v0, p0, p1, p2, p2}, Landroid/widget/RelativeLayout$LayoutParams;->setMargins(IIII)V

    const/16 p0, 0xa

    invoke-virtual {v0, p0}, Landroid/widget/RelativeLayout$LayoutParams;->addRule(I)V

    const/16 p0, 0x9

    invoke-virtual {v0, p0}, Landroid/widget/RelativeLayout$LayoutParams;->addRule(I)V

    return-object v0
.end method

.method public static a(Landroid/content/Context;Lcom/google/android/gms/internal/dm;)V
    .locals 3

    new-instance v0, Landroid/content/Intent;

    invoke-direct {v0}, Landroid/content/Intent;-><init>()V

    const-string v1, "com.google.android.gms.ads.AdActivity"

    invoke-virtual {v0, p0, v1}, Landroid/content/Intent;->setClassName(Landroid/content/Context;Ljava/lang/String;)Landroid/content/Intent;

    iget-object v1, p1, Lcom/google/android/gms/internal/dm;->lD:Lcom/google/android/gms/internal/gt;

    iget-boolean v1, v1, Lcom/google/android/gms/internal/gt;->wG:Z

    const-string v2, "com.google.android.gms.ads.internal.overlay.useClientJar"

    invoke-virtual {v0, v2, v1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Z)Landroid/content/Intent;

    invoke-static {v0, p1}, Lcom/google/android/gms/internal/dm;->a(Landroid/content/Intent;Lcom/google/android/gms/internal/dm;)V

    const/high16 p1, 0x80000

    invoke-virtual {v0, p1}, Landroid/content/Intent;->addFlags(I)Landroid/content/Intent;

    instance-of p1, p0, Landroid/app/Activity;

    if-nez p1, :cond_0

    const/high16 p1, 0x10000000

    invoke-virtual {v0, p1}, Landroid/content/Intent;->addFlags(I)Landroid/content/Intent;

    :cond_0
    invoke-virtual {p0, v0}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    return-void
.end method


# virtual methods
.method public U()V
    .locals 1

    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/google/android/gms/internal/dk;->rz:Z

    return-void
.end method

.method public a(Landroid/view/View;Landroid/webkit/WebChromeClient$CustomViewCallback;)V
    .locals 2

    new-instance v0, Landroid/widget/FrameLayout;

    iget-object v1, p0, Lcom/google/android/gms/internal/dk;->nr:Landroid/app/Activity;

    invoke-direct {v0, v1}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;)V

    iput-object v0, p0, Lcom/google/android/gms/internal/dk;->rB:Landroid/widget/FrameLayout;

    const/high16 v1, -0x1000000

    invoke-virtual {v0, v1}, Landroid/widget/FrameLayout;->setBackgroundColor(I)V

    iget-object v0, p0, Lcom/google/android/gms/internal/dk;->rB:Landroid/widget/FrameLayout;

    const/4 v1, -0x1

    invoke-virtual {v0, p1, v1, v1}, Landroid/widget/FrameLayout;->addView(Landroid/view/View;II)V

    iget-object p1, p0, Lcom/google/android/gms/internal/dk;->nr:Landroid/app/Activity;

    iget-object v0, p0, Lcom/google/android/gms/internal/dk;->rB:Landroid/widget/FrameLayout;

    invoke-virtual {p1, v0}, Landroid/app/Activity;->setContentView(Landroid/view/View;)V

    invoke-virtual {p0}, Lcom/google/android/gms/internal/dk;->U()V

    iput-object p2, p0, Lcom/google/android/gms/internal/dk;->rC:Landroid/webkit/WebChromeClient$CustomViewCallback;

    const/4 p1, 0x1

    iput-boolean p1, p0, Lcom/google/android/gms/internal/dk;->rA:Z

    return-void
.end method

.method public b(IIII)V
    .locals 0

    iget-object p0, p0, Lcom/google/android/gms/internal/dk;->rw:Lcom/google/android/gms/internal/do;

    if-eqz p0, :cond_0

    invoke-static {p1, p2, p3, p4}, Lcom/google/android/gms/internal/dk;->a(IIII)Landroid/widget/RelativeLayout$LayoutParams;

    move-result-object p1

    invoke-virtual {p0, p1}, Lcom/google/android/gms/internal/do;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    :cond_0
    return-void
.end method

.method public bV()Lcom/google/android/gms/internal/do;
    .locals 0

    iget-object p0, p0, Lcom/google/android/gms/internal/dk;->rw:Lcom/google/android/gms/internal/do;

    return-object p0
.end method

.method public bW()V
    .locals 3

    iget-object v0, p0, Lcom/google/android/gms/internal/dk;->rv:Lcom/google/android/gms/internal/dm;

    if-eqz v0, :cond_0

    iget-boolean v1, p0, Lcom/google/android/gms/internal/dk;->rA:Z

    if-eqz v1, :cond_0

    iget v0, v0, Lcom/google/android/gms/internal/dm;->orientation:I

    invoke-virtual {p0, v0}, Lcom/google/android/gms/internal/dk;->setRequestedOrientation(I)V

    :cond_0
    iget-object v0, p0, Lcom/google/android/gms/internal/dk;->rB:Landroid/widget/FrameLayout;

    const/4 v1, 0x0

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/google/android/gms/internal/dk;->nr:Landroid/app/Activity;

    iget-object v2, p0, Lcom/google/android/gms/internal/dk;->rG:Landroid/widget/RelativeLayout;

    invoke-virtual {v0, v2}, Landroid/app/Activity;->setContentView(Landroid/view/View;)V

    invoke-virtual {p0}, Lcom/google/android/gms/internal/dk;->U()V

    iget-object v0, p0, Lcom/google/android/gms/internal/dk;->rB:Landroid/widget/FrameLayout;

    invoke-virtual {v0}, Landroid/widget/FrameLayout;->removeAllViews()V

    iput-object v1, p0, Lcom/google/android/gms/internal/dk;->rB:Landroid/widget/FrameLayout;

    :cond_1
    iget-object v0, p0, Lcom/google/android/gms/internal/dk;->rC:Landroid/webkit/WebChromeClient$CustomViewCallback;

    if-eqz v0, :cond_2

    invoke-interface {v0}, Landroid/webkit/WebChromeClient$CustomViewCallback;->onCustomViewHidden()V

    iput-object v1, p0, Lcom/google/android/gms/internal/dk;->rC:Landroid/webkit/WebChromeClient$CustomViewCallback;

    :cond_2
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/google/android/gms/internal/dk;->rA:Z

    return-void
.end method

.method public bX()V
    .locals 2

    iget-object v0, p0, Lcom/google/android/gms/internal/dk;->rG:Landroid/widget/RelativeLayout;

    iget-object v1, p0, Lcom/google/android/gms/internal/dk;->ry:Lcom/google/android/gms/internal/dp;

    invoke-virtual {v0, v1}, Landroid/widget/RelativeLayout;->removeView(Landroid/view/View;)V

    const/4 v0, 0x1

    invoke-virtual {p0, v0}, Lcom/google/android/gms/internal/dk;->n(Z)V

    return-void
.end method

.method bY()V
    .locals 4

    iget-object v0, p0, Lcom/google/android/gms/internal/dk;->nr:Landroid/app/Activity;

    invoke-virtual {v0}, Landroid/app/Activity;->isFinishing()Z

    move-result v0

    if-eqz v0, :cond_2

    iget-boolean v0, p0, Lcom/google/android/gms/internal/dk;->rE:Z

    if-eqz v0, :cond_0

    goto :goto_0

    :cond_0
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/google/android/gms/internal/dk;->rE:Z

    iget-object v0, p0, Lcom/google/android/gms/internal/dk;->nr:Landroid/app/Activity;

    invoke-virtual {v0}, Landroid/app/Activity;->isFinishing()Z

    move-result v0

    if-eqz v0, :cond_2

    iget-object v0, p0, Lcom/google/android/gms/internal/dk;->md:Lcom/google/android/gms/internal/gv;

    if-eqz v0, :cond_1

    invoke-virtual {p0}, Lcom/google/android/gms/internal/dk;->ca()V

    iget-object v0, p0, Lcom/google/android/gms/internal/dk;->rG:Landroid/widget/RelativeLayout;

    iget-object v1, p0, Lcom/google/android/gms/internal/dk;->md:Lcom/google/android/gms/internal/gv;

    invoke-virtual {v0, v1}, Landroid/widget/RelativeLayout;->removeView(Landroid/view/View;)V

    iget-object v0, p0, Lcom/google/android/gms/internal/dk;->rx:Lcom/google/android/gms/internal/dk$c;

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/google/android/gms/internal/dk;->md:Lcom/google/android/gms/internal/gv;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Lcom/google/android/gms/internal/gv;->x(Z)V

    iget-object v0, p0, Lcom/google/android/gms/internal/dk;->rx:Lcom/google/android/gms/internal/dk$c;

    iget-object v0, v0, Lcom/google/android/gms/internal/dk$c;->rJ:Landroid/view/ViewGroup;

    iget-object v1, p0, Lcom/google/android/gms/internal/dk;->md:Lcom/google/android/gms/internal/gv;

    iget-object v2, p0, Lcom/google/android/gms/internal/dk;->rx:Lcom/google/android/gms/internal/dk$c;

    iget v2, v2, Lcom/google/android/gms/internal/dk$c;->index:I

    iget-object v3, p0, Lcom/google/android/gms/internal/dk;->rx:Lcom/google/android/gms/internal/dk$c;

    iget-object v3, v3, Lcom/google/android/gms/internal/dk$c;->rI:Landroid/view/ViewGroup$LayoutParams;

    invoke-virtual {v0, v1, v2, v3}, Landroid/view/ViewGroup;->addView(Landroid/view/View;ILandroid/view/ViewGroup$LayoutParams;)V

    :cond_1
    iget-object v0, p0, Lcom/google/android/gms/internal/dk;->rv:Lcom/google/android/gms/internal/dm;

    if-eqz v0, :cond_2

    iget-object v0, v0, Lcom/google/android/gms/internal/dm;->rM:Lcom/google/android/gms/internal/dn;

    if-eqz v0, :cond_2

    iget-object p0, p0, Lcom/google/android/gms/internal/dk;->rv:Lcom/google/android/gms/internal/dm;

    iget-object p0, p0, Lcom/google/android/gms/internal/dm;->rM:Lcom/google/android/gms/internal/dn;

    invoke-interface {p0}, Lcom/google/android/gms/internal/dn;->ac()V

    :cond_2
    :goto_0
    return-void
.end method

.method bZ()V
    .locals 0

    iget-object p0, p0, Lcom/google/android/gms/internal/dk;->md:Lcom/google/android/gms/internal/gv;

    invoke-virtual {p0}, Lcom/google/android/gms/internal/gv;->bZ()V

    return-void
.end method

.method public c(IIII)V
    .locals 3

    iget-object v0, p0, Lcom/google/android/gms/internal/dk;->rw:Lcom/google/android/gms/internal/do;

    if-nez v0, :cond_0

    new-instance v0, Lcom/google/android/gms/internal/do;

    iget-object v1, p0, Lcom/google/android/gms/internal/dk;->nr:Landroid/app/Activity;

    iget-object v2, p0, Lcom/google/android/gms/internal/dk;->md:Lcom/google/android/gms/internal/gv;

    invoke-direct {v0, v1, v2}, Lcom/google/android/gms/internal/do;-><init>(Landroid/content/Context;Lcom/google/android/gms/internal/gv;)V

    iput-object v0, p0, Lcom/google/android/gms/internal/dk;->rw:Lcom/google/android/gms/internal/do;

    iget-object v1, p0, Lcom/google/android/gms/internal/dk;->rG:Landroid/widget/RelativeLayout;

    invoke-static {p1, p2, p3, p4}, Lcom/google/android/gms/internal/dk;->a(IIII)Landroid/widget/RelativeLayout$LayoutParams;

    move-result-object p1

    const/4 p2, 0x0

    invoke-virtual {v1, v0, p2, p1}, Landroid/widget/RelativeLayout;->addView(Landroid/view/View;ILandroid/view/ViewGroup$LayoutParams;)V

    iget-object p0, p0, Lcom/google/android/gms/internal/dk;->md:Lcom/google/android/gms/internal/gv;

    invoke-virtual {p0}, Lcom/google/android/gms/internal/gv;->du()Lcom/google/android/gms/internal/gw;

    move-result-object p0

    invoke-virtual {p0, p2}, Lcom/google/android/gms/internal/gw;->y(Z)V

    :cond_0
    return-void
.end method

.method ca()V
    .locals 0

    iget-object p0, p0, Lcom/google/android/gms/internal/dk;->md:Lcom/google/android/gms/internal/gv;

    invoke-virtual {p0}, Lcom/google/android/gms/internal/gv;->ca()V

    return-void
.end method

.method public close()V
    .locals 0

    iget-object p0, p0, Lcom/google/android/gms/internal/dk;->nr:Landroid/app/Activity;

    invoke-virtual {p0}, Landroid/app/Activity;->finish()V

    return-void
.end method

.method public n(Z)V
    .locals 3

    if-eqz p1, :cond_0

    const/16 v0, 0x32

    goto :goto_0

    :cond_0
    const/16 v0, 0x20

    :goto_0
    new-instance v1, Lcom/google/android/gms/internal/dp;

    iget-object v2, p0, Lcom/google/android/gms/internal/dk;->nr:Landroid/app/Activity;

    invoke-direct {v1, v2, v0}, Lcom/google/android/gms/internal/dp;-><init>(Landroid/app/Activity;I)V

    iput-object v1, p0, Lcom/google/android/gms/internal/dk;->ry:Lcom/google/android/gms/internal/dp;

    new-instance v0, Landroid/widget/RelativeLayout$LayoutParams;

    const/4 v1, -0x2

    invoke-direct {v0, v1, v1}, Landroid/widget/RelativeLayout$LayoutParams;-><init>(II)V

    const/16 v1, 0xa

    invoke-virtual {v0, v1}, Landroid/widget/RelativeLayout$LayoutParams;->addRule(I)V

    if-eqz p1, :cond_1

    const/16 p1, 0xb

    goto :goto_1

    :cond_1
    const/16 p1, 0x9

    :goto_1
    invoke-virtual {v0, p1}, Landroid/widget/RelativeLayout$LayoutParams;->addRule(I)V

    iget-object p1, p0, Lcom/google/android/gms/internal/dk;->ry:Lcom/google/android/gms/internal/dp;

    iget-object v1, p0, Lcom/google/android/gms/internal/dk;->rv:Lcom/google/android/gms/internal/dm;

    iget-boolean v1, v1, Lcom/google/android/gms/internal/dm;->rQ:Z

    invoke-virtual {p1, v1}, Lcom/google/android/gms/internal/dp;->o(Z)V

    iget-object p1, p0, Lcom/google/android/gms/internal/dk;->rG:Landroid/widget/RelativeLayout;

    iget-object p0, p0, Lcom/google/android/gms/internal/dk;->ry:Lcom/google/android/gms/internal/dp;

    invoke-virtual {p1, p0, v0}, Landroid/widget/RelativeLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    return-void
.end method

.method public o(Z)V
    .locals 0

    iget-object p0, p0, Lcom/google/android/gms/internal/dk;->ry:Lcom/google/android/gms/internal/dp;

    if-eqz p0, :cond_0

    invoke-virtual {p0, p1}, Lcom/google/android/gms/internal/dp;->o(Z)V

    :cond_0
    return-void
.end method

.method public onCreate(Landroid/os/Bundle;)V
    .locals 3

    const/4 v0, 0x0

    if-eqz p1, :cond_0

    const-string v1, "com.google.android.gms.ads.internal.overlay.hasResumed"

    invoke-virtual {p1, v1, v0}, Landroid/os/Bundle;->getBoolean(Ljava/lang/String;Z)Z

    move-result v1

    goto :goto_0

    :cond_0
    move v1, v0

    :goto_0
    iput-boolean v1, p0, Lcom/google/android/gms/internal/dk;->rD:Z

    :try_start_0
    iget-object v1, p0, Lcom/google/android/gms/internal/dk;->nr:Landroid/app/Activity;

    invoke-virtual {v1}, Landroid/app/Activity;->getIntent()Landroid/content/Intent;

    move-result-object v1

    invoke-static {v1}, Lcom/google/android/gms/internal/dm;->b(Landroid/content/Intent;)Lcom/google/android/gms/internal/dm;

    move-result-object v1

    iput-object v1, p0, Lcom/google/android/gms/internal/dk;->rv:Lcom/google/android/gms/internal/dm;

    if-eqz v1, :cond_9

    iget-object v1, v1, Lcom/google/android/gms/internal/dm;->rW:Lcom/google/android/gms/internal/x;

    if-eqz v1, :cond_1

    iget-object v1, p0, Lcom/google/android/gms/internal/dk;->rv:Lcom/google/android/gms/internal/dm;

    iget-object v1, v1, Lcom/google/android/gms/internal/dm;->rW:Lcom/google/android/gms/internal/x;

    iget-boolean v1, v1, Lcom/google/android/gms/internal/x;->lX:Z

    iput-boolean v1, p0, Lcom/google/android/gms/internal/dk;->rF:Z

    goto :goto_1

    :cond_1
    iput-boolean v0, p0, Lcom/google/android/gms/internal/dk;->rF:Z

    :goto_1
    const/4 v1, 0x1

    if-nez p1, :cond_3

    iget-object p1, p0, Lcom/google/android/gms/internal/dk;->rv:Lcom/google/android/gms/internal/dm;

    iget-object p1, p1, Lcom/google/android/gms/internal/dm;->rM:Lcom/google/android/gms/internal/dn;

    if-eqz p1, :cond_2

    iget-object p1, p0, Lcom/google/android/gms/internal/dk;->rv:Lcom/google/android/gms/internal/dm;

    iget-object p1, p1, Lcom/google/android/gms/internal/dm;->rM:Lcom/google/android/gms/internal/dn;

    invoke-interface {p1}, Lcom/google/android/gms/internal/dn;->ad()V

    :cond_2
    iget-object p1, p0, Lcom/google/android/gms/internal/dk;->rv:Lcom/google/android/gms/internal/dm;

    iget p1, p1, Lcom/google/android/gms/internal/dm;->rT:I

    if-eq p1, v1, :cond_3

    iget-object p1, p0, Lcom/google/android/gms/internal/dk;->rv:Lcom/google/android/gms/internal/dm;

    iget-object p1, p1, Lcom/google/android/gms/internal/dm;->rL:Lcom/google/android/gms/internal/t;

    if-eqz p1, :cond_3

    iget-object p1, p0, Lcom/google/android/gms/internal/dk;->rv:Lcom/google/android/gms/internal/dm;

    iget-object p1, p1, Lcom/google/android/gms/internal/dm;->rL:Lcom/google/android/gms/internal/t;

    invoke-interface {p1}, Lcom/google/android/gms/internal/t;->onAdClicked()V

    :cond_3
    iget-object p1, p0, Lcom/google/android/gms/internal/dk;->rv:Lcom/google/android/gms/internal/dm;

    iget p1, p1, Lcom/google/android/gms/internal/dm;->rT:I

    if-eq p1, v1, :cond_8

    const/4 v2, 0x2

    if-eq p1, v2, :cond_7

    const/4 v0, 0x3

    if-eq p1, v0, :cond_6

    const/4 v0, 0x4

    if-ne p1, v0, :cond_5

    iget-boolean p1, p0, Lcom/google/android/gms/internal/dk;->rD:Z

    if-eqz p1, :cond_4

    iget-object p1, p0, Lcom/google/android/gms/internal/dk;->nr:Landroid/app/Activity;

    :goto_2
    invoke-virtual {p1}, Landroid/app/Activity;->finish()V

    goto :goto_3

    :cond_4
    iget-object p1, p0, Lcom/google/android/gms/internal/dk;->nr:Landroid/app/Activity;

    iget-object v0, p0, Lcom/google/android/gms/internal/dk;->rv:Lcom/google/android/gms/internal/dm;

    iget-object v0, v0, Lcom/google/android/gms/internal/dm;->rK:Lcom/google/android/gms/internal/dj;

    iget-object v1, p0, Lcom/google/android/gms/internal/dk;->rv:Lcom/google/android/gms/internal/dm;

    iget-object v1, v1, Lcom/google/android/gms/internal/dm;->rS:Lcom/google/android/gms/internal/dq;

    invoke-static {p1, v0, v1}, Lcom/google/android/gms/internal/dh;->a(Landroid/content/Context;Lcom/google/android/gms/internal/dj;Lcom/google/android/gms/internal/dq;)Z

    move-result p1

    if-nez p1, :cond_a

    iget-object p1, p0, Lcom/google/android/gms/internal/dk;->nr:Landroid/app/Activity;

    goto :goto_2

    :cond_5
    new-instance p1, Lcom/google/android/gms/internal/dk$a;

    const-string v0, "Could not determine ad overlay type."

    invoke-direct {p1, v0}, Lcom/google/android/gms/internal/dk$a;-><init>(Ljava/lang/String;)V

    throw p1

    :cond_6
    invoke-virtual {p0, v1}, Lcom/google/android/gms/internal/dk;->p(Z)V

    goto :goto_3

    :cond_7
    new-instance p1, Lcom/google/android/gms/internal/dk$c;

    iget-object v1, p0, Lcom/google/android/gms/internal/dk;->rv:Lcom/google/android/gms/internal/dm;

    iget-object v1, v1, Lcom/google/android/gms/internal/dm;->rN:Lcom/google/android/gms/internal/gv;

    invoke-direct {p1, v1}, Lcom/google/android/gms/internal/dk$c;-><init>(Lcom/google/android/gms/internal/gv;)V

    iput-object p1, p0, Lcom/google/android/gms/internal/dk;->rx:Lcom/google/android/gms/internal/dk$c;

    :cond_8
    invoke-virtual {p0, v0}, Lcom/google/android/gms/internal/dk;->p(Z)V

    goto :goto_3

    :cond_9
    new-instance p1, Lcom/google/android/gms/internal/dk$a;

    const-string v0, "Could not get info for ad overlay."

    invoke-direct {p1, v0}, Lcom/google/android/gms/internal/dk$a;-><init>(Ljava/lang/String;)V

    throw p1
    :try_end_0
    .catch Lcom/google/android/gms/internal/dk$a; {:try_start_0 .. :try_end_0} :catch_0

    :catch_0
    move-exception p1

    invoke-virtual {p1}, Lcom/google/android/gms/internal/dk$a;->getMessage()Ljava/lang/String;

    move-result-object p1

    invoke-static {p1}, Lcom/google/android/gms/internal/gs;->W(Ljava/lang/String;)V

    iget-object p0, p0, Lcom/google/android/gms/internal/dk;->nr:Landroid/app/Activity;

    invoke-virtual {p0}, Landroid/app/Activity;->finish()V

    :cond_a
    :goto_3
    return-void
.end method

.method public onDestroy()V
    .locals 2

    iget-object v0, p0, Lcom/google/android/gms/internal/dk;->rw:Lcom/google/android/gms/internal/do;

    if-eqz v0, :cond_0

    invoke-virtual {v0}, Lcom/google/android/gms/internal/do;->destroy()V

    :cond_0
    iget-object v0, p0, Lcom/google/android/gms/internal/dk;->md:Lcom/google/android/gms/internal/gv;

    if-eqz v0, :cond_1

    iget-object v1, p0, Lcom/google/android/gms/internal/dk;->rG:Landroid/widget/RelativeLayout;

    invoke-virtual {v1, v0}, Landroid/widget/RelativeLayout;->removeView(Landroid/view/View;)V

    :cond_1
    invoke-virtual {p0}, Lcom/google/android/gms/internal/dk;->bY()V

    return-void
.end method

.method public onPause()V
    .locals 1

    iget-object v0, p0, Lcom/google/android/gms/internal/dk;->rw:Lcom/google/android/gms/internal/do;

    if-eqz v0, :cond_0

    invoke-virtual {v0}, Lcom/google/android/gms/internal/do;->pause()V

    :cond_0
    invoke-virtual {p0}, Lcom/google/android/gms/internal/dk;->bW()V

    iget-object v0, p0, Lcom/google/android/gms/internal/dk;->md:Lcom/google/android/gms/internal/gv;

    if-eqz v0, :cond_2

    iget-object v0, p0, Lcom/google/android/gms/internal/dk;->nr:Landroid/app/Activity;

    invoke-virtual {v0}, Landroid/app/Activity;->isFinishing()Z

    move-result v0

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/google/android/gms/internal/dk;->rx:Lcom/google/android/gms/internal/dk$c;

    if-nez v0, :cond_2

    :cond_1
    iget-object v0, p0, Lcom/google/android/gms/internal/dk;->md:Lcom/google/android/gms/internal/gv;

    invoke-static {v0}, Lcom/google/android/gms/internal/gj;->a(Landroid/webkit/WebView;)V

    :cond_2
    invoke-virtual {p0}, Lcom/google/android/gms/internal/dk;->bY()V

    return-void
.end method

.method public onRestart()V
    .locals 0

    return-void
.end method

.method public onResume()V
    .locals 2

    iget-object v0, p0, Lcom/google/android/gms/internal/dk;->rv:Lcom/google/android/gms/internal/dm;

    if-eqz v0, :cond_1

    iget v0, v0, Lcom/google/android/gms/internal/dm;->rT:I

    const/4 v1, 0x4

    if-ne v0, v1, :cond_1

    iget-boolean v0, p0, Lcom/google/android/gms/internal/dk;->rD:Z

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/google/android/gms/internal/dk;->nr:Landroid/app/Activity;

    invoke-virtual {v0}, Landroid/app/Activity;->finish()V

    goto :goto_0

    :cond_0
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/google/android/gms/internal/dk;->rD:Z

    :cond_1
    :goto_0
    iget-object p0, p0, Lcom/google/android/gms/internal/dk;->md:Lcom/google/android/gms/internal/gv;

    if-eqz p0, :cond_2

    invoke-static {p0}, Lcom/google/android/gms/internal/gj;->b(Landroid/webkit/WebView;)V

    :cond_2
    return-void
.end method

.method public onSaveInstanceState(Landroid/os/Bundle;)V
    .locals 1

    const-string v0, "com.google.android.gms.ads.internal.overlay.hasResumed"

    iget-boolean p0, p0, Lcom/google/android/gms/internal/dk;->rD:Z

    invoke-virtual {p1, v0, p0}, Landroid/os/Bundle;->putBoolean(Ljava/lang/String;Z)V

    return-void
.end method

.method public onStart()V
    .locals 0

    return-void
.end method

.method public onStop()V
    .locals 0

    invoke-virtual {p0}, Lcom/google/android/gms/internal/dk;->bY()V

    return-void
.end method

.method p(Z)V
    .locals 11
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/android/gms/internal/dk$a;
        }
    .end annotation

    iget-boolean v0, p0, Lcom/google/android/gms/internal/dk;->rz:Z

    const/4 v1, 0x1

    if-nez v0, :cond_0

    iget-object v0, p0, Lcom/google/android/gms/internal/dk;->nr:Landroid/app/Activity;

    invoke-virtual {v0, v1}, Landroid/app/Activity;->requestWindowFeature(I)Z

    :cond_0
    iget-object v0, p0, Lcom/google/android/gms/internal/dk;->nr:Landroid/app/Activity;

    invoke-virtual {v0}, Landroid/app/Activity;->getWindow()Landroid/view/Window;

    move-result-object v0

    iget-boolean v2, p0, Lcom/google/android/gms/internal/dk;->rF:Z

    if-eqz v2, :cond_1

    iget-object v2, p0, Lcom/google/android/gms/internal/dk;->rv:Lcom/google/android/gms/internal/dm;

    iget-object v2, v2, Lcom/google/android/gms/internal/dm;->rW:Lcom/google/android/gms/internal/x;

    iget-boolean v2, v2, Lcom/google/android/gms/internal/x;->mh:Z

    if-eqz v2, :cond_2

    :cond_1
    const/16 v2, 0x400

    invoke-virtual {v0, v2, v2}, Landroid/view/Window;->setFlags(II)V

    :cond_2
    iget-object v2, p0, Lcom/google/android/gms/internal/dk;->rv:Lcom/google/android/gms/internal/dm;

    iget v2, v2, Lcom/google/android/gms/internal/dm;->orientation:I

    invoke-virtual {p0, v2}, Lcom/google/android/gms/internal/dk;->setRequestedOrientation(I)V

    const-string v2, "Enabling hardware acceleration on the AdActivity window."

    invoke-static {v2}, Lcom/google/android/gms/internal/gs;->S(Ljava/lang/String;)V

    invoke-static {v0}, Lcom/google/android/gms/internal/gn;->a(Landroid/view/Window;)V

    new-instance v0, Lcom/google/android/gms/internal/dk$b;

    iget-object v2, p0, Lcom/google/android/gms/internal/dk;->nr:Landroid/app/Activity;

    iget-object v3, p0, Lcom/google/android/gms/internal/dk;->rv:Lcom/google/android/gms/internal/dm;

    iget-object v3, v3, Lcom/google/android/gms/internal/dm;->rV:Ljava/lang/String;

    invoke-direct {v0, v2, v3}, Lcom/google/android/gms/internal/dk$b;-><init>(Landroid/content/Context;Ljava/lang/String;)V

    iput-object v0, p0, Lcom/google/android/gms/internal/dk;->rG:Landroid/widget/RelativeLayout;

    iget-boolean v2, p0, Lcom/google/android/gms/internal/dk;->rF:Z

    if-nez v2, :cond_3

    const/high16 v2, -0x1000000

    goto :goto_0

    :cond_3
    sget v2, Lcom/google/android/gms/internal/dk;->ru:I

    :goto_0
    invoke-virtual {v0, v2}, Landroid/widget/RelativeLayout;->setBackgroundColor(I)V

    iget-object v0, p0, Lcom/google/android/gms/internal/dk;->nr:Landroid/app/Activity;

    iget-object v2, p0, Lcom/google/android/gms/internal/dk;->rG:Landroid/widget/RelativeLayout;

    invoke-virtual {v0, v2}, Landroid/app/Activity;->setContentView(Landroid/view/View;)V

    invoke-virtual {p0}, Lcom/google/android/gms/internal/dk;->U()V

    iget-object v0, p0, Lcom/google/android/gms/internal/dk;->rv:Lcom/google/android/gms/internal/dm;

    iget-object v0, v0, Lcom/google/android/gms/internal/dm;->rN:Lcom/google/android/gms/internal/gv;

    invoke-virtual {v0}, Lcom/google/android/gms/internal/gv;->du()Lcom/google/android/gms/internal/gw;

    move-result-object v0

    invoke-virtual {v0}, Lcom/google/android/gms/internal/gw;->dE()Z

    move-result v0

    if-eqz p1, :cond_6

    iget-object v2, p0, Lcom/google/android/gms/internal/dk;->nr:Landroid/app/Activity;

    iget-object v3, p0, Lcom/google/android/gms/internal/dk;->rv:Lcom/google/android/gms/internal/dm;

    iget-object v3, v3, Lcom/google/android/gms/internal/dm;->rN:Lcom/google/android/gms/internal/gv;

    invoke-virtual {v3}, Lcom/google/android/gms/internal/gv;->Y()Lcom/google/android/gms/internal/ay;

    move-result-object v3

    iget-object v4, p0, Lcom/google/android/gms/internal/dk;->rv:Lcom/google/android/gms/internal/dm;

    iget-object v7, v4, Lcom/google/android/gms/internal/dm;->lD:Lcom/google/android/gms/internal/gt;

    const/4 v4, 0x1

    const/4 v6, 0x0

    move v5, v0

    invoke-static/range {v2 .. v7}, Lcom/google/android/gms/internal/gv;->a(Landroid/content/Context;Lcom/google/android/gms/internal/ay;ZZLcom/google/android/gms/internal/k;Lcom/google/android/gms/internal/gt;)Lcom/google/android/gms/internal/gv;

    move-result-object v2

    iput-object v2, p0, Lcom/google/android/gms/internal/dk;->md:Lcom/google/android/gms/internal/gv;

    invoke-virtual {v2}, Lcom/google/android/gms/internal/gv;->du()Lcom/google/android/gms/internal/gw;

    move-result-object v3

    iget-object v2, p0, Lcom/google/android/gms/internal/dk;->rv:Lcom/google/android/gms/internal/dm;

    iget-object v6, v2, Lcom/google/android/gms/internal/dm;->rO:Lcom/google/android/gms/internal/bw;

    iget-object v2, p0, Lcom/google/android/gms/internal/dk;->rv:Lcom/google/android/gms/internal/dm;

    iget-object v7, v2, Lcom/google/android/gms/internal/dm;->rS:Lcom/google/android/gms/internal/dq;

    iget-object v2, p0, Lcom/google/android/gms/internal/dk;->rv:Lcom/google/android/gms/internal/dm;

    iget-object v9, v2, Lcom/google/android/gms/internal/dm;->rU:Lcom/google/android/gms/internal/bz;

    iget-object v2, p0, Lcom/google/android/gms/internal/dk;->rv:Lcom/google/android/gms/internal/dm;

    iget-object v2, v2, Lcom/google/android/gms/internal/dm;->rN:Lcom/google/android/gms/internal/gv;

    invoke-virtual {v2}, Lcom/google/android/gms/internal/gv;->du()Lcom/google/android/gms/internal/gw;

    move-result-object v2

    invoke-virtual {v2}, Lcom/google/android/gms/internal/gw;->dD()Lcom/google/android/gms/internal/v;

    move-result-object v10

    const/4 v4, 0x0

    const/4 v5, 0x0

    const/4 v8, 0x1

    invoke-virtual/range {v3 .. v10}, Lcom/google/android/gms/internal/gw;->a(Lcom/google/android/gms/internal/t;Lcom/google/android/gms/internal/dn;Lcom/google/android/gms/internal/bw;Lcom/google/android/gms/internal/dq;ZLcom/google/android/gms/internal/bz;Lcom/google/android/gms/internal/v;)V

    iget-object v2, p0, Lcom/google/android/gms/internal/dk;->md:Lcom/google/android/gms/internal/gv;

    invoke-virtual {v2}, Lcom/google/android/gms/internal/gv;->du()Lcom/google/android/gms/internal/gw;

    move-result-object v2

    new-instance v3, Lcom/google/android/gms/internal/dk$1;

    invoke-direct {v3, p0}, Lcom/google/android/gms/internal/dk$1;-><init>(Lcom/google/android/gms/internal/dk;)V

    invoke-virtual {v2, v3}, Lcom/google/android/gms/internal/gw;->a(Lcom/google/android/gms/internal/gw$a;)V

    iget-object v2, p0, Lcom/google/android/gms/internal/dk;->rv:Lcom/google/android/gms/internal/dm;

    iget-object v2, v2, Lcom/google/android/gms/internal/dm;->rq:Ljava/lang/String;

    if-eqz v2, :cond_4

    iget-object v2, p0, Lcom/google/android/gms/internal/dk;->md:Lcom/google/android/gms/internal/gv;

    iget-object v3, p0, Lcom/google/android/gms/internal/dk;->rv:Lcom/google/android/gms/internal/dm;

    iget-object v3, v3, Lcom/google/android/gms/internal/dm;->rq:Ljava/lang/String;

    invoke-virtual {v2, v3}, Lcom/google/android/gms/internal/gv;->loadUrl(Ljava/lang/String;)V

    goto :goto_1

    :cond_4
    iget-object v2, p0, Lcom/google/android/gms/internal/dk;->rv:Lcom/google/android/gms/internal/dm;

    iget-object v2, v2, Lcom/google/android/gms/internal/dm;->rR:Ljava/lang/String;

    if-eqz v2, :cond_5

    iget-object v3, p0, Lcom/google/android/gms/internal/dk;->md:Lcom/google/android/gms/internal/gv;

    iget-object v2, p0, Lcom/google/android/gms/internal/dk;->rv:Lcom/google/android/gms/internal/dm;

    iget-object v4, v2, Lcom/google/android/gms/internal/dm;->rP:Ljava/lang/String;

    iget-object v2, p0, Lcom/google/android/gms/internal/dk;->rv:Lcom/google/android/gms/internal/dm;

    iget-object v5, v2, Lcom/google/android/gms/internal/dm;->rR:Ljava/lang/String;

    const-string v7, "UTF-8"

    const/4 v8, 0x0

    const-string v6, "text/html"

    invoke-virtual/range {v3 .. v8}, Lcom/google/android/gms/internal/gv;->loadDataWithBaseURL(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_1

    :cond_5
    new-instance p0, Lcom/google/android/gms/internal/dk$a;

    const-string p1, "No URL or HTML to display in ad overlay."

    invoke-direct {p0, p1}, Lcom/google/android/gms/internal/dk$a;-><init>(Ljava/lang/String;)V

    throw p0

    :cond_6
    iget-object v2, p0, Lcom/google/android/gms/internal/dk;->rv:Lcom/google/android/gms/internal/dm;

    iget-object v2, v2, Lcom/google/android/gms/internal/dm;->rN:Lcom/google/android/gms/internal/gv;

    iput-object v2, p0, Lcom/google/android/gms/internal/dk;->md:Lcom/google/android/gms/internal/gv;

    iget-object v3, p0, Lcom/google/android/gms/internal/dk;->nr:Landroid/app/Activity;

    invoke-virtual {v2, v3}, Lcom/google/android/gms/internal/gv;->setContext(Landroid/content/Context;)V

    :goto_1
    iget-object v2, p0, Lcom/google/android/gms/internal/dk;->md:Lcom/google/android/gms/internal/gv;

    invoke-virtual {v2, p0}, Lcom/google/android/gms/internal/gv;->a(Lcom/google/android/gms/internal/dk;)V

    iget-object v2, p0, Lcom/google/android/gms/internal/dk;->md:Lcom/google/android/gms/internal/gv;

    invoke-virtual {v2}, Lcom/google/android/gms/internal/gv;->getParent()Landroid/view/ViewParent;

    move-result-object v2

    if-eqz v2, :cond_7

    instance-of v3, v2, Landroid/view/ViewGroup;

    if-eqz v3, :cond_7

    check-cast v2, Landroid/view/ViewGroup;

    iget-object v3, p0, Lcom/google/android/gms/internal/dk;->md:Lcom/google/android/gms/internal/gv;

    invoke-virtual {v2, v3}, Landroid/view/ViewGroup;->removeView(Landroid/view/View;)V

    :cond_7
    iget-boolean v2, p0, Lcom/google/android/gms/internal/dk;->rF:Z

    if-eqz v2, :cond_8

    iget-object v2, p0, Lcom/google/android/gms/internal/dk;->md:Lcom/google/android/gms/internal/gv;

    sget v3, Lcom/google/android/gms/internal/dk;->ru:I

    invoke-virtual {v2, v3}, Lcom/google/android/gms/internal/gv;->setBackgroundColor(I)V

    :cond_8
    iget-object v2, p0, Lcom/google/android/gms/internal/dk;->rG:Landroid/widget/RelativeLayout;

    iget-object v3, p0, Lcom/google/android/gms/internal/dk;->md:Lcom/google/android/gms/internal/gv;

    const/4 v4, -0x1

    invoke-virtual {v2, v3, v4, v4}, Landroid/widget/RelativeLayout;->addView(Landroid/view/View;II)V

    if-nez p1, :cond_9

    invoke-virtual {p0}, Lcom/google/android/gms/internal/dk;->bZ()V

    :cond_9
    invoke-virtual {p0, v0}, Lcom/google/android/gms/internal/dk;->n(Z)V

    iget-object p1, p0, Lcom/google/android/gms/internal/dk;->md:Lcom/google/android/gms/internal/gv;

    invoke-virtual {p1}, Lcom/google/android/gms/internal/gv;->dv()Z

    move-result p1

    if-eqz p1, :cond_a

    invoke-virtual {p0, v1}, Lcom/google/android/gms/internal/dk;->o(Z)V

    :cond_a
    return-void
.end method

.method public setRequestedOrientation(I)V
    .locals 0

    iget-object p0, p0, Lcom/google/android/gms/internal/dk;->nr:Landroid/app/Activity;

    invoke-virtual {p0, p1}, Landroid/app/Activity;->setRequestedOrientation(I)V

    return-void
.end method
