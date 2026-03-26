.class public Lcom/google/android/gms/internal/as;
.super Ljava/lang/Object;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/google/android/gms/internal/as$a;
    }
.end annotation


# direct methods
.method static a(IIJJJ)J
    .locals 6

    int-to-long v0, p0

    const-wide/32 v2, 0x7fffffff

    add-long/2addr v0, v2

    const-wide/32 v4, 0x4000ffff

    rem-long/2addr v0, v4

    mul-long/2addr p4, v0

    rem-long/2addr p4, v4

    add-long/2addr p2, v4

    sub-long/2addr p2, p4

    rem-long/2addr p2, v4

    mul-long/2addr p2, p6

    rem-long/2addr p2, v4

    int-to-long p0, p1

    add-long/2addr p0, v2

    rem-long/2addr p0, v4

    add-long/2addr p2, p0

    rem-long/2addr p2, v4

    return-wide p2
.end method

.method static a(JI)J
    .locals 5

    if-nez p2, :cond_0

    const-wide/16 p0, 0x1

    return-wide p0

    :cond_0
    const/4 v0, 0x1

    if-ne p2, v0, :cond_1

    return-wide p0

    :cond_1
    rem-int/lit8 v0, p2, 0x2

    const-wide/32 v1, 0x4000ffff

    if-nez v0, :cond_2

    mul-long/2addr p0, p0

    rem-long/2addr p0, v1

    div-int/lit8 p2, p2, 0x2

    invoke-static {p0, p1, p2}, Lcom/google/android/gms/internal/as;->a(JI)J

    move-result-wide p0

    :goto_0
    rem-long/2addr p0, v1

    return-wide p0

    :cond_2
    mul-long v3, p0, p0

    rem-long/2addr v3, v1

    div-int/lit8 p2, p2, 0x2

    invoke-static {v3, v4, p2}, Lcom/google/android/gms/internal/as;->a(JI)J

    move-result-wide v3

    rem-long/2addr v3, v1

    mul-long/2addr p0, v3

    goto :goto_0
.end method

