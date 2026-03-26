.class final Lcom/google/android/gms/internal/nc$a;
.super Lcom/google/android/gms/internal/na$a;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/google/android/gms/internal/nc;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1a
    name = "a"
.end annotation


# instance fields
.field private final De:Lcom/google/android/gms/common/api/BaseImplementation$b;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/google/android/gms/common/api/BaseImplementation$b<",
            "Lcom/google/android/gms/panorama/PanoramaApi$a;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Lcom/google/android/gms/common/api/BaseImplementation$b;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/google/android/gms/common/api/BaseImplementation$b<",
            "Lcom/google/android/gms/panorama/PanoramaApi$a;",
            ">;)V"
        }
    .end annotation

    invoke-direct {p0}, Lcom/google/android/gms/internal/na$a;-><init>()V

    iput-object p1, p0, Lcom/google/android/gms/internal/nc$a;->De:Lcom/google/android/gms/common/api/BaseImplementation$b;

    return-void
.end method


# virtual methods
.method public a(ILandroid/os/Bundle;ILandroid/content/Intent;)V
    .locals 2

    const/4 v0, 0x0

    if-eqz p2, :cond_0

    const-string v1, "pendingIntent"

    invoke-virtual {p2, v1}, Landroid/os/Bundle;->getParcelable(Ljava/lang/String;)Landroid/os/Parcelable;

    move-result-object p2

    check-cast p2, Landroid/app/PendingIntent;

    goto :goto_0

    :cond_0
    move-object p2, v0

    :goto_0
    new-instance v1, Lcom/google/android/gms/common/api/Status;

    invoke-direct {v1, p1, v0, p2}, Lcom/google/android/gms/common/api/Status;-><init>(ILjava/lang/String;Landroid/app/PendingIntent;)V

    iget-object p0, p0, Lcom/google/android/gms/internal/nc$a;->De:Lcom/google/android/gms/common/api/BaseImplementation$b;

    new-instance p1, Lcom/google/android/gms/internal/mz;

    invoke-direct {p1, v1, p4, p3}, Lcom/google/android/gms/internal/mz;-><init>(Lcom/google/android/gms/common/api/Status;Landroid/content/Intent;I)V

    invoke-interface {p0, p1}, Lcom/google/android/gms/common/api/BaseImplementation$b;->b(Ljava/lang/Object;)V

    return-void
.end method
