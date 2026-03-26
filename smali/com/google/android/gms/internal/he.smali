.class public Lcom/google/android/gms/internal/he;
.super Ljava/lang/Object;

# interfaces
.implements Lcom/google/android/gms/common/internal/safeparcel/SafeParcelable;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/google/android/gms/internal/he$a;
    }
.end annotation


# static fields
.field public static final CREATOR:Lcom/google/android/gms/internal/hf;


# instance fields
.field final BR:I

.field final BS:[Lcom/google/android/gms/internal/hi;

.field public final BT:Ljava/lang/String;

.field public final BU:Z

.field public final account:Landroid/accounts/Account;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    new-instance v0, Lcom/google/android/gms/internal/hf;

    invoke-direct {v0}, Lcom/google/android/gms/internal/hf;-><init>()V

    sput-object v0, Lcom/google/android/gms/internal/he;->CREATOR:Lcom/google/android/gms/internal/hf;

    return-void
.end method

.method constructor <init>(I[Lcom/google/android/gms/internal/hi;Ljava/lang/String;ZLandroid/accounts/Account;)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput p1, p0, Lcom/google/android/gms/internal/he;->BR:I

    iput-object p2, p0, Lcom/google/android/gms/internal/he;->BS:[Lcom/google/android/gms/internal/hi;

    iput-object p3, p0, Lcom/google/android/gms/internal/he;->BT:Ljava/lang/String;

    iput-boolean p4, p0, Lcom/google/android/gms/internal/he;->BU:Z

    iput-object p5, p0, Lcom/google/android/gms/internal/he;->account:Landroid/accounts/Account;

    return-void
.end method

.method varargs constructor <init>(Ljava/lang/String;ZLandroid/accounts/Account;[Lcom/google/android/gms/internal/hi;)V
    .locals 6

    const/4 v1, 0x1

    move-object v0, p0

    move-object v2, p4

    move-object v3, p1

    move v4, p2

    move-object v5, p3

    invoke-direct/range {v0 .. v5}, Lcom/google/android/gms/internal/he;-><init>(I[Lcom/google/android/gms/internal/hi;Ljava/lang/String;ZLandroid/accounts/Account;)V

    new-instance p0, Ljava/util/BitSet;

    invoke-static {}, Lcom/google/android/gms/internal/hp;->fl()I

    move-result p1

    invoke-direct {p0, p1}, Ljava/util/BitSet;-><init>(I)V

    const/4 p1, 0x0

    :goto_0
    array-length p2, p4

    if-ge p1, p2, :cond_2

    aget-object p2, p4, p1

    iget p2, p2, Lcom/google/android/gms/internal/hi;->Cg:I

    const/4 p3, -0x1

    if-eq p2, p3, :cond_1

    invoke-virtual {p0, p2}, Ljava/util/BitSet;->get(I)Z

    move-result p3

    if-nez p3, :cond_0

    invoke-virtual {p0, p2}, Ljava/util/BitSet;->set(I)V

    goto :goto_1

    :cond_0
    new-instance p0, Ljava/lang/IllegalArgumentException;

    new-instance p1, Ljava/lang/StringBuilder;

    const-string p3, "Duplicate global search section type "

    invoke-direct {p1, p3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-static {p2}, Lcom/google/android/gms/internal/hp;->O(I)Ljava/lang/String;

    move-result-object p2

    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-direct {p0, p1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p0

    :cond_1
    :goto_1
    add-int/lit8 p1, p1, 0x1

    goto :goto_0

    :cond_2
    return-void
.end method


# virtual methods
.method public describeContents()I
    .locals 0

    const/4 p0, 0x0

    return p0
.end method

.method public writeToParcel(Landroid/os/Parcel;I)V
    .locals 0

    invoke-static {p0, p1, p2}, Lcom/google/android/gms/internal/hf;->a(Lcom/google/android/gms/internal/he;Landroid/os/Parcel;I)V

    return-void
.end method
