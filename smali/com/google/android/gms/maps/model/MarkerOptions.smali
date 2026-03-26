.class public final Lcom/google/android/gms/maps/model/MarkerOptions;
.super Ljava/lang/Object;

# interfaces
.implements Lcom/google/android/gms/common/internal/safeparcel/SafeParcelable;


# static fields
.field public static final CREATOR:Lcom/google/android/gms/maps/model/k;


# instance fields
.field private final BR:I

.field private Nw:Ljava/lang/String;

.field private ajM:Z

.field private ajU:F

.field private ajV:F

.field private ajl:Lcom/google/android/gms/maps/model/LatLng;

.field private akd:Ljava/lang/String;

.field private ake:Lcom/google/android/gms/maps/model/BitmapDescriptor;

.field private akf:Z

.field private akg:Z

.field private akh:F

.field private aki:F

.field private akj:F

.field private mAlpha:F


# direct methods
.method static constructor <clinit>()V
    .locals 1

    new-instance v0, Lcom/google/android/gms/maps/model/k;

    invoke-direct {v0}, Lcom/google/android/gms/maps/model/k;-><init>()V

    sput-object v0, Lcom/google/android/gms/maps/model/MarkerOptions;->CREATOR:Lcom/google/android/gms/maps/model/k;

    return-void
.end method

.method public constructor <init>()V
    .locals 4

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/high16 v0, 0x3f000000    # 0.5f

    iput v0, p0, Lcom/google/android/gms/maps/model/MarkerOptions;->ajU:F

    const/high16 v1, 0x3f800000    # 1.0f

    iput v1, p0, Lcom/google/android/gms/maps/model/MarkerOptions;->ajV:F

    const/4 v2, 0x1

    iput-boolean v2, p0, Lcom/google/android/gms/maps/model/MarkerOptions;->ajM:Z

    const/4 v3, 0x0

    iput-boolean v3, p0, Lcom/google/android/gms/maps/model/MarkerOptions;->akg:Z

    const/4 v3, 0x0

    iput v3, p0, Lcom/google/android/gms/maps/model/MarkerOptions;->akh:F

    iput v0, p0, Lcom/google/android/gms/maps/model/MarkerOptions;->aki:F

    iput v3, p0, Lcom/google/android/gms/maps/model/MarkerOptions;->akj:F

    iput v1, p0, Lcom/google/android/gms/maps/model/MarkerOptions;->mAlpha:F

    iput v2, p0, Lcom/google/android/gms/maps/model/MarkerOptions;->BR:I

    return-void
.end method

.method constructor <init>(ILcom/google/android/gms/maps/model/LatLng;Ljava/lang/String;Ljava/lang/String;Landroid/os/IBinder;FFZZZFFFF)V
    .locals 4

    move-object v0, p0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/high16 v1, 0x3f000000    # 0.5f

    iput v1, v0, Lcom/google/android/gms/maps/model/MarkerOptions;->ajU:F

    const/high16 v2, 0x3f800000    # 1.0f

    iput v2, v0, Lcom/google/android/gms/maps/model/MarkerOptions;->ajV:F

    const/4 v3, 0x1

    iput-boolean v3, v0, Lcom/google/android/gms/maps/model/MarkerOptions;->ajM:Z

    const/4 v3, 0x0

    iput-boolean v3, v0, Lcom/google/android/gms/maps/model/MarkerOptions;->akg:Z

    const/4 v3, 0x0

    iput v3, v0, Lcom/google/android/gms/maps/model/MarkerOptions;->akh:F

    iput v1, v0, Lcom/google/android/gms/maps/model/MarkerOptions;->aki:F

    iput v3, v0, Lcom/google/android/gms/maps/model/MarkerOptions;->akj:F

    iput v2, v0, Lcom/google/android/gms/maps/model/MarkerOptions;->mAlpha:F

    move v1, p1

    iput v1, v0, Lcom/google/android/gms/maps/model/MarkerOptions;->BR:I

    move-object v1, p2

    iput-object v1, v0, Lcom/google/android/gms/maps/model/MarkerOptions;->ajl:Lcom/google/android/gms/maps/model/LatLng;

    move-object v1, p3

    iput-object v1, v0, Lcom/google/android/gms/maps/model/MarkerOptions;->Nw:Ljava/lang/String;

    move-object v1, p4

    iput-object v1, v0, Lcom/google/android/gms/maps/model/MarkerOptions;->akd:Ljava/lang/String;

    if-nez p5, :cond_0

    const/4 v1, 0x0

    goto :goto_0

    :cond_0
    new-instance v1, Lcom/google/android/gms/maps/model/BitmapDescriptor;

    invoke-static {p5}, Lcom/google/android/gms/dynamic/d$a;->am(Landroid/os/IBinder;)Lcom/google/android/gms/dynamic/d;

    move-result-object v2

    invoke-direct {v1, v2}, Lcom/google/android/gms/maps/model/BitmapDescriptor;-><init>(Lcom/google/android/gms/dynamic/d;)V

    :goto_0
    iput-object v1, v0, Lcom/google/android/gms/maps/model/MarkerOptions;->ake:Lcom/google/android/gms/maps/model/BitmapDescriptor;

    move v1, p6

    iput v1, v0, Lcom/google/android/gms/maps/model/MarkerOptions;->ajU:F

    move v1, p7

    iput v1, v0, Lcom/google/android/gms/maps/model/MarkerOptions;->ajV:F

    move v1, p8

    iput-boolean v1, v0, Lcom/google/android/gms/maps/model/MarkerOptions;->akf:Z

    move v1, p9

    iput-boolean v1, v0, Lcom/google/android/gms/maps/model/MarkerOptions;->ajM:Z

    move v1, p10

    iput-boolean v1, v0, Lcom/google/android/gms/maps/model/MarkerOptions;->akg:Z

    move v1, p11

    iput v1, v0, Lcom/google/android/gms/maps/model/MarkerOptions;->akh:F

    move/from16 v1, p12

    iput v1, v0, Lcom/google/android/gms/maps/model/MarkerOptions;->aki:F

    move/from16 v1, p13

    iput v1, v0, Lcom/google/android/gms/maps/model/MarkerOptions;->akj:F

    move/from16 v1, p14

    iput v1, v0, Lcom/google/android/gms/maps/model/MarkerOptions;->mAlpha:F

    return-void
