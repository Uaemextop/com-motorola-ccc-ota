.class Lcom/google/android/gms/tagmanager/dh;
.super Ljava/lang/Number;

# interfaces
.implements Ljava/lang/Comparable;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Number;",
        "Ljava/lang/Comparable<",
        "Lcom/google/android/gms/tagmanager/dh;",
        ">;"
    }
.end annotation


# instance fields
.field private arR:D

.field private arS:J

.field private arT:Z


# direct methods
.method private constructor <init>(D)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Number;-><init>()V

    iput-wide p1, p0, Lcom/google/android/gms/tagmanager/dh;->arR:D

    const/4 p1, 0x0

    iput-boolean p1, p0, Lcom/google/android/gms/tagmanager/dh;->arT:Z

    return-void
.end method

.method private constructor <init>(J)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Number;-><init>()V

    iput-wide p1, p0, Lcom/google/android/gms/tagmanager/dh;->arS:J

    const/4 p1, 0x1

    iput-boolean p1, p0, Lcom/google/android/gms/tagmanager/dh;->arT:Z

    return-void
.end method

.method public static a(Ljava/lang/Double;)Lcom/google/android/gms/tagmanager/dh;
    .locals 3

    new-instance v0, Lcom/google/android/gms/tagmanager/dh;

    invoke-virtual {p0}, Ljava/lang/Double;->doubleValue()D

    move-result-wide v1

    invoke-direct {v0, v1, v2}, Lcom/google/android/gms/tagmanager/dh;-><init>(D)V

    return-object v0
.end method

