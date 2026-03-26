.class Lcom/motorola/otalib/common/Environment/AndroidDB$1;
.super Ljava/lang/Object;
.source "AndroidDB.java"

# interfaces
.implements Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database$Descriptor;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/motorola/otalib/common/Environment/AndroidDB;->getDescription(Ljava/lang/String;)Lcom/motorola/otalib/common/Environment/ApplicationEnv$Database$Descriptor;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/motorola/otalib/common/Environment/AndroidDB;

.field final synthetic val$info:Ljava/lang/String;

.field final synthetic val$meta:Lcom/motorola/otalib/common/metaData/MetaData;

.field final synthetic val$repo:Ljava/lang/String;

.field final synthetic val$state:Lcom/motorola/otalib/common/Environment/ApplicationEnv$PackageState;

.field final synthetic val$status:Ljava/lang/String;

.field final synthetic val$time:I

.field final synthetic val$version:Ljava/lang/String;


# direct methods
.method constructor <init>(Lcom/motorola/otalib/common/Environment/AndroidDB;Ljava/lang/String;Lcom/motorola/otalib/common/Environment/ApplicationEnv$PackageState;ILjava/lang/String;Lcom/motorola/otalib/common/metaData/MetaData;Ljava/lang/String;Ljava/lang/String;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    iput-object p1, p0, Lcom/motorola/otalib/common/Environment/AndroidDB$1;->this$0:Lcom/motorola/otalib/common/Environment/AndroidDB;

    iput-object p2, p0, Lcom/motorola/otalib/common/Environment/AndroidDB$1;->val$version:Ljava/lang/String;

    iput-object p3, p0, Lcom/motorola/otalib/common/Environment/AndroidDB$1;->val$state:Lcom/motorola/otalib/common/Environment/ApplicationEnv$PackageState;

    iput p4, p0, Lcom/motorola/otalib/common/Environment/AndroidDB$1;->val$time:I

    iput-object p5, p0, Lcom/motorola/otalib/common/Environment/AndroidDB$1;->val$info:Ljava/lang/String;

    iput-object p6, p0, Lcom/motorola/otalib/common/Environment/AndroidDB$1;->val$meta:Lcom/motorola/otalib/common/metaData/MetaData;

    iput-object p7, p0, Lcom/motorola/otalib/common/Environment/AndroidDB$1;->val$repo:Ljava/lang/String;

    iput-object p8, p0, Lcom/motorola/otalib/common/Environment/AndroidDB$1;->val$status:Ljava/lang/String;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public getInfo()Ljava/lang/String;
    .locals 0

    iget-object p0, p0, Lcom/motorola/otalib/common/Environment/AndroidDB$1;->val$info:Ljava/lang/String;

    return-object p0
.end method

.method public getMeta()Lcom/motorola/otalib/common/metaData/MetaData;
    .locals 0

    iget-object p0, p0, Lcom/motorola/otalib/common/Environment/AndroidDB$1;->val$meta:Lcom/motorola/otalib/common/metaData/MetaData;

    return-object p0
.end method

.method public getRepository()Ljava/lang/String;
    .locals 0

    iget-object p0, p0, Lcom/motorola/otalib/common/Environment/AndroidDB$1;->val$repo:Ljava/lang/String;

    return-object p0
.end method

.method public getState()Lcom/motorola/otalib/common/Environment/ApplicationEnv$PackageState;
    .locals 0

    iget-object p0, p0, Lcom/motorola/otalib/common/Environment/AndroidDB$1;->val$state:Lcom/motorola/otalib/common/Environment/ApplicationEnv$PackageState;

    return-object p0
.end method

.method public getStatus()Ljava/lang/String;
    .locals 0

    iget-object p0, p0, Lcom/motorola/otalib/common/Environment/AndroidDB$1;->val$status:Ljava/lang/String;

    return-object p0
.end method

.method public getTime()I
    .locals 0

    iget p0, p0, Lcom/motorola/otalib/common/Environment/AndroidDB$1;->val$time:I

    return p0
.end method

.method public getVersion()Ljava/lang/String;
    .locals 0

    iget-object p0, p0, Lcom/motorola/otalib/common/Environment/AndroidDB$1;->val$version:Ljava/lang/String;

    return-object p0
.end method
