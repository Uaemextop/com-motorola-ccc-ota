.class Lcom/google/android/gms/internal/fo$2;
.super Ljava/lang/Object;

# interfaces
.implements Lcom/google/android/gms/internal/go$a;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/google/android/gms/internal/fo;->a(Lorg/json/JSONObject;Ljava/lang/String;Z)Ljava/util/concurrent/Future;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Lcom/google/android/gms/internal/go$a<",
        "Landroid/graphics/drawable/Drawable;",
        ">;"
    }
.end annotation


# instance fields
.field final synthetic ud:Lcom/google/android/gms/internal/fo;

.field final synthetic ue:Z


# direct methods
.method constructor <init>(Lcom/google/android/gms/internal/fo;Z)V
    .locals 0

    iput-object p1, p0, Lcom/google/android/gms/internal/fo$2;->ud:Lcom/google/android/gms/internal/fo;

    iput-boolean p2, p0, Lcom/google/android/gms/internal/fo$2;->ue:Z

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public a(Ljava/io/InputStream;)Landroid/graphics/drawable/Drawable;
    .locals 4

    const/4 v0, 0x0

    :try_start_0
    invoke-static {p1}, Lcom/google/android/gms/internal/jy;->d(Ljava/io/InputStream;)[B

    move-result-object p1
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-object p1, v0

    :goto_0
    const/4 v1, 0x2

    if-nez p1, :cond_0

    :goto_1
    iget-object p1, p0, Lcom/google/android/gms/internal/fo$2;->ud:Lcom/google/android/gms/internal/fo;

    iget-boolean p0, p0, Lcom/google/android/gms/internal/fo$2;->ue:Z

    invoke-virtual {p1, v1, p0}, Lcom/google/android/gms/internal/fo;->a(IZ)V

    return-object v0

    :cond_0
    const/4 v2, 0x0

    array-length v3, p1

    invoke-static {p1, v2, v3}, Landroid/graphics/BitmapFactory;->decodeByteArray([BII)Landroid/graphics/Bitmap;

    move-result-object p1

    if-nez p1, :cond_1

    goto :goto_1

    :cond_1
    new-instance p0, Landroid/graphics/drawable/BitmapDrawable;

    invoke-static {}, Landroid/content/res/Resources;->getSystem()Landroid/content/res/Resources;

    move-result-object v0

    invoke-direct {p0, v0, p1}, Landroid/graphics/drawable/BitmapDrawable;-><init>(Landroid/content/res/Resources;Landroid/graphics/Bitmap;)V

    return-object p0
.end method

.method public synthetic b(Ljava/io/InputStream;)Ljava/lang/Object;
    .locals 0

    invoke-virtual {p0, p1}, Lcom/google/android/gms/internal/fo$2;->a(Ljava/io/InputStream;)Landroid/graphics/drawable/Drawable;

    move-result-object p0

    return-object p0
.end method

.method public cI()Landroid/graphics/drawable/Drawable;
    .locals 2

    iget-object v0, p0, Lcom/google/android/gms/internal/fo$2;->ud:Lcom/google/android/gms/internal/fo;

    const/4 v1, 0x2

    iget-boolean p0, p0, Lcom/google/android/gms/internal/fo$2;->ue:Z

    invoke-virtual {v0, v1, p0}, Lcom/google/android/gms/internal/fo;->a(IZ)V

    const/4 p0, 0x0

    return-object p0
.end method

.method public synthetic cJ()Ljava/lang/Object;
    .locals 0

    invoke-virtual {p0}, Lcom/google/android/gms/internal/fo$2;->cI()Landroid/graphics/drawable/Drawable;

    move-result-object p0

    return-object p0
.end method
