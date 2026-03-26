.class Lcom/motorola/otalib/cdsservice/InternalRetryHandler;
.super Landroid/os/Binder;
.source "InternalRetryHandler.java"

# interfaces
.implements Landroid/os/Parcelable;


# static fields
.field public static final CREATOR:Landroid/os/Parcelable$Creator;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/os/Parcelable$Creator<",
            "Lcom/motorola/otalib/cdsservice/InternalRetryHandler;",
            ">;"
        }
    .end annotation
.end field

.field private static final DESCRIPTOR:Ljava/lang/String; = "com.motorola.cds.webservice.WebServiceRetryHandler"

.field private static final TRANSACTION_retryHandler:I = 0x1


# instance fields
.field private handler:Lcom/motorola/otalib/cdsservice/RetryHandler;

.field private remote:Landroid/os/IBinder;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    new-instance v0, Lcom/motorola/otalib/cdsservice/InternalRetryHandler$1;

    invoke-direct {v0}, Lcom/motorola/otalib/cdsservice/InternalRetryHandler$1;-><init>()V

    sput-object v0, Lcom/motorola/otalib/cdsservice/InternalRetryHandler;->CREATOR:Landroid/os/Parcelable$Creator;

    return-void
.end method

.method private constructor <init>(Landroid/os/Parcel;)V
    .locals 0

    invoke-direct {p0}, Landroid/os/Binder;-><init>()V

    invoke-virtual {p1}, Landroid/os/Parcel;->readStrongBinder()Landroid/os/IBinder;

    move-result-object p1

    iput-object p1, p0, Lcom/motorola/otalib/cdsservice/InternalRetryHandler;->remote:Landroid/os/IBinder;

    return-void
.end method

.method synthetic constructor <init>(Landroid/os/Parcel;Lcom/motorola/otalib/cdsservice/InternalRetryHandler$1;)V
    .locals 0

    invoke-direct {p0, p1}, Lcom/motorola/otalib/cdsservice/InternalRetryHandler;-><init>(Landroid/os/Parcel;)V

    return-void
.end method

.method public constructor <init>(Lcom/motorola/otalib/cdsservice/RetryHandler;)V
    .locals 0

    invoke-direct {p0}, Landroid/os/Binder;-><init>()V

    iput-object p1, p0, Lcom/motorola/otalib/cdsservice/InternalRetryHandler;->handler:Lcom/motorola/otalib/cdsservice/RetryHandler;

    return-void
.end method


# virtual methods
.method public describeContents()I
    .locals 0

    const/4 p0, 0x0

    return p0
.end method

