.class Lcom/google/android/gms/tagmanager/bn;
.super Ljava/lang/Object;


# direct methods
.method constructor <init>()V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method nP()I
    .locals 0

    sget p0, Landroid/os/Build$VERSION;->SDK_INT:I

    return p0
.end method

.method public ox()Lcom/google/android/gms/tagmanager/bm;
    .locals 1

    invoke-virtual {p0}, Lcom/google/android/gms/tagmanager/bn;->nP()I

    move-result p0

    const/16 v0, 0x8

    if-ge p0, v0, :cond_0

    new-instance p0, Lcom/google/android/gms/tagmanager/av;

    invoke-direct {p0}, Lcom/google/android/gms/tagmanager/av;-><init>()V

    return-object p0

    :cond_0
    new-instance p0, Lcom/google/android/gms/tagmanager/aw;

    invoke-direct {p0}, Lcom/google/android/gms/tagmanager/aw;-><init>()V

    return-object p0
.end method
