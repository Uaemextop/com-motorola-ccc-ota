.class public final enum Lcom/motorola/otalib/cdsservice/webdataobjects/WebRequestPayloadType;
.super Ljava/lang/Enum;
.source "WebRequestPayloadType.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum<",
        "Lcom/motorola/otalib/cdsservice/webdataobjects/WebRequestPayloadType;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcom/motorola/otalib/cdsservice/webdataobjects/WebRequestPayloadType;

.field public static final enum file:Lcom/motorola/otalib/cdsservice/webdataobjects/WebRequestPayloadType;

.field public static final enum pb:Lcom/motorola/otalib/cdsservice/webdataobjects/WebRequestPayloadType;

.field public static final enum string:Lcom/motorola/otalib/cdsservice/webdataobjects/WebRequestPayloadType;


# direct methods
.method private static synthetic $values()[Lcom/motorola/otalib/cdsservice/webdataobjects/WebRequestPayloadType;
    .locals 3

    sget-object v0, Lcom/motorola/otalib/cdsservice/webdataobjects/WebRequestPayloadType;->file:Lcom/motorola/otalib/cdsservice/webdataobjects/WebRequestPayloadType;

    sget-object v1, Lcom/motorola/otalib/cdsservice/webdataobjects/WebRequestPayloadType;->pb:Lcom/motorola/otalib/cdsservice/webdataobjects/WebRequestPayloadType;

    sget-object v2, Lcom/motorola/otalib/cdsservice/webdataobjects/WebRequestPayloadType;->string:Lcom/motorola/otalib/cdsservice/webdataobjects/WebRequestPayloadType;

    filled-new-array {v0, v1, v2}, [Lcom/motorola/otalib/cdsservice/webdataobjects/WebRequestPayloadType;

    move-result-object v0

    return-object v0
.end method

.method static constructor <clinit>()V
    .locals 3

    new-instance v0, Lcom/motorola/otalib/cdsservice/webdataobjects/WebRequestPayloadType;

    const-string v1, "file"

    const/4 v2, 0x0

    invoke-direct {v0, v1, v2}, Lcom/motorola/otalib/cdsservice/webdataobjects/WebRequestPayloadType;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/motorola/otalib/cdsservice/webdataobjects/WebRequestPayloadType;->file:Lcom/motorola/otalib/cdsservice/webdataobjects/WebRequestPayloadType;

    new-instance v0, Lcom/motorola/otalib/cdsservice/webdataobjects/WebRequestPayloadType;

    const-string v1, "pb"

    const/4 v2, 0x1

    invoke-direct {v0, v1, v2}, Lcom/motorola/otalib/cdsservice/webdataobjects/WebRequestPayloadType;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/motorola/otalib/cdsservice/webdataobjects/WebRequestPayloadType;->pb:Lcom/motorola/otalib/cdsservice/webdataobjects/WebRequestPayloadType;

    new-instance v0, Lcom/motorola/otalib/cdsservice/webdataobjects/WebRequestPayloadType;

    const-string v1, "string"

    const/4 v2, 0x2

    invoke-direct {v0, v1, v2}, Lcom/motorola/otalib/cdsservice/webdataobjects/WebRequestPayloadType;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/motorola/otalib/cdsservice/webdataobjects/WebRequestPayloadType;->string:Lcom/motorola/otalib/cdsservice/webdataobjects/WebRequestPayloadType;

    invoke-static {}, Lcom/motorola/otalib/cdsservice/webdataobjects/WebRequestPayloadType;->$values()[Lcom/motorola/otalib/cdsservice/webdataobjects/WebRequestPayloadType;

    move-result-object v0

    sput-object v0, Lcom/motorola/otalib/cdsservice/webdataobjects/WebRequestPayloadType;->$VALUES:[Lcom/motorola/otalib/cdsservice/webdataobjects/WebRequestPayloadType;

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

.method public static valueOf(Ljava/lang/String;)Lcom/motorola/otalib/cdsservice/webdataobjects/WebRequestPayloadType;
    .locals 1

    const-class v0, Lcom/motorola/otalib/cdsservice/webdataobjects/WebRequestPayloadType;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object p0

    check-cast p0, Lcom/motorola/otalib/cdsservice/webdataobjects/WebRequestPayloadType;

    return-object p0
.end method

.method public static values()[Lcom/motorola/otalib/cdsservice/webdataobjects/WebRequestPayloadType;
    .locals 1

    sget-object v0, Lcom/motorola/otalib/cdsservice/webdataobjects/WebRequestPayloadType;->$VALUES:[Lcom/motorola/otalib/cdsservice/webdataobjects/WebRequestPayloadType;

    invoke-virtual {v0}, [Lcom/motorola/otalib/cdsservice/webdataobjects/WebRequestPayloadType;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lcom/motorola/otalib/cdsservice/webdataobjects/WebRequestPayloadType;

    return-object v0
.end method
