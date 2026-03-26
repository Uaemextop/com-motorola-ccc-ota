.class public final Lcom/google/android/gms/internal/c$i;
.super Lcom/google/android/gms/internal/ph;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/google/android/gms/internal/c;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "i"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/google/android/gms/internal/ph<",
        "Lcom/google/android/gms/internal/c$i;",
        ">;"
    }
.end annotation


# static fields
.field private static volatile go:[Lcom/google/android/gms/internal/c$i;


# instance fields
.field public gp:Lcom/google/android/gms/internal/d$a;

.field public gq:Lcom/google/android/gms/internal/c$d;

.field public name:Ljava/lang/String;


# direct methods
.method public constructor <init>()V
    .locals 0

    invoke-direct {p0}, Lcom/google/android/gms/internal/ph;-><init>()V

    invoke-virtual {p0}, Lcom/google/android/gms/internal/c$i;->p()Lcom/google/android/gms/internal/c$i;

    return-void
.end method

.method public static o()[Lcom/google/android/gms/internal/c$i;
    .locals 2

    sget-object v0, Lcom/google/android/gms/internal/c$i;->go:[Lcom/google/android/gms/internal/c$i;

    if-nez v0, :cond_1

    sget-object v0, Lcom/google/android/gms/internal/pl;->awT:Ljava/lang/Object;

    monitor-enter v0

    :try_start_0
    sget-object v1, Lcom/google/android/gms/internal/c$i;->go:[Lcom/google/android/gms/internal/c$i;

    if-nez v1, :cond_0

    const/4 v1, 0x0

    new-array v1, v1, [Lcom/google/android/gms/internal/c$i;

    sput-object v1, Lcom/google/android/gms/internal/c$i;->go:[Lcom/google/android/gms/internal/c$i;

    :cond_0
    monitor-exit v0

    goto :goto_0

    :catchall_0
    move-exception v1

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v1

    :cond_1
    :goto_0
    sget-object v0, Lcom/google/android/gms/internal/c$i;->go:[Lcom/google/android/gms/internal/c$i;

    return-object v0
.end method


# virtual methods
.method public a(Lcom/google/android/gms/internal/pg;)V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    iget-object v0, p0, Lcom/google/android/gms/internal/c$i;->name:Ljava/lang/String;

    const-string v1, ""

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_0

    const/4 v0, 0x1

    iget-object v1, p0, Lcom/google/android/gms/internal/c$i;->name:Ljava/lang/String;

    invoke-virtual {p1, v0, v1}, Lcom/google/android/gms/internal/pg;->b(ILjava/lang/String;)V

    :cond_0
    iget-object v0, p0, Lcom/google/android/gms/internal/c$i;->gp:Lcom/google/android/gms/internal/d$a;

    if-eqz v0, :cond_1

    const/4 v1, 0x2

    invoke-virtual {p1, v1, v0}, Lcom/google/android/gms/internal/pg;->a(ILcom/google/android/gms/internal/pn;)V

    :cond_1
    iget-object v0, p0, Lcom/google/android/gms/internal/c$i;->gq:Lcom/google/android/gms/internal/c$d;

    if-eqz v0, :cond_2

    const/4 v1, 0x3

    invoke-virtual {p1, v1, v0}, Lcom/google/android/gms/internal/pg;->a(ILcom/google/android/gms/internal/pn;)V

    :cond_2
    invoke-super {p0, p1}, Lcom/google/android/gms/internal/ph;->a(Lcom/google/android/gms/internal/pg;)V

    return-void
.end method

.method public synthetic b(Lcom/google/android/gms/internal/pf;)Lcom/google/android/gms/internal/pn;
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    invoke-virtual {p0, p1}, Lcom/google/android/gms/internal/c$i;->j(Lcom/google/android/gms/internal/pf;)Lcom/google/android/gms/internal/c$i;

    move-result-object p0

    return-object p0
.end method

.method protected c()I
    .locals 3

    invoke-super {p0}, Lcom/google/android/gms/internal/ph;->c()I

    move-result v0

    iget-object v1, p0, Lcom/google/android/gms/internal/c$i;->name:Ljava/lang/String;

    const-string v2, ""

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_0

    const/4 v1, 0x1

    iget-object v2, p0, Lcom/google/android/gms/internal/c$i;->name:Ljava/lang/String;

    invoke-static {v1, v2}, Lcom/google/android/gms/internal/pg;->j(ILjava/lang/String;)I

    move-result v1

    add-int/2addr v0, v1

    :cond_0
    iget-object v1, p0, Lcom/google/android/gms/internal/c$i;->gp:Lcom/google/android/gms/internal/d$a;

    if-eqz v1, :cond_1

    const/4 v2, 0x2

    invoke-static {v2, v1}, Lcom/google/android/gms/internal/pg;->c(ILcom/google/android/gms/internal/pn;)I

    move-result v1

    add-int/2addr v0, v1

    :cond_1
    iget-object p0, p0, Lcom/google/android/gms/internal/c$i;->gq:Lcom/google/android/gms/internal/c$d;

    if-eqz p0, :cond_2

    const/4 v1, 0x3

    invoke-static {v1, p0}, Lcom/google/android/gms/internal/pg;->c(ILcom/google/android/gms/internal/pn;)I

    move-result p0

    add-int/2addr v0, p0

    :cond_2
    return v0
.end method

.method public equals(Ljava/lang/Object;)Z
    .locals 3

    if-ne p1, p0, :cond_0

    const/4 p0, 0x1

    return p0

    :cond_0
    instance-of v0, p1, Lcom/google/android/gms/internal/c$i;

    const/4 v1, 0x0

    if-nez v0, :cond_1

    return v1

    :cond_1
    check-cast p1, Lcom/google/android/gms/internal/c$i;

    iget-object v0, p0, Lcom/google/android/gms/internal/c$i;->name:Ljava/lang/String;

    if-nez v0, :cond_2

    iget-object v0, p1, Lcom/google/android/gms/internal/c$i;->name:Ljava/lang/String;

    if-eqz v0, :cond_3

    return v1

    :cond_2
    iget-object v2, p1, Lcom/google/android/gms/internal/c$i;->name:Ljava/lang/String;

    invoke-virtual {v0, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_3

    return v1

    :cond_3
    iget-object v0, p0, Lcom/google/android/gms/internal/c$i;->gp:Lcom/google/android/gms/internal/d$a;

    if-nez v0, :cond_4

    iget-object v0, p1, Lcom/google/android/gms/internal/c$i;->gp:Lcom/google/android/gms/internal/d$a;

    if-eqz v0, :cond_5

    return v1

    :cond_4
    iget-object v2, p1, Lcom/google/android/gms/internal/c$i;->gp:Lcom/google/android/gms/internal/d$a;

    invoke-virtual {v0, v2}, Lcom/google/android/gms/internal/d$a;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_5

    return v1

    :cond_5
    iget-object v0, p0, Lcom/google/android/gms/internal/c$i;->gq:Lcom/google/android/gms/internal/c$d;

    if-nez v0, :cond_6

    iget-object v0, p1, Lcom/google/android/gms/internal/c$i;->gq:Lcom/google/android/gms/internal/c$d;

    if-eqz v0, :cond_7

    return v1

    :cond_6
    iget-object v2, p1, Lcom/google/android/gms/internal/c$i;->gq:Lcom/google/android/gms/internal/c$d;

    invoke-virtual {v0, v2}, Lcom/google/android/gms/internal/c$d;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_7

    return v1

    :cond_7
    invoke-virtual {p0, p1}, Lcom/google/android/gms/internal/c$i;->a(Lcom/google/android/gms/internal/ph;)Z

    move-result p0

    return p0
.end method

.method public hashCode()I
    .locals 3

    iget-object v0, p0, Lcom/google/android/gms/internal/c$i;->name:Ljava/lang/String;

    const/4 v1, 0x0

    if-nez v0, :cond_0

    move v0, v1

    goto :goto_0

    :cond_0
    invoke-virtual {v0}, Ljava/lang/String;->hashCode()I

    move-result v0

    :goto_0
    const/16 v2, 0x20f

    add-int/2addr v2, v0

    mul-int/lit8 v2, v2, 0x1f

    iget-object v0, p0, Lcom/google/android/gms/internal/c$i;->gp:Lcom/google/android/gms/internal/d$a;

    if-nez v0, :cond_1

    move v0, v1

    goto :goto_1

    :cond_1
    invoke-virtual {v0}, Lcom/google/android/gms/internal/d$a;->hashCode()I

    move-result v0

    :goto_1
    add-int/2addr v2, v0

    mul-int/lit8 v2, v2, 0x1f

    iget-object v0, p0, Lcom/google/android/gms/internal/c$i;->gq:Lcom/google/android/gms/internal/c$d;

    if-nez v0, :cond_2

    goto :goto_2

    :cond_2
    invoke-virtual {v0}, Lcom/google/android/gms/internal/c$d;->hashCode()I

    move-result v1

    :goto_2
    add-int/2addr v2, v1

    mul-int/lit8 v2, v2, 0x1f

    invoke-virtual {p0}, Lcom/google/android/gms/internal/c$i;->qz()I

    move-result p0

    add-int/2addr v2, p0

    return v2
.end method

.method public j(Lcom/google/android/gms/internal/pf;)Lcom/google/android/gms/internal/c$i;
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    :cond_0
    :goto_0
    invoke-virtual {p1}, Lcom/google/android/gms/internal/pf;->qi()I

    move-result v0

    if-eqz v0, :cond_6

    const/16 v1, 0xa

    if-eq v0, v1, :cond_5

    const/16 v1, 0x12

    if-eq v0, v1, :cond_3

    const/16 v1, 0x1a

    if-eq v0, v1, :cond_1

    invoke-virtual {p0, p1, v0}, Lcom/google/android/gms/internal/c$i;->a(Lcom/google/android/gms/internal/pf;I)Z

    move-result v0

    if-nez v0, :cond_0

    return-object p0

    :cond_1
    iget-object v0, p0, Lcom/google/android/gms/internal/c$i;->gq:Lcom/google/android/gms/internal/c$d;

    if-nez v0, :cond_2

    new-instance v0, Lcom/google/android/gms/internal/c$d;

    invoke-direct {v0}, Lcom/google/android/gms/internal/c$d;-><init>()V

    iput-object v0, p0, Lcom/google/android/gms/internal/c$i;->gq:Lcom/google/android/gms/internal/c$d;

    :cond_2
    iget-object v0, p0, Lcom/google/android/gms/internal/c$i;->gq:Lcom/google/android/gms/internal/c$d;

    goto :goto_1

    :cond_3
    iget-object v0, p0, Lcom/google/android/gms/internal/c$i;->gp:Lcom/google/android/gms/internal/d$a;

    if-nez v0, :cond_4

    new-instance v0, Lcom/google/android/gms/internal/d$a;

    invoke-direct {v0}, Lcom/google/android/gms/internal/d$a;-><init>()V

    iput-object v0, p0, Lcom/google/android/gms/internal/c$i;->gp:Lcom/google/android/gms/internal/d$a;

    :cond_4
    iget-object v0, p0, Lcom/google/android/gms/internal/c$i;->gp:Lcom/google/android/gms/internal/d$a;

    :goto_1
    invoke-virtual {p1, v0}, Lcom/google/android/gms/internal/pf;->a(Lcom/google/android/gms/internal/pn;)V

    goto :goto_0

    :cond_5
    invoke-virtual {p1}, Lcom/google/android/gms/internal/pf;->readString()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/google/android/gms/internal/c$i;->name:Ljava/lang/String;

    goto :goto_0

    :cond_6
    return-object p0
.end method

.method public p()Lcom/google/android/gms/internal/c$i;
    .locals 1

    const-string v0, ""

    iput-object v0, p0, Lcom/google/android/gms/internal/c$i;->name:Ljava/lang/String;

    const/4 v0, 0x0

    iput-object v0, p0, Lcom/google/android/gms/internal/c$i;->gp:Lcom/google/android/gms/internal/d$a;

    iput-object v0, p0, Lcom/google/android/gms/internal/c$i;->gq:Lcom/google/android/gms/internal/c$d;

    iput-object v0, p0, Lcom/google/android/gms/internal/c$i;->awJ:Lcom/google/android/gms/internal/pj;

    const/4 v0, -0x1

    iput v0, p0, Lcom/google/android/gms/internal/c$i;->awU:I

    return-object p0
.end method
