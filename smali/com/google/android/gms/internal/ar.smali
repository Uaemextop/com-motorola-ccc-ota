.class public Lcom/google/android/gms/internal/ar;
.super Lcom/google/android/gms/internal/ao;


# instance fields
.field private nP:Ljava/security/MessageDigest;


# direct methods
.method public constructor <init>()V
    .locals 0

    invoke-direct {p0}, Lcom/google/android/gms/internal/ao;-><init>()V

    return-void
.end method


# virtual methods
.method a([Ljava/lang/String;)[B
    .locals 2

    array-length p0, p1

    new-array p0, p0, [B

    const/4 v0, 0x0

    :goto_0
    array-length v1, p1

    if-ge v0, v1, :cond_0

    aget-object v1, p1, v0

    invoke-static {v1}, Lcom/google/android/gms/internal/aq;->o(Ljava/lang/String;)I

    move-result v1

    and-int/lit16 v1, v1, 0xff

    int-to-byte v1, v1

    aput-byte v1, p0, v0

    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    :cond_0
    return-object p0
.end method

.method public l(Ljava/lang/String;)[B
    .locals 3

    const-string v0, " "

    invoke-virtual {p1, v0}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p0, p1}, Lcom/google/android/gms/internal/ar;->a([Ljava/lang/String;)[B

    move-result-object p1

    invoke-virtual {p0}, Lcom/google/android/gms/internal/ar;->ba()Ljava/security/MessageDigest;

    move-result-object v0

    iput-object v0, p0, Lcom/google/android/gms/internal/ar;->nP:Ljava/security/MessageDigest;

    iget-object v0, p0, Lcom/google/android/gms/internal/ar;->mw:Ljava/lang/Object;

    monitor-enter v0

    :try_start_0
    iget-object v1, p0, Lcom/google/android/gms/internal/ar;->nP:Ljava/security/MessageDigest;

    const/4 v2, 0x0

    if-nez v1, :cond_0

    new-array p0, v2, [B

    monitor-exit v0

    return-object p0

    :cond_0
    invoke-virtual {v1}, Ljava/security/MessageDigest;->reset()V

    iget-object v1, p0, Lcom/google/android/gms/internal/ar;->nP:Ljava/security/MessageDigest;

    invoke-virtual {v1, p1}, Ljava/security/MessageDigest;->update([B)V

    iget-object p0, p0, Lcom/google/android/gms/internal/ar;->nP:Ljava/security/MessageDigest;

    invoke-virtual {p0}, Ljava/security/MessageDigest;->digest()[B

    move-result-object p0

    array-length p1, p0

    const/4 v1, 0x4

    if-le p1, v1, :cond_1

    goto :goto_0

    :cond_1
    array-length v1, p0

    :goto_0
    new-array p1, v1, [B

    invoke-static {p0, v2, p1, v2, v1}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    monitor-exit v0

    return-object p1

    :catchall_0
    move-exception p0

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw p0
.end method
