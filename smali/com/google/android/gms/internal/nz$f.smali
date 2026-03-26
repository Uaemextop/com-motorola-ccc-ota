.class public final Lcom/google/android/gms/internal/nz$f;
.super Lcom/google/android/gms/internal/jj;

# interfaces
.implements Lcom/google/android/gms/plus/model/people/Person$Organizations;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/google/android/gms/internal/nz;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "f"
.end annotation


# static fields
.field public static final CREATOR:Lcom/google/android/gms/internal/oh;

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
.field final BR:I

.field FD:I

.field Nw:Ljava/lang/String;

.field Tr:Ljava/lang/String;

.field amP:Ljava/lang/String;

.field final amc:Ljava/util/Set;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Set<",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation
.end field

.field amz:Ljava/lang/String;

.field anE:Ljava/lang/String;

.field anF:Ljava/lang/String;

.field anG:Z

.field mName:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .locals 5

    new-instance v0, Lcom/google/android/gms/internal/oh;

    invoke-direct {v0}, Lcom/google/android/gms/internal/oh;-><init>()V

    sput-object v0, Lcom/google/android/gms/internal/nz$f;->CREATOR:Lcom/google/android/gms/internal/oh;

    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    sput-object v0, Lcom/google/android/gms/internal/nz$f;->amb:Ljava/util/HashMap;

    const/4 v1, 0x2

    const-string v2, "department"

    invoke-static {v2, v1}, Lcom/google/android/gms/internal/ji$a;->l(Ljava/lang/String;I)Lcom/google/android/gms/internal/ji$a;

    move-result-object v1

    invoke-virtual {v0, v2, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const/4 v1, 0x3

    const-string v2, "description"

    invoke-static {v2, v1}, Lcom/google/android/gms/internal/ji$a;->l(Ljava/lang/String;I)Lcom/google/android/gms/internal/ji$a;

    move-result-object v1

    invoke-virtual {v0, v2, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const/4 v1, 0x4

    const-string v2, "endDate"

    invoke-static {v2, v1}, Lcom/google/android/gms/internal/ji$a;->l(Ljava/lang/String;I)Lcom/google/android/gms/internal/ji$a;

    move-result-object v1

    invoke-virtual {v0, v2, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const/4 v1, 0x5

    const-string v2, "location"

    invoke-static {v2, v1}, Lcom/google/android/gms/internal/ji$a;->l(Ljava/lang/String;I)Lcom/google/android/gms/internal/ji$a;

    move-result-object v1

    invoke-virtual {v0, v2, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const/4 v1, 0x6

    const-string v2, "name"

    invoke-static {v2, v1}, Lcom/google/android/gms/internal/ji$a;->l(Ljava/lang/String;I)Lcom/google/android/gms/internal/ji$a;

    move-result-object v1

    invoke-virtual {v0, v2, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const/4 v1, 0x7

    const-string v2, "primary"

    invoke-static {v2, v1}, Lcom/google/android/gms/internal/ji$a;->k(Ljava/lang/String;I)Lcom/google/android/gms/internal/ji$a;

    move-result-object v1

    invoke-virtual {v0, v2, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const/16 v1, 0x8

    const-string v2, "startDate"

    invoke-static {v2, v1}, Lcom/google/android/gms/internal/ji$a;->l(Ljava/lang/String;I)Lcom/google/android/gms/internal/ji$a;

    move-result-object v1

    invoke-virtual {v0, v2, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const/16 v1, 0x9

    const-string v2, "title"

    invoke-static {v2, v1}, Lcom/google/android/gms/internal/ji$a;->l(Ljava/lang/String;I)Lcom/google/android/gms/internal/ji$a;

    move-result-object v1

    invoke-virtual {v0, v2, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    new-instance v1, Lcom/google/android/gms/internal/jf;

    invoke-direct {v1}, Lcom/google/android/gms/internal/jf;-><init>()V

    const-string v2, "work"

    const/4 v3, 0x0

    invoke-virtual {v1, v2, v3}, Lcom/google/android/gms/internal/jf;->h(Ljava/lang/String;I)Lcom/google/android/gms/internal/jf;

    move-result-object v1

    const-string v2, "school"

    const/4 v4, 0x1

    invoke-virtual {v1, v2, v4}, Lcom/google/android/gms/internal/jf;->h(Ljava/lang/String;I)Lcom/google/android/gms/internal/jf;

    move-result-object v1

    const-string v2, "type"

    const/16 v4, 0xa

    invoke-static {v2, v4, v1, v3}, Lcom/google/android/gms/internal/ji$a;->a(Ljava/lang/String;ILcom/google/android/gms/internal/ji$b;Z)Lcom/google/android/gms/internal/ji$a;

    move-result-object v1

    invoke-virtual {v0, v2, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    return-void
.end method

.method public constructor <init>()V
    .locals 1

    invoke-direct {p0}, Lcom/google/android/gms/internal/jj;-><init>()V

    const/4 v0, 0x1

    iput v0, p0, Lcom/google/android/gms/internal/nz$f;->BR:I

    new-instance v0, Ljava/util/HashSet;

    invoke-direct {v0}, Ljava/util/HashSet;-><init>()V

    iput-object v0, p0, Lcom/google/android/gms/internal/nz$f;->amc:Ljava/util/Set;

    return-void
.end method

.method constructor <init>(Ljava/util/Set;ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;ZLjava/lang/String;Ljava/lang/String;I)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Set<",
            "Ljava/lang/Integer;",
            ">;I",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Z",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "I)V"
        }
    .end annotation

    invoke-direct {p0}, Lcom/google/android/gms/internal/jj;-><init>()V

    iput-object p1, p0, Lcom/google/android/gms/internal/nz$f;->amc:Ljava/util/Set;

    iput p2, p0, Lcom/google/android/gms/internal/nz$f;->BR:I

    iput-object p3, p0, Lcom/google/android/gms/internal/nz$f;->anE:Ljava/lang/String;

    iput-object p4, p0, Lcom/google/android/gms/internal/nz$f;->Tr:Ljava/lang/String;

    iput-object p5, p0, Lcom/google/android/gms/internal/nz$f;->amz:Ljava/lang/String;

    iput-object p6, p0, Lcom/google/android/gms/internal/nz$f;->anF:Ljava/lang/String;

    iput-object p7, p0, Lcom/google/android/gms/internal/nz$f;->mName:Ljava/lang/String;

    iput-boolean p8, p0, Lcom/google/android/gms/internal/nz$f;->anG:Z

    iput-object p9, p0, Lcom/google/android/gms/internal/nz$f;->amP:Ljava/lang/String;

    iput-object p10, p0, Lcom/google/android/gms/internal/nz$f;->Nw:Ljava/lang/String;

    iput p11, p0, Lcom/google/android/gms/internal/nz$f;->FD:I

    return-void
.end method


# virtual methods
.method protected a(Lcom/google/android/gms/internal/ji$a;)Z
    .locals 0

    iget-object p0, p0, Lcom/google/android/gms/internal/nz$f;->amc:Ljava/util/Set;

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

    packed-switch v0, :pswitch_data_0

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

    :pswitch_0
    iget p0, p0, Lcom/google/android/gms/internal/nz$f;->FD:I

    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p0

    return-object p0

    :pswitch_1
    iget-object p0, p0, Lcom/google/android/gms/internal/nz$f;->Nw:Ljava/lang/String;

    return-object p0

    :pswitch_2
    iget-object p0, p0, Lcom/google/android/gms/internal/nz$f;->amP:Ljava/lang/String;

    return-object p0

    :pswitch_3
    iget-boolean p0, p0, Lcom/google/android/gms/internal/nz$f;->anG:Z

    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object p0

    return-object p0

    :pswitch_4
    iget-object p0, p0, Lcom/google/android/gms/internal/nz$f;->mName:Ljava/lang/String;

    return-object p0

    :pswitch_5
    iget-object p0, p0, Lcom/google/android/gms/internal/nz$f;->anF:Ljava/lang/String;

    return-object p0

    :pswitch_6
    iget-object p0, p0, Lcom/google/android/gms/internal/nz$f;->amz:Ljava/lang/String;

    return-object p0

    :pswitch_7
    iget-object p0, p0, Lcom/google/android/gms/internal/nz$f;->Tr:Ljava/lang/String;

    return-object p0

    :pswitch_8
    iget-object p0, p0, Lcom/google/android/gms/internal/nz$f;->anE:Ljava/lang/String;

    return-object p0

    nop

    :pswitch_data_0
    .packed-switch 0x2
        :pswitch_8
        :pswitch_7
        :pswitch_6
        :pswitch_5
        :pswitch_4
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method public describeContents()I
    .locals 0

    const/4 p0, 0x0

    return p0
.end method

.method public equals(Ljava/lang/Object;)Z
    .locals 5

    instance-of v0, p1, Lcom/google/android/gms/internal/nz$f;

    const/4 v1, 0x0

    if-nez v0, :cond_0

    return v1

    :cond_0
    const/4 v0, 0x1

    if-ne p0, p1, :cond_1

    return v0

    :cond_1
    check-cast p1, Lcom/google/android/gms/internal/nz$f;

    sget-object v2, Lcom/google/android/gms/internal/nz$f;->amb:Ljava/util/HashMap;

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

    invoke-virtual {p0, v3}, Lcom/google/android/gms/internal/nz$f;->a(Lcom/google/android/gms/internal/ji$a;)Z

    move-result v4

    if-eqz v4, :cond_4

    invoke-virtual {p1, v3}, Lcom/google/android/gms/internal/nz$f;->a(Lcom/google/android/gms/internal/ji$a;)Z

    move-result v4

    if-eqz v4, :cond_3

    invoke-virtual {p0, v3}, Lcom/google/android/gms/internal/nz$f;->b(Lcom/google/android/gms/internal/ji$a;)Ljava/lang/Object;

    move-result-object v4

    invoke-virtual {p1, v3}, Lcom/google/android/gms/internal/nz$f;->b(Lcom/google/android/gms/internal/ji$a;)Ljava/lang/Object;

    move-result-object v3

    invoke-virtual {v4, v3}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_2

    :cond_3
    return v1

    :cond_4
    invoke-virtual {p1, v3}, Lcom/google/android/gms/internal/nz$f;->a(Lcom/google/android/gms/internal/ji$a;)Z

    move-result v3

    if-eqz v3, :cond_2

    return v1

    :cond_5
    return v0
.end method

.method public synthetic freeze()Ljava/lang/Object;
    .locals 0

    invoke-virtual {p0}, Lcom/google/android/gms/internal/nz$f;->nB()Lcom/google/android/gms/internal/nz$f;

    move-result-object p0

    return-object p0
.end method

.method public getDepartment()Ljava/lang/String;
    .locals 0

    iget-object p0, p0, Lcom/google/android/gms/internal/nz$f;->anE:Ljava/lang/String;

    return-object p0
.end method

.method public getDescription()Ljava/lang/String;
    .locals 0

    iget-object p0, p0, Lcom/google/android/gms/internal/nz$f;->Tr:Ljava/lang/String;

    return-object p0
.end method

.method public getEndDate()Ljava/lang/String;
    .locals 0

    iget-object p0, p0, Lcom/google/android/gms/internal/nz$f;->amz:Ljava/lang/String;

    return-object p0
.end method

.method public getLocation()Ljava/lang/String;
    .locals 0

    iget-object p0, p0, Lcom/google/android/gms/internal/nz$f;->anF:Ljava/lang/String;

    return-object p0
.end method

.method public getName()Ljava/lang/String;
    .locals 0

    iget-object p0, p0, Lcom/google/android/gms/internal/nz$f;->mName:Ljava/lang/String;

    return-object p0
.end method

.method public getStartDate()Ljava/lang/String;
    .locals 0

    iget-object p0, p0, Lcom/google/android/gms/internal/nz$f;->amP:Ljava/lang/String;

    return-object p0
.end method

.method public getTitle()Ljava/lang/String;
    .locals 0

    iget-object p0, p0, Lcom/google/android/gms/internal/nz$f;->Nw:Ljava/lang/String;

    return-object p0
.end method

.method public getType()I
    .locals 0

    iget p0, p0, Lcom/google/android/gms/internal/nz$f;->FD:I

    return p0
.end method

.method public hasDepartment()Z
    .locals 1

    iget-object p0, p0, Lcom/google/android/gms/internal/nz$f;->amc:Ljava/util/Set;

    const/4 v0, 0x2

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    invoke-interface {p0, v0}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result p0

    return p0
.end method

.method public hasDescription()Z
    .locals 1

    iget-object p0, p0, Lcom/google/android/gms/internal/nz$f;->amc:Ljava/util/Set;

    const/4 v0, 0x3

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    invoke-interface {p0, v0}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result p0

    return p0
.end method

.method public hasEndDate()Z
    .locals 1

    iget-object p0, p0, Lcom/google/android/gms/internal/nz$f;->amc:Ljava/util/Set;

    const/4 v0, 0x4

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    invoke-interface {p0, v0}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result p0

    return p0
.end method

.method public hasLocation()Z
    .locals 1

    iget-object p0, p0, Lcom/google/android/gms/internal/nz$f;->amc:Ljava/util/Set;

    const/4 v0, 0x5

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    invoke-interface {p0, v0}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result p0

    return p0
.end method

.method public hasName()Z
    .locals 1

    iget-object p0, p0, Lcom/google/android/gms/internal/nz$f;->amc:Ljava/util/Set;

    const/4 v0, 0x6

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    invoke-interface {p0, v0}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result p0

    return p0
.end method

.method public hasPrimary()Z
    .locals 1

    iget-object p0, p0, Lcom/google/android/gms/internal/nz$f;->amc:Ljava/util/Set;

    const/4 v0, 0x7

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    invoke-interface {p0, v0}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result p0

    return p0
.end method

.method public hasStartDate()Z
    .locals 1

    iget-object p0, p0, Lcom/google/android/gms/internal/nz$f;->amc:Ljava/util/Set;

    const/16 v0, 0x8

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    invoke-interface {p0, v0}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result p0

    return p0
.end method

.method public hasTitle()Z
    .locals 1

    iget-object p0, p0, Lcom/google/android/gms/internal/nz$f;->amc:Ljava/util/Set;

    const/16 v0, 0x9

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    invoke-interface {p0, v0}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result p0

    return p0
.end method

.method public hasType()Z
    .locals 1

    iget-object p0, p0, Lcom/google/android/gms/internal/nz$f;->amc:Ljava/util/Set;

    const/16 v0, 0xa

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    invoke-interface {p0, v0}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result p0

    return p0
.end method

.method public hashCode()I
    .locals 4

    sget-object v0, Lcom/google/android/gms/internal/nz$f;->amb:Ljava/util/HashMap;

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

    invoke-virtual {p0, v2}, Lcom/google/android/gms/internal/nz$f;->a(Lcom/google/android/gms/internal/ji$a;)Z

    move-result v3

    if-eqz v3, :cond_0

    invoke-virtual {v2}, Lcom/google/android/gms/internal/ji$a;->hm()I

    move-result v3

    add-int/2addr v1, v3

    invoke-virtual {p0, v2}, Lcom/google/android/gms/internal/nz$f;->b(Lcom/google/android/gms/internal/ji$a;)Ljava/lang/Object;

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

    sget-object p0, Lcom/google/android/gms/internal/nz$f;->amb:Ljava/util/HashMap;

    return-object p0
.end method

.method public isDataValid()Z
    .locals 0

    const/4 p0, 0x1

    return p0
.end method

.method public isPrimary()Z
    .locals 0

    iget-boolean p0, p0, Lcom/google/android/gms/internal/nz$f;->anG:Z

    return p0
.end method

.method public nB()Lcom/google/android/gms/internal/nz$f;
    .locals 0

    return-object p0
.end method

.method public writeToParcel(Landroid/os/Parcel;I)V
    .locals 0

    invoke-static {p0, p1, p2}, Lcom/google/android/gms/internal/oh;->a(Lcom/google/android/gms/internal/nz$f;Landroid/os/Parcel;I)V

    return-void
.end method
