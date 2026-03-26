.class Lcom/google/android/gms/analytics/y;
.super Ljava/lang/Object;

# interfaces
.implements Lcom/google/android/gms/analytics/ac;


# instance fields
.field private final AN:J

.field private final AO:I

.field private AP:D

.field private AQ:J

.field private final AR:Ljava/lang/Object;

.field private final AS:Ljava/lang/String;


# direct methods
.method public constructor <init>(IJLjava/lang/String;)V
    .locals 2

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance v0, Ljava/lang/Object;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    iput-object v0, p0, Lcom/google/android/gms/analytics/y;->AR:Ljava/lang/Object;

    iput p1, p0, Lcom/google/android/gms/analytics/y;->AO:I

    int-to-double v0, p1

    iput-wide v0, p0, Lcom/google/android/gms/analytics/y;->AP:D

    iput-wide p2, p0, Lcom/google/android/gms/analytics/y;->AN:J

    iput-object p4, p0, Lcom/google/android/gms/analytics/y;->AS:Ljava/lang/String;

    return-void
.end method

.method public constructor <init>(Ljava/lang/String;)V
    .locals 3

    const/16 v0, 0x3c

    const-wide/16 v1, 0x7d0

    invoke-direct {p0, v0, v1, v2, p1}, Lcom/google/android/gms/analytics/y;-><init>(IJLjava/lang/String;)V

    return-void
.end method


# virtual methods
.method public eJ()Z
    .locals 11

    const-string v0, "Excessive "

    iget-object v1, p0, Lcom/google/android/gms/analytics/y;->AR:Ljava/lang/Object;

    monitor-enter v1

    :try_start_0
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v2

    iget-wide v4, p0, Lcom/google/android/gms/analytics/y;->AP:D

    iget v6, p0, Lcom/google/android/gms/analytics/y;->AO:I

    int-to-double v7, v6

    cmpg-double v7, v4, v7

    if-gez v7, :cond_0

    iget-wide v7, p0, Lcom/google/android/gms/analytics/y;->AQ:J

    sub-long v7, v2, v7

    long-to-double v7, v7

    iget-wide v9, p0, Lcom/google/android/gms/analytics/y;->AN:J

    long-to-double v9, v9

    div-double/2addr v7, v9

    const-wide/16 v9, 0x0

    cmpl-double v9, v7, v9

    if-lez v9, :cond_0

    int-to-double v9, v6

    add-double/2addr v4, v7

    invoke-static {v9, v10, v4, v5}, Ljava/lang/Math;->min(DD)D

    move-result-wide v4

    iput-wide v4, p0, Lcom/google/android/gms/analytics/y;->AP:D

    :cond_0
    iput-wide v2, p0, Lcom/google/android/gms/analytics/y;->AQ:J

    iget-wide v2, p0, Lcom/google/android/gms/analytics/y;->AP:D

    const-wide/high16 v4, 0x3ff0000000000000L    # 1.0

    cmpl-double v6, v2, v4

    if-ltz v6, :cond_1

    sub-double/2addr v2, v4

    iput-wide v2, p0, Lcom/google/android/gms/analytics/y;->AP:D

    monitor-exit v1

    const/4 p0, 0x1

    return p0

    :cond_1
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object p0, p0, Lcom/google/android/gms/analytics/y;->AS:Ljava/lang/String;

    invoke-virtual {v2, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p0

    const-string v0, " detected; call ignored."

    invoke-virtual {p0, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-static {p0}, Lcom/google/android/gms/analytics/z;->W(Ljava/lang/String;)V

    monitor-exit v1

    const/4 p0, 0x0

    return p0

    :catchall_0
    move-exception p0

    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw p0
.end method
