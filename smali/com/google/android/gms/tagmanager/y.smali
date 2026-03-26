.class Lcom/google/android/gms/tagmanager/y;
.super Ljava/lang/Object;

# interfaces
.implements Lcom/google/android/gms/tagmanager/aq;


# static fields
.field private static apb:Lcom/google/android/gms/tagmanager/y;

.field private static final xz:Ljava/lang/Object;


# instance fields
.field private aos:Lcom/google/android/gms/tagmanager/cg;

.field private apc:Ljava/lang/String;

.field private apd:Ljava/lang/String;

.field private ape:Lcom/google/android/gms/tagmanager/ar;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    new-instance v0, Ljava/lang/Object;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    sput-object v0, Lcom/google/android/gms/tagmanager/y;->xz:Ljava/lang/Object;

    return-void
.end method

.method private constructor <init>(Landroid/content/Context;)V
    .locals 1

    invoke-static {p1}, Lcom/google/android/gms/tagmanager/as;->Z(Landroid/content/Context;)Lcom/google/android/gms/tagmanager/as;

    move-result-object p1

    new-instance v0, Lcom/google/android/gms/tagmanager/cw;

    invoke-direct {v0}, Lcom/google/android/gms/tagmanager/cw;-><init>()V

    invoke-direct {p0, p1, v0}, Lcom/google/android/gms/tagmanager/y;-><init>(Lcom/google/android/gms/tagmanager/ar;Lcom/google/android/gms/tagmanager/cg;)V

    return-void
.end method

.method constructor <init>(Lcom/google/android/gms/tagmanager/ar;Lcom/google/android/gms/tagmanager/cg;)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/google/android/gms/tagmanager/y;->ape:Lcom/google/android/gms/tagmanager/ar;

    iput-object p2, p0, Lcom/google/android/gms/tagmanager/y;->aos:Lcom/google/android/gms/tagmanager/cg;

    return-void
.end method

.method public static X(Landroid/content/Context;)Lcom/google/android/gms/tagmanager/aq;
    .locals 2

    sget-object v0, Lcom/google/android/gms/tagmanager/y;->xz:Ljava/lang/Object;

    monitor-enter v0

    :try_start_0
    sget-object v1, Lcom/google/android/gms/tagmanager/y;->apb:Lcom/google/android/gms/tagmanager/y;

    if-nez v1, :cond_0

    new-instance v1, Lcom/google/android/gms/tagmanager/y;

    invoke-direct {v1, p0}, Lcom/google/android/gms/tagmanager/y;-><init>(Landroid/content/Context;)V

    sput-object v1, Lcom/google/android/gms/tagmanager/y;->apb:Lcom/google/android/gms/tagmanager/y;

    :cond_0
    sget-object p0, Lcom/google/android/gms/tagmanager/y;->apb:Lcom/google/android/gms/tagmanager/y;

    monitor-exit v0

    return-object p0

    :catchall_0
    move-exception p0

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw p0
.end method


# virtual methods
.method public cz(Ljava/lang/String;)Z
    .locals 4

    const-string v0, "Sending wrapped url hit: "

    iget-object v1, p0, Lcom/google/android/gms/tagmanager/y;->aos:Lcom/google/android/gms/tagmanager/cg;

    invoke-interface {v1}, Lcom/google/android/gms/tagmanager/cg;->eJ()Z

    move-result v1

    const/4 v2, 0x0

    if-nez v1, :cond_0

    const-string p0, "Too many urls sent too quickly with the TagManagerSender, rate limiting invoked."

    invoke-static {p0}, Lcom/google/android/gms/tagmanager/bh;->W(Ljava/lang/String;)V

    return v2

    :cond_0
    iget-object v1, p0, Lcom/google/android/gms/tagmanager/y;->apc:Ljava/lang/String;

    if-eqz v1, :cond_1

    iget-object v1, p0, Lcom/google/android/gms/tagmanager/y;->apd:Ljava/lang/String;

    if-eqz v1, :cond_1

    :try_start_0
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v3, p0, Lcom/google/android/gms/tagmanager/y;->apc:Ljava/lang/String;

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v3, "?"

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v3, p0, Lcom/google/android/gms/tagmanager/y;->apd:Ljava/lang/String;

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v3, "="

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v3, "UTF-8"

    invoke-static {p1, v3}, Ljava/net/URLEncoder;->encode(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/google/android/gms/tagmanager/bh;->V(Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/io/UnsupportedEncodingException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception p0

    const-string p1, "Error wrapping URL for testing."

    invoke-static {p1, p0}, Lcom/google/android/gms/tagmanager/bh;->d(Ljava/lang/String;Ljava/lang/Throwable;)V

    return v2

    :cond_1
    :goto_0
    iget-object p0, p0, Lcom/google/android/gms/tagmanager/y;->ape:Lcom/google/android/gms/tagmanager/ar;

    invoke-interface {p0, p1}, Lcom/google/android/gms/tagmanager/ar;->cC(Ljava/lang/String;)V

    const/4 p0, 0x1

    return p0
.end method
