.class final enum Lcom/google/android/gms/tagmanager/az$a;
.super Ljava/lang/Enum;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/google/android/gms/tagmanager/az;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x401a
    name = "a"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum<",
        "Lcom/google/android/gms/tagmanager/az$a;",
        ">;"
    }
.end annotation


# static fields
.field public static final enum apE:Lcom/google/android/gms/tagmanager/az$a;

.field public static final enum apF:Lcom/google/android/gms/tagmanager/az$a;

.field public static final enum apG:Lcom/google/android/gms/tagmanager/az$a;

.field private static final synthetic apH:[Lcom/google/android/gms/tagmanager/az$a;


# direct methods
.method static constructor <clinit>()V
    .locals 5

    new-instance v0, Lcom/google/android/gms/tagmanager/az$a;

    const-string v1, "NONE"

    const/4 v2, 0x0

    invoke-direct {v0, v1, v2}, Lcom/google/android/gms/tagmanager/az$a;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/google/android/gms/tagmanager/az$a;->apE:Lcom/google/android/gms/tagmanager/az$a;

    new-instance v1, Lcom/google/android/gms/tagmanager/az$a;

    const-string v2, "URL"

    const/4 v3, 0x1

    invoke-direct {v1, v2, v3}, Lcom/google/android/gms/tagmanager/az$a;-><init>(Ljava/lang/String;I)V

    sput-object v1, Lcom/google/android/gms/tagmanager/az$a;->apF:Lcom/google/android/gms/tagmanager/az$a;

    new-instance v2, Lcom/google/android/gms/tagmanager/az$a;

    const-string v3, "BACKSLASH"

    const/4 v4, 0x2

    invoke-direct {v2, v3, v4}, Lcom/google/android/gms/tagmanager/az$a;-><init>(Ljava/lang/String;I)V

    sput-object v2, Lcom/google/android/gms/tagmanager/az$a;->apG:Lcom/google/android/gms/tagmanager/az$a;

    filled-new-array {v0, v1, v2}, [Lcom/google/android/gms/tagmanager/az$a;

    move-result-object v0

    sput-object v0, Lcom/google/android/gms/tagmanager/az$a;->apH:[Lcom/google/android/gms/tagmanager/az$a;

    return-void
.end method

.method private constructor <init>(Ljava/lang/String;I)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/google/android/gms/tagmanager/az$a;
    .locals 1

    const-class v0, Lcom/google/android/gms/tagmanager/az$a;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object p0

    check-cast p0, Lcom/google/android/gms/tagmanager/az$a;

    return-object p0
.end method

.method public static values()[Lcom/google/android/gms/tagmanager/az$a;
    .locals 1

    sget-object v0, Lcom/google/android/gms/tagmanager/az$a;->apH:[Lcom/google/android/gms/tagmanager/az$a;

    invoke-virtual {v0}, [Lcom/google/android/gms/tagmanager/az$a;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lcom/google/android/gms/tagmanager/az$a;

    return-object v0
.end method
