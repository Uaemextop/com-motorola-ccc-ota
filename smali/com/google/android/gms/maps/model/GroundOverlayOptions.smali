.class public final Lcom/google/android/gms/maps/model/GroundOverlayOptions;
.super Ljava/lang/Object;

# interfaces
.implements Lcom/google/android/gms/common/internal/safeparcel/SafeParcelable;


# static fields
.field public static final CREATOR:Lcom/google/android/gms/maps/model/e;

.field public static final NO_DIMENSION:F = -1.0f


# instance fields
.field private final BR:I

.field private ajE:F

.field private ajL:F

.field private ajM:Z

.field private ajO:Lcom/google/android/gms/maps/model/BitmapDescriptor;

.field private ajP:Lcom/google/android/gms/maps/model/LatLng;

.field private ajQ:F

.field private ajR:F

.field private ajS:Lcom/google/android/gms/maps/model/LatLngBounds;

.field private ajT:F

.field private ajU:F

.field private ajV:F


# direct methods
.method static constructor <clinit>()V
    .locals 1

    new-instance v0, Lcom/google/android/gms/maps/model/e;

    invoke-direct {v0}, Lcom/google/android/gms/maps/model/e;-><init>()V

    sput-object v0, Lcom/google/android/gms/maps/model/GroundOverlayOptions;->CREATOR:Lcom/google/android/gms/maps/model/e;

    return-void
.end method

.method public constructor <init>()V
    .locals 2

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/google/android/gms/maps/model/GroundOverlayOptions;->ajM:Z

    const/4 v1, 0x0

    iput v1, p0, Lcom/google/android/gms/maps/model/GroundOverlayOptions;->ajT:F

    const/high16 v1, 0x3f000000    # 0.5f

    iput v1, p0, Lcom/google/android/gms/maps/model/GroundOverlayOptions;->ajU:F

    iput v1, p0, Lcom/google/android/gms/maps/model/GroundOverlayOptions;->ajV:F

    iput v0, p0, Lcom/google/android/gms/maps/model/GroundOverlayOptions;->BR:I

    return-void
.end method

.method constructor <init>(ILandroid/os/IBinder;Lcom/google/android/gms/maps/model/LatLng;FFLcom/google/android/gms/maps/model/LatLngBounds;FFZFFF)V
    .locals 1

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/google/android/gms/maps/model/GroundOverlayOptions;->ajM:Z

    const/4 v0, 0x0

    iput v0, p0, Lcom/google/android/gms/maps/model/GroundOverlayOptions;->ajT:F

    const/high16 v0, 0x3f000000    # 0.5f

    iput v0, p0, Lcom/google/android/gms/maps/model/GroundOverlayOptions;->ajU:F

    iput v0, p0, Lcom/google/android/gms/maps/model/GroundOverlayOptions;->ajV:F

    iput p1, p0, Lcom/google/android/gms/maps/model/GroundOverlayOptions;->BR:I

    new-instance p1, Lcom/google/android/gms/maps/model/BitmapDescriptor;

    invoke-static {p2}, Lcom/google/android/gms/dynamic/d$a;->am(Landroid/os/IBinder;)Lcom/google/android/gms/dynamic/d;

    move-result-object p2

    invoke-direct {p1, p2}, Lcom/google/android/gms/maps/model/BitmapDescriptor;-><init>(Lcom/google/android/gms/dynamic/d;)V

    iput-object p1, p0, Lcom/google/android/gms/maps/model/GroundOverlayOptions;->ajO:Lcom/google/android/gms/maps/model/BitmapDescriptor;

    iput-object p3, p0, Lcom/google/android/gms/maps/model/GroundOverlayOptions;->ajP:Lcom/google/android/gms/maps/model/LatLng;

    iput p4, p0, Lcom/google/android/gms/maps/model/GroundOverlayOptions;->ajQ:F

    iput p5, p0, Lcom/google/android/gms/maps/model/GroundOverlayOptions;->ajR:F

    iput-object p6, p0, Lcom/google/android/gms/maps/model/GroundOverlayOptions;->ajS:Lcom/google/android/gms/maps/model/LatLngBounds;

    iput p7, p0, Lcom/google/android/gms/maps/model/GroundOverlayOptions;->ajE:F

    iput p8, p0, Lcom/google/android/gms/maps/model/GroundOverlayOptions;->ajL:F

    iput-boolean p9, p0, Lcom/google/android/gms/maps/model/GroundOverlayOptions;->ajM:Z

    iput p10, p0, Lcom/google/android/gms/maps/model/GroundOverlayOptions;->ajT:F

    iput p11, p0, Lcom/google/android/gms/maps/model/GroundOverlayOptions;->ajU:F

    iput p12, p0, Lcom/google/android/gms/maps/model/GroundOverlayOptions;->ajV:F

    return-void
