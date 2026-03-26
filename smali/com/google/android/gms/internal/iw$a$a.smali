.class final Lcom/google/android/gms/internal/iw$a$a;
.super Landroid/graphics/drawable/Drawable$ConstantState;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/google/android/gms/internal/iw$a;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1a
    name = "a"
.end annotation


# direct methods
.method private constructor <init>()V
    .locals 0

    invoke-direct {p0}, Landroid/graphics/drawable/Drawable$ConstantState;-><init>()V

    return-void
.end method

.method synthetic constructor <init>(Lcom/google/android/gms/internal/iw$1;)V
    .locals 0

    invoke-direct {p0}, Lcom/google/android/gms/internal/iw$a$a;-><init>()V

    return-void
.end method


# virtual methods
.method public getChangingConfigurations()I
    .locals 0

    const/4 p0, 0x0

    return p0
.end method

.method public newDrawable()Landroid/graphics/drawable/Drawable;
    .locals 0

    invoke-static {}, Lcom/google/android/gms/internal/iw$a;->gL()Lcom/google/android/gms/internal/iw$a;

    move-result-object p0

    return-object p0
.end method
