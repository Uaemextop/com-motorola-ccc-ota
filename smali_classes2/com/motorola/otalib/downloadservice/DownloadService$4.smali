.class synthetic Lcom/motorola/otalib/downloadservice/DownloadService$4;
.super Ljava/lang/Object;
.source "DownloadService.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/motorola/otalib/downloadservice/DownloadService;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1008
    name = null
.end annotation


# static fields
.field static final synthetic $SwitchMap$com$motorola$otalib$downloadservice$DownloadService$WHAT:[I


# direct methods
.method static constructor <clinit>()V
    .locals 3

    invoke-static {}, Lcom/motorola/otalib/downloadservice/DownloadService$WHAT;->values()[Lcom/motorola/otalib/downloadservice/DownloadService$WHAT;

    move-result-object v0

    array-length v0, v0

    new-array v0, v0, [I

    sput-object v0, Lcom/motorola/otalib/downloadservice/DownloadService$4;->$SwitchMap$com$motorola$otalib$downloadservice$DownloadService$WHAT:[I

    :try_start_0
    sget-object v1, Lcom/motorola/otalib/downloadservice/DownloadService$WHAT;->DOWNLOAD_SERVICE_REQUEST:Lcom/motorola/otalib/downloadservice/DownloadService$WHAT;

    invoke-virtual {v1}, Lcom/motorola/otalib/downloadservice/DownloadService$WHAT;->ordinal()I

    move-result v1

    const/4 v2, 0x1

    aput v2, v0, v1
    :try_end_0
    .catch Ljava/lang/NoSuchFieldError; {:try_start_0 .. :try_end_0} :catch_0

    :catch_0
    :try_start_1
    sget-object v0, Lcom/motorola/otalib/downloadservice/DownloadService$4;->$SwitchMap$com$motorola$otalib$downloadservice$DownloadService$WHAT:[I

    sget-object v1, Lcom/motorola/otalib/downloadservice/DownloadService$WHAT;->STOP_DOWNLOAD_SERVICE:Lcom/motorola/otalib/downloadservice/DownloadService$WHAT;

    invoke-virtual {v1}, Lcom/motorola/otalib/downloadservice/DownloadService$WHAT;->ordinal()I

    move-result v1

    const/4 v2, 0x2

    aput v2, v0, v1
    :try_end_1
    .catch Ljava/lang/NoSuchFieldError; {:try_start_1 .. :try_end_1} :catch_1

    :catch_1
    return-void
.end method
