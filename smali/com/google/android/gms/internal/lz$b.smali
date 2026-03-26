.class final Lcom/google/android/gms/internal/lz$b;
.super Lcom/google/android/gms/internal/lw$a;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/google/android/gms/internal/lz;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1a
    name = "b"
.end annotation


# instance fields
.field private afd:Lcom/google/android/gms/location/LocationClient$OnAddGeofencesResultListener;

.field private afe:Lcom/google/android/gms/location/LocationClient$OnRemoveGeofencesResultListener;

.field private aff:Lcom/google/android/gms/internal/lz;


# direct methods
.method public constructor <init>(Lcom/google/android/gms/location/LocationClient$OnAddGeofencesResultListener;Lcom/google/android/gms/internal/lz;)V
    .locals 0

    invoke-direct {p0}, Lcom/google/android/gms/internal/lw$a;-><init>()V

    iput-object p1, p0, Lcom/google/android/gms/internal/lz$b;->afd:Lcom/google/android/gms/location/LocationClient$OnAddGeofencesResultListener;

    const/4 p1, 0x0

    iput-object p1, p0, Lcom/google/android/gms/internal/lz$b;->afe:Lcom/google/android/gms/location/LocationClient$OnRemoveGeofencesResultListener;

    iput-object p2, p0, Lcom/google/android/gms/internal/lz$b;->aff:Lcom/google/android/gms/internal/lz;

    return-void
.end method

.method public constructor <init>(Lcom/google/android/gms/location/LocationClient$OnRemoveGeofencesResultListener;Lcom/google/android/gms/internal/lz;)V
    .locals 0

    invoke-direct {p0}, Lcom/google/android/gms/internal/lw$a;-><init>()V

    iput-object p1, p0, Lcom/google/android/gms/internal/lz$b;->afe:Lcom/google/android/gms/location/LocationClient$OnRemoveGeofencesResultListener;

    const/4 p1, 0x0

    iput-object p1, p0, Lcom/google/android/gms/internal/lz$b;->afd:Lcom/google/android/gms/location/LocationClient$OnAddGeofencesResultListener;

    iput-object p2, p0, Lcom/google/android/gms/internal/lz$b;->aff:Lcom/google/android/gms/internal/lz;

    return-void
.end method


