.class public Lcom/google/android/gms/internal/ab;
.super Ljava/lang/Object;


# annotations
.annotation runtime Lcom/google/android/gms/internal/ez;
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/google/android/gms/internal/ab$a;
    }
.end annotation


# instance fields
.field private final mj:Lcom/google/android/gms/internal/ab$a;

.field private final mk:Ljava/lang/Runnable;

.field private ml:Lcom/google/android/gms/internal/av;

.field private mm:Z

.field private mn:Z

.field private mo:J


# direct methods
.method public constructor <init>(Lcom/google/android/gms/internal/u;)V
    .locals 2

    new-instance v0, Lcom/google/android/gms/internal/ab$a;

    sget-object v1, Lcom/google/android/gms/internal/gr;->wC:Landroid/os/Handler;

    invoke-direct {v0, v1}, Lcom/google/android/gms/internal/ab$a;-><init>(Landroid/os/Handler;)V

    invoke-direct {p0, p1, v0}, Lcom/google/android/gms/internal/ab;-><init>(Lcom/google/android/gms/internal/u;Lcom/google/android/gms/internal/ab$a;)V

    return-void
.end method

.method constructor <init>(Lcom/google/android/gms/internal/u;Lcom/google/android/gms/internal/ab$a;)V
    .locals 2

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/google/android/gms/internal/ab;->mm:Z

    iput-boolean v0, p0, Lcom/google/android/gms/internal/ab;->mn:Z

    const-wide/16 v0, 0x0

    iput-wide v0, p0, Lcom/google/android/gms/internal/ab;->mo:J

    iput-object p2, p0, Lcom/google/android/gms/internal/ab;->mj:Lcom/google/android/gms/internal/ab$a;

    new-instance p2, Lcom/google/android/gms/internal/ab$1;

    invoke-direct {p2, p0, p1}, Lcom/google/android/gms/internal/ab$1;-><init>(Lcom/google/android/gms/internal/ab;Lcom/google/android/gms/internal/u;)V

    iput-object p2, p0, Lcom/google/android/gms/internal/ab;->mk:Ljava/lang/Runnable;

    return-void
.end method

.method static synthetic a(Lcom/google/android/gms/internal/ab;)Lcom/google/android/gms/internal/av;
    .locals 0

    iget-object p0, p0, Lcom/google/android/gms/internal/ab;->ml:Lcom/google/android/gms/internal/av;

    return-object p0
.end method

.method static synthetic a(Lcom/google/android/gms/internal/ab;Z)Z
    .locals 0

    iput-boolean p1, p0, Lcom/google/android/gms/internal/ab;->mm:Z

    return p1
.end method


# virtual methods
.method public a(Lcom/google/android/gms/internal/av;J)V
    .locals 1

    iget-boolean v0, p0, Lcom/google/android/gms/internal/ab;->mm:Z

    if-eqz v0, :cond_0

    const-string p0, "An ad refresh is already scheduled."

    invoke-static {p0}, Lcom/google/android/gms/internal/gs;->W(Ljava/lang/String;)V

    return-void

    :cond_0
    iput-object p1, p0, Lcom/google/android/gms/internal/ab;->ml:Lcom/google/android/gms/internal/av;

    const/4 p1, 0x1

    iput-boolean p1, p0, Lcom/google/android/gms/internal/ab;->mm:Z

    iput-wide p2, p0, Lcom/google/android/gms/internal/ab;->mo:J

    iget-boolean p1, p0, Lcom/google/android/gms/internal/ab;->mn:Z

    if-nez p1, :cond_1

    new-instance p1, Ljava/lang/StringBuilder;

    const-string v0, "Scheduling ad refresh "

    invoke-direct {p1, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p1, p2, p3}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object p1

    const-string v0, " milliseconds from now."

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {p1}, Lcom/google/android/gms/internal/gs;->U(Ljava/lang/String;)V

    iget-object p1, p0, Lcom/google/android/gms/internal/ab;->mj:Lcom/google/android/gms/internal/ab$a;

    iget-object p0, p0, Lcom/google/android/gms/internal/ab;->mk:Ljava/lang/Runnable;

    invoke-virtual {p1, p0, p2, p3}, Lcom/google/android/gms/internal/ab$a;->postDelayed(Ljava/lang/Runnable;J)Z

    :cond_1
    return-void
.end method

.method public ay()Z
    .locals 0

    iget-boolean p0, p0, Lcom/google/android/gms/internal/ab;->mm:Z

    return p0
.end method

.method public c(Lcom/google/android/gms/internal/av;)V
    .locals 2

    const-wide/32 v0, 0xea60

    invoke-virtual {p0, p1, v0, v1}, Lcom/google/android/gms/internal/ab;->a(Lcom/google/android/gms/internal/av;J)V

    return-void
.end method

.method public cancel()V
    .locals 1

    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/google/android/gms/internal/ab;->mm:Z

    iget-object v0, p0, Lcom/google/android/gms/internal/ab;->mj:Lcom/google/android/gms/internal/ab$a;

    iget-object p0, p0, Lcom/google/android/gms/internal/ab;->mk:Ljava/lang/Runnable;

    invoke-virtual {v0, p0}, Lcom/google/android/gms/internal/ab$a;->removeCallbacks(Ljava/lang/Runnable;)V

    return-void
.end method

.method public pause()V
    .locals 1

    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/google/android/gms/internal/ab;->mn:Z

    iget-boolean v0, p0, Lcom/google/android/gms/internal/ab;->mm:Z

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/google/android/gms/internal/ab;->mj:Lcom/google/android/gms/internal/ab$a;

    iget-object p0, p0, Lcom/google/android/gms/internal/ab;->mk:Ljava/lang/Runnable;

    invoke-virtual {v0, p0}, Lcom/google/android/gms/internal/ab$a;->removeCallbacks(Ljava/lang/Runnable;)V

    :cond_0
    return-void
.end method

.method public resume()V
    .locals 3

    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/google/android/gms/internal/ab;->mn:Z

    iget-boolean v1, p0, Lcom/google/android/gms/internal/ab;->mm:Z

    if-eqz v1, :cond_0

    iput-boolean v0, p0, Lcom/google/android/gms/internal/ab;->mm:Z

    iget-object v0, p0, Lcom/google/android/gms/internal/ab;->ml:Lcom/google/android/gms/internal/av;

    iget-wide v1, p0, Lcom/google/android/gms/internal/ab;->mo:J

    invoke-virtual {p0, v0, v1, v2}, Lcom/google/android/gms/internal/ab;->a(Lcom/google/android/gms/internal/av;J)V

    :cond_0
    return-void
.end method
