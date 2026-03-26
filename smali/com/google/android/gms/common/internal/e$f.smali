.class final Lcom/google/android/gms/common/internal/e$f;
.super Ljava/lang/Object;

# interfaces
.implements Landroid/content/ServiceConnection;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/google/android/gms/common/internal/e;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x10
    name = "f"
.end annotation


# instance fields
.field final synthetic LF:Lcom/google/android/gms/common/internal/e;


# direct methods
.method constructor <init>(Lcom/google/android/gms/common/internal/e;)V
    .locals 0

    iput-object p1, p0, Lcom/google/android/gms/common/internal/e$f;->LF:Lcom/google/android/gms/common/internal/e;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onServiceConnected(Landroid/content/ComponentName;Landroid/os/IBinder;)V
    .locals 0

    iget-object p0, p0, Lcom/google/android/gms/common/internal/e$f;->LF:Lcom/google/android/gms/common/internal/e;

    invoke-virtual {p0, p2}, Lcom/google/android/gms/common/internal/e;->N(Landroid/os/IBinder;)V

    return-void
.end method

.method public onServiceDisconnected(Landroid/content/ComponentName;)V
    .locals 2

    iget-object p1, p0, Lcom/google/android/gms/common/internal/e$f;->LF:Lcom/google/android/gms/common/internal/e;

    iget-object p1, p1, Lcom/google/android/gms/common/internal/e;->mHandler:Landroid/os/Handler;

    iget-object p0, p0, Lcom/google/android/gms/common/internal/e$f;->LF:Lcom/google/android/gms/common/internal/e;

    iget-object p0, p0, Lcom/google/android/gms/common/internal/e;->mHandler:Landroid/os/Handler;

    const/4 v0, 0x1

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    const/4 v1, 0x4

    invoke-virtual {p0, v1, v0}, Landroid/os/Handler;->obtainMessage(ILjava/lang/Object;)Landroid/os/Message;

    move-result-object p0

    invoke-virtual {p1, p0}, Landroid/os/Handler;->sendMessage(Landroid/os/Message;)Z

    return-void
.end method
