.class public Lcom/google/android/gms/drive/query/internal/FilterHolder;
.super Ljava/lang/Object;

# interfaces
.implements Lcom/google/android/gms/common/internal/safeparcel/SafeParcelable;


# static fields
.field public static final CREATOR:Landroid/os/Parcelable$Creator;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/os/Parcelable$Creator<",
            "Lcom/google/android/gms/drive/query/internal/FilterHolder;",
            ">;"
        }
    .end annotation
.end field


# instance fields
.field final BR:I

.field final QO:Lcom/google/android/gms/drive/query/internal/ComparisonFilter;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/google/android/gms/drive/query/internal/ComparisonFilter<",
            "*>;"
        }
    .end annotation
.end field

.field final QP:Lcom/google/android/gms/drive/query/internal/FieldOnlyFilter;

.field final QQ:Lcom/google/android/gms/drive/query/internal/LogicalFilter;

.field final QR:Lcom/google/android/gms/drive/query/internal/NotFilter;

.field final QS:Lcom/google/android/gms/drive/query/internal/InFilter;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/google/android/gms/drive/query/internal/InFilter<",
            "*>;"
        }
    .end annotation
.end field

.field final QT:Lcom/google/android/gms/drive/query/internal/MatchAllFilter;

.field final QU:Lcom/google/android/gms/drive/query/internal/HasFilter;

.field private final QV:Lcom/google/android/gms/drive/query/Filter;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    new-instance v0, Lcom/google/android/gms/drive/query/internal/d;

    invoke-direct {v0}, Lcom/google/android/gms/drive/query/internal/d;-><init>()V

    sput-object v0, Lcom/google/android/gms/drive/query/internal/FilterHolder;->CREATOR:Landroid/os/Parcelable$Creator;

    return-void
.end method

