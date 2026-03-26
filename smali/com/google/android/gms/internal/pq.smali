.class public final Lcom/google/android/gms/internal/pq;
.super Ljava/lang/Object;


# static fields
.field public static final awW:[I

.field public static final awX:[J

.field public static final awY:[F

.field public static final awZ:[D

.field public static final axa:[Z

.field public static final axb:[Ljava/lang/String;

.field public static final axc:[[B

.field public static final axd:[B


# direct methods
.method static constructor <clinit>()V
    .locals 2

    const/4 v0, 0x0

    new-array v1, v0, [I

    sput-object v1, Lcom/google/android/gms/internal/pq;->awW:[I

    new-array v1, v0, [J

    sput-object v1, Lcom/google/android/gms/internal/pq;->awX:[J

    new-array v1, v0, [F

    sput-object v1, Lcom/google/android/gms/internal/pq;->awY:[F

    new-array v1, v0, [D

    sput-object v1, Lcom/google/android/gms/internal/pq;->awZ:[D

    new-array v1, v0, [Z

    sput-object v1, Lcom/google/android/gms/internal/pq;->axa:[Z

    new-array v1, v0, [Ljava/lang/String;

    sput-object v1, Lcom/google/android/gms/internal/pq;->axb:[Ljava/lang/String;

    new-array v1, v0, [[B

    sput-object v1, Lcom/google/android/gms/internal/pq;->axc:[[B

    new-array v0, v0, [B

    sput-object v0, Lcom/google/android/gms/internal/pq;->axd:[B

    return-void
.end method

.method public static final b(Lcom/google/android/gms/internal/pf;I)I
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    invoke-virtual {p0}, Lcom/google/android/gms/internal/pf;->getPosition()I

    move-result v0

    invoke-virtual {p0, p1}, Lcom/google/android/gms/internal/pf;->gn(I)Z

    const/4 v1, 0x1

    :goto_0
    invoke-virtual {p0}, Lcom/google/android/gms/internal/pf;->qi()I

    move-result v2

    if-ne v2, p1, :cond_0

    invoke-virtual {p0, p1}, Lcom/google/android/gms/internal/pf;->gn(I)Z

    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    :cond_0
    invoke-virtual {p0, v0}, Lcom/google/android/gms/internal/pf;->gr(I)V

    return v1
.end method

.method static gH(I)I
    .locals 0

    and-int/lit8 p0, p0, 0x7

    return p0
.end method

.method public static gI(I)I
    .locals 0

    ushr-int/lit8 p0, p0, 0x3

    return p0
.end method

.method static x(II)I
    .locals 0

    shl-int/lit8 p0, p0, 0x3

    or-int/2addr p0, p1

    return p0
.end method
