.class Lcom/google/android/gms/tagmanager/bb$1;
.super Landroid/util/LruCache;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/google/android/gms/tagmanager/bb;-><init>(ILcom/google/android/gms/tagmanager/l$a;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Landroid/util/LruCache<",
        "TK;TV;>;"
    }
.end annotation


# instance fields
.field final synthetic apJ:Lcom/google/android/gms/tagmanager/l$a;

.field final synthetic apK:Lcom/google/android/gms/tagmanager/bb;


# direct methods
.method constructor <init>(Lcom/google/android/gms/tagmanager/bb;ILcom/google/android/gms/tagmanager/l$a;)V
    .locals 0

    iput-object p1, p0, Lcom/google/android/gms/tagmanager/bb$1;->apK:Lcom/google/android/gms/tagmanager/bb;

    iput-object p3, p0, Lcom/google/android/gms/tagmanager/bb$1;->apJ:Lcom/google/android/gms/tagmanager/l$a;

    invoke-direct {p0, p2}, Landroid/util/LruCache;-><init>(I)V

    return-void
.end method


# virtual methods
.method protected sizeOf(Ljava/lang/Object;Ljava/lang/Object;)I
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TK;TV;)I"
        }
    .end annotation

    iget-object p0, p0, Lcom/google/android/gms/tagmanager/bb$1;->apJ:Lcom/google/android/gms/tagmanager/l$a;

    invoke-interface {p0, p1, p2}, Lcom/google/android/gms/tagmanager/l$a;->sizeOf(Ljava/lang/Object;Ljava/lang/Object;)I

    move-result p0

    return p0
.end method
