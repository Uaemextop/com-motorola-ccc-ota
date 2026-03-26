.class public final Lcom/google/android/gms/internal/bg;
.super Ljava/lang/Object;


# annotations
.annotation runtime Lcom/google/android/gms/internal/ez;
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/google/android/gms/internal/bg$a;
    }
.end annotation


# static fields
.field public static final DEVICE_ID_EMULATOR:Ljava/lang/String;


# instance fields
.field private final d:Ljava/util/Date;

.field private final f:Ljava/util/Set;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Set<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private final h:Landroid/location/Location;

.field private final ol:Ljava/lang/String;

.field private final om:I

.field private final on:Z

.field private final oo:Landroid/os/Bundle;

.field private final op:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/Class<",
            "+",
            "Lcom/google/android/gms/ads/mediation/NetworkExtras;",
            ">;",
            "Lcom/google/android/gms/ads/mediation/NetworkExtras;",
            ">;"
        }
    .end annotation
.end field

.field private final oq:Ljava/lang/String;

.field private final or:Lcom/google/android/gms/ads/search/SearchAdRequest;

.field private final os:I

.field private final ot:Ljava/util/Set;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Set<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 1

    const-string v0, "emulator"

    invoke-static {v0}, Lcom/google/android/gms/internal/gr;->R(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/google/android/gms/internal/bg;->DEVICE_ID_EMULATOR:Ljava/lang/String;

    return-void
.end method

.method public constructor <init>(Lcom/google/android/gms/internal/bg$a;)V
    .locals 1

    const/4 v0, 0x0

    invoke-direct {p0, p1, v0}, Lcom/google/android/gms/internal/bg;-><init>(Lcom/google/android/gms/internal/bg$a;Lcom/google/android/gms/ads/search/SearchAdRequest;)V

    return-void
.end method

.method public constructor <init>(Lcom/google/android/gms/internal/bg$a;Lcom/google/android/gms/ads/search/SearchAdRequest;)V
    .locals 1

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    invoke-static {p1}, Lcom/google/android/gms/internal/bg$a;->a(Lcom/google/android/gms/internal/bg$a;)Ljava/util/Date;

    move-result-object v0

    iput-object v0, p0, Lcom/google/android/gms/internal/bg;->d:Ljava/util/Date;

    invoke-static {p1}, Lcom/google/android/gms/internal/bg$a;->b(Lcom/google/android/gms/internal/bg$a;)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/google/android/gms/internal/bg;->ol:Ljava/lang/String;

    invoke-static {p1}, Lcom/google/android/gms/internal/bg$a;->c(Lcom/google/android/gms/internal/bg$a;)I

    move-result v0

    iput v0, p0, Lcom/google/android/gms/internal/bg;->om:I

    invoke-static {p1}, Lcom/google/android/gms/internal/bg$a;->d(Lcom/google/android/gms/internal/bg$a;)Ljava/util/HashSet;

    move-result-object v0

    invoke-static {v0}, Ljava/util/Collections;->unmodifiableSet(Ljava/util/Set;)Ljava/util/Set;

    move-result-object v0

    iput-object v0, p0, Lcom/google/android/gms/internal/bg;->f:Ljava/util/Set;

    invoke-static {p1}, Lcom/google/android/gms/internal/bg$a;->e(Lcom/google/android/gms/internal/bg$a;)Landroid/location/Location;

    move-result-object v0

    iput-object v0, p0, Lcom/google/android/gms/internal/bg;->h:Landroid/location/Location;

    invoke-static {p1}, Lcom/google/android/gms/internal/bg$a;->f(Lcom/google/android/gms/internal/bg$a;)Z

    move-result v0

    iput-boolean v0, p0, Lcom/google/android/gms/internal/bg;->on:Z

    invoke-static {p1}, Lcom/google/android/gms/internal/bg$a;->g(Lcom/google/android/gms/internal/bg$a;)Landroid/os/Bundle;

    move-result-object v0

    iput-object v0, p0, Lcom/google/android/gms/internal/bg;->oo:Landroid/os/Bundle;

    invoke-static {p1}, Lcom/google/android/gms/internal/bg$a;->h(Lcom/google/android/gms/internal/bg$a;)Ljava/util/HashMap;

    move-result-object v0

    invoke-static {v0}, Ljava/util/Collections;->unmodifiableMap(Ljava/util/Map;)Ljava/util/Map;

    move-result-object v0

    iput-object v0, p0, Lcom/google/android/gms/internal/bg;->op:Ljava/util/Map;

    invoke-static {p1}, Lcom/google/android/gms/internal/bg$a;->i(Lcom/google/android/gms/internal/bg$a;)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/google/android/gms/internal/bg;->oq:Ljava/lang/String;

    iput-object p2, p0, Lcom/google/android/gms/internal/bg;->or:Lcom/google/android/gms/ads/search/SearchAdRequest;

    invoke-static {p1}, Lcom/google/android/gms/internal/bg$a;->j(Lcom/google/android/gms/internal/bg$a;)I

    move-result p2

    iput p2, p0, Lcom/google/android/gms/internal/bg;->os:I

    invoke-static {p1}, Lcom/google/android/gms/internal/bg$a;->k(Lcom/google/android/gms/internal/bg$a;)Ljava/util/HashSet;

    move-result-object p1

    invoke-static {p1}, Ljava/util/Collections;->unmodifiableSet(Ljava/util/Set;)Ljava/util/Set;

    move-result-object p1

    iput-object p1, p0, Lcom/google/android/gms/internal/bg;->ot:Ljava/util/Set;

    return-void
.end method


# virtual methods
.method public bd()Lcom/google/android/gms/ads/search/SearchAdRequest;
    .locals 0

    iget-object p0, p0, Lcom/google/android/gms/internal/bg;->or:Lcom/google/android/gms/ads/search/SearchAdRequest;

    return-object p0
.end method

.method public be()Ljava/util/Map;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Map<",
            "Ljava/lang/Class<",
            "+",
            "Lcom/google/android/gms/ads/mediation/NetworkExtras;",
            ">;",
            "Lcom/google/android/gms/ads/mediation/NetworkExtras;",
            ">;"
        }
    .end annotation

    iget-object p0, p0, Lcom/google/android/gms/internal/bg;->op:Ljava/util/Map;

    return-object p0
