.class public abstract Lcom/google/android/gms/internal/i;
.super Lcom/google/android/gms/internal/h;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/google/android/gms/internal/i$a;
    }
.end annotation


# static fields
.field private static kA:Ljava/lang/reflect/Method; = null

.field private static kB:Ljava/lang/reflect/Method; = null

.field private static kC:Ljava/lang/reflect/Method; = null

.field private static kD:Ljava/lang/reflect/Method; = null

.field private static kE:Ljava/lang/reflect/Method; = null

.field private static kF:Ljava/lang/reflect/Method; = null

.field private static kG:Ljava/lang/reflect/Method; = null

.field private static kH:Ljava/lang/reflect/Method; = null

.field private static kI:Ljava/lang/reflect/Method; = null

.field private static kJ:Ljava/lang/String; = null

.field private static kK:Ljava/lang/String; = null

.field private static kL:Ljava/lang/String; = null

.field private static kM:Lcom/google/android/gms/internal/o; = null

.field static kN:Z = false

.field private static startTime:J


# direct methods
.method static constructor <clinit>()V
    .locals 0

    return-void
.end method

.method protected constructor <init>(Landroid/content/Context;Lcom/google/android/gms/internal/m;Lcom/google/android/gms/internal/n;)V
    .locals 0

    invoke-direct {p0, p1, p2, p3}, Lcom/google/android/gms/internal/h;-><init>(Landroid/content/Context;Lcom/google/android/gms/internal/m;Lcom/google/android/gms/internal/n;)V

    return-void
.end method

