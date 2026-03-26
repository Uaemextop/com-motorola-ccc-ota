.class public final Lcom/google/android/gms/internal/nz;
.super Lcom/google/android/gms/internal/jj;

# interfaces
.implements Lcom/google/android/gms/plus/model/people/Person;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/google/android/gms/internal/nz$h;,
        Lcom/google/android/gms/internal/nz$g;,
        Lcom/google/android/gms/internal/nz$f;,
        Lcom/google/android/gms/internal/nz$d;,
        Lcom/google/android/gms/internal/nz$c;,
        Lcom/google/android/gms/internal/nz$b;,
        Lcom/google/android/gms/internal/nz$a;,
        Lcom/google/android/gms/internal/nz$e;
    }
.end annotation


# static fields
.field public static final CREATOR:Lcom/google/android/gms/internal/oa;

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

.field Fc:Ljava/lang/String;

.field NH:Ljava/lang/String;

.field final amc:Ljava/util/Set;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Set<",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation
.end field

.field ana:Ljava/lang/String;

.field anb:Lcom/google/android/gms/internal/nz$a;

.field anc:Ljava/lang/String;

.field and:Ljava/lang/String;

.field ane:I

.field anf:Lcom/google/android/gms/internal/nz$b;

.field ang:Ljava/lang/String;

.field anh:Lcom/google/android/gms/internal/nz$c;

.field ani:Z

.field anj:Lcom/google/android/gms/internal/nz$d;

.field ank:Ljava/lang/String;

.field anl:I

.field anm:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/google/android/gms/internal/nz$f;",
            ">;"
        }
    .end annotation
.end field

.field ann:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/google/android/gms/internal/nz$g;",
            ">;"
        }
    .end annotation
.end field

.field ano:I

.field anp:I

.field anq:Ljava/lang/String;

.field anr:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/google/android/gms/internal/nz$h;",
            ">;"
        }
    .end annotation
.end field

.field ans:Z

.field om:I

