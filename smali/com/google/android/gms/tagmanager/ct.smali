.class Lcom/google/android/gms/tagmanager/ct;
.super Ljava/lang/Object;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/google/android/gms/tagmanager/ct$b;,
        Lcom/google/android/gms/tagmanager/ct$a;,
        Lcom/google/android/gms/tagmanager/ct$c;
    }
.end annotation


# static fields
.field private static final aqS:Lcom/google/android/gms/tagmanager/bz;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/google/android/gms/tagmanager/bz<",
            "Lcom/google/android/gms/internal/d$a;",
            ">;"
        }
    .end annotation
.end field


# instance fields
.field private final aod:Lcom/google/android/gms/tagmanager/DataLayer;

.field private final aqT:Lcom/google/android/gms/tagmanager/cr$c;

.field private final aqU:Lcom/google/android/gms/tagmanager/ag;

.field private final aqV:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Lcom/google/android/gms/tagmanager/aj;",
            ">;"
        }
    .end annotation
.end field

.field private final aqW:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Lcom/google/android/gms/tagmanager/aj;",
            ">;"
        }
    .end annotation
.end field

.field private final aqX:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Lcom/google/android/gms/tagmanager/aj;",
            ">;"
        }
    .end annotation
.end field

.field private final aqY:Lcom/google/android/gms/tagmanager/k;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/google/android/gms/tagmanager/k<",
            "Lcom/google/android/gms/tagmanager/cr$a;",
            "Lcom/google/android/gms/tagmanager/bz<",
            "Lcom/google/android/gms/internal/d$a;",
            ">;>;"
        }
    .end annotation
.end field

.field private final aqZ:Lcom/google/android/gms/tagmanager/k;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/google/android/gms/tagmanager/k<",
            "Ljava/lang/String;",
            "Lcom/google/android/gms/tagmanager/ct$b;",
            ">;"
        }
    .end annotation
.end field

.field private final ara:Ljava/util/Set;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Set<",
            "Lcom/google/android/gms/tagmanager/cr$e;",
            ">;"
        }
    .end annotation
.end field

.field private final arb:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Lcom/google/android/gms/tagmanager/ct$c;",
            ">;"
        }
    .end annotation
.end field

.field private volatile arc:Ljava/lang/String;

.field private ard:I


