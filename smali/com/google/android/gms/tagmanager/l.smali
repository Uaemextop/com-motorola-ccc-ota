.class Lcom/google/android/gms/tagmanager/l;
.super Ljava/lang/Object;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/google/android/gms/tagmanager/l$a;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<K:",
        "Ljava/lang/Object;",
        "V:",
        "Ljava/lang/Object;",
        ">",
        "Ljava/lang/Object;"
    }
.end annotation


# instance fields
.field final aoa:Lcom/google/android/gms/tagmanager/l$a;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/google/android/gms/tagmanager/l$a<",
            "TK;TV;>;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>()V
    .locals 1

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance v0, Lcom/google/android/gms/tagmanager/l$1;

    invoke-direct {v0, p0}, Lcom/google/android/gms/tagmanager/l$1;-><init>(Lcom/google/android/gms/tagmanager/l;)V

    iput-object v0, p0, Lcom/google/android/gms/tagmanager/l;->aoa:Lcom/google/android/gms/tagmanager/l$a;

    return-void
.end method


# virtual methods
.method public a(ILcom/google/android/gms/tagmanager/l$a;)Lcom/google/android/gms/tagmanager/k;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I",
            "Lcom/google/android/gms/tagmanager/l$a<",
            "TK;TV;>;)",
            "Lcom/google/android/gms/tagmanager/k<",
            "TK;TV;>;"
        }
    .end annotation

    if-lez p1, :cond_1

    invoke-virtual {p0}, Lcom/google/android/gms/tagmanager/l;->nP()I

    move-result p0

    const/16 v0, 0xc

    if-ge p0, v0, :cond_0

    new-instance p0, Lcom/google/android/gms/tagmanager/da;

    invoke-direct {p0, p1, p2}, Lcom/google/android/gms/tagmanager/da;-><init>(ILcom/google/android/gms/tagmanager/l$a;)V

    return-object p0

    :cond_0
    new-instance p0, Lcom/google/android/gms/tagmanager/bb;

    invoke-direct {p0, p1, p2}, Lcom/google/android/gms/tagmanager/bb;-><init>(ILcom/google/android/gms/tagmanager/l$a;)V

    return-object p0

    :cond_1
    new-instance p0, Ljava/lang/IllegalArgumentException;

    const-string p1, "maxSize <= 0"

    invoke-direct {p0, p1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p0
.end method

.method nP()I
    .locals 0

    sget p0, Landroid/os/Build$VERSION;->SDK_INT:I

    return p0
.end method
