.class public final Lcom/google/android/gms/internal/fz;
.super Ljava/lang/Object;


# annotations
.annotation runtime Lcom/google/android/gms/internal/ez;
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/google/android/gms/internal/fz$a;
    }
.end annotation


# instance fields
.field public final errorCode:I

.field public final orientation:I

.field public final qA:Ljava/lang/String;

.field public final qB:Lcom/google/android/gms/internal/co;

.field public final qf:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field public final qg:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field public final qj:J

.field public final qy:Lcom/google/android/gms/internal/cl;

.field public final qz:Lcom/google/android/gms/internal/cu;

.field public final rN:Lcom/google/android/gms/internal/gv;

.field public final tA:Ljava/lang/String;

.field public final tH:J

.field public final tI:Z

.field public final tJ:J

.field public final tK:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field public final tN:Ljava/lang/String;

.field public final tx:Lcom/google/android/gms/internal/av;

.field public final vp:Lorg/json/JSONObject;

.field public final vq:Lcom/google/android/gms/internal/cm;

.field public final vr:Lcom/google/android/gms/internal/ay;

.field public final vs:J

.field public final vt:J

.field public final vu:Lcom/google/android/gms/internal/bq$a;


# direct methods
.method public constructor <init>(Lcom/google/android/gms/internal/av;Lcom/google/android/gms/internal/gv;Ljava/util/List;ILjava/util/List;Ljava/util/List;IJLjava/lang/String;ZLcom/google/android/gms/internal/cl;Lcom/google/android/gms/internal/cu;Ljava/lang/String;Lcom/google/android/gms/internal/cm;Lcom/google/android/gms/internal/co;JLcom/google/android/gms/internal/ay;JJJLjava/lang/String;Lorg/json/JSONObject;Lcom/google/android/gms/internal/bq$a;)V
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/google/android/gms/internal/av;",
            "Lcom/google/android/gms/internal/gv;",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;I",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;IJ",
            "Ljava/lang/String;",
            "Z",
            "Lcom/google/android/gms/internal/cl;",
            "Lcom/google/android/gms/internal/cu;",
            "Ljava/lang/String;",
            "Lcom/google/android/gms/internal/cm;",
            "Lcom/google/android/gms/internal/co;",
            "J",
            "Lcom/google/android/gms/internal/ay;",
            "JJJ",
            "Ljava/lang/String;",
            "Lorg/json/JSONObject;",
            "Lcom/google/android/gms/internal/bq$a;",
            ")V"
        }
    .end annotation

    move-object v0, p0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    move-object v1, p1

    iput-object v1, v0, Lcom/google/android/gms/internal/fz;->tx:Lcom/google/android/gms/internal/av;

    move-object v1, p2

    iput-object v1, v0, Lcom/google/android/gms/internal/fz;->rN:Lcom/google/android/gms/internal/gv;

    const/4 v1, 0x0

    if-eqz p3, :cond_0

    invoke-static {p3}, Ljava/util/Collections;->unmodifiableList(Ljava/util/List;)Ljava/util/List;

    move-result-object v2

    goto :goto_0

    :cond_0
    move-object v2, v1

    :goto_0
    iput-object v2, v0, Lcom/google/android/gms/internal/fz;->qf:Ljava/util/List;

    move v2, p4

    iput v2, v0, Lcom/google/android/gms/internal/fz;->errorCode:I

    if-eqz p5, :cond_1

    invoke-static {p5}, Ljava/util/Collections;->unmodifiableList(Ljava/util/List;)Ljava/util/List;

    move-result-object v2

    goto :goto_1

    :cond_1
    move-object v2, v1

    :goto_1
    iput-object v2, v0, Lcom/google/android/gms/internal/fz;->qg:Ljava/util/List;

    if-eqz p6, :cond_2

    invoke-static {p6}, Ljava/util/Collections;->unmodifiableList(Ljava/util/List;)Ljava/util/List;

    move-result-object v1

    :cond_2
    iput-object v1, v0, Lcom/google/android/gms/internal/fz;->tK:Ljava/util/List;

    move v1, p7

    iput v1, v0, Lcom/google/android/gms/internal/fz;->orientation:I

    move-wide v1, p8

    iput-wide v1, v0, Lcom/google/android/gms/internal/fz;->qj:J

    move-object v1, p10

    iput-object v1, v0, Lcom/google/android/gms/internal/fz;->tA:Ljava/lang/String;

    move v1, p11

    iput-boolean v1, v0, Lcom/google/android/gms/internal/fz;->tI:Z

    move-object v1, p12

    iput-object v1, v0, Lcom/google/android/gms/internal/fz;->qy:Lcom/google/android/gms/internal/cl;

    move-object/from16 v1, p13

    iput-object v1, v0, Lcom/google/android/gms/internal/fz;->qz:Lcom/google/android/gms/internal/cu;

    move-object/from16 v1, p14

    iput-object v1, v0, Lcom/google/android/gms/internal/fz;->qA:Ljava/lang/String;

    move-object/from16 v1, p15

    iput-object v1, v0, Lcom/google/android/gms/internal/fz;->vq:Lcom/google/android/gms/internal/cm;

    move-object/from16 v1, p16

    iput-object v1, v0, Lcom/google/android/gms/internal/fz;->qB:Lcom/google/android/gms/internal/co;

    move-wide/from16 v1, p17

    iput-wide v1, v0, Lcom/google/android/gms/internal/fz;->tJ:J

    move-object/from16 v1, p19

    iput-object v1, v0, Lcom/google/android/gms/internal/fz;->vr:Lcom/google/android/gms/internal/ay;

    move-wide/from16 v1, p20

    iput-wide v1, v0, Lcom/google/android/gms/internal/fz;->tH:J

    move-wide/from16 v1, p22

    iput-wide v1, v0, Lcom/google/android/gms/internal/fz;->vs:J

    move-wide/from16 v1, p24

    iput-wide v1, v0, Lcom/google/android/gms/internal/fz;->vt:J

    move-object/from16 v1, p26

    iput-object v1, v0, Lcom/google/android/gms/internal/fz;->tN:Ljava/lang/String;

    move-object/from16 v1, p27

    iput-object v1, v0, Lcom/google/android/gms/internal/fz;->vp:Lorg/json/JSONObject;

    move-object/from16 v1, p28

    iput-object v1, v0, Lcom/google/android/gms/internal/fz;->vu:Lcom/google/android/gms/internal/bq$a;

    return-void
