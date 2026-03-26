.class final enum Lcom/motorola/otalib/cdsservice/WebService$WHAT;
.super Ljava/lang/Enum;
.source "WebService.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/motorola/otalib/cdsservice/WebService;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x401a
    name = "WHAT"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum<",
        "Lcom/motorola/otalib/cdsservice/WebService$WHAT;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcom/motorola/otalib/cdsservice/WebService$WHAT;

.field public static final enum CDS_WEB_SERVICE_REQUEST:Lcom/motorola/otalib/cdsservice/WebService$WHAT;

.field public static final enum CDS_WEB_SERVICE_RESPONSE_RECEIVED:Lcom/motorola/otalib/cdsservice/WebService$WHAT;


# direct methods
.method private static synthetic $values()[Lcom/motorola/otalib/cdsservice/WebService$WHAT;
    .locals 2

    sget-object v0, Lcom/motorola/otalib/cdsservice/WebService$WHAT;->CDS_WEB_SERVICE_REQUEST:Lcom/motorola/otalib/cdsservice/WebService$WHAT;

    sget-object v1, Lcom/motorola/otalib/cdsservice/WebService$WHAT;->CDS_WEB_SERVICE_RESPONSE_RECEIVED:Lcom/motorola/otalib/cdsservice/WebService$WHAT;

    filled-new-array {v0, v1}, [Lcom/motorola/otalib/cdsservice/WebService$WHAT;

    move-result-object v0

    return-object v0
.end method

.method static constructor <clinit>()V
    .locals 3

    new-instance v0, Lcom/motorola/otalib/cdsservice/WebService$WHAT;

    const-string v1, "CDS_WEB_SERVICE_REQUEST"

    const/4 v2, 0x0

    invoke-direct {v0, v1, v2}, Lcom/motorola/otalib/cdsservice/WebService$WHAT;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/motorola/otalib/cdsservice/WebService$WHAT;->CDS_WEB_SERVICE_REQUEST:Lcom/motorola/otalib/cdsservice/WebService$WHAT;

    new-instance v0, Lcom/motorola/otalib/cdsservice/WebService$WHAT;

    const-string v1, "CDS_WEB_SERVICE_RESPONSE_RECEIVED"

    const/4 v2, 0x1

    invoke-direct {v0, v1, v2}, Lcom/motorola/otalib/cdsservice/WebService$WHAT;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/motorola/otalib/cdsservice/WebService$WHAT;->CDS_WEB_SERVICE_RESPONSE_RECEIVED:Lcom/motorola/otalib/cdsservice/WebService$WHAT;

    invoke-static {}, Lcom/motorola/otalib/cdsservice/WebService$WHAT;->$values()[Lcom/motorola/otalib/cdsservice/WebService$WHAT;

    move-result-object v0

    sput-object v0, Lcom/motorola/otalib/cdsservice/WebService$WHAT;->$VALUES:[Lcom/motorola/otalib/cdsservice/WebService$WHAT;

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

.method public static valueOf(Ljava/lang/String;)Lcom/motorola/otalib/cdsservice/WebService$WHAT;
    .locals 1

    const-class v0, Lcom/motorola/otalib/cdsservice/WebService$WHAT;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object p0

    check-cast p0, Lcom/motorola/otalib/cdsservice/WebService$WHAT;

    return-object p0
.end method

.method public static values()[Lcom/motorola/otalib/cdsservice/WebService$WHAT;
    .locals 1

    sget-object v0, Lcom/motorola/otalib/cdsservice/WebService$WHAT;->$VALUES:[Lcom/motorola/otalib/cdsservice/WebService$WHAT;

    invoke-virtual {v0}, [Lcom/motorola/otalib/cdsservice/WebService$WHAT;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lcom/motorola/otalib/cdsservice/WebService$WHAT;

    return-object v0
.end method
