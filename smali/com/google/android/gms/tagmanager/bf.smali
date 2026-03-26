.class Lcom/google/android/gms/tagmanager/bf;
.super Ljava/lang/Object;

# interfaces
.implements Lcom/google/android/gms/tagmanager/cg;


# instance fields
.field private final AN:J

.field private final AO:I

.field private AP:D

.field private AQ:J

.field private final AR:Ljava/lang/Object;

.field private final AS:Ljava/lang/String;

.field private final apL:J

.field private final yD:Lcom/google/android/gms/internal/ju;


# direct methods
.method public constructor <init>(IJJLjava/lang/String;Lcom/google/android/gms/internal/ju;)V
    .locals 2

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance v0, Ljava/lang/Object;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    iput-object v0, p0, Lcom/google/android/gms/tagmanager/bf;->AR:Ljava/lang/Object;

    iput p1, p0, Lcom/google/android/gms/tagmanager/bf;->AO:I

    int-to-double v0, p1

    iput-wide v0, p0, Lcom/google/android/gms/tagmanager/bf;->AP:D

    iput-wide p2, p0, Lcom/google/android/gms/tagmanager/bf;->AN:J

    iput-wide p4, p0, Lcom/google/android/gms/tagmanager/bf;->apL:J

    iput-object p6, p0, Lcom/google/android/gms/tagmanager/bf;->AS:Ljava/lang/String;

    iput-object p7, p0, Lcom/google/android/gms/tagmanager/bf;->yD:Lcom/google/android/gms/internal/ju;

    return-void
.end method


# virtual methods
.method public eJ()Z
    .locals 13

    const-string v0, "Excessive "

    const-string v1, "Excessive "

    iget-object v2, p0, Lcom/google/android/gms/tagmanager/bf;->AR:Ljava/lang/Object;

    monitor-enter v2

    :try_start_0
    iget-object v3, p0, Lcom/google/android/gms/tagmanager/bf;->yD:Lcom/google/android/gms/internal/ju;

    invoke-interface {v3}, Lcom/google/android/gms/internal/ju;->currentTimeMillis()J

    move-result-wide v3

    iget-wide v5, p0, Lcom/google/android/gms/tagmanager/bf;->AQ:J

    sub-long v7, v3, v5

    iget-wide v9, p0, Lcom/google/android/gms/tagmanager/bf;->apL:J

    cmp-long v7, v7, v9

    const/4 v8, 0x0

    if-gez v7, :cond_0

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object p0, p0, Lcom/google/android/gms/tagmanager/bf;->AS:Ljava/lang/String;

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p0

    const-string v0, " detected; call ignored."

    invoke-virtual {p0, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-static {p0}, Lcom/google/android/gms/tagmanager/bh;->W(Ljava/lang/String;)V

    monitor-exit v2

    return v8

    :cond_0
    iget-wide v9, p0, Lcom/google/android/gms/tagmanager/bf;->AP:D

    iget v1, p0, Lcom/google/android/gms/tagmanager/bf;->AO:I

    int-to-double v11, v1

    cmpg-double v7, v9, v11

    if-gez v7, :cond_1

    sub-long v5, v3, v5

    long-to-double v5, v5

    iget-wide v11, p0, Lcom/google/android/gms/tagmanager/bf;->AN:J

    long-to-double v11, v11

    div-double/2addr v5, v11

    const-wide/16 v11, 0x0

    cmpl-double v7, v5, v11

    if-lez v7, :cond_1

    int-to-double v11, v1

    add-double/2addr v9, v5

    invoke-static {v11, v12, v9, v10}, Ljava/lang/Math;->min(DD)D

    move-result-wide v5

    iput-wide v5, p0, Lcom/google/android/gms/tagmanager/bf;->AP:D

    :cond_1
    iput-wide v3, p0, Lcom/google/android/gms/tagmanager/bf;->AQ:J

    iget-wide v3, p0, Lcom/google/android/gms/tagmanager/bf;->AP:D

    const-wide/high16 v5, 0x3ff0000000000000L    # 1.0

    cmpl-double v1, v3, v5

    if-ltz v1, :cond_2

    sub-double/2addr v3, v5

    iput-wide v3, p0, Lcom/google/android/gms/tagmanager/bf;->AP:D

    monitor-exit v2

    const/4 p0, 0x1

    return p0

    :cond_2
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object p0, p0, Lcom/google/android/gms/tagmanager/bf;->AS:Ljava/lang/String;

    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p0

    const-string v0, " detected; call ignored."

    invoke-virtual {p0, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-static {p0}, Lcom/google/android/gms/tagmanager/bh;->W(Ljava/lang/String;)V

    monitor-exit v2

    return v8

    :catchall_0
    move-exception p0

    monitor-exit v2
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw p0
.end method