.method static a(Landroid/content/Context;Lcom/google/android/gms/internal/m;)Ljava/lang/String;
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/android/gms/internal/i$a;
        }
    .end annotation

    sget-object v0, Lcom/google/android/gms/internal/i;->kK:Ljava/lang/String;

    if-eqz v0, :cond_0

    return-object v0

    :cond_0
    sget-object v0, Lcom/google/android/gms/internal/i;->kD:Ljava/lang/reflect/Method;

    if-eqz v0, :cond_2

    :try_start_0
    filled-new-array {p0}, [Ljava/lang/Object;

    move-result-object p0

    const/4 v1, 0x0

    invoke-virtual {v0, v1, p0}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Ljava/nio/ByteBuffer;

    if-eqz p0, :cond_1

    invoke-virtual {p0}, Ljava/nio/ByteBuffer;->array()[B

    move-result-object p0

    const/4 v0, 0x1

    invoke-interface {p1, p0, v0}, Lcom/google/android/gms/internal/m;->a([BZ)Ljava/lang/String;

    move-result-object p0

    sput-object p0, Lcom/google/android/gms/internal/i;->kK:Ljava/lang/String;

    return-object p0

    :cond_1
    new-instance p0, Lcom/google/android/gms/internal/i$a;

    invoke-direct {p0}, Lcom/google/android/gms/internal/i$a;-><init>()V

    throw p0
    :try_end_0
    .catch Ljava/lang/IllegalAccessException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/lang/reflect/InvocationTargetException; {:try_start_0 .. :try_end_0} :catch_0

    :catch_0
    move-exception p0

    new-instance p1, Lcom/google/android/gms/internal/i$a;

    invoke-direct {p1, p0}, Lcom/google/android/gms/internal/i$a;-><init>(Ljava/lang/Throwable;)V

    throw p1

    :catch_1
    move-exception p0

    new-instance p1, Lcom/google/android/gms/internal/i$a;

    invoke-direct {p1, p0}, Lcom/google/android/gms/internal/i$a;-><init>(Ljava/lang/Throwable;)V

    throw p1

    :cond_2
    new-instance p0, Lcom/google/android/gms/internal/i$a;

    invoke-direct {p0}, Lcom/google/android/gms/internal/i$a;-><init>()V

    throw p0
.end method

.method static a(Landroid/view/MotionEvent;Landroid/util/DisplayMetrics;)Ljava/util/ArrayList;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/view/MotionEvent;",
            "Landroid/util/DisplayMetrics;",
            ")",
            "Ljava/util/ArrayList<",
            "Ljava/lang/Long;",
            ">;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/android/gms/internal/i$a;
        }
    .end annotation

    sget-object v0, Lcom/google/android/gms/internal/i;->kE:Ljava/lang/reflect/Method;

    if-eqz v0, :cond_0

    if-eqz p0, :cond_0

    :try_start_0
    filled-new-array {p0, p1}, [Ljava/lang/Object;

    move-result-object p0

    const/4 p1, 0x0

    invoke-virtual {v0, p1, p0}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Ljava/util/ArrayList;
    :try_end_0
    .catch Ljava/lang/IllegalAccessException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/lang/reflect/InvocationTargetException; {:try_start_0 .. :try_end_0} :catch_0

    return-object p0

    :catch_0
    move-exception p0

    new-instance p1, Lcom/google/android/gms/internal/i$a;

    invoke-direct {p1, p0}, Lcom/google/android/gms/internal/i$a;-><init>(Ljava/lang/Throwable;)V

    throw p1

    :catch_1
    move-exception p0

    new-instance p1, Lcom/google/android/gms/internal/i$a;

    invoke-direct {p1, p0}, Lcom/google/android/gms/internal/i$a;-><init>(Ljava/lang/Throwable;)V

    throw p1

    :cond_0
    new-instance p0, Lcom/google/android/gms/internal/i$a;

    invoke-direct {p0}, Lcom/google/android/gms/internal/i$a;-><init>()V

    throw p0
.end method

.method protected static declared-synchronized a(Ljava/lang/String;Landroid/content/Context;Lcom/google/android/gms/internal/m;)V
    .locals 3

    const-class v0, Lcom/google/android/gms/internal/i;

    monitor-enter v0

    :try_start_0
    sget-boolean v1, Lcom/google/android/gms/internal/i;->kN:Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    if-nez v1, :cond_0

    :try_start_1
    new-instance v1, Lcom/google/android/gms/internal/o;

    const/4 v2, 0x0

    invoke-direct {v1, p2, v2}, Lcom/google/android/gms/internal/o;-><init>(Lcom/google/android/gms/internal/m;Ljava/security/SecureRandom;)V

    sput-object v1, Lcom/google/android/gms/internal/i;->kM:Lcom/google/android/gms/internal/o;

    sput-object p0, Lcom/google/android/gms/internal/i;->kJ:Ljava/lang/String;

    invoke-static {p1}, Lcom/google/android/gms/internal/i;->g(Landroid/content/Context;)V

    invoke-static {}, Lcom/google/android/gms/internal/i;->w()Ljava/lang/Long;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/Long;->longValue()J

    move-result-wide p0

    sput-wide p0, Lcom/google/android/gms/internal/i;->startTime:J

    const/4 p0, 0x1

    sput-boolean p0, Lcom/google/android/gms/internal/i;->kN:Z
    :try_end_1
    .catch Lcom/google/android/gms/internal/i$a; {:try_start_1 .. :try_end_1} :catch_0
    .catch Ljava/lang/UnsupportedOperationException; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    :catch_0
    :cond_0
    monitor-exit v0

    return-void

    :catchall_0
    move-exception p0

    monitor-exit v0

    throw p0
.end method

.method static b(Landroid/content/Context;Lcom/google/android/gms/internal/m;)Ljava/lang/String;
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/android/gms/internal/i$a;
        }
    .end annotation

    sget-object v0, Lcom/google/android/gms/internal/i;->kL:Ljava/lang/String;

    if-eqz v0, :cond_0

    return-object v0

    :cond_0
    sget-object v0, Lcom/google/android/gms/internal/i;->kG:Ljava/lang/reflect/Method;

    if-eqz v0, :cond_2

    :try_start_0
    filled-new-array {p0}, [Ljava/lang/Object;

    move-result-object p0

    const/4 v1, 0x0

    invoke-virtual {v0, v1, p0}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Ljava/nio/ByteBuffer;

    if-eqz p0, :cond_1

    invoke-virtual {p0}, Ljava/nio/ByteBuffer;->array()[B

    move-result-object p0

    const/4 v0, 0x1

    invoke-interface {p1, p0, v0}, Lcom/google/android/gms/internal/m;->a([BZ)Ljava/lang/String;

    move-result-object p0

    sput-object p0, Lcom/google/android/gms/internal/i;->kL:Ljava/lang/String;

    return-object p0

    :cond_1
    new-instance p0, Lcom/google/android/gms/internal/i$a;

    invoke-direct {p0}, Lcom/google/android/gms/internal/i$a;-><init>()V

    throw p0
    :try_end_0
    .catch Ljava/lang/IllegalAccessException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/lang/reflect/InvocationTargetException; {:try_start_0 .. :try_end_0} :catch_0

    :catch_0
    move-exception p0

    new-instance p1, Lcom/google/android/gms/internal/i$a;

    invoke-direct {p1, p0}, Lcom/google/android/gms/internal/i$a;-><init>(Ljava/lang/Throwable;)V

    throw p1

    :catch_1
    move-exception p0

    new-instance p1, Lcom/google/android/gms/internal/i$a;

    invoke-direct {p1, p0}, Lcom/google/android/gms/internal/i$a;-><init>(Ljava/lang/Throwable;)V

    throw p1

    :cond_2
    new-instance p0, Lcom/google/android/gms/internal/i$a;

    invoke-direct {p0}, Lcom/google/android/gms/internal/i$a;-><init>()V

    throw p0
.end method

.method private static b([BLjava/lang/String;)Ljava/lang/String;
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/android/gms/internal/i$a;
        }
    .end annotation

    :try_start_0
    new-instance v0, Ljava/lang/String;

    sget-object v1, Lcom/google/android/gms/internal/i;->kM:Lcom/google/android/gms/internal/o;

    invoke-virtual {v1, p0, p1}, Lcom/google/android/gms/internal/o;->c([BLjava/lang/String;)[B

    move-result-object p0

    const-string p1, "UTF-8"

    invoke-direct {v0, p0, p1}, Ljava/lang/String;-><init>([BLjava/lang/String;)V
    :try_end_0
    .catch Lcom/google/android/gms/internal/o$a; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/io/UnsupportedEncodingException; {:try_start_0 .. :try_end_0} :catch_0

    return-object v0

    :catch_0
    move-exception p0

    new-instance p1, Lcom/google/android/gms/internal/i$a;

    invoke-direct {p1, p0}, Lcom/google/android/gms/internal/i$a;-><init>(Ljava/lang/Throwable;)V

    throw p1

    :catch_1
    move-exception p0

    new-instance p1, Lcom/google/android/gms/internal/i$a;

    invoke-direct {p1, p0}, Lcom/google/android/gms/internal/i$a;-><init>(Ljava/lang/Throwable;)V

    throw p1
.end method

.method static d(Landroid/content/Context;)Ljava/lang/String;
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/android/gms/internal/i$a;
        }
    .end annotation

    sget-object v0, Lcom/google/android/gms/internal/i;->kF:Ljava/lang/reflect/Method;

    if-eqz v0, :cond_1

    :try_start_0
    filled-new-array {p0}, [Ljava/lang/Object;

    move-result-object p0

    const/4 v1, 0x0

    invoke-virtual {v0, v1, p0}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Ljava/lang/String;

    if-eqz p0, :cond_0

    return-object p0

    :cond_0
    new-instance p0, Lcom/google/android/gms/internal/i$a;

    invoke-direct {p0}, Lcom/google/android/gms/internal/i$a;-><init>()V

    throw p0
    :try_end_0
    .catch Ljava/lang/IllegalAccessException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/lang/reflect/InvocationTargetException; {:try_start_0 .. :try_end_0} :catch_0

    :catch_0
    move-exception p0

    new-instance v0, Lcom/google/android/gms/internal/i$a;

    invoke-direct {v0, p0}, Lcom/google/android/gms/internal/i$a;-><init>(Ljava/lang/Throwable;)V

    throw v0

    :catch_1
    move-exception p0

    new-instance v0, Lcom/google/android/gms/internal/i$a;

    invoke-direct {v0, p0}, Lcom/google/android/gms/internal/i$a;-><init>(Ljava/lang/Throwable;)V

    throw v0

    :cond_1
    new-instance p0, Lcom/google/android/gms/internal/i$a;

    invoke-direct {p0}, Lcom/google/android/gms/internal/i$a;-><init>()V

    throw p0
.end method

.method static e(Landroid/content/Context;)Ljava/util/ArrayList;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Context;",
            ")",
            "Ljava/util/ArrayList<",
            "Ljava/lang/Long;",
            ">;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/android/gms/internal/i$a;
        }
    .end annotation

    sget-object v0, Lcom/google/android/gms/internal/i;->kH:Ljava/lang/reflect/Method;

    if-eqz v0, :cond_1

    :try_start_0
    filled-new-array {p0}, [Ljava/lang/Object;

    move-result-object p0

    const/4 v1, 0x0

    invoke-virtual {v0, v1, p0}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Ljava/util/ArrayList;

    if-eqz p0, :cond_0

    invoke-virtual {p0}, Ljava/util/ArrayList;->size()I

    move-result v0

    const/4 v1, 0x2

    if-ne v0, v1, :cond_0

    return-object p0

    :cond_0
    new-instance p0, Lcom/google/android/gms/internal/i$a;

    invoke-direct {p0}, Lcom/google/android/gms/internal/i$a;-><init>()V

    throw p0
    :try_end_0
    .catch Ljava/lang/IllegalAccessException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/lang/reflect/InvocationTargetException; {:try_start_0 .. :try_end_0} :catch_0

    :catch_0
    move-exception p0

    new-instance v0, Lcom/google/android/gms/internal/i$a;

    invoke-direct {v0, p0}, Lcom/google/android/gms/internal/i$a;-><init>(Ljava/lang/Throwable;)V

    throw v0

    :catch_1
    move-exception p0

    new-instance v0, Lcom/google/android/gms/internal/i$a;

    invoke-direct {v0, p0}, Lcom/google/android/gms/internal/i$a;-><init>(Ljava/lang/Throwable;)V

    throw v0

    :cond_1
    new-instance p0, Lcom/google/android/gms/internal/i$a;

    invoke-direct {p0}, Lcom/google/android/gms/internal/i$a;-><init>()V

    throw p0
.end method

.method static f(Landroid/content/Context;)[I
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/android/gms/internal/i$a;
        }
    .end annotation

    sget-object v0, Lcom/google/android/gms/internal/i;->kI:Ljava/lang/reflect/Method;

    if-eqz v0, :cond_0

    :try_start_0
    filled-new-array {p0}, [Ljava/lang/Object;

    move-result-object p0

    const/4 v1, 0x0

    invoke-virtual {v0, v1, p0}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, [I

    check-cast p0, [I
    :try_end_0
    .catch Ljava/lang/IllegalAccessException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/lang/reflect/InvocationTargetException; {:try_start_0 .. :try_end_0} :catch_0

    return-object p0

    :catch_0
    move-exception p0

    new-instance v0, Lcom/google/android/gms/internal/i$a;

    invoke-direct {v0, p0}, Lcom/google/android/gms/internal/i$a;-><init>(Ljava/lang/Throwable;)V

    throw v0

    :catch_1
    move-exception p0

    new-instance v0, Lcom/google/android/gms/internal/i$a;

    invoke-direct {v0, p0}, Lcom/google/android/gms/internal/i$a;-><init>(Ljava/lang/Throwable;)V

    throw v0

    :cond_0
    new-instance p0, Lcom/google/android/gms/internal/i$a;

    invoke-direct {p0}, Lcom/google/android/gms/internal/i$a;-><init>()V

    throw p0
.end method

.method private static g(Landroid/content/Context;)V
    .locals 17
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/android/gms/internal/i$a;
        }
    .end annotation

    const-string v1, ".dex"

    const-string v2, ".jar"

    :try_start_0
    sget-object v0, Lcom/google/android/gms/internal/i;->kM:Lcom/google/android/gms/internal/o;

    invoke-static {}, Lcom/google/android/gms/internal/q;->getKey()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v0, v3}, Lcom/google/android/gms/internal/o;->b(Ljava/lang/String;)[B

    move-result-object v0

    sget-object v3, Lcom/google/android/gms/internal/i;->kM:Lcom/google/android/gms/internal/o;

    invoke-static {}, Lcom/google/android/gms/internal/q;->B()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v0, v4}, Lcom/google/android/gms/internal/o;->c([BLjava/lang/String;)[B

    move-result-object v3

    invoke-virtual/range {p0 .. p0}, Landroid/content/Context;->getCacheDir()Ljava/io/File;

    move-result-object v4

    const/4 v5, 0x0

    if-nez v4, :cond_1

    const-string v4, "dex"

    move-object/from16 v6, p0

    invoke-virtual {v6, v4, v5}, Landroid/content/Context;->getDir(Ljava/lang/String;I)Ljava/io/File;

    move-result-object v4

    if-eqz v4, :cond_0

    goto :goto_0

    :cond_0
    new-instance v0, Lcom/google/android/gms/internal/i$a;

    invoke-direct {v0}, Lcom/google/android/gms/internal/i$a;-><init>()V

    throw v0

    :cond_1
    move-object/from16 v6, p0

    :goto_0
    const-string v7, "ads"

    invoke-static {v7, v2, v4}, Ljava/io/File;->createTempFile(Ljava/lang/String;Ljava/lang/String;Ljava/io/File;)Ljava/io/File;

    move-result-object v7

    new-instance v8, Ljava/io/FileOutputStream;

    invoke-direct {v8, v7}, Ljava/io/FileOutputStream;-><init>(Ljava/io/File;)V

    array-length v9, v3

    invoke-virtual {v8, v3, v5, v9}, Ljava/io/FileOutputStream;->write([BII)V

    invoke-virtual {v8}, Ljava/io/FileOutputStream;->close()V
    :try_end_0
    .catch Ljava/io/FileNotFoundException; {:try_start_0 .. :try_end_0} :catch_5
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_4
    .catch Ljava/lang/ClassNotFoundException; {:try_start_0 .. :try_end_0} :catch_3
    .catch Lcom/google/android/gms/internal/o$a; {:try_start_0 .. :try_end_0} :catch_2
    .catch Ljava/lang/NoSuchMethodException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/lang/NullPointerException; {:try_start_0 .. :try_end_0} :catch_0

    :try_start_1
    new-instance v3, Ldalvik/system/DexClassLoader;

    invoke-virtual {v7}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v4}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v9

    invoke-virtual/range {p0 .. p0}, Landroid/content/Context;->getClassLoader()Ljava/lang/ClassLoader;

    move-result-object v6

    const/4 v10, 0x0

    invoke-direct {v3, v8, v9, v10, v6}, Ldalvik/system/DexClassLoader;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/ClassLoader;)V

    invoke-static {}, Lcom/google/android/gms/internal/q;->E()Ljava/lang/String;

    move-result-object v6

    invoke-static {v0, v6}, Lcom/google/android/gms/internal/i;->b([BLjava/lang/String;)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v3, v6}, Ldalvik/system/DexClassLoader;->loadClass(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v6

    invoke-static {}, Lcom/google/android/gms/internal/q;->Q()Ljava/lang/String;

    move-result-object v8

    invoke-static {v0, v8}, Lcom/google/android/gms/internal/i;->b([BLjava/lang/String;)Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v3, v8}, Ldalvik/system/DexClassLoader;->loadClass(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v8

    invoke-static {}, Lcom/google/android/gms/internal/q;->K()Ljava/lang/String;

    move-result-object v9

    invoke-static {v0, v9}, Lcom/google/android/gms/internal/i;->b([BLjava/lang/String;)Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v3, v9}, Ldalvik/system/DexClassLoader;->loadClass(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v9

    invoke-static {}, Lcom/google/android/gms/internal/q;->I()Ljava/lang/String;

    move-result-object v10

    invoke-static {v0, v10}, Lcom/google/android/gms/internal/i;->b([BLjava/lang/String;)Ljava/lang/String;

    move-result-object v10

    invoke-virtual {v3, v10}, Ldalvik/system/DexClassLoader;->loadClass(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v10

    invoke-static {}, Lcom/google/android/gms/internal/q;->S()Ljava/lang/String;

    move-result-object v11

    invoke-static {v0, v11}, Lcom/google/android/gms/internal/i;->b([BLjava/lang/String;)Ljava/lang/String;

    move-result-object v11

    invoke-virtual {v3, v11}, Ldalvik/system/DexClassLoader;->loadClass(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v11

    invoke-static {}, Lcom/google/android/gms/internal/q;->G()Ljava/lang/String;

    move-result-object v12

    invoke-static {v0, v12}, Lcom/google/android/gms/internal/i;->b([BLjava/lang/String;)Ljava/lang/String;

    move-result-object v12

    invoke-virtual {v3, v12}, Ldalvik/system/DexClassLoader;->loadClass(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v12

    invoke-static {}, Lcom/google/android/gms/internal/q;->O()Ljava/lang/String;

    move-result-object v13

    invoke-static {v0, v13}, Lcom/google/android/gms/internal/i;->b([BLjava/lang/String;)Ljava/lang/String;

    move-result-object v13

    invoke-virtual {v3, v13}, Ldalvik/system/DexClassLoader;->loadClass(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v13

    invoke-static {}, Lcom/google/android/gms/internal/q;->M()Ljava/lang/String;

    move-result-object v14

    invoke-static {v0, v14}, Lcom/google/android/gms/internal/i;->b([BLjava/lang/String;)Ljava/lang/String;

    move-result-object v14

    invoke-virtual {v3, v14}, Ldalvik/system/DexClassLoader;->loadClass(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v14

    invoke-static {}, Lcom/google/android/gms/internal/q;->C()Ljava/lang/String;

    move-result-object v15

    invoke-static {v0, v15}, Lcom/google/android/gms/internal/i;->b([BLjava/lang/String;)Ljava/lang/String;

    move-result-object v15

    invoke-virtual {v3, v15}, Ldalvik/system/DexClassLoader;->loadClass(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v3

    invoke-static {}, Lcom/google/android/gms/internal/q;->F()Ljava/lang/String;

    move-result-object v15

    invoke-static {v0, v15}, Lcom/google/android/gms/internal/i;->b([BLjava/lang/String;)Ljava/lang/String;

    move-result-object v15
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    move-object/from16 v16, v4

    :try_start_2
    new-array v4, v5, [Ljava/lang/Class;

    invoke-virtual {v6, v15, v4}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v4

    sput-object v4, Lcom/google/android/gms/internal/i;->kA:Ljava/lang/reflect/Method;

    invoke-static {}, Lcom/google/android/gms/internal/q;->R()Ljava/lang/String;

    move-result-object v4

    invoke-static {v0, v4}, Lcom/google/android/gms/internal/i;->b([BLjava/lang/String;)Ljava/lang/String;

    move-result-object v4

    new-array v6, v5, [Ljava/lang/Class;

    invoke-virtual {v8, v4, v6}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v4

    sput-object v4, Lcom/google/android/gms/internal/i;->kB:Ljava/lang/reflect/Method;

    invoke-static {}, Lcom/google/android/gms/internal/q;->L()Ljava/lang/String;

    move-result-object v4

    invoke-static {v0, v4}, Lcom/google/android/gms/internal/i;->b([BLjava/lang/String;)Ljava/lang/String;

    move-result-object v4

    new-array v6, v5, [Ljava/lang/Class;

    invoke-virtual {v9, v4, v6}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v4

    sput-object v4, Lcom/google/android/gms/internal/i;->kC:Ljava/lang/reflect/Method;

    invoke-static {}, Lcom/google/android/gms/internal/q;->J()Ljava/lang/String;

    move-result-object v4

    invoke-static {v0, v4}, Lcom/google/android/gms/internal/i;->b([BLjava/lang/String;)Ljava/lang/String;

    move-result-object v4

    const/4 v6, 0x1

    new-array v8, v6, [Ljava/lang/Class;

    const-class v9, Landroid/content/Context;

    aput-object v9, v8, v5

    invoke-virtual {v10, v4, v8}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v4

    sput-object v4, Lcom/google/android/gms/internal/i;->kD:Ljava/lang/reflect/Method;

    invoke-static {}, Lcom/google/android/gms/internal/q;->T()Ljava/lang/String;

    move-result-object v4

    invoke-static {v0, v4}, Lcom/google/android/gms/internal/i;->b([BLjava/lang/String;)Ljava/lang/String;

    move-result-object v4

    const/4 v8, 0x2

    new-array v8, v8, [Ljava/lang/Class;

    const-class v9, Landroid/view/MotionEvent;

    aput-object v9, v8, v5

    const-class v9, Landroid/util/DisplayMetrics;

    aput-object v9, v8, v6

    invoke-virtual {v11, v4, v8}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v4

    sput-object v4, Lcom/google/android/gms/internal/i;->kE:Ljava/lang/reflect/Method;

    invoke-static {}, Lcom/google/android/gms/internal/q;->H()Ljava/lang/String;

    move-result-object v4

    invoke-static {v0, v4}, Lcom/google/android/gms/internal/i;->b([BLjava/lang/String;)Ljava/lang/String;

    move-result-object v4

    new-array v8, v6, [Ljava/lang/Class;

    const-class v9, Landroid/content/Context;

    aput-object v9, v8, v5

    invoke-virtual {v12, v4, v8}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v4

    sput-object v4, Lcom/google/android/gms/internal/i;->kF:Ljava/lang/reflect/Method;

    invoke-static {}, Lcom/google/android/gms/internal/q;->P()Ljava/lang/String;

    move-result-object v4

    invoke-static {v0, v4}, Lcom/google/android/gms/internal/i;->b([BLjava/lang/String;)Ljava/lang/String;

    move-result-object v4

    new-array v8, v6, [Ljava/lang/Class;

    const-class v9, Landroid/content/Context;

    aput-object v9, v8, v5

    invoke-virtual {v13, v4, v8}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v4

    sput-object v4, Lcom/google/android/gms/internal/i;->kG:Ljava/lang/reflect/Method;

    invoke-static {}, Lcom/google/android/gms/internal/q;->N()Ljava/lang/String;

    move-result-object v4

    invoke-static {v0, v4}, Lcom/google/android/gms/internal/i;->b([BLjava/lang/String;)Ljava/lang/String;

    move-result-object v4

    new-array v8, v6, [Ljava/lang/Class;

    const-class v9, Landroid/content/Context;

    aput-object v9, v8, v5

    invoke-virtual {v14, v4, v8}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v4

    sput-object v4, Lcom/google/android/gms/internal/i;->kH:Ljava/lang/reflect/Method;

    invoke-static {}, Lcom/google/android/gms/internal/q;->D()Ljava/lang/String;

    move-result-object v4

    invoke-static {v0, v4}, Lcom/google/android/gms/internal/i;->b([BLjava/lang/String;)Ljava/lang/String;

    move-result-object v0

    new-array v4, v6, [Ljava/lang/Class;

    const-class v6, Landroid/content/Context;

    aput-object v6, v4, v5

    invoke-virtual {v3, v0, v4}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v0

    sput-object v0, Lcom/google/android/gms/internal/i;->kI:Ljava/lang/reflect/Method;
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    :try_start_3
    invoke-virtual {v7}, Ljava/io/File;->getName()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v7}, Ljava/io/File;->delete()Z

    new-instance v3, Ljava/io/File;

    invoke-virtual {v0, v2, v1}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object v0

    move-object/from16 v4, v16

    invoke-direct {v3, v4, v0}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    invoke-virtual {v3}, Ljava/io/File;->delete()Z

    return-void

    :catchall_0
    move-exception v0

    move-object/from16 v4, v16

    goto :goto_1

    :catchall_1
    move-exception v0

    :goto_1
    invoke-virtual {v7}, Ljava/io/File;->getName()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v7}, Ljava/io/File;->delete()Z

    new-instance v5, Ljava/io/File;

    invoke-virtual {v3, v2, v1}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object v1

    invoke-direct {v5, v4, v1}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    invoke-virtual {v5}, Ljava/io/File;->delete()Z

    throw v0
    :try_end_3
    .catch Ljava/io/FileNotFoundException; {:try_start_3 .. :try_end_3} :catch_5
    .catch Ljava/io/IOException; {:try_start_3 .. :try_end_3} :catch_4
    .catch Ljava/lang/ClassNotFoundException; {:try_start_3 .. :try_end_3} :catch_3
    .catch Lcom/google/android/gms/internal/o$a; {:try_start_3 .. :try_end_3} :catch_2
    .catch Ljava/lang/NoSuchMethodException; {:try_start_3 .. :try_end_3} :catch_1
    .catch Ljava/lang/NullPointerException; {:try_start_3 .. :try_end_3} :catch_0

    :catch_0
    move-exception v0

    new-instance v1, Lcom/google/android/gms/internal/i$a;

    invoke-direct {v1, v0}, Lcom/google/android/gms/internal/i$a;-><init>(Ljava/lang/Throwable;)V

    throw v1

    :catch_1
    move-exception v0

    new-instance v1, Lcom/google/android/gms/internal/i$a;

    invoke-direct {v1, v0}, Lcom/google/android/gms/internal/i$a;-><init>(Ljava/lang/Throwable;)V

    throw v1

    :catch_2
    move-exception v0

    new-instance v1, Lcom/google/android/gms/internal/i$a;

    invoke-direct {v1, v0}, Lcom/google/android/gms/internal/i$a;-><init>(Ljava/lang/Throwable;)V

    throw v1

    :catch_3
    move-exception v0

    new-instance v1, Lcom/google/android/gms/internal/i$a;

    invoke-direct {v1, v0}, Lcom/google/android/gms/internal/i$a;-><init>(Ljava/lang/Throwable;)V

    throw v1

    :catch_4
    move-exception v0

    new-instance v1, Lcom/google/android/gms/internal/i$a;

    invoke-direct {v1, v0}, Lcom/google/android/gms/internal/i$a;-><init>(Ljava/lang/Throwable;)V

    throw v1

    :catch_5
    move-exception v0

    new-instance v1, Lcom/google/android/gms/internal/i$a;

    invoke-direct {v1, v0}, Lcom/google/android/gms/internal/i$a;-><init>(Ljava/lang/Throwable;)V

    throw v1
.end method

.method static v()Ljava/lang/String;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/android/gms/internal/i$a;
        }
    .end annotation

    sget-object v0, Lcom/google/android/gms/internal/i;->kJ:Ljava/lang/String;

    if-eqz v0, :cond_0

    return-object v0

    :cond_0
    new-instance v0, Lcom/google/android/gms/internal/i$a;

    invoke-direct {v0}, Lcom/google/android/gms/internal/i$a;-><init>()V

    throw v0
.end method

.method static w()Ljava/lang/Long;
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/android/gms/internal/i$a;
        }
    .end annotation

    sget-object v0, Lcom/google/android/gms/internal/i;->kA:Ljava/lang/reflect/Method;

    if-eqz v0, :cond_0

    const/4 v1, 0x0

    :try_start_0
    new-array v1, v1, [Ljava/lang/Object;

    const/4 v2, 0x0

    invoke-virtual {v0, v2, v1}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Long;
    :try_end_0
    .catch Ljava/lang/IllegalAccessException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/lang/reflect/InvocationTargetException; {:try_start_0 .. :try_end_0} :catch_0

    return-object v0

    :catch_0
    move-exception v0

    new-instance v1, Lcom/google/android/gms/internal/i$a;

    invoke-direct {v1, v0}, Lcom/google/android/gms/internal/i$a;-><init>(Ljava/lang/Throwable;)V

    throw v1

    :catch_1
    move-exception v0

    new-instance v1, Lcom/google/android/gms/internal/i$a;

    invoke-direct {v1, v0}, Lcom/google/android/gms/internal/i$a;-><init>(Ljava/lang/Throwable;)V

    throw v1

    :cond_0
    new-instance v0, Lcom/google/android/gms/internal/i$a;

    invoke-direct {v0}, Lcom/google/android/gms/internal/i$a;-><init>()V

    throw v0
.end method

.method static x()Ljava/lang/String;
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/android/gms/internal/i$a;
        }
    .end annotation

    sget-object v0, Lcom/google/android/gms/internal/i;->kC:Ljava/lang/reflect/Method;

    if-eqz v0, :cond_0

    const/4 v1, 0x0

    :try_start_0
    new-array v1, v1, [Ljava/lang/Object;

    const/4 v2, 0x0

    invoke-virtual {v0, v2, v1}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;
    :try_end_0
    .catch Ljava/lang/IllegalAccessException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/lang/reflect/InvocationTargetException; {:try_start_0 .. :try_end_0} :catch_0

    return-object v0

    :catch_0
    move-exception v0

    new-instance v1, Lcom/google/android/gms/internal/i$a;

    invoke-direct {v1, v0}, Lcom/google/android/gms/internal/i$a;-><init>(Ljava/lang/Throwable;)V

    throw v1

    :catch_1
    move-exception v0

    new-instance v1, Lcom/google/android/gms/internal/i$a;

    invoke-direct {v1, v0}, Lcom/google/android/gms/internal/i$a;-><init>(Ljava/lang/Throwable;)V

    throw v1

    :cond_0
    new-instance v0, Lcom/google/android/gms/internal/i$a;

    invoke-direct {v0}, Lcom/google/android/gms/internal/i$a;-><init>()V

    throw v0
.end method

.method static y()Ljava/lang/Long;
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/android/gms/internal/i$a;
        }
    .end annotation

    sget-object v0, Lcom/google/android/gms/internal/i;->kB:Ljava/lang/reflect/Method;

    if-eqz v0, :cond_0

    const/4 v1, 0x0

    :try_start_0
    new-array v1, v1, [Ljava/lang/Object;

    const/4 v2, 0x0

    invoke-virtual {v0, v2, v1}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Long;
    :try_end_0
    .catch Ljava/lang/IllegalAccessException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/lang/reflect/InvocationTargetException; {:try_start_0 .. :try_end_0} :catch_0

    return-object v0

    :catch_0
    move-exception v0

    new-instance v1, Lcom/google/android/gms/internal/i$a;

    invoke-direct {v1, v0}, Lcom/google/android/gms/internal/i$a;-><init>(Ljava/lang/Throwable;)V

    throw v1

    :catch_1
    move-exception v0

    new-instance v1, Lcom/google/android/gms/internal/i$a;

    invoke-direct {v1, v0}, Lcom/google/android/gms/internal/i$a;-><init>(Ljava/lang/Throwable;)V

    throw v1

    :cond_0
    new-instance v0, Lcom/google/android/gms/internal/i$a;

    invoke-direct {v0}, Lcom/google/android/gms/internal/i$a;-><init>()V

    throw v0
.end method


# virtual methods
.method protected b(Landroid/content/Context;)V
    .locals 7

    const/4 v0, 0x1

    :try_start_0
    invoke-static {}, Lcom/google/android/gms/internal/i;->x()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p0, v0, v1}, Lcom/google/android/gms/internal/i;->a(ILjava/lang/String;)V
    :try_end_0
    .catch Lcom/google/android/gms/internal/i$a; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_7

    :catch_0
    :try_start_1
    invoke-static {}, Lcom/google/android/gms/internal/i;->v()Ljava/lang/String;

    move-result-object v1

    const/4 v2, 0x2

    invoke-virtual {p0, v2, v1}, Lcom/google/android/gms/internal/i;->a(ILjava/lang/String;)V
    :try_end_1
    .catch Lcom/google/android/gms/internal/i$a; {:try_start_1 .. :try_end_1} :catch_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_7

    :catch_1
    :try_start_2
    invoke-static {}, Lcom/google/android/gms/internal/i;->w()Ljava/lang/Long;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Long;->longValue()J

    move-result-wide v1

    const/16 v3, 0x19

    invoke-virtual {p0, v3, v1, v2}, Lcom/google/android/gms/internal/i;->a(IJ)V

    sget-wide v3, Lcom/google/android/gms/internal/i;->startTime:J

    const-wide/16 v5, 0x0

    cmp-long v5, v3, v5

    if-eqz v5, :cond_0

    sub-long/2addr v1, v3

    const/16 v3, 0x11

    invoke-virtual {p0, v3, v1, v2}, Lcom/google/android/gms/internal/i;->a(IJ)V

    sget-wide v1, Lcom/google/android/gms/internal/i;->startTime:J

    const/16 v3, 0x17

    invoke-virtual {p0, v3, v1, v2}, Lcom/google/android/gms/internal/i;->a(IJ)V
    :try_end_2
    .catch Lcom/google/android/gms/internal/i$a; {:try_start_2 .. :try_end_2} :catch_2
    .catch Ljava/io/IOException; {:try_start_2 .. :try_end_2} :catch_7

    :catch_2
    :cond_0
    const/4 v1, 0x0

    :try_start_3
    invoke-static {p1}, Lcom/google/android/gms/internal/i;->e(Landroid/content/Context;)Ljava/util/ArrayList;

    move-result-object v2

    invoke-virtual {v2, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/Long;

    invoke-virtual {v3}, Ljava/lang/Long;->longValue()J

    move-result-wide v3

    const/16 v5, 0x1f

    invoke-virtual {p0, v5, v3, v4}, Lcom/google/android/gms/internal/i;->a(IJ)V

    invoke-virtual {v2, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/Long;

    invoke-virtual {v2}, Ljava/lang/Long;->longValue()J

    move-result-wide v2

    const/16 v4, 0x20

    invoke-virtual {p0, v4, v2, v3}, Lcom/google/android/gms/internal/i;->a(IJ)V
    :try_end_3
    .catch Lcom/google/android/gms/internal/i$a; {:try_start_3 .. :try_end_3} :catch_3
    .catch Ljava/io/IOException; {:try_start_3 .. :try_end_3} :catch_7

    :catch_3
    :try_start_4
    invoke-static {}, Lcom/google/android/gms/internal/i;->y()Ljava/lang/Long;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Long;->longValue()J

    move-result-wide v2

    const/16 v4, 0x21

    invoke-virtual {p0, v4, v2, v3}, Lcom/google/android/gms/internal/i;->a(IJ)V
    :try_end_4
    .catch Lcom/google/android/gms/internal/i$a; {:try_start_4 .. :try_end_4} :catch_4
    .catch Ljava/io/IOException; {:try_start_4 .. :try_end_4} :catch_7

    :catch_4
    :try_start_5
    iget-object v2, p0, Lcom/google/android/gms/internal/i;->ky:Lcom/google/android/gms/internal/m;

    invoke-static {p1, v2}, Lcom/google/android/gms/internal/i;->a(Landroid/content/Context;Lcom/google/android/gms/internal/m;)Ljava/lang/String;

    move-result-object v2

    const/16 v3, 0x1b

    invoke-virtual {p0, v3, v2}, Lcom/google/android/gms/internal/i;->a(ILjava/lang/String;)V
    :try_end_5
    .catch Lcom/google/android/gms/internal/i$a; {:try_start_5 .. :try_end_5} :catch_5
    .catch Ljava/io/IOException; {:try_start_5 .. :try_end_5} :catch_7

    :catch_5
    :try_start_6
    iget-object v2, p0, Lcom/google/android/gms/internal/i;->ky:Lcom/google/android/gms/internal/m;

    invoke-static {p1, v2}, Lcom/google/android/gms/internal/i;->b(Landroid/content/Context;Lcom/google/android/gms/internal/m;)Ljava/lang/String;

    move-result-object v2

    const/16 v3, 0x1d

    invoke-virtual {p0, v3, v2}, Lcom/google/android/gms/internal/i;->a(ILjava/lang/String;)V
    :try_end_6
    .catch Lcom/google/android/gms/internal/i$a; {:try_start_6 .. :try_end_6} :catch_6
    .catch Ljava/io/IOException; {:try_start_6 .. :try_end_6} :catch_7

    :catch_6
    :try_start_7
    invoke-static {p1}, Lcom/google/android/gms/internal/i;->f(Landroid/content/Context;)[I

    move-result-object p1

    aget v1, p1, v1

    int-to-long v1, v1

    const/4 v3, 0x5

    invoke-virtual {p0, v3, v1, v2}, Lcom/google/android/gms/internal/i;->a(IJ)V

    aget p1, p1, v0

    int-to-long v0, p1

    const/4 p1, 0x6

    invoke-virtual {p0, p1, v0, v1}, Lcom/google/android/gms/internal/i;->a(IJ)V
    :try_end_7
    .catch Lcom/google/android/gms/internal/i$a; {:try_start_7 .. :try_end_7} :catch_7
    .catch Ljava/io/IOException; {:try_start_7 .. :try_end_7} :catch_7

    :catch_7
    return-void
.end method

.method protected c(Landroid/content/Context;)V
    .locals 5

    const/4 p1, 0x2

    :try_start_0
    invoke-static {}, Lcom/google/android/gms/internal/i;->v()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, p1, v0}, Lcom/google/android/gms/internal/i;->a(ILjava/lang/String;)V
    :try_end_0
    .catch Lcom/google/android/gms/internal/i$a; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_3

    :catch_0
    const/4 v0, 0x1

    :try_start_1
    invoke-static {}, Lcom/google/android/gms/internal/i;->x()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p0, v0, v1}, Lcom/google/android/gms/internal/i;->a(ILjava/lang/String;)V
    :try_end_1
    .catch Lcom/google/android/gms/internal/i$a; {:try_start_1 .. :try_end_1} :catch_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_3

    :catch_1
    :try_start_2
    invoke-static {}, Lcom/google/android/gms/internal/i;->w()Ljava/lang/Long;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Long;->longValue()J

    move-result-wide v1

    const/16 v3, 0x19

    invoke-virtual {p0, v3, v1, v2}, Lcom/google/android/gms/internal/i;->a(IJ)V
    :try_end_2
    .catch Lcom/google/android/gms/internal/i$a; {:try_start_2 .. :try_end_2} :catch_2
    .catch Ljava/io/IOException; {:try_start_2 .. :try_end_2} :catch_3

    :catch_2
    :try_start_3
    iget-object v1, p0, Lcom/google/android/gms/internal/i;->kw:Landroid/view/MotionEvent;

    iget-object v2, p0, Lcom/google/android/gms/internal/i;->kx:Landroid/util/DisplayMetrics;

    invoke-static {v1, v2}, Lcom/google/android/gms/internal/i;->a(Landroid/view/MotionEvent;Landroid/util/DisplayMetrics;)Ljava/util/ArrayList;

    move-result-object v1

    const/4 v2, 0x0

    invoke-virtual {v1, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/Long;

    invoke-virtual {v2}, Ljava/lang/Long;->longValue()J

    move-result-wide v2

    const/16 v4, 0xe

    invoke-virtual {p0, v4, v2, v3}, Lcom/google/android/gms/internal/i;->a(IJ)V

    invoke-virtual {v1, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Long;

    invoke-virtual {v0}, Ljava/lang/Long;->longValue()J

    move-result-wide v2

    const/16 v0, 0xf

    invoke-virtual {p0, v0, v2, v3}, Lcom/google/android/gms/internal/i;->a(IJ)V

    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v0

    const/4 v2, 0x3

    if-lt v0, v2, :cond_0

    invoke-virtual {v1, p1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/lang/Long;

    invoke-virtual {p1}, Ljava/lang/Long;->longValue()J

    move-result-wide v0

    const/16 p1, 0x10

    invoke-virtual {p0, p1, v0, v1}, Lcom/google/android/gms/internal/i;->a(IJ)V
    :try_end_3
    .catch Lcom/google/android/gms/internal/i$a; {:try_start_3 .. :try_end_3} :catch_3
    .catch Ljava/io/IOException; {:try_start_3 .. :try_end_3} :catch_3

    :catch_3
    :cond_0
    return-void
.end method