.field uR:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .locals 13

    new-instance v0, Lcom/google/android/gms/internal/oa;

    invoke-direct {v0}, Lcom/google/android/gms/internal/oa;-><init>()V

    sput-object v0, Lcom/google/android/gms/internal/nz;->CREATOR:Lcom/google/android/gms/internal/oa;

    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    sput-object v0, Lcom/google/android/gms/internal/nz;->amb:Ljava/util/HashMap;

    const-string v1, "aboutMe"

    const/4 v2, 0x2

    invoke-static {v1, v2}, Lcom/google/android/gms/internal/ji$a;->l(Ljava/lang/String;I)Lcom/google/android/gms/internal/ji$a;

    move-result-object v3

    invoke-virtual {v0, v1, v3}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-class v1, Lcom/google/android/gms/internal/nz$a;

    const-string v3, "ageRange"

    const/4 v4, 0x3

    invoke-static {v3, v4, v1}, Lcom/google/android/gms/internal/ji$a;->a(Ljava/lang/String;ILjava/lang/Class;)Lcom/google/android/gms/internal/ji$a;

    move-result-object v1

    invoke-virtual {v0, v3, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string v1, "birthday"

    const/4 v3, 0x4

    invoke-static {v1, v3}, Lcom/google/android/gms/internal/ji$a;->l(Ljava/lang/String;I)Lcom/google/android/gms/internal/ji$a;

    move-result-object v5

    invoke-virtual {v0, v1, v5}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string v1, "braggingRights"

    const/4 v5, 0x5

    invoke-static {v1, v5}, Lcom/google/android/gms/internal/ji$a;->l(Ljava/lang/String;I)Lcom/google/android/gms/internal/ji$a;

    move-result-object v6

    invoke-virtual {v0, v1, v6}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string v1, "circledByCount"

    const/4 v6, 0x6

    invoke-static {v1, v6}, Lcom/google/android/gms/internal/ji$a;->i(Ljava/lang/String;I)Lcom/google/android/gms/internal/ji$a;

    move-result-object v7

    invoke-virtual {v0, v1, v7}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-class v1, Lcom/google/android/gms/internal/nz$b;

    const-string v7, "cover"

    const/4 v8, 0x7

    invoke-static {v7, v8, v1}, Lcom/google/android/gms/internal/ji$a;->a(Ljava/lang/String;ILjava/lang/Class;)Lcom/google/android/gms/internal/ji$a;

    move-result-object v1

    invoke-virtual {v0, v7, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string v1, "currentLocation"

    const/16 v7, 0x8

    invoke-static {v1, v7}, Lcom/google/android/gms/internal/ji$a;->l(Ljava/lang/String;I)Lcom/google/android/gms/internal/ji$a;

    move-result-object v9

    invoke-virtual {v0, v1, v9}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const/16 v1, 0x9

    const-string v9, "displayName"

    invoke-static {v9, v1}, Lcom/google/android/gms/internal/ji$a;->l(Ljava/lang/String;I)Lcom/google/android/gms/internal/ji$a;

    move-result-object v1

    invoke-virtual {v0, v9, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    new-instance v1, Lcom/google/android/gms/internal/jf;

    invoke-direct {v1}, Lcom/google/android/gms/internal/jf;-><init>()V

    const-string v9, "male"

    const/4 v10, 0x0

    invoke-virtual {v1, v9, v10}, Lcom/google/android/gms/internal/jf;->h(Ljava/lang/String;I)Lcom/google/android/gms/internal/jf;

    move-result-object v1

    const-string v9, "female"

    const/4 v11, 0x1

    invoke-virtual {v1, v9, v11}, Lcom/google/android/gms/internal/jf;->h(Ljava/lang/String;I)Lcom/google/android/gms/internal/jf;

    move-result-object v1

    const-string v9, "other"

    invoke-virtual {v1, v9, v2}, Lcom/google/android/gms/internal/jf;->h(Ljava/lang/String;I)Lcom/google/android/gms/internal/jf;

    move-result-object v1

    const-string v9, "gender"

    const/16 v12, 0xc

    invoke-static {v9, v12, v1, v10}, Lcom/google/android/gms/internal/ji$a;->a(Ljava/lang/String;ILcom/google/android/gms/internal/ji$b;Z)Lcom/google/android/gms/internal/ji$a;

    move-result-object v1

    invoke-virtual {v0, v9, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const/16 v1, 0xe

    const-string v9, "id"

    invoke-static {v9, v1}, Lcom/google/android/gms/internal/ji$a;->l(Ljava/lang/String;I)Lcom/google/android/gms/internal/ji$a;

    move-result-object v1

    invoke-virtual {v0, v9, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const/16 v1, 0xf

    const-class v9, Lcom/google/android/gms/internal/nz$c;

    const-string v12, "image"

    invoke-static {v12, v1, v9}, Lcom/google/android/gms/internal/ji$a;->a(Ljava/lang/String;ILjava/lang/Class;)Lcom/google/android/gms/internal/ji$a;

    move-result-object v1

    invoke-virtual {v0, v12, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const/16 v1, 0x10

    const-string v9, "isPlusUser"

    invoke-static {v9, v1}, Lcom/google/android/gms/internal/ji$a;->k(Ljava/lang/String;I)Lcom/google/android/gms/internal/ji$a;

    move-result-object v1

    invoke-virtual {v0, v9, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const/16 v1, 0x12

    const-string v9, "language"

    invoke-static {v9, v1}, Lcom/google/android/gms/internal/ji$a;->l(Ljava/lang/String;I)Lcom/google/android/gms/internal/ji$a;

    move-result-object v1

    invoke-virtual {v0, v9, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const/16 v1, 0x13

    const-class v9, Lcom/google/android/gms/internal/nz$d;

    const-string v12, "name"

    invoke-static {v12, v1, v9}, Lcom/google/android/gms/internal/ji$a;->a(Ljava/lang/String;ILjava/lang/Class;)Lcom/google/android/gms/internal/ji$a;

    move-result-object v1

    const-string v9, "name"

    invoke-virtual {v0, v9, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string v1, "nickname"

    const/16 v9, 0x14

    invoke-static {v1, v9}, Lcom/google/android/gms/internal/ji$a;->l(Ljava/lang/String;I)Lcom/google/android/gms/internal/ji$a;

    move-result-object v1

    const-string v9, "nickname"

    invoke-virtual {v0, v9, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    new-instance v1, Lcom/google/android/gms/internal/jf;

    invoke-direct {v1}, Lcom/google/android/gms/internal/jf;-><init>()V

    const-string v9, "person"

    invoke-virtual {v1, v9, v10}, Lcom/google/android/gms/internal/jf;->h(Ljava/lang/String;I)Lcom/google/android/gms/internal/jf;

    move-result-object v1

    const-string v9, "page"

    invoke-virtual {v1, v9, v11}, Lcom/google/android/gms/internal/jf;->h(Ljava/lang/String;I)Lcom/google/android/gms/internal/jf;

    move-result-object v1

    const-string v9, "objectType"

    const/16 v12, 0x15

    invoke-static {v9, v12, v1, v10}, Lcom/google/android/gms/internal/ji$a;->a(Ljava/lang/String;ILcom/google/android/gms/internal/ji$b;Z)Lcom/google/android/gms/internal/ji$a;

    move-result-object v1

    const-string v9, "objectType"

    invoke-virtual {v0, v9, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const/16 v1, 0x16

    const-class v9, Lcom/google/android/gms/internal/nz$f;

    const-string v12, "organizations"

    invoke-static {v12, v1, v9}, Lcom/google/android/gms/internal/ji$a;->b(Ljava/lang/String;ILjava/lang/Class;)Lcom/google/android/gms/internal/ji$a;

    move-result-object v1

    const-string v9, "organizations"

    invoke-virtual {v0, v9, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const/16 v1, 0x17

    const-class v9, Lcom/google/android/gms/internal/nz$g;

    const-string v12, "placesLived"

    invoke-static {v12, v1, v9}, Lcom/google/android/gms/internal/ji$a;->b(Ljava/lang/String;ILjava/lang/Class;)Lcom/google/android/gms/internal/ji$a;

    move-result-object v1

    const-string v9, "placesLived"

    invoke-virtual {v0, v9, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string v1, "plusOneCount"

    const/16 v9, 0x18

    invoke-static {v1, v9}, Lcom/google/android/gms/internal/ji$a;->i(Ljava/lang/String;I)Lcom/google/android/gms/internal/ji$a;

    move-result-object v1

    const-string v9, "plusOneCount"

    invoke-virtual {v0, v9, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    new-instance v1, Lcom/google/android/gms/internal/jf;

    invoke-direct {v1}, Lcom/google/android/gms/internal/jf;-><init>()V

    const-string v9, "single"

    invoke-virtual {v1, v9, v10}, Lcom/google/android/gms/internal/jf;->h(Ljava/lang/String;I)Lcom/google/android/gms/internal/jf;

    move-result-object v1

    const-string v9, "in_a_relationship"

    invoke-virtual {v1, v9, v11}, Lcom/google/android/gms/internal/jf;->h(Ljava/lang/String;I)Lcom/google/android/gms/internal/jf;

    move-result-object v1

    const-string v9, "engaged"

    invoke-virtual {v1, v9, v2}, Lcom/google/android/gms/internal/jf;->h(Ljava/lang/String;I)Lcom/google/android/gms/internal/jf;

    move-result-object v1

    const-string v2, "married"

    invoke-virtual {v1, v2, v4}, Lcom/google/android/gms/internal/jf;->h(Ljava/lang/String;I)Lcom/google/android/gms/internal/jf;

    move-result-object v1

    const-string v2, "its_complicated"

    invoke-virtual {v1, v2, v3}, Lcom/google/android/gms/internal/jf;->h(Ljava/lang/String;I)Lcom/google/android/gms/internal/jf;

    move-result-object v1

    const-string v2, "open_relationship"

    invoke-virtual {v1, v2, v5}, Lcom/google/android/gms/internal/jf;->h(Ljava/lang/String;I)Lcom/google/android/gms/internal/jf;

    move-result-object v1

    const-string v2, "widowed"

    invoke-virtual {v1, v2, v6}, Lcom/google/android/gms/internal/jf;->h(Ljava/lang/String;I)Lcom/google/android/gms/internal/jf;

    move-result-object v1

    const-string v2, "in_domestic_partnership"

    invoke-virtual {v1, v2, v8}, Lcom/google/android/gms/internal/jf;->h(Ljava/lang/String;I)Lcom/google/android/gms/internal/jf;

    move-result-object v1

    const-string v2, "in_civil_union"

    invoke-virtual {v1, v2, v7}, Lcom/google/android/gms/internal/jf;->h(Ljava/lang/String;I)Lcom/google/android/gms/internal/jf;

    move-result-object v1

    const-string v2, "relationshipStatus"

    const/16 v3, 0x19

    invoke-static {v2, v3, v1, v10}, Lcom/google/android/gms/internal/ji$a;->a(Ljava/lang/String;ILcom/google/android/gms/internal/ji$b;Z)Lcom/google/android/gms/internal/ji$a;

    move-result-object v1

    const-string v2, "relationshipStatus"

    invoke-virtual {v0, v2, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string v1, "tagline"

    const/16 v2, 0x1a

    invoke-static {v1, v2}, Lcom/google/android/gms/internal/ji$a;->l(Ljava/lang/String;I)Lcom/google/android/gms/internal/ji$a;

    move-result-object v1

    const-string v2, "tagline"

    invoke-virtual {v0, v2, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string v1, "url"

    const/16 v2, 0x1b

    invoke-static {v1, v2}, Lcom/google/android/gms/internal/ji$a;->l(Ljava/lang/String;I)Lcom/google/android/gms/internal/ji$a;

    move-result-object v1

    const-string v2, "url"

    invoke-virtual {v0, v2, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const/16 v1, 0x1c

    const-class v2, Lcom/google/android/gms/internal/nz$h;

    const-string v3, "urls"

    invoke-static {v3, v1, v2}, Lcom/google/android/gms/internal/ji$a;->b(Ljava/lang/String;ILjava/lang/Class;)Lcom/google/android/gms/internal/ji$a;

    move-result-object v1

    const-string v2, "urls"

    invoke-virtual {v0, v2, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string v1, "verified"

    const/16 v2, 0x1d

    invoke-static {v1, v2}, Lcom/google/android/gms/internal/ji$a;->k(Ljava/lang/String;I)Lcom/google/android/gms/internal/ji$a;

    move-result-object v1

    const-string v2, "verified"

    invoke-virtual {v0, v2, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    return-void
.end method

.method public constructor <init>()V
    .locals 1

    invoke-direct {p0}, Lcom/google/android/gms/internal/jj;-><init>()V

    const/4 v0, 0x1

    iput v0, p0, Lcom/google/android/gms/internal/nz;->BR:I

    new-instance v0, Ljava/util/HashSet;

    invoke-direct {v0}, Ljava/util/HashSet;-><init>()V

    iput-object v0, p0, Lcom/google/android/gms/internal/nz;->amc:Ljava/util/Set;

    return-void
.end method

.method public constructor <init>(Ljava/lang/String;Ljava/lang/String;Lcom/google/android/gms/internal/nz$c;ILjava/lang/String;)V
    .locals 1

    invoke-direct {p0}, Lcom/google/android/gms/internal/jj;-><init>()V

    const/4 v0, 0x1

    iput v0, p0, Lcom/google/android/gms/internal/nz;->BR:I

    new-instance v0, Ljava/util/HashSet;

    invoke-direct {v0}, Ljava/util/HashSet;-><init>()V

    iput-object v0, p0, Lcom/google/android/gms/internal/nz;->amc:Ljava/util/Set;

    iput-object p1, p0, Lcom/google/android/gms/internal/nz;->NH:Ljava/lang/String;

    const/16 p1, 0x9

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p1

    invoke-interface {v0, p1}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    iput-object p2, p0, Lcom/google/android/gms/internal/nz;->BL:Ljava/lang/String;

    const/16 p1, 0xe

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p1

    invoke-interface {v0, p1}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    iput-object p3, p0, Lcom/google/android/gms/internal/nz;->anh:Lcom/google/android/gms/internal/nz$c;

    const/16 p1, 0xf

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p1

    invoke-interface {v0, p1}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    iput p4, p0, Lcom/google/android/gms/internal/nz;->anl:I

    const/16 p1, 0x15

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p1

    invoke-interface {v0, p1}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    iput-object p5, p0, Lcom/google/android/gms/internal/nz;->uR:Ljava/lang/String;

    const/16 p0, 0x1b

    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p0

    invoke-interface {v0, p0}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    return-void
.end method

.method constructor <init>(Ljava/util/Set;ILjava/lang/String;Lcom/google/android/gms/internal/nz$a;Ljava/lang/String;Ljava/lang/String;ILcom/google/android/gms/internal/nz$b;Ljava/lang/String;Ljava/lang/String;ILjava/lang/String;Lcom/google/android/gms/internal/nz$c;ZLjava/lang/String;Lcom/google/android/gms/internal/nz$d;Ljava/lang/String;ILjava/util/List;Ljava/util/List;IILjava/lang/String;Ljava/lang/String;Ljava/util/List;Z)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Set<",
            "Ljava/lang/Integer;",
            ">;I",
            "Ljava/lang/String;",
            "Lcom/google/android/gms/internal/nz$a;",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "I",
            "Lcom/google/android/gms/internal/nz$b;",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "I",
            "Ljava/lang/String;",
            "Lcom/google/android/gms/internal/nz$c;",
            "Z",
            "Ljava/lang/String;",
            "Lcom/google/android/gms/internal/nz$d;",
            "Ljava/lang/String;",
            "I",
            "Ljava/util/List<",
            "Lcom/google/android/gms/internal/nz$f;",
            ">;",
            "Ljava/util/List<",
            "Lcom/google/android/gms/internal/nz$g;",
            ">;II",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Ljava/util/List<",
            "Lcom/google/android/gms/internal/nz$h;",
            ">;Z)V"
        }
    .end annotation

    move-object v0, p0

    invoke-direct {p0}, Lcom/google/android/gms/internal/jj;-><init>()V

    move-object v1, p1

    iput-object v1, v0, Lcom/google/android/gms/internal/nz;->amc:Ljava/util/Set;

    move v1, p2

    iput v1, v0, Lcom/google/android/gms/internal/nz;->BR:I

    move-object v1, p3

    iput-object v1, v0, Lcom/google/android/gms/internal/nz;->ana:Ljava/lang/String;

    move-object v1, p4

    iput-object v1, v0, Lcom/google/android/gms/internal/nz;->anb:Lcom/google/android/gms/internal/nz$a;

    move-object v1, p5

    iput-object v1, v0, Lcom/google/android/gms/internal/nz;->anc:Ljava/lang/String;

    move-object v1, p6

    iput-object v1, v0, Lcom/google/android/gms/internal/nz;->and:Ljava/lang/String;

    move v1, p7

    iput v1, v0, Lcom/google/android/gms/internal/nz;->ane:I

    move-object v1, p8

    iput-object v1, v0, Lcom/google/android/gms/internal/nz;->anf:Lcom/google/android/gms/internal/nz$b;

    move-object v1, p9

    iput-object v1, v0, Lcom/google/android/gms/internal/nz;->ang:Ljava/lang/String;

    move-object v1, p10

    iput-object v1, v0, Lcom/google/android/gms/internal/nz;->NH:Ljava/lang/String;

    move v1, p11

    iput v1, v0, Lcom/google/android/gms/internal/nz;->om:I

    move-object v1, p12

    iput-object v1, v0, Lcom/google/android/gms/internal/nz;->BL:Ljava/lang/String;

    move-object v1, p13

    iput-object v1, v0, Lcom/google/android/gms/internal/nz;->anh:Lcom/google/android/gms/internal/nz$c;

    move/from16 v1, p14

    iput-boolean v1, v0, Lcom/google/android/gms/internal/nz;->ani:Z

    move-object/from16 v1, p15

    iput-object v1, v0, Lcom/google/android/gms/internal/nz;->Fc:Ljava/lang/String;

    move-object/from16 v1, p16

    iput-object v1, v0, Lcom/google/android/gms/internal/nz;->anj:Lcom/google/android/gms/internal/nz$d;

    move-object/from16 v1, p17

    iput-object v1, v0, Lcom/google/android/gms/internal/nz;->ank:Ljava/lang/String;

    move/from16 v1, p18

    iput v1, v0, Lcom/google/android/gms/internal/nz;->anl:I

    move-object/from16 v1, p19

    iput-object v1, v0, Lcom/google/android/gms/internal/nz;->anm:Ljava/util/List;

    move-object/from16 v1, p20

    iput-object v1, v0, Lcom/google/android/gms/internal/nz;->ann:Ljava/util/List;

    move/from16 v1, p21

    iput v1, v0, Lcom/google/android/gms/internal/nz;->ano:I

    move/from16 v1, p22

    iput v1, v0, Lcom/google/android/gms/internal/nz;->anp:I

    move-object/from16 v1, p23

    iput-object v1, v0, Lcom/google/android/gms/internal/nz;->anq:Ljava/lang/String;

    move-object/from16 v1, p24

    iput-object v1, v0, Lcom/google/android/gms/internal/nz;->uR:Ljava/lang/String;

    move-object/from16 v1, p25

    iput-object v1, v0, Lcom/google/android/gms/internal/nz;->anr:Ljava/util/List;

    move/from16 v1, p26

    iput-boolean v1, v0, Lcom/google/android/gms/internal/nz;->ans:Z

    return-void
.end method

.method public static i([B)Lcom/google/android/gms/internal/nz;
    .locals 3

    invoke-static {}, Landroid/os/Parcel;->obtain()Landroid/os/Parcel;

    move-result-object v0

    array-length v1, p0

    const/4 v2, 0x0

    invoke-virtual {v0, p0, v2, v1}, Landroid/os/Parcel;->unmarshall([BII)V

    invoke-virtual {v0, v2}, Landroid/os/Parcel;->setDataPosition(I)V

    sget-object p0, Lcom/google/android/gms/internal/nz;->CREATOR:Lcom/google/android/gms/internal/oa;

    invoke-virtual {p0, v0}, Lcom/google/android/gms/internal/oa;->dd(Landroid/os/Parcel;)Lcom/google/android/gms/internal/nz;

    move-result-object p0

    invoke-virtual {v0}, Landroid/os/Parcel;->recycle()V

    return-object p0
.end method


# virtual methods
.method protected a(Lcom/google/android/gms/internal/ji$a;)Z
    .locals 0

    iget-object p0, p0, Lcom/google/android/gms/internal/nz;->amc:Ljava/util/Set;

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

    :pswitch_0
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

    :pswitch_1
    iget-boolean p0, p0, Lcom/google/android/gms/internal/nz;->ans:Z

    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object p0

    return-object p0

    :pswitch_2
    iget-object p0, p0, Lcom/google/android/gms/internal/nz;->anr:Ljava/util/List;

    return-object p0

    :pswitch_3
    iget-object p0, p0, Lcom/google/android/gms/internal/nz;->uR:Ljava/lang/String;

    return-object p0

    :pswitch_4
    iget-object p0, p0, Lcom/google/android/gms/internal/nz;->anq:Ljava/lang/String;

    return-object p0

    :pswitch_5
    iget p0, p0, Lcom/google/android/gms/internal/nz;->anp:I

    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p0

    return-object p0

    :pswitch_6
    iget p0, p0, Lcom/google/android/gms/internal/nz;->ano:I

    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p0

    return-object p0

    :pswitch_7
    iget-object p0, p0, Lcom/google/android/gms/internal/nz;->ann:Ljava/util/List;

    return-object p0

    :pswitch_8
    iget-object p0, p0, Lcom/google/android/gms/internal/nz;->anm:Ljava/util/List;

    return-object p0

    :pswitch_9
    iget p0, p0, Lcom/google/android/gms/internal/nz;->anl:I

    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p0

    return-object p0

    :pswitch_a
    iget-object p0, p0, Lcom/google/android/gms/internal/nz;->ank:Ljava/lang/String;

    return-object p0

    :pswitch_b
    iget-object p0, p0, Lcom/google/android/gms/internal/nz;->anj:Lcom/google/android/gms/internal/nz$d;

    return-object p0

    :pswitch_c
    iget-object p0, p0, Lcom/google/android/gms/internal/nz;->Fc:Ljava/lang/String;

    return-object p0

    :pswitch_d
    iget-boolean p0, p0, Lcom/google/android/gms/internal/nz;->ani:Z

    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object p0

    return-object p0

    :pswitch_e
    iget-object p0, p0, Lcom/google/android/gms/internal/nz;->anh:Lcom/google/android/gms/internal/nz$c;

    return-object p0

    :pswitch_f
    iget-object p0, p0, Lcom/google/android/gms/internal/nz;->BL:Ljava/lang/String;

    return-object p0

    :pswitch_10
    iget p0, p0, Lcom/google/android/gms/internal/nz;->om:I

    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p0

    return-object p0

    :pswitch_11
    iget-object p0, p0, Lcom/google/android/gms/internal/nz;->NH:Ljava/lang/String;

    return-object p0

    :pswitch_12
    iget-object p0, p0, Lcom/google/android/gms/internal/nz;->ang:Ljava/lang/String;

    return-object p0

    :pswitch_13
    iget-object p0, p0, Lcom/google/android/gms/internal/nz;->anf:Lcom/google/android/gms/internal/nz$b;

    return-object p0

    :pswitch_14
    iget p0, p0, Lcom/google/android/gms/internal/nz;->ane:I

    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p0

    return-object p0

    :pswitch_15
    iget-object p0, p0, Lcom/google/android/gms/internal/nz;->and:Ljava/lang/String;

    return-object p0

    :pswitch_16
    iget-object p0, p0, Lcom/google/android/gms/internal/nz;->anc:Ljava/lang/String;

    return-object p0

    :pswitch_17
    iget-object p0, p0, Lcom/google/android/gms/internal/nz;->anb:Lcom/google/android/gms/internal/nz$a;

    return-object p0

    :pswitch_18
    iget-object p0, p0, Lcom/google/android/gms/internal/nz;->ana:Ljava/lang/String;

    return-object p0

    :pswitch_data_0
    .packed-switch 0x2
        :pswitch_18
        :pswitch_17
        :pswitch_16
        :pswitch_15
        :pswitch_14
        :pswitch_13
        :pswitch_12
        :pswitch_11
        :pswitch_0
        :pswitch_0
        :pswitch_10
        :pswitch_0
        :pswitch_f
        :pswitch_e
        :pswitch_d
        :pswitch_0
        :pswitch_c
        :pswitch_b
        :pswitch_a
        :pswitch_9
        :pswitch_8
        :pswitch_7
        :pswitch_6
        :pswitch_5
        :pswitch_4
        :pswitch_3
        :pswitch_2
        :pswitch_1
    .end packed-switch
.end method

.method public describeContents()I
    .locals 0

    const/4 p0, 0x0

    return p0
.end method

.method public equals(Ljava/lang/Object;)Z
    .locals 5

    instance-of v0, p1, Lcom/google/android/gms/internal/nz;

    const/4 v1, 0x0

    if-nez v0, :cond_0

    return v1

    :cond_0
    const/4 v0, 0x1

    if-ne p0, p1, :cond_1

    return v0

    :cond_1
    check-cast p1, Lcom/google/android/gms/internal/nz;

    sget-object v2, Lcom/google/android/gms/internal/nz;->amb:Ljava/util/HashMap;

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

    invoke-virtual {p0, v3}, Lcom/google/android/gms/internal/nz;->a(Lcom/google/android/gms/internal/ji$a;)Z

    move-result v4

    if-eqz v4, :cond_4

    invoke-virtual {p1, v3}, Lcom/google/android/gms/internal/nz;->a(Lcom/google/android/gms/internal/ji$a;)Z

    move-result v4

    if-eqz v4, :cond_3

    invoke-virtual {p0, v3}, Lcom/google/android/gms/internal/nz;->b(Lcom/google/android/gms/internal/ji$a;)Ljava/lang/Object;

    move-result-object v4

    invoke-virtual {p1, v3}, Lcom/google/android/gms/internal/nz;->b(Lcom/google/android/gms/internal/ji$a;)Ljava/lang/Object;

    move-result-object v3

    invoke-virtual {v4, v3}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_2

    :cond_3
    return v1

    :cond_4
    invoke-virtual {p1, v3}, Lcom/google/android/gms/internal/nz;->a(Lcom/google/android/gms/internal/ji$a;)Z

    move-result v3

    if-eqz v3, :cond_2

    return v1

    :cond_5
    return v0
.end method

.method public synthetic freeze()Ljava/lang/Object;
    .locals 0

    invoke-virtual {p0}, Lcom/google/android/gms/internal/nz;->nu()Lcom/google/android/gms/internal/nz;

    move-result-object p0

    return-object p0
.end method

.method public getAboutMe()Ljava/lang/String;
    .locals 0

    iget-object p0, p0, Lcom/google/android/gms/internal/nz;->ana:Ljava/lang/String;

    return-object p0
.end method

.method public getAgeRange()Lcom/google/android/gms/plus/model/people/Person$AgeRange;
    .locals 0

    iget-object p0, p0, Lcom/google/android/gms/internal/nz;->anb:Lcom/google/android/gms/internal/nz$a;

    return-object p0
.end method

.method public getBirthday()Ljava/lang/String;
    .locals 0

    iget-object p0, p0, Lcom/google/android/gms/internal/nz;->anc:Ljava/lang/String;

    return-object p0
.end method

.method public getBraggingRights()Ljava/lang/String;
    .locals 0

    iget-object p0, p0, Lcom/google/android/gms/internal/nz;->and:Ljava/lang/String;

    return-object p0
.end method

.method public getCircledByCount()I
    .locals 0

    iget p0, p0, Lcom/google/android/gms/internal/nz;->ane:I

    return p0
.end method

.method public getCover()Lcom/google/android/gms/plus/model/people/Person$Cover;
    .locals 0

    iget-object p0, p0, Lcom/google/android/gms/internal/nz;->anf:Lcom/google/android/gms/internal/nz$b;

    return-object p0
.end method

.method public getCurrentLocation()Ljava/lang/String;
    .locals 0

    iget-object p0, p0, Lcom/google/android/gms/internal/nz;->ang:Ljava/lang/String;

    return-object p0
.end method

.method public getDisplayName()Ljava/lang/String;
    .locals 0

    iget-object p0, p0, Lcom/google/android/gms/internal/nz;->NH:Ljava/lang/String;

    return-object p0
.end method

.method public getGender()I
    .locals 0

    iget p0, p0, Lcom/google/android/gms/internal/nz;->om:I

    return p0
.end method

.method public getId()Ljava/lang/String;
    .locals 0

    iget-object p0, p0, Lcom/google/android/gms/internal/nz;->BL:Ljava/lang/String;

    return-object p0
.end method

.method public getImage()Lcom/google/android/gms/plus/model/people/Person$Image;
    .locals 0

    iget-object p0, p0, Lcom/google/android/gms/internal/nz;->anh:Lcom/google/android/gms/internal/nz$c;

    return-object p0
.end method

.method public getLanguage()Ljava/lang/String;
    .locals 0

    iget-object p0, p0, Lcom/google/android/gms/internal/nz;->Fc:Ljava/lang/String;

    return-object p0
.end method

.method public getName()Lcom/google/android/gms/plus/model/people/Person$Name;
    .locals 0

    iget-object p0, p0, Lcom/google/android/gms/internal/nz;->anj:Lcom/google/android/gms/internal/nz$d;

    return-object p0
.end method

.method public getNickname()Ljava/lang/String;
    .locals 0

    iget-object p0, p0, Lcom/google/android/gms/internal/nz;->ank:Ljava/lang/String;

    return-object p0
.end method

.method public getObjectType()I
    .locals 0

    iget p0, p0, Lcom/google/android/gms/internal/nz;->anl:I

    return p0
.end method

.method public getOrganizations()Ljava/util/List;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Lcom/google/android/gms/plus/model/people/Person$Organizations;",
            ">;"
        }
    .end annotation

    iget-object p0, p0, Lcom/google/android/gms/internal/nz;->anm:Ljava/util/List;

    check-cast p0, Ljava/util/ArrayList;

    return-object p0
.end method

.method public getPlacesLived()Ljava/util/List;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Lcom/google/android/gms/plus/model/people/Person$PlacesLived;",
            ">;"
        }
    .end annotation

    iget-object p0, p0, Lcom/google/android/gms/internal/nz;->ann:Ljava/util/List;

    check-cast p0, Ljava/util/ArrayList;

    return-object p0
.end method

.method public getPlusOneCount()I
    .locals 0

    iget p0, p0, Lcom/google/android/gms/internal/nz;->ano:I

    return p0
.end method

.method public getRelationshipStatus()I
    .locals 0

    iget p0, p0, Lcom/google/android/gms/internal/nz;->anp:I

    return p0
.end method

.method public getTagline()Ljava/lang/String;
    .locals 0

    iget-object p0, p0, Lcom/google/android/gms/internal/nz;->anq:Ljava/lang/String;

    return-object p0
.end method

.method public getUrl()Ljava/lang/String;
    .locals 0

    iget-object p0, p0, Lcom/google/android/gms/internal/nz;->uR:Ljava/lang/String;

    return-object p0
.end method

.method public getUrls()Ljava/util/List;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Lcom/google/android/gms/plus/model/people/Person$Urls;",
            ">;"
        }
    .end annotation

    iget-object p0, p0, Lcom/google/android/gms/internal/nz;->anr:Ljava/util/List;

    check-cast p0, Ljava/util/ArrayList;

    return-object p0
.end method

.method public hasAboutMe()Z
    .locals 1

    iget-object p0, p0, Lcom/google/android/gms/internal/nz;->amc:Ljava/util/Set;

    const/4 v0, 0x2

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    invoke-interface {p0, v0}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result p0

    return p0
.end method

.method public hasAgeRange()Z
    .locals 1

    iget-object p0, p0, Lcom/google/android/gms/internal/nz;->amc:Ljava/util/Set;

    const/4 v0, 0x3

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    invoke-interface {p0, v0}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result p0

    return p0
.end method

.method public hasBirthday()Z
    .locals 1

    iget-object p0, p0, Lcom/google/android/gms/internal/nz;->amc:Ljava/util/Set;

    const/4 v0, 0x4

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    invoke-interface {p0, v0}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result p0

    return p0
.end method

.method public hasBraggingRights()Z
    .locals 1

    iget-object p0, p0, Lcom/google/android/gms/internal/nz;->amc:Ljava/util/Set;

    const/4 v0, 0x5

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    invoke-interface {p0, v0}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result p0

    return p0
.end method

.method public hasCircledByCount()Z
    .locals 1

    iget-object p0, p0, Lcom/google/android/gms/internal/nz;->amc:Ljava/util/Set;

    const/4 v0, 0x6

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    invoke-interface {p0, v0}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result p0

    return p0
.end method

.method public hasCover()Z
    .locals 1

    iget-object p0, p0, Lcom/google/android/gms/internal/nz;->amc:Ljava/util/Set;

    const/4 v0, 0x7

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    invoke-interface {p0, v0}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result p0

    return p0
.end method

.method public hasCurrentLocation()Z
    .locals 1

    iget-object p0, p0, Lcom/google/android/gms/internal/nz;->amc:Ljava/util/Set;

    const/16 v0, 0x8

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    invoke-interface {p0, v0}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result p0

    return p0
.end method

.method public hasDisplayName()Z
    .locals 1

    iget-object p0, p0, Lcom/google/android/gms/internal/nz;->amc:Ljava/util/Set;

    const/16 v0, 0x9

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    invoke-interface {p0, v0}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result p0

    return p0
.end method

.method public hasGender()Z
    .locals 1

    iget-object p0, p0, Lcom/google/android/gms/internal/nz;->amc:Ljava/util/Set;

    const/16 v0, 0xc

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    invoke-interface {p0, v0}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result p0

    return p0
.end method

.method public hasId()Z
    .locals 1

    iget-object p0, p0, Lcom/google/android/gms/internal/nz;->amc:Ljava/util/Set;

    const/16 v0, 0xe

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    invoke-interface {p0, v0}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result p0

    return p0
.end method

.method public hasImage()Z
    .locals 1

    iget-object p0, p0, Lcom/google/android/gms/internal/nz;->amc:Ljava/util/Set;

    const/16 v0, 0xf

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    invoke-interface {p0, v0}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result p0

    return p0
.end method

.method public hasIsPlusUser()Z
    .locals 1

    iget-object p0, p0, Lcom/google/android/gms/internal/nz;->amc:Ljava/util/Set;

    const/16 v0, 0x10

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    invoke-interface {p0, v0}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result p0

    return p0
.end method

.method public hasLanguage()Z
    .locals 1

    iget-object p0, p0, Lcom/google/android/gms/internal/nz;->amc:Ljava/util/Set;

    const/16 v0, 0x12

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    invoke-interface {p0, v0}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result p0

    return p0
.end method

.method public hasName()Z
    .locals 1

    iget-object p0, p0, Lcom/google/android/gms/internal/nz;->amc:Ljava/util/Set;

    const/16 v0, 0x13

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    invoke-interface {p0, v0}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result p0

    return p0
.end method

.method public hasNickname()Z
    .locals 1

    iget-object p0, p0, Lcom/google/android/gms/internal/nz;->amc:Ljava/util/Set;

    const/16 v0, 0x14

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    invoke-interface {p0, v0}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result p0

    return p0
.end method

.method public hasObjectType()Z
    .locals 1

    iget-object p0, p0, Lcom/google/android/gms/internal/nz;->amc:Ljava/util/Set;

    const/16 v0, 0x15

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    invoke-interface {p0, v0}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result p0

    return p0
.end method

.method public hasOrganizations()Z
    .locals 1

    iget-object p0, p0, Lcom/google/android/gms/internal/nz;->amc:Ljava/util/Set;

    const/16 v0, 0x16

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    invoke-interface {p0, v0}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result p0

    return p0
.end method

.method public hasPlacesLived()Z
    .locals 1

    iget-object p0, p0, Lcom/google/android/gms/internal/nz;->amc:Ljava/util/Set;

    const/16 v0, 0x17

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    invoke-interface {p0, v0}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result p0

    return p0
.end method

.method public hasPlusOneCount()Z
    .locals 1

    iget-object p0, p0, Lcom/google/android/gms/internal/nz;->amc:Ljava/util/Set;

    const/16 v0, 0x18

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    invoke-interface {p0, v0}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result p0

    return p0
.end method

.method public hasRelationshipStatus()Z
    .locals 1

    iget-object p0, p0, Lcom/google/android/gms/internal/nz;->amc:Ljava/util/Set;

    const/16 v0, 0x19

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    invoke-interface {p0, v0}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result p0

    return p0
.end method

.method public hasTagline()Z
    .locals 1

    iget-object p0, p0, Lcom/google/android/gms/internal/nz;->amc:Ljava/util/Set;

    const/16 v0, 0x1a

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    invoke-interface {p0, v0}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result p0

    return p0
.end method

.method public hasUrl()Z
    .locals 1

    iget-object p0, p0, Lcom/google/android/gms/internal/nz;->amc:Ljava/util/Set;

    const/16 v0, 0x1b

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    invoke-interface {p0, v0}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result p0

    return p0
.end method

.method public hasUrls()Z
    .locals 1

    iget-object p0, p0, Lcom/google/android/gms/internal/nz;->amc:Ljava/util/Set;

    const/16 v0, 0x1c

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    invoke-interface {p0, v0}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result p0

    return p0
.end method

.method public hasVerified()Z
    .locals 1

    iget-object p0, p0, Lcom/google/android/gms/internal/nz;->amc:Ljava/util/Set;

    const/16 v0, 0x1d

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    invoke-interface {p0, v0}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result p0

    return p0
.end method

.method public hashCode()I
    .locals 4

    sget-object v0, Lcom/google/android/gms/internal/nz;->amb:Ljava/util/HashMap;

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

    invoke-virtual {p0, v2}, Lcom/google/android/gms/internal/nz;->a(Lcom/google/android/gms/internal/ji$a;)Z

    move-result v3

    if-eqz v3, :cond_0

    invoke-virtual {v2}, Lcom/google/android/gms/internal/ji$a;->hm()I

    move-result v3

    add-int/2addr v1, v3

    invoke-virtual {p0, v2}, Lcom/google/android/gms/internal/nz;->b(Lcom/google/android/gms/internal/ji$a;)Ljava/lang/Object;

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

    sget-object p0, Lcom/google/android/gms/internal/nz;->amb:Ljava/util/HashMap;

    return-object p0
.end method

.method public isDataValid()Z
    .locals 0

    const/4 p0, 0x1

    return p0
.end method

.method public isPlusUser()Z
    .locals 0

    iget-boolean p0, p0, Lcom/google/android/gms/internal/nz;->ani:Z

    return p0
.end method

.method public isVerified()Z
    .locals 0

    iget-boolean p0, p0, Lcom/google/android/gms/internal/nz;->ans:Z

    return p0
.end method

.method public nu()Lcom/google/android/gms/internal/nz;
    .locals 0

    return-object p0
.end method

.method public writeToParcel(Landroid/os/Parcel;I)V
    .locals 0

    invoke-static {p0, p1, p2}, Lcom/google/android/gms/internal/oa;->a(Lcom/google/android/gms/internal/nz;Landroid/os/Parcel;I)V

    return-void
.end method
