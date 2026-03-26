.class public Lcom/motorola/otalib/cdsservice/responsedataobjects/CheckResponse;
.super Lcom/motorola/otalib/cdsservice/responsedataobjects/Response;
.source "CheckResponse.java"


# instance fields
.field private mSettings:Lorg/json/JSONObject;


# direct methods
.method public constructor <init>(ZLjava/lang/String;Ljava/lang/String;JLjava/lang/String;Ljava/lang/String;JLorg/json/JSONObject;ILorg/json/JSONObject;Z)V
    .locals 13

    move-object v0, p0

    move v1, p1

    move-object v2, p2

    move-object/from16 v3, p3

    move-wide/from16 v4, p4

    move-object/from16 v6, p6

    move-object/from16 v7, p7

    move-wide/from16 v8, p8

    move/from16 v10, p11

    move-object/from16 v11, p10

    move/from16 v12, p13

    invoke-direct/range {v0 .. v12}, Lcom/motorola/otalib/cdsservice/responsedataobjects/Response;-><init>(ZLjava/lang/String;Ljava/lang/String;JLjava/lang/String;Ljava/lang/String;JILorg/json/JSONObject;Z)V

    move-object/from16 v1, p12

    iput-object v1, v0, Lcom/motorola/otalib/cdsservice/responsedataobjects/CheckResponse;->mSettings:Lorg/json/JSONObject;

    return-void
.end method


# virtual methods
.method public getSettings()Lorg/json/JSONObject;
    .locals 0

    iget-object p0, p0, Lcom/motorola/otalib/cdsservice/responsedataobjects/CheckResponse;->mSettings:Lorg/json/JSONObject;

    return-object p0
.end method
