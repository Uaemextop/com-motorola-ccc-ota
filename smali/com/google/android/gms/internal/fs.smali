.class public final Lcom/google/android/gms/internal/fs;
.super Ljava/lang/Object;


# annotations
.annotation runtime Lcom/google/android/gms/internal/ez;
.end annotation


# static fields
.field private static final up:Ljava/text/SimpleDateFormat;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    new-instance v0, Ljava/text/SimpleDateFormat;

    const-string v1, "yyyyMMdd"

    invoke-direct {v0, v1}, Ljava/text/SimpleDateFormat;-><init>(Ljava/lang/String;)V

    sput-object v0, Lcom/google/android/gms/internal/fs;->up:Ljava/text/SimpleDateFormat;

    return-void
.end method

.method public static a(Landroid/content/Context;Lcom/google/android/gms/internal/fi;Ljava/lang/String;)Lcom/google/android/gms/internal/fk;
    .locals 33

    move-object/from16 v0, p1

    const-string v1, "interstitial_timeout"

    const/4 v2, 0x0

    :try_start_0
    new-instance v3, Lorg/json/JSONObject;

    move-object/from16 v4, p2

    invoke-direct {v3, v4}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    const-string v4, "ad_base_url"

    const/4 v5, 0x0

    invoke-virtual {v3, v4, v5}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    const-string v6, "ad_url"

    invoke-virtual {v3, v6, v5}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    const-string v7, "ad_size"

    invoke-virtual {v3, v7, v5}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v22

    const-string v7, "ad_html"

    invoke-virtual {v3, v7, v5}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    const-string v8, "debug_dialog"

    invoke-virtual {v3, v8, v5}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v25

    invoke-virtual {v3, v1}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result v8

    const-wide/16 v9, -0x1

    if-eqz v8, :cond_0

    invoke-virtual {v3, v1}, Lorg/json/JSONObject;->getDouble(Ljava/lang/String;)D

    move-result-wide v11

    const-wide v13, 0x408f400000000000L    # 1000.0

    mul-double/2addr v11, v13

    double-to-long v11, v11

    goto :goto_0

    :cond_0
    move-wide v11, v9

    :goto_0
    const-string v1, "orientation"

    invoke-virtual {v3, v1, v5}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    const-string v8, "portrait"

    invoke-virtual {v8, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v8

    const/4 v13, -0x1

    if-eqz v8, :cond_1

    invoke-static {}, Lcom/google/android/gms/internal/gj;->dm()I

    move-result v1

    goto :goto_1

    :cond_1
    const-string v8, "landscape"

    invoke-virtual {v8, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_2

    invoke-static {}, Lcom/google/android/gms/internal/gj;->dl()I

    move-result v1

    goto :goto_1

    :cond_2
    move v1, v13

    :goto_1
    invoke-static {v7}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v8

    if-nez v8, :cond_4

    invoke-static {v4}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v6

    if-eqz v6, :cond_3

    const-string v0, "Could not parse the mediation config: Missing required ad_base_url field"

    invoke-static {v0}, Lcom/google/android/gms/internal/gs;->W(Ljava/lang/String;)V

    new-instance v0, Lcom/google/android/gms/internal/fk;

    invoke-direct {v0, v2}, Lcom/google/android/gms/internal/fk;-><init>(I)V

    return-object v0

    :cond_3
    move-wide/from16 v23, v9

    move-object v9, v4

    move-object v4, v5

    move-object v10, v7

    goto :goto_2

    :cond_4
    invoke-static {v6}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v4

    if-nez v4, :cond_11

    iget-object v4, v0, Lcom/google/android/gms/internal/fi;->lD:Lcom/google/android/gms/internal/gt;

    iget-object v4, v4, Lcom/google/android/gms/internal/gt;->wD:Ljava/lang/String;

    move-object/from16 v7, p0

    invoke-static {v7, v4, v6, v5, v5}, Lcom/google/android/gms/internal/fr;->a(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lcom/google/android/gms/internal/fv;)Lcom/google/android/gms/internal/fk;

    move-result-object v4

    iget-object v6, v4, Lcom/google/android/gms/internal/fk;->rP:Ljava/lang/String;

    iget-object v7, v4, Lcom/google/android/gms/internal/fk;->tG:Ljava/lang/String;

    iget-wide v8, v4, Lcom/google/android/gms/internal/fk;->tM:J

    move-object v10, v7

    move-wide/from16 v23, v8

    move-object v9, v6

    :goto_2
    const-string v6, "click_urls"

    invoke-virtual {v3, v6}, Lorg/json/JSONObject;->optJSONArray(Ljava/lang/String;)Lorg/json/JSONArray;

    move-result-object v6

    if-nez v4, :cond_5

    move-object v7, v5

    goto :goto_3

    :cond_5
    iget-object v7, v4, Lcom/google/android/gms/internal/fk;->qf:Ljava/util/List;

    :goto_3
    if-eqz v6, :cond_7

    if-nez v7, :cond_6

    new-instance v7, Ljava/util/LinkedList;

    invoke-direct {v7}, Ljava/util/LinkedList;-><init>()V

    :cond_6
    move v8, v2

    :goto_4
    invoke-virtual {v6}, Lorg/json/JSONArray;->length()I

    move-result v14

    if-ge v8, v14, :cond_7

    invoke-virtual {v6, v8}, Lorg/json/JSONArray;->getString(I)Ljava/lang/String;

    move-result-object v14

    invoke-interface {v7, v14}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    add-int/lit8 v8, v8, 0x1

    goto :goto_4

    :cond_7
    const-string v6, "impression_urls"

    invoke-virtual {v3, v6}, Lorg/json/JSONObject;->optJSONArray(Ljava/lang/String;)Lorg/json/JSONArray;

    move-result-object v6

    if-nez v4, :cond_8

    move-object v8, v5

    goto :goto_5

    :cond_8
    iget-object v8, v4, Lcom/google/android/gms/internal/fk;->qg:Ljava/util/List;

    :goto_5
    if-eqz v6, :cond_a

    if-nez v8, :cond_9

    new-instance v8, Ljava/util/LinkedList;

    invoke-direct {v8}, Ljava/util/LinkedList;-><init>()V

    :cond_9
    move v14, v2

    :goto_6
    invoke-virtual {v6}, Lorg/json/JSONArray;->length()I

    move-result v15

    if-ge v14, v15, :cond_a

    invoke-virtual {v6, v14}, Lorg/json/JSONArray;->getString(I)Ljava/lang/String;

    move-result-object v15

    invoke-interface {v8, v15}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    add-int/lit8 v14, v14, 0x1

    goto :goto_6

    :cond_a
    move-object v6, v8

    const-string v8, "manual_impression_urls"

    invoke-virtual {v3, v8}, Lorg/json/JSONObject;->optJSONArray(Ljava/lang/String;)Lorg/json/JSONArray;

    move-result-object v8

    if-nez v4, :cond_b

    move-object v14, v5

    goto :goto_7

    :cond_b
    iget-object v14, v4, Lcom/google/android/gms/internal/fk;->tK:Ljava/util/List;

    :goto_7
    if-eqz v8, :cond_d

    if-nez v14, :cond_c

    new-instance v14, Ljava/util/LinkedList;

    invoke-direct {v14}, Ljava/util/LinkedList;-><init>()V

    :cond_c
    move v15, v2

    :goto_8
    invoke-virtual {v8}, Lorg/json/JSONArray;->length()I

    move-result v5

    if-ge v15, v5, :cond_d

    invoke-virtual {v8, v15}, Lorg/json/JSONArray;->getString(I)Ljava/lang/String;

    move-result-object v5

    invoke-interface {v14, v5}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    add-int/lit8 v15, v15, 0x1

    goto :goto_8

    :cond_d
    move-object/from16 v18, v14

    if-eqz v4, :cond_f

    iget v5, v4, Lcom/google/android/gms/internal/fk;->orientation:I

    if-eq v5, v13, :cond_e

    iget v1, v4, Lcom/google/android/gms/internal/fk;->orientation:I

    :cond_e
    iget-wide v13, v4, Lcom/google/android/gms/internal/fk;->tH:J

    const-wide/16 v15, 0x0

    cmp-long v5, v13, v15

    if-lez v5, :cond_f

    iget-wide v4, v4, Lcom/google/android/gms/internal/fk;->tH:J

    move/from16 v21, v1

    move-wide v13, v4

    goto :goto_9

    :cond_f
    move/from16 v21, v1

    move-wide v13, v11

    :goto_9
    const-string v1, "active_view"

    invoke-virtual {v3, v1}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v28

    const-string v1, "ad_is_javascript"

    invoke-virtual {v3, v1, v2}, Lorg/json/JSONObject;->optBoolean(Ljava/lang/String;Z)Z

    move-result v26

    if-eqz v26, :cond_10

    const-string v1, "ad_passback_url"

    const/4 v4, 0x0

    invoke-virtual {v3, v1, v4}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    move-object/from16 v27, v5

    goto :goto_a

    :cond_10
    const/4 v4, 0x0

    move-object/from16 v27, v4

    :goto_a
    new-instance v1, Lcom/google/android/gms/internal/fk;

    iget-boolean v0, v0, Lcom/google/android/gms/internal/fi;->tF:Z

    const/16 v32, 0x0

    const/4 v15, 0x0

    const-wide/16 v16, -0x1

    const-wide/16 v19, -0x1

    const/16 v29, 0x0

    const/16 v30, 0x0

    move-object v8, v1

    move-object v11, v7

    move-object v12, v6

    move/from16 v31, v0

    invoke-direct/range {v8 .. v32}, Lcom/google/android/gms/internal/fk;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/util/List;Ljava/util/List;JZJLjava/util/List;JILjava/lang/String;JLjava/lang/String;ZLjava/lang/String;Ljava/lang/String;ZZZZ)V

    return-object v1

    :cond_11
    const-string v0, "Could not parse the mediation config: Missing required ad_html or ad_url field."

    invoke-static {v0}, Lcom/google/android/gms/internal/gs;->W(Ljava/lang/String;)V

    new-instance v0, Lcom/google/android/gms/internal/fk;

    invoke-direct {v0, v2}, Lcom/google/android/gms/internal/fk;-><init>(I)V
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    return-object v0

    :catch_0
    move-exception v0

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v3, "Could not parse the mediation config: "

    invoke-direct {v1, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0}, Lorg/json/JSONException;->getMessage()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/google/android/gms/internal/gs;->W(Ljava/lang/String;)V

    new-instance v0, Lcom/google/android/gms/internal/fk;

    invoke-direct {v0, v2}, Lcom/google/android/gms/internal/fk;-><init>(I)V

    return-object v0
.end method

.method public static a(Lcom/google/android/gms/internal/fi;Lcom/google/android/gms/internal/fw;Landroid/location/Location;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    .locals 7

    :try_start_0
    new-instance p2, Ljava/util/HashMap;

    invoke-direct {p2}, Ljava/util/HashMap;-><init>()V

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    invoke-static {p3}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    if-nez v1, :cond_0

    invoke-interface {v0, p3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    :cond_0
    invoke-static {p4}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result p3

    if-nez p3, :cond_1

    invoke-interface {v0, p4}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    :cond_1
    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result p3

    if-lez p3, :cond_2

    const-string p3, "eid"

    const-string p4, ","

    invoke-static {p4, v0}, Landroid/text/TextUtils;->join(Ljava/lang/CharSequence;Ljava/lang/Iterable;)Ljava/lang/String;

    move-result-object p4

    invoke-virtual {p2, p3, p4}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    :cond_2
    iget-object p3, p0, Lcom/google/android/gms/internal/fi;->tw:Landroid/os/Bundle;

    if-eqz p3, :cond_3

    const-string p3, "ad_pos"

    iget-object p4, p0, Lcom/google/android/gms/internal/fi;->tw:Landroid/os/Bundle;

    invoke-virtual {p2, p3, p4}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    :cond_3
    iget-object p3, p0, Lcom/google/android/gms/internal/fi;->tx:Lcom/google/android/gms/internal/av;

    invoke-static {p2, p3}, Lcom/google/android/gms/internal/fs;->a(Ljava/util/HashMap;Lcom/google/android/gms/internal/av;)V

    const-string p3, "format"

    iget-object p4, p0, Lcom/google/android/gms/internal/fi;->lH:Lcom/google/android/gms/internal/ay;

    iget-object p4, p4, Lcom/google/android/gms/internal/ay;->of:Ljava/lang/String;

    invoke-virtual {p2, p3, p4}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    iget-object p3, p0, Lcom/google/android/gms/internal/fi;->lH:Lcom/google/android/gms/internal/ay;

    iget p3, p3, Lcom/google/android/gms/internal/ay;->width:I

    const/4 p4, -0x1

    if-ne p3, p4, :cond_4

    const-string p3, "smart_w"

    const-string v0, "full"

    invoke-virtual {p2, p3, v0}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    :cond_4
    iget-object p3, p0, Lcom/google/android/gms/internal/fi;->lH:Lcom/google/android/gms/internal/ay;

    iget p3, p3, Lcom/google/android/gms/internal/ay;->height:I

    const/4 v0, -0x2

    if-ne p3, v0, :cond_5

    const-string p3, "smart_h"

    const-string v1, "auto"

    invoke-virtual {p2, p3, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    :cond_5
    iget-object p3, p0, Lcom/google/android/gms/internal/fi;->lH:Lcom/google/android/gms/internal/ay;

    iget-object p3, p3, Lcom/google/android/gms/internal/ay;->oh:[Lcom/google/android/gms/internal/ay;

    if-eqz p3, :cond_a

    new-instance p3, Ljava/lang/StringBuilder;

    invoke-direct {p3}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v1, p0, Lcom/google/android/gms/internal/fi;->lH:Lcom/google/android/gms/internal/ay;

    iget-object v1, v1, Lcom/google/android/gms/internal/ay;->oh:[Lcom/google/android/gms/internal/ay;

    array-length v2, v1

    const/4 v3, 0x0

    :goto_0
    if-ge v3, v2, :cond_9

    aget-object v4, v1, v3

    invoke-virtual {p3}, Ljava/lang/StringBuilder;->length()I

    move-result v5

    if-eqz v5, :cond_6

    const-string v5, "|"

    invoke-virtual {p3, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    :cond_6
    iget v5, v4, Lcom/google/android/gms/internal/ay;->width:I

    if-ne v5, p4, :cond_7

    iget v5, v4, Lcom/google/android/gms/internal/ay;->widthPixels:I

    int-to-float v5, v5

    iget v6, p1, Lcom/google/android/gms/internal/fw;->vi:F

    div-float/2addr v5, v6

    float-to-int v5, v5

    goto :goto_1

    :cond_7
    iget v5, v4, Lcom/google/android/gms/internal/ay;->width:I

    :goto_1
    invoke-virtual {p3, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v5, "x"

    invoke-virtual {p3, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v5, v4, Lcom/google/android/gms/internal/ay;->height:I

    if-ne v5, v0, :cond_8

    iget v4, v4, Lcom/google/android/gms/internal/ay;->heightPixels:I

    int-to-float v4, v4

    iget v5, p1, Lcom/google/android/gms/internal/fw;->vi:F

    div-float/2addr v4, v5

    float-to-int v4, v4

    goto :goto_2

    :cond_8
    iget v4, v4, Lcom/google/android/gms/internal/ay;->height:I

    :goto_2
    invoke-virtual {p3, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    :cond_9
    const-string p4, "sz"

    invoke-virtual {p2, p4, p3}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    :cond_a
    iget p3, p0, Lcom/google/android/gms/internal/fi;->tD:I

    if-eqz p3, :cond_b

    const-string p3, "native_version"

    iget p4, p0, Lcom/google/android/gms/internal/fi;->tD:I

    invoke-static {p4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p4

    invoke-virtual {p2, p3, p4}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string p3, "native_templates"

    iget-object p4, p0, Lcom/google/android/gms/internal/fi;->lS:Ljava/util/List;

    invoke-virtual {p2, p3, p4}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    :cond_b
    const-string p3, "slotname"

    iget-object p4, p0, Lcom/google/android/gms/internal/fi;->lA:Ljava/lang/String;

    invoke-virtual {p2, p3, p4}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string p3, "pn"

    iget-object p4, p0, Lcom/google/android/gms/internal/fi;->applicationInfo:Landroid/content/pm/ApplicationInfo;

    iget-object p4, p4, Landroid/content/pm/ApplicationInfo;->packageName:Ljava/lang/String;

    invoke-virtual {p2, p3, p4}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    iget-object p3, p0, Lcom/google/android/gms/internal/fi;->ty:Landroid/content/pm/PackageInfo;

    if-eqz p3, :cond_c

    const-string p3, "vc"

    iget-object p4, p0, Lcom/google/android/gms/internal/fi;->ty:Landroid/content/pm/PackageInfo;

    iget p4, p4, Landroid/content/pm/PackageInfo;->versionCode:I

    invoke-static {p4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p4

    invoke-virtual {p2, p3, p4}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    :cond_c
    const-string p3, "ms"

    iget-object p4, p0, Lcom/google/android/gms/internal/fi;->tz:Ljava/lang/String;

    invoke-virtual {p2, p3, p4}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string p3, "seq_num"

    iget-object p4, p0, Lcom/google/android/gms/internal/fi;->tA:Ljava/lang/String;

    invoke-virtual {p2, p3, p4}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string p3, "session_id"

    iget-object p4, p0, Lcom/google/android/gms/internal/fi;->tB:Ljava/lang/String;

    invoke-virtual {p2, p3, p4}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string p3, "js"

    iget-object p4, p0, Lcom/google/android/gms/internal/fi;->lD:Lcom/google/android/gms/internal/gt;

    iget-object p4, p4, Lcom/google/android/gms/internal/gt;->wD:Ljava/lang/String;

    invoke-virtual {p2, p3, p4}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    invoke-static {p2, p1}, Lcom/google/android/gms/internal/fs;->a(Ljava/util/HashMap;Lcom/google/android/gms/internal/fw;)V

    iget-object p1, p0, Lcom/google/android/gms/internal/fi;->tx:Lcom/google/android/gms/internal/av;

    iget p1, p1, Lcom/google/android/gms/internal/av;->versionCode:I

    const/4 p3, 0x2

    if-lt p1, p3, :cond_d

    iget-object p1, p0, Lcom/google/android/gms/internal/fi;->tx:Lcom/google/android/gms/internal/av;

    iget-object p1, p1, Lcom/google/android/gms/internal/av;->ob:Landroid/location/Location;

    if-eqz p1, :cond_d

    iget-object p1, p0, Lcom/google/android/gms/internal/fi;->tx:Lcom/google/android/gms/internal/av;

    iget-object p1, p1, Lcom/google/android/gms/internal/av;->ob:Landroid/location/Location;

    invoke-static {p2, p1}, Lcom/google/android/gms/internal/fs;->a(Ljava/util/HashMap;Landroid/location/Location;)V

    :cond_d
    iget p1, p0, Lcom/google/android/gms/internal/fi;->versionCode:I

    if-lt p1, p3, :cond_e

    const-string p1, "quality_signals"

    iget-object p4, p0, Lcom/google/android/gms/internal/fi;->tC:Landroid/os/Bundle;

    invoke-virtual {p2, p1, p4}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    :cond_e
    iget p1, p0, Lcom/google/android/gms/internal/fi;->versionCode:I

    const/4 p4, 0x4

    if-lt p1, p4, :cond_f

    iget-boolean p1, p0, Lcom/google/android/gms/internal/fi;->tF:Z

    if-eqz p1, :cond_f

    const-string p1, "forceHttps"

    iget-boolean p4, p0, Lcom/google/android/gms/internal/fi;->tF:Z

    invoke-static {p4}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object p4

    invoke-virtual {p2, p1, p4}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    :cond_f
    iget p1, p0, Lcom/google/android/gms/internal/fi;->versionCode:I

    const/4 p4, 0x3

    if-lt p1, p4, :cond_10

    iget-object p1, p0, Lcom/google/android/gms/internal/fi;->tE:Landroid/os/Bundle;

    if-eqz p1, :cond_10

    const-string p1, "content_info"

    iget-object p0, p0, Lcom/google/android/gms/internal/fi;->tE:Landroid/os/Bundle;

    invoke-virtual {p2, p1, p0}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    :cond_10
    invoke-static {p3}, Lcom/google/android/gms/internal/gs;->u(I)Z

    move-result p0

    if-eqz p0, :cond_11

    invoke-static {p2}, Lcom/google/android/gms/internal/gj;->t(Ljava/util/Map;)Lorg/json/JSONObject;

    move-result-object p0

    invoke-virtual {p0, p3}, Lorg/json/JSONObject;->toString(I)Ljava/lang/String;

    move-result-object p0

    new-instance p1, Ljava/lang/StringBuilder;

    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    const-string p3, "Ad Request JSON: "

    invoke-virtual {p1, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-static {p0}, Lcom/google/android/gms/internal/gs;->V(Ljava/lang/String;)V

    :cond_11
    invoke-static {p2}, Lcom/google/android/gms/internal/gj;->t(Ljava/util/Map;)Lorg/json/JSONObject;

    move-result-object p0

    invoke-virtual {p0}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    move-result-object p0
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    return-object p0

    :catch_0
    move-exception p0

    new-instance p1, Ljava/lang/StringBuilder;

    const-string p2, "Problem serializing ad request to JSON: "

    invoke-direct {p1, p2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p0}, Lorg/json/JSONException;->getMessage()Ljava/lang/String;

    move-result-object p0

    invoke-virtual {p1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-static {p0}, Lcom/google/android/gms/internal/gs;->W(Ljava/lang/String;)V

    const/4 p0, 0x0

    return-object p0
.end method

.method private static a(Ljava/util/HashMap;Landroid/location/Location;)V
    .locals 9
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/HashMap<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;",
            "Landroid/location/Location;",
            ")V"
        }
    .end annotation

    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    invoke-virtual {p1}, Landroid/location/Location;->getAccuracy()F

    move-result v1

    const/high16 v2, 0x447a0000    # 1000.0f

    mul-float/2addr v1, v2

    invoke-static {v1}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v1

    invoke-virtual {p1}, Landroid/location/Location;->getTime()J

    move-result-wide v2

    const-wide/16 v4, 0x3e8

    mul-long/2addr v2, v4

    invoke-static {v2, v3}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v2

    invoke-virtual {p1}, Landroid/location/Location;->getLatitude()D

    move-result-wide v3

    const-wide v5, 0x416312d000000000L    # 1.0E7

    mul-double/2addr v3, v5

    double-to-long v3, v3

    invoke-static {v3, v4}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v3

    invoke-virtual {p1}, Landroid/location/Location;->getLongitude()D

    move-result-wide v7

    mul-double/2addr v7, v5

    double-to-long v4, v7

    invoke-static {v4, v5}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object p1

    const-string v4, "radius"

    invoke-virtual {v0, v4, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string v1, "lat"

    invoke-virtual {v0, v1, v3}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string v1, "long"

    invoke-virtual {v0, v1, p1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string p1, "time"

    invoke-virtual {v0, p1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string p1, "uule"

    invoke-virtual {p0, p1, v0}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    return-void
.end method

.method private static a(Ljava/util/HashMap;Lcom/google/android/gms/internal/av;)V
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/HashMap<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;",
            "Lcom/google/android/gms/internal/av;",
            ")V"
        }
    .end annotation

    invoke-static {}, Lcom/google/android/gms/internal/gf;->di()Ljava/lang/String;

    move-result-object v0

    if-eqz v0, :cond_0

    const-string v1, "abf"

    invoke-virtual {p0, v1, v0}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    :cond_0
    iget-wide v0, p1, Lcom/google/android/gms/internal/av;->nT:J

    const-wide/16 v2, -0x1

    cmp-long v0, v0, v2

    if-eqz v0, :cond_1

    sget-object v0, Lcom/google/android/gms/internal/fs;->up:Ljava/text/SimpleDateFormat;

    new-instance v1, Ljava/util/Date;

    iget-wide v2, p1, Lcom/google/android/gms/internal/av;->nT:J

    invoke-direct {v1, v2, v3}, Ljava/util/Date;-><init>(J)V

    invoke-virtual {v0, v1}, Ljava/text/SimpleDateFormat;->format(Ljava/util/Date;)Ljava/lang/String;

    move-result-object v0

    const-string v1, "cust_age"

    invoke-virtual {p0, v1, v0}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    :cond_1
    iget-object v0, p1, Lcom/google/android/gms/internal/av;->extras:Landroid/os/Bundle;

    if-eqz v0, :cond_2

    const-string v0, "extras"

    iget-object v1, p1, Lcom/google/android/gms/internal/av;->extras:Landroid/os/Bundle;

    invoke-virtual {p0, v0, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    :cond_2
    iget v0, p1, Lcom/google/android/gms/internal/av;->nU:I

    const/4 v1, -0x1

    if-eq v0, v1, :cond_3

    iget v0, p1, Lcom/google/android/gms/internal/av;->nU:I

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    const-string v2, "cust_gender"

    invoke-virtual {p0, v2, v0}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    :cond_3
    iget-object v0, p1, Lcom/google/android/gms/internal/av;->nV:Ljava/util/List;

    if-eqz v0, :cond_4

    const-string v0, "kw"

    iget-object v2, p1, Lcom/google/android/gms/internal/av;->nV:Ljava/util/List;

    invoke-virtual {p0, v0, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    :cond_4
    iget v0, p1, Lcom/google/android/gms/internal/av;->nX:I

    if-eq v0, v1, :cond_5

    iget v0, p1, Lcom/google/android/gms/internal/av;->nX:I

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    const-string v1, "tag_for_child_directed_treatment"

    invoke-virtual {p0, v1, v0}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    :cond_5
    iget-boolean v0, p1, Lcom/google/android/gms/internal/av;->nW:Z

    if-eqz v0, :cond_6

    const-string v0, "adtest"

    const-string v1, "on"

    invoke-virtual {p0, v0, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    :cond_6
    iget v0, p1, Lcom/google/android/gms/internal/av;->versionCode:I

    const/4 v1, 0x2

    if-lt v0, v1, :cond_9

    iget-boolean v0, p1, Lcom/google/android/gms/internal/av;->nY:Z

    if-eqz v0, :cond_7

    const/4 v0, 0x1

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    const-string v1, "d_imp_hdr"

    invoke-virtual {p0, v1, v0}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    :cond_7
    iget-object v0, p1, Lcom/google/android/gms/internal/av;->nZ:Ljava/lang/String;

    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_8

    const-string v0, "ppid"

    iget-object v1, p1, Lcom/google/android/gms/internal/av;->nZ:Ljava/lang/String;

    invoke-virtual {p0, v0, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    :cond_8
    iget-object v0, p1, Lcom/google/android/gms/internal/av;->oa:Lcom/google/android/gms/internal/bj;

    if-eqz v0, :cond_9

    iget-object v0, p1, Lcom/google/android/gms/internal/av;->oa:Lcom/google/android/gms/internal/bj;

    invoke-static {p0, v0}, Lcom/google/android/gms/internal/fs;->a(Ljava/util/HashMap;Lcom/google/android/gms/internal/bj;)V

    :cond_9
    iget v0, p1, Lcom/google/android/gms/internal/av;->versionCode:I

    const/4 v1, 0x3

    if-lt v0, v1, :cond_a

    iget-object v0, p1, Lcom/google/android/gms/internal/av;->oc:Ljava/lang/String;

    if-eqz v0, :cond_a

    const-string v0, "url"

    iget-object p1, p1, Lcom/google/android/gms/internal/av;->oc:Ljava/lang/String;

    invoke-virtual {p0, v0, p1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    :cond_a
    return-void
.end method

.method private static a(Ljava/util/HashMap;Lcom/google/android/gms/internal/bj;)V
    .locals 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/HashMap<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;",
            "Lcom/google/android/gms/internal/bj;",
            ")V"
        }
    .end annotation

    iget v0, p1, Lcom/google/android/gms/internal/bj;->oH:I

    invoke-static {v0}, Landroid/graphics/Color;->alpha(I)I

    move-result v0

    if-eqz v0, :cond_0

    iget v0, p1, Lcom/google/android/gms/internal/bj;->oH:I

    invoke-static {v0}, Lcom/google/android/gms/internal/fs;->t(I)Ljava/lang/String;

    move-result-object v0

    const-string v1, "acolor"

    invoke-virtual {p0, v1, v0}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    :cond_0
    iget v0, p1, Lcom/google/android/gms/internal/bj;->backgroundColor:I

    invoke-static {v0}, Landroid/graphics/Color;->alpha(I)I

    move-result v0

    if-eqz v0, :cond_1

    iget v0, p1, Lcom/google/android/gms/internal/bj;->backgroundColor:I

    invoke-static {v0}, Lcom/google/android/gms/internal/fs;->t(I)Ljava/lang/String;

    move-result-object v0

    const-string v1, "bgcolor"

    invoke-virtual {p0, v1, v0}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    :cond_1
    iget v0, p1, Lcom/google/android/gms/internal/bj;->oI:I

    invoke-static {v0}, Landroid/graphics/Color;->alpha(I)I

    move-result v0

    if-eqz v0, :cond_2

    iget v0, p1, Lcom/google/android/gms/internal/bj;->oJ:I

    invoke-static {v0}, Landroid/graphics/Color;->alpha(I)I

    move-result v0

    if-eqz v0, :cond_2

    iget v0, p1, Lcom/google/android/gms/internal/bj;->oI:I

    invoke-static {v0}, Lcom/google/android/gms/internal/fs;->t(I)Ljava/lang/String;

    move-result-object v0

    const-string v1, "gradientto"

    invoke-virtual {p0, v1, v0}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    iget v0, p1, Lcom/google/android/gms/internal/bj;->oJ:I

    invoke-static {v0}, Lcom/google/android/gms/internal/fs;->t(I)Ljava/lang/String;

    move-result-object v0

    const-string v1, "gradientfrom"

    invoke-virtual {p0, v1, v0}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    :cond_2
    iget v0, p1, Lcom/google/android/gms/internal/bj;->oK:I

    invoke-static {v0}, Landroid/graphics/Color;->alpha(I)I

    move-result v0

    if-eqz v0, :cond_3

    iget v0, p1, Lcom/google/android/gms/internal/bj;->oK:I

    invoke-static {v0}, Lcom/google/android/gms/internal/fs;->t(I)Ljava/lang/String;

    move-result-object v0

    const-string v1, "bcolor"

    invoke-virtual {p0, v1, v0}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    :cond_3
    iget v0, p1, Lcom/google/android/gms/internal/bj;->oL:I

    invoke-static {v0}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    move-result-object v0

    const-string v1, "bthick"

    invoke-virtual {p0, v1, v0}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    iget v0, p1, Lcom/google/android/gms/internal/bj;->oM:I

    const/4 v1, 0x0

    const/4 v2, 0x2

    const/4 v3, 0x1

    if-eqz v0, :cond_7

    if-eq v0, v3, :cond_6

    if-eq v0, v2, :cond_5

    const/4 v4, 0x3

    if-eq v0, v4, :cond_4

    move-object v0, v1

    goto :goto_0

    :cond_4
    const-string v0, "solid"

    goto :goto_0

    :cond_5
    const-string v0, "dotted"

    goto :goto_0

    :cond_6
    const-string v0, "dashed"

    goto :goto_0

    :cond_7
    const-string v0, "none"

    :goto_0
    if-eqz v0, :cond_8

    const-string v4, "btype"

    invoke-virtual {p0, v4, v0}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    :cond_8
    iget v0, p1, Lcom/google/android/gms/internal/bj;->oN:I

    if-eqz v0, :cond_b

    if-eq v0, v3, :cond_a

    if-eq v0, v2, :cond_9

    goto :goto_1

    :cond_9
    const-string v1, "dark"

    goto :goto_1

    :cond_a
    const-string v1, "medium"

    goto :goto_1

    :cond_b
    const-string v1, "light"

    :goto_1
    if-eqz v1, :cond_c

    const-string v0, "callbuttoncolor"

    invoke-virtual {p0, v0, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    :cond_c
    iget-object v0, p1, Lcom/google/android/gms/internal/bj;->oO:Ljava/lang/String;

    if-eqz v0, :cond_d

    const-string v0, "channel"

    iget-object v1, p1, Lcom/google/android/gms/internal/bj;->oO:Ljava/lang/String;

    invoke-virtual {p0, v0, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    :cond_d
    iget v0, p1, Lcom/google/android/gms/internal/bj;->oP:I

    invoke-static {v0}, Landroid/graphics/Color;->alpha(I)I

    move-result v0

    if-eqz v0, :cond_e

    iget v0, p1, Lcom/google/android/gms/internal/bj;->oP:I

    invoke-static {v0}, Lcom/google/android/gms/internal/fs;->t(I)Ljava/lang/String;

    move-result-object v0

    const-string v1, "dcolor"

    invoke-virtual {p0, v1, v0}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    :cond_e
    iget-object v0, p1, Lcom/google/android/gms/internal/bj;->oQ:Ljava/lang/String;

    if-eqz v0, :cond_f

    const-string v0, "font"

    iget-object v1, p1, Lcom/google/android/gms/internal/bj;->oQ:Ljava/lang/String;

    invoke-virtual {p0, v0, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    :cond_f
    iget v0, p1, Lcom/google/android/gms/internal/bj;->oR:I

    invoke-static {v0}, Landroid/graphics/Color;->alpha(I)I

    move-result v0

    if-eqz v0, :cond_10

    iget v0, p1, Lcom/google/android/gms/internal/bj;->oR:I

    invoke-static {v0}, Lcom/google/android/gms/internal/fs;->t(I)Ljava/lang/String;

    move-result-object v0

    const-string v1, "hcolor"

    invoke-virtual {p0, v1, v0}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    :cond_10
    iget v0, p1, Lcom/google/android/gms/internal/bj;->oS:I

    invoke-static {v0}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    move-result-object v0

    const-string v1, "headersize"

    invoke-virtual {p0, v1, v0}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    iget-object v0, p1, Lcom/google/android/gms/internal/bj;->oT:Ljava/lang/String;

    if-eqz v0, :cond_11

    const-string v0, "q"

    iget-object p1, p1, Lcom/google/android/gms/internal/bj;->oT:Ljava/lang/String;

    invoke-virtual {p0, v0, p1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    :cond_11
    return-void
.end method

.method private static a(Ljava/util/HashMap;Lcom/google/android/gms/internal/fw;)V
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/HashMap<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;",
            "Lcom/google/android/gms/internal/fw;",
            ")V"
        }
    .end annotation

    iget v0, p1, Lcom/google/android/gms/internal/fw;->uS:I

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    const-string v1, "am"

    invoke-virtual {p0, v1, v0}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    iget-boolean v0, p1, Lcom/google/android/gms/internal/fw;->uT:Z

    invoke-static {v0}, Lcom/google/android/gms/internal/fs;->s(Z)Ljava/lang/Integer;

    move-result-object v0

    const-string v1, "cog"

    invoke-virtual {p0, v1, v0}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    iget-boolean v0, p1, Lcom/google/android/gms/internal/fw;->uU:Z

    invoke-static {v0}, Lcom/google/android/gms/internal/fs;->s(Z)Ljava/lang/Integer;

    move-result-object v0

    const-string v1, "coh"

    invoke-virtual {p0, v1, v0}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    iget-object v0, p1, Lcom/google/android/gms/internal/fw;->uV:Ljava/lang/String;

    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_0

    const-string v0, "carrier"

    iget-object v1, p1, Lcom/google/android/gms/internal/fw;->uV:Ljava/lang/String;

    invoke-virtual {p0, v0, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    :cond_0
    const-string v0, "gl"

    iget-object v1, p1, Lcom/google/android/gms/internal/fw;->uW:Ljava/lang/String;

    invoke-virtual {p0, v0, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    iget-boolean v0, p1, Lcom/google/android/gms/internal/fw;->uX:Z

    if-eqz v0, :cond_1

    const/4 v0, 0x1

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    const-string v1, "simulator"

    invoke-virtual {p0, v1, v0}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    :cond_1
    iget-boolean v0, p1, Lcom/google/android/gms/internal/fw;->uY:Z

    invoke-static {v0}, Lcom/google/android/gms/internal/fs;->s(Z)Ljava/lang/Integer;

    move-result-object v0

    const-string v1, "ma"

    invoke-virtual {p0, v1, v0}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    iget-boolean v0, p1, Lcom/google/android/gms/internal/fw;->uZ:Z

    invoke-static {v0}, Lcom/google/android/gms/internal/fs;->s(Z)Ljava/lang/Integer;

    move-result-object v0

    const-string v1, "sp"

    invoke-virtual {p0, v1, v0}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string v0, "hl"

    iget-object v1, p1, Lcom/google/android/gms/internal/fw;->va:Ljava/lang/String;

    invoke-virtual {p0, v0, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    iget-object v0, p1, Lcom/google/android/gms/internal/fw;->vb:Ljava/lang/String;

    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_2

    const-string v0, "mv"

    iget-object v1, p1, Lcom/google/android/gms/internal/fw;->vb:Ljava/lang/String;

    invoke-virtual {p0, v0, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    :cond_2
    iget v0, p1, Lcom/google/android/gms/internal/fw;->vc:I

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    const-string v1, "muv"

    invoke-virtual {p0, v1, v0}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    iget v0, p1, Lcom/google/android/gms/internal/fw;->vd:I

    const/4 v1, -0x2

    if-eq v0, v1, :cond_3

    iget v0, p1, Lcom/google/android/gms/internal/fw;->vd:I

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    const-string v1, "cnt"

    invoke-virtual {p0, v1, v0}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    :cond_3
    iget v0, p1, Lcom/google/android/gms/internal/fw;->ve:I

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    const-string v1, "gnt"

    invoke-virtual {p0, v1, v0}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    iget v0, p1, Lcom/google/android/gms/internal/fw;->vf:I

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    const-string v1, "pt"

    invoke-virtual {p0, v1, v0}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    iget v0, p1, Lcom/google/android/gms/internal/fw;->vg:I

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    const-string v1, "rm"

    invoke-virtual {p0, v1, v0}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    iget v0, p1, Lcom/google/android/gms/internal/fw;->vh:I

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    const-string v1, "riv"

    invoke-virtual {p0, v1, v0}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    iget v0, p1, Lcom/google/android/gms/internal/fw;->vi:F

    invoke-static {v0}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v0

    const-string v1, "u_sd"

    invoke-virtual {p0, v1, v0}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    iget v0, p1, Lcom/google/android/gms/internal/fw;->vk:I

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    const-string v1, "sh"

    invoke-virtual {p0, v1, v0}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    iget v0, p1, Lcom/google/android/gms/internal/fw;->vj:I

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    const-string v1, "sw"

    invoke-virtual {p0, v1, v0}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    new-instance v0, Landroid/os/Bundle;

    invoke-direct {v0}, Landroid/os/Bundle;-><init>()V

    const-string v1, "active_network_state"

    iget v2, p1, Lcom/google/android/gms/internal/fw;->vo:I

    invoke-virtual {v0, v1, v2}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    const-string v1, "active_network_metered"

    iget-boolean v2, p1, Lcom/google/android/gms/internal/fw;->vn:Z

    invoke-virtual {v0, v1, v2}, Landroid/os/Bundle;->putBoolean(Ljava/lang/String;Z)V

    const-string v1, "connectivity"

    invoke-virtual {p0, v1, v0}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    new-instance v0, Landroid/os/Bundle;

    invoke-direct {v0}, Landroid/os/Bundle;-><init>()V

    const-string v1, "is_charging"

    iget-boolean v2, p1, Lcom/google/android/gms/internal/fw;->vm:Z

    invoke-virtual {v0, v1, v2}, Landroid/os/Bundle;->putBoolean(Ljava/lang/String;Z)V

    const-string v1, "battery_level"

    iget-wide v2, p1, Lcom/google/android/gms/internal/fw;->vl:D

    invoke-virtual {v0, v1, v2, v3}, Landroid/os/Bundle;->putDouble(Ljava/lang/String;D)V

    const-string p1, "battery"

    invoke-virtual {p0, p1, v0}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    return-void
.end method

.method private static s(Z)Ljava/lang/Integer;
    .locals 0

    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p0

    return-object p0
.end method

.method private static t(I)Ljava/lang/String;
    .locals 2

    sget-object v0, Ljava/util/Locale;->US:Ljava/util/Locale;

    const v1, 0xffffff

    and-int/2addr p0, v1

    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p0

    filled-new-array {p0}, [Ljava/lang/Object;

    move-result-object p0

    const-string v1, "#%06x"

    invoke-static {v0, v1, p0}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method