.end method

.method private a(Lcom/google/android/gms/maps/model/LatLng;FF)Lcom/google/android/gms/maps/model/GroundOverlayOptions;
    .locals 0

    iput-object p1, p0, Lcom/google/android/gms/maps/model/GroundOverlayOptions;->ajP:Lcom/google/android/gms/maps/model/LatLng;

    iput p2, p0, Lcom/google/android/gms/maps/model/GroundOverlayOptions;->ajQ:F

    iput p3, p0, Lcom/google/android/gms/maps/model/GroundOverlayOptions;->ajR:F

    return-object p0
.end method


# virtual methods
.method public anchor(FF)Lcom/google/android/gms/maps/model/GroundOverlayOptions;
    .locals 0

    iput p1, p0, Lcom/google/android/gms/maps/model/GroundOverlayOptions;->ajU:F

    iput p2, p0, Lcom/google/android/gms/maps/model/GroundOverlayOptions;->ajV:F

    return-object p0
.end method

.method public bearing(F)Lcom/google/android/gms/maps/model/GroundOverlayOptions;
    .locals 1

    const/high16 v0, 0x43b40000    # 360.0f

    rem-float/2addr p1, v0

    add-float/2addr p1, v0

    rem-float/2addr p1, v0

    iput p1, p0, Lcom/google/android/gms/maps/model/GroundOverlayOptions;->ajE:F

    return-object p0
.end method

.method public describeContents()I
    .locals 0

    const/4 p0, 0x0

    return p0
.end method

.method public getAnchorU()F
    .locals 0

    iget p0, p0, Lcom/google/android/gms/maps/model/GroundOverlayOptions;->ajU:F

    return p0
.end method

.method public getAnchorV()F
    .locals 0

    iget p0, p0, Lcom/google/android/gms/maps/model/GroundOverlayOptions;->ajV:F

    return p0
.end method

.method public getBearing()F
    .locals 0

    iget p0, p0, Lcom/google/android/gms/maps/model/GroundOverlayOptions;->ajE:F

    return p0
.end method

.method public getBounds()Lcom/google/android/gms/maps/model/LatLngBounds;
    .locals 0

    iget-object p0, p0, Lcom/google/android/gms/maps/model/GroundOverlayOptions;->ajS:Lcom/google/android/gms/maps/model/LatLngBounds;

    return-object p0
.end method

.method public getHeight()F
    .locals 0

    iget p0, p0, Lcom/google/android/gms/maps/model/GroundOverlayOptions;->ajR:F

    return p0
.end method

.method public getImage()Lcom/google/android/gms/maps/model/BitmapDescriptor;
    .locals 0

    iget-object p0, p0, Lcom/google/android/gms/maps/model/GroundOverlayOptions;->ajO:Lcom/google/android/gms/maps/model/BitmapDescriptor;

    return-object p0
.end method

.method public getLocation()Lcom/google/android/gms/maps/model/LatLng;
    .locals 0

    iget-object p0, p0, Lcom/google/android/gms/maps/model/GroundOverlayOptions;->ajP:Lcom/google/android/gms/maps/model/LatLng;

    return-object p0
.end method

.method public getTransparency()F
    .locals 0

    iget p0, p0, Lcom/google/android/gms/maps/model/GroundOverlayOptions;->ajT:F

    return p0
.end method

