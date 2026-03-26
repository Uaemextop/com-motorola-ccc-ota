.class public Lcom/google/android/gms/internal/gw;
.super Landroid/webkit/WebViewClient;


# annotations
.annotation runtime Lcom/google/android/gms/internal/ez;
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/google/android/gms/internal/gw$a;
    }
.end annotation


# instance fields
.field protected final md:Lcom/google/android/gms/internal/gv;

.field private final mw:Ljava/lang/Object;

.field private pJ:Lcom/google/android/gms/internal/cb;

.field private pL:Lcom/google/android/gms/internal/bz;

.field private pM:Lcom/google/android/gms/internal/v;

.field private pz:Lcom/google/android/gms/internal/bw;

.field private tg:Lcom/google/android/gms/internal/gw$a;

.field private final wP:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap<",
            "Ljava/lang/String;",
            "Lcom/google/android/gms/internal/by;",
            ">;"
        }
    .end annotation
.end field

.field private wQ:Lcom/google/android/gms/internal/t;

.field private wR:Lcom/google/android/gms/internal/dn;

.field private wS:Z

.field private wT:Z

.field private wU:Lcom/google/android/gms/internal/dq;

.field private final wV:Lcom/google/android/gms/internal/dg;


# direct methods
.method public constructor <init>(Lcom/google/android/gms/internal/gv;Z)V
    .locals 4

    new-instance v0, Lcom/google/android/gms/internal/dg;

    invoke-virtual {p1}, Lcom/google/android/gms/internal/gv;->getContext()Landroid/content/Context;

    move-result-object v1

    new-instance v2, Lcom/google/android/gms/internal/bl;

    invoke-virtual {p1}, Lcom/google/android/gms/internal/gv;->getContext()Landroid/content/Context;

    move-result-object v3

    invoke-direct {v2, v3}, Lcom/google/android/gms/internal/bl;-><init>(Landroid/content/Context;)V

    invoke-direct {v0, p1, v1, v2}, Lcom/google/android/gms/internal/dg;-><init>(Lcom/google/android/gms/internal/gv;Landroid/content/Context;Lcom/google/android/gms/internal/bl;)V

    invoke-direct {p0, p1, p2, v0}, Lcom/google/android/gms/internal/gw;-><init>(Lcom/google/android/gms/internal/gv;ZLcom/google/android/gms/internal/dg;)V

    return-void
.end method

.method constructor <init>(Lcom/google/android/gms/internal/gv;ZLcom/google/android/gms/internal/dg;)V
    .locals 1

    invoke-direct {p0}, Landroid/webkit/WebViewClient;-><init>()V

    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lcom/google/android/gms/internal/gw;->wP:Ljava/util/HashMap;

    new-instance v0, Ljava/lang/Object;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    iput-object v0, p0, Lcom/google/android/gms/internal/gw;->mw:Ljava/lang/Object;

    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/google/android/gms/internal/gw;->wS:Z

    iput-object p1, p0, Lcom/google/android/gms/internal/gw;->md:Lcom/google/android/gms/internal/gv;

    iput-boolean p2, p0, Lcom/google/android/gms/internal/gw;->wT:Z

    iput-object p3, p0, Lcom/google/android/gms/internal/gw;->wV:Lcom/google/android/gms/internal/dg;

    return-void
.end method

