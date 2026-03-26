.class Lcom/google/android/gms/tagmanager/ai;
.super Ljava/lang/Object;


# direct methods
.method private static a(Lcom/google/android/gms/tagmanager/DataLayer;Lcom/google/android/gms/internal/c$d;)V
    .locals 3

    iget-object p1, p1, Lcom/google/android/gms/internal/c$d;->fB:[Lcom/google/android/gms/internal/d$a;

    array-length v0, p1

    const/4 v1, 0x0

    :goto_0
    if-ge v1, v0, :cond_0

    aget-object v2, p1, v1

    invoke-static {v2}, Lcom/google/android/gms/tagmanager/di;->j(Lcom/google/android/gms/internal/d$a;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {p0, v2}, Lcom/google/android/gms/tagmanager/DataLayer;->cv(Ljava/lang/String;)V

    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    :cond_0
    return-void
.end method

.method public static a(Lcom/google/android/gms/tagmanager/DataLayer;Lcom/google/android/gms/internal/c$i;)V
    .locals 1

    iget-object v0, p1, Lcom/google/android/gms/internal/c$i;->gq:Lcom/google/android/gms/internal/c$d;

    if-nez v0, :cond_0

    const-string p0, "supplemental missing experimentSupplemental"

    invoke-static {p0}, Lcom/google/android/gms/tagmanager/bh;->W(Ljava/lang/String;)V

    return-void

    :cond_0
    iget-object v0, p1, Lcom/google/android/gms/internal/c$i;->gq:Lcom/google/android/gms/internal/c$d;

    invoke-static {p0, v0}, Lcom/google/android/gms/tagmanager/ai;->a(Lcom/google/android/gms/tagmanager/DataLayer;Lcom/google/android/gms/internal/c$d;)V

    iget-object v0, p1, Lcom/google/android/gms/internal/c$i;->gq:Lcom/google/android/gms/internal/c$d;

    invoke-static {p0, v0}, Lcom/google/android/gms/tagmanager/ai;->b(Lcom/google/android/gms/tagmanager/DataLayer;Lcom/google/android/gms/internal/c$d;)V

    iget-object p1, p1, Lcom/google/android/gms/internal/c$i;->gq:Lcom/google/android/gms/internal/c$d;

    invoke-static {p0, p1}, Lcom/google/android/gms/tagmanager/ai;->c(Lcom/google/android/gms/tagmanager/DataLayer;Lcom/google/android/gms/internal/c$d;)V

    return-void
.end method

.method private static b(Lcom/google/android/gms/tagmanager/DataLayer;Lcom/google/android/gms/internal/c$d;)V
    .locals 3

    iget-object p1, p1, Lcom/google/android/gms/internal/c$d;->fA:[Lcom/google/android/gms/internal/d$a;

    array-length v0, p1

    const/4 v1, 0x0

    :goto_0
    if-ge v1, v0, :cond_1

    aget-object v2, p1, v1

    invoke-static {v2}, Lcom/google/android/gms/tagmanager/ai;->c(Lcom/google/android/gms/internal/d$a;)Ljava/util/Map;

    move-result-object v2

    if-eqz v2, :cond_0

    invoke-virtual {p0, v2}, Lcom/google/android/gms/tagmanager/DataLayer;->push(Ljava/util/Map;)V

    :cond_0
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    :cond_1
    return-void
.end method

.method private static c(Lcom/google/android/gms/internal/d$a;)Ljava/util/Map;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/google/android/gms/internal/d$a;",
            ")",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;"
        }
    .end annotation

    invoke-static {p0}, Lcom/google/android/gms/tagmanager/di;->o(Lcom/google/android/gms/internal/d$a;)Ljava/lang/Object;

    move-result-object p0

    instance-of v0, p0, Ljava/util/Map;

    if-nez v0, :cond_0

    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "value: "

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object p0

    const-string v0, " is not a map value, ignored."

    invoke-virtual {p0, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-static {p0}, Lcom/google/android/gms/tagmanager/bh;->W(Ljava/lang/String;)V

    const/4 p0, 0x0

    return-object p0

    :cond_0
    check-cast p0, Ljava/util/Map;

    return-object p0
.end method

.method private static c(Lcom/google/android/gms/tagmanager/DataLayer;Lcom/google/android/gms/internal/c$d;)V
    .locals 11

    iget-object p1, p1, Lcom/google/android/gms/internal/c$d;->fC:[Lcom/google/android/gms/internal/c$c;

    array-length v0, p1

    const/4 v1, 0x0

    :goto_0
    if-ge v1, v0, :cond_8

    aget-object v2, p1, v1

    iget-object v3, v2, Lcom/google/android/gms/internal/c$c;->fv:Ljava/lang/String;

    if-nez v3, :cond_0

    const-string v2, "GaExperimentRandom: No key"

    :goto_1
    invoke-static {v2}, Lcom/google/android/gms/tagmanager/bh;->W(Ljava/lang/String;)V

    goto/16 :goto_4

    :cond_0
    iget-object v3, v2, Lcom/google/android/gms/internal/c$c;->fv:Ljava/lang/String;

    invoke-virtual {p0, v3}, Lcom/google/android/gms/tagmanager/DataLayer;->get(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v3

    instance-of v4, v3, Ljava/lang/Number;

    if-nez v4, :cond_1

    const/4 v4, 0x0

    goto :goto_2

    :cond_1
    move-object v4, v3

    check-cast v4, Ljava/lang/Number;

    invoke-virtual {v4}, Ljava/lang/Number;->longValue()J

    move-result-wide v4

    invoke-static {v4, v5}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v4

    :goto_2
    iget-wide v5, v2, Lcom/google/android/gms/internal/c$c;->fw:J

    iget-wide v7, v2, Lcom/google/android/gms/internal/c$c;->fx:J

    iget-boolean v9, v2, Lcom/google/android/gms/internal/c$c;->fy:Z

    if-eqz v9, :cond_2

    if-eqz v4, :cond_2

    invoke-virtual {v4}, Ljava/lang/Long;->longValue()J

    move-result-wide v9

    cmp-long v9, v9, v5

    if-ltz v9, :cond_2

    invoke-virtual {v4}, Ljava/lang/Long;->longValue()J

    move-result-wide v9

    cmp-long v4, v9, v7

    if-lez v4, :cond_3

    :cond_2
    cmp-long v3, v5, v7

    if-gtz v3, :cond_7

    invoke-static {}, Ljava/lang/Math;->random()D

    move-result-wide v3

    sub-long/2addr v7, v5

    long-to-double v7, v7

    mul-double/2addr v3, v7

    long-to-double v5, v5

    add-double/2addr v3, v5

    invoke-static {v3, v4}, Ljava/lang/Math;->round(D)J

    move-result-wide v3

    invoke-static {v3, v4}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v3

    :cond_3
    iget-object v4, v2, Lcom/google/android/gms/internal/c$c;->fv:Ljava/lang/String;

    invoke-virtual {p0, v4}, Lcom/google/android/gms/tagmanager/DataLayer;->cv(Ljava/lang/String;)V

    iget-object v4, v2, Lcom/google/android/gms/internal/c$c;->fv:Ljava/lang/String;

    invoke-virtual {p0, v4, v3}, Lcom/google/android/gms/tagmanager/DataLayer;->c(Ljava/lang/String;Ljava/lang/Object;)Ljava/util/Map;

    move-result-object v3

    iget-wide v4, v2, Lcom/google/android/gms/internal/c$c;->fz:J

    const-wide/16 v6, 0x0

    cmp-long v4, v4, v6

    if-lez v4, :cond_6

    const-string v4, "gtm"

    invoke-interface {v3, v4}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v5

    const-string v6, "lifetime"

    if-nez v5, :cond_4

    iget-wide v7, v2, Lcom/google/android/gms/internal/c$c;->fz:J

    invoke-static {v7, v8}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v2

    filled-new-array {v6, v2}, [Ljava/lang/Object;

    move-result-object v2

    invoke-static {v2}, Lcom/google/android/gms/tagmanager/DataLayer;->mapOf([Ljava/lang/Object;)Ljava/util/Map;

    move-result-object v2

    invoke-interface {v3, v4, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_3

    :cond_4
    invoke-interface {v3, v4}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v4

    instance-of v5, v4, Ljava/util/Map;

    if-eqz v5, :cond_5

    check-cast v4, Ljava/util/Map;

    iget-wide v7, v2, Lcom/google/android/gms/internal/c$c;->fz:J

    invoke-static {v7, v8}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v2

    invoke-interface {v4, v6, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_3

    :cond_5
    const-string v2, "GaExperimentRandom: gtm not a map"

    invoke-static {v2}, Lcom/google/android/gms/tagmanager/bh;->W(Ljava/lang/String;)V

    :cond_6
    :goto_3
    invoke-virtual {p0, v3}, Lcom/google/android/gms/tagmanager/DataLayer;->push(Ljava/util/Map;)V

    goto :goto_4

    :cond_7
    const-string v2, "GaExperimentRandom: random range invalid"

    goto/16 :goto_1

    :goto_4
    add-int/lit8 v1, v1, 0x1

    goto/16 :goto_0

    :cond_8
    return-void
.end method
