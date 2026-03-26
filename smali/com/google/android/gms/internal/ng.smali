.class public Lcom/google/android/gms/internal/ng;
.super Ljava/lang/Object;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/google/android/gms/internal/ng$a;
    }
.end annotation


# instance fields
.field private final akF:Lcom/google/android/gms/internal/no;

.field private akG:Lcom/google/android/gms/internal/nm;


# direct methods
.method public constructor <init>(Landroid/content/Context;ILjava/lang/String;Ljava/lang/String;Lcom/google/android/gms/internal/ng$a;Z)V
    .locals 8

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    invoke-virtual {p1}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v1

    const/4 v0, 0x0

    :try_start_0
    invoke-virtual {p1}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v2

    invoke-virtual {v2, v1, v0}, Landroid/content/pm/PackageManager;->getPackageInfo(Ljava/lang/String;I)Landroid/content/pm/PackageInfo;

    move-result-object v2

    iget v0, v2, Landroid/content/pm/PackageInfo;->versionCode:I
    :try_end_0
    .catch Landroid/content/pm/PackageManager$NameNotFoundException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    const-string v2, "PlayLogger"

    const-string v3, "This can\'t happen."

    invoke-static {v2, v3}, Landroid/util/Log;->wtf(Ljava/lang/String;Ljava/lang/String;)I

    :goto_0
    move v2, v0

    new-instance v7, Lcom/google/android/gms/internal/nm;

    move-object v0, v7

    move v3, p2

    move-object v4, p3

    move-object v5, p4

    move v6, p6

    invoke-direct/range {v0 .. v6}, Lcom/google/android/gms/internal/nm;-><init>(Ljava/lang/String;IILjava/lang/String;Ljava/lang/String;Z)V

    iput-object v7, p0, Lcom/google/android/gms/internal/ng;->akG:Lcom/google/android/gms/internal/nm;

    new-instance p2, Lcom/google/android/gms/internal/no;

    new-instance p3, Lcom/google/android/gms/internal/nl;

    invoke-direct {p3, p5}, Lcom/google/android/gms/internal/nl;-><init>(Lcom/google/android/gms/internal/ng$a;)V

    invoke-direct {p2, p1, p3}, Lcom/google/android/gms/internal/no;-><init>(Landroid/content/Context;Lcom/google/android/gms/internal/nl;)V

    iput-object p2, p0, Lcom/google/android/gms/internal/ng;->akF:Lcom/google/android/gms/internal/no;

    return-void
.end method


# virtual methods
.method public varargs a(JLjava/lang/String;[B[Ljava/lang/String;)V
    .locals 8

    iget-object v0, p0, Lcom/google/android/gms/internal/ng;->akF:Lcom/google/android/gms/internal/no;

    iget-object p0, p0, Lcom/google/android/gms/internal/ng;->akG:Lcom/google/android/gms/internal/nm;

    new-instance v7, Lcom/google/android/gms/internal/ni;

    move-object v1, v7

    move-wide v2, p1

    move-object v4, p3

    move-object v5, p4

    move-object v6, p5

    invoke-direct/range {v1 .. v6}, Lcom/google/android/gms/internal/ni;-><init>(JLjava/lang/String;[B[Ljava/lang/String;)V

    invoke-virtual {v0, p0, v7}, Lcom/google/android/gms/internal/no;->b(Lcom/google/android/gms/internal/nm;Lcom/google/android/gms/internal/ni;)V

    return-void
.end method

.method public varargs b(Ljava/lang/String;[B[Ljava/lang/String;)V
    .locals 6

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v1

    move-object v0, p0

    move-object v3, p1

    move-object v4, p2

    move-object v5, p3

    invoke-virtual/range {v0 .. v5}, Lcom/google/android/gms/internal/ng;->a(JLjava/lang/String;[B[Ljava/lang/String;)V

    return-void
.end method

.method public start()V
    .locals 0

    iget-object p0, p0, Lcom/google/android/gms/internal/ng;->akF:Lcom/google/android/gms/internal/no;

    invoke-virtual {p0}, Lcom/google/android/gms/internal/no;->start()V

    return-void
.end method

.method public stop()V
    .locals 0

    iget-object p0, p0, Lcom/google/android/gms/internal/ng;->akF:Lcom/google/android/gms/internal/no;

    invoke-virtual {p0}, Lcom/google/android/gms/internal/no;->stop()V

    return-void
.end method
