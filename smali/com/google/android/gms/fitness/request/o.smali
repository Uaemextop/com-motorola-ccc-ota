.class public Lcom/google/android/gms/fitness/request/o;
.super Ljava/lang/Object;

# interfaces
.implements Lcom/google/android/gms/common/internal/safeparcel/SafeParcelable;


# static fields
.field public static final CREATOR:Landroid/os/Parcelable$Creator;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/os/Parcelable$Creator<",
            "Lcom/google/android/gms/fitness/request/o;",
            ">;"
        }
    .end annotation
.end field


# instance fields
.field private final BR:I

.field private final Sp:Lcom/google/android/gms/fitness/data/DataType;

.field private final Sq:Lcom/google/android/gms/fitness/data/DataSource;

.field private final Tt:J

.field private final Tu:I

.field private UA:Lcom/google/android/gms/fitness/data/k;

.field UB:I

.field UC:I

.field private final UD:J

.field private final UE:J

.field private final UF:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/google/android/gms/location/LocationRequest;",
            ">;"
        }
    .end annotation
.end field

.field private final UG:J

.field private final UH:Ljava/util/List;

.field private final mPendingIntent:Landroid/app/PendingIntent;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    new-instance v0, Lcom/google/android/gms/fitness/request/p;

    invoke-direct {v0}, Lcom/google/android/gms/fitness/request/p;-><init>()V

    sput-object v0, Lcom/google/android/gms/fitness/request/o;->CREATOR:Landroid/os/Parcelable$Creator;

    return-void
.end method

.method constructor <init>(ILcom/google/android/gms/fitness/data/DataSource;Lcom/google/android/gms/fitness/data/DataType;Landroid/os/IBinder;IIJJLandroid/app/PendingIntent;JILjava/util/List;J)V
    .locals 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I",
            "Lcom/google/android/gms/fitness/data/DataSource;",
            "Lcom/google/android/gms/fitness/data/DataType;",
            "Landroid/os/IBinder;",
            "IIJJ",
            "Landroid/app/PendingIntent;",
            "JI",
            "Ljava/util/List<",
            "Lcom/google/android/gms/location/LocationRequest;",
            ">;J)V"
        }
    .end annotation

    move-object v0, p0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    move v1, p1

    iput v1, v0, Lcom/google/android/gms/fitness/request/o;->BR:I

    move-object v1, p2

    iput-object v1, v0, Lcom/google/android/gms/fitness/request/o;->Sq:Lcom/google/android/gms/fitness/data/DataSource;

    move-object v1, p3

    iput-object v1, v0, Lcom/google/android/gms/fitness/request/o;->Sp:Lcom/google/android/gms/fitness/data/DataType;

    if-nez p4, :cond_0

    const/4 v1, 0x0

    goto :goto_0

    :cond_0
    invoke-static {p4}, Lcom/google/android/gms/fitness/data/k$a;->an(Landroid/os/IBinder;)Lcom/google/android/gms/fitness/data/k;

    move-result-object v1

    :goto_0
    iput-object v1, v0, Lcom/google/android/gms/fitness/request/o;->UA:Lcom/google/android/gms/fitness/data/k;

    const-wide/16 v1, 0x0

    cmp-long v3, p7, v1

    if-nez v3, :cond_1

    move v3, p5

    int-to-long v3, v3

    goto :goto_1

    :cond_1
    move-wide v3, p7

    :goto_1
    iput-wide v3, v0, Lcom/google/android/gms/fitness/request/o;->Tt:J

    move-wide/from16 v3, p12

    iput-wide v3, v0, Lcom/google/android/gms/fitness/request/o;->UE:J

    cmp-long v1, p9, v1

    if-nez v1, :cond_2

    move v1, p6

    int-to-long v1, v1

    goto :goto_2

    :cond_2
    move-wide v1, p9

    :goto_2
    iput-wide v1, v0, Lcom/google/android/gms/fitness/request/o;->UD:J

    move-object/from16 v1, p15

    iput-object v1, v0, Lcom/google/android/gms/fitness/request/o;->UF:Ljava/util/List;

    move-object/from16 v1, p11

    iput-object v1, v0, Lcom/google/android/gms/fitness/request/o;->mPendingIntent:Landroid/app/PendingIntent;

    move/from16 v1, p14

    iput v1, v0, Lcom/google/android/gms/fitness/request/o;->Tu:I

    invoke-static {}, Ljava/util/Collections;->emptyList()Ljava/util/List;

    move-result-object v1

    iput-object v1, v0, Lcom/google/android/gms/fitness/request/o;->UH:Ljava/util/List;

    move-wide/from16 v1, p16

    iput-wide v1, v0, Lcom/google/android/gms/fitness/request/o;->UG:J

    return-void
