.class public Lcom/google/android/gms/drive/internal/y;
.super Lcom/google/android/gms/drive/internal/ad$a;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/google/android/gms/drive/internal/y$a;
    }
.end annotation


# instance fields
.field private final Oa:I

.field private final Pe:Lcom/google/android/gms/drive/events/c;

.field private final Pf:Lcom/google/android/gms/drive/internal/y$a;

.field private final Pg:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Landroid/os/Looper;Landroid/content/Context;ILcom/google/android/gms/drive/events/c;)V
    .locals 1

    invoke-direct {p0}, Lcom/google/android/gms/drive/internal/ad$a;-><init>()V

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/google/android/gms/drive/internal/y;->Pg:Ljava/util/List;

    iput p3, p0, Lcom/google/android/gms/drive/internal/y;->Oa:I

    iput-object p4, p0, Lcom/google/android/gms/drive/internal/y;->Pe:Lcom/google/android/gms/drive/events/c;

    new-instance p3, Lcom/google/android/gms/drive/internal/y$a;

    const/4 p4, 0x0

    invoke-direct {p3, p1, p2, p4}, Lcom/google/android/gms/drive/internal/y$a;-><init>(Landroid/os/Looper;Landroid/content/Context;Lcom/google/android/gms/drive/internal/y$1;)V

    iput-object p3, p0, Lcom/google/android/gms/drive/internal/y;->Pf:Lcom/google/android/gms/drive/internal/y$a;

    return-void
.end method


# virtual methods
.method public bq(I)V
    .locals 0

    iget-object p0, p0, Lcom/google/android/gms/drive/internal/y;->Pg:Ljava/util/List;

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p1

    invoke-interface {p0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    return-void
.end method

.method public br(I)Z
    .locals 0

    iget-object p0, p0, Lcom/google/android/gms/drive/internal/y;->Pg:Ljava/util/List;

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p1

    invoke-interface {p0, p1}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    move-result p0

    return p0
.end method

.method public c(Lcom/google/android/gms/drive/internal/OnEventResponse;)V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/os/RemoteException;
        }
    .end annotation

    invoke-virtual {p1}, Lcom/google/android/gms/drive/internal/OnEventResponse;->ih()Lcom/google/android/gms/drive/events/DriveEvent;

    move-result-object p1

    iget v0, p0, Lcom/google/android/gms/drive/internal/y;->Oa:I

    invoke-interface {p1}, Lcom/google/android/gms/drive/events/DriveEvent;->getType()I

    move-result v1

    if-ne v0, v1, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    invoke-static {v0}, Lcom/google/android/gms/common/internal/o;->I(Z)V

    iget-object v0, p0, Lcom/google/android/gms/drive/internal/y;->Pg:Ljava/util/List;

    invoke-interface {p1}, Lcom/google/android/gms/drive/events/DriveEvent;->getType()I

    move-result v1

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-interface {v0, v1}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    move-result v0

    invoke-static {v0}, Lcom/google/android/gms/common/internal/o;->I(Z)V

    iget-object v0, p0, Lcom/google/android/gms/drive/internal/y;->Pf:Lcom/google/android/gms/drive/internal/y$a;

    iget-object p0, p0, Lcom/google/android/gms/drive/internal/y;->Pe:Lcom/google/android/gms/drive/events/c;

    invoke-virtual {v0, p0, p1}, Lcom/google/android/gms/drive/internal/y$a;->a(Lcom/google/android/gms/drive/events/c;Lcom/google/android/gms/drive/events/DriveEvent;)V

    return-void
.end method
