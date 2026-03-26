.class final Lcom/motorola/ccc/ota/env/OobSetupCompletionObserver$SetupContentObserver;
.super Landroid/database/ContentObserver;
.source "OobSetupCompletionObserver.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/motorola/ccc/ota/env/OobSetupCompletionObserver;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x12
    name = "SetupContentObserver"
.end annotation


# instance fields
.field mHandler:Landroid/os/Handler;

.field final synthetic this$0:Lcom/motorola/ccc/ota/env/OobSetupCompletionObserver;


# direct methods
.method public constructor <init>(Lcom/motorola/ccc/ota/env/OobSetupCompletionObserver;Landroid/os/Handler;)V
    .locals 0

    iput-object p1, p0, Lcom/motorola/ccc/ota/env/OobSetupCompletionObserver$SetupContentObserver;->this$0:Lcom/motorola/ccc/ota/env/OobSetupCompletionObserver;

    invoke-direct {p0, p2}, Landroid/database/ContentObserver;-><init>(Landroid/os/Handler;)V

    iput-object p2, p0, Lcom/motorola/ccc/ota/env/OobSetupCompletionObserver$SetupContentObserver;->mHandler:Landroid/os/Handler;

    return-void
.end method


# virtual methods
.method public onChange(Z)V
    .locals 0

    iget-object p0, p0, Lcom/motorola/ccc/ota/env/OobSetupCompletionObserver$SetupContentObserver;->mHandler:Landroid/os/Handler;

    const/4 p1, 0x1

    invoke-virtual {p0, p1}, Landroid/os/Handler;->sendEmptyMessage(I)Z

    return-void
.end method
