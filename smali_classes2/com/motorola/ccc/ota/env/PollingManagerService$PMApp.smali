.class final Lcom/motorola/ccc/ota/env/PollingManagerService$PMApp;
.super Ljava/lang/Object;
.source "PollingManagerService.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/motorola/ccc/ota/env/PollingManagerService;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1a
    name = "PMApp"
.end annotation


# instance fields
.field private mAllowOnRoaming:Z

.field private mAllowOnlyOnNetwork:Z

.field private final mAppSecret:Ljava/lang/String;

.field private final mCbAction:Ljava/lang/String;

.field private final mCbCategories:[Ljava/lang/String;

.field private mNextPollTime:J


# direct methods
.method static bridge synthetic -$$Nest$fgetmAllowOnRoaming(Lcom/motorola/ccc/ota/env/PollingManagerService$PMApp;)Z
    .locals 0

    iget-boolean p0, p0, Lcom/motorola/ccc/ota/env/PollingManagerService$PMApp;->mAllowOnRoaming:Z

    return p0
.end method

.method static bridge synthetic -$$Nest$fgetmAllowOnlyOnNetwork(Lcom/motorola/ccc/ota/env/PollingManagerService$PMApp;)Z
    .locals 0

    iget-boolean p0, p0, Lcom/motorola/ccc/ota/env/PollingManagerService$PMApp;->mAllowOnlyOnNetwork:Z

    return p0
.end method

.method constructor <init>(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;JZZ)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/motorola/ccc/ota/env/PollingManagerService$PMApp;->mAppSecret:Ljava/lang/String;

    iput-object p2, p0, Lcom/motorola/ccc/ota/env/PollingManagerService$PMApp;->mCbAction:Ljava/lang/String;

    iput-object p3, p0, Lcom/motorola/ccc/ota/env/PollingManagerService$PMApp;->mCbCategories:[Ljava/lang/String;

    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    move-result-wide p1

    add-long/2addr p1, p4

    iput-wide p1, p0, Lcom/motorola/ccc/ota/env/PollingManagerService$PMApp;->mNextPollTime:J

    iput-boolean p7, p0, Lcom/motorola/ccc/ota/env/PollingManagerService$PMApp;->mAllowOnRoaming:Z

    iput-boolean p6, p0, Lcom/motorola/ccc/ota/env/PollingManagerService$PMApp;->mAllowOnlyOnNetwork:Z

    return-void
.end method


# virtual methods
.method final getAction()Ljava/lang/String;
    .locals 0

    iget-object p0, p0, Lcom/motorola/ccc/ota/env/PollingManagerService$PMApp;->mCbAction:Ljava/lang/String;

    return-object p0
.end method

.method final getAppSecret()Ljava/lang/String;
    .locals 0

    iget-object p0, p0, Lcom/motorola/ccc/ota/env/PollingManagerService$PMApp;->mAppSecret:Ljava/lang/String;

    return-object p0
.end method

.method final getCategories()[Ljava/lang/String;
    .locals 0

    iget-object p0, p0, Lcom/motorola/ccc/ota/env/PollingManagerService$PMApp;->mCbCategories:[Ljava/lang/String;

    return-object p0
.end method

.method final getNextPollTime()J
    .locals 2

    iget-wide v0, p0, Lcom/motorola/ccc/ota/env/PollingManagerService$PMApp;->mNextPollTime:J

    return-wide v0
.end method
