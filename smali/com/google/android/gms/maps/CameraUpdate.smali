.class public final Lcom/google/android/gms/maps/CameraUpdate;
.super Ljava/lang/Object;


# instance fields
.field private final ail:Lcom/google/android/gms/dynamic/d;


# direct methods
.method constructor <init>(Lcom/google/android/gms/dynamic/d;)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    invoke-static {p1}, Lcom/google/android/gms/common/internal/o;->i(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lcom/google/android/gms/dynamic/d;

    iput-object p1, p0, Lcom/google/android/gms/maps/CameraUpdate;->ail:Lcom/google/android/gms/dynamic/d;

    return-void
.end method


# virtual methods
.method mo()Lcom/google/android/gms/dynamic/d;
    .locals 0

    iget-object p0, p0, Lcom/google/android/gms/maps/CameraUpdate;->ail:Lcom/google/android/gms/dynamic/d;

    return-object p0
.end method
