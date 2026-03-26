.class public Lcom/motorola/ccc/ota/env/OobSetupCompletionObserver;
.super Ljava/lang/Object;
.source "OobSetupCompletionObserver.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/motorola/ccc/ota/env/OobSetupCompletionObserver$MessageHandler;,
        Lcom/motorola/ccc/ota/env/OobSetupCompletionObserver$SetupContentObserver;
    }
.end annotation


# static fields
.field private static final CHECK_SETUP_STATE:I = 0x1

.field static final HANDLER_TAG:Ljava/lang/String; = "OobSetupCompletionObserver"

.field private static final POST_SETUP_COMPLETED:I

.field private static mCtx:Landroid/content/Context;

.field private static mMe:Lcom/motorola/ccc/ota/env/OobSetupCompletionObserver;


# instance fields
.field private mContentObserver:Landroid/database/ContentObserver;

.field private mHandlerThread:Landroid/os/HandlerThread;

.field private mMessageHandler:Lcom/motorola/ccc/ota/env/OobSetupCompletionObserver$MessageHandler;


# direct methods
.method static bridge synthetic -$$Nest$fgetmContentObserver(Lcom/motorola/ccc/ota/env/OobSetupCompletionObserver;)Landroid/database/ContentObserver;
    .locals 0

    iget-object p0, p0, Lcom/motorola/ccc/ota/env/OobSetupCompletionObserver;->mContentObserver:Landroid/database/ContentObserver;

    return-object p0
.end method

.method static bridge synthetic -$$Nest$fgetmMessageHandler(Lcom/motorola/ccc/ota/env/OobSetupCompletionObserver;)Lcom/motorola/ccc/ota/env/OobSetupCompletionObserver$MessageHandler;
    .locals 0

    iget-object p0, p0, Lcom/motorola/ccc/ota/env/OobSetupCompletionObserver;->mMessageHandler:Lcom/motorola/ccc/ota/env/OobSetupCompletionObserver$MessageHandler;

    return-object p0
.end method

.method static bridge synthetic -$$Nest$mgetSetupCompletedStatus(Lcom/motorola/ccc/ota/env/OobSetupCompletionObserver;)I
    .locals 0

    invoke-direct {p0}, Lcom/motorola/ccc/ota/env/OobSetupCompletionObserver;->getSetupCompletedStatus()I

    move-result p0

    return p0
.end method

.method static bridge synthetic -$$Nest$sfgetmCtx()Landroid/content/Context;
    .locals 1

    sget-object v0, Lcom/motorola/ccc/ota/env/OobSetupCompletionObserver;->mCtx:Landroid/content/Context;

    return-object v0
.end method

.method static constructor <clinit>()V
    .locals 0

    return-void
.end method

.method private constructor <init>()V
    .locals 1

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, 0x0

    iput-object v0, p0, Lcom/motorola/ccc/ota/env/OobSetupCompletionObserver;->mContentObserver:Landroid/database/ContentObserver;

    iput-object v0, p0, Lcom/motorola/ccc/ota/env/OobSetupCompletionObserver;->mHandlerThread:Landroid/os/HandlerThread;

    iput-object v0, p0, Lcom/motorola/ccc/ota/env/OobSetupCompletionObserver;->mMessageHandler:Lcom/motorola/ccc/ota/env/OobSetupCompletionObserver$MessageHandler;

    return-void
.end method

.method public static declared-synchronized getInstance()Lcom/motorola/ccc/ota/env/OobSetupCompletionObserver;
    .locals 2

    const-class v0, Lcom/motorola/ccc/ota/env/OobSetupCompletionObserver;

    monitor-enter v0

    :try_start_0
    sget-object v1, Lcom/motorola/ccc/ota/env/OobSetupCompletionObserver;->mMe:Lcom/motorola/ccc/ota/env/OobSetupCompletionObserver;

    if-nez v1, :cond_0

    new-instance v1, Lcom/motorola/ccc/ota/env/OobSetupCompletionObserver;

    invoke-direct {v1}, Lcom/motorola/ccc/ota/env/OobSetupCompletionObserver;-><init>()V

    sput-object v1, Lcom/motorola/ccc/ota/env/OobSetupCompletionObserver;->mMe:Lcom/motorola/ccc/ota/env/OobSetupCompletionObserver;

    :cond_0
    sget-object v1, Lcom/motorola/ccc/ota/env/OobSetupCompletionObserver;->mMe:Lcom/motorola/ccc/ota/env/OobSetupCompletionObserver;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit v0

    return-object v1

    :catchall_0
    move-exception v1

    monitor-exit v0

    throw v1
.end method

.method private getSetupCompletedStatus()I
    .locals 2

    sget-object p0, Lcom/motorola/ccc/ota/env/OobSetupCompletionObserver;->mCtx:Landroid/content/Context;

    invoke-virtual {p0}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object p0

    invoke-static {}, Lcom/motorola/ccc/ota/env/CusFrameworkDeps;->getUserSetupCompleteAsString()Ljava/lang/String;

    move-result-object v0

    const/4 v1, 0x0

    invoke-static {p0, v0, v1}, Landroid/provider/Settings$Secure;->getInt(Landroid/content/ContentResolver;Ljava/lang/String;I)I

    move-result p0

    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "OobSetupCompletionObserver: Setup completion status: "

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    const-string v1, "OtaApp"

    invoke-static {v1, v0}, Lcom/motorola/ccc/ota/utils/Logger;->debug(Ljava/lang/String;Ljava/lang/String;)V

    return p0
.end method


