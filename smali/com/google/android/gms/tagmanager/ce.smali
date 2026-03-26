.class Lcom/google/android/gms/tagmanager/ce;
.super Ljava/lang/Object;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/google/android/gms/tagmanager/ce$a;
    }
.end annotation


# static fields
.field private static aqd:Lcom/google/android/gms/tagmanager/ce;


# instance fields
.field private volatile aoc:Ljava/lang/String;

.field private volatile aqe:Lcom/google/android/gms/tagmanager/ce$a;

.field private volatile aqf:Ljava/lang/String;

.field private volatile aqg:Ljava/lang/String;


# direct methods
.method constructor <init>()V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    invoke-virtual {p0}, Lcom/google/android/gms/tagmanager/ce;->clear()V

    return-void
.end method

.method private cI(Ljava/lang/String;)Ljava/lang/String;
    .locals 0

    const-string p0, "&"

    invoke-virtual {p1, p0}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object p0

    const/4 p1, 0x0

    aget-object p0, p0, p1

    const-string p1, "="

    invoke-virtual {p0, p1}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object p0

    const/4 p1, 0x1

    aget-object p0, p0, p1

    return-object p0
.end method

.method private j(Landroid/net/Uri;)Ljava/lang/String;
    .locals 1

    invoke-virtual {p1}, Landroid/net/Uri;->getQuery()Ljava/lang/String;

    move-result-object p0

    const-string p1, "&gtm_debug=x"

    const-string v0, ""

    invoke-virtual {p0, p1, v0}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method static oJ()Lcom/google/android/gms/tagmanager/ce;
    .locals 2

    const-class v0, Lcom/google/android/gms/tagmanager/ce;

    monitor-enter v0

    :try_start_0
    sget-object v1, Lcom/google/android/gms/tagmanager/ce;->aqd:Lcom/google/android/gms/tagmanager/ce;

    if-nez v1, :cond_0

    new-instance v1, Lcom/google/android/gms/tagmanager/ce;

    invoke-direct {v1}, Lcom/google/android/gms/tagmanager/ce;-><init>()V

    sput-object v1, Lcom/google/android/gms/tagmanager/ce;->aqd:Lcom/google/android/gms/tagmanager/ce;

    :cond_0
    sget-object v1, Lcom/google/android/gms/tagmanager/ce;->aqd:Lcom/google/android/gms/tagmanager/ce;

    monitor-exit v0

    return-object v1

    :catchall_0
    move-exception v1

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v1
.end method


# virtual methods
.method clear()V
    .locals 1

    sget-object v0, Lcom/google/android/gms/tagmanager/ce$a;->aqh:Lcom/google/android/gms/tagmanager/ce$a;

    iput-object v0, p0, Lcom/google/android/gms/tagmanager/ce;->aqe:Lcom/google/android/gms/tagmanager/ce$a;

    const/4 v0, 0x0

    iput-object v0, p0, Lcom/google/android/gms/tagmanager/ce;->aqf:Ljava/lang/String;

    iput-object v0, p0, Lcom/google/android/gms/tagmanager/ce;->aoc:Ljava/lang/String;

    iput-object v0, p0, Lcom/google/android/gms/tagmanager/ce;->aqg:Ljava/lang/String;

    return-void
.end method

.method getContainerId()Ljava/lang/String;
    .locals 0

    iget-object p0, p0, Lcom/google/android/gms/tagmanager/ce;->aoc:Ljava/lang/String;

    return-object p0
.end method

