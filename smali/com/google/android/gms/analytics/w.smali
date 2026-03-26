.class Lcom/google/android/gms/analytics/w;
.super Ljava/lang/Object;


# instance fields
.field private AE:Ljava/lang/String;

.field private final AF:J

.field private final AG:J

.field private AH:Ljava/lang/String;


# direct methods
.method constructor <init>(Ljava/lang/String;JJ)V
    .locals 1

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const-string v0, "https:"

    iput-object v0, p0, Lcom/google/android/gms/analytics/w;->AH:Ljava/lang/String;

    iput-object p1, p0, Lcom/google/android/gms/analytics/w;->AE:Ljava/lang/String;

    iput-wide p2, p0, Lcom/google/android/gms/analytics/w;->AF:J

    iput-wide p4, p0, Lcom/google/android/gms/analytics/w;->AG:J

    return-void
.end method


# virtual methods
.method aj(Ljava/lang/String;)V
    .locals 0

    iput-object p1, p0, Lcom/google/android/gms/analytics/w;->AE:Ljava/lang/String;

    return-void
.end method

.method ak(Ljava/lang/String;)V
    .locals 1

    if-eqz p1, :cond_1

    invoke-virtual {p1}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_0

    goto :goto_0

    :cond_0
    invoke-virtual {p1}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object p1

    const-string v0, "http:"

    invoke-virtual {p1, v0}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result p1

    if-eqz p1, :cond_1

    iput-object v0, p0, Lcom/google/android/gms/analytics/w;->AH:Ljava/lang/String;

    :cond_1
    :goto_0
    return-void
.end method

.method eF()Ljava/lang/String;
    .locals 0

    iget-object p0, p0, Lcom/google/android/gms/analytics/w;->AE:Ljava/lang/String;

    return-object p0
.end method

.method eG()J
    .locals 2

    iget-wide v0, p0, Lcom/google/android/gms/analytics/w;->AF:J

    return-wide v0
.end method

.method eH()J
    .locals 2

    iget-wide v0, p0, Lcom/google/android/gms/analytics/w;->AG:J

    return-wide v0
.end method

.method eI()Ljava/lang/String;
    .locals 0

    iget-object p0, p0, Lcom/google/android/gms/analytics/w;->AH:Ljava/lang/String;

    return-object p0
.end method
