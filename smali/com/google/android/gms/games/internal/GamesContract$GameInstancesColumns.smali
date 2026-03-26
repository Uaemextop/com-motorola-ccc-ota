.class public interface abstract Lcom/google/android/gms/games/internal/GamesContract$GameInstancesColumns;
.super Ljava/lang/Object;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/google/android/gms/games/internal/GamesContract;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x609
    name = "GameInstancesColumns"
.end annotation


# static fields
.field public static final XV:[Ljava/lang/String;

.field public static final XW:[Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .locals 12

    const/16 v0, 0x9

    new-array v0, v0, [Ljava/lang/String;

    const-string v1, "instance_game_id"

    const/4 v2, 0x0

    aput-object v1, v0, v2

    const/4 v1, 0x1

    const-string v3, "real_time_support"

    aput-object v3, v0, v1

    const/4 v4, 0x2

    const-string v5, "turn_based_support"

    aput-object v5, v0, v4

    const-string v6, "platform_type"

    const/4 v7, 0x3

    aput-object v6, v0, v7

    const-string v6, "instance_display_name"

    const/4 v8, 0x4

    aput-object v6, v0, v8

    const/4 v6, 0x5

    const-string v9, "package_name"

    aput-object v9, v0, v6

    const/4 v6, 0x6

    const-string v10, "piracy_check"

    aput-object v10, v0, v6

    const/4 v6, 0x7

    const-string v10, "installed"

    aput-object v10, v0, v6

    const/16 v6, 0x8

    const-string v11, "preferred"

    aput-object v11, v0, v6

    sput-object v0, Lcom/google/android/gms/games/internal/GamesContract$GameInstancesColumns;->XV:[Ljava/lang/String;

    new-array v0, v8, [Ljava/lang/String;

    aput-object v10, v0, v2

    aput-object v9, v0, v1

    aput-object v3, v0, v4

    aput-object v5, v0, v7

    sput-object v0, Lcom/google/android/gms/games/internal/GamesContract$GameInstancesColumns;->XW:[Ljava/lang/String;

    return-void
.end method