.method constructor <init>(ILcom/google/android/gms/drive/query/internal/ComparisonFilter;Lcom/google/android/gms/drive/query/internal/FieldOnlyFilter;Lcom/google/android/gms/drive/query/internal/LogicalFilter;Lcom/google/android/gms/drive/query/internal/NotFilter;Lcom/google/android/gms/drive/query/internal/InFilter;Lcom/google/android/gms/drive/query/internal/MatchAllFilter;Lcom/google/android/gms/drive/query/internal/HasFilter;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I",
            "Lcom/google/android/gms/drive/query/internal/ComparisonFilter<",
            "*>;",
            "Lcom/google/android/gms/drive/query/internal/FieldOnlyFilter;",
            "Lcom/google/android/gms/drive/query/internal/LogicalFilter;",
            "Lcom/google/android/gms/drive/query/internal/NotFilter;",
            "Lcom/google/android/gms/drive/query/internal/InFilter<",
            "*>;",
            "Lcom/google/android/gms/drive/query/internal/MatchAllFilter;",
            "Lcom/google/android/gms/drive/query/internal/HasFilter<",
            "*>;)V"
        }
    .end annotation

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput p1, p0, Lcom/google/android/gms/drive/query/internal/FilterHolder;->BR:I

    iput-object p2, p0, Lcom/google/android/gms/drive/query/internal/FilterHolder;->QO:Lcom/google/android/gms/drive/query/internal/ComparisonFilter;

    iput-object p3, p0, Lcom/google/android/gms/drive/query/internal/FilterHolder;->QP:Lcom/google/android/gms/drive/query/internal/FieldOnlyFilter;

    iput-object p4, p0, Lcom/google/android/gms/drive/query/internal/FilterHolder;->QQ:Lcom/google/android/gms/drive/query/internal/LogicalFilter;

    iput-object p5, p0, Lcom/google/android/gms/drive/query/internal/FilterHolder;->QR:Lcom/google/android/gms/drive/query/internal/NotFilter;

    iput-object p6, p0, Lcom/google/android/gms/drive/query/internal/FilterHolder;->QS:Lcom/google/android/gms/drive/query/internal/InFilter;

    iput-object p7, p0, Lcom/google/android/gms/drive/query/internal/FilterHolder;->QT:Lcom/google/android/gms/drive/query/internal/MatchAllFilter;

    iput-object p8, p0, Lcom/google/android/gms/drive/query/internal/FilterHolder;->QU:Lcom/google/android/gms/drive/query/internal/HasFilter;

    if-eqz p2, :cond_0

    iput-object p2, p0, Lcom/google/android/gms/drive/query/internal/FilterHolder;->QV:Lcom/google/android/gms/drive/query/Filter;

    goto :goto_0

    :cond_0
    if-eqz p3, :cond_1

    iput-object p3, p0, Lcom/google/android/gms/drive/query/internal/FilterHolder;->QV:Lcom/google/android/gms/drive/query/Filter;

    goto :goto_0

    :cond_1
    if-eqz p4, :cond_2

    iput-object p4, p0, Lcom/google/android/gms/drive/query/internal/FilterHolder;->QV:Lcom/google/android/gms/drive/query/Filter;

    goto :goto_0

    :cond_2
    if-eqz p5, :cond_3

    iput-object p5, p0, Lcom/google/android/gms/drive/query/internal/FilterHolder;->QV:Lcom/google/android/gms/drive/query/Filter;

    goto :goto_0

    :cond_3
    if-eqz p6, :cond_4

    iput-object p6, p0, Lcom/google/android/gms/drive/query/internal/FilterHolder;->QV:Lcom/google/android/gms/drive/query/Filter;

    goto :goto_0

    :cond_4
    if-eqz p7, :cond_5

    iput-object p7, p0, Lcom/google/android/gms/drive/query/internal/FilterHolder;->QV:Lcom/google/android/gms/drive/query/Filter;

    goto :goto_0

    :cond_5
    if-eqz p8, :cond_6

    iput-object p8, p0, Lcom/google/android/gms/drive/query/internal/FilterHolder;->QV:Lcom/google/android/gms/drive/query/Filter;

    :goto_0
    return-void

    :cond_6
    new-instance p0, Ljava/lang/IllegalArgumentException;

    const-string p1, "At least one filter must be set."

    invoke-direct {p0, p1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p0
.end method

.method public constructor <init>(Lcom/google/android/gms/drive/query/Filter;)V
    .locals 8

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, 0x2

    iput v0, p0, Lcom/google/android/gms/drive/query/internal/FilterHolder;->BR:I

    instance-of v0, p1, Lcom/google/android/gms/drive/query/internal/ComparisonFilter;

    const/4 v1, 0x0

    if-eqz v0, :cond_0

    move-object v0, p1

    check-cast v0, Lcom/google/android/gms/drive/query/internal/ComparisonFilter;

    goto :goto_0

    :cond_0
    move-object v0, v1

    :goto_0
    iput-object v0, p0, Lcom/google/android/gms/drive/query/internal/FilterHolder;->QO:Lcom/google/android/gms/drive/query/internal/ComparisonFilter;

    instance-of v2, p1, Lcom/google/android/gms/drive/query/internal/FieldOnlyFilter;

    if-eqz v2, :cond_1

    move-object v2, p1

    check-cast v2, Lcom/google/android/gms/drive/query/internal/FieldOnlyFilter;

    goto :goto_1

    :cond_1
    move-object v2, v1

    :goto_1
    iput-object v2, p0, Lcom/google/android/gms/drive/query/internal/FilterHolder;->QP:Lcom/google/android/gms/drive/query/internal/FieldOnlyFilter;

    instance-of v3, p1, Lcom/google/android/gms/drive/query/internal/LogicalFilter;

    if-eqz v3, :cond_2

    move-object v3, p1

    check-cast v3, Lcom/google/android/gms/drive/query/internal/LogicalFilter;

    goto :goto_2

    :cond_2
    move-object v3, v1

    :goto_2
    iput-object v3, p0, Lcom/google/android/gms/drive/query/internal/FilterHolder;->QQ:Lcom/google/android/gms/drive/query/internal/LogicalFilter;

    instance-of v4, p1, Lcom/google/android/gms/drive/query/internal/NotFilter;

    if-eqz v4, :cond_3

    move-object v4, p1

    check-cast v4, Lcom/google/android/gms/drive/query/internal/NotFilter;

    goto :goto_3

    :cond_3
    move-object v4, v1

    :goto_3
    iput-object v4, p0, Lcom/google/android/gms/drive/query/internal/FilterHolder;->QR:Lcom/google/android/gms/drive/query/internal/NotFilter;

    instance-of v5, p1, Lcom/google/android/gms/drive/query/internal/InFilter;

    if-eqz v5, :cond_4

    move-object v5, p1

    check-cast v5, Lcom/google/android/gms/drive/query/internal/InFilter;

    goto :goto_4

    :cond_4
    move-object v5, v1

    :goto_4
    iput-object v5, p0, Lcom/google/android/gms/drive/query/internal/FilterHolder;->QS:Lcom/google/android/gms/drive/query/internal/InFilter;

    instance-of v6, p1, Lcom/google/android/gms/drive/query/internal/MatchAllFilter;

    if-eqz v6, :cond_5

    move-object v6, p1

    check-cast v6, Lcom/google/android/gms/drive/query/internal/MatchAllFilter;

    goto :goto_5

    :cond_5
    move-object v6, v1

    :goto_5
    iput-object v6, p0, Lcom/google/android/gms/drive/query/internal/FilterHolder;->QT:Lcom/google/android/gms/drive/query/internal/MatchAllFilter;

    instance-of v7, p1, Lcom/google/android/gms/drive/query/internal/HasFilter;

    if-eqz v7, :cond_6

    move-object v1, p1

    check-cast v1, Lcom/google/android/gms/drive/query/internal/HasFilter;

    :cond_6
    iput-object v1, p0, Lcom/google/android/gms/drive/query/internal/FilterHolder;->QU:Lcom/google/android/gms/drive/query/internal/HasFilter;

    if-nez v0, :cond_8

    if-nez v2, :cond_8

    if-nez v3, :cond_8

    if-nez v4, :cond_8

    if-nez v5, :cond_8

    if-nez v6, :cond_8

    if-eqz v1, :cond_7

    goto :goto_6

    :cond_7
    new-instance p0, Ljava/lang/IllegalArgumentException;

    const-string p1, "Invalid filter type or null filter."

    invoke-direct {p0, p1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p0

    :cond_8
    :goto_6
    iput-object p1, p0, Lcom/google/android/gms/drive/query/internal/FilterHolder;->QV:Lcom/google/android/gms/drive/query/Filter;

    return-void
.end method


# virtual methods
.method public describeContents()I
    .locals 0

    const/4 p0, 0x0

    return p0
.end method

.method public getFilter()Lcom/google/android/gms/drive/query/Filter;
    .locals 0

    iget-object p0, p0, Lcom/google/android/gms/drive/query/internal/FilterHolder;->QV:Lcom/google/android/gms/drive/query/Filter;

    return-object p0
.end method

.method public toString()Ljava/lang/String;
    .locals 1

    iget-object p0, p0, Lcom/google/android/gms/drive/query/internal/FilterHolder;->QV:Lcom/google/android/gms/drive/query/Filter;

    filled-new-array {p0}, [Ljava/lang/Object;

    move-result-object p0

    const-string v0, "FilterHolder[%s]"

    invoke-static {v0, p0}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method public writeToParcel(Landroid/os/Parcel;I)V
    .locals 0

    invoke-static {p0, p1, p2}, Lcom/google/android/gms/drive/query/internal/d;->a(Lcom/google/android/gms/drive/query/internal/FilterHolder;Landroid/os/Parcel;I)V

    return-void
.end method