.end method

.method private constructor <init>(Lcom/google/android/gms/fitness/data/DataSource;Lcom/google/android/gms/fitness/data/DataType;Lcom/google/android/gms/fitness/data/k;Landroid/app/PendingIntent;JJJILjava/util/List;Ljava/util/List;J)V
    .locals 3

    move-object v0, p0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v1, 0x4

    iput v1, v0, Lcom/google/android/gms/fitness/request/o;->BR:I

    move-object v1, p1

    iput-object v1, v0, Lcom/google/android/gms/fitness/request/o;->Sq:Lcom/google/android/gms/fitness/data/DataSource;

    move-object v1, p2

    iput-object v1, v0, Lcom/google/android/gms/fitness/request/o;->Sp:Lcom/google/android/gms/fitness/data/DataType;

    move-object v1, p3

    iput-object v1, v0, Lcom/google/android/gms/fitness/request/o;->UA:Lcom/google/android/gms/fitness/data/k;

    move-object v1, p4

    iput-object v1, v0, Lcom/google/android/gms/fitness/request/o;->mPendingIntent:Landroid/app/PendingIntent;

    move-wide v1, p5

    iput-wide v1, v0, Lcom/google/android/gms/fitness/request/o;->Tt:J

    move-wide v1, p7

    iput-wide v1, v0, Lcom/google/android/gms/fitness/request/o;->UE:J

    move-wide v1, p9

    iput-wide v1, v0, Lcom/google/android/gms/fitness/request/o;->UD:J

    move v1, p11

    iput v1, v0, Lcom/google/android/gms/fitness/request/o;->Tu:I

    move-object v1, p12

    iput-object v1, v0, Lcom/google/android/gms/fitness/request/o;->UF:Ljava/util/List;

    move-object/from16 v1, p13

    iput-object v1, v0, Lcom/google/android/gms/fitness/request/o;->UH:Ljava/util/List;

    move-wide/from16 v1, p14

    iput-wide v1, v0, Lcom/google/android/gms/fitness/request/o;->UG:J

    return-void
.end method

.method public constructor <init>(Lcom/google/android/gms/fitness/request/SensorRequest;Lcom/google/android/gms/fitness/data/k;Landroid/app/PendingIntent;)V
    .locals 16

    move-object/from16 v0, p1

    invoke-virtual/range {p1 .. p1}, Lcom/google/android/gms/fitness/request/SensorRequest;->getDataSource()Lcom/google/android/gms/fitness/data/DataSource;

    move-result-object v1

    invoke-virtual/range {p1 .. p1}, Lcom/google/android/gms/fitness/request/SensorRequest;->getDataType()Lcom/google/android/gms/fitness/data/DataType;

    move-result-object v2

    sget-object v3, Ljava/util/concurrent/TimeUnit;->MICROSECONDS:Ljava/util/concurrent/TimeUnit;

    invoke-virtual {v0, v3}, Lcom/google/android/gms/fitness/request/SensorRequest;->getSamplingRate(Ljava/util/concurrent/TimeUnit;)J

    move-result-wide v5

    sget-object v3, Ljava/util/concurrent/TimeUnit;->MICROSECONDS:Ljava/util/concurrent/TimeUnit;

    invoke-virtual {v0, v3}, Lcom/google/android/gms/fitness/request/SensorRequest;->getFastestRate(Ljava/util/concurrent/TimeUnit;)J

    move-result-wide v7

    sget-object v3, Ljava/util/concurrent/TimeUnit;->MICROSECONDS:Ljava/util/concurrent/TimeUnit;

    invoke-virtual {v0, v3}, Lcom/google/android/gms/fitness/request/SensorRequest;->getMaxDeliveryLatency(Ljava/util/concurrent/TimeUnit;)J

    move-result-wide v9

    invoke-virtual/range {p1 .. p1}, Lcom/google/android/gms/fitness/request/SensorRequest;->getAccuracyMode()I

    move-result v11

    invoke-static {}, Ljava/util/Collections;->emptyList()Ljava/util/List;

    move-result-object v13

    invoke-virtual/range {p1 .. p1}, Lcom/google/android/gms/fitness/request/SensorRequest;->jx()J

    move-result-wide v14

    const/4 v12, 0x0

    move-object/from16 v0, p0

    move-object/from16 v3, p2

    move-object/from16 v4, p3

    invoke-direct/range {v0 .. v15}, Lcom/google/android/gms/fitness/request/o;-><init>(Lcom/google/android/gms/fitness/data/DataSource;Lcom/google/android/gms/fitness/data/DataType;Lcom/google/android/gms/fitness/data/k;Landroid/app/PendingIntent;JJJILjava/util/List;Ljava/util/List;J)V

    return-void