.method private static d(Landroid/net/Uri;)Z
    .locals 1

    invoke-virtual {p0}, Landroid/net/Uri;->getScheme()Ljava/lang/String;

    move-result-object p0

    const-string v0, "http"

    invoke-virtual {v0, p0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_1

    const-string v0, "https"

    invoke-virtual {v0, p0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result p0

    if-eqz p0, :cond_0

    goto :goto_0

    :cond_0
    const/4 p0, 0x0

    goto :goto_1

    :cond_1
    :goto_0
    const/4 p0, 0x1

    :goto_1
    return p0
.end method

.method private e(Landroid/net/Uri;)V
    .locals 5

    invoke-virtual {p1}, Landroid/net/Uri;->getPath()Ljava/lang/String;

    move-result-object v0

    iget-object v1, p0, Lcom/google/android/gms/internal/gw;->wP:Ljava/util/HashMap;

    invoke-virtual {v1, v0}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/google/android/gms/internal/by;

    if-eqz v1, :cond_1

    invoke-static {p1}, Lcom/google/android/gms/internal/gj;->c(Landroid/net/Uri;)Ljava/util/Map;

    move-result-object p1

    const/4 v2, 0x2

    invoke-static {v2}, Lcom/google/android/gms/internal/gs;->u(I)Z

    move-result v2

    if-eqz v2, :cond_0

    new-instance v2, Ljava/lang/StringBuilder;

    const-string v3, "Received GMSG: "

    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/google/android/gms/internal/gs;->V(Ljava/lang/String;)V

    invoke-interface {p1}, Ljava/util/Map;->keySet()Ljava/util/Set;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_0

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    new-instance v3, Ljava/lang/StringBuilder;

    const-string v4, "  "

    invoke-direct {v3, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, ": "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-interface {p1, v2}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Lcom/google/android/gms/internal/gs;->V(Ljava/lang/String;)V

    goto :goto_0

    :cond_0
    iget-object p0, p0, Lcom/google/android/gms/internal/gw;->md:Lcom/google/android/gms/internal/gv;

    invoke-interface {v1, p0, p1}, Lcom/google/android/gms/internal/by;->a(Lcom/google/android/gms/internal/gv;Ljava/util/Map;)V

    goto :goto_1

    :cond_1
    new-instance p0, Ljava/lang/StringBuilder;

    const-string v0, "No GMSG handler found for GMSG: "

    invoke-direct {p0, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-static {p0}, Lcom/google/android/gms/internal/gs;->V(Ljava/lang/String;)V

    :goto_1
    return-void
.end method


# virtual methods
.method public final a(Lcom/google/android/gms/internal/dj;)V
    .locals 8

    iget-object v0, p0, Lcom/google/android/gms/internal/gw;->md:Lcom/google/android/gms/internal/gv;

    invoke-virtual {v0}, Lcom/google/android/gms/internal/gv;->dy()Z

    move-result v0

    new-instance v7, Lcom/google/android/gms/internal/dm;

    const/4 v1, 0x0

    if-eqz v0, :cond_0

    iget-object v2, p0, Lcom/google/android/gms/internal/gw;->md:Lcom/google/android/gms/internal/gv;

    invoke-virtual {v2}, Lcom/google/android/gms/internal/gv;->Y()Lcom/google/android/gms/internal/ay;

    move-result-object v2

    iget-boolean v2, v2, Lcom/google/android/gms/internal/ay;->og:Z

    if-nez v2, :cond_0

    move-object v3, v1

    goto :goto_0

    :cond_0
    iget-object v2, p0, Lcom/google/android/gms/internal/gw;->wQ:Lcom/google/android/gms/internal/t;

    move-object v3, v2

    :goto_0
    if-eqz v0, :cond_1

    move-object v4, v1

    goto :goto_1

    :cond_1
    iget-object v0, p0, Lcom/google/android/gms/internal/gw;->wR:Lcom/google/android/gms/internal/dn;

    move-object v4, v0

    :goto_1
    iget-object v5, p0, Lcom/google/android/gms/internal/gw;->wU:Lcom/google/android/gms/internal/dq;

    iget-object v0, p0, Lcom/google/android/gms/internal/gw;->md:Lcom/google/android/gms/internal/gv;

    invoke-virtual {v0}, Lcom/google/android/gms/internal/gv;->dx()Lcom/google/android/gms/internal/gt;

    move-result-object v6

    move-object v1, v7

    move-object v2, p1

    invoke-direct/range {v1 .. v6}, Lcom/google/android/gms/internal/dm;-><init>(Lcom/google/android/gms/internal/dj;Lcom/google/android/gms/internal/t;Lcom/google/android/gms/internal/dn;Lcom/google/android/gms/internal/dq;Lcom/google/android/gms/internal/gt;)V

    invoke-virtual {p0, v7}, Lcom/google/android/gms/internal/gw;->a(Lcom/google/android/gms/internal/dm;)V

    return-void
.end method

.method protected a(Lcom/google/android/gms/internal/dm;)V
    .locals 0

    iget-object p0, p0, Lcom/google/android/gms/internal/gw;->md:Lcom/google/android/gms/internal/gv;

    invoke-virtual {p0}, Lcom/google/android/gms/internal/gv;->getContext()Landroid/content/Context;

    move-result-object p0

    invoke-static {p0, p1}, Lcom/google/android/gms/internal/dk;->a(Landroid/content/Context;Lcom/google/android/gms/internal/dm;)V

    return-void
.end method

.method public final a(Lcom/google/android/gms/internal/gw$a;)V
    .locals 0

    iput-object p1, p0, Lcom/google/android/gms/internal/gw;->tg:Lcom/google/android/gms/internal/gw$a;

    return-void
.end method

.method public a(Lcom/google/android/gms/internal/t;Lcom/google/android/gms/internal/dn;Lcom/google/android/gms/internal/bw;Lcom/google/android/gms/internal/dq;ZLcom/google/android/gms/internal/bz;Lcom/google/android/gms/internal/cb;Lcom/google/android/gms/internal/v;)V
    .locals 10

    move-object v8, p0

    move-object/from16 v9, p7

    move-object v0, p0

    move-object v1, p1

    move-object v2, p2

    move-object v3, p3

    move-object v4, p4

    move v5, p5

    move-object/from16 v6, p6

    move-object/from16 v7, p8

    invoke-virtual/range {v0 .. v7}, Lcom/google/android/gms/internal/gw;->a(Lcom/google/android/gms/internal/t;Lcom/google/android/gms/internal/dn;Lcom/google/android/gms/internal/bw;Lcom/google/android/gms/internal/dq;ZLcom/google/android/gms/internal/bz;Lcom/google/android/gms/internal/v;)V

    new-instance v0, Lcom/google/android/gms/internal/ca;

    invoke-direct {v0, v9}, Lcom/google/android/gms/internal/ca;-><init>(Lcom/google/android/gms/internal/cb;)V

    const-string v1, "/setInterstitialProperties"

    invoke-virtual {p0, v1, v0}, Lcom/google/android/gms/internal/gw;->a(Ljava/lang/String;Lcom/google/android/gms/internal/by;)V

    iput-object v9, v8, Lcom/google/android/gms/internal/gw;->pJ:Lcom/google/android/gms/internal/cb;

    return-void
.end method

.method public a(Lcom/google/android/gms/internal/t;Lcom/google/android/gms/internal/dn;Lcom/google/android/gms/internal/bw;Lcom/google/android/gms/internal/dq;ZLcom/google/android/gms/internal/bz;Lcom/google/android/gms/internal/v;)V
    .locals 2

    if-nez p7, :cond_0

    new-instance p7, Lcom/google/android/gms/internal/v;

    const/4 v0, 0x0

    invoke-direct {p7, v0}, Lcom/google/android/gms/internal/v;-><init>(Z)V

    :cond_0
    new-instance v0, Lcom/google/android/gms/internal/bv;

    invoke-direct {v0, p3}, Lcom/google/android/gms/internal/bv;-><init>(Lcom/google/android/gms/internal/bw;)V

    const-string v1, "/appEvent"

    invoke-virtual {p0, v1, v0}, Lcom/google/android/gms/internal/gw;->a(Ljava/lang/String;Lcom/google/android/gms/internal/by;)V

    const-string v0, "/canOpenURLs"

    sget-object v1, Lcom/google/android/gms/internal/bx;->pB:Lcom/google/android/gms/internal/by;

    invoke-virtual {p0, v0, v1}, Lcom/google/android/gms/internal/gw;->a(Ljava/lang/String;Lcom/google/android/gms/internal/by;)V

    const-string v0, "/click"

    sget-object v1, Lcom/google/android/gms/internal/bx;->pC:Lcom/google/android/gms/internal/by;

    invoke-virtual {p0, v0, v1}, Lcom/google/android/gms/internal/gw;->a(Ljava/lang/String;Lcom/google/android/gms/internal/by;)V

    const-string v0, "/close"

    sget-object v1, Lcom/google/android/gms/internal/bx;->pD:Lcom/google/android/gms/internal/by;

    invoke-virtual {p0, v0, v1}, Lcom/google/android/gms/internal/gw;->a(Ljava/lang/String;Lcom/google/android/gms/internal/by;)V

    const-string v0, "/customClose"

    sget-object v1, Lcom/google/android/gms/internal/bx;->pE:Lcom/google/android/gms/internal/by;

    invoke-virtual {p0, v0, v1}, Lcom/google/android/gms/internal/gw;->a(Ljava/lang/String;Lcom/google/android/gms/internal/by;)V

    const-string v0, "/httpTrack"

    sget-object v1, Lcom/google/android/gms/internal/bx;->pF:Lcom/google/android/gms/internal/by;

    invoke-virtual {p0, v0, v1}, Lcom/google/android/gms/internal/gw;->a(Ljava/lang/String;Lcom/google/android/gms/internal/by;)V

    const-string v0, "/log"

    sget-object v1, Lcom/google/android/gms/internal/bx;->pG:Lcom/google/android/gms/internal/by;

    invoke-virtual {p0, v0, v1}, Lcom/google/android/gms/internal/gw;->a(Ljava/lang/String;Lcom/google/android/gms/internal/by;)V

    new-instance v0, Lcom/google/android/gms/internal/cd;

    invoke-direct {v0, p6, p7}, Lcom/google/android/gms/internal/cd;-><init>(Lcom/google/android/gms/internal/bz;Lcom/google/android/gms/internal/v;)V

    const-string v1, "/open"

    invoke-virtual {p0, v1, v0}, Lcom/google/android/gms/internal/gw;->a(Ljava/lang/String;Lcom/google/android/gms/internal/by;)V

    const-string v0, "/touch"

    sget-object v1, Lcom/google/android/gms/internal/bx;->pH:Lcom/google/android/gms/internal/by;

    invoke-virtual {p0, v0, v1}, Lcom/google/android/gms/internal/gw;->a(Ljava/lang/String;Lcom/google/android/gms/internal/by;)V

    const-string v0, "/video"

    sget-object v1, Lcom/google/android/gms/internal/bx;->pI:Lcom/google/android/gms/internal/by;

    invoke-virtual {p0, v0, v1}, Lcom/google/android/gms/internal/gw;->a(Ljava/lang/String;Lcom/google/android/gms/internal/by;)V

    new-instance v0, Lcom/google/android/gms/internal/cc;

    invoke-direct {v0}, Lcom/google/android/gms/internal/cc;-><init>()V

    const-string v1, "/mraid"

    invoke-virtual {p0, v1, v0}, Lcom/google/android/gms/internal/gw;->a(Ljava/lang/String;Lcom/google/android/gms/internal/by;)V

    iput-object p1, p0, Lcom/google/android/gms/internal/gw;->wQ:Lcom/google/android/gms/internal/t;

    iput-object p2, p0, Lcom/google/android/gms/internal/gw;->wR:Lcom/google/android/gms/internal/dn;

    iput-object p3, p0, Lcom/google/android/gms/internal/gw;->pz:Lcom/google/android/gms/internal/bw;

    iput-object p6, p0, Lcom/google/android/gms/internal/gw;->pL:Lcom/google/android/gms/internal/bz;

    iput-object p4, p0, Lcom/google/android/gms/internal/gw;->wU:Lcom/google/android/gms/internal/dq;

    iput-object p7, p0, Lcom/google/android/gms/internal/gw;->pM:Lcom/google/android/gms/internal/v;

    invoke-virtual {p0, p5}, Lcom/google/android/gms/internal/gw;->y(Z)V

    return-void
.end method

.method public final a(Ljava/lang/String;Lcom/google/android/gms/internal/by;)V
    .locals 0

    iget-object p0, p0, Lcom/google/android/gms/internal/gw;->wP:Ljava/util/HashMap;

    invoke-virtual {p0, p1, p2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    return-void
.end method

.method public final a(ZI)V
    .locals 10

    iget-object v0, p0, Lcom/google/android/gms/internal/gw;->md:Lcom/google/android/gms/internal/gv;

    invoke-virtual {v0}, Lcom/google/android/gms/internal/gv;->dy()Z

    move-result v0

    new-instance v9, Lcom/google/android/gms/internal/dm;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/google/android/gms/internal/gw;->md:Lcom/google/android/gms/internal/gv;

    invoke-virtual {v0}, Lcom/google/android/gms/internal/gv;->Y()Lcom/google/android/gms/internal/ay;

    move-result-object v0

    iget-boolean v0, v0, Lcom/google/android/gms/internal/ay;->og:Z

    if-nez v0, :cond_0

    const/4 v0, 0x0

    goto :goto_0

    :cond_0
    iget-object v0, p0, Lcom/google/android/gms/internal/gw;->wQ:Lcom/google/android/gms/internal/t;

    :goto_0
    move-object v2, v0

    iget-object v3, p0, Lcom/google/android/gms/internal/gw;->wR:Lcom/google/android/gms/internal/dn;

    iget-object v4, p0, Lcom/google/android/gms/internal/gw;->wU:Lcom/google/android/gms/internal/dq;

    iget-object v5, p0, Lcom/google/android/gms/internal/gw;->md:Lcom/google/android/gms/internal/gv;

    invoke-virtual {v5}, Lcom/google/android/gms/internal/gv;->dx()Lcom/google/android/gms/internal/gt;

    move-result-object v8

    move-object v1, v9

    move v6, p1

    move v7, p2

    invoke-direct/range {v1 .. v8}, Lcom/google/android/gms/internal/dm;-><init>(Lcom/google/android/gms/internal/t;Lcom/google/android/gms/internal/dn;Lcom/google/android/gms/internal/dq;Lcom/google/android/gms/internal/gv;ZILcom/google/android/gms/internal/gt;)V

    invoke-virtual {p0, v9}, Lcom/google/android/gms/internal/gw;->a(Lcom/google/android/gms/internal/dm;)V

    return-void
.end method

.method public final a(ZILjava/lang/String;)V
    .locals 14

    move-object v0, p0

    iget-object v1, v0, Lcom/google/android/gms/internal/gw;->md:Lcom/google/android/gms/internal/gv;

    invoke-virtual {v1}, Lcom/google/android/gms/internal/gv;->dy()Z

    move-result v1

    new-instance v13, Lcom/google/android/gms/internal/dm;

    const/4 v2, 0x0

    if-eqz v1, :cond_0

    iget-object v3, v0, Lcom/google/android/gms/internal/gw;->md:Lcom/google/android/gms/internal/gv;

    invoke-virtual {v3}, Lcom/google/android/gms/internal/gv;->Y()Lcom/google/android/gms/internal/ay;

    move-result-object v3

    iget-boolean v3, v3, Lcom/google/android/gms/internal/ay;->og:Z

    if-nez v3, :cond_0

    move-object v3, v2

    goto :goto_0

    :cond_0
    iget-object v3, v0, Lcom/google/android/gms/internal/gw;->wQ:Lcom/google/android/gms/internal/t;

    :goto_0
    if-eqz v1, :cond_1

    move-object v4, v2

    goto :goto_1

    :cond_1
    iget-object v1, v0, Lcom/google/android/gms/internal/gw;->wR:Lcom/google/android/gms/internal/dn;

    move-object v4, v1

    :goto_1
    iget-object v5, v0, Lcom/google/android/gms/internal/gw;->pz:Lcom/google/android/gms/internal/bw;

    iget-object v6, v0, Lcom/google/android/gms/internal/gw;->wU:Lcom/google/android/gms/internal/dq;

    iget-object v7, v0, Lcom/google/android/gms/internal/gw;->md:Lcom/google/android/gms/internal/gv;

    invoke-virtual {v7}, Lcom/google/android/gms/internal/gv;->dx()Lcom/google/android/gms/internal/gt;

    move-result-object v11

    iget-object v12, v0, Lcom/google/android/gms/internal/gw;->pL:Lcom/google/android/gms/internal/bz;

    move-object v2, v13

    move v8, p1

    move/from16 v9, p2

    move-object/from16 v10, p3

    invoke-direct/range {v2 .. v12}, Lcom/google/android/gms/internal/dm;-><init>(Lcom/google/android/gms/internal/t;Lcom/google/android/gms/internal/dn;Lcom/google/android/gms/internal/bw;Lcom/google/android/gms/internal/dq;Lcom/google/android/gms/internal/gv;ZILjava/lang/String;Lcom/google/android/gms/internal/gt;Lcom/google/android/gms/internal/bz;)V

    invoke-virtual {p0, v13}, Lcom/google/android/gms/internal/gw;->a(Lcom/google/android/gms/internal/dm;)V

    return-void
.end method

.method public final a(ZILjava/lang/String;Ljava/lang/String;)V
    .locals 15

    move-object v0, p0

    iget-object v1, v0, Lcom/google/android/gms/internal/gw;->md:Lcom/google/android/gms/internal/gv;

    invoke-virtual {v1}, Lcom/google/android/gms/internal/gv;->dy()Z

    move-result v1

    new-instance v14, Lcom/google/android/gms/internal/dm;

    const/4 v2, 0x0

    if-eqz v1, :cond_0

    iget-object v3, v0, Lcom/google/android/gms/internal/gw;->md:Lcom/google/android/gms/internal/gv;

    invoke-virtual {v3}, Lcom/google/android/gms/internal/gv;->Y()Lcom/google/android/gms/internal/ay;

    move-result-object v3

    iget-boolean v3, v3, Lcom/google/android/gms/internal/ay;->og:Z

    if-nez v3, :cond_0

    move-object v3, v2

    goto :goto_0

    :cond_0
    iget-object v3, v0, Lcom/google/android/gms/internal/gw;->wQ:Lcom/google/android/gms/internal/t;

    :goto_0
    if-eqz v1, :cond_1

    move-object v4, v2

    goto :goto_1

    :cond_1
    iget-object v1, v0, Lcom/google/android/gms/internal/gw;->wR:Lcom/google/android/gms/internal/dn;

    move-object v4, v1

    :goto_1
    iget-object v5, v0, Lcom/google/android/gms/internal/gw;->pz:Lcom/google/android/gms/internal/bw;

    iget-object v6, v0, Lcom/google/android/gms/internal/gw;->wU:Lcom/google/android/gms/internal/dq;

    iget-object v7, v0, Lcom/google/android/gms/internal/gw;->md:Lcom/google/android/gms/internal/gv;

    invoke-virtual {v7}, Lcom/google/android/gms/internal/gv;->dx()Lcom/google/android/gms/internal/gt;

    move-result-object v12

    iget-object v13, v0, Lcom/google/android/gms/internal/gw;->pL:Lcom/google/android/gms/internal/bz;

    move-object v2, v14

    move/from16 v8, p1

    move/from16 v9, p2

    move-object/from16 v10, p3

    move-object/from16 v11, p4

    invoke-direct/range {v2 .. v13}, Lcom/google/android/gms/internal/dm;-><init>(Lcom/google/android/gms/internal/t;Lcom/google/android/gms/internal/dn;Lcom/google/android/gms/internal/bw;Lcom/google/android/gms/internal/dq;Lcom/google/android/gms/internal/gv;ZILjava/lang/String;Ljava/lang/String;Lcom/google/android/gms/internal/gt;Lcom/google/android/gms/internal/bz;)V

    invoke-virtual {p0, v14}, Lcom/google/android/gms/internal/gw;->a(Lcom/google/android/gms/internal/dm;)V

    return-void
.end method

.method public final bX()V
    .locals 4

    iget-object v0, p0, Lcom/google/android/gms/internal/gw;->mw:Ljava/lang/Object;

    monitor-enter v0

    const/4 v1, 0x0

    :try_start_0
    iput-boolean v1, p0, Lcom/google/android/gms/internal/gw;->wS:Z

    const/4 v1, 0x1

    iput-boolean v1, p0, Lcom/google/android/gms/internal/gw;->wT:Z

    iget-object v1, p0, Lcom/google/android/gms/internal/gw;->md:Lcom/google/android/gms/internal/gv;

    invoke-virtual {v1}, Lcom/google/android/gms/internal/gv;->dt()Lcom/google/android/gms/internal/dk;

    move-result-object v1

    if-eqz v1, :cond_1

    invoke-static {}, Lcom/google/android/gms/internal/gr;->ds()Z

    move-result v2

    if-nez v2, :cond_0

    sget-object v2, Lcom/google/android/gms/internal/gr;->wC:Landroid/os/Handler;

    new-instance v3, Lcom/google/android/gms/internal/gw$1;

    invoke-direct {v3, p0, v1}, Lcom/google/android/gms/internal/gw$1;-><init>(Lcom/google/android/gms/internal/gw;Lcom/google/android/gms/internal/dk;)V

    invoke-virtual {v2, v3}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    goto :goto_0

    :cond_0
    invoke-virtual {v1}, Lcom/google/android/gms/internal/dk;->bX()V

    :cond_1
    :goto_0
    monitor-exit v0

    return-void

    :catchall_0
    move-exception p0

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw p0
.end method

.method public dD()Lcom/google/android/gms/internal/v;
    .locals 0

    iget-object p0, p0, Lcom/google/android/gms/internal/gw;->pM:Lcom/google/android/gms/internal/v;

    return-object p0
.end method

.method public dE()Z
    .locals 1

    iget-object v0, p0, Lcom/google/android/gms/internal/gw;->mw:Ljava/lang/Object;

    monitor-enter v0

    :try_start_0
    iget-boolean p0, p0, Lcom/google/android/gms/internal/gw;->wT:Z

    monitor-exit v0

    return p0

    :catchall_0
    move-exception p0

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw p0
.end method

.method public dF()V
    .locals 1

    invoke-virtual {p0}, Lcom/google/android/gms/internal/gw;->dE()Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object p0, p0, Lcom/google/android/gms/internal/gw;->wV:Lcom/google/android/gms/internal/dg;

    invoke-virtual {p0}, Lcom/google/android/gms/internal/dg;->bP()V

    :cond_0
    return-void
.end method

.method public final onLoadResource(Landroid/webkit/WebView;Ljava/lang/String;)V
    .locals 1

    new-instance p1, Ljava/lang/StringBuilder;

    const-string v0, "Loading resource: "

    invoke-direct {p1, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {p1}, Lcom/google/android/gms/internal/gs;->V(Ljava/lang/String;)V

    invoke-static {p2}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object p1

    const-string p2, "gmsg"

    invoke-virtual {p1}, Landroid/net/Uri;->getScheme()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p2, v0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result p2

    if-eqz p2, :cond_0

    const-string p2, "mobileads.google.com"

    invoke-virtual {p1}, Landroid/net/Uri;->getHost()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p2, v0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result p2

    if-eqz p2, :cond_0

    invoke-direct {p0, p1}, Lcom/google/android/gms/internal/gw;->e(Landroid/net/Uri;)V

    :cond_0
    return-void
.end method

.method public final onPageFinished(Landroid/webkit/WebView;Ljava/lang/String;)V
    .locals 0

    iget-object p1, p0, Lcom/google/android/gms/internal/gw;->tg:Lcom/google/android/gms/internal/gw$a;

    if-eqz p1, :cond_0

    iget-object p2, p0, Lcom/google/android/gms/internal/gw;->md:Lcom/google/android/gms/internal/gv;

    invoke-interface {p1, p2}, Lcom/google/android/gms/internal/gw$a;->a(Lcom/google/android/gms/internal/gv;)V

    const/4 p1, 0x0

    iput-object p1, p0, Lcom/google/android/gms/internal/gw;->tg:Lcom/google/android/gms/internal/gw$a;

    :cond_0
    return-void
.end method

.method public final reset()V
    .locals 3

    iget-object v0, p0, Lcom/google/android/gms/internal/gw;->mw:Ljava/lang/Object;

    monitor-enter v0

    :try_start_0
    iget-object v1, p0, Lcom/google/android/gms/internal/gw;->wP:Ljava/util/HashMap;

    invoke-virtual {v1}, Ljava/util/HashMap;->clear()V

    const/4 v1, 0x0

    iput-object v1, p0, Lcom/google/android/gms/internal/gw;->wQ:Lcom/google/android/gms/internal/t;

    iput-object v1, p0, Lcom/google/android/gms/internal/gw;->wR:Lcom/google/android/gms/internal/dn;

    iput-object v1, p0, Lcom/google/android/gms/internal/gw;->tg:Lcom/google/android/gms/internal/gw$a;

    iput-object v1, p0, Lcom/google/android/gms/internal/gw;->pz:Lcom/google/android/gms/internal/bw;

    const/4 v2, 0x0

    iput-boolean v2, p0, Lcom/google/android/gms/internal/gw;->wS:Z

    iput-boolean v2, p0, Lcom/google/android/gms/internal/gw;->wT:Z

    iput-object v1, p0, Lcom/google/android/gms/internal/gw;->pL:Lcom/google/android/gms/internal/bz;

    iput-object v1, p0, Lcom/google/android/gms/internal/gw;->wU:Lcom/google/android/gms/internal/dq;

    monitor-exit v0

    return-void

    :catchall_0
    move-exception p0

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw p0
.end method

.method public final shouldOverrideUrlLoading(Landroid/webkit/WebView;Ljava/lang/String;)Z
    .locals 8

    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "AdWebView shouldOverrideUrlLoading: "

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/google/android/gms/internal/gs;->V(Ljava/lang/String;)V

    invoke-static {p2}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v0

    const-string v1, "gmsg"

    invoke-virtual {v0}, Landroid/net/Uri;->getScheme()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_0

    const-string v1, "mobileads.google.com"

    invoke-virtual {v0}, Landroid/net/Uri;->getHost()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_0

    invoke-direct {p0, v0}, Lcom/google/android/gms/internal/gw;->e(Landroid/net/Uri;)V

    goto/16 :goto_2

    :cond_0
    iget-boolean v1, p0, Lcom/google/android/gms/internal/gw;->wS:Z

    if-eqz v1, :cond_1

    iget-object v1, p0, Lcom/google/android/gms/internal/gw;->md:Lcom/google/android/gms/internal/gv;

    if-ne p1, v1, :cond_1

    invoke-static {v0}, Lcom/google/android/gms/internal/gw;->d(Landroid/net/Uri;)Z

    move-result v1

    if-eqz v1, :cond_1

    invoke-super {p0, p1, p2}, Landroid/webkit/WebViewClient;->shouldOverrideUrlLoading(Landroid/webkit/WebView;Ljava/lang/String;)Z

    move-result p0

    return p0

    :cond_1
    iget-object p1, p0, Lcom/google/android/gms/internal/gw;->md:Lcom/google/android/gms/internal/gv;

    invoke-virtual {p1}, Lcom/google/android/gms/internal/gv;->willNotDraw()Z

    move-result p1

    if-nez p1, :cond_5

    :try_start_0
    iget-object p1, p0, Lcom/google/android/gms/internal/gw;->md:Lcom/google/android/gms/internal/gv;

    invoke-virtual {p1}, Lcom/google/android/gms/internal/gv;->dw()Lcom/google/android/gms/internal/k;

    move-result-object p1

    if-eqz p1, :cond_2

    invoke-virtual {p1, v0}, Lcom/google/android/gms/internal/k;->b(Landroid/net/Uri;)Z

    move-result v1

    if-eqz v1, :cond_2

    iget-object v1, p0, Lcom/google/android/gms/internal/gw;->md:Lcom/google/android/gms/internal/gv;

    invoke-virtual {v1}, Lcom/google/android/gms/internal/gv;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-virtual {p1, v0, v1}, Lcom/google/android/gms/internal/k;->a(Landroid/net/Uri;Landroid/content/Context;)Landroid/net/Uri;

    move-result-object p1
    :try_end_0
    .catch Lcom/google/android/gms/internal/l; {:try_start_0 .. :try_end_0} :catch_0

    move-object v0, p1

    goto :goto_0

    :catch_0
    new-instance p1, Ljava/lang/StringBuilder;

    const-string v1, "Unable to append parameter to URL: "

    invoke-direct {p1, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {p1}, Lcom/google/android/gms/internal/gs;->W(Ljava/lang/String;)V

    :cond_2
    :goto_0
    iget-object p1, p0, Lcom/google/android/gms/internal/gw;->pM:Lcom/google/android/gms/internal/v;

    if-eqz p1, :cond_4

    invoke-virtual {p1}, Lcom/google/android/gms/internal/v;->av()Z

    move-result p1

    if-eqz p1, :cond_3

    goto :goto_1

    :cond_3
    iget-object p0, p0, Lcom/google/android/gms/internal/gw;->pM:Lcom/google/android/gms/internal/v;

    invoke-virtual {p0, p2}, Lcom/google/android/gms/internal/v;->d(Ljava/lang/String;)V

    goto :goto_2

    :cond_4
    :goto_1
    new-instance p1, Lcom/google/android/gms/internal/dj;

    invoke-virtual {v0}, Landroid/net/Uri;->toString()Ljava/lang/String;

    move-result-object v2

    const/4 v6, 0x0

    const/4 v7, 0x0

    const-string v1, "android.intent.action.VIEW"

    const/4 v3, 0x0

    const/4 v4, 0x0

    const/4 v5, 0x0

    move-object v0, p1

    invoke-direct/range {v0 .. v7}, Lcom/google/android/gms/internal/dj;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {p0, p1}, Lcom/google/android/gms/internal/gw;->a(Lcom/google/android/gms/internal/dj;)V

    goto :goto_2

    :cond_5
    new-instance p0, Ljava/lang/StringBuilder;

    const-string p1, "AdWebView unable to handle URL: "

    invoke-direct {p0, p1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-static {p0}, Lcom/google/android/gms/internal/gs;->W(Ljava/lang/String;)V

    :goto_2
    const/4 p0, 0x1

    return p0
.end method

.method public final y(Z)V
    .locals 0

    iput-boolean p1, p0, Lcom/google/android/gms/internal/gw;->wS:Z

    return-void
.end method
