.class Lcom/google/android/gms/internal/dc$1;
.super Ljava/lang/Object;

# interfaces
.implements Landroid/content/DialogInterface$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/google/android/gms/internal/dc;->execute()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic qS:Lcom/google/android/gms/internal/dc;


# direct methods
.method constructor <init>(Lcom/google/android/gms/internal/dc;)V
    .locals 0

    iput-object p1, p0, Lcom/google/android/gms/internal/dc$1;->qS:Lcom/google/android/gms/internal/dc;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/content/DialogInterface;I)V
    .locals 0

    iget-object p1, p0, Lcom/google/android/gms/internal/dc$1;->qS:Lcom/google/android/gms/internal/dc;

    invoke-virtual {p1}, Lcom/google/android/gms/internal/dc;->createIntent()Landroid/content/Intent;

    move-result-object p1

    iget-object p0, p0, Lcom/google/android/gms/internal/dc$1;->qS:Lcom/google/android/gms/internal/dc;

    invoke-static {p0}, Lcom/google/android/gms/internal/dc;->a(Lcom/google/android/gms/internal/dc;)Landroid/content/Context;

    move-result-object p0

    invoke-virtual {p0, p1}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    return-void
.end method
