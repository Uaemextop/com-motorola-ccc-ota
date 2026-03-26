.class public final Lcom/google/android/gms/internal/ew;
.super Lcom/google/android/gms/internal/et$a;


# annotations
.annotation runtime Lcom/google/android/gms/internal/ez;
.end annotation


# instance fields
.field private final oE:Lcom/google/android/gms/ads/doubleclick/b;

.field private final sQ:Lcom/google/android/gms/ads/doubleclick/PublisherAdView;


# direct methods
.method public constructor <init>(Lcom/google/android/gms/ads/doubleclick/b;Lcom/google/android/gms/ads/doubleclick/PublisherAdView;)V
    .locals 0

    invoke-direct {p0}, Lcom/google/android/gms/internal/et$a;-><init>()V

    iput-object p1, p0, Lcom/google/android/gms/internal/ew;->oE:Lcom/google/android/gms/ads/doubleclick/b;

    iput-object p2, p0, Lcom/google/android/gms/internal/ew;->sQ:Lcom/google/android/gms/ads/doubleclick/PublisherAdView;

    return-void
.end method


# virtual methods
.method public a(Lcom/google/android/gms/internal/es;)V
    .locals 2

    iget-object v0, p0, Lcom/google/android/gms/internal/ew;->oE:Lcom/google/android/gms/ads/doubleclick/b;

    iget-object p0, p0, Lcom/google/android/gms/internal/ew;->sQ:Lcom/google/android/gms/ads/doubleclick/PublisherAdView;

    new-instance v1, Lcom/google/android/gms/internal/ev;

    invoke-direct {v1, p1}, Lcom/google/android/gms/internal/ev;-><init>(Lcom/google/android/gms/internal/es;)V

    invoke-interface {v0, p0, v1}, Lcom/google/android/gms/ads/doubleclick/b;->a(Lcom/google/android/gms/ads/doubleclick/PublisherAdView;Lcom/google/android/gms/ads/doubleclick/a;)V

    return-void
.end method

.method public e(Ljava/lang/String;Ljava/lang/String;)Z
    .locals 1

    iget-object v0, p0, Lcom/google/android/gms/internal/ew;->oE:Lcom/google/android/gms/ads/doubleclick/b;

    iget-object p0, p0, Lcom/google/android/gms/internal/ew;->sQ:Lcom/google/android/gms/ads/doubleclick/PublisherAdView;

    invoke-interface {v0, p0, p1, p2}, Lcom/google/android/gms/ads/doubleclick/b;->a(Lcom/google/android/gms/ads/doubleclick/PublisherAdView;Ljava/lang/String;Ljava/lang/String;)Z

    move-result p0

    return p0
.end method
