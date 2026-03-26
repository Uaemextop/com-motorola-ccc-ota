.class Lcom/motorola/ccc/ota/env/OtaApplication$ExceptionCatchingThreadFactory$1;
.super Ljava/lang/Object;
.source "OtaApplication.java"

# interfaces
.implements Ljava/lang/Thread$UncaughtExceptionHandler;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/motorola/ccc/ota/env/OtaApplication$ExceptionCatchingThreadFactory;->newThread(Ljava/lang/Runnable;)Ljava/lang/Thread;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/motorola/ccc/ota/env/OtaApplication$ExceptionCatchingThreadFactory;


# direct methods
.method constructor <init>(Lcom/motorola/ccc/ota/env/OtaApplication$ExceptionCatchingThreadFactory;)V
    .locals 0

    iput-object p1, p0, Lcom/motorola/ccc/ota/env/OtaApplication$ExceptionCatchingThreadFactory$1;->this$0:Lcom/motorola/ccc/ota/env/OtaApplication$ExceptionCatchingThreadFactory;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public uncaughtException(Ljava/lang/Thread;Ljava/lang/Throwable;)V
    .locals 0

    new-instance p0, Ljava/lang/StringBuilder;

    const-string p1, "uncaughtException in ExceptionCatchingThreadFactory: "

    invoke-direct {p0, p1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    const-string p1, "OtaApp"

    invoke-static {p1, p0}, Lcom/motorola/ccc/ota/utils/Logger;->error(Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method
