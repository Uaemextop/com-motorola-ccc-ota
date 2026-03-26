.class public final Lcom/google/android/gms/internal/ce;
.super Ljava/lang/Object;

# interfaces
.implements Lcom/google/android/gms/internal/by;


# annotations
.annotation runtime Lcom/google/android/gms/internal/ez;
.end annotation


# direct methods
.method public constructor <init>()V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method private static a(Landroid/util/DisplayMetrics;Ljava/util/Map;Ljava/lang/String;I)I
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/util/DisplayMetrics;",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;",
            "Ljava/lang/String;",
            "I)I"
        }
    .end annotation

    invoke-interface {p1, p2}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/lang/String;

    if-eqz p1, :cond_0

    :try_start_0
    invoke-static {p1}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v0

    invoke-static {p0, v0}, Lcom/google/android/gms/internal/gr;->a(Landroid/util/DisplayMetrics;I)I

    move-result p3
    :try_end_0
    .catch Ljava/lang/NumberFormatException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    new-instance p0, Ljava/lang/StringBuilder;

    const-string v0, "Could not parse "

    invoke-direct {p0, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p0

    const-string p2, " in a video GMSG: "

    invoke-virtual {p0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p0

    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-static {p0}, Lcom/google/android/gms/internal/gs;->W(Ljava/lang/String;)V

    :cond_0
    :goto_0
    return p3
.end method


# virtual methods
.method public a(Lcom/google/android/gms/internal/gv;Ljava/util/Map;)V
    .locals 9
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

    const-string p0, "action"

    invoke-interface {p2, p0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Ljava/lang/String;

    if-nez p0, :cond_0

    const-string p0, "Action missing from video GMSG."

    invoke-static {p0}, Lcom/google/android/gms/internal/gs;->W(Ljava/lang/String;)V

    return-void

    :cond_0
    invoke-virtual {p1}, Lcom/google/android/gms/internal/gv;->dt()Lcom/google/android/gms/internal/dk;

    move-result-object v0

    if-nez v0, :cond_1

    const-string p0, "Could not get ad overlay for a video GMSG."

    invoke-static {p0}, Lcom/google/android/gms/internal/gs;->W(Ljava/lang/String;)V

    return-void

    :cond_1
    const-string v1, "new"

    invoke-virtual {v1, p0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v1

    const-string v2, "position"

    invoke-virtual {v2, p0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v2

    const-string v3, "y"

    const-string v4, "x"

    const/4 v5, 0x0

    if-nez v1, :cond_f

    if-eqz v2, :cond_2

    goto/16 :goto_1

    :cond_2
    invoke-virtual {v0}, Lcom/google/android/gms/internal/dk;->bV()Lcom/google/android/gms/internal/do;

    move-result-object v0

    if-nez v0, :cond_3

    const-string p0, "no_video_view"

    const/4 p2, 0x0

    invoke-static {p1, p0, p2}, Lcom/google/android/gms/internal/do;->a(Lcom/google/android/gms/internal/gv;Ljava/lang/String;Ljava/lang/String;)V

    return-void

    :cond_3
    const-string v1, "click"

    invoke-virtual {v1, p0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_4

    invoke-virtual {p1}, Lcom/google/android/gms/internal/gv;->getContext()Landroid/content/Context;

    move-result-object p0

    invoke-virtual {p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object p0

    invoke-virtual {p0}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object p0

    invoke-static {p0, p2, v4, v5}, Lcom/google/android/gms/internal/ce;->a(Landroid/util/DisplayMetrics;Ljava/util/Map;Ljava/lang/String;I)I

    move-result p1

    invoke-static {p0, p2, v3, v5}, Lcom/google/android/gms/internal/ce;->a(Landroid/util/DisplayMetrics;Ljava/util/Map;Ljava/lang/String;I)I

    move-result p0

    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    move-result-wide v3

    int-to-float v6, p1

    int-to-float v7, p0

    const/4 v8, 0x0

    const/4 v5, 0x0

    move-wide v1, v3

    invoke-static/range {v1 .. v8}, Landroid/view/MotionEvent;->obtain(JJIFFI)Landroid/view/MotionEvent;

    move-result-object p0

    invoke-virtual {v0, p0}, Lcom/google/android/gms/internal/do;->b(Landroid/view/MotionEvent;)V

    invoke-virtual {p0}, Landroid/view/MotionEvent;->recycle()V

    goto/16 :goto_2

    :cond_4
    const-string p1, "controls"

    invoke-virtual {p1, p0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result p1

    if-eqz p1, :cond_6

    const-string p0, "enabled"

    invoke-interface {p2, p0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Ljava/lang/String;

    if-nez p0, :cond_5

    const-string p0, "Enabled parameter missing from controls video GMSG."

    invoke-static {p0}, Lcom/google/android/gms/internal/gs;->W(Ljava/lang/String;)V

    return-void

    :cond_5
    invoke-static {p0}, Ljava/lang/Boolean;->parseBoolean(Ljava/lang/String;)Z

    move-result p0

    invoke-virtual {v0, p0}, Lcom/google/android/gms/internal/do;->q(Z)V

    goto/16 :goto_2

    :cond_6
    const-string p1, "currentTime"

    invoke-virtual {p1, p0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result p1

    if-eqz p1, :cond_8

    const-string p0, "time"

    invoke-interface {p2, p0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Ljava/lang/String;

    if-nez p0, :cond_7

    const-string p0, "Time parameter missing from currentTime video GMSG."

    invoke-static {p0}, Lcom/google/android/gms/internal/gs;->W(Ljava/lang/String;)V

    return-void

    :cond_7
    :try_start_0
    invoke-static {p0}, Ljava/lang/Float;->parseFloat(Ljava/lang/String;)F

    move-result p1

    const/high16 p2, 0x447a0000    # 1000.0f

    mul-float/2addr p1, p2

    float-to-int p1, p1

    invoke-virtual {v0, p1}, Lcom/google/android/gms/internal/do;->seekTo(I)V
    :try_end_0
    .catch Ljava/lang/NumberFormatException; {:try_start_0 .. :try_end_0} :catch_0

    goto/16 :goto_2

    :catch_0
    new-instance p1, Ljava/lang/StringBuilder;

    const-string p2, "Could not parse time parameter from currentTime video GMSG: "

    invoke-direct {p1, p2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    goto :goto_0

    :cond_8
    const-string p1, "hide"

    invoke-virtual {p1, p0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result p1

    if-eqz p1, :cond_9

    const/4 p0, 0x4

    invoke-virtual {v0, p0}, Lcom/google/android/gms/internal/do;->setVisibility(I)V

    goto/16 :goto_2

    :cond_9
    const-string p1, "load"

    invoke-virtual {p1, p0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result p1

    if-eqz p1, :cond_a

    invoke-virtual {v0}, Lcom/google/android/gms/internal/do;->ch()V

    goto/16 :goto_2

    :cond_a
    const-string p1, "pause"

    invoke-virtual {p1, p0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result p1

    if-eqz p1, :cond_b

    invoke-virtual {v0}, Lcom/google/android/gms/internal/do;->pause()V

    goto :goto_2

    :cond_b
    const-string p1, "play"

    invoke-virtual {p1, p0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result p1

    if-eqz p1, :cond_c

    invoke-virtual {v0}, Lcom/google/android/gms/internal/do;->play()V

    goto :goto_2

    :cond_c
    const-string p1, "show"

    invoke-virtual {p1, p0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result p1

    if-eqz p1, :cond_d

    invoke-virtual {v0, v5}, Lcom/google/android/gms/internal/do;->setVisibility(I)V

    goto :goto_2

    :cond_d
    const-string p1, "src"

    invoke-virtual {p1, p0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_e

    invoke-interface {p2, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Ljava/lang/String;

    invoke-virtual {v0, p0}, Lcom/google/android/gms/internal/do;->C(Ljava/lang/String;)V

    goto :goto_2

    :cond_e
    new-instance p1, Ljava/lang/StringBuilder;

    const-string p2, "Unknown video action: "

    invoke-direct {p1, p2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    :goto_0
    invoke-virtual {p1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-static {p0}, Lcom/google/android/gms/internal/gs;->W(Ljava/lang/String;)V

    goto :goto_2

    :cond_f
    :goto_1
    invoke-virtual {p1}, Lcom/google/android/gms/internal/gv;->getContext()Landroid/content/Context;

    move-result-object p0

    invoke-virtual {p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object p0

    invoke-virtual {p0}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object p0

    invoke-static {p0, p2, v4, v5}, Lcom/google/android/gms/internal/ce;->a(Landroid/util/DisplayMetrics;Ljava/util/Map;Ljava/lang/String;I)I

    move-result p1

    invoke-static {p0, p2, v3, v5}, Lcom/google/android/gms/internal/ce;->a(Landroid/util/DisplayMetrics;Ljava/util/Map;Ljava/lang/String;I)I

    move-result v2

    const-string v3, "w"

    const/4 v4, -0x1

    invoke-static {p0, p2, v3, v4}, Lcom/google/android/gms/internal/ce;->a(Landroid/util/DisplayMetrics;Ljava/util/Map;Ljava/lang/String;I)I

    move-result v3

    const-string v5, "h"

    invoke-static {p0, p2, v5, v4}, Lcom/google/android/gms/internal/ce;->a(Landroid/util/DisplayMetrics;Ljava/util/Map;Ljava/lang/String;I)I

    move-result p0

    if-eqz v1, :cond_10

    invoke-virtual {v0}, Lcom/google/android/gms/internal/dk;->bV()Lcom/google/android/gms/internal/do;

    move-result-object p2

    if-nez p2, :cond_10

    invoke-virtual {v0, p1, v2, v3, p0}, Lcom/google/android/gms/internal/dk;->c(IIII)V

    goto :goto_2

    :cond_10
    invoke-virtual {v0, p1, v2, v3, p0}, Lcom/google/android/gms/internal/dk;->b(IIII)V

    :goto_2
    return-void
.end method
