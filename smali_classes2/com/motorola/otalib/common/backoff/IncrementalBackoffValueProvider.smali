.class public Lcom/motorola/otalib/common/backoff/IncrementalBackoffValueProvider;
.super Ljava/lang/Object;
.source "IncrementalBackoffValueProvider.java"

# interfaces
.implements Lcom/motorola/otalib/common/backoff/BackoffValueProvider;


# static fields
.field private static final backOffTimeUnit:Ljava/util/concurrent/TimeUnit;


# instance fields
.field private iterator:Ljava/util/Iterator;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Iterator<",
            "Ljava/lang/Long;",
            ">;"
        }
    .end annotation
.end field

.field private final timeoutValues:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ljava/lang/Long;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 1

    sget-object v0, Ljava/util/concurrent/TimeUnit;->MILLISECONDS:Ljava/util/concurrent/TimeUnit;

    sput-object v0, Lcom/motorola/otalib/common/backoff/IncrementalBackoffValueProvider;->backOffTimeUnit:Ljava/util/concurrent/TimeUnit;

    return-void
.end method

.method public constructor <init>(Ljava/lang/String;)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    invoke-direct {p0, p1}, Lcom/motorola/otalib/common/backoff/IncrementalBackoffValueProvider;->parseTimeoutValues(Ljava/lang/String;)Ljava/util/List;

    move-result-object p1

    iput-object p1, p0, Lcom/motorola/otalib/common/backoff/IncrementalBackoffValueProvider;->timeoutValues:Ljava/util/List;

    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object p1

    iput-object p1, p0, Lcom/motorola/otalib/common/backoff/IncrementalBackoffValueProvider;->iterator:Ljava/util/Iterator;

    return-void
.end method

.method private parseTimeoutValues(Ljava/lang/String;)Ljava/util/List;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            ")",
            "Ljava/util/List<",
            "Ljava/lang/Long;",
            ">;"
        }
    .end annotation

    new-instance p0, Ljava/util/LinkedList;

    invoke-direct {p0}, Ljava/util/LinkedList;-><init>()V

    const-string v0, ","

    invoke-virtual {p1, v0}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object p1

    array-length v0, p1

    const/4 v1, 0x0

    :goto_0
    if-ge v1, v0, :cond_0

    aget-object v2, p1, v1

    :try_start_0
    invoke-static {v2}, Ljava/lang/Long;->valueOf(Ljava/lang/String;)Ljava/lang/Long;

    move-result-object v2

    invoke-interface {p0, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z
    :try_end_0
    .catch Ljava/lang/NumberFormatException; {:try_start_0 .. :try_end_0} :catch_0

    :catch_0
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    :cond_0
    return-object p0
.end method


# virtual methods
.method public getNextTimeoutValue()J
    .locals 2

    iget-object v0, p0, Lcom/motorola/otalib/common/backoff/IncrementalBackoffValueProvider;->iterator:Ljava/util/Iterator;

    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-nez v0, :cond_0

    iget-object v0, p0, Lcom/motorola/otalib/common/backoff/IncrementalBackoffValueProvider;->timeoutValues:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    iput-object v0, p0, Lcom/motorola/otalib/common/backoff/IncrementalBackoffValueProvider;->iterator:Ljava/util/Iterator;

    :cond_0
    iget-object p0, p0, Lcom/motorola/otalib/common/backoff/IncrementalBackoffValueProvider;->iterator:Ljava/util/Iterator;

    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Ljava/lang/Long;

    invoke-virtual {p0}, Ljava/lang/Long;->longValue()J

    move-result-wide v0

    return-wide v0
.end method

.method public getTimeOutValue(I)J
    .locals 1

    if-ltz p1, :cond_1

    iget-object v0, p0, Lcom/motorola/otalib/common/backoff/IncrementalBackoffValueProvider;->timeoutValues:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v0

    if-lt p1, v0, :cond_0

    goto :goto_0

    :cond_0
    iget-object p0, p0, Lcom/motorola/otalib/common/backoff/IncrementalBackoffValueProvider;->timeoutValues:Ljava/util/List;

    invoke-interface {p0, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Ljava/lang/Long;

    invoke-virtual {p0}, Ljava/lang/Long;->longValue()J

    move-result-wide p0

    return-wide p0

    :cond_1
    :goto_0
    const-wide/16 p0, -0x1

    return-wide p0
.end method

.method public getTimeUnit()Ljava/util/concurrent/TimeUnit;
    .locals 0

    sget-object p0, Lcom/motorola/otalib/common/backoff/IncrementalBackoffValueProvider;->backOffTimeUnit:Ljava/util/concurrent/TimeUnit;

    return-object p0
.end method

.method public reset()V
    .locals 1

    iget-object v0, p0, Lcom/motorola/otalib/common/backoff/IncrementalBackoffValueProvider;->timeoutValues:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    iput-object v0, p0, Lcom/motorola/otalib/common/backoff/IncrementalBackoffValueProvider;->iterator:Ljava/util/Iterator;

    return-void
.end method
