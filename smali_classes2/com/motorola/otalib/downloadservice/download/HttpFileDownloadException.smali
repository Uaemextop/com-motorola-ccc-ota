.class public Lcom/motorola/otalib/downloadservice/download/HttpFileDownloadException;
.super Ljava/lang/Exception;
.source "HttpFileDownloadException.java"


# static fields
.field private static final serialVersionUID:J = 0x1L


# instance fields
.field private downloaderStatus:Lcom/motorola/otalib/downloadservice/download/HttpDownloaderStatus;

.field private spErrorCode:Ljava/lang/String;

.field private status:I


# direct methods
.method public constructor <init>(Ljava/lang/String;I)V
    .locals 0

    invoke-direct {p0, p1}, Ljava/lang/Exception;-><init>(Ljava/lang/String;)V

    sget-object p1, Lcom/motorola/otalib/downloadservice/download/HttpDownloaderStatus;->DOWNLOAD_RECEIVED_HTTP_ERROR:Lcom/motorola/otalib/downloadservice/download/HttpDownloaderStatus;

    iput-object p1, p0, Lcom/motorola/otalib/downloadservice/download/HttpFileDownloadException;->downloaderStatus:Lcom/motorola/otalib/downloadservice/download/HttpDownloaderStatus;

    iput p2, p0, Lcom/motorola/otalib/downloadservice/download/HttpFileDownloadException;->status:I

    return-void
.end method

.method public constructor <init>(Ljava/lang/String;ILjava/lang/String;)V
    .locals 0

    invoke-direct {p0, p1}, Ljava/lang/Exception;-><init>(Ljava/lang/String;)V

    sget-object p1, Lcom/motorola/otalib/downloadservice/download/HttpDownloaderStatus;->DOWNLOAD_RECEIVED_HTTP_ERROR:Lcom/motorola/otalib/downloadservice/download/HttpDownloaderStatus;

    iput-object p1, p0, Lcom/motorola/otalib/downloadservice/download/HttpFileDownloadException;->downloaderStatus:Lcom/motorola/otalib/downloadservice/download/HttpDownloaderStatus;

    iput p2, p0, Lcom/motorola/otalib/downloadservice/download/HttpFileDownloadException;->status:I

    iput-object p3, p0, Lcom/motorola/otalib/downloadservice/download/HttpFileDownloadException;->spErrorCode:Ljava/lang/String;

    return-void
.end method

.method public constructor <init>(Ljava/lang/String;Lcom/motorola/otalib/downloadservice/download/HttpDownloaderStatus;)V
    .locals 0

    invoke-direct {p0, p1}, Ljava/lang/Exception;-><init>(Ljava/lang/String;)V

    iput-object p2, p0, Lcom/motorola/otalib/downloadservice/download/HttpFileDownloadException;->downloaderStatus:Lcom/motorola/otalib/downloadservice/download/HttpDownloaderStatus;

    const/4 p1, -0x1

    iput p1, p0, Lcom/motorola/otalib/downloadservice/download/HttpFileDownloadException;->status:I

    return-void
.end method


# virtual methods
.method public getDownloaderStatus()Lcom/motorola/otalib/downloadservice/download/HttpDownloaderStatus;
    .locals 0

    iget-object p0, p0, Lcom/motorola/otalib/downloadservice/download/HttpFileDownloadException;->downloaderStatus:Lcom/motorola/otalib/downloadservice/download/HttpDownloaderStatus;

    return-object p0
.end method

.method public getSpErrorCode()Ljava/lang/String;
    .locals 0

    iget-object p0, p0, Lcom/motorola/otalib/downloadservice/download/HttpFileDownloadException;->spErrorCode:Ljava/lang/String;

    return-object p0
.end method

.method public getStatus()I
    .locals 0

    iget p0, p0, Lcom/motorola/otalib/downloadservice/download/HttpFileDownloadException;->status:I

    return p0
.end method
