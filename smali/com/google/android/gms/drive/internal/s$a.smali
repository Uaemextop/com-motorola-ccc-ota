.class Lcom/google/android/gms/drive/internal/s$a;
.super Ljava/lang/Object;

# interfaces
.implements Lcom/google/android/gms/drive/DriveFile$DownloadProgressListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/google/android/gms/drive/internal/s;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "a"
.end annotation


# instance fields
.field private final OQ:Lcom/google/android/gms/common/api/c;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/google/android/gms/common/api/c<",
            "Lcom/google/android/gms/drive/DriveFile$DownloadProgressListener;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Lcom/google/android/gms/common/api/c;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/google/android/gms/common/api/c<",
            "Lcom/google/android/gms/drive/DriveFile$DownloadProgressListener;",
            ">;)V"
        }
    .end annotation

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/google/android/gms/drive/internal/s$a;->OQ:Lcom/google/android/gms/common/api/c;

    return-void
.end method


# virtual methods
.method public onProgress(JJ)V
    .locals 8

    iget-object v0, p0, Lcom/google/android/gms/drive/internal/s$a;->OQ:Lcom/google/android/gms/common/api/c;

    new-instance v7, Lcom/google/android/gms/drive/internal/s$a$1;

    move-object v1, v7

    move-object v2, p0

    move-wide v3, p1

    move-wide v5, p3

    invoke-direct/range {v1 .. v6}, Lcom/google/android/gms/drive/internal/s$a$1;-><init>(Lcom/google/android/gms/drive/internal/s$a;JJ)V

    invoke-virtual {v0, v7}, Lcom/google/android/gms/common/api/c;->a(Lcom/google/android/gms/common/api/c$b;)V

    return-void
.end method
