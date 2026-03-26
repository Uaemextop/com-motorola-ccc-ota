.class public final Lcom/google/android/gms/internal/mt;
.super Ljava/lang/Object;

# interfaces
.implements Lcom/google/android/gms/common/internal/safeparcel/SafeParcelable;


# static fields
.field public static final CREATOR:Lcom/google/android/gms/internal/mu;

.field public static final aic:Lcom/google/android/gms/internal/mt;

.field public static final aid:Lcom/google/android/gms/internal/mt;

.field public static final aie:Lcom/google/android/gms/internal/mt;

.field public static final aif:Ljava/util/Set;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Set<",
            "Lcom/google/android/gms/internal/mt;",
            ">;"
        }
    .end annotation
.end field


# instance fields
.field final BR:I

.field final aig:I

.field final uO:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .locals 4

    const-string v0, "test_type"

    const/4 v1, 0x1

    invoke-static {v0, v1}, Lcom/google/android/gms/internal/mt;->y(Ljava/lang/String;I)Lcom/google/android/gms/internal/mt;

    move-result-object v0

    sput-object v0, Lcom/google/android/gms/internal/mt;->aic:Lcom/google/android/gms/internal/mt;

    const-string v1, "trellis_store"

    const/4 v2, 0x2

    invoke-static {v1, v2}, Lcom/google/android/gms/internal/mt;->y(Ljava/lang/String;I)Lcom/google/android/gms/internal/mt;

    move-result-object v1

    sput-object v1, Lcom/google/android/gms/internal/mt;->aid:Lcom/google/android/gms/internal/mt;

    const-string v2, "labeled_place"

    const/4 v3, 0x6

    invoke-static {v2, v3}, Lcom/google/android/gms/internal/mt;->y(Ljava/lang/String;I)Lcom/google/android/gms/internal/mt;

    move-result-object v2

    sput-object v2, Lcom/google/android/gms/internal/mt;->aie:Lcom/google/android/gms/internal/mt;

    new-instance v3, Ljava/util/HashSet;

    filled-new-array {v0, v1, v2}, [Lcom/google/android/gms/internal/mt;

    move-result-object v0

    invoke-static {v0}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v0

    invoke-direct {v3, v0}, Ljava/util/HashSet;-><init>(Ljava/util/Collection;)V

    invoke-static {v3}, Ljava/util/Collections;->unmodifiableSet(Ljava/util/Set;)Ljava/util/Set;

    move-result-object v0

    sput-object v0, Lcom/google/android/gms/internal/mt;->aif:Ljava/util/Set;

    new-instance v0, Lcom/google/android/gms/internal/mu;

    invoke-direct {v0}, Lcom/google/android/gms/internal/mu;-><init>()V

    sput-object v0, Lcom/google/android/gms/internal/mt;->CREATOR:Lcom/google/android/gms/internal/mu;

    return-void
.end method

.method constructor <init>(ILjava/lang/String;I)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    invoke-static {p2}, Lcom/google/android/gms/common/internal/o;->aZ(Ljava/lang/String;)Ljava/lang/String;

    iput p1, p0, Lcom/google/android/gms/internal/mt;->BR:I

    iput-object p2, p0, Lcom/google/android/gms/internal/mt;->uO:Ljava/lang/String;

    iput p3, p0, Lcom/google/android/gms/internal/mt;->aig:I

    return-void
.end method

.method private static y(Ljava/lang/String;I)Lcom/google/android/gms/internal/mt;
    .locals 2

    new-instance v0, Lcom/google/android/gms/internal/mt;

    const/4 v1, 0x0

    invoke-direct {v0, v1, p0, p1}, Lcom/google/android/gms/internal/mt;-><init>(ILjava/lang/String;I)V

    return-object v0
.end method


# virtual methods
.method public describeContents()I
    .locals 0

    const/4 p0, 0x0

    return p0
.end method

.method public equals(Ljava/lang/Object;)Z
    .locals 4

    const/4 v0, 0x1

    if-ne p0, p1, :cond_0

    return v0

    :cond_0
    instance-of v1, p1, Lcom/google/android/gms/internal/mt;

    const/4 v2, 0x0

    if-nez v1, :cond_1

    return v2

    :cond_1
    check-cast p1, Lcom/google/android/gms/internal/mt;

    iget-object v1, p0, Lcom/google/android/gms/internal/mt;->uO:Ljava/lang/String;

    iget-object v3, p1, Lcom/google/android/gms/internal/mt;->uO:Ljava/lang/String;

    invoke-virtual {v1, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_2

    iget p0, p0, Lcom/google/android/gms/internal/mt;->aig:I

    iget p1, p1, Lcom/google/android/gms/internal/mt;->aig:I

    if-ne p0, p1, :cond_2

    goto :goto_0

    :cond_2
    move v0, v2

    :goto_0
    return v0
.end method

.method public hashCode()I
    .locals 0

    iget-object p0, p0, Lcom/google/android/gms/internal/mt;->uO:Ljava/lang/String;

    invoke-virtual {p0}, Ljava/lang/String;->hashCode()I

    move-result p0

    return p0
.end method

.method public toString()Ljava/lang/String;
    .locals 0

    iget-object p0, p0, Lcom/google/android/gms/internal/mt;->uO:Ljava/lang/String;

    return-object p0
.end method

.method public writeToParcel(Landroid/os/Parcel;I)V
    .locals 0

    invoke-static {p0, p1, p2}, Lcom/google/android/gms/internal/mu;->a(Lcom/google/android/gms/internal/mt;Landroid/os/Parcel;I)V

    return-void
.end method
