.class public Lcom/motorola/otalib/common/Environment/AndroidDB;
.super Landroid/database/sqlite/SQLiteOpenHelper;
.source "AndroidDB.java"

# interfaces
.implements Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database;


# static fields
.field private static final STATUS_TABLE_CREATION:Ljava/lang/String; = "CREATE TABLE IF NOT EXISTS status (_id INTEGER PRIMARY KEY, time BIGINT , dev TEXT NOT NULL, src TEXT,  dest TEXT, state TEXT NOT NULL, status TEXT, info TEXT, Repository TEXT, reportingTag TEXT, trackingId TEXT, srcSha1 TEXT NOT NULL, targetSha1 TEXT NOT NULL, updateVia INT NOT NULL)"

.field private static final STATUS_TABLE_FORMAT:Ljava/lang/String; = "(_id INTEGER PRIMARY KEY, time BIGINT , dev TEXT NOT NULL, src TEXT,  dest TEXT, state TEXT NOT NULL, status TEXT, info TEXT, Repository TEXT, reportingTag TEXT, trackingId TEXT, srcSha1 TEXT NOT NULL, targetSha1 TEXT NOT NULL, updateVia INT NOT NULL)"

.field private static final STATUS_TABLE_NAME:Ljava/lang/String; = "status"

.field private static final VERSION:I = 0x5

.field private static final VERSION_TABLE_FORMAT:Ljava/lang/String; = "(Time INT, Version TEXT NOT NULL PRIMARY KEY, State TEXT NOT NULL DEFAULT \'Notified\', Repository TEXT ,Metadata  BLOB, Status TEXT, Info TEXT, Dirty BOOLEAN DEFAULT true, updateVia INT NOT NULL)"

.field private static final VERSION_TABLE_NAME:Ljava/lang/String; = "vt"

.field private static final VT_TABLE_CREATION:Ljava/lang/String; = "CREATE TABLE IF NOT EXISTS vt (Time INT, Version TEXT NOT NULL PRIMARY KEY, State TEXT NOT NULL DEFAULT \'Notified\', Repository TEXT ,Metadata  BLOB, Status TEXT, Info TEXT, Dirty BOOLEAN DEFAULT true, updateVia INT NOT NULL)"


# instance fields
.field private final _db:Landroid/database/sqlite/SQLiteDatabase;

.field private mUpdateViaSha1:I