.method public invokeRetryHandler(Lcom/motorola/otalib/cdsservice/webdataobjects/WebResponse;)Z
    .locals 6

    const-string v0, "Caught json exception while invoking retryHandler "

    const-string v1, "Caught remote exception while invoking retryHandler "

    invoke-static {}, Landroid/os/Parcel;->obtain()Landroid/os/Parcel;

    move-result-object v2

    invoke-static {}, Landroid/os/Parcel;->obtain()Landroid/os/Parcel;

    move-result-object v3

    const/4 v4, 0x0

    :try_start_0
    const-string v5, "com.motorola.cds.webservice.WebServiceRetryHandler"

    invoke-virtual {v2, v5}, Landroid/os/Parcel;->writeInterfaceToken(Ljava/lang/String;)V

    invoke-static {p1}, Lcom/motorola/otalib/cdsservice/webdataobjects/builders/WebResponseBuilder;->toJSONString(Lcom/motorola/otalib/cdsservice/webdataobjects/WebResponse;)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v2, p1}, Landroid/os/Parcel;->writeString(Ljava/lang/String;)V

    iget-object p0, p0, Lcom/motorola/otalib/cdsservice/InternalRetryHandler;->remote:Landroid/os/IBinder;

    const/4 p1, 0x1

    invoke-interface {p0, p1, v2, v3, v4}, Landroid/os/IBinder;->transact(ILandroid/os/Parcel;Landroid/os/Parcel;I)Z

    invoke-virtual {v3}, Landroid/os/Parcel;->readException()V

    invoke-virtual {v3}, Landroid/os/Parcel;->readInt()I

    move-result p0
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    if-ne p0, p1, :cond_0

    move v4, p1

    :cond_0
    :goto_0
    invoke-virtual {v2}, Landroid/os/Parcel;->recycle()V

    invoke-virtual {v3}, Landroid/os/Parcel;->recycle()V

    return v4

    :catchall_0
    move-exception p0

    goto :goto_1

    :catch_0
    move-exception p0

    :try_start_1
    sget-object p1, Lcom/motorola/otalib/cdsservice/utils/CDSLogger;->TAG:Ljava/lang/String;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-static {p1, p0}, Lcom/motorola/otalib/cdsservice/utils/CDSLogger;->e(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_0

    :catch_1
    move-exception p0

    sget-object p1, Lcom/motorola/otalib/cdsservice/utils/CDSLogger;->TAG:Ljava/lang/String;

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-static {p1, p0}, Lcom/motorola/otalib/cdsservice/utils/CDSLogger;->e(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_0

    :goto_1
    invoke-virtual {v2}, Landroid/os/Parcel;->recycle()V

    invoke-virtual {v3}, Landroid/os/Parcel;->recycle()V

    throw p0
.end method

.method protected onTransact(ILandroid/os/Parcel;Landroid/os/Parcel;I)Z
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/os/RemoteException;
        }
    .end annotation

    const-string v0, "com.motorola.cds.webservice.WebServiceRetryHandler"

    const/4 v1, 0x1

    if-eq p1, v1, :cond_1

    const v2, 0x5f4e5446

    if-eq p1, v2, :cond_0

    invoke-super {p0, p1, p2, p3, p4}, Landroid/os/Binder;->onTransact(ILandroid/os/Parcel;Landroid/os/Parcel;I)Z

    move-result p0

    return p0

    :cond_0
    invoke-virtual {p3, v0}, Landroid/os/Parcel;->writeString(Ljava/lang/String;)V

    return v1

    :cond_1
    invoke-virtual {p2, v0}, Landroid/os/Parcel;->enforceInterface(Ljava/lang/String;)V

    invoke-virtual {p2}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    move-result-object p1

    sget-object p2, Lcom/motorola/otalib/cdsservice/utils/CDSLogger;->TAG:Ljava/lang/String;

    new-instance p4, Ljava/lang/StringBuilder;

    const-string v0, "InternalRetryHandler:onTransact() response string from WebService"

    invoke-direct {p4, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p4, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p4

    invoke-virtual {p4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p4

    invoke-static {p2, p4}, Lcom/motorola/otalib/cdsservice/utils/CDSLogger;->d(Ljava/lang/String;Ljava/lang/String;)V

    iget-object p0, p0, Lcom/motorola/otalib/cdsservice/InternalRetryHandler;->handler:Lcom/motorola/otalib/cdsservice/RetryHandler;

    if-eqz p0, :cond_2

    invoke-static {p1}, Lcom/motorola/otalib/cdsservice/webdataobjects/builders/WebResponseBuilder;->from(Ljava/lang/String;)Lcom/motorola/otalib/cdsservice/webdataobjects/WebResponse;

    move-result-object p1

    invoke-interface {p0, p1}, Lcom/motorola/otalib/cdsservice/RetryHandler;->retryRequest(Lcom/motorola/otalib/cdsservice/webdataobjects/WebResponse;)Z

    move-result p0

    goto :goto_0

    :cond_2
    sget-object p0, Lcom/motorola/otalib/cdsservice/utils/CDSLogger;->TAG:Ljava/lang/String;

    const-string p1, "InternalRetryHandler:onTransact() retry handler is null"

    invoke-static {p0, p1}, Lcom/motorola/otalib/cdsservice/utils/CDSLogger;->d(Ljava/lang/String;Ljava/lang/String;)V

    const/4 p0, 0x0

    :goto_0
    invoke-virtual {p3}, Landroid/os/Parcel;->writeNoException()V

    invoke-virtual {p3, p0}, Landroid/os/Parcel;->writeInt(I)V

    return v1
.end method

.method public writeToParcel(Landroid/os/Parcel;I)V
    .locals 0

    invoke-virtual {p1, p0}, Landroid/os/Parcel;->writeStrongBinder(Landroid/os/IBinder;)V

    return-void
.end method
