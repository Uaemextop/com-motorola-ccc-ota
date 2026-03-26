.class public final enum Lcom/motorola/otalib/main/PublicUtilityMethods$OtaState;
.super Ljava/lang/Enum;
.source "PublicUtilityMethods.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/motorola/otalib/main/PublicUtilityMethods;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4019
    name = "OtaState"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum<",
        "Lcom/motorola/otalib/main/PublicUtilityMethods$OtaState;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcom/motorola/otalib/main/PublicUtilityMethods$OtaState;

.field public static final enum Downloading:Lcom/motorola/otalib/main/PublicUtilityMethods$OtaState;

.field public static final enum FetchingDLDetails:Lcom/motorola/otalib/main/PublicUtilityMethods$OtaState;

.field public static final enum Installing:Lcom/motorola/otalib/main/PublicUtilityMethods$OtaState;

.field public static final enum QueueForDownload:Lcom/motorola/otalib/main/PublicUtilityMethods$OtaState;

.field public static final enum Rebooting:Lcom/motorola/otalib/main/PublicUtilityMethods$OtaState;

.field public static final enum Result:Lcom/motorola/otalib/main/PublicUtilityMethods$OtaState;

.field public static final enum UpdateAvailable:Lcom/motorola/otalib/main/PublicUtilityMethods$OtaState;

.field public static final enum UserApprovedDL:Lcom/motorola/otalib/main/PublicUtilityMethods$OtaState;

.field public static final enum UserApprovedInstall:Lcom/motorola/otalib/main/PublicUtilityMethods$OtaState;

.field public static final enum WaitingForDLPermission:Lcom/motorola/otalib/main/PublicUtilityMethods$OtaState;

.field public static final enum WaitingForInstallPermission:Lcom/motorola/otalib/main/PublicUtilityMethods$OtaState;