# direct methods
.method public constructor <init>(Ljava/lang/String;Landroid/content/Context;)V
    .locals 2

    const/4 v0, 0x0

    const/4 v1, 0x5

    invoke-direct {p0, p2, p1, v0, v1}, Landroid/database/sqlite/SQLiteOpenHelper;-><init>(Landroid/content/Context;Ljava/lang/String;Landroid/database/sqlite/SQLiteDatabase$CursorFactory;I)V

    const/4 p1, 0x0

    iput p1, p0, Lcom/motorola/otalib/common/Environment/AndroidDB;->mUpdateViaSha1:I

    sget-object p1, Lcom/motorola/otalib/common/CommonLogger;->TAG:Ljava/lang/String;

    const-string p2, "CusAndroidDB.CusAndroidDB"

    invoke-static {p1, p2}, Lcom/motorola/otalib/common/CommonLogger;->d(Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {p0}, Lcom/motorola/otalib/common/Environment/AndroidDB;->getWritableDatabase()Landroid/database/sqlite/SQLiteDatabase;

    move-result-object p1

    iput-object p1, p0, Lcom/motorola/otalib/common/Environment/AndroidDB;->_db:Landroid/database/sqlite/SQLiteDatabase;

    return-void
.end method

.method private createTable(Landroid/database/sqlite/SQLiteDatabase;)Z
    .locals 2

    :try_start_0
    const-string p0, "CREATE TABLE IF NOT EXISTS vt (Time INT, Version TEXT NOT NULL PRIMARY KEY, State TEXT NOT NULL DEFAULT \'Notified\', Repository TEXT ,Metadata  BLOB, Status TEXT, Info TEXT, Dirty BOOLEAN DEFAULT true, updateVia INT NOT NULL)"

    invoke-virtual {p1, p0}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    const-string p0, "CREATE TABLE IF NOT EXISTS status (_id INTEGER PRIMARY KEY, time BIGINT , dev TEXT NOT NULL, src TEXT,  dest TEXT, state TEXT NOT NULL, status TEXT, info TEXT, Repository TEXT, reportingTag TEXT, trackingId TEXT, srcSha1 TEXT NOT NULL, targetSha1 TEXT NOT NULL, updateVia INT NOT NULL)"

    invoke-virtual {p1, p0}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V
    :try_end_0
    .catch Landroid/database/SQLException; {:try_start_0 .. :try_end_0} :catch_0

    const/4 p0, 0x1

    return p0

    :catch_0
    move-exception p0

    sget-object p1, Lcom/motorola/otalib/common/CommonLogger;->TAG:Ljava/lang/String;

    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "CusAndroidDB.createTable failed: exception"

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-static {p1, p0}, Lcom/motorola/otalib/common/CommonLogger;->e(Ljava/lang/String;Ljava/lang/String;)V

    const/4 p0, 0x0

    return p0
.end method

.method private exec(Ljava/lang/String;)Z
    .locals 3

    :try_start_0
    sget-object v0, Lcom/motorola/otalib/common/CommonLogger;->TAG:Ljava/lang/String;

    const-string v1, "exec %s"

    filled-new-array {p1}, [Ljava/lang/Object;

    move-result-object v2

    invoke-static {v1, v2}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/motorola/otalib/common/CommonLogger;->d(Ljava/lang/String;Ljava/lang/String;)V

    iget-object p0, p0, Lcom/motorola/otalib/common/Environment/AndroidDB;->_db:Landroid/database/sqlite/SQLiteDatabase;

    invoke-virtual {p0, p1}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V
    :try_end_0
    .catch Landroid/database/SQLException; {:try_start_0 .. :try_end_0} :catch_0

    const/4 p0, 0x1

    return p0

    :catch_0
    move-exception p0

    sget-object v0, Lcom/motorola/otalib/common/CommonLogger;->TAG:Ljava/lang/String;

    invoke-virtual {p0}, Landroid/database/SQLException;->toString()Ljava/lang/String;

    move-result-object p0

    filled-new-array {p1, p0}, [Ljava/lang/Object;

    move-result-object p0

    const-string p1, "CusAndroidDB.exec failed: %s : %s"

    invoke-static {p1, p0}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p0

    invoke-static {v0, p0}, Lcom/motorola/otalib/common/CommonLogger;->e(Ljava/lang/String;Ljava/lang/String;)V

    const/4 p0, 0x0

    return p0
.end method

.method private exec(Ljava/lang/String;[Ljava/lang/Object;)Z
    .locals 3

    :try_start_0
    sget-object v0, Lcom/motorola/otalib/common/CommonLogger;->TAG:Ljava/lang/String;

    const-string v1, "exec %s data"

    filled-new-array {p1}, [Ljava/lang/Object;

    move-result-object v2

    invoke-static {v1, v2}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/motorola/otalib/common/CommonLogger;->d(Ljava/lang/String;Ljava/lang/String;)V

    iget-object p0, p0, Lcom/motorola/otalib/common/Environment/AndroidDB;->_db:Landroid/database/sqlite/SQLiteDatabase;

    invoke-virtual {p0, p1, p2}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;[Ljava/lang/Object;)V
    :try_end_0
    .catch Landroid/database/SQLException; {:try_start_0 .. :try_end_0} :catch_0

    const/4 p0, 0x1

    return p0

    :catch_0
    move-exception p0

    sget-object p2, Lcom/motorola/otalib/common/CommonLogger;->TAG:Ljava/lang/String;

    invoke-virtual {p0}, Landroid/database/SQLException;->toString()Ljava/lang/String;

    move-result-object p0

    filled-new-array {p1, p0}, [Ljava/lang/Object;

    move-result-object p0

    const-string p1, "CusAndroidDB.exec failed: %s : %s"

    invoke-static {p1, p0}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p0

    invoke-static {p2, p0}, Lcom/motorola/otalib/common/CommonLogger;->e(Ljava/lang/String;Ljava/lang/String;)V

    const/4 p0, 0x0

    return p0
.end method

.method private static getTime()J
    .locals 2

    new-instance v0, Ljava/util/Date;

    invoke-direct {v0}, Ljava/util/Date;-><init>()V

    invoke-virtual {v0}, Ljava/util/Date;->getTime()J

    move-result-wide v0

    return-wide v0
.end method

.method private get_statusInternal(Ljava/lang/String;)Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database$Status;
    .locals 18

    const-string v1, "AndroidDB.getStatus, exception : "

    const/4 v2, 0x0

    move-object/from16 v0, p0

    :try_start_0
    iget-object v3, v0, Lcom/motorola/otalib/common/Environment/AndroidDB;->_db:Landroid/database/sqlite/SQLiteDatabase;

    move-object/from16 v4, p1

    invoke-virtual {v3, v4, v2}, Landroid/database/sqlite/SQLiteDatabase;->rawQuery(Ljava/lang/String;[Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v3
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_1
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    :try_start_1
    invoke-interface {v3}, Landroid/database/Cursor;->getCount()I

    move-result v4

    if-nez v4, :cond_0

    invoke-interface {v3}, Landroid/database/Cursor;->close()V

    return-object v2

    :cond_0
    invoke-interface {v3}, Landroid/database/Cursor;->moveToNext()Z

    const-string v4, "_id"

    invoke-interface {v3, v4}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v4

    invoke-interface {v3, v4}, Landroid/database/Cursor;->getInt(I)I

    move-result v5

    const-string v4, "time"

    invoke-interface {v3, v4}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v4

    invoke-interface {v3, v4}, Landroid/database/Cursor;->getLong(I)J

    move-result-wide v6

    const-string v4, "dev"

    invoke-interface {v3, v4}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v4

    invoke-interface {v3, v4}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v15

    const-string v4, "src"

    invoke-interface {v3, v4}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v4

    invoke-interface {v3, v4}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    const-string v4, "dest"

    invoke-interface {v3, v4}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v4

    invoke-interface {v3, v4}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    const-string v4, "state"

    invoke-interface {v3, v4}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v4

    invoke-interface {v3, v4}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v8

    const-string v4, "status"

    invoke-interface {v3, v4}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v4

    invoke-interface {v3, v4}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v9

    const-string v4, "info"

    invoke-interface {v3, v4}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v4

    invoke-interface {v3, v4}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v10

    const-string v4, "Repository"

    invoke-interface {v3, v4}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v4

    invoke-interface {v3, v4}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v11

    const-string v4, "reportingTag"

    invoke-interface {v3, v4}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v4

    invoke-interface {v3, v4}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v12

    const-string v4, "trackingId"

    invoke-interface {v3, v4}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v4

    invoke-interface {v3, v4}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v13

    const-string v4, "srcSha1"

    invoke-interface {v3, v4}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v4

    invoke-interface {v3, v4}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v14

    const-string v4, "targetSha1"

    invoke-interface {v3, v4}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v4

    invoke-interface {v3, v4}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v16

    const-string v4, "updateVia"

    invoke-interface {v3, v4}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v4

    invoke-interface {v3, v4}, Landroid/database/Cursor;->getInt(I)I

    invoke-interface {v3}, Landroid/database/Cursor;->close()V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    :try_start_2
    new-instance v17, Lcom/motorola/otalib/common/Environment/AndroidDB$2;

    move-object/from16 v3, v17

    move-object/from16 v4, p0

    invoke-direct/range {v3 .. v16}, Lcom/motorola/otalib/common/Environment/AndroidDB$2;-><init>(Lcom/motorola/otalib/common/Environment/AndroidDB;IJLjava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_1
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    return-object v17

    :catch_0
    move-exception v0

    goto :goto_0

    :catchall_0
    move-exception v0

    goto :goto_1

    :catch_1
    move-exception v0

    move-object v3, v2

    :goto_0
    :try_start_3
    sget-object v4, Lcom/motorola/otalib/common/CommonLogger;->TAG:Ljava/lang/String;

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v5, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v4, v0}, Lcom/motorola/otalib/common/CommonLogger;->e(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_1

    if-eqz v3, :cond_1

    invoke-interface {v3}, Landroid/database/Cursor;->close()V

    :cond_1
    return-object v2

    :catchall_1
    move-exception v0

    move-object v2, v3

    :goto_1
    if-eqz v2, :cond_2

    invoke-interface {v2}, Landroid/database/Cursor;->close()V

    :cond_2
    throw v0
.end method

.method private insert_status(JLjava/lang/String;Lcom/motorola/otalib/common/metaData/MetaData;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Z
    .locals 14

    invoke-virtual/range {p4 .. p4}, Lcom/motorola/otalib/common/metaData/MetaData;->getMinVersion()Ljava/lang/String;

    move-result-object v4

    invoke-virtual/range {p4 .. p4}, Lcom/motorola/otalib/common/metaData/MetaData;->getVersion()Ljava/lang/String;

    move-result-object v5

    invoke-virtual/range {p4 .. p4}, Lcom/motorola/otalib/common/metaData/MetaData;->getSourceSha1()Ljava/lang/String;

    move-result-object v12

    invoke-virtual/range {p4 .. p4}, Lcom/motorola/otalib/common/metaData/MetaData;->getTargetSha1()Ljava/lang/String;

    move-result-object v13

    move-object v0, p0

    move-wide v1, p1

    move-object/from16 v3, p3

    move-object/from16 v6, p5

    move-object/from16 v7, p6

    move-object/from16 v8, p7

    move-object/from16 v9, p8

    move-object/from16 v10, p9

    move-object/from16 v11, p10

    invoke-direct/range {v0 .. v13}, Lcom/motorola/otalib/common/Environment/AndroidDB;->insert_status(JLjava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Z

    move-result v0

    return v0
.end method

.method private insert_status(JLjava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Z
    .locals 11

    move-object v3, p3

    move-object v0, p0

    invoke-virtual {p0, p3}, Lcom/motorola/otalib/common/Environment/AndroidDB;->getDescription(Ljava/lang/String;)Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database$Descriptor;

    move-result-object v1

    if-nez v1, :cond_0

    sget-object v0, Lcom/motorola/otalib/common/CommonLogger;->TAG:Ljava/lang/String;

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "CusAndroidDB.insert_status failed: no description for version "

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/motorola/otalib/common/CommonLogger;->e(Ljava/lang/String;Ljava/lang/String;)V

    const/4 v0, 0x0

    return v0

    :cond_0
    invoke-interface {v1}, Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database$Descriptor;->getMeta()Lcom/motorola/otalib/common/metaData/MetaData;

    move-result-object v4

    invoke-interface {v1}, Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database$Descriptor;->getRepository()Ljava/lang/String;

    move-result-object v8

    invoke-interface {v1}, Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database$Descriptor;->getMeta()Lcom/motorola/otalib/common/metaData/MetaData;

    move-result-object v2

    invoke-virtual {v2}, Lcom/motorola/otalib/common/metaData/MetaData;->getReportingTags()Ljava/lang/String;

    move-result-object v9

    invoke-interface {v1}, Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database$Descriptor;->getMeta()Lcom/motorola/otalib/common/metaData/MetaData;

    move-result-object v1

    invoke-virtual {v1}, Lcom/motorola/otalib/common/metaData/MetaData;->getTrackingId()Ljava/lang/String;

    move-result-object v10

    move-object v0, p0

    move-wide v1, p1

    move-object v3, p3

    move-object v5, p4

    move-object/from16 v6, p5

    move-object/from16 v7, p6

    invoke-direct/range {v0 .. v10}, Lcom/motorola/otalib/common/Environment/AndroidDB;->insert_status(JLjava/lang/String;Lcom/motorola/otalib/common/metaData/MetaData;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Z

    move-result v0

    return v0
.end method

.method private insert_status(JLjava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Z
    .locals 15

    move-object v0, p0

    const-string v1, "status"

    invoke-static/range {p1 .. p2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v2

    filled-new-array {v1, v2}, [Ljava/lang/Object;

    move-result-object v1

    const-string v2, "insert into %s (_id, time, dev, src, dest, state, status, info, Repository, reportingTag, trackingId, srcSha1, targetSha1, updateVia) values (NULL, %s, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)"

    invoke-static {v2, v1}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    iget v2, v0, Lcom/motorola/otalib/common/Environment/AndroidDB;->mUpdateViaSha1:I

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v14

    move-object/from16 v3, p3

    move-object/from16 v4, p4

    move-object/from16 v5, p5

    move-object/from16 v6, p6

    move-object/from16 v7, p7

    move-object/from16 v8, p8

    move-object/from16 v9, p9

    move-object/from16 v10, p10

    move-object/from16 v11, p11

    move-object/from16 v12, p12

    move-object/from16 v13, p13

    filled-new-array/range {v3 .. v14}, [Ljava/lang/Object;

    move-result-object v2

    invoke-direct {p0, v1, v2}, Lcom/motorola/otalib/common/Environment/AndroidDB;->exec(Ljava/lang/String;[Ljava/lang/Object;)Z

    move-result v0

    return v0
.end method

.method private insert_version(JLjava/lang/String;Ljava/lang/String;Ljava/lang/String;Lcom/motorola/otalib/common/metaData/MetaData;Ljava/lang/String;Ljava/lang/String;)Z
    .locals 11

    move-object v0, p0

    :try_start_0
    invoke-static/range {p6 .. p6}, Lcom/motorola/otalib/common/metaData/builder/MetaDataBuilder;->toJSONString(Lcom/motorola/otalib/common/metaData/MetaData;)Ljava/lang/String;

    move-result-object v1

    const-string v2, "\'"

    const-string v3, "\'\'"

    invoke-virtual {v1, v2, v3}, Ljava/lang/String;->replaceAll(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    const-string v1, "insert into %s values (%s, ?,?,?,?,?,?,\'false\',?)"

    const-string v2, "vt"

    const-wide/16 v3, 0x3e8

    div-long v3, p1, v3

    long-to-int v3, v3

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    filled-new-array {v2, v3}, [Ljava/lang/Object;

    move-result-object v2

    invoke-static {v1, v2}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    iget v2, v0, Lcom/motorola/otalib/common/Environment/AndroidDB;->mUpdateViaSha1:I

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v10

    move-object v4, p3

    move-object v5, p4

    move-object/from16 v6, p5

    move-object/from16 v8, p7

    move-object/from16 v9, p8

    filled-new-array/range {v4 .. v10}, [Ljava/lang/Object;

    move-result-object v2

    invoke-direct {p0, v1, v2}, Lcom/motorola/otalib/common/Environment/AndroidDB;->exec(Ljava/lang/String;[Ljava/lang/Object;)Z

    move-result v0
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    return v0

    :catch_0
    move-exception v0

    sget-object v1, Lcom/motorola/otalib/common/CommonLogger;->TAG:Ljava/lang/String;

    new-instance v2, Ljava/lang/StringBuilder;

    const-string v3, "Caught JSON exception while inserting version"

    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v1, v0}, Lcom/motorola/otalib/common/CommonLogger;->e(Ljava/lang/String;Ljava/lang/String;)V

    const/4 v0, 0x0

    return v0
.end method

.method private isColumnExist(Landroid/database/sqlite/SQLiteDatabase;Ljava/lang/String;Ljava/lang/String;)Z
    .locals 2

    const/4 p0, 0x0

    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object p0

    const/4 v0, 0x0

    :try_start_0
    const-string v1, "select * from %s  LIMIT 0,1"

    filled-new-array {p3}, [Ljava/lang/Object;

    move-result-object p3

    invoke-static {v1, p3}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p3

    invoke-virtual {p1, p3, v0}, Landroid/database/sqlite/SQLiteDatabase;->rawQuery(Ljava/lang/String;[Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v0

    if-eqz v0, :cond_0

    invoke-interface {v0, p2}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result p1

    const/4 p3, -0x1

    if-eq p1, p3, :cond_0

    sget-object p1, Lcom/motorola/otalib/common/CommonLogger;->TAG:Ljava/lang/String;

    const-string p3, "CusAndroidDB.isColumnExist: %s column exists."

    filled-new-array {p2}, [Ljava/lang/Object;

    move-result-object v1

    invoke-static {p3, v1}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p3

    invoke-static {p1, p3}, Lcom/motorola/otalib/common/CommonLogger;->d(Ljava/lang/String;Ljava/lang/String;)V

    const/4 p1, 0x1

    invoke-static {p1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object p0
    :try_end_0
    .catch Landroid/database/SQLException; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    :cond_0
    if-eqz v0, :cond_1

    :goto_0
    invoke-interface {v0}, Landroid/database/Cursor;->close()V

    goto :goto_1

    :catchall_0
    move-exception p0

    goto :goto_2

    :catch_0
    move-exception p1

    :try_start_1
    sget-object p3, Lcom/motorola/otalib/common/CommonLogger;->TAG:Ljava/lang/String;

    const-string v1, "SQLiteDatabse.rawQuery failed for: %s : %s"

    invoke-virtual {p1}, Landroid/database/SQLException;->toString()Ljava/lang/String;

    move-result-object p1

    filled-new-array {p2, p1}, [Ljava/lang/Object;

    move-result-object p1

    invoke-static {v1, p1}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p1

    invoke-static {p3, p1}, Lcom/motorola/otalib/common/CommonLogger;->e(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    if-eqz v0, :cond_1

    goto :goto_0

    :cond_1
    :goto_1
    invoke-virtual {p0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result p0

    return p0

    :goto_2
    if-eqz v0, :cond_2

    invoke-interface {v0}, Landroid/database/Cursor;->close()V

    :cond_2
    throw p0
.end method

.method private reCreateTable(Landroid/database/sqlite/SQLiteDatabase;Ljava/lang/String;Ljava/lang/String;)V
    .locals 2

    sget-object p0, Lcom/motorola/otalib/common/CommonLogger;->TAG:Ljava/lang/String;

    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, " reCreateTable "

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, " "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {p0, v0}, Lcom/motorola/otalib/common/CommonLogger;->d(Ljava/lang/String;Ljava/lang/String;)V

    new-instance p0, Ljava/lang/StringBuilder;

    const-string v0, "ALTER TABLE "

    invoke-direct {p0, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p0, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p0

    const-string v0, " RENAME TO "

    invoke-virtual {p0, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p0

    invoke-virtual {p0, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p0

    const-string v0, "_old;"

    invoke-virtual {p0, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-virtual {p1, p0}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    sget-object p0, Lcom/motorola/otalib/common/CommonLogger;->TAG:Ljava/lang/String;

    const-string v1, " renamed old table "

    invoke-static {p0, v1}, Lcom/motorola/otalib/common/CommonLogger;->v(Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {p1, p2}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    sget-object p0, Lcom/motorola/otalib/common/CommonLogger;->TAG:Ljava/lang/String;

    const-string p2, " created new table"

    invoke-static {p0, p2}, Lcom/motorola/otalib/common/CommonLogger;->v(Ljava/lang/String;Ljava/lang/String;)V

    new-instance p0, Ljava/lang/StringBuilder;

    const-string p2, "INSERT INTO "

    invoke-direct {p0, p2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p0, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p0

    const-string p2, " SELECT * FROM "

    invoke-virtual {p0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p0

    invoke-virtual {p0, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p0

    invoke-virtual {p0, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-virtual {p1, p0}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    sget-object p0, Lcom/motorola/otalib/common/CommonLogger;->TAG:Ljava/lang/String;

    const-string p2, " added values"

    invoke-static {p0, p2}, Lcom/motorola/otalib/common/CommonLogger;->v(Ljava/lang/String;Ljava/lang/String;)V

    new-instance p0, Ljava/lang/StringBuilder;

    const-string p2, "DROP TABLE "

    invoke-direct {p0, p2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p0, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p0

    invoke-virtual {p0, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-virtual {p1, p0}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    sget-object p0, Lcom/motorola/otalib/common/CommonLogger;->TAG:Ljava/lang/String;

    const-string p1, " drop old table"

    invoke-static {p0, p1}, Lcom/motorola/otalib/common/CommonLogger;->v(Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method

.method private update_version(JLjava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Z
    .locals 3

    const-wide/16 v0, 0x3e8

    const-string v2, "vt"

    if-nez p6, :cond_0

    div-long/2addr p1, v0

    long-to-int p1, p1

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p1

    filled-new-array {v2, p1, p4, p5, p3}, [Ljava/lang/Object;

    move-result-object p1

    const-string p2, "update %s set Time=%s, State=\'%s\', Status=\'%s\', Dirty=\'false\' where Version=\'%s\'"

    invoke-static {p2, p1}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p1

    invoke-direct {p0, p1}, Lcom/motorola/otalib/common/Environment/AndroidDB;->exec(Ljava/lang/String;)Z

    move-result p0

    return p0

    :cond_0
    div-long/2addr p1, v0

    long-to-int p1, p1

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p1

    filled-new-array {v2, p1, p4, p5, p3}, [Ljava/lang/Object;

    move-result-object p1

    const-string p2, "update %s set Time=%s, State=\'%s\', Status=\'%s\', Info=?, Dirty=\'false\' where Version=\'%s\'"

    invoke-static {p2, p1}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p1

    filled-new-array {p6}, [Ljava/lang/Object;

    move-result-object p2

    invoke-direct {p0, p1, p2}, Lcom/motorola/otalib/common/Environment/AndroidDB;->exec(Ljava/lang/String;[Ljava/lang/Object;)Z

    move-result p0

    return p0
.end method


# virtual methods
.method public clear_status()V
    .locals 2

    const-string v0, "status"

    filled-new-array {v0}, [Ljava/lang/Object;

    move-result-object v0

    const-string v1, "delete from %s"

    invoke-static {v1, v0}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    invoke-direct {p0, v0}, Lcom/motorola/otalib/common/Environment/AndroidDB;->exec(Ljava/lang/String;)Z

    return-void
.end method

.method public getDescription(Ljava/lang/String;)Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database$Descriptor;
    .locals 13

    const-string v0, "AndroidDB.getDescription, exception : "

    const/4 v1, 0x0

    :try_start_0
    iget-object v2, p0, Lcom/motorola/otalib/common/Environment/AndroidDB;->_db:Landroid/database/sqlite/SQLiteDatabase;

    const-string v3, "select * from %s where Version=\'%s\'"

    const-string v4, "vt"

    filled-new-array {v4, p1}, [Ljava/lang/Object;

    move-result-object v4

    invoke-static {v3, v4}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3, v1}, Landroid/database/sqlite/SQLiteDatabase;->rawQuery(Ljava/lang/String;[Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v2
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_1
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    :try_start_1
    invoke-interface {v2}, Landroid/database/Cursor;->getCount()I

    move-result v3

    if-nez v3, :cond_0

    invoke-interface {v2}, Landroid/database/Cursor;->close()V

    return-object v1

    :cond_0
    invoke-interface {v2}, Landroid/database/Cursor;->moveToNext()Z

    const-string v3, "State"

    invoke-interface {v2, v3}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v3

    invoke-interface {v2, v3}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v3

    invoke-static {v3}, Lcom/motorola/otalib/common/Environment/ApplicationEnv$PackageState;->valueOf(Ljava/lang/String;)Lcom/motorola/otalib/common/Environment/ApplicationEnv$PackageState;

    move-result-object v7

    const-string v3, "Time"

    invoke-interface {v2, v3}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v3

    invoke-interface {v2, v3}, Landroid/database/Cursor;->getInt(I)I

    move-result v8

    const-string v3, "Info"

    invoke-interface {v2, v3}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v3

    invoke-interface {v2, v3}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v9

    const-string v3, "Metadata"

    invoke-interface {v2, v3}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v3

    invoke-interface {v2, v3}, Landroid/database/Cursor;->getType(I)I

    move-result v4

    const/4 v5, 0x4

    if-ne v4, v5, :cond_1

    new-instance v4, Ljava/lang/String;

    invoke-interface {v2, v3}, Landroid/database/Cursor;->getBlob(I)[B

    move-result-object v3

    invoke-direct {v4, v3}, Ljava/lang/String;-><init>([B)V

    goto :goto_0

    :cond_1
    invoke-interface {v2, v3}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v4

    :goto_0
    const-string v3, "\'\'"

    const-string v5, "\'"

    invoke-virtual {v4, v3, v5}, Ljava/lang/String;->replaceAll(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-static {v3}, Lcom/motorola/otalib/common/metaData/builder/MetaDataBuilder;->from(Ljava/lang/String;)Lcom/motorola/otalib/common/metaData/MetaData;

    move-result-object v10

    const-string v3, "Repository"

    invoke-interface {v2, v3}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v3

    invoke-interface {v2, v3}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v11

    const-string v3, "Status"

    invoke-interface {v2, v3}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v3

    invoke-interface {v2, v3}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v12

    const-string v3, "Dirty"

    invoke-interface {v2, v3}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v3

    invoke-interface {v2, v3}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v3

    invoke-static {v3}, Ljava/lang/Boolean;->valueOf(Ljava/lang/String;)Ljava/lang/Boolean;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/Boolean;->booleanValue()Z

    const-string v3, "updateVia"

    invoke-interface {v2, v3}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v3

    invoke-interface {v2, v3}, Landroid/database/Cursor;->getInt(I)I

    invoke-interface {v2}, Landroid/database/Cursor;->close()V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    :try_start_2
    new-instance v2, Lcom/motorola/otalib/common/Environment/AndroidDB$1;

    move-object v4, v2

    move-object v5, p0

    move-object v6, p1

    invoke-direct/range {v4 .. v12}, Lcom/motorola/otalib/common/Environment/AndroidDB$1;-><init>(Lcom/motorola/otalib/common/Environment/AndroidDB;Ljava/lang/String;Lcom/motorola/otalib/common/Environment/ApplicationEnv$PackageState;ILjava/lang/String;Lcom/motorola/otalib/common/metaData/MetaData;Ljava/lang/String;Ljava/lang/String;)V
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_1
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    return-object v2

    :catch_0
    move-exception p0

    goto :goto_1

    :catchall_0
    move-exception p0

    goto :goto_2

    :catch_1
    move-exception p0

    move-object v2, v1

    :goto_1
    :try_start_3
    sget-object p1, Lcom/motorola/otalib/common/CommonLogger;->TAG:Ljava/lang/String;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v3, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-static {p1, p0}, Lcom/motorola/otalib/common/CommonLogger;->e(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_1

    if-eqz v2, :cond_2

    invoke-interface {v2}, Landroid/database/Cursor;->close()V

    :cond_2
    return-object v1

    :catchall_1
    move-exception p0

    move-object v1, v2

    :goto_2
    if-eqz v1, :cond_3

    invoke-interface {v1}, Landroid/database/Cursor;->close()V

    :cond_3
    throw p0
.end method

.method public getVersions()Ljava/util/List;
    .locals 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    const/4 v0, 0x0

    :try_start_0
    iget-object p0, p0, Lcom/motorola/otalib/common/Environment/AndroidDB;->_db:Landroid/database/sqlite/SQLiteDatabase;

    const-string v1, "select Version from %s"

    const-string v2, "vt"

    filled-new-array {v2}, [Ljava/lang/Object;

    move-result-object v2

    invoke-static {v1, v2}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p0, v1, v0}, Landroid/database/sqlite/SQLiteDatabase;->rawQuery(Ljava/lang/String;[Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object p0
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_1
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    :try_start_1
    invoke-interface {p0}, Landroid/database/Cursor;->getCount()I

    move-result v1

    if-nez v1, :cond_0

    invoke-interface {p0}, Landroid/database/Cursor;->close()V

    return-object v0

    :cond_0
    new-instance v1, Ljava/util/LinkedList;

    invoke-direct {v1}, Ljava/util/LinkedList;-><init>()V

    :goto_0
    invoke-interface {p0}, Landroid/database/Cursor;->moveToNext()Z

    move-result v2

    if-eqz v2, :cond_1

    const-string v2, "Version"

    invoke-interface {p0, v2}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v2

    invoke-interface {p0, v2}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/util/LinkedList;->add(Ljava/lang/Object;)Z

    goto :goto_0

    :cond_1
    invoke-interface {p0}, Landroid/database/Cursor;->close()V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    return-object v1

    :catch_0
    move-exception v1

    goto :goto_1

    :catchall_0
    move-exception p0

    move-object v5, v0

    move-object v0, p0

    move-object p0, v5

    goto :goto_2

    :catch_1
    move-exception v1

    move-object p0, v0

    :goto_1
    :try_start_2
    sget-object v2, Lcom/motorola/otalib/common/CommonLogger;->TAG:Ljava/lang/String;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "AndriodDB.getVersions, exception : "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v2, v1}, Lcom/motorola/otalib/common/CommonLogger;->e(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    if-eqz p0, :cond_2

    invoke-interface {p0}, Landroid/database/Cursor;->close()V

    :cond_2
    return-object v0

    :catchall_1
    move-exception v0

    :goto_2
    if-eqz p0, :cond_3

    invoke-interface {p0}, Landroid/database/Cursor;->close()V

    :cond_3
    throw v0
.end method

.method public get_status()Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database$Status;
    .locals 2

    const-string v0, "status"

    filled-new-array {v0}, [Ljava/lang/Object;

    move-result-object v0

    const-string v1, "select * from %s ORDER BY _id LIMIT 1"

    invoke-static {v1, v0}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    invoke-direct {p0, v0}, Lcom/motorola/otalib/common/Environment/AndroidDB;->get_statusInternal(Ljava/lang/String;)Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database$Status;

    move-result-object p0

    return-object p0
.end method

.method public get_status(I)Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database$Status;
    .locals 1

    const-string v0, "status"

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p1

    filled-new-array {v0, p1}, [Ljava/lang/Object;

    move-result-object p1

    const-string v0, "select * from %s WHERE _id=%s"

    invoke-static {v0, p1}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p1

    invoke-direct {p0, p1}, Lcom/motorola/otalib/common/Environment/AndroidDB;->get_statusInternal(Ljava/lang/String;)Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database$Status;

    move-result-object p0

    return-object p0
.end method

.method public insert(Ljava/lang/String;Ljava/lang/String;Lcom/motorola/otalib/common/metaData/MetaData;Ljava/lang/String;Ljava/lang/String;)Z
    .locals 15

    move-object/from16 v0, p5

    invoke-static {}, Lcom/motorola/otalib/common/Environment/AndroidDB;->getTime()J

    move-result-wide v10

    sget-object v1, Lcom/motorola/otalib/common/Environment/ApplicationEnv$PackageState;->Notified:Lcom/motorola/otalib/common/Environment/ApplicationEnv$PackageState;

    invoke-virtual {v1}, Lcom/motorola/otalib/common/Environment/ApplicationEnv$PackageState;->toString()Ljava/lang/String;

    move-result-object v12

    const-string v13, "RS_TEMP_OK"

    move-object v1, p0

    move-wide v2, v10

    move-object/from16 v4, p1

    move-object v5, v12

    move-object/from16 v6, p2

    move-object/from16 v7, p3

    move-object v8, v13

    move-object/from16 v9, p4

    invoke-direct/range {v1 .. v9}, Lcom/motorola/otalib/common/Environment/AndroidDB;->insert_version(JLjava/lang/String;Ljava/lang/String;Ljava/lang/String;Lcom/motorola/otalib/common/metaData/MetaData;Ljava/lang/String;Ljava/lang/String;)Z

    move-result v1

    if-nez v1, :cond_0

    sget-object v0, Lcom/motorola/otalib/common/CommonLogger;->TAG:Ljava/lang/String;

    const-string v1, "CusAndroidDB.insert failed: insert_version"

    invoke-static {v0, v1}, Lcom/motorola/otalib/common/CommonLogger;->e(Ljava/lang/String;Ljava/lang/String;)V

    const/4 v0, 0x0

    return v0

    :cond_0
    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "Repository: "

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    move-object/from16 v8, p2

    invoke-virtual {v1, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "; Location: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    move-object/from16 v2, p4

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    if-eqz v0, :cond_1

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "; AddOnInfo: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    move-object v7, v0

    goto :goto_0

    :cond_1
    move-object v7, v1

    :goto_0
    invoke-virtual/range {p3 .. p3}, Lcom/motorola/otalib/common/metaData/MetaData;->getReportingTags()Ljava/lang/String;

    move-result-object v9

    invoke-virtual/range {p3 .. p3}, Lcom/motorola/otalib/common/metaData/MetaData;->getTrackingId()Ljava/lang/String;

    move-result-object v14

    move-object v0, p0

    move-wide v1, v10

    move-object/from16 v3, p1

    move-object/from16 v4, p3

    move-object v5, v12

    move-object v6, v13

    move-object/from16 v8, p2

    move-object v10, v14

    invoke-direct/range {v0 .. v10}, Lcom/motorola/otalib/common/Environment/AndroidDB;->insert_status(JLjava/lang/String;Lcom/motorola/otalib/common/metaData/MetaData;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_2

    sget-object v0, Lcom/motorola/otalib/common/CommonLogger;->TAG:Ljava/lang/String;

    const-string v1, "CusAndroidDB.insert failed: insert_status"

    invoke-static {v0, v1}, Lcom/motorola/otalib/common/CommonLogger;->e(Ljava/lang/String;Ljava/lang/String;)V

    :cond_2
    const/4 v0, 0x1

    return v0
.end method

.method public onCreate(Landroid/database/sqlite/SQLiteDatabase;)V
    .locals 2

    sget-object v0, Lcom/motorola/otalib/common/CommonLogger;->TAG:Ljava/lang/String;

    const-string v1, "CusAndroidDB.onCreate()"

    invoke-static {v0, v1}, Lcom/motorola/otalib/common/CommonLogger;->d(Ljava/lang/String;Ljava/lang/String;)V

    invoke-direct {p0, p1}, Lcom/motorola/otalib/common/Environment/AndroidDB;->createTable(Landroid/database/sqlite/SQLiteDatabase;)Z

    return-void
.end method

.method public onDowngrade(Landroid/database/sqlite/SQLiteDatabase;II)V
    .locals 3

    sget-object v0, Lcom/motorola/otalib/common/CommonLogger;->TAG:Ljava/lang/String;

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "CusAndroidDB.onDowngrade(), oldVersion: "

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object p2

    const-string v1, " newVersion: "

    invoke-virtual {p2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p2

    invoke-virtual {p2, p3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object p2

    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    invoke-static {v0, p2}, Lcom/motorola/otalib/common/CommonLogger;->d(Ljava/lang/String;Ljava/lang/String;)V

    const-string p2, "DROP TABLE IF EXISTS vt"

    invoke-virtual {p1, p2}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    sget-object p2, Lcom/motorola/otalib/common/CommonLogger;->TAG:Ljava/lang/String;

    const-string p3, "dropped vt"

    invoke-static {p2, p3}, Lcom/motorola/otalib/common/CommonLogger;->v(Ljava/lang/String;Ljava/lang/String;)V

    const-string p2, "DROP TABLE IF EXISTS status"

    invoke-virtual {p1, p2}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    sget-object p2, Lcom/motorola/otalib/common/CommonLogger;->TAG:Ljava/lang/String;

    const-string p3, "dropped status"

    invoke-static {p2, p3}, Lcom/motorola/otalib/common/CommonLogger;->v(Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {p0, p1}, Lcom/motorola/otalib/common/Environment/AndroidDB;->onCreate(Landroid/database/sqlite/SQLiteDatabase;)V

    return-void
.end method

.method public onUpgrade(Landroid/database/sqlite/SQLiteDatabase;II)V
    .locals 12

    const-string v0, ""

    const-string v1, "targetSha1"

    const-string v2, "srcSha1"

    const-string v3, "CREATE TABLE IF NOT EXISTS status (_id INTEGER PRIMARY KEY, time BIGINT , dev TEXT NOT NULL, src TEXT,  dest TEXT, state TEXT NOT NULL, status TEXT, info TEXT, Repository TEXT, reportingTag TEXT, trackingId TEXT, srcSha1 TEXT NOT NULL, targetSha1 TEXT NOT NULL, updateVia INT NOT NULL)"

    const-string v4, "CREATE TABLE IF NOT EXISTS vt (Time INT, Version TEXT NOT NULL PRIMARY KEY, State TEXT NOT NULL DEFAULT \'Notified\', Repository TEXT ,Metadata  BLOB, Status TEXT, Info TEXT, Dirty BOOLEAN DEFAULT true, updateVia INT NOT NULL)"

    const-string v5, "vt"

    const-string v6, "updateVia"

    const-string v7, "numbe of rows updated in status "

    const-string v8, "numbe of rows updated in vt "

    sget-object v9, Lcom/motorola/otalib/common/CommonLogger;->TAG:Ljava/lang/String;

    new-instance v10, Ljava/lang/StringBuilder;

    const-string v11, "CusAndroidDB.onUpgrade(), oldVersion: "

    invoke-direct {v10, v11}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v10, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v10

    const-string v11, " newVersion: "

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10, p3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object p3

    invoke-virtual {p3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p3

    invoke-static {v9, p3}, Lcom/motorola/otalib/common/CommonLogger;->d(Ljava/lang/String;Ljava/lang/String;)V

    :try_start_0
    invoke-virtual {p1, v4}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    invoke-virtual {p1, v3}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V
    :try_end_0
    .catch Landroid/database/SQLException; {:try_start_0 .. :try_end_0} :catch_0

    const/4 p3, 0x3

    const-string v9, "status"

    if-ne p2, p3, :cond_2

    :try_start_1
    const-string p2, "Repository"

    invoke-direct {p0, p1, p2, v9}, Lcom/motorola/otalib/common/Environment/AndroidDB;->isColumnExist(Landroid/database/sqlite/SQLiteDatabase;Ljava/lang/String;Ljava/lang/String;)Z

    move-result p2

    if-nez p2, :cond_0

    const-string p2, "ALTER TABLE status ADD COLUMN Repository TEXT"

    invoke-virtual {p1, p2}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    :cond_0
    const-string p2, "reportingTag"

    invoke-direct {p0, p1, p2, v9}, Lcom/motorola/otalib/common/Environment/AndroidDB;->isColumnExist(Landroid/database/sqlite/SQLiteDatabase;Ljava/lang/String;Ljava/lang/String;)Z

    move-result p2

    if-nez p2, :cond_1

    const-string p2, "ALTER TABLE status ADD COLUMN reportingTag TEXT"

    invoke-virtual {p1, p2}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    :cond_1
    const-string p2, "trackingId"

    invoke-direct {p0, p1, p2, v9}, Lcom/motorola/otalib/common/Environment/AndroidDB;->isColumnExist(Landroid/database/sqlite/SQLiteDatabase;Ljava/lang/String;Ljava/lang/String;)Z

    move-result p0

    if-nez p0, :cond_7

    const-string p0, "ALTER TABLE status ADD COLUMN trackingId TEXT"

    invoke-virtual {p1, p0}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    goto/16 :goto_0

    :cond_2
    const/4 p3, 0x4

    if-ne p2, p3, :cond_7

    invoke-direct {p0, p1, v2, v9}, Lcom/motorola/otalib/common/Environment/AndroidDB;->isColumnExist(Landroid/database/sqlite/SQLiteDatabase;Ljava/lang/String;Ljava/lang/String;)Z

    move-result p2

    if-nez p2, :cond_3

    const-string p2, "ALTER TABLE status ADD COLUMN srcSha1 TEXT"

    invoke-virtual {p1, p2}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    :cond_3
    invoke-direct {p0, p1, v1, v9}, Lcom/motorola/otalib/common/Environment/AndroidDB;->isColumnExist(Landroid/database/sqlite/SQLiteDatabase;Ljava/lang/String;Ljava/lang/String;)Z

    move-result p2

    if-nez p2, :cond_4

    const-string p2, "ALTER TABLE status ADD COLUMN targetSha1 TEXT"

    invoke-virtual {p1, p2}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    :cond_4
    invoke-direct {p0, p1, v6, v9}, Lcom/motorola/otalib/common/Environment/AndroidDB;->isColumnExist(Landroid/database/sqlite/SQLiteDatabase;Ljava/lang/String;Ljava/lang/String;)Z

    move-result p2

    if-nez p2, :cond_5

    const-string p2, "ALTER TABLE status ADD COLUMN updateVia INT"

    invoke-virtual {p1, p2}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    :cond_5
    invoke-direct {p0, p1, v6, v5}, Lcom/motorola/otalib/common/Environment/AndroidDB;->isColumnExist(Landroid/database/sqlite/SQLiteDatabase;Ljava/lang/String;Ljava/lang/String;)Z

    move-result p2

    if-nez p2, :cond_6

    const-string p2, "ALTER TABLE vt ADD COLUMN updateVia INT"

    invoke-virtual {p1, p2}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    :cond_6
    new-instance p2, Landroid/content/ContentValues;

    invoke-direct {p2}, Landroid/content/ContentValues;-><init>()V

    const/4 p3, 0x1

    invoke-static {p3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p3

    invoke-virtual {p2, v6, p3}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    const/4 p3, 0x0

    invoke-virtual {p1, v5, p2, p3, p3}, Landroid/database/sqlite/SQLiteDatabase;->update(Ljava/lang/String;Landroid/content/ContentValues;Ljava/lang/String;[Ljava/lang/String;)I

    move-result v6

    sget-object v10, Lcom/motorola/otalib/common/CommonLogger;->TAG:Ljava/lang/String;

    new-instance v11, Ljava/lang/StringBuilder;

    invoke-direct {v11, v8}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v11, v6}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-static {v10, v6}, Lcom/motorola/otalib/common/CommonLogger;->v(Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {p2, v2, v0}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {p2, v1, v0}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {p1, v9, p2, p3, p3}, Landroid/database/sqlite/SQLiteDatabase;->update(Ljava/lang/String;Landroid/content/ContentValues;Ljava/lang/String;[Ljava/lang/String;)I

    move-result p2

    sget-object p3, Lcom/motorola/otalib/common/CommonLogger;->TAG:Ljava/lang/String;

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0, v7}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object p2

    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    invoke-static {p3, p2}, Lcom/motorola/otalib/common/CommonLogger;->v(Ljava/lang/String;Ljava/lang/String;)V

    invoke-direct {p0, p1, v4, v5}, Lcom/motorola/otalib/common/Environment/AndroidDB;->reCreateTable(Landroid/database/sqlite/SQLiteDatabase;Ljava/lang/String;Ljava/lang/String;)V

    invoke-direct {p0, p1, v3, v9}, Lcom/motorola/otalib/common/Environment/AndroidDB;->reCreateTable(Landroid/database/sqlite/SQLiteDatabase;Ljava/lang/String;Ljava/lang/String;)V
    :try_end_1
    .catch Landroid/database/SQLException; {:try_start_1 .. :try_end_1} :catch_0

    goto :goto_0

    :catch_0
    move-exception p0

    sget-object p1, Lcom/motorola/otalib/common/CommonLogger;->TAG:Ljava/lang/String;

    new-instance p2, Ljava/lang/StringBuilder;

    const-string p3, "CusAndroidDB.onUpgrade failed: exception"

    invoke-direct {p2, p3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p2, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-static {p1, p0}, Lcom/motorola/otalib/common/CommonLogger;->e(Ljava/lang/String;Ljava/lang/String;)V

    :cond_7
    :goto_0
    return-void
.end method

.method public remove(Ljava/lang/String;)V
    .locals 1

    const-string v0, "vt"

    filled-new-array {v0, p1}, [Ljava/lang/Object;

    move-result-object p1

    const-string v0, "delete from %s where Version=\'%s\'"

    invoke-static {v0, p1}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p1

    invoke-direct {p0, p1}, Lcom/motorola/otalib/common/Environment/AndroidDB;->exec(Ljava/lang/String;)Z

    return-void
.end method

.method public remove_status(I)V
    .locals 1

    const-string v0, "status"

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p1

    filled-new-array {v0, p1}, [Ljava/lang/Object;

    move-result-object p1

    const-string v0, "delete from %s where _id=%s"

    invoke-static {v0, p1}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p1

    invoke-direct {p0, p1}, Lcom/motorola/otalib/common/Environment/AndroidDB;->exec(Ljava/lang/String;)Z

    return-void
.end method

.method public setState(Ljava/lang/String;Lcom/motorola/otalib/common/Environment/ApplicationEnv$PackageState;Ljava/lang/String;)Z
    .locals 6

    const/4 v3, 0x1

    const-string v5, ""

    move-object v0, p0

    move-object v1, p1

    move-object v2, p2

    move-object v4, p3

    invoke-virtual/range {v0 .. v5}, Lcom/motorola/otalib/common/Environment/AndroidDB;->setState(Ljava/lang/String;Lcom/motorola/otalib/common/Environment/ApplicationEnv$PackageState;ZLjava/lang/String;Ljava/lang/String;)Z

    move-result p0

    return p0
.end method

.method public setState(Ljava/lang/String;Lcom/motorola/otalib/common/Environment/ApplicationEnv$PackageState;ZLjava/lang/String;Ljava/lang/String;)Z
    .locals 9

    sget-object v0, Lcom/motorola/otalib/common/CommonLogger;->TAG:Ljava/lang/String;

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "vesion:"

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " state:"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " info:"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/motorola/otalib/common/CommonLogger;->i(Ljava/lang/String;Ljava/lang/String;)V

    sget-object v0, Lcom/motorola/otalib/common/Environment/ApplicationEnv$PackageState;->Result:Lcom/motorola/otalib/common/Environment/ApplicationEnv$PackageState;

    if-ne p2, v0, :cond_1

    if-eqz p3, :cond_0

    const-string p3, "RS_OK"

    goto :goto_0

    :cond_0
    const-string p3, "RS_FAIL"

    goto :goto_0

    :cond_1
    const-string p3, "RS_TEMP_OK"

    :goto_0
    invoke-static {}, Lcom/motorola/otalib/common/Environment/AndroidDB;->getTime()J

    move-result-wide v7

    invoke-virtual {p2}, Lcom/motorola/otalib/common/Environment/ApplicationEnv$PackageState;->toString()Ljava/lang/String;

    move-result-object v4

    move-object v0, p0

    move-wide v1, v7

    move-object v3, p1

    move-object v5, p3

    move-object v6, p4

    invoke-direct/range {v0 .. v6}, Lcom/motorola/otalib/common/Environment/AndroidDB;->update_version(JLjava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_2

    sget-object p0, Lcom/motorola/otalib/common/CommonLogger;->TAG:Ljava/lang/String;

    const-string p1, "CusAndroidDB.setState failed: update_version"

    invoke-static {p0, p1}, Lcom/motorola/otalib/common/CommonLogger;->e(Ljava/lang/String;Ljava/lang/String;)V

    const/4 p0, 0x0

    return p0

    :cond_2
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v0, p5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p5

    const-string v0, " : "

    invoke-virtual {p5, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p5

    invoke-virtual {p5, p4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p4

    invoke-virtual {p4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    sget-object p4, Lcom/motorola/otalib/common/CommonLogger;->TAG:Ljava/lang/String;

    new-instance p5, Ljava/lang/StringBuilder;

    const-string v0, "Status Info:"

    invoke-direct {p5, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p5

    invoke-virtual {p5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p5

    invoke-static {p4, p5}, Lcom/motorola/otalib/common/CommonLogger;->i(Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {p2}, Lcom/motorola/otalib/common/Environment/ApplicationEnv$PackageState;->toString()Ljava/lang/String;

    move-result-object v4

    move-object v0, p0

    move-wide v1, v7

    move-object v3, p1

    move-object v5, p3

    invoke-direct/range {v0 .. v6}, Lcom/motorola/otalib/common/Environment/AndroidDB;->insert_status(JLjava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Z

    move-result p0

    if-nez p0, :cond_3

    sget-object p0, Lcom/motorola/otalib/common/CommonLogger;->TAG:Ljava/lang/String;

    const-string p1, "CusAndroidDB.setState failed: insert_status"

    invoke-static {p0, p1}, Lcom/motorola/otalib/common/CommonLogger;->e(Ljava/lang/String;Ljava/lang/String;)V

    :cond_3
    const/4 p0, 0x1

    return p0
.end method

.method public setState(Ljava/lang/String;Lcom/motorola/otalib/common/Environment/ApplicationEnv$PackageState;ZLjava/lang/String;Ljava/lang/String;Ljava/lang/String;)Z
    .locals 15

    move-object/from16 v7, p1

    move-object/from16 v8, p2

    move-object/from16 v9, p4

    sget-object v0, Lcom/motorola/otalib/common/CommonLogger;->TAG:Ljava/lang/String;

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "vesion:"

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " state:"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " info:"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/motorola/otalib/common/CommonLogger;->i(Ljava/lang/String;Ljava/lang/String;)V

    sget-object v0, Lcom/motorola/otalib/common/Environment/ApplicationEnv$PackageState;->Result:Lcom/motorola/otalib/common/Environment/ApplicationEnv$PackageState;

    if-ne v8, v0, :cond_1

    if-eqz p3, :cond_0

    const-string v0, "RS_OK"

    goto :goto_0

    :cond_0
    const-string v0, "RS_FAIL"

    goto :goto_0

    :cond_1
    const-string v0, "RS_TEMP_OK"

    :goto_0
    move-object v10, v0

    invoke-static {}, Lcom/motorola/otalib/common/Environment/AndroidDB;->getTime()J

    move-result-wide v11

    invoke-virtual/range {p2 .. p2}, Lcom/motorola/otalib/common/Environment/ApplicationEnv$PackageState;->toString()Ljava/lang/String;

    move-result-object v4

    move-object v0, p0

    move-wide v1, v11

    move-object/from16 v3, p1

    move-object v5, v10

    move-object/from16 v6, p4

    invoke-direct/range {v0 .. v6}, Lcom/motorola/otalib/common/Environment/AndroidDB;->update_version(JLjava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Z

    move-result v0

    const/4 v1, 0x0

    if-nez v0, :cond_2

    sget-object v0, Lcom/motorola/otalib/common/CommonLogger;->TAG:Ljava/lang/String;

    const-string v2, "CusAndroidDB.setState failed: update_version"

    invoke-static {v0, v2}, Lcom/motorola/otalib/common/CommonLogger;->e(Ljava/lang/String;Ljava/lang/String;)V

    return v1

    :cond_2
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    move-object/from16 v2, p5

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v2, " : "

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    sget-object v0, Lcom/motorola/otalib/common/CommonLogger;->TAG:Ljava/lang/String;

    new-instance v2, Ljava/lang/StringBuilder;

    const-string v3, "Status Info:"

    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v2, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v0, v2}, Lcom/motorola/otalib/common/CommonLogger;->i(Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual/range {p0 .. p1}, Lcom/motorola/otalib/common/Environment/AndroidDB;->getDescription(Ljava/lang/String;)Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database$Descriptor;

    move-result-object v0

    if-nez v0, :cond_3

    sget-object v0, Lcom/motorola/otalib/common/CommonLogger;->TAG:Ljava/lang/String;

    new-instance v2, Ljava/lang/StringBuilder;

    const-string v3, "CusAndroidDB.insert_status failed: no description for version "

    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v2, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v0, v2}, Lcom/motorola/otalib/common/CommonLogger;->e(Ljava/lang/String;Ljava/lang/String;)V

    return v1

    :cond_3
    invoke-interface {v0}, Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database$Descriptor;->getMeta()Lcom/motorola/otalib/common/metaData/MetaData;

    move-result-object v4

    invoke-virtual/range {p2 .. p2}, Lcom/motorola/otalib/common/Environment/ApplicationEnv$PackageState;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-interface {v0}, Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database$Descriptor;->getMeta()Lcom/motorola/otalib/common/metaData/MetaData;

    move-result-object v1

    invoke-virtual {v1}, Lcom/motorola/otalib/common/metaData/MetaData;->getReportingTags()Ljava/lang/String;

    move-result-object v13

    invoke-interface {v0}, Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database$Descriptor;->getMeta()Lcom/motorola/otalib/common/metaData/MetaData;

    move-result-object v0

    invoke-virtual {v0}, Lcom/motorola/otalib/common/metaData/MetaData;->getTrackingId()Ljava/lang/String;

    move-result-object v14

    move-object v0, p0

    move-wide v1, v11

    move-object/from16 v3, p1

    move-object v6, v10

    move-object v7, v9

    move-object/from16 v8, p6

    move-object v9, v13

    move-object v10, v14

    invoke-direct/range {v0 .. v10}, Lcom/motorola/otalib/common/Environment/AndroidDB;->insert_status(JLjava/lang/String;Lcom/motorola/otalib/common/metaData/MetaData;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_4

    sget-object v0, Lcom/motorola/otalib/common/CommonLogger;->TAG:Ljava/lang/String;

    const-string v1, "CusAndroidDB.setState failed: insert_status"

    invoke-static {v0, v1}, Lcom/motorola/otalib/common/CommonLogger;->e(Ljava/lang/String;Ljava/lang/String;)V

    :cond_4
    const/4 v0, 0x1

    return v0
.end method

.method public setStatus(Ljava/lang/String;Lcom/motorola/otalib/common/metaData/MetaData;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .locals 14

    move-object/from16 v0, p6

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "Repository: "

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    move-object/from16 v2, p3

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v3, "; Location: "

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    move-object/from16 v3, p4

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    if-eqz v0, :cond_0

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v3, "; AddOnInfo: "

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    move-object v10, v0

    goto :goto_0

    :cond_0
    move-object v10, v1

    :goto_0
    invoke-static {}, Lcom/motorola/otalib/common/Environment/AndroidDB;->getTime()J

    move-result-wide v4

    sget-object v0, Lcom/motorola/otalib/common/Environment/ApplicationEnv$PackageState;->Notified:Lcom/motorola/otalib/common/Environment/ApplicationEnv$PackageState;

    invoke-virtual {v0}, Lcom/motorola/otalib/common/Environment/ApplicationEnv$PackageState;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-virtual/range {p2 .. p2}, Lcom/motorola/otalib/common/metaData/MetaData;->getReportingTags()Ljava/lang/String;

    move-result-object v12

    invoke-virtual/range {p2 .. p2}, Lcom/motorola/otalib/common/metaData/MetaData;->getTrackingId()Ljava/lang/String;

    move-result-object v13

    const-string v9, "RS_TEMP_OK"

    move-object v3, p0

    move-object v6, p1

    move-object/from16 v7, p2

    move-object/from16 v11, p3

    invoke-direct/range {v3 .. v13}, Lcom/motorola/otalib/common/Environment/AndroidDB;->insert_status(JLjava/lang/String;Lcom/motorola/otalib/common/metaData/MetaData;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_1

    sget-object v0, Lcom/motorola/otalib/common/CommonLogger;->TAG:Ljava/lang/String;

    const-string v1, "CusAndroidDB.setStatus failed to set Notify."

    invoke-static {v0, v1}, Lcom/motorola/otalib/common/CommonLogger;->e(Ljava/lang/String;Ljava/lang/String;)V

    return-void

    :cond_1
    invoke-static {}, Lcom/motorola/otalib/common/Environment/AndroidDB;->getTime()J

    move-result-wide v4

    sget-object v0, Lcom/motorola/otalib/common/Environment/ApplicationEnv$PackageState;->Result:Lcom/motorola/otalib/common/Environment/ApplicationEnv$PackageState;

    invoke-virtual {v0}, Lcom/motorola/otalib/common/Environment/ApplicationEnv$PackageState;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-virtual/range {p2 .. p2}, Lcom/motorola/otalib/common/metaData/MetaData;->getReportingTags()Ljava/lang/String;

    move-result-object v12

    invoke-virtual/range {p2 .. p2}, Lcom/motorola/otalib/common/metaData/MetaData;->getTrackingId()Ljava/lang/String;

    move-result-object v13

    const-string v9, "RS_FAIL"

    move-object v3, p0

    move-object v6, p1

    move-object/from16 v7, p2

    move-object/from16 v10, p5

    move-object/from16 v11, p3

    invoke-direct/range {v3 .. v13}, Lcom/motorola/otalib/common/Environment/AndroidDB;->insert_status(JLjava/lang/String;Lcom/motorola/otalib/common/metaData/MetaData;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_2

    sget-object v0, Lcom/motorola/otalib/common/CommonLogger;->TAG:Ljava/lang/String;

    const-string v1, "CusAndroidDB.setStatus failed to set Result."

    invoke-static {v0, v1}, Lcom/motorola/otalib/common/CommonLogger;->e(Ljava/lang/String;Ljava/lang/String;)V

    :cond_2
    return-void
.end method

.method public setVersionState(Ljava/lang/String;Lcom/motorola/otalib/common/Environment/ApplicationEnv$PackageState;Ljava/lang/String;)Z
    .locals 7

    invoke-static {}, Lcom/motorola/otalib/common/Environment/AndroidDB;->getTime()J

    move-result-wide v1

    invoke-virtual {p2}, Lcom/motorola/otalib/common/Environment/ApplicationEnv$PackageState;->toString()Ljava/lang/String;

    move-result-object v4

    const-string v5, "RS_TEMP_OK"

    move-object v0, p0

    move-object v3, p1

    move-object v6, p3

    invoke-direct/range {v0 .. v6}, Lcom/motorola/otalib/common/Environment/AndroidDB;->update_version(JLjava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Z

    move-result p0

    if-nez p0, :cond_0

    sget-object p0, Lcom/motorola/otalib/common/CommonLogger;->TAG:Ljava/lang/String;

    const-string p1, "CusAndroidDB.setVersionState failed: update_version"

    invoke-static {p0, p1}, Lcom/motorola/otalib/common/CommonLogger;->e(Ljava/lang/String;Ljava/lang/String;)V

    const/4 p0, 0x0

    return p0

    :cond_0
    const/4 p0, 0x1

    return p0
.end method

.method public update_column_vt(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Z
    .locals 2

    if-eqz p2, :cond_0

    const-string v0, "\'"

    const-string v1, "\'\'"

    invoke-virtual {p2, v0, v1}, Ljava/lang/String;->replaceAll(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p2

    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "update %s set "

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    const-string v0, "=\'%s\', Dirty=\'false\' where Version=\'%s\'"

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    const-string v0, "vt"

    filled-new-array {v0, p2, p3}, [Ljava/lang/Object;

    move-result-object p2

    invoke-static {p1, p2}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p1

    invoke-direct {p0, p1}, Lcom/motorola/otalib/common/Environment/AndroidDB;->exec(Ljava/lang/String;)Z

    move-result p0

    return p0

    :cond_0
    const/4 p0, 0x0

    return p0
.end method
