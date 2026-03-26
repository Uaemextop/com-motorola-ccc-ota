.class Lcom/google/android/gms/common/api/b$3;
.super Ljava/lang/Object;

# interfaces
.implements Lcom/google/android/gms/common/internal/f$b;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/google/android/gms/common/api/b;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic Jq:Lcom/google/android/gms/common/api/b;


# direct methods
.method constructor <init>(Lcom/google/android/gms/common/api/b;)V
    .locals 0

    iput-object p1, p0, Lcom/google/android/gms/common/api/b$3;->Jq:Lcom/google/android/gms/common/api/b;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public fC()Landroid/os/Bundle;
    .locals 0

    const/4 p0, 0x0

    return-object p0
.end method

.method public gq()Z
    .locals 0

    iget-object p0, p0, Lcom/google/android/gms/common/api/b$3;->Jq:Lcom/google/android/gms/common/api/b;

    invoke-static {p0}, Lcom/google/android/gms/common/api/b;->g(Lcom/google/android/gms/common/api/b;)Z

    move-result p0

    return p0
.end method

.method public isConnected()Z
    .locals 0

    iget-object p0, p0, Lcom/google/android/gms/common/api/b$3;->Jq:Lcom/google/android/gms/common/api/b;

    invoke-virtual {p0}, Lcom/google/android/gms/common/api/b;->isConnected()Z

    move-result p0

    return p0
.end method
