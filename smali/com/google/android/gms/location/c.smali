.class public Lcom/google/android/gms/location/c;
.super Ljava/lang/Object;

# interfaces
.implements Lcom/google/android/gms/common/internal/safeparcel/SafeParcelable;


# static fields
.field public static final CREATOR:Lcom/google/android/gms/location/d;


# instance fields
.field private final BR:I

.field aex:I

.field aey:I

.field aez:J


# direct methods
.method static constructor <clinit>()V
    .locals 1

    new-instance v0, Lcom/google/android/gms/location/d;

    invoke-direct {v0}, Lcom/google/android/gms/location/d;-><init>()V

    sput-object v0, Lcom/google/android/gms/location/c;->CREATOR:Lcom/google/android/gms/location/d;

    return-void
.end method

.method constructor <init>(IIIJ)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput p1, p0, Lcom/google/android/gms/location/c;->BR:I

    iput p2, p0, Lcom/google/android/gms/location/c;->aex:I

    iput p3, p0, Lcom/google/android/gms/location/c;->aey:I

    iput-wide p4, p0, Lcom/google/android/gms/location/c;->aez:J

    return-void
.end method

.method private ee(I)Ljava/lang/String;
    .locals 0

    if-eqz p1, :cond_0

    packed-switch p1, :pswitch_data_0

    const-string p0, "STATUS_UNKNOWN"

    return-object p0

    :pswitch_0
    const-string p0, "STATUS_IN_PROGRESS"

    return-object p0

    :pswitch_1
    const-string p0, "STATUS_LOCATION_DISABLED_IN_SETTINGS"

    return-object p0

    :pswitch_2
    const-string p0, "STATUS_SCANS_DISABLED_IN_SETTINGS"

    return-object p0

    :pswitch_3
    const-string p0, "STATUS_UNABLE_TO_QUERY_DATABASE"

    return-object p0

    :pswitch_4
    const-string p0, "STATUS_INVALID_SCAN"

    return-object p0

    :pswitch_5
    const-string p0, "STATUS_NO_INFO_IN_DATABASE"

    return-object p0

    :pswitch_6
    const-string p0, "STATUS_TIMED_OUT_ON_SCAN"

    return-object p0

    :cond_0
    const-string p0, "STATUS_SUCCESSFUL"

    return-object p0

    :pswitch_data_0
    .packed-switch 0x2
        :pswitch_6
        :pswitch_5
        :pswitch_4
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method


# virtual methods
.method public describeContents()I
    .locals 0

    const/4 p0, 0x0

    return p0
.end method

.method public equals(Ljava/lang/Object;)Z
    .locals 4

    instance-of v0, p1, Lcom/google/android/gms/location/c;

    const/4 v1, 0x0

    if-nez v0, :cond_0

    return v1

    :cond_0
    check-cast p1, Lcom/google/android/gms/location/c;

    iget v0, p0, Lcom/google/android/gms/location/c;->aex:I

    iget v2, p1, Lcom/google/android/gms/location/c;->aex:I

    if-ne v0, v2, :cond_1

    iget v0, p0, Lcom/google/android/gms/location/c;->aey:I

    iget v2, p1, Lcom/google/android/gms/location/c;->aey:I

    if-ne v0, v2, :cond_1

    iget-wide v2, p0, Lcom/google/android/gms/location/c;->aez:J

    iget-wide p0, p1, Lcom/google/android/gms/location/c;->aez:J

    cmp-long p0, v2, p0

    if-nez p0, :cond_1

    const/4 v1, 0x1

    :cond_1
    return v1
.end method

.method getVersionCode()I
    .locals 0

    iget p0, p0, Lcom/google/android/gms/location/c;->BR:I

    return p0
.end method

.method public hashCode()I
    .locals 4

    iget v0, p0, Lcom/google/android/gms/location/c;->aex:I

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    iget v1, p0, Lcom/google/android/gms/location/c;->aey:I

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    iget-wide v2, p0, Lcom/google/android/gms/location/c;->aez:J

    invoke-static {v2, v3}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object p0

    filled-new-array {v0, v1, p0}, [Ljava/lang/Object;

    move-result-object p0

    invoke-static {p0}, Lcom/google/android/gms/common/internal/n;->hashCode([Ljava/lang/Object;)I

    move-result p0

    return p0
.end method

.method public toString()Ljava/lang/String;
    .locals 4

    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "LocationStatus[cell status: "

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget v1, p0, Lcom/google/android/gms/location/c;->aex:I

    invoke-direct {p0, v1}, Lcom/google/android/gms/location/c;->ee(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, ", wifi status: "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget v2, p0, Lcom/google/android/gms/location/c;->aey:I

    invoke-direct {p0, v2}, Lcom/google/android/gms/location/c;->ee(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, ", elapsed realtime ns: "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-wide v2, p0, Lcom/google/android/gms/location/c;->aez:J

    invoke-virtual {v1, v2, v3}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    const/16 p0, 0x5d

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method public writeToParcel(Landroid/os/Parcel;I)V
    .locals 0

    invoke-static {p0, p1, p2}, Lcom/google/android/gms/location/d;->a(Lcom/google/android/gms/location/c;Landroid/os/Parcel;I)V

    return-void
.end method
