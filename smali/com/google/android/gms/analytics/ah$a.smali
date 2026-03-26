.class Lcom/google/android/gms/analytics/ah$a;
.super Ljava/lang/Object;

# interfaces
.implements Lcom/google/android/gms/analytics/j$a;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/google/android/gms/analytics/ah;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "a"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Lcom/google/android/gms/analytics/j$a<",
        "Lcom/google/android/gms/analytics/ai;",
        ">;"
    }
.end annotation


# instance fields
.field private final BB:Lcom/google/android/gms/analytics/ai;


# direct methods
.method public constructor <init>()V
    .locals 1

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance v0, Lcom/google/android/gms/analytics/ai;

    invoke-direct {v0}, Lcom/google/android/gms/analytics/ai;-><init>()V

    iput-object v0, p0, Lcom/google/android/gms/analytics/ah$a;->BB:Lcom/google/android/gms/analytics/ai;

    return-void
.end method


# virtual methods
.method public c(Ljava/lang/String;I)V
    .locals 1

    const-string v0, "ga_sessionTimeout"

    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object p0, p0, Lcom/google/android/gms/analytics/ah$a;->BB:Lcom/google/android/gms/analytics/ai;

    iput p2, p0, Lcom/google/android/gms/analytics/ai;->BE:I

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

    const-string v0, "ga_autoActivityTracking"

    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object p0, p0, Lcom/google/android/gms/analytics/ah$a;->BB:Lcom/google/android/gms/analytics/ai;

    iput p2, p0, Lcom/google/android/gms/analytics/ai;->BF:I

    goto :goto_0

    :cond_0
    const-string v0, "ga_anonymizeIp"

    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1

    iget-object p0, p0, Lcom/google/android/gms/analytics/ah$a;->BB:Lcom/google/android/gms/analytics/ai;

    iput p2, p0, Lcom/google/android/gms/analytics/ai;->BG:I

    goto :goto_0

    :cond_1
    const-string v0, "ga_reportUncaughtExceptions"

    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_2

    iget-object p0, p0, Lcom/google/android/gms/analytics/ah$a;->BB:Lcom/google/android/gms/analytics/ai;

    iput p2, p0, Lcom/google/android/gms/analytics/ai;->BH:I

    goto :goto_0

    :cond_2
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

    invoke-virtual {p0}, Lcom/google/android/gms/analytics/ah$a;->eY()Lcom/google/android/gms/analytics/ai;

    move-result-object p0

    return-object p0
.end method

.method public eY()Lcom/google/android/gms/analytics/ai;
    .locals 0

    iget-object p0, p0, Lcom/google/android/gms/analytics/ah$a;->BB:Lcom/google/android/gms/analytics/ai;

    return-object p0
.end method

.method public f(Ljava/lang/String;Ljava/lang/String;)V
    .locals 0

    iget-object p0, p0, Lcom/google/android/gms/analytics/ah$a;->BB:Lcom/google/android/gms/analytics/ai;

    iget-object p0, p0, Lcom/google/android/gms/analytics/ai;->BI:Ljava/util/Map;

    invoke-interface {p0, p1, p2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    return-void
.end method

.method public g(Ljava/lang/String;Ljava/lang/String;)V
    .locals 2

    const-string v0, "ga_trackingId"

    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object p0, p0, Lcom/google/android/gms/analytics/ah$a;->BB:Lcom/google/android/gms/analytics/ai;

    iput-object p2, p0, Lcom/google/android/gms/analytics/ai;->BC:Ljava/lang/String;

    goto :goto_0

    :cond_0
    const-string v0, "ga_sampleFrequency"

    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1

    :try_start_0
    iget-object p0, p0, Lcom/google/android/gms/analytics/ah$a;->BB:Lcom/google/android/gms/analytics/ai;

    invoke-static {p2}, Ljava/lang/Double;->parseDouble(Ljava/lang/String;)D

    move-result-wide v0

    iput-wide v0, p0, Lcom/google/android/gms/analytics/ai;->BD:D
    :try_end_0
    .catch Ljava/lang/NumberFormatException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    new-instance p0, Ljava/lang/StringBuilder;

    const-string p1, "Error parsing ga_sampleFrequency value: "

    invoke-direct {p0, p1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-static {p0}, Lcom/google/android/gms/analytics/z;->T(Ljava/lang/String;)V

    goto :goto_0

    :cond_1
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