.end method

.method private a(Lcom/google/android/gms/fitness/request/o;)Z
    .locals 4

    iget-object v0, p0, Lcom/google/android/gms/fitness/request/o;->Sq:Lcom/google/android/gms/fitness/data/DataSource;

    iget-object v1, p1, Lcom/google/android/gms/fitness/request/o;->Sq:Lcom/google/android/gms/fitness/data/DataSource;

    invoke-static {v0, v1}, Lcom/google/android/gms/common/internal/n;->equal(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/google/android/gms/fitness/request/o;->Sp:Lcom/google/android/gms/fitness/data/DataType;

    iget-object v1, p1, Lcom/google/android/gms/fitness/request/o;->Sp:Lcom/google/android/gms/fitness/data/DataType;

    invoke-static {v0, v1}, Lcom/google/android/gms/common/internal/n;->equal(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    iget-wide v0, p0, Lcom/google/android/gms/fitness/request/o;->Tt:J

    iget-wide v2, p1, Lcom/google/android/gms/fitness/request/o;->Tt:J

    cmp-long v0, v0, v2

    if-nez v0, :cond_0

    iget-wide v0, p0, Lcom/google/android/gms/fitness/request/o;->UE:J

    iget-wide v2, p1, Lcom/google/android/gms/fitness/request/o;->UE:J

    cmp-long v0, v0, v2

    if-nez v0, :cond_0

    iget-wide v0, p0, Lcom/google/android/gms/fitness/request/o;->UD:J

    iget-wide v2, p1, Lcom/google/android/gms/fitness/request/o;->UD:J

    cmp-long v0, v0, v2

    if-nez v0, :cond_0

    iget v0, p0, Lcom/google/android/gms/fitness/request/o;->Tu:I

    iget v1, p1, Lcom/google/android/gms/fitness/request/o;->Tu:I

    if-ne v0, v1, :cond_0

    iget-object p0, p0, Lcom/google/android/gms/fitness/request/o;->UF:Ljava/util/List;

    iget-object p1, p1, Lcom/google/android/gms/fitness/request/o;->UF:Ljava/util/List;

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

    instance-of v0, p1, Lcom/google/android/gms/fitness/request/o;

    if-eqz v0, :cond_0

    check-cast p1, Lcom/google/android/gms/fitness/request/o;

    invoke-direct {p0, p1}, Lcom/google/android/gms/fitness/request/o;->a(Lcom/google/android/gms/fitness/request/o;)Z

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

.method public getAccuracyMode()I
    .locals 0

    iget p0, p0, Lcom/google/android/gms/fitness/request/o;->Tu:I

    return p0
.end method

.method public getDataSource()Lcom/google/android/gms/fitness/data/DataSource;
    .locals 0

    iget-object p0, p0, Lcom/google/android/gms/fitness/request/o;->Sq:Lcom/google/android/gms/fitness/data/DataSource;

    return-object p0
.end method

.method public getDataType()Lcom/google/android/gms/fitness/data/DataType;
    .locals 0

    iget-object p0, p0, Lcom/google/android/gms/fitness/request/o;->Sp:Lcom/google/android/gms/fitness/data/DataType;

    return-object p0
.end method

.method getVersionCode()I
    .locals 0

    iget p0, p0, Lcom/google/android/gms/fitness/request/o;->BR:I

    return p0
.end method

.method public hashCode()I
    .locals 8

    iget-object v0, p0, Lcom/google/android/gms/fitness/request/o;->Sq:Lcom/google/android/gms/fitness/data/DataSource;

    iget-object v1, p0, Lcom/google/android/gms/fitness/request/o;->Sp:Lcom/google/android/gms/fitness/data/DataType;

    iget-object v2, p0, Lcom/google/android/gms/fitness/request/o;->UA:Lcom/google/android/gms/fitness/data/k;

    iget-wide v3, p0, Lcom/google/android/gms/fitness/request/o;->Tt:J

    invoke-static {v3, v4}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v3

    iget-wide v4, p0, Lcom/google/android/gms/fitness/request/o;->UE:J

    invoke-static {v4, v5}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v4

    iget-wide v5, p0, Lcom/google/android/gms/fitness/request/o;->UD:J

    invoke-static {v5, v6}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v5

    iget v6, p0, Lcom/google/android/gms/fitness/request/o;->Tu:I

    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v6

    iget-object v7, p0, Lcom/google/android/gms/fitness/request/o;->UF:Ljava/util/List;

    filled-new-array/range {v0 .. v7}, [Ljava/lang/Object;

    move-result-object p0

    invoke-static {p0}, Lcom/google/android/gms/common/internal/n;->hashCode([Ljava/lang/Object;)I

    move-result p0

    return p0
.end method

.method public iX()J
    .locals 2

    iget-wide v0, p0, Lcom/google/android/gms/fitness/request/o;->Tt:J

    return-wide v0
.end method

.method public jr()Landroid/app/PendingIntent;
    .locals 0

    iget-object p0, p0, Lcom/google/android/gms/fitness/request/o;->mPendingIntent:Landroid/app/PendingIntent;

    return-object p0
.end method

.method public js()J
    .locals 2

    iget-wide v0, p0, Lcom/google/android/gms/fitness/request/o;->UE:J

    return-wide v0
.end method

.method public jt()J
    .locals 2

    iget-wide v0, p0, Lcom/google/android/gms/fitness/request/o;->UD:J

    return-wide v0
.end method

.method public ju()Ljava/util/List;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Lcom/google/android/gms/location/LocationRequest;",
            ">;"
        }
    .end annotation

    iget-object p0, p0, Lcom/google/android/gms/fitness/request/o;->UF:Ljava/util/List;

    return-object p0
.end method

.method public jv()J
    .locals 2

    iget-wide v0, p0, Lcom/google/android/gms/fitness/request/o;->UG:J

    return-wide v0
.end method

.method jw()Landroid/os/IBinder;
    .locals 0

    iget-object p0, p0, Lcom/google/android/gms/fitness/request/o;->UA:Lcom/google/android/gms/fitness/data/k;

    if-nez p0, :cond_0

    const/4 p0, 0x0

    goto :goto_0

    :cond_0
    invoke-interface {p0}, Lcom/google/android/gms/fitness/data/k;->asBinder()Landroid/os/IBinder;

    move-result-object p0

    :goto_0
    return-object p0
.end method

.method public toString()Ljava/lang/String;
    .locals 6

    iget-object v0, p0, Lcom/google/android/gms/fitness/request/o;->Sp:Lcom/google/android/gms/fitness/data/DataType;

    iget-object v1, p0, Lcom/google/android/gms/fitness/request/o;->Sq:Lcom/google/android/gms/fitness/data/DataSource;

    iget-wide v2, p0, Lcom/google/android/gms/fitness/request/o;->Tt:J

    invoke-static {v2, v3}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v2

    iget-wide v3, p0, Lcom/google/android/gms/fitness/request/o;->UE:J

    invoke-static {v3, v4}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v3

    iget-wide v4, p0, Lcom/google/android/gms/fitness/request/o;->UD:J

    invoke-static {v4, v5}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object p0

    filled-new-array {v0, v1, v2, v3, p0}, [Ljava/lang/Object;

    move-result-object p0

    const-string v0, "SensorRegistrationRequest{type %s source %s interval %s fastest %s latency %s}"

    invoke-static {v0, p0}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method public writeToParcel(Landroid/os/Parcel;I)V
    .locals 0

    invoke-static {p0, p1, p2}, Lcom/google/android/gms/fitness/request/p;->a(Lcom/google/android/gms/fitness/request/o;Landroid/os/Parcel;I)V

    return-void
.end method
