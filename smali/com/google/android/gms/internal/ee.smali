.class public Lcom/google/android/gms/internal/ee;
.super Ljava/lang/Object;


# annotations
.annotation runtime Lcom/google/android/gms/internal/ez;
.end annotation


# instance fields
.field private final oA:Ljava/lang/String;


# direct methods
.method public constructor <init>(Ljava/lang/String;)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/google/android/gms/internal/ee;->oA:Ljava/lang/String;

    return-void
.end method


# virtual methods
.method public a(Ljava/lang/String;ILandroid/content/Intent;)Z
    .locals 2

    const/4 p2, 0x0

    if-eqz p1, :cond_4

    if-nez p3, :cond_0

    goto :goto_1

    :cond_0
    invoke-static {p3}, Lcom/google/android/gms/internal/ed;->e(Landroid/content/Intent;)Ljava/lang/String;

    move-result-object v0

    invoke-static {p3}, Lcom/google/android/gms/internal/ed;->f(Landroid/content/Intent;)Ljava/lang/String;

    move-result-object p3

    if-eqz v0, :cond_4

    if-nez p3, :cond_1

    goto :goto_1

    :cond_1
    invoke-static {v0}, Lcom/google/android/gms/internal/ed;->D(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p1, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-nez p1, :cond_2

    const-string p0, "Developer payload not match."

    :goto_0
    invoke-static {p0}, Lcom/google/android/gms/internal/gs;->W(Ljava/lang/String;)V

    return p2

    :cond_2
    iget-object p0, p0, Lcom/google/android/gms/internal/ee;->oA:Ljava/lang/String;

    if-eqz p0, :cond_3

    invoke-static {p0, v0, p3}, Lcom/google/android/gms/internal/ef;->b(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Z

    move-result p0

    if-nez p0, :cond_3

    const-string p0, "Fail to verify signature."

    goto :goto_0

    :cond_3
    const/4 p0, 0x1

    return p0

    :cond_4
    :goto_1
    return p2
.end method

.method public ct()Ljava/lang/String;
    .locals 0

    invoke-static {}, Lcom/google/android/gms/internal/gj;->do()Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method
