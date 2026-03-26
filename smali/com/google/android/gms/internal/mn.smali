.class public final Lcom/google/android/gms/internal/mn;
.super Ljava/lang/Object;

# interfaces
.implements Lcom/google/android/gms/common/internal/safeparcel/SafeParcelable;


# static fields
.field public static final CREATOR:Lcom/google/android/gms/internal/mo;

.field static final afA:J


# instance fields
.field final BR:I

.field private final aes:J

.field private final afB:Lcom/google/android/gms/internal/mj;

.field private final mPriority:I


# direct methods
.method static constructor <clinit>()V
    .locals 3

    new-instance v0, Lcom/google/android/gms/internal/mo;

    invoke-direct {v0}, Lcom/google/android/gms/internal/mo;-><init>()V

    sput-object v0, Lcom/google/android/gms/internal/mn;->CREATOR:Lcom/google/android/gms/internal/mo;

    sget-object v0, Ljava/util/concurrent/TimeUnit;->HOURS:Ljava/util/concurrent/TimeUnit;

    const-wide/16 v1, 0x1

    invoke-virtual {v0, v1, v2}, Ljava/util/concurrent/TimeUnit;->toMillis(J)J

    move-result-wide v0

    sput-wide v0, Lcom/google/android/gms/internal/mn;->afA:J

    return-void
.end method

.method public constructor <init>(ILcom/google/android/gms/internal/mj;JI)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput p1, p0, Lcom/google/android/gms/internal/mn;->BR:I

    iput-object p2, p0, Lcom/google/android/gms/internal/mn;->afB:Lcom/google/android/gms/internal/mj;

    iput-wide p3, p0, Lcom/google/android/gms/internal/mn;->aes:J

    iput p5, p0, Lcom/google/android/gms/internal/mn;->mPriority:I

    return-void
.end method


# virtual methods
.method public describeContents()I
    .locals 0

    const/4 p0, 0x0

    return p0
.end method

.method public equals(Ljava/lang/Object;)Z
    .locals 7

    const/4 v0, 0x1

    if-ne p0, p1, :cond_0

    return v0

    :cond_0
    instance-of v1, p1, Lcom/google/android/gms/internal/mn;

    const/4 v2, 0x0

    if-nez v1, :cond_1

    return v2

    :cond_1
    check-cast p1, Lcom/google/android/gms/internal/mn;

    iget-object v1, p0, Lcom/google/android/gms/internal/mn;->afB:Lcom/google/android/gms/internal/mj;

    iget-object v3, p1, Lcom/google/android/gms/internal/mn;->afB:Lcom/google/android/gms/internal/mj;

    invoke-static {v1, v3}, Lcom/google/android/gms/common/internal/n;->equal(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_2

    iget-wide v3, p0, Lcom/google/android/gms/internal/mn;->aes:J

    iget-wide v5, p1, Lcom/google/android/gms/internal/mn;->aes:J

    cmp-long v1, v3, v5

    if-nez v1, :cond_2

    iget p0, p0, Lcom/google/android/gms/internal/mn;->mPriority:I

    iget p1, p1, Lcom/google/android/gms/internal/mn;->mPriority:I

    if-ne p0, p1, :cond_2

    goto :goto_0

    :cond_2
    move v0, v2

    :goto_0
    return v0
.end method

.method public getInterval()J
    .locals 2

    iget-wide v0, p0, Lcom/google/android/gms/internal/mn;->aes:J

    return-wide v0
.end method

.method public getPriority()I
    .locals 0

    iget p0, p0, Lcom/google/android/gms/internal/mn;->mPriority:I

    return p0
.end method

.method public hashCode()I
    .locals 3

    iget-object v0, p0, Lcom/google/android/gms/internal/mn;->afB:Lcom/google/android/gms/internal/mj;

    iget-wide v1, p0, Lcom/google/android/gms/internal/mn;->aes:J

    invoke-static {v1, v2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v1

    iget p0, p0, Lcom/google/android/gms/internal/mn;->mPriority:I

    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p0

    filled-new-array {v0, v1, p0}, [Ljava/lang/Object;

    move-result-object p0

    invoke-static {p0}, Lcom/google/android/gms/common/internal/n;->hashCode([Ljava/lang/Object;)I

    move-result p0

    return p0
.end method

.method public mh()Lcom/google/android/gms/internal/mj;
    .locals 0

    iget-object p0, p0, Lcom/google/android/gms/internal/mn;->afB:Lcom/google/android/gms/internal/mj;

    return-object p0
.end method

.method public toString()Ljava/lang/String;
    .locals 3

    invoke-static {p0}, Lcom/google/android/gms/common/internal/n;->h(Ljava/lang/Object;)Lcom/google/android/gms/common/internal/n$a;

    move-result-object v0

    const-string v1, "filter"

    iget-object v2, p0, Lcom/google/android/gms/internal/mn;->afB:Lcom/google/android/gms/internal/mj;

    invoke-virtual {v0, v1, v2}, Lcom/google/android/gms/common/internal/n$a;->a(Ljava/lang/String;Ljava/lang/Object;)Lcom/google/android/gms/common/internal/n$a;

    move-result-object v0

    iget-wide v1, p0, Lcom/google/android/gms/internal/mn;->aes:J

    invoke-static {v1, v2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v1

    const-string v2, "interval"

    invoke-virtual {v0, v2, v1}, Lcom/google/android/gms/common/internal/n$a;->a(Ljava/lang/String;Ljava/lang/Object;)Lcom/google/android/gms/common/internal/n$a;

    move-result-object v0

    iget p0, p0, Lcom/google/android/gms/internal/mn;->mPriority:I

    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p0

    const-string v1, "priority"

    invoke-virtual {v0, v1, p0}, Lcom/google/android/gms/common/internal/n$a;->a(Ljava/lang/String;Ljava/lang/Object;)Lcom/google/android/gms/common/internal/n$a;

    move-result-object p0

    invoke-virtual {p0}, Lcom/google/android/gms/common/internal/n$a;->toString()Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method public writeToParcel(Landroid/os/Parcel;I)V
    .locals 0

    invoke-static {p0, p1, p2}, Lcom/google/android/gms/internal/mo;->a(Lcom/google/android/gms/internal/mn;Landroid/os/Parcel;I)V

    return-void
.end method