.end method

.method public bf()Landroid/os/Bundle;
    .locals 0

    iget-object p0, p0, Lcom/google/android/gms/internal/bg;->oo:Landroid/os/Bundle;

    return-object p0
.end method

.method public bg()I
    .locals 0

    iget p0, p0, Lcom/google/android/gms/internal/bg;->os:I

    return p0
.end method

.method public getBirthday()Ljava/util/Date;
    .locals 0

    iget-object p0, p0, Lcom/google/android/gms/internal/bg;->d:Ljava/util/Date;

    return-object p0
.end method

.method public getContentUrl()Ljava/lang/String;
    .locals 0

    iget-object p0, p0, Lcom/google/android/gms/internal/bg;->ol:Ljava/lang/String;

    return-object p0
.end method

.method public getCustomEventExtrasBundle(Ljava/lang/Class;)Landroid/os/Bundle;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Class<",
            "+",
            "Lcom/google/android/gms/ads/mediation/customevent/CustomEvent;",
            ">;)",
            "Landroid/os/Bundle;"
        }
    .end annotation

    iget-object p0, p0, Lcom/google/android/gms/internal/bg;->oo:Landroid/os/Bundle;

    const-string v0, "com.google.android.gms.ads.mediation.customevent.CustomEventAdapter"

    invoke-virtual {p0, v0}, Landroid/os/Bundle;->getBundle(Ljava/lang/String;)Landroid/os/Bundle;

    move-result-object p0

    if-eqz p0, :cond_0

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p0, p1}, Landroid/os/Bundle;->getBundle(Ljava/lang/String;)Landroid/os/Bundle;

    move-result-object p0

    goto :goto_0

    :cond_0
    const/4 p0, 0x0

    :goto_0
    return-object p0
.end method

.method public getGender()I
    .locals 0

    iget p0, p0, Lcom/google/android/gms/internal/bg;->om:I

    return p0
.end method

.method public getKeywords()Ljava/util/Set;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Set<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    iget-object p0, p0, Lcom/google/android/gms/internal/bg;->f:Ljava/util/Set;

    return-object p0
.end method

.method public getLocation()Landroid/location/Location;
    .locals 0

    iget-object p0, p0, Lcom/google/android/gms/internal/bg;->h:Landroid/location/Location;

    return-object p0
.end method

.method public getManualImpressionsEnabled()Z
    .locals 0

    iget-boolean p0, p0, Lcom/google/android/gms/internal/bg;->on:Z

    return p0
.end method

.method public getNetworkExtras(Ljava/lang/Class;)Lcom/google/android/gms/ads/mediation/NetworkExtras;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T::",
            "Lcom/google/android/gms/ads/mediation/NetworkExtras;",
            ">(",
            "Ljava/lang/Class<",
            "TT;>;)TT;"
        }
    .end annotation

    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    iget-object p0, p0, Lcom/google/android/gms/internal/bg;->op:Ljava/util/Map;

    invoke-interface {p0, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lcom/google/android/gms/ads/mediation/NetworkExtras;

    return-object p0
.end method

.method public getNetworkExtrasBundle(Ljava/lang/Class;)Landroid/os/Bundle;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Class<",
            "+",
            "Lcom/google/android/gms/ads/mediation/MediationAdapter;",
            ">;)",
            "Landroid/os/Bundle;"
        }
    .end annotation

    iget-object p0, p0, Lcom/google/android/gms/internal/bg;->oo:Landroid/os/Bundle;

    invoke-virtual {p1}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p0, p1}, Landroid/os/Bundle;->getBundle(Ljava/lang/String;)Landroid/os/Bundle;

    move-result-object p0

    return-object p0
.end method

.method public getPublisherProvidedId()Ljava/lang/String;
    .locals 0

    iget-object p0, p0, Lcom/google/android/gms/internal/bg;->oq:Ljava/lang/String;

    return-object p0
.end method

.method public isTestDevice(Landroid/content/Context;)Z
    .locals 0

    iget-object p0, p0, Lcom/google/android/gms/internal/bg;->ot:Ljava/util/Set;

    invoke-static {p1}, Lcom/google/android/gms/internal/gr;->v(Landroid/content/Context;)Ljava/lang/String;

    move-result-object p1

    invoke-interface {p0, p1}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result p0

    return p0
.end method
