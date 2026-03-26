.class Lcom/google/android/gms/drive/internal/y$a;
.super Landroid/os/Handler;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/google/android/gms/drive/internal/y;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "a"
.end annotation


# instance fields
.field private final mContext:Landroid/content/Context;


# direct methods
.method private constructor <init>(Landroid/os/Looper;Landroid/content/Context;)V
    .locals 0

    invoke-direct {p0, p1}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    iput-object p2, p0, Lcom/google/android/gms/drive/internal/y$a;->mContext:Landroid/content/Context;

    return-void
.end method

.method synthetic constructor <init>(Landroid/os/Looper;Landroid/content/Context;Lcom/google/android/gms/drive/internal/y$1;)V
    .locals 0

    invoke-direct {p0, p1, p2}, Lcom/google/android/gms/drive/internal/y$a;-><init>(Landroid/os/Looper;Landroid/content/Context;)V

    return-void
.end method


# virtual methods
.method public a(Lcom/google/android/gms/drive/events/c;Lcom/google/android/gms/drive/events/DriveEvent;)V
    .locals 1

    new-instance v0, Landroid/util/Pair;

    invoke-direct {v0, p1, p2}, Landroid/util/Pair;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    const/4 p1, 0x1

    invoke-virtual {p0, p1, v0}, Lcom/google/android/gms/drive/internal/y$a;->obtainMessage(ILjava/lang/Object;)Landroid/os/Message;

    move-result-object p1

    invoke-virtual {p0, p1}, Lcom/google/android/gms/drive/internal/y$a;->sendMessage(Landroid/os/Message;)Z

    return-void
.end method

.method public handleMessage(Landroid/os/Message;)V
    .locals 3

    iget v0, p1, Landroid/os/Message;->what:I

    const-string v1, "EventCallback"

    const/4 v2, 0x1

    if-eq v0, v2, :cond_0

    iget-object p0, p0, Lcom/google/android/gms/drive/internal/y$a;->mContext:Landroid/content/Context;

    const-string p1, "Don\'t know how to handle this event"

    invoke-static {p0, v1, p1}, Lcom/google/android/gms/drive/internal/v;->e(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)V

    return-void

    :cond_0
    iget-object p0, p1, Landroid/os/Message;->obj:Ljava/lang/Object;

    check-cast p0, Landroid/util/Pair;

    iget-object p1, p0, Landroid/util/Pair;->first:Ljava/lang/Object;

    check-cast p1, Lcom/google/android/gms/drive/events/c;

    iget-object p0, p0, Landroid/util/Pair;->second:Ljava/lang/Object;

    check-cast p0, Lcom/google/android/gms/drive/events/DriveEvent;

    invoke-interface {p0}, Lcom/google/android/gms/drive/events/DriveEvent;->getType()I

    move-result v0

    if-eq v0, v2, :cond_2

    const/4 v2, 0x2

    if-eq v0, v2, :cond_1

    new-instance p1, Ljava/lang/StringBuilder;

    const-string v0, "Unexpected event: "

    invoke-direct {p1, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-static {v1, p0}, Lcom/google/android/gms/drive/internal/v;->p(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_0

    :cond_1
    check-cast p1, Lcom/google/android/gms/drive/events/CompletionListener;

    check-cast p0, Lcom/google/android/gms/drive/events/CompletionEvent;

    invoke-interface {p1, p0}, Lcom/google/android/gms/drive/events/CompletionListener;->onCompletion(Lcom/google/android/gms/drive/events/CompletionEvent;)V

    goto :goto_0

    :cond_2
    instance-of v0, p1, Lcom/google/android/gms/drive/events/DriveEvent$Listener;

    if-eqz v0, :cond_3

    check-cast p1, Lcom/google/android/gms/drive/events/DriveEvent$Listener;

    check-cast p0, Lcom/google/android/gms/drive/events/ChangeEvent;

    invoke-interface {p1, p0}, Lcom/google/android/gms/drive/events/DriveEvent$Listener;->onEvent(Lcom/google/android/gms/drive/events/DriveEvent;)V

    goto :goto_0

    :cond_3
    check-cast p1, Lcom/google/android/gms/drive/events/ChangeListener;

    check-cast p0, Lcom/google/android/gms/drive/events/ChangeEvent;

    invoke-interface {p1, p0}, Lcom/google/android/gms/drive/events/ChangeListener;->onChange(Lcom/google/android/gms/drive/events/ChangeEvent;)V

    :goto_0
    return-void
.end method