.method static a([Ljava/lang/String;II)Ljava/lang/String;
    .locals 2

    array-length v0, p0

    add-int/2addr p2, p1

    if-ge v0, p2, :cond_0

    const-string p0, "Unable to construct shingle"

    invoke-static {p0}, Lcom/google/android/gms/internal/gs;->T(Ljava/lang/String;)V

    const-string p0, ""

    return-object p0

    :cond_0
    new-instance v0, Ljava/lang/StringBuffer;

    invoke-direct {v0}, Ljava/lang/StringBuffer;-><init>()V

    :goto_0
    add-int/lit8 v1, p2, -0x1

    if-ge p1, v1, :cond_1

    aget-object v1, p0, p1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    const/16 v1, 0x20

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    add-int/lit8 p1, p1, 0x1

    goto :goto_0

    :cond_1
    aget-object p0, p0, v1

    invoke-virtual {v0, p0}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    invoke-virtual {v0}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method private static a(IJI[Ljava/lang/String;ILjava/util/PriorityQueue;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(IJI[",
            "Ljava/lang/String;",
            "I",
            "Ljava/util/PriorityQueue<",
            "Lcom/google/android/gms/internal/as$a;",
            ">;)V"
        }
    .end annotation

    new-instance v0, Lcom/google/android/gms/internal/as$a;

    invoke-static {p4, p3, p5}, Lcom/google/android/gms/internal/as;->a([Ljava/lang/String;II)Ljava/lang/String;

    move-result-object p3

    invoke-direct {v0, p1, p2, p3}, Lcom/google/android/gms/internal/as$a;-><init>(JLjava/lang/String;)V

    invoke-virtual {p6, v0}, Ljava/util/PriorityQueue;->add(Ljava/lang/Object;)Z

    invoke-virtual {p6}, Ljava/util/PriorityQueue;->size()I

    move-result p1

    if-le p1, p0, :cond_0

    invoke-virtual {p6}, Ljava/util/PriorityQueue;->poll()Ljava/lang/Object;

    :cond_0
    return-void
.end method

.method public static a([Ljava/lang/String;IILjava/util/PriorityQueue;)V
    .locals 22
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "([",
            "Ljava/lang/String;",
            "II",
            "Ljava/util/PriorityQueue<",
            "Lcom/google/android/gms/internal/as$a;",
            ">;)V"
        }
    .end annotation

    move-object/from16 v7, p0

    move/from16 v8, p2

    const/4 v0, 0x0

    invoke-static {v7, v0, v8}, Lcom/google/android/gms/internal/as;->b([Ljava/lang/String;II)J

    move-result-wide v9

    const/4 v3, 0x0

    move/from16 v0, p1

    move-wide v1, v9

    move-object/from16 v4, p0

    move/from16 v5, p2

    move-object/from16 v6, p3

    invoke-static/range {v0 .. v6}, Lcom/google/android/gms/internal/as;->a(IJI[Ljava/lang/String;ILjava/util/PriorityQueue;)V

    add-int/lit8 v0, v8, -0x1

    const-wide/32 v1, 0x1001fff

    invoke-static {v1, v2, v0}, Lcom/google/android/gms/internal/as;->a(JI)J

    move-result-wide v19

    const/16 v21, 0x1

    move-wide v13, v9

    move/from16 v9, v21

    :goto_0
    array-length v0, v7

    sub-int/2addr v0, v8

    add-int/lit8 v0, v0, 0x1

    if-ge v9, v0, :cond_0

    add-int/lit8 v0, v9, -0x1

    aget-object v0, v7, v0

    invoke-static {v0}, Lcom/google/android/gms/internal/aq;->o(Ljava/lang/String;)I

    move-result v11

    add-int v0, v9, v8

    add-int/lit8 v0, v0, -0x1

    aget-object v0, v7, v0

    invoke-static {v0}, Lcom/google/android/gms/internal/aq;->o(Ljava/lang/String;)I

    move-result v12

    const-wide/32 v17, 0x1001fff

    move-wide/from16 v15, v19

    invoke-static/range {v11 .. v18}, Lcom/google/android/gms/internal/as;->a(IIJJJ)J

    move-result-wide v13

    move/from16 v0, p1

    move-wide v1, v13

    move v3, v9

    move-object/from16 v4, p0

    move/from16 v5, p2

    move-object/from16 v6, p3

    invoke-static/range {v0 .. v6}, Lcom/google/android/gms/internal/as;->a(IJI[Ljava/lang/String;ILjava/util/PriorityQueue;)V

    add-int/lit8 v9, v9, 0x1

    goto :goto_0

    :cond_0
    return-void
.end method

.method private static b([Ljava/lang/String;II)J
    .locals 9

    aget-object v0, p0, p1

    invoke-static {v0}, Lcom/google/android/gms/internal/aq;->o(Ljava/lang/String;)I

    move-result v0

    int-to-long v0, v0

    const-wide/32 v2, 0x7fffffff

    add-long/2addr v0, v2

    const-wide/32 v4, 0x4000ffff

    rem-long/2addr v0, v4

    add-int/lit8 v6, p1, 0x1

    :goto_0
    add-int v7, p1, p2

    if-ge v6, v7, :cond_0

    const-wide/32 v7, 0x1001fff

    mul-long/2addr v0, v7

    rem-long/2addr v0, v4

    aget-object v7, p0, v6

    invoke-static {v7}, Lcom/google/android/gms/internal/aq;->o(Ljava/lang/String;)I

    move-result v7

    int-to-long v7, v7

    add-long/2addr v7, v2

    rem-long/2addr v7, v4

    add-long/2addr v0, v7

    rem-long/2addr v0, v4

    add-int/lit8 v6, v6, 0x1

    goto :goto_0

    :cond_0
    return-wide v0
.end method
