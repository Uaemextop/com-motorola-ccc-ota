.class public Lcom/google/android/gms/internal/j;
.super Lcom/google/android/gms/internal/i;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/google/android/gms/internal/j$a;
    }
.end annotation


# direct methods
.method protected constructor <init>(Landroid/content/Context;Lcom/google/android/gms/internal/m;Lcom/google/android/gms/internal/n;)V
    .locals 0

    invoke-direct {p0, p1, p2, p3}, Lcom/google/android/gms/internal/i;-><init>(Landroid/content/Context;Lcom/google/android/gms/internal/m;Lcom/google/android/gms/internal/n;)V

    return-void
.end method

.method public static a(Ljava/lang/String;Landroid/content/Context;)Lcom/google/android/gms/internal/j;
    .locals 3

    new-instance v0, Lcom/google/android/gms/internal/e;

    invoke-direct {v0}, Lcom/google/android/gms/internal/e;-><init>()V

    invoke-static {p0, p1, v0}, Lcom/google/android/gms/internal/j;->a(Ljava/lang/String;Landroid/content/Context;Lcom/google/android/gms/internal/m;)V

    new-instance p0, Lcom/google/android/gms/internal/j;

    new-instance v1, Lcom/google/android/gms/internal/p;

    const/16 v2, 0xef

    invoke-direct {v1, v2}, Lcom/google/android/gms/internal/p;-><init>(I)V

    invoke-direct {p0, p1, v0, v1}, Lcom/google/android/gms/internal/j;-><init>(Landroid/content/Context;Lcom/google/android/gms/internal/m;Lcom/google/android/gms/internal/n;)V

    return-object p0
.end method


# virtual methods
.method protected b(Landroid/content/Context;)V
    .locals 5

    invoke-super {p0, p1}, Lcom/google/android/gms/internal/i;->b(Landroid/content/Context;)V

    const/16 v0, 0x18

    :try_start_0
    invoke-virtual {p0, p1}, Lcom/google/android/gms/internal/j;->h(Landroid/content/Context;)Lcom/google/android/gms/internal/j$a;

    move-result-object v1

    invoke-virtual {v1}, Lcom/google/android/gms/internal/j$a;->isLimitAdTrackingEnabled()Z

    move-result v2

    if-eqz v2, :cond_0

    const-wide/16 v2, 0x1

    goto :goto_0

    :cond_0
    const-wide/16 v2, 0x0

    :goto_0
    const/16 v4, 0x1c

    invoke-virtual {p0, v4, v2, v3}, Lcom/google/android/gms/internal/j;->a(IJ)V

    invoke-virtual {v1}, Lcom/google/android/gms/internal/j$a;->getId()Ljava/lang/String;

    move-result-object v1

    if-eqz v1, :cond_1

    const/16 v2, 0x1a

    const-wide/16 v3, 0x5

    invoke-virtual {p0, v2, v3, v4}, Lcom/google/android/gms/internal/j;->a(IJ)V

    invoke-virtual {p0, v0, v1}, Lcom/google/android/gms/internal/j;->a(ILjava/lang/String;)V
    :try_end_0
    .catch Lcom/google/android/gms/common/GooglePlayServicesNotAvailableException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Lcom/google/android/gms/internal/i$a; {:try_start_0 .. :try_end_0} :catch_1

    goto :goto_1

    :catch_0
    :try_start_1
    invoke-static {p1}, Lcom/google/android/gms/internal/j;->d(Landroid/content/Context;)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p0, v0, p1}, Lcom/google/android/gms/internal/j;->a(ILjava/lang/String;)V
    :try_end_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_1
    .catch Lcom/google/android/gms/internal/i$a; {:try_start_1 .. :try_end_1} :catch_1

    :catch_1
    :cond_1
    :goto_1
    return-void
.end method

.method h(Landroid/content/Context;)Lcom/google/android/gms/internal/j$a;
    .locals 8
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lcom/google/android/gms/common/GooglePlayServicesNotAvailableException;
        }
    .end annotation

    :try_start_0
    invoke-static {p1}, Lcom/google/android/gms/ads/identifier/AdvertisingIdClient;->getAdvertisingIdInfo(Landroid/content/Context;)Lcom/google/android/gms/ads/identifier/AdvertisingIdClient$Info;

    move-result-object p1
    :try_end_0
    .catch Lcom/google/android/gms/common/GooglePlayServicesRepairableException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/lang/SecurityException; {:try_start_0 .. :try_end_0} :catch_0

    invoke-virtual {p1}, Lcom/google/android/gms/ads/identifier/AdvertisingIdClient$Info;->getId()Ljava/lang/String;

    move-result-object v0

    if-eqz v0, :cond_3

    const-string v1, "^[a-fA-F0-9]{8}-[a-fA-F0-9]{4}-[a-fA-F0-9]{4}-[a-fA-F0-9]{4}-[a-fA-F0-9]{12}$"

    invoke-virtual {v0, v1}, Ljava/lang/String;->matches(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_3

    const/16 v1, 0x10

    new-array v2, v1, [B

    const/4 v3, 0x0

    move v4, v3

    :goto_0
    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v5

    const/4 v6, 0x1

    if-ge v3, v5, :cond_2

    const/16 v5, 0x8

    if-eq v3, v5, :cond_0

    const/16 v5, 0xd

    if-eq v3, v5, :cond_0

    const/16 v5, 0x12

    if-eq v3, v5, :cond_0

    const/16 v5, 0x17

    if-ne v3, v5, :cond_1

    :cond_0
    add-int/lit8 v3, v3, 0x1

    :cond_1
    invoke-virtual {v0, v3}, Ljava/lang/String;->charAt(I)C

    move-result v5

    invoke-static {v5, v1}, Ljava/lang/Character;->digit(CI)I

    move-result v5

    shl-int/lit8 v5, v5, 0x4

    add-int/lit8 v7, v3, 0x1

    invoke-virtual {v0, v7}, Ljava/lang/String;->charAt(I)C

    move-result v7

    invoke-static {v7, v1}, Ljava/lang/Character;->digit(CI)I

    move-result v7

    add-int/2addr v5, v7

    int-to-byte v5, v5

    aput-byte v5, v2, v4

    add-int/2addr v4, v6

    add-int/lit8 v3, v3, 0x2

    goto :goto_0

    :cond_2
    iget-object v0, p0, Lcom/google/android/gms/internal/j;->ky:Lcom/google/android/gms/internal/m;

    invoke-interface {v0, v2, v6}, Lcom/google/android/gms/internal/m;->a([BZ)Ljava/lang/String;

    move-result-object v0

    :cond_3
    new-instance v1, Lcom/google/android/gms/internal/j$a;

    invoke-virtual {p1}, Lcom/google/android/gms/ads/identifier/AdvertisingIdClient$Info;->isLimitAdTrackingEnabled()Z

    move-result p1

    invoke-direct {v1, p0, v0, p1}, Lcom/google/android/gms/internal/j$a;-><init>(Lcom/google/android/gms/internal/j;Ljava/lang/String;Z)V

    return-object v1

    :catch_0
    move-exception p0

    new-instance p1, Ljava/io/IOException;

    invoke-direct {p1, p0}, Ljava/io/IOException;-><init>(Ljava/lang/Throwable;)V

    throw p1

    :catch_1
    move-exception p0

    new-instance p1, Ljava/io/IOException;

    invoke-direct {p1, p0}, Ljava/io/IOException;-><init>(Ljava/lang/Throwable;)V

    throw p1
.end method
