.class public final enum Lcom/motorola/otalib/common/Environment/ApplicationEnv$PackageState;
.super Ljava/lang/Enum;
.source "ApplicationEnv.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/motorola/otalib/common/Environment/ApplicationEnv;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4019
    name = "PackageState"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum<",
        "Lcom/motorola/otalib/common/Environment/ApplicationEnv$PackageState;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcom/motorola/otalib/common/Environment/ApplicationEnv$PackageState;

.field public static final enum ABApplyingPatch:Lcom/motorola/otalib/common/Environment/ApplicationEnv$PackageState;

.field public static final enum GettingDescriptor:Lcom/motorola/otalib/common/Environment/ApplicationEnv$PackageState;

.field public static final enum GettingPackage:Lcom/motorola/otalib/common/Environment/ApplicationEnv$PackageState;

.field public static final enum IDLE:Lcom/motorola/otalib/common/Environment/ApplicationEnv$PackageState;

.field public static final enum IntimateModem:Lcom/motorola/otalib/common/Environment/ApplicationEnv$PackageState;

.field public static final enum MergePending:Lcom/motorola/otalib/common/Environment/ApplicationEnv$PackageState;

.field public static final enum MergeRestart:Lcom/motorola/otalib/common/Environment/ApplicationEnv$PackageState;

.field public static final enum Notified:Lcom/motorola/otalib/common/Environment/ApplicationEnv$PackageState;

.field public static final enum Querying:Lcom/motorola/otalib/common/Environment/ApplicationEnv$PackageState;

.field public static final enum QueryingInstall:Lcom/motorola/otalib/common/Environment/ApplicationEnv$PackageState;

.field public static final enum QueueForDownload:Lcom/motorola/otalib/common/Environment/ApplicationEnv$PackageState;

.field public static final enum RequestPermission:Lcom/motorola/otalib/common/Environment/ApplicationEnv$PackageState;

.field public static final enum Result:Lcom/motorola/otalib/common/Environment/ApplicationEnv$PackageState;

.field public static final enum Upgrading:Lcom/motorola/otalib/common/Environment/ApplicationEnv$PackageState;

.field public static final enum VerifyAllocateSpace:Lcom/motorola/otalib/common/Environment/ApplicationEnv$PackageState;

.field public static final enum VerifyPayloadMetadata:Lcom/motorola/otalib/common/Environment/ApplicationEnv$PackageState;

.field public static final enum WaitingForModemUpdateStatus:Lcom/motorola/otalib/common/Environment/ApplicationEnv$PackageState;


