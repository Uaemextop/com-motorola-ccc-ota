.class Lcom/google/android/gms/tagmanager/cw;
.super Ljava/lang/Object;

# interfaces
.implements Lcom/google/android/gms/tagmanager/cg;


# instance fields
.field private final AN:J

.field private final AO:I

.field private AP:D

.field private final AR:Ljava/lang/Object;

.field private arp:J


# direct methods
.method public constructor <init>()V
    .locals 3

    const/16 v0, 0x3c

    const-wide/16 v1, 0x7d0

    invoke-direct {p0, v0, v1, v2}, Lcom/google/android/gms/tagmanager/cw;-><init>(IJ)V

    return-void
.end method

.method public constructor <init>(IJ)V
    .locals 2

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance v0, Ljava/lang/Object;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    iput-object v0, p0, Lcom/google/android/gms/tagmanager/cw;->AR:Ljava/lang/Object;

    iput p1, p0, Lcom/google/android/gms/tagmanager/cw;->AO:I

    int-to-double v0, p1

    iput-wide v0, p0, Lcom/google/android/gms/tagmanager/cw;->AP:D

    iput-wide p2, p0, Lcom/google/android/gms/tagmanager/cw;->AN:J

    return-void
.end method


# virtual methods
.method public eJ()Z
    .locals 10

    iget-object v0, p0, Lcom/google/android/gms/tagmanager/cw;->AR:Ljava/lang/Object;

    monitor-enter v0

    :try_start_0
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v1

    iget-wide v3, p0, Lcom/google/android/gms/tagmanager/cw;->AP:D

    iget v5, p0, Lcom/google/android/gms/tagmanager/cw;->AO:I

    int-to-double v6, v5

    cmpg-double v6, v3, v6

    if-gez v6, :cond_0

    iget-wide v6, p0, Lcom/google/android/gms/tagmanager/cw;->arp:J

    sub-long v6, v1, v6

    long-to-double v6, v6

    iget-wide v8, p0, Lcom/google/android/gms/tagmanager/cw;->AN:J

    long-to-double v8, v8

    div-double/2addr v6, v8

    const-wide/16 v8, 0x0

    cmpl-double v8, v6, v8

    if-lez v8, :cond_0

    int-to-double v8, v5

    add-double/2addr v3, v6

    invoke-static {v8, v9, v3, v4}, Ljava/lang/Math;->min(DD)D

    move-result-wide v3

    iput-wide v3, p0, Lcom/google/android/gms/tagmanager/cw;->AP:D

    :cond_0
    iput-wide v1, p0, Lcom/google/android/gms/tagmanager/cw;->arp:J

    iget-wide v1, p0, Lcom/google/android/gms/tagmanager/cw;->AP:D

    const-wide/high16 v3, 0x3ff0000000000000L    # 1.0

    cmpl-double v5, v1, v3

    if-ltz v5, :cond_1

    sub-double/2addr v1, v3

    iput-wide v1, p0, Lcom/google/android/gms/tagmanager/cw;->AP:D

    monitor-exit v0

    const/4 p0, 0x1

    return p0

    :cond_1
    const-string p0, "No more tokens available."

    invoke-static {p0}, Lcom/google/android/gms/tagmanager/bh;->W(Ljava/lang/String;)V

    monitor-exit v0

    const/4 p0, 0x0

    return p0

    :catchall_0
    move-exception p0

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw p0
.end method
