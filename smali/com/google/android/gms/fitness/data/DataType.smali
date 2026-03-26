.class public final Lcom/google/android/gms/fitness/data/DataType;
.super Ljava/lang/Object;

# interfaces
.implements Lcom/google/android/gms/common/internal/safeparcel/SafeParcelable;


# static fields
.field public static final AGGREGATE_ACTIVITY_SUMMARY:Lcom/google/android/gms/fitness/data/DataType;

.field public static final AGGREGATE_DISTANCE_DELTA:Lcom/google/android/gms/fitness/data/DataType;

.field public static final AGGREGATE_HEART_RATE_SUMMARY:Lcom/google/android/gms/fitness/data/DataType;

.field public static final AGGREGATE_INPUT_TYPES:Ljava/util/Set;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Set<",
            "Lcom/google/android/gms/fitness/data/DataType;",
            ">;"
        }
    .end annotation
.end field

.field public static final AGGREGATE_LOCATION_BOUNDING_BOX:Lcom/google/android/gms/fitness/data/DataType;

.field public static final AGGREGATE_POWER_SUMMARY:Lcom/google/android/gms/fitness/data/DataType;

.field public static final AGGREGATE_SPEED_SUMMARY:Lcom/google/android/gms/fitness/data/DataType;

.field public static final AGGREGATE_STEP_COUNT_DELTA:Lcom/google/android/gms/fitness/data/DataType;

.field public static final AGGREGATE_WEIGHT_SUMMARY:Lcom/google/android/gms/fitness/data/DataType;

.field public static final CREATOR:Landroid/os/Parcelable$Creator;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/os/Parcelable$Creator<",
            "Lcom/google/android/gms/fitness/data/DataType;",
            ">;"
        }
    .end annotation
.end field

.field public static final MIME_TYPE_PREFIX:Ljava/lang/String; = "vnd.google.fitness.data_type/"

.field public static final ST:Lcom/google/android/gms/fitness/data/DataType;

.field public static final SU:Lcom/google/android/gms/fitness/data/DataType;

.field private static final SV:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Lcom/google/android/gms/fitness/data/DataType;",
            "Ljava/util/List<",
            "Lcom/google/android/gms/fitness/data/DataType;",
            ">;>;"
        }
    .end annotation
.end field

