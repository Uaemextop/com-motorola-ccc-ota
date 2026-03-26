.class public final Lcom/google/android/gms/internal/cw;
.super Ljava/lang/Object;

# interfaces
.implements Lcom/google/android/gms/ads/mediation/MediationAdRequest;


# annotations
.annotation runtime Lcom/google/android/gms/internal/ez;
.end annotation


# instance fields
.field private final d:Ljava/util/Date;

.field private final f:Ljava/util/Set;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Set<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private final g:Z

.field private final h:Landroid/location/Location;

.field private final om:I

.field private final qD:I


# direct methods
.method public constructor <init>(Ljava/util/Date;ILjava/util/Set;Landroid/location/Location;ZI)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Date;",
            "I",
            "Ljava/util/Set<",
            "Ljava/lang/String;",
            ">;",
            "Landroid/location/Location;",
            "ZI)V"
        }
    .end annotation

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/google/android/gms/internal/cw;->d:Ljava/util/Date;

    iput p2, p0, Lcom/google/android/gms/internal/cw;->om:I

    iput-object p3, p0, Lcom/google/android/gms/internal/cw;->f:Ljava/util/Set;

    iput-object p4, p0, Lcom/google/android/gms/internal/cw;->h:Landroid/location/Location;

    iput-boolean p5, p0, Lcom/google/android/gms/internal/cw;->g:Z

    iput p6, p0, Lcom/google/android/gms/internal/cw;->qD:I

    return-void
.end method


# virtual methods
.method public getBirthday()Ljava/util/Date;
    .locals 0

    iget-object p0, p0, Lcom/google/android/gms/internal/cw;->d:Ljava/util/Date;

    return-object p0
.end method

.method public getGender()I
    .locals 0

    iget p0, p0, Lcom/google/android/gms/internal/cw;->om:I

    return p0
.end method

.method public getKeywords()Ljava/util/Set;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Set<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    iget-object p0, p0, Lcom/google/android/gms/internal/cw;->f:Ljava/util/Set;

    return-object p0
.end method

.method public getLocation()Landroid/location/Location;
    .locals 0

    iget-object p0, p0, Lcom/google/android/gms/internal/cw;->h:Landroid/location/Location;

    return-object p0
.end method

.method public isTesting()Z
    .locals 0

    iget-boolean p0, p0, Lcom/google/android/gms/internal/cw;->g:Z

    return p0
.end method

.method public taggedForChildDirectedTreatment()I
    .locals 0

    iget p0, p0, Lcom/google/android/gms/internal/cw;->qD:I

    return p0
.end method
