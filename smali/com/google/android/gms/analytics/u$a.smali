.class Lcom/google/android/gms/analytics/u$a;
.super Ljava/lang/Object;

# interfaces
.implements Lcom/google/android/gms/analytics/j$a;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/google/android/gms/analytics/u;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "a"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Lcom/google/android/gms/analytics/j$a<",
        "Lcom/google/android/gms/analytics/v;",
        ">;"
    }
.end annotation


# instance fields
.field private final Ar:Lcom/google/android/gms/analytics/v;


# direct methods
.method public constructor <init>()V
    .locals 1

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance v0, Lcom/google/android/gms/analytics/v;

    invoke-direct {v0}, Lcom/google/android/gms/analytics/v;-><init>()V

    iput-object v0, p0, Lcom/google/android/gms/analytics/u$a;->Ar:Lcom/google/android/gms/analytics/v;

    return-void
.end method


# virtual methods
.method public c(Ljava/lang/String;I)V
    .locals 1

    const-string v0, "ga_dispatchPeriod"

    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object p0, p0, Lcom/google/android/gms/analytics/u$a;->Ar:Lcom/google/android/gms/analytics/v;

    iput p2, p0, Lcom/google/android/gms/analytics/v;->At:I

    goto :goto_0

    :cond_0
    new-instance p0, Ljava/lang/StringBuilder;

    const-string p2, "int configuration name not recognized:  "

    invoke-direct {p0, p2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-static {p0}, Lcom/google/android/gms/analytics/z;->W(Ljava/lang/String;)V

    :goto_0
    return-void
.end method

.method public d(Ljava/lang/String;Z)V
    .locals 1

    const-string v0, "ga_dryRun"

    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object p0, p0, Lcom/google/android/gms/analytics/u$a;->Ar:Lcom/google/android/gms/analytics/v;

    iput p2, p0, Lcom/google/android/gms/analytics/v;->Au:I

    goto :goto_0

    :cond_0
    new-instance p0, Ljava/lang/StringBuilder;

    const-string p2, "bool configuration name not recognized:  "

    invoke-direct {p0, p2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-static {p0}, Lcom/google/android/gms/analytics/z;->W(Ljava/lang/String;)V

    :goto_0
    return-void
.end method

.method public synthetic dW()Lcom/google/android/gms/analytics/i;
    .locals 0

    invoke-virtual {p0}, Lcom/google/android/gms/analytics/u$a;->es()Lcom/google/android/gms/analytics/v;

    move-result-object p0

    return-object p0
.end method

.method public es()Lcom/google/android/gms/analytics/v;
    .locals 0

    iget-object p0, p0, Lcom/google/android/gms/analytics/u$a;->Ar:Lcom/google/android/gms/analytics/v;

    return-object p0
.end method

.method public f(Ljava/lang/String;Ljava/lang/String;)V
    .locals 0

    return-void
.end method

.method public g(Ljava/lang/String;Ljava/lang/String;)V
    .locals 1

    const-string v0, "ga_appName"

    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object p0, p0, Lcom/google/android/gms/analytics/u$a;->Ar:Lcom/google/android/gms/analytics/v;

    iput-object p2, p0, Lcom/google/android/gms/analytics/v;->xL:Ljava/lang/String;

    goto :goto_0

    :cond_0
    const-string v0, "ga_appVersion"

    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1

    iget-object p0, p0, Lcom/google/android/gms/analytics/u$a;->Ar:Lcom/google/android/gms/analytics/v;

    iput-object p2, p0, Lcom/google/android/gms/analytics/v;->xM:Ljava/lang/String;

    goto :goto_0

    :cond_1
    const-string v0, "ga_logLevel"

    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_2

    iget-object p0, p0, Lcom/google/android/gms/analytics/u$a;->Ar:Lcom/google/android/gms/analytics/v;

    iput-object p2, p0, Lcom/google/android/gms/analytics/v;->As:Ljava/lang/String;

    goto :goto_0

    :cond_2
    new-instance p0, Ljava/lang/StringBuilder;

    const-string p2, "string configuration name not recognized:  "

    invoke-direct {p0, p2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-static {p0}, Lcom/google/android/gms/analytics/z;->W(Ljava/lang/String;)V

    :goto_0
    return-void
.end method
