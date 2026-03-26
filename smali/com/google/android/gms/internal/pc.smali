.class public final Lcom/google/android/gms/internal/pc;
.super Ljava/lang/Object;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/google/android/gms/internal/pc$a;
    }
.end annotation


# direct methods
.method private static a(Ljava/lang/String;[Lcom/google/android/gms/internal/pd$a$a;)I
    .locals 7

    array-length v0, p1

    const/16 v1, 0xe

    const/4 v2, 0x0

    move v3, v1

    :goto_0
    if-ge v2, v0, :cond_5

    aget-object v4, p1, v2

    iget v5, v4, Lcom/google/android/gms/internal/pd$a$a;->type:I

    if-ne v3, v1, :cond_3

    const/16 v6, 0x9

    if-eq v5, v6, :cond_2

    iget v5, v4, Lcom/google/android/gms/internal/pd$a$a;->type:I

    const/4 v6, 0x2

    if-eq v5, v6, :cond_2

    iget v5, v4, Lcom/google/android/gms/internal/pd$a$a;->type:I

    const/4 v6, 0x6

    if-ne v5, v6, :cond_0

    goto :goto_1

    :cond_0
    iget v5, v4, Lcom/google/android/gms/internal/pd$a$a;->type:I

    if-ne v5, v1, :cond_1

    goto :goto_2

    :cond_1
    new-instance p1, Ljava/lang/IllegalArgumentException;

    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "Unexpected TypedValue type: "

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget v1, v4, Lcom/google/android/gms/internal/pd$a$a;->type:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, " for key "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-direct {p1, p0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1

    :cond_2
    :goto_1
    iget v3, v4, Lcom/google/android/gms/internal/pd$a$a;->type:I

    goto :goto_2

    :cond_3
    if-ne v5, v3, :cond_4

    :goto_2
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    :cond_4
    new-instance p1, Ljava/lang/IllegalArgumentException;

    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "The ArrayList elements should all be the same type, but ArrayList with key "

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p0

    const-string v0, " contains items of type "

    invoke-virtual {p0, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p0

    invoke-virtual {p0, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object p0

    const-string v0, " and "

    invoke-virtual {p0, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p0

    iget v0, v4, Lcom/google/android/gms/internal/pd$a$a;->type:I

    invoke-virtual {p0, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-direct {p1, p0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1

    :cond_5
    return v3
.end method

.method static a(Ljava/util/List;Lcom/google/android/gms/wearable/Asset;)I
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/google/android/gms/wearable/Asset;",
            ">;",
            "Lcom/google/android/gms/wearable/Asset;",
            ")I"
        }
    .end annotation

    invoke-interface {p0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    invoke-interface {p0}, Ljava/util/List;->size()I

    move-result p0

    add-int/lit8 p0, p0, -0x1

    return p0
.end method

.method public static a(Lcom/google/android/gms/wearable/DataMap;)Lcom/google/android/gms/internal/pc$a;
    .locals 2

    new-instance v0, Lcom/google/android/gms/internal/pd;

    invoke-direct {v0}, Lcom/google/android/gms/internal/pd;-><init>()V

    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    invoke-static {p0, v1}, Lcom/google/android/gms/internal/pc;->a(Lcom/google/android/gms/wearable/DataMap;Ljava/util/List;)[Lcom/google/android/gms/internal/pd$a;

    move-result-object p0

    iput-object p0, v0, Lcom/google/android/gms/internal/pd;->awd:[Lcom/google/android/gms/internal/pd$a;

    new-instance p0, Lcom/google/android/gms/internal/pc$a;

    invoke-direct {p0, v0, v1}, Lcom/google/android/gms/internal/pc$a;-><init>(Lcom/google/android/gms/internal/pd;Ljava/util/List;)V

    return-object p0
.end method

.method private static a(Ljava/util/List;Ljava/lang/Object;)Lcom/google/android/gms/internal/pd$a$a;
    .locals 13
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/google/android/gms/wearable/Asset;",
            ">;",
            "Ljava/lang/Object;",
            ")",
            "Lcom/google/android/gms/internal/pd$a$a;"
        }
    .end annotation

    new-instance v0, Lcom/google/android/gms/internal/pd$a$a;

    invoke-direct {v0}, Lcom/google/android/gms/internal/pd$a$a;-><init>()V

    const/16 v1, 0xe

    if-nez p1, :cond_0

    iput v1, v0, Lcom/google/android/gms/internal/pd$a$a;->type:I

    return-object v0

    :cond_0
    new-instance v2, Lcom/google/android/gms/internal/pd$a$a$a;

    invoke-direct {v2}, Lcom/google/android/gms/internal/pd$a$a$a;-><init>()V

    iput-object v2, v0, Lcom/google/android/gms/internal/pd$a$a;->awh:Lcom/google/android/gms/internal/pd$a$a$a;

    instance-of v2, p1, Ljava/lang/String;

    const/4 v3, 0x2

    if-eqz v2, :cond_1

    iput v3, v0, Lcom/google/android/gms/internal/pd$a$a;->type:I

    iget-object p0, v0, Lcom/google/android/gms/internal/pd$a$a;->awh:Lcom/google/android/gms/internal/pd$a$a$a;

    check-cast p1, Ljava/lang/String;

    iput-object p1, p0, Lcom/google/android/gms/internal/pd$a$a$a;->awj:Ljava/lang/String;

    goto/16 :goto_4

    :cond_1
    instance-of v2, p1, Ljava/lang/Integer;

    const/4 v4, 0x6

    if-eqz v2, :cond_2

    iput v4, v0, Lcom/google/android/gms/internal/pd$a$a;->type:I

    iget-object p0, v0, Lcom/google/android/gms/internal/pd$a$a;->awh:Lcom/google/android/gms/internal/pd$a$a$a;

    check-cast p1, Ljava/lang/Integer;

    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    move-result p1

    iput p1, p0, Lcom/google/android/gms/internal/pd$a$a$a;->awn:I

    goto/16 :goto_4

    :cond_2
    instance-of v2, p1, Ljava/lang/Long;

    if-eqz v2, :cond_3

    const/4 p0, 0x5

    iput p0, v0, Lcom/google/android/gms/internal/pd$a$a;->type:I

    iget-object p0, v0, Lcom/google/android/gms/internal/pd$a$a;->awh:Lcom/google/android/gms/internal/pd$a$a$a;

    check-cast p1, Ljava/lang/Long;

    invoke-virtual {p1}, Ljava/lang/Long;->longValue()J

    move-result-wide v1

    iput-wide v1, p0, Lcom/google/android/gms/internal/pd$a$a$a;->awm:J

    goto/16 :goto_4

    :cond_3
    instance-of v2, p1, Ljava/lang/Double;

    if-eqz v2, :cond_4

    const/4 p0, 0x3

    iput p0, v0, Lcom/google/android/gms/internal/pd$a$a;->type:I

    iget-object p0, v0, Lcom/google/android/gms/internal/pd$a$a;->awh:Lcom/google/android/gms/internal/pd$a$a$a;

    check-cast p1, Ljava/lang/Double;

    invoke-virtual {p1}, Ljava/lang/Double;->doubleValue()D

    move-result-wide v1

    iput-wide v1, p0, Lcom/google/android/gms/internal/pd$a$a$a;->awk:D

    goto/16 :goto_4

    :cond_4
    instance-of v2, p1, Ljava/lang/Float;

    if-eqz v2, :cond_5

    const/4 p0, 0x4

    iput p0, v0, Lcom/google/android/gms/internal/pd$a$a;->type:I

    iget-object p0, v0, Lcom/google/android/gms/internal/pd$a$a;->awh:Lcom/google/android/gms/internal/pd$a$a$a;

    check-cast p1, Ljava/lang/Float;

    invoke-virtual {p1}, Ljava/lang/Float;->floatValue()F

    move-result p1

    iput p1, p0, Lcom/google/android/gms/internal/pd$a$a$a;->awl:F

    goto/16 :goto_4

    :cond_5
    instance-of v2, p1, Ljava/lang/Boolean;

    if-eqz v2, :cond_6

    const/16 p0, 0x8

    iput p0, v0, Lcom/google/android/gms/internal/pd$a$a;->type:I

    iget-object p0, v0, Lcom/google/android/gms/internal/pd$a$a;->awh:Lcom/google/android/gms/internal/pd$a$a$a;

    check-cast p1, Ljava/lang/Boolean;

    invoke-virtual {p1}, Ljava/lang/Boolean;->booleanValue()Z

    move-result p1

    iput-boolean p1, p0, Lcom/google/android/gms/internal/pd$a$a$a;->awp:Z

    goto/16 :goto_4

    :cond_6
    instance-of v2, p1, Ljava/lang/Byte;

    if-eqz v2, :cond_7

    const/4 p0, 0x7

    iput p0, v0, Lcom/google/android/gms/internal/pd$a$a;->type:I

    iget-object p0, v0, Lcom/google/android/gms/internal/pd$a$a;->awh:Lcom/google/android/gms/internal/pd$a$a$a;

    check-cast p1, Ljava/lang/Byte;

    invoke-virtual {p1}, Ljava/lang/Byte;->byteValue()B

    move-result p1

    iput p1, p0, Lcom/google/android/gms/internal/pd$a$a$a;->awo:I

    goto/16 :goto_4

    :cond_7
    instance-of v2, p1, [B

    const/4 v5, 0x1

    if-eqz v2, :cond_8

    iput v5, v0, Lcom/google/android/gms/internal/pd$a$a;->type:I

    iget-object p0, v0, Lcom/google/android/gms/internal/pd$a$a;->awh:Lcom/google/android/gms/internal/pd$a$a$a;

    check-cast p1, [B

    check-cast p1, [B

    iput-object p1, p0, Lcom/google/android/gms/internal/pd$a$a$a;->awi:[B

    goto/16 :goto_4

    :cond_8
    instance-of v2, p1, [Ljava/lang/String;

    if-eqz v2, :cond_9

    const/16 p0, 0xb

    iput p0, v0, Lcom/google/android/gms/internal/pd$a$a;->type:I

    iget-object p0, v0, Lcom/google/android/gms/internal/pd$a$a;->awh:Lcom/google/android/gms/internal/pd$a$a$a;

    check-cast p1, [Ljava/lang/String;

    check-cast p1, [Ljava/lang/String;

    iput-object p1, p0, Lcom/google/android/gms/internal/pd$a$a$a;->aws:[Ljava/lang/String;

    goto/16 :goto_4

    :cond_9
    instance-of v2, p1, [J

    if-eqz v2, :cond_a

    const/16 p0, 0xc

    iput p0, v0, Lcom/google/android/gms/internal/pd$a$a;->type:I

    iget-object p0, v0, Lcom/google/android/gms/internal/pd$a$a;->awh:Lcom/google/android/gms/internal/pd$a$a$a;

    check-cast p1, [J

    check-cast p1, [J

    iput-object p1, p0, Lcom/google/android/gms/internal/pd$a$a$a;->awt:[J

    goto/16 :goto_4

    :cond_a
    instance-of v2, p1, [F

    if-eqz v2, :cond_b

    const/16 p0, 0xf

    iput p0, v0, Lcom/google/android/gms/internal/pd$a$a;->type:I

    iget-object p0, v0, Lcom/google/android/gms/internal/pd$a$a;->awh:Lcom/google/android/gms/internal/pd$a$a$a;

    check-cast p1, [F

    check-cast p1, [F

    iput-object p1, p0, Lcom/google/android/gms/internal/pd$a$a$a;->awu:[F

    goto/16 :goto_4

    :cond_b
    instance-of v2, p1, Lcom/google/android/gms/wearable/Asset;

    if-eqz v2, :cond_c

    const/16 v1, 0xd

    iput v1, v0, Lcom/google/android/gms/internal/pd$a$a;->type:I

    iget-object v1, v0, Lcom/google/android/gms/internal/pd$a$a;->awh:Lcom/google/android/gms/internal/pd$a$a$a;

    check-cast p1, Lcom/google/android/gms/wearable/Asset;

    invoke-static {p0, p1}, Lcom/google/android/gms/internal/pc;->a(Ljava/util/List;Lcom/google/android/gms/wearable/Asset;)I

    move-result p0

    int-to-long p0, p0

    iput-wide p0, v1, Lcom/google/android/gms/internal/pd$a$a$a;->awv:J

    goto/16 :goto_4

    :cond_c
    instance-of v2, p1, Lcom/google/android/gms/wearable/DataMap;

    const/4 v6, 0x0

    const/16 v7, 0x9

    if-eqz v2, :cond_e

    iput v7, v0, Lcom/google/android/gms/internal/pd$a$a;->type:I

    check-cast p1, Lcom/google/android/gms/wearable/DataMap;

    invoke-virtual {p1}, Lcom/google/android/gms/wearable/DataMap;->keySet()Ljava/util/Set;

    move-result-object v1

    invoke-interface {v1}, Ljava/util/Set;->size()I

    move-result v2

    new-array v2, v2, [Lcom/google/android/gms/internal/pd$a;

    invoke-interface {v1}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_d

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/String;

    new-instance v4, Lcom/google/android/gms/internal/pd$a;

    invoke-direct {v4}, Lcom/google/android/gms/internal/pd$a;-><init>()V

    aput-object v4, v2, v6

    iput-object v3, v4, Lcom/google/android/gms/internal/pd$a;->name:Ljava/lang/String;

    aget-object v4, v2, v6

    invoke-virtual {p1, v3}, Lcom/google/android/gms/wearable/DataMap;->get(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v3

    invoke-static {p0, v3}, Lcom/google/android/gms/internal/pc;->a(Ljava/util/List;Ljava/lang/Object;)Lcom/google/android/gms/internal/pd$a$a;

    move-result-object v3

    iput-object v3, v4, Lcom/google/android/gms/internal/pd$a;->awf:Lcom/google/android/gms/internal/pd$a$a;

    add-int/2addr v6, v5

    goto :goto_0

    :cond_d
    iget-object p0, v0, Lcom/google/android/gms/internal/pd$a$a;->awh:Lcom/google/android/gms/internal/pd$a$a$a;

    iput-object v2, p0, Lcom/google/android/gms/internal/pd$a$a$a;->awq:[Lcom/google/android/gms/internal/pd$a;

    goto/16 :goto_4

    :cond_e
    instance-of v2, p1, Ljava/util/ArrayList;

    if-eqz v2, :cond_14

    const/16 v2, 0xa

    iput v2, v0, Lcom/google/android/gms/internal/pd$a$a;->type:I

    check-cast p1, Ljava/util/ArrayList;

    invoke-virtual {p1}, Ljava/util/ArrayList;->size()I

    move-result v2

    new-array v2, v2, [Lcom/google/android/gms/internal/pd$a$a;

    invoke-virtual {p1}, Ljava/util/ArrayList;->size()I

    move-result v5

    const/4 v8, 0x0

    move v9, v1

    :goto_1
    if-ge v6, v5, :cond_13

    invoke-virtual {p1, v6}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v10

    invoke-static {p0, v10}, Lcom/google/android/gms/internal/pc;->a(Ljava/util/List;Ljava/lang/Object;)Lcom/google/android/gms/internal/pd$a$a;

    move-result-object v11

    iget v12, v11, Lcom/google/android/gms/internal/pd$a$a;->type:I

    if-eq v12, v1, :cond_10

    iget v12, v11, Lcom/google/android/gms/internal/pd$a$a;->type:I

    if-eq v12, v3, :cond_10

    iget v12, v11, Lcom/google/android/gms/internal/pd$a$a;->type:I

    if-eq v12, v4, :cond_10

    iget v12, v11, Lcom/google/android/gms/internal/pd$a$a;->type:I

    if-ne v12, v7, :cond_f

    goto :goto_2

    :cond_f
    new-instance p0, Ljava/lang/IllegalArgumentException;

    new-instance p1, Ljava/lang/StringBuilder;

    const-string v0, "The only ArrayList element types supported by DataBundleUtil are String, Integer, Bundle, and null, but this ArrayList contains a "

    invoke-direct {p1, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v10}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-direct {p0, p1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p0

    :cond_10
    :goto_2
    if-ne v9, v1, :cond_11

    iget v12, v11, Lcom/google/android/gms/internal/pd$a$a;->type:I

    if-eq v12, v1, :cond_11

    iget v9, v11, Lcom/google/android/gms/internal/pd$a$a;->type:I

    move-object v8, v10

    goto :goto_3

    :cond_11
    iget v12, v11, Lcom/google/android/gms/internal/pd$a$a;->type:I

    if-ne v12, v9, :cond_12

    :goto_3
    aput-object v11, v2, v6

    add-int/lit8 v6, v6, 0x1

    goto :goto_1

    :cond_12
    new-instance p0, Ljava/lang/IllegalArgumentException;

    new-instance p1, Ljava/lang/StringBuilder;

    const-string v0, "ArrayList elements must all be of the sameclass, but this one contains a "

    invoke-direct {p1, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v8}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object p1

    const-string v0, " and a "

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {v10}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-direct {p0, p1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p0

    :cond_13
    iget-object p0, v0, Lcom/google/android/gms/internal/pd$a$a;->awh:Lcom/google/android/gms/internal/pd$a$a$a;

    iput-object v2, p0, Lcom/google/android/gms/internal/pd$a$a$a;->awr:[Lcom/google/android/gms/internal/pd$a$a;

    :goto_4
    return-object v0

    :cond_14
    new-instance p0, Ljava/lang/RuntimeException;

    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "newFieldValueFromValue: unexpected value "

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-direct {p0, p1}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw p0
.end method

.method public static a(Lcom/google/android/gms/internal/pc$a;)Lcom/google/android/gms/wearable/DataMap;
    .locals 7

    new-instance v0, Lcom/google/android/gms/wearable/DataMap;

    invoke-direct {v0}, Lcom/google/android/gms/wearable/DataMap;-><init>()V

    iget-object v1, p0, Lcom/google/android/gms/internal/pc$a;->awb:Lcom/google/android/gms/internal/pd;

    iget-object v1, v1, Lcom/google/android/gms/internal/pd;->awd:[Lcom/google/android/gms/internal/pd$a;

    array-length v2, v1

    const/4 v3, 0x0

    :goto_0
    if-ge v3, v2, :cond_0

    aget-object v4, v1, v3

    iget-object v5, p0, Lcom/google/android/gms/internal/pc$a;->awc:Ljava/util/List;

    iget-object v6, v4, Lcom/google/android/gms/internal/pd$a;->name:Ljava/lang/String;

    iget-object v4, v4, Lcom/google/android/gms/internal/pd$a;->awf:Lcom/google/android/gms/internal/pd$a$a;

    invoke-static {v5, v0, v6, v4}, Lcom/google/android/gms/internal/pc;->a(Ljava/util/List;Lcom/google/android/gms/wearable/DataMap;Ljava/lang/String;Lcom/google/android/gms/internal/pd$a$a;)V

    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    :cond_0
    return-object v0
.end method

.method private static a(Ljava/util/List;Lcom/google/android/gms/internal/pd$a$a$a;I)Ljava/util/ArrayList;
    .locals 10
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/google/android/gms/wearable/Asset;",
            ">;",
            "Lcom/google/android/gms/internal/pd$a$a$a;",
            "I)",
            "Ljava/util/ArrayList;"
        }
    .end annotation

    new-instance v0, Ljava/util/ArrayList;

    iget-object v1, p1, Lcom/google/android/gms/internal/pd$a$a$a;->awr:[Lcom/google/android/gms/internal/pd$a$a;

    array-length v1, v1

    invoke-direct {v0, v1}, Ljava/util/ArrayList;-><init>(I)V

    iget-object p1, p1, Lcom/google/android/gms/internal/pd$a$a$a;->awr:[Lcom/google/android/gms/internal/pd$a$a;

    array-length v1, p1

    const/4 v2, 0x0

    move v3, v2

    :goto_0
    if-ge v3, v1, :cond_5

    aget-object v4, p1, v3

    iget v5, v4, Lcom/google/android/gms/internal/pd$a$a;->type:I

    const/16 v6, 0xe

    if-ne v5, v6, :cond_0

    const/4 v4, 0x0

    :goto_1
    invoke-virtual {v0, v4}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_3

    :cond_0
    const/16 v5, 0x9

    if-ne p2, v5, :cond_2

    new-instance v5, Lcom/google/android/gms/wearable/DataMap;

    invoke-direct {v5}, Lcom/google/android/gms/wearable/DataMap;-><init>()V

    iget-object v4, v4, Lcom/google/android/gms/internal/pd$a$a;->awh:Lcom/google/android/gms/internal/pd$a$a$a;

    iget-object v4, v4, Lcom/google/android/gms/internal/pd$a$a$a;->awq:[Lcom/google/android/gms/internal/pd$a;

    array-length v6, v4

    move v7, v2

    :goto_2
    if-ge v7, v6, :cond_1

    aget-object v8, v4, v7

    iget-object v9, v8, Lcom/google/android/gms/internal/pd$a;->name:Ljava/lang/String;

    iget-object v8, v8, Lcom/google/android/gms/internal/pd$a;->awf:Lcom/google/android/gms/internal/pd$a$a;

    invoke-static {p0, v5, v9, v8}, Lcom/google/android/gms/internal/pc;->a(Ljava/util/List;Lcom/google/android/gms/wearable/DataMap;Ljava/lang/String;Lcom/google/android/gms/internal/pd$a$a;)V

    add-int/lit8 v7, v7, 0x1

    goto :goto_2

    :cond_1
    invoke-virtual {v0, v5}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_3

    :cond_2
    const/4 v5, 0x2

    if-ne p2, v5, :cond_3

    iget-object v4, v4, Lcom/google/android/gms/internal/pd$a$a;->awh:Lcom/google/android/gms/internal/pd$a$a$a;

    iget-object v4, v4, Lcom/google/android/gms/internal/pd$a$a$a;->awj:Ljava/lang/String;

    goto :goto_1

    :cond_3
    const/4 v5, 0x6

    if-ne p2, v5, :cond_4

    iget-object v4, v4, Lcom/google/android/gms/internal/pd$a$a;->awh:Lcom/google/android/gms/internal/pd$a$a$a;

    iget v4, v4, Lcom/google/android/gms/internal/pd$a$a$a;->awn:I

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    goto :goto_1

    :goto_3
    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    :cond_4
    new-instance p0, Ljava/lang/IllegalArgumentException;

    new-instance p1, Ljava/lang/StringBuilder;

    const-string v0, "Unexpected typeOfArrayList: "

    invoke-direct {p1, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-direct {p0, p1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p0

    :cond_5
    return-object v0
.end method

.method private static a(Ljava/util/List;Lcom/google/android/gms/wearable/DataMap;Ljava/lang/String;Lcom/google/android/gms/internal/pd$a$a;)V
    .locals 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/google/android/gms/wearable/Asset;",
            ">;",
            "Lcom/google/android/gms/wearable/DataMap;",
            "Ljava/lang/String;",
            "Lcom/google/android/gms/internal/pd$a$a;",
            ")V"
        }
    .end annotation

    iget v0, p3, Lcom/google/android/gms/internal/pd$a$a;->type:I

    const/16 v1, 0xe

    if-ne v0, v1, :cond_0

    const/4 p0, 0x0

    invoke-virtual {p1, p2, p0}, Lcom/google/android/gms/wearable/DataMap;->putString(Ljava/lang/String;Ljava/lang/String;)V

    return-void

    :cond_0
    iget-object p3, p3, Lcom/google/android/gms/internal/pd$a$a;->awh:Lcom/google/android/gms/internal/pd$a$a$a;

    const/4 v2, 0x1

    if-ne v0, v2, :cond_1

    iget-object p0, p3, Lcom/google/android/gms/internal/pd$a$a$a;->awi:[B

    invoke-virtual {p1, p2, p0}, Lcom/google/android/gms/wearable/DataMap;->putByteArray(Ljava/lang/String;[B)V

    goto/16 :goto_2

    :cond_1
    const/16 v2, 0xb

    if-ne v0, v2, :cond_2

    iget-object p0, p3, Lcom/google/android/gms/internal/pd$a$a$a;->aws:[Ljava/lang/String;

    invoke-virtual {p1, p2, p0}, Lcom/google/android/gms/wearable/DataMap;->putStringArray(Ljava/lang/String;[Ljava/lang/String;)V

    goto/16 :goto_2

    :cond_2
    const/16 v2, 0xc

    if-ne v0, v2, :cond_3

    iget-object p0, p3, Lcom/google/android/gms/internal/pd$a$a$a;->awt:[J

    invoke-virtual {p1, p2, p0}, Lcom/google/android/gms/wearable/DataMap;->putLongArray(Ljava/lang/String;[J)V

    goto/16 :goto_2

    :cond_3
    const/16 v2, 0xf

    if-ne v0, v2, :cond_4

    iget-object p0, p3, Lcom/google/android/gms/internal/pd$a$a$a;->awu:[F

    invoke-virtual {p1, p2, p0}, Lcom/google/android/gms/wearable/DataMap;->putFloatArray(Ljava/lang/String;[F)V

    goto/16 :goto_2

    :cond_4
    const/4 v2, 0x2

    if-ne v0, v2, :cond_5

    iget-object p0, p3, Lcom/google/android/gms/internal/pd$a$a$a;->awj:Ljava/lang/String;

    invoke-virtual {p1, p2, p0}, Lcom/google/android/gms/wearable/DataMap;->putString(Ljava/lang/String;Ljava/lang/String;)V

    goto/16 :goto_2

    :cond_5
    const/4 v3, 0x3

    if-ne v0, v3, :cond_6

    iget-wide v0, p3, Lcom/google/android/gms/internal/pd$a$a$a;->awk:D

    invoke-virtual {p1, p2, v0, v1}, Lcom/google/android/gms/wearable/DataMap;->putDouble(Ljava/lang/String;D)V

    goto/16 :goto_2

    :cond_6
    const/4 v3, 0x4

    if-ne v0, v3, :cond_7

    iget p0, p3, Lcom/google/android/gms/internal/pd$a$a$a;->awl:F

    invoke-virtual {p1, p2, p0}, Lcom/google/android/gms/wearable/DataMap;->putFloat(Ljava/lang/String;F)V

    goto/16 :goto_2

    :cond_7
    const/4 v3, 0x5

    if-ne v0, v3, :cond_8

    iget-wide v0, p3, Lcom/google/android/gms/internal/pd$a$a$a;->awm:J

    invoke-virtual {p1, p2, v0, v1}, Lcom/google/android/gms/wearable/DataMap;->putLong(Ljava/lang/String;J)V

    goto/16 :goto_2

    :cond_8
    const/4 v3, 0x6

    if-ne v0, v3, :cond_9

    iget p0, p3, Lcom/google/android/gms/internal/pd$a$a$a;->awn:I

    invoke-virtual {p1, p2, p0}, Lcom/google/android/gms/wearable/DataMap;->putInt(Ljava/lang/String;I)V

    goto/16 :goto_2

    :cond_9
    const/4 v4, 0x7

    if-ne v0, v4, :cond_a

    iget p0, p3, Lcom/google/android/gms/internal/pd$a$a$a;->awo:I

    int-to-byte p0, p0

    invoke-virtual {p1, p2, p0}, Lcom/google/android/gms/wearable/DataMap;->putByte(Ljava/lang/String;B)V

    goto/16 :goto_2

    :cond_a
    const/16 v4, 0x8

    if-ne v0, v4, :cond_b

    iget-boolean p0, p3, Lcom/google/android/gms/internal/pd$a$a$a;->awp:Z

    invoke-virtual {p1, p2, p0}, Lcom/google/android/gms/wearable/DataMap;->putBoolean(Ljava/lang/String;Z)V

    goto/16 :goto_2

    :cond_b
    const/16 v4, 0xd

    if-ne v0, v4, :cond_d

    if-eqz p0, :cond_c

    iget-wide v0, p3, Lcom/google/android/gms/internal/pd$a$a$a;->awv:J

    long-to-int p3, v0

    invoke-interface {p0, p3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lcom/google/android/gms/wearable/Asset;

    invoke-virtual {p1, p2, p0}, Lcom/google/android/gms/wearable/DataMap;->putAsset(Ljava/lang/String;Lcom/google/android/gms/wearable/Asset;)V

    goto :goto_2

    :cond_c
    new-instance p0, Ljava/lang/RuntimeException;

    new-instance p1, Ljava/lang/StringBuilder;

    const-string p3, "populateBundle: unexpected type for: "

    invoke-direct {p1, p3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-direct {p0, p1}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw p0

    :cond_d
    const/16 v4, 0x9

    if-ne v0, v4, :cond_f

    new-instance v0, Lcom/google/android/gms/wearable/DataMap;

    invoke-direct {v0}, Lcom/google/android/gms/wearable/DataMap;-><init>()V

    iget-object p3, p3, Lcom/google/android/gms/internal/pd$a$a$a;->awq:[Lcom/google/android/gms/internal/pd$a;

    array-length v1, p3

    const/4 v2, 0x0

    :goto_0
    if-ge v2, v1, :cond_e

    aget-object v3, p3, v2

    iget-object v4, v3, Lcom/google/android/gms/internal/pd$a;->name:Ljava/lang/String;

    iget-object v3, v3, Lcom/google/android/gms/internal/pd$a;->awf:Lcom/google/android/gms/internal/pd$a$a;

    invoke-static {p0, v0, v4, v3}, Lcom/google/android/gms/internal/pc;->a(Ljava/util/List;Lcom/google/android/gms/wearable/DataMap;Ljava/lang/String;Lcom/google/android/gms/internal/pd$a$a;)V

    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    :cond_e
    invoke-virtual {p1, p2, v0}, Lcom/google/android/gms/wearable/DataMap;->putDataMap(Ljava/lang/String;Lcom/google/android/gms/wearable/DataMap;)V

    goto :goto_2

    :cond_f
    const/16 v5, 0xa

    if-ne v0, v5, :cond_14

    iget-object v0, p3, Lcom/google/android/gms/internal/pd$a$a$a;->awr:[Lcom/google/android/gms/internal/pd$a$a;

    invoke-static {p2, v0}, Lcom/google/android/gms/internal/pc;->a(Ljava/lang/String;[Lcom/google/android/gms/internal/pd$a$a;)I

    move-result v0

    invoke-static {p0, p3, v0}, Lcom/google/android/gms/internal/pc;->a(Ljava/util/List;Lcom/google/android/gms/internal/pd$a$a$a;I)Ljava/util/ArrayList;

    move-result-object p0

    if-ne v0, v1, :cond_10

    :goto_1
    invoke-virtual {p1, p2, p0}, Lcom/google/android/gms/wearable/DataMap;->putStringArrayList(Ljava/lang/String;Ljava/util/ArrayList;)V

    goto :goto_2

    :cond_10
    if-ne v0, v4, :cond_11

    invoke-virtual {p1, p2, p0}, Lcom/google/android/gms/wearable/DataMap;->putDataMapArrayList(Ljava/lang/String;Ljava/util/ArrayList;)V

    goto :goto_2

    :cond_11
    if-ne v0, v2, :cond_12

    goto :goto_1

    :cond_12
    if-ne v0, v3, :cond_13

    invoke-virtual {p1, p2, p0}, Lcom/google/android/gms/wearable/DataMap;->putIntegerArrayList(Ljava/lang/String;Ljava/util/ArrayList;)V

    :goto_2
    return-void

    :cond_13
    new-instance p0, Ljava/lang/IllegalStateException;

    new-instance p1, Ljava/lang/StringBuilder;

    const-string p2, "Unexpected typeOfArrayList: "

    invoke-direct {p1, p2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-direct {p0, p1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw p0

    :cond_14
    new-instance p0, Ljava/lang/RuntimeException;

    new-instance p1, Ljava/lang/StringBuilder;

    const-string p2, "populateBundle: unexpected type "

    invoke-direct {p1, p2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-direct {p0, p1}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw p0
.end method

.method private static a(Lcom/google/android/gms/wearable/DataMap;Ljava/util/List;)[Lcom/google/android/gms/internal/pd$a;
    .locals 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/google/android/gms/wearable/DataMap;",
            "Ljava/util/List<",
            "Lcom/google/android/gms/wearable/Asset;",
            ">;)[",
            "Lcom/google/android/gms/internal/pd$a;"
        }
    .end annotation

    invoke-virtual {p0}, Lcom/google/android/gms/wearable/DataMap;->keySet()Ljava/util/Set;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/Set;->size()I

    move-result v1

    new-array v1, v1, [Lcom/google/android/gms/internal/pd$a;

    invoke-interface {v0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v0

    const/4 v2, 0x0

    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_0

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/String;

    invoke-virtual {p0, v3}, Lcom/google/android/gms/wearable/DataMap;->get(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v4

    new-instance v5, Lcom/google/android/gms/internal/pd$a;

    invoke-direct {v5}, Lcom/google/android/gms/internal/pd$a;-><init>()V

    aput-object v5, v1, v2

    iput-object v3, v5, Lcom/google/android/gms/internal/pd$a;->name:Ljava/lang/String;

    aget-object v3, v1, v2

    invoke-static {p1, v4}, Lcom/google/android/gms/internal/pc;->a(Ljava/util/List;Ljava/lang/Object;)Lcom/google/android/gms/internal/pd$a$a;

    move-result-object v4

    iput-object v4, v3, Lcom/google/android/gms/internal/pd$a;->awf:Lcom/google/android/gms/internal/pd$a$a;

    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    :cond_0
    return-object v1
.end method
