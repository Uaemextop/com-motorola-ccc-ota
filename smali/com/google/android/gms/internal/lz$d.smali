.class final Lcom/google/android/gms/internal/lz$d;
.super Lcom/google/android/gms/common/internal/e$b;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/google/android/gms/internal/lz;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x12
    name = "d"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/google/android/gms/common/internal/e<",
        "Lcom/google/android/gms/internal/lx;",
        ">.b<",
        "Lcom/google/android/gms/location/LocationClient$OnRemoveGeofencesResultListener;",
        ">;"
    }
.end annotation


# instance fields
.field private final HF:I

.field private final afb:[Ljava/lang/String;

.field final synthetic afc:Lcom/google/android/gms/internal/lz;

.field private final afg:I

.field private final mPendingIntent:Landroid/app/PendingIntent;


# direct methods
.method public constructor <init>(Lcom/google/android/gms/internal/lz;ILcom/google/android/gms/location/LocationClient$OnRemoveGeofencesResultListener;ILandroid/app/PendingIntent;)V
    .locals 0

    iput-object p1, p0, Lcom/google/android/gms/internal/lz$d;->afc:Lcom/google/android/gms/internal/lz;

    invoke-direct {p0, p1, p3}, Lcom/google/android/gms/common/internal/e$b;-><init>(Lcom/google/android/gms/common/internal/e;Ljava/lang/Object;)V

    const/4 p1, 0x1

    if-ne p2, p1, :cond_0

    goto :goto_0

    :cond_0
    const/4 p1, 0x0

    :goto_0
    invoke-static {p1}, Lcom/google/android/gms/common/internal/a;->I(Z)V

    iput p2, p0, Lcom/google/android/gms/internal/lz$d;->afg:I

    invoke-static {p4}, Lcom/google/android/gms/location/LocationStatusCodes;->ef(I)I

    move-result p1

    iput p1, p0, Lcom/google/android/gms/internal/lz$d;->HF:I

    iput-object p5, p0, Lcom/google/android/gms/internal/lz$d;->mPendingIntent:Landroid/app/PendingIntent;

    const/4 p1, 0x0

    iput-object p1, p0, Lcom/google/android/gms/internal/lz$d;->afb:[Ljava/lang/String;

    return-void
.end method

.method public constructor <init>(Lcom/google/android/gms/internal/lz;ILcom/google/android/gms/location/LocationClient$OnRemoveGeofencesResultListener;I[Ljava/lang/String;)V
    .locals 0

    iput-object p1, p0, Lcom/google/android/gms/internal/lz$d;->afc:Lcom/google/android/gms/internal/lz;

    invoke-direct {p0, p1, p3}, Lcom/google/android/gms/common/internal/e$b;-><init>(Lcom/google/android/gms/common/internal/e;Ljava/lang/Object;)V

    const/4 p1, 0x2

    if-ne p2, p1, :cond_0

    const/4 p1, 0x1

    goto :goto_0

    :cond_0
    const/4 p1, 0x0

    :goto_0
    invoke-static {p1}, Lcom/google/android/gms/common/internal/a;->I(Z)V

    iput p2, p0, Lcom/google/android/gms/internal/lz$d;->afg:I

    invoke-static {p4}, Lcom/google/android/gms/location/LocationStatusCodes;->ef(I)I

    move-result p1

    iput p1, p0, Lcom/google/android/gms/internal/lz$d;->HF:I

    iput-object p5, p0, Lcom/google/android/gms/internal/lz$d;->afb:[Ljava/lang/String;

    const/4 p1, 0x0

    iput-object p1, p0, Lcom/google/android/gms/internal/lz$d;->mPendingIntent:Landroid/app/PendingIntent;

    return-void
.end method


# virtual methods
.method protected a(Lcom/google/android/gms/location/LocationClient$OnRemoveGeofencesResultListener;)V
    .locals 2

    if-eqz p1, :cond_2

    iget v0, p0, Lcom/google/android/gms/internal/lz$d;->afg:I

    const/4 v1, 0x1

    if-eq v0, v1, :cond_1

    const/4 v1, 0x2

    if-eq v0, v1, :cond_0

    new-instance p1, Ljava/lang/StringBuilder;

    const-string v0, "Unsupported action: "

    invoke-direct {p1, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget p0, p0, Lcom/google/android/gms/internal/lz$d;->afg:I

    invoke-virtual {p1, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    const-string p1, "LocationClientImpl"

    invoke-static {p1, p0}, Landroid/util/Log;->wtf(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0

    :cond_0
    iget v0, p0, Lcom/google/android/gms/internal/lz$d;->HF:I

    iget-object p0, p0, Lcom/google/android/gms/internal/lz$d;->afb:[Ljava/lang/String;

    invoke-interface {p1, v0, p0}, Lcom/google/android/gms/location/LocationClient$OnRemoveGeofencesResultListener;->onRemoveGeofencesByRequestIdsResult(I[Ljava/lang/String;)V

    goto :goto_0

    :cond_1
    iget v0, p0, Lcom/google/android/gms/internal/lz$d;->HF:I

    iget-object p0, p0, Lcom/google/android/gms/internal/lz$d;->mPendingIntent:Landroid/app/PendingIntent;

    invoke-interface {p1, v0, p0}, Lcom/google/android/gms/location/LocationClient$OnRemoveGeofencesResultListener;->onRemoveGeofencesByPendingIntentResult(ILandroid/app/PendingIntent;)V

    :cond_2
    :goto_0
    return-void
.end method

.method protected synthetic g(Ljava/lang/Object;)V
    .locals 0

    check-cast p1, Lcom/google/android/gms/location/LocationClient$OnRemoveGeofencesResultListener;

    invoke-virtual {p0, p1}, Lcom/google/android/gms/internal/lz$d;->a(Lcom/google/android/gms/location/LocationClient$OnRemoveGeofencesResultListener;)V

    return-void
.end method

.method protected gT()V
    .locals 0

    return-void
.end method
