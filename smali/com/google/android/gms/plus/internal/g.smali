.class public final Lcom/google/android/gms/plus/internal/g;
.super Lcom/google/android/gms/dynamic/g;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/google/android/gms/dynamic/g<",
        "Lcom/google/android/gms/plus/internal/c;",
        ">;"
    }
.end annotation


# static fields
.field private static final alC:Lcom/google/android/gms/plus/internal/g;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    new-instance v0, Lcom/google/android/gms/plus/internal/g;

    invoke-direct {v0}, Lcom/google/android/gms/plus/internal/g;-><init>()V

    sput-object v0, Lcom/google/android/gms/plus/internal/g;->alC:Lcom/google/android/gms/plus/internal/g;

    return-void
.end method

.method private constructor <init>()V
    .locals 1

    const-string v0, "com.google.android.gms.plus.plusone.PlusOneButtonCreatorImpl"

    invoke-direct {p0, v0}, Lcom/google/android/gms/dynamic/g;-><init>(Ljava/lang/String;)V

    return-void
.end method

.method public static a(Landroid/content/Context;IILjava/lang/String;I)Landroid/view/View;
    .locals 7

    if-eqz p3, :cond_0

    :try_start_0
    sget-object v0, Lcom/google/android/gms/plus/internal/g;->alC:Lcom/google/android/gms/plus/internal/g;

    invoke-virtual {v0, p0}, Lcom/google/android/gms/plus/internal/g;->L(Landroid/content/Context;)Ljava/lang/Object;

    move-result-object v0

    move-object v1, v0

    check-cast v1, Lcom/google/android/gms/plus/internal/c;

    invoke-static {p0}, Lcom/google/android/gms/dynamic/e;->k(Ljava/lang/Object;)Lcom/google/android/gms/dynamic/d;

    move-result-object v2

    move v3, p1

    move v4, p2

    move-object v5, p3

    move v6, p4

    invoke-interface/range {v1 .. v6}, Lcom/google/android/gms/plus/internal/c;->a(Lcom/google/android/gms/dynamic/d;IILjava/lang/String;I)Lcom/google/android/gms/dynamic/d;

    move-result-object p2

    invoke-static {p2}, Lcom/google/android/gms/dynamic/e;->f(Lcom/google/android/gms/dynamic/d;)Ljava/lang/Object;

    move-result-object p2

    check-cast p2, Landroid/view/View;

    goto :goto_0

    :cond_0
    new-instance p2, Ljava/lang/NullPointerException;

    invoke-direct {p2}, Ljava/lang/NullPointerException;-><init>()V

    throw p2
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    :catch_0
    new-instance p2, Lcom/google/android/gms/plus/PlusOneDummyView;

    invoke-direct {p2, p0, p1}, Lcom/google/android/gms/plus/PlusOneDummyView;-><init>(Landroid/content/Context;I)V

    :goto_0
    return-object p2
.end method


# virtual methods
.method protected bI(Landroid/os/IBinder;)Lcom/google/android/gms/plus/internal/c;
    .locals 0

    invoke-static {p1}, Lcom/google/android/gms/plus/internal/c$a;->bF(Landroid/os/IBinder;)Lcom/google/android/gms/plus/internal/c;

    move-result-object p0

    return-object p0
.end method

.method protected synthetic d(Landroid/os/IBinder;)Ljava/lang/Object;
    .locals 0

    invoke-virtual {p0, p1}, Lcom/google/android/gms/plus/internal/g;->bI(Landroid/os/IBinder;)Lcom/google/android/gms/plus/internal/c;

    move-result-object p0

    return-object p0
.end method
