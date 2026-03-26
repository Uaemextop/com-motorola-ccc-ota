.class public final Lcom/google/android/gms/common/api/Api;
.super Ljava/lang/Object;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/google/android/gms/common/api/Api$a;,
        Lcom/google/android/gms/common/api/Api$c;,
        Lcom/google/android/gms/common/api/Api$ApiOptions;,
        Lcom/google/android/gms/common/api/Api$b;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<O::",
        "Lcom/google/android/gms/common/api/Api$ApiOptions;",
        ">",
        "Ljava/lang/Object;"
    }
.end annotation


# instance fields
.field private final Io:Lcom/google/android/gms/common/api/Api$b;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/google/android/gms/common/api/Api$b<",
            "*TO;>;"
        }
    .end annotation
.end field

.field private final Ip:Lcom/google/android/gms/common/api/Api$c;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/google/android/gms/common/api/Api$c<",
            "*>;"
        }
    .end annotation
.end field

.field private final Iq:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Lcom/google/android/gms/common/api/Scope;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public varargs constructor <init>(Lcom/google/android/gms/common/api/Api$b;Lcom/google/android/gms/common/api/Api$c;[Lcom/google/android/gms/common/api/Scope;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<C::",
            "Lcom/google/android/gms/common/api/Api$a;",
            ">(",
            "Lcom/google/android/gms/common/api/Api$b<",
            "TC;TO;>;",
            "Lcom/google/android/gms/common/api/Api$c<",
            "TC;>;[",
            "Lcom/google/android/gms/common/api/Scope;",
            ")V"
        }
    .end annotation

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/google/android/gms/common/api/Api;->Io:Lcom/google/android/gms/common/api/Api$b;

    iput-object p2, p0, Lcom/google/android/gms/common/api/Api;->Ip:Lcom/google/android/gms/common/api/Api$c;

    new-instance p1, Ljava/util/ArrayList;

    invoke-static {p3}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object p2

    invoke-direct {p1, p2}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    iput-object p1, p0, Lcom/google/android/gms/common/api/Api;->Iq:Ljava/util/ArrayList;

    return-void
.end method


# virtual methods
.method public gb()Lcom/google/android/gms/common/api/Api$b;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lcom/google/android/gms/common/api/Api$b<",
            "*TO;>;"
        }
    .end annotation

    iget-object p0, p0, Lcom/google/android/gms/common/api/Api;->Io:Lcom/google/android/gms/common/api/Api$b;

    return-object p0
.end method

.method public gd()Ljava/util/List;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Lcom/google/android/gms/common/api/Scope;",
            ">;"
        }
    .end annotation

    iget-object p0, p0, Lcom/google/android/gms/common/api/Api;->Iq:Ljava/util/ArrayList;

    return-object p0
.end method

.method public ge()Lcom/google/android/gms/common/api/Api$c;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lcom/google/android/gms/common/api/Api$c<",
            "*>;"
        }
    .end annotation

    iget-object p0, p0, Lcom/google/android/gms/common/api/Api;->Ip:Lcom/google/android/gms/common/api/Api$c;

    return-object p0
.end method