.field public static final SW:[Lcom/google/android/gms/fitness/data/DataType;

.field public static final SX:[Ljava/lang/String;

.field public static final TYPE_ACTIVITY_SAMPLE:Lcom/google/android/gms/fitness/data/DataType;

.field public static final TYPE_ACTIVITY_SEGMENT:Lcom/google/android/gms/fitness/data/DataType;

.field public static final TYPE_CALORIES_CONSUMED:Lcom/google/android/gms/fitness/data/DataType;

.field public static final TYPE_CALORIES_EXPENDED:Lcom/google/android/gms/fitness/data/DataType;

.field public static final TYPE_CYCLING_PEDALING_CADENCE:Lcom/google/android/gms/fitness/data/DataType;

.field public static final TYPE_CYCLING_PEDALING_CUMULATIVE:Lcom/google/android/gms/fitness/data/DataType;

.field public static final TYPE_CYCLING_WHEEL_REVOLUTION:Lcom/google/android/gms/fitness/data/DataType;

.field public static final TYPE_CYCLING_WHEEL_RPM:Lcom/google/android/gms/fitness/data/DataType;

.field public static final TYPE_DISTANCE_CUMULATIVE:Lcom/google/android/gms/fitness/data/DataType;

.field public static final TYPE_DISTANCE_DELTA:Lcom/google/android/gms/fitness/data/DataType;

.field public static final TYPE_HEART_RATE_BPM:Lcom/google/android/gms/fitness/data/DataType;

.field public static final TYPE_HEIGHT:Lcom/google/android/gms/fitness/data/DataType;

.field public static final TYPE_LOCATION_SAMPLE:Lcom/google/android/gms/fitness/data/DataType;

.field public static final TYPE_POWER_SAMPLE:Lcom/google/android/gms/fitness/data/DataType;

.field public static final TYPE_SPEED:Lcom/google/android/gms/fitness/data/DataType;

.field public static final TYPE_STEP_COUNT_CADENCE:Lcom/google/android/gms/fitness/data/DataType;

.field public static final TYPE_STEP_COUNT_CUMULATIVE:Lcom/google/android/gms/fitness/data/DataType;

.field public static final TYPE_STEP_COUNT_DELTA:Lcom/google/android/gms/fitness/data/DataType;

.field public static final TYPE_WEIGHT:Lcom/google/android/gms/fitness/data/DataType;


# instance fields
.field private final BR:I

.field private final SY:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/google/android/gms/fitness/data/Field;",
            ">;"
        }
    .end annotation
.end field

.field private final mName:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .locals 60

    new-instance v11, Lcom/google/android/gms/fitness/data/DataType;

    move-object/from16 v31, v11

    const/4 v6, 0x1

    new-array v0, v6, [Lcom/google/android/gms/fitness/data/Field;

    sget-object v1, Lcom/google/android/gms/fitness/data/Field;->FIELD_STEPS:Lcom/google/android/gms/fitness/data/Field;

    const/16 v34, 0x0

    aput-object v1, v0, v34

    const-string v1, "com.google.step_count.delta"

    invoke-direct {v11, v1, v0}, Lcom/google/android/gms/fitness/data/DataType;-><init>(Ljava/lang/String;[Lcom/google/android/gms/fitness/data/Field;)V

    sput-object v11, Lcom/google/android/gms/fitness/data/DataType;->TYPE_STEP_COUNT_DELTA:Lcom/google/android/gms/fitness/data/DataType;

    new-instance v5, Lcom/google/android/gms/fitness/data/DataType;

    move-object/from16 v30, v5

    new-array v0, v6, [Lcom/google/android/gms/fitness/data/Field;

    sget-object v1, Lcom/google/android/gms/fitness/data/Field;->FIELD_STEPS:Lcom/google/android/gms/fitness/data/Field;

    aput-object v1, v0, v34

    const-string v1, "com.google.step_count.cumulative"

    invoke-direct {v5, v1, v0}, Lcom/google/android/gms/fitness/data/DataType;-><init>(Ljava/lang/String;[Lcom/google/android/gms/fitness/data/Field;)V

    sput-object v5, Lcom/google/android/gms/fitness/data/DataType;->TYPE_STEP_COUNT_CUMULATIVE:Lcom/google/android/gms/fitness/data/DataType;

    new-instance v4, Lcom/google/android/gms/fitness/data/DataType;

    move-object/from16 v29, v4

    new-array v0, v6, [Lcom/google/android/gms/fitness/data/Field;

    sget-object v1, Lcom/google/android/gms/fitness/data/Field;->FIELD_RPM:Lcom/google/android/gms/fitness/data/Field;

    aput-object v1, v0, v34

    const-string v1, "com.google.step_count.cadence"

    invoke-direct {v4, v1, v0}, Lcom/google/android/gms/fitness/data/DataType;-><init>(Ljava/lang/String;[Lcom/google/android/gms/fitness/data/Field;)V

    sput-object v4, Lcom/google/android/gms/fitness/data/DataType;->TYPE_STEP_COUNT_CADENCE:Lcom/google/android/gms/fitness/data/DataType;

    new-instance v3, Lcom/google/android/gms/fitness/data/DataType;

    move-object v10, v3

    new-array v0, v6, [Lcom/google/android/gms/fitness/data/Field;

    sget-object v1, Lcom/google/android/gms/fitness/data/Field;->FIELD_ACTIVITY:Lcom/google/android/gms/fitness/data/Field;

    aput-object v1, v0, v34

    const-string v1, "com.google.activity.segment"

    invoke-direct {v3, v1, v0}, Lcom/google/android/gms/fitness/data/DataType;-><init>(Ljava/lang/String;[Lcom/google/android/gms/fitness/data/Field;)V

    sput-object v3, Lcom/google/android/gms/fitness/data/DataType;->TYPE_ACTIVITY_SEGMENT:Lcom/google/android/gms/fitness/data/DataType;

    new-instance v2, Lcom/google/android/gms/fitness/data/DataType;

    move-object v12, v2

    new-array v0, v6, [Lcom/google/android/gms/fitness/data/Field;

    sget-object v1, Lcom/google/android/gms/fitness/data/Field;->FIELD_CALORIES:Lcom/google/android/gms/fitness/data/Field;

    aput-object v1, v0, v34

    const-string v1, "com.google.calories.consumed"

    invoke-direct {v2, v1, v0}, Lcom/google/android/gms/fitness/data/DataType;-><init>(Ljava/lang/String;[Lcom/google/android/gms/fitness/data/Field;)V

    sput-object v2, Lcom/google/android/gms/fitness/data/DataType;->TYPE_CALORIES_CONSUMED:Lcom/google/android/gms/fitness/data/DataType;

    new-instance v1, Lcom/google/android/gms/fitness/data/DataType;

    move-object v13, v1

    new-array v0, v6, [Lcom/google/android/gms/fitness/data/Field;

    sget-object v7, Lcom/google/android/gms/fitness/data/Field;->FIELD_CALORIES:Lcom/google/android/gms/fitness/data/Field;

    aput-object v7, v0, v34

    const-string v7, "com.google.calories.expended"

    invoke-direct {v1, v7, v0}, Lcom/google/android/gms/fitness/data/DataType;-><init>(Ljava/lang/String;[Lcom/google/android/gms/fitness/data/Field;)V

    sput-object v1, Lcom/google/android/gms/fitness/data/DataType;->TYPE_CALORIES_EXPENDED:Lcom/google/android/gms/fitness/data/DataType;

    new-instance v0, Lcom/google/android/gms/fitness/data/DataType;

    move-object/from16 v25, v0

    new-array v7, v6, [Lcom/google/android/gms/fitness/data/Field;

    sget-object v8, Lcom/google/android/gms/fitness/data/Field;->FIELD_WATTS:Lcom/google/android/gms/fitness/data/Field;

    aput-object v8, v7, v34

    const-string v8, "com.google.power.sample"

    invoke-direct {v0, v8, v7}, Lcom/google/android/gms/fitness/data/DataType;-><init>(Ljava/lang/String;[Lcom/google/android/gms/fitness/data/Field;)V

    sput-object v0, Lcom/google/android/gms/fitness/data/DataType;->TYPE_POWER_SAMPLE:Lcom/google/android/gms/fitness/data/DataType;

    new-instance v14, Lcom/google/android/gms/fitness/data/DataType;

    move-object v9, v14

    const/4 v15, 0x2

    new-array v7, v15, [Lcom/google/android/gms/fitness/data/Field;

    sget-object v8, Lcom/google/android/gms/fitness/data/Field;->FIELD_ACTIVITY:Lcom/google/android/gms/fitness/data/Field;

    aput-object v8, v7, v34

    sget-object v8, Lcom/google/android/gms/fitness/data/Field;->FIELD_CONFIDENCE:Lcom/google/android/gms/fitness/data/Field;

    aput-object v8, v7, v6

    const-string v8, "com.google.activity.sample"

    invoke-direct {v14, v8, v7}, Lcom/google/android/gms/fitness/data/DataType;-><init>(Ljava/lang/String;[Lcom/google/android/gms/fitness/data/Field;)V

    sput-object v14, Lcom/google/android/gms/fitness/data/DataType;->TYPE_ACTIVITY_SAMPLE:Lcom/google/android/gms/fitness/data/DataType;

    new-instance v7, Lcom/google/android/gms/fitness/data/DataType;

    move-object v8, v7

    new-array v6, v15, [Lcom/google/android/gms/fitness/data/Field;

    sget-object v16, Lcom/google/android/gms/fitness/data/Field;->FIELD_ACTIVITY:Lcom/google/android/gms/fitness/data/Field;

    aput-object v16, v6, v34

    sget-object v16, Lcom/google/android/gms/fitness/data/Field;->Td:Lcom/google/android/gms/fitness/data/Field;

    const/4 v15, 0x1

    aput-object v16, v6, v15

    const-string v15, "com.google.activity.edge"

    invoke-direct {v7, v15, v6}, Lcom/google/android/gms/fitness/data/DataType;-><init>(Ljava/lang/String;[Lcom/google/android/gms/fitness/data/Field;)V

    sput-object v7, Lcom/google/android/gms/fitness/data/DataType;->ST:Lcom/google/android/gms/fitness/data/DataType;

    new-instance v6, Lcom/google/android/gms/fitness/data/DataType;

    move-object/from16 v35, v7

    move-object v7, v6

    const/4 v15, 0x3

    move-object/from16 v23, v0

    new-array v0, v15, [Lcom/google/android/gms/fitness/data/Field;

    sget-object v16, Lcom/google/android/gms/fitness/data/Field;->Te:Lcom/google/android/gms/fitness/data/Field;

    aput-object v16, v0, v34

    sget-object v16, Lcom/google/android/gms/fitness/data/Field;->Tf:Lcom/google/android/gms/fitness/data/Field;

    const/4 v15, 0x1

    aput-object v16, v0, v15

    sget-object v16, Lcom/google/android/gms/fitness/data/Field;->Tg:Lcom/google/android/gms/fitness/data/Field;

    const/16 v17, 0x2

    aput-object v16, v0, v17

    const-string v15, "com.google.accelerometer"

    invoke-direct {v6, v15, v0}, Lcom/google/android/gms/fitness/data/DataType;-><init>(Ljava/lang/String;[Lcom/google/android/gms/fitness/data/Field;)V

    sput-object v6, Lcom/google/android/gms/fitness/data/DataType;->SU:Lcom/google/android/gms/fitness/data/DataType;

    new-instance v0, Lcom/google/android/gms/fitness/data/DataType;

    move-object/from16 v20, v0

    move-object/from16 v28, v1

    const/4 v15, 0x1

    new-array v1, v15, [Lcom/google/android/gms/fitness/data/Field;

    sget-object v15, Lcom/google/android/gms/fitness/data/Field;->FIELD_BPM:Lcom/google/android/gms/fitness/data/Field;

    aput-object v15, v1, v34

    const-string v15, "com.google.heart_rate.bpm"

    invoke-direct {v0, v15, v1}, Lcom/google/android/gms/fitness/data/DataType;-><init>(Ljava/lang/String;[Lcom/google/android/gms/fitness/data/Field;)V

    sput-object v0, Lcom/google/android/gms/fitness/data/DataType;->TYPE_HEART_RATE_BPM:Lcom/google/android/gms/fitness/data/DataType;

    new-instance v1, Lcom/google/android/gms/fitness/data/DataType;

    move-object/from16 v24, v1

    const/4 v15, 0x4

    move-object/from16 v33, v0

    new-array v0, v15, [Lcom/google/android/gms/fitness/data/Field;

    sget-object v16, Lcom/google/android/gms/fitness/data/Field;->FIELD_LATITUDE:Lcom/google/android/gms/fitness/data/Field;

    aput-object v16, v0, v34

    sget-object v16, Lcom/google/android/gms/fitness/data/Field;->FIELD_LONGITUDE:Lcom/google/android/gms/fitness/data/Field;

    move-object/from16 v36, v6

    const/4 v6, 0x1

    aput-object v16, v0, v6

    sget-object v16, Lcom/google/android/gms/fitness/data/Field;->FIELD_ACCURACY:Lcom/google/android/gms/fitness/data/Field;

    const/16 v21, 0x2

    aput-object v16, v0, v21

    sget-object v16, Lcom/google/android/gms/fitness/data/Field;->FIELD_ALTITUDE:Lcom/google/android/gms/fitness/data/Field;

    const/16 v22, 0x3

    aput-object v16, v0, v22

    const-string v15, "com.google.location.sample"

    invoke-direct {v1, v15, v0}, Lcom/google/android/gms/fitness/data/DataType;-><init>(Ljava/lang/String;[Lcom/google/android/gms/fitness/data/Field;)V

    sput-object v1, Lcom/google/android/gms/fitness/data/DataType;->TYPE_LOCATION_SAMPLE:Lcom/google/android/gms/fitness/data/DataType;

    new-instance v0, Lcom/google/android/gms/fitness/data/DataType;

    move-object/from16 v19, v0

    new-array v15, v6, [Lcom/google/android/gms/fitness/data/Field;

    sget-object v16, Lcom/google/android/gms/fitness/data/Field;->FIELD_DISTANCE:Lcom/google/android/gms/fitness/data/Field;

    aput-object v16, v15, v34

    const-string v6, "com.google.distance.delta"

    invoke-direct {v0, v6, v15}, Lcom/google/android/gms/fitness/data/DataType;-><init>(Ljava/lang/String;[Lcom/google/android/gms/fitness/data/Field;)V

    sput-object v0, Lcom/google/android/gms/fitness/data/DataType;->TYPE_DISTANCE_DELTA:Lcom/google/android/gms/fitness/data/DataType;

    new-instance v6, Lcom/google/android/gms/fitness/data/DataType;

    move-object/from16 v18, v6

    const/4 v15, 0x1

    move-object/from16 v37, v0

    new-array v0, v15, [Lcom/google/android/gms/fitness/data/Field;

    sget-object v16, Lcom/google/android/gms/fitness/data/Field;->FIELD_DISTANCE:Lcom/google/android/gms/fitness/data/Field;

    aput-object v16, v0, v34

    const-string v15, "com.google.distance.cumulative"

    invoke-direct {v6, v15, v0}, Lcom/google/android/gms/fitness/data/DataType;-><init>(Ljava/lang/String;[Lcom/google/android/gms/fitness/data/Field;)V

    sput-object v6, Lcom/google/android/gms/fitness/data/DataType;->TYPE_DISTANCE_CUMULATIVE:Lcom/google/android/gms/fitness/data/DataType;

    new-instance v0, Lcom/google/android/gms/fitness/data/DataType;

    move-object/from16 v27, v0

    move-object/from16 v38, v1

    const/4 v15, 0x1

    new-array v1, v15, [Lcom/google/android/gms/fitness/data/Field;

    sget-object v16, Lcom/google/android/gms/fitness/data/Field;->FIELD_SPEED:Lcom/google/android/gms/fitness/data/Field;

    aput-object v16, v1, v34

    const-string v15, "com.google.speed"

    invoke-direct {v0, v15, v1}, Lcom/google/android/gms/fitness/data/DataType;-><init>(Ljava/lang/String;[Lcom/google/android/gms/fitness/data/Field;)V

    sput-object v0, Lcom/google/android/gms/fitness/data/DataType;->TYPE_SPEED:Lcom/google/android/gms/fitness/data/DataType;

    new-instance v1, Lcom/google/android/gms/fitness/data/DataType;

    move-object/from16 v16, v1

    const/4 v15, 0x1

    move-object/from16 v39, v0

    new-array v0, v15, [Lcom/google/android/gms/fitness/data/Field;

    sget-object v17, Lcom/google/android/gms/fitness/data/Field;->FIELD_REVOLUTIONS:Lcom/google/android/gms/fitness/data/Field;

    aput-object v17, v0, v34

    const-string v15, "com.google.cycling.wheel_revolution.cumulative"

    invoke-direct {v1, v15, v0}, Lcom/google/android/gms/fitness/data/DataType;-><init>(Ljava/lang/String;[Lcom/google/android/gms/fitness/data/Field;)V

    sput-object v1, Lcom/google/android/gms/fitness/data/DataType;->TYPE_CYCLING_WHEEL_REVOLUTION:Lcom/google/android/gms/fitness/data/DataType;

    new-instance v0, Lcom/google/android/gms/fitness/data/DataType;

    move-object/from16 v17, v0

    move-object/from16 v40, v1

    const/4 v15, 0x1

    new-array v1, v15, [Lcom/google/android/gms/fitness/data/Field;

    sget-object v32, Lcom/google/android/gms/fitness/data/Field;->FIELD_RPM:Lcom/google/android/gms/fitness/data/Field;

    aput-object v32, v1, v34

    const-string v15, "com.google.cycling.wheel_revolution.rpm"

    invoke-direct {v0, v15, v1}, Lcom/google/android/gms/fitness/data/DataType;-><init>(Ljava/lang/String;[Lcom/google/android/gms/fitness/data/Field;)V

    sput-object v0, Lcom/google/android/gms/fitness/data/DataType;->TYPE_CYCLING_WHEEL_RPM:Lcom/google/android/gms/fitness/data/DataType;

    new-instance v1, Lcom/google/android/gms/fitness/data/DataType;

    move-object/from16 v41, v6

    move-object/from16 v43, v7

    move/from16 v42, v21

    move/from16 v7, v22

    const/4 v6, 0x1

    move-object v15, v1

    new-array v7, v6, [Lcom/google/android/gms/fitness/data/Field;

    sget-object v21, Lcom/google/android/gms/fitness/data/Field;->FIELD_REVOLUTIONS:Lcom/google/android/gms/fitness/data/Field;

    aput-object v21, v7, v34

    const-string v6, "com.google.cycling.pedaling.cumulative"

    invoke-direct {v1, v6, v7}, Lcom/google/android/gms/fitness/data/DataType;-><init>(Ljava/lang/String;[Lcom/google/android/gms/fitness/data/Field;)V

    sput-object v1, Lcom/google/android/gms/fitness/data/DataType;->TYPE_CYCLING_PEDALING_CUMULATIVE:Lcom/google/android/gms/fitness/data/DataType;

    new-instance v7, Lcom/google/android/gms/fitness/data/DataType;

    move-object/from16 v45, v14

    move-object v14, v7

    const/4 v6, 0x1

    move-object/from16 v21, v0

    new-array v0, v6, [Lcom/google/android/gms/fitness/data/Field;

    sget-object v22, Lcom/google/android/gms/fitness/data/Field;->FIELD_RPM:Lcom/google/android/gms/fitness/data/Field;

    aput-object v22, v0, v34

    const-string v6, "com.google.cycling.pedaling.cadence"

    invoke-direct {v7, v6, v0}, Lcom/google/android/gms/fitness/data/DataType;-><init>(Ljava/lang/String;[Lcom/google/android/gms/fitness/data/Field;)V

    sput-object v7, Lcom/google/android/gms/fitness/data/DataType;->TYPE_CYCLING_PEDALING_CADENCE:Lcom/google/android/gms/fitness/data/DataType;

    new-instance v6, Lcom/google/android/gms/fitness/data/DataType;

    move-object/from16 v22, v6

    move-object/from16 v26, v1

    const/4 v0, 0x1

    new-array v1, v0, [Lcom/google/android/gms/fitness/data/Field;

    sget-object v32, Lcom/google/android/gms/fitness/data/Field;->FIELD_HEIGHT:Lcom/google/android/gms/fitness/data/Field;

    aput-object v32, v1, v34

    const-string v0, "com.google.height"

    invoke-direct {v6, v0, v1}, Lcom/google/android/gms/fitness/data/DataType;-><init>(Ljava/lang/String;[Lcom/google/android/gms/fitness/data/Field;)V

    sput-object v6, Lcom/google/android/gms/fitness/data/DataType;->TYPE_HEIGHT:Lcom/google/android/gms/fitness/data/DataType;

    new-instance v1, Lcom/google/android/gms/fitness/data/DataType;

    move-object/from16 v32, v1

    move-object/from16 v46, v2

    const/4 v0, 0x1

    new-array v2, v0, [Lcom/google/android/gms/fitness/data/Field;

    sget-object v47, Lcom/google/android/gms/fitness/data/Field;->FIELD_WEIGHT:Lcom/google/android/gms/fitness/data/Field;

    aput-object v47, v2, v34

    const-string v0, "com.google.weight"

    invoke-direct {v1, v0, v2}, Lcom/google/android/gms/fitness/data/DataType;-><init>(Ljava/lang/String;[Lcom/google/android/gms/fitness/data/Field;)V

    sput-object v1, Lcom/google/android/gms/fitness/data/DataType;->TYPE_WEIGHT:Lcom/google/android/gms/fitness/data/DataType;

    new-instance v2, Ljava/util/HashSet;

    move-object/from16 v49, v21

    move-object/from16 v47, v37

    move-object/from16 v48, v39

    const/16 v21, 0x1

    move-object/from16 v37, v23

    move-object/from16 v39, v33

    move-object v0, v11

    move-object/from16 v52, v1

    move-object/from16 v51, v26

    move-object/from16 v50, v40

    move-object/from16 v40, v38

    move-object/from16 v38, v28

    move-object/from16 v1, v47

    move-object/from16 v53, v7

    move-object v7, v2

    move-object v2, v3

    move-object/from16 v54, v3

    move-object/from16 v3, v48

    move-object/from16 v55, v4

    move-object/from16 v4, v39

    move-object/from16 v56, v5

    move-object/from16 v5, v52

    move-object/from16 v57, v6

    move/from16 v58, v21

    move-object/from16 v6, v40

    filled-new-array/range {v0 .. v6}, [Lcom/google/android/gms/fitness/data/DataType;

    move-result-object v0

    invoke-static {v0}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v0

    invoke-direct {v7, v0}, Ljava/util/HashSet;-><init>(Ljava/util/Collection;)V

    invoke-static {v7}, Ljava/util/Collections;->unmodifiableSet(Ljava/util/Set;)Ljava/util/Set;

    move-result-object v0

    sput-object v0, Lcom/google/android/gms/fitness/data/DataType;->AGGREGATE_INPUT_TYPES:Ljava/util/Set;

    new-instance v0, Lcom/google/android/gms/fitness/data/DataType;

    move-object v1, v11

    move-object v11, v0

    const/4 v2, 0x3

    new-array v3, v2, [Lcom/google/android/gms/fitness/data/Field;

    sget-object v2, Lcom/google/android/gms/fitness/data/Field;->FIELD_ACTIVITY:Lcom/google/android/gms/fitness/data/Field;

    aput-object v2, v3, v34

    sget-object v2, Lcom/google/android/gms/fitness/data/Field;->FIELD_DURATION:Lcom/google/android/gms/fitness/data/Field;

    aput-object v2, v3, v58

    sget-object v2, Lcom/google/android/gms/fitness/data/Field;->FIELD_NUM_SEGMENTS:Lcom/google/android/gms/fitness/data/Field;

    aput-object v2, v3, v42

    const-string v2, "com.google.activity.summary"

    invoke-direct {v0, v2, v3}, Lcom/google/android/gms/fitness/data/DataType;-><init>(Ljava/lang/String;[Lcom/google/android/gms/fitness/data/Field;)V

    sput-object v0, Lcom/google/android/gms/fitness/data/DataType;->AGGREGATE_ACTIVITY_SUMMARY:Lcom/google/android/gms/fitness/data/DataType;

    sput-object v1, Lcom/google/android/gms/fitness/data/DataType;->AGGREGATE_STEP_COUNT_DELTA:Lcom/google/android/gms/fitness/data/DataType;

    sput-object v47, Lcom/google/android/gms/fitness/data/DataType;->AGGREGATE_DISTANCE_DELTA:Lcom/google/android/gms/fitness/data/DataType;

    new-instance v2, Lcom/google/android/gms/fitness/data/DataType;

    move-object/from16 v21, v2

    const/4 v3, 0x3

    new-array v4, v3, [Lcom/google/android/gms/fitness/data/Field;

    sget-object v3, Lcom/google/android/gms/fitness/data/Field;->FIELD_AVERAGE:Lcom/google/android/gms/fitness/data/Field;

    aput-object v3, v4, v34

    sget-object v3, Lcom/google/android/gms/fitness/data/Field;->FIELD_MAX:Lcom/google/android/gms/fitness/data/Field;

    aput-object v3, v4, v58

    sget-object v3, Lcom/google/android/gms/fitness/data/Field;->FIELD_MIN:Lcom/google/android/gms/fitness/data/Field;

    aput-object v3, v4, v42

    const-string v3, "com.google.heart_rate.summary"

    invoke-direct {v2, v3, v4}, Lcom/google/android/gms/fitness/data/DataType;-><init>(Ljava/lang/String;[Lcom/google/android/gms/fitness/data/Field;)V

    sput-object v2, Lcom/google/android/gms/fitness/data/DataType;->AGGREGATE_HEART_RATE_SUMMARY:Lcom/google/android/gms/fitness/data/DataType;

    new-instance v3, Lcom/google/android/gms/fitness/data/DataType;

    move-object/from16 v23, v3

    const/4 v4, 0x4

    new-array v5, v4, [Lcom/google/android/gms/fitness/data/Field;

    sget-object v6, Lcom/google/android/gms/fitness/data/Field;->FIELD_LOW_LATITUDE:Lcom/google/android/gms/fitness/data/Field;

    aput-object v6, v5, v34

    sget-object v6, Lcom/google/android/gms/fitness/data/Field;->FIELD_LOW_LONGITUDE:Lcom/google/android/gms/fitness/data/Field;

    aput-object v6, v5, v58

    sget-object v6, Lcom/google/android/gms/fitness/data/Field;->FIELD_HIGH_LATITUDE:Lcom/google/android/gms/fitness/data/Field;

    aput-object v6, v5, v42

    sget-object v6, Lcom/google/android/gms/fitness/data/Field;->FIELD_HIGH_LONGITUDE:Lcom/google/android/gms/fitness/data/Field;

    const/4 v7, 0x3

    aput-object v6, v5, v7

    const-string v6, "com.google.location.bounding_box"

    invoke-direct {v3, v6, v5}, Lcom/google/android/gms/fitness/data/DataType;-><init>(Ljava/lang/String;[Lcom/google/android/gms/fitness/data/Field;)V

    sput-object v3, Lcom/google/android/gms/fitness/data/DataType;->AGGREGATE_LOCATION_BOUNDING_BOX:Lcom/google/android/gms/fitness/data/DataType;

    new-instance v5, Lcom/google/android/gms/fitness/data/DataType;

    move-object/from16 v26, v5

    new-array v6, v7, [Lcom/google/android/gms/fitness/data/Field;

    sget-object v7, Lcom/google/android/gms/fitness/data/Field;->FIELD_AVERAGE:Lcom/google/android/gms/fitness/data/Field;

    aput-object v7, v6, v34

    sget-object v7, Lcom/google/android/gms/fitness/data/Field;->FIELD_MAX:Lcom/google/android/gms/fitness/data/Field;

    aput-object v7, v6, v58

    sget-object v7, Lcom/google/android/gms/fitness/data/Field;->FIELD_MIN:Lcom/google/android/gms/fitness/data/Field;

    aput-object v7, v6, v42

    const-string v7, "com.google.power.summary"

    invoke-direct {v5, v7, v6}, Lcom/google/android/gms/fitness/data/DataType;-><init>(Ljava/lang/String;[Lcom/google/android/gms/fitness/data/Field;)V

    sput-object v5, Lcom/google/android/gms/fitness/data/DataType;->AGGREGATE_POWER_SUMMARY:Lcom/google/android/gms/fitness/data/DataType;

    new-instance v6, Lcom/google/android/gms/fitness/data/DataType;

    move-object/from16 v28, v6

    const/4 v7, 0x3

    new-array v4, v7, [Lcom/google/android/gms/fitness/data/Field;

    sget-object v7, Lcom/google/android/gms/fitness/data/Field;->FIELD_AVERAGE:Lcom/google/android/gms/fitness/data/Field;

    aput-object v7, v4, v34

    sget-object v7, Lcom/google/android/gms/fitness/data/Field;->FIELD_MAX:Lcom/google/android/gms/fitness/data/Field;

    aput-object v7, v4, v58

    sget-object v7, Lcom/google/android/gms/fitness/data/Field;->FIELD_MIN:Lcom/google/android/gms/fitness/data/Field;

    aput-object v7, v4, v42

    const-string v7, "com.google.speed.summary"

    invoke-direct {v6, v7, v4}, Lcom/google/android/gms/fitness/data/DataType;-><init>(Ljava/lang/String;[Lcom/google/android/gms/fitness/data/Field;)V

    sput-object v6, Lcom/google/android/gms/fitness/data/DataType;->AGGREGATE_SPEED_SUMMARY:Lcom/google/android/gms/fitness/data/DataType;

    new-instance v4, Lcom/google/android/gms/fitness/data/DataType;

    move-object/from16 v33, v4

    move-object/from16 v44, v1

    const/4 v7, 0x3

    new-array v1, v7, [Lcom/google/android/gms/fitness/data/Field;

    sget-object v59, Lcom/google/android/gms/fitness/data/Field;->FIELD_AVERAGE:Lcom/google/android/gms/fitness/data/Field;

    aput-object v59, v1, v34

    sget-object v59, Lcom/google/android/gms/fitness/data/Field;->FIELD_MAX:Lcom/google/android/gms/fitness/data/Field;

    aput-object v59, v1, v58

    sget-object v59, Lcom/google/android/gms/fitness/data/Field;->FIELD_MIN:Lcom/google/android/gms/fitness/data/Field;

    aput-object v59, v1, v42

    const-string v7, "com.google.weight.summary"

    invoke-direct {v4, v7, v1}, Lcom/google/android/gms/fitness/data/DataType;-><init>(Ljava/lang/String;[Lcom/google/android/gms/fitness/data/Field;)V

    sput-object v4, Lcom/google/android/gms/fitness/data/DataType;->AGGREGATE_WEIGHT_SUMMARY:Lcom/google/android/gms/fitness/data/DataType;

    new-instance v1, Lcom/google/android/gms/fitness/data/DataType$1;

    invoke-direct {v1}, Lcom/google/android/gms/fitness/data/DataType$1;-><init>()V

    sput-object v1, Lcom/google/android/gms/fitness/data/DataType;->SV:Ljava/util/Map;

    move-object/from16 v7, v43

    move-object/from16 v1, v53

    const/16 v43, 0x3

    filled-new-array/range {v7 .. v33}, [Lcom/google/android/gms/fitness/data/DataType;

    move-result-object v7

    sput-object v7, Lcom/google/android/gms/fitness/data/DataType;->SW:[Lcom/google/android/gms/fitness/data/DataType;

    const/16 v7, 0x1b

    new-array v7, v7, [Ljava/lang/String;

    invoke-virtual/range {v36 .. v36}, Lcom/google/android/gms/fitness/data/DataType;->getName()Ljava/lang/String;

    move-result-object v8

    aput-object v8, v7, v34

    invoke-virtual/range {v35 .. v35}, Lcom/google/android/gms/fitness/data/DataType;->getName()Ljava/lang/String;

    move-result-object v8

    aput-object v8, v7, v58

    invoke-virtual/range {v45 .. v45}, Lcom/google/android/gms/fitness/data/DataType;->getName()Ljava/lang/String;

    move-result-object v8

    aput-object v8, v7, v42

    invoke-virtual/range {v54 .. v54}, Lcom/google/android/gms/fitness/data/DataType;->getName()Ljava/lang/String;

    move-result-object v8

    aput-object v8, v7, v43

    invoke-virtual {v0}, Lcom/google/android/gms/fitness/data/DataType;->getName()Ljava/lang/String;

    move-result-object v0

    const/4 v8, 0x4

    aput-object v0, v7, v8

    const/4 v0, 0x5

    invoke-virtual/range {v46 .. v46}, Lcom/google/android/gms/fitness/data/DataType;->getName()Ljava/lang/String;

    move-result-object v8

    aput-object v8, v7, v0

    const/4 v0, 0x6

    invoke-virtual/range {v38 .. v38}, Lcom/google/android/gms/fitness/data/DataType;->getName()Ljava/lang/String;

    move-result-object v8

    aput-object v8, v7, v0

    const/4 v0, 0x7

    invoke-virtual {v1}, Lcom/google/android/gms/fitness/data/DataType;->getName()Ljava/lang/String;

    move-result-object v1

    aput-object v1, v7, v0

    const/16 v0, 0x8

    invoke-virtual/range {v51 .. v51}, Lcom/google/android/gms/fitness/data/DataType;->getName()Ljava/lang/String;

    move-result-object v1

    aput-object v1, v7, v0

    const/16 v0, 0x9

    invoke-virtual/range {v50 .. v50}, Lcom/google/android/gms/fitness/data/DataType;->getName()Ljava/lang/String;

    move-result-object v1

    aput-object v1, v7, v0

    const/16 v0, 0xa

    invoke-virtual/range {v49 .. v49}, Lcom/google/android/gms/fitness/data/DataType;->getName()Ljava/lang/String;

    move-result-object v1

    aput-object v1, v7, v0

    const/16 v0, 0xb

    invoke-virtual/range {v41 .. v41}, Lcom/google/android/gms/fitness/data/DataType;->getName()Ljava/lang/String;

    move-result-object v1

    aput-object v1, v7, v0

    const/16 v0, 0xc

    invoke-virtual/range {v47 .. v47}, Lcom/google/android/gms/fitness/data/DataType;->getName()Ljava/lang/String;

    move-result-object v1

    aput-object v1, v7, v0

    const/16 v0, 0xd

    invoke-virtual/range {v39 .. v39}, Lcom/google/android/gms/fitness/data/DataType;->getName()Ljava/lang/String;

    move-result-object v1

    aput-object v1, v7, v0

    const/16 v0, 0xe

    invoke-virtual {v2}, Lcom/google/android/gms/fitness/data/DataType;->getName()Ljava/lang/String;

    move-result-object v1

    aput-object v1, v7, v0

    const/16 v0, 0xf

    invoke-virtual/range {v57 .. v57}, Lcom/google/android/gms/fitness/data/DataType;->getName()Ljava/lang/String;

    move-result-object v1

    aput-object v1, v7, v0

    const/16 v0, 0x10

    invoke-virtual {v3}, Lcom/google/android/gms/fitness/data/DataType;->getName()Ljava/lang/String;

    move-result-object v1

    aput-object v1, v7, v0

    const/16 v0, 0x11

    invoke-virtual/range {v40 .. v40}, Lcom/google/android/gms/fitness/data/DataType;->getName()Ljava/lang/String;

    move-result-object v1

    aput-object v1, v7, v0

    const/16 v0, 0x12

    invoke-virtual/range {v37 .. v37}, Lcom/google/android/gms/fitness/data/DataType;->getName()Ljava/lang/String;

    move-result-object v1

    aput-object v1, v7, v0

    const/16 v0, 0x13

    invoke-virtual {v5}, Lcom/google/android/gms/fitness/data/DataType;->getName()Ljava/lang/String;

    move-result-object v1

    aput-object v1, v7, v0

    const/16 v0, 0x14

    invoke-virtual/range {v48 .. v48}, Lcom/google/android/gms/fitness/data/DataType;->getName()Ljava/lang/String;

    move-result-object v1

    aput-object v1, v7, v0

    const/16 v0, 0x15

    invoke-virtual {v6}, Lcom/google/android/gms/fitness/data/DataType;->getName()Ljava/lang/String;

    move-result-object v1

    aput-object v1, v7, v0

    const/16 v0, 0x16

    invoke-virtual/range {v55 .. v55}, Lcom/google/android/gms/fitness/data/DataType;->getName()Ljava/lang/String;

    move-result-object v1

    aput-object v1, v7, v0

    const/16 v0, 0x17

    invoke-virtual/range {v56 .. v56}, Lcom/google/android/gms/fitness/data/DataType;->getName()Ljava/lang/String;

    move-result-object v1

    aput-object v1, v7, v0

    const/16 v0, 0x18

    invoke-virtual/range {v44 .. v44}, Lcom/google/android/gms/fitness/data/DataType;->getName()Ljava/lang/String;

    move-result-object v1

    aput-object v1, v7, v0

    const/16 v0, 0x19

    invoke-virtual/range {v52 .. v52}, Lcom/google/android/gms/fitness/data/DataType;->getName()Ljava/lang/String;

    move-result-object v1

    aput-object v1, v7, v0

    const/16 v0, 0x1a

    invoke-virtual {v4}, Lcom/google/android/gms/fitness/data/DataType;->getName()Ljava/lang/String;

    move-result-object v1

    aput-object v1, v7, v0

    sput-object v7, Lcom/google/android/gms/fitness/data/DataType;->SX:[Ljava/lang/String;

    new-instance v0, Lcom/google/android/gms/fitness/data/h;

    invoke-direct {v0}, Lcom/google/android/gms/fitness/data/h;-><init>()V

    sput-object v0, Lcom/google/android/gms/fitness/data/DataType;->CREATOR:Landroid/os/Parcelable$Creator;

    return-void
.end method

.method constructor <init>(ILjava/lang/String;Ljava/util/List;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I",
            "Ljava/lang/String;",
            "Ljava/util/List<",
            "Lcom/google/android/gms/fitness/data/Field;",
            ">;)V"
        }
    .end annotation

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput p1, p0, Lcom/google/android/gms/fitness/data/DataType;->BR:I

    iput-object p2, p0, Lcom/google/android/gms/fitness/data/DataType;->mName:Ljava/lang/String;

    invoke-static {p3}, Ljava/util/Collections;->unmodifiableList(Ljava/util/List;)Ljava/util/List;

    move-result-object p1

    iput-object p1, p0, Lcom/google/android/gms/fitness/data/DataType;->SY:Ljava/util/List;

    return-void
.end method

.method public varargs constructor <init>(Ljava/lang/String;[Lcom/google/android/gms/fitness/data/Field;)V
    .locals 1

    const/4 v0, 0x1

    invoke-static {p2}, Lcom/google/android/gms/internal/jr;->b([Ljava/lang/Object;)Ljava/util/ArrayList;

    move-result-object p2

    invoke-direct {p0, v0, p1, p2}, Lcom/google/android/gms/fitness/data/DataType;-><init>(ILjava/lang/String;Ljava/util/List;)V

    return-void
.end method

.method private a(Lcom/google/android/gms/fitness/data/DataType;)Z
    .locals 2

    iget-object v0, p0, Lcom/google/android/gms/fitness/data/DataType;->mName:Ljava/lang/String;

    iget-object v1, p1, Lcom/google/android/gms/fitness/data/DataType;->mName:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object p0, p0, Lcom/google/android/gms/fitness/data/DataType;->SY:Ljava/util/List;

    iget-object p1, p1, Lcom/google/android/gms/fitness/data/DataType;->SY:Ljava/util/List;

    invoke-interface {p0, p1}, Ljava/util/List;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-eqz p0, :cond_0

    const/4 p0, 0x1

    goto :goto_0

    :cond_0
    const/4 p0, 0x0

    :goto_0
    return p0
.end method

.method public static getAggregatesForInput(Lcom/google/android/gms/fitness/data/DataType;)Ljava/util/List;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/google/android/gms/fitness/data/DataType;",
            ")",
            "Ljava/util/List<",
            "Lcom/google/android/gms/fitness/data/DataType;",
            ">;"
        }
    .end annotation

    sget-object v0, Lcom/google/android/gms/fitness/data/DataType;->SV:Ljava/util/Map;

    invoke-interface {v0, p0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Ljava/util/List;

    if-nez p0, :cond_0

    invoke-static {}, Ljava/util/Collections;->emptyList()Ljava/util/List;

    move-result-object p0

    return-object p0

    :cond_0
    invoke-static {p0}, Ljava/util/Collections;->unmodifiableList(Ljava/util/List;)Ljava/util/List;

    move-result-object p0

    return-object p0
.end method

.method public static getMimeType(Lcom/google/android/gms/fitness/data/DataType;)Ljava/lang/String;
    .locals 2

    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "vnd.google.fitness.data_type/"

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p0}, Lcom/google/android/gms/fitness/data/DataType;->getName()Ljava/lang/String;

    move-result-object p0

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    return-object p0
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

    instance-of v0, p1, Lcom/google/android/gms/fitness/data/DataType;

    if-eqz v0, :cond_0

    check-cast p1, Lcom/google/android/gms/fitness/data/DataType;

    invoke-direct {p0, p1}, Lcom/google/android/gms/fitness/data/DataType;->a(Lcom/google/android/gms/fitness/data/DataType;)Z

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

.method public getFields()Ljava/util/List;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Lcom/google/android/gms/fitness/data/Field;",
            ">;"
        }
    .end annotation

    iget-object p0, p0, Lcom/google/android/gms/fitness/data/DataType;->SY:Ljava/util/List;

    return-object p0
.end method

.method public getName()Ljava/lang/String;
    .locals 0

    iget-object p0, p0, Lcom/google/android/gms/fitness/data/DataType;->mName:Ljava/lang/String;

    return-object p0
.end method

.method getVersionCode()I
    .locals 0

    iget p0, p0, Lcom/google/android/gms/fitness/data/DataType;->BR:I

    return p0
.end method

.method public hashCode()I
    .locals 0

    iget-object p0, p0, Lcom/google/android/gms/fitness/data/DataType;->mName:Ljava/lang/String;

    invoke-virtual {p0}, Ljava/lang/String;->hashCode()I

    move-result p0

    return p0
.end method

.method public iQ()Ljava/lang/String;
    .locals 2

    iget-object v0, p0, Lcom/google/android/gms/fitness/data/DataType;->mName:Ljava/lang/String;

    const-string v1, "com.google."

    invoke-virtual {v0, v1}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v0

    iget-object p0, p0, Lcom/google/android/gms/fitness/data/DataType;->mName:Ljava/lang/String;

    if-eqz v0, :cond_0

    const/16 v0, 0xb

    invoke-virtual {p0, v0}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object p0

    :cond_0
    return-object p0
.end method

.method public indexOf(Lcom/google/android/gms/fitness/data/Field;)I
    .locals 2

    iget-object v0, p0, Lcom/google/android/gms/fitness/data/DataType;->SY:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object p0, p0, Lcom/google/android/gms/fitness/data/DataType;->SY:Ljava/util/List;

    invoke-interface {p0, p1}, Ljava/util/List;->indexOf(Ljava/lang/Object;)I

    move-result p0

    return p0

    :cond_0
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "%s not a field of %s"

    filled-new-array {p1, p0}, [Ljava/lang/Object;

    move-result-object p0

    invoke-static {v1, p0}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p0

    invoke-direct {v0, p0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public toString()Ljava/lang/String;
    .locals 1

    iget-object v0, p0, Lcom/google/android/gms/fitness/data/DataType;->mName:Ljava/lang/String;

    iget-object p0, p0, Lcom/google/android/gms/fitness/data/DataType;->SY:Ljava/util/List;

    filled-new-array {v0, p0}, [Ljava/lang/Object;

    move-result-object p0

    const-string v0, "DataType{%s%s}"

    invoke-static {v0, p0}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method public writeToParcel(Landroid/os/Parcel;I)V
    .locals 0

    invoke-static {p0, p1, p2}, Lcom/google/android/gms/fitness/data/h;->a(Lcom/google/android/gms/fitness/data/DataType;Landroid/os/Parcel;I)V

    return-void
.end method
