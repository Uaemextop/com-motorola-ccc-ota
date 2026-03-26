.class public final Lcom/google/android/gms/internal/nw;
.super Lcom/google/android/gms/internal/jj;

# interfaces
.implements Lcom/google/android/gms/plus/model/moments/Moment;


# static fields
.field public static final CREATOR:Lcom/google/android/gms/internal/nx;

.field private static final amb:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap<",
            "Ljava/lang/String;",
            "Lcom/google/android/gms/internal/ji$a<",
            "**>;>;"
        }
    .end annotation
.end field


# instance fields
.field BL:Ljava/lang/String;

.field final BR:I

.field amP:Ljava/lang/String;

.field amX:Lcom/google/android/gms/internal/nu;

.field amY:Lcom/google/android/gms/internal/nu;

.field final amc:Ljava/util/Set;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Set<",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation
.end field

.field uO:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .locals 4

    new-instance v0, Lcom/google/android/gms/internal/nx;

    invoke-direct {v0}, Lcom/google/android/gms/internal/nx;-><init>()V

    sput-object v0, Lcom/google/android/gms/internal/nw;->CREATOR:Lcom/google/android/gms/internal/nx;

    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    sput-object v0, Lcom/google/android/gms/internal/nw;->amb:Ljava/util/HashMap;

    const/4 v1, 0x2

    const-string v2, "id"

    invoke-static {v2, v1}, Lcom/google/android/gms/internal/ji$a;->l(Ljava/lang/String;I)Lcom/google/android/gms/internal/ji$a;

    move-result-object v1

    invoke-virtual {v0, v2, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const/4 v1, 0x4

    const-class v2, Lcom/google/android/gms/internal/nu;

    const-string v3, "result"

    invoke-static {v3, v1, v2}, Lcom/google/android/gms/internal/ji$a;->a(Ljava/lang/String;ILjava/lang/Class;)Lcom/google/android/gms/internal/ji$a;

    move-result-object v1

    invoke-virtual {v0, v3, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const/4 v1, 0x5

    const-string v2, "startDate"

    invoke-static {v2, v1}, Lcom/google/android/gms/internal/ji$a;->l(Ljava/lang/String;I)Lcom/google/android/gms/internal/ji$a;

    move-result-object v1

    invoke-virtual {v0, v2, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const/4 v1, 0x6

    const-class v2, Lcom/google/android/gms/internal/nu;

    const-string v3, "target"

    invoke-static {v3, v1, v2}, Lcom/google/android/gms/internal/ji$a;->a(Ljava/lang/String;ILjava/lang/Class;)Lcom/google/android/gms/internal/ji$a;

    move-result-object v1

    invoke-virtual {v0, v3, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const/4 v1, 0x7

    const-string v2, "type"

    invoke-static {v2, v1}, Lcom/google/android/gms/internal/ji$a;->l(Ljava/lang/String;I)Lcom/google/android/gms/internal/ji$a;

    move-result-object v1

    invoke-virtual {v0, v2, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    return-void
.end method

.method public constructor <init>()V
    .locals 1

    invoke-direct {p0}, Lcom/google/android/gms/internal/jj;-><init>()V

    const/4 v0, 0x1

    iput v0, p0, Lcom/google/android/gms/internal/nw;->BR:I

    new-instance v0, Ljava/util/HashSet;

    invoke-direct {v0}, Ljava/util/HashSet;-><init>()V

    iput-object v0, p0, Lcom/google/android/gms/internal/nw;->amc:Ljava/util/Set;

    return-void
.end method

.method constructor <init>(Ljava/util/Set;ILjava/lang/String;Lcom/google/android/gms/internal/nu;Ljava/lang/String;Lcom/google/android/gms/internal/nu;Ljava/lang/String;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Set<",
            "Ljava/lang/Integer;",
            ">;I",
            "Ljava/lang/String;",
            "Lcom/google/android/gms/internal/nu;",
            "Ljava/lang/String;",
            "Lcom/google/android/gms/internal/nu;",
            "Ljava/lang/String;",
            ")V"
        }
    .end annotation

    invoke-direct {p0}, Lcom/google/android/gms/internal/jj;-><init>()V

    iput-object p1, p0, Lcom/google/android/gms/internal/nw;->amc:Ljava/util/Set;

    iput p2, p0, Lcom/google/android/gms/internal/nw;->BR:I

    iput-object p3, p0, Lcom/google/android/gms/internal/nw;->BL:Ljava/lang/String;

    iput-object p4, p0, Lcom/google/android/gms/internal/nw;->amX:Lcom/google/android/gms/internal/nu;

    iput-object p5, p0, Lcom/google/android/gms/internal/nw;->amP:Ljava/lang/String;

    iput-object p6, p0, Lcom/google/android/gms/internal/nw;->amY:Lcom/google/android/gms/internal/nu;

    iput-object p7, p0, Lcom/google/android/gms/internal/nw;->uO:Ljava/lang/String;

    return-void
.end method

.method public constructor <init>(Ljava/util/Set;Ljava/lang/String;Lcom/google/android/gms/internal/nu;Ljava/lang/String;Lcom/google/android/gms/internal/nu;Ljava/lang/String;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Set<",
            "Ljava/lang/Integer;",
            ">;",
            "Ljava/lang/String;",
            "Lcom/google/android/gms/internal/nu;",
            "Ljava/lang/String;",
            "Lcom/google/android/gms/internal/nu;",
            "Ljava/lang/String;",
            ")V"
        }
    .end annotation

    invoke-direct {p0}, Lcom/google/android/gms/internal/jj;-><init>()V

    iput-object p1, p0, Lcom/google/android/gms/internal/nw;->amc:Ljava/util/Set;

    const/4 p1, 0x1

    iput p1, p0, Lcom/google/android/gms/internal/nw;->BR:I

    iput-object p2, p0, Lcom/google/android/gms/internal/nw;->BL:Ljava/lang/String;

    iput-object p3, p0, Lcom/google/android/gms/internal/nw;->amX:Lcom/google/android/gms/internal/nu;

    iput-object p4, p0, Lcom/google/android/gms/internal/nw;->amP:Ljava/lang/String;

    iput-object p5, p0, Lcom/google/android/gms/internal/nw;->amY:Lcom/google/android/gms/internal/nu;

    iput-object p6, p0, Lcom/google/android/gms/internal/nw;->uO:Ljava/lang/String;

    return-void
.end method


# virtual methods
.method protected a(Lcom/google/android/gms/internal/ji$a;)Z
    .locals 0

    iget-object p0, p0, Lcom/google/android/gms/internal/nw;->amc:Ljava/util/Set;

    invoke-virtual {p1}, Lcom/google/android/gms/internal/ji$a;->hm()I

    move-result p1

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p1

    invoke-interface {p0, p1}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result p0

    return p0
.end method

.method protected b(Lcom/google/android/gms/internal/ji$a;)Ljava/lang/Object;
    .locals 2

    invoke-virtual {p1}, Lcom/google/android/gms/internal/ji$a;->hm()I

    move-result v0

    const/4 v1, 0x2

    if-eq v0, v1, :cond_4

    const/4 v1, 0x4

    if-eq v0, v1, :cond_3

    const/4 v1, 0x5

    if-eq v0, v1, :cond_2

    const/4 v1, 0x6

    if-eq v0, v1, :cond_1

    const/4 v1, 0x7

    if-ne v0, v1, :cond_0

    iget-object p0, p0, Lcom/google/android/gms/internal/nw;->uO:Ljava/lang/String;

    return-object p0

    :cond_0
    new-instance p0, Ljava/lang/IllegalStateException;

    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "Unknown safe parcelable id="

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p1}, Lcom/google/android/gms/internal/ji$a;->hm()I

    move-result p1

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-direct {p0, p1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw p0

    :cond_1
    iget-object p0, p0, Lcom/google/android/gms/internal/nw;->amY:Lcom/google/android/gms/internal/nu;

    return-object p0

    :cond_2
    iget-object p0, p0, Lcom/google/android/gms/internal/nw;->amP:Ljava/lang/String;

    return-object p0

    :cond_3
    iget-object p0, p0, Lcom/google/android/gms/internal/nw;->amX:Lcom/google/android/gms/internal/nu;

    return-object p0

    :cond_4
    iget-object p0, p0, Lcom/google/android/gms/internal/nw;->BL:Ljava/lang/String;

    return-object p0
.end method

.method public describeContents()I
    .locals 0

    const/4 p0, 0x0

    return p0
.end method

.method public equals(Ljava/lang/Object;)Z
    .locals 5

    instance-of v0, p1, Lcom/google/android/gms/internal/nw;

    const/4 v1, 0x0

    if-nez v0, :cond_0

    return v1

    :cond_0
    const/4 v0, 0x1

    if-ne p0, p1, :cond_1

    return v0

    :cond_1
    check-cast p1, Lcom/google/android/gms/internal/nw;

    sget-object v2, Lcom/google/android/gms/internal/nw;->amb:Ljava/util/HashMap;

    invoke-virtual {v2}, Ljava/util/HashMap;->values()Ljava/util/Collection;

    move-result-object v2

    invoke-interface {v2}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :cond_2
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_5

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/google/android/gms/internal/ji$a;

    invoke-virtual {p0, v3}, Lcom/google/android/gms/internal/nw;->a(Lcom/google/android/gms/internal/ji$a;)Z

    move-result v4

    if-eqz v4, :cond_4

    invoke-virtual {p1, v3}, Lcom/google/android/gms/internal/nw;->a(Lcom/google/android/gms/internal/ji$a;)Z

    move-result v4

    if-eqz v4, :cond_3

    invoke-virtual {p0, v3}, Lcom/google/android/gms/internal/nw;->b(Lcom/google/android/gms/internal/ji$a;)Ljava/lang/Object;

    move-result-object v4

    invoke-virtual {p1, v3}, Lcom/google/android/gms/internal/nw;->b(Lcom/google/android/gms/internal/ji$a;)Ljava/lang/Object;

    move-result-object v3

    invoke-virtual {v4, v3}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_2

    :cond_3
    return v1

    :cond_4
    invoke-virtual {p1, v3}, Lcom/google/android/gms/internal/nw;->a(Lcom/google/android/gms/internal/ji$a;)Z

    move-result v3

    if-eqz v3, :cond_2

    return v1

    :cond_5
    return v0
.end method

.method public synthetic freeze()Ljava/lang/Object;
    .locals 0

    invoke-virtual {p0}, Lcom/google/android/gms/internal/nw;->ns()Lcom/google/android/gms/internal/nw;

    move-result-object p0

    return-object p0
.end method

.method public getId()Ljava/lang/String;
    .locals 0

    iget-object p0, p0, Lcom/google/android/gms/internal/nw;->BL:Ljava/lang/String;

    return-object p0
.end method

.method public getResult()Lcom/google/android/gms/plus/model/moments/ItemScope;
    .locals 0

    iget-object p0, p0, Lcom/google/android/gms/internal/nw;->amX:Lcom/google/android/gms/internal/nu;

    return-object p0
.end method

.method public getStartDate()Ljava/lang/String;
    .locals 0

    iget-object p0, p0, Lcom/google/android/gms/internal/nw;->amP:Ljava/lang/String;

    return-object p0
.end method

.method public getTarget()Lcom/google/android/gms/plus/model/moments/ItemScope;
    .locals 0

    iget-object p0, p0, Lcom/google/android/gms/internal/nw;->amY:Lcom/google/android/gms/internal/nu;

    return-object p0
.end method

.method public getType()Ljava/lang/String;
    .locals 0

    iget-object p0, p0, Lcom/google/android/gms/internal/nw;->uO:Ljava/lang/String;

    return-object p0
.end method

.method public hasId()Z
    .locals 1

    iget-object p0, p0, Lcom/google/android/gms/internal/nw;->amc:Ljava/util/Set;

    const/4 v0, 0x2

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    invoke-interface {p0, v0}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result p0

    return p0
.end method

.method public hasResult()Z
    .locals 1

    iget-object p0, p0, Lcom/google/android/gms/internal/nw;->amc:Ljava/util/Set;

    const/4 v0, 0x4

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    invoke-interface {p0, v0}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result p0

    return p0
.end method

.method public hasStartDate()Z
    .locals 1

    iget-object p0, p0, Lcom/google/android/gms/internal/nw;->amc:Ljava/util/Set;

    const/4 v0, 0x5

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    invoke-interface {p0, v0}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result p0

    return p0
.end method

.method public hasTarget()Z
    .locals 1

    iget-object p0, p0, Lcom/google/android/gms/internal/nw;->amc:Ljava/util/Set;

    const/4 v0, 0x6

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    invoke-interface {p0, v0}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result p0

    return p0
.end method

.method public hasType()Z
    .locals 1

    iget-object p0, p0, Lcom/google/android/gms/internal/nw;->amc:Ljava/util/Set;

    const/4 v0, 0x7

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    invoke-interface {p0, v0}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result p0

    return p0
.end method

.method public hashCode()I
    .locals 4

    sget-object v0, Lcom/google/android/gms/internal/nw;->amb:Ljava/util/HashMap;

    invoke-virtual {v0}, Ljava/util/HashMap;->values()Ljava/util/Collection;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v0

    const/4 v1, 0x0

    :cond_0
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_1

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/google/android/gms/internal/ji$a;

    invoke-virtual {p0, v2}, Lcom/google/android/gms/internal/nw;->a(Lcom/google/android/gms/internal/ji$a;)Z

    move-result v3

    if-eqz v3, :cond_0

    invoke-virtual {v2}, Lcom/google/android/gms/internal/ji$a;->hm()I

    move-result v3

    add-int/2addr v1, v3

    invoke-virtual {p0, v2}, Lcom/google/android/gms/internal/nw;->b(Lcom/google/android/gms/internal/ji$a;)Ljava/lang/Object;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Object;->hashCode()I

    move-result v2

    add-int/2addr v1, v2

    goto :goto_0

    :cond_1
    return v1
.end method

.method public hf()Ljava/util/HashMap;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/HashMap<",
            "Ljava/lang/String;",
            "Lcom/google/android/gms/internal/ji$a<",
            "**>;>;"
        }
    .end annotation

    sget-object p0, Lcom/google/android/gms/internal/nw;->amb:Ljava/util/HashMap;

    return-object p0
.end method

.method public isDataValid()Z
    .locals 0

    const/4 p0, 0x1

    return p0
.end method

.method public ns()Lcom/google/android/gms/internal/nw;
    .locals 0

    return-object p0
.end method

.method public writeToParcel(Landroid/os/Parcel;I)V
    .locals 0

    invoke-static {p0, p1, p2}, Lcom/google/android/gms/internal/nx;->a(Lcom/google/android/gms/internal/nw;Landroid/os/Parcel;I)V

    return-void
.end method
