.class public final Lcom/google/android/gms/internal/ay;
.super Ljava/lang/Object;

# interfaces
.implements Lcom/google/android/gms/common/internal/safeparcel/SafeParcelable;


# annotations
.annotation runtime Lcom/google/android/gms/internal/ez;
.end annotation


# static fields
.field public static final CREATOR:Lcom/google/android/gms/internal/az;


# instance fields
.field public final height:I

.field public final heightPixels:I

.field public final of:Ljava/lang/String;

.field public final og:Z

.field public final oh:[Lcom/google/android/gms/internal/ay;

.field public final versionCode:I

.field public final width:I

.field public final widthPixels:I


# direct methods
.method static constructor <clinit>()V
    .locals 1

    new-instance v0, Lcom/google/android/gms/internal/az;

    invoke-direct {v0}, Lcom/google/android/gms/internal/az;-><init>()V

    sput-object v0, Lcom/google/android/gms/internal/ay;->CREATOR:Lcom/google/android/gms/internal/az;

    return-void
.end method

.method public constructor <init>()V
    .locals 9

    const/4 v7, 0x0

    const/4 v8, 0x0

    const/4 v1, 0x2

    const-string v2, "interstitial_mb"

    const/4 v3, 0x0

    const/4 v4, 0x0

    const/4 v5, 0x1

    const/4 v6, 0x0

    move-object v0, p0

    invoke-direct/range {v0 .. v8}, Lcom/google/android/gms/internal/ay;-><init>(ILjava/lang/String;IIZII[Lcom/google/android/gms/internal/ay;)V

    return-void
.end method

.method constructor <init>(ILjava/lang/String;IIZII[Lcom/google/android/gms/internal/ay;)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput p1, p0, Lcom/google/android/gms/internal/ay;->versionCode:I

    iput-object p2, p0, Lcom/google/android/gms/internal/ay;->of:Ljava/lang/String;

    iput p3, p0, Lcom/google/android/gms/internal/ay;->height:I

    iput p4, p0, Lcom/google/android/gms/internal/ay;->heightPixels:I

    iput-boolean p5, p0, Lcom/google/android/gms/internal/ay;->og:Z

    iput p6, p0, Lcom/google/android/gms/internal/ay;->width:I

    iput p7, p0, Lcom/google/android/gms/internal/ay;->widthPixels:I

    iput-object p8, p0, Lcom/google/android/gms/internal/ay;->oh:[Lcom/google/android/gms/internal/ay;

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Lcom/google/android/gms/ads/AdSize;)V
    .locals 2

    const/4 v0, 0x1

    new-array v0, v0, [Lcom/google/android/gms/ads/AdSize;

    const/4 v1, 0x0

    aput-object p2, v0, v1

    invoke-direct {p0, p1, v0}, Lcom/google/android/gms/internal/ay;-><init>(Landroid/content/Context;[Lcom/google/android/gms/ads/AdSize;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;[Lcom/google/android/gms/ads/AdSize;)V
    .locals 9

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, 0x0

    aget-object v1, p2, v0

    const/4 v2, 0x2

    iput v2, p0, Lcom/google/android/gms/internal/ay;->versionCode:I

    iput-boolean v0, p0, Lcom/google/android/gms/internal/ay;->og:Z

    invoke-virtual {v1}, Lcom/google/android/gms/ads/AdSize;->getWidth()I

    move-result v2

    iput v2, p0, Lcom/google/android/gms/internal/ay;->width:I

    invoke-virtual {v1}, Lcom/google/android/gms/ads/AdSize;->getHeight()I

    move-result v3

    iput v3, p0, Lcom/google/android/gms/internal/ay;->height:I

    const/4 v4, -0x1

    const/4 v5, 0x1

    if-ne v2, v4, :cond_0

    move v4, v5

    goto :goto_0

    :cond_0
    move v4, v0

    :goto_0
    const/4 v6, -0x2

    if-ne v3, v6, :cond_1

    move v6, v5

    goto :goto_1

    :cond_1
    move v6, v0

    :goto_1
    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v7

    invoke-virtual {v7}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object v7

    if-eqz v4, :cond_2

    invoke-static {v7}, Lcom/google/android/gms/internal/ay;->a(Landroid/util/DisplayMetrics;)I

    move-result v2

    iput v2, p0, Lcom/google/android/gms/internal/ay;->widthPixels:I

    int-to-float v2, v2

    iget v8, v7, Landroid/util/DisplayMetrics;->density:F

    div-float/2addr v2, v8

    float-to-int v2, v2

    goto :goto_2

    :cond_2
    invoke-static {v7, v2}, Lcom/google/android/gms/internal/gr;->a(Landroid/util/DisplayMetrics;I)I

    move-result v8

    iput v8, p0, Lcom/google/android/gms/internal/ay;->widthPixels:I

    :goto_2
    if-eqz v6, :cond_3

    invoke-static {v7}, Lcom/google/android/gms/internal/ay;->c(Landroid/util/DisplayMetrics;)I

    move-result v3

    :cond_3
    invoke-static {v7, v3}, Lcom/google/android/gms/internal/gr;->a(Landroid/util/DisplayMetrics;I)I

    move-result v7

    iput v7, p0, Lcom/google/android/gms/internal/ay;->heightPixels:I

    if-nez v4, :cond_5

    if-eqz v6, :cond_4

    goto :goto_3

    :cond_4
    invoke-virtual {v1}, Lcom/google/android/gms/ads/AdSize;->toString()Ljava/lang/String;

    move-result-object v1

    goto :goto_4

    :cond_5
    :goto_3
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "x"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "_as"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    :goto_4
    iput-object v1, p0, Lcom/google/android/gms/internal/ay;->of:Ljava/lang/String;

    array-length v1, p2

    if-le v1, v5, :cond_6

    array-length v1, p2

    new-array v1, v1, [Lcom/google/android/gms/internal/ay;

    iput-object v1, p0, Lcom/google/android/gms/internal/ay;->oh:[Lcom/google/android/gms/internal/ay;

    :goto_5
    array-length v1, p2

    if-ge v0, v1, :cond_7

    iget-object v1, p0, Lcom/google/android/gms/internal/ay;->oh:[Lcom/google/android/gms/internal/ay;

    new-instance v2, Lcom/google/android/gms/internal/ay;

    aget-object v3, p2, v0

    invoke-direct {v2, p1, v3}, Lcom/google/android/gms/internal/ay;-><init>(Landroid/content/Context;Lcom/google/android/gms/ads/AdSize;)V

    aput-object v2, v1, v0

    add-int/lit8 v0, v0, 0x1

    goto :goto_5

    :cond_6
    const/4 p1, 0x0

    iput-object p1, p0, Lcom/google/android/gms/internal/ay;->oh:[Lcom/google/android/gms/internal/ay;

    :cond_7
    return-void
.end method

.method public constructor <init>(Lcom/google/android/gms/internal/ay;[Lcom/google/android/gms/internal/ay;)V
    .locals 9

    iget-object v2, p1, Lcom/google/android/gms/internal/ay;->of:Ljava/lang/String;

    iget v3, p1, Lcom/google/android/gms/internal/ay;->height:I

    iget v4, p1, Lcom/google/android/gms/internal/ay;->heightPixels:I

    iget-boolean v5, p1, Lcom/google/android/gms/internal/ay;->og:Z

    iget v6, p1, Lcom/google/android/gms/internal/ay;->width:I

    iget v7, p1, Lcom/google/android/gms/internal/ay;->widthPixels:I

    const/4 v1, 0x2

    move-object v0, p0

    move-object v8, p2

    invoke-direct/range {v0 .. v8}, Lcom/google/android/gms/internal/ay;-><init>(ILjava/lang/String;IIZII[Lcom/google/android/gms/internal/ay;)V

    return-void
.end method

.method public static a(Landroid/util/DisplayMetrics;)I
    .locals 0

    iget p0, p0, Landroid/util/DisplayMetrics;->widthPixels:I

    return p0
.end method

.method public static b(Landroid/util/DisplayMetrics;)I
    .locals 1

    invoke-static {p0}, Lcom/google/android/gms/internal/ay;->c(Landroid/util/DisplayMetrics;)I

    move-result v0

    int-to-float v0, v0

    iget p0, p0, Landroid/util/DisplayMetrics;->density:F

    mul-float/2addr v0, p0

    float-to-int p0, v0

    return p0
.end method

.method private static c(Landroid/util/DisplayMetrics;)I
    .locals 1

    iget v0, p0, Landroid/util/DisplayMetrics;->heightPixels:I

    int-to-float v0, v0

    iget p0, p0, Landroid/util/DisplayMetrics;->density:F

    div-float/2addr v0, p0

    float-to-int p0, v0

    const/16 v0, 0x190

    if-gt p0, v0, :cond_0

    const/16 p0, 0x20

    return p0

    :cond_0
    const/16 v0, 0x2d0

    if-gt p0, v0, :cond_1

    const/16 p0, 0x32

    return p0

    :cond_1
    const/16 p0, 0x5a

    return p0
.end method


# virtual methods
.method public bc()Lcom/google/android/gms/ads/AdSize;
    .locals 2

    iget v0, p0, Lcom/google/android/gms/internal/ay;->width:I

    iget v1, p0, Lcom/google/android/gms/internal/ay;->height:I

    iget-object p0, p0, Lcom/google/android/gms/internal/ay;->of:Ljava/lang/String;

    invoke-static {v0, v1, p0}, Lcom/google/android/gms/ads/a;->a(IILjava/lang/String;)Lcom/google/android/gms/ads/AdSize;

    move-result-object p0

    return-object p0
.end method

.method public describeContents()I
    .locals 0

    const/4 p0, 0x0

    return p0
.end method

.method public writeToParcel(Landroid/os/Parcel;I)V
    .locals 0

    invoke-static {p0, p1, p2}, Lcom/google/android/gms/internal/az;->a(Lcom/google/android/gms/internal/ay;Landroid/os/Parcel;I)V

    return-void
.end method