.end method


# virtual methods
.method public alpha(F)Lcom/google/android/gms/maps/model/MarkerOptions;
    .locals 0

    iput p1, p0, Lcom/google/android/gms/maps/model/MarkerOptions;->mAlpha:F

    return-object p0
.end method

.method public anchor(FF)Lcom/google/android/gms/maps/model/MarkerOptions;
    .locals 0

    iput p1, p0, Lcom/google/android/gms/maps/model/MarkerOptions;->ajU:F

    iput p2, p0, Lcom/google/android/gms/maps/model/MarkerOptions;->ajV:F

    return-object p0
.end method

.method public describeContents()I
    .locals 0

    const/4 p0, 0x0

    return p0
.end method

.method public draggable(Z)Lcom/google/android/gms/maps/model/MarkerOptions;
    .locals 0

    iput-boolean p1, p0, Lcom/google/android/gms/maps/model/MarkerOptions;->akf:Z

    return-object p0
.end method

.method public flat(Z)Lcom/google/android/gms/maps/model/MarkerOptions;
    .locals 0

    iput-boolean p1, p0, Lcom/google/android/gms/maps/model/MarkerOptions;->akg:Z

    return-object p0
.end method

.method public getAlpha()F
    .locals 0

    iget p0, p0, Lcom/google/android/gms/maps/model/MarkerOptions;->mAlpha:F

    return p0
.end method

.method public getAnchorU()F
    .locals 0

    iget p0, p0, Lcom/google/android/gms/maps/model/MarkerOptions;->ajU:F

    return p0
.end method

.method public getAnchorV()F
    .locals 0

    iget p0, p0, Lcom/google/android/gms/maps/model/MarkerOptions;->ajV:F

    return p0
.end method

.method public getIcon()Lcom/google/android/gms/maps/model/BitmapDescriptor;
    .locals 0

    iget-object p0, p0, Lcom/google/android/gms/maps/model/MarkerOptions;->ake:Lcom/google/android/gms/maps/model/BitmapDescriptor;

    return-object p0
.end method

.method public getInfoWindowAnchorU()F
    .locals 0

    iget p0, p0, Lcom/google/android/gms/maps/model/MarkerOptions;->aki:F

    return p0
.end method

.method public getInfoWindowAnchorV()F
    .locals 0

    iget p0, p0, Lcom/google/android/gms/maps/model/MarkerOptions;->akj:F

    return p0
.end method

.method public getPosition()Lcom/google/android/gms/maps/model/LatLng;
    .locals 0

    iget-object p0, p0, Lcom/google/android/gms/maps/model/MarkerOptions;->ajl:Lcom/google/android/gms/maps/model/LatLng;

    return-object p0
.end method

.method public getRotation()F
    .locals 0

    iget p0, p0, Lcom/google/android/gms/maps/model/MarkerOptions;->akh:F

    return p0
.end method

