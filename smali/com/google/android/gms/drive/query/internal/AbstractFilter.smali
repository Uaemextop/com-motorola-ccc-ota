.class public abstract Lcom/google/android/gms/drive/query/internal/AbstractFilter;
.super Ljava/lang/Object;

# interfaces
.implements Lcom/google/android/gms/drive/query/Filter;


# direct methods
.method public constructor <init>()V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public toString()Ljava/lang/String;
    .locals 1

    new-instance v0, Lcom/google/android/gms/drive/query/c;

    invoke-direct {v0}, Lcom/google/android/gms/drive/query/c;-><init>()V

    invoke-virtual {p0, v0}, Lcom/google/android/gms/drive/query/internal/AbstractFilter;->a(Lcom/google/android/gms/drive/query/internal/f;)Ljava/lang/Object;

    move-result-object p0

    filled-new-array {p0}, [Ljava/lang/Object;

    move-result-object p0

    const-string v0, "Filter[%s]"

    invoke-static {v0, p0}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method
