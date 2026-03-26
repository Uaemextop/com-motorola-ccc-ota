.class public final enum Lcom/motorola/ccc/ota/installer/InstallTypeResolver$InstallerType;
.super Ljava/lang/Enum;
.source "InstallTypeResolver.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/motorola/ccc/ota/installer/InstallTypeResolver;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4019
    name = "InstallerType"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum<",
        "Lcom/motorola/ccc/ota/installer/InstallTypeResolver$InstallerType;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcom/motorola/ccc/ota/installer/InstallTypeResolver$InstallerType;

.field public static final enum AB:Lcom/motorola/ccc/ota/installer/InstallTypeResolver$InstallerType;

.field public static final enum STREAMING:Lcom/motorola/ccc/ota/installer/InstallTypeResolver$InstallerType;


# direct methods
.method private static synthetic $values()[Lcom/motorola/ccc/ota/installer/InstallTypeResolver$InstallerType;
    .locals 2

    sget-object v0, Lcom/motorola/ccc/ota/installer/InstallTypeResolver$InstallerType;->AB:Lcom/motorola/ccc/ota/installer/InstallTypeResolver$InstallerType;

    sget-object v1, Lcom/motorola/ccc/ota/installer/InstallTypeResolver$InstallerType;->STREAMING:Lcom/motorola/ccc/ota/installer/InstallTypeResolver$InstallerType;

    filled-new-array {v0, v1}, [Lcom/motorola/ccc/ota/installer/InstallTypeResolver$InstallerType;

    move-result-object v0

    return-object v0
.end method

.method static constructor <clinit>()V
    .locals 3

    new-instance v0, Lcom/motorola/ccc/ota/installer/InstallTypeResolver$InstallerType;

    const-string v1, "AB"

    const/4 v2, 0x0

    invoke-direct {v0, v1, v2}, Lcom/motorola/ccc/ota/installer/InstallTypeResolver$InstallerType;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/motorola/ccc/ota/installer/InstallTypeResolver$InstallerType;->AB:Lcom/motorola/ccc/ota/installer/InstallTypeResolver$InstallerType;

    new-instance v0, Lcom/motorola/ccc/ota/installer/InstallTypeResolver$InstallerType;

    const-string v1, "STREAMING"

    const/4 v2, 0x1

    invoke-direct {v0, v1, v2}, Lcom/motorola/ccc/ota/installer/InstallTypeResolver$InstallerType;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/motorola/ccc/ota/installer/InstallTypeResolver$InstallerType;->STREAMING:Lcom/motorola/ccc/ota/installer/InstallTypeResolver$InstallerType;

    invoke-static {}, Lcom/motorola/ccc/ota/installer/InstallTypeResolver$InstallerType;->$values()[Lcom/motorola/ccc/ota/installer/InstallTypeResolver$InstallerType;

    move-result-object v0

    sput-object v0, Lcom/motorola/ccc/ota/installer/InstallTypeResolver$InstallerType;->$VALUES:[Lcom/motorola/ccc/ota/installer/InstallTypeResolver$InstallerType;

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

.method public static valueOf(Ljava/lang/String;)Lcom/motorola/ccc/ota/installer/InstallTypeResolver$InstallerType;
    .locals 1

    const-class v0, Lcom/motorola/ccc/ota/installer/InstallTypeResolver$InstallerType;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object p0

    check-cast p0, Lcom/motorola/ccc/ota/installer/InstallTypeResolver$InstallerType;

    return-object p0
.end method

.method public static values()[Lcom/motorola/ccc/ota/installer/InstallTypeResolver$InstallerType;
    .locals 1

    sget-object v0, Lcom/motorola/ccc/ota/installer/InstallTypeResolver$InstallerType;->$VALUES:[Lcom/motorola/ccc/ota/installer/InstallTypeResolver$InstallerType;

    invoke-virtual {v0}, [Lcom/motorola/ccc/ota/installer/InstallTypeResolver$InstallerType;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lcom/motorola/ccc/ota/installer/InstallTypeResolver$InstallerType;

    return-object v0
.end method