.end method

.method public constructor <init>(Lcom/google/android/gms/internal/fz$a;Lcom/google/android/gms/internal/gv;Lcom/google/android/gms/internal/cl;Lcom/google/android/gms/internal/cu;Ljava/lang/String;Lcom/google/android/gms/internal/co;Lcom/google/android/gms/internal/bq$a;)V
    .locals 30

    move-object/from16 v0, p1

    move-object/from16 v1, p0

    move-object/from16 v3, p2

    move-object/from16 v13, p3

    move-object/from16 v14, p4

    move-object/from16 v15, p5

    move-object/from16 v17, p6

    move-object/from16 v29, p7

    iget-object v2, v0, Lcom/google/android/gms/internal/fz$a;->vv:Lcom/google/android/gms/internal/fi;

    iget-object v2, v2, Lcom/google/android/gms/internal/fi;->tx:Lcom/google/android/gms/internal/av;

    iget-object v4, v0, Lcom/google/android/gms/internal/fz$a;->vw:Lcom/google/android/gms/internal/fk;

    iget-object v4, v4, Lcom/google/android/gms/internal/fk;->qf:Ljava/util/List;

    iget v5, v0, Lcom/google/android/gms/internal/fz$a;->errorCode:I

    iget-object v6, v0, Lcom/google/android/gms/internal/fz$a;->vw:Lcom/google/android/gms/internal/fk;

    iget-object v6, v6, Lcom/google/android/gms/internal/fk;->qg:Ljava/util/List;

    iget-object v7, v0, Lcom/google/android/gms/internal/fz$a;->vw:Lcom/google/android/gms/internal/fk;

    iget-object v7, v7, Lcom/google/android/gms/internal/fk;->tK:Ljava/util/List;

    iget-object v8, v0, Lcom/google/android/gms/internal/fz$a;->vw:Lcom/google/android/gms/internal/fk;

    iget v8, v8, Lcom/google/android/gms/internal/fk;->orientation:I

    iget-object v9, v0, Lcom/google/android/gms/internal/fz$a;->vw:Lcom/google/android/gms/internal/fk;

    iget-wide v9, v9, Lcom/google/android/gms/internal/fk;->qj:J

    iget-object v11, v0, Lcom/google/android/gms/internal/fz$a;->vv:Lcom/google/android/gms/internal/fi;

    iget-object v11, v11, Lcom/google/android/gms/internal/fi;->tA:Ljava/lang/String;

    iget-object v12, v0, Lcom/google/android/gms/internal/fz$a;->vw:Lcom/google/android/gms/internal/fk;

    iget-boolean v12, v12, Lcom/google/android/gms/internal/fk;->tI:Z

    iget-object v1, v0, Lcom/google/android/gms/internal/fz$a;->vq:Lcom/google/android/gms/internal/cm;

    move-object/from16 v16, v1

    iget-object v1, v0, Lcom/google/android/gms/internal/fz$a;->vw:Lcom/google/android/gms/internal/fk;

    move-object/from16 p2, v2

    iget-wide v1, v1, Lcom/google/android/gms/internal/fk;->tJ:J

    move-wide/from16 v18, v1

    iget-object v1, v0, Lcom/google/android/gms/internal/fz$a;->lH:Lcom/google/android/gms/internal/ay;

    move-object/from16 v20, v1

    iget-object v1, v0, Lcom/google/android/gms/internal/fz$a;->vw:Lcom/google/android/gms/internal/fk;

    iget-wide v1, v1, Lcom/google/android/gms/internal/fk;->tH:J

    move-wide/from16 v21, v1

    iget-wide v1, v0, Lcom/google/android/gms/internal/fz$a;->vs:J

    move-wide/from16 v23, v1

    iget-wide v1, v0, Lcom/google/android/gms/internal/fz$a;->vt:J

    move-wide/from16 v25, v1

    iget-object v1, v0, Lcom/google/android/gms/internal/fz$a;->vw:Lcom/google/android/gms/internal/fk;

    iget-object v1, v1, Lcom/google/android/gms/internal/fk;->tN:Ljava/lang/String;

    move-object/from16 v27, v1

    iget-object v0, v0, Lcom/google/android/gms/internal/fz$a;->vp:Lorg/json/JSONObject;

    move-object/from16 v28, v0

    move-object/from16 v1, p0

    move-object/from16 v2, p2

    invoke-direct/range {v1 .. v29}, Lcom/google/android/gms/internal/fz;-><init>(Lcom/google/android/gms/internal/av;Lcom/google/android/gms/internal/gv;Ljava/util/List;ILjava/util/List;Ljava/util/List;IJLjava/lang/String;ZLcom/google/android/gms/internal/cl;Lcom/google/android/gms/internal/cu;Ljava/lang/String;Lcom/google/android/gms/internal/cm;Lcom/google/android/gms/internal/co;JLcom/google/android/gms/internal/ay;JJJLjava/lang/String;Lorg/json/JSONObject;Lcom/google/android/gms/internal/bq$a;)V

    return-void
.end method
