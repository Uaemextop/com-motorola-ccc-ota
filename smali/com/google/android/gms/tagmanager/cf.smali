.class Lcom/google/android/gms/tagmanager/cf;
.super Lcom/google/android/gms/tagmanager/aj;


# static fields
.field private static final ID:Ljava/lang/String;

.field private static final aql:Ljava/lang/String;

.field private static final aqm:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    sget-object v0, Lcom/google/android/gms/internal/a;->Q:Lcom/google/android/gms/internal/a;

    invoke-virtual {v0}, Lcom/google/android/gms/internal/a;->toString()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/google/android/gms/tagmanager/cf;->ID:Ljava/lang/String;

    sget-object v0, Lcom/google/android/gms/internal/b;->dz:Lcom/google/android/gms/internal/b;

    invoke-virtual {v0}, Lcom/google/android/gms/internal/b;->toString()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/google/android/gms/tagmanager/cf;->aql:Ljava/lang/String;

    sget-object v0, Lcom/google/android/gms/internal/b;->dy:Lcom/google/android/gms/internal/b;

    invoke-virtual {v0}, Lcom/google/android/gms/internal/b;->toString()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/google/android/gms/tagmanager/cf;->aqm:Ljava/lang/String;

    return-void
.end method

.method public constructor <init>()V
    .locals 2

    sget-object v0, Lcom/google/android/gms/tagmanager/cf;->ID:Ljava/lang/String;

    const/4 v1, 0x0

    new-array v1, v1, [Ljava/lang/String;

    invoke-direct {p0, v0, v1}, Lcom/google/android/gms/tagmanager/aj;-><init>(Ljava/lang/String;[Ljava/lang/String;)V

    return-void
.end method


# virtual methods
.method public C(Ljava/util/Map;)Lcom/google/android/gms/internal/d$a;
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Lcom/google/android/gms/internal/d$a;",
            ">;)",
            "Lcom/google/android/gms/internal/d$a;"
        }
    .end annotation

    sget-object p0, Lcom/google/android/gms/tagmanager/cf;->aql:Ljava/lang/String;

    invoke-interface {p1, p0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lcom/google/android/gms/internal/d$a;

    sget-object v0, Lcom/google/android/gms/tagmanager/cf;->aqm:Ljava/lang/String;

    invoke-interface {p1, v0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lcom/google/android/gms/internal/d$a;

    if-eqz p0, :cond_0

    invoke-static {}, Lcom/google/android/gms/tagmanager/di;->pK()Lcom/google/android/gms/internal/d$a;

    move-result-object v0

    if-eq p0, v0, :cond_0

    if-eqz p1, :cond_0

    invoke-static {}, Lcom/google/android/gms/tagmanager/di;->pK()Lcom/google/android/gms/internal/d$a;

    move-result-object v0

    if-eq p1, v0, :cond_0

    invoke-static {p0}, Lcom/google/android/gms/tagmanager/di;->k(Lcom/google/android/gms/internal/d$a;)Lcom/google/android/gms/tagmanager/dh;

    move-result-object p0

    invoke-static {p1}, Lcom/google/android/gms/tagmanager/di;->k(Lcom/google/android/gms/internal/d$a;)Lcom/google/android/gms/tagmanager/dh;

    move-result-object p1

    invoke-static {}, Lcom/google/android/gms/tagmanager/di;->pI()Lcom/google/android/gms/tagmanager/dh;

    move-result-object v0

    if-eq p0, v0, :cond_0

    invoke-static {}, Lcom/google/android/gms/tagmanager/di;->pI()Lcom/google/android/gms/tagmanager/dh;

    move-result-object v0

    if-eq p1, v0, :cond_0

    invoke-virtual {p0}, Lcom/google/android/gms/tagmanager/dh;->doubleValue()D

    move-result-wide v0

    invoke-virtual {p1}, Lcom/google/android/gms/tagmanager/dh;->doubleValue()D

    move-result-wide p0

    cmpg-double v2, v0, p0

    if-gtz v2, :cond_0

    goto :goto_0

    :cond_0
    const-wide/16 v0, 0x0

    const-wide p0, 0x41dfffffffc00000L    # 2.147483647E9

    :goto_0
    invoke-static {}, Ljava/lang/Math;->random()D

    move-result-wide v2

    sub-double/2addr p0, v0

    mul-double/2addr v2, p0

    add-double/2addr v2, v0

    invoke-static {v2, v3}, Ljava/lang/Math;->round(D)J

    move-result-wide p0

    invoke-static {p0, p1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object p0

    invoke-static {p0}, Lcom/google/android/gms/tagmanager/di;->u(Ljava/lang/Object;)Lcom/google/android/gms/internal/d$a;

    move-result-object p0

    return-object p0
.end method

.method public nN()Z
    .locals 0

    const/4 p0, 0x0

    return p0
.end method