# virtual methods
.method public onAddGeofencesResult(I[Ljava/lang/String;)V
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/os/RemoteException;
        }
    .end annotation

    iget-object v0, p0, Lcom/google/android/gms/internal/lz$b;->aff:Lcom/google/android/gms/internal/lz;

    if-nez v0, :cond_0

    const-string p0, "LocationClientImpl"

    const-string p1, "onAddGeofenceResult called multiple times"

    invoke-static {p0, p1}, Landroid/util/Log;->wtf(Ljava/lang/String;Ljava/lang/String;)I

    return-void

    :cond_0
    new-instance v1, Lcom/google/android/gms/internal/lz$a;

    iget-object v2, p0, Lcom/google/android/gms/internal/lz$b;->aff:Lcom/google/android/gms/internal/lz;

    invoke-virtual {v2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    iget-object v3, p0, Lcom/google/android/gms/internal/lz$b;->afd:Lcom/google/android/gms/location/LocationClient$OnAddGeofencesResultListener;

    invoke-direct {v1, v2, v3, p1, p2}, Lcom/google/android/gms/internal/lz$a;-><init>(Lcom/google/android/gms/internal/lz;Lcom/google/android/gms/location/LocationClient$OnAddGeofencesResultListener;I[Ljava/lang/String;)V

    invoke-virtual {v0, v1}, Lcom/google/android/gms/internal/lz;->a(Lcom/google/android/gms/common/internal/e$b;)V

    const/4 p1, 0x0

    iput-object p1, p0, Lcom/google/android/gms/internal/lz$b;->aff:Lcom/google/android/gms/internal/lz;

    iput-object p1, p0, Lcom/google/android/gms/internal/lz$b;->afd:Lcom/google/android/gms/location/LocationClient$OnAddGeofencesResultListener;

    iput-object p1, p0, Lcom/google/android/gms/internal/lz$b;->afe:Lcom/google/android/gms/location/LocationClient$OnRemoveGeofencesResultListener;

    return-void
.end method

.method public onRemoveGeofencesByPendingIntentResult(ILandroid/app/PendingIntent;)V
    .locals 8

    iget-object v0, p0, Lcom/google/android/gms/internal/lz$b;->aff:Lcom/google/android/gms/internal/lz;

    if-nez v0, :cond_0

    const-string p0, "LocationClientImpl"

    const-string p1, "onRemoveGeofencesByPendingIntentResult called multiple times"

    invoke-static {p0, p1}, Landroid/util/Log;->wtf(Ljava/lang/String;Ljava/lang/String;)I

    return-void

    :cond_0
    new-instance v7, Lcom/google/android/gms/internal/lz$d;

    iget-object v2, p0, Lcom/google/android/gms/internal/lz$b;->aff:Lcom/google/android/gms/internal/lz;

    invoke-virtual {v2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    const/4 v3, 0x1

    iget-object v4, p0, Lcom/google/android/gms/internal/lz$b;->afe:Lcom/google/android/gms/location/LocationClient$OnRemoveGeofencesResultListener;

    move-object v1, v7

    move v5, p1

    move-object v6, p2

    invoke-direct/range {v1 .. v6}, Lcom/google/android/gms/internal/lz$d;-><init>(Lcom/google/android/gms/internal/lz;ILcom/google/android/gms/location/LocationClient$OnRemoveGeofencesResultListener;ILandroid/app/PendingIntent;)V

    invoke-virtual {v0, v7}, Lcom/google/android/gms/internal/lz;->a(Lcom/google/android/gms/common/internal/e$b;)V

    const/4 p1, 0x0

    iput-object p1, p0, Lcom/google/android/gms/internal/lz$b;->aff:Lcom/google/android/gms/internal/lz;

    iput-object p1, p0, Lcom/google/android/gms/internal/lz$b;->afd:Lcom/google/android/gms/location/LocationClient$OnAddGeofencesResultListener;

    iput-object p1, p0, Lcom/google/android/gms/internal/lz$b;->afe:Lcom/google/android/gms/location/LocationClient$OnRemoveGeofencesResultListener;

    return-void
.end method

.method public onRemoveGeofencesByRequestIdsResult(I[Ljava/lang/String;)V
    .locals 8

    iget-object v0, p0, Lcom/google/android/gms/internal/lz$b;->aff:Lcom/google/android/gms/internal/lz;

    if-nez v0, :cond_0

    const-string p0, "LocationClientImpl"

    const-string p1, "onRemoveGeofencesByRequestIdsResult called multiple times"

    invoke-static {p0, p1}, Landroid/util/Log;->wtf(Ljava/lang/String;Ljava/lang/String;)I

    return-void

    :cond_0
    new-instance v7, Lcom/google/android/gms/internal/lz$d;

    iget-object v2, p0, Lcom/google/android/gms/internal/lz$b;->aff:Lcom/google/android/gms/internal/lz;

    invoke-virtual {v2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    const/4 v3, 0x2

    iget-object v4, p0, Lcom/google/android/gms/internal/lz$b;->afe:Lcom/google/android/gms/location/LocationClient$OnRemoveGeofencesResultListener;

    move-object v1, v7

    move v5, p1

    move-object v6, p2

    invoke-direct/range {v1 .. v6}, Lcom/google/android/gms/internal/lz$d;-><init>(Lcom/google/android/gms/internal/lz;ILcom/google/android/gms/location/LocationClient$OnRemoveGeofencesResultListener;I[Ljava/lang/String;)V

    invoke-virtual {v0, v7}, Lcom/google/android/gms/internal/lz;->a(Lcom/google/android/gms/common/internal/e$b;)V

    const/4 p1, 0x0

    iput-object p1, p0, Lcom/google/android/gms/internal/lz$b;->aff:Lcom/google/android/gms/internal/lz;

    iput-object p1, p0, Lcom/google/android/gms/internal/lz$b;->afd:Lcom/google/android/gms/location/LocationClient$OnAddGeofencesResultListener;

    iput-object p1, p0, Lcom/google/android/gms/internal/lz$b;->afe:Lcom/google/android/gms/location/LocationClient$OnRemoveGeofencesResultListener;

    return-void
.end method
