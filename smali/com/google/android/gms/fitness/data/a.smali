.class public final Lcom/google/android/gms/fitness/data/a;
.super Ljava/lang/Object;

# interfaces
.implements Lcom/google/android/gms/common/internal/safeparcel/SafeParcelable;


# static fields
.field public static final CREATOR:Landroid/os/Parcelable$Creator;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/os/Parcelable$Creator<",
            "Lcom/google/android/gms/fitness/data/a;",
            ">;"
        }
    .end annotation
.end field

.field public static final Sw:Lcom/google/android/gms/fitness/data/a;


# instance fields
.field private final BR:I

.field private final BZ:Ljava/lang/String;

.field private final Sx:Ljava/lang/String;

.field private final Sy:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .locals 4

    new-instance v0, Lcom/google/android/gms/fitness/data/a;

    const v1, 0x5e2978

    invoke-static {v1}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v1

    const/4 v2, 0x0

    const-string v3, "com.google.android.gms"

    invoke-direct {v0, v3, v1, v2}, Lcom/google/android/gms/fitness/data/a;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    sput-object v0, Lcom/google/android/gms/fitness/data/a;->Sw:Lcom/google/android/gms/fitness/data/a;

    new-instance v0, Lcom/google/android/gms/fitness/data/b;

    invoke-direct {v0}, Lcom/google/android/gms/fitness/data/b;-><init>()V

    sput-object v0, Lcom/google/android/gms/fitness/data/a;->CREATOR:Landroid/os/Parcelable$Creator;

    return-void
.end method

.method constructor <init>(ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput p1, p0, Lcom/google/android/gms/fitness/data/a;->BR:I

    invoke-static {p2}, Lcom/google/android/gms/common/internal/o;->i(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/lang/String;

    iput-object p1, p0, Lcom/google/android/gms/fitness/data/a;->BZ:Ljava/lang/String;

    const-string p1, ""

    iput-object p1, p0, Lcom/google/android/gms/fitness/data/a;->Sx:Ljava/lang/String;

    iput-object p4, p0, Lcom/google/android/gms/fitness/data/a;->Sy:Ljava/lang/String;

    return-void
.end method

.method public constructor <init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .locals 1

    const/4 p2, 0x1

    const-string v0, ""

    invoke-direct {p0, p2, p1, v0, p3}, Lcom/google/android/gms/fitness/data/a;-><init>(ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method

.method private a(Lcom/google/android/gms/fitness/data/a;)Z
    .locals 2

    iget-object v0, p0, Lcom/google/android/gms/fitness/data/a;->BZ:Ljava/lang/String;

    iget-object v1, p1, Lcom/google/android/gms/fitness/data/a;->BZ:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/google/android/gms/fitness/data/a;->Sx:Ljava/lang/String;

    iget-object v1, p1, Lcom/google/android/gms/fitness/data/a;->Sx:Ljava/lang/String;

    invoke-static {v0, v1}, Lcom/google/android/gms/common/internal/n;->equal(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object p0, p0, Lcom/google/android/gms/fitness/data/a;->Sy:Ljava/lang/String;

    iget-object p1, p1, Lcom/google/android/gms/fitness/data/a;->Sy:Ljava/lang/String;

    invoke-static {p0, p1}, Lcom/google/android/gms/common/internal/n;->equal(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result p0

    if-eqz p0, :cond_0

    const/4 p0, 0x1

    goto :goto_0

    :cond_0
    const/4 p0, 0x0

    :goto_0
    return p0
.end method


# virtual methods
.method public describeContents()I
    .locals 0

    const/4 p0, 0x0

    return p0
.end method

.method public equals(Ljava/lang/Object;)Z
    .locals 1

    if-eq p0, p1, :cond_1

    instance-of v0, p1, Lcom/google/android/gms/fitness/data/a;

    if-eqz v0, :cond_0

    check-cast p1, Lcom/google/android/gms/fitness/data/a;

    invoke-direct {p0, p1}, Lcom/google/android/gms/fitness/data/a;->a(Lcom/google/android/gms/fitness/data/a;)Z

    move-result p0

    if-eqz p0, :cond_0

    goto :goto_0

    :cond_0
    const/4 p0, 0x0

    goto :goto_1

    :cond_1
    :goto_0
    const/4 p0, 0x1

    :goto_1
    return p0
.end method

.method public getPackageName()Ljava/lang/String;
    .locals 0

    iget-object p0, p0, Lcom/google/android/gms/fitness/data/a;->BZ:Ljava/lang/String;

    return-object p0
.end method

.method public getVersion()Ljava/lang/String;
    .locals 0

    iget-object p0, p0, Lcom/google/android/gms/fitness/data/a;->Sx:Ljava/lang/String;

    return-object p0
.end method

.method getVersionCode()I
    .locals 0

    iget p0, p0, Lcom/google/android/gms/fitness/data/a;->BR:I

    return p0
.end method

.method public hashCode()I
    .locals 2

    iget-object v0, p0, Lcom/google/android/gms/fitness/data/a;->BZ:Ljava/lang/String;

    iget-object v1, p0, Lcom/google/android/gms/fitness/data/a;->Sx:Ljava/lang/String;

    iget-object p0, p0, Lcom/google/android/gms/fitness/data/a;->Sy:Ljava/lang/String;

    filled-new-array {v0, v1, p0}, [Ljava/lang/Object;

    move-result-object p0

    invoke-static {p0}, Lcom/google/android/gms/common/internal/n;->hashCode([Ljava/lang/Object;)I

    move-result p0

    return p0
.end method

.method iA()Lcom/google/android/gms/fitness/data/a;
    .locals 3

    new-instance v0, Lcom/google/android/gms/fitness/data/a;

    iget-object v1, p0, Lcom/google/android/gms/fitness/data/a;->BZ:Ljava/lang/String;

    invoke-static {v1}, Lcom/google/android/gms/internal/kw;->bt(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    iget-object v2, p0, Lcom/google/android/gms/fitness/data/a;->Sx:Ljava/lang/String;

    invoke-static {v2}, Lcom/google/android/gms/internal/kw;->bt(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    iget-object p0, p0, Lcom/google/android/gms/fitness/data/a;->Sy:Ljava/lang/String;

    invoke-static {p0}, Lcom/google/android/gms/internal/kw;->bt(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    invoke-direct {v0, v1, v2, p0}, Lcom/google/android/gms/fitness/data/a;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    return-object v0
.end method

.method public iz()Ljava/lang/String;
    .locals 0

    iget-object p0, p0, Lcom/google/android/gms/fitness/data/a;->Sy:Ljava/lang/String;

    return-object p0
.end method

.method public toString()Ljava/lang/String;
    .locals 2

    iget-object v0, p0, Lcom/google/android/gms/fitness/data/a;->BZ:Ljava/lang/String;

    iget-object v1, p0, Lcom/google/android/gms/fitness/data/a;->Sx:Ljava/lang/String;

    iget-object p0, p0, Lcom/google/android/gms/fitness/data/a;->Sy:Ljava/lang/String;

    filled-new-array {v0, v1, p0}, [Ljava/lang/Object;

    move-result-object p0

    const-string v0, "Application{%s:%s:%s}"

    invoke-static {v0, p0}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method public writeToParcel(Landroid/os/Parcel;I)V
    .locals 0

    invoke-static {p0, p1, p2}, Lcom/google/android/gms/fitness/data/b;->a(Lcom/google/android/gms/fitness/data/a;Landroid/os/Parcel;I)V

    return-void
.end method