# direct methods
.method private static synthetic $values()[Lcom/motorola/otalib/main/PublicUtilityMethods$OtaState;
    .locals 11

    sget-object v0, Lcom/motorola/otalib/main/PublicUtilityMethods$OtaState;->UpdateAvailable:Lcom/motorola/otalib/main/PublicUtilityMethods$OtaState;

    sget-object v1, Lcom/motorola/otalib/main/PublicUtilityMethods$OtaState;->WaitingForDLPermission:Lcom/motorola/otalib/main/PublicUtilityMethods$OtaState;

    sget-object v2, Lcom/motorola/otalib/main/PublicUtilityMethods$OtaState;->UserApprovedDL:Lcom/motorola/otalib/main/PublicUtilityMethods$OtaState;

    sget-object v3, Lcom/motorola/otalib/main/PublicUtilityMethods$OtaState;->QueueForDownload:Lcom/motorola/otalib/main/PublicUtilityMethods$OtaState;

    sget-object v4, Lcom/motorola/otalib/main/PublicUtilityMethods$OtaState;->FetchingDLDetails:Lcom/motorola/otalib/main/PublicUtilityMethods$OtaState;

    sget-object v5, Lcom/motorola/otalib/main/PublicUtilityMethods$OtaState;->Downloading:Lcom/motorola/otalib/main/PublicUtilityMethods$OtaState;

    sget-object v6, Lcom/motorola/otalib/main/PublicUtilityMethods$OtaState;->WaitingForInstallPermission:Lcom/motorola/otalib/main/PublicUtilityMethods$OtaState;

    sget-object v7, Lcom/motorola/otalib/main/PublicUtilityMethods$OtaState;->UserApprovedInstall:Lcom/motorola/otalib/main/PublicUtilityMethods$OtaState;

    sget-object v8, Lcom/motorola/otalib/main/PublicUtilityMethods$OtaState;->Installing:Lcom/motorola/otalib/main/PublicUtilityMethods$OtaState;

    sget-object v9, Lcom/motorola/otalib/main/PublicUtilityMethods$OtaState;->Rebooting:Lcom/motorola/otalib/main/PublicUtilityMethods$OtaState;

    sget-object v10, Lcom/motorola/otalib/main/PublicUtilityMethods$OtaState;->Result:Lcom/motorola/otalib/main/PublicUtilityMethods$OtaState;

    filled-new-array/range {v0 .. v10}, [Lcom/motorola/otalib/main/PublicUtilityMethods$OtaState;

    move-result-object v0

    return-object v0
.end method

.method static constructor <clinit>()V
    .locals 3

    new-instance v0, Lcom/motorola/otalib/main/PublicUtilityMethods$OtaState;

    const-string v1, "UpdateAvailable"

    const/4 v2, 0x0

    invoke-direct {v0, v1, v2}, Lcom/motorola/otalib/main/PublicUtilityMethods$OtaState;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/motorola/otalib/main/PublicUtilityMethods$OtaState;->UpdateAvailable:Lcom/motorola/otalib/main/PublicUtilityMethods$OtaState;

    new-instance v0, Lcom/motorola/otalib/main/PublicUtilityMethods$OtaState;

    const-string v1, "WaitingForDLPermission"

    const/4 v2, 0x1

    invoke-direct {v0, v1, v2}, Lcom/motorola/otalib/main/PublicUtilityMethods$OtaState;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/motorola/otalib/main/PublicUtilityMethods$OtaState;->WaitingForDLPermission:Lcom/motorola/otalib/main/PublicUtilityMethods$OtaState;

    new-instance v0, Lcom/motorola/otalib/main/PublicUtilityMethods$OtaState;

    const-string v1, "UserApprovedDL"

    const/4 v2, 0x2

    invoke-direct {v0, v1, v2}, Lcom/motorola/otalib/main/PublicUtilityMethods$OtaState;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/motorola/otalib/main/PublicUtilityMethods$OtaState;->UserApprovedDL:Lcom/motorola/otalib/main/PublicUtilityMethods$OtaState;

    new-instance v0, Lcom/motorola/otalib/main/PublicUtilityMethods$OtaState;

    const-string v1, "QueueForDownload"

    const/4 v2, 0x3

    invoke-direct {v0, v1, v2}, Lcom/motorola/otalib/main/PublicUtilityMethods$OtaState;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/motorola/otalib/main/PublicUtilityMethods$OtaState;->QueueForDownload:Lcom/motorola/otalib/main/PublicUtilityMethods$OtaState;

    new-instance v0, Lcom/motorola/otalib/main/PublicUtilityMethods$OtaState;

    const-string v1, "FetchingDLDetails"

    const/4 v2, 0x4

    invoke-direct {v0, v1, v2}, Lcom/motorola/otalib/main/PublicUtilityMethods$OtaState;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/motorola/otalib/main/PublicUtilityMethods$OtaState;->FetchingDLDetails:Lcom/motorola/otalib/main/PublicUtilityMethods$OtaState;

    new-instance v0, Lcom/motorola/otalib/main/PublicUtilityMethods$OtaState;

    const-string v1, "Downloading"

    const/4 v2, 0x5

    invoke-direct {v0, v1, v2}, Lcom/motorola/otalib/main/PublicUtilityMethods$OtaState;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/motorola/otalib/main/PublicUtilityMethods$OtaState;->Downloading:Lcom/motorola/otalib/main/PublicUtilityMethods$OtaState;

    new-instance v0, Lcom/motorola/otalib/main/PublicUtilityMethods$OtaState;

    const-string v1, "WaitingForInstallPermission"

    const/4 v2, 0x6

    invoke-direct {v0, v1, v2}, Lcom/motorola/otalib/main/PublicUtilityMethods$OtaState;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/motorola/otalib/main/PublicUtilityMethods$OtaState;->WaitingForInstallPermission:Lcom/motorola/otalib/main/PublicUtilityMethods$OtaState;

    new-instance v0, Lcom/motorola/otalib/main/PublicUtilityMethods$OtaState;

    const-string v1, "UserApprovedInstall"

    const/4 v2, 0x7

    invoke-direct {v0, v1, v2}, Lcom/motorola/otalib/main/PublicUtilityMethods$OtaState;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/motorola/otalib/main/PublicUtilityMethods$OtaState;->UserApprovedInstall:Lcom/motorola/otalib/main/PublicUtilityMethods$OtaState;

    new-instance v0, Lcom/motorola/otalib/main/PublicUtilityMethods$OtaState;

    const-string v1, "Installing"

    const/16 v2, 0x8

    invoke-direct {v0, v1, v2}, Lcom/motorola/otalib/main/PublicUtilityMethods$OtaState;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/motorola/otalib/main/PublicUtilityMethods$OtaState;->Installing:Lcom/motorola/otalib/main/PublicUtilityMethods$OtaState;

    new-instance v0, Lcom/motorola/otalib/main/PublicUtilityMethods$OtaState;

    const-string v1, "Rebooting"

    const/16 v2, 0x9

    invoke-direct {v0, v1, v2}, Lcom/motorola/otalib/main/PublicUtilityMethods$OtaState;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/motorola/otalib/main/PublicUtilityMethods$OtaState;->Rebooting:Lcom/motorola/otalib/main/PublicUtilityMethods$OtaState;

    new-instance v0, Lcom/motorola/otalib/main/PublicUtilityMethods$OtaState;

    const-string v1, "Result"

    const/16 v2, 0xa

    invoke-direct {v0, v1, v2}, Lcom/motorola/otalib/main/PublicUtilityMethods$OtaState;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/motorola/otalib/main/PublicUtilityMethods$OtaState;->Result:Lcom/motorola/otalib/main/PublicUtilityMethods$OtaState;

    invoke-static {}, Lcom/motorola/otalib/main/PublicUtilityMethods$OtaState;->$values()[Lcom/motorola/otalib/main/PublicUtilityMethods$OtaState;

    move-result-object v0

    sput-object v0, Lcom/motorola/otalib/main/PublicUtilityMethods$OtaState;->$VALUES:[Lcom/motorola/otalib/main/PublicUtilityMethods$OtaState;

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

.method public static valueOf(Ljava/lang/String;)Lcom/motorola/otalib/main/PublicUtilityMethods$OtaState;
    .locals 1

    const-class v0, Lcom/motorola/otalib/main/PublicUtilityMethods$OtaState;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object p0

    check-cast p0, Lcom/motorola/otalib/main/PublicUtilityMethods$OtaState;

    return-object p0
.end method

.method public static values()[Lcom/motorola/otalib/main/PublicUtilityMethods$OtaState;
    .locals 1

    sget-object v0, Lcom/motorola/otalib/main/PublicUtilityMethods$OtaState;->$VALUES:[Lcom/motorola/otalib/main/PublicUtilityMethods$OtaState;

    invoke-virtual {v0}, [Lcom/motorola/otalib/main/PublicUtilityMethods$OtaState;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lcom/motorola/otalib/main/PublicUtilityMethods$OtaState;

    return-object v0
.end method
