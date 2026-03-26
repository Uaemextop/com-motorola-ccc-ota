.class public Lcom/google/android/gms/internal/nm;
.super Ljava/lang/Object;

# interfaces
.implements Lcom/google/android/gms/common/internal/safeparcel/SafeParcelable;


# static fields
.field public static final CREATOR:Lcom/google/android/gms/internal/nn;


# instance fields
.field public final akR:I

.field public final akS:I

.field public final akT:Ljava/lang/String;

.field public final akU:Ljava/lang/String;

.field public final akV:Z

.field public final packageName:Ljava/lang/String;

.field public final versionCode:I


# direct methods
.method static constructor <clinit>()V
    .locals 1

    new-instance v0, Lcom/google/android/gms/internal/nn;

    invoke-direct {v0}, Lcom/google/android/gms/internal/nn;-><init>()V

    sput-object v0, Lcom/google/android/gms/internal/nm;->CREATOR:Lcom/google/android/gms/internal/nn;

    return-void
.end method

.method public constructor <init>(ILjava/lang/String;IILjava/lang/String;Ljava/lang/String;Z)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput p1, p0, Lcom/google/android/gms/internal/nm;->versionCode:I

    iput-object p2, p0, Lcom/google/android/gms/internal/nm;->packageName:Ljava/lang/String;

    iput p3, p0, Lcom/google/android/gms/internal/nm;->akR:I

    iput p4, p0, Lcom/google/android/gms/internal/nm;->akS:I

    iput-object p5, p0, Lcom/google/android/gms/internal/nm;->akT:Ljava/lang/String;

    iput-object p6, p0, Lcom/google/android/gms/internal/nm;->akU:Ljava/lang/String;

    iput-boolean p7, p0, Lcom/google/android/gms/internal/nm;->akV:Z

    return-void
.end method

.method public constructor <init>(Ljava/lang/String;IILjava/lang/String;Ljava/lang/String;Z)V
    .locals 1

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, 0x1

    iput v0, p0, Lcom/google/android/gms/internal/nm;->versionCode:I

    invoke-static {p1}, Lcom/google/android/gms/common/internal/o;->i(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/lang/String;

    iput-object p1, p0, Lcom/google/android/gms/internal/nm;->packageName:Ljava/lang/String;

    iput p2, p0, Lcom/google/android/gms/internal/nm;->akR:I

    iput p3, p0, Lcom/google/android/gms/internal/nm;->akS:I

    iput-object p4, p0, Lcom/google/android/gms/internal/nm;->akT:Ljava/lang/String;

    iput-object p5, p0, Lcom/google/android/gms/internal/nm;->akU:Ljava/lang/String;

    iput-boolean p6, p0, Lcom/google/android/gms/internal/nm;->akV:Z

    return-void
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
    instance-of v1, p1, Lcom/google/android/gms/internal/nm;

    const/4 v2, 0x0

    if-eqz v1, :cond_2

    check-cast p1, Lcom/google/android/gms/internal/nm;

    iget-object v1, p0, Lcom/google/android/gms/internal/nm;->packageName:Ljava/lang/String;

    iget-object v3, p1, Lcom/google/android/gms/internal/nm;->packageName:Ljava/lang/String;

    invoke-virtual {v1, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_1

    iget v1, p0, Lcom/google/android/gms/internal/nm;->akR:I

    iget v3, p1, Lcom/google/android/gms/internal/nm;->akR:I

    if-ne v1, v3, :cond_1

    iget v1, p0, Lcom/google/android/gms/internal/nm;->akS:I

    iget v3, p1, Lcom/google/android/gms/internal/nm;->akS:I

    if-ne v1, v3, :cond_1

    iget-object v1, p0, Lcom/google/android/gms/internal/nm;->akT:Ljava/lang/String;

    iget-object v3, p1, Lcom/google/android/gms/internal/nm;->akT:Ljava/lang/String;

    invoke-static {v1, v3}, Lcom/google/android/gms/common/internal/n;->equal(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_1

    iget-object v1, p0, Lcom/google/android/gms/internal/nm;->akU:Ljava/lang/String;

    iget-object v3, p1, Lcom/google/android/gms/internal/nm;->akU:Ljava/lang/String;

    invoke-static {v1, v3}, Lcom/google/android/gms/common/internal/n;->equal(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_1

    iget-boolean p0, p0, Lcom/google/android/gms/internal/nm;->akV:Z

    iget-boolean p1, p1, Lcom/google/android/gms/internal/nm;->akV:Z

    if-ne p0, p1, :cond_1

    goto :goto_0

    :cond_1
    move v0, v2

    :goto_0
    return v0

    :cond_2
    return v2
.end method

.method public hashCode()I
    .locals 6

    iget-object v0, p0, Lcom/google/android/gms/internal/nm;->packageName:Ljava/lang/String;

    iget v1, p0, Lcom/google/android/gms/internal/nm;->akR:I

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    iget v2, p0, Lcom/google/android/gms/internal/nm;->akS:I

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    iget-object v3, p0, Lcom/google/android/gms/internal/nm;->akT:Ljava/lang/String;

    iget-object v4, p0, Lcom/google/android/gms/internal/nm;->akU:Ljava/lang/String;

    iget-boolean p0, p0, Lcom/google/android/gms/internal/nm;->akV:Z

    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v5

    filled-new-array/range {v0 .. v5}, [Ljava/lang/Object;

    move-result-object p0

    invoke-static {p0}, Lcom/google/android/gms/common/internal/n;->hashCode([Ljava/lang/Object;)I

    move-result p0

    return p0
.end method

.method public toString()Ljava/lang/String;
    .locals 3

    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "PlayLoggerContext[package="

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v1, p0, Lcom/google/android/gms/internal/nm;->packageName:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, ",versionCode="

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v1, p0, Lcom/google/android/gms/internal/nm;->versionCode:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, ",logSource="

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v1, p0, Lcom/google/android/gms/internal/nm;->akS:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, ",uploadAccount="

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, p0, Lcom/google/android/gms/internal/nm;->akT:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, ",loggingId="

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, p0, Lcom/google/android/gms/internal/nm;->akU:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, ",logAndroidId="

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-boolean p0, p0, Lcom/google/android/gms/internal/nm;->akV:Z

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    const-string p0, "]"

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method public writeToParcel(Landroid/os/Parcel;I)V
    .locals 0

    invoke-static {p0, p1, p2}, Lcom/google/android/gms/internal/nn;->a(Lcom/google/android/gms/internal/nm;Landroid/os/Parcel;I)V

    return-void
.end method
