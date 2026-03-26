.class Lcom/google/android/gms/wearable/internal/aw$11;
.super Lcom/google/android/gms/wearable/internal/a;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/google/android/gms/wearable/internal/aw;->a(Lcom/google/android/gms/common/api/BaseImplementation$b;Lcom/google/android/gms/wearable/DataApi$DataListener;[Landroid/content/IntentFilter;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic avT:Lcom/google/android/gms/wearable/internal/aw;

.field final synthetic avV:Lcom/google/android/gms/common/api/BaseImplementation$b;

.field final synthetic avq:Lcom/google/android/gms/wearable/DataApi$DataListener;


# direct methods
.method constructor <init>(Lcom/google/android/gms/wearable/internal/aw;Lcom/google/android/gms/wearable/DataApi$DataListener;Lcom/google/android/gms/common/api/BaseImplementation$b;)V
    .locals 0

    iput-object p1, p0, Lcom/google/android/gms/wearable/internal/aw$11;->avT:Lcom/google/android/gms/wearable/internal/aw;

    iput-object p2, p0, Lcom/google/android/gms/wearable/internal/aw$11;->avq:Lcom/google/android/gms/wearable/DataApi$DataListener;

    iput-object p3, p0, Lcom/google/android/gms/wearable/internal/aw$11;->avV:Lcom/google/android/gms/common/api/BaseImplementation$b;

    invoke-direct {p0}, Lcom/google/android/gms/wearable/internal/a;-><init>()V

    return-void
.end method


# virtual methods
.method public a(Lcom/google/android/gms/common/api/Status;)V
    .locals 3

    invoke-virtual {p1}, Lcom/google/android/gms/common/api/Status;->isSuccess()Z

    move-result v0

    if-nez v0, :cond_0

    iget-object v0, p0, Lcom/google/android/gms/wearable/internal/aw$11;->avT:Lcom/google/android/gms/wearable/internal/aw;

    invoke-static {v0}, Lcom/google/android/gms/wearable/internal/aw;->b(Lcom/google/android/gms/wearable/internal/aw;)Ljava/util/HashMap;

    move-result-object v0

    monitor-enter v0

    :try_start_0
    iget-object v1, p0, Lcom/google/android/gms/wearable/internal/aw$11;->avT:Lcom/google/android/gms/wearable/internal/aw;

    invoke-static {v1}, Lcom/google/android/gms/wearable/internal/aw;->b(Lcom/google/android/gms/wearable/internal/aw;)Ljava/util/HashMap;

    move-result-object v1

    iget-object v2, p0, Lcom/google/android/gms/wearable/internal/aw$11;->avq:Lcom/google/android/gms/wearable/DataApi$DataListener;

    invoke-virtual {v1, v2}, Ljava/util/HashMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    monitor-exit v0

    goto :goto_0

    :catchall_0
    move-exception p0

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw p0

    :cond_0
    :goto_0
    iget-object p0, p0, Lcom/google/android/gms/wearable/internal/aw$11;->avV:Lcom/google/android/gms/common/api/BaseImplementation$b;

    invoke-interface {p0, p1}, Lcom/google/android/gms/common/api/BaseImplementation$b;->b(Ljava/lang/Object;)V

    return-void
.end method