.method declared-synchronized i(Landroid/net/Uri;)Z
    .locals 8

    const-string v0, "/r?"

    const-string v1, "Exit preview mode for container: "

    const-string v2, "Invalid preview uri: "

    const-string v3, "Container preview url: "

    monitor-enter p0

    const/4 v4, 0x0

    :try_start_0
    invoke-virtual {p1}, Landroid/net/Uri;->toString()Ljava/lang/String;

    move-result-object v5

    const-string v6, "UTF-8"

    invoke-static {v5, v6}, Ljava/net/URLDecoder;->decode(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5
    :try_end_0
    .catch Ljava/io/UnsupportedEncodingException; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    :try_start_1
    const-string v6, "^tagmanager.c.\\S+:\\/\\/preview\\/p\\?id=\\S+&gtm_auth=\\S+&gtm_preview=\\d+(&gtm_debug=x)?$"

    invoke-virtual {v5, v6}, Ljava/lang/String;->matches(Ljava/lang/String;)Z

    move-result v6

    const/4 v7, 0x1

    if-eqz v6, :cond_3

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Lcom/google/android/gms/tagmanager/bh;->V(Ljava/lang/String;)V

    const-string v1, ".*?&gtm_debug=x$"

    invoke-virtual {v5, v1}, Ljava/lang/String;->matches(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_0

    sget-object v1, Lcom/google/android/gms/tagmanager/ce$a;->aqj:Lcom/google/android/gms/tagmanager/ce$a;

    :goto_0
    iput-object v1, p0, Lcom/google/android/gms/tagmanager/ce;->aqe:Lcom/google/android/gms/tagmanager/ce$a;

    goto :goto_1

    :cond_0
    sget-object v1, Lcom/google/android/gms/tagmanager/ce$a;->aqi:Lcom/google/android/gms/tagmanager/ce$a;

    goto :goto_0

    :goto_1
    invoke-direct {p0, p1}, Lcom/google/android/gms/tagmanager/ce;->j(Landroid/net/Uri;)Ljava/lang/String;

    move-result-object p1

    iput-object p1, p0, Lcom/google/android/gms/tagmanager/ce;->aqg:Ljava/lang/String;

    iget-object p1, p0, Lcom/google/android/gms/tagmanager/ce;->aqe:Lcom/google/android/gms/tagmanager/ce$a;

    sget-object v1, Lcom/google/android/gms/tagmanager/ce$a;->aqi:Lcom/google/android/gms/tagmanager/ce$a;

    if-eq p1, v1, :cond_1

    iget-object p1, p0, Lcom/google/android/gms/tagmanager/ce;->aqe:Lcom/google/android/gms/tagmanager/ce$a;

    sget-object v1, Lcom/google/android/gms/tagmanager/ce$a;->aqj:Lcom/google/android/gms/tagmanager/ce$a;

    if-ne p1, v1, :cond_2

    :cond_1
    new-instance p1, Ljava/lang/StringBuilder;

    invoke-direct {p1, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v0, p0, Lcom/google/android/gms/tagmanager/ce;->aqg:Ljava/lang/String;

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    iput-object p1, p0, Lcom/google/android/gms/tagmanager/ce;->aqf:Ljava/lang/String;

    :cond_2
    iget-object p1, p0, Lcom/google/android/gms/tagmanager/ce;->aqg:Ljava/lang/String;

    invoke-direct {p0, p1}, Lcom/google/android/gms/tagmanager/ce;->cI(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    iput-object p1, p0, Lcom/google/android/gms/tagmanager/ce;->aoc:Ljava/lang/String;
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    monitor-exit p0

    return v7

    :cond_3
    :try_start_2
    const-string v0, "^tagmanager.c.\\S+:\\/\\/preview\\/p\\?id=\\S+&gtm_preview=$"

    invoke-virtual {v5, v0}, Ljava/lang/String;->matches(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_5

    invoke-virtual {p1}, Landroid/net/Uri;->getQuery()Ljava/lang/String;

    move-result-object p1

    invoke-direct {p0, p1}, Lcom/google/android/gms/tagmanager/ce;->cI(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    iget-object v0, p0, Lcom/google/android/gms/tagmanager/ce;->aoc:Ljava/lang/String;

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_4

    new-instance p1, Ljava/lang/StringBuilder;

    invoke-direct {p1, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v0, p0, Lcom/google/android/gms/tagmanager/ce;->aoc:Ljava/lang/String;

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {p1}, Lcom/google/android/gms/tagmanager/bh;->V(Ljava/lang/String;)V

    sget-object p1, Lcom/google/android/gms/tagmanager/ce$a;->aqh:Lcom/google/android/gms/tagmanager/ce$a;

    iput-object p1, p0, Lcom/google/android/gms/tagmanager/ce;->aqe:Lcom/google/android/gms/tagmanager/ce$a;

    const/4 p1, 0x0

    iput-object p1, p0, Lcom/google/android/gms/tagmanager/ce;->aqf:Ljava/lang/String;
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    monitor-exit p0

    return v7

    :cond_4
    monitor-exit p0

    return v4

    :cond_5
    :try_start_3
    new-instance p1, Ljava/lang/StringBuilder;

    invoke-direct {p1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p1, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {p1}, Lcom/google/android/gms/tagmanager/bh;->W(Ljava/lang/String;)V
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    monitor-exit p0

    return v4

    :catchall_0
    move-exception p1

    monitor-exit p0

    throw p1

    :catch_0
    monitor-exit p0

    return v4
.end method

.method oK()Lcom/google/android/gms/tagmanager/ce$a;
    .locals 0

    iget-object p0, p0, Lcom/google/android/gms/tagmanager/ce;->aqe:Lcom/google/android/gms/tagmanager/ce$a;

    return-object p0
.end method

.method oL()Ljava/lang/String;
    .locals 0

    iget-object p0, p0, Lcom/google/android/gms/tagmanager/ce;->aqf:Ljava/lang/String;

    return-object p0
.end method
