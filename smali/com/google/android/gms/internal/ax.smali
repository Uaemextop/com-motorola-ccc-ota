.class public Lcom/google/android/gms/internal/ax;
.super Ljava/lang/Object;


# annotations
.annotation runtime Lcom/google/android/gms/internal/ez;
.end annotation


# static fields
.field public static final oe:Lcom/google/android/gms/internal/ax;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    new-instance v0, Lcom/google/android/gms/internal/ax;

    invoke-direct {v0}, Lcom/google/android/gms/internal/ax;-><init>()V

    sput-object v0, Lcom/google/android/gms/internal/ax;->oe:Lcom/google/android/gms/internal/ax;

    return-void
.end method

.method private constructor <init>()V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static bb()Lcom/google/android/gms/internal/ax;
    .locals 1

    sget-object v0, Lcom/google/android/gms/internal/ax;->oe:Lcom/google/android/gms/internal/ax;

    return-object v0
.end method


# virtual methods
.method public a(Landroid/content/Context;Lcom/google/android/gms/internal/bg;)Lcom/google/android/gms/internal/av;
    .locals 18

    move-object/from16 v0, p2

    invoke-virtual/range {p2 .. p2}, Lcom/google/android/gms/internal/bg;->getBirthday()Ljava/util/Date;

    move-result-object v1

    if-eqz v1, :cond_0

    invoke-virtual {v1}, Ljava/util/Date;->getTime()J

    move-result-wide v1

    goto :goto_0

    :cond_0
    const-wide/16 v1, -0x1

    :goto_0
    move-wide v5, v1

    invoke-virtual/range {p2 .. p2}, Lcom/google/android/gms/internal/bg;->getContentUrl()Ljava/lang/String;

    move-result-object v16

    invoke-virtual/range {p2 .. p2}, Lcom/google/android/gms/internal/bg;->getGender()I

    move-result v8

    invoke-virtual/range {p2 .. p2}, Lcom/google/android/gms/internal/bg;->getKeywords()Ljava/util/Set;

    move-result-object v1

    invoke-interface {v1}, Ljava/util/Set;->isEmpty()Z

    move-result v2

    const/4 v3, 0x0

    if-nez v2, :cond_1

    new-instance v2, Ljava/util/ArrayList;

    invoke-direct {v2, v1}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    invoke-static {v2}, Ljava/util/Collections;->unmodifiableList(Ljava/util/List;)Ljava/util/List;

    move-result-object v1

    move-object v9, v1

    move-object/from16 v1, p1

    goto :goto_1

    :cond_1
    move-object/from16 v1, p1

    move-object v9, v3

    :goto_1
    invoke-virtual {v0, v1}, Lcom/google/android/gms/internal/bg;->isTestDevice(Landroid/content/Context;)Z

    move-result v10

    invoke-virtual/range {p2 .. p2}, Lcom/google/android/gms/internal/bg;->bg()I

    move-result v11

    invoke-virtual/range {p2 .. p2}, Lcom/google/android/gms/internal/bg;->getLocation()Landroid/location/Location;

    move-result-object v15

    const-class v1, Lcom/google/ads/mediation/admob/AdMobAdapter;

    invoke-virtual {v0, v1}, Lcom/google/android/gms/internal/bg;->getNetworkExtrasBundle(Ljava/lang/Class;)Landroid/os/Bundle;

    move-result-object v7

    invoke-virtual/range {p2 .. p2}, Lcom/google/android/gms/internal/bg;->getManualImpressionsEnabled()Z

    move-result v12

    invoke-virtual/range {p2 .. p2}, Lcom/google/android/gms/internal/bg;->getPublisherProvidedId()Ljava/lang/String;

    move-result-object v13

    invoke-virtual/range {p2 .. p2}, Lcom/google/android/gms/internal/bg;->bd()Lcom/google/android/gms/ads/search/SearchAdRequest;

    move-result-object v1

    if-eqz v1, :cond_2

    new-instance v2, Lcom/google/android/gms/internal/bj;

    invoke-direct {v2, v1}, Lcom/google/android/gms/internal/bj;-><init>(Lcom/google/android/gms/ads/search/SearchAdRequest;)V

    move-object v14, v2

    goto :goto_2

    :cond_2
    move-object v14, v3

    :goto_2
    new-instance v1, Lcom/google/android/gms/internal/av;

    invoke-virtual/range {p2 .. p2}, Lcom/google/android/gms/internal/bg;->bf()Landroid/os/Bundle;

    move-result-object v17

    const/4 v4, 0x4

    move-object v3, v1

    invoke-direct/range {v3 .. v17}, Lcom/google/android/gms/internal/av;-><init>(IJLandroid/os/Bundle;ILjava/util/List;ZIZLjava/lang/String;Lcom/google/android/gms/internal/bj;Landroid/location/Location;Ljava/lang/String;Landroid/os/Bundle;)V

    return-object v1
.end method
