.class public Lcom/google/android/gms/drive/Contents;
.super Ljava/lang/Object;

# interfaces
.implements Lcom/google/android/gms/common/internal/safeparcel/SafeParcelable;


# annotations
.annotation runtime Ljava/lang/Deprecated;
.end annotation


# static fields
.field public static final CREATOR:Landroid/os/Parcelable$Creator;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/os/Parcelable$Creator<",
            "Lcom/google/android/gms/drive/Contents;",
            ">;"
        }
    .end annotation
.end field


# instance fields
.field final BR:I

.field final KE:Landroid/os/ParcelFileDescriptor;

.field final MV:I

.field final MW:Lcom/google/android/gms/drive/DriveId;

.field final MX:Z

.field private MY:Z

.field private MZ:Z

.field private mClosed:Z

.field final uQ:I


# direct methods
.method static constructor <clinit>()V
    .locals 1

    new-instance v0, Lcom/google/android/gms/drive/a;

    invoke-direct {v0}, Lcom/google/android/gms/drive/a;-><init>()V

    sput-object v0, Lcom/google/android/gms/drive/Contents;->CREATOR:Landroid/os/Parcelable$Creator;

    return-void
.end method

.method constructor <init>(ILandroid/os/ParcelFileDescriptor;IILcom/google/android/gms/drive/DriveId;Z)V
    .locals 1

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/google/android/gms/drive/Contents;->mClosed:Z

    iput-boolean v0, p0, Lcom/google/android/gms/drive/Contents;->MY:Z

    iput-boolean v0, p0, Lcom/google/android/gms/drive/Contents;->MZ:Z

    iput p1, p0, Lcom/google/android/gms/drive/Contents;->BR:I

    iput-object p2, p0, Lcom/google/android/gms/drive/Contents;->KE:Landroid/os/ParcelFileDescriptor;

    iput p3, p0, Lcom/google/android/gms/drive/Contents;->uQ:I

    iput p4, p0, Lcom/google/android/gms/drive/Contents;->MV:I

    iput-object p5, p0, Lcom/google/android/gms/drive/Contents;->MW:Lcom/google/android/gms/drive/DriveId;

    iput-boolean p6, p0, Lcom/google/android/gms/drive/Contents;->MX:Z

    return-void
.end method


# virtual methods
.method public describeContents()I
    .locals 0

    const/4 p0, 0x0

    return p0
.end method

.method public getDriveId()Lcom/google/android/gms/drive/DriveId;
    .locals 0

    iget-object p0, p0, Lcom/google/android/gms/drive/Contents;->MW:Lcom/google/android/gms/drive/DriveId;

    return-object p0
.end method

.method public getInputStream()Ljava/io/InputStream;
    .locals 2

    iget-boolean v0, p0, Lcom/google/android/gms/drive/Contents;->mClosed:Z

    if-nez v0, :cond_2

    iget v0, p0, Lcom/google/android/gms/drive/Contents;->MV:I

    const/high16 v1, 0x10000000

    if-ne v0, v1, :cond_1

    iget-boolean v0, p0, Lcom/google/android/gms/drive/Contents;->MY:Z

    if-nez v0, :cond_0

    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/google/android/gms/drive/Contents;->MY:Z

    new-instance v0, Ljava/io/FileInputStream;

    iget-object p0, p0, Lcom/google/android/gms/drive/Contents;->KE:Landroid/os/ParcelFileDescriptor;

    invoke-virtual {p0}, Landroid/os/ParcelFileDescriptor;->getFileDescriptor()Ljava/io/FileDescriptor;

    move-result-object p0

    invoke-direct {v0, p0}, Ljava/io/FileInputStream;-><init>(Ljava/io/FileDescriptor;)V

    return-object v0

    :cond_0
    new-instance p0, Ljava/lang/IllegalStateException;

    const-string v0, "getInputStream() can only be called once per Contents instance."

    invoke-direct {p0, v0}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw p0

    :cond_1
    new-instance p0, Ljava/lang/IllegalStateException;

    const-string v0, "getInputStream() can only be used with contents opened with MODE_READ_ONLY."

    invoke-direct {p0, v0}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw p0

    :cond_2
    new-instance p0, Ljava/lang/IllegalStateException;

    const-string v0, "Contents have been closed, cannot access the input stream."

    invoke-direct {p0, v0}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw p0
.end method

.method public getMode()I
    .locals 0

    iget p0, p0, Lcom/google/android/gms/drive/Contents;->MV:I

    return p0
.end method

.method public getOutputStream()Ljava/io/OutputStream;
    .locals 2

    iget-boolean v0, p0, Lcom/google/android/gms/drive/Contents;->mClosed:Z

    if-nez v0, :cond_2

    iget v0, p0, Lcom/google/android/gms/drive/Contents;->MV:I

    const/high16 v1, 0x20000000

    if-ne v0, v1, :cond_1

    iget-boolean v0, p0, Lcom/google/android/gms/drive/Contents;->MZ:Z

    if-nez v0, :cond_0

    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/google/android/gms/drive/Contents;->MZ:Z

    new-instance v0, Ljava/io/FileOutputStream;

    iget-object p0, p0, Lcom/google/android/gms/drive/Contents;->KE:Landroid/os/ParcelFileDescriptor;

    invoke-virtual {p0}, Landroid/os/ParcelFileDescriptor;->getFileDescriptor()Ljava/io/FileDescriptor;

    move-result-object p0

    invoke-direct {v0, p0}, Ljava/io/FileOutputStream;-><init>(Ljava/io/FileDescriptor;)V

    return-object v0

    :cond_0
    new-instance p0, Ljava/lang/IllegalStateException;

    const-string v0, "getOutputStream() can only be called once per Contents instance."

    invoke-direct {p0, v0}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw p0

    :cond_1
    new-instance p0, Ljava/lang/IllegalStateException;

    const-string v0, "getOutputStream() can only be used with contents opened with MODE_WRITE_ONLY."

    invoke-direct {p0, v0}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw p0

    :cond_2
    new-instance p0, Ljava/lang/IllegalStateException;

    const-string v0, "Contents have been closed, cannot access the output stream."

    invoke-direct {p0, v0}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw p0
.end method

.method public getParcelFileDescriptor()Landroid/os/ParcelFileDescriptor;
    .locals 1

    iget-boolean v0, p0, Lcom/google/android/gms/drive/Contents;->mClosed:Z

    if-nez v0, :cond_0

    iget-object p0, p0, Lcom/google/android/gms/drive/Contents;->KE:Landroid/os/ParcelFileDescriptor;

    return-object p0

    :cond_0
    new-instance p0, Ljava/lang/IllegalStateException;

    const-string v0, "Contents have been closed, cannot access the output stream."

    invoke-direct {p0, v0}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw p0
.end method

.method public getRequestId()I
    .locals 0

    iget p0, p0, Lcom/google/android/gms/drive/Contents;->uQ:I

    return p0
.end method

.method public hJ()V
    .locals 1

    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/google/android/gms/drive/Contents;->mClosed:Z

    return-void
.end method

.method public hK()Z
    .locals 0

    iget-boolean p0, p0, Lcom/google/android/gms/drive/Contents;->mClosed:Z

    return p0
.end method

.method public hL()Z
    .locals 0

    iget-boolean p0, p0, Lcom/google/android/gms/drive/Contents;->MX:Z

    return p0
.end method

.method public writeToParcel(Landroid/os/Parcel;I)V
    .locals 0

    invoke-static {p0, p1, p2}, Lcom/google/android/gms/drive/a;->a(Lcom/google/android/gms/drive/Contents;Landroid/os/Parcel;I)V

    return-void
.end method
