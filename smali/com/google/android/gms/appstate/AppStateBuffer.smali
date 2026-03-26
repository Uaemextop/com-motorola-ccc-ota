.class public final Lcom/google/android/gms/appstate/AppStateBuffer;
.super Lcom/google/android/gms/common/data/DataBuffer;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/google/android/gms/common/data/DataBuffer<",
        "Lcom/google/android/gms/appstate/AppState;",
        ">;"
    }
.end annotation


# direct methods
.method public constructor <init>(Lcom/google/android/gms/common/data/DataHolder;)V
    .locals 0

    invoke-direct {p0, p1}, Lcom/google/android/gms/common/data/DataBuffer;-><init>(Lcom/google/android/gms/common/data/DataHolder;)V

    return-void
.end method


# virtual methods
.method public get(I)Lcom/google/android/gms/appstate/AppState;
    .locals 1

    new-instance v0, Lcom/google/android/gms/appstate/b;

    iget-object p0, p0, Lcom/google/android/gms/appstate/AppStateBuffer;->II:Lcom/google/android/gms/common/data/DataHolder;

    invoke-direct {v0, p0, p1}, Lcom/google/android/gms/appstate/b;-><init>(Lcom/google/android/gms/common/data/DataHolder;I)V

    return-object v0
.end method

.method public bridge synthetic get(I)Ljava/lang/Object;
    .locals 0

    invoke-virtual {p0, p1}, Lcom/google/android/gms/appstate/AppStateBuffer;->get(I)Lcom/google/android/gms/appstate/AppState;

    move-result-object p0

    return-object p0
.end method
