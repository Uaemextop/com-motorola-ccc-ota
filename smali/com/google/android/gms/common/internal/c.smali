.class public Lcom/google/android/gms/common/internal/c;
.super Ljava/lang/Object;

# interfaces
.implements Landroid/content/DialogInterface$OnClickListener;


# instance fields
.field private final Lt:Landroidx/fragment/app/Fragment;

.field private final Lu:I

.field private final mIntent:Landroid/content/Intent;

.field private final nr:Landroid/app/Activity;


# direct methods
.method public constructor <init>(Landroid/app/Activity;Landroid/content/Intent;I)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/google/android/gms/common/internal/c;->nr:Landroid/app/Activity;

    const/4 p1, 0x0

    iput-object p1, p0, Lcom/google/android/gms/common/internal/c;->Lt:Landroidx/fragment/app/Fragment;

    iput-object p2, p0, Lcom/google/android/gms/common/internal/c;->mIntent:Landroid/content/Intent;

    iput p3, p0, Lcom/google/android/gms/common/internal/c;->Lu:I

    return-void
.end method

.method public constructor <init>(Landroidx/fragment/app/Fragment;Landroid/content/Intent;I)V
    .locals 1

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, 0x0

    iput-object v0, p0, Lcom/google/android/gms/common/internal/c;->nr:Landroid/app/Activity;

    iput-object p1, p0, Lcom/google/android/gms/common/internal/c;->Lt:Landroidx/fragment/app/Fragment;

    iput-object p2, p0, Lcom/google/android/gms/common/internal/c;->mIntent:Landroid/content/Intent;

    iput p3, p0, Lcom/google/android/gms/common/internal/c;->Lu:I

    return-void
.end method


# virtual methods
.method public onClick(Landroid/content/DialogInterface;I)V
    .locals 1

    :try_start_0
    iget-object p2, p0, Lcom/google/android/gms/common/internal/c;->mIntent:Landroid/content/Intent;

    if-eqz p2, :cond_0

    iget-object v0, p0, Lcom/google/android/gms/common/internal/c;->Lt:Landroidx/fragment/app/Fragment;

    if-eqz v0, :cond_0

    iget p0, p0, Lcom/google/android/gms/common/internal/c;->Lu:I

    invoke-virtual {v0, p2, p0}, Landroidx/fragment/app/Fragment;->startActivityForResult(Landroid/content/Intent;I)V

    goto :goto_0

    :cond_0
    if-eqz p2, :cond_1

    iget-object v0, p0, Lcom/google/android/gms/common/internal/c;->nr:Landroid/app/Activity;

    iget p0, p0, Lcom/google/android/gms/common/internal/c;->Lu:I

    invoke-virtual {v0, p2, p0}, Landroid/app/Activity;->startActivityForResult(Landroid/content/Intent;I)V

    :cond_1
    :goto_0
    invoke-interface {p1}, Landroid/content/DialogInterface;->dismiss()V
    :try_end_0
    .catch Landroid/content/ActivityNotFoundException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_1

    :catch_0
    const-string p0, "SettingsRedirect"

    const-string p1, "Can\'t redirect to app settings for Google Play services"

    invoke-static {p0, p1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    :goto_1
    return-void
.end method