# direct methods
.method private static synthetic $values()[Lcom/motorola/otalib/common/Environment/ApplicationEnv$PackageState;
    .locals 17

    sget-object v0, Lcom/motorola/otalib/common/Environment/ApplicationEnv$PackageState;->IDLE:Lcom/motorola/otalib/common/Environment/ApplicationEnv$PackageState;

    sget-object v1, Lcom/motorola/otalib/common/Environment/ApplicationEnv$PackageState;->Notified:Lcom/motorola/otalib/common/Environment/ApplicationEnv$PackageState;

    sget-object v2, Lcom/motorola/otalib/common/Environment/ApplicationEnv$PackageState;->RequestPermission:Lcom/motorola/otalib/common/Environment/ApplicationEnv$PackageState;

    sget-object v3, Lcom/motorola/otalib/common/Environment/ApplicationEnv$PackageState;->QueueForDownload:Lcom/motorola/otalib/common/Environment/ApplicationEnv$PackageState;

    sget-object v4, Lcom/motorola/otalib/common/Environment/ApplicationEnv$PackageState;->GettingDescriptor:Lcom/motorola/otalib/common/Environment/ApplicationEnv$PackageState;

    sget-object v5, Lcom/motorola/otalib/common/Environment/ApplicationEnv$PackageState;->GettingPackage:Lcom/motorola/otalib/common/Environment/ApplicationEnv$PackageState;

    sget-object v6, Lcom/motorola/otalib/common/Environment/ApplicationEnv$PackageState;->IntimateModem:Lcom/motorola/otalib/common/Environment/ApplicationEnv$PackageState;

    sget-object v7, Lcom/motorola/otalib/common/Environment/ApplicationEnv$PackageState;->WaitingForModemUpdateStatus:Lcom/motorola/otalib/common/Environment/ApplicationEnv$PackageState;

    sget-object v8, Lcom/motorola/otalib/common/Environment/ApplicationEnv$PackageState;->VerifyPayloadMetadata:Lcom/motorola/otalib/common/Environment/ApplicationEnv$PackageState;

    sget-object v9, Lcom/motorola/otalib/common/Environment/ApplicationEnv$PackageState;->VerifyAllocateSpace:Lcom/motorola/otalib/common/Environment/ApplicationEnv$PackageState;

    sget-object v10, Lcom/motorola/otalib/common/Environment/ApplicationEnv$PackageState;->ABApplyingPatch:Lcom/motorola/otalib/common/Environment/ApplicationEnv$PackageState;

    sget-object v11, Lcom/motorola/otalib/common/Environment/ApplicationEnv$PackageState;->Querying:Lcom/motorola/otalib/common/Environment/ApplicationEnv$PackageState;

    sget-object v12, Lcom/motorola/otalib/common/Environment/ApplicationEnv$PackageState;->QueryingInstall:Lcom/motorola/otalib/common/Environment/ApplicationEnv$PackageState;

    sget-object v13, Lcom/motorola/otalib/common/Environment/ApplicationEnv$PackageState;->Upgrading:Lcom/motorola/otalib/common/Environment/ApplicationEnv$PackageState;

    sget-object v14, Lcom/motorola/otalib/common/Environment/ApplicationEnv$PackageState;->MergePending:Lcom/motorola/otalib/common/Environment/ApplicationEnv$PackageState;

    sget-object v15, Lcom/motorola/otalib/common/Environment/ApplicationEnv$PackageState;->MergeRestart:Lcom/motorola/otalib/common/Environment/ApplicationEnv$PackageState;

    sget-object v16, Lcom/motorola/otalib/common/Environment/ApplicationEnv$PackageState;->Result:Lcom/motorola/otalib/common/Environment/ApplicationEnv$PackageState;

    filled-new-array/range {v0 .. v16}, [Lcom/motorola/otalib/common/Environment/ApplicationEnv$PackageState;

    move-result-object v0

    return-object v0
.end method

.method static constructor <clinit>()V
    .locals 3

    new-instance v0, Lcom/motorola/otalib/common/Environment/ApplicationEnv$PackageState;

    const-string v1, "IDLE"

    const/4 v2, 0x0

    invoke-direct {v0, v1, v2}, Lcom/motorola/otalib/common/Environment/ApplicationEnv$PackageState;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/motorola/otalib/common/Environment/ApplicationEnv$PackageState;->IDLE:Lcom/motorola/otalib/common/Environment/ApplicationEnv$PackageState;

    new-instance v0, Lcom/motorola/otalib/common/Environment/ApplicationEnv$PackageState;

    const-string v1, "Notified"

    const/4 v2, 0x1

    invoke-direct {v0, v1, v2}, Lcom/motorola/otalib/common/Environment/ApplicationEnv$PackageState;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/motorola/otalib/common/Environment/ApplicationEnv$PackageState;->Notified:Lcom/motorola/otalib/common/Environment/ApplicationEnv$PackageState;

    new-instance v0, Lcom/motorola/otalib/common/Environment/ApplicationEnv$PackageState;

    const-string v1, "RequestPermission"

    const/4 v2, 0x2

    invoke-direct {v0, v1, v2}, Lcom/motorola/otalib/common/Environment/ApplicationEnv$PackageState;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/motorola/otalib/common/Environment/ApplicationEnv$PackageState;->RequestPermission:Lcom/motorola/otalib/common/Environment/ApplicationEnv$PackageState;

    new-instance v0, Lcom/motorola/otalib/common/Environment/ApplicationEnv$PackageState;

    const-string v1, "QueueForDownload"

    const/4 v2, 0x3

    invoke-direct {v0, v1, v2}, Lcom/motorola/otalib/common/Environment/ApplicationEnv$PackageState;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/motorola/otalib/common/Environment/ApplicationEnv$PackageState;->QueueForDownload:Lcom/motorola/otalib/common/Environment/ApplicationEnv$PackageState;

    new-instance v0, Lcom/motorola/otalib/common/Environment/ApplicationEnv$PackageState;

    const-string v1, "GettingDescriptor"

    const/4 v2, 0x4

    invoke-direct {v0, v1, v2}, Lcom/motorola/otalib/common/Environment/ApplicationEnv$PackageState;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/motorola/otalib/common/Environment/ApplicationEnv$PackageState;->GettingDescriptor:Lcom/motorola/otalib/common/Environment/ApplicationEnv$PackageState;

    new-instance v0, Lcom/motorola/otalib/common/Environment/ApplicationEnv$PackageState;

    const-string v1, "GettingPackage"

    const/4 v2, 0x5

    invoke-direct {v0, v1, v2}, Lcom/motorola/otalib/common/Environment/ApplicationEnv$PackageState;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/motorola/otalib/common/Environment/ApplicationEnv$PackageState;->GettingPackage:Lcom/motorola/otalib/common/Environment/ApplicationEnv$PackageState;

    new-instance v0, Lcom/motorola/otalib/common/Environment/ApplicationEnv$PackageState;

    const-string v1, "IntimateModem"

    const/4 v2, 0x6

    invoke-direct {v0, v1, v2}, Lcom/motorola/otalib/common/Environment/ApplicationEnv$PackageState;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/motorola/otalib/common/Environment/ApplicationEnv$PackageState;->IntimateModem:Lcom/motorola/otalib/common/Environment/ApplicationEnv$PackageState;

    new-instance v0, Lcom/motorola/otalib/common/Environment/ApplicationEnv$PackageState;

    const-string v1, "WaitingForModemUpdateStatus"

    const/4 v2, 0x7

    invoke-direct {v0, v1, v2}, Lcom/motorola/otalib/common/Environment/ApplicationEnv$PackageState;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/motorola/otalib/common/Environment/ApplicationEnv$PackageState;->WaitingForModemUpdateStatus:Lcom/motorola/otalib/common/Environment/ApplicationEnv$PackageState;

    new-instance v0, Lcom/motorola/otalib/common/Environment/ApplicationEnv$PackageState;

    const-string v1, "VerifyPayloadMetadata"

    const/16 v2, 0x8

    invoke-direct {v0, v1, v2}, Lcom/motorola/otalib/common/Environment/ApplicationEnv$PackageState;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/motorola/otalib/common/Environment/ApplicationEnv$PackageState;->VerifyPayloadMetadata:Lcom/motorola/otalib/common/Environment/ApplicationEnv$PackageState;

    new-instance v0, Lcom/motorola/otalib/common/Environment/ApplicationEnv$PackageState;

    const-string v1, "VerifyAllocateSpace"

    const/16 v2, 0x9

    invoke-direct {v0, v1, v2}, Lcom/motorola/otalib/common/Environment/ApplicationEnv$PackageState;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/motorola/otalib/common/Environment/ApplicationEnv$PackageState;->VerifyAllocateSpace:Lcom/motorola/otalib/common/Environment/ApplicationEnv$PackageState;

    new-instance v0, Lcom/motorola/otalib/common/Environment/ApplicationEnv$PackageState;

    const-string v1, "ABApplyingPatch"

    const/16 v2, 0xa

    invoke-direct {v0, v1, v2}, Lcom/motorola/otalib/common/Environment/ApplicationEnv$PackageState;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/motorola/otalib/common/Environment/ApplicationEnv$PackageState;->ABApplyingPatch:Lcom/motorola/otalib/common/Environment/ApplicationEnv$PackageState;

    new-instance v0, Lcom/motorola/otalib/common/Environment/ApplicationEnv$PackageState;

    const-string v1, "Querying"

    const/16 v2, 0xb

    invoke-direct {v0, v1, v2}, Lcom/motorola/otalib/common/Environment/ApplicationEnv$PackageState;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/motorola/otalib/common/Environment/ApplicationEnv$PackageState;->Querying:Lcom/motorola/otalib/common/Environment/ApplicationEnv$PackageState;

    new-instance v0, Lcom/motorola/otalib/common/Environment/ApplicationEnv$PackageState;

    const-string v1, "QueryingInstall"

    const/16 v2, 0xc

    invoke-direct {v0, v1, v2}, Lcom/motorola/otalib/common/Environment/ApplicationEnv$PackageState;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/motorola/otalib/common/Environment/ApplicationEnv$PackageState;->QueryingInstall:Lcom/motorola/otalib/common/Environment/ApplicationEnv$PackageState;

    new-instance v0, Lcom/motorola/otalib/common/Environment/ApplicationEnv$PackageState;

    const-string v1, "Upgrading"

    const/16 v2, 0xd

    invoke-direct {v0, v1, v2}, Lcom/motorola/otalib/common/Environment/ApplicationEnv$PackageState;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/motorola/otalib/common/Environment/ApplicationEnv$PackageState;->Upgrading:Lcom/motorola/otalib/common/Environment/ApplicationEnv$PackageState;

    new-instance v0, Lcom/motorola/otalib/common/Environment/ApplicationEnv$PackageState;

    const-string v1, "MergePending"

    const/16 v2, 0xe

    invoke-direct {v0, v1, v2}, Lcom/motorola/otalib/common/Environment/ApplicationEnv$PackageState;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/motorola/otalib/common/Environment/ApplicationEnv$PackageState;->MergePending:Lcom/motorola/otalib/common/Environment/ApplicationEnv$PackageState;

    new-instance v0, Lcom/motorola/otalib/common/Environment/ApplicationEnv$PackageState;

    const-string v1, "MergeRestart"

    const/16 v2, 0xf

    invoke-direct {v0, v1, v2}, Lcom/motorola/otalib/common/Environment/ApplicationEnv$PackageState;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/motorola/otalib/common/Environment/ApplicationEnv$PackageState;->MergeRestart:Lcom/motorola/otalib/common/Environment/ApplicationEnv$PackageState;

    new-instance v0, Lcom/motorola/otalib/common/Environment/ApplicationEnv$PackageState;

    const-string v1, "Result"

    const/16 v2, 0x10

    invoke-direct {v0, v1, v2}, Lcom/motorola/otalib/common/Environment/ApplicationEnv$PackageState;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/motorola/otalib/common/Environment/ApplicationEnv$PackageState;->Result:Lcom/motorola/otalib/common/Environment/ApplicationEnv$PackageState;

    invoke-static {}, Lcom/motorola/otalib/common/Environment/ApplicationEnv$PackageState;->$values()[Lcom/motorola/otalib/common/Environment/ApplicationEnv$PackageState;

    move-result-object v0

    sput-object v0, Lcom/motorola/otalib/common/Environment/ApplicationEnv$PackageState;->$VALUES:[Lcom/motorola/otalib/common/Environment/ApplicationEnv$PackageState;

    return-void
.end method

.method private constructor <init>(Ljava/lang/String;I)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/motorola/otalib/common/Environment/ApplicationEnv$PackageState;
    .locals 1

    const-class v0, Lcom/motorola/otalib/common/Environment/ApplicationEnv$PackageState;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object p0

    check-cast p0, Lcom/motorola/otalib/common/Environment/ApplicationEnv$PackageState;

    return-object p0
.end method

.method public static values()[Lcom/motorola/otalib/common/Environment/ApplicationEnv$PackageState;
    .locals 1

    sget-object v0, Lcom/motorola/otalib/common/Environment/ApplicationEnv$PackageState;->$VALUES:[Lcom/motorola/otalib/common/Environment/ApplicationEnv$PackageState;

    invoke-virtual {v0}, [Lcom/motorola/otalib/common/Environment/ApplicationEnv$PackageState;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lcom/motorola/otalib/common/Environment/ApplicationEnv$PackageState;

    return-object v0
.end method
