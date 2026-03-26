.class public Lcom/google/android/gms/internal/dd;
.super Ljava/lang/Object;


# annotations
.annotation runtime Lcom/google/android/gms/internal/ez;
.end annotation


# static fields
.field static final qT:Ljava/util/Set;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Set<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field


# instance fields
.field private lf:I

.field private lg:I

.field private final mContext:Landroid/content/Context;

.field private final md:Lcom/google/android/gms/internal/gv;

.field private final qM:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private qU:I

.field private qV:I

.field private qW:Z

.field private qX:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .locals 4

    new-instance v0, Ljava/util/HashSet;

    const/4 v1, 0x7

    new-array v1, v1, [Ljava/lang/String;

    const/4 v2, 0x0

    const-string v3, "top-left"

    aput-object v3, v1, v2

    const/4 v2, 0x1

    const-string v3, "top-right"

    aput-object v3, v1, v2

    const/4 v2, 0x2

    const-string v3, "top-center"

    aput-object v3, v1, v2

    const/4 v2, 0x3

    const-string v3, "center"

    aput-object v3, v1, v2

    const/4 v2, 0x4

    const-string v3, "bottom-left"

    aput-object v3, v1, v2

    const/4 v2, 0x5

    const-string v3, "bottom-right"

    aput-object v3, v1, v2

    const/4 v2, 0x6

    const-string v3, "bottom-center"

    aput-object v3, v1, v2

    invoke-static {v1}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/util/HashSet;-><init>(Ljava/util/Collection;)V

    sput-object v0, Lcom/google/android/gms/internal/dd;->qT:Ljava/util/Set;

    return-void
.end method

.method public constructor <init>(Lcom/google/android/gms/internal/gv;Ljava/util/Map;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/google/android/gms/internal/gv;",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, -0x1

    iput v0, p0, Lcom/google/android/gms/internal/dd;->lf:I

    iput v0, p0, Lcom/google/android/gms/internal/dd;->lg:I

    const/4 v0, 0x0

    iput v0, p0, Lcom/google/android/gms/internal/dd;->qU:I

    iput v0, p0, Lcom/google/android/gms/internal/dd;->qV:I

    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/google/android/gms/internal/dd;->qW:Z

    const-string v0, "top-right"

    iput-object v0, p0, Lcom/google/android/gms/internal/dd;->qX:Ljava/lang/String;

    iput-object p1, p0, Lcom/google/android/gms/internal/dd;->md:Lcom/google/android/gms/internal/gv;

    iput-object p2, p0, Lcom/google/android/gms/internal/dd;->qM:Ljava/util/Map;

    invoke-virtual {p1}, Lcom/google/android/gms/internal/gv;->dz()Landroid/content/Context;

    move-result-object p1

    iput-object p1, p0, Lcom/google/android/gms/internal/dd;->mContext:Landroid/content/Context;

    return-void
.end method

.method private bG()V
    .locals 3

    iget-object v0, p0, Lcom/google/android/gms/internal/dd;->mContext:Landroid/content/Context;

    invoke-static {v0}, Lcom/google/android/gms/internal/gj;->t(Landroid/content/Context;)[I

    move-result-object v0

    iget-object v1, p0, Lcom/google/android/gms/internal/dd;->qM:Ljava/util/Map;

    const-string v2, "width"

    invoke-interface {v1, v2}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/CharSequence;

    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    if-nez v1, :cond_0

    iget-object v1, p0, Lcom/google/android/gms/internal/dd;->qM:Ljava/util/Map;

    invoke-interface {v1, v2}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    invoke-static {v1}, Lcom/google/android/gms/internal/gj;->M(Ljava/lang/String;)I

    move-result v1

    const/4 v2, 0x0

    aget v2, v0, v2

    invoke-virtual {p0, v1, v2}, Lcom/google/android/gms/internal/dd;->b(II)Z

    move-result v2

    if-eqz v2, :cond_0

    iput v1, p0, Lcom/google/android/gms/internal/dd;->lf:I

    :cond_0
    iget-object v1, p0, Lcom/google/android/gms/internal/dd;->qM:Ljava/util/Map;

    const-string v2, "height"

    invoke-interface {v1, v2}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/CharSequence;

    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    if-nez v1, :cond_1

    iget-object v1, p0, Lcom/google/android/gms/internal/dd;->qM:Ljava/util/Map;

    invoke-interface {v1, v2}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    invoke-static {v1}, Lcom/google/android/gms/internal/gj;->M(Ljava/lang/String;)I

    move-result v1

    const/4 v2, 0x1

    aget v0, v0, v2

    invoke-virtual {p0, v1, v0}, Lcom/google/android/gms/internal/dd;->c(II)Z

    move-result v0

    if-eqz v0, :cond_1

    iput v1, p0, Lcom/google/android/gms/internal/dd;->lg:I

    :cond_1
    iget-object v0, p0, Lcom/google/android/gms/internal/dd;->qM:Ljava/util/Map;

    const-string v1, "offsetX"

    invoke-interface {v0, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/CharSequence;

    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_2

    iget-object v0, p0, Lcom/google/android/gms/internal/dd;->qM:Ljava/util/Map;

    invoke-interface {v0, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    invoke-static {v0}, Lcom/google/android/gms/internal/gj;->M(Ljava/lang/String;)I

    move-result v0

    iput v0, p0, Lcom/google/android/gms/internal/dd;->qU:I

    :cond_2
    iget-object v0, p0, Lcom/google/android/gms/internal/dd;->qM:Ljava/util/Map;

    const-string v1, "offsetY"

    invoke-interface {v0, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/CharSequence;

    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_3

    iget-object v0, p0, Lcom/google/android/gms/internal/dd;->qM:Ljava/util/Map;

    invoke-interface {v0, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    invoke-static {v0}, Lcom/google/android/gms/internal/gj;->M(Ljava/lang/String;)I

    move-result v0

    iput v0, p0, Lcom/google/android/gms/internal/dd;->qV:I

    :cond_3
    iget-object v0, p0, Lcom/google/android/gms/internal/dd;->qM:Ljava/util/Map;

    const-string v1, "allowOffscreen"

    invoke-interface {v0, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/CharSequence;

    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_4

    iget-object v0, p0, Lcom/google/android/gms/internal/dd;->qM:Ljava/util/Map;

    invoke-interface {v0, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    invoke-static {v0}, Ljava/lang/Boolean;->parseBoolean(Ljava/lang/String;)Z

    move-result v0

    iput-boolean v0, p0, Lcom/google/android/gms/internal/dd;->qW:Z

    :cond_4
    iget-object v0, p0, Lcom/google/android/gms/internal/dd;->qM:Ljava/util/Map;

    const-string v1, "customClosePosition"

    invoke-interface {v0, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    if-nez v1, :cond_5

    sget-object v1, Lcom/google/android/gms/internal/dd;->qT:Ljava/util/Set;

    invoke-interface {v1, v0}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_5

    iput-object v0, p0, Lcom/google/android/gms/internal/dd;->qX:Ljava/lang/String;

    :cond_5
    return-void
.end method


# virtual methods
.method b(II)Z
    .locals 0

    const/16 p0, 0x32

    if-lt p1, p0, :cond_0

    if-ge p1, p2, :cond_0

    const/4 p0, 0x1

    goto :goto_0

    :cond_0
    const/4 p0, 0x0

    :goto_0
    return p0
.end method

.method bH()Z
    .locals 2

    iget v0, p0, Lcom/google/android/gms/internal/dd;->lf:I

    const/4 v1, -0x1

    if-le v0, v1, :cond_0

    iget p0, p0, Lcom/google/android/gms/internal/dd;->lg:I

    if-le p0, v1, :cond_0

    const/4 p0, 0x1

    goto :goto_0

    :cond_0
    const/4 p0, 0x0

    :goto_0
    return p0
.end method

.method bI()V
    .locals 3

    :try_start_0
    new-instance v0, Lorg/json/JSONObject;

    invoke-direct {v0}, Lorg/json/JSONObject;-><init>()V

    const-string v1, "x"

    iget v2, p0, Lcom/google/android/gms/internal/dd;->qU:I

    invoke-virtual {v0, v1, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;I)Lorg/json/JSONObject;

    move-result-object v0

    const-string v1, "y"

    iget v2, p0, Lcom/google/android/gms/internal/dd;->qV:I

    invoke-virtual {v0, v1, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;I)Lorg/json/JSONObject;

    move-result-object v0

    const-string v1, "width"

    iget v2, p0, Lcom/google/android/gms/internal/dd;->lf:I

    invoke-virtual {v0, v1, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;I)Lorg/json/JSONObject;

    move-result-object v0

    const-string v1, "height"

    iget v2, p0, Lcom/google/android/gms/internal/dd;->lg:I

    invoke-virtual {v0, v1, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;I)Lorg/json/JSONObject;

    move-result-object v0

    iget-object p0, p0, Lcom/google/android/gms/internal/dd;->md:Lcom/google/android/gms/internal/gv;

    const-string v1, "onSizeChanged"

    invoke-virtual {p0, v1, v0}, Lcom/google/android/gms/internal/gv;->b(Ljava/lang/String;Lorg/json/JSONObject;)V
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception p0

    const-string v0, "Error occured while dispatching size change."

    invoke-static {v0, p0}, Lcom/google/android/gms/internal/gs;->b(Ljava/lang/String;Ljava/lang/Throwable;)V

    :goto_0
    return-void
.end method

.method bJ()V
    .locals 3

    :try_start_0
    new-instance v0, Lorg/json/JSONObject;

    invoke-direct {v0}, Lorg/json/JSONObject;-><init>()V

    const-string v1, "state"

    const-string v2, "resized"

    invoke-virtual {v0, v1, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    move-result-object v0

    iget-object p0, p0, Lcom/google/android/gms/internal/dd;->md:Lcom/google/android/gms/internal/gv;

    const-string v1, "onStateChanged"

    invoke-virtual {p0, v1, v0}, Lcom/google/android/gms/internal/gv;->b(Ljava/lang/String;Lorg/json/JSONObject;)V
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception p0

    const-string v0, "Error occured while dispatching state change."

    invoke-static {v0, p0}, Lcom/google/android/gms/internal/gs;->b(Ljava/lang/String;Ljava/lang/Throwable;)V

    :goto_0
    return-void
.end method

.method c(II)Z
    .locals 0

    const/16 p0, 0x32

    if-lt p1, p0, :cond_0

    if-ge p1, p2, :cond_0

    const/4 p0, 0x1

    goto :goto_0

    :cond_0
    const/4 p0, 0x0

    :goto_0
    return p0
.end method

.method public execute()V
    .locals 6

    const-string v0, "PLEASE IMPLEMENT mraid.resize()"

    invoke-static {v0}, Lcom/google/android/gms/internal/gs;->U(Ljava/lang/String;)V

    iget-object v0, p0, Lcom/google/android/gms/internal/dd;->mContext:Landroid/content/Context;

    if-nez v0, :cond_0

    const-string p0, "Not an activity context. Cannot resize."

    invoke-static {p0}, Lcom/google/android/gms/internal/gs;->W(Ljava/lang/String;)V

    return-void

    :cond_0
    iget-object v0, p0, Lcom/google/android/gms/internal/dd;->md:Lcom/google/android/gms/internal/gv;

    invoke-virtual {v0}, Lcom/google/android/gms/internal/gv;->Y()Lcom/google/android/gms/internal/ay;

    move-result-object v0

    iget-boolean v0, v0, Lcom/google/android/gms/internal/ay;->og:Z

    if-eqz v0, :cond_1

    const-string p0, "Is interstitial. Cannot resize an interstitial."

    invoke-static {p0}, Lcom/google/android/gms/internal/gs;->W(Ljava/lang/String;)V

    return-void

    :cond_1
    iget-object v0, p0, Lcom/google/android/gms/internal/dd;->md:Lcom/google/android/gms/internal/gv;

    invoke-virtual {v0}, Lcom/google/android/gms/internal/gv;->dy()Z

    move-result v0

    if-eqz v0, :cond_2

    const-string p0, "Is expanded. Cannot resize an expanded banner."

    invoke-static {p0}, Lcom/google/android/gms/internal/gs;->W(Ljava/lang/String;)V

    return-void

    :cond_2
    invoke-direct {p0}, Lcom/google/android/gms/internal/dd;->bG()V

    invoke-virtual {p0}, Lcom/google/android/gms/internal/dd;->bH()Z

    move-result v0

    if-nez v0, :cond_3

    const-string p0, "Invalid width and height options. Cannot resize."

    invoke-static {p0}, Lcom/google/android/gms/internal/gs;->W(Ljava/lang/String;)V

    return-void

    :cond_3
    iget-object v0, p0, Lcom/google/android/gms/internal/dd;->mContext:Landroid/content/Context;

    const-string v1, "window"

    invoke-virtual {v0, v1}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/view/WindowManager;

    new-instance v1, Landroid/util/DisplayMetrics;

    invoke-direct {v1}, Landroid/util/DisplayMetrics;-><init>()V

    invoke-interface {v0}, Landroid/view/WindowManager;->getDefaultDisplay()Landroid/view/Display;

    move-result-object v0

    invoke-virtual {v0, v1}, Landroid/view/Display;->getMetrics(Landroid/util/DisplayMetrics;)V

    iget v0, p0, Lcom/google/android/gms/internal/dd;->lf:I

    invoke-static {v1, v0}, Lcom/google/android/gms/internal/gr;->a(Landroid/util/DisplayMetrics;I)I

    move-result v0

    add-int/lit8 v0, v0, 0x10

    iget v2, p0, Lcom/google/android/gms/internal/dd;->lg:I

    invoke-static {v1, v2}, Lcom/google/android/gms/internal/gr;->a(Landroid/util/DisplayMetrics;I)I

    move-result v1

    add-int/lit8 v1, v1, 0x10

    iget-object v2, p0, Lcom/google/android/gms/internal/dd;->md:Lcom/google/android/gms/internal/gv;

    invoke-virtual {v2}, Lcom/google/android/gms/internal/gv;->getParent()Landroid/view/ViewParent;

    move-result-object v2

    if-eqz v2, :cond_4

    instance-of v3, v2, Landroid/view/ViewGroup;

    if-eqz v3, :cond_4

    check-cast v2, Landroid/view/ViewGroup;

    iget-object v3, p0, Lcom/google/android/gms/internal/dd;->md:Lcom/google/android/gms/internal/gv;

    invoke-virtual {v2, v3}, Landroid/view/ViewGroup;->removeView(Landroid/view/View;)V

    :cond_4
    new-instance v2, Landroid/widget/LinearLayout;

    iget-object v3, p0, Lcom/google/android/gms/internal/dd;->mContext:Landroid/content/Context;

    invoke-direct {v2, v3}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    const/4 v3, 0x0

    invoke-virtual {v2, v3}, Landroid/widget/LinearLayout;->setBackgroundColor(I)V

    new-instance v4, Landroid/widget/PopupWindow;

    iget-object v5, p0, Lcom/google/android/gms/internal/dd;->mContext:Landroid/content/Context;

    invoke-direct {v4, v5}, Landroid/widget/PopupWindow;-><init>(Landroid/content/Context;)V

    invoke-virtual {v4, v1}, Landroid/widget/PopupWindow;->setHeight(I)V

    invoke-virtual {v4, v0}, Landroid/widget/PopupWindow;->setWidth(I)V

    iget-boolean v0, p0, Lcom/google/android/gms/internal/dd;->qW:Z

    xor-int/lit8 v0, v0, 0x1

    invoke-virtual {v4, v0}, Landroid/widget/PopupWindow;->setClippingEnabled(Z)V

    invoke-virtual {v4, v2}, Landroid/widget/PopupWindow;->setContentView(Landroid/view/View;)V

    iget-object v0, p0, Lcom/google/android/gms/internal/dd;->md:Lcom/google/android/gms/internal/gv;

    const/4 v1, -0x1

    invoke-virtual {v2, v0, v1, v1}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;II)V

    iget-object v0, p0, Lcom/google/android/gms/internal/dd;->mContext:Landroid/content/Context;

    check-cast v0, Landroid/app/Activity;

    invoke-virtual {v0}, Landroid/app/Activity;->getWindow()Landroid/view/Window;

    move-result-object v0

    invoke-virtual {v0}, Landroid/view/Window;->getDecorView()Landroid/view/View;

    move-result-object v0

    iget v1, p0, Lcom/google/android/gms/internal/dd;->qU:I

    iget v2, p0, Lcom/google/android/gms/internal/dd;->qV:I

    invoke-virtual {v4, v0, v3, v1, v2}, Landroid/widget/PopupWindow;->showAtLocation(Landroid/view/View;III)V

    iget-object v0, p0, Lcom/google/android/gms/internal/dd;->md:Lcom/google/android/gms/internal/gv;

    new-instance v1, Lcom/google/android/gms/internal/ay;

    iget-object v2, p0, Lcom/google/android/gms/internal/dd;->mContext:Landroid/content/Context;

    new-instance v3, Lcom/google/android/gms/ads/AdSize;

    iget v4, p0, Lcom/google/android/gms/internal/dd;->lf:I

    iget v5, p0, Lcom/google/android/gms/internal/dd;->lg:I

    invoke-direct {v3, v4, v5}, Lcom/google/android/gms/ads/AdSize;-><init>(II)V

    invoke-direct {v1, v2, v3}, Lcom/google/android/gms/internal/ay;-><init>(Landroid/content/Context;Lcom/google/android/gms/ads/AdSize;)V

    invoke-virtual {v0, v1}, Lcom/google/android/gms/internal/gv;->a(Lcom/google/android/gms/internal/ay;)V

    invoke-virtual {p0}, Lcom/google/android/gms/internal/dd;->bI()V

    invoke-virtual {p0}, Lcom/google/android/gms/internal/dd;->bJ()V

    return-void
.end method