.method getVersionCode()I
    .locals 0

    iget p0, p0, Lcom/google/android/gms/maps/model/GroundOverlayOptions;->BR:I

    return p0
.end method

.method public getWidth()F
    .locals 0

    iget p0, p0, Lcom/google/android/gms/maps/model/GroundOverlayOptions;->ajQ:F

    return p0
.end method

.method public getZIndex()F
    .locals 0

    iget p0, p0, Lcom/google/android/gms/maps/model/GroundOverlayOptions;->ajL:F

    return p0
.end method

.method public image(Lcom/google/android/gms/maps/model/BitmapDescriptor;)Lcom/google/android/gms/maps/model/GroundOverlayOptions;
    .locals 0

    iput-object p1, p0, Lcom/google/android/gms/maps/model/GroundOverlayOptions;->ajO:Lcom/google/android/gms/maps/model/BitmapDescriptor;

    return-object p0
.end method

.method public isVisible()Z
    .locals 0

    iget-boolean p0, p0, Lcom/google/android/gms/maps/model/GroundOverlayOptions;->ajM:Z

    return p0
.end method

.method mO()Landroid/os/IBinder;
    .locals 0

    iget-object p0, p0, Lcom/google/android/gms/maps/model/GroundOverlayOptions;->ajO:Lcom/google/android/gms/maps/model/BitmapDescriptor;

    invoke-virtual {p0}, Lcom/google/android/gms/maps/model/BitmapDescriptor;->mo()Lcom/google/android/gms/dynamic/d;

    move-result-object p0

    invoke-interface {p0}, Lcom/google/android/gms/dynamic/d;->asBinder()Landroid/os/IBinder;

    move-result-object p0

    return-object p0
.end method

.method public position(Lcom/google/android/gms/maps/model/LatLng;F)Lcom/google/android/gms/maps/model/GroundOverlayOptions;
    .locals 4

    iget-object v0, p0, Lcom/google/android/gms/maps/model/GroundOverlayOptions;->ajS:Lcom/google/android/gms/maps/model/LatLngBounds;

    const/4 v1, 0x1

    const/4 v2, 0x0

    if-nez v0, :cond_0

    move v0, v1

    goto :goto_0

    :cond_0
    move v0, v2

    :goto_0
    const-string v3, "Position has already been set using positionFromBounds"

    invoke-static {v0, v3}, Lcom/google/android/gms/common/internal/o;->a(ZLjava/lang/Object;)V

    if-eqz p1, :cond_1

    move v0, v1

    goto :goto_1

    :cond_1
    move v0, v2

    :goto_1
    const-string v3, "Location must be specified"

    invoke-static {v0, v3}, Lcom/google/android/gms/common/internal/o;->b(ZLjava/lang/Object;)V

    const/4 v0, 0x0

    cmpl-float v0, p2, v0

    if-ltz v0, :cond_2

    goto :goto_2

    :cond_2
    move v1, v2

    :goto_2
    const-string v0, "Width must be non-negative"

    invoke-static {v1, v0}, Lcom/google/android/gms/common/internal/o;->b(ZLjava/lang/Object;)V

    const/high16 v0, -0x40800000    # -1.0f

    invoke-direct {p0, p1, p2, v0}, Lcom/google/android/gms/maps/model/GroundOverlayOptions;->a(Lcom/google/android/gms/maps/model/LatLng;FF)Lcom/google/android/gms/maps/model/GroundOverlayOptions;

    move-result-object p0

    return-object p0
.end method