# virtual methods
.method public checkSetupCompleted()V
    .locals 4

    const-string v0, "OtaApp"

    invoke-direct {p0}, Lcom/motorola/ccc/ota/env/OobSetupCompletionObserver;->getSetupCompletedStatus()I

    move-result v1

    const/4 v2, 0x1

    if-ne v1, v2, :cond_0

    iget-object p0, p0, Lcom/motorola/ccc/ota/env/OobSetupCompletionObserver;->mMessageHandler:Lcom/motorola/ccc/ota/env/OobSetupCompletionObserver$MessageHandler;

    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Lcom/motorola/ccc/ota/env/OobSetupCompletionObserver$MessageHandler;->sendEmptyMessage(I)Z

    goto :goto_0

    :cond_0
    new-instance v1, Lcom/motorola/ccc/ota/env/OobSetupCompletionObserver$SetupContentObserver;

    iget-object v3, p0, Lcom/motorola/ccc/ota/env/OobSetupCompletionObserver;->mMessageHandler:Lcom/motorola/ccc/ota/env/OobSetupCompletionObserver$MessageHandler;

    invoke-direct {v1, p0, v3}, Lcom/motorola/ccc/ota/env/OobSetupCompletionObserver$SetupContentObserver;-><init>(Lcom/motorola/ccc/ota/env/OobSetupCompletionObserver;Landroid/os/Handler;)V

    iput-object v1, p0, Lcom/motorola/ccc/ota/env/OobSetupCompletionObserver;->mContentObserver:Landroid/database/ContentObserver;

    :try_start_0
    sget-object v1, Lcom/motorola/ccc/ota/env/OobSetupCompletionObserver;->mCtx:Landroid/content/Context;

    invoke-virtual {v1}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v1

    invoke-static {}, Lcom/motorola/ccc/ota/env/CusFrameworkDeps;->getUserSetupCompleteAsString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v3}, Landroid/provider/Settings$Secure;->getUriFor(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v3

    iget-object p0, p0, Lcom/motorola/ccc/ota/env/OobSetupCompletionObserver;->mContentObserver:Landroid/database/ContentObserver;

    invoke-virtual {v1, v3, v2, p0}, Landroid/content/ContentResolver;->registerContentObserver(Landroid/net/Uri;ZLandroid/database/ContentObserver;)V
    :try_end_0
    .catch Ljava/lang/NullPointerException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/lang/IllegalArgumentException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception p0

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "OobSetupCompletionObserver: register failed due to invalid Uri: "

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-static {v0, p0}, Lcom/motorola/ccc/ota/utils/Logger;->error(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_0

    :catch_1
    move-exception p0

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "OobSetupCompletionObserver: register failed due to Null Uri: "

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-static {v0, p0}, Lcom/motorola/ccc/ota/utils/Logger;->error(Ljava/lang/String;Ljava/lang/String;)V

    :goto_0
    return-void
.end method

.method public init(Landroid/content/Context;)V
    .locals 1

    sput-object p1, Lcom/motorola/ccc/ota/env/OobSetupCompletionObserver;->mCtx:Landroid/content/Context;

    new-instance p1, Landroid/os/HandlerThread;

    sget-object v0, Lcom/motorola/ccc/ota/env/OobSetupCompletionObserver;->HANDLER_TAG:Ljava/lang/String;

    invoke-direct {p1, v0}, Landroid/os/HandlerThread;-><init>(Ljava/lang/String;)V

    iput-object p1, p0, Lcom/motorola/ccc/ota/env/OobSetupCompletionObserver;->mHandlerThread:Landroid/os/HandlerThread;

    invoke-virtual {p1}, Landroid/os/HandlerThread;->start()V

    new-instance p1, Lcom/motorola/ccc/ota/env/OobSetupCompletionObserver$MessageHandler;

    iget-object v0, p0, Lcom/motorola/ccc/ota/env/OobSetupCompletionObserver;->mHandlerThread:Landroid/os/HandlerThread;

    invoke-virtual {v0}, Landroid/os/HandlerThread;->getLooper()Landroid/os/Looper;

    move-result-object v0

    invoke-direct {p1, p0, v0}, Lcom/motorola/ccc/ota/env/OobSetupCompletionObserver$MessageHandler;-><init>(Lcom/motorola/ccc/ota/env/OobSetupCompletionObserver;Landroid/os/Looper;)V

    iput-object p1, p0, Lcom/motorola/ccc/ota/env/OobSetupCompletionObserver;->mMessageHandler:Lcom/motorola/ccc/ota/env/OobSetupCompletionObserver$MessageHandler;

    return-void
.end method

.method public shutdown()V
    .locals 3

    :try_start_0
    sget-object v0, Lcom/motorola/ccc/ota/env/OobSetupCompletionObserver;->mCtx:Landroid/content/Context;

    invoke-virtual {v0}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v0

    iget-object v1, p0, Lcom/motorola/ccc/ota/env/OobSetupCompletionObserver;->mContentObserver:Landroid/database/ContentObserver;

    invoke-virtual {v0, v1}, Landroid/content/ContentResolver;->unregisterContentObserver(Landroid/database/ContentObserver;)V
    :try_end_0
    .catch Ljava/lang/NullPointerException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception v0

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "OobSetupCompletionObserver: unregister failed."

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    const-string v1, "OtaApp"

    invoke-static {v1, v0}, Lcom/motorola/ccc/ota/utils/Logger;->error(Ljava/lang/String;Ljava/lang/String;)V

    :goto_0
    iget-object p0, p0, Lcom/motorola/ccc/ota/env/OobSetupCompletionObserver;->mHandlerThread:Landroid/os/HandlerThread;

    invoke-virtual {p0}, Landroid/os/HandlerThread;->quitSafely()Z

    return-void
.end method
