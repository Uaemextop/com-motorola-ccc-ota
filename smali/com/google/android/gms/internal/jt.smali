.class public final Lcom/google/android/gms/internal/jt;
.super Ljava/lang/Object;


# static fields
.field private static MR:Ljava/util/regex/Pattern;


# direct methods
.method static constructor <clinit>()V
    .locals 0

    return-void
.end method

.method public static K(Landroid/content/Context;)Z
    .locals 1

    invoke-virtual {p0}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object p0

    const-string v0, "android.hardware.type.watch"

    invoke-virtual {p0, v0}, Landroid/content/pm/PackageManager;->hasSystemFeature(Ljava/lang/String;)Z

    move-result p0

    return p0
.end method

.method public static aN(I)I
    .locals 0

    div-int/lit16 p0, p0, 0x3e8

    return p0
.end method

.method public static aO(I)I
    .locals 0

    rem-int/lit16 p0, p0, 0x3e8

    div-int/lit8 p0, p0, 0x64

    return p0
.end method

.method public static aP(I)Z
    .locals 1

    invoke-static {p0}, Lcom/google/android/gms/internal/jt;->aO(I)I

    move-result p0

    const/4 v0, 0x3

    if-ne p0, v0, :cond_0

    const/4 p0, 0x1

    goto :goto_0

    :cond_0
    const/4 p0, 0x0

    :goto_0
    return p0
.end method
