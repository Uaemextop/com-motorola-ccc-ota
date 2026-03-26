.class Lcom/motorola/ccc/ota/env/OtaApplication$ExceptionCatchingThreadFactory;
.super Ljava/lang/Object;
.source "OtaApplication.java"

# interfaces
.implements Ljava/util/concurrent/ThreadFactory;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/motorola/ccc/ota/env/OtaApplication;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "ExceptionCatchingThreadFactory"
.end annotation


# instance fields
.field private final delegate:Ljava/util/concurrent/ThreadFactory;


# direct methods
.method private constructor <init>(Ljava/util/concurrent/ThreadFactory;)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/motorola/ccc/ota/env/OtaApplication$ExceptionCatchingThreadFactory;->delegate:Ljava/util/concurrent/ThreadFactory;

    return-void
.end method

.method synthetic constructor <init>(Ljava/util/concurrent/ThreadFactory;Lcom/motorola/ccc/ota/env/OtaApplication$ExceptionCatchingThreadFactory-IA;)V
    .locals 0

    invoke-direct {p0, p1}, Lcom/motorola/ccc/ota/env/OtaApplication$ExceptionCatchingThreadFactory;-><init>(Ljava/util/concurrent/ThreadFactory;)V

    return-void
.end method


# virtual methods
.method public newThread(Ljava/lang/Runnable;)Ljava/lang/Thread;
    .locals 1

    iget-object v0, p0, Lcom/motorola/ccc/ota/env/OtaApplication$ExceptionCatchingThreadFactory;->delegate:Ljava/util/concurrent/ThreadFactory;

    invoke-interface {v0, p1}, Ljava/util/concurrent/ThreadFactory;->newThread(Ljava/lang/Runnable;)Ljava/lang/Thread;

    move-result-object p1

    new-instance v0, Lcom/motorola/ccc/ota/env/OtaApplication$ExceptionCatchingThreadFactory$1;

    invoke-direct {v0, p0}, Lcom/motorola/ccc/ota/env/OtaApplication$ExceptionCatchingThreadFactory$1;-><init>(Lcom/motorola/ccc/ota/env/OtaApplication$ExceptionCatchingThreadFactory;)V

    invoke-virtual {p1, v0}, Ljava/lang/Thread;->setUncaughtExceptionHandler(Ljava/lang/Thread$UncaughtExceptionHandler;)V

    return-object p1
.end method