.method public static cW(Ljava/lang/String;)Lcom/google/android/gms/tagmanager/dh;
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/NumberFormatException;
        }
    .end annotation

    :try_start_0
    new-instance v0, Lcom/google/android/gms/tagmanager/dh;

    invoke-static {p0}, Ljava/lang/Long;->parseLong(Ljava/lang/String;)J

    move-result-wide v1

    invoke-direct {v0, v1, v2}, Lcom/google/android/gms/tagmanager/dh;-><init>(J)V
    :try_end_0
    .catch Ljava/lang/NumberFormatException; {:try_start_0 .. :try_end_0} :catch_0

    return-object v0

    :catch_0
    :try_start_1
    new-instance v0, Lcom/google/android/gms/tagmanager/dh;

    invoke-static {p0}, Ljava/lang/Double;->parseDouble(Ljava/lang/String;)D

    move-result-wide v1

    invoke-direct {v0, v1, v2}, Lcom/google/android/gms/tagmanager/dh;-><init>(D)V
    :try_end_1
    .catch Ljava/lang/NumberFormatException; {:try_start_1 .. :try_end_1} :catch_1

    return-object v0

    :catch_1
    new-instance v0, Ljava/lang/NumberFormatException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p0

    const-string v1, " is not a valid TypedNumber"

    invoke-virtual {p0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-direct {v0, p0}, Ljava/lang/NumberFormatException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public static z(J)Lcom/google/android/gms/tagmanager/dh;
    .locals 1

    new-instance v0, Lcom/google/android/gms/tagmanager/dh;

    invoke-direct {v0, p0, p1}, Lcom/google/android/gms/tagmanager/dh;-><init>(J)V

    return-object v0
.end method


# virtual methods
.method public a(Lcom/google/android/gms/tagmanager/dh;)I
    .locals 3

    invoke-virtual {p0}, Lcom/google/android/gms/tagmanager/dh;->pA()Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-virtual {p1}, Lcom/google/android/gms/tagmanager/dh;->pA()Z

    move-result v0

    if-eqz v0, :cond_0

    new-instance v0, Ljava/lang/Long;

    iget-wide v1, p0, Lcom/google/android/gms/tagmanager/dh;->arS:J

    invoke-direct {v0, v1, v2}, Ljava/lang/Long;-><init>(J)V

    iget-wide p0, p1, Lcom/google/android/gms/tagmanager/dh;->arS:J

    invoke-static {p0, p1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object p0

    invoke-virtual {v0, p0}, Ljava/lang/Long;->compareTo(Ljava/lang/Long;)I

    move-result p0

    goto :goto_0

    :cond_0
    invoke-virtual {p0}, Lcom/google/android/gms/tagmanager/dh;->doubleValue()D

    move-result-wide v0

    invoke-virtual {p1}, Lcom/google/android/gms/tagmanager/dh;->doubleValue()D

    move-result-wide p0

    invoke-static {v0, v1, p0, p1}, Ljava/lang/Double;->compare(DD)I

    move-result p0

    :goto_0
    return p0
.end method

.method public byteValue()B
    .locals 2

    invoke-virtual {p0}, Lcom/google/android/gms/tagmanager/dh;->longValue()J

    move-result-wide v0

    long-to-int p0, v0

    int-to-byte p0, p0

    return p0
.end method

.method public synthetic compareTo(Ljava/lang/Object;)I
    .locals 0

    check-cast p1, Lcom/google/android/gms/tagmanager/dh;

    invoke-virtual {p0, p1}, Lcom/google/android/gms/tagmanager/dh;->a(Lcom/google/android/gms/tagmanager/dh;)I

    move-result p0

    return p0
.end method

.method public doubleValue()D
    .locals 2

    invoke-virtual {p0}, Lcom/google/android/gms/tagmanager/dh;->pA()Z

    move-result v0

    if-eqz v0, :cond_0

    iget-wide v0, p0, Lcom/google/android/gms/tagmanager/dh;->arS:J

    long-to-double v0, v0

    goto :goto_0

    :cond_0
    iget-wide v0, p0, Lcom/google/android/gms/tagmanager/dh;->arR:D

    :goto_0
    return-wide v0
.end method

.method public equals(Ljava/lang/Object;)Z
    .locals 1

    instance-of v0, p1, Lcom/google/android/gms/tagmanager/dh;

    if-eqz v0, :cond_0

    check-cast p1, Lcom/google/android/gms/tagmanager/dh;

    invoke-virtual {p0, p1}, Lcom/google/android/gms/tagmanager/dh;->a(Lcom/google/android/gms/tagmanager/dh;)I

    move-result p0

    if-nez p0, :cond_0

    const/4 p0, 0x1

    goto :goto_0

    :cond_0
    const/4 p0, 0x0

    :goto_0
    return p0
.end method

.method public floatValue()F
    .locals 2

    invoke-virtual {p0}, Lcom/google/android/gms/tagmanager/dh;->doubleValue()D

    move-result-wide v0

    double-to-float p0, v0

    return p0
.end method

.method public hashCode()I
    .locals 3

    new-instance v0, Ljava/lang/Long;

    invoke-virtual {p0}, Lcom/google/android/gms/tagmanager/dh;->longValue()J

    move-result-wide v1

    invoke-direct {v0, v1, v2}, Ljava/lang/Long;-><init>(J)V

    invoke-virtual {v0}, Ljava/lang/Long;->hashCode()I

    move-result p0

    return p0
.end method

.method public intValue()I
    .locals 0

    invoke-virtual {p0}, Lcom/google/android/gms/tagmanager/dh;->pC()I

    move-result p0

    return p0
.end method

.method public longValue()J
    .locals 2

    invoke-virtual {p0}, Lcom/google/android/gms/tagmanager/dh;->pB()J

    move-result-wide v0

    return-wide v0
.end method

.method public pA()Z
    .locals 0

    iget-boolean p0, p0, Lcom/google/android/gms/tagmanager/dh;->arT:Z

    return p0
.end method

.method public pB()J
    .locals 2

    invoke-virtual {p0}, Lcom/google/android/gms/tagmanager/dh;->pA()Z

    move-result v0

    if-eqz v0, :cond_0

    iget-wide v0, p0, Lcom/google/android/gms/tagmanager/dh;->arS:J

    goto :goto_0

    :cond_0
    iget-wide v0, p0, Lcom/google/android/gms/tagmanager/dh;->arR:D

    double-to-long v0, v0

    :goto_0
    return-wide v0
.end method

.method public pC()I
    .locals 2

    invoke-virtual {p0}, Lcom/google/android/gms/tagmanager/dh;->longValue()J

    move-result-wide v0

    long-to-int p0, v0

    return p0
.end method

.method public pD()S
    .locals 2

    invoke-virtual {p0}, Lcom/google/android/gms/tagmanager/dh;->longValue()J

    move-result-wide v0

    long-to-int p0, v0

    int-to-short p0, p0

    return p0
.end method

.method public pz()Z
    .locals 0

    invoke-virtual {p0}, Lcom/google/android/gms/tagmanager/dh;->pA()Z

    move-result p0

    xor-int/lit8 p0, p0, 0x1

    return p0
.end method

.method public shortValue()S
    .locals 0

    invoke-virtual {p0}, Lcom/google/android/gms/tagmanager/dh;->pD()S

    move-result p0

    return p0
.end method

.method public toString()Ljava/lang/String;
    .locals 2

    invoke-virtual {p0}, Lcom/google/android/gms/tagmanager/dh;->pA()Z

    move-result v0

    if-eqz v0, :cond_0

    iget-wide v0, p0, Lcom/google/android/gms/tagmanager/dh;->arS:J

    invoke-static {v0, v1}, Ljava/lang/Long;->toString(J)Ljava/lang/String;

    move-result-object p0

    goto :goto_0

    :cond_0
    iget-wide v0, p0, Lcom/google/android/gms/tagmanager/dh;->arR:D

    invoke-static {v0, v1}, Ljava/lang/Double;->toString(D)Ljava/lang/String;

    move-result-object p0

    :goto_0
    return-object p0
.end method