.method public position(Lcom/google/android/gms/maps/model/LatLng;FF)Lcom/google/android/gms/maps/model/GroundOverlayOptions;
    .locals 5

    iget-object v0, p0, Lcom/google/android/gms/maps/model/GroundOverlayOptions;->ajS:Lcom/google/android/gms/maps/model/LatLngBounds;

    const/4 v1, 0x1

    const/4 v2, 0x0

    if-nez v0, :cond_0

    move v0, v1

    goto :goto_0

    :cond_0
    move v0, v2

    :goto_0
    const-string v3, "Position has already been set using positionFromBounds"

    invoke-static {v0, v3}, Lcom/google/android/gms/common/internal/o;->a(ZLjava/lang/Object;)V

    if-eqz p1, :cond_1

    move v0, v1

    goto :goto_1

    :cond_1
    move v0, v2

    :goto_1
    const-string v3, "Location must be specified"

    invoke-static {v0, v3}, Lcom/google/android/gms/common/internal/o;->b(ZLjava/lang/Object;)V

    const/4 v0, 0x0

    cmpl-float v3, p2, v0

    if-ltz v3, :cond_2

    move v3, v1

    goto :goto_2

    :cond_2
    move v3, v2

    :goto_2
    const-string v4, "Width must be non-negative"

    invoke-static {v3, v4}, Lcom/google/android/gms/common/internal/o;->b(ZLjava/lang/Object;)V

    cmpl-float v0, p3, v0

    if-ltz v0, :cond_3

    goto :goto_3

    :cond_3
    move v1, v2

    :goto_3
    const-string v0, "Height must be non-negative"

    invoke-static {v1, v0}, Lcom/google/android/gms/common/internal/o;->b(ZLjava/lang/Object;)V

    invoke-direct {p0, p1, p2, p3}, Lcom/google/android/gms/maps/model/GroundOverlayOptions;->a(Lcom/google/android/gms/maps/model/LatLng;FF)Lcom/google/android/gms/maps/model/GroundOverlayOptions;

    move-result-object p0

    return-object p0
.end method

.method public positionFromBounds(Lcom/google/android/gms/maps/model/LatLngBounds;)Lcom/google/android/gms/maps/model/GroundOverlayOptions;
    .locals 3

    iget-object v0, p0, Lcom/google/android/gms/maps/model/GroundOverlayOptions;->ajP:Lcom/google/android/gms/maps/model/LatLng;

    if-nez v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "Position has already been set using position: "

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v2, p0, Lcom/google/android/gms/maps/model/GroundOverlayOptions;->ajP:Lcom/google/android/gms/maps/model/LatLng;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/google/android/gms/common/internal/o;->a(ZLjava/lang/Object;)V

    iput-object p1, p0, Lcom/google/android/gms/maps/model/GroundOverlayOptions;->ajS:Lcom/google/android/gms/maps/model/LatLngBounds;

    return-object p0
.end method

.method public transparency(F)Lcom/google/android/gms/maps/model/GroundOverlayOptions;
    .locals 2

    const/4 v0, 0x0

    cmpl-float v0, p1, v0

    if-ltz v0, :cond_0

    const/high16 v0, 0x3f800000    # 1.0f

    cmpg-float v0, p1, v0

    if-gtz v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    const-string v1, "Transparency must be in the range [0..1]"

    invoke-static {v0, v1}, Lcom/google/android/gms/common/internal/o;->b(ZLjava/lang/Object;)V

    iput p1, p0, Lcom/google/android/gms/maps/model/GroundOverlayOptions;->ajT:F

    return-object p0
.end method

.method public visible(Z)Lcom/google/android/gms/maps/model/GroundOverlayOptions;
    .locals 0

    iput-boolean p1, p0, Lcom/google/android/gms/maps/model/GroundOverlayOptions;->ajM:Z

    return-object p0
.end method

.method public writeToParcel(Landroid/os/Parcel;I)V
    .locals 1

    invoke-static {}, Lcom/google/android/gms/maps/internal/v;->mM()Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-static {p0, p1, p2}, Lcom/google/android/gms/maps/model/f;->a(Lcom/google/android/gms/maps/model/GroundOverlayOptions;Landroid/os/Parcel;I)V

    goto :goto_0

    :cond_0
    invoke-static {p0, p1, p2}, Lcom/google/android/gms/maps/model/e;->a(Lcom/google/android/gms/maps/model/GroundOverlayOptions;Landroid/os/Parcel;I)V

    :goto_0
    return-void
.end method

.method public zIndex(F)Lcom/google/android/gms/maps/model/GroundOverlayOptions;
    .locals 0

    iput p1, p0, Lcom/google/android/gms/maps/model/GroundOverlayOptions;->ajL:F

    return-object p0
.end method
