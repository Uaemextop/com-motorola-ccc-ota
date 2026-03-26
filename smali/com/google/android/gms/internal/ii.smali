.class public abstract Lcom/google/android/gms/internal/ii;
.super Ljava/lang/Object;


# instance fields
.field protected final Go:Lcom/google/android/gms/internal/ip;

.field private final Gp:Ljava/lang/String;

.field private Gq:Lcom/google/android/gms/internal/ir;


# direct methods
.method protected constructor <init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    invoke-static {p1}, Lcom/google/android/gms/internal/ik;->aF(Ljava/lang/String;)V

    iput-object p1, p0, Lcom/google/android/gms/internal/ii;->Gp:Ljava/lang/String;

    new-instance p1, Lcom/google/android/gms/internal/ip;

    invoke-direct {p1, p2}, Lcom/google/android/gms/internal/ip;-><init>(Ljava/lang/String;)V

    iput-object p1, p0, Lcom/google/android/gms/internal/ii;->Go:Lcom/google/android/gms/internal/ip;

    invoke-static {p3}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result p0

    if-nez p0, :cond_0

    invoke-virtual {p1, p3}, Lcom/google/android/gms/internal/ip;->aK(Ljava/lang/String;)V

    :cond_0
    return-void
.end method


# virtual methods
.method public final a(Lcom/google/android/gms/internal/ir;)V
    .locals 0

    iput-object p1, p0, Lcom/google/android/gms/internal/ii;->Gq:Lcom/google/android/gms/internal/ir;

    if-nez p1, :cond_0

    invoke-virtual {p0}, Lcom/google/android/gms/internal/ii;->fA()V

    :cond_0
    return-void
.end method

.method protected final a(Ljava/lang/String;JLjava/lang/String;)V
    .locals 9
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    iget-object v0, p0, Lcom/google/android/gms/internal/ii;->Go:Lcom/google/android/gms/internal/ip;

    const-string v1, "Sending text message: %s to: %s"

    filled-new-array {p1, p4}, [Ljava/lang/Object;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Lcom/google/android/gms/internal/ip;->a(Ljava/lang/String;[Ljava/lang/Object;)V

    iget-object v3, p0, Lcom/google/android/gms/internal/ii;->Gq:Lcom/google/android/gms/internal/ir;

    iget-object v4, p0, Lcom/google/android/gms/internal/ii;->Gp:Ljava/lang/String;

    move-object v5, p1

    move-wide v6, p2

    move-object v8, p4

    invoke-interface/range {v3 .. v8}, Lcom/google/android/gms/internal/ir;->a(Ljava/lang/String;Ljava/lang/String;JLjava/lang/String;)V

    return-void
.end method

.method public aD(Ljava/lang/String;)V
    .locals 0

    return-void
.end method

.method public b(JI)V
    .locals 0

    return-void
.end method

.method public fA()V
    .locals 0

    return-void
.end method

.method protected final fz()J
    .locals 2

    iget-object p0, p0, Lcom/google/android/gms/internal/ii;->Gq:Lcom/google/android/gms/internal/ir;

    invoke-interface {p0}, Lcom/google/android/gms/internal/ir;->fx()J

    move-result-wide v0

    return-wide v0
.end method

.method public final getNamespace()Ljava/lang/String;
    .locals 0

    iget-object p0, p0, Lcom/google/android/gms/internal/ii;->Gp:Ljava/lang/String;

    return-object p0
.end method
