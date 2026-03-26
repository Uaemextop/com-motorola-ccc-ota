.class public Lcom/google/android/gms/plus/internal/h;
.super Ljava/lang/Object;

# interfaces
.implements Lcom/google/android/gms/common/internal/safeparcel/SafeParcelable;


# static fields
.field public static final CREATOR:Lcom/google/android/gms/plus/internal/j;


# instance fields
.field private final BR:I

.field private final Dd:Ljava/lang/String;

.field private final alD:[Ljava/lang/String;

.field private final alE:[Ljava/lang/String;

.field private final alF:[Ljava/lang/String;

.field private final alG:Ljava/lang/String;

.field private final alH:Ljava/lang/String;

.field private final alI:Ljava/lang/String;

.field private final alJ:Ljava/lang/String;

.field private final alK:Lcom/google/android/gms/plus/internal/PlusCommonExtras;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    new-instance v0, Lcom/google/android/gms/plus/internal/j;

    invoke-direct {v0}, Lcom/google/android/gms/plus/internal/j;-><init>()V

    sput-object v0, Lcom/google/android/gms/plus/internal/h;->CREATOR:Lcom/google/android/gms/plus/internal/j;

    return-void
.end method

.method constructor <init>(ILjava/lang/String;[Ljava/lang/String;[Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lcom/google/android/gms/plus/internal/PlusCommonExtras;)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput p1, p0, Lcom/google/android/gms/plus/internal/h;->BR:I

    iput-object p2, p0, Lcom/google/android/gms/plus/internal/h;->Dd:Ljava/lang/String;

    iput-object p3, p0, Lcom/google/android/gms/plus/internal/h;->alD:[Ljava/lang/String;

    iput-object p4, p0, Lcom/google/android/gms/plus/internal/h;->alE:[Ljava/lang/String;

    iput-object p5, p0, Lcom/google/android/gms/plus/internal/h;->alF:[Ljava/lang/String;

    iput-object p6, p0, Lcom/google/android/gms/plus/internal/h;->alG:Ljava/lang/String;

    iput-object p7, p0, Lcom/google/android/gms/plus/internal/h;->alH:Ljava/lang/String;

    iput-object p8, p0, Lcom/google/android/gms/plus/internal/h;->alI:Ljava/lang/String;

    iput-object p9, p0, Lcom/google/android/gms/plus/internal/h;->alJ:Ljava/lang/String;

    iput-object p10, p0, Lcom/google/android/gms/plus/internal/h;->alK:Lcom/google/android/gms/plus/internal/PlusCommonExtras;

    return-void
.end method

.method public constructor <init>(Ljava/lang/String;[Ljava/lang/String;[Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lcom/google/android/gms/plus/internal/PlusCommonExtras;)V
    .locals 1

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, 0x1

    iput v0, p0, Lcom/google/android/gms/plus/internal/h;->BR:I

    iput-object p1, p0, Lcom/google/android/gms/plus/internal/h;->Dd:Ljava/lang/String;

    iput-object p2, p0, Lcom/google/android/gms/plus/internal/h;->alD:[Ljava/lang/String;

    iput-object p3, p0, Lcom/google/android/gms/plus/internal/h;->alE:[Ljava/lang/String;

    iput-object p4, p0, Lcom/google/android/gms/plus/internal/h;->alF:[Ljava/lang/String;

    iput-object p5, p0, Lcom/google/android/gms/plus/internal/h;->alG:Ljava/lang/String;

    iput-object p6, p0, Lcom/google/android/gms/plus/internal/h;->alH:Ljava/lang/String;

    iput-object p7, p0, Lcom/google/android/gms/plus/internal/h;->alI:Ljava/lang/String;

    const/4 p1, 0x0

    iput-object p1, p0, Lcom/google/android/gms/plus/internal/h;->alJ:Ljava/lang/String;

    iput-object p8, p0, Lcom/google/android/gms/plus/internal/h;->alK:Lcom/google/android/gms/plus/internal/PlusCommonExtras;

    return-void
.end method


# virtual methods
.method public describeContents()I
    .locals 0

    const/4 p0, 0x0

    return p0
.end method

.method public equals(Ljava/lang/Object;)Z
    .locals 3

    instance-of v0, p1, Lcom/google/android/gms/plus/internal/h;

    const/4 v1, 0x0

    if-nez v0, :cond_0

    return v1

    :cond_0
    check-cast p1, Lcom/google/android/gms/plus/internal/h;

    iget v0, p0, Lcom/google/android/gms/plus/internal/h;->BR:I

    iget v2, p1, Lcom/google/android/gms/plus/internal/h;->BR:I

    if-ne v0, v2, :cond_1

    iget-object v0, p0, Lcom/google/android/gms/plus/internal/h;->Dd:Ljava/lang/String;

    iget-object v2, p1, Lcom/google/android/gms/plus/internal/h;->Dd:Ljava/lang/String;

    invoke-static {v0, v2}, Lcom/google/android/gms/common/internal/n;->equal(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/google/android/gms/plus/internal/h;->alD:[Ljava/lang/String;

    iget-object v2, p1, Lcom/google/android/gms/plus/internal/h;->alD:[Ljava/lang/String;

    invoke-static {v0, v2}, Ljava/util/Arrays;->equals([Ljava/lang/Object;[Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/google/android/gms/plus/internal/h;->alE:[Ljava/lang/String;

    iget-object v2, p1, Lcom/google/android/gms/plus/internal/h;->alE:[Ljava/lang/String;

    invoke-static {v0, v2}, Ljava/util/Arrays;->equals([Ljava/lang/Object;[Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/google/android/gms/plus/internal/h;->alF:[Ljava/lang/String;

    iget-object v2, p1, Lcom/google/android/gms/plus/internal/h;->alF:[Ljava/lang/String;

    invoke-static {v0, v2}, Ljava/util/Arrays;->equals([Ljava/lang/Object;[Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/google/android/gms/plus/internal/h;->alG:Ljava/lang/String;

    iget-object v2, p1, Lcom/google/android/gms/plus/internal/h;->alG:Ljava/lang/String;

    invoke-static {v0, v2}, Lcom/google/android/gms/common/internal/n;->equal(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/google/android/gms/plus/internal/h;->alH:Ljava/lang/String;

    iget-object v2, p1, Lcom/google/android/gms/plus/internal/h;->alH:Ljava/lang/String;

    invoke-static {v0, v2}, Lcom/google/android/gms/common/internal/n;->equal(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/google/android/gms/plus/internal/h;->alI:Ljava/lang/String;

    iget-object v2, p1, Lcom/google/android/gms/plus/internal/h;->alI:Ljava/lang/String;

    invoke-static {v0, v2}, Lcom/google/android/gms/common/internal/n;->equal(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/google/android/gms/plus/internal/h;->alJ:Ljava/lang/String;

    iget-object v2, p1, Lcom/google/android/gms/plus/internal/h;->alJ:Ljava/lang/String;

    invoke-static {v0, v2}, Lcom/google/android/gms/common/internal/n;->equal(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1

    iget-object p0, p0, Lcom/google/android/gms/plus/internal/h;->alK:Lcom/google/android/gms/plus/internal/PlusCommonExtras;

    iget-object p1, p1, Lcom/google/android/gms/plus/internal/h;->alK:Lcom/google/android/gms/plus/internal/PlusCommonExtras;

    invoke-static {p0, p1}, Lcom/google/android/gms/common/internal/n;->equal(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result p0

    if-eqz p0, :cond_1

    const/4 v1, 0x1

    :cond_1
    return v1
.end method

.method public getAccountName()Ljava/lang/String;
    .locals 0

    iget-object p0, p0, Lcom/google/android/gms/plus/internal/h;->Dd:Ljava/lang/String;

    return-object p0
.end method

.method public getVersionCode()I
    .locals 0

    iget p0, p0, Lcom/google/android/gms/plus/internal/h;->BR:I

    return p0
.end method

.method public hashCode()I
    .locals 11

    iget v0, p0, Lcom/google/android/gms/plus/internal/h;->BR:I

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    iget-object v2, p0, Lcom/google/android/gms/plus/internal/h;->Dd:Ljava/lang/String;

    iget-object v3, p0, Lcom/google/android/gms/plus/internal/h;->alD:[Ljava/lang/String;

    iget-object v4, p0, Lcom/google/android/gms/plus/internal/h;->alE:[Ljava/lang/String;

    iget-object v5, p0, Lcom/google/android/gms/plus/internal/h;->alF:[Ljava/lang/String;

    iget-object v6, p0, Lcom/google/android/gms/plus/internal/h;->alG:Ljava/lang/String;

    iget-object v7, p0, Lcom/google/android/gms/plus/internal/h;->alH:Ljava/lang/String;

    iget-object v8, p0, Lcom/google/android/gms/plus/internal/h;->alI:Ljava/lang/String;

    iget-object v9, p0, Lcom/google/android/gms/plus/internal/h;->alJ:Ljava/lang/String;

    iget-object v10, p0, Lcom/google/android/gms/plus/internal/h;->alK:Lcom/google/android/gms/plus/internal/PlusCommonExtras;

    filled-new-array/range {v1 .. v10}, [Ljava/lang/Object;

    move-result-object p0

    invoke-static {p0}, Lcom/google/android/gms/common/internal/n;->hashCode([Ljava/lang/Object;)I

    move-result p0

    return p0
.end method

.method public ng()[Ljava/lang/String;
    .locals 0

    iget-object p0, p0, Lcom/google/android/gms/plus/internal/h;->alD:[Ljava/lang/String;

    return-object p0
.end method

.method public nh()[Ljava/lang/String;
    .locals 0

    iget-object p0, p0, Lcom/google/android/gms/plus/internal/h;->alE:[Ljava/lang/String;

    return-object p0
.end method

.method public ni()[Ljava/lang/String;
    .locals 0

    iget-object p0, p0, Lcom/google/android/gms/plus/internal/h;->alF:[Ljava/lang/String;

    return-object p0
.end method

.method public nj()Ljava/lang/String;
    .locals 0

    iget-object p0, p0, Lcom/google/android/gms/plus/internal/h;->alG:Ljava/lang/String;

    return-object p0
.end method

.method public nk()Ljava/lang/String;
    .locals 0

    iget-object p0, p0, Lcom/google/android/gms/plus/internal/h;->alH:Ljava/lang/String;

    return-object p0
.end method

.method public nl()Ljava/lang/String;
    .locals 0

    iget-object p0, p0, Lcom/google/android/gms/plus/internal/h;->alI:Ljava/lang/String;

    return-object p0
.end method

.method public nm()Ljava/lang/String;
    .locals 0

    iget-object p0, p0, Lcom/google/android/gms/plus/internal/h;->alJ:Ljava/lang/String;

    return-object p0
.end method

.method public nn()Lcom/google/android/gms/plus/internal/PlusCommonExtras;
    .locals 0

    iget-object p0, p0, Lcom/google/android/gms/plus/internal/h;->alK:Lcom/google/android/gms/plus/internal/PlusCommonExtras;

    return-object p0
.end method

.method public no()Landroid/os/Bundle;
    .locals 2

    new-instance v0, Landroid/os/Bundle;

    invoke-direct {v0}, Landroid/os/Bundle;-><init>()V

    const-class v1, Lcom/google/android/gms/plus/internal/PlusCommonExtras;

    invoke-virtual {v1}, Ljava/lang/Class;->getClassLoader()Ljava/lang/ClassLoader;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/os/Bundle;->setClassLoader(Ljava/lang/ClassLoader;)V

    iget-object p0, p0, Lcom/google/android/gms/plus/internal/h;->alK:Lcom/google/android/gms/plus/internal/PlusCommonExtras;

    invoke-virtual {p0, v0}, Lcom/google/android/gms/plus/internal/PlusCommonExtras;->o(Landroid/os/Bundle;)V

    return-object v0
.end method

.method public toString()Ljava/lang/String;
    .locals 3

    invoke-static {p0}, Lcom/google/android/gms/common/internal/n;->h(Ljava/lang/Object;)Lcom/google/android/gms/common/internal/n$a;

    move-result-object v0

    iget v1, p0, Lcom/google/android/gms/plus/internal/h;->BR:I

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "versionCode"

    invoke-virtual {v0, v2, v1}, Lcom/google/android/gms/common/internal/n$a;->a(Ljava/lang/String;Ljava/lang/Object;)Lcom/google/android/gms/common/internal/n$a;

    move-result-object v0

    const-string v1, "accountName"

    iget-object v2, p0, Lcom/google/android/gms/plus/internal/h;->Dd:Ljava/lang/String;

    invoke-virtual {v0, v1, v2}, Lcom/google/android/gms/common/internal/n$a;->a(Ljava/lang/String;Ljava/lang/Object;)Lcom/google/android/gms/common/internal/n$a;

    move-result-object v0

    const-string v1, "requestedScopes"

    iget-object v2, p0, Lcom/google/android/gms/plus/internal/h;->alD:[Ljava/lang/String;

    invoke-virtual {v0, v1, v2}, Lcom/google/android/gms/common/internal/n$a;->a(Ljava/lang/String;Ljava/lang/Object;)Lcom/google/android/gms/common/internal/n$a;

    move-result-object v0

    const-string v1, "visibleActivities"

    iget-object v2, p0, Lcom/google/android/gms/plus/internal/h;->alE:[Ljava/lang/String;

    invoke-virtual {v0, v1, v2}, Lcom/google/android/gms/common/internal/n$a;->a(Ljava/lang/String;Ljava/lang/Object;)Lcom/google/android/gms/common/internal/n$a;

    move-result-object v0

    const-string v1, "requiredFeatures"

    iget-object v2, p0, Lcom/google/android/gms/plus/internal/h;->alF:[Ljava/lang/String;

    invoke-virtual {v0, v1, v2}, Lcom/google/android/gms/common/internal/n$a;->a(Ljava/lang/String;Ljava/lang/Object;)Lcom/google/android/gms/common/internal/n$a;

    move-result-object v0

    const-string v1, "packageNameForAuth"

    iget-object v2, p0, Lcom/google/android/gms/plus/internal/h;->alG:Ljava/lang/String;

    invoke-virtual {v0, v1, v2}, Lcom/google/android/gms/common/internal/n$a;->a(Ljava/lang/String;Ljava/lang/Object;)Lcom/google/android/gms/common/internal/n$a;

    move-result-object v0

    const-string v1, "callingPackageName"

    iget-object v2, p0, Lcom/google/android/gms/plus/internal/h;->alH:Ljava/lang/String;

    invoke-virtual {v0, v1, v2}, Lcom/google/android/gms/common/internal/n$a;->a(Ljava/lang/String;Ljava/lang/Object;)Lcom/google/android/gms/common/internal/n$a;

    move-result-object v0

    const-string v1, "applicationName"

    iget-object v2, p0, Lcom/google/android/gms/plus/internal/h;->alI:Ljava/lang/String;

    invoke-virtual {v0, v1, v2}, Lcom/google/android/gms/common/internal/n$a;->a(Ljava/lang/String;Ljava/lang/Object;)Lcom/google/android/gms/common/internal/n$a;

    move-result-object v0

    iget-object p0, p0, Lcom/google/android/gms/plus/internal/h;->alK:Lcom/google/android/gms/plus/internal/PlusCommonExtras;

    invoke-virtual {p0}, Lcom/google/android/gms/plus/internal/PlusCommonExtras;->toString()Ljava/lang/String;

    move-result-object p0

    const-string v1, "extra"

    invoke-virtual {v0, v1, p0}, Lcom/google/android/gms/common/internal/n$a;->a(Ljava/lang/String;Ljava/lang/Object;)Lcom/google/android/gms/common/internal/n$a;

    move-result-object p0

    invoke-virtual {p0}, Lcom/google/android/gms/common/internal/n$a;->toString()Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method public writeToParcel(Landroid/os/Parcel;I)V
    .locals 0

    invoke-static {p0, p1, p2}, Lcom/google/android/gms/plus/internal/j;->a(Lcom/google/android/gms/plus/internal/h;Landroid/os/Parcel;I)V

    return-void
.end method
