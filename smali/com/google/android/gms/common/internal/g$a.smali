.class final Lcom/google/android/gms/common/internal/g$a;
.super Ljava/lang/Object;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/google/android/gms/common/internal/g;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x10
    name = "a"
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/google/android/gms/common/internal/g$a$a;
    }
.end annotation


# instance fields
.field private final LV:Ljava/lang/String;

.field private final LW:Lcom/google/android/gms/common/internal/g$a$a;

.field private final LX:Ljava/util/HashSet;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashSet<",
            "Lcom/google/android/gms/common/internal/e<",
            "*>.f;>;"
        }
    .end annotation
.end field

.field private LY:Z

.field private LZ:Landroid/os/IBinder;

.field private Ma:Landroid/content/ComponentName;

.field final synthetic Mb:Lcom/google/android/gms/common/internal/g;

.field private mState:I


# direct methods
.method public constructor <init>(Lcom/google/android/gms/common/internal/g;Ljava/lang/String;)V
    .locals 0

    iput-object p1, p0, Lcom/google/android/gms/common/internal/g$a;->Mb:Lcom/google/android/gms/common/internal/g;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p2, p0, Lcom/google/android/gms/common/internal/g$a;->LV:Ljava/lang/String;

    new-instance p1, Lcom/google/android/gms/common/internal/g$a$a;

    invoke-direct {p1, p0}, Lcom/google/android/gms/common/internal/g$a$a;-><init>(Lcom/google/android/gms/common/internal/g$a;)V

    iput-object p1, p0, Lcom/google/android/gms/common/internal/g$a;->LW:Lcom/google/android/gms/common/internal/g$a$a;

    new-instance p1, Ljava/util/HashSet;

    invoke-direct {p1}, Ljava/util/HashSet;-><init>()V

    iput-object p1, p0, Lcom/google/android/gms/common/internal/g$a;->LX:Ljava/util/HashSet;

    const/4 p1, 0x0

    iput p1, p0, Lcom/google/android/gms/common/internal/g$a;->mState:I

    return-void
.end method

.method static synthetic a(Lcom/google/android/gms/common/internal/g$a;I)I
    .locals 0

    iput p1, p0, Lcom/google/android/gms/common/internal/g$a;->mState:I

    return p1
.end method

.method static synthetic a(Lcom/google/android/gms/common/internal/g$a;Landroid/content/ComponentName;)Landroid/content/ComponentName;
    .locals 0

    iput-object p1, p0, Lcom/google/android/gms/common/internal/g$a;->Ma:Landroid/content/ComponentName;

    return-object p1
.end method

.method static synthetic a(Lcom/google/android/gms/common/internal/g$a;Landroid/os/IBinder;)Landroid/os/IBinder;
    .locals 0

    iput-object p1, p0, Lcom/google/android/gms/common/internal/g$a;->LZ:Landroid/os/IBinder;

    return-object p1
.end method

.method static synthetic a(Lcom/google/android/gms/common/internal/g$a;)Ljava/util/HashSet;
    .locals 0

    iget-object p0, p0, Lcom/google/android/gms/common/internal/g$a;->LX:Ljava/util/HashSet;

    return-object p0
.end method


# virtual methods
.method public J(Z)V
    .locals 0

    iput-boolean p1, p0, Lcom/google/android/gms/common/internal/g$a;->LY:Z

    return-void
.end method

.method public a(Lcom/google/android/gms/common/internal/e$f;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/google/android/gms/common/internal/e<",
            "*>.f;)V"
        }
    .end annotation

    iget-object p0, p0, Lcom/google/android/gms/common/internal/g$a;->LX:Ljava/util/HashSet;

    invoke-virtual {p0, p1}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    return-void
.end method

.method public b(Lcom/google/android/gms/common/internal/e$f;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/google/android/gms/common/internal/e<",
            "*>.f;)V"
        }
    .end annotation

    iget-object p0, p0, Lcom/google/android/gms/common/internal/g$a;->LX:Ljava/util/HashSet;

    invoke-virtual {p0, p1}, Ljava/util/HashSet;->remove(Ljava/lang/Object;)Z

    return-void
.end method

.method public c(Lcom/google/android/gms/common/internal/e$f;)Z
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/google/android/gms/common/internal/e<",
            "*>.f;)Z"
        }
    .end annotation

    iget-object p0, p0, Lcom/google/android/gms/common/internal/g$a;->LX:Ljava/util/HashSet;

    invoke-virtual {p0, p1}, Ljava/util/HashSet;->contains(Ljava/lang/Object;)Z

    move-result p0

    return p0
.end method

.method public gW()Lcom/google/android/gms/common/internal/g$a$a;
    .locals 0

    iget-object p0, p0, Lcom/google/android/gms/common/internal/g$a;->LW:Lcom/google/android/gms/common/internal/g$a$a;

    return-object p0
.end method

.method public gX()Ljava/lang/String;
    .locals 0

    iget-object p0, p0, Lcom/google/android/gms/common/internal/g$a;->LV:Ljava/lang/String;

    return-object p0
.end method

.method public gY()Z
    .locals 0

    iget-object p0, p0, Lcom/google/android/gms/common/internal/g$a;->LX:Ljava/util/HashSet;

    invoke-virtual {p0}, Ljava/util/HashSet;->isEmpty()Z

    move-result p0

    return p0
.end method

.method public getBinder()Landroid/os/IBinder;
    .locals 0

    iget-object p0, p0, Lcom/google/android/gms/common/internal/g$a;->LZ:Landroid/os/IBinder;

    return-object p0
.end method

.method public getComponentName()Landroid/content/ComponentName;
    .locals 0

    iget-object p0, p0, Lcom/google/android/gms/common/internal/g$a;->Ma:Landroid/content/ComponentName;

    return-object p0
.end method

.method public getState()I
    .locals 0

    iget p0, p0, Lcom/google/android/gms/common/internal/g$a;->mState:I

    return p0
.end method

.method public isBound()Z
    .locals 0

    iget-boolean p0, p0, Lcom/google/android/gms/common/internal/g$a;->LY:Z

    return p0
.end method
