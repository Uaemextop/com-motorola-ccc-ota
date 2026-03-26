.class Lcom/google/android/gms/internal/ne;
.super Ljava/lang/Object;

# interfaces
.implements Lcom/google/android/gms/panorama/PanoramaApi$PanoramaResult;


# instance fields
.field private final CM:Lcom/google/android/gms/common/api/Status;

.field private final akC:Landroid/content/Intent;


# direct methods
.method public constructor <init>(Lcom/google/android/gms/common/api/Status;Landroid/content/Intent;)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    invoke-static {p1}, Lcom/google/android/gms/common/internal/o;->i(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lcom/google/android/gms/common/api/Status;

    iput-object p1, p0, Lcom/google/android/gms/internal/ne;->CM:Lcom/google/android/gms/common/api/Status;

    iput-object p2, p0, Lcom/google/android/gms/internal/ne;->akC:Landroid/content/Intent;

    return-void
.end method


# virtual methods
.method public getStatus()Lcom/google/android/gms/common/api/Status;
    .locals 0

    iget-object p0, p0, Lcom/google/android/gms/internal/ne;->CM:Lcom/google/android/gms/common/api/Status;

    return-object p0
.end method

.method public getViewerIntent()Landroid/content/Intent;
    .locals 0

    iget-object p0, p0, Lcom/google/android/gms/internal/ne;->akC:Landroid/content/Intent;

    return-object p0
.end method