.method public getSnippet()Ljava/lang/String;
    .locals 0

    iget-object p0, p0, Lcom/google/android/gms/maps/model/MarkerOptions;->akd:Ljava/lang/String;

    return-object p0
.end method

.method public getTitle()Ljava/lang/String;
    .locals 0

    iget-object p0, p0, Lcom/google/android/gms/maps/model/MarkerOptions;->Nw:Ljava/lang/String;

    return-object p0
.end method

.method getVersionCode()I
    .locals 0

    iget p0, p0, Lcom/google/android/gms/maps/model/MarkerOptions;->BR:I

    return p0
.end method

.method public icon(Lcom/google/android/gms/maps/model/BitmapDescriptor;)Lcom/google/android/gms/maps/model/MarkerOptions;
    .locals 0

    iput-object p1, p0, Lcom/google/android/gms/maps/model/MarkerOptions;->ake:Lcom/google/android/gms/maps/model/BitmapDescriptor;

    return-object p0
.end method

.method public infoWindowAnchor(FF)Lcom/google/android/gms/maps/model/MarkerOptions;
    .locals 0

    iput p1, p0, Lcom/google/android/gms/maps/model/MarkerOptions;->aki:F

    iput p2, p0, Lcom/google/android/gms/maps/model/MarkerOptions;->akj:F

    return-object p0
.end method

.method public isDraggable()Z
    .locals 0

    iget-boolean p0, p0, Lcom/google/android/gms/maps/model/MarkerOptions;->akf:Z

    return p0
.end method

.method public isFlat()Z
    .locals 0

    iget-boolean p0, p0, Lcom/google/android/gms/maps/model/MarkerOptions;->akg:Z

    return p0
.end method

.method public isVisible()Z
    .locals 0

    iget-boolean p0, p0, Lcom/google/android/gms/maps/model/MarkerOptions;->ajM:Z

    return p0
.end method

.method mP()Landroid/os/IBinder;
    .locals 0

    iget-object p0, p0, Lcom/google/android/gms/maps/model/MarkerOptions;->ake:Lcom/google/android/gms/maps/model/BitmapDescriptor;

    if-nez p0, :cond_0

    const/4 p0, 0x0

    goto :goto_0

    :cond_0
    invoke-virtual {p0}, Lcom/google/android/gms/maps/model/BitmapDescriptor;->mo()Lcom/google/android/gms/dynamic/d;

    move-result-object p0

    invoke-interface {p0}, Lcom/google/android/gms/dynamic/d;->asBinder()Landroid/os/IBinder;

    move-result-object p0

    :goto_0
    return-object p0
.end method

.method public position(Lcom/google/android/gms/maps/model/LatLng;)Lcom/google/android/gms/maps/model/MarkerOptions;
    .locals 0

    iput-object p1, p0, Lcom/google/android/gms/maps/model/MarkerOptions;->ajl:Lcom/google/android/gms/maps/model/LatLng;

    return-object p0
.end method

.method public rotation(F)Lcom/google/android/gms/maps/model/MarkerOptions;
    .locals 0

    iput p1, p0, Lcom/google/android/gms/maps/model/MarkerOptions;->akh:F

    return-object p0
.end method

.method public snippet(Ljava/lang/String;)Lcom/google/android/gms/maps/model/MarkerOptions;
    .locals 0

    iput-object p1, p0, Lcom/google/android/gms/maps/model/MarkerOptions;->akd:Ljava/lang/String;

    return-object p0
.end method

.method public title(Ljava/lang/String;)Lcom/google/android/gms/maps/model/MarkerOptions;
    .locals 0

    iput-object p1, p0, Lcom/google/android/gms/maps/model/MarkerOptions;->Nw:Ljava/lang/String;

    return-object p0
.end method

.method public visible(Z)Lcom/google/android/gms/maps/model/MarkerOptions;
    .locals 0

    iput-boolean p1, p0, Lcom/google/android/gms/maps/model/MarkerOptions;->ajM:Z

    return-object p0
.end method

.method public writeToParcel(Landroid/os/Parcel;I)V
    .locals 1

    invoke-static {}, Lcom/google/android/gms/maps/internal/v;->mM()Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-static {p0, p1, p2}, Lcom/google/android/gms/maps/model/l;->a(Lcom/google/android/gms/maps/model/MarkerOptions;Landroid/os/Parcel;I)V

    goto :goto_0

    :cond_0
    invoke-static {p0, p1, p2}, Lcom/google/android/gms/maps/model/k;->a(Lcom/google/android/gms/maps/model/MarkerOptions;Landroid/os/Parcel;I)V

    :goto_0
    return-void
.end method
