.class public final enum Lcom/motorola/otalib/downloadservice/download/HttpDownloaderStatus;
.super Ljava/lang/Enum;
.source "HttpDownloaderStatus.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum<",
        "Lcom/motorola/otalib/downloadservice/download/HttpDownloaderStatus;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcom/motorola/otalib/downloadservice/download/HttpDownloaderStatus;

.field public static final enum DOWNLOAD_FATAL_ERROR:Lcom/motorola/otalib/downloadservice/download/HttpDownloaderStatus;

.field public static final enum DOWNLOAD_OK:Lcom/motorola/otalib/downloadservice/download/HttpDownloaderStatus;

.field public static final enum DOWNLOAD_RECEIVED_HTTP_ERROR:Lcom/motorola/otalib/downloadservice/download/HttpDownloaderStatus;


# direct methods
.method private static synthetic $values()[Lcom/motorola/otalib/downloadservice/download/HttpDownloaderStatus;
    .locals 3

    sget-object v0, Lcom/motorola/otalib/downloadservice/download/HttpDownloaderStatus;->DOWNLOAD_RECEIVED_HTTP_ERROR:Lcom/motorola/otalib/downloadservice/download/HttpDownloaderStatus;

    sget-object v1, Lcom/motorola/otalib/downloadservice/download/HttpDownloaderStatus;->DOWNLOAD_FATAL_ERROR:Lcom/motorola/otalib/downloadservice/download/HttpDownloaderStatus;

    sget-object v2, Lcom/motorola/otalib/downloadservice/download/HttpDownloaderStatus;->DOWNLOAD_OK:Lcom/motorola/otalib/downloadservice/download/HttpDownloaderStatus;

    filled-new-array {v0, v1, v2}, [Lcom/motorola/otalib/downloadservice/download/HttpDownloaderStatus;

    move-result-object v0

    return-object v0
.end method

.method static constructor <clinit>()V
    .locals 3

    new-instance v0, Lcom/motorola/otalib/downloadservice/download/HttpDownloaderStatus;

    const-string v1, "DOWNLOAD_RECEIVED_HTTP_ERROR"

    const/4 v2, 0x0

    invoke-direct {v0, v1, v2}, Lcom/motorola/otalib/downloadservice/download/HttpDownloaderStatus;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/motorola/otalib/downloadservice/download/HttpDownloaderStatus;->DOWNLOAD_RECEIVED_HTTP_ERROR:Lcom/motorola/otalib/downloadservice/download/HttpDownloaderStatus;

    new-instance v0, Lcom/motorola/otalib/downloadservice/download/HttpDownloaderStatus;

    const-string v1, "DOWNLOAD_FATAL_ERROR"

    const/4 v2, 0x1

    invoke-direct {v0, v1, v2}, Lcom/motorola/otalib/downloadservice/download/HttpDownloaderStatus;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/motorola/otalib/downloadservice/download/HttpDownloaderStatus;->DOWNLOAD_FATAL_ERROR:Lcom/motorola/otalib/downloadservice/download/HttpDownloaderStatus;

    new-instance v0, Lcom/motorola/otalib/downloadservice/download/HttpDownloaderStatus;

    const-string v1, "DOWNLOAD_OK"

    const/4 v2, 0x2

    invoke-direct {v0, v1, v2}, Lcom/motorola/otalib/downloadservice/download/HttpDownloaderStatus;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/motorola/otalib/downloadservice/download/HttpDownloaderStatus;->DOWNLOAD_OK:Lcom/motorola/otalib/downloadservice/download/HttpDownloaderStatus;

    invoke-static {}, Lcom/motorola/otalib/downloadservice/download/HttpDownloaderStatus;->$values()[Lcom/motorola/otalib/downloadservice/download/HttpDownloaderStatus;

    move-result-object v0

    sput-object v0, Lcom/motorola/otalib/downloadservice/download/HttpDownloaderStatus;->$VALUES:[Lcom/motorola/otalib/downloadservice/download/HttpDownloaderStatus;

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

.method public static valueOf(Ljava/lang/String;)Lcom/motorola/otalib/downloadservice/download/HttpDownloaderStatus;
    .locals 1

    const-class v0, Lcom/motorola/otalib/downloadservice/download/HttpDownloaderStatus;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object p0

    check-cast p0, Lcom/motorola/otalib/downloadservice/download/HttpDownloaderStatus;

    return-object p0
.end method

.method public static values()[Lcom/motorola/otalib/downloadservice/download/HttpDownloaderStatus;
    .locals 1

    sget-object v0, Lcom/motorola/otalib/downloadservice/download/HttpDownloaderStatus;->$VALUES:[Lcom/motorola/otalib/downloadservice/download/HttpDownloaderStatus;

    invoke-virtual {v0}, [Lcom/motorola/otalib/downloadservice/download/HttpDownloaderStatus;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lcom/motorola/otalib/downloadservice/download/HttpDownloaderStatus;

    return-object v0
.end method