# direct methods
.method static constructor <clinit>()V
    .locals 3

    new-instance v0, Lcom/google/android/gms/tagmanager/bz;

    invoke-static {}, Lcom/google/android/gms/tagmanager/di;->pK()Lcom/google/android/gms/internal/d$a;

    move-result-object v1

    const/4 v2, 0x1

    invoke-direct {v0, v1, v2}, Lcom/google/android/gms/tagmanager/bz;-><init>(Ljava/lang/Object;Z)V

    sput-object v0, Lcom/google/android/gms/tagmanager/ct;->aqS:Lcom/google/android/gms/tagmanager/bz;

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Lcom/google/android/gms/tagmanager/cr$c;Lcom/google/android/gms/tagmanager/DataLayer;Lcom/google/android/gms/tagmanager/s$a;Lcom/google/android/gms/tagmanager/s$a;Lcom/google/android/gms/tagmanager/ag;)V
    .locals 4

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    if-eqz p2, :cond_9

    iput-object p2, p0, Lcom/google/android/gms/tagmanager/ct;->aqT:Lcom/google/android/gms/tagmanager/cr$c;

    new-instance v0, Ljava/util/HashSet;

    invoke-virtual {p2}, Lcom/google/android/gms/tagmanager/cr$c;->oY()Ljava/util/List;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/util/HashSet;-><init>(Ljava/util/Collection;)V

    iput-object v0, p0, Lcom/google/android/gms/tagmanager/ct;->ara:Ljava/util/Set;

    iput-object p3, p0, Lcom/google/android/gms/tagmanager/ct;->aod:Lcom/google/android/gms/tagmanager/DataLayer;

    iput-object p6, p0, Lcom/google/android/gms/tagmanager/ct;->aqU:Lcom/google/android/gms/tagmanager/ag;

    new-instance v1, Lcom/google/android/gms/tagmanager/ct$1;

    invoke-direct {v1, p0}, Lcom/google/android/gms/tagmanager/ct$1;-><init>(Lcom/google/android/gms/tagmanager/ct;)V

    new-instance v2, Lcom/google/android/gms/tagmanager/l;

    invoke-direct {v2}, Lcom/google/android/gms/tagmanager/l;-><init>()V

    const/high16 v3, 0x100000

    invoke-virtual {v2, v3, v1}, Lcom/google/android/gms/tagmanager/l;->a(ILcom/google/android/gms/tagmanager/l$a;)Lcom/google/android/gms/tagmanager/k;

    move-result-object v1

    iput-object v1, p0, Lcom/google/android/gms/tagmanager/ct;->aqY:Lcom/google/android/gms/tagmanager/k;

    new-instance v1, Lcom/google/android/gms/tagmanager/ct$2;

    invoke-direct {v1, p0}, Lcom/google/android/gms/tagmanager/ct$2;-><init>(Lcom/google/android/gms/tagmanager/ct;)V

    new-instance v2, Lcom/google/android/gms/tagmanager/l;

    invoke-direct {v2}, Lcom/google/android/gms/tagmanager/l;-><init>()V

    invoke-virtual {v2, v3, v1}, Lcom/google/android/gms/tagmanager/l;->a(ILcom/google/android/gms/tagmanager/l$a;)Lcom/google/android/gms/tagmanager/k;

    move-result-object v1

    iput-object v1, p0, Lcom/google/android/gms/tagmanager/ct;->aqZ:Lcom/google/android/gms/tagmanager/k;

    new-instance v1, Ljava/util/HashMap;

    invoke-direct {v1}, Ljava/util/HashMap;-><init>()V

    iput-object v1, p0, Lcom/google/android/gms/tagmanager/ct;->aqV:Ljava/util/Map;

    new-instance v1, Lcom/google/android/gms/tagmanager/i;

    invoke-direct {v1, p1}, Lcom/google/android/gms/tagmanager/i;-><init>(Landroid/content/Context;)V

    invoke-virtual {p0, v1}, Lcom/google/android/gms/tagmanager/ct;->b(Lcom/google/android/gms/tagmanager/aj;)V

    new-instance v1, Lcom/google/android/gms/tagmanager/s;

    invoke-direct {v1, p5}, Lcom/google/android/gms/tagmanager/s;-><init>(Lcom/google/android/gms/tagmanager/s$a;)V

    invoke-virtual {p0, v1}, Lcom/google/android/gms/tagmanager/ct;->b(Lcom/google/android/gms/tagmanager/aj;)V

    new-instance p5, Lcom/google/android/gms/tagmanager/w;

    invoke-direct {p5, p3}, Lcom/google/android/gms/tagmanager/w;-><init>(Lcom/google/android/gms/tagmanager/DataLayer;)V

    invoke-virtual {p0, p5}, Lcom/google/android/gms/tagmanager/ct;->b(Lcom/google/android/gms/tagmanager/aj;)V

    new-instance p5, Lcom/google/android/gms/tagmanager/dj;

    invoke-direct {p5, p1, p3}, Lcom/google/android/gms/tagmanager/dj;-><init>(Landroid/content/Context;Lcom/google/android/gms/tagmanager/DataLayer;)V

    invoke-virtual {p0, p5}, Lcom/google/android/gms/tagmanager/ct;->b(Lcom/google/android/gms/tagmanager/aj;)V

    new-instance p5, Ljava/util/HashMap;

    invoke-direct {p5}, Ljava/util/HashMap;-><init>()V

    iput-object p5, p0, Lcom/google/android/gms/tagmanager/ct;->aqW:Ljava/util/Map;

    new-instance p5, Lcom/google/android/gms/tagmanager/q;

    invoke-direct {p5}, Lcom/google/android/gms/tagmanager/q;-><init>()V

    invoke-virtual {p0, p5}, Lcom/google/android/gms/tagmanager/ct;->c(Lcom/google/android/gms/tagmanager/aj;)V

    new-instance p5, Lcom/google/android/gms/tagmanager/ad;

    invoke-direct {p5}, Lcom/google/android/gms/tagmanager/ad;-><init>()V

    invoke-virtual {p0, p5}, Lcom/google/android/gms/tagmanager/ct;->c(Lcom/google/android/gms/tagmanager/aj;)V

    new-instance p5, Lcom/google/android/gms/tagmanager/ae;

    invoke-direct {p5}, Lcom/google/android/gms/tagmanager/ae;-><init>()V

    invoke-virtual {p0, p5}, Lcom/google/android/gms/tagmanager/ct;->c(Lcom/google/android/gms/tagmanager/aj;)V

    new-instance p5, Lcom/google/android/gms/tagmanager/al;

    invoke-direct {p5}, Lcom/google/android/gms/tagmanager/al;-><init>()V

    invoke-virtual {p0, p5}, Lcom/google/android/gms/tagmanager/ct;->c(Lcom/google/android/gms/tagmanager/aj;)V

    new-instance p5, Lcom/google/android/gms/tagmanager/am;

    invoke-direct {p5}, Lcom/google/android/gms/tagmanager/am;-><init>()V

    invoke-virtual {p0, p5}, Lcom/google/android/gms/tagmanager/ct;->c(Lcom/google/android/gms/tagmanager/aj;)V

    new-instance p5, Lcom/google/android/gms/tagmanager/bd;

    invoke-direct {p5}, Lcom/google/android/gms/tagmanager/bd;-><init>()V

    invoke-virtual {p0, p5}, Lcom/google/android/gms/tagmanager/ct;->c(Lcom/google/android/gms/tagmanager/aj;)V

    new-instance p5, Lcom/google/android/gms/tagmanager/be;

    invoke-direct {p5}, Lcom/google/android/gms/tagmanager/be;-><init>()V

    invoke-virtual {p0, p5}, Lcom/google/android/gms/tagmanager/ct;->c(Lcom/google/android/gms/tagmanager/aj;)V

    new-instance p5, Lcom/google/android/gms/tagmanager/ci;

    invoke-direct {p5}, Lcom/google/android/gms/tagmanager/ci;-><init>()V

    invoke-virtual {p0, p5}, Lcom/google/android/gms/tagmanager/ct;->c(Lcom/google/android/gms/tagmanager/aj;)V

    new-instance p5, Lcom/google/android/gms/tagmanager/dc;

    invoke-direct {p5}, Lcom/google/android/gms/tagmanager/dc;-><init>()V

    invoke-virtual {p0, p5}, Lcom/google/android/gms/tagmanager/ct;->c(Lcom/google/android/gms/tagmanager/aj;)V

    new-instance p5, Ljava/util/HashMap;

    invoke-direct {p5}, Ljava/util/HashMap;-><init>()V

    iput-object p5, p0, Lcom/google/android/gms/tagmanager/ct;->aqX:Ljava/util/Map;

    new-instance p5, Lcom/google/android/gms/tagmanager/b;

    invoke-direct {p5, p1}, Lcom/google/android/gms/tagmanager/b;-><init>(Landroid/content/Context;)V

    invoke-virtual {p0, p5}, Lcom/google/android/gms/tagmanager/ct;->a(Lcom/google/android/gms/tagmanager/aj;)V

    new-instance p5, Lcom/google/android/gms/tagmanager/c;

    invoke-direct {p5, p1}, Lcom/google/android/gms/tagmanager/c;-><init>(Landroid/content/Context;)V

    invoke-virtual {p0, p5}, Lcom/google/android/gms/tagmanager/ct;->a(Lcom/google/android/gms/tagmanager/aj;)V

    new-instance p5, Lcom/google/android/gms/tagmanager/e;

    invoke-direct {p5, p1}, Lcom/google/android/gms/tagmanager/e;-><init>(Landroid/content/Context;)V

    invoke-virtual {p0, p5}, Lcom/google/android/gms/tagmanager/ct;->a(Lcom/google/android/gms/tagmanager/aj;)V

    new-instance p5, Lcom/google/android/gms/tagmanager/f;

    invoke-direct {p5, p1}, Lcom/google/android/gms/tagmanager/f;-><init>(Landroid/content/Context;)V

    invoke-virtual {p0, p5}, Lcom/google/android/gms/tagmanager/ct;->a(Lcom/google/android/gms/tagmanager/aj;)V

    new-instance p5, Lcom/google/android/gms/tagmanager/g;

    invoke-direct {p5, p1}, Lcom/google/android/gms/tagmanager/g;-><init>(Landroid/content/Context;)V

    invoke-virtual {p0, p5}, Lcom/google/android/gms/tagmanager/ct;->a(Lcom/google/android/gms/tagmanager/aj;)V

    new-instance p5, Lcom/google/android/gms/tagmanager/h;

    invoke-direct {p5, p1}, Lcom/google/android/gms/tagmanager/h;-><init>(Landroid/content/Context;)V

    invoke-virtual {p0, p5}, Lcom/google/android/gms/tagmanager/ct;->a(Lcom/google/android/gms/tagmanager/aj;)V

    new-instance p5, Lcom/google/android/gms/tagmanager/m;

    invoke-direct {p5}, Lcom/google/android/gms/tagmanager/m;-><init>()V

    invoke-virtual {p0, p5}, Lcom/google/android/gms/tagmanager/ct;->a(Lcom/google/android/gms/tagmanager/aj;)V

    new-instance p5, Lcom/google/android/gms/tagmanager/p;

    invoke-virtual {p2}, Lcom/google/android/gms/tagmanager/cr$c;->getVersion()Ljava/lang/String;

    move-result-object p2

    invoke-direct {p5, p2}, Lcom/google/android/gms/tagmanager/p;-><init>(Ljava/lang/String;)V

    invoke-virtual {p0, p5}, Lcom/google/android/gms/tagmanager/ct;->a(Lcom/google/android/gms/tagmanager/aj;)V

    new-instance p2, Lcom/google/android/gms/tagmanager/s;

    invoke-direct {p2, p4}, Lcom/google/android/gms/tagmanager/s;-><init>(Lcom/google/android/gms/tagmanager/s$a;)V

    invoke-virtual {p0, p2}, Lcom/google/android/gms/tagmanager/ct;->a(Lcom/google/android/gms/tagmanager/aj;)V

    new-instance p2, Lcom/google/android/gms/tagmanager/u;

    invoke-direct {p2, p3}, Lcom/google/android/gms/tagmanager/u;-><init>(Lcom/google/android/gms/tagmanager/DataLayer;)V

    invoke-virtual {p0, p2}, Lcom/google/android/gms/tagmanager/ct;->a(Lcom/google/android/gms/tagmanager/aj;)V

    new-instance p2, Lcom/google/android/gms/tagmanager/z;

    invoke-direct {p2, p1}, Lcom/google/android/gms/tagmanager/z;-><init>(Landroid/content/Context;)V

    invoke-virtual {p0, p2}, Lcom/google/android/gms/tagmanager/ct;->a(Lcom/google/android/gms/tagmanager/aj;)V

    new-instance p2, Lcom/google/android/gms/tagmanager/aa;

    invoke-direct {p2}, Lcom/google/android/gms/tagmanager/aa;-><init>()V

    invoke-virtual {p0, p2}, Lcom/google/android/gms/tagmanager/ct;->a(Lcom/google/android/gms/tagmanager/aj;)V

    new-instance p2, Lcom/google/android/gms/tagmanager/ac;

    invoke-direct {p2}, Lcom/google/android/gms/tagmanager/ac;-><init>()V

    invoke-virtual {p0, p2}, Lcom/google/android/gms/tagmanager/ct;->a(Lcom/google/android/gms/tagmanager/aj;)V

    new-instance p2, Lcom/google/android/gms/tagmanager/ah;

    invoke-direct {p2, p0}, Lcom/google/android/gms/tagmanager/ah;-><init>(Lcom/google/android/gms/tagmanager/ct;)V

    invoke-virtual {p0, p2}, Lcom/google/android/gms/tagmanager/ct;->a(Lcom/google/android/gms/tagmanager/aj;)V

    new-instance p2, Lcom/google/android/gms/tagmanager/an;

    invoke-direct {p2}, Lcom/google/android/gms/tagmanager/an;-><init>()V

    invoke-virtual {p0, p2}, Lcom/google/android/gms/tagmanager/ct;->a(Lcom/google/android/gms/tagmanager/aj;)V

    new-instance p2, Lcom/google/android/gms/tagmanager/ao;

    invoke-direct {p2}, Lcom/google/android/gms/tagmanager/ao;-><init>()V

    invoke-virtual {p0, p2}, Lcom/google/android/gms/tagmanager/ct;->a(Lcom/google/android/gms/tagmanager/aj;)V

    new-instance p2, Lcom/google/android/gms/tagmanager/ax;

    invoke-direct {p2, p1}, Lcom/google/android/gms/tagmanager/ax;-><init>(Landroid/content/Context;)V

    invoke-virtual {p0, p2}, Lcom/google/android/gms/tagmanager/ct;->a(Lcom/google/android/gms/tagmanager/aj;)V

    new-instance p2, Lcom/google/android/gms/tagmanager/az;

    invoke-direct {p2}, Lcom/google/android/gms/tagmanager/az;-><init>()V

    invoke-virtual {p0, p2}, Lcom/google/android/gms/tagmanager/ct;->a(Lcom/google/android/gms/tagmanager/aj;)V

    new-instance p2, Lcom/google/android/gms/tagmanager/bc;

    invoke-direct {p2}, Lcom/google/android/gms/tagmanager/bc;-><init>()V

    invoke-virtual {p0, p2}, Lcom/google/android/gms/tagmanager/ct;->a(Lcom/google/android/gms/tagmanager/aj;)V

    new-instance p2, Lcom/google/android/gms/tagmanager/bj;

    invoke-direct {p2}, Lcom/google/android/gms/tagmanager/bj;-><init>()V

    invoke-virtual {p0, p2}, Lcom/google/android/gms/tagmanager/ct;->a(Lcom/google/android/gms/tagmanager/aj;)V

    new-instance p2, Lcom/google/android/gms/tagmanager/bl;

    invoke-direct {p2, p1}, Lcom/google/android/gms/tagmanager/bl;-><init>(Landroid/content/Context;)V

    invoke-virtual {p0, p2}, Lcom/google/android/gms/tagmanager/ct;->a(Lcom/google/android/gms/tagmanager/aj;)V

    new-instance p2, Lcom/google/android/gms/tagmanager/ca;

    invoke-direct {p2}, Lcom/google/android/gms/tagmanager/ca;-><init>()V

    invoke-virtual {p0, p2}, Lcom/google/android/gms/tagmanager/ct;->a(Lcom/google/android/gms/tagmanager/aj;)V

    new-instance p2, Lcom/google/android/gms/tagmanager/cc;

    invoke-direct {p2}, Lcom/google/android/gms/tagmanager/cc;-><init>()V

    invoke-virtual {p0, p2}, Lcom/google/android/gms/tagmanager/ct;->a(Lcom/google/android/gms/tagmanager/aj;)V

    new-instance p2, Lcom/google/android/gms/tagmanager/cf;

    invoke-direct {p2}, Lcom/google/android/gms/tagmanager/cf;-><init>()V

    invoke-virtual {p0, p2}, Lcom/google/android/gms/tagmanager/ct;->a(Lcom/google/android/gms/tagmanager/aj;)V

    new-instance p2, Lcom/google/android/gms/tagmanager/ch;

    invoke-direct {p2}, Lcom/google/android/gms/tagmanager/ch;-><init>()V

    invoke-virtual {p0, p2}, Lcom/google/android/gms/tagmanager/ct;->a(Lcom/google/android/gms/tagmanager/aj;)V

    new-instance p2, Lcom/google/android/gms/tagmanager/cj;

    invoke-direct {p2, p1}, Lcom/google/android/gms/tagmanager/cj;-><init>(Landroid/content/Context;)V

    invoke-virtual {p0, p2}, Lcom/google/android/gms/tagmanager/ct;->a(Lcom/google/android/gms/tagmanager/aj;)V

    new-instance p1, Lcom/google/android/gms/tagmanager/cu;

    invoke-direct {p1}, Lcom/google/android/gms/tagmanager/cu;-><init>()V

    invoke-virtual {p0, p1}, Lcom/google/android/gms/tagmanager/ct;->a(Lcom/google/android/gms/tagmanager/aj;)V

    new-instance p1, Lcom/google/android/gms/tagmanager/cv;

    invoke-direct {p1}, Lcom/google/android/gms/tagmanager/cv;-><init>()V

    invoke-virtual {p0, p1}, Lcom/google/android/gms/tagmanager/ct;->a(Lcom/google/android/gms/tagmanager/aj;)V

    new-instance p1, Lcom/google/android/gms/tagmanager/de;

    invoke-direct {p1}, Lcom/google/android/gms/tagmanager/de;-><init>()V

    invoke-virtual {p0, p1}, Lcom/google/android/gms/tagmanager/ct;->a(Lcom/google/android/gms/tagmanager/aj;)V

    new-instance p1, Lcom/google/android/gms/tagmanager/dk;

    invoke-direct {p1}, Lcom/google/android/gms/tagmanager/dk;-><init>()V

    invoke-virtual {p0, p1}, Lcom/google/android/gms/tagmanager/ct;->a(Lcom/google/android/gms/tagmanager/aj;)V

    new-instance p1, Ljava/util/HashMap;

    invoke-direct {p1}, Ljava/util/HashMap;-><init>()V

    iput-object p1, p0, Lcom/google/android/gms/tagmanager/ct;->arb:Ljava/util/Map;

    invoke-interface {v0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object p1

    :cond_0
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result p2

    if-eqz p2, :cond_5

    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object p2

    check-cast p2, Lcom/google/android/gms/tagmanager/cr$e;

    invoke-interface {p6}, Lcom/google/android/gms/tagmanager/ag;->oq()Z

    move-result p3

    if-eqz p3, :cond_1

    invoke-virtual {p2}, Lcom/google/android/gms/tagmanager/cr$e;->pg()Ljava/util/List;

    move-result-object p3

    invoke-virtual {p2}, Lcom/google/android/gms/tagmanager/cr$e;->ph()Ljava/util/List;

    move-result-object p4

    const-string p5, "add macro"

    invoke-static {p3, p4, p5}, Lcom/google/android/gms/tagmanager/ct;->a(Ljava/util/List;Ljava/util/List;Ljava/lang/String;)V

    invoke-virtual {p2}, Lcom/google/android/gms/tagmanager/cr$e;->pl()Ljava/util/List;

    move-result-object p3

    invoke-virtual {p2}, Lcom/google/android/gms/tagmanager/cr$e;->pi()Ljava/util/List;

    move-result-object p4

    const-string p5, "remove macro"

    invoke-static {p3, p4, p5}, Lcom/google/android/gms/tagmanager/ct;->a(Ljava/util/List;Ljava/util/List;Ljava/lang/String;)V

    invoke-virtual {p2}, Lcom/google/android/gms/tagmanager/cr$e;->pe()Ljava/util/List;

    move-result-object p3

    invoke-virtual {p2}, Lcom/google/android/gms/tagmanager/cr$e;->pj()Ljava/util/List;

    move-result-object p4

    const-string p5, "add tag"

    invoke-static {p3, p4, p5}, Lcom/google/android/gms/tagmanager/ct;->a(Ljava/util/List;Ljava/util/List;Ljava/lang/String;)V

    invoke-virtual {p2}, Lcom/google/android/gms/tagmanager/cr$e;->pf()Ljava/util/List;

    move-result-object p3

    invoke-virtual {p2}, Lcom/google/android/gms/tagmanager/cr$e;->pk()Ljava/util/List;

    move-result-object p4

    const-string p5, "remove tag"

    invoke-static {p3, p4, p5}, Lcom/google/android/gms/tagmanager/ct;->a(Ljava/util/List;Ljava/util/List;Ljava/lang/String;)V

    :cond_1
    const/4 p3, 0x0

    move p4, p3

    :goto_0
    invoke-virtual {p2}, Lcom/google/android/gms/tagmanager/cr$e;->pg()Ljava/util/List;

    move-result-object p5

    invoke-interface {p5}, Ljava/util/List;->size()I

    move-result p5

    const-string v0, "Unknown"

    if-ge p4, p5, :cond_3

    invoke-virtual {p2}, Lcom/google/android/gms/tagmanager/cr$e;->pg()Ljava/util/List;

    move-result-object p5

    invoke-interface {p5, p4}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object p5

    check-cast p5, Lcom/google/android/gms/tagmanager/cr$a;

    invoke-interface {p6}, Lcom/google/android/gms/tagmanager/ag;->oq()Z

    move-result v1

    if-eqz v1, :cond_2

    invoke-virtual {p2}, Lcom/google/android/gms/tagmanager/cr$e;->ph()Ljava/util/List;

    move-result-object v1

    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v1

    if-ge p4, v1, :cond_2

    invoke-virtual {p2}, Lcom/google/android/gms/tagmanager/cr$e;->ph()Ljava/util/List;

    move-result-object v0

    invoke-interface {v0, p4}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    :cond_2
    iget-object v1, p0, Lcom/google/android/gms/tagmanager/ct;->arb:Ljava/util/Map;

    invoke-static {p5}, Lcom/google/android/gms/tagmanager/ct;->h(Lcom/google/android/gms/tagmanager/cr$a;)Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Lcom/google/android/gms/tagmanager/ct;->e(Ljava/util/Map;Ljava/lang/String;)Lcom/google/android/gms/tagmanager/ct$c;

    move-result-object v1

    invoke-virtual {v1, p2}, Lcom/google/android/gms/tagmanager/ct$c;->b(Lcom/google/android/gms/tagmanager/cr$e;)V

    invoke-virtual {v1, p2, p5}, Lcom/google/android/gms/tagmanager/ct$c;->a(Lcom/google/android/gms/tagmanager/cr$e;Lcom/google/android/gms/tagmanager/cr$a;)V

    invoke-virtual {v1, p2, v0}, Lcom/google/android/gms/tagmanager/ct$c;->a(Lcom/google/android/gms/tagmanager/cr$e;Ljava/lang/String;)V

    add-int/lit8 p4, p4, 0x1

    goto :goto_0

    :cond_3
    :goto_1
    invoke-virtual {p2}, Lcom/google/android/gms/tagmanager/cr$e;->pl()Ljava/util/List;

    move-result-object p4

    invoke-interface {p4}, Ljava/util/List;->size()I

    move-result p4

    if-ge p3, p4, :cond_0

    invoke-virtual {p2}, Lcom/google/android/gms/tagmanager/cr$e;->pl()Ljava/util/List;

    move-result-object p4

    invoke-interface {p4, p3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object p4

    check-cast p4, Lcom/google/android/gms/tagmanager/cr$a;

    invoke-interface {p6}, Lcom/google/android/gms/tagmanager/ag;->oq()Z

    move-result p5

    if-eqz p5, :cond_4

    invoke-virtual {p2}, Lcom/google/android/gms/tagmanager/cr$e;->pi()Ljava/util/List;

    move-result-object p5

    invoke-interface {p5}, Ljava/util/List;->size()I

    move-result p5

    if-ge p3, p5, :cond_4

    invoke-virtual {p2}, Lcom/google/android/gms/tagmanager/cr$e;->pi()Ljava/util/List;

    move-result-object p5

    invoke-interface {p5, p3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object p5

    check-cast p5, Ljava/lang/String;

    goto :goto_2

    :cond_4
    move-object p5, v0

    :goto_2
    iget-object v1, p0, Lcom/google/android/gms/tagmanager/ct;->arb:Ljava/util/Map;

    invoke-static {p4}, Lcom/google/android/gms/tagmanager/ct;->h(Lcom/google/android/gms/tagmanager/cr$a;)Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Lcom/google/android/gms/tagmanager/ct;->e(Ljava/util/Map;Ljava/lang/String;)Lcom/google/android/gms/tagmanager/ct$c;

    move-result-object v1

    invoke-virtual {v1, p2}, Lcom/google/android/gms/tagmanager/ct$c;->b(Lcom/google/android/gms/tagmanager/cr$e;)V

    invoke-virtual {v1, p2, p4}, Lcom/google/android/gms/tagmanager/ct$c;->b(Lcom/google/android/gms/tagmanager/cr$e;Lcom/google/android/gms/tagmanager/cr$a;)V

    invoke-virtual {v1, p2, p5}, Lcom/google/android/gms/tagmanager/ct$c;->b(Lcom/google/android/gms/tagmanager/cr$e;Ljava/lang/String;)V

    add-int/lit8 p3, p3, 0x1

    goto :goto_1

    :cond_5
    iget-object p1, p0, Lcom/google/android/gms/tagmanager/ct;->aqT:Lcom/google/android/gms/tagmanager/cr$c;

    invoke-virtual {p1}, Lcom/google/android/gms/tagmanager/cr$c;->oZ()Ljava/util/Map;

    move-result-object p1

    invoke-interface {p1}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    move-result-object p1

    invoke-interface {p1}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object p1

    :cond_6
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result p2

    if-eqz p2, :cond_8

    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object p2

    check-cast p2, Ljava/util/Map$Entry;

    invoke-interface {p2}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object p3

    check-cast p3, Ljava/util/List;

    invoke-interface {p3}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object p3

    :cond_7
    :goto_3
    invoke-interface {p3}, Ljava/util/Iterator;->hasNext()Z

    move-result p4

    if-eqz p4, :cond_6

    invoke-interface {p3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object p4

    check-cast p4, Lcom/google/android/gms/tagmanager/cr$a;

    invoke-virtual {p4}, Lcom/google/android/gms/tagmanager/cr$a;->oU()Ljava/util/Map;

    move-result-object p5

    sget-object p6, Lcom/google/android/gms/internal/b;->dG:Lcom/google/android/gms/internal/b;

    invoke-virtual {p6}, Lcom/google/android/gms/internal/b;->toString()Ljava/lang/String;

    move-result-object p6

    invoke-interface {p5, p6}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p5

    check-cast p5, Lcom/google/android/gms/internal/d$a;

    invoke-static {p5}, Lcom/google/android/gms/tagmanager/di;->n(Lcom/google/android/gms/internal/d$a;)Ljava/lang/Boolean;

    move-result-object p5

    invoke-virtual {p5}, Ljava/lang/Boolean;->booleanValue()Z

    move-result p5

    if-nez p5, :cond_7

    iget-object p5, p0, Lcom/google/android/gms/tagmanager/ct;->arb:Ljava/util/Map;

    invoke-interface {p2}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object p6

    check-cast p6, Ljava/lang/String;

    invoke-static {p5, p6}, Lcom/google/android/gms/tagmanager/ct;->e(Ljava/util/Map;Ljava/lang/String;)Lcom/google/android/gms/tagmanager/ct$c;

    move-result-object p5

    invoke-virtual {p5, p4}, Lcom/google/android/gms/tagmanager/ct$c;->i(Lcom/google/android/gms/tagmanager/cr$a;)V

    goto :goto_3

    :cond_8
    return-void

    :cond_9
    new-instance p0, Ljava/lang/NullPointerException;

    const-string p1, "resource cannot be null"

    invoke-direct {p0, p1}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw p0
.end method

.method private a(Lcom/google/android/gms/internal/d$a;Ljava/util/Set;Lcom/google/android/gms/tagmanager/dl;)Lcom/google/android/gms/tagmanager/bz;
    .locals 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/google/android/gms/internal/d$a;",
            "Ljava/util/Set<",
            "Ljava/lang/String;",
            ">;",
            "Lcom/google/android/gms/tagmanager/dl;",
            ")",
            "Lcom/google/android/gms/tagmanager/bz<",
            "Lcom/google/android/gms/internal/d$a;",
            ">;"
        }
    .end annotation

    iget-boolean v0, p1, Lcom/google/android/gms/internal/d$a;->gF:Z

    if-nez v0, :cond_0

    new-instance p0, Lcom/google/android/gms/tagmanager/bz;

    const/4 p2, 0x1

    invoke-direct {p0, p1, p2}, Lcom/google/android/gms/tagmanager/bz;-><init>(Ljava/lang/Object;Z)V

    return-object p0

    :cond_0
    iget v0, p1, Lcom/google/android/gms/internal/d$a;->type:I

    const/4 v1, 0x2

    const/4 v2, 0x0

    if-eq v0, v1, :cond_b

    const/4 v1, 0x3

    if-eq v0, v1, :cond_6

    const/4 v1, 0x4

    if-eq v0, v1, :cond_4

    const/4 v1, 0x7

    if-eq v0, v1, :cond_1

    new-instance p0, Ljava/lang/StringBuilder;

    const-string p2, "Unknown type: "

    invoke-direct {p0, p2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget p1, p1, Lcom/google/android/gms/internal/d$a;->type:I

    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-static {p0}, Lcom/google/android/gms/tagmanager/bh;->T(Ljava/lang/String;)V

    sget-object p0, Lcom/google/android/gms/tagmanager/ct;->aqS:Lcom/google/android/gms/tagmanager/bz;

    return-object p0

    :cond_1
    invoke-static {p1}, Lcom/google/android/gms/tagmanager/cr;->g(Lcom/google/android/gms/internal/d$a;)Lcom/google/android/gms/internal/d$a;

    move-result-object v0

    iget-object v1, p1, Lcom/google/android/gms/internal/d$a;->gD:[Lcom/google/android/gms/internal/d$a;

    array-length v1, v1

    new-array v1, v1, [Lcom/google/android/gms/internal/d$a;

    iput-object v1, v0, Lcom/google/android/gms/internal/d$a;->gD:[Lcom/google/android/gms/internal/d$a;

    move v1, v2

    :goto_0
    iget-object v3, p1, Lcom/google/android/gms/internal/d$a;->gD:[Lcom/google/android/gms/internal/d$a;

    array-length v3, v3

    if-ge v1, v3, :cond_3

    iget-object v3, p1, Lcom/google/android/gms/internal/d$a;->gD:[Lcom/google/android/gms/internal/d$a;

    aget-object v3, v3, v1

    invoke-interface {p3, v1}, Lcom/google/android/gms/tagmanager/dl;->fl(I)Lcom/google/android/gms/tagmanager/dl;

    move-result-object v4

    invoke-direct {p0, v3, p2, v4}, Lcom/google/android/gms/tagmanager/ct;->a(Lcom/google/android/gms/internal/d$a;Ljava/util/Set;Lcom/google/android/gms/tagmanager/dl;)Lcom/google/android/gms/tagmanager/bz;

    move-result-object v3

    sget-object v4, Lcom/google/android/gms/tagmanager/ct;->aqS:Lcom/google/android/gms/tagmanager/bz;

    if-ne v3, v4, :cond_2

    return-object v4

    :cond_2
    iget-object v4, v0, Lcom/google/android/gms/internal/d$a;->gD:[Lcom/google/android/gms/internal/d$a;

    invoke-virtual {v3}, Lcom/google/android/gms/tagmanager/bz;->getObject()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/google/android/gms/internal/d$a;

    aput-object v3, v4, v1

    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    :cond_3
    new-instance p0, Lcom/google/android/gms/tagmanager/bz;

    invoke-direct {p0, v0, v2}, Lcom/google/android/gms/tagmanager/bz;-><init>(Ljava/lang/Object;Z)V

    return-object p0

    :cond_4
    iget-object v0, p1, Lcom/google/android/gms/internal/d$a;->gz:Ljava/lang/String;

    invoke-interface {p2, v0}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_5

    new-instance p0, Ljava/lang/StringBuilder;

    const-string p3, "Macro cycle detected.  Current macro reference: "

    invoke-direct {p0, p3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object p1, p1, Lcom/google/android/gms/internal/d$a;->gz:Ljava/lang/String;

    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p0

    const-string p1, ".  Previous macro references: "

    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p0

    invoke-virtual {p2}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p0

    const-string p1, "."

    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-static {p0}, Lcom/google/android/gms/tagmanager/bh;->T(Ljava/lang/String;)V

    sget-object p0, Lcom/google/android/gms/tagmanager/ct;->aqS:Lcom/google/android/gms/tagmanager/bz;

    return-object p0

    :cond_5
    iget-object v0, p1, Lcom/google/android/gms/internal/d$a;->gz:Ljava/lang/String;

    invoke-interface {p2, v0}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    iget-object v0, p1, Lcom/google/android/gms/internal/d$a;->gz:Ljava/lang/String;

    invoke-interface {p3}, Lcom/google/android/gms/tagmanager/dl;->oF()Lcom/google/android/gms/tagmanager/bk;

    move-result-object p3

    invoke-direct {p0, v0, p2, p3}, Lcom/google/android/gms/tagmanager/ct;->a(Ljava/lang/String;Ljava/util/Set;Lcom/google/android/gms/tagmanager/bk;)Lcom/google/android/gms/tagmanager/bz;

    move-result-object p0

    iget-object p3, p1, Lcom/google/android/gms/internal/d$a;->gE:[I

    invoke-static {p0, p3}, Lcom/google/android/gms/tagmanager/dm;->a(Lcom/google/android/gms/tagmanager/bz;[I)Lcom/google/android/gms/tagmanager/bz;

    move-result-object p0

    iget-object p1, p1, Lcom/google/android/gms/internal/d$a;->gz:Ljava/lang/String;

    invoke-interface {p2, p1}, Ljava/util/Set;->remove(Ljava/lang/Object;)Z

    return-object p0

    :cond_6
    invoke-static {p1}, Lcom/google/android/gms/tagmanager/cr;->g(Lcom/google/android/gms/internal/d$a;)Lcom/google/android/gms/internal/d$a;

    move-result-object v0

    iget-object v1, p1, Lcom/google/android/gms/internal/d$a;->gx:[Lcom/google/android/gms/internal/d$a;

    array-length v1, v1

    iget-object v3, p1, Lcom/google/android/gms/internal/d$a;->gy:[Lcom/google/android/gms/internal/d$a;

    array-length v3, v3

    if-eq v1, v3, :cond_7

    new-instance p0, Ljava/lang/StringBuilder;

    const-string p2, "Invalid serving value: "

    invoke-direct {p0, p2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p1}, Lcom/google/android/gms/internal/d$a;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-static {p0}, Lcom/google/android/gms/tagmanager/bh;->T(Ljava/lang/String;)V

    sget-object p0, Lcom/google/android/gms/tagmanager/ct;->aqS:Lcom/google/android/gms/tagmanager/bz;

    return-object p0

    :cond_7
    iget-object v1, p1, Lcom/google/android/gms/internal/d$a;->gx:[Lcom/google/android/gms/internal/d$a;

    array-length v1, v1

    new-array v1, v1, [Lcom/google/android/gms/internal/d$a;

    iput-object v1, v0, Lcom/google/android/gms/internal/d$a;->gx:[Lcom/google/android/gms/internal/d$a;

    iget-object v1, p1, Lcom/google/android/gms/internal/d$a;->gx:[Lcom/google/android/gms/internal/d$a;

    array-length v1, v1

    new-array v1, v1, [Lcom/google/android/gms/internal/d$a;

    iput-object v1, v0, Lcom/google/android/gms/internal/d$a;->gy:[Lcom/google/android/gms/internal/d$a;

    move v1, v2

    :goto_1
    iget-object v3, p1, Lcom/google/android/gms/internal/d$a;->gx:[Lcom/google/android/gms/internal/d$a;

    array-length v3, v3

    if-ge v1, v3, :cond_a

    iget-object v3, p1, Lcom/google/android/gms/internal/d$a;->gx:[Lcom/google/android/gms/internal/d$a;

    aget-object v3, v3, v1

    invoke-interface {p3, v1}, Lcom/google/android/gms/tagmanager/dl;->fj(I)Lcom/google/android/gms/tagmanager/dl;

    move-result-object v4

    invoke-direct {p0, v3, p2, v4}, Lcom/google/android/gms/tagmanager/ct;->a(Lcom/google/android/gms/internal/d$a;Ljava/util/Set;Lcom/google/android/gms/tagmanager/dl;)Lcom/google/android/gms/tagmanager/bz;

    move-result-object v3

    iget-object v4, p1, Lcom/google/android/gms/internal/d$a;->gy:[Lcom/google/android/gms/internal/d$a;

    aget-object v4, v4, v1

    invoke-interface {p3, v1}, Lcom/google/android/gms/tagmanager/dl;->fk(I)Lcom/google/android/gms/tagmanager/dl;

    move-result-object v5

    invoke-direct {p0, v4, p2, v5}, Lcom/google/android/gms/tagmanager/ct;->a(Lcom/google/android/gms/internal/d$a;Ljava/util/Set;Lcom/google/android/gms/tagmanager/dl;)Lcom/google/android/gms/tagmanager/bz;

    move-result-object v4

    sget-object v5, Lcom/google/android/gms/tagmanager/ct;->aqS:Lcom/google/android/gms/tagmanager/bz;

    if-eq v3, v5, :cond_9

    if-ne v4, v5, :cond_8

    goto :goto_2

    :cond_8
    iget-object v5, v0, Lcom/google/android/gms/internal/d$a;->gx:[Lcom/google/android/gms/internal/d$a;

    invoke-virtual {v3}, Lcom/google/android/gms/tagmanager/bz;->getObject()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/google/android/gms/internal/d$a;

    aput-object v3, v5, v1

    iget-object v3, v0, Lcom/google/android/gms/internal/d$a;->gy:[Lcom/google/android/gms/internal/d$a;

    invoke-virtual {v4}, Lcom/google/android/gms/tagmanager/bz;->getObject()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lcom/google/android/gms/internal/d$a;

    aput-object v4, v3, v1

    add-int/lit8 v1, v1, 0x1

    goto :goto_1

    :cond_9
    :goto_2
    return-object v5

    :cond_a
    new-instance p0, Lcom/google/android/gms/tagmanager/bz;

    invoke-direct {p0, v0, v2}, Lcom/google/android/gms/tagmanager/bz;-><init>(Ljava/lang/Object;Z)V

    return-object p0

    :cond_b
    invoke-static {p1}, Lcom/google/android/gms/tagmanager/cr;->g(Lcom/google/android/gms/internal/d$a;)Lcom/google/android/gms/internal/d$a;

    move-result-object v0

    iget-object v1, p1, Lcom/google/android/gms/internal/d$a;->gw:[Lcom/google/android/gms/internal/d$a;

    array-length v1, v1

    new-array v1, v1, [Lcom/google/android/gms/internal/d$a;

    iput-object v1, v0, Lcom/google/android/gms/internal/d$a;->gw:[Lcom/google/android/gms/internal/d$a;

    move v1, v2

    :goto_3
    iget-object v3, p1, Lcom/google/android/gms/internal/d$a;->gw:[Lcom/google/android/gms/internal/d$a;

    array-length v3, v3

    if-ge v1, v3, :cond_d

    iget-object v3, p1, Lcom/google/android/gms/internal/d$a;->gw:[Lcom/google/android/gms/internal/d$a;

    aget-object v3, v3, v1

    invoke-interface {p3, v1}, Lcom/google/android/gms/tagmanager/dl;->fi(I)Lcom/google/android/gms/tagmanager/dl;

    move-result-object v4

    invoke-direct {p0, v3, p2, v4}, Lcom/google/android/gms/tagmanager/ct;->a(Lcom/google/android/gms/internal/d$a;Ljava/util/Set;Lcom/google/android/gms/tagmanager/dl;)Lcom/google/android/gms/tagmanager/bz;

    move-result-object v3

    sget-object v4, Lcom/google/android/gms/tagmanager/ct;->aqS:Lcom/google/android/gms/tagmanager/bz;

    if-ne v3, v4, :cond_c

    return-object v4

    :cond_c
    iget-object v4, v0, Lcom/google/android/gms/internal/d$a;->gw:[Lcom/google/android/gms/internal/d$a;

    invoke-virtual {v3}, Lcom/google/android/gms/tagmanager/bz;->getObject()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/google/android/gms/internal/d$a;

    aput-object v3, v4, v1

    add-int/lit8 v1, v1, 0x1

    goto :goto_3

    :cond_d
    new-instance p0, Lcom/google/android/gms/tagmanager/bz;

    invoke-direct {p0, v0, v2}, Lcom/google/android/gms/tagmanager/bz;-><init>(Ljava/lang/Object;Z)V

    return-object p0
.end method

.method private a(Ljava/lang/String;Ljava/util/Set;Lcom/google/android/gms/tagmanager/bk;)Lcom/google/android/gms/tagmanager/bz;
    .locals 11
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/util/Set<",
            "Ljava/lang/String;",
            ">;",
            "Lcom/google/android/gms/tagmanager/bk;",
            ")",
            "Lcom/google/android/gms/tagmanager/bz<",
            "Lcom/google/android/gms/internal/d$a;",
            ">;"
        }
    .end annotation

    iget v0, p0, Lcom/google/android/gms/tagmanager/ct;->ard:I

    const/4 v1, 0x1

    add-int/2addr v0, v1

    iput v0, p0, Lcom/google/android/gms/tagmanager/ct;->ard:I

    iget-object v0, p0, Lcom/google/android/gms/tagmanager/ct;->aqZ:Lcom/google/android/gms/tagmanager/k;

    invoke-interface {v0, p1}, Lcom/google/android/gms/tagmanager/k;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/google/android/gms/tagmanager/ct$b;

    if-eqz v0, :cond_0

    iget-object v2, p0, Lcom/google/android/gms/tagmanager/ct;->aqU:Lcom/google/android/gms/tagmanager/ag;

    invoke-interface {v2}, Lcom/google/android/gms/tagmanager/ag;->oq()Z

    move-result v2

    if-nez v2, :cond_0

    invoke-virtual {v0}, Lcom/google/android/gms/tagmanager/ct$b;->oV()Lcom/google/android/gms/internal/d$a;

    move-result-object p1

    invoke-direct {p0, p1, p2}, Lcom/google/android/gms/tagmanager/ct;->a(Lcom/google/android/gms/internal/d$a;Ljava/util/Set;)V

    iget p1, p0, Lcom/google/android/gms/tagmanager/ct;->ard:I

    sub-int/2addr p1, v1

    iput p1, p0, Lcom/google/android/gms/tagmanager/ct;->ard:I

    invoke-virtual {v0}, Lcom/google/android/gms/tagmanager/ct$b;->pp()Lcom/google/android/gms/tagmanager/bz;

    move-result-object p0

    return-object p0

    :cond_0
    iget-object v0, p0, Lcom/google/android/gms/tagmanager/ct;->arb:Ljava/util/Map;

    invoke-interface {v0, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/google/android/gms/tagmanager/ct$c;

    if-nez v0, :cond_1

    new-instance p2, Ljava/lang/StringBuilder;

    invoke-direct {p2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-direct {p0}, Lcom/google/android/gms/tagmanager/ct;->po()Ljava/lang/String;

    move-result-object p3

    invoke-virtual {p2, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p2

    const-string p3, "Invalid macro: "

    invoke-virtual {p2, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p2

    invoke-virtual {p2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {p1}, Lcom/google/android/gms/tagmanager/bh;->T(Ljava/lang/String;)V

    iget p1, p0, Lcom/google/android/gms/tagmanager/ct;->ard:I

    sub-int/2addr p1, v1

    iput p1, p0, Lcom/google/android/gms/tagmanager/ct;->ard:I

    sget-object p0, Lcom/google/android/gms/tagmanager/ct;->aqS:Lcom/google/android/gms/tagmanager/bz;

    return-object p0

    :cond_1
    invoke-virtual {v0}, Lcom/google/android/gms/tagmanager/ct$c;->pq()Ljava/util/Set;

    move-result-object v4

    invoke-virtual {v0}, Lcom/google/android/gms/tagmanager/ct$c;->pr()Ljava/util/Map;

    move-result-object v5

    invoke-virtual {v0}, Lcom/google/android/gms/tagmanager/ct$c;->ps()Ljava/util/Map;

    move-result-object v6

    invoke-virtual {v0}, Lcom/google/android/gms/tagmanager/ct$c;->pu()Ljava/util/Map;

    move-result-object v7

    invoke-virtual {v0}, Lcom/google/android/gms/tagmanager/ct$c;->pt()Ljava/util/Map;

    move-result-object v8

    invoke-interface {p3}, Lcom/google/android/gms/tagmanager/bk;->oh()Lcom/google/android/gms/tagmanager/cs;

    move-result-object v10

    move-object v2, p0

    move-object v3, p1

    move-object v9, p2

    invoke-virtual/range {v2 .. v10}, Lcom/google/android/gms/tagmanager/ct;->a(Ljava/lang/String;Ljava/util/Set;Ljava/util/Map;Ljava/util/Map;Ljava/util/Map;Ljava/util/Map;Ljava/util/Set;Lcom/google/android/gms/tagmanager/cs;)Lcom/google/android/gms/tagmanager/bz;

    move-result-object v2

    invoke-virtual {v2}, Lcom/google/android/gms/tagmanager/bz;->getObject()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/util/Set;

    invoke-interface {v3}, Ljava/util/Set;->isEmpty()Z

    move-result v3

    if-eqz v3, :cond_2

    invoke-virtual {v0}, Lcom/google/android/gms/tagmanager/ct$c;->pv()Lcom/google/android/gms/tagmanager/cr$a;

    move-result-object v0

    goto :goto_0

    :cond_2
    invoke-virtual {v2}, Lcom/google/android/gms/tagmanager/bz;->getObject()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/Set;

    invoke-interface {v0}, Ljava/util/Set;->size()I

    move-result v0

    if-le v0, v1, :cond_3

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-direct {p0}, Lcom/google/android/gms/tagmanager/ct;->po()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v3, "Multiple macros active for macroName "

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/google/android/gms/tagmanager/bh;->W(Ljava/lang/String;)V

    :cond_3
    invoke-virtual {v2}, Lcom/google/android/gms/tagmanager/bz;->getObject()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/Set;

    invoke-interface {v0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/google/android/gms/tagmanager/cr$a;

    :goto_0
    if-nez v0, :cond_4

    iget p1, p0, Lcom/google/android/gms/tagmanager/ct;->ard:I

    sub-int/2addr p1, v1

    iput p1, p0, Lcom/google/android/gms/tagmanager/ct;->ard:I

    sget-object p0, Lcom/google/android/gms/tagmanager/ct;->aqS:Lcom/google/android/gms/tagmanager/bz;

    return-object p0

    :cond_4
    iget-object v3, p0, Lcom/google/android/gms/tagmanager/ct;->aqX:Ljava/util/Map;

    invoke-interface {p3}, Lcom/google/android/gms/tagmanager/bk;->ow()Lcom/google/android/gms/tagmanager/ck;

    move-result-object p3

    invoke-direct {p0, v3, v0, p2, p3}, Lcom/google/android/gms/tagmanager/ct;->a(Ljava/util/Map;Lcom/google/android/gms/tagmanager/cr$a;Ljava/util/Set;Lcom/google/android/gms/tagmanager/ck;)Lcom/google/android/gms/tagmanager/bz;

    move-result-object p3

    invoke-virtual {v2}, Lcom/google/android/gms/tagmanager/bz;->oG()Z

    move-result v2

    if-eqz v2, :cond_5

    invoke-virtual {p3}, Lcom/google/android/gms/tagmanager/bz;->oG()Z

    move-result v2

    if-eqz v2, :cond_5

    move v2, v1

    goto :goto_1

    :cond_5
    const/4 v2, 0x0

    :goto_1
    sget-object v3, Lcom/google/android/gms/tagmanager/ct;->aqS:Lcom/google/android/gms/tagmanager/bz;

    if-ne p3, v3, :cond_6

    goto :goto_2

    :cond_6
    new-instance v3, Lcom/google/android/gms/tagmanager/bz;

    invoke-virtual {p3}, Lcom/google/android/gms/tagmanager/bz;->getObject()Ljava/lang/Object;

    move-result-object p3

    invoke-direct {v3, p3, v2}, Lcom/google/android/gms/tagmanager/bz;-><init>(Ljava/lang/Object;Z)V

    :goto_2
    invoke-virtual {v0}, Lcom/google/android/gms/tagmanager/cr$a;->oV()Lcom/google/android/gms/internal/d$a;

    move-result-object p3

    invoke-virtual {v3}, Lcom/google/android/gms/tagmanager/bz;->oG()Z

    move-result v0

    if-eqz v0, :cond_7

    iget-object v0, p0, Lcom/google/android/gms/tagmanager/ct;->aqZ:Lcom/google/android/gms/tagmanager/k;

    new-instance v2, Lcom/google/android/gms/tagmanager/ct$b;

    invoke-direct {v2, v3, p3}, Lcom/google/android/gms/tagmanager/ct$b;-><init>(Lcom/google/android/gms/tagmanager/bz;Lcom/google/android/gms/internal/d$a;)V

    invoke-interface {v0, p1, v2}, Lcom/google/android/gms/tagmanager/k;->e(Ljava/lang/Object;Ljava/lang/Object;)V

    :cond_7
    invoke-direct {p0, p3, p2}, Lcom/google/android/gms/tagmanager/ct;->a(Lcom/google/android/gms/internal/d$a;Ljava/util/Set;)V

    iget p1, p0, Lcom/google/android/gms/tagmanager/ct;->ard:I

    sub-int/2addr p1, v1

    iput p1, p0, Lcom/google/android/gms/tagmanager/ct;->ard:I

    return-object v3
.end method

.method private a(Ljava/util/Map;Lcom/google/android/gms/tagmanager/cr$a;Ljava/util/Set;Lcom/google/android/gms/tagmanager/ck;)Lcom/google/android/gms/tagmanager/bz;
    .locals 10
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Lcom/google/android/gms/tagmanager/aj;",
            ">;",
            "Lcom/google/android/gms/tagmanager/cr$a;",
            "Ljava/util/Set<",
            "Ljava/lang/String;",
            ">;",
            "Lcom/google/android/gms/tagmanager/ck;",
            ")",
            "Lcom/google/android/gms/tagmanager/bz<",
            "Lcom/google/android/gms/internal/d$a;",
            ">;"
        }
    .end annotation

    invoke-virtual {p2}, Lcom/google/android/gms/tagmanager/cr$a;->oU()Ljava/util/Map;

    move-result-object v0

    sget-object v1, Lcom/google/android/gms/internal/b;->cU:Lcom/google/android/gms/internal/b;

    invoke-virtual {v1}, Lcom/google/android/gms/internal/b;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-interface {v0, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/google/android/gms/internal/d$a;

    if-nez v0, :cond_0

    const-string p0, "No function id in properties"

    :goto_0
    invoke-static {p0}, Lcom/google/android/gms/tagmanager/bh;->T(Ljava/lang/String;)V

    sget-object p0, Lcom/google/android/gms/tagmanager/ct;->aqS:Lcom/google/android/gms/tagmanager/bz;

    return-object p0

    :cond_0
    iget-object v0, v0, Lcom/google/android/gms/internal/d$a;->gA:Ljava/lang/String;

    invoke-interface {p1, v0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lcom/google/android/gms/tagmanager/aj;

    if-nez p1, :cond_1

    new-instance p0, Ljava/lang/StringBuilder;

    invoke-direct {p0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p0, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p0

    const-string p1, " has no backing implementation."

    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p0

    :goto_1
    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    goto :goto_0

    :cond_1
    iget-object v1, p0, Lcom/google/android/gms/tagmanager/ct;->aqY:Lcom/google/android/gms/tagmanager/k;

    invoke-interface {v1, p2}, Lcom/google/android/gms/tagmanager/k;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/google/android/gms/tagmanager/bz;

    if-eqz v1, :cond_2

    iget-object v2, p0, Lcom/google/android/gms/tagmanager/ct;->aqU:Lcom/google/android/gms/tagmanager/ag;

    invoke-interface {v2}, Lcom/google/android/gms/tagmanager/ag;->oq()Z

    move-result v2

    if-nez v2, :cond_2

    return-object v1

    :cond_2
    new-instance v1, Ljava/util/HashMap;

    invoke-direct {v1}, Ljava/util/HashMap;-><init>()V

    invoke-virtual {p2}, Lcom/google/android/gms/tagmanager/cr$a;->oU()Ljava/util/Map;

    move-result-object v2

    invoke-interface {v2}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    move-result-object v2

    invoke-interface {v2}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v2

    const/4 v3, 0x1

    move v4, v3

    :goto_2
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    const/4 v6, 0x0

    if-eqz v5, :cond_5

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/util/Map$Entry;

    invoke-interface {v5}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Ljava/lang/String;

    invoke-interface {p4, v7}, Lcom/google/android/gms/tagmanager/ck;->cH(Ljava/lang/String;)Lcom/google/android/gms/tagmanager/cm;

    move-result-object v7

    invoke-interface {v5}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Lcom/google/android/gms/internal/d$a;

    invoke-interface {v5}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v9

    check-cast v9, Lcom/google/android/gms/internal/d$a;

    invoke-interface {v7, v9}, Lcom/google/android/gms/tagmanager/cm;->e(Lcom/google/android/gms/internal/d$a;)Lcom/google/android/gms/tagmanager/dl;

    move-result-object v7

    invoke-direct {p0, v8, p3, v7}, Lcom/google/android/gms/tagmanager/ct;->a(Lcom/google/android/gms/internal/d$a;Ljava/util/Set;Lcom/google/android/gms/tagmanager/dl;)Lcom/google/android/gms/tagmanager/bz;

    move-result-object v7

    sget-object v8, Lcom/google/android/gms/tagmanager/ct;->aqS:Lcom/google/android/gms/tagmanager/bz;

    if-ne v7, v8, :cond_3

    return-object v8

    :cond_3
    invoke-virtual {v7}, Lcom/google/android/gms/tagmanager/bz;->oG()Z

    move-result v8

    if-eqz v8, :cond_4

    invoke-interface {v5}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Ljava/lang/String;

    invoke-virtual {v7}, Lcom/google/android/gms/tagmanager/bz;->getObject()Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Lcom/google/android/gms/internal/d$a;

    invoke-virtual {p2, v6, v8}, Lcom/google/android/gms/tagmanager/cr$a;->a(Ljava/lang/String;Lcom/google/android/gms/internal/d$a;)V

    goto :goto_3

    :cond_4
    move v4, v6

    :goto_3
    invoke-interface {v5}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v5

    invoke-virtual {v7}, Lcom/google/android/gms/tagmanager/bz;->getObject()Ljava/lang/Object;

    move-result-object v6

    invoke-interface {v1, v5, v6}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_2

    :cond_5
    invoke-interface {v1}, Ljava/util/Map;->keySet()Ljava/util/Set;

    move-result-object p3

    invoke-virtual {p1, p3}, Lcom/google/android/gms/tagmanager/aj;->a(Ljava/util/Set;)Z

    move-result p3

    if-nez p3, :cond_6

    new-instance p0, Ljava/lang/StringBuilder;

    const-string p2, "Incorrect keys for function "

    invoke-direct {p0, p2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p0, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p0

    const-string p2, " required "

    invoke-virtual {p0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p0

    invoke-virtual {p1}, Lcom/google/android/gms/tagmanager/aj;->os()Ljava/util/Set;

    move-result-object p1

    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object p0

    const-string p1, " had "

    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p0

    invoke-interface {v1}, Ljava/util/Map;->keySet()Ljava/util/Set;

    move-result-object p1

    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object p0

    goto/16 :goto_1

    :cond_6
    if-eqz v4, :cond_7

    invoke-virtual {p1}, Lcom/google/android/gms/tagmanager/aj;->nN()Z

    move-result p3

    if-eqz p3, :cond_7

    goto :goto_4

    :cond_7
    move v3, v6

    :goto_4
    new-instance p3, Lcom/google/android/gms/tagmanager/bz;

    invoke-virtual {p1, v1}, Lcom/google/android/gms/tagmanager/aj;->C(Ljava/util/Map;)Lcom/google/android/gms/internal/d$a;

    move-result-object p1

    invoke-direct {p3, p1, v3}, Lcom/google/android/gms/tagmanager/bz;-><init>(Ljava/lang/Object;Z)V

    if-eqz v3, :cond_8

    iget-object p0, p0, Lcom/google/android/gms/tagmanager/ct;->aqY:Lcom/google/android/gms/tagmanager/k;

    invoke-interface {p0, p2, p3}, Lcom/google/android/gms/tagmanager/k;->e(Ljava/lang/Object;Ljava/lang/Object;)V

    :cond_8
    invoke-virtual {p3}, Lcom/google/android/gms/tagmanager/bz;->getObject()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lcom/google/android/gms/internal/d$a;

    invoke-interface {p4, p0}, Lcom/google/android/gms/tagmanager/ck;->d(Lcom/google/android/gms/internal/d$a;)V

    return-object p3
.end method

.method private a(Ljava/util/Set;Ljava/util/Set;Lcom/google/android/gms/tagmanager/ct$a;Lcom/google/android/gms/tagmanager/cs;)Lcom/google/android/gms/tagmanager/bz;
    .locals 8
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Set<",
            "Lcom/google/android/gms/tagmanager/cr$e;",
            ">;",
            "Ljava/util/Set<",
            "Ljava/lang/String;",
            ">;",
            "Lcom/google/android/gms/tagmanager/ct$a;",
            "Lcom/google/android/gms/tagmanager/cs;",
            ")",
            "Lcom/google/android/gms/tagmanager/bz<",
            "Ljava/util/Set<",
            "Lcom/google/android/gms/tagmanager/cr$a;",
            ">;>;"
        }
    .end annotation

    new-instance v0, Ljava/util/HashSet;

    invoke-direct {v0}, Ljava/util/HashSet;-><init>()V

    new-instance v1, Ljava/util/HashSet;

    invoke-direct {v1}, Ljava/util/HashSet;-><init>()V

    invoke-interface {p1}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object p1

    const/4 v2, 0x1

    :goto_0
    move v3, v2

    :goto_1
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_2

    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lcom/google/android/gms/tagmanager/cr$e;

    invoke-interface {p4}, Lcom/google/android/gms/tagmanager/cs;->oE()Lcom/google/android/gms/tagmanager/cn;

    move-result-object v5

    invoke-virtual {p0, v4, p2, v5}, Lcom/google/android/gms/tagmanager/ct;->a(Lcom/google/android/gms/tagmanager/cr$e;Ljava/util/Set;Lcom/google/android/gms/tagmanager/cn;)Lcom/google/android/gms/tagmanager/bz;

    move-result-object v6

    invoke-virtual {v6}, Lcom/google/android/gms/tagmanager/bz;->getObject()Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Ljava/lang/Boolean;

    invoke-virtual {v7}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v7

    if-eqz v7, :cond_0

    invoke-interface {p3, v4, v0, v1, v5}, Lcom/google/android/gms/tagmanager/ct$a;->a(Lcom/google/android/gms/tagmanager/cr$e;Ljava/util/Set;Ljava/util/Set;Lcom/google/android/gms/tagmanager/cn;)V

    :cond_0
    if-eqz v3, :cond_1

    invoke-virtual {v6}, Lcom/google/android/gms/tagmanager/bz;->oG()Z

    move-result v3

    if-eqz v3, :cond_1

    goto :goto_0

    :cond_1
    const/4 v3, 0x0

    goto :goto_1

    :cond_2
    invoke-interface {v0, v1}, Ljava/util/Set;->removeAll(Ljava/util/Collection;)Z

    invoke-interface {p4, v0}, Lcom/google/android/gms/tagmanager/cs;->b(Ljava/util/Set;)V

    new-instance p0, Lcom/google/android/gms/tagmanager/bz;

    invoke-direct {p0, v0, v3}, Lcom/google/android/gms/tagmanager/bz;-><init>(Ljava/lang/Object;Z)V

    return-object p0
.end method

.method private a(Lcom/google/android/gms/internal/d$a;Ljava/util/Set;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/google/android/gms/internal/d$a;",
            "Ljava/util/Set<",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    if-nez p1, :cond_0

    return-void

    :cond_0
    new-instance v0, Lcom/google/android/gms/tagmanager/bx;

    invoke-direct {v0}, Lcom/google/android/gms/tagmanager/bx;-><init>()V

    invoke-direct {p0, p1, p2, v0}, Lcom/google/android/gms/tagmanager/ct;->a(Lcom/google/android/gms/internal/d$a;Ljava/util/Set;Lcom/google/android/gms/tagmanager/dl;)Lcom/google/android/gms/tagmanager/bz;

    move-result-object p1

    sget-object p2, Lcom/google/android/gms/tagmanager/ct;->aqS:Lcom/google/android/gms/tagmanager/bz;

    if-ne p1, p2, :cond_1

    return-void

    :cond_1
    invoke-virtual {p1}, Lcom/google/android/gms/tagmanager/bz;->getObject()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lcom/google/android/gms/internal/d$a;

    invoke-static {p1}, Lcom/google/android/gms/tagmanager/di;->o(Lcom/google/android/gms/internal/d$a;)Ljava/lang/Object;

    move-result-object p1

    instance-of p2, p1, Ljava/util/Map;

    if-eqz p2, :cond_2

    check-cast p1, Ljava/util/Map;

    iget-object p0, p0, Lcom/google/android/gms/tagmanager/ct;->aod:Lcom/google/android/gms/tagmanager/DataLayer;

    invoke-virtual {p0, p1}, Lcom/google/android/gms/tagmanager/DataLayer;->push(Ljava/util/Map;)V

    goto :goto_1

    :cond_2
    instance-of p2, p1, Ljava/util/List;

    if-eqz p2, :cond_4

    check-cast p1, Ljava/util/List;

    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object p1

    :goto_0
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result p2

    if-eqz p2, :cond_5

    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object p2

    instance-of v0, p2, Ljava/util/Map;

    if-eqz v0, :cond_3

    check-cast p2, Ljava/util/Map;

    iget-object v0, p0, Lcom/google/android/gms/tagmanager/ct;->aod:Lcom/google/android/gms/tagmanager/DataLayer;

    invoke-virtual {v0, p2}, Lcom/google/android/gms/tagmanager/DataLayer;->push(Ljava/util/Map;)V

    goto :goto_0

    :cond_3
    const-string p2, "pushAfterEvaluate: value not a Map"

    invoke-static {p2}, Lcom/google/android/gms/tagmanager/bh;->W(Ljava/lang/String;)V

    goto :goto_0

    :cond_4
    const-string p0, "pushAfterEvaluate: value not a Map or List"

    invoke-static {p0}, Lcom/google/android/gms/tagmanager/bh;->W(Ljava/lang/String;)V

    :cond_5
    :goto_1
    return-void
.end method

.method private static a(Ljava/util/List;Ljava/util/List;Ljava/lang/String;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/google/android/gms/tagmanager/cr$a;",
            ">;",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;",
            "Ljava/lang/String;",
            ")V"
        }
    .end annotation

    invoke-interface {p0}, Ljava/util/List;->size()I

    move-result p0

    invoke-interface {p1}, Ljava/util/List;->size()I

    move-result p1

    if-eq p0, p1, :cond_0

    new-instance p0, Ljava/lang/StringBuilder;

    const-string p1, "Invalid resource: imbalance of rule names of functions for "

    invoke-direct {p0, p1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p0

    const-string p1, " operation. Using default rule name instead"

    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-static {p0}, Lcom/google/android/gms/tagmanager/bh;->U(Ljava/lang/String;)V

    :cond_0
    return-void
.end method

.method private static a(Ljava/util/Map;Lcom/google/android/gms/tagmanager/aj;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Lcom/google/android/gms/tagmanager/aj;",
            ">;",
            "Lcom/google/android/gms/tagmanager/aj;",
            ")V"
        }
    .end annotation

    invoke-virtual {p1}, Lcom/google/android/gms/tagmanager/aj;->or()Ljava/lang/String;

    move-result-object v0

    invoke-interface {p0, v0}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_0

    invoke-virtual {p1}, Lcom/google/android/gms/tagmanager/aj;->or()Ljava/lang/String;

    move-result-object v0

    invoke-interface {p0, v0, p1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    return-void

    :cond_0
    new-instance p0, Ljava/lang/IllegalArgumentException;

    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "Duplicate function type name: "

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p1}, Lcom/google/android/gms/tagmanager/aj;->or()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-direct {p0, p1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p0
.end method

.method private static e(Ljava/util/Map;Ljava/lang/String;)Lcom/google/android/gms/tagmanager/ct$c;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Lcom/google/android/gms/tagmanager/ct$c;",
            ">;",
            "Ljava/lang/String;",
            ")",
            "Lcom/google/android/gms/tagmanager/ct$c;"
        }
    .end annotation

    invoke-interface {p0, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/google/android/gms/tagmanager/ct$c;

    if-nez v0, :cond_0

    new-instance v0, Lcom/google/android/gms/tagmanager/ct$c;

    invoke-direct {v0}, Lcom/google/android/gms/tagmanager/ct$c;-><init>()V

    invoke-interface {p0, p1, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    :cond_0
    return-object v0
.end method

.method private static h(Lcom/google/android/gms/tagmanager/cr$a;)Ljava/lang/String;
    .locals 1

    invoke-virtual {p0}, Lcom/google/android/gms/tagmanager/cr$a;->oU()Ljava/util/Map;

    move-result-object p0

    sget-object v0, Lcom/google/android/gms/internal/b;->df:Lcom/google/android/gms/internal/b;

    invoke-virtual {v0}, Lcom/google/android/gms/internal/b;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-interface {p0, v0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lcom/google/android/gms/internal/d$a;

    invoke-static {p0}, Lcom/google/android/gms/tagmanager/di;->j(Lcom/google/android/gms/internal/d$a;)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method private po()Ljava/lang/String;
    .locals 3

    iget v0, p0, Lcom/google/android/gms/tagmanager/ct;->ard:I

    const/4 v1, 0x1

    if-gt v0, v1, :cond_0

    const-string p0, ""

    return-object p0

    :cond_0
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    iget v1, p0, Lcom/google/android/gms/tagmanager/ct;->ard:I

    invoke-static {v1}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const/4 v1, 0x2

    :goto_0
    iget v2, p0, Lcom/google/android/gms/tagmanager/ct;->ard:I

    if-ge v1, v2, :cond_1

    const/16 v2, 0x20

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    :cond_1
    const-string p0, ": "

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method


# virtual methods
.method a(Lcom/google/android/gms/tagmanager/cr$a;Ljava/util/Set;Lcom/google/android/gms/tagmanager/ck;)Lcom/google/android/gms/tagmanager/bz;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/google/android/gms/tagmanager/cr$a;",
            "Ljava/util/Set<",
            "Ljava/lang/String;",
            ">;",
            "Lcom/google/android/gms/tagmanager/ck;",
            ")",
            "Lcom/google/android/gms/tagmanager/bz<",
            "Ljava/lang/Boolean;",
            ">;"
        }
    .end annotation

    iget-object v0, p0, Lcom/google/android/gms/tagmanager/ct;->aqW:Ljava/util/Map;

    invoke-direct {p0, v0, p1, p2, p3}, Lcom/google/android/gms/tagmanager/ct;->a(Ljava/util/Map;Lcom/google/android/gms/tagmanager/cr$a;Ljava/util/Set;Lcom/google/android/gms/tagmanager/ck;)Lcom/google/android/gms/tagmanager/bz;

    move-result-object p0

    invoke-virtual {p0}, Lcom/google/android/gms/tagmanager/bz;->getObject()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lcom/google/android/gms/internal/d$a;

    invoke-static {p1}, Lcom/google/android/gms/tagmanager/di;->n(Lcom/google/android/gms/internal/d$a;)Ljava/lang/Boolean;

    move-result-object p1

    invoke-static {p1}, Lcom/google/android/gms/tagmanager/di;->u(Ljava/lang/Object;)Lcom/google/android/gms/internal/d$a;

    move-result-object p2

    invoke-interface {p3, p2}, Lcom/google/android/gms/tagmanager/ck;->d(Lcom/google/android/gms/internal/d$a;)V

    new-instance p2, Lcom/google/android/gms/tagmanager/bz;

    invoke-virtual {p0}, Lcom/google/android/gms/tagmanager/bz;->oG()Z

    move-result p0

    invoke-direct {p2, p1, p0}, Lcom/google/android/gms/tagmanager/bz;-><init>(Ljava/lang/Object;Z)V

    return-object p2
.end method

.method a(Lcom/google/android/gms/tagmanager/cr$e;Ljava/util/Set;Lcom/google/android/gms/tagmanager/cn;)Lcom/google/android/gms/tagmanager/bz;
    .locals 7
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/google/android/gms/tagmanager/cr$e;",
            "Ljava/util/Set<",
            "Ljava/lang/String;",
            ">;",
            "Lcom/google/android/gms/tagmanager/cn;",
            ")",
            "Lcom/google/android/gms/tagmanager/bz<",
            "Ljava/lang/Boolean;",
            ">;"
        }
    .end annotation

    invoke-virtual {p1}, Lcom/google/android/gms/tagmanager/cr$e;->pd()Ljava/util/List;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    const/4 v1, 0x1

    invoke-static {v1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v2

    :goto_0
    move v3, v1

    :goto_1
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    const/4 v5, 0x0

    if-eqz v4, :cond_2

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lcom/google/android/gms/tagmanager/cr$a;

    invoke-interface {p3}, Lcom/google/android/gms/tagmanager/cn;->oy()Lcom/google/android/gms/tagmanager/ck;

    move-result-object v6

    invoke-virtual {p0, v4, p2, v6}, Lcom/google/android/gms/tagmanager/ct;->a(Lcom/google/android/gms/tagmanager/cr$a;Ljava/util/Set;Lcom/google/android/gms/tagmanager/ck;)Lcom/google/android/gms/tagmanager/bz;

    move-result-object v4

    invoke-virtual {v4}, Lcom/google/android/gms/tagmanager/bz;->getObject()Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Ljava/lang/Boolean;

    invoke-virtual {v6}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v6

    if-eqz v6, :cond_0

    invoke-static {v5}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object p0

    invoke-static {p0}, Lcom/google/android/gms/tagmanager/di;->u(Ljava/lang/Object;)Lcom/google/android/gms/internal/d$a;

    move-result-object p0

    invoke-interface {p3, p0}, Lcom/google/android/gms/tagmanager/cn;->f(Lcom/google/android/gms/internal/d$a;)V

    new-instance p0, Lcom/google/android/gms/tagmanager/bz;

    invoke-static {v5}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object p1

    invoke-virtual {v4}, Lcom/google/android/gms/tagmanager/bz;->oG()Z

    move-result p2

    invoke-direct {p0, p1, p2}, Lcom/google/android/gms/tagmanager/bz;-><init>(Ljava/lang/Object;Z)V

    return-object p0

    :cond_0
    if-eqz v3, :cond_1

    invoke-virtual {v4}, Lcom/google/android/gms/tagmanager/bz;->oG()Z

    move-result v3

    if-eqz v3, :cond_1

    goto :goto_0

    :cond_1
    move v3, v5

    goto :goto_1

    :cond_2
    invoke-virtual {p1}, Lcom/google/android/gms/tagmanager/cr$e;->pc()Ljava/util/List;

    move-result-object p1

    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object p1

    :goto_2
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_5

    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/google/android/gms/tagmanager/cr$a;

    invoke-interface {p3}, Lcom/google/android/gms/tagmanager/cn;->oz()Lcom/google/android/gms/tagmanager/ck;

    move-result-object v4

    invoke-virtual {p0, v0, p2, v4}, Lcom/google/android/gms/tagmanager/ct;->a(Lcom/google/android/gms/tagmanager/cr$a;Ljava/util/Set;Lcom/google/android/gms/tagmanager/ck;)Lcom/google/android/gms/tagmanager/bz;

    move-result-object v0

    invoke-virtual {v0}, Lcom/google/android/gms/tagmanager/bz;->getObject()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/Boolean;

    invoke-virtual {v4}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v4

    if-nez v4, :cond_3

    invoke-static {v5}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object p0

    invoke-static {p0}, Lcom/google/android/gms/tagmanager/di;->u(Ljava/lang/Object;)Lcom/google/android/gms/internal/d$a;

    move-result-object p0

    invoke-interface {p3, p0}, Lcom/google/android/gms/tagmanager/cn;->f(Lcom/google/android/gms/internal/d$a;)V

    new-instance p0, Lcom/google/android/gms/tagmanager/bz;

    invoke-static {v5}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object p1

    invoke-virtual {v0}, Lcom/google/android/gms/tagmanager/bz;->oG()Z

    move-result p2

    invoke-direct {p0, p1, p2}, Lcom/google/android/gms/tagmanager/bz;-><init>(Ljava/lang/Object;Z)V

    return-object p0

    :cond_3
    if-eqz v3, :cond_4

    invoke-virtual {v0}, Lcom/google/android/gms/tagmanager/bz;->oG()Z

    move-result v0

    if-eqz v0, :cond_4

    move v3, v1

    goto :goto_2

    :cond_4
    move v3, v5

    goto :goto_2

    :cond_5
    invoke-static {v2}, Lcom/google/android/gms/tagmanager/di;->u(Ljava/lang/Object;)Lcom/google/android/gms/internal/d$a;

    move-result-object p0

    invoke-interface {p3, p0}, Lcom/google/android/gms/tagmanager/cn;->f(Lcom/google/android/gms/internal/d$a;)V

    new-instance p0, Lcom/google/android/gms/tagmanager/bz;

    invoke-direct {p0, v2, v3}, Lcom/google/android/gms/tagmanager/bz;-><init>(Ljava/lang/Object;Z)V

    return-object p0
.end method

.method a(Ljava/lang/String;Ljava/util/Set;Ljava/util/Map;Ljava/util/Map;Ljava/util/Map;Ljava/util/Map;Ljava/util/Set;Lcom/google/android/gms/tagmanager/cs;)Lcom/google/android/gms/tagmanager/bz;
    .locals 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/util/Set<",
            "Lcom/google/android/gms/tagmanager/cr$e;",
            ">;",
            "Ljava/util/Map<",
            "Lcom/google/android/gms/tagmanager/cr$e;",
            "Ljava/util/List<",
            "Lcom/google/android/gms/tagmanager/cr$a;",
            ">;>;",
            "Ljava/util/Map<",
            "Lcom/google/android/gms/tagmanager/cr$e;",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;>;",
            "Ljava/util/Map<",
            "Lcom/google/android/gms/tagmanager/cr$e;",
            "Ljava/util/List<",
            "Lcom/google/android/gms/tagmanager/cr$a;",
            ">;>;",
            "Ljava/util/Map<",
            "Lcom/google/android/gms/tagmanager/cr$e;",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;>;",
            "Ljava/util/Set<",
            "Ljava/lang/String;",
            ">;",
            "Lcom/google/android/gms/tagmanager/cs;",
            ")",
            "Lcom/google/android/gms/tagmanager/bz<",
            "Ljava/util/Set<",
            "Lcom/google/android/gms/tagmanager/cr$a;",
            ">;>;"
        }
    .end annotation

    new-instance p1, Lcom/google/android/gms/tagmanager/ct$3;

    move-object v0, p1

    move-object v1, p0

    move-object v2, p3

    move-object v3, p4

    move-object v4, p5

    move-object v5, p6

    invoke-direct/range {v0 .. v5}, Lcom/google/android/gms/tagmanager/ct$3;-><init>(Lcom/google/android/gms/tagmanager/ct;Ljava/util/Map;Ljava/util/Map;Ljava/util/Map;Ljava/util/Map;)V

    invoke-direct {p0, p2, p7, p1, p8}, Lcom/google/android/gms/tagmanager/ct;->a(Ljava/util/Set;Ljava/util/Set;Lcom/google/android/gms/tagmanager/ct$a;Lcom/google/android/gms/tagmanager/cs;)Lcom/google/android/gms/tagmanager/bz;

    move-result-object p0

    return-object p0
.end method

.method a(Ljava/util/Set;Lcom/google/android/gms/tagmanager/cs;)Lcom/google/android/gms/tagmanager/bz;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Set<",
            "Lcom/google/android/gms/tagmanager/cr$e;",
            ">;",
            "Lcom/google/android/gms/tagmanager/cs;",
            ")",
            "Lcom/google/android/gms/tagmanager/bz<",
            "Ljava/util/Set<",
            "Lcom/google/android/gms/tagmanager/cr$a;",
            ">;>;"
        }
    .end annotation

    new-instance v0, Ljava/util/HashSet;

    invoke-direct {v0}, Ljava/util/HashSet;-><init>()V

    new-instance v1, Lcom/google/android/gms/tagmanager/ct$4;

    invoke-direct {v1, p0}, Lcom/google/android/gms/tagmanager/ct$4;-><init>(Lcom/google/android/gms/tagmanager/ct;)V

    invoke-direct {p0, p1, v0, v1, p2}, Lcom/google/android/gms/tagmanager/ct;->a(Ljava/util/Set;Ljava/util/Set;Lcom/google/android/gms/tagmanager/ct$a;Lcom/google/android/gms/tagmanager/cs;)Lcom/google/android/gms/tagmanager/bz;

    move-result-object p0

    return-object p0
.end method

.method a(Lcom/google/android/gms/tagmanager/aj;)V
    .locals 0

    iget-object p0, p0, Lcom/google/android/gms/tagmanager/ct;->aqX:Ljava/util/Map;

    invoke-static {p0, p1}, Lcom/google/android/gms/tagmanager/ct;->a(Ljava/util/Map;Lcom/google/android/gms/tagmanager/aj;)V

    return-void
.end method

.method b(Lcom/google/android/gms/tagmanager/aj;)V
    .locals 0

    iget-object p0, p0, Lcom/google/android/gms/tagmanager/ct;->aqV:Ljava/util/Map;

    invoke-static {p0, p1}, Lcom/google/android/gms/tagmanager/ct;->a(Ljava/util/Map;Lcom/google/android/gms/tagmanager/aj;)V

    return-void
.end method

.method c(Lcom/google/android/gms/tagmanager/aj;)V
    .locals 0

    iget-object p0, p0, Lcom/google/android/gms/tagmanager/ct;->aqW:Ljava/util/Map;

    invoke-static {p0, p1}, Lcom/google/android/gms/tagmanager/ct;->a(Ljava/util/Map;Lcom/google/android/gms/tagmanager/aj;)V

    return-void
.end method

.method public cR(Ljava/lang/String;)Lcom/google/android/gms/tagmanager/bz;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            ")",
            "Lcom/google/android/gms/tagmanager/bz<",
            "Lcom/google/android/gms/internal/d$a;",
            ">;"
        }
    .end annotation

    const/4 v0, 0x0

    iput v0, p0, Lcom/google/android/gms/tagmanager/ct;->ard:I

    iget-object v0, p0, Lcom/google/android/gms/tagmanager/ct;->aqU:Lcom/google/android/gms/tagmanager/ag;

    invoke-interface {v0, p1}, Lcom/google/android/gms/tagmanager/ag;->cA(Ljava/lang/String;)Lcom/google/android/gms/tagmanager/af;

    move-result-object v0

    new-instance v1, Ljava/util/HashSet;

    invoke-direct {v1}, Ljava/util/HashSet;-><init>()V

    invoke-interface {v0}, Lcom/google/android/gms/tagmanager/af;->on()Lcom/google/android/gms/tagmanager/bk;

    move-result-object v2

    invoke-direct {p0, p1, v1, v2}, Lcom/google/android/gms/tagmanager/ct;->a(Ljava/lang/String;Ljava/util/Set;Lcom/google/android/gms/tagmanager/bk;)Lcom/google/android/gms/tagmanager/bz;

    move-result-object p0

    invoke-interface {v0}, Lcom/google/android/gms/tagmanager/af;->op()V

    return-object p0
.end method

.method declared-synchronized cS(Ljava/lang/String;)V
    .locals 0

    monitor-enter p0

    :try_start_0
    iput-object p1, p0, Lcom/google/android/gms/tagmanager/ct;->arc:Ljava/lang/String;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit p0

    return-void

    :catchall_0
    move-exception p1

    monitor-exit p0

    throw p1
.end method

.method public declared-synchronized cp(Ljava/lang/String;)V
    .locals 6

    monitor-enter p0

    :try_start_0
    invoke-virtual {p0, p1}, Lcom/google/android/gms/tagmanager/ct;->cS(Ljava/lang/String;)V

    iget-object v0, p0, Lcom/google/android/gms/tagmanager/ct;->aqU:Lcom/google/android/gms/tagmanager/ag;

    invoke-interface {v0, p1}, Lcom/google/android/gms/tagmanager/ag;->cB(Ljava/lang/String;)Lcom/google/android/gms/tagmanager/af;

    move-result-object p1

    invoke-interface {p1}, Lcom/google/android/gms/tagmanager/af;->oo()Lcom/google/android/gms/tagmanager/t;

    move-result-object v0

    iget-object v1, p0, Lcom/google/android/gms/tagmanager/ct;->ara:Ljava/util/Set;

    invoke-interface {v0}, Lcom/google/android/gms/tagmanager/t;->oh()Lcom/google/android/gms/tagmanager/cs;

    move-result-object v2

    invoke-virtual {p0, v1, v2}, Lcom/google/android/gms/tagmanager/ct;->a(Ljava/util/Set;Lcom/google/android/gms/tagmanager/cs;)Lcom/google/android/gms/tagmanager/bz;

    move-result-object v1

    invoke-virtual {v1}, Lcom/google/android/gms/tagmanager/bz;->getObject()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/util/Set;

    invoke-interface {v1}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_0

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/google/android/gms/tagmanager/cr$a;

    iget-object v3, p0, Lcom/google/android/gms/tagmanager/ct;->aqV:Ljava/util/Map;

    new-instance v4, Ljava/util/HashSet;

    invoke-direct {v4}, Ljava/util/HashSet;-><init>()V

    invoke-interface {v0}, Lcom/google/android/gms/tagmanager/t;->og()Lcom/google/android/gms/tagmanager/ck;

    move-result-object v5

    invoke-direct {p0, v3, v2, v4, v5}, Lcom/google/android/gms/tagmanager/ct;->a(Ljava/util/Map;Lcom/google/android/gms/tagmanager/cr$a;Ljava/util/Set;Lcom/google/android/gms/tagmanager/ck;)Lcom/google/android/gms/tagmanager/bz;

    goto :goto_0

    :cond_0
    invoke-interface {p1}, Lcom/google/android/gms/tagmanager/af;->op()V

    const/4 p1, 0x0

    invoke-virtual {p0, p1}, Lcom/google/android/gms/tagmanager/ct;->cS(Ljava/lang/String;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit p0

    return-void

    :catchall_0
    move-exception p1

    monitor-exit p0

    throw p1
.end method

.method public declared-synchronized k(Ljava/util/List;)V
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/google/android/gms/internal/c$i;",
            ">;)V"
        }
    .end annotation

    monitor-enter p0

    :try_start_0
    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object p1

    :goto_0
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_2

    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/google/android/gms/internal/c$i;

    iget-object v1, v0, Lcom/google/android/gms/internal/c$i;->name:Ljava/lang/String;

    if-eqz v1, :cond_1

    iget-object v1, v0, Lcom/google/android/gms/internal/c$i;->name:Ljava/lang/String;

    const-string v2, "gaExperiment:"

    invoke-virtual {v1, v2}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v1

    if-nez v1, :cond_0

    goto :goto_1

    :cond_0
    iget-object v1, p0, Lcom/google/android/gms/tagmanager/ct;->aod:Lcom/google/android/gms/tagmanager/DataLayer;

    invoke-static {v1, v0}, Lcom/google/android/gms/tagmanager/ai;->a(Lcom/google/android/gms/tagmanager/DataLayer;Lcom/google/android/gms/internal/c$i;)V

    goto :goto_0

    :cond_1
    :goto_1
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Ignored supplemental: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/google/android/gms/tagmanager/bh;->V(Ljava/lang/String;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    goto :goto_0

    :cond_2
    monitor-exit p0

    return-void

    :catchall_0
    move-exception p1

    monitor-exit p0

    throw p1
.end method

.method declared-synchronized pn()Ljava/lang/String;
    .locals 1

    monitor-enter p0

    :try_start_0
    iget-object v0, p0, Lcom/google/android/gms/tagmanager/ct;->arc:Ljava/lang/String;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit p0

    return-object v0

    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method
